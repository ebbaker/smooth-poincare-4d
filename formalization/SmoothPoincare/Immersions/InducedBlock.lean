import DifferentialGeometry.Geometry.Submanifold.Gauss
import DifferentialGeometry.Geometry.Metric.RicciSoliton.Models
import FirstOrderTwistor.GeometricChiralBlock
import SectionsAndConnections.ThreeAxisWeyl
import SmoothPoincare.Immersions.PrincipalCurvatures

/-! # The Weyl density of an isometric hypersurface in a principal frame -/

open DifferentialGeometry DifferentialGeometry.Geometry DifferentialGeometry.Geometry.Curvature
open FirstOrderTwistor SectionsAndConnections
open scoped Manifold ContDiff

namespace SmoothPoincare

/-- Ordered curvature slots in an orthonormal frame diagonalizing the
normal-valued second fundamental form with signed entries k. -/
noncomputable def principalGaussTensor (k : Fin 4 → ℝ) : CurvatureFrameTensor :=
  fun a b c d =>
    (if a = c then k a else 0) * (if b = d then k b else 0) -
    (if a = d then k a else 0) * (if b = c then k b else 0)

/-- Compression in the normalized differences of the same complementary wedge
pairs used for the positive basis. These differences form the negative basis. -/
noncomputable def antiSelfDualCurvatureBlock (R : CurvatureFrameTensor) : Matrix (Fin 3) (Fin 3) ℝ :=
  let coeff (p q : Fin 4 × Fin 4) := R p.1 p.2 q.1 q.2
  fun i j =>
    (coeff (selfDualFirstWedge i) (selfDualFirstWedge j) -
      coeff (selfDualFirstWedge i) (selfDualSecondWedge j) -
      coeff (selfDualSecondWedge i) (selfDualFirstWedge j) +
      coeff (selfDualSecondWedge i) (selfDualSecondWedge j)) / 2

theorem principalGauss_chiralBlocks_eq (k : Fin 4 → ℝ) :
    antiSelfDualCurvatureBlock (principalGaussTensor k) =
      selfDualCurvatureBlock (principalGaussTensor k) := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    norm_num [antiSelfDualCurvatureBlock, selfDualCurvatureBlock, principalGaussTensor,
      selfDualFirstWedge, selfDualSecondWedge]

/-- Compress the Gauss tensor in the normalized self-dual basis and remove its
trace. The squared norm is one twelfth of the three squared pair differences. -/
theorem principalGauss_weylNormSq (k : Fin 4 → ℝ) :
    let s₁ := k 0 * k 1 + k 2 * k 3
    let s₂ := k 0 * k 2 + k 1 * k 3
    let s₃ := k 0 * k 3 + k 1 * k 2
    hilbertSchmidtSq (traceFreeChiralBlock (selfDualCurvatureBlock (principalGaussTensor k))) =
      ((s₁-s₂)^2 + (s₁-s₃)^2 + (s₂-s₃)^2) / 12 := by
  have hblock : selfDualCurvatureBlock (principalGaussTensor k) = Matrix.diagonal
      ![(k 0 * k 1 + k 2 * k 3) / 2, (k 0 * k 2 + k 1 * k 3) / 2,
        (k 0 * k 3 + k 1 * k 2) / 2] := by
    ext i j
    fin_cases i <;> fin_cases j <;>
      norm_num [selfDualCurvatureBlock, principalGaussTensor, selfDualFirstWedge,
        selfDualSecondWedge, Matrix.diagonal_apply]
    ring
  dsimp only
  rw [hblock]
  simp [hilbertSchmidtSq, traceFreeChiralBlock, Matrix.trace, Matrix.diagonal_apply,
    Matrix.smul_apply, Matrix.one_apply, Fin.sum_univ_three]
  ring

section Immersion

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]

local notation "V₅" => EuclideanSpace ℝ (Fin 5)

/-- The source metric is induced by this smooth map into Euclidean five-space. -/
structure IsometricHypersurface (g : SmoothRiemannianMetric I M) where
  map : M → V₅
  smooth : ContMDiff I 𝓘(ℝ, V₅) ∞ map
  isometric : ∀ (p : M) (u v : TangentSpace I p),
    euclideanMetric.inner (map p) (mfderiv I 𝓘(ℝ, V₅) map p u)
      (mfderiv I 𝓘(ℝ, V₅) map p v) = g.inner p u v

variable {g : SmoothRiemannianMetric I M} (F : IsometricHypersurface g)
  {o : ManifoldOrientation I M 4} {p : M}

/-- All fields refer to one point of one immersion. No globally smooth
principal fields need be chosen at an eigenvalue crossing. -/
structure PrincipalFrameAt (o : ManifoldOrientation I M 4) (p : M) where
  frame : OrientedOrthonormalFrameAt g o p
  normal : V₅
  unit : inner ℝ normal normal = 1
  perpendicular : ∀ u : TangentSpace I p, inner ℝ normal (mfderiv I 𝓘(ℝ, V₅) F.map p u) = 0
  curvature : Fin 4 → ℝ
  principal : ∀ i j, secondFundamentalFormAmbientAt g euclideanMetric F.map p
    (frame.basis i) (frame.basis j) = (if i = j then curvature i else 0) • normal

variable {F} (P : PrincipalFrameAt F o p)

/-- The Gauss equation in the project's positive sectional slot convention. -/
theorem metricCurvatureFrameTensor_eq_principalGauss :
    metricCurvatureFrameTensor g o p P.frame = principalGaussTensor P.curvature := by
  funext a b c d
  unfold metricCurvatureFrameTensor principalGaussTensor
  rw [gauss_equation_of_inner_map F.smooth F.isometric, metricRm04StandardAt_apply,
    euclideanMetric_metricRm04At_eq_zero]
  have normal_prod (u v : ℝ) :
      euclideanMetric.inner (F.map p) (u • P.normal) (v • P.normal) = u * v := by
    change inner ℝ (u • P.normal) (v • P.normal) = u * v
    simp only [real_inner_smul_left, real_inner_smul_right, P.unit, mul_one]
    exact mul_comm v u
  simp only [zero_apply, zero_add, P.principal, normal_prod]

/-- The two chiral matrices coincide in the paired principal wedge bases for
the induced metric at this point. -/
theorem inducedAntiChiralBlock_eq :
    traceFreeChiralBlock (antiSelfDualCurvatureBlock (metricCurvatureFrameTensor g o p P.frame)) =
      geometricChiralBlock g o p P.frame := by
  unfold geometricChiralBlock
  rw [metricCurvatureFrameTensor_eq_principalGauss P, principalGauss_chiralBlocks_eq]

/-- Intrinsic positive Weyl density of the induced metric in this very frame. -/
theorem inducedChiralBlock_normSq :
    hilbertSchmidtSq (geometricChiralBlock g o p P.frame) =
      principalWeylNormSq (P.curvature 0) (P.curvature 1) (P.curvature 2) (P.curvature 3) := by
  unfold geometricChiralBlock
  rw [metricCurvatureFrameTensor_eq_principalGauss P]
  exact principalGauss_weylNormSq P.curvature

/-- On the middle-signature locus the single-block bound and pointwise
equality classification hold for the actual induced metric. -/
theorem inducedMiddleWeylBound {a b c d : ℝ}
    (hk : P.curvature = ![-a, -b, c, d])
    (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) (hd : 0 < d) :
    let W := hilbertSchmidtSq (geometricChiralBlock g o p P.frame)
    let t := (8 / 3 : ℝ) * (a * b * c * d)
    t ≤ W ∧ (W = t ↔ a = b ∧ b = c ∧ c = d) := by
  dsimp only
  rw [inducedChiralBlock_normSq P, hk]
  change _ ≤ principalWeylNormSq (-a) (-b) c d ∧ (principalWeylNormSq (-a) (-b) c d = _ ↔ _)
  simp only [principalWeylNormSq, neg_mul, mul_neg, neg_neg, ← neg_add]
  exact middleSignatureWeylBound a b c d ha hb hc hd

/-- The independent shape deficit uses the same principal frame, for every sign pattern. -/
theorem inducedShapeDeficitBound :
    let k := P.curvature
    (8 / 9 : ℝ) * max (-(k 0 * k 1 * k 2 * k 3)) 0 ≤
      (traceFreePrincipalNormSq (k 0) (k 1) (k 2) (k 3))^2 / 6 -
        hilbertSchmidtSq (geometricChiralBlock g o p P.frame) := by
  dsimp only
  rw [inducedChiralBlock_normSq P]
  exact shapeDeficitBound _ _ _ _

end Immersion
end SmoothPoincare
