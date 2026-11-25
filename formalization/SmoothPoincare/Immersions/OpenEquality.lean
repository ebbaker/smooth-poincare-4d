import SmoothPoincare.Immersions.BalancedShapeParallel
import SmoothPoincare.Immersions.ImmersionChart
import SmoothPoincare.Immersions.ShapeDerivative
import DifferentialGeometry.Geometry.Coordinates.EmbeddedCurve

/-! # Exclusion of a balanced signed shape on one immersion chart -/

open DifferentialGeometry DifferentialGeometry.Geometry DifferentialGeometry.Geometry.Connection
open DifferentialGeometry.Tensor.Coordinates FirstOrderTwistor Filter Set Manifold
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

open private chartMetricBilin_differentiableAt chartMetricBilin_fderiv chartMetricBilin_symm
  chartConnectionBilin_symm from DifferentialGeometry.Geometry.Submanifold.Gauss
open private chartMetricBilin_pos from DifferentialGeometry.Geometry.Coordinates.EmbeddedCurve

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  {g : SmoothRiemannianMetric I M} {o : ManifoldOrientation I M 4} {p : M}
  {F : IsometricHypersurface g}

omit [FiniteDimensional ℝ E] in
private theorem square_of_balanced_basis (S : E →L[ℝ] E) (a : ℝ) (b : Module.Basis (Fin 4) ℝ E)
    (h : ∀ i, S (b i) = (saturatedPrincipalSign i * a) • b i) (u : E) :
    S (S u) = a ^ 2 • u := by
  have heq : (S.comp S).toLinearMap = (a ^ 2 • ContinuousLinearMap.id ℝ E).toLinearMap := by
    apply b.ext
    intro i
    change S (S (b i)) = a ^ 2 • b i
    rw [h i, map_smul, h i, smul_smul]
    congr 1
    fin_cases i <;> norm_num [saturatedPrincipalSign] <;> ring
  exact LinearMap.congr_fun heq u

/-- A balanced two-by-two spectrum on an open patch is impossible when its
shape and signed normal represent the actual second form throughout one
fixed immersion chart. Adapted bases are only pointwise. -/
theorem principalFrame_noBalancedShapePatch (P : PrincipalFrameAt F o p)
    (S : E → E →L[ℝ] E) (a : E → ℝ) (n : E → EuclideanSpace ℝ (Fin 5))
    {Ω : Set E} (hΩ : IsOpen Ω) (hchart : Ω ⊆ (extChartAt I p).target)
    (hp : extChartAt I p p ∈ Ω)
    (hS : ContDiffOn ℝ 2 S Ω)
    (hpos : ∀ y ∈ Ω, 0 < a y)
    (hn : DifferentiableOn ℝ n Ω) (hu : ∀ y ∈ Ω, inner ℝ (n y) (n y) = 1)
    (hperp : ∀ y ∈ Ω, ∀ v, inner ℝ (fderiv ℝ (F.localMap p) y v) (n y) = 0)
    (hII : ∀ y ∈ Ω, ∀ u v, bundleMapCovDeriv (metricChartConnectionForm g p) 0
      (fderiv ℝ (F.localMap p)) y u v = (chartMetricBilin g p y (S y u) v) • n y)
    (hadapted : ∀ y ∈ Ω, ∃ b : Module.Basis (Fin 4) ℝ E,
      (∀ i j, chartMetricBilin g p y (b i) (b j) = if i = j then 1 else 0) ∧
      ∀ i, S y (b i) = (saturatedPrincipalSign i * a y) • b i)
    (hspec : P.curvature = ![-a (extChartAt I p p), -a (extChartAt I p p),
      a (extChartAt I p p), a (extChartAt I p p)])
    (hdiag : ∀ i, chartEndomorphismAt (I := I) p S (P.frame.basis i) =
      (saturatedPrincipalSign i * a (extChartAt I p p)) • P.frame.basis i) : False := by
  apply saturatedPrincipalFrame_noParallelShapeInChart P (hpos _ hp) hspec S hΩ hchart hp hS _ hdiag
  intro x hx
  let Γ := metricChartConnectionForm g p
  let K := chartMetricBilin g p
  let f := F.localMap p
  let b := chartNormalForm Γ f n
  have hF : ContDiffOn ℝ 3 f Ω := by
    have h := F.smooth.comp_contMDiffOn (contMDiffOn_extChartAt_symm (n := ∞) p)
    have hFull : ContDiffOn ℝ ∞ f (extChartAt I p).target := by
      simpa [f, IsometricHypersurface.localMap, writtenInExtChartAt] using contMDiffOn_iff_contDiffOn.mp h
    exact (hFull.mono hchart).of_le (by decide)
  have hneigh := hΩ.mem_nhds hx
  have hΓsym (y : E) (u v : E) : Γ y u v = Γ y v u := chartConnectionBilin_symm g p y u v
  have hD : ∀ᶠ y in 𝓝 x, ∀ u v, b y u v = K y (S y u) v := by
    filter_upwards [hneigh] with y hy u v
    change inner ℝ _ (n y) = _
    rw [hII y hy u v, real_inner_smul_left, hu y hy, mul_one]
  have hSym : ∀ᶠ y in 𝓝 x, ∀ u v, b y u v = b y v u := by
    filter_upwards [hneigh] with y hy u v
    have hf : ContDiffAt ℝ 2 f y := (hF.contDiffAt (hΩ.mem_nhds hy)).of_le (by norm_num)
    simp only [b, chartNormalForm, bundleMapCovDeriv, Pi.zero_apply, zero_apply, add_zero]
    rw [(hf.isSymmSndFDerivAt (by norm_num)).eq u v, hΓsym y u v]
  have hcov := chartNormalForm_codazzi Γ f n
    (metricChartConnectionForm_differentiableAt g p (interior_maximal hchart hΩ hx))
    (hF.contDiffAt hneigh) ((hn x hx).differentiableAt hneigh)
    (Filter.mem_of_superset hneigh fun y hy => hu y hy) (hperp x hx)
    (fun u v => ⟨_, hII x hx u v⟩) (hΓsym x)
  have hSx := (hS.contDiffAt hneigh).differentiableAt (by norm_num)
  have hT := chartShapeDerivative_symmetries Γ K S b
    (chartMetricBilin_differentiableAt g p (interior_maximal hchart hΩ hx)) hSx
    hD (chartMetricBilin_fderiv g p (hchart hx)) hSym hcov
  obtain ⟨basis, ho, hA⟩ := hadapted x hx
  have hSquare : ∀ᶠ y in 𝓝 x, ∀ u, S y (S y u) = (a y)^2 • u := by
    filter_upwards [hneigh] with y hy u
    obtain ⟨c, _, hc⟩ := hadapted y hy
    exact square_of_balanced_basis _ _ c hc u
  let l : E →L[ℝ] ℝ := (basis.coord 0).toContinuousLinearMap
  have hEval : DifferentiableAt ℝ (fun y => l (S y (S y (basis 0)))) x :=
    l.differentiableAt.comp x (hSx.clm_apply (hSx.clm_apply (differentiableAt_const _)))
  have hscalar : (fun y => l (S y (S y (basis 0)))) =ᶠ[𝓝 x] fun y => (a y)^2 := by
    filter_upwards [hSquare] with y hy
    rw [hy, map_smul]
    simp [l]
  have hMag : (fun y => Real.sqrt (l (S y (S y (basis 0))))) =ᶠ[𝓝 x] a := by
    filter_upwards [hscalar, hneigh] with y he hy
    rw [he, Real.sqrt_sq (hpos y hy).le]
  have hval : l (S x (S x (basis 0))) = a x ^ 2 := hscalar.self_of_nhds
  have hAx : DifferentiableAt ℝ a x := (hEval.sqrt (by rw [hval]; exact (pow_pos (hpos x hx) 2).ne')).congr_of_eventuallyEq hMag.symm
  apply balancedShapeCovDeriv_eq_zero Γ K S a hSx hAx (hpos x hx)
    hSquare _ (fun u hu' => chartMetricBilin_pos g p (hchart hx) hu') basis ho hA hT.1 hT.2
  intro u v
  rw [← hD.self_of_nhds u v, hSym.self_of_nhds, hD.self_of_nhds]
  exact chartMetricBilin_symm g p x _ _

end SmoothPoincare
