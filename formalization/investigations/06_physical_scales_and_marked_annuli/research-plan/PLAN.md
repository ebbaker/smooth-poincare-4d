# Physical scales and marked annuli · Research plan

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. The serving model and effort for preparation were unavailable. [Overall overview](../../research-overview/03_OVERVIEW.md) · [Program plan](../../research-plan/03_PLAN.md) · [Source revisions and pins](../../research-progress/03_BASELINE.md)

## Edition 04 · The physical comparison window and an actual marked band

26 November 2026 (America/New_York). Plans and assignments at setup. [Edition 04 overview](../../research-overview/04_OVERVIEW.md) · [Program plan](../../research-plan/04_PLAN.md) · [Baseline and pins](../../research-progress/04_BASELINE.md)

| Task | Supplying geometry and proposed result | Acceptance on activation |
| --- | --- | --- |
| SCALE-B04 | On the original volume-one Yamabe sequence select one scale $a_i\ll\rho_i\ll b_i$ between the actual attaining inner ball and the complete median exterior. Freeze the full buffered band, volume bound, rescaled pointwise curvature bound, vanishing integral of full curvature, and full radial defect at this same scale. [Physical window, `prop:protected-physical-window`](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/physical_window.tex) | Keep the radial defect and pointwise curvature controls as separate premises. Give the measured guard widths and identify which hypotheses come from the selected sequence. |
| SCALE-E07 | Proposed `SmoothPoincare/PhysicalScales/BufferedPhysicalWindow.lean`, `exists_properMarkedPhysicalWindow`. From the frozen buffered hypotheses construct a proper flat limit with a radial function and oriented smooth source embeddings. [Radial placement interface](../../../SmoothPoincare/PhysicalScales/AnchoredShell.lean) · [Master `prop:critical-annulus`](../../../../papers/master/manuscript/critical_annulus.tex) | Verify metric and radial convergence in the stated topologies and inverse control with full source-strip coverage before restricting to a component. Apply the same-scale defect and buffer estimates to put both complete charged marks off the closed trim. Return the actual marking and metric estimates to Route 03 for the cut and Route 05 for any splice estimate. |
| SCALE-E08 | Proposed `SmoothPoincare/PhysicalScales/MarkedPrefixBand.lean`, `markedPrefixBand_geometricBounds`. On a supplied smooth product band through the actual intermediate prefix identified by Route 09, package the metric there, a positive lower scalar bound $\rho$, the intrinsic within-band distance $d$ between both ends, and optional infima of both outward boundary means. [Surgery `prop:band` and `prop:slice`](../../../../papers/investigations-1/05_collar_deformation_and_surgery/02_handle_isolation_and_marked_surgery/manuscript/recognition_from_marked_handle_cuts.tex) | Check the slice and inverse marking on the original metric carrier. Hand the measured geometric data to [Route 10](../../10_positive_scalar_intermediate_cuts/research-plan/PLAN.md) for the inclusive width or strict two-end recognition test. A cut in an auxiliary handle order needs its own physical identification. |
| SCALE-E06, carried | The modified-flow alternative uses the E43 fixed-time transfer and noncompactness on actual solutions at their own first attaining scale. [Supplying modified flow](../../../../papers/master/01_fixed_type_variational_descent/manuscript/modified_ball_charge.tex) · [Public terminal comparison](../../../SmoothPoincare/PhysicalScales/PointedTerminalBuffer.lean) | Further passage to a flow requires one common positive-time limiting solution with comparison maps on compact spacetime intervals, or a usable comparison on the original smooth type. Keep the modified limits and the original physical quantile annulus in their supplying gauges. |

## First bounded proof

Start VAR-E05 with `SmoothPoincare.exists_annulusMass_le_average` in `SmoothPoincare/PhysicalScales/Quantiles.lean`. For disjoint physical annuli, use their full curvature integrals as $m_j$. The arithmetic step has the following Lean type.

~~~lean
import SmoothPoincare
open scoped BigOperators

#check (∀ (n : ℕ) (m : Fin n → ℝ) (C : ℝ), 0 < n →
  (∀ j, 0 ≤ m j) → (∑ j, m j) ≤ C →
  ∃ j, m j ≤ C / (n : ℝ))
~~~

Test $n=1$, equal masses, and a family containing a zero. A positive cardinality is essential. The subsequent measured corollary must derive the sum bound from disjointness and integration on a common source. For the separated sequence the number of admissible annuli grows at fixed log width. [Paragraph following `cor:energy-radius`](../../../../papers/master/manuscript/complete_limits.tex) · [Blueprint `lem:master-quantiles`](../../../blueprint/src/master_variational.tex)

## Decisions and later proofs

All file paths in the table are relative to `SmoothPoincare/PhysicalScales/`. Names are proposed declarations under `SmoothPoincare`.

| Task | Target and mathematical dependency | Acceptance and reason to revisit |
| --- | --- | --- |
| SCALE-B01 | Specify physical balls, the two finite measures, ball-mass continuity and attainment. | Check the same-center exterior statement and the order of the two diffuse limits. If distance spheres have mass in a more general model, identify the extra hypothesis before applying the result. |
| VAR-E05 | `Quantiles.lean`, `chiralQuantileAlternatives`. Extend the finite lemma to `lem:master-quantiles`. | Obtain either the inner ball, full exterior and low-energy annulus, or the diffuse conclusion on the selected sequence. Identify the compact smooth-source hypotheses that yield continuity and attaining centers. |
| SCALE-B02 | Match the neck investigation's physical selection to `prop:critical-annulus` and blueprint `prop:master-harmonic-annulus`. | Record a single oriented embedding of the enlarged shell, both protected charged sets outside the closed trim, metric distortion, full curvature and exact or approximate harmonicity. If any is missing, record the precise geometric question. Route 03 owns the analytic implication CUT-E05. |
| VAR-B03 | Audit the complete shrinking limit, whole marked base and closed-attainment alternatives. | Freeze compactness, regularity, orientation, end topology, removal and the strict end residual separately. Use Route 05's VAR-E04 and Route 03's end cut where needed. |
| VAR-E07 | `CompleteLimits.lean`, `flatOfCompleteMarkedLimit` and `vanishingOnPeakScaleBalls`. Sources `cor:whole-base`, `thm:complete-limit` and `cor:energy-radius`. Blueprint `thm:master-complete-limit`. | On smooth marked exhaustions prove the applicable limit statement. For diverging $K_i=\max_M\lvert\mathrm{Rm}_{g_i}\rvert$, take the supremum over centers for each fixed multiple of $1/\sqrt{K_i}$. A point of maximum curvature supplies no lower bound for integrated mass. |
| VAR-E08 | `RicciScales.lean`, `vanishingOnRicciControlledWindows`. Sources `lem:ricci-radius` and `thm:ricci-scale`. Blueprint `prop:master-ricci-scale`. | Use one finite $p>2$ and bounds on $a_i^{2-4/p}\lVert\mathrm{Ric}_{0,g_i}\rVert_{L^p(B(x_i,D a_i))}$ for every fixed $D$ on the same subsequence. Return the bounded global case as smooth closed attainment. Reopen B03 for a critical $p=2$ claim. |

[Local replacement and whole base](../../../../papers/master/manuscript/variational_comparison.tex) · [Complete limits](../../../../papers/master/manuscript/complete_limits.tex) · [Ricci scale](../../../../papers/master/manuscript/ricci_scales.tex)

For acceptance, build the pinned package, check the new declaration and its axioms through `import SmoothPoincare`, compare its exact premises with the blueprint, and record the return in the [sole route register](../research-progress/REGISTER.md). [Formalization workflow](../../../FORMALIZATION_SETUP_WORKFLOW.md)
