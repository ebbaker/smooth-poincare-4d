"""Check fixed finite quotient witnesses on the full E70 and E72 words."""

from e72_rotation_presentation import filled_relators

PRIME = 29
IDENTITY = (1, 0, 0, 1)


def projective(matrix):
    return min(matrix, tuple(-entry % PRIME for entry in matrix))


def multiply(left, right):
    a, b, c, d = left
    e, f, g, h = right
    return projective(tuple(entry % PRIME for entry in (
        a * e + b * g, a * f + b * h,
        c * e + d * g, c * f + d * h,
    )))


def inverse(matrix):
    a, b, c, d = matrix
    return projective((d, -b % PRIME, -c % PRIME, a))


def matrix_word(*matrices):
    product = IDENTITY
    for matrix in matrices:
        product = multiply(product, matrix)
    return product


def image_size(generators, identity, product, bound):
    seen = {identity}
    queue = [identity]
    for current in queue:
        for generator in generators:
            successor = product(current, generator)
            if successor not in seen:
                seen.add(successor)
                queue.append(successor)
                assert len(seen) <= bound
    return len(seen)


def verify_e70():
    t, c = (3, 7, 7, 7), (10, 19, 13, 19)
    meridian_f, meridian_l = matrix_word(t, t), matrix_word(c, t)
    b = matrix_word(meridian_l, meridian_f, meridian_l)
    b_middle = matrix_word(meridian_l, b, inverse(meridian_l))
    b_top = matrix_word(meridian_f, b_middle, inverse(meridian_f))
    c_top = matrix_word(meridian_f, c, inverse(meridian_f))
    longitude_f = matrix_word(inverse(c), inverse(b), inverse(meridian_l))
    longitude_l = matrix_word(inverse(b_middle), inverse(meridian_f))
    outer_d, outer_f = matrix_word(b, b_top), matrix_word(c_top, b_top)

    for a, b_entry, c_entry, d in (t, c):
        assert (a * d - b_entry * c_entry) % PRIME == 1
    assert matrix_word(b, b) == matrix_word(c, c) == IDENTITY
    assert matrix_word(meridian_f, longitude_f) == matrix_word(longitude_f, meridian_f)
    assert matrix_word(meridian_l, longitude_l) == matrix_word(longitude_l, meridian_l)
    assert matrix_word(meridian_f, meridian_f, meridian_f) == matrix_word(longitude_f, longitude_f)
    assert matrix_word(meridian_l, meridian_l) == longitude_l
    assert matrix_word(outer_d, outer_f) == matrix_word(outer_f, outer_d)
    assert matrix_word(outer_d, outer_f, b_top) == c
    assert matrix_word(b_top, b_top) == matrix_word(c_top, c_top) == IDENTITY
    assert matrix_word(outer_d, outer_d) == matrix_word(outer_f, outer_f, outer_f)
    assert image_size((t, c), IDENTITY, multiply, 12180) == 12180


def verify_original_words(slope, images, identity, product, invert, order):
    alphabet = {index: image for index, image in enumerate(images, 1)}
    alphabet.update({-index: invert(image) for index, image in enumerate(images, 1)})
    for word in filled_relators(slope):
        value = identity
        for letter in word:
            value = product(value, alphabet[letter])
        assert value == identity, (slope, word, value)
    assert image_size(images, identity, product, order) == order


def verify_e72():
    one, cycle, reverse, flip = (0, 1, 2), (1, 2, 0), (2, 0, 1), (1, 0, 2)
    s3_images = (reverse, cycle, cycle, cycle, reverse, cycle, cycle) + (one,) * 8 + (flip,) * 3
    verify_original_words(
        0, s3_images, one, lambda a, b: tuple(b[i] for i in a),
        lambda a: tuple(a.index(i) for i in range(3)), 6,
    )
    psl_images = (
        (8, 21, 21, 19), (1, 0, 10, 1), (0, 12, 12, 2), (1, 10, 0, 1),
        (8, 21, 21, 19), (1, 0, 10, 1), (1, 10, 0, 1), (6, 0, 15, 5),
        (6, 26, 15, 12), (5, 14, 0, 6), (6, 26, 15, 12), (6, 15, 0, 5),
        (6, 15, 26, 12), (5, 0, 14, 6), (6, 15, 26, 12), (6, 22, 18, 13),
        (13, 11, 7, 6), (0, 28, 1, 0),
    )
    assert all((a * d - b * c) % PRIME == 1 for a, b, c, d in psl_images)
    verify_original_words(-1, psl_images, IDENTITY, multiply, inverse, 12180)


if __name__ == "__main__":
    verify_e70()
    print("E70, s=-1: verified original relations and image order 12180")
    verify_e72()
    print("E72: verified original words and image orders 6 (s=0), 12180 (s=-1)")
