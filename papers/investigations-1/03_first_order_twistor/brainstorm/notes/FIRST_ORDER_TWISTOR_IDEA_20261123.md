# Local integrable sections and first-order equations

23 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. The selected model identifier and reasoning
effort were unavailable. The inputs are the [founding discussion](../../../02_bach_flow/chat-histories/0001_2026-11-23T20-58-56Z_outline-bach-flow-research-overview.json),
the [Bach overview's real twistor section](../../../02_bach_flow/research-overview/OVERVIEW.md#generalized-isothermal-coordinates-and-real-twistor-geometry),
and the [source and version record](../../DRAFT_HISTORY.md). This note
records the proposed direction and its local mathematical basis.

On a Riemannian surface, a harmonic function $u$ with $du\ne0$ yields a
local conjugate function by $dv=*du$, since $d*du=0$. The Beltrami
formulation likewise seeks coordinates annihilated by a complex
first-order operator. The rank-one complex distribution on the surface
is automatically involutive. In four real dimensions $*du$ is a
three-form. On the real metric twistor space $Z_g=S(\Lambda_g^+)$, the
analogue of the Beltrami system uses a complex rank-three distribution.
Its involutivity is equivalent to $W^+=0$ in our chirality. The earlier
generalized coordinate work used a holomorphic direction fibration and
curves with normal bundle $\mathcal O(1)\oplus\mathcal O(1)$. A first-order
construction would address the integrable metric twistor geometry needed
before applying holomorphic reconstruction. [Twistor and earlier chart sources](../../../../../references/SOURCE_NOTES_CME_REAL_TWISTOR_20261122.md)

## Local criterion

Fix a smooth positive-definite Riemannian metric on an oriented real
four-manifold. A local section of $Z_g$ specifies a positive orthogonal
almost complex structure $J$. If $J$ is integrable, $T^{0,1}_J$ is
involutive and totally null for the complex-bilinear extension of $g$.
The Koszul formula gives preservation of this plane along itself by the
Levi–Civita connection. Its null sectional Weyl curvature vanishes.
These evaluations form a homogeneous quartic in a projective chiral
direction and determine $W^+$. Each integrable $J$ supplies a zero, as
does the antipodal section $-J$. Three sections that are pointwise
distinct up to sign for the same metric give six distinct roots, so the
quartic vanishes. Conversely, when $W^+=0$, local complex surfaces
transverse to the real twistor fibers supply integrable sections through
any prescribed directions. This is a local equivalence for a supplied
conformal metric. [Weyl quartic source](../../../../../references/SOURCE_NOTES_BACH_FLOW_20261123.md#first-order-twistor-discussion--23-november-2026) ·
[Local proof in the manuscript](../../manuscript/first_order_twistor_and_smooth_poincare.tex)

## Three formulations

1. **Projective spinors.** On a spin patch,
   $\mathcal D_\pi=S^-\otimes\mathbb C\pi$ for a nonzero positive spinor
   $\pi$. The line equation $(\nabla^+_X\pi)\wedge\pi=0$ for all
   $X\in\mathcal D_\pi$ is the first-order Frobenius condition. The
   proposed unknowns are a single conformal metric and three such lines
   distinct up to antipodal sign.
2. **Twistor spinors.** The equation
   $\nabla_X\psi_++\tfrac14X\cdot D_g\psi_+=0$ implies
   $W(X,Y)\cdot\psi_+=0$. A nonzero real self-dual two-form acts
   invertibly on $S^+$, so a nonzero positive-chiral twistor spinor
   forces $W^+=0$ on its nonzero locus. Friedrich's prolongation
   extends the curvature conclusion across zeros for a nontrivial
   solution on a connected base. The existence of a spinor satisfying
   this overdetermined equation is its own problem.
   [Twistor spinor source](../../../../../references/SOURCE_NOTES_BACH_FLOW_20261123.md#first-order-twistor-discussion--23-november-2026)
3. **Chiral connection and two-forms.** Let $\Sigma$ be a normalized
   positive self-dual triple defining a metric and $A$ an independent
   $SO(3)$ connection. Impose $d_A\Sigma=0$ and require the trace-free
   part of the coefficient matrix of $F_A^+$ in $\Sigma$ to vanish.
   Compatibility identifies $A$ with the chiral Levi–Civita
   connection. In the companion sign convention its self-dual
   curvature block is the negative of $W^++sI/12$. This gives a
   first-order system in $(\Sigma,A)$ with the Ricci block left free.
   [Companion compatibility and curvature conventions](../../../01_chiral_metric_evolution/manuscript/chiral_curvature_and_metric_evolution.tex)

## From patch solutions to a global conformal class

The local sections may vary between patches. A global section over a
homotopy four-sphere would give an almost complex structure, requiring
$\langle c_1^2,[M]\rangle=2\chi(M)+3\tau(M)=4$ although $H^2(M;\mathbb Z)=0$.
The metric or conformal class must agree on overlaps, with the appropriate
real frame and projective spin transition laws. Achieving this across a
closed smooth homotopy sphere would give $W^+=0$ globally. The signature
and conformal developing argument would then recognize the smooth sphere.
[Recognition and normalization](../../../02_bach_flow/research-overview/OVERVIEW.md#two-recognition-targets)

The first proposed test is two overlapping patches of round $S^4$.
Compare the linearized metric-and-section equations and the chiral
connection equations after accounting for coordinates, conformal scale,
and frame changes. Ask which conformal overlap discrepancies can be
corrected through their linearized solutions. The companion
transverse-traceless Weyl calculation gives a fixed benchmark.

There is also a quantitative question for the Bach branch. Uniform
separation of the three directions gives stable pointwise reconstruction
of $W^+$ from the three complex quartic evaluations. An estimate of those
evaluations by the Frobenius defects and their derivatives would give a
way to bound $E_+$. In a positive-Yamabe class, this could be compared
with the strict $4\pi^2$ recognition threshold. The algebraic
reconstruction is local. The differential estimate, usable overlap
control, and existence on an arbitrary homotopy sphere are open.
[Bach finite-time recognition](../../../02_bach_flow/research-overview/OVERVIEW.md#conditional-starting-range-and-the-first-estimate)
