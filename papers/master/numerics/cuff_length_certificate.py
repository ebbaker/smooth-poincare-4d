#!/usr/bin/env python3
"""Outward-rounded two-cuff test for the frozen smooth comparator."""

import json
from decimal import Decimal, ROUND_HALF_EVEN, localcontext
from fractions import Fraction
from pathlib import Path

import numpy as np

from native_harmonic_measures import validated_potential


class Interval:
    """Enclose operations on finite IEEE binary64 numbers."""

    def __init__(self, lower, upper=None):
        self.lo = np.asarray(lower, dtype=np.float64)
        self.hi = self.lo if upper is None else np.asarray(upper, dtype=np.float64)

    @staticmethod
    def round(lower, upper):
        return Interval(np.nextafter(lower, -np.inf), np.nextafter(upper, np.inf))

    @staticmethod
    def rational(value):
        number = float(value)
        return Interval.round(number, number)

    @staticmethod
    def wrap(value):
        return value if isinstance(value, Interval) else Interval(value)

    def __neg__(self):
        return Interval(-self.hi, -self.lo)

    def __add__(self, other):
        other = self.wrap(other)
        return self.round(self.lo + other.lo, self.hi + other.hi)

    __radd__ = __add__

    def __sub__(self, other):
        return self + -self.wrap(other)

    def __rsub__(self, other):
        return -self + other

    def __mul__(self, other):
        other = self.wrap(other)
        values = np.broadcast_arrays(self.lo * other.lo, self.lo * other.hi,
                                     self.hi * other.lo, self.hi * other.hi)
        return self.round(np.minimum.reduce(values), np.maximum.reduce(values))

    __rmul__ = __mul__

    def __truediv__(self, other):
        other = self.wrap(other)
        assert np.all((other.lo > 0) | (other.hi < 0))
        return self * self.round(1 / other.hi, 1 / other.lo)

    def square(self):
        nearest = np.where((self.lo <= 0) & (self.hi >= 0), 0,
                           np.minimum(abs(self.lo), abs(self.hi)))
        farthest = np.maximum(abs(self.lo), abs(self.hi))
        return self.round(nearest * nearest, farthest * farthest)

    def magnitude(self):
        return float(np.maximum(abs(self.lo), abs(self.hi)).max())

    def elementary(self, method):
        def evaluate(values, upward):
            numbers = []
            with localcontext() as ctx:
                ctx.prec = 50
                ctx.rounding = ROUND_HALF_EVEN
                for value in values.ravel():
                    result = getattr(Decimal.from_float(float(value)), method)()
                    neighbor = result.next_plus() if upward else result.next_minus()
                    numbers.append(float(neighbor))
            return np.asarray(numbers).reshape(values.shape)

        return self.round(evaluate(self.lo, False), evaluate(self.hi, True))

    def exp(self):
        return self.elementary("exp")

    def log(self):
        assert np.all(self.lo > 0)
        return self.elementary("ln")

    def sum(self):
        lo, hi = self.lo.ravel(), self.hi.ravel()
        while lo.size > 1:
            stop = lo.size - lo.size % 2
            pairs = self.round(lo[:stop:2] + lo[1:stop:2], hi[:stop:2] + hi[1:stop:2])
            lo, hi = np.r_[pairs.lo, lo[stop:]], np.r_[pairs.hi, hi[stop:]]
        return Interval(lo[0], hi[0])

    def __repr__(self):
        return f"[{float(self.lo):.12g}, {float(self.hi):.12g}]"


def multiply(z, w):
    x, y = z
    a, b = w
    return x * a - y * b, x * b + y * a


def complex_scale(z, value):
    return z[0] * value, z[1] * value


def absolute_square(z):
    return z[0].square() + z[1].square()


def reciprocal(z):
    denominator = absolute_square(z)
    return z[0] / denominator, -z[1] / denominator


def add(z, w):
    return z[0] + w[0], z[1] + w[1]


def powers(y, maximum):
    result = [(Interval(1), Interval(0))]
    for _ in range(maximum):
        result.append(multiply(result[-1], y))
    return result


def chebyshev(x, degree):
    result = [Interval(1), x]
    for _ in range(2, degree + 1):
        result.append(2 * x * result[-1] - result[-2])
    return result


def radial_chart(y, degree, modes, unit):
    radial = [Interval(1)] * (degree + 1) if unit else chebyshev(2 * absolute_square(y) - 1, degree)
    angular = powers(y, max(modes))
    return [angular[mode][0] * term for mode in modes for term in radial]


def comparator(z, center, degree, modes, coefficients):
    outer = radial_chart(complex_scale(z, .25), degree, range(0, modes + 1, 2), center == 0)
    holes = [radial_chart(complex_scale(reciprocal((z[0] - pole, z[1])), .25),
                          degree, range(modes + 1), center == pole)
             for pole in (1, -1)]
    parity = np.repeat((-1.)**np.arange(modes + 1), degree + 1)
    fields = outer + [a + b * sign for a, b, sign in zip(*holes, parity)]
    values = [sum(field * value for field, value in zip(fields, column)) for column in coefficients.T]
    z2 = multiply(z, z)
    values[0] += absolute_square(z) / 64 - .75 * absolute_square((z2[0] - 1, z2[1])).log()
    return values


def pole_field(z, coefficients):
    direct = reciprocal((z[0] - 1, z[1]))
    image = reciprocal((16 - z[0], -z[1]))
    direct_powers = powers(complex_scale(direct, .25), len(coefficients)-1)
    image_powers = powers(complex_scale(multiply(z, image), .25), len(coefficients)-1)
    direct_gradient = complex_scale(multiply(direct, direct), -.25)
    image_gradient = complex_scale(multiply(image, image), 4)
    value = complex_scale(add(direct, image), -1)
    for k, (coefficient, a, b) in enumerate(zip(coefficients, direct_powers, image_powers), 1):
        term = add(multiply(a, direct_gradient), complex_scale(multiply(b, image_gradient), -1))
        value = add(value, complex_scale(term, coefficient * k))
    return value


def hopf(z, w, multipoles):
    basis = []
    for sign, coefficients in multipoles:
        direct, partner = pole_field(z, coefficients), pole_field(complex_scale(z, -1), coefficients)
        field = add(direct, complex_scale(partner, -sign))
        basis.append(-multiply(multiply(w, w), multiply(field, field))[0])
    return basis


def positive_powers(base, count):
    out = [Interval(1)]
    for _ in range(count):
        out.append(out[-1] * base)
    return out


def analytic_bounds(center, radius, degree, modes, coefficients, multipoles):
    """Absolute analytic bounds on |t-t0|<=1/128, real 0<=t0<=1."""
    change_w = Interval.rational(Fraction(2, 127))
    move = change_w * radius
    z_upper = center + radius + move
    first = (center + radius) / 4
    charts = [(Interval(first), Interval(0) if center == 0 else move / 4, center == 0)]
    distances = [Interval(abs(abs(center - pole) - radius)) for pole in (1, -1)]
    for pole, distance in zip((1, -1), distances):
        charts.append((Interval(.25) / distance,
                       Interval(0) if center == pole else Interval(.25) * move / distance / (distance - move),
                       center == pole))
    all_fields = []
    for i, (size, change, unit) in enumerate(charts):
        angular = positive_powers(1 + change_w if unit else size + change, modes)
        shift = 2 * change * (2 * size + change)
        radial = [(shift * (j*j)).exp() for j in range(degree + 1)]
        base_modes = range(0, modes + 1, 2) if i == 0 else range(modes + 1)
        all_fields.append([angular[k] * term for k in base_modes for term in radial])
    fields = all_fields[0] + [a+b for a,b in zip(*all_fields[1:])]
    v = [sum(f * abs(value) for f, value in zip(fields, column)) for column in coefficients.T]
    # On both circles and their t-disks all |z∓1| vary fractionally by <1/32.
    # The base log is continued from its real value and stays within this bound.
    v[0] += 6
    image_inverse = Interval(1) / (16 - z_upper)
    image_magnitude = .25 * z_upper * image_inverse
    image_powers = positive_powers(image_magnitude, 23)
    phi = []
    for _, b in multipoles:
        combined = Interval(0)
        for distance in distances:
            direct_inverse = Interval(1) / (distance - move)
            direct_powers = positive_powers(.25 * direct_inverse, 23)
            combined += direct_inverse + image_inverse
            for k, a in enumerate(b, 1):
                combined += Interval(float(a.magnitude())) * k * (
                    .25 * direct_inverse.square() * direct_powers[k-1]
                    + 4 * image_inverse.square() * image_powers[k-1])
        phi.append((1 + change_w).square() * combined.square())
    return v, phi


def rule(panels):
    """Closed degree-16 Newton–Cotes, normalized to integrate the constant 1."""
    order = 16
    weights = []
    for j in range(order + 1):
        poly = [Fraction(1)]
        for k in range(order + 1):
            if j == k:
                continue
            out = [Fraction(0)] * (len(poly) + 1)
            for i, a in enumerate(poly):
                out[i] -= a * Fraction(k, j-k)
                out[i+1] += a * Fraction(order, j-k)
            poly = out
        weights.append(sum(a / (i+1) for i, a in enumerate(poly)))
    assert sum(weights) == 1
    combined = [Interval(0)] * (panels * order + 1)
    for j, weight in enumerate(weights):
        exact = Interval.rational(weight / panels)
        # Interior nodes are never shared, except both endpoints of adjacent cells.
        if j == 0:
            first = exact
        elif j == order:
            both = first + exact
            combined[0], combined[-1] = first, exact
            combined[order:-1:order] = [both] * (panels - 1)
        else:
            combined[j::order] = [exact] * panels
    interval_weights = Interval(np.array([a.lo for a in combined]), np.array([a.hi for a in combined]))
    ratio = Fraction(64, panels)
    error = Interval.rational((1 + sum(map(abs, weights))) * ratio**17 / (1-ratio))
    return np.arange(panels * order + 1) / (panels * order), interval_weights, error


def arc(center, radius, quadrant, multiplier, coefficients, parameters, degree, modes,
        multipoles, t, weights, error, hopf_error):
    angular_denominator = 1 + t.square()
    w = ((1 - t.square()) / angular_denominator, 2 * t / angular_denominator)
    if quadrant:
        w = -w[1], w[0]
    z = add((Interval(center), Interval(0)), complex_scale(w, radius))
    values = comparator(z, center, degree, modes, coefficients)
    fields = hopf(z, w, multipoles)
    p0 = fields[0] * parameters[0] + fields[1] * parameters[1]
    stretch = (.5 * values[0]).exp()
    integrands = [stretch + p0 / stretch]
    integrands.extend(.5 * response * (stretch - p0 / stretch) + phi / stretch
                      for response, phi in zip(values[1:], fields))

    bound_v, bound_phi = analytic_bounds(center, radius, degree, modes, coefficients, multipoles)
    bound_p0 = sum(abs(p) * b for p, b in zip(parameters, bound_phi))
    bound_stretch = (.5 * bound_v[0]).exp()
    bound_length = bound_stretch * (1 + bound_p0)
    bound_jac = [bound_stretch * (.5 * j * (1 + bound_p0) + phi)
                 for j, phi in zip(bound_v[1:], bound_phi)]
    measured = []
    for amount, bound in zip(integrands, [bound_length, *bound_jac]):
        # Complex bound of 2r/(1+t²) is 2r/(1-1/128)^2.
        budget = Interval.rational(Fraction(128,127)**2) * (2 * radius * multiplier) * bound * error
        value = (weights * (2 * radius * multiplier) * amount / angular_denominator).sum()
        measured.append(value + Interval(-budget.hi, budget.hi))

    # The nearest sample is less than half a node spacing from every real t.
    nearest_ratio = Interval.rational(Fraction(64, len(t.lo)-1))
    nearest_error = nearest_ratio / (1-nearest_ratio)
    radii = [Interval.rational(Fraction(1,50000)), Interval.rational(Fraction(1,20000))]
    delta_v = sum(r * (value.magnitude() + bound * nearest_error)
                  for r, value, bound in zip(radii, values[1:], bound_v[1:]))
    delta_phi = sum(r * (value.magnitude() + bound * nearest_error)
                    for r, value, bound in zip(radii, fields, bound_phi))
    p0_size = p0.magnitude() + bound_p0 * nearest_error
    deviation = bound_v[0] * nearest_error
    v_min = Interval(float(values[0].lo.min())) - deviation
    v_max = Interval(float(values[0].hi.max())) + deviation
    minimum_stretch = (.5 * v_min).exp()
    maximum_stretch = (.5 * v_max).exp()
    assert (v_min-delta_v).exp().lo > (p0_size+delta_phi).hi, (center, quadrant, v_min, delta_v, p0_size, delta_phi)
    x = delta_v / 2
    remainder = x.exp() * (
        (maximum_stretch + p0_size / minimum_stretch) * x.square()/2
        + delta_phi * x / minimum_stretch)
    # A quadrant length is πr/2 < 11r/7.
    stretch_on_box = (.5 * (v_min-delta_v)).exp()
    integrated_error = (remainder + hopf_error / stretch_on_box) * (
        Interval.rational(Fraction(11,7)) * (radius * multiplier))
    return measured, integrated_error.hi


def cuff_hopf_error(boundary_error, parameters, widths):
    """The analytic cuff residual lift gives a uniform true-basis error."""
    lifted_error = Fraction(1, 10**21) * Fraction(8, 7)**24
    lifted_error += Fraction(10, 9) * Fraction(2, 7)**25 / (1 - Fraction(2, 7))
    # Zero-boundary error plus the lifted residual extends to a radius-1/32 disk.
    gradient_error = 64 * (boundary_error + 2 * lifted_error)
    assert gradient_error < Fraction(52, 10**13)
    coefficient_sum = sum(abs(Fraction(p)) + w for p,w in zip(parameters,widths))
    approximate_field = 2 * (4 + Fraction(1, 12) + 32 + Fraction(8, 36))
    error = coefficient_sum * gradient_error * (2 * approximate_field + gradient_error)
    assert error < Fraction(1, 10**10)
    return Interval.rational(error)


def main():
    frozen = Path(__file__).with_name("whole_pants_residual_d18.json")
    data = json.loads(frozen.read_text())
    parameters = np.array([float.fromhex(x) for x in data["parameters"]])
    coefficients = np.array([[float.fromhex(a), *map(float.fromhex,b)]
                             for a,b in zip(data["coefficients"], data["response"])])
    degree, modes = data["degree"], data["modes"]
    parity_data = [(sign, validated_potential(sign)) for sign in (1, -1)]
    multipoles = [(sign, [Interval.rational(x) for x in row[0]]) for sign, row in parity_data]
    exact_widths = [Fraction(x) for x in (".00002", ".00005")]
    hopf_error = cuff_hopf_error(max(row[2] for _,row in parity_data), parameters, exact_widths)
    t, weights, error = rule(1024)
    arcs = [arc(*spec, coefficients, parameters, degree, modes, multipoles, Interval(t), weights,
                error, hopf_error)
            for spec in ((0,4,0,4), (1,.25,0,2), (1,.25,1,2))]
    outer = arcs[0][0]
    right = [a+b for a,b in zip(arcs[1][0],arcs[2][0])]
    remainder = [Interval(arcs[0][1]), Interval(arcs[1][1]) + arcs[2][1]]
    target = 2 * (5 + Interval(24).elementary("sqrt")).log()
    exact_preconditioner = [[Fraction(x) for x in row]
                            for row in (("-.02775", ".01348"), (".02921", "-.07982"))]
    (a, b), (c, d) = exact_preconditioner
    assert a*d - b*c > 0
    preconditioner = [[Interval.rational(x) for x in row] for row in exact_preconditioner]
    widths = [Interval.rational(x) for x in exact_widths]
    assert all((Interval(p) + width).hi < 0 for p, width in zip(parameters, widths))
    maximum_cuff = Interval.rational(Fraction(23,5))
    length_errors = []
    for tolerance, bound in ((126, 290), (193, 444)):
        scalar_error = Interval.rational(Fraction(tolerance, 10**6))
        length_error = maximum_cuff * ((scalar_error/2).exp() - 1)
        assert length_error.hi < Interval.rational(Fraction(bound, 10**6)).lo
        length_errors.append((tolerance, length_error))
    length_changes = [sum(width * jac.magnitude() for width,jac in zip(widths,values[1:])) + err
                      for values,err in zip((outer,right),remainder)]
    for values,err,change in zip((outer,right),remainder,length_changes):
        assert (values[0]+change).hi < maximum_cuff.lo
        print("center, derivatives, remainder:", values, float(err.hi), flush=True)
    print("target:",target, flush=True)
    for axis,row in enumerate(preconditioner):
        offset = sum(entry * (length[0]-target) for entry,length in zip(row,(outer,right)))
        linear = [sum(entry * length[j+1] for entry,length in zip(row,(outer,right))) for j in range(2)]
        uncertainty = sum(entry.magnitude() * e for entry,e in zip(row,remainder))
        other = 1-axis
        edge_floor = linear[axis]*widths[axis] - offset.magnitude() - linear[other].magnitude()*widths[other] - uncertainty
        threshold = Interval.rational(Fraction(("0.000015", "0.00004")[axis]))
        print("signed edge floor:", edge_floor, flush=True)
        assert edge_floor.lo > threshold.hi
        for tolerance, length_error in length_errors:
            conditional_shift = sum(Interval(entry.magnitude()) for entry in row) * length_error
            conditional = edge_floor - conditional_shift
            print(f"conditional true edge floor at height {tolerance}e-6:", conditional, flush=True)
            assert conditional.lo > 0


if __name__ == "__main__":
    main()

