import FirstOrderTwistor.ChiralFramePullback
import FirstOrderTwistor.SphericalCut

/-! # Descent for the curvature of the actual pulled-back metric

Admissible energies are computed from the Levi-Civita curvature in oriented metric
orthonormal frames with integrable squared block norm. A frame is chosen pointwise;
no parallelizability of a homotopy sphere is required.
-/

open DifferentialGeometry DifferentialGeometry.Integral.Measure MeasureTheory SectionsAndConnections
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
private local instance : MeasurableSpace X := borel X
private local instance : BorelSpace X := ⟨rfl⟩

/-- Possible energies of positive-Yamabe metrics, evaluated using actual curvature.
The explicit integrability test excludes the fallback value of the Bochner integral. -/
def geometricPositiveEnergies (o : ManifoldOrientation I M 4) : Set ℝ :=
  {x | ∃ (g : SmoothRiemannianMetric I M) (frame : ∀ p, OrientedOrthonormalFrameAt g o p),
    let W := fun p => geometricChiralBlock g o p (frame p)
    0 < classYamabeFour o.dimension_eq g ∧
      Integrable (fun p => hilbertSchmidtSq (W p)) (riemannianVolumeMeasure I M g) ∧
      chiralFrameEnergy g W = x}

theorem geometricPositiveEnergies_bddBelow (o : ManifoldOrientation I M 4) :
    BddBelow (geometricPositiveEnergies o) := by
  refine ⟨0, ?_⟩
  rintro x ⟨g, frame, _, _, rfl⟩
  exact chiralFrameEnergy_nonneg _ _

/-- Pull an actual metric back to M. Pointwise transported frames identify its
integrand, and the Borel volume transport proves integrability on the source. -/
theorem geometricPullbackCompetitor
    {oM : ManifoldOrientation I M 4} {oX : ManifoldOrientation J X 4}
    (Φ : M ≃ₘ⟮I, J⟯ X) (hΦ : Φ.preservesOrientation oM oX)
    (g : SmoothRiemannianMetric J X) (frame : ∀ y, OrientedOrthonormalFrameAt g oX y)
    (hY : 0 < classYamabeFour oX.dimension_eq g)
    (hInt : Integrable (fun y => hilbertSchmidtSq (geometricChiralBlock g oX y (frame y)))
      (riemannianVolumeMeasure J X g)) :
    let pull := Diffeomorph.pullbackMetricCross g Φ
    let frames := pullbackOrientedOrthonormalFrames g Φ hΦ frame
    let WM := fun x => geometricChiralBlock pull oM x (frames x)
    0 < classYamabeFour oM.dimension_eq pull ∧
      Integrable (fun x => hilbertSchmidtSq (WM x)) (riemannianVolumeMeasure I M pull) ∧
      chiralFrameEnergy pull WM = chiralFrameEnergy g (fun y => geometricChiralBlock g oX y (frame y)) := by
  let pull := Diffeomorph.pullbackMetricCross g Φ
  let frames := pullbackOrientedOrthonormalFrames g Φ hΦ frame
  let WX := fun y => geometricChiralBlock g oX y (frame y)
  let WM := fun x => geometricChiralBlock pull oM x (frames x)
  have hW (x : M) : WM x = WX (Φ x) :=
    geometricChiralBlock_pullback g Φ hΦ x (frame (Φ x))
  refine ⟨?_, ?_, ?_⟩
  · rwa [classYamabeFour_pullback oM.dimension_eq oX.dimension_eq]
  · change Integrable (fun x => hilbertSchmidtSq (WM x))
      (riemannianVolumeMeasure I M (Diffeomorph.pullbackMetricCross g Φ))
    have hEmb : MeasurableEmbedding (Φ.symm : X → M) := Φ.symm.toHomeomorph.measurableEmbedding
    rw [riemannianVolumeMeasure_pullback_cross, hEmb.integrable_map_iff]
    simpa only [Function.comp_def, hW, Φ.apply_symm_apply] using
      (show Integrable (fun y => hilbertSchmidtSq (WX y)) (riemannianVolumeMeasure J X g) from hInt)
  · apply chiralFrameEnergy_pullback g Φ WM WX
    exact Filter.Eventually.of_forall fun x => ⟨1, by simp, by simpa using hW x⟩

/-- The actual pullback metric witnesses membership in the original variational set. -/
theorem geometricEnergy_mem_of_pullback
    {oM : ManifoldOrientation I M 4} {oX : ManifoldOrientation J X 4}
    (Φ : M ≃ₘ⟮I, J⟯ X) (hΦ : Φ.preservesOrientation oM oX)
    (g : SmoothRiemannianMetric J X) (frame : ∀ y, OrientedOrthonormalFrameAt g oX y)
    (hY : 0 < classYamabeFour oX.dimension_eq g)
    (hInt : Integrable (fun y => hilbertSchmidtSq (geometricChiralBlock g oX y (frame y)))
      (riemannianVolumeMeasure J X g)) :
    chiralFrameEnergy g (fun y => geometricChiralBlock g oX y (frame y)) ∈
      geometricPositiveEnergies oM := by
  exact ⟨Diffeomorph.pullbackMetricCross g Φ, pullbackOrientedOrthonormalFrames g Φ hΦ frame,
    geometricPullbackCompetitor Φ hΦ g frame hY hInt⟩

/-- An oriented diffeomorphism identifies the full variational sets, including
the original smooth type in the marked reassembly. -/
theorem geometricPositiveEnergies_eq_of_diffeomorph
    {oM : ManifoldOrientation I M 4} {oX : ManifoldOrientation J X 4}
    (Φ : M ≃ₘ⟮I, J⟯ X) (hΦ : Φ.preservesOrientation oM oX) :
    geometricPositiveEnergies oM = geometricPositiveEnergies oX := by
  ext x
  constructor
  · rintro ⟨g, f, hy, hint, rfl⟩
    exact geometricEnergy_mem_of_pullback Φ.symm (Diffeomorph.preservesOrientation_symm hΦ)
      g f hy hint
  · rintro ⟨g, f, hy, hint, rfl⟩
    exact geometricEnergy_mem_of_pullback Φ hΦ g f hy hint

/-- Strict and quantitative descent for curvature-derived energies on M. The
quantitative conclusion is available for each supplied exact-class Yamabe deficit. -/
theorem geometricDescentOnOriginalType
    {oM : ManifoldOrientation I M 4} {oX : ManifoldOrientation J X 4}
    (patches : SmoothCutGluing I J M X)
    (hcore : PreservesPatchOrientation patches.core oM oX)
    (hexterior : PreservesPatchOrientation patches.exterior oM oX)
    (g : SmoothRiemannianMetric J X) (frame : ∀ y, OrientedOrthonormalFrameAt g oX y)
    (hy : 0 < classYamabeFour oX.dimension_eq g)
    (hint : Integrable (fun y => hilbertSchmidtSq (geometricChiralBlock g oX y (frame y)))
      (riemannianVolumeMeasure J X g))
    {e : ℝ} (r : CutResidualInputs e
      (chiralFrameEnergy g (fun y => geometricChiralBlock g oX y (frame y)))
      (classYamabeFour oX.dimension_eq g))
    (hsharp : classYamabeFour oX.dimension_eq g < roundYamabeConstant) :
    let x := chiralFrameEnergy g (fun y => geometricChiralBlock g oX y (frame y))
    let infM := sInf (geometricPositiveEnergies oM)
    patches.toDiffeomorph.preservesOrientation oM oX ∧
      x ∈ geometricPositiveEnergies oM ∧ infM ≤ x ∧ x < e ∧
      (∀ deficit : ℝ, 0 < deficit → deficit < roundYamabeConstant →
        classYamabeFour oX.dimension_eq g ≤ roundYamabeConstant - deficit →
        0 < uniformResidualMargin deficit ∧ x ≤ e - uniformResidualMargin deficit ∧
          uniformResidualMargin deficit ≤ e - infM) := by
  have hΦ := patches.toDiffeomorph_preservesOrientation hcore hexterior
  have hmem := geometricEnergy_mem_of_pullback patches.toDiffeomorph hΦ g frame hy hint
  have hInf := csInf_le (geometricPositiveEnergies_bddBelow oM) hmem
  have hstrict := strictComponentResidual _ _ _ _ _ _ r.euler r.aeRicci r.ricciBound
    r.yamabeNonneg r.yamabeTransfer hsharp
  refine ⟨hΦ, hmem, hInf, sub_pos.mp hstrict.2.2.2, ?_⟩
  intro deficit hd ha hu
  obtain ⟨hpos, hgap⟩ := uniformComponentResidual _ _ _ _ _ _ _ r.euler r.aeRicci r.ricciBound
    r.yamabeNonneg r.yamabeTransfer hd ha hu
  exact ⟨hpos, by linarith only [hgap], by linarith only [hgap, hInf]⟩

end FirstOrderTwistor
