import SmoothPoincare.Heights.IndexedHeightFibers
import SmoothPoincare.Immersions.FixedChartFrames
import SmoothPoincare.Immersions.NormalChartTransition
import Mathlib.Topology.Instances.Matrix

/-! # Openness of the strict middle-signature locus -/

open DifferentialGeometry DifferentialGeometry.Geometry DifferentialGeometry.Geometry.Connection
open Filter Manifold Set
open scoped BigOperators ContDiff Manifold Topology

namespace SmoothPoincare

private theorem prod_curvature_eq_sign_mul_abs (k : Fin 4 → ℝ) :
    (∏ i, k i) = (-1 : ℝ) ^ {i | k i < 0}.ncard * ∏ i, |k i| := by
  classical
  let s : Finset (Fin 4) := Finset.univ.filter (fun i => k i < 0)
  have hs : {i | k i < 0}.ncard = s.card := by
    rw [← Set.ncard_coe_finset]
    congr 1
    ext i
    simp [s]
  have hSign : (∏ i, if k i < 0 then (-1 : ℝ) else 1) = (-1 : ℝ) ^ s.card := by
    rw [Finset.prod_ite]
    simp [s]
  have hPoint (i : Fin 4) : k i = (if k i < 0 then -1 else 1) * |k i| := by
    by_cases hi : k i < 0
    · simp [hi, abs_of_neg hi]
    · simp [hi, abs_of_nonneg (le_of_not_gt hi)]
  calc
    (∏ i, k i) = ∏ i, (if k i < 0 then -1 else 1) * |k i| :=
      Finset.prod_congr rfl fun i _ => hPoint i
    _ = _ := by rw [Finset.prod_mul_distrib, hSign, hs]

/-- In four dimensions, a positive product and one entry of each sign
characterize strict middle signature. -/
theorem hasMiddlePrincipalSignature_iff_posProd_signs (k : Fin 4 → ℝ) :
    HasMiddlePrincipalSignature k ↔
      0 < (∏ i, k i) ∧ (∃ i, k i < 0) ∧ (∃ i, 0 < k i) := by
  let s : Set (Fin 4) := {i | k i < 0}
  have hProd := prod_curvature_eq_sign_mul_abs k
  change (∏ i, k i) = (-1 : ℝ) ^ s.ncard * ∏ i, |k i| at hProd
  constructor
  · rintro ⟨hNZ, hcard⟩
    change s.ncard = 2 at hcard
    refine ⟨?_, (ncard_pos (s := s)).mp (by omega : 0 < s.ncard), ?_⟩
    · rw [hProd, hcard]
      have hAbs : 0 < ∏ i, |k i| :=
        Finset.prod_pos fun i _ => abs_pos.mpr (hNZ i)
      simpa using hAbs
    · have hne : sᶜ.Nonempty := by
        apply (ncard_pos (s := sᶜ)).mp
        rw [ncard_compl, hcard]
        simp
      obtain ⟨i, hi⟩ := hne
      change ¬ k i < 0 at hi
      exact ⟨i, lt_of_le_of_ne (le_of_not_gt hi) (hNZ i).symm⟩
  · rintro ⟨hproduct, ⟨i, hi⟩, ⟨j, hj⟩⟩
    have hNZ (a : Fin 4) : k a ≠ 0 := by
      intro hzero
      exact hproduct.ne' (Finset.prod_eq_zero (Finset.mem_univ a) hzero)
    have hpos : 0 < s.ncard := (ncard_pos (s := s)).mpr ⟨i, hi⟩
    have hne : s ≠ univ := fun h => (not_lt_of_ge hj.le) (show j ∈ s from h ▸ mem_univ j)
    have hlt : s.ncard < 4 := by simpa using ncard_lt_card hne
    have hAbs : 0 < ∏ i, |k i| := Finset.prod_pos fun a _ => abs_pos.mpr (hNZ a)
    refine ⟨hNZ, ?_⟩
    change s.ncard = 2
    have hcases : s.ncard = 1 ∨ s.ncard = 2 ∨ s.ncard = 3 := by omega
    rcases hcases with h | h | h
    · rw [hProd, h] at hproduct
      norm_num at hproduct
      linarith
    · exact h
    · rw [hProd, h] at hproduct
      norm_num at hproduct
      linarith

private theorem middleSignature_neg (k : Fin 4 → ℝ) :
    HasMiddlePrincipalSignature (fun i => -k i) ↔ HasMiddlePrincipalSignature k := by
  simp only [hasMiddlePrincipalSignature_iff_posProd_signs, neg_lt_zero, neg_pos]
  have hprod : (∏ i, -k i) = ∏ i, k i := by
    simp only [Fin.prod_univ_four]
    ring
  rw [hprod]
  exact and_congr Iff.rfl and_comm

section Bilinear

variable {V : Type*} [AddCommGroup V] [Module ℝ V]

private theorem bilin_det_pos_change_basis (B : LinearMap.BilinForm ℝ V)
    (b c : Module.Basis (Fin 4) ℝ V) :
    0 < (LinearMap.BilinForm.toMatrix b B).det ↔
      0 < (LinearMap.BilinForm.toMatrix c B).det := by
  have h :=
    congrArg Matrix.det (LinearMap.BilinForm.toMatrix_mul_basis_toMatrix b c B)
  simp only [Matrix.det_mul, Matrix.det_transpose] at h
  have hcs : 0 < (b.toMatrix c).det ^ 2 := by
    apply sq_pos_of_ne_zero
    rw [← Module.Basis.det_apply]
    exact (b.isUnit_det c).ne_zero
  have hEq : (LinearMap.BilinForm.toMatrix c B).det =
      (LinearMap.BilinForm.toMatrix b B).det * (b.toMatrix c).det ^ 2 := by
    rw [← h]
    ring
  rw [hEq, mul_pos_iff_of_pos_right hcs]

/-- Positivity of the determinant and indefiniteness in any fixed basis
characterize middle signature in a diagonalizing basis. -/
theorem hasMiddlePrincipalSignature_iff_bilin (B : LinearMap.BilinForm ℝ V)
    (b c : Module.Basis (Fin 4) ℝ V) (k : Fin 4 → ℝ)
    (hc : LinearMap.BilinForm.toMatrix c B = Matrix.diagonal k) :
    HasMiddlePrincipalSignature k ↔
      0 < (LinearMap.BilinForm.toMatrix b B).det ∧
        (∃ v, B v v < 0) ∧ (∃ v, 0 < B v v) := by
  rw [hasMiddlePrincipalSignature_iff_posProd_signs, bilin_det_pos_change_basis B b c, hc,
    Matrix.det_diagonal]
  have hDiag (i : Fin 4) : B (c i) (c i) = k i := by
    have h := congrArg (fun A : Matrix (Fin 4) (Fin 4) ℝ => A i i) hc
    simpa using h
  have hQ (v : V) : B v v = ∑ i, k i * (c.repr v i) ^ 2 := by
    rw [LinearMap.BilinForm.apply_eq_dotProduct_toMatrix_mulVec c, hc, dotProduct]
    simp only [Matrix.mulVec_diagonal]
    refine Finset.sum_congr rfl fun i _ => ?_
    ring
  refine and_congr Iff.rfl (and_congr ?_ ?_)
  · constructor
    · rintro ⟨i, hi⟩
      exact ⟨c i, by simpa only [hDiag]⟩
    · rintro ⟨v, hv⟩
      by_contra! h
      exact (not_lt_of_ge (show 0 ≤ B v v by
        rw [hQ]
        exact Finset.sum_nonneg fun i _ => mul_nonneg (h i) (sq_nonneg _))) hv
  · constructor
    · rintro ⟨i, hi⟩
      exact ⟨c i, by simpa only [hDiag]⟩
    · rintro ⟨v, hv⟩
      by_contra! h
      exact (not_lt_of_ge (show B v v ≤ 0 by
        rw [hQ]
        exact Finset.sum_nonpos fun i _ => mul_nonpos_of_nonpos_of_nonneg (h i) (sq_nonneg _))) hv

end Bilinear

section Immersion

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  {g : SmoothRiemannianMetric I M} {F : IsometricHypersurface g}
  {o : ManifoldOrientation I M 4}

local notation "V₅" => EuclideanSpace ℝ (Fin 5)

private noncomputable def middleChartBilin (F : IsometricHypersurface g) (p : M)
    (n : E → V₅) (y : E) : LinearMap.BilinForm ℝ E := by
  refine LinearMap.mk₂ ℝ (chartNormalForm (metricChartConnectionForm g p) (F.localMap p) n y)
    ?_ ?_ ?_ ?_
  all_goals
    intros
    simp [chartNormalForm, bundleMapCovDeriv, inner_sub_left, inner_add_left,
      real_inner_smul_left]
  all_goals ring

private theorem middleChart_normal_eq_or_eq_neg (p q : M)
    (hq : q ∈ (extChartAt I p).source) (Q : PrincipalFrameAt F o q) (w : V₅)
    (hUnit : inner ℝ w w = 1)
    (hw : ∀ v, inner ℝ w (fderiv ℝ (F.localMap p) (extChartAt I p q) v) = 0) :
    w = Q.normal ∨ w = -Q.normal := by
  apply (principalHeight_unitCritical_iff Q w hUnit).mp
  apply (immersionHeight_critical_iff F w).2
  intro u
  change E at u
  let L := fixedChartFrameTransitionEquiv (I := I) p hq
  have ht := fixedChartFrameTransition_immersionDerivative F p hq (L.symm u)
  let D : E →L[ℝ] V₅ := mfderiv I 𝓘(ℝ, V₅) F.map q
  change fderiv ℝ (F.localMap p) (extChartAt I p q) (L.symm u) = D (L (L.symm u)) at ht
  rw [L.apply_symm_apply] at ht
  exact (congrArg (inner ℝ w) ht).symm.trans (hw _)

private theorem middleChartBilin_iff (p q : M) (hq : q ∈ (extChartAt I p).source)
    (Q : PrincipalFrameAt F o q) (n : E → V₅) (b : Module.Basis (Fin 4) ℝ E)
    (hUnit : inner ℝ (n (extChartAt I p q)) (n (extChartAt I p q)) = 1)
    (hw : ∀ v, inner ℝ (n (extChartAt I p q))
      (fderiv ℝ (F.localMap p) (extChartAt I p q) v) = 0) :
    HasMiddlePrincipalSignature Q.curvature ↔
      let B := middleChartBilin F p n (extChartAt I p q)
      0 < (LinearMap.BilinForm.toMatrix b B).det ∧
        (∃ v, B v v < 0) ∧ (∃ v, 0 < B v v) := by
  let y := extChartAt I p q
  let w := n y
  let B := middleChartBilin F p n y
  change HasMiddlePrincipalSignature Q.curvature ↔
    0 < (LinearMap.BilinForm.toMatrix b B).det ∧ (∃ v, B v v < 0) ∧ (∃ v, 0 < B v v)
  have hwSign := middleChart_normal_eq_or_eq_neg p q hq Q w hUnit hw
  have hCenter (v : E) : inner ℝ (fderiv ℝ (F.localMap q) (extChartAt I q q) v) w = 0 := by
    let D : E →L[ℝ] V₅ := mfderiv I 𝓘(ℝ, V₅) F.map q
    have hd : fderiv ℝ (F.localMap q) (extChartAt I q q) v = D v :=
      (tangentLinearMapToModel_mfderiv_eq_fderiv_writtenInExtChartAt
        (F.smooth.mdifferentiableAt (by simp)) v).symm
    have hPerp : inner ℝ Q.normal (D v) = 0 := Q.perpendicular v
    rw [hd, real_inner_comm]
    rcases hwSign with h | h
    · rwa [h]
    · rw [h, inner_neg_left, hPerp, neg_zero]
  obtain ⟨c, _, _, hL, _, _⟩ := exists_fixedChartPrincipalBasis p hq Q
  have hEntry (i j : Fin 4) : B (c i) (c j) =
      (if i = j then Q.curvature i else 0) * inner ℝ Q.normal w := by
    have h := chartNormalForm_eq_secondFundamentalFormAt F p q hq w hCenter (c i) (c j)
    change B (c i) (c j) = inner ℝ
      (show V₅ from secondFundamentalFormAmbientAt g euclideanMetric F.map q
        (fixedChartFrameTransition (I := I) p q (c i))
        (fixedChartFrameTransition (I := I) p q (c j))) w at h
    rw [h, hL i, hL j, Q.principal, real_inner_smul_left]
  rcases hwSign with h | h
  · apply hasMiddlePrincipalSignature_iff_bilin B b c _
    ext i j
    rw [LinearMap.BilinForm.toMatrix_apply, hEntry, h, Q.unit, mul_one]
    by_cases hij : i = j
    · subst j
      simp
    · simp [hij]
  · rw [← middleSignature_neg Q.curvature]
    apply hasMiddlePrincipalSignature_iff_bilin B b c _
    ext i j
    rw [LinearMap.BilinForm.toMatrix_apply, hEntry, h, inner_neg_right, Q.unit]
    by_cases hij : i = j
    · subst j
      simp
    · simp [hij]

/-- The actual strict middle-signature locus is open. The given principal
frames and their unit normal signs can be chosen independently at each point. -/
theorem isOpen_middlePrincipalLocus (P : ∀ x : M, PrincipalFrameAt F o x) :
    IsOpen {x | HasMiddlePrincipalSignature (P x).curvature} := by
  classical
  rw [isOpen_iff_mem_nhds]
  intro p hp
  change HasMiddlePrincipalSignature (P p).curvature at hp
  obtain ⟨n, V, hV, hVp, hTarget, hn, _, hNormal⟩ :=
    exists_smoothChartUnitNormal_of_principal (P p) 0 (hp.1 0)
  let z := extChartAt I p p
  let b : Module.Basis (Fin 4) ℝ E := (P p).frame.basis
  let B := middleChartBilin F p n
  have hAt (q : M) (hq : q ∈ (extChartAt I p).source) (hy : extChartAt I p q ∈ V) :
      HasMiddlePrincipalSignature (P q).curvature ↔
        0 < (LinearMap.BilinForm.toMatrix b (B (extChartAt I p q))).det ∧
          (∃ v, B (extChartAt I p q) v v < 0) ∧ (∃ v, 0 < B (extChartAt I p q) v v) := by
    apply middleChartBilin_iff p q hq (P q) n b _ (hNormal _ hy).2
    rw [real_inner_self_eq_norm_sq, (hNormal _ hy).1, one_pow]
  obtain ⟨hDet, ⟨vNeg, hvNeg⟩, ⟨vPos, hvPos⟩⟩ :=
    (hAt p (mem_extChartAt_source p) hVp).mp hp
  have hEval (u v : E) : ContinuousAt (fun y => B y u v) z :=
    (hypersurfaceChartSecondForm_smoothAt F p u v (hTarget hVp)).continuousAt.inner
      ((hn z hVp).continuousWithinAt.continuousAt (hV.mem_nhds hVp))
  have hMat : ContinuousAt (fun y => LinearMap.BilinForm.toMatrix b (B y)) z := by
    apply continuousAt_pi.mpr
    intro i
    apply continuousAt_pi.mpr
    intro j
    simpa only [LinearMap.BilinForm.toMatrix_apply] using hEval (b i) (b j)
  have hD : ContinuousAt (fun y => (LinearMap.BilinForm.toMatrix b (B y)).det) z :=
    (continuous_id.matrix_det.continuousAt).comp hMat
  have hNear : ∀ᶠ y in 𝓝 z, y ∈ V ∧
      0 < (LinearMap.BilinForm.toMatrix b (B y)).det ∧
        B y vNeg vNeg < 0 ∧ 0 < B y vPos vPos := by
    filter_upwards [hV.mem_nhds hVp, continuousAt_const.eventually_lt hD hDet,
      (hEval vNeg vNeg).eventually_lt continuousAt_const hvNeg,
      continuousAt_const.eventually_lt (hEval vPos vPos) hvPos] with y hy hd hl hr
    exact ⟨hy, hd, hl, hr⟩
  have hSource : ∀ᶠ q in 𝓝 p, q ∈ (extChartAt I p).source := by
    rw [extChartAt_source]
    exact (chartAt H p).open_source.mem_nhds (mem_chart_source H p)
  have hPull := (continuousAt_extChartAt (I := I) p).eventually hNear
  filter_upwards [hSource, hPull] with q hq hy
  exact (hAt q hq hy.1).mpr ⟨hy.2.1, ⟨vNeg, hy.2.2.1⟩, ⟨vPos, hy.2.2.2⟩⟩

end Immersion

end SmoothPoincare
