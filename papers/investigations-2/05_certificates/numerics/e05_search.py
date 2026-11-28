#!/usr/bin/env python3
"""Bounded Andrews–Curtis search for the presentation in check_07, using Python 3.10+."""

import hashlib
import json
import time


# Each integer is a signed generator, each word a tuple, and each state an
# ordered tuple of relators together with the number of stabilization moves used.
LETTERS = {1: "x", -1: "X", 2: "y", -2: "Y", 3: "z", -3: "Z"}
START = (0, ((-1, 2, 2, 1, -2, -2, -2), (-1, 2, 1, 1, -2, -1, -1)))
GOAL = ((1,), (2,))
MAX_DEPTH = 4
MAX_LENGTH = 16
MAX_STATES = 500_000
MAX_SECONDS = 120


def reduced(word):
    stack = []
    for letter in word:
        if stack and stack[-1] == -letter:
            stack.pop()
        else:
            stack.append(letter)
    return tuple(stack)


def inverse(word):
    return tuple(-letter for letter in reversed(word))


def state_code(state):
    used, words = state
    return str(used) + "|" + ",".join("".join(LETTERS[g] for g in w) for w in words)


def layer_record(depth, layer):
    codes = sorted(state_code(state) for state in layer)
    payload = "".join(code + "\n" for code in codes).encode("ascii")
    return {
        "depth": depth,
        "count": len(layer),
        "stabilization_used_count": sum(state[0] for state in layer),
        "sha256": hashlib.sha256(payload).hexdigest(),
    }


def moves(state):
    used, words = state
    rank = len(words)
    total_length = sum(map(len, words))

    for i, word in enumerate(words):
        replacements = [(inverse(word), ("invert", i + 1))]
        for j, other in enumerate(words):
            if j != i:
                replacements.append((reduced(word + other), ("multiply", i + 1, j + 1, 1)))
                replacements.append((reduced(word + inverse(other)), ("multiply", i + 1, j + 1, -1)))
        for g in range(-rank, rank + 1):
            if g != 0:
                replacements.append((reduced((g,) + word + (-g,)), ("conjugate", i + 1, LETTERS[g])))
        for replacement, move in replacements:
            if total_length - len(word) + len(replacement) <= MAX_LENGTH:
                yield (used, words[:i] + (replacement,) + words[i + 1:]), move

    if used == 0:
        if rank == 2 and total_length < MAX_LENGTH:
            yield (1, words + ((3,),)), ("stabilize",)
        if rank == 3 and words[-1] == (3,) and all(
            3 not in word and -3 not in word for word in words[:-1]
        ):
            yield (1, words[:-1]), ("destabilize",)


def witness(parents):
    current = (0, GOAL)
    if current not in parents:
        return None
    path = []
    while current != START:
        previous, move = parents[current]
        path.append({"move": move, "state": state_code(current)})
        current = previous
    return list(reversed(path))


def search():
    started = time.monotonic()
    deadline = started + MAX_SECONDS
    parents = {START: None}
    frontier = [START]
    layers = [layer_record(0, frontier)]
    cap_hit = None

    for depth in range(1, MAX_DEPTH + 1):
        following = []
        for state in frontier:
            if time.monotonic() >= deadline:
                cap_hit = "time"
                break
            for neighbor, move in moves(state):
                if neighbor in parents:
                    continue
                if len(parents) == MAX_STATES:
                    cap_hit = "states"
                    break
                parents[neighbor] = (state, move)
                following.append(neighbor)
            if cap_hit:
                break
        if cap_hit or time.monotonic() >= deadline:
            cap_hit = cap_hit or "time"
            break
        record = layer_record(depth, following)
        if time.monotonic() >= deadline:
            cap_hit = "time"
            break
        layers.append(record)
        frontier = following

    path = witness(parents)
    if cap_hit:
        status = "incomplete"
    elif path is None:
        status = "exhausted"
    else:
        status = "success"
    return {
        "schema": "SP4-CERT-E05/1",
        "start": state_code(START),
        "goal": "0|x,y",
        "limits": {"moves": MAX_DEPTH, "length": MAX_LENGTH, "active_z": 1,
                   "stabilization_operations": 1, "states": MAX_STATES, "seconds": MAX_SECONDS},
        "status": status,
        "cap_hit": cap_hit,
        "distinct_states": len(parents),
        "layers": layers,
        "witness": path,
        "elapsed_seconds": round(time.monotonic() - started, 6),
    }


if __name__ == "__main__":
    print(json.dumps(search(), indent=2))
