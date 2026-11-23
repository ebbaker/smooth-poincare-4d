# SP4-CME-E23 return v1 — fixed flat semilinear closure

22 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol` /
`ultra`. Actual backend model and effort were not independently exposed.
Selected lead settings unavailable. Return to [request v1](SP4-CME-E23_REQUEST_v1.md).
The [derivation note](../../notes/23_SEMILINEAR_LORENTZ_MODEL_20261122.md)
contains the proof and scope.

## Disposition

Completed the contraction for the specified model on Euclidean
\(\mathbb R^4\), with \(K\ge0\) and fixed bounded \(B,C\). The
rearrangement integral is a Banach norm, and averaging translates
proves the spatial heat contraction. Smooth density and fixed-time
Gaussian bounds extend E21 to all \(L^{4,1}\) data. Time-translation
Minkowski and Tonelli prove the forced Duhamel bound from
\(L^1_t L^{4,1}_x\) to \(X\). The proof uses essential mixed-norm
suprema and spatial weak derivatives, and does not assume Bochner
measurability in \(L^\infty_x\).

With \(A=1+A_\nabla+A_2\) the common linear bound and \(b,c\) the
multilinear operator norms, set \(r_*=\min\{1,[8A(1+b+c)]^{-1}\}\).
If \(N=\|U_0\|_{4,1}\le r_*/(2A)\), the unique mild solution in the
radius-\(r_*\) ball satisfies \(\|U\|_X\le2AN\) and has a strong
initial trace. The model temporal integral of the supremum of
\(|\nabla U|+|U|^2\) is bounded by \(2AN+4A^2N^2\), uniformly in \(K\).
This does not account for the variable principal term, moving metric,
or evolving connection in Fine's flow.

## Frozen input identities

| Branch input | Checked SHA-256 |
| --- | --- |
| `brainstorm/notes/B19_ENDPOINT_TRANSFER_DECISION_20261122.md` | `da9868f2aeb22096f941beeb0ca44e351730d6fd4714e0b6c11884b38862af67` |
| `notes/21_LORENTZ_HEAT_BENCHMARK_20261122.md` | `c5a53d4fb0ea3b4754e9ee4fff9b841d1156f6fe7795faabb0f741ff6cdb17a2` |
| `research-progress/handoffs/SP4-CME-E23_REQUEST_v1.md` | `5fc55ec67c05adddeff80b100dfa61cb82e7e3033b9cf687e8c5ec60bc038217` |

The calculation is analytic and uses the independently assessed E21
Gaussian estimate. No numerical artifact was used.
