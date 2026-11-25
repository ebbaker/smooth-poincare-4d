import DifferentialGeometry.Geometry.Curvature.Naturality.Pullback.Cross
import FirstOrderTwistor.GeometricChiralBlock

/-!
# Curvature-derived chiral blocks under the marked pullback

The inverse differential pulls each oriented orthonormal frame to the
actual pulled-back metric. Naturality of the four-slot Riemann tensor yields
equality of the full coefficient arrays and hence of their chiral blocks.
-/

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature
open scoped Manifold ContDiff

namespace FirstOrderTwistor

variable {E F H G M N : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
  [TopologicalSpace H] [TopologicalSpace G]
  {I : ModelWithCorners ℝ E H} {J : ModelWithCorners ℝ F G}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [TopologicalSpace N] [ChartedSpace G N] [IsManifold J ∞ N]
  {oM : ManifoldOrientation I M 4} {oN : ManifoldOrientation J N 4}

/-- The target frame pulled back by the inverse differential, oriented by
the given orientations on the two manifolds. -/
noncomputable def pullbackOrientedOrthonormalFrameAt
    (g : SmoothRiemannianMetric J N) (Φ : M ≃ₘ⟮I, J⟯ N)
    (hOrientation : Φ.preservesOrientation oM oN) (x : M)
    (frame : OrientedOrthonormalFrameAt g oN (Φ x)) :
    OrientedOrthonormalFrameAt (Diffeomorph.pullbackMetricCross g Φ) oM x := by
  let D := (Φ.mfderivToContinuousLinearEquiv (by simp) x).toLinearEquiv
  refine ⟨frame.basis.map D.symm, ?_, ?_⟩
  · intro i j
    rw [Diffeomorph.pullbackMetricCross_inner, Module.Basis.map_apply, Module.Basis.map_apply]
    change g.inner (Φ x) (D (D.symm (frame.basis i))) (D (D.symm (frame.basis j))) = _
    rw [D.apply_symm_apply, D.apply_symm_apply]
    exact frame.orthonormal i j
  · rw [Module.Basis.orientation_map]
    apply (Orientation.map (Fin 4) D).injective
    rw [← orientation_map_trans, LinearEquiv.symm_trans_self, Orientation.map_refl]
    exact frame.oriented.trans (hOrientation x).symm

/-- The differential sends each pulled-back basis vector to the marked
target basis vector with the same index. -/
@[simp]
theorem mfderiv_pullbackOrientedOrthonormalFrameAt_basis
    (g : SmoothRiemannianMetric J N) (Φ : M ≃ₘ⟮I, J⟯ N)
    (hOrientation : Φ.preservesOrientation oM oN) (x : M)
    (frame : OrientedOrthonormalFrameAt g oN (Φ x)) (i : Fin 4) :
    mfderiv I J Φ x ((pullbackOrientedOrthonormalFrameAt g Φ hOrientation x frame).basis i) =
      frame.basis i := by
  let D := (Φ.mfderivToContinuousLinearEquiv (by simp) x).toLinearEquiv
  change D ((frame.basis.map D.symm) i) = _
  rw [Module.Basis.map_apply, D.apply_symm_apply]

/-- The paired frames at every source point. This is a pointwise family of
bases, with no requirement of a smooth global trivialization. -/
noncomputable def pullbackOrientedOrthonormalFrames
    (g : SmoothRiemannianMetric J N) (Φ : M ≃ₘ⟮I, J⟯ N)
    (hOrientation : Φ.preservesOrientation oM oN)
    (frames : ∀ y, OrientedOrthonormalFrameAt g oN y) :
    ∀ x, OrientedOrthonormalFrameAt (Diffeomorph.pullbackMetricCross g Φ) oM x :=
  fun x => pullbackOrientedOrthonormalFrameAt g Φ hOrientation x (frames (Φ x))

variable [T2Space N]

private local instance : CompleteSpace E := FiniteDimensional.complete ℝ E
private local instance : CompleteSpace F := FiniteDimensional.complete ℝ F

/-- The four curvature slots agree in the paired frames. The same
operator-slot permutation is used for the two arrays. -/
theorem metricCurvatureFrameTensor_pullback
    (g : SmoothRiemannianMetric J N) (Φ : M ≃ₘ⟮I, J⟯ N)
    (hOrientation : Φ.preservesOrientation oM oN) (x : M)
    (frame : OrientedOrthonormalFrameAt g oN (Φ x)) :
    metricCurvatureFrameTensor (Diffeomorph.pullbackMetricCross g Φ) oM x
        (pullbackOrientedOrthonormalFrameAt g Φ hOrientation x frame) =
      metricCurvatureFrameTensor g oN (Φ x) frame := by
  funext a b c d
  unfold metricCurvatureFrameTensor
  rw [metricRm04Standard_pullbackCross]
  simp only [mfderiv_pullbackOrientedOrthonormalFrameAt_basis]

/-- The curvature-derived positive block has identical coefficients in
the target frame and its pullback by an orientation-preserving diffeomorphism. -/
theorem geometricChiralBlock_pullback
    (g : SmoothRiemannianMetric J N) (Φ : M ≃ₘ⟮I, J⟯ N)
    (hOrientation : Φ.preservesOrientation oM oN) (x : M)
    (frame : OrientedOrthonormalFrameAt g oN (Φ x)) :
    geometricChiralBlock (Diffeomorph.pullbackMetricCross g Φ) oM x
        (pullbackOrientedOrthonormalFrameAt g Φ hOrientation x frame) =
      geometricChiralBlock g oN (Φ x) frame := by
  unfold geometricChiralBlock
  rw [metricCurvatureFrameTensor_pullback]

/-- The chiral coefficient function in the paired source frames is the
target coefficient function composed with the marked diffeomorphism. -/
theorem geometricChiralBlockField_pullback
    (g : SmoothRiemannianMetric J N) (Φ : M ≃ₘ⟮I, J⟯ N)
    (hOrientation : Φ.preservesOrientation oM oN)
    (frames : ∀ y, OrientedOrthonormalFrameAt g oN y) :
    (fun x => geometricChiralBlock (Diffeomorph.pullbackMetricCross g Φ) oM x
      (pullbackOrientedOrthonormalFrames g Φ hOrientation frames x)) =
      fun x => geometricChiralBlock g oN (Φ x) (frames (Φ x)) := by
  funext x
  exact geometricChiralBlock_pullback g Φ hOrientation x (frames (Φ x))

end FirstOrderTwistor
