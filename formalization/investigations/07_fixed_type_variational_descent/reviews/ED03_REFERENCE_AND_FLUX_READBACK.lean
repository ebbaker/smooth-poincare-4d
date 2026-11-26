import SmoothPoincare

namespace ReferenceAndFluxReadback

open DifferentialGeometry DifferentialGeometry.Analysis DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Geometry.Operator DifferentialGeometry.Tensor.Coordinates
open Filter FirstOrderTwistor MeasureTheory SectionsAndConnections Set SmoothPoincare
open scoped ContDiff InnerProductSpace Manifold Topology

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)
local notation "J₄" => Fin (Module.finrank ℝ E₄)

#check @exists_selectedEuclideanReferenceSplice
#print axioms exists_selectedEuclideanReferenceSplice
#check @chartGramOnE_euclideanReference
#print axioms chartGramOnE_euclideanReference
#check @partialDeriv_chartGram_euclideanReference
#print axioms partialDeriv_chartGram_euclideanReference
#check @selectedEuclideanGerm_flat
#print axioms selectedEuclideanGerm_flat
#check @selectedModelSplice_euclidean_inner
#print axioms selectedModelSplice_euclidean_inner
#check @selectedEuclideanSplice_flat_near_innerDisk
#print axioms selectedEuclideanSplice_flat_near_innerDisk
#check @selectedReference_innerDisk_partition
#print axioms selectedReference_innerDisk_partition
#check @selectedReference_complement_cost
#print axioms selectedReference_complement_cost
#check @exists_selectedEuclideanSecondPartialError_on_physicalTrim
#print axioms exists_selectedEuclideanSecondPartialError_on_physicalTrim
#check @selectedReference_charge_eq_zero_of_flat
#print axioms selectedReference_charge_eq_zero_of_flat
#check @selectedReference_charge_eq_of_germ
#print axioms selectedReference_charge_eq_of_germ
#check @selectedReference_endpoint_saving
#print axioms selectedReference_endpoint_saving
#check @selectedReference_positive_saving_of_cost_lt
#print axioms selectedReference_positive_saving_of_cost_lt
#check @selectedEuclideanSplice_positive_saving
#print axioms selectedEuclideanSplice_positive_saving
#check @eventually_balancedFlatReference
#print axioms eventually_balancedFlatReference
#check @balancedFlatReference_cost
#print axioms balancedFlatReference_cost
#check @balancedFlatReference_trim_cost
#print axioms balancedFlatReference_trim_cost
#check @eventually_balancedFlatReference_cost
#print axioms eventually_balancedFlatReference_cost
#check @eventually_balancedFlatReference_trim_charge_pos
#print axioms eventually_balancedFlatReference_trim_charge_pos
#check @nativeConstantMetric_inner
#print axioms nativeConstantMetric_inner
#check @nativeConstantMetric_flat
#print axioms nativeConstantMetric_flat
#check @exists_selectedMatchedFlatDisk
#print axioms exists_selectedMatchedFlatDisk
#check @selectedMatchedFlatDisk_trim_charge
#print axioms selectedMatchedFlatDisk_trim_charge
#check @selectedMatchedFlatDisk_exact_saving
#print axioms selectedMatchedFlatDisk_exact_saving
#check @chiralBlockSq_eq_of_liftedFrameChange
#print axioms chiralBlockSq_eq_of_liftedFrameChange
#check @tangentFrameChange_orthogonal_det_one
#print axioms tangentFrameChange_orthogonal_det_one
#check @selectedReference_chiralMeasure_restrict_eq_of_germ_of_liftedFrameChange
#print axioms selectedReference_chiralMeasure_restrict_eq_of_germ_of_liftedFrameChange
#check @selectedSplice_exterior_chiralMeasure_restrict_eq
#print axioms selectedSplice_exterior_chiralMeasure_restrict_eq

-- The exact indexed splice still mixes the two metrics on the original seam.
private theorem seamCutoffHalf (n : ℕ) (x : E₄) (hx : ‖x‖ = 1) :
    selectedRadialCutoff (1 / ((n : ℝ) + 1)) x = 1 / 2 := by
  let w : ℝ := 1 / ((n : ℝ) + 1)
  have hw : 0 < w := by dsimp [w]; positivity
  have hParam : selectedRadialParameter w x = 1 / 2 := by
    unfold selectedRadialParameter
    rw [hx]
    field_simp; ring
  change Real.smoothTransition (selectedRadialParameter w x) = 1 / 2
  rw [hParam, Real.smoothTransition, show (1 : ℝ) - 1 / 2 = 1 / 2 by norm_num]
  have hPos := expNegInvGlue.pos_of_pos (by norm_num : (0 : ℝ) < 1 / 2)
  field_simp; ring

-- The thinner closed inner disk really lies in the plateau of the cutoff.
example (n : ℕ) (x : E₄) (hx : ‖x‖ ≤ 1 - 1 / ((n : ℝ) + 1)) :
    selectedRadialCutoff (1 / ((n : ℝ) + 1)) x = 1 := by
  let w : ℝ := 1 / ((n : ℝ) + 1)
  have hw : 0 < w := by dsimp [w]; positivity
  have hs := mul_le_mul_of_nonneg_right hx (norm_nonneg x)
  apply selectedRadialCutoff_eq_one hw
  nlinarith [norm_nonneg x, mul_nonneg hw.le (norm_nonneg x)]

-- On the seam a tensor entry of the terminal model is the exact half-mix,
-- even though the reference itself is identically Euclidean there.
example (G : SmoothRiemannianMetric I₄ E₄) (x : E₄) (hx : ‖x‖ = 1)
    (α : E₄) (a c : J₄) (n : ℕ) :
    let w : ℝ := 1 / ((n : ℝ) + 1)
    let h₁ : (1 : ℝ) ∈ Icc (0 : ℝ) 1 := ⟨zero_le_one, le_rfl⟩
    chartGramOnE (selectedModelSplice G (euclideanMetric (E := E₄)) 1 w h₁) α a c x =
      (chartGramOnE G α a c x + ⟪chartModelBasis E₄ a, chartModelBasis E₄ c⟫_ℝ) / 2 := by
  intro w h₁
  have hChi : selectedRadialCutoff w x = 1 / 2 := seamCutoffHalf n x hx
  rw [chartGramOnE_selectedModelSplice, selectedSpliceCoefficient, hChi,
    chartGramOnE_euclideanReference]
  ring

section PhysicalEndpoint

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M]

-- At n = 1 the flat germ covers the entire closed marked radius-one-half
-- disk in the actual source, including its sphere.
example (g : SmoothRiemannianMetric I M) (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (hBuffer : Metric.closedBall (0 : E₄) (3 / 2) ⊆ F.source) :
    ∃ (χ : M → ℝ) (hχ : ContMDiff I 𝓘(ℝ) ∞ χ) (hχ01 : ∀ y, χ y ∈ Icc (0 : ℝ) 1)
        (b : SmoothRiemannianMetric I M) (U : TopologicalSpace.Opens E₄),
      Metric.closedBall (0 : E₄) (1 / 2) ⊆ (U : Set E₄) ∧ (U : Set E₄) ⊆ F.source ∧
      ∀ x ∈ U, metricRm04At (chartSpliceMetric g b χ hχ hχ01 1 ⟨zero_le_one, le_rfl⟩)
        (F x) = 0 := by
  have hBuffer' : Metric.closedBall (0 : E₄) (1 + 1 / (((1 : ℕ) : ℝ) + 1)) ⊆ F.source := by
    convert hBuffer using 2; norm_num
  obtain ⟨χ, hχ, hχ01, G, b, V, hV, hSource, _, _, _, hSplice⟩ :=
    exists_selectedEuclideanReferenceSplice g F 1 hBuffer'
  let h := chartSpliceMetric g b χ hχ hχ01 1 ⟨zero_le_one, le_rfl⟩
  obtain ⟨U, hInner, hUSource, _, hFlat⟩ :=
    selectedEuclideanSplice_flat_near_innerDisk F 1 (by decide) G h V hV hSource
      (fun x hx u v => hSplice x hx u v 1 ⟨zero_le_one, le_rfl⟩)
  refine ⟨χ, hχ, hχ01, b, U, ?_, hUSource, hFlat⟩
  convert hInner using 2; norm_num

-- A constant Gram matched on the whole closed trim keeps the original seam,
-- with zero curvature on the actual trim already at the half-step.
example (g : SmoothRiemannianMetric I M) (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (n : ℕ) (hn : 0 < n) (L : E₄ ≃L[ℝ] E₄)
    (hBuffer : Metric.closedBall (0 : E₄) (1 + 1 / ((n : ℝ) + 1)) ⊆ F.source)
    (U : TopologicalSpace.Opens E₄) (hUsrc : (U : Set E₄) ⊆ F.source)
    (hTrim : {x : E₄ | |‖x‖ - 1| ≤ 1 / ((n : ℝ) + 1)} ⊆ (U : Set E₄))
    (hMatch : ∀ x ∈ U, ∀ u v : E₄, (nativeConstantMetric L).inner x u v =
      g.inner (F x) (mfderiv I₄ I (F : E₄ → M) x u) (mfderiv I₄ I (F : E₄ → M) x v)) :
    ∃ (χ : M → ℝ) (hχ : ContMDiff I 𝓘(ℝ) ∞ χ) (hχ01 : ∀ y, χ y ∈ Icc (0 : ℝ) 1)
      (b : SmoothRiemannianMetric I M),
      let path := chartSpliceMetric g b χ hχ hχ01
      path 0 ⟨le_rfl, zero_le_one⟩ = g ∧
      (∀ y ∈ selectedChartDisk F, metricRm04At (path 1 ⟨zero_le_one, le_rfl⟩) y = 0) ∧
      (∀ y ∈ selectedDiskTrim F n, metricRm04At
        (path (1 / 2) (by constructor <;> norm_num)) y = 0) ∧
      ∀ y ∉ interior (selectedChartDisk F), ∀ᶠ z in 𝓝 y, ∀ u v : TangentSpace I z,
        (path (1 / 2) (by constructor <;> norm_num)).inner z u v = g.inner z u v := by
  obtain ⟨χ, hχ, hχ01, b, _, _, _, hInitial, _, hFlat, hTrimFlat, _, hFix⟩ :=
    exists_selectedMatchedFlatDisk g F n hn L hBuffer U hUsrc hTrim hMatch
  refine ⟨χ, hχ, hχ01, b, hInitial, hFlat, ?_, ?_⟩
  · intro y hy
    exact (hTrimFlat y hy).2 (1 / 2) (by constructor <;> norm_num)
  · intro y hy
    filter_upwards [hFix y hy] with z hz
    exact fun u v => hz u v (1 / 2) (by constructor <;> norm_num)

end PhysicalEndpoint

section Cost

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [I.Boundaryless] [CompactSpace M] [Nonempty M]

local instance : MeasurableSpace M := borel M
local instance : BorelSpace M := ⟨rfl⟩

-- An attained positive flat replacement loses exactly the original
-- closed disk's charge, with the complete closed exterior retained.
example {o : ManifoldOrientation I M 4} (g h : SignedCollarMetric o)
    (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (hDisk : Metric.closedBall (0 : E₄) 1 ⊆ F.source)
    (hFlat : ∀ y ∈ selectedChartDisk F, metricRm04At h.metric y = 0)
    (hGerm : ∀ x ∉ interior (selectedChartDisk F), ∀ᶠ y in 𝓝 x,
      ∀ u v : TangentSpace I y, g.metric.inner y u v = h.metric.inner y u v)
    (hFrame : ∀ x ∉ interior (selectedChartDisk F), (g.frame x).basis = (h.frame x).basis)
    (hPos : 0 < classYamabeFour o.dimension_eq h.metric) :
    h.energy .plus = g.charge .plus (interior (selectedChartDisk F))ᶜ ∧
    h.energy .minus = g.charge .minus (interior (selectedChartDisk F))ᶜ ∧
    g.charge .plus (selectedChartDisk F) = g.charge .minus (selectedChartDisk F) := by
  have hp := selectedMatchedFlatDisk_exact_saving g h F hDisk hFlat hGerm hFrame hPos .plus
  have hm := selectedMatchedFlatDisk_exact_saving g h F hDisk hFlat hGerm hFrame hPos .minus
  exact ⟨hp.2.1, hm.2.1, hp.2.2.1.trans hm.2.2.1.symm⟩

-- At depth one the measured cost retains the positive half-core term and
-- charges the drift of the full remaining region in each chirality.
example {o : ManifoldOrientation I M 4} (g h : SignedCollarMetric o)
    (σ ν : Measure M) (Q : PartialDiffeomorph I₄ I E₄ M ∞) (m : NestedBalancedDisks I M)
    {n : ℕ} {ε : ℝ} (hDiv : BalancedPhysicalExteriorDivision g σ ν Q m 1 ε)
    (hFlat : ∀ y ∈ selectedChartDisk m.outer \ selectedDiskTrim m.outer n,
      metricRm04At h.metric y = 0)
    (hPos : 0 < classYamabeFour o.dimension_eq h.metric) :
    let W := selectedDiskTrim m.outer n
    let R := (selectedChartDisk m.outer ∪ W)ᶜ
    ∀ s : CollarChirality,
      sInf (geometricPositiveEnergies o) - g.energy .plus / 2 +
          g.charge s (selectedChartDisk m.core) / 2 - ε <
        h.charge s W + (h.charge s R - g.charge s R) := by
  intro W R s
  have hCost := balancedFlatReference_cost g h σ ν Q m hDiv hFlat hPos s
  change _ < h.charge s W + (h.charge s R - g.charge s R) at hCost
  norm_num at hCost
  linarith only [hCost]

-- The late bound is uniform over the positive replacements at each index.
example {o : ManifoldOrientation I M 4} (g : ℕ → SignedCollarMetric o)
    (σ ν : ℕ → Measure M) (Q : ℕ → PartialDiffeomorph I₄ I E₄ M ∞)
    (m : ℕ → NestedBalancedDisks I M) (n : ℕ → ℕ) {ε : ℕ → ℝ} {δ : ℝ}
    (hDiv : ∀ i, BalancedPhysicalExteriorDivision (g i) (σ i) (ν i) (Q i) (m i) 1 (ε i))
    (he : Tendsto (fun i => (g i).energy .plus) atTop (𝓝 (sInf (geometricPositiveEnergies o))))
    (hε : Tendsto ε atTop (𝓝 0)) (hδ : 0 < δ) :
    ∀ᶠ i in atTop, ∀ h : SignedCollarMetric o,
      let B := selectedChartDisk (m i).outer
      let W := selectedDiskTrim (m i).outer (n i)
      let R := (B ∪ W)ᶜ
      (∀ y ∈ B \ W, metricRm04At h.metric y = 0) →
      0 < classYamabeFour o.dimension_eq h.metric → ∀ s : CollarChirality,
      sInf (geometricPositiveEnergies o) / 2 - δ <
        h.charge s W + (h.charge s R - (g i).charge s R) := by
  filter_upwards [eventually_balancedFlatReference_cost g σ ν Q m n hDiv he hε hδ] with i hi
  intro h B W R hFlat hPos s
  have hCost := hi h hFlat hPos s
  change (1 - 1 / (2 : ℝ) ^ 1) * sInf (geometricPositiveEnergies o) - δ <
    h.charge s W + (h.charge s R - (g i).charge s R) at hCost
  rw [pow_one] at hCost
  linarith only [hCost]

end Cost

#check @frameEulerPfaffian_eq_quadratic
#print axioms frameEulerPfaffian_eq_quadratic
#check @exteriorWedge12Volume_of_bianchi
#print axioms exteriorWedge12Volume_of_bianchi
#check @frameEulerPfaffian_hasDerivAt_of_bianchi
#print axioms frameEulerPfaffian_hasDerivAt_of_bianchi
#check @frameEulerTransgression_norm_of_ricciDerivative
#print axioms frameEulerTransgression_norm_of_ricciDerivative
#check @metricFrameEulerPfaffian_eq_chargeDensity
#print axioms metricFrameEulerPfaffian_eq_chargeDensity
#check @metricFrameEulerCovariantDerivative_bianchi
#print axioms metricFrameEulerCovariantDerivative_bianchi
#check @ricciFlow_orthogonalConnectionVariation
#print axioms ricciFlow_orthogonalConnectionVariation
#check @ricciFlow_frameEulerTransgression_norm
#print axioms ricciFlow_frameEulerTransgression_norm
#check @eulerCurvatureCoefficient_hasDerivAt
#print axioms eulerCurvatureCoefficient_hasDerivAt
#check @eulerCurvatureCoefficient_hasDerivAt_skewJet
#print axioms eulerCurvatureCoefficient_hasDerivAt_skewJet
#check @eulerCurvatureCoefficient_eq_metricFrame
#print axioms eulerCurvatureCoefficient_eq_metricFrame
#check @ricciFlowEulerPfaffian_fixedBase_hasDerivAt
#print axioms ricciFlowEulerPfaffian_fixedBase_hasDerivAt
#check @eulerSpatialFlux_integral_bound
#print axioms eulerSpatialFlux_integral_bound
#check @modifiedEuler_transport_of_spatialFlux
#print axioms modifiedEuler_transport_of_spatialFlux

private theorem constantUnitFrameTensor (a b c d : Fin 4) :
    constantSectionalFrameTensor 1 a b c d =
      (if a = c then 1 else 0) * (if b = d then 1 else 0) -
        (if a = d then 1 else 0) * (if b = c then 1 else 0) := by
  rw [constantSectionalFrameTensor, one_mul]
  rfl

-- For unit sectional curvature the Pfaffian coefficient is 3 while the
-- manuscript's Gauss--Bonnet-normalized Euler density coefficient is 6.
set_option maxHeartbeats 1200000 in
example : 2 * frameEulerPfaffian (constantSectionalFrameTensor 1) = 6 := by
  have hFirst (a b c d : Fin 4) :
      constantSectionalFrameTensor 1 b a c d = -constantSectionalFrameTensor 1 a b c d := by
    simp only [constantUnitFrameTensor]
    ring
  have hLast (a b c d : Fin 4) :
      constantSectionalFrameTensor 1 a b d c = -constantSectionalFrameTensor 1 a b c d := by
    simp only [constantUnitFrameTensor]
    ring
  have hPair (a b c d : Fin 4) :
      constantSectionalFrameTensor 1 a b c d = constantSectionalFrameTensor 1 c d a b := by
    simp only [constantUnitFrameTensor, eq_comm]
    ring
  have hBianchi : constantSectionalFrameTensor 1 0 1 2 3 +
      constantSectionalFrameTensor 1 1 2 0 3 + constantSectionalFrameTensor 1 2 0 1 3 = 0 := by
    norm_num [constantUnitFrameTensor]
  rw [frameEulerPfaffian_eq_quadratic _ hFirst hLast hPair hBianchi]
  norm_num [frameTensorNormSq, frameRicciTensor, frameScalarCurvature,
    Fin.sum_univ_four, constantUnitFrameTensor]

#check @modifiedEuler_timeWeight
#print axioms modifiedEuler_timeWeight
#check @modifiedEuler_transport_of_flux
#print axioms modifiedEuler_transport_of_flux
#check @modifiedTerminalRicci_lower_of_eulerTransport_of_measurableCharges
#print axioms modifiedTerminalRicci_lower_of_eulerTransport_of_measurableCharges

-- The endpoint loss at a nonzero, permitted distortion exponent retains
-- the factor from the improper weighted time integral.
example {τ b : ℝ} (hτ : 0 < τ) (hb : b = 1 / 4) :
    (∫ s in (0 : ℝ)..τ, τ ^ (2 * b) * s ^ (-(2 * b))) = 2 * τ := by
  subst b
  rw [modifiedEuler_timeWeight hτ (by norm_num : (1 / 4 : ℝ) < 1 / 2)]
  ring

end ReferenceAndFluxReadback
