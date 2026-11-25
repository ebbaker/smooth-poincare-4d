import SmoothPoincare.Immersions.FixedChartFrames
import SmoothPoincare.Immersions.NormalChartTransition
import SmoothPoincare.Immersions.OrientedGaussNormal
import SmoothPoincare.Immersions.PrincipalPatch
import SmoothPoincare.Heights.GaussDifferential
import DifferentialGeometry.Analysis.Integration.Measure.Riemannian.Properties
import Mathlib.LinearAlgebra.Trace
import Mathlib.Topology.Instances.Matrix

/-! # Continuity of the Weyl density of an actual Euclidean hypersurface -/

open DifferentialGeometry DifferentialGeometry.Geometry DifferentialGeometry.Geometry.Connection
open DifferentialGeometry.Integral.Measure Filter FirstOrderTwistor Manifold MeasureTheory
open SectionsAndConnections Set
open scoped ContDiff Manifold Topology BigOperators

namespace SmoothPoincare

open private diagonal_raised from SmoothPoincare.Immersions.PrincipalPatch

private abbrev ShapeMatrix := Matrix (Fin 4) (Fin 4) ℝ

/-- The single chiral density as a polynomial in the signed shape operator. -/
private noncomputable def chiralShapeDensity (A : ShapeMatrix) : ℝ :=
  let e₂ := (A.trace ^ 2 - (A ^ 2).trace) / 2
  let pairSquares := ((A ^ 2).trace ^ 2 - (A ^ 4).trace) / 2
  (pairSquares + 6 * A.det) / 4 - e₂ ^ 2 / 12

private theorem chiralShapeDensity_continuous : Continuous chiralShapeDensity := by
  unfold chiralShapeDensity
  have h₁ : Continuous (fun A : ShapeMatrix => A.trace) := continuous_id.matrix_trace
  have h₂ : Continuous (fun A : ShapeMatrix => (A ^ 2).trace) :=
    (continuous_id.pow 2).matrix_trace
  have h₄ : Continuous (fun A : ShapeMatrix => (A ^ 4).trace) :=
    (continuous_id.pow 4).matrix_trace
  have hdet : Continuous (fun A : ShapeMatrix => A.det) := continuous_id.matrix_det
  have he₂ := ((h₁.pow 2).sub h₂).div_const 2
  have hPairs := ((h₂.pow 2).sub h₄).div_const 2
  exact (((hPairs.add (continuous_const.mul hdet)).div_const 4).sub ((he₂.pow 2).div_const 12))

private theorem chiralShapeDensity_diagonal (k : Fin 4 → ℝ) :
    chiralShapeDensity (Matrix.diagonal k) =
      principalWeylNormSq (k 0) (k 1) (k 2) (k 3) := by
  simp [chiralShapeDensity, principalWeylNormSq, Matrix.diagonal_pow, Matrix.trace,
    Matrix.det_diagonal, Fin.sum_univ_four, Fin.prod_univ_four]
  ring

private theorem chiralShapeDensity_basis {V : Type*} [AddCommGroup V] [Module ℝ V]
    (b c : Module.Basis (Fin 4) ℝ V) (A : V →ₗ[ℝ] V) :
    chiralShapeDensity (LinearMap.toMatrix b b A) =
      chiralShapeDensity (LinearMap.toMatrix c c A) := by
  let : FiniteDimensional ℝ V := b.finiteDimensional_of_finite
  simp only [chiralShapeDensity, LinearMap.toMatrix_pow, ← LinearMap.trace_eq_matrix_trace,
    LinearMap.det_toMatrix]

private theorem principalWeylNormSq_signed (k : Fin 4 → ℝ) :
    principalWeylNormSq (-(k 0)) (-(k 1)) (-(k 2)) (-(k 3)) =
      principalWeylNormSq (k 0) (k 1) (k 2) (k 3) := by
  simp [principalWeylNormSq]

section Immersion

variable {E H M : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  {g : SmoothRiemannianMetric I M} {F : IsometricHypersurface g}
  {o : ManifoldOrientation I M 4}

local notation "V₅" => EuclideanSpace ℝ (Fin 5)

private theorem principalWeyl_normSq_eq_chartShapeDensity
    (p q : M) (hq : q ∈ (extChartAt I p).source) (P : PrincipalFrameAt F o q)
    (b : Module.Basis (Fin 4) ℝ E) (w : V₅) (S : E →L[ℝ] E)
    (hw : inner ℝ w w = 1)
    (hPerp : ∀ v : TangentSpace I q,
      inner ℝ w (mfderiv I 𝓘(ℝ, V₅) F.map q v) = 0)
    (hDual : ∀ u v, chartNormalForm (metricChartConnectionForm g p) (F.localMap p)
      (fun _ => w) (extChartAt I p q) u v = chartMetricBilin g p (extChartAt I p q) (S u) v) :
    hilbertSchmidtSq (geometricChiralBlock g o q P.frame) =
      chiralShapeDensity (LinearMap.toMatrix b b S.toLinearMap) := by
  let y := extChartAt I p q
  let K := chartMetricBilin g p y
  obtain ⟨c, _, _, hL, hOrtho, _⟩ := exists_fixedChartPrincipalBasis p hq P
  have hwSign := (principalHeight_unitCritical_iff P w hw).mp
    ((immersionHeight_critical_iff F w).mpr hPerp)
  have hNormal (v : E) : inner ℝ (fderiv ℝ (F.localMap q) (extChartAt I q q) v) w = 0 := by
    rw [real_inner_comm, fixedChartFrameTransition_immersionDerivative F q
      (mem_extChartAt_source q)]
    exact hPerp _
  let k (i : Fin 4) := P.curvature i * inner ℝ P.normal w
  have hk (i j : Fin 4) : K (S (c i)) (c j) = if i = j then k i else 0 := by
    rw [← hDual]
    have h := chartNormalForm_eq_secondFundamentalFormAt F p q hq w hNormal (c i) (c j)
    change _ = inner ℝ (show V₅ from secondFundamentalFormAmbientAt g euclideanMetric F.map q
      (fixedChartFrameTransition (I := I) p q (c i))
      (fixedChartFrameTransition (I := I) p q (c j))) w at h
    rw [h, hL i, hL j, P.principal, real_inner_smul_left]
    split_ifs <;> simp [k]
  have hMatrix : LinearMap.toMatrix c c S.toLinearMap = Matrix.diagonal k := by
    ext i j
    rw [LinearMap.toMatrix_apply, ContinuousLinearMap.coe_coe,
      diagonal_raised K S
        (fun u h => chartMetricBilin_pos_onTarget g p ((extChartAt I p).map_source hq) h)
        c hOrtho k hk j, map_smul, Finsupp.smul_apply, Module.Basis.repr_self,
      Finsupp.single_apply, Matrix.diagonal_apply]
    by_cases hij : i = j
    · simp [hij]
    · simp [hij, Ne.symm hij]
  rw [inducedChiralBlock_normSq, chiralShapeDensity_basis b c, hMatrix, chiralShapeDensity_diagonal]
  rcases hwSign with hw | hw
  · simp only [k, hw, P.unit, mul_one]
  · simpa only [k, hw, inner_neg_right, P.unit, mul_neg, mul_one] using
      (principalWeylNormSq_signed P.curvature).symm

/-- The intrinsic positive Weyl density of a smooth Euclidean hypersurface
is continuous, independently of the pointwise choices of principal frames
or their unit normal signs. -/
theorem continuous_inducedChiralDensity (P : ∀ x : M, PrincipalFrameAt F o x) :
    Continuous (fun x => hilbertSchmidtSq (geometricChiralBlock g o x (P x).frame)) := by
  rw [continuous_iff_continuousAt]
  intro p
  let a : OrthonormalBasis (Fin 5) ℝ V₅ := EuclideanSpace.basisFun (Fin 5) ℝ
  let w := orientedGaussVector F o a
  let e := extChartAt I p
  let n : E → V₅ := w ∘ e.symm
  have hTarget : IsOpen e.target := isOpen_extChartAt_target p
  have hn : ContDiffOn ℝ 2 n e.target := by
    have h := (orientedGaussVector_smooth F o a).comp_contMDiffOn
      (contMDiffOn_extChartAt_symm (n := ∞) p)
    exact (contMDiffOn_iff_contDiffOn.mp h).of_le (by norm_num)
  have hPerp (z : E) (hz : z ∈ e.target) (v : E) :
      inner ℝ (fderiv ℝ (F.localMap p) z v) (n z) = 0 := by
    let q := e.symm z
    have hq : q ∈ e.source := e.map_target hz
    rw [← e.right_inv hz, fixedChartFrameTransition_immersionDerivative F p hq]
    change inner ℝ (show V₅ from mfderiv I 𝓘(ℝ, V₅) F.map q
      (fixedChartFrameTransition (I := I) p q v)) (n (e (e.symm z))) = 0
    rw [e.right_inv hz]
    exact (real_inner_comm _ _).trans (orientedGaussVector_perpendicular F o a q _)
  obtain ⟨S, hS, hDual⟩ := exists_immersionChartShapeDual F p n hTarget Subset.rfl hn hPerp
  let b : Module.Basis (Fin 4) ℝ E := (P p).frame.basis
  let A (z : E) : ShapeMatrix := LinearMap.toMatrix b b (S z).toLinearMap
  have hA : ContinuousAt A (e p) := by
    have hS := (hS _ (mem_extChartAt_target p)).continuousWithinAt.continuousAt
      (hTarget.mem_nhds (mem_extChartAt_target p))
    apply continuousAt_pi.mpr
    intro i
    apply continuousAt_pi.mpr
    intro j
    simp only [A, LinearMap.toMatrix_apply, ContinuousLinearMap.coe_coe]
    exact ((b.coord i).continuous_of_finiteDimensional.continuousAt).comp
      ((ContinuousLinearMap.apply ℝ E (b j)).continuous.continuousAt.comp hS)
  have hC := (chiralShapeDensity_continuous.continuousAt.comp hA).comp
    (continuousAt_extChartAt (I := I) (x := p))
  have hNear : ∀ᶠ q in 𝓝 p, q ∈ e.source := by
    rw [show e.source = (chartAt H p).source from extChartAt_source I p]
    exact (chartAt H p).open_source.mem_nhds (mem_chart_source H p)
  apply hC.congr
  filter_upwards [hNear] with q hq
  have hUnit : inner ℝ (w q) (w q) = 1 := by
    have hNorm : ‖w q‖ = 1 := by
      simpa using orientedGaussVector_mem_sphere F o a q
    rw [real_inner_self_eq_norm_sq, hNorm, one_pow]
  have hNormal : n (e q) = w q := congrArg w (e.left_inv hq)
  exact (principalWeyl_normSq_eq_chartShapeDensity p q hq (P q) b (w q) (S (e q)) hUnit
    (orientedGaussVector_perpendicular F o a q) (by
      intro u v
      simpa only [chartNormalForm, hNormal] using hDual (e q) (e.map_source hq) u v)).symm

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- On the compact source the intrinsic positive Weyl density is integrable
for the Riemannian volume of its induced metric. -/
theorem integrable_inducedChiralDensity [CompactSpace M]
    (P : ∀ x : M, PrincipalFrameAt F o x) :
    Integrable (fun x => hilbertSchmidtSq (geometricChiralBlock g o x (P x).frame))
      (riemannianVolumeMeasure I M g) := by
  let : IsFiniteMeasureOnCompacts (riemannianVolumeMeasure I M g) :=
    riemannianVolumeMeasure_isFiniteMeasureOnCompacts g
  exact (continuous_inducedChiralDensity P).integrable_of_hasCompactSupport
    (HasCompactSupport.of_compactSpace _)

end Immersion

end SmoothPoincare
