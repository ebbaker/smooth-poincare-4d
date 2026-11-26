import SmoothPoincare.Heights.ClosedMarkedControl
import SmoothPoincare.Heights.MarkedEdgeGluing

/-! # Smooth comparison of closed marked assemblies on their signed collars -/

open Set DifferentialGeometry.Topology
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

noncomputable section

section SmoothAssembly

variable {E H F K : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace H] [NormedAddCommGroup F] [NormedSpace ℝ F] [TopologicalSpace K]
  {I : ModelWithCorners ℝ E H} {IB : ModelWithCorners ℝ F K}
  {M M' : Type*} [TopologicalSpace M] [ChartedSpace H M]
  [TopologicalSpace M'] [ChartedSpace H M']
  {Z Z' : Type*} [TopologicalSpace Z] [ChartedSpace K Z]
  [TopologicalSpace Z'] [ChartedSpace K Z']

/-- A closed marked homeomorphism is smooth on both interiors and the entire
signed seam if it agrees there with the supplied open patches. The two
one-sided equations are made in a common signed product normal coordinate.
The inverse equations on the whole seam and interiors follow from bijectivity. -/
def smoothMarkedAssembly
    (h : M' ≃ₜ M) (e : Z' ≃ₘ^∞⟮IB, IB⟯ Z)
    (A : PartialDiffeomorph (IB.prod 𝓘(ℝ, ℝ)) I (Z' × ℝ) M' ∞)
    (B : PartialDiffeomorph (IB.prod 𝓘(ℝ, ℝ)) I (Z × ℝ) M ∞)
    {r : ℝ} (hA : A.source = univ ×ˢ Ioo (-r) r) (hB : B.source = univ ×ˢ Ioo (-r) r)
    (P : Fin 2 → PartialDiffeomorph I I M' M ∞)
    (hP : ∀ j, EqOn h (P j) (P j).source)
    (hcover : (⋃ j, (P j).source) ∪ A.target = univ)
    (hLower : ∀ q ∈ A.source, q.2 ≤ 0 → h (A q) = B (e q.1, q.2))
    (hUpper : ∀ q ∈ A.source, 0 ≤ q.2 → h (A q) = B (e q.1, q.2)) :
    M' ≃ₘ^∞⟮I, I⟯ M := by
  let T := markedEdgeSignedCollar A B e
  obtain ⟨hs, _, hf, _⟩ := markedEdgeSignedCollar_eqOn A B e hA hB (fun _ => by simp)
  have hT : EqOn h T T.source := by
    intro x hx
    have hxA : x ∈ A.target := hs ▸ hx
    let q := A.symm x
    have hq : q ∈ A.source := A.map_target hxA
    have hsign := le_total q.2 0
    have he : A q = x := A.right_inv hxA
    rcases hsign with hsign | hsign
    · exact he ▸ ((hLower q hq hsign).trans (hf q hq).symm)
    · exact he ▸ ((hUpper q hq hsign).trans (hf q hq).symm)
  let localSmooth (Q : PartialDiffeomorph I I M' M ∞) (hQ : EqOn h Q Q.source) :
      (∀ x ∈ Q.source, ContMDiffAt I I ∞ h x) ∧
      ∀ x ∈ Q.source, ContMDiffAt I I ∞ h.symm (h x) := by
    have hInv : EqOn h.symm Q.symm Q.target := by
      intro y hy
      have hx := Q.map_target hy
      change h.symm y = Q.symm y
      apply h.injective
      calc
        h (h.symm y) = y := h.apply_symm_apply y
        _ = Q (Q.symm y) := (Q.right_inv hy).symm
        _ = h (Q.symm y) := (hQ hx).symm
    exact ⟨fun x hx => (Q.contMDiffOn.congr hQ).contMDiffAt (Q.open_source.mem_nhds hx),
      fun x hx => (Q.symm.contMDiffOn.congr hInv).contMDiffAt
        (Q.open_target.mem_nhds (show h x ∈ Q.target from (hQ hx).symm ▸ Q.map_source hx))⟩
  have hlocal (x : M') : ContMDiffAt I I ∞ h x ∧ ContMDiffAt I I ∞ h.symm (h x) := by
    have hx : x ∈ (⋃ j, (P j).source) ∪ A.target := hcover ▸ mem_univ x
    rcases hx with hx | hx
    · obtain ⟨j, hj⟩ := mem_iUnion.mp hx
      exact ⟨(localSmooth (P j) (hP j)).1 x hj, (localSmooth (P j) (hP j)).2 x hj⟩
    · have hxT : x ∈ T.source := hs ▸ hx
      exact ⟨(localSmooth T hT).1 x hxT, (localSmooth T hT).2 x hxT⟩
  exact { toEquiv := h.toEquiv
          contMDiff_toFun := fun x => (hlocal x).1
          contMDiff_invFun := fun y => h.apply_symm_apply y ▸ (hlocal (h.symm y)).2 }

theorem smoothMarkedAssembly_marked
    (h : M' ≃ₜ M) (e : Z' ≃ₘ^∞⟮IB, IB⟯ Z)
    (A : PartialDiffeomorph (IB.prod 𝓘(ℝ, ℝ)) I (Z' × ℝ) M' ∞)
    (B : PartialDiffeomorph (IB.prod 𝓘(ℝ, ℝ)) I (Z × ℝ) M ∞)
    {r : ℝ} (hA : A.source = univ ×ˢ Ioo (-r) r) (hB : B.source = univ ×ˢ Ioo (-r) r)
    (P : Fin 2 → PartialDiffeomorph I I M' M ∞)
    (hP : ∀ j, EqOn h (P j) (P j).source)
    (hcover : (⋃ j, (P j).source) ∪ A.target = univ)
    (hLower : ∀ q ∈ A.source, q.2 ≤ 0 → h (A q) = B (e q.1, q.2))
    (hUpper : ∀ q ∈ A.source, 0 ≤ q.2 → h (A q) = B (e q.1, q.2)) :
    let F := smoothMarkedAssembly h e A B hA hB P hP hcover hLower hUpper
    (∀ x, F x = h x) ∧ (∀ y, F.symm y = h.symm y) ∧
      (∀ q ∈ A.source, F (A q) = B (e q.1, q.2)) ∧
      ∀ q ∈ B.source, F.symm (B q) = A (e.symm q.1, q.2) := by
  dsimp only
  have hforward (q : Z' × ℝ) (hq : q ∈ A.source) : h (A q) = B (e q.1, q.2) := by
    rcases le_total q.2 0 with hneg | hpos
    · exact hLower q hq hneg
    · exact hUpper q hq hpos
  refine ⟨fun _ => rfl, fun _ => rfl, hforward, ?_⟩
  intro q hq
  change h.symm (B q) = A (e.symm q.1, q.2)
  have hq' : (e.symm q.1, q.2) ∈ A.source := by
    rw [hA, hB] at *
    exact ⟨mem_univ _, hq.2⟩
  apply h.injective
  rw [h.apply_symm_apply, hforward _ hq', e.apply_symm_apply, Prod.mk.eta]

end SmoothAssembly

namespace ClosedMarkedControl

open DifferentialGeometry.Topology.Manifold StandardSurgeryModel

local notation "V" => Block 1
local notation "I₂" => 𝓘(ℝ, V)
local notation "Irad" => ModelWithCorners.prod (ModelWithCorners.prod (𝓡 1) 𝓘(ℝ, ℝ)) I₂
local notation "Iout" => ModelWithCorners.prod I₂ I₂
local instance : Fact (Module.finrank ℝ V = 1 + 1) := ⟨by simp⟩

/-- The actual radial absorption formula at the product face of `K`, as a
single smooth signed chart. The other disk coordinate is retained pointwise.
This chart covers the flat face and its open extension in the disk coordinate;
the eventual rounded rim requires its own choice of charts. -/
def splitAbsorptionFace (z₀ : Circle) :
    PartialDiffeomorph Irad Iout ((Circle × ℝ) × V) (V × V) ∞ where
  toFun p := ((1 + p.1.2) • p.1.1.val, p.2)
  invFun x := ((sphereDirection z₀ x.1, ‖x.1‖ - 1), x.2)
  source := {p | -1 < p.1.2}
  target := {x | x.1 ≠ 0}
  map_source' p hp := smul_ne_zero (by change -1 < p.1.2 at hp; linarith)
    (ne_zero_of_mem_unit_sphere p.1.1)
  map_target' x hx := by
    change -1 < ‖x.1‖ - 1
    linarith [norm_pos_iff.mpr (show x.1 ≠ 0 from hx)]
  left_inv' p hp := by
    have hr : 0 < 1 + p.1.2 := by change -1 < p.1.2 at hp; linarith
    refine Prod.ext ?_ rfl
    apply Prod.ext
    · exact sphereDirection_pos_smul z₀ p.1.1 hr
    · change ‖(1 + p.1.2) • p.1.1.val‖ - 1 = p.1.2
      rw [norm_smul, Real.norm_eq_abs, abs_of_pos hr, norm_eq_of_mem_sphere, mul_one]
      ring
  right_inv' x hx := by
    refine Prod.ext ?_ rfl
    change (1 + (‖x.1‖ - 1)) • (sphereDirection z₀ x.1).val = x.1
    rw [show 1 + (‖x.1‖ - 1) = ‖x.1‖ by ring]
    exact norm_smul_sphereDirection z₀ hx
  open_source := isOpen_lt continuous_const (continuous_snd.comp continuous_fst)
  open_target := isOpen_compl_singleton.preimage continuous_fst
  contMDiffOn_toFun := by
    apply ContMDiff.contMDiffOn
    exact ((contMDiff_const.add (contMDiff_snd.comp contMDiff_fst)).smul
      ((contMDiff_coe_sphere (n := 1)).comp (contMDiff_fst.comp contMDiff_fst))).prodMk contMDiff_snd
  contMDiffOn_invFun := by
    have hdir : ContMDiffOn Iout (𝓡 1) ∞
        (fun x : V × V => sphereDirection z₀ x.1) {x | x.1 ≠ 0} :=
      (contMDiffOn_sphereDirection z₀).comp contMDiff_fst.contMDiffOn (fun _ hx => hx)
    have hnorm : ContMDiffOn Iout 𝓘(ℝ, ℝ) ∞
        (fun x : V × V => ‖x.1‖) {x | x.1 ≠ 0} := by
      intro x hx
      exact ((contDiffAt_norm ℝ hx).contMDiffAt.comp x contMDiff_fst.contMDiffAt).contMDiffWithinAt
    exact (hdir.prodMk (hnorm.sub contMDiffOn_const)).prodMk contMDiff_snd.contMDiffOn

/-- On the lower product body the same signed chart is the manuscript's
`(2-t)z` formula. On the other side it reads and returns the literal handle
coordinate. These equations keep both the angular and disk parameters. -/
theorem splitAbsorptionFace_product (z₀ z : Circle) (w : V) {t : ℝ} (ht : t ≤ 1) :
    let G := splitAbsorptionFace z₀
    G ((z, 1 - t), w) = ((2 - t) • z.val, w) ∧
      G.symm ((2 - t) • z.val, w) = ((z, 1 - t), w) := by
  dsimp only
  have hrad : 1 + (1 - t) = 2 - t := by ring
  have hf : splitAbsorptionFace z₀ ((z, 1 - t), w) = ((2 - t) • z.val, w) := by
    change ((1 + (1 - t)) • z.val, w) = _
    rw [hrad]
  exact ⟨hf, hf ▸ (splitAbsorptionFace z₀).left_inv (by change -1 < 1 - t; linarith)⟩

theorem splitAbsorptionFace_handle (z₀ : Circle) (x : V × V) (hx : x.1 ≠ 0) :
    let G := splitAbsorptionFace z₀
    G (G.symm x) = x ∧ ((G.symm x).1.2 ≤ 0 ↔ ‖x.1‖ ≤ 1) :=
  ⟨(splitAbsorptionFace z₀).right_inv hx, sub_nonpos⟩

end ClosedMarkedControl

end

end SmoothPoincare
