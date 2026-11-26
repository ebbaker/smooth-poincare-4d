import SmoothPoincare.Variational.ConformalCoreReference
import SmoothPoincare.Variational.AttainedRecognition

/-! # Prescribed-excess Yamabe starts on one entered smooth carrier

The normalization input supplies the conformal Yamabe representative, its
signed curvature measurements, unit volume, and conformal energy identity.
The choice at a prescribed parameter and the fixed-type infimum bounds are
proved from the actual admissible set. -/

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Integral.Measure
open FirstOrderTwistor SectionsAndConnections MeasureTheory Set
open scoped Manifold ContDiff

namespace SmoothPoincare

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M] [ConnectedSpace M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- The supplied conformal Yamabe representative is measured in its own gauge. -/
def BourYamabeNormalization (o : ManifoldOrientation I M 4) : Prop :=
  ∀ (g : SmoothRiemannianMetric I M) (frame : ∀ x, OrientedOrthonormalFrameAt g o x),
    let W := fun x => geometricChiralBlock g o x (frame x)
    0 < classYamabeFour o.dimension_eq g →
    Integrable (fun x => hilbertSchmidtSq (W x)) (riemannianVolumeMeasure I M g) →
    chiralFrameEnergy g W < 8 * Real.pi ^ 2 →
    ∃ (u : C^∞⟮I, M; ℝ⟯) (q : SignedCollarMetric o),
      q.metric = conformalMetric g u ∧ riemannianVolumeMeasure I M q.metric univ = 1 ∧
      (∀ x, metricScalarAt q.metric x = classYamabeFour o.dimension_eq g) ∧
      q.energy .plus = chiralFrameEnergy g W

/-- At each prescribed positive parameter choose a conformal volume-one CSC
start below the entry threshold with physical excess at most its square.
The common gap to the threshold is independent of the entire parameter sequence. -/
theorem exists_bourYamabeStarts (o : ManifoldOrientation I M 4) (entry : SignedCollarMetric o)
    (hPositive : 0 < classYamabeFour o.dimension_eq entry.metric)
    (hEntry : entry.energy .plus < 8 * Real.pi ^ 2) (hNormalize : BourYamabeNormalization o)
    (α : ℕ → ℝ) (hα : ∀ j, 0 < α j) :
    ∃ η > 0, ∃ q : ℕ → SignedCollarMetric o, ∀ j,
      let Y := classYamabeFour o.dimension_eq (q j).metric
      let Istar := sInf (geometricPositiveEnergies o)
      0 < Y ∧ riemannianVolumeMeasure I M (q j).metric univ = 1 ∧
      (∀ x, metricScalarAt (q j).metric x = Y) ∧
      (∫ x, metricScalarAt (q j).metric x ^ 2 ∂riemannianVolumeMeasure I M (q j).metric) = Y ^ 2 ∧
      (q j).energy .plus ≤ 8 * Real.pi ^ 2 - η ∧
      0 ≤ (q j).energy .plus - Istar ∧ (q j).energy .plus - Istar ≤ (α j)^2 := by
  let A := geometricPositiveEnergies o
  let η := (8 * Real.pi ^ 2 - entry.energy .plus) / 2
  have hη : 0 < η := half_pos (sub_pos.mpr hEntry)
  have hm : entry.energy .plus ∈ A := entry.energy_mem_of_positive hPositive
  have hI := csInf_le (geometricPositiveEnergies_bddBelow o) hm
  have hBelow : sInf A < 8 * Real.pi ^ 2 - η := by dsimp [η]; linarith
  have hSelect (j : ℕ) : ∃ q : SignedCollarMetric o,
      let Y := classYamabeFour o.dimension_eq q.metric
      0 < Y ∧ riemannianVolumeMeasure I M q.metric univ = 1 ∧
      (∀ x, metricScalarAt q.metric x = Y) ∧
      (∫ x, metricScalarAt q.metric x ^ 2 ∂riemannianVolumeMeasure I M q.metric) = Y ^ 2 ∧
      q.energy .plus ≤ 8 * Real.pi ^ 2 - η ∧
      0 ≤ q.energy .plus - sInf A ∧ q.energy .plus - sInf A ≤ (α j)^2 := by
    have hTol := sq_pos_of_pos (hα j)
    obtain ⟨g, frame, hg, hi, he⟩ := existsGeometricPositiveMetric_belowThreshold o
      ⟨_, hm⟩ (lt_min hBelow (lt_add_of_pos_right (sInf A) hTol))
    obtain ⟨u, q, hq, hv, hs, hW⟩ := hNormalize g frame hg hi
      (lt_of_lt_of_le (lt_of_lt_of_le he (min_le_left _ _)) (by linarith only [hη]))
    have hY : classYamabeFour o.dimension_eq q.metric = classYamabeFour o.dimension_eq g := by
      rw [hq, classYamabeFour_conformalCore]
    have hpos := hY.symm ▸ hg
    have hc (x : M) := (hs x).trans hY.symm
    have hmass : (∫ x, metricScalarAt q.metric x ^ 2 ∂riemannianVolumeMeasure I M q.metric) =
        (classYamabeFour o.dimension_eq q.metric)^2 := by
      simp only [hc, integral_const, Measure.real, hv, ENNReal.toReal_one, one_smul]
    have hup := (hW.trans_lt he).le
    exact ⟨q, hpos, hv, hc, hmass, hup.trans (min_le_left _ _),
      sub_nonneg.mpr (csInf_le (geometricPositiveEnergies_bddBelow o) (q.energy_mem_of_positive hpos)),
      by linarith only [hup.trans (min_le_right _ _)]⟩
  choose q hq using hSelect
  exact ⟨η, hη, q, hq⟩

end SmoothPoincare
