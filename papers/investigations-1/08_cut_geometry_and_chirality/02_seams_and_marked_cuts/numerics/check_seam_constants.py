"""Exact arithmetic checks for the 27 November seam notes, for Edward B. Baker III.

OpenAI Codex assistance, input checkout bc2c1bbccc1d. See notes and reviews
for the geometric proofs. Only the listed rational identities are checked.
"""

from fractions import Fraction as Q


def check_cap_and_cover():
    # Coefficient of pi². Convert four-index square to a chiral half-sum.
    assert 100**2 * Q(4, 3) * Q(3, 2)**2 / 8 == 3750
    assert 2 * (1 - Q(1, 120)) == Q(119, 60)
    assert 2 * (1 - Q(1, 60)) == Q(59, 30)


def check_lens_half():
    cosine_radius = Q(8, 15)
    cosine_cap = Q(-8, 17)
    sine_cap = Q(15, 17)
    assert cosine_cap**2 + sine_cap**2 == 1
    assert -cosine_cap / sine_cap == cosine_radius
    half_cost = Q(2, 3) * (1 - cosine_cap)
    assert half_cost == Q(50, 51)
    # z=(1-cos s)/2. Check the exact supersolution slope surplus.
    z = (1 - cosine_cap) / 2
    coefficients = [Q(1)]
    for n in range(5):
        coefficients.append(coefficients[-1] * (Q(3, 5) + n*(n+1)) / (n+1)**2)
    value = sum(coef * z**n for n, coef in enumerate(coefficients))
    slope = sine_cap/2 * sum(n*coef*z**(n-1) for n, coef in enumerate(coefficients) if n)
    assert slope - cosine_radius*value == Q(85090847, 43618007040)
    # Unit-base marked flux estimate in units of T, at the same radius.
    area_factor = 2 * (1 - cosine_cap)
    paired_lower = Q(2, 3)*area_factor + Q(2, 9)/area_factor
    assert paired_lower == 2*half_cost + Q(17, 225)
    assert 2*half_cost < 2 < paired_lower


if __name__ == "__main__":
    check_cap_and_cover()
    check_lens_half()
    print("Exact cap, cover, lens sign and unit-curvature flux arithmetic passed.")
