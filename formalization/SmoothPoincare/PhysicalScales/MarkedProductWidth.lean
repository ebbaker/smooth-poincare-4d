import DifferentialGeometry.Geometry.Metric.Cylinder
import DifferentialGeometry.Geometry.Metric.Lipschitz.Smooth
import SmoothPoincare.PhysicalScales.PositiveProductBand
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Series

/-! # Intrinsic width on a marked physical band

Curves range over the original metric carrier and stay in the closed image
of the marked band. The lower bound comes from the inverse marking's normal
coordinate. A marked normal segment attains it.
-/

open DifferentialGeometry DifferentialGeometry.Geometry DifferentialGeometry.Geometry.Metric
  Manifold MeasureTheory Set Filter
open scoped Manifold ContDiff ENNReal Topology

namespace SmoothPoincare.PositiveScalarCuts

noncomputable section

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

/-- Riemannian length on the unit parameter interval. Endpoints have zero
parameter measure. -/
def markedBandPathELength (g : SmoothRiemannianMetric I M) (γ : ℝ → M) : ℝ≥0∞ :=
  ∫⁻ t in Ioo (0 : ℝ) 1, ENNReal.ofReal (Real.sqrt (g.inner (γ t)
    (mfderiv 𝓘(ℝ) I γ t 1) (mfderiv 𝓘(ℝ) I γ t 1)))

/-- Intrinsic separation of the two faces through curves in the same band,
using the smooth Riemannian path-length convention. -/
def markedBandEWidth (g : SmoothRiemannianMetric I M) (band lower upper : Set M) : ℝ≥0∞ :=
  ⨅ (γ : ℝ → M) (_ : ContMDiffOn 𝓘(ℝ) I 1 γ (Icc (0 : ℝ) 1) ∧
    MapsTo γ (Icc (0 : ℝ) 1) band ∧ γ 0 ∈ lower ∧ γ 1 ∈ upper), markedBandPathELength g γ

variable {F G Y : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F] [TopologicalSpace G]
  {J : ModelWithCorners ℝ F G} [TopologicalSpace Y] [ChartedSpace G Y] [IsManifold J ∞ Y]

local notation "Jℝ" => J.prod 𝓘(ℝ)

omit [IsManifold I ∞ M] [IsManifold J ∞ Y] in
private theorem mfderiv_mark_right_inverse
    (Φ : PartialDiffeomorph Jℝ I (Y × ℝ) M ∞) {p : Y × ℝ} (hp : p ∈ Φ.source)
    (v : TangentSpace I (Φ p)) :
    mfderiv Jℝ I Φ p (mfderiv I Jℝ Φ.symm (Φ p) v) = v := by
  have hdiff := mfderiv_comp_apply (Φ p)
    (Φ.mdifferentiableAt (by simp) (Φ.map_target (Φ.map_source hp)))
    (Φ.symm.mdifferentiableAt (by simp) (Φ.map_source hp)) v
  have hIdentity : ((Φ : Y × ℝ → M) ∘ (Φ.symm : M → Y × ℝ)) =ᶠ[𝓝 (Φ p)] id :=
    eventuallyEq_of_mem (Φ.open_target.mem_nhds (Φ.map_source hp)) (fun x hx => Φ.right_inv hx)
  erw [hIdentity.mfderiv_eq, mfderiv_id, Φ.left_inv hp] at hdiff
  exact hdiff.symm

omit [IsManifold I ∞ M] [IsManifold J ∞ Y] in
private theorem markedBand_height_derivative
    (Φ : PartialDiffeomorph Jℝ I (Y × ℝ) M ∞) {x : M} (hx : x ∈ Φ.target)
    (v : TangentSpace I x) :
    mfderiv I 𝓘(ℝ) (fun z : M => (Φ.symm z).2) x v = (mfderiv I Jℝ Φ.symm x v).2 := by
  have hn := mfderiv_comp_apply x (mdifferentiableAt_snd (I := J) (I' := 𝓘(ℝ)))
    (Φ.symm.mdifferentiableAt (by simp) hx) v
  rw [mfderiv_snd] at hn
  exact hn

omit [IsManifold I ∞ M] [IsManifold J ∞ Y] in
set_option backward.isDefEq.respectTransparency false in
private theorem markedBand_vertical_derivative
    (Φ : PartialDiffeomorph Jℝ I (Y × ℝ) M ∞) (y : Y) (a b t : ℝ)
    (hp : (y, a + (b - a) * t) ∈ Φ.source) :
    mfderiv 𝓘(ℝ) I (fun s : ℝ => Φ (y, a + (b - a) * s)) t 1 =
      mfderiv Jℝ I Φ (y, a + (b - a) * t) (0, b - a) := by
  let ℓ : ℝ → ℝ := fun s => a + (b - a) * s
  have hℓ : ContMDiff 𝓘(ℝ) 𝓘(ℝ) 1 ℓ := by
    rw [contMDiff_iff_contDiff]
    exact contDiff_const.add (contDiff_const.mul contDiff_id)
  have hline : (mfderiv 𝓘(ℝ) 𝓘(ℝ) ℓ t 1 : ℝ) = b - a := by
    rw [mfderiv_eq_fderiv, fderiv_const_add, fderiv_const_mul differentiableAt_id]
    rw [show (fun s : ℝ => s) = id from rfl, fderiv_id]
    change (b - a) * 1 = b - a
    exact mul_one _
  have hLift : mfderiv 𝓘(ℝ) Jℝ (fun s : ℝ => (y, ℓ s)) t 1 =
      ((0, b - a) : TangentSpace Jℝ (y, ℓ t)) := by
    rw [mfderiv_prodMk mdifferentiableAt_const (hℓ.mdifferentiableAt (by norm_num))]
    change (mfderiv 𝓘(ℝ) J (fun _ : ℝ => y) t 1, mfderiv 𝓘(ℝ) 𝓘(ℝ) ℓ t 1) =
      ((0, b - a) : TangentSpace Jℝ (y, ℓ t))
    exact Prod.ext (by rw [mfderiv_const]; rfl) hline
  have hcomp := mfderiv_comp_apply t (Φ.mdifferentiableAt (by simp) hp)
    ((contMDiff_const.prodMk hℓ).mdifferentiableAt (by norm_num)) 1
  exact hcomp.trans (congrArg (mfderiv Jℝ I Φ (y, ℓ t)) hLift)

omit [IsManifold J ∞ Y] in
attribute [-instance] Tensor0SBundle.tangentSpaceNormedAddCommGroup
  Tensor0SBundle.tangentSpaceNormedSpace in
set_option backward.isDefEq.respectTransparency false in
/-- An actual marked metric with unit normal lapse and orthogonal normal
segments has intrinsic width equal to its coordinate length. The two speed
hypotheses are needed only on the closed band, allowing the tangential metric
to vary with height. -/
theorem markedBandEWidth_and_attainment [Nonempty Y]
    (g : SmoothRiemannianMetric I M) (Φ : PartialDiffeomorph Jℝ I (Y × ℝ) M ∞)
    {a b : ℝ} (hab : a ≤ b) (hBand : univ ×ˢ Icc a b ⊆ Φ.source)
    (hLower : ∀ p ∈ univ ×ˢ Icc a b, ∀ v : TangentSpace Jℝ p,
      v.2 ^ 2 ≤ g.inner (Φ p) (mfderiv Jℝ I Φ p v) (mfderiv Jℝ I Φ p v))
    (hVertical : ∀ p ∈ univ ×ˢ Icc a b, ∀ s : ℝ,
      g.inner (Φ p) (mfderiv Jℝ I Φ p (0, s)) (mfderiv Jℝ I Φ p (0, s)) = s ^ 2) :
    let band := Φ '' (univ ×ˢ Icc a b)
    let lower := Φ '' (univ ×ˢ {a})
    let upper := Φ '' (univ ×ˢ {b})
    markedBandEWidth g band lower upper = ENNReal.ofReal (b - a) ∧
      ∃ γ : ℝ → M, ContMDiffOn 𝓘(ℝ) I 1 γ (Icc (0 : ℝ) 1) ∧
        MapsTo γ (Icc (0 : ℝ) 1) band ∧ γ 0 ∈ lower ∧ γ 1 ∈ upper ∧
        markedBandPathELength g γ = ENNReal.ofReal (b - a) := by
  dsimp only
  have ha : a ∈ Icc a b := ⟨le_rfl, hab⟩
  have hb : b ∈ Icc a b := ⟨hab, le_rfl⟩
  have hTarget : Φ '' (univ ×ˢ Icc a b) ⊆ Φ.target := by
    rintro _ ⟨p, hp, rfl⟩
    exact Φ.map_source (hBand hp)
  let height : M → ℝ := fun z => (Φ.symm z).2
  have hHeight : ContMDiffOn I 𝓘(ℝ) 1 height Φ.target :=
    contMDiff_snd.comp_contMDiffOn (Φ.symm.contMDiffOn_toFun.of_le (by simp))
  have hNorm {x : M} (hx : x ∈ Φ '' (univ ×ˢ Icc a b)) (v : TangentSpace I x) :
      @Norm.norm ℝ inferInstance (mfderiv I 𝓘(ℝ) height x v) ≤
        1 * Real.sqrt (g.inner x v v) := by
    obtain ⟨p, hp, rfl⟩ := hx
    have hder := markedBand_height_derivative Φ (Φ.map_source (hBand hp)) v
    change mfderiv I 𝓘(ℝ) height (Φ p) v = _ at hder
    have hh := hLower p hp (mfderiv I Jℝ Φ.symm (Φ p) v)
    rw [mfderiv_mark_right_inverse Φ (hBand hp) v] at hh
    rw [hder, one_mul]
    simpa only [Real.sqrt_sq_eq_abs, Real.norm_eq_abs] using Real.sqrt_le_sqrt hh
  have hAttained : ∃ γ : ℝ → M, ContMDiffOn 𝓘(ℝ) I 1 γ (Icc (0 : ℝ) 1) ∧
        MapsTo γ (Icc (0 : ℝ) 1) (Φ '' (univ ×ˢ Icc a b)) ∧
        γ 0 ∈ Φ '' (univ ×ˢ {a}) ∧ γ 1 ∈ Φ '' (univ ×ˢ {b}) ∧
        markedBandPathELength g γ = ENNReal.ofReal (b - a) := by
    let y : Y := Classical.choice ‹Nonempty Y›
    let lift : ℝ → Y × ℝ := fun t => (y, a + (b - a) * t)
    have hLiftSmooth : ContMDiff 𝓘(ℝ) Jℝ 1 lift := by
      apply contMDiff_const.prodMk
      rw [contMDiff_iff_contDiff]
      exact contDiff_const.add (contDiff_const.mul contDiff_id)
    have hLift : MapsTo lift (Icc (0 : ℝ) 1) (univ ×ˢ Icc a b) := by
      intro t ht
      refine ⟨mem_univ _, ?_, ?_⟩
      · exact le_add_of_nonneg_right (mul_nonneg (sub_nonneg.mpr hab) ht.1)
      · have hle := mul_le_mul_of_nonneg_left ht.2 (sub_nonneg.mpr hab)
        change a + (b - a) * t ≤ b
        linarith
    let γ : ℝ → M := Φ ∘ lift
    have hγ : ContMDiffOn 𝓘(ℝ) I 1 γ (Icc (0 : ℝ) 1) :=
      (Φ.contMDiffOn_toFun.of_le (by simp)).comp hLiftSmooth.contMDiffOn
        (fun t ht => hBand (hLift ht))
    have hγBand : MapsTo γ (Icc (0 : ℝ) 1) (Φ '' (univ ×ˢ Icc a b)) :=
      fun t ht => ⟨lift t, hLift ht, rfl⟩
    have h0 : γ 0 ∈ Φ '' (univ ×ˢ {a}) := by
      exact ⟨(y, a), ⟨mem_univ _, rfl⟩, by simp [γ, lift]⟩
    have h1 : γ 1 ∈ Φ '' (univ ×ˢ {b}) := by
      exact ⟨(y, b), ⟨mem_univ _, rfl⟩, by simp [γ, lift]⟩
    have hLen : markedBandPathELength g γ = ENNReal.ofReal (b - a) := by
      unfold markedBandPathELength
      trans ∫⁻ _ in Ioo (0 : ℝ) 1, ENNReal.ofReal (b - a)
      · apply setLIntegral_congr_fun measurableSet_Ioo
        intro t ht
        have hp := hLift ⟨ht.1.le, ht.2.le⟩
        change ENNReal.ofReal (Real.sqrt (g.inner (Φ (lift t))
          (mfderiv 𝓘(ℝ) I (fun s : ℝ => Φ (y, a + (b - a) * s)) t 1)
          (mfderiv 𝓘(ℝ) I (fun s : ℝ => Φ (y, a + (b - a) * s)) t 1))) = _
        rw [markedBand_vertical_derivative Φ y a b t (hBand hp), hVertical (lift t) hp,
          Real.sqrt_sq (sub_nonneg.mpr hab)]
      · rw [setLIntegral_const, Real.volume_Ioo]
        norm_num
    exact ⟨γ, hγ, hγBand, h0, h1, hLen⟩
  refine ⟨?_, hAttained⟩
  unfold markedBandEWidth
  apply le_antisymm
  · obtain ⟨γ, hγ, hγBand, h0, h1, hLen⟩ := hAttained
    exact iInf_le_of_le γ (iInf_le_of_le ⟨hγ, hγBand, h0, h1⟩ hLen.le)
  · refine le_iInf fun γ => le_iInf fun hγ => ?_
    rcases hγ with ⟨hSmooth, hIn, h0, h1⟩
    have hStart : height (γ 0) = a := by
      obtain ⟨p, hp, he⟩ := h0
      rw [← he]
      change (Φ.symm (Φ p)).2 = a
      have hpa : p.2 = a := mem_singleton_iff.mp hp.2
      exact (congrArg Prod.snd (Φ.left_inv (hBand ⟨hp.1, hpa ▸ ha⟩))).trans hpa
    have hEnd : height (γ 1) = b := by
      obtain ⟨p, hp, he⟩ := h1
      rw [← he]
      change (Φ.symm (Φ p)).2 = b
      have hpb : p.2 = b := mem_singleton_iff.mp hp.2
      exact (congrArg Prod.snd (Φ.left_inv (hBand ⟨hp.1, hpb ▸ hb⟩))).trans hpb
    have hDist := edist_comp_le_lintegral_of_metric_mfderiv_bound g
      (by norm_num : (0 : ℝ) ≤ 1) (by norm_num : (0 : ℝ) ≤ 1) hSmooth
      (fun t ht => (hHeight _ (hTarget (hIn ht))).contMDiffAt
        (Φ.open_target.mem_nhds (hTarget (hIn ht))))
      (fun t ht v => hNorm (hIn ⟨ht.1.le, ht.2.le⟩) v)
    rw [hStart, hEnd, edist_dist, Real.dist_eq, abs_of_nonpos (sub_nonpos.mpr hab),
      neg_sub, ENNReal.ofReal_one, one_mul] at hDist
    exact hDist

variable [FiniteDimensional ℝ F] [T2Space Y] [Nonempty Y]

/-- Exact cylindrical metric on the marked strip yields its normal-coordinate
width on the original source, with no metric assumption outside the strip. -/
theorem markedBandEWidth_eq_of_cylinderPullback
    (g : SmoothRiemannianMetric I M) (h : SmoothRiemannianMetric J Y)
    (Φ : PartialDiffeomorph Jℝ I (Y × ℝ) M ∞) {a b : ℝ} (hab : a ≤ b)
    (hBand : univ ×ˢ Icc a b ⊆ Φ.source)
    (hMetric : ∀ p ∈ univ ×ˢ Icc a b, ∀ v : TangentSpace Jℝ p,
      g.inner (Φ p) (mfderiv Jℝ I Φ p v) (mfderiv Jℝ I Φ p v) =
        (cylinderMetric h).inner p v v) :
    markedBandEWidth g (Φ '' (univ ×ˢ Icc a b)) (Φ '' (univ ×ˢ {a})) (Φ '' (univ ×ˢ {b})) =
      ENNReal.ofReal (b - a) := by
  have hLower (p : Y × ℝ) (hp : p ∈ univ ×ˢ Icc a b) (v : TangentSpace Jℝ p) :
      v.2 ^ 2 ≤ g.inner (Φ p) (mfderiv Jℝ I Φ p v) (mfderiv Jℝ I Φ p v) := by
    rw [hMetric p hp v, cylinderMetric_inner, pow_two]
    exact le_add_of_nonneg_left (metric_inner_self_nonneg h p.1 v.1)
  have hVertical (p : Y × ℝ) (hp : p ∈ univ ×ˢ Icc a b) (s : ℝ) :
      g.inner (Φ p) (mfderiv Jℝ I Φ p (0, s)) (mfderiv Jℝ I Φ p (0, s)) = s ^ 2 := by
    rw [hMetric p hp (0, s)]
    erw [cylinderMetric_inner, pow_two]
    change h.inner p.1 0 0 + s * s = s * s
    simp
  exact (markedBandEWidth_and_attainment g Φ hab hBand hLower hVertical).1

/-- The actual measured width of each half and of the whole marked cylinder. -/
theorem markedBandEWidth_split_cylinder
    (g : SmoothRiemannianMetric I M) (h : SmoothRiemannianMetric J Y)
    (Φ : PartialDiffeomorph Jℝ I (Y × ℝ) M ∞) {L : ℝ} (hL : 0 ≤ L)
    (hBand : univ ×ˢ Icc (-L / 2) (L / 2) ⊆ Φ.source)
    (hMetric : ∀ p ∈ univ ×ˢ Icc (-L / 2) (L / 2), ∀ v : TangentSpace Jℝ p,
      g.inner (Φ p) (mfderiv Jℝ I Φ p v) (mfderiv Jℝ I Φ p v) =
        (cylinderMetric h).inner p v v) :
    markedBandEWidth g (Φ '' (univ ×ˢ Icc (-L / 2) 0))
        (Φ '' (univ ×ˢ {-L / 2})) (Φ '' (univ ×ˢ {0})) = ENNReal.ofReal (L / 2) ∧
      markedBandEWidth g (Φ '' (univ ×ˢ Icc 0 (L / 2)))
        (Φ '' (univ ×ˢ {0})) (Φ '' (univ ×ˢ {L / 2})) = ENNReal.ofReal (L / 2) ∧
      markedBandEWidth g (Φ '' (univ ×ˢ Icc (-L / 2) (L / 2)))
        (Φ '' (univ ×ˢ {-L / 2})) (Φ '' (univ ×ˢ {L / 2})) = ENNReal.ofReal L := by
  have ha : -L / 2 ≤ 0 := by linarith
  have hb : 0 ≤ L / 2 := by linarith
  have hLeft : (univ : Set Y) ×ˢ Icc (-L / 2) 0 ⊆ univ ×ˢ Icc (-L / 2) (L / 2) :=
    fun _ hp => ⟨hp.1, hp.2.1, hp.2.2.trans hb⟩
  have hRight : (univ : Set Y) ×ˢ Icc 0 (L / 2) ⊆ univ ×ˢ Icc (-L / 2) (L / 2) :=
    fun _ hp => ⟨hp.1, ha.trans hp.2.1, hp.2.2⟩
  refine ⟨?_, ?_, ?_⟩
  · have h := markedBandEWidth_eq_of_cylinderPullback g h Φ ha
      (hLeft.trans hBand) (fun p hp => hMetric p (hLeft hp))
    rwa [show 0 - -L / 2 = L / 2 by ring] at h
  · have h := markedBandEWidth_eq_of_cylinderPullback g h Φ hb
      (hRight.trans hBand) (fun p hp => hMetric p (hRight hp))
    rwa [sub_zero] at h
  · have h := markedBandEWidth_eq_of_cylinderPullback g h Φ (ha.trans hb) hBand hMetric
    rwa [show L / 2 - -L / 2 = L by ring] at h

private theorem two_mul_sqrt_three_lt_cosh_two : 2 * Real.sqrt 3 < Real.cosh 2 := by
  have hSum := (Real.hasSum_cosh 2).summable.sum_le_tsum (Finset.range 3)
    (fun n _ => by positivity)
  rw [← Real.cosh_eq_tsum] at hSum
  norm_num [Finset.sum_range_succ, Nat.factorial] at hSum
  have hRoot : Real.sqrt 3 < 11 / 6 := by
    have hs := Real.sq_sqrt (show (0 : ℝ) ≤ 3 by norm_num)
    nlinarith [Real.sqrt_nonneg 3, sq_nonneg (Real.sqrt 3 - 11 / 6)]
  linarith

/-- The prescribed rank-two section metric's scalar floor, with cutoff
`T = 2`, is positive and strictly less than one. -/
theorem rankTwoProductBand_scalarFloor :
    0 < Real.cosh 2 ^ 2 / Real.cosh (5 / 2) ^ 2 ∧
      Real.cosh 2 ^ 2 / Real.cosh (5 / 2) ^ 2 < 1 := by
  have hCosh : Real.cosh 2 < Real.cosh (5 / 2) := by
    apply Real.cosh_lt_cosh.mpr
    norm_num
  exact ⟨by positivity, (div_lt_one (by positivity)).mpr
    ((sq_lt_sq₀ (Real.cosh_pos _).le (Real.cosh_pos _).le).mpr hCosh)⟩

/-- The two measured radius-`a` necks in the prescribed section metric
give the stated lower bound on `J`. At a qualifying width that bound alone
forces the band energy of each sign above `8π²`. -/
theorem rankTwoProductBand_energy_gt_wall_of_width {ρ a J L : ℝ}
    (hρ : 0 < ρ) (hρOne : ρ ≤ 1) (ha : 0 < a)
    (haBound : a ≤ 1 / Real.cosh 2) (hJ : 16 * Real.pi / (3 * a) ≤ J)
    (hL : 0 ≤ L) (hWidth : 3 * Real.pi ^ 2 ≤ ρ * L ^ 2) :
    8 * Real.pi ^ 2 < L * J / 4 := by
  have hRatio : (3 : ℝ) ≤ 3 / ρ := (le_div_iff₀ hρ).mpr (by linarith)
  have hLength : Real.pi * Real.sqrt 3 ≤ L :=
    (mul_le_mul_of_nonneg_left (Real.sqrt_le_sqrt hRatio) Real.pi_pos.le).trans
      ((productBand_width_iff hρ hL).mp hWidth)
  have haCosh : a * Real.cosh 2 ≤ 1 := (le_div_iff₀ (Real.cosh_pos _)).mp haBound
  have hJBase : 16 * Real.pi * Real.cosh 2 / 3 ≤ J := by
    refine le_trans ?_ hJ
    apply (le_div_iff₀ (by positivity : 0 < 3 * a)).mpr
    calc
      (16 * Real.pi * Real.cosh 2 / 3) * (3 * a) = (16 * Real.pi) * (a * Real.cosh 2) := by ring
      _ ≤ (16 * Real.pi) * 1 := mul_le_mul_of_nonneg_left haCosh (by positivity)
      _ = 16 * Real.pi := by ring
  have hScale : 0 < 4 * Real.pi ^ 2 * Real.sqrt 3 / 3 := by positivity
  have hStrict := mul_lt_mul_of_pos_left two_mul_sqrt_three_lt_cosh_two hScale
  calc
    8 * Real.pi ^ 2 = (4 * Real.pi ^ 2 * Real.sqrt 3 / 3) * (2 * Real.sqrt 3) := by
      have hSq := Real.sq_sqrt (show (0 : ℝ) ≤ 3 by norm_num)
      linear_combination -(8 * Real.pi ^ 2 / 3) * hSq
    _ < (4 * Real.pi ^ 2 * Real.sqrt 3 / 3) * Real.cosh 2 := hStrict
    _ = (Real.pi * Real.sqrt 3) * (16 * Real.pi * Real.cosh 2 / 3) / 4 := by ring
    _ ≤ L * J / 4 := by
      apply div_le_div_of_nonneg_right _ (by norm_num)
      exact mul_le_mul hLength hJBase (by positivity) hL

section Checks

private abbrev flatStripModel := (𝓘(ℝ)).prod 𝓘(ℝ)

private abbrev flatStripMetric : SmoothRiemannianMetric flatStripModel (ℝ × ℝ) :=
  cylinderMetric (euclideanMetric (E := ℝ))

private theorem flatStrip_width {a b : ℝ} (hab : a ≤ b) :
    markedBandEWidth flatStripMetric (univ ×ˢ Icc a b)
      (univ ×ˢ {a}) (univ ×ˢ {b}) = ENNReal.ofReal (b - a) := by
  let Φ : PartialDiffeomorph flatStripModel flatStripModel (ℝ × ℝ) (ℝ × ℝ) ∞ :=
    (Diffeomorph.refl flatStripModel (ℝ × ℝ) ∞).toPartialDiffeomorph
  have hMetric (p : ℝ × ℝ) (_ : p ∈ univ ×ˢ Icc a b)
      (v : TangentSpace flatStripModel p) :
      flatStripMetric.inner (Φ p) (mfderiv flatStripModel flatStripModel Φ p v)
        (mfderiv flatStripModel flatStripModel Φ p v) = flatStripMetric.inner p v v := by
    change flatStripMetric.inner p (mfderiv flatStripModel flatStripModel id p v)
      (mfderiv flatStripModel flatStripModel id p v) = _
    rw [mfderiv_id]
    rfl
  have h := markedBandEWidth_eq_of_cylinderPullback flatStripMetric (euclideanMetric (E := ℝ)) Φ
    hab (by change _ ⊆ univ; exact subset_univ _) hMetric
  change markedBandEWidth flatStripMetric (id '' (univ ×ˢ Icc a b))
    (id '' (univ ×ˢ {a})) (id '' (univ ×ˢ {b})) = ENNReal.ofReal (b - a) at h
  simpa using h

-- Identity marking on a genuine smooth product, with noncentered and coincident ends.
example : markedBandEWidth flatStripMetric (univ ×ˢ Icc (1 : ℝ) 3)
    (univ ×ˢ {1}) (univ ×ˢ {3}) = ENNReal.ofReal 2 := by
  convert flatStrip_width (a := 1) (b := 3) (by norm_num) using 2
  norm_num

example (a : ℝ) : markedBandEWidth flatStripMetric (univ ×ˢ Icc a a)
    (univ ×ˢ {a}) (univ ×ˢ {a}) = 0 := by
  simpa only [sub_self, ENNReal.ofReal_zero] using flatStrip_width (le_refl a)

-- The energy obstruction includes exact equality in the scalar-width test.
example {a J : ℝ} (ha : 0 < a) (haBound : a ≤ 1 / Real.cosh 2)
    (hJ : 16 * Real.pi / (3 * a) ≤ J) :
    8 * Real.pi ^ 2 < productBand_widthFloor (Real.cosh 2 ^ 2 / Real.cosh (5 / 2) ^ 2) * J / 4 := by
  obtain ⟨hρ, hρOne⟩ := rankTwoProductBand_scalarFloor
  exact rankTwoProductBand_energy_gt_wall_of_width hρ hρOne.le ha haBound hJ
    (productBand_widthFloor_pos hρ).le (productBand_widthFloor_eq hρ).symm.le

end Checks

end

end SmoothPoincare.PositiveScalarCuts
