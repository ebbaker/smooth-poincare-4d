import SmoothPoincare.Variational.TerminalLipschitzEuler
import DifferentialGeometry.Geometry.Metric.Distance.Lipschitz

/-! # Terminal ball charge with a fixed distance cutoff -/

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Geometry.Metric
  DifferentialGeometry.Integral.Measure DifferentialGeometry.PDE.RicciFlow FirstOrderTwistor MeasureTheory Set
open scoped Manifold ContDiff Topology

noncomputable section
namespace SmoothPoincare

variable {E H M : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [BoundarylessManifold I M] [CompactSpace M] [PreconnectedSpace M] {D : RealTimeInterval}

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩
private local instance : CompleteSpace E := FiniteDimensional.complete ℝ E
private local instance : IsManifold I 1 M := IsManifold.of_le (by decide : (1 : WithTop ℕ∞) ≤ ∞)

open scoped ENNReal

/-- The plateau contains the closed radius-R ball and the test vanishes at
and beyond radius R+1. Distances use the specified metric. -/
def terminalBallCutoff (g : SmoothRiemannianMetric I M) (p : M) (R : ℝ) (x : M) : ℝ :=
  min (max (R + 1 - (riemannianEDistOf g p x).toReal) 0) 1

omit [FiniteDimensional ℝ E] [I.Boundaryless] [BoundarylessManifold I M] [CompactSpace M] [T2Space M] in
theorem terminalBallCutoff_properties (g : SmoothRiemannianMetric I M) (p : M) (R : ℝ) :
    (∀ x, terminalBallCutoff g p R x ∈ Icc (0 : ℝ) 1) ∧
    (∀ x, (riemannianEDistOf g p x).toReal ≤ R → terminalBallCutoff g p R x = 1) ∧
    (∀ x, R+1 ≤ (riemannianEDistOf g p x).toReal → terminalBallCutoff g p R x = 0) ∧
    ∀ x y, edist (terminalBallCutoff g p R x) (terminalBallCutoff g p R y) ≤ riemannianEDistOf g x y := by
  refine ⟨fun _ => ⟨le_min (le_max_right _ _) zero_le_one,min_le_right _ _⟩,?_,?_,?_⟩
  · intro x hx
    exact min_eq_right (le_trans (by linarith) (le_max_left _ _))
  · intro x hx
    simp [terminalBallCutoff, max_eq_right (show R+1-(riemannianEDistOf g p x).toReal ≤ 0 by linarith)]
  · intro x y
    refine le_trans ?_ (riemannianDistance_toReal_lipschitz g p x y)
    rw [edist_dist, edist_dist, Real.dist_eq, Real.dist_eq]
    apply ENNReal.ofReal_le_ofReal
    let a := (riemannianEDistOf g p x).toReal
    let b := (riemannianEDistOf g p y).toReal
    change |min (max (R+1-a) 0) 1 - min (max (R+1-b) 0) 1| ≤ |a-b|
    calc
      _ ≤ |max (R+1-a) 0 - max (R+1-b) 0| := by
        simpa only [sub_self, abs_zero, max_eq_left (abs_nonneg (max (R+1-a) 0 - max (R+1-b) 0))] using
          abs_min_sub_min_le_max (max (R+1-a) 0) 1 (max (R+1-b) 0) 1
      _ ≤ |(R+1-a)-(R+1-b)| := abs_max_sub_max_le_abs _ _ _
      _ = _ := by rw [show R+1-a-(R+1-b) = -(a-b) by ring, abs_neg]

/-- The initial attaining set may be any measurable subset of the terminal
plateau. The conclusion measures the full terminal trace-free Ricci mass
on the actual open ball in the terminal slice. -/
theorem ricciFlow_terminalBall_RicciCharge (S : SolutionOn (I := I) (M := M) D) (hS : IsSolutionOn S)
    (o : ManifoldOrientation I M 4) {τ b A L ε : ℝ} (hτ : 0 < τ) (hb : b < 1/2)
    (hA : 0 ≤ A) (hL : 0 ≤ L) (hCarrier : Icc 0 τ ⊆ D.carrier) (hRegular : Ioo 0 τ ⊆ D.regular)
    (hRic : ∀ s ∈ Ioo 0 τ, ∀ x (v : TangentSpace I x),
      -(b/s) * (S.base.metric s).inner x v v ≤ S.ricciAt s x (vec2 v v))
    (f₀ : ∀ x, OrientedOrthonormalFrameAt (S.base.metric 0) o x)
    (fτ : ∀ x, OrientedOrthonormalFrameAt (S.base.metric τ) o x)
    (p : M) (R : ℝ) (P : Set M) (hP : MeasurableSet P)
    (hIn : ∀ x ∈ P, (riemannianEDistOf (S.base.metric τ) p x).toReal ≤ R) :
    let g := S.base.metric
    let χ := terminalBallCutoff (g τ) p R
    let μ := fun s => riemannianVolumeMeasure I M (g s)
    let u := modifiedChargeDensity o (g 0) f₀
    let v := modifiedChargeDensity o (g τ) fτ
    let m := fun c => ∫ x, χ x * u c x ∂(μ 0)
    let B := {x | (riemannianEDistOf (g τ) p x).toReal < R+1}
    (∀ s ∈ Ioo 0 τ, Real.sqrt (∫ x, testedEulerCurvatureNorm (g s) x ^ 2 ∂(μ s)) ≤ A) →
    IntervalIntegrable (fun s => ∫ x, testedEulerRicciDerivativeNorm (g s) x ^ 2 ∂(μ s)) volume 0 τ →
    (∫ s in (0 : ℝ)..τ, ∫ x, testedEulerRicciDerivativeNorm (g s) x ^ 2 ∂(μ s)) ≤ L^2 →
    Integrable (u .full) (μ 0) → Integrable (v .ricci) (μ τ) →
    (∀ c, Integrable (fun x => χ x * u c x) (μ 0)) →
    (∀ c, Integrable (fun x => χ x * v c x) (μ τ)) →
    ε^2 ≤ (∫ x in P, u .full x ∂(μ 0)) →
    ε^2/2 - 4*(m .plus+m .minus) - m .scalar/6 - 2*(144*A*L)*Real.sqrt (τ/(1-2*b)) ≤
      ∫ x in B, v .ricci x ∂(μ τ) := by
  intro g χ μ u v m B hU hN hBudget hFull hZ hw₀ hwτ hε
  obtain ⟨h01,hOne,hZero,hLip⟩ := terminalBallCutoff_properties (g τ) p R
  have hdist : Continuous (fun x => (riemannianEDistOf (g τ) p x).toReal) := by
    apply metricLipschitzCutoff_continuous (g τ) (L := 1)
    simpa using riemannianDistance_toReal_lipschitz (g τ) p
  have hB : MeasurableSet B := (isOpen_lt hdist continuous_const).measurableSet
  apply modifiedTerminalRicci_lower_of_testedEulerMomentTransport o (g 0) (g τ) f₀ fτ χ hP hB
    h01 (fun x hx => hOne x (hIn x hx)) (fun x hx => hZero x (le_of_not_gt hx)) hτ hb
    hFull hZ hw₀ hwτ hε
  have h := ricciFlow_terminalLipschitzEuler_transport S hS o hτ hb hA hL hCarrier hRegular hRic χ 1
    (by simpa using hLip) hU hN hBudget
  simpa only [NNReal.coe_one, mul_one] using h

end SmoothPoincare
