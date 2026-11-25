import SmoothPoincare.Heights.IndexedHeightFibers
import SmoothPoincare.Immersions.GeometricOpenEquality
import SmoothPoincare.Immersions.InducedEndpoint

/-! # Strict lower induced-energy threshold from indexed heights -/

open DifferentialGeometry DifferentialGeometry.Integral.Measure FirstOrderTwistor
open MeasureTheory SectionsAndConnections Set
open scoped ContDiff ENNReal Manifold

namespace SmoothPoincare

variable {E H M : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

variable (g : SmoothRiemannianMetric I M) (F : IsometricHypersurface g)
  (o : ManifoldOrientation I M 4) (frame : ∀ x, OrientedOrthonormalFrameAt g o x)
  (U : Set M) (hOpen : IsOpen U) (P : ∀ z : U, PrincipalFrameAt F o z.val)
  (hframe : ∀ z, (P z).frame = frame z.val) (detA : M → ℝ)
  (hmiddle : ∀ z, ∃ a b c d : ℝ, 0 < a ∧ 0 < b ∧ 0 < c ∧ 0 < d ∧
    (P z).curvature = ![-a, -b, c, d] ∧ detA z.val = a * b * c * d)

local notation "dV" => riemannianVolumeMeasure I M g
local notation "W" => (fun x => geometricChiralBlock g o x (frame x))
local notation "weylSq" => (fun x => hilbertSchmidtSq (W x))
local notation "sphereArea" => (8 * Real.pi ^ 2 / 3 : ℝ)

include hOpen hframe hmiddle in
/-- The indexed mean identity and the almost-sure count floor force strict
energy above the inclusive endpoint on the same actual immersion. -/
theorem inducedEnergy_strict_of_indexedMean {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ] (m : Ω → ℕ)
    (hW : Integrable weylSq dV) (hdet : IntegrableOn detA U dV)
    (hcont : ContinuousOn (fun x => weylSq x - (8 / 3 : ℝ) * detA x) U)
    (harea : (∫ u, (m u : ℝ) ∂μ) = (2 / sphereArea) * ∫ x in U, detA x ∂dV)
    (hint : Integrable (fun u => (m u : ℝ)) μ) (hfloor : ∀ᵐ u ∂μ, 2 ≤ m u) :
    64 * Real.pi ^ 2 / 9 < chiralFrameEnergy g W := by
  apply lt_of_not_ge
  intro hE
  obtain ⟨hne, hBalanced, _⟩ := inducedEndpoint_forces_balancedPrincipalFrames
    g F o frame U hOpen P hframe detA hmiddle μ m hW hdet hcont harea hint hfloor hE
  exact noOpenBalancedPrincipalFrames U hOpen hne P hBalanced

include hOpen hframe hmiddle in
/-- The measured sheets of the actual normal supply the mean identity and
count integrability needed for strictness. The direction count and the
almost-sure floor refer to the same normalized area measure. -/
theorem inducedEnergy_strict_of_gaussSheets
    (N : ImmersionGaussNormal F) (area : Measure GaussDirection)
    (hArea : area univ = ENNReal.ofReal sphereArea)
    (hop : MeasurePreserving (fun u : GaussDirection => -u) area area)
    (A : GaussSheetAtlas N.normal U dV area (fun x => ENNReal.ofReal (detA x)))
    (m : GaussDirection → ℕ)
    (hW : Integrable weylSq dV) (hdet : IntegrableOn detA U dV)
    (hcont : ContinuousOn (fun x => weylSq x - (8 / 3 : ℝ) * detA x) U)
    (hCount : ∀ᵐ u ∂normalizedGaussDirections area sphereArea,
      (m u : ℝ≥0∞) = Measure.count (U ∩ N.normal ⁻¹' ({u, -u} : Set GaussDirection)))
    (hfloor : ∀ᵐ u ∂normalizedGaussDirections area sphereArea, 2 ≤ m u) :
    64 * Real.pi ^ 2 / 9 < chiralFrameEnergy g W := by
  have hdetNonneg : 0 ≤ᵐ[Measure.restrict dV U] detA :=
    (ae_restrict_iff' hOpen.measurableSet).2 (ae_of_all _ fun x hx => by
      obtain ⟨a, b, c, d, ha, hb, hc, hd, _, hprod⟩ := hmiddle ⟨x, hx⟩
      rw [show detA x = a * b * c * d from hprod]
      exact (mul_pos (mul_pos (mul_pos ha hb) hc) hd).le)
  obtain ⟨hProb, hmInt, hMean⟩ := meanIndexTwo_eq_gaussMass
    N U detA area hArea hop A m hdet hdetNonneg hCount
  let : IsProbabilityMeasure (normalizedGaussDirections area sphereArea) := hProb
  exact inducedEnergy_strict_of_indexedMean g F o frame U hOpen P hframe detA hmiddle
    (normalizedGaussDirections area sphereArea) m hW hdet hcont hMean hmInt hfloor

section ActualCount

variable (principal : ∀ x : M, PrincipalFrameAt F o x)

local notation "middleLocus" =>
  (Set.ofPred (fun x : M => HasMiddlePrincipalSignature (PrincipalFrameAt.curvature (principal x))))
local notation "actualCount" => (fun u => Set.ncard (indexedHeightTwoPoints F u))

/-- Strictness for the actual cardinality of the nondegenerate index-two
critical points, using the measured atlas on the true middle locus. -/
theorem inducedEnergy_strict_of_actualIndexTwo
    (hMiddleOpen : IsOpen middleLocus)
    (hPrincipalFrame : ∀ x : M, x ∈ middleLocus → (principal x).frame = frame x)
    (hPrincipalOrder : ∀ x : M, x ∈ middleLocus → ∃ a b c d : ℝ,
      0 < a ∧ 0 < b ∧ 0 < c ∧ 0 < d ∧
      (principal x).curvature = ![-a, -b, c, d] ∧ detA x = a * b * c * d)
    (N : ImmersionGaussNormal F) (area : Measure GaussDirection)
    (hArea : area univ = ENNReal.ofReal sphereArea)
    (hop : MeasurePreserving (fun u : GaussDirection => -u) area area)
    (A : GaussSheetAtlas N.normal middleLocus dV area (fun x => ENNReal.ofReal (detA x)))
    (hW : Integrable weylSq dV) (hdet : IntegrableOn detA middleLocus dV)
    (hcont : ContinuousOn (fun x => weylSq x - (8 / 3 : ℝ) * detA x) middleLocus)
    (hfloor : ∀ᵐ u ∂normalizedGaussDirections area sphereArea, 2 ≤ actualCount u) :
    64 * Real.pi ^ 2 / 9 < chiralFrameEnergy g W := by
  have hdetNonneg : 0 ≤ᵐ[Measure.restrict dV middleLocus] detA :=
    (ae_restrict_iff' hMiddleOpen.measurableSet).2 (ae_of_all _ fun x hx => by
      obtain ⟨a, b, c, d, ha, hb, hc, hd, _, hprod⟩ := hPrincipalOrder x hx
      rw [hprod]
      exact (mul_pos (mul_pos (mul_pos ha hb) hc) hd).le)
  obtain ⟨_, _, hProb, hmInt, hMean⟩ := meanActualIndexTwo_eq_gaussMass
    N principal middleLocus (fun _ => Iff.rfl) detA area hArea hop A hdet hdetNonneg
  let : IsProbabilityMeasure (normalizedGaussDirections area sphereArea) := hProb
  exact inducedEnergy_strict_of_indexedMean g F o frame middleLocus hMiddleOpen
    (fun z => principal z.val) (fun z => hPrincipalFrame z.val z.property) detA
    (fun z => hPrincipalOrder z.val z.property)
    (normalizedGaussDirections area sphereArea) actualCount hW hdet hcont hMean hmInt hfloor

end ActualCount
end SmoothPoincare
