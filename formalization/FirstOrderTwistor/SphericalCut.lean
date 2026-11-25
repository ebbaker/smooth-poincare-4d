import FirstOrderTwistor.ChiralTransport
import FirstOrderTwistor.ComponentBudgets
import FirstOrderTwistor.OrientedCutGluing
import FirstOrderTwistor.YamabeTransport

/-! # A competitor on the original smooth type

The patch maps include the marked collar of the recognized exterior. We pull back
the actual compactified metric. Identification of the supplied matrix fields with
the physical positive Weyl blocks, and the geometric identities entering the
component residual, are application inputs.
-/

open DifferentialGeometry DifferentialGeometry.Integral.Measure MeasureTheory
open scoped Manifold ContDiff

namespace FirstOrderTwistor

variable {E F H K M X : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
  [TopologicalSpace H] [TopologicalSpace K]
  {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  {J : ModelWithCorners ℝ F K} [J.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [Nonempty M]
  [TopologicalSpace X] [ChartedSpace K X] [IsManifold J ∞ X] [T2Space X]
  [CompactSpace X] [Nonempty X]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- Infimum over smooth positive-Yamabe metrics on the specified oriented four-manifold.
The argument W supplies the self-dual curvature coefficients in pointwise orthonormal frames. -/
noncomputable def positiveYamabeEnergyInfimum (oM : ManifoldOrientation I M 4)
    (W : SmoothRiemannianMetric I M → M → Matrix (Fin 3) (Fin 3) ℝ) : ℝ :=
  sInf {r : ℝ | ∃ g : SmoothRiemannianMetric I M,
    0 < classYamabeFour oM.dimension_eq g ∧ chiralFrameEnergy g (W g) = r}

theorem positiveYamabeEnergyInfimum_le (oM : ManifoldOrientation I M 4)
    (W : SmoothRiemannianMetric I M → M → Matrix (Fin 3) (Fin 3) ℝ)
    (g : SmoothRiemannianMetric I M) (hy : 0 < classYamabeFour oM.dimension_eq g) :
    positiveYamabeEnergyInfimum oM W ≤ chiralFrameEnergy g (W g) := by
  unfold positiveYamabeEnergyInfimum
  apply csInf_le
  · refine ⟨0, ?_⟩
    rintro r ⟨g', _, rfl⟩
    exact chiralFrameEnergy_nonneg g' (W g')
  · exact ⟨g, hy, rfl⟩

/-- Data supplied by the oriented, marked patch construction and the identification
of the positive Weyl coefficients for the specific compactification metric. -/
structure MarkedMetricTransfer (oM : ManifoldOrientation I M 4)
    (oX : ManifoldOrientation J X 4) (g : SmoothRiemannianMetric J X)
    (WM : SmoothRiemannianMetric I M → M → Matrix (Fin 3) (Fin 3) ℝ)
    (WX : X → Matrix (Fin 3) (Fin 3) ℝ) where
  patches : SmoothCutGluing I J M X
  core_orientation : PreservesPatchOrientation patches.core oM oX
  exterior_orientation : PreservesPatchOrientation patches.exterior oM oX
  positive_block : let Φ := patches.toDiffeomorph
    let pull := Diffeomorph.pullbackMetricCross g Φ
    ∀ᵐ x ∂riemannianVolumeMeasure I M pull, ∃ Q : Matrix (Fin 3) (Fin 3) ℝ,
      Q.transpose * Q = 1 ∧ WM pull x = Q * WX (Φ x) * Q.transpose

/-- Route 02 inputs from the limiting source Euler identity, the ALE Ricci budget
and Yamabe transfer. The strict and uniform deficits are separate inputs. -/
structure CutResidualInputs (e x Yhat : ℝ) where
  sourceYamabe : ℝ
  sourceRicci : ℝ
  componentRicci : ℝ
  euler : sourceRicci = sourceYamabe ^ 2 / 12 - 4 * (8 * Real.pi ^ 2 - e)
  aeRicci : componentRicci = 4 * x
  ricciBound : componentRicci ≤ sourceRicci
  yamabeNonneg : 0 ≤ sourceYamabe
  yamabeTransfer : sourceYamabe ≤ Yhat

variable {oM : ManifoldOrientation I M 4} {oX : ManifoldOrientation J X 4}
  {g : SmoothRiemannianMetric J X}
  {WM : SmoothRiemannianMetric I M → M → Matrix (Fin 3) (Fin 3) ℝ}
  {WX : X → Matrix (Fin 3) (Fin 3) ℝ}

/-- The specified patch maps produce an oriented diffeomorphism and an admissible
metric on M with exactly the energy of the compactification. -/
theorem MarkedMetricTransfer.competitor (d : MarkedMetricTransfer oM oX g WM WX)
    (hy : 0 < classYamabeFour oX.dimension_eq g) :
    let Φ := d.patches.toDiffeomorph
    let pull := Diffeomorph.pullbackMetricCross g Φ
    Φ.preservesOrientation oM oX ∧ 0 < classYamabeFour oM.dimension_eq pull ∧
      chiralFrameEnergy pull (WM pull) = chiralFrameEnergy g WX ∧
      positiveYamabeEnergyInfimum oM WM ≤ chiralFrameEnergy g WX := by
  let Φ := d.patches.toDiffeomorph
  let pull := Diffeomorph.pullbackMetricCross g Φ
  have hY : 0 < classYamabeFour oM.dimension_eq pull := by
    rwa [classYamabeFour_pullback oM.dimension_eq oX.dimension_eq]
  have hE := chiralFrameEnergy_pullback g Φ (WM pull) WX d.positive_block
  exact ⟨d.patches.toDiffeomorph_preservesOrientation d.core_orientation d.exterior_orientation,
    hY, hE, (positiveYamabeEnergyInfimum_le oM WM pull hY).trans_eq hE⟩

/-- Strict same-type descent. The scalar chain is Route 02's strict residual;
no accounting identity for the entire neck occurs. -/
theorem lowerEnergyOnOriginalType (d : MarkedMetricTransfer oM oX g WM WX)
    (hy : 0 < classYamabeFour oX.dimension_eq g) {e : ℝ}
    (r : CutResidualInputs e (chiralFrameEnergy g WX) (classYamabeFour oX.dimension_eq g))
    (hsharp : classYamabeFour oX.dimension_eq g < roundYamabeConstant) :
    positiveYamabeEnergyInfimum oM WM ≤ chiralFrameEnergy g WX ∧ chiralFrameEnergy g WX < e := by
  have hs := strictComponentResidual _ _ _ _ _ _ r.euler r.aeRicci r.ricciBound
    r.yamabeNonneg r.yamabeTransfer hsharp
  exact ⟨(d.competitor hy).2.2.2, sub_pos.mp hs.2.2.2⟩

/-- A strict residual already rules out the bubble at the exact variational infimum. -/
theorem excludesExactMinimum (d : MarkedMetricTransfer oM oX g WM WX)
    (hy : 0 < classYamabeFour oX.dimension_eq g) {e : ℝ}
    (r : CutResidualInputs e (chiralFrameEnergy g WX) (classYamabeFour oX.dimension_eq g))
    (hsharp : classYamabeFour oX.dimension_eq g < roundYamabeConstant) :
    e ≠ positiveYamabeEnergyInfimum oM WM := by
  obtain ⟨hInf, hDrop⟩ := lowerEnergyOnOriginalType d hy r hsharp
  exact (hInf.trans_lt hDrop).ne.symm

/-- A supplied band-uniform Yamabe deficit gives the quantitative exclusion,
including the explicit residual margin. -/
theorem uniformDescentOnOriginalType (d : MarkedMetricTransfer oM oX g WM WX)
    (hy : 0 < classYamabeFour oX.dimension_eq g) {e deficit : ℝ}
    (r : CutResidualInputs e (chiralFrameEnergy g WX) (classYamabeFour oX.dimension_eq g))
    (hdef : 0 < deficit) (hadm : deficit < roundYamabeConstant)
    (huniform : classYamabeFour oX.dimension_eq g ≤ roundYamabeConstant - deficit) :
    0 < uniformResidualMargin deficit ∧
      chiralFrameEnergy g WX ≤ e - uniformResidualMargin deficit ∧
      uniformResidualMargin deficit ≤ e - positiveYamabeEnergyInfimum oM WM := by
  obtain ⟨hpos, hgap⟩ := uniformComponentResidual _ _ _ _ _ _ _ r.euler r.aeRicci r.ricciBound
    r.yamabeNonneg r.yamabeTransfer hdef hadm huniform
  have hInf := (d.competitor hy).2.2.2
  exact ⟨hpos, by linarith only [hgap], by linarith only [hgap, hInf]⟩

end FirstOrderTwistor
