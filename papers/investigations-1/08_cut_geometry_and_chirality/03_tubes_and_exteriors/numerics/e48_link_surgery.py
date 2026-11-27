"""Exact integral homology of the two ordinary great-circle link fillings."""

from collections import Counter


ORDER = 17
TETRA_VERTICES = 4


def cyclic_distance(i, j):
    return min((i - j) % ORDER, (j - i) % ORDER)


def surgery_matrix(coefficient):
    components = [
        (vertex, axis) for vertex in range(TETRA_VERTICES) for axis in range(ORDER)
    ]
    matrix = []
    for vertex, axis in components:
        row = []
        for other_vertex, other_axis in components:
            if vertex == other_vertex and axis == other_axis:
                row.append(coefficient)
            elif vertex != other_vertex and cyclic_distance(axis, other_axis) <= 5:
                row.append(-1)
            else:
                row.append(1)
        matrix.append(row)
    return matrix


def determinant(matrix):
    """Fraction-free Bareiss elimination with row pivoting."""
    matrix = [row[:] for row in matrix]
    previous_pivot = 1
    sign = 1
    size = len(matrix)
    for column in range(size - 1):
        if matrix[column][column] == 0:
            pivot_row = next(
                (row for row in range(column + 1, size) if matrix[row][column]),
                None,
            )
            if pivot_row is None:
                return 0
            matrix[column], matrix[pivot_row] = matrix[pivot_row], matrix[column]
            sign = -sign
        pivot = matrix[column][column]
        for row in range(column + 1, size):
            for entry in range(column + 1, size):
                numerator = (
                    pivot * matrix[row][entry]
                    - matrix[row][column] * matrix[column][entry]
                )
                matrix[row][entry], remainder = divmod(numerator, previous_pivot)
                assert remainder == 0
            matrix[row][column] = 0
        previous_pivot = pivot
    return sign * matrix[-1][-1]


def reduced_blocks(coefficient):
    """Use the equal and sum-zero tetrahedral modes over the rationals."""
    difference = []
    equal = []
    for i in range(ORDER):
        difference_row = []
        equal_row = []
        for j in range(ORDER):
            diagonal = coefficient - 1 if i == j else 0
            window = int(cyclic_distance(i, j) <= 5)
            difference_row.append(diagonal + 2 * window)
            equal_row.append(diagonal + 4 - 6 * window)
        difference.append(difference_row)
        equal.append(equal_row)
    return equal, difference


def factor(value):
    factors = Counter()
    divisor = 2
    while divisor * divisor <= value:
        while value % divisor == 0:
            factors[divisor] += 1
            value //= divisor
        divisor += 1
    if value != 1:
        factors[value] += 1
    return factors


def primary_exponents(matrix, prime, determinant_valuation):
    """Peel off unit Smith pivots over the local ring, tracking prime powers."""
    modulus = prime ** (determinant_valuation + 1)
    matrix = [[value % modulus for value in row] for row in matrix]
    exponents = Counter()
    exponent = 0
    while matrix:
        pivot_entry = next(
            (
                (i, j)
                for i, row in enumerate(matrix)
                for j, value in enumerate(row)
                if value % prime
            ),
            None,
        )
        if pivot_entry is None:
            assert modulus > prime
            matrix = [[value // prime for value in row] for row in matrix]
            modulus //= prime
            exponent += 1
            continue

        row, column = pivot_entry
        matrix[0], matrix[row] = matrix[row], matrix[0]
        for entries in matrix:
            entries[0], entries[column] = entries[column], entries[0]
        pivot_row = matrix[0]
        inverse = pow(pivot_row[0], -1, modulus)
        residual = []
        for entries in matrix[1:]:
            scale = entries[0] * inverse % modulus
            residual.append(
                [
                    (value - scale * pivot_value) % modulus
                    for value, pivot_value in zip(entries[1:], pivot_row[1:])
                ]
            )
        matrix = residual
        if exponent:
            exponents[exponent] += 1
    assert sum(power * count for power, count in exponents.items()) == determinant_valuation
    return dict(sorted(exponents.items()))


def main():
    for slope in (0, 1):
        coefficient = 12 * slope - 5
        matrix = surgery_matrix(coefficient)
        equal, difference = reduced_blocks(coefficient)
        equal_det = determinant(equal)
        difference_det = determinant(difference)
        full_det = determinant(matrix)
        assert full_det == equal_det * difference_det**3 and full_det
        factors = factor(abs(equal_det))
        for prime, count in factor(abs(difference_det)).items():
            factors[prime] += 3 * count
        primary = {
            prime: primary_exponents(matrix, prime, valuation)
            for prime, valuation in sorted(factors.items())
        }
        print(f"s={slope}, coefficient={coefficient}")
        print(f"  reduced determinants = {equal_det}, {difference_det}")
        print(f"  full determinant = {full_det}")
        print(f"  factorization of |det| = {dict(sorted(factors.items()))}")
        print(f"  primary exponents and multiplicities = {primary}")


if __name__ == "__main__":
    main()
