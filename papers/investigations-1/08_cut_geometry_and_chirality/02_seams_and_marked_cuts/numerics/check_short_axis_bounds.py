"""Exact coefficient and tolerance checks for B06, using rational arithmetic."""

from fractions import Fraction as F


def square_action(coefficient, rates):
    """Integrate a squared sum of decaying exponentials on a half-line."""
    return sum(
        a * b / F(rate_a + rate_b)
        for a, rate_a in zip(coefficient, rates)
        for b, rate_b in zip(coefficient, rates)
    ) / 96


def main():
    # The biaxial core has only the minus block; the annulus has only plus.
    assert square_action([48, -144], [2, 4]) == 9
    assert square_action([96, -96], [2, 4]) == 4
    assert F(3) - F(6**2, 4 * 27) == F(8, 3)
    assert F(3) - F(12**2, 4 * 18) == 1

    r = F(5, 8)
    gram = ((1 - r**2) / 4 - (1 - r**3) / 3 + (1 - r**4) / 8) / 4
    free = 1 + 2 * r - 3 * r**2
    assert (free, gram) == (F(69, 64), F(207, 131072))
    lower = (free - F(3, 5)) ** 2 / (96 * gram)
    assert lower == F(867, 575) == F(3, 2) + F(9, 1150)

    eta = F(1, 10**8)
    epsilon = F(1, 10**5)
    error = 4 * (400 * eta)**2 / 96
    error += 2 * epsilon * (48 * 4000 * epsilon + (4000 * epsilon)**2) / 96
    assert error < F(1, 10**6)
    assert 1 - 1501 * epsilon > 0 and 3 - 86 * eta > 0
    print("Sharp annular energy 4, opposite core energy 9 (units of pi squared)")
    print("Causal lower bound", lower)
    print("Finite trial energy error <", float(error) + 1e-14)


if __name__ == "__main__":
    main()
