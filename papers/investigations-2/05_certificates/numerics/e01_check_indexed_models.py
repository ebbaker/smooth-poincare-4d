#!/usr/bin/env python3
"""Check finite models on the rewritten Sections 7–8 inputs only.

The geometry and versioned word transcription are external to these checks.
No coset enumeration or repository search code is used.
"""


def compose(left, right):
    return tuple(left[i] for i in right)


def value(word, generators):
    points = range(len(generators[0]))
    result = tuple(points)
    for letter in word:
        permutation = generators[abs(letter) - 1]
        if letter < 0:
            permutation = tuple(permutation.index(i) for i in points)
        result = compose(result, permutation)
    return result


def verify_even():
    identity = (0, 1, 2)
    x1 = (1, 0, 2)
    x2 = (0, 2, 1)
    x3 = (2, 1, 0)
    generators = (x1, x2, x3)
    for meridian in (1, 2, 3):
        assert value((meridian, meridian), generators) == identity
    for sign in (-1, 1):
        relators = (
            (-2, -sign, 3, sign),
            (-3, -2 * sign, 1, 2 * sign),
            (-1, -3 * sign, 2, 3 * sign),
        )
        assert all(value(relator, generators) == identity for relator in relators)
    normal_forms = [
        (1, 2) * exponent + (1,) * parity
        for exponent in range(3)
        for parity in range(2)
    ]
    assert len({value(word, generators) for word in normal_forms}) == 6
    return len(normal_forms)


def verify_odd():
    identity = tuple(range(8))
    generator = tuple((i + 1) % 8 for i in identity)
    meridian = (-1,) * 4
    assert value(meridian, (generator,)) != identity
    assert value(meridian * 2, (generator,)) == identity
    assert len({value((1,) * exponent, (generator,)) for exponent in range(8)}) == 8
    return len(identity)


def determinant(rows):
    (a, b, c), (d, e, f), (g, h, i) = rows
    return a * (e * i - f * h) - b * (d * i - f * g) + c * (d * h - e * g)


def verify_abelianization(slope, singular_order):
    # Columns are the meridians of J, W', and the clasp belt.
    rows = ((3, 0, -1), (0, singular_order, 0), (-1, 1, slope))
    order = abs(determinant(rows))
    images = (1, 1 - 3 * slope, 3)
    assert order == singular_order * abs(3 * slope - 1)
    for row in rows:
        assert sum(coefficient * image for coefficient, image in zip(row, images)) % order == 0
    return order


if __name__ == "__main__":
    print("Rewritten-input checks only. Coset enumerations: 0.")
    for slope, group_order in ((0, verify_even()), (-1, verify_odd())):
        underlying_order = verify_abelianization(slope, 1)
        abelian_order = verify_abelianization(slope, 2)
        print(f"s={slope}: model order {group_order}, underlying H1 order {underlying_order}, "
              f"orbifold H1 order {abelian_order}")
