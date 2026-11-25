import SmoothPoincare.PhysicalScales.AnchoredShell
import SmoothPoincare.Variational.CutNonsplitting

/-! # Whole charged sets in the inclusive marked cut

The ball and the whole median exterior are measured in the same physical
source metric as the two full raw sides. Set containment transfers each
charge to its full side before the marked comparison.
-/

open DifferentialGeometry DifferentialGeometry.Integral.Measure
open FirstOrderTwistor MeasureTheory SectionsAndConnections Set
open scoped ContDiff Manifold

namespace SmoothPoincare

variable {E F L H K Hv M X V : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
  [NormedAddCommGroup L] [NormedSpace ℝ L] [FiniteDimensional ℝ L]
  [TopologicalSpace H] [TopologicalSpace K] [TopologicalSpace Hv]
  {I : ModelWithCorners ℝ E H} {J : ModelWithCorners ℝ F K} {IV : ModelWithCorners ℝ L Hv}
  [I.Boundaryless] [J.Boundaryless] [IV.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M] [Nonempty M]
  [TopologicalSpace X] [ChartedSpace K X] [IsManifold J ∞ X]
  [T2Space X] [CompactSpace X] [Nonempty X]
  [TopologicalSpace V] [ChartedSpace Hv V] [IsManifold IV ∞ V]
  [T2Space V] [CompactSpace V] [Nonempty V]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

variable {oM : ManifoldOrientation I M 4} {oX : ManifoldOrientation J X 4}
  {oV : ManifoldOrientation IV V 4} {oS : ManifoldOrientation (𝓡 4) StandardFourSphere 4}

/-- Opposite full sides carrying the inner ball and the entire median exterior
inherit their physical chiral charges. Inclusive recognition of the discarded
cap gives the surviving marked competitor and bounds its opposite charge
using the surcharge of that survivor. -/
theorem geometricChargedCut_le_excess {A : Type*} [TopologicalSpace A]
    (g : SmoothRiemannianMetric I M) (frame : ∀ x, OrientedOrthonormalFrameAt g oM x)
    (left : GeometricMarkedCutSide (I := I) (M := M) oX)
    (right : GeometricMarkedCutSide (I := I) (M := M) oV)
    (hInt : Integrable (fun x => hilbertSchmidtSq (geometricChiralBlock g oM x (frame x)))
      (riemannianVolumeMeasure I M g))
    (hCover : left.raw ∪ right.raw = univ)
    (hOverlap : AEDisjoint (riemannianVolumeMeasure I M g) left.raw right.raw)
    (keepLeft : MarkedSideReplacement (A := A) oM oS left right)
    (keepRight : MarkedSideReplacement (A := A) oM oS right left)
    (recognizeLeft : left.cappedEnergy ≤ 4 * Real.pi ^ 2 →
      Nonempty {r : X ≃ₘ⟮J, 𝓡 4⟯ StandardFourSphere // r.preservesOrientation oX oS})
    (recognizeRight : right.cappedEnergy ≤ 4 * Real.pi ^ 2 →
      Nonempty {r : V ≃ₘ⟮IV, 𝓡 4⟯ StandardFourSphere // r.preservesOrientation oV oS})
    (x : M) {a b innerCharge exteriorCharge γ₁ γ₂ : ℝ}
    (hInner : riemannianBallOf g x a ⊆ left.raw)
    (hExterior : (riemannianBallOf g x b)ᶜ ⊆ right.raw) :
    let e := chiralFrameEnergy g (fun z => geometricChiralBlock g oM z (frame z))
    let excess := e - sInf (geometricPositiveEnergies oM)
    let chiral := geometricChiralMeasure oM g frame
    innerCharge ≤ chiral.real (riemannianBallOf g x a) →
    exteriorCharge ≤ chiral.real (riemannianBallOf g x b)ᶜ →
    left.cappedEnergy ≤ left.rawEnergy g frame + γ₁ →
    right.cappedEnergy ≤ right.rawEnergy g frame + γ₂ →
    (left.cappedEnergy + right.cappedEnergy ≤ 2 * (4 * Real.pi ^ 2) ∨
      e + γ₁ + γ₂ ≤ 2 * (4 * Real.pi ^ 2)) →
    ((left.ProvidesCompetitor (oM := oM) right.raw ∧ right.rawEnergy g frame ≤ excess + γ₁ ∧
        exteriorCharge ≤ excess + γ₁) ∨
      (right.ProvidesCompetitor (oM := oM) left.raw ∧ left.rawEnergy g frame ≤ excess + γ₂ ∧
        innerCharge ≤ excess + γ₂)) ∧
    (excess + γ₂ < innerCharge → excess + γ₁ < exteriorCharge → False) := by
  intro e excess chiral hInnerCharge hExteriorCharge hCostLeft hCostRight hBudget
  let : IsFiniteMeasure chiral := geometricChiralMeasure_finite oM g frame hInt
  have hLeftMass : innerCharge ≤ left.rawEnergy g frame := by
    calc
      innerCharge ≤ chiral.real (riemannianBallOf g x a) := hInnerCharge
      _ ≤ chiral.real left.raw := measureReal_mono hInner
      _ = left.rawEnergy g frame :=
        geometricChiralMeasure_real_eq_setIntegral oM g frame hInt left.rawMeasurable
  have hRightMass : exteriorCharge ≤ right.rawEnergy g frame := by
    calc
      exteriorCharge ≤ chiral.real (riemannianBallOf g x b)ᶜ := hExteriorCharge
      _ ≤ chiral.real right.raw := measureReal_mono hExterior
      _ = right.rawEnergy g frame :=
        geometricChiralMeasure_real_eq_setIntegral oM g frame hInt right.rawMeasurable
  rcases geometricDiscardedMass_le_excess_inclusive g frame left right hInt hCover hOverlap
    keepLeft keepRight recognizeLeft recognizeRight hCostLeft hCostRight hBudget with h₁ | h₂
  · have h := hRightMass.trans h₁.2
    exact ⟨Or.inl ⟨h₁.1, h₁.2, h⟩, fun _ hStrict => (not_lt_of_ge h) hStrict⟩
  · have h := hLeftMass.trans h₂.2
    exact ⟨Or.inr ⟨h₂.1, h₂.2, h⟩, fun hStrict _ => (not_lt_of_ge h) hStrict⟩

end SmoothPoincare
