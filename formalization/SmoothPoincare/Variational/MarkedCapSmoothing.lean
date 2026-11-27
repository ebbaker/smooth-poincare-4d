import SmoothPoincare.Variational.CapTestTransfer
import SmoothPoincare.Variational.CutNonsplitting
import SmoothPoincare.Variational.SignedCollarRepair

/-! # Smoothing a first-jet matched marked cap

The calculations below use the two full physical ledgers. The geometric
suppliers identify the unmodified interiors, bound the curvature in the
shrinking smoothing strip, and control the actual smooth scalar forms against
one coercive limit form. Both the capped carrier and its markings are fixed.
-/

open DifferentialGeometry DifferentialGeometry.Integral.Measure
open Filter FirstOrderTwistor MeasureTheory SectionsAndConnections Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

/-- The cutoff errors from a first-jet matched normal coefficient. The
bounds on `d`, `d'` are the quadratic and linear Taylor bounds for the
coefficient difference at the seam. The last bound is uniform as the
smoothing width decreases. -/
theorem firstJet_cutoff_errors {δ B A c c' c'' d d' d'' : ℝ}
    (hδ : 0 < δ) (hA : 0 ≤ A)
    (hc : |c| ≤ 1) (hc' : |c'| ≤ A / δ) (hc'' : |c''| ≤ A / δ ^ 2)
    (hd : |d| ≤ B * δ ^ 2) (hd' : |d'| ≤ B * δ) (hd'' : |d''| ≤ B) :
    |c * d| ≤ B * δ ^ 2 ∧
    |c' * d + c * d'| ≤ (A + 1) * B * δ ∧
    |c'' * d + 2 * c' * d' + c * d''| ≤ (3 * A + 1) * B := by
  have h0 : |c * d| ≤ B * δ ^ 2 := by
    rw [abs_mul]
    exact (mul_le_mul hc hd (abs_nonneg _) zero_le_one).trans_eq (one_mul _)
  have h1 : |c' * d| ≤ A * B * δ := by
    rw [abs_mul]
    calc
      _ ≤ (A / δ) * (B * δ ^ 2) :=
        mul_le_mul hc' hd (abs_nonneg _) (div_nonneg hA hδ.le)
      _ = _ := by field_simp
  have h2 : |c'' * d| ≤ A * B := by
    rw [abs_mul]
    calc
      _ ≤ (A / δ ^ 2) * (B * δ ^ 2) :=
        mul_le_mul hc'' hd (abs_nonneg _) (div_nonneg hA (sq_nonneg _))
      _ = _ := by field_simp
  have h3 : |2 * c' * d'| ≤ 2 * A * B := by
    rw [abs_mul, abs_mul, abs_of_nonneg (show (0 : ℝ) ≤ 2 by norm_num), mul_assoc]
    calc
      _ ≤ 2 * ((A / δ) * (B * δ)) :=
        mul_le_mul_of_nonneg_left (mul_le_mul hc' hd' (abs_nonneg _) (div_nonneg hA hδ.le))
          (by norm_num)
      _ = _ := by field_simp
  refine ⟨h0, ?_, ?_⟩
  · have h := abs_add_le (c' * d) (c * d')
    have h4 : |c * d'| ≤ B * δ := by
      rw [abs_mul]
      exact (mul_le_mul hc hd' (abs_nonneg _) zero_le_one).trans_eq (one_mul _)
    linarith only [h, h1, h4]
  · have h := abs_add_le (c'' * d + 2 * c' * d') (c * d'')
    have h5 := abs_add_le (c'' * d) (2 * c' * d')
    have h6 : |c * d''| ≤ B := by
      rw [abs_mul]
      exact (mul_le_mul hc hd'' (abs_nonneg _) zero_le_one).trans_eq (one_mul _)
    linarith only [h, h5, h2, h3, h6]

/-- First-jet equality is the vanishing value and normal derivative of the
coefficient difference at zero. Two mean-value estimates supply the required
quadratic and linear errors for the normal cutoff on the entire strip. -/
theorem firstJet_normalCutoff_bounds {δ A B : ℝ} (hδ : 0 < δ) (hA : 0 ≤ A) (hB : 0 ≤ B)
    {c c' c'' d d' d'' : ℝ → ℝ} (hd₀ : d 0 = 0) (hd'₀ : d' 0 = 0)
    (hdDeriv : ∀ t ∈ Icc (-δ) δ, HasDerivAt d (d' t) t)
    (hd'Deriv : ∀ t ∈ Icc (-δ) δ, HasDerivAt d' (d'' t) t)
    (hBounds : ∀ t ∈ Icc (-δ) δ,
      |c t| ≤ 1 ∧ |c' t| ≤ A / δ ∧ |c'' t| ≤ A / δ ^ 2 ∧ |d'' t| ≤ B) :
    ∀ t ∈ Icc (-δ) δ, |c t * d t| ≤ B * δ ^ 2 ∧
      |c' t * d t + c t * d' t| ≤ (A + 1) * B * δ ∧
      |c'' t * d t + 2 * c' t * d' t + c t * d'' t| ≤ (3 * A + 1) * B := by
  have h0 : 0 ∈ Icc (-δ) δ := ⟨neg_nonpos.mpr hδ.le, hδ.le⟩
  have hLinear (t : ℝ) (ht : t ∈ Icc (-δ) δ) : |d' t| ≤ B * δ := by
    have h := (convex_Icc (-δ) δ).norm_image_sub_le_of_norm_hasDerivWithin_le
      (fun s hs => (hd'Deriv s hs).hasDerivWithinAt)
      (fun s hs => by simpa only [Real.norm_eq_abs] using (hBounds s hs).2.2.2) h0 ht
    rw [hd'₀, sub_zero, sub_zero, Real.norm_eq_abs, Real.norm_eq_abs] at h
    exact h.trans (mul_le_mul_of_nonneg_left (abs_le.mpr ht) hB)
  intro t ht
  have hQuadratic : |d t| ≤ B * δ ^ 2 := by
    have h := (convex_Icc (-δ) δ).norm_image_sub_le_of_norm_hasDerivWithin_le
      (fun s hs => (hdDeriv s hs).hasDerivWithinAt)
      (fun s hs => by simpa only [Real.norm_eq_abs] using hLinear s hs) h0 ht
    rw [hd₀, sub_zero, sub_zero, Real.norm_eq_abs, Real.norm_eq_abs] at h
    exact h.trans ((mul_le_mul_of_nonneg_left (abs_le.mpr ht) (mul_nonneg hB hδ.le)).trans_eq
      (by ring))
  obtain ⟨hc, hc', hc'', hd''⟩ := hBounds t ht
  exact firstJet_cutoff_errors hδ hA hc hc' hc'' hQuadratic (hLinear t ht) hd''

local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 5)) = 4 + 1) := ⟨by simp⟩

variable {E F H K M X : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
  [TopologicalSpace H] [TopologicalSpace K]
  {I : ModelWithCorners ℝ E H} {J : ModelWithCorners ℝ F K}
  [I.Boundaryless] [J.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M] [Nonempty M]
  [TopologicalSpace X] [ChartedSpace K X] [IsManifold J ∞ X]
  [T2Space X] [CompactSpace X] [Nonempty X]
  {oM : ManifoldOrientation I M 4} {oX : ManifoldOrientation J X 4}

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩
private local instance : MeasurableSpace X := borel X
private local instance : BorelSpace X := ⟨rfl⟩

/-- The smooth structure and markings used for every metric on a capped side.
The raw set includes the seam. -/
structure MarkedCapGeometry (I : ModelWithCorners ℝ E H) (M : Type*)
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
    (J : ModelWithCorners ℝ F K) (X : Type*)
    [TopologicalSpace X] [ChartedSpace K X] [IsManifold J ∞ X] where
  raw : Set M
  rawMeasurable : MeasurableSet[borel M] raw
  interior_nonempty : (interior raw).Nonempty
  core : PartialDiffeomorph I J M X ∞
  marking : PartialDiffeomorph (𝓡 4) J StandardFourSphere X ∞
  capInMarking : standardFourSphereCap ⊆ marking.source
  rawInCore : raw ⊆ core.source
  coreImage : core '' raw = (interior (marking '' standardFourSphereCap))ᶜ

/-- Install an actual positive approximant with the original markings. -/
def MarkedCapGeometry.toSide (G : MarkedCapGeometry I M J X) (q : SignedCollarMetric oX)
    (hY : 0 < classYamabeFour oX.dimension_eq q.metric) :
    GeometricMarkedCutSide (I := I) (M := M) oX where
  raw := G.raw
  rawMeasurable := G.rawMeasurable
  core := G.core
  marking := G.marking
  capInMarking := G.capInMarking
  rawInCore := G.rawInCore
  coreImage := G.coreImage
  metric := q.metric
  frame := q.frame
  positive := hY
  integrable := q.integrable .plus

omit [FiniteDimensional ℝ E] [I.Boundaryless] [T2Space M] [CompactSpace M] [Nonempty M] in
@[simp]
theorem MarkedCapGeometry.toSide_cappedEnergy (G : MarkedCapGeometry I M J X)
    (q : SignedCollarMetric oX) (hY : 0 < classYamabeFour oX.dimension_eq q.metric) :
    (G.toSide q hY).cappedEnergy = q.energy .plus := rfl

/-- Inputs from first-jet smoothing in a common signed normal collar. The two
bands include every term that changes. `offBand_eq` transports the original
physical density and uses the vanishing Weyl density on the flat cap portion.
The scalar comparison uses the actual smooth test numerator and denominator. -/
structure MarkedCapSmoothing (source : SignedCollarMetric oM)
    (G : MarkedCapGeometry I M J X) (limitForm : C^∞⟮J, X; ℝ⟯ → ℝ) where
  smooth : ℕ → SignedCollarMetric oX
  sourceBand : ℕ → Set M
  capBand : ℕ → Set X
  sourceBand_measurable : ∀ n, MeasurableSet (sourceBand n)
  capBand_measurable : ∀ n, MeasurableSet (capBand n)
  sourceBand_subset : ∀ n, sourceBand n ⊆ G.raw
  offBand_eq : ∀ n sign,
    (smooth n).charge sign (capBand n)ᶜ = source.charge sign (G.raw \ sourceBand n)
  sourceBandVolume_zero : Tendsto (fun n =>
    (riemannianVolumeMeasure I M source.metric).real (sourceBand n)) atTop (𝓝 0)
  capBandVolume_zero : Tendsto (fun n =>
    (riemannianVolumeMeasure J X (smooth n).metric).real (capBand n)) atTop (𝓝 0)
  densityBound : ℝ
  sourceDensity_le : ∀ n sign x, x ∈ sourceBand n →
    hilbertSchmidtSq (signedCollarWeylBlock oM source.metric source.frame sign x) ≤ densityBound
  capDensity_le : ∀ n sign x, x ∈ capBand n →
    hilbertSchmidtSq (signedCollarWeylBlock oX (smooth n).metric (smooth n).frame sign x) ≤ densityBound
  referenceH1Sq : C^∞⟮J, X; ℝ⟯ → ℝ
  formError : ℕ → ℝ
  formError_zero : Tendsto formError atTop (𝓝 0)
  formError_le : ∀ n u,
    |capTestScalar (conformalMetric (smooth n).metric u) - limitForm u| ≤
      formError n * referenceH1Sq u
  testVolume_le : ∃ S > (0 : ℝ), ∀ n u,
    Real.sqrt (capTestVolume (conformalMetric (smooth n).metric u)) ≤ S * referenceH1Sq u

omit [I.Boundaryless] [Nonempty M] in
private theorem signedCharge_le_stripVolume
    (q : SignedCollarMetric oM) (sign : CollarChirality) {U : Set M} (hU : MeasurableSet U)
    {D : ℝ} (hD : ∀ x ∈ U,
      hilbertSchmidtSq (signedCollarWeylBlock oM q.metric q.frame sign x) ≤ D) :
    q.charge sign U ≤ D * (riemannianVolumeMeasure I M q.metric).real U := by
  let μ := riemannianVolumeMeasure I M q.metric
  let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts q.metric
  rw [SignedCollarMetric.charge, SignedCollarMetric.chiralMeasure, energyMeasure_real_apply hU
    (q.integrable sign).integrableOn (Eventually.of_forall fun x =>
      Finset.sum_nonneg fun i _ => Finset.sum_nonneg fun j _ => sq_nonneg _)]
  calc
    _ ≤ ∫ _ in U, D ∂μ := setIntegral_mono_on (q.integrable sign).integrableOn
      (integrable_const D).integrableOn hU hD
    _ = _ := by simp [μ, mul_comm]

omit [I.Boundaryless] [Nonempty M] [J.Boundaryless] [Nonempty X] in
/-- Both complete smooth capped energies limit to the corresponding complete
raw-side energies. The two signed energies of the raw side are equal since
signature zero holds at every smooth approximant. -/
theorem markedCap_energyLimit_of_firstJet {source : SignedCollarMetric oM}
    {G : MarkedCapGeometry I M J X} {limitForm : C^∞⟮J, X; ℝ⟯ → ℝ}
    (S : MarkedCapSmoothing (oX := oX) source G limitForm) :
    (∀ sign, Tendsto (fun n => (S.smooth n).energy sign) atTop
      (𝓝 (source.charge sign G.raw))) ∧ source.charge .plus G.raw = source.charge .minus G.raw := by
  have hLim (sign : CollarChirality) : Tendsto (fun n => (S.smooth n).energy sign) atTop
      (𝓝 (source.charge sign G.raw)) := by
    have hCap : Tendsto (fun n => (S.smooth n).charge sign (S.capBand n)) atTop (𝓝 0) := by
      apply squeeze_zero (fun _ => measureReal_nonneg)
        (fun n => signedCharge_le_stripVolume (S.smooth n) sign (S.capBand_measurable n)
          (S.capDensity_le n sign))
      simpa only [mul_zero] using S.capBandVolume_zero.const_mul S.densityBound
    have hRaw : Tendsto (fun n => source.charge sign (S.sourceBand n)) atTop (𝓝 0) := by
      apply squeeze_zero (fun _ => measureReal_nonneg)
        (fun n => signedCharge_le_stripVolume source sign (S.sourceBand_measurable n)
          (S.sourceDensity_le n sign))
      simpa only [mul_zero] using S.sourceBandVolume_zero.const_mul S.densityBound
    have hBalance (n : ℕ) : (S.smooth n).energy sign = source.charge sign G.raw +
        ((S.smooth n).charge sign (S.capBand n) - source.charge sign (S.sourceBand n)) := by
      have hX : (S.smooth n).charge sign (S.capBand n)ᶜ +
          (S.smooth n).charge sign (S.capBand n) = (S.smooth n).energy sign := by
        rw [← (S.smooth n).charge_univ sign, ← compl_union_self (S.capBand n)]
        exact (measureReal_union disjoint_compl_left (S.capBand_measurable n)).symm
      have hM : source.charge sign (G.raw \ S.sourceBand n) +
          source.charge sign (S.sourceBand n) = source.charge sign G.raw := by
        calc
          _ = source.charge sign ((G.raw \ S.sourceBand n) ∪ S.sourceBand n) :=
            (measureReal_union disjoint_sdiff_left (S.sourceBand_measurable n)).symm
          _ = _ := by rw [sdiff_union_of_subset (S.sourceBand_subset n)]
      linarith only [hX, hM, S.offBand_eq n sign]
    simpa only [← hBalance, sub_zero, add_zero] using
      (tendsto_const_nhds (x := source.charge sign G.raw)).add (hCap.sub hRaw)
  refine ⟨hLim, tendsto_nhds_unique (hLim .plus) ?_⟩
  exact (hLim .minus).congr fun n => (S.smooth n).signature_zero.symm

omit [I.Boundaryless] [Nonempty M] in
/-- A coercive joined form persists through the quantitative form comparison.
The Sobolev upper bound on the test denominator supplies a uniform lower
bound for all conformal quotients on each sufficiently late metric. -/
theorem MarkedCapSmoothing.eventually_positive {source : SignedCollarMetric oM}
    {G : MarkedCapGeometry I M J X} {limitForm : C^∞⟮J, X; ℝ⟯ → ℝ}
    (S : MarkedCapSmoothing (oX := oX) source G limitForm)
    (hCoercive : ∃ c > 0, ∀ u, c * S.referenceH1Sq u ≤ limitForm u) :
    ∀ᶠ n in atTop, 0 < classYamabeFour oX.dimension_eq (S.smooth n).metric := by
  obtain ⟨c, hc, hLower⟩ := hCoercive
  obtain ⟨A, hA, hVolume⟩ := S.testVolume_le
  filter_upwards [S.formError_zero.eventually_lt_const (show 0 < c / 2 by positivity)] with n hn
  have hFloor : 0 < c / (2 * A) := by positivity
  refine hFloor.trans_le (le_csInf (range_nonempty _) ?_)
  rintro _ ⟨u, rfl⟩
  let q := conformalMetric (S.smooth n).metric u
  let μ := riemannianVolumeMeasure J X q
  let : μ.IsOpenPosMeasure := riemannianVolumeMeasure_isOpenPosMeasure q
  let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts q
  have hVol : 0 < Real.sqrt (capTestVolume q) := by
    apply Real.sqrt_pos_of_pos
    exact ENNReal.toReal_pos (isOpen_univ.measure_pos μ univ_nonempty).ne' (measure_ne_top μ univ)
  have hRef : 0 ≤ S.referenceH1Sq u :=
    nonneg_of_mul_nonneg_right (hVol.le.trans (hVolume n u)) hA
  have hError := (abs_le.mp (S.formError_le n u)).1
  change c / (2 * A) ≤ capTestScalar q / Real.sqrt (capTestVolume q)
  apply (le_div_iff₀ hVol).2
  calc
    _ ≤ c / (2 * A) * (A * S.referenceH1Sq u) := mul_le_mul_of_nonneg_left (hVolume n u) hFloor.le
    _ = (c / 2) * S.referenceH1Sq u := by field_simp
    _ ≤ capTestScalar q := by
      linarith only [hLower u, hError, mul_le_mul_of_nonneg_right hn.le hRef]

end SmoothPoincare
