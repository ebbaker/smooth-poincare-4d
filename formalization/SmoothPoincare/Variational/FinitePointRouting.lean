import DifferentialGeometry.Topology.Manifold.InteriorAtlas
import DifferentialGeometry.Topology.Manifold.PuncturedConnected
import DifferentialGeometry.Topology.Manifold.SupportedPointMotion
import Mathlib.Topology.Algebra.Module.PerfectSpace

/-! # Smooth ambient routing of finitely many labeled points -/

open Set
open scoped ContDiff Manifold

namespace SmoothPoincare

local notation "V₄" => EuclideanSpace ℝ (Fin 4)

variable {H M : Type*} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {I : ModelWithCorners ℝ V₄ H} [I.Boundaryless] [T2Space M] [PreconnectedSpace M]

include I in
/-- Removing finitely many points from a connected boundaryless four-manifold
leaves a preconnected open set. -/
theorem isPreconnected_compl_finset_four (s : Finset M) :
    IsPreconnected ((s : Set M)ᶜ) := by
  classical
  induction s using Finset.induction_on with
  | empty => simpa using (isPreconnected_univ : IsPreconnected (univ : Set M))
  | insert p s hp ih =>
    let U : TopologicalSpace.Opens M := ⟨(s : Set M)ᶜ, s.finite_toSet.isClosed.isOpen_compl⟩
    let _ : PreconnectedSpace U := isPreconnected_iff_preconnectedSpace.mp ih
    let p' : U := ⟨p, hp⟩
    have hdim : 1 < Module.rank ℝ V₄ := by
      rw [← Module.finrank_eq_rank]
      simp
    have hc := (I.isPathConnected_compl_singleton hdim p').isConnected.isPreconnected
    have heq : Subtype.val '' ({p'}ᶜ : Set U) = ((↑(insert p s) : Set M)ᶜ) := by
      ext x
      constructor
      · rintro ⟨z, hz, rfl⟩ hzs
        rcases Finset.mem_insert.mp hzs with hzp | hzs
        · exact hz (Subtype.ext hzp)
        · exact z.property hzs
      · intro hx
        let z : U := ⟨x, fun hxs => hx (Finset.mem_insert.mpr (Or.inr hxs))⟩
        refine ⟨z, ?_, rfl⟩
        intro he
        exact hx (Finset.mem_insert.mpr (Or.inl (congrArg Subtype.val he)))
    rw [← heq]
    exact hc.image Subtype.val continuous_subtype_val.continuousOn

variable [IsManifold I ∞ M]

private theorem exists_move_fix_finset (s : Finset M) (x y : M)
    (hx : x ∉ s) (hy : y ∉ s) :
    ∃ D : M ≃ₘ⟮I, I⟯ M, D x = y ∧ ∀ z ∈ s, D z = z := by
  let _ : ChartedSpace V₄ M := DifferentialGeometry.Manifold.interiorChartedSpace I ∞
  let _ : IsManifold (𝓡 4) ∞ M := DifferentialGeometry.Manifold.interiorIsManifold I ∞
  let A := DifferentialGeometry.Manifold.interiorAtlasDiffeomorph I ∞ (M := M)
  let U : Set M := (s : Set M)ᶜ
  obtain ⟨J, _, hJ, _, _, K, _, hKU, hfix⟩ :=
    DifferentialGeometry.Topology.exists_supported_isotopy_apply_eq_of_isPreconnected
      (E := V₄) U s.finite_toSet.isClosed.isOpen_compl
      (isPreconnected_compl_finset_four (I := I) s) x y hx hy
  refine ⟨(A.trans (J 1)).trans A.symm, hJ, ?_⟩
  intro z hz
  exact (hfix 1 z (fun hzK => hKU hzK hz)).1

/-- One smooth ambient diffeomorphism sends every labeled source point to
its assigned target. Each family consists of distinct points. -/
theorem exists_finitePointRouting {ι : Type*} [Finite ι] (source target : ι → M)
    (hsource : Function.Injective source) (htarget : Function.Injective target) :
    ∃ D : M ≃ₘ⟮I, I⟯ M, ∀ i, D (source i) = target i := by
  classical
  have route (s : Finset ι) : ∃ D : M ≃ₘ⟮I, I⟯ M, ∀ i ∈ s, D (source i) = target i := by
    induction s using Finset.induction_on with
    | empty => exact ⟨Diffeomorph.refl I M ∞, by simp⟩
    | insert i s hi ih =>
      obtain ⟨D, hD⟩ := ih
      let fixed := s.image target
      have hcurrent : D (source i) ∉ fixed := by
        intro hm
        obtain ⟨j, hj, hEq⟩ := Finset.mem_image.mp hm
        have hij := hsource (D.injective (hEq.symm.trans (hD j hj).symm))
        exact hi (hij.symm ▸ hj)
      have hnext : target i ∉ fixed := by
        intro hm
        obtain ⟨j, hj, hEq⟩ := Finset.mem_image.mp hm
        exact hi (htarget hEq ▸ hj)
      obtain ⟨E, hE, hfix⟩ := exists_move_fix_finset (I := I) fixed
        (D (source i)) (target i) hcurrent hnext
      refine ⟨D.trans E, ?_⟩
      intro j hj
      change E (D (source j)) = target j
      rcases Finset.mem_insert.mp hj with rfl | hj
      · exact hE
      · rw [hD j hj, hfix (target j) (Finset.mem_image_of_mem target hj)]
  let _ := Fintype.ofFinite ι
  obtain ⟨D, hD⟩ := route Finset.univ
  exact ⟨D, fun i => hD i (Finset.mem_univ _)⟩

include I in
omit [T2Space M] [PreconnectedSpace M] in
private theorem exists_mem_open_outside_finset (s : Finset M) {U : Set M}
    (hU : IsOpen U) (hU' : U.Nonempty) : ∃ y ∈ U, y ∉ s := by
  obtain ⟨p, hp⟩ := hU'
  let e := DifferentialGeometry.PartialDiffeomorph.extChartAt I ∞ p
  let c := e.toOpenPartialHomeomorph
  have hps : p ∈ c.source := mem_extChartAt_source (I := I) p
  let V := c.target ∩ c.symm ⁻¹' U
  have hV : IsOpen V := c.isOpen_inter_preimage_symm hU
  have hpV : c p ∈ V :=
    ⟨c.map_source hps, by rwa [mem_preimage, c.left_inv hps]⟩
  let _ : PerfectSpace V₄ := perfectSpace_of_module ℝ V₄
  have hdense : Dense (univ \ (c '' (s : Set M))) :=
    dense_univ.sdiff_finite (s.finite_toSet.image c)
  obtain ⟨z, hs, hz⟩ := hdense.exists_mem_open hV ⟨c p, hpV⟩
  refine ⟨c.symm z, hz.2, ?_⟩
  intro hy
  exact hs.2 ⟨c.symm z, hy, c.right_inv hz.1⟩

/-- One ambient diffeomorphism sends each labeled center into its assigned
nonempty open set. The opens may overlap. -/
theorem exists_finitePointRouting_into_opens {ι : Type*} [Finite ι] (source : ι → M)
    (hsource : Function.Injective source) (V : ι → Set M)
    (ho : ∀ i, IsOpen (V i)) (hn : ∀ i, (V i).Nonempty) :
    ∃ D : M ≃ₘ⟮I, I⟯ M, ∀ i, D (source i) ∈ V i := by
  classical
  have route (s : Finset ι) :
      ∃ D : M ≃ₘ⟮I, I⟯ M, ∀ i ∈ s, D (source i) ∈ V i := by
    induction s using Finset.induction_on with
    | empty => exact ⟨Diffeomorph.refl I M ∞, by simp⟩
    | insert i s hi ih =>
      obtain ⟨D, hD⟩ := ih
      let fixed := s.image (fun j => D (source j))
      have hcurrent : D (source i) ∉ fixed := by
        intro hm
        obtain ⟨j, hj, hEq⟩ := Finset.mem_image.mp hm
        exact hi ((hsource (D.injective hEq)) ▸ hj)
      obtain ⟨y, hy, hyfixed⟩ := exists_mem_open_outside_finset (I := I) fixed (ho i) (hn i)
      obtain ⟨E, hE, hfix⟩ := exists_move_fix_finset (I := I) fixed
        (D (source i)) y hcurrent hyfixed
      refine ⟨D.trans E, ?_⟩
      intro j hj
      change E (D (source j)) ∈ V j
      rcases Finset.mem_insert.mp hj with rfl | hj
      · simpa only [hE] using hy
      · rw [hfix (D (source j)) (Finset.mem_image_of_mem _ hj)]
        exact hD j hj
  let _ := Fintype.ofFinite ι
  obtain ⟨D, hD⟩ := route Finset.univ
  exact ⟨D, fun i => hD i (Finset.mem_univ _)⟩

end SmoothPoincare
