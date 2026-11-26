import SmoothPoincare.Immersions.InducedBlock
import DifferentialGeometry.Geometry.Curvature.Cylinder.ProductMetric
import DifferentialGeometry.Geometry.Curvature.DimensionThree.Reconstruction.RiemannFromRicci
import DifferentialGeometry.Geometry.Measure.Product
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Arctan
import Mathlib.MeasureTheory.Integral.Prod

/-! # Curvature and length of a positive-scalar product band

The pointwise calculation uses the project's positive sectional slot convention
and Hilbert–Schmidt norms on the two spaces of real two-forms. The complete
upper side includes its whole fixed transition. The recognition tests below
concern inequalities on a given physical product and its joined endpoint energy.
-/

open FirstOrderTwistor SectionsAndConnections MeasureTheory Set
open scoped BigOperators

namespace SmoothPoincare.PositiveScalarCuts

noncomputable section

/-- The complementary wedge pairs have zero curvature whenever a normal is
present. In a tangential Ricci eigenframe the tangential wedge block is diagonal. -/
structure ProductRicciFrameSlots (K : CurvatureFrameTensor) (r : Fin 3 → ℝ) : Prop where
  normalNormal : ∀ i j : Fin 3,
    K (selfDualFirstWedge i).1 (selfDualFirstWedge i).2
      (selfDualFirstWedge j).1 (selfDualFirstWedge j).2 = 0
  normalTangent : ∀ i j : Fin 3,
    K (selfDualFirstWedge i).1 (selfDualFirstWedge i).2
      (selfDualSecondWedge j).1 (selfDualSecondWedge j).2 = 0
  tangentNormal : ∀ i j : Fin 3,
    K (selfDualSecondWedge i).1 (selfDualSecondWedge i).2
      (selfDualFirstWedge j).1 (selfDualFirstWedge j).2 = 0
  tangentTangent : ∀ i j : Fin 3,
    K (selfDualSecondWedge i).1 (selfDualSecondWedge i).2
      (selfDualSecondWedge j).1 (selfDualSecondWedge j).2 =
      if i = j then (∑ a, r a) / 2 - r i else 0

/-- The squared norm of the trace-free Ricci tensor in a three-dimensional
orthonormal Ricci eigenframe. -/
def ricciEigenTraceFreeSq (r : Fin 3 → ℝ) : ℝ :=
  ∑ i, (r i - (∑ j, r j) / 3) ^ 2

/-- The two normalized wedge compressions of product curvature have the same
diagonal. Taking the trace-free part removes the scalar block `R / 12`. -/
theorem productChiralWeylBlocks_of_slots {K : CurvatureFrameTensor} {r : Fin 3 → ℝ}
    (h : ProductRicciFrameSlots K r) :
    let D := Matrix.diagonal (fun i => - (r i - (∑ j, r j) / 3) / 2)
    traceFreeChiralBlock (selfDualCurvatureBlock K) = D ∧
      traceFreeChiralBlock (antiSelfDualCurvatureBlock K) = D := by
  let A := Matrix.diagonal (fun i => ((∑ j, r j) / 2 - r i) / 2)
  have hPlus : selfDualCurvatureBlock K = A := by
    ext i j
    by_cases hij : i = j <;>
      simp [selfDualCurvatureBlock, A, hij, h.normalNormal,
        h.normalTangent, h.tangentNormal, h.tangentTangent]
  have hMinus : antiSelfDualCurvatureBlock K = A := by
    ext i j
    by_cases hij : i = j <;>
      simp [antiSelfDualCurvatureBlock, A, hij, h.normalNormal,
        h.normalTangent, h.tangentNormal, h.tangentTangent]
  have hScalar : A.trace / 3 = (∑ j, r j) / 12 := by
    simp [A, Matrix.trace, Fin.sum_univ_three]
    ring
  have hFree : traceFreeChiralBlock A =
      Matrix.diagonal (fun i => - (r i - (∑ j, r j) / 3) / 2) := by
    unfold traceFreeChiralBlock
    rw [hScalar]
    ext i j
    by_cases hij : i = j <;> simp [A, hij]
    ring
  exact ⟨(congrArg traceFreeChiralBlock hPlus).trans hFree,
    (congrArg traceFreeChiralBlock hMinus).trans hFree⟩

/-- Each signed Weyl density on the cylinder is one quarter of the tangential
trace-free Ricci density in the supplied eigenframe. -/
theorem productChiralWeylDensities_of_slots {K : CurvatureFrameTensor} {r : Fin 3 → ℝ}
    (h : ProductRicciFrameSlots K r) :
    hilbertSchmidtSq (traceFreeChiralBlock (selfDualCurvatureBlock K)) =
      ricciEigenTraceFreeSq r / 4 ∧
    hilbertSchmidtSq (traceFreeChiralBlock (antiSelfDualCurvatureBlock K)) =
      ricciEigenTraceFreeSq r / 4 := by
  obtain ⟨hPlus, hMinus⟩ := productChiralWeylBlocks_of_slots h
  have hNorm : hilbertSchmidtSq (Matrix.diagonal (fun i => - (r i - (∑ j, r j) / 3) / 2)) =
      ricciEigenTraceFreeSq r / 4 := by
    simp [hilbertSchmidtSq, ricciEigenTraceFreeSq, Matrix.diagonal_apply, Fin.sum_univ_three]
    ring
  exact ⟨(congrArg hilbertSchmidtSq hPlus).trans hNorm,
    (congrArg hilbertSchmidtSq hMinus).trans hNorm⟩

section CylinderCurvature

open DifferentialGeometry DifferentialGeometry.Geometry.Connection
  DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Geometry.Metric
  DifferentialGeometry.Geometry.Operator DifferentialGeometry.Tensor0SBundle
open scoped Manifold ContDiff

variable {E H Y : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace Y] [ChartedSpace H Y] [IsManifold I ∞ Y] [T2Space Y] [BoundarylessManifold I Y]

private local instance : CompleteSpace E := FiniteDimensional.complete ℝ E
private local instance : IsManifold I 1 Y := IsManifold.of_le (by decide : (1 : WithTop ℕ∞) ≤ ∞)

/-- The actual cylinder curvature has the required slots in an oriented
orthonormal frame formed by its unit axis and a tangential Ricci eigenbasis. -/
theorem cylinderMetric_ricciFrameSlots (h : SmoothRiemannianMetric I Y) (p : Y × ℝ)
    (o : ManifoldOrientation (I.prod 𝓘(ℝ)) (Y × ℝ) 4)
    (frame : OrientedOrthonormalFrameAt (cylinderMetric h) o p)
    (B : Module.Basis (Fin 3) ℝ (TangentSpace I p.1)) (r : Fin 3 → ℝ)
    (hB : OrthonormalBasisAt h p.1 B)
    (hRicci : ∀ i j, metricRicciAt h p.1 (vec2 (B i) (B j)) = if i = j then r i else 0)
    (hAxis : frame.basis 0 = cylinderAxis p)
    (hTangents : ∀ i : Fin 3, frame.basis i.succ = (B i, 0)) :
    ProductRicciFrameSlots (metricCurvatureFrameTensor (cylinderMetric h) o p frame) r := by
  have hPull (a b c d : Fin 4) : metricCurvatureFrameTensor (cylinderMetric h) o p frame a b c d =
      metricRm04StandardAt h p.1 (frame.basis a).1 (frame.basis b).1
        (frame.basis d).1 (frame.basis c).1 := by
    unfold metricCurvatureFrameTensor
    erw [rm04_eq_inner_riem, inner_riemannOp_cylinderMetric, rm04_eq_inner_riem]
  have h0 : (frame.basis 0).1 = (0 : TangentSpace I p.1) := by rw [hAxis]; rfl
  have h1 : (frame.basis 1).1 = B 0 := congrArg Prod.fst (hTangents 0)
  have h2 : (frame.basis 2).1 = B 1 := congrArg Prod.fst (hTangents 1)
  have h3 : (frame.basis 3).1 = B 2 := congrArg Prod.fst (hTangents 2)
  have hFirst (i : Fin 3) : (selfDualFirstWedge i).1 = 0 := by fin_cases i <;> rfl
  have hFirstZero (v w z : TangentSpace I p.1) : metricRm04StandardAt h p.1 0 v w z = 0 := by
    erw [rm04_eq_inner_riem, map_zero]
    simp
  have hLastZero (u v w : TangentSpace I p.1) : metricRm04StandardAt h p.1 u v w 0 = 0 := by
    erw [rm04_eq_inner_riem]
    simp
  let K := metricCurvatureSections h
  have hLower := rm04LowersRm13At_of_realizes h (leviCivitaConnectionOfMetric h)
    (metricRm13 h) (metricRm04 h) K.rm13Realizes K.rm04Realizes p.1
  have hCurv := algebraicCurvatureSymmetries3_standardRmCompAt_of_leviCivita_realizes
    h (metricRm04 h) K.rm04Realizes B
  have hInv := orthonormal_invBasis3 h B hB
  have hTraceRicci := ricciFirstTraceAt_of_rm13 h B delta3 hInv
    (metricRicciAt h p.1) (metricRm13At h p.1) (metricRm04At h p.1)
    (metricRicciAt_eq_trace h p.1) hLower
  have hTraceScalar : ScalarRealizesRicciTraceAt (metricScalarAt h p.1)
      (metricRicciAt h p.1) delta3 B := by
    unfold ScalarRealizesRicciTraceAt
    rw [metricScalarAt_def]
    exact metricTracePair0SAt_eq_sum_basis h B delta3 hInv (metricRicciAt h p.1)
  have hTrace := traceDataOfFirst hB hCurv hTraceRicci hTraceScalar
  change RiemannFromRicci3DTraceDataAt h (-metricRicciAt h p.1) (-metricScalarAt h p.1)
    (metricRm04At h p.1) B at hTrace
  have hGram (i j : Fin 3) : h.inner p.1 (B i) (B j) = delta3 i j := hB i j
  have hScalar : metricScalarAt h p.1 = ∑ j, r j := by
    rw [hTraceScalar]
    simp [delta3, hRicci, Fin.sum_univ_three]
  have hFormula (a b c d : Fin 3) : metricRm04At h p.1 (vec4 (B a) (B b) (B c) (B d)) =
      -(metricRicciAt h p.1 (vec2 (B a) (B c))) * delta3 b d -
        -(metricRicciAt h p.1 (vec2 (B b) (B c))) * delta3 a d -
        -(metricRicciAt h p.1 (vec2 (B a) (B d))) * delta3 b c +
        -(metricRicciAt h p.1 (vec2 (B b) (B d))) * delta3 a c +
        metricScalarAt h p.1 / 2 * (delta3 a c * delta3 b d - delta3 b c * delta3 a d) := by
    rw [rm04_kn_gform hTrace]
    simp [hGram]
    ring
  constructor
  · intro i j
    rw [hPull, hFirst i, h0]
    exact hFirstZero _ _ _
  · intro i j
    rw [hPull, hFirst i, h0]
    exact hFirstZero _ _ _
  · intro i j
    rw [hPull, hFirst j, h0]
    exact hLastZero _ _ _
  · intro i j
    rw [hPull]
    fin_cases i <;> fin_cases j <;>
      norm_num [selfDualSecondWedge, h1, h2, h3, hFormula, hRicci, delta3, hScalar,
        Fin.sum_univ_three] <;> ring

/-- The squared trace-free Ricci density of the three-dimensional slice,
written intrinsically using the full Ricci norm and its scalar trace. -/
def metricTraceFreeRicciSq3 (h : SmoothRiemannianMetric I Y) (y : Y) : ℝ :=
  normSq0S h y 2 (metricRicciAt h y) - (metricScalarAt h y) ^ 2 / 3

/-- The actual two Weyl operators on the cylinder have squared norms equal
to one quarter of the slice's intrinsic trace-free Ricci density. -/
theorem cylinderMetric_chiralWeylDensities (h : SmoothRiemannianMetric I Y) (p : Y × ℝ)
    (o : ManifoldOrientation (I.prod 𝓘(ℝ)) (Y × ℝ) 4)
    (frame : OrientedOrthonormalFrameAt (cylinderMetric h) o p)
    (B : Module.Basis (Fin 3) ℝ (TangentSpace I p.1)) (r : Fin 3 → ℝ)
    (hB : OrthonormalBasisAt h p.1 B)
    (hRicci : ∀ i j, metricRicciAt h p.1 (vec2 (B i) (B j)) = if i = j then r i else 0)
    (hAxis : frame.basis 0 = cylinderAxis p)
    (hTangents : ∀ i : Fin 3, frame.basis i.succ = (B i, 0)) :
    hilbertSchmidtSq (geometricChiralBlock (cylinderMetric h) o p frame) =
      metricTraceFreeRicciSq3 h p.1 / 4 ∧
    hilbertSchmidtSq (traceFreeChiralBlock
      (antiSelfDualCurvatureBlock (metricCurvatureFrameTensor (cylinderMetric h) o p frame))) =
      metricTraceFreeRicciSq3 h p.1 / 4 := by
  have hInv := orthonormal_invBasis3 h B hB
  have hScalar : metricScalarAt h p.1 = ∑ j, r j := by
    rw [metricScalarAt_def, metricTracePair0SAt_eq_sum_basis h B delta3 hInv]
    simp [delta3, hRicci, Fin.sum_univ_three]
  have hNorm : normSq0S h p.1 2 (metricRicciAt h p.1) = ∑ i, (r i)^2 := by
    rw [normSq0S_two_eq_coord h p.1 B delta3 hInv]
    have hVec (i j : Fin 3) : (fun a : Fin 2 => if a = 0 then B i else B j) =
        vec2 (B i) (B j) := by
      funext a
      fin_cases a <;> simp [vec2]
    simp_rw [hVec, hRicci]
    simp [delta3, Fin.sum_univ_three, pow_two]
  have hDensity : metricTraceFreeRicciSq3 h p.1 = ricciEigenTraceFreeSq r := by
    rw [metricTraceFreeRicciSq3, hNorm, hScalar]
    simp [ricciEigenTraceFreeSq, Fin.sum_univ_three]
    ring
  rw [hDensity]
  exact productChiralWeylDensities_of_slots
    (cylinderMetric_ricciFrameSlots h p o frame B r hB hRicci hAxis hTangents)

end CylinderCurvature

section ProductVolume

variable {Y : Type*} [MeasurableSpace Y]

/-- Fubini on the genuine product carrier with the line's Lebesgue measure.
The density identity is required on the whole closed interval. -/
theorem productBand_integral_eq (μ : Measure Y) [SFinite μ] (f : Y → ℝ)
    (energyDensity : Y × ℝ → ℝ) {a b : ℝ} (hab : a ≤ b)
    (hDensity : ∀ p ∈ (univ ×ˢ Icc a b), energyDensity p = f p.1 / 4) :
    ∫ p in (univ ×ˢ Icc a b), energyDensity p ∂(μ.prod volume) =
      (b - a) * (∫ y, f y ∂μ) / 4 := by
  rw [setIntegral_congr_fun (MeasurableSet.univ.prod measurableSet_Icc) hDensity,
    ← Measure.prod_restrict, Measure.restrict_univ, integral_div, integral_fun_fst,
    measureReal_restrict_apply_univ, Real.volume_real_Icc_of_le hab, smul_eq_mul]

end ProductVolume

section RiemannianVolume

open DifferentialGeometry DifferentialGeometry.Geometry.Metric DifferentialGeometry.Integral.Measure
open scoped Manifold ContDiff

variable {E H Y : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [TopologicalSpace Y] [ChartedSpace H Y]
  [IsManifold I ∞ Y] [T2Space Y] [SigmaCompactSpace Y]

private local instance : MeasurableSpace Y := borel Y
private local instance : BorelSpace Y := ⟨rfl⟩

private theorem setIntegral_cast_measure {X : Type*} {m₁ m₂ : MeasurableSpace X}
    (hm : m₁ = m₂) (μ : @Measure X m₁) (f : X → ℝ) (s : Set X) :
    ∫ x in s, f x ∂(cast (congrArg (fun m : MeasurableSpace X => @Measure X m) hm) μ) =
      ∫ x in s, f x ∂μ := by
  cases hm
  rfl

private theorem cylinderMetric_setIntegral_eq_prod (h : SmoothRiemannianMetric I Y)
    (f : Y × ℝ → ℝ) (s : Set (Y × ℝ)) :
    ∫ p in s, f p ∂riemannianVolumeMeasure (I.prod 𝓘(ℝ)) (Y × ℝ) (cylinderMetric h) =
    ∫ p in s, f p ∂((riemannianVolumeMeasure I Y h).prod volume) := by
  have hProduct (y : Y) (t : ℝ) (v w : TangentSpace I y) (u z : ℝ) :
      (cylinderMetric h).inner (y, t) (v, u) (w, z) = h.inner y v w + u * z :=
    cylinderMetric_inner h (y, t) (v, u) (w, z)
  rw [PDE.RicciFlow.Perelman.KappaSolutions.riemannianVolumeMeasure_product_real_of_inner_eq
    h _ hProduct, setIntegral_cast_measure (BorelSpace.measurable_eq (α := Y × ℝ))]

/-- The same integration identity with the physical Riemannian volume of
the exact cylinder metric `dt² + h`. -/
theorem riemannianProductBand_integral_eq (h : SmoothRiemannianMetric I Y) (f : Y → ℝ)
    (energyDensity : Y × ℝ → ℝ) {a b : ℝ} (hab : a ≤ b)
    (hDensity : ∀ p ∈ (univ ×ˢ Icc a b), energyDensity p = f p.1 / 4) :
    ∫ p in (univ ×ˢ Icc a b), energyDensity p
      ∂riemannianVolumeMeasure (I.prod 𝓘(ℝ)) (Y × ℝ) (cylinderMetric h) =
      (b - a) * (∫ y, f y ∂riemannianVolumeMeasure I Y h) / 4 := by
  rw [cylinderMetric_setIntegral_eq_prod]
  let := riemannianVolumeMeasure_sigmaFinite (I := I) (M := Y) h
  exact productBand_integral_eq _ f energyDensity hab hDensity

end RiemannianVolume

/-- Joined endpoint energy in one chirality. The transition belongs to the
upper side, while each side receives one half of the product energy. -/
def productBand_joinedEnergy (lower upper transition : Bool → ℝ) (J L : ℝ) (σ : Bool) : ℝ :=
  lower σ + upper σ + transition σ + L * J / 4

/-- On the complete sides of the central slice, the upper transition is
counted once with its own signed energy. The two product halves are integrated
separately on the measured cylinder. -/
theorem productBand_completeSideLedger {Y : Type*} [MeasurableSpace Y]
    (μ : Measure Y) [SFinite μ] (f : Y → ℝ) (density : Bool → Y × ℝ → ℝ)
    (lower upper transition : Bool → ℝ) {L : ℝ} (hL : 0 ≤ L)
    (hDensity : ∀ σ p, p ∈ (univ ×ˢ Icc (-L / 2) (L / 2)) → density σ p = f p.1 / 4)
    (σ : Bool) :
    let J := ∫ y, f y ∂μ
    let left := lower σ + ∫ p in (univ ×ˢ Icc (-L / 2) 0), density σ p ∂(μ.prod volume)
    let right := upper σ + transition σ +
      ∫ p in (univ ×ˢ Icc 0 (L / 2)), density σ p ∂(μ.prod volume)
    left = lower σ + L * J / 8 ∧ right = upper σ + transition σ + L * J / 8 ∧
      left + right = productBand_joinedEnergy lower upper transition J L σ := by
  dsimp only
  rw [productBand_integral_eq μ f (density σ) (by linarith : -L / 2 ≤ 0)
    (fun p hp => hDensity σ p ⟨hp.1, hp.2.1, hp.2.2.trans (by linarith)⟩),
    productBand_integral_eq μ f (density σ) (by linarith : 0 ≤ L / 2)
    (fun p hp => hDensity σ p ⟨hp.1, (by linarith : -L / 2 ≤ 0).trans hp.2.1, hp.2.2⟩)]
  constructor
  · ring
  constructor
  · ring
  · unfold productBand_joinedEnergy
    ring

section RiemannianLedger

open DifferentialGeometry DifferentialGeometry.Geometry.Metric DifferentialGeometry.Integral.Measure
open scoped Manifold ContDiff

/-- The complete side ledger uses the actual Riemannian volume of the exact
cylinder. The fixed pieces and transition enter with their given signed costs. -/
theorem riemannianProductBand_completeSideLedger {E H Y : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [TopologicalSpace Y] [ChartedSpace H Y]
    [IsManifold I ∞ Y] [T2Space Y] [SigmaCompactSpace Y]
    (h : SmoothRiemannianMetric I Y) (f : Y → ℝ) (density : Bool → Y × ℝ → ℝ)
    (lower upper transition : Bool → ℝ) {L : ℝ} (hL : 0 ≤ L)
    (hDensity : ∀ σ p, p ∈ (univ ×ˢ Icc (-L / 2) (L / 2)) → density σ p = f p.1 / 4)
    (σ : Bool) :
    let J := ∫ y, f y ∂riemannianVolumeMeasure I Y h
    let vol := riemannianVolumeMeasure (I.prod 𝓘(ℝ)) (Y × ℝ) (cylinderMetric h)
    let left := lower σ + ∫ p in (univ ×ˢ Icc (-L / 2) 0), density σ p ∂vol
    let right := upper σ + transition σ +
      ∫ p in (univ ×ˢ Icc 0 (L / 2)), density σ p ∂vol
    left = lower σ + L * J / 8 ∧ right = upper σ + transition σ + L * J / 8 ∧
      left + right = productBand_joinedEnergy lower upper transition J L σ := by
  dsimp only
  simp only [cylinderMetric_setIntegral_eq_prod]
  let : MeasurableSpace Y := borel Y
  let := riemannianVolumeMeasure_sigmaFinite (I := I) (M := Y) h
  exact productBand_completeSideLedger _ f density lower upper transition hL hDensity σ

end RiemannianLedger

/-- The positive length at which the inclusive width inequality is an equality. -/
def productBand_widthFloor (ρ : ℝ) : ℝ := Real.pi * Real.sqrt (3 / ρ)

theorem productBand_widthFloor_pos {ρ : ℝ} (hρ : 0 < ρ) :
    0 < productBand_widthFloor ρ :=
  mul_pos Real.pi_pos (Real.sqrt_pos_of_pos (div_pos (by norm_num) hρ))

theorem productBand_widthFloor_eq {ρ : ℝ} (hρ : 0 < ρ) :
    ρ * productBand_widthFloor ρ ^ 2 = 3 * Real.pi ^ 2 := by
  unfold productBand_widthFloor
  rw [mul_pow, Real.sq_sqrt (by positivity : 0 ≤ 3 / ρ)]
  field_simp

theorem productBand_width_iff {ρ L : ℝ} (hρ : 0 < ρ) (hL : 0 ≤ L) :
    3 * Real.pi ^ 2 ≤ ρ * L ^ 2 ↔ productBand_widthFloor ρ ≤ L := by
  rw [← productBand_widthFloor_eq hρ, mul_le_mul_iff_right₀ hρ,
    sq_le_sq₀ (productBand_widthFloor_pos hρ).le hL]

/-- A length passes both the inclusive width and the strict joined endpoint
bound exactly when the strict bound holds at the minimum allowed length. -/
theorem exists_productBand_width_and_budget_iff (lower upper transition : Bool → ℝ)
    {ρ J T : ℝ} (hρ : 0 < ρ) (hJ : 0 ≤ J) :
    (∃ L, 0 < L ∧ 3 * Real.pi ^ 2 ≤ ρ * L ^ 2 ∧
      ∀ σ, productBand_joinedEnergy lower upper transition J L σ < 2 * T) ↔
    ∀ σ, productBand_joinedEnergy lower upper transition J (productBand_widthFloor ρ) σ < 2 * T := by
  constructor
  · rintro ⟨L, hL, hWidth, hCost⟩ σ
    have hLength := (productBand_width_iff hρ hL.le).mp hWidth
    have hMonotone := mul_le_mul_of_nonneg_right hLength hJ
    unfold productBand_joinedEnergy at *
    linarith [hCost σ]
  · intro hCost
    exact ⟨productBand_widthFloor ρ, productBand_widthFloor_pos hρ,
      (productBand_widthFloor_eq hρ).symm.le, hCost⟩

/-- At zero tangential trace-free Ricci integral the strict base cost is
the complete length test, including when either base cost equals the wall. -/
theorem exists_productBand_width_and_budget_zero_iff (lower upper transition : Bool → ℝ)
    {ρ T : ℝ} (hρ : 0 < ρ) :
    (∃ L, 0 < L ∧ 3 * Real.pi ^ 2 ≤ ρ * L ^ 2 ∧
      ∀ σ, productBand_joinedEnergy lower upper transition 0 L σ < 2 * T) ↔
    ∀ σ, lower σ + upper σ + transition σ < 2 * T := by
  simpa [productBand_joinedEnergy] using
    (exists_productBand_width_and_budget_iff lower upper transition hρ (le_refl (0 : ℝ)))

/-- The two-end comparison expression for outward mean bounds zero. -/
def productBand_twoMeanExpression (ρ L : ℝ) : ℝ :=
  Real.arctan (2 * 0 / Real.sqrt (3 * ρ)) + Real.arctan (2 * 0 / Real.sqrt (3 * ρ)) +
    Real.sqrt (ρ / 3) * L

theorem productBand_twoMean_pos_iff {ρ L : ℝ} (hρ : 0 < ρ) :
    0 < productBand_twoMeanExpression ρ L ↔ 0 < L := by
  have hRoot : 0 < Real.sqrt (ρ / 3) := Real.sqrt_pos_of_pos (by positivity)
  simpa [productBand_twoMeanExpression, Real.arctan_zero] using mul_pos_iff_of_pos_left hRoot

/-- The two-mean condition permits arbitrarily short products within the
strict joined endpoint budget exactly when both fixed costs have headroom. -/
theorem exists_shortProductBand_twoMean_and_budget_iff (lower upper transition : Bool → ℝ)
    {ρ J T δ : ℝ} (hρ : 0 < ρ) (hJ : 0 ≤ J) (hδ : 0 < δ) :
    (∃ L, L < δ ∧ 0 < productBand_twoMeanExpression ρ L ∧
      ∀ σ, productBand_joinedEnergy lower upper transition J L σ < 2 * T) ↔
    ∀ σ, lower σ + upper σ + transition σ < 2 * T := by
  constructor
  · rintro ⟨L, _, hMean, hCost⟩ σ
    have hL := (productBand_twoMean_pos_iff hρ).mp hMean
    have hBand := mul_nonneg hL.le hJ
    have hBound := hCost σ
    unfold productBand_joinedEnergy at hBound
    linarith
  · intro hCost
    let gap (σ : Bool) := 2 * T - (lower σ + upper σ + transition σ)
    let w := min (gap false) (gap true)
    have hw : 0 < w := lt_min (sub_pos.mpr (hCost false)) (sub_pos.mpr (hCost true))
    have hJ1 : 0 < J + 1 := by linarith
    let L := min (δ / 2) (w / (J + 1))
    have hL : 0 < L := lt_min (by positivity) (div_pos hw hJ1)
    have hShort : L < δ := (min_le_left _ _).trans_lt (by linarith)
    have hLength : L * (J + 1) ≤ w := (le_div_iff₀ hJ1).mp (min_le_right _ _)
    have hBand : L * J / 4 < w := by nlinarith only [hLength, hL, mul_nonneg hL.le hJ]
    refine ⟨L, hShort, (productBand_twoMean_pos_iff hρ).mpr hL, fun σ => ?_⟩
    have hGap : w ≤ gap σ := by
      cases σ
      · exact min_le_left _ _
      · exact min_le_right _ _
    have hPrice := hBand.trans_le hGap
    dsimp [gap] at hPrice
    unfold productBand_joinedEnergy
    linarith

section Checks

example : productBand_widthFloor 3 = Real.pi := by
  norm_num [productBand_widthFloor]

example : ricciEigenTraceFreeSq ![(0 : ℝ), 1, 1] / 4 = 1 / 6 := by
  norm_num [ricciEigenTraceFreeSq, Fin.sum_univ_three]

-- A fixed transition at the wall rules out all lengths, even at zero slope.
example : ¬ ∃ L, 0 < L ∧ 3 * Real.pi ^ 2 ≤ 3 * L ^ 2 ∧
    ∀ σ, productBand_joinedEnergy (fun _ => 0) (fun _ => 0) (fun _ => 1) 0 L σ < 2 * (1 / 2) := by
  rw [exists_productBand_width_and_budget_zero_iff _ _ _ (by norm_num)]
  intro h
  have hPlus := h true
  norm_num at hPlus

-- A strictly positive transition expense still permits arbitrarily short
-- products when the complete fixed costs have strict headroom.
example {δ : ℝ} (hδ : 0 < δ) : ∃ L, L < δ ∧ 0 < productBand_twoMeanExpression 3 L ∧
    ∀ σ, productBand_joinedEnergy (fun _ => 1) (fun _ => 1) (fun _ => 1) 2 L σ < 2 * 2 := by
  apply (exists_shortProductBand_twoMean_and_budget_iff _ _ _ (by norm_num) (by norm_num) hδ).mpr
  intro σ
  norm_num

end Checks

end

end SmoothPoincare.PositiveScalarCuts
