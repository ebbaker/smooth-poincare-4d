"""Verify a full PSL(2,F_29) quotient of the marked alternate slope."""

from collections import deque

PRIME = 29
IDENTITY = (1, 0, 0, 1)
T = (3, 7, 7, 7)
C = (10, 19, 13, 19)


def multiply(left, right):
    a, b, c, d = left
    e, f, g, h = right
    return tuple(x % PRIME for x in (a*e+b*g, a*f+b*h, c*e+d*g, c*f+d*h))


def inverse(matrix):
    a, b, c, d = matrix
    assert (a*d-b*c) % PRIME == 1
    return (d, -b % PRIME, -c % PRIME, a)


def product(*matrices):
    value = IDENTITY
    for matrix in matrices:
        value = multiply(value, matrix)
    return value


def power(matrix, exponent):
    if exponent < 0:
        matrix = inverse(matrix)
    return product(*([matrix] * abs(exponent)))


def projective(matrix):
    first_nonzero = next(x for x in matrix if x)
    if first_nonzero > PRIME // 2:
        return tuple(-x % PRIME for x in matrix)
    return matrix


def conjugate(matrix, value):
    return product(matrix, value, inverse(matrix))


def commutator(left, right):
    return product(left, right, inverse(left), inverse(right))


def marked_relators():
    # Both words use the uneliminated filling and peripheral relations.
    f_meridian = power(T, 2)
    l_meridian = product(C, T)
    bottom_plus = product(l_meridian, f_meridian, l_meridian)
    middle_plus = conjugate(l_meridian, bottom_plus)
    top_plus = conjugate(f_meridian, middle_plus)
    top_minus = conjugate(f_meridian, C)
    f_longitude = product(inverse(C), inverse(bottom_plus), inverse(l_meridian))
    l_longitude = product(inverse(middle_plus), inverse(f_meridian))
    d2 = product(bottom_plus, top_plus)
    fibre = product(top_minus, top_plus)
    return {
        "bottom squares": (power(bottom_plus, 2), power(C, 2)),
        "Wirtinger returns": (commutator(f_meridian, f_longitude),
                              commutator(l_meridian, l_longitude)),
        "fillings": (product(power(f_meridian, 3), power(f_longitude, -2)),
                     product(power(l_meridian, -2), l_longitude)),
        "outer slope": (product(power(d2, 2), power(fibre, -3)),),
        "pillowcase product": (product(top_plus, top_minus, C, bottom_plus),),
    }


def projective_order(generators):
    seen = {IDENTITY}
    pending = deque(seen)
    while pending:
        element = pending.popleft()
        for generator in generators:
            candidate = projective(multiply(element, generator))
            if candidate not in seen:
                seen.add(candidate)
                pending.append(candidate)
    return len(seen)


def main():
    assert multiply(T, inverse(T)) == IDENTITY
    assert multiply(C, inverse(C)) == IDENTITY
    for name, words in marked_relators().items():
        assert all(projective(word) == IDENTITY for word in words), name
    assert commutator(T, C) == (21, 27, 27, 3)
    order = projective_order((T, C))
    assert order == PRIME * (PRIME**2 - 1) // 2 == 12180
    print("Original alternate-slope relators hold in PSL(2,F_29).")
    print("Projective order:", order)


if __name__ == "__main__":
    main()
