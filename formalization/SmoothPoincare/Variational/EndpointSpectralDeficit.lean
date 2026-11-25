import FirstOrderTwistor.GeometricCutDescent
import FirstOrderTwistor.SpinRicciForcing
import SmoothPoincare.Immersions.InducedBlock

/-! # The strict Chen–Zhu deficit in the physical Yamabe metric -/

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Integral.Measure Filter FirstOrderTwistor MeasureTheory
open SectionsAndConnections Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

/-- Increasing signed eigenvalues, with an orthogonal diagonalization of the
given Weyl block. The diagonalization is a pointwise certificate. -/
structure OrderedEndpointSpectrum (W : Matrix (Fin 3) (Fin 3) ℝ) (s : Fin 3 → ℝ) : Prop where
  ordered : Monotone s
  diagonalization : ∃ Q : Matrix (Fin 3) (Fin 3) ℝ,
    Q.transpose * Q = 1 ∧ W = Q * Matrix.diagonal s * Q.transpose

private theorem endpointSpectrum_trace (W : Matrix (Fin 3) (Fin 3) ℝ) (s : Fin 3 → ℝ)
    (h : OrderedEndpointSpectrum W s) : W.trace = s 0 + s 1 + s 2 := by
  obtain ⟨Q, hQ, rfl⟩ := h.diagonalization
  rw [Matrix.trace_mul_comm (Q * Matrix.diagonal s) Q.transpose, ← Matrix.mul_assoc, hQ, one_mul]
  simp [Matrix.trace_diagonal, Fin.sum_univ_three]

private theorem endpointSpectrum_norm (W : Matrix (Fin 3) (Fin 3) ℝ) (s : Fin 3 → ℝ)
    (h : OrderedEndpointSpectrum W s) : hilbertSchmidtSq W = s 0 ^ 2 + s 1 ^ 2 + s 2 ^ 2 := by
  obtain ⟨Q, hQ, rfl⟩ := h.diagonalization
  rw [hilbertSchmidtSq_orthogonal_conjugate _ Q hQ]
  norm_num [hilbertSchmidtSq, Matrix.diagonal_apply, Fin.sum_univ_three]

/-- The maximum of the two largest signed Weyl eigenvalues. -/
noncomputable def endpointTopWeyl (plus minus : Fin 3 → ℝ) : ℝ := max (plus 2) (minus 2)

/-- Both lower gaps and the square of the nondominant top eigenvalue contribute. -/
noncomputable def endpointSpectralDefectDensity (plus minus : Fin 3 → ℝ) : ℝ :=
  (plus 0 - plus 1) ^ 2 / 3 + (minus 0 - minus 1) ^ 2 / 3 + min (plus 2 ^ 2) (minus 2 ^ 2)

theorem endpointSpectralDefectDensity_nonneg (plus minus : Fin 3 → ℝ) :
    0 ≤ endpointSpectralDefectDensity plus minus := by
  unfold endpointSpectralDefectDensity
  positivity

/-- The exact relation between the two chiral Hilbert–Schmidt densities and
the spectral maximum. The ordering determines the largest signed values. -/
theorem endpointSpectralDefectDensity_eq
    (P N : Matrix (Fin 3) (Fin 3) ℝ) (plus minus : Fin 3 → ℝ)
    (hP : OrderedEndpointSpectrum P plus) (hN : OrderedEndpointSpectrum N minus)
    (hTrP : P.trace = 0) (hTrN : N.trace = 0) :
    endpointSpectralDefectDensity plus minus = (2 / 3 : ℝ) *
      (hilbertSchmidtSq P + hilbertSchmidtSq N) - endpointTopWeyl plus minus ^ 2 := by
  have hThree (W : Matrix (Fin 3) (Fin 3) ℝ) (s : Fin 3 → ℝ)
      (h : OrderedEndpointSpectrum W s) (hTrace : W.trace = 0) :
      0 ≤ s 2 ∧ (2 / 3 : ℝ) * hilbertSchmidtSq W = s 2 ^ 2 + (s 0 - s 1) ^ 2 / 3 := by
    have hz := (endpointSpectrum_trace W s h).symm.trans hTrace
    refine ⟨by linarith only [hz, h.ordered (show (0 : Fin 3) ≤ 2 by decide),
      h.ordered (show (1 : Fin 3) ≤ 2 by decide)], ?_⟩
    have hs : s 2 = -(s 0 + s 1) := by linarith only [hz]
    rw [endpointSpectrum_norm W s h, hs]
    ring
  obtain ⟨hp, hPnorm⟩ := hThree P plus hP hTrP
  obtain ⟨hn, hNnorm⟩ := hThree N minus hN hTrN
  unfold endpointSpectralDefectDensity endpointTopWeyl
  rcases le_total (plus 2) (minus 2) with h | h
  · rw [max_eq_right h, min_eq_left (by nlinarith only [h, hp, hn])]
    linarith only [hPnorm, hNnorm]
  · rw [max_eq_left h, min_eq_right (by nlinarith only [h, hp, hn])]
    linarith only [hPnorm, hNnorm]

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [Nonempty M]

private local instance : CompleteSpace E := FiniteDimensional.complete ℝ E
private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- The negative Weyl block of the same curvature and the same oriented frame. -/
noncomputable def endpointNegativeWeylBlock (g : SmoothRiemannianMetric I M)
    (o : ManifoldOrientation I M 4) (x : M) (frame : OrientedOrthonormalFrameAt g o x) :=
  traceFreeChiralBlock (antiSelfDualCurvatureBlock (metricCurvatureFrameTensor g o x frame))

/-- The squared physical trace-free Ricci norm in the actual metric frame.
`frameRicciTensor_metric` identifies the contracted curvature with Ricci. -/
noncomputable def endpointRicciDefectDensity (g : SmoothRiemannianMetric I M)
    (o : ManifoldOrientation I M 4) (x : M) (frame : OrientedOrthonormalFrameAt g o x) : ℝ :=
  ∑ a : Fin 4, ∑ b : Fin 4, (frameRicciTensor (metricCurvatureFrameTensor g o x frame) a b -
    (metricScalarAt g x / 4) * (if a = b then 1 else 0)) ^ 2

omit [CompactSpace M] [Nonempty M] in
theorem endpointRicciDefectDensity_eq_ricci (g : SmoothRiemannianMetric I M)
    (o : ManifoldOrientation I M 4) (x : M) (frame : OrientedOrthonormalFrameAt g o x) :
    endpointRicciDefectDensity g o x frame =
      ∑ a : Fin 4, ∑ b : Fin 4, (ricciTensor g x (frame.basis b) (frame.basis a) -
        (metricScalarAt g x / 4) * (if a = b then 1 else 0)) ^ 2 := by
  simp only [endpointRicciDefectDensity, frameRicciTensor_metric]

/-- The physical normalized data and the imported geometric identities. The
Euler identity uses the actual scalar square integral and both chiral charges. -/
structure EndpointPhysicalSpectralData (o : ManifoldOrientation I M 4)
    (g : SmoothRiemannianMetric I M) (frame : ∀ x, OrientedOrthonormalFrameAt g o x)
    (plus minus : M → Fin 3 → ℝ) : Prop where
  positive : 0 < classYamabeFour o.dimension_eq g
  volume_one : riemannianVolumeMeasure I M g univ = 1
  yamabe_scalar : ∀ x, metricScalarAt g x = classYamabeFour o.dimension_eq g
  plus_spectrum : ∀ x, OrderedEndpointSpectrum (geometricChiralBlock g o x (frame x)) (plus x)
  minus_spectrum : ∀ x, OrderedEndpointSpectrum (endpointNegativeWeylBlock g o x (frame x)) (minus x)
  plus_integrable : Integrable (fun x => hilbertSchmidtSq (geometricChiralBlock g o x (frame x)))
    (riemannianVolumeMeasure I M g)
  minus_integrable : Integrable (fun x => hilbertSchmidtSq (endpointNegativeWeylBlock g o x (frame x)))
    (riemannianVolumeMeasure I M g)
  ricci_integrable : Integrable (fun x => endpointRicciDefectDensity g o x (frame x))
    (riemannianVolumeMeasure I M g)
  top_integrable : Integrable (fun x => endpointTopWeyl (plus x) (minus x) ^ 2)
    (riemannianVolumeMeasure I M g)
  signature_zero : chiralFrameEnergy g (fun x => endpointNegativeWeylBlock g o x (frame x)) =
    chiralFrameEnergy g (fun x => geometricChiralBlock g o x (frame x))
  euler_two :
    let dV := riemannianVolumeMeasure I M g
    16 * Real.pi ^ 2 =
      chiralFrameEnergy g (fun x => geometricChiralBlock g o x (frame x)) +
      chiralFrameEnergy g (fun x => endpointNegativeWeylBlock g o x (frame x)) -
      (∫ x, endpointRicciDefectDensity g o x (frame x) ∂dV) / 2 +
      (∫ x, metricScalarAt g x ^ 2 ∂dV) / 24
  strict_chen_zhu : (classYamabeFour o.dimension_eq g) ^ 2 < 36 *
    (∫ x, endpointTopWeyl (plus x) (minus x) ^ 2 ∂riemannianVolumeMeasure I M g)

/-- On the physical volume-one Yamabe metric, the strict spectral inequality
and the integrated Euler and signature identities give the strict deficit. -/
theorem endpointPhysicalSpectralDeficit
    (o : ManifoldOrientation I M 4) (g : SmoothRiemannianMetric I M)
    (frame : ∀ x, OrientedOrthonormalFrameAt g o x) (plus minus : M → Fin 3 → ℝ)
    (h : EndpointPhysicalSpectralData o g frame plus minus) :
    let dV := riemannianVolumeMeasure I M g
    let e := chiralFrameEnergy g (fun x => geometricChiralBlock g o x (frame x))
    let D := ∫ x, endpointRicciDefectDensity g o x (frame x) ∂dV
    let B := ∫ x, endpointSpectralDefectDensity (plus x) (minus x) ∂dV
    let Lsq := ∫ x, endpointTopWeyl (plus x) (minus x) ^ 2 ∂dV
    B = (4 / 3 : ℝ) * e - Lsq ∧ 0 ≤ D ∧ 0 ≤ B ∧
      D + 3 * B < 8 * (e - 4 * Real.pi ^ 2) := by
  intro dV e D B Lsq
  have hPoint (x : M) : endpointSpectralDefectDensity (plus x) (minus x) =
      (2 / 3 : ℝ) * (hilbertSchmidtSq (geometricChiralBlock g o x (frame x)) +
        hilbertSchmidtSq (endpointNegativeWeylBlock g o x (frame x))) -
        endpointTopWeyl (plus x) (minus x) ^ 2 :=
    endpointSpectralDefectDensity_eq _ _ _ _ (h.plus_spectrum x) (h.minus_spectrum x)
      (trace_geometricChiralBlock g o x (frame x)) (trace_traceFreeChiralBlock _)
  have hB : B = (4 / 3 : ℝ) * e - Lsq := by
    have hScaled : Integrable (fun x => (2 / 3 : ℝ) *
        (hilbertSchmidtSq (geometricChiralBlock g o x (frame x)) +
          hilbertSchmidtSq (endpointNegativeWeylBlock g o x (frame x)))) dV :=
      (h.plus_integrable.add h.minus_integrable).const_mul (2 / 3 : ℝ)
    have hSum : (∫ x, hilbertSchmidtSq (geometricChiralBlock g o x (frame x)) +
        hilbertSchmidtSq (endpointNegativeWeylBlock g o x (frame x)) ∂dV) =
        e + chiralFrameEnergy g (fun x => endpointNegativeWeylBlock g o x (frame x)) :=
      integral_add h.plus_integrable h.minus_integrable
    calc
      B = ∫ x, (2 / 3 : ℝ) * (hilbertSchmidtSq (geometricChiralBlock g o x (frame x)) +
          hilbertSchmidtSq (endpointNegativeWeylBlock g o x (frame x))) -
          endpointTopWeyl (plus x) (minus x) ^ 2 ∂dV := integral_congr_ae (Eventually.of_forall hPoint)
      _ = _ := by
        rw [integral_sub hScaled h.top_integrable, integral_const_mul, hSum]
        change (2 / 3 : ℝ) * (e + chiralFrameEnergy g
          (fun x => endpointNegativeWeylBlock g o x (frame x))) - Lsq = _
        rw [h.signature_zero]
        ring
  have hD₀ : 0 ≤ D := integral_nonneg fun _ =>
    Finset.sum_nonneg fun _ _ => Finset.sum_nonneg fun _ _ => sq_nonneg _
  have hB₀ : 0 ≤ B := integral_nonneg fun x => endpointSpectralDefectDensity_nonneg (plus x) (minus x)
  have hScalar : (∫ x, metricScalarAt g x ^ 2 ∂riemannianVolumeMeasure I M g) =
      (classYamabeFour o.dimension_eq g) ^ 2 := by
    simp [h.yamabe_scalar, h.volume_one, Measure.real_def]
  have hEuler := h.euler_two
  dsimp only at hEuler
  rw [hScalar, h.signature_zero] at hEuler
  change 16 * Real.pi ^ 2 = e + e - D / 2 + (classYamabeFour o.dimension_eq g) ^ 2 / 24 at hEuler
  have hStrict : (classYamabeFour o.dimension_eq g) ^ 2 < 36 * Lsq := h.strict_chen_zhu
  exact ⟨hB, hD₀, hB₀, by linarith only [hEuler, hB, hStrict]⟩

/-- The physical Ricci and two-chirality spectral deficits vanish along the
same sequence whose chiral energies approach the recognition threshold. -/
theorem endpointPhysicalSpectralLimits
    (o : ManifoldOrientation I M 4) (g : ℕ → SmoothRiemannianMetric I M)
    (frame : ∀ i x, OrientedOrthonormalFrameAt (g i) o x)
    (plus minus : ℕ → M → Fin 3 → ℝ)
    (h : ∀ i, EndpointPhysicalSpectralData o (g i) (frame i) (plus i) (minus i))
    (he : Tendsto (fun i => chiralFrameEnergy (g i)
      (fun x => geometricChiralBlock (g i) o x (frame i x))) atTop (𝓝 (4 * Real.pi ^ 2))) :
    Tendsto (fun i => ∫ x, endpointRicciDefectDensity (g i) o x (frame i x)
      ∂riemannianVolumeMeasure I M (g i)) atTop (𝓝 0) ∧
    Tendsto (fun i => ∫ x, endpointSpectralDefectDensity (plus i x) (minus i x)
      ∂riemannianVolumeMeasure I M (g i)) atTop (𝓝 0) := by
  let e i := chiralFrameEnergy (g i) (fun x => geometricChiralBlock (g i) o x (frame i x))
  let D i := ∫ x, endpointRicciDefectDensity (g i) o x (frame i x) ∂riemannianVolumeMeasure I M (g i)
  let B i := ∫ x, endpointSpectralDefectDensity (plus i x) (minus i x) ∂riemannianVolumeMeasure I M (g i)
  let T := 4 * Real.pi ^ 2
  have he' : Tendsto e atTop (𝓝 T) := he
  have hGap : Tendsto (fun i => e i - T) atTop (𝓝 0) := by
    simpa only [sub_self] using he'.sub (tendsto_const_nhds (x := T))
  have hUpper : Tendsto (fun i => 8 * (e i - T)) atTop (𝓝 0) := by
    simpa only [mul_zero] using hGap.const_mul (8 : ℝ)
  have hBounds (i : ℕ) : 0 ≤ D i ∧ 0 ≤ B i ∧ D i + 3 * B i < 8 * (e i - T) :=
    (endpointPhysicalSpectralDeficit o (g i) (frame i) (plus i) (minus i) (h i)).2
  refine ⟨tendsto_const_nhds.squeeze hUpper (fun i => (hBounds i).1) ?_,
    tendsto_const_nhds.squeeze hUpper (fun i => (hBounds i).2.1) ?_⟩
  · intro i
    linarith only [(hBounds i).2.1, (hBounds i).2.2]
  · intro i
    linarith only [(hBounds i).1, (hBounds i).2.1, (hBounds i).2.2]

end SmoothPoincare
