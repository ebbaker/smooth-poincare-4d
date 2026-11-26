import SmoothPoincare.Variational.SelectedDiskReference
import FirstOrderTwistor.SelfDualFrameChange

/-! # Exterior germ charge under a lifted oriented frame change -/

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Tensor0SBundle
open FirstOrderTwistor Matrix MeasureTheory SectionsAndConnections Set Filter
open scoped ContDiff Manifold Matrix Topology

namespace SmoothPoincare

noncomputable section

local notation "WedgeIndex" => (Fin 3 ⊕ Fin 3)
local notation "ThreeMatrix" => Matrix (Fin 3) (Fin 3) ℝ
local notation "WedgeMatrix" => Matrix WedgeIndex WedgeIndex ℝ

/-- Coordinate certificate for one change preserving the oriented Hodge
splitting and transporting the actual curvature operator. -/
def LiftedChiralFrameChange (R R' : CurvatureFrameTensor) : Prop :=
  ∃ L : WedgeMatrix, Lᵀ * L = 1 ∧
    L * (selfDualWedgeInclusion * selfDualWedgeInclusionᵀ) =
      (selfDualWedgeInclusion * selfDualWedgeInclusionᵀ) * L ∧
    curvatureWedgeMatrix R' = Lᵀ * curvatureWedgeMatrix R * L

/-- Normalized differences in the same ordered complementary wedge pairs as the positive basis. -/
def antiSelfDualWedgeInclusion : Matrix WedgeIndex (Fin 3) ℝ :=
  (1 / Real.sqrt 2 : ℝ) • Matrix.fromRows (1 : ThreeMatrix) (-1)

private theorem wedgeNormalization_sq :
    (1 / Real.sqrt 2 : ℝ) * (1 / Real.sqrt 2) = 1 / 2 := by
  rw [div_mul_div_comm, one_mul, ← pow_two, Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 2)]

theorem antiSelfDualWedgeInclusion_orthogonal :
    antiSelfDualWedgeInclusionᵀ * antiSelfDualWedgeInclusion = 1 := by
  rw [antiSelfDualWedgeInclusion, transpose_smul, transpose_fromRows, transpose_one,
    transpose_neg, transpose_one, smul_mul, Matrix.mul_smul, fromCols_mul_fromRows,
    one_mul, neg_mul_neg, one_mul, smul_smul, wedgeNormalization_sq]
  rw [← two_smul ℝ (1 : ThreeMatrix), smul_smul]
  norm_num

theorem antiSelfDualCurvatureBlock_eq_compression (R : CurvatureFrameTensor) :
    antiSelfDualCurvatureBlock R =
      antiSelfDualWedgeInclusionᵀ * curvatureWedgeMatrix R * antiSelfDualWedgeInclusion := by
  simp only [antiSelfDualWedgeInclusion, transpose_smul, transpose_fromRows, transpose_one,
    transpose_neg, smul_mul, Matrix.mul_smul, smul_smul, wedgeNormalization_sq]
  unfold curvatureWedgeMatrix
  rw [fromCols_mul_fromBlocks, fromCols_mul_fromRows]
  simp only [one_mul, mul_one, neg_mul, mul_neg]
  ext i j
  let entry (p q : Fin 3 → Fin 4 × Fin 4) := R (p i).1 (p i).2 (q j).1 (q j).2
  let a := entry selfDualFirstWedge selfDualFirstWedge
  let b := entry selfDualFirstWedge selfDualSecondWedge
  let c := entry selfDualSecondWedge selfDualFirstWedge
  let d := entry selfDualSecondWedge selfDualSecondWedge
  change (a - b - c + d) / 2 = (1 / 2 : ℝ) * ((a - c) - (b - d))
  ring

private theorem chiralWedgeInclusion_projections_add :
    selfDualWedgeInclusion * selfDualWedgeInclusionᵀ +
      antiSelfDualWedgeInclusion * antiSelfDualWedgeInclusionᵀ = (1 : WedgeMatrix) := by
  simp only [selfDualWedgeInclusion, antiSelfDualWedgeInclusion, transpose_smul,
    transpose_fromRows, transpose_one, transpose_neg, smul_mul, Matrix.mul_smul, smul_smul,
    wedgeNormalization_sq, fromRows_mul_fromCols, one_mul, neg_mul, mul_neg, neg_neg]
  rw [← smul_add, fromBlocks_add]
  simp only [add_neg_cancel]
  have hdiag : (1 / 2 : ℝ) • ((1 : ThreeMatrix) + 1) = 1 := by
    rw [← two_smul ℝ (1 : ThreeMatrix), smul_smul]
    norm_num
  simp only [fromBlocks_smul, hdiag, smul_zero, fromBlocks_one]

/-- A common lifted orthogonal frame change preserving the positive wedge
projection preserves both Hilbert–Schmidt Weyl densities. Its relation to
actual oriented tangent frames is a premise on the lifted curvature matrix. -/
theorem chiralBlockSq_eq_of_liftedFrameChange (R R' : CurvatureFrameTensor)
    (L : WedgeMatrix) (hL : Lᵀ * L = 1)
    (hPreserves : L * (selfDualWedgeInclusion * selfDualWedgeInclusionᵀ) =
      (selfDualWedgeInclusion * selfDualWedgeInclusionᵀ) * L)
    (hFrame : curvatureWedgeMatrix R' = Lᵀ * curvatureWedgeMatrix R * L) :
    hilbertSchmidtSq (traceFreeChiralBlock (selfDualCurvatureBlock R')) =
      hilbertSchmidtSq (traceFreeChiralBlock (selfDualCurvatureBlock R)) ∧
    hilbertSchmidtSq (traceFreeChiralBlock (antiSelfDualCurvatureBlock R')) =
      hilbertSchmidtSq (traceFreeChiralBlock (antiSelfDualCurvatureBlock R)) := by
  constructor
  · obtain ⟨Q, hQ, hBlock⟩ := traceFreeSelfDualBlock_conjugate R R' L hL hPreserves hFrame
    rw [hBlock, hilbertSchmidtSq_orthogonal_conjugate _ Q hQ]
  · have hComp : antiSelfDualWedgeInclusion * antiSelfDualWedgeInclusionᵀ =
        (1 : WedgeMatrix) - selfDualWedgeInclusion * selfDualWedgeInclusionᵀ := by
      rw [← chiralWedgeInclusion_projections_add, add_sub_cancel_left]
    have hPreserves' : L * (antiSelfDualWedgeInclusion * antiSelfDualWedgeInclusionᵀ) =
        (antiSelfDualWedgeInclusion * antiSelfDualWedgeInclusionᵀ) * L := by
      rw [hComp, mul_sub, sub_mul, mul_one, one_mul, hPreserves]
    obtain ⟨Q, hQ, hBlock⟩ := traceFreeCompression_conjugate antiSelfDualWedgeInclusion L
      (curvatureWedgeMatrix R) antiSelfDualWedgeInclusion_orthogonal hL hPreserves'
    simp only [traceFreeChiralBlock, antiSelfDualCurvatureBlock_eq_compression, hFrame]
    rw [hBlock, hilbertSchmidtSq_orthogonal_conjugate _ Q hQ]

section Geometric

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)
variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [Nonempty M] {o : ManifoldOrientation I M 4}

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

omit [I.Boundaryless] [T2Space M] [CompactSpace M] [Nonempty M] in
/-- The literal tangent change between two oriented orthonormal bases of the
same metric is a special orthogonal matrix. Its lift uses the ordered wedge
coordinates of the curvature operator. -/
theorem tangentFrameChange_orthogonal_det_one (g : SmoothRiemannianMetric I M) (x : M)
    (e f : OrientedOrthonormalFrameAt g o x) :
    let Q := e.basis.toMatrix f.basis
    Qᵀ * Q = 1 ∧ Q.det = 1 := by
  let D := (tangentMetricData (I := I) g x).metric
  let _ : InnerProductSpace.Core ℝ (TangentSpace I x) := D.toCore
  let _ : NormedAddCommGroup (TangentSpace I x) :=
    @InnerProductSpace.Core.toNormedAddCommGroup ℝ (TangentSpace I x) _ _ _ D.toCore
  let _ : InnerProductSpace ℝ (TangentSpace I x) :=
    @InnerProductSpace.ofCore ℝ (TangentSpace I x) _ _ _ D.toCore.toCore
  have hon (a : OrientedOrthonormalFrameAt g o x) : Orthonormal ℝ a.basis := by
    rw [orthonormal_iff_ite]
    intro i j
    rw [MetricFiberData.toCore_inner D, TangentMetricData.inner_eq (tangentMetricData (I := I) g x)]
    exact a.orthonormal i j
  let a := e.basis.toOrthonormalBasis (hon e)
  let b := f.basis.toOrthonormalBasis (hon f)
  have ha : a.toBasis = e.basis := Module.Basis.toBasis_toOrthonormalBasis _ _
  have hb : b.toBasis = f.basis := Module.Basis.toBasis_toOrthonormalBasis _ _
  have hOrient : a.toBasis.orientation = b.toBasis.orientation := by
    rw [ha, hb, e.oriented, f.oriented]
  have hOrth := a.toMatrix_orthonormalBasis_conjTranspose_mul_self b
  have hDet := a.det_to_matrix_orthonormalBasis_of_same_orientation b hOrient
  change (a.toBasis.toMatrix b.toBasis)ᴴ * a.toBasis.toMatrix b.toBasis = 1 at hOrth
  change a.toBasis.det b.toBasis = 1 at hDet
  rw [conjTranspose_eq_transpose_of_trivial, ha, hb] at hOrth
  rw [ha, hb, Module.Basis.det_apply] at hDet
  exact ⟨hOrth, hDet⟩

/-- Pick matching oriented bases on any retained region of pointwise metric
agreement, and keep the supplied choice of frame elsewhere. The local basis
construction itself needs no assertion about integrability or signature. -/
def exteriorMatchingFrames (g : SignedCollarMetric o) (h : SmoothRiemannianMetric I M)
    (frames : ∀ x, OrientedOrthonormalFrameAt h o x) (A : Set M)
    (hMetric : ∀ x ∈ A, ∀ u v : TangentSpace I x, g.metric.inner x u v = h.inner x u v) :
    ∀ x, OrientedOrthonormalFrameAt h o x := by
  classical
  intro x
  exact if hx : x ∈ A then
    ⟨(g.frame x).basis, fun i j => (hMetric x hx _ _).symm.trans ((g.frame x).orthonormal i j),
      (g.frame x).oriented⟩
    else frames x

omit [I.Boundaryless] [Nonempty M] in
private theorem exteriorMatchingFrames_basis (g : SignedCollarMetric o)
    (h : SmoothRiemannianMetric I M) (frames : ∀ x, OrientedOrthonormalFrameAt h o x)
    (A : Set M)
    (hMetric : ∀ x ∈ A, ∀ u v : TangentSpace I x, g.metric.inner x u v = h.inner x u v)
    {x : M} (hx : x ∈ A) :
    (exteriorMatchingFrames g h frames A hMetric x).basis = (g.frame x).basis := by
  simp only [exteriorMatchingFrames, dite_eq_left hx]

omit [I.Boundaryless] [Nonempty M] in
/-- At a point of the exterior, a certified lifted change from the matched
frame to the already supplied frame leaves both tested geometric densities
unchanged. Off the exterior the frames coincide definitionally. -/
private theorem signedCollarDensity_exteriorMatchingFrames (g h : SignedCollarMetric o)
    (A : Set M)
    (hMetric : ∀ x ∈ A, ∀ u v : TangentSpace I x, g.metric.inner x u v = h.metric.inner x u v)
    (hLift : ∀ x ∈ A, LiftedChiralFrameChange
      (metricCurvatureFrameTensor h.metric o x (exteriorMatchingFrames g h.metric h.frame A hMetric x))
      (metricCurvatureFrameTensor h.metric o x (h.frame x)))
    (sign : CollarChirality) (x : M) :
    hilbertSchmidtSq (signedCollarWeylBlock o h.metric
      (exteriorMatchingFrames g h.metric h.frame A hMetric) sign x) =
        hilbertSchmidtSq (signedCollarWeylBlock o h.metric h.frame sign x) := by
  by_cases hx : x ∈ A
  · obtain ⟨L, hL, hP, hW⟩ := hLift x hx
    obtain ⟨hp, hm⟩ := chiralBlockSq_eq_of_liftedFrameChange _ _ L hL hP hW
    cases sign with
    | plus => exact hp.symm
    | minus => exact hm.symm
  · have hFrame : exteriorMatchingFrames g h.metric h.frame A hMetric x = h.frame x := by
      simp only [exteriorMatchingFrames, dite_eq_right hx]
    cases sign <;> simp only [signedCollarWeylBlock, hFrame]

omit [I.Boundaryless] [Nonempty M] in
/-- Exterior-germ charge equality with independently supplied oriented
frames follows from the checked orthogonal lift of their change of basis.
Changing the frame on the retained set keeps both integrability and the
whole-source signature identity because the two densities agree everywhere. -/
theorem selectedReference_chiralMeasure_restrict_eq_of_germ_of_liftedFrameChange
    (g h : SignedCollarMetric o) {A : Set M} (hA : MeasurableSet A)
    (hGerm : ∀ x ∈ A, ∀ᶠ y in 𝓝 x, ∀ u v : TangentSpace I y,
      g.metric.inner y u v = h.metric.inner y u v)
    (hLift : ∀ x ∈ A, LiftedChiralFrameChange
      (metricCurvatureFrameTensor g.metric o x (g.frame x))
      (metricCurvatureFrameTensor h.metric o x (h.frame x)))
    (sign : CollarChirality) : (g.chiralMeasure sign).restrict A = (h.chiralMeasure sign).restrict A := by
  let hMetric := fun x hx => (hGerm x hx).self_of_nhds
  let frame := exteriorMatchingFrames g h.metric h.frame A hMetric
  have hLiftMatch (x : M) (hx : x ∈ A) : LiftedChiralFrameChange
      (metricCurvatureFrameTensor h.metric o x (frame x))
      (metricCurvatureFrameTensor h.metric o x (h.frame x)) := by
    have hRm := metricRm04At_eq_of_metric_eventuallyEq g.metric h.metric x (hGerm x hx)
    have hBasis : (frame x).basis = (g.frame x).basis :=
      exteriorMatchingFrames_basis g h.metric h.frame A hMetric hx
    have hTensor : metricCurvatureFrameTensor h.metric o x (frame x) =
        metricCurvatureFrameTensor g.metric o x (g.frame x) := by
      funext i j k l
      change metricRm04StandardAt h.metric x ((frame x).basis i) ((frame x).basis j)
        ((frame x).basis l) ((frame x).basis k) =
        metricRm04StandardAt g.metric x ((g.frame x).basis i) ((g.frame x).basis j)
          ((g.frame x).basis l) ((g.frame x).basis k)
      simp only [metricRm04StandardAt_apply, hBasis, hRm]
    simpa only [hTensor] using hLift x hx
  have hDensity (s : CollarChirality) :
      (fun x => hilbertSchmidtSq (signedCollarWeylBlock o h.metric frame s x)) =
      (fun x => hilbertSchmidtSq (signedCollarWeylBlock o h.metric h.frame s x)) :=
    funext (signedCollarDensity_exteriorMatchingFrames g h A hMetric hLiftMatch s)
  let hMatch : SignedCollarMetric o :=
    { metric := h.metric
      frame := frame
      integrable := fun s => (hDensity s).symm ▸ h.integrable s
      signature_zero := by
        simp only [chiralFrameEnergy, hDensity]
        exact h.signature_zero }
  ext S hS
  rw [Measure.restrict_apply hS, Measure.restrict_apply hS]
  apply (ENNReal.toReal_eq_toReal_iff' (measure_ne_top _ _) (measure_ne_top _ _)).mp
  have hEqual := selectedReference_charge_eq_of_germ g hMatch (hS.inter hA)
    (fun x hx => hGerm x hx.2)
    (fun x hx => (exteriorMatchingFrames_basis g h.metric h.frame A hMetric hx.2).symm) sign
  have hMeasure : hMatch.chiralMeasure sign = h.chiralMeasure sign := by
    simp only [SignedCollarMetric.chiralMeasure, hMatch, hDensity]
  simpa only [SignedCollarMetric.charge, hMeasure, measureReal_def] using hEqual


omit [I.Boundaryless] [Nonempty M] in
/-- The retained exterior of the selected physical splice has the same
restriction of each chiral measure under the lifted frame certificate.
The splice can be tested at any parameter in its defining interval. -/
theorem selectedSplice_exterior_chiralMeasure_restrict_eq
    (g h : SignedCollarMetric o) (F : PartialDiffeomorph I₄ I E₄ M ∞) (n : ℕ)
    (hF : Metric.closedBall (0 : E₄) 1 ⊆ F.source)
    (χ : M → ℝ) (hχ : ContMDiff I 𝓘(ℝ) ∞ χ) (hχ01 : ∀ y, χ y ∈ Icc (0 : ℝ) 1)
    (b : SmoothRiemannianMetric I M) (t : ℝ) (ht : t ∈ Icc (0 : ℝ) 1)
    (hIsSplice : h.metric = chartSpliceMetric g.metric b χ hχ hχ01 t ht)
    (hFixed : ∀ y ∉ selectedChartDisk F ∪ selectedDiskTrim F n, ∀ᶠ z in 𝓝 y,
      ∀ u v : TangentSpace I z, ∀ s : ℝ, ∀ hs : s ∈ Icc (0 : ℝ) 1,
        (chartSpliceMetric g.metric b χ hχ hχ01 s hs).inner z u v = g.metric.inner z u v)
    (hLift : ∀ x ∉ selectedChartDisk F ∪ selectedDiskTrim F n, LiftedChiralFrameChange
      (metricCurvatureFrameTensor g.metric o x (g.frame x))
      (metricCurvatureFrameTensor h.metric o x (h.frame x)))
    (sign : CollarChirality) :
    let A := (selectedChartDisk F ∪ selectedDiskTrim F n)ᶜ
    (g.chiralMeasure sign).restrict A = (h.chiralMeasure sign).restrict A := by
  have hB := (isCompact_selectedChartDisk F hF).isClosed.measurableSet
  have hW := (isOpen_selectedDiskTrim F n).measurableSet
  refine selectedReference_chiralMeasure_restrict_eq_of_germ_of_liftedFrameChange g h
    (hB.union hW).compl ?_ hLift sign
  intro x hx
  filter_upwards [hFixed x hx] with y hy
  intro u v
  rw [hIsSplice]
  exact (hy u v t ht).symm

end Geometric
end
end SmoothPoincare
