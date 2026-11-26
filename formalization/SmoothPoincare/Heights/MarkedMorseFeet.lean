import SmoothPoincare.Heights.EndHandleBands
import DifferentialGeometry.Topology.Manifold.SmoothModelTransportSource
import DifferentialGeometry.Topology.Manifold.BallEmbedding.RelativeIsotopy

/-! # Charts extending the two marked feet of a native Morse one-handle -/

open DifferentialGeometry.Topology DifferentialGeometry.Topology.Morse Set
open DifferentialGeometry.Topology.Morse.CellAttachment
open DifferentialGeometry.Topology.Morse.ManifoldCellAttachment
open scoped ContDiff Manifold Topology

namespace SmoothPoincare.IsolatedOneHandle

noncomputable section

local notation "V" => EuclideanSpace ℝ (Fin 3)
local notation "I₃" => 𝓘(ℝ, MorseModel 3)
local notation "Iᵥ" => 𝓘(ℝ, V)
local notation "hk₁" => (show (1 : ℕ) ≤ 4 by decide)

variable {H M : Type} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {J : ModelWithCorners ℝ (MorseModel 4) H} [J.Boundaryless] [IsManifold J ∞ M]
  {f : M → ℝ} {hf : ContMDiff J 𝓘(ℝ, ℝ) ∞ f} {p : M} {lo hi : ℝ}
  (D : IsolatedOneHandle hf p lo hi)

local notation "L" => LevelSetSpace f (f p - D.ε)

/-- The graph of one branch of the native lower Morse quadric. The label is
the original unit negative coordinate of the attaching region. -/
def footModelPoint (b : CellBoundary 1) (z : V) : MorseModel 4 :=
  recombine hk₁
    (negPart hk₁ (cellMap (Real.sqrt (2 * D.ε + D.r ^ 2 * ‖z‖ ^ 2)) b.val))
    (D.r • z)

private theorem footModelPoint_contDiff (b : CellBoundary 1) :
    ContDiff ℝ ∞ (D.footModelPoint b) := by
  have hpair : ContDiff ℝ ∞ (fun z : V => (b.val, z)) :=
    contDiff_const.prodMk contDiff_id
  unfold footModelPoint
  simpa only [Function.comp_def] using
    (recombine_contDiff_cocore hk₁ D.r D.ε D.ε_pos).comp hpair

private theorem footModelPoint_neg_norm_sq (b : CellBoundary 1) (z : V) :
    ‖negPart hk₁ (D.footModelPoint b z)‖ ^ 2 = 2 * D.ε + D.r ^ 2 * ‖z‖ ^ 2 := by
  have hε := D.ε_pos
  rw [footModelPoint, negPart_recombine, negPart_cellMap_norm_sq,
    Real.sq_sqrt (by positivity), b.property, one_pow, mul_one]

private theorem footModelPoint_pos_norm_sq (b : CellBoundary 1) (z : V) :
    ‖posPart hk₁ (D.footModelPoint b z)‖ ^ 2 = D.r ^ 2 * ‖z‖ ^ 2 := by
  rw [footModelPoint, posPart_recombine, norm_smul, Real.norm_eq_abs, mul_pow, sq_abs]

private theorem footModelPoint_norm_sq (b : CellBoundary 1) (z : V) :
    morseNorm 4 (D.footModelPoint b z) ^ 2 = 2 * D.ε + 2 * D.r ^ 2 * ‖z‖ ^ 2 := by
  rw [morseNorm_sq_eq_negPart_add_posPart hk₁, D.footModelPoint_neg_norm_sq,
    D.footModelPoint_pos_norm_sq]
  ring

private theorem footLabel_sq (b : CellBoundary 1) : (b.val 0) ^ 2 = 1 := by
  have h := b.property
  have hs := congrArg (fun t : ℝ => t ^ 2) h
  simpa only [EuclideanSpace.real_norm_sq_eq, Fin.sum_univ_one, one_pow] using hs

private def footSource (b : CellBoundary 1) : Set V :=
  {z | morseNorm 4 (D.footModelPoint b z) < 2 * D.chart.R}

private theorem footSource_isOpen (b : CellBoundary 1) : IsOpen (D.footSource b) :=
  isOpen_lt ((continuous_norm.comp (PiLp.continuous_toLp (p := (2 : ENNReal))
    (β := fun _ : Fin 4 => ℝ))).comp (D.footModelPoint_contDiff b).continuous) continuous_const

private theorem closedBall_two_subset_footSource (b : CellBoundary 1) :
    Metric.closedBall (0 : V) 2 ⊆ D.footSource b := by
  intro z hz
  have hnorm : ‖z‖ ≤ 2 := by simpa [Metric.mem_closedBall, dist_zero_right] using hz
  have hsq : ‖z‖ ^ 2 ≤ (2 : ℝ) ^ 2 := (sq_le_sq₀ (norm_nonneg _) (by norm_num)).2 hnorm
  have hR : 0 < 2 * D.chart.R := mul_pos (by norm_num) D.chart.radius_pos
  have hε := D.ε_pos
  have hrad : 2 * D.ε + 8 * D.r ^ 2 < (2 * D.chart.R) ^ 2 :=
    (Real.sqrt_lt (by positivity) hR.le).mp D.attaching_radius_two_lt
  change morseNorm 4 (D.footModelPoint b z) < 2 * D.chart.R
  apply (sq_lt_sq₀ (norm_nonneg _) hR.le).1
  rw [D.footModelPoint_norm_sq]
  nlinarith only [hrad, mul_nonneg (sq_nonneg D.r) (sub_nonneg.mpr hsq)]

private def footModelTarget (b : CellBoundary 1) : Set (MorseModel 4) :=
  {y | morseNorm 4 y < 2 * D.chart.R ∧ 0 < b.val 0 * negPart hk₁ y 0}

private def footTarget (b : CellBoundary 1) : Set L :=
  Subtype.val ⁻¹' (D.chart.χ.target ∩ D.chart.χ.symm ⁻¹' D.footModelTarget b)

private theorem footTarget_isOpen (b : CellBoundary 1) : IsOpen (D.footTarget b) := by
  have hnorm : Continuous (morseNorm 4) :=
    continuous_norm.comp (PiLp.continuous_toLp (p := (2 : ENNReal))
      (β := fun _ : Fin 4 => ℝ))
  have hsign : Continuous (fun y : MorseModel 4 => b.val 0 * negPart hk₁ y 0) :=
    continuous_const.mul (continuous_apply (negIdx hk₁ 0))
  have hopen : IsOpen (D.footModelTarget b) :=
    (isOpen_lt hnorm continuous_const).inter (isOpen_lt continuous_const hsign)
  exact (D.chart.χ.isOpen_inter_preimage_symm hopen).preimage continuous_subtype_val

private theorem footModelPoint_value (b : CellBoundary 1) {z : V}
    (hz : z ∈ D.footSource b) : f (D.chart.χ (D.footModelPoint b z)) = f p - D.ε := by
  rw [D.double_normalForm_on _ (le_of_lt hz), morseNormalForm_split,
    D.footModelPoint_neg_norm_sq, D.footModelPoint_pos_norm_sq]
  ring

private def footMap (b : CellBoundary 1) (z : V) : L := by
  classical
  exact if hz : z ∈ D.footSource b then ⟨D.chart.χ (D.footModelPoint b z), D.footModelPoint_value b hz⟩
    else ⟨D.chart.χ (D.footModelPoint b 0),
      D.footModelPoint_value b (D.closedBall_two_subset_footSource b
        (Metric.mem_closedBall_self (by norm_num)))⟩

private theorem footMap_val (b : CellBoundary 1) {z : V} (hz : z ∈ D.footSource b) :
    (D.footMap b z).val = D.chart.χ (D.footModelPoint b z) := by
  simp only [footMap, dite_eq_left hz]

/-- Recover the dimensionless positive coordinates from the actual incoming
level. This is the inverse on each foot chart's target. -/
def footTransverse (x : L) : V :=
  D.r⁻¹ • posPart hk₁ (D.chart.χ.symm x.val)

private theorem footMap_modelCoordinates (b : CellBoundary 1) {z : V}
    (hz : z ∈ D.footSource b) :
    D.chart.χ.symm (D.footMap b z).val = D.footModelPoint b z := by
  rw [D.footMap_val b hz, D.chart.χ.left_inv (D.double_ball_subset_source _ (le_of_lt hz))]

private theorem footModelPoint_mem_footModelTarget (b : CellBoundary 1) {z : V}
    (hz : z ∈ D.footSource b) : D.footModelPoint b z ∈ D.footModelTarget b := by
  have hε := D.ε_pos
  refine ⟨hz, ?_⟩
  change 0 < b.val 0 * negPart hk₁ (D.footModelPoint b z) 0
  rw [footModelPoint, negPart_recombine, negPart_cellMap_apply,
    show ∀ s a : ℝ, a * (s * a) = s * a ^ 2 by intros; ring,
    footLabel_sq, mul_one]
  positivity

private theorem footMap_mapsTo (b : CellBoundary 1) :
    MapsTo (D.footMap b) (D.footSource b) (D.footTarget b) := by
  intro z hz
  refine ⟨?_, ?_⟩
  · rw [D.footMap_val b hz]
    exact D.chart.χ.map_source (D.double_ball_subset_source _ (le_of_lt hz))
  · change D.chart.χ.symm (D.footMap b z).val ∈ D.footModelTarget b
    rw [D.footMap_modelCoordinates b hz]
    exact D.footModelPoint_mem_footModelTarget b hz

private theorem footTransverse_footMap (b : CellBoundary 1) {z : V}
    (hz : z ∈ D.footSource b) : D.footTransverse (D.footMap b z) = z := by
  rw [footTransverse, D.footMap_modelCoordinates b hz, footModelPoint,
    posPart_recombine, smul_smul, inv_mul_cancel₀ D.r_pos.ne', one_smul]

private theorem footModelPoint_footTransverse (b : CellBoundary 1) {x : L}
    (hx : x ∈ D.footTarget b) :
    D.footModelPoint b (D.footTransverse x) = D.chart.χ.symm x.val := by
  let y := D.chart.χ.symm x.val
  have hy : y ∈ D.footModelTarget b := hx.2
  have hvalue : morseNormalForm hk₁ (f p) y = f p - D.ε := by
    rw [← D.double_normalForm_on y (le_of_lt hy.1), D.chart.χ.right_inv hx.1]
    exact x.property
  have hpos : D.r • D.footTransverse x = posPart hk₁ y := by
    rw [footTransverse, smul_smul, mul_inv_cancel₀ D.r_pos.ne', one_smul]
  have hposSq : D.r ^ 2 * ‖D.footTransverse x‖ ^ 2 = ‖posPart hk₁ y‖ ^ 2 := by
    rw [← hpos, norm_smul, Real.norm_eq_abs, mul_pow, sq_abs]
  have hnegSq : (negPart hk₁ y 0) ^ 2 = 2 * D.ε + ‖posPart hk₁ y‖ ^ 2 := by
    rw [morseNormalForm_split, EuclideanSpace.real_norm_sq_eq (negPart hk₁ y),
      Fin.sum_univ_one] at hvalue
    linarith
  have hε := D.ε_pos
  have hs : 0 < Real.sqrt (2 * D.ε + ‖posPart hk₁ y‖ ^ 2) := by positivity
  have ha : (negPart hk₁ y 0) ^ 2 =
      (Real.sqrt (2 * D.ε + ‖posPart hk₁ y‖ ^ 2) * b.val 0) ^ 2 := by
    rw [mul_pow, Real.sq_sqrt (by positivity), footLabel_sq, mul_one, hnegSq]
  have heq : negPart hk₁ y 0 = Real.sqrt (2 * D.ε + ‖posPart hk₁ y‖ ^ 2) * b.val 0 := by
    rcases sq_eq_sq_iff_eq_or_eq_neg.mp ha with h | h
    · exact h
    · have hsigned : 0 < b.val 0 * negPart hk₁ y 0 := hy.2
      rw [h, show ∀ a s : ℝ, a * -(s * a) = -(s * a ^ 2) by intros; ring,
        footLabel_sq, mul_one] at hsigned
      linarith
  have hneg : negPart hk₁
      (cellMap (Real.sqrt (2 * D.ε + D.r ^ 2 * ‖D.footTransverse x‖ ^ 2)) b.val) =
      negPart hk₁ y := by
    ext i
    have hi : i = 0 := Subsingleton.elim _ _
    subst i
    rw [negPart_cellMap_apply, hposSq, heq]
  rw [footModelPoint, hneg, hpos, recombine_decompose]

private theorem footTransverse_mapsTo (b : CellBoundary 1) :
    MapsTo D.footTransverse (D.footTarget b) (D.footSource b) := by
  intro x hx
  change morseNorm 4 (D.footModelPoint b (D.footTransverse x)) < 2 * D.chart.R
  rw [D.footModelPoint_footTransverse b hx]
  exact hx.2.1

private theorem footMap_footTransverse (b : CellBoundary 1) {x : L}
    (hx : x ∈ D.footTarget b) : D.footMap b (D.footTransverse x) = x := by
  apply Subtype.ext
  rw [D.footMap_val b (D.footTransverse_mapsTo b hx),
    D.footModelPoint_footTransverse b hx, D.chart.χ.right_inv hx.1]

private theorem footMap_contMDiffOn (b : CellBoundary 1) :
    letI := manifoldLevelSetChartedSpace J f (f p - D.ε) hf D.lower_regular
    ContMDiffOn Iᵥ I₃ ∞ (D.footMap b) (D.footSource b) := by
  let := manifoldLevelSetChartedSpace J f (f p - D.ε) hf D.lower_regular
  let U : TopologicalSpace.Opens V := ⟨D.footSource b, D.footSource_isOpen b⟩
  have hg : ContMDiffOn Iᵥ J ∞ (fun z => D.chart.χ (D.footModelPoint b z)) (D.footSource b) :=
    D.chart.contMDiffOn.comp (D.footModelPoint_contDiff b).contMDiff.contMDiffOn
      (fun z hz => by
        change D.footModelPoint b z ∈ Metric.ball (0 : MorseModel 4) D.chart.smoothRadius
        rw [Metric.mem_ball, dist_zero_right]
        exact (morseNorm_piNorm_le _).trans_lt (hz.trans_le D.double_radius_le_smooth))
  have hU : ContMDiff Iᵥ J ∞ (fun z : U => (D.footMap b z.val).val) := by
    intro z
    have hh : ContMDiffOn Iᵥ J ∞ (fun w => (D.footMap b w).val) (D.footSource b) :=
      hg.congr (fun _ hz => D.footMap_val b hz)
    exact contMDiffAt_subtype_iff.mpr
      ((hh z.val z.property).contMDiffAt ((D.footSource_isOpen b).mem_nhds z.property))
  have hfactor : ContMDiff Iᵥ I₃ ∞ (fun z : U => D.footMap b z.val) :=
    contMDiff_levelSet_factor J f (f p - D.ε) hf D.lower_regular
      _ hU (fun z => (D.footMap b z.val).property)
  intro z hz
  exact (contMDiffAt_subtype_iff.mp (hfactor ⟨z, hz⟩)).contMDiffWithinAt

private theorem footTransverse_contMDiffOn (b : CellBoundary 1) :
    letI := manifoldLevelSetChartedSpace J f (f p - D.ε) hf D.lower_regular
    ContMDiffOn I₃ Iᵥ ∞ D.footTransverse (D.footTarget b) := by
  let := manifoldLevelSetChartedSpace J f (f p - D.ε) hf D.lower_regular
  have hχ : ContMDiffOn I₃ 𝓘(ℝ, MorseModel 4) ∞
      (fun x : L => D.chart.χ.symm x.val) (D.footTarget b) :=
    D.chart.symm_contMDiffOn.comp
      (contMDiff_levelSetInclusion J f (f p - D.ε) hf D.lower_regular).contMDiffOn
      (fun x hx => ⟨D.chart.χ.symm x.val, by
        rw [Metric.mem_ball, dist_zero_right]
        exact (morseNorm_piNorm_le _).trans_lt (hx.2.1.trans_le D.double_radius_le_smooth),
        D.chart.χ.right_inv hx.1⟩)
  have hpos : ContDiff ℝ ∞ (posPart hk₁) := by
    apply (contDiff_piLp 2).2
    intro i
    change ContDiff ℝ ∞ (fun y : MorseModel 4 => y (posIdx hk₁ i))
    fun_prop
  exact ((contDiff_const (c := D.r⁻¹)).smul hpos).contMDiff.comp_contMDiffOn hχ

/-- A genuine smooth ball chart of the native incoming level, in each
negative-coordinate branch. Its source contains the closed radius-two ball. -/
def footPartialDiffeomorph (b : CellBoundary 1) :
    letI := manifoldLevelSetChartedSpace J f (f p - D.ε) hf D.lower_regular
    PartialDiffeomorph Iᵥ I₃ V L ∞ := by
  letI := manifoldLevelSetChartedSpace J f (f p - D.ε) hf D.lower_regular
  exact {
    toFun := D.footMap b
    invFun := D.footTransverse
    source := D.footSource b
    target := D.footTarget b
    map_source' := D.footMap_mapsTo b
    map_target' := D.footTransverse_mapsTo b
    left_inv' := fun _ hz => D.footTransverse_footMap b hz
    right_inv' := fun _ hx => D.footMap_footTransverse b hx
    open_source := D.footSource_isOpen b
    open_target := D.footTarget_isOpen b
    contMDiffOn_toFun := D.footMap_contMDiffOn b
    contMDiffOn_invFun := D.footTransverse_contMDiffOn b }

theorem footPartialDiffeomorph_closedBall_two_subset_source (b : CellBoundary 1) :
    Metric.closedBall (0 : V) 2 ⊆ (D.footPartialDiffeomorph b).source :=
  D.closedBall_two_subset_footSource b

theorem footPartialDiffeomorph_coe (b : CellBoundary 1) {z : V}
    (hz : z ∈ (D.footPartialDiffeomorph b).source) :
    (D.footPartialDiffeomorph b z).val = D.chart.χ (D.footModelPoint b z) :=
  D.footMap_val b hz

theorem footPartialDiffeomorph_symm_apply (b : CellBoundary 1) (x : L) :
    letI := manifoldLevelSetChartedSpace J f (f p - D.ε) hf D.lower_regular
    (D.footPartialDiffeomorph b).symm x = D.footTransverse x := rfl

theorem footPartialDiffeomorph_apply_closedCell (b : CellBoundary 1) (z : ClosedCell 3) :
    D.footPartialDiffeomorph b z.val =
      cocoreAttachingEmbedding hk₁ (f p) D.ε D.r D.chart D.ε_pos D.attaching_radius (b, z) := by
  have hz : z.val ∈ Metric.closedBall (0 : V) 2 := by
    rw [Metric.mem_closedBall, dist_zero_right]
    exact z.property.trans (by norm_num)
  apply Subtype.ext
  exact D.footPartialDiffeomorph_coe b (D.footPartialDiffeomorph_closedBall_two_subset_source b hz)

theorem footPartialDiffeomorph_apply_nativeAttaching (b : CellBoundary 1) (z : ClosedCell 3) :
    (D.footPartialDiffeomorph b z.val).val =
      (morseAttachingEmbedding hk₁ (f p) D.ε D.r D.chart D.ε_pos D.attaching_radius (b, z)).val := by
  rw [D.footPartialDiffeomorph_apply_closedCell]
  rfl

theorem footPartialDiffeomorph_disjoint (b b' : CellBoundary 1) (h : b ≠ b') :
    Disjoint (D.footPartialDiffeomorph b).target (D.footPartialDiffeomorph b').target := by
  have heq : b.val 0 ≠ b'.val 0 := by
    intro h0
    apply h
    apply Subtype.ext
    ext i
    fin_cases i
    exact h0
  have hs : b.val 0 = -(b'.val 0) := by
    have hsq : (b.val 0) ^ 2 = (b'.val 0) ^ 2 := (footLabel_sq b).trans (footLabel_sq b').symm
    exact (sq_eq_sq_iff_eq_or_eq_neg.mp hsq).resolve_left heq
  apply disjoint_left.mpr
  intro x hx hx'
  change x ∈ D.footTarget b at hx
  change x ∈ D.footTarget b' at hx'
  have hx₀ : 0 < b.val 0 * negPart hk₁ (D.chart.χ.symm x.val) 0 := hx.2.2
  have hx'₀ : 0 < b'.val 0 * negPart hk₁ (D.chart.χ.symm x.val) 0 := hx'.2.2
  rw [hs, neg_mul] at hx₀
  linarith

private def levelEuclideanCoordinates : MorseModel 3 ≃L[ℝ] V :=
  (PiLp.continuousLinearEquiv 2 ℝ (fun _ : Fin 3 => ℝ)).symm

open DifferentialGeometry.Manifold in
/-- The same incoming level and its native atlas, with values re-expressed in
the Euclidean three-space model used by supported ball-chart isotopy. -/
@[instance_reducible]
def footLevelEuclideanCharts : ChartedSpace V L := by
  letI := manifoldLevelSetChartedSpace J f (f p - D.ε) hf D.lower_regular
  exact chartedSpaceTransHomeomorph levelEuclideanCoordinates.toHomeomorph

open DifferentialGeometry.Manifold in
theorem footLevelEuclidean_isManifold :
    letI := D.footLevelEuclideanCharts
    IsManifold Iᵥ ∞ L := by
  let := manifoldLevelSetChartedSpace J f (f p - D.ε) hf D.lower_regular
  let := manifoldLevelSetIsManifold J f (f p - D.ε) hf D.lower_regular
  exact isManifold_transHomeomorph I₃ Iᵥ levelEuclideanCoordinates.toHomeomorph
    levelEuclideanCoordinates (fun _ => rfl)

open DifferentialGeometry.Manifold in
/-- The radius-two chart in the Euclidean three-space model. The map on the
actual level and its transverse inverse have the same values. -/
def footEuclideanChart (b : CellBoundary 1) :
    letI := D.footLevelEuclideanCharts
    PartialDiffeomorph Iᵥ Iᵥ V L ∞ := by
  letI := manifoldLevelSetChartedSpace J f (f p - D.ε) hf D.lower_regular
  let e := D.footPartialDiffeomorph b
  letI := D.footLevelEuclideanCharts
  exact {
    toPartialEquiv := e.toPartialEquiv
    open_source := e.open_source
    open_target := e.open_target
    contMDiffOn_toFun := (contMDiffOn_chartedSpaceTransHomeomorph_iff I₃ Iᵥ
      levelEuclideanCoordinates.toHomeomorph levelEuclideanCoordinates (fun _ => rfl) Iᵥ).2
      e.contMDiffOn_toFun
    contMDiffOn_invFun := (contMDiffOn_chartedSpaceTransHomeomorph_source_iff I₃ Iᵥ
      levelEuclideanCoordinates.toHomeomorph levelEuclideanCoordinates (fun _ => rfl) Iᵥ).2
      e.contMDiffOn_invFun }

theorem footEuclideanChart_closedBall_two_subset_source (b : CellBoundary 1) :
    Metric.closedBall (0 : V) 2 ⊆ (D.footEuclideanChart b).source :=
  D.footPartialDiffeomorph_closedBall_two_subset_source b

theorem footEuclideanChart_apply (b : CellBoundary 1) (z : V) :
    D.footEuclideanChart b z = D.footPartialDiffeomorph b z := rfl

open DifferentialGeometry
open DifferentialGeometry.PDE.RicciFlow.Surgery.Topology

/-- With boundary orientation and compatible oriented charts supplied, the
native whole closed foot is matched pointwise to its chosen model. A common
linear isometry allows both charts to be expressed in reflected coordinates. -/
theorem exists_relativeFootIsotopy [T2Space M] [PreconnectedSpace L]
    (b : CellBoundary 1) (A : V ≃ₗᵢ[ℝ] V) :
    letI := D.footLevelEuclideanCharts
    letI := D.footLevelEuclidean_isManifold
    ∀ (o : ManifoldOrientation Iᵥ L 3) (actual model : OrientedBallEmbedding L o)
      (C : Set L),
      (∀ z ∈ Metric.closedBall (0 : V) 1, actual.chart (A z) = D.footEuclideanChart b z) →
      IsCompact C → IsPreconnected Cᶜ →
      Disjoint (actual.chart '' Metric.closedBall (0 : V) 1) C →
      Disjoint (model.chart '' Metric.closedBall (0 : V) 1) C →
      ∃ (Jt : ℝ → Diffeomorph Iᵥ Iᵥ L L ∞) (K : Set L),
        IsCompact K ∧ Disjoint K C ∧ Jt 0 = Diffeomorph.refl Iᵥ L ∞ ∧
        ContMDiff (𝓘(ℝ, ℝ).prod Iᵥ) Iᵥ ∞ (fun q : ℝ × L => Jt q.1 q.2) ∧
        ContMDiff (𝓘(ℝ, ℝ).prod Iᵥ) Iᵥ ∞ (fun q : ℝ × L => (Jt q.1).symm q.2) ∧
        (∀ t, EqOn (Jt t) (id : L → L) Kᶜ) ∧
        (∀ t, EqOn (Jt t).symm (id : L → L) Kᶜ) ∧
        ∀ z : ClosedCell 3,
          let x := cocoreAttachingEmbedding hk₁ (f p) D.ε D.r D.chart
            D.ε_pos D.attaching_radius (b, z)
          Jt 1 x = model.chart (A z.val) ∧ (Jt 1).symm (model.chart (A z.val)) = x := by
  let := D.footLevelEuclideanCharts
  let := D.footLevelEuclidean_isManifold
  intro o actual model C ha hC hcomp hactual hmodel
  obtain ⟨Jt, K, hK, hKC, h0, hs, hsi, hfix, hfixi, hmatch⟩ :=
    OrientedBallEmbedding.exists_isotopy_eqOn_closedBall_of_isPreconnected_compl
      o actual model C hC hcomp hactual hmodel
  refine ⟨Jt, K, hK, hKC, h0, hs, hsi, hfix, hfixi, fun z => ?_⟩
  have hz : z.val ∈ Metric.closedBall (0 : V) 1 := by
    rw [Metric.mem_closedBall, dist_zero_right]
    exact z.property
  have hAz : A z.val ∈ Metric.closedBall (0 : V) 1 := by
    rw [Metric.mem_closedBall, dist_zero_right, LinearIsometryEquiv.norm_map]
    exact z.property
  dsimp only
  have hforward : Jt 1
      (cocoreAttachingEmbedding hk₁ (f p) D.ε D.r D.chart D.ε_pos D.attaching_radius (b, z)) =
        model.chart (A z.val) := by
    rw [← D.footPartialDiffeomorph_apply_closedCell b z, ← D.footEuclideanChart_apply,
      ← ha z.val hz]
    exact hmatch (A z.val) hAz
  exact ⟨hforward, by rw [← hforward, Diffeomorph.symm_apply_apply]⟩

end
end SmoothPoincare.IsolatedOneHandle
