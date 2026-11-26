import SmoothPoincare.Variational.PhysicalStripVolume

/-! # Both signed strip charges from one ordered curvature bound -/

noncomputable section
open FirstOrderTwistor SectionsAndConnections MeasureTheory Set DifferentialGeometry DifferentialGeometry.Integral.Measure
open scoped ContDiff Manifold

namespace SmoothPoincare

private def wedgeIndex : Fin 3 × Bool ↪ Fin 4 × Fin 4 where
  toFun p := if p.2 then selfDualSecondWedge p.1 else selfDualFirstWedge p.1
  inj' := by decide

private theorem wedge_sum_le (f : Fin 4 × Fin 4 → ℝ) (hf : ∀ p, 0 ≤ f p) :
    (∑ i, ∑ b, f (wedgeIndex (i,b))) ≤ ∑ c, ∑ d, f (c,d) := by
  calc
    _ = ∑ x : Fin 3 × Bool, f (wedgeIndex x) := (Fintype.sum_prod_type _).symm
    _ = ∑ x ∈ Finset.univ.map wedgeIndex, f x := (Finset.sum_map ..).symm
    _ ≤ ∑ x : Fin 4 × Fin 4, f x :=
      Finset.sum_le_sum_of_subset_of_nonneg (Finset.subset_univ _) fun x _ _ => hf x
    _ = _ := Fintype.sum_prod_type _

private theorem remove_trace_decreases (W : Matrix (Fin 3) (Fin 3) ℝ) :
    hilbertSchmidtSq (traceFreeChiralBlock W) ≤ hilbertSchmidtSq W := by
  have id : hilbertSchmidtSq (traceFreeChiralBlock W) = hilbertSchmidtSq W - W.trace^2/3 := by
    simp [hilbertSchmidtSq, traceFreeChiralBlock, Matrix.trace, Matrix.smul_apply,
      Matrix.one_apply, Fin.sum_univ_three]
    ring
  rw [id]
  linarith [sq_nonneg W.trace]

/-- The two diagonal chiral compressions are orthogonal projections in the
same wedge ordering. Their joint squared price is at most the full ordered
four-tensor norm, even for an array without curvature symmetries. -/
theorem pairedChiralBlocks_le_frameTensor (R : CurvatureFrameTensor) :
    hilbertSchmidtSq (traceFreeChiralBlock (selfDualCurvatureBlock R)) +
      hilbertSchmidtSq (traceFreeChiralBlock (antiSelfDualCurvatureBlock R)) ≤ frameTensorNormSq R := by
  refine (add_le_add (remove_trace_decreases _) (remove_trace_decreases _)).trans ?_
  let r (p q : Fin 4 × Fin 4) := R p.1 p.2 q.1 q.2
  unfold hilbertSchmidtSq frameTensorNormSq
  rw [← Finset.sum_add_distrib]
  calc
    _ ≤ ∑ i, ∑ j, ∑ b : Bool, ∑ c : Bool, r (wedgeIndex (i,b)) (wedgeIndex (j,c))^2 := by
      apply Finset.sum_le_sum
      intro i _
      rw [← Finset.sum_add_distrib]
      apply Finset.sum_le_sum
      intro j _
      simp only [selfDualCurvatureBlock, antiSelfDualCurvatureBlock, Fintype.sum_bool, wedgeIndex,
        Function.Embedding.coeFn_mk, ite_true, Bool.false_eq_true, ite_false]
      dsimp only [r]
      nlinarith only [sq_nonneg (r (selfDualFirstWedge i) (selfDualFirstWedge j) -
        r (selfDualSecondWedge i) (selfDualSecondWedge j)),
        sq_nonneg (r (selfDualFirstWedge i) (selfDualSecondWedge j) -
        r (selfDualSecondWedge i) (selfDualFirstWedge j))]
    _ = ∑ i, ∑ b : Bool, ∑ j, ∑ c : Bool, r (wedgeIndex (i,b)) (wedgeIndex (j,c))^2 := by
      exact Finset.sum_congr rfl (fun i _ => Finset.sum_comm)
    _ ≤ ∑ i, ∑ b : Bool, ∑ c : Fin 4, ∑ d : Fin 4, r (wedgeIndex (i,b)) (c,d)^2 :=
      Finset.sum_le_sum fun i _ => Finset.sum_le_sum fun b _ =>
        wedge_sum_le (fun q => r (wedgeIndex (i,b)) q ^ 2) (fun _ => sq_nonneg _)
    _ ≤ _ := wedge_sum_le (fun p => ∑ c : Fin 4, ∑ d : Fin 4, r p (c,d)^2)
      (fun _ => Finset.sum_nonneg fun _ _ => Finset.sum_nonneg fun _ _ => sq_nonneg _)

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ (EuclideanSpace ℝ (Fin 4)) H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [CompactSpace M]
  {o : ManifoldOrientation I M 4}
private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

theorem signedStripChargeSum_le (q : SignedCollarMetric o) {U : Set M} (hU : MeasurableSet U)
    {D : ℝ} (hD : ∀ x ∈ U, frameTensorNormSq (metricCurvatureFrameTensor q.metric o x (q.frame x)) ≤ D) :
    q.charge .plus U + q.charge .minus U ≤ D * (riemannianVolumeMeasure I M q.metric).real U := by
  let μ := riemannianVolumeMeasure I M q.metric
  let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts q.metric
  let f (s : CollarChirality) (x : M) := hilbertSchmidtSq (signedCollarWeylBlock o q.metric q.frame s x)
  have price (s : CollarChirality) : q.charge s U = ∫ x in U, f s x ∂μ :=
    energyMeasure_real_apply hU (q.integrable s).integrableOn
      (Filter.Eventually.of_forall fun x => Finset.sum_nonneg fun _ _ => Finset.sum_nonneg fun _ _ => sq_nonneg _)
  rw [price, price, ← integral_add (q.integrable .plus).integrableOn (q.integrable .minus).integrableOn]
  calc
    _ ≤ ∫ _ in U, D ∂μ := by
      apply setIntegral_mono_on ((q.integrable .plus).add (q.integrable .minus)).integrableOn
        (integrable_const D).integrableOn hU
      intro x hx
      exact (pairedChiralBlocks_le_frameTensor _).trans (hD x hx)
    _ = _ := by simp [μ, mul_comm]


open DifferentialGeometry.Geometry
local notation "J" => ModelWithCorners.prod (𝓡 3) (𝓘(ℝ))
private local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 4)) = 3 + 1) := ⟨by simp⟩

omit [CompactSpace M] in
set_option backward.isDefEq.respectTransparency false in
theorem exactFaceNormalizedPath_eq_zeroExposure (F : PartialDiffeomorph J I ExactFaceTube M ∞)
    (g R : SmoothRiemannianMetric I M) (u : C^∞⟮I, M; ℝ⟯) {wL wR : ℝ}
    (hL : 0 < wL) (hR : 0 < wR) (hS : exactFaceSlab wL wR ⊆ F.source) (s : Icc (0:ℝ) 1) :
    exactFaceNormalizedPath F g R u hL hR hS s =
      exactFacePhysicalPath F (DifferentialGeometry.conformalMetric g u) R 0 hL hR hS s := by
  apply SmoothRiemannianMetric.ext_inner
  intro y v w
  rw [exactFacePhysicalPath_inner]
  unfold exactFaceNormalizedPath
  rw [convexComb_inner, Geometry.conformalMetric_inner, DifferentialGeometry.conformalMetric_inner]
  simp [smul_eq_mul]

variable [I.Boundaryless] [BoundarylessManifold I M]

/-- The charge on an exposed physical strip needs only a curvature bound for
the normalized path. The same reference works on both sides for all widths
and times. Both signed charges together cost at most D V (b-a). -/
theorem exists_exactFace_exposed_paired_price (F : PartialDiffeomorph J I ExactFaceTube M ∞)
    (g : SmoothRiemannianMetric I M) (u : C^∞⟮I, M; ℝ⟯) {WL WR : ℝ}
    (hS : exactFaceSlab WL WR ⊆ F.source) :
    ∃ (R : SmoothRiemannianMetric I M) (V : ℝ), 0 ≤ V ∧
      (∀ z ∈ exactFaceSlab WL WR, ∀ v w : TangentSpace J z,
        R.inner (F z) (mfderiv J I F z v) (mfderiv J I F z w) =
          exactFaceRoundCylinder.inner z v w) ∧
      ∀ {wL wR : ℝ} (hL : 0 < wL) (hR : 0 < wR) (hwL : wL ≤ WL) (hwR : wR ≤ WR)
        (s : Icc (0 : ℝ) 1) (q : SignedCollarMetric o),
        let hSmall := (exactFaceSlab_mono hwL hwR).trans hS
        let P := q.conformal (exactFacePhysicalExposure F u hL hR hSmall s)
        q.metric = exactFaceNormalizedPath F g R u hL hR hSmall s →
          P.metric = exactFacePhysicalPath F g R u hL hR hSmall s ∧
          ∀ {a b D : ℝ}, -WL ≤ a → a ≤ b → b ≤ WR → 0 ≤ D →
            let U := F '' (univ ×ˢ Icc a b)
            (∀ x ∈ U, frameTensorNormSq (metricCurvatureFrameTensor q.metric o x (q.frame x)) ≤ D) →
            P.charge .plus U + P.charge .minus U ≤ D * V * (b-a) := by
  obtain ⟨R,V,hV,hR,hVol⟩ := exists_exactFacePhysical_stripVolume F
    (DifferentialGeometry.conformalMetric g u) 0 hS
  refine ⟨R,V,hV,hR,?_⟩
  intro wL wR hL hRight hwL hwR s q hSmall P hq
  constructor
  · change DifferentialGeometry.conformalMetric q.metric _ = _
    rw [hq]
    rfl
  · intro a b D ha hab hb hD U hU
    dsimp only [P]
    rw [SignedCollarMetric.charge_conformal, SignedCollarMetric.charge_conformal]
    have hAK : univ ×ˢ Icc a b ⊆ exactFaceSlab WL WR := prod_mono Subset.rfl (Icc_subset_Icc ha hb)
    have hc := (isCompact_univ.prod (isCompact_Icc (a := a) (b := b))).image_of_continuousOn
      (F.contMDiffOn_toFun.continuousOn.mono (hAK.trans hS))
    have hv : (riemannianVolumeMeasure I M q.metric).real U ≤ V*(b-a) := by
      rw [hq, exactFaceNormalizedPath_eq_zeroExposure]
      exact hVol hL hRight hwL hwR s ha hab hb
    exact (signedStripChargeSum_le q hc.measurableSet hU).trans
      ((mul_le_mul_of_nonneg_left hv hD).trans_eq (mul_assoc ..).symm)

end SmoothPoincare
