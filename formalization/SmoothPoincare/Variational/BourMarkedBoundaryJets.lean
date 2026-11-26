import SmoothPoincare.Variational.BourALEBoundary
import DifferentialGeometry.Analysis.Integration.Measure.VolumeDensity
import DifferentialGeometry.Geometry.Operator.MetricComparison
import DifferentialGeometry.Geometry.Metric.Pullback.Immersion
import SmoothPoincare.Variational.IntrinsicEulerDensity
import Mathlib.Analysis.SpecialFunctions.Integrals.Basic
import DifferentialGeometry.Geometry.Metric.RicciSoliton.Models

/-!
# Physical boundary jets on a normalized Bour end

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
Actual serving model and effort are unavailable.
-/

noncomputable section

open DifferentialGeometry DifferentialGeometry.Geometry.Operator
  DifferentialGeometry.Integral.Measure FirstOrderTwistor Filter MeasureTheory
open DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Tensor0SBundle
open scoped ContDiff Manifold Topology ENNReal

namespace SmoothPoincare

section Shapes

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] [NeZero (Module.finrank ℝ E)] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M]
  [IsManifold I ∞ M] [T2Space M] [I.Boundaryless] [BoundarylessManifold I M]

omit [NeZero (Module.finrank ℝ E)] [T2Space M] [I.Boundaryless] [BoundarylessManifold I M] in
/-- Compare the dual norm of one fixed defining differential in two metrics. -/
private theorem gradientLength_unit_error
    (g h : SmoothRiemannianMetric I M) (u : M → ℝ) (x : M) {ε : ℝ}
    (hε : 0 ≤ ε) (hSmall : ε ≤ 1 / 2)
    (hUnit : g.inner x (gradientFun g u x) (gradientFun g u x) = 1)
    (hForm : ∀ v : TangentSpace I x, |h.inner x v v - g.inner x v v| ≤ ε * g.inner x v v) :
    let a := Real.sqrt (h.inner x (gradientFun h u x) (gradientFun h u x))
    |a - 1| ≤ 2 * ε ∧ 1 / 2 ≤ a := by
  let a := Real.sqrt (h.inner x (gradientFun h u x) (gradientFun h u x))
  have ha : 0 ≤ a := Real.sqrt_nonneg _
  have haSq : a ^ 2 = h.inner x (gradientFun h u x) (gradientFun h u x) :=
    Real.sq_sqrt (metric_inner_self_nonneg h x _)
  have hLow (v : TangentSpace I x) : (1 - ε) * g.inner x v v ≤ h.inner x v v := by
    have hv := (abs_le.mp (hForm v)).1
    linarith
  have hHigh (v : TangentSpace I x) : h.inner x v v ≤ (1 + ε) * g.inner x v v := by
    have hv := (abs_le.mp (hForm v)).2
    linarith
  have hFactor : 0 < 1 - ε := by linarith
  have hUpper := inner_gradFun_le_of_metric_lower_bound g h u x (1 - ε)⁻¹
    (fun v => by
      rw [← div_eq_inv_mul]
      exact (le_div_iff₀ hFactor).mpr (by simpa only [mul_comm] using hLow v))
  have hLower := inner_gradFun_le_of_metric_lower_bound h g u x (1 + ε) hHigh
  change h.inner x (gradientFun h u x) (gradientFun h u x) ≤
    (1 - ε)⁻¹ * g.inner x (gradientFun g u x) (gradientFun g u x) at hUpper
  change g.inner x (gradientFun g u x) (gradientFun g u x) ≤
    (1 + ε) * h.inner x (gradientFun h u x) (gradientFun h u x) at hLower
  rw [hUnit, ← haSq, mul_one, ← one_div] at hUpper
  rw [hUnit, ← haSq] at hLower
  have hUpper' : a ^ 2 * (1 - ε) ≤ 1 := (le_div_iff₀ hFactor).mp hUpper
  have hSquareBound : a ^ 2 ≤ 2 := hUpper.trans
    ((div_le_iff₀ hFactor).mpr (by linarith))
  have hSquareErr : |a ^ 2 - 1| ≤ 2 * ε := by
    have hm := mul_le_mul_of_nonneg_left hSquareBound hε
    exact abs_le.mpr ⟨by linarith, by linarith⟩
  have hAbsFactor : |a ^ 2 - 1| = |a - 1| * (a + 1) := by
    rw [show a ^ 2 - 1 = (a - 1) * (a + 1) by ring, abs_mul,
      abs_of_nonneg (by positivity : 0 ≤ a + 1)]
  change |a - 1| ≤ 2 * ε ∧ 1 / 2 ≤ a
  constructor
  · rw [hAbsFactor] at hSquareErr
    exact le_trans (by nlinarith only [mul_nonneg (abs_nonneg (a - 1)) ha]) hSquareErr
  · by_contra! h
    have haQuarter : a ^ 2 ≤ 1 / 4 := by nlinarith only [ha, h, sq_nonneg (a - 1 / 2)]
    have hProd := mul_le_mul_of_nonneg_right (show 1 + ε ≤ 3 / 2 by linarith)
      (sq_nonneg a)
    linarith

/-- On a unit reference level where the reference Hessian is the reference
metric on the tangent frame, normalized shape follows from zeroth and first
metric comparison. The connection input is the difference of the two actual
Levi–Civita connections, measured in the reference metric. -/
theorem bourLevelShapeMatrix_error_of_metricComparison
    (g h : SmoothRiemannianMetric I M) (u : M → ℝ) (hu : ContMDiff I 𝓘(ℝ) ∞ u)
    (x : M) (o : ManifoldOrientation I M 4) (frame : OrientedOrthonormalFrameAt h o x)
    {ε : ℝ} (hε : 0 ≤ ε) (hSmall : ε ≤ 1 / 2)
    (hUnit : g.inner x (gradientFun g u x) (gradientFun g u x) = 1)
    (hRef : ∀ i j : Fin 3,
      hessFun g u x (frame.basis i.succ) (frame.basis j.succ) =
        g.inner x (frame.basis i.succ) (frame.basis j.succ))
    (hForm : ∀ v w : TangentSpace I x,
      |h.inner x v w - g.inner x v w| ≤
        ε * Real.sqrt (g.inner x v v) * Real.sqrt (g.inner x w w))
    (hConnection : ∀ v w : TangentSpace I x,
      let A := DifferentialGeometry.PDE.DeTurck.connectionDifference h g x w v
      Real.sqrt (g.inner x A A) ≤
        ε * Real.sqrt (g.inner x v v) * Real.sqrt (g.inner x w w))
    (i j : Fin 3) :
    |bourLevelShapeMatrix h u x o frame i j - (1 : Matrix (Fin 3) (Fin 3) ℝ) i j| ≤
      20 * ε := by
  have hQuadratic (v : TangentSpace I x) :
      |h.inner x v v - g.inner x v v| ≤ ε * g.inner x v v := by
    simpa only [mul_assoc, Real.mul_self_sqrt (metric_inner_self_nonneg g x v)] using hForm v v
  have hFrameNorm (a : Fin 4) : Real.sqrt (g.inner x (frame.basis a) (frame.basis a)) ≤ 2 := by
    have h := (abs_le.mp (hQuadratic (frame.basis a))).1
    rw [frame.orthonormal, ite_eq_left rfl] at h
    have hG : g.inner x (frame.basis a) (frame.basis a) ≤ 2 := by
      have hProd := mul_le_mul_of_nonneg_right hSmall (metric_inner_self_nonneg g x (frame.basis a))
      linarith
    exact Real.sqrt_le_left (by norm_num) |>.mpr (by linarith)
  let v := frame.basis i.succ
  let w := frame.basis j.succ
  let δ := (1 : Matrix (Fin 3) (Fin 3) ℝ) i j
  let a := Real.sqrt (h.inner x (gradientFun h u x) (gradientFun h u x))
  have hDelta : h.inner x v w = δ := by
    simp [v, w, δ, frame.orthonormal, Matrix.one_apply]
  have hAbsDelta : |δ| ≤ 1 := by
    rcases eq_or_ne i j with hij | hij <;> simp [δ, Matrix.one_apply, hij]
  obtain ⟨hGradError, hGradLow⟩ := gradientLength_unit_error g h u x hε hSmall hUnit hQuadratic
  change |a - 1| ≤ 2 * ε at hGradError
  change 1 / 2 ≤ a at hGradLow
  have hPositive : 0 < a := by linarith
  have hFactor :
      ε * Real.sqrt (g.inner x v v) * Real.sqrt (g.inner x w w) ≤ 4 * ε := by
    calc
      _ ≤ ε * 2 * 2 := by
        gcongr
        · exact hFrameNorm i.succ
        · exact hFrameNorm j.succ
      _ = _ := by ring
  have hHess : |hessFun h u x v w - g.inner x v w| ≤ 4 * ε := by
    have hv := abs_hessFun_sub_le_of_connectionDifference_bound g h u hu x v w ε (hConnection v w)
    change |hessFun h u x v w - hessFun g u x v w| ≤
      ε * Real.sqrt (g.inner x (gradientFun g u x) (gradientFun g u x)) *
        Real.sqrt (g.inner x v v) * Real.sqrt (g.inner x w w) at hv
    rw [hRef i j, hUnit, Real.sqrt_one, mul_one] at hv
    exact hv.trans hFactor
  have hNumerator : |hessFun h u x v w - a * δ| ≤ 10 * ε := by
    rw [show hessFun h u x v w - a * δ =
      (hessFun h u x v w - g.inner x v w) +
        (g.inner x v w - h.inner x v w) - (a - 1) * δ by rw [hDelta]; ring]
    have hMetric := (hForm v w).trans hFactor
    have hMetric' : |g.inner x v w - h.inner x v w| ≤ 4 * ε := by
      rwa [abs_sub_comm]
    have hMixed : |(a - 1) * δ| ≤ 2 * ε := by
      rw [abs_mul]
      simpa using mul_le_mul hGradError hAbsDelta (abs_nonneg δ) (by positivity : 0 ≤ 2 * ε)
    linarith only [abs_sub ((hessFun h u x v w - g.inner x v w) + (g.inner x v w - h.inner x v w)) ((a - 1) * δ), abs_add_le (hessFun h u x v w - g.inner x v w)
      (g.inner x v w - h.inner x v w), hHess, hMetric', hMixed]
  change |hessFun h u x v w / a - δ| ≤ _
  rw [div_sub' hPositive.ne', abs_div, abs_of_pos hPositive]
  apply (div_le_iff₀ hPositive).mpr
  exact hNumerator.trans (by nlinarith only [hGradLow, hε, mul_nonneg hε (sub_nonneg.mpr hGradLow)])

omit [NeZero (Module.finrank ℝ E)] [T2Space M] [I.Boundaryless] [BoundarylessManifold I M] in
/-- In an adapted physical frame the first vector points out of the
sublevel set and the last three annihilate the defining differential. -/
theorem bourLevelNormal_differential
    (h : SmoothRiemannianMetric I M) (u : M → ℝ) (x : M)
    (o : ManifoldOrientation I M 4) (frame : OrientedOrthonormalFrameAt h o x)
    {length : ℝ} (hLength : 0 < length)
    (hAdapted : gradientFun h u x = length • frame.basis 0) :
    0 < mvfderiv I u x (frame.basis 0) ∧
      ∀ i : Fin 3, mvfderiv I u x (frame.basis i.succ) = 0 := by
  have hPair (a : Fin 4) :
      mvfderiv I u x (frame.basis a) = length * (if 0 = a then 1 else 0) := by
    rw [← inner_gradientFun h u x, hAdapted, map_smul]
    change length * h.inner x (frame.basis 0) (frame.basis a) = _
    rw [frame.orthonormal]
  exact ⟨by simpa [hPair] using hLength,
    fun i => by simp [hPair, Fin.succ_ne_zero i |>.symm]⟩

end Shapes

section InducedArea

variable {F K L : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F]
  [FiniteDimensional ℝ F] [TopologicalSpace K] {J : ModelWithCorners ℝ F K}
  [TopologicalSpace L] [ChartedSpace K L] [IsManifold J ∞ L]
  [T2Space L] [SigmaCompactSpace L]

/-- In link dimension three the actual induced volume ratio is controlled by
relative quadratic-form bounds. The ratio uses the two physical link metrics. -/
theorem bourLinkAreaDensity_error_of_quadraticComparison
    (round induced : SmoothRiemannianMetric J L) (z : L)
    (hDim : Module.finrank ℝ F = 3) {ε : ℝ} (hε : 0 ≤ ε) (hSmall : ε ≤ 1 / 2)
    (hForm : ∀ v : TangentSpace J z,
      |induced.inner z v v - round.inner z v v| ≤ ε * round.inner z v v) :
    |riemannianVolumeDensity round induced z - 1| ≤ 3 * ε := by
  let j := riemannianVolumeDensity round induced z
  let j' := riemannianVolumeDensity induced round z
  have hPos : 0 < j := riemannianVolumeDensity_pos round induced z
  have hMul : j * j' = 1 := riemannianVolumeDensity_mul_swap round induced z
  have hLow (v : TangentSpace J z) : (1 - ε) * round.inner z v v ≤ induced.inner z v v := by
    have hv := (abs_le.mp (hForm v)).1
    linarith
  have hHigh (v : TangentSpace J z) : induced.inner z v v ≤ (1 + ε) * round.inner z v v := by
    have hv := (abs_le.mp (hForm v)).2
    linarith
  have hUpper := riemannianVolumeDensity_le_of_inner_le round induced
    (show 0 < 1 + ε by linarith) z hHigh
  have hRecip : 1 ≤ (1 - ε)⁻¹ := by
    rw [← one_div]
    exact (le_div_iff₀ (by linarith : 0 < 1 - ε)).mpr (by linarith)
  have hPosFactor : 0 < 1 - ε := by linarith
  have hReverse := riemannianVolumeDensity_le_of_inner_le induced round
    (inv_pos.mpr hPosFactor) z (fun v => by
      rw [← div_eq_inv_mul]
      exact (le_div_iff₀ (by linarith : 0 < 1 - ε)).mpr (by simpa only [mul_comm] using hLow v))
  have hSqrt {Q : ℝ} (hQ : 1 ≤ Q) : Real.sqrt (Q ^ 3) ≤ Q ^ 2 := by
    apply (Real.sqrt_le_left (sq_nonneg Q)).mpr
    have hProd : 0 ≤ (Q - 1) * Q ^ 3 :=
      mul_nonneg (sub_nonneg.mpr hQ) (pow_nonneg (by linarith) 3)
    linarith only [show (Q - 1) * Q ^ 3 = (Q ^ 2) ^ 2 - Q ^ 3 by ring, hProd]
  rw [hDim] at hUpper hReverse
  have hJUpper : j ≤ (1 + ε) ^ 2 := hUpper.trans (hSqrt (by linarith))
  have hJReverse : j' ≤ ((1 - ε)⁻¹) ^ 2 := hReverse.trans (hSqrt hRecip)
  have hJLower : (1 - ε) ^ 2 ≤ j := by
    have hm := mul_le_mul_of_nonneg_left hJReverse hPos.le
    rw [hMul, inv_pow, ← div_eq_mul_inv] at hm
    apply (le_div_iff₀ (pow_pos hPosFactor 2)).mp at hm
    simpa only [one_mul] using hm
  change |j - 1| ≤ _
  exact abs_le.mpr ⟨by nlinarith [sq_nonneg ε], by nlinarith [mul_nonneg hε (show 0 ≤ 1 - ε by linarith)]⟩

end InducedArea

section EuclideanLevel

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [NeZero (Module.finrank ℝ E)]

/-- The normalized ALE sphere is the regular level `u = 1 / 2` of
`u(x) = ‖x‖² / 2`. The defining differential points to increasing
radius. Using a squared radius avoids a nonsmooth extension across zero. -/
theorem bourUnitEuclideanLevel_shape_error
    (h : SmoothRiemannianMetric 𝓘(ℝ, E) E) (x : E) (hx : ‖x‖ = 1)
    (o : ManifoldOrientation 𝓘(ℝ, E) E 4) (frame : OrientedOrthonormalFrameAt h o x)
    {ε : ℝ} (hε : 0 ≤ ε) (hSmall : ε ≤ 1 / 2)
    (hForm : ∀ v w : TangentSpace 𝓘(ℝ, E) x,
      |h.inner x v w - euclideanMetric.inner x v w| ≤
        ε * Real.sqrt (euclideanMetric.inner x v v) * Real.sqrt (euclideanMetric.inner x w w))
    (hConnection : ∀ v w : TangentSpace 𝓘(ℝ, E) x,
      let A := DifferentialGeometry.PDE.DeTurck.connectionDifference h euclideanMetric x w v
      Real.sqrt (euclideanMetric.inner x A A) ≤
        ε * Real.sqrt (euclideanMetric.inner x v v) * Real.sqrt (euclideanMetric.inner x w w))
    (i j : Fin 3) :
    |bourLevelShapeMatrix h ((2 : ℝ) • (DifferentialGeometry.Geometry.gaussianPotential : E → ℝ))
      x o frame i j - (1 : Matrix (Fin 3) (Fin 3) ℝ) i j| ≤ 20 * ε := by
  let f : E → ℝ := DifferentialGeometry.Geometry.gaussianPotential
  have hf : ContMDiff 𝓘(ℝ, E) 𝓘(ℝ) ∞ f :=
    (DifferentialGeometry.Geometry.gaussianPotential (E := E)).contMDiff
  have hGrad : (gradientFun euclideanMetric ((2 : ℝ) • f) x : E) = x := by
    have hs : (gradientFun euclideanMetric ((2 : ℝ) • f) x : E) =
        (2 : ℝ) • (gradFun euclideanMetric f x : E) :=
      gradientFun_const_smul (I := 𝓘(ℝ, E)) euclideanMetric 2
        (hf x |>.mdifferentiableAt (by simp))
    have hg : (gradFun euclideanMetric f x : E) = (1 / 2 : ℝ) • x :=
      DifferentialGeometry.Geometry.gaussianPotential_gradFun x
    have hh := congrArg (fun v : E => (2 : ℝ) • v) hg
    have hTwo : (2 : ℝ) • ((1 / 2 : ℝ) • x) = x := by rw [smul_smul]; norm_num
    exact Eq.trans (α := E) hs (Eq.trans (α := E) hh hTwo)
  have hConst : ContMDiff 𝓘(ℝ, E) 𝓘(ℝ) ∞ (fun _ : E => (2 : ℝ)) :=
    contMDiff_const
  have hu : ContMDiff 𝓘(ℝ, E) 𝓘(ℝ) ∞ ((2 : ℝ) • f) :=
    hConst.mul hf
  refine bourLevelShapeMatrix_error_of_metricComparison (I := 𝓘(ℝ, E))
    euclideanMetric h ((2 : ℝ) • f) hu x o frame hε hSmall ?_ ?_ hForm hConnection i j
  · let v := gradientFun euclideanMetric ((2 : ℝ) • f) x
    change (euclideanMetric (E := E)).inner x v v = 1
    let pair : E → E → ℝ := inner ℝ
    calc
      _ = pair v v := euclideanMetric_inner x v v
      _ = pair x x := congrArg₂ pair hGrad hGrad
      _ = 1 := by
        change inner ℝ x x = 1
        rw [real_inner_self_eq_norm_sq, hx, one_pow]
  · intro a b
    let v := frame.basis a.succ
    let w := frame.basis b.succ
    have hh := congrArg (fun H : ∀ y : E,
        TangentSpace 𝓘(ℝ, E) y →ₗ[ℝ] TangentSpace 𝓘(ℝ, E) y →ₗ[ℝ] ℝ => H x v w)
      (hessFun_smul (I := 𝓘(ℝ, E)) euclideanMetric 2 f)
    change hessFun euclideanMetric ((2 : ℝ) • f) x v w =
      (euclideanMetric (E := E)).inner x v w
    calc
      _ = 2 * hessFun euclideanMetric f x v w := hh
      _ = 2 * ((1 / 2 : ℝ) * (euclideanMetric (E := E)).inner x v w) :=
        congrArg (fun z : ℝ => 2 * z) (DifferentialGeometry.Geometry.gaussianPotential_hessian x v w)
      _ = _ := by ring

end EuclideanLevel

section Curvature

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M]
  [IsManifold I ∞ M] [T2Space M] [BoundarylessManifold I M]

/-- A bound on the physical ordered curvature norm controls every ambient
tangential wedge entry. The curvature bound has no fitting factor from the
operator Hilbert–Schmidt convention. -/
theorem bourTangentialCurvatureMatrix_le_of_intrinsicCurvatureSq
    (g : SmoothRiemannianMetric I M) (x : M)
    (o : ManifoldOrientation I M 4) (frame : OrientedOrthonormalFrameAt g o x)
    {ε : ℝ} (hε : 0 ≤ ε) (hCurv : normSq0S g x 4 (metricRm04At g x) ≤ ε ^ 2)
    (i j : Fin 3) :
    |bourTangentialCurvatureMatrix g x o frame i j| ≤ ε := by
  let R := metricCurvatureFrameTensor g o x frame
  have hFrame : frameTensorNormSq R ≤ ε ^ 2 := by
    rw [← normSq0S_rm04_eq_frameTensorNormSq g o x frame]
    exact hCurv
  have hComponent (a b c d : Fin 4) : R a b c d ^ 2 ≤ frameTensorNormSq R := by
    unfold frameTensorNormSq
    calc
      _ ≤ ∑ s : Fin 4, R a b c s ^ 2 :=
        Finset.single_le_sum (fun s _ => sq_nonneg (R a b c s)) (Finset.mem_univ d)
      _ ≤ ∑ t : Fin 4, ∑ s : Fin 4, R a b t s ^ 2 :=
        Finset.single_le_sum (fun t _ => Finset.sum_nonneg fun s _ => sq_nonneg (R a b t s))
          (Finset.mem_univ c)
      _ ≤ ∑ u : Fin 4, ∑ t : Fin 4, ∑ s : Fin 4, R a u t s ^ 2 :=
        Finset.single_le_sum
          (fun u _ => Finset.sum_nonneg fun t _ => Finset.sum_nonneg fun s _ => sq_nonneg (R a u t s))
          (Finset.mem_univ b)
      _ ≤ _ := Finset.single_le_sum
        (fun v _ => Finset.sum_nonneg fun u _ => Finset.sum_nonneg fun t _ =>
          Finset.sum_nonneg fun s _ => sq_nonneg (R v u t s)) (Finset.mem_univ a)
  have h := (hComponent (i + 1).succ (i + 2).succ (j + 1).succ (j + 2).succ).trans hFrame
  exact abs_le_of_sq_le_sq h hε

end Curvature

section MeasuredLinks

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] [NeZero (Module.finrank ℝ E)] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M]
  [IsManifold I ∞ M] [T2Space M] [I.Boundaryless] [BoundarylessManifold I M]
  {F K L : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F]
  [FiniteDimensional ℝ F] [TopologicalSpace K] {J : ModelWithCorners ℝ F K}
  [TopologicalSpace L] [ChartedSpace K L] [IsManifold J ∞ L]
  [T2Space L] [SigmaCompactSpace L]

omit [FiniteDimensional ℝ E] [NeZero (Module.finrank ℝ E)] [T2Space M]
  [I.Boundaryless] [BoundarylessManifold I M] in
/-- Compare area on the same immersion at the two metrics. The density is
between induced measures, using the actual differential of the link map. -/
theorem bourImmersedLinkAreaDensity_error
    (g h : SmoothRiemannianMetric I M) (link : L → M)
    (hLink : ContMDiff J I ∞ link) (hImm : ∀ y, Function.Injective (mfderiv J I link y))
    (z : L) (hDim : Module.finrank ℝ F = 3) {ε : ℝ} (hε : 0 ≤ ε)
    (hSmall : ε ≤ 1 / 2)
    (hForm : ∀ v : TangentSpace I (link z),
      |h.inner (link z) v v - g.inner (link z) v v| ≤ ε * g.inner (link z) v v) :
    |riemannianVolumeDensity (g.pullback link hLink hImm)
      (h.pullback link hLink hImm) z - 1| ≤ 3 * ε := by
  apply bourLinkAreaDensity_error_of_quadraticComparison _ _ z hDim hε hSmall
  intro v
  simpa only [SmoothRiemannianMetric.pullback_inner] using hForm (mfderiv J I link z v)

private local instance : MeasurableSpace L := borel L
private local instance : BorelSpace L := ⟨rfl⟩

/-- Physical correction on an actual immersed normalized link. The shape
and ambient curvature are computed at its image and the integration uses
the induced metric. The reference measure is induced by the comparison
metric on the same link. In the boundary application the supplied frames
are outward adapted, so this is the oriented Euler boundary correction. -/
theorem bourImmersedLinkEulerIntegral_error
    (g h : SmoothRiemannianMetric I M) (u : M → ℝ) (hu : ContMDiff I 𝓘(ℝ) ∞ u)
    (o : ManifoldOrientation I M 4) (link : L → M)
    (hLink : ContMDiff J I ∞ link) (hImm : ∀ y, Function.Injective (mfderiv J I link y))
    (frame : ∀ z, OrientedOrthonormalFrameAt h o (link z))
    (hDim : Module.finrank ℝ F = 3)
    {ε : ℝ} (hε : 0 ≤ ε) (hSmall : 20 * ε ≤ 1)
    (hUnit : ∀ z, g.inner (link z) (gradientFun g u (link z)) (gradientFun g u (link z)) = 1)
    (hRef : ∀ z (i j : Fin 3),
      hessFun g u (link z) ((frame z).basis i.succ) ((frame z).basis j.succ) =
        g.inner (link z) ((frame z).basis i.succ) ((frame z).basis j.succ))
    (hForm : ∀ z (v w : TangentSpace I (link z)),
      |h.inner (link z) v w - g.inner (link z) v w| ≤
        ε * Real.sqrt (g.inner (link z) v v) * Real.sqrt (g.inner (link z) w w))
    (hConnection : ∀ z (v w : TangentSpace I (link z)),
      let A := DifferentialGeometry.PDE.DeTurck.connectionDifference h g (link z) w v
      Real.sqrt (g.inner (link z) A A) ≤
        ε * Real.sqrt (g.inner (link z) v v) * Real.sqrt (g.inner (link z) w w))
    (hCurv : ∀ z, normSq0S h (link z) 4 (metricRm04At h (link z)) ≤ ε ^ 2)
    (hFinite : IsFiniteMeasure (riemannianVolumeMeasure J L (g.pullback link hLink hImm)))
    (hMeas : Measurable (fun z =>
      bourEulerBoundaryDensity (bourLevelShapeMatrix h u (link z) o (frame z))
        (bourTangentialCurvatureMatrix h (link z) o (frame z)))) :
    let μ := riemannianVolumeMeasure J L (g.pullback link hLink hImm)
    let ν := riemannianVolumeMeasure J L (h.pullback link hLink hImm)
    |(∫ z, bourEulerBoundaryDensity (bourLevelShapeMatrix h u (link z) o (frame z))
      (bourTangentialCurvatureMatrix h (link z) o (frame z)) ∂ν) - 4 * μ.real Set.univ| ≤
      412 * (20 * ε) * μ.real Set.univ := by
  let round := g.pullback link hLink hImm
  let induced := h.pullback link hLink hImm
  let μ := riemannianVolumeMeasure J L round
  let shape z := bourLevelShapeMatrix h u (link z) o (frame z)
  let curvature z := bourTangentialCurvatureMatrix h (link z) o (frame z)
  let ρ := riemannianVolumeDensity round induced
  let _ : IsFiniteMeasure μ := hFinite
  have hSmall' : ε ≤ 1 / 2 := by linarith
  have hScaled : 0 ≤ 20 * ε := by positivity
  have hShape z i j : |shape z i j - (1 : Matrix (Fin 3) (Fin 3) ℝ) i j| ≤ 20 * ε :=
    bourLevelShapeMatrix_error_of_metricComparison g h u hu (link z) o (frame z)
      hε hSmall' (hUnit z) (hRef z) (hForm z) (hConnection z) i j
  have hCurvature z i j : |curvature z i j| ≤ 20 * ε :=
    (bourTangentialCurvatureMatrix_le_of_intrinsicCurvatureSq h (link z) o (frame z)
      hε (hCurv z) i j).trans (by linarith)
  have hArea z : |ρ z - 1| ≤ 20 * ε := by
    have hArea' := bourImmersedLinkAreaDensity_error g h link hLink hImm z hDim hε hSmall'
      (fun v => by simpa only [mul_assoc,
        Real.mul_self_sqrt (metric_inner_self_nonneg g (link z) v)] using hForm z v v)
    exact hArea'.trans (by linarith)
  have hInt : Integrable (fun z => ρ z * bourEulerBoundaryDensity (shape z) (curvature z)) μ := by
    refine (integrable_const (412 * (20 * ε) + 4)).mono'
      (((riemannianVolumeDensity_contMDiff round induced).continuous.measurable.mul
        hMeas).aestronglyMeasurable) ?_
    exact Eventually.of_forall fun z => by
      rw [Real.norm_eq_abs]
      have h := bourEulerBoundaryDensity_withArea_error hScaled hSmall
        (hShape z) (hCurvature z) (hArea z)
      have hTri := abs_add_le (ρ z * bourEulerBoundaryDensity (shape z) (curvature z) - 4) 4
      rw [sub_add_cancel] at hTri
      linarith only [h, hTri, abs_of_nonneg (by norm_num : (0 : ℝ) ≤ 4)]
  change |(∫ z, bourEulerBoundaryDensity (shape z) (curvature z)
    ∂(riemannianVolumeMeasure J L induced)) - 4 * μ.real Set.univ| ≤ _
  rw [integral_riemannianVolumeMeasure_eq_integral_volumeDensity_smul round induced]
  simp only [smul_eq_mul]
  exact bourEulerBoundaryIntegral_error μ shape curvature ρ hScaled hSmall
    (Eventually.of_forall hShape) (Eventually.of_forall hCurvature)
    (Eventually.of_forall hArea) hInt

end MeasuredLinks

/-- Integrate the coefficient of the four-dimensional Pfaffian
transgression along the affine connection path. The coefficient is
written in the outward-positive convention with ambient tangential
curvature. The geometric identification with the Pfaffian primitive is
the finite-boundary Chern–Gauss–Bonnet input. -/
theorem bourEulerBoundaryDensity_eq_integral_connectionPath
    (shape curvature : Matrix (Fin 3) (Fin 3) ℝ) :
    (∫ t in (0 : ℝ)..1,
      (2 * ∑ i : Fin 3, ∑ j : Fin 3, shape i j * curvature i j) +
        (6 * shape.det) * (1 - t ^ 2)) =
      bourEulerBoundaryDensity shape curvature := by
  have hPoly : IntervalIntegrable (fun t : ℝ => (1 : ℝ) - t ^ 2) volume 0 1 :=
    (show Continuous (fun t : ℝ => (1 : ℝ) - t ^ 2) by fun_prop).intervalIntegrable _ _
  have hPow : IntervalIntegrable (fun t : ℝ => t ^ 2) volume 0 1 :=
    (continuous_id.pow 2).intervalIntegrable _ _
  let mixed : ℝ := 2 * ∑ i : Fin 3, ∑ j : Fin 3, shape i j * curvature i j
  let cubic : ℝ := 6 * shape.det
  change (∫ t in (0 : ℝ)..1, mixed + cubic * (1 - t ^ 2)) = _
  rw [intervalIntegral.integral_add intervalIntegrable_const (hPoly.const_mul cubic),
    intervalIntegral.integral_const_mul cubic, intervalIntegral.integral_sub intervalIntegrable_const hPow,
    intervalIntegral.integral_const, intervalIntegral.integral_const, integral_pow]
  simp only [bourEulerBoundaryDensity, smul_eq_mul, mixed, cubic]
  ring

end SmoothPoincare
