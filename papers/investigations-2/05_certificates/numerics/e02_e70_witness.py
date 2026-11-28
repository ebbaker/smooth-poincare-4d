#!/usr/bin/env python3
"""Check the explicit S3 and projective-matrix images from the E70 words.

27 November 2026, for Edward B. Baker III with OpenAI assistance.
Actual model and effort unavailable. E70 SHA-256 ade2987d8bf24aa9….
This checker uses no code from the coset sweep. No search is performed.
The upper order witness at s=0 is the elimination in the companion note.
"""

from itertools import permutations


def inv(word):
    return word.swapcase()[::-1]


def power(word, exponent):
    return word * exponent if exponent >= 0 else inv(word) * -exponent


def comm(word, other):
    return word + other + inv(word) + inv(other)


def relators(slope):
    # Lowercase denotes the generator and uppercase its inverse.
    b_mid = "lbL"
    b_top = "f" + b_mid + "F"
    c_top = "fcF"
    lambda_f = "CBL"
    lambda_l = inv(b_mid) + "F"
    return (
        "bb", "cc", comm("f", lambda_f), comm("l", lambda_l),
        power("b" + b_top, 2) + power(c_top + b_top, -3),
        "fff" + power(lambda_f, -2), power("l", slope - 1) + lambda_l,
    )


def evaluate(word, image, identity, multiply):
    result = identity
    for letter in word:
        result = multiply(result, image[letter])
    return result


def permutation_multiply(left, right):
    return tuple(left[i] for i in right)


def verify_s0():
    identity = (0, 1, 2)
    b = (1, 0, 2)
    c = (0, 2, 1)
    image = dict(F=identity, f=identity, L=b, l=b, B=b, b=b, C=c, c=c)

    def evaluate_permutation(word):
        return evaluate(word, image, identity, permutation_multiply)

    assert all(evaluate_permutation(word) == identity for word in relators(0))
    representatives = ("", "cb", "cbcb", "c", "cbc", "cbcbc")
    assert {evaluate_permutation(word) for word in representatives} == set(permutations(range(3)))
    print("s=0: all original relators and six distinct permutation images verified")


def matrix_multiply(left, right):
    a, b, c, d = left
    e, f, g, h = right
    return ((a * e + b * g) % 29, (a * f + b * h) % 29,
            (c * e + d * g) % 29, (c * f + d * h) % 29)


def verify_s_minus_1():
    identity = (1, 0, 0, 1)
    central = {identity, (28, 0, 0, 28)}
    positive = dict(f=(0, 12, 12, 11), l=(18, 0, 27, 21),
                    b=(3, 12, 4, 26), c=(10, 19, 13, 19))
    image = positive.copy()
    for letter, (a, b, c, d) in positive.items():
        assert (a * d - b * c) % 29 == 1
        image[letter.upper()] = (d, -b % 29, -c % 29, a)

    def evaluate_matrix(word):
        return evaluate(word, image, identity, matrix_multiply)

    assert all(evaluate_matrix(word) in central for word in relators(-1))
    assert evaluate_matrix(comm("cl", "c")) not in central
    print("s=-1: all original relators and a nontrivial projective commutator verified")


if __name__ == "__main__":
    verify_s0()
    verify_s_minus_1()
