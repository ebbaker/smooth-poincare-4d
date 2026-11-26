import SmoothPoincare.Variational.ExactFacePhysicalInterpolation
import SmoothPoincare.PhysicalScales.PositiveProductBand
import DifferentialGeometry.Analysis.Integration.Measure.PullbackPartial
import DifferentialGeometry.Analysis.Integration.Measure.VolumeDensity

/-! # Physical volume of every substrip of a fixed marked spherical face -/

noncomputable section

open DifferentialGeometry DifferentialGeometry.Geometry DifferentialGeometry.Integral.Measure
open Manifold Set MeasureTheory TopologicalSpace
open scoped Manifold ContDiff ENNReal

namespace SmoothPoincare

local notation "J" => ModelWithCorners.prod (𝓡 3) (𝓘(ℝ))
private local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 4)) = 3 + 1) := ⟨by simp⟩

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]

/-- A single smooth dominating tensor for every choice of the two physical
widths and every time. The scalar majorant also controls the exposure. -/
def exactFaceVolumeMajorant (g R : SmoothRiemannianMetric I M) (u : C^∞⟮I, M; ℝ⟯) :
    SmoothRiemannianMetric I M :=
  let mid := R.convexComb (conformalMetric g u) (fun _ => 1 / 2)
    contMDiff_const (fun _ => ⟨by norm_num, by norm_num⟩)
  conformalMetric mid (fun y => 1 + (u y)^2) (contMDiff_const.add (u.contMDiff.pow 2))

set_option backward.isDefEq.respectTransparency false in
theorem exactFacePhysicalPath_inner_le_majorant
    (F : PartialDiffeomorph J I ExactFaceTube M ∞) (g R : SmoothRiemannianMetric I M)
    (u : C^∞⟮I, M; ℝ⟯) {wL wR : ℝ} (hL : 0 < wL) (hR : 0 < wR)
    (hS : exactFaceSlab wL wR ⊆ F.source) (s : Icc (0 : ℝ) 1) (y : M)
    (v : TangentSpace I y) :
    (exactFacePhysicalPath F g R u hL hR hS s).inner y v v ≤
      2 * (exactFaceVolumeMajorant g R u).inner y v v := by
  rw [exactFacePhysicalPath_inner]
  let χ := exactFacePhysicalCutoff F hL hR hS y
  let ζ := exactFacePhysicalCutoff F (wL := wL / 4) (wR := wR / 4) (by positivity)
    (by positivity) ((exactFaceSlab_mono (by linarith : wL/4 ≤ wL) (by linarith : wR/4 ≤ wR)).trans hS) y
  have inUnit (z : ℝ) (hz : z ∈ Icc (0:ℝ) 1) : (s:ℝ)*z ∈ Icc (0:ℝ) 1 :=
    ⟨mul_nonneg s.2.1 hz.1, (mul_le_mul_of_nonneg_right s.2.2 hz.1).trans (by simpa using hz.2)⟩
  have hχ := inUnit χ (exactFacePhysicalCutoff_mem_Icc _ _ _ _ _)
  have hζ := inUnit ζ (exactFacePhysicalCutoff_mem_Icc _ _ _ _ _)
  have hExp : Real.exp (2 * (((s:ℝ)*ζ - 1)*u y)) ≤ Real.exp (2*(1+(u y)^2)) := by
    apply Real.exp_le_exp.mpr
    have hOne : (s:ℝ)*ζ-1 ∈ Icc (-1:ℝ) 0 := ⟨by linarith [hζ.1], by linarith [hζ.2]⟩
    rcases le_total 0 (u y) with hp | hn
    · nlinarith [mul_nonpos_of_nonpos_of_nonneg hOne.2 hp, sq_nonneg (u y)]
    · nlinarith [mul_le_mul_of_nonpos_right hOne.1 hn, sq_nonneg (u y + 1/2)]
  have hG := mul_nonneg (Real.exp_pos (2 * u y)).le (metric_inner_self_nonneg g y v)
  have hRR := metric_inner_self_nonneg R y v
  have hUpper := add_le_add (mul_le_mul_of_nonneg_right hχ.2 hRR)
    (mul_le_mul_of_nonneg_right (show 1-(s:ℝ)*χ ≤ 1 by linarith [hχ.1]) hG)
  simp only [one_mul] at hUpper
  refine (mul_le_mul_of_nonneg_left hUpper (Real.exp_pos _).le).trans ?_
  refine (mul_le_mul_of_nonneg_right hExp (add_nonneg hRR hG)).trans_eq ?_
  unfold exactFaceVolumeMajorant
  rw [Geometry.conformalMetric_inner, convexComb_inner, DifferentialGeometry.conformalMetric_inner]
  simp only [smul_eq_mul]
  ring



private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

variable [SigmaCompactSpace M]

/-- Change of metric on one measurable compact region using its actual
Radon--Nikodym density. -/
theorem physicalVolumeReal_le_of_density (R p : SmoothRiemannianMetric I M)
    {A : Set M} (hA : IsCompact A) {D : ℝ} (hD : 0 ≤ D)
    (hd : ∀ y ∈ A, riemannianVolumeDensity R p y ≤ D) :
    (riemannianVolumeMeasure I M p).real A ≤ D * (riemannianVolumeMeasure I M R).real A := by
  let μ := riemannianVolumeMeasure I M R
  let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts R
  have hfinite : μ A ≠ ⊤ := hA.measure_lt_top.ne
  have hμ : riemannianVolumeMeasure I M p A ≤ ENNReal.ofReal D * μ A := by
    rw [riemannianVolumeMeasure_eq_withDensity R p, withDensity_apply _ hA.measurableSet]
    exact (setLIntegral_mono' hA.measurableSet (fun y hy => ENNReal.ofReal_le_ofReal (hd y hy))).trans_eq
      (by simp [μ])
  have h := ENNReal.toReal_mono (ENNReal.mul_ne_top ENNReal.ofReal_ne_top hfinite) hμ
  simpa [measureReal_def, ENNReal.toReal_mul, ENNReal.toReal_ofReal hD, μ] using h

/-- The physical volume ratio has a single upper bound uniform in time and
both independent widths on a compact part of the native tube. -/
theorem exists_exactFace_volumeRatio_bound (F : PartialDiffeomorph J I ExactFaceTube M ∞)
    (g R : SmoothRiemannianMetric I M) (u : C^∞⟮I, M; ℝ⟯) {K : Set M} (hK : IsCompact K) :
    ∃ B : ℝ, 0 ≤ B ∧ ∀ {wL wR : ℝ} (hL : 0 < wL) (hR : 0 < wR)
      (hS : exactFaceSlab wL wR ⊆ F.source) (s : Icc (0 : ℝ) 1) (y : M), y ∈ K →
        riemannianVolumeDensity R (exactFacePhysicalPath F g R u hL hR hS s) y ≤ B := by
  let Q := exactFaceVolumeMajorant g R u
  let C := Real.sqrt (2 ^ Module.finrank ℝ E)
  obtain ⟨b, hb⟩ := hK.bddAbove_image (riemannianVolumeDensity_contMDiff R Q).continuous.continuousOn
  refine ⟨max 0 b * C, mul_nonneg (le_max_left ..) (Real.sqrt_nonneg _), ?_⟩
  intro wL wR hL hR hS s y hy
  let P := exactFacePhysicalPath F g R u hL hR hS s
  rw [← riemannianVolumeDensity_mul R Q P]
  exact mul_le_mul ((hb (mem_image_of_mem _ hy)).trans (le_max_right ..))
    (riemannianVolumeDensity_le_of_inner_le Q P (by norm_num : 0 < (2:ℝ)) y
      (exactFacePhysicalPath_inner_le_majorant F g R u hL hR hS s y))
    (riemannianVolumeDensity_pos Q P y).le (le_max_left ..)

/-- The round angular area in the same normalization as the reference metric. -/
def exactFaceAngularArea : ℝ :=
  (riemannianVolumeMeasure (𝓡 3) ExactFaceSphere
    (roundMetric (E := EuclideanSpace ℝ (Fin 4)) (n := 3))).real univ

theorem exactFaceRoundCylinder_strip_volume {a b : ℝ} (hab : a ≤ b) :
    (riemannianVolumeMeasure J ExactFaceTube exactFaceRoundCylinder).real (univ ×ˢ Icc a b) =
      (b-a) * exactFaceAngularArea := by
  let h := roundMetric (E := EuclideanSpace ℝ (Fin 4)) (n := 3)
  have he : exactFaceRoundCylinder = DifferentialGeometry.Geometry.Metric.cylinderMetric h := by
    apply SmoothRiemannianMetric.ext_inner
    intro x v w
    rw [DifferentialGeometry.Geometry.Metric.cylinderMetric_inner]
    rw [exactFaceRoundCylinder, SmoothRiemannianMetric.prod_inner]
    congr 1
    change w.2 * v.2 = v.2 * w.2
    exact mul_comm ..
  have hh := PositiveScalarCuts.riemannianProductBand_integral_eq h
    (fun _ => (4:ℝ)) (fun _ => (1:ℝ)) hab (fun _ _ => by norm_num)
  rw [he]
  simp [integral_const, Measure.real] at hh
  change _ = (b-a) * (riemannianVolumeMeasure (𝓡 3) ExactFaceSphere h).real univ
  dsimp [Measure.real]
  linarith only [hh]

private local instance : MeasurableSpace ExactFaceTube := borel ExactFaceTube
private local instance : BorelSpace ExactFaceTube := ⟨rfl⟩

variable [I.Boundaryless]

/-- On the given partial diffeomorphism select one reference and one volume
constant on the entire compact physical slab. They work simultaneously for
every pair of subwidths, every time and every closed transverse subinterval,
including the common seam of zero thickness. -/
theorem exists_exactFacePhysical_stripVolume (F : PartialDiffeomorph J I ExactFaceTube M ∞)
    (g : SmoothRiemannianMetric I M) (u : C^∞⟮I, M; ℝ⟯) {WL WR : ℝ}
    (hS : exactFaceSlab WL WR ⊆ F.source) :
    ∃ (R : SmoothRiemannianMetric I M) (V : ℝ), 0 ≤ V ∧
      (∀ z ∈ exactFaceSlab WL WR, ∀ v w : TangentSpace J z,
        R.inner (F z) (mfderiv J I F z v) (mfderiv J I F z w) =
          exactFaceRoundCylinder.inner z v w) ∧
      ∀ {wL wR : ℝ} (hL : 0 < wL) (hR : 0 < wR) (hwL : wL ≤ WL) (hwR : wR ≤ WR)
        (s : Icc (0 : ℝ) 1) {a b : ℝ}, -WL ≤ a → a ≤ b → b ≤ WR →
          (riemannianVolumeMeasure I M (exactFacePhysicalPath F g R u hL hR
            ((exactFaceSlab_mono hwL hwR).trans hS) s)).real (F '' (univ ×ˢ Icc a b)) ≤
            V * (b-a) := by
  obtain ⟨R, U, hKU, hUF, hR, _⟩ :=
    F.exists_metric_preserving_on_neighborhood_of_is_compact exactFaceRoundCylinder g
      (isCompact_exactFaceSlab WL WR) hS
  have hK := (isCompact_exactFaceSlab WL WR).image_of_continuousOn
    (F.contMDiffOn_toFun.continuousOn.mono hS)
  obtain ⟨B, hB, hDom⟩ := exists_exactFace_volumeRatio_bound F g R u hK
  have hArea : 0 ≤ exactFaceAngularArea := measureReal_nonneg
  refine ⟨R, B * exactFaceAngularArea, mul_nonneg hB hArea,
    fun z hz v w => (hR z (hKU hz) v w).symm, ?_⟩
  intro wL wR hL hRight hwL hwR s a b hLa hab hbR
  let A : Set ExactFaceTube := univ ×ˢ Icc a b
  have hAK : A ⊆ exactFaceSlab WL WR := prod_mono Subset.rfl (Icc_subset_Icc hLa hbR)
  have hAc : IsCompact A := isCompact_univ.prod isCompact_Icc
  have hPA : IsCompact (F '' A) := hAc.image_of_continuousOn (F.contMDiffOn_toFun.continuousOn.mono (hAK.trans hS))
  have hChange := setLIntegral_image_partialDiffeomorph F exactFaceRoundCylinder R U hUF hR
    hAc.measurableSet (hAK.trans hKU) (fun _ => (1:ℝ≥0∞))
  have hVol : (riemannianVolumeMeasure I M R).real (F '' A) =
      (b-a) * exactFaceAngularArea := by
    have hh : riemannianVolumeMeasure I M R (F '' A) =
        riemannianVolumeMeasure J ExactFaceTube exactFaceRoundCylinder A := by simpa using hChange
    exact (congrArg ENNReal.toReal hh).trans (exactFaceRoundCylinder_strip_volume hab)
  apply (physicalVolumeReal_le_of_density R _ hPA hB
    (fun y hy => hDom hL hRight ((exactFaceSlab_mono hwL hwR).trans hS) s y (image_mono hAK hy))).trans
  rw [hVol]
  ring_nf
  exact le_rfl


section Charges

open FirstOrderTwistor SectionsAndConnections
variable {H₄ N : Type*} [TopologicalSpace H₄]
  {I₄ : ModelWithCorners ℝ (EuclideanSpace ℝ (Fin 4)) H₄} [I₄.Boundaryless]
  [TopologicalSpace N] [ChartedSpace H₄ N] [IsManifold I₄ ∞ N] [T2Space N] [CompactSpace N]
  {o : ManifoldOrientation I₄ N 4}
private local instance : MeasurableSpace N := borel N
private local instance : BorelSpace N := ⟨rfl⟩

omit [I₄.Boundaryless] in
/-- A pointwise Weyl density bound is integrated against the volume of its
own metric. This also applies to the entire substrip on each side. -/
theorem signedCharge_le_density_mul_volume (q : SignedCollarMetric o)
    (sg : CollarChirality) {A : Set N} (hA : MeasurableSet A) {D : ℝ}
    (hD : ∀ x ∈ A, hilbertSchmidtSq (signedCollarWeylBlock o q.metric q.frame sg x) ≤ D) :
    q.charge sg A ≤ D * (riemannianVolumeMeasure I₄ N q.metric).real A := by
  let μ := riemannianVolumeMeasure I₄ N q.metric
  let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts q.metric
  rw [SignedCollarMetric.charge, SignedCollarMetric.chiralMeasure, energyMeasure_real_apply hA
    (q.integrable sg).integrableOn (Filter.Eventually.of_forall fun x =>
      Finset.sum_nonneg fun i _ => Finset.sum_nonneg fun j _ => sq_nonneg _)]
  calc
    _ ≤ ∫ _ in A, D ∂μ := setIntegral_mono_on (q.integrable sg).integrableOn
      (integrable_const D).integrableOn hA hD
    _ = _ := by simp [μ, mul_comm]

/-- Uniform physical volume, signed strip energy and the null common face for
the very same family. The endpoint and start require no special estimates. -/
theorem exists_exactFacePhysical_stripCharge (F : PartialDiffeomorph J I₄ ExactFaceTube N ∞)
    (g : SmoothRiemannianMetric I₄ N) (u : C^∞⟮I₄, N; ℝ⟯) {WL WR : ℝ}
    (hS : exactFaceSlab WL WR ⊆ F.source) :
    ∃ (R : SmoothRiemannianMetric I₄ N) (V : ℝ), 0 ≤ V ∧
      (∀ z ∈ exactFaceSlab WL WR, ∀ v w : TangentSpace J z,
        R.inner (F z) (mfderiv J I₄ F z v) (mfderiv J I₄ F z w) =
          exactFaceRoundCylinder.inner z v w) ∧
      ∀ {wL wR : ℝ} (hL : 0 < wL) (hR : 0 < wR) (hwL : wL ≤ WL) (hwR : wR ≤ WR)
        (s : Icc (0 : ℝ) 1) (q : SignedCollarMetric o),
        q.metric = exactFacePhysicalPath F g R u hL hR ((exactFaceSlab_mono hwL hwR).trans hS) s →
        ∀ sg : CollarChirality,
          q.charge sg (F '' (univ ×ˢ Icc (0:ℝ) 0)) = 0 ∧
          ∀ {a b D : ℝ}, -WL ≤ a → a ≤ b → b ≤ WR → 0 ≤ D →
            (∀ y ∈ F '' (univ ×ˢ Icc a b),
              hilbertSchmidtSq (signedCollarWeylBlock o q.metric q.frame sg y) ≤ D) →
            q.charge sg (F '' (univ ×ˢ Icc a b)) ≤ D * V * (b - a) := by
  obtain ⟨R,V,hV,hR,hBound⟩ := exists_exactFacePhysical_stripVolume F g u hS
  refine ⟨R,V,hV,hR,?_⟩
  intro wL wR hL hRight hwL hwR s q hq sg
  let μ := riemannianVolumeMeasure I₄ N q.metric
  let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts q.metric
  have bound {a b : ℝ} (ha : -WL ≤ a) (hab : a ≤ b) (hb : b ≤ WR) :
      μ.real (F '' (univ ×ˢ Icc a b)) ≤ V * (b-a) := by
    dsimp [μ]
    rw [hq]
    exact hBound hL hRight hwL hwR s ha hab hb
  constructor
  · let Z := F '' (univ ×ˢ Icc (0:ℝ) 0)
    have hzle := bound (a := 0) (b := 0) (by linarith) le_rfl (by linarith)
    have hz : μ.real Z = 0 := le_antisymm (by simpa [Z] using hzle) measureReal_nonneg
    have hnull : μ Z = 0 := by rw [← ofReal_measureReal (measure_ne_top μ Z), hz, ENNReal.ofReal_zero]
    have hAC : q.chiralMeasure sg ≪ μ := withDensity_absolutelyContinuous _ _
    exact congrArg ENNReal.toReal (hAC hnull)
  · intro a b D ha hab hb hD hd
    have hAK : univ ×ˢ Icc a b ⊆ exactFaceSlab WL WR := prod_mono Subset.rfl (Icc_subset_Icc ha hb)
    have hComp := (isCompact_univ.prod (isCompact_Icc (a := a) (b := b))).image_of_continuousOn
      (F.contMDiffOn_toFun.continuousOn.mono (hAK.trans hS))
    exact (signedCharge_le_density_mul_volume q sg hComp.measurableSet hd).trans
      ((mul_le_mul_of_nonneg_left (bound ha hab hb) hD).trans_eq (mul_assoc ..).symm)

end Charges

end SmoothPoincare
