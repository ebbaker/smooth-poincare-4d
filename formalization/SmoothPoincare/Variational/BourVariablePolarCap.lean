import SmoothPoincare.Variational.BourClosedCapEuler
import Mathlib.Analysis.SpecialFunctions.Trigonometric.ArctanDeriv

/-! # Euler integral of a polar cap with variable warping

The physical radius pushforward and the actual curvature of the closed
metric are explicit inputs. The Euler normalization is `8π² χ`.
-/

noncomputable section

open Filter Set MeasureTheory DifferentialGeometry FirstOrderTwistor
open DifferentialGeometry.Integral.Measure DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Topology.Manifold
open scoped Manifold ContDiff Topology

namespace SmoothPoincare

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)

variable {Y : Type*} [TopologicalSpace Y] [ChartedSpace E₄ Y] [IsManifold I₄ ∞ Y]
  [T2Space Y] [SigmaCompactSpace Y] [BoundarylessManifold I₄ Y]

private local instance : MeasurableSpace Y := borel Y
private local instance : BorelSpace Y := ⟨rfl⟩

/-- Polar volume and sectional curvature on the actual cap subset of one
smooth closed metric. The pushforward to the open interval accounts for
the measure-zero seam and pole. Slot zero is the radial frame coordinate. -/
structure BourVariableCapPolar (g : SmoothRiemannianMetric I₄ Y)
    (o : ManifoldOrientation I₄ Y 4) (frame : ∀ x, OrientedOrthonormalFrameAt g o x)
    (C : Set Y) (L : ℝ) (f : ℝ → ℝ) where
  radius : Y → ℝ
  measurable_radius : Measurable radius
  polar_volume : Measure.map radius ((riemannianVolumeMeasure I₄ Y g).restrict C) =
    (volume.restrict (Ioo 0 L)).withDensity (fun s => ENNReal.ofReal (2 * Real.pi ^ 2 * f s ^ 3))
  curvature : ∀ᵐ x ∂(riemannianVolumeMeasure I₄ Y g).restrict C,
    let s := radius x
    metricCurvatureFrameTensor g o x (frame x) =
      bourClosedCapFrameCurvature (-deriv (deriv f) s / f s) ((1 - deriv f s ^ 2) / f s ^ 2)

/-- The physical Euler integral depends only on the derivatives at the
entrance and pole, once the warped volume and curvature are supplied. -/
theorem bourVariableCapEuler_integral (g : SmoothRiemannianMetric I₄ Y)
    (o : ManifoldOrientation I₄ Y 4) (frame : ∀ x, OrientedOrthonormalFrameAt g o x)
    {C : Set Y} {L : ℝ} {f : ℝ → ℝ}
    (hL : 0 ≤ L) (hf : ContDiff ℝ ∞ f) (hfPos : ∀ s ∈ Ioo 0 L, 0 < f s)
    (hEntry : deriv f 0 = 1) (hPole : deriv f L = -1)
    (P : BourVariableCapPolar g o frame C L f) :
    (∫ x in C, intrinsicEulerDensity g x ∂riemannianVolumeMeasure I₄ Y g) =
      16 * Real.pi ^ 2 := by
  let d : ℝ → ℝ := fun s =>
    6 * (-deriv (deriv f) s / f s) * ((1 - deriv f s ^ 2) / f s ^ 2)
  have hd₁ := (contDiff_infty_iff_deriv.mp hf).2.continuous
  have hd₂ := (contDiff_infty_iff_deriv.mp (contDiff_infty_iff_deriv.mp hf).2).2.continuous
  have hd : Measurable d :=
    (measurable_const.mul (hd₂.measurable.neg.div hf.continuous.measurable)).mul
      ((measurable_const.sub (hd₁.measurable.pow_const 2)).div (hf.continuous.measurable.pow_const 2))
  have hm : Measurable (fun s => ENNReal.ofReal (2 * Real.pi ^ 2 * f s ^ 3)) :=
    (measurable_const.mul (hf.continuous.measurable.pow_const 3)).ennreal_ofReal
  have hCurv : (fun x => intrinsicEulerDensity g x) =ᵐ[(riemannianVolumeMeasure I₄ Y g).restrict C]
      (fun x => d (P.radius x)) := by
    filter_upwards [P.curvature] with x hx
    rw [intrinsicEulerDensity_eq_frameEulerPfaffian g o x (frame x), hx, bourClosedCapFramePfaffian]
  calc
    _ = ∫ x in C, d (P.radius x) ∂riemannianVolumeMeasure I₄ Y g := integral_congr_ae hCurv
    _ = ∫ s, d s ∂Measure.map P.radius ((riemannianVolumeMeasure I₄ Y g).restrict C) :=
      (integral_map P.measurable_radius.aemeasurable hd.aestronglyMeasurable).symm
    _ = ∫ s in Ioo (0 : ℝ) L, (2 * Real.pi ^ 2 * f s ^ 3) * d s := by
      rw [P.polar_volume, integral_withDensity_eq_integral_toReal_smul hm
        (ae_of_all _ fun _ => ENNReal.ofReal_lt_top) d]
      apply integral_congr_ae
      filter_upwards [ae_restrict_mem (μ := volume) measurableSet_Ioo] with s hs
      have hfs : 0 < f s := hfPos s hs
      rw [ENNReal.toReal_ofReal (by positivity : 0 ≤ 2 * Real.pi ^ 2 * f s ^ 3), smul_eq_mul]
    _ = ∫ s in (0 : ℝ)..L, bourClosedCapRadialEuler f s := by
      rw [intervalIntegral.integral_of_le hL, integral_Ioc_eq_integral_Ioo]
      apply integral_congr_ae
      filter_upwards [ae_restrict_mem (μ := volume) measurableSet_Ioo] with s hs
      exact bourClosedCapRadialEuler_eq (hfPos s hs).ne'
    _ = 16 * Real.pi ^ 2 := bourClosedCapRadialEuler_integral hf hEntry hPole

/-- A round pole of spherical radius `a` has `f'(L) = -1` in the
outgoing cap coordinate, independent of the radius of the round model. -/
theorem bourRoundPole_deriv {L a : ℝ} (ha : a ≠ 0) :
    HasDerivAt (fun s : ℝ => a * Real.sin ((L - s) / a)) (-1) L := by
  have h := ((((hasDerivAt_id L).const_sub L).div_const a).sin).const_mul a
  have hd : a * (Real.cos ((L - L) / a) * (-1 / a)) = -1 := by
    rw [sub_self, zero_div, Real.cos_zero, one_mul]
    field_simp
  change HasDerivAt (fun s : ℝ => a * Real.sin ((L - s) / a))
    (a * (Real.cos ((L - L) / a) * (-1 / a))) L at h
  rwa [hd] at h

/-- A cap with a Euclidean entrance germ and a round pole has the same
physical Euler integral as the linear-pole profile. -/
theorem bourVariableCapEuler_roundPole (g : SmoothRiemannianMetric I₄ Y)
    (o : ManifoldOrientation I₄ Y 4) (frame : ∀ x, OrientedOrthonormalFrameAt g o x)
    {C : Set Y} {L r a : ℝ} {f : ℝ → ℝ}
    (hL : 0 ≤ L) (ha : 0 < a) (hf : ContDiff ℝ ∞ f) (hfPos : ∀ s ∈ Ioo 0 L, 0 < f s)
    (hEntry : f =ᶠ[𝓝 0] fun s => r + s)
    (hPole : f =ᶠ[𝓝 L] fun s => a * Real.sin ((L - s) / a))
    (P : BourVariableCapPolar g o frame C L f) :
    (∫ x in C, intrinsicEulerDensity g x ∂riemannianVolumeMeasure I₄ Y g) =
      16 * Real.pi ^ 2 :=
  bourVariableCapEuler_integral g o frame hL hf hfPos
    (hEntry.deriv_eq.trans (((hasDerivAt_id (0 : ℝ)).const_add r).deriv))
    (hPole.deriv_eq.trans (bourRoundPole_deriv ha.ne').deriv) P


/-- The southern round-pole distance in the stereographic chart scaled
at radius `r` decreases at the round length factor. -/
theorem bourStereographicPole_distance_deriv {r ρ : ℝ} (hρ : 0 < ρ) :
    HasDerivAt (fun x : ℝ => 2 * Real.arctan (r / x))
      (-(2 * r / (r ^ 2 + ρ ^ 2))) ρ := by
  have hq : HasDerivAt (fun x : ℝ => r / x) (-r / ρ ^ 2) ρ := by
    have h := (hasDerivAt_const ρ r).div (hasDerivAt_id ρ) hρ.ne'
    have heq : ((fun _ : ℝ => r) / id) = (fun x : ℝ => r / x) := by
      funext x
      rfl
    rw [heq] at h
    simpa only [id_eq, zero_mul, mul_one, zero_sub] using h
  have hd : 2 * (1 / (1 + (r / ρ) ^ 2) * (-r / ρ ^ 2)) =
      -(2 * r / (r ^ 2 + ρ ^ 2)) := by
    have hc : 0 < r ^ 2 + ρ ^ 2 := by positivity
    have hh : 0 < (1 : ℝ) + (r / ρ) ^ 2 := by positivity
    field_simp [hρ.ne', hc.ne', hh.ne']
    ring
  have h := hq.arctan.const_mul 2
  rwa [hd] at h

/-- The physical round slice radius is the sine of that remaining
distance, with the same stereographic scale as the round pole germ. -/
theorem bourStereographicPole_warp_eq_sin {r ρ : ℝ} (hρ : 0 < ρ) :
    (2 * r / (r ^ 2 + ρ ^ 2)) * ρ = Real.sin (2 * Real.arctan (r / ρ)) := by
  have hq : 0 < (1 : ℝ) + (r / ρ) ^ 2 := by positivity
  have hc : 0 < r ^ 2 + ρ ^ 2 := by positivity
  rw [Real.sin_two_mul, Real.sin_arctan, Real.cos_arctan,
    ← mul_div_assoc 2 (r / ρ) (Real.sqrt (1 + (r / ρ) ^ 2)),
    div_mul_div_comm, mul_one, ← pow_two, Real.sq_sqrt hq.le]
  field_simp [hρ.ne', hq.ne', hc.ne']
  ring

end SmoothPoincare
