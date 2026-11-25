# Full neck energy accounting · Research plan

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. The serving model variant and reasoning effort are unavailable.

[Route overview and input versions](../research-overview/OVERVIEW.md) · [Route register](../research-progress/REGISTER.md) · [Overall overview 01](../../research-overview/01_OVERVIEW.md) · [Overall plan 01](../../research-plan/01_PLAN.md) · [Program register](../../research-progress/REGISTER.md) · [Verified baseline 01](../../research-progress/01_BASELINE.md)

## Opening proof

**SP4-FORM-FOT-E01 · Finite accounting with a strict residual.** Use a finite index set $J$, base energy $b$, bubble energies $x_j$, and limiting energy $e$. The gaps and equality are inputs to this algebraic task. The proof should also work for an empty family and for additional zero-energy indices. Check why strict residual is needed by allowing one positive bubble to carry all the energy. The proposed public name is `SectionsAndConnections.noPositiveBubbleOfFiniteAccounting` in `formalization/SectionsAndConnections/FiniteAccounting.lean`. Blueprint proposal `lem:finite-bubble-accounting` corresponds to SEC `msgap:strict`, `msgap:accounting` and §15. [Original E01 statement](../../research-plan/01_PLAN.md#first-bounded-proof) · [Manuscript implication](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L6520)

The following type elaborates with the pinned imports. Proof and public declaration are pending.

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
