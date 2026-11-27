#!/usr/bin/env python3
"""Exact arithmetic check of the quaternionic signature eta formula.

The three entries are positive squared lengths in the unit round frame.
The input with no arguments checks the two homogeneous cubic identities
after setting C=1. The grid has four A values with respectively 4, 3, 2,
and 1 different B values. A polynomial of total degree at most three
vanishing on the grid vanishes first on the A=1 line. Dividing out A−1
and repeating proves it is identically zero. Homogeneity restores C>0.
"""

import argparse
from fractions import Fraction
from math import prod


def check(axes):
    a, b, c = axes
    s1 = a + b + c
    s2 = a * b + b * c + c * a
    s3 = a * b * c
    connection_numerators = [2 * axis - s1 for axis in axes]
    frame_numerator = sum(
        axis * numerator**2 for axis, numerator in zip(axes, connection_numerators)
    ) + prod(connection_numerators)
    schur_numerator = s1**3 - 4 * s1 * s2 + 9 * s3

    assert frame_numerator == 2 * (schur_numerator + s3)
    assert schur_numerator == (a - b)**2 * (a + b - c) + c * (a - c) * (b - c)

    eta_from_frame = -Fraction(3, 4) - (frame_numerator / s3 - 2) / 24
    assert eta_from_frame == -Fraction(3, 4) - schur_numerator / (12 * s3)
    assert eta_from_frame <= -Fraction(3, 4)
    assert (eta_from_frame == -Fraction(3, 4)) == (a == b == c)
    return eta_from_frame


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--axes", nargs=3, type=Fraction, metavar=("A", "B", "C"))
    args = parser.parse_args()
    if args.axes:
        if any(axis <= 0 for axis in args.axes):
            parser.error("the squared lengths must be positive")
        print(f"eta = {check(args.axes)}")
        return

    for a in range(1, 5):
        for b in range(1, 6 - a):
            check((Fraction(a), Fraction(b), Fraction(1)))
    print("Both homogeneous cubic identities hold on the positive cone.")
    for v in [Fraction(1, 4), Fraction(1), Fraction(4)]:
        eta = check((Fraction(1), Fraction(1), v))
        assert eta == -Fraction(3, 4) - (1 - v)**2 / 12
        print(f"A=B=1, C={v}: eta = {eta}")


if __name__ == "__main__":
    main()
