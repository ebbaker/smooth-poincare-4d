# SP4-CME-E28 request v1 — Reverse automorphism equation for fixed vertical adjoint

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Authorized configured Sol6.2/ultra; actual lead settings unavailable. No shared edits or chat capture. Read root instructions and B24. Work on a smooth closed oriented real four-manifold, fixed oriented Euclidean rank-three bundle, positive definite component, native Fine metric and time conventions. Preserve distinction from smooth endpoint continuation.

Own notes/28_FIXED_GAUGE_CORRESPONDENCE_20261122.md and research-progress/handoffs/SP4-CME-E28_RETURN_v1.md only.

For fixed smooth definite Abar and a=A−Abar, take xi_fixed(A)=−d_A^{*g_Abar}a−chi_A(S_A^* d_A^{*g_A}d_Aa), with Fine action R(phi+chi_Au,A)=−d_Aphi−S_Au. The corrected adjusted equation is A_t=v(A)−R(xi_fixed(A),A). For any supplied smooth unadjusted path A(t) beginning at Abar, examine the reverse equation r(h^−1)_*h_t=−xi_fixed(h(A)), h(0)=id. Parametrize nearby principal-bundle automorphisms over the base using local base diffeomorphism and SO(3)-gauge components, or a smooth chart in sections of TX plus adE.

Prove exact derivative order at most two in h using d_hatA(hatA−Abar)=F_hatA−F_Abar+[a wedge a]/2 and naturality of F_hatA,g_hatA. Determine whether it is quasilinear in second derivatives of h (including multiplication by inverse first derivative from the group trivialization), with smooth coefficients on invertible first jets. At time zero/identity linearize with eta=phi+chi_Abar u. Retain the horizontal block −S^*w^*w S, and prove its strict negative definiteness from the exact-sequence injection; do not replace it by −|zeta|²S^*S. Account for mixed terms and their differential order. Uniformity on compact reference should be explicit.

For supplied smooth forward and reverse solutions, reproduce the group-product calculation showing the maps invert each other and that two unadjusted solutions with the same initial data reduce to uniqueness of the adjusted solution. Derive the forward recovery ODE and verify integration on compact frame bundle for a sufficiently short interval. Do not assert local PDE solvability without an exact theorem; E29 separately audits that input. Finite scope this one corrected generator and its two transformations.

## Frozen inputs

- `brainstorm/notes/B24_LOCAL_GAUGE_CLOSURE_20261122.md` SHA-256 `d688094532c759d3b7cd1291723fba58a42b0e5f6f743e28f5ce18c593129055`
- `notes/26_FINE_GAUGE_ENDPOINT_GAP_20261122.md` SHA-256 `ead9a835093bbd4381438eeee5c8e29d1402a5418b131ec665c53c4886d5ed08`
- `notes/27_FIXED_ADJOINT_GAUGE_TEST_20261122.md` SHA-256 `755dbe5d1956bdc895f8da2214e9d6e0e9aa405d28f87958373a7d4c59fb1590` (wording correction complete before issue).
