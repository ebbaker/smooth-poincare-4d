# Original Bour flow, volume and dissipation

26 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. Actual serving model and reasoning effort
were unavailable. This is a bounded BRF-E04/E05 readback of the Edition 05
working source at HEAD `226b8f404b6e5c99f8e71f85280e5c9988bbf652` and its
working edits. The readback uses Lean `v4.35.0-rc3`, Mathlib
`c55e6e786f49471c72fbddbec5415808896aec1e` and DifferentialGeometry
`788efe97894474c032de6dfb1289d515f613d15a`. The manuscript and pin
manifest reproduce the dispatch hashes. [E47 dispatch](../../research-progress/handoffs/ED05_E47_PACKETS_20261126.md) · [Source receipt](../../../../references/SOURCE_NOTES_BOUR_ATTAINMENT_20261126.md)

## Physical identities and their premises

Fix a smooth closed connected oriented Riemannian four-manifold, with
`0 < α < 1` fixed on its original maximal trajectory. The signed charges
are Weyl Hilbert–Schmidt squares. Ricci uses the ordinary covariant
two-tensor norm. Write $F(g)=\mathcal F^\alpha(g)$,
$G=\operatorname{grad}_{L^2_g}F$, and
$V(t)=\operatorname{Vol}_{g_t}(M)$. On each closed slab $[a,b]$
inside the trajectory,
$$
 F'(t)=\int_M\langle G,\dot g\rangle_g\,dV_g
      =-2\int_M |G|_g^2\,dV_g,\qquad
 \int_a^b\!\int_M |G|_g^2\,dV_g\,dt=\tfrac12(F(g_a)-F(g_b)).
$$
`energy_drop_eq_two_dissipation` takes continuity on $[a,b]$, the actual
covariant tensor derivative `-2 • G` and the physical first variation
on $(a,b)$, and interval integrability of `gradientSq`. The theorem permits
$a=b$ and uses continuity at endpoints.
`original_gradient_sublevel` specializes it to `bourEnergy` of the
actual measured slices, and uses nonnegativity to obtain the sublevel.
Take $a=0$ to supply the budget's time-zero comparison. With the E03
bound `TimeBudget.energy_drop` and nonnegative dissipation, increasing
finite slabs give an improper dissipation integral at most
$\epsilon+\alpha I^+(M)$ at a finite or infinite maximal time. This step
uses the half factor even though Bour's printed integrated identity in
§8 omits it. [Checked dissipation](../../../SmoothPoincare/Variational/BourFlowDissipation.lean) · [Sublevel specialization](../../../SmoothPoincare/Variational/BourReturnedBudgets.lean) · [Bour §§1.2 and 8](https://arxiv.org/html/1012.0342v1)

For $c>0$, $R_{cg}=c^{-1}R_g$ and $dV_{cg}=c^2dV_g$.
`bourEnergy_scale` takes the actual metric equality
`scaled.metric = scaleMetric c hc q.metric` and equality of the physical
Euler integrals. The covariant Ricci tensor is fixed by constant scaling,
and $R_{cg}(cg)=R_g g$, so $\operatorname{Ric}_0$ is fixed too. Its square
and the scalar square acquire $c^{-2}$, canceled by physical volume.
The integrated Euler
decomposition and the signed signature equality give invariance of
the chiral total, hence of $F$. For volume conservation, apply the full
first variation to $c\mapsto cg_t$ at $c=1$. Its derivative direction
is $g_t$, and its scalar derivative vanishes by scale invariance.
Then
$$
 V'(t)=\tfrac12\int_M\operatorname{tr}_{g_t}\dot g_t\,dV_{g_t}
      =-\int_M\langle G,g_t\rangle_{g_t}\,dV_{g_t}=0.
$$
`volume_constant_of_scale_variation` requires the scaling path's physical
first variation and eventual constancy near $1$ as separate hypotheses.
It also requires continuity of the real volume on the slab, pinned
metric-family regularity and the pointwise trace of the actual speed.
For the trace, evaluate the tensor derivative on the fixed chart basis at
each point and contract the Gram-matrix derivative with its inverse.
`MetricFamilyRegularAt` quantifies over all real times in the pinned
API. A positive smooth extension agreeing on a neighborhood of a closed
interior slab can be made by a time cutoff and a convex blend with a fixed
metric. Use continuity to pass from such slabs to time zero. Volume is
finite on the compact carrier, so its conserved real value gives the
physical unit-volume normalization. [Volume theorem](../../../SmoothPoincare/Variational/BourFlowDissipation.lean) · [Scale theorem](../../../SmoothPoincare/Variational/BourReturnedBudgets.lean)

For $h_s=cg_{t_0+s/c^2}$, the checked chain rule gives
$\partial_s h=-2c^{-1}G$. In dimension four the physical $L^2$ pairing
of fixed covariant two-tensors is unchanged under metric scaling.
Consequently $dF_{cg}(cK)=dF_g(K)$ for every symmetric variation $K$
identifies the genuine covariant gradient of the scaled functional as
$c^{-1}G$, by uniqueness of the physical first variation. The
pointwise squared norm of $c^{-1}G$ acquires $c^{-4}$, and the
spatial integral therefore acquires $c^{-2}$. The factor $ds=c^2dt$
cancels it. The three Lean scaling lemmas verify the chain rule, norm
scaling and affine interval substitution for the represented field.
The interval integral is totalized in Lean, so applying that identity
as a dissipation estimate uses actual slab integrability and the
gradient identification. [Scaling declarations](../../../SmoothPoincare/Variational/BourFlowDissipation.lean)

## Upstream variation and fixed-parameter extraction

The open BRF-E04 supplier is the all-direction physical first variation
of the actual curvature functional on a smooth family. For
$\Delta_+=\operatorname{tr}_g\nabla^2=-\Delta_B$, calculate the scalar
part using
$\dot R=-\langle\operatorname{Ric},K\rangle+\operatorname{div}\operatorname{div}K-\Delta_+\operatorname{tr}K$
and the volume variation. Integrating by parts on the closed carrier gives
$$
 G_S=-2R\operatorname{Ric}_0+2\nabla^2R-2(\Delta_+R)g.
$$
The full variation is $G_W+(\alpha/24)G_S$, where $G_W$
is the physical gradient of $E_++E_-$. Its trace vanishes by varying
through $e^{2u}g$ and using conformal invariance. Hence
$\operatorname{tr} G=(\alpha/4)\Delta_B R$. On a connected compact critical
limit $R$ is constant, and the stationary equation in this gauge becomes
$G_W=(\alpha/12)R\operatorname{Ric}_0$. On a complete noncompact stationary
limit the same local first variation uses compactly supported directions.
Harmonicity, finite $\int R^2$ and the infinite volume from noncollapse
then give $R=0$, leaving the local Bach equation. The integration by parts,
identification of $G_W$ with the appropriately normalized Bach tensor,
and realization of the pins' analytic premises need supplying proofs.
[Working manuscript](../../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/manuscript/fixed_type_attainment.tex) · [Bour §§3–4, Proposition 4.4 and §8](https://arxiv.org/html/1012.0342v1)

BRF-E05 then needs the fixed-$\alpha$ maximal solution through the
supplied start, with the same physical equation. Bahuaud–Helliwell
Theorem A applies to the corrected short-time operator with
$k=1,c=1,a=-(1-\alpha)/6,b=(2+\alpha)/6$ in their convention.
Bour's positive-time derivative estimates require the post-Lemma 6.2
power $2j+2$, with constants that can depend on the fixed parameter.
Combine the strict original budget with noncollapse, continuation and
compactness at that parameter. The bounded branch needs whole oriented
diffeomorphisms and smooth convergence at times with gradient norm
tending to zero. The unbounded branch needs first hits at curvature
maxima and the same marked domains on each backward slab through its
final slice. On a fixed backward interval the original time endpoints
are $t_i-L/Q_i^2$ and $t_i$, and both approach the maximal endpoint.
The integrable dissipation tail gives stationarity through $s=0$.
Transfer the positive Yamabe bound on compactly supported tests and
each physical signed, Ricci, scalar and full curvature integral on
the entire marked exhaustion. The checked measured-return statements
start with those comparison and integral premises. These analytic
suppliers precede the independent parameter-zero extraction in Route 13.
[Strict flow audit](../../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/01_regularized_flow_and_energy/notes/BOUR_AUDIT_20261126.md) · [Bahuaud–Helliwell Theorem A](https://arxiv.org/pdf/1407.4406v1#page=2) · [Measured returns](../../../SmoothPoincare/Variational/BourReturnedBudgets.lean)

## Tests at the sign and equality boundary

A positive lower bound on $Y^2$ supplies a positive Yamabe floor
only with the sign data. The continuous spectral detector starts
positive, has the same positive sign, and at its zero forces $Y=0$.
Without the sign data, the real function equal to $1$ before $t=1/2$
and $-1$ thereafter starts positive and has $Y^2=1$ at all times.
Even a continuous proxy $1/2-t$ with the correct positive sign fails
at its zero if zero compatibility is removed. At initial equality,
normalize the wall to $1$ and the Euler total to $2$, and take
$\alpha=1/2$, $Y=1-2t$, $S=Y^2$, $e=1-Y^2/96$, and
$D=Y^2/24$ on $[0,1]$. These real data have the Euler identity,
constant $F=1$, nonnegative $D$, the nonstrict wall bound,
and a continuous detector $Y$ with a zero at midtime. They show
why the inequality alone supplies no positive floor at equality.
Bour's equality case uses the separate stationary case or a shift
to a strictly pinched slice of the genuine flow. These tests concern
the scalar implications. [Connected sign argument](../../../SmoothPoincare/Variational/YamabeWall.lean) · [Strict trajectory budget](../../../SmoothPoincare/Variational/BourTrajectoryBudget.lean) · [Bour §8](https://arxiv.org/html/1012.0342v1)

The pinned Lean replay of the seven dissipation, volume, scaling and
sublevel declarations returned only `propext`, `Classical.choice` and
`Quot.sound`. The two real tests were checked in a temporary Lean file.
