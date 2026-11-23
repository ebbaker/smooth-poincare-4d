# SP4-CME-E173 return v1 — Small-strain spectral audit

Prepared for Edward B. Baker III with OpenAI assistance, 22 November 2026
(America/New_York). Fixed E audit, configured gpt-6.2-sol/ultra.
Independent runtime and lead-model attestation unavailable. I authored
the inherited E145, E155 and E157 calculations. I did not author E171
or E159. All frozen inputs match.

## Result

Pass in the exact E171 category and native normalization. The full
ordered Hessian satisfies \(6\sqrt3|\nabla^AT|+36\sqrt3|T|^2\)
as an upper bound. Ordinary two-form alternation has norm
\(\sqrt2\). The curvature commutator has squared norm
\(3s_2-9s_3=\sum_{\mathrm{cyc}}\lambda_i(\lambda_j-\lambda_k)^2\).
Its simplex zeros are the round point and three rank-one vertices.
The complementary compact set has a positive minimum and connectedness
selects a single neighborhood under the stated uniform threshold.

On the rank-one neighborhood the smooth global top eigenvector has
\(|D^Av|\le3|T|\). In the induced oriented two-plane connection the
scalar curvature is \(\Omega=\langle F_A,v\rangle/\sqrt2
-\beta_1\wedge\beta_2\). At \(\sup\mathcal G\le\sqrt5/36\),
its square is at least \(\tfrac58dV_g\). Global closedness and
\(H^2(M;\mathbb R)=0\) make its square integral zero by Stokes.
The remaining round neighborhood gives
\(|Q-I|\le72\mathcal G\) pointwise.

The native chiral estimate gives
\(\operatorname{Ric}(X,X)\ge3/2-(2+\sqrt3)(78+8\sqrt3)\mathcal G\)
on unit vectors. The Ricci contribution to the minimum threshold
is \(3/[4(2+\sqrt3)(78+8\sqrt3)]\). The stated real-fiber
threshold \(\sup\Psi\le k^2\varepsilon/(1+4\sqrt3)\),
\(k^2=4\pi/5\), supplies \(\sup\mathcal G\le\varepsilon\).
No mathematical repair or additional geometric premise is needed.

The audit covers one existing smooth slice. Only the designated
audit and return were written and no new source was used.

## Outputs and frozen inputs

| Artifact | Verified SHA-256 |
| --- | --- |
| [E173 audit](../../reviews/E173_SMALL_STRAIN_SPECTRAL_AUDIT_20261122.md) | bd2375c6a7d8b97d3c78551667caceb7d1635be5564c5a6c845f7b58dae7b981 |
| [E173 request v1](SP4-CME-E173_REQUEST_v1.md) | 62f6a1961b92c93c1f142e51d1ef7bb3cb6a97a7e44ff043bd17ff6318390af1 |
| [E171](../../notes/171_SMALL_STRAIN_SPECTRAL_ALTERNATIVE_20261122.md) | 4fc28853a3866f7094aa67471c4e1df40f56ac4a516146a752fd33df624f7e60 |
| [B86](../../brainstorm/notes/B86_SMALL_STRAIN_SPECTRAL_ALTERNATIVE_20261122.md) | 7162b240aed4478c8007a11f2a1f8f520c2601d7689da7b8cd804059c4a2825c |
| [E145](../../notes/145_REAL_TRANSPORT_TEMPORAL_EQUIVALENCE_20261122.md) | 544d6d1299560adcd99327d206ca737d44e4a1449567efac8795176ef34833f4 |
| [E155](../../notes/155_PAIR_COMPACTNESS_FROM_METRIC_LIMIT_20261122.md) | e8533973ae350ab1c887633212fa942fbfbd0b453a0a3949af5051de8d783ce6 |
| [E159](../../notes/159_GEOMETRIC_SEQUENCE_CONTINUATION_20261122.md) | eb5a66fc93fcf8e04e41870caa426e09399944be2a302b008befffb513851156 |
