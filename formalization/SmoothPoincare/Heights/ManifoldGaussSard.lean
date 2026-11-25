import SmoothPoincare.Heights.GaussRegularCover
import DifferentialGeometry.Analysis.Integration.Measure.NullImage
import DifferentialGeometry.External.TauCeti.Analysis.Calculus.Sard.EqualDimension
import DifferentialGeometry.Topology.Manifold.StereographicAntipodal

/-! # Critical values of a smooth Gauss map are round-area null -/

open DifferentialGeometry DifferentialGeometry.Integral.Measure Function MeasureTheory Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

section Sard

variable {E F H K M N : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
  [TopologicalSpace H] [TopologicalSpace K]
  {I : ModelWithCorners ℝ E H} {J : ModelWithCorners ℝ F K}
  [I.Boundaryless] [J.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [TopologicalSpace N] [ChartedSpace K N] [IsManifold J ∞ N]
  [T2Space N] [SigmaCompactSpace N]

private local instance : MeasurableSpace F := borel F
private local instance : BorelSpace F := ⟨rfl⟩

private theorem chart_critical_image_eq_zero (g : SmoothRiemannianMetric J N)
    (hdim : Module.finrank ℝ E = Module.finrank ℝ F)
    {f : M → N} (hf : ContMDiff I J ∞ f) (p : M) (q : N) :
    riemannianVolumeMeasure J N g
      (f '' {x | x ∈ (extChartAt I p).source ∩ f ⁻¹' (extChartAt J q).source ∧
        ¬ Surjective (mfderiv I J f x)}) = 0 := by
  let a := PartialDiffeomorph.extChartAt I ∞ p
  let b := PartialDiffeomorph.extChartAt J ∞ q
  let W := a.target ∩ (f ∘ a.symm) ⁻¹' b.source
  let c := b ∘ (f ∘ a.symm)
  have hfa : ContMDiffOn 𝓘(ℝ, E) J ∞ (f ∘ a.symm) a.target :=
    hf.comp_contMDiffOn a.symm.contMDiffOn
  have hW : IsOpen W := hfa.continuousOn.isOpen_inter_preimage a.open_target b.open_source
  have hc : ContDiffOn ℝ ∞ c W :=
    (b.contMDiffOn.comp (hfa.mono inter_subset_left) inter_subset_right).contDiffOn
  let C := {z | z ∈ W ∧ ¬ Surjective (fderiv ℝ c z)}
  have hC : modelHaar (E := F) (c '' C) = 0 :=
    addHaar_image_eq_zero_of_not_surjective_fderivWithin (modelHaar (E := F)) hdim
      (fun z hz => ((hc.differentiableOn (by simp) z hz.1).differentiableAt
        (hW.mem_nhds hz.1)).hasFDerivAt.hasFDerivWithinAt) (fun _ hz => hz.2)
  have hTarget : c '' C ⊆ b.target := by
    rintro _ ⟨z, hz, rfl⟩
    exact b.toPartialEquiv.map_source hz.1.2
  have hNull := riemannianVolumeMeasure_image_eq_zero_of_mdifferentiableOn g
    ((b.symm.mdifferentiableOn (by simp)).mono hTarget) hC
  apply measure_mono_null _ hNull
  rintro _ ⟨x, ⟨⟨hx, hfx⟩, hcrit⟩, rfl⟩
  change x ∈ a.source at hx
  change f x ∈ b.source at hfx
  have hax : a.symm (a x) = x := a.toPartialEquiv.left_inv hx
  have hz : a x ∈ W := ⟨a.toPartialEquiv.map_source hx, by
    change f (a.symm (a x)) ∈ b.source
    rwa [hax]⟩
  have hcz : c (a x) = b (f x) := by simp only [c, Function.comp_apply, hax]
  refine ⟨c (a x), ⟨a x, ⟨hz, ?_⟩, rfl⟩, ?_⟩
  · intro hsurj
    have hsurjM : Surjective (mfderiv 𝓘(ℝ, E) 𝓘(ℝ, F) c (a x)) := by
      rw [mfderiv_eq_fderiv]
      exact (NormedSpace.fromTangentSpace (𝕜 := ℝ) (c (a x))).symm.surjective.comp
        (hsurj.comp (NormedSpace.fromTangentSpace (𝕜 := ℝ) (a x)).surjective)
    have hfAt : MDifferentiableAt I J f (a.symm (a x)) :=
      hf.mdifferentiableAt (by simp)
    have haAt := a.symm.mdifferentiableAt (by simp) hz.1
    have hbAt := b.mdifferentiableAt (by simp) hz.2
    change Surjective (mfderiv 𝓘(ℝ, E) 𝓘(ℝ, F) (b ∘ (f ∘ a.symm)) (a x)) at hsurjM
    rw [mfderiv_comp (a x) hbAt (hfAt.comp (a x) haAt)] at hsurjM
    rw [mfderiv_comp (a x) hfAt haAt] at hsurjM
    have hbDiff : OpenPartialHomeomorph.MDifferentiable J 𝓘(ℝ, F)
        b.toOpenPartialHomeomorph :=
      ⟨b.mdifferentiableOn (by simp), b.symm.mdifferentiableOn (by simp)⟩
    have hbInj := hbDiff.mfderiv_injective hz.2
    have hfxSurj : Surjective (mfderiv I J f (a.symm (a x))) := by
      intro v
      obtain ⟨u, hu⟩ := hsurjM
        (mfderiv J 𝓘(ℝ, F) b (f (a.symm (a x))) v)
      exact ⟨mfderiv 𝓘(ℝ, E) I a.symm (a x) u, hbInj hu⟩
    exact hcrit (hax ▸ hfxSurj)
  · rw [hcz]
    exact b.toPartialEquiv.left_inv hfx

/-- Equal-dimensional Sard for boundaryless manifolds, with respect to the
Riemannian volume of any smooth target metric. -/
theorem riemannianVolumeMeasure_criticalValues_eq_zero [SecondCountableTopology M]
    (g : SmoothRiemannianMetric J N) (hdim : Module.finrank ℝ E = Module.finrank ℝ F)
    {f : M → N} (hf : ContMDiff I J ∞ f) :
    riemannianVolumeMeasure J N g (f '' {x | ¬ Surjective (mfderiv I J f x)}) = 0 := by
  let W (p : M) := (extChartAt I p).source ∩ f ⁻¹' (extChartAt J (f p)).source
  have hW (p : M) : IsOpen (W p) :=
    (isOpen_extChartAt_source p).inter
      ((isOpen_extChartAt_source (f p)).preimage hf.continuous)
  obtain ⟨P, hP, hCover⟩ := TopologicalSpace.isOpen_iUnion_countable W hW
  have hNull : riemannianVolumeMeasure J N g
      (⋃ p ∈ P, f '' {x | x ∈ W p ∧ ¬ Surjective (mfderiv I J f x)}) = 0 :=
    (measure_biUnion_null_iff hP).mpr
      (fun p _ => chart_critical_image_eq_zero g hdim hf p (f p))
  apply measure_mono_null _ hNull
  rintro y ⟨x, hx, rfl⟩
  have hCovered : x ∈ ⋃ p ∈ P, W p := by
    rw [hCover]
    exact mem_iUnion.mpr ⟨x, mem_extChartAt_source x, mem_extChartAt_source (f x)⟩
  obtain ⟨p, hp, hxp⟩ := mem_iUnion₂.mp hCovered
  exact mem_iUnion₂.mpr ⟨p, hp, x, ⟨hxp, hx⟩, rfl⟩

end Sard

section Immersion

variable {E H M : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [SecondCountableTopology M]
  {g : SmoothRiemannianMetric I M} {F : IsometricHypersurface g}

local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 5)) = 4 + 1) := ⟨by simp⟩
private local instance : MeasurableSpace GaussDirection := borel GaussDirection

/-- The critical values of the given smooth normal have measure zero for
    the Riemannian volume of the round unit four-sphere. -/
theorem ImmersionGaussNormal.roundArea_criticalValues_eq_zero (N : ImmersionGaussNormal F)
    (hdim : Module.finrank ℝ E = 4) (hn : ContMDiff I (𝓡 4) ∞ N.normal) :
    riemannianVolumeMeasure (𝓡 4) GaussDirection Geometry.roundMetric
      (N.normal '' {x | ¬ Surjective (mfderiv I (𝓡 4) N.normal x)}) = 0 :=
  riemannianVolumeMeasure_criticalValues_eq_zero Geometry.roundMetric (by simpa using hdim) hn

/-- For almost every direction, the actual normal differential is invertible
    on the full fibers of both that direction and its antipode. -/
theorem ImmersionGaussNormal.ae_invertible_mfderiv_on_two_normal_fibers
    (N : ImmersionGaussNormal F) (hdim : Module.finrank ℝ E = 4)
    (hn : ContMDiff I (𝓡 4) ∞ N.normal) :
    ∀ᵐ u ∂normalizedGaussDirections
        (riemannianVolumeMeasure (𝓡 4) GaussDirection Geometry.roundMetric) (8 * Real.pi ^ 2 / 3),
      ∀ x : M, N.normal x = u ∨ N.normal x = -u → (mfderiv I (𝓡 4) N.normal x).IsInvertible := by
  let area := riemannianVolumeMeasure (𝓡 4) GaussDirection Geometry.roundMetric
  let a : GaussDirection ≃ₘ⟮𝓡 4, 𝓡 4⟯ GaussDirection :=
    Topology.Manifold.sphereAntipodalDiffeomorph
  let nMinus := a ∘ N.normal
  have hMinus : ContMDiff I (𝓡 4) ∞ nMinus := a.contMDiff.comp hn
  have hNullMinus : area (nMinus '' {x | ¬ Surjective (mfderiv I (𝓡 4) nMinus x)}) = 0 :=
    riemannianVolumeMeasure_criticalValues_eq_zero Geometry.roundMetric
      (by simpa using hdim) hMinus
  have hCritMinus {x : M} (hx : ¬ Surjective (mfderiv I (𝓡 4) N.normal x)) :
      ¬ Surjective (mfderiv I (𝓡 4) nMinus x) := by
    intro hs
    change Surjective (mfderiv I (𝓡 4) (a ∘ N.normal) x) at hs
    rw [mfderiv_comp x (a.contMDiff.mdifferentiableAt (by simp))
      (hn.mdifferentiableAt (by simp))] at hs
    have haInj := (a.isInvertible_mfderiv (x := N.normal x) (by simp)).injective
    apply hx
    intro v
    obtain ⟨w, hw⟩ := hs (mfderiv (𝓡 4) (𝓡 4) a (N.normal x) v)
    exact ⟨w, haInj hw⟩
  apply Measure.ae_smul_measure
  filter_upwards [(measure_eq_zero_iff_ae_notMem.mp (N.roundArea_criticalValues_eq_zero hdim hn)),
    (measure_eq_zero_iff_ae_notMem.mp hNullMinus)] with u hu hmu x hx
  let d := mfderiv I (𝓡 4) N.normal x
  have hs : Surjective d := by
    by_contra h
    rcases hx with hx | hx
    · exact hu ⟨x, h, hx⟩
    · exact hmu ⟨x, hCritMinus h, by
        change -N.normal x = u
        rw [hx, neg_neg]⟩
  have ht : Module.finrank ℝ (TangentSpace I x) =
      Module.finrank ℝ (TangentSpace (𝓡 4) (N.normal x)) := by
    change Module.finrank ℝ E = Module.finrank ℝ (EuclideanSpace ℝ (Fin 4))
    simpa using hdim
  have hi : Injective d := (LinearMap.injective_iff_surjective_of_finrank_eq_finrank ht
    (f := d.toLinearMap)).mpr hs
  refine ⟨(LinearEquiv.ofBijective d.toLinearMap ⟨hi, hs⟩).toContinuousLinearEquiv, ?_⟩
  ext v
  rfl

end Immersion

end SmoothPoincare
