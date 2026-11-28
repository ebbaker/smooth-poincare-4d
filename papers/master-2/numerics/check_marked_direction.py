"""Verify the continuum projection bound for profile A by integer box arithmetic."""
from collections import Counter
from functools import lru_cache
from itertools import combinations_with_replacement, product
from math import isqrt


# Endpoints, original centre offsets, and the mollifier radius are exact.
D = 15360
Q = 10**6
RHO = D // 64
CENTRES = ((0, 0, 0, 0), (D // 2, 0, 0, 0), (0, 2 * D // 3, 0, 0),
           (0, 0, 3 * D // 4, 0), (0, 0, 0, 4 * D // 5))
WEIGHTS = (16, 8, 4, 2, 1)
H_DEN = 4 * D**3
TENSOR_DEN = H_DEN**4
SIGNS = tuple(product((-1, 1), repeat=4))


def ceil_div(n, d):
    return -(-n // d)


def ceil_sqrt(n):
    root = isqrt(n)
    return root + (root * root < n)


@lru_cache(None)
def spline_numerator(z):
    """h(z/D) with denominator 4D³. The scalar argument is nonnegative."""
    if z <= D:
        return H_DEN - 6 * D * z**2 + 3 * z**3
    return max(2 * D - z, 0)**3


def tensor_bound(x, offset, radius, upper):
    numerator = 1
    for point, shift in zip(x, offset):
        distance = abs(point - shift)
        z = max(0, distance - radius) if upper else distance + radius
        numerator *= spline_numerator(z)
        if numerator == 0:
            break
    return numerator


PAIRS = []
for i, j in combinations_with_replacement(range(5), 2):
    centre_sum = tuple(a + b for a, b in zip(CENTRES[i], CENTRES[j]))
    weight = WEIGHTS[i] * WEIGHTS[j] * (1 if i == j else 2)
    PAIRS.append((weight, centre_sum))

B2_UP = ceil_div(Q * 4403963, 6150400)
B_UP = ceil_sqrt(Q * B2_UP)


def bounds_on_box(x, width):
    radius = width + RHO
    lower_sum = sum(w * tensor_bound(x, c, radius, False)
                    for w, c in zip(WEIGHTS, CENTRES))
    lower_f = Q * lower_sum // (31 * TENSOR_DEN)
    twice_x = tuple(2 * a for a in x)
    upper_sum = sum(w * tensor_bound(twice_x, c, 2 * radius, True)
                    for w, c in PAIRS)
    upper_m = ceil_div(Q * upper_sum, 31**2 * TENSOR_DEN)
    return lower_f, min(B2_UP, upper_m)


def correction_upper(lower_f, upper_m, moment):
    # First moment is centred. Second and higher orders are summed at s=3/4.
    variance_numerator = Q * (B2_UP + upper_m) - 2 * lower_f**2
    assert variance_numerator >= 0
    numerator, denominator = moment
    first = ceil_div(3 * ceil_sqrt(ceil_div(variance_numerator * numerator, 2 * denominator)), 4)
    norm = ceil_sqrt(B2_UP**2 + upper_m**2)
    tail = ceil_div(9 * Q * norm, 8 * (4 * Q - 3 * B_UP))
    return first + tail


def verify_angular_moment():
    # Each mass uses the minimum density on one absolute-frequency bin.
    scale = 10**8
    mass = [scale * 21 * (384 - k**2)**4 // (176 * 384**4)
            for k in range(1, 17)]
    score = 0
    for i, j, k, l in product(range(16), repeat=4):
        radius_squared = sum((axis + 1)**2 for axis in (i, j, k, l))
        angular_floor = scale * (i * j)**2 // radius_squared**2
        score += angular_floor * mass[i] * mass[j] * mass[k] * mass[l]
    assert 80 * score > scale**5
    print(f"angular mixed moment beta >= {score}/{scale**5} > 1/80")


def verify(moment):
    target = 99 * Q // 100
    exterior = correction_upper(0, 0, moment)
    assert exterior <= target
    stack = [((0, 0, 0, 0), 2 * D, 0)]
    leaves = Counter()
    nodes = 0
    maximum = exterior
    worst = None
    while stack:
        x, width, depth = stack.pop()
        nodes += 1
        f, m = bounds_on_box(x, width)
        upper = correction_upper(f, m, moment)
        if upper <= target:
            leaves[depth] += 1
            if upper > maximum:
                maximum, worst = upper, (x, width, f, m)
            continue
        if depth >= 10 or width % 2:
            raise ArithmeticError(f"Unresolved box at {x}, half-width {width}/{D}")
        half = width // 2
        for signs in SIGNS:
            child = tuple(a + sign * half for a, sign in zip(x, signs))
            stack.append((child, half, depth + 1))
    assert sum(count * 16**(10 - depth) for depth, count in leaves.items()) == 16**10
    print(f"angular second moment <= {moment[0]}/{moment[1]}")
    print(f"scale={Q}, coordinate denominator={D}, b2_up={B2_UP}, b_up={B_UP}")
    print(f"exterior correction <= {exterior}/{Q}")
    print(f"tested nodes={nodes}, leaves by depth={dict(sorted(leaves.items()))}")
    print(f"maximum correction <= {maximum}/{Q}; projection >= {Q - maximum}/{Q}")
    print(f"worst accepted (centre, half-width, lower_f, upper_m)={worst}")


if __name__ == "__main__":
    verify_angular_moment()
    verify((1, 3))
    verify((4, 5))
