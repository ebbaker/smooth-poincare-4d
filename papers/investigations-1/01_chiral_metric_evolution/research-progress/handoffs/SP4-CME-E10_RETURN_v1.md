# SP4-CME-E10 return v1 — closed-bundle concentration test

22 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol` / `ultra`.
Actual backend model and effort were not independently exposed. Selected
lead settings unavailable. Return to [request v1](SP4-CME-E10_REQUEST_v1.md).
The [derivation](../../notes/12_CONCENTRATED_INITIAL_DATA_20261122.md)
records the verified family and its scaling.

## Disposition

The frozen compactly supported profile yields actual smooth connections
\(A_\epsilon\) on the fixed round chiral bundle over the standard \(S^4\).
For one sufficiently small fixed \(\delta>0\) they remain round-positive,
and uniformly definite. Their reconstructed metrics are uniformly
comparable to the round metric. The same choice ensures \(|q|\le1/16\). At the center the curvature
is exactly \(F_i(p)=-(1+\delta c_i)\Sigma_i\) with \(c=(1,-1,0)\).
Consequently \(D(p)=(1+\delta)/(1-\delta)>1\) and the center defect is
fixed and nonzero. The perturbation is round outside its shrinking ball.

The curvature and reconstructed metric differences are \(O(\delta)\)
in value and \(O(\delta/\epsilon)\) in first derivatives. The exact
self-duality and Bianchi reduction of the vector field, together with
support volume \(O(\epsilon^4)\), gives
\(\mathcal P=O_\delta(\epsilon^4)\) and
\(\|v\|_A^2=O_\delta(\epsilon^2)\). Normalizing by the fixed topological
curvature volume preserves the first scale. The rescaled nonconstant
profile has a gradient integral of order \(\epsilon^2\), consistent with
E05's instantaneous pinched inequality. E04 gives the exact lower bound
\(C_T\ge\log((1+\delta)/(1-\delta))/\sqrt2\) on each slice.

This excludes a vanishing static bound on \(C_T\), the supremum of \(|q|\),
or the supremum of \(D-1\) from only the two small scalar integrals.
Scale-sensitive, higher-regularity and spacetime estimates remain open.
No claim is made about preservation or singularities of an actual flow.
The lead owns integration and any subsequent decision.

## Frozen input identities

| Branch input | Checked SHA-256 |
| --- | --- |
| `brainstorm/notes/B09_CONCENTRATED_INITIAL_DATA_20261122.md` | `27e084872ae5f24230af5a2df1e6d8d73749b70a4edc03af8e3ee2df43af22bb` |
| `notes/06_TRANSPORT_ANCHOR_ESTIMATE_20261122.md` | `fee07a471206c1d8183ed7ff75df7ce489a212152a611366e36d983f927aa7eb` |
| `notes/07_PINCHED_ENERGY_GAP_20261122.md` | `107896b78624f02ccb83f1712139f294a4cee1f06f5e96d9e2775659effea753` |
| `notes/09_DISSIPATION_KERNEL_20261122.md` | `59409de49d5d8a2cb3ef490e39d89b4df7e0fd188fc13a2acbfabeffe4ef7d31` |
| `research-progress/handoffs/SP4-CME-E10_REQUEST_v1.md` | `9580f01a1762c9955c0edbed5f94cd38248f30404218ff48d5163382333f81d2` |

The assigned proof is analytic. No numerical artifact was used.

## 22 November 2026 — typesetting correction

Two LaTeX spacing commands were restored in equation (8). The original
E10 note used as frozen E12 input had SHA-256 `7b9b522cc827c65a643443d0b537317c9ed35d06f0f495b49244a1bf1f594a16`.
The corrected note SHA-256 is `940d3de5fcc465f039984c34b43acd4211e380fb183b365adfb85b225f38e7ad`.
The packet return before this correction record had SHA-256 `3f7ce79eba563597d1f2fd4ae91d530768ee25cd2a40780b0c0a3197851a713d`.
