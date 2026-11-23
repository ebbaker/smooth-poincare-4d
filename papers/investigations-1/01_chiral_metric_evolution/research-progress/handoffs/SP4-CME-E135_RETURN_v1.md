# SP4-CME-E135 return v1

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and selected
lead settings were unavailable. I authored E14, E76 and E131,
audited E84 in E86 and audited the E90 geometry in E92. I did not
author E133. This independently checks E133's new implication
using its stated premises. See the [request][req] and [audit][audit].

## Velocity and joint pair

Pass under E133 (1). The additional time integral of the strain
supremum follows from the head \(H_h\) block weights \(2^{2j}\)
dominating the derivative orders zero and one, and the tail
exponential \(H^5\) defect bound. Exact slice recovery preserves
those live suprema. This step uses the separate head and tail norms.

For \(c=2K\) a native adjoint-valued \(k\)-form velocity gains
\(\sqrt2 c^{-1-k/2}\). Endomorphism norms are unchanged
internally, and the \(c^{-1}\) live factors in the two terms of
\(J\) cancel \(d\tau=c\,dt\). The direct native contraction uses
the adjoint row operator whose squared norm is \(3/2\) from the
unit self-dual triple \(S^{-1}F\). Thus \(4\sqrt3\sqrt{3/2}\cdot36\)
gives \(216\sqrt2\) for \(A_\tau/|T|\).
The inherited E14 relative curvature coefficients convert with
\(\sqrt2 c^{-2}Kc=1/\sqrt2\). Multiplying by \(S\) costs only
\(\|S\|_{\rm op}\le\sqrt3\), so the native bound is
\(\sqrt{3/2}(360|\nabla^AT|+4512|T|^2)\). There is no assumed
positive eigenvalue floor in these constants.

For \(\mathfrak d=C_*J(\infty)\le C\ell\), original relative
metric control converts the one-form and two-form velocities
to the fixed reference norm with factors \(Ce^{\mathfrak d/2}\)
and \(Ce^{\mathfrak d}\). Integrating in the original fixed
identification and passing to the supplied smooth limit gives
the joint \(C^0(G)\) error \(Ce^{C\ell}\ell\) for one pair
\(j_\infty^*(A_0,F_0)\). Both components use the same smooth
equivariant map, covering an orientation-preserving diffeomorphism.
The early-splice smooth path coincides with the E76 original
path by original smooth uniqueness. No equality of the two
recovery maps is needed. When \(\ell=0\) both velocity integrals
vanish and the original solution is stationary. The exponential
bound has no \(\ell\) threshold and is linear on any fixed
bounded \(\ell\) interval.

## Relative geometry

The original pointwise volume identity and the smooth joint limit
give \(dV_{g_{\rm in}}=f_\infty^*dV_G\) exactly. The bilateral
metric and \(Q\) form comparisons use \(e^{\pm\mathfrak d}\).
The all-point distances and diameter use \(e^{\pm\mathfrak d/2}\)
with native round diameter \(\pi\sqrt2\).
Scalar min–max has the same \(H^1\) domain and common-volume
denominator, giving the two factors \(e^{\pm\mathfrak d}\) for
every eigenvalue with multiplicity, including zero.
The Sobolev gradient coefficient gains \(e^{\mathfrak d}\)
and the \(L^2\) coefficient is unchanged in the comparison.
Conversion from normalized to native scale divides eigenvalues
and the round Sobolev mass coefficient by \(c\).

No correction is needed under the frozen conditional premises.
The pair estimate is absolute in fixed \(C^0(G)\), and the metric
and spectral comparisons are relative to the same round pullback.
No recovery-map distance or finite simultaneous slice result is
asserted. The head was assessed at dispatch, and the E131/E134
lead assessment received during this audit discharges the
stated premises. This audit preserves the frozen E133 text and
does not reassess E131. No new primary source was inspected.
Only the two named E135 artifacts were written.

## Verified identities

| File | SHA-256 |
| --- | --- |
| E135 request | `5711fe52772b4044560b4a52a3dc19d62fb18b8b09e767b726b489eea1f2c5e6` |
| E133 derivation | `a5d8820b213c0d5002ecdd417778fc1a2795ee6b56469c52194ccb5eda01d3bf` |
| E133 request | `b41a9b2b2dca45080a429f0160a0c950266b775caaa50fc29d09607d39d2951d` |
| E133 return | `071d31246872ea6e0cb36573c2be3398dde95dd581954ce02d356c79bbdfdc5b` |
| B69 decision | `6ba84ef0e69ec0576098ce7fc1e4372049adda82b3757e0c0f11d0087e410dc5` |
| E14 | `204022875cd34b4672850e9e9540c9a099caa21f8f35c4c82915b359d4412193` |
| E84 | `fe797084cd48a30858829cdecce8af5c97249694681916f55c9a934f1c5486b9` |
| E90 | `6d67f6bc601df3dc0940ee8815be30f26c83c2849f6153913deb61569ef69395` |
| E76 | `2365f03b30b930c86952faf2503f9d03b30c05fbb9e5a1c75b4a4c18ad3a2ab0` |
| E129 | `d8934b1c8fce1ed0cec01ae8f4deec591d85eaccdab25e6a7cd08abd065cf707` |
| E129/E132 assessment | `e5170702491712d4228a96396e74c60f4d93018d37a64e5f6bc2fd5e8b0da982` |
| E131 | `8fc6b6416e2e4d5bb0a17b1dad74eada29a2bf41668d197880fbf313d9ab4e80` |
| Observed E14 lead assessment | `bd724f630ce71c496dca082b931c1c01a908c7bc2042d09079d3c225c8eca87e` |
| Observed E76/E77 lead assessment | `c4a70f2b0a41c7431c4f866f983d747d6d4d943c3dba3497ff40754599d13da1` |
| Observed E90/E92 lead assessment | `8dc76b69d4143043a95958f42005f12b348999ee59d7265aa33e2d5073bc52ad` |
| Observed E131/E134 lead assessment | `b94e5725c5f75653b7700880538fb3ec801bb04738977d4c1e7cd7376d289d60` |
| E135 audit | `eb448383400b916c3a2940da92bc658796996c1223c6b0350c3be0da16642ede` |

[req]: SP4-CME-E135_REQUEST_v1.md
[audit]: ../../reviews/E135_ROUND_ORBIT_COMPARISON_AUDIT_20261122.md
