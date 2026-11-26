import SmoothPoincare.Variational.BourStationary

/-! # Smooth physical cutoffs at arbitrary pointed radii

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
Actual serving model and effort are unavailable.
-/

noncomputable section

open DifferentialGeometry DifferentialGeometry.Geometry.Riemannian
  DifferentialGeometry.Geometry.Operator Filter Set
open scoped ContDiff ENNReal Manifold NNReal Topology

namespace SmoothPoincare

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [PreconnectedSpace M]

/-- A smooth cutoff on a physical ball with compact intermediate closed
ball. The same slope works for every positive radius, including large
radius on a noncompact carrier. -/
theorem bourSmoothPointedBallCutoff_of_compact [SigmaCompactSpace M]
    (g : SmoothRiemannianMetric I M) (x : M) {r : ℝ} (hr : 0 < r)
    (hCompact : IsCompact (riemannianClosedBallOf g x (3 * r / 4))) :
    ∃ f : C^∞⟮I, M; ℝ⟯, HasCompactSupport (f : M → ℝ) ∧
      tsupport (f : M → ℝ) ⊆ riemannianBallOf g x r ∧ (∀ z, f z ∈ Icc 0 1) ∧
      (∀ z ∈ riemannianBallOf g x (r / 2), f z = 1) ∧
      (∀ z ∉ riemannianBallOf g x r, f z = 0 ∧ normGradSqFun g f z = 0) ∧
      (∀ z, normGradSqFun g f z ≤ (bourCutoffSlope / r) ^ 2) := by
  let R := 3 * r / 4
  have hR : 0 < R := by dsimp [R]; positivity
  have hRr : R < r := by dsimp [R]; linarith
  let L : ℝ≥0 := ⟨1 / R, by positivity⟩
  let F := radialDistanceCutoff g x R
  let B := riemannianBallOf g x r
  have hclosed : IsClosed (riemannianClosedBallOf g x R) :=
    isClosed_le (continuous_riemannianEDist g x) continuous_const
  let ε : ℝ := min (1 / 12) (1 / (12 * r))
  have hε : 0 < ε := lt_min (by norm_num) (by positivity)
  have hεsmall : ε ≤ 1 / 12 := min_le_left _ _
  have hεscale : ε ≤ 1 / (12 * r) := min_le_right _ _
  have hsub : tsupport F ⊆ B := by
    have hsupp : Function.support F ⊆ riemannianClosedBallOf g x R := by
      intro z hz
      by_contra hOut
      exact hz (radialDistanceCutoff_eq_zero_of_not_mem_closedBall g x hR hOut)
    intro z hz
    exact lt_of_le_of_lt (closure_minimal hsupp hclosed hz)
      ((ENNReal.ofReal_lt_ofReal_iff hr).2 hRr)
  obtain ⟨u, hu, huCompact, huSupp, huClose, huDeriv⟩ :=
    Geometry.exists_contMDiff_approximation_of_lipschitz_hasCompactSupport (L := L) g
      (fun v w => by rw [← ENNReal.ofReal_coe_nnreal]; exact edist_radialDistanceCutoff_le g x hR v w)
      (hasCompactSupport_radialDistanceCutoff g x hR hCompact)
      (isOpen_lt (continuous_riemannianEDist g x) continuous_const) hsub
      hε
  let φ : ℝ → ℝ := fun t => Analysis.CutoffProfile.value (2 - 4 * t)
  let f : C^∞⟮I, M; ℝ⟯ := ⟨φ ∘ u,
    (Analysis.CutoffProfile.contDiff.contMDiff.comp
      (contMDiff_const.sub (contMDiff_const.mul hu)))⟩
  have hzero : φ 0 = 0 := Analysis.CutoffProfile.zero_of_two_le (by norm_num)
  have hSupport : tsupport (f : M → ℝ) ⊆ tsupport u := by
    apply closure_mono
    intro z hz hz'
    exact hz ((congrArg φ hz').trans hzero)
  have hfCompact : HasCompactSupport (f : M → ℝ) :=
    huCompact.of_isClosed_subset (isClosed_tsupport _) hSupport
  refine ⟨f, hfCompact, hSupport.trans huSupp,
    fun z => Analysis.CutoffProfile.mem_Icc _, ?_, ?_, ?_⟩
  · intro z hz
    have hdist : (riemannianEDistOf g x z).toReal < r / 2 :=
      (ENNReal.toReal_lt_toReal (riemannianEDistOf_ne_top g x z) ENNReal.ofReal_ne_top).2 hz
        |>.trans_eq (ENNReal.toReal_ofReal (by positivity))
    have hF : 1 / 3 ≤ F z := by
      apply le_trans _ (le_max_right _ _)
      change 1 / 3 ≤ 1 - (riemannianEDistOf g x z).toReal / R
      rw [le_sub_comm, div_le_iff₀ hR]
      dsimp [R]
      linarith
    have hPos : 1 / 4 ≤ u z := by linarith [(abs_lt.mp (huClose z)).1, hεsmall]
    exact Analysis.CutoffProfile.one_of_le_one (by linarith)
  · intro z hz
    have hLocal : u =ᶠ[𝓝 z] fun _ => (0 : ℝ) := by
      filter_upwards [(isClosed_tsupport u).isOpen_compl.mem_nhds (fun h => hz (huSupp h))] with w hw
      by_contra! hn
      exact hw (subset_tsupport u hn)
    have hLocal' : (f : M → ℝ) =ᶠ[𝓝 z] fun _ => (0 : ℝ) :=
      hLocal.mono fun w hw => by change φ (u w) = 0; rw [hw]; exact hzero
    exact ⟨hLocal'.eq_of_nhds, normGradSqFun_eq_zero_iff.2 (by
      rw [hLocal'.mfderiv_eq, mfderiv_const]; rfl)⟩
  · intro z
    have hDeriv (t : ℝ) : HasDerivAt φ
        (deriv Analysis.CutoffProfile.value (2 - 4 * t) * (-4)) t := by
      have ht : HasDerivAt (fun q : ℝ => 2 - 4 * q) (-4) t := by
        convert (hasDerivAt_const t (2 : ℝ)).sub ((hasDerivAt_id t).const_mul 4) using 1 <;> first | rfl | norm_num
      exact ((Analysis.CutoffProfile.contDiff.differentiable (by simp) _).hasDerivAt).comp t ht
    have hChain := mfderiv_comp z (hDeriv (u z)).hasFDerivAt.hasMFDerivAt.mdifferentiableAt
      (hu.mdifferentiable (by simp) z)
    have hm (v : TangentSpace I z) :
        (show ℝ from mfderiv I 𝓘(ℝ) f z v) =
          deriv Analysis.CutoffProfile.value (2 - 4 * u z) * (-4) *
            (show ℝ from mfderiv I 𝓘(ℝ) u z v) := by
      change (show ℝ from mfderiv I 𝓘(ℝ) (φ ∘ u) z v) = _
      rw [hChain, mfderiv_eq_fderiv, (hDeriv (u z)).hasFDerivAt.fderiv]
      exact mul_comm _ _
    let v := gradFun g f z
    have hn : 0 ≤ normGradSqFun g f z := normGradSqFun_nonneg g f z
    have hL : (L : ℝ) + ε ≤ 2 / r := by
      calc
        _ ≤ 1 / R + 1 / (12 * r) := add_le_add le_rfl hεscale
        _ = ((4 / 3 : ℝ) + 1 / 12) / r := by dsimp [R]; field_simp
        _ ≤ 2 / r := div_le_div_of_nonneg_right (by norm_num) hr.le
    have hb : normGradSqFun g f z ≤ (bourCutoffSlope / r) *
        Real.sqrt (normGradSqFun g f z) := by
      have he : (show ℝ from mfderiv I 𝓘(ℝ) f z v) = normGradSqFun g f z :=
        (inner_gradFun g f z v).symm
      calc
        _ = |(show ℝ from mfderiv I 𝓘(ℝ) f z v)| := by rw [he, abs_of_nonneg hn]
        _ = |deriv Analysis.CutoffProfile.value (2 - 4 * u z)| * 4 *
              |(show ℝ from mfderiv I 𝓘(ℝ) u z v)| := by
          rw [hm, abs_mul, abs_mul]
          norm_num
        _ ≤ Analysis.CutoffProfile.derivBound * 4 *
              (((L : ℝ) + ε) * Real.sqrt (normGradSqFun g f z)) := by
          exact mul_le_mul (mul_le_mul_of_nonneg_right
            (Analysis.CutoffProfile.abs_deriv_le_derivBound _) (by norm_num)) (huDeriv z v)
            (abs_nonneg _) (mul_nonneg Analysis.CutoffProfile.derivBound_nonneg (by norm_num))
        _ ≤ (bourCutoffSlope / r) * Real.sqrt (normGradSqFun g f z) := by
          rw [← mul_assoc]
          apply mul_le_mul_of_nonneg_right _ (Real.sqrt_nonneg _)
          calc
            _ ≤ Analysis.CutoffProfile.derivBound * 4 * (2 / r) :=
              mul_le_mul_of_nonneg_left hL (mul_nonneg Analysis.CutoffProfile.derivBound_nonneg (by norm_num))
            _ ≤ bourCutoffSlope / r := by
              rw [le_div_iff₀ hr]
              unfold bourCutoffSlope
              field_simp
              linarith
    by_cases hs : Real.sqrt (normGradSqFun g f z) = 0
    · rw [← Real.sq_sqrt hn, hs, zero_pow (by decide)]
      positivity
    · have hb' : Real.sqrt (normGradSqFun g f z) ≤ bourCutoffSlope / r := by
        have hpos : 0 < Real.sqrt (normGradSqFun g f z) :=
          lt_of_le_of_ne (Real.sqrt_nonneg _) (Ne.symm hs)
        apply le_of_mul_le_mul_right _ hpos
        rw [← pow_two, Real.sq_sqrt hn]
        exact hb
      rw [← Real.sq_sqrt hn]
      exact pow_le_pow_left₀ (Real.sqrt_nonneg _) hb' 2

/-- A connected pointed carrier with compact physical closed balls has
compactly supported cutoffs at every positive radius with the same slope.
Only compactness of the closed balls at the chosen center is required. -/
theorem bourSmoothPointedBallCutoff (g : SmoothRiemannianMetric I M) (x : M)
    (hCompact : ∀ R : ℝ, 0 < R → IsCompact (riemannianClosedBallOf g x R))
    {r : ℝ} (hr : 0 < r) :
    ∃ f : C^∞⟮I, M; ℝ⟯, HasCompactSupport (f : M → ℝ) ∧
      tsupport (f : M → ℝ) ⊆ riemannianBallOf g x r ∧ (∀ z, f z ∈ Icc 0 1) ∧
      (∀ z ∈ riemannianBallOf g x (r / 2), f z = 1) ∧
      (∀ z ∉ riemannianBallOf g x r, f z = 0 ∧ normGradSqFun g f z = 0) ∧
      (∀ z, normGradSqFun g f z ≤ (bourCutoffSlope / r) ^ 2) := by
  let U : ℕ → Set M := fun n => riemannianClosedBallOf g x ((n : ℝ) + 1)
  have hU : ⋃ n, U n = univ := by
    apply eq_univ_of_forall
    intro z
    obtain ⟨n, hn⟩ := exists_nat_ge (riemannianEDistOf g x z).toReal
    apply mem_iUnion.mpr
    refine ⟨n, ?_⟩
    change riemannianEDistOf g x z ≤ ENNReal.ofReal ((n : ℝ) + 1)
    rw [← ENNReal.ofReal_toReal (riemannianEDistOf_ne_top g x z)]
    exact ENNReal.ofReal_le_ofReal (hn.trans (by linarith))
  let _ : SigmaCompactSpace M := SigmaCompactSpace_iff_exists_compact_covering.mpr
    ⟨U, fun n => hCompact _ (by positivity), hU⟩
  exact bourSmoothPointedBallCutoff_of_compact g x hr (hCompact _ (by positivity))

end SmoothPoincare
