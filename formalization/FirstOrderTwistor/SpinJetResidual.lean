import FirstOrderTwistor.SpinNormalFrame
import FirstOrderTwistor.SpinRatioAccounting
import Mathlib.Analysis.InnerProductSpace.PiL2

/-! # Building a physical strip estimate from metric curvature and spin two-jets -/

namespace FirstOrderTwistor

open DifferentialGeometry MeasureTheory
open scoped Quaternion Manifold ContDiff

/-- The projected two-form uses the Hilbert norm of its three spinor components. -/
theorem normSq_projectedFrameTwistorCurl_eq_sum (B : Fin 4 → Fin 4 → ℍ[ℝ]) :
    ‖WithLp.toLp 2 (selfDualCliffordProjection (frameTwistorCurl B))‖ ^ 2 =
      ∑ a, Quaternion.normSq (selfDualCliffordProjection (frameTwistorCurl B) a) := by
  rw [PiLp.norm_sq_eq_of_L2]
  simp only [Quaternion.normSq_eq_norm_mul_self, pow_two]

variable {E H M α : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
    [BoundarylessManifold I M] [MeasurableSpace M]

/-- Spinor fields and their ordered two-jets in chosen spin frames above the given
oriented tangent frames. The scale and the volume are those of this comparison. -/
noncomputable def SpinDefectStrip.ofMetricJets
    (g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4)
    (frame : (x : M) → OrientedOrthonormalFrameAt g o x)
    (volume : Measure M) (fields : Finset α) (ψ : α → M → ℍ[ℝ])
    (jet : α → M → Fin 4 → Fin 4 → ℍ[ℝ]) (floor : ℝ) : SpinDefectStrip M α where
  volume := volume
  weylNormSq x := SectionsAndConnections.hilbertSchmidtSq (geometricChiralBlock g o x (frame x))
  fields := fields
  spinorNormSq j x := Quaternion.normSq (ψ j x)
  projectedNormSq j x := ∑ a, Quaternion.normSq
    (selfDualCliffordProjection (frameTwistorCurl (jet j x)) a)
  floor := floor

omit [MeasurableSpace M] in
private theorem twice_projected_metric_jet (g : SmoothRiemannianMetric I M)
    (o : ManifoldOrientation I M 4) (x : M) (f : OrientedOrthonormalFrameAt g o x)
    (ψ : ℍ[ℝ]) (B : Fin 4 → Fin 4 → ℍ[ℝ])
    (h : SpinFrameCommutator (metricCurvatureFrameTensor g o x f) ψ B) :
    2 * (∑ a, Quaternion.normSq (selfDualCliffordProjection (frameTwistorCurl B) a)) =
      SectionsAndConnections.hilbertSchmidtSq (geometricChiralBlock g o x f) * Quaternion.normSq ψ := by
  rw [metricProjectedFrameTwistorCurl_normSq g o x f h]
  ring

/-- The curvature identity required by the strip-accounting interface follows from
compatibility of the supplied two-jets with the actual metric commutator on this set. -/
theorem SpinDefectStrip.validOn_ofMetricJets
    (g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4)
    (frame : (x : M) → OrientedOrthonormalFrameAt g o x)
    (volume physicalEnergy : Measure M) (fields : Finset α) (ψ : α → M → ℍ[ℝ])
    (jet : α → M → Fin 4 → Fin 4 → ℍ[ℝ]) (floor : ℝ) (s : Set M)
    (hs : MeasurableSet s)
    (hMatch : physicalEnergy.restrict s = (energyMeasure volume
      (fun x => SectionsAndConnections.hilbertSchmidtSq
        (geometricChiralBlock g o x (frame x)))).restrict s)
    (hW : IntegrableOn (fun x => SectionsAndConnections.hilbertSchmidtSq
      (geometricChiralBlock g o x (frame x))) s volume)
    (hD : ∀ j ∈ fields, IntegrableOn (fun x => ∑ a, Quaternion.normSq
      (selfDualCliffordProjection (frameTwistorCurl (jet j x)) a)) s volume)
    (hJet : ∀ j ∈ fields, ∀ᵐ x ∂volume.restrict s, SpinFrameCommutator
      (metricCurvatureFrameTensor g o x (frame x)) (ψ j x) (jet j x))
    (hPos : 0 < floor)
    (hFloor : ∀ᵐ x ∂volume.restrict s, floor ^ 2 ≤ ∑ j ∈ fields, Quaternion.normSq (ψ j x)) :
    (SpinDefectStrip.ofMetricJets g o frame volume fields ψ jet floor).ValidOn physicalEnergy s := by
  refine ⟨hs, hMatch, hW, .of_forall ?_, hD, ?_, hPos, hFloor⟩
  · intro x
    change 0 ≤ ∑ i : Fin 3, ∑ j : Fin 3, (geometricChiralBlock g o x (frame x) i j) ^ 2
    exact Finset.sum_nonneg fun i _ => Finset.sum_nonneg fun j _ => sq_nonneg _
  · intro j hj
    filter_upwards [hJet j hj] with x hx
    exact twice_projected_metric_jet g o x (frame x) _ _ hx

/-- The same metric jets supply the ratio criterion just on their joint nonzero
locus. Its integral requires only local Weyl integrability. -/
theorem SpinDefectStrip.ratioValidOn_ofMetricJets
    (g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4)
    (frame : (x : M) → OrientedOrthonormalFrameAt g o x)
    (volume physicalEnergy : Measure M) (fields : Finset α) (ψ : α → M → ℍ[ℝ])
    (jet : α → M → Fin 4 → Fin 4 → ℍ[ℝ]) (s : Set M)
    (hMatch : physicalEnergy.restrict s = (energyMeasure volume
      (fun x => SectionsAndConnections.hilbertSchmidtSq
        (geometricChiralBlock g o x (frame x)))).restrict s) :
    let D := SpinDefectStrip.ofMetricJets g o frame volume fields ψ jet 0
    let region := D.nonzeroRegion s
    MeasurableSet region → IntegrableOn D.weylNormSq region volume →
    (∀ j ∈ fields, ∀ᵐ x ∂volume.restrict region, SpinFrameCommutator
      (metricCurvatureFrameTensor g o x (frame x)) (ψ j x) (jet j x)) →
    D.RatioValidOn physicalEnergy s := by
  intro D region hs hW hJet
  refine ⟨hs, hMatch, hW, .of_forall ?_, ?_⟩
  · intro x
    change 0 ≤ ∑ i : Fin 3, ∑ j : Fin 3, (geometricChiralBlock g o x (frame x) i j) ^ 2
    exact Finset.sum_nonneg fun i _ => Finset.sum_nonneg fun j _ => sq_nonneg _
  · intro j hj
    filter_upwards [hJet j hj] with x hx
    exact twice_projected_metric_jet g o x (frame x) _ _ hx

end FirstOrderTwistor
