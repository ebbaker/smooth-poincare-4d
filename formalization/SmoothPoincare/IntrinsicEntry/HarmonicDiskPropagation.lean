import SmoothPoincare.IntrinsicEntry.HarmonicSeamCorridor
import DifferentialGeometry.Analysis.Calculus.LocalExtrema

/-! # Lower bounds along a chain of disks in the physical planar marking -/

open Set Filter Topology

noncomputable section

namespace SmoothPoincare.IntrinsicEntry

/-- Euclidean squared radius in the two physical planar coordinates. -/
def planarRadiusSq (c p : ℝ × ℝ) : ℝ := (p.1 - c.1)^2 + (p.2 - c.2)^2

/-- Closed Euclidean disks in those coordinates. -/
def planarClosedDisk (c : ℝ × ℝ) (r : ℝ) : Set (ℝ × ℝ) :=
  {p | planarRadiusSq c p ≤ r^2}

private def propagationAnnulus (c : ℝ × ℝ) (s : ℝ) : Set (ℝ × ℝ) :=
  {p | s^2 ≤ planarRadiusSq c p ∧ p ∈ planarClosedDisk c (1/8)}

/-- Barrier vanishing at outer radius `1/8`. Its inner value is at most the
seed `t`. Squared radius avoids a radial square root in the derivatives. -/
def harmonicDiskBarrier (c : ℝ × ℝ) (s t : ℝ) (p : ℝ × ℝ) : ℝ :=
  t * s^2 * ((planarRadiusSq c p)⁻¹ - 64)

private theorem planarRadiusSq_smooth (c : ℝ × ℝ) : ContDiff ℝ 2 (planarRadiusSq c) := by
  unfold planarRadiusSq
  fun_prop

private theorem harmonicDiskBarrier_contDiffAt (c : ℝ × ℝ) (s t : ℝ) {p : ℝ × ℝ}
    (hp : planarRadiusSq c p ≠ 0) : ContDiffAt ℝ 2 (harmonicDiskBarrier c s t) p :=
  contDiffAt_const.mul (((planarRadiusSq_smooth c).contDiffAt.inv hp).sub contDiffAt_const)

private theorem negativePotential_second_sub {f g : ℝ → ℝ} {x : ℝ}
    (hf : ContDiffAt ℝ 2 f x) (hg : ContDiffAt ℝ 2 g x) :
    deriv (deriv (fun y => f y - g y)) x = deriv (deriv f) x - deriv (deriv g) x := by
  have he : deriv (fun y => f y - g y) =ᶠ[𝓝 x] fun y => deriv f y - deriv g y := by
    filter_upwards [hf.eventually (by norm_num), hg.eventually (by norm_num)] with y hy hz
    exact deriv_sub (hy.differentiableAt (by norm_num)) (hz.differentiableAt (by norm_num))
  rw [he.deriv_eq]
  exact deriv_sub ((hf.derivWithin (m := 1) (by norm_num)).differentiableAt (by norm_num))
    ((hg.derivWithin (m := 1) (by norm_num)).differentiableAt (by norm_num))

private theorem inverse_quadratic_second (a b x K C : ℝ) (hx : (x - a)^2 + b ≠ 0) :
    deriv (deriv (fun y : ℝ => K * ((((y-a)^2 + b)⁻¹) - C))) x =
      K * (-2 / ((x-a)^2 + b)^2 + 8 * (x-a)^2 / ((x-a)^2 + b)^3) := by
  let q (y : ℝ) := (y-a)^2 + b
  let u (y : ℝ) := -2 * (y-a)
  have hq (y : ℝ) : HasDerivAt q (2*(y-a)) y := by
    simpa [q, id] using (((hasDerivAt_id y).sub_const a).pow 2).add_const b
  have hu (y : ℝ) : HasDerivAt u (-2) y := by
    simpa [u] using (((hasDerivAt_id y).sub_const a).const_mul (-2))
  have hqn : q x ≠ 0 := hx
  have he : deriv (fun y => K * ((q y)⁻¹ - C)) =ᶠ[𝓝 x] fun y => K * (u y / (q y)^2) := by
    have hqc : Continuous q := by unfold q; fun_prop
    filter_upwards [hqc.continuousAt.eventually_ne hqn] with y hy
    convert (((hq y).inv hy).sub_const C).const_mul K |>.deriv using 1
    simp [u, neg_mul]
  change deriv (deriv (fun y => K * ((q y)⁻¹ - C))) x = _
  have hd := (((hu x).div ((hq x).pow 2) (pow_ne_zero 2 hqn)).const_mul K).deriv
  simp only [Pi.pow_apply, Pi.div_apply, Nat.cast_ofNat, Nat.reduceSubDiff, pow_one] at hd
  rw [he.deriv_eq, hd]
  dsimp [u, q]
  field_simp [hx]
  ring

/-- The flat Laplacian of the inverse-square radial barrier in the original
two coordinates is `4 t s² / |p-c|⁴`, away from the disk center. -/
theorem harmonicDiskBarrier_lap (c : ℝ × ℝ) (s t : ℝ) {p : ℝ × ℝ}
    (hp : planarRadiusSq c p ≠ 0) :
    pauseLap (harmonicDiskBarrier c s t) p = 4 * (t * s^2) / (planarRadiusSq c p)^2 := by
  have hx : (p.1-c.1)^2 + (p.2-c.2)^2 ≠ 0 := hp
  have hy : (p.2-c.2)^2 + (p.1-c.1)^2 ≠ 0 := by rwa [add_comm]
  unfold pauseLap harmonicDiskBarrier
  have h1 := inverse_quadratic_second c.1 ((p.2-c.2)^2) p.1 (t*s^2) 64 hx
  have h2 := inverse_quadratic_second c.2 ((p.1-c.1)^2) p.2 (t*s^2) 64 hy
  have hslice : (fun y => t * s^2 * ((planarRadiusSq c (p.1,y))⁻¹ - 64)) =
      fun y => t * s^2 * ((((y-c.2)^2 + (p.1-c.1)^2)⁻¹) - 64) := by
    funext y
    unfold planarRadiusSq
    rw [add_comm]
  rw [hslice]
  change deriv (deriv (fun y => t * s^2 * ((((y-c.1)^2 + (p.2-c.2)^2)⁻¹) - 64))) p.1 + _ = _
  rw [h1, h2, planarRadiusSq, add_comm ((p.2-c.2)^2) ((p.1-c.1)^2)]
  field_simp [hx]
  ring

private theorem propagationAnnulus_compact (c : ℝ × ℝ) (s : ℝ) :
    IsCompact (propagationAnnulus c s) := by
  let box := Icc (c.1 - 1/8) (c.1 + 1/8) ×ˢ Icc (c.2 - 1/8) (c.2 + 1/8)
  have hcont := (planarRadiusSq_smooth c).continuous
  have hclosed : IsClosed (propagationAnnulus c s) :=
    (isClosed_le continuous_const hcont).inter (isClosed_le hcont continuous_const)
  have hsub : propagationAnnulus c s ⊆ box := by
    intro p hp
    have h1 : (p.1 - c.1)^2 ≤ (1/8 : ℝ)^2 := by
      have h := hp.2
      change (p.1 - c.1)^2 + (p.2 - c.2)^2 ≤ (1/8 : ℝ)^2 at h
      linarith only [h, sq_nonneg (p.2-c.2)]
    have h2 : (p.2 - c.2)^2 ≤ (1/8 : ℝ)^2 := by
      have h := hp.2
      change (p.1 - c.1)^2 + (p.2 - c.2)^2 ≤ (1/8 : ℝ)^2 at h
      linarith only [h, sq_nonneg (p.1-c.1)]
    have habs₁ : |p.1 - c.1| ≤ 1/8 :=
      (sq_le_sq₀ (abs_nonneg _) (by norm_num)).mp (by simpa only [sq_abs] using h1)
    have habs₂ : |p.2 - c.2| ≤ 1/8 :=
      (sq_le_sq₀ (abs_nonneg _) (by norm_num)).mp (by simpa only [sq_abs] using h2)
    obtain ⟨hl₁, hu₁⟩ := abs_le.mp habs₁
    obtain ⟨hl₂, hu₂⟩ := abs_le.mp habs₂
    change p.1 ∈ Icc (c.1 - 1/8) (c.1 + 1/8) ∧ p.2 ∈ Icc (c.2 - 1/8) (c.2 + 1/8)
    exact ⟨⟨by linarith, by linarith⟩, ⟨by linarith, by linarith⟩⟩
  exact (isCompact_Icc.prod isCompact_Icc).of_isClosed_subset hclosed hsub

private theorem harmonicDiskBarrier_subsolution (c : ℝ × ℝ) (s t : ℝ) (ht : 0 ≤ t)
    {p : ℝ × ℝ} (hpos : 0 < planarRadiusSq c p) (hR : p ∈ planarClosedDisk c (1/8)) :
    236 * harmonicDiskBarrier c s t p ≤ pauseLap (harmonicDiskBarrier c s t) p := by
  let q := planarRadiusSq c p
  have hq : 0 < q := hpos
  change q ≤ (1/8 : ℝ)^2 at hR
  have h236 : 236 * q ≤ 4 := by linarith
  have hInv : 236 * q⁻¹ ≤ 4 / q^2 := by
    apply (le_div_iff₀ (sq_pos_of_pos hq)).2
    rw [← one_div]
    field_simp [hq.ne']
    nlinarith only [h236, mul_le_mul_of_nonneg_right h236 hq.le]
  rw [harmonicDiskBarrier_lap c s t hq.ne']
  change 236 * (t * s^2 * (q⁻¹ - 64)) ≤ 4 * (t * s^2) / q^2
  calc
    _ ≤ t * s^2 * (236 * q⁻¹) := by
      have hnonneg := mul_nonneg ht (sq_nonneg s)
      nlinarith only [hnonneg]
    _ ≤ t * s^2 * (4 / q^2) := mul_le_mul_of_nonneg_left hInv (mul_nonneg ht (sq_nonneg _))
    _ = _ := by ring

/-- Comparison on the entire closed annulus. Positivity and the differential
inequality are on the same physical planar disk. At a positive interior
maximum of `barrier - T`, both genuine axis second derivatives are nonpositive. -/
theorem harmonicDiskBarrier_le {T : ℝ × ℝ → ℝ} (c : ℝ × ℝ) {s t : ℝ}
    (hs : 0 < s) (ht : 0 ≤ t)
    (hT : ∀ p ∈ planarClosedDisk c (1/8), ContDiffAt ℝ 2 T p)
    (hNonneg : ∀ p ∈ planarClosedDisk c (1/8), 0 ≤ T p)
    (hΔ : ∀ p ∈ planarClosedDisk c (1/8), pauseLap T p ≤ 236 * T p)
    (hSeed : ∀ p ∈ planarClosedDisk c s, t ≤ T p)
    {p : ℝ × ℝ} (hInner : s^2 ≤ planarRadiusSq c p) (hOuter : p ∈ planarClosedDisk c (1/8)) :
    harmonicDiskBarrier c s t p ≤ T p := by
  let A := propagationAnnulus c s
  let v := harmonicDiskBarrier c s t
  let f : ℝ × ℝ → ℝ := fun x => v x - T x
  have hp : p ∈ A := ⟨hInner, hOuter⟩
  have hs2 := sq_pos_of_pos hs
  have hC : ∀ x ∈ A, ContDiffAt ℝ 2 f x := fun x hx =>
    (harmonicDiskBarrier_contDiffAt c s t (hs2.trans_le hx.1).ne').sub (hT x hx.2)
  obtain ⟨x, hx, hMax⟩ := (propagationAnnulus_compact c s).exists_isMaxOn ⟨p,hp⟩
    (fun x hx => (hC x hx).continuousAt.continuousWithinAt)
  by_contra! hn
  have hPos : 0 < f x := (sub_pos.mpr hn).trans_le (hMax hp)
  have hq : 0 < planarRadiusSq c x := hs2.trans_le hx.1
  have hStrict₁ : s^2 < planarRadiusSq c x := by
    refine lt_of_le_of_ne hx.1 ?_
    intro hEq
    have hseed := hSeed x (le_of_eq hEq.symm)
    have hBar : v x ≤ t := by
      change t * s^2 * ((planarRadiusSq c x)⁻¹ - 64) ≤ t
      rw [← hEq]
      calc
        _ ≤ t * s^2 * (s^2)⁻¹ := mul_le_mul_of_nonneg_left (by linarith) (mul_nonneg ht (sq_nonneg _))
        _ = _ := by rw [mul_assoc, mul_inv_cancel₀ hs2.ne', mul_one]
    exact hPos.not_ge (sub_nonpos.mpr (hBar.trans hseed))
  have hStrict₂ : planarRadiusSq c x < (1/8 : ℝ)^2 := by
    refine lt_of_le_of_ne hx.2 ?_
    intro hEq
    have hBar : v x = 0 := by
      change t * s^2 * ((planarRadiusSq c x)⁻¹ - 64) = 0
      rw [hEq]
      norm_num
    exact hPos.not_ge (sub_nonpos.mpr (hBar.le.trans (hNonneg x hx.2)))
  have hci := (planarRadiusSq_smooth c).continuous
  have hOpen : IsOpen {p | s^2 < planarRadiusSq c p ∧ planarRadiusSq c p < (1/8 : ℝ)^2} :=
    (isOpen_lt continuous_const hci).inter (isOpen_lt hci continuous_const)
  have hLocal := hMax.isLocalMax (mem_of_superset (hOpen.mem_nhds ⟨hStrict₁,hStrict₂⟩)
    (fun _ hy => ⟨hy.1.le, hy.2.le⟩))
  have hxMax : IsLocalMax (fun y : ℝ => f (y,x.2)) x.1 :=
    hLocal.comp_continuous (g := fun y => (y,x.2)) (by fun_prop)
  have hyMax : IsLocalMax (fun y : ℝ => f (x.1,y)) x.2 :=
    hLocal.comp_continuous (g := fun y => (x.1,y)) (by fun_prop)
  have hcx : ContinuousAt f x := (hC x hx).continuousAt
  have hxLine : ContDiff ℝ 2 (fun y : ℝ => (y,x.2)) := by fun_prop
  have hyLine : ContDiff ℝ 2 (fun y : ℝ => (x.1,y)) := by fun_prop
  have hxCont : ContinuousAt (fun y : ℝ => f (y,x.2)) x.1 :=
    hcx.comp' hxLine.continuous.continuousAt
  have hyCont : ContinuousAt (fun y : ℝ => f (x.1,y)) x.2 :=
    hcx.comp' hyLine.continuous.continuousAt
  have hLap : pauseLap f x ≤ 0 := add_nonpos
    (hxMax.deriv_deriv_nonpos hxCont) (hyMax.deriv_deriv_nonpos hyCont)
  have hvx : ContDiffAt ℝ 2 v x := harmonicDiskBarrier_contDiffAt c s t hq.ne'
  have hTx := hT x hx.2
  have hLapEq : pauseLap f x = pauseLap v x - pauseLap T x := by
    unfold pauseLap f
    have hxCalc := negativePotential_second_sub
      (hvx.comp x.1 hxLine.contDiffAt) (hTx.comp x.1 hxLine.contDiffAt)
    have hyCalc := negativePotential_second_sub
      (hvx.comp x.2 hyLine.contDiffAt) (hTx.comp x.2 hyLine.contDiffAt)
    simp only [Function.comp_def] at hxCalc hyCalc
    rw [hxCalc, hyCalc]
    ring
  have hSub := harmonicDiskBarrier_subsolution c s t ht hq hx.2
  have hSup := hΔ x hx.2
  change 0 < v x - T x at hPos
  change 236 * v x ≤ pauseLap v x at hSub
  linarith only [hLap, hLapEq, hSub, hSup, hPos]

/-- With inner radius `1/32`, every point up to radius `3/32` retains at
least `7/144` of the seed. -/
theorem harmonicDisk_propagate {T : ℝ × ℝ → ℝ} (c : ℝ × ℝ) {t : ℝ} (ht : 0 ≤ t)
    (hT : ∀ p ∈ planarClosedDisk c (1/8), ContDiffAt ℝ 2 T p)
    (hNonneg : ∀ p ∈ planarClosedDisk c (1/8), 0 ≤ T p)
    (hΔ : ∀ p ∈ planarClosedDisk c (1/8), pauseLap T p ≤ 236 * T p)
    (hSeed : ∀ p ∈ planarClosedDisk c (1/32), t ≤ T p) :
    ∀ p ∈ planarClosedDisk c (3/32), (7/144) * t ≤ T p := by
  intro p hp
  by_cases hNear : p ∈ planarClosedDisk c (1/32)
  · exact (mul_le_of_le_one_left ht (by norm_num)).trans (hSeed p hNear)
  · have hInner : (1/32 : ℝ)^2 ≤ planarRadiusSq c p := le_of_not_ge hNear
    have hpos : 0 < planarRadiusSq c p := (by norm_num : 0 < (1/32 : ℝ)^2).trans_le hInner
    have hOuter : p ∈ planarClosedDisk c (1/8) :=
      le_trans hp (by norm_num : (3/32 : ℝ)^2 ≤ (1/8)^2)
    have hCmp := harmonicDiskBarrier_le c (by norm_num : 0 < (1/32 : ℝ)) ht hT hNonneg hΔ hSeed hInner hOuter
    have hInv : ((3/32 : ℝ)^2)⁻¹ ≤ (planarRadiusSq c p)⁻¹ :=
      inv_anti₀ hpos hp
    calc
      _ = t * (1/32 : ℝ)^2 * (((3/32 : ℝ)^2)⁻¹ - 64) := by ring
      _ ≤ harmonicDiskBarrier c (1/32) t p :=
        mul_le_mul_of_nonneg_left (sub_le_sub_right hInv _) (mul_nonneg ht (sq_nonneg _))
      _ ≤ _ := hCmp

/-- Centers at most `1/16` apart carry the next seed disk into the region
where the previous application propagated its lower bound. -/
theorem planarClosedDisk_overlap {c d : ℝ × ℝ} (hcd : d ∈ planarClosedDisk c (1/16)) :
    planarClosedDisk d (1/32) ⊆ planarClosedDisk c (3/32) := by
  intro p hp
  change planarRadiusSq c d ≤ (1/16 : ℝ)^2 at hcd
  change planarRadiusSq d p ≤ (1/32 : ℝ)^2 at hp
  change planarRadiusSq c p ≤ (3/32 : ℝ)^2
  have htri : planarRadiusSq c p ≤ (3/2) * planarRadiusSq c d + 3 * planarRadiusSq d p := by
    unfold planarRadiusSq
    nlinarith [sq_nonneg ((d.1-c.1) - 2*(p.1-d.1)),
      sq_nonneg ((d.2-c.2) - 2*(p.2-d.2))]
  nlinarith only [htri, hcd, hp]

/-- Iteration on the actual finite chain. All `1/8` disks used by the proof
are tested without moving their centers or replacing the physical field. -/
theorem harmonicDisk_chain {T : ℝ × ℝ → ℝ} (c : ℕ → ℝ × ℝ) {n : ℕ} {t : ℝ} (ht : 0 ≤ t)
    (hStep : ∀ j < n, c (j+1) ∈ planarClosedDisk (c j) (1/16))
    (hT : ∀ j < n, ∀ p ∈ planarClosedDisk (c j) (1/8),
      ContDiffAt ℝ 2 T p ∧ 0 ≤ T p ∧ pauseLap T p ≤ 236 * T p)
    (hSeed : ∀ p ∈ planarClosedDisk (c 0) (1/32), t ≤ T p) :
    ∀ p ∈ planarClosedDisk (c n) (1/32), (7/144 : ℝ)^n * t ≤ T p := by
  have hAll (j : ℕ) : j ≤ n → ∀ p ∈ planarClosedDisk (c j) (1/32), (7/144 : ℝ)^j * t ≤ T p := by
    induction j with
    | zero =>
      intro _ p hp
      simpa using hSeed p hp
    | succ j ih =>
      intro hj p hp
      have hj' := Nat.lt_of_succ_le hj
      have hBound := harmonicDisk_propagate (c j) (show 0 ≤ (7/144 : ℝ)^j * t by positivity)
        (fun q hq => (hT j hj' q hq).1) (fun q hq => (hT j hj' q hq).2.1)
        (fun q hq => (hT j hj' q hq).2.2) (ih hj'.le) p (planarClosedDisk_overlap (hStep j hj') hp)
      simpa only [pow_succ', mul_assoc] using hBound
  exact hAll n le_rfl

end SmoothPoincare.IntrinsicEntry
