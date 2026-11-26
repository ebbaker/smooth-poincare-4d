import SmoothPoincare.Variational.NativePocketSignedSlices
import DifferentialGeometry.Topology.Manifold.PartialDiffeomorph.OrientationSign
import DifferentialGeometry.Topology.ThreeManifold.ConnectedSum.SeamOrientationGlue
import DifferentialGeometry.Geometry.Metric.VectorBundle.OrthonormalFrame
import DifferentialGeometry.Geometry.Metric.TensorInner.FiberMetric.Tensor0SMetricContinuity

/-! # Measurable oriented chiral densities on a native pocket -/

noncomputable section

open Bundle DifferentialGeometry DifferentialGeometry.Geometry.Curvature
  DifferentialGeometry.Integral.Measure DifferentialGeometry.Tensor0SBundle
  DifferentialGeometry.Topology.Manifold Filter FirstOrderTwistor Function InnerProductSpace
  Manifold MeasureTheory Metric Module SectionsAndConnections Set
open scoped ContDiff Manifold Topology RealInnerProductSpace Bundle

namespace SmoothPoincare

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

private def pocketChartDeriv (F : PartialDiffeomorph I₄ I E₄ M ∞) {z : E₄} (hz : z ∈ F.source) :
    E₄ ≃ₗ[ℝ] TangentSpace I (F z) :=
  ((F.isLocalDiffeomorphAt I₄ I ∞ hz).mfderivToContinuousLinearEquiv (by simp)).toLinearEquiv

/-- A single choice of constant coordinate basis orients the entire connected
closed ball after applying the differential of the given chart. -/
theorem exists_nativePocket_orientedCoordinateBasis
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (o : ManifoldOrientation I M 4)
    {r : ℝ} (hF : closedBall (0 : E₄) r ⊆ F.source) :
    ∃ b : Basis (Fin 4) ℝ E₄, ∀ z (hz : z ∈ closedBall (0 : E₄) r),
      (b.map (pocketChartDeriv F (hF hz))).orientation = o.orientation (F z) := by
  let e : Fin 4 ≃ Fin (Module.finrank ℝ E₄) := finCongr (by simp)
  let b : Basis (Fin 4) ℝ E₄ := (finBasis ℝ E₄).reindex e.symm
  let oE := euclideanSmoothOrientation E₄ (Orientation.reindex ℝ E₄ e b.orientation)
  let oM := smoothOrientationOfManifoldOrientation I (OrientationAssembly.reindexManifoldOrientation I e o)
  have h := DifferentialGeometry.PartialDiffeomorph.tangentOrientationEquiv_eq_or_eq_neg_of_isPreconnected
    F oE oM (convex_closedBall (0 : E₄) r).isPreconnected hF
  have hMap (z : E₄) (hz : z ∈ closedBall (0 : E₄) r) :
      tangentOrientationEquiv (pocketChartDeriv F (hF hz)) (oE.val z) =
      Orientation.reindex ℝ E₄ e (b.map (pocketChartDeriv F (hF hz))).orientation := by
    let L : E₄ ≃ₗ[ℝ] E₄ := pocketChartDeriv F (hF hz)
    change tangentOrientationEquiv L (Orientation.reindex ℝ E₄ e b.orientation) =
      Orientation.reindex ℝ E₄ e (b.map L).orientation
    rw [tangentOrientationEquiv_self, Basis.orientation_map]
    exact (OrientationAssembly.orientation_reindex_map_comm (R := ℝ) e L b.orientation).symm
  rcases h with h | h
  · refine ⟨b, fun z hz => (Orientation.reindex ℝ E₄ e).injective ?_⟩
    exact (hMap z hz).symm.trans (h z hz)
  · let b' := b.unitsSMul (Function.update 1 (0 : Fin 4) (-1))
    refine ⟨b', fun z hz => ?_⟩
    have hn : (b.map (pocketChartDeriv F (hF hz))).orientation = -o.orientation (F z) := by
      apply (Orientation.reindex ℝ E₄ e).injective
      exact (hMap z hz).symm.trans ((h z hz).trans
        (Orientation.reindex_neg e (o.orientation (F z))).symm)
    rw [Basis.orientation_map, show b'.orientation = -b.orientation from
      Basis.orientation_neg_single b 0, Orientation.map_neg, ← Basis.orientation_map, hn]
    exact neg_neg (o.orientation (F z))

private theorem gramSchmidtBasis_oriented {V : Type*}
    [NormedAddCommGroup V] [InnerProductSpace ℝ V] [FiniteDimensional ℝ V] (b : Basis (Fin 4) ℝ V) :
    (gramSchmidtOrthonormalBasis (finrank_eq_card_basis b) b).toBasis.orientation =
      b.orientation := by
  let B := gramSchmidtOrthonormalBasis (finrank_eq_card_basis b) (fun j => b j)
  change B.toBasis.orientation = _
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


private theorem pocketChartRawField_smooth
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (u : E₄) {x : M} (hx : x ∈ F.target) :
    ContMDiffAt I I.tangent ∞
      (fun y : M => (⟨y, mfderiv I₄ I F (F.symm y) u⟩ : TangentBundle I M)) x := by
  have hT := F.contMDiffOn_toFun.contMDiffOn_tangentMapWithin (m := ∞) le_rfl
    F.open_source.uniqueMDiffOn
  have hS : ContMDiff I₄ (𝓘(ℝ, E₄)).tangent ∞
      (fun z : E₄ => (⟨z,u⟩ : TangentBundle I₄ E₄)) := by
    intro z
    rw [Bundle.contMDiffAt_totalSpace]
    refine ⟨contMDiffAt_id, ?_⟩
    simpa only [trivializationAt_model_space_apply] using
      (contMDiffAt_const (I := I₄) (I' := I₄) (n := ∞) (x := z) (c := u))
  have hU := (F.contMDiffOn_invFun.contMDiffAt (F.open_target.mem_nhds hx))
  have hOpen : IsOpen (Bundle.TotalSpace.proj ⁻¹' F.source : Set (TangentBundle I₄ E₄)) :=
    F.open_source.preimage (FiberBundle.continuous_proj E₄ (TangentSpace I₄))
  have hSrc : (⟨F.symm x,u⟩ : TangentBundle I₄ E₄) ∈ Bundle.TotalSpace.proj ⁻¹' F.source :=
    F.map_target hx
  have h := (hT.contMDiffAt (hOpen.mem_nhds hSrc)).comp x (hS.contMDiffAt.comp x hU)
  refine h.congr_of_eventuallyEq ?_
  filter_upwards [F.open_target.mem_nhds hx] with y hy
  change (⟨y, mfderiv I₄ I F (F.symm y) u⟩ : TangentBundle I M) =
    ⟨F (F.symm y), mfderivWithin I₄ I F F.source (F.symm y) u⟩
  erw [mfderivWithin_of_isOpen F.open_source (F.map_target hy)]
  have hInv : F (F.symm y) = y := F.right_inv' hy
  congr 1
  exact hInv.symm

attribute [-instance] Tensor0SBundle.tangentSpaceNormedAddCommGroup
  Tensor0SBundle.tangentSpaceNormedSpace in
set_option backward.isDefEq.respectTransparency false in
/-- A smooth frame on the native chart image of the closed ball, with any
specified oriented orthonormal frames on its complement. -/
theorem exists_nativePocket_frames_smoothOn
    (F : PartialDiffeomorph I₄ I E₄ M ∞) (g : SmoothRiemannianMetric I M)
    (o : ManifoldOrientation I M 4) {r : ℝ} (hF : closedBall (0 : E₄) r ⊆ F.source)
    (outer : ∀ x, OrientedOrthonormalFrameAt g o x) :
    ∃ f : ∀ x, OrientedOrthonormalFrameAt g o x,
      (∀ x ∉ F '' closedBall (0 : E₄) r, f x = outer x) ∧
      ∀ i : Fin 4, ContMDiffOn I I.tangent ∞
        (fun x : M => (⟨x, (f x).basis i⟩ : TangentBundle I M)) (F '' closedBall (0 : E₄) r) := by
  classical
  let A := F '' closedBall (0 : E₄) r
  obtain ⟨b,hb⟩ := exists_nativePocket_orientedCoordinateBasis F o hF
  let : RiemannianBundle (TangentSpace I : M → Type _) := ⟨g.toRiemannianMetric⟩
  let : IsContMDiffRiemannianBundle I ∞ E₄ (TangentSpace I : M → Type _) :=
    ⟨g.inner, g.contMDiff, fun _ _ _ => rfl⟩
  let raw (i : Fin 4) (x : M) : TangentSpace I x := mfderiv I₄ I F (F.symm x) (b i)
  have hTarget (x : M) (hx : x ∈ A) : x ∈ F.target := by
    obtain ⟨z,hz,rfl⟩ := hx
    exact F.map_source (hF hz)
  let B (x : M) (hx : x ∈ A) : Basis (Fin 4) ℝ (TangentSpace I x) :=
    b.map (pocketChartDeriv F (F.map_target (hTarget x hx)))
  have hBasis (x : M) (hx : x ∈ A) : (fun i => B x hx i) = fun i => raw i x := by
    funext i
    simp only [B, Basis.map_apply]
    rfl
  have hOrient (x : M) (hx : x ∈ A) : (B x hx).orientation = o.orientation x := by
    obtain ⟨z,hz,rfl⟩ := hx
    have hz' : F.symm (F z) = z := F.left_inv' (hF hz)
    have he : B (F z) (mem_image_of_mem F hz) = b.map (pocketChartDeriv F (hF hz)) := by
      ext i
      change mfderiv I₄ I F (F.symm (F z)) (b i) = mfderiv I₄ I F z (b i)
      rw [hz']
    rw [he]
    exact hb z hz
  let orth (x : M) (hx : x ∈ A) : OrthonormalBasis (Fin 4) ℝ (TangentSpace I x) :=
    gramSchmidtOrthonormalBasis (finrank_eq_card_basis (B x hx)) (B x hx)
  let f (x : M) : OrientedOrthonormalFrameAt g o x :=
    if hx : x ∈ A then
      ⟨(orth x hx).toBasis, fun i j => (orth x hx).inner_eq_ite i j,
        (gramSchmidtBasis_oriented (B x hx)).trans (hOrient x hx)⟩
    else outer x
  have hf (x : M) (hx : x ∈ A) (i : Fin 4) :
      (f x).basis i = gramSchmidtNormed ℝ (fun j => raw j x) i := by
    have hUnit := (gramSchmidtNormed_orthonormal (𝕜 := ℝ) (B x hx).linearIndependent).ne_zero i
    simpa only [f, dite_eq_left hx, OrthonormalBasis.coe_toBasis, orth, hBasis x hx] using
      (gramSchmidtOrthonormalBasis_apply (finrank_eq_card_basis (B x hx)) hUnit)
  refine ⟨f, fun x hx => dite_eq_right hx, ?_⟩
  intro i x hx
  have hlin : LinearIndependent ℝ (fun j => raw j x) := hBasis x hx ▸ (B x hx).linearIndependent
  have hSm := contMDiffAt_gramSchmidtNormed_bundle
    (fun j => pocketChartRawField_smooth F (b j) (hTarget x hx)) hlin i
  exact hSm.contMDiffWithinAt.congr (fun y hy => by rw [hf y hy i]) (by rw [hf x hx i])


private theorem nativePocketWeylDensity_continuousOn_of_frame [T2Space M]
    (g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4)
    (f : ∀ x, OrientedOrthonormalFrameAt g o x) {A : Set M}
    (hFrame : ∀ i : Fin 4, ContMDiffOn I I.tangent ∞
      (fun x : M => (⟨x,(f x).basis i⟩ : TangentBundle I M)) A)
    (sg : CollarChirality) :
    ContinuousOn (fun x => hilbertSchmidtSq (signedCollarWeylBlock o g f sg x)) A := by
  let R := fun x => metricCurvatureFrameTensor g o x (f x)
  have hR (i j k l : Fin 4) : ContinuousOn (fun x => R x i j k l) A := by
    intro x hx
    let a : Fin 4 → Fin 4 := ![i,j,l,k]
    let v (n : Fin 4) (y : M) : TangentSpace I y := (f y).basis (a n)
    have hSmooth := TensorMultilinear.contMDiffWithinAt_section_apply_base (I := I) (IP := I) 4
      id contMDiffWithinAt_id (metricRm04 g) ((metricRm04 g).contMDiff x).contMDiffWithinAt
      v (fun n => hFrame (a n) x hx)
    have hslots (y : M) : (fun n => v n y) =
        ![(f y).basis i,(f y).basis j,(f y).basis l,(f y).basis k] := by
      funext n
      fin_cases n <;> rfl
    have hc := hSmooth.continuousWithinAt
    simp_rw [hslots, metricRm04_apply] at hc
    exact hc
  let C : M → Matrix (Fin 3) (Fin 3) ℝ := fun x => match sg with
    | .plus => selfDualCurvatureBlock (R x)
    | .minus => antiSelfDualCurvatureBlock (R x)
  have hC (i j : Fin 3) : ContinuousOn (fun x => C x i j) A := by
    let P := selfDualFirstWedge i
    let Q := selfDualSecondWedge i
    let U := selfDualFirstWedge j
    let V := selfDualSecondWedge j
    have h₁ := hR P.1 P.2 U.1 U.2
    have h₂ := hR P.1 P.2 V.1 V.2
    have h₃ := hR Q.1 Q.2 U.1 U.2
    have h₄ := hR Q.1 Q.2 V.1 V.2
    cases sg
    · exact (((h₁.add h₂).add h₃).add h₄).div_const 2
    · exact (((h₁.sub h₂).sub h₃).add h₄).div_const 2
  have hTrace : ContinuousOn (fun x => (C x).trace) A :=
    continuousOn_finsetSum _ (fun i _ => hC i i)
  have hW (i j : Fin 3) : ContinuousOn (fun x => traceFreeChiralBlock (C x) i j) A := by
    simp only [traceFreeChiralBlock, Matrix.sub_apply, Matrix.smul_apply, smul_eq_mul]
    exact (hC i j).sub ((hTrace.div_const 3).mul continuousOn_const)
  have hEq : (fun x => signedCollarWeylBlock o g f sg x) =
      (fun x => traceFreeChiralBlock (C x)) := by
    cases sg <;> rfl
  simp_rw [hEq, hilbertSchmidtSq]
  apply continuousOn_finsetSum _
  intro i _
  exact continuousOn_finsetSum _ (fun j _ => (hW i j).pow 2)

variable [I.Boundaryless] [T2Space M] [CompactSpace M]

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

omit [I.Boundaryless] in
/-- Choose actual frame fields at every native slice. The two chiral densities
are measurable on the changed closed ball for the actual slice volumes.
The incoming exterior bases are kept exactly. -/
theorem exists_nativePocketPath_measurableFrames
    (F : PartialDiffeomorph I₄ I E₄ M ∞) {o : ManifoldOrientation I M 4}
    (g : SignedCollarMetric o) (R : SmoothRiemannianMetric I M) {r : ℝ} (hr : 0 < r)
    (hS : closedBall (0 : E₄) (3*r) ⊆ F.source) :
    let A := F '' closedBall (0 : E₄) (3*r)
    ∃ f : ∀ (s : Icc (0 : ℝ) 1) (x : M),
        OrientedOrthonormalFrameAt (nativePocketPath F g.metric R hr hS s) o x,
      ∀ s,
        (∀ x ∉ A, (f s x).basis = (g.frame x).basis) ∧
        ∀ sg, AEStronglyMeasurable
          (fun x => hilbertSchmidtSq (signedCollarWeylBlock o
            (nativePocketPath F g.metric R hr hS s) (f s) sg x))
          ((riemannianVolumeMeasure I M (nativePocketPath F g.metric R hr hS s)).restrict A) := by
  intro A
  have hK : IsCompact A := (isCompact_closedBall (0 : E₄) (3*r)).image_of_continuousOn
    (F.contMDiffOn_toFun.continuousOn.mono hS)
  have he (s : Icc (0 : ℝ) 1) := exists_nativePocket_frames_smoothOn F
    (nativePocketPath F g.metric R hr hS s) o hS (nativePocketPath_frame F g R hr hS s)
  choose f hOuter hSmooth using he
  refine ⟨f, fun s => ⟨fun x hx => ?_, fun sg => ?_⟩⟩
  · rw [hOuter s x hx]
    exact nativePocketPath_frame_outer F g R hr hS s hx
  · exact ContinuousOn.aestronglyMeasurable_of_isCompact
      (nativePocketWeylDensity_continuousOn_of_frame
        (nativePocketPath F g.metric R hr hS s) o (f s) (hSmooth s) sg) hK hK.measurableSet


/-- Chosen native path frames with the smooth chart representatives on the
changed ball and the incoming bases on its complement. -/
def nativePocketPath_measurableFrame
    (F : PartialDiffeomorph I₄ I E₄ M ∞) {o : ManifoldOrientation I M 4}
    (g : SignedCollarMetric o) (R : SmoothRiemannianMetric I M) {r : ℝ} (hr : 0 < r)
    (hS : closedBall (0 : E₄) (3*r) ⊆ F.source) (s : Icc (0 : ℝ) 1)
    (x : M) : OrientedOrthonormalFrameAt (nativePocketPath F g.metric R hr hS s) o x :=
  (exists_nativePocketPath_measurableFrames F g R hr hS).choose s x

/-- Local signed curvature balance supplies the actual signed packages for
the complete native family. Frame matching and local measurability come from
the chart construction. -/
theorem exists_nativePocketSignedSlices_of_balance
    (F : PartialDiffeomorph I₄ I E₄ M ∞) {o : ManifoldOrientation I M 4}
    (g : SignedCollarMetric o) (R : SmoothRiemannianMetric I M) {r : ℝ} (hr : 0 < r)
    (hS : closedBall (0 : E₄) (3*r) ⊆ F.source) :
    let A := F '' closedBall (0 : E₄) (3*r)
    (∀ s : Icc (0 : ℝ) 1,
      let h := nativePocketPath F g.metric R hr hS s
      let f := nativePocketPath_measurableFrame F g R hr hS s
      let W := fun sg x => hilbertSchmidtSq (signedCollarWeylBlock o h f sg x)
      let μ := riemannianVolumeMeasure I M h
      (∫ x in A, W .plus x ∂μ) - (∫ x in A, W .minus x ∂μ) =
        g.charge .plus A - g.charge .minus A) →
    ∃ q : Icc (0 : ℝ) 1 → SignedCollarMetric o, ∀ s,
      (q s).metric = nativePocketPath F g.metric R hr hS s ∧
      HEq (q s).frame (nativePocketPath_measurableFrame F g R hr hS s) ∧
      (∀ x ∉ A, (g.frame x).basis = ((q s).frame x).basis) ∧
      ∀ sg, g.charge sg Aᶜ = (q s).charge sg Aᶜ := by
  intro A hBalance
  have hex := (exists_nativePocketPath_measurableFrames F g R hr hS).choose_spec
  choose q hq using
    (fun s => exists_nativePocketSignedSlice_of_localData_of_frames F g R hr hS s
      (nativePocketPath_measurableFrame F g R hr hS s) (hex s).1 (hex s).2 (hBalance s))
  exact ⟨q, hq⟩

end SmoothPoincare
