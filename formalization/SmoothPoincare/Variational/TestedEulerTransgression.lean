import SmoothPoincare.Variational.GlobalEulerCurrent
import SmoothPoincare.Variational.EulerBaseChange
import SmoothPoincare.Variational.EulerGaugeFrames
import SmoothPoincare.Variational.IntrinsicEulerDensity
import SmoothPoincare.Variational.TestedEulerIntegral

/-! # The tested Euler transgression on the supplied Ricci flow -/

open Bundle DifferentialGeometry DifferentialGeometry.Geometry.Curvature
  DifferentialGeometry.Geometry.Operator DifferentialGeometry.Integral.DivergenceTheorem
  DifferentialGeometry.Integral.Measure
  DifferentialGeometry.PDE.RicciFlow FirstOrderTwistor MeasureTheory Set
open scoped ContDiff Manifold Topology

noncomputable section
namespace SmoothPoincare

variable {E H M : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [BoundarylessManifold I M] {D : RealTimeInterval}

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- At one regular slice, differentiating the Euler four-form relative to that
slice's volume gives the divergence of the intrinsic smooth current. -/
theorem ricciFlow_eulerVolume_hasDerivAt (S : SolutionOn (I := I) (M := M) D) (hS : IsSolutionOn S)
    (o : ManifoldOrientation I M 4) (t : D.RegularTime) (x : M) :
    HasDerivAt (fun s => riemannianVolumeDensity (S.base.metric t) (S.base.metric s) x *
      intrinsicEulerDensity (S.base.metric s) x)
      (divergenceG (S.family.metric t) (ricciFlowEulerCurrent S t) x) (t : ℝ) := by
  classical
  let f := orientedOrthonormalFrameAt (S.family.metric t) o x
  obtain ⟨B, hB, hd, hOr⟩ := exists_localEulerGaugeFrame S hS t o x f
  let b : ℝ → Fin 4 → TangentSpace I x := fun s => B s
  have hb (i : Fin 4) : b t i = f.basis i := by simp only [b, hB]
  have hder (i : Fin 4) : HasDerivAt (fun s => b s i)
      (ricciSharp (S.family.metric t) x (b t i)) (t : ℝ) := by rw [hb]; exact hd i
  apply (ricciFlowEulerPfaffian_fixedBase_hasDerivAt_divergence S hS t o x f b hb hder).congr_of_eventuallyEq
  filter_upwards [hOr] with s hs
  let fx : OrientedOrthonormalFrameAt (S.family.metric s) o x := ⟨B s, hs.2, hs.1⟩
  have h := ricciFlowEulerPfaffian_fixedBase_eq_slicePfaffian_mul_volume S s (S.family.metric t)
    o x f fx b (fun _ => rfl)
  change riemannianVolumeDensity (S.family.metric t) (S.family.metric s) x *
    intrinsicEulerDensity (S.family.metric s) x = _
  rw [intrinsicEulerDensity_eq_frameEulerPfaffian _ o x fx, mul_comm]
  exact h.symm

/-- On a compact boundaryless oriented four-manifold, the derivative of a fixed
continuous spatial test of the normalized Euler four-form is its test against
the divergence of the constructed smooth spatial Euler current. -/
theorem ricciFlow_testedEuler_hasDerivAt (S : SolutionOn (I := I) (M := M) D) (hS : IsSolutionOn S)
    (o : ManifoldOrientation I M 4) (χ : M → ℝ) (hχ : Continuous χ) (t : D.RegularTime) :
    HasDerivAt (fun s => ∫ x, χ x * intrinsicEulerDensity (S.base.metric s) x
        ∂riemannianVolumeMeasure I M (S.base.metric s))
      (∫ x, χ x * divergenceG (S.family.metric t) (ricciFlowEulerCurrent S t) x
        ∂riemannianVolumeMeasure I M (S.base.metric t)) (t : ℝ) :=
  ricciFlow_testedIntegral_of_smoothDensity S hS t χ hχ _ _
    ((intrinsicEulerDensity_contMDiffOn_regular S hS).of_le (by simp))
    (ricciFlow_eulerVolume_hasDerivAt S hS o t)

/-- With a smooth cutoff the same derivative is the negative pairing of its
gradient with the current, integrated in the varying slice metric. -/
theorem ricciFlow_testedEuler_hasDerivAt_gradient (S : SolutionOn (I := I) (M := M) D)
    (hS : IsSolutionOn S) (o : ManifoldOrientation I M 4) (χ : C^∞⟮I, M; ℝ⟯)
    (t : D.RegularTime) :
    HasDerivAt (fun s => ∫ x, χ x * intrinsicEulerDensity (S.base.metric s) x
        ∂riemannianVolumeMeasure I M (S.base.metric s))
      (-(∫ x, (S.family.metric t).inner x ((ricciFlowEulerCurrent S t) x)
        (gradG (S.family.metric t) χ x) ∂riemannianVolumeMeasure I M (S.base.metric t))) (t : ℝ) := by
  have h := integral_tangentSectionAction_eq_neg_integral_smul_divergence
    (S.family.metric t) χ.contMDiff (ricciFlowEulerCurrent S t) (HasCompactSupport.of_compactSpace _)
  change HasDerivAt _ (-(∫ x, (S.family.metric t).inner x ((ricciFlowEulerCurrent S t) x)
    (gradG (S.family.metric t) χ x) ∂riemannianVolumeMeasure I M (S.family.metric t))) _
  rw [show (fun x => (S.family.metric t).inner x ((ricciFlowEulerCurrent S t) x)
    (gradG (S.family.metric t) χ x)) = tangentSectionAction (ricciFlowEulerCurrent S t) χ
    from funext (fun x => (tangentSectionAction_eq_inner_grad_g _ _ _ x).symm), h, neg_neg]
  exact
    ricciFlow_testedEuler_hasDerivAt S hS o χ χ.contMDiff.continuous t

end SmoothPoincare
