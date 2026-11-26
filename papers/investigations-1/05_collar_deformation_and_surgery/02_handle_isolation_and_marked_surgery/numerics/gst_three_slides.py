"""Exact real-part checks for the two quaternion maps in GST_THIRD_SLIDE_QUOTIENTS."""

from fractions import Fraction
from itertools import product
from math import gcd, isqrt


RELATORS = ("yxyXYX", "xxxxYYY")
VECTORS = ((-1, 1), (4, -3))
# The tuple gives d, the integer numerators in the basis (1, i, sqrt(d) j,
# sqrt(d) k), then the squared positive denominators for x and y.
MAPS = (
    (11, (1, -1, 0, 0), (2, 1, 1, 0), 2, 16),
    (39, (6, 5, 0, 1), (6, 5, 0, -1), 100, 100),
)


def multiply(u, v, d):
    a, b, c, e = u
    h, i, j, k = v
    return (
        a * h - b * i - d * (c * j + e * k),
        a * i + b * h + d * (c * k - e * j),
        a * j - b * k + c * h + e * i,
        a * k + b * j - c * i + e * h,
    )


def conjugate(u):
    a, b, c, e = u
    return (a, -b, -c, -e)


def evaluate(word, representation):
    d, x, y, x_norm, y_norm = representation
    images = {"x": x, "X": conjugate(x), "y": y, "Y": conjugate(y)}
    norms = {"x": x_norm, "X": x_norm, "y": y_norm, "Y": y_norm}
    numerator = (1, 0, 0, 0)
    denominator_squared = 1
    for letter in word:
        numerator = multiply(numerator, images[letter], d)
        denominator_squared *= norms[letter]
    return numerator, denominator_squared


def normalized(v):
    p, q = v
    return v if p > 0 or (p == 0 and q > 0) else (-p, -q)


def christoffel(v):
    p, q = v
    a, b = abs(p), abs(q)
    assert gcd(a, b) == 1
    length = a + b
    x = "x" if p > 0 else "X"
    y = "y" if q > 0 else "Y"
    return "".join(
        y if (i + 1) * b // length > i * b // length else x
        for i in range(length)
    )


def row_sum(a, b, sign):
    return tuple(t + sign * s for t, s in zip(a, b))


def third_vectors(first):
    second = 1 - first
    vectors = set()
    for third, signs in product((first, second), product((-1, 1), repeat=3)):
        rows = list(VECTORS)
        for moving, sign in zip((first, second, third), signs):
            rows[moving] = row_sum(rows[moving], rows[1 - moving], sign)
        vectors.add(normalized(rows[third]))
    return sorted(vectors)


def real_squared(word, representation):
    numerator, denominator_squared = evaluate(word, representation)
    return Fraction(numerator[0] ** 2, denominator_squared)


def main():
    for first, representation in enumerate(MAPS):
        d, x, y, x_norm, y_norm = representation
        for u, norm in ((x, x_norm), (y, y_norm)):
            assert multiply(u, conjugate(u), d) == (norm, 0, 0, 0)
        stationary = 1 - first
        identity, norm = evaluate(RELATORS[stationary], representation)
        assert identity == (isqrt(norm), 0, 0, 0) and isqrt(norm) ** 2 == norm

        square = real_squared(RELATORS[first], representation)
        threshold = 2 * square - 1
        assert threshold > 0
        single_vectors = [
            normalized(row_sum(VECTORS[first], VECTORS[stationary], k))
            for k in range(-3, 4)
        ]
        single_max = max(
            real_squared(christoffel(v), representation) for v in single_vectors
        )
        assert single_max < square
        print(f"{'RS'[first]} first: c^2={square}, threshold={threshold}")
        print(f"  maximum one-copy candidate real-part square: {single_max}")

        for v in third_vectors(first):
            word = christoffel(v)
            numerator, norm = evaluate(word, representation)
            denominator = isqrt(norm)
            assert denominator ** 2 == norm
            real = Fraction(numerator[0], denominator)
            assert real < threshold
            print(f"  {v}  {word}  real part {real}")


if __name__ == "__main__":
    main()
