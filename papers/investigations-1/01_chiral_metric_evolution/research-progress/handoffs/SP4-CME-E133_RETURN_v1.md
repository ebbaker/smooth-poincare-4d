# SP4-CME-E133 return v1 — conditional round-orbit value comparison

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E combination, helper launch configured
gpt-6.2-sol/ultra. Independent runtime attestation and selected lead
settings were unavailable. I authored E129 and E57 and audited the
E76 smooth limit and E90 manuscript integration in E77/E78 and E97.
I did not author E14, E90, E76 or E131.
[Request][req] · [Derivation][note].

## Disposition

The conditional implication closes. With one fixed small value
basin and the stated pending head/tail bounds, the initial live
Lorentz strain norm \(\ell\) controls the extra integral
\(\int_0^\infty\|T\|_{\infty,\mathrm{live}}\,d\tau\le C\ell\).
On the head use E129's reconstructed blocks at derivative orders
zero and one, whose integrated weights are bounded by \(H_h(q)\).
On the tail use the assumed exponentially decaying fixed \(H^5\)
defect and uniform stable background. Same-native-time recovery
preserves each live supremum.

The physical connection velocity in native time satisfies
\(|A_\tau|_{\mathrm{live}}\le216\sqrt2\,|T|\) by E14's conjugated
coefficient and the native unit self-dual triple. The physical
curvature velocity satisfies
\[
 |F_\tau|_{\mathrm{live}}\le
   \sqrt{\tfrac32}(360|\nabla^AT|+4512|T|^2).
\]
This uses the exact pairing, clock and two-form norm conversion
of E14, and removes \(S^{-1}\) with \(\|S\|_{\rm op}\le\sqrt3\).
No lower eigenvalue premise enters these velocity bounds.

Let \(\mathfrak d=C_*J(\infty)\le C\ell\). In the original fixed
identification, E14's metric comparison and the initial value
tube convert the one- and two-form velocities to the fixed norm
at costs \(Ce^{\mathfrak d/2}\) and \(Ce^{\mathfrak d}\), respectively.
Their time integrals and the assessed E76 joint smooth limit give
\[
 \|A_{\rm in}-j_\infty^*A_0\|_{C^0,G}
 +\|F_{A_{\rm in}}-j_\infty^*F_0\|_{C^0,G}
       \le C e^{C\ell}\ell .
\]
The same smooth equivariant \(j_\infty\) acts on both components,
covering an orientation-preserving base diffeomorphism. A different
splice in the conditional recovery still gives the same original
solution by uniqueness. The estimate is linear on any fixed small
\(\ell\) interval and needs no separate \(\ell\) threshold as stated.

For \(h_\infty=f_\infty^*G\) of native curvature \(1/2\), the original
pointwise conserved volume gives \(dV_{g_{\rm in}}=dV_{h_\infty}\)
exactly. E14 and the smooth limit give two-sided metric and \(Q\)
form comparisons with factors \(e^{\pm\mathfrak d}\). Distances and
diameter use \(e^{\pm\mathfrak d/2}\) and the round diameter
\(\pi\sqrt2\). Every scalar Laplace eigenvalue with multiplicity
has factors \(e^{\pm\mathfrak d}\) in the common measure. The
supplied round Sobolev energy coefficient gains \(e^{\mathfrak d}\)
and its \(L^2\) coefficient is the same. These are intrinsic
comparisons to the common round pullback. The separate fixed
\(C^0\) value estimate supplies no derivative or recovery-map
control. The E129/E131 combination remains an explicit conditional
premise here. This packet gives neither a new existence assertion
nor a new source inspection. Only its note and return were edited.

## File identities

| Input or output | SHA-256 |
| --- | --- |
| [E133 request][req] | b41a9b2b2dca45080a429f0160a0c950266b775caaa50fc29d09607d39d2951d |
| [B69][b69] | 6ba84ef0e69ec0576098ce7fc1e4372049adda82b3757e0c0f11d0087e410dc5 |
| [E14][e14] | 204022875cd34b4672850e9e9540c9a099caa21f8f35c4c82915b359d4412193 |
| [E84][e84] | fe797084cd48a30858829cdecce8af5c97249694681916f55c9a934f1c5486b9 |
| [E90][e90] | 6d67f6bc601df3dc0940ee8815be30f26c83c2849f6153913deb61569ef69395 |
| [E129][e129] | d8934b1c8fce1ed0cec01ae8f4deec591d85eaccdab25e6a7cd08abd065cf707 |
| [E129 return][r129] | 2d255a480f8df5f584770a8f9217f5a0b5e1e5bacc0c23176478e22ea3128129 |
| [E132 return][r132] | 0a856856c80e09b0b61e52bb73e1fe3d0e61807c37a3a2f566c77e405579c902 |
| [E131 request][req131] | 8e438e8674a666f8b70272c850fbd58d3709e4d1796c44c3cdc841fa0c38dba2 |
| [E131][e131] | 8fc6b6416e2e4d5bb0a17b1dad74eada29a2bf41668d197880fbf313d9ab4e80 |
| [E131 return][r131] | a727bd65aabaa7efefe33a117b46c0b2a8304707c0742e2315d5479bbfab33d1 |
| [E76][e76] | 2365f03b30b930c86952faf2503f9d03b30c05fbb9e5a1c75b4a4c18ad3a2ab0 |
| [E133 derivation][note] | a5d8820b213c0d5002ecdd417778fc1a2795ee6b56469c52194ccb5eda01d3bf |

[req]: SP4-CME-E133_REQUEST_v1.md
[note]: ../../notes/133_CONDITIONAL_ROUND_ORBIT_VALUE_COMPARISON_20261122.md
[b69]: ../../brainstorm/notes/B69_QUANTITATIVE_ORBIT_COMPARISON_20261122.md
[e14]: ../../notes/16_TEMPORAL_STRAIN_CRITERION_20261122.md
[e84]: ../../notes/84_INTRINSIC_SLICE_ORBIT_BUDGET_20261122.md
[e90]: ../../notes/90_INTRINSIC_ALMOST_ROUND_GEOMETRY_20261122.md
[e129]: ../../notes/129_CONDITIONAL_INTRINSIC_ENDPOINT_HEAD_20261122.md
[r129]: SP4-CME-E129_RETURN_v1.md
[r132]: SP4-CME-E132_RETURN_v1.md
[req131]: SP4-CME-E131_REQUEST_v1.md
[e131]: ../../notes/131_CONDITIONAL_DEFECT_SENSITIVE_TAIL_20261122.md
[r131]: SP4-CME-E131_RETURN_v1.md
[e76]: ../../notes/76_HIGH_ORDER_STABLE_LIMIT_20261122.md
