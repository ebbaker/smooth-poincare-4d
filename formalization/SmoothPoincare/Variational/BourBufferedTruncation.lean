import SmoothPoincare.Variational.BourVariablePolarCap
import SmoothPoincare.Variational.StereographicCapMetric
import DifferentialGeometry.Topology.Homology.SphereEuler
import DifferentialGeometry.Geometry.Curvature.Naturality.MetricLocality
import DifferentialGeometry.Geometry.Curvature.Naturality.Pullback.LocalNorm
import DifferentialGeometry.Geometry.Measure.LocalIsometry
import DifferentialGeometry.Geometry.Comparison.Volume.VolumeNaturality
import DifferentialGeometry.Topology.Manifold.SphereOrientation
import DifferentialGeometry.Geometry.Curvature.Coordinates.MetricJet.CurvatureFromJet
import DifferentialGeometry.Geometry.Metric.Euclidean.PolarCoordinates
import DifferentialGeometry.Geometry.Metric.Sphere.Round.Intrinsic

/-! # One actual buffered Euclidean truncation and its closed spherical cap

27 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
Actual serving model and effort are unavailable.
-/

noncomputable section

open DifferentialGeometry DifferentialGeometry.Geometry DifferentialGeometry.Topology.Manifold
open DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Integral.Measure
open DifferentialGeometry.Tensor0SBundle
open Filter FirstOrderTwistor MeasureTheory Metric SectionsAndConnections Set
open scoped ContDiff Manifold Topology RealInnerProductSpace

namespace SmoothPoincare

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)
local notation "S₄" => StandardFourSphere

attribute [local instance] Classical.propDecidable

private local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 5)) = 4 + 1) := ⟨by simp⟩
private local instance : MeasurableSpace E₄ := borel E₄
private local instance : BorelSpace E₄ := ⟨rfl⟩
private local instance : MeasurableSpace S₄ := borel S₄
private local instance : BorelSpace S₄ := ⟨rfl⟩

/-- The actual stereographic marking of the whole Euclidean core, its
boundary and all bounded buffers, on one compact sphere. -/
def bourBufferedSphereChart (r : ℝ) (hr : 0 < r) :
    PartialDiffeomorph I₄ I₄ E₄ S₄ ∞ :=
  (transportedCapPocketChart r hr).symm

private theorem bourBufferedSphereChart_source (r : ℝ) (hr : 0 < r) :
    (bourBufferedSphereChart r hr).source = univ :=
  transportedCapPocketChart_target r hr

private theorem bourBufferedSphereChart_target (r : ℝ) (hr : 0 < r) :
    (bourBufferedSphereChart r hr).target = {transportedCapNorthPole}ᶜ := by
  change (transportedCapPocketChart r hr).source = _
  rw [transportedCapPocketChart_source, transportedCapStereographic_source]

/-- The cap is the inverse stereographic disk followed by the actual
equatorial reflection. It maps the second whole disk on the same sphere. -/
def bourBufferedSphereCapChart (r : ℝ) (hr : 0 < r) :
    PartialDiffeomorph I₄ I₄ E₄ S₄ ∞ :=
  (bourBufferedSphereChart r hr).trans RoundEquatorialCaps.flip.toPartialDiffeomorph

private theorem bourBufferedSphereChart_image (r : ℝ) (hr : 0 < r) :
    bourBufferedSphereChart r hr '' closedBall 0 r = standardFourSphereCap := by
  let C := transportedCapPocketChart r hr
  change C.symm '' closedBall 0 r = standardFourSphereCap
  rw [← transportedCapPocketChart_image_cap r hr]
  exact C.symm_image_image_of_subset_source (by
    rw [transportedCapPocketChart_source]
    exact transportedCapStereographic_cap_in_source)

private theorem bourBufferedSphereChart_openEmbedding (r : ℝ) (hr : 0 < r) :
    Topology.IsOpenEmbedding (bourBufferedSphereChart r hr : E₄ → S₄) := by
  let Q := bourBufferedSphereChart r hr
  have hs (x : E₄) : x ∈ Q.source := by
    rw [bourBufferedSphereChart_source]
    trivial
  have hQ : IsLocalDiffeomorph I₄ I₄ ∞ (Q : E₄ → S₄) :=
    fun x => Q.isLocalDiffeomorphAt I₄ I₄ ∞ (hs x)
  exact .of_continuous_injective_isOpenMap hQ.contMDiff.continuous
    (fun _ _ h => Q.injOn (hs _) (hs _) h) hQ.isOpenMap

/-- The two marked balls cover the actual closed carrier and meet precisely
at the marked radius sphere, with both inverse charts agreeing there. -/
theorem bourBufferedSphere_markedDisk (r : ℝ) (hr : 0 < r) :
    let Q := bourBufferedSphereChart r hr
    let P := bourBufferedSphereCapChart r hr
    Q '' closedBall 0 r = standardFourSphereCap ∧
      P '' closedBall 0 r = (interior standardFourSphereCap)ᶜ ∧
      (∀ x ∈ sphere 0 r, Q x = P x ∧ Q.symm (P x) = x ∧ P.symm (Q x) = x) ∧
      DifferentialGeometry.Homology.eulerChar ℚ (TopCat.of S₄) = 2 := by
  intro Q P
  have hCore := bourBufferedSphereChart_image r hr
  have hMapCap : RoundEquatorialCaps.flip '' standardFourSphereCap =
      (interior standardFourSphereCap)ᶜ := by
    rw [RoundEquatorialCaps.interior_south]
    ext y
    constructor
    · rintro ⟨x, hx, rfl⟩
      change RoundEquatorialCaps.height x ≤ 0 at hx
      change ¬ RoundEquatorialCaps.height (RoundEquatorialCaps.flip x) < 0
      rw [RoundEquatorialCaps.flip_height]
      linarith
    · intro hy
      let x := RoundEquatorialCaps.flip.symm y
      have hxy : RoundEquatorialCaps.flip x = y := RoundEquatorialCaps.flip.apply_symm_apply y
      have h := RoundEquatorialCaps.flip_height x
      rw [hxy] at h
      have hy' : 0 ≤ RoundEquatorialCaps.height y := not_lt.mp hy
      exact ⟨x, show RoundEquatorialCaps.height x ≤ 0 by linarith, hxy⟩
  refine ⟨hCore, ?_, ?_, ?_⟩
  · change (RoundEquatorialCaps.flip ∘ Q) '' closedBall 0 r = _
    rw [image_comp, hCore, hMapCap]
  · intro x hx
    have hSource : x ∈ Q.source := by rw [bourBufferedSphereChart_source]; trivial
    have hPSource : x ∈ P.source := ⟨hSource, mem_univ _⟩
    have hMem : Q x ∈ standardFourSphereCap :=
      hCore ▸ mem_image_of_mem Q (sphere_subset_closedBall hx)
    have hNotInt : Q x ∉ interior standardFourSphereCap := by
      intro h
      have hSub : Q ⁻¹' interior standardFourSphereCap ⊆ closedBall (0 : E₄) r := by
        intro y hy
        have hz : Q y ∈ Q '' closedBall 0 r := hCore.symm ▸ interior_subset hy
        obtain ⟨z, hzDisk, hzEq⟩ := hz
        exact (bourBufferedSphereChart_openEmbedding r hr).injective hzEq ▸ hzDisk
      have hOpen : IsOpen (Q ⁻¹' interior standardFourSphereCap) :=
        isOpen_interior.preimage (bourBufferedSphereChart_openEmbedding r hr).continuous
      have hy := interior_maximal hSub hOpen h
      rw [interior_closedBall _ hr.ne'] at hy
      have hlt := mem_ball.mp hy
      rw [mem_sphere.mp hx] at hlt
      exact (lt_irrefl r) hlt
    have hHeight : RoundEquatorialCaps.height (Q x) = 0 := by
      have hLe : RoundEquatorialCaps.height (Q x) ≤ 0 := hMem
      rw [RoundEquatorialCaps.interior_south] at hNotInt
      exact le_antisymm hLe (not_lt.mp hNotInt)
    have hEq : Q x = P x := (RoundEquatorialCaps.flip_fixes_equator (Q x) hHeight).symm
    exact ⟨hEq, hEq ▸ Q.left_inv' hSource, hEq.symm ▸ P.left_inv' hPSource⟩
  · simpa only [show (1 + (-1 : ℤ) ^ 4) = 2 by norm_num] using
      DifferentialGeometry.Homology.eulerChar_euclideanSphere ℚ 4

private def bourBufferedSphereLogInChart (r b : ℝ) (z : E₄) : ℝ :=
  (1 - Real.smoothTransition (‖z‖ ^ 2 / b ^ 2 - 1)) *
    Real.log ((‖(2 / r) • z‖ ^ 2 + 4) / (4 * (2 / r)))

private theorem bourBufferedSphereLogInChart_smooth {r : ℝ} (hr : 0 < r) (b : ℝ) :
    ContDiff ℝ ∞ (bourBufferedSphereLogInChart r b) := by
  have hZ : ContDiff ℝ ∞ (fun z : E₄ => ‖z‖ ^ 2) := contDiff_norm_sq ℝ
  have hScale : ContDiff ℝ ∞ (fun z : E₄ => (2 / r) • z) := by fun_prop
  have hPos (z : E₄) : 0 < (‖(2 / r) • z‖ ^ 2 + 4) / (4 * (2 / r)) := by positivity
  unfold bourBufferedSphereLogInChart
  exact (contDiff_const.sub (Real.smoothTransition.contDiff.comp
    ((hZ.div_const (b ^ 2)).sub contDiff_const))).mul
      (((((contDiff_norm_sq ℝ).comp hScale).add contDiff_const).div_const _).log
        (fun z => (hPos z).ne'))

private theorem bourBufferedSphereLogInChart_zero {r b : ℝ} (hb : 0 < b) {z : E₄}
    (hz : 2 * b < ‖z‖) : bourBufferedSphereLogInChart r b z = 0 := by
  have hSq : 2 * b ^ 2 ≤ ‖z‖ ^ 2 := by nlinarith [mul_pos hb (sub_pos.mpr hz), sq_nonneg (‖z‖ - 2 * b)]
  have hOne : 1 ≤ ‖z‖ ^ 2 / b ^ 2 - 1 := by
    have h := (le_div_iff₀ (sq_pos_of_pos hb)).2 hSq
    linarith
  simp [bourBufferedSphereLogInChart, Real.smoothTransition.one_of_one_le hOne]

private def bourBufferedSphereLog (r : ℝ) (hr : 0 < r) (b : ℝ) (p : S₄) : ℝ :=
  let C := transportedCapPocketChart r hr
  if p ∈ C.source then bourBufferedSphereLogInChart r b (C p) else 0

private theorem bourBufferedSphereLog_support {r b : ℝ} (hr : 0 < r) (hb : 0 < b) :
    tsupport (bourBufferedSphereLog r hr b) ⊆
      bourBufferedSphereChart r hr '' closedBall (0 : E₄) (2 * b) := by
  let C := transportedCapPocketChart r hr
  change tsupport (bourBufferedSphereLog r hr b) ⊆ C.symm '' closedBall (0 : E₄) (2 * b)
  have hClosed : IsClosed (C.symm '' closedBall (0 : E₄) (2 * b)) :=
    ((isCompact_closedBall _ _).image_of_continuousOn
      (C.contMDiffOn_invFun.continuousOn.mono
        (by rw [transportedCapPocketChart_target]; exact subset_univ _))).isClosed
  apply closure_minimal _ hClosed
  intro p hp
  have hn := Function.mem_support.mp hp
  by_cases hs : p ∈ C.source
  · have hc : C p ∈ closedBall (0 : E₄) (2 * b) := by
      by_contra! h
      have hNorm : 2 * b < ‖C p‖ := by simpa only [mem_closedBall, dist_zero_right, not_le] using h
      apply hn
      change (if p ∈ C.source then bourBufferedSphereLogInChart r b (C p) else 0) = 0
      rw [ite_eq_left hs]
      exact bourBufferedSphereLogInChart_zero (r := r) hb hNorm
    exact ⟨C p, hc, C.left_inv' hs⟩
  · exfalso
    apply hn
    change (if p ∈ C.source then bourBufferedSphereLogInChart r b (C p) else 0) = 0
    exact ite_eq_right hs

private theorem bourBufferedSphereLog_smooth {r b : ℝ} (hr : 0 < r) (hb : 0 < b) :
    ContMDiff I₄ 𝓘(ℝ) ∞ (bourBufferedSphereLog r hr b) := by
  let C := transportedCapPocketChart r hr
  apply contMDiff_of_tsupport
  intro p hp
  obtain ⟨z, _, rfl⟩ := bourBufferedSphereLog_support hr hb hp
  have hP : C.symm z ∈ C.source :=
    C.map_target' (transportedCapPocketChart_target r hr ▸ mem_univ z)
  have hNear : ∀ᶠ q in 𝓝 (C.symm z), q ∈ C.source := C.open_source.mem_nhds hP
  have hSmoothLocal := ((bourBufferedSphereLogInChart_smooth hr b).contMDiff.contMDiffAt).comp
    (C.symm z) (C.contMDiffOn_toFun.contMDiffAt hNear)
  exact hSmoothLocal.congr_of_eventuallyEq (hNear.mono fun q hq => by
    dsimp [bourBufferedSphereLog, C]
    exact ite_eq_left hq)

/-- A smooth radially blended metric on the actual capped sphere. It is
flat near and across the complete retained disk and round near the opposite
pole. The buffer size is an independent physical length. -/
def bourBufferedSphereMetric (r : ℝ) (hr : 0 < r) (b : ℝ) (hb : 0 < b) :
    SmoothRiemannianMetric I₄ S₄ :=
  conformalMetric standardRoundFourMetric
    ⟨bourBufferedSphereLog r hr b, bourBufferedSphereLog_smooth hr hb⟩

/-- The actual terminal pole has an unchanged open round germ. -/
theorem bourBufferedSphereMetric_near_pole {r b : ℝ} (hr : 0 < r) (hb : 0 < b) :
    ∀ᶠ p in 𝓝 transportedCapNorthPole, ∀ v w : TangentSpace I₄ p,
      (bourBufferedSphereMetric r hr b hb).inner p v w = standardRoundFourMetric.inner p v w := by
  let Q := bourBufferedSphereChart r hr
  have hSupp : transportedCapNorthPole ∉ tsupport (bourBufferedSphereLog r hr b) := by
    intro h
    obtain ⟨z, _, hz⟩ := bourBufferedSphereLog_support hr hb h
    have hzT : Q z ∈ Q.target :=
      Q.map_source' (bourBufferedSphereChart_source r hr ▸ mem_univ z)
    rw [hz, bourBufferedSphereChart_target] at hzT
    exact hzT (mem_singleton _)
  have hOpen : IsOpen (tsupport (bourBufferedSphereLog r hr b))ᶜ := isClosed_closure.isOpen_compl
  have hNear : ∀ᶠ p in 𝓝 transportedCapNorthPole, p ∉ tsupport (bourBufferedSphereLog r hr b) :=
    hOpen.mem_nhds hSupp
  filter_upwards [hNear] with p hp
  intro v w
  have hZero : bourBufferedSphereLog r hr b p = 0 := image_eq_zero_of_notMem_tsupport hp
  change Real.exp (2 * bourBufferedSphereLog r hr b p) * standardRoundFourMetric.inner p v w = _
  simp [hZero]

theorem bourBufferedSphereMetric_inner {r b : ℝ} (hr : 0 < r) (hb : 0 < b)
    (z : E₄) (hz : ‖z‖ ≤ b) (v w : E₄) :
    let Q := bourBufferedSphereChart r hr
    (bourBufferedSphereMetric r hr b hb).inner (Q z)
      (mfderiv I₄ I₄ Q z v) (mfderiv I₄ I₄ Q z w) = ⟪v, w⟫ := by
  intro Q
  let C := transportedCapPocketChart r hr
  have ht : z ∈ C.target := transportedCapPocketChart_target r hr ▸ mem_univ z
  have hSource : Q z ∈ C.source := C.map_target' ht
  have hCut : ‖z‖ ^ 2 / b ^ 2 - 1 ≤ 0 := by
    have h := (div_le_iff₀ (sq_pos_of_pos hb)).2
      (show ‖z‖ ^ 2 ≤ 1 * b ^ 2 by simpa using pow_le_pow_left₀ (norm_nonneg z) hz 2)
    linarith
  have hLog : bourBufferedSphereLog r hr b (Q z) =
      Real.log ((‖(2 / r) • z‖ ^ 2 + 4) / (4 * (2 / r))) := by
    change (if Q z ∈ C.source then bourBufferedSphereLogInChart r b (C (Q z)) else 0) = _
    have hInv : C (Q z) = z := C.right_inv' ht
    rw [ite_eq_left hSource, hInv]
    simp [bourBufferedSphereLogInChart, Real.smoothTransition.zero_of_nonpos hCut]
  change Real.exp (2 * bourBufferedSphereLog r hr b (Q z)) *
    standardRoundFourMetric.inner (Q z) (mfderiv I₄ I₄ Q z v) (mfderiv I₄ I₄ Q z w) = _
  have hBase := transportedCapPocketChart_metric_inner r hr z v w
  change standardRoundFourMetric.inner (Q z) (mfderiv I₄ I₄ Q z v)
    (mfderiv I₄ I₄ Q z w) = (16 * (2 / r) ^ 2 / (‖(2 / r) • z‖ ^ 2 + 4) ^ 2) * ⟪v, w⟫ at hBase
  rw [hLog, hBase, two_mul, Real.exp_add, Real.exp_log (by positivity)]
  field_simp
  ring

private theorem bourBufferedSphereChart_local (r : ℝ) (hr : 0 < r) :
    IsLocalDiffeomorph I₄ I₄ ∞ (bourBufferedSphereChart r hr : E₄ → S₄) :=
  fun x => (bourBufferedSphereChart r hr).isLocalDiffeomorphAt I₄ I₄ ∞
    (by rw [bourBufferedSphereChart_source]; trivial)

section Polar

open DifferentialGeometry.Geometry.Riemannian

local notation "S₃" => sphere (0 : E₄) 1
local notation "Iₚ" => ModelWithCorners.prod (𝓡 3) (𝓘(ℝ, ℝ))
private local instance : Fact (Module.finrank ℝ E₄ = 3 + 1) := ⟨by simp⟩

/-- The physical length factor in the radius coordinate of the buffered
stereographic metric. The transition exponent equals one beyond the blend. -/
def bourBufferedRadialSpeed (r b ρ : ℝ) : ℝ :=
  Real.exp (Real.smoothTransition (ρ ^ 2 / b ^ 2 - 1) *
    Real.log (2 * r / (r ^ 2 + ρ ^ 2)))

theorem bourBufferedRadialSpeed_pos (r b ρ : ℝ) :
    0 < bourBufferedRadialSpeed r b ρ := Real.exp_pos _

theorem bourBufferedRadialSpeed_eq_rpow {r : ℝ} (hr : 0 < r) (b ρ : ℝ) :
    bourBufferedRadialSpeed r b ρ =
      (2 * r / (r ^ 2 + ρ ^ 2)) ^ Real.smoothTransition (ρ ^ 2 / b ^ 2 - 1) := by
  rw [Real.rpow_def_of_pos (by positivity)]
  unfold bourBufferedRadialSpeed
  rw [mul_comm]

private theorem bourBufferedRadialSpeed_contDiff {r : ℝ} (hr : 0 < r) (b : ℝ) :
    ContDiff ℝ ∞ (bourBufferedRadialSpeed r b) := by
  have hs : ContDiff ℝ ∞ (fun ρ : ℝ => ρ ^ 2) := contDiff_id.pow 2
  have hRoundSpeed : ContDiff ℝ ∞ (fun ρ : ℝ => 2 * r / (r ^ 2 + ρ ^ 2)) :=
    contDiff_const.div (contDiff_const.add hs) (fun _ => ne_of_gt (by positivity))
  unfold bourBufferedRadialSpeed
  exact ((Real.smoothTransition.contDiff.comp ((hs.div_const (b ^ 2)).sub contDiff_const)).mul
    (hRoundSpeed.log (fun _ => ne_of_gt (by positivity)))).exp

/-- The pullback identity in the full actual stereographic chart, including
the curved radial transition. -/
theorem bourBufferedSphereMetric_radial_inner {r b : ℝ} (hr : 0 < r) (hb : 0 < b)
    (z v w : E₄) :
    let Q := bourBufferedSphereChart r hr
    (bourBufferedSphereMetric r hr b hb).inner (Q z)
      (mfderiv I₄ I₄ Q z v) (mfderiv I₄ I₄ Q z w) =
      bourBufferedRadialSpeed r b ‖z‖ ^ 2 * ⟪v, w⟫ := by
  intro Q
  let C := transportedCapPocketChart r hr
  let roundSpeed := 2 * r / (r ^ 2 + ‖z‖ ^ 2)
  let t := Real.smoothTransition (‖z‖ ^ 2 / b ^ 2 - 1)
  have hRoundSpeedpos : 0 < roundSpeed := by dsimp [roundSpeed]; positivity
  have hRoundSpeed : roundSpeed = 4 * (2 / r) / (‖(2 / r) • z‖ ^ 2 + 4) := by
    rw [norm_smul, Real.norm_eq_abs, abs_of_pos (by positivity : 0 < 2 / r)]
    dsimp [roundSpeed]
    field_simp
    ring
  have ht : z ∈ C.target := transportedCapPocketChart_target r hr ▸ mem_univ z
  have hSource : Q z ∈ C.source := C.map_target' ht
  have hInv : C (Q z) = z := C.right_inv' ht
  have hLog : bourBufferedSphereLog r hr b (Q z) = (1 - t) * Real.log roundSpeed⁻¹ := by
    change (if Q z ∈ C.source then bourBufferedSphereLogInChart r b (C (Q z)) else 0) = _
    rw [ite_eq_left hSource, hInv, hRoundSpeed, inv_div]
    rfl
  have hBase := transportedCapPocketChart_metric_inner r hr z v w
  change standardRoundFourMetric.inner (Q z) (mfderiv I₄ I₄ Q z v)
    (mfderiv I₄ I₄ Q z w) = (16 * (2 / r) ^ 2 / (‖(2 / r) • z‖ ^ 2 + 4) ^ 2) * ⟪v, w⟫ at hBase
  have hBaseFactor : (16 * (2 / r) ^ 2 / (‖(2 / r) • z‖ ^ 2 + 4) ^ 2) = roundSpeed ^ 2 := by
    rw [hRoundSpeed, div_pow (4 * (2 / r)) (‖(2 / r) • z‖ ^ 2 + 4) 2, mul_pow]
    norm_num
  change Real.exp (2 * bourBufferedSphereLog r hr b (Q z)) *
    standardRoundFourMetric.inner (Q z) (mfderiv I₄ I₄ Q z v) (mfderiv I₄ I₄ Q z w) = _
  rw [hLog, hBase, hBaseFactor, ← mul_assoc, Real.log_inv]
  congr 1
  change Real.exp (2 * ((1 - t) * -Real.log roundSpeed)) * roundSpeed ^ 2 = Real.exp (t * Real.log roundSpeed) ^ 2
  have hRoundSpeedsq : roundSpeed ^ 2 = Real.exp (2 * Real.log roundSpeed) := by
    rw [two_mul, Real.exp_add, Real.exp_log hRoundSpeedpos, pow_two]
  rw [hRoundSpeedsq, pow_two, ← Real.exp_add, ← Real.exp_add]
  congr 1
  ring

/-- Native polar coordinates on the punctured cap and its two-sided seam
buffer. The inverse first reads the actual stereographic coordinate and
then recovers its Euclidean radius and unit link direction. -/
def bourBufferedSpherePolarChart (r : ℝ) (hr : 0 < r) :
    PartialDiffeomorph Iₚ I₄ (S₃ × ℝ) S₄ ∞ :=
  (euclideanPolarDiffeomorph (n := 3)).trans (bourBufferedSphereChart r hr)

theorem bourBufferedSpherePolarChart_source (r : ℝ) (hr : 0 < r) :
    (bourBufferedSpherePolarChart r hr).source = {q | 0 < q.2} := by
  ext q
  change (0 < (q : S₃ × ℝ).2 ∧
    euclideanPolarMap q ∈ (bourBufferedSphereChart r hr).source) ↔ 0 < q.2
  rw [bourBufferedSphereChart_source]
  simp

/-- The full open cap with its pole removed is exactly the marked polar
image at native radii greater than the seam radius. The actual inverse
lands in the same domain and is also valid on the seam through its buffer. -/
theorem bourBufferedSphere_puncturedCap {r : ℝ} (hr : 0 < r) :
    let P := bourBufferedSpherePolarChart r hr
    let A : Set (S₃ × ℝ) := {q | r < q.2}
    let C : Set S₄ := (standardFourSphereCap ∪ {transportedCapNorthPole})ᶜ
    P '' A = C ∧
      (∀ q, r ≤ q.2 → P.symm (P q) = q) ∧
      (∀ p ∈ C, P.symm p ∈ A ∧ P (P.symm p) = p) := by
  intro P A C
  let Q := bourBufferedSphereChart r hr
  let U := euclideanPolarDiffeomorph (E := E₄) (n := 3)
  have hCore := bourBufferedSphereChart_image r hr
  have hInj := (bourBufferedSphereChart_openEmbedding r hr).injective
  have hImage : P '' A = C := by
    ext p
    constructor
    · rintro ⟨q, hq, rfl⟩
      have hq' : r < q.2 := hq
      let z := euclideanPolarMap q
      have hz : ‖z‖ = q.2 := euclideanPolarMap_norm_of_pos (hr.trans hq')
      change Q z ∉ standardFourSphereCap ∪ {transportedCapNorthPole}
      intro hp
      rcases hp with hCoreP | hPole
      · obtain ⟨x, hx, he⟩ := hCore.symm ▸ hCoreP
        have hNorm : ‖x‖ ≤ r := by simpa [mem_closedBall, dist_zero_right] using hx
        rw [hInj he, hz] at hNorm
        exact (not_le_of_gt hq') hNorm
      · have hQ : Q z ∈ Q.target := Q.map_source'
          (bourBufferedSphereChart_source r hr ▸ mem_univ z)
        rw [bourBufferedSphereChart_target] at hQ
        exact hQ hPole
    · intro hp
      have hp' : p ∉ standardFourSphereCap ∪ {transportedCapNorthPole} := hp
      have hQT : p ∈ Q.target := by
        rw [bourBufferedSphereChart_target]
        exact fun h => hp' (Or.inr h)
      let z := Q.symm p
      have hZ : Q z = p := Q.right_inv' hQT
      have hρ : r < ‖z‖ := by
        by_contra! h
        apply hp'
        apply Or.inl
        rw [← hZ, ← hCore]
        exact mem_image_of_mem Q (by simpa [mem_closedBall, dist_zero_right] using h)
      have hz0 : z ≠ 0 := norm_pos_iff.mp (hr.trans hρ)
      let q := U.symm z
      have hq : q.2 = ‖z‖ := euclideanPolarDiffeomorph_symm_snd (n := 3) hz0
      have hZu : U q = z := U.right_inv' hz0
      have hqA : q ∈ A := by
        change r < q.2
        rwa [hq]
      exact ⟨q, hqA, (congrArg (Q : E₄ → S₄) hZu).trans hZ⟩
  refine ⟨hImage, ?_, ?_⟩
  · intro q hq
    exact P.left_inv' (bourBufferedSpherePolarChart_source r hr ▸ hr.trans_le hq)
  · intro p hp
    obtain ⟨q, hq, rfl⟩ := hImage.symm ▸ hp
    have hSource : q ∈ P.source :=
      bourBufferedSpherePolarChart_source r hr ▸ hr.trans (show r < q.2 from hq)
    have hLeft : P.symm (P q) = q := P.left_inv' hSource
    exact ⟨by rw [hLeft]; exact hq, by rw [hLeft]⟩

/-- The derivative of the actual polar chart pulls the physical metric back
to the squared length factor and the squared warped radius, with no
mixed block. -/
theorem bourBufferedSphere_polar_inner {r b : ℝ} (hr : 0 < r) (hb : 0 < b)
    (q : S₃ × ℝ) (hq : 0 < q.2) (v w : TangentSpace Iₚ q) :
    let P := bourBufferedSpherePolarChart r hr
    let speed := bourBufferedRadialSpeed r b q.2
    (bourBufferedSphereMetric r hr b hb).inner (P q)
      (mfderiv Iₚ I₄ P q v) (mfderiv Iₚ I₄ P q w) =
      speed ^ 2 * v.2 * w.2 + (q.2 * speed) ^ 2 * (roundMetric (n := 3)).inner q.1 v.1 w.1 := by
  intro P speed
  let Q := bourBufferedSphereChart r hr
  let z := euclideanPolarMap q
  have hQ := (bourBufferedSphereChart_local r hr).contMDiff.mdifferentiableAt
    (n := ∞) (x := z) (by simp)
  have hPolar := (euclideanPolarMap_smooth (n := 3)).mdifferentiableAt
    (x := q) (by simp : (∞ : WithTop ℕ∞) ≠ 0)
  have hD (u : TangentSpace Iₚ q) : mfderiv Iₚ I₄ P q u =
      mfderiv I₄ I₄ Q z (u.2 • (q.1 : E₄) + q.2 • dIncl (n := 3) q.1 u.1) := by
    change mfderiv Iₚ I₄ ((Q : E₄ → S₄) ∘ euclideanPolarMap) q u = _
    rw [mfderiv_comp_apply q hQ hPolar, euclideanPolarMap_mfderiv]
  have hUnit : ⟪(q.1 : E₄), (q.1 : E₄)⟫ = 1 := by
    rw [real_inner_self_eq_norm_sq, norm_eq_of_mem_sphere q.1, one_pow]
  have hOrth₁ := dIncl_orth (n := 3) q.1 w.1
  have hOrth₂ : ⟪dIncl (n := 3) q.1 v.1, (q.1 : E₄)⟫ = 0 := by
    rw [real_inner_comm]
    exact dIncl_orth (n := 3) q.1 v.1
  rw [hD v, hD w]
  change (bourBufferedSphereMetric r hr b hb).inner (Q z)
      (mfderiv I₄ I₄ Q z _) (mfderiv I₄ I₄ Q z _) = _
  have hz : ‖z‖ = q.2 := euclideanPolarMap_norm_of_pos hq
  rw [bourBufferedSphereMetric_radial_inner hr hb, hz]
  change speed ^ 2 * _ = _
  erw [roundMetric_inner]
  simp only [inner_add_left, inner_add_right, real_inner_smul_left, real_inner_smul_right,
    hUnit, hOrth₁, hOrth₂, mul_zero, zero_add, add_zero, mul_one]
  ring

/-- Radius measured along the physical outgoing radial curves from the
actual seam. -/
def bourBufferedRadialLength (r b ρ : ℝ) : ℝ :=
  ∫ t in r..ρ, bourBufferedRadialSpeed r b t

theorem bourBufferedRadialLength_hasDerivAt {r : ℝ} (hr : 0 < r) (b ρ : ℝ) :
    HasDerivAt (bourBufferedRadialLength r b) (bourBufferedRadialSpeed r b ρ) ρ := by
  have hc := (bourBufferedRadialSpeed_contDiff hr b).continuous
  exact intervalIntegral.integral_hasDerivAt_right (hc.intervalIntegrable _ _)
    hc.aestronglyMeasurable.stronglyMeasurableAtFilter hc.continuousAt

/-- The physical radial coordinate is strictly increasing through the
whole transition. -/
theorem bourBufferedRadialLength_strictMono {r : ℝ} (hr : 0 < r) (b : ℝ) :
    StrictMono (bourBufferedRadialLength r b) := by
  apply strictMono_of_deriv_pos
  intro ρ
  rw [(bourBufferedRadialLength_hasDerivAt hr b ρ).deriv]
  exact bourBufferedRadialSpeed_pos _ _ _

private theorem bourBufferedRadialSpeed_on_roundGerm {r b ρ : ℝ} (hr : 0 < r)
    (hb : 0 < b) (hρ : 2 * b ≤ ρ) :
    bourBufferedRadialSpeed r b ρ = 2 * r / (r ^ 2 + ρ ^ 2) := by
  have hSq : 2 * b ^ 2 ≤ ρ ^ 2 := by
    nlinarith [mul_nonneg hb.le (sub_nonneg.mpr hρ), sq_nonneg (ρ - 2 * b)]
  have hOne : 1 ≤ ρ ^ 2 / b ^ 2 - 1 := by
    have h := (le_div_iff₀ (sq_pos_of_pos hb)).2 hSq
    linarith
  unfold bourBufferedRadialSpeed
  rw [Real.smoothTransition.one_of_one_le hOne, one_mul, Real.exp_log (by positivity)]

/-- The outgoing cap length ends at this finite value, computed at a
fixed point of its actual unit-round germ. -/
def bourBufferedCapLength (r b : ℝ) : ℝ :=
  bourBufferedRadialLength r b (2 * b) + 2 * Real.arctan (r / (2 * b))

/-- In the actual terminal round germ, the remaining physical radial
length is the round stereographic angle. -/
theorem bourBufferedRadialLength_roundTail {r b ρ : ℝ} (hr : 0 < r) (hb : 0 < b)
    (hρ : 2 * b ≤ ρ) :
    bourBufferedCapLength r b - bourBufferedRadialLength r b ρ =
      2 * Real.arctan (r / ρ) := by
  let f := fun t : ℝ => bourBufferedRadialLength r b t + 2 * Real.arctan (r / t)
  have hDeriv (t : ℝ) (ht : t ∈ uIcc (2 * b) ρ) : HasDerivAt f 0 t := by
    rw [uIcc_of_le hρ] at ht
    have h₁ := bourBufferedRadialLength_hasDerivAt hr b t
    rw [bourBufferedRadialSpeed_on_roundGerm hr hb ht.1] at h₁
    have h₂ := bourStereographicPole_distance_deriv (r := r) (lt_of_lt_of_le (by positivity) ht.1)
    have h := h₁.add h₂
    change HasDerivAt f (2 * r / (r ^ 2 + t ^ 2) + -(2 * r / (r ^ 2 + t ^ 2))) t at h
    simpa only [add_neg_cancel] using h
  have hFTC := intervalIntegral.integral_eq_sub_of_hasDerivAt hDeriv
    (intervalIntegrable_const (c := (0 : ℝ)) (a := 2 * b) (b := ρ))
  rw [intervalIntegral.integral_zero] at hFTC
  change 0 = bourBufferedRadialLength r b ρ + 2 * Real.arctan (r / ρ) -
    bourBufferedCapLength r b at hFTC
  linarith only [hFTC]

/-- The angular radius of the same closed metric has the exact sine
profile in physical arclength on its round-pole germ. -/
theorem bourBufferedAngularRadius_roundTail {r b ρ : ℝ} (hr : 0 < r) (hb : 0 < b)
    (hρ : 2 * b ≤ ρ) :
    ρ * bourBufferedRadialSpeed r b ρ =
      Real.sin (bourBufferedCapLength r b - bourBufferedRadialLength r b ρ) := by
  rw [bourBufferedRadialSpeed_on_roundGerm hr hb hρ,
    bourBufferedRadialLength_roundTail hr hb hρ, mul_comm]
  exact bourStereographicPole_warp_eq_sin (lt_of_lt_of_le (by positivity) hρ)

/-- The arclength chart covers exactly the finite open interval from the
seam to the pole. Strict monotonicity provides uniqueness of its inverse. -/
theorem bourBufferedRadialLength_image {r b : ℝ} (hr : 0 < r) (hBuffer : r < b) :
    bourBufferedRadialLength r b '' Ioi r = Ioo 0 (bourBufferedCapLength r b) := by
  let s := bourBufferedRadialLength r b
  let L := bourBufferedCapLength r b
  have hb : 0 < b := hr.trans hBuffer
  have hMono := bourBufferedRadialLength_strictMono hr b
  have hStart : s r = 0 := intervalIntegral.integral_same
  have hLimit : Tendsto s atTop (𝓝 L) := by
    have ht : Tendsto (fun ρ : ℝ => r / ρ) atTop (𝓝 0) := by
      simpa [div_eq_mul_inv] using (tendsto_inv_atTop_zero.const_mul r)
    have ha : Tendsto (fun ρ : ℝ => Real.arctan (r / ρ)) atTop (𝓝 0) := by
      change Tendsto (Real.arctan ∘ fun ρ : ℝ => r / ρ) atTop (𝓝 0)
      simpa only [Real.arctan_zero] using (Real.continuous_arctan.tendsto 0).comp ht
    have hl : Tendsto (fun ρ : ℝ => L - 2 * Real.arctan (r / ρ)) atTop (𝓝 L) := by
      simpa using tendsto_const_nhds.sub (ha.const_mul 2)
    apply hl.congr'
    filter_upwards [eventually_ge_atTop (2 * b)] with ρ hρ
    have hh := bourBufferedRadialLength_roundTail hr hb hρ
    change L - s ρ = _ at hh
    linarith only [hh]
  have hUpper (ρ : ℝ) : s ρ < L := by
    let t := max (ρ + 1) (2 * b)
    have ht : ρ < t := (lt_add_of_pos_right ρ zero_lt_one).trans_le (le_max_left _ _)
    have hR : 2 * b ≤ t := le_max_right _ _
    have hTail := bourBufferedRadialLength_roundTail hr hb hR
    have hPos : 0 < Real.arctan (r / t) :=
      Real.arctan_pos.mpr (div_pos hr (lt_of_lt_of_le (by positivity) hR))
    have htL : s t < L := by
      change L - s t = _ at hTail
      linarith only [hTail, hPos]
    exact (hMono ht).trans htL
  refine subset_antisymm ?_ ?_
  · rintro _ ⟨ρ, hρ, rfl⟩
    have hPos : s r < s ρ := hMono hρ
    rw [hStart] at hPos
    exact ⟨hPos, hUpper ρ⟩
  · intro y hy
    have hyEv : ∀ᶠ ρ in atTop, y < s ρ := hLimit (Ioi_mem_nhds hy.2)
    obtain ⟨R, _, hyR⟩ := ((eventually_gt_atTop r).and hyEv).exists
    have hc : Continuous s := continuous_iff_continuousAt.mpr
      (fun ρ => (bourBufferedRadialLength_hasDerivAt hr b ρ).continuousAt)
    have hy' : y ∈ Icc (s r) (s R) := ⟨by rw [hStart]; exact hy.1.le, hyR.le⟩
    rw [← hc.image_Icc_of_strictMono hMono] at hy'
    obtain ⟨ρ, hρ, rfl⟩ := hy'
    refine ⟨ρ, ?_, rfl⟩
    change r < ρ
    by_contra! h
    exact hy.1.not_ge ((hMono.monotone h).trans hStart.le)

private theorem bourBufferedRadialLength_contDiff {r : ℝ} (hr : 0 < r) (b : ℝ) :
    ContDiff ℝ ∞ (bourBufferedRadialLength r b) := by
  have hd (ρ : ℝ) := bourBufferedRadialLength_hasDerivAt hr b ρ
  rw [contDiff_infty_iff_deriv]
  exact ⟨fun ρ => (hd ρ).differentiableAt,
    (funext fun ρ => (hd ρ).deriv) ▸ (bourBufferedRadialSpeed_contDiff hr b)⟩

/-- At every interior native radius the actual arclength coordinate
has a smooth local inverse with the specified radius. -/
theorem bourBufferedRadialLength_localInverse {r : ℝ} (hr : 0 < r) (b ρ : ℝ) :
    ∃ e : OpenPartialHomeomorph ℝ ℝ, (e : ℝ → ℝ) = bourBufferedRadialLength r b ∧
      ρ ∈ e.source ∧ ContDiffAt ℝ ∞ e.symm (bourBufferedRadialLength r b ρ) ∧
      e.symm (bourBufferedRadialLength r b ρ) = ρ := by
  let s := bourBufferedRadialLength r b
  let speed := bourBufferedRadialSpeed r b ρ
  have hspeed : speed ≠ 0 := (bourBufferedRadialSpeed_pos r b ρ).ne'
  let T := (LinearEquiv.smulOfNeZero ℝ ℝ speed hspeed).toContinuousLinearEquiv
  have hF : HasFDerivAt s (T : ℝ →L[ℝ] ℝ) ρ := by
    apply (hasFDerivAt_iff_hasDerivAt).2
    change HasDerivAt s (speed * 1) ρ
    rw [mul_one]
    exact bourBufferedRadialLength_hasDerivAt hr b ρ
  have hc : ContDiffAt ℝ ∞ s ρ := (bourBufferedRadialLength_contDiff hr b).contDiffAt
  let e := hc.toOpenPartialHomeomorph s hF (by simp)
  have hρ : ρ ∈ e.source := hc.mem_toOpenPartialHomeomorph_source hF (by simp)
  exact ⟨e, rfl, hρ, hc.to_localInverse hF (by simp), e.left_inv hρ⟩

/-- The angular radius in the native chart is the native radius times the
length factor. Its derivative uses the usual product rule. -/
theorem bourBufferedAngularRadius_native_deriv {r : ℝ} (hr : 0 < r) (b ρ : ℝ) :
    HasDerivAt (fun t => t * bourBufferedRadialSpeed r b t)
      (bourBufferedRadialSpeed r b ρ + ρ * deriv (bourBufferedRadialSpeed r b) ρ) ρ := by
  have h := ((bourBufferedRadialSpeed_contDiff hr b).differentiable (by simp) ρ).hasDerivAt
  have hp := (hasDerivAt_id ρ).mul h
  change HasDerivAt (fun t => t * bourBufferedRadialSpeed r b t) _ ρ at hp
  simpa only [id_eq, one_mul] using hp

/-- The arclength first jet is fixed by the actual native-coordinate
metric. This compares any differentiable local reparametrization realizing
the angular radius by the same physical arclength map. -/
theorem bourBufferedAngularRadius_arclength_deriv {r : ℝ} (hr : 0 < r) (b ρ : ℝ)
    {f : ℝ → ℝ} {df : ℝ}
    (hf : HasDerivAt f df (bourBufferedRadialLength r b ρ))
    (hRadius : (f ∘ bourBufferedRadialLength r b) =ᶠ[𝓝 ρ]
      (fun t => t * bourBufferedRadialSpeed r b t)) :
    df = (bourBufferedRadialSpeed r b ρ + ρ * deriv (bourBufferedRadialSpeed r b) ρ) /
      bourBufferedRadialSpeed r b ρ := by
  have hComposition := hf.comp ρ (bourBufferedRadialLength_hasDerivAt hr b ρ)
  have hNative := bourBufferedAngularRadius_native_deriv hr b ρ
  have hEq := (hComposition.congr_of_eventuallyEq hRadius.symm).unique hNative
  exact (eq_div_iff (bourBufferedRadialSpeed_pos r b ρ).ne').2 hEq

end Polar

/-- All points of the genuine two-sided buffer are flat for the physical
closed metric. The proof uses curvature locality through the actual
stereographic marking of the unchanged Euclidean metric. -/
theorem bourBufferedSphere_flat {r b : ℝ} (hr : 0 < r) (hb : 0 < b)
    {x : E₄} (hx : ‖x‖ < b) :
    intrinsicCurvatureSq (bourBufferedSphereMetric r hr b hb) (bourBufferedSphereChart r hr x) = 0 := by
  let Q := bourBufferedSphereChart r hr
  let G := bourBufferedSphereMetric r hr b hb
  let hQ := bourBufferedSphereChart_local r hr
  let g := localPullMetric G Q hQ
  have hNear : ∀ᶠ y in 𝓝 x, ‖y‖ < b := (isOpen_lt continuous_norm continuous_const).mem_nhds hx
  have hEq : ∀ᶠ y in 𝓝 x, ∀ v w : TangentSpace I₄ y,
      g.inner y v w = (euclideanMetric (E := E₄)).inner y v w := by
    filter_upwards [hNear] with y hy
    intro v w
    rw [show g.inner y v w = _ from localPullMetric_inner G Q hQ y v w]
    change G.inner (Q y) (mfderiv I₄ I₄ Q y v) (mfderiv I₄ I₄ Q y w) = @inner ℝ E₄ _ v w
    exact bourBufferedSphereMetric_inner hr hb y hy.le v w
  have hZero : metricRm04At g x = 0 := by
    rw [metricRm04At_eq_of_metric_eventuallyEq _ _ _ hEq, euclideanMetric_metricRm04At_eq_zero]
  change normSq0S G (Q x) 4 (metricRm04At G (Q x)) = 0
  rw [← normSq0S_metricRm04At_localPullMetric G Q hQ x]
  change normSq0S g x 4 (metricRm04At g x) = 0
  rw [hZero]
  exact ((tensor0SMetricData (I := I₄) g x 4).inner_self_eq_zero_iff 0).2 rfl

/-- The physical volume of any measurable retained set in the flat chart
equals its Euclidean volume. This uses the actual marking, via volume
naturality, so the conclusion also applies to shells across the seam. -/
theorem bourBufferedSphere_volume {r b : ℝ} (hr : 0 < r) (hb : 0 < b)
    {A : Set E₄} (hA : MeasurableSet A) (hInside : A ⊆ closedBall 0 b) :
    riemannianVolumeMeasure I₄ S₄ (bourBufferedSphereMetric r hr b hb)
      (bourBufferedSphereChart r hr '' A) = volume A := by
  let Q := bourBufferedSphereChart r hr
  let G := bourBufferedSphereMetric r hr b hb
  let hQ := bourBufferedSphereChart_local r hr
  let g := localPullMetric G Q hQ
  rw [← DifferentialGeometry.Geometry.Measure.riemannianVolumeMeasure_image_eq_of_injective_local_isometry
    g G Q hQ (bourBufferedSphereChart_openEmbedding r hr).injective (localPullMetric_inner G Q hQ) hA,
    Riemannian.VolumeComparison.riemannianVolumeMeasure_apply_eq_of_inner_eqOn g euclideanMetric hA,
    riemannianVolumeMeasure_euclideanMetric]
  intro x hx v
  rw [show g.inner x v v = _ from localPullMetric_inner G Q hQ x v v]
  change G.inner (Q x) (mfderiv I₄ I₄ Q x v) (mfderiv I₄ I₄ Q x v) = @inner ℝ E₄ _ v v
  exact bourBufferedSphereMetric_inner hr hb x (by simpa [mem_closedBall, dist_zero_right] using hInside hx) v v

/-- The closed capped carrier is oriented by the ordinary outward-first
sphere orientation. -/
def bourBufferedSphereOrientation : ManifoldOrientation I₄ S₄ 4 :=
  sphereOrientation 4 (by decide)

/-- On the physical radius-one rescaling, the shell of the concrete
Euclidean control has zero full curvature and volume at most the
Euclidean unit four-ball. The cap starts beyond the shell, and the
same closed metric stays flat on a buffer across the cap seam. -/
theorem bourBufferedSphere_normalizedShell {r b : ℝ} (hr : 0 < r) (hBuffer : r < b) :
    let A := bourBufferedSphereChart r hr '' (closedBall 0 r \ ball 0 (r / 2))
    let g := bourBufferedSphereMetric r hr b (hr.trans hBuffer)
    let G := scaleMetric (r ^ 2)⁻¹ (inv_pos.mpr (sq_pos_of_pos hr)) g
    (∀ x ∈ A, intrinsicCurvatureSq G x = 0) ∧
      riemannianVolumeMeasure I₄ S₄ G A ≤ ENNReal.ofReal (Real.pi ^ 2 / 2) := by
  intro A g G
  let Q := bourBufferedSphereChart r hr
  let S := closedBall (0 : E₄) r \ ball 0 (r / 2)
  have hS : MeasurableSet S := measurableSet_closedBall.diff measurableSet_ball
  have hB : S ⊆ closedBall (0 : E₄) b :=
    sdiff_subset.trans (closedBall_subset_closedBall hBuffer.le)
  refine ⟨?_, ?_⟩
  · rintro x ⟨z, hz, rfl⟩
    have hZ : ‖z‖ ≤ r := by simpa [mem_closedBall, dist_zero_right] using hz.1
    have hFlat := bourBufferedSphere_flat hr (hr.trans hBuffer) (hZ.trans_lt hBuffer)
    change normSq0S g (Q z) 4 (metricRm04At g (Q z)) = 0 at hFlat
    have hRm : metricRm04At g (Q z) = 0 :=
      ((tensor0SMetricData (I := I₄) g (Q z) 4).inner_self_eq_zero_iff _).1 hFlat
    have hScale : metricRm04At G (Q z) = (r ^ 2)⁻¹ • metricRm04At g (Q z) :=
      metricRm_scale _ (inv_pos.mpr (sq_pos_of_pos hr)) _ _
    change normSq0S G (Q z) 4 (metricRm04At G (Q z)) = 0
    rw [hScale, hRm, smul_zero]
    exact ((tensor0SMetricData (I := I₄) G (Q z) 4).inner_self_eq_zero_iff 0).2 rfl
  · have hVol : riemannianVolumeMeasure I₄ S₄ g A = volume S :=
      bourBufferedSphere_volume hr (hr.trans hBuffer) hS hB
    have hBall : (volume : Measure E₄) (closedBall 0 r) =
        ENNReal.ofReal (r ^ 4 * (Real.pi ^ 2 / 2)) := by
      rw [InnerProductSpace.volume_closedBall_of_dim_even (k := 2) (by simp) (0 : E₄) r,
        show Module.finrank ℝ E₄ = 4 by simp, ← ENNReal.ofReal_pow hr.le,
        ← ENNReal.ofReal_mul (pow_nonneg hr.le _)]
      norm_num
    have hFactor : Real.sqrt ((r ^ 2)⁻¹) ^ 4 = (r ^ 4)⁻¹ := by
      rw [show (4 : ℕ) = 2 * 2 by decide, pow_mul (Real.sqrt _), Real.sq_sqrt (by positivity)]
      ring
    change riemannianVolumeMeasure I₄ S₄
      (scaleMetric (r ^ 2)⁻¹ (inv_pos.mpr (sq_pos_of_pos hr)) g) A ≤ _
    rw [volume_scaleMetric, show Module.finrank ℝ E₄ = 4 by simp, Measure.smul_apply, smul_eq_mul,
      hVol, ← ENNReal.ofReal_pow (Real.sqrt_nonneg _), hFactor]
    calc
      _ ≤ ENNReal.ofReal ((r ^ 4)⁻¹) * (volume : Measure E₄) (closedBall 0 r) :=
        mul_le_mul_of_nonneg_left (measure_mono (show S ⊆ closedBall 0 r from sdiff_subset)) (by positivity)
      _ = ENNReal.ofReal (Real.pi ^ 2 / 2) := by
        rw [hBall, ← ENNReal.ofReal_mul (by positivity)]
        congr 1
        field_simp

section Quantitative

open DifferentialGeometry.Tensor.Coordinates DifferentialGeometry.Geometry.Operator
open DifferentialGeometry.CheegerGromovCompactness

private theorem bourShell_jetRiemannBound_linear {a b K ε : ℝ}
    (ha : 0 ≤ a) (hK : 0 ≤ K) (hε : ε ∈ Icc (0 : ℝ) 1) :
    Analysis.jetRiemannBound 4 (a * ε) (b * ε) K ≤ Analysis.jetRiemannBound 4 a b K * ε := by
  let q := Analysis.jetRiemannBound 4 a 0 K
  let l := Analysis.jetRiemannBound 4 0 b K
  have hq : 0 ≤ q := by dsimp [q, Analysis.jetRiemannBound]; positivity
  have he : ε ^ 2 ≤ ε := by nlinarith [mul_nonneg hε.1 (sub_nonneg.mpr hε.2)]
  calc
    _ = q * ε ^ 2 + l * ε := by simp [q, l, Analysis.jetRiemannBound]; ring
    _ ≤ q * ε + l * ε := add_le_add (mul_le_mul_of_nonneg_left he hq) le_rfl
    _ = _ := by simp [q, l, Analysis.jetRiemannBound]; ring

variable {M : Type*} [TopologicalSpace M] [ChartedSpace E₄ M] [IsManifold I₄ ∞ M] [T2Space M]
  [BoundarylessManifold I₄ M]

/-- First and second jets of order `ε` on an actual normalized
four-dimensional metric give an intrinsic squared curvature bound of
order `ε²`. The inverse Gram entries and the actual inverse identity
are those of the same chart and metric. -/
theorem bourNormalizedShell_curvature_of_chartJets
    (g : SmoothRiemannianMetric I₄ M) (x : M) {C₀ C₁ C₂ K ε : ℝ}
    (hC₀ : 0 ≤ C₀) (hC₁ : 0 ≤ C₁) (hC₂ : 0 ≤ C₂) (hK : 0 ≤ K)
    (hε : ε ∈ Icc (0 : ℝ) 1)
    (h0 : ∀ i j, |chartGramMatrix g x x i j| ≤ C₀)
    (h1 : ∀ k i j,
      |partialDeriv k (chartGramOnE g x i j) (extChartAt I₄ x x)| ≤ C₁ * ε)
    (h2 : ∀ k l i j, |partialDeriv k (partialDeriv l (chartGramOnE g x i j))
      (extChartAt I₄ x x)| ≤ C₂ * ε)
    (hInv : MetricInverseInBasis g x (centeredChartTangentBasis x)
      (fun i j => chartInvGramOnE g x i j (extChartAt I₄ x x)))
    (hInvBound : ∀ i j, |chartInvGramOnE g x i j (extChartAt I₄ x x)| ≤ K) :
    let L := 4 * (C₀ * Analysis.jetRiemannBound 4 C₁ C₂ K)
    intrinsicCurvatureSq g x ≤ (4 : ℝ) ^ 8 * K ^ 4 * L ^ 2 * ε ^ 2 := by
  intro L
  have hDim : Module.finrank ℝ E₄ = 4 := by simp
  have hL : 0 ≤ L := by dsimp [L, Analysis.jetRiemannBound]; positivity
  have hComp (i j k l : Fin (Module.finrank ℝ E₄)) :
      |metricRm04StandardAt g x (centeredChartTangentBasis x i) (centeredChartTangentBasis x j)
        (centeredChartTangentBasis x k) (centeredChartTangentBasis x l)| ≤ L * ε := by
    have h := abs_metricRm04StandardAt_centeredChartBasis_le_of_jetBounds g x
      hC₀ (mul_nonneg hC₁ hε.1) hK h0 h1 h2 hInvBound i j k l
    simp only [hDim, Nat.cast_ofNat] at h
    apply h.trans
    dsimp [L]
    calc
      _ ≤ 4 * (C₀ * (Analysis.jetRiemannBound 4 C₁ C₂ K * ε)) :=
        mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_left
          (bourShell_jetRiemannBound_linear hC₁ hK hε) hC₀) (by norm_num)
      _ = _ := by ring
  have hNorm := curvDerivNorm_zero_le_of_centralChart_component_bounds g x hK
    (mul_nonneg hL hε.1) hInv hInvBound hComp
  simp only [hDim, Nat.cast_ofNat] at hNorm
  change Real.sqrt (intrinsicCurvatureSq g x) ≤ Real.sqrt
    ((4 : ℝ) ^ 4 * ((4 : ℝ) ^ 4 * (K ^ 4 * (L * ε) ^ 2))) at hNorm
  have hSq := (sq_le_sq₀ (Real.sqrt_nonneg _) (Real.sqrt_nonneg _)).2 hNorm
  have hNonneg : 0 ≤ intrinsicCurvatureSq g x := normSq0S_nonneg g x 4 _
  rw [Real.sq_sqrt hNonneg, Real.sq_sqrt (by positivity)] at hSq
  convert hSq using 1
  ring

end Quantitative

end SmoothPoincare
