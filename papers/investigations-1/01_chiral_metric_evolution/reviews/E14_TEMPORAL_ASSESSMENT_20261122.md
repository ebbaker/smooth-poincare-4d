# Lead assessment — E14 temporal geometric criterion

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Selected lead and effort preserved; actual settings unavailable. Helper configured gpt-6.2-sol/ultra, without independent runtime introspection. The lead read the complete derivation and recomputed its key identities.

Accepted within the precise conditional scope. The conjugated coefficient N=S⁻¹CS is polynomial in Q,T. I checked all four polynomial terms and their derivatives; bounds 36|T| and 36|∇T|+156|T|² are conservative. Differentiation of N gives S⁻¹(∇C)S=∇N+[P,N], with the correct sign for P=S⁻¹∇S. The relative curvature velocity then follows directly from d_A v and Bianchi. Antisymmetrization has norm sqrt2, contraction with three self-dual forms costs sqrt3, and J Sigma has norm sqrt2|J|. These give the stated 360 and 4512 constants without a hidden minimum eigenvalue.

The exact reconstruction differential gives |g⁻¹g_t|=2K⁻¹|S⁻¹V| for the ASD coefficient V of F_t. The wedge quotient gives S⁻¹Q_tS⁻¹=−K⁻¹(S⁻¹U+(S⁻¹U)^T) for its SD coefficient U, using mu_t=0. Thus both have bound C*(|∇A T|+|T|²), C*=4512sqrt2. I checked the normalized form factors and the fixed-base hypothesis.

Integrating quadratic-form inequalities avoids eigenvector regularity assumptions and covers multiplicities. If J_tau=∫_0^tau sup_M(|∇A T|+|T|²)dt is finite on the given smooth definite interval, then

\[
e^{-C_*J(t)}g(0)\le g(t)\le e^{C_*J(t)}g(0),\qquad
m(t,x)\ge e^{-C_*J(t)}m(0,x)>0.
\]

This is a dynamical sufficient condition excluding metric and normalized-eigenvalue degeneration in that identification. The hypothesis is not derived from initial energy, speed dissipation, a spatial L⁴ bound or any other estimate in this run. A complete higher-regularity continuation theorem and the control of J_tau remain open. E15 next identifies the exact strain equation and its curvature dependencies; neither the criterion nor its principal symbol is to be described as global convergence.

Reviewed input: [note16](../notes/16_TEMPORAL_STRAIN_CRITERION_20261122.md), SHA-256 `204022875cd34b4672850e9e9540c9a099caa21f8f35c4c82915b359d4412193`.
