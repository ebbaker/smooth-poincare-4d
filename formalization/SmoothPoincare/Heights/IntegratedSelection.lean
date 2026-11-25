import FirstOrderTwistor.ChiralTransport
import FirstOrderTwistor.GeometricChiralBlock
import SmoothPoincare.Heights.Selection

/-! # Indexed height selection from a geometric chiral energy

The indexed area identity and smooth handle count floor are supplied. The
budget uses the same Weyl density and Riemannian volume on both regions.
-/

open DifferentialGeometry DifferentialGeometry.Integral.Measure
open FirstOrderTwistor MeasureTheory SectionsAndConnections Set
open scoped ContDiff Manifold

namespace SmoothPoincare

variable {E H M Ω : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M]
  [MeasurableSpace Ω]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

variable (g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4)
  (frame : ∀ x, OrientedOrthonormalFrameAt g o x) (U : Set M) (detA : M → ℝ)
  (μ : Measure Ω) [IsProbabilityMeasure μ] (m : Ω → ℕ)

local notation "dV" => riemannianVolumeMeasure I M g
local notation "Wplus" => (fun x : M => geometricChiralBlock g o x (frame x))
local notation "weylSq" => (fun x : M => hilbertSchmidtSq (Wplus x))
local notation "sphereArea" => (8 * Real.pi ^ 2 / 3 : ℝ)

/-- The total energy excess splits into the full complement mass, the middle
    Weyl deficit, and the mean count excess. All three terms are nonnegative
    under the supplied pointwise estimate and almost-sure floor. -/
theorem indexedHeight_energy_split (hU : MeasurableSet U) (hWInt : Integrable weylSq dV)
    (hdetInt : IntegrableOn detA U dV)
    (hWeyl : ∀ x ∈ U, (8/3 : ℝ) * detA x ≤ weylSq x)
    (harea : (∫ u, (m u : ℝ) ∂μ) = (2 / sphereArea) * ∫ x in U, detA x ∂dV)
    (hmInt : Integrable (fun u => (m u : ℝ)) μ) (hfloor : ∀ᵐ u ∂μ, 2 ≤ m u) :
    let outside := ∫ x in Uᶜ, weylSq x ∂dV
    let deficit := ∫ x in U, (weylSq x - (8/3 : ℝ) * detA x) ∂dV
    let countExcess := (4/3 : ℝ) * sphereArea * ((∫ u, (m u : ℝ) ∂μ) - 2)
    chiralFrameEnergy g Wplus - (8/3 : ℝ) * sphereArea = outside + deficit + countExcess ∧
      0 ≤ outside ∧ 0 ≤ deficit ∧ 0 ≤ countExcess := by
  dsimp only
  have hscaledDet : Integrable (fun x => (8/3 : ℝ) * detA x) (Measure.restrict dV U) :=
    hdetInt.const_mul _
  have hdeficit := integral_sub hWInt.integrableOn hscaledDet
  rw [integral_const_mul] at hdeficit
  have hsplit := integral_add_compl (μ := dV) (f := weylSq) hU hWInt
  have hscaledCount : (4/3 : ℝ) * sphereArea * (∫ u, (m u : ℝ) ∂μ) =
      (8/3 : ℝ) * ∫ x in U, detA x ∂dV := by
    rw [harea]
    field_simp [Real.pi_ne_zero]
    ring
  refine ⟨?_, ?_, ?_, ?_⟩
  · unfold chiralFrameEnergy
    linarith only [hsplit, hdeficit, hscaledCount]
  · exact setIntegral_nonneg hU.compl fun x _ =>
      Finset.sum_nonneg fun i _ => Finset.sum_nonneg fun j _ => sq_nonneg _
  · exact setIntegral_nonneg hU fun x hx => sub_nonneg.mpr (hWeyl x hx)
  · have hmeanFloor : (2 : ℝ) ≤ ∫ u, (m u : ℝ) ∂μ := by
      simpa using integral_mono_ae (integrable_const (2 : ℝ)) hmInt
        (hfloor.mono fun u hu => show (2 : ℝ) ≤ (m u : ℝ) by exact_mod_cast hu)
    exact mul_nonneg (by positivity) (sub_nonneg.mpr hmeanFloor)

/-- The strict chiral threshold gives a strict count probability and an actual
    regular direction carrying the supplied data for that direction. -/
theorem prob_and_exists_regular_twoMiddle_of_subcritical_energy
    (hU : MeasurableSet U) (hWInt : Integrable weylSq dV)
    (hdetInt : IntegrableOn detA U dV)
    (hWeyl : ∀ x ∈ U, (8/3 : ℝ) * detA x ≤ weylSq x)
    (harea : (∫ u, (m u : ℝ) ∂μ) = (2 / sphereArea) * ∫ x in U, detA x ∂dV)
    (hm : Measurable m) (hmInt : Integrable (fun u => (m u : ℝ)) μ)
    (hfloor : ∀ᵐ u ∂μ, 2 ≤ m u) (hE : chiralFrameEnergy g Wplus < 8 * Real.pi ^ 2)
    (regular : Set Ω) (hregular : ∀ᵐ u ∂μ, u ∈ regular) (Data : Ω → Type*)
    (hdata : ∀ u ∈ regular, m u = 2 → Nonempty (Data u)) :
    (3/4 : ℝ) < μ.real {u | m u = 2} ∧
      ∃ u, u ∈ regular ∧ m u = 2 ∧ Nonempty (Data u) := by
  obtain ⟨hbudget, houtside, hdeficit, _⟩ :=
    indexedHeight_energy_split g o frame U detA μ m hU hWInt hdetInt hWeyl harea hmInt hfloor
  have hscale : 0 < (4/3 : ℝ) * sphereArea := by positivity
  have hthreshold : (8/3 : ℝ) * sphereArea + (4/3 : ℝ) * sphereArea * (1/4) =
      8 * Real.pi ^ 2 := by ring
  have hmean : (∫ u, (m u : ℝ) ∂μ) < (9/4 : ℝ) := by
    apply lt_of_not_ge
    intro hlarge
    have hcount : (4/3 : ℝ) * sphereArea * (1/4) ≤
        (4/3 : ℝ) * sphereArea * ((∫ u, (m u : ℝ) ∂μ) - 2) :=
      mul_le_mul_of_nonneg_left (by linarith only [hlarge]) hscale.le
    linarith only [hbudget, houtside, hdeficit, hthreshold, hE, hcount]
  exact ⟨prob_twoMiddle_gt_threeQuarters μ m hm hmInt hfloor hmean,
    exists_regular_twoMiddle_with_data μ m hm hmInt hfloor hmean regular hregular Data hdata⟩

end SmoothPoincare
