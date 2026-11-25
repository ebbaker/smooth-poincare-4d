import DifferentialGeometry.Analysis.Integration.Measure.PullbackPartial
import DifferentialGeometry.Analysis.Integration.Measure.VolumeDensity
import DifferentialGeometry.Analysis.Integration.Measure.Riemannian.Properties
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

omit [I.Boundaryless] in
/-- The ambient Riemannian volume density restricts to the induced volume
measures on a measurable subtype. -/
theorem riemannianVolume_comap_subtype_eq_energyMeasure
    (q g : SmoothRiemannianMetric I M) {A : Set M} (hA : MeasurableSet A) :
    (riemannianVolumeMeasure (I := I) (M := M) g).comap (Subtype.val : A → M) =
      energyMeasure ((riemannianVolumeMeasure (I := I) (M := M) q).comap (Subtype.val : A → M))
        (fun x : A ↦ riemannianVolumeDensity q g (x : M)) := by
  apply Measure.ext
  intro s hs
  have hImage := (MeasurableEmbedding.subtype_coe hA).measurableSet_image.mpr hs
  rw [comap_subtype_coe_apply hA, riemannianVolumeMeasure_eq_withDensity q g,
    withDensity_apply _ hImage, energyMeasure, withDensity_apply _ hs]
  exact (setLIntegral_subtype hA s (fun x ↦ ENNReal.ofReal (riemannianVolumeDensity q g x))).symm

omit [I.Boundaryless] in
/-- The volume induced by a smooth metric on a compact truncation is finite. -/
theorem isFiniteMeasure_riemannianVolume_comap_subtype
    (q : SmoothRiemannianMetric I M) {A : Set M} (hA : IsCompact A) :
    IsFiniteMeasure ((riemannianVolumeMeasure (I := I) (M := M) q).comap (Subtype.val : A → M)) := by
  let _ : IsFiniteMeasureOnCompacts (riemannianVolumeMeasure (I := I) (M := M) q) :=
    riemannianVolumeMeasure_isFiniteMeasureOnCompacts q
  refine ⟨?_⟩
  rw [comap_subtype_coe_apply hA.measurableSet, Set.image_univ, Subtype.range_coe]
  exact hA.measure_lt_top

/-- A smooth reference metric supplies the finite reference volume and the
positive volume density in the compact-truncation transport field. -/
theorem riemannianVolume_transport_of_compact_referenceMetric
    (Φ : PartialDiffeomorph I J M N ∞)
    (q g : SmoothRiemannianMetric I M) (h : SmoothRiemannianMetric J N)
    (U : Opens M) (hU : (U : Set M) ⊆ Φ.source)
    (hMetric : ∀ x ∈ U, ∀ v w : TangentSpace I x,
      g.inner x v w = h.inner (Φ x) (mfderiv I J Φ x v) (mfderiv I J Φ x w))
    {A : Set M} (hA : IsCompact A) (hAU : A ⊆ U) :
    let referenceVolume := (riemannianVolumeMeasure (I := I) (M := M) q).comap (Subtype.val : A → M)
    let jacobian (x : A) := riemannianVolumeDensity q g (x : M)
    IsFiniteMeasure referenceVolume ∧
      MeasurableEmbedding (fun x : A ↦ Φ (x : M)) ∧
      AEMeasurable jacobian referenceVolume ∧ 0 ≤ᵐ[referenceVolume] jacobian ∧
      (riemannianVolumeMeasure (I := J) (M := N) h).comap (fun x : A ↦ Φ (x : M)) =
        energyMeasure referenceVolume jacobian := by
  dsimp only
  have hMeasurable : Measurable (fun x : A ↦ riemannianVolumeDensity q g (x : M)) :=
    (riemannianVolumeDensity_contMDiff q g).continuous.measurable.comp measurable_subtype_coe
  exact ⟨isFiniteMeasure_riemannianVolume_comap_subtype q hA,
    riemannianVolume_transport_of_compact_partialDiffeomorph Φ g h U hU hMetric hA hAU
      _ _ hMeasurable.aemeasurable (ae_of_all _ fun x ↦ (riemannianVolumeDensity_pos q g (x : M)).le)
      (riemannianVolume_comap_subtype_eq_energyMeasure q g hA.measurableSet)⟩

end FirstOrderTwistor
