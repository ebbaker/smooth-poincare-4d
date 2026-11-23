# Lead assessment — E04–E07 conditional estimates and two obstructions

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Selected lead model and effort preserved; actual identifiers unavailable. Helpers were configured as `gpt-6.2-sol` / `ultra`; no independent backend introspection was available. This assessment records the lead's direct reading and algebraic checks, not independent external peer review or a novelty determination.

## E04 accepted within scope

The path calculation correctly uses A-parallel internal frames and Rayleigh quotients at repeated eigenvalues. For D=sqrt(M/m), the trace-free strain T gives |d log D|≤sqrt2 |T|, with no eigenvalue floor in the constant. Compact connectedness and the mean-energy anchor give

\[
D\le\sqrt{(1+r)/(1-r)}e^{\sqrt2 C_T},\quad
m\ge3/(1+2D^2),\quad
|q|\le\sqrt{e_0}+6C_T,\qquad r=\sqrt{2e_0/3}<1.
\]

I checked the trace-three inequality, the anchor's direction, the norm of the difference of orthogonal rank-one projectors, the inverse strain identity and the operator upper bound 2M≤6. All constants refer to the instantaneous reconstructed metric; the path integral itself is parametrization invariant. The uniform-in-time cost bound is an explicit hypothesis, not an output. The numerical sufficient thresholds e0≤1/256 and C_T≤1/96 indeed give |q|≤1/8. A vanishing path pseudodiameter does not by itself prove T=0; the note correctly restricts that inference.

## E05 accepted within scope

I differentiated L_Q directly: its coefficient derivative on X equals the three noncommutator quadratic terms in the exact Q equation. This yields the divergence form

\[
Q_t=\nabla^c(L_Q\nabla_cQ)+\sum_c[\nabla_cQ,\Xi_c]
       -24K\sqrt{\det Q}\,q.
\]

The fixed pointwise density permits integration without a missing volume derivative. Closedness and the constant spatial relation mu=2K²dV justify the integration by parts. The skew trace sign in the commutator term, adjoint Frobenius norm sqrt2|b|, Sylvester bound and compatibility inverse all agree with the audited conventions. Under |q|≤1/8, the principal contribution is at most −7|∇Q|², the commutator costs at most 5|∇Q|², and sqrt(det Q)≥3/4. Thus

\[
\mathcal P'\le-2\int|\nabla Q|^2\mu-36K\mathcal P.
\]

This proves a stationary gap for independent critical connections in that pointwise region and conditional exponential energy decay on any smooth interval where the region persists. It does not establish that the region persists. The round quadratic limit has coefficients −8 and −48K, as checked directly from the linear equation. The E04 and E05 hypotheses can therefore be combined into a precise conditional result; this is not a new existence or compactness theorem.

The comparison with Fine v2 §1.6 and Theorem 4.11 uses the inspected primary passages. Fine's theorem assumes proximity in a fixed-background Sobolev norm to a given perfect connection. These scalar/path hypotheses have not been shown to imply entry into that neighborhood. No novelty claim is certified by the bounded source comparison.

## E06 accepted within scope

The global gauge transformation has compact support in a bundle trivialization and extends smoothly by identity. At its center, g=I but g⁻¹dg has two prescribed noncommuting components. Substitution into the exact affine curvature identity gives F_t(∂1,∂2)=−K(2t−1)²e3. The midpoint's wedge Gram is 2K² diag(1,1,0)dV. Both endpoints are globally round and gauge equivalent. This is an actual closed-bundle example against unqualified affine averaging; after aligning these gauges the endpoints coincide. It says nothing against every controlled gluing scheme or the existence of definite data on an arbitrary smooth homotopy sphere.

## E07 accepted within scope

The two listed nonzero matrices have cancelling contractions with the self-dual triple. I checked the quadratic polynomial connection and the wedge quotient: Q(p)=I, ∇Q(p)=tX, and v(p)=0, while |T(p)|=t. The metric's first spatial derivative need not vanish; using self-duality before differentiating the Hodge adjoint correctly includes that derivative. This rules out finite same-point bounds on T depending only on q and v at fixed F and metric. It gives neither a stationary connection nor a flow trajectory. It is fully compatible with E05's integrated estimate.

Two harmless TeX transcription errors in note09 (`qquad` and `-t,dx`) were identified during review; correction is editorial and must preserve the frozen E10 input provenance. They do not affect the calculation.

## Integration and next dependencies

Integrate the divergence equation, conditional gap, real transport comparison and path-cost estimate in the working manuscript, keeping local counterexamples scoped. E08 tests a scalar maximum-principle shortcut; E09 differentiates the transport mismatch to identify which metric curvature it controls; E10 tests spatial concentration on actual globally defined round-bundle connections. These are complementary checks. The main missing analytical bridge is a sufficiently strong scale-sensitive spatial or spacetime estimate, with enough metric geometry for continuation. Initialization on arbitrary homotopy spheres remains separate.

## Reviewed input versions

- [notes/06_TRANSPORT_ANCHOR_ESTIMATE_20261122.md](../notes/06_TRANSPORT_ANCHOR_ESTIMATE_20261122.md) SHA-256 `fee07a471206c1d8183ed7ff75df7ce489a212152a611366e36d983f927aa7eb`
- [notes/07_PINCHED_ENERGY_GAP_20261122.md](../notes/07_PINCHED_ENERGY_GAP_20261122.md) SHA-256 `107896b78624f02ccb83f1712139f294a4cee1f06f5e96d9e2775659effea753`
- [notes/08_AFFINE_GLUiNG_COUNTEREXAMPLE_20261122.md](../notes/08_AFFINE_GLUiNG_COUNTEREXAMPLE_20261122.md) SHA-256 `8d5ffc3f69cec1c91d813ce3e48dd6dc37874f670f941e9f9d3fd8c77462e7d6`
- [notes/09_DISSIPATION_KERNEL_20261122.md](../notes/09_DISSIPATION_KERNEL_20261122.md) SHA-256 `59409de49d5d8a2cb3ef490e39d89b4df7e0fd188fc13a2acbfabeffe4ef7d31`
