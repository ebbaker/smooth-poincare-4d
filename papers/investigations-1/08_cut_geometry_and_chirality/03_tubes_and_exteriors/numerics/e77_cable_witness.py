"""Verify nonabelian projective images for the E77 companion filling."""

from collections import deque


PRIME = 31
IDENTITY = (1, 0, 0, 1)
NEGATIVE_IDENTITY = (-1 % PRIME, 0, 0, -1 % PRIME)
EXPECTED_ORDER = PRIME * (PRIME**2 - 1) // 2


def multiply(left, right):
    a, b, c, d = left
    e, f, g, h = right
    return tuple(value % PRIME for value in (a*e + b*g, a*f + b*h, c*e + d*g, c*f + d*h))


def product(*factors):
    result = IDENTITY
    for factor in factors:
        result = multiply(result, factor)
    return result


def inverse(matrix):
    a, b, c, d = matrix
    return d, -b % PRIME, -c % PRIME, a


def determinant(matrix):
    a, b, c, d = matrix
    return (a*d - b*c) % PRIME


def power(matrix, exponent):
    if exponent < 0:
        matrix = inverse(matrix)
        exponent = -exponent
    result = IDENTITY
    while exponent:
        if exponent % 2:
            result = multiply(result, matrix)
        matrix = multiply(matrix, matrix)
        exponent //= 2
    return result


def commutator(a, b):
    return product(a, b, inverse(a), inverse(b))


def image_order(generators):
    """Traverse the finite projective group using the lesser of ±A."""
    known = {IDENTITY}
    queue = deque([IDENTITY])
    while queue:
        current = queue.popleft()
        for generator in generators:
            candidate = multiply(current, generator)
            candidate = min(candidate, tuple(-x % PRIME for x in candidate))
            if candidate not in known:
                known.add(candidate)
                queue.append(candidate)
                assert len(known) <= EXPECTED_ORDER
    return len(known)


def verify(f_meridian, l_meridian, bottom_plus, bottom_minus):
    generators = (f_meridian, l_meridian, bottom_plus, bottom_minus)
    assert all(determinant(matrix) == 1 for matrix in generators)
    middle_plus = product(l_meridian, bottom_plus, inverse(l_meridian))
    top_plus = product(f_meridian, middle_plus, inverse(f_meridian))
    top_minus = product(f_meridian, bottom_minus, inverse(f_meridian))
    longitude_f = product(inverse(bottom_minus), inverse(bottom_plus), inverse(l_meridian))
    longitude_l = product(inverse(middle_plus), inverse(f_meridian))
    d_2 = product(bottom_plus, top_plus)
    fibre = product(top_minus, top_plus)
    relations = {
        "bottom_plus^2": power(bottom_plus, 2),
        "bottom_minus^2": power(bottom_minus, 2),
        "[F, lambda_F]": commutator(f_meridian, longitude_f),
        "[L, lambda_L]": commutator(l_meridian, longitude_l),
        "F^3 lambda_F^(-2)": product(power(f_meridian, 3), power(longitude_f, -2)),
        "L^(-34) lambda_L^49": product(power(l_meridian, -34), power(longitude_l, 49)),
        "d_2^2 f^(-3)": product(power(d_2, 2), power(fibre, -3)),
        "pillowcase product": product(top_plus, top_minus, bottom_minus, bottom_plus),
    }
    for name, value in relations.items():
        assert value in (IDENTITY, NEGATIVE_IDENTITY), (name, value)
        print(f"  {name} = {'I' if value == IDENTITY else '-I'}")
    print(f"  b_1 = {middle_plus}, top+ = {top_plus}, top- = {top_minus}")
    print(f"  lambda_F = {longitude_f}, lambda_L = {longitude_l}")
    print(f"  d_2 = {d_2}, f = {fibre}")
    noncommuting = commutator(f_meridian, l_meridian)
    assert noncommuting not in (IDENTITY, NEGATIVE_IDENTITY)
    print(f"  [F, L] = {noncommuting}")
    assert image_order(generators) == EXPECTED_ORDER
    print(f"  Projective image order = {EXPECTED_ORDER}")


if __name__ == "__main__":
    print("Lead witness (F, L, b, c)")
    verify((4, 6, 8, 20), (13, 27, 30, 29), (14, 17, 3, 17), (0, 1, 30, 0))
    print("Independent witness (F, L, b, c)")
    verify((30, 28, 3, 8), (28, 23, 1, 23), (8, 19, 8, 23), (1, 3, 20, 30))
