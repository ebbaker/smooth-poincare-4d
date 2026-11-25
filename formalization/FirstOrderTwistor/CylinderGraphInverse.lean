import FirstOrderTwistor.CylinderSpectral
import FirstOrderTwistor.CylinderTraceEnergy
import Mathlib.Analysis.Normed.Lp.ProdLp
import Mathlib.Analysis.Normed.Operator.Extend
import Mathlib.MeasureTheory.Function.ContinuousMapDense

/-!
# Incoming inverse in a completed spectral graph space

The smooth modal graph records the velocity, the image under the tangential
operator, and the outgoing weighted trace. The signed energy identity makes
the map to forcing and the incoming weighted trace isometric in this graph
norm. The two-ended trace inequality gives its comparison to the bulk norm.
-/

open MeasureTheory Set
open scoped ENNReal InnerProductSpace Topology

namespace FirstOrderTwistor

noncomputable section

/-- The real interval measure used in the spectral graph. -/
def cylinderGraphVolume (length : ℝ) : Measure ℝ := volume.restrict (Ioc 0 length)

instance cylinderGraphVolume_isFinite (length : ℝ) :
    IsFiniteMeasure (cylinderGraphVolume length) :=
  isFiniteMeasure_restrict.mpr (by rw [Real.volume_Ioc]; exact ENNReal.ofReal_ne_top)

private instance (length : ℝ) : (cylinderGraphVolume length).WeaklyRegular :=
  Measure.WeaklyRegular.restrict_of_measure_ne_top
    (by rw [Real.volume_Ioc]; exact ENNReal.ofReal_ne_top)

variable (V : Type*) [NormedAddCommGroup V] [InnerProductSpace ℝ V]

/-- C¹ test modes with a continuous velocity. -/
def cylinderSmoothMode : Submodule ℝ (C(ℝ, V) × C(ℝ, V)) where
  carrier := {p | ∀ t, HasDerivAt p.1 (p.2 t) t}
  zero_mem' := fun t => hasDerivAt_const t 0
  add_mem' := fun hf hg t => (hf t).add (hg t)
  smul_mem' := fun c _ hf t => (hf t).const_smul c

/-- Each mode has one forcing coefficient and one weighted incoming trace.
The eigenvalue sign chooses the endpoint at which to read the trace. -/
abbrev CylinderIncomingMode (length : ℝ) := WithLp 2 (Lp V 2 (cylinderGraphVolume length) × V)

/-- Graph coordinates are the velocity, tangential term and weighted
outgoing trace. The first two are integrated in the product measure. -/
abbrev CylinderGraphMode (length : ℝ) :=
  WithLp 2 (WithLp 2 (Lp V 2 (cylinderGraphVolume length) × Lp V 2 (cylinderGraphVolume length)) × V)

variable {V}

omit [InnerProductSpace ℝ V] in
private theorem continuous_memLp_cylinder (length : ℝ) (f : C(ℝ, V)) :
    MemLp (f : ℝ → V) 2 (cylinderGraphVolume length) := by
  obtain ⟨bound, hbound⟩ := (isCompact_Icc (a := (0 : ℝ)) (b := length)).exists_bound_of_continuousOn
    f.continuous.continuousOn
  exact MemLp.of_bound f.continuous.aestronglyMeasurable bound
    ((ae_restrict_mem (μ := volume) measurableSet_Ioc).mono
      (fun t ht => hbound t (Ioc_subset_Icc_self ht)))

private def cylinderContinuousToLp (length : ℝ) :
    C(ℝ, V) →ₗ[ℝ] Lp V 2 (cylinderGraphVolume length) where
  toFun f := (continuous_memLp_cylinder length f).toLp f
  map_add' f g := MemLp.toLp_add (continuous_memLp_cylinder length f)
    (continuous_memLp_cylinder length g)
  map_smul' c f := MemLp.toLp_const_smul c (continuous_memLp_cylinder length f)

private def pairL2 {X A B : Type*} [AddCommGroup X] [Module ℝ X]
    [NormedAddCommGroup A] [NormedSpace ℝ A] [NormedAddCommGroup B] [NormedSpace ℝ B]
    (f : X →ₗ[ℝ] A) (g : X →ₗ[ℝ] B) : X →ₗ[ℝ] WithLp 2 (A × B) :=
  (WithLp.prodContinuousLinearEquiv 2 ℝ A B).symm.toLinearEquiv.toLinearMap.comp (f.prod g)

private def cylinderModeField : cylinderSmoothMode V →ₗ[ℝ] C(ℝ, V) :=
  (LinearMap.fst ℝ (C(ℝ, V)) (C(ℝ, V))).comp (cylinderSmoothMode V).subtype

private def cylinderModeVelocity : cylinderSmoothMode V →ₗ[ℝ] C(ℝ, V) :=
  (LinearMap.snd ℝ (C(ℝ, V)) (C(ℝ, V))).comp (cylinderSmoothMode V).subtype

private def cylinderModeTrace (eigenvalue endpoint : ℝ) : cylinderSmoothMode V →ₗ[ℝ] V :=
  (Real.sqrt |eigenvalue| • (ContinuousMap.evalCLM ℝ endpoint).toLinearMap).comp cylinderModeField

private def cylinderModeForce (eigenvalue : ℝ) : cylinderSmoothMode V →ₗ[ℝ] C(ℝ,V) :=
  cylinderModeVelocity + eigenvalue • cylinderModeField

/-- The incoming map on a smooth mode is its differential equation and
the trace at its signed incoming end, multiplied by the half-order weight. -/
def cylinderSmoothIncoming (length eigenvalue : ℝ) :
    cylinderSmoothMode V →ₗ[ℝ] CylinderIncomingMode V length :=
  pairL2 ((cylinderContinuousToLp length).comp
    (cylinderModeForce eigenvalue))
    (cylinderModeTrace eigenvalue (cylinderIncomingEnd length eigenvalue))

/-- Embed a smooth mode in the independent velocity, tangential and
outgoing trace coordinates. -/
def cylinderSmoothGraph (length eigenvalue : ℝ) :
    cylinderSmoothMode V →ₗ[ℝ] CylinderGraphMode V length :=
  pairL2 (pairL2 ((cylinderContinuousToLp length).comp cylinderModeVelocity)
    ((cylinderContinuousToLp length).comp (eigenvalue • cylinderModeField)))
    (cylinderModeTrace eigenvalue (cylinderOutgoingEnd length eigenvalue))

private theorem cylinderContinuousToLp_norm_sq {length : ℝ} (hlen : 0 ≤ length)
    (f : C(ℝ, V)) : ‖cylinderContinuousToLp length f‖ ^ 2 = ∫ t in 0..length, ‖f t‖ ^ 2 := by
  let Lf := cylinderContinuousToLp length f
  have hcoe : (Lf : ℝ → V) =ᵐ[cylinderGraphVolume length] (f : ℝ → V) :=
    MemLp.coeFn_toLp (continuous_memLp_cylinder length f)
  calc
    _ = ⟪Lf, Lf⟫_ℝ := by rw [real_inner_self_eq_norm_sq]
    _ = ∫ t, ⟪Lf t, Lf t⟫_ℝ ∂cylinderGraphVolume length := L2.inner_def _ _
    _ = ∫ t, ‖f t‖ ^ 2 ∂cylinderGraphVolume length :=
      integral_congr_ae (hcoe.mono fun t ht => by
        change ⟪Lf t, Lf t⟫_ℝ = ‖f t‖ ^ 2
        rw [ht, real_inner_self_eq_norm_sq])
    _ = _ := (intervalIntegral.integral_of_le hlen).symm

/-- The completed graph norm will retain the energy identity on the dense
smooth core. The outgoing term is on the graph side. -/
theorem cylinderSmoothIncoming_norm_eq_graph {length : ℝ} (hlen : 0 ≤ length)
    (eigenvalue : ℝ) (p : cylinderSmoothMode V) :
    ‖cylinderSmoothIncoming length eigenvalue p‖ = ‖cylinderSmoothGraph length eigenvalue p‖ := by
  apply (sq_eq_sq₀ (norm_nonneg _) (norm_nonneg _)).mp
  simp only [WithLp.prod_norm_sq_eq_of_L2]
  change ‖cylinderContinuousToLp length (cylinderModeForce eigenvalue p)‖ ^ 2 +
        ‖Real.sqrt |eigenvalue| • (p.1.1 (cylinderIncomingEnd length eigenvalue))‖ ^ 2 =
      (‖cylinderContinuousToLp length p.1.2‖ ^ 2 +
        ‖cylinderContinuousToLp length (eigenvalue • p.1.1)‖ ^ 2) +
        ‖Real.sqrt |eigenvalue| • (p.1.1 (cylinderOutgoingEnd length eigenvalue))‖ ^ 2
  have hweighted (v : V) : ‖Real.sqrt |eigenvalue| • v‖ ^ 2 = |eigenvalue| * ‖v‖ ^ 2 := by
    rw [norm_smul, mul_pow, Real.norm_eq_abs, abs_of_nonneg (Real.sqrt_nonneg _),
      Real.sq_sqrt (abs_nonneg _)]
  rw [hweighted, hweighted, cylinderContinuousToLp_norm_sq hlen,
    cylinderContinuousToLp_norm_sq hlen, cylinderContinuousToLp_norm_sq hlen]
  change (∫ t in 0..length, ‖p.1.2 t + eigenvalue • p.1.1 t‖ ^ 2) + _ =
    ((∫ t in 0..length, ‖p.1.2 t‖ ^ 2) + (∫ t in 0..length, ‖eigenvalue • p.1.1 t‖ ^ 2)) + _
  have hvel : IntervalIntegrable (fun t => ‖p.1.2 t‖ ^ 2) volume 0 length :=
    (p.1.2.continuous.norm.pow 2).intervalIntegrable _ _
  have htang : IntervalIntegrable (fun t => ‖eigenvalue • p.1.1 t‖ ^ 2) volume 0 length :=
    ((continuous_const.smul p.1.1.continuous).norm.pow 2).intervalIntegrable _ _
  rw [← intervalIntegral.integral_add hvel htang]
  change (∫ t in 0..length, ‖p.1.2 t + eigenvalue • p.1.1 t‖ ^ 2) + _ =
    (∫ t in 0..length, ‖p.1.2 t‖ ^ 2 + ‖eigenvalue • p.1.1 t‖ ^ 2) + _
  simp_rw [norm_smul eigenvalue, mul_pow, Real.norm_eq_abs, sq_abs]
  exact (cylinderMode_energy_balance length eigenvalue p.2 p.1.2.continuous).symm

variable [CompleteSpace V]

/-- Continuous test forcings and the exact signed incoming value give a dense
set in the true modal (L²) and weighted trace data space. -/
theorem cylinderSmoothIncoming_denseRange (length eigenvalue : ℝ) (hNonzero : eigenvalue ≠ 0) :
    DenseRange (cylinderSmoothIncoming (V := V) length eigenvalue) := by
  let μ := cylinderGraphVolume length
  let pack := (WithLp.prodContinuousLinearEquiv 2 ℝ (Lp V 2 μ) V).symm
  let fLp : (BoundedContinuousFunction ℝ V) →L[ℝ] Lp V 2 μ := BoundedContinuousFunction.toLp 2 μ ℝ
  have hfLp : DenseRange fLp := BoundedContinuousFunction.toLp_denseRange V μ ℝ (by simp)
  have hdense : DenseRange (pack ∘ Prod.map fLp (@id V)) :=
    pack.surjective.denseRange.comp (hfLp.prodMap denseRange_id) pack.continuous
  apply hdense.mono
  rintro _ ⟨⟨forcing, trace⟩, rfl⟩
  let start := (Real.sqrt |eigenvalue|)⁻¹ • trace
  let u := forcedCylinderMode length eigenvalue start start forcing
  let velocity (t : ℝ) := forcing t - eigenvalue • u t
  have hderiv (t : ℝ) : HasDerivAt u (velocity t) t :=
    forcedCylinderMode_hasDerivAt length eigenvalue start start forcing.continuous t
  have hu : Continuous u := continuous_iff_continuousAt.mpr fun t => (hderiv t).continuousAt
  let p : cylinderSmoothMode V :=
    ⟨(⟨u, hu⟩, ⟨velocity, forcing.continuous.sub (continuous_const.smul hu)⟩), hderiv⟩
  refine ⟨p, ?_⟩
  apply pack.symm.injective
  change (cylinderContinuousToLp length
    (cylinderModeForce eigenvalue p),
    Real.sqrt |eigenvalue| • u (cylinderIncomingEnd length eigenvalue)) = (fLp forcing, trace)
  have hequation :
      cylinderModeForce eigenvalue p =
        forcing.toContinuousMap := by
    ext t
    change (forcing t - eigenvalue • u t) + eigenvalue • u t = forcing t
    exact sub_add_cancel _ _
  rw [hequation]
  congr 1
  have hsqrt : Real.sqrt |eigenvalue| ≠ 0 := (Real.sqrt_pos.2 (abs_pos.2 hNonzero)).ne'
  change Real.sqrt |eigenvalue| • forcedCylinderMode length eigenvalue start start forcing
    (cylinderIncomingEnd length eigenvalue) = trace
  simp only [forcedCylinderMode_at_incoming, ite_self, start, smul_smul, mul_inv_cancel₀ hsqrt,
    one_smul]

/-- The Hilbert space obtained by closing the actual graph coordinates of
smooth modes in the ambient product. -/
def cylinderClosedModeGraph (V : Type*) [NormedAddCommGroup V] [InnerProductSpace ℝ V]
    (length eigenvalue : ℝ) : Submodule ℝ (CylinderGraphMode V length) :=
  (cylinderSmoothGraph (V := V) length eigenvalue).range.topologicalClosure

instance cylinderClosedModeGraph_completeSpace (length eigenvalue : ℝ) :
    CompleteSpace (cylinderClosedModeGraph V length eigenvalue) :=
  completeSpace_coe_iff_isComplete.mpr ((Submodule.isClosed_topologicalClosure _).isComplete)

private def cylinderModeInverseIsometry {length : ℝ} (hlen : 0 ≤ length)
    (eigenvalue : ℝ) (hNonzero : eigenvalue ≠ 0) :
    CylinderIncomingMode V length →ₗᵢ[ℝ] CylinderGraphMode V length :=
  LinearMap.extendOfIsometry
    (e := cylinderSmoothIncoming (V := V) length eigenvalue) (cylinderSmoothGraph length eigenvalue)
    (cylinderSmoothIncoming_denseRange length eigenvalue hNonzero)
    (fun p => (cylinderSmoothIncoming_norm_eq_graph hlen eigenvalue p).symm)

private theorem cylinderModeInverseIsometry_apply {length : ℝ} (hlen : 0 ≤ length)
    (eigenvalue : ℝ) (hNonzero : eigenvalue ≠ 0) (p : cylinderSmoothMode V) :
    cylinderModeInverseIsometry (V := V) hlen eigenvalue hNonzero
      (cylinderSmoothIncoming length eigenvalue p) = cylinderSmoothGraph length eigenvalue p := by
  unfold cylinderModeInverseIsometry
  apply LinearMap.extendOfIsometry_eq

private theorem cylinderModeInverseIsometry_range {length : ℝ} (hlen : 0 ≤ length)
    (eigenvalue : ℝ) (hNonzero : eigenvalue ≠ 0) :
    (cylinderModeInverseIsometry (V := V) hlen eigenvalue hNonzero).range =
      cylinderClosedModeGraph V length eigenvalue := by
  let inverse := cylinderModeInverseIsometry (V := V) hlen eigenvalue hNonzero
  apply SetLike.coe_injective
  change Set.range inverse = closure (Set.range (cylinderSmoothGraph (V := V) length eigenvalue))
  apply Set.Subset.antisymm
  · rintro _ ⟨d, rfl⟩
    refine (cylinderSmoothIncoming_denseRange (V := V) length eigenvalue hNonzero).induction_on d
      (p := fun z => inverse z ∈ closure (Set.range (cylinderSmoothGraph length eigenvalue)))
      (isClosed_closure.preimage inverse.continuous) ?_
    intro p
    change cylinderModeInverseIsometry hlen eigenvalue hNonzero
      (cylinderSmoothIncoming length eigenvalue p) ∈ _
    rw [cylinderModeInverseIsometry_apply]
    exact subset_closure (Set.mem_range_self p)
  · apply closure_minimal _ inverse.isometry.isClosedEmbedding.isClosed_range
    rintro _ ⟨p, rfl⟩
    exact ⟨cylinderSmoothIncoming length eigenvalue p,
      cylinderModeInverseIsometry_apply hlen eigenvalue hNonzero p⟩

/-- The closed one-mode graph is linearly isometric to true (L²) forcing and
the weighted scalar or fibre endpoint datum. The inverse is the continuous
extension of the explicit integrating-factor solution on the test core. -/
def cylinderModeIncomingEquiv {length : ℝ} (hlen : 0 ≤ length)
    (eigenvalue : ℝ) (hNonzero : eigenvalue ≠ 0) :
    (cylinderClosedModeGraph V length eigenvalue) ≃ₗᵢ[ℝ] CylinderIncomingMode V length :=
  ((cylinderModeInverseIsometry hlen eigenvalue hNonzero).equivRange.trans
    (LinearIsometryEquiv.ofEq _ _ (cylinderModeInverseIsometry_range hlen eigenvalue hNonzero))).symm

/-- On dense core data, the inverse returns the actual smooth graph vector. -/
theorem cylinderModeIncomingEquiv_symm_apply_core {length : ℝ} (hlen : 0 ≤ length)
    (eigenvalue : ℝ) (hNonzero : eigenvalue ≠ 0) (p : cylinderSmoothMode V) :
    (((cylinderModeIncomingEquiv (V := V) hlen eigenvalue hNonzero).symm
      (cylinderSmoothIncoming length eigenvalue p)) : CylinderGraphMode V length) =
      cylinderSmoothGraph length eigenvalue p := by
  change cylinderModeInverseIsometry hlen eigenvalue hNonzero (cylinderSmoothIncoming length eigenvalue p) = _
  exact cylinderModeInverseIsometry_apply hlen eigenvalue hNonzero p

private theorem cylinderLp_norm_sq {ι : Type*} {E : ι → Type*}
    [∀ i, NormedAddCommGroup (E i)] (u : lp E 2) :
    ‖u‖ ^ 2 = ∑' i, ‖u i‖ ^ 2 := by
  simpa only [ENNReal.toReal_ofNat, Real.rpow_two] using
    lp.norm_rpow_eq_tsum (by norm_num : 0 < (2 : ℝ≥0∞).toReal) u

private def cylinderLpMapIsometry {ι : Type*} {E F : ι → Type*}
    [∀ i, NormedAddCommGroup (E i)] [∀ i, NormedSpace ℝ (E i)]
    [∀ i, NormedAddCommGroup (F i)] [∀ i, NormedSpace ℝ (F i)]
    (f : ∀ i, E i →ₗᵢ[ℝ] F i) : lp E 2 →ₗᵢ[ℝ] lp F 2 where
  toFun u := ⟨fun i => f i (u i), (lp.memℓp u).mono' (fun i => ((f i).norm_map (u i)).le)⟩
  map_add' u v := Subtype.ext (funext fun i => map_add (f i) (u i) (v i))
  map_smul' c u := Subtype.ext (funext fun i => map_smul (f i) c (u i))
  norm_map' u := by
    apply (sq_eq_sq₀ (norm_nonneg _) (norm_nonneg _)).mp
    rw [cylinderLp_norm_sq, cylinderLp_norm_sq]
    exact tsum_congr fun i => congrArg (fun a : ℝ => a ^ 2) ((f i).norm_map (u i))

/-- On the square-summable spectral graph the incoming operator is a
linear isometry onto all square-summable (L²) and trace data. This gives a
continuous linear equivalence on the completed space. -/
def cylinderGraphIncomingEquiv {ι : Type*} {length : ℝ}
    (hlen : 0 ≤ length) (eigenvalue : ι → ℝ) (hNonzero : ∀ i, eigenvalue i ≠ 0) :
    lp (fun i => cylinderClosedModeGraph V length (eigenvalue i)) 2 ≃ₗᵢ[ℝ]
      lp (fun _ : ι => CylinderIncomingMode V length) 2 := by
  let e (i : ι) := cylinderModeIncomingEquiv (V := V) hlen (eigenvalue i) (hNonzero i)
  let forward := cylinderLpMapIsometry (fun i => (e i).toLinearIsometry)
  let inverse := cylinderLpMapIsometry (fun i => (e i).symm.toLinearIsometry)
  exact
    { forward.toLinearMap with
      invFun := inverse
      left_inv := fun u => Subtype.ext (funext fun i => (e i).symm_apply_apply (u i))
      right_inv := fun z => Subtype.ext (funext fun i => (e i).apply_symm_apply (z i))
      norm_map' := forward.norm_map }

@[simp]
theorem cylinderGraphIncomingEquiv_apply {ι : Type*} {length : ℝ}
    (hlen : 0 ≤ length) (eigenvalue : ι → ℝ) (hNonzero : ∀ i, eigenvalue i ≠ 0)
    (u : lp (fun i => cylinderClosedModeGraph V length (eigenvalue i)) 2) (i : ι) :
    cylinderGraphIncomingEquiv hlen eigenvalue hNonzero u i =
      cylinderModeIncomingEquiv hlen (eigenvalue i) (hNonzero i) (u i) := rfl

@[simp]
theorem cylinderGraphIncomingEquiv_symm_apply {ι : Type*} {length : ℝ}
    (hlen : 0 ≤ length) (eigenvalue : ι → ℝ) (hNonzero : ∀ i, eigenvalue i ≠ 0)
    (z : lp (fun _ : ι => CylinderIncomingMode V length) 2) (i : ι) :
    (cylinderGraphIncomingEquiv (V := V) hlen eigenvalue hNonzero).symm z i =
      (cylinderModeIncomingEquiv (V := V) hlen (eigenvalue i) (hNonzero i)).symm (z i) := rfl

/-- Include a smooth graph coordinate in its closure, with unchanged norm. -/
def cylinderSmoothGraphInclusion (length eigenvalue : ℝ) :
    cylinderSmoothMode V →ₗ[ℝ] cylinderClosedModeGraph V length eigenvalue :=
  (cylinderSmoothGraph length eigenvalue).codRestrict _ fun p =>
    Submodule.le_topologicalClosure _ ⟨p, rfl⟩

/-- The closure of the smooth single-mode generators in the square-summable
graph is the entire spectral graph. The finite sums are genuine finite
mode fields and their norm comes from the velocity and tangential terms. -/
theorem cylinderSmoothSingleModes_dense {ι : Type*} [DecidableEq ι] {length : ℝ}
    (hlen : 0 ≤ length) (eigenvalue : ι → ℝ) (hNonzero : ∀ i, eigenvalue i ≠ 0) :
    (Submodule.span ℝ
      {u : lp (fun i => cylinderClosedModeGraph V length (eigenvalue i)) 2 |
        ∃ i p, u = lp.single 2 i (cylinderSmoothGraphInclusion length (eigenvalue i) p)}).topologicalClosure = ⊤ := by
  let G (i : ι) := cylinderClosedModeGraph V length (eigenvalue i)
  let smoothSpan : Submodule ℝ (lp (fun i => G i) 2) :=
    Submodule.span ℝ {u | ∃ i p, u = lp.single 2 i
      (cylinderSmoothGraphInclusion (V := V) length (eigenvalue i) p)}
  have hclosed := smoothSpan.isClosed_topologicalClosure
  have hDense (i : ι) : DenseRange (cylinderSmoothGraphInclusion (V := V) length (eigenvalue i)) := by
    let e := cylinderModeIncomingEquiv (V := V) hlen (eigenvalue i) (hNonzero i)
    have h := e.symm.surjective.denseRange.comp
      (cylinderSmoothIncoming_denseRange (V := V) length (eigenvalue i) (hNonzero i)) e.symm.continuous
    change DenseRange ((e.symm : CylinderIncomingMode V length → G i) ∘
      cylinderSmoothIncoming length (eigenvalue i)) at h
    have heq : ((e.symm : CylinderIncomingMode V length → G i) ∘
        cylinderSmoothIncoming length (eigenvalue i)) =
        (cylinderSmoothGraphInclusion length (eigenvalue i) : cylinderSmoothMode V → G i) :=
      funext fun p => Subtype.ext (cylinderModeIncomingEquiv_symm_apply_core hlen (eigenvalue i) (hNonzero i) p)
    simpa only [heq] using h
  have hsingle (i : ι) (z : G i) : lp.single 2 i z ∈ smoothSpan.topologicalClosure := by
    let incl := lp.singleContinuousLinearMap ℝ (fun i => G i) 2 i
    refine (hDense i).induction_on z (p := fun v => incl v ∈ smoothSpan.topologicalClosure)
      (hclosed.preimage incl.continuous) ?_
    intro p
    change lp.single 2 i (cylinderSmoothGraphInclusion length (eigenvalue i) p) ∈ smoothSpan.topologicalClosure
    exact Submodule.le_topologicalClosure _ (Submodule.subset_span ⟨i, p, rfl⟩)
  apply top_unique
  intro u _
  change u ∈ smoothSpan.topologicalClosure
  exact hclosed.mem_of_tendsto (lp.hasSum_single (by simp) u) (Filter.Eventually.of_forall fun s =>
    Submodule.sum_mem _ fun i _ => hsingle i (u i))

omit [CompleteSpace V] in
/-- Uniform comparison with the pure bulk graph norm on the core. This
identifies the outgoing-augmented norm as an equivalent norm, with the
upper bound uniform once the length is at least one and the round gap holds. -/
theorem cylinderSmoothGraph_norm_sq_comparison {length eigenvalue : ℝ}
    (hlen : 1 ≤ length) (hgap : (3 : ℝ) / 2 ≤ |eigenvalue|)
    (p : cylinderSmoothMode V) :
    let bulk := ∫ t in 0..length, ‖p.1.2 t‖ ^ 2 + (1 + eigenvalue ^ 2) * ‖p.1.1 t‖ ^ 2
    bulk ≤ (13 / 9 : ℝ) * ‖cylinderSmoothGraph length eigenvalue p‖ ^ 2 ∧
      ‖cylinderSmoothGraph length eigenvalue p‖ ^ 2 ≤ (10 / 3 : ℝ) * bulk := by
  let bulk := ∫ t in 0..length, ‖p.1.2 t‖ ^ 2 + (1 + eigenvalue ^ 2) * ‖p.1.1 t‖ ^ 2
  let energy := ∫ t in 0..length, ‖p.1.2 t‖ ^ 2 + eigenvalue ^ 2 * ‖p.1.1 t‖ ^ 2
  let outgoing := |eigenvalue| * ‖p.1.1 (cylinderOutgoingEnd length eigenvalue)‖ ^ 2
  have hl : 0 ≤ length := zero_le_one.trans hlen
  have hgraph : ‖cylinderSmoothGraph length eigenvalue p‖ ^ 2 = energy + outgoing := by
    simp only [WithLp.prod_norm_sq_eq_of_L2]
    change (‖cylinderContinuousToLp length p.1.2‖ ^ 2 +
        ‖cylinderContinuousToLp length (eigenvalue • p.1.1)‖ ^ 2) +
        ‖Real.sqrt |eigenvalue| • p.1.1 (cylinderOutgoingEnd length eigenvalue)‖ ^ 2 = _
    rw [cylinderContinuousToLp_norm_sq hl, cylinderContinuousToLp_norm_sq hl,
      norm_smul, mul_pow, Real.norm_eq_abs, abs_of_nonneg (Real.sqrt_nonneg _),
      Real.sq_sqrt (abs_nonneg _)]
    change ((∫ t in 0..length, ‖p.1.2 t‖ ^ 2) + ∫ t in 0..length, ‖eigenvalue • p.1.1 t‖ ^ 2) +
      outgoing = _
    have hvel : IntervalIntegrable (fun t => ‖p.1.2 t‖ ^ 2) volume 0 length :=
      (p.1.2.continuous.norm.pow 2).intervalIntegrable _ _
    have htang : IntervalIntegrable (fun t => ‖eigenvalue • p.1.1 t‖ ^ 2) volume 0 length :=
      ((continuous_const.smul p.1.1.continuous).norm.pow 2).intervalIntegrable _ _
    rw [← intervalIntegral.integral_add hvel htang]
    congr 1
    apply intervalIntegral.integral_congr
    intro t _
    change ‖p.1.2 t‖ ^ 2 + ‖eigenvalue • p.1.1 t‖ ^ 2 =
      ‖p.1.2 t‖ ^ 2 + eigenvalue ^ 2 * ‖p.1.1 t‖ ^ 2
    rw [norm_smul, mul_pow, Real.norm_eq_abs, sq_abs]
  have hv : Continuous (fun t => ‖p.1.2 t‖ ^ 2 + eigenvalue ^ 2 * ‖p.1.1 t‖ ^ 2) :=
    (p.1.2.continuous.norm.pow 2).add (continuous_const.mul (p.1.1.continuous.norm.pow 2))
  have hb : Continuous (fun t => ‖p.1.2 t‖ ^ 2 + (1 + eigenvalue ^ 2) * ‖p.1.1 t‖ ^ 2) :=
    (p.1.2.continuous.norm.pow 2).add (continuous_const.mul (p.1.1.continuous.norm.pow 2))
  have hlow : energy ≤ bulk := by
    exact intervalIntegral.integral_mono_on hl (hv.intervalIntegrable _ _) (hb.intervalIntegrable _ _)
      fun t _ => by nlinarith only [sq_nonneg ‖p.1.1 t‖]
  have hcoef : 1 + eigenvalue ^ 2 ≤ (13 / 9 : ℝ) * eigenvalue ^ 2 := by
    have hs := pow_le_pow_left₀ (by norm_num : 0 ≤ (3 / 2 : ℝ)) hgap 2
    rw [sq_abs] at hs
    linarith only [hs]
  have hhigh : bulk ≤ (13 / 9 : ℝ) * energy := by
    unfold energy
    rw [← intervalIntegral.integral_const_mul]
    apply intervalIntegral.integral_mono_on hl (hb.intervalIntegrable _ _)
      ((continuous_const.mul hv).intervalIntegrable _ _)
    intro t _
    change ‖p.1.2 t‖ ^ 2 + (1 + eigenvalue ^ 2) * ‖p.1.1 t‖ ^ 2 ≤
      (13 / 9 : ℝ) * (‖p.1.2 t‖ ^ 2 + eigenvalue ^ 2 * ‖p.1.1 t‖ ^ 2)
    nlinarith only [mul_le_mul_of_nonneg_right hcoef (sq_nonneg ‖p.1.1 t‖), sq_nonneg ‖p.1.2 t‖]
  have hout : outgoing ≤ (7 / 3 : ℝ) * bulk :=
    calc
      _ ≤ |eigenvalue| * (‖p.1.1 0‖ ^ 2 + ‖p.1.1 length‖ ^ 2) := by
        apply mul_le_mul_of_nonneg_left _ (abs_nonneg _)
        unfold cylinderOutgoingEnd
        split <;> linarith only [sq_nonneg ‖p.1.1 0‖, sq_nonneg ‖p.1.1 length‖]
      _ ≤ _ := roundCylinderMode_traceGraphBound hlen hgap p.2 p.1.2.continuous
  change bulk ≤ (13 / 9 : ℝ) * ‖cylinderSmoothGraph length eigenvalue p‖ ^ 2 ∧ _
  rw [hgraph]
  have hn : 0 ≤ outgoing := by positivity
  constructor <;> linarith only [hhigh, hlow, hn, hout]

set_option maxHeartbeats 800000 in
/-- A bounded perturbation of the modal differential operator preserves the
incoming trace operator when its data component at the incoming trace is zero.
The inverse bound is for the completed graph norm. -/
theorem cylinderGraphIncomingPerturbation {ι : Type*} {length : ℝ}
    (hlen : 0 ≤ length) (eigenvalue : ι → ℝ) (hNonzero : ∀ i, eigenvalue i ≠ 0)
    (difference : lp (fun i => cylinderClosedModeGraph V length (eigenvalue i)) 2 →L[ℝ]
      lp (fun _ : ι => CylinderIncomingMode V length) 2)
    (hTrace : ∀ (u : lp (fun i => cylinderClosedModeGraph V length (eigenvalue i)) 2)
      (i : ι), (difference u i).snd = (0 : V))
    {δ : ℝ} (hDifference : ‖difference‖ ≤ δ) (hsmall : δ < 1) :
    let reference := (cylinderGraphIncomingEquiv (V := V) hlen eigenvalue hNonzero).toContinuousLinearEquiv
    ∃ perturbed : (lp (fun i => cylinderClosedModeGraph V length (eigenvalue i)) 2) ≃L[ℝ]
        lp (fun _ : ι => CylinderIncomingMode V length) 2,
      (∀ u, perturbed u = reference u + difference u) ∧
      (∀ (u : lp (fun i => cylinderClosedModeGraph V length (eigenvalue i)) 2)
        (i : ι), (perturbed u i).snd = (reference u i).snd) ∧
      ‖perturbed.symm.toContinuousLinearMap‖ ≤ 1 / (1 - δ) := by
  let iso := cylinderGraphIncomingEquiv (V := V) hlen eigenvalue hNonzero
  let reference := iso.toContinuousLinearEquiv
  have hC : ‖reference.symm.toContinuousLinearMap‖ ≤ 1 := by
    apply ContinuousLinearMap.opNorm_le_bound _ (by norm_num)
    intro f
    change ‖iso.symm f‖ ≤ 1 * ‖f‖
    rw [iso.symm.norm_map, one_mul]
  obtain ⟨perturbed, hEq, hBound⟩ := fixedDomainDiracPerturbation_inverse_norm_le
    reference difference hC hDifference (by simpa only [mul_one] using hsmall)
  refine ⟨perturbed, hEq, ?_, by simpa only [mul_one] using hBound⟩
  intro u i
  rw [hEq]
  change (reference u i).snd + (difference u i).snd = _
  rw [hTrace, add_zero]

end

end FirstOrderTwistor
