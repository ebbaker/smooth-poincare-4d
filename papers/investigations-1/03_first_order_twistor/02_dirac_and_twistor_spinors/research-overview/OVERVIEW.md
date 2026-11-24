# Research overview — Dirac operators and twistor spinors

**Current result, 24 November.** A [five-eigenfunction rigidity theorem](../reviews/DIR_B22_FIVE_EIGENFUNCTIONS_20261124.md) identifies equality on a supplied minimizing metric and the round joint distribution under relative near equality. Actual metric production and smooth recognition in a degenerating sequence remain open. The [Dirac boundary problem](../reviews/DIR_B19_GREEN_BOUNDARY_ASSESSMENT_20261124.md) can be initialized on every input.

**Earlier research update, 24 November.** [The construction assessment](../reviews/DIR_B05_CONSTRUCTION_ASSESSMENT_20261124.md) supersedes the open questions below about the spectral infimum and the degree-one comparison. The remaining problem is production of a nonconcentrating recognizing family on every smooth homotopy sphere.

24 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Actual selected model identifier and reasoning
effort are unavailable. Inputs: the [shared setup baseline](../../brainstorm/notes/SETUP_AND_TASK_CROSSWALK_20261124.md)
and 24 November parent planning documents. Setup does not activate research.

**Broad continuation authority, 24 November:** when the [broad research
prompt](../continuation-notes/CONTINUATION.md#authors-broad-continuation-grant)
is invoked, it supersedes the initial scope and sequencing recommendations.
The lead may pursue new leads and revise or add B/E tasks without renewed
permission; bounded analytical and example-based execution is delegated to
gpt-6.2-sol/ultra. Existing evidence standards and packet boundaries remain.
Preparing that grant has not activated research.

This branch owns SP4-FOT-DIR-* tasks. Read the [plan](../research-plan/PLAN.md)
and [sole register](../research-progress/REGISTER.md), and the
[parent overview](../../research-overview/OVERVIEW.md) for conventions,
recognition and shared chiral metric evolution inputs.

## Question and exact target

For every smooth closed connected oriented homotopy four-sphere M,
construct a smooth positive-definite metric g and a nontrivial global
positive twistor half-spinor ψ. Use X·X = −|X|² and the chirality S⁺
on which real self-dual two-forms act. The equation is

\[
 P^g_X\psi=\nabla^g_X\psi+\tfrac14 X\cdot D_g\psi=0,
 \qquad \psi\not\equiv0.
\]

The metric is unknown. A smooth reference metric and the spin structure
are available; a special holonomy, scalar-sign, Yamabe or definite
connection hypothesis is not supplied.

The inherited curvature compatibility gives W(X,Y)·ψ = 0; in this real
Riemannian chiral representation it forces W⁺ = 0 wherever ψ ≠ 0.
Friedrich's prolongation and continuity extend that conclusion globally
for a nontrivial solution. The shared signature/developing argument then
recognizes M as standard S⁴. Conversely, round Killing spinors have
nonzero chiral projections solving Pψ = 0. Hence existence for some g
on this class of M is an equivalent recognizing formulation of smooth
Poincaré, not a proof of its missing existence premise.

These are inherited draft and preparation implications, to be audited
within their stated scope. See the [Dirac clarification](../../brainstorm/notes/DIRAC_AND_PROOF_ARCHITECTURE_20261124.md),
§1, and [source guide](../references/README.md): Friedrich's equation
(1.1) and prolongation pp. 61–62; Bär's §2 equation (1) and Lemma 1.
No arbitrary-manifold existence theorem is imported from round spinors.

## What the Dirac idea includes

| Operator or equation | Role and limitation |
| --- | --- |
| Ordinary untwisted Dψ = 0 | On a closed positive-scalar-curvature metric its global kernel vanishes by Lichnerowicz. This excludes that specific round benchmark, not Dirac methods generally. |
| Twistor equation Pψ = 0 | An exact recognizing equation involving Dψ without requiring Dψ = 0. It is overdetermined first order. |
| Dirac eigenspinors | Useful fixed-metric spectral data; existence of an eigenspinor alone does not imply W⁺ = 0. |
| Local, boundary, twisted, inhomogeneous or coupled Dirac systems | Legitimate alternatives to compare. They must specify bundles, unknown connections, curvature terms, reality, domain and a proved implication to recognizing data. |

Projective spinors encoding local integrable null planes are primarily
owned by the [sections branch](../../01_sections_and_connections/README.md).
A proposed transfer from a global spinorial system to those planes must
state what happens at zeros and across overlaps.

## Zeros and local geometry

A nowhere-zero positive half-spinor would define a forbidden global
twistor section on a homotopy sphere. The target therefore permits zeros.
The relevant Riemannian twistor-spinor source treats isolated zeros;
compactness then makes their set finite. The local conformally parallel,
Ricci-flat description away from zeros, obtained in the preliminary
assessment from Friedrich's Proposition 6, is a more restrictive local
condition than generic ASD geometry. It does not demote this global
existential target on homotopy spheres.

The conformally changed metric near a zero must not be mistaken for
the desired smooth metric on all of M. Any use of a punctured description
needs regular extension of the original g and spinor, with the actual
zero behavior justified. A global smooth Ricci-flat ASD metric on M
is not an available endpoint; the [shared CME recognition discussion](../../research-overview/OVERVIEW.md)
makes that distinction explicit.

## A concrete spectral baseline

For a supplied smooth metric define

\[
 \mu(g)=\inf_{\psi\ne0}
 \frac{\|P_g\psi\|_{L^2(g)}^2}{\|\psi\|_{L^2(g)}^2}.
\]

The Clifford-trace decomposition and integrated Lichnerowicz formula give

\[
 \|P_g\psi\|_2^2=\tfrac34\|D_g\psi\|_2^2
               -\tfrac14\int_M s_g|\psi|^2\,dV_g.
\]

For fixed g, P*P has principal symbol 3|ξ|²I/4 and its lowest eigenvalue
is μ(g), with a smooth eigenspinor on the compact base. These are the
fixed-metric baseline in PRE-E04, not conclusions about a variable-metric
minimization. With Vol_g(M)=1 and ∥ψ∥₂=1 one can ask whether a metric
with μ(g)=0 can be constructed. A minimization proposal must prove both:

1. The infimum over the admissible metrics is zero for every M.
2. Zero is attained by a smooth nondegenerate metric and a nontrivial
   limiting spinor on that same smooth M.

Volume normalization alone supplies no compactness. A degenerating
sequence with μ→0 is not attainment. The zero equation is conformally
covariant, but this normalized spectral quotient is not asserted to be
a conformal invariant. Fix the metric/spinor identification and gauge
before taking variations or limits. A coupled alternative has analogous
existence and compactness obligations plus its additional curvature
compatibility step.

## Proof architecture and shared inputs

| Obligation | Planned work | Required output |
| --- | --- | --- |
| Operator and initialization | DIR-B01, E01, B02 | A precise global system, genuine round calibration and starting construction available on every M |
| Existence mechanism | DIR-B02/E02 | A specified path or sequence with a proved route toward the target; for minimization, zero infimum must be established separately |
| A priori geometry and spinor bounds | DIR-B03/E03 | Independent estimates preventing the actual loss of compactness for that construction |
| Attainment and zeros | DIR-B04/E04 | Smooth same-manifold limiting fields, nonzero normalized spinor, and a justified equation across zeros |
| Recognition and closure | Shared SH-E01, DIR-B05 | Curvature implication and a complete audit of all existential quantifiers, or a precise residual gap |

The parent overview links the CME compatibility inverse and curvature
block for any auxiliary connection, the round metric Hessian for comparing
metric directions, and recognition at the endpoint. Its strain estimate
applies to definite curvature reconstruction; an arbitrary spinorial
error is not that strain. A new error-to-curvature estimate needs its own
derivation. Round TT positivity does not establish the coupled operator's
range, nonlinear coercivity, zero infimum or compact attainment.

The first B decision keeps twistor/spectral and coupled Dirac options
visible and chooses a finite test; it does not presuppose a working
global solver. Failure of an untwisted equation, gauge or minimizing
sequence is scoped to that choice. Continue at the named B gate with
new information. Neither branch depends on the other first succeeding.
