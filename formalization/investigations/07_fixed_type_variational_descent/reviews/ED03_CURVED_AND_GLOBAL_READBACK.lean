import SmoothPoincare

namespace CurvedAndGlobalReadback

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Geometry.Metric DifferentialGeometry.Geometry.Operator
open DifferentialGeometry.Integral.Measure DifferentialGeometry.Integral.DivergenceTheorem
open DifferentialGeometry.PDE.RicciFlow DifferentialGeometry.Tensor.Coordinates
open FirstOrderTwistor Filter Manifold MeasureTheory Module SectionsAndConnections Set SmoothPoincare
open scoped ContDiff ENNReal Manifold NNReal Topology

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)

#check @nativeCurvedGerm_nonflat
#print axioms nativeCurvedGerm_nonflat
#check @exists_selectedMatchedCurvedDisk
#print axioms exists_selectedMatchedCurvedDisk
#check @exists_selectedClampedCorePath
#print axioms exists_selectedClampedCorePath
#check @selectedMatchedCurvedDisk_trim_charge
#print axioms selectedMatchedCurvedDisk_trim_charge
#check @selectedMatchedCurvedDisk_energy
#print axioms selectedMatchedCurvedDisk_energy
#check @selectedMatchedCurvedDisk_cost_window
#print axioms selectedMatchedCurvedDisk_cost_window
#check @selectedMatchedCurvedDisk_core_charge_of_division
#print axioms selectedMatchedCurvedDisk_core_charge_of_division
#check @curvedCap_exteriorPrice
#print axioms curvedCap_exteriorPrice
#check @curvedCap_outerTrimPrice
#print axioms curvedCap_outerTrimPrice
#check @exists_depth_eventually_curvedCap_price_gt
#print axioms exists_depth_eventually_curvedCap_price_gt
#check @exists_selectedCoreGermPath
#print axioms exists_selectedCoreGermPath
#check @standardRoundFour_curvature_ne_zero
#print axioms standardRoundFour_curvature_ne_zero
#check @exists_selectedNativeRoundCorePath
#print axioms exists_selectedNativeRoundCorePath

section Curved

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]

-- The same marked endpoint retains nonzero curvature at the witnessed point,
-- while the half-time metric germs are fixed on both complete retained sets.
example [SigmaCompactSpace M] (g : SmoothRiemannianMetric I M)
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (n : ℕ) (hn : 0 < n)
    (r : SmoothRiemannianMetric I₄ E₄)
    (hBuffer : Metric.closedBall (0 : E₄) (1 + 1 / ((n : ℝ) + 1)) ⊆ F.source)
    (U : TopologicalSpace.Opens E₄)
    (hTrim : {x : E₄ | |‖x‖ - 1| ≤ 1 / ((n : ℝ) + 1)} ⊆ (U : Set E₄))
    (hMatch : ∀ x ∈ U, ∀ u v : E₄, r.inner x u v =
      g.inner (F x) (mfderiv I₄ I (F : E₄ → M) x u) (mfderiv I₄ I (F : E₄ → M) x v))
    (x₀ : E₄) (hx₀ : x₀ ∈ Metric.closedBall (0 : E₄) 1)
    (hCurv : metricRm04At r x₀ ≠ 0) :
    ∃ (χ : M → ℝ) (hχ : ContMDiff I 𝓘(ℝ) ∞ χ) (hχ01 : ∀ y, χ y ∈ Icc (0 : ℝ) 1)
      (b : SmoothRiemannianMetric I M),
      let path := chartSpliceMetric g b χ hχ hχ01
      path 0 ⟨le_rfl, zero_le_one⟩ = g ∧
      metricRm04At (path 1 ⟨zero_le_one, le_rfl⟩) (F x₀) ≠ 0 ∧
      ∀ y ∈ selectedDiskTrim F n ∪ (interior (selectedChartDisk F))ᶜ, ∀ᶠ z in 𝓝 y,
        ∀ u v : TangentSpace I z,
          (path (1 / 2) (by constructor <;> norm_num)).inner z u v = g.inner z u v := by
  obtain ⟨χ, hχ, hχ01, b, _, _, _, hInitial, _, hCurved, hFixed⟩ :=
    exists_selectedMatchedCurvedDisk g F n hn r hBuffer U hTrim hMatch x₀ hx₀ hCurv
  refine ⟨χ, hχ, hχ01, b, hInitial, hCurved, ?_⟩
  intro y hy
  filter_upwards [hFixed y hy] with z hz
  exact fun u v => hz u v (1 / 2) (by constructor <;> norm_num)

-- The round-germ construction supplies its own nonflat endpoint at the
-- native center and the full exact exterior agreement at half time.
example [SigmaCompactSpace M] (g : SmoothRiemannianMetric I M)
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (n : ℕ) (hn : 0 < n)
    (hBuffer : Metric.closedBall (0 : E₄) (1 + 1 / ((n : ℝ) + 1)) ⊆ F.source) :
    ∃ (χ : M → ℝ) (hχ : ContMDiff I 𝓘(ℝ) ∞ χ) (hχ01 : ∀ y, χ y ∈ Icc (0 : ℝ) 1)
      (b : SmoothRiemannianMetric I M),
      let path := chartSpliceMetric g b χ hχ hχ01
      metricRm04At (path 1 ⟨zero_le_one, le_rfl⟩) (F 0) ≠ 0 ∧
      ∀ y ∈ selectedDiskTrim F n ∪ (interior (selectedChartDisk F))ᶜ, ∀ᶠ z in 𝓝 y,
        ∀ u v : TangentSpace I z,
          (path (1 / 2) (by constructor <;> norm_num)).inner z u v = g.inner z u v := by
  obtain ⟨χ, hχ, hχ01, b, _, _, _, _, hOne, _, _, _, _, hCurv, _, hFix⟩ :=
    exists_selectedNativeRoundCorePath g F n hn hBuffer
  refine ⟨χ, hχ, hχ01, b, ?_, ?_⟩
  · rwa [hOne]
  · intro y hy
    filter_upwards [hFix y hy] with z hz
    exact fun u v => hz u v (1 / 2) (by constructor <;> norm_num)

variable [I.Boundaryless] [CompactSpace M] [Nonempty M]

local instance : MeasurableSpace M := borel M
local instance : BorelSpace M := ⟨rfl⟩

-- The curved inner charge bound at depth one subtracts the raw disk-side
-- trim and keeps the protected-core term positive, in both signs.
example {o : ManifoldOrientation I M 4} (g h : SignedCollarMetric o)
    (σ ν : Measure M) (Q : PartialDiffeomorph I₄ I E₄ M ∞)
    (marks : NestedBalancedDisks I M) (n : ℕ) {ε : ℝ}
    (hDivision : BalancedPhysicalExteriorDivision g σ ν Q marks 1 ε)
    (hGerm : ∀ x ∈ selectedDiskTrim marks.outer n ∪ (interior (selectedChartDisk marks.outer))ᶜ,
      ∀ᶠ y in 𝓝 x, ∀ u v : TangentSpace I y, g.metric.inner y u v = h.metric.inner y u v)
    (hFrame : ∀ x ∈ selectedDiskTrim marks.outer n ∪ (interior (selectedChartDisk marks.outer))ᶜ,
      (g.frame x).basis = (h.frame x).basis)
    (hPos : 0 < classYamabeFour o.dimension_eq h.metric) :
    let B := selectedChartDisk marks.outer
    let C := selectedDiskTrim marks.outer n
    ∀ s : CollarChirality, sInf (geometricPositiveEnergies o) - g.energy .plus / 2 +
        g.charge s (selectedChartDisk marks.core) / 2 - ε - g.charge s (B ∩ C) <
      h.charge s (B \ C) := by
  intro B C s
  have hCost := selectedMatchedCurvedDisk_core_charge_of_division
    g h σ ν Q marks 1 n hDivision hGerm hFrame hPos s
  change _ - (1 / (2 : ℝ) ^ 1) * (_ - _) - ε - g.charge s (B ∩ C) <
    h.charge s (B \ C) at hCost
  rw [pow_one] at hCost
  linarith only [hCost]

-- When both pieces of the complete exterior agree, the positive cap's
-- allowance itself must pay the entire finite depth-one lower bound.
example {o : ManifoldOrientation I M 4} (g h cap : SignedCollarMetric o)
    (σ ν : Measure M) (Q : PartialDiffeomorph I₄ I E₄ M ∞)
    (marks : NestedBalancedDisks I M) (n : ℕ) {ε δ : ℝ}
    (hDivision : BalancedPhysicalExteriorDivision g σ ν Q marks 1 ε)
    (hPos : 0 < classYamabeFour o.dimension_eq cap.metric) :
    let V := (interior (selectedChartDisk marks.outer))ᶜ
    let W := selectedDiskTrim marks.outer n
    ∀ s : CollarChirality, cap.energy s ≤ h.charge s V + δ →
      h.charge s (V ∩ W) = g.charge s (V ∩ W) →
      h.charge s (V \ W) = g.charge s (V \ W) →
      sInf (geometricPositiveEnergies o) - g.energy .plus / 2 +
        g.charge s (selectedChartDisk marks.core) / 2 - ε < δ := by
  intro V W s hCap hTrimEq hExteriorEq
  have hPrice := curvedCap_outerTrimPrice g h cap σ ν Q marks n hDivision hPos s hCap
  change _ - (1 / (2 : ℝ) ^ 1) * (_ - _) - ε <
    (h.charge s (V ∩ W) - g.charge s (V ∩ W)) +
      (h.charge s (V \ W) - g.charge s (V \ W)) + δ at hPrice
  rw [pow_one, hTrimEq, hExteriorEq] at hPrice
  linarith only [hPrice]

end Curved

#check @eulerPfaffian_baseChange
#print axioms eulerPfaffian_baseChange
#check @metricEulerBaseCoefficient_eq_pfaffian_mul_det
#print axioms metricEulerBaseCoefficient_eq_pfaffian_mul_det
#check @riemannianVolumeDensity_eq_orientedBasisDet
#print axioms riemannianVolumeDensity_eq_orientedBasisDet
#check @ricciFlowEulerPfaffian_fixedBase_eq_chargeDensity_mul_volume
#print axioms ricciFlowEulerPfaffian_fixedBase_eq_chargeDensity_mul_volume
#check @globalEulerCurrent_inner_orthonormal
#print axioms globalEulerCurrent_inner_orthonormal
#check @eulerDoubleDualField_apply_frame
#print axioms eulerDoubleDualField_apply_frame
#check @frameEulerCurrentCoefficient_eq_doubleDual
#print axioms frameEulerCurrentCoefficient_eq_doubleDual
#check @globalEulerCurrent_eq_frameTransgression
#print axioms globalEulerCurrent_eq_frameTransgression
#check @globalEulerCurrent_norm_le
#print axioms globalEulerCurrent_norm_le
#check @globalEulerCurrent_divergence_trace
#print axioms globalEulerCurrent_divergence_trace
#check @eulerDoubleDualField_nabla_apply_frame
#print axioms eulerDoubleDualField_nabla_apply_frame
#check @globalEulerCurrent_divergence_eq_primitiveJet
#print axioms globalEulerCurrent_divergence_eq_primitiveJet
#check @ricciFlowEulerPfaffian_fixedBase_hasDerivAt_divergence
#print axioms ricciFlowEulerPfaffian_fixedBase_hasDerivAt_divergence
#check @exists_localEulerGaugeFrame
#print axioms exists_localEulerGaugeFrame
#check @intrinsicEulerDensity_eq_frameEulerPfaffian
#print axioms intrinsicEulerDensity_eq_frameEulerPfaffian
#check @intrinsicEulerDensity_eq_modifiedChargeDensity
#print axioms intrinsicEulerDensity_eq_modifiedChargeDensity
#check @ricciFlow_volumeRatio_hasDerivAt
#print axioms ricciFlow_volumeRatio_hasDerivAt
#check @ricciFlow_testedDensity_hasDerivAt
#print axioms ricciFlow_testedDensity_hasDerivAt
#check @ricciFlow_testedIntegral_hasDerivAt
#print axioms ricciFlow_testedIntegral_hasDerivAt
#check @ricciFlow_testedIntegral_of_frozenVolume
#print axioms ricciFlow_testedIntegral_of_frozenVolume
#check @ricciFlow_eulerVolume_hasDerivAt
#print axioms ricciFlow_eulerVolume_hasDerivAt
#check @ricciFlow_testedEuler_hasDerivAt
#print axioms ricciFlow_testedEuler_hasDerivAt
#check @ricciFlow_testedEuler_hasDerivAt_gradient
#print axioms ricciFlow_testedEuler_hasDerivAt_gradient
#check @globalEulerCurrent_norm_le_testedEulerNorms
#print axioms globalEulerCurrent_norm_le_testedEulerNorms
#check @ricciFlow_testedEulerMoment_continuousOn_carrier
#print axioms ricciFlow_testedEulerMoment_continuousOn_carrier
#check @ricciFlow_testedEuler_transport
#print axioms ricciFlow_testedEuler_transport
#check @ricciFlow_testedEuler_transport_of_derivative
#print axioms ricciFlow_testedEuler_transport_of_derivative
#check @testedEulerMoment_eq_modifiedEulerMoment
#print axioms testedEulerMoment_eq_modifiedEulerMoment
#check @modifiedTerminalRicci_lower_of_testedEulerMomentTransport
#print axioms modifiedTerminalRicci_lower_of_testedEulerMomentTransport
#check @metricLipschitzCutoff_continuous
#print axioms metricLipschitzCutoff_continuous
#check @lipschitzEulerSpatialFlux_integral_bound
#print axioms lipschitzEulerSpatialFlux_integral_bound
#check @lipschitzEulerSpatialFlux_integral_bound_of_pointwise
#print axioms lipschitzEulerSpatialFlux_integral_bound_of_pointwise
#check @ricciFlow_terminalDistance_power_bound
#print axioms ricciFlow_terminalDistance_power_bound
#check @ricciFlow_terminalLipschitzEuler_transport
#print axioms ricciFlow_terminalLipschitzEuler_transport
#check @terminalBallCutoff_properties
#print axioms terminalBallCutoff_properties
#check @ricciFlow_terminalBall_RicciCharge
#print axioms ricciFlow_terminalBall_RicciCharge
#check @classYamabeFour_conformalCore
#print axioms classYamabeFour_conformalCore
#check @exists_selectedConformalCoreBump
#print axioms exists_selectedConformalCoreBump
#check @exists_nonzeroScalar_conformalCore
#print axioms exists_nonzeroScalar_conformalCore
#check @exists_selectedPositiveConformalCoreReference
#print axioms exists_selectedPositiveConformalCoreReference
#check @signedCollarWeylBlock_conformal
#print axioms signedCollarWeylBlock_conformal
#check @signedChiralEnergyMeasure_conformalMetric
#print axioms signedChiralEnergyMeasure_conformalMetric

-- Four fixed base vectors rescaled by two change the coefficient by sixteen.
example {V : Type*} [AddCommGroup V] [Module ℝ V]
    (R : Fin 4 → Fin 4 → LinearMap.BilinForm ℝ V)
    (hR : ∀ a b u v, R a b v u = -R a b u v) (e : Basis (Fin 4) ℝ V) :
    frameEulerPfaffian (fun a b i j => R a b ((2 : ℝ) • e i) ((2 : ℝ) • e j)) =
      16 * frameEulerPfaffian (fun a b i j => R a b (e i) (e j)) := by
  rw [eulerPfaffian_baseChange R hR e]
  rw [AlternatingMap.map_smul_univ, Basis.det_self]
  norm_num
  ring

section Tested

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [CompactSpace M]
  {D : RealTimeInterval}

local instance : MeasurableSpace M := borel M
local instance : BorelSpace M := ⟨rfl⟩

-- The normalized scalar computed in either of two unrelated oriented
-- orthonormal frames is the same intrinsic physical density.
example [BoundarylessManifold I M] (g : SmoothRiemannianMetric I M)
    (o : ManifoldOrientation I M 4) (x : M)
    (f f' : OrientedOrthonormalFrameAt g o x) :
    2 * frameEulerPfaffian (metricCurvatureFrameTensor g o x f) =
      2 * frameEulerPfaffian (metricCurvatureFrameTensor g o x f') :=
  (intrinsicEulerDensity_eq_frameEulerPfaffian g o x f).symm.trans
    (intrinsicEulerDensity_eq_frameEulerPfaffian g o x f')

-- Compose the local Ricci gauge, fixed-base Pfaffian derivative and positive
-- volume ratio on a single actual regular slice.
example [I.Boundaryless] [BoundarylessManifold I M]
    (S : SolutionOn (I := I) (M := M) D) (hS : IsSolutionOn S)
    (t : D.RegularTime) (o : ManifoldOrientation I M 4) (x : M)
    (f : OrientedOrthonormalFrameAt (S.family.metric t) o x) :
    HasDerivAt (fun s =>
      intrinsicEulerDensity (S.family.metric s) x *
        riemannianVolumeDensity (S.family.metric t) (S.family.metric s) x)
      (divergenceG (S.family.metric t) (ricciFlowEulerCurrent S t) x) (t : ℝ) := by
  obtain ⟨B, hInit, hDeriv, hNear⟩ := exists_localEulerGaugeFrame S hS t o x f
  let b (s : ℝ) (a : Fin 4) := B s a
  have hb (a : Fin 4) : b t a = f.basis a := by simp only [b, hInit]
  have hd (a : Fin 4) :
      HasDerivAt (fun s => b s a) (ricciSharp (S.family.metric t) x (b t a)) (t : ℝ) := by
    rw [hb]
    exact hDeriv a
  apply (ricciFlowEulerPfaffian_fixedBase_hasDerivAt_divergence S hS t o x f b hb hd).congr_of_eventuallyEq
  filter_upwards [hNear] with s hs
  let g := S.family.metric s
  let e : OrientedOrthonormalFrameAt g o x := ⟨B s, hs.2, hs.1⟩
  have hBase : frameEulerPfaffian (fun a c i j =>
      eulerCurvatureCoefficient S x (f.basis i) (f.basis j) (fun u => b u c) (fun u => b u a) s) =
      metricEulerBaseCoefficient g o x e f.basis := by
    simp only [eulerCurvatureCoefficient, metricEulerBaseCoefficient, g, e, b,
      SolutionFamily.rm04, SolutionOn.family_metric, metricRm04StandardAt_apply, metricRm04_apply]
  change _ * riemannianVolumeDensity _ g x =
    2 * frameEulerPfaffian (fun a c i j =>
      eulerCurvatureCoefficient S x (f.basis i) (f.basis j) (fun u => b u c) (fun u => b u a) s)
  rw [hBase, metricEulerBaseCoefficient_eq_pfaffian_mul_det,
    intrinsicEulerDensity_eq_frameEulerPfaffian g o x e,
    riemannianVolumeDensity_eq_orientedBasisDet _ g o x f e]
  ring

-- Even a constant scalar density has a nontrivial tested derivative from
-- the actual volume. The stationary cutoff carries the minus scalar term.
example (S : SolutionOn (I := I) (M := M) D) (hS : IsSolutionOn S)
    (χ : M → ℝ) (hχ : Continuous χ)
    (hScalar : ContinuousOn (fun p : ℝ × M => S.scalar p.1 p.2) (D.regular ×ˢ univ))
    (t : D.RegularTime) :
    HasDerivAt (fun s => ∫ x, χ x ∂riemannianVolumeMeasure I M (S.base.metric s))
      (-(∫ x, χ x * S.scalar t x ∂riemannianVolumeMeasure I M (S.base.metric t))) (t : ℝ) := by
  have hLocal (s : D.RegularTime) (x : M) :
      HasDerivAt (fun _ : ℝ => (1 : ℝ))
        (-S.scalar s x + S.scalar s x * 1) (s : ℝ) := by
    simpa using (hasDerivAt_const (s : ℝ) (1 : ℝ))
  have h := ricciFlow_testedIntegral_hasDerivAt S hS χ hχ (fun _ _ => 1)
    (fun s x => -S.scalar s x) continuousOn_const hScalar.neg hLocal t
  simpa only [mul_one, mul_neg, integral_neg] using h

end Tested

section FiniteTime

variable {E H M : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [BoundarylessManifold I M] [CompactSpace M] {D : RealTimeInterval}

local instance : MeasurableSpace M := borel M
local instance : BorelSpace M := ⟨rfl⟩

-- At exponent 1/4 the actual transport depends on sqrt(2τ). The budgets
-- use the full curvature and Ricci derivative on each evolving slice.
example (S : SolutionOn (I := I) (M := M) D) (hS : IsSolutionOn S)
    (o : ManifoldOrientation I M 4) (χ : C^∞⟮I, M; ℝ⟯) {τ δ A L : ℝ}
    (hτ : 0 < τ) (hδ : 0 ≤ δ) (hA : 0 ≤ A) (hL : 0 ≤ L)
    (hCarrier : Icc 0 τ ⊆ D.carrier) (hRegular : Ioo 0 τ ⊆ D.regular) :
    let g := S.family.metric
    let μ := fun s => riemannianVolumeMeasure I M (g s)
    let U := fun s => testedEulerCurvatureNorm (g s)
    let N := fun s => testedEulerRicciDerivativeNorm (g s)
    (∀ s ∈ Ioo 0 τ, ∀ x,
      Real.sqrt ((g s).inner x (gradG (g s) χ x) (gradG (g s) χ x)) ≤
        δ * Real.sqrt (τ ^ (2 * (1 / 4 : ℝ)) * s ^ (-(2 * (1 / 4 : ℝ))))) →
    (∀ s ∈ Ioo 0 τ, Real.sqrt (∫ x, U s x ^ 2 ∂(μ s)) ≤ A) →
    IntervalIntegrable (fun s => ∫ x, N s x ^ 2 ∂(μ s)) volume 0 τ →
    (∫ s in (0 : ℝ)..τ, ∫ x, N s x ^ 2 ∂(μ s)) ≤ L^2 →
    |testedEulerMoment (g τ) χ - testedEulerMoment (g 0) χ| ≤
      (144 * δ * A * L) * Real.sqrt (2 * τ) := by
  intro g μ U N hGrad hU hNInt hBudget
  have h := ricciFlow_testedEuler_transport S hS o χ hτ
    (by norm_num : (1 / 4 : ℝ) < 1 / 2) hδ hA hL hCarrier hRegular hGrad hU hNInt hBudget
  simpa only [show τ / (1 - 2 * (1 / 4 : ℝ)) = 2 * τ by ring] using h

-- For nonnegative Ricci curvature, a terminal Lipschitz cutoff uses its
-- actual time-τ constant on every earlier slice, with time factor √τ.
example (S : SolutionOn (I := I) (M := M) D) (hS : IsSolutionOn S)
    (o : ManifoldOrientation I M 4) {τ A L : ℝ} (hτ : 0 < τ) (hA : 0 ≤ A) (hL : 0 ≤ L)
    (hCarrier : Icc 0 τ ⊆ D.carrier) (hRegular : Ioo 0 τ ⊆ D.regular)
    (hRic : ∀ s ∈ Ioo 0 τ, ∀ x (v : TangentSpace I x), 0 ≤ S.ricciAt s x (vec2 v v))
    (χ : M → ℝ) (δ : ℝ≥0)
    (hχ : ∀ x y, edist (χ x) (χ y) ≤ (δ : ℝ≥0∞) * riemannianEDistOf (S.base.metric τ) x y) :
    let g := S.base.metric
    let μ := fun s => riemannianVolumeMeasure I M (g s)
    let U := fun s => testedEulerCurvatureNorm (g s)
    let N := fun s => testedEulerRicciDerivativeNorm (g s)
    (∀ s ∈ Ioo 0 τ, Real.sqrt (∫ x, U s x ^ 2 ∂(μ s)) ≤ A) →
    IntervalIntegrable (fun s => ∫ x, N s x ^ 2 ∂(μ s)) volume 0 τ →
    (∫ s in (0 : ℝ)..τ, ∫ x, N s x ^ 2 ∂(μ s)) ≤ L^2 →
    |testedEulerMoment (g τ) χ - testedEulerMoment (g 0) χ| ≤
      (144 * (δ : ℝ) * A * L) * Real.sqrt τ := by
  intro g μ U N hU hNInt hBudget
  have hLower (s : ℝ) (hs : s ∈ Ioo 0 τ) (x : M) (v : TangentSpace I x) :
      -(0 / s) * (S.base.metric s).inner x v v ≤ S.ricciAt s x (vec2 v v) := by
    simpa only [zero_div, neg_zero, zero_mul] using hRic s hs x v
  have h := ricciFlow_terminalLipschitzEuler_transport S hS o hτ (by norm_num : (0 : ℝ) < 1 / 2)
    hA hL hCarrier hRegular hLower χ δ hχ hU hNInt hBudget
  simpa only [mul_zero, sub_zero, div_one] using h

end FiniteTime

section TerminalMetric

variable {E H M : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  {D : RealTimeInterval}

-- The exponent-zero case contracts actual distances under nonnegative
-- Ricci curvature, with the terminal distance on the left.
example (S : SolutionOn (I := I) (M := M) D) (hS : IsSolutionOn S)
    {τ : ℝ} (hCarrier : Icc 0 τ ⊆ D.carrier) (hRegular : Ioo 0 τ ⊆ D.regular)
    (hRic : ∀ r ∈ Ioo 0 τ, ∀ x (v : TangentSpace I x), 0 ≤ S.ricciAt r x (vec2 v v))
    {s : ℝ} (hs : s ∈ Ioo 0 τ) (x y : M) :
    riemannianEDistOf (S.base.metric τ) x y ≤ riemannianEDistOf (S.base.metric s) x y := by
  have hLower (r : ℝ) (hr : r ∈ Ioo 0 τ) (z : M) (v : TangentSpace I z) :
      -(0 / r) * (S.base.metric r).inner z v v ≤ S.ricciAt r z (vec2 v v) := by
    simpa only [zero_div, neg_zero, zero_mul] using hRic r hr z v
  simpa using ricciFlow_terminalDistance_power_bound S hS (b := 0) hCarrier hRegular hLower hs x y

-- The terminal plateau uses the closed radius-R ball, while the test
-- vanishes already on the next sphere at R+1.
example [PreconnectedSpace M] (g : SmoothRiemannianMetric I M) (p x y : M) (R : ℝ)
    (hx : (riemannianEDistOf g p x).toReal = R)
    (hy : (riemannianEDistOf g p y).toReal = R + 1) :
    terminalBallCutoff g p R x = 1 ∧ terminalBallCutoff g p R y = 0 := by
  obtain ⟨_, hPlateau, hZero, _⟩ := terminalBallCutoff_properties g p R
  exact ⟨hPlateau x hx.le, hZero y hy.ge⟩

end TerminalMetric

#check @intrinsicCurvatureSq
#print axioms intrinsicCurvatureSq
#check @intrinsicTraceFreeRicciSq
#print axioms intrinsicTraceFreeRicciSq
#check @intrinsicWeylScalarCharge
#print axioms intrinsicWeylScalarCharge
#check @intrinsicTerminalCharge_eq_modifiedChargeDensity
#print axioms intrinsicTerminalCharge_eq_modifiedChargeDensity
#check @intrinsicTerminalRicci_lower_of_testedEuler
#print axioms intrinsicTerminalRicci_lower_of_testedEuler
#check @ricciFlow_terminalBall_intrinsicRicciCharge
#print axioms ricciFlow_terminalBall_intrinsicRicciCharge

section IntrinsicTerminal

variable {E H M : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [BoundarylessManifold I M] [CompactSpace M] [PreconnectedSpace M] {D : RealTimeInterval}

local instance : MeasurableSpace M := borel M
local instance : BorelSpace M := ⟨rfl⟩

-- A terminal ball at b=0, with actual tensors and both slice volumes.
example (S : SolutionOn (I := I) (M := M) D) (hS : IsSolutionOn S)
    (o : ManifoldOrientation I M 4) {τ A L ε : ℝ} (hτ : 0 < τ) (hA : 0 ≤ A) (hL : 0 ≤ L)
    (hCarrier : Icc 0 τ ⊆ D.carrier) (hRegular : Ioo 0 τ ⊆ D.regular)
    (hRic : ∀ s ∈ Ioo 0 τ, ∀ x (v : TangentSpace I x), 0 ≤ S.ricciAt s x (vec2 v v))
    (p : M) (R : ℝ) (P : Set M) (hP : MeasurableSet P)
    (hIn : ∀ x ∈ P, (riemannianEDistOf (S.base.metric τ) p x).toReal ≤ R) :
    let g := S.base.metric
    let χ := terminalBallCutoff (g τ) p R
    let μ := fun s => riemannianVolumeMeasure I M (g s)
    let B := {x | (riemannianEDistOf (g τ) p x).toReal < R+1}
    (∀ s ∈ Ioo 0 τ, Real.sqrt (∫ x, testedEulerCurvatureNorm (g s) x ^ 2 ∂(μ s)) ≤ A) →
    IntervalIntegrable (fun s => ∫ x, testedEulerRicciDerivativeNorm (g s) x ^ 2 ∂(μ s)) volume 0 τ →
    (∫ s in (0 : ℝ)..τ, ∫ x, testedEulerRicciDerivativeNorm (g s) x ^ 2 ∂(μ s)) ≤ L^2 →
    ε^2 ≤ (∫ x in P, intrinsicCurvatureSq (g 0) x ∂(μ 0)) →
    ε^2/2 - (∫ x, χ x * intrinsicWeylScalarCharge (g 0) x ∂(μ 0)) -
      2*(144*A*L)*Real.sqrt τ ≤ ∫ x in B, intrinsicTraceFreeRicciSq (g τ) x ∂(μ τ) := by
  intro g χ μ B hU hInt hBudget hFull
  have hLower (s : ℝ) (hs : s ∈ Ioo 0 τ) (x : M) (v : TangentSpace I x) :
      -(0 / s) * (S.base.metric s).inner x v v ≤ S.ricciAt s x (vec2 v v) := by
    simpa only [zero_div, neg_zero, zero_mul] using hRic s hs x v
  simpa only [mul_zero, sub_zero, div_one] using
    ricciFlow_terminalBall_intrinsicRicciCharge S hS o hτ (by norm_num : (0 : ℝ) < 1/2)
      hA hL hCarrier hRegular hLower p R P hP hIn hU hInt hBudget hFull

end IntrinsicTerminal

section Conformal

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [CompactSpace M]
  [ConnectedSpace M] [BoundarylessManifold I M]

local instance : MeasurableSpace M := borel M
local instance : BorelSpace M := ⟨rfl⟩

-- A conformal replacement can change the entire Levi–Civita curvature
-- while preserving the positive class and saving zero chiral charge on
-- every set in both signs, in the actual corresponding metrics.
example (g : SmoothRiemannianMetric I M) (u : C^∞⟮I, M; ℝ⟯)
    (o : ManifoldOrientation I M 4) (frame : ∀ x, OrientedOrthonormalFrameAt g o x)
    (hDim : Module.finrank ℝ E₄ = 4) (hPos : 0 < classYamabeFour hDim g) (B : Set M) :
    0 < classYamabeFour hDim (conformalMetric g u) ∧ ∀ s : CollarChirality,
      (energyMeasure (riemannianVolumeMeasure I M g)
        (fun x => hilbertSchmidtSq (signedCollarWeylBlock o g frame s x))).real B -
      (energyMeasure (riemannianVolumeMeasure I M (conformalMetric g u))
        (fun x => hilbertSchmidtSq (signedCollarWeylBlock o (conformalMetric g u)
          (fun y => conformalOrientedFrameAt u (frame y)) s x))).real B = 0 := by
  refine ⟨?_, fun s => ?_⟩
  · simpa only [classYamabeFour_conformalCore] using hPos
  · rw [signedChiralEnergyMeasure_conformalMetric, sub_self]

end Conformal
end CurvedAndGlobalReadback
