import DifferentialGeometry.Analysis.Integration.Measure.PullbackPartial
import FirstOrderTwistor.EnergyDensity

/-!
# Riemannian volume transport on a fixed truncation

The comparison is a supplied smooth partial diffeomorphism whose differential
pulls back the target metric on an open neighborhood of the truncation.
-/

open DifferentialGeometry DifferentialGeometry.Integral.Measure
open Bundle Filter Manifold MeasureTheory Set TopologicalSpace
open scoped ContDiff Manifold

namespace FirstOrderTwistor

variable {E F H H' M N : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
  [TopologicalSpace H] [TopologicalSpace H']
  {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  {J : ModelWithCorners ℝ F H'} [J.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M]
  [TopologicalSpace N] [ChartedSpace H' N] [IsManifold J ∞ N] [T2Space N] [SigmaCompactSpace N]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩
private local instance : MeasurableSpace N := borel N
private local instance : BorelSpace N := ⟨rfl⟩

/-- On a measurable truncation of an open metric comparison, the comparison
is a measurable embedding and pulls back Riemannian volume to the subtype
volume induced by the supplied pullback metric. -/
theorem riemannianVolume_comap_of_partialDiffeomorph
    (Φ : PartialDiffeomorph I J M N ∞)
    (g : SmoothRiemannianMetric I M) (h : SmoothRiemannianMetric J N)
    (U : Opens M) (hU : (U : Set M) ⊆ Φ.source)
    (hMetric : ∀ x ∈ U, ∀ v w : TangentSpace I x,
      g.inner x v w = h.inner (Φ x) (mfderiv I J Φ x v) (mfderiv I J Φ x w))
    {A : Set M} (hA : MeasurableSet A) (hAU : A ⊆ U) :
    MeasurableEmbedding (fun x : A ↦ Φ (x : M)) ∧
      (riemannianVolumeMeasure (I := J) (M := N) h).comap (fun x : A ↦ Φ (x : M)) =
        (riemannianVolumeMeasure (I := I) (M := M) g).comap (Subtype.val : A → M) := by
  let V : Opens N := ⟨Φ '' (U : Set M), image_opens_isOpen Φ hU⟩
  let e : U ≃ₘ⟮I, J⟯ V := PartialDiffeomorph.toOpensDiffeo Φ hU
  have hIncl : MeasurableEmbedding (Set.inclusion hAU : A → U) :=
    ⟨Set.inclusion_injective hAU, measurable_inclusion hAU,
      fun _ hs ↦ hA.image_inclusion hAU hs⟩
  have hDiffeo : MeasurableEmbedding (e : U → V) := e.toHomeomorph.measurableEmbedding
  have hVal : MeasurableEmbedding (Subtype.val : V → N) :=
    MeasurableEmbedding.subtype_coe V.isOpen.measurableSet
  have hEmbedding : MeasurableEmbedding (fun x : A ↦ Φ (x : M)) :=
    hVal.comp (hDiffeo.comp hIncl)
  refine ⟨hEmbedding, Measure.ext fun s hs ↦ ?_⟩
  have hImage : MeasurableSet ((Subtype.val : A → M) '' s) :=
    (MeasurableEmbedding.subtype_coe hA).measurableSet_image.mpr hs
  have hImageU : (Subtype.val : A → M) '' s ⊆ U := by
    rintro _ ⟨x, _, rfl⟩
    exact hAU x.property
  have hVolume := setLIntegral_image_partialDiffeomorph Φ g h U hU hMetric hImage hImageU
    (fun _ ↦ 1)
  simp only [setLIntegral_one] at hVolume
  rw [hEmbedding.comap_apply, comap_subtype_coe_apply hA]
  rw [← Set.image_comp] at hVolume
  exact hVolume

/-- The volume transport field for a compact truncation, expressed over a chosen
reference measure with its supplied volume density. -/
theorem riemannianVolume_transport_of_compact_partialDiffeomorph
    (Φ : PartialDiffeomorph I J M N ∞)
    (g : SmoothRiemannianMetric I M) (h : SmoothRiemannianMetric J N)
    (U : Opens M) (hU : (U : Set M) ⊆ Φ.source)
    (hMetric : ∀ x ∈ U, ∀ v w : TangentSpace I x,
      g.inner x v w = h.inner (Φ x) (mfderiv I J Φ x v) (mfderiv I J Φ x w))
    {A : Set M} (hA : IsCompact A) (hAU : A ⊆ U)
    (referenceVolume : Measure A) (jacobian : A → ℝ)
    (hJacobian : AEMeasurable jacobian referenceVolume)
    (hJacobianNonneg : 0 ≤ᵐ[referenceVolume] jacobian)
    (hDensity : (riemannianVolumeMeasure (I := I) (M := M) g).comap (Subtype.val : A → M) =
      energyMeasure referenceVolume jacobian) :
    MeasurableEmbedding (fun x : A ↦ Φ (x : M)) ∧
      AEMeasurable jacobian referenceVolume ∧ 0 ≤ᵐ[referenceVolume] jacobian ∧
      (riemannianVolumeMeasure (I := J) (M := N) h).comap (fun x : A ↦ Φ (x : M)) =
        energyMeasure referenceVolume jacobian := by
  obtain ⟨hEmbedding, hVolume⟩ :=
    riemannianVolume_comap_of_partialDiffeomorph Φ g h U hU hMetric hA.measurableSet hAU
  exact ⟨hEmbedding, hJacobian, hJacobianNonneg, hVolume.trans hDensity⟩

end FirstOrderTwistor
