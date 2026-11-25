import SmoothPoincare.Variational.SpliceDensity
import DifferentialGeometry.Analysis.Calculus.ContDiff.OrthonormalBasis

/-! # Oriented frame transport on a positive chart Gram matrix -/

open Filter Module Set
open scoped ContDiff Topology

namespace SmoothPoincare

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

abbrev ChartGramForm (E : Type*) [NormedAddCommGroup E] [NormedSpace ℝ E] :=
  E →L[ℝ] E →L[ℝ] ℝ

/-- The positive symmetric bilinear forms in one fixed chart model. -/
def positiveChartGram : Set (ChartGramForm E) :=
  {B | (∀ v w, B v w = B w v) ∧ ∀ v, v ≠ 0 → 0 < B v v}

/-- The closed coefficient window, with a lower ellipticity bound in the
fixed chart norm and an upper bound in bilinear operator norm. -/
def chartGramWindow (lower upper : ℝ) : Set (ChartGramForm E) :=
  Metric.closedBall 0 upper ∩
    ({B | ∀ v w, B v w = B w v} ∩ {B | ∀ v, lower * ‖v‖ ^ 2 ≤ B v v})

theorem chartGramWindow_subset_positive (lower upper : ℝ) (hLower : 0 < lower) :
    chartGramWindow (E := E) lower upper ⊆ positiveChartGram := by
  intro B hB
  exact ⟨hB.2.1, fun v hv =>
    (mul_pos hLower (sq_pos_of_pos (norm_pos_iff.mpr hv))).trans_le (hB.2.2 v)⟩

variable [FiniteDimensional ℝ E]

/-- Finite-dimensional Heine–Borel compactness for the coefficient window. -/
theorem isCompact_chartGramWindow (lower upper : ℝ) :
    IsCompact (chartGramWindow (E := E) lower upper) := by
  let : FiniteDimensional ℝ (E →L[ℝ] ℝ) := ContinuousLinearMap.finiteDimensional
  let : FiniteDimensional ℝ (ChartGramForm E) := ContinuousLinearMap.finiteDimensional
  let : ProperSpace (ChartGramForm E) := FiniteDimensional.proper ℝ (ChartGramForm E)
  apply (Metric.isCompact_iff_isClosed_bounded (s := chartGramWindow (E := E) lower upper)).mpr
  constructor
  · have heval (v w : E) : Continuous (fun B : ChartGramForm E => B v w) :=
      ((ContinuousLinearMap.apply ℝ ℝ w).comp
        (ContinuousLinearMap.apply ℝ (E →L[ℝ] ℝ) v)).continuous
    have hs : IsClosed {B : ChartGramForm E | ∀ v w, B v w = B w v} := by
      simp only [Set.ofPred_forall]
      exact isClosed_iInter fun v => isClosed_iInter fun w => isClosed_eq (heval v w) (heval w v)
    have hl : IsClosed {B : ChartGramForm E | ∀ v, lower * ‖v‖ ^ 2 ≤ B v v} := by
      simp only [Set.ofPred_forall]
      exact isClosed_iInter fun v => isClosed_le continuous_const (heval v v)
    exact (Metric.isClosed_closedBall (x := (0 : ChartGramForm E)) (ε := upper)).inter
      (hs.inter hl)
  · exact (Metric.isBounded_closedBall (x := (0 : ChartGramForm E)) (r := upper)).subset
      inter_subset_left

/-- A smooth choice of oriented orthonormal basis on the entire positive
cone, relative to the orientation of one fixed reference basis. The
underlying smooth choice is obtained by varying-metric Gram–Schmidt. -/
theorem exists_orientedMovingFrame (e : Basis (Fin 4) ℝ E) :
    ∃ b : ChartGramForm E → Basis (Fin 4) ℝ E,
      (∀ i, ContDiffOn ℝ ∞ (fun B => b B i) positiveChartGram) ∧
      ∀ B ∈ positiveChartGram,
        (b B).orientation = e.orientation ∧
        ∀ i j, B (b B i) (b B j) = if i = j then 1 else 0 := by
  classical
  obtain ⟨raw, hsmooth, horth⟩ := ContDiffOn.exists_orthonormal_basis
    (B := id) (s := positiveChartGram) (n := ∞) contDiff_id.contDiffOn e
    (fun _ h => h.1) (fun _ h => h.2)
  let b (B : ChartGramForm E) := (raw B).adjustToOrientation e.orientation
  let d (B : ChartGramForm E) := e.det (raw B)
  have hd : ContinuousOn d positiveChartGram := by
    have hcoord (i j : Fin 4) :
        ContinuousOn (fun B => e.coord i (raw B j)) positiveChartGram :=
      (e.coord i).toContinuousLinearMap.continuous.comp_continuousOn (hsmooth j).continuousOn
    have hmat : ContinuousOn (fun B => e.toMatrix (raw B)) positiveChartGram := by
      apply continuousOn_pi.mpr
      intro i
      apply continuousOn_pi.mpr
      intro j
      exact hcoord i j
    exact continuous_id.matrix_det.comp_continuousOn hmat
  have hsign (B : ChartGramForm E) :
      (raw B).orientation = e.orientation ↔ 0 < d B := by
    rw [eq_comm]
    exact e.orientation_eq_iff_det_pos (raw B)
  refine ⟨b, ?_, ?_⟩
  · intro i B hB
    rcases lt_or_gt_of_ne (e.isUnit_det (raw B)).ne_zero with hn | hp
    · have hnear := (hd B hB).eventually (Iio_mem_nhds hn)
      have hneg (B' : ChartGramForm E) (h : d B' < 0) :
          b B' i = ((raw B').unitsSMul (Function.update 1 (Classical.arbitrary (Fin 4)) (-1))) i := by
        have hne : (raw B').orientation ≠ e.orientation := fun h' => (not_lt_of_gt h) ((hsign B').mp h')
        simp [b, Basis.adjustToOrientation, hne]
      have hbase : ContDiffWithinAt ℝ ∞
          (fun B' => ((raw B').unitsSMul (Function.update 1 (Classical.arbitrary (Fin 4)) (-1))) i)
          positiveChartGram B := by
        simp only [Basis.unitsSMul_apply]
        exact (hsmooth i B hB).const_smul _
      exact hbase.congr_of_eventuallyEq (hnear.mono hneg) (hneg B hn)
    · have hnear := (hd B hB).eventually (Ioi_mem_nhds hp)
      have hpos (B' : ChartGramForm E) (h : 0 < d B') : b B' i = raw B' i := by
        simp [b, Basis.adjustToOrientation, (hsign B').mpr h]
      exact (hsmooth i B hB).congr_of_eventuallyEq (hnear.mono hpos) (hpos B hp)
  · intro B hB
    have ho := horth B hB
    dsimp only [id_eq] at ho
    refine ⟨(raw B).orientation_adjustToOrientation e.orientation, ?_⟩
    intro i j
    by_cases hij : i = j
    · subst j
      rcases (raw B).adjustToOrientation_apply_eq_or_eq_neg e.orientation i with h | h <;>
        simp [b, h, ho.1 i]
    · rcases (raw B).adjustToOrientation_apply_eq_or_eq_neg e.orientation i with hi | hi <;>
        rcases (raw B).adjustToOrientation_apply_eq_or_eq_neg e.orientation j with hj | hj <;>
        simp [b, hi, hj, hij, ho.2 i j hij]

omit [FiniteDimensional ℝ E] in
/-- The lower ellipticity bound controls each moving unit vector's norm in
the fixed chart. -/
theorem norm_chartGramUnit_le {lower upper : ℝ} (hLower : 0 < lower)
    {B : ChartGramForm E} (hB : B ∈ chartGramWindow lower upper)
    {v : E} (hv : B v v = 1) :
    ‖v‖ ≤ Real.sqrt lower⁻¹ := by
  apply (sq_le_sq₀ (norm_nonneg _) (Real.sqrt_nonneg _)).mp
  rw [Real.sq_sqrt (inv_nonneg.mpr hLower.le), ← one_div, le_div_iff₀ hLower]
  simpa [hv, mul_comm] using hB.2.2 v

private abbrev FourSlots := (Fin 4 × Fin 4) × (Fin 4 × Fin 4)

private abbrev CurvatureCoefficients := EuclideanSpace ℝ FourSlots

private noncomputable def curvatureSlotMatrix (e : Basis (Fin 4) ℝ E) (v : Fin 4 → E) :
    Matrix FourSlots FourSlots ℝ :=
  fun p q => e.coord q.1.1 (v p.1.1) * e.coord q.1.2 (v p.1.2) *
    e.coord q.2.1 (v p.2.1) * e.coord q.2.2 (v p.2.2)

/-- Transport four lowered curvature slots from a fixed chart basis to the
moving frame. The last pair in both arrays uses the order of
`FirstOrderTwistor.metricCurvatureFrameTensor`. -/
noncomputable def movingCurvatureSlots (e : Basis (Fin 4) ℝ E) (v : Fin 4 → E) :
    CurvatureCoefficients →L[ℝ] CurvatureCoefficients :=
  ((Matrix.toEuclideanLin).trans LinearMap.toContinuousLinearMap) (curvatureSlotMatrix e v)

set_option maxRecDepth 2000 in
omit [FiniteDimensional ℝ E] in
theorem movingCurvatureSlots_apply (e : Basis (Fin 4) ℝ E) (v : Fin 4 → E)
    (R : CurvatureCoefficients) (p : FourSlots) :
    movingCurvatureSlots e v R p = ∑ q : FourSlots,
      e.coord q.1.1 (v p.1.1) * e.coord q.1.2 (v p.1.2) *
      e.coord q.2.1 (v p.2.1) * e.coord q.2.2 (v p.2.2) * R q := by
  change ((Matrix.toEuclideanLin (curvatureSlotMatrix e v)) R : CurvatureCoefficients) p = _
  rw [Matrix.toLpLin_apply]
  rfl

private def slotTuple : FourSlots ≃ (Fin 4 → Fin 4) where
  toFun p := ![p.1.1, p.1.2, p.2.2, p.2.1]
  invFun p := ((p 0, p 1), (p 3, p 2))
  left_inv p := by cases p; rfl
  right_inv p := by funext i; fin_cases i <;> rfl

/-- Ordered coefficients of a four-linear tensor, with the switched last
two entries that put sectional curvature on the wedge diagonal. -/
def chartCurvatureCoefficients (v : Fin 4 → E)
    (R : MultilinearMap ℝ (fun _ : Fin 4 => E) ℝ) : CurvatureCoefficients :=
  WithLp.toLp 2 fun p => R fun i => v (slotTuple p i)

omit [FiniteDimensional ℝ E] in
/-- The coefficient operator performs the actual evaluation of all four
slots in the moving frame. -/
theorem movingCurvatureSlots_tensor (e : Basis (Fin 4) ℝ E) (v : Fin 4 → E)
    (R : MultilinearMap ℝ (fun _ : Fin 4 => E) ℝ) :
    movingCurvatureSlots e v (chartCurvatureCoefficients e R) =
      chartCurvatureCoefficients v R := by
  ext p
  rw [movingCurvatureSlots_apply]
  change (∑ q : FourSlots, _ * R (fun i => e (slotTuple q i))) = R (fun i => v (slotTuple p i))
  symm
  calc
    _ = R (fun i => ∑ j, e.coord j (v (slotTuple p i)) • e j) := by
      congr 1
      funext i
      exact (e.sum_repr _).symm
    _ = ∑ q : Fin 4 → Fin 4, R (fun i => e.coord (q i) (v (slotTuple p i)) • e (q i)) :=
      R.map_sum _
    _ = ∑ q : FourSlots, R (fun i => e.coord (slotTuple q i) (v (slotTuple p i)) • e (slotTuple q i)) :=
      (slotTuple.sum_comp _).symm
    _ = _ := by
      apply Finset.sum_congr rfl
      intro q _
      rw [R.map_smul_univ]
      simp only [Fin.prod_univ_four, smul_eq_mul]
      change (e.coord q.1.1 (v p.1.1) * e.coord q.1.2 (v p.1.2) *
        e.coord q.2.2 (v p.2.2) * e.coord q.2.1 (v p.2.1)) * _ = _
      ring

theorem continuous_movingCurvatureSlots (e : Basis (Fin 4) ℝ E) :
    Continuous (movingCurvatureSlots e) := by
  have hMatrix : Continuous (curvatureSlotMatrix e) := by
    apply continuous_matrix
    intro p q
    have hc (i j : Fin 4) : Continuous (fun v : Fin 4 → E => e.coord j (v i)) :=
      (e.coord j).toContinuousLinearMap.continuous.comp (continuous_apply i)
    exact (((hc _ _).mul (hc _ _)).mul (hc _ _)).mul (hc _ _)
  let T : Matrix FourSlots FourSlots ℝ ≃ₗ[ℝ] CurvatureCoefficients →L[ℝ] CurvatureCoefficients :=
    (Matrix.toEuclideanLin).trans LinearMap.toContinuousLinearMap
  exact T.toLinearMap.toContinuousLinearMap.continuous.comp hMatrix

/-- Riemannian volume relative to Lebesgue coordinates in the fixed basis. -/
noncomputable def chartGramDensity (e : Basis (Fin 4) ℝ E) (B : ChartGramForm E) : ℝ :=
  Real.sqrt (Matrix.det (Matrix.of fun i j : Fin 4 => B (e i) (e j)))

omit [FiniteDimensional ℝ E] in
theorem continuous_chartGramDensity (e : Basis (Fin 4) ℝ E) :
    Continuous (chartGramDensity e) := by
  apply Continuous.sqrt
  apply Continuous.matrix_det
  apply continuous_matrix
  intro i j
  exact ((ContinuousLinearMap.apply ℝ ℝ (e j)).comp
    (ContinuousLinearMap.apply ℝ (E →L[ℝ] ℝ) (e i))).continuous

/-- The positive chiral compression in the supplied frame, weighted by the
square root of the chart volume density for a fixed Lebesgue measure. -/
noncomputable def movingChiralProjector (e : Basis (Fin 4) ℝ E)
    (b : ChartGramForm E → Basis (Fin 4) ℝ E) (B : ChartGramForm E) :
    CurvatureCoefficients →L[ℝ] EuclideanSpace ℝ (Fin 3 × Fin 3) :=
  Real.sqrt (chartGramDensity e B) •
    framedChiralCompression.comp (movingCurvatureSlots e (b B))

theorem continuousOn_movingChiralProjector (e : Basis (Fin 4) ℝ E)
    (b : ChartGramForm E → Basis (Fin 4) ℝ E) {s : Set (ChartGramForm E)}
    (hb : ∀ i, ContinuousOn (fun B => b B i) s) :
    ContinuousOn (movingChiralProjector e b) s := by
  have hv : ContinuousOn (fun B : ChartGramForm E => (b B : Fin 4 → E)) s :=
    continuousOn_pi.mpr hb
  have hSlots := (continuous_movingCurvatureSlots e).comp_continuousOn hv
  exact ((continuous_chartGramDensity e).sqrt.continuousOn).smul
    (continuousOn_const.clm_comp hSlots)

/-- Common ellipticity and uniform convergence of the chart coefficients
give uniform operator-norm convergence of the density-weighted chiral
projection in any one smooth choice of frame on the positive cone. -/
theorem tendstoUniformlyOn_movingChiralProjector (e : Basis (Fin 4) ℝ E)
    (b : ChartGramForm E → Basis (Fin 4) ℝ E)
    (hb : ∀ i, ContinuousOn (fun B => b B i) positiveChartGram)
    {D N : Type*} {l : Filter N} {s : Set D} {B : N → D → ChartGramForm E}
    {B₀ : D → ChartGramForm E} {lower upper : ℝ} (hLower : 0 < lower)
    (hB : ∀ᶠ n in l, ∀ x ∈ s, B n x ∈ chartGramWindow lower upper)
    (hB₀ : ∀ x ∈ s, B₀ x ∈ chartGramWindow lower upper)
    (hConv : TendstoUniformlyOn B B₀ l s) :
    TendstoUniformlyOn (fun n x => movingChiralProjector e b (B n x))
      (fun x => movingChiralProjector e b (B₀ x)) l s := by
  have hC := (continuousOn_movingChiralProjector e b hb).mono
    (chartGramWindow_subset_positive lower upper hLower)
  have hU := (isCompact_chartGramWindow (E := E) lower upper).uniformContinuousOn_of_continuous
    (f := movingChiralProjector e b) hC
  exact hU.comp_tendstoUniformlyOn_eventually hB hB₀ hConv

end SmoothPoincare
