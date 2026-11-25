import FirstOrderTwistor.CylinderDirac
import Mathlib.Analysis.InnerProductSpace.l2Space
import Mathlib.MeasureTheory.Function.L2Space

/-!
# Square-summable cylinder modes and the midpoint floor

Analytic portions of FOT-E22b and E33b for Edward B. Baker III, prepared
2026-11-25 with OpenAI Codex assistance at checkout 5ff7014. The actual
model variant and reasoning effort are unavailable. Inputs are MATCH-E01,
E05 and E09. The round spectral gap and any Hilbert basis on a link are
supplied. A pointwise floor is compared with the slice norms by
integration, using no pointwise orthogonality of the modes.
-/

open scoped BigOperators ENNReal InnerProductSpace
open MeasureTheory

namespace FirstOrderTwistor

private theorem cylinderL2_sqNorm_eq_tsum {ι V : Type*} [NormedAddCommGroup V]
    (coefficients : lp (fun _ : ι => V) 2) :
    ‖coefficients‖ ^ 2 = ∑' i, ‖coefficients i‖ ^ 2 := by
  simpa only [ENNReal.toReal_ofNat, Real.rpow_two] using
    lp.norm_rpow_eq_tsum (by norm_num : 0 < (2 : ℝ≥0∞).toReal) coefficients

private theorem cylinderL2_summable_sqNorm {ι V : Type*} [NormedAddCommGroup V]
    (coefficients : lp (fun _ : ι => V) 2) : Summable (fun i => ‖coefficients i‖ ^ 2) := by
  simpa only [ENNReal.toReal_ofNat, Real.rpow_two] using
    (lp.memℓp coefficients).summable (by norm_num : 0 < (2 : ℝ≥0∞).toReal)

section Propagation

variable {ι V : Type*} [NormedAddCommGroup V]

/-- The total squared incoming norm is the sum of the squared norms
of the two traces when their coefficient supports have opposite signs. -/
theorem roundCylinderIncoming_sqNorm_add (eigenvalue : ι → ℝ)
    (left right : lp (fun _ : ι => V) 2)
    (hleft : ∀ i, eigenvalue i < 0 → left i = 0)
    (hright : ∀ i, 0 ≤ eigenvalue i → right i = 0) :
    ‖left + right‖ ^ 2 = ‖left‖ ^ 2 + ‖right‖ ^ 2 := by
  rw [cylinderL2_sqNorm_eq_tsum, cylinderL2_sqNorm_eq_tsum left,
    cylinderL2_sqNorm_eq_tsum right, ← (cylinderL2_summable_sqNorm left).tsum_add
      (cylinderL2_summable_sqNorm right)]
  apply tsum_congr
  intro i
  rw [lp.coeFn_add, Pi.add_apply]
  by_cases hneg : eigenvalue i < 0
  · simp [hleft i hneg]
  · simp [hright i (le_of_not_gt hneg)]

variable [NormedSpace ℝ V]

/-- Diagonal propagation on the actual square-summable coefficient space.
The incoming coefficient at each eigenvalue comes from the left trace
for a positive mode and from the right trace for a negative mode. The
test time can depend on the mode to allow outgoing evaluation. -/
noncomputable def roundCylinderCoefficients {length : ℝ} (eigenvalue : ι → ℝ)
    (hgap : ∀ i, (3 : ℝ) / 2 ≤ |eigenvalue i|)
    (incoming : lp (fun _ : ι => V) 2) (testTime : ι → ℝ)
    (hleft : ∀ i, 0 ≤ testTime i) (hright : ∀ i, 0 ≤ length - testTime i) :
    lp (fun _ : ι => V) 2 :=
  ⟨fun i => roundCylinderMode length (eigenvalue i) (incoming i) (incoming i) (testTime i), by
    apply (lp.memℓp incoming).mono'
    intro i
    simpa using norm_roundCylinderMode_le (incoming i) (incoming i) (hgap i)
      le_rfl (hleft i) (hright i)⟩

@[simp]
theorem roundCylinderCoefficients_apply {length : ℝ} (eigenvalue : ι → ℝ)
    (hgap : ∀ i, (3 : ℝ) / 2 ≤ |eigenvalue i|)
    (incoming : lp (fun _ : ι => V) 2) (testTime : ι → ℝ)
    (hleft : ∀ i, 0 ≤ testTime i) (hright : ∀ i, 0 ≤ length - testTime i) (i : ι) :
    roundCylinderCoefficients (length := length) eigenvalue hgap incoming testTime hleft hright i =
      roundCylinderMode length (eigenvalue i) (incoming i) (incoming i) (testTime i) := rfl

/-- Interior attenuation, including arbitrary many modes. -/
theorem roundCylinderCoefficients_sqNorm_le {length d : ℝ} (eigenvalue : ι → ℝ)
    (hgap : ∀ i, (3 : ℝ) / 2 ≤ |eigenvalue i|)
    (incoming : lp (fun _ : ι => V) 2) (testTime : ι → ℝ) (hd : 0 ≤ d)
    (hleft : ∀ i, d ≤ testTime i) (hright : ∀ i, d ≤ length - testTime i) :
    ‖roundCylinderCoefficients (length := length) eigenvalue hgap incoming testTime
      (fun i => hd.trans (hleft i)) (fun i => hd.trans (hright i))‖ ^ 2 ≤
        Real.exp (-3 * d) * ‖incoming‖ ^ 2 := by
  let transferred := roundCylinderCoefficients (length := length) eigenvalue hgap incoming testTime
    (fun i => hd.trans (hleft i)) (fun i => hd.trans (hright i))
  change ‖transferred‖ ^ 2 ≤ _
  rw [cylinderL2_sqNorm_eq_tsum, cylinderL2_sqNorm_eq_tsum, ← tsum_mul_left]
  apply (cylinderL2_summable_sqNorm transferred).tsum_le_tsum _ ((cylinderL2_summable_sqNorm incoming).mul_left _)
  intro i
  have hmode : ‖transferred i‖ ≤ Real.exp (-(3 / 2) * d) * ‖incoming i‖ := by
    simpa [transferred] using norm_roundCylinderMode_le (incoming i) (incoming i)
      (hgap i) hd (hleft i) (hright i)
  have hsq : Real.exp (-(3 / 2) * d) ^ 2 = Real.exp (-3 * d) := by
    rw [pow_two, ← Real.exp_add]
    congr 1
    ring
  simpa only [mul_pow, hsq] using pow_le_pow_left₀ (norm_nonneg _) hmode 2

/-- Opposite-end transmission of all the signed coefficients at once.
Taking the incoming coefficients in the spectral trace weights gives the
same estimate because each propagator is diagonal. -/
theorem roundCylinder_outgoingCoefficients_sqNorm_le {length : ℝ} (hlength : 0 ≤ length)
    (eigenvalue : ι → ℝ) (hgap : ∀ i, (3 : ℝ) / 2 ≤ |eigenvalue i|)
    (incoming : lp (fun _ : ι => V) 2) :
    ∃ outgoing : lp (fun _ : ι => V) 2,
      (∀ i, outgoing i = Real.exp (-|eigenvalue i| * length) • incoming i) ∧
      ‖outgoing‖ ^ 2 ≤ Real.exp (-3 * length) * ‖incoming‖ ^ 2 := by
  have hpoint (i : ι) : ‖Real.exp (-|eigenvalue i| * length) • incoming i‖ ≤ ‖incoming i‖ := by
    rw [norm_smul, Real.norm_eq_abs, abs_of_pos (Real.exp_pos _)]
    exact mul_le_of_le_one_left (norm_nonneg _)
      (Real.exp_le_one_iff.mpr (by nlinarith [abs_nonneg (eigenvalue i)]))
  let outgoing : lp (fun _ : ι => V) 2 :=
    ⟨fun i => Real.exp (-|eigenvalue i| * length) • incoming i,
      (lp.memℓp incoming).mono' hpoint⟩
  refine ⟨outgoing, fun _ => rfl, ?_⟩
  rw [cylinderL2_sqNorm_eq_tsum, cylinderL2_sqNorm_eq_tsum, ← tsum_mul_left]
  apply (cylinderL2_summable_sqNorm outgoing).tsum_le_tsum _ ((cylinderL2_summable_sqNorm incoming).mul_left _)
  intro i
  have hdecay : Real.exp (-|eigenvalue i| * length) ^ 2 ≤ Real.exp (-3 * length) := by
    rw [pow_two, ← Real.exp_add]
    exact Real.exp_le_exp.mpr (by nlinarith [mul_le_mul_of_nonneg_right (hgap i) hlength])
  change ‖Real.exp (-|eigenvalue i| * length) • incoming i‖ ^ 2 ≤ _
  rw [norm_smul, Real.norm_eq_abs, abs_of_pos (Real.exp_pos _), mul_pow]
  exact mul_le_mul_of_nonneg_right hdecay (sq_nonneg _)

end Propagation

section Midpoint

variable {ι 𝕜 H : Type*} [RCLike 𝕜] [NormedAddCommGroup H] [InnerProductSpace 𝕜 H]

/-- Reconstruct the midpoint field with a supplied Hilbert basis for the
link. Each input contains the two orthogonal incoming signs in one
coefficient vector, in the ordinary slice (L^2) norm. -/
noncomputable def roundCylinderMidpoint (basis : HilbertBasis ι 𝕜 H)
    {length : ℝ} (hlength : 0 ≤ length) (eigenvalue : ι → ℝ)
    (hgap : ∀ i, (3 : ℝ) / 2 ≤ |eigenvalue i|) (incoming : lp (fun _ : ι => 𝕜) 2) : H :=
  basis.repr.symm (roundCylinderCoefficients (length := length) eigenvalue hgap incoming
    (fun _ => length / 2) (fun _ => by linarith) (fun _ => by linarith))

/-- The actual midpoint series converges over finite truncations. -/
theorem roundCylinderMidpoint_hasSum (basis : HilbertBasis ι 𝕜 H)
    {length : ℝ} (hlength : 0 ≤ length) (eigenvalue : ι → ℝ)
    (hgap : ∀ i, (3 : ℝ) / 2 ≤ |eigenvalue i|) (incoming : lp (fun _ : ι => 𝕜) 2) :
    HasSum (fun i => roundCylinderMode length (eigenvalue i)
      (incoming i) (incoming i) (length / 2) • basis i)
      (roundCylinderMidpoint basis hlength eigenvalue hgap incoming) := by
  exact basis.hasSum_repr_symm _

/-- The midpoint norm squared has the sharp spectral rate. -/
theorem roundCylinderMidpoint_sqNorm_le (basis : HilbertBasis ι 𝕜 H)
    {length : ℝ} (hlength : 0 ≤ length) (eigenvalue : ι → ℝ)
    (hgap : ∀ i, (3 : ℝ) / 2 ≤ |eigenvalue i|) (incoming : lp (fun _ : ι => 𝕜) 2) :
    ‖roundCylinderMidpoint basis hlength eigenvalue hgap incoming‖ ^ 2 ≤
      Real.exp (-(3 * length / 2)) * ‖incoming‖ ^ 2 := by
  unfold roundCylinderMidpoint
  rw [LinearIsometryEquiv.norm_map, show -(3 * length / 2) = -3 * (length / 2) by ring]
  exact roundCylinderCoefficients_sqNorm_le eigenvalue hgap incoming (fun _ => length / 2)
    (by linarith) (fun _ => le_rfl) (fun _ => by linarith)

/-- Integrating the midpoint floor for a finite family uses the actual link
measure. A link realization supplies the equality of each squared-norm
density integral with the Hilbert norm of its coefficient reconstruction. -/
theorem roundCylinderMidpoint_jointFloor {Y A : Type*} [MeasurableSpace Y]
    (μ : Measure Y) [IsFiniteMeasure μ] (basis : HilbertBasis ι 𝕜 H)
    {length floor : ℝ} (hlength : 0 ≤ length) (eigenvalue : ι → ℝ)
    (hgap : ∀ i, (3 : ℝ) / 2 ≤ |eigenvalue i|) (family : Finset A)
    (incoming : A → lp (fun _ : ι => 𝕜) 2) (density : A → Y → ℝ)
    (hintegrable : ∀ a ∈ family, Integrable (density a) μ)
    (hrealization : ∀ a ∈ family,
      (∫ y, density a y ∂μ) = ‖roundCylinderMidpoint basis hlength eigenvalue hgap (incoming a)‖ ^ 2)
    (hfloor : ∀ᵐ y ∂μ, floor ^ 2 ≤ ∑ a ∈ family, density a y) :
    floor ^ 2 * μ.real Set.univ ≤
      Real.exp (-(3 * length / 2)) * ∑ a ∈ family, ‖incoming a‖ ^ 2 := by
  calc
    floor ^ 2 * μ.real Set.univ = ∫ (_ : Y), floor ^ 2 ∂μ := by
      rw [integral_const, smul_eq_mul, mul_comm]
    _ ≤ ∫ y, ∑ a ∈ family, density a y ∂μ :=
      integral_mono_ae (integrable_const _) (integrable_finsetSum _ hintegrable) hfloor
    _ = ∑ a ∈ family, ∫ y, density a y ∂μ := integral_finsetSum _ hintegrable
    _ = ∑ a ∈ family, ‖roundCylinderMidpoint basis hlength eigenvalue hgap (incoming a)‖ ^ 2 :=
      Finset.sum_congr rfl hrealization
    _ ≤ _ := by
      rw [Finset.mul_sum]
      exact Finset.sum_le_sum fun a _ =>
        roundCylinderMidpoint_sqNorm_le basis hlength eigenvalue hgap (incoming a)

/-- In a supplied `Lp` model of the link, the squared-norm density
integral in the floor estimate is exactly the Hilbert norm squared. -/
theorem roundCylinderMidpoint_jointFloor_Lp
    {Y A Fiber : Type*} [MeasurableSpace Y] [NormedAddCommGroup Fiber]
    [InnerProductSpace 𝕜 Fiber]
    (μ : Measure Y) [IsFiniteMeasure μ] (basis : HilbertBasis ι 𝕜 (Lp Fiber 2 μ))
    {length floor : ℝ} (hlength : 0 ≤ length) (eigenvalue : ι → ℝ)
    (hgap : ∀ i, (3 : ℝ) / 2 ≤ |eigenvalue i|) (family : Finset A)
    (incoming : A → lp (fun _ : ι => 𝕜) 2)
    (hfloor : ∀ᵐ y ∂μ, floor ^ 2 ≤ ∑ a ∈ family,
      ‖roundCylinderMidpoint basis hlength eigenvalue hgap (incoming a) y‖ ^ 2) :
    floor ^ 2 * μ.real Set.univ ≤
      Real.exp (-(3 * length / 2)) * ∑ a ∈ family, ‖incoming a‖ ^ 2 := by
  let field (a : A) := roundCylinderMidpoint basis hlength eigenvalue hgap (incoming a)
  have hintegrable (a : A) : Integrable (fun y => ‖field a y‖ ^ 2) μ :=
    (memLp_two_iff_integrable_sq_norm (Lp.aestronglyMeasurable (field a))).mp (Lp.memLp (field a))
  have hrealization (a : A) : (∫ y, ‖field a y‖ ^ 2 ∂μ) = ‖field a‖ ^ 2 := by
    calc
      _ = ∫ y, RCLike.re (inner 𝕜 (field a y) (field a y)) ∂μ :=
        integral_congr_ae (ae_of_all _ fun y => norm_sq_eq_re_inner (𝕜 := 𝕜) (field a y))
      _ = RCLike.re (∫ y, inner 𝕜 (field a y) (field a y) ∂μ) :=
        integral_re (L2.integrable_inner (field a) (field a))
      _ = _ := by rw [← L2.inner_def, ← norm_sq_eq_re_inner (𝕜 := 𝕜)]
  exact roundCylinderMidpoint_jointFloor μ basis hlength eigenvalue hgap family incoming
    (fun a y => ‖field a y‖ ^ 2) (fun a _ => hintegrable a) (fun a _ => hrealization a) hfloor

end Midpoint

section ForcedEnergy

variable {V : Type*} [NormedAddCommGroup V] [InnerProductSpace ℝ V] [CompleteSpace V]

/-- Uniform `H¹` coefficient bound for the inhomogeneous solution with
continuous forcing. The graph norm here places the weight `1 + λ²` on
the coefficient. The sharper geometric `H¹` norm in MATCH-E01 also uses
the link Weitzenböck formula. -/
theorem forcedCylinderMode_graphEnergy_le {length eigenvalue : ℝ}
    (hlength : 0 ≤ length) (hgap : (3 : ℝ) / 2 ≤ |eigenvalue|)
    (left right : V) {forcing : ℝ → V} (hforcing : Continuous forcing) :
    let u := forcedCylinderMode length eigenvalue left right forcing
    (∫ t in 0..length, ‖deriv u t‖ ^ 2 + (1 + eigenvalue ^ 2) * ‖u t‖ ^ 2) ≤
      (13 / 9 : ℝ) * ((∫ t in 0..length, ‖forcing t‖ ^ 2) +
        |eigenvalue| * ‖if eigenvalue < 0 then right else left‖ ^ 2) := by
  let u := forcedCylinderMode length eigenvalue left right forcing
  let velocity (t : ℝ) := forcing t - eigenvalue • u t
  have hderiv (t : ℝ) : HasDerivAt u (velocity t) t :=
    forcedCylinderMode_hasDerivAt length eigenvalue left right hforcing t
  have hu : Continuous u := continuous_iff_continuousAt.mpr fun t => (hderiv t).continuousAt
  have hvelocity : Continuous velocity := hforcing.sub (continuous_const.smul hu)
  change (∫ t in 0..length, ‖deriv u t‖ ^ 2 + (1 + eigenvalue ^ 2) * ‖u t‖ ^ 2) ≤ _
  have hderivEq : deriv u = velocity := funext fun t => (hderiv t).deriv
  rw [hderivEq]
  have hbalance := cylinderMode_energy_balance length eigenvalue hderiv hvelocity
  have hequation (t : ℝ) : velocity t + eigenvalue • u t = forcing t := sub_add_cancel _ _
  simp only [hequation, u, forcedCylinderMode_at_incoming] at hbalance
  have henergy :
      (∫ t in 0..length, ‖velocity t‖ ^ 2 + eigenvalue ^ 2 * ‖u t‖ ^ 2) ≤
        (∫ t in 0..length, ‖forcing t‖ ^ 2) +
          |eigenvalue| * ‖if eigenvalue < 0 then right else left‖ ^ 2 := by
    change (∫ t in 0..length, ‖velocity t‖ ^ 2 + eigenvalue ^ 2 *
        ‖forcedCylinderMode length eigenvalue left right forcing t‖ ^ 2) ≤ _
    linarith only [hbalance,
      mul_nonneg (abs_nonneg eigenvalue)
        (sq_nonneg ‖u (cylinderOutgoingEnd length eigenvalue)‖)]
  have hgapSq : (3 / 2 : ℝ) ^ 2 ≤ |eigenvalue| ^ 2 :=
    (sq_le_sq₀ (by norm_num) (abs_nonneg _)).mpr hgap
  have hcoef : 1 + eigenvalue ^ 2 ≤ (13 / 9 : ℝ) * eigenvalue ^ 2 := by
    rw [sq_abs] at hgapSq
    linarith only [hgapSq]
  have hgraph : Continuous (fun t => ‖velocity t‖ ^ 2 + (1 + eigenvalue ^ 2) * ‖u t‖ ^ 2) :=
    (hvelocity.norm.pow 2).add (continuous_const.mul (hu.norm.pow 2))
  have hbulk : Continuous (fun t => (13 / 9 : ℝ) *
      (‖velocity t‖ ^ 2 + eigenvalue ^ 2 * ‖u t‖ ^ 2)) :=
    continuous_const.mul ((hvelocity.norm.pow 2).add (continuous_const.mul (hu.norm.pow 2)))
  calc
    _ ≤ ∫ t in 0..length, (13 / 9 : ℝ) * (‖velocity t‖ ^ 2 + eigenvalue ^ 2 * ‖u t‖ ^ 2) := by
      apply intervalIntegral.integral_mono_on hlength (hgraph.intervalIntegrable _ _)
        (hbulk.intervalIntegrable _ _)
      intro t _
      nlinarith only [mul_le_mul_of_nonneg_right hcoef (sq_nonneg ‖u t‖),
        sq_nonneg ‖velocity t‖]
    _ ≤ _ := by
      rw [intervalIntegral.integral_const_mul]
      exact mul_le_mul_of_nonneg_left henergy (by norm_num)

/-- A summable forcing-and-trace budget gives convergence of the
integrated graph energies of the modal solutions under finite
truncation, with the same length-independent constant. -/
theorem forcedCylinderModes_graphEnergy_hasSum {ι : Type*} {length : ℝ}
    (hlength : 0 ≤ length) (eigenvalue : ι → ℝ)
    (hgap : ∀ i, (3 : ℝ) / 2 ≤ |eigenvalue i|) (left right : ι → V)
    (forcing : ι → ℝ → V) (hforcing : ∀ i, Continuous (forcing i)) :
    let budget (i : ι) := (∫ t in 0..length, ‖forcing i t‖ ^ 2) +
      |eigenvalue i| * ‖if eigenvalue i < 0 then right i else left i‖ ^ 2
    let graphEnergy (i : ι) :=
      let u := forcedCylinderMode length (eigenvalue i) (left i) (right i) (forcing i)
      ∫ t in 0..length, ‖deriv u t‖ ^ 2 + (1 + eigenvalue i ^ 2) * ‖u t‖ ^ 2
    Summable budget → ∃ total : ℝ, HasSum graphEnergy total ∧
      total ≤ (13 / 9 : ℝ) * ∑' i : ι, budget i := by
  intro budget graphEnergy hbudget
  have hpoint (i : ι) : graphEnergy i ≤ (13 / 9 : ℝ) * budget i :=
    forcedCylinderMode_graphEnergy_le hlength (hgap i) (left i) (right i) (hforcing i)
  have hnonneg (i : ι) : 0 ≤ graphEnergy i :=
    intervalIntegral.integral_nonneg_of_forall hlength fun _ => by positivity
  have hscaled := hbudget.mul_left (13 / 9 : ℝ)
  have hsum := Summable.of_nonneg_of_le hnonneg hpoint hscaled
  refine ⟨∑' i, graphEnergy i, hsum.hasSum, ?_⟩
  rw [← tsum_mul_left]
  exact hsum.tsum_le_tsum hpoint hscaled

end ForcedEnergy

end FirstOrderTwistor
