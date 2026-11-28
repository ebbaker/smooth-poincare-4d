#!/usr/bin/env python3
"""Check signed actions on Remark 8.12's three original meridians."""

import argparse
import json
from pathlib import Path


ALPHABET = "abcABC"


def require(condition, message):
    if not condition:
        raise ValueError(message)


def inverse(word):
    return word[::-1].swapcase()


def relators(slope, impose_cone=True):
    # These are the lead's signed transcription of the actual v2 remark.
    u = "Bab"
    d = "Cac"
    w = "CAbac"
    v = u + w + inverse(u)
    longitude_j = "b" + inverse(v) + "C"
    longitude_a = "Ab"
    rows = {
        "d = v u v^-1": d + inverse(v + u + inverse(v)),
        "b = w v w^-1": "b" + inverse(w + v + inverse(w)),
        "c = b^-1 a c a^-1 b": "c" + inverse("BacAb"),
        "J surgery": "aaa" + longitude_j,
        "belt surgery": ("C" if slope == -1 else "") + longitude_a,
    }
    if impose_cone:
        rows["old cone"] = "bb"
    return rows


def exponents(word):
    return tuple(word.count(letter) - word.count(letter.upper()) for letter in "abc")


def check_action(table):
    slope = table["slope"]
    reps = table["representatives"]
    action = table["right_action"]
    size = len(action)
    require(len(reps) == size == {0: 6, -1: 8}[slope] and reps[0] == "",
            "incorrect size or root")
    for row in action:
        require(len(row) == len(ALPHABET)
                and all(type(entry) is int and 0 <= entry < size for entry in row),
                "ill-formed row")
    require(all(set(column) == set(range(size)) for column in zip(*action)),
            "signed column is not a permutation")

    def follow(point, word):
        for letter in word:
            point = action[point][ALPHABET.index(letter)]
        return point

    relations = relators(slope)
    for i, rep in enumerate(reps):
        require(follow(0, rep) == i, f"row {i} not reached by its representative")
        for letter in ALPHABET:
            require(follow(i, letter + letter.swapcase()) == i, "inverse edge fails")
        for name, relation in relations.items():
            require(follow(i, relation) == i, f"{name} fails at row {i}")
    require(follow(0, "b") != 0, "old singular meridian acts trivially at the root")
    if slope == -1:
        for i in range(size):
            require(follow(i, "b") == follow(i, "aaaa"), "old meridian is not a^4")
            require(follow(i, "c") == follow(i, "aaa"), "belt meridian is not a^3")
    print(f"s={slope}: {size} reached rows and all original relators verified")


def check_signed_marking():
    ordinary_link_relators = [(0, 0, 0)] * 3
    for slope in (0, -1):
        rows = relators(slope)
        expected = ordinary_link_relators + [(3, 0, -1), (-1, 1, slope), (0, 2, 0)]
        require([exponents(word) for word in rows.values()] == expected,
                f"s={slope}: signs disagree with the source's oriented linking data")
    # Lift the -1 cyclic action to a genuine integral translation before b^2.
    displacements = (1, 4, 3)
    for name, relation in relators(-1, impose_cone=False).items():
        require(sum(n * t for n, t in zip(exponents(relation), displacements)) == 0,
                f"{name} fails in the exterior translation action")
    require(sum(n * t for n, t in zip(exponents("bb"), displacements)) == 8,
            "old singular meridian does not impose translation by eight")
    print("signed longitude exponents verified; s=-1 exterior has (a,b,c) shifts (1,4,3)")


def verify(data):
    require(data["format"] == "sp4-cert-e12-v1"
            and data["signed_columns"] == list(ALPHABET), "unexpected table format")
    require([table["slope"] for table in data["tables"]] == [0, -1], "unexpected slope list")
    check_signed_marking()
    for table in data["tables"]:
        check_action(table)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("certificate", type=Path, nargs="?",
                        default=Path(__file__).with_name("e12_signed_tables.json"))
    args = parser.parse_args()
    verify(json.loads(args.certificate.read_text(encoding="utf-8")))


if __name__ == "__main__":
    main()
