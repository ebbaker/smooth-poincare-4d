#!/usr/bin/env python3
"""Fixed E19 certificate, with exact integers and outward-rounded dyadic intervals."""

from dataclasses import dataclass
from fractions import Fraction
from math import factorial, isqrt


BITS = 96
UNIT = 1 << BITS
CELLS = 1 << 14
SERIES_TERMS = 12


def ceil_div(numerator, denominator):
    return -((-numerator) // denominator)


@dataclass(frozen=True)
class Interval:
    lo: int
    hi: int

    @classmethod
    def point(cls, value):
        if isinstance(value, int):
            return cls(value * UNIT, value * UNIT)
        rational = Fraction(value)
        numerator = rational.numerator * UNIT
        return cls(
            numerator // rational.denominator,
            ceil_div(numerator, rational.denominator),
        )

    def __add__(self, other):
        other = as_interval(other)
        return Interval(self.lo + other.lo, self.hi + other.hi)

    __radd__ = __add__

    def __neg__(self):
        return Interval(-self.hi, -self.lo)

    def __sub__(self, other):
        return self + -as_interval(other)

    def __rsub__(self, other):
        return as_interval(other) + -self

    def __mul__(self, other):
        other = as_interval(other)
        products = (
            self.lo * other.lo,
            self.lo * other.hi,
            self.hi * other.lo,
            self.hi * other.hi,
        )
        return Interval(min(products) // UNIT, ceil_div(max(products), UNIT))

    __rmul__ = __mul__

    def __truediv__(self, other):
        if isinstance(other, int) and other > 0:
            return Interval(self.lo // other, ceil_div(self.hi, other))
        return self * as_interval(other).reciprocal()

    def reciprocal(self):
        require(self.lo > 0, "Reciprocal of a nonpositive interval")
        return Interval(UNIT**2 // self.hi, ceil_div(UNIT**2, self.lo))

    def square(self):
        lower = 0 if self.lo <= 0 <= self.hi else min(self.lo**2, self.hi**2)
        upper = max(self.lo**2, self.hi**2)
        return Interval(lower // UNIT, ceil_div(upper, UNIT))

    def sqrt(self):
        require(self.lo >= 0, "Square root of a negative interval")
        return Interval(isqrt(self.lo * UNIT), isqrt(self.hi * UNIT) + 1)

    def decimal_enclosure(self, digits):
        scale = 10**digits
        lower = self.lo * scale // UNIT
        upper = ceil_div(self.hi * scale, UNIT)
        return Fraction(lower, scale), Fraction(upper, scale)


def as_interval(value):
    return value if isinstance(value, Interval) else Interval.point(value)


def require(condition, message):
    if not condition:
        raise ValueError(message)


def evaluate(coefficients, x):
    result = coefficients[-1]
    for coefficient in reversed(coefficients[:-1]):
        result = result * x + coefficient
    return result


def differentiate(coefficients):
    return tuple(index * value for index, value in enumerate(coefficients) if index > 0)


def log_three():
    # log(3) = 2 atanh(1/2). Bound the positive tail by a geometric series.
    terms = 40
    partial = sum(Fraction(2, (2 * k + 1) * 2**(2 * k + 1)) for k in range(terms))
    tail = Fraction(2, (2 * terms + 1) * 2**(2 * terms + 1)) * Fraction(4, 3)
    return Interval(Interval.point(partial).lo, Interval.point(partial + tail).hi)


def envelope(coefficients):
    """Coefficients of (1-q)^2 times a quadratic in q."""
    first, second, third = coefficients
    return (
        first,
        second - 2 * first,
        third - 2 * second + first,
        second - 2 * third,
        third,
    )


def profiles():
    length = Interval.point("0.391295")
    axial_end = Interval.point(3).sqrt().sqrt().reciprocal()
    anisotropy_end = log_three() / 4
    p_extra = envelope(tuple(map(Interval.point, ("-0.235767", "0.148703", "-0.047647"))))
    r_extra = envelope(tuple(map(Interval.point, ("-0.023612", "-0.020121", "-0.006356"))))
    p = (
        4 * length,
        (5 * axial_end - 16 * length) / 2 + p_extra[0],
        (8 * length - 3 * axial_end) / 2 + p_extra[1],
        *p_extra[2:],
    )
    r = (3 * anisotropy_end / 2 + r_extra[0], -anisotropy_end / 2 + r_extra[1], *r_extra[2:])
    return length, p, r


def even_series(offset):
    coefficients = tuple(
        Interval.point(Fraction(1, factorial(2 * n + offset)))
        for n in range(SERIES_TERMS)
    )
    # On |y| <= 2, all tail ratios are < 1/2. The first term is <= 4^n/(2n+k)!.
    tail_bound = Fraction(2 * 4**SERIES_TERMS, factorial(2 * SERIES_TERMS + offset))
    return coefficients, Interval(0, Interval.point(tail_bound).hi)


COSH = even_series(0)
SINH_TAIL = even_series(3)


def analytic_function(y_squared, coefficients_and_tail):
    require(0 <= y_squared.lo <= y_squared.hi <= 4 * UNIT, "Series argument is outside |y| <= 2")
    coefficients, tail = coefficients_and_tail
    return evaluate(coefficients, y_squared) + tail


def cell_values(x, length, p_poly, r_poly, p_first, r_first, p_second, r_second):
    q = x.square()
    p, r = evaluate(p_poly, q), evaluate(r_poly, q)
    require(p.lo > 0, "Nonpositive p enclosure")
    p_q, r_q = evaluate(p_first, q), evaluate(r_first, q)
    p_tail = evaluate(p_poly[1:], q)
    a, u = x * p, x * r
    length_sq = length.square()
    p_sq = p.square()
    r_sq = r.square()
    r_cube = r_sq * r
    a_s = (p + 2 * q * p_q) / length
    u_s = (r + 2 * q * r_q) / length
    a_ss_over_a = (6 * p_q + 4 * q * evaluate(p_second, q)) / (length_sq * p)
    u_ss = x * (6 * r_q + 4 * q * evaluate(r_second, q)) / length_sq

    u_sq = u.square()
    tail_u = analytic_function(u_sq, SINH_TAIL)
    tail_2u = analytic_function(4 * u_sq, SINH_TAIL)
    tail_4u = analytic_function(16 * u_sq, SINH_TAIL)
    intrinsic_sum = 2 * analytic_function(4 * u_sq, COSH)
    intrinsic_diff = 4 * u * (1 + 4 * u_sq * tail_2u)
    d_over_a = 4 * (r + 4 * q * r_cube * tail_2u) / p
    tail_d_over_a2 = 16 * x * r_cube * tail_2u / p_sq
    tail_dp_over_a2 = 128 * x * r_cube * tail_4u / p_sq
    d_u_ratio = 2 * x * (r_q * p - r * p_q) / (length * p_sq)
    residual = x * (
        -r * (4 * length + p) * p_tail
        - 2 * p * (r_q * p + r * p_q + 2 * q * r_q * p_q)
    ) / (length_sq * p_sq)

    total_sectional = -a_ss_over_a + 2 * intrinsic_sum - a.square() - d_over_a.square() - u_s.square()
    k_horizontal = 2 * intrinsic_sum - 3 * a.square() + d_over_a.square() + u_s.square()
    k_diff = -4 * intrinsic_diff + 4 * tail_dp_over_a2 + 2 * residual
    m_axial = -2 * a_s + 2 * d_over_a * u_s
    m_diff = (
        16 * x * r_sq * (1 + u_sq * tail_u).square() * u_s / p
        + 8 * d_u_ratio - 2 * tail_d_over_a2 * a_s - 2 * a * u_s
    )
    axial = (-a_ss_over_a + k_horizontal) / 2 - total_sectional / 6
    difference = u_ss + k_diff / 2
    volume = length * a / 4
    plus = volume * (3 * (axial + m_axial).square() + (difference + m_diff).square()) / 2
    minus = volume * (3 * (axial - m_axial).square() + (difference - m_diff).square()) / 2
    mean = volume * (
        3 * (axial.square() + m_axial.square()) + difference.square() + m_diff.square()
    ) / 2
    return p, 2 * total_sectional, plus, minus, mean


def main():
    length, p_poly, r_poly = profiles()
    p_first, r_first = differentiate(p_poly), differentiate(r_poly)
    p_second, r_second = differentiate(p_first), differentiate(r_first)
    min_p, min_scalar = UNIT, 10 * UNIT
    totals = [Interval.point(0) for _ in range(3)]
    stride = UNIT // CELLS
    for index in range(CELLS):
        x = Interval(index * stride, (index + 1) * stride)
        p, scalar, *densities = cell_values(
            x, length, p_poly, r_poly, p_first, r_first, p_second, r_second
        )
        min_p = min(min_p, p.lo)
        min_scalar = min(min_scalar, scalar.lo)
        totals = [total + density for total, density in zip(totals, densities)]

    plus, minus, mean = (total / CELLS for total in totals)
    require(min_p > 0, "p must be everywhere positive")
    require(min_scalar > 0, "Scalar curvature must be everywhere positive")
    require(4 * UNIT < mean.lo <= mean.hi < 8 * UNIT, "Mean energy outside requested range")
    require(minus.lo > 8 * UNIT, "Negative-chirality energy must exceed the strict wall")
    print(f"cells: {CELLS}, dyadic bits: {BITS}")
    print(f"p >= {Interval(min_p, min_p).decimal_enclosure(4)[0]}")
    print(f"R >= {Interval(min_scalar, min_scalar).decimal_enclosure(4)[0]}")
    for name, bound in (("E+", plus), ("E-", minus), ("e", mean)):
        lower, upper = bound.decimal_enclosure(4)
        print(f"{name}/pi^2 in [{lower}, {upper}]")


if __name__ == "__main__":
    main()
