# Research overview — First-order twistor constructions

24 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Actual selected model identifier and reasoning
effort are unavailable. This is authorized research setup, not research
activation or a new proof audit. The [input and ownership record](../brainstorm/notes/SETUP_AND_TASK_CROSSWALK_20261124.md)
pins the scientific inputs. The [parent register](../research-progress/REGISTER.md)
owns shared tasks and earlier preparation; each child owns its own tasks.

## Objective and the two proposals

For every smooth closed connected homotopy four-sphere M, construct a
smooth positive-definite Riemannian conformal structure with W⁺ = 0.
This would prove the smooth four-dimensional Poincaré conjecture by the
recognition argument below. The construction is unresolved. Equivalent
first-order formulations identify targets without establishing existence.

| Sub-investigation | Construction question | Exact recognizing output |
| --- | --- | --- |
| [01 — Sections and connections](../01_sections_and_connections/README.md) | Can compatible local twistor directions, or independent metric and connection fields, be constructed globally? | One global conformal metric supporting local triples of integrable directions, or a solution of the mixed compatibility and curvature equations |
| [02 — Dirac and twistor spinors](../02_dirac_and_twistor_spinors/README.md) | Can a variable metric and spinorial equation produce a nontrivial recognizing spinor? | A nonzero global chiral twistor spinor, or a precisely specified coupled Dirac solution with a proved implication to the required geometry |

These are parallel research proposals. Neither depends on the other
succeeding. Their common recognition, conventions and comparison tasks
belong here. Projective spinors encoding individual local null planes
belong primarily to the sections branch; global twistor spinors and
coupled Dirac existence belong to the spinorial branch. Cross-branch
reuse is by links and explicit hypotheses. The existing [shared manuscript](../manuscript/first_order_twistor_and_smooth_poincare.tex)
remains canonical; setup creates no child manuscripts.

## Fixed setting and available starting data

Choose an orientation. Use Z_g = S(Λ⁺_g) and call W⁺ = 0 anti-self-dual
(ASD) in this convention. M has χ = 2, τ = 0, H²(M; Z) = 0, and a
spin structure; it is simply connected. A smooth reference Riemannian
metric, its chiral connection, and a finite coordinate cover are
available. A round atlas, two stereographic coordinate balls, a positive
Yamabe conformal class, a definite curvature connection, and an ASD
metric are not supplied on an arbitrary M.

All initial formulations concern smooth real Riemannian data. Low
regularity spaces and passage to smooth limits must be specified in
future packets. Complexified tangent spaces and spinors describe these
real data; they do not replace the reality or positive-definiteness
conditions. A global almost complex structure on M is impossible:
c₁² = 2χ + 3τ = 4 contradicts H² = 0. Local twistor sections are
therefore essential, and zeros of a global chiral spinor must be allowed.
Do not trivialize Λ⁺ globally by three ordinary two-forms.

Use the curvature-operator Hilbert–Schmidt norm and

\[
 E_\pm(g)=\int_M |W_g^\pm|_{\mathrm{op,HS}}^2\,dV_g,
 \qquad E_+-E_-=12\pi^2\tau(M)=0.
\]

The squared full four-index norm of each Weyl block is four times this
squared operator norm. The round calibration has sectional curvature
K > 0, s = 12K and F_Γ = −KΣ. Set K = 1 only in packets that say so.
For the chiral connection, use the internal pairing δ = −2 tr in the
spin representation and bracket [T_i,T_j] = ε_ijk T_k; two-form norms
count each unordered pair of base indices once. Fine's printed negative
Killing pairing is twice this pairing, as recorded in the CME inputs.
For spinors take X·X = −|X|² and S⁺ to be the half-spin bundle on which
real self-dual two-forms act. Source conventions must be translated.

## The complete proof target

The exact route is

\[
 \text{arbitrary }M
 \xrightarrow{\text{global construction, unresolved}}
 (g,\text{recognizing data})
 \Longrightarrow W_g^+=0
 \Longrightarrow W_g^-=0
 \Longrightarrow M\cong_{\mathrm{diff}}S^4.
\]

The signature formula gives the second curvature vanishing. Weyl-flatness
gives local conformal flatness; simple connectivity gives a conformal
developing map M → S⁴. Compactness makes it a covering, and the simply
connected target makes it a diffeomorphism. No positive Yamabe hypothesis
is needed in this exact chain. See the companion manuscript's
`thm:ctx-ASD-sphere` and the [canonical signature/developing records](../../../../references/SOURCE_NOTES_BACH_FLOW_20261123.md#inherited-background-and-recognition)
(Hirzebruch, Kuiper, and Schoen–Yau).

There is also a sufficient approximate endpoint:
Y(M,[g]) > 0 and E₊(g) < 4π². Then the signature identity gives
∫|W|²_tensor = 8E₊ < 16π²χ(M), so Chang–Gursky–Yang's Theorem A
recognizes the sphere. Its positive conformal-class Yamabe hypothesis
and strict inequality are indispensable. This is an optional endpoint
for a construction, not a way to infer Yamabe positivity or defect
reduction. [Primary theorem and norm convention](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf),
Theorem A and Remarks 1–2, p. 107; [inspection record](../brainstorm/notes/PRELIMINARY_ASSESSMENT_20261123.md#7-selected-primary-source-inspection-record).

Each child plan therefore names initialization, local solvability,
global estimates, compactness or attainment, and endpoint recognition.
Bounds may depend on M and its reference data, but must apply to every
M without assuming its standard smooth type. A round model calculation
tests a mechanism; it does not fulfill this quantifier.

## Shared foundations from chiral metric evolution

The [chiral metric evolution manuscript](../../01_chiral_metric_evolution/manuscript/chiral_curvature_and_metric_evolution.tex)
is a substantive shared input. The table uses its stable TeX labels;
the [24 November input record](../brainstorm/notes/SETUP_AND_TASK_CROSSWALK_20261124.md)
identifies the exact file and passages read. Its [23 November review disposition](../../01_chiral_metric_evolution/reviews/FINAL_REVIEW_CHECKPOINT_DISPOSITION_20261123.md)
states the inherited assessment limits and author-requested pause. This
setup does not resume that investigation or certify its entire manuscript.

| Manuscript passage | Reusable input and hypotheses | Use here and limit |
| --- | --- | --- |
| `rec:compatibility`, `rec:compatibility-equivalence` | For a normalized positive self-dual frame, the pointwise map ℂb = *[b,Σ] satisfies ℂ² + ℂ − 2I = 0 and ℂ⁻¹ = (ℂ + I)/2. Hence d_AΣ = 0 identifies A with the corresponding chiral Levi–Civita connection. | Supplies the mixed system's compatibility equation and an exact connection-difference diagnostic for either branch. In the source's curvature-reconstructed setting F_A is self-dual by construction, so compatibility additionally forces Einstein geometry. An independent Σ need not have that extra property; compatibility alone there does not force Einstein. |
| `rec:chiral-curvature`, `rec:Ricci-beta` | F_Γ = −(W⁺ + sI/12)Σ − B_RicΣ⁻, with ‖B_Ric‖² = ‖Ric₀‖²/4 in the stated oriented frame and internal pairing. | Fixes signs and the curvature block that the mixed equations or spinorial compatibility must control. The identity is local Riemannian algebra; the source's nearby definite reconstruction requires its additional definiteness assumptions. |
| `prop:transport-curvature`, `transport:curvature-block` | On a smooth definite slice in the round-compatible sign, with Q > 0, tr Q = 3, q = Q − I and the source's intrinsic strain T, the displayed estimate below controls positive chiral curvature. | A model for the derivative of a first-order defect controlling curvature. It cannot be substituted directly for a Frobenius defect or arbitrary spinor error, and it does not bound W⁻ pointwise. |
| `sec:metric-hessian`, `metric:D-factorization`, `metric:Hessian-pair`, `metric:TT-gap` | On round S⁴, K > 0, L = ∇*∇, and transverse-traceless metric variations, D = (W⁺)′ satisfies D*D = (L + 2K)(L + 4K)/16; Hess E₊ is twice this; L ≥ 8K. | Common calibration for metric, projective, mixed and spinorial linearizations after the actual gauge and auxiliary fields are accounted for. It controls the TT kernel, not the cokernel of a proposed correction map or its boundary problem. |
| `thm:ctx-ASD-sphere`, `cor:static-transport-sphere` | Exact ASD recognition on a smooth homotopy sphere; a separate sufficient static criterion for a supplied definite connection using the CGY theorem. | Shared endpoint implications. Neither constructs data on an arbitrary M. The exact recognition statement requires no Einstein or scalar-sign assumption. |
| `subsec:real-transport`, `sec:c0-twistor-limits` | Real whole-fiber transport comparison uses the vertical O(2) bundle. Later metric twistor compactness results explicitly supply taming and geometric hypotheses. | A source of diagnostic variables and conditional compactness comparisons. Off-integrable holomorphic O(1) charts, taming, and noncollapse are not automatic inputs for either child. |

For the definite-connection strain comparison, the actual bound is

\[
 \left(|W^+|_{\rm op,HS}^2+\tfrac14|\mathrm{Ric}_0|^2
       +\tfrac1{48}(s-12K)^2\right)^{1/2}
 \le K|q|+6|\nabla^AT|+(42+8\sqrt3)|T|^2.
\]

All norms use the reconstructed metric. Uniformity over positive Q in
this pointwise estimate supplies neither uniform geometry nor a global
bound on ∇T. Fine's independent-connection flow and the metric Weyl-energy
gradient also have different orders; their round comparison is not a
nonlinear identification. The [Fine and related source record](../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md)
and [real twistor record](../../../../references/SOURCE_NOTES_CME_REAL_TWISTOR_20261122.md)
retain the primary-source hypotheses. Connection-defined almost complex
structures must not be identified with the metric AHS structure without
the required compatibility.

## Inherited first-order evidence

The [first-order manuscript](../manuscript/first_order_twistor_and_smooth_poincare.tex)
contains the three-direction criterion (`prop:three-directions`), local
projective Frobenius equation (`eq:projective-frobenius`), twistor-spinor
equation (`eq:twistor-spinor`), and independent mixed equations
(`eq:chiral-first-order`). These retain their draft status. Primary
dependencies include AHS Theorem 4.1, Gover–Hill–Nurowski's null-plane
and quartic calculations, and Friedrich's twistor prolongation; the
[reference guide](../references/README.md) identifies their checked passages.

The [preliminary assessment](../brainstorm/notes/PRELIMINARY_ASSESSMENT_20261123.md)
contains a checked finite algebraic reconstruction benchmark, a scoped
counterexample to an undifferentiated pointwise defect bound, and a
provisional differential Frobenius estimate requiring audit. The
[Dirac clarification](../brainstorm/notes/DIRAC_AND_PROOF_ARCHITECTURE_20261124.md)
restores the full spinorial proposal, checks its round benchmark and
energy identity, and names the missing global existence obligations.
None of these preparation notes establishes a global construction,
compactness theorem, or independently reviewed proof.

The spinorial proposal remains fully represented. Ordinary untwisted
Dψ = 0 has no nonzero global solutions on a closed positive-scalar-curvature
metric, including the round model; this excludes only that equation in
that setting. The twistor equation Pψ = 0 does not require Dψ = 0.
Local, boundary, eigenvalue, twisted and coupled Dirac methods remain
options, provided their output has a proved recognizing implication.

## Ownership and next research boundary

The [shared plan](../research-plan/PLAN.md) freezes common conventions
before branch execution and later compares actual evidence. The
[sections plan](../01_sections_and_connections/research-plan/PLAN.md)
and [spinorial plan](../02_dirac_and_twistor_spinors/research-plan/PLAN.md)
own their distinct construction programs. The [dated crosswalk](../brainstorm/notes/SETUP_AND_TASK_CROSSWALK_20261124.md)
preserves completed preparation identities and maps earlier unissued
outline IDs. Setup is complete; scientific tasks remain unactivated.

The author's 24 November **broad continuation grants** in the
[sections continuation](../01_sections_and_connections/continuation-notes/CONTINUATION.md)
and [spinorial continuation](../02_dirac_and_twistor_spinors/continuation-notes/CONTINUATION.md)
supersede initial scope and sequencing recommendations when invoked.
They authorize new leads, alternative approaches and revised or new B/E
tasks connected to the selected question, with all bounded analytical and
example-based execution delegated to gpt-6.2-sol/ultra. This includes necessary
shared work; the lead preserves task ownership, packet bounds and scientific
hypotheses. Preparing the grants has not activated any research task.
