import SmoothPoincare.Heights.MarkedTreeEdgeFeet
import SmoothPoincare.Heights.NativeBirthBody

/-! # Coordinates across the native four-dimensional Morse edge block -/

open DifferentialGeometry.Topology DifferentialGeometry.Topology.Morse Set
open DifferentialGeometry.Topology.Morse.CellAttachment
open DifferentialGeometry.Topology.Morse.ManifoldCellAttachment
open DifferentialGeometry.PDE.RicciFlow.Surgery.Topology
open scoped ContDiff Manifold Topology

namespace SmoothPoincare.IsolatedOneHandle

noncomputable section

local notation "U" => EuclideanSpace ℝ (Fin 1)
local notation "V" => EuclideanSpace ℝ (Fin 3)
local notation "W" => U × V
local notation "hk₁" => (show (1 : ℕ) ≤ 4 by decide)

variable {H M : Type} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {J : ModelWithCorners ℝ (MorseModel 4) H} [J.Boundaryless] [IsManifold J ∞ M]
  {f : M → ℝ} {hf : ContMDiff J 𝓘(ℝ, ℝ) ∞ f} {p : M} {lo hi : ℝ}
  (D : IsolatedOneHandle hf p lo hi)

/-- The model coordinates extend the handle parametrization across both feet,
including the unit transverse rim, with no clamping of either variable. -/
def edgeBlockModel (q : W) : MorseModel 4 :=
  recombine hk₁ (Real.sqrt (2 * D.ε + D.r ^ 2 * ‖q.2‖ ^ 2) • q.1) (D.r • q.2)

private def edgeBlockModelInv (y : MorseModel 4) : W :=
  ((Real.sqrt (2 * D.ε + ‖posPart hk₁ y‖ ^ 2))⁻¹ • negPart hk₁ y,
    D.r⁻¹ • posPart hk₁ y)

private theorem edgeBlock_scaled_norm_sq (z : V) :
    ‖D.r • z‖ ^ 2 = D.r ^ 2 * ‖z‖ ^ 2 := by
  rw [norm_smul, Real.norm_eq_abs, mul_pow, sq_abs]

private theorem edgeBlockModel_left_inv : Function.LeftInverse D.edgeBlockModelInv D.edgeBlockModel := by
  intro q
  have hε := D.ε_pos
  have hsqrt : Real.sqrt (2 * D.ε + D.r ^ 2 * ‖q.2‖ ^ 2) ≠ 0 := by positivity
  simp only [edgeBlockModel, edgeBlockModelInv, negPart_recombine, posPart_recombine,
    D.edgeBlock_scaled_norm_sq, smul_smul, inv_mul_cancel₀ hsqrt, inv_mul_cancel₀ D.r_pos.ne',
    one_smul]

private theorem edgeBlockModel_right_inv : Function.RightInverse D.edgeBlockModelInv D.edgeBlockModel := by
  intro y
  have hε := D.ε_pos
  have hsqrt : Real.sqrt (2 * D.ε + ‖posPart hk₁ y‖ ^ 2) ≠ 0 := by positivity
  have hz : D.r • (D.r⁻¹ • posPart hk₁ y) = posPart hk₁ y := by
    rw [smul_smul, mul_inv_cancel₀ D.r_pos.ne', one_smul]
  have hnorm := D.edgeBlock_scaled_norm_sq (D.r⁻¹ • posPart hk₁ y)
  rw [hz] at hnorm
  rw [edgeBlockModelInv, edgeBlockModel, ← hnorm, hz, smul_smul, mul_inv_cancel₀ hsqrt,
    one_smul, recombine_decompose]

private theorem edgeBlockModel_contDiff : ContDiff ℝ ∞ D.edgeBlockModel := by
  have hε := D.ε_pos
  unfold edgeBlockModel
  simpa only [negPart_cellMap_smul] using recombine_contDiff_cocore hk₁ D.r D.ε hε

private theorem edgeBlockModelInv_contDiff : ContDiff ℝ ∞ D.edgeBlockModelInv := by
  have hε := D.ε_pos
  have harg : ContDiff ℝ ∞ (fun y : MorseModel 4 => 2 * D.ε + ‖posPart hk₁ y‖ ^ 2) :=
    contDiff_const.add (contDiff_posPart_normSq hk₁)
  have hsqrt := harg.sqrt (fun y => by positivity)
  have hneg : ContDiff ℝ ∞ (negPart hk₁) := by
    rw [contDiff_euclidean]
    intro i
    change ContDiff ℝ ∞ (fun y : MorseModel 4 => y (negIdx hk₁ i))
    fun_prop
  have hpos : ContDiff ℝ ∞ (posPart hk₁) := by
    rw [contDiff_euclidean]
    intro i
    change ContDiff ℝ ∞ (fun y : MorseModel 4 => y (posIdx hk₁ i))
    fun_prop
  exact (hsqrt.inv (fun y => by positivity)).smul hneg |>.prodMk
    ((contDiff_const (c := D.r⁻¹)).smul hpos)

private def edgeBlockModelDiffeomorph :
    W ≃ₘ^∞⟮𝓘(ℝ, W), 𝓘(ℝ, MorseModel 4)⟯ MorseModel 4 :=
  { toFun := D.edgeBlockModel
    invFun := D.edgeBlockModelInv
    left_inv := D.edgeBlockModel_left_inv
    right_inv := D.edgeBlockModel_right_inv
    contMDiff_toFun := D.edgeBlockModel_contDiff.contMDiff
    contMDiff_invFun := D.edgeBlockModelInv_contDiff.contMDiff }

private def edgeBlockBall : Set (MorseModel 4) :=
  {y | morseNorm 4 y < 2 * D.chart.R}

private theorem edgeBlockBall_subset_source : D.edgeBlockBall ⊆ D.chart.χ.source :=
  fun y hy => D.double_ball_subset_source y (le_of_lt hy)

/-- One smooth chart across the native neck, both incoming rims, and an
outgoing patch. The inverse recovers the unclamped model coordinates. -/
def edgeBlockChart : PartialDiffeomorph 𝓘(ℝ, W) J W M ∞ :=
  D.edgeBlockModelDiffeomorph.toPartialDiffeomorph.trans D.doubleBallChart

theorem edgeBlockChart_source :
    D.edgeBlockChart.source = {q : W | morseNorm 4 (D.edgeBlockModel q) < 2 * D.chart.R} := by
  change univ ∩ D.edgeBlockModel ⁻¹' D.doubleBallChart.source = _
  rw [univ_inter, D.doubleBallChart_source]
  rfl

theorem edgeBlockChart_apply (q : W) :
    D.edgeBlockChart q = D.chart.χ (D.edgeBlockModel q) := rfl

theorem edgeBlockChart_symm_apply (x : M) :
    D.edgeBlockChart.symm x =
      ((Real.sqrt (2 * D.ε + ‖posPart hk₁ (D.chart.χ.symm x)‖ ^ 2))⁻¹ •
        negPart hk₁ (D.chart.χ.symm x), D.r⁻¹ • posPart hk₁ (D.chart.χ.symm x)) := rfl

/-- The normal form written in the actual handle parameters on the entire
open block. The lower cut is at unit negative radius. -/
theorem edgeBlockChart_height {q : W} (hq : q ∈ D.edgeBlockChart.source) :
    f (D.edgeBlockChart q) = f p - D.ε + (1 - ‖q.1‖ ^ 2) * (D.ε + D.r ^ 2 * ‖q.2‖ ^ 2 / 2) := by
  rw [D.edgeBlockChart_source] at hq
  have hε := D.ε_pos
  rw [D.edgeBlockChart_apply, D.double_normalForm_on _ (le_of_lt hq), morseNormalForm_split,
    edgeBlockModel, negPart_recombine, posPart_recombine, D.edgeBlock_scaled_norm_sq,
    norm_smul, Real.norm_eq_abs, abs_of_nonneg (Real.sqrt_nonneg _), mul_pow,
    Real.sq_sqrt (by positivity)]
  ring

/-- The actual lower sublevel is the outer axial side in the model. Its
frontier in the block is the union of the two labeled unit axial faces. -/
theorem edgeBlockChart_incomingSides {q : W} (hq : q ∈ D.edgeBlockChart.source) :
    (f (D.edgeBlockChart q) ≤ f p - D.ε ↔ 1 ≤ ‖q.1‖) ∧
      (f (D.edgeBlockChart q) = f p - D.ε ↔ ‖q.1‖ = 1) := by
  have hε := D.ε_pos
  have hpos : 0 < D.ε + D.r ^ 2 * ‖q.2‖ ^ 2 / 2 := by positivity
  have hmul : (1 - ‖q.1‖ ^ 2) * (D.ε + D.r ^ 2 * ‖q.2‖ ^ 2 / 2) ≤ 0 ↔
      1 - ‖q.1‖ ^ 2 ≤ 0 := by
    exact ⟨fun h => nonpos_of_mul_nonpos_left h hpos,
      fun h => mul_nonpos_of_nonpos_of_nonneg h hpos.le⟩
  rw [D.edgeBlockChart_height hq, add_le_iff_nonpos_right, hmul, sub_nonpos]
  have heq : f p - D.ε + (1 - ‖q.1‖ ^ 2) * (D.ε + D.r ^ 2 * ‖q.2‖ ^ 2 / 2) = f p - D.ε ↔
      (1 - ‖q.1‖ ^ 2) * (D.ε + D.r ^ 2 * ‖q.2‖ ^ 2 / 2) = 0 := by
    constructor <;> intro h <;> linarith
  rw [heq, mul_eq_zero, or_iff_left hpos.ne', sub_eq_zero]
  constructor
  · simpa only [one_pow] using (sq_le_sq₀ (by norm_num : (0 : ℝ) ≤ 1) (norm_nonneg q.1))
  · constructor
    · intro h
      apply le_antisymm
      · exact (sq_le_sq₀ (norm_nonneg q.1) (by norm_num)).1 (by rw [← h]; norm_num)
      · exact (sq_le_sq₀ (by norm_num) (norm_nonneg q.1)).1 (by rw [← h]; norm_num)
    · intro h
      simp [h]

/-- Both entire native feet, including their rims, have their original
signed label and transverse parameter in the same four-dimensional chart. -/
theorem edgeBlockChart_nativeFoot (b : CellBoundary 1) (z : ClosedCell 3) :
    (b.val, z.val) ∈ D.edgeBlockChart.source ∧
      D.edgeBlockChart (b.val, z.val) =
        (cocoreAttachingEmbedding hk₁ (f p) D.ε D.r D.chart D.ε_pos D.attaching_radius (b, z)).val ∧
      D.edgeBlockChart.symm
        (cocoreAttachingEmbedding hk₁ (f p) D.ε D.r D.chart D.ε_pos D.attaching_radius (b, z)).val =
        (b.val, z.val) := by
  have he : D.edgeBlockModel (b.val, z.val) = cocoreModelPoint hk₁ D.ε D.r (b, z) := by
    simp only [edgeBlockModel, cocoreModelPoint, negPart_cellMap_smul]
  have hq : (b.val, z.val) ∈ D.edgeBlockChart.source := by
    rw [D.edgeBlockChart_source]
    change morseNorm 4 (D.edgeBlockModel (b.val, z.val)) < 2 * D.chart.R
    rw [he]
    exact ((cocoreModelPoint_norm_le hk₁ D.ε D.r D.ε_pos.le (b, z)).trans
      D.attaching_radius).trans_lt (by linarith [D.chart.radius_pos])
  have hfwd : D.edgeBlockChart (b.val, z.val) =
      (cocoreAttachingEmbedding hk₁ (f p) D.ε D.r D.chart D.ε_pos D.attaching_radius (b, z)).val := by
    rw [D.edgeBlockChart_apply, he]
    rfl
  exact ⟨hq, hfwd, hfwd ▸ D.edgeBlockChart.left_inv hq⟩

/-- Compose the block chart with the ambient foot normalization to read
back the native parameter from the exact model foot with its chosen parity.
The same statement applies to either end label. -/
theorem edgeBlockChart_afterFootNormalization {ι : Type*} (b : CellBoundary 1) :
    letI := D.footLevelEuclideanCharts
    letI := D.footComponent_isManifold b
    ∀ (marks : FootCollarMarks (D.footComponentChart b) ι)
      (χ : PartialDiffeomorph (ThreeModel.prod 𝓘(ℝ, ℝ)) J (D.footComponent b × ℝ) M ∞)
      (r : ℝ) (A : ThreeSpace ≃ₗᵢ[ℝ] ThreeSpace) (F : M ≃ₘ^∞⟮J,J⟯ M),
    0 < r →
    (∀ x : D.footComponent b, χ (x, 0) = x.val.val) →
    D.NativeFootCollarEquations b marks χ r A F →
    ∀ z : ClosedCell 3,
      let E := D.edgeBlockChart.trans F.toPartialDiffeomorph
      let x := χ (marks.model.chart (A z.val), 0)
      (b.val, z.val) ∈ E.source ∧ E (b.val, z.val) = x ∧ E.symm x = (b.val, z.val) := by
  let := D.footLevelEuclideanCharts
  let := D.footComponent_isManifold b
  intro marks χ r A F hr hzero hfoot z
  obtain ⟨hz, hfwd, _⟩ := D.edgeBlockChart_nativeFoot b z
  have hχ : χ (D.footComponentPoint b z, 0) = D.edgeBlockChart (b.val, z.val) := by
    rw [hzero, hfwd]
    exact congrArg Subtype.val (D.footComponentPoint_val b z)
  let E := D.edgeBlockChart.trans F.toPartialDiffeomorph
  have hsrc : (b.val, z.val) ∈ E.source := ⟨hz, mem_univ _⟩
  have heq : E (b.val, z.val) = χ (marks.model.chart (A z.val), 0) := by
    change F (D.edgeBlockChart (b.val, z.val)) = _
    rw [← hχ]
    exact (hfoot.1 z 0 (by simpa using (div_nonneg hr.le (by norm_num : (0 : ℝ) ≤ 3)))).1
  exact ⟨hsrc, heq, heq ▸ E.left_inv hsrc⟩

private def radialSource (d : ℝ → ℝ) : Set (MorseModel 4) :=
  {y | 0 < ‖posPart hk₁ y‖ ^ 2 ∧ 0 < ‖posPart hk₁ y‖ ^ 2 + d (‖negPart hk₁ y‖ ^ 2)}

private def radialShift (d : ℝ → ℝ) (y : MorseModel 4) : MorseModel 4 :=
  recombine hk₁ (negPart hk₁ y)
    (Real.sqrt ((‖posPart hk₁ y‖ ^ 2 + d (‖negPart hk₁ y‖ ^ 2)) / ‖posPart hk₁ y‖ ^ 2) •
      posPart hk₁ y)

private theorem radialShift_normSq (d : ℝ → ℝ) {y : MorseModel 4} (hy : y ∈ radialSource d) :
    ‖posPart hk₁ (radialShift d y)‖ ^ 2 = ‖posPart hk₁ y‖ ^ 2 + d (‖negPart hk₁ y‖ ^ 2) := by
  have hratio := div_pos hy.2 hy.1
  rw [radialShift, posPart_recombine, norm_smul, Real.norm_eq_abs,
    abs_of_nonneg (Real.sqrt_nonneg _), mul_pow, Real.sq_sqrt hratio.le,
    div_mul_cancel₀ _ hy.1.ne']

private theorem radialShift_mapsTo (d : ℝ → ℝ) :
    MapsTo (radialShift d) (radialSource d) (radialSource (fun s => -d s)) := by
  intro y hy
  change _ ∧ 0 < _ + -d (‖negPart hk₁ (radialShift d y)‖ ^ 2)
  rw [radialShift_normSq d hy]
  have hn : negPart hk₁ (radialShift d y) = negPart hk₁ y := negPart_recombine _ _ _
  rw [hn, add_neg_cancel_right]
  exact ⟨hy.2, hy.1⟩

private theorem radialShift_left_inv (d : ℝ → ℝ) {y : MorseModel 4} (hy : y ∈ radialSource d) :
    radialShift (fun s => -d s) (radialShift d y) = y := by
  let b := ‖posPart hk₁ y‖ ^ 2
  let a := d (‖negPart hk₁ y‖ ^ 2)
  have hb : 0 < b := hy.1
  have hba : 0 < b + a := hy.2
  have hproduct : Real.sqrt (b / (b + a)) * Real.sqrt ((b + a) / b) = 1 := by
    rw [← Real.sqrt_mul (div_nonneg hb.le hba.le)]
    have hrat : b / (b + a) * ((b + a) / b) = 1 := by
      field_simp [hb.ne', hba.ne']
    rw [hrat, Real.sqrt_one]
  have hn : negPart hk₁ (radialShift d y) = negPart hk₁ y := negPart_recombine _ _ _
  have hp : posPart hk₁ (radialShift d y) =
      Real.sqrt ((b + a) / b) • posPart hk₁ y := posPart_recombine _ _ _
  have hs : ‖posPart hk₁ (radialShift d y)‖ ^ 2 = b + a := radialShift_normSq d hy
  unfold radialShift at *
  change recombine hk₁ _ _ = y
  rw [hn, hs, hp]
  change recombine hk₁ (negPart hk₁ y)
    (Real.sqrt ((b + a + -a) / (b + a)) • (Real.sqrt ((b + a) / b) • posPart hk₁ y)) = y
  rw [add_neg_cancel_right, smul_smul, hproduct, one_smul, recombine_decompose]

private theorem radialSource_open {d : ℝ → ℝ} (hd : ContDiff ℝ ∞ d) : IsOpen (radialSource d) := by
  exact (isOpen_lt continuous_const (contDiff_posPart_normSq hk₁).continuous).inter
    (isOpen_lt continuous_const ((contDiff_posPart_normSq hk₁).continuous.add
      (hd.continuous.comp (contDiff_negPart_normSq hk₁).continuous)))

private theorem radialShift_contDiffOn {d : ℝ → ℝ} (hd : ContDiff ℝ ∞ d) :
    ContDiffOn ℝ ∞ (radialShift d) (radialSource d) := by
  have hn := contDiff_negPart_normSq hk₁
  have hp := contDiff_posPart_normSq hk₁
  have hs : ContDiffOn ℝ ∞
      (fun y : MorseModel 4 => Real.sqrt
        ((‖posPart hk₁ y‖ ^ 2 + d (‖negPart hk₁ y‖ ^ 2)) / ‖posPart hk₁ y‖ ^ 2))
      (radialSource d) :=
    ((((hp.add (hd.comp hn)).contDiffOn).div hp.contDiffOn (fun y hy => hy.1.ne')).sqrt
      (fun y hy => (div_pos hy.2 hy.1).ne'))
  rw [contDiffOn_pi]
  intro i
  by_cases hi : i.val < 1
  · have heq : (fun y => radialShift d y i) =
        fun y : MorseModel 4 => negPart hk₁ y ⟨i.val, hi⟩ := by
      funext y
      simp [radialShift, recombine, hi]
    rw [heq]
    exact (show ContDiff ℝ ∞ (fun y : MorseModel 4 => y (negIdx hk₁ ⟨i.val, hi⟩)) by
      fun_prop).contDiffOn
  · let j : Fin 3 := ⟨i.val - 1, by omega⟩
    have heq : (fun y => radialShift d y i) = fun y : MorseModel 4 =>
        Real.sqrt ((‖posPart hk₁ y‖ ^ 2 + d (‖negPart hk₁ y‖ ^ 2)) / ‖posPart hk₁ y‖ ^ 2) *
          posPart hk₁ y j := by
      funext y
      simp [radialShift, recombine, hi, j]
    rw [heq]
    exact hs.mul (show ContDiff ℝ ∞ (fun y : MorseModel 4 => y (posIdx hk₁ j)) by
      fun_prop).contDiffOn

private def radialDiffeomorph (d : ℝ → ℝ) (hd : ContDiff ℝ ∞ d) :
    PartialDiffeomorph 𝓘(ℝ, MorseModel 4) 𝓘(ℝ, MorseModel 4) (MorseModel 4) (MorseModel 4) ∞ where
  toFun := radialShift d
  invFun := radialShift (fun s => -d s)
  source := radialSource d
  target := radialSource (fun s => -d s)
  map_source' := radialShift_mapsTo d
  map_target' := by
    intro y hy
    simpa only [neg_neg] using radialShift_mapsTo (fun s => -d s) hy
  left_inv' := fun _ hy => radialShift_left_inv d hy
  right_inv' := by
    intro y hy
    simpa only [neg_neg] using radialShift_left_inv (fun s => -d s) hy
  open_source := radialSource_open hd
  open_target := radialSource_open hd.neg
  contMDiffOn_toFun := (radialShift_contDiffOn hd).contMDiffOn
  contMDiffOn_invFun := (radialShift_contDiffOn hd.neg).contMDiffOn

/-- The squared radial displacement from the rounded cap to the upper
height quadric at the same squared axial coordinate. -/
def roundedRimDelta (δ s : ℝ) : ℝ :=
  2 * D.ε + s - smoothCap D.ε D.r δ s

/-- In the chosen Morse chart, send the rounded radial cap to the native
outgoing radial quadric, keeping the negative coordinate and the transverse
direction. The inverse subtracts the same change of squared radius. -/
def roundedRimToOutgoing (δ : ℝ) :
    PartialDiffeomorph J J M M ∞ :=
  let d := D.roundedRimDelta δ
  let hd : ContDiff ℝ ∞ d :=
    (contDiff_const.add contDiff_id).sub (smoothCap_contDiff D.ε D.r δ)
  (D.doubleBallChart.symm.trans (radialDiffeomorph d hd)).trans D.doubleBallChart

theorem roundedRimToOutgoing_apply (δ : ℝ) (x : M) :
    D.roundedRimToOutgoing δ x =
      let y := D.chart.χ.symm x
      D.chart.χ (recombine hk₁ (negPart hk₁ y)
        (Real.sqrt ((‖posPart hk₁ y‖ ^ 2 + D.roundedRimDelta δ (‖negPart hk₁ y‖ ^ 2)) /
          ‖posPart hk₁ y‖ ^ 2) • posPart hk₁ y)) := rfl

theorem roundedRimToOutgoing_symm_apply (δ : ℝ) (x : M) :
    (D.roundedRimToOutgoing δ).symm x =
      let y := D.chart.χ.symm x
      D.chart.χ (recombine hk₁ (negPart hk₁ y)
        (Real.sqrt ((‖posPart hk₁ y‖ ^ 2 - D.roundedRimDelta δ (‖negPart hk₁ y‖ ^ 2)) /
          ‖posPart hk₁ y‖ ^ 2) • posPart hk₁ y)) := by
  simp only [sub_eq_add_neg]
  rfl

/-- This is the exact domain of the rounded comparison. Each point must be
in the native block, and both radial coordinates must be positive. -/
private theorem roundedRimToOutgoing_source (δ : ℝ) :
    (D.roundedRimToOutgoing δ).source =
      {x | x ∈ D.chart.χ '' D.edgeBlockBall ∧
        D.chart.χ.symm x ∈ radialSource (D.roundedRimDelta δ) ∧
        radialShift (D.roundedRimDelta δ) (D.chart.χ.symm x) ∈ D.edgeBlockBall} := by
  have hsrc : D.doubleBallChart.source = D.edgeBlockBall := D.doubleBallChart_source
  have htgt : D.doubleBallChart.target = D.chart.χ '' D.edgeBlockBall := by
    change D.doubleBallChart.toOpenPartialHomeomorph.target = _
    rw [← D.doubleBallChart.toOpenPartialHomeomorph.image_source_eq_target]
    change D.chart.χ '' D.doubleBallChart.source = _
    rw [hsrc]
  ext x
  change ((x ∈ D.doubleBallChart.target ∧ D.chart.χ.symm x ∈
    radialSource (D.roundedRimDelta δ)) ∧
    radialShift (D.roundedRimDelta δ) (D.chart.χ.symm x) ∈ D.doubleBallChart.source) ↔ _
  rw [hsrc, htgt, and_assoc]
  rfl

/-- Test membership in the rounded comparison directly in the native chart
using the two positive radius squares and room for the shifted point. -/
theorem roundedRimToOutgoing_mem_source (δ : ℝ)
    {y : MorseModel 4} (hy : morseNorm 4 y < 2 * D.chart.R) :
    D.chart.χ y ∈ (D.roundedRimToOutgoing δ).source ↔
      let a := ‖negPart hk₁ y‖ ^ 2
      let b := ‖posPart hk₁ y‖ ^ 2
      let b' := b + D.roundedRimDelta δ a
      0 < b ∧ 0 < b' ∧ a + b' < (2 * D.chart.R) ^ 2 := by
  rw [D.roundedRimToOutgoing_source]
  change (_ ∧ D.chart.χ.symm (D.chart.χ y) ∈ radialSource (D.roundedRimDelta δ) ∧ _) ↔ _
  rw [D.chart.χ.left_inv (D.double_ball_subset_source _ hy.le),
    and_iff_right (show D.chart.χ y ∈ D.chart.χ '' D.edgeBlockBall from ⟨y, hy, rfl⟩)]
  let d := D.roundedRimDelta δ
  have hR : 0 ≤ 2 * D.chart.R := by linarith [D.chart.radius_pos]
  have hshift (hr : y ∈ radialSource d) :
      radialShift d y ∈ D.edgeBlockBall ↔
        ‖negPart hk₁ y‖ ^ 2 + (‖posPart hk₁ y‖ ^ 2 + d (‖negPart hk₁ y‖ ^ 2)) <
          (2 * D.chart.R) ^ 2 := by
    change morseNorm 4 (radialShift d y) < _ ↔ _
    rw [← sq_lt_sq₀ (norm_nonneg _) hR, morseNorm_sq_eq_negPart_add_posPart hk₁,
      radialShift_normSq d hr,
      show negPart hk₁ (radialShift d y) = negPart hk₁ y from negPart_recombine _ _ _]
  exact ⟨fun h => ⟨h.1.1, h.1.2, (hshift h.1).1 h.2⟩,
    fun h => ⟨⟨h.1, h.2.1⟩, (hshift ⟨h.1, h.2.1⟩).2 h.2.2⟩⟩

/-- On the core where the pinned rounding cutoff is constant, the exact
signed coordinate at the rounded boundary becomes the signed height at the
actual outgoing level. Both inverse identities hold on the same patches. -/
theorem edgeBlockChart_signedOutgoing (δ R₀ R₁ : ℝ) (h₀ : 0 ≤ R₀) (h₀₁ : R₀ < R₁)
    {x : M} (hx : x ∈ (D.roundedRimToOutgoing δ).source)
    (hcore : morseNorm 4 (D.chart.χ.symm x) ≤ R₀) :
    let T := D.roundedRimToOutgoing δ
    let rounded := morseRoundedFunction hk₁ (f p) D.ε D.r δ R₀ R₁ D.chart
    f (T x) - (f p + D.ε) = rounded x - f p ∧
      T x ∈ T.target ∧ T.symm (T x) = x := by
  refine ⟨?_, (D.roundedRimToOutgoing δ).map_source hx, (D.roundedRimToOutgoing δ).left_inv hx⟩
  rw [D.roundedRimToOutgoing_source] at hx
  let y := D.chart.χ.symm x
  let d := D.roundedRimDelta δ
  have hyχ : D.chart.χ y = x := by
    rcases hx.1 with ⟨v, hv, rfl⟩
    change D.chart.χ (D.chart.χ.symm (D.chart.χ v)) = D.chart.χ v
    rw [D.chart.χ.left_inv (D.edgeBlockBall_subset_source hv)]
  have hround : morseRoundedFunction hk₁ (f p) D.ε D.r δ R₀ R₁ D.chart x =
      modelAttachedFunction hk₁ (f p) D.ε D.r δ y := by
    rw [morseRoundedFunction_eq_model_of_mem_closedBall _ _ _ _ _ _ _ D.chart
      ⟨y, (hcore.trans h₀₁.le), hyχ⟩,
      modelRoundedFunction_eq_attached_of_norm_le _ _ _ _ _ _ _ h₀₁ h₀ hcore]
  have hn : negPart hk₁ (radialShift d y) = negPart hk₁ y := negPart_recombine _ _ _
  change f (D.chart.χ (radialShift d y)) - (f p + D.ε) = _ - f p
  rw [D.double_normalForm_on _ (le_of_lt hx.2.2), hround, morseNormalForm_split, hn,
    radialShift_normSq d hx.2.1, modelAttachedFunction]
  simp only [d, roundedRimDelta]
  ring


/-- The inverse comparison preserves the same signed coordinate at every
outgoing point whose preimage is in the rounding core. -/
theorem roundedRimToOutgoing_signed_inverse (δ R₀ R₁ : ℝ) (h₀ : 0 ≤ R₀) (h₀₁ : R₀ < R₁)
    {x : M} (hx : x ∈ (D.roundedRimToOutgoing δ).target)
    (hcore : morseNorm 4 (D.chart.χ.symm ((D.roundedRimToOutgoing δ).symm x)) ≤ R₀) :
    let T := D.roundedRimToOutgoing δ
    let rounded := morseRoundedFunction hk₁ (f p) D.ε D.r δ R₀ R₁ D.chart
    rounded (T.symm x) - f p = f x - (f p + D.ε) ∧
      T (T.symm x) = x := by
  have hinv := (D.roundedRimToOutgoing δ).right_inv hx
  have h := D.edgeBlockChart_signedOutgoing δ R₀ R₁ h₀ h₀₁
    ((D.roundedRimToOutgoing δ).map_target hx) hcore
  refine ⟨?_, hinv⟩
  calc
    _ = f ((D.roundedRimToOutgoing δ) ((D.roundedRimToOutgoing δ).symm x)) -
        (f p + D.ε) := h.1.symm
    _ = _ := congrArg (fun y => f y - (f p + D.ε)) hinv

/-- Both native rims are in the radial comparison. If the rounding core
contains the attaching radius, each rim is carried onto the outgoing cut
with its full parameter and the inverse returns the original rim point. -/
theorem roundedRimToOutgoing_nativeRim (δ R₀ R₁ : ℝ)
    (hR₀ : Real.sqrt (2 * D.ε + 2 * D.r ^ 2) ≤ R₀) (h₀₁ : R₀ < R₁)
    (b : CellBoundary 1) (z : CellBoundary 3) :
    let x := D.edgeBlockChart (b.val, z.val)
    let T := D.roundedRimToOutgoing δ
    x ∈ T.source ∧ f (T x) = f p + D.ε ∧ T.symm (T x) = x := by
  let y := D.edgeBlockModel (b.val, z.val)
  let x := D.edgeBlockChart (b.val, z.val)
  let d := D.roundedRimDelta δ
  have hε := D.ε_pos
  have hr := D.r_pos
  have hbound := (Real.sqrt_le_iff.mp D.attaching_radius).2
  have hnormpos : ‖posPart hk₁ y‖ ^ 2 = D.r ^ 2 := by
    rw [show y = D.edgeBlockModel (b.val, z.val) from rfl, edgeBlockModel, posPart_recombine,
      D.edgeBlock_scaled_norm_sq, z.property]
    ring
  have hnormneg : ‖negPart hk₁ y‖ ^ 2 = 2 * D.ε + D.r ^ 2 := by
    rw [show y = D.edgeBlockModel (b.val, z.val) from rfl, edgeBlockModel, negPart_recombine,
      z.property, norm_smul, Real.norm_eq_abs, abs_of_nonneg (Real.sqrt_nonneg _)]
    change (Real.sqrt (2 * D.ε + D.r ^ 2 * (1 : ℝ) ^ 2) * ‖b.val‖) ^ 2 = _
    rw [b.property, mul_one, Real.sq_sqrt (by positivity)]
    ring
  have hcap : smoothCap D.ε D.r δ (‖negPart hk₁ y‖ ^ 2) = D.r ^ 2 := by
    rw [hnormneg]
    simp [smoothCap]
  have hyd : y ∈ radialSource d := by
    change 0 < ‖posPart hk₁ y‖ ^ 2 ∧ 0 < ‖posPart hk₁ y‖ ^ 2 + d (‖negPart hk₁ y‖ ^ 2)
    rw [hnormpos]
    unfold d roundedRimDelta
    rw [hcap, hnormneg]
    constructor <;> nlinarith [sq_pos_of_pos hr]
  have hnorm : morseNorm 4 y = Real.sqrt (2 * D.ε + 2 * D.r ^ 2) := by
    have hsqrt : Real.sqrt (morseNorm 4 y ^ 2) = morseNorm 4 y := Real.sqrt_sq (norm_nonneg _)
    rw [← hsqrt, morseNorm_sq_eq_negPart_add_posPart hk₁, hnormneg, hnormpos]
    congr 1
    ring
  have hy : y ∈ D.edgeBlockBall := by
    change morseNorm 4 y < _
    rw [hnorm]
    exact D.attaching_radius.trans_lt (by linarith [D.chart.radius_pos])
  have hout : radialShift d y ∈ D.edgeBlockBall := by
    change morseNorm 4 (radialShift d y) < _
    apply (sq_lt_sq₀ (norm_nonneg _) (by linarith [D.chart.radius_pos] : 0 ≤ 2 * D.chart.R)).1
    have hn : negPart hk₁ (radialShift d y) = negPart hk₁ y := negPart_recombine _ _ _
    rw [morseNorm_sq_eq_negPart_add_posPart hk₁, hn, radialShift_normSq d hyd, hnormpos]
    unfold d roundedRimDelta
    rw [hcap, hnormneg]
    nlinarith [sq_nonneg D.r, hε]
  have hx : x = D.chart.χ y := rfl
  have hyx : D.chart.χ.symm x = y := hx ▸ D.chart.χ.left_inv (D.edgeBlockBall_subset_source hy)
  have hsrc : x ∈ (D.roundedRimToOutgoing δ).source := by
    rw [D.roundedRimToOutgoing_source]
    exact ⟨⟨y, hy, hx.symm⟩, hyx.symm ▸ hyd, hyx.symm ▸ hout⟩
  have hround : morseRoundedFunction hk₁ (f p) D.ε D.r δ R₀ R₁ D.chart x = f p := by
    have hcore : morseNorm 4 y ≤ R₀ := hnorm ▸ hR₀
    rw [morseRoundedFunction_eq_model_of_mem_closedBall _ _ _ _ _ _ _ D.chart
      ⟨y, hcore.trans h₀₁.le, hx.symm⟩, hyx,
      modelRoundedFunction_eq_attached_of_norm_le _ _ _ _ _ _ _ h₀₁
        ((Real.sqrt_nonneg _).trans hR₀) hcore, modelAttachedFunction, hnormpos, hcap]
    ring
  have heq := D.edgeBlockChart_signedOutgoing δ R₀ R₁ ((Real.sqrt_nonneg _).trans hR₀)
    h₀₁ hsrc (by rw [hyx, hnorm]; exact hR₀)
  refine ⟨hsrc, ?_, heq.2.2⟩
  linarith [heq.1, hround]


end

end SmoothPoincare.IsolatedOneHandle
