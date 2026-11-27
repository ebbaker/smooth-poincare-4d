#!/usr/bin/env python3
"""Rational enclosure for the single SP4-CUT-TUBE-E01 cap.

The formulas and evidence scope are in ../notes/E01_CAP.md.
All arithmetic used for enclosure and assertions is integer or rational.
"""

from dataclasses import dataclass
from fractions import Fraction
from math import factorial


@dataclass(frozen=True)
class Interval:
    lower: Fraction
    upper: Fraction

    @classmethod
    def point(cls, value):
        return cls(Fraction(value), Fraction(value))

    def __add__(self, other):
        return Interval(self.lower + other.lower, self.upper + other.upper)

    def __sub__(self, other):
        return Interval(self.lower - other.upper, self.upper - other.lower)

    def __mul__(self, other):
        products = (
            self.lower * other.lower,
            self.lower * other.upper,
            self.upper * other.lower,
            self.upper * other.upper,
        )
        return Interval(min(products), max(products))

    def __truediv__(self, other):
        if other.lower <= 0 <= other.upper:
            raise ValueError("Division requires a denominator interval avoiding zero")
        return self * Interval(1 / other.upper, 1 / other.lower)

    def square(self):
        lower_square, upper_square = self.lower**2, self.upper**2
        lower = 0 if self.lower <= 0 <= self.upper else min(lower_square, upper_square)
        return Interval(lower, max(lower_square, upper_square))

    def outward(self, scale):
        lower_integer = (self.lower * scale).__floor__()
        upper_integer = (self.upper * scale).__ceil__()
        return Interval(Fraction(lower_integer, scale), Fraction(upper_integer, scale))


def polynomial(coefficients, x):
    result = coefficients[-1]
    for coefficient in reversed(coefficients[:-1]):
        result = result * x + coefficient
    return result


def alternating_sum(terms, next_term):
    partial = sum(terms)
    return Interval(min(partial, partial + next_term), max(partial, partial + next_term))


def arctan_reciprocal(denominator):
    x = Fraction(1, denominator)

    def term(k):
        return (-1)**k * x**(2 * k + 1) / (2 * k + 1)

    return alternating_sum((term(k) for k in range(16)), term(16))


def trig_at_endpoint(x, odd):
    # odd=1 for sine, odd=0 for cosine. Term magnitudes decrease for x<11/10.
    def term(k):
        power = 2 * k + odd
        return (-1)**k * x**power / factorial(power)

    return alternating_sum((term(k) for k in range(12)), term(12))


def require(condition, message):
    if not condition:
        raise ValueError(message)


def main():
    point = Interval.point
    pi = (point(16) * arctan_reciprocal(5) - point(4) * arctan_reciprocal(239))
    pi = pi.outward(10**15)
    theta = pi * point(Fraction(8, 25))
    require(
        0 < theta.lower < theta.upper < min(pi.lower / 2, Fraction(11, 10)),
        "Taylor and monotonicity ranges for sin and cos",
    )
    sine = Interval(
        trig_at_endpoint(theta.lower, 1).lower,
        trig_at_endpoint(theta.upper, 1).upper,
    ).outward(10**15)
    cosine = Interval(
        trig_at_endpoint(theta.upper, 0).lower,
        trig_at_endpoint(theta.lower, 0).upper,
    ).outward(10**15)

    ell_over_2pi = point(Fraction(8, 5)) / pi
    endpoint_a = ell_over_2pi / sine
    endpoint_ap = point(0) - endpoint_a * cosine
    p_end = endpoint_a / point(2) - point(1)
    ap_end = endpoint_ap - point(1)
    w = point(Fraction(-1, 10))
    v = (ap_end - point(3) * p_end) / point(2) - point(2) * w
    u = p_end - v - w
    p_coeffs = (point(1), u, v, w)
    p_derivative = (u, point(2) * v, point(3) * w)
    k_numerator = (point(6) * u, point(20) * v, point(42) * w)

    # J = integral_0^1 p(x)(1-x) dx. The cap has b(2)=-1/2.
    flux_factor = sum((coefficient / point((j + 1) * (j + 2))
                       for j, coefficient in enumerate(p_coeffs)), point(0))
    require(flux_factor.lower > 0, "Positive flux normalizing integral")
    c = point(1) / (point(4) * flux_factor)

    # The positive cap conformal factor matches sin(r) and its derivative
    # on the collar. This returns the exterior to the product gauge.
    conformal_slope = sine * cosine
    conformal_quadratic = point(Fraction(3, 50))
    conformal_second = point(2) * conformal_quadratic

    cells = 2048
    scale = 10**9
    upper_sum = Fraction(0)
    lower_sum = Fraction(0)
    min_p, min_scalar = Fraction(1), Fraction(10)
    min_conformal, min_laplacian = Fraction(1), Fraction(10)
    for j in range(cells):
        x = Interval(Fraction(j, cells), Fraction(j + 1, cells))
        p = polynomial(p_coeffs, x)
        require(p.lower > 0, f"Positive radial factor on cell {j}")
        curvature = (point(0) - polynomial(k_numerator, x)) / (point(4) * p)
        flux_sq = (c * (point(1) - x)).square()
        flux_derivative_sq = x * c.square()
        scalar = point(2) * (point(1) + curvature) - flux_sq / point(2)
        min_p = min(min_p, p.lower)
        min_scalar = min(min_scalar, scalar.lower)

        x_shift = x - point(1)
        conformal = sine + conformal_slope * x_shift + conformal_quadratic * x_shift.square()
        conformal_derivative = conformal_slope + conformal_second * x_shift
        delta_conformal = (
            (point(1) + x * polynomial(p_derivative, x) / p) * conformal_derivative
            + x * conformal_second
        )
        laplacian = scalar * conformal - point(6) * delta_conformal
        min_conformal = min(min_conformal, conformal.lower)
        min_laplacian = min(min_laplacian, laplacian.lower)

        density = point(2) * p * (
            point(Fraction(4, 3))
            * (point(1) + curvature - point(Fraction(2, 3)) * flux_sq).square()
            + point(4) * flux_sq
            + point(Fraction(16, 135)) * flux_sq.square()
            + point(Fraction(2, 3)) * flux_derivative_sq
        )
        rounded = density.outward(scale)
        upper_sum += rounded.upper
        lower_sum += rounded.lower

    energy = Interval(lower_sum / cells, upper_sum / cells).outward(10**4)
    p_lower = Interval.point(min_p).outward(10**4).lower
    scalar_lower = Interval.point(min_scalar).outward(10**4).lower
    conformal_lower = Interval.point(min_conformal).outward(10**4).lower
    laplacian_lower = Interval.point(min_laplacian).outward(10**4).lower
    require(scalar_lower > 0, "Positive scalar curvature on the entire cap")
    require(conformal_lower > 0, "Positive conformal factor on the entire cap")
    require(laplacian_lower > 0, "Positive conformal Laplacian on the entire cap")
    require(energy.upper < 8, "Energy strictly below 8 pi^2")
    print(f"cells: {cells}")
    print(f"p >= {p_lower}")
    print(f"R >= {scalar_lower}")
    print(f"w >= {conformal_lower}")
    print(f"(-6 Delta_g + R_g)w >= {laplacian_lower}")
    print(f"e/pi^2 in [{energy.lower}, {energy.upper}]")
    print(f"(8 pi^2 - e)/pi^2 >= {8 - energy.upper}")


if __name__ == "__main__":
    main()
