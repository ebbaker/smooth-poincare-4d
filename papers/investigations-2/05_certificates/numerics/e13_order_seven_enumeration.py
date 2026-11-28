#!/usr/bin/env python3
"""E13 HLT enumeration of the original signed words in Remark 8.12."""

import argparse
import json
from pathlib import Path
import subprocess
import sys
import time

import e02_e70_sweep as hlt


SLOPES = (0, -1)
SIGNED_COLUMNS = "abcABC"
LETTERS = dict(zip((1, 2, 3, -1, -2, -3), SIGNED_COLUMNS))
MAX_COSETS = 20_000
MAX_SECONDS = 60


def original_relators(slope):
    """Expand the arc words and encode LHS * RHS^-1 in printed order."""
    a, b, c, A, B, C = ([letter] for letter in LETTERS)
    word, inverse = hlt.W, hlt.inv
    u = word(B, a, b)
    d = word(C, a, c)
    w = word(C, A, b, a, c)
    v = word(u, w, inverse(u))
    longitude_j = word(b, inverse(v), C)
    longitude_belt = word(A, b)
    return [
        word(d, inverse(word(v, u, inverse(v)))),
        word(b, inverse(word(w, v, inverse(w)))),
        word(c, inverse(word(B, a, c, A, b))),
        word(a, a, a, longitude_j),
        word(hlt.power(c, slope), longitude_belt),
        word(b, b),
    ]


def enumerate_slope(slope):
    relators = original_relators(slope)
    capture = {}

    def capture_return(frame, event, result):
        if event == "return" and result is not None:
            capture.update(table=frame.f_locals["table"], parent=frame.f_locals["parent"])
        return capture_return

    def trace_enumerator(frame, event, _argument):
        if event == "call" and frame.f_code is hlt.coset_enumeration.__code__:
            frame.f_trace_lines = False
            return capture_return
        return None

    previous_trace = sys.gettrace()
    sys.settrace(trace_enumerator)
    try:
        order, provisional = hlt.coset_enumeration(
            3, relators, subgens=(), max_cosets=MAX_COSETS
        )
    finally:
        sys.settrace(previous_trace)

    result = {
        "slope": slope,
        "relators": ["".join(LETTERS[letter] for letter in relation) for relation in relators],
        "status": "closed" if order is not None else "coset cap",
        "final_cosets": order,
        "provisional_cosets": provisional,
    }
    if order is not None:
        parent = capture["parent"]

        def root(index):
            while parent[index] != index:
                index = parent[index]
            return index

        roots = [index for index in range(len(parent)) if parent[index] == index]
        ordinals = {index: ordinal for ordinal, index in enumerate(roots)}
        assert len(parent) == provisional and len(roots) == order and roots[0] == 0
        result["right_action"] = [
            [ordinals[root(destination)] for destination in capture["table"][index]]
            for index in roots
        ]
    return result


def follow(table, row, word):
    for letter in word:
        row = table[row][SIGNED_COLUMNS.index(letter)]
    return row


def verify_action(result, expected):
    """Verify the signed table and compare marked actions without enumerating."""
    table = result["right_action"]
    order = result["final_cosets"]
    if len(table) != order or any(len(row) != len(SIGNED_COLUMNS) for row in table):
        return False
    for row, transitions in enumerate(table):
        for column, destination in enumerate(transitions):
            if not 0 <= destination < order or table[destination][(column + 3) % 6] != row:
                return False
        if any(follow(table, row, relation) != row for relation in result["relators"]):
            return False
    image = [follow(table, 0, word) for word in expected["representatives"]]
    if sorted(image) != list(range(order)):
        return False
    return all(
        table[image[row]] == [image[destination] for destination in transitions]
        for row, transitions in enumerate(expected["right_action"])
    )


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--worker", type=int, choices=SLOPES)
    arguments = parser.parse_args()
    if arguments.worker is not None:
        print(json.dumps(enumerate_slope(arguments.worker)))
        return

    runs = []
    for slope in SLOPES:
        command = [sys.executable, "-B", __file__, "--worker", str(slope)]
        start = time.monotonic()
        try:
            child = subprocess.run(command, capture_output=True, text=True, timeout=MAX_SECONDS)
        except subprocess.TimeoutExpired:
            result = {"slope": slope, "status": "time cap"}
        else:
            if child.returncode:
                result = {"slope": slope, "status": "worker error", "stderr": child.stderr}
            else:
                result = json.loads(child.stdout)
        result["elapsed_seconds"] = round(time.monotonic() - start, 6)
        runs.append(result)

    expected = json.loads(Path(__file__).with_name("e12_signed_tables.json").read_text())
    assert expected["signed_columns"] == list(SIGNED_COLUMNS)
    for result, reference in zip(runs, expected["tables"], strict=True):
        assert result["slope"] == reference["slope"]
        result["verified_and_matches_e12"] = (
            verify_action(result, reference) if result["status"] == "closed" else None
        )
    print(json.dumps({
        "format": "sp4-cert-e13-v1",
        "signed_columns": list(SIGNED_COLUMNS),
        "subgroup_generators": [],
        "max_provisional_cosets": MAX_COSETS,
        "max_seconds_per_slope": MAX_SECONDS,
        "runs": runs,
    }, indent=2))


if __name__ == "__main__":
    main()
