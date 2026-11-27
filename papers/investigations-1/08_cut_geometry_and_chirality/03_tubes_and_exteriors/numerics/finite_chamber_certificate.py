#!/usr/bin/env python3
"""Exact interval check of the one finite chamber interpolation in E21."""

from fractions import Fraction
import sys

sys.dont_write_bytecode = True
from trefoil_certificate import Interval, polynomial, require


def main():
    point = Interval.point
    zero = point(0)
    sqrt3 = Interval(Fraction(1732050807568877, 10**15),
                     Fraction(1732050807568878, 10**15))
    require(sqrt3.lower**2 < 3 < sqrt3.upper**2, "sqrt(3) enclosure")

    width = point(Fraction(1, 2))
    short = point(Fraction(11, 5))
    sine, cosine = point(Fraction(7, 25)), point(Fraction(24, 25))
    round_lengths = (point(4) * sine, point(2) * (sqrt3 * cosine - sine),
                     point(2) * (sqrt3 * cosine + sine))
    round_slopes = (point(4) * cosine, zero - point(2) * (sqrt3 * sine + cosine),
                    point(2) * (cosine - sqrt3 * sine))
    endpoint = (short, short, short * sqrt3)
    coefficients = []
    for length, slope, end in zip(round_lengths, round_slopes, endpoint):
        delta = end - length
        linear = width * slope
        coefficients.append((length, linear, point(3) * delta - point(2) * linear,
                             linear - point(2) * delta))
    derivatives = [tuple(point(k) * c[k] for k in range(1, 4)) for c in coefficients]
    second_derivatives = [
        tuple(point(k) * c[k] for k in range(1, 3)) for c in derivatives
    ]

    cells = 2048
    plus, minus, middle_minus = zero, zero, zero
    min_radius = Fraction(10)
    min_scalar = Fraction(10)
    cyclic = ((0, 1, 2), (1, 2, 0), (2, 0, 1))
    for cell in range(cells):
        x = Interval(Fraction(cell, cells), Fraction(cell + 1, cells))
        lengths = tuple(polynomial(c, x) for c in coefficients)
        min_radius = min(min_radius, *(a.lower for a in lengths))
        require(min_radius > 0, f"Positive radius on cell {cell}")
        shape = [polynomial(c, x) / (width * a) for c, a in zip(derivatives, lengths)]
        radial = [
            zero - polynomial(c, x) / (width.square() * a)
            for c, a in zip(second_derivatives, lengths)
        ]
        volume = lengths[0] * lengths[1] * lengths[2]
        structure = tuple(point(2) * a.square() / volume for a in lengths)
        connection = [
            (structure[j] + structure[k] - structure[i]) / point(2)
            for i, j, k in cyclic
        ]
        pair = []
        magnetic = []
        for i, j, k in cyclic:
            pair.append(radial[i] + connection[i] * structure[i]
                        - connection[j] * connection[k] - shape[j] * shape[k])
            magnetic.append(connection[k] * shape[j] + connection[j] * shape[k]
                            - structure[i] * shape[i])
        scalar = point(2) * sum(pair, zero)
        min_scalar = min(min_scalar, scalar.lower)
        electric = [entry / point(2) - scalar / point(12) for entry in pair]
        density_weight = width * volume / point(4)
        plus_density = density_weight * sum(
            ((e + m).square() for e, m in zip(electric, magnetic)), zero
        )
        minus_density = density_weight * sum(
            ((e - m).square() for e, m in zip(electric, magnetic)), zero
        )
        plus += plus_density.outward(10**8)
        minus += minus_density.outward(10**8)
        if cells // 8 <= cell < 7 * cells // 8:
            middle_minus += minus_density.outward(10**8)

    plus = (plus / point(cells)).outward(1000)
    minus = (minus / point(cells)).outward(1000)
    middle_minus = (middle_minus / point(cells)).outward(1000)
    min_scalar = point(min_scalar).outward(1000).lower
    min_radius = point(min_radius).outward(1000).lower
    require(min_scalar > 0, "Strict scalar lower bound on the entire interpolation")
    require(middle_minus.lower > 8, "Unchanged middle alone exceeds the band")
    print(f"cells: {cells}; radius >= {min_radius}; R >= {min_scalar}")
    print(f"E+/pi² in [{plus.lower}, {plus.upper}]")
    print(f"E-/pi² in [{minus.lower}, {minus.upper}]")
    print(f"middle E-/pi² in [{middle_minus.lower}, {middle_minus.upper}]")


if __name__ == "__main__":
    main()
