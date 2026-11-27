#!/usr/bin/env python3
"""Check the two marked diagram transitions with exact pair arithmetic."""

IDENTITY = ((2, 0, 0, 0), 0, 0)
J = ((1, 1, 1, 1), 0, 1)
FIRST_CHORD = ((2, 0, 0, 0), 10, 0)
SECOND_CHORD = ((0, 0, 0, 2), 16, 0)
FIRST_EXIT = ((-1, 1, -1, -1), 11, 0)
SECOND_EXIT = ((0, 0, 0, -2), 9, 1)


def compose(first, second):
    """Compose (A,z^r j^b) pairs; store twice the coefficients of A."""
    (a, b, c, d), rotation, parity = first
    (w, x, y, z), next_rotation, next_parity = second
    numerator = (
        a * w - b * x - c * y - d * z,
        a * x + b * w + c * z - d * y,
        a * y - b * z + c * w + d * x,
        a * z + b * y - c * x + d * w,
    )
    assert all(entry % 2 == 0 for entry in numerator)
    central_sign = -1 if parity and next_parity else 1
    left = tuple(central_sign * entry // 2 for entry in numerator)
    right_rotation = rotation + (-1) ** parity * next_rotation
    return left, right_rotation % 17, (parity + next_parity) % 2


def inverse(element):
    (a, b, c, d), rotation, parity = element
    if parity:
        return (-a, b, c, d), rotation, 1
    return (a, -b, -c, -d), (-rotation) % 17, 0


def main():
    powers = [IDENTITY]
    for _ in range(12):
        powers.append(compose(powers[-1], J))
    assert powers[-1] == IDENTITY
    assert len(set(powers[:-1])) == 12
    assert inverse(FIRST_EXIT) == ((-1, -1, 1, 1), 6, 0)
    assert inverse(SECOND_EXIT) == SECOND_EXIT

    first_fold = compose(inverse(SECOND_CHORD),
                         compose(inverse(FIRST_EXIT), FIRST_CHORD))
    second_fold = compose(inverse(FIRST_CHORD),
                          compose(inverse(SECOND_EXIT), SECOND_CHORD))
    assert first_fold == powers[10]
    assert second_fold == powers[3]
    assert compose(second_fold, first_fold) == J

    developed_longitude = compose(FIRST_EXIT, SECOND_EXIT)
    assert developed_longitude == ((-1, 1, 1, 1), 3, 1)
    assert developed_longitude == compose(FIRST_CHORD,
                                          compose(inverse(J), inverse(FIRST_CHORD)))
    print("fold powers of J: 10, 3")
    print("developed marked longitude:", developed_longitude)


if __name__ == "__main__":
    main()
