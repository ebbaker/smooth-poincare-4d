import SmoothPoincare.Variational.NonconformalDiskSaving

/-! # Finite common charge calibration on disjoint sites -/

noncomputable section
open Bundle DifferentialGeometry DifferentialGeometry.Geometry Set MeasureTheory FirstOrderTwistor
open scoped ContDiff Manifold Topology BigOperators

namespace SmoothPoincare

section Parameter

private theorem monotoneOn_of_nonneg_slope {f d : ℝ → ℝ} {b : ℝ}
    (h : ∀ a ∈ Icc (0 : ℝ) b, HasDerivAt f (d a) a)
    (hd : ∀ a ∈ Icc (0 : ℝ) b, 0 ≤ d a) : MonotoneOn f (Icc (0 : ℝ) b) :=
  monotoneOn_of_hasDerivWithinAt_nonneg (convex_Icc _ _)
    (fun a ha => (h a ha).continuousAt.continuousWithinAt)
    (fun a ha => (h a (interior_subset ha)).hasDerivWithinAt)
    (fun a ha => hd a (interior_subset ha))

/-- A nonnegative initial slope and a strictly positive lower bound for the
second derivative give a quadratic increment and strict increase on the
closed amplitude interval. -/
theorem charge_increment_of_secondVariation {f d e : ℝ → ℝ} {b c : ℝ}
    (hb : 0 < b) (hc : 0 < c)
    (hFirst : ∀ a ∈ Icc (0 : ℝ) b, HasDerivAt f (d a) a)
    (hSecond : ∀ a ∈ Icc (0 : ℝ) b, HasDerivAt d (e a) a)
    (hStart : 0 ≤ d 0) (hFloor : ∀ a ∈ Icc (0 : ℝ) b, c ≤ e a) :
    (∀ a ∈ Icc (0 : ℝ) b, c / 2 * a ^ 2 ≤ f a - f 0) ∧
      StrictMonoOn f (Icc (0 : ℝ) b) := by
  have hzero : (0 : ℝ) ∈ Icc (0 : ℝ) b := left_mem_Icc.mpr hb.le
  have hSlope : MonotoneOn (fun a => d a - c * a) (Icc (0 : ℝ) b) := by
    apply monotoneOn_of_nonneg_slope (d := fun a => e a - c)
    · intro a ha
      simpa only [id_eq, mul_one, Pi.sub_def] using
        (hSecond a ha).sub ((hasDerivAt_id a).const_mul c)
    · intro a ha
      exact sub_nonneg.mpr (hFloor a ha)
  have hd (a : ℝ) (ha : a ∈ Icc (0 : ℝ) b) : c * a ≤ d a := by
    have h := hSlope hzero ha ha.1
    dsimp at h
    linarith only [h, hStart]
  have hInc : MonotoneOn (fun a => f a - c / 2 * a ^ 2) (Icc (0 : ℝ) b) := by
    apply monotoneOn_of_nonneg_slope (d := fun a => d a - c * a)
    · intro a ha
      have hQuad : HasDerivAt (fun x : ℝ => c / 2 * x ^ 2) (c * a) a := by
        convert (hasDerivAt_pow 2 a).const_mul (c / 2) using 1
        norm_num <;> ring
      exact (hFirst a ha).sub hQuad
    · intro a ha
      exact sub_nonneg.mpr (hd a ha)
  refine ⟨fun a ha => ?_, strictMonoOn_of_deriv_pos (convex_Icc _ _) ?_ ?_⟩
  · have h := hInc hzero ha ha.1
    dsimp at h
    nlinarith only [h]
  · exact fun a ha => (hFirst a ha).continuousAt.continuousWithinAt
  · intro a ha
    have hPos : 0 < a := (show a ∈ Ioo 0 b by rwa [interior_Icc] at ha).1
    rw [(hFirst a (interior_subset ha)).deriv]
    exact (mul_pos hc hPos).trans_le (hd a (interior_subset ha))

/-- Choose the sign of a two-sided source perturbation using its actual
first variation. Reflection preserves the second-variation bound. -/
theorem exists_chargeCalibrationDirection {f d e : ℝ → ℝ} {b c : ℝ}
    (hFirst : ∀ a ∈ Icc (-b) b, HasDerivAt f (d a) a)
    (hSecond : ∀ a ∈ Icc (-b) b, HasDerivAt d (e a) a)
    (hFloor : ∀ a ∈ Icc (-b) b, c ≤ e a) :
    ∃ ε : ℝ, (ε = 1 ∨ ε = -1) ∧ 0 ≤ ε * d 0 ∧
      ∀ a ∈ Icc (0 : ℝ) b,
        HasDerivAt (fun t => f (ε * t)) (ε * d (ε * a)) a ∧
        HasDerivAt (fun t => ε * d (ε * t)) (e (ε * a)) a ∧ c ≤ e (ε * a) := by
  let ε : ℝ := if 0 ≤ d 0 then 1 else -1
  have hSign : ε = 1 ∨ ε = -1 := by
    dsimp [ε]
    split <;> simp
  have hStart : 0 ≤ ε * d 0 := by
    dsimp [ε]
    split <;> linarith
  refine ⟨ε, hSign, hStart, fun a ha => ?_⟩
  have hMap : ε * a ∈ Icc (-b) b := by
    rcases hSign with hs | hs <;> rw [hs] <;> constructor <;> linarith [ha.1, ha.2]
  have hεsq : ε ^ 2 = 1 := by rcases hSign with hs | hs <;> norm_num [hs]
  have hScale : HasDerivAt (fun t : ℝ => ε * t) ε a := by
    simpa only [id_eq, mul_one] using (hasDerivAt_id a).const_mul ε
  have hF := (hFirst (ε * a) hMap).comp a hScale
  have hD := ((hSecond (ε * a) hMap).comp a hScale).const_mul ε
  have hCoeff : ε * (e (ε * a) * ε) = e (ε * a) := by
    calc
      _ = e (ε * a) * ε ^ 2 := by ring
      _ = _ := by rw [hεsq, mul_one]
  refine ⟨?_, ?_, hFloor _ hMap⟩
  · simpa only [Function.comp_def, mul_comm (d (ε * a))] using hF
  · simpa only [Function.comp_def, hCoeff] using hD

end Parameter

section Geometry

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
variable {H M ι : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [Nonempty M] {o : ManifoldOrientation I M 4}

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- A metric germ in the actual common oriented frame on a specified region. -/
def SignedMetricGermOn (g h : SignedCollarMetric o) (A : Set M) : Prop :=
  ∀ x ∈ A, (∀ᶠ y in 𝓝 x, ∀ u v : TangentSpace I y, g.metric.inner y u v = h.metric.inner y u v) ∧
    (g.frame x).basis = (h.frame x).basis

omit [I.Boundaryless] [Nonempty M] in
private theorem SignedMetricGermOn.charge_eq {g h : SignedCollarMetric o} {A B : Set M}
    (hGerm : SignedMetricGermOn g h A) (hB : MeasurableSet B) (hBA : B ⊆ A)
    (sign : CollarChirality) : g.charge sign B = h.charge sign B :=
  selectedReference_charge_eq_of_germ g h hB
    (fun x hx => (hGerm x (hBA hx)).1) (fun x hx => (hGerm x (hBA hx)).2) sign

omit [I.Boundaryless] [Nonempty M] in
private theorem charge_split_sites (g : SignedCollarMetric o) (sign : CollarChirality)
    (sites : Finset ι) (U : ι → Set M)
    (hMeas : ∀ j ∈ sites, MeasurableSet (U j))
    (hDisjoint : (sites : Set ι).PairwiseDisjoint U) {P : Set M}
    (hUnion : (⋃ j ∈ sites, U j) ⊆ P) :
    g.charge sign P =
      g.charge sign (P \ ⋃ j ∈ sites, U j) + ∑ j ∈ sites, g.charge sign (U j) := by
  change (g.chiralMeasure sign).real P = _
  conv_lhs => rw [← sdiff_union_of_subset hUnion]
  rw [measureReal_union disjoint_sdiff_left (Finset.measurableSet_biUnion _ hMeas)
      (measure_ne_top _ _) (measure_ne_top _ _),
    measureReal_biUnion_finset hDisjoint hMeas]
  rfl

omit [I.Boundaryless] [Nonempty M] in
/-- At one fixed smooth source, each supplied site has a positive second
variation in its chosen direction and a nonnegative initial first variation.
The actual simultaneous slices match each single-site metric on its site
and the original metric on the whole complement. The terminal amplitude
is chosen by continuity, with no prescribed endpoint energy identity. -/
theorem exists_retainedChargeCalibration (g : SignedCollarMetric o)
    (sites : Finset ι) (U : ι → Set M) {Q : Set M} (hQ : MeasurableSet Q)
    (hMeas : ∀ j ∈ sites, MeasurableSet (U j))
    (hDisjoint : (sites : Set ι).PairwiseDisjoint U)
    (hContained : ∀ j ∈ sites, U j ⊆ Q)
    (single : ι → ℝ → SignedCollarMetric o) (joined : ℝ → SignedCollarMetric o)
    (hSingleZero : ∀ j ∈ sites, single j 0 = g)
    (hJoinedZero : joined 0 = g) {b c K : ℝ} (hb : 0 < b) (hc : 0 < c) (hK : 0 ≤ K)
    (hCapacity : K ≤ (sites.card : ℝ) * (c / 2 * b ^ 2))
    (hSingleOff : ∀ j ∈ sites, ∀ a ∈ Icc (0 : ℝ) b, SignedMetricGermOn g (single j a) (U j)ᶜ)
    (hJoinedSites : ∀ j ∈ sites, ∀ a ∈ Icc (0 : ℝ) b, SignedMetricGermOn (single j a) (joined a) (U j))
    (hJoinedOff : ∀ a ∈ Icc (0 : ℝ) b,
      SignedMetricGermOn g (joined a) (⋃ j ∈ sites, U j)ᶜ)
    (d e : ι → ℝ → ℝ)
    (hFirst : ∀ j ∈ sites, ∀ a ∈ Icc (0 : ℝ) b,
      HasDerivAt (fun t => (single j t).charge .plus (U j)) (d j a) a)
    (hSecond : ∀ j ∈ sites, ∀ a ∈ Icc (0 : ℝ) b, HasDerivAt (d j) (e j a) a)
    (hStart : ∀ j ∈ sites, 0 ≤ d j 0)
    (hFloor : ∀ j ∈ sites, ∀ a ∈ Icc (0 : ℝ) b, c ≤ e j a) :
    let S := ⋃ j ∈ sites, U j
    let κ := fun a => ∑ j ∈ sites, ((single j a).charge .plus (U j) - g.charge .plus (U j))
    ∃ a ∈ Icc (0 : ℝ) b, κ a = K ∧ (a = 0 ↔ K = 0) ∧
      (K > 0 → ∀ a' ∈ Icc (0 : ℝ) b, κ a' = K → a' = a) ∧
      (∀ s ∈ Icc (0 : ℝ) a, 0 ≤ κ s ∧ κ s ≤ K ∧ ∀ sign,
        (joined s).charge sign S = g.charge sign S + κ s ∧
        (joined s).charge sign Q = g.charge sign Q + κ s ∧
        (joined s).energy sign = g.energy sign + κ s ∧
        ∀ V : Set M, MeasurableSet V → V ⊆ Sᶜ → (joined s).charge sign V = g.charge sign V) ∧
      (K = 0 → joined a = g) := by
  intro S κ
  have hZero : (0 : ℝ) ∈ Icc (0 : ℝ) b := left_mem_Icc.mpr hb.le
  have hBound (j : ι) (hj : j ∈ sites) :=
    charge_increment_of_secondVariation hb hc (hFirst j hj) (hSecond j hj) (hStart j hj) (hFloor j hj)
  have hAtZero : κ 0 = 0 := by
    dsimp only [κ]
    exact Finset.sum_eq_zero fun j hj => by rw [hSingleZero j hj, sub_self]
  have hEnd : K ≤ κ b := hCapacity.trans (by
    have hSum : (∑ j ∈ sites, (c / 2 * b ^ 2)) ≤ κ b := Finset.sum_le_sum fun j hj => by
      have h := (hBound j hj).1 b (right_mem_Icc.mpr hb.le)
      rwa [hSingleZero j hj] at h
    simpa only [Finset.sum_const, nsmul_eq_mul] using hSum)
  have hCont : ContinuousOn κ (Icc (0 : ℝ) b) := by
    apply continuousOn_finsetSum
    intro j hj
    have hSite : ContinuousOn (fun t => (single j t).charge .plus (U j)) (Icc (0 : ℝ) b) :=
      fun a ha => (hFirst j hj a ha).continuousAt.continuousWithinAt
    exact hSite.sub continuousOn_const
  have hMono : MonotoneOn κ (Icc (0 : ℝ) b) := by
    intro x hx y hy hxy
    exact Finset.sum_le_sum fun j hj =>
      sub_le_sub_right ((hBound j hj).2.monotoneOn hx hy hxy) _
  have hStrict (h : sites.Nonempty) : StrictMonoOn κ (Icc (0 : ℝ) b) := by
    intro x hx y hy hxy
    exact Finset.sum_lt_sum_of_nonempty h fun j hj =>
      sub_lt_sub_right ((hBound j hj).2 hx hy hxy) _
  have hTarget : K ∈ Icc (κ 0) (κ b) := ⟨hAtZero.symm ▸ hK, hEnd⟩
  have hChoose : ∃ a ∈ Icc (0 : ℝ) b, κ a = K ∧ (a = 0 ↔ K = 0) := by
    rcases eq_or_lt_of_le hK with h | h
    · exact ⟨0, hZero, hAtZero.trans h, iff_of_true rfl h.symm⟩
    · obtain ⟨a, ha, hValue⟩ := intermediate_value_Icc hb.le hCont hTarget
      have ha₀ : a ≠ 0 := fun h' => h.ne (hAtZero.symm.trans (h' ▸ hValue))
      exact ⟨a, ha, hValue, iff_of_false ha₀ h.ne'⟩
  obtain ⟨a, ha, hValue, haZero⟩ := hChoose
  have hS : MeasurableSet S := Finset.measurableSet_biUnion _ hMeas
  have hSQ : S ⊆ Q := by
    intro x hx
    rcases mem_iUnion₂.mp hx with ⟨j, hj, hxj⟩
    exact hContained j hj hxj
  refine ⟨a, ha, hValue, haZero, ?_, ?_, ?_⟩
  · intro hPositive a' ha' hValue'
    have hNonempty : sites.Nonempty := by
      by_contra! hEmpty
      simp [hEmpty] at hCapacity
      exact hPositive.not_ge hCapacity
    exact (hStrict hNonempty).injOn ha' ha (hValue'.trans hValue.symm)
  · intro s hs
    have hs' : s ∈ Icc (0 : ℝ) b := ⟨hs.1, hs.2.trans ha.2⟩
    have hNonneg : 0 ≤ κ s := hAtZero ▸ hMono hZero hs' hs.1
    have hUpper : κ s ≤ K := hValue ▸ hMono hs' ha hs.2
    refine ⟨hNonneg, hUpper, fun sign => ?_⟩
    have hAtSite (j : ι) (hj : j ∈ sites) :
        (joined s).charge sign (U j) =
          g.charge sign (U j) + ((single j s).charge .plus (U j) - g.charge .plus (U j)) := by
      have hg := (hJoinedSites j hj s hs').charge_eq (hMeas j hj) Subset.rfl sign
      have hSiteOff (z : CollarChirality) := (hSingleOff j hj s hs').charge_eq
        (hMeas j hj).compl Subset.rfl z
      have hCommon (z : CollarChirality) :=
        signedCoreSaving_eq_energySaving g (single j s) (hMeas j hj) z (hSiteOff z)
      linarith only [hg, hCommon sign, hCommon .plus]
    have hFixed (V : Set M) (hV : MeasurableSet V) (hVS : V ⊆ Sᶜ) :
        (joined s).charge sign V = g.charge sign V :=
      ((hJoinedOff s hs').charge_eq hV hVS sign).symm
    have hCompare (P : Set M) (hP : MeasurableSet P) (hSP : S ⊆ P) :
        (joined s).charge sign P = g.charge sign P + κ s := by
      rw [charge_split_sites (joined s) sign sites U hMeas hDisjoint hSP,
        charge_split_sites g sign sites U hMeas hDisjoint hSP,
        hFixed (P \ S) (hP.diff hS) (fun _ hx => hx.2)]
      rw [Finset.sum_congr rfl hAtSite, Finset.sum_add_distrib]
      unfold κ
      ring
    refine ⟨hCompare S hS Subset.rfl, hCompare Q hQ hSQ, ?_, hFixed⟩
    simpa only [SignedCollarMetric.charge_univ] using
      hCompare univ MeasurableSet.univ (subset_univ S)
  · intro h
    rw [haZero.mpr h, hJoinedZero]

end Geometry

section AffineMetric

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
variable {H M ι : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

/-- Sum the supplied actual directions on disjoint open sites, with the
support of each direction contained in a closed subset of its site.
The same amplitude produces a smooth positive metric matching every
single-site germ and the entire complementary germ. -/
theorem exists_disjointAffineMetricRamp (g : SmoothRiemannianMetric I M)
    (sites : Finset ι) (U K : ι → Set M)
    (hOpen : ∀ j ∈ sites, IsOpen (U j)) (hClosed : ∀ j ∈ sites, IsClosed (K j))
    (hKU : ∀ j ∈ sites, K j ⊆ U j) (hDisjoint : (sites : Set ι).PairwiseDisjoint U)
    (D : ∀ (j : ι) (x : M), TangentSpace I x →L[ℝ] TangentSpace I x →L[ℝ] ℝ)
    (hSymm : ∀ j ∈ sites, ∀ x (u v : TangentSpace I x), D j x u v = D j x v u)
    (hNorm : ∀ j ∈ sites, ∀ x (u : TangentSpace I x), |D j x u u| ≤ g.inner x u u)
    (hSmooth : ∀ j ∈ sites, ∀ x₀ (i k : Fin (Module.finrank ℝ E₄)),
      ContMDiffOn I 𝓘(ℝ) ∞
        (fun x => D j x (frameVec (I := I) x₀ i x) (frameVec (I := I) x₀ k x))
        (trivializationAt E₄ (TangentSpace I) x₀).baseSet)
    (hSupport : ∀ j ∈ sites, ∀ x ∉ K j, D j x = 0)
    (single : ι → ℝ → SmoothRiemannianMetric I M)
    (hSingle : ∀ j ∈ sites, ∀ a : ℝ, |a| ≤ 1/2 → ∀ x (u v : TangentSpace I x),
      (single j a).inner x u v = g.inner x u v + a * D j x u v) :
    ∃ G : ℝ → SmoothRiemannianMetric I M, G 0 = g ∧
      (∀ a : ℝ, |a| ≤ 1/2 → ∀ j ∈ sites, ∀ x ∈ U j,
        ∀ᶠ y in 𝓝 x, ∀ u v : TangentSpace I y, (single j a).inner y u v = (G a).inner y u v) ∧
      (∀ x ∉ ⋃ j ∈ sites, U j, ∀ᶠ y in 𝓝 x, ∀ a (u v : TangentSpace I y),
        g.inner y u v = (G a).inner y u v) := by
  classical
  let L := fun x => ∑ j ∈ sites, D j x
  let S := ⋃ j ∈ sites, K j
  have hZero (x : M) (hx : x ∉ S) : L x = 0 := Finset.sum_eq_zero fun j hj =>
    hSupport j hj x fun h => hx (mem_iUnion₂.mpr ⟨j, hj, h⟩)
  have hAt (j : ι) (hj : j ∈ sites) (x : M) (hx : x ∈ U j) : L x = D j x := by
    apply Finset.sum_eq_single_of_mem j hj
    intro i hi hij
    apply hSupport i hi x
    intro h
    exact Set.disjoint_left.mp (hDisjoint hi hj hij) (hKU i hi h) hx
  have hLNorm (x : M) (u : TangentSpace I x) : |L x u u| ≤ g.inner x u u := by
    by_cases hx : x ∈ S
    · obtain ⟨j, hj, hxj⟩ := mem_iUnion₂.mp hx
      rw [hAt j hj x (hKU j hj hxj)]
      exact hNorm j hj x u
    · simpa only [hZero x hx, zero_apply, abs_zero] using metric_inner_self_nonneg g x u
  have hLSymm (x : M) (u v : TangentSpace I x) : L x u v = L x v u := by
    simp only [L, sum_apply]
    exact Finset.sum_congr rfl fun j hj => hSymm j hj x u v
  have hLSmooth (x₀ : M) (i k : Fin (Module.finrank ℝ E₄)) :
      ContMDiffOn I 𝓘(ℝ) ∞
        (fun x => L x (frameVec (I := I) x₀ i x) (frameVec (I := I) x₀ k x))
        (trivializationAt E₄ (TangentSpace I) x₀).baseSet := by
    simp only [L, sum_apply]
    exact contMDiffOn_finsetSum _ fun j hj => hSmooth j hj x₀ i k
  obtain ⟨G, hGZero, hAffine, hGOff⟩ := exists_clampedAffineMetricFamily g L hLSymm hLNorm
    hLSmooth (isClosed_biUnion_finset hClosed) hZero
  refine ⟨G, hGZero, ?_, ?_⟩
  · intro a ha j hj x hx
    filter_upwards [(hOpen j hj).mem_nhds hx] with y hy
    intro u v
    rw [hAffine a ha, hAt j hj y hy, hSingle j hj a ha]
  · intro x hx
    have hxS : x ∉ S := by
      intro h
      obtain ⟨j, hj, hK⟩ := mem_iUnion₂.mp h
      exact hx (mem_iUnion₂.mpr ⟨j, hj, hKU j hj hK⟩)
    exact (hGOff x hxS).mono fun y hy a u v => (hy a u v).symm

end AffineMetric

end SmoothPoincare
