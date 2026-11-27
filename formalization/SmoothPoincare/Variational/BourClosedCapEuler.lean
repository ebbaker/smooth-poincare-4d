import SmoothPoincare.Variational.BourEulerTransgression
import SmoothPoincare.Variational.BourScaleCalibration
import SmoothPoincare.Variational.BourMarkedCore
import DifferentialGeometry.Topology.Homology.EulerCharacteristic
import Mathlib.Analysis.SpecialFunctions.SmoothTransition
import Mathlib.Analysis.SpecialFunctions.Pow.Asymptotics

/-! # Closed-cap Euler calculation for Euclidean ends

27 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
Actual serving model and effort are unavailable. The Euler integral is in the
`8π² χ` convention, with real two-form Hilbert–Schmidt chiral norms.
-/

noncomputable section

open Filter MeasureTheory Set DifferentialGeometry FirstOrderTwistor
open DifferentialGeometry.Integral.Measure DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Topology.Manifold DifferentialGeometry.Geometry.Metric
open DifferentialGeometry.Tensor0SBundle
open scoped BigOperators ContDiff Manifold Topology

namespace SmoothPoincare

/-- A smooth warped cap with outlet radius `r` and pole at `3*r`. The positive
radius initially increases, as in the retained outward Euclidean germ. -/
def bourClosedCapProfile (r s : ℝ) : ℝ :=
  let χ := Real.smoothTransition (s / r - 1)
  (1 - χ) * (r + s) + χ * (3 * r - s)

theorem bourClosedCapProfile_smooth (r : ℝ) : ContDiff ℝ ∞ (bourClosedCapProfile r) := by
  unfold bourClosedCapProfile
  fun_prop (disch := exact Real.smoothTransition.contDiff)

theorem bourClosedCapProfile_entry {r s : ℝ} (hr : 0 < r) (hs : s ≤ r) :
    bourClosedCapProfile r s = r + s := by
  have h : s / r - 1 ≤ 0 := sub_nonpos.mpr ((div_le_iff₀ hr).2 (by linarith))
  simp [bourClosedCapProfile, Real.smoothTransition.zero_of_nonpos h]

theorem bourClosedCapProfile_pole {r s : ℝ} (hr : 0 < r) (hs : 2 * r ≤ s) :
    bourClosedCapProfile r s = 3 * r - s := by
  have h : 1 ≤ s / r - 1 := by
    have h' := (le_div_iff₀ hr).2 hs
    linarith
  simp [bourClosedCapProfile, Real.smoothTransition.one_of_one_le h]

theorem bourClosedCapProfile_pos {r s : ℝ} (hr : 0 < r) (hs : 0 ≤ s)
    (hPole : s < 3 * r) : 0 < bourClosedCapProfile r s := by
  let χ := Real.smoothTransition (s / r - 1)
  have hχ : 0 ≤ χ := Real.smoothTransition.nonneg _
  have hχ' : χ ≤ 1 := Real.smoothTransition.le_one _
  have hEntry : 0 < r + s := by linarith
  have hEnd : 0 < 3 * r - s := by linarith
  change 0 < (1 - χ) * (r + s) + χ * (3 * r - s)
  rcases hχ.eq_or_lt with h | h
  · simp [← h, hEntry]
  · exact add_pos_of_nonneg_of_pos (mul_nonneg (sub_nonneg.mpr hχ') hEntry.le) (mul_pos h hEnd)

theorem bourClosedCapProfile_endJets {r : ℝ} (hr : 0 < r) :
    deriv (bourClosedCapProfile r) 0 = 1 ∧ deriv (bourClosedCapProfile r) (3 * r) = -1 := by
  have h₀ : bourClosedCapProfile r =ᶠ[𝓝 0] fun s => r + s :=
    (eventually_lt_nhds hr).mono fun _ hs => bourClosedCapProfile_entry hr hs.le
  have h₃ : bourClosedCapProfile r =ᶠ[𝓝 (3 * r)] fun s => 3 * r - s :=
    (eventually_gt_nhds (show 2 * r < 3 * r by linarith)).mono
      fun _ hs => bourClosedCapProfile_pole hr hs.le
  exact ⟨h₀.deriv_eq.trans (((hasDerivAt_id (0 : ℝ)).const_add r).deriv),
    h₃.deriv_eq.trans (((hasDerivAt_id (3 * r)).const_sub (3 * r)).deriv)⟩

private def capDelta (a b : Fin 4) : ℝ := if a = b then 1 else 0

/-- Curvature of the warped metric in the radial-first orthonormal frame,
with radial and tangential sectional curvatures `A` and `B`. -/
def bourClosedCapFrameCurvature (A B : ℝ) : CurvatureFrameTensor :=
  fun a b i j =>
    (if a = 0 ∨ b = 0 then A else B) *
      (capDelta a i * capDelta b j - capDelta a j * capDelta b i)

theorem bourClosedCapFramePfaffian (A B : ℝ) :
    2 * frameEulerPfaffian (bourClosedCapFrameCurvature A B) = 6 * A * B := by
  norm_num [frameEulerPfaffian, wedge22Volume, bourClosedCapFrameCurvature, capDelta]
  ring

/-- The physical radial bulk coefficient, after cancellation of the three
powers of the warping radius against the slice-volume density. -/
def bourClosedCapRadialEuler (f : ℝ → ℝ) (s : ℝ) : ℝ :=
  -(12 * Real.pi ^ 2) * deriv (deriv f) s * (1 - deriv f s ^ 2)

theorem bourClosedCapRadialEuler_eq {f : ℝ → ℝ} {s : ℝ} (h : f s ≠ 0) :
    (2 * Real.pi ^ 2 * f s ^ 3) *
      (6 * (-deriv (deriv f) s / f s) * ((1 - deriv f s ^ 2) / f s ^ 2)) =
        bourClosedCapRadialEuler f s := by
  unfold bourClosedCapRadialEuler
  field_simp
  ring

/-- The cap's contribution is fixed by its two actual end jets. -/
theorem bourClosedCapRadialEuler_integral {f : ℝ → ℝ} {L : ℝ}
    (hf : ContDiff ℝ ∞ f) (hEntry : deriv f 0 = 1) (hPole : deriv f L = -1) :
    (∫ s in (0 : ℝ)..L, bourClosedCapRadialEuler f s) = 16 * Real.pi ^ 2 := by
  have h₁ : ContDiff ℝ ∞ (deriv f) := (contDiff_infty_iff_deriv.mp hf).2
  have h₂ : ContDiff ℝ ∞ (deriv (deriv f)) := (contDiff_infty_iff_deriv.mp h₁).2
  let G : ℝ → ℝ := fun s => -(12 * Real.pi ^ 2) * (deriv f s - deriv f s ^ 3 / 3)
  have hG (s : ℝ) : HasDerivAt G (bourClosedCapRadialEuler f s) s := by
    have hd := ((h₁.differentiable (by simp)) s).hasDerivAt
    convert (hd.sub ((hd.pow 3).div_const 3)).const_mul (-(12 * Real.pi ^ 2)) using 1
    unfold bourClosedCapRadialEuler
    ring
  rw [intervalIntegral.integral_eq_sub_of_hasDerivAt (fun s _ => hG s)]
  · simp only [G, hEntry, hPole]
    ring
  · unfold bourClosedCapRadialEuler
    exact ((continuous_const.mul h₂.continuous).mul
      (continuous_const.sub (h₁.continuous.pow 2))).intervalIntegrable _ _

section Physical

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)

variable {Y : Type*} [TopologicalSpace Y] [ChartedSpace E₄ Y] [IsManifold I₄ ∞ Y]
  [T2Space Y] [SigmaCompactSpace Y] [BoundarylessManifold I₄ Y]

private local instance : MeasurableSpace Y := borel Y
private local instance : BorelSpace Y := ⟨rfl⟩

/-- Polar data on a cap subset of the actual closed metric. The normalized
round link supplies its area `2π²`. The curvature formulas are those of the
warped ball in the oriented frame with the outgoing radius in slot zero.
The volume identity includes the assertion that the seams and pole have
no mass. -/
structure BourClosedCapPolar (g : SmoothRiemannianMetric I₄ Y)
    (o : ManifoldOrientation I₄ Y 4) (frame : ∀ x, OrientedOrthonormalFrameAt g o x)
    (C : Set Y) (r : ℝ) where
  radius : Y → ℝ
  measurable_radius : Measurable radius
  polar_volume : Measure.map radius ((riemannianVolumeMeasure I₄ Y g).restrict C) =
    (volume.restrict (Ioo 0 (3 * r))).withDensity (fun s =>
      ENNReal.ofReal (2 * Real.pi ^ 2 * bourClosedCapProfile r s ^ 3))
  curvature : ∀ᵐ x ∂(riemannianVolumeMeasure I₄ Y g).restrict C,
    let f := bourClosedCapProfile r
    let s := radius x
    metricCurvatureFrameTensor g o x (frame x) =
      bourClosedCapFrameCurvature (-deriv (deriv f) s / f s) ((1 - deriv f s ^ 2) / f s ^ 2)

/-- Compute the physical cap integral from polar volume and curvature on
that cap, using its smooth profile and oriented end jets. -/
theorem bourClosedCapEuler_integral (g : SmoothRiemannianMetric I₄ Y)
    (o : ManifoldOrientation I₄ Y 4) (frame : ∀ x, OrientedOrthonormalFrameAt g o x)
    {C : Set Y} {r : ℝ} (hr : 0 < r) (P : BourClosedCapPolar g o frame C r) :
    (∫ x in C, intrinsicEulerDensity g x ∂riemannianVolumeMeasure I₄ Y g) =
      16 * Real.pi ^ 2 := by
  let f := bourClosedCapProfile r
  let d : ℝ → ℝ := fun s =>
    6 * (-deriv (deriv f) s / f s) * ((1 - deriv f s ^ 2) / f s ^ 2)
  have hf : ContDiff ℝ ∞ f := bourClosedCapProfile_smooth r
  have hd₁ := (contDiff_infty_iff_deriv.mp hf).2.continuous
  have hd₂ := (contDiff_infty_iff_deriv.mp (contDiff_infty_iff_deriv.mp hf).2).2.continuous
  have hd : Measurable d := by
    unfold d
    exact (measurable_const.mul (hd₂.measurable.neg.div hf.continuous.measurable)).mul
      ((measurable_const.sub (hd₁.measurable.pow_const 2)).div (hf.continuous.measurable.pow_const 2))
  have hm : Measurable (fun s => ENNReal.ofReal (2 * Real.pi ^ 2 * f s ^ 3)) := by
    exact (measurable_const.mul (hf.continuous.measurable.pow_const 3)).ennreal_ofReal
  have hCurv : (fun x => intrinsicEulerDensity g x) =ᵐ[(riemannianVolumeMeasure I₄ Y g).restrict C]
      (fun x => d (P.radius x)) := by
    filter_upwards [P.curvature] with x hx
    rw [intrinsicEulerDensity_eq_frameEulerPfaffian g o x (frame x), hx, bourClosedCapFramePfaffian]
  calc
    _ = ∫ x in C, d (P.radius x) ∂riemannianVolumeMeasure I₄ Y g := integral_congr_ae hCurv
    _ = ∫ s, d s ∂Measure.map P.radius ((riemannianVolumeMeasure I₄ Y g).restrict C) :=
      (integral_map P.measurable_radius.aemeasurable hd.aestronglyMeasurable).symm
    _ = ∫ s in Ioo (0 : ℝ) (3 * r), (2 * Real.pi ^ 2 * f s ^ 3) * d s := by
      rw [P.polar_volume, integral_withDensity_eq_integral_toReal_smul hm
        (ae_of_all _ fun _ => ENNReal.ofReal_lt_top) d]
      apply integral_congr_ae
      filter_upwards [ae_restrict_mem (μ := volume) measurableSet_Ioo] with s hs
      have hfs : 0 < f s := bourClosedCapProfile_pos hr hs.1.le hs.2
      rw [ENNReal.toReal_ofReal (by positivity : 0 ≤ 2 * Real.pi ^ 2 * f s ^ 3), smul_eq_mul]
    _ = ∫ s in (0 : ℝ)..(3 * r), bourClosedCapRadialEuler f s := by
      rw [intervalIntegral.integral_of_le (by linarith), integral_Ioc_eq_integral_Ioo]
      apply integral_congr_ae
      filter_upwards [ae_restrict_mem (μ := volume) measurableSet_Ioo] with s hs
      exact bourClosedCapRadialEuler_eq (bourClosedCapProfile_pos hr hs.1.le hs.2).ne'
    _ = 16 * Real.pi ^ 2 :=
      bourClosedCapRadialEuler_integral hf (bourClosedCapProfile_endJets hr).1
        (bourClosedCapProfile_endJets hr).2

omit [SigmaCompactSpace Y] in
/-- One squared curvature bound controls every physical quadratic
shell density. The first three constants reflect the real two-form
Hilbert–Schmidt and ordinary Ricci tensor conventions. -/
theorem bourClosedCapShell_density_bounds (g : SmoothRiemannianMetric I₄ Y)
    (o : ManifoldOrientation I₄ Y 4) (frame : ∀ x, OrientedOrthonormalFrameAt g o x)
    (x : Y) {b : ℝ} (h : intrinsicCurvatureSq g x ≤ b) :
    modifiedChargeDensity o g frame .plus x ≤ b / 4 ∧
      modifiedChargeDensity o g frame .minus x ≤ b / 4 ∧
      modifiedChargeDensity o g frame .ricci x ≤ b / 2 ∧
      modifiedChargeDensity o g frame .scalar x ≤ 6 * b ∧
      |intrinsicEulerDensity g x| ≤ b / 4 := by
  let d := modifiedChargeDensity o g frame
  have hFull : d .full x ≤ b := by
    change modifiedChargeDensity o g frame .full x ≤ b
    rwa [← (intrinsicTerminalCharge_eq_modifiedChargeDensity g o frame x).1]
  have hSplit : d .full x = 4 * (d .plus x + d .minus x) + 2 * d .ricci x + d .scalar x / 6 :=
    metricFrameTensorNormSq_eq_chiral_ricci_scalar g o x (frame x)
  have hNonneg c : 0 ≤ d c x := modifiedChargeDensity_nonneg o g frame c x
  refine ⟨?_, ?_, ?_, ?_, ?_⟩
  · linarith only [hFull, hSplit, hNonneg .minus, hNonneg .ricci, hNonneg .scalar]
  · linarith only [hFull, hSplit, hNonneg .plus, hNonneg .ricci, hNonneg .scalar]
  · linarith only [hFull, hSplit, hNonneg .plus, hNonneg .minus, hNonneg .scalar]
  · linarith only [hFull, hSplit, hNonneg .plus, hNonneg .minus, hNonneg .ricci]
  · rw [abs_le, intrinsicEulerDensity_eq_modifiedChargeDensity g o frame x]
    constructor <;>
      linarith only [hFull, hSplit, hNonneg .plus, hNonneg .minus, hNonneg .ricci, hNonneg .scalar]

/-- On any normalized shell, the four quadratic charges and the absolute
Euler contribution are bounded by the squared curvature bound times the
actual normalized shell volume. -/
theorem bourClosedCapShell_integral_bounds (g : SmoothRiemannianMetric I₄ Y)
    (o : ManifoldOrientation I₄ Y 4) (frame : ∀ x, OrientedOrthonormalFrameAt g o x)
    (A : Set Y) {b : ℝ}
    (hFin : IsFiniteMeasure ((riemannianVolumeMeasure I₄ Y g).restrict A))
    (hCurv : ∀ᵐ x ∂(riemannianVolumeMeasure I₄ Y g).restrict A, intrinsicCurvatureSq g x ≤ b) :
    let v := ((riemannianVolumeMeasure I₄ Y g).restrict A).real univ
    Bour.bourChargeOn o g frame A .plus ≤ (b / 4) * v ∧
      Bour.bourChargeOn o g frame A .minus ≤ (b / 4) * v ∧
      Bour.bourChargeOn o g frame A .ricci ≤ (b / 2) * v ∧
      Bour.bourChargeOn o g frame A .scalar ≤ (6 * b) * v ∧
      |∫ x in A, intrinsicEulerDensity g x ∂riemannianVolumeMeasure I₄ Y g| ≤ (b / 4) * v := by
  let μ := (riemannianVolumeMeasure I₄ Y g).restrict A
  let _ : IsFiniteMeasure μ := hFin
  let d := modifiedChargeDensity o g frame
  have hBd {c : ModifiedChargeComponent} {B : ℝ}
      (hb : ∀ x, intrinsicCurvatureSq g x ≤ b → d c x ≤ B) :
      Bour.bourChargeOn o g frame A c ≤ B * μ.real univ := by
    refine (le_abs_self _).trans ?_
    change |∫ x, d c x ∂μ| ≤ B * μ.real univ
    rw [← Real.norm_eq_abs]
    apply norm_integral_le_of_norm_le_const
    filter_upwards [hCurv] with x hx
    rw [Real.norm_eq_abs, abs_of_nonneg (modifiedChargeDensity_nonneg o g frame c x)]
    exact hb x hx
  refine ⟨hBd (fun x h => (bourClosedCapShell_density_bounds g o frame x h).1),
    hBd (fun x h => (bourClosedCapShell_density_bounds g o frame x h).2.1),
    hBd (fun x h => (bourClosedCapShell_density_bounds g o frame x h).2.2.1),
    hBd (fun x h => (bourClosedCapShell_density_bounds g o frame x h).2.2.2.1),
    ?_⟩
  rw [← Real.norm_eq_abs]
  apply norm_integral_le_of_norm_le_const (μ := μ) (f := intrinsicEulerDensity g)
  exact hCurv.mono fun x h => by
    simpa only [Real.norm_eq_abs] using (bourClosedCapShell_density_bounds g o frame x h).2.2.2.2

/-- At unit radius the ordinary Ricci square is also bounded, without
requiring the straightened shell itself to be scalar flat. -/
theorem bourClosedCapShell_ordinaryRicci_integral_bound (g : SmoothRiemannianMetric I₄ Y)
    (o : ManifoldOrientation I₄ Y 4) (frame : ∀ x, OrientedOrthonormalFrameAt g o x)
    (A : Set Y) {b : ℝ}
    (hFin : IsFiniteMeasure ((riemannianVolumeMeasure I₄ Y g).restrict A))
    (hCurv : ∀ᵐ x ∂(riemannianVolumeMeasure I₄ Y g).restrict A, intrinsicCurvatureSq g x ≤ b) :
    (∫ x in A, normSq0S g x 2 (metricRicciAt g x) ∂riemannianVolumeMeasure I₄ Y g) ≤
      (2 * b) * ((riemannianVolumeMeasure I₄ Y g).restrict A).real univ := by
  let μ := (riemannianVolumeMeasure I₄ Y g).restrict A
  let _ : IsFiniteMeasure μ := hFin
  have hBound : ∀ᵐ x ∂μ, ‖normSq0S g x 2 (metricRicciAt g x)‖ ≤ 2 * b := by
    filter_upwards [hCurv] with x hx
    have hd := bourClosedCapShell_density_bounds g o frame x hx
    have hRic := (intrinsicTerminalCharge_eq_modifiedChargeDensity g o frame x).2.1
    rw [intrinsicTraceFreeRicciSq_eq_ricciNormSq_sub_scalarSq] at hRic
    have hScalar : metricScalarAt g x ^ 2 ≤ 6 * b := hd.2.2.2.1
    rw [Real.norm_eq_abs, abs_of_nonneg (normSq0S_nonneg g x 2 _)]
    linarith only [hRic, hd.2.2.1, hScalar]
  have hIntegral := norm_integral_le_of_norm_le_const hBound
  rw [Real.norm_eq_abs] at hIntegral
  exact (le_abs_self _).trans hIntegral

/-- The pieces of one closed metric, with seams assigned measurably to one
piece each. The piece indexed by `none` is the unchanged core interior.
The two copies of the end index index the straightened shells and caps. -/
structure BourClosedCappedCore (Y : Type) [TopologicalSpace Y] [ChartedSpace E₄ Y]
    [IsManifold I₄ ∞ Y] [T2Space Y] [SigmaCompactSpace Y] [BoundarylessManifold I₄ Y]
    (k : ℕ) (r : ℝ) where
  metric : SmoothRiemannianMetric I₄ Y
  orientation : ManifoldOrientation I₄ Y 4
  frame : ∀ x, OrientedOrthonormalFrameAt metric orientation x
  part : Option (Fin k ⊕ Fin k) → Set Y
  measurable_part : ∀ i, MeasurableSet (part i)
  disjoint_part : Pairwise (fun i j => Disjoint (part i) (part j))
  covers : (⋃ i, part i) = univ
  integrable_euler : Integrable (intrinsicEulerDensity metric) (riemannianVolumeMeasure I₄ Y metric)
  polar : ∀ j : Fin k, BourClosedCapPolar metric orientation frame (part (some (.inr j))) r

variable {N : Type} [TopologicalSpace N] [ChartedSpace E₄ N] [IsManifold I₄ ∞ N]
  [T2Space N] [SigmaCompactSpace N] [BoundarylessManifold I₄ N]

private local instance : MeasurableSpace N := borel N
private local instance : BorelSpace N := ⟨rfl⟩

/-- The finite decomposition comes from integrating over the pieces of the
one closed metric. Each end cap is evaluated using its radial primitive. -/
theorem bourClosedCappedCore_integral {k : ℕ} {r : ℝ}
    (C : BourClosedCappedCore N k r) (hr : 0 < r) :
    let μ := riemannianVolumeMeasure I₄ N C.metric
    let d := intrinsicEulerDensity C.metric
    (∫ x, d x ∂μ) = (∫ x in C.part none, d x ∂μ) +
      (∑ j : Fin k, ∫ x in C.part (some (.inl j)), d x ∂μ) + (k : ℝ) * (16 * Real.pi ^ 2) := by
  intro μ d
  rw [← setIntegral_univ, ← C.covers, integral_iUnion_fintype C.measurable_part
    C.disjoint_part (fun _ => C.integrable_euler.integrableOn)]
  rw [Fintype.sum_option, Fintype.sum_sum_type, ← add_assoc]
  simp only [d, μ, fun j : Fin k =>
    bourClosedCapEuler_integral C.metric C.orientation C.frame hr (C.polar j),
    Finset.sum_const, Finset.card_univ, Fintype.card_fin, nsmul_eq_mul]

/-- The fixed-relative-width cutoff must supply the physical volume bound
and the ordered full squared curvature bound at unit radius. Homothety
then estimates the original shell's Euler integral with the same power. -/
theorem bourClosedCapShell_error (g : SmoothRiemannianMetric I₄ N)
    (o : ManifoldOrientation I₄ N 4) (A : Set N)
    {r b v : ℝ} (hr : 0 < r) (hb : 0 ≤ b)
    (hFin : IsFiniteMeasure ((riemannianVolumeMeasure I₄ N
      (scaleMetric (r ^ 2)⁻¹ (by positivity) g)).restrict A))
    (hVol : ((riemannianVolumeMeasure I₄ N
      (scaleMetric (r ^ 2)⁻¹ (by positivity) g)).restrict A).real univ ≤ v)
    (hCurv : ∀ᵐ x ∂(riemannianVolumeMeasure I₄ N
      (scaleMetric (r ^ 2)⁻¹ (by positivity) g)).restrict A,
        intrinsicCurvatureSq (scaleMetric (r ^ 2)⁻¹ (by positivity) g) x ≤ b) :
    |∫ x in A, intrinsicEulerDensity g x ∂riemannianVolumeMeasure I₄ N g| ≤ b / 4 * v := by
  let t : ℝ := (r ^ 2)⁻¹
  have ht : 0 < t := by positivity
  let G := scaleMetric t ht g
  rw [← Bour.bourEulerIntegral_homothety (by simp : Module.finrank ℝ E₄ = 4) g ht A]
  exact (bourClosedCapShell_integral_bounds G o (orientedOrthonormalFrameAt G o) A hFin hCurv).2.2.2.2.trans
    (mul_le_mul_of_nonneg_left hVol (div_nonneg hb (by norm_num)))

variable {X : Type} [TopologicalSpace X] [ChartedSpace E₄ X] [IsManifold I₄ ∞ X]
  [T2Space X] [SigmaCompactSpace X] [BoundarylessManifold I₄ X]
  [CompactSpace N]

private local instance : MeasurableSpace X := borel X
private local instance : BorelSpace X := ⟨rfl⟩

/-- Physical input for a closed-cap exhaustion. Each stage is one whole
closed carrier with every end straightened and filled simultaneously.
The actual capped cores are identified with a common carrier `N`.
The topology, exact unchanged-piece transport, the normalized shell
estimates and closed Chern–Gauss–Bonnet are supplier inputs. -/
structure BourClosedCapExhaustion (g : SmoothRiemannianMetric I₄ X)
    (N : Type) [TopologicalSpace N] [ChartedSpace E₄ N] [IsManifold I₄ ∞ N]
    [T2Space N] [SigmaCompactSpace N] [BoundarylessManifold I₄ N] [CompactSpace N]
    (k : ℕ) where
  retained : ℕ → Set X
  measurable_retained : ∀ n, MeasurableSet (retained n)
  monotone_retained : Monotone retained
  exhausts : (⋃ n, retained n) = univ
  radius : ℕ → ℝ
  radius_pos : ∀ n, 0 < radius n
  radius_tends : Tendsto radius atTop atTop
  capped : ∀ n, BourClosedCappedCore N k (radius n)
  retained_integral : ∀ n,
    (∫ x in (capped n).part none, intrinsicEulerDensity (capped n).metric x
      ∂riemannianVolumeMeasure I₄ N (capped n).metric) =
    ∫ x in retained n, intrinsicEulerDensity g x ∂riemannianVolumeMeasure I₄ X g
  decay : ℝ
  decay_pos : 0 < decay
  curvatureBound : Fin k → ℝ
  curvatureBound_nonneg : ∀ j, 0 ≤ curvatureBound j
  volumeBound : Fin k → ℝ
  shell_volume : ∀ n j,
    let G := scaleMetric (radius n ^ 2)⁻¹
      (inv_pos.mpr (sq_pos_of_pos (radius_pos n))) (capped n).metric
    ((riemannianVolumeMeasure I₄ N G).restrict ((capped n).part (some (.inl j)))).real univ
      ≤ volumeBound j
  shell_curvature : ∀ n j,
    let G := scaleMetric (radius n ^ 2)⁻¹
      (inv_pos.mpr (sq_pos_of_pos (radius_pos n))) (capped n).metric
    ∀ᵐ x ∂(riemannianVolumeMeasure I₄ N G).restrict ((capped n).part (some (.inl j))),
      intrinsicCurvatureSq G x ≤ curvatureBound j * radius n ^ (-(2 * decay))
  eulerCharacteristic : DifferentialGeometry.Homology.eulerChar ℚ (TopCat.of N) = 2
  closedGaussBonnet : ∀ n,
    (∫ x, intrinsicEulerDensity (capped n).metric x
      ∂riemannianVolumeMeasure I₄ N (capped n).metric) =
      8 * Real.pi ^ 2 * (DifferentialGeometry.Homology.eulerChar ℚ (TopCat.of N) : ℝ)

/-- Finite ordered full curvature supplies the three integrability
inputs of the scalar-flat exhaustion once the signed densities are
physically measurable. -/
theorem bourClosedCaps_integrable_charges (g : SmoothRiemannianMetric I₄ X)
    (o : ManifoldOrientation I₄ X 4) (frame : ∀ x, OrientedOrthonormalFrameAt g o x)
    (hFull : Integrable (intrinsicCurvatureSq g) (riemannianVolumeMeasure I₄ X g))
    (hMeas : ∀ c, AEStronglyMeasurable (modifiedChargeDensity o g frame c)
      (riemannianVolumeMeasure I₄ X g)) :
    Integrable (modifiedChargeDensity o g frame .plus) (riemannianVolumeMeasure I₄ X g) ∧
      Integrable (modifiedChargeDensity o g frame .minus) (riemannianVolumeMeasure I₄ X g) ∧
      Integrable (modifiedChargeDensity o g frame .ricci) (riemannianVolumeMeasure I₄ X g) := by
  let d := modifiedChargeDensity o g frame
  let μ := riemannianVolumeMeasure I₄ X g
  have hIntegrable {c : ModifiedChargeComponent} {b : ℝ}
      (hBound : ∀ x, d c x ≤ b * intrinsicCurvatureSq g x) : Integrable (d c) μ :=
    (hFull.const_mul b).mono_nonneg (hMeas c) (ae_of_all μ (modifiedChargeDensity_nonneg o g frame c))
      (ae_of_all μ hBound)
  refine ⟨hIntegrable (b := 1 / 4) ?_, hIntegrable (b := 1 / 4) ?_, hIntegrable (b := 1 / 2) ?_⟩
  · intro x
    simpa only [one_div_mul_eq_div] using (bourClosedCapShell_density_bounds g o frame x le_rfl).1
  · intro x
    simpa only [one_div_mul_eq_div] using (bourClosedCapShell_density_bounds g o frame x le_rfl).2.1
  · intro x
    simpa only [one_div_mul_eq_div] using (bourClosedCapShell_density_bounds g o frame x le_rfl).2.2.1

/-- Each cap contributes exactly `16π²`. Each shell disappears separately.
The unchanged compact pieces exhaust the physical scalar-flat charges. -/
theorem bourClosedCaps_ricci_identity {k : ℕ} (g : SmoothRiemannianMetric I₄ X)
    (o : ManifoldOrientation I₄ X 4) (frame : ∀ x, OrientedOrthonormalFrameAt g o x)
    (C : BourClosedCapExhaustion g N k)
    (hScalar : ∀ᵐ x ∂riemannianVolumeMeasure I₄ X g, metricScalarAt g x = 0)
    (hPlus : Integrable (modifiedChargeDensity o g frame .plus) (riemannianVolumeMeasure I₄ X g))
    (hMinus : Integrable (modifiedChargeDensity o g frame .minus) (riemannianVolumeMeasure I₄ X g))
    (hRicci : Integrable (modifiedChargeDensity o g frame .ricci) (riemannianVolumeMeasure I₄ X g)) :
    Bour.bourChargeOn o g frame univ .ricci =
      2 * (Bour.bourChargeOn o g frame univ .plus + Bour.bourChargeOn o g frame univ .minus) +
        32 * Real.pi ^ 2 * ((k : ℝ) - 1) := by
  let shell := fun (n : ℕ) (j : Fin k) =>
    ∫ x in (C.capped n).part (some (.inl j)), intrinsicEulerDensity (C.capped n).metric x
      ∂riemannianVolumeMeasure I₄ N (C.capped n).metric
  have hShell (j : Fin k) : Tendsto (fun n => shell n j) atTop (𝓝 0) := by
    have hp := (tendsto_rpow_neg_atTop (show 0 < 2 * C.decay by
      exact mul_pos (by norm_num) C.decay_pos)).comp C.radius_tends
    have hBound : Tendsto (fun n => C.curvatureBound j * C.radius n ^ (-(2 * C.decay)) / 4 *
        C.volumeBound j) atTop (𝓝 0) := by
      simpa using ((hp.const_mul (C.curvatureBound j)).div_const 4).mul_const (C.volumeBound j)
    refine tendsto_iff_dist_tendsto_zero.2 (squeeze_zero (fun _ => dist_nonneg) ?_ hBound)
    intro n
    rw [Real.dist_eq, sub_zero]
    let G := scaleMetric (C.radius n ^ 2)⁻¹
      (inv_pos.mpr (sq_pos_of_pos (C.radius_pos n))) (C.capped n).metric
    let _ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts G
    exact bourClosedCapShell_error (C.capped n).metric (C.capped n).orientation
      ((C.capped n).part (some (.inl j))) (C.radius_pos n)
      (mul_nonneg (C.curvatureBound_nonneg j) (Real.rpow_nonneg (C.radius_pos n).le _))
      inferInstance (C.shell_volume n j) (C.shell_curvature n j)
  have hShellSum : Tendsto (fun n => ∑ j : Fin k, shell n j) atTop (𝓝 0) := by
    simpa using tendsto_finsetSum (Finset.univ : Finset (Fin k)) (fun j _ => hShell j)
  have hBulk (n : ℕ) :
      (∫ x in C.retained n, intrinsicEulerDensity g x ∂riemannianVolumeMeasure I₄ X g) =
        Bour.bourChargeOn o g frame (C.retained n) .plus +
          Bour.bourChargeOn o g frame (C.retained n) .minus -
          Bour.bourChargeOn o g frame (C.retained n) .ricci / 2 :=
    bourEulerBulk_setIntegral_eq_scalarFlat g o frame (C.retained n)
      (ae_restrict_of_ae hScalar) hPlus.integrableOn hMinus.integrableOn hRicci.integrableOn
  have hExhaust (c : ModifiedChargeComponent)
      (hInt : Integrable (modifiedChargeDensity o g frame c) (riemannianVolumeMeasure I₄ X g)) :
      Tendsto (fun n => Bour.bourChargeOn o g frame (C.retained n) c) atTop
        (𝓝 (Bour.bourChargeOn o g frame univ c)) := by
    unfold Bour.bourChargeOn
    rw [← C.exhausts]
    exact tendsto_setIntegral_of_monotone C.measurable_retained C.monotone_retained hInt.integrableOn
  have hCoreLimit := ((hExhaust .plus hPlus).add (hExhaust .minus hMinus)).sub
    ((hExhaust .ricci hRicci).div_const 2)
  have hGlobal := (hCoreLimit.add hShellSum).add_const ((k : ℝ) * (16 * Real.pi ^ 2))
  have hGB (n : ℕ) : 16 * Real.pi ^ 2 =
      Bour.bourChargeOn o g frame (C.retained n) .plus +
        Bour.bourChargeOn o g frame (C.retained n) .minus -
        Bour.bourChargeOn o g frame (C.retained n) .ricci / 2 +
        (∑ j : Fin k, shell n j) + (k : ℝ) * (16 * Real.pi ^ 2) := by
    have hf := bourClosedCappedCore_integral (C.capped n) (C.radius_pos n)
    dsimp only at hf
    rw [C.closedGaussBonnet, C.eulerCharacteristic, C.retained_integral, hBulk] at hf
    norm_num at hf ⊢
    linarith only [hf]
  have he := tendsto_nhds_unique tendsto_const_nhds (hGlobal.congr (fun n => (hGB n).symm))
  linarith only [he]

/-- Scalar flatness turns the trace-free Ricci charge into the ordinary
physical Ricci tensor square over the original complete metric. -/
theorem bourClosedCaps_ordinaryRicci (g : SmoothRiemannianMetric I₄ X)
    (o : ManifoldOrientation I₄ X 4) (frame : ∀ x, OrientedOrthonormalFrameAt g o x)
    (hScalar : ∀ᵐ x ∂riemannianVolumeMeasure I₄ X g, metricScalarAt g x = 0) :
    Bour.bourChargeOn o g frame univ .ricci =
      ∫ x, normSq0S g x 2 (metricRicciAt g x) ∂riemannianVolumeMeasure I₄ X g := by
  rw [Bour.bourChargeOn, setIntegral_univ]
  apply integral_congr_ae
  filter_upwards [hScalar] with x hx
  rw [← (intrinsicTerminalCharge_eq_modifiedChargeDensity g o frame x).2.1,
    intrinsicTraceFreeRicciSq_eq_ricciNormSq_sub_scalarSq, hx]
  ring

/-- The strict ordinary Ricci ceiling excludes any second Euclidean end.
The output includes the global Euler identity with the same signed energies. -/
theorem bour_closedCaps_force_oneEnd {k : ℕ} (hk : 0 < k)
    (g : SmoothRiemannianMetric I₄ X) (o : ManifoldOrientation I₄ X 4)
    (frame : ∀ x, OrientedOrthonormalFrameAt g o x)
    (C : BourClosedCapExhaustion g N k)
    (hScalar : ∀ᵐ x ∂riemannianVolumeMeasure I₄ X g, metricScalarAt g x = 0)
    (hPlus : Integrable (modifiedChargeDensity o g frame .plus) (riemannianVolumeMeasure I₄ X g))
    (hMinus : Integrable (modifiedChargeDensity o g frame .minus) (riemannianVolumeMeasure I₄ X g))
    (hRicci : Integrable (modifiedChargeDensity o g frame .ricci) (riemannianVolumeMeasure I₄ X g))
    (hD : (∫ x, normSq0S g x 2 (metricRicciAt g x) ∂riemannianVolumeMeasure I₄ X g) <
      32 * Real.pi ^ 2) :
    k = 1 ∧ Bour.bourChargeOn o g frame univ .ricci =
      2 * (Bour.bourChargeOn o g frame univ .plus + Bour.bourChargeOn o g frame univ .minus) := by
  let m := Bour.bourChargeOn o g frame univ
  have hE := bourClosedCaps_ricci_identity g o frame C hScalar hPlus hMinus hRicci
  have hBulk : m .plus + m .minus - m .ricci / 2 = 8 * Real.pi ^ 2 * (2 - 2 * (k : ℝ)) := by
    change m .ricci = _ at hE
    linarith only [hE]
  have hNonneg c : 0 ≤ m c :=
    integral_nonneg (modifiedChargeDensity_nonneg o g frame c)
  have hStrict : m .ricci < 32 * Real.pi ^ 2 := by
    change Bour.bourChargeOn o g frame univ .ricci < _
    rwa [bourClosedCaps_ordinaryRicci g o frame hScalar]
  have hOne := bourOneEuclideanEnd hk (hNonneg .plus) (hNonneg .minus) hBulk
    (le_refl (m .ricci)) hStrict
  refine ⟨hOne, ?_⟩
  simpa [hOne] using hE

/-- With the independent signature identity and separate source liminf
bounds, the same physical one-ended limit has equal chiral energies and
inherits both source and Ricci ceilings. -/
theorem bourClosedCaps_signedBounds {k : ℕ} (hk : 0 < k)
    (g : SmoothRiemannianMetric I₄ X) (o : ManifoldOrientation I₄ X 4)
    (frame : ∀ x, OrientedOrthonormalFrameAt g o x)
    (C : BourClosedCapExhaustion g N k)
    (hScalar : ∀ᵐ x ∂riemannianVolumeMeasure I₄ X g, metricScalarAt g x = 0)
    (hPlus : Integrable (modifiedChargeDensity o g frame .plus) (riemannianVolumeMeasure I₄ X g))
    (hMinus : Integrable (modifiedChargeDensity o g frame .minus) (riemannianVolumeMeasure I₄ X g))
    (hRicci : Integrable (modifiedChargeDensity o g frame .ricci) (riemannianVolumeMeasure I₄ X g))
    {dMax e : ℝ}
    (hD : (∫ x, normSq0S g x 2 (metricRicciAt g x) ∂riemannianVolumeMeasure I₄ X g) ≤ dMax)
    (hCeiling : dMax < 32 * Real.pi ^ 2)
    (hSignature : Bour.bourChargeOn o g frame univ .plus - Bour.bourChargeOn o g frame univ .minus = 0)
    (hSourcePlus : Bour.bourChargeOn o g frame univ .plus ≤ e)
    (hSourceMinus : Bour.bourChargeOn o g frame univ .minus ≤ e) :
    let ePlus := Bour.bourChargeOn o g frame univ .plus
    let eMinus := Bour.bourChargeOn o g frame univ .minus
    let D := Bour.bourChargeOn o g frame univ .ricci
    k = 1 ∧ ePlus = eMinus ∧ D = 4 * ePlus ∧ ePlus ≤ min e (dMax / 4) ∧ eMinus ≤ min e (dMax / 4) := by
  obtain ⟨hK, hE⟩ := bour_closedCaps_force_oneEnd hk g o frame C hScalar hPlus hMinus hRicci
    (hD.trans_lt hCeiling)
  have hBulk : Bour.bourChargeOn o g frame univ .plus + Bour.bourChargeOn o g frame univ .minus -
      Bour.bourChargeOn o g frame univ .ricci / 2 = 0 := by linarith only [hE]
  rw [← bourClosedCaps_ordinaryRicci g o frame hScalar] at hD
  exact ⟨hK, bourSignedEndEnergy hBulk hSignature hD hSourcePlus hSourceMinus⟩

end Physical

end SmoothPoincare
