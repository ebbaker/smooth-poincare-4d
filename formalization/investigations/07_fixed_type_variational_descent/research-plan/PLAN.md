# Fixed-type variational descent · Research plan

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. The serving model and effort for preparation were unavailable. [Overall overview](../../research-overview/03_OVERVIEW.md) · [Program plan](../../research-plan/03_PLAN.md) · [Source revisions and pins](../../research-progress/03_BASELINE.md)

## First bounded proof

VAR-E06 starts in `SmoothPoincare/Variational/RepairResidual.lean` with `SmoothPoincare.energyBoundOfRepairFamily`. Reindex a chosen subsequence by the natural numbers after fixing the tolerance. The scalar statement is given below.

~~~lean
import SmoothPoincare
open Filter

#check (∀ (e cost rem : ℕ → ℝ) (N : ℕ → ℕ) (K : ℕ) (I b ω : ℝ),
  Tendsto e atTop (nhds I) →
  (∀ᶠ i in atTop, N i ≤ K ∧ I ≤ e i ∧
    e i ≤ (N i : ℝ) * (e i - I) + cost i + rem i) →
  (∀ ε : ℝ, 0 < ε →
    ∀ᶠ i in atTop, cost i ≤ b + ε ∧ rem i ≤ ω + ε) →
  I ≤ b + ω)
~~~

Here `cost` bounds the summed surcharge relative to the raw exterior. The term `rem` bounds the entire uncovered chiral energy. Bounded `N` and $e_i\to I$ imply $N_i(e_i-I)\to0$. In the geometric corollary derive the displayed inequality from VAR-E01 on actual positive competitors, null boundaries and a full union/complement estimate. An upper bound on uncovered volume requires a chiral absolute-continuity modulus or a separate energy bound. Test an empty repair family and a family with fixed positive residual. [Source `cor:vol-reduction`](../../../../papers/master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex) · [Blueprint `cor:master-repair-residual`](../../../blueprint/src/master_variational.tex)

## Decisions and later proofs

| Task | Proposed output and source | Acceptance and reason to revisit |
| --- | --- | --- |
| VAR-E06 | Scalar limit and its finite-family geometric corollary under `import SmoothPoincare`. | The scalar target can begin immediately. For the geometric case use VAR-E01 and charge escape, nonregular mass and any excluded atoms from `prop:joint-vol`. Then take the tolerance to zero. |
| DESC-B01 | Specify a joint marked region, its boundary maps and an admissible replacement metric. Source `prop:replacement` for the single-competitor principle and the descent branch's B01. | Split the true incoming mass, replacement, matching cost and any change outside the region. If only individual balls are controlled, apply VAR-E06 instead. |
| DESC-E01 | `SmoothPoincare/Variational/JointDescent.lean`, `SmoothPoincare.excludesStrictJointCompetitor`. Blueprint `prop:routes-joint-descent`. | Use `geometricEnergy_mem_of_pullback` or direct membership on $M$. A gain greater than $e_i-I$ yields contradiction. Test the equality boundary, where strict improvement can fail. Deriving that gain for a candidate needs B01 and an actual marked comparison. |
| DESC-B02 | For `cor:whole-base` choose the relevant closed or round alternative. | For closed attainment specify a transverse variation yielding strict decrease or a rigidity input. For a round restart specify the same-type exit, a bounded-below secondary quantity and its loss. A same-energy return reopens the decision. |
| DESC-E02 | Proposed `SmoothPoincare/Variational/Restart.lean`, `SmoothPoincare.finiteRestartsOfUniformDrop`, applied to `problem:master-realization`. | After B02, a uniform drop $\eta>0$ of a bounded-below quantity bounds the number of successive returns. Verify the quantity on each actual marked restart before using the finite arithmetic. |

[Measured regions](../../../../papers/master/manuscript/physical_volume.tex) · [Whole base and local comparison](../../../../papers/master/manuscript/variational_comparison.tex) · [Descent research register](../../../../papers/master/01_fixed_type_variational_descent/research-progress/REGISTER.md)

For acceptance, build the pinned package, check the new declaration and its axioms through `import SmoothPoincare`, compare its exact premises with the blueprint, and record the return in the [sole route register](../research-progress/REGISTER.md). [Formalization workflow](../../../FORMALIZATION_SETUP_WORKFLOW.md)
