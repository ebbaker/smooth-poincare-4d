"""Finite interval replay of the marked arcs in one spherical prism cell."""

from fractions import Fraction
from functools import reduce
from itertools import permutations, product
from math import cos, factorial, isqrt, pi, sin, sqrt


SCALE = 10**45


class Interval:
    """Outward rounded endpoints, both scaled by SCALE."""

    def __init__(self, lo, hi=None):
        self.lo = lo
        self.hi = lo if hi is None else hi

    @classmethod
    def bounds(cls, lo, hi):
        return cls(lo * SCALE // 1, -(-hi * SCALE // 1))

    def __add__(self, other):
        if isinstance(other, int):
            other = Interval(SCALE * other)
        return Interval(self.lo + other.lo, self.hi + other.hi)

    __radd__ = __add__

    def __neg__(self):
        return Interval(-self.hi, -self.lo)

    def __sub__(self, other):
        return self + -other

    def __mul__(self, other):
        if isinstance(other, int):
            other = Interval(SCALE * other)
        corners = tuple(a * b for a in (self.lo, self.hi) for b in (other.lo, other.hi))
        return Interval(min(corners) // SCALE, -(-max(corners) // SCALE))

    __rmul__ = __mul__

    def __truediv__(self, other):
        if isinstance(other, int):
            other = Interval(SCALE * other)
        assert other.lo > 0 or other.hi < 0
        inverse = Interval(SCALE**2 // other.hi, -(-SCALE**2 // other.lo))
        return self * inverse


def atan_bounds(denominator, terms=45):
    partial = sum(
        Fraction((-1) ** k, (2 * k + 1) * denominator ** (2 * k + 1))
        for k in range(terms)
    )
    alternate = partial + Fraction(
        (-1) ** terms, (2 * terms + 1) * denominator ** (2 * terms + 1)
    )
    return Interval.bounds(min(partial, alternate), max(partial, alternate))


def trig_intervals(x):
    square = x * x
    sine_term, cosine_term = x, Interval(SCALE)
    sine, cosine = sine_term, cosine_term
    for k in range(1, 48):
        sine_term = -(sine_term * square) / ((2 * k) * (2 * k + 1))
        cosine_term = -(cosine_term * square) / ((2 * k - 1) * (2 * k))
        sine = sine + sine_term
        cosine = cosine + cosine_term
    tail = Interval(-1, 1)
    return cosine + tail, sine + tail


def dot(a, b):
    return sum(x * y for x, y in zip(a, b))


def determinant4(rows):
    total = Interval(0)
    for permutation in permutations(range(4)):
        inversions = sum(
            permutation[i] > permutation[j] for i in range(4) for j in range(i + 1, 4)
        )
        term = (-1)**inversions
        for row, column in enumerate(permutation):
            term = term * rows[row][column]
        total = total + term
    return total


def add(a, b):
    return tuple(x + y for x, y in zip(a, b))


def subtract(a, b):
    return tuple(x - y for x, y in zip(a, b))


def scale(a, c):
    return tuple(c * x for x in a)


def conj(a):
    return a[0], -a[1], -a[2], -a[3]


def multiply(a, b):
    w, x, y, z = a
    q, r, s, t = b
    return (
        w*q - x*r - y*s - z*t,
        w*r + x*q + y*t - z*s,
        w*s - x*t + y*q + z*r,
        w*t + x*s - y*r + z*q,
    )


def action(a, b, q):
    return multiply(multiply(a, q), conj(b))


BASIS = tuple(tuple(int(i == j) for j in range(4)) for i in range(4))
AXES = ("1", "i", "j", "k")
LEFT = {
    prefix + axis: scale(vector, sign)
    for axis, vector in zip(AXES, BASIS)
    for prefix, sign in (("+", 1), ("-", -1))
}
LEFT.update({
    "".join("+" if x > 0 else "-" for x in signs): tuple(Fraction(x, 2) for x in signs)
    for signs in product((1, -1), repeat=4)
})
LEFT_LABEL = {v: key for key, v in LEFT.items()}
GROUP = tuple((a, r, b) for a in LEFT for b in (0, 1) for r in range(17))
IDENTITY = ("+1", 0, 0)


def group_product(g, h):
    a, r, b = g
    c, s, d = h
    left = scale(multiply(LEFT[a], LEFT[c]), (-1) ** (b*d))
    return LEFT_LABEL[left], (r + (-1)**b * s) % 17, (b + d) % 2


def group_inverse(g):
    a, r, b = g
    left = scale(conj(LEFT[a]), (-1)**b)
    return LEFT_LABEL[left], ((-1)**(b + 1) * r) % 17, b


def component_data(convert, z, root_three):
    basis = tuple(tuple(convert(x) for x in vector) for vector in BASIS)
    one, i, j, k = basis
    left = {label: tuple(convert(x) for x in a) for label, a in LEFT.items()}
    p = tuple(convert(x) for x in (2, 3, 5, 7))
    n = tuple(x / root_three for x in add(add(i, j), k))
    seed = subtract(one, multiply(n, j))
    diffs = {
        (a, r, b): subtract(p, action(left[a], z[r] if b == 0 else multiply(z[r], j), p))
        for a, r, b in GROUP
    }
    regular = {
        ("R", axis, r): (
            action(left["+" + axis], z[r], seed),
            action(left["+" + axis], z[r], multiply(seed, j)),
        )
        for axis in AXES for r in range(17)
    }
    singular = {}
    for a in ("+i", "-i", "+j", "-j", "+k", "-k"):
        for r in range(17):
            b = multiply(z[r], j)
            # For this set, 1-A B is nonzero except A=-j, r=0.
            c = i if (a, r) == ("-j", 0) else one
            u = subtract(c, multiply(multiply(left[a], c), b))
            singular["S", a, r] = u, multiply(u, b)
    return p, diffs, regular | singular


def projected_line(p, plane):
    u, v = plane
    up, vp = dot(u, p), dot(v, p)
    return add(scale(u, up), scale(v, vp)), subtract(scale(v, up), scale(u, vp))


def interval_data():
    # Machin's identity and alternating arctangent bounds enclose pi.
    pi_interval = 16 * atan_bounds(5) - 4 * atan_bounds(239)
    assert pi_interval.hi < 7 * SCALE // 2
    # The first omitted cosine term and sine term are below one endpoint unit.
    assert Fraction(7**96, factorial(96)) < Fraction(1, SCALE)
    assert Fraction(7**97, factorial(97)) < Fraction(1, SCALE)
    triples = [trig_intervals(2 * pi_interval * r / 17) for r in range(17)]
    z = [(c, s, Interval(0), Interval(0)) for c, s in triples]
    root = isqrt(3 * SCALE**2)
    convert = lambda value: Interval.bounds(Fraction(value), Fraction(value))
    return component_data(convert, z, Interval(root, root + 1))


EXPECTED = {
    ("R", "1", 10): (("-k", 9, 1), ("-+--", 11, 0)),
    ("R", "k", 16): (("--++", 6, 0), ("-k", 9, 1)),
    ("S", "+j", 5): (("-i", 4, 0), ("-+--", 11, 0)),
    ("S", "-j", 14): (("-+--", 11, 0), ("+i", 13, 0)),
    ("S", "+k", 0): (("--++", 6, 0), ("-1", 8, 0)),
    ("S", "+k", 1): (("-1", 9, 0), ("+i", 13, 0)),
    ("S", "-k", 9): (("-i", 4, 0), ("--++", 6, 0)),
}


def active_signature(component, endpoint_face):
    family, axis, r = component
    signature = {IDENTITY, endpoint_face}
    if family == "S":
        tau = (axis, r, 1)
        signature.update((tau, group_product(tau, endpoint_face)))
    return frozenset(signature)


def transform_label(g, label):
    family, axis, r = label
    a, shift, b = g
    first, last = LEFT[a], conj(LEFT[a])
    if family == "S":
        new_axis = LEFT_LABEL[multiply(multiply(first, LEFT[axis]), last)]
        return family, new_axis, (2 * shift + (-1)**b * r) % 17
    vertex = (0, 1, 1, 1)
    tetrahedral = {
        multiply(multiply(LEFT["+" + v], vertex), conj(LEFT["+" + v])): v
        for v in AXES
    }
    old = next(key for key, value in tetrahedral.items() if value == axis)
    new_axis = tetrahedral[multiply(multiply(first, old), last)]
    return family, new_axis, (shift + (-1)**b * r) % 17


def verify_arc(label, p, diff, plane, faces, included):
    x, y = projected_line(p, plane)
    assert dot(x, x).lo > 0, label
    endpoints = []
    for side, g in zip((1, -1), faces):
        a, b = dot(diff[g], x), dot(diff[g], y)
        assert (side * b).lo > 0, (label, g)
        t = -a / b
        if included:
            signature = active_signature(label, g)
            sample = add(x, scale(y, t))
            for h in GROUP:
                if h not in signature:
                    assert dot(diff[h], sample).lo > 0, (label, g, h)
            if label[0] == "S":
                normals = tuple(diff[h] for h in sorted(signature - {IDENTITY}))
                rank = determinant4((p, *normals))
                assert rank.lo > 0 or rank.hi < 0, (label, g)
        endpoints.append(t)
    lower, upper = endpoints
    if included:
        assert lower.hi < upper.lo, label
    else:
        assert upper.hi < lower.lo, label
    return endpoints


def floating_witness(p, diff, plane):
    x, y = projected_line(p, plane)
    inequalities = {g: (dot(d, x), dot(d, y)) for g, d in diff.items()}
    lower = max((-a/b, g) for g, (a, b) in inequalities.items() if b > 1.e-9)
    upper = min((-a/b, g) for g, (a, b) in inequalities.items() if b < -1.e-9)
    return lower[1], upper[1]


def verify_equivalences():
    endpoint_by_signature = {}
    for label, faces in EXPECTED.items():
        for end, g in zip(("lower", "upper"), faces):
            signature = active_signature(label, g)
            key = label, signature
            assert key not in endpoint_by_signature
            endpoint_by_signature[key] = label, end
    for label, faces in EXPECTED.items():
        for end, g in zip(("lower", "upper"), faces):
            signature = active_signature(label, g)
            equivalent = set()
            for h in signature:
                inverse = group_inverse(h)
                transformed = frozenset(group_product(inverse, v) for v in signature)
                key = transform_label(inverse, label), transformed
                assert key in endpoint_by_signature
                equivalent.add(endpoint_by_signature[key])
            assert len(equivalent) == 2
            print(label, end, "faces=", sorted(signature - {IDENTITY}), "glues=", sorted(equivalent))
    transitions = tuple(EXPECTED[label][1] for label in (("R", "1", 10), ("R", "k", 16)))
    developed = group_product(*transitions)
    conjugator = ("+1", 10, 0)
    j_inverse = group_inverse(("++++", 0, 1))
    in_reference = group_product(group_inverse(conjugator), group_product(developed, conjugator))
    assert in_reference == j_inverse
    print("Positive regular circuit has developed deck word", developed, "conjugate to J^-1.")
    singular_cycle = (
        ("S", "+j", 5), ("S", "+k", 0), ("S", "+k", 1),
        ("S", "-k", 9), ("S", "-j", 14),
    )
    for label, target in zip(singular_cycle, singular_cycle[1:] + singular_cycle[:1]):
        g = EXPECTED[label][1]
        signature = active_signature(label, g)
        inverse = group_inverse(g)
        transformed = frozenset(group_product(inverse, v) for v in signature)
        assert endpoint_by_signature[transform_label(inverse, label), transformed] == (target, "lower")
    singular_word = reduce(group_product, (EXPECTED[label][1] for label in singular_cycle))
    assert singular_word == ("+j", 0, 0)
    print("Positive singular circuit has developed deck word", singular_word)


def main():
    roots = [(cos(2*pi*r/17), sin(2*pi*r/17), 0., 0.) for r in range(17)]
    pf, df, cf = component_data(float, roots, sqrt(3))
    p, diff, circles = interval_data()
    assert len(circles) == 170
    assert all(dot(diff[g], diff[g]).lo > 0 for g in GROUP if g != IDENTITY)
    for label, plane in circles.items():
        included = label in EXPECTED
        faces = EXPECTED[label] if included else floating_witness(pf, df, cf[label])
        lower, upper = verify_arc(label, p, diff, plane, faces, included)
        if included:
            print(label, "interval=", (lower.lo/SCALE, upper.hi/SCALE))
    print("Certified five singular and two regular arcs, and excluded all 163 other circles.")
    verify_equivalences()


if __name__ == "__main__":
    main()
