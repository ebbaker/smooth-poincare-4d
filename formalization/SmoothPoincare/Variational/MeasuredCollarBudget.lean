import SmoothPoincare.Variational.MeasuredCollarChoice

/-! # Local cutoff allowances and finite measured collar budgets -/

open DifferentialGeometry FirstOrderTwistor MeasureTheory
open scoped ContDiff Manifold

namespace SmoothPoincare

variable {ι κ : Type*}

/-- The refined local error on a fixed normalized marked annulus. -/
noncomputable def measuredCollarLocalAllowance (C₀ a w τ d : ℝ) : ℝ :=
  let b := w + τ + d
  C₀ * (a * b + Real.sqrt (d * b) + d)

/-- Squaring the refined allowance costs at most `12 * C₀ ^ 2` in the
row budget provided that the local distortion is at most one. -/
theorem measuredCollarAllowance_sq_le {C₀ a A w τ d β : ℝ}
    (ha : 0 ≤ a) (haA : a ≤ A) (haOne : a ≤ 1)
    (hw : 0 ≤ w) (hτ : 0 ≤ τ) (hd : 0 ≤ d) (hβ : 0 ≤ β)
    (hAllowance : β ≤ measuredCollarLocalAllowance C₀ a w τ d) :
    β ^ 2 ≤ (12 * C₀ ^ 2) * (A ^ 2 * (w ^ 2 + τ ^ 2) + d * (w + τ) + d ^ 2) := by
  let b := w + τ + d
  have hb : 0 ≤ b := by dsimp [b]; positivity
  have hRoot := Real.sq_sqrt (mul_nonneg hd hb)
  have hAllowanceSq := pow_le_pow_left₀ hβ hAllowance 2
  change β ^ 2 ≤ (C₀ * (a * b + Real.sqrt (d * b) + d)) ^ 2 at hAllowanceSq
  have hThree : (a * b + Real.sqrt (d * b) + d) ^ 2 ≤
      3 * ((a * b) ^ 2 + d * b + d ^ 2) := by
    nlinarith only [hRoot, sq_nonneg (a * b - Real.sqrt (d * b)),
      sq_nonneg (a * b - d), sq_nonneg (Real.sqrt (d * b) - d)]
  have hAddSq : (w + τ) ^ 2 ≤ 2 * (w ^ 2 + τ ^ 2) := by
    nlinarith only [sq_nonneg (w - τ)]
  have hFirstSq : (a * (w + τ)) ^ 2 ≤ 2 * (A ^ 2 * (w ^ 2 + τ ^ 2)) := by
    calc
      _ = a ^ 2 * (w + τ) ^ 2 := by ring
      _ ≤ A ^ 2 * (2 * (w ^ 2 + τ ^ 2)) :=
        mul_le_mul (pow_le_pow_left₀ ha haA 2) hAddSq (sq_nonneg _) (sq_nonneg _)
      _ = _ := by ring
  have hLastSq : (a * d) ^ 2 ≤ d ^ 2 := by
    exact pow_le_pow_left₀ (mul_nonneg ha hd) (mul_le_of_le_one_left hd haOne) 2
  have hProductSq : (a * b) ^ 2 ≤ 4 * (A ^ 2 * (w ^ 2 + τ ^ 2)) + 2 * d ^ 2 := by
    calc
      _ ≤ 2 * ((a * (w + τ)) ^ 2 + (a * d) ^ 2) := by
        dsimp [b]
        nlinarith only [sq_nonneg (a * (w + τ) - a * d)]
      _ ≤ _ := by linarith only [hFirstSq, hLastSq]
  have hLocal := mul_le_mul_of_nonneg_left hThree (sq_nonneg C₀)
  have hRowCore :
      3 * ((a * b) ^ 2 + d * b + d ^ 2) ≤
        12 * (A ^ 2 * (w ^ 2 + τ ^ 2) + d * (w + τ) + d ^ 2) := by
    dsimp [b] at hProductSq ⊢
    nlinarith only [hProductSq, mul_nonneg hd (add_nonneg hw hτ)]
  calc
    _ ≤ _ := hAllowanceSq
    _ ≤ C₀ ^ 2 * (3 * ((a * b) ^ 2 + d * b + d ^ 2)) := by
      rw [mul_pow]
      exact hLocal
    _ ≤ C₀ ^ 2 * (12 * (A ^ 2 * (w ^ 2 + τ ^ 2) + d * (w + τ) + d ^ 2)) :=
      mul_le_mul_of_nonneg_left hRowCore (sq_nonneg C₀)
    _ = _ := by ring

/-- The local error bounds certify the row-total hypothesis of the finite
measured selection theorem. The two mixed sums use finite Cauchy–Schwarz. -/
theorem measuredCollarRowBudget_of_localAllowances
    (candidates : ι → Finset κ) (w τ d a allowance : ι → κ → ℝ)
    (A : ι → ℝ) (C₀ : ℝ) (j : ι)
    (ha : ∀ k ∈ candidates j, 0 ≤ a j k ∧ a j k ≤ A j ∧ a j k ≤ 1)
    (hw : ∀ k ∈ candidates j, 0 ≤ w j k) (hτ : ∀ k ∈ candidates j, 0 ≤ τ j k)
    (hd : ∀ k ∈ candidates j, 0 ≤ d j k)
    (hAllowance : ∀ k ∈ candidates j, 0 ≤ allowance j k ∧
      allowance j k ≤ measuredCollarLocalAllowance C₀ (a j k) (w j k) (τ j k) (d j k)) :
    (∑ k ∈ candidates j, measuredCollarScore (w j k) (allowance j k)) ≤
      measuredCollarCandidateBudget candidates w τ d A (12 * C₀ ^ 2) j := by
  unfold measuredCollarScore measuredCollarCandidateBudget
  rw [Finset.sum_add_distrib]
  apply add_le_add_right
  calc
    _ ≤ ∑ k ∈ candidates j, (12 * C₀ ^ 2) *
        (A j ^ 2 * (w j k ^ 2 + τ j k ^ 2) + d j k * (w j k + τ j k) + d j k ^ 2) :=
      Finset.sum_le_sum fun k hk => measuredCollarAllowance_sq_le (ha k hk).1 (ha k hk).2.1
        (ha k hk).2.2 (hw k hk) (hτ k hk) (hd k hk) (hAllowance k hk).1 (hAllowance k hk).2
    _ ≤ _ := by
      rw [← Finset.mul_sum]
      apply mul_le_mul_of_nonneg_left _ (by positivity)
      have hMixed : (∑ k ∈ candidates j, d j k * (w j k + τ j k)) ≤
          Real.sqrt (∑ k ∈ candidates j, d j k ^ 2) *
            (Real.sqrt (∑ k ∈ candidates j, w j k ^ 2) +
              Real.sqrt (∑ k ∈ candidates j, τ j k ^ 2)) := by
        simp only [mul_add, Finset.sum_add_distrib]
        exact add_le_add (Real.sum_mul_le_sqrt_mul_sqrt (candidates j) (d j) (w j))
          (Real.sum_mul_le_sqrt_mul_sqrt (candidates j) (d j) (τ j))
      simp only [Finset.sum_add_distrib, ← Finset.mul_sum]
      exact add_le_add (add_le_add (le_refl _) hMixed) (le_refl _)

section GeometricCharges

variable {E H M : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M]
  {o : ManifoldOrientation I M 4} {source : SignedCollarMetric o}

private local instance : MeasurableSpace M := borel M

/-- The normalization `w² = 4(λ⁺(A) + λ⁻(A))` bounds each sign on the
same physical annulus. -/
theorem signedCollarRawCharge_le_of_curvatureSq {S : Set M} {w : ℝ}
    (hW : w ^ 2 = 4 * (source.charge .plus S + source.charge .minus S))
    (sign : CollarChirality) : source.charge sign S ≤ w ^ 2 / 4 := by
  have hPlus : 0 ≤ source.charge .plus S := measureReal_nonneg
  have hMinus : 0 ≤ source.charge .minus S := measureReal_nonneg
  cases sign <;> linarith only [hW, hPlus, hMinus]

/-- The chiral charge weighted by the square of the remaining cutoff. -/
noncomputable def signedCollarCutoffCharge (source : SignedCollarMetric o) (sign : CollarChirality)
    (S : Set M) (ψ : M → ℝ) : ℝ :=
  ∫ x in S, (1 - ψ x) ^ 2 ∂source.chiralMeasure sign

/-- The physical cutoff-weighted charge is bounded by the raw charge on
the identical region. -/
theorem signedCollarCutoffCharge_le_raw (sign : CollarChirality) {S : Set M} {ψ : M → ℝ}
    (hS : MeasurableSet S) (hψ : ∀ x ∈ S, ψ x ∈ Set.Icc (0 : ℝ) 1) :
    signedCollarCutoffCharge source sign S ψ ≤ source.charge sign S := by
  unfold signedCollarCutoffCharge SignedCollarMetric.charge
  have hConst : (∫ _ in S, (1 : ℝ) ∂source.chiralMeasure sign) =
      (source.chiralMeasure sign).real S := by rw [setIntegral_const, smul_eq_mul, mul_one]
  rw [← hConst]
  refine integral_mono_of_nonneg (Filter.Eventually.of_forall fun x => sq_nonneg (1 - ψ x))
    (integrable_const _) ?_
  filter_upwards [ae_restrict_mem (μ := source.chiralMeasure sign) hS] with x hx
  simpa only [one_pow] using
    pow_le_pow_left₀ (sub_nonneg.mpr (hψ x hx).2) (sub_le_self _ (hψ x hx).1) 2

/-- Once the actual estimates identify the two weighted charges with a
cutoff on these regions, their monotonicity and the raw bounds follow. -/
theorem SignedCollarCandidateControls.ofCutoffCharges
    [I.Boundaryless] [Nonempty M] {indices : Finset ι} {disk annulus : ι → Set M}
    {assembly : SignedCollarAssembly source indices disk annulus} (b : assembly.Estimates)
    {w allowance : ι → ℝ} (ψ : ι → M → ℝ)
    (hW : ∀ j ∈ indices, w j ^ 2 =
      4 * (source.charge .plus (annulus j) + source.charge .minus (annulus j)))
    (hψ : ∀ j ∈ indices, ∀ x ∈ annulus j, ψ j x ∈ Set.Icc (0 : ℝ) 1)
    (hJoined : ∀ j ∈ indices, ∀ sign,
      b.joinedWeighted j sign = signedCollarCutoffCharge source sign (annulus j) (ψ j))
    (hExterior : ∀ j ∈ indices, ∀ sign,
      b.exteriorWeighted j sign = signedCollarCutoffCharge source sign (annulus j \ disk j) (ψ j))
    (hJoinedError : ∀ j ∈ indices, ∀ sign,
      0 ≤ b.joinedAllowance j sign ∧ b.joinedAllowance j sign ≤ allowance j)
    (hExteriorError : ∀ j ∈ indices, ∀ sign,
      0 ≤ b.exteriorAllowance j sign ∧ b.exteriorAllowance j sign ≤ allowance j) :
    SignedCollarCandidateControls b w allowance where
  raw_le j hj := signedCollarRawCharge_le_of_curvatureSq (hW j hj)
  joined_weighted_le j hj sign := by
    rw [hJoined j hj sign]
    exact signedCollarCutoffCharge_le_raw sign (assembly.annulus_measurable j hj) (hψ j hj)
  exterior_weighted_le j hj sign := by
    rw [hExterior j hj sign]
    exact signedCollarCutoffCharge_le_raw sign
      ((assembly.annulus_measurable j hj).diff (assembly.disk_measurable j hj))
      (fun x hx => hψ j hj x hx.1)
  joined_error := hJoinedError
  exterior_error := hExteriorError

end GeometricCharges

section SelectedWidths

local notation "E₄" => EuclideanSpace ℝ (Fin 4)

variable {H M P : Type*}
  [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M] [Nonempty M] [TopologicalSpace P] [PreconnectedSpace P]
  {o : ManifoldOrientation I M 4} {source : SignedCollarMetric o} {indices : Finset ι}

/-- The strict same-type test uses pointwise refined cutoff bounds on the
candidate rows and an actual assembly on the exact minimizing widths. -/
theorem excludesStrictRepair_of_localMeasuredSelectedDiskCollars [Nonempty κ]
    (candidates : ι → Finset κ) (F : ι → κ → PartialDiffeomorph 𝓘(ℝ, E₄) I E₄ M ∞)
    (width : ι → κ → ℕ) (w τ d a allowance : ι → κ → ℝ)
    (A : ι → ℝ) (C₀ : ℝ) (core : ι → Set M)
    (hNonempty : ∀ j ∈ indices, (candidates j).Nonempty)
    (hCore : ∀ j ∈ indices, ∀ k ∈ candidates j, core j ⊆ selectedChartDisk (F j k))
    (ha : ∀ j ∈ indices, ∀ k ∈ candidates j, 0 ≤ a j k ∧ a j k ≤ A j ∧ a j k ≤ 1)
    (hw : ∀ j ∈ indices, ∀ k ∈ candidates j, 0 ≤ w j k)
    (hτ : ∀ j ∈ indices, ∀ k ∈ candidates j, 0 ≤ τ j k)
    (hd : ∀ j ∈ indices, ∀ k ∈ candidates j, 0 ≤ d j k)
    (hAllowance : ∀ j ∈ indices, ∀ k ∈ candidates j, 0 ≤ allowance j k ∧
      allowance j k ≤ measuredCollarLocalAllowance C₀ (a j k) (w j k) (τ j k) (d j k))
    (hRealize : ∀ pick : ι → κ,
      (∀ j ∈ indices, pick j ∈ candidates j ∧
        ∀ k ∈ candidates j, measuredCollarScore (w j (pick j)) (allowance j (pick j)) ≤
          measuredCollarScore (w j k) (allowance j k)) →
      ∃ (assembly : SelectedDiskSignedCollarAssembly source indices (fun j => F j (pick j))
          (fun j => width j (pick j))) (b : assembly.Estimates),
        Nonempty (SignedCollarCapTestPath assembly P) ∧
          SignedCollarCandidateControls b (fun j => w j (pick j))
            (fun j => allowance j (pick j))) :
    let Γ := measuredCollarGamma indices candidates
      (measuredCollarCandidateBudget candidates w τ d A (12 * C₀ ^ 2))
    0 < classYamabeFour o.dimension_eq source.metric →
    source.energy .plus + Γ < 2 * (4 * Real.pi ^ 2) →
    Γ + (source.energy .plus - sInf (geometricPositiveEnergies o)) <
      (∑ j ∈ indices, max (source.charge .plus (core j)) (source.charge .minus (core j))) →
    False :=
  excludesStrictRepair_of_measuredSelectedDiskCollarChoice candidates F width w τ d allowance
    A (12 * C₀ ^ 2) core hNonempty hCore
    (fun j hj => measuredCollarRowBudget_of_localAllowances candidates w τ d a allowance A C₀ j
      (ha j hj) (hw j hj) (hτ j hj) (hd j hj) (hAllowance j hj)) hRealize

end SelectedWidths

end SmoothPoincare
