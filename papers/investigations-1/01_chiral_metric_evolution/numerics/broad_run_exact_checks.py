"""Run the four fixed finite checks from SP4-CME-E20 using exact fractions."""

from fractions import Fraction


def matrix(rows):
    return tuple(tuple(Fraction(entry) for entry in row) for row in rows)


def diagonal(values):
    return matrix(
        (value if i == j else 0 for j in range(len(values)))
        for i, value in enumerate(values)
    )


def transpose(value):
    return tuple(zip(*value))


def add(*values):
    return tuple(
        tuple(sum(entries) for entries in zip(*rows))
        for rows in zip(*values)
    )


def scale(factor, value):
    return tuple(tuple(factor * entry for entry in row) for row in value)


def multiply(left, right):
    columns = transpose(right)
    return tuple(
        tuple(sum(a * b for a, b in zip(row, column)) for column in columns)
        for row in left
    )


def trace(value):
    return sum(row[i] for i, row in enumerate(value))


def frobenius(left, right):
    return trace(multiply(transpose(left), right))


def commutator(left, right):
    return add(multiply(left, right), scale(-1, multiply(right, left)))


def require_equal(actual, expected, label):
    if actual != expected:
        raise AssertionError(f"{label}: expected {expected!r}, got {actual!r}")


IDENTITY_3 = diagonal((1, 1, 1))
OFF_DIAGONAL_PAIRS = ((0, 1), (0, 2), (1, 2))
TRACE_FREE_BASIS = (
    diagonal((1, 0, -1)),
    diagonal((0, 1, -1)),
    *(
        matrix(
            (int((i, j) in ((a, b), (b, a))) for j in range(3))
            for i in range(3)
        )
        for a, b in OFF_DIAGONAL_PAIRS
    ),
)


def principal(q_matrix, tangent):
    """Return the E02 operator on trace-free symmetric endomorphisms."""
    return add(
        scale(2, multiply(q_matrix, tangent)),
        scale(2, multiply(tangent, q_matrix)),
        scale(-Fraction(4, 3) * frobenius(q_matrix, tangent), q_matrix),
    )


def strain_map(inverse_root, tangent):
    conjugated = multiply(multiply(inverse_root, tangent), inverse_root)
    trace_part = scale(trace(conjugated) / 3, IDENTITY_3)
    return scale(Fraction(1, 2), add(conjugated, scale(-1, trace_part)))


def inverse_strain_map(root, q_matrix, strain):
    return add(
        scale(2, multiply(multiply(root, strain), root)),
        scale(-Fraction(2, 3) * frobenius(q_matrix, strain), q_matrix),
    )


def check_scalar_jet():
    epsilon = Fraction(1, 16)
    defect = diagonal((epsilon, 0, -epsilon))
    q_matrix = add(IDENTITY_3, defect)
    direction = add(diagonal((1, -2, 1)), scale(-Fraction(1, 2), defect))
    scalar_pairing = frobenius(defect, direction)
    principal_pairing = frobenius(defect, principal(q_matrix, direction))
    require_equal(scalar_pairing, -epsilon**2, "E08 symbolic scalar pairing")
    require_equal(
        principal_pairing,
        4 * epsilon**2 + Fraction(8, 3) * epsilon**4,
        "E08 symbolic principal pairing",
    )
    require_equal(scalar_pairing, Fraction(-1, 256), "E08 recorded scalar pairing")
    require_equal(
        principal_pairing, Fraction(385, 24576), "E08 recorded principal pairing"
    )
    print(f"E08 PASS: epsilon={epsilon}, pairings {scalar_pairing}, {principal_pairing}")


def check_relative_sylvester(root, inverse_root, q_matrix):
    require_equal(trace(q_matrix), 3, "E09 base trace")
    first_x = matrix(((1, 2, 0), (2, -1, 1), (0, 1, 0)))
    first_y = matrix(((0, 1, 1), (1, 2, 0), (1, 0, -1)))
    mixed = matrix(((2, 0, -1), (0, 1, 3), (-1, 3, 0)))
    if multiply(first_x, first_y) == multiply(first_y, first_x):
        raise AssertionError("E09 sample requires noncommuting first derivatives")
    relative_x = multiply(inverse_root, first_x)
    relative_y = multiply(inverse_root, first_y)
    derivative = add(
        multiply(inverse_root, mixed), scale(-1, multiply(relative_y, relative_x))
    )
    derivative_sym = scale(Fraction(1, 2), add(derivative, transpose(derivative)))
    left = add(multiply(root, derivative), multiply(derivative, root))
    right = add(
        scale(2, multiply(derivative_sym, root)),
        multiply(root, commutator(relative_x, relative_y)),
    )
    require_equal(left, right, "E09 relative Sylvester identity")
    print("E09 PASS: relative Sylvester identity with noncommuting first derivatives")


def check_strain_maps(root, inverse_root, q_matrix):
    rotation = matrix(
        ((Fraction(3, 5), -Fraction(4, 5), 0),
         (Fraction(4, 5), Fraction(3, 5), 0),
         (0, 0, 1))
    )
    require_equal(multiply(rotation, transpose(rotation)), IDENTITY_3, "E15 rotation")
    require_equal(
        rotation[0][0] * rotation[1][1] - rotation[0][1] * rotation[1][0],
        1,
        "E15 rotation determinant",
    )
    rotated_root, rotated_inverse, rotated_q = (
        multiply(multiply(rotation, item), transpose(rotation))
        for item in (root, inverse_root, q_matrix)
    )
    for name, active_root, active_inverse, active_q in (
        ("diagonal", root, inverse_root, q_matrix),
        ("rotated", rotated_root, rotated_inverse, rotated_q),
    ):
        require_equal(multiply(active_root, active_root), active_q, f"E15 {name} root")
        require_equal(multiply(active_inverse, active_root), IDENTITY_3, f"E15 {name} inverse")
        require_equal(trace(active_q), 3, f"E15 {name} trace")
        for index, basis_matrix in enumerate(TRACE_FREE_BASIS, start=1):
            recovered = inverse_strain_map(active_root, active_q, basis_matrix)
            require_equal(
                strain_map(active_inverse, recovered), basis_matrix,
                f"E15 {name} G M on basis vector {index}",
            )
            require_equal(
                strain_map(active_inverse, principal(active_q, recovered)),
                principal(active_q, basis_matrix),
                f"E15 {name} G L M on basis vector {index}",
            )
        print(f"E15 PASS: G M=Id and G L M=L on all five basis matrices at {name} Q")


def skew_matrix(size, oriented_pairs):
    # An oriented pair (a, b) sends covector a to b and b to -a.
    entries = [[0] * size for _ in range(size)]
    for a, b in oriented_pairs:
        entries[b][a] = 1
        entries[a][b] = -1
    return matrix(entries)


def trace_free_coordinates(value):
    require_equal(transpose(value), value, "E16A symmetric action")
    require_equal(trace(value), 0, "E16A trace-free action")
    return (
        value[0][0],
        value[1][1],
        *(value[i][j] for i, j in OFF_DIAGONAL_PAIRS),
    )


def check_round_action():
    # Zero-based indices. Spatial cyclic pairs give eta_i,jk=epsilon_ijk.
    cyclic_pairs = ((1, 2), (2, 0), (0, 1))
    # Each eta_i,i4=1 is the extra pair (i, 3). J_i,ca=eta_i,ac.
    covector_actions = tuple(
        skew_matrix(4, ((i, 3), pair)) for i, pair in enumerate(cyclic_pairs)
    )
    internal_generators = tuple(skew_matrix(3, (pair,)) for pair in cyclic_pairs)

    columns = []
    for a in range(4):
        for basis_matrix in TRACE_FREE_BASIS:
            internal_actions = tuple(
                commutator(generator, basis_matrix) for generator in internal_generators
            )
            column = []
            for c in range(4):
                value = add(*(
                    scale(action[c][a], internal_action)
                    for action, internal_action in zip(covector_actions, internal_actions)
                ))
                column.extend(trace_free_coordinates(value))
            columns.append(tuple(column))
    action = transpose(columns)
    dimension = len(columns)
    require_equal(dimension, 20, "E16A round dimension")

    gram_block = tuple(
        tuple(frobenius(first, second) for second in TRACE_FREE_BASIS)
        for first in TRACE_FREE_BASIS
    )
    basis_size = len(TRACE_FREE_BASIS)
    gram = matrix(
        (gram_block[i % basis_size][j % basis_size]
         if i // basis_size == j // basis_size else 0
         for j in range(dimension))
        for i in range(dimension)
    )
    require_equal(
        multiply(transpose(action), gram), multiply(gram, action),
        "E16A Gram self-adjointness",
    )
    require_equal(
        multiply(action, action), add(action, diagonal((6,) * dimension)),
        "E16A quadratic polynomial",
    )
    require_equal(trace(action), 0, "E16A normalized trace")

    # The Gram-self-adjoint action has eigenvalues among -2 and 3.
    # Solve n_minus + n_plus = 20 and -2*n_minus + 3*n_plus = tr(A).
    multiplicity_plus = (trace(action) + 2 * dimension) / 5
    multiplicity_minus = dimension - multiplicity_plus
    require_equal((multiplicity_minus, multiplicity_plus), (12, 8), "E16A multiplicities")
    print("E16A PASS: 20 x 20 Gram self-adjoint, A^2=A+6I, tr(A)=0")
    print(
        "E16A spectrum of Z/K: "
        f"{-36 + 8 * -2} ({multiplicity_minus}), {-36 + 8 * 3} ({multiplicity_plus})"
    )


def main():
    root = diagonal((Fraction(1, 3), Fraction(5, 3), Fraction(1, 3)))
    inverse_root = diagonal((3, Fraction(3, 5), 3))
    q_matrix = multiply(root, root)
    check_scalar_jet()
    check_relative_sylvester(root, inverse_root, q_matrix)
    check_strain_maps(root, inverse_root, q_matrix)
    check_round_action()


if __name__ == "__main__":
    main()
