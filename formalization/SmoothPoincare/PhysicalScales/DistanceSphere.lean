import DifferentialGeometry.Analysis.Integration.Measure.NullImage
import DifferentialGeometry.Geometry.Exponential.Intrinsic.Velocity
import DifferentialGeometry.Geometry.Exponential.MinimizingGeodesic
import DifferentialGeometry.Geometry.Exponential.NormalCoordinates.Frame
import SmoothPoincare.PhysicalScales.MetricQuantiles

/-! # Zero mass of intrinsic distance spheres -/

open Bundle DifferentialGeometry DifferentialGeometry.Integral.Measure
open DifferentialGeometry.Geometry.Riemannian
open DifferentialGeometry.Geometry.Riemannian.Exponential
open DifferentialGeometry.Geometry.Riemannian.NormalCoordinates
open FirstOrderTwistor Manifold MeasureTheory SectionsAndConnections Set
open scoped ContDiff Manifold

namespace SmoothPoincare

variable {E H M : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [NeZero (Module.finrank ℝ E)]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [ConnectedSpace M]

private local instance : MeasurableSpace E := borel E
private local instance : BorelSpace E := ⟨rfl⟩
private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

attribute [-instance] Tensor0SBundle.tangentSpaceNormedAddCommGroup
  Tensor0SBundle.tangentSpaceNormedSpace in
private theorem volume_intrinsicDistanceLevel_eq_zero
    (g : SmoothRiemannianMetric I M) (x : M) (r : ℝ) :
    riemannianVolumeMeasure I M g {y : M | (riemannianEDistOf g x y).toReal = r} = 0 := by
  let : RiemannianBundle (TangentSpace I : M → Type _) := ⟨g.toRiemannianMetric⟩
  let : IsContinuousRiemannianBundle E (TangentSpace I : M → Type _) :=
    ⟨g.inner, g.contMDiff.continuous, fun _ _ _ => rfl⟩
  let : PseudoEMetricSpace M := PseudoEMetricSpace.ofRiemannianMetric I M
  let : IsRiemannianManifold I M := ⟨fun _ _ => rfl⟩
  let : Nontrivial E := Module.nontrivial_of_finrank_pos
    (Nat.pos_of_ne_zero (NeZero.ne (Module.finrank ℝ E)))
  have hEnorm : IsMetricNorm (I := I) (M := M) g :=
    isMetricNorm_of_riemannianBundle g
  let L : E ≃L[ℝ] E := normalFrame (I := I) g x
  let exp := fun w : E => expMapIntrinsic (I := I) g hEnorm x (L w)
  have hexp : ContMDiff 𝓘(ℝ, E) I ∞ exp :=
    (intrinsicFiber_smooth (I := I) g hEnorm x).comp L.toContinuousLinearMap.contMDiff
  have hsphere : modelHaar (E := E) (Metric.sphere (0 : E) r) = 0 :=
    Measure.addHaar_sphere (modelHaar (E := E)) 0 r
  have hImage : riemannianVolumeMeasure I M g (exp '' Metric.sphere (0 : E) r) = 0 :=
    riemannianVolumeMeasure_image_eq_zero_of_mdifferentiableOn g
      (hexp.mdifferentiable (by simp)).mdifferentiableOn hsphere
  apply measure_mono_null _ hImage
  intro y hy
  obtain ⟨v, hvExp, hvNorm⟩ := hopf_rinow_expMapIntrinsic_surjective_minimizing
    (I := I) g hEnorm x y
  let vModel : E := v
  let w := L.symm vModel
  refine ⟨w, ?_, ?_⟩
  · rw [Metric.mem_sphere, dist_zero_right, ← normalFrame_sqrt (I := I) g x w]
    change Real.sqrt (g.inner x (L (L.symm vModel)) (L (L.symm vModel))) = r
    rw [L.apply_symm_apply vModel]
    exact hvNorm.trans hy
  · change expMapIntrinsic (I := I) g hEnorm x (L (L.symm vModel)) = y
    rw [L.apply_symm_apply vModel]
    exact hvExp

/-- Every sphere for the actual distance of a compact connected smooth
boundaryless metric has zero Riemannian volume, including radius zero. -/
theorem riemannianVolume_physicalDistanceSphere_eq_zero
    (g : SmoothRiemannianMetric I M) (x : M) (r : ℝ) :
    letI := physicalMetricSpace g
    riemannianVolumeMeasure I M g (Metric.sphere x r) = 0 := by
  let _ := physicalMetricSpace g
  have hs : Metric.sphere x r = {y : M | (riemannianEDistOf g x y).toReal = r} := by
    ext y
    simp only [Metric.mem_sphere, physicalMetricSpace_dist, riemannianEDistOf_comm g y x,
      Set.mem_ofPred_eq]
  rw [hs]
  exact volume_intrinsicDistanceLevel_eq_zero g x r

/-- The geometric chiral measure vanishes on every sphere in the same
physical metric by absolute continuity with respect to its volume. -/
theorem geometricChiralMeasure_physicalDistanceSphere_eq_zero
    (g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4)
    (frame : ∀ p, OrientedOrthonormalFrameAt g o p) (x : M) (r : ℝ) :
    letI := physicalMetricSpace g
    geometricChiralMeasure o g frame (Metric.sphere x r) = 0 := by
  let _ := physicalMetricSpace g
  unfold geometricChiralMeasure energyMeasure
  exact withDensity_absolutelyContinuous _ _ (riemannianVolume_physicalDistanceSphere_eq_zero g x r)

/-- The geometric curvature measures select their own attaining quantiles and
give the diffuse or measured-shell alternatives on the given metric sequence. -/
theorem exists_metricChiralQuantileAlternatives
    (o : ManifoldOrientation I M 4) (G : ℕ → SmoothRiemannianMetric I M)
    (frames : ∀ i x, OrientedOrthonormalFrameAt (G i) o x)
    (hChiral : ∀ i, Integrable
      (fun x => hilbertSchmidtSq (geometricChiralBlock (G i) o x (frames i x)))
      (riemannianVolumeMeasure I M (G i)))
    (hFull : ∀ i, Integrable
      (fun x => frameTensorNormSq (metricCurvatureFrameTensor (G i) o x (frames i x)))
      (riemannianVolumeMeasure I M (G i)))
    (hEnergy : ∀ i, 0 < chiralFrameEnergy (G i)
      (fun x => geometricChiralBlock (G i) o x (frames i x)))
    (C : ℝ) (hBudget : ∀ i,
      (∫ x, frameTensorNormSq (metricCurvatureFrameTensor (G i) o x (frames i x))
        ∂riemannianVolumeMeasure I M (G i)) ≤ C) :
    ∃ quantile : ℕ → ℝ → ℝ,
      (∀ i θ, 0 < θ → θ ≤ 1 / 2 →
        letI := physicalMetricSpace (G i)
        IsChiralQuantile (geometricChiralMeasure o (G i) (frames i)) θ (quantile i θ)) ∧
      @ChiralQuantileAlternatives (fun _ => M)
        (fun i => physicalMetricSpace (G i)) (fun _ => borel M)
        (fun i => geometricChiralMeasure o (G i) (frames i))
        (fun i => metricFullCurvatureMeasure (G i) o (frames i)) quantile := by
  classical
  have hExists (i : ℕ) (θ : ℝ) (hθ : 0 < θ ∧ θ ≤ 1 / 2) :
      letI := physicalMetricSpace (G i)
      ∃ r, IsChiralQuantile (geometricChiralMeasure o (G i) (frames i)) θ r :=
    exists_isMetricChiralQuantile (G i) o (frames i) (hChiral i) (hEnergy i) hθ.1
      (hθ.2.trans_lt (by norm_num)) (riemannianVolume_physicalDistanceSphere_eq_zero (G i))
  let quantile (i : ℕ) (θ : ℝ) : ℝ :=
    if hθ : 0 < θ ∧ θ ≤ 1 / 2 then (hExists i θ hθ).choose else 0
  have hQuantile (i : ℕ) (θ : ℝ) (hpos : 0 < θ) (hhalf : θ ≤ 1 / 2) :
      letI := physicalMetricSpace (G i)
      IsChiralQuantile (geometricChiralMeasure o (G i) (frames i)) θ (quantile i θ) := by
    simpa only [quantile, dite_eq_left (And.intro hpos hhalf)] using
      (hExists i θ ⟨hpos, hhalf⟩).choose_spec
  exact ⟨quantile, hQuantile,
    metricChiralQuantileAlternatives o G frames hChiral hFull quantile hQuantile hEnergy C hBudget⟩

end SmoothPoincare
