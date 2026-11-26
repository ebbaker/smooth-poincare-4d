# Physical first variation on an original Bour slab

26 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. Actual serving model and reasoning effort were
unavailable. BRF-E04 bounded execution uses the E47 working generation at
intake HEAD 226b8f404b6e5c99f8e71f85280e5c9988bbf652, Lean v4.35.0-rc3,
Mathlib c55e6e786f49471c72fbddbec5415808896aec1e and DifferentialGeometry
788efe97894474c032de6dfb1289d515f613d15a. The scientific input is the
working Investigation 06 manuscript with SHA-256
719bbea527c6db649eaeee93e58e1f6b50f101772d79b406ee3ec378dca357f1 and
the primary variation in Bour §3 and Proposition 4.4.
[Dispatch](../../research-progress/handoffs/ED05_E48_PACKETS_20261126.md) · [E47 original-flow readback](E47_ORIGINAL_FLOW.md) · [Working manuscript](../../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/manuscript/fixed_type_attainment.tex) · [Bour v1](https://arxiv.org/html/1012.0342v1)

## Checked on actual metric paths

On the closed oriented Riemannian four-manifold let $q(t)$ be a path of
signed measured metrics and write $g_t=q(t).\mathrm{metric}$. At each
regular time of a supplied smooth metric family,
**bourMetric_hasDerivAt_regular** provides its genuine covariant speed.
**traceTimeDerivMetric_eq_inner_of_velocity** evaluates that tensor
derivative on the fixed chart basis, contracts the resulting Gram
derivative with the inverse Gram matrix and identifies the result as
$\langle \dot g,g\rangle_g$. The pinned **first_var_joint** uses a smooth
time retraction into an open regular neighborhood. Thus
**bourVolume_hasDerivAt_of_velocity** supplies the physical derivative
$V'=\frac12\int \langle \dot g,g\rangle_g\,dV_g$ with only local chart
smoothness. The identity can be integrated on a closed finite slab
with continuity at its endpoints. The same source proves continuity of
both the energy and volume at every regular time.
[Checked Lean source](../../../SmoothPoincare/Variational/BourSlabVariation.lean) · [Pinned localized variation](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Analysis/Integration/Measure/Family/LocalVariation.lean)

The physical signed path **bourScalePath** is the constant conformal
change with factor $e^{s-1}$ for every real $s$. At $s=1$ its covariant
velocity is precisely $g$. Its energy is constant by the two signed
conformal invariances and the four-dimensional trace-free Ricci scaling
law, so its energy derivative is zero. A supplied gradient pairing
through this actual path then has zero integrated trace. With $\dot g=-2G$
this gives volume conservation through
**bourOriginal_slab_of_pairings**, along with monotonicity and the
dissipation factor $1/2$ from the original energy drop.
[Exact scale path and finite slab](../../../SmoothPoincare/Variational/BourSlabVariation.lean) · [Scale invariance](../../../SmoothPoincare/Variational/BourReturnedBudgets.lean)

**bourEnergy_eq_integral_bulk** rewrites the functional on the closed
carrier using the integrated Euler and signed signature decompositions.
For the intrinsic density
$$
 B_\alpha(g)=\tfrac12|\operatorname{Ric}_g|^2+
             \tfrac{\alpha-4}{24}R_g^2,\qquad
 F^\alpha(g)=(1-\alpha)\mathcal E(g)+\int_M B_\alpha(g)\,dV_g ,
$$
$\mathcal E(g)$ is the physical Euler integral and the Ricci norm is the
ordinary covariant two-tensor norm. The chart Ricci and scalar jets
yield joint smoothness on the regular spacetime set, using finite
inverse-Gram contraction. With constant $\mathcal E$ there,
**bourEnergy_hasDerivAt_intrinsic** obtains the actual derivative
$$
 (F^\alpha)'(t)=
   \int_M\left(\partial_t B_\alpha+\tfrac12\langle \dot g,g\rangle_g B_\alpha\right)dV_g.
$$
The derivative is obtained from the intrinsic density and physical
volume. The existing source interface supplies the physical Euler value
and the chiral measurements with their signed identity.
[Intrinsic variation](../../../SmoothPoincare/Variational/BourSlabVariation.lean) · [Physical normalization](../../../SmoothPoincare/Variational/BourTrajectoryBudget.lean)

## Closed slabs within the regular times

The negative half of the native covariant metric velocity has chart
coefficients equal to negative half the time derivatives of the metric
Gram entries. Their joint smoothness gives the same property for the
physical squared norm by contraction with the inverse Gram matrix.
Integrating against the evolving Riemannian volume gives continuity of
the speed-square integral by **bourVelocityGradientSq_continuousOn_regular**.
On a compact slab fully contained in the regular times, this function
is interval integrable. A supplied field $G$ satisfying $\dot g=-2G$
throughout the open slab gives the same integrand there, and the two
endpoints have zero Lebesgue measure. Thus
**bourGradientSq_intervalIntegrable_on_regularSlab** requires the
velocity equation only on the open slab. The energy and volume
continuities already hold on the entire regular carrier.

**bourOriginal_regularSlab_of_pairings** packages these conclusions
with the two physical gradient pairings. It derives the continuity
and integrability premises internally. For a slab touching an endpoint
outside the regular set, **bourOriginal_slab_of_pairings** retains
its original endpoint and integrability premises.
[Regular-slab proofs](../../../SmoothPoincare/Variational/BourSlabVariation.lean)

## Tensorial identification still needed

For a smooth symmetric covariant direction $K=\dot g$, write
$C^k{}_{ij}=\dot\Gamma^k{}_{ij}$ and $P_{ij}=\dot{\operatorname{Ric}}_{ij}$.
The Levi–Civita variation gives
$$
 C^k{}_{ij}=\tfrac12 g^{k\ell}
    (\nabla_i K_{j\ell}+\nabla_j K_{i\ell}-\nabla_\ell K_{ij}),
 \qquad P_{ij}=\nabla_kC^k{}_{ij}-\nabla_jC^k{}_{ik}.
$$
The moving inverse metric in the bulk density contributes
$-\langle \operatorname{Ric}\circ\operatorname{Ric},K\rangle_g$ and
$-(\alpha-4)R\langle\operatorname{Ric},K\rangle_g/12$.
The coefficient of $P$ is
$A^{ij}=\operatorname{Ric}^{ij}+(\alpha-4)R g^{ij}/12$.
On the closed carrier the two required integrations by parts give the
candidate gradient pairing by replacing $\int A^{ij}P_{ij}$ with
$$
 \int_M\!\left(
  (\nabla_i\nabla_k A^{ij})K_j{}^k
  -\tfrac12(\nabla^\ell\nabla_\ell A^{ij})K_{ij}
  -\tfrac12(\nabla_i\nabla_j A^{ij})\operatorname{tr}_g K
 \right)dV_g .
$$
Together with the algebraic inverse-metric and volume terms, this
expression must be identified with Bour's tensor in the repository
curvature and Laplacian conventions. The pinned Ricci linearization
has local covariant and metric-perturbation path formulas. The remaining
tensorial step combines those local formulas with the weighted
integrations by parts for the full physical functional. The leaf takes the
equality of its computed bulk derivative with the physical pairing,
and the representation of the same gradient on the scale path, as
explicit supplying premises. A constant scale constrains the integrated
trace. The [conformal first variation](../../../SmoothPoincare/Variational/BourConformalTrace.lean) now supplies its spatial value by testing all smooth conformal directions, with the Euler integral constant on each germ. The general slab interface retains endpoint continuity, interval integrability and a genuine negative twice-gradient velocity on its interior. The regular closed-slab specialization above derives the first two from the original metric family. Maximal existence
and fixed-parameter geometric comparison are separate BRF-E05 inputs.
[Bour §3](https://arxiv.org/html/1012.0342v1) · [Pinned Ricci linearization](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Analysis/Parabolic/RicciLinearization/MetricPerturbationPath/Basic.lean) · [E47 fixed-parameter inputs](E47_ORIGINAL_FLOW.md)

The targeted build completed without warnings. Axiom replays on the
thirteen initial results and three regular-slab results returned only
`propext`, `Classical.choice` and `Quot.sound`.
