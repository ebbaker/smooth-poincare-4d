import Mathlib.Analysis.Real.Sqrt
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

/-!
# Scalar budgets for a source and a smooth component

The real-valued inputs use the sections and connections manuscript's positive chiral
Hilbert–Schmidt energy, and its four-index tensor norm for full curvature. The source Euler
and curvature identities, Yamabe comparisons and ALE Ricci inputs appear as hypotheses.
-/

namespace FirstOrderTwistor

/-- The round four-sphere Yamabe constant in SEC. -/
noncomputable def roundYamabeConstant : ℝ := 8 * Real.sqrt 6 * Real.pi

theorem roundYamabeConstant_pos : 0 < roundYamabeConstant :=
  mul_pos (mul_pos (by norm_num) (Real.sqrt_pos.2 (by norm_num))) Real.pi_pos

theorem roundYamabeConstant_sq : roundYamabeConstant ^ 2 = 384 * Real.pi ^ 2 := by
  calc
    roundYamabeConstant ^ 2 = 64 * (Real.sqrt 6) ^ 2 * Real.pi ^ 2 := by
      unfold roundYamabeConstant
      ring
    _ = 384 * Real.pi ^ 2 := by
      rw [Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 6)]
      ring

/-- The scalar conclusions of SEC `msale:source-euler` from the normalized Euler
identity and the round Yamabe upper bound. -/
theorem sourceBandScalarBudget (E D Y δ : ℝ) (hδ : 0 < δ)
    (hE : E ≤ 8 * Real.pi ^ 2 - δ) (hD : 0 ≤ D) (hY : 0 ≤ Y)
    (hRound : Y ≤ roundYamabeConstant)
    (hEuler : Y ^ 2 = 48 * (8 * Real.pi ^ 2 - E) + 12 * D) :
    Real.sqrt (48 * δ) ≤ Y ∧ Y ≤ roundYamabeConstant ∧ D ≤ 4 * E := by
  have hsqrt : Real.sqrt (48 * δ) ^ 2 = 48 * δ :=
    Real.sq_sqrt (mul_nonneg (by norm_num) hδ.le)
  have hLower : Real.sqrt (48 * δ) ≤ Y := by
    apply (sq_le_sq₀ (Real.sqrt_nonneg _) hY).mp
    linarith only [hsqrt, hEuler, hE, hD]
  have hYsq := (sq_le_sq₀ hY roundYamabeConstant_pos.le).mpr hRound
  refine ⟨hLower, hRound, ?_⟩
  linarith only [hYsq, roundYamabeConstant_sq, hEuler]

/-- The four-index curvature budget from the decomposition following SEC
`msale:source-euler`, with the bounds used at `msgap:compactness`. -/
theorem sourceCurvatureBudget (E D Y total δ : ℝ) (hδ : 0 < δ)
    (hE : E ≤ 8 * Real.pi ^ 2 - δ) (hD : 0 ≤ D) (hY : 0 ≤ Y)
    (hRound : Y ≤ roundYamabeConstant)
    (hEuler : Y ^ 2 = 48 * (8 * Real.pi ^ 2 - E) + 12 * D)
    (hDecomp : total = 8 * E + 2 * D + Y ^ 2 / 6) :
    total = 64 * Real.pi ^ 2 + 4 * D ∧
      total ≤ 16 * E + 64 * Real.pi ^ 2 ∧ total ≤ 192 * Real.pi ^ 2 - 16 * δ := by
  have hRicci := (sourceBandScalarBudget E D Y δ hδ hE hD hY hRound hEuler).2.2
  have hExact : total = 64 * Real.pi ^ 2 + 4 * D := by
    linarith only [hEuler, hDecomp]
  refine ⟨hExact, ?_, ?_⟩
  · linarith only [hExact, hRicci]
  · linarith only [hExact, hRicci, hE]

/-- SEC `msale:residual` from the limiting source Euler identity and the ALE Ricci
identity and budget. -/
theorem componentResidual (e eX y D d : ℝ)
    (hEuler : D = y ^ 2 / 12 - 4 * (8 * Real.pi ^ 2 - e))
    (hAE : d = 4 * eX) (hRicci : d ≤ D) :
    (roundYamabeConstant ^ 2 - y ^ 2) / 48 ≤ e - eX := by
  linarith only [roundYamabeConstant_sq, hEuler, hAE, hRicci]

/-- The strict residual chain of SEC `msale:strict-residual` and `msgap:strict`.
The Yamabe transfer and the strict compactification bound are supplied. -/
theorem strictComponentResidual (e eX y Yhat D d : ℝ)
    (hEuler : D = y ^ 2 / 12 - 4 * (8 * Real.pi ^ 2 - e))
    (hAE : d = 4 * eX) (hRicci : d ≤ D)
    (hy : 0 ≤ y) (hTransfer : y ≤ Yhat) (hSharp : Yhat < roundYamabeConstant) :
    (roundYamabeConstant ^ 2 - y ^ 2) / 48 ≤ e - eX ∧
      (roundYamabeConstant ^ 2 - Yhat ^ 2) / 48 ≤
        (roundYamabeConstant ^ 2 - y ^ 2) / 48 ∧
      0 < (roundYamabeConstant ^ 2 - Yhat ^ 2) / 48 ∧ 0 < e - eX := by
  have hResidual := componentResidual e eX y D d hEuler hAE hRicci
  have hYhat := hy.trans hTransfer
  have hSquares := (sq_le_sq₀ hy hYhat).mpr hTransfer
  have hMonotone : (roundYamabeConstant ^ 2 - Yhat ^ 2) / 48 ≤
      (roundYamabeConstant ^ 2 - y ^ 2) / 48 := by
    linarith only [hSquares]
  have hStrictSquare := (sq_lt_sq₀ hYhat roundYamabeConstant_pos.le).mpr hSharp
  have hPositive : 0 < (roundYamabeConstant ^ 2 - Yhat ^ 2) / 48 := by
    linarith only [hStrictSquare]
  exact ⟨hResidual, hMonotone, hPositive, hPositive.trans_le (hMonotone.trans hResidual)⟩

/-- The strict upper residual bound following SEC `msgap:strict`, using the closed
component gap as a hypothesis. -/
theorem componentResidual_lt (e eX δ : ℝ) (hSource : e ≤ 8 * Real.pi ^ 2 - δ)
    (hGap : 4 * Real.pi ^ 2 < eX) : e - eX < 4 * Real.pi ^ 2 - δ := by
  linarith only [hSource, hGap]

/-- The value `κ_δ` of SEC `msgap:uniform-residual` for a supplied deficit `d_δ`. -/
noncomputable def uniformResidualMargin (deficit : ℝ) : ℝ :=
  (roundYamabeConstant ^ 2 - (roundYamabeConstant - deficit) ^ 2) / 48

theorem uniformResidualMargin_pos (deficit : ℝ) (hDeficit : 0 < deficit)
    (hAdmissible : deficit < roundYamabeConstant) : 0 < uniformResidualMargin deficit := by
  have hCapNonneg : 0 ≤ roundYamabeConstant - deficit := (sub_pos.mpr hAdmissible).le
  have hCapLt : roundYamabeConstant - deficit < roundYamabeConstant := sub_lt_self _ hDeficit
  have hStrictSquare := (sq_lt_sq₀ hCapNonneg roundYamabeConstant_pos.le).mpr hCapLt
  unfold uniformResidualMargin
  linarith only [hStrictSquare]

/-- The quantitative bound of SEC `msgap:uniform-residual` from a supplied exact-class
Yamabe deficit. -/
theorem uniformComponentResidual (e eX y Yhat D d deficit : ℝ)
    (hEuler : D = y ^ 2 / 12 - 4 * (8 * Real.pi ^ 2 - e))
    (hAE : d = 4 * eX) (hRicci : d ≤ D)
    (hy : 0 ≤ y) (hTransfer : y ≤ Yhat)
    (hDeficit : 0 < deficit) (hAdmissible : deficit < roundYamabeConstant)
    (hUniform : Yhat ≤ roundYamabeConstant - deficit) :
    0 < uniformResidualMargin deficit ∧ uniformResidualMargin deficit ≤ e - eX := by
  have hResidual := componentResidual e eX y D d hEuler hAE hRicci
  have hCapNonneg : 0 ≤ roundYamabeConstant - deficit := (sub_pos.mpr hAdmissible).le
  have hSquare := (sq_le_sq₀ hy hCapNonneg).mpr (hTransfer.trans hUniform)
  refine ⟨uniformResidualMargin_pos deficit hDeficit hAdmissible, ?_⟩
  unfold uniformResidualMargin
  linarith only [hSquare, hResidual]

end FirstOrderTwistor
