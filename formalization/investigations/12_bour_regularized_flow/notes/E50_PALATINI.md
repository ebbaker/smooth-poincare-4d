# Palatini variation on the original Bour metric family

26 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. E50 packet 12a executes the fixed-chart
calculation on the E49 modules available at dispatch over
`2a132b6d335f695183fecdb4537905cf180b0363`. Actual serving model and
reasoning effort were unavailable. The pins are Lean `v4.35.0-rc3`,
Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e` and
DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`.
The fixed-type attainment manuscript inspected at execution had SHA-256
`719bbea527c6db649eaeee93e58e1f6b50f101772d79b406ee3ec378dca357f1`.
[Packet](../../research-progress/handoffs/ED06_E50_PACKETS_20261126.md) ·
[E49 calculation](E49_PHYSICAL_ADJOINT.md) ·
[Bour v1, §3](https://arxiv.org/html/1012.0342v1#S3) ·
[Working manuscript](../../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/manuscript/fixed_type_attainment.tex)

Let (g_s) be a smooth real Riemannian family on a smooth
boundaryless manifold. Fix a regular time (t) and write (g=g_t) and
(K=partial_t g_t). The construction applies in any positive finite
dimension and needs neither orientation nor compactness. Choose one
extended chart and its fixed basis fields (b_i). Throughout the chart
source put (C^j{}_{ik}=partial_tGamma^j{}_{ik}). The native lowered
Koszul flux (L=	exttt{bourKoszulFlux},g,K) satisfies
[
L_{aik}
 = sum_j g_{ja}C^j{}_{ik}
 = 	frac12(
abla_i K_{ka}+
abla_k K_{ia}-
abla_a K_{ik}).
]
The first equality is a fixed-chart equality at every point in the
source. Its proof takes the time derivative of the Levi–Civita
difference on the fixed basis fields. The output expansion of that
difference differentiates a finite sum with fixed tangent vectors.
The second equality is the E49 variation of Levi–Civita applied to the
native speed. [Lean statements](../../../SmoothPoincare/Variational/BourPalatiniVariation.lean) ·
[Pinned Levi–Civita variation](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Geometry/Connection/LeviCivita/Variation/MetricDerivative.lean)

The mixed time-space derivatives are those of the same chart and
original path. In the notation of this formalization, the component
(operatorname{Ric}(b_i,b_k)) differentiates to
[
sum_j(
abla_j C)^j{}_{ik}
-
sum_j(
abla_k C)^j{}_{ij},qquad
(
abla_d C)^j{}_{ik}
=partial_d C^j{}_{ik}
+sum_migl(Gamma^j{}_{dm}C^m{}_{ik}
-Gamma^m{}_{di}C^j{}_{mk}
-Gamma^m{}_{dk}C^j{}_{im}igr).
]
The two lower-slot symmetries of (Gamma) and (C) cancel the
extra terms with (Gamma^m{}_{jk}C^j{}_{im}) and match the four
differentiated Christoffel products summand by summand. This gives
`bourMetricRicciAt_chartPalatini_hasDerivAt`.

The spatial product rule applies to the germ of the lowering identity.
Metric compatibility gives
(partial_d g_{ja}=Gamma^m{}_{dj}g_{ma}+Gamma^m{}_{da}g_{jm}).
The second metric term cancels the connection correction in the
lowered output slot. The first becomes the upper-index correction
after interchanging the finite sums. Thus
[
(
abla_d L)_{aik}
=sum_j g_{ja}(
abla_d C)^j{}_{ik}.
]
`bourNablaKoszulFlux_chart_eq_gram_mul` proves this equality. Contract the
first two slots with the inverse Gram matrix to get the first term in
the Ricci derivative. For the second term, use the covariant derivative
of the one-form (	au_i=sum_{a,j}g^{aj}L_{aij}), written
`bourKoszulTraceForm g K`. Metric compatibility commutes the trace
past the derivative, so the same inverse Gram contraction gives
(sum_j(
abla_k C)^j{}_{ij}).
[Chart tensor derivative](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Geometry/Connection/ChartBridge/TensorDerivative.lean) ·
[Metric trace derivative](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Geometry/Connection/MetricTrace/CovariantDerivative.lean)

`bourMetricRicciAt_chartKoszul_hasDerivAt` therefore identifies the
physical derivative with (operatorname{div}_g L-(
abla	au)^	op) in
every fixed chart containing the evaluation point. The transpose
evaluates (
abla	au) in slots ((k,i)), where slot (k) is the
derivative. `bourMetricRicciAt_hasDerivAt` passes through the finite
dimensional coordinate equivalence to prove the tensor-valued derivative
with value `bourRicciVelocity g K`. The trace theorem established in the
same edition gives (	au=	frac12 doperatorname{tr}_gK), so the
subtracted term is half the scalar Hessian. The result supplies the
Ricci derivative to the quadratic density calculation on the same
regular family. [Trace theorem](../../../SmoothPoincare/Variational/BourKoszulTrace.lean)

## Comparison with Bour's expanded gradient

For the dimension-four stationary equation use Bour's
\(\Delta_B=-\operatorname{tr}_g\nabla^2\) on both scalars and tensors.
Put \(c=(\alpha-4)/12\) and \(A=\operatorname{Ric}+cRg\).
The two crossed adjoints give
\(\operatorname{Sym}_{ij}\nabla^p\nabla_i A_{pj}\).
The remaining adjoints contribute
\(-\tfrac12\nabla^p\nabla_p A-\tfrac12g\nabla^i\nabla^j A_{ij}\).
Write \(Rm^\circ(\operatorname{Ric})_{ij}
=Rm_{p i q j}\operatorname{Ric}^{pq}\), using the four-index curvature
convention of Bour §3. Contracted Bianchi and the commutator on the two
covariant Ricci slots give
\[
\begin{aligned}
\nabla^p\nabla_i A_{pj}
 &= (\tfrac12+c)\nabla_i\nabla_jR
     +(\operatorname{Ric}\circ\operatorname{Ric})_{ij}
     -Rm^\circ(\operatorname{Ric})_{ij},\\
\nabla^i\nabla^j A_{ij} &=-(\tfrac12+c)\Delta_B R.
\end{aligned}
\]
The slot carrying the contraction in the commutator contributes
\(+\operatorname{Ric}\circ\operatorname{Ric}\). The other slot
contributes \(-Rm^\circ(\operatorname{Ric})\). The commutator on \(Rg\)
vanishes by metric compatibility and the scalar Hessian symmetry.
These contractions are the ones used in Bour's Propositions 9.2 and 9.3.
[Bour v1, §9.1](https://arxiv.org/html/1012.0342v1#S9.SS1)

The inverse metric correction cancels the squared Ricci endomorphism and
contributes \(-cR\operatorname{Ric}\). The volume variation contributes
\((\tfrac14|\operatorname{Ric}|^2+\tfrac{c}{4}R^2)g\). The resulting
dimension-four gradient is
\[
G_\alpha
 = \tfrac12\Delta_B \operatorname{Ric}
   +(\tfrac12+c)\nabla^2R+(\tfrac14+c)(\Delta_B R)g
   -Rm^\circ(\operatorname{Ric})-cR\operatorname{Ric}
   +(\tfrac14|\operatorname{Ric}|^2+\tfrac c4 R^2)g .
\]
For comparison, the bulk functional is
\(\frac12(\mathcal F_{\operatorname{Ric}}-\frac14\mathcal F_R)
+\frac{\alpha-1}{24}\mathcal F_R\).
Use \(-\delta\widetilde\delta Rm=\delta D\operatorname{Ric}\) and
\(\delta D(Rg)=(\Delta_B R)g+\nabla^2R\) in the corresponding
two gradients of §3. The Ricci action has coefficient \(-1\), the
\(R\operatorname{Ric}\) coefficient is
\(\tfrac14-\tfrac{\alpha-1}{12}=-c\), and the \(R^2g\) coefficient is
\(-\tfrac1{16}+\tfrac{\alpha-1}{48}=\tfrac c4\).
The algebraic trace vanishes in dimension four, and the differential
trace is \(\alpha\Delta_B R/4\). [Bour v1, §3](https://arxiv.org/html/1012.0342v1#S3)

With the Fourier convention \(\nabla\mapsto i\xi\), the quadratic
Ricci symbol on a symmetric metric perturbation \(h\) is
\[
r_\xi(h)
 = \tfrac12\bigl(|\xi|^2h+\xi\otimes\xi\,\operatorname{tr}h
     -\xi\otimes h(\xi^\sharp,\cdot)-h(\xi^\sharp,\cdot)\otimes\xi\bigr),
\qquad s_\xi(h)=\operatorname{tr}r_\xi(h).
\]
The fourth-order gradient symbol is
\[
\tfrac12|\xi|^2 r_\xi(h)
 -(\tfrac12+c)(\xi\otimes\xi)s_\xi(h)
 +(\tfrac14+c)|\xi|^2g\,s_\xi(h).
\]
On the transverse trace-free subspace this is
\(|\xi|^4h/4\). Multiplying by \(-2\) gives the original-flow symbol
\(-|\xi|^4h/2\) on that subspace, as in Bour §2. The symbol on the full
trace-free subspace also retains the longitudinal terms in \(r_\xi\)
and \(s_\xi\). [Bour v1, §2](https://arxiv.org/html/1012.0342v1#S2)

This comparison is an index derivation. The pinned
`levi_civita_nabla_contracted_bianchi` supplies the derivative of the
Ricci divergence for an arbitrary Levi–Civita metric in a basis, and
`tensor0S_ricciIdentity_of_leviCivita` supplies the slotwise commutator
for a smooth tensor. At the smooth-section level, comparing the
expanded gradient combines the contracted commutator with the
differentiated Bianchi identity and the scalar terms. [Pinned differentiated Bianchi identity](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Geometry/Connection/LeviCivita/Curvature/DifferentiatedContractedBianchi.lean) ·
[Pinned slotwise commutator](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Geometry/Connection/LeviCivita/Curvature/Identities.lean)

The contracted commutator itself is checked in
[BourCrossedRicci.lean](../../../SmoothPoincare/Variational/BourCrossedRicci.lean).
For any actual orthonormal tangent basis \((b_p)\), any tangent \(u,v\)
and \(S=\nabla^2\operatorname{Ric}\) of the given metric slice,
`bourCrossedRicci_commutator` proves
\[
\begin{aligned}
\sum_p\bigl[
 S(b_p,u,b_p,v)-S(u,b_p,b_p,v)
\bigr]
=(\operatorname{Ric}\circ\operatorname{Ric})(u,v)
-\sum_{p,q}\operatorname{Ric}(b_p,b_q)
 \langle R(b_p,u)v,b_q\rangle_g.
\end{aligned}
\]
The first curvature action is reduced using the metric skew symmetry
and the actual orthonormal Ricci trace. The second action is identified
with the pinned `hamiltonCurvatureRicciAt` by the skew symmetries of
both Riemann pairs in
`bourCrossedRicci_eq_ricciSquare_sub_curvature`. These theorems use
the metric and its Levi–Civita curvature fields on one slice.
They apply before imposing any evolution equation.
[Pinned curvature action in a basis](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Geometry/Curvature/Contractions/CurvatureActionLowering.lean) ·
[Pinned Hamilton curvature contraction](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Geometry/Flow/RicciFlow/HamiltonHarnack/MIdentities.lean)

The targeted Lake builds completed 10,318 jobs for Palatini and
10,319 jobs for the crossed commutator without diagnostics. Public
type and axiom checks of the six Palatini declarations and two
commutator theorems returned only `propext`, `Classical.choice`
and `Quot.sound`.
