# Full neck energy accounting · Research plan

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. The serving model variant and reasoning effort are unavailable.

[Route overview and input versions](../research-overview/OVERVIEW.md) · [Route register](../research-progress/REGISTER.md) · [Overall overview 01](../../research-overview/01_OVERVIEW.md) · [Overall plan 01](../../research-plan/01_PLAN.md) · [Program register](../../research-progress/REGISTER.md) · [Verified baseline 01](../../research-progress/01_BASELINE.md)

## Edition 07 · Signed energy on an actual collar

27 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. Actual serving model and reasoning effort were unavailable. The route lead owns the choice of orientation conventions, endpoint inputs and the public theorem type. Freeze these in one dated handoff before assigning the fixed E proof and an independent replay to bounded GPT-6.2 Sol/ultra helpers under the selected lead. Pin the current 08 source and compare to the master readback reviewed from blob `91ca2d3f2dbb06dc3b391186c24c875e5c888aaf`.

| Packet | Source and blueprint label | Planned Lean output |
| --- | --- | --- |
| `FOT-NECK-ED07-E01` | Scientific 08 §3, `thm:ledger`, `prop:EH`, `cor:collar`, and the exact signed-cut deficit. Blueprint `prop:ed07-signed-collar`. | `FirstOrderTwistor/SignedCollarDefect.lean` · `FirstOrderTwistor.signedCollar_defect_of_signature` |

On a supplied smooth oriented Riemannian four-dimensional product collar with both marked faces and real chiral Hilbert–Schmidt energies, parametrize both faces in the increasing normal convention. Put $A_i=12\pi^2\eta(h_i)+\mathcal T_i$, with $\eta$ the APS signature eta in the product-near-boundary normalization and $\mathcal T_i$ the signed pairing of $B^\circ$ with $\operatorname{sym}\operatorname{curl}B^\circ$. With the signed signature ledger and signature zero on the product as explicit inputs, prove $E_+-E_-=A_1-A_0$. Given bounds $\lvert A_i-A_*\rvert\le b_i$ against the same reference, deduce $\lvert E_+-E_-\rvert\le b_0+b_1$ and control of each energy by the other plus that sum. The bounds use actual measured faces. A scale-one marked $C^2$ comparison to the same round quotient on each normalized end window supplies the paper's quadratic errors under its stated hypotheses. An independently bounded combined face defect also suffices. Once the geometric identities are available, isolate the product-metric comparison in the proof of the ledger. With $g_0$ inducing the same tangential metric and unit normal as $g$, the relative Pontryagin integral has the positive correction $\mathcal T/(4\pi^2)$. The analytic APS signature theorem for $g_0$ remains the named external input.

In the same packet use a supplied separating cut with signature zero on each side of a closed oriented homotopy four-sphere, measured additive side energies and common total $e=E_+=E_-$. The oriented ledger gives $D=E_+(V)-E_-(V)$ and $-D$ on the other side. Check the exact finite deficit $e-\lvert D\rvert=E_+(V')+E_-(V)$ when $D\ge0$, and $E_+(V)+E_-(V')$ when $D\le0$. It follows that $e\ge\lvert D\rvert$, so $\lvert D\rvert\ge8\pi^2$ excludes strict entry. At $e=\lvert D\rvert$, the indicated chiral masses vanish. A smooth unique-continuation implication would require its own theorem.

Test orientation reversal, a zero-defect product, the strict entry wall, and the need for data on both ends against the signed Fubini–Study shell. The conformally invariant Hölder estimate uses the symmetric curl. A bound on the full curl requires a specified gauge. The APS signature input is distinct from the Bour Euler boundary term. Pass the pinned public build, public-import `#check` and `#print axioms`, and one test applying the finite bound with all premises visible. If actual face estimates, orientation transport or a source term are unavailable, return the conditional type and the precise missing input to the lead. Route 03 owns capped reassembly and Route 07 owns descent. An accounting use beyond the marked collar requires its own coverage evidence. [08 manuscript](../../../../papers/investigations-1/08_cut_geometry_and_chirality/manuscript/cuts_of_subcritical_conformal_classes.tex) · [Master sign replay and end tests](../../../../papers/master/reviews/SIGNED_BOUNDARY_INDEPENDENT_READING_20261127.md) · [LED cut deficit](../../../../papers/investigations-1/08_cut_geometry_and_chirality/01_chirality_ledger/notes/CUT_THRESHOLDS.md) · [LED neck input audit](../../../../papers/investigations-1/08_cut_geometry_and_chirality/01_chirality_ledger/notes/NECK_TABLE.md)

## Opening proof

**SP4-FORM-FOT-E01 · Finite accounting with a strict residual.** Use a finite index set $J$, base energy $b$, bubble energies $x_j$, and limiting energy $e$. The gaps and equality are inputs to this algebraic task. The proof should also work for an empty family and for additional zero-energy indices. Check why strict residual is needed by allowing one positive bubble to carry all the energy. The proposed public name is `SectionsAndConnections.noPositiveBubbleOfFiniteAccounting` in `formalization/SectionsAndConnections/FiniteAccounting.lean`. Blueprint proposal `lem:finite-bubble-accounting` corresponds to SEC `msgap:strict`, `msgap:accounting` and §15. [Original E01 statement](../../research-plan/01_PLAN.md#first-bounded-proof) · [Manuscript implication](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L6520)

The following type was frozen at setup. The public proof and the [checked edge cases](../research-progress/handoffs/E01_RETURN.md) were integrated on 25 November. The [live register](../research-progress/REGISTER.md) tracks the subsequent geometric sublemmas.

~~~lean
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
open scoped BigOperators

variable {ι : Type*} [DecidableEq ι]
#check (∀ (J : Finset ι) (e b δ : ℝ) (x : ι → ℝ),
  0 < δ → 0 ≤ b → (∀ j ∈ J, 0 ≤ x j) →
  4 * Real.pi ^ 2 ≤ e → e ≤ 8 * Real.pi ^ 2 - δ →
  e = b + (∑ j ∈ J, x j) →
  (b = 0 ∨ 4 * Real.pi ^ 2 < b) →
  (∀ j ∈ J, x j = 0 ∨ 4 * Real.pi ^ 2 < x j) →
  (∀ j ∈ J, 0 < x j → 0 < e - x j) →
  (∀ j ∈ J, x j = 0) ∧ e = b)
~~~

## Decisions and proof order

**FOT-B03** depends on the parent’s FOT-B01. Specify the Lean inputs for a compact gauge on $M$, for smooth comparisons on whole compact truncations, and for control on one annulus. Record the convergence topology, volume form, chirality and quantifier order for each. The compact gauge for E10 is a separate path to recognition when a mark survives. For E11–E13 check the end corrections, removability and equality case in their precise categories. Chang–Qing–Yang's neck theorem uses exact Bach-flatness and additional annular hypotheses. Return a missing regularity or topology lemma to B03 before using it on an almost-critical sequence. [SEC primary source records](../../../../references/SOURCE_NOTES_SEC_20261124.md) · [Annular source records](../../../../references/SOURCE_NOTES_SEC_ANNULAR_20261124.md)

1. **Components and thresholds.** Use parent E02–E04 for norm conversion and recognition. Formalize E09 and the smooth-component chain E11–E13. Derive the qualitative strict residual first. The uniform $\kappa_\delta$ needed in Route 03 has the additional compactness premise for exact critical classes.
2. **Remainder estimates.** E14 and E15 give alternative bounds. B03 should expose the buffered interpolation lemma of E14 as soon as it is checked so Route 04 can use it in E23. E16 takes the limits under whichever estimate is available. E29 tests how far a single supplied smooth end reaches.
3. **Composition.** In E17 split off fixed truncated components first. Bound overlaps and transitions, prove equality by exhaustion, and then apply E01. Keep the possible closed critical value in the conclusion. A countable version needs an explicit tail estimate. If a region lacks a bound, retain the one-sided accounting inequality and name that region in the return to parent E34. [Program endpoint](../../research-overview/01_OVERVIEW.md#the-energy-accounting-theorem) · [Spinor estimates](../../04_dirac_collar_transmission/research-progress/REGISTER.md)

## Geometric declarations

FOT abbreviates `SP4-FORM-FOT`. Each proposed module below lives under `formalization/FirstOrderTwistor/` and each short declaration name belongs to the `FirstOrderTwistor` namespace. Blueprint labels are proposed, except for the chart entries marked existing. The parent plan defines each target in full. [Program source-to-Lean map](../../research-plan/01_PLAN.md#geometric-proof-targets)

| Task | Manuscript or working note | Blueprint label | Proposed module and declaration | Test |
| --- | --- | --- | --- | --- |
| FOT-E09 | `msale:source-euler` | `prop:positive-band-budget` | `Band.lean` · `positiveBandBudget` | Yamabe lower bound and total curvature budget. |
| FOT-E10 | `msgauge:compact`, `msgauge:reverse` | `thm:compact-gauge-recognition` | `CompactGauge.lean` · `roundOfSurvivingMark` | Uniformly elliptic $W^{2,q}$ gauge, $q>2$, and a positive-volume mark. |
| FOT-E11 | `msale:end-count`, `msale:ends` | `thm:smooth-ale-link` | `SmoothComponents.lean` · `oneEndTrivialLink` | All fixed truncations embed. Check one end and trivial link. |
| FOT-E12 | `msale:compact`, `msale:strict-residual` | `prop:compactification-residual` | `SmoothComponents.lean` · `positiveResidualOfNonflat` | Differentiate the ALE end expansion through order five. |
| FOT-E13 | `msgap:closed`, `msgap:minimum` | `thm:closed-bach-gap` | `ClosedGap.lean` · `closedBachFlatEnergyGap` | Include the threshold equality case and the separate compactness input for a uniform gap. |
| FOT-E14 | `msneck:interpolation`, `msneck:annulus` | `thm:one-chart-energy` | `AnnularEnergy.lean` · `oneChartEnergy` | Existing blueprint node. Constants independent of radius ratio. |
| FOT-E15 | `msneck:integrated`, `msneck:neck` | `cor:transverse-field-energy` | `IntrinsicNeck.lean` · `energyOfTransverseField` | Use the supplied transverse field, weight and derivative defect. |
| FOT-E16 | `msneck:no-neck-target` | `cor:supplied-no-neck` | `AnnularLimits.lean` · `noNeckOfSuppliedCharts` | Existing chart node. Intrinsic alternative `cor:intrinsic-no-neck`, declaration `noNeckOfSuppliedField`. |
| FOT-E17 | `msgap:accounting`, §15 | `thm:finite-smooth-accounting` | `Accounting.lean` · `noNonflatBubbleOfCoveredRemainder` | Charge the entire complement before invoking E01. |
| FOT-E29 | `msale:end-decay`, EXTRACT-E04 | `prop:diagonal-ale-end-energy` | `AnnularLimits.lean` · `noNeckOnSuppliedALEEnd` | Keep the freely chosen outer radius in the statement. |

## Acceptance and handoff

E01 goes through the existing `SectionsAndConnections` public library. Geometric declarations use `FirstOrderTwistor` as specified in Plan 01. Freeze the theorem type, imports, exact input revisions, assigned files and failure test before issuing each packet. Build from `formalization/` with `lake build`, run `#check` and `#print axioms` through the public import, and compare the elaborated hypotheses with the cited source. Record the return under this route's `research-progress/handoffs/` and update its register. If the statement needs a stronger hypothesis or a missing geometric theorem, name it and reopen the owning B decision. The integrating lead checks for `sorryAx` and unreviewed project axioms and updates the shared blueprint's statement and proof marks separately upon acceptance. [Proof acceptance](../../../FORMALIZATION_SETUP_WORKFLOW.md#accept-proofs-in-the-pinned-lean-project) · [Shared blueprint](../../../blueprint/src/content.tex) · [Program integration](../../research-progress/REGISTER.md)
