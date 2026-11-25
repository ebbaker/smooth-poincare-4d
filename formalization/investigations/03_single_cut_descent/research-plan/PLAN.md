# Single spherical cut and descent · Research plan

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. The serving model variant and reasoning effort are unavailable.

[Route overview and input versions](../research-overview/OVERVIEW.md) · [Route register](../research-progress/REGISTER.md) · [Overall overview 01](../../research-overview/01_OVERVIEW.md) · [Overall plan 01](../../research-plan/01_PLAN.md) · [Program register](../../research-progress/REGISTER.md) · [Verified baseline 01](../../research-progress/01_BASELINE.md)

The [dated proof return](../research-progress/handoffs/INTEGRATION_20261125.md) and [next proof packet](../continuation-notes/AFTER_MARKED_DESCENT_20261125.md) update this launch plan.

## Opening proof

**SP4-FORM-CUT-E01 · Strict exterior energy margin.** Isolate the arithmetic in NECK-E02/E05, “One choice of the cut and all margins.” Write $T=4\pi^2$, $x=e_X$, $v$ for the capped exterior energy, and $\eta$ for the combined tail, transfer and splice error. The proposed public declaration `FirstOrderTwistor.exteriorEnergyLtThreshold` in `formalization/FirstOrderTwistor/CutMargin.lean` corresponds to proposed blueprint `lem:strict-exterior-margin`. E26 and E28 must construct the error bound on the physical metric before using this lemma. Check the case $\eta=\delta$ and the loss of strictness if $x=T$ there. [Source inequality](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E02_E05_SAME_TYPE_DESCENT_20261125.md) · [Program E28](../../research-plan/01_PLAN.md#conditional-results-from-the-joint-collar-work)

The following type elaborates with the pinned imports. Proof and public declaration are pending.

~~~lean
import Mathlib.Basic.Real.Basic

#check (∀ (T δ e x η v : ℝ),
  0 < T → 0 < δ → e ≤ 2 * T - δ → T < x →
  0 ≤ η → η ≤ δ → v ≤ e - x + η → v < T)
~~~

## Decisions and proof order

**SP4-FORM-CUT-B01** specifies the boundary data E25 and E28 need from one cut. In the NECK-E03 normal-coordinate example, identify the actual embedded truncation, the parametrization of its boundary $S^3$, the ball attached on each side, the orientation of each gluing map, and the point where the resulting diffeomorphism transports a metric. Draft the corresponding Lean maps and proof obligations for E25. If the data specify only an abstract spherical boundary, keep the two-capped-summand result and name the missing smooth identification. Parent FOT-B05 owns conventions shared with the other routes. [Marked truncation](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E03_EMBEDDED_CUT_20261125.md) · [Reassembly argument](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E02_E05_SAME_TYPE_DESCENT_20261125.md) · [Hatcher and Palais source passages](../../../../references/SOURCE_NOTES_JOINT_COLLAR_20261125.md)

1. **Topology and thresholds (E25).** Prove the two capped sides are homotopy spheres. Apply parent E04 to the actual positively Yamabe capped exterior with $E_+<4\pi^2$. Preserve the boundary parametrization needed to identify the other capped piece. A supplied boundary diffeomorphism of the standard $S^3$ extends across the ball by the component theorem for $\mathrm{Diff}(S^3)$. [Hatcher, R122](../../../../references/SOURCE_NOTES_JOINT_COLLAR_20261125.md) · [Recognition hypotheses](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L178)
2. **Metric estimates (E26).** In a supplied product gauge control the total added Weyl energy by $C_W\eta_2^2$ and the Yamabe constant on each capped piece by $\min\{Y_0,(1-C_Y\eta_2)Y_{\rm rd}\}-C_I\ell^{-3/2}$. State the separate $C^4$ hypothesis for $C_B\eta_4$ Bach cost. Freeze a second packet for weaker data if they suffice for the desired cost. [Two-cap estimates](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E01_TWO_CAP_AUDIT_20261125.md) · [First-order estimates](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E07_FIRST_ORDER_CAP_20261125.md)
3. **Descent (E28).** First choose the buffer length $\ell$, then a fixed sufficiently small normal radius, then a sufficiently large source index. Account for the compactification tail and both metric errors before applying CUT-E01. Compose E25, E26 and Route 02's E11–E13. Return to parent E34 the actual diffeomorphism, the pulled-back positive-Yamabe class, and either the strict or uniform energy decrease justified by the available compactness result. Whole-neck energy equality is unnecessary for this composition. [Descent proof](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E02_E05_SAME_TYPE_DESCENT_20261125.md) · [Component dependencies](../../02_neck_energy_accounting/research-progress/REGISTER.md)

Once the one-cut theorem is checked, use the same boundary data to state the finite-puncture transfer and near-minimizer nonsplitting corollaries. Each needs a separate comparison or summation argument. If a candidate cut has a quotient link, use the closed exact-product replacement test of NECK-E08 only under its own energy bound. A small-energy annular block selected between two quantiles still needs a measured chart whose middle slice separates those masses. [Finite punctures](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E09_FINITE_PUNCTURE_TRANSFER_20261125.md) · [Nonsplitting](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E10_NONSPLITTING_MINIMIZERS_20261125.md) · [Balanced-block selection](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E11_BALANCED_BLOCK_AND_NONCOLLAPSE_20261125.md)

## Geometric declarations

FOT abbreviates `SP4-FORM-FOT`. Each proposed module below lives under `formalization/FirstOrderTwistor/` and each short declaration name belongs to the `FirstOrderTwistor` namespace. Blueprint labels are proposed. The parent plan defines each target in full. [Program source-to-Lean map](../../research-plan/01_PLAN.md#geometric-proof-targets)

| Task | Manuscript or working note | Blueprint label | Proposed module and declaration | Test |
| --- | --- | --- | --- | --- |
| FOT-E25 | SEC `prop:recognition`, NECK-E03 marking | `prop:capped-exterior-recognition` | `SphericalCut.lean` · `originalTypeOfRecognizedExterior` | Export the marked diffeomorphism. |
| FOT-E26 | NECK-E01 cost estimates, DIR `prop:budget` | `prop:supplied-cap-costs` | `CapEstimates.lean` · `costsOfSuppliedSphericalCut` | Quantify scale-independent costs and orientation on both sides. |
| FOT-E28 | SEC `msale:compact`, `msgap:uniform-residual`, NECK-E02/E05 | `thm:one-cut-same-type-descent` | `SphericalCut.lean` · `lowerEnergyOnOriginalType` | Use the original smooth type and the proper order of choices. |

## Acceptance and handoff

Use the `FirstOrderTwistor` library in the shared Lake package on integration. The integrator for the first such packet adds the library to the default build and coordinates public imports with the other routes. A single lead can perform both roles. Freeze the theorem type, imports, exact input revisions, assigned files and failure test before issuing each packet. Build from `formalization/` with `lake build`, run `#check` and `#print axioms` through the public import, and compare the elaborated hypotheses with the cited source. Record the return under this route's `research-progress/handoffs/` and update its register. If the statement needs a stronger hypothesis or a missing geometric theorem, name it and reopen the owning B decision. The integrating lead checks for `sorryAx` and unreviewed project axioms and updates the shared blueprint's statement and proof marks separately upon acceptance. [Proof acceptance](../../../FORMALIZATION_SETUP_WORKFLOW.md#accept-proofs-in-the-pinned-lean-project) · [Shared blueprint](../../../blueprint/src/content.tex) · [Program integration](../../research-progress/REGISTER.md)
