import SmoothPoincare.Variational.BourConformalTrace
import DifferentialGeometry.Analysis.Integration.WeightedLaplacian

/-! # Harmonic scalar on the complete pointed branch

Prepared for Edward B. Baker III with OpenAI Codex assistance, 26 November 2026.
The cutoff test uses only a compactly supported flux on the original metric.
-/

open DifferentialGeometry DifferentialGeometry.Geometry.Operator
  DifferentialGeometry.Integral.DivergenceTheorem DifferentialGeometry.Integral.Measure
  Filter Set MeasureTheory Bundle
open scoped ContDiff Manifold Topology ENNReal

namespace SmoothPoincare.Bour

noncomputable section

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- A finite-energy harmonic function on a possibly noncompact smooth
manifold. All integration by parts is on the support of the actual cutoff. -/
theorem bourHarmonic_cutoff_energy (g : SmoothRiemannianMetric I M)
    (u η : C^∞⟮I, M; ℝ⟯) (hc : HasCompactSupport (η : M → ℝ))
    (harm : ∀ x, ΔG g u x = 0)
    (hi : Integrable (fun x => u x ^ 2) (riemannianVolumeMeasure I M g))
    {δ : ℝ} (hd : ∀ x, normGradSqFun g η x ≤ δ) :
    (∫ x, η x ^ 2 * normGradSqFun g u x ∂riemannianVolumeMeasure I M g) ≤
      (4*δ) * ∫ x, u x ^ 2 ∂riemannianVolumeMeasure I M g := by
  let μ := riemannianVolumeMeasure I M g
  let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts _
  let V := gradG g u
  let φ : M → ℝ := fun x => η x * η x * u x
  have hφ : ContMDiff I 𝓘(ℝ) ∞ φ := (η.contMDiff.mul η.contMDiff).mul u.contMDiff
  let X := smoothSmul (I := I) φ hφ V
  have hX : HasCompactSupport X := by
    apply HasCompactSupport.of_support_subset_isCompact hc
    intro x hx
    apply subset_tsupport
    contrapose! hx
    apply Function.notMem_support.mpr
    change φ x • V x = 0
    simp [φ, Function.notMem_support.mp hx]
  let d := divergenceG g X
  have hdint : Integrable d μ := (divergence_g_contMDiff g X).continuous.integrable_of_hasCompactSupport
    (hasCompactSupport_divergence_g g hX)
  have hz : (∫ x, d x ∂μ) = 0 := integral_divergence_eq_zero_of_hasCompactSupport g X hX
  have hD (x : M) : d x = η x ^ 2 * normGradSqFun g u x +
      2*η x*u x*g.inner x (gradFun g u x) (gradFun g η x) := by
    dsimp only [d, X]
    rw [divergence_g_smoothSmul g φ hφ V x]
    change φ x * ΔG g u x + tangentSectionAction V (((η : M → ℝ) * η) * u) x = _
    rw [harm, mul_zero, zero_add, tangentSectionAction_mul V (η.contMDiff.mul η.contMDiff) u.contMDiff,
      tangentSectionAction_mul V η.contMDiff η.contMDiff,
      tangentSectionAction_eq_inner_grad_g g η V, tangentSectionAction_eq_inner_grad_g g u V]
    simp only [V, grad_g_apply, normGradSqFun, Pi.mul_apply]
    ring
  have hpt (x : M) : η x ^ 2 * normGradSqFun g u x ≤ 2 * d x + (4*δ)*u x ^ 2 := by
    let v := gradFun g u x
    let w := gradFun g η x
    have hv := metric_inner_self_nonneg g x (η x • v + (2*u x) • w)
    simp only [map_add, add_apply, map_smul, smul_apply, smul_eq_mul] at hv
    rw [g.symm x w v] at hv
    rw [hD]
    change η x ^ 2 * g.inner x v v ≤ 2*(η x ^ 2 * g.inner x v v + 2*η x*u x*g.inner x v w) + _
    have hδ : g.inner x w w ≤ δ := hd x
    nlinarith only [hv, mul_le_mul_of_nonneg_left hδ (sq_nonneg (u x))]
  have hL : Integrable (fun x => η x ^ 2 * normGradSqFun g u x) μ := by
    apply ((η.contMDiff.continuous.pow 2).mul (normGradSqFun_contMDiff g u.contMDiff).continuous
      ).integrable_of_hasCompactSupport
    apply HasCompactSupport.of_support_subset_isCompact hc
    intro x hx
    apply subset_tsupport
    contrapose! hx
    simp [Function.notMem_support.mp hx]
  have h := integral_mono hL ((hdint.const_mul 2).add (hi.const_mul (4*δ))) hpt
  change _ ≤ ∫ x, 2*d x + (4*δ)*u x^2 ∂μ at h
  rw [integral_add (hdint.const_mul 2) (hi.const_mul (4*δ)), integral_const_mul, hz, mul_zero,
    zero_add, integral_const_mul] at h
  exact h

/-- On a connected infinite-volume pointed carrier a square-integrable harmonic
function vanishes. The exhaustion needs only eventual equality to one pointwise
and uniformly vanishing Dirichlet slope. -/
theorem bourPointed_harmonic_L2_zero [ConnectedSpace M] (g : SmoothRiemannianMetric I M)
    (u : C^∞⟮I, M; ℝ⟯) (harm : ∀ x, ΔG g u x = 0)
    (hi : Integrable (fun x => u x ^ 2) (riemannianVolumeMeasure I M g))
    (hvol : riemannianVolumeMeasure I M g univ = ⊤)
    (η : ℕ → C^∞⟮I, M; ℝ⟯) (hc : ∀ n, HasCompactSupport (η n : M → ℝ))
    (hOne : ∀ x, ∀ᶠ n in atTop, η n x = 1)
    (δ : ℕ → ℝ) (ht : Tendsto δ atTop (𝓝 0))
    (hd : ∀ n x, normGradSqFun g (η n) x ≤ δ n) :
    ∀ x, u x = 0 := by
  let μ := riemannianVolumeMeasure I M g
  let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts _
  let : μ.IsOpenPosMeasure := riemannianVolumeMeasure_isOpenPosMeasure _
  let f := normGradSqFun g u
  let F (n : ℕ) (x : M) := (η n x)^2*f x
  have hf : Continuous f := (normGradSqFun_contMDiff g u.contMDiff).continuous
  have hfpos (x : M) : 0 ≤ f x := normGradSqFun_nonneg g u x
  have hF (n : ℕ) : Continuous (F n) := ((η n).contMDiff.continuous.pow 2).mul hf
  have hFp (n : ℕ) (x : M) : 0 ≤ F n x := mul_nonneg (sq_nonneg _) (hfpos x)
  have hFi (n : ℕ) : Integrable (F n) μ := by
    apply (hF n).integrable_of_hasCompactSupport
    apply HasCompactSupport.of_support_subset_isCompact (hc n)
    intro x hx
    apply subset_tsupport
    contrapose! hx
    simp [F, Function.notMem_support.mp hx]
  have hInt : Tendsto (fun n => ∫ x, F n x ∂μ) atTop (𝓝 0) := by
    apply squeeze_zero (fun n => integral_nonneg (hFp n))
      (fun n => bourHarmonic_cutoff_energy g u (η n) (hc n) harm hi (hd n))
    simpa using (ht.const_mul 4).mul_const (∫ x, u x ^ 2 ∂μ)
  let W (n : ℕ) (x : M) := ENNReal.ofReal (F n x)
  have hLim (x : M) : Tendsto (fun n => W n x) atTop (𝓝 (ENNReal.ofReal (f x))) := by
    apply tendsto_const_nhds.congr'
    filter_upwards [hOne x] with n hn
    simp [W, F, hn]
  have hLin (n : ℕ) : ENNReal.ofReal (∫ x, F n x ∂μ) = ∫⁻ x, W n x ∂μ :=
    ofReal_integral_eq_lintegral_ofReal (hFi n) (Eventually.of_forall (hFp n))
  have hLim' : Tendsto (fun n => ∫⁻ x, W n x ∂μ) atTop (𝓝 0) := by
    simp_rw [← hLin]
    simpa [Function.comp_def] using (ENNReal.continuous_ofReal.tendsto (0:ℝ)).comp hInt
  have hFat := lintegral_liminf_le (u := (atTop : Filter ℕ)) (f := W) (μ := μ) (fun n => ENNReal.measurable_ofReal.comp (hF n).measurable)
  change (∫⁻ x, liminf (fun n => W n x) atTop ∂μ) ≤ liminf (fun n => ∫⁻ x, W n x ∂μ) atTop at hFat
  simp_rw [(hLim _).liminf_eq, hLim'.liminf_eq] at hFat
  have hae := (lintegral_eq_zero_iff (ENNReal.measurable_ofReal.comp hf.measurable)).mp (nonpos_iff_eq_zero.mp hFat)
  have hae' : f =ᵐ[μ] (fun _ => 0) := by
    filter_upwards [hae] with x hx
    exact le_antisymm (ENNReal.ofReal_eq_zero.mp hx) (hfpos x)
  have he := Measure.eqOn_open_of_ae_eq (μ := μ) (U := univ)
    (by rw [Measure.restrict_univ]; exact hae') isOpen_univ hf.continuousOn continuous_const.continuousOn
  have hloc := isLocallyConstant_of_mfderiv_eq_zero (u.contMDiff.mdifferentiable (by simp))
    (fun x => normGradSqFun_eq_zero_iff.mp (he (mem_univ x)))
  obtain ⟨c,hc'⟩ := hloc.exists_eq_const
  have hint : Integrable (fun _ : M => c^2) μ := by
    convert hi using 1
    funext x
    rw [show u x = c from congrFun hc' x]
  have hcz : c ^ 2 = 0 := integrable_const_iff.mp hint |>.resolve_right (fun h => by
    have hfin := h.measure_univ_lt_top
    rw [show μ univ = ⊤ from hvol] at hfin
    exact lt_irrefl _ hfin)
  intro x
  rw [show u x = c from congrFun hc' x]
  nlinarith only [hcz]

end
end SmoothPoincare.Bour
