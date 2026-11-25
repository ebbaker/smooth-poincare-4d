import Mathlib.MeasureTheory.Integral.DominatedConvergence
import Mathlib.MeasureTheory.Constructions.BorelSpace.Metric
import Mathlib.Analysis.SpecificLimits.Basic
import Mathlib.Order.LiminfLimsup
import Mathlib.Topology.Order.LeftRightNhds
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity

/-!
# Chiral quantiles in a supplied physical distance

The metric instance is the physical distance for both source measures. For a
smooth oriented Riemannian four-manifold the measures to supply are the squared
positive chiral Hilbert–Schmidt norm and the squared full curvature tensor norm,
each integrated against physical volume.
-/

open Filter MeasureTheory Set
open scoped BigOperators Topology

namespace SmoothPoincare

/-- A nonempty finite family of annular masses has a member at most its budget
per member. -/
theorem exists_annulusMass_le_average (n : ℕ) (m : Fin n → ℝ) (C : ℝ)
    (hn : 0 < n) (_hm : ∀ j, 0 ≤ m j) (hC : (∑ j, m j) ≤ C) :
    ∃ j, m j ≤ C / (n : ℝ) := by
  by_contra! h
  have hnonempty : (Finset.univ : Finset (Fin n)).Nonempty :=
    ⟨⟨0, hn⟩, Finset.mem_univ _⟩
  have hsum : (∑ _j : Fin n, C / (n : ℝ)) < ∑ j, m j :=
    Finset.sum_lt_sum_of_nonempty hnonempty (fun j _ => h j)
  have hnReal : (n : ℝ) ≠ 0 := by positivity
  have havgSum : (∑ _j : Fin n, C / (n : ℝ)) = C := by
    calc
      (∑ _j : Fin n, C / (n : ℝ)) = (n : ℝ) * (C / (n : ℝ)) := by simp [nsmul_eq_mul]
      _ = C := by rw [mul_comm, div_mul_cancel₀ _ hnReal]
  exact (havgSum ▸ hsum).not_ge hC

section MetricMeasure

variable {X : Type*} [MetricSpace X] [MeasurableSpace X] [BorelSpace X]

/-- The open physical distance shell with strict inequalities at both faces. -/
def physicalAnnulus (x : X) (a b : ℝ) : Set X := Metric.ball x b \ Metric.closedBall x a

/-- Quantile of the total chiral mass over all centers in the physical distance. -/
structure IsChiralQuantile (chiral : Measure X) (θ r : ℝ) : Prop where
  radius_pos : 0 < r
  attains : ∃ x, chiral.real (Metric.ball x r) = θ * chiral.real univ
  mass_le : ∀ x, chiral.real (Metric.ball x r) ≤ θ * chiral.real univ
  mass_lt_of_lt : ∀ x s, s < r → chiral.real (Metric.ball x s) < θ * chiral.real univ

/-- Null distance spheres give joint continuity in center and radius. -/
theorem continuous_physicalBallMass (μ : Measure X) [IsFiniteMeasure μ]
    (hnull : ∀ x r, μ (Metric.sphere x r) = 0) :
    Continuous (fun p : X × ℝ => μ.real (Metric.ball p.1 p.2)) := by
  rw [continuous_iff_continuousAt]
  intro p
  have hIntegral (q : X × ℝ) :
      (∫ y, (Metric.ball q.1 q.2).indicator (1 : X → ℝ) y ∂μ) =
        μ.real (Metric.ball q.1 q.2) := integral_indicator_one Metric.isOpen_ball.measurableSet
  change Tendsto _ (𝓝 p) (𝓝 _)
  simp_rw [← hIntegral]
  apply tendsto_integral_filter_of_dominated_convergence (fun _ => 1)
  · exact Eventually.of_forall fun _ =>
      (measurable_const.indicator Metric.isOpen_ball.measurableSet).aestronglyMeasurable
  · refine Eventually.of_forall fun q => Eventually.of_forall fun y => ?_
    by_cases hy : y ∈ Metric.ball q.1 q.2 <;> simp [hy]
  · exact integrable_const _
  · have hae : ∀ᵐ y ∂μ, y ∉ Metric.sphere p.1 p.2 := by
      rw [ae_iff]
      simp only [not_not]
      change μ (Metric.sphere p.1 p.2) = 0
      exact hnull p.1 p.2
    filter_upwards [hae] with y hy
    have hdist : Continuous (fun q : X × ℝ => dist y q.1) :=
      continuous_const.dist continuous_fst
    rcases lt_or_gt_of_ne (Metric.mem_sphere.not.mp hy) with hin | hout
    · have hevent : ∀ᶠ q : X × ℝ in 𝓝 p, y ∈ Metric.ball q.1 q.2 :=
        hdist.continuousAt.eventually_lt continuous_snd.continuousAt hin
      rw [indicator_of_mem (show y ∈ Metric.ball p.1 p.2 from hin)]
      exact tendsto_const_nhds.congr' (hevent.mono fun _ h => (indicator_of_mem h _).symm)
    · have hevent : ∀ᶠ q : X × ℝ in 𝓝 p, q.2 < dist y q.1 :=
        continuous_snd.continuousAt.eventually_lt hdist.continuousAt hout
      rw [indicator_of_notMem (show y ∉ Metric.ball p.1 p.2 from hout.not_gt)]
      exact tendsto_const_nhds.congr' (hevent.mono fun q h =>
        (indicator_of_notMem (show y ∉ Metric.ball q.1 q.2 from h.not_gt) _).symm)

omit [BorelSpace X] in
/-- On a compact source, continuous ball masses realize each strictly interior,
positive threshold at a least positive radius. -/
theorem exists_isChiralQuantile [CompactSpace X] [Nonempty X] (chiral : Measure X)
    [IsFiniteMeasure chiral] {θ : ℝ} (hθ : 0 < θ) (hθ₁ : θ < 1)
    (he : 0 < chiral.real univ)
    (hcont : Continuous (fun p : X × ℝ => chiral.real (Metric.ball p.1 p.2))) :
    ∃ r, IsChiralQuantile chiral θ r := by
  let t := θ * chiral.real univ
  have ht : 0 < t := mul_pos hθ he
  let x₀ : X := Classical.choice ‹Nonempty X›
  obtain ⟨R, hR, hsub⟩ := (isCompact_univ (X := X)).isBounded.subset_ball_lt 0 x₀
  have hball : Metric.ball x₀ R = univ := eq_univ_of_univ_subset hsub
  let S := (univ : Set X) ×ˢ Icc 0 R ∩ {p | t ≤ chiral.real (Metric.ball p.1 p.2)}
  have hS : IsCompact S :=
    (isCompact_univ.prod isCompact_Icc).inter_right (isClosed_le continuous_const hcont)
  have hne : S.Nonempty := by
    refine ⟨(x₀, R), ⟨mem_univ _, hR.le, le_rfl⟩, ?_⟩
    change t ≤ chiral.real (Metric.ball x₀ R)
    rw [hball]
    exact mul_le_of_le_one_left he.le hθ₁.le
  obtain ⟨⟨x, r⟩, hr, hmin⟩ := hS.exists_isMinOn hne continuous_snd.continuousOn
  have htr : t ≤ chiral.real (Metric.ball x r) := hr.2
  have hrpos : 0 < r := by
    by_contra! h
    rw [Metric.ball_eq_empty.mpr h, measureReal_empty] at htr
    exact ht.not_ge htr
  have hbelow (y : X) (s : ℝ) (hs : s < r) : chiral.real (Metric.ball y s) < t := by
    by_contra! h
    have hs₀ : 0 ≤ s := by
      by_contra! hneg
      rw [Metric.ball_eq_empty.mpr hneg.le, measureReal_empty] at h
      exact ht.not_ge h
    have hy : (y, s) ∈ S := ⟨⟨mem_univ _, hs₀, hs.le.trans hr.1.2.2⟩, h⟩
    exact hs.not_ge (hmin hy)
  have hle (y : X) : chiral.real (Metric.ball y r) ≤ t := by
    apply le_of_tendsto (f := fun s => chiral.real (Metric.ball y s)) (x := 𝓝[<] r)
    · exact (hcont.comp (continuous_const.prodMk continuous_id)).continuousAt.tendsto.mono_left
        nhdsWithin_le_nhds
    · filter_upwards [eventually_mem_nhdsWithin (a := r) (s := Iio r)] with s hs
      exact (hbelow y s hs).le
  exact ⟨r, hrpos, ⟨x, le_antisymm (hle x) htr⟩, hle, hbelow⟩

/-- At a median quantile, the entire complement of the open ball has at least
half the chiral mass, for every center including an inner attaining center. -/
theorem medianExterior_mass_ge_half (chiral : Measure X) [IsFiniteMeasure chiral]
    {b : ℝ} (median : IsChiralQuantile chiral (1 / 2) b) (x : X) :
    chiral.real univ / 2 ≤ chiral.real (Metric.ball x b)ᶜ := by
  rw [measureReal_compl Metric.isOpen_ball.measurableSet]
  linarith [median.mass_le x]

/-- One physical shell of ratio `q` between the quantiles has full mass at most
`C / n`, about a prescribed inner attaining center. -/
theorem exists_lowMass_quantileAnnulus_at (chiral full : Measure X)
    [IsFiniteMeasure chiral] [IsFiniteMeasure full] {θ a b q C : ℝ}
    (inner : IsChiralQuantile chiral θ a) (median : IsChiralQuantile chiral (1 / 2) b)
    (x : X) (hx : chiral.real (Metric.ball x a) = θ * chiral.real univ)
    (hC : full.real univ ≤ C) {n : ℕ} (hn : 0 < n) (hq : 1 < q)
    (hfit : a * q ^ n ≤ b) :
    ∃ r : ℝ,
      a ≤ r ∧ r * q ≤ b ∧ chiral.real (Metric.ball x a) = θ * chiral.real univ ∧
      chiral.real univ / 2 ≤ chiral.real (Metric.ball x b)ᶜ ∧
      Disjoint (physicalAnnulus x r (r * q)) (Metric.ball x a) ∧
      Disjoint (physicalAnnulus x r (r * q)) (Metric.ball x b)ᶜ ∧
      full.real (physicalAnnulus x r (r * q)) ≤ C / (n : ℝ) := by
  let R (j : ℕ) : ℝ := a * q ^ j
  have hR : Monotone R := fun _ _ h =>
    mul_le_mul_of_nonneg_left (pow_le_pow_right₀ hq.le h) inner.radius_pos.le
  let shell (j : Fin n) := physicalAnnulus x (R j) (R (j + 1 : ℕ))
  have hordered {j k : Fin n} (hjk : j < k) : Disjoint (shell j) (shell k) := by
    rw [Set.disjoint_left]
    intro y hj hk
    exact hk.2 (lt_of_lt_of_le hj.1 (hR (Nat.succ_le_of_lt hjk))).le
  have hdisj : Set.PairwiseDisjoint (↑(Finset.univ : Finset (Fin n))) shell := by
    intro j _ k _ hjk
    exact (lt_or_gt_of_ne hjk).elim hordered (fun h => (hordered h).symm)
  have hsum : (∑ j, full.real (shell j)) ≤ full.real univ :=
    sum_measureReal_le_measureReal_univ
      (fun _ _ => Metric.isOpen_ball.measurableSet.diff Metric.isClosed_closedBall.measurableSet)
      hdisj
  obtain ⟨j, hj⟩ := exists_annulusMass_le_average n (fun j => full.real (shell j)) C hn
    (fun _ => measureReal_nonneg) (hsum.trans hC)
  have ha : a ≤ R j := by simpa [R] using hR (Nat.zero_le (j : ℕ))
  have hstep : R (j + 1 : ℕ) = R j * q := by simp [R, pow_succ, mul_assoc]
  have hb : R j * q ≤ b := hstep ▸ (hR (Nat.succ_le_of_lt j.isLt)).trans hfit
  refine ⟨R j, ha, hb, hx, medianExterior_mass_ge_half chiral median x, ?_, ?_, ?_⟩
  · rw [Set.disjoint_left]
    intro y hy hyInner
    exact hy.2 (le_trans hyInner.le ha)
  · rw [Set.disjoint_left]
    intro y hy hyExterior
    exact hyExterior (lt_of_lt_of_le hy.1 hb)
  · simpa only [shell, hstep] using hj

/-- Select an attaining center and the shell about it from the two physical
measures. Both full charged sets are disjoint from the selected shell. -/
theorem exists_lowMass_quantileAnnulus (chiral full : Measure X)
    [IsFiniteMeasure chiral] [IsFiniteMeasure full] {θ a b q C : ℝ}
    (inner : IsChiralQuantile chiral θ a) (median : IsChiralQuantile chiral (1 / 2) b)
    (hC : full.real univ ≤ C) {n : ℕ} (hn : 0 < n) (hq : 1 < q)
    (hfit : a * q ^ n ≤ b) :
    ∃ x : X, ∃ r : ℝ,
      a ≤ r ∧ r * q ≤ b ∧ chiral.real (Metric.ball x a) = θ * chiral.real univ ∧
      chiral.real univ / 2 ≤ chiral.real (Metric.ball x b)ᶜ ∧
      Disjoint (physicalAnnulus x r (r * q)) (Metric.ball x a) ∧
      Disjoint (physicalAnnulus x r (r * q)) (Metric.ball x b)ᶜ ∧
      full.real (physicalAnnulus x r (r * q)) ≤ C / (n : ℝ) := by
  obtain ⟨x, hx⟩ := inner.attains
  exact ⟨x, exists_lowMass_quantileAnnulus_at chiral full inner median x hx hC hn hq hfit⟩

end MetricMeasure

section Sequence

variable {X : ℕ → Type*} [∀ i, MetricSpace (X i)] [∀ i, MeasurableSpace (X i)]

/-- Uniform small-ball mass, with the relative radius chosen before the source
limit. -/
def IsChiralDiffuse (chiral : ∀ i, Measure (X i)) (medianRadius : ℕ → ℝ) : Prop :=
  ∀ ε : ℝ, 0 < ε → ∃ b : ℝ, 0 < b ∧ ∀ᶠ i in atTop, ∀ x : X i,
    (chiral i).real (Metric.ball x (b * medianRadius i)) / (chiral i).real univ ≤ ε

/-- The small-ball condition is precisely the right-hand limit of the
source limsup of the supremum over centers. -/
theorem isChiralDiffuse_iff_tendsto_limsup (chiral : ∀ i, Measure (X i))
    [∀ i, IsFiniteMeasure (chiral i)] [∀ i, Nonempty (X i)]
    (medianRadius : ℕ → ℝ) (hRadius : ∀ i, 0 ≤ medianRadius i)
    (he : ∀ i, 0 < (chiral i).real univ) :
    IsChiralDiffuse chiral medianRadius ↔ Tendsto (fun b =>
      limsup (fun i => ⨆ x : X i, (chiral i).real (Metric.ball x (b * medianRadius i)) /
        (chiral i).real univ) atTop) (𝓝[>] 0) (𝓝 0) := by
  let F (b : ℝ) (i : ℕ) (x : X i) :=
    (chiral i).real (Metric.ball x (b * medianRadius i)) / (chiral i).real univ
  let S (b : ℝ) (i : ℕ) := ⨆ x : X i, F b i x
  change IsChiralDiffuse chiral medianRadius ↔
    Tendsto (fun b => limsup (S b) atTop) (𝓝[>] 0) (𝓝 0)
  have hUpper (b : ℝ) (i : ℕ) (x : X i) : F b i x ≤ 1 := by
    apply (div_le_iff₀ (he i)).mpr
    simpa only [one_mul] using
      (measureReal_mono (subset_univ _) : (chiral i).real _ ≤ (chiral i).real univ)
  have hSup (b : ℝ) (i : ℕ) (x : X i) : F b i x ≤ S b i :=
    le_ciSup ⟨1, forall_mem_range.mpr (hUpper b i)⟩ x
  have hBound (b : ℝ) : IsBoundedUnder (· ≤ ·) atTop (S b) :=
    isBoundedUnder_of_eventually_le (a := 1) (Eventually.of_forall fun i => ciSup_le (hUpper b i))
  have hNonneg (b : ℝ) (i : ℕ) : 0 ≤ S b i :=
    (div_nonneg measureReal_nonneg (he i).le).trans
      (hSup b i (Classical.choice (inferInstance : Nonempty (X i))))
  have hCo (b : ℝ) : IsCoboundedUnder (· ≤ ·) atTop (S b) :=
    isCoboundedUnder_le_of_le atTop (hNonneg b)
  have hlimNonneg (b : ℝ) : 0 ≤ limsup (S b) atTop :=
    le_limsup_of_le (hBound b) fun _ h =>
      let ⟨i, hi⟩ := h.exists
      (hNonneg b i).trans hi
  rw [Metric.tendsto_nhds]
  constructor
  · intro hd ε hε
    obtain ⟨b, hb, hsmall⟩ := hd (ε / 2) (by positivity)
    refine (nhdsGT_basis 0).eventually_iff.mpr ⟨b, hb, fun t ht => ?_⟩
    have hle : ∀ᶠ i in atTop, S t i ≤ ε / 2 := hsmall.mono fun i hi =>
      ciSup_le fun x =>
        (div_le_div_of_nonneg_right
          (measureReal_mono (Metric.ball_subset_ball (mul_le_mul_of_nonneg_right ht.2.le (hRadius i))))
          (he i).le).trans (hi x)
    rw [Real.dist_eq, sub_zero, abs_of_nonneg (hlimNonneg t)]
    exact (limsup_le_of_le (hCo t) hle).trans_lt (by linarith)
  · intro hd ε hε
    obtain ⟨b, hb, hsmall⟩ := (nhdsGT_basis 0).eventually_iff.mp (hd ε hε)
    let t := b / 2
    have ht : t ∈ Ioo 0 b := ⟨by dsimp [t]; positivity, by dsimp [t]; linarith⟩
    have hlt := hsmall ht
    rw [Real.dist_eq, sub_zero, abs_of_nonneg (hlimNonneg t)] at hlt
    refine ⟨t, ht.1, ?_⟩
    exact (eventually_lt_of_limsup_lt hlt (hBound t)).mono fun i hi x =>
      ((hSup t i x).trans_lt hi).le

variable [∀ i, BorelSpace (X i)]

/-- On a sequence with positive chiral mass and a uniform full mass budget,
either the small-ball mass is diffuse or there is a separated subsequence.
On that subsequence the same attaining centers work for every fixed shell
ratio and the full shell masses are eventually arbitrarily small. -/
theorem chiralQuantileAlternatives (chiral full : ∀ i, Measure (X i))
    [∀ i, IsFiniteMeasure (chiral i)] [∀ i, IsFiniteMeasure (full i)]
    (quantile : ℕ → ℝ → ℝ)
    (hquantile : ∀ i θ, 0 < θ → θ ≤ 1 / 2 →
      IsChiralQuantile (chiral i) θ (quantile i θ))
    (he : ∀ i, 0 < (chiral i).real univ) (C : ℝ) (hC : ∀ i, (full i).real univ ≤ C) :
    IsChiralDiffuse chiral (fun i => quantile i (1 / 2)) ∨
      (¬ IsChiralDiffuse chiral (fun i => quantile i (1 / 2)) ∧
        ∃ θ : ℝ, 0 < θ ∧ θ < 1 / 2 ∧ ∃ σ : ℕ → ℕ, StrictMono σ ∧
          Tendsto (fun k => quantile (σ k) θ / quantile (σ k) (1 / 2)) atTop (𝓝 0) ∧
          ∃ x : ∀ k, X (σ k),
            (∀ k, (chiral (σ k)).real (Metric.ball (x k) (quantile (σ k) θ)) =
                θ * (chiral (σ k)).real univ ∧
              (chiral (σ k)).real univ / 2 ≤
                (chiral (σ k)).real (Metric.ball (x k) (quantile (σ k) (1 / 2)))ᶜ) ∧
            ∀ q : ℝ, 1 < q → ∀ ε : ℝ, 0 < ε → ∀ᶠ k in atTop, ∃ r : ℝ,
              quantile (σ k) θ ≤ r ∧ r * q ≤ quantile (σ k) (1 / 2) ∧
              Disjoint (physicalAnnulus (x k) r (r * q))
                (Metric.ball (x k) (quantile (σ k) θ)) ∧
              Disjoint (physicalAnnulus (x k) r (r * q))
                (Metric.ball (x k) (quantile (σ k) (1 / 2)))ᶜ ∧
              (full (σ k)).real (physicalAnnulus (x k) r (r * q)) ≤ ε) := by
  by_cases hd : IsChiralDiffuse chiral (fun i => quantile i (1 / 2))
  · exact Or.inl hd
  refine Or.inr ⟨hd, ?_⟩
  have hfailure := hd
  unfold IsChiralDiffuse at hfailure
  push Not at hfailure
  obtain ⟨ε, hε, hfailure⟩ := hfailure
  let θ := min (ε / 2) (1 / 4)
  have hθ : 0 < θ := lt_min (by positivity) (by norm_num)
  have hθHalf : θ < 1 / 2 := (min_le_right _ _).trans_lt (by norm_num)
  have hθε : θ ≤ ε := (min_le_left _ _).trans (by linarith)
  have hMed i := hquantile i (1 / 2) (by norm_num) le_rfl
  have hInner i := hquantile i θ hθ hθHalf.le
  have hfrequent (k : ℕ) : ∃ᶠ i in atTop,
      quantile i θ / quantile i (1 / 2) ≤ 1 / ((k : ℝ) + 1) := by
    have hk : 0 < 1 / ((k : ℝ) + 1) := by positivity
    apply (hfailure _ hk).mono
    intro i hi
    obtain ⟨x, hx⟩ := hi
    apply (div_le_iff₀ (hMed i).radius_pos).mpr
    by_contra! h
    have hx' := (lt_div_iff₀ (he i)).mp (hθε.trans_lt hx)
    exact ((hInner i).mass_lt_of_lt x _ h).not_ge hx'.le
  obtain ⟨σ, hσ, hsmall⟩ := extraction_forall_of_frequently hfrequent
  have hratio : Tendsto (fun k => quantile (σ k) θ / quantile (σ k) (1 / 2)) atTop (𝓝 0) :=
    tendsto_of_tendsto_of_tendsto_of_le_of_le tendsto_const_nhds
      tendsto_one_div_add_atTop_nhds_zero_nat
      (fun k => div_nonneg (hInner (σ k)).radius_pos.le (hMed (σ k)).radius_pos.le) hsmall
  choose x hx using fun k => (hInner (σ k)).attains
  refine ⟨θ, hθ, hθHalf, σ, hσ, hratio, x, fun k => ⟨hx k, ?_⟩, ?_⟩
  · exact medianExterior_mass_ge_half (chiral (σ k)) (hMed (σ k)) (x k)
  · intro q hq tolerance htol
    obtain ⟨n, hn⟩ := exists_nat_gt (max 0 (C / tolerance))
    have hnPos : 0 < n := by exact_mod_cast ((le_max_left _ _).trans_lt hn)
    have hbudget : C / (n : ℝ) ≤ tolerance := by
      apply (div_le_iff₀ (by exact_mod_cast hnPos)).mpr
      have hm := (div_lt_iff₀ htol).mp ((le_max_right _ _).trans_lt hn)
      simpa only [mul_comm tolerance] using hm.le
    have hqPow : 0 < q ^ n := pow_pos (zero_lt_one.trans hq) _
    have hevent := hratio.eventually (eventually_lt_nhds (show 0 < 1 / q ^ n by positivity))
    filter_upwards [hevent] with k hk
    have hfit : quantile (σ k) θ * q ^ n ≤ quantile (σ k) (1 / 2) := by
      have h := (div_lt_div_iff₀ (hMed (σ k)).radius_pos hqPow).mp hk
      simpa only [one_mul] using h.le
    obtain ⟨r, ha, hb, _, _, hdInner, hdExterior, hm⟩ :=
      exists_lowMass_quantileAnnulus_at (chiral (σ k)) (full (σ k))
        (hInner (σ k)) (hMed (σ k)) (x k) (hx k) (hC (σ k)) hnPos hq hfit
    exact ⟨r, ha, hb, hdInner, hdExterior, hm.trans hbudget⟩

end Sequence

end SmoothPoincare
