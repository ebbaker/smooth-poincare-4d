#!/usr/bin/env python3
"""Verify the four E03 entries by exact word and permutation checks."""

import argparse
import json
from pathlib import Path


SIGNED_COLUMNS = "flbcFLBC"
# Lowercase letters are positive. Temporary letters are eliminated by definition.
DEFINITIONS = {"m": "lbL", "h": "fmF", "j": "fcF", "p": "MF", "q": "CBL"}


def require(condition, message):
    if not condition:
        raise ValueError(message)


def inverse(word):
    return word[::-1].swapcase()


def free(word):
    reduction = []
    for letter in word:
        if reduction and reduction[-1] == letter.swapcase():
            reduction.pop()
        else:
            reduction.append(letter)
    return "".join(reduction)


def equation(left, right):
    """Free conjugacy class of the relator, allowing inversion."""
    word = free(left + inverse(right))
    while len(word) > 1 and word[0] == word[-1].swapcase():
        word = word[1:-1]
    if not word:
        return ""
    return min(w[i:] + w[:i] for w in (word, inverse(word)) for i in range(len(w)))


def original_equations(k, slope):
    """The E02 presentation, with corner exponent k and filling slope s."""
    return {
        "b2": ("bb", ""),
        "c2": ("cc", ""),
        "F-commutes": ("fq", "qf"),
        "L-commutes": ("lp", "pl"),
        "corner": ("bhbh" + "HJ" * k, ""),
        "cone": ("fff", "qq"),
        "filling": (("L" if slope == 0 else "") + "p", ""),
    }


def expand(word):
    letters = []
    for letter in word:
        if letter.lower() in DEFINITIONS:
            replacement = DEFINITIONS[letter.lower()]
            letters.append(expand(replacement if letter.islower() else inverse(replacement)))
        else:
            letters.append(letter)
    return "".join(letters)


class Proof:
    """Each link is freely equal to, or a conjugate of, one prior relator."""

    def __init__(self, relations):
        self.facts = {name: equation(*sides) for name, sides in relations.items()}
        for symbol, expression in DEFINITIONS.items():
            self.facts[symbol] = equation(symbol, expression)

    def check_link(self, left, right, prior):
        require(equation(left, right) == self.facts[prior],
                f"invalid use of {prior}: {left} = {right}")

    def chain(self, name, left, right, *steps):
        current = left
        for target, prior in steps:
            self.check_link(current, target, prior)
            current = target
        require(free(current + inverse(right)) == "", f"chain {name} ends at {current}")
        self.facts[name] = equation(left, right)

    def infer(self, name, left, right, prior):
        self.chain(name, left, right, (right, prior))

    def replace(self, word, old, new, prior):
        require(old and old not in new, f"invalid repeated substitution {old} -> {new}")
        while old in word:
            result = word.replace(old, new, 1)
            self.check_link(word, result, prior)
            word = result
        return word


def prove_s0(k, relations):
    proof = Proof(relations)
    proof.infer("p_equals_l", "p", "l", "filling")
    proof.chain("pull_l", "l", "lBLF",
                ("p", "p_equals_l"), ("MF", "p"), ("lBLF", "m"))
    proof.infer("l_FB", "l", "FB", "pull_l")
    proof.chain("l_Fb", "l", "Fb", ("FB", "l_FB"), ("Fb", "b2"))
    proof.chain("m_Fbf", "m", "Fbf",
                ("lbL", "m"), ("FbbL", "l_Fb"), ("FbbBf", "l_Fb"))
    proof.chain("h_b", "h", "b", ("fmF", "h"), ("fFbfF", "m_Fbf"))
    proof.chain("q_cf", "q", "cf",
                ("CBL", "q"), ("CBBf", "l_Fb"), ("Cf", "b2"), ("cf", "c2"))
    proof.chain("commute_with_tail", "fcf", "cff",
                ("fq", "q_cf"), ("qf", "F-commutes"), ("cff", "q_cf"))
    proof.infer("fc_cf", "fc", "cf", "commute_with_tail")
    proof.chain("f3_f2", "fff", "ff",
                ("qq", "cone"), ("cfq", "q_cf"), ("cfcf", "q_cf"),
                ("ccff", "fc_cf"), ("ff", "c2"))
    proof.infer("f_one", "f", "", "f3_f2")
    proof.chain("l_b", "l", "b", ("Fb", "l_Fb"), ("b", "f_one"))
    proof.chain("j_c", "j", "c", ("fcF", "j"), ("cF", "f_one"), ("c", "f_one"))
    left = relations["corner"][0]
    reduced = proof.replace(left, "h", "b", "h_b")
    reduced = proof.replace(reduced, "H", "B", "h_b")
    reduced = proof.replace(reduced, "J", "C", "j_c")
    for _ in range(2):
        require(reduced.startswith("bb"), "corner does not have two initial b pairs")
        proof.check_link(reduced, reduced[2:], "b2")
        reduced = reduced[2:]
    require(equation(reduced, "") == equation("cb" * k, ""),
            "unexpected residual corner word")

    # The derived relations F=1, L=b, b^2=c^2=(cb)^k=1 give the upper bound.
    # In the normal forms (cb)^a c^e, c reverses cb, as checked here.
    proof.chain("c_inverts_cb", "ccbc", "BC",
                ("bc", "c2"), ("Bc", "b2"), ("BC", "c2"))


def prove_s1(k, relations):
    proof = Proof(relations)
    proof.chain("MF_one", "MF", "", ("p", "p"), ("", "filling"))
    proof.infer("m_F", "m", "F", "MF_one")
    proof.chain("m2", "mm", "",
                ("lbLm", "m"), ("lbLlbL", "m"), ("lL", "b2"))
    proof.chain("f2", "ff", "", ("Mf", "m_F"), ("MM", "m_F"), ("", "m2"))
    proof.chain("qq_f", "qq", "f", ("fff", "cone"), ("f", "f2"))
    proof.chain("q4", "qqqq", "", ("fqq", "qq_f"), ("ff", "qq_f"), ("", "f2"))
    proof.chain("f_lbL", "f", "lbL", ("M", "m_F"), ("lBL", "m"), ("lbL", "b2"))
    proof.infer("b_Lfl", "b", "Lfl", "f_lbL")
    proof.chain("q_cLF", "q", "cLF",
                ("CBL", "q"), ("CLFlL", "b_Lfl"), ("cLF", "c2"))
    proof.infer("l_FQc", "l", "FQc", "q_cLF")
    proof.chain("l_qc", "l", "qc", ("FQc", "l_FQc"), ("fQc", "f2"), ("qqQc", "qq_f"))
    proof.chain("b_cfc", "b", "cfc",
                ("Lfl", "b_Lfl"), ("CQfl", "l_qc"), ("CQfqc", "l_qc"),
                ("CQqqqc", "qq_f"), ("Cfc", "qq_f"), ("cfc", "c2"))
    proof.chain("h_f", "h", "f", ("fmF", "h"), ("fFF", "m_F"), ("f", "f2"))
    proof.chain("j_fcf", "j", "fcf", ("fcF", "j"), ("fcf", "f2"))
    proof.chain("d2", "bh", "cfcf", ("cfch", "b_cfc"), ("cfcf", "h_f"))
    proof.chain("fiber", "jh", "FC",
                ("fcfh", "j_fcf"), ("fcff", "h_f"), ("fc", "f2"),
                ("Fc", "f2"), ("FC", "c2"))
    left = relations["corner"][0]
    reduced = proof.replace(left, "bh", "cfcf", "d2")
    reduced = proof.replace(reduced, "HJ", "cf", "fiber")
    reduced = proof.replace(reduced, "f", "qq", "qq_f")
    require(reduced == "cqq" * (4 + k), "unexpected residual corner word")


def verify_finite(case, relations):
    k = case["k"]
    table = case["signed_right_action"]
    reps = case["representatives"]
    require(len(table) == len(reps) == 2 * k and reps[0] == "", "table size or base row")
    for row in table:
        require(len(row) == len(SIGNED_COLUMNS)
                and all(type(j) is int and 0 <= j < len(table) for j in row),
                "ill-formed signed row")

    def follow(row, word):
        for letter in word:
            row = table[row][SIGNED_COLUMNS.index(letter)]
        return row

    for i, rep in enumerate(reps):
        require(follow(0, rep) == i, f"unreached row {i}")
        for letter in SIGNED_COLUMNS:
            require(follow(i, letter + letter.swapcase()) == i, "inverse edge fails")
        for name, (left, right) in relations.items():
            require(follow(i, expand(left)) == follow(i, expand(right)),
                    f"{name} fails at row {i}")

    # Independently check that the table agrees with the upper-bound normal forms.
    for j in range(k):
        for e in (0, 1):
            i = 2 * j + e
            b = 2 * ((j + 2 * e - 1) % k) + 1 - e
            c = 2 * j + 1 - e
            require(reps[i] == "cb" * j + "c" * e, "representative differs from normal form")
            require(table[i] == [i, b, b, c] * 2, "normal form transition differs")
    require(case["abelian_order"] == 2 and k % 2 == 1, "incorrect abelianization")


def verify_infinite(case, relations):
    # The permutations below commute with translating the first coordinate by 2.
    # Testing n=0 and n=1 suffices for an equality of their compositions.
    modulus = 4 + case["k"]

    def q(point):
        n, j, e = point
        if j == 1:
            return n + 1, 0, 1 - e
        if j == 0:
            return n - 1, 1, e
        if n % 2 == 0:
            return n + 1, j, e
        return n - 1, j, 1 - e

    def c(point):
        n, j, e = point
        return n, (j + 1 - 2 * e) % modulus, 1 - e

    # Reverse substitutions into the original E02 generators.
    substitutions = {"f": "qq", "l": "qc", "b": "cqqc", "c": "c"}

    def act(word, point):
        for letter in reversed(word):
            if letter == "c" or letter == "C":
                point = c(point)
            elif letter == "q":
                point = q(point)
            elif letter == "Q":
                point = q(q(q(point)))
            else:
                raise ValueError(f"unexpected permutation symbol {letter}")
        return point

    def image(word):
        parts = []
        for letter in expand(word):
            positive = substitutions[letter.lower()]
            parts.append(positive if letter.islower() else inverse(positive))
        return "".join(parts)

    require(case["abelian_order"] == 4 and modulus % 2 == 1, "incorrect abelianization")
    require(case["dihedral_factor_order"] == 2 * modulus, "incorrect dihedral order")
    for n in (0, 1):
        for j in range(modulus):
            for e in (0, 1):
                point = (n, j, e)
                require(act("qq", point) == (n, j, 1 - e), "q^2 must flip e")
                require(act("qqqq", point) == point, "q^4 relation")
                require(act("cc", point) == point, "c^2 relation")
                require(act("cqq" * modulus, point) == point, "dihedral relation")
                for name, (left, right) in relations.items():
                    require(act(image(left), point) == act(image(right), point),
                            f"{name} fails in infinite action at {point}")
                require(act(image("q"), point) == q(point), "reverse map fails on q")
        require(act("qc", (n, 0, 0)) == (n + 1, 0, 0), "qc does not translate n")
    start = (0, 0, 0)
    forms = {act("cqq" * j + "c" * e, start) for j in range(modulus) for e in (0, 1)}
    require(len(forms) == 2 * modulus, "dihedral factor action collapses")


def verify(data):
    require(data["format"] == "sp4-cert-e03-v1"
            and data["signed_columns"] == list(SIGNED_COLUMNS), "unsupported table format")
    cases = data["cases"]
    require([(case["d"], case["s"]) for case in cases] == [(11, 0), (11, 1), (17, 0), (17, 1)],
            "scope differs from the four frozen cases")
    for case in cases:
        d, slope, k = case["d"], case["s"], case["k"]
        require(type(k) is int and 3 * k == d - 8, "incorrect corner exponent")
        relations = original_equations(k, slope)
        if slope == 0:
            prove_s0(k, relations)
            verify_finite(case, relations)
            result = f"finite order {2*k}"
        else:
            prove_s1(k, relations)
            verify_infinite(case, relations)
            result = f"infinite, factors C4 and D{case['dihedral_factor_order']}"
        print(f"d={d}, s={slope}, k={k}: {result}; abelianization C{case['abelian_order']}")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("certificate", type=Path, nargs="?",
                        default=Path(__file__).with_name("e03_cases.json"))
    args = parser.parse_args()
    with args.certificate.open(encoding="utf-8") as stream:
        verify(json.load(stream))


if __name__ == "__main__":
    main()
