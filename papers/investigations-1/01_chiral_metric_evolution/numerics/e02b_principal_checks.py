"""Check the frozen Q symbol with exact rational arithmetic."""

from fractions import Fraction
from itertools import combinations, product


def epsilon(i, j, k):
    if len({i, j, k}) < 3:
        return 0
    return 1 if (i, j, k) in ((0, 1, 2), (1, 2, 0), (2, 0, 1)) else -1


def eta(i, a, b):
    if a < 3 and b < 3:
        return epsilon(i, a, b)
    return int(i == a and b == 3) - int(i == b and a == 3)


def diagonal(values):
    return [[values[i] if i == j else 0 for j in range(3)] for i in range(3)]


def trace_with_q(values, matrix):
    return sum(value * matrix[i][i] for i, value in enumerate(values))


def diffusion(values, matrix):
    trace = trace_with_q(values, matrix)
    return [
        [
            2 * (values[i] + values[j]) * matrix[i][j]
            - (Fraction(4, 3) * trace * values[i] if i == j else 0)
            for j in range(3)
        ]
        for i in range(3)
    ]


def wedge_symbol(scales, matrix, direction, curvature=Fraction(3, 2)):
    """Contract ∇v with F and apply the derivative of the wedge quotient."""
    values = [scale**2 for scale in scales]
    scalar = trace_with_q(values, matrix) / 3
    centered = [
        [matrix[i][j] - (scalar if i == j else 0) for j in range(3)]
        for i in range(3)
    ]
    forms = [
        [[-curvature * scales[j] * eta(j, a, b) for b in range(4)] for a in range(4)]
        for j in range(3)
    ]
    wedge = [
        [
            sum(
                4 * centered[i][l] * direction[a] * direction[c]
                * forms[j][a][b] * forms[l][c][b]
                for a, b, c, l in product(range(4), range(4), range(4), range(3))
            )
            for j in range(3)
        ]
        for i in range(3)
    ]
    trace = sum(wedge[i][i] for i in range(3))
    return [
        [
            (wedge[i][j] + wedge[j][i]) / (2 * curvature**2)
            - (trace * values[i] / (3 * curvature**2) if i == j else 0)
            for j in range(3)
        ]
        for i in range(3)
    ]


def inner(values, first, second):
    return sum(first[i][j] * second[i][j] / values[i] for i, j in product(range(3), repeat=2))


def main():
    basis = [diagonal((1, 0, -1)), diagonal((0, 1, -1))]
    basis += [
        [[int((i, j) in ((a, b), (b, a))) for j in range(3)] for i in range(3)]
        for a, b in combinations(range(3), 2)
    ]
    scales_list = [(1, 1, 1), (Fraction(1, 7), Fraction(11, 7), Fraction(5, 7)),
                   (Fraction(1, 5), Fraction(7, 5), 1)]
    for scales in scales_list:
        scales = tuple(map(Fraction, scales))
        values = [scale**2 for scale in scales]
        assert sum(values) == 3
        for matrix in basis:
            for direction in ((1, 0, 0, 0), (2, -1, 3, 4)):
                expected = diffusion(values, matrix)
                actual = wedge_symbol(scales, matrix, direction)
                length_sq = sum(component**2 for component in direction)
                assert actual == [[entry * length_sq for entry in row] for row in expected]
            assert sum(expected[i][i] for i in range(3)) == 0
            norm_sq = inner(values, matrix, matrix)
            assert 4 * min(values) * norm_sq <= inner(values, expected, matrix)
            assert inner(values, expected, matrix) <= min(4 * max(values), 6) * norm_sq
            for other in basis:
                assert inner(values, expected, other) == inner(values, matrix, diffusion(values, other))
    print("Three Q values: component symbol in two directions on all five basis tensors, weighted symmetry, and basis Rayleigh bounds passed")

    for minimum in (Fraction(1, 4), Fraction(2, 3)):
        values = (minimum, Fraction(1), 2 - minimum)
        result = diffusion(values, diagonal((0, -1, 1)))[0][0]
        assert result == -Fraction(4, 3) * minimum * (1 - minimum) < 0
        print(f"Minimum-eigenvalue matrix jet m={minimum}: principal 11-entry {result}")


if __name__ == "__main__":
    main()
