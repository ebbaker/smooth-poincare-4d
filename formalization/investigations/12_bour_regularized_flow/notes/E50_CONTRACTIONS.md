# Moving contractions in the physical Bour variation

26 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. FOT-E50 packet 12b, bounded execution. Actual
serving model and reasoning effort were unavailable. The input was the E49
working tree at checkout `2a132b6d335f695183fecdb4537905cf180b0363`, Lean
`v4.35.0-rc3`, Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e` and
DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`. The working
attainment manuscript retained SHA-256
`719bbea527c6db649eaeee93e58e1f6b50f101772d79b406ee3ec378dca357f1`.
[E50 packet](../../research-progress/handoffs/ED06_E50_PACKETS_20261126.md) ·
[E49 physical adjoints](E49_PHYSICAL_ADJOINT.md) ·
[Working manuscript](../../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/manuscript/fixed_type_attainment.tex)

Let \(g_s\) be a smooth Riemannian metric family on the regular time
set, \(K=\partial_t g_t\), \(Q=\operatorname{Ric}_{g_t}\) and
\(P=\partial_t\operatorname{Ric}_{g_t}\), with both Ricci tensors covariant.
The fiber pairings below use the metric \(g_t\) and the ordinary
two-tensor norm. The local calculation applies in any finite dimension
on a smooth boundaryless Hausdorff manifold. The integrated statement
uses a closed oriented four-manifold and an Euler integral constant
along the regular family. The calculation holds for every real
\(\alpha\), including Bour's regularized range \(0<\alpha<1\).

For any fixed tangent basis,
\[
  \dot g^{ij}=-g^{ia}K_{ab}g^{bj}.
\]
`bourInverseMetric_hasDerivAt` obtains this from the native covariant
speed. `bourMetricRicci_hasDerivAt_apply` transfers the E49 derivative
from a chart basis to the Ricci fiber and then evaluates on arbitrary
fixed vectors. Differentiating the inverse trace of \(Q\) gives
\(\dot R=\operatorname{tr}_g P-\langle K,Q\rangle_g\).
The two inverse factors in \(g^{ia}g^{jb}Q_{ij}Q_{ab}\) each contribute
\(-\langle K,Q\circ Q\rangle_g\), where
\((Q\circ Q)_{ij}=g^{ab}Q_{ia}Q_{bj}\). The equal contributions follow
by Ricci symmetry and renaming the contracted indices in a basis
orthonormal at the time of differentiation. The basis is held fixed
while differentiating. The two variations of \(Q\) contribute
\(2\langle P,Q\rangle_g\).
[Checked contractions](../../../SmoothPoincare/Variational/BourMetricContractions.lean) ·
[Pinned inverse and tensor variation](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Geometry/Metric/TensorInner/FiberMetric/Tensor0SMetricDeriv.lean) ·
[Pinned Ricci square contraction](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Geometry/Flow/RicciFlow/HamiltonHarnack/MIdentities.lean)

Write \(c=(\alpha-4)/12\) and \(B_\alpha=\tfrac12|Q|_g^2+
(\alpha-4)R^2/24\). Its derivative pairs \(P\) with
\(A=Q+cRg\). The remaining derivative of \(B_\alpha\) pairs \(K\)
with \(-Q\circ Q-cRQ\). The moving volume is
\(\partial_t dV_g=\tfrac12\operatorname{tr}_g K\,dV_g\). Thus the
complete derivative before spatial integration by parts is
\[
  \frac{d}{dt}\mathcal F^\alpha(g_t)
  =\int_M\left(\langle A,P\rangle_g+\langle Z,K\rangle_g\right)dV_g,
  \qquad
  Z=-Q\circ Q-cRQ+\tfrac12B_\alpha g.
\]
`bourBulkMetricCorrection` realizes \(Z\) as a smooth section, so its
native pairing is integrable by compactness. The checked theorem
`bourEnergy_hasDerivAt_contractions` uses the literal fiber derivative
in the first term. Its split-integral version
`bourEnergy_hasDerivAt_contractions_of_ricciVelocity` takes a smooth
section identified fiberwise with that derivative. The Euler integral
appears in the energy decomposition with coefficient \(1-\alpha\),
and its time derivative vanishes under the explicit Euler hypothesis.
[Checked energy formula](../../../SmoothPoincare/Variational/BourMetricContractions.lean) ·
[E48 volume variation](../../../SmoothPoincare/Variational/BourSlabVariation.lean) ·
[Bour v1, §3, four-dimensional Gauss–Bonnet relation](https://arxiv.org/html/1012.0342v1#S3.SS0.SSS2)

For the comparison with the original equation, substitute the covariant
Palatini variation and take the \(L^2_g\) adjoint on the closed slice.
With \(C^k{}_{ij}\) the raised Koszul speed,
\(P_{ij}=\nabla_k C^k{}_{ij}-\nabla_i C^k{}_{kj}\) and
\(C^k{}_{kj}=\tfrac12\nabla_j\operatorname{tr}_g K\).
The derivative term pairs \(K\) with the symmetric tensor whose
raised components are
\[
  \operatorname{Sym}_{a b}(\nabla_i\nabla^a A^{ib})
  -\tfrac12\nabla^j\nabla_j A^{ab}
  -\tfrac12(\nabla_j\nabla_i A^{ij})g^{ab}.
\]
The two derivatives in the first term retain their adjoint order.
Adding \(Z\) gives the physical \(L^2_g\) gradient \(G\). Bour defines
the gradient by this pairing in §3 and uses \(K=-2G\) in §1.2 for
\(\mathcal F^\alpha\). At that velocity the pairing is
\(-2\int_M |G|_g^2dV_g\), giving half the energy drop for the integral
in time of the squared gradient. The contraction module supplies \(Z\),
the native smooth speed and its symmetry, and the full pre-adjoint
pairing. The covariant Ricci identity and the two derivative transfers
enter the integrated gradient through their own proofs.
[E49 transfers](E49_PHYSICAL_ADJOINT.md) ·
[E50 Palatini](../../../SmoothPoincare/Variational/BourPalatiniVariation.lean) ·
[Integrated gradient](../../../SmoothPoincare/Variational/BourOriginalGradient.lean) ·
[Bour v1, §§1.2 and 3](https://arxiv.org/html/1012.0342v1)

The targeted Lake build completed 10,318 jobs without diagnostics.
The two energy derivative signatures replayed from the imported module.
Axiom queries on nine declarations, including both energy derivatives
and the smooth metric correction, returned only `propext`,
`Classical.choice` and `Quot.sound`.

## Contracted Bianchi in the computed gradient

For the same physical weight \(A=Q+(\alpha-4)Rg/12\), contracted Bianchi
gives \(\operatorname{div}_g Q=\tfrac12\,dR\). The covariant derivative
of \(fg\) is \(df\otimes g\) by metric compatibility, so its first
divergence is \(df\). The first and second divergences of \(A\) are
therefore
\[
  \operatorname{div}_g A = \frac{\alpha+2}{12}\,dR,
  \qquad
  \operatorname{div}_g\operatorname{div}_g A
    = \frac{\alpha+2}{12}\,\Delta_g R .
\]
Here \(\Delta_g=\operatorname{tr}_g\nabla^2\), the opposite sign to
Bour's nonnegative scalar Laplacian. These identities apply to
arbitrary smooth Riemannian slices in finite dimension, with a
boundaryless model for the stated scalar Laplacian. No compactness
or stationarity hypothesis is needed. For the trace part of the
gradient this gives the term \(-(\alpha+2)\Delta_g R\,g/24\).
[Checked divergences](../../../SmoothPoincare/Variational/BourGradientBianchi.lean) ·
[Pinned contracted Bianchi](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Geometry/Curvature/CurvatureOperator/Identities/ContractedBianchi.lean#L1003) ·
[Pinned Laplacian trace](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Geometry/Operator/Hessian/Trace/Realization.lean#L884)

For the remaining crossed contractions, the pinned
`levi_civita_nabla_contracted_bianchi` computes the Ricci Hessian
trace with the outer derivative left in place.
`tensor0S_ricciIdentity_of_leviCivita` interchanges the covariant
derivative slots, and `contracted_curvatureAction0SAt_vec2_eq`
identifies the resulting contracted curvature action as the sum of
the pinned signed Riemann–Ricci contraction and covariant Ricci
square. These pointwise identities are available on a general slice.
The pinned consolidated Ricci-flow commutator uses a different
carrier, `SolutionOn`, and the comparison below works directly on a single smooth metric slice.
[Pinned differentiated Bianchi](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Geometry/Connection/LeviCivita/Curvature/DifferentiatedContractedBianchi.lean#L93) ·
[Pinned Ricci identity](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Geometry/Connection/LeviCivita/Curvature/Identities.lean#L1638) ·
[Pinned curvature contraction](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Geometry/Curvature/Riemann/Contractions.lean#L640)

The targeted Bianchi build completed 10,312 jobs without diagnostics.
Both divergence signatures replayed, and all three public declaration
axiom checks returned only `propext`, `Classical.choice` and `Quot.sound`.

## Curvature-commuted gradient on the original metric

With \(S=\nabla^2 A\) and \(b_i\) an orthonormal basis at the point, the
two crossed terms of the actual Koszul adjoint evaluated on \((u,v)\)
are \(\sum_i S(b_i,v,b_i,u)\) and \(\sum_i S(b_i,v,u,b_i)\).
The uncommuted term is
\(\sum_i S(v,b_i,b_i,u)=(\nabla\operatorname{div}_g A)(v,u)\).
The two crossed terms agree by symmetry in the final two slots.
For the Ricci summand, commuting the first two derivatives adds the
covariant Ricci square and subtracts the Riemann–Ricci action
\(\mathscr R_g(Q)=\operatorname{hamiltonCurvatureRicciAt}(g)\).
The scalar summand has second covariant derivative
\(\nabla^2(Rg)=\nabla^2R\otimes g\), as checked using the tensor product
rule and \(\nabla g=0\). Its crossed trace is the scalar Hessian and
its rough trace is \((\Delta_g R)g\).
[Crossed commutator](../../../SmoothPoincare/Variational/BourCrossedRicci.lean) ·
[Slot and scalar-product identities](../../../SmoothPoincare/Variational/BourGradientComparison.lean)

The Ricci square from the commutator cancels the moving inverse-metric
term in \(Z\). Combining the remaining pieces gives the original
covariant gradient at any smooth slice,
\[
G_\alpha
=-\tfrac12\Delta_g Q+\tfrac{\alpha+2}{12}\nabla^2R
-\mathscr R_g(Q)-\tfrac{\alpha-4}{12}RQ
-\tfrac{\alpha-1}{12}(\Delta_g R)g+\tfrac12 B_\alpha g .
\]
Here \(\Delta_g\) on covariant tensors is the trace of the ordered
second derivative and on functions is the traced Hessian. The
curvature action uses the pinned convention
\[
\mathscr R_g(Q)(u,v)=\sum_{i,j}Q(b_i,b_j)\,
g\!\left(\operatorname{Rm}(b_i,u)v,b_j\right),
\]
where \(\operatorname{Rm}(X,Y)Z\) is the curvature operator of the
Levi–Civita connection. Constant scalar curvature removes the Hessian
and scalar Laplacian. In four dimensions, set \(E=Q-(R/4)g\) on a
constant-scalar slice. Using \(\mathscr R_g(g)=Q\) and the Weyl
decomposition in Bour's conventions gives the coefficient
\((2-\alpha)R/12\) on \(E\) in Bour's Proposition 4.4, as well as
\(\tfrac14|E|_g^2g\). The kernel comparison is stated in the
ordinary Ricci and full curvature contractions above.
[Checked arbitrary-scalar and constant-scalar formulas](../../../SmoothPoincare/Variational/BourGradientComparison.lean) ·
[Bour v1, §3 and Proposition 4.4](https://arxiv.org/html/1012.0342v1)

The tensor equivalence
`bourOriginalVelocity_eq_negTwoGradient_iff_components` identifies the
negative twice-gradient condition with the geometric component equation
on all tangent pairs. For the actual velocity of a regular path,
this supplies the pointwise equation in the original slab theorem.
[Checked component equivalence](../../../SmoothPoincare/Variational/BourGradientComparison.lean) ·
[Original regular slab](../../../SmoothPoincare/Variational/BourOriginalGradient.lean) ·
[Bour v1, §1.2](https://arxiv.org/html/1012.0342v1#S1.SS2)

Bour's \(\Delta_B=-\Delta_g\) puts the differentiated curvature term
\(\delta\tilde\delta\operatorname{Rm}=-\delta DQ\) in the order
\(\Delta_gQ-\tfrac12\nabla^2R\) up to algebraic curvature terms.
His additional differential term in dimension four contributes
\((1-\alpha)(-\Delta_gR\,g+\nabla^2R)/6\). Together these match
the checked coefficients of the rough Ricci Laplacian, the
scalar Hessian and the scalar Laplacian in the component velocity.
[Bour v1, §§3 and 9.2, Propositions 9.2–9.3](https://arxiv.org/html/1012.0342v1)

The final comparison build completed 10,455 jobs without diagnostics.
The arbitrary-scalar formula, constant-scalar formula, and component
velocity equivalence replayed. Seven public axiom checks returned only
`propext`, `Classical.choice` and `Quot.sound`.
