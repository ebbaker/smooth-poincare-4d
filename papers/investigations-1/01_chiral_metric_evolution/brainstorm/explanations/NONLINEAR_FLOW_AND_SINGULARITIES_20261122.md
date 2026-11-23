# Why round geometry helps, and what a singularity would mean

22 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. Actual selected model identifier and effort are
unavailable. The selected lead is the sole writer. This is the bounded
explanation SP4-CME-EXPL-E02, with the associated priority decision
SP4-CME-FLOW-B01 recorded [separately](../notes/FLOW_FIRST_PRIORITY_20261122.md).
The [sole register](../../research-progress/REGISTER.md) owns live status.

Input manuscript: [chiral_curvature_and_metric_evolution.tex](../../manuscript/chiral_curvature_and_metric_evolution.tex),
SHA-256 `4af6ef2f1c6ce7cd5102fc1d75d17f34e3c5a5357f51e70e61f07a967a361ec0`.
Repository HEAD at inspection: `69d602ad580314d68c2b336fda1ddcffca541482`;
the worktree includes earlier editorial and explanatory changes. Supporting
notes and conventions are identified in the [earlier explanation](RESEARCH_SUMMARY_20261122.md).
The manuscript is not revised here. This explanation checks dependencies
and simple consequences of its formulas; it is not the six-claim proof audit,
a new nonlinear PDE calculation, or a comprehensive literature review.

## What is already valid away from round geometry

Work on a smooth closed oriented real Riemannian four-manifold, with a
definite SO(3) connection on an oriented Euclidean rank-three bundle.
Use the manuscript's positive curvature-plane convention and the
curvature-map orientation sign of the round model. On an unknown homotopy
sphere, this sign condition must not be replaced by an assumed path to a
known round connection. Fix the scale K > 0.

Write
\[
 \mu_A=\frac13\sum_iF_i\wedge F_i,
 \qquad F_i\wedge F_j=Q_{ij}\mu_A,
 \qquad Q>0,\quad\operatorname{tr}Q=3.
\]
The reconstructed metric is defined by
\[
 \Lambda^+_{\widehat g_A}=\operatorname{span}\{F_i\},
 \qquad dV_{\widehat g_A}=\frac{\mu_A}{2K^2}.
\]
These are exact constructions throughout the definite region, not
perturbation formulas. The exact metric-velocity and compatibility identities
in manuscript Sections 4.3–4.4 also hold there.

With q = Q − I, the flow in manuscript Section 6 is
\[
 \partial_tA=-4d_A^{*_{\widehat g_A}}
     \left[\left(q-\frac16|q|^2I\right)F_A\right].
 \tag{1}
\]
Fine proves short-time existence and uniqueness for definite initial
connections on compact four-manifolds, using the full bundle symmetry
group, which includes base diffeomorphisms. He also proves nonlinear
global existence and exponential convergence modulo that group for
sufficiently small Sobolev perturbations of a given perfect connection.
See [Fine, Theorems 4.3, 4.10 and 4.11](https://arxiv.org/html/1111.5005v2).
The manuscript's constant metric normalization changes the time scale.

Thus the open issue here is global control from general definite initial
data. Parabolicity is not restricted to the round background. Equality
with Ricci flow is not needed for short-time existence, and Ricci flow is
itself nonlinear.

## What the round background supplies

At the round connection A₀ with sectional curvature K,
\[
 Q_0=I,\qquad F_0=-K\Sigma_0^+,
 \qquad A_0=\Gamma^+_{g_0}.
\]
The adapted forms are parallel for the combined tangent and bundle
connection. The curvature is constant, the compatibility defect vanishes,
and the flow velocity is zero.

If A = A₀ + εa + O(ε²) and Q = I + εq₁ + O(ε²), then
\[
 a_t=-4d_0^*(q_1F_0),
 \qquad
 (q_1)_t=-4(L_E+6K)q_1,
 \quad L_E=\nabla_{A_0}^*\nabla_{A_0}.
 \tag{2}
\]
The reason no first variation of the adjoint contributes to the first
formula is that it multiplies the zero background defect. The constant
curvature commutator produces the favorable zeroth-order term −24Kq₁.
Consequently, with Δ = ∇ᵃ∇ₐ,
\[
 (\partial_t-4\Delta_{g_0})|q_1|^2
 =-8|\nabla q_1|^2-48K|q_1|^2.
 \tag{3}
\]
This gives the manuscript's exponential linear decay by the maximum
principle. See Section 7, labels `flow:linear-connection`,
`flow:round-defect-heat` and `flow:linear-pointwise-decay`.

The round geometry also fixes Sobolev constants and a positive spectral
gap after the symmetry directions are removed. Small perturbations in a
sufficiently strong topology keep the nonlinear coefficients close to
those of this stable equation. The nonlinear terms can then be handled
as small perturbations of the dissipative operator. Fine's local
stability theorem makes this mechanism rigorous; it assumes closeness
of the connection to an already given perfect connection, in a fixed
background L²_k norm with k ≥ 3. It is not a theorem whose only assumption
is a small pointwise value of Q − I on an unknown manifold.

The manuscript's Ricci-flow correspondence uses further round identities.
For a transverse-traceless metric perturbation, the reconstructed
perturbation satisfies
\[
 \widehat h_t=-4(L+2K)\widehat h.
\]
After τ = 4t this agrees with the normalized Ricci-flow linearization
on that sector. Constant curvature preserves the TT decomposition and
permits the differential operators used in the comparison to commute.
This is a linear comparison, not an established nonlinear identity for
arbitrary connection data. The fourth-order metric gradient of
\(g\mapsto\mathcal P(A_g^+)\) is a separate flow; its nonlinear discrepancies
must not be used as a proof about the independent connection flow.
See manuscript Sections 8–11.

## Why the nonlinear problem needs more variables and estimates

First, the metric used in the adjoint in (1) depends on the curvature of
A. As A evolves, the metric, its volume density, the self-dual plane and
the coefficients of the differential equation all evolve. The algebraic
reconstruction is smooth inside the definite region, but its derivatives
involve inverse matrices that become ill-conditioned near the boundary.
Short-time parabolicity does not by itself give uniform parabolic estimates
for all later time.

Second, a general definite connection is not the chiral Levi–Civita
connection of its reconstructed metric. In manuscript Section 4.4 set
\[
 \Sigma_A=-K^{-1}Q^{-1/2}F_A,\qquad
 b=A-\Gamma_A^+,
\]
and define
\[
 \mathcal T_A=d_A\Sigma_A
       =-K^{-1}(d_AQ^{-1/2})\wedge F_A
       =[b,\Sigma_A].
 \tag{4}
\]
Pointwise, \(|b|\leq|\mathcal T_A|\leq2|b|\), and
\(\mathcal T_A=0\) exactly when \(A=\Gamma_A^+\). This is a derived
compatibility variable, not an additional freely chosen field. Small
amplitude of Q − I alone supplies no derivative bound in (4).

There is also an exact distinction between connection curvature and metric
curvature. By self-duality and the volume normalization,
\[
 |F_A|^2_{\widehat g_A}\,dV_{\widehat g_A}
   =\sum_iF_i\wedge F_i=3\mu_A,
 \qquad
 \boxed{|F_A|^2_{\widehat g_A}=6K^2.}
 \tag{5}
\]
This is a normalization identity for every definite A, not a regularity
estimate for the reconstructed geometry. With the convention
\(F_A=dA+\tfrac12[A\wedge A]\), the usual difference-of-connections identity gives
\[
 F_{\Gamma_A^+}
   =F_A-d_{\Gamma_A^+}b-\tfrac12[b\wedge b].
 \tag{6}
\]
Thus controlling F_A in its own reconstructed metric leaves derivatives
of b to control even for the chiral Levi–Civita curvature. Moreover, that
chiral curvature directly encodes W⁺, scalar curvature and the trace-free
Ricci block; it does not directly encode the opposite Weyl block W⁻.
The signature identity on a homotopy sphere identifies the integrals of
|W⁺|² and |W⁻|², but is not a pointwise bound or a prevention-of-concentration
theorem. Equations (5)–(6) are elementary consequences recorded here to
explain this distinction; they are not a new flow estimate.

Third, Q does not record the entire evolving metric. Writing the curvature
velocity as
\[
 d_A A_t=U\Sigma_A+V\Sigma^-,\qquad S=Q^{1/2},
\]
the exact Section 4.3 identities give
\[
 Q_t=-K^{-1}(US+SU^T)
       +\frac{2}{3K}\operatorname{tr}(SU)Q,
 \qquad
 \beta_{\widehat g_A}(h_0)=-K^{-1}S^{-1}V.
 \tag{7}
\]
Here h₀ is the trace-free endomorphism associated with ∂ₜĝ, and β is the
standard isomorphism from such metric variations to variations of the
self-dual plane. The opposite-chirality matrix V drives metric shape but
does not occur directly in Q_t. These identities do not prove that Q has
no useful closed evolution after further analysis; they show why bounds
on its values cannot simply be treated as bounds on all metric derivatives.

## Decreasing energy does not yet prevent degeneration

The available Lyapunov identity is
\[
 \mathcal P(A)=\int|Q-I|^2\mu_A,
 \qquad
 \frac{d\mathcal P}{dt}=-\|A_t\|_A^2.
 \tag{8}
\]
But Q > 0 and tr Q = 3 already imply
\[
 0\leq|Q-I|^2<6.
\]
For the round chiral bundle this yields \(\mathcal P<32\pi^2\) throughout
the definite configuration space. A finite upper bound therefore cannot
by itself separate the solution from its boundary. A sufficiently small
*uniform* defect would yield
\[
 \lambda_{\min}(Q)\geq1-\sqrt{\frac23}\,|Q-I|,
 \tag{9}
\]
but the nonlinear evolution has not yet been shown to preserve such a bound.
Even that algebraic bound would leave geometric regularity to establish.
Small energy could still become useful with a suitable PDE regularity
theorem; the manuscript does not rule out that possibility.

Section 12 supplies a concrete warning. In a smooth local source-metric
family, with parameter z → 1 from below, at a fixed point
\[
 Q\longrightarrow\operatorname{diag}(3,0,0),
\]
while the reconstructed metric is
\[
 \widehat g_A=
 \sqrt{1-\frac23z^2}\,
 \operatorname{diag}\left(
 \frac{1-z}{1+z},\frac{1+z}{1-z},1,1\right).
 \tag{10}
\]
One metric eigenvalue tends to zero and another to infinity, whereas
the defect energy density relative to the regular source metric tends
to the finite value 4K². This is a realized local curvature family,
not a flow trajectory. The cutoff argument does not establish a global
definite family up to the limit. The conclusion is a failure of an
algebraic energy barrier, not a constructed finite-time singularity.

The total reconstructed volume is also fixed along a smooth definite path
on a fixed bundle, but this does not bound the volume of every small ball
or the injectivity radius. The round perfect connection is stationary,
so its behavior is not the finite-time shrinking round sphere of
unnormalized Ricci flow.

## What is known about singularities of this particular flow

For sufficiently small strong-norm perturbations of a given perfect
connection, Fine's theorem gives existence for all time and convergence
modulo bundle automorphisms: there is no singularity in that regime.
For general definite starting data, the manuscript has neither a global
regularity theorem nor an example of a singular solution. The primary-source
check and targeted search in the [source record](../../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md)
did not identify a general singularity classification for this precise
defect-functional flow. This limited search does not certify that none
exists elsewhere in the literature.

The distinct failure mechanisms that the research must test are:

| Possible obstruction | What would need to be shown or excluded |
| --- | --- |
| Loss of definiteness | A normalized eigenvalue can approach zero, or the unnormalized curvature-volume data can degenerate; the smooth metric reconstruction then leaves its domain. |
| Loss of geometric regularity | The reconstructed Riemann curvature or necessary derivatives can become unbounded even though the normalization identity (5) still holds before failure. |
| Collapse or failure of compactness | Total volume is fixed, but local geometry may lack the bounds needed for smooth limits modulo symmetries. Collapse is a potential compactness obstruction, not automatically a finite-time singularity. |
| Degeneration only as t → ∞ | A solution might exist for every finite time without a smooth compact limit. |
| Convergence to an unwanted stationary point | Vanishing gradient means stationarity of the energy, which has not been shown here to force Q = I. |

These are candidate mechanisms, not demonstrated behaviors. Fine explicitly
leaves open the exclusion of nonperfect critical points for the connection
energy in Section 1.6, following the introductory flow theorem. The paper's
corresponding exclusion result for definite triples is a different result.
Likewise, extension theorems for hypersymplectic flow and critical-point
results for the Fine–Krasnov–Panov volume functional cannot be transferred
to (1) without a new argument.

Even if the solution exists globally, (8) gives only
\[
 \int_0^\infty\|A_t\|_A^2\,dt\leq\mathcal P(A(0)).
\]
This provides times with small speed, not by itself a smooth limit, a
perfect limit, or convergence of the full trajectory.

## The resulting research priority

Study (1) as a nonlinear geometric PDE, keeping the full smooth Poincaré
problem as the motivating objective. First identify the actual evolution
and continuation quantities; let a preserved intermediate hypothesis arise
from estimates rather than fixing small-Q pinching in advance.

After the existing bounded foundation audit, the next conceptual packet
should choose one exact nonlinear calculation, normally the Q evolution
with compatibility and metric dependence made explicit. Its assessment
should identify which terms have favorable signs, which need separate
bounds, and whether any maximum-principle candidate is justified.
Subsequent work can seek a useful geometric continuation criterion,
compactness and stationary-point rigidity. A list of plausible bounds
on Q, compatibility and curvature is not yet such a criterion.

Known classifications remain valuable tests if the formalism establishes
the required evolution, preservation and convergence itself. Recognizing
the underlying manifold by an existing theorem does not establish that
this connection flow converges for the corresponding starting connections.
Even an already known sphere conclusion can therefore contain new flow
analysis. Novelty must be assessed for that precise analytic statement.

Finally, flow analysis and initialization are separate parts of the full
conjecture. Equation (1) starts only after a definite connection exists.
No argument in the manuscript constructs appropriate initial definite
data on every smooth homotopy four-sphere. Successful global flow control
under that existence assumption would be substantial progress, while
leaving this second global bridge to supply.


## Subsequent research correction — 22 November 2026

The activated [E02 calculation](../../reviews/E02_NONLINEAR_ASSESSMENT_20261122.md) derives the exact nonlinear Q equation and shows that Fine's unadjusted flow preserves the curvature volume form pointwise in a fixed base identification. Earlier statements here about possibly changing density describe general connection paths and must be qualified for this specific flow. Fixed volume density still gives no anisotropy, curvature or noncollapse estimate. The original explanation and its input hash above remain historical evidence.
