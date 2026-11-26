# DESC-E07e · Curvature variation in the moving metric bundle

26 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded Edition 03 execution. Actual serving model and reasoning effort were unavailable. Source intake `a7bb158d6af806d2573a7702386622ed4c0bb1f1`. [Lean proof](../../../../SmoothPoincare/Variational/SpatialEulerVariation.lean) · [Spatial flux](ED03_SPATIAL_EULER_FLUX.md) · [Companion proof](../../../../../papers/master/01_fixed_type_variational_descent/manuscript/modified_ball_charge.tex#L188)

Fix an actual `SolutionOn` of unnormalized Ricci flow, a regular time $t$ and a point $x$ of a smooth Riemannian source. Let $Q=\operatorname{Ric}_{g(t)}^\sharp$. The base arguments $X,Y$ of the curvature 2-form are fixed vectors of $T_xM$. In the two bundle slots, take paths $V(s),W(s)$ with derivatives $QV(t),QW(t)$ at $t$. The manuscript orthonormal bundle identifications have this velocity. The result only needs the specified first jets of these paths. To speak of the oriented Euler form, use an oriented orthonormal four-frame at the tested time.

## From the raw Ricci-flow tensor to the curvature 2-form

Write $R_s(X,Y,v,w)=g(s)(R_{g(s)}(X,Y)v,w)$ and let $H(A,B,C,D)=(\nabla_A\nabla_B\operatorname{Ric})(C,D)$ denote the covariant Hessian with both derivative slots interpreted tensorially. The pinned coordinate variation states that for fixed $X,Y,v,w$ the raw derivative is

$$
\begin{aligned}
\dot R(X,Y,v,w)={}&-H(X,Y,v,w)-H(X,v,Y,w)+H(X,w,Y,v)\\
 &+H(Y,X,v,w)+H(Y,v,X,w)-H(Y,w,X,v)\\
 &-2R_t(X,Y,v,Qw).
\end{aligned}
$$

`rawCurvatureVariationOnRegular` supplies the pinned variation hypotheses by restricting to the open regular time carrier. `lowerCurvatureVariation_coord` contracts the raised connection speed against the actual slice metric and evaluates the lowering term using $Q$. `rawCurvatureTensor_hasDerivAt` transfers the formula from a coordinate basis to the actual four-linear tensor. The pinned inputs are `riemann_covariant_variation_of_solution` for the covariant coordinate variation and `coordNab2Ric_eq_nabla2RicField` for the coordinate Ricci Hessian. [Pinned differential-geometry library](https://github.com/qinz1yang/differential-geometry/tree/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Geometry/Flow/RicciFlow/Evolution)

`eulerCurvatureCoefficient_hasDerivAt` applies the multilinear product rule with zero velocities in the two base arguments. The two moving bundle arguments add $R_t(X,Y,Qv,w)+R_t(X,Y,v,Qw)$. The actual curvature is skew in $v,w$ for all nearby regular times, so the raw time derivative is also skew in $v,w$. The two Hessian terms $-H(X,Y,v,w)+H(Y,X,v,w)$ are symmetric in $v,w$. Skewing the raw formula in $v,w$ removes these two terms and changes the final term to $-R_t(X,Y,v,Qw)-R_t(X,Y,Qv,w)$. The latter terms cancel precisely with the moving bundle velocities. This uses `rm04OutputSkew_regular` and `metricNabla2Ric_last_two_symm`.

The resulting `eulerCurvatureCoefficient_hasDerivAt_skewJet` conclusion for the actual supplied flow is

$$
\left.\frac d{ds}\right|_{s=t} R_s(X,Y,V(s),W(s))
=H(X,w,Y,v)-H(X,v,Y,w)-H(Y,w,X,v)+H(Y,v,X,w),
$$

where $v=V(t)$ and $w=W(t)$. The two Hessian differences are `ricciFlowEulerCovariantJet`. This is the component of $d_\omega\alpha$ for the corrected Ricci-gauge connection velocity of the previous result. No curvature-time jet identity is a hypothesis of this declaration.

## Normalized local Pfaffian and the remaining global step

`ricciFlowEulerPfaffian_fixedBase_hasDerivAt` uses the actual curvature-time formula in the differentiated polynomial $2\operatorname{Pf}(F)$, with the cyclic sums from `metricFrameEulerCovariantDerivative_bianchi`. The fixed base slots use the original slice frame. The frame paths in the two bundle slots have the specified value and Ricci-gauge time derivative. The derivative is the normalized signed sum of the spatial exterior-product jet coefficients. This is the finite frame form of the Chern–Weil differentiation in Chern–Simons §3, formula (3.4). [Chern–Simons](https://doi.org/10.2307/1971013)

The Lean proof supplies a local coefficient identity. Construction of a globally smooth slice current from the invariant 3-form, proof that its actual divergence is the spatial coefficient above, and differentiation of the tested integral with moving volume remain separate steps. The preceding integration-by-parts theorem takes the smooth current and the signed instantaneous integral derivative as inputs. This packet supplies neither a Lipschitz cutoff extension nor a Ricci-flow existence, physical gauge transfer, or positive-time compactness theorem.

## Verification

Lean `4.35.0-rc3`, Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e`, DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`. The companion source SHA-256 prefix was `8f58cd62654a`. The preceding checked spatial flux source SHA-256 prefix was `fbc6342cb7b2` at intake to this packet.

`lake build +SmoothPoincare.Variational.SpatialEulerVariation` succeeded in 9,906 jobs without diagnostics. The checked source SHA-256 is `9cc7bd6b8a43d7d52c97a76835c7baeb9ecf656b58c9afdce19cbe61d3613ad6`. Fresh direct-import type and axiom checks covered the two definitions `eulerCurvatureCoefficient` and `ricciFlowEulerCovariantJet`, the two coefficient derivative results, the `eulerCurvatureCoefficient_eq_metricFrame` normalization through pair exchange, and `ricciFlowEulerPfaffian_fixedBase_hasDerivAt`. The only axioms were `propext`, `Classical.choice` and `Quot.sound`.
