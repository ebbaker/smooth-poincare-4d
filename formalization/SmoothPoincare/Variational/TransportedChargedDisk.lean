import SmoothPoincare.Variational.FiniteWidthMismatch
import SmoothPoincare.Variational.PhysicalStripVolume
import SmoothPoincare.Variational.ConformalChiralCharges
import SmoothPoincare.Variational.ConformalCoreReference
import SmoothPoincare.Variational.SelectedDiskReference
import FirstOrderTwistor.ChiralFramePullback
import FirstOrderTwistor.YamabeTransport

/-! # Signed charge of the metric transported onto the selected physical disk -/

noncomputable section
open DifferentialGeometry DifferentialGeometry.Integral.Measure FirstOrderTwistor SectionsAndConnections
open Set MeasureTheory Manifold
open scoped ContDiff Manifold

set_option backward.isDefEq.respectTransparency false
open DifferentialGeometry.Geometry.Curvature

namespace SmoothPoincare
local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ,E₄)
variable {H N : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace N] [ChartedSpace H N] [IsManifold I ∞ N] [T2Space N] [CompactSpace N]
  {o : ManifoldOrientation I N 4}
private local instance : MeasurableSpace N := borel N
private local instance : BorelSpace N := ⟨rfl⟩

namespace SignedCollarMetric

omit [I.Boundaryless] in
theorem block_pullback (q : SignedCollarMetric o) (φ : N ≃ₘ⟮I, I⟯ N)
    (hφ : φ.preservesOrientation o o) (sg : CollarChirality) (x : N) :
    signedCollarWeylBlock o (Diffeomorph.pullbackMetricCross q.metric φ)
      (pullbackOrientedOrthonormalFrames q.metric φ hφ q.frame) sg x =
      signedCollarWeylBlock o q.metric q.frame sg (φ x) := by
  cases sg with
  | plus => exact geometricChiralBlock_pullback q.metric φ hφ x _
  | minus =>
    change traceFreeChiralBlock (antiSelfDualCurvatureBlock _) = traceFreeChiralBlock (antiSelfDualCurvatureBlock _)
    exact congrArg (fun r => traceFreeChiralBlock (antiSelfDualCurvatureBlock r))
      (metricCurvatureFrameTensor_pullback q.metric φ hφ x (q.frame (φ x)))

private theorem signedPullbackIntegral (q : SignedCollarMetric o) (φ : N ≃ₘ⟮I, I⟯ N)
    (hφ : φ.preservesOrientation o o) (sg : CollarChirality) (U : Set N) :
    (∫ x in U, hilbertSchmidtSq (signedCollarWeylBlock o (Diffeomorph.pullbackMetricCross q.metric φ)
      (pullbackOrientedOrthonormalFrames q.metric φ hφ q.frame) sg x)
      ∂riemannianVolumeMeasure I N (Diffeomorph.pullbackMetricCross q.metric φ)) =
    ∫ y in φ '' U, hilbertSchmidtSq (signedCollarWeylBlock o q.metric q.frame sg y)
      ∂riemannianVolumeMeasure I N q.metric := by
  simp_rw [block_pullback]
  rw [riemannianVolumeMeasure_pullback_cross]
  let e := φ.symm.toHomeomorph.toMeasurableEquiv
  have hpre : e ⁻¹' U = φ '' U := by
    ext y
    constructor
    · intro hy
      exact ⟨φ.symm y, hy, φ.apply_symm_apply y⟩
    · rintro ⟨x,hx,rfl⟩
      change φ.symm (φ x) ∈ U
      simpa using hx
  rw [← hpre]
  change (∫ x in U, hilbertSchmidtSq (signedCollarWeylBlock o q.metric q.frame sg (φ x))
    ∂Measure.map e (riemannianVolumeMeasure I N q.metric)) = _
  rw [setIntegral_map_equiv e]
  exact integral_congr_ae (Filter.Eventually.of_forall fun y => by simp [e])

/-- Transport the full signed measure package in the pulled oriented frame. -/
def pullback (q : SignedCollarMetric o) (φ : N ≃ₘ⟮I, I⟯ N)
    (hφ : φ.preservesOrientation o o) : SignedCollarMetric o where
  metric := Diffeomorph.pullbackMetricCross q.metric φ
  frame := pullbackOrientedOrthonormalFrames q.metric φ hφ q.frame
  integrable sg := by
    simp_rw [block_pullback]
    rw [riemannianVolumeMeasure_pullback_cross]
    apply φ.symm.toHomeomorph.measurableEmbedding.integrable_map_iff.mpr
    simpa [Function.comp_def] using q.integrable sg
  signature_zero := by
    have hp := signedPullbackIntegral q φ hφ .plus univ
    have hn := signedPullbackIntegral q φ hφ .minus univ
    rw [image_univ_of_surjective (f := (φ : N → N)) φ.surjective, setIntegral_univ, setIntegral_univ] at hp hn
    exact hp.trans (q.signature_zero.trans hn.symm)

theorem charge_pullback (q : SignedCollarMetric o) (φ : N ≃ₘ⟮I, I⟯ N)
    (hφ : φ.preservesOrientation o o) {U : Set N} (hU : MeasurableSet U) (sg : CollarChirality) :
    (q.pullback φ hφ).charge sg U = q.charge sg (φ '' U) := by
  have hU' : MeasurableSet (φ '' U) := φ.toHomeomorph.measurableEmbedding.measurableSet_image.mpr hU
  have price (m : SignedCollarMetric o) {A : Set N} (ha : MeasurableSet A) :
      m.charge sg A = ∫ x in A, hilbertSchmidtSq (signedCollarWeylBlock o m.metric m.frame sg x)
        ∂riemannianVolumeMeasure I N m.metric :=
    energyMeasure_real_apply ha (m.integrable sg).integrableOn
      (Filter.Eventually.of_forall fun x => Finset.sum_nonneg fun _ _ => Finset.sum_nonneg fun _ _ => sq_nonneg _)
  rw [price _ hU, price _ hU']
  exact signedPullbackIntegral q φ hφ sg U

theorem energy_pullback [Nonempty N] (q : SignedCollarMetric o) (φ : N ≃ₘ⟮I, I⟯ N)
    (hφ : φ.preservesOrientation o o) (sg : CollarChirality) :
    (q.pullback φ hφ).energy sg = q.energy sg := by
  rw [← charge_univ, charge_pullback q φ hφ MeasurableSet.univ, image_univ_of_surjective (f := (φ : N → N)) φ.surjective, charge_univ]

end SignedCollarMetric

variable [Nonempty N] [PathConnectedSpace N]

/-- After flattening at one finite index, move the original marked disk into
that flat pocket and expose any smooth conformal representative. The metric
on the original closed carrier is positive and has the same total as the
flattened source. All original signed disk mass reappears in the complete
exterior, corrected by the actual signed flattening increment. -/
theorem chargedDisk_flatPocket_transport (g flat : SignedCollarMetric o)
    (F : PartialDiffeomorph I₄ I E₄ N ∞) (hF : Metric.closedBall (0:E₄) 1 ⊆ F.source)
    (φ : N ≃ₘ⟮I,I⟯ N) (hφ : φ.preservesOrientation o o) (u : C^∞⟮I,N;ℝ⟯)
    (hFlat : ∀ x ∈ φ '' selectedChartDisk F, metricRm04At flat.metric x = 0)
    (hp : 0 < classYamabeFour o.dimension_eq flat.metric) :
    let q := (flat.conformal u).pullback φ hφ
    let D := selectedChartDisk F
    let V := (interior D)ᶜ
    let Δ := flat.energy .plus - g.energy .plus
    0 < classYamabeFour o.dimension_eq q.metric ∧
    sInf (geometricPositiveEnergies o) ≤ g.energy .plus + Δ ∧
    ∀ sg : CollarChirality, q.charge sg D = 0 ∧ q.energy sg = g.energy .plus + Δ ∧
      q.charge sg V - g.charge sg V = g.charge sg D + Δ ∧
      (∀ K ⊆ D, q.charge sg K = 0) := by
  intro q D V Δ
  have hy : classYamabeFour o.dimension_eq q.metric = classYamabeFour o.dimension_eq flat.metric := by
    exact (classYamabeFour_pullback _ _ _ φ).trans (classYamabeFour_conformalCore _ _ _)
  have hInf := csInf_le (geometricPositiveEnergies_bddBelow o) (flat.energy_mem_of_positive hp)
  refine ⟨hy.symm ▸ hp, by dsimp [Δ]; linarith, ?_⟩
  intro sg
  have hD := (isCompact_selectedChartDisk F hF).measurableSet
  have hz : q.charge sg D = 0 := by
    rw [SignedCollarMetric.charge_pullback _ φ hφ hD, SignedCollarMetric.charge_conformal]
    exact selectedReference_charge_eq_zero_of_flat flat
      (φ.toHomeomorph.measurableEmbedding.measurableSet_image.mpr hD) hFlat sg
  have en (s : CollarChirality) : q.energy s = flat.energy .plus := by
    dsimp [q]
    rw [SignedCollarMetric.energy_pullback, ← SignedCollarMetric.charge_univ,
      SignedCollarMetric.charge_conformal, SignedCollarMetric.charge_univ]
    cases s with
    | plus => rfl
    | minus => exact flat.signature_zero.symm
  refine ⟨hz, by dsimp [Δ]; linarith only [en sg], ?_, ?_⟩
  · dsimp [V,D,Δ]
    rw [signedCharge_fullMarkedExterior q sg F hF, signedCharge_fullMarkedExterior g sg F hF]
    change _ - q.charge sg D - _ = _
    rw [hz, en]
    ring
  · intro K hK
    exact le_antisymm ((measureReal_mono (μ := q.chiralMeasure sg) hK).trans_eq hz) measureReal_nonneg

/-- At every time of a smooth geometric transport supplied on the carrier,
the complete signed total comes from its associated physical flattening
slice. Any strict incoming flattening margin therefore bounds the joined
peak, and the sign follows that same slice. -/
theorem transportedDisk_path_peak {ι : Type*} (flat : ι → SignedCollarMetric o)
    (φ : ι → N ≃ₘ⟮I,I⟯ N) (hφ : ∀ t, (φ t).preservesOrientation o o)
    (u : ι → C^∞⟮I,N;ℝ⟯) {Hpeak wall : ℝ} (hStrict : Hpeak < wall)
    (hBound : ∀ t, (flat t).energy .plus ≤ Hpeak)
    (hPos : ∀ t, 0 < classYamabeFour o.dimension_eq (flat t).metric) :
    ∀ t, let q := ((flat t).conformal (u t)).pullback (φ t) (hφ t)
      0 < classYamabeFour o.dimension_eq q.metric ∧
      ∀ sg, q.energy sg = (flat t).energy .plus ∧ q.energy sg ≤ Hpeak ∧ q.energy sg < wall := by
  intro t q
  have hy : classYamabeFour o.dimension_eq q.metric = classYamabeFour o.dimension_eq (flat t).metric :=
    (classYamabeFour_pullback _ _ _ (φ t)).trans (classYamabeFour_conformalCore _ _ _)
  refine ⟨hy.symm ▸ hPos t, fun sg => ?_⟩
  have en : q.energy sg = (flat t).energy .plus := by
    dsimp [q]
    rw [SignedCollarMetric.energy_pullback, ← SignedCollarMetric.charge_univ,
      SignedCollarMetric.charge_conformal, SignedCollarMetric.charge_univ]
    cases sg with
    | plus => rfl
    | minus => exact (flat t).signature_zero.symm
  exact ⟨en,en ▸ hBound t,en ▸ (hBound t).trans_lt hStrict⟩

omit [Nonempty N] [PathConnectedSpace N] in
/-- If the entire gained exterior charge is confined to a measured collar,
the selected incoming mass forces a density-volume product there. A small
raw strip on the incoming side alone gives no upper bound on this price. -/
theorem transportedDisk_outerStrip_price (g q : SignedCollarMetric o)
    (F : PartialDiffeomorph I₄ I E₄ N ∞) (hF : Metric.closedBall (0:E₄) 1 ⊆ F.source)
    (sg : CollarChirality) {A : Set N} (hA : MeasurableSet A)
    (hAV : A ⊆ (interior (selectedChartDisk F))ᶜ)
    (hOutside : q.charge sg ((interior (selectedChartDisk F))ᶜ \ A) =
      g.charge sg ((interior (selectedChartDisk F))ᶜ \ A))
    (hZero : q.charge sg (selectedChartDisk F) = 0) {η D : ℝ}
    (hSlack : g.energy .plus - η ≤ q.energy .plus)
    (hDensity : ∀ x ∈ A, hilbertSchmidtSq (signedCollarWeylBlock o q.metric q.frame sg x) ≤ D) :
    g.charge sg (selectedChartDisk F) - η + g.charge sg A ≤
      D * (riemannianVolumeMeasure I N q.metric).real A := by
  let V := (interior (selectedChartDisk F))ᶜ
  have split (p : SignedCollarMetric o) : p.charge sg A + p.charge sg (V \ A) = p.charge sg V :=
    by
      have hUnion : A ∪ V = V := Set.union_eq_right.mpr hAV
      exact (measureReal_add_sdiff (μ := p.chiralMeasure sg) (s := A) (t := V) hA).trans
        (congrArg (fun S => (p.chiralMeasure sg).real S) hUnion)
  have hv (p : SignedCollarMetric o) : p.charge sg V =
      p.energy .plus - p.charge sg (selectedChartDisk F) := signedCharge_fullMarkedExterior p sg F hF
  change q.charge sg (V \ A) = g.charge sg (V \ A) at hOutside
  have h := signedCharge_le_density_mul_volume q sg hA hDensity
  linarith only [split q,split g,hv q,hv g,hOutside,hZero,hSlack,h]

omit [PathConnectedSpace N] in
/-- Price the new signed density in the incoming volume gauge on a compact
physical strip. The volume-ratio bound is measured on this same strip. -/
theorem transportedDisk_incomingGauge_price (g q : SignedCollarMetric o)
    (F : PartialDiffeomorph I₄ I E₄ N ∞) (hF : Metric.closedBall (0:E₄) 1 ⊆ F.source)
    (sg : CollarChirality) {A : Set N} (hA : IsCompact A)
    (hAV : A ⊆ (interior (selectedChartDisk F))ᶜ)
    (hOutside : q.charge sg ((interior (selectedChartDisk F))ᶜ \ A) =
      g.charge sg ((interior (selectedChartDisk F))ᶜ \ A))
    (hZero : q.charge sg (selectedChartDisk F) = 0) {η D L : ℝ}
    (hSlack : g.energy .plus - η ≤ q.energy .plus) (hD : 0 ≤ D) (hL : 0 ≤ L)
    (hDensity : ∀ x ∈ A, hilbertSchmidtSq (signedCollarWeylBlock o q.metric q.frame sg x) ≤ D)
    (hRatio : ∀ x ∈ A, riemannianVolumeDensity g.metric q.metric x ≤ L) :
    g.charge sg (selectedChartDisk F) - η + g.charge sg A ≤
      D * (L * (riemannianVolumeMeasure I N g.metric).real A) :=
  (transportedDisk_outerStrip_price g q F hF sg hA.measurableSet hAV hOutside hZero
    hSlack hDensity).trans (mul_le_mul_of_nonneg_left
      (physicalVolumeReal_le_of_density g.metric q.metric hA hL hRatio) hD)

omit [PathConnectedSpace N] in
/-- A complete positive exterior cap and a near-minimal joined endpoint
force a finite loss on any charged core retained inside the original disk.
The cap surcharge includes every added piece. -/
theorem transportedDisk_protectedCore_loss (g q cap : SignedCollarMetric o)
    (F : PartialDiffeomorph I₄ I E₄ N ∞) (hF : Metric.closedBall (0:E₄) 1 ⊆ F.source)
    (sg : CollarChirality) {K : Set N} (hK : K ⊆ selectedChartDisk F) {η j δ : ℝ}
    (hp : 0 < classYamabeFour o.dimension_eq cap.metric)
    (hPeak : q.energy .plus ≤ g.energy .plus + η)
    (hCap : cap.energy sg ≤ q.charge sg (interior (selectedChartDisk F))ᶜ + j)
    (hRetain : g.charge sg K - δ ≤ q.charge sg K) :
    g.charge sg K - (g.energy .plus - sInf (geometricPositiveEnergies o)) ≤ δ + η + j := by
  have hI := csInf_le (geometricPositiveEnergies_bddBelow o) (cap.energy_mem_of_positive hp)
  have hSign : cap.energy .plus = cap.energy sg := by
    cases sg with
    | plus => rfl
    | minus => exact cap.signature_zero
  have hSub : q.charge sg K ≤ q.charge sg (selectedChartDisk F) := measureReal_mono hK
  rw [signedCharge_fullMarkedExterior q sg F hF] at hCap
  linarith only [hI, hSign, hPeak, hCap, hRetain, hSub]

end SmoothPoincare
