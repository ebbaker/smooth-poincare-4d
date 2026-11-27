"""Rational replay of the fixed-width lower bound in NATIVE_TRIAL_INTEGRATION."""

from fractions import Fraction as Q
from math import factorial


def exponential_bounds(value, degree=30):
    """Taylor sums and a geometric upper tail for a nonnegative argument."""
    assert 0 <= value < degree + 2
    partial = sum(value**k / factorial(k) for k in range(degree + 1))
    first_omitted = value ** (degree + 1) / factorial(degree + 1)
    return partial, partial + first_omitted / (1 - value / (degree + 2))


def odds_bounds(x):
    lower, upper = exponential_bounds(1 / x - 1 / (1 - x))
    return 1 / upper, 1 / lower


def check_pause_derivatives():
    exp_20_lower, _ = exponential_bounds(Q(20), degree=35)
    assert exp_20_lower > 480_000_000
    hp = Q("3.01") * 20**2 / exp_20_lower
    hpp = Q("3.34") * 20**4 / exp_20_lower
    assert 7 * hp < Q(".00002")
    assert 49 * (hpp / 6 + hp**2) < Q(".01")
    assert Q("1.08") / 16 + Q(".00002") / Q("1.28") < Q(".068")
    assert ((1 + Q("1.3")) / 16 + Q(".01") / Q("1.28")**2
            + Q(".00002") * Q("1.3") / Q("1.28")) < Q(".16")
    assert 28 * Q(".068")**2 + (Q(".91") / Q("1.28"))**2 < Q(".85")**2
    hess_q = 360 * Q(".068")**2 + Q("5.3") * Q(".16")
    hess_phi = Q(".16") + Q(".5") / Q("1.28")**2
    hess_theta = (Q("1.3") + 2 * Q(".068")) / Q("1.28")
    assert hess_q**2 + hess_phi**2 + hess_theta**2 < 3**2


def check_sectional_errors():
    t = Q(".025")
    j = Q(".85")
    hess = Q("4.5")
    z = Q(".096")
    assert odds_bounds(Q("0.2"))[1] < t
    assert (1 + t * j**2) * 28 / 256 < Q(".35")**2
    assert 28 * (Q("1.08") / 16)**2 < Q(".36")**2
    assert (Q(".39") - Q(".13")) / (2 * (1 + t * j**2)**3) > Q(".12")
    assert t * hess * j < z
    # Cross and diagonal first-connection terms for the four planes.
    planes = [(".510", ".36", ".362"), (".216", ".36", ".065"),
              (".153", ".065", ".362"), (".065", ".065", ".065")]
    linear = Q(0)
    quadratic = Q(0)
    for mixed, first, second in planes:
        cross, left, right = map(Q, (mixed, first, second))
        linear += z * (2 * cross + left + right)
        quadratic += cross**2 + left * right
    assert linear < Q(".35") and quadratic < Q(".53")
    assert 4 * (1 + t * j**4 + 2 * t * hess**2) + 8 * z**2 < 9
    assert 2 * Q("1.3") * j**2 + hess * (2*Q(".35") + j + Q(".36")) + linear < 11


def sectional_lower(x_left, x_right):
    slope = 16 * odds_bounds(x_right)[1] * (x_left**-2 + (1-x_right)**-2)
    factor = ((x_right**-2 + (1-x_left)**-2)**2
              - 2*x_left**-3 + 2*(1-x_left)**-3)
    assert factor > 0
    curvature = 256 * odds_bounds(x_left)[0] * factor
    return Q(".12") * curvature - 9 - 11 * slope - Q(".53") * slope**2


def verify():
    check_pause_derivatives()
    check_sectional_errors()
    floor = min(sectional_lower(Q(i, 1000), Q(i+1, 1000)) for i in range(150, 200))
    assert 135 < floor < 136
    chiral_floor = 130**2 * Q("1.28") / 3200
    assert chiral_floor == Q(169, 25) and 2 * chiral_floor > 8
    print(f"50 cells verified. Complete band c > {chiral_floor} pi^2.")
    print(f"Both closed chiral energies > {2 * chiral_floor} pi^2.")


if __name__ == "__main__":
    verify()
