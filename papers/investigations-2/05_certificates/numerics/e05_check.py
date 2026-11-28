#!/usr/bin/env python3
"""Independently check an SP4-CERT-E05 result with Python 3.10+."""

import hashlib
import json
import sys
import time


START = "0|XyyxYYY,XyxxYXX"
GOAL = "0|x,y"
LIMITS = {"moves": 4, "length": 16, "active_z": 1,
          "stabilization_operations": 1, "states": 500_000, "seconds": 120}
INVERSE_PAIRS = ("xX", "Xx", "yY", "Yy", "zZ", "Zz")


def cancel(word):
    # Repeated deletion of adjacent inverse pairs terminates at the reduced word.
    while True:
        shortened = word
        for pair in INVERSE_PAIRS:
            shortened = shortened.replace(pair, "")
        if shortened == word:
            return word
        word = shortened


def encode(spent, words):
    return spent + "|" + ",".join(words)


def admitted_edges(code):
    spent, packed = code.split("|")
    words = packed.split(",")
    alphabet = "xXyY" if spent == "0" else "xXyYzZ"
    for position, word in enumerate(words):
        edits = [(word[::-1].swapcase(), ["invert", position + 1])]
        for generator in alphabet:
            edits.append((generator + word + generator.swapcase(),
                          ["conjugate", position + 1, generator]))
        for source, multiplier in enumerate(words):
            if source == position:
                continue
            edits.append((word + multiplier, ["multiply", position + 1, source + 1, 1]))
            edits.append((word + multiplier[::-1].swapcase(),
                          ["multiply", position + 1, source + 1, -1]))
        for raw_word, move in edits:
            changed = words.copy()
            changed[position] = cancel(raw_word)
            if sum(map(len, changed)) <= LIMITS["length"]:
                yield encode(spent, changed), move

    # The only way to acquire z from START consumes the one allowed operation.
    # Consequently a terminal (z,z) cannot be removed by an admissible path.
    if spent == "0" and sum(map(len, words)) + 1 <= LIMITS["length"]:
        yield encode("1", words + ["z"]), ["stabilize"]


def verify_witness(witness):
    require(isinstance(witness, list) and len(witness) <= LIMITS["moves"], "witness length")
    code = START
    for step in witness:
        require((step["state"], step["move"]) in admitted_edges(code), "illegal witness move")
        code = step["state"]
    require(code == GOAL, "witness endpoint")


def require(condition, problem):
    if not condition:
        raise SystemExit("E05 check failed: " + problem)


def verify(record):
    require(record["schema"] == "SP4-CERT-E05/1", "schema")
    require(record["start"] == START and record["goal"] == GOAL, "endpoints")
    require(record["limits"] == LIMITS, "bounds")
    require(record["status"] in ("exhausted", "success"), "incomplete result")
    require(record["cap_hit"] is None, "cap hit")
    require(0 <= record["elapsed_seconds"] <= LIMITS["seconds"], "reported time")
    require(len(record["layers"]) == LIMITS["moves"] + 1, "number of layers")

    deadline = time.monotonic() + LIMITS["seconds"]
    reachable = set()
    shell = {START}
    for depth, reported in enumerate(record["layers"]):
        digest = hashlib.sha256()
        for code in sorted(shell):
            digest.update(code.encode("ascii"))
            digest.update(b"\n")
        require(reported == {
            "depth": depth,
            "count": len(shell),
            "stabilization_used_count": sum(code.startswith("1|") for code in shell),
            "sha256": digest.hexdigest(),
        }, f"layer {depth}")
        reachable.update(shell)
        if depth == LIMITS["moves"]:
            break
        next_shell = set()
        for code in shell:
            require(time.monotonic() < deadline, "checker time cap")
            for candidate, _move in admitted_edges(code):
                if candidate not in reachable and candidate not in next_shell:
                    require(len(reachable) + len(next_shell) < LIMITS["states"], "checker state cap")
                    next_shell.add(candidate)
        shell = next_shell

    require(time.monotonic() < deadline, "checker time cap")
    require(len(reachable) == record["distinct_states"], "distinct state count")
    if GOAL in reachable:
        require(record["status"] == "success", "goal found")
        verify_witness(record["witness"])
    else:
        require(record["status"] == "exhausted" and record["witness"] is None, "goal absent")
    print(f"Verified {len(reachable):,} states over {len(record['layers'])} layers: {record['status']}.")


if __name__ == "__main__":
    if len(sys.argv) != 2:
        raise SystemExit("usage: e05_check.py e05_result.json")
    with open(sys.argv[1], encoding="utf-8") as source:
        verify(json.load(source))
