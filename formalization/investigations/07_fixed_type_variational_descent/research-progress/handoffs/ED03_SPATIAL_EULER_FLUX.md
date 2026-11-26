# E41 · Spatial Euler flux on the modified Ricci flow

26 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded Edition 03 execution. Actual serving model and reasoning effort were unavailable. Intake `a7bb158d6af806d2573a7702386622ed4c0bb1f1`. [Lean module](../../../../SmoothPoincare/Variational/SpatialEulerFlux.lean) · [Owning register](../REGISTER.md) · [Previous assessment](../../../reviews/NATIVE_FEET_AND_PHYSICAL_JETS_20261125.md)

The source is the proof of `thm:charged-modified-flow` in the fixed-type companion, as summarized by the master statement. Fix a smooth closed oriented Riemannian four-manifold and an ordinary unnormalized Ricci flow supplied on that source from its smooth rescaled modified metric. All ordered norms and Riemannian volumes below use the evolving slice. The cutoff is smooth and fixed as a function on the source. The previous formalization verifies the downstream terminal trace-free Ricci lower bound from a finite Euler transport estimate. [Companion](../../../../../papers/master/01_fixed_type_variational_descent/manuscript/modified_ball_charge.tex#L188) · [Master](../../../../../papers/master/manuscript/recognition_gap.tex#L139) · [Previous bound](../../../../SmoothPoincare/Variational/ModifiedEulerCharge.lean)

## Local identity

Write the connection matrix in a positively oriented orthonormal bundle with curvature matrix of 2-forms $F_{ab}$. The matrix slots are $F_{ab}(v,w)=\langle R(v,w)e_b,e_a\rangle$. The Euler form in the manuscript is $2\operatorname{Pf}(F)$, since the ordinary Pfaffian is $F_{01}\wedge F_{23}-F_{02}\wedge F_{13}+F_{03}\wedge F_{12}$. Its normalized coefficient on the round unit sphere is $6$. The finite identity in `frameEulerPfaffian_eq_quadratic` proves that the doubled coefficient is $|\mathrm{Rm}|^2/4-|\operatorname{Ric}|^2+R^2/4$. `metricFrameEulerPfaffian_eq_chargeDensity` identifies this with $|W^+|_{\rm HS}^2+|W^-|_{\rm HS}^2+R^2/24-|Z|^2/2$ for the actual Levi–Civita curvature in the manuscript's frame.

For local oriented orthonormal identifications chosen by $\dot u=\operatorname{Ric}^\sharp u$ and fixed spatial vectors $v$, differentiation of the pulled connection adds $\nabla_v\operatorname{Ric}^\sharp$ to the fixed-bundle Levi–Civita speed. The differentiated Koszul formula then gives

$$
\alpha_{ab}(v)=(\nabla_{e_a}\operatorname{Ric})(v,e_b)-(\nabla_{e_b}\operatorname{Ric})(v,e_a).
$$

Lean checks the corrected speed on an actual `SolutionOn` in `ricciFlow_orthogonalConnectionVariation`, using the pinned upstream differentiated Koszul theorem. The matrix-valued curvature differentiation is $\dot F=d_\omega\alpha$ with the base vectors held fixed. At the point under test a normal frame sets the connection 1-form to zero. In this frame the coefficients reduce to $\partial_i\alpha_{ab,j}-\partial_j\alpha_{ab,i}$. The `frameEulerPfaffian_hasDerivAt_of_bianchi` proof uses that coefficient equation and the cyclic Bianchi sums to differentiate the polynomial. The Bianchi sums are themselves verified for actual Levi–Civita curvature in `metricFrameEulerCovariantDerivative_bianchi`. The classical invariant-polynomial calculation is the degree-two case of the differentiation and Leibniz step in Chern–Simons §3, formula (3.4). [Chern–Simons](https://doi.org/10.2307/1971013)

The normalized primitive is

$$
T=2\bigl(\alpha_{01}\wedge F_{23}+\alpha_{23}\wedge F_{01}
-\alpha_{02}\wedge F_{13}-\alpha_{13}\wedge F_{02}
+\alpha_{03}\wedge F_{12}+\alpha_{12}\wedge F_{03}\bigr).
$$

`frameEulerTransgression` represents its value on any spatial triple. Each curvature component has magnitude at most $U=|\mathrm{Rm}|$, each $\alpha$ component has magnitude at most $2N$ for $N=|\nabla\operatorname{Ric}|$, and each wedge component is a signed sum of three products. The six wedges and the prefactor $2$ give $72UN$ on one triple. The norm uses the four increasing triples and is bounded by $144UN$. `frameEulerTransgression_norm_of_ricciDerivative` proves this finite estimate and `ricciFlow_frameEulerTransgression_norm` instantiates the coefficient with the corrected variation on an actual solution. For comparison with the manuscript's global derivative budget, the Ricci derivative is the dimension-four trace of the curvature derivative, so Cauchy–Schwarz gives $N^2\le4|\nabla\mathrm{Rm}|^2$ in ordered norms.

## Slice integration and time transport

When $T=\iota_XdV$ for a smooth slice current $X$, $dT=(\operatorname{div}X)dV$. With the convention $d\chi\wedge\iota_XdV=d\chi(X)dV$, the closed-manifold integration by parts proved in `eulerSpatialFlux_integral_bound` gives

$$
\left|\int\chi\operatorname{div}X\,dV\right|
=\left|\int d\chi(X)\,dV\right|
\le c\|d\chi\|_\infty\|U\|_2\|N\|_2
$$

when $|X|\le cUN$. The Lean proof uses the actual Riemannian divergence theorem, metric Cauchy–Schwarz and spatial Hölder. With $c=144$, a fixed cutoff obeying $|d\chi|_s\le\delta(\tau/s)^b$, a uniform $\|U\|_{2,s}\le A$, and $\int_0^\tau\|N\|_{2,s}^2ds\le L^2$, `modifiedEuler_transport_of_spatialFlux` proves

$$
|m(\tau)-m(0)|\le 144\,\delta A L\sqrt{\frac{\tau}{1-2b}}\qquad(\tau>0,\ b<1/2).
$$

Its exact input is the signed instantaneous derivative $m'(s)=\int\chi\operatorname{div}_{g(s)}X_s\,dV_s$ for $0<s<\tau$, endpoints continuous, and an almost everywhere strongly measurable flux. The proof derives time-integrability of the flux. For the manuscript's cutoff take $\delta=2$, and pass the resulting coefficient to `modifiedTerminalRicci_lower_of_eulerTransport_of_measurableCharges` after rewriting `modifiedEuler_timeWeight`. The source and evolved endpoint moments and measures belong to the modified gauge.

The coefficient proof and global integration are joined classically by the Cartan curvature-variation identity, its smooth frame-invariant current, and differentiating the tested form integral. The current Lean interface supplies the curvature-time coefficient equation to the local polynomial proof and the actual smooth current and instantaneous derivative to the Stokes theorem. It does not construct those global objects from a `SolutionOn`; it does not cover Lipschitz cutoffs, produce flow existence or convergence, or transfer positive-time charge back to the original physical minimizing sequence.

## Verification

Lean `4.35.0-rc3`, Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e`, DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`. The companion and master source SHA-256 prefixes were `8f58cd62654a` and `f4c5ce2687a2`. The Lake manifest SHA-256 is `839111aae86b693524cd57db5ce7f2e8edc972dad49296468eb18d6735e52239`.

`lake build +SmoothPoincare.Variational.SpatialEulerFlux` succeeded in 9,807 jobs. A fresh direct import checked the types and axioms of ten theorems named above, including the local product-rule lemma `exteriorWedge12Volume_of_bianchi`. Their axiom reports contain only `propext`, `Classical.choice` and `Quot.sound`. The checked source SHA-256 is `fbc6342cb7b2b71bce92918d7af232ec5ce585fbd9de78db8a8dba67a7760ff9`.
