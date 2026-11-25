import SmoothPoincare.Immersions.ChartUnitNormal
import SmoothPoincare.Heights.GaussSheets
import Mathlib.Analysis.InnerProductSpace.Orientation
import Mathlib.LinearAlgebra.Alternating.Curry

/-! # The oriented Gauss normal of an actual hypersurface -/

open Bundle DifferentialGeometry DifferentialGeometry.Geometry
open DifferentialGeometry.Geometry.Connection
open Filter Manifold Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

local notation "V₅" => EuclideanSpace ℝ (Fin 5)

private noncomputable def ambientCross (a : OrthonormalBasis (Fin 5) ℝ V₅)
    (w : Fin 4 → V₅) : V₅ :=
  ∑ i, a.toBasis.det (Fin.cons (a i) w) • a i

private theorem inner_ambientCross (a : OrthonormalBasis (Fin 5) ℝ V₅)
    (w : Fin 4 → V₅) (v : V₅) :
    inner ℝ (ambientCross a w) v = a.toBasis.det (Fin.cons v w) := by
  let eval : (V₅ [⋀^Fin 4]→ₗ[ℝ] ℝ) →ₗ[ℝ] ℝ :=
    { toFun := fun f => f w
      map_add' := fun _ _ => rfl
      map_smul' := fun _ _ => rfl }
  let l := eval.comp (a.toBasis.det.curryLeft (n := 4))
  have hEval (u : V₅) : l u = a.toBasis.det (Fin.cons u w) := by
    change (a.toBasis.det.curryLeft (n := 4) u) w = _
    simp only [AlternatingMap.curryLeft_apply_apply, Matrix.vecCons]
  rw [← hEval]
  calc
    _ = ∑ i, (a.repr v).ofLp i * l (a i) := by
      rw [ambientCross, sum_inner]
      refine Finset.sum_congr rfl fun i _ => ?_
      rw [real_inner_smul_left, a.repr_apply_apply, ← hEval, mul_comm]
    _ = l (∑ i, (a.repr v).ofLp i • a i) := by simp only [map_sum, map_smul, smul_eq_mul]
    _ = l v := by rw [a.sum_repr]

private theorem ambientCross_ne_zero (a : OrthonormalBasis (Fin 5) ℝ V₅)
    {w : Fin 4 → V₅} (hw : LinearIndependent ℝ w) : ambientCross a w ≠ 0 := by
  obtain ⟨v, hv⟩ := exists_linearIndependent_cons_of_lt_finrank hw (by simp)
  have hb : IsUnit (a.toBasis.det (Fin.cons v w)) :=
    a.toBasis.is_basis_iff_det.mp ⟨hv, hv.span_eq_top_of_card_eq_finrank (by simp)⟩
  intro h
  apply hb.ne_zero
  rw [← inner_ambientCross, h, inner_zero_left]

private theorem ambientCross_contDiffAt {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    (a : OrthonormalBasis (Fin 5) ℝ V₅) {w : E → Fin 4 → V₅} {x : E}
    (hw : ∀ i, ContDiffAt ℝ ∞ (fun z => w z i) x) :
    ContDiffAt ℝ ∞ (fun z => ambientCross a (w z)) x := by
  let d : ContinuousMultilinearMap ℝ (fun _ : Fin 5 => V₅) ℝ :=
    a.toBasis.det.toMultilinearMap.mkContinuous 1 (fun v => by
      let : Fact (Module.finrank ℝ V₅ = 5) := ⟨by simp⟩
      change ‖a.toBasis.det v‖ ≤ _
      rw [Real.norm_eq_abs, one_mul, ← a.toBasis.orientation.volumeForm_robust a rfl]
      exact a.toBasis.orientation.abs_volumeForm_apply_le v)
  unfold ambientCross
  refine ContDiffAt.sum fun i _ => ?_
  have h : ContDiffAt ℝ ∞ (fun z => (Fin.cons (a i) (w z) : Fin 5 → V₅)) x := by
    rw [contDiffAt_pi]
    intro j
    refine Fin.cases (motive := fun j =>
      ContDiffAt ℝ ∞ (fun z => (Fin.cons (a i) (w z) : Fin 5 → V₅) j) x) ?_ ?_ j
    · simpa only [Fin.cons_zero] using
        (contDiffAt_const : ContDiffAt ℝ ∞ (fun _ : E => a i) x)
    · intro j
      simpa only [Fin.cons_succ] using hw j
  have hd : ContDiffAt ℝ ∞ (fun z => a.toBasis.det (Fin.cons (a i) (w z))) x :=
    d.contDiff.contDiffAt.comp x h
  exact hd.smul (contDiffAt_const : ContDiffAt ℝ ∞ (fun _ : E => a i) x)

private theorem ambientCross_basis_change {T : Type*} [AddCommGroup T] [Module ℝ T]
    (a : OrthonormalBasis (Fin 5) ℝ V₅) (D : T →ₗ[ℝ] V₅)
    (b c : Module.Basis (Fin 4) ℝ T) :
    ambientCross a (D ∘ c) = b.det c • ambientCross a (D ∘ b) := by
  apply ext_inner_right ℝ
  intro v
  rw [real_inner_smul_left, inner_ambientCross, inner_ambientCross]
  let l : T [⋀^Fin 4]→ₗ[ℝ] ℝ := (a.toBasis.det.curryLeft (n := 4) v).compLinearMap D
  have hEval (u : Fin 4 → T) : l u = a.toBasis.det (Fin.cons v (D ∘ u)) := by
    simp only [l, AlternatingMap.compLinearMap_apply, AlternatingMap.curryLeft_apply_apply,
      Matrix.vecCons, Function.comp_def]
  rw [← hEval, ← hEval]
  conv_lhs => rw [l.eq_smul_basis_det b]
  rw [AlternatingMap.smul_apply, smul_eq_mul, mul_comm]

section Immersion

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  {g : SmoothRiemannianMetric I M}

private noncomputable abbrev normalDerivative (F : IsometricHypersurface g) (x : M) :
    TangentSpace I x →ₗ[ℝ] V₅ := (mfderiv I 𝓘(ℝ, V₅) F.map x).toLinearMap

omit [FiniteDimensional ℝ E] [I.Boundaryless] [T2Space M] in
private theorem normalDerivative_injective (F : IsometricHypersurface g) (x : M) :
    Function.Injective (normalDerivative F x) := by
  apply LinearMap.ker_eq_bot.mp
  refine LinearMap.ker_eq_bot'.2 (fun v hv => ?_)
  by_contra h
  have hpos := g.pos x v h
  rw [← F.isometric x v v] at hpos
  change mfderiv I 𝓘(ℝ, V₅) F.map x v = 0 at hv
  simp [hv] at hpos

private noncomputable def positiveTangentBasis (o : ManifoldOrientation I M 4) (x : M) :
    Module.Basis (Fin 4) ℝ (TangentSpace I x) :=
  (Module.finBasisOfFinrankEq ℝ E o.dimension_eq).adjustToOrientation (o.orientation x)

omit [I.Boundaryless] [T2Space M] in
private theorem positiveTangentBasis_orientation (o : ManifoldOrientation I M 4) (x : M) :
    (positiveTangentBasis o x).orientation = o.orientation x :=
  Module.Basis.orientation_adjustToOrientation _ _

/-- The oriented normal, viewed as an ambient vector. The ambient orientation
is specified by the ordered orthonormal basis `a`. -/
noncomputable def orientedGaussVector (F : IsometricHypersurface g)
    (o : ManifoldOrientation I M 4) (a : OrthonormalBasis (Fin 5) ℝ V₅) (x : M) : V₅ :=
  NormedSpace.normalize (ambientCross a (normalDerivative F x ∘ positiveTangentBasis o x))

omit [FiniteDimensional ℝ E] [I.Boundaryless] [T2Space M] in
private theorem normalCross_ne_zero (F : IsometricHypersurface g)
    (a : OrthonormalBasis (Fin 5) ℝ V₅) (x : M)
    (b : Module.Basis (Fin 4) ℝ (TangentSpace I x)) :
    ambientCross a (normalDerivative F x ∘ b) ≠ 0 :=
  ambientCross_ne_zero a (b.linearIndependent.map' _ (LinearMap.ker_eq_bot.mpr
    (normalDerivative_injective F x)))

omit [I.Boundaryless] [T2Space M] in
/-- The pointwise description works in every positive basis of the actual tangent space. -/
theorem orientedGaussVector_eq_of_basis (F : IsometricHypersurface g)
    (o : ManifoldOrientation I M 4) (a : OrthonormalBasis (Fin 5) ℝ V₅) (x : M)
    (b : Module.Basis (Fin 4) ℝ (TangentSpace I x)) (hb : b.orientation = o.orientation x) :
    orientedGaussVector F o a x =
      NormedSpace.normalize (∑ i, a.toBasis.det (Fin.cons (a i)
        (fun j => mfderiv I 𝓘(ℝ, V₅) F.map x (b j))) • a i) := by
  have hd := (Module.Basis.orientation_eq_iff_det_pos (positiveTangentBasis o x) b).mp
    ((positiveTangentBasis_orientation o x).trans hb.symm)
  change _ = NormedSpace.normalize (ambientCross a (normalDerivative F x ∘ b))
  rw [ambientCross_basis_change a (normalDerivative F x) (positiveTangentBasis o x) b,
    NormedSpace.normalize_smul_of_pos hd]
  rfl

omit [I.Boundaryless] [T2Space M] in
/-- The normal followed by any positive tangent basis gives positive ambient
volume. In dimension four the normal can equally be placed last. -/
theorem orientedGaussVector_volume_pos (F : IsometricHypersurface g)
    (o : ManifoldOrientation I M 4) (a : OrthonormalBasis (Fin 5) ℝ V₅) (x : M)
    (b : Module.Basis (Fin 4) ℝ (TangentSpace I x)) (hb : b.orientation = o.orientation x) :
    0 < a.toBasis.det (Fin.cons (orientedGaussVector F o a x)
      (fun j => mfderiv I 𝓘(ℝ, V₅) F.map x (b j))) := by
  let w := normalDerivative F x ∘ b
  let c := ambientCross a w
  have hc : 0 < ‖c‖ := norm_pos_iff.mpr (normalCross_ne_zero F a x b)
  have hNormal : orientedGaussVector F o a x = ‖c‖⁻¹ • c :=
    orientedGaussVector_eq_of_basis F o a x b hb
  change 0 < a.toBasis.det (Fin.cons (orientedGaussVector F o a x) w)
  rw [← inner_ambientCross a, hNormal, real_inner_smul_right, real_inner_self_eq_norm_mul_norm]
  exact mul_pos (inv_pos.mpr hc) (mul_pos hc hc)

omit [FiniteDimensional ℝ E] [I.Boundaryless] [T2Space M] in
private theorem tangentChartEquiv_symm_eq_trivFromE (p x : M)
    (hx : x ∈ (trivializationAt E (TangentSpace I) p).baseSet) (v : E) :
    (tangentChartEquiv I M p x hx).symm v = trivFromE (I := I) p x v := by
  rw [tangentChartEquiv, Trivialization.linearEquivAt_symm_apply,
    ← Trivialization.symmL_apply (R := ℝ) _ hx]

omit [T2Space M] in
/-- The oriented Gauss vector is smooth at all points of the immersion,
including points where the second fundamental form vanishes. -/
theorem orientedGaussVector_smooth (F : IsometricHypersurface g)
    (o : ManifoldOrientation I M 4) (a : OrthonormalBasis (Fin 5) ℝ V₅) :
    ContMDiff I 𝓘(ℝ, V₅) ∞ (orientedGaussVector F o a) := by
  intro p
  have hp : p ∈ (trivializationAt E (TangentSpace I) p).baseSet :=
    FiberBundle.mem_baseSet_trivializationAt ..
  obtain ⟨U, hU, hpU, hSub, hOri⟩ := o.locally_constant p p hp
  let b := (Module.finBasisOfFinrankEq ℝ E o.dimension_eq).adjustToOrientation
    (Orientation.map (Fin 4) (tangentChartEquiv I M p p hp) (o.orientation p))
  let W : E → Fin 4 → V₅ := fun z i => fderiv ℝ (F.localMap p) z (b i)
  have hBasis (x : M) (hx : x ∈ U) :
      (b.map (tangentChartEquiv I M p x (hSub hx)).symm).orientation = o.orientation x := by
    let e := tangentChartEquiv I M p x (hSub hx)
    apply (Orientation.map (Fin 4) e).injective
    rw [Module.Basis.orientation_map, ← DifferentialGeometry.orientation_map_trans,
      LinearEquiv.symm_trans_self, Orientation.map_refl]
    exact (Module.Basis.orientation_adjustToOrientation _ _).trans (hOri x hx).symm
  have hW (x : M) (hx : x ∈ U) : W (extChartAt I p x) = normalDerivative F x ∘
      b.map (tangentChartEquiv I M p x (hSub hx)).symm := by
    have hx' : x ∈ (chartAt H p).source := by
      simpa only [TangentBundle.trivializationAt_baseSet] using hSub hx
    funext i
    dsimp only [W, Function.comp_apply, Module.Basis.map_apply]
    rw [tangentChartEquiv_symm_eq_trivFromE]
    have h := trivToE_mfderiv_trivFromE (I := 𝓘(ℝ, V₅)) (IN := I) (f := F.map)
      p x (F.map p) hx' (by simp) (F.smooth.mdifferentiableAt (by simp)) (b i)
    rw [trivToE, TangentBundle.continuousLinearMapAt_model_space] at h
    exact h.symm
  have hLocal : ∀ᶠ x in 𝓝 p, orientedGaussVector F o a x =
      NormedSpace.normalize (ambientCross a (W (extChartAt I p x))) := by
    filter_upwards [hU.mem_nhds hpU] with x hx
    rw [hW x hx]
    exact orientedGaussVector_eq_of_basis F o a x _ (hBasis x hx)
  have hF := (F.localMap_contDiffOn p _ (mem_extChartAt_target p)).contDiffAt
    ((isOpen_extChartAt_target p).mem_nhds (mem_extChartAt_target p))
  have hWdiff (i : Fin 4) : ContDiffAt ℝ ∞ (fun z => W z i) (extChartAt I p p) :=
    (hF.fderiv_right (by simp)).clm_apply contDiffAt_const
  have hCross := ambientCross_contDiffAt a hWdiff
  have hNZ : ambientCross a (W (extChartAt I p p)) ≠ 0 := by
    rw [hW p hpU]
    exact normalCross_ne_zero F a p _
  have hNormal : ContDiffAt ℝ ∞ (fun z => NormedSpace.normalize (ambientCross a (W z)))
      (extChartAt I p p) :=
    ((hCross.norm ℝ hNZ).inv (norm_ne_zero_iff.mpr hNZ)).smul hCross
  exact (hNormal.contMDiffAt.comp p contMDiffAt_extChartAt).congr_of_eventuallyEq hLocal

omit [I.Boundaryless] [T2Space M] in
/-- The Gauss vector has unit length for the actual Euclidean metric. -/
theorem orientedGaussVector_mem_sphere (F : IsometricHypersurface g)
    (o : ManifoldOrientation I M 4) (a : OrthonormalBasis (Fin 5) ℝ V₅) (x : M) :
    orientedGaussVector F o a x ∈ (Metric.sphere (0 : V₅) 1) := by
  simpa [orientedGaussVector] using NormedSpace.norm_normalize
    (normalCross_ne_zero F a x (positiveTangentBasis o x))

omit [I.Boundaryless] [T2Space M] in
/-- The Gauss vector is orthogonal to the whole image of the actual differential. -/
theorem orientedGaussVector_perpendicular (F : IsometricHypersurface g)
    (o : ManifoldOrientation I M 4) (a : OrthonormalBasis (Fin 5) ℝ V₅)
    (x : M) (v : TangentSpace I x) :
    inner ℝ (orientedGaussVector F o a x) (mfderiv I 𝓘(ℝ, V₅) F.map x v) = 0 := by
  let b := positiveTangentBasis o x
  let D := normalDerivative F x
  let w := D ∘ b
  have h (i : Fin 4) : a.toBasis.det (Fin.cons (D (b i)) w) = 0 :=
    a.toBasis.det.map_eq_zero_of_eq (v := Fin.cons (D (b i)) w)
      (i := 0) (j := i.succ) (by simp [w]) (Fin.succ_ne_zero i).symm
  change inner ℝ (‖ambientCross a w‖⁻¹ • ambientCross a w) (D v) = 0
  rw [real_inner_smul_left]
  suffices inner ℝ (ambientCross a w) (D v) = 0 by rw [this, mul_zero]
  rw [← b.sum_repr v, map_sum, inner_sum]
  refine Finset.sum_eq_zero fun i _ => ?_
  rw [map_smul, real_inner_smul_right, inner_ambientCross, h, mul_zero]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- The globally defined Gauss normal of the actual oriented hypersurface. -/
noncomputable def orientedGaussNormal (F : IsometricHypersurface g)
    (o : ManifoldOrientation I M 4) (a : OrthonormalBasis (Fin 5) ℝ V₅) :
    ImmersionGaussNormal F where
  normal := Set.codRestrict (orientedGaussVector F o a) _ (orientedGaussVector_mem_sphere F o a)
  measurable := ((orientedGaussVector_smooth F o a).continuous.subtype_mk _).measurable
  perpendicular := orientedGaussVector_perpendicular F o a

omit [T2Space M] in
/-- The Gauss normal is smooth for the four-sphere's usual stereographic structure. -/
theorem orientedGaussNormal_smooth (F : IsometricHypersurface g)
    (o : ManifoldOrientation I M 4) (a : OrthonormalBasis (Fin 5) ℝ V₅) :
    ContMDiff I (𝓡 4) ∞ (orientedGaussNormal F o a).normal := by
  let : Fact (Module.finrank ℝ V₅ = 4 + 1) := ⟨by simp⟩
  exact (orientedGaussVector_smooth F o a).codRestrict_sphere (orientedGaussVector_mem_sphere F o a)

end Immersion
end SmoothPoincare
