"""Exact arithmetic for the three round transports and E14's scalar control."""
from fractions import Fraction


def product(p, q):
    a, b, c, d = p
    e, f, g, h = q
    return (
        a * e - b * f - c * g - d * h,
        a * f + b * e + c * h - d * g,
        a * g - b * h + c * e + d * f,
        a * h + b * g - c * f + d * e,
    )


def inverse(q):
    a, b, c, d = q
    norm_squared = sum(x * x for x in q)
    return tuple(Fraction(x, norm_squared) for x in (a, -b, -c, -d))


def trace_of_commutator(p, q):
    return 2 * product(product(product(p, q), inverse(p)), inverse(q))[0]


def check_angular_integral():
    # Differentiate c log(1/e) plus the polynomial in e for 0 < e <= 1.
    log_coefficient = 12
    polynomial = {0: -11, 2: 18, 4: -9, 6: 2}
    derivative = {-1: -log_coefficient}
    for exponent, coefficient in polynomial.items():
        if exponent:
            derivative[exponent - 1] = exponent * coefficient

    # Negative cutoff derivative from t=e² and density 6(1-t)³/t.
    assert derivative == {-1: -12, 1: 36, 3: -36, 5: 12}
    assert sum(polynomial.values()) == 0  # integral at e=1


if __name__ == "__main__":
    # A nonzero real factor in either lifted quaternion cancels in the word.
    second = (0, 0, 1, 0)
    first = [(-1, 0, 0, 0), (1, 1, 0, 0), (0, 1, 0, 0)]
    traces = [trace_of_commutator(p, second) for p in first]
    assert traces == [2, 0, -2]
    check_angular_integral()
    print("Round traces: 2, 0, -2. Angular control: log coefficient 12, finite part -11.")
