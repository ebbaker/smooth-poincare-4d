#!/usr/bin/env python3
"""Enclose the GEO-E18 meridian area with integer interval arithmetic."""

from math import factorial, isqrt
from typing import NamedTuple


SCALE = 1 << 96
RADIAL_CELLS = 1024  # per inner region of the positive radial half
AXIAL_CELLS = 32


def ceil_div(numerator, denominator):
    return -(-numerator // denominator)


class Interval(NamedTuple):
    low: int
    high: int

    def __add__(self, other):
        return Interval(self.low + other.low, self.high + other.high)

    def __neg__(self):
        return Interval(-self.high, -self.low)

    def __sub__(self, other):
        return self + -other

    def __mul__(self, other):
        products = [a * b for a in self for b in other]
        return Interval(min(products) // SCALE, ceil_div(max(products), SCALE))

    def __truediv__(self, other):
        if other.low <= 0:
            raise ValueError("Interval division requires a positive denominator")
        reciprocals = Interval(
            SCALE**2 // other.high, ceil_div(SCALE**2, other.low)
        )
        return self * reciprocals

    def sqrt(self):
        if self.low < 0:
            raise ValueError("Interval square root requires a nonnegative argument")
        upper_radicand = self.high * SCALE
        upper_root = isqrt(upper_radicand)
        return Interval(
            isqrt(self.low * SCALE),
            upper_root + (upper_root**2 != upper_radicand),
        )


def rational(numerator, denominator=1):
    scaled = numerator * SCALE
    return Interval(scaled // denominator, ceil_div(scaled, denominator))


ZERO, ONE, TWO = rational(0), rational(1), rational(2)


def exp_endpoint(endpoint):
    if endpoint < -64 * SCALE:
        # e > 2 gives exp(x) < 2^-64 throughout the clipped tail.
        return Interval(0, SCALE >> 64)
    if endpoint < 0:
        return ONE / exp_endpoint(-endpoint)
    x = Interval(endpoint, endpoint)
    squarings = 0
    while x.high > SCALE // 2:
        x = x / TWO
        squarings += 1
    value = term = ONE
    for degree in range(1, 21):
        term = term * x / rational(degree)
        value = value + term
    tail = rational(2, 2**21 * factorial(21))
    value = Interval(value.low, value.high + tail.high)
    for _ in range(squarings):
        value = value * value
    return value


def exp(x):
    return Interval(exp_endpoint(x.low).low, exp_endpoint(x.high).high)


def log_endpoint(endpoint):
    x = Interval(endpoint, endpoint)
    y = (x - ONE) / (x + ONE)
    if max(abs(y.low), abs(y.high)) > rational(7, 10).low:
        raise ValueError("Logarithm series remainder requires |y| <= 7/10")
    y_squared = y * y
    total, term = ZERO, y
    for index in range(48):
        total = total + term / rational(2 * index + 1)
        term = term * y_squared
    total = TWO * total
    tail = rational(1, 10**15)  # exceeds 2(7/10)^97 / (97(1 - (7/10)^2))
    return Interval(total.low - tail.high, total.high + tail.high)


def log(x):
    return Interval(log_endpoint(x.low).low, log_endpoint(x.high).high)


def sin(x):
    if x.low < 0 or x.high > SCALE // 2:
        raise ValueError("Sine series remainder requires 0 <= x <= 1/2")
    x_squared = x * x
    total = term = x
    for index in range(1, 7):
        term = -term * x_squared / rational((2 * index) * (2 * index + 1))
        total = total + term
    tail = rational(1, 2**15 * factorial(15))
    return Interval(total.low - tail.high, total.high)


def arctan_inverse(n):
    total = ZERO
    for index in range(32):
        degree = 2 * index + 1
        total = total + rational((-1)**index, degree * n**degree)
    tail = rational(1, 65 * n**65)
    return Interval(total.low, total.high + tail.high)


PI = rational(16) * arctan_inverse(5) - rational(4) * arctan_inverse(239)
B = rational(1, 8).sqrt()
LOG_T = log(rational(65, 16).sqrt())


def cutoff(x):
    z = rational(32) * x - ONE
    if z.high <= 0:
        return ONE
    if z.low >= SCALE:
        return ZERO
    f_left = exp(-ONE / z)
    f_right = exp(-ONE / (ONE - z))
    return f_right / (f_left + f_right)


def radial_data(index):
    x = rational(index, 32 * RADIAL_CELLS)
    x_squared = x * x
    common = LOG_T + rational(31, 16) * x_squared
    germ = (common - B * x, common + B * x, -rational(67, 16) * x_squared)
    polar = TWO * log(sin(rational(1, 4) - x))
    return germ, polar, cutoff(x)


def squared_cofactors(left, right):
    germ_left, polar_left, chi_left = left
    germ_right, polar_right, chi_right = right
    germ_lower = (germ_right[0], germ_left[1], germ_right[2])
    germ_upper = (germ_left[0], germ_right[1], germ_left[2])
    result = []
    for low, high in zip(germ_lower, germ_upper):
        log_lower = chi_right * low + (ONE - chi_right) * polar_right
        log_upper = chi_left * high + (ONE - chi_left) * polar_left
        result.append(exp(TWO * Interval(log_lower.low, log_upper.high)))
    return tuple(result)


def axial_sum(m, q, weights, trapezoid):
    """Average sqrt(m(1-u^2)+qu^2) in u, with a one-sided quadrature."""
    if m < q or q <= 0:
        raise ValueError("Quadrature requires m >= q > 0")
    m, q = Interval(m, m), Interval(q, q)
    total = ZERO
    for weight in weights:
        total = total + (m * (ONE - weight) + q * weight).sqrt()
    if trapezoid:
        # Here the weights omitted the two end samples.
        total = total + (m.sqrt() + q.sqrt()) / TWO
    return total


def angular_average(cofactors, trapezoid_weights, midpoint_weights):
    c1, c2, c3 = cofactors
    low1 = axial_sum(c1.low, c3.low, trapezoid_weights, trapezoid=True)
    low2 = axial_sum(c2.low, c3.low, trapezoid_weights, trapezoid=True)
    mean_high = ceil_div(c1.high + c2.high, 2)
    high = axial_sum(mean_high, c3.high, midpoint_weights, trapezoid=False)
    lower = (low1 + low2) / TWO
    return Interval(lower.low, high.high) * rational(1, AXIAL_CELLS)


def enclose_area():
    # Both radial halves contribute equally, and the full angular measure is 4π.
    factor = rational(8) * PI
    trapezoid = [rational(i**2, AXIAL_CELLS**2) for i in range(1, AXIAL_CELLS)]
    midpoint = [
        rational((2 * i + 1)**2, (2 * AXIAL_CELLS)**2)
        for i in range(AXIAL_CELLS)
    ]
    inner = []
    left = radial_data(0)
    for start in (1, RADIAL_CELLS + 1):
        total = ZERO
        for index in range(start, start + RADIAL_CELLS):
            right = radial_data(index)
            cofactors = squared_cofactors(left, right)
            total = total + angular_average(cofactors, trapezoid, midpoint)
            left = right
        inner.append(factor * total * rational(1, 32 * RADIAL_CELLS))
    polar = rational(3, 16)
    ends = rational(4) * PI * (polar - sin(TWO * polar) / TWO)
    return (*inner, ends)


def format_enclosure(value, places=6):
    digits = 10**places
    lower = value.low * digits // SCALE
    upper = ceil_div(value.high * digits, SCALE)
    return (
        f"[{lower // digits}.{lower % digits:0{places}d}, "
        f"{upper // digits}.{upper % digits:0{places}d}]"
    )


if __name__ == "__main__":
    areas = enclose_area()
    total = sum(areas, ZERO)
    for name, bound in zip(("germ", "transition", "sine ends", "total"), (*areas, total)):
        print(f"{name:>10}  {format_enclosure(bound)}")
    if total.high - total.low >= rational(2, 5).low:
        raise ArithmeticError("Enclosure is wider than the requested tolerance")
