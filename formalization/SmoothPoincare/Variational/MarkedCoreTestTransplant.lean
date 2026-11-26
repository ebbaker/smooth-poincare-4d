import SmoothPoincare.Variational.MarkedCapTestFactors
import DifferentialGeometry.Geometry.Curvature.Naturality.Pullback.LocalCross
import DifferentialGeometry.Geometry.Metric.Conformal.Laplacian
import DifferentialGeometry.Geometry.Operator.Laplacian.Pullback
import DifferentialGeometry.Topology.Manifold.PartialDiffeomorph.Basic
import DifferentialGeometry.Topology.Manifold.PartialDiffeomorph.FunctionExtension

/-! # A compact test on a marked open patch and its genuine zero extension -/

open DifferentialGeometry DifferentialGeometry.Geometry.Connection
open DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Geometry.Operator
open DifferentialGeometry.Integral.Measure Filter MeasureTheory Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

variable {E F H K M X P : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
  [TopologicalSpace H] [TopologicalSpace K]
  {I : ModelWithCorners ℝ E H} {J : ModelWithCorners ℝ F K}
  [I.Boundaryless] [J.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [CompactSpace M]
  [TopologicalSpace X] [ChartedSpace K X] [IsManifold J ∞ X] [T2Space X] [CompactSpace X]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩
private local instance : MeasurableSpace X := borel X
private local instance : BorelSpace X := ⟨rfl⟩

/-- Conformal transport of a smooth test's scalar numerator allows zeros in
the test. The logarithm is needed only for the background metric. -/
theorem capFactorScalar_conformal (d : Module.finrank ℝ E = 4)
    (g : SmoothRiemannianMetric I M) (u f : C^∞⟮I, M; ℝ⟯) :
    capFactorScalar (conformalMetric g u) f = capFactorScalar g (capExpFactor u * f) := by
  let : NeZero (Module.finrank ℝ E) := ⟨by rw [d]; decide⟩
  unfold capFactorScalar
  rw [integral_conformalMetric_eq_integral_smul_exp]
  apply integral_congr_ae
  filter_upwards [] with x
  have hu : ContMDiffAt I 𝓘(ℝ, ℝ) 2 (u : M → ℝ) x := u.contMDiff.contMDiffAt.of_le (by simp)
  have hf : ContMDiffAt I 𝓘(ℝ, ℝ) 2 (f : M → ℝ) x := f.contMDiff.contMDiffAt.of_le (by simp)
  change Real.exp ((Module.finrank ℝ E : ℝ) * u x) *
      (scalarCurv (conformalMetric g u) x * f x ^ 2 - 6 * f x *
        laplacian (LeviCivita (conformalMetric g u)) (conformalMetric g u) f x) =
    scalarCurv g x * (Real.exp (u x) * f x) ^ 2 - 6 * (Real.exp (u x) * f x) *
      laplacian (LeviCivita g) g (fun y => Real.exp (u y) * f y) x
  rw [scalarCurv_conformalMetric, laplacian_conformalMetric g u hf, laplacian_exp_mul _ _ hu hf, d]
  norm_num
  let Gu := g.inner x (gradientFun g u x) (gradientFun g u x)
  let Guf := g.inner x (gradientFun g u x) (gradientFun g f x)
  let Lu := laplacian (LeviCivita g) g u x
  let Lf := laplacian (LeviCivita g) g f x
  change Real.exp (4 * u x) *
      (Real.exp (-(2 * u x)) * (scalarCurv g x - 6 * Lu - 6 * Gu) * f x ^ 2 -
        6 * f x * (Real.exp (-(2 * u x)) * (Lf + 2 * Guf))) =
    scalarCurv g x * (Real.exp (u x) * f x) ^ 2 - 6 * (Real.exp (u x) * f x) *
      (Real.exp (u x) * (Lf + 2 * Guf + (Lu + Gu) * f x))
  have hExp : Real.exp (4 * u x) * Real.exp (-(2 * u x)) = Real.exp (u x) ^ 2 := by
    rw [← Real.exp_add, show 4 * u x + -(2 * u x) = u x + u x by ring, Real.exp_add, pow_two]
  calc
    _ = (Real.exp (4 * u x) * Real.exp (-(2 * u x))) *
        ((scalarCurv g x - 6 * Lu - 6 * Gu) * f x ^ 2 - 6 * f x * (Lf + 2 * Guf)) := by ring
    _ = _ := by rw [hExp]; ring

omit [I.Boundaryless] in
/-- The same transformation preserves the fourth-power mass. -/
theorem capFactorVolume_conformal (d : Module.finrank ℝ E = 4)
    (g : SmoothRiemannianMetric I M) (u f : C^∞⟮I, M; ℝ⟯) :
    capFactorVolume (conformalMetric g u) f = capFactorVolume g (capExpFactor u * f) := by
  unfold capFactorVolume
  rw [integral_conformalMetric_eq_integral_smul_exp]
  apply integral_congr_ae
  filter_upwards [] with x
  change Real.exp ((Module.finrank ℝ E : ℝ) * u x) * f x ^ 4 =
    (Real.exp (u x) * f x) ^ 4
  rw [mul_pow, ← Real.exp_nat_mul, d]

omit [FiniteDimensional ℝ E] [IsManifold I ∞ M] [I.Boundaryless] [T2Space M] [CompactSpace M] in
/-- A smooth positive change of background preserves the compact support
used in the marked isometry. -/
theorem tsupport_capExpFactor_mul (u f : C^∞⟮I, M; ℝ⟯) :
    tsupport (capExpFactor u * f : C^∞⟮I, M; ℝ⟯) = tsupport f := by
  apply congrArg closure
  ext x
  change Real.exp (u x) * f x ≠ 0 ↔ f x ≠ 0
  simp [Real.exp_ne_zero]

omit [J.Boundaryless] in
private theorem markedIntegral_eq
    (g : SmoothRiemannianMetric I M) (q : SmoothRiemannianMetric J X)
    (mark : PartialDiffeomorph I J M X ∞)
    (hIsometry : ∀ x ∈ mark.source, ∀ v w : TangentSpace I x,
      g.inner x v w = q.inner (mark x) (mfderiv I J mark x v) (mfderiv I J mark x w))
    (a : M → ℝ) (b : X → ℝ) (ha : Continuous a)
    (haZero : EqOn a 0 mark.sourceᶜ) (hbZero : EqOn b 0 mark.targetᶜ)
    (hPatch : EqOn a (b ∘ mark) mark.source) :
    (∫ x, a x ∂riemannianVolumeMeasure I M g) = ∫ y, b y ∂riemannianVolumeMeasure J X q := by
  let μ := riemannianVolumeMeasure I M g
  let ν := riemannianVolumeMeasure J X q
  have hv : μ.restrict mark.source = Measure.map mark.symm (ν.restrict mark.target) :=
    riemannianVolumeMeasure_partialIsometry g q
      (DifferentialGeometry.PartialDiffeomorph.ofLE mark (by simp)) hIsometry
  have hMeas : AEMeasurable mark.symm (ν.restrict mark.target) :=
    mark.contMDiffOn_invFun.continuousOn.aemeasurable mark.open_target.measurableSet
  have hRestrictM : (∫ x in mark.source, a x ∂μ) = ∫ x, a x ∂μ := by
    calc
      _ = ∫ x in univ, a x ∂μ :=
        (setIntegral_eq_of_subset_of_forall_sdiff_eq_zero (s := mark.source) MeasurableSet.univ
          (subset_univ _) (fun x hx => haZero hx.2)).symm
      _ = _ := setIntegral_univ
  have hRestrictX : (∫ y in mark.target, b y ∂ν) = ∫ y, b y ∂ν := by
    calc
      _ = ∫ y in univ, b y ∂ν :=
        (setIntegral_eq_of_subset_of_forall_sdiff_eq_zero (s := mark.target) MeasurableSet.univ
          (subset_univ _) (fun y hy => hbZero hy.2)).symm
      _ = _ := setIntegral_univ
  change (∫ x, a x ∂μ) = ∫ y, b y ∂ν
  rw [← hRestrictM, hv, integral_map hMeas ha.aestronglyMeasurable, ← hRestrictX]
  apply setIntegral_congr_fun mark.open_target.measurableSet
  intro y hy
  exact (hPatch (mark.map_target' hy)).trans (congrArg b (mark.right_inv' hy))

/-- A smooth nonnegative test supported strictly inside the marked open
comparison gives an actual global smooth nonnegative test on the joined
source. Its support, scalar numerator and fourth-power mass are exact. -/
theorem exists_markedCoreTestTransplant
    (g : SmoothRiemannianMetric I M) (q : SmoothRiemannianMetric J X)
    (mark : PartialDiffeomorph I J M X ∞)
    (hIsometry : ∀ x ∈ mark.source, ∀ v w : TangentSpace I x,
      g.inner x v w = q.inner (mark x) (mfderiv I J mark x v) (mfderiv I J mark x w))
    (k : C^∞⟮J, X; ℝ⟯) (hk : ∀ y, 0 ≤ k y) (hSupport : tsupport k ⊆ mark.target) :
    ∃ f : C^∞⟮I, M; ℝ⟯, (∀ x, 0 ≤ f x) ∧ EqOn f (k ∘ mark) mark.source ∧
      EqOn f 0 mark.sourceᶜ ∧ tsupport f = mark.symm '' tsupport k ∧
      capFactorScalar g f = capFactorScalar q k ∧ capFactorVolume g f = capFactorVolume q k := by
  obtain ⟨f₀, hf₀, _, hPatch, hs, _, hZero⟩ :=
    mark.exists_contMDiff_extension_of_hasCompactSupport k.contMDiff.contMDiffOn
      (HasCompactSupport.of_compactSpace _) hSupport
  let f : C^∞⟮I, M; ℝ⟯ := ⟨f₀, hf₀⟩
  have hNonneg (x : M) : 0 ≤ f x := by
    by_cases hx : x ∈ mark.source
    · rw [show f x = k (mark x) from hPatch hx]
      exact hk _
    · rw [show f x = 0 from hZero hx]
  have hKZero : EqOn k 0 mark.targetᶜ := fun y hy =>
    image_eq_zero_of_notMem_tsupport (fun hs => hy (hSupport hs))
  refine ⟨f, hNonneg, hPatch, hZero, hs, ?_, ?_⟩
  · unfold capFactorScalar
    let U : TopologicalSpace.Opens M := ⟨mark.source, mark.open_source⟩
    apply markedIntegral_eq g q mark hIsometry
    · exact ((scalarCurv_contMDiff g).continuous.mul (f.contMDiff.continuous.pow 2)).sub
        ((continuous_const.mul f.contMDiff.continuous).mul
          (contMDiff_laplacian_leviCivita g f.contMDiff).continuous)
    · intro x hx
      have hz : f x = 0 := hZero hx
      simp [hz]
    · intro y hy
      simp [hKZero hy]
    · intro x hx
      have hgerm : (f : M → ℝ) =ᶠ[𝓝 x] k ∘ mark :=
        hPatch.eventuallyEq_of_mem (mark.open_source.mem_nhds hx)
      have hMark := mark.contMDiffOn_toFun.contMDiffAt (mark.open_source.mem_nhds hx)
      have hkMark : ContMDiffAt I 𝓘(ℝ, ℝ) ∞ (k ∘ mark) x :=
        k.contMDiff.contMDiffAt.comp x hMark
      have hIsoGerm : ∀ᶠ y in 𝓝 x, ∀ v w : TangentSpace I y,
          g.inner y v w = q.inner (mark y) (mfderiv I J mark y v) (mfderiv I J mark y w) := by
        filter_upwards [mark.open_source.mem_nhds hx] with y hy
        exact hIsometry y hy
      have hLap₁ := laplacian_congr_of_eventuallyEq (LeviCivita g) g
        f.contMDiff.contMDiffAt hkMark hgerm
      have hLap₂ := laplacian_eq_of_partialDiffeomorph_inner g q mark hx hIsoGerm
        (k.contMDiff.contMDiffAt.of_le (by simp))
      have hSc := metricScalarAt_eq_of_partialDiffeomorph_inner g q mark U
        (Subset.refl mark.source) hIsometry hx
      rw [metricScalar_eq_scal, metricScalar_eq_scal] at hSc
      change scalarCurv g x * f x ^ 2 - 6 * f x * laplacian (LeviCivita g) g f x =
        scalarCurv q (mark x) * k (mark x) ^ 2 -
          6 * k (mark x) * laplacian (LeviCivita q) q k (mark x)
      rw [hSc, show f x = k (mark x) from hPatch hx, hLap₁.trans hLap₂]
  · unfold capFactorVolume
    apply markedIntegral_eq g q mark hIsometry _ _ (f.contMDiff.continuous.pow 4)
    · intro x hx
      have hz : f x = 0 := hZero hx
      simp [hz]
    · intro y hy
      simp [hKZero hy]
    · exact fun x hx => congrArg (fun t : ℝ => t ^ 4) (hPatch hx)

/-- For a conformally compactified target, first change the test by its
positive background factor on the retained support, then extend by zero
through the actual marked isometry to the physical metric. -/
theorem exists_conformalMarkedCoreTestTransplant
    (dX : Module.finrank ℝ F = 4)
    (g : SmoothRiemannianMetric I M) (q : SmoothRiemannianMetric J X)
    (mark : PartialDiffeomorph I J M X ∞)
    (hIsometry : ∀ x ∈ mark.source, ∀ v w : TangentSpace I x,
      g.inner x v w = q.inner (mark x) (mfderiv I J mark x v) (mfderiv I J mark x w))
    (u k : C^∞⟮J, X; ℝ⟯) (hk : ∀ y, 0 ≤ k y) (hSupport : tsupport k ⊆ mark.target) :
    ∃ f : C^∞⟮I, M; ℝ⟯, (∀ x, 0 ≤ f x) ∧
      EqOn f ((capExpFactor u * k : C^∞⟮J, X; ℝ⟯) ∘ mark) mark.source ∧
      EqOn f 0 mark.sourceᶜ ∧ tsupport f = mark.symm '' tsupport k ∧
      capFactorScalar g f = capFactorScalar (conformalMetric q u) k ∧
      capFactorVolume g f = capFactorVolume (conformalMetric q u) k := by
  let w := capExpFactor u * k
  have hn (y : X) : 0 ≤ w y := mul_nonneg (Real.exp_pos _).le (hk y)
  have hs : tsupport w = tsupport k := tsupport_capExpFactor_mul u k
  obtain ⟨f, hf, hPatch, hZero, hSupp, hScalar, hVolume⟩ :=
    exists_markedCoreTestTransplant g q mark hIsometry w hn (hs.symm ▸ hSupport)
  exact ⟨f, hf, hPatch, hZero, hSupp.trans (congrArg (fun A => mark.symm '' A) hs),
    hScalar.trans (capFactorScalar_conformal dX q u k).symm,
    hVolume.trans (capFactorVolume_conformal dX q u k).symm⟩

/-- A fixed cap may be compared through a different open marked isometry
for each compact truncation. From approximations on that patch this
constructs the genuine sequence of joined log-conformal tests. -/
theorem hasJoinedCapTests_of_markedCoreTransplants
    (dM : Module.finrank ℝ E = 4) (dX : Module.finrank ℝ F = 4)
    (joined : P → SmoothRiemannianMetric I M) (cap : SmoothRiemannianMetric J X)
    (hTruncated : ∀ (u : C^∞⟮J, X; ℝ⟯) (ε : ℝ), 0 < ε →
      ∃ (t : P) (q : SmoothRiemannianMetric J X) (mark : PartialDiffeomorph I J M X ∞)
        (w : C^∞⟮J, X; ℝ⟯), (∀ y, 0 ≤ w y) ∧ tsupport w ⊆ mark.target ∧
        (∀ x ∈ mark.source, ∀ v z : TangentSpace I x,
          (joined t).inner x v z =
            q.inner (mark x) (mfderiv I J mark x v) (mfderiv I J mark x z)) ∧
        |capFactorScalar q w - capFactorScalar cap (capExpFactor u)| < ε ∧
        |capFactorVolume q w - capFactorVolume cap (capExpFactor u)| < ε) :
    HasJoinedCapTests joined cap := by
  apply hasJoinedCapTests_of_transplantedFactors dM dX joined cap
  intro u ε hε
  obtain ⟨t, q, mark, w, hw, hs, hIso, hScalar, hVolume⟩ := hTruncated u ε hε
  obtain ⟨f, hf, _, _, _, hEqS, hEqV⟩ := exists_markedCoreTestTransplant (joined t) q mark hIso w hw hs
  exact ⟨t, f, hf, hEqS.symm ▸ hScalar, hEqV.symm ▸ hVolume⟩

end SmoothPoincare
