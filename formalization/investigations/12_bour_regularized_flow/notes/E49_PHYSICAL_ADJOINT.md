# Physical adjoints on the original Bour slice

26 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. BRF-E04 bounded execution uses the Edition 06 working
tree over HEAD 9c80575988ad8915ad39515c64400e3d8590cf46, Lean v4.35.0-rc3,
Mathlib c55e6e786f49471c72fbddbec5415808896aec1e and DifferentialGeometry
788efe97894474c032de6dfb1289d515f613d15a. Actual serving model and reasoning
effort were unavailable. The scientific input is the fixed-type attainment
manuscript with source SHA-256
719bbea527c6db649eaeee93e58e1f6b50f101772d79b406ee3ec378dca357f1. The task is
execution of the fixed divergence argument and the fixed-chart
regularity bridge. [Edition 06 inputs](../../research-progress/handoffs/ED06_SETUP_INPUTS_20261126.md)
 · [E48 variation](E48_SLAB_VARIATION.md) · [Working manuscript](../../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/manuscript/fixed_type_attainment.tex)

## Spatial identities on a closed metric slice

Fix a smooth Riemannian metric \(g\) on a compact boundaryless manifold.
The adjoints act on arbitrary smooth covariant tensor sections, with the
ordinary fiber pairing and the full Riemannian volume. No orientation or
curvature restriction is needed for these identities. Specialize in
dimension four to Bour's actual bulk functional. Its coefficient of
\(\dot{\operatorname{Ric}}\) is the covariant tensor
\[
A=\operatorname{Ric}+\frac{\alpha-4}{12}R\,g .
\]
Differentiating \(\tfrac12|\operatorname{Ric}|^2\) in the Ricci slot gives
\(\operatorname{Ric}\). Differentiating \((\alpha-4)R^2/24\) in that same slot
gives \((\alpha-4)Rg/12\). Here the Ricci norm uses the two covariant slots
and the weight is used after raising both indices in the contraction.
[Lean statements](../../../SmoothPoincare/Variational/BourTensorFirstVariation.lean)
 · [E48 energy density](../../../SmoothPoincare/Variational/BourSlabVariation.lean)

For the smooth covariant speed \(K\), put
\[
C_{kij}=\tfrac12(\nabla_i K_{jk}+\nabla_jK_{ik}-\nabla_kK_{ij}).
\]
The lowered output is the first slot of `bourKoszulFlux`. Its first
permutation sends the tuple \((k,i,j)\) to \((i,j,k)\). Its second sends
\((k,i,j)\) to \((j,i,k)\). The third term leaves the tuple unchanged and
has coefficient \(-1/2\). `bourMetricVelocity` constructs the smooth
spatial section from the actual regular metric family, and
`bourKoszulFlux_native` identifies the resulting flux with the actual
Levi–Civita time derivative lowered using \(g\). The pairing
`bourClosedTensorPairing_native` evaluates a smooth tensor weight against
the literal velocity in the original slab theorem.
[Pinned metric-family derivative](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Geometry/Metric/Family/TimeDerivative.lean)
 · [Pinned variation of Levi–Civita](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Geometry/Connection/LeviCivita/Variation/MetricDerivative.lean)

`bourWeightedRicciKoszul_firstAdjoint` integrates the divergence of the
metric dual of the one-form with components \(A^{ij}C_{kij}\). The pinned
weighted covariant divergence theorem at constant weight one yields
\[
\int_M A^{ij}\nabla^k C_{kij}\,dV_g
= -\int_M(\nabla^k A^{ij})C_{kij}\,dV_g .
\]
Compact support follows from compactness of the carrier. The first
derivative slot is the contracted one, and metric compatibility is built
into the pinned product divergence. The sign comes from moving the
derivative across this physical contraction.
[Pinned covariant divergence theorem](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Analysis/Elliptic/ConnectionLaplacian/IntegrationByParts/WeightedDivergence.lean)

`bourWeightedRicciKoszul_secondAdjoint` returns the other derivative to
\(A\) after moving each rank-three permutation across the fiber pairing
as its inverse. For symmetric \(A\) and \(K\), the two crossed contributions
are equal after renaming the free and dummy slots. In indices the resulting
pairing is
\[
\int_M(\nabla_i\nabla_k A^{ij})K^k{}_j
       -\tfrac12(\nabla^\ell\nabla_\ell A^{ij})K_{ij}\,dV_g .
\]
There is no interchange of covariant derivatives in these transfers.
The inner derivative is along the original divergence index \(k\).
`bourWeightedRicciRough_adjoint` isolates the \(-1/2\) factor, or \(+1/2\)
against Bour's nonnegative rough Laplacian. This agrees with the coefficient
on the trace-free Ricci tensor in Proposition 4.4 when \(R\) is constant,
since \(A=\operatorname{Ric}_0+(\alpha-1)R g/12\) and \(\nabla g=0\).
[Bour v1, §3 and Proposition 4.4](https://arxiv.org/html/1012.0342v1)

## Native Ricci derivative and comparison with the bulk pairing

The coordinate Ricci variation in the pin is available for a general
Levi–Civita family. `lcRicciVarCoord` consumes the Christoffel
time derivative at the chart center and a mixed identity, using a fixed
coordinate frame around that center. The small affine metric-perturbation
result `linearizedRicciAt_eq_palatini_covDeriv` verifies the two
contractions along its own realized path. The Ricci-flow curvature
evolution lemmas specialize to the Ricci velocity.
[Pinned coordinate variation](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Geometry/Connection/LeviCivita/Variation/RicciCoord.lean)
 · [Pinned affine path](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Analysis/Parabolic/RicciLinearization/PalatiniDecomposition/PathLinearization.lean)

A fixed chart provides the direct mixed derivative on the original regular
path. In `bourChartChristoffel_spatial_hasDerivAt`, set
\(\Gamma(s,y)=\Gamma^{k}_{ij}(g_s,y)\) in the chart model basis and
\(C_{\rm chart}(y)=\partial_t\Gamma(t,y)\) in that same chart. The open
regular time set and chart-target interior give the joint smooth germ.
Along the chart vector \(b_d\), the checked identity is
\[
\left.\frac{d}{ds}\right|_{s=t}D_y\Gamma(s,y)[b_d]
=D_y C_{\rm chart}(y)[b_d] .
\]
`bourChartRicci_hasDerivAt` then differentiates the actual chart
Christoffel products and sums the curvature contraction.
`bourMetricRicciAt_chartBasis_hasDerivAt` identifies the result with the
velocity of the physical Ricci tensor evaluated on the corresponding
fixed tangent basis vectors. [Lean statements](../../../SmoothPoincare/Variational/BourChristoffelTime.lean)
 · [Pinned joint chart smoothness](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Geometry/Metric/Family/ChartCurvature/MetricFamilySmoothOn.lean)

The next tensor bridge is to identify the chart derivative of the
Christoffel field, after lowering its output, with `bourKoszulFlux`
throughout the same chart neighborhood. Then the differentiated products
combine with the two spatial partial derivatives to give the ordered
covariant contractions of the lowered flux. The required identity for the
covariant Ricci velocity is
\[
P_{ij}=\nabla_k C^k{}_{ij}-\nabla_i C^k{}_{kj}.
\]
For symmetric \(K\), the traced connection speed is
\(C^k{}_{kj}=\tfrac12\nabla_j\operatorname{tr}_g K\) by metric
compatibility. A spatially trace-free speed thus removes the second
contraction. For general speeds the corresponding spatial adjoint is
\(-\tfrac12(\nabla_j\nabla_i A^{ij})\,\operatorname{tr}_g K\) in the integrated
pairing. The scalar Hessian is symmetric, so its term can be written
using \(\nabla_i\nabla_j A^{ij}\) as well for symmetric \(A\).

At the density level, the first variation still requires the inverse
metric contributions
\[
-\langle\operatorname{Ric}\circ\operatorname{Ric},K\rangle_g
-\tfrac{\alpha-4}{12}R\langle\operatorname{Ric},K\rangle_g .
\]
The E48 variation supplies the volume term
\(\tfrac12\operatorname{tr}_g K\,B_\alpha\). After assembling these
terms and the two ordered contractions, compare the resulting tensor
with Bour's full covariant gradient. Conformal tests give its trace
\(-\alpha\Delta_g R/4\), where \(\Delta_g=\operatorname{tr}\nabla^2\).
Consequently the original velocity \(K=-2G\) has trace
\(\alpha\Delta_gR/2\), which can be nonzero locally. Constant scaling
uses a different metric test and gives zero integrated trace. The original
paired-slab conclusion retains the factor \(1/2\) in the integrated
dissipation. The two spatial transfers and the fixed-chart Ricci
derivative are established here. The intrinsic Ricci contraction bridge,
full bulk gradient and original negative twice-gradient equation remain
open in Lean. [Conformal trace](../../../SmoothPoincare/Variational/BourConformalTrace.lean)
 · [Slab theorem](../../../SmoothPoincare/Variational/BourSlabVariation.lean)
 · [Bour v1, gradient formulas and original flow](https://arxiv.org/html/1012.0342v1#S3)

The direct Lean checks completed without diagnostics. The two-leaf Lake
build completed 10,312 jobs. Axiom queries for thirteen declarations in
the two leaves returned only `propext`, `Classical.choice` and
`Quot.sound`.

