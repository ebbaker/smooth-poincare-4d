import SmoothPoincare.Variational.SpatialEulerFlux
import DifferentialGeometry.Geometry.Flow.RicciFlow.Evolution.Curvature.Tensor
import DifferentialGeometry.Geometry.Flow.RicciFlow.Estimates.Uhlenbeck.MetricGauge
import DifferentialGeometry.Geometry.Flow.RicciFlow.Evolution.Scalar.IntrinsicDerivation

/-! # Curvature variation with fixed base and moving metric-bundle slots -/

open DifferentialGeometry DifferentialGeometry.Geometry.Connection DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.PDE.RicciFlow DifferentialGeometry.Tensor0SBundle
open DifferentialGeometry.Tensor.Coordinates FirstOrderTwistor Set
open scoped ContDiff Manifold Topology

noncomputable section

namespace SmoothPoincare

section RicciFlow

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]

private theorem rawCurvatureVariationOnRegular
    {D : RealTimeInterval} (S : SolutionOn (I := I) (M := M) D) (hS : IsSolutionOn S)
    (t : D.RegularTime) (x : M) (m : Fin 4 → CoordinateIdx (𝕜 := ℝ) E) :
    HasDerivAt (fun s => solutionCurvatureComponents S x s x m)
      (rm04VarRHS S x (coordNab2Ric S x) t m) (t : ℝ) := by
  let : CompleteSpace E := FiniteDimensional.complete ℝ E
  let : IsManifold I 1 M := IsManifold.of_le (by decide : (1 : WithTop ℕ∞) ≤ ∞)
  let D' : RealTimeInterval :=
    { carrier := D.regular
      regular := D.regular
      initial := t
      initial_mem := t.2
      regular_subset := Subset.rfl
      regular_isOpen := D.regular_isOpen
      regular_mem_nhds := fun hs => D.regular_isOpen.mem_nhds hs }
  let S' := S.timeRestrict D'
  have hS' : IsSolutionOn S' := isSolutionOn_timeRestrict hS D.regular_subset Subset.rfl
  have hRegular : MetricFrameSpacetimeRegularityInFrameOnLocal S' (coordInv S' x)
      (coordInvDt S' x) (coordinateFrameAt (I := I) x) (coordinateFrameSet (I := I) x) := by
    refine
      { metricSmooth := ?_
        nondegenerateGram := coordInvLocal S' x
        inverseMetricDerivative := coordInvDerivLocal S' hS' x
        uniqueTimeDerivatives := fun s => uniqueDiffWithinAt_of_mem_nhds (D'.regular_mem_nhds s.2)
        frameMetricSpacetimeSmooth := ?_
        frameMetricExtDerivTimeDerivative := ?_ }
    · intro y hy i j s hs
      have h := (coordMetricSmoothAt S' hS' x ⟨s, hs⟩ y hy i j).comp s
        (contMDiffAt_id.prodMk contMDiffAt_const)
      rw [contMDiffAt_iff_contDiffAt] at h
      exact h.contDiffWithinAt
    · intro i j
      exact hS'.smoothMetric.frameCompSmooth _ (coordinateFrameAt_isLocalFrame (I := I) x) i j
    · intro s y hy d a b
      have h := coordMetricDeriv S' hS' x a b s s.2 y hy (coordinateFrameAt (I := I) x d y)
      convert h using 1
      rw [mvfderiv_const_mul (I := I) (-2 : ℝ) (coordRicciMdiff S' x s y hy a b)]
      rfl
  have hMix := coordGammaMix S' hS' x
    (coordGammaEvolution S' hS' x (coordMetricMix S' hS' x (coordMetricDeriv S' hS' x)))
  have h := riemann_covariant_variation_of_solution S' hS' x (coordInvDt S' x)
    (coordNab2Ric S' x) hRegular (coordNab2Regularity S' x) hMix
    (fun s _ => rm13OfSolution S' s) (fun s _ => connCurvOfSolution S' x s) ⟨t, t.2⟩ m
  exact h.hasDerivAt (D.regular_isOpen.mem_nhds t.2)

private theorem contractConnectionHessian {J : Type*} [Fintype J] [DecidableEq J]
    (G Ginv : J → J → ℝ) (z : J) (v : J → ℝ)
    (hinv : ∀ l, (∑ p, G z p * Ginv p l) = if z = l then 1 else 0) :
    (∑ p, (∑ l, Ginv p l * v l) * G z p) = v z := by
  calc
    _ = ∑ p, ∑ l, (G z p * Ginv p l) * v l := by
      apply Finset.sum_congr rfl
      intro p _
      rw [Finset.sum_mul]
      exact Finset.sum_congr rfl fun l _ => by ring
    _ = ∑ l, (∑ p, G z p * Ginv p l) * v l := by
      rw [Finset.sum_comm]
      simp only [Finset.sum_mul]
    _ = _ := by simp [hinv, ite_mul]

private theorem coordinateSharpExpansion
    {D : RealTimeInterval} (S : SolutionOn (I := I) (M := M) D)
    (t : ℝ) (x : M) (i : CoordinateIdx (𝕜 := ℝ) E) :
    let b := coordinateFrameAtToBasis (I := I) x
    let Q := ricciSharp (S.family.metric t) x
    Q (b i) = ∑ p, (∑ l, coordInv S x t x p l *
      ricciCompInFrame S (coordinateFrameAt (I := I) x) t x i l) • b p := by
  intro b Q
  have hRic (j : CoordinateIdx (𝕜 := ℝ) E) :
      (S.family.metric t).inner x (Q (b i)) (b j) =
        ricciCompInFrame S (coordinateFrameAt (I := I) x) t x i j := by
    rw [show Q = ricciSharp (S.family.metric t) x from rfl, inner_ricciSharp,
      ← metricRicciAt_apply_eq_ricciTensor]
    simp only [b, coordinateFrameAt_toBasis_apply, ricciCompInFrame_apply]
    rfl
  have hre (p : CoordinateIdx (𝕜 := ℝ) E) := basis_repr_eq_sum_inv_inner
    (S.family.metric t) x b (fun p l => coordInv S x t x p l) (coordInvReal S x t) (Q (b i)) p
  simp only [hRic] at hre
  simpa only [hre] using (b.sum_repr (Q (b i))).symm

private theorem lowerCurvatureVariation_coord
    {D : RealTimeInterval} (S : SolutionOn (I := I) (M := M) D)
    (t : D.RegularTime) (x : M) (m : Fin 4 → CoordinateIdx (𝕜 := ℝ) E) :
    let N := coordNab2Ric S x (t : ℝ) x
    let b := coordinateFrameAtToBasis (I := I) x
    let Q := ricciSharp (S.family.metric t) x
    let i := m 0
    let j := m 1
    let k := m 2
    let l := m 3
    rm04VarRHS S x (coordNab2Ric S x) t m =
      -N i j k l - N i k j l + N i l j k + N j i k l + N j k i l - N j l i k -
        2 * S.base.rm04 t x (vec4 (b i) (b j) (b k) (Q (b l))) := by
  classical
  intro N b Q i j k l
  let G := metricCompInFrame S (coordinateFrameAt (I := I) x) (t : ℝ) x
  let Ginv := coordInv S x (t : ℝ) x
  let Ric := ricciCompInFrame S (coordinateFrameAt (I := I) x) (t : ℝ) x
  let Γ := christoffelCurvCoeffAt (S.family.connection t) x
  let R := rmComp S x (t : ℝ) x
  let V := fun d a c z => -N d a c z - N d c a z + N d z a c
  have hInv (p : CoordinateIdx (𝕜 := ℝ) E) :
      (∑ q, G l q * Ginv q p) = if l = p then 1 else 0 :=
    (coordInvLocal S x t x (coordinateFrameAt_mem (I := I) x) l p).2
  have hCurv : (∑ p, Γ i j k p * Ric l p) =
      S.base.rm04 t x (vec4 (b i) (b j) (b k) (Q (b l))) := by
    have hQ := coordinateSharpExpansion S t x l
    change Q (b l) = ∑ p, (∑ q, Ginv p q * Ric l q) • b p at hQ
    rw [hQ]
    let m' := vec4 (b i) (b j) (b k) (0 : TangentSpace I x)
    have hu (v : TangentSpace I x) : Function.update m' 3 v = vec4 (b i) (b j) (b k) v := by
      funext q
      fin_cases q <;> rfl
    have heval : S.base.rm04 t x (vec4 (b i) (b j) (b k)
        (∑ p, (∑ q, Ginv p q * Ric l q) • b p)) =
        ∑ p, (∑ q, Ginv p q * Ric l q) * R i j k p := by
      simp only [show (fun p => R i j k p) =
        (fun p => S.base.rm04 t x (vec4 (b i) (b j) (b k) (b p))) by
          funext p; simp only [b, coordinateFrameAt_toBasis_apply, R, rmComp]]
      simp only [← hu]
      change ((S.base.rm04 t x).toMultilinearMap.toLinearMap m' 3) _ = _
      simp only [map_sum, map_smul, MultilinearMap.toLinearMap_apply, smul_eq_mul]
      rfl
    rw [heval]
    simp_rw [Γ, rmRaise S x t]
    change (∑ p, (∑ q, Ginv p q * R i j k q) * Ric l p) = _
    simp_rw [Finset.sum_mul]
    rw [Finset.sum_comm]
    apply Finset.sum_congr rfl
    intro p _
    apply Finset.sum_congr rfl
    intro q _
    have hSym : Ginv q p = Ginv p q :=
      coordInvSymmOn S x t (coordinateFrameAt_mem (I := I) x) q p
    change Ginv q p * R i j k p * Ric l q = Ginv p q * Ric l q * R i j k p
    rw [hSym]
    ring
  change (∑ p, (((∑ z, Ginv p z * V i j k z) - (∑ z, Ginv p z * V j i k z)) * G l p +
      Γ i j k p * (-2 * Ric l p))) = _
  simp only [sub_mul, Finset.sum_add_distrib, Finset.sum_sub_distrib]
  rw [contractConnectionHessian G Ginv l (V i j k) hInv,
    contractConnectionHessian G Ginv l (V j i k) hInv]
  have hScale : (∑ p, Γ i j k p * (-2 * Ric l p)) = -2 * (∑ p, Γ i j k p * Ric l p) := by
    rw [Finset.mul_sum]
    exact Finset.sum_congr rfl fun p _ => by ring
  rw [hScale, hCurv]
  dsimp only [V]
  ring

private def framePerm (f g : Fin 4 → Fin 4)
    (hfg : Function.LeftInverse g f) (hgf : Function.RightInverse g f) : Fin 4 ≃ Fin 4 :=
  ⟨f, g, hfg, hgf⟩

private def ricciGaugeHessian (g : SmoothRiemannianMetric I M) (x : M) :
    Tensor0SSpace 4 I x := by
  letI : CompleteSpace E := FiniteDimensional.complete ℝ E
  exact metricNabla2Ric g x

private def rawEulerCurvatureSpeed {D : RealTimeInterval}
    (S : SolutionOn (I := I) (M := M) D) (t : ℝ) (x : M) : Tensor0SSpace 4 I x :=
  let N := ricciGaugeHessian (S.family.metric t) x
  let Q := ricciSharp (S.family.metric t) x
  let R := S.base.rm04 t x
  let RQ : Tensor0SSpace 4 I x := R.compContinuousLinearMap fun j =>
    if j = 3 then Q else ContinuousLinearMap.id ℝ (TangentSpace I x)
  (-N) - N.domDomCongr (framePerm ![0, 2, 1, 3] ![0, 2, 1, 3] (by decide) (by decide))
    + N.domDomCongr (framePerm ![0, 3, 1, 2] ![0, 2, 3, 1] (by decide) (by decide))
    + N.domDomCongr (framePerm ![1, 0, 2, 3] ![1, 0, 2, 3] (by decide) (by decide))
    + N.domDomCongr (framePerm ![1, 2, 0, 3] ![2, 0, 1, 3] (by decide) (by decide))
    - N.domDomCongr (framePerm ![1, 3, 0, 2] ![2, 0, 3, 1] (by decide) (by decide))
    - (2 : ℝ) • RQ

private theorem rawEulerCurvatureSpeed_apply {D : RealTimeInterval}
    (S : SolutionOn (I := I) (M := M) D) (t : ℝ) (x : M) (X Y V W : TangentSpace I x) :
    let N := ricciGaugeHessian (S.family.metric t) x
    let Q := ricciSharp (S.family.metric t) x
    rawEulerCurvatureSpeed S t x (vec4 X Y V W) =
      -N (vec4 X Y V W) - N (vec4 X V Y W) + N (vec4 X W Y V) +
      N (vec4 Y X V W) + N (vec4 Y V X W) - N (vec4 Y W X V) -
      2 * S.base.rm04 t x (vec4 X Y V (Q W)) := by
  intro N Q
  have h (p : Fin 4 ≃ Fin 4) : (fun j => vec4 X Y V W (p j)) =
      vec4 (vec4 X Y V W (p 0)) (vec4 X Y V W (p 1))
        (vec4 X Y V W (p 2)) (vec4 X Y V W (p 3)) := by
    funext j
    fin_cases j <;> rfl
  simp only [rawEulerCurvatureSpeed, Tensor0SSpace.sub_apply, Tensor0SSpace.add_apply,
    Tensor0SSpace.neg_apply, Tensor0SSpace.domDomCongr_apply, h]
  rfl

private theorem rawCurvatureTensor_hasDerivAt {D : RealTimeInterval}
    (S : SolutionOn (I := I) (M := M) D) (hS : IsSolutionOn S)
    (t : D.RegularTime) (x : M) :
    HasDerivAt (fun s => S.base.rm04 s x) (rawEulerCurvatureSpeed S t x) (t : ℝ) := by
  let : CompleteSpace E := FiniteDimensional.complete ℝ E
  let b := coordinateFrameAtToBasis (I := I) x
  let e := tensor0SSpaceFiberContinuousLinearEquiv (I := I) 4 x
  have hCML : HasDerivAt (fun s => e (S.base.rm04 s x)) (e (rawEulerCurvatureSpeed S t x)) (t : ℝ) := by
    apply ContinuousMultilinearMap.hasDerivAt_of_basis_eval b
    intro m
    have hb (p : CoordinateIdx (𝕜 := ℝ) E) := coordinateFrameAt_toBasis_apply (I := I) x p
    have hm : (fun q => b (m q)) = vec4 (b (m 0)) (b (m 1)) (b (m 2)) (b (m 3)) := by
      funext q
      fin_cases q <;> rfl
    have hN (a i j k : CoordinateIdx (𝕜 := ℝ) E) :
        coordNab2Ric S x t x a i j k = ricciGaugeHessian (S.family.metric t) x
          (vec4 (b a) (b i) (b j) (b k)) := by
      rw [coordNab2Ric_eq_nabla2RicField S x t a i j k]
      simp only [b, hb]
      rfl
    have hd := rawCurvatureVariationOnRegular S hS t x m
    rw [lowerCurvatureVariation_coord] at hd
    simp only [solutionCurvatureComponents_apply, ← hb, hN] at hd
    change HasDerivAt (fun s => S.base.rm04 s x (fun q => b (m q)))
      (rawEulerCurvatureSpeed S t x (fun q => b (m q))) (t : ℝ)
    simpa only [hm, rawEulerCurvatureSpeed_apply, b] using hd
  have h := e.symm.toContinuousLinearMap.hasFDerivAt.comp_hasDerivAt (t : ℝ) hCML
  change HasDerivAt (fun s => e.symm (e (S.base.rm04 s x)))
    (e.symm (e (rawEulerCurvatureSpeed S t x))) (t : ℝ) at h
  simpa only [e.symm_apply_apply] using h

/-- The coefficient of the curvature 2-form in a moving metric-bundle
basis. The vectors `X,Y` in its two base slots are fixed in time. -/
def eulerCurvatureCoefficient {D : RealTimeInterval} (S : SolutionOn (I := I) (M := M) D)
    (x : M) (X Y : TangentSpace I x) (V W : ℝ → TangentSpace I x) (s : ℝ) : ℝ :=
  S.base.rm04 s x (vec4 X Y (V s) (W s))

/-- Differentiate the curvature 2-form of an actual Ricci-flow solution
while moving only its orthonormal bundle arguments by the Ricci gauge ODE. -/
theorem eulerCurvatureCoefficient_hasDerivAt
    {D : RealTimeInterval} (S : SolutionOn (I := I) (M := M) D) (hS : IsSolutionOn S)
    (t : D.RegularTime) (x : M) (X Y : TangentSpace I x) (V W : ℝ → TangentSpace I x)
    (hV : HasDerivAt V (ricciSharp (S.family.metric t) x (V t)) (t : ℝ))
    (hW : HasDerivAt W (ricciSharp (S.family.metric t) x (W t)) (t : ℝ)) :
    let Q := ricciSharp (S.family.metric t) x
    HasDerivAt (eulerCurvatureCoefficient S x X Y V W)
      ((deriv (fun s => S.base.rm04 s x) t) (vec4 X Y (V t) (W t)) +
        S.base.rm04 t x (vec4 X Y (Q (V t)) (W t)) +
        S.base.rm04 t x (vec4 X Y (V t) (Q (W t)))) (t : ℝ) := by
  intro Q
  let e := tensor0SSpaceFiberContinuousLinearEquiv (I := I) 4 x
  let u : ℝ → Fin 4 → TangentSpace I x := fun s => vec4 X Y (V s) (W s)
  let du : Fin 4 → TangentSpace I x := vec4 0 0 (Q (V t)) (Q (W t))
  have hRm := (riemann_differentiableAt_of_solution S hS t x).hasDerivAt
  have hCml := e.toContinuousLinearMap.hasFDerivAt.comp_hasDerivAt (t : ℝ) hRm
  have hu (q : Fin 4) : HasDerivAt (fun s => u s q) (du q) (t : ℝ) := by
    fin_cases q
    · exact hasDerivAt_const _ _
    · exact hasDerivAt_const _ _
    · exact hV
    · exact hW
  have h := hCml.continuousMultilinearMap_apply hu
  have hUpdate0 : Function.update (u t) 0 (du 0) = vec4 0 Y (V t) (W t) := by
    funext q
    fin_cases q <;> rfl
  have hUpdate1 : Function.update (u t) 1 (du 1) = vec4 X 0 (V t) (W t) := by
    funext q
    fin_cases q <;> rfl
  have hUpdate2 : Function.update (u t) 2 (du 2) = vec4 X Y (Q (V t)) (W t) := by
    funext q
    fin_cases q <;> rfl
  have hUpdate3 : Function.update (u t) 3 (du 3) = vec4 X Y (V t) (Q (W t)) := by
    funext q
    fin_cases q <;> rfl
  change HasDerivAt (eulerCurvatureCoefficient S x X Y V W)
    ((deriv (fun s => S.base.rm04 s x) t) (u t) +
      ∑ q : Fin 4, S.base.rm04 t x (Function.update (u t) q (du q))) (t : ℝ) at h
  rw [Fin.sum_univ_four, hUpdate0, hUpdate1, hUpdate2, hUpdate3] at h
  have hzero0 : S.base.rm04 t x (vec4 0 Y (V t) (W t)) = 0 :=
    (S.base.rm04 t x).map_coord_zero (i := 0) rfl
  have hzero1 : S.base.rm04 t x (vec4 X 0 (V t) (W t)) = 0 :=
    (S.base.rm04 t x).map_coord_zero (i := 1) rfl
  simpa only [u, hzero0, hzero1, zero_add, add_assoc] using h

/-- The covariant spatial derivative of the corrected connection velocity.
`A` is the derivative direction, `Y` the base 1-form argument, and `V,W`
are the two endomorphism slots in the lowered curvature convention. -/
def ricciFlowEulerCovariantJet (g : SmoothRiemannianMetric I M) (x : M)
    (A Y V W : TangentSpace I x) : ℝ :=
  ricciGaugeHessian g x (vec4 A W Y V) - ricciGaugeHessian g x (vec4 A V Y W)

/-- On an actual supplied flow, the time derivative in the moving metric
bundle equals the exterior covariant derivative of its corrected connection
velocity. The two base arguments are fixed. Only the two fiber paths satisfy
the Ricci gauge ODE. -/
theorem eulerCurvatureCoefficient_hasDerivAt_skewJet
    {D : RealTimeInterval} (S : SolutionOn (I := I) (M := M) D) (hS : IsSolutionOn S)
    (t : D.RegularTime) (x : M) (X Y : TangentSpace I x) (V W : ℝ → TangentSpace I x)
    (hV : HasDerivAt V (ricciSharp (S.family.metric t) x (V t)) (t : ℝ))
    (hW : HasDerivAt W (ricciSharp (S.family.metric t) x (W t)) (t : ℝ)) :
    HasDerivAt (eulerCurvatureCoefficient S x X Y V W)
      (ricciFlowEulerCovariantJet (S.family.metric t) x X Y (V t) (W t) -
        ricciFlowEulerCovariantJet (S.family.metric t) x Y X (V t) (W t)) (t : ℝ) := by
  let : CompleteSpace E := FiniteDimensional.complete ℝ E
  let Q := ricciSharp (S.family.metric t) x
  let R := S.base.rm04 t x
  let H := ricciGaugeHessian (S.family.metric t) x
  let v := V t
  let w := W t
  let e := tensor0SSpaceFiberContinuousLinearEquiv (I := I) 4 x
  have hRaw := rawCurvatureTensor_hasDerivAt S hS t x
  have hScalar (v w : TangentSpace I x) :
      HasDerivAt (fun s => S.base.rm04 s x (vec4 X Y v w))
        (rawEulerCurvatureSpeed S t x (vec4 X Y v w)) (t : ℝ) := by
    let eval := ContinuousMultilinearMap.apply ℝ (fun _ : Fin 4 => TangentSpace I x) ℝ (vec4 X Y v w)
    exact (eval.comp e.toContinuousLinearMap).hasFDerivAt.comp_hasDerivAt (t : ℝ) hRaw
  have hSkew (s : D.RegularTime) (p q : TangentSpace I x) :
      S.base.rm04 s x (vec4 X Y p q) = -S.base.rm04 s x (vec4 X Y q p) :=
    rm04OutputSkew_regular S S.base.rm13 S.base.rm04 (fun s => rm13OfSolution S s)
      (fun s => solution_rm04LowersRm13At S s) s x X Y p q
  have hEventually : (fun s => S.base.rm04 s x (vec4 X Y v w)) =ᶠ[nhds (t : ℝ)]
      (fun s => -S.base.rm04 s x (vec4 X Y w v)) := by
    filter_upwards [D.regular_isOpen.mem_nhds t.2] with s hs
    exact hSkew ⟨s, hs⟩ v w
  have hSkewRaw := (hScalar v w).unique ((hScalar w v).neg.congr_of_eventuallyEq hEventually)
  have hH (a b c d : TangentSpace I x) : H (vec4 a b c d) = H (vec4 a b d c) :=
    metricNabla2Ric_last_two_symm (S.family.metric t) x a b c d
  have hMoved := eulerCurvatureCoefficient_hasDerivAt S hS t x X Y V W hV hW
  dsimp only at hMoved
  refine hMoved.congr_deriv ?_
  have hDeriv := hRaw.deriv
  change deriv (fun s => S.base.rm04 s x) (t : ℝ) = rawEulerCurvatureSpeed S t x at hDeriv
  rw [hDeriv]
  change rawEulerCurvatureSpeed S t x (vec4 X Y v w) + R (vec4 X Y (Q v) w) +
    R (vec4 X Y v (Q w)) = _
  rw [rawEulerCurvatureSpeed_apply] at ⊢
  rw [rawEulerCurvatureSpeed_apply, rawEulerCurvatureSpeed_apply] at hSkewRaw
  change -H (vec4 X Y v w) - H (vec4 X v Y w) + H (vec4 X w Y v) + H (vec4 Y X v w) +
    H (vec4 Y v X w) - H (vec4 Y w X v) - 2 * R (vec4 X Y v (Q w)) =
    -(-H (vec4 X Y w v) - H (vec4 X w Y v) + H (vec4 X v Y w) + H (vec4 Y X w v) +
      H (vec4 Y w X v) - H (vec4 Y v X w) - 2 * R (vec4 X Y w (Q v))) at hSkewRaw
  have hRV : R (vec4 X Y w (Q v)) = -R (vec4 X Y (Q v) w) := hSkew t w (Q v)
  rw [hRV, ← hH X Y v w, ← hH Y X v w] at hSkewRaw
  dsimp only [ricciFlowEulerCovariantJet]
  change -H (vec4 X Y v w) - H (vec4 X v Y w) + H (vec4 X w Y v) + H (vec4 Y X v w) +
    H (vec4 Y v X w) - H (vec4 Y w X v) - 2 * R (vec4 X Y v (Q w)) +
      R (vec4 X Y (Q v) w) + R (vec4 X Y v (Q w)) =
    H (vec4 X w Y v) - H (vec4 X v Y w) - (H (vec4 Y w X v) - H (vec4 Y v X w))
  linarith only [hSkewRaw]

/-- At the tested time the mixed coefficient agrees with the actual slice
curvature array through pair exchange. The base slots remain fixed when
this coefficient is differentiated in time. -/
theorem eulerCurvatureCoefficient_eq_metricFrame
    {D : RealTimeInterval} (S : SolutionOn (I := I) (M := M) D) (t : D.RegularTime)
    (o : ManifoldOrientation I M 4) (x : M)
    (f : OrientedOrthonormalFrameAt (S.family.metric t) o x)
    (b : ℝ → Fin 4 → TangentSpace I x) (hb : ∀ a, b t a = f.basis a)
    (a c i j : Fin 4) :
    eulerCurvatureCoefficient S x (f.basis i) (f.basis j) (fun u => b u c) (fun u => b u a) t =
      metricCurvatureFrameTensor (S.family.metric t) o x f a c i j := by
  rw [← metricCurvatureFrameTensor_pair_symm (S.family.metric t) o x f i j a c]
  let : CompleteSpace E := FiniteDimensional.complete ℝ E
  let : IsManifold I 1 M := IsManifold.of_le (by decide : (1 : WithTop ℕ∞) ≤ ∞)
  simp only [eulerCurvatureCoefficient, hb, metricCurvatureFrameTensor,
    SolutionFamily.rm04, SolutionOn.family_metric, metricRm04StandardAt_apply, metricRm04_apply]

/-- The local Euler polynomial on the actual flow can be differentiated on
four fixed base vectors by moving only the orthonormal bundle frame.
The frame needs its value and Ricci gauge velocity at the tested time. -/
theorem ricciFlowEulerPfaffian_fixedBase_hasDerivAt
    {D : RealTimeInterval} (S : SolutionOn (I := I) (M := M) D) (hS : IsSolutionOn S)
    (t : D.RegularTime) (o : ManifoldOrientation I M 4) (x : M)
    (f : OrientedOrthonormalFrameAt (S.family.metric t) o x)
    (b : ℝ → Fin 4 → TangentSpace I x) (hb : ∀ a, b t a = f.basis a)
    (hd : ∀ a, HasDerivAt (fun s => b s a)
      (ricciSharp (S.family.metric t) x (b t a)) (t : ℝ)) :
    let F := fun s a b' i j => eulerCurvatureCoefficient S x (f.basis i) (f.basis j)
      (fun u => b u b') (fun u => b u a) s
    let α := fun a b' i =>
      let g := S.family.metric t
      let nablaRic := fun a₁ a₂ a₃ => totalNabla0SFun 2 (LeviCivita g) (S.ricci t) x
        (Fin.cons (f.basis a₁) (vec2 (f.basis a₂) (f.basis a₃)))
      nablaRic a i b' - nablaRic b' i a
    let dα := fun a b' i j =>
      ricciFlowEulerCovariantJet (S.family.metric t) x (f.basis i) (f.basis j) (f.basis b') (f.basis a)
    let dF := metricFrameEulerCovariantDerivative (S.family.metric t) o x f
    let dT := fun a b' c d => exteriorWedge12Volume (α a b') (F t c d) (dα a b') (dF c d)
    HasDerivAt (fun s => 2 * frameEulerPfaffian (F s))
      (2 * (dT 0 1 2 3 + dT 2 3 0 1 - dT 0 2 1 3 - dT 1 3 0 2 +
        dT 0 3 1 2 + dT 1 2 0 3)) (t : ℝ) := by
  intro F α dα dF dT
  refine frameEulerPfaffian_hasDerivAt_of_bianchi F t α dα dF ?_ ?_
  · intro a b' i j
    simpa only [F, dα, hb] using eulerCurvatureCoefficient_hasDerivAt_skewJet
      S hS t x (f.basis i) (f.basis j) (fun u => b u b') (fun u => b u a) (hd b') (hd a)
  · intro a b'
    exact ⟨metricFrameEulerCovariantDerivative_bianchi (S.family.metric t) o x f a b' 0 1 2,
      metricFrameEulerCovariantDerivative_bianchi (S.family.metric t) o x f a b' 0 1 3,
      metricFrameEulerCovariantDerivative_bianchi (S.family.metric t) o x f a b' 0 2 3,
      metricFrameEulerCovariantDerivative_bianchi (S.family.metric t) o x f a b' 1 2 3⟩

end RicciFlow
end SmoothPoincare
