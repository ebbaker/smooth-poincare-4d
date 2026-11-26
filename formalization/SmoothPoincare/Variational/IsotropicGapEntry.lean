import SmoothPoincare.Variational.EndpointSpectralDeficit

/-! # Physical entry estimates for the isotropic spectral gap

The physical metrics supply curvature moments separately at each index. The
limit argument uses their real-valued certificates, so the source types and
their frames can vary.
-/

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Integral.Measure Filter FirstOrderTwistor MeasureTheory
open SectionsAndConnections Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

/-- The largest signed eigenvalue of a trace-free chiral block controls its
squared Hilbert–Schmidt norm with the factors (3/2) and (6). -/
theorem orderedEndpointSpectrum_hilbertSchmidt_bounds
    (W : Matrix (Fin 3) (Fin 3) ℝ) (s : Fin 3 → ℝ)
    (h : OrderedEndpointSpectrum W s) (hTrace : W.trace = 0) :
    0 ≤ s 2 ∧ (3 / 2 : ℝ) * s 2 ^ 2 ≤ hilbertSchmidtSq W ∧
      hilbertSchmidtSq W ≤ 6 * s 2 ^ 2 := by
  have h02 := h.ordered (show (0 : Fin 3) ≤ 2 by decide)
  have h12 := h.ordered (show (1 : Fin 3) ≤ 2 by decide)
  obtain ⟨Q, hQ, rfl⟩ := h.diagonalization
  rw [Matrix.trace_mul_comm (Q * Matrix.diagonal s) Q.transpose, ← Matrix.mul_assoc,
    hQ, one_mul, Matrix.trace_diagonal, Fin.sum_univ_three] at hTrace
  have hNorm : hilbertSchmidtSq (Q * Matrix.diagonal s * Q.transpose) =
      s 0 ^ 2 + s 1 ^ 2 + s 2 ^ 2 := by
    rw [hilbertSchmidtSq_orthogonal_conjugate _ Q hQ]
    norm_num [hilbertSchmidtSq, Matrix.diagonal_apply, Fin.sum_univ_three]
  have hPair : s 0 + s 1 = -s 2 := by linarith only [hTrace]
  have hPairSq := congrArg (fun z : ℝ => z ^ 2) hPair
  have hPairMul := congrArg (fun z : ℝ => z * s 2) hPair
  have hProd := mul_nonneg (sub_nonneg.mpr h02) (sub_nonneg.mpr h12)
  refine ⟨by linarith only [hTrace, h02, h12], ?_, ?_⟩ <;> rw [hNorm]
  · nlinarith only [hPairSq, sq_nonneg (s 0 - s 1)]
  · nlinarith only [hPairSq, hPairMul, hProd]

/-- The conformal quantity evaluated using one physical chiral energy and the
squared spectral maximum moment. -/
noncomputable def isotropicGapQuantity (energy moment : ℝ) : ℝ :=
  4 * energy + 3 * moment

/-- The spectral Yamabe deficit associated with the same moment. -/
noncomputable def isotropicYamabeDeficit (moment yamabe : ℝ) : ℝ :=
  36 * moment - yamabe ^ 2

/-- Scalar data furnished indexwise by the normalized Euler identity,
signature and the actual chiral spectra. -/
structure IsotropicGapBounds (threshold energy moment ricci yamabe : ℝ) : Prop where
  balance : isotropicGapQuantity energy moment - 8 * threshold =
    ricci + isotropicYamabeDeficit moment yamabe / 12
  moment_lower : energy / 6 ≤ moment
  moment_upper : moment ≤ (4 / 3 : ℝ) * energy
  ricci_nonnegative : 0 ≤ ricci

theorem IsotropicGapBounds.quantity_sandwich {T e σ D Y : ℝ}
    (h : IsotropicGapBounds T e σ D Y) :
    (9 / 2 : ℝ) * e ≤ isotropicGapQuantity e σ ∧ isotropicGapQuantity e σ ≤ 8 * e := by
  unfold isotropicGapQuantity
  exact ⟨by linarith only [h.moment_lower], by linarith only [h.moment_upper]⟩

/-- Approaching (8T) forces both physical defects to zero. The energy bound
also gives a uniform eventual strict band below (2T), with margin (T/9).
The certificates are per index and impose no common source type. -/
theorem isotropicGap_smoothingEntry {T : ℝ} (hT : 0 < T)
    {energy moment ricci yamabe : ℕ → ℝ}
    (hBounds : ∀ i, IsotropicGapBounds T (energy i) (moment i) (ricci i) (yamabe i))
    (hDeficit : ∀ i, 0 ≤ isotropicYamabeDeficit (moment i) (yamabe i))
    (hLimit : Tendsto (fun i => isotropicGapQuantity (energy i) (moment i)) atTop (𝓝 (8 * T))) :
    Tendsto ricci atTop (𝓝 0) ∧
      Tendsto (fun i => isotropicYamabeDeficit (moment i) (yamabe i)) atTop (𝓝 0) ∧
      (∀ᶠ i in atTop, energy i < 2 * T - T / 9) := by
  have hGap : Tendsto (fun i => isotropicGapQuantity (energy i) (moment i) - 8 * T)
      atTop (𝓝 0) := by
    simpa only [sub_self] using hLimit.sub_const (8 * T)
  have hScaled : Tendsto (fun i => 12 * (isotropicGapQuantity (energy i) (moment i) - 8 * T))
      atTop (𝓝 0) := by
    simpa only [mul_zero] using hGap.const_mul (12 : ℝ)
  refine ⟨tendsto_const_nhds.squeeze hGap (fun i => (hBounds i).ricci_nonnegative) ?_,
    tendsto_const_nhds.squeeze hScaled hDeficit ?_, ?_⟩
  · intro i
    linarith only [(hBounds i).balance, hDeficit i]
  · intro i
    linarith only [(hBounds i).balance, (hBounds i).ricci_nonnegative]
  · filter_upwards [hLimit.eventually_lt_const (show 8 * T < 8 * T + T / 2 by linarith)] with i hi
    linarith only [(hBounds i).quantity_sandwich.1, hi]

section Physical

variable {E H M : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [Nonempty M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- The isotropic certificate uses the actual Riemannian volume and curvature
of this volume-one Yamabe metric. The strict spectral comparison follows
from the supplied Chen–Zhu hypothesis in the endpoint data. -/
theorem endpointPhysicalIsotropicGapBounds
    (o : ManifoldOrientation I M 4) (g : SmoothRiemannianMetric I M)
    (frame : ∀ x, OrientedOrthonormalFrameAt g o x) (plus minus : M → Fin 3 → ℝ)
    (h : EndpointPhysicalSpectralData o g frame plus minus) :
    let dV := riemannianVolumeMeasure I M g
    let e := chiralFrameEnergy g (fun x => geometricChiralBlock g o x (frame x))
    let σ := ∫ x, endpointTopWeyl (plus x) (minus x) ^ 2 ∂dV
    let D := ∫ x, endpointRicciDefectDensity g o x (frame x) ∂dV
    let Y := classYamabeFour o.dimension_eq g
    IsotropicGapBounds (4 * Real.pi ^ 2) e σ D Y ∧ 0 < isotropicYamabeDeficit σ Y := by
  intro dV e σ D Y
  let B := ∫ x, endpointSpectralDefectDensity (plus x) (minus x) ∂dV
  obtain ⟨hB, hRicci, hBNonneg, _⟩ := endpointPhysicalSpectralDeficit o g frame plus minus h
  change B = (4 / 3 : ℝ) * e - σ at hB
  change 0 ≤ B at hBNonneg
  have hMomentLower : e ≤ 6 * σ := by
    have hPoint (x : M) : hilbertSchmidtSq (geometricChiralBlock g o x (frame x)) ≤
        6 * endpointTopWeyl (plus x) (minus x) ^ 2 := by
      obtain ⟨hTop, _, hNorm⟩ := orderedEndpointSpectrum_hilbertSchmidt_bounds _
        (plus x) (h.plus_spectrum x) (trace_geometricChiralBlock g o x (frame x))
      have hTopBound : plus x 2 ≤ endpointTopWeyl (plus x) (minus x) := le_max_left _ _
      exact hNorm.trans (mul_le_mul_of_nonneg_left (pow_le_pow_left₀ hTop hTopBound 2) (by norm_num))
    calc
      e ≤ ∫ x, 6 * endpointTopWeyl (plus x) (minus x) ^ 2 ∂dV :=
        integral_mono h.plus_integrable (h.top_integrable.const_mul 6) hPoint
      _ = 6 * σ := by rw [integral_const_mul]
  have hScalar : (∫ x, metricScalarAt g x ^ 2 ∂dV) = Y ^ 2 := by
    simp [dV, Y, h.yamabe_scalar, h.volume_one, Measure.real_def]
  have hEuler := h.euler_two
  dsimp only at hEuler
  rw [h.signature_zero] at hEuler
  change 16 * Real.pi ^ 2 = e + e - D / 2 + (∫ x, metricScalarAt g x ^ 2 ∂dV) / 24 at hEuler
  rw [hScalar] at hEuler
  have hStrict : Y ^ 2 < 36 * σ := h.strict_chen_zhu
  refine ⟨⟨?_, by linarith only [hMomentLower], by linarith only [hB, hBNonneg], hRicci⟩, ?_⟩
  · unfold isotropicGapQuantity isotropicYamabeDeficit
    linarith only [hEuler]
  · exact sub_pos.mpr hStrict

end Physical

section VaryingSources

local notation "E₄" => EuclideanSpace ℝ (Fin 4)

variable {H M : ℕ → Type*} [∀ i, TopologicalSpace (H i)]
  {I : ∀ i, ModelWithCorners ℝ E₄ (H i)} [∀ i, (I i).Boundaryless]
  [∀ i, TopologicalSpace (M i)] [∀ i, ChartedSpace (H i) (M i)]
  [∀ i, IsManifold (I i) ∞ (M i)] [∀ i, T2Space (M i)]
  [∀ i, CompactSpace (M i)] [∀ i, Nonempty (M i)]

private local instance (i : ℕ) : MeasurableSpace (M i) := borel (M i)
private local instance (i : ℕ) : BorelSpace (M i) := ⟨rfl⟩

/-- The actual Ricci and spectral defects of any such sequence vanish at the
isotropic threshold. The manifold, orientation, metric and eigendata at each
index can vary. -/
theorem endpointPhysicalIsotropicGap_smoothingEntry
    (o : ∀ i, ManifoldOrientation (I i) (M i) 4)
    (g : ∀ i, SmoothRiemannianMetric (I i) (M i))
    (frame : ∀ i x, OrientedOrthonormalFrameAt (g i) (o i) x)
    (plus minus : ∀ i, M i → Fin 3 → ℝ)
    (h : ∀ i, EndpointPhysicalSpectralData (o i) (g i) (frame i) (plus i) (minus i)) :
    let dV := fun i => riemannianVolumeMeasure (I i) (M i) (g i)
    let e := fun i => chiralFrameEnergy (g i) (fun x => geometricChiralBlock (g i) (o i) x (frame i x))
    let σ := fun i => ∫ x, endpointTopWeyl (plus i x) (minus i x) ^ 2 ∂dV i
    let D := fun i => ∫ x, endpointRicciDefectDensity (g i) (o i) x (frame i x) ∂dV i
    let Y := fun i => classYamabeFour (o i).dimension_eq (g i)
    let T := 4 * Real.pi ^ 2
    Tendsto (fun i => isotropicGapQuantity (e i) (σ i)) atTop (𝓝 (8 * T)) →
      Tendsto D atTop (𝓝 0) ∧
        Tendsto (fun i => isotropicYamabeDeficit (σ i) (Y i)) atTop (𝓝 0) ∧
        (∀ᶠ i in atTop, e i < 2 * T - T / 9) := by
  intro dV e σ D Y T hLimit
  have hData (i : ℕ) := endpointPhysicalIsotropicGapBounds (o i) (g i) (frame i) (plus i) (minus i) (h i)
  exact isotropicGap_smoothingEntry (show 0 < T by dsimp [T]; positivity)
    (fun i => (hData i).1) (fun i => (hData i).2.le) hLimit

end VaryingSources

end SmoothPoincare
