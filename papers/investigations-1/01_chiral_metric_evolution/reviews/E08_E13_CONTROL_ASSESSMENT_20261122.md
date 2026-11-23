# Lead assessment — E08–E13 spatial control, concentration and static calibration

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Selected lead model and effort preserved, actual metadata unavailable. Helpers configured `gpt-6.2-sol` / `ultra`; runtime introspection unavailable. This is direct lead mathematical review of the written derivations, not independent peer review or novelty certification.

## E08: scalar defect maximum, accepted locally

The affine connection baseline contributes (det S/2)q delta_ab to the coordinate Q Hessian. I checked the two trace pairings of H=diag(1,−2,1)−q/2, the covariant commutator's zero diagonal contraction, and the remaining curvature reaction. For Q=diag(1+epsilon,1,1−epsilon), the cubic coefficient L=3 indeed makes the scalar defect Hessian negative definite and its initial flow derivative positive. The fixed rational sample and the symbolic near-perfect interval agree. This defeats a local scalar maximum inference, including at the E05 threshold; the chart need not extend as globally pinched data.

## E09: uniform chiral curvature control, accepted

I independently differentiated SP_X+P_XS=2U_XS, with P=S⁻¹∇A S and U=sym P. The S-derivative terms combine into S[P_X,P_Y] exactly. The two relative inverse Sylvester multipliers are at most one; no quantitative eigenvalue floor is hidden. The conversion ∇Gamma P=∇A P−[ad b,P] supplies the needed connection correction. Combining |P|≤2|T|, |b|≤2sqrt3|T| and the wedge antisymmetrization yields

\[
|\nabla^\Gamma b|\le6|\nabla^A T|+(36+8\sqrt3)|T|^2,
\]
\[
\frac{|F_\Gamma+K\Sigma|}{\sqrt2}
\le K|q|+6|\nabla^A T|+(42+8\sqrt3)|T|^2.
\]

The chiral block square is |W+|²_op+|Ric0|²/4+(s−12K)²/48. I checked the form-to-block factor sqrt2 and the two-form bracket bound. W− is absent from this pointwise identity. Uniformity of the constant says nothing about whether T or ∇T is bounded, or about comparison of the reconstructed metric with a reference metric.

## E10 and E12: actual global spatial concentration, accepted

E10 perturbs the round connection with a fixed small curvature amplitude on a shrinking ball. I checked the support scaling, exact center quotient, smooth compact-tube reconstruction argument, and the Bianchi reduction of speed, including the nonconstant reconstructed metric. It yields P=O(delta² epsilon⁴), squared speed O(delta² epsilon²), and fixed center distortion (1+delta)/(1−delta). Comparing with an exterior round point gives a positive fixed C_T lower bound. E05 remains consistent because its gradient integral scales as epsilon².

E12 replaces the cutoff by eta(log(rho/r)/L), rho=e^(−L), with exact active radii e^(−7L/4) and e^(−5L/4). I checked both radial derivatives, the Hessian term multiplied by the O(r) connection profile, and the four-dimensional radial integral: L⁻⁴ ∫dr/r=1/(2L³). Thus the L⁴ strain norm also tends to zero while distortion and path cost do not. These examples rule out universal static bounds vanishing with the specified scalar integrals and critical spatial norms, even under uniform metric comparison and pinching. They are not solutions or singular trajectories, and do not refute critical spacetime or stronger scale-sensitive estimates.

The E07 and E10 cosmetic corrections were made after their frozen dependent inputs were read. Original hashes are retained in the relevant returns; the corrected current note12 is hashed below.

## E11: smooth scalar principal closure, accepted for the specified class

The invariant Hessian argument gives D²f(I)=a Id on Sym²_0, a>0. The Taylor difference L_Q grad f−4 grad f has leading term 4a(q²)_0, independent of cubic corrections to f. Along q=epsilon diag(1,0,−1), projection perpendicular to grad f leaves a nonzero order-epsilon² term. This avoids any assumption that the proportionality coefficient is differentiable. E08's actual cubic jets then keep a strict scalar maximum and its full scalar two-jet fixed while the flow derivative becomes arbitrarily positive. The accepted failure class is C³ conjugation-invariant functions of Q with nondegenerate minimum at I and a purely scalar principal maximum argument. Nonsmooth, degenerate, derivative-dependent, tensor or nonlocal approaches are outside this result.

## E13: known sphere theorem calibration, accepted conditionally

The lead re-read the primary Chang–Gursky–Yang published PDF, printed p.107, Theorem A, equation (0.3), Remarks 1–2. It requires positive Yamabe constant of the conformal class and four-index Weyl integral below 16pi² chi. The hypothesis R_K≤K gives s≥(12−4sqrt3)K>0. The exact bundle isomorphism E≅Lambda+ and p1(E)[M]=4 give Vol=8pi²/(3K²). The signature identity makes Eminus=Eplus and the four-index integral is 8Eplus≤64pi²/3<32pi². All constants and the K-rescaling agree. The conclusion is diffeomorphism to standard S4, not that this connection or metric is round.

This is a static application of an established classification theorem to supplied coordinate data. It provides no initialization on an unknown homotopy sphere, no persistence of its hypotheses and no convergence theorem. The primary reference is [Chang–Gursky–Yang (2003)](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf#page=3).

## Next analytic dependency

The new positive comparison identifies ∇A T as the relevant next derivative. The negative tests explain why the lower scalar quantities cannot simply replace it. B13/E14 tests whether the time integral of sup(|∇A T|+|T|²) controls metric and relative eigenvalue evolution with no assumed eigenvalue floor. Even success leaves the task of proving that time integral finite and the separate higher-regularity continuation argument.

## Reviewed current versions

- [10_SCALAR_PINCHING_JET_20261122.md](../notes/10_SCALAR_PINCHING_JET_20261122.md) SHA-256 `2689bc30072a5ff95823aba189bc1c1c002074cac90da46dfa2485261f411f06`
- [11_TRANSPORT_CURVATURE_COMPARISON_20261122.md](../notes/11_TRANSPORT_CURVATURE_COMPARISON_20261122.md) SHA-256 `c5e66058a3c73e13d6582a5f84c3e297080c67ae2ee6458c0a8bf5ac30e266ae`
- [12_CONCENTRATED_INITIAL_DATA_20261122.md](../notes/12_CONCENTRATED_INITIAL_DATA_20261122.md) SHA-256 `940d3de5fcc465f039984c34b43acd4211e380fb183b365adfb85b225f38e7ad`
- [13_SMOOTH_SCALAR_BARRIER_TEST_20261122.md](../notes/13_SMOOTH_SCALAR_BARRIER_TEST_20261122.md) SHA-256 `2b06dacb36205c2d4629d7169dc227c8b498d870ca05dba04f35e476aaa1c55a`
- [14_CRITICAL_STRAIN_CONCENTRATION_20261122.md](../notes/14_CRITICAL_STRAIN_CONCENTRATION_20261122.md) SHA-256 `9df659ec21fb1d511ef637dbd8ca6b3109ebad8252426135f46cf0986a9dd7fb`
- [15_STATIC_TRANSPORT_SPHERE_CRITERION_20261122.md](../notes/15_STATIC_TRANSPORT_SPHERE_CRITERION_20261122.md) SHA-256 `b9bd3ea0a716a21e18e7034bf25eea71383d2869d7c267a31d38a9c8ba113304`
