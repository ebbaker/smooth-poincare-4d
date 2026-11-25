import SmoothPoincare.Immersions.OpenEquality
import SmoothPoincare.Immersions.ChartShapeDual
import SmoothPoincare.Immersions.ChartUnitNormal

/-! # The open equality obstruction in terms of the signed second form -/

open DifferentialGeometry DifferentialGeometry.Geometry DifferentialGeometry.Geometry.Connection
open DifferentialGeometry.Tensor.Coordinates FirstOrderTwistor Filter Set Manifold
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

open private chartMetricBilin_center from DifferentialGeometry.Geometry.Submanifold.Gauss

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  {g : SmoothRiemannianMetric I M} {o : ManifoldOrientation I M 4} {p : M}
  {F : IsometricHypersurface g}

omit [FiniteDimensional ℝ E] in
private theorem diagonal_raised (K : E →L[ℝ] E →L[ℝ] ℝ) (S : E →L[ℝ] E)
    (hpos : ∀ v : E, v ≠ 0 → 0 < K v v) (b : Module.Basis (Fin 4) ℝ E)
    (ho : ∀ i j, K (b i) (b j) = if i = j then 1 else 0) (k : Fin 4 → ℝ)
    (hk : ∀ i j, K (S (b i)) (b j) = if i = j then k i else 0) (i : Fin 4) :
    S (b i) = k i • b i := by
  let v := S (b i) - k i • b i
  have hz : (K v).toLinearMap = 0 := by
    apply b.ext
    intro j
    change K (S (b i) - k i • b i) (b j) = 0
    rw [map_sub, map_smul, sub_apply, smul_apply, hk, ho]
    by_cases h : i = j <;> simp [h]
  apply sub_eq_zero.mp
  by_contra hv
  exact (hpos v hv).ne' (LinearMap.congr_fun hz v)

local notation "z₀" => extChartAt I p p
local notation "Γ" => metricChartConnectionForm g p
local notation "K" => chartMetricBilin g p

/-- A single fixed-chart representation of the balanced principal form of
the immersion suffices. Neither a smooth eigenframe nor a differentiable
choice of the eigenvalue magnitude is required. -/
theorem noOpenBalancedPrincipalForm (P : PrincipalFrameAt F o p)
    (a : E → ℝ) (n : E → EuclideanSpace ℝ (Fin 5))
    {Ω : Set E} (hΩ : IsOpen Ω) (hchart : Ω ⊆ (extChartAt I p).target) (hp : z₀ ∈ Ω)
    (hn : ContDiffOn ℝ 2 n Ω) (hnp : n z₀ = P.normal)
    (hu : ∀ y ∈ Ω, inner ℝ (n y) (n y) = 1)
    (hperp : ∀ y ∈ Ω, ∀ v, inner ℝ (fderiv ℝ (F.localMap p) y v) (n y) = 0)
    (hline : ∀ y ∈ Ω, ∀ u v, ∃ c : ℝ, hypersurfaceChartSecondForm F p y u v = c • n y)
    (hpos : ∀ y ∈ Ω, 0 < a y)
    (hadapt : ∀ y ∈ Ω, ∃ b : Module.Basis (Fin 4) ℝ E,
      (∀ i j, K y (b i) (b j) = if i = j then 1 else 0) ∧
      ∀ i j, chartNormalForm Γ (F.localMap p) n y (b i) (b j) =
        if i = j then saturatedPrincipalSign i * a y else 0)
    (hspec : P.curvature = ![-a z₀, -a z₀, a z₀, a z₀]) : False := by
  obtain ⟨S, hS, hdual⟩ := exists_immersionChartShapeDual F p n hΩ hchart hn hperp
  refine principalFrame_noBalancedShapePatch P S a n hΩ hchart hp hS hpos
    (hn.differentiableOn (by norm_num)) hu hperp ?_ ?_ hspec ?_
  · intro y hy u v
    obtain ⟨c, hc⟩ := hline y hy u v
    change hypersurfaceChartSecondForm F p y u v = _
    rw [hc, ← hdual y hy u v]
    change c • n y = (inner ℝ (hypersurfaceChartSecondForm F p y u v) (n y)) • n y
    rw [hc, real_inner_smul_left, hu y hy, mul_one]
  · intro y hy
    obtain ⟨b, ho, hb⟩ := hadapt y hy
    exact ⟨b, ho, diagonal_raised _ _ (fun u h => chartMetricBilin_pos_onTarget g p (hchart hy) h)
      b ho _ (fun i j => (hdual y hy _ _).symm.trans (hb i j))⟩
  · let b : Module.Basis (Fin 4) ℝ E := P.frame.basis
    have ho (i j : Fin 4) : K z₀ (b i) (b j) = if i = j then 1 else 0 :=
      (chartMetricBilin_center g p (P.frame.basis i) (P.frame.basis j)).trans (P.frame.orthonormal i j)
    have hk (i j : Fin 4) : K z₀ (S z₀ (b i)) (b j) = if i = j then P.curvature i else 0 := by
      rw [← hdual _ hp]
      change inner ℝ (bundleMapCovDeriv Γ 0 (fderiv ℝ (F.localMap p)) z₀ (b i) (b j)) (n z₀) = _
      rw [immersionChart_secondForm F Γ (metricChartConnectionForm_apply g p z₀), hnp]
      change inner ℝ (show EuclideanSpace ℝ (Fin 5) from secondFundamentalFormAmbientAt g euclideanMetric F.map p
        (P.frame.basis i) (P.frame.basis j)) P.normal = _
      rw [P.principal, real_inner_smul_left, P.unit, mul_one]
    intro i
    have hi := diagonal_raised _ _ (fun u h => chartMetricBilin_pos_onTarget g p (hchart hp) h)
      b ho _ hk i
    have he : P.curvature i = saturatedPrincipalSign i * a z₀ := by
      rw [hspec]
      fin_cases i <;> simp [saturatedPrincipalSign]
    rw [he] at hi
    let e := centeredChartTangentEquiv (I := I) p
    apply e.injective
    rw [map_smul]
    change e (e.symm (S z₀ (e (P.frame.basis i)))) =
      (saturatedPrincipalSign i * a z₀) • e (P.frame.basis i)
    rw [e.apply_symm_apply]
    have he' : e (P.frame.basis i) = b i := centeredChartTangentEquiv_apply p _
    rw [he']
    exact hi

end SmoothPoincare
