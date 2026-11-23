# SP4-CME-E128 request v1 — Mixed parabolic coefficient products

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Bounded E proof test under B66; configured gpt-6.2-sol/ultra; actual lead identifiers unavailable. Own notes/128_MIXED_PARABOLIC_COEFFICIENT_PRODUCTS_20261122.md and research-progress/handoffs/SP4-CME-E128_RETURN_v1.md only. Disclose actual overlap. No shared edits or new geometric theorem.

Work on the fixed smooth closed round Riemannian S4 and fixed smooth finite-rank bundles, with reference metric/derivatives and a fixed finite atlas/inhomogeneous dyadic decomposition as in E53/E57. Let p=8, s=1/2, 0<T<=1. Define M(q)=sum_j 2^(sj) sup_(0<t<=T)||Delta_j q(t)||_8 and H(q)=sum_j 2^((s+2)j) int_0^T||Delta_j q(t)||_8 dt, with fixed atlas summation; E=M+H, F=L1_t B^s_(8,1). All constants may use the fixed atlas and bundles, not T or initial derivative sizes.

Given smooth positive-time compatible coefficient arrays A (on two derivative slots), B (one), C (zero) with ||D^m A(t)||_infinity<=epsilon t^(-m/2), 0<=m<=3, and ||D^m B(t)||_infinity+||D^m C(t)||_infinity<=epsilon t^(-(m+1)/2), 0<=m<=2, prove or refute ||A D²q+B Dq+Cq||_F<=C epsilon E(q) for arbitrary smooth q with finite E, and extend to the relevant completed spaces. No equation for the coefficient arrays may be assumed. Include their inhomogeneous low modes and all paraproduct frequency cases and coordinate/fixed-connection lower terms. Use actual dyadic estimates, not a generic bounded-multiplier claim. The time-frequency split and expected summable factors are in B66; correct any failure precisely.

Separately derive the third weighted spatial-jet bound sup_(0<t<=T/4) sum_(k=0)^3 t^(k/2)||D^k S(u)(t)||_infinity<=C||u||_infinity on a single fixed smaller E42 datum ball using E119's scale-local lift. Check parameter order three plus datum order one, full ordered third derivative extraction including curvature/derivative of curvature and spanning corrections, and radii independent of scale. A third-order Taylor remainder is not requested. State the resulting coefficient bounds for arbitrary smooth pointwise A(U) with A(0)=0 and B(U,DU), C(U,DU) affine in DU with derivative-free parts vanishing at U=0; use the weighted jet estimates and explain the derivative order required. No application to E125 or endpoint theorem is part of this packet.

Return a derivation-level proof or explicit failed estimate/counterexample with exact scope. If a new conceptual choice is required, return it to lead. Use assessed internal Littlewood–Paley conventions; no new external result is required unless a missing dependency is found.

## Frozen inputs

| Input | SHA-256 |
| --- | --- |
| [brainstorm/notes/B66_MIXED_DEFECT_PRODUCT_TEST_20261122.md](../../brainstorm/notes/B66_MIXED_DEFECT_PRODUCT_TEST_20261122.md) | 8b88be9f2ccc4f29ad3b55fd3f81ed0ae7f737d8d22a91d65a1a927c8669399c |
| [notes/53_CRITICAL_FINITE_P_HEAT_20261122.md](../../notes/53_CRITICAL_FINITE_P_HEAT_20261122.md) | 6c30a73e93b435c9a6414628b2125235c0d72d58a93b5919608afb67b882c312 |
| [notes/57_COMPACT_CRITICAL_LINEAR_20261122.md](../../notes/57_COMPACT_CRITICAL_LINEAR_20261122.md) | 8bc1cc7551e137d58324ce9f837c174d0766330f9d61586d14c6c24e4778a3d7 |
| [notes/119_UNIFORM_PARABOLIC_REMAINDER_20261122.md](../../notes/119_UNIFORM_PARABOLIC_REMAINDER_20261122.md) | 4f95593842c04f25d45535912cc91c032cb1588e5fd3892d33cbc194382988ea |
| [reviews/E119_E122_UNIFORM_REMAINDER_ASSESSMENT_20261122.md](../../reviews/E119_E122_UNIFORM_REMAINDER_ASSESSMENT_20261122.md) | 0f3d1c976e6f244e42498ca6cc9a749001a6b73aef06c21be8e97c2a1dfc0174 |
