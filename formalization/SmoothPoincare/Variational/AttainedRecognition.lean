import DifferentialGeometry.Geometry.Curvature.Sphere.ConstCurvature
import FirstOrderTwistor.ExteriorRecognition
import FirstOrderTwistor.GeometricCutDescent

/-! # Recognition at an actual admissible energy and at the infimum -/

open DifferentialGeometry DifferentialGeometry.Geometry
open DifferentialGeometry.CheegerGromovCompactness DifferentialGeometry.Integral.Measure
open FirstOrderTwistor MeasureTheory SectionsAndConnections
open scoped ContDiff Manifold

namespace SmoothPoincare

local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 5)) = 4 + 1) := ⟨by simp⟩
private local instance : Nonempty StandardFourSphere :=
  (NormedSpace.sphere_nonempty (x := (0 : EuclideanSpace ℝ (Fin 5))) (r := 1)).mpr zero_le_one
    |>.to_subtype
private local instance : MeasurableSpace StandardFourSphere := borel StandardFourSphere
private local instance : BorelSpace StandardFourSphere := ⟨rfl⟩

/-- The actual unit round metric in the chosen model of the standard sphere. -/
noncomputable abbrev standardRoundFourMetric :
    SmoothRiemannianMetric (𝓡 4) StandardFourSphere := roundMetric

/-- The positive Weyl block of the round metric vanishes in any of its
oriented orthonormal frames. -/
theorem standardRoundFour_chiralBlock_eq_zero
    (o : ManifoldOrientation (𝓡 4) StandardFourSphere 4) (x : StandardFourSphere)
    (frame : OrientedOrthonormalFrameAt standardRoundFourMetric o x) :
    geometricChiralBlock standardRoundFourMetric o x frame = 0 := by
  have : IsManifold (𝓡 4) 1 StandardFourSphere := IsManifold.of_le (by decide : (1 : ℕ∞ω) ≤ ∞)
  have hTensor : metricCurvatureFrameTensor standardRoundFourMetric o x frame =
      constantSectionalFrameTensor 1 := by
    funext a b c d
    unfold metricCurvatureFrameTensor
    rw [metricRm04StandardAt_eq_inner_riemannOp, standardRoundFourMetric.symm x,
      round_riemann_one]
    change standardRoundFourMetric.inner x
      (standardRoundFourMetric.inner x (frame.basis b) (frame.basis d) • frame.basis a -
        standardRoundFourMetric.inner x (frame.basis a) (frame.basis d) • frame.basis b)
      (frame.basis c) = _
    simp only [map_sub, map_smul, sub_apply, smul_apply, smul_eq_mul, frame.orthonormal]
    change (if b = d then (1 : ℝ) else 0) * (if a = c then 1 else 0) -
      (if a = d then 1 else 0) * (if b = c then 1 else 0) =
        1 * ((if a = c then 1 else 0) * (if b = d then 1 else 0) -
          (if a = d then 1 else 0) * (if b = c then 1 else 0))
    ring
  rw [geometricChiralBlock, hTensor, traceFreeSelfDualBlock_constantSectional]

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [Nonempty M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- A supplied oriented identification pulls the actual zero-energy round
metric back to this type. Its class must have positive Yamabe constant. -/
theorem geometricInfimum_eq_zero_of_roundIdentification
    {o : ManifoldOrientation I M 4} {oS : ManifoldOrientation (𝓡 4) StandardFourSphere 4}
    (Φ : M ≃ₘ⟮I, 𝓡 4⟯ StandardFourSphere) (hΦ : Φ.preservesOrientation o oS)
    (hRoundPositive : 0 < classYamabeFour oS.dimension_eq standardRoundFourMetric) :
    0 ∈ geometricPositiveEnergies o ∧ sInf (geometricPositiveEnergies o) = 0 := by
  let frame := orientedOrthonormalFrameAt standardRoundFourMetric oS
  have hZero (x : StandardFourSphere) :
      geometricChiralBlock standardRoundFourMetric oS x (frame x) = 0 :=
    standardRoundFour_chiralBlock_eq_zero oS x (frame x)
  have hInt : Integrable
      (fun x => hilbertSchmidtSq (geometricChiralBlock standardRoundFourMetric oS x (frame x)))
      (riemannianVolumeMeasure (𝓡 4) StandardFourSphere standardRoundFourMetric) := by
    simp [hZero, hilbertSchmidtSq]
  have hMember := geometricEnergy_mem_of_pullback Φ hΦ standardRoundFourMetric frame
    hRoundPositive hInt
  have hZeroMem : 0 ∈ geometricPositiveEnergies o := by
    simpa [chiralFrameEnergy, hZero, hilbertSchmidtSq] using hMember
  refine ⟨hZeroMem, le_antisymm (csInf_le (geometricPositiveEnergies_bddBelow o) hZeroMem) ?_⟩
  apply le_csInf ⟨0, hZeroMem⟩
  rintro e ⟨g, basis, _, _, rfl⟩
  exact chiralFrameEnergy_nonneg g _

/-- A strict inequality for the real infimum of a nonempty admissible set
supplies one actual positive metric and its integrable geometric energy. -/
theorem existsGeometricPositiveMetric_belowThreshold (o : ManifoldOrientation I M 4)
    (hEntry : (geometricPositiveEnergies o).Nonempty) {T : ℝ}
    (hStrict : sInf (geometricPositiveEnergies o) < T) :
    ∃ (g : SmoothRiemannianMetric I M) (frame : ∀ x, OrientedOrthonormalFrameAt g o x),
      let W := fun x => geometricChiralBlock g o x (frame x)
      0 < classYamabeFour o.dimension_eq g ∧
        Integrable (fun x => hilbertSchmidtSq (W x)) (riemannianVolumeMeasure I M g) ∧
        chiralFrameEnergy g W < T := by
  obtain ⟨e, ⟨g, frame, hY, hInt, hEnergy⟩, hBelow⟩ := exists_lt_of_csInf_lt hEntry hStrict
  exact ⟨g, frame, hY, hInt, hEnergy.trans_lt hBelow⟩

/-- The inclusive recognition input applies to the energy of an actual
positive metric. A positive threshold equality for the infimum would have
to be unattained. -/
theorem geometricRecognitionEndpoint
    (o : ManifoldOrientation I M 4) (oS : ManifoldOrientation (𝓡 4) StandardFourSphere 4)
    (hEntry : (geometricPositiveEnergies o).Nonempty)
    (hRoundPositive : 0 < classYamabeFour oS.dimension_eq standardRoundFourMetric)
    (hRecognize : ∀ (g : SmoothRiemannianMetric I M) (frame : ∀ x, OrientedOrthonormalFrameAt g o x),
      let W := fun x => geometricChiralBlock g o x (frame x)
      0 < classYamabeFour o.dimension_eq g →
      Integrable (fun x => hilbertSchmidtSq (W x)) (riemannianVolumeMeasure I M g) →
      chiralFrameEnergy g W ≤ 4 * Real.pi ^ 2 →
      Nonempty {Φ : M ≃ₘ⟮I, 𝓡 4⟯ StandardFourSphere // Φ.preservesOrientation o oS}) :
    let A := geometricPositiveEnergies o
    let T := 4 * Real.pi ^ 2
    let recognized := Nonempty {Φ : M ≃ₘ⟮I, 𝓡 4⟯ StandardFourSphere // Φ.preservesOrientation o oS}
    ((∃ e ∈ A, e ≤ T) ↔ recognized) ∧
      (sInf A < T ↔ recognized) ∧
      (recognized → 0 ∈ A ∧ sInf A = 0) ∧
      (sInf A = T → T ∉ A) := by
  intro A T recognized
  have hZero (h : recognized) : 0 ∈ A ∧ sInf A = 0 := by
    obtain ⟨⟨Φ, hΦ⟩⟩ := h
    exact geometricInfimum_eq_zero_of_roundIdentification Φ hΦ hRoundPositive
  have hT : 0 < T := mul_pos (by norm_num) (pow_pos Real.pi_pos 2)
  have hFinite : (∃ e ∈ A, e ≤ T) ↔ recognized := by
    constructor
    · rintro ⟨e, ⟨g, frame, hY, hInt, rfl⟩, hThreshold⟩
      exact hRecognize g frame hY hInt hThreshold
    · intro h
      exact ⟨0, (hZero h).1, hT.le⟩
  refine ⟨hFinite, ⟨?_, fun h => (hZero h).2.symm ▸ hT⟩, hZero, ?_⟩
  · intro hStrict
    obtain ⟨g, frame, hY, hInt, hThreshold⟩ := existsGeometricPositiveMetric_belowThreshold o hEntry hStrict
    exact hRecognize g frame hY hInt hThreshold.le
  · intro hEqual hAttained
    have h := hZero (hFinite.mp ⟨T, hAttained, le_rfl⟩)
    exact hT.ne' (hEqual.symm.trans h.2)

end SmoothPoincare
