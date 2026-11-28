"""Replay a based signed table and free-group proofs of all edge equalities."""
import json
import sys
from pathlib import Path


def inverse(word):
    return [-letter for letter in reversed(word)]


def require(test, reason):
    if not test:
        raise ValueError(reason)


def check(data):
    rank = data["rank"]
    require(type(rank) is int and rank > 0, "invalid rank")
    alphabet = list(range(1, rank + 1)) + list(range(-1, -rank - 1, -1))
    def word(value):
        require(isinstance(value, list) and all(type(x) is int and x in alphabet for x in value),
                "invalid word")
        return value

    relators = list(map(word, data["relators"]))
    reps = list(map(word, data["representatives"]))
    table, proofs = data["right_action"], data["proofs"]
    n = len(reps)
    require(n and reps[0] == [] and len(table) == len(proofs) == n, "invalid table dimensions")
    for row, edges in zip(table, proofs):
        require(len(row) == len(edges) == len(alphabet), "invalid row width")
        require(all(type(j) is int and 0 <= j < n for j in row), "invalid table entry")

    def follow(i, letters):
        for g in letters:
            i = table[i][alphabet.index(g)]
        return i

    neutral = {tuple([g, -g]) for g in alphabet}
    for r in relators:
        for w in (r, inverse(r)):
            for cut in range(len(w)):
                neutral.add(tuple(w[cut:] + w[:cut]))
    for i, rep in enumerate(reps):
        require(follow(0, rep) == i, "unreachable representative")
        require(all(follow(i, r) == i for r in relators), "relator fails on row")
        for col, g in enumerate(alphabet):
            j = table[i][col]
            require(follow(j, [-g]) == i, "inverse edge fails")
            w = rep + [g] + inverse(reps[j])
            for pos, old, new in proofs[i][col]:
                old, new = word(old), word(new)
                require(type(pos) is int and 0 <= pos <= len(w) and w[pos:pos+len(old)] == old,
                        "rewrite occurrence")
                require(tuple(old + inverse(new)) in neutral, "rewrite lacks relator or free pair")
                w[pos:pos+len(old)] = new
            require(w == [], "edge proof incomplete")
    return n


if __name__ == "__main__":
    print("verified order", check(json.loads(Path(sys.argv[1]).read_text())))
