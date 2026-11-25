import Mathlib.MeasureTheory.Function.Floor
import SmoothPoincare.Heights.GaussDifferential
import SmoothPoincare.Heights.GaussSheets
import SmoothPoincare.Heights.ImmersionHeightIndex

/-! # Actual index-two critical points as Gauss fibers -/

open DifferentialGeometry DifferentialGeometry.Topology DifferentialGeometry.Topology.Morse
open DifferentialGeometry.Integral.Measure
open MeasureTheory Set
open scoped ContDiff ENNReal Manifold

namespace SmoothPoincare

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  {g : SmoothRiemannianMetric I M} {F : IsometricHypersurface g}
  {o : ManifoldOrientation I M 4} {x : M}

local notation "V₅" => EuclideanSpace ℝ (Fin 5)

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- In four dimensions, strict middle signature consists of four nonzero
    principal curvatures with two negative entries. -/
def HasMiddlePrincipalSignature (k : Fin 4 → ℝ) : Prop :=
  (∀ i, k i ≠ 0) ∧ {i | k i < 0}.ncard = 2

private theorem gaussDirection_unit (u : GaussDirection) : inner ℝ (u : V₅) (u : V₅) = 1 := by
  rw [real_inner_self_eq_norm_mul_norm, norm_eq_of_mem_sphere u, one_mul]

private theorem gaussDirection_opposite_ne (u : GaussDirection) : u ≠ -u := by
  intro hu
  have hneg : (u : V₅) = -(u : V₅) := congrArg Subtype.val hu
  have hzero : (2 : ℝ) • (u : V₅) = 0 := by
    rw [two_smul]
    exact eq_neg_iff_add_eq_zero.mp hneg
  exact ne_zero_of_mem_unit_sphere u ((smul_eq_zero.mp hzero).resolve_left two_ne_zero)

private theorem principalSignCounts_add (k : Fin 4 → ℝ) (hk : ∀ i, k i ≠ 0) :
    {i | k i < 0}.ncard + {i | 0 < k i}.ncard = 4 := by
  let neg : Set (Fin 4) := {i | k i < 0}
  have hpos : {i | 0 < k i} = negᶜ := by
    ext i
    change 0 < k i ↔ ¬ k i < 0
    exact ⟨fun h => not_lt_of_ge h.le, fun h => lt_of_le_of_ne (le_of_not_gt h) (hk i).symm⟩
  change neg.ncard + {i | 0 < k i}.ncard = 4
  rw [hpos, ← ncard_union_eq disjoint_compl_right, union_compl_self]
  simp

/-- A zero scaled principal curvature would give a nonzero vector in the
    kernel of the Hessian, so a nondegenerate height excludes it. -/
theorem principalHeight_curvature_ne_zero_of_nondegenerate (P : PrincipalFrameAt F o x)
    (s : ℝ) (h : IsNondegenerateCriticalPointAt I (immersionHeight F (s • P.normal)) x) :
    ∀ i, s * P.curvature i ≠ 0 := by
  let f := immersionHeight F (s • P.normal)
  let Q := hessianAt I f x
  let B := chartHessianBilinAt (fun z => f ((extChartAt I x).symm z)) (extChartAt I x x)
  let b : Module.Basis (Fin 4) ℝ E := P.frame.basis
  have hDiag (i j : Fin 4) : B (b i) (b j) = if i = j then s * P.curvature i else 0 :=
    principalHeight_hessian P s i j
  have hSymm : B.IsSymm := (LinearMap.BilinForm.isSymm_iff_basis b).2 fun i j => by
    by_cases hij : i = j
    · subst j
      rfl
    · simp [hDiag, hij, Ne.symm hij]
  have hAssoc := principalQuadratic_associated_eq Q B (fun _ => rfl) ⟨hSymm.eq⟩
  have hSep := h.2
  change (QuadraticMap.associated (R := ℝ) Q).SeparatingLeft at hSep
  rw [hAssoc] at hSep
  intro i hi
  have hZero (z : E) : B (b i) z = 0 := by
    rw [← b.sum_repr z, map_sum]
    exact Finset.sum_eq_zero fun j _ => by simp [hDiag, hi]
  exact b.ne_zero i (hSep (b i) hZero)

/-- The actual nondegenerate index-two points occur at either principal
    unit normal precisely at points of strict middle signature. -/
theorem principalHeight_indexTwo_iff (P : PrincipalFrameAt F o x) (u : GaussDirection) :
    (IsNondegenerateCriticalPointAt I (immersionHeight F (u : V₅)) x ∧
      morseIndex I (immersionHeight F (u : V₅)) x = 2) ↔
      (((u : V₅) = P.normal ∨ (u : V₅) = -P.normal) ∧
        HasMiddlePrincipalSignature P.curvature) := by
  have hIpos : morseIndex I (immersionHeight F P.normal) x = {i | P.curvature i < 0}.ncard := by
    simpa using principalHeight_morseIndex P 1
  have hIneg : morseIndex I (immersionHeight F (-P.normal)) x = {i | 0 < P.curvature i}.ncard := by
    simpa using principalHeight_morseIndex P (-1)
  constructor
  · rintro ⟨hNondeg, hIndex⟩
    have hNormal := (principalHeight_unitCritical_iff P _ (gaussDirection_unit u)).1 hNondeg.1
    refine ⟨hNormal, ?_⟩
    rcases hNormal with hPos | hNeg
    · have hNorm : IsNondegenerateCriticalPointAt I (immersionHeight F ((1 : ℝ) • P.normal)) x := by
        simpa [hPos] using hNondeg
      refine ⟨fun i => ?_, hIpos.symm.trans (by simpa [hPos] using hIndex)⟩
      simpa using principalHeight_curvature_ne_zero_of_nondegenerate P 1 hNorm i
    · have hNorm : IsNondegenerateCriticalPointAt I (immersionHeight F ((-1 : ℝ) • P.normal)) x := by
        simpa [hNeg] using hNondeg
      have hNZ (i : Fin 4) : P.curvature i ≠ 0 := by
        simpa using principalHeight_curvature_ne_zero_of_nondegenerate P (-1) hNorm i
      have hCount : {i | 0 < P.curvature i}.ncard = 2 :=
        hIneg.symm.trans (by simpa [hNeg] using hIndex)
      have hTotal := principalSignCounts_add P.curvature hNZ
      exact ⟨hNZ, by omega⟩
  · rintro ⟨hNormal, hNZ, hCount⟩
    rcases hNormal with hPos | hNeg
    · rw [hPos]
      exact ⟨by simpa using principalHeight_nondegenerateCritical P 1 (fun i => by simpa using hNZ i),
        hIpos.trans hCount⟩
    · have hTotal := principalSignCounts_add P.curvature hNZ
      have hCountPos : {i | 0 < P.curvature i}.ncard = 2 := by omega
      rw [hNeg]
      exact ⟨by simpa using principalHeight_nondegenerateCritical P (-1) (fun i => by simpa using hNZ i),
        hIneg.trans hCountPos⟩

private theorem antipodalPair_eq {v w : V₅} (h : v = w ∨ v = -w) :
    ({v, -v} : Set V₅) = {w, -w} := by
  rcases h with rfl | rfl
  · rfl
  · simp only [neg_neg, Set.pair_comm (-w) w]

private theorem mem_antipodalPair_symm {v w : V₅} :
    v ∈ ({w, -w} : Set V₅) ↔ w ∈ ({v, -v} : Set V₅) := by
  simp only [mem_insert_iff, mem_singleton_iff]
  exact or_congr eq_comm (by constructor <;> intro h <;> rw [h, neg_neg])

private theorem ImmersionGaussNormal.mem_twoDirections_iff (N : ImmersionGaussNormal F)
    (P : PrincipalFrameAt F o x) (u : GaussDirection) :
    N.normal x ∈ ({u, -u} : Set GaussDirection) ↔
      (u : V₅) = P.normal ∨ (u : V₅) = -P.normal := by
  have hNormCritical : IsCriticalPointAt I (immersionHeight F (N.normal x : V₅)) x :=
    (immersionHeight_critical_iff F (N.normal x : V₅)).2 (N.perpendicular x)
  have hSign := (principalHeight_unitCritical_iff P _ (gaussDirection_unit (N.normal x))).1 hNormCritical
  have hCast : N.normal x ∈ ({u, -u} : Set GaussDirection) ↔
      (N.normal x : V₅) ∈ ({(u : V₅), -(u : V₅)} : Set V₅) := by
    simp only [mem_insert_iff, mem_singleton_iff, Subtype.ext_iff, coe_neg_sphere]
  rw [hCast, mem_antipodalPair_symm, antipodalPair_eq hSign]
  simp only [mem_insert_iff, mem_singleton_iff]

/-- The nondegenerate index-two critical points of the actual immersed height. -/
def indexedHeightTwoPoints (F : IsometricHypersurface g) (u : GaussDirection) : Set M :=
  {x | IsNondegenerateCriticalPointAt I (immersionHeight F (u : V₅)) x ∧
    morseIndex I (immersionHeight F (u : V₅)) x = 2}

omit [FiniteDimensional ℝ E] [I.Boundaryless] in
/-- For a Morse direction the index-two set is the ordinary critical set
    restricted by the Morse index. -/
theorem indexedHeightTwoPoints_eq_criticalPoints_of_morse (F : IsometricHypersurface g)
    (u : GaussDirection)
    (hMorse : ∀ y, IsCriticalPointAt I (immersionHeight F (u : V₅)) y →
      IsNondegenerateCriticalPointAt I (immersionHeight F (u : V₅)) y) :
    indexedHeightTwoPoints F u = criticalPoints I (immersionHeight F (u : V₅)) ∩
      {y | morseIndex I (immersionHeight F (u : V₅)) y = 2} := by
  ext y
  exact and_congr ⟨And.left, hMorse y⟩ Iff.rfl

/-- Actual global principal data identify the whole index-two set, including
    the exclusion of index-two nondegenerate critical points outside `U`. -/
theorem indexedHeightTwoPoints_eq_gaussFibers (N : ImmersionGaussNormal F)
    (P : ∀ x : M, PrincipalFrameAt F o x) (U : Set M)
    (hU : ∀ x, x ∈ U ↔ HasMiddlePrincipalSignature (P x).curvature) (u : GaussDirection) :
    indexedHeightTwoPoints F u = U ∩ N.normal ⁻¹' ({u, -u} : Set GaussDirection) := by
  ext x
  change (_ ∧ _) ↔ (x ∈ U ∧ N.normal x ∈ ({u, -u} : Set GaussDirection))
  rw [principalHeight_indexTwo_iff, hU x, N.mem_twoDirections_iff (P x)]
  exact and_comm

private theorem natFloor_count_toReal (S : Set M) (hS : MeasurableSet S) :
    Nat.floor (Measure.count S).toReal = S.ncard := by
  by_cases hFinite : S.Finite
  · rw [Measure.count_apply hS, ← hFinite.cast_ncard_eq]
    simp
  · have hInfinite : S.Infinite := hFinite
    rw [Measure.count_apply_infinite hInfinite, ENNReal.toReal_top, Nat.floor_zero, hInfinite.ncard]

variable [T2Space M] [SigmaCompactSpace M]

/-- The actual index-two count is measurable and has the indexed mean. Finite
    determinant mass makes the counted source fibers finite almost everywhere. -/
theorem meanActualIndexTwo_eq_gaussMass (N : ImmersionGaussNormal F)
    (P : ∀ x : M, PrincipalFrameAt F o x) (U : Set M)
    (hU : ∀ x, x ∈ U ↔ HasMiddlePrincipalSignature (P x).curvature)
    (detA : M → ℝ) (area : Measure GaussDirection)
    (hArea : area univ = ENNReal.ofReal (8 * Real.pi ^ 2 / 3))
    (hop : MeasurePreserving (fun u : GaussDirection => -u) area area)
    (A : GaussSheetAtlas N.normal U (riemannianVolumeMeasure I M g) area
      (fun x => ENNReal.ofReal (detA x)))
    (hdetInt : IntegrableOn detA U (riemannianVolumeMeasure I M g))
    (hdetNonneg : 0 ≤ᵐ[(riemannianVolumeMeasure I M g).restrict U] detA) :
    let μ := normalizedGaussDirections area (8 * Real.pi ^ 2 / 3)
    let m := fun u => (indexedHeightTwoPoints F u).ncard
    Measurable m ∧ (∀ᵐ u ∂μ, (indexedHeightTwoPoints F u).Finite) ∧
      IsProbabilityMeasure μ ∧ Integrable (fun u => (m u : ℝ)) μ ∧
      (∫ u, (m u : ℝ) ∂μ) = (2 / (8 * Real.pi ^ 2 / 3)) *
        ∫ x in U, detA x ∂riemannianVolumeMeasure I M g := by
  classical
  dsimp only
  let m := fun u => (indexedHeightTwoPoints F u).ncard
  let total := fun u : GaussDirection =>
    gaussMultiplicity N.normal U u + gaussMultiplicity N.normal U (-u)
  have hUMeas : MeasurableSet U := A.covers ▸ MeasurableSet.iUnion A.measurableSheet
  have hMeas (u : GaussDirection) : MeasurableSet (indexedHeightTwoPoints F u) := by
    rw [indexedHeightTwoPoints_eq_gaussFibers N P U hU]
    exact hUMeas.inter (N.measurable ((measurableSet_singleton (-u)).insert u))
  have hTotalEq (u : GaussDirection) : total u = Measure.count (indexedHeightTwoPoints F u) := by
    rw [indexedHeightTwoPoints_eq_gaussFibers N P U hU]
    exact gaussTwoNormalMultiplicity_eq_count N.normal N.measurable U hUMeas
      (gaussDirection_opposite_ne u)
  have hOne := A.measurableMultiplicity N.measurable
  have hTotalMeas : Measurable total := hOne.add (hOne.comp hop.measurable)
  have hmEq : m = fun u => Nat.floor (total u).toReal := by
    funext u
    rw [hTotalEq u, natFloor_count_toReal _ (hMeas u)]
  have hMMeas : Measurable m := by
    rw [hmEq]
    exact hTotalMeas.ennreal_toReal.nat_floor
  have hTotalFinite : (∫⁻ u, total u ∂area) ≠ ⊤ := by
    change (∫⁻ u, (gaussMultiplicity N.normal U u + gaussMultiplicity N.normal U (-u)) ∂area) ≠ ⊤
    rw [A.lintegral_twoNormals N.measurable _ hop,
      ← ofReal_integral_eq_lintegral_ofReal hdetInt hdetNonneg]
    exact ENNReal.mul_ne_top (by simp) ENNReal.ofReal_ne_top
  have hCountFinite : ∀ᵐ u ∂normalizedGaussDirections area (8 * Real.pi ^ 2 / 3),
      (indexedHeightTwoPoints F u).Finite := by
    apply Measure.ae_smul_measure _ (ENNReal.ofReal (8 * Real.pi ^ 2 / 3))⁻¹
    filter_upwards [ae_lt_top hTotalMeas hTotalFinite] with u hu
    exact (Measure.count_apply_lt_top' (hMeas u)).1 (hTotalEq u ▸ hu)
  refine ⟨hMMeas, hCountFinite,
    meanIndexTwo_eq_gaussMass N U detA area hArea hop A m hdetInt hdetNonneg ?_⟩
  filter_upwards [hCountFinite] with u hFinite
  rw [← indexedHeightTwoPoints_eq_gaussFibers N P U hU,
    Measure.count_apply (hMeas u), ← hFinite.cast_ncard_eq]
  simp [m]

end SmoothPoincare
