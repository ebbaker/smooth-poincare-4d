# E133/E135 — Quantitative joint round comparison assessment

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. The selected lead read the full E133 derivation and E135 audit and checked the native scaling, velocity integration, common limiting map and geometric consequences. Actual lead model and effort unavailable; helpers configured gpt-6.2-sol/ultra without independent runtime attestation.

[E133](../notes/133_CONDITIONAL_ROUND_ORBIT_VALUE_COMPARISON_20261122.md), SHA-256 a5d8820b213c0d5002ecdd417778fc1a2795ee6b56469c52194ccb5eda01d3bf, and [E135](E135_ROUND_ORBIT_COMPARISON_AUDIT_20261122.md), SHA-256 eb448383400b916c3a2940da92bc658796996c1223c6b0350c3be0da16642ede, establish the implication. E133's author also authored E129/E57 and audited the inherited smooth-limit and geometry integrations. E135's auditor authored E14/E76/E131 and audited E84/E90 but did not author E133. The [assessed head](E129_E132_INTRINSIC_HEAD_ASSESSMENT_20261122.md) and [assessed tail](E131_E134_WHOLE_TIME_ENDPOINT_ASSESSMENT_20261122.md) now discharge all endpoint premises. Frozen conditional records remain unchanged.

On one fixed sufficiently small smooth connection/curvature value basin around the positive perfect chiral round connection on the standard oriented Riemannian four-sphere, with native negative Killing pairing and sectional curvature 1/2, there is a single smooth equivariant bundle automorphism \(j_\infty\), with orientation-preserving base map \(f_\infty\), such that
\[
 \|A_{\rm in}-j_\infty^*A_0\|_{C^0,G}
 +\|F_{A_{\rm in}}-j_\infty^*F_0\|_{C^0,G}
 \le Ce^{C\ell}\ell.
\]
Here \(\ell\) is the actual initial live \(L^{4,1}\) strain. There is no separate strain threshold or initial higher-derivative bound. The comparison uses the same original bundle and base identification for both entries and one common limiting map. The bound is linear on any fixed bounded interval of \(\ell\).

The head and tail defect norms separately give \(\int_0^\infty\|T\|_\infty\,d\tau\le C\ell\). The native physical velocities satisfy
\[
 |A_\tau|_g\le216\sqrt2|T|_g,\qquad
 |F_\tau|_g\le\sqrt{3/2}\,(360|\nabla^AT|_g+4512|T|_g^2).
\]
The native adjoint-valued k-form velocity scaling is \(\sqrt2(2K)^{-1-k/2}\). In the direct contraction the native orthonormal self-dual triple has operator constant \(\sqrt{3/2}\). Removing the relative S inverse uses only \(\|S\|_{\rm op}\le\sqrt3\); no prescribed eigenvalue floor enters these two physical estimates.

The relative metric bound with \(d=4512\sqrt2 J\le C\ell\) converts one-form velocity to the fixed reference with factor \(Ce^{d/2}\), and two-form velocity with factor \(Ce^d\). Their integrals reach the already established common smooth limit. Earlier and older splice constructions have the same original solution by smooth uniqueness; no identity of the recovery paths or uniqueness of the limiting automorphism is assumed.

For \(g=g^{\rm F}_{A_{\rm in}}\) and \(h=f_\infty^*G\), original pointwise volume conservation gives \(dV_g=dV_h\) exactly. One has \(e^{-d}h\le g\le e^dh\) and \(e^{-d}I\le Q(A_{\rm in})\le e^dI\). Distances and diameter have factors \(e^{\pm d/2}\), and all nonnegative scalar eigenvalues, counting multiplicity and zero, have factors \(e^{\pm d}\) relative to the round spectrum. The common measure makes both the min–max comparison and the round Sobolev comparison precise: the gradient coefficient gains \(e^d\), the mass coefficient is unchanged. These are relative geometric comparisons to a round pullback; the pair estimate above is in the fixed reference norm.

No recovery-map derivative distance, finite horizontal slice theorem, new existence theorem or arbitrary-manifold initialization follows. No primary text was newly inspected, and no novelty claim is made.
