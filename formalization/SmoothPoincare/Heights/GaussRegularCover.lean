import DifferentialGeometry.Topology.Manifold.InverseFunction
import Mathlib.Topology.DiscreteSubset
import SmoothPoincare.Heights.GaussSheets

/-! # Disjoint measurable Gauss sheets from local invertibility -/

open DifferentialGeometry Function MeasureTheory Set
open scoped ContDiff ENNReal Manifold Topology

namespace SmoothPoincare

section RegularCover

variable {E F H K M N : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
  [TopologicalSpace H] [TopologicalSpace K]
  {I : ModelWithCorners ℝ E H} {J : ModelWithCorners ℝ F K}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [PolishSpace M] [Nonempty M]
  [TopologicalSpace N] [ChartedSpace K N] [IsManifold J ∞ N] [T2Space N]

private local instance : MeasurableSpace E := borel E
private local instance : BorelSpace E := ⟨rfl⟩
private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩
private local instance : MeasurableSpace N := borel N
private local instance : BorelSpace N := ⟨rfl⟩

/-- Disjoint domain sheets with the chart of the source retained for each
    sheet. The target images may overlap. -/
structure GaussRegularSheets (n : M → N) (U : Set M) where
  sheet : ℕ → Set M
  measurableSheet : ∀ i, MeasurableSet (sheet i)
  disjoint : Pairwise (Disjoint on sheet)
  covers : (⋃ i, sheet i) = U
  injectiveOn : ∀ i, InjOn n (sheet i)
  measurableImage : ∀ i, MeasurableSet (n '' sheet i)
  chartCenter : ℕ → M
  subordinate : ∀ i, sheet i ⊆ (chartAt H (chartCenter i)).source

omit [FiniteDimensional ℝ E] [FiniteDimensional ℝ F] [IsManifold I ∞ M] [IsManifold J ∞ N] in
/-- Countably many local inverse charts suffice, and disjointification of
    their source sets preserves injectivity and the source chart. -/
theorem exists_gaussRegularSheets_of_localDiffeomorph {n : M → N} {U : Set M}
    (hU : IsOpen U) (hn : ContMDiffOn I J ∞ n U)
    (hlocal : ∀ x ∈ U, IsLocalDiffeomorphAt I J ∞ n x) :
    Nonempty (GaussRegularSheets (H := H) n U) := by
  classical
  by_cases hEmpty : U = ∅
  · subst U
    obtain ⟨x⟩ := ‹Nonempty M›
    refine ⟨⟨fun _ => ∅, fun _ => MeasurableSet.empty, ?_, by simp,
      fun _ => injOn_empty n, by simp, fun _ => x, by simp⟩⟩
    exact fun _ _ _ => by simp
  choose Φ hΦmem hΦeq using fun x : U => hlocal x x.property
  let W : U → Set M := fun x => U ∩ (chartAt H (x : M)).source ∩ (Φ x).source
  have hOpen : ∀ x, IsOpen (W x) := fun x =>
    (hU.inter (chartAt H (x : M)).open_source).inter (Φ x).open_source
  have hCover : (⋃ x, W x) = U := by
    ext x
    constructor
    · intro hx
      obtain ⟨z, hz⟩ := mem_iUnion.mp hx
      exact hz.1.1
    · intro hx
      exact mem_iUnion.mpr ⟨⟨x, hx⟩, ⟨hx, mem_chart_source H x⟩, hΦmem ⟨x, hx⟩⟩
  obtain ⟨L, hLcount, hLcover⟩ := TopologicalSpace.isOpen_iUnion_countable W hOpen
  obtain ⟨x, hx⟩ := nonempty_iff_ne_empty.mpr hEmpty
  have hxL : x ∈ ⋃ z ∈ L, W z := by rwa [hLcover, hCover]
  obtain ⟨z, hz, _⟩ := mem_iUnion₂.mp hxL
  let : Countable L := hLcount.to_subtype
  let : Nonempty L := ⟨⟨z, hz⟩⟩
  obtain ⟨idx, hidx⟩ := exists_surjective_nat L
  let V : ℕ → Set M := fun i => W (idx i).val
  have hVcover : (⋃ i, V i) = U := by
    rw [← hCover, ← hLcover]
    ext y
    constructor
    · intro hy
      obtain ⟨i, hi⟩ := mem_iUnion.mp hy
      exact mem_iUnion₂.mpr ⟨(idx i).val, (idx i).property, hi⟩
    · intro hy
      obtain ⟨a, ha, hya⟩ := mem_iUnion₂.mp hy
      obtain ⟨i, hi⟩ := hidx ⟨a, ha⟩
      exact mem_iUnion.mpr ⟨i, by change y ∈ W (idx i).val; rw [hi]; exact hya⟩
  let S : ℕ → Set M := disjointed V
  have hSub (i : ℕ) : S i ⊆ V i := disjointed_subset V i
  have hMeas (i : ℕ) : MeasurableSet (S i) :=
    MeasurableSet.disjointed (fun j => (hOpen (idx j).val).measurableSet) i
  have hSU (i : ℕ) : S i ⊆ U := fun _ hy => (hSub i hy).1.1
  have hInj (i : ℕ) : InjOn n (S i) := by
    intro a ha b hb hab
    have ha' := (hSub i ha).2
    have hb' := (hSub i hb).2
    apply (Φ (idx i).val).toPartialEquiv.injOn ha' hb'
    rw [← hΦeq (idx i).val ha', ← hΦeq (idx i).val hb']
    exact hab
  refine ⟨⟨S, hMeas, disjoint_disjointed V, ?_, hInj,
    fun i => (hMeas i).image_of_continuousOn_injOn (hn.continuousOn.mono (hSU i)) (hInj i),
    fun i => ((idx i).val : M), fun i _ hy => (hSub i hy).1.2⟩⟩
  rw [iUnion_disjointed, hVcover]

variable [I.Boundaryless]

omit [FiniteDimensional ℝ E] [FiniteDimensional ℝ F] [Nonempty M] [IsManifold J ∞ N] [T2Space N] in
/-- The retained chart parameterizes the sheet on a measurable coordinate
    subset and carries the smooth normal map on its open chart domain. -/
theorem GaussRegularSheets.parametrization {n : M → N} {U : Set M}
    (S : GaussRegularSheets (H := H) n U) (hU : IsOpen U) (hn : ContMDiffOn I J ∞ n U)
    (i : ℕ) :
    ∃ (p : E → M) (O B : Set E),
      p = ((extChartAt I (S.chartCenter i)).symm : E → M) ∧
      B = (extChartAt I (S.chartCenter i)) '' S.sheet i ∧ IsOpen O ∧ MeasurableSet B ∧ B ⊆ O ∧
      ContMDiffOn 𝓘(ℝ, E) I 1 p O ∧ ContMDiffOn 𝓘(ℝ, E) J 1 (n ∘ p) O ∧
      InjOn p B ∧ p '' B = S.sheet i := by
  let C := DifferentialGeometry.PartialDiffeomorph.extChartAt I ∞ (S.chartCenter i)
  have hsub : S.sheet i ⊆ C.source := by
    change S.sheet i ⊆ (extChartAt I (S.chartCenter i)).source
    rw [extChartAt_source]
    exact S.subordinate i
  have hSU : S.sheet i ⊆ U := fun _ hx => S.covers ▸ subset_iUnion S.sheet i hx
  let O : Set E := C.target ∩ C.symm ⁻¹' U
  have hO : IsOpen O := C.contMDiffOn_invFun.continuousOn.isOpen_inter_preimage C.open_target hU
  have hp : ContMDiffOn 𝓘(ℝ, E) I ∞ C.symm O :=
    C.contMDiffOn_invFun.mono inter_subset_left
  let B : Set E := C '' S.sheet i
  have hB : MeasurableSet B :=
    (S.measurableSheet i).image_of_continuousOn_injOn (C.contMDiffOn.continuousOn.mono hsub)
      (C.toPartialEquiv.injOn.mono hsub)
  have hBO : B ⊆ O := by
    rintro _ ⟨x, hx, rfl⟩
    refine ⟨C.toPartialEquiv.map_source (hsub hx), ?_⟩
    change C.toPartialEquiv.symm (C x) ∈ U
    rw [C.toPartialEquiv.left_inv (hsub hx)]
    exact hSU hx
  have hnp : ContMDiffOn 𝓘(ℝ, E) J ∞ (n ∘ C.symm) O :=
    hn.comp hp (fun _ hy => hy.2)
  refine ⟨C.symm, O, B, rfl, rfl, hO, hB, hBO, hp.of_le (by simp), hnp.of_le (by simp),
    C.toPartialEquiv.symm.injOn.mono (hBO.trans inter_subset_left), ?_⟩
  ext x
  constructor
  · rintro ⟨_, ⟨y, hy, rfl⟩, rfl⟩
    change C.toPartialEquiv.symm (C y) ∈ S.sheet i
    rw [C.toPartialEquiv.left_inv (hsub hy)]
    exact hy
  · intro hx
    exact ⟨C x, ⟨x, hx, rfl⟩, C.toPartialEquiv.left_inv (hsub hx)⟩

end RegularCover

section Immersion

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [PolishSpace M] [Nonempty M]

local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 5)) = 4 + 1) := ⟨by simp⟩

/-- For the actual immersion's normal, invertibility of the Gauss derivative
    on the open locus supplies the local inverse premise by the pinned
    manifold inverse-function theorem. -/
theorem ImmersionGaussNormal.exists_regularSheets {g : SmoothRiemannianMetric I M}
    {F : IsometricHypersurface g} (N : ImmersionGaussNormal F) {U : Set M} (hU : IsOpen U)
    (hn : ContMDiffOn I (𝓡 4) ∞ N.normal U)
    (hInv : ∀ x ∈ U, (mfderiv I (𝓡 4) N.normal x).IsInvertible) :
    Nonempty (GaussRegularSheets (H := H) N.normal U) :=
  exists_gaussRegularSheets_of_localDiffeomorph hU hn fun x hx =>
    DifferentialGeometry.Topology.isLocalDiffeomorphAt_of_contMDiffOn_of_isInvertible_mfderiv
      hU hx hn (hInv x hx)

end Immersion

/-- On a compact source a full fiber of a regular value is finite. A fiber
    restricted to an open locus is handled by taking a subset of this fiber. -/
theorem gaussFiber_finite_of_compact_of_locallyInjective {M N : Type*} [TopologicalSpace M]
    [CompactSpace M] [TopologicalSpace N] [T1Space N] {n : M → N} (hn : Continuous n) (u : N)
    (hLocal : ∀ x ∈ n ⁻¹' ({u} : Set N),
      ∃ W : Set M, IsOpen W ∧ x ∈ W ∧ InjOn n W) :
    (n ⁻¹' ({u} : Set N)).Finite := by
  have hdiscrete : IsDiscrete (n ⁻¹' ({u} : Set N)) := by
    rw [isDiscrete_iff_forall_mem_exists_isOpen]
    intro x hx
    obtain ⟨W, hW, hxW, hInj⟩ := hLocal x hx
    refine ⟨W, hW, ?_⟩
    ext y
    constructor
    · intro hy
      exact mem_singleton_iff.mpr (hInj hy.1 hxW (hy.2.trans hx.symm))
    · intro hy
      obtain rfl := mem_singleton_iff.mp hy
      exact ⟨hxW, hx⟩
  have hcompact : IsCompact (n ⁻¹' ({u} : Set N)) := (isClosed_singleton.preimage hn).isCompact
  let : CompactSpace (n ⁻¹' ({u} : Set N)) := isCompact_iff_compactSpace.mp hcompact
  let : DiscreteTopology (n ⁻¹' ({u} : Set N)) := isDiscrete_iff_discreteTopology.mp hdiscrete
  let : Finite (n ⁻¹' ({u} : Set N)) := Finite.of_finite_univ isCompact_univ.finite_of_discrete
  exact Set.toFinite _

/-- If one exceptional direction set has zero area, the exceptional directions
    for either normal have zero mass also after normalizing. -/
theorem ae_avoid_two_normals_of_null {N : Type*} [MeasurableSpace N] (area : Measure N)
    (mass : ℝ) (opposite : N → N) (hop : MeasurePreserving opposite area area)
    (exceptional : Set N) (hNull : area exceptional = 0) :
    ∀ᵐ u ∂normalizedGaussDirections area mass, u ∉ exceptional ∧ opposite u ∉ exceptional := by
  have hAvoid : ∀ᵐ u ∂area, u ∉ exceptional := compl_mem_ae_iff.mpr hNull
  exact Measure.ae_smul_measure (hAvoid.and (hop.quasiMeasurePreserving.ae hAvoid))
    (ENNReal.ofReal mass)⁻¹

end SmoothPoincare
