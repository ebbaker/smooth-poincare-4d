import FirstOrderTwistor.AnnularInterpolation
import Mathlib.MeasureTheory.Function.Holder
import Mathlib.MeasureTheory.Function.L2Space
import Mathlib.MeasureTheory.Function.LpSeminorm.LpNorm

/-!
# Quantitative estimates in supplied spin gauges

The pointwise operator coefficients and the Sobolev bound in EXTRACT-E01 are
inputs. The norm estimate below uses the measured principal L∞ coefficient
and lower-order L⁴ coefficient on the same reference slab.
-/

open MeasureTheory Filter
open scoped BigOperators ENNReal NNReal

namespace FirstOrderTwistor

private theorem holderFourFourTwo : ENNReal.HolderTriple 4 4 2 := by
  constructor
  rw [← two_mul]
  calc
    2 * (4 : ℝ≥0∞)⁻¹ = 2 * ((2 : ℝ≥0∞) * 2)⁻¹ := by norm_num
    _ = 2 * ((2 : ℝ≥0∞)⁻¹ * 2⁻¹) := by rw [ENNReal.mul_inv (by simp) (by simp)]
    _ = (2 : ℝ≥0∞)⁻¹ := ENNReal.mul_inv_cancel_left (by norm_num) (by simp)

private theorem lpNorm_congr {α E : Type*} [MeasurableSpace α] [NormedAddCommGroup E]
    {μ : Measure α} {p : ℝ≥0∞} {f g : α → E} (h : f =ᵐ[μ] g) :
    lpNorm f p μ = lpNorm g p μ :=
  congrArg ENNReal.toReal (eLpNorm_congr_ae h)

private theorem lpNorm_le_mul_of_ae {α E F : Type*} [MeasurableSpace α]
    [NormedAddCommGroup E] [NormedAddCommGroup F] {μ : Measure α} {p : ℝ≥0∞}
    {f : α → E} {g : α → F} {c : ℝ}
    (hf : AEStronglyMeasurable f μ) (hg : MemLp g p μ) (hc : 0 ≤ c)
    (h : ∀ᵐ x ∂μ, ‖f x‖ ≤ c * ‖g x‖) :
    lpNorm f p μ ≤ c * lpNorm g p μ := by
  have hbound := ENNReal.toReal_mono
    (ENNReal.mul_ne_top ENNReal.ofReal_ne_top hg.eLpNorm_ne_top)
    (eLpNorm_le_mul_eLpNorm_of_ae_le_mul hf h p)
  simpa only [ENNReal.toReal_mul, ENNReal.toReal_ofReal hc, toReal_eLpNorm] using hbound

private theorem memLp_apply_bound {α E F : Type*} [MeasurableSpace α]
    [NormedAddCommGroup E] [NormedAddCommGroup F] [NormedSpace ℝ E] [NormedSpace ℝ F]
    {μ : Measure α} {p q r : ℝ≥0∞} [ENNReal.HolderTriple p q r]
    {a : α → E →L[ℝ] F} {u : α → E} (ha : MemLp a p μ) (hu : MemLp u q μ) :
    MemLp (fun x => a x (u x)) r μ ∧
      lpNorm (fun x => a x (u x)) r μ ≤ lpNorm a p μ * lpNorm u q μ := by
  have hcont := (ContinuousLinearMap.id ℝ (E →L[ℝ] F)).continuous₂
  have hpoint : ∀ᵐ x ∂μ, ‖a x (u x)‖₊ ≤ (1 : ℝ≥0) * ‖a x‖₊ * ‖u x‖₊ :=
    Eventually.of_forall fun x => by simpa only [one_mul] using (a x).le_opNNNorm (u x)
  have hnorm := eLpNorm_le_eLpNorm_mul_eLpNorm_of_nnnorm (p := p) (q := q) (r := r) (fun m v => m v) 1 hcont
    ha.aestronglyMeasurable hu.aestronglyMeasurable hpoint
  refine ⟨ha.of_bilin (fun m v => m v) 1 hu hcont hpoint, ?_⟩
  rw [ENNReal.coe_one, one_mul] at hnorm
  have hreal := ENNReal.toReal_mono (ENNReal.mul_ne_top ha.eLpNorm_ne_top hu.eLpNorm_ne_top) hnorm
  simpa only [ENNReal.toReal_mul, toReal_eLpNorm] using hreal

/-- On a supplied reference slab, the a.e. decomposition of the error as
the sum of the principal and lower-order terms gives a quantitative L² estimate.
H bounds the L² gradient and S * H bounds the L⁴ field by the supplied
Sobolev inequality. All norms use the same reference measure. -/
theorem spinStrip_coefficientPerturbation {α E F G : Type*} [MeasurableSpace α]
    [NormedAddCommGroup E] [NormedAddCommGroup F] [NormedAddCommGroup G]
    [NormedSpace ℝ E] [NormedSpace ℝ F] [NormedSpace ℝ G] {μ : Measure α}
    {a : α → G →L[ℝ] F} {b : α → E →L[ℝ] F} {u : α → E} {du : α → G} {error : α → F}
    {S H : ℝ} (ha : MemLp a ∞ μ) (hb : MemLp b 4 μ) (hu : MemLp u 4 μ)
    (hdu : MemLp du 2 μ) (herror : error =ᵐ[μ] fun x => a x (du x) + b x (u x))
    (hgradient : lpNorm du 2 μ ≤ H) (hsobolev : lpNorm u 4 μ ≤ S * H) :
    MemLp error 2 μ ∧ lpNorm error 2 μ ≤ (lpNorm a ∞ μ + S * lpNorm b 4 μ) * H := by
  let _ := holderFourFourTwo
  obtain ⟨hprincipalLp, hprincipal⟩ := memLp_apply_bound (r := 2) ha hdu
  obtain ⟨hlowerLp, hlower⟩ := memLp_apply_bound (r := 2) hb hu
  refine ⟨(memLp_congr_ae herror).mpr (hprincipalLp.add hlowerLp), ?_⟩
  rw [lpNorm_congr herror]
  calc
    lpNorm ((fun x => a x (du x)) + (fun x => b x (u x))) 2 μ ≤
        lpNorm (fun x => a x (du x)) 2 μ + lpNorm (fun x => b x (u x)) 2 μ :=
      lpNorm_add_le hprincipalLp (by norm_num)
    _ ≤ lpNorm a ∞ μ * lpNorm du 2 μ + lpNorm b 4 μ * lpNorm u 4 μ :=
      add_le_add hprincipal hlower
    _ ≤ lpNorm a ∞ μ * H + lpNorm b 4 μ * (S * H) :=
      add_le_add (mul_le_mul_of_nonneg_left hgradient lpNorm_nonneg)
        (mul_le_mul_of_nonneg_left hsobolev lpNorm_nonneg)
    _ = (lpNorm a ∞ μ + S * lpNorm b 4 μ) * H := by ring

/-- The coefficient estimate on the full space of inputs with the specified
first-order norm. The operators and the reference derivative are supplied in
fixed spaces, so the conclusion is an operator norm bound. -/
theorem spinStrip_operatorPerturbation {α E F G X : Type*} [MeasurableSpace α]
    [NormedAddCommGroup E] [NormedAddCommGroup F] [NormedAddCommGroup G] [NormedAddCommGroup X]
    [NormedSpace ℝ E] [NormedSpace ℝ F] [NormedSpace ℝ G] [NormedSpace ℝ X] {μ : Measure α}
    {a : α → G →L[ℝ] F} {b : α → E →L[ℝ] F}
    (Lh L0 : X →L[ℝ] Lp F 2 μ) (u : X → α → E) (du : X → α → G)
    {S : ℝ} (hS : 0 ≤ S) (ha : MemLp a ∞ μ) (hb : MemLp b 4 μ)
    (hu : ∀ v, MemLp (u v) 4 μ) (hdu : ∀ v, MemLp (du v) 2 μ)
    (herror : ∀ v, (fun x => Lh v x - L0 v x) =ᵐ[μ] fun x => a x (du v x) + b x (u v x))
    (hgradient : ∀ v, lpNorm (du v) 2 μ ≤ ‖v‖)
    (hsobolev : ∀ v, lpNorm (u v) 4 μ ≤ S * ‖v‖) :
    ‖Lh - L0‖ ≤ lpNorm a ∞ μ + S * lpNorm b 4 μ := by
  apply ContinuousLinearMap.opNorm_le_bound _ (add_nonneg lpNorm_nonneg (mul_nonneg hS lpNorm_nonneg))
  intro v
  change ‖Lh v - L0 v‖ ≤ _
  rw [Lp.norm_def, toReal_eLpNorm, lpNorm_congr (Lp.coeFn_sub (Lh v) (L0 v))]
  exact (spinStrip_coefficientPerturbation ha hb (hu v) (hdu v) (herror v) (hgradient v)
    (hsobolev v)).2

private theorem lpNorm_sq_eq_integral {α E : Type*} [MeasurableSpace α] [NormedAddCommGroup E]
    {μ : Measure α} {f : α → E} (hf : AEStronglyMeasurable f μ) :
    lpNorm f 2 μ ^ 2 = ∫ x, ‖f x‖ ^ 2 ∂μ := by
  rw [lpNorm_eq_integral_norm_rpow_toReal (by norm_num) (by simp) hf]
  simp only [ENNReal.toReal_ofNat, Real.rpow_two, ← one_div, ← Real.sqrt_eq_rpow]
  exact Real.sq_sqrt (integral_nonneg fun _ => sq_nonneg _)

/-- The bound on finitely many reference slabs retains the same coefficient.
The sum measure represents the whole strip when the slab interiors partition it
and the shared faces have measure zero. The squared local first-order norms
are bounded in sum by the squared whole-strip norm. -/
theorem spinStrip_sumSlabBounds {ι α E : Type*} [MeasurableSpace α]
    [NormedAddCommGroup E] (s : Finset ι) (μ : ι → Measure α) {error : α → E}
    {H : ι → ℝ} {δ Htotal : ℝ} (hδ : 0 ≤ δ) (hHtotal : 0 ≤ Htotal)
    (hMeas : AEStronglyMeasurable error (∑ i ∈ s, μ i))
    (hlocal : ∀ i ∈ s, MemLp error 2 (μ i) ∧ lpNorm error 2 (μ i) ≤ δ * H i)
    (hSum : (∑ i ∈ s, H i ^ 2) ≤ Htotal ^ 2) :
    MemLp error 2 (∑ i ∈ s, μ i) ∧ lpNorm error 2 (∑ i ∈ s, μ i) ≤ δ * Htotal := by
  have hIntegrable (i : ι) (hi : i ∈ s) : Integrable (fun x => ‖error x‖ ^ 2) (μ i) :=
    (memLp_two_iff_integrable_sq_norm (hlocal i hi).1.aestronglyMeasurable).mp (hlocal i hi).1
  refine ⟨(memLp_two_iff_integrable_sq_norm hMeas).mpr
    (integrable_finsetSum_measure.mpr hIntegrable), ?_⟩
  have hSq : lpNorm error 2 (∑ i ∈ s, μ i) ^ 2 ≤ (δ * Htotal) ^ 2 := by
    rw [lpNorm_sq_eq_integral hMeas, integral_finsetSum_measure hIntegrable]
    calc
      (∑ i ∈ s, ∫ x, ‖error x‖ ^ 2 ∂μ i) ≤ ∑ i ∈ s, δ ^ 2 * H i ^ 2 := by
        apply Finset.sum_le_sum
        intro i hi
        rw [← lpNorm_sq_eq_integral (hlocal i hi).1.aestronglyMeasurable, ← mul_pow]
        exact pow_le_pow_left₀ lpNorm_nonneg (hlocal i hi).2 2
      _ = δ ^ 2 * ∑ i ∈ s, H i ^ 2 := (Finset.mul_sum ..).symm
      _ ≤ δ ^ 2 * Htotal ^ 2 := mul_le_mul_of_nonneg_left hSum (sq_nonneg _)
      _ = (δ * Htotal) ^ 2 := (mul_pow ..).symm
  exact le_of_pow_le_pow_left₀ (by norm_num) (mul_nonneg hδ hHtotal) hSq

/-- Consume Euclidean buffered interpolation in the strip coefficient bound.
The chart comparison is supplied as bounds on the two measured coefficients.
The lower-order comparison incorporates the radius and volume change and
allows the reference connection term proportional to the metric error. -/
theorem spinStrip_bufferedCoefficientBound {α E F G ι : Type*}
    [MeasurableSpace α] [Fintype ι] [NormedAddCommGroup E] [NormedAddCommGroup F]
    [NormedAddCommGroup G] [NormedSpace ℝ E] [NormedSpace ℝ F] [NormedSpace ℝ G]
    {μ : Measure α} (A : α → G →L[ℝ] F) (B : α → E →L[ℝ] F)
    (η : EuclideanFour → ℝ) (v : ι → EuclideanFour → ℝ) {a K c Cₐ Cᵦ S : ℝ}
    (hη : ContDiff ℝ 1 η) (hcompact : HasCompactSupport η)
    (hηNonneg : ∀ x, 0 ≤ η x)
    (hv : ∀ j x, x ∈ tsupport η → ContDiffAt ℝ 2 (v j) x)
    (ha : 0 ≤ a) (haBound : ∀ x ∈ tsupport η, coordinateNorm (fun j => v j x) ≤ a)
    (hc : interpolationL4 volume (fun x => coordinateNorm (fun i => euclideanPartial η i x)) ≤ c)
    (hK : interpolationL2 volume (fun x => η x ^ 2 * coordinateNorm (euclideanHessian v x)) ≤ K)
    (hCᵦ : 0 ≤ Cᵦ) (hS : 0 ≤ S) (_hAMemLp : MemLp A ∞ μ) (_hBMemLp : MemLp B 4 μ)
    (hA : lpNorm A ∞ μ ≤ Cₐ * a)
    (hB : lpNorm B 4 μ ≤ Cᵦ * (a + interpolationL4 volume
      (fun x => η x * coordinateNorm (fun p : ι × Fin 4 => euclideanPartial (v p.1) p.2 x)))) :
    lpNorm A ∞ μ + S * lpNorm B 4 μ ≤
      Cₐ * a + S * (Cᵦ * ((1 + 4 * c) * a + 2 * Real.sqrt (a * K))) := by
  obtain ⟨_, hinterpolation, _⟩ := bufferedInterpolation η v a hη hcompact hηNonneg hv ha haBound
  have hgradient := hinterpolation.trans
    (add_le_add (mul_le_mul_of_nonneg_right (mul_le_mul_of_nonneg_left hc (by norm_num)) ha)
      (mul_le_mul_of_nonneg_left (Real.sqrt_le_sqrt (mul_le_mul_of_nonneg_left hK ha)) (by norm_num)))
  have hlower := hB.trans (mul_le_mul_of_nonneg_left (add_le_add_right hgradient a) hCᵦ)
  apply add_le_add hA (mul_le_mul_of_nonneg_left hlower hS) |>.trans_eq
  congr 2
  ring

/-- The localized estimate for a cutoff field in the flat annular frame.
The flat estimate, the relative perturbation and the cutoff equation are
supplied. The right-hand side combines the mass of the cutoff field, the
commutator, and the forcing. -/
theorem spinStrip_absorbTwistedDirac {α E F : Type*} [MeasurableSpace α]
    [NormedAddCommGroup E] [NormedAddCommGroup F] {μ : Measure α}
    {V : α → E} {D0V DhV force commutator : α → F} {H C₀ ε : ℝ}
    (hC₀ : 0 ≤ C₀) (hH : 0 ≤ H) (hsmall : C₀ * ε ≤ 1 / 2)
    (_hV : MemLp V 2 μ) (herror : MemLp (DhV - D0V) 2 μ)
    (hforce : MemLp force 2 μ) (hcommutator : MemLp commutator 2 μ)
    (hcutoff : DhV =ᵐ[μ] force + commutator)
    (hflat : H ≤ C₀ * (lpNorm D0V 2 μ + lpNorm V 2 μ))
    (hperturbation : lpNorm (DhV - D0V) 2 μ ≤ ε * H) :
    MemLp D0V 2 μ ∧ H ≤ 2 * C₀ * (lpNorm V 2 μ + lpNorm commutator 2 μ + lpNorm force 2 μ) := by
  have hDh := (memLp_congr_ae hcutoff).mpr (hforce.add hcommutator)
  have hcutoffTriangle : lpNorm DhV 2 μ ≤ lpNorm force 2 μ + lpNorm commutator 2 μ := by
    rw [lpNorm_congr hcutoff]
    exact lpNorm_add_le hforce (by norm_num)
  have hflatTriangle : lpNorm D0V 2 μ ≤ lpNorm DhV 2 μ + lpNorm (DhV - D0V) 2 μ :=
    lpNorm_le_lpNorm_add_lpNorm_sub hDh (by norm_num)
  have hbefore := hflat.trans (mul_le_mul_of_nonneg_left
    (add_le_add_left (hflatTriangle.trans (add_le_add hcutoffTriangle hperturbation)) _) hC₀)
  have hD0 : MemLp D0V 2 μ := by
    simpa only [sub_sub_cancel] using hDh.sub herror
  have hhalf := mul_le_mul_of_nonneg_right hsmall hH
  exact ⟨hD0, by nlinarith only [hbefore, hhalf]⟩

/-- The interior estimate of MATCH-E10 (3)–(5) in the flat annular gauge.
The Ricci product, unweighted tensor derivative and projected field use
the supplied outer or inner metric measure. The cutoff operator equation
encodes the differentiated harmonic equation and its commutator in the
reference measure. The norm comparisons returning to the actual metric,
the first-order estimate and the pointwise spinor floor are inputs. -/
theorem spinStrip_projectedDerivative {α E F G P S : Type*} [MeasurableSpace α]
    [NormedAddCommGroup E] [NormedAddCommGroup F] [NormedAddCommGroup G]
    [NormedAddCommGroup P] [NormedAddCommGroup S]
    {reference inner outer : Measure α}
    {U V : α → E} {D0V DhV force commutator : α → F} {derivative : α → G}
    {projection : α → P} {ψ : α → S} {ricci : α → ℝ}
    {H C₀ ε Ccut Cr Cfirst Cret Cproj e d floor : ℝ}
    (hC₀ : 0 ≤ C₀) (hH : 0 ≤ H) (hsmall : C₀ * ε ≤ 1 / 2)
    (hCcut : 0 ≤ Ccut) (hCret : 0 ≤ Cret) (hCproj : 0 ≤ Cproj)
    (hV : MemLp V 2 reference) (herror : MemLp (DhV - D0V) 2 reference)
    (hforce : MemLp force 2 reference) (hcommutator : MemLp commutator 2 reference)
    (hcutoff : DhV =ᵐ[reference] force + commutator)
    (hflat : H ≤ C₀ * (lpNorm D0V 2 reference + lpNorm V 2 reference))
    (hperturbation : lpNorm (DhV - D0V) 2 reference ≤ ε * H)
    (hcutoffTerms : lpNorm V 2 reference + lpNorm commutator 2 reference ≤ Ccut * lpNorm U 2 outer)
    (_hRicciProduct : MemLp (fun x => |ricci x| * ‖ψ x‖) 2 outer)
    (hforcing : lpNorm force 2 reference ≤ Cr * lpNorm (fun x => |ricci x| * ‖ψ x‖) 2 outer)
    (_hU : MemLp U 2 outer) (hfirst : lpNorm U 2 outer ≤ Cfirst * (e + d))
    (hderivative : MemLp derivative 2 inner) (hreturn : lpNorm derivative 2 inner ≤ Cret * H)
    (hprojection : AEStronglyMeasurable projection inner)
    (hpointwise : ∀ᵐ x ∂inner, ‖projection x‖ ≤ Cproj * ‖derivative x‖)
    (hψ : AEStronglyMeasurable ψ inner) (hfloorPos : 0 < floor)
    (hfloor : ∀ᵐ x ∂inner, floor ≤ ‖ψ x‖) :
    let normalized := fun x => ‖projection x‖ / ‖ψ x‖
    MemLp normalized 2 inner ∧ lpNorm normalized 2 inner ≤
      (Cproj * Cret * (2 * C₀) / floor) *
        (Ccut * Cfirst * (e + d) + Cr * lpNorm (fun x => |ricci x| * ‖ψ x‖) 2 outer) := by
  let normalized := fun x => ‖projection x‖ / ‖ψ x‖
  have hnormalized : AEStronglyMeasurable normalized inner := hprojection.norm.div₀ hψ.norm
  have hratio : ∀ᵐ x ∂inner, ‖normalized x‖ ≤ (Cproj / floor) * ‖derivative x‖ := by
    filter_upwards [hpointwise, hfloor] with x hx hψx
    have hψPos := hfloorPos.trans_le hψx
    calc
      ‖normalized x‖ = ‖projection x‖ / ‖ψ x‖ :=
        Real.norm_of_nonneg (div_nonneg (norm_nonneg _) hψPos.le)
      _ ≤ (Cproj * ‖derivative x‖) / ‖ψ x‖ := div_le_div_of_nonneg_right hx hψPos.le
      _ ≤ (Cproj * ‖derivative x‖) / floor := div_le_div_of_nonneg_left (by positivity) hfloorPos hψx
      _ = (Cproj / floor) * ‖derivative x‖ := by ring
  obtain ⟨_, habsorb⟩ := spinStrip_absorbTwistedDirac hC₀ hH hsmall hV herror
    hforce hcommutator hcutoff hflat hperturbation
  have hbound := habsorb.trans (mul_le_mul_of_nonneg_left
    (add_le_add (hcutoffTerms.trans (mul_le_mul_of_nonneg_left hfirst hCcut)) hforcing) (by positivity))
  refine ⟨hderivative.of_le_mul hnormalized hratio, ?_⟩
  calc
    lpNorm normalized 2 inner ≤ (Cproj / floor) * lpNorm derivative 2 inner :=
      lpNorm_le_mul_of_ae hnormalized hderivative (div_nonneg hCproj hfloorPos.le) hratio
    _ ≤ (Cproj / floor) * (Cret * H) := mul_le_mul_of_nonneg_left hreturn (by positivity)
    _ ≤ (Cproj / floor) * (Cret *
        (2 * C₀ * (Ccut * (Cfirst * (e + d)) + Cr * lpNorm (fun x => |ricci x| * ‖ψ x‖) 2 outer))) :=
      mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_left hbound hCret) (by positivity)
    _ = _ := by ring

end FirstOrderTwistor
