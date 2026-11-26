import SmoothPoincare.Variational.SelectedQuadraticJets

namespace QuadraticExactReplay

open DifferentialGeometry DifferentialGeometry.Analysis DifferentialGeometry.Integral.Measure
open DifferentialGeometry.Geometry.Operator DifferentialGeometry.Tensor.Coordinates
open Filter MeasureTheory Set SmoothPoincare
open scoped ContDiff Manifold Topology

#check @selectedSpliceCoefficient_partial
#print axioms selectedSpliceCoefficient_partial
#check @quadraticFirstJetProduct_memLp_and_le
#print axioms quadraticFirstJetProduct_memLp_and_le
#check @frozenFirstJet_mul_sub_weighted
#print axioms frozenFirstJet_mul_sub_weighted
#check @chartGramOnE_selectedModelSplice
#print axioms chartGramOnE_selectedModelSplice
#check @exists_selectedChartGramFirstPartialError_on_physicalTrim
#print axioms exists_selectedChartGramFirstPartialError_on_physicalTrim
#check @exists_selectedChartGramQuadraticFirstJet_on_physicalTrim
#print axioms exists_selectedChartGramQuadraticFirstJet_on_physicalTrim
#check @exists_selectedPhysicalSplice_native_model
#print axioms exists_selectedPhysicalSplice_native_model

-- Even when the differentiated cutoff is zero, the comparison of the frozen
-- jet product with the weighted endpoint products can have a strict error.
theorem exactFrozenEndpointMixingAtHalf :
    ((1 - (1 / 2 : ℝ)) * 0 + (1 / 2) * 1) * ((1 - (1 / 2 : ℝ)) * 0 + (1 / 2) * 1) -
      ((1 - (1 / 2 : ℝ)) * (0 * 0) + (1 / 2) * (1 * 1)) = -(1 / 4) := by
  rw [frozenFirstJet_mul_sub_weighted]
  norm_num

#print axioms exactFrozenEndpointMixingAtHalf

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)
local notation "J₄" => Fin (Module.finrank ℝ E₄)

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M]

local instance : MeasurableSpace M := borel M
local instance : BorelSpace M := ⟨rfl⟩

-- At t=1/2 match the actual ambient splice on the full buffered chart in
-- the physical measure of the unspliced source. Preserve both mixed products
-- and the exact t²=1/4 factor on the error product.
theorem exactNativeMetricQuadraticHalfStep (g b : SmoothRiemannianMetric I M)
    [IsFiniteMeasure (riemannianVolumeMeasure I M g)]
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (n : ℕ)
    (hBuffer : Metric.closedBall (0 : E₄) (1 + 1 / ((n : ℝ) + 1)) ⊆ F.source)
    (α : E₄) (i j a c p q : J₄) (k : E₄ → ℝ) {K : ℝ} (hK : 0 ≤ K) :
    let w : ℝ := 1 / ((n : ℝ) + 1)
    let μ := selectedTrimPullback F n (riemannianVolumeMeasure I M g)
    let t : ℝ := 1 / 2
    let ht : t ∈ Icc (0 : ℝ) 1 := ⟨by norm_num [t], by norm_num [t]⟩
    AEStronglyMeasurable k μ → (∀ᵐ x ∂μ, |k x| ≤ K) →
    ∃ (C : ℝ) (χ : M → ℝ) (hχ : ContMDiff I 𝓘(ℝ) ∞ χ) (hχ01 : ∀ y, χ y ∈ Icc (0 : ℝ) 1)
      (G B : SmoothRiemannianMetric I₄ E₄) (V : TopologicalSpace.Opens E₄), 0 ≤ C ∧
      Metric.closedBall (0 : E₄) (1 + w) ⊆ (V : Set E₄) ∧ (V : Set E₄) ⊆ F.source ∧
      (∀ y ∉ selectedChartDisk F ∪ selectedDiskTrim F n, χ y = 0) ∧
      (∀ x ∈ V, ∀ u v : E₄,
        let u' := mfderiv I₄ I (F : E₄ → M) x u
        let v' := mfderiv I₄ I (F : E₄ → M) x v
        (selectedModelSplice G B t w ht).inner x u v =
          (chartSpliceMetric g b χ hχ hχ01 t ht).inner (F x) u' v') ∧
      let A₁ := chartGramOnE G α a c
      let B₁ := chartGramOnE B α a c
      let A₂ := chartGramOnE G α p q
      let B₂ := chartGramOnE B α p q
      let H₁ := selectedSpliceFrozenFirstPartial t w A₁ B₁ i
      let H₂ := selectedSpliceFrozenFirstPartial t w A₂ B₂ j
      let d₁ := (C / w) * lpNorm (B₁ - A₁) 4 μ
      let d₂ := (C / w) * lpNorm (B₂ - A₂) 4 μ
      let P := selectedModelSplice G B t w ht
      let R := k * ((partialDeriv i (chartGramOnE P α a c)) *
        (partialDeriv j (chartGramOnE P α p q)) - H₁ * H₂)
      MemLp R 2 μ ∧ lpNorm R 2 μ ≤ K *
        ((1 / 2) * (lpNorm H₁ 4 μ * d₂ + d₁ * lpNorm H₂ 4 μ) + (1 / 4) * (d₁ * d₂)) := by
  intro w μ t ht hk hCoef
  obtain ⟨χ, hχ, hχ01, G, B, V, hV, hSource, hZero, hSplice⟩ :=
    exists_selectedPhysicalSplice_native_model F n hBuffer g b
  obtain ⟨C, hC, hQuadratic⟩ := exists_selectedChartGramQuadraticFirstJet_on_physicalTrim g F
  refine ⟨C, χ, hχ, hχ01, G, B, V, hC, hV, hSource, hZero, fun x hx u v => hSplice x hx u v t ht, ?_⟩
  have h := hQuadratic n G B α i j a c p q t ht k K hK hk hCoef
  simpa only [t, show (1 / 2 : ℝ) ^ 2 = 1 / 4 by norm_num] using h

#print axioms exactNativeMetricQuadraticHalfStep

end QuadraticExactReplay
