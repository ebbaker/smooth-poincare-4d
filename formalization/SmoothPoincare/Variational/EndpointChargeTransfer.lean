import SmoothPoincare.Variational.EndpointSpectralDeficit
import SmoothPoincare.Variational.EndpointCollarCost

/-! # Energy on the omitted set of a finite family of disks

The physical chiral densities are transported to the volume-one modified
Yamabe representative. The latter can be only C^(2,α). Its measure and
scalar test enter explicitly. The distance used to obtain the disks has
no role in the change of gauge.
-/

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Integral.Measure
open FirstOrderTwistor Filter MeasureTheory SectionsAndConnections Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

section Measured

variable {X : Type*} [MeasurableSpace X] {μ : Measure X} [IsProbabilityMeasure μ]

/-- Quantitative variance about the root mean square from the modified
constant test, including the signed constant in that test. -/
theorem modifiedYamabe_variance_le {L : X → ℝ} {ell Y c : ℝ}
    (hL : MemLp L 2 μ) (hell : 0 ≤ ell) (hMoment : ∫ x, L x ^ 2 ∂μ = ell ^ 2)
    (hTest : Y ≤ c + 6 * ∫ x, L x ∂μ) :
    (∫ x, (L x - ell) ^ 2 ∂μ) ≤ ell * (6 * ell - Y + c) / 3 ∧
      Y - 6 * ell ≤ c := by
  have hi : Integrable L μ := hL.integrable (by norm_num)
  have hExpand : (∫ x, (L x - ell) ^ 2 ∂μ) = 2 * ell * (ell - ∫ x, L x ∂μ) := by
    have hPoly (x : X) : (L x - ell) ^ 2 = (L x ^ 2 - (2 * ell) * L x) + ell ^ 2 := by ring
    simp_rw [hPoly]
    have hf : Integrable (fun x => L x ^ 2 - 2 * ell * L x) μ :=
      hL.integrable_sq.sub (hi.const_mul (2 * ell))
    rw [integral_add hf (integrable_const (ell ^ 2)),
      integral_sub hL.integrable_sq (hi.const_mul (2 * ell)), integral_const_mul, hMoment]
    simp [Measure.real_def]
    ring
  have hMean : (∫ x, L x ∂μ) ≤ ell := by
    by_cases h : 0 < ell
    · have hn : 0 ≤ ∫ x, (L x - ell) ^ 2 ∂μ := integral_nonneg fun x => sq_nonneg _
      rw [hExpand] at hn
      exact sub_nonneg.mp ((mul_nonneg_iff_of_pos_left (by positivity : 0 < 2 * ell)).mp hn)
    · have h0 : ell = 0 := le_antisymm (le_of_not_gt h) hell
      have hZero := (integral_eq_zero_iff_of_nonneg (fun x => sq_nonneg (L x)) hL.integrable_sq).1
        (hMoment.trans (by simp [h0]))
      have heq : L =ᵐ[μ] (fun _ => 0) := hZero.mono fun x hx => by
        change L x ^ 2 = 0 at hx
        exact sq_eq_zero_iff.mp hx
      rw [integral_congr_ae heq, integral_zero, h0]
  constructor
  · rw [hExpand]
    nlinarith only [mul_le_mul_of_nonneg_left hTest hell]
  · linarith only [hMean, hTest]

/-- On every measurable omission the transported top-eigenvalue square is
bounded by twice the entire variance and twice the mass of that omission
times the squared rms. This one-sided estimate suffices to pass from volume
selection to capture of both actual chiral charges. -/
theorem modifiedYamabe_omitted_square_le {L : X → ℝ} {ell Y c : ℝ}
    (hL : MemLp L 2 μ) (hell : 0 ≤ ell) (hMoment : ∫ x, L x ^ 2 ∂μ = ell ^ 2)
    (hTest : Y ≤ c + 6 * ∫ x, L x ∂μ)
    (S : Set X) :
    (∫ x in S, L x ^ 2 ∂μ) ≤
      2 * (ell * (6 * ell - Y + c) / 3) + 2 * ell ^ 2 * μ.real S := by
  have hd : MemLp (fun x => L x - ell) 2 μ := hL.sub (memLp_const _)
  have hvar := (modifiedYamabe_variance_le hL hell hMoment hTest).1
  have hSub := setIntegral_le_integral hd.integrable_sq (Eventually.of_forall fun x => sq_nonneg _) (s := S)
  calc
    _ ≤ ∫ x in S, 2 * (L x - ell) ^ 2 + 2 * ell ^ 2 ∂μ :=
      integral_mono hL.integrable_sq.integrableOn
        ((hd.integrable_sq.integrableOn.const_mul _).add (integrable_const _))
        (fun x => by nlinarith [sq_nonneg (L x - 2 * ell)])
    _ = 2 * (∫ x in S, (L x - ell) ^ 2 ∂μ) + μ.real S * (2 * ell ^ 2) := by
      rw [integral_add (hd.integrable_sq.integrableOn.const_mul _) (integrable_const _), integral_const_mul]
      simp [Measure.real_def]
    _ ≤ _ := by linarith only [hSub.trans hvar]

/-- The absolute-density estimate used for total variation. Cauchy--Schwarz
compares the two factors on the very same modified measure. -/
theorem modifiedYamabe_square_density_L1 {L : X → ℝ} {ell Y c : ℝ}
    (hL : MemLp L 2 μ) (hell : 0 ≤ ell) (hMoment : ∫ x, L x ^ 2 ∂μ = ell ^ 2)
    (hTest : Y ≤ c + 6 * ∫ x, L x ∂μ) :
    (∫ x, |L x ^ 2 - ell ^ 2| ∂μ) ≤
      Real.sqrt (ell * (6 * ell - Y + c) / 3) * (2 * ell) := by
  let f : X → ℝ := fun x => L x - ell
  let k : X → ℝ := fun x => L x + ell
  have hf : MemLp f 2 μ := hL.sub (memLp_const _)
  have hk : MemLp k 2 μ := hL.add (memLp_const _)
  have hHolder := integral_mul_norm_le_Lp_mul_Lq Real.HolderConjugate.two_two
    (show MemLp f (ENNReal.ofReal 2) μ by simpa using hf)
    (show MemLp k (ENNReal.ofReal 2) μ by simpa using hk)
  have hBound : (∫ x, k x ^ 2 ∂μ) ≤ (2 * ell) ^ 2 := by
    calc
      _ ≤ ∫ x, 2 * L x ^ 2 + 2 * ell ^ 2 ∂μ := integral_mono hk.integrable_sq
        ((hL.integrable_sq.const_mul 2).add (integrable_const (2 * ell ^ 2)))
        (fun x => by dsimp [k]; nlinarith only [sq_nonneg (L x - ell)])
      _ = _ := by
        rw [integral_add (hL.integrable_sq.const_mul 2) (integrable_const (2 * ell ^ 2)),
          integral_const_mul, hMoment]
        simp [Measure.real_def]
        ring
  have hSub (x : X) : |L x ^ 2 - ell ^ 2| = ‖f x‖ * ‖k x‖ := by
    simp [f, k, sq_sub_sq, abs_mul, Real.norm_eq_abs, mul_comm]
  simp_rw [hSub]
  simp only [Real.rpow_two, Real.norm_eq_abs, sq_abs, ← Real.sqrt_eq_rpow] at hHolder
  apply hHolder.trans
  apply mul_le_mul (Real.sqrt_le_sqrt (modifiedYamabe_variance_le hL hell hMoment hTest).1)
    _ (Real.sqrt_nonneg _) (Real.sqrt_nonneg _)
  exact (Real.sqrt_le_sqrt hBound).trans_eq (Real.sqrt_sq (by positivity))

end Measured

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [Nonempty M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- Limits of the Yamabe constant and the actual physical spectral moment.
The equality of the two limiting constants is written using their squares. -/
theorem endpointPhysical_moment_limits
    (o : ManifoldOrientation I M 4) (g : ℕ → SmoothRiemannianMetric I M)
    (frame : ∀ i x, OrientedOrthonormalFrameAt (g i) o x)
    (plus minus : ℕ → M → Fin 3 → ℝ)
    (h : ∀ i, EndpointPhysicalSpectralData o (g i) (frame i) (plus i) (minus i))
    (he : Tendsto (fun i => chiralFrameEnergy (g i)
      (fun x => geometricChiralBlock (g i) o x (frame i x))) atTop (𝓝 (4 * Real.pi ^ 2))) :
    let ell := fun i => Real.sqrt (∫ x, endpointTopWeyl (plus i x) (minus i x) ^ 2
      ∂riemannianVolumeMeasure I M (g i))
    let ellStar := Real.sqrt ((4/3 : ℝ) * (4 * Real.pi ^ 2))
    Tendsto ell atTop (𝓝 ellStar) ∧
      Tendsto (fun i => classYamabeFour o.dimension_eq (g i)) atTop (𝓝 (6 * ellStar)) := by
  intro ell ellStar
  let T := 4 * Real.pi ^ 2
  let e := fun i => chiralFrameEnergy (g i) (fun x => geometricChiralBlock (g i) o x (frame i x))
  let D := fun i => ∫ x, endpointRicciDefectDensity (g i) o x (frame i x) ∂riemannianVolumeMeasure I M (g i)
  let B := fun i => ∫ x, endpointSpectralDefectDensity (plus i x) (minus i x) ∂riemannianVolumeMeasure I M (g i)
  have he' : Tendsto e atTop (𝓝 T) := he
  obtain ⟨hD, hB⟩ := endpointPhysicalSpectralLimits o g frame plus minus h he
  change Tendsto D atTop (𝓝 0) at hD
  change Tendsto B atTop (𝓝 0) at hB
  have hsq := ((he'.const_mul (4/3 : ℝ)).sub hB)
  rw [sub_zero] at hsq
  have hell := (Real.continuous_sqrt.tendsto _).comp hsq
  constructor
  · apply hell.congr
    intro i
    apply congrArg Real.sqrt
    have hi := (endpointPhysicalSpectralDeficit o (g i) (frame i) (plus i) (minus i) (h i)).1
    change (4 / 3 : ℝ) * e i - B i = _
    change B i = (4/3 : ℝ) * e i - _ at hi
    linarith
  · have hYSq := (((tendsto_const_nhds (x := 16 * Real.pi ^ 2)).sub
      (he'.const_mul 2)).add (hD.div_const 2)).const_mul 24
    have hYroot := (Real.continuous_sqrt.tendsto _).comp hYSq
    have hs : Real.sqrt (24 * (16 * Real.pi ^ 2 - 2 * T + 0 / 2)) = 6 * ellStar := by
      apply (sq_eq_sq₀ (Real.sqrt_nonneg _) (by positivity : 0 ≤ 6 * ellStar)).mp
      dsimp [T, ellStar]
      rw [Real.sq_sqrt (by nlinarith [sq_nonneg Real.pi]), mul_pow, Real.sq_sqrt (by positivity)]
      ring
    rw [← hs]
    apply hYroot.congr
    intro i
    have hi := (h i).euler_two
    dsimp only at hi
    rw [(h i).signature_zero] at hi
    have hv : (∫ x, metricScalarAt (g i) x ^ 2 ∂riemannianVolumeMeasure I M (g i)) =
        classYamabeFour o.dimension_eq (g i) ^ 2 := by
      simp [(h i).yamabe_scalar, (h i).volume_one, Measure.real_def]
    rw [hv] at hi
    change 16 * Real.pi ^ 2 = e i + e i - D i / 2 + _ at hi
    change Real.sqrt (24 * (16 * Real.pi ^ 2 - 2 * e i + D i / 2)) = _
    rw [show 24 * (16 * Real.pi ^ 2 - 2 * e i + D i / 2) =
      classYamabeFour o.dimension_eq (g i) ^ 2 by linarith, Real.sqrt_sq (h i).positive.le]

/-- The physical unmodified plus and minus masses on the actual omitted set.
Only the scalar moment is evaluated in the modified volume measure. The
comparison metric supplying disk inclusions appears in neither integral. -/
theorem endpointPhysical_omitted_charges
    (o : ManifoldOrientation I M 4) (g : ℕ → SmoothRiemannianMetric I M)
    (frame : ∀ i x, OrientedOrthonormalFrameAt (g i) o x)
    (plus minus : ℕ → M → Fin 3 → ℝ)
    (h : ∀ i, EndpointPhysicalSpectralData o (g i) (frame i) (plus i) (minus i))
    (he : Tendsto (fun i => chiralFrameEnergy (g i)
      (fun x => geometricChiralBlock (g i) o x (frame i x))) atTop (𝓝 (4 * Real.pi ^ 2)))
    (μ : ℕ → Measure M) [∀ i, IsProbabilityMeasure (μ i)]
    (L : ℕ → M → ℝ) (c : ℕ → ℝ) (S : ℕ → Set M)
    (hL : ∀ i, MemLp (L i) 2 (μ i)) (hc : ∀ i, c i ≤ 0)
    (hTest : ∀ i, classYamabeFour o.dimension_eq (g i) ≤ c i + 6 * ∫ x, L i x ∂μ i)
    (spectralTransport : ∀ i (A : Set M), MeasurableSet A →
      (∫ x in A, endpointTopWeyl (plus i x) (minus i x) ^ 2 ∂riemannianVolumeMeasure I M (g i)) =
      ∫ x in A, L i x ^ 2 ∂μ i)
    (hS : ∀ i, MeasurableSet (S i)) (hSmall : Tendsto (fun i => (μ i).real (S i)) atTop (𝓝 0)) :
    Tendsto c atTop (𝓝 0) ∧
    Tendsto (fun i => ∫ x in S i, hilbertSchmidtSq (geometricChiralBlock (g i) o x (frame i x)) +
      hilbertSchmidtSq (endpointNegativeWeylBlock (g i) o x (frame i x))
      ∂riemannianVolumeMeasure I M (g i)) atTop (𝓝 0) := by
  let dV := fun i => riemannianVolumeMeasure I M (g i)
  let ell := fun i => Real.sqrt (∫ x, endpointTopWeyl (plus i x) (minus i x) ^ 2 ∂dV i)
  let star := Real.sqrt ((4/3 : ℝ) * (4 * Real.pi ^ 2))
  let Y := fun i => classYamabeFour o.dimension_eq (g i)
  let Dens := fun i x => endpointSpectralDefectDensity (plus i x) (minus i x)
  let W := fun i x => hilbertSchmidtSq (geometricChiralBlock (g i) o x (frame i x)) +
    hilbertSchmidtSq (endpointNegativeWeylBlock (g i) o x (frame i x))
  obtain ⟨hell, hY⟩ := endpointPhysical_moment_limits o g frame plus minus h he
  change Tendsto ell atTop (𝓝 star) at hell
  change Tendsto Y atTop (𝓝 (6 * star)) at hY
  have hMoment (i : ℕ) : (∫ x, L i x ^ 2 ∂μ i) = ell i ^ 2 := by
    rw [Real.sq_sqrt (integral_nonneg fun _ => sq_nonneg _)]
    simpa [dV] using (spectralTransport i univ MeasurableSet.univ).symm
  have hFloor (i : ℕ) := (modifiedYamabe_variance_le (hL i)
    (Real.sqrt_nonneg _) (hMoment i) (hTest i)).2
  have hDiff : Tendsto (fun i => Y i - 6 * ell i) atTop (𝓝 0) := by
    simpa using hY.sub (hell.const_mul 6)
  have hcLim := hDiff.squeeze tendsto_const_nhds hFloor hc
  refine ⟨hcLim, ?_⟩
  have hGap : Tendsto (fun i => 6 * ell i - Y i + c i) atTop (𝓝 0) := by
    simpa using ((hell.const_mul 6).sub hY).add hcLim
  have hUpper := (((hell.mul hGap).div_const 3).const_mul 2).add
    (((hell.pow 2).const_mul 2).mul hSmall)
  have hOmitted : Tendsto (fun i => ∫ x in S i, L i x ^ 2 ∂μ i) atTop (𝓝 0) := by
    apply tendsto_const_nhds.squeeze _ (fun i => integral_nonneg fun _ => sq_nonneg _)
      (fun i => modifiedYamabe_omitted_square_le (hL i) (Real.sqrt_nonneg _)
        (hMoment i) (hTest i) (S i))
    simpa using hUpper
  have hB := (endpointPhysicalSpectralLimits o g frame plus minus h he).2
  have hLocal (i : ℕ) : (2/3 : ℝ) * (∫ x in S i, W i x ∂dV i) ≤
      (∫ x, Dens i x ∂dV i) + ∫ x in S i, L i x ^ 2 ∂μ i := by
    let Z := fun x => endpointTopWeyl (plus i x) (minus i x) ^ 2
    have hid (x : M) : Dens i x = (2/3 : ℝ) * W i x - Z x :=
      endpointSpectralDefectDensity_eq _ _ _ _ ((h i).plus_spectrum x) ((h i).minus_spectrum x)
        (trace_geometricChiralBlock _ _ _ _) (trace_traceFreeChiralBlock _)
    have hw : Integrable (W i) (dV i) := (h i).plus_integrable.add (h i).minus_integrable
    have hd : Integrable (Dens i) (dV i) := by
      simp_rw [funext hid]
      exact (hw.const_mul _).sub (h i).top_integrable
    have hMono := setIntegral_le_integral hd (Eventually.of_forall fun _ =>
      endpointSpectralDefectDensity_nonneg _ _) (s := S i)
    have heq : (∫ x in S i, Dens i x ∂dV i) =
        (2/3 : ℝ) * (∫ x in S i, W i x ∂dV i) - ∫ x in S i, L i x ^ 2 ∂μ i := by
      simp_rw [hid]
      rw [integral_sub (hw.integrableOn.const_mul _) (h i).top_integrable.integrableOn, integral_const_mul]
      rw [← spectralTransport i (S i) (hS i)]
    linarith
  change Tendsto (fun i => ∫ x in S i, W i x ∂dV i) atTop (𝓝 0)
  apply tendsto_const_nhds.squeeze _ (fun i => integral_nonneg fun _ =>
    add_nonneg (Finset.sum_nonneg fun _ _ => Finset.sum_nonneg fun _ _ => sq_nonneg _)
      (Finset.sum_nonneg fun _ _ => Finset.sum_nonneg fun _ _ => sq_nonneg _))
    (fun i => show (∫ x in S i, W i x ∂dV i) ≤
      (3/2 : ℝ) * ((∫ x, Dens i x ∂dV i) + ∫ x in S i, L i x ^ 2 ∂μ i) by linarith only [hLocal i])
  simpa [Dens, dV] using (hB.add hOmitted).const_mul (3/2 : ℝ)

end SmoothPoincare
