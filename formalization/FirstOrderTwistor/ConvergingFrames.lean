import FirstOrderTwistor.GeometricChiralBlock
import DifferentialGeometry.Geometry.Metric.MetricFiberData.Topology

open DifferentialGeometry DifferentialGeometry.Tensor0SBundle
open InnerProductSpace Filter Module
open scoped Topology BigOperators

namespace FirstOrderTwistor

variable {V : Type*} [AddCommGroup V] [Module ℝ V] [FiniteDimensional ℝ V]
  [TopologicalSpace V] [IsTopologicalAddGroup V] [ContinuousSMul ℝ V] [T2Space V]
variable {ι : Type*} [Fintype ι]

private theorem metricInner_basis (D : MetricFiberData V) (b : Basis ι ℝ V) (v w : V) :
    D.inner v w = ∑ i, ∑ j, b.repr v i * b.repr w j * D.inner (b i) (b j) := by
  calc
    _ = D.innerCLM (∑ i, b.repr v i • b i) (∑ j, b.repr w j • b j) := by
      rw [b.sum_repr, b.sum_repr, MetricFiberData.innerCLM_apply]
    _ = _ := by
      simp only [map_sum, map_smul, sum_apply, smul_apply, smul_eq_mul,
        MetricFiberData.innerCLM_apply, Finset.mul_sum]
      rw [Finset.sum_comm]
      refine Finset.sum_congr rfl (fun i _ => Finset.sum_congr rfl (fun j _ => ?_))
      ring

/-- Entrywise convergence of Gram matrices gives convergence of pairings
on vectors that converge in the fixed tangent topology. -/
theorem tendsto_metricInner_of_basis {α : Type*} {l : Filter α}
    (D : α → MetricFiberData V) (Dlim : MetricFiberData V) (b : Basis ι ℝ V)
    (hGram : ∀ i j, Tendsto (fun k => (D k).inner (b i) (b j)) l (𝓝 (Dlim.inner (b i) (b j))))
    {v w : α → V} {vlim wlim : V} (hv : Tendsto v l (𝓝 vlim)) (hw : Tendsto w l (𝓝 wlim)) :
    Tendsto (fun k => (D k).inner (v k) (w k)) l (𝓝 (Dlim.inner vlim wlim)) := by
  have hpair : (fun k => (D k).inner (v k) (w k)) = fun k =>
      ∑ i, ∑ j, b.repr (v k) i * b.repr (w k) j * (D k).inner (b i) (b j) :=
    funext fun k => metricInner_basis (D k) b (v k) (w k)
  rw [hpair, metricInner_basis Dlim b vlim wlim]
  apply tendsto_finsetSum
  intro i _
  apply tendsto_finsetSum
  intro j _
  have hvi := ((b.coord i).continuous_of_finiteDimensional.continuousAt (x := vlim)).tendsto.comp hv
  have hwj := ((b.coord j).continuous_of_finiteDimensional.continuousAt (x := wlim)).tendsto.comp hw
  exact (hvi.mul hwj).mul (hGram i j)

variable [LinearOrder ι] [LocallyFiniteOrderBot ι] [WellFoundedLT ι]

private noncomputable def metricGramSchmidt (D : MetricFiberData V) (b : Basis ι ℝ V) (i : ι) : V :=
  @gramSchmidt ℝ V _ D.toNormedAddCommGroupOfTopology D.toInnerProductSpaceOfTopology ι _ _ _ b i

omit [Fintype ι] in
private theorem metricGramSchmidt_eq (D : MetricFiberData V) (b : Basis ι ℝ V) (i : ι) :
    metricGramSchmidt D b i = b i - ∑ j ∈ Finset.Iio i,
      (D.inner (metricGramSchmidt D b j) (b i) /
        D.inner (metricGramSchmidt D b j) (metricGramSchmidt D b j)) • metricGramSchmidt D b j := by
  let : NormedAddCommGroup V := D.toNormedAddCommGroupOfTopology
  let : InnerProductSpace ℝ V := D.toInnerProductSpaceOfTopology
  have h := gramSchmidt_def'' ℝ (fun j => b j) i
  apply eq_sub_iff_add_eq.mpr
  change gramSchmidt ℝ (fun j => b j) i + _ = b i
  refine Eq.trans ?_ h.symm
  congr 1
  apply Finset.sum_congr rfl
  intro j _
  simp only [RCLike.ofReal_real_eq_id, id_eq, ← real_inner_self_eq_norm_sq]
  rfl

omit [Fintype ι] in
private theorem metricGramSchmidt_ne_zero (D : MetricFiberData V) (b : Basis ι ℝ V) (i : ι) :
    metricGramSchmidt D b i ≠ 0 := by
  let : NormedAddCommGroup V := D.toNormedAddCommGroupOfTopology
  let : InnerProductSpace ℝ V := D.toInnerProductSpaceOfTopology
  exact gramSchmidt_ne_zero i b.linearIndependent

private theorem tendsto_metricGramSchmidt {α : Type*} {l : Filter α}
    (D : α → MetricFiberData V) (Dlim : MetricFiberData V) (b : Basis ι ℝ V)
    (hGram : ∀ i j, Tendsto (fun k => (D k).inner (b i) (b j)) l (𝓝 (Dlim.inner (b i) (b j))))
    (i : ι) : Tendsto (fun k => metricGramSchmidt (D k) b i) l (𝓝 (metricGramSchmidt Dlim b i)) := by
  induction i using WellFoundedLT.induction with
  | ind i ih =>
    simp_rw [metricGramSchmidt_eq _ _ i]
    apply tendsto_const_nhds.sub
    apply tendsto_finsetSum
    intro j hj
    have ht := ih j (Finset.mem_Iio.mp hj)
    have hp := tendsto_metricInner_of_basis D Dlim b hGram ht (tendsto_const_nhds (x := b i))
    have hq := tendsto_metricInner_of_basis D Dlim b hGram ht ht
    exact (hp.div hq (Dlim.inner_pos_of_ne_zero (metricGramSchmidt_ne_zero Dlim b j)).ne').smul ht

/-- Gram–Schmidt with positive normalization for the metric `D`, starting
from the prescribed basis. -/
noncomputable def metricGramSchmidtBasis (D : MetricFiberData V) (b : Basis ι ℝ V) : Basis ι ℝ V := by
  letI : NormedAddCommGroup V := D.toNormedAddCommGroupOfTopology
  letI : InnerProductSpace ℝ V := D.toInnerProductSpaceOfTopology
  exact (gramSchmidtOrthonormalBasis (finrank_eq_card_basis b) (fun j => b j)).toBasis

private theorem metricGramSchmidtBasis_apply (D : MetricFiberData V) (b : Basis ι ℝ V) (i : ι) :
    metricGramSchmidtBasis D b i =
      (Real.sqrt (D.inner (metricGramSchmidt D b i) (metricGramSchmidt D b i)))⁻¹ •
        metricGramSchmidt D b i := by
  let : NormedAddCommGroup V := D.toNormedAddCommGroupOfTopology
  let : InnerProductSpace ℝ V := D.toInnerProductSpaceOfTopology
  let B := gramSchmidtOrthonormalBasis (finrank_eq_card_basis b) (fun j => b j)
  have hne := (gramSchmidtNormed_orthonormal (𝕜 := ℝ) b.linearIndependent).ne_zero i
  change B i = _
  rw [show B i = gramSchmidtNormed ℝ (fun j => b j) i from gramSchmidtOrthonormalBasis_apply _ hne]
  unfold gramSchmidtNormed metricGramSchmidt
  rw [← MetricFiberData.toCore_inner, real_inner_self_eq_norm_sq, Real.sqrt_sq (norm_nonneg _)]
  simp only [RCLike.ofReal_real_eq_id, id_eq]

/-- The frame constructed by Gram–Schmidt is orthonormal for the actual pairing. -/
theorem metricGramSchmidtBasis_inner (D : MetricFiberData V) (b : Basis ι ℝ V) (i j : ι) :
    D.inner (metricGramSchmidtBasis D b i) (metricGramSchmidtBasis D b j) = if i = j then 1 else 0 := by
  let : NormedAddCommGroup V := D.toNormedAddCommGroupOfTopology
  let : InnerProductSpace ℝ V := D.toInnerProductSpaceOfTopology
  let B := gramSchmidtOrthonormalBasis (finrank_eq_card_basis b) (fun j => b j)
  change D.inner (B i) (B j) = _
  rw [← MetricFiberData.toCore_inner]
  exact B.inner_eq_ite i j

/-- The parametrized orthonormal basis converges whenever the reference Gram
coefficients converge. Every convergence statement uses the fixed topology. -/
theorem tendsto_metricGramSchmidtBasis {α : Type*} {l : Filter α}
    (D : α → MetricFiberData V) (Dlim : MetricFiberData V) (b : Basis ι ℝ V)
    (hGram : ∀ i j, Tendsto (fun k => (D k).inner (b i) (b j)) l (𝓝 (Dlim.inner (b i) (b j))))
    (i : ι) : Tendsto (fun k => metricGramSchmidtBasis (D k) b i) l (𝓝 (metricGramSchmidtBasis Dlim b i)) := by
  simp_rw [metricGramSchmidtBasis_apply _ b i]
  have ht := tendsto_metricGramSchmidt D Dlim b hGram i
  have hs := (tendsto_metricInner_of_basis D Dlim b hGram ht ht).sqrt
  have hpos := Dlim.inner_pos_of_ne_zero (metricGramSchmidt_ne_zero Dlim b i)
  exact (hs.inv₀ (Real.sqrt_pos.2 hpos).ne').smul ht

/-- Gram–Schmidt fixes any basis already orthonormal for the limiting metric. -/
theorem metricGramSchmidtBasis_eq_of_orthonormal (D : MetricFiberData V) (b : Basis ι ℝ V)
    (hb : ∀ i j, D.inner (b i) (b j) = if i = j then 1 else 0) : metricGramSchmidtBasis D b = b := by
  let : NormedAddCommGroup V := D.toNormedAddCommGroupOfTopology
  let : InnerProductSpace ℝ V := D.toInnerProductSpaceOfTopology
  have hOrth : Pairwise (fun i j => inner ℝ (b i) (b j) = 0) := by
    intro i j hij
    rw [MetricFiberData.toCore_inner D, hb, ite_eq_right hij]
  ext i
  rw [metricGramSchmidtBasis_apply]
  have hi : metricGramSchmidt D b i = b i :=
    congrFun (gramSchmidt_of_orthogonal ℝ hOrth) i
  rw [hi, hb, ite_eq_left rfl]
  simp

/-- Positive normalization keeps the orientation of the reference basis. -/
theorem metricGramSchmidtBasis_orientation (D : MetricFiberData V) (b : Basis ι ℝ V) :
    (metricGramSchmidtBasis D b).orientation = b.orientation := by
  let : NormedAddCommGroup V := D.toNormedAddCommGroupOfTopology
  let : InnerProductSpace ℝ V := D.toInnerProductSpaceOfTopology
  let B := gramSchmidtOrthonormalBasis (finrank_eq_card_basis b) (fun j => b j)
  change B.toBasis.orientation = b.orientation
  apply (B.toBasis.orientation_eq_iff_det_pos b).2
  rw [gramSchmidtOrthonormalBasis_det]
  apply Finset.prod_pos
  intro i _
  let v := gramSchmidt ℝ (fun j => b j)
  have hne : v i ≠ 0 := gramSchmidt_ne_zero i b.linearIndependent
  have hUnit := (gramSchmidtNormed_orthonormal (𝕜 := ℝ) b.linearIndependent).ne_zero i
  rw [show B i = gramSchmidtNormed ℝ (fun j => b j) i from gramSchmidtOrthonormalBasis_apply _ hUnit]
  have hvb : inner ℝ (v i) (b i) = inner ℝ (v i) (v i) := by
    calc
      _ = inner ℝ (v i) (v i + ∑ j ∈ Finset.Iio i,
          (inner ℝ (v j) (b i) / ‖v j‖ ^ 2) • v j) :=
        congrArg (inner ℝ (v i)) (gramSchmidt_def'' ℝ (fun j => b j) i)
      _ = _ := by
        rw [inner_add_right, inner_sum, Finset.sum_eq_zero, add_zero]
        intro j hj
        rw [inner_smul_right, gramSchmidt_orthogonal ℝ (fun j => b j) (Finset.mem_Iio.mp hj).ne', mul_zero]
  change 0 < inner ℝ (‖v i‖⁻¹ • v i) (b i)
  rw [real_inner_smul_left, hvb, real_inner_self_eq_norm_sq]
  exact mul_pos (inv_pos.mpr (norm_pos_iff.mpr hne)) (pow_pos (norm_pos_iff.mpr hne) 2)

section Tangent

open scoped Manifold ContDiff

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {M : Type*} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

/-- Orthonormalize the prescribed positively oriented reference frame for the
metric `g` in the same tangent fiber. -/
noncomputable def orthonormalFrameFromReferenceAt (g : SmoothRiemannianMetric I M)
    {glim : SmoothRiemannianMetric I M} {o : ManifoldOrientation I M 4} {x : M}
    (frame : OrientedOrthonormalFrameAt glim o x) : OrientedOrthonormalFrameAt g o x := by
  let D := (tangentMetricData g x).metric
  refine ⟨metricGramSchmidtBasis D frame.basis, ?_, ?_⟩
  · intro i j
    rw [← TangentMetricData.inner_eq (tangentMetricData g x)]
    exact metricGramSchmidtBasis_inner D frame.basis i j
  · exact (metricGramSchmidtBasis_orientation D frame.basis).trans frame.oriented

/-- At a fixed point, entrywise convergence of metrics in the prescribed
limiting frame gives actual positively oriented orthonormal frames converging
to that frame. -/
theorem tendsto_orthonormalFrameFromReferenceAt {α : Type*} {l : Filter α}
    (g : α → SmoothRiemannianMetric I M) (glim : SmoothRiemannianMetric I M)
    {o : ManifoldOrientation I M 4} {x : M} (frame : OrientedOrthonormalFrameAt glim o x)
    (hGram : ∀ i j, Tendsto (fun k => (g k).inner x (frame.basis i) (frame.basis j)) l
      (𝓝 (glim.inner x (frame.basis i) (frame.basis j)))) (i : Fin 4) :
    Tendsto (fun k => (orthonormalFrameFromReferenceAt (g k) frame).basis i) l (𝓝 (frame.basis i)) := by
  let D := fun k => (tangentMetricData (g k) x).metric
  let Dlim := (tangentMetricData glim x).metric
  have hDG : ∀ i j, Tendsto (fun k => (D k).inner (frame.basis i) (frame.basis j)) l
      (𝓝 (Dlim.inner (frame.basis i) (frame.basis j))) := hGram
  have hFix : metricGramSchmidtBasis Dlim frame.basis = frame.basis :=
    metricGramSchmidtBasis_eq_of_orthonormal Dlim frame.basis frame.orthonormal
  have h := tendsto_metricGramSchmidtBasis D Dlim frame.basis hDG i
  rw [hFix] at h
  exact h

end Tangent

end FirstOrderTwistor
