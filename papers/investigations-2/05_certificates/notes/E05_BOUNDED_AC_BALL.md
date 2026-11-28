# SP4-CERT-E05 · The four-move ball of $P$

27 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. The frozen request assigned GPT-6.2 Sol / ultra. The helper inherited the lead configuration, and the actual serving model and reasoning effort are unavailable. Repository baseline `6a422ce7814fe1ad278d6904970e3b19b05a9890`, with the working request identified below.

**Certificate.** The ordered relator tuple $(x,y)$ is absent from the complete directed ball through four moves for the exact based presentation $P$, subject to the path bounds below. It contains 628 distinct augmented states. The state and time caps were both respected.

| Minimum depth | Distinct augmented states | Among these, stabilization used |
| ---: | ---: | ---: |
| 0 | 1 | 0 |
| 1 | 11 | 1 |
| 2 | 52 | 11 |
| 3 | 163 | 63 |
| 4 | 401 | 229 |
| **Total** | **628** | **304** |

## Inputs inspected

- [Frozen request](../research-progress/handoffs/REQUEST_CERT_E05_20261127.md), SHA-256 `add8fe84919ee2c82f6538a4a5aec594c5c10bfc26a2fcb6553bedabe58c053b`.
- [`check_07_entropy_and_presentation.py`](../../../master/brainstorm/notes/claude/ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127_checks/check_07_entropy_and_presentation.py), part (b), SHA-256 `dfaea0b03165a8707443ce6cd90afecc71edfb0951a553fd6d3c351d2ef5dbf9`. The order and the placement of the inverse $x^{-1}$ at the start of each relator follow its code:

  \[
  (r_1,r_2)=(x^{-1}y^2xy^{-3},\ x^{-1}yx^2y^{-1}x^{-2}).
  \]

- [Investigation 07 presentation sources](../../../investigations-1/07_positive_subcritical_entry/notes/PRESENTATION_SOURCES.md), Miller–Schupp candidate, and [proposing note](../../../master/brainstorm/notes/claude/ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127.md), §5.2, at the above baseline. Shehper et al., [arXiv:2408.15332v2, §3.3](https://arxiv.org/html/2408.15332v2#S3.SS3), was opened for the displayed presentation with the negative sign. The computation uses the based words from `check_07` and elementary free reduction.
- [Continuation](../continuation-notes/CONTINUATION.md), C5 and its exact-input list, and [sole register](../research-progress/REGISTER.md), E05 row, as read at intake. SHA-256 prefixes `92c225567d0e68a7` and `c7ec61a0cb15eff5`, respectively. Also inspected the branch [overview](../research-overview/OVERVIEW.md), [plan](../research-plan/PLAN.md), [series rules](../../README.md#working-rules), and [master conventions](../../../master-2/research-overview/OVERVIEW.md#fixed-setting-and-conventions).

## State, moves and coverage

A state is an ordered tuple of freely reduced based words on the active generators, augmented by the integer recording whether the path has spent its stabilization operation. The rank starts at two with generators $(x,y)$. Appending the fresh generator–relator pair $(z,z)$ changes the active generators to $(x,y,z)$ and spends the one allowed stabilization operation. Removing the pair would spend an operation too. Every reachable state of rank three has already used that operation, so removal cannot occur within this ball. The original-rank goal therefore has stabilization count zero.

Each other move inverts one relator, right-multiplies one relator by a distinct relator or its inverse, or sends one relator $r$ to $grg^{-1}$ for one signed active generator $g$. The total freely reduced length at every vertex, including any occurrences of $z^{\pm1}$, is at most 16. Equality of word tuples uses componentwise free reduction, with order and basepoint retained. The start has total length 14.

At each depth, the search enumerates every allowed successor of the preceding layer and retains it if it has appeared at no smaller depth. Each retained state has an admissible path by construction. Conversely, for an admissible path of shortest length to its endpoint, its penultimate vertex can be represented by a path of at most the same length to the same augmented state. That representation has the same active letters and stabilization budget, so it admits the same final move. Induction over the depth therefore gives all admissibly reachable states within four moves.

## Reproduction and digests

The [searcher](../numerics/e05_search.py) uses signed-integer tuples, stack reduction and a predecessor table. The [checker](../numerics/e05_check.py) uses character strings, repeated adjacent-pair deletion and set differences over cumulative reachability. It imports no search code and reconstructs the layers, digest values and target membership. The [result record](../numerics/e05_result.json) contains the exact SHA-256 digest for each layer. A state is encoded as its stabilization count, `|`, and its comma-separated words, using `x`, `y`, `z` for generators and uppercase for inverses. Each layer is hashed as ASCII lexicographically sorted state lines, each terminated with LF.

Run from `05_certificates/numerics/` with Python 3.10 or newer:

```sh
python3 -B e05_search.py > e05_result.json
python3 -B e05_check.py e05_result.json
```

The recorded search took 0.007396 seconds on CPython 3.10.0 (Darwin arm64). The checker confirmed `Verified 628 states over 5 layers: exhausted.`

The named geometric context is the oriented smooth homotopy four-sphere $\Sigma_P$ given by the outward-normal-first boundary of the five-dimensional presentation thickening. This certificate concerns only the bounded algebraic move ball. It uses no geometric import, metric, or chirality convention.
