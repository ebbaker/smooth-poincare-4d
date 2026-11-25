import SmoothPoincare.Immersions.ImmersionChart
import Mathlib.Analysis.InnerProductSpace.Dual
import Mathlib.Analysis.Real.Sqrt
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic

/-! # Weingarten's equation and the middle Gauss Jacobian in a principal frame -/

open DifferentialGeometry DifferentialGeometry.Geometry DifferentialGeometry.Geometry.Connection
open DifferentialGeometry.Topology.Morse
open FirstOrderTwistor Filter Manifold Module
open scoped BigOperators ContDiff Manifold Topology

namespace SmoothPoincare

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  {g : SmoothRiemannianMetric I M} {o : ManifoldOrientation I M 4} {p : M}
  {F : IsometricHypersurface g}

local notation "V₅" => EuclideanSpace ℝ (Fin 5)
local notation "z₀" => extChartAt I p p

omit [FiniteDimensional ℝ E] in
private theorem principalChart_smooth (F : IsometricHypersurface g) :
    ContDiffAt ℝ 2 (F.localMap p) z₀ := by
  have h := (contMDiffAt_iff.mp (F.smooth.contMDiffAt (x := p))).2
  rw [ModelWithCorners.Boundaryless.range_eq_univ, contDiffWithinAt_univ] at h
  exact h.of_le (by decide : (2 : ℕ∞ω) ≤ ∞)

omit [FiniteDimensional ℝ E] in
private theorem chartDifferential_tangent (F : IsometricHypersurface g) (u : TangentSpace I p) :
    fderiv ℝ (F.localMap p) z₀ u = mfderiv I 𝓘(ℝ,V₅) F.map p u :=
  (tangentLinearMapToModel_mfderiv_eq_fderiv_writtenInExtChartAt
    (F.smooth.mdifferentiableAt (by simp)) u).symm

private theorem principalAmbient_inner (P : PrincipalFrameAt F o p) (i j : Fin 4) :
    inner ℝ (fderiv ℝ (F.localMap p) z₀ (P.frame.basis i))
      (fderiv ℝ (F.localMap p) z₀ (P.frame.basis j)) = if i = j then 1 else 0 := by
  exact (congrArg₂ (inner ℝ) (chartDifferential_tangent F _) (chartDifferential_tangent F _)).trans
    ((F.isometric p _ _).trans (P.frame.orthonormal i j))

private theorem principalAmbient_perpendicular (P : PrincipalFrameAt F o p) (i : Fin 4) :
    inner ℝ P.normal (fderiv ℝ (F.localMap p) z₀ (P.frame.basis i)) = 0 :=
  (congrArg (inner ℝ P.normal) (chartDifferential_tangent F _)).trans (P.perpendicular _)

private theorem ambientNormalAndTangent_ext (t : Fin 4 → V₅) (N : V₅)
    (ht : Orthonormal ℝ t) (hUnit : inner ℝ N N = 1)
    (hPerp : ∀ i, inner ℝ N (t i) = 0) {v w : V₅}
    (hn : inner ℝ N v = inner ℝ N w)
    (hTangent : ∀ i, inner ℝ (t i) v = inner ℝ (t i) w) : v = w := by
  let family : Fin 5 → V₅ := Fin.cases N t
  have ho : Orthonormal ℝ family := by
    rw [orthonormal_iff_ite]
    intro i j
    refine Fin.cases ?_ (fun i => ?_) i <;> refine Fin.cases ?_ (fun j => ?_) j
    · simpa [family] using hUnit
    · simpa [family, Ne.symm (Fin.succ_ne_zero j)] using hPerp j
    · simpa [family, real_inner_comm (t i)] using hPerp i
    · simpa [family] using orthonormal_iff_ite.mp ht i j
  let basis := basisOfLinearIndependentOfCardEqFinrank ho.linearIndependent (by simp)
  refine InnerProductSpace.ext_inner_left_basis basis (fun i => ?_)
  simp only [basis, coe_basisOfLinearIndependentOfCardEqFinrank]
  exact Fin.cases hn hTangent i

/-- The four given orthonormal tangent vectors and the unit normal
span Euclidean five-space. Orthogonality to the tangent vectors therefore
identifies a vector with its projection onto the normal line. -/
theorem ambientOrthogonal_eq_inner_smul_normal (t : Fin 4 → V₅) (N w : V₅)
    (ht : Orthonormal ℝ t) (hUnit : inner ℝ N N = 1)
    (hPerp : ∀ i, inner ℝ N (t i) = 0) (hw : ∀ i, inner ℝ w (t i) = 0) :
    w = (inner ℝ w N) • N := by
  apply ambientNormalAndTangent_ext t N ht hUnit hPerp
  · rw [real_inner_smul_right, hUnit, mul_one, real_inner_comm w N]
  · intro i
    rw [real_inner_comm w (t i), hw i, real_inner_smul_right,
      real_inner_comm N (t i), hPerp i, mul_zero]

private theorem normalAndTangent_span (P : PrincipalFrameAt F o p) {v w : V₅}
    (hn : inner ℝ P.normal v = inner ℝ P.normal w)
    (ht : ∀ i, let t := fderiv ℝ (F.localMap p) z₀ (P.frame.basis i)
      inner ℝ t v = inner ℝ t w) : v = w :=
  ambientNormalAndTangent_ext _ P.normal (orthonormal_iff_ite.mpr (principalAmbient_inner P))
    P.unit (principalAmbient_perpendicular P) hn ht

/-- For the actual normal germ of the written chart of the immersion, its
derivative in a principal direction is the opposite principal curvature
times the image of that direction under the immersion differential. -/
theorem principalNormal_derivative (P : PrincipalFrameAt F o p)
    (n : E → V₅) (hn : DifferentiableAt ℝ n z₀)
    (hnormal : ∀ᶠ y in 𝓝 z₀, inner ℝ (n y) (n y) = 1 ∧
      ∀ v, inner ℝ (fderiv ℝ (F.localMap p) y v) (n y) = 0)
    (hp : n z₀ = P.normal) (i : Fin 4) :
    fderiv ℝ n z₀ (P.frame.basis i) =
      (-P.curvature i) • fderiv ℝ (F.localMap p) z₀ (P.frame.basis i) := by
  let f := F.localMap p
  let X : E := P.frame.basis i
  let J := fderiv ℝ f
  have hJ : DifferentiableAt ℝ J z₀ :=
    ((principalChart_smooth (p := p) F).fderiv_right (m := 1) (by norm_num)).differentiableAt (by norm_num)
  have hc := hnormal.self_of_nhds
  apply normalAndTangent_span P
  · change inner ℝ P.normal (fderiv ℝ n z₀ X) = inner ℝ P.normal ((-P.curvature i) • J z₀ X)
    rw [← hp, real_inner_smul_right, normalDerivative_orthogonal hn (hnormal.mono fun _ h => h.1) X]
    rw [real_inner_comm (J z₀ X) (n z₀), hc.2 X, mul_zero]
  · intro j
    let Y : E := P.frame.basis j
    change inner ℝ (J z₀ Y) (fderiv ℝ n z₀ X) = inner ℝ (J z₀ Y) ((-P.curvature i) • J z₀ X)
    have he : (fun y => inner ℝ (J y Y) (n y)) =ᶠ[𝓝 z₀] (fun _ => (0 : ℝ)) :=
      hnormal.mono fun _ h => h.2 Y
    have hd := congrArg (fun L : E →L[ℝ] ℝ => L X) (he.fderiv_eq.trans (fderiv_const_apply _))
    rw [((hJ.hasFDerivAt.clm_apply (hasFDerivAt_const Y z₀)).inner ℝ hn.hasFDerivAt).fderiv] at hd
    simp only [ContinuousLinearMap.comp_apply, ContinuousLinearMap.prod_apply, fderivInnerCLM_apply,
      add_apply, ContinuousLinearMap.flip_apply, zero_apply, map_zero, zero_add] at hd
    let Γ := metricChartConnectionForm g p
    have hII := immersionChart_secondForm F (p := p) Γ (fun a b => metricChartConnectionForm_apply g p z₀ a b) X Y
    change fderiv ℝ J z₀ X Y + 0 - J z₀ (Γ z₀ X Y) =
      secondFundamentalFormAmbientAt g euclideanMetric F.map p (P.frame.basis i) (P.frame.basis j) at hII
    rw [add_zero, P.principal i j] at hII
    rw [sub_eq_iff_eq_add.mp hII, inner_add_left, hc.2, add_zero, hp, real_inner_smul_left, P.unit,
      mul_one] at hd
    rw [real_inner_smul_right]
    change _ = _ * inner ℝ (fderiv ℝ (F.localMap p) z₀ (P.frame.basis j))
      (fderiv ℝ (F.localMap p) z₀ (P.frame.basis i))
    rw [principalAmbient_inner]
    by_cases hij : i = j <;> simp [hij, Ne.symm, eq_comm] at hd ⊢ <;> linarith

/-- The volume Jacobian of the actual Gauss differential in the
given orthonormal principal frame is the absolute principal product. -/
theorem principalNormal_gramJacobian (P : PrincipalFrameAt F o p)
    (n : E → V₅) (hn : DifferentiableAt ℝ n z₀)
    (hnormal : ∀ᶠ y in 𝓝 z₀, inner ℝ (n y) (n y) = 1 ∧
      ∀ v, inner ℝ (fderiv ℝ (F.localMap p) y v) (n y) = 0)
    (hp : n z₀ = P.normal) :
    let gram : Matrix (Fin 4) (Fin 4) ℝ := fun i j =>
      inner ℝ (fderiv ℝ n z₀ (P.frame.basis i)) (fderiv ℝ n z₀ (P.frame.basis j))
    Real.sqrt gram.det = |∏ i, P.curvature i| := by
  let gram : Matrix (Fin 4) (Fin 4) ℝ := fun i j =>
    inner ℝ (fderiv ℝ n z₀ (P.frame.basis i)) (fderiv ℝ n z₀ (P.frame.basis j))
  change Real.sqrt gram.det = _
  have hGram : gram = Matrix.diagonal (fun i => (P.curvature i) ^ 2) := by
    ext i j
    change inner ℝ (fderiv ℝ n z₀ (P.frame.basis i)) (fderiv ℝ n z₀ (P.frame.basis j)) = _
    rw [principalNormal_derivative P n hn hnormal hp i,
      principalNormal_derivative P n hn hnormal hp j,
      real_inner_smul_left, real_inner_smul_right, principalAmbient_inner P,
      Matrix.diagonal_apply]
    by_cases hij : i = j
    · subst j
      simp [pow_two]
    · simp [hij]
  rw [hGram, Matrix.det_diagonal, Finset.prod_pow, Real.sqrt_sq_eq_abs]

/-- A unit ambient direction is critical for the actual height at this
point exactly when it is one of the two principal normals. -/
theorem principalHeight_unitCritical_iff (P : PrincipalFrameAt F o p)
    (v : V₅) (hv : inner ℝ v v = 1) :
    IsCriticalPointAt I (immersionHeight F v) p ↔ v = P.normal ∨ v = -P.normal := by
  rw [immersionHeight_critical_iff]
  constructor
  · intro h
    let t (i : Fin 4) : V₅ := fderiv ℝ (F.localMap p) z₀ (P.frame.basis i)
    let s := inner ℝ v P.normal
    have ht : Orthonormal ℝ t := orthonormal_iff_ite.mpr (principalAmbient_inner P)
    have hEq : v = s • P.normal :=
      ambientOrthogonal_eq_inner_smul_normal t P.normal v ht P.unit
        (principalAmbient_perpendicular P)
        (fun i => (congrArg (inner ℝ v) (chartDifferential_tangent F _)).trans (h (P.frame.basis i)))
    have hs : s ^ 2 = 1 := by
      rw [hEq, real_inner_smul_left, real_inner_smul_right, P.unit, mul_one] at hv
      simpa only [pow_two] using hv
    have hFactor : (s - 1) * (s + 1) = 0 := by nlinarith only [hs]
    rcases mul_eq_zero.mp hFactor with hPos | hNeg
    · have hOne : s = 1 := by linarith only [hPos]
      exact Or.inl (by simpa only [hOne, one_smul] using hEq)
    · have hMinusOne : s = -1 := by linarith only [hNeg]
      exact Or.inr (by simpa only [hMinusOne, neg_one_smul] using hEq)
  · rintro (rfl | rfl) u
    · exact P.perpendicular u
    · let t : V₅ := mfderiv I 𝓘(ℝ,V₅) F.map p u
      change inner ℝ (-P.normal) t = 0
      have ht : inner ℝ P.normal t = 0 := P.perpendicular u
      simp [ht]

end SmoothPoincare
