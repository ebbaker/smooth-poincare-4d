"""Exact rational checks for the native long-cuff band bounds of 27 Nov 2026.

The proofs of the input inequalities and their relation to the scalar
quadratic form are in ../notes/HARMONIC_MARKING_ENCLOSURE_20261127.md.
Run with Python 3. No floating-point library or input mesh is required.
"""
from fractions import Fraction as F
from math import factorial


def switch_integral_lower_bound():
    """Sum interval lower bounds using exact integrals of a(1-a)."""
    total = F(0)
    floors = []
    for k in range(15):
        left, right = F(k, 16), F(k + 1, 16)
        weight = (right**2 - left**2) / 2 - (right**3 - left**3) / 3
        ratio = (1 - right) / (1 - right + F(7, 64) * right)
        denominator = (1 - F(2, 3) * left)**2 * (1 - F(6, 7) * left)**2
        contribution = F(2048 * 9, 441) * weight * ratio / denominator
        total += contribution
        floors.append(int(1000 * contribution))
    return total, floors


def verify():
    distance_upper = F(127, 50)
    distance_cosh_lower = sum(
        distance_upper**k / factorial(k) for k in range(0, 11, 2)
    )
    assert distance_cosh_lower**2 > F(81, 2)
    rho = F(87, 128)
    footprint_bound = 2 * distance_upper**2 / rho**2
    larger_disk_bound = 2 * distance_upper**2 / (rho - F(1, 6))**2
    assert footprint_bound < 28 and larger_disk_bound < 50
    assert 28 * (F(9, 8) / 16)**2 < F(1, 7)
    integral, floors = switch_integral_lower_bound()
    assert integral >= F(sum(floors), 1000) > 60
    assert sum(floors) == 60413
    print("Squared distance and both disk bounds verified.")
    print(f"Pure switching contribution > {sum(floors)}/1000 per band.")
    print("The full Rayleigh numerator includes additional terms.")


if __name__ == "__main__":
    verify()
