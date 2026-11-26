import SmoothPoincare.Variational.ChargedCorePayment
import SmoothPoincare.Variational.YamabeWall
import Mathlib.Analysis.SpecialFunctions.SmoothTransition

/-! # Isolating a coupled path on a complete original marked disk -/

open DifferentialGeometry DifferentialGeometry.Integral.Measure
open Filter FirstOrderTwistor MeasureTheory Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

private theorem firstCoupledWall {f wall : ℝ} {energy : ℝ → ℝ}
    (hContinuous : ContinuousOn energy (Icc (0 : ℝ) 1))
    (hStart : energy 0 < wall) (hf : f ∈ Icc (0 : ℝ) 1) (hCross : wall ≤ energy f) :
    ∃ t ∈ Ioc (0 : ℝ) 1, energy t = wall ∧ ∀ u ∈ Ico (0 : ℝ) t, energy u < wall := by
  let S := Icc (0 : ℝ) 1 ∩ energy ⁻¹' {wall}
  have hClosed : IsClosed S :=
    hContinuous.preimage_isClosed_of_isClosed isClosed_Icc isClosed_singleton
  have hContinuous' : ContinuousOn energy (Icc (0 : ℝ) f) :=
    hContinuous.mono (Icc_subset_Icc_right hf.2)
  obtain ⟨z, hz, hzWall⟩ := intermediate_value_Icc hf.1 hContinuous' ⟨hStart.le, hCross⟩
  have hS : S.Nonempty := ⟨z, Icc_subset_Icc_right hf.2 hz, hzWall⟩
  have hCompact : IsCompact S :=
    (isCompact_Icc : IsCompact (Icc (0 : ℝ) 1)).of_isClosed_subset hClosed inter_subset_left
  obtain ⟨t, ht, hMin⟩ := hCompact.exists_isMinOn hS continuous_id.continuousOn
  have ht0 : 0 < t := by
    refine lt_of_le_of_ne ht.1.1 ?_
    rintro rfl
    exact hStart.ne ht.2
  refine ⟨t, ⟨ht0, ht.1.2⟩, ht.2, ?_⟩
  intro u hu
  by_contra! hLarge
  have hu1 : u ≤ 1 := hu.2.le.trans ht.1.2
  obtain ⟨v, hv, hvWall⟩ :=
    intermediate_value_Icc hu.1 (hContinuous.mono (Icc_subset_Icc_right hu1)) ⟨hStart.le, hLarge⟩
  exact (not_le_of_gt (hv.2.trans_lt hu.2)) (hMin ⟨Icc_subset_Icc_right hu1 hv, hvWall⟩)

private theorem keepsPositiveBeforeWall {level energy : ℝ → ℝ} {wall t : ℝ}
    (ht : t ∈ Icc (0 : ℝ) 1) (hContinuous : ContinuousOn level (Icc (0 : ℝ) 1))
    (hStart : 0 < level 0) (hZero : ∀ u ∈ Icc (0 : ℝ) 1, level u = 0 → wall ≤ energy u)
    (hBand : ∀ u ∈ Icc (0 : ℝ) t, energy u < wall) :
    0 < level t := by
  by_contra! h
  obtain ⟨u, hu, hu0⟩ :=
    intermediate_value_Icc' ht.1 (hContinuous.mono (Icc_subset_Icc_right ht.2)) ⟨h, hStart.le⟩
  exact (hBand u hu).not_ge (hZero u (Icc_subset_Icc_right ht.2 hu) hu0)

private theorem lowerAtFirstWall {energy : ℝ → ℝ} {t bound : ℝ}
    (ht : t ∈ Ioc (0 : ℝ) 1) (hContinuous : ContinuousOn energy (Icc (0 : ℝ) 1))
    (hBefore : ∀ u ∈ Ico (0 : ℝ) t, bound ≤ energy u) : bound ≤ energy t := by
  let S := Icc (0 : ℝ) 1 ∩ energy ⁻¹' Ici bound
  have hClosed : IsClosed S := hContinuous.preimage_isClosed_of_isClosed isClosed_Icc isClosed_Ici
  have hSub : Ico (0 : ℝ) t ⊆ S := fun u hu => ⟨⟨hu.1, hu.2.le.trans ht.2⟩, hBefore u hu⟩
  have htCl : t ∈ closure (Ico (0 : ℝ) t) := by
    rw [closure_Ico ht.1.ne]
    exact right_mem_Icc.mpr ht.1.le
  exact (closure_minimal hSub hClosed htCl).2

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [CompactSpace M] [Nonempty M]
  {o : ManifoldOrientation I M 4}

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- The full disk-side collar up to the original face, including the
locally constant outer part. Here the defining function coincides with
the native signed normal arclength on the actual comparison strip. -/
def isolatedFullInwardCollar (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (height : C^∞⟮I, M; ℝ⟯) (width : ℝ) : Set M :=
  selectedChartDisk F ∩ height ⁻¹' Ici (-width)

/-- The varying part occupies the middle third of the selected width. -/
noncomputable def isolatedCollarCutoff
    (height : C^∞⟮I, M; ℝ⟯) (width : ℝ) : C^∞⟮I, M; ℝ⟯ :=
  ⟨fun x => Real.smoothTransition (2 + 3 * height x / width), by
    apply Real.smoothTransition.contDiff.contMDiff.comp
    exact contMDiff_const.add ((contMDiff_const.mul height.contMDiff).div_const width)⟩

omit [I.Boundaryless] [IsManifold I ∞ M] [T2Space M] [CompactSpace M] [Nonempty M] in
theorem isolatedCollarCutoff_mem_Icc
    (height : C^∞⟮I, M; ℝ⟯) (width : ℝ) (x : M) :
    isolatedCollarCutoff height width x ∈ Icc (0 : ℝ) 1 :=
  ⟨Real.smoothTransition.nonneg _, Real.smoothTransition.le_one _⟩

/-- Each isolated metric is an actual smooth convex interpolation. The
same cutoff is applied to the two complementary coefficients. -/
noncomputable def isolatedInteriorMetric (g h : SmoothRiemannianMetric I M)
    (height : C^∞⟮I, M; ℝ⟯) (width : ℝ) : SmoothRiemannianMetric I M :=
  g.convexComb h (isolatedCollarCutoff height width) (isolatedCollarCutoff height width).contMDiff
    (isolatedCollarCutoff_mem_Icc height width)

noncomputable def isolatedExteriorMetric (g h : SmoothRiemannianMetric I M)
    (height : C^∞⟮I, M; ℝ⟯) (width : ℝ) : SmoothRiemannianMetric I M :=
  h.convexComb g (isolatedCollarCutoff height width) (isolatedCollarCutoff height width).contMDiff
    (isolatedCollarCutoff_mem_Icc height width)

omit [I.Boundaryless] [IsManifold I ∞ M] [T2Space M] [CompactSpace M] [Nonempty M] in
private theorem isolatedCollarCutoff_eventually_zero
    (height : C^∞⟮I, M; ℝ⟯) {width : ℝ} (hw : 0 < width) {x : M} (hx : height x < -width) :
    ∀ᶠ y in 𝓝 x, isolatedCollarCutoff height width y = 0 := by
  filter_upwards [height.contMDiff.continuous.continuousAt.eventually (gt_mem_nhds hx)] with y hy
  apply Real.smoothTransition.zero_of_nonpos
  have h : 3 * height y / width ≤ -3 := (div_le_iff₀ hw).mpr (by linarith only [hy])
  linarith only [h]

omit [I.Boundaryless] [IsManifold I ∞ M] [T2Space M] [CompactSpace M] [Nonempty M] in
private theorem isolatedCollarCutoff_eventually_one
    (height : C^∞⟮I, M; ℝ⟯) {width : ℝ} (hw : 0 < width) {x : M} (hx : 0 ≤ height x) :
    ∀ᶠ y in 𝓝 x, isolatedCollarCutoff height width y = 1 := by
  have hx' : -width / 3 < height x := by linarith only [hw, hx]
  filter_upwards [height.contMDiff.continuous.continuousAt.eventually (lt_mem_nhds hx')] with y hy
  apply Real.smoothTransition.one_of_one_le
  have h : -1 ≤ 3 * height y / width := (le_div_iff₀ hw).mpr (by linarith only [hy])
  linarith only [h]

omit [Nonempty M] in
private theorem partition_of_fullInwardCollar (g : SignedCollarMetric o)
    (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (hF : Metric.closedBall (0 : E₄) 1 ⊆ F.source) {A : Set M} (hA : MeasurableSet A)
    (hAD : A ⊆ selectedChartDisk F) (sign : CollarChirality) :
    g.charge sign (selectedChartDisk F \ A) + g.charge sign A +
      g.charge sign (interior (selectedChartDisk F))ᶜ = g.energy .plus := by
  have hDiff := measureReal_sdiff (μ := g.chiralMeasure sign) hAD hA
  have hE := signedCharge_fullMarkedExterior g sign F hF
  change g.charge sign (selectedChartDisk F \ A) =
    g.charge sign (selectedChartDisk F) - g.charge sign A at hDiff
  linarith only [hDiff, hE]

/-- Four physical agreements off the single connector. Both complements
use their own signed volume and full curvature integrands. -/
structure SignedCoupledIsolation
    (source : SignedCollarMetric o) (F : PartialDiffeomorph I₄ I E₄ M ∞) (A : Set M)
    (joined interiorPath exteriorPath : ℝ → SignedCollarMetric o) : Prop where
  disk_in_source : Metric.closedBall (0 : E₄) 1 ⊆ F.source
  collar_measurable : MeasurableSet A
  collar_in_disk : A ⊆ selectedChartDisk F
  interior_deep : ∀ t sign, (interiorPath t).charge sign (selectedChartDisk F \ A) =
    (joined t).charge sign (selectedChartDisk F \ A)
  exterior_deep : ∀ t sign, (exteriorPath t).charge sign (selectedChartDisk F \ A) =
    source.charge sign (selectedChartDisk F \ A)
  interior_exterior : ∀ t sign, (interiorPath t).charge sign (interior (selectedChartDisk F))ᶜ =
    source.charge sign (interior (selectedChartDisk F))ᶜ
  exterior_exterior : ∀ t sign, (exteriorPath t).charge sign (interior (selectedChartDisk F))ᶜ =
    (joined t).charge sign (interior (selectedChartDisk F))ᶜ

omit [I.Boundaryless] [Nonempty M] in
/-- The two genuine affine isolations supply the physical agreements. The
signed frames are matched separately on the deep disk and the full exterior. -/
theorem signedCoupledIsolation_of_nativeCutoff
    (g : SignedCollarMetric o) (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (hF : Metric.closedBall (0 : E₄) 1 ⊆ F.source)
    (height : C^∞⟮I, M; ℝ⟯) {width : ℝ} (hw : 0 < width)
    (hHeight : ∀ x ∈ (interior (selectedChartDisk F))ᶜ, 0 ≤ height x)
    (h p q : ℝ → SignedCollarMetric o)
    (hp : ∀ t, (p t).metric = isolatedInteriorMetric g.metric (h t).metric height width)
    (hq : ∀ t, (q t).metric = isolatedExteriorMetric g.metric (h t).metric height width)
    (hFrameDeep : ∀ t x, x ∈ selectedChartDisk F \ isolatedFullInwardCollar F height width →
      ((p t).frame x).basis = ((h t).frame x).basis ∧ ((q t).frame x).basis = (g.frame x).basis)
    (hFrameExterior : ∀ t x, x ∈ (interior (selectedChartDisk F))ᶜ →
      ((p t).frame x).basis = (g.frame x).basis ∧ ((q t).frame x).basis = ((h t).frame x).basis) :
    SignedCoupledIsolation g F (isolatedFullInwardCollar F height width) h p q := by
  let D := selectedChartDisk F
  let A := isolatedFullInwardCollar F height width
  let V := (interior D)ᶜ
  have hD : MeasurableSet D := (isCompact_selectedChartDisk F hF).isClosed.measurableSet
  have hA : MeasurableSet A := hD.inter (height.contMDiff.continuous.measurable measurableSet_Ici)
  have hV : MeasurableSet V := isOpen_interior.measurableSet.compl
  have hDeep {x : M} (hx : x ∈ D \ A) : height x < -width :=
    lt_of_not_ge fun ht => hx.2 ⟨hx.1, ht⟩
  refine ⟨hF, hA, inter_subset_left, ?_, ?_, ?_, ?_⟩
  · intro t sign
    apply selectedReference_charge_eq_of_germ _ _ (hD.diff hA) _ _ sign
    · intro x hx
      filter_upwards [isolatedCollarCutoff_eventually_zero height hw (hDeep hx)] with y hy u v
      rw [hp t, isolatedInteriorMetric, convexComb_inner, hy]
      simp
    · exact fun x hx => (hFrameDeep t x hx).1
  · intro t sign
    apply selectedReference_charge_eq_of_germ _ _ (hD.diff hA) _ _ sign
    · intro x hx
      filter_upwards [isolatedCollarCutoff_eventually_zero height hw (hDeep hx)] with y hy u v
      rw [hq t, isolatedExteriorMetric, convexComb_inner, hy]
      simp
    · exact fun x hx => (hFrameDeep t x hx).2
  · intro t sign
    apply selectedReference_charge_eq_of_germ _ _ hV _ _ sign
    · intro x hx
      filter_upwards [isolatedCollarCutoff_eventually_one height hw (hHeight x hx)] with y hy u v
      rw [hp t, isolatedInteriorMetric, convexComb_inner, hy]
      simp
    · exact fun x hx => (hFrameExterior t x hx).1
  · intro t sign
    apply selectedReference_charge_eq_of_germ _ _ hV _ _ sign
    · intro x hx
      filter_upwards [isolatedCollarCutoff_eventually_one height hw (hHeight x hx)] with y hy u v
      rw [hq t, isolatedExteriorMetric, convexComb_inner, hy]
      simp
    · exact fun x hx => (hFrameExterior t x hx).2

/-- Required analytic properties of the actual isolated path. The scalar
flat energy wall is at twice the inclusive recognition threshold. -/
structure IsolatedYamabeWall (g : SignedCollarMetric o) (path : ℝ → SignedCollarMetric o) where
  starts : path 0 = g
  energy_continuous : ContinuousOn (fun t => (path t).energy .plus) (Icc (0 : ℝ) 1)
  detector : ℝ → ℝ
  detector_continuous : ContinuousOn detector (Icc (0 : ℝ) 1)
  positive_iff : ∀ t ∈ Icc (0 : ℝ) 1,
    0 < detector t ↔ 0 < classYamabeFour o.dimension_eq (path t).metric
  wall_at_zero : ∀ t ∈ Icc (0 : ℝ) 1, detector t = 0 →
    2 * (4 * Real.pi ^ 2) ≤ (path t).energy .plus

private theorem IsolatedYamabeWall.positive_of_band
    {g : SignedCollarMetric o} {path : ℝ → SignedCollarMetric o} (wall : IsolatedYamabeWall g path)
    (hg : 0 < classYamabeFour o.dimension_eq g.metric) {t : ℝ} (ht : t ∈ Icc (0 : ℝ) 1)
    (hBand : ∀ u ∈ Icc (0 : ℝ) t, (path u).energy .plus < 2 * (4 * Real.pi ^ 2)) :
    0 < classYamabeFour o.dimension_eq (path t).metric := by
  have hStart := (wall.positive_iff 0 (by simp)).mpr (by simpa only [wall.starts] using hg)
  exact (wall.positive_iff t ht).mp (keepsPositiveBeforeWall ht wall.detector_continuous
    hStart wall.wall_at_zero hBand)

/-- The four-term interaction on the same physical connector. -/
noncomputable def isolationInteraction
    (g h p q : SignedCollarMetric o) (A : Set M) (sign : CollarChirality) : ℝ :=
  p.charge sign A + q.charge sign A - h.charge sign A - g.charge sign A

/-- The additional connector energy in the isolated interior. -/
noncomputable def isolationInteriorRemainder
    (h p : SignedCollarMetric o) (A : Set M) (sign : CollarChirality) : ℝ :=
  p.charge sign A - h.charge sign A

namespace SignedCoupledIsolation

variable {g : SignedCollarMetric o} {F : PartialDiffeomorph I₄ I E₄ M ∞} {A : Set M}
  {h p q : ℝ → SignedCollarMetric o} (data : SignedCoupledIsolation g F A h p q)

include data

omit [Nonempty M] in
theorem interaction_eq (t : ℝ) (sign : CollarChirality) :
    (p t).energy .plus + (q t).energy .plus =
    g.energy .plus + (h t).energy .plus + isolationInteraction g (h t) (p t) (q t) A sign := by
  have split (u : SignedCollarMetric o) :=
    partition_of_fullInwardCollar u F data.disk_in_source data.collar_measurable data.collar_in_disk sign
  unfold isolationInteraction
  linarith only [split g, split (h t), split (p t), split (q t), data.interior_deep t sign,
    data.exterior_deep t sign, data.interior_exterior t sign, data.exterior_exterior t sign]

omit [Nonempty M] in
theorem interaction_signature (t : ℝ) :
    isolationInteraction g (h t) (p t) (q t) A .plus =
      isolationInteraction g (h t) (p t) (q t) A .minus := by
  linarith only [data.interaction_eq t .plus, data.interaction_eq t .minus]

omit [Nonempty M] in
theorem interiorEnergy_eq (t : ℝ) (sign : CollarChirality) :
    (p t).energy .plus = g.energy .plus - g.charge sign (selectedChartDisk F) +
      (h t).charge sign (selectedChartDisk F) + isolationInteriorRemainder (h t) (p t) A sign := by
  have hp := partition_of_fullInwardCollar (p t) F data.disk_in_source
    data.collar_measurable data.collar_in_disk sign
  have hg := signedCharge_fullMarkedExterior g sign F data.disk_in_source
  have hh := measureReal_sdiff (μ := (h t).chiralMeasure sign) data.collar_in_disk data.collar_measurable
  change (h t).charge sign (selectedChartDisk F \ A) =
    (h t).charge sign (selectedChartDisk F) - (h t).charge sign A at hh
  unfold isolationInteriorRemainder
  linarith only [hp, hg, hh, data.interior_deep t sign, data.interior_exterior t sign]

/-- The positive capped metric is already on the original oriented type.
Only its exterior is compared to the joined endpoint. The entire installed
cap charge comes from that actual metric's disk, in the same marking. -/
theorem cap_exterior_drift (cap : SignedCollarMetric o)
    (hCap : 0 < classYamabeFour o.dimension_eq cap.metric)
    (hExterior : ∀ sign, cap.charge sign (interior (selectedChartDisk F))ᶜ =
      (h 1).charge sign (interior (selectedChartDisk F))ᶜ)
    (sign : CollarChirality) :
    g.charge sign (selectedChartDisk F) -
        (g.energy .plus - sInf (geometricPositiveEnergies o)) - cap.charge sign (selectedChartDisk F) ≤
      (h 1).charge sign (interior (selectedChartDisk F))ᶜ -
        g.charge sign (interior (selectedChartDisk F))ᶜ := by
  have hLower := csInf_le (geometricPositiveEnergies_bddBelow o) (cap.energy_mem_of_positive hCap)
  have hp := signedCharge_fullMarkedExterior cap sign F data.disk_in_source
  have hg := signedCharge_fullMarkedExterior g sign F data.disk_in_source
  linarith only [hLower, hp, hg, hExterior sign]

omit [Nonempty M] in
/-- On a fixed complete exterior, the signed imbalance of the installed
cap equals the joined disk's signed imbalance at that endpoint. -/
theorem cap_disk_signature (cap : SignedCollarMetric o)
    (hExterior : ∀ sign, cap.charge sign (interior (selectedChartDisk F))ᶜ =
      (h 1).charge sign (interior (selectedChartDisk F))ᶜ) :
    cap.charge .plus (selectedChartDisk F) - cap.charge .minus (selectedChartDisk F) =
      (h 1).charge .plus (selectedChartDisk F) - (h 1).charge .minus (selectedChartDisk F) := by
  have split (u : SignedCollarMetric o) (sign : CollarChirality) :=
    signedCharge_fullMarkedExterior u sign F data.disk_in_source
  linarith only [split cap .plus, split cap .minus, split (h 1) .plus, split (h 1) .minus,
    hExterior .plus, hExterior .minus]

/-- The protected core gives an independent endpoint lower bound after
charging the installed cap. The core stays on the deep side at this width. -/
theorem endpoint_energy_leavingProtectedCore (cap : SignedCollarMetric o)
    (hCap : 0 < classYamabeFour o.dimension_eq cap.metric)
    (hExterior : ∀ sign, cap.charge sign (interior (selectedChartDisk F))ᶜ =
      (h 1).charge sign (interior (selectedChartDisk F))ᶜ)
    {K : Set M} (hK : K ⊆ selectedChartDisk F \ A)
    (hFixed : ∀ sign, (h 1).charge sign K = g.charge sign K) (sign : CollarChirality) :
    sInf (geometricPositiveEnergies o) + g.charge sign K - cap.charge sign (selectedChartDisk F) ≤
      (h 1).energy .plus := by
  have hLower := csInf_le (geometricPositiveEnergies_bddBelow o) (cap.energy_mem_of_positive hCap)
  have hp := signedCharge_fullMarkedExterior cap sign F data.disk_in_source
  have hh := signedCharge_fullMarkedExterior (h 1) sign F data.disk_in_source
  have hCore : (h 1).charge sign K ≤ (h 1).charge sign (selectedChartDisk F) := measureReal_mono
    (hK.trans sdiff_subset)
  linarith only [hLower, hp, hh, hExterior sign, hFixed sign, hCore]

/-- An exact finite ledger. The energy of the complete installed cap and the
actual isolated endpoint excess both appear. -/
theorem endpointRemainder_eq (cap : SignedCollarMetric o)
    (hExterior : ∀ sign, cap.charge sign (interior (selectedChartDisk F))ᶜ =
      (h 1).charge sign (interior (selectedChartDisk F))ᶜ)
    (sign : CollarChirality) :
    isolationInteriorRemainder (h 1) (p 1) A sign =
      g.charge sign (selectedChartDisk F) + cap.energy .plus - (h 1).energy .plus -
      (g.energy .plus - sInf (geometricPositiveEnergies o)) -
      cap.charge sign (selectedChartDisk F) + ((p 1).energy .plus - sInf (geometricPositiveEnergies o)) := by
  have hp := data.interiorEnergy_eq 1 sign
  have hh := signedCharge_fullMarkedExterior (h 1) sign F data.disk_in_source
  have hc := signedCharge_fullMarkedExterior cap sign F data.disk_in_source
  linarith only [hp, hh, hc, hExterior sign]

/-- If the actual isolated paths stay below the scalar-flat wall, the
positive installed cap forces the isolated-interior connector cost at the
endpoint. Otherwise the exact four-term interaction reaches its finite
lower bound at the first wall hit. Both signs share this same event. -/
theorem firstWall_or_endpointCost (cap : SignedCollarMetric o)
    (hCap : 0 < classYamabeFour o.dimension_eq cap.metric)
    (hExterior : ∀ sign, cap.charge sign (interior (selectedChartDisk F))ᶜ =
      (h 1).charge sign (interior (selectedChartDisk F))ᶜ)
    (pWall : IsolatedYamabeWall g p) (qWall : IsolatedYamabeWall g q)
    (hg : 0 < classYamabeFour o.dimension_eq g.metric)
    (he : g.energy .plus < 2 * (4 * Real.pi ^ 2))
    {Hpeak : ℝ} (hPeak : ∀ t ∈ Icc (0 : ℝ) 1, (h t).energy .plus ≤ Hpeak) :
    ((∀ t ∈ Icc (0 : ℝ) 1,
        max ((p t).energy .plus) ((q t).energy .plus) < 2 * (4 * Real.pi ^ 2) ∧
        0 < classYamabeFour o.dimension_eq (p t).metric ∧
        0 < classYamabeFour o.dimension_eq (q t).metric) ∧
       (∀ sign, g.charge sign (selectedChartDisk F) + sInf (geometricPositiveEnergies o) -
          (h 1).energy .plus - (g.energy .plus - sInf (geometricPositiveEnergies o)) -
          cap.charge sign (selectedChartDisk F) ≤ isolationInteriorRemainder (h 1) (p 1) A sign ∧
        g.charge sign (selectedChartDisk F) + cap.energy .plus - (h 1).energy .plus -
          (g.energy .plus - sInf (geometricPositiveEnergies o)) -
          cap.charge sign (selectedChartDisk F) ≤ isolationInteriorRemainder (h 1) (p 1) A sign)) ∨
    (∃ t ∈ Ioc (0 : ℝ) 1,
      max ((p t).energy .plus) ((q t).energy .plus) = 2 * (4 * Real.pi ^ 2) ∧
      (∀ u ∈ Ico (0 : ℝ) t,
        max ((p u).energy .plus) ((q u).energy .plus) < 2 * (4 * Real.pi ^ 2) ∧
        0 < classYamabeFour o.dimension_eq (p u).metric ∧
        0 < classYamabeFour o.dimension_eq (q u).metric) ∧
      (∀ sign,
        isolationInteraction g (h t) (p t) (q t) A sign =
          2 * (4 * Real.pi ^ 2) + min ((p t).energy .plus) ((q t).energy .plus) -
            g.energy .plus - (h t).energy .plus ∧
        2 * (4 * Real.pi ^ 2) - (g.energy .plus - sInf (geometricPositiveEnergies o)) - Hpeak ≤
          isolationInteraction g (h t) (p t) (q t) A sign)) := by
  let wall := 2 * (4 * Real.pi ^ 2)
  let E := fun t => max ((p t).energy .plus) ((q t).energy .plus)
  have hE : ContinuousOn E (Icc (0 : ℝ) 1) :=
    pWall.energy_continuous.sup qWall.energy_continuous
  have hStart : E 0 < wall := by simpa only [E, pWall.starts, qWall.starts, max_self, wall] using he
  have positive {t : ℝ} (ht : t ∈ Icc (0 : ℝ) 1) (hsub : ∀ u ∈ Icc (0 : ℝ) t, E u < wall) :
      0 < classYamabeFour o.dimension_eq (p t).metric ∧
        0 < classYamabeFour o.dimension_eq (q t).metric :=
    ⟨pWall.positive_of_band hg ht (fun u hu => (le_max_left _ _).trans_lt (hsub u hu)),
      qWall.positive_of_band hg ht (fun u hu => (le_max_right _ _).trans_lt (hsub u hu))⟩
  by_cases hCross : ∃ f ∈ Icc (0 : ℝ) 1, wall ≤ E f
  · obtain ⟨f, hf, hLarge⟩ := hCross
    obtain ⟨t, ht, hHit, hBefore⟩ := firstCoupledWall hE hStart hf hLarge
    have hPosBefore (u : ℝ) (hu : u ∈ Ico (0 : ℝ) t) :=
      positive ⟨hu.1, hu.2.le.trans ht.2⟩ (fun v hv => hBefore v ⟨hv.1, hv.2.trans_lt hu.2⟩)
    have hInfP := lowerAtFirstWall ht pWall.energy_continuous fun u hu =>
      csInf_le (geometricPositiveEnergies_bddBelow o) ((p u).energy_mem_of_positive (hPosBefore u hu).1)
    have hInfQ := lowerAtFirstWall ht qWall.energy_continuous fun u hu =>
      csInf_le (geometricPositiveEnergies_bddBelow o) ((q u).energy_mem_of_positive (hPosBefore u hu).2)
    have hSmall := le_min hInfP hInfQ
    have hSum := max_add_min ((p t).energy .plus) ((q t).energy .plus)
    change E t + min ((p t).energy .plus) ((q t).energy .plus) = _ at hSum
    rw [hHit] at hSum
    refine Or.inr ⟨t, ht, hHit, (fun u hu => ⟨hBefore u hu, hPosBefore u hu⟩), fun sign => ⟨?_, ?_⟩⟩
    · exact (by linarith only [data.interaction_eq t sign, hSum] :
        isolationInteraction g (h t) (p t) (q t) A sign =
          wall + min ((p t).energy .plus) ((q t).energy .plus) - g.energy .plus - (h t).energy .plus)
    · have hTop := hPeak t ⟨ht.1.le, ht.2⟩
      change wall - _ - _ ≤ _
      linarith only [data.interaction_eq t sign, hSum, hSmall, hTop]
  · have hBelow (t : ℝ) (ht : t ∈ Icc (0 : ℝ) 1) : E t < wall :=
      lt_of_not_ge fun hLarge => hCross ⟨t, ht, hLarge⟩
    have hPos (t : ℝ) (ht : t ∈ Icc (0 : ℝ) 1) :
        0 < classYamabeFour o.dimension_eq (p t).metric ∧
          0 < classYamabeFour o.dimension_eq (q t).metric :=
      positive ht fun u hu => hBelow u ⟨hu.1, hu.2.trans ht.2⟩
    refine Or.inl ⟨(fun t ht => ⟨hBelow t ht, hPos t ht⟩), fun sign => ?_⟩
    have hInf := csInf_le (geometricPositiveEnergies_bddBelow o)
      ((p 1).energy_mem_of_positive (hPos 1 (by simp)).1)
    have hCapInf := csInf_le (geometricPositiveEnergies_bddBelow o) (cap.energy_mem_of_positive hCap)
    constructor <;> linarith only [data.endpointRemainder_eq cap hExterior sign, hInf, hCapInf]

/-- Separate upper allowances for the two installed connectors suffice for
the finite obstruction in a single measured sign. The incoming and joined
connector energies remain in the comparisons. -/
theorem excludesCheapIsolatedConnectors (cap : SignedCollarMetric o)
    (hCap : 0 < classYamabeFour o.dimension_eq cap.metric)
    (hExterior : ∀ sign, cap.charge sign (interior (selectedChartDisk F))ᶜ =
      (h 1).charge sign (interior (selectedChartDisk F))ᶜ)
    (pWall : IsolatedYamabeWall g p) (qWall : IsolatedYamabeWall g q)
    (hg : 0 < classYamabeFour o.dimension_eq g.metric)
    (he : g.energy .plus < 2 * (4 * Real.pi ^ 2))
    {Hpeak : ℝ} (hPeak : ∀ t ∈ Icc (0 : ℝ) 1, (h t).energy .plus ≤ Hpeak)
    (sign : CollarChirality) (insideAllowance outsideAllowance : ℝ → ℝ)
    (hInside : ∀ t ∈ Icc (0 : ℝ) 1, (p t).charge sign A ≤ insideAllowance t)
    (hOutside : ∀ t ∈ Icc (0 : ℝ) 1, (q t).charge sign A ≤ outsideAllowance t)
    (hJointFit : ∀ t ∈ Icc (0 : ℝ) 1,
      insideAllowance t + outsideAllowance t - (h t).charge sign A - g.charge sign A <
        2 * (4 * Real.pi ^ 2) - (g.energy .plus - sInf (geometricPositiveEnergies o)) - Hpeak)
    (hEndpointFit : insideAllowance 1 - (h 1).charge sign A <
      g.charge sign (selectedChartDisk F) + cap.energy .plus - (h 1).energy .plus -
        (g.energy .plus - sInf (geometricPositiveEnergies o)) - cap.charge sign (selectedChartDisk F)) :
    False := by
  rcases data.firstWall_or_endpointCost cap hCap hExterior pWall qWall hg he hPeak with
    ⟨_, hEnd⟩ | ⟨t, ht, _, _, hInteraction⟩
  · have h := (hEnd sign).2
    unfold isolationInteriorRemainder at h
    linarith only [h, hInside 1 (by simp), hEndpointFit]
  · have ht' : t ∈ Icc (0 : ℝ) 1 := ⟨ht.1.le, ht.2⟩
    have h := (hInteraction sign).2
    unfold isolationInteraction at h
    linarith only [h, hInside t ht', hOutside t ht', hJointFit t ht']

end SignedCoupledIsolation

end SmoothPoincare
