#!/usr/bin/env python3
"""Replay the ZERO-E05 fixed-point enclosures. Requires NumPy."""

import argparse
from dataclasses import dataclass
from fractions import Fraction as Q
from itertools import combinations
from math import isqrt

import numpy as np


SCALE = 1 << 20
LIMIT = (1 << 63) - 1
EPSILON = Q(1, 64)
CENTERS = [(Q(0),) * 4]
CENTERS += [tuple(Q(i + 1, i + 2) if j == i else Q(0) for j in range(4))
            for i in range(4)]
CASES = {
    "A": (Q(-3, 4), (16, 8, 4, 2, 1)),
    "B": (Q(3, 4), (16, -8, 4, -2, 1)),
}
TRANSVERSE_PAIRS = tuple(combinations(range(1, 4), 2))
HESSIAN_DERIVATIVES = [(i, i) for i in range(1, 4)] + list(TRANSVERSE_PAIRS)
DERIVATIVES = [()] + [(i,) for i in range(1, 4)] + HESSIAN_DERIVATIVES


def down(x):
    x = Q(x) * SCALE
    return x.numerator // x.denominator


def up(x):
    return -down(-x)


def magnitude(x):
    return max(int(np.max(x, initial=0)), -int(np.min(x, initial=0)))


def product(a, b):
    if magnitude(a) * magnitude(b) > LIMIT:
        raise OverflowError("fixed-point product")
    return a * b


def add(a, b):
    if magnitude(a) + magnitude(b) > LIMIT:
        raise OverflowError("fixed-point sum")
    return a + b


@dataclass(frozen=True)
class Interval:
    lo: np.ndarray | np.int64
    hi: np.ndarray | np.int64

    @classmethod
    def constant(cls, x):
        return cls(np.int64(down(x)), np.int64(up(x)))

    def __add__(self, other):
        return Interval(add(self.lo, other.lo), add(self.hi, other.hi))

    def __neg__(self):
        return Interval(-self.hi, -self.lo)

    def __sub__(self, other):
        return self + (-other)

    def __mul__(self, other):
        p = product(self.lo, other.lo)
        q = product(self.lo, other.hi)
        r = product(self.hi, other.lo)
        s = product(self.hi, other.hi)
        low = np.minimum(np.minimum(p, q), np.minimum(r, s))
        high = np.maximum(np.maximum(p, q), np.maximum(r, s))
        return Interval(low // SCALE, -((-high) // SCALE))

    def positive(self):
        return Interval(np.maximum(0, self.lo), np.maximum(0, self.hi))

    def square(self):
        lo_squared = product(self.lo, self.lo)
        hi_squared = product(self.hi, self.hi)
        low = np.where((self.lo <= 0) & (self.hi >= 0), 0,
                       np.minimum(lo_squared, hi_squared))
        high = np.maximum(lo_squared, hi_squared)
        return Interval(low // SCALE, -((-high) // SCALE))

    def reciprocal(self):
        if np.min(self.lo) <= 0:
            raise ValueError("reciprocal requires a positive interval")
        return Interval(SCALE**2 // self.hi, -((-SCALE**2) // self.lo))


ZERO = Interval.constant(0)
ONE = Interval.constant(1)
TWO = Interval.constant(2)
THIRD = Interval.constant(Q(1, 3))


def h(x, derivative):
    r = abs(x)
    sign = 1 if x >= 0 else -1
    if r <= 1:
        return (1 - Q(3, 2) * r**2 + Q(3, 4) * r**3,
                sign * (-3 * r + Q(9, 4) * r**2),
                -3 + Q(9, 2) * r)[derivative]
    if r <= 2:
        return ((2 - r)**3 / 4, -sign * Q(3, 4) * (2 - r)**2,
                Q(3, 2) * (2 - r))[derivative]
    return Q(0)


def profile_cells(edges, center, derivative):
    breaks = (-2, -1, 0, 1, 2, Q(-2, 3), Q(2, 3))
    bounds = []
    for left, right in zip(edges, edges[1:]):
        left, right = left - center - EPSILON, right - center + EPSILON
        points = [left, right] + [k for k in breaks if left <= k <= right]
        values = [h(Q(x), derivative) for x in points]
        bounds.append((down(min(values)), up(max(values))))
    lo, hi = np.asarray(bounds, dtype=np.int64).T
    return Interval(lo, hi)


def slab_profile(tables, weights, slices):
    fields = dict.fromkeys(DERIVATIVES, ZERO)
    for factors, weight in zip(tables, weights):
        block = []
        for axis, levels in enumerate(factors):
            shape = tuple(-1 if i == axis else 1 for i in range(4))
            block.append([
                Interval(level.lo[slices[axis]].reshape(shape),
                         level.hi[slices[axis]].reshape(shape))
                for level in levels
            ])
        for derivative in DERIVATIVES:
            term = weight
            for axis, levels in enumerate(block):
                term = term * levels[derivative.count(axis)]
            fields[derivative] = fields[derivative] + term
    return fields


def slab_curvature(fields, t):
    f = fields[()]
    product_tf = Interval.constant(t) * f
    # The sum of absolute weights is 1 and 0 <= h * rho <= 1.
    absolute_limit = down(abs(t))
    product_tf = Interval(np.maximum(-absolute_limit, product_tf.lo),
                          np.minimum(absolute_limit, product_tf.hi))
    if t < 0:
        # A uses nonnegative weights.
        product_tf = Interval(product_tf.lo, np.minimum(0, product_tf.hi))
    denominator = ONE - product_tf
    a = (ONE + product_tf) * denominator.reciprocal()
    inv_a = a.reciprocal()
    inv_d = denominator.reciprocal()
    inv_d2 = inv_d.square()
    alpha = Interval.constant(2 * t) * inv_d2
    beta = Interval.constant(4 * t**2) * inv_d2 * inv_d

    hessian = {
        (i, j): alpha * fields[i, j] + beta * fields[i,] * fields[j,]
        for i, j in HESSIAN_DERIVATIVES
    }
    trace = sum((hessian[i, i] for i in range(1, 4)), ZERO)
    centered_diagonal = sum(((hessian[i, i] - hessian[j, j]).square()
                             for i, j in TRANSVERSE_PAIRS), ZERO) * THIRD
    off_diagonal = sum((hessian[pair].square() for pair in TRANSVERSE_PAIRS), ZERO)
    energy = (centered_diagonal + TWO * off_diagonal) * inv_a
    scalar = trace.positive().square()
    potential = sum(((alpha * fields[i,]).square() for i in range(1, 4)), ZERO)
    potential = potential * inv_a
    return a, inv_a, energy, scalar, potential


def checked_sum(field):
    if magnitude(field) * field.size > LIMIT:
        raise OverflowError("fixed-point block sum")
    return int(np.sum(field, dtype=np.int64))


def integrate(case, n):
    t, weights = CASES[case]
    edges = [Q(-3) + Q(6, n) * j for j in range(n + 1)]
    tables = [
        [[profile_cells(edges, center[axis], order) for order in range(3)]
         for axis in range(4)]
        for center in CENTERS
    ]
    weights = [Interval.constant(Q(weight, 31)) for weight in weights]
    m0 = m1 = SCALE
    energy_lo = energy_hi = scalar_hi = potential_hi = 0
    for i in range(n):
        for j in range(0, n, 8):
            slices = (slice(i, i + 1), slice(j, j + 8), slice(None), slice(None))
            a, inv_a, energy, scalar, potential = slab_curvature(
                slab_profile(tables, weights, slices), t
            )
            m0 = min(m0, int(np.min(inv_a.lo)))
            m1 = min(m1, int(np.min(a.lo)))
            energy_lo += checked_sum(energy.lo)
            energy_hi += checked_sum(energy.hi)
            scalar_hi += checked_sum(scalar.hi)
            potential_hi += checked_sum(potential.square().hi)
    cell_factor = Q(6, n)**4 / SCALE
    return {
        "m0": Q(m0, SCALE),
        "m1": Q(m1, SCALE),
        "energy_low": energy_lo * cell_factor,
        "energy_high": energy_hi * cell_factor,
        "scalar_high": scalar_hi * cell_factor,
        "potential_high": potential_hi * cell_factor,
    }


def atan_partial(x, terms):
    return sum((-1)**j * x**(2 * j + 1) / (2 * j + 1) for j in range(terms))


def pi_bounds():
    # Machin's identity and the alternating arctangent series.
    small, tiny = Q(1, 5), Q(1, 239)
    low, high = Q(314159, 100000), Q(314160, 100000)
    assert low < 16 * atan_partial(small, 6) - 4 * atan_partial(tiny, 3)
    assert high > 16 * atan_partial(small, 7) - 4 * atan_partial(tiny, 2)
    return low, high


def sqrt_low(x):
    scale = 100000
    scaled = x * scale**2
    return Q(isqrt(scaled.numerator // scaled.denominator), scale)


def sqrt_high(x):
    return sqrt_low(x) + Q(1, 100000)


def fourth_low(x):
    return sqrt_low(sqrt_low(x))


def certify(bounds, case):
    pi_low, pi_high = pi_bounds()
    inv_s2 = 8 * pi_low / sqrt_high(Q(6))
    m0, m1 = bounds["m0"], bounds["m1"]
    scalar_norm = sqrt_high(bounds["scalar_high"])
    potential_norm = sqrt_high(bounds["potential_high"])
    lam = Q(24, 7)
    direct = 6 * min(m0, m1) * inv_s2 - 2 * scalar_norm
    gradient = fourth_low(6 * m0 * ((6 - lam) * m1)**3) * inv_s2 - (4 / lam) * potential_norm
    chosen = gradient if case == "A" else direct
    ratio_high = bounds["energy_high"] / (16 * pi_low**2)
    return {
        "ratio_low": bounds["energy_low"] / (16 * pi_high**2),
        "ratio_high": ratio_high,
        "direct_numerator_low": direct,
        "gradient_numerator_low": gradient,
        "yamabe_low": sqrt_low(m0) * chosen if chosen > 0 else "inconclusive",
        "subcritical": ratio_high < 2,
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("case", choices=CASES)
    parser.add_argument("n", type=int, choices=(16, 32, 64, 128))
    args = parser.parse_args()
    bounds = integrate(args.case, args.n)
    for key, value in bounds.items():
        print(f"{key} {value}")
    for key, value in certify(bounds, args.case).items():
        print(f"{key} {value}")


if __name__ == "__main__":
    main()
