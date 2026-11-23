# SP4-CME-E27 request v1 — Third symbol and fixed-adjoint repair test

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Authorized Sol6.2/ultra; selected lead actual settings unavailable. Own notes/27_FIXED_ADJOINT_GAUGE_TEST_20261122.md and research-progress/handoffs/SP4-CME-E27_RETURN_v1.md only. No shared edits.

Read B23, metric reconstruction/velocity in current manuscript Section4, and Fine primary https://arxiv.org/html/1111.5005v2 Theorem4.10. Work in Fine’s native norms for his gauge terms; state the source metric convention explicitly. Fix smooth definite reference Abar, a=A−Abar. Consider printed operator V(A)=v(A)−d_A d_A^{*g_A}a−S_A S_A^*(d_A^{*g_A}d_A a), S_A(u)=ι_u F_A. v is Fine actual flow and has order two.

Independently compute highest derivative of the vertical term at a nonzero a. In local coordinates use δ_g a=−(sqrt(det g))^−1 ∂i(sqrt(det g)g^{ij}a_j) plus internal bracket terms. Use naturality of the curvature reconstruction to calculate its principal metric variation for b=ι_uF_A with oscillation covector ξ: h=ξ⊗u♭+u♭⊗ξ up to the stated active/passive sign. Check whether the third-order linearized symbol is nonzero proportional to |ξ|² ξ⊗a(u). Exhibit how current A can be round near a point while a(p) is nonzero and Abar remains definite. Verify no other term has order three to cancel it. Preserve exact scope: one printed formula, no theorem-refutation claim.

Then replace only d_A^{*g_A} in the vertical term by d_A^{*g_Abar}; define Vfixed=v−d_A d_A^{*g_Abar}a−S_A S_A^*(d_A^{*g_A}d_A a). Is this operator genuinely second order in A? Are coefficients allowed to depend smoothly on A,∂A with products of second derivatives, or is it quasilinear? Count all derivatives, including live δ on two-forms and S_A. Check the linearization at a=0 agrees with printed reference symbol. Explain precisely which further local parabolic, automorphism-recovery and endpoint regularity arguments remain to establish a flow theorem. Finite scope these two operators only; do not prove global existence or new continuation.

## Frozen inputs

- `brainstorm/notes/B23_FIXED_ADJOINT_GAUGE_TEST_20261122.md` SHA-256 `61522203b82dd7d4b789a193ac01069728f0bdb5d92b75e81dd59f3de4639a84`
- `manuscript/chiral_curvature_and_metric_evolution.tex` SHA-256 `c3858e3ae0f1f0c5a5ab28bcbda461bf0070277a76d120c6da3225b0aa5b910b`
- `reviews/E01_FOUNDATION_ASSESSMENT_20261122.md` SHA-256 `83e1daa219c826454c9201776dd94542095a026d223976c3820dfe6c759045c6`
