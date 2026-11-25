import FirstOrderTwistor.SpinBochnerCutoff
import Mathlib.MeasureTheory.Function.LocallyIntegrable
import Mathlib.MeasureTheory.Integral.Bochner.Basic

/-!
# The regularized Bochner estimate on a measured spin patch

FOT-E18q, 25 November 2026, prepared for Edward B. Baker III with OpenAI
Codex assistance. Serving model and effort are unavailable. Checkout `5ff7014`.

For MATCH-E11 (3)–(5), the compact-support twisted estimate is applied to
each `u ∇ψₐ` in the same measured metric. The first-jet cutoff estimate is
intrinsic when evaluated in supplied normal orthonormal coordinates. The
covector-twisted energy inequality and the tensor product rules are inputs.
-/

open Filter MeasureTheory
open scoped Topology

namespace FirstOrderTwistor

/-- Local normal-gauge data for the intrinsic first derivatives. The underlying
chart family takes values in the real Hilbert direct sum of spinor fibers.
The frame sum controls its chart derivative in this normal gauge. -/
def SpinNormalCutoffJet (H : Type*) [NormedAddCommGroup H] [InnerProductSpace ℝ H]
    (cutoff mass gradientSq cutoffGradient : ℝ) (normalizedGradient : ℝ → ℝ) : Prop :=
  ∃ (χ : EuclideanSpace ℝ (Fin 4) → ℝ) (Ψ : EuclideanSpace ℝ (Fin 4) → H),
    DifferentiableAt ℝ χ 0 ∧ DifferentiableAt ℝ Ψ 0 ∧ χ 0 = cutoff ∧
    ‖Ψ 0‖ ^ 2 = mass ∧ ‖fderiv ℝ χ 0‖ = cutoffGradient ∧
    (∑ i, ‖fderiv ℝ Ψ 0 (EuclideanSpace.basisFun (Fin 4) ℝ i)‖ ^ 2) ≤ gradientSq ∧
    ∀ ε > 0, ‖fderiv ℝ (fun y => χ y / Real.sqrt (‖Ψ y‖ ^ 2 + ε)) 0‖ = normalizedGradient ε

/-- The cutoff inequality follows from actual Fréchet derivatives in the
normal frame, including where every member of the family vanishes. -/
theorem SpinNormalCutoffJet.bound {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℝ H]
    {χ S Q dχ : ℝ} {du : ℝ → ℝ} (h : SpinNormalCutoffJet H χ S Q dχ du)
    {ε : ℝ} (hε : 0 < ε) :
    (du ε) ^ 2 * Q ≤ 2 * dχ ^ 2 * (Q / (S + ε)) + 2 * χ ^ 2 * (Q / (S + ε)) ^ 2 := by
  obtain ⟨χLocal, ΨLocal, hχ, hΨ, hValue, hMass, hDerivative, hGradient, hNormalized⟩ := h
  have hOp := (spinOpNormSq_le_frameSum (EuclideanSpace.basisFun (Fin 4) ℝ)
    (fderiv ℝ ΨLocal 0)).trans hGradient
  have hBound := normalizedSpinCutoff_fderiv_bound hχ hΨ hε hOp
  dsimp only at hBound
  simpa only [hNormalized ε hε, hDerivative, hMass, hValue] using hBound

private theorem sqNorm_add_le {F : Type*} [NormedAddCommGroup F] (a b : F) :
    ‖a + b‖ ^ 2 ≤ 2 * ‖a‖ ^ 2 + 2 * ‖b‖ ^ 2 :=
  (pow_le_pow_left₀ (norm_nonneg _) (norm_add_le _ _) 2).trans
    (by nlinarith [sq_nonneg (‖a‖ - ‖b‖)])

private theorem sqNorm_sub_le {F : Type*} [NormedAddCommGroup F] (a b : F) :
    ‖a - b‖ ^ 2 ≤ 2 * ‖a‖ ^ 2 + 2 * ‖b‖ ^ 2 := by
  simpa only [sub_eq_add_neg, norm_neg] using sqNorm_add_le a (-b)

private theorem integral_add_scale {X : Type*} [MeasurableSpace X] {ν : Measure X}
    {F G : X → ℝ} (hF : Integrable F ν) (hG : Integrable G ν) (a b : ℝ) :
    (∫ x, a * F x + b * G x ∂ν) = a * (∫ x, F x ∂ν) + b * ∫ x, G x ∂ν := by
  have hAdd := integral_add (hF.const_mul a) (hG.const_mul b)
  simpa only [Pi.add_apply, integral_const_mul] using hAdd

/-- Integration of the two product estimates and the unweighted energy
inequality. The Ricci input is `R = u² |Ric|² |ψ|²`, prior to the factor `1/4`
in the twisted Dirac norm. -/
private theorem weightedSpinEnergy {X : Type*} [MeasurableSpace X] (ν : Measure X)
    {H A D R M N : X → ℝ} {K : ℝ}
    (hH : Integrable H ν) (hA : Integrable A ν) (hD : Integrable D ν)
    (hR : Integrable R ν) (hN : Integrable N ν)
    (hCov : ∀ᵐ x ∂ν, H x ≤ 2 * A x + 2 * N x)
    (hDir : ∀ᵐ x ∂ν, D x ≤ (1 / 2 : ℝ) * R x + 2 * N x)
    (hEnergy : (∫ x, A x ∂ν) ≤ (∫ x, D x ∂ν) + K * ∫ x, M x ∂ν) :
    (∫ x, H x ∂ν) ≤ (∫ x, R x ∂ν) + 2 * K * (∫ x, M x ∂ν) + 6 * ∫ x, N x ∂ν := by
  have h₁ := integral_mono_ae hH ((hA.const_mul 2).add (hN.const_mul 2)) hCov
  have h₂ := integral_mono_ae hD ((hR.const_mul (1 / 2)).add (hN.const_mul 2)) hDir
  simp only [Pi.add_apply] at h₁ h₂
  rw [integral_add_scale hA hN] at h₁
  rw [integral_add_scale hR hN] at h₂
  linarith only [h₁, h₂, hEnergy]

section Compact

variable {X : Type*} [TopologicalSpace X] [MeasurableSpace X] [BorelSpace X]
  {ν : Measure X} [IsFiniteMeasureOnCompacts ν]

private theorem integrable_cutoffSq_mul {χ g : X → ℝ} (hχ : Continuous χ)
    (hSupp : HasCompactSupport χ) (hg : Continuous g) :
    Integrable (fun x => χ x ^ 2 * g x) ν := by
  have hsq : HasCompactSupport (fun x => χ x ^ 2) :=
    hSupp.comp_left (g := fun r : ℝ => r ^ 2) (by simp)
  exact ((hχ.pow 2).mul hg).integrable_of_hasCompactSupport hsq.mul_right

end Compact

/-- Applying a compact cutoff to a finite harmonic family gives the regularized
hypothesis of `spinRelativeBochner_bound`. The measure is the one in the
chosen patch. Each `q a` represents `∇ψₐ`, and `covariant` and `twistedDirac`
are for the same covector-spin connection. Their cutoff product rules are
supplied with the exact norm of the two product terms. `hEnergy` is the
unweighted estimate on the tests `u q a` and is called only after proving
their support and the integrability of their three energy densities. -/
theorem spinRegularizedEstimate_of_unweighted
    {X ι H V G T : Type*} [TopologicalSpace X] [MeasurableSpace X] [BorelSpace X]
    [Fintype ι] [NormedAddCommGroup H] [InnerProductSpace ℝ H]
    [NormedAddCommGroup V] [NormedSpace ℝ V]
    [NormedAddCommGroup G] [NormedSpace ℝ G] [NormedAddCommGroup T] [NormedSpace ℝ T]
    (ν : Measure X) [IsFiniteMeasureOnCompacts ν]
    (χ cutoffGradient weyl ricci curvature : X → ℝ) (du : ℝ → X → ℝ)
    (ψ : ι → X → H) (q : ι → X → V)
    (covariant : (X → V) → X → G) (twistedDirac : (X → V) → X → T)
    (hχ : Continuous χ) (hχSupp : HasCompactSupport χ)
    (hdχ : Continuous cutoffGradient) (hdχSupp : HasCompactSupport cutoffGradient)
    (hW : Continuous weyl) (hR : Continuous ricci) (hM : Continuous curvature)
    (hMnonneg : 0 ≤ᵐ[ν] curvature)
    (hψ : ∀ a, Continuous (fun x => ‖ψ a x‖))
    (hq : ∀ a, Continuous (fun x => ‖q a x‖))
    (hHessian : ∀ a, Continuous (fun x => ‖covariant (q a) x‖))
    {K : ℝ} (hK : 0 ≤ K) :
    let S (x : X) := ∑ a, ‖ψ a x‖ ^ 2
    let Q (x : X) := ∑ a, ‖q a x‖ ^ 2
    let u (ε : ℝ) (x : X) := χ x / Real.sqrt (S x + ε)
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
    (∀ ε > 0, ∀ a, HasCompactSupport (U ε a) →
      Integrable (fun x => ‖covariant (U ε a) x‖ ^ 2) ν →
      Integrable (fun x => ‖twistedDirac (U ε a) x‖ ^ 2) ν →
      Integrable (fun x => curvature x * ‖U ε a x‖ ^ 2) ν →
      (∫ x, ‖covariant (U ε a) x‖ ^ 2 ∂ν) ≤
        (∫ x, ‖twistedDirac (U ε a) x‖ ^ 2 ∂ν) +
        K * ∫ x, curvature x * ‖U ε a x‖ ^ 2 ∂ν) →
    ∀ ε > 0,
      (∫ x, χ x ^ 2 * weyl x ^ 2 * (S x / (S x + ε)) ∂ν) ≤
        (48 + 8 * K) * ∫ x, χ x ^ 2 * ricci x ^ 2 * (S x / (S x + ε)) +
          χ x ^ 2 * curvature x * (Q x / (S x + ε)) +
          χ x ^ 2 * (Q x / (S x + ε)) ^ 2 +
          cutoffGradient x ^ 2 * (Q x / (S x + ε)) ∂ν := by
  intro S Q u U hNormal hProjection hRicci hMeas hProduct hEnergy ε hε
  classical
  have hS : Continuous S := continuous_finsetSum _ fun a _ => (hψ a).pow 2
  have hQ : Continuous Q := continuous_finsetSum _ fun a _ => (hq a).pow 2
  have hSnonneg (x : X) : 0 ≤ S x := Finset.sum_nonneg fun _ _ => sq_nonneg _
  have hQnonneg (x : X) : 0 ≤ Q x := Finset.sum_nonneg fun _ _ => sq_nonneg _
  have hDen (x : X) : 0 < S x + ε := add_pos_of_nonneg_of_pos (hSnonneg x) hε
  have hu : Continuous (u ε) := hχ.div (Real.continuous_sqrt.comp (hS.add continuous_const))
    (fun x => (Real.sqrt_pos.2 (hDen x)).ne')
  have huSupp : HasCompactSupport (u ε) := by
    have hu' : u ε = χ * (fun x => (Real.sqrt (S x + ε))⁻¹) := by
      funext x
      exact div_eq_mul_inv _ _
    rw [hu']
    exact hχSupp.mul_right
  have huSq (x : X) : u ε x ^ 2 = χ x ^ 2 / (S x + ε) := by
    dsimp only [u]
    rw [div_pow, Real.sq_sqrt (hDen x).le]
  let relative (x : X) := Q x / (S x + ε)
  have hRelative : Continuous relative := hQ.div (hS.add continuous_const) (fun x => (hDen x).ne')
  let cutoffCost (x : X) := cutoffGradient x ^ 2 * relative x
  let relativeCost (x : X) := χ x ^ 2 * relative x ^ 2
  have hCutoffCost : Integrable cutoffCost ν := integrable_cutoffSq_mul hdχ hdχSupp hRelative
  have hRelativeCost : Integrable relativeCost ν := integrable_cutoffSq_mul hχ hχSupp (hRelative.pow 2)
  let noise (x : X) := du ε x ^ 2 * Q x
  have hNoiseBound : ∀ᵐ x ∂ν, noise x ≤ 2 * cutoffCost x + 2 * relativeCost x := by
    filter_upwards [hNormal] with x hx
    dsimp only [noise, cutoffCost, relativeCost, relative]
    calc
      _ ≤ 2 * cutoffGradient x ^ 2 * (Q x / (S x + ε)) +
          2 * χ x ^ 2 * (Q x / (S x + ε)) ^ 2 := hx.bound hε
      _ = _ := by ring
  obtain ⟨hdu, hWeightedMeas⟩ := hMeas ε hε
  have hNoise : Integrable noise ν := Integrable.mono_nonneg
    ((hCutoffCost.const_mul 2).add (hRelativeCost.const_mul 2))
    (((hdu.pow_const 2).mul hQ.measurable.aemeasurable).aestronglyMeasurable)
    (ae_of_all ν (fun x => mul_nonneg (sq_nonneg _) (hQnonneg x))) hNoiseBound
  let H₀ (a : ι) (x : X) := u ε x ^ 2 * ‖covariant (q a) x‖ ^ 2
  let A (a : ι) (x : X) := ‖covariant (U ε a) x‖ ^ 2
  let D (a : ι) (x : X) := ‖twistedDirac (U ε a) x‖ ^ 2
  let R (a : ι) (x : X) := u ε x ^ 2 * (ricci x ^ 2 * ‖ψ a x‖ ^ 2)
  let M (a : ι) (x : X) := u ε x ^ 2 * (curvature x * ‖q a x‖ ^ 2)
  let N (a : ι) (x : X) := du ε x ^ 2 * ‖q a x‖ ^ 2
  have hH₀ (a : ι) : Integrable (H₀ a) ν := integrable_cutoffSq_mul hu huSupp ((hHessian a).pow 2)
  have hRa (a : ι) : Integrable (R a) ν :=
    integrable_cutoffSq_mul hu huSupp ((hR.pow 2).mul ((hψ a).pow 2))
  have hMa (a : ι) : Integrable (M a) ν :=
    integrable_cutoffSq_mul hu huSupp (hM.mul ((hq a).pow 2))
  have hNa (a : ι) : Integrable (N a) ν := by
    apply Integrable.mono_nonneg hNoise
      (((hdu.pow_const 2).mul ((hq a).pow 2).measurable.aemeasurable).aestronglyMeasurable)
      (ae_of_all ν (fun _ => mul_nonneg (sq_nonneg _) (sq_nonneg _)))
    exact ae_of_all ν fun x => mul_le_mul_of_nonneg_left
      (Finset.single_le_sum (fun i _ => sq_nonneg ‖q i x‖) (Finset.mem_univ a)) (sq_nonneg _)
  have hProductBounds (a : ι) : ∀ᵐ x ∂ν,
      H₀ a x ≤ 2 * A a x + 2 * N a x ∧
      A a x ≤ 2 * H₀ a x + 2 * N a x ∧ D a x ≤ (1 / 2 : ℝ) * R a x + 2 * N a x := by
    filter_upwards [hProduct ε hε a, hRicci a] with x hp hr
    obtain ⟨eCov, eDirac, hc, hd, hce, hde⟩ := hp
    have hRecover := (eq_sub_iff_add_eq).2 hc.symm
    have hc₁ := sqNorm_sub_le (covariant (U ε a) x) eCov
    rw [← hRecover, norm_smul, Real.norm_eq_abs, mul_pow, sq_abs, hce] at hc₁
    have hc₂ := sqNorm_add_le (u ε x • covariant (q a) x) eCov
    rw [← hc, norm_smul, Real.norm_eq_abs, mul_pow, sq_abs, hce] at hc₂
    have hd' := sqNorm_add_le (u ε x • twistedDirac (q a) x) eDirac
    rw [← hd, norm_smul, Real.norm_eq_abs, mul_pow, sq_abs, hr, hde] at hd'
    refine ⟨hc₁, hc₂, ?_⟩
    dsimp only [D, R, N]
    calc
      _ ≤ 2 * (u ε x ^ 2 * ((1 / 4 : ℝ) * ricci x ^ 2 * ‖ψ a x‖ ^ 2)) +
          2 * (du ε x ^ 2 * ‖q a x‖ ^ 2) := hd'
      _ = _ := by ring
  have hAa (a : ι) : Integrable (A a) ν :=
    Integrable.mono_nonneg (((hH₀ a).const_mul 2).add ((hNa a).const_mul 2))
      (hWeightedMeas a).1.aestronglyMeasurable (ae_of_all ν fun _ => sq_nonneg _)
      ((hProductBounds a).mono fun _ hx => hx.2.1)
  have hDa (a : ι) : Integrable (D a) ν :=
    Integrable.mono_nonneg (((hRa a).const_mul (1 / 2)).add ((hNa a).const_mul 2))
      (hWeightedMeas a).2.aestronglyMeasurable (ae_of_all ν fun _ => sq_nonneg _)
      ((hProductBounds a).mono fun _ hx => hx.2.2)
  have hMassWeight (a : ι) (x : X) : curvature x * ‖U ε a x‖ ^ 2 = M a x := by
    change curvature x * ‖u ε x • q a x‖ ^ 2 = _
    rw [norm_smul, Real.norm_eq_abs, mul_pow, sq_abs]
    dsimp only [M]
    ring
  have hLocalEnergy (a : ι) :
      (∫ x, H₀ a x ∂ν) ≤ (∫ x, R a x ∂ν) + 2 * K * (∫ x, M a x ∂ν) + 6 * ∫ x, N a x ∂ν := by
    apply weightedSpinEnergy ν (hH₀ a) (hAa a) (hDa a) (hRa a) (hNa a)
      ((hProductBounds a).mono fun _ hx => hx.1) ((hProductBounds a).mono fun _ hx => hx.2.2)
    have hBochner := hEnergy ε hε a (HasCompactSupport.smul_right huSupp) (hAa a) (hDa a)
      ((hMa a).congr (ae_of_all ν fun x => (hMassWeight a x).symm))
    simpa only [A, D, hMassWeight] using hBochner
  have hSumH : Integrable (fun x => ∑ a, H₀ a x) ν := integrable_finsetSum _ (fun a _ => hH₀ a)
  have hTotalEnergy : (∫ x, ∑ a, H₀ a x ∂ν) ≤
      (∫ x, ∑ a, R a x ∂ν) + 2 * K * (∫ x, ∑ a, M a x ∂ν) + 6 * ∫ x, ∑ a, N a x ∂ν := by
    rw [integral_finsetSum _ (fun a _ => hH₀ a), integral_finsetSum _ (fun a _ => hRa a),
      integral_finsetSum _ (fun a _ => hMa a), integral_finsetSum _ (fun a _ => hNa a),
      Finset.mul_sum, Finset.mul_sum, ← Finset.sum_add_distrib, ← Finset.sum_add_distrib]
    exact Finset.sum_le_sum fun a _ => hLocalEnergy a
  have hTwistor : Integrable (fun x => u ε x ^ 2 * (weyl x ^ 2 * S x)) ν :=
    integrable_cutoffSq_mul hu huSupp ((hW.pow 2).mul hS)
  have hProjectEnergy : (∫ x, u ε x ^ 2 * (weyl x ^ 2 * S x) ∂ν) ≤ 4 * (∫ x, ∑ a, H₀ a x ∂ν) := by
    rw [← integral_const_mul]
    apply integral_mono_ae hTwistor (hSumH.const_mul 4)
    filter_upwards [hProjection] with x hx
    dsimp only [H₀]
    rw [← Finset.mul_sum]
    calc
      _ ≤ u ε x ^ 2 * (4 * ∑ a, ‖covariant (q a) x‖ ^ 2) :=
        mul_le_mul_of_nonneg_left hx (sq_nonneg (u ε x))
      _ = _ := by ring
  have hNoiseIntegrals : (∫ x, noise x ∂ν) ≤ 2 * (∫ x, cutoffCost x ∂ν) + 2 * (∫ x, relativeCost x ∂ν) := by
    rw [← integral_add_scale hCutoffCost hRelativeCost]
    exact integral_mono_ae hNoise ((hCutoffCost.const_mul 2).add (hRelativeCost.const_mul 2)) hNoiseBound
  let ricciCost (x : X) := χ x ^ 2 * ricci x ^ 2 * (S x / (S x + ε))
  let mixedCost (x : X) := χ x ^ 2 * curvature x * relative x
  have hSumR (x : X) : (∑ a, R a x) = ricciCost x := by
    dsimp only [R]
    rw [← Finset.mul_sum, ← Finset.mul_sum, huSq]
    change (χ x ^ 2 / (S x + ε)) * (ricci x ^ 2 * S x) = ricciCost x
    dsimp only [ricciCost]
    ring
  have hSumM (x : X) : (∑ a, M a x) = mixedCost x := by
    dsimp only [M]
    rw [← Finset.mul_sum, ← Finset.mul_sum, huSq]
    change (χ x ^ 2 / (S x + ε)) * (curvature x * Q x) = mixedCost x
    dsimp only [mixedCost, relative]
    ring
  have hSumN (x : X) : (∑ a, N a x) = noise x := by
    dsimp only [noise, Q, N]
    rw [Finset.mul_sum]
  have hWeylEq (x : X) : u ε x ^ 2 * (weyl x ^ 2 * S x) =
      χ x ^ 2 * weyl x ^ 2 * (S x / (S x + ε)) := by rw [huSq]; ring
  simp only [hSumR, hSumM, hSumN] at hTotalEnergy
  simp only [hWeylEq] at hProjectEnergy
  have hRicciCost : Integrable ricciCost ν :=
    (integrable_finsetSum _ (fun a _ => hRa a)).congr (ae_of_all ν hSumR)
  have hMixedCost : Integrable mixedCost ν :=
    (integrable_finsetSum _ (fun a _ => hMa a)).congr (ae_of_all ν hSumM)
  have hRnonneg : 0 ≤ ∫ x, ricciCost x ∂ν := by
    apply integral_nonneg
    intro x
    exact mul_nonneg (mul_nonneg (sq_nonneg _) (sq_nonneg _)) (div_nonneg (hSnonneg x) (hDen x).le)
  have hMnonneg' : 0 ≤ ∫ x, mixedCost x ∂ν := by
    apply integral_nonneg_of_ae
    filter_upwards [hMnonneg] with x hx
    exact mul_nonneg (mul_nonneg (sq_nonneg _) hx) (div_nonneg (hQnonneg x) (hDen x).le)
  have hVnonneg : 0 ≤ ∫ x, relativeCost x ∂ν := integral_nonneg fun _ => mul_nonneg (sq_nonneg _) (sq_nonneg _)
  have hCnonneg : 0 ≤ ∫ x, cutoffCost x ∂ν :=
    integral_nonneg fun x => mul_nonneg (sq_nonneg _) (div_nonneg (hQnonneg x) (hDen x).le)
  change (∫ x, χ x ^ 2 * weyl x ^ 2 * (S x / (S x + ε)) ∂ν) ≤
    (48 + 8 * K) * ∫ x, ricciCost x + mixedCost x + relativeCost x + cutoffCost x ∂ν
  have hCosts₁ := integral_add hRicciCost hMixedCost
  have hCosts₂ := integral_add (hRicciCost.add hMixedCost) hRelativeCost
  have hCosts₃ := integral_add ((hRicciCost.add hMixedCost).add hRelativeCost) hCutoffCost
  simp only [Pi.add_apply] at hCosts₁ hCosts₂ hCosts₃
  rw [hCosts₃, hCosts₂, hCosts₁]
  nlinarith only [hProjectEnergy, hTotalEnergy, hNoiseIntegrals, hRnonneg, hMnonneg', hVnonneg, hCnonneg,
    mul_nonneg hK hRnonneg, mul_nonneg hK hVnonneg, mul_nonneg hK hCnonneg]

end FirstOrderTwistor
