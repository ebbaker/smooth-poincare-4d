import SmoothPoincare.Variational.ExactFacePhysicalInterpolation

open DifferentialGeometry Manifold Set SmoothPoincare
open scoped ContDiff Manifold

#check exactFaceNormalizingExponent_face_jet
#check exactFaceNormalizedMetric_tangent_inner
#check exactFaceNormalizedMetric_first_tangential_jet
#check exists_exactFacePhysicalPath
#check exactFacePhysicalPath_joint_coefficient
#check exactFaceNormalizedPath_pullback_sub_round
#check exactFaceJetSplice_derivs
#check exists_exactFaceCutoff_deriv_bounds
#check exactFaceDefect_taylor_bounds
#check exactFacePhysicalPath_chiralMeasure
#check exactFacePhysicalPath_side_change
#check exactFacePhysicalPath_joined_bound
#check exists_exactFace_subwidth_budgets

#print axioms exactFaceNormalizingExponent_face_jet
#print axioms exactFaceNormalizedMetric_first_tangential_jet
#print axioms exists_exactFacePhysicalPath
#print axioms exactFacePhysicalPath_joint_coefficient
#print axioms exactFaceNormalizedPath_pullback_sub_round
#print axioms exactFaceJetSplice_derivs
#print axioms exists_exactFaceCutoff_deriv_bounds
#print axioms exactFaceDefect_taylor_bounds
#print axioms exactFacePhysicalPath_chiralMeasure
#print axioms exactFacePhysicalPath_side_change
#print axioms exactFacePhysicalPath_joined_bound
#print axioms exists_exactFace_subwidth_budgets

example : exactFaceCutoff (1 / 3) (2 / 3) (-1 / 3) = 0 :=
  exactFaceCutoff_eq_zero (by norm_num) (by norm_num) (Or.inl (by norm_num))

example : exactFaceCutoff (1 / 3) (2 / 3) (2 / 3) = 0 :=
  exactFaceCutoff_eq_zero (by norm_num) (by norm_num) (Or.inr (by norm_num))

example : exactFaceCutoff (1 / 3) (2 / 3) (1 / 8) = 1 :=
  exactFaceCutoff_eq_one (by norm_num) (by norm_num) (by norm_num) (by norm_num)

local notation "J" => ModelWithCorners.prod (𝓡 3) (𝓘(ℝ))

example (x : ExactFaceSphere) :
    let F := (Diffeomorph.refl J ExactFaceTube ∞).toPartialDiffeomorph
    let hS : exactFaceSlab (1 / 3) (2 / 3) ⊆ F.source := by
      exact Set.subset_univ _
    HasDerivAt (fun t : ℝ => exactFaceNormalizingExponent F (.const 3) (.const 6)
      (by norm_num) (by norm_num) hS (F (x, t))) (-2 : ℝ) 0 := by
  intro F hS
  have h := (exactFaceNormalizingExponent_face_jet F (.const 3) (.const 6)
    (by norm_num) (by norm_num) hS x).2
  change HasDerivAt _ (-((6 : ℝ) / 3)) 0 at h
  convert h using 1 <;> norm_num
