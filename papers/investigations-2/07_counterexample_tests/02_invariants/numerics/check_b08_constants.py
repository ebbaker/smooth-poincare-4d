"""Exact rational checks for the frozen E33 gap; run with Python 3 (no packages)."""

from fractions import Fraction
from itertools import product


def dyadic(exponent):
    return Fraction(2) ** exponent


def check_test_tensor():
    # Diagonal bilinear form on two-forms. Antisymmetrize its two index pairs.
    sectional = {(0, 1): 1, (2, 3): 1, (0, 2): -1, (1, 3): -1}

    def weyl(i, k, j, l):
        if i == k or j == l or {i, k} != {j, l}:
            return 0
        sign = (1 if i < k else -1) * (1 if j < l else -1)
        return sign * sectional.get(tuple(sorted((i, k))), 0)

    for k, l in product(range(4), repeat=2):
        assert sum(weyl(i, k, i, l) for i in range(4)) == 0
    assert sum(weyl(*indices) ** 2 for indices in product(range(4), repeat=4)) == 16
    assert 2 * (weyl(1, 0, 1, 0) - weyl(2, 0, 2, 0)) == 4
    normalized_pairing = Fraction(4, 72 * 3**6) * Fraction(3, 8)
    assert normalized_pairing == Fraction(1, 34992) > dyadic(-16)


def check_bounds():
    a = dyadic(-256)
    amplitude = a**4
    distortion = amplitude * a**2
    assumed_r = dyadic(-40) * distortion * a
    # Physical volume V=(V_round/16)(1+d). The two cap integration bounds.
    volume_low = Fraction(3 + 4, 6) * Fraction(3, 4)
    volume_high = Fraction(2 * 8 * 16 * 2**6, 6) * Fraction(3, 4)
    assert volume_low == Fraction(7, 8) and volume_high == 2048
    assert volume_high * a**6 <= Fraction(1, 16)

    # Crude mean bound suffices for the single frozen amplitude.
    round_excess = 25000 * (distortion**2 + assumed_r**2)
    mean_bound = 4096 * a**6
    assert 380 * (round_excess + mean_bound**2) <= dyadic(40) * a**12
    assert dyadic(20) * a**6 <= a**2

    # Local L2,L4,L4 Hölder bound: 10*5*4*3^(1/4) < 512.
    assert 3 * (10 * 5 * 4) ** 4 < 512**4
    derivative_error = dyadic(40) * a**12
    gram_error = 512 * a**3 * assumed_r
    pairing_upper = 128 * (
        derivative_error
        + 2 * distortion * (dyadic(20) * a**6 + derivative_error / 4)
        + (1 + distortion) * gram_error
    )
    simple_upper = dyadic(49) * a**12 + dyadic(17) * a**3 * assumed_r
    assert pairing_upper <= simple_upper < dyadic(-16) * amplitude * a**6
    assert assumed_r**2 == dyadic(-3664)
    # Uniform moment absorption in the amplitude control.
    assert (32 * a**2) ** 2 <= Fraction(1, 384)
    assert 10 * 50000 + 1520 * 36 * distortion**2 * a**8 <= dyadic(40)
    # Upper spinor control. pi < 22/7 gives 4*sqrt(2)*pi < 18.
    assert Fraction(9, 1024) > distortion**2 * a**4
    assert 32 * Fraction(22, 7) ** 2 < 18**2


if __name__ == "__main__":
    check_test_tensor()
    check_bounds()
    print("PASS: TT contraction, physical volume, local pairing, and spinor upper constants.")
    print("At a=2^-256: 2^-3664 <= b(g) < 18 * 2^-3584.")
