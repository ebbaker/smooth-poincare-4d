# Physical scales and marked annuli · Research plan

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. The serving model and effort for preparation were unavailable. [Overall overview](../../research-overview/03_OVERVIEW.md) · [Program plan](../../research-plan/03_PLAN.md) · [Source revisions and pins](../../research-progress/03_BASELINE.md)

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
