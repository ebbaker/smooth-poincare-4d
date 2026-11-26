# DESC-E08b · The global Euler current on the modified slice

26 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded Edition 03 execution. Actual serving model and reasoning effort were unavailable. Intake `95a4f50eb9ec6e0e98454170279f45a66b000211`. [Lean proof](../../../../SmoothPoincare/Variational/GlobalEulerCurrent.lean) · [Local variation](ED03_SPATIAL_EULER_VARIATION.md) · [Spatial estimate](ED03_SPATIAL_EULER_FLUX.md) · [Companion proof](../../../../../papers/master/01_fixed_type_variational_descent/manuscript/modified_ball_charge.tex#L188)

Fix a smooth Riemannian slice with its Levi–Civita connection. In a positive orthonormal four-frame use the curvature array $R_{ijab}=g(R(e_i,e_j)e_b,e_a)$, and write $D_{ajb}=(\nabla_{e_a}\operatorname{Ric})(e_j,e_b)$. The normalized Euler form is twice the ordinary Pfaffian. The current uses the intrinsic double dual $P=\mathrm{Rm}-g\owedge\operatorname{Ric}+(S/4)g\owedge g$, with $S$ the scalar curvature and $g\owedge g$ having ordered coefficient $2(\delta_{ia}\delta_{jb}-\delta_{ib}\delta_{ja})$.

Define the covector by taking three metric traces of $2P\otimes\nabla\operatorname{Ric}$ with its free slot first, then raise it using the actual slice metric. The result is a smooth section of the actual tangent bundle. This prescription uses no choice of local frames or cutoffs. On a supplied Ricci-flow solution use the same section on each slice. The normalized insertion coefficients are

$$
 g(X,e_i)=2\sum_{j,a,b} P_{ijab}D_{ajb},\qquad
 (g(X,e_0),g(X,e_1),g(X,e_2),g(X,e_3))=(T_{123},-T_{023},T_{013},-T_{012}).
$$

Here $T$ is the six-term spatial primitive in the previous proof. If $F_{ab}$ denotes the curvature 2-form and $\alpha_{ab}$ the corrected connection velocity, then $T=\tfrac12\epsilon_{abcd}\alpha_{ab}\wedge F_{cd}$. Inverting insertion gives $X_i=\tfrac16\epsilon_{ijkl}T_{jkl}$. The three cyclic product terms coincide after summation and leave $X_i=\tfrac14\epsilon_{ijkl}\epsilon_{abcd}\alpha_{ab,j}R_{cdkl}$. The first two skews and pair exchange then give the displayed contraction. The finite Lean check uses these symmetries and no algebraic Bianchi assumption. The independent physical reader checked the orientation and factor and supplied the finite coefficient proof. [Chern–Simons, §3](https://doi.org/10.2307/1971013)

The ordered norms yield $|X|\le144|\mathrm{Rm}|\,|\nabla\operatorname{Ric}|$ by the preceding four-triple estimate. Consequently the smooth current and its norm input for the spatial cutoff estimate come from the supplying metric itself.

## The divergence coefficient

The covariant derivative commutes with all three metric traces. Its product rule gives the sum of the current contractions with $P$ differentiated and with $D$ differentiated. The differentiated double dual uses the same linear polynomial on $\nabla R$. This uses $\nabla g=0$ and the Levi–Civita Ricci trace identity for $\nabla R$. Pair exchange and both skews hold for the spatial covariant curvature derivative as well. Hence the finite insertion identity can be applied to each product-rule term separately.

The divergence is the metric trace of the covariant derivative of the constructed covector. The trace of the signed complement components is the oriented volume coefficient of $dT$, computed by the alternating sum of the four spatial product-rule jets. In this trace the Ricci derivative jet is $dD_{rajb}=(\nabla^2\operatorname{Ric})_{rajb}$, and the curvature derivative entering the primitive is $dF_{ab,ijk}=dR_{iabjk}$ by pair exchange. This is the same local coefficient supplied by the previous fixed-base Pfaffian derivative.

`ricciFlowEulerPfaffian_fixedBase_hasDerivAt_divergence` states the derivative on an actual supplied smooth solution as `divergenceG` of `ricciFlowEulerCurrent`. Its first-jet frame inputs fix the tangent basis at the tested time and give Ricci-gauge velocities in the two bundle slots. The two base arguments are fixed in the component curvature form. Identifying the derivative of the tested scalar density relative to any fixed background volume and moving that time derivative through the integral are separate steps. The spatial theorem applies at a supplied regular time and makes no claim about flow existence or positive-time compactness.

## Verification

Lean `4.35.0-rc3`, Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e`, DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`. The E41 inputs `SpatialEulerFlux.lean` and `SpatialEulerVariation.lean` have SHA-256 prefixes `fbc6342cb7b2` and `9cc7bd6b8a43`. `lake build +SmoothPoincare.Variational.GlobalEulerCurrent` succeeded in 9,907 jobs. A fresh direct import checked all 16 public definitions and theorems. Their axiom reports contain only `propext`, `Classical.choice` and `Quot.sound`. The checked source SHA-256 is `b4aaa0c6834cd7e56b5e0534e89a40462be66b82ff562b4f9315373cde8b69fd`. Lake and the independent direct probes produced no diagnostics.
