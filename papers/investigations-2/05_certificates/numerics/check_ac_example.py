"""Replay the inversion/stabilization sublanguage used by the based-prefix trial."""
import json
from pathlib import Path


def run(data):
    state = [list(r) for r in data["initial"]]
    for kind, k in data["moves"]:
        if kind == "invert" and 1 <= k <= len(state):
            state[k-1] = [-s for s in reversed(state[k-1])]
        elif kind == "stabilize" and k == len(state) + 1 and all(
            abs(s) < k for r in state for s in r
        ):
            state.append([k])
        elif kind == "destabilize" and k == len(state) and state[-1] == [k] and all(
            abs(s) < k for r in state[:-1] for s in r
        ):
            state.pop()
        else:
            raise ValueError("invalid move")
    if state != data["target"]:
        raise ValueError("target mismatch")
    print("verified four-move based prefix on P")


if __name__ == "__main__":
    run(json.loads(Path(__file__).with_name("ac_example.json").read_text()))
