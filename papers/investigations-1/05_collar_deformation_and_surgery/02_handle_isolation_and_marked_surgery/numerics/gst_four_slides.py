"""Bounded depth-four test using exact unit-quaternion angular bounds."""

from collections import defaultdict
from fractions import Fraction
from itertools import product
from math import isqrt

from gst_three_slides import (
    MAPS,
    RELATORS,
    VECTORS,
    christoffel,
    evaluate,
    normalized,
    row_sum,
)


# Keep the two depth-three witnesses first. Each following pair specifies the
# surviving original relator by its index and a representation in that format.
WITNESSES = (
    (0, MAPS[0]),
    (1, MAPS[1]),
    (0, (767, (1, -1, 0, 0), (16, -1, 1, 0), 2, 1024)),
    (0, (23, (1, -1, 0, 0), (8, -13, 1, 0), 2, 256)),
    (1, (11, (-17, 10, 0, 1), (-17, 10, 0, -1), 400, 400)),
)


def scalar(word, representation):
    coords, norm = evaluate(word, representation)
    numerator = coords[0]
    sign = (numerator > 0) - (numerator < 0)
    return sign, Fraction(numerator ** 2, norm)


def angle_bound(count, u):
    """Return the sign and square of cos(count * acos(sqrt(u)))."""
    if count == 2:
        polynomial = 2 * u - 1
    elif count == 3:
        if u <= Fraction(1, 4):
            return None
        polynomial = 4 * u - 3
    elif count == 4:
        if u <= Fraction(1, 2):
            return None
        polynomial = 8 * u * u - 8 * u + 1
    elif count == 5:
        # cos(pi/5)^2=(3+sqrt(5))/8.
        if 8 * u - 3 <= 0 or (8 * u - 3) ** 2 <= 5:
            return None
        polynomial = 16 * u * u - 20 * u + 5
    else:
        raise ValueError(f"unexpected copy count {count}")
    sign = (polynomial > 0) - (polynomial < 0)
    return sign, polynomial ** 2 * (u if count % 2 else 1)


def scalar_less(candidate, bound):
    sign, square = candidate
    bound_sign, bound_square = bound
    if sign != bound_sign:
        return sign < bound_sign
    return sign * (square - bound_square) < 0


def excludes(witness, count, word):
    index, representation = witness
    c = scalar(RELATORS[index], representation)
    target = scalar(word, representation)
    if count == 0:
        return target != (1, Fraction(1))
    if count == 1:
        return target != c
    bound = angle_bound(count, c[1])
    if bound is None:
        return False
    # Multiplying each factor by -1, when needed, centers all factors at 1.
    shifted_sign = -target[0] if c[0] < 0 and count % 2 else target[0]
    return scalar_less((shifted_sign, target[1]), bound)


def branches():
    for moves in product((0, 1), repeat=4):
        for signs in product((1, -1), repeat=4):
            rows = list(VECTORS)
            copies = [(1, 0), (0, 1)]
            for move, sign in zip(moves, signs):
                source = 1 - move
                rows[move] = row_sum(rows[move], rows[source], sign)
                copies[move] = row_sum(copies[move], copies[source], 1)
            move_label = "".join("RS"[m] for m in moves)
            sign_label = "".join("+" if s == 1 else "-" for s in signs)
            last = moves[-1]
            yield move_label, sign_label, normalized(rows[last]), copies[last]


def main():
    for index, representation in WITNESSES:
        identity, norm = evaluate(RELATORS[1 - index], representation)
        assert isqrt(norm) ** 2 == norm and identity == (isqrt(norm), 0, 0, 0)
        for generator in ("x", "y"):
            identity, norm = evaluate(generator + generator.upper(), representation)
            assert isqrt(norm) ** 2 == norm and identity == (isqrt(norm), 0, 0, 0)

    todo = list(branches())
    print(f"four-move branches: {len(todo)}")
    for i, witness in enumerate(WITNESSES, 1):
        index = witness[0]
        survivors = [
            (moves, signs, row, copies)
            for moves, signs, row, copies in todo
            if not excludes(witness, copies[index], christoffel(row))
        ]
        print(f"witness {i} excludes {len(todo) - len(survivors)}; remains {len(survivors)}")
        todo = survivors
    residual = defaultdict(list)
    for moves, signs, row, copies in todo:
        residual[moves, row, copies].append(signs)
    for (moves, row, copies), signs in sorted(residual.items()):
        print(f"{moves}  {row}  {copies}  {', '.join(signs)}")


if __name__ == "__main__":
    main()
