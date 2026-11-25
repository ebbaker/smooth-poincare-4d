import DifferentialGeometry.Analysis.Integration.Measure.Conformal
import FirstOrderTwistor.EnergyDensity
import SectionsAndConnections.ThreeAxisWeyl

/-!
# Conformal invariance of the chiral energy measure in dimension four

The Riemannian volume change supplies the weight `exp (4 * u)`. The squared
Hilbert–Schmidt norm of an operator block with coefficients scaled by
`exp (-2 * u)` supplies the reciprocal weight. Identification of those
coefficients with a metric's Weyl block in matched oriented frames is supplied.
-/

namespace FirstOrderTwistor

open Filter MeasureTheory SectionsAndConnections

private theorem hilbertSchmidtSq_smul (a : ℝ) (W : Matrix (Fin 3) (Fin 3) ℝ) :
    hilbertSchmidtSq (a • W) = a ^ 2 * hilbertSchmidtSq W := by
  simp only [hilbertSchmidtSq, Matrix.smul_apply, smul_eq_mul, mul_pow, Finset.mul_sum]

/-- A four-dimensional volume factor cancels the squared coefficient factor. -/
theorem hilbertSchmidtSq_conformal_cancel (u : ℝ) (W : Matrix (Fin 3) (Fin 3) ℝ) :
    Real.exp (4 * u) * hilbertSchmidtSq (Real.exp (-2 * u) • W) = hilbertSchmidtSq W := by
  have hExponent : 4 * u + (-2 * u + -2 * u) = 0 := by ring
  rw [hilbertSchmidtSq_smul, pow_two, ← Real.exp_add, ← mul_assoc, ← Real.exp_add,
    hExponent, Real.exp_zero, one_mul]

/-- Measure change with the four-dimensional conformal weight preserves chiral energy. -/
theorem energyMeasure_conformalFour {X : Type*} [MeasurableSpace X]
    (volume : Measure X) (u : X → ℝ) (hu : Measurable u)
    {W WScaled : X → Matrix (Fin 3) (Fin 3) ℝ}
    (hScale : ∀ᵐ x ∂volume, WScaled x = Real.exp (-2 * u x) • W x) :
    energyMeasure (volume.withDensity (fun x => ENNReal.ofReal (Real.exp (4 * u x))))
        (fun x => hilbertSchmidtSq (WScaled x)) =
      energyMeasure volume (fun x => hilbertSchmidtSq (W x)) := by
  have hWeight : Measurable (fun x => ENNReal.ofReal (Real.exp (4 * u x))) :=
    (Real.continuous_exp.measurable.comp (measurable_const.mul hu)).ennreal_ofReal
  ext1 s hs
  simp only [energyMeasure, withDensity_apply _ hs]
  rw [setLIntegral_withDensity_eq_setLIntegral_mul_non_measurable₀ volume
    hWeight.aemeasurable (fun x => ENNReal.ofReal (hilbertSchmidtSq (WScaled x))) hs
    (Eventually.of_forall fun _ => ENNReal.ofReal_lt_top)]
  apply lintegral_congr_ae
  filter_upwards [ae_restrict_of_ae hScale] with x hx
  rw [Pi.mul_apply, ← ENNReal.ofReal_mul (Real.exp_pos _).le, hx,
    hilbertSchmidtSq_conformal_cancel]

section Riemannian

open DifferentialGeometry DifferentialGeometry.Integral.Measure
open scoped ContDiff Manifold

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [SigmaCompactSpace M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- A coefficient transformation on a measurable region suffices for equality of the
restricted energy measures under the actual Riemannian volume change. -/
theorem riemannianChiralEnergyMeasure_restrict_conformalMetric
    (hDim : Module.finrank ℝ E = 4) (g : SmoothRiemannianMetric I M)
    (u : C^∞⟮I, M; ℝ⟯) {W WScaled : M → Matrix (Fin 3) (Fin 3) ℝ}
    {s : Set M} (hs : MeasurableSet s)
    (hScale : ∀ᵐ x ∂(riemannianVolumeMeasure (I := I) (M := M) g).restrict s,
      WScaled x = Real.exp (-2 * u x) • W x) :
    (energyMeasure (riemannianVolumeMeasure (I := I) (M := M) (conformalMetric g u))
        (fun x => hilbertSchmidtSq (WScaled x))).restrict s =
      (energyMeasure (riemannianVolumeMeasure (I := I) (M := M) g)
        (fun x => hilbertSchmidtSq (W x))).restrict s := by
  rw [riemannianVolumeMeasure_conformalMetric]
  simpa only [energyMeasure, restrict_withDensity hs, hDim, Nat.cast_ofNat] using
    energyMeasure_conformalFour ((riemannianVolumeMeasure (I := I) (M := M) g).restrict s)
      u u.contMDiff.continuous.measurable hScale

/-- For `g̃ = exp (2 * u) g`, the volume change and supplied chiral coefficient
transformation preserve the energy measure on the whole manifold. -/
theorem riemannianChiralEnergyMeasure_conformalMetric
    (hDim : Module.finrank ℝ E = 4) (g : SmoothRiemannianMetric I M)
    (u : C^∞⟮I, M; ℝ⟯) {W WScaled : M → Matrix (Fin 3) (Fin 3) ℝ}
    (hScale : ∀ᵐ x ∂riemannianVolumeMeasure (I := I) (M := M) g,
      WScaled x = Real.exp (-2 * u x) • W x) :
    energyMeasure (riemannianVolumeMeasure (I := I) (M := M) (conformalMetric g u))
        (fun x => hilbertSchmidtSq (WScaled x)) =
      energyMeasure (riemannianVolumeMeasure (I := I) (M := M) g)
        (fun x => hilbertSchmidtSq (W x)) := by
  simpa only [Measure.restrict_univ] using
    riemannianChiralEnergyMeasure_restrict_conformalMetric hDim g u MeasurableSet.univ
      (by simpa only [Measure.restrict_univ] using hScale)

end Riemannian

end FirstOrderTwistor
