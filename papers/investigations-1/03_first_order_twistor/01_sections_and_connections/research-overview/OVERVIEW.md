# Research overview — Sections and connections

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

This branch owns SP4-FOT-SEC-* tasks. Read the [plan](../research-plan/PLAN.md)
and [sole register](../research-progress/REGISTER.md), together with the
[parent overview](../../research-overview/OVERVIEW.md) for the common
recognition theorem, chiral conventions and CME manuscript dependencies.

## Question and exact target

For every smooth closed connected oriented homotopy four-sphere M,
construct a smooth positive-definite conformal metric with W⁺ = 0 using
local integrable twistor sections or independent metric/connection fields.
The unresolved issue is compatible global geometry. Choosing a flat
metric separately on each coordinate ball does not supply that geometry.

For a supplied metric g, seek a finite cover U_a and, on each patch,
three positive g-orthogonal almost complex structures J_ai. Require
J_ai ≠ ±J_aj pointwise for i ≠ j and involutivity of each complex null
plane D_ai = T^{0,1}_{J_ai}. The shared draft's three-direction criterion
then gives W⁺ = 0: each direction and its antipode supply Weyl-quartic
roots, exceeding the degree unless the quartic vanishes. Its converse
uses local sections in the integrable AHS twistor space.

This is an inherited exact local criterion, not an existence theorem for
the unknown metric. The conformal metric must agree on overlaps;
auxiliary local directions need not. A finite cover can be refined to
obtain quantitative separation where needed. No global almost complex
structure or two-chart stereographic atlas is assumed. See the
[shared manuscript](../../manuscript/first_order_twistor_and_smooth_poincare.tex),
labels prop:three-directions and sec:local-sections; the [source guide](../references/README.md)
records AHS Theorem 4.1 and the null-plane/quartic dependencies.

## Independent fields and projective spinors

Fix E = Λ⁺ of a reference metric as a genuine oriented rank-three
Euclidean bundle. A positive normalized E-valued two-form Σ obeys,
in local orthonormal E-frames,

\[
 \Sigma_i\wedge\Sigma_j=2\delta_{ij}\nu,\qquad \nu>0.
\]

This determines a Riemannian metric with volume ν. Let A be an independent
SO(3) connection and define

\[
 C_{ij}\nu=-\tfrac12F_A^i\wedge\Sigma_j,\qquad
 d_A\Sigma=0,\quad C_0=0.
\]

Compatibility identifies A with Γ⁺_g; then C = W⁺ + sI/12 is symmetric,
so the second equation is exactly W⁺ = 0. Here C₀ is the full trace-free
matrix; using Sym₀ C in a residual is equivalent at compatibility, but
the off-solution constraint and range must be analyzed. The opposite
Ricci block is unrestricted. Unlike the source's curvature-reconstructed
definite connection, these independent fields do not require F_A to span
Λ⁺, and compatibility alone does not impose Einstein geometry.

The [parent CME comparison](../../research-overview/OVERVIEW.md#shared-foundations-from-chiral-metric-evolution)
supplies the compatibility inverse and curvature convention. First order
in independent Σ,A becomes the second-order ASD metric equation when A
is eliminated; this does not by itself give an elliptic solvable system.

The equivalent local projective-spinor encoding is
D_π = S⁻ ⊗ Cπ and (∇⁺_Xπ) ∧ π = 0 for X in D_π. Local spin lifts,
projective rescaling and overlap transition laws must be retained. This
branch owns that encoding of sections. A global twistor-spinor construction
belongs to the [sibling](../../02_dirac_and_twistor_spinors/README.md).

## Candidate construction mechanisms

The default first comparison is between a global mixed continuity
problem and a nonvacuous local correction problem; neither is selected
as a valid solver by setup.

From an arbitrary reference metric, u₀ = (Σ₀,Γ⁺₀) is available without
definite curvature. One proposed residual and forcing path are

\[
 \Phi(\Sigma,A)=(d_A\Sigma,\operatorname{Sym}_0 C),\qquad
 \Phi(u_t)=(1-t)\Phi(u_0),\quad 0\le t\le1.
\]

The target bundles, normalization, gauge, algebraic constraints and
forcing identifications must first be fixed. The linearized range may
already obstruct this path. A successful continuity proof needs a
nonempty parameter set, an appropriate openness statement and closedness
through smooth positive limits on the same M.

For an overlap correction instead, prescribe the actual allowable
perturbations, retained data and boundary/support conditions. Resetting
everything to round data is a vacuous test. Conversely, arbitrary
non-conformally-flat ASD germs cannot be preserved inside an ASD metric
on a homotopy sphere, because exact recognition makes that metric
conformally flat. The desired data class therefore needs a consequential
B decision before a correction lemma is meaningful.

## Quantitative diagnostic

The [preliminary assessment](../../brainstorm/notes/PRELIMINARY_ASSESSMENT_20261123.md),
§4, proposes a bound for three uniformly separated directions. With
P = (I+iJ)/2, Q = I−P and Frobenius tensor F(X,Y) = Q[PX,PY],

\[
 |W^+|^2\le C_\varepsilon\sum_{i=1}^3
 \bigl(|\nabla F_i|^2+|\nabla J_i|^2|F_i|^2\bigr).
\]

This is a provisional smooth differential estimate requiring audit,
including the torsion term in the adapted-connection calculation.
The exact orthogonal algebra benchmark and the counterexample to a
bound by undifferentiated F alone have only their recorded finite scope.
A weighted finite cover could convert a valid estimate into E₊ control
for a common global g. The estimate supplies no defect-reducing mechanism
and no positive Yamabe bound.

## How the program could prove the conjecture

| Obligation | Planned work | What must actually be established |
| --- | --- | --- |
| Initialization | SEC-B01/B02, with arbitrary reference data | Allowed global bundles and starting fields exist for every M without a round or definite premise |
| Solvability | SEC-E02, B02, E03 | The chosen gauge, range and nonlinear correction/continuation statement hold for the data needed by the construction |
| Global estimates | SEC-B03/E04 | Bounds derived from the starting data prevent loss of positivity and control the relevant fields; round smallness is not an assumed global input |
| Compactness and endpoint | SEC-B04/E05 | Smooth nondegenerate completion on the same smooth M, with compatible conformal data and all target equations |
| Recognition and closure | Shared SH-E01 and SEC-B05 | Exact W⁺ = 0, or independently proved Y > 0 and E₊ < 4π², with every existence premise discharged |

The finite tasks test these obligations one at a time. Additional bounded
packets may be needed; completion of one estimate does not discharge a
whole phase. Estimates may depend on M and reference data but must apply
to each M. Concentration, collapse, loss of direction separation and
cokernel obstructions are possibilities to analyze for the actual scheme,
not phenomena ruled out by notation.

The round Hessian and deformation complex are calibration inputs only.
Their TT kernel control supplies neither an arbitrary-metric inverse nor
a boundary theorem. Failed gauges or estimates return to the named B
decision and preserve the tested scope. No global result is claimed at setup.
