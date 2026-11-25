import FirstOrderTwistor.GeometricCutDescent
import Mathlib.Topology.Order.IntermediateValue
import Mathlib.Analysis.Real.Sqrt

/-! # Positive paths below the scalar-flat wall

All metrics are on a single closed oriented source. The connected parameter
can be a bounded interval or the full ray of stretch lengths.
-/

open DifferentialGeometry DifferentialGeometry.Integral.Measure FirstOrderTwistor
open MeasureTheory SectionsAndConnections
open scoped Manifold ContDiff

namespace SmoothPoincare

/-- A continuous sign detector starting positive cannot change sign on a
connected parameter set on which the energy stays strictly below its zero wall. -/
theorem positiveAlongSubcriticalPath {P : Type*} [TopologicalSpace P] [PreconnectedSpace P]
    (level energy : P → ℝ) (wall : ℝ) (start : P) (hcont : Continuous level)
    (hstart : 0 < level start) (hzero : ∀ t, level t = 0 → wall ≤ energy t)
    (hband : ∀ t, energy t < wall) (t : P) : 0 < level t := by
  by_contra! h
  obtain ⟨s, hs⟩ := intermediate_value_univ t start hcont
    (show (0 : ℝ) ∈ Set.Icc (level t) (level start) from ⟨h, hstart.le⟩)
  exact (hband s).not_ge (hzero s hs)

section MetricPath

variable {E H M P : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [I.Boundaryless] [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M] [Nonempty M] [TopologicalSpace P] [PreconnectedSpace P]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- For a family of actual metrics, produce membership of every energy and
a common positive Yamabe floor from a common energy gap. Continuity and sign
comparison of the detector and the normalized Euler inequality in the Yamabe
representative of each class are explicit analytic inputs. -/
theorem admissibleAlongSubcriticalMetricPath
    (o : ManifoldOrientation I M 4) (g : P → SmoothRiemannianMetric I M)
    (frame : ∀ t x, OrientedOrthonormalFrameAt (g t) o x)
    (level : P → ℝ) (start : P) (gap : ℝ) (hgap : 0 < gap)
    (hcont : Continuous level) (hstart : 0 < level start)
    (hsign : ∀ t, 0 < level t ↔ 0 < classYamabeFour o.dimension_eq (g t))
    (hzero : ∀ t, level t = 0 → classYamabeFour o.dimension_eq (g t) = 0)
    (hint : ∀ t, Integrable (fun x => hilbertSchmidtSq (geometricChiralBlock (g t) o x (frame t x)))
      (riemannianVolumeMeasure I M (g t)))
    (hEuler : ∀ t, 48 * (8 * Real.pi ^ 2 -
      chiralFrameEnergy (g t) (fun x => geometricChiralBlock (g t) o x (frame t x))) ≤
      classYamabeFour o.dimension_eq (g t) ^ 2)
    (hband : ∀ t, chiralFrameEnergy (g t) (fun x => geometricChiralBlock (g t) o x (frame t x)) ≤
      8 * Real.pi ^ 2 - gap) (t : P) :
    let e := chiralFrameEnergy (g t) (fun x => geometricChiralBlock (g t) o x (frame t x))
    0 < classYamabeFour o.dimension_eq (g t) ∧
      Real.sqrt (48 * gap) ≤ classYamabeFour o.dimension_eq (g t) ∧
      e ∈ geometricPositiveEnergies o := by
  let energy := fun s => chiralFrameEnergy (g s) (fun x => geometricChiralBlock (g s) o x (frame s x))
  have hwall (s : P) (hz : level s = 0) : 8 * Real.pi ^ 2 ≤ energy s := by
    have he := hEuler s
    rw [hzero s hz, zero_pow (by decide : 2 ≠ 0)] at he
    dsimp [energy]
    linarith only [he]
  have hpos := (hsign t).mp (positiveAlongSubcriticalPath level energy _ start hcont hstart hwall
    (fun s => (hband s).trans_lt (sub_lt_self _ hgap)) t)
  exact ⟨hpos, Real.sqrt_le_iff.mpr ⟨hpos.le, by linarith only [hEuler t, hband t]⟩,
    g t, frame t, hpos, hint t, rfl⟩

end MetricPath
end SmoothPoincare
