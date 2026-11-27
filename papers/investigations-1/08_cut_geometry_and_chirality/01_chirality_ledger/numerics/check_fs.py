#!/usr/bin/env python3
"""Exact algebra check of the all-radius Fubini–Study ball ledger.

Each input is x = sin²(r) in (0, 1). Energies, volume, and the extrinsic
term are divided by π². With no arguments, check three distinct points.
The expressions are polynomials of degree at most two in x, since the
shape and area factors simplify as q² b² = x². Thus equality at the three
points verifies the reduced polynomial identities for every radius.
"""

import argparse
from fractions import Fraction


def pontryagin_cs_integral(fiber_stretch_squared):
    """Integral in the positive left frame, with dσ_i = 2σ_j∧σ_k."""
    v = fiber_stretch_squared
    vertical_connection = 2 - v
    trace_omega_domega = -4 * (2 * v + vertical_connection**2)
    two_thirds_trace_cubic = 4 * v * vertical_connection
    # The round left frame has volume 2π² and the p₁ factor is −1/(8π²).
    return -(trace_omega_domega + two_thirds_trace_cubic) / 4


def check(x):
    v = 1 - x
    eta = (pontryagin_cs_integral(v) - pontryagin_cs_integral(Fraction(1))) / 3
    shape_difference_squared = x / v
    fiber_radius_squared = x * v
    extrinsic = 4 * shape_difference_squared * fiber_radius_squared
    ball_volume = x**2 / 2
    chiral_energy_difference = 24 * ball_volume
    signature = 0
    ledger_sum = 12 * (signature + eta) + extrinsic

    assert eta == 2 * x**2 / 3
    assert extrinsic == 4 * x**2
    assert chiral_energy_difference == ledger_sum
    assert chiral_energy_difference != 12 * (signature + eta) - extrinsic
    print(f"{x}\t{ball_volume}\t{eta}\t{extrinsic}\t{chiral_energy_difference}\t{ledger_sum}")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("x", nargs="*", type=Fraction, help="rational sin²(r) in (0, 1)")
    args = parser.parse_args()
    samples = args.x or [Fraction(1, 4), Fraction(1, 2), Fraction(3, 4)]
    if any(not 0 < x < 1 for x in samples):
        parser.error("each x must be strictly between zero and one")
    print("sin²(r)\tVol/π²\teta\tT/π²\tΔE/π²\tledger/π²")
    for x in samples:
        check(x)
    if not args.x:
        print("The reduced quadratic identities hold for every radius in (0, π/2).")


if __name__ == "__main__":
    main()
