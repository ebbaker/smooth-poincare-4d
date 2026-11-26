import SmoothPoincare.Variational.SpatialEulerVariation
import DifferentialGeometry.Geometry.Flow.RicciFlow.Evolution.VolumeDensity
import DifferentialGeometry.Analysis.Integration.Measure.Family.CompactSupportContinuity
import DifferentialGeometry.Analysis.Integration.Measure.VolumeDensityFamily
import DifferentialGeometry.Analysis.Integration.Integral.CompactSupportDerivative

/-! # Differentiation of a fixed cutoff on the evolving volume -/

open Bundle DifferentialGeometry DifferentialGeometry.Geometry.Curvature
  DifferentialGeometry.Geometry.Operator DifferentialGeometry.Integral.Measure
  DifferentialGeometry.PDE.RicciFlow DifferentialGeometry.Tensor.Coordinates
  MeasureTheory Set
open scoped ContDiff Manifold Topology

noncomputable section
namespace SmoothPoincare

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

variable {D : RealTimeInterval} (S : SolutionOn (I := I) (M := M) D) (hS : IsSolutionOn S)
include hS

/-- The Radon--Nikodym density relative to a single fixed metric differentiates
using the scalar curvature of the evolving slice. -/
theorem ricciFlow_volumeRatio_hasDerivAt (q : SmoothRiemannianMetric I M)
    (t : D.RegularTime) (x : M) :
    HasDerivAt (fun s => riemannianVolumeDensity q (S.base.metric s) x)
      (-S.scalar t x * riemannianVolumeDensity q (S.base.metric t) x) (t : ℝ) := by
  have hx := mem_chart_source H x
  have h := (hasDerivAt_chartDensity_of_isSolutionOn S hS t.2 x
    (mem_baseSet_trivializationAt E (TangentSpace I) x)).div_const (chartDensity q x x)
  simpa only [riemannianVolumeDensity_apply_of_mem_chart_source q _ x hx, mul_div_assoc] using h

/-- The tested scalar density derivative relative to a fixed background volume.
If the scalar coefficient evolves by div X plus scalar curvature times itself,
the varying volume cancels the latter term. -/
theorem ricciFlow_testedDensity_hasDerivAt (q : SmoothRiemannianMetric I M)
    (t : D.RegularTime) (χ : M → ℝ) (a v : ℝ → M → ℝ) (x : M)
    (ha : HasDerivAt (fun s => a s x) (v t x + S.scalar t x * a t x) (t : ℝ)) :
    HasDerivAt (fun s => riemannianVolumeDensity q (S.base.metric s) x * (χ x * a s x))
      (riemannianVolumeDensity q (S.base.metric t) x * (χ x * v t x)) (t : ℝ) := by
  convert (ricciFlow_volumeRatio_hasDerivAt S hS q t x).mul (ha.const_mul (χ x)) using 1
  ring

omit [CompactSpace M] in
private theorem ricciFlowGram_smooth (α : M) (i j : Fin (Module.finrank ℝ E)) :
    ContMDiffOn (𝓘(ℝ, ℝ).prod I) 𝓘(ℝ, ℝ) ∞ (fun p : ℝ × M => chartGramMatrix (S.base.metric p.1) α p.2 i j)
      (D.regular ×ˢ (trivializationAt E (TangentSpace I) α).baseSet) := by
  let e := trivializationAt E (TangentSpace I) α
  have h := hS.smoothMetric.frameCompSmooth (e.localFrame (chartModelBasis E))
    (e.isLocalFrameOn_localFrame_baseSet I (∞ : WithTop ℕ∞) (chartModelBasis E)) i j
  apply h.congr
  intro p hp
  have heq (k : Fin (Module.finrank ℝ E)) :
      e.localFrame (chartModelBasis E) k p.2 = chartBasisVecFiber (I := I) α k p.2 := by
    rw [e.localFrame_apply_of_mem_baseSet (chartModelBasis E) hp.2]
    unfold Bundle.Trivialization.basisAt chartBasisVecFiber
    rw [Module.Basis.map_apply]
    exact congrFun (e.symm_continuousLinearEquivAt_eq hp.2) ((chartModelBasis E) k)
  simp only [chartGramMatrix_apply, heq, SolutionOn.family]

/-- Integrate the fixed-cutoff density variation on the actual closed Ricci slice.
Only pointwise time derivatives are supplied. Continuity on compact spacetime
neighborhoods gives local domination inside the proof. -/
theorem ricciFlow_testedIntegral_hasDerivAt (χ : M → ℝ) (hχ : Continuous χ)
    (a v : ℝ → M → ℝ)
    (ha : ContinuousOn (fun p : ℝ × M => a p.1 p.2) (D.regular ×ˢ univ))
    (hv : ContinuousOn (fun p : ℝ × M => v p.1 p.2) (D.regular ×ˢ univ))
    (hlocal : ∀ t : D.RegularTime, ∀ x, HasDerivAt (fun s => a s x)
      (v t x + S.scalar t x * a t x) (t : ℝ)) (t : D.RegularTime) :
    HasDerivAt (fun s => ∫ x, χ x * a s x ∂riemannianVolumeMeasure I M (S.base.metric s))
      (∫ x, χ x * v t x ∂riemannianVolumeMeasure I M (S.base.metric t)) (t : ℝ) := by
  let q := S.base.metric t
  let μ := riemannianVolumeMeasure I M q
  let ρ := fun s x => riemannianVolumeDensity q (S.base.metric s) x
  have hρ : ContinuousOn (fun p : ℝ × M => ρ p.1 p.2) (D.regular ×ˢ univ) :=
    riemannianVolumeDensity_family_continuousOn q S.base.metric (fun α i j => (ricciFlowGram_smooth S hS α i j).continuousOn)
  let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts q
  have hd := DifferentialGeometry.Analysis.hasDerivAt_integral_of_compact_support
    (μ := μ) (f := fun s x => ρ s x * (χ x * a s x))
    (f' := fun s x => ρ s x * (χ x * v s x)) D.regular_isOpen (K := univ) isCompact_univ
    (fun _ _ _ hx => False.elim (hx (mem_univ _)))
    (hρ.mul ((hχ.comp continuous_snd).continuousOn.mul ha))
    (hρ.mul ((hχ.comp continuous_snd).continuousOn.mul hv))
    (fun s hs x => ricciFlow_testedDensity_hasDerivAt S hS q ⟨s,hs⟩ χ a v x (hlocal ⟨s,hs⟩ x)) t.2
  have heq (s : ℝ) (b : M → ℝ) :
      (∫ x, b x ∂riemannianVolumeMeasure I M (S.base.metric s)) = ∫ x, ρ s x * b x ∂μ :=
    integral_riemannianVolumeMeasure_eq_integral_volumeDensity_smul q (S.base.metric s) b
  rw [show (fun s => ∫ x, χ x * a s x ∂riemannianVolumeMeasure I M (S.base.metric s)) =
      (fun s => ∫ x, ρ s x * (χ x * a s x) ∂μ) from funext (fun s => heq s _), heq t _]
  exact hd

/-- Convert the fixed-base four-form derivative at each time into the actual
tested derivative. The reference for the pointwise input is reset to that
instant's own metric. It may therefore come from a normal frame on that slice. -/
theorem ricciFlow_testedIntegral_of_frozenVolume (χ : M → ℝ) (hχ : Continuous χ)
    (a v : ℝ → M → ℝ)
    (ha : ContinuousOn (fun p : ℝ × M => a p.1 p.2) (D.regular ×ˢ univ))
    (hv : ContinuousOn (fun p : ℝ × M => v p.1 p.2) (D.regular ×ˢ univ))
    (hlocal : ∀ t : D.RegularTime, ∀ x, HasDerivAt
      (fun s => riemannianVolumeDensity (S.base.metric t) (S.base.metric s) x * a s x)
      (v t x) (t : ℝ)) (t : D.RegularTime) :
    HasDerivAt (fun s => ∫ x, χ x * a s x ∂riemannianVolumeMeasure I M (S.base.metric s))
      (∫ x, χ x * v t x ∂riemannianVolumeMeasure I M (S.base.metric t)) (t : ℝ) := by
  apply ricciFlow_testedIntegral_hasDerivAt S hS χ hχ a v ha hv _ t
  intro u x
  let ρ := fun s : ℝ => riemannianVolumeDensity (S.base.metric u) (S.base.metric s) x
  have hone : ρ u = 1 := riemannianVolumeDensity_self _ _
  have hn (s : ℝ) : ρ s ≠ 0 := (riemannianVolumeDensity_pos _ _ _).ne'
  have h := (hlocal u x).div (ricciFlow_volumeRatio_hasDerivAt S hS (S.base.metric u) u x) (hn u)
  change HasDerivAt (fun s => ρ s * a s x / ρ s)
    ((v u x * ρ u - ρ u * a u x * (-S.scalar u x * ρ u)) / ρ u ^ 2) (u : ℝ) at h
  simpa only [mul_div_cancel_left₀ _ (hn _), hone, mul_one, one_mul, one_pow, div_one,
    mul_neg, sub_neg_eq_add, mul_comm (a u x), neg_mul] using h

/-- A single smooth weighted density on regular spacetime permits testing a
pointwise frozen-volume derivative at one time by any continuous spatial cutoff. -/
theorem ricciFlow_testedIntegral_of_smoothDensity (t : D.RegularTime)
    (χ : M → ℝ) (hχ : Continuous χ) (a : ℝ → M → ℝ) (v : M → ℝ)
    (ha : ContMDiffOn (𝓘(ℝ, ℝ).prod I) 𝓘(ℝ, ℝ) 1
      (fun p : ℝ × M => a p.1 p.2) (D.regular ×ˢ univ))
    (hlocal : ∀ x, HasDerivAt
      (fun s => riemannianVolumeDensity (S.base.metric t) (S.base.metric s) x * a s x)
      (v x) (t : ℝ)) :
    HasDerivAt (fun s => ∫ x, χ x * a s x ∂riemannianVolumeMeasure I M (S.base.metric s))
      (∫ x, χ x * v x ∂riemannianVolumeMeasure I M (S.base.metric t)) (t : ℝ) := by
  let q := S.base.metric t
  let μ := riemannianVolumeMeasure I M q
  let F := fun s x => riemannianVolumeDensity q (S.base.metric s) x * a s x
  have hF : ContMDiffOn (𝓘(ℝ, ℝ).prod I) 𝓘(ℝ, ℝ) 1
      (fun p : ℝ × M => F p.1 p.2) (D.regular ×ˢ univ) :=
    ((riemannianVolumeDensity_family_contMDiffOn q S.base.metric D.regular_isOpen
      (ricciFlowGram_smooth S hS)).of_le (by simp)).mul ha
  have hopen := D.regular_isOpen.prod (isOpen_univ : IsOpen (univ : Set M))
  have hdF : ContinuousOn (fun p : ℝ × M => deriv (fun s => F s p.2) p.1)
      (D.regular ×ˢ univ) := by
    intro p hp
    have hdAt : ContMDiffAt (𝓘(ℝ, ℝ).prod I) 𝓘(ℝ, ℝ) 0
        (fun z : ℝ × M => deriv (fun s => F s z.2) z.1) p :=
      DifferentialGeometry.contMDiffAt_partial_deriv_fst (hF.contMDiffAt (hopen.mem_nhds hp)) (by simp)
    exact hdAt.continuousAt.continuousWithinAt
  let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts q
  have hd := DifferentialGeometry.Analysis.hasDerivAt_integral_of_compact_support
    (μ := μ) (f := fun s x => χ x * F s x)
    (f' := fun s x => χ x * deriv (fun r => F r x) s) D.regular_isOpen (K := univ) isCompact_univ
    (fun _ _ _ hx => False.elim (hx (mem_univ _)))
    ((hχ.comp continuous_snd).continuousOn.mul hF.continuousOn)
    ((hχ.comp continuous_snd).continuousOn.mul hdF) (fun s hs x => by
      have hat := hF.contMDiffAt (hopen.mem_nhds (show (s,x) ∈ D.regular ×ˢ univ from ⟨hs,trivial⟩))
      have hline : ContMDiffAt 𝓘(ℝ, ℝ) 𝓘(ℝ, ℝ) 1 (fun r => F r x) s :=
        hat.comp s (contMDiffAt_id.prodMk contMDiffAt_const)
      exact ((contMDiffAt_iff_contDiffAt.mp hline).differentiableAt (by simp)).hasDerivAt.const_mul _) t.2
  have heq (s : ℝ) : (∫ x, χ x * a s x ∂riemannianVolumeMeasure I M (S.base.metric s)) =
      ∫ x, χ x * F s x ∂μ := by
    rw [integral_riemannianVolumeMeasure_eq_integral_volumeDensity_smul q (S.base.metric s)]
    apply integral_congr_ae
    exact ae_of_all _ (fun x => by dsimp [F]; ring)
  have hv (x : M) : deriv (fun r => F r x) t = v x := (hlocal x).deriv
  simpa only [← heq, hv] using hd

end SmoothPoincare
