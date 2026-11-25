import Mathlib.Geometry.Manifold.Diffeomorph

/-!
# Smooth reassembly from two marked open patches

The core and exterior maps of a supplied cut include open collars. A common
collar homeomorphism identifies both overlaps and gives the forward agreement.
The inverse agreement and the global diffeomorphism follow from these data.
-/

open Set
open scoped ContDiff Manifold

namespace FirstOrderTwistor

variable {𝕜 : Type*} [NontriviallyNormedField 𝕜]
  {E : Type*} [NormedAddCommGroup E] [NormedSpace 𝕜 E]
  {F : Type*} [NormedAddCommGroup F] [NormedSpace 𝕜 F]
  {H : Type*} [TopologicalSpace H] {K : Type*} [TopologicalSpace K]
  {M : Type*} [TopologicalSpace M] [ChartedSpace H M]
  {Xhat : Type*} [TopologicalSpace Xhat] [ChartedSpace K Xhat]

/-- Both open covers and the common collar map for a marked cut. The collar's
source and target are the full open overlaps, so its inverse identifies the two
inverse germs as well. The patch maps include their prescribed smoothness. -/
structure SmoothCutGluing (I : ModelWithCorners 𝕜 E H) (J : ModelWithCorners 𝕜 F K)
    (M : Type*) [TopologicalSpace M] [ChartedSpace H M]
    (Xhat : Type*) [TopologicalSpace Xhat] [ChartedSpace K Xhat] where
  core : OpenPartialHomeomorph M Xhat
  exterior : OpenPartialHomeomorph M Xhat
  collar : OpenPartialHomeomorph M Xhat
  source_cover : core.source ∪ exterior.source = univ
  target_cover : core.target ∪ exterior.target = univ
  collar_source : collar.source = core.source ∩ exterior.source
  collar_target : collar.target = core.target ∩ exterior.target
  core_eq_collar : EqOn core collar collar.source
  exterior_eq_collar : EqOn exterior collar collar.source
  core_smooth : ContMDiffOn I J ∞ core core.source
  core_symm_smooth : ContMDiffOn J I ∞ core.symm core.target
  exterior_smooth : ContMDiffOn I J ∞ exterior exterior.source
  exterior_symm_smooth : ContMDiffOn J I ∞ exterior.symm exterior.target

namespace SmoothCutGluing

variable {I : ModelWithCorners 𝕜 E H} {J : ModelWithCorners 𝕜 F K}
  (d : SmoothCutGluing I J M Xhat)

theorem core_eq_exterior : EqOn d.core d.exterior (d.core.source ∩ d.exterior.source) := by
  intro x hx
  have hcollar : x ∈ d.collar.source := d.collar_source ▸ hx
  exact (d.core_eq_collar hcollar).trans (d.exterior_eq_collar hcollar).symm

theorem core_symm_eq_collar : EqOn d.core.symm d.collar.symm d.collar.target := by
  intro y hy
  have hx := d.collar.map_target hy
  have hsource : d.collar.symm y ∈ d.core.source ∩ d.exterior.source := d.collar_source ▸ hx
  have htarget : y ∈ d.core.target ∩ d.exterior.target := d.collar_target ▸ hy
  apply ((d.core.eq_symm_apply hsource.1 htarget.1).mpr ?_).symm
  exact (d.core_eq_collar hx).trans (d.collar.right_inv hy)

theorem exterior_symm_eq_collar : EqOn d.exterior.symm d.collar.symm d.collar.target := by
  intro y hy
  have hx := d.collar.map_target hy
  have hsource : d.collar.symm y ∈ d.core.source ∩ d.exterior.source := d.collar_source ▸ hx
  have htarget : y ∈ d.core.target ∩ d.exterior.target := d.collar_target ▸ hy
  apply ((d.exterior.eq_symm_apply hsource.2 htarget.2).mpr ?_).symm
  exact (d.exterior_eq_collar hx).trans (d.collar.right_inv hy)

theorem core_symm_eq_exterior_symm :
    EqOn d.core.symm d.exterior.symm (d.core.target ∩ d.exterior.target) := by
  intro y hy
  have hcollar : y ∈ d.collar.target := d.collar_target ▸ hy
  exact (d.core_symm_eq_collar hcollar).trans (d.exterior_symm_eq_collar hcollar).symm

theorem collar_smooth : ContMDiffOn I J ∞ d.collar d.collar.source := by
  apply d.core_smooth.congr_mono d.core_eq_collar.symm
  rw [d.collar_source]
  exact inter_subset_left

theorem collar_symm_smooth : ContMDiffOn J I ∞ d.collar.symm d.collar.target := by
  apply d.core_symm_smooth.congr_mono d.core_symm_eq_collar.symm
  rw [d.collar_target]
  exact inter_subset_left

private noncomputable def forward : M → Xhat := by
  classical
  exact d.core.source.piecewise d.core d.exterior

private noncomputable def backward : Xhat → M := by
  classical
  exact d.core.target.piecewise d.core.symm d.exterior.symm

private theorem forward_eq_core : EqOn d.forward d.core d.core.source := by
  classical
  exact piecewise_eqOn _ _ _

private theorem forward_eq_exterior : EqOn d.forward d.exterior d.exterior.source := by
  classical
  intro x hx
  by_cases hcore : x ∈ d.core.source
  · exact (d.forward_eq_core hcore).trans (d.core_eq_exterior ⟨hcore, hx⟩)
  · exact piecewise_eq_of_notMem _ _ _ hcore

private theorem backward_eq_core : EqOn d.backward d.core.symm d.core.target := by
  classical
  exact piecewise_eqOn _ _ _

private theorem backward_eq_exterior : EqOn d.backward d.exterior.symm d.exterior.target := by
  classical
  intro y hy
  by_cases hcore : y ∈ d.core.target
  · exact (d.backward_eq_core hcore).trans (d.core_symm_eq_exterior_symm ⟨hcore, hy⟩)
  · exact piecewise_eq_of_notMem _ _ _ hcore

/-- Glue the smooth maps and their inverses on both open covers. -/
noncomputable def toDiffeomorph : Diffeomorph I J M Xhat ∞ where
  toFun := d.forward
  invFun := d.backward
  left_inv x := by
    have hx : x ∈ d.core.source ∪ d.exterior.source := d.source_cover ▸ mem_univ x
    rcases hx with hx | hx
    · rw [d.forward_eq_core hx, d.backward_eq_core (d.core.map_source hx), d.core.left_inv hx]
    · rw [d.forward_eq_exterior hx, d.backward_eq_exterior (d.exterior.map_source hx),
        d.exterior.left_inv hx]
  right_inv y := by
    have hy : y ∈ d.core.target ∪ d.exterior.target := d.target_cover ▸ mem_univ y
    rcases hy with hy | hy
    · rw [d.backward_eq_core hy, d.forward_eq_core (d.core.map_target hy), d.core.right_inv hy]
    · rw [d.backward_eq_exterior hy, d.forward_eq_exterior (d.exterior.map_target hy),
        d.exterior.right_inv hy]
  contMDiff_toFun := contMDiff_of_contMDiffOn_union_of_isOpen
    (d.core_smooth.congr d.forward_eq_core) (d.exterior_smooth.congr d.forward_eq_exterior)
    d.source_cover d.core.open_source d.exterior.open_source
  contMDiff_invFun := contMDiff_of_contMDiffOn_union_of_isOpen
    (d.core_symm_smooth.congr d.backward_eq_core)
    (d.exterior_symm_smooth.congr d.backward_eq_exterior)
    d.target_cover d.core.open_target d.exterior.open_target

theorem toDiffeomorph_eq_core : EqOn d.toDiffeomorph d.core d.core.source :=
  d.forward_eq_core

theorem toDiffeomorph_eq_exterior : EqOn d.toDiffeomorph d.exterior d.exterior.source :=
  d.forward_eq_exterior

theorem toDiffeomorph_eq_collar : EqOn d.toDiffeomorph d.collar d.collar.source := by
  intro x hx
  have hsource : x ∈ d.core.source ∩ d.exterior.source := d.collar_source ▸ hx
  exact (d.toDiffeomorph_eq_core hsource.1).trans (d.core_eq_collar hx)

theorem toDiffeomorph_symm_eq_core : EqOn d.toDiffeomorph.symm d.core.symm d.core.target :=
  d.backward_eq_core

theorem toDiffeomorph_symm_eq_exterior :
    EqOn d.toDiffeomorph.symm d.exterior.symm d.exterior.target :=
  d.backward_eq_exterior

theorem toDiffeomorph_symm_eq_collar :
    EqOn d.toDiffeomorph.symm d.collar.symm d.collar.target := by
  intro y hy
  have htarget : y ∈ d.core.target ∩ d.exterior.target := d.collar_target ▸ hy
  exact (d.toDiffeomorph_symm_eq_core htarget.1).trans (d.core_symm_eq_collar hy)

end SmoothCutGluing

end FirstOrderTwistor
