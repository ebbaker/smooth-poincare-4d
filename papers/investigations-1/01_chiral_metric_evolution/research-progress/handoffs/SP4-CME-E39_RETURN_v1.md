# SP4-CME-E39 return v1 — heat smoothing and Hessian integrability

22 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol` /
`ultra`. Actual backend model and effort were not independently exposed.
Selected lead settings unavailable. Return to [request v1](SP4-CME-E39_REQUEST_v1.md).
The [derivation](../../notes/39_GAUGE_DERIVATIVE_HEAT_MODEL_20261122.md)
contains the kernel calculations and the example.

## Disposition

Gaussian cancellation on the periodic lift gives
\(\int_0^T\|D^2 H_t f\|_\infty dt\le
2C_2\int_0^{\sqrt{T}}\omega_f(r)\,dr/r\), a finite sufficient
condition for Dini data. The gradient bound
\(\int_0^T\|\nabla H_t f\|_\infty dt\le2C_1\sqrt T\|f\|_\infty\)
holds for any continuous scalar data.

The prescribed disjoint family works with \(j\ge3\) and fixed \(L=4\).
It gives continuous, non-Dini \(f\). On each window
\([r_j^2,2r_j^2]\), the diagonal Euclidean Hessian contribution
from bump \(j\) at \(x_j\) is negative of size at least
\(c_\psi a_j/r_j^2\). Entire other-bump and periodic-image tails
are \(o(a_j/r_j^2)\), uniformly on the window, by the
Gaussian distance bounds in the note. The windows are
disjoint and contribute a divergent harmonic sum to
\(\int_0^T\|D^2 H_t f\|_\infty dt\), for every \(T>0\).
The uniform velocity of \(X_t=\nabla H_t f\) remains integrable.

This is a counterexample to the continuous-data implication
for one direct ordinary-flow sufficient condition. It makes
no claim whether the scalar flow has a limit or whether the
actual geometric gauge can be recovered.

## Frozen inputs

| Branch input | Checked SHA-256 |
| --- | --- |
| `brainstorm/notes/B32_GAUGE_DERIVATIVE_MODEL_20261122.md` | `c75249b55726a10a31b7bf8ac744744e84a5f16d8dfaca7217154afa2db697d7` |
| `notes/28_FIXED_GAUGE_CORRESPONDENCE_20261122.md` | `b5bc0ba6f3981370f29027481a8293083e3fc93e9fa013e4494ab86767f74175` |
| `notes/24_TEMPORAL_BOOTSTRAP_20261122.md` | `99e7fe2a042f8195d310f85a38744f5e6bb76cf47221d948419a3236aff6fc44` |
| `research-progress/handoffs/SP4-CME-E39_REQUEST_v1.md` | `e0ebf0414ef12f1068fee7064395246455f9a8fdf46dc189c4bc9d497fbdbf5e` |

The proof uses direct Gaussian identities and no numerical artifact.
