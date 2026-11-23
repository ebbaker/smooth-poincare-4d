# SP4-CME-E34 return v1 — frozen Bianchi-completed curvature symbol

22 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol` /
`ultra`. Actual backend model and effort were not independently exposed.
Selected lead settings unavailable. Return to [request v1](SP4-CME-E34_REQUEST_v1.md).
The [derivation](../../notes/34_CURVATURE_BIANCHI_SYMBOL_20261122.md)
records the exact pointwise computation.

## Disposition

The leading differentiated physical and horizontal-gauge terms at the
definite reference give
\(-w_1w_1^*P^*P f-w_1SS^*w_1^*f\), with actual principal curvature
variations \(f=i w_1 b\). The outer derivative of the vertical gauge
is the commutator \(-[F_A,d_A^{*g_{\bar A}}a]\) and has no second-order
curvature symbol. The proposed Bianchi term vanishes on actual
curvature and extends the frozen symbol by \(-\lambda w_2^*w_2\)
on arbitrary amplitudes.

At unit covectors the exact block decomposition is
\(\begin{pmatrix}D&C\\0&\lambda I\end{pmatrix}\)
on \(\operatorname{im}w_1\oplus\ker w_1^*\), with dimension nine
for each subspace. The closed-symbol \(D\) is self-adjoint positive
by (3) in the derivation and the seven-dimensional exact sequence.
With \(d=\lambda_{\min}D>0\) and \(M\ge\|C\|_{\rm op}\), the choice
\(\lambda\ge M^2/(2d)+d/2\) gives Hermitian coercivity at least \(d/2\).
Homogeneity supplies \(|\zeta|^2\), and the same argument gives
uniform constants on a compact definite curvature-value set in
native pairings uniformly comparable to fixed norms.

The result is a frozen reference-point symbol test. A closed
nonlinear system, propagation of exact-curvature and Bianchi
constraints, a coupled gauge theorem, and endpoint regularity
or extension require separate arguments.

## Frozen inputs

| Branch input | Checked SHA-256 |
| --- | --- |
| `brainstorm/notes/B27_CURVATURE_BIANCHI_SYMBOL_20261122.md` | `7e8ec792d0667b02f03d8b8f7d3b2f4015ef3c8a5f7f900daf7913314a60f7ca` |
| `notes/26_FINE_GAUGE_ENDPOINT_GAP_20261122.md` | `ead9a835093bbd4381438eeee5c8e29d1402a5418b131ec665c53c4886d5ed08` |
| `notes/27_FIXED_ADJOINT_GAUGE_TEST_20261122.md` | `755dbe5d1956bdc895f8da2214e9d6e0e9aa405d28f87958373a7d4c59fb1590` |
| `research-progress/handoffs/SP4-CME-E34_REQUEST_v1.md` | `f10ce7a2c9e7f8dfa6677684f7fa044e49fbac3c341e6d2adb51faa66c1dfea0` |

The computation is analytic. No numerical artifact was used.
