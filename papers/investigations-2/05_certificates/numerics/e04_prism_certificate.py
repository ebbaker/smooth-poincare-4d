#!/usr/bin/env python3
"""Check the fixed SP4-CERT-E04 witnesses for d=17 and s=0."""


def inverse_word(word):
    return tuple(-letter for letter in reversed(word))


def commutator(left, right):
    return left + right + inverse_word(left) + inverse_word(right)


def compose(left, right):
    """Multiply permutations by applying the right factor first."""
    return tuple(left[index] for index in right)


def evaluate(word, images):
    value = images[0]
    for letter in word:
        factor = images[abs(letter)]
        if letter < 0:
            factor = tuple(factor.index(index) for index in range(3))
        value = compose(value, factor)
    return value


def check(condition, description):
    if not condition:
        raise AssertionError(description)


def verify_permutation_witness():
    F, L, b, c = (1,), (2,), (3,), (4,)
    b1 = L + b + inverse_word(L)
    b_top = F + b1 + inverse_word(F)
    c_top = F + c + inverse_word(F)
    longitude_F = inverse_word(c) + inverse_word(b) + inverse_word(L)
    longitude_L = inverse_word(b1) + inverse_word(F)
    d_pillowcase = b + b_top
    f_pillowcase = c_top + b_top
    relators = (
        b * 2,
        c * 2,
        commutator(F, longitude_F),
        commutator(L, longitude_L),
        d_pillowcase * 2 + inverse_word(f_pillowcase) * 3,
        F * 3 + inverse_word(longitude_F) * 2,
        inverse_word(L) + longitude_L,
    )

    identity = (0, 1, 2)
    b_image = (1, 0, 2)
    c_image = (0, 2, 1)
    images = (identity, identity, b_image, b_image, c_image)
    for index, relator in enumerate(relators, start=1):
        check(evaluate(relator, images) == identity, f"relator {index}")

    forms = {
        (exponent, reflection): evaluate((c + b) * exponent + c * reflection, images)
        for exponent in range(3)
        for reflection in range(2)
    }
    check(len(set(forms.values())) == 6, "six distinct permutations")
    for (exponent, reflection), value in forms.items():
        next_exponent = (exponent + 2 * reflection - 1) % 3
        check(
            compose(value, b_image) == forms[next_exponent, 1 - reflection],
            f"right multiplication by b from {(exponent, reflection)}",
        )
        check(
            compose(value, c_image) == forms[exponent, 1 - reflection],
            f"right multiplication by c from {(exponent, reflection)}",
        )

    print("Seven marked relators hold on the specified permutation images.")
    print("Six normal forms have distinct images and satisfy the transition table.")


def multiply_semidirect(left, right):
    i, n = left
    j, m = right
    signed_j = -j if n % 2 else j
    return (i + signed_j) % 3, n + m


def verify_conjugacy_witness():
    for start in range(3):
        for end in range(3):
            shift = 2 * (end - start) % 3
            translated = multiply_semidirect((shift, 0), (start, 1))
            conjugate = multiply_semidirect(translated, (-shift % 3, 0))
            check(conjugate == (end, 1), f"degree-one conjugacy {start} to {end}")
    print("The degree-one conjugacy formula holds for all three residues.")


if __name__ == "__main__":
    verify_permutation_witness()
    verify_conjugacy_witness()
