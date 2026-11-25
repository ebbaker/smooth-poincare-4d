import SmoothPoincare.Immersions.ImmersionChart
import Mathlib.Analysis.Normed.Module.Normalize

/-! # A local unit normal from the actual immersion in a fixed chart -/

open Bundle DifferentialGeometry DifferentialGeometry.Geometry
open DifferentialGeometry.Geometry.Connection DifferentialGeometry.Geometry.Operator
open DifferentialGeometry.Geometry.Riemannian.Geodesic
open DifferentialGeometry.Tensor.Coordinates
open Filter Manifold Set
open scoped ContDiff Manifold Topology

open private chartMetricBilin_differentiableAt chartMetricBilin_fderiv
  chartConnectionBilin_symm from DifferentialGeometry.Geometry.Submanifold.Gauss

namespace SmoothPoincare

variable {E H M : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  {g : SmoothRiemannianMetric I M}

local notation "V₅" => EuclideanSpace ℝ (Fin 5)

/-- The covariant derivative of the written immersion derivative, with the
source Levi–Civita connection and the flat ambient connection. -/
noncomputable def hypersurfaceChartSecondForm (F : IsometricHypersurface g) (a : M)
    (y : E) (X Y : E) : V₅ :=
  bundleMapCovDeriv (metricChartConnectionForm g a) 0 (fderiv ℝ (F.localMap a)) y X Y

private theorem chartMetricBilin_euclidean (a z u v : V₅) :
    chartMetricBilin euclideanMetric a z u v = inner ℝ u v := by
  rw [chartMetricBilin_apply]
  simp only [trivFromE, TangentBundle.symmL_model_space, euclideanMetric_inner]
  rfl

omit [FiniteDimensional ℝ E] [I.Boundaryless] [T2Space M] in
/-- The written immersion is smooth on the entire target of the fixed chart. -/
theorem IsometricHypersurface.localMap_contDiffOn (F : IsometricHypersurface g) (a : M) :
    ContDiffOn ℝ ∞ (F.localMap a) (extChartAt I a).target := by
  have h := F.smooth.comp_contMDiffOn (contMDiffOn_extChartAt_symm (n := ∞) a)
  simpa [IsometricHypersurface.localMap, writtenInExtChartAt] using
    (contMDiffOn_iff_contDiffOn.mp h)

omit [I.Boundaryless] [T2Space M] in
private theorem chartConnectionApplied_smoothAt (a : M) (X Y : E) {y : E}
    (hy : y ∈ interior (extChartAt I a).target) :
    ContDiffAt ℝ ∞ (fun z => metricChartConnectionForm g a z X Y) y := by
  simp_rw [metricChartConnectionForm_apply]
  unfold chartChristoffelContraction
  refine ContDiffAt.sum fun k _ => ?_
  apply ContDiffAt.smul _ contDiffAt_const
  refine ContDiffAt.sum fun i _ => ContDiffAt.sum fun j _ => ?_
  have h := (chartChristoffel_contDiffOn_interior g a i j k).contDiffAt
    (isOpen_interior.mem_nhds hy)
  exact (h.mul contDiffAt_const).mul contDiffAt_const

omit [T2Space M] in
/-- In the fixed chart, the covariant second derivative of the immersion is
perpendicular to its first derivative on a neighborhood of the center. -/
theorem hypersurfaceChartSecondForm_perpendicular (F : IsometricHypersurface g) (a : M) :
    ∀ᶠ y in 𝓝 (extChartAt I a a), ∀ X Y V : E,
      inner ℝ (hypersurfaceChartSecondForm F a y X Y)
        (fderiv ℝ (F.localMap a) y V) = 0 := by
  let f := F.localMap a
  let A := metricChartConnectionForm g a
  let K := chartMetricBilin g a
  let G : E → V₅ →L[ℝ] V₅ →L[ℝ] ℝ := fun _ => innerSL ℝ
  let z := extChartAt I a a
  have hz : z ∈ interior (extChartAt I a).target := by
    rw [(isOpen_extChartAt_target a).interior_eq]
    exact mem_extChartAt_target a
  have hF : ContDiffAt ℝ 2 f z :=
    ((F.localMap_contDiffOn a z (interior_subset hz)).contDiffAt
      ((isOpen_extChartAt_target a).mem_nhds (interior_subset hz))).of_le (by simp)
  have hIsom : ∀ᶠ y in 𝓝 z, ∀ u v : E,
      G y (fderiv ℝ f y u) (fderiv ℝ f y v) = K y u v := by
    filter_upwards [chartMetricBilin_pullback_eventually_of_inner_map F.smooth F.isometric a] with y hy
    intro u v
    change inner ℝ (fderiv ℝ f y u) (fderiv ℝ f y v) = K y u v
    simpa only [chartMetricBilin_euclidean] using hy u v
  filter_upwards [hF.eventually (by norm_num), isOpen_interior.mem_nhds hz,
    hIsom.eventually_nhds] with y hyF hy hyMetric
  intro X Y V
  have hJ := (hyF.fderiv_right (m := 1) (by norm_num)).differentiableAt (by norm_num)
  have hG : DifferentiableAt ℝ G y := differentiableAt_const _
  have hCompat : ∀ U u v, fderiv ℝ G y U u v =
      G y ((0 : E → E →L[ℝ] V₅ →L[ℝ] V₅) y U u) v +
      G y u ((0 : E → E →L[ℝ] V₅ →L[ℝ] V₅) y U v) := by
    intro U u v
    simp [G]
  have hSymm : ∀ U u, bundleMapCovDeriv A 0 (fderiv ℝ f) y U u =
      bundleMapCovDeriv A 0 (fderiv ℝ f) y u U := by
    intro U u
    have hPull : pullbackConnectionForm (0 : V₅ → V₅ →L[ℝ] V₅ →L[ℝ] V₅) f = 0 := by
      ext x v w
      simp [pullbackConnectionForm]
    simpa only [hPull] using
      bundleMapCovDeriv_fderiv_symmetric (A := A) (C := 0) hyF
        (chartConnectionBilin_symm g a y) (by simp) U u
  exact bundleMapCovDeriv_orthogonal_of_symmetric hJ hG
    (chartMetricBilin_differentiableAt g a hy) (by
      intro u v
      change inner ℝ u v = inner ℝ v u
      exact real_inner_comm v u)
    hCompat (chartMetricBilin_fderiv g a (interior_subset hy)) hyMetric hSymm X Y V

omit [T2Space M] in
/-- For fixed chart vectors, the actual second form is smooth at every point
in the open chart target. -/
theorem hypersurfaceChartSecondForm_smoothAt (F : IsometricHypersurface g) (a : M)
    (X Y : E) {z : E} (hz : z ∈ (extChartAt I a).target) :
    ContDiffAt ℝ ∞ (fun y => hypersurfaceChartSecondForm F a y X Y) z := by
  let f := F.localMap a
  have hF := (F.localMap_contDiffOn a z hz).contDiffAt
    ((isOpen_extChartAt_target a).mem_nhds hz)
  have hJ : ContDiffAt ℝ ∞ (fderiv ℝ f) z := hF.fderiv_right (by simp)
  have hJh : ContDiffAt ℝ ∞ (fderiv ℝ (fderiv ℝ f)) z := hJ.fderiv_right (by simp)
  have hA := chartConnectionApplied_smoothAt (g := g) a X Y
    (by rwa [(isOpen_extChartAt_target a).interior_eq])
  have hFirst := (hJh.clm_apply (contDiffAt_const : ContDiffAt ℝ ∞ (fun _ : E => X) z)).clm_apply
    (contDiffAt_const : ContDiffAt ℝ ∞ (fun _ : E => Y) z)
  have hSecond := hJ.clm_apply hA
  simpa only [hypersurfaceChartSecondForm, f, bundleMapCovDeriv,
    Pi.zero_apply, zero_apply, add_zero] using hFirst.sub hSecond

omit [T2Space M] in
/-- A nonzero value of the fixed-chart second form provides a smooth local
unit normal of the actual immersion. The constant vectors are taken in the
one chosen source chart and are used throughout the neighborhood. -/
theorem exists_smoothChartUnitNormal (F : IsometricHypersurface g) (a : M) (X Y : E)
    (hNonzero : hypersurfaceChartSecondForm F a (extChartAt I a a) X Y ≠ 0) :
    let n := fun y => NormedSpace.normalize (hypersurfaceChartSecondForm F a y X Y)
    ∃ U : Set E, IsOpen U ∧ extChartAt I a a ∈ U ∧ U ⊆ (extChartAt I a).target ∧
      ContDiffOn ℝ ∞ n U ∧ ∀ y ∈ U, ‖n y‖ = 1 ∧
        ∀ v : E, inner ℝ (n y) (fderiv ℝ (F.localMap a) y v) = 0 := by
  intro n
  let z := extChartAt I a a
  let b := fun y => hypersurfaceChartSecondForm F a y X Y
  have hB := hypersurfaceChartSecondForm_smoothAt F a X Y (mem_extChartAt_target a)
  have h : ∀ᶠ y in 𝓝 z, y ∈ (extChartAt I a).target ∧ ContDiffAt ℝ ∞ b y ∧ b y ≠ 0 ∧
      ∀ v : E, inner ℝ (b y) (fderiv ℝ (F.localMap a) y v) = 0 := by
    filter_upwards [(isOpen_extChartAt_target a).mem_nhds (mem_extChartAt_target a),
      hB.continuousAt.eventually_ne hNonzero,
      hypersurfaceChartSecondForm_perpendicular F a] with y hy hNZ hOrth
    exact ⟨hy, hypersurfaceChartSecondForm_smoothAt F a X Y hy, hNZ, hOrth X Y⟩
  obtain ⟨U, hSub, hU, hzU⟩ := mem_nhds_iff.mp h
  refine ⟨U, hU, hzU, fun y hy => (hSub hy).1, ?_, ?_⟩
  · intro y hy
    obtain ⟨_, hSmooth, hNZ, _⟩ := hSub hy
    exact ((((hSmooth.norm ℝ hNZ).inv (norm_ne_zero_iff.mpr hNZ)).smul hSmooth).contDiffWithinAt)
  · intro y hy
    obtain ⟨_, _, hNZ, hOrth⟩ := hSub hy
    refine ⟨NormedSpace.norm_normalize hNZ, fun v => ?_⟩
    change inner ℝ (‖b y‖⁻¹ • b y) _ = 0
    rw [real_inner_smul_left, hOrth v, mul_zero]

omit [T2Space M] in
/-- At a nonzero principal curvature, choose the chart vector scale so that
the resulting smooth unit normal agrees with the prescribed normal at the
center, irrespective of the sign of that principal curvature. -/
theorem exists_smoothChartUnitNormal_of_principal {F : IsometricHypersurface g}
    {o : ManifoldOrientation I M 4} {p : M} (P : PrincipalFrameAt F o p) (i : Fin 4)
    (hi : P.curvature i ≠ 0) :
    ∃ (n : E → V₅) (U : Set E),
      IsOpen U ∧ extChartAt I p p ∈ U ∧ U ⊆ (extChartAt I p).target ∧
      ContDiffOn ℝ ∞ n U ∧ n (extChartAt I p p) = P.normal ∧
      ∀ y ∈ U, ‖n y‖ = 1 ∧
        ∀ v : E, inner ℝ (n y) (fderiv ℝ (F.localMap p) y v) = 0 := by
  let X : E := P.frame.basis i
  let Y : E := (P.curvature i)⁻¹ • X
  have hX : hypersurfaceChartSecondForm F p (extChartAt I p p) X Y = P.normal := by
    unfold hypersurfaceChartSecondForm
    rw [immersionChart_secondForm F _ (metricChartConnectionForm_apply g p (extChartAt I p p))]
    let B : E →L[ℝ] E →L[ℝ] V₅ := secondFundamentalFormAmbientAt g euclideanMetric F.map p
    change B X ((P.curvature i)⁻¹ • X) = P.normal
    have hPrincipal : B X X = P.curvature i • P.normal := by
      have h := P.principal i i
      have hChoice : (if i = i then P.curvature i else 0) = P.curvature i := by simp
      rw [hChoice] at h
      exact congrArg (fun v : TangentSpace 𝓘(ℝ, V₅) (F.map p) => (show V₅ from v)) h
    rw [map_smul, hPrincipal, inv_smul_smul₀ hi]
  have hNorm : ‖P.normal‖ = 1 := by
    have h := P.unit
    rw [real_inner_self_eq_norm_sq] at h
    exact (sq_eq_sq₀ (norm_nonneg _) zero_le_one).mp (by simpa only [one_pow] using h)
  have hNZ : P.normal ≠ 0 := norm_ne_zero_iff.mp (by rw [hNorm]; norm_num)
  obtain ⟨U, hU, hpU, hChart, hSmooth, hOrth⟩ := exists_smoothChartUnitNormal F p X Y (hX ▸ hNZ)
  refine ⟨fun y => NormedSpace.normalize (hypersurfaceChartSecondForm F p y X Y), U,
    hU, hpU, hChart, hSmooth, ?_, hOrth⟩
  change NormedSpace.normalize (hypersurfaceChartSecondForm F p (extChartAt I p p) X Y) = P.normal
  rw [hX, NormedSpace.normalize_eq_self_of_norm_eq_one hNorm]

end SmoothPoincare
