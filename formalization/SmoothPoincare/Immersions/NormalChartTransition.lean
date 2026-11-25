import SmoothPoincare.Immersions.ChartUnitNormal
import DifferentialGeometry.Topology.Morse.HessianNaturality

/-! # Transport of the scalar normal second form between actual charts -/

open DifferentialGeometry DifferentialGeometry.Geometry
open DifferentialGeometry.Geometry.Connection DifferentialGeometry.Morse
open DifferentialGeometry.Topology.Morse
open Filter Function Manifold
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

open private linearHeightHessian from SmoothPoincare.Immersions.ImmersionChart

section Calculus

variable {V W : Type*} [NormedAddCommGroup V] [NormedSpace ℝ V]
  [NormedAddCommGroup W] [InnerProductSpace ℝ W]

private theorem normalForm_eq_heightHessian
    (A : V → V →L[ℝ] V →L[ℝ] V) {f : V → W} {p : V} (hf : ContDiffAt ℝ 2 f p)
    (n : W) (hNormal : ∀ v, inner ℝ (fderiv ℝ f p v) n = 0) (X Y : V) :
    chartNormalForm A f (fun _ => n) p X Y =
      fderiv ℝ (fderiv ℝ ((innerSL ℝ n) ∘ f)) p X Y := by
  let L := innerSL ℝ n
  have h := linearHeightHessian L hf X Y
  change fderiv ℝ (fderiv ℝ (L ∘ f)) p X Y = L (fderiv ℝ (fderiv ℝ f) p X Y) at h
  rw [h]
  change inner ℝ (bundleMapCovDeriv A 0 (fderiv ℝ f) p X Y) n = _
  simp only [bundleMapCovDeriv, Pi.zero_apply, zero_apply, add_zero, inner_sub_left,
    hNormal, sub_zero]
  exact real_inner_comm n _

end Calculus

variable {E H M : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  {g : SmoothRiemannianMetric I M}

local notation "V₅" => EuclideanSpace ℝ (Fin 5)

/-- At a point in the first chart, the scalar normal second form agrees
with the centered-chart scalar second form on the transported vectors.
The actual transition of extended charts supplies the transport. -/
theorem chartNormalForm_transition (F : IsometricHypersurface g) (p q : M)
    (hq : q ∈ (extChartAt I p).source) (n : V₅)
    (hNormal : ∀ v : E, inner ℝ (fderiv ℝ (F.localMap q) (extChartAt I q q) v) n = 0)
    (X Y : E) :
    let y := extChartAt I p q
    let z := extChartAt I q q
    let τ := (extChartAt I q : M → E) ∘ (extChartAt I p).symm
    let L := fderiv ℝ τ y
    chartNormalForm (metricChartConnectionForm g p) (F.localMap p) (fun _ => n) y X Y =
      chartNormalForm (metricChartConnectionForm g q) (F.localMap q) (fun _ => n) z (L X) (L Y) := by
  intro y z τ L
  let fp := F.localMap p
  let fq := F.localMap q
  let height := innerSL ℝ n
  have hy : y ∈ (extChartAt I p).target := (extChartAt I p).map_source hq
  have hz : z ∈ (extChartAt I q).target := mem_extChartAt_target q
  have hBack : (extChartAt I p).symm y = q := (extChartAt I p).left_inv hq
  have hτValue : τ y = z := congrArg (extChartAt I q) hBack
  have hBackSmooth : ContMDiffAt 𝓘(ℝ, E) I 2 (extChartAt I p).symm y :=
    ((contMDiffOn_extChartAt_symm (n := 2) p) y hy).contMDiffAt
      ((isOpen_extChartAt_target p).mem_nhds hy)
  have hOut : ContMDiffAt I 𝓘(ℝ, E) 2 (extChartAt I q) q := contMDiffAt_extChartAt
  have hComp : ContMDiffAt 𝓘(ℝ, E) 𝓘(ℝ, E) 2 τ y :=
    (show ContMDiffAt I 𝓘(ℝ, E) 2 (extChartAt I q) ((extChartAt I p).symm y)
      from hBack ▸ hOut).comp y hBackSmooth
  have hτ : ContDiffAt ℝ 2 τ y := hComp.contDiffAt
  have hP : ContDiffAt ℝ 2 fp y :=
    ((F.localMap_contDiffOn p y hy).contDiffAt ((isOpen_extChartAt_target p).mem_nhds hy)).of_le
      (by simp)
  have hQ : ContDiffAt ℝ 2 fq z :=
    ((F.localMap_contDiffOn q z hz).contDiffAt ((isOpen_extChartAt_target q).mem_nhds hz)).of_le
      (by simp)
  have hNear : fp =ᶠ[𝓝 y] fq ∘ τ := by
    have hNearSource : ∀ᶠ w in 𝓝 y, (extChartAt I p).symm w ∈ (extChartAt I q).source :=
      hBackSmooth.continuousAt.preimage_mem_nhds (by
        rw [hBack]
        simpa using (chartAt H q).open_source.mem_nhds (mem_chart_source H q))
    filter_upwards [hNearSource] with w hw
    have hInv := (extChartAt I q).left_inv hw
    simp only [fp, fq, τ, writtenInExtChartAt, Function.comp_apply, hInv]
    simp
  have hFirst : fderiv ℝ fp y = (fderiv ℝ fq z).comp L := by
    rw [hNear.fderiv_eq, fderiv_comp y (by rw [hτValue]; exact hQ.differentiableAt (by norm_num))
      (hτ.differentiableAt (by norm_num)), hτValue]
  have hNormalP (v : E) : inner ℝ (fderiv ℝ fp y v) n = 0 := by
    rw [hFirst, ContinuousLinearMap.comp_apply]
    exact hNormal (L v)
  have hHeightNear : (height ∘ fp) =ᶠ[𝓝 y] (height ∘ fq) ∘ τ :=
    hNear.mono (fun _ h => congrArg height h)
  have hCrit : fderiv ℝ (height ∘ fq) z = 0 := by
    rw [fderiv_comp z height.differentiableAt (hQ.differentiableAt (by norm_num)), height.fderiv]
    ext u
    change inner ℝ n (fderiv ℝ fq z u) = 0
    exact (real_inner_comm _ _).trans (hNormal u)
  have hHess := fderiv_fderiv_comp_at_critical
    (f := height ∘ fq) (c := τ) (x := y) (by
      rw [hτValue]
      exact height.contDiff.contDiffAt.comp z hQ) hτ (hτValue.symm ▸ hCrit)
  rw [normalForm_eq_heightHessian _ hP n hNormalP, normalForm_eq_heightHessian _ hQ n hNormal,
    hHeightNear.fderiv.fderiv_eq, hHess, hτValue]
  rfl

/-- Evaluate the scalar normal second form in one fixed chart using the
actual intrinsic second fundamental form at an overlapping point. -/
theorem chartNormalForm_eq_secondFundamentalFormAt (F : IsometricHypersurface g) (p q : M)
    (hq : q ∈ (extChartAt I p).source) (n : V₅)
    (hNormal : ∀ v : E, inner ℝ (fderiv ℝ (F.localMap q) (extChartAt I q q) v) n = 0)
    (X Y : E) :
    let y := extChartAt I p q
    let τ := (extChartAt I q : M → E) ∘ (extChartAt I p).symm
    let L := fderiv ℝ τ y
    chartNormalForm (metricChartConnectionForm g p) (F.localMap p) (fun _ => n) y X Y =
      inner ℝ (show V₅ from secondFundamentalFormAmbientAt g euclideanMetric F.map q (L X) (L Y)) n := by
  intro y τ L
  rw [chartNormalForm_transition F p q hq n hNormal]
  unfold chartNormalForm
  rw [immersionChart_secondForm F _ (metricChartConnectionForm_apply g q (extChartAt I q q))]

end SmoothPoincare
