import DifferentialGeometry.Topology.Manifold.Orientation
import FirstOrderTwistor.SmoothCutGluing

/-!
# Orientation of a smooth marked reassembly

The global diffeomorphism agrees with a patch map on a neighborhood of
each point. Its differential therefore carries the actual tangent-fiber
orientations whenever the patch differential does.
-/

open DifferentialGeometry Set
open scoped ContDiff Manifold Topology

namespace FirstOrderTwistor

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
  {H : Type*} [TopologicalSpace H] {K : Type*} [TopologicalSpace K]
  {I : ModelWithCorners ℝ E H} {J : ModelWithCorners ℝ F K}
  {M : Type*} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  {Xhat : Type*} [TopologicalSpace Xhat] [ChartedSpace K Xhat] [IsManifold J ∞ Xhat]
  {n : ℕ}

/-- The differential on a patch source sends the given tangent orientation to
the orientation at the actual image point. -/
def PreservesPatchOrientation (p : OpenPartialHomeomorph M Xhat)
    (oM : ManifoldOrientation I M n) (oXhat : ManifoldOrientation J Xhat n) : Prop :=
  ∀ x ∈ p.source, ∃ A : TangentSpace I x ≃ₗ[ℝ] TangentSpace J (p x),
    (∀ v, A v = mfderiv I J p x v) ∧
      Orientation.map (Fin n) A (oM.orientation x) = oXhat.orientation (p x)

private theorem orientation_map_tangentSpaceCast (oXhat : ManifoldOrientation J Xhat n)
    {y z : Xhat} (h : y = z) :
    Orientation.map (Fin n) (tangentSpaceCast J y z).toLinearEquiv (oXhat.orientation y) =
      oXhat.orientation z := by
  subst z
  change Orientation.map (Fin n) (LinearEquiv.refl ℝ (TangentSpace J y))
    (oXhat.orientation y) = oXhat.orientation y
  rw [Orientation.map_refl]
  rfl

private theorem orientation_of_eqOn_patch
    (f : Diffeomorph I J M Xhat ∞) (p : OpenPartialHomeomorph M Xhat)
    {oM : ManifoldOrientation I M n} {oXhat : ManifoldOrientation J Xhat n}
    (hp : PreservesPatchOrientation p oM oXhat) (heq : EqOn f p p.source) {x : M}
    (hx : x ∈ p.source) :
    Orientation.map (Fin n) (f.mfderivToContinuousLinearEquiv (by simp) x).toLinearEquiv
      (oM.orientation x) = oXhat.orientation (f x) := by
  obtain ⟨A, hA_deriv, hA_orientation⟩ := hp x hx
  have hagree := heq.eventuallyEq_of_mem (p.open_source.mem_nhds hx)
  have hderiv := hagree.mfderiv_eq (I := I) (I' := J)
  let castFiber := (tangentSpaceCast J (p x) (f x)).toLinearEquiv
  have hf_deriv : (f.mfderivToContinuousLinearEquiv (by simp) x).toLinearEquiv =
      A.trans castFiber := by
    apply LinearEquiv.ext
    intro v
    change mfderiv I J f x v = castFiber (A v)
    rw [hA_deriv v]
    exact DFunLike.congr_fun hderiv v
  rw [hf_deriv, orientation_map_trans, hA_orientation]
  exact orientation_map_tangentSpaceCast oXhat (heq hx).symm

/-- If the core and exterior maps preserve the specified manifold orientations
on their sources, the smooth reassembly preserves them everywhere. -/
theorem SmoothCutGluing.toDiffeomorph_preservesOrientation
    (d : SmoothCutGluing I J M Xhat)
    {oM : ManifoldOrientation I M n} {oXhat : ManifoldOrientation J Xhat n}
    (hcore : PreservesPatchOrientation d.core oM oXhat)
    (hexterior : PreservesPatchOrientation d.exterior oM oXhat) :
    d.toDiffeomorph.preservesOrientation oM oXhat := by
  intro x
  have hx : x ∈ d.core.source ∪ d.exterior.source := d.source_cover ▸ mem_univ x
  rcases hx with hx | hx
  · exact orientation_of_eqOn_patch d.toDiffeomorph d.core hcore d.toDiffeomorph_eq_core hx
  · exact orientation_of_eqOn_patch d.toDiffeomorph d.exterior hexterior
      d.toDiffeomorph_eq_exterior hx

end FirstOrderTwistor
