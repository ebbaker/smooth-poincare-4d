#!/usr/bin/env python3
"""Exact rational certificates and floating stationarity checks for check_02 rows 1–3."""

from dataclasses import dataclass
from fractions import Fraction
from math import pi, sqrt

import numpy as np


@dataclass(frozen=True)
class Interval:
    lo: Fraction
    hi: Fraction

    @staticmethod
    def point(number):
        return Interval(Fraction(number), Fraction(number))

    def __add__(self, other):
        other = interval(other)
        return Interval(self.lo + other.lo, self.hi + other.hi)

    __radd__ = __add__

    def __neg__(self):
        return Interval(-self.hi, -self.lo)

    def __sub__(self, other):
        return self + -interval(other)

    def __rsub__(self, other):
        return interval(other) + -self

    def __mul__(self, other):
        other = interval(other)
        products = [a * b for a in (self.lo, self.hi) for b in (other.lo, other.hi)]
        return Interval(min(products), max(products))

    __rmul__ = __mul__

    def __truediv__(self, other):
        other = interval(other)
        assert other.lo > 0
        return self * Interval(1 / other.hi, 1 / other.lo)

    def __pow__(self, exponent):
        result = Interval.point(1)
        for _ in range(exponent):
            result *= self
        return result


def interval(value):
    return value if isinstance(value, Interval) else Interval.point(value)


def bounds(lo, hi):
    return Interval(Fraction(lo), Fraction(hi))


def arctan_reciprocal(q):
    # The alternating sums with 24 and 25 terms bracket arctan(1/q).
    terms = [Fraction((-1)**k, (2*k + 1)*q**(2*k + 1)) for k in range(25)]
    return Interval(sum(terms[:24]), sum(terms))


def area_certificate(b, f, multiplier, root, energy):
    d, c = 1 - f, 1 + f
    c0, c1 = -3 * multiplier * b**2, 4 * multiplier * b * c
    m = d**2 + multiplier * c**2

    def polynomial(x):
        return x**4 - m * x**2 + c1 * x + c0

    bernstein = [c0, c0 + c1 / 4, c0 + c1 / 2 - m / 6,
                 c0 + 3 * c1 / 4 - m / 2, polynomial(1)]
    assert max(coefficient.hi for coefficient in bernstein) < 0
    assert m.hi < 6  # P'' positive for x >= 1
    assert polynomial(root.lo).hi < 0 < polynomial(root.hi).lo
    cost = Fraction(4, 3) * (root + 2*d + d**2/root + multiplier*(b-c*root)**2/root**3)
    assert energy.lo < cost.lo <= cost.hi < energy.hi

    # K is decreasing, and its value at the right edge of the whole interval
    # is positive even before replacing it by its final cell midpoint value.
    slope = 2 * multiplier * (b - c*root) / root**3
    assert slope.hi < 0
    assert (d/root + slope*root/2).lo > 0


def mesh_values(variables):
    """Cost and endpoint state using exact constant-K flows and cell integrals."""
    curvature, length = variables[:-1], variables[-1]
    cell_length = length / len(curvature)
    a, ap, cost = 0.0, 1.0, 0.0
    for k in curvature:
        w = np.sqrt(k)
        c = np.cos(w * cell_length)
        sn = np.sin(w * cell_length) / w
        area = a*sn + ap * (2*np.sin(0.5*w*cell_length)**2 / k)
        cost += (4/3) * (1+k)**2 * area
        a, ap = c*a + sn*ap, c*ap - k*sn*a
    return np.array([cost, a, ap])


def mesh_stationary(a_end, f_end, x_end, cells=24):
    """Newton solve for an interior KKT point on the equal-s mesh."""
    c2 = (3*a_end**2 - (4 + 2*f_end)*x_end) / x_end**2
    c3 = 2*((1+f_end)*x_end - a_end**2) / x_end**3
    nodes, weights = np.polynomial.legendre.leggauss(32)

    def arc(x):
        t = sqrt(x) * (nodes + 1) / 2
        return sqrt(x) * np.dot(weights, 1/np.sqrt(2 + c2*t**2 + c3*t**4))

    length = arc(x_end)
    midpoint_areas = []
    for index in range(cells):
        target = length*(index + 0.5)/cells
        left, right = 0, x_end
        for _ in range(52):
            middle = (left + right)/2
            if arc(middle) < target:
                left = middle
            else:
                right = middle
        midpoint_areas.append((left + right)/2)
    initial = np.r_[-c2-3*c3*np.array(midpoint_areas), length]

    def gradient(x):
        samples = x + 1e-28j*np.eye(len(x))
        return np.array([mesh_values(sample).imag/1e-28 for sample in samples]).T

    def residual(y):
        x, multipliers = y[:-2], y[-2:]
        grad = gradient(x)
        return np.r_[grad[0] + multipliers @ grad[1:],
                     mesh_values(x)[1:] - [a_end, f_end]]

    grad = gradient(initial)
    y = np.r_[initial, np.linalg.lstsq(grad[1:].T, -grad[0], rcond=None)[0]]
    for _ in range(8):
        res = residual(y)
        if np.linalg.norm(res, ord=np.inf) < 2e-11:
            break
        steps = 3e-5*np.eye(len(y))
        jacobian = np.column_stack([(residual(y+h)-residual(y-h)) / 6e-5 for h in steps])
        y -= np.linalg.solve(jacobian, res)
    x = y[:-2]
    error = np.linalg.norm(residual(y), ord=np.inf)
    assert error < 2e-11
    assert 0 < min(x[:-1]) <= max(x[:-1]) < 6
    assert 0.05 < x[-1] < 14
    assert all(np.sqrt(x[:-1])*x[-1]/cells < pi/2)
    # Each cell then has at most one zero. Positive right endpoint samples,
    # with a(0)=0 and a'(0)=1, ensure positive a on the whole cap.
    assert all(value > 0 for value in mesh_node_radii(x))
    return mesh_values(x)[0], x[-1], min(x[:-1]), max(x[:-1]), error, length


def mesh_node_radii(variables):
    a, ap = 0.0, 1.0
    cell_length = variables[-1] / (len(variables)-1)
    for k in variables[:-1]:
        w = np.sqrt(k)
        c, sn = np.cos(w*cell_length), np.sin(w*cell_length)/w
        a, ap = c*a + sn*ap, c*ap - k*sn*a
        yield a


if __name__ == "__main__":
    pi_interval = 16*arctan_reciprocal(5) - 4*arctan_reciprocal(239)
    sqrt_three = bounds("1.73205080756887729352", "1.73205080756887729354")
    assert sqrt_three.lo**2 < 3 < sqrt_three.hi**2
    ell2 = interval("3.8") / (2*pi_interval)
    ell3 = interval("2.3") / (2*pi_interval)

    rows = [
        ("hemisphere", interval(1), interval(0), 1.0, "5.3333", None),
        ("pi/3", 4*ell2**2/3, -ell2/sqrt_three, 1.1836378439912079, "7.4196", [
            ("1.18363784398", "1.18363784400", "7.41917470", "7.41917471"),
            ("1.18331087387", "1.18331087389", "7.41950973", "7.41950974"),
        ]),
        ("pi/4", 2*ell3**2, -ell3, 1.3933978616052878, "7.8475", [
            ("1.39339786159", "1.39339786162", "7.84619264", "7.84619265"),
            ("1.39345713517", "1.39345713520", "7.84716627", "7.84716629"),
        ]),
    ]
    for name, b, f, area_guess, printed_cost, certificates in rows:
        if certificates:
            for grid, multiplier, (xl, xh, el, eh) in zip(
                    ("continuum", "24 equal-area cells"), (3, Fraction(1728, 575)), certificates):
                area_certificate(b, f, multiplier, bounds(xl, xh), bounds(el, eh))
                print(f"{name:10s} {grid:20s} x in [{xl}, {xh}], cost in [{el}, {eh}]")
        cost, length, k_min, k_max, residual, limit = mesh_stationary(
            sqrt(float((b.lo + b.hi)/2)), float((f.lo + f.hi)/2), area_guess)
        assert format(cost, ".4f") == printed_cost
        print(f"{name:10s} 24 equal-s cells: cost {cost:.10f}, S {length:.8f}, "
              f"K [{k_min:.7f}, {k_max:.7f}], KKT residual {residual:.2e}, "
              f"continuum S {limit:.8f}")
