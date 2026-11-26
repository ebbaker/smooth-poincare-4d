import SmoothPoincare.Heights.EndHandleBands

/-! # The whole component born at the selected index-zero cut -/

open DifferentialGeometry DifferentialGeometry.Topology DifferentialGeometry.Topology.Morse
open DifferentialGeometry.Topology.Morse.CellAttachment Set Metric
open scoped ContDiff Manifold

namespace SmoothPoincare

noncomputable section

variable {H M : Type} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {J : ModelWithCorners ℝ (MorseModel 4) H} [J.Boundaryless] [IsManifold J ∞ M]
  {f : M → ℝ} {hf : ContMDiff J 𝓘(ℝ, ℝ) ∞ f} {p : M} {lo hi : ℝ}

/-- Keep the whole open normal-form ball in a smooth ambient chart. -/
def IsolatedEndHandle.doubleBallChart {k : ℕ} {hk : k ≤ 4} (D : IsolatedEndHandle hf p lo hi k hk) :
    PartialDiffeomorph 𝓘(ℝ, MorseModel 4) J (MorseModel 4) M ∞ := by
  let S := {y : MorseModel 4 | morseNorm 4 y < 2 * D.chart.R}
  have hsrc : S ⊆ D.chart.χ.source := fun y hy => D.double_ball_subset_source y (le_of_lt hy)
  have hsmall : S ⊆ ball 0 D.chart.smoothRadius := by
    intro y hy
    rw [mem_ball, dist_zero_right]
    exact ((morseNorm_piNorm_le y).trans_lt hy).trans_le D.double_radius_le_smooth
  let e := D.chart.χ.restrOpen S (isOpen_morseNorm_lt _)
  have hs : e.source = S := inter_eq_right.mpr hsrc
  have ht : e.target = D.chart.χ '' S := by rw [← e.image_source_eq_target, hs]; rfl
  exact { toPartialEquiv := e.toPartialEquiv
          open_source := e.open_source
          open_target := e.open_target
          contMDiffOn_toFun := hs ▸ D.chart.contMDiffOn.mono hsmall
          contMDiffOn_invFun := ht ▸ D.chart.symm_contMDiffOn.mono (image_mono hsmall) }

theorem IsolatedEndHandle.doubleBallChart_source {k : ℕ} {hk : k ≤ 4}
    (D : IsolatedEndHandle hf p lo hi k hk) :
    D.doubleBallChart.source = {y | morseNorm 4 y < 2 * D.chart.R} :=
  inter_eq_right.mpr (fun y hy => D.double_ball_subset_source y (le_of_lt hy))

namespace IsolatedZeroHandle

local notation "V" => EuclideanSpace ℝ (Fin 4)

variable (D : IsolatedZeroHandle hf p lo hi)

private def birthLinear : V ≃L[ℝ] MorseModel 4 :=
  let s := Real.sqrt (2 * D.ε)
  have hs : 0 < s := Real.sqrt_pos.mpr (mul_pos (by norm_num) D.ε_pos)
  (LinearEquiv.smulOfNeZero ℝ V s hs.ne').toContinuousLinearEquiv.trans (EuclideanSpace.equiv (Fin 4) ℝ)

/-- The inverse of this actual four-dimensional chart reads the scaled Morse
coordinates on a neighborhood of the whole birth body, including its boundary. -/
def birthBodyChart : PartialDiffeomorph 𝓘(ℝ, V) J V M ∞ :=
  D.birthLinear.toDiffeomorph.toPartialDiffeomorph.trans D.doubleBallChart

private theorem birthLinear_norm (x : V) :
    morseNorm 4 (D.birthLinear x) = Real.sqrt (2 * D.ε) * ‖x‖ := by
  change ‖Real.sqrt (2 * D.ε) • x‖ = _
  rw [norm_smul, Real.norm_of_nonneg (Real.sqrt_nonneg _)]

private theorem birthBodyChart_mem {x : V} :
    x ∈ D.birthBodyChart.source ↔ Real.sqrt (2 * D.ε) * ‖x‖ < 2 * D.chart.R := by
  change (_ ∈ Set.univ ∧ D.birthLinear x ∈ D.doubleBallChart.source) ↔ _
  rw [D.doubleBallChart_source]
  exact and_iff_right trivial |>.trans (by change morseNorm 4 (D.birthLinear x) < _ ↔ _; rw [D.birthLinear_norm])

theorem birthBodyChart_closedBall_two : closedBall (0 : V) 2 ⊆ D.birthBodyChart.source := by
  intro x hx
  rw [D.birthBodyChart_mem]
  have hr := (Real.sqrt_le_iff.mp D.attaching_radius).2
  have hs := Real.sq_sqrt (show 0 ≤ 2 * D.ε by linarith [D.ε_pos])
  have hslt : Real.sqrt (2 * D.ε) < D.chart.R := by
    nlinarith [D.chart.radius_pos, sq_pos_of_pos D.r_pos, Real.sqrt_nonneg (2 * D.ε)]
  have hx' := mem_closedBall_zero_iff.mp hx
  nlinarith [mul_le_mul_of_nonneg_left hx' (Real.sqrt_nonneg (2 * D.ε))]

theorem birthBodyChart_height {x : V} (hx : x ∈ D.birthBodyChart.source) :
    f (D.birthBodyChart x) = f p + D.ε * ‖x‖ ^ 2 := by
  have hy := (D.birthBodyChart_mem.mp hx).le
  rw [← D.birthLinear_norm] at hy
  change f (D.chart.χ (D.birthLinear x)) = _
  rw [D.double_normalForm_on _ hy, morseNormalForm_split, negPart_bot, norm_zero,
    zero_pow (by decide), sub_zero]
  have hp : posPart (Nat.zero_le 4) (D.birthLinear x) = WithLp.toLp 2 (D.birthLinear x) := by
    apply (EuclideanSpace.equiv (Fin 4) ℝ).injective
    exact posPart_bot (n := 4) (D.birthLinear x)
  rw [hp]
  change f p + (1 / 2 : ℝ) * (morseNorm 4 (D.birthLinear x)) ^ 2 = _
  rw [D.birthLinear_norm, mul_pow, Real.sq_sqrt (by linarith [D.ε_pos])]
  ring

theorem birthBodyChart_zero : D.birthBodyChart 0 = p := by
  change D.chart.χ (D.birthLinear 0) = p
  rw [map_zero, D.chart.map_zero, D.chart_point]

/-- At the specified outgoing cut the closed round ball is precisely the native
connected component of the selected minimum. The same ambient chart identifies
its entire boundary level and both directions of the radial marking. -/
theorem birthBodyChart_component [T2Space M] :
    let C := connectedComponentIn {y | f y ≤ f p + D.ε} p
    D.birthBodyChart '' closedBall (0 : V) 1 = C ∧
    D.birthBodyChart '' sphere (0 : V) 1 = C ∩ {y | f y = f p + D.ε} := by
  let E := D.birthBodyChart
  let B := closedBall (0 : V) 1
  let A := E '' B
  let S := {y | f y ≤ f p + D.ε}
  have hBS : B ⊆ E.source := (closedBall_subset_closedBall (by norm_num : (1:ℝ) ≤ 2)).trans
    D.birthBodyChart_closedBall_two
  have hAc : IsCompact A := (isCompact_closedBall _ _).image_of_continuousOn (E.contMDiffOn.continuousOn.mono hBS)
  have hAp : IsPreconnected A := (convex_closedBall (0 : V) 1).isPreconnected.image _ (E.contMDiffOn.continuousOn.mono hBS)
  have heq : A = E.target ∩ S := by
    ext y
    constructor
    · rintro ⟨x,hx,rfl⟩
      refine ⟨E.map_source (hBS hx), ?_⟩
      change f (D.birthBodyChart x) ≤ _
      rw [D.birthBodyChart_height (hBS hx)]
      have h := mem_closedBall_zero_iff.mp hx
      nlinarith [mul_le_mul_of_nonneg_left (show ‖x‖ ^ 2 ≤ 1 by nlinarith [norm_nonneg x]) D.ε_pos.le]
    · rintro ⟨hy, hval⟩
      have hh := D.birthBodyChart_height (E.map_target hy)
      change f (E (E.symm y)) = _ at hh
      have hfy : f y = f p + D.ε * ‖E.symm y‖ ^ 2 := (congrArg f (E.right_inv hy)).symm.trans hh
      have h1 : ‖E.symm y‖ ^ 2 ≤ 1 := by
        apply le_of_not_gt
        intro ht
        have := mul_lt_mul_of_pos_left ht D.ε_pos
        change f y ≤ f p + D.ε at hval
        linarith
      exact ⟨E.symm y, mem_closedBall_zero_iff.mpr (by nlinarith [norm_nonneg (E.symm y)]), E.right_inv hy⟩
  have hp : p ∈ A := ⟨0, mem_closedBall_self (by norm_num), D.birthBodyChart_zero⟩
  have hAS : A ⊆ S := heq ▸ inter_subset_right
  have hcl : IsClopen ((Subtype.val : S → M) ⁻¹' A) := by
    refine ⟨hAc.isClosed.preimage continuous_subtype_val, ?_⟩
    have ht : (Subtype.val : S → M) ⁻¹' A = Subtype.val ⁻¹' E.target := by
      ext z
      simp only [heq, mem_preimage, mem_inter_iff, z.property, and_true]
    exact ht ▸ E.open_target.preimage continuous_subtype_val
  have hcomp : A = connectedComponentIn S p := by
    refine (hAp.subset_connectedComponentIn hp hAS).antisymm ?_
    rw [connectedComponentIn_eq_image (hAS hp)]
    rintro _ ⟨z,hz,rfl⟩
    exact hcl.connectedComponent_subset (show (⟨p, hAS hp⟩ : S) ∈ Subtype.val ⁻¹' A from hp) hz
  refine ⟨hcomp, ?_⟩
  change E '' sphere 0 1 = connectedComponentIn S p ∩ _
  rw [← hcomp]
  ext y
  constructor
  · rintro ⟨x,hx,rfl⟩
    have hx' : x ∈ B := sphere_subset_closedBall hx
    refine ⟨⟨x,hx',rfl⟩, ?_⟩
    change f (D.birthBodyChart x) = _
    rw [D.birthBodyChart_height (hBS hx'), mem_sphere_zero_iff_norm.mp hx]
    ring
  · rintro ⟨⟨x,hx,rfl⟩,hh⟩
    change f (D.birthBodyChart x) = _ at hh
    rw [D.birthBodyChart_height (hBS hx)] at hh
    have hsq : ‖x‖ ^ 2 = 1 := by
      apply (mul_left_cancel₀ D.ε_pos.ne')
      linarith
    exact ⟨x, mem_sphere_zero_iff_norm.mpr (by nlinarith [norm_nonneg x]), rfl⟩

/-- Carry the entire parametrized birth ball and boundary through a regular band.
Every original parameter is recovered by the same inverse ambient map. -/
theorem exists_transportedBirthBody [T2Space M] [CompactSpace M] {u : ℝ}
    (hcu : f p + D.ε ≤ u)
    (hregular : ∀ x, f x ∈ Icc (f p + D.ε) u → ¬ IsCriticalPointAt J f x) :
    ∃ (Φ : M ≃ₘ^∞⟮J,J⟯ M) (G : PartialDiffeomorph 𝓘(ℝ, V) J V M ∞),
      closedBall (0 : V) 2 ⊆ G.source ∧
      (∀ x, G x = Φ (D.birthBodyChart x)) ∧
      (∀ z, G.symm z = D.birthBodyChart.symm (Φ.symm z)) ∧
      G '' closedBall (0 : V) 1 = connectedComponentIn {y | f y ≤ u} (Φ p) ∧
      G '' sphere (0 : V) 1 = connectedComponentIn {y | f y ≤ u} (Φ p) ∩ {y | f y = u} := by
  obtain ⟨_, Φ, _, _, _, _, ⟨_,hsub,_⟩, hto, _, hfrom, _⟩ :=
    no_critical_value_transport f hf hcu (isClosed_Icc.preimage hf.continuous).isCompact hregular
  let c := f p + D.ε
  have hlev : Φ '' {y | f y = c} = {y | f y = u} := by
    ext y
    constructor
    · rintro ⟨x,hx,rfl⟩
      exact hto x hx
    · intro hy
      exact ⟨Φ.symm y,hfrom y hy,Φ.apply_symm_apply y⟩
  have hcomp : Φ '' connectedComponentIn {y | f y ≤ c} p = connectedComponentIn {y | f y ≤ u} (Φ p) := by
    have hp : p ∈ {y | f y ≤ c} := by change f p ≤ f p + D.ε; linarith [D.ε_pos]
    exact (Φ.toHomeomorph.image_connectedComponentIn hp).trans
      (congrArg (fun S => connectedComponentIn S (Φ p)) hsub)
  let G := D.birthBodyChart.trans Φ.toPartialDiffeomorph
  refine ⟨Φ,G,fun x hx => ⟨D.birthBodyChart_closedBall_two hx,mem_univ _⟩,
    fun _ => rfl, fun _ => rfl, ?_, ?_⟩
  · change (Φ ∘ D.birthBodyChart) '' _ = _
    rw [Set.image_comp, D.birthBodyChart_component.1]
    exact hcomp
  · change (Φ ∘ D.birthBodyChart) '' _ = _
    rw [Set.image_comp, D.birthBodyChart_component.2, image_inter (f := (Φ : M → M)) Φ.injective, hcomp, hlev]

end IsolatedZeroHandle
end
end SmoothPoincare
