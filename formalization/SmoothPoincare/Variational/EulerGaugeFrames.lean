import SmoothPoincare.Variational.SpatialEulerVariation

/-! # Oriented moving frames through a prescribed regular Ricci slice -/

open Bundle DifferentialGeometry DifferentialGeometry.Geometry.Curvature
  DifferentialGeometry.PDE.RicciFlow FirstOrderTwistor Filter Set
open scoped ContDiff Manifold Topology

noncomputable section
namespace SmoothPoincare

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  {D : RealTimeInterval}

/-- Through any prescribed oriented frame at a regular time there is a genuine
Ricci-gauge path of bases. It is orthonormal and oriented for the varying
metric on a time neighborhood of that slice. -/
theorem exists_localEulerGaugeFrame (S : SolutionOn (I := I) (M := M) D) (hS : IsSolutionOn S)
    (t : D.RegularTime) (o : ManifoldOrientation I M 4) (x : M)
    (f : OrientedOrthonormalFrameAt (S.family.metric t) o x) :
    ∃ B : ℝ → Module.Basis (Fin 4) ℝ (TangentSpace I x),
      B t = f.basis ∧
      (∀ i, HasDerivAt (fun s => B s i) (ricciSharp (S.family.metric t) x (f.basis i)) (t : ℝ)) ∧
      ∀ᶠ s in 𝓝 (t : ℝ), (B s).orientation = o.orientation x ∧
        ∀ i j, (S.family.metric s).inner x (B s i) (B s j) = if i = j then 1 else 0 := by
  obtain ⟨r,hr,hrD⟩ := Metric.mem_nhds_iff.mp (D.regular_isOpen.mem_nhds t.2)
  let J := Metric.ball (t : ℝ) r
  have ht : (t : ℝ) ∈ J := Metric.mem_ball_self hr
  have hN : J ∈ 𝓝 (t : ℝ) := Metric.ball_mem_nhds _ hr
  obtain ⟨ι,hinit,_,_,hder,hiso⟩ :=
    exists_uhlenbeck_isometry_on_interval (F := E) (V := TangentSpace I) S hS
      ((convex_ball (t : ℝ) r).ordConnected) ht hrD (S.family.metric t).toRiemannianMetric
      (fun y => ContinuousLinearEquiv.refl ℝ (TangentSpace I y))
      (show ContMDiff I (I.prod 𝓘(ℝ, E →L[ℝ] E)) ∞
        (fun y : M => TotalSpace.mk' (E →L[ℝ] E) y (ContinuousLinearMap.id ℝ (TangentSpace I y))) from
        (contMDiff_id : ContMDiff I I ∞ (fun y : M => y)).clm_bundle_id)
      (fun _ _ _ => rfl)
  let B := fun s => f.basis.map (ι s x).toLinearEquiv
  have hB : B t = f.basis := by
    ext i
    simp [B, hinit]
  have hd (i : Fin 4) : HasDerivAt (fun s => B s i)
      (ricciSharp (S.family.metric t) x (f.basis i)) (t : ℝ) := by
    simpa only [B, Module.Basis.map_apply, ContinuousLinearEquiv.coe_toLinearEquiv, hinit,
      ContinuousLinearEquiv.refl_apply] using (hder x (f.basis i) t ht).hasDerivAt hN
  have hmat : ContinuousAt (fun s => f.basis.toMatrix (B s)) (t : ℝ) := by
    apply continuousAt_pi.mpr
    intro i
    apply continuousAt_pi.mpr
    intro j
    exact ((f.basis.coord i).continuous_of_finiteDimensional.continuousAt.comp (hd j).continuousAt)
  have hdet := continuous_id.matrix_det.continuousAt.comp hmat
  have hone : 0 < (f.basis.toMatrix (B t)).det := by rw [hB]; simp
  have hpos : ∀ᶠ s in 𝓝 (t : ℝ), 0 < (f.basis.toMatrix (B s)).det :=
    hdet.eventually (lt_mem_nhds hone)
  refine ⟨B,hB,hd,?_⟩
  filter_upwards [hN,hpos] with s hs hp
  refine ⟨?_,?_⟩
  · rw [← f.oriented, eq_comm, Module.Basis.orientation_eq_iff_det_pos, Module.Basis.det_apply]
    exact hp
  · intro i j
    exact (hiso s hs x (f.basis i) (f.basis j)).trans (f.orthonormal i j)

end SmoothPoincare
