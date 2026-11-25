import FirstOrderTwistor.ChiralDensity
import FirstOrderTwistor.GeometricChiralBlock

/-!
# From four-slot curvature convergence to chiral energy convergence

Self-dual compression and removal of its scalar part are finite linear
operations. On a fixed measured truncation the Jacobian-weighted chiral
density can then use dominated convergence.
-/

namespace FirstOrderTwistor

open Filter MeasureTheory
open scoped Topology

/-- The trace-free self-dual compression of the four-slot frame tensor. -/
noncomputable def traceFreeSelfDualBlock (R : CurvatureFrameTensor) : Matrix (Fin 3) (Fin 3) ℝ :=
  traceFreeChiralBlock (selfDualCurvatureBlock R)

private theorem tendsto_selfDualCurvatureBlock_apply {ι : Type*} {l : Filter ι}
    {R : ι → CurvatureFrameTensor} {Rlim : CurvatureFrameTensor}
    (hR : ∀ a b c d, Tendsto (fun i => R i a b c d) l (𝓝 (Rlim a b c d))) (a b : Fin 3) :
    Tendsto (fun i => selfDualCurvatureBlock (R i) a b) l
      (𝓝 (selfDualCurvatureBlock Rlim a b)) := by
  let u := selfDualFirstWedge
  let v := selfDualSecondWedge
  unfold selfDualCurvatureBlock
  exact ((((hR (u a).1 (u a).2 (u b).1 (u b).2).add
    (hR (u a).1 (u a).2 (v b).1 (v b).2)).add
    (hR (v a).1 (v a).2 (u b).1 (u b).2)).add
    (hR (v a).1 (v a).2 (v b).1 (v b).2)).div_const 2

/-- Convergence of the four-slot entries gives convergence of each Weyl block entry. -/
theorem tendsto_traceFreeSelfDualBlock_apply {ι : Type*} {l : Filter ι}
    {R : ι → CurvatureFrameTensor} {Rlim : CurvatureFrameTensor}
    (hR : ∀ a b c d, Tendsto (fun i => R i a b c d) l (𝓝 (Rlim a b c d))) (a b : Fin 3) :
    Tendsto (fun i => traceFreeSelfDualBlock (R i) a b) l
      (𝓝 (traceFreeSelfDualBlock Rlim a b)) := by
  have hTrace : Tendsto (fun i => (selfDualCurvatureBlock (R i)).trace) l
      (𝓝 (selfDualCurvatureBlock Rlim).trace) := by
    simp only [Matrix.trace, Matrix.diag_apply]
    exact tendsto_finsetSum Finset.univ (fun j _ => tendsto_selfDualCurvatureBlock_apply hR j j)
  have hId : Tendsto (fun _ : ι => (1 : Matrix (Fin 3) (Fin 3) ℝ) a b) l
      (𝓝 ((1 : Matrix (Fin 3) (Fin 3) ℝ) a b)) := tendsto_const_nhds
  simp only [traceFreeSelfDualBlock, traceFreeChiralBlock, Matrix.sub_apply, Matrix.smul_apply,
    smul_eq_mul]
  exact (tendsto_selfDualCurvatureBlock_apply hR a b).sub ((hTrace.div_const 3).mul hId)

/-- On one truncation, dominated convergence applies to the reconstructed chiral densities. -/
theorem curvatureFrameDensity_integrableOn_and_tendsto {X : Type*} [MeasurableSpace X]
    {volume : Measure X} {s : Set X}
    {R : ℕ → X → CurvatureFrameTensor} {Rlim : X → CurvatureFrameTensor}
    {jac : ℕ → X → ℝ} {jaclim bound : X → ℝ}
    (hR : ∀ a b c d, ∀ᵐ x ∂volume.restrict s,
      Tendsto (fun i => R i x a b c d) atTop (𝓝 (Rlim x a b c d))) :
    let W := fun i x => traceFreeSelfDualBlock (R i x)
    let Wlim := fun x => traceFreeSelfDualBlock (Rlim x)
    (∀ᵐ x ∂volume.restrict s, Tendsto (fun i => jac i x) atTop (𝓝 (jaclim x))) →
    (∀ i, AEStronglyMeasurable (chiralHSDensity (W i) (jac i)) (volume.restrict s)) →
    IntegrableOn bound s volume →
    (∀ i, ∀ᵐ x ∂volume.restrict s, ‖chiralHSDensity (W i) (jac i) x‖ ≤ bound x) →
    (∀ i, IntegrableOn (chiralHSDensity (W i) (jac i)) s volume) ∧
      IntegrableOn (chiralHSDensity Wlim jaclim) s volume ∧
      Tendsto (fun i => ∫ x in s, chiralHSDensity (W i) (jac i) x ∂volume) atTop
        (𝓝 (∫ x in s, chiralHSDensity Wlim jaclim x ∂volume)) := by
  have hAll : ∀ᵐ x ∂volume.restrict s, ∀ a b c d,
      Tendsto (fun i => R i x a b c d) atTop (𝓝 (Rlim x a b c d)) :=
    ae_all_iff.2 fun a => ae_all_iff.2 fun b => ae_all_iff.2 fun c => ae_all_iff.2 (hR a b c)
  have hBlock (a b : Fin 3) : ∀ᵐ x ∂volume.restrict s,
      Tendsto (fun i => traceFreeSelfDualBlock (R i x) a b) atTop
        (𝓝 (traceFreeSelfDualBlock (Rlim x) a b)) :=
    hAll.mono fun _ hx => tendsto_traceFreeSelfDualBlock_apply hx a b
  exact chiralHSDensity_integrableOn_and_tendsto hBlock

section Geometric

open DifferentialGeometry
open scoped ContDiff Manifold

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {M : Type*} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

/-- In the product topology on the nine entries, actual geometric blocks converge
when the tangent-frame curvature entries converge. -/
theorem tendsto_geometricChiralBlock {ι : Type*} {l : Filter ι}
    (o : ManifoldOrientation I M 4) (g : ι → SmoothRiemannianMetric I M)
    (glim : SmoothRiemannianMetric I M) (point : ι → M) (pointlim : M)
    (frame : ∀ i, OrientedOrthonormalFrameAt (g i) o (point i))
    (framelim : OrientedOrthonormalFrameAt glim o pointlim)
    (hR : ∀ a b c d,
      Tendsto (fun i => metricCurvatureFrameTensor (g i) o (point i) (frame i) a b c d)
        l (𝓝 (metricCurvatureFrameTensor glim o pointlim framelim a b c d))) :
    Tendsto (fun i => geometricChiralBlock (g i) o (point i) (frame i)) l
      (𝓝 (geometricChiralBlock glim o pointlim framelim)) :=
  tendsto_pi_nhds.mpr fun a => tendsto_pi_nhds.mpr fun b =>
    tendsto_traceFreeSelfDualBlock_apply hR a b

/-- Fixed-domain convergence of the actual geometric chiral block energies, from
curvature convergence in the supplied oriented orthonormal frames. -/
theorem geometricChiralDensity_integrableOn_and_tendsto {X : Type*} [MeasurableSpace X]
    {volume : Measure X} {s : Set X} (o : ManifoldOrientation I M 4)
    (g : ℕ → SmoothRiemannianMetric I M) (glim : SmoothRiemannianMetric I M)
    (point : ℕ → X → M) (pointlim : X → M)
    (frame : ∀ i x, OrientedOrthonormalFrameAt (g i) o (point i x))
    (framelim : ∀ x, OrientedOrthonormalFrameAt glim o (pointlim x))
    {jac : ℕ → X → ℝ} {jaclim bound : X → ℝ}
    (hR : ∀ a b c d, ∀ᵐ x ∂volume.restrict s,
      Tendsto (fun i => metricCurvatureFrameTensor (g i) o (point i x) (frame i x) a b c d)
        atTop (𝓝 (metricCurvatureFrameTensor glim o (pointlim x) (framelim x) a b c d))) :
    let W := fun i x => geometricChiralBlock (g i) o (point i x) (frame i x)
    let Wlim := fun x => geometricChiralBlock glim o (pointlim x) (framelim x)
    (∀ᵐ x ∂volume.restrict s, Tendsto (fun i => jac i x) atTop (𝓝 (jaclim x))) →
    (∀ i, AEStronglyMeasurable (chiralHSDensity (W i) (jac i)) (volume.restrict s)) →
    IntegrableOn bound s volume →
    (∀ i, ∀ᵐ x ∂volume.restrict s, ‖chiralHSDensity (W i) (jac i) x‖ ≤ bound x) →
    (∀ i, IntegrableOn (chiralHSDensity (W i) (jac i)) s volume) ∧
      IntegrableOn (chiralHSDensity Wlim jaclim) s volume ∧
      Tendsto (fun i => ∫ x in s, chiralHSDensity (W i) (jac i) x ∂volume) atTop
        (𝓝 (∫ x in s, chiralHSDensity Wlim jaclim x ∂volume)) :=
  curvatureFrameDensity_integrableOn_and_tendsto hR

end Geometric

end FirstOrderTwistor
