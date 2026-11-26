# E42 · Lipschitz spatial tests for the Euler current

26 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded Edition 03 execution. Actual serving model and reasoning effort were unavailable. Intake `95a4f50eb9ec6e0e98454170279f45a66b000211`. [Lean proof](../../../../SmoothPoincare/Variational/LipschitzEulerFlux.lean) · [Global current](ED03_GLOBAL_EULER_CURRENT.md) · [Terminal cutoff in the companion](../../../../../papers/master/01_fixed_type_variational_descent/manuscript/modified_ball_charge.tex#L183)

Let $g$ be a smooth Riemannian metric on a compact boundaryless manifold and $X$ a smooth tangent section. Use that slice's metric distance and Riemannian volume. The cutoff $\chi$ may be any real function with global Lipschitz constant $L$ for that distance. `lipschitzEulerSpatialFlux_integral_bound` proves

$$
\left|\int_M \chi\operatorname{div}_g X\,dV_g\right|\le L\int_M |X|_g\,dV_g .
$$

For each $\varepsilon>0$ the pinned `exists_contMDiff_approximation_of_lipschitz_hasCompactSupport` supplies a smooth $f$ with $\|f-\chi\|_\infty<\varepsilon$ and $|df(v)|\le(L+\varepsilon)|v|_g$. Compactness supplies its support hypothesis. The same approximation gives continuity of $\chi$. Smooth integration by parts bounds the tested divergence of $f$ by $(L+\varepsilon)\int|X|_g$. The approximation error in the original tested divergence is at most $\varepsilon\int|\operatorname{div}_gX|$. Both integrals are finite by smoothness and compactness. For a given final tolerance $\eta>0$, the proof takes $\varepsilon=\eta/(1+\int|X|_g+\int|\operatorname{div}_gX|)$ and then removes $\eta$. This obtains the coefficient $L$ exactly, including $L=0$. [Pinned approximation theorem](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Analysis/Calculus/Manifold/LipschitzApproximation.lean#L273)

`lipschitzEulerSpatialFlux_integral_bound_of_pointwise` applies the same theorem and spatial Hölder when $U,N$ are nonnegative $L^2(dV_g)$ functions and $|X|_g\le cUN$. The resulting bound is $cL\|U\|_2\|N\|_2$. On the supplied modified slice take the global Euler current and use $c=144$, $U=|\mathrm{Rm}|$ and $N=|\nabla\operatorname{Ric}|$. A common terminal function may have a different Lipschitz constant for each earlier slice. To use that test in the finite time-transport theorem, supply its distortion estimate and the signed time derivative of its tested integral. The proof in this packet is on each compact slice with the actual volume and divergence.

## Verification

Lean `4.35.0-rc3`, Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e`, DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`. `lake build +SmoothPoincare.Variational.LipschitzEulerFlux` succeeded in 9,814 jobs without diagnostics. A fresh direct import checked both estimates and `metricLipschitzCutoff_continuous`. The only axioms were `propext`, `Classical.choice` and `Quot.sound`. The checked source SHA-256 is `2576666cb6be19142a4697fa1523f1ceedaea7d53de8d12f56248e04b35c49f9`.
