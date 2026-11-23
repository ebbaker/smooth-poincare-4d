# SP4-CME-E79 request v1 — value-small inverse for the actual orbit direction

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Fixed E work under B47. Helper configured gpt-6.2-sol/ultra; actual lead identifiers unavailable. Own notes/79_VALUE_SMALL_ORBIT_INVERSE_20261122.md and research-progress/handoffs/SP4-CME-E79_RETURN_v1.md only.

Frozen inputs:
- notes/71_LINEAR_ROUND_SLICE_20261122.md SHA-256 40a572ac01c81e65ec41798721a378fbff082a9023fcd7d69faec74dbff809ef
- reviews/E73_LINEAR_SLICE_AUDIT_20261122.md SHA-256 d64056adc3bfff226ba69a9cccff29a7a667b946d394f4be0a933c7eb0cc099f
- notes/48_FIXED_STABILITY_GAUGE_20261122.md SHA-256 b2b5f9cecc513d4eff4726f091883cb8995535513e05e57a4fc97e22aa421e8b

Read B47_VALUE_SMALL_ORBIT_INVERSE_20261122.md. Same smooth positive native round setup; A=A0+a, beta=F_A−F0 both sup-small. All target adjoints, norms and orthogonality are fixed reference ones. Check C_A, Pi_A and K_A in B47, including nonsymmetric weak form and the N-annihilator identity. Prove the restriction K_A:H1 intersect N-perp → {H−1 functionals annihilating N} is an isomorphism with bounds uniform under a fixed sufficiently small value tube, by perturbing E71 coercivity, not by assuming no stabilizer.

For every L2 one-form r derive phi and u and the target-slice residual, with ||phi||H1+||u||L2+||residual||L2≤C||r||L2. Prove the residual is a bounded projection with range the fixed slice, determine its exact kernel as the closed image of the restricted orbit parameters, and describe what happens for excluded N directions. Do not call this projection orthogonal unless it is proved. Establish smoothness for smooth A,r and integer Sobolev estimates with dependence on the necessary coefficient derivatives honestly stated. Verify the actual A-horizontal infinitesimal action and its sign relation to inverse pullback. Give only the infinitesimal result; nonlinear slice existence and orbit evolution remain out of scope. Return derivation, hashes, authorship and source inspection status; no shared edits or new strategy.
