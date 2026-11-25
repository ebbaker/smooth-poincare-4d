import FirstOrderTwistor.SpinRicciForcing

/-! # Sharp Hessian bound for the projected self-dual curl
Prepared for Edward B. Baker III on 25 November 2026 with OpenAI Codex.
The pointwise estimate is in the positive quaternionic spin frame of MATCH-E11 (5).
-/

namespace FirstOrderTwistor

open scoped Quaternion RealInnerProductSpace

/-- The orthogonal Clifford projection is a contraction for the Hilbert sum norm. -/
theorem selfDualCliffordProjection_normSq_le (T : Fin 3 → ℍ[ℝ]) :
    ∑ a, Quaternion.normSq (selfDualCliffordProjection T a) ≤ ∑ a, Quaternion.normSq (T a) := by
  let P := selfDualCliffordProjection T
  have ho := selfDualCliffordProjection_orthogonal T P (selfDualCliffordTrace_projection T)
  have he (a : Fin 3) : ‖T a‖ ^ 2 = ‖P a‖ ^ 2 + 2 * ⟪P a, T a - P a⟫ + ‖T a - P a‖ ^ 2 := by
    have h := norm_add_sq_real (P a) (T a - P a)
    rw [show P a + (T a - P a) = T a by abel] at h
    linarith
  have hs : (∑ a, ‖T a‖ ^ 2) = ∑ a, (‖P a‖ ^ 2 + 2 * ⟪P a, T a - P a⟫ + ‖T a - P a‖ ^ 2) :=
    Finset.sum_congr rfl (fun a _ => he a)
  simp only [Finset.sum_add_distrib, ← Finset.mul_sum] at hs
  change (∑ a, ⟪P a, T a - P a⟫) = 0 at ho
  simp only [Quaternion.normSq_eq_norm_mul_self, ← sq]
  change ∑ a, ‖P a‖ ^ 2 ≤ ∑ a, ‖T a‖ ^ 2
  linarith only [ho, hs, Finset.sum_nonneg (s := Finset.univ) (fun a _ => sq_nonneg ‖T a - P a‖)]

private theorem quaternion_four_alternating (x y z w : ℍ[ℝ]) :
    Quaternion.normSq ((Real.sqrt 2 / 2) • ((x-y)+(z-w))) ≤
    2 * (Quaternion.normSq x + Quaternion.normSq y + Quaternion.normSq z + Quaternion.normSq w) := by
  have ht : ‖(x-y)+(z-w)‖ ≤ ‖x‖ + ‖y‖ + ‖z‖ + ‖w‖ := by
    linarith only [norm_add_le (x-y) (z-w), norm_sub_le x y, norm_sub_le z w]
  have ht2 := sq_le_sq' (by linarith [norm_nonneg ((x-y)+(z-w))] :
    -(‖x‖ + ‖y‖ + ‖z‖ + ‖w‖) ≤ ‖(x-y)+(z-w)‖) ht
  rw [Quaternion.normSq_smul]
  simp only [Quaternion.normSq_eq_norm_mul_self, ← sq, div_pow, Real.sq_sqrt (by norm_num : (0:ℝ) ≤ 2)]
  nlinarith only [ht2, sq_nonneg (‖x‖-‖y‖), sq_nonneg (‖x‖-‖z‖), sq_nonneg (‖x‖-‖w‖),
    sq_nonneg (‖y‖-‖z‖), sq_nonneg (‖y‖-‖w‖), sq_nonneg (‖z‖-‖w‖)]

/-- Self-dual alternation uses twelve disjoint off-diagonal slots of the Hessian. -/
theorem selfDualAlternation_normSq_le (B : Fin 4 → Fin 4 → ℍ[ℝ]) :
    ∑ a, Quaternion.normSq (selfDualAlternation B a) ≤
      2 * ∑ i, ∑ j, Quaternion.normSq (B i j) := by
  have h₀ := quaternion_four_alternating (B 0 1) (B 1 0) (B 2 3) (B 3 2)
  have h₁ := quaternion_four_alternating (B 0 2) (B 2 0) (B 3 1) (B 1 3)
  have h₂ := quaternion_four_alternating (B 0 3) (B 3 0) (B 1 2) (B 2 1)
  simp only [smul_add] at h₀ h₁ h₂
  simp [Fin.sum_univ_three, Fin.sum_univ_four, selfDualAlternation, selfDualFirstWedge,
    selfDualSecondWedge]
  linarith only [h₀, h₁, h₂, (show 0 ≤ Quaternion.normSq (B 0 0) from Quaternion.normSq_nonneg), (show 0 ≤ Quaternion.normSq (B 1 1) from Quaternion.normSq_nonneg),
    (show 0 ≤ Quaternion.normSq (B 2 2) from Quaternion.normSq_nonneg), (show 0 ≤ Quaternion.normSq (B 3 3) from Quaternion.normSq_nonneg)]

/-- On a harmonic two-jet the twistor curl is the alternation of the spin Hessian. -/
theorem harmonicProjectedHessian_normSq_le (B : Fin 4 → Fin 4 → ℍ[ℝ])
    (hD : ∀ i, frameDiracDerivative B i = 0) :
    ∑ a, Quaternion.normSq (selfDualCliffordProjection (frameTwistorCurl B) a) ≤
      2 * ∑ i, ∑ j, Quaternion.normSq (B i j) := by
  have hcurl : frameTwistorCurl B = selfDualAlternation B := by
    change selfDualAlternation (B + fun i j => (1/4 : ℝ) • (negativeCliffordVector j * frameDiracDerivative B i)) = _
    congr 1
    funext i j
    simp [hD]
  rw [hcurl]
  exact (selfDualCliffordProjection_normSq_le _).trans (selfDualAlternation_normSq_le B)

open DifferentialGeometry
open scoped Manifold ContDiff

/-- MATCH-E11 (5), summed over an arbitrary finite family in an actual metric frame. -/
theorem metricHarmonicFamily_weylMass_le_hessian {E H M ι : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [TopologicalSpace M]
    [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [BoundarylessManifold I M]
    (g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4) (x : M)
    (frame : OrientedOrthonormalFrameAt g o x) (J : Finset ι)
    (ψ : ι → ℍ[ℝ]) (B : ι → Fin 4 → Fin 4 → ℍ[ℝ])
    (hJet : ∀ a ∈ J, SpinFrameCommutator (metricCurvatureFrameTensor g o x frame) (ψ a) (B a))
    (hD : ∀ a ∈ J, ∀ i, frameDiracDerivative (B a) i = 0) :
    SectionsAndConnections.hilbertSchmidtSq (geometricChiralBlock g o x frame) *
      (∑ a ∈ J, Quaternion.normSq (ψ a)) ≤
        4 * ∑ a ∈ J, ∑ i, ∑ j, Quaternion.normSq (B a i j) := by
  rw [Finset.mul_sum, Finset.mul_sum]
  apply Finset.sum_le_sum
  intro a ha
  have hid := metricProjectedFrameTwistorCurl_normSq g o x frame (hJet a ha)
  have hbound := harmonicProjectedHessian_normSq_le (B a) (hD a ha)
  linarith only [hid, hbound]

end FirstOrderTwistor
