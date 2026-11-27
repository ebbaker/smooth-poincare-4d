import SmoothPoincare.IntrinsicEntry.HarmonicDiskPropagation
import SmoothPoincare.IntrinsicEntry.HarmonicStretchHarnack
import SmoothPoincare.Variational.BourClosedCapEuler

/-! # Complete signed cost from a certified metric floor and physical curvature bounds -/

open Set Filter MeasureTheory DifferentialGeometry FirstOrderTwistor
open DifferentialGeometry.Integral.Measure DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Topology.Manifold DifferentialGeometry.Geometry.Metric
open DifferentialGeometry.Tensor0SBundle
open scoped BigOperators ContDiff Manifold Topology
noncomputable section
namespace SmoothPoincare.IntrinsicEntry

/-- Lower square stretch from bounds on the holomorphic energy and relative
Jacobian. The target and source inner products are those of the planar marking. -/
theorem planarSmallStretch_floor {H L t : ℝ} (hH : 0 < H) (hL : 0 ≤ L) (hLH : L ≤ H)
    (ht : 0 ≤ t) (htJ : t ≤ 1-L/H) :
    H*t^2/4 ≤ (Real.sqrt H-Real.sqrt L)^2 := by
  have hu := Real.sq_sqrt hH.le
  have hv := Real.sq_sqrt hL
  have hdiff := sub_nonneg.mpr (Real.sqrt_le_sqrt hLH)
  have hdiff' : t*H ≤ H-L := by
    have hh := (mul_le_mul_of_nonneg_right htJ hH.le)
    field_simp [hH.ne'] at hh
    linarith
  have hf : t * Real.sqrt H ≤ 2 * (Real.sqrt H-Real.sqrt L) := by
    apply le_of_mul_le_mul_right (a := Real.sqrt H)
    · nlinarith [mul_nonneg hdiff hdiff]
    · exact Real.sqrt_pos.mpr hH
  nlinarith [sq_le_sq₀ (mul_nonneg ht (Real.sqrt_nonneg H)) (by linarith : 0 ≤ 2*(Real.sqrt H-Real.sqrt L)) |>.mpr hf,
    show (t*Real.sqrt H)^2 = t^2*H by rw [mul_pow,hu]]

/-- The positive lower eigenvalue on the terminal point of one marked chain.
The logarithmic comparison is supplied for these same centers. The distortion
comparison runs on the actual closed planar disks between them. -/
theorem markedChain_smallStretch_floor {T : ℝ × ℝ → ℝ} (c : ℕ → ℝ × ℝ) {n : ℕ}
    (H L : ℕ → ℝ) {t : ℝ} (ht : 0 ≤ t) (hH : ∀ j, 0 < H j)
    (hL : 0 ≤ L n) (hLH : L n ≤ H n)
    (hId : T (c n) = 1-L n/H n)
    (hStep : ∀ j < n, c (j+1) ∈ planarClosedDisk (c j) (1/16))
    (hT : ∀ j < n, ∀ p ∈ planarClosedDisk (c j) (1/8),
      ContDiffAt ℝ 2 T p ∧ 0 ≤ T p ∧ pauseLap T p ≤ 236*T p)
    (hSeed : ∀ p ∈ planarClosedDisk (c 0) (1/32), t ≤ T p)
    (hLog : ∀ j < n, Real.log (59/H (j+1)) ≤ 3*Real.log (59/H j)+1) :
    59 * Real.exp (-((3:ℝ)^n*Real.log (59/H 0)+((3:ℝ)^n-1)/2)) *
        ((7/144:ℝ)^n*t)^2 / 4 ≤ (Real.sqrt (H n)-Real.sqrt (L n))^2 := by
  have hdist := harmonicDisk_chain c ht hStep hT hSeed (c n)
    (show c n ∈ planarClosedDisk (c n) (1/32) by
      simp [planarClosedDisk, planarRadiusSq])
  rw [hId] at hdist
  have hRec (j : ℕ) (hj : j ≤ n) :
      Real.log (59/H j) ≤ (3:ℝ)^j*Real.log (59/H 0)+((3:ℝ)^j-1)/2 := by
    induction j with
    | zero => simp
    | succ j ih =>
      have h := hLog j (Nat.lt_of_succ_le hj)
      have h' := ih (Nat.le_of_succ_le hj)
      rw [pow_succ]
      linarith
  have hh := harmonicStretch_lower_of_log_bound (hH n) (hRec n le_rfl)
  exact (div_le_div_of_nonneg_right (mul_le_mul_of_nonneg_right hh (sq_nonneg _)) (by norm_num)).trans
    (planarSmallStretch_floor (hH n) hL hLH (by positivity) hdist)

/-- Sum over all four ordered frame slots in dimension four. -/
theorem fixedBand_frameSq_le {R : CurvatureFrameTensor} {b : ℝ}
    (hb : ∀ i j k l, |R i j k l| ≤ b) : frameTensorNormSq R ≤ 256*b^2 := by
  unfold frameTensorNormSq
  calc
    _ ≤ ∑ _i : Fin 4, ∑ _j : Fin 4, ∑ _k : Fin 4, ∑ _l : Fin 4, b^2 := by
      refine Finset.sum_le_sum fun i _ => Finset.sum_le_sum fun j _ =>
        Finset.sum_le_sum fun k _ => Finset.sum_le_sum fun l _ => ?_
      have hr := hb i j k l
      simpa only [sq_abs] using pow_le_pow_left₀ (abs_nonneg _) hr 2
    _ = _ := by simp; ring

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)
variable {Y : Type*} [TopologicalSpace Y] [ChartedSpace E₄ Y] [IsManifold I₄ ∞ Y]
  [T2Space Y] [SigmaCompactSpace Y] [BoundarylessManifold I₄ Y]
private local instance : MeasurableSpace Y := borel Y
private local instance : BorelSpace Y := ⟨rfl⟩

/-- Integrate on the entire band with the assembled metric's own volume.
Both real two-form Hilbert–Schmidt energies obey the same enclosure. -/
theorem fullBand_signedCost_le (g : SmoothRiemannianMetric I₄ Y)
    (o : ManifoldOrientation I₄ Y 4) (frame : ∀ x, OrientedOrthonormalFrameAt g o x)
    (A : Set Y) {Λ : ℝ}
    (hFin : IsFiniteMeasure ((riemannianVolumeMeasure I₄ Y g).restrict A))
    (hvol : ((riemannianVolumeMeasure I₄ Y g).restrict A).real univ ≤ 10^19)
    (hrm : ∀ᵐ x ∂(riemannianVolumeMeasure I₄ Y g).restrict A, ∀ i j k l,
      |metricCurvatureFrameTensor g o x (frame x) i j k l| ≤ 10^33 * Λ^3) :
    Bour.bourChargeOn o g frame A .plus ≤ 10^88*Λ^6 ∧
    Bour.bourChargeOn o g frame A .minus ≤ 10^88*Λ^6 := by
  have hs := bourClosedCapShell_integral_bounds g o frame A hFin
    (hrm.mono fun x hx => ((intrinsicTerminalCharge_eq_modifiedChargeDensity g o frame x).1).le.trans
      (fixedBand_frameSq_le hx))
  have h := mul_le_mul_of_nonneg_left hvol (by positivity : 0 ≤ 256*(10^33*Λ^3)^2/4)
  have hb : 256*(10^33*Λ^3)^2/4*(10^19:ℝ) ≤ 10^88*Λ^6 := by
    nlinarith only [show 0 ≤ Λ^6 by positivity]
  exact ⟨hs.1.trans (h.trans hb),hs.2.1.trans (h.trans hb)⟩

end SmoothPoincare.IntrinsicEntry
