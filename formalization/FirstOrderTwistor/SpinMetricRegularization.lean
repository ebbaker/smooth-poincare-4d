import FirstOrderTwistor.SpinMetricCurrent
import FirstOrderTwistor.SpinRegularizedEstimate

/-! # The regularized inequality on the actual annular volume
Prepared for Edward B. Baker III, 25 November 2026, with OpenAI Codex.
-/

namespace FirstOrderTwistor

open DifferentialGeometry DifferentialGeometry.Integral.Measure MeasureTheory Set
open scoped Quaternion Manifold ContDiff Topology

variable {E H₀ M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H₀] {I : ModelWithCorners ℝ E H₀} [TopologicalSpace M] [ChartedSpace H₀ M]
  [IsManifold I ∞ M] [I.Boundaryless] [T2Space M] [SigmaCompactSpace M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- Relative regularization on a measurable physical annulus with a compactly supported
current for every localized test. The hypotheses compare first jets, norms and
the harmonic equation on that same annulus. The unweighted integral estimate
follows within the proof from the metric divergence theorem. -/
theorem spinMetricAnnulus_regularized
    {ι H V G T : Type*}
    [Fintype ι] [NormedAddCommGroup H] [InnerProductSpace ℝ H]
    [NormedAddCommGroup V] [NormedSpace ℝ V]
    [NormedAddCommGroup G] [NormedSpace ℝ G] [NormedAddCommGroup T] [NormedSpace ℝ T]
    (g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4)
    (A : Set M) (hA : MeasurableSet A)
    (χ cutoffGradient weyl ricci curvature : M → ℝ) (du : ℝ → M → ℝ)
    (ψ : ι → M → H) (q : ι → M → V)
    (covariant : (M → V) → M → G) (twistedDirac : (M → V) → M → T)
    (hχ : Continuous χ) (hχSupp : HasCompactSupport χ)
    (hdχ : Continuous cutoffGradient) (hdχSupp : HasCompactSupport cutoffGradient)
    (hW : Continuous weyl) (hR : Continuous ricci) (hM : Continuous curvature)
    (hMnonneg : 0 ≤ᵐ[(riemannianVolumeMeasure I M g).restrict A] curvature)
    (hψ : ∀ a, Continuous (fun x => ‖ψ a x‖))
    (hq : ∀ a, Continuous (fun x => ‖q a x‖))
    (hHessian : ∀ a, Continuous (fun x => ‖covariant (q a) x‖)) :
    let ν := (riemannianVolumeMeasure I M g).restrict A
    let S (x : M) := ∑ a, ‖ψ a x‖ ^ 2
    let Q (x : M) := ∑ a, ‖q a x‖ ^ 2
    let u (ε : ℝ) (x : M) := χ x / Real.sqrt (S x + ε)
    let U (ε : ℝ) (a : ι) := u ε • q a
    (∀ᵐ x ∂ν, SpinNormalCutoffJet (PiLp 2 (fun _ : ι => H))
      (χ x) (S x) (Q x) (cutoffGradient x) (fun ε => du ε x)) →
    (∀ᵐ x ∂ν, weyl x ^ 2 * S x ≤ 4 * ∑ a, ‖covariant (q a) x‖ ^ 2) →
    (∀ a, ∀ᵐ x ∂ν, ‖twistedDirac (q a) x‖ ^ 2 =
      (1 / 4 : ℝ) * ricci x ^ 2 * ‖ψ a x‖ ^ 2) →
    (∀ ε > 0, AEMeasurable (du ε) ν ∧ ∀ a,
      AEMeasurable (fun x => ‖covariant (U ε a) x‖ ^ 2) ν ∧
      AEMeasurable (fun x => ‖twistedDirac (U ε a) x‖ ^ 2) ν) →
    (∀ ε > 0, ∀ a, ∀ᵐ x ∂ν, ∃ (eCov : G) (eDirac : T),
      covariant (U ε a) x = u ε x • covariant (q a) x + eCov ∧
      twistedDirac (U ε a) x = u ε x • twistedDirac (q a) x + eDirac ∧
      ‖eCov‖ ^ 2 = du ε x ^ 2 * ‖q a x‖ ^ 2 ∧
      ‖eDirac‖ ^ 2 = du ε x ^ 2 * ‖q a x‖ ^ 2) →
    (∀ ε > 0, ∀ a, SpinMetricTestRealization g o A
      (fun x => ‖covariant (U ε a) x‖ ^ 2)
      (fun x => ‖twistedDirac (U ε a) x‖ ^ 2)
      (fun x => curvature x * ‖U ε a x‖ ^ 2)) →
    ∀ ε > 0,
      (∫ x, χ x ^ 2 * weyl x ^ 2 * (S x / (S x + ε)) ∂ν) ≤
        (816 : ℝ) * ∫ x, χ x ^ 2 * ricci x ^ 2 * (S x / (S x + ε)) +
          χ x ^ 2 * curvature x * (Q x / (S x + ε)) +
          χ x ^ 2 * (Q x / (S x + ε)) ^ 2 +
          cutoffGradient x ^ 2 * (Q x / (S x + ε)) ∂ν := by
  intro ν S Q u U hNormal hProjection hRicci hMeas hProduct hTest ε hε
  let _ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts (I := I) (M := M) g
  have hBound := spinRegularizedEstimate_of_unweighted ν χ cutoffGradient weyl ricci curvature du
    ψ q covariant twistedDirac hχ hχSupp hdχ hdχSupp hW hR hM hMnonneg hψ hq hHessian
    (K := 96) (by norm_num) hNormal hProjection hRicci hMeas hProduct
    (fun δ hδ a _ hG hD hC => (hTest δ hδ a).estimate hA hG hD hC) ε hε
  simpa only [show (48 + 8 * 96 : ℝ) = 816 by norm_num] using hBound

end FirstOrderTwistor
