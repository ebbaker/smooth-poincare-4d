import SmoothPoincare.Variational.FixedSourceMarkedCaps
import SmoothPoincare.Variational.RoundHemisphereMarkings
import SmoothPoincare.Variational.PositiveScalarYamabeFour
import SmoothPoincare.Variational.TransportedChargedDisk
import DifferentialGeometry.Topology.Manifold.CompactCutoff
import DifferentialGeometry.Topology.Manifold.StereographicChart

/-! # The actual two cap markings after transporting a selected disk -/

noncomputable section
open DifferentialGeometry DifferentialGeometry.Geometry Filter FirstOrderTwistor Manifold MeasureTheory Set
open scoped ContDiff Manifold Topology InnerProductSpace Pointwise

namespace SmoothPoincare

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)
local notation "S₄" => StandardFourSphere
local notation "V₅" => EuclideanSpace ℝ (Fin 5)
local instance : Fact (Module.finrank ℝ V₅ = 4 + 1) := ⟨by simp⟩
private local instance : Nonempty S₄ :=
  ((NormedSpace.sphere_nonempty (x := (0 : V₅)) (r := 1)).mpr zero_le_one).to_subtype

def transportedCapNorthPole : S₄ :=
  ⟨RoundEquatorialCaps.poleVector, by simp [RoundEquatorialCaps.poleVector]⟩

private theorem transportedCapNorthPole_height :
    RoundEquatorialCaps.height transportedCapNorthPole = 1 := by
  simp [RoundEquatorialCaps.height, transportedCapNorthPole, RoundEquatorialCaps.poleVector]

/-- The actual north-pole stereographic chart, with the library's radius-two
convention for the closed south hemisphere. -/
def transportedCapStereographic : PartialDiffeomorph I₄ I₄ S₄ E₄ ∞ where
  toPartialEquiv := (stereographic' 4 transportedCapNorthPole).toPartialEquiv
  open_source := (stereographic' 4 transportedCapNorthPole).open_source
  open_target := (stereographic' 4 transportedCapNorthPole).open_target
  contMDiffOn_toFun := (DifferentialGeometry.Topology.Manifold.stereographic_isLocalDiffeomorphOn
    transportedCapNorthPole).contMDiffOn
  contMDiffOn_invFun := (DifferentialGeometry.Topology.Manifold.stereographicInverse_isLocalDiffeomorph
    transportedCapNorthPole).contMDiff.contMDiffOn

theorem transportedCapStereographic_target : transportedCapStereographic.target = univ :=
  stereographic'_target transportedCapNorthPole

theorem transportedCapStereographic_source :
    transportedCapStereographic.source = {transportedCapNorthPole}ᶜ :=
  stereographic'_source transportedCapNorthPole

private theorem transportedCapStereographic_height_symm (x : E₄) :
    RoundEquatorialCaps.height (transportedCapStereographic.symm x) = (‖x‖ ^ 2 - 4) / (‖x‖ ^ 2 + 4) := by
  let n := transportedCapNorthPole
  let U : (ℝ ∙ (n : V₅))ᗮ ≃ₗᵢ[ℝ] E₄ :=
    (OrthonormalBasis.fromOrthogonalSpanSingleton 4 (ne_zero_of_mem_unit_sphere n)).repr
  have hOrth : ((U.symm x : (ℝ ∙ (n : V₅))ᗮ) : V₅) (Fin.last 4) = 0 := by
    have h := Submodule.mem_orthogonal_singleton_iff_inner_right.mp (U.symm x).property
    simpa [n, transportedCapNorthPole, RoundEquatorialCaps.poleVector, EuclideanSpace.inner_single_left] using h
  have hn : (n : V₅) (Fin.last 4) = 1 := transportedCapNorthPole_height
  change ((↑((stereographic' 4 n).symm x)) : V₅) (Fin.last 4) = _
  rw [stereographic'_symm_apply]
  change ((‖((U.symm x : _) : V₅)‖ ^ 2 + 4)⁻¹ • (4 : ℝ) • ((U.symm x : _) : V₅) +
    (‖((U.symm x : _) : V₅)‖ ^ 2 + 4)⁻¹ • (‖((U.symm x : _) : V₅)‖ ^ 2 - 4) • (n : V₅))
      (Fin.last 4) = _
  simp only [PiLp.add_apply, PiLp.smul_apply, smul_eq_mul, hOrth, hn, mul_zero,
    zero_add, mul_one, Submodule.norm_coe, LinearIsometryEquiv.norm_map]
  ring

theorem transportedCapStereographic_symm_mem_cap_iff (x : E₄) :
    transportedCapStereographic.symm x ∈ standardFourSphereCap ↔ x ∈ Metric.closedBall 0 2 := by
  change RoundEquatorialCaps.height (transportedCapStereographic.symm x) ≤ 0 ↔ _
  rw [transportedCapStereographic_height_symm, div_le_iff₀ (by positivity), zero_mul,
    Metric.mem_closedBall, dist_zero_right]
  constructor <;> intro h <;> nlinarith only [h, norm_nonneg x]

theorem transportedCapStereographic_cap_in_source :
    standardFourSphereCap ⊆ transportedCapStereographic.source := by
  rw [transportedCapStereographic_source]
  intro p hp
  have hp' : RoundEquatorialCaps.height p ≤ 0 := hp
  intro hn
  rw [mem_singleton_iff.mp hn, transportedCapNorthPole_height] at hp'
  norm_num at hp'

theorem transportedCapStereographic_image_cap :
    transportedCapStereographic '' standardFourSphereCap = Metric.closedBall 0 2 := by
  ext x
  constructor
  · rintro ⟨p, hp, rfl⟩
    apply (transportedCapStereographic_symm_mem_cap_iff _).mp
    rw [show transportedCapStereographic.symm (transportedCapStereographic p) = p from
      transportedCapStereographic.left_inv' (transportedCapStereographic_cap_in_source hp)]
    exact hp
  · intro hx
    refine ⟨transportedCapStereographic.symm x,
      (transportedCapStereographic_symm_mem_cap_iff x).mpr hx, ?_⟩
    exact transportedCapStereographic.right_inv' (by rw [transportedCapStereographic_target]; trivial)

/-- Rescale the stereographic chart so the cap maps onto its actual pocket. -/
def transportedCapPocketChart (b : ℝ) (hb : 0 < b) :
    PartialDiffeomorph I₄ I₄ S₄ E₄ ∞ :=
  transportedCapStereographic.trans
    (LinearEquiv.smulOfNeZero ℝ E₄ (b / 2) (div_ne_zero hb.ne' (by norm_num))).toContinuousLinearEquiv.toDiffeomorph.toPartialDiffeomorph

theorem transportedCapPocketChart_source (b : ℝ) (hb : 0 < b) :
    (transportedCapPocketChart b hb).source = transportedCapStereographic.source := by
  ext x
  change (x ∈ transportedCapStereographic.source ∧ transportedCapStereographic x ∈ (univ : Set E₄)) ↔ _
  simp

theorem transportedCapPocketChart_target (b : ℝ) (hb : 0 < b) :
    (transportedCapPocketChart b hb).target = univ := by
  ext x
  change (x ∈ (univ : Set E₄) ∧ _ ∈ transportedCapStereographic.target) ↔ x ∈ univ
  rw [transportedCapStereographic_target]
  simp

theorem transportedCapPocketChart_image_cap (b : ℝ) (hb : 0 < b) :
    transportedCapPocketChart b hb '' standardFourSphereCap = Metric.closedBall 0 b := by
  change (fun p => (b / 2) • transportedCapStereographic p) '' standardFourSphereCap = _
  rw [← image_image, transportedCapStereographic_image_cap]
  change (b / 2) • Metric.closedBall (0 : E₄) 2 = _
  rw [_root_.smul_closedBall _ _ (by norm_num : (0 : ℝ) ≤ 2), smul_zero, abs_of_pos (by positivity : 0 < b / 2)]
  ring_nf

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- The exterior is retained via the actual transport, with its flat pocket
installed from the standard ball marking followed by the original disk chart. -/
def transportedExteriorCore (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (hF : Metric.closedBall (0 : E₄) 1 ⊆ F.source)
    (φ : M ≃ₘ⟮I, I⟯ M) {b : ℝ} (hb : 0 < b) (hb1 : b ≤ 1)
    (hImage : φ '' selectedChartDisk F = F '' Metric.closedBall 0 b) :
    FixedMarkedCutCore I M I M where
  raw := (interior (selectedChartDisk F))ᶜ
  rawMeasurable := isOpen_interior.isClosed_compl.measurableSet
  core := φ.toPartialDiffeomorph
  marking := (transportedCapPocketChart b hb).trans F
  capInMarking := by
    intro p hp
    refine ⟨?_, ?_⟩
    · change p ∈ (transportedCapPocketChart b hb).source
      rw [transportedCapPocketChart_source]
      exact transportedCapStereographic_cap_in_source hp
    · change transportedCapPocketChart b hb p ∈ F.source
      apply hF (Metric.closedBall_subset_closedBall hb1 ?_)
      rw [← transportedCapPocketChart_image_cap b hb]
      exact mem_image_of_mem _ hp
  rawInCore := subset_univ _
  coreImage := by
    have hcap : ((transportedCapPocketChart b hb).trans F) '' standardFourSphereCap =
        F '' Metric.closedBall 0 b := by
      change (fun p => F (transportedCapPocketChart b hb p)) '' _ = _
      rw [← image_image, transportedCapPocketChart_image_cap]
    change φ.toHomeomorph '' (interior (selectedChartDisk F))ᶜ = _
    rw [hcap, φ.toHomeomorph.image_compl, φ.toHomeomorph.image_interior]
    exact congrArg (fun A => (interior A)ᶜ) hImage

/-- The retained disk is sent to the south hemisphere through the inverse
pocket chart. Its attached cap is the north hemisphere with the original
angular identification fixed by equatorial reflection. -/
def transportedDiskCore (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (hF : Metric.closedBall (0 : E₄) 1 ⊆ F.source)
    (φ : M ≃ₘ⟮I, I⟯ M) {b : ℝ} (hb : 0 < b) (hb1 : b ≤ 1)
    (hImage : φ '' selectedChartDisk F = F '' Metric.closedBall 0 b) :
    FixedMarkedCutCore I M I₄ S₄ where
  raw := selectedChartDisk F
  rawMeasurable := (isCompact_selectedChartDisk F hF).isClosed.measurableSet
  core := φ.toPartialDiffeomorph.trans (F.symm.trans (transportedCapPocketChart b hb).symm)
  marking := RoundEquatorialCaps.flip.toPartialDiffeomorph
  capInMarking := subset_univ _
  rawInCore := by
    intro x hx
    have hm : φ x ∈ F '' Metric.closedBall 0 b :=
      hImage ▸ (mem_image_of_mem φ hx)
    obtain ⟨y, hy, heq⟩ := hm
    have hyF : y ∈ F.source := hF (Metric.closedBall_subset_closedBall hb1 hy)
    refine ⟨mem_univ _, ?_, ?_⟩
    · change φ x ∈ F.target
      rw [← heq]
      exact F.map_source' hyF
    ·
      change F.symm (φ x) ∈ (transportedCapPocketChart b hb).target
      rw [transportedCapPocketChart_target]
      trivial
  coreImage := by
    have hPocketIn : Metric.closedBall (0 : E₄) b ⊆ F.source :=
      (Metric.closedBall_subset_closedBall hb1).trans hF
    have hInverse : F.symm '' (F '' Metric.closedBall 0 b) = Metric.closedBall 0 b := by
      rw [image_image, ← image_id (Metric.closedBall (0 : E₄) b)]
      exact image_congr (fun x hx => F.left_inv' (hPocketIn hx))
    have hBallInverse : (transportedCapPocketChart b hb).symm '' Metric.closedBall 0 b =
        standardFourSphereCap := by
      rw [← transportedCapPocketChart_image_cap b hb]
      rw [image_image, ← image_id standardFourSphereCap]
      refine image_congr (fun p hp => (transportedCapPocketChart b hb).left_inv' ?_)
      rw [transportedCapPocketChart_source]
      exact transportedCapStereographic_cap_in_source hp
    have hFull : (fun x => (transportedCapPocketChart b hb).symm (F.symm (φ x))) ''
        selectedChartDisk F = standardFourSphereCap := by
      calc
        _ = (transportedCapPocketChart b hb).symm '' (F.symm '' (φ '' selectedChartDisk F)) := by
          simp only [image_image]
        _ = _ := by rw [hImage, hInverse, hBallInverse]
    change (fun x => (transportedCapPocketChart b hb).symm (F.symm (φ x))) '' _ =
      (interior (RoundEquatorialCaps.flip '' standardFourSphereCap))ᶜ
    rw [hFull]
    have hSphere := RoundEquatorialCaps.southClosure.coreImage
    change id '' standardFourSphereCap = (interior (RoundEquatorialCaps.flip '' standardFourSphereCap))ᶜ at hSphere
    simpa only [image_id] using hSphere

/-- The original disk maps into the actual attached pocket. Its disk-side
cap coordinates are the exact inverse of that pocket's marking. -/
theorem transportedCaps_marking_inverse
    (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (hF : Metric.closedBall (0 : E₄) 1 ⊆ F.source)
    (φ : M ≃ₘ⟮I, I⟯ M) {b : ℝ} (hb : 0 < b) (hb1 : b ≤ 1)
    (hImage : φ '' selectedChartDisk F = F '' Metric.closedBall 0 b)
    {x : M} (hx : x ∈ selectedChartDisk F) :
    let exterior := transportedExteriorCore F hF φ hb hb1 hImage
    let disk := transportedDiskCore F hF φ hb hb1 hImage
    disk.core x ∈ exterior.marking.source ∧
      exterior.marking (disk.core x) = φ x ∧ exterior.marking.symm (φ x) = disk.core x := by
  intro exterior disk
  have hDisk := disk.rawInCore hx
  have hPocket : disk.core x ∈ standardFourSphereCap := by
    have hIm : disk.core x ∈ disk.core '' disk.raw := mem_image_of_mem disk.core hx
    rw [disk.coreImage] at hIm
    change disk.core x ∈ (interior (RoundEquatorialCaps.flip '' standardFourSphereCap))ᶜ at hIm
    have hSphere := RoundEquatorialCaps.southClosure.coreImage
    change id '' standardFourSphereCap = (interior (RoundEquatorialCaps.flip '' standardFourSphereCap))ᶜ at hSphere
    rw [← hSphere, image_id] at hIm
    exact hIm
  have hSource := exterior.capInMarking hPocket
  have hInv : exterior.marking.symm (φ x) = disk.core x := rfl
  have hTarget : φ x ∈ exterior.marking.target := by
    change φ x ∈ F.target ∧ F.symm (φ x) ∈ (transportedCapPocketChart b hb).target
    exact hDisk.2
  exact ⟨hSource, hInv ▸ exterior.marking.right_inv' hTarget, hInv⟩

/-- Extend the actual conformal metric germ of the transported disk, through
its boundary into the cap carrier. The free outer portion is exactly round
off the supplied patch. -/
theorem exists_transportedDiskConformalCap_of_germ
    (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (hF : Metric.closedBall (0 : E₄) 1 ⊆ F.source)
    (φ : M ≃ₘ⟮I, I⟯ M) {b : ℝ} (hb : 0 < b) (hb1 : b ≤ 1)
    (hImage : φ '' selectedChartDisk F = F '' Metric.closedBall 0 b)
    (q : SmoothRiemannianMetric I M)
    {W : Set S₄} (hW : IsOpen W) (hCapW : standardFourSphereCap ⊆ W)
    (uLocal : S₄ → ℝ) (hU : ContMDiffOn I₄ 𝓘(ℝ, ℝ) ∞ uLocal W)
    (hConformal :
      let A := (transportedDiskCore F hF φ hb hb1 hImage).core
      ∀ x ∈ selectedChartDisk F, ∀ᶠ y in 𝓝 x, ∀ v w : TangentSpace I y,
        q.inner y v w = Real.exp (2 * uLocal (A y)) *
          standardRoundFourMetric.inner (A y) (mfderiv I I₄ A y v) (mfderiv I I₄ A y w)) :
    ∃ uDisk : C^∞⟮I₄, S₄; ℝ⟯, EqOn uDisk 0 Wᶜ ∧
      let A := (transportedDiskCore F hF φ hb hb1 hImage).core
      ∀ x ∈ selectedChartDisk F, ∀ᶠ y in 𝓝 x, ∀ v w : TangentSpace I y,
        q.inner y v w =
          (conformalMetric standardRoundFourMetric uDisk).inner (A y)
            (mfderiv I I₄ A y v) (mfderiv I I₄ A y w) := by
  let disk := transportedDiskCore F hF φ hb hb1 hImage
  let A := disk.core
  obtain ⟨χ, hχ, _, hχW, _, hχ1⟩ :=
    DifferentialGeometry.Topology.exists_contMDiff_cutoff_of_isCompact (I := I₄)
      (isCompact_of_isClosed standardFourSphereCap_isClosed) hW hCapW
  let u : S₄ → ℝ := fun p => χ p * uLocal p
  have huSupp : tsupport u ⊆ tsupport χ := tsupport_mul_subset_left
  have hSmooth : ContMDiff I₄ 𝓘(ℝ, ℝ) ∞ u := by
    apply contMDiff_of_tsupport
    intro p hp
    exact hχ.contMDiffAt.mul (hU.contMDiffAt (hW.mem_nhds (hχW (huSupp hp))))
  let uDisk : C^∞⟮I₄, S₄; ℝ⟯ := ⟨u, hSmooth⟩
  refine ⟨uDisk, ?_, ?_⟩
  · intro p hp
    exact image_eq_zero_of_notMem_tsupport (fun h => hp (hχW (huSupp h)))
  · intro x hx
    have hCore := disk.rawInCore hx
    have hIm : disk.core x ∈ disk.core '' disk.raw := mem_image_of_mem disk.core hx
    rw [disk.coreImage] at hIm
    change A x ∈ (interior (RoundEquatorialCaps.flip '' standardFourSphereCap))ᶜ at hIm
    have hSphere := RoundEquatorialCaps.southClosure.coreImage
    change id '' standardFourSphereCap = (interior (RoundEquatorialCaps.flip '' standardFourSphereCap))ᶜ at hSphere
    rw [← hSphere, image_id] at hIm
    have hAt : χ =ᶠ[𝓝 (A x)] 1 := (eventually_nhdsSet_iff_forall.mp hχ1) (A x) hIm
    have hContinuous : ContinuousAt (A : M → S₄) x :=
      (A.contMDiffOn_toFun.contMDiffAt (A.open_source.mem_nhds hCore)).continuousAt
    filter_upwards [hContinuous.tendsto.eventually hAt, hConformal x hx] with y hy hh
    intro v w
    rw [conformalMetric_inner, hh v w]
    have hf : uDisk (A y) = uLocal (A y) := by
      change χ (A y) * uLocal (A y) = uLocal (A y)
      rw [show χ (A y) = 1 from hy, one_mul]
    rw [hf]

variable [I.Boundaryless] [CompactSpace M] [Nonempty M] [PathConnectedSpace M]
  {o : ManifoldOrientation I M 4}

/-- The exterior cap is the actual closed flattened conformal metric on the
original type. The forward comparison is the orientation-preserving transport
 and its inverse is valid on the complete retained region. -/
theorem transportedExterior_metric_relative (flat : SignedCollarMetric o)
    (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (hF : Metric.closedBall (0 : E₄) 1 ⊆ F.source)
    (φ : M ≃ₘ⟮I, I⟯ M) (hφ : φ.preservesOrientation o o)
    {b : ℝ} (hb : 0 < b) (hb1 : b ≤ 1)
    (hImage : φ '' selectedChartDisk F = F '' Metric.closedBall 0 b)
    (u : C^∞⟮I, M; ℝ⟯) :
    let exterior := transportedExteriorCore F hF φ hb hb1 hImage
    let cap := flat.conformal u
    let outgoing := cap.pullback φ hφ
    ∀ x ∈ exterior.raw, exterior.core.symm (exterior.core x) = x ∧
      ∀ v w : TangentSpace I x, outgoing.metric.inner x v w =
        cap.metric.inner (exterior.core x)
          (mfderiv I I exterior.core x v) (mfderiv I I exterior.core x w) := by
  intro exterior cap outgoing x hx
  refine ⟨exterior.core.left_inv' (exterior.rawInCore hx), ?_⟩
  intro v w
  exact Diffeomorph.pullbackMetricCross_inner cap.metric φ x v w

/-- These are actual positive cap metrics on their fixed carriers. The
outgoing disk cap is conformally round, and the outgoing exterior is the
retained part of the flattened conformal closed metric. Their errors are
exactly zero against the outgoing source in both chiralities. -/
theorem transportedDiskCaps_zeroDrift (g flat : SignedCollarMetric o)
    (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (hF : Metric.closedBall (0 : E₄) 1 ⊆ F.source)
    (φ : M ≃ₘ⟮I, I⟯ M) (hφ : φ.preservesOrientation o o)
    {b : ℝ} (hb : 0 < b) (hb1 : b ≤ 1)
    (hImage : φ '' selectedChartDisk F = F '' Metric.closedBall 0 b)
    (u : C^∞⟮I, M; ℝ⟯) (uDisk : C^∞⟮I₄, S₄; ℝ⟯)
    (oS : ManifoldOrientation I₄ S₄ 4)
    (hFlat : ∀ x ∈ φ '' selectedChartDisk F, metricRm04At flat.metric x = 0)
    (hPositive : 0 < classYamabeFour o.dimension_eq flat.metric) :
    let exterior := transportedExteriorCore F hF φ hb hb1 hImage
    let disk := transportedDiskCore F hF φ hb hb1 hImage
    let source := (flat.conformal u).pullback φ hφ
    let capExterior := flat.conformal u
    let capDisk := (RoundEquatorialCaps.signedRound oS).conformal uDisk
    let Δ := flat.energy .plus - g.energy .plus
    disk.HasPositiveCaps source oS ∧ exterior.HasPositiveCaps source o ∧
    0 < classYamabeFour oS.dimension_eq capDisk.metric ∧
    0 < classYamabeFour o.dimension_eq capExterior.metric ∧
    (∀ sign, capDisk.energy sign = source.charge sign disk.raw ∧
      capExterior.energy sign = source.charge sign exterior.raw ∧
      capExterior.energy sign - g.charge sign exterior.raw = g.charge sign disk.raw + Δ) := by
  intro exterior disk source capExterior capDisk Δ
  have hSphereRank : 1 < Module.rank ℝ V₅ := by simp [← Module.finrank_eq_rank]
  let : PathConnectedSpace S₄ :=
    isPathConnected_iff_pathConnectedSpace.1 (isPathConnected_sphere hSphereRank (0 : V₅) zero_le_one)
  have hCapE : 0 < classYamabeFour o.dimension_eq capExterior.metric := by
    change 0 < classYamabeFour o.dimension_eq (conformalMetric flat.metric u)
    rwa [classYamabeFour_conformalCore]
  have hCapD : 0 < classYamabeFour oS.dimension_eq capDisk.metric := by
    change 0 < classYamabeFour oS.dimension_eq (conformalMetric standardRoundFourMetric uDisk)
    rw [classYamabeFour_conformalCore]
    exact standardRoundFour_yamabe_pos
  have hEnd := (chargedDisk_flatPocket_transport g flat F hF φ hφ u hFlat hPositive).2.2
  have hDiskZero (sign : CollarChirality) : capDisk.energy sign = 0 := by
    rw [← SignedCollarMetric.charge_univ, SignedCollarMetric.charge_conformal]
    have hR := RoundEquatorialCaps.zero_charge oS
      (⟨1 / 2, by norm_num, by norm_num⟩ : RoundEquatorialCaps.HeightRadius)
      (⟨1 / 2, by norm_num, by norm_num⟩ : RoundEquatorialCaps.HeightRadius) 0 sign univ
    rw [SignedCollarMetric.charge_conformal] at hR
    exact hR
  have hLedger (sign : CollarChirality) :
      capDisk.energy sign = source.charge sign disk.raw ∧
      capExterior.energy sign = source.charge sign exterior.raw ∧
      capExterior.energy sign - g.charge sign exterior.raw = g.charge sign disk.raw + Δ := by
    obtain ⟨hD, _, hV, _⟩ := hEnd sign
    have hTot := SignedCollarMetric.energy_pullback capExterior φ hφ sign
    change source.energy sign = capExterior.energy sign at hTot
    have hS := signedCharge_fullMarkedExterior source sign F hF
    change _ = source.energy .plus - _ at hS
    have hSig : source.energy sign = source.energy .plus := by
      cases sign with
      | plus => rfl
      | minus => exact source.signature_zero.symm
    have he : capExterior.energy sign = source.charge sign exterior.raw := by
      change capExterior.energy sign = source.charge sign (interior (selectedChartDisk F))ᶜ
      change source.charge sign (selectedChartDisk F) = 0 at hD
      linarith only [hS, hTot, hSig, hD]
    exact ⟨(hDiskZero sign).trans hD.symm, he, he ▸ hV⟩
  refine ⟨?_, ?_, hCapD, hCapE, hLedger⟩
  · intro ε hε
    exact ⟨capDisk, hCapD, fun sign => by rw [(hLedger sign).1, sub_self, abs_zero]; exact hε⟩
  · intro ε hε
    exact ⟨capExterior, hCapE, fun sign => by rw [(hLedger sign).2.1, sub_self, abs_zero]; exact hε⟩

end SmoothPoincare
