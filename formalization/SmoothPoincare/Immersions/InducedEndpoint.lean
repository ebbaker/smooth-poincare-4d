import SmoothPoincare.Immersions.EndpointSaturation
import SmoothPoincare.Immersions.InducedBlock

/-! # The signed principal spectrum at the immersed energy endpoint -/

open DifferentialGeometry DifferentialGeometry.Integral.Measure FirstOrderTwistor
open MeasureTheory SectionsAndConnections Set
open scoped ContDiff Manifold

namespace SmoothPoincare

variable {E H M Ω : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M]
  [MeasurableSpace Ω]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- Under the indexed identity and topological count floor, energy at the
inclusive threshold forces balanced signed principal curvatures throughout
the nonempty open middle locus of this very immersion. -/
theorem inducedEndpoint_forces_balancedPrincipalFrames
    (g : SmoothRiemannianMetric I M) (F : IsometricHypersurface g)
    (o : ManifoldOrientation I M 4) (frame : ∀ x, OrientedOrthonormalFrameAt g o x)
    (U : Set M) (hOpen : IsOpen U) (P : ∀ z : U, PrincipalFrameAt F o z.val)
    (hframe : ∀ z, (P z).frame = frame z.val) (detA : M → ℝ)
    (hmiddle : ∀ z, ∃ a b c d : ℝ, 0 < a ∧ 0 < b ∧ 0 < c ∧ 0 < d ∧
      (P z).curvature = ![-a, -b, c, d] ∧ detA z.val = a * b * c * d)
    (μ : Measure Ω) [IsProbabilityMeasure μ] (m : Ω → ℕ) :
    let dV := riemannianVolumeMeasure I M g
    let W := fun x => geometricChiralBlock g o x (frame x)
    Integrable (fun x => hilbertSchmidtSq (W x)) dV →
    IntegrableOn detA U dV →
    ContinuousOn (fun x => hilbertSchmidtSq (W x) - (8/3 : ℝ) * detA x) U →
    (∫ u, (m u : ℝ) ∂μ) = (2 / (8 * Real.pi ^ 2 / 3)) * (∫ x in U, detA x ∂dV) →
    Integrable (fun u => (m u : ℝ)) μ → (∀ᵐ u ∂μ, 2 ≤ m u) →
    chiralFrameEnergy g W ≤ 64 * Real.pi ^ 2 / 9 →
    U.Nonempty ∧ (∀ z : U, ∃ k : ℝ, 0 < k ∧ (P z).curvature = ![-k,-k,k,k]) ∧
      (∀ᵐ u ∂μ, m u = 2) := by
  intro dV W hW hdet hcont harea hint hfloor hE
  have hBound (x : M) (hx : x ∈ U) : (8/3 : ℝ) * detA x ≤ hilbertSchmidtSq (W x) := by
    let z : U := ⟨x, hx⟩
    obtain ⟨a, b, c, d, ha, hb, hc, hd, hk, hdetA⟩ := hmiddle z
    have h := (inducedMiddleWeylBound (P z) hk ha hb hc hd).1
    rw [hframe z, ← hdetA] at h
    exact h
  obtain ⟨_, _, _, hU, hSat, hCount⟩ := indexedHeight_endpoint_saturation
    g o frame U detA μ m hOpen hW hdet hBound hcont harea hint hfloor hE
  refine ⟨hU, fun z => ?_, hCount⟩
  obtain ⟨a, b, c, d, ha, hb, hc, hd, hk, hdetA⟩ := hmiddle z
  have heq := (inducedMiddleWeylBound (P z) hk ha hb hc hd).2
  rw [hframe z, ← hdetA] at heq
  obtain ⟨hab, hbc, hcd⟩ := heq.mp (hSat z.val z.property)
  exact ⟨a, ha, by simpa only [← hab, ← hbc, ← hcd] using hk⟩

end SmoothPoincare
