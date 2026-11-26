import SmoothPoincare.Variational.BourMarkedBoundaryJets
import SmoothPoincare.Variational.BourTrajectoryBudget
import DifferentialGeometry.Geometry.Connection.ConnectionForm.Curvature
import Mathlib.Tactic.Module

/-! # Outward Euler transgression of a finite Bour truncation

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
Actual serving model and effort are unavailable. The boundary uses the
outward-normal-first orientation and positive Euclidean sphere shape.
-/

noncomputable section

set_option maxHeartbeats 700000

open DifferentialGeometry DifferentialGeometry.Geometry.Connection
  DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Integral.Measure
  FirstOrderTwistor Filter MeasureTheory
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

section Connection

variable {V W : Type*} [NormedAddCommGroup V] [NormedSpace ℝ V]
  [NormedAddCommGroup W] [NormedSpace ℝ W]

/-- The coefficient of the connection term linear in the interpolation
parameter, in a fixed local trivialization. -/
theorem bourConnectionFormCurvature_affine
    (A Θ : V → V →L[ℝ] W →L[ℝ] W) {x : V}
    (hA : DifferentiableAt ℝ A x) (hΘ : DifferentiableAt ℝ Θ x)
    (X Y : V) (v : W) (t : ℝ) :
    connectionFormCurvature (A + t • Θ) x X Y v =
      connectionFormCurvature A x X Y v +
      t • ((fderiv ℝ Θ x X) Y v - (fderiv ℝ Θ x Y) X v +
        A x X (Θ x Y v) - A x Y (Θ x X v) +
        Θ x X (A x Y v) - Θ x Y (A x X v)) +
      t ^ 2 • (Θ x X (Θ x Y v) - Θ x Y (Θ x X v)) := by
  let F := fun y => A y + t • Θ y
  have hS : DifferentiableAt ℝ (fun y : V => t • Θ y) x :=
    DifferentiableAt.fun_const_smul (𝕜 := ℝ) (F := (V →L[ℝ] W →L[ℝ] W)) hΘ t
  have hDeriv : fderiv ℝ F x = fderiv ℝ A x + t • fderiv ℝ Θ x := by
    dsimp only [F]
    rw [fderiv_fun_add (𝕜 := ℝ) (F := (V →L[ℝ] W →L[ℝ] W)) hA hS]
    exact congrArg (fun L => fderiv ℝ A x + L) (fderiv_fun_const_smul (𝕜 := ℝ) (F := (V →L[ℝ] W →L[ℝ] W)) hΘ t)
  change connectionFormCurvature F x X Y v = _
  unfold connectionFormCurvature
  rw [hDeriv]
  dsimp only [F]
  simp only [add_apply, smul_apply, map_add, map_smul]
  module

/-- The two mixed connection-form coefficients have opposite signs, by
differentiation of metric orthogonality in the supplied local bundle
trivialization. Here `ν` is the actual chosen unit normal field, and `e`
one of the tangent fields. -/
theorem bourBoundaryMixedConnection_eq_neg
    {C : V → V →L[ℝ] W →L[ℝ] W} {G : V → W →L[ℝ] W →L[ℝ] ℝ}
    {ν e : V → W} {x : V} (X : V)
    (hG : DifferentiableAt ℝ G x) (hν : DifferentiableAt ℝ ν x)
    (he : DifferentiableAt ℝ e x)
    (hMetric : ∀ v w, fderiv ℝ G x X v w =
      G x (C x X v) w + G x v (C x X w))
    (hOrth : ∀ᶠ y in 𝓝 x, G y (e y) (ν y) = 0)
    (hSymm : ∀ v w, G x v w = G x w v) :
    G x (connectionFormCovDeriv C e X x) (ν x) =
      -G x (connectionFormCovDeriv C ν X x) (e x) := by
  rw [connectionFormCovDeriv_inner_eq_neg_of_orthogonal hG he hν X hMetric hOrth]
  rw [hSymm (e x)]

/-- The normal defect of the physical immersion is minus its
outward-normal derivative paired with the tangent vector. The normal line
premise is the codimension-one orthogonal-complement statement, and the
ambient and intrinsic connections are kept distinct. -/
theorem bourImmersionNormalDefect_eq_neg_shape
    (A : V → V →L[ℝ] V →L[ℝ] V) (C : V → V →L[ℝ] W →L[ℝ] W)
    (J : V → V →L[ℝ] W) (G : V → W →L[ℝ] W →L[ℝ] ℝ)
    (ν : V → W) {x : V} (X u : V)
    (hJ : DifferentiableAt ℝ J x) (hG : DifferentiableAt ℝ G x)
    (hν : DifferentiableAt ℝ ν x) (hUnit : G x (ν x) (ν x) = 1)
    (hSymm : ∀ v w, G x v w = G x w v)
    (hMetric : ∀ v w, fderiv ℝ G x X v w =
      G x (C x X v) w + G x v (C x X w))
    (hOrth : ∀ᶠ y in 𝓝 x, ∀ v, G y (J y v) (ν y) = 0)
    (hDefect : ∀ v, G x (bundleMapCovDeriv A C J x X u) (J x v) = 0)
    (hLine : ∀ w, (∀ v, G x w (J x v) = 0) → ∃ k : ℝ, w = k • ν x) :
    bundleMapCovDeriv A C J x X u =
      (-G x (connectionFormCovDeriv C ν X x) (J x u)) • ν x := by
  obtain ⟨k, hk⟩ := hLine _ hDefect
  have hJu : DifferentiableAt ℝ (fun y => J y u) x := hJ.clm_apply (differentiableAt_const u)
  have hSign := bourBoundaryMixedConnection_eq_neg X hG hν hJu hMetric
    (hOrth.mono fun y hy => hy u) hSymm
  have hd : fderiv ℝ (fun y => J y u) x X = fderiv ℝ J x X u := by
    rw [(hJ.hasFDerivAt.clm_apply (hasFDerivAt_const u x)).fderiv]
    simp
  unfold connectionFormCovDeriv at hSign
  rw [hd] at hSign
  have hPair : G x (bundleMapCovDeriv A C J x X u) (ν x) =
      -G x (connectionFormCovDeriv C ν X x) (J x u) := by
    unfold bundleMapCovDeriv
    rw [map_sub]
    change G x (fderiv ℝ J x X u + C x X (J x u)) (ν x) -
      G x (J x (A x X u)) (ν x) = _
    rw [hOrth.self_of_nhds (A x X u), sub_zero]
    exact hSign
  rw [hk, map_smul] at hPair
  change k * G x (ν x) (ν x) = _ at hPair
  rw [hUnit, mul_one] at hPair
  exact hk.trans (congrArg (fun s : ℝ => s • ν x) hPair)

end Connection

section Coefficients

/-- Alternating product of two shape rows in the ordered tangent basis. -/
def bourShapeWedge (S : Matrix (Fin 3) (Fin 3) ℝ) (a b i j : Fin 3) : ℝ :=
  S a i * S b j - S a j * S b i

/-- Coefficients of the tangential curvature along the affine path from
the split (normal line plus tangent connection) to the ambient connection. -/
def bourBoundaryPathTangentialCurvature
    (S : Matrix (Fin 3) (Fin 3) ℝ) (R : Fin 3 → Fin 3 → Fin 3 → Fin 3 → ℝ)
    (t : ℝ) (a b i j : Fin 3) : ℝ :=
  R a b i j + (1 - t ^ 2) * bourShapeWedge S a b i j

section AdaptedConnection

variable {V W : Type*} [NormedAddCommGroup V] [NormedSpace ℝ V]
  [NormedAddCommGroup W] [NormedSpace ℝ W]

/-- Curvature of the real affine connection path in an adapted boundary
chart. The inclusion `J` and the ambient metric `G` are kept fixed.
The splitting property is first order: applying `Θ` to a tangent vector
is the normal defect of differentiating the immersion. No Gauss or Euler
formula for the interpolated curvature is assumed. -/
theorem bourBoundaryPathTangentialCurvature_of_connectionForms
    (A : V → V →L[ℝ] V →L[ℝ] V) (C Θ : V → V →L[ℝ] W →L[ℝ] W)
    (J : V → V →L[ℝ] W) (G : V → W →L[ℝ] W →L[ℝ] ℝ)
    {x : V} (hA : DifferentiableAt ℝ A x) (hC : DifferentiableAt ℝ C x)
    (hΘ : DifferentiableAt ℝ Θ x) (hJ : ContDiffAt ℝ 2 J x)
    (hG : DifferentiableAt ℝ G x) (hSymm : ∀ v w, G x v w = G x w v)
    (hMetric : ∀ X v w, fderiv ℝ G x X v w =
      G x (C x X v) w + G x v (C x X w))
    (hSkew : ∀ X v w, G x (Θ x X v) w + G x v (Θ x X w) = 0)
    (hNormal : ∀ᶠ y in 𝓝 x, ∀ X u v,
      G y (bundleMapCovDeriv A C J y X u) (J y v) = 0)
    (hSplit : ∀ᶠ y in 𝓝 x, ∀ X u,
      Θ y X (J y u) = bundleMapCovDeriv A C J y X u)
    (e : Fin 3 → V) (ν : W) (hUnit : G x ν ν = 1)
    (S : Matrix (Fin 3) (Fin 3) ℝ)
    (hShape : ∀ a i, bundleMapCovDeriv A C J x (e i) (e a) = (-S a i) • ν)
    (t : ℝ) (a b i j : Fin 3) :
    let R := fun a b i j =>
      G x (connectionFormCurvature C x (e i) (e j) (J x (e b))) (J x (e a))
    G x (connectionFormCurvature (C + (t - 1) • Θ) x (e i) (e j) (J x (e b))) (J x (e a)) =
      bourBoundaryPathTangentialCurvature S R t a b i j := by
  intro R
  let P := C + (t - 1) • Θ
  have hP : DifferentiableAt ℝ P x := by
    change DifferentiableAt ℝ (fun y => C y + (t - 1) • Θ y) x
    exact DifferentiableAt.fun_add (𝕜 := ℝ) (F := (V →L[ℝ] W →L[ℝ] W)) hC
      (DifferentiableAt.fun_const_smul (𝕜 := ℝ) (F := (V →L[ℝ] W →L[ℝ] W)) hΘ (t - 1))
  have hPeer : ∀ᶠ y in 𝓝 x, ∀ X u,
      bundleMapCovDeriv A P J y X u = t • bundleMapCovDeriv A C J y X u := by
    filter_upwards [hSplit] with y hy X u
    unfold P bundleMapCovDeriv
    simp only [Pi.add_apply, Pi.smul_apply, add_apply,
      smul_apply]
    rw [hy X u]
    unfold bundleMapCovDeriv
    module
  have hOrthP : ∀ᶠ y in 𝓝 x, ∀ X u v,
      G y (bundleMapCovDeriv A P J y X u) (J y v) = 0 := by
    filter_upwards [hNormal, hPeer] with y hy hyP X u v
    rw [hyP X u, map_smul]
    change t * G y (bundleMapCovDeriv A C J y X u) (J y v) = 0
    rw [hy X u v, mul_zero]
  have hMetricP (X : V) (v w : W) :
      fderiv ℝ G x X v w = G x (P x X v) w + G x v (P x X w) := by
    simp only [P, Pi.add_apply, Pi.smul_apply, add_apply,
      smul_apply, map_add, map_smul]
    change _ = (G x (C x X v) w + (t - 1) * G x (Θ x X v) w) +
      (G x v (C x X w) + (t - 1) * G x v (Θ x X w))
    rw [hMetric X v w]
    have hs := congrArg (fun z : ℝ => (t - 1) * z) (hSkew X v w)
    linarith only [hs]
  have hAmbient := gauss_equation_connection_forms hA hC hJ hG hSymm hMetric hNormal
    (e i) (e j) (e b) (e a)
  have hPath := gauss_equation_connection_forms hA hP hJ hG hSymm hMetricP hOrthP
    (e i) (e j) (e b) (e a)
  have hScale (X u : V) : bundleMapCovDeriv A P J x X u =
      t • bundleMapCovDeriv A C J x X u := hPeer.self_of_nhds X u
  rw [hScale, hScale, hScale, hScale, hShape, hShape, hShape, hShape] at hPath
  rw [hShape, hShape, hShape, hShape] at hAmbient
  simp only [smul_smul, map_smul, smul_apply, smul_eq_mul,
    hUnit, mul_one] at hPath hAmbient
  change G x (connectionFormCurvature P x (e i) (e j) (J x (e b))) (J x (e a)) = _
  unfold bourBoundaryPathTangentialCurvature bourShapeWedge R
  linear_combination hAmbient - hPath

end AdaptedConnection

/-- The complementary tangent wedge matrix uses the positively cyclic wedge
order induced by the outward-normal-first frame. -/
def bourBoundaryComplementaryWedges (R : Fin 3 → Fin 3 → Fin 3 → Fin 3 → ℝ) :
    Matrix (Fin 3) (Fin 3) ℝ :=
  fun a i => R (a + 1) (a + 2) (i + 1) (i + 2)

/-- In each complementary cyclic wedge, the contraction of one shape row
with the other two rows' alternating product gives the determinant. -/
theorem bourShapeWedge_cyclic_contraction (S : Matrix (Fin 3) (Fin 3) ℝ) (a : Fin 3) :
    (∑ i : Fin 3, S a i * bourShapeWedge S (a + 1) (a + 2) (i + 1) (i + 2)) =
      S.det := by
  fin_cases a <;> simp only [Fin.sum_univ_three, bourShapeWedge, Matrix.det_fin_three] <;>
    norm_num [Fin.add_def] <;> ring

/-- The outward correction is minus the project Euler transgression. In
the adapted frame, the mixed normal-first connection coefficients are
minus the shape and the tangential connection differences vanish. The
three surviving alternating terms give the complementary wedge pairing. -/
theorem bourFrameEulerTransgression_boundary
    (S : Matrix (Fin 3) (Fin 3) ℝ) (Θ : Fin 4 → Fin 4 → Fin 4 → ℝ)
    (R : CurvatureFrameTensor)
    (hMixed : ∀ a i : Fin 3, Θ 0 a.succ i.succ = -S a i)
    (hTangent : ∀ a b i : Fin 3, Θ a.succ b.succ i.succ = 0)
    (hSkewFiber : ∀ a b i j, R a b i j = -R b a i j)
    (hSkewBase : ∀ a b i j, R a b i j = -R a b j i) :
    -frameEulerTransgression Θ R 1 2 3 =
      2 * ∑ a : Fin 3, ∑ i : Fin 3, S a i *
        (bourBoundaryComplementaryWedges (fun b c j k => R b.succ c.succ j.succ k.succ)) a i := by
  have hm₀ (i : Fin 3) : Θ 0 1 i.succ = -S 0 i := hMixed 0 i
  have hm₁ (i : Fin 3) : Θ 0 2 i.succ = -S 1 i := hMixed 1 i
  have hm₂ (i : Fin 3) : Θ 0 3 i.succ = -S 2 i := hMixed 2 i
  have ht₀ (i : Fin 3) : Θ 2 3 i.succ = 0 := hTangent 1 2 i
  have ht₁ (i : Fin 3) : Θ 1 3 i.succ = 0 := hTangent 0 2 i
  have ht₂ (i : Fin 3) : Θ 1 2 i.succ = 0 := hTangent 0 1 i
  have hm (i j : Fin 4) : R 3 1 i j = -R 1 3 i j := hSkewFiber _ _ _ _
  have hb (a b : Fin 4) : R a b 3 1 = -R a b 1 3 := hSkewBase _ _ _ _
  unfold frameEulerTransgression bourBoundaryComplementaryWedges
  simp only [Fin.sum_univ_three]
  change _ = 2 * ((S 0 0 * R 2 3 2 3 + S 0 1 * R 2 3 3 1 + S 0 2 * R 2 3 1 2) +
    (S 1 0 * R 3 1 2 3 + S 1 1 * R 3 1 3 1 + S 1 2 * R 3 1 1 2) +
    (S 2 0 * R 1 2 2 3 + S 2 1 * R 1 2 3 1 + S 2 2 * R 1 2 1 2))
  rw [hm 2 3, hm 3 1, hm 1 2, hb 2 3, hb 1 3, hb 1 2]
  have h1 : (0 : Fin 3).succ = 1 := rfl
  have h2 : (1 : Fin 3).succ = 2 := rfl
  have h3 : (2 : Fin 3).succ = 3 := rfl
  have hEval (a b : Fin 4) (v : Fin 3 → ℝ) (h : ∀ i, Θ a b i.succ = v i) :
      Θ a b 1 = v 0 ∧ Θ a b 2 = v 1 ∧ Θ a b 3 = v 2 :=
    ⟨h1 ▸ h 0, h2 ▸ h 1, h3 ▸ h 2⟩
  obtain ⟨hm00, hm01, hm02⟩ := hEval 0 1 _ hm₀
  obtain ⟨hm10, hm11, hm12⟩ := hEval 0 2 _ hm₁
  obtain ⟨hm20, hm21, hm22⟩ := hEval 0 3 _ hm₂
  obtain ⟨ht00, ht01, ht02⟩ := hEval 2 3 _ ht₀
  obtain ⟨ht10, ht11, ht12⟩ := hEval 1 3 _ ht₁
  obtain ⟨ht20, ht21, ht22⟩ := hEval 1 2 _ ht₂
  rw [hm00, hm01, hm02, hm10, hm11, hm12, hm20, hm21, hm22,
    ht00, ht01, ht02, ht10, ht11, ht12, ht20, ht21, ht22]
  ring

/-- Alternating Pfaffian pairing after insertion of the actual affine
curvature coefficients. The three determinant terms are computed rather
than postulated in the curvature interpolation. -/
theorem bourBoundaryPath_pfaffianCoefficient
    (S : Matrix (Fin 3) (Fin 3) ℝ) (R : Fin 3 → Fin 3 → Fin 3 → Fin 3 → ℝ)
    (t : ℝ) :
    2 * (∑ a : Fin 3, ∑ i : Fin 3, S a i *
      bourBoundaryComplementaryWedges (bourBoundaryPathTangentialCurvature S R t) a i) =
      2 * (∑ a : Fin 3, ∑ i : Fin 3, S a i * bourBoundaryComplementaryWedges R a i) +
        (6 * S.det) * (1 - t ^ 2) := by
  unfold bourBoundaryComplementaryWedges bourBoundaryPathTangentialCurvature
  simp_rw [mul_add, ← mul_left_comm (1 - t ^ 2), Finset.sum_add_distrib, ← Finset.mul_sum,
    bourShapeWedge_cyclic_contraction]
  simp only [Finset.sum_const, Finset.card_univ, Fintype.card_fin, nsmul_eq_mul, Nat.cast_ofNat]
  ring

/-- The finite integral of the outward Pfaffian pairing of the split
connection with the path curvature. The input is the pointwise tangential
curvature identity of the actual affine path. The result supplies the
local boundary integrand, before any bulk integration or topological
identification. -/
theorem bourFrameEulerTransgression_boundary_integral
    (S : Matrix (Fin 3) (Fin 3) ℝ) (Θ : Fin 4 → Fin 4 → Fin 4 → ℝ)
    (F : ℝ → CurvatureFrameTensor) (R : Fin 3 → Fin 3 → Fin 3 → Fin 3 → ℝ)
    (hMixed : ∀ a i : Fin 3, Θ 0 a.succ i.succ = -S a i)
    (hTangent : ∀ a b i : Fin 3, Θ a.succ b.succ i.succ = 0)
    (hSkewFiber : ∀ t a b i j, F t a b i j = -F t b a i j)
    (hSkewBase : ∀ t a b i j, F t a b i j = -F t a b j i)
    (hPath : ∀ (t : ℝ) (a b i j : Fin 3),
      F t a.succ b.succ i.succ j.succ = bourBoundaryPathTangentialCurvature S R t a b i j) :
    (∫ t in (0 : ℝ)..1, -frameEulerTransgression Θ (F t) 1 2 3) =
      bourEulerBoundaryDensity S (bourBoundaryComplementaryWedges R) := by
  have hPoint (t : ℝ) :
      -frameEulerTransgression Θ (F t) 1 2 3 =
        2 * (∑ a : Fin 3, ∑ i : Fin 3, S a i * bourBoundaryComplementaryWedges R a i) +
          (6 * S.det) * (1 - t ^ 2) := by
    rw [bourFrameEulerTransgression_boundary S Θ (F t) hMixed hTangent
      (hSkewFiber t) (hSkewBase t)]
    simp_rw [hPath t]
    exact bourBoundaryPath_pfaffianCoefficient S R t
  simp_rw [hPoint]
  exact bourEulerBoundaryDensity_eq_integral_connectionPath S (bourBoundaryComplementaryWedges R)

end Coefficients

section FiniteCore

variable {E H M : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [SigmaCompactSpace M] [BoundarylessManifold I M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- The finite bulk term on the actual scalar-flat truncation, with separate
positive and negative Weyl measures. Its signature and topology are not
needed for this geometric identity. -/
theorem bourEulerBulk_setIntegral_eq_scalarFlat
    (g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4)
    (frame : ∀ x, OrientedOrthonormalFrameAt g o x) (K : Set M)
    (hScalar : ∀ᵐ x ∂(riemannianVolumeMeasure I M g).restrict K, metricScalarAt g x = 0)
    (hPlus : IntegrableOn (modifiedChargeDensity o g frame .plus) K (riemannianVolumeMeasure I M g))
    (hMinus : IntegrableOn (modifiedChargeDensity o g frame .minus) K (riemannianVolumeMeasure I M g))
    (hRicci : IntegrableOn (modifiedChargeDensity o g frame .ricci) K (riemannianVolumeMeasure I M g)) :
    (∫ x in K, intrinsicEulerDensity g x ∂riemannianVolumeMeasure I M g) =
      Bour.bourChargeOn o g frame K .plus + Bour.bourChargeOn o g frame K .minus -
        Bour.bourChargeOn o g frame K .ricci / 2 := by
  let d := modifiedChargeDensity o g frame
  let μ := (riemannianVolumeMeasure I M g).restrict K
  change (∫ x, intrinsicEulerDensity g x ∂μ) =
    (∫ x, d .plus x ∂μ) + (∫ x, d .minus x ∂μ) - (∫ x, d .ricci x ∂μ) / 2
  have hp : Integrable (d .plus) μ := hPlus
  have hn : Integrable (d .minus) μ := hMinus
  have hr : Integrable (d .ricci) μ := hRicci
  calc
    _ = ∫ x, d .plus x + d .minus x - d .ricci x / 2 ∂μ := by
      apply integral_congr_ae
      filter_upwards [hScalar] with x hx
      rw [intrinsicEulerDensity_eq_modifiedChargeDensity g o frame x]
      have hz : d .scalar x = 0 := by simp [d, modifiedChargeDensity, hx]
      change d .plus x + d .minus x + d .scalar x / 24 - d .ricci x / 2 = _
      rw [hz, zero_div, add_zero]
    _ = _ := by
      have hsum : Integrable (fun x => d .plus x + d .minus x) μ := hp.add hn
      calc
        _ = (∫ x, d .plus x + d .minus x ∂μ) - (∫ x, d .ricci x / 2 ∂μ) :=
          integral_sub hsum (hr.div_const 2)
        _ = _ := by rw [integral_add hp hn, integral_div]

end FiniteCore

end SmoothPoincare
