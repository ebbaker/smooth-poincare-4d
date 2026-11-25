import SmoothPoincare.Immersions.NormalCodazzi
import SmoothPoincare.Immersions.ParallelShapeCurvature
import DifferentialGeometry.Geometry.Connection.LeviCivita.Christoffel.Euclidean
import DifferentialGeometry.Topology.Morse.Defs

/-! # Normal second form and the height Hessian of an actual immersion -/

open DifferentialGeometry DifferentialGeometry.Geometry DifferentialGeometry.Geometry.Connection
open DifferentialGeometry.Geometry.Riemannian.Geodesic DifferentialGeometry.Topology.Morse
open FirstOrderTwistor Filter Manifold
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

open private gaussDefectModelValue secondFundamentalFormAmbientAt_apply
  from DifferentialGeometry.Geometry.Submanifold.SecondFundamentalForm.Pointwise
open private chartConnectionBilin chartConnectionBilin_apply
  from DifferentialGeometry.Geometry.Connection.LeviCivita.Chart.Koszul
open private chartConnectionBilin_differentiableAt chartConnectionBilin_symm
  from DifferentialGeometry.Geometry.Submanifold.Gauss

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  {g : SmoothRiemannianMetric I M} {o : ManifoldOrientation I M 4} {p : M}

local notation "V₅" => EuclideanSpace ℝ (Fin 5)
local notation "point" => extChartAt I p p
/-- Expression of a Euclidean hypersurface immersion in its centered source chart. -/
noncomputable abbrev IsometricHypersurface.localMap (F : IsometricHypersurface g) (q : M) :=
  writtenInExtChartAt I 𝓘(ℝ, V₅) q F.map

omit [FiniteDimensional ℝ E] [T2Space M] in
private theorem smooth_chartMap (F : IsometricHypersurface g) :
    ContDiffAt ℝ 3 (F.localMap p) point := by
  have h := (contMDiffAt_iff.mp (F.smooth.contMDiffAt (x := p))).2
  rw [ModelWithCorners.Boundaryless.range_eq_univ, contDiffWithinAt_univ] at h
  exact h.of_le (by decide : (3 : ℕ∞ω) ≤ ∞)

omit [FiniteDimensional ℝ E] [T2Space M] in
private theorem chartDifferential (F : IsometricHypersurface g) (u : E) :
    fderiv ℝ (F.localMap p) point u = mfderiv I 𝓘(ℝ,V₅) F.map p u :=
  (tangentLinearMapToModel_mfderiv_eq_fderiv_writtenInExtChartAt
    (F.smooth.mdifferentiableAt (by simp)) u).symm

omit [T2Space M] in
/-- In the centered manifold chart, the normal-valued Hessian defect is
exactly the second fundamental form of the same immersion. -/
theorem immersionChart_secondForm (F : IsometricHypersurface g)
    (A : E → E →L[ℝ] E →L[ℝ] E)
    (hA : ∀ X Y, A point X Y = chartChristoffelContraction g p X Y point) (X Y : E) :
    bundleMapCovDeriv A 0 (fderiv ℝ (F.localMap p)) point X Y =
      secondFundamentalFormAmbientAt g euclideanMetric F.map p X Y := by
  let e := tangentSpaceModelContinuousLinearEquiv (I := I) p
  change _ = secondFundamentalFormAmbientAt g euclideanMetric F.map p (e.symm X) (e.symm Y)
  rw [secondFundamentalFormAmbientAt_apply g euclideanMetric F.map p (e.symm X) (e.symm Y)]
  change _ = gaussDefectModelValue g euclideanMetric F.map p X Y
  simp only [gaussDefectModelValue, chartChristoffelContraction_euclideanMetric, add_zero,
    bundleMapCovDeriv, Pi.zero_apply, zero_apply, hA]
  rw [chartDifferential F]
  rfl

omit [I.Boundaryless] [T2Space M] in
/-- A principal frame places the full bilinear second fundamental form
in the normal line for all tangent arguments. -/
theorem principalFrame_secondForm_mem_line {F : IsometricHypersurface g}
    (P : PrincipalFrameAt F o p) (u v : TangentSpace I p) :
    ∃ s : ℝ, secondFundamentalFormAmbientAt g euclideanMetric F.map p u v = s • P.normal := by
  classical
  let b : Module.Basis (Fin 4) ℝ E := P.frame.basis
  let II : E →L[ℝ] E →L[ℝ] V₅ := secondFundamentalFormAmbientAt g euclideanMetric F.map p
  have hlin : ∀ i j, II (b i) (b j) ∈ Submodule.span ℝ ({P.normal} : Set V₅) := by
    intro i j
    rw [show II (b i) (b j) = _ from P.principal i j]
    exact Submodule.smul_mem _ _ (Submodule.subset_span (Set.mem_singleton _))
  suffices hm : II u v ∈ Submodule.span ℝ ({P.normal} : Set V₅) by
    obtain ⟨s, hs⟩ := Submodule.mem_span_singleton.mp hm
    exact ⟨s, hs.symm⟩
  let uE : E := u
  let vE : E := v
  change II uE vE ∈ _
  rw [← b.sum_repr uE, ← b.sum_repr vE]
  simp only [map_sum, map_smul, sum_apply, smul_apply]
  exact Submodule.sum_mem _ fun i _ => Submodule.smul_mem _ _ (Submodule.sum_mem _ fun j _ =>
    Submodule.smul_mem _ _ (hlin j i))

omit [T2Space M] in
/-- The two-form here is computed on the written immersion in its centered
chart. A unit normal germ through the supplied point normal suffices. -/
theorem immersionChart_normalCodazzi {F : IsometricHypersurface g} (P : PrincipalFrameAt F o p)
    (n : E → V₅) (hn : DifferentiableAt ℝ n point)
    (hunit : ∀ᶠ y in 𝓝 point, inner ℝ (n y) (n y) = 1) (hnp : n point = P.normal)
    (X Y Z : E) :
    let A := metricChartConnectionForm g p
    chartCovDerivTwo A (chartNormalForm A (F.localMap p) n) point X Y Z =
      chartCovDerivTwo A (chartNormalForm A (F.localMap p) n) point Y X Z := by
  intro A
  have hA : DifferentiableAt ℝ A point := chartConnectionBilin_differentiableAt g p (by
    rw [(isOpen_extChartAt_target p).interior_eq]
    exact mem_extChartAt_target p)
  apply chartNormalForm_codazzi A _ n hA (smooth_chartMap F) hn hunit
  · intro v
    rw [hnp]
    calc
      _ = inner ℝ P.normal (fderiv ℝ (F.localMap p) point v) := real_inner_comm _ _
      _ = 0 := (congrArg (inner ℝ P.normal) (chartDifferential F v)).trans (P.perpendicular v)
  · intro v w
    rw [hnp, immersionChart_secondForm F A (fun a b => chartConnectionBilin_apply g p point a b)]
    exact principalFrame_secondForm_mem_line P v w
  · exact fun a b => chartConnectionBilin_symm g p point a b

/-- Height in the specified ambient direction of the same Euclidean immersion. -/
noncomputable def immersionHeight (F : IsometricHypersurface g) (v : V₅) (q : M) : ℝ :=
  inner ℝ v (F.map q)

omit [FiniteDimensional ℝ E] [I.Boundaryless] [T2Space M] in
theorem immersionHeight_critical_iff (F : IsometricHypersurface g) (v : V₅) :
    IsCriticalPointAt I (immersionHeight F v) p ↔
      ∀ u : TangentSpace I p, inner ℝ v (mfderiv I 𝓘(ℝ,V₅) F.map p u) = 0 := by
  let L := innerSL ℝ v
  change mfderiv I 𝓘(ℝ,ℝ) (L ∘ F.map) p = 0 ↔ _
  rw [mfderiv_comp p L.differentiableAt.mdifferentiableAt
    (F.smooth.mdifferentiableAt (by simp)), mfderiv_eq_fderiv, L.fderiv]
  constructor
  · intro h u
    exact DFunLike.congr_fun h u
  · intro h
    ext u
    exact h u

private theorem linearHeightHessian {V W : Type*}
    [NormedAddCommGroup V] [NormedSpace ℝ V] [NormedAddCommGroup W] [NormedSpace ℝ W]
    (L : W →L[ℝ] ℝ) {f : V → W} {x : V} (hf : ContDiffAt ℝ 2 f x) (u v : V) :
    chartHessianBilinAt (L ∘ f) x u v = L (fderiv ℝ (fderiv ℝ f) x u v) := by
  have hnear : fderiv ℝ (L ∘ f) =ᶠ[𝓝 x] fun y => L.comp (fderiv ℝ f y) := by
    filter_upwards [hf.eventually (by norm_num)] with y hy
    rw [fderiv_comp y L.differentiableAt (hy.differentiableAt (by norm_num)), L.fderiv]
  change fderiv ℝ (fderiv ℝ (L ∘ f)) x u v = _
  rw [hnear.fderiv_eq]
  have hj := (hf.fderiv_right (m := 1) (by norm_num)).differentiableAt (by norm_num)
  have hd := ((hasFDerivAt_const L x).clm_comp hj.hasFDerivAt).fderiv
  rw [hd]
  simp

omit [T2Space M] in
/-- At a chosen principal normal, the bilinear chart Hessian of the actual
height is the signed principal matrix. A negative multiple reverses all
signs, so this statement also covers the opposite normal. -/
theorem principalHeight_hessian {F : IsometricHypersurface g} (P : PrincipalFrameAt F o p)
    (s : ℝ) (i j : Fin 4) :
    chartHessianBilinAt (fun z => immersionHeight F (s • P.normal) ((extChartAt I p).symm z))
      point (P.frame.basis i) (P.frame.basis j) =
        if i = j then s * P.curvature i else 0 := by
  let X : E := P.frame.basis i
  let Y : E := P.frame.basis j
  let L := innerSL ℝ (s • P.normal)
  let f := F.localMap p
  have hfun : (fun z => immersionHeight F (s • P.normal) ((extChartAt I p).symm z)) = L ∘ f := by
    funext z
    simp [immersionHeight, L, f, writtenInExtChartAt, real_inner_smul_left]
  change chartHessianBilinAt _ point X Y = _
  rw [hfun]
  have hf : ContDiffAt ℝ 2 f point := (smooth_chartMap (p := p) F).of_le (by norm_num)
  rw [linearHeightHessian L hf X Y]
  let A := metricChartConnectionForm g p
  have hII := immersionChart_secondForm F (p := p) A (fun a b => chartConnectionBilin_apply g p point a b) X Y
  change fderiv ℝ (fderiv ℝ f) point X Y + 0 - (fderiv ℝ f point) (A point X Y) =
    secondFundamentalFormAmbientAt g euclideanMetric F.map p (P.frame.basis i) (P.frame.basis j) at hII
  rw [add_zero, P.principal i j] at hII
  have h0 : L (fderiv ℝ f point (A point X Y)) = 0 := by
    change inner ℝ (s • P.normal) (fderiv ℝ (F.localMap p) point _) = _
    rw [real_inner_smul_left, chartDifferential F]
    exact mul_eq_zero_of_right _ (P.perpendicular _)
  change L (fderiv ℝ (fderiv ℝ f) point X Y) = _
  rw [sub_eq_iff_eq_add.mp hII, map_add, h0, add_zero]
  change inner ℝ (s • P.normal) ((if i = j then P.curvature i else 0) • P.normal) = _
  by_cases h : i = j
  · simp only [h, ite_true, real_inner_smul_left, real_inner_smul_right, P.unit, mul_one]
    ring
  · simp only [h, ite_false, zero_smul, inner_zero_right]

end SmoothPoincare
