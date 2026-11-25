import FirstOrderTwistor.GeometricCutDescent
import Mathlib.Analysis.SpecificLimits.Basic
import Mathlib.Tactic.Linarith

/-! # A minimizing sequence from one subcritical positive metric

The entry metric witnesses nonemptiness of the real variational set. Selecting
from its sublevels gives actual smooth metrics and a common strict gap below
the scalar-flat threshold. Normalization is conditional on a representative
with the stated geometric properties for each selected class.
-/

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Integral.Measure Filter MeasureTheory Set
open FirstOrderTwistor SectionsAndConnections
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

private theorem exists_subcriticalEnergySequence {A : Set ℝ} {entry ceiling : ℝ}
    (hBelow : BddBelow A) (hEntry : entry ∈ A) (hCeiling : entry < ceiling) :
    ∃ δ > 0, ∃ e : ℕ → ℝ, (∀ n, e n ∈ A ∧ e n ≤ ceiling - δ) ∧
      Tendsto e atTop (𝓝 (sInf A)) := by
  let δ := (ceiling - entry) / 2
  have hδ : 0 < δ := half_pos (sub_pos.mpr hCeiling)
  have hSelect (n : ℕ) : ∃ a ∈ A, a < sInf A + min δ (1 / ((n : ℝ) + 1)) :=
    exists_lt_of_csInf_lt ⟨entry, hEntry⟩ (lt_add_of_pos_right _ (lt_min hδ (by positivity)))
  choose e hMem hClose using hSelect
  refine ⟨δ, hδ, e, fun n => ⟨hMem n, ?_⟩, ?_⟩
  · have hUpper := (hClose n).trans_le (add_le_add_right (min_le_left _ _) _)
    have hInf := csInf_le hBelow hEntry
    dsimp [δ] at hUpper ⊢
    linarith only [hUpper, hInf]
  · have hConst : Tendsto (fun _ : ℕ => sInf A) atTop (𝓝 (sInf A)) := tendsto_const_nhds
    have hUpper : Tendsto (fun n : ℕ => sInf A + 1 / ((n : ℝ) + 1)) atTop (𝓝 (sInf A)) := by
      simpa using hConst.add tendsto_one_div_add_atTop_nhds_zero_nat
    exact hConst.squeeze hUpper (fun n => csInf_le hBelow (hMem n))
      (fun n => (hClose n).le.trans (add_le_add_right (min_le_right _ _) _))

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M] [Nonempty M]

private local instance : CompleteSpace E := FiniteDimensional.complete ℝ E
private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- One actual positive metric below `8π²` supplies a minimizing sequence on
the same oriented type and a uniform positive gap below `8π²` at every index. -/
theorem existsGeometricMinimizingSequence (o : ManifoldOrientation I M 4)
    (entry : SmoothRiemannianMetric I M) (frameEntry : ∀ x, OrientedOrthonormalFrameAt entry o x)
    (hPositive : 0 < classYamabeFour o.dimension_eq entry)
    (hInt : Integrable (fun x => hilbertSchmidtSq (geometricChiralBlock entry o x (frameEntry x)))
      (riemannianVolumeMeasure I M entry))
    (hSubcritical : chiralFrameEnergy entry (fun x => geometricChiralBlock entry o x (frameEntry x)) <
      8 * Real.pi ^ 2) :
    ∃ δ > 0, ∃ (g : ℕ → SmoothRiemannianMetric I M) (frame : ∀ n x, OrientedOrthonormalFrameAt (g n) o x),
      let W := fun n x => geometricChiralBlock (g n) o x (frame n x)
      (∀ n, 0 < classYamabeFour o.dimension_eq (g n) ∧
        Integrable (fun x => hilbertSchmidtSq (W n x)) (riemannianVolumeMeasure I M (g n)) ∧
        chiralFrameEnergy (g n) (W n) ≤ 8 * Real.pi ^ 2 - δ) ∧
      Tendsto (fun n => chiralFrameEnergy (g n) (W n)) atTop (𝓝 (sInf (geometricPositiveEnergies o))) := by
  have hMem : chiralFrameEnergy entry (fun x => geometricChiralBlock entry o x (frameEntry x)) ∈
      geometricPositiveEnergies o := ⟨entry, frameEntry, hPositive, hInt, rfl⟩
  obtain ⟨δ, hδ, e, hData, hLimit⟩ :=
    exists_subcriticalEnergySequence (geometricPositiveEnergies_bddBelow o) hMem hSubcritical
  have hWitness (n : ℕ) := (hData n).1
  unfold geometricPositiveEnergies at hWitness
  choose g frame hMetric using hWitness
  refine ⟨δ, hδ, g, frame, ?_, ?_⟩
  · intro n
    obtain ⟨hy, hintegrable, hEnergy⟩ := hMetric n
    exact ⟨hy, hintegrable, hEnergy.le.trans (hData n).2⟩
  · exact hLimit.congr fun n => (hMetric n).2.2.symm

private theorem yamabeOfConformalMetric (o : ManifoldOrientation I M 4)
    (g : SmoothRiemannianMetric I M) (u : C^∞⟮I, M; ℝ⟯) :
    classYamabeFour o.dimension_eq (conformalMetric g u) = classYamabeFour o.dimension_eq g := by
  have hShift : Function.Surjective (fun v : C^∞⟮I, M; ℝ⟯ => u + v) := by
    intro v
    refine ⟨v - u, ?_⟩
    change u + (v - u) = v
    rw [add_comm u, sub_add_cancel]
  unfold classYamabeFour
  simp only [← conformalMetric_add]
  conv_rhs => rw [← hShift.range_comp]
  rfl

/-- If each relevant positive class has a volume-one Yamabe representative
with the same measured energy, a sequence of those representatives has the
same limiting energy and common strict gap. -/
theorem existsPhysicalYamabeMinimizingSequence (o : ManifoldOrientation I M 4)
    (entry : SmoothRiemannianMetric I M) (frameEntry : ∀ x, OrientedOrthonormalFrameAt entry o x)
    (hPositive : 0 < classYamabeFour o.dimension_eq entry)
    (hInt : Integrable (fun x => hilbertSchmidtSq (geometricChiralBlock entry o x (frameEntry x)))
      (riemannianVolumeMeasure I M entry))
    (hSubcritical : chiralFrameEnergy entry (fun x => geometricChiralBlock entry o x (frameEntry x)) <
      8 * Real.pi ^ 2)
    (hNormalize : ∀ (g : SmoothRiemannianMetric I M) (frame : ∀ x, OrientedOrthonormalFrameAt g o x),
      let W := fun x => geometricChiralBlock g o x (frame x)
      0 < classYamabeFour o.dimension_eq g →
      Integrable (fun x => hilbertSchmidtSq (W x)) (riemannianVolumeMeasure I M g) →
      chiralFrameEnergy g W < 8 * Real.pi ^ 2 →
      ∃ (u : C^∞⟮I, M; ℝ⟯) (normalizedFrame : ∀ x, OrientedOrthonormalFrameAt (conformalMetric g u) o x),
        let q := conformalMetric g u
        let Wq := fun x => geometricChiralBlock q o x (normalizedFrame x)
        riemannianVolumeMeasure I M q univ = 1 ∧
        (∀ x, metricScalarAt q x = classYamabeFour o.dimension_eq g) ∧
        Integrable (fun x => hilbertSchmidtSq (Wq x)) (riemannianVolumeMeasure I M q) ∧
        chiralFrameEnergy q Wq = chiralFrameEnergy g W) :
    ∃ δ > 0, ∃ (q : ℕ → SmoothRiemannianMetric I M) (frame : ∀ n x, OrientedOrthonormalFrameAt (q n) o x),
      let W := fun n x => geometricChiralBlock (q n) o x (frame n x)
      (∀ n, 0 < classYamabeFour o.dimension_eq (q n) ∧
        riemannianVolumeMeasure I M (q n) univ = 1 ∧
        (∀ x, metricScalarAt (q n) x = classYamabeFour o.dimension_eq (q n)) ∧
        Integrable (fun x => hilbertSchmidtSq (W n x)) (riemannianVolumeMeasure I M (q n)) ∧
        chiralFrameEnergy (q n) (W n) ≤ 8 * Real.pi ^ 2 - δ) ∧
      Tendsto (fun n => chiralFrameEnergy (q n) (W n)) atTop (𝓝 (sInf (geometricPositiveEnergies o))) := by
  obtain ⟨δ, hδ, g, frame, hData, hLimit⟩ :=
    existsGeometricMinimizingSequence o entry frameEntry hPositive hInt hSubcritical
  have hRep (n : ℕ) := hNormalize (g n) (frame n) (hData n).1 (hData n).2.1
    ((hData n).2.2.trans_lt (sub_lt_self _ hδ))
  choose u normalizedFrame hNorm using hRep
  refine ⟨δ, hδ, fun n => conformalMetric (g n) (u n), normalizedFrame, ?_, ?_⟩
  · intro n
    obtain ⟨hVolume, hScalar, hIntegrable, hEnergy⟩ := hNorm n
    have hY := yamabeOfConformalMetric o (g n) (u n)
    refine ⟨hY.symm ▸ (hData n).1, hVolume, fun x => (hScalar x).trans hY.symm, hIntegrable, ?_⟩
    exact hEnergy.le.trans (hData n).2.2
  · exact hLimit.congr fun n => (hNorm n).2.2.2.symm

end SmoothPoincare
