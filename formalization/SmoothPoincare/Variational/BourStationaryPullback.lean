import SmoothPoincare.Variational.BourTransportedInterior
import SmoothPoincare.Variational.BourRicciInteriorEstimate
import DifferentialGeometry.Geometry.Curvature.Naturality.Pullback.LocalIterCov
import DifferentialGeometry.Geometry.Curvature.Naturality.Pullback.PartialDiffeomorph
import DifferentialGeometry.Geometry.Operator.CovariantTensor

/-! # Local transport of the stationary rough Ricci term

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
Actual serving model and effort are unavailable.
-/

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature
  DifferentialGeometry.Geometry.Connection DifferentialGeometry.Geometry.Operator
  DifferentialGeometry.Tensor0SBundle DifferentialGeometry.Tensor.Coordinates DifferentialGeometry.Tensor.RSTensor
  DifferentialGeometry.CheegerGromovCompactness DifferentialGeometry.PDE.RicciFlow
  SmoothPoincare.Bour Filter Set TopologicalSpace
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

noncomputable section

variable {E H M F K N : Type*}
  [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [NormedAddCommGroup F] [InnerProductSpace ℝ F] [FiniteDimensional ℝ F]
  [TopologicalSpace K] {J : ModelWithCorners ℝ F K}
  [TopologicalSpace N] [ChartedSpace K N] [IsManifold J ∞ N] [T2Space N]

private local instance : CompleteSpace E := FiniteDimensional.complete ℝ E
private local instance : CompleteSpace F := FiniteDimensional.complete ℝ F
private local instance : IsManifold I 1 M := IsManifold.of_le (n := ∞) (by decide)
private local instance : IsManifold J 1 N := IsManifold.of_le (n := ∞) (by decide)

/-- The ambient covariant derivatives of two smooth tensor fields agree
on a marked open subset when the metric and the tensor are transported
by the same local differential. The metrics may extend independently
outside their marked open subsets. -/
theorem bourIterCov_of_partialDiffeomorph_inner
    (g : SmoothRiemannianMetric I M) (h : SmoothRiemannianMetric J N)
    (Φ : PartialDiffeomorph I J M N ∞) (U : Opens M) (hU : (U : Set M) ⊆ Φ.source)
    (hInner : ∀ x ∈ U, ∀ u v : TangentSpace I x, g.inner x u v =
      h.inner (Φ x) (mfderiv I J Φ x u) (mfderiv I J Φ x v))
    {s : ℕ} (A : Tensor0SField (I := I) (M := M) ∞ s)
    (B : Tensor0SField (I := J) (M := N) ∞ s)
    (hTensor : ∀ x ∈ U, ∀ w : Fin s → TangentSpace I x,
      A x w = B (Φ x) (fun i => mfderiv I J Φ x (w i)))
    (k : ℕ) {x : M} (hx : x ∈ U) (w : Fin (s + k) → TangentSpace I x) :
    iterCov g s A k x w = iterCov h s B k (Φ x) (fun i => mfderiv I J Φ x (w i)) := by
  let V : Opens N := ⟨Φ '' (U : Set M), DifferentialGeometry.image_opens_isOpen Φ hU⟩
  let ψ : U ≃ₘ⟮I, J⟯ V := DifferentialGeometry.PartialDiffeomorph.toOpensDiffeo Φ hU
  have hd (y : U) (v : TangentSpace I y) :
      mfderiv I J (ψ : U → V) y v = mfderiv I J (Φ : M → N) y.val v :=
    DifferentialGeometry.PartialDiffeomorph.mfderiv_toOpensDiffeo Φ hU y v
  have hm (y : U) (a b : TangentSpace I y) :
      g.inner y.val a b = h.inner (ψ y : N)
        (mfderiv I J (ψ : U → V) y a) (mfderiv I J (ψ : U → V) y b) := by
    rw [hd, hd]
    exact hInner y y.property a b
  have hT (y : U) (v : Fin s → TangentSpace I y) :
      A y.val v = B (ψ y : N) (fun i => mfderiv I J (ψ : U → V) y (v i)) := by
    simp only [hd]
    exact hTensor y y.property v
  have heq := DifferentialGeometry.Geometry.Tensor.iter_cov_of_metric_isometry_on_opens
    g h U V ψ hm A B hT k ⟨x, hx⟩ w
  have hVec : (fun i => mfderiv I J (ψ : U → V) (⟨x, hx⟩ : U) (w i)) =
      (fun i => mfderiv I J (Φ : M → N) x (w i)) := funext fun i => hd ⟨x, hx⟩ (w i)
  have hPoint : (ψ (⟨x, hx⟩ : U) : N) = Φ x := rfl
  rw [hVec, hPoint] at heq
  exact heq

/-- On a physical isometry patch, the true rough Laplacian of the two
ambient fields transports through its differential. The inverse metric
trace is taken in one basis and its image under that differential. -/
theorem bourRoughLap_of_partialDiffeomorph_inner
    (g : SmoothRiemannianMetric I M) (h : SmoothRiemannianMetric J N)
    (Φ : PartialDiffeomorph I J M N ∞) (U : Opens M) (hU : (U : Set M) ⊆ Φ.source)
    (hInner : ∀ x ∈ U, ∀ u v : TangentSpace I x, g.inner x u v =
      h.inner (Φ x) (mfderiv I J Φ x u) (mfderiv I J Φ x v))
    {s : ℕ} (A : Tensor0SField (I := I) (M := M) ∞ s)
    (B : Tensor0SField (I := J) (M := N) ∞ s)
    (hTensor : ∀ x ∈ U, ∀ w : Fin s → TangentSpace I x,
      A x w = B (Φ x) (fun i => mfderiv I J Φ x (w i)))
    {x : M} (hx : x ∈ U) (tail : Fin s → TangentSpace I x) :
    roughLap0SField g A x tail =
      roughLap0SField h B (Φ x) (fun i => mfderiv I J Φ x (tail i)) := by
  classical
  let e := ((Φ.isLocalDiffeomorphAt I J ∞ (hU hx)).mfderivToContinuousLinearEquiv (by simp)).toLinearEquiv
  have he (v : TangentSpace I x) : e v = mfderiv I J Φ x v := rfl
  let b := coordinateFrameAtToBasis (I := I) x
  let b' := b.map e
  let m := fun i j => inverseMetricFlatModelInChartComponent (I := I) g x i j (extChartAt I x x)
  have hb : MetricInverseInBasis g x b m :=
    DifferentialGeometry.Tensor.Coordinates.inverseMetricFlatModelInChart_metricInverseInBasis_center g x
  have hGram (i j : CoordinateIdx (𝕜 := ℝ) E) :
      h.inner (Φ x) (b' i) (b' j) = g.inner x (b i) (b j) := by
    simp only [b', Module.Basis.map_apply, he]
    exact (hInner x hx _ _).symm
  have hb' : MetricInverseInBasis h (Φ x) b' m := by
    intro i j
    simpa only [hGram] using hb i j
  have hStep (i j : CoordinateIdx (𝕜 := ℝ) E) :
      (fun k => mfderiv I J Φ x (metricTraceInput (b i) (b j) tail k)) =
        metricTraceInput (b' i) (b' j) (fun k => mfderiv I J Φ x (tail k)) := by
    funext k
    refine Fin.cases ?_ (fun l => Fin.cases ?_ (fun q => ?_) l) k
    · exact (he (b i)).symm
    · exact (he (b j)).symm
    · rfl
  simp only [roughLap0SField_apply, roughLap0STensor, metricTraceFirstTwo0STensor_apply]
  rw [metricTraceFirstTwo0SAt_eq_sum_basis g b m hb, metricTraceFirstTwo0SAt_eq_sum_basis h b' m hb']
  unfold metricTrace0S2InBasis
  refine Finset.sum_congr rfl (fun i _ => Finset.sum_congr rfl (fun j _ => ?_))
  have hCov := bourIterCov_of_partialDiffeomorph_inner g h Φ U hU hInner A B hTensor 2 hx
    (metricTraceInput (b i) (b j) tail)
  rw [hStep] at hCov
  exact congrArg (fun z : ℝ => m i j * z) hCov

/-- Ordered lowered Riemann tensor on the same physical pullback patch. -/
theorem bourRm04_of_partialDiffeomorph_inner
    (g : SmoothRiemannianMetric I M) (h : SmoothRiemannianMetric J N)
    (Φ : PartialDiffeomorph I J M N ∞) (U : Opens M) (hU : (U : Set M) ⊆ Φ.source)
    (hInner : ∀ x ∈ U, ∀ u v : TangentSpace I x, g.inner x u v =
      h.inner (Φ x) (mfderiv I J Φ x u) (mfderiv I J Φ x v))
    {x : M} (hx : x ∈ U) (w : Fin 4 → TangentSpace I x) :
    metricRm04At g x w = metricRm04At h (Φ x) (fun i => mfderiv I J Φ x (w i)) := by
  let z : U := ⟨x, hx⟩
  have hm (y : U) (u v : TangentSpace I y) :
      g.inner y.val u v = h.inner (Φ y.val) (mfderiv I J Φ y.val u) (mfderiv I J Φ y.val v) :=
    hInner y y.property u v
  have hcurv := metricRm04StandardAt_eq_of_partialDiffeomorph_restriction Φ U hU g h hm z
    (w 0) (w 1) (w 2) (w 3)
  change metricRm04At g x (vec4 (w 0) (w 1) (w 2) (w 3)) =
      metricRm04At h (Φ x) (vec4 (mfderiv I J Φ x (w 0)) (mfderiv I J Φ x (w 1))
        (mfderiv I J Φ x (w 2)) (mfderiv I J Φ x (w 3))) at hcurv
  have hw : vec4 (w 0) (w 1) (w 2) (w 3) = w := by
    funext i
    fin_cases i <;> rfl
  have hw' : vec4 (mfderiv I J Φ x (w 0)) (mfderiv I J Φ x (w 1))
        (mfderiv I J Φ x (w 2)) (mfderiv I J Φ x (w 3)) =
      fun i => mfderiv I J Φ x (w i) := by
    funext i
    fin_cases i <;> rfl
  rw [hw, hw'] at hcurv
  exact hcurv

/-- The ordered physical curvature norm on the Euclidean extension is
the norm on the original carrier at the marked point. -/
theorem bourIntrinsicCurvatureSq_of_partialDiffeomorph_inner
    (g : SmoothRiemannianMetric I M) (h : SmoothRiemannianMetric J N)
    (Φ : PartialDiffeomorph I J M N ∞) (U : Opens M) (hU : (U : Set M) ⊆ Φ.source)
    (hInner : ∀ x ∈ U, ∀ u v : TangentSpace I x, g.inner x u v =
      h.inner (Φ x) (mfderiv I J Φ x u) (mfderiv I J Φ x v))
    {x : M} (hx : x ∈ U) : intrinsicCurvatureSq g x = intrinsicCurvatureSq h (Φ x) := by
  classical
  obtain ⟨b, hb⟩ := Tensor0SBundle.exists_orthonormal_basis g x
  let e := ((Φ.isLocalDiffeomorphAt I J ∞ (hU hx)).mfderivToContinuousLinearEquiv (by simp)).toLinearEquiv
  let b' := b.map e
  have he (w : TangentSpace I x) : e w = mfderiv I J Φ x w := rfl
  have hb' (i j) : h.inner (Φ x) (b' i) (b' j) = if i = j then 1 else 0 := by
    simp only [b', Module.Basis.map_apply, he, ← hInner x hx, hb]
  unfold intrinsicCurvatureSq
  rw [normSq0S_identity_eq_sum_sq _ _ _ b (metricInverseInBasis_identity_of_orthonormal g b hb),
    normSq0S_identity_eq_sum_sq _ _ _ b' (metricInverseInBasis_identity_of_orthonormal h b' hb')]
  apply Finset.sum_congr rfl
  intro w _
  congr 1
  simp only [component0S_apply, b', Module.Basis.map_apply, he]
  exact bourRm04_of_partialDiffeomorph_inner g h Φ U hU hInner hx (fun i => b (w i))

section Ricci

variable [I.Boundaryless] [J.Boundaryless] [BoundarylessManifold I M] [BoundarylessManifold J N]

/-- The physical Ricci value on a marked open subset. The pulled-back
metric equality is used on the open subtype before taking curvature. -/
theorem bourRicciTensor_of_partialDiffeomorph_inner
    (g : SmoothRiemannianMetric I M) (h : SmoothRiemannianMetric J N)
    (Φ : PartialDiffeomorph I J M N ∞) (U : Opens M) (hU : (U : Set M) ⊆ Φ.source)
    (hInner : ∀ x ∈ U, ∀ u v : TangentSpace I x, g.inner x u v =
      h.inner (Φ x) (mfderiv I J Φ x u) (mfderiv I J Φ x v))
    {x : M} (hx : x ∈ U) (u v : TangentSpace I x) :
    ricciTensor g x u v =
      ricciTensor h (Φ x) (mfderiv I J Φ x u) (mfderiv I J Φ x v) := by
  let f : U → N := fun y => Φ y
  have hf : IsLocalDiffeomorph I J ∞ f :=
    isLocalDiffeomorph_restrict_open U (fun y => ⟨Φ, hU y.property, fun _ _ => rfl⟩)
  have hd (y : U) (w : TangentSpace I y) :
      mfderiv I J f y w = mfderiv I J Φ y.val w := by
    have hΦ := (Φ.contMDiffOn_toFun.contMDiffAt
      (Φ.open_source.mem_nhds (hU y.property))).mdifferentiableAt (by simp)
    change mfderiv I J ((Φ : M → N) ∘ (Subtype.val : U → M)) y w = _
    rw [mfderiv_comp y hΦ ((contMDiff_subtype_val (I := I) (U := U) (n := ∞)).mdifferentiableAt (by simp)),
      ContinuousLinearMap.comp_apply, mfderiv_subtype_val_apply]
  have hg : g.restrictOpen U = localPullMetric h f hf := by
    apply SmoothRiemannianMetric.ext_inner
    intro y a b
    rw [localPullMetric_inner, SmoothRiemannianMetric.restrictOpen_inner, hd, hd]
    exact hInner y y.property a b
  let z : U := ⟨x, hx⟩
  let a : TangentSpace I z := u
  let b : TangentSpace I z := v
  have ha : mfderiv I I (Subtype.val : U → M) z a = u :=
    mfderiv_subtype_val_apply (I := I) U z a
  have hb : mfderiv I I (Subtype.val : U → M) z b = v :=
    mfderiv_subtype_val_apply (I := I) U z b
  have hRest := DifferentialGeometry.Geometry.Curvature.ricciTensor_restrictOpen (I := I) g U z a b
  rw [ha, hb] at hRest
  have hLocal := ricciTensor_localPull (I := I) (J := J) h f hf z a b
  rw [hd z a, hd z b] at hLocal
  exact hRest.symm.trans ((congrArg (fun k => ricciTensor k z a b) hg).trans hLocal)

/-- The full rough Ricci tensor on the Euclidean extension agrees on the
physical chart with the rough Ricci tensor on the original carrier. -/
theorem bourRoughRicci_of_partialDiffeomorph_inner
    (g : SmoothRiemannianMetric I M) (h : SmoothRiemannianMetric J N)
    (Φ : PartialDiffeomorph I J M N ∞) (U : Opens M) (hU : (U : Set M) ⊆ Φ.source)
    (hInner : ∀ x ∈ U, ∀ u v : TangentSpace I x, g.inner x u v =
      h.inner (Φ x) (mfderiv I J Φ x u) (mfderiv I J Φ x v))
    {x : M} (hx : x ∈ U) (w : Fin 2 → TangentSpace I x) :
    roughLap0SField g (metricRicci g) x w =
      roughLap0SField h (metricRicci h) (Φ x) (fun i => mfderiv I J Φ x (w i)) := by
  apply bourRoughLap_of_partialDiffeomorph_inner g h Φ U hU hInner _ _ ?_ hx w
  intro y hy v
  have hv : v = vec2 (v 0) (v 1) := by
    funext i
    fin_cases i <;> rfl
  rw [hv]
  have hMap : (fun i => mfderiv I J Φ y (vec2 (v 0) (v 1) i)) =
      vec2 (mfderiv I J Φ y (v 0)) (mfderiv I J Φ y (v 1)) := by
    funext i
    fin_cases i <;> rfl
  rw [hMap, metricRicci_apply, metricRicci_apply, metricRicciAt_apply_eq_ricciTensor,
    metricRicciAt_apply_eq_ricciTensor]
  exact bourRicciTensor_of_partialDiffeomorph_inner g h Φ U hU hInner hy _ _

/-- The rough trace-free Ricci slot of the stationary equation transports
on the same physical open chart, without scalar or stationarity assumptions
on the extension off the chart. -/
theorem bourRoughTraceFreeRicci_of_partialDiffeomorph_inner
    (g : SmoothRiemannianMetric I M) (h : SmoothRiemannianMetric J N)
    (Φ : PartialDiffeomorph I J M N ∞) (U : Opens M) (hU : (U : Set M) ⊆ Φ.source)
    (hInner : ∀ x ∈ U, ∀ u v : TangentSpace I x, g.inner x u v =
      h.inner (Φ x) (mfderiv I J Φ x u) (mfderiv I J Φ x v))
    {x : M} (hx : x ∈ U) (u v : TangentSpace I x) :
    roughLap0SField g (bourTraceFreeRicciField g) x (vec2 u v) =
      roughLap0SField h (bourTraceFreeRicciField h) (Φ x)
        (vec2 (mfderiv I J Φ x u) (mfderiv I J Φ x v)) := by
  have hMap (y : M) (a b : TangentSpace I y) :
      (fun i => mfderiv I J Φ y (vec2 a b i)) =
        vec2 (mfderiv I J Φ y a) (mfderiv I J Φ y b) := by
    funext i
    fin_cases i <;> rfl
  rw [← hMap]
  apply bourRoughLap_of_partialDiffeomorph_inner g h Φ U hU hInner _ _ ?_ hx
  intro y hy w
  have hw : w = vec2 (w 0) (w 1) := by
    funext i
    fin_cases i <;> rfl
  rw [hw, hMap, bourTraceFreeRicciField_apply, bourTraceFreeRicciField_apply,
    metricRicciAt_apply_eq_ricciTensor, metricRicciAt_apply_eq_ricciTensor,
    bourRicciTensor_of_partialDiffeomorph_inner g h Φ U hU hInner hy,
    metricScalarAt_eq_of_partialDiffeomorph_inner g h Φ U hU hInner hy, hInner y hy]

/-- The stationary rough forcing on the actual harmonic patch is the
physical forcing evaluated at its image. Scalar constancy and stationarity
are used only on the original carrier. -/
theorem bourStationaryRoughTraceFreeRicci_of_partialDiffeomorph_inner
    (g : SmoothRiemannianMetric I M) (h : SmoothRiemannianMetric J N)
    (Φ : PartialDiffeomorph I J M N ∞) (U : Opens M) (hU : (U : Set M) ⊆ Φ.source)
    (hInner : ∀ x ∈ U, ∀ u v : TangentSpace I x, g.inner x u v =
      h.inner (Φ x) (mfderiv I J Φ x u) (mfderiv I J Φ x v))
    (α R : ℝ) (hR : ∀ y, metricScalarAt h y = R)
    {x : M} (hx : x ∈ U) (hStat : bourCovariantGradient α h (Φ x) = 0)
    (u v : TangentSpace I x) :
    let du := mfderiv I J Φ x u
    let dv := mfderiv I J Φ x v
    roughLap0SField g (bourTraceFreeRicciField g) x (vec2 u v) =
      -2 * hamiltonCurvatureRicciAt h (Φ x) (vec2 du dv) -
        (α - 4) / 6 * R * metricRicciAt h (Φ x) (vec2 du dv) +
        bourBulkDensity α h (Φ x) * h.inner (Φ x) du dv := by
  dsimp only
  rw [bourRoughTraceFreeRicci_of_partialDiffeomorph_inner g h Φ U hU hInner hx]
  exact bourStationary_roughTraceFreeRicci_eq α h R hR (Φ x) hStat _ _

end Ricci

end
end SmoothPoincare
