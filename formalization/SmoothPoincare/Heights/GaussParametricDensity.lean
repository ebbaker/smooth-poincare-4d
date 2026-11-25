import SmoothPoincare.Heights.GaussDifferential
import SmoothPoincare.Heights.GaussRegularCover
import DifferentialGeometry.Geometry.Metric.Sphere.Round.Metric
import DifferentialGeometry.Analysis.Integration.Measure.Parametric.Chart
import Mathlib.Analysis.InnerProductSpace.GramMatrix
import Mathlib.LinearAlgebra.Matrix.BilinearForm

/-! # Parametric densities for the actual Gauss map -/

open DifferentialGeometry DifferentialGeometry.Geometry DifferentialGeometry.Integral.Measure
open DifferentialGeometry.Tensor.Coordinates
open FirstOrderTwistor Filter Function MeasureTheory Module Set
open scoped BigOperators ContDiff ENNReal Manifold Matrix Topology

namespace SmoothPoincare

private theorem sqrt_det_bilinForm_pullback {V W ι : Type*}
    [AddCommGroup V] [Module ℝ V] [AddCommGroup W] [Module ℝ W]
    [Fintype ι] [DecidableEq ι]
    (B : LinearMap.BilinForm ℝ W) (bV : Basis ι ℝ V) (bW : Basis ι ℝ W)
    (L : V →ₗ[ℝ] W) :
    Real.sqrt (LinearMap.BilinForm.toMatrix bV (B.comp L L)).det =
      |(LinearMap.toMatrix bV bW L).det| *
        Real.sqrt (LinearMap.BilinForm.toMatrix bW B).det := by
  rw [LinearMap.BilinForm.toMatrix_comp bW bV B L L, Matrix.det_mul, Matrix.det_mul,
    Matrix.det_transpose]
  let C := LinearMap.toMatrix bV bW L
  let G := LinearMap.BilinForm.toMatrix bW B
  change Real.sqrt (C.det * G.det * C.det) = |C.det| * Real.sqrt G.det
  rw [show C.det * G.det * C.det = C.det ^ 2 * G.det by ring,
    Real.sqrt_mul (sq_nonneg _) G.det, Real.sqrt_sq_eq_abs]

local notation "V₄" => EuclideanSpace ℝ (Fin 4)
local notation "V₅" => EuclideanSpace ℝ (Fin 5)
local notation "ιₛ" => ((↑) : GaussDirection → V₅)
local instance : Fact (Module.finrank ℝ V₅ = 4 + 1) := ⟨by simp⟩
local notation "gₛ" => (roundMetric (E := V₅) (n := 4))

section Density

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  {g : SmoothRiemannianMetric I M} {o : ManifoldOrientation I M 4}

private noncomputable def tangentBilinForm {E' H' M' : Type*}
    [NormedAddCommGroup E'] [NormedSpace ℝ E'] [TopologicalSpace H']
    {I' : ModelWithCorners ℝ E' H'} [TopologicalSpace M'] [ChartedSpace H' M']
    [IsManifold I' ∞ M'] (g' : SmoothRiemannianMetric I' M') (x : M') :
    LinearMap.BilinForm ℝ (TangentSpace I' x) :=
  (ContinuousLinearMap.coeLM ℝ).comp (g'.inner x).toLinearMap

/-- The norm of the exterior fourth power of the differential computed in
    an orthonormal source frame, using the round sphere metric. -/
noncomputable def gaussFrameJacobian (n : M → GaussDirection) {x : M}
    (b : OrientedOrthonormalFrameAt g o x) : ℝ :=
  let L := mfderiv I (𝓡 4) n x
  Real.sqrt (Matrix.of (fun i j => (gₛ).inner (n x) (L (b.basis i)) (L (b.basis j)))).det

/-- The round metric evaluates the Gauss tangent differential by the ambient
    Euclidean inner product of the included normal differential. -/
theorem gaussFrameJacobian_eq_ambient (n : M → GaussDirection) {x : M}
    (b : OrientedOrthonormalFrameAt g o x) (hn : MDifferentiableAt I (𝓡 4) n x) :
    gaussFrameJacobian n b =
      Real.sqrt (Matrix.of (fun i j =>
        inner ℝ (mvfderiv I (ιₛ ∘ n) x (b.basis i))
          (mvfderiv I (ιₛ ∘ n) x (b.basis j)))).det := by
  have hi := (contMDiff_coe_sphere (E := V₅) (n := 4) (m := ∞)).mdifferentiableAt
    (by simp) (x := n x)
  unfold gaussFrameJacobian
  simp only [roundMetric_inner, dIncl, mvfderiv_comp x hi hn,
    ContinuousLinearMap.comp_apply]

/-- Nonzero fourth Gram Jacobian is exactly invertibility of the
    tangent Gauss differential between the two four-dimensional fibers. -/
theorem gaussMFDeriv_isInvertible_iff_frameJacobian_ne_zero (n : M → GaussDirection) {x : M}
    (b : OrientedOrthonormalFrameAt g o x) (hn : MDifferentiableAt I (𝓡 4) n x) :
    (mfderiv I (𝓡 4) n x).IsInvertible ↔ gaussFrameJacobian n b ≠ 0 := by
  let D := mfderiv I (𝓡 4) n x
  let A := mvfderiv I (ιₛ ∘ n) x
  let v := fun i => A (b.basis i)
  have hi := (contMDiff_coe_sphere (E := V₅) (n := 4) (m := ∞)).mdifferentiableAt
    (by simp) (x := n x)
  have hcomp : A = (dIncl (n := 4) (n x)).comp D := mvfderiv_comp x hi hn
  rw [gaussFrameJacobian_eq_ambient n b hn]
  change D.IsInvertible ↔ Real.sqrt (Matrix.gram ℝ v).det ≠ 0
  constructor
  · intro hD
    have hA : Injective A := by
      rw [hcomp]
      exact (injective_mvfderiv_subtypeVal_sphere (n x)).comp hD.injective
    have hli : LinearIndependent ℝ v :=
      b.basis.linearIndependent.map' A.toLinearMap (LinearMap.ker_eq_bot.mpr hA)
    exact (Real.sqrt_pos.mpr (Matrix.posDef_gram_of_linearIndependent hli).det_pos).ne'
  · intro hs
    have hdet : (Matrix.gram ℝ v).det ≠ 0 := by
      intro h
      exact hs (by rw [h, Real.sqrt_zero])
    have hli := Fintype.linearIndependent_iff.mp (Matrix.linearIndependent_of_det_gram_ne_zero hdet)
    have hker : A.toLinearMap.ker = ⊥ := by
      apply LinearMap.ker_eq_bot'.mpr
      intro u hu
      have hsum : ∑ i, b.basis.repr u i • v i = 0 := by
        change ∑ i, b.basis.repr u i • A (b.basis i) = 0
        simp_rw [← map_smul]
        rw [← map_sum, b.basis.sum_repr]
        exact hu
      calc
        u = ∑ i, b.basis.repr u i • b.basis i := (b.basis.sum_repr u).symm
        _ = 0 := by simp only [hli _ hsum, zero_smul, Finset.sum_const_zero]
    have hA : Injective A.toLinearMap := LinearMap.ker_eq_bot.mp hker
    have hD : Injective D.toLinearMap := by
      intro u w huw
      apply hA
      change A u = A w
      rw [hcomp]
      exact congrArg (dIncl (n := 4) (n x)) huw
    have hdim : Module.finrank ℝ (TangentSpace I x) =
        Module.finrank ℝ (TangentSpace (𝓡 4) (n x)) := by
      rw [Module.finrank_eq_card_basis b.basis]
      change Fintype.card (Fin 4) = Module.finrank ℝ V₄
      simp
    let Q := D.toLinearMap.linearEquivOfInjective hD hdim
    refine ⟨Q.toContinuousLinearEquiv, ?_⟩
    ext u
    exact LinearMap.linearEquivOfInjective_apply hD hdim u

variable [I.Boundaryless]

/-- The Weingarten calculation for the actual smooth unit normal supplies
    the pointwise absolute principal-curvature product. -/
private theorem ImmersionGaussNormal.frameJacobian_eq_abs_prod_of_same_normal
    {F : IsometricHypersurface g} (N : ImmersionGaussNormal F) {x : M}
    (P : PrincipalFrameAt F o x) (hn : MDifferentiableAt I (𝓡 4) N.normal x)
    (hmatch : (N.normal x : V₅) = P.normal) :
    gaussFrameJacobian N.normal P.frame = |∏ i, P.curvature i| := by
  let C := extChartAt I x
  let z := C x
  let f := ιₛ ∘ N.normal
  let n := f ∘ C.symm
  have hz : z ∈ C.target := C.map_source (mem_extChartAt_source x)
  have hC {y : E} (hy : y ∈ C.target) : MDifferentiableAt 𝓘(ℝ, E) I C.symm y :=
    (((contMDiffOn_extChartAt_symm (I := I) (n := ∞) x).contMDiffAt
      ((isOpen_extChartAt_target x).mem_nhds hy)).mdifferentiableAt (by simp))
  have hcenter : C.symm z = x := C.left_inv (mem_extChartAt_source x)
  have hi := (contMDiff_coe_sphere (E := V₅) (n := 4) (m := ∞)).mdifferentiableAt
    (by simp) (x := N.normal x)
  have hf : MDifferentiableAt I 𝓘(ℝ, V₅) f x := hi.comp x hn
  have hn' : DifferentiableAt ℝ n z :=
    (hf.comp_of_eq z (hC hz) hcenter).differentiableAt
  have hLoc : F.localMap x = F.map ∘ C.symm := rfl
  have hnormal : ∀ᶠ y in 𝓝 z, inner ℝ (n y) (n y) = 1 ∧
      ∀ v, inner ℝ (fderiv ℝ (F.localMap x) y v) (n y) = 0 := by
    filter_upwards [(isOpen_extChartAt_target x).mem_nhds hz] with y hy
    refine ⟨?_, fun v => ?_⟩
    · change inner ℝ (N.normal (C.symm y) : V₅) (N.normal (C.symm y) : V₅) = 1
      rw [real_inner_self_eq_norm_sq, mem_sphere_zero_iff_norm.mp (N.normal (C.symm y)).property]
      norm_num
    · have hF := F.smooth.mdifferentiableAt (by simp) (x := C.symm y)
      have hfd : fderiv ℝ (F.map ∘ C.symm) y v =
          mvfderiv 𝓘(ℝ, E) (F.map ∘ C.symm) y v := by
        rw [mvfderiv_eq_fderiv]
        rfl
      rw [hLoc, hfd, mvfderiv_comp y hF (hC hy)]
      exact (real_inner_comm _ _).trans
        (N.perpendicular (C.symm y) (mfderiv 𝓘(ℝ, E) I C.symm y v))
  have hN : n z = P.normal := by
    change (N.normal (C.symm z) : V₅) = P.normal
    rw [hcenter, hmatch]
  have hderiv (v : TangentSpace I x) :
      mvfderiv I (ιₛ ∘ N.normal) x v = fderiv ℝ n z v := by
    have h := tangentLinearMapToModel_mfderiv_eq_fderiv_writtenInExtChartAt hf v
    exact h
  rw [gaussFrameJacobian_eq_ambient N.normal P.frame hn]
  simp only [hderiv]
  exact principalNormal_gramJacobian P n hn' hnormal hN

/-- Either choice of principal normal gives the same absolute product. -/
theorem ImmersionGaussNormal.frameJacobian_eq_abs_prod
    {F : IsometricHypersurface g} (N : ImmersionGaussNormal F) {x : M}
    (P : PrincipalFrameAt F o x) (hn : MDifferentiableAt I (𝓡 4) N.normal x) :
    gaussFrameJacobian N.normal P.frame = |∏ i, P.curvature i| := by
  have hunit : inner ℝ (N.normal x : V₅) (N.normal x : V₅) = 1 := by
    rw [real_inner_self_eq_norm_sq, mem_sphere_zero_iff_norm.mp (N.normal x).property]
    norm_num
  have hcritical : DifferentialGeometry.Topology.Morse.IsCriticalPointAt I
      (immersionHeight F (N.normal x : V₅)) x := by
    rw [immersionHeight_critical_iff]
    exact N.perpendicular x
  rcases (principalHeight_unitCritical_iff P (N.normal x : V₅) hunit).mp hcritical with h | h
  · exact N.frameJacobian_eq_abs_prod_of_same_normal P hn h
  · let Q : PrincipalFrameAt F o x :=
      { frame := P.frame
        normal := -P.normal
        unit := by simpa using P.unit
        perpendicular := fun u => by
          let t : V₅ := mfderiv I 𝓘(ℝ, V₅) F.map x u
          change inner ℝ (-P.normal) t = 0
          have ht : inner ℝ P.normal t = 0 := P.perpendicular u
          simp [ht]
        curvature := fun i => -P.curvature i
        principal := fun i j => by
          rw [P.principal]
          by_cases hij : i = j <;> simp [hij] <;> rfl }
    calc
      _ = |∏ i, Q.curvature i| := N.frameJacobian_eq_abs_prod_of_same_normal Q hn h
      _ = _ := by simp only [Q, Finset.abs_prod, abs_neg]

/-- Nonzero principal curvatures imply regularity of the actual unit
    normal map at the point, in particular on the middle locus. -/
theorem ImmersionGaussNormal.mfderiv_isInvertible_of_principal
    {F : IsometricHypersurface g} (N : ImmersionGaussNormal F) {x : M}
    (P : PrincipalFrameAt F o x) (hn : MDifferentiableAt I (𝓡 4) N.normal x)
    (hcurv : ∀ i, P.curvature i ≠ 0) :
    (mfderiv I (𝓡 4) N.normal x).IsInvertible := by
  rw [gaussMFDeriv_isInvertible_iff_frameJacobian_ne_zero N.normal P.frame hn,
    N.frameJacobian_eq_abs_prod P hn, abs_ne_zero]
  exact Finset.prod_ne_zero_iff.mpr fun i _ => hcurv i

end Density

/-- Transport the target measure and sheet atlas across equal measurable
    space structures, as for the two Borel instances on the direction sphere. -/
def GaussSheetAtlas.transportTargetMeasurableSpace {M N : Type*} [MeasurableSpace M]
    {m m' : MeasurableSpace N} (h : m = m') {n : M → N} {U : Set M}
    {vol : Measure M} {area : @Measure N m} {J : M → ℝ≥0∞}
    (A : @GaussSheetAtlas M N _ m n U vol area J) :
    @GaussSheetAtlas M N _ m' n U vol (cast (congrArg (fun q => @Measure N q) h) area) J := by
  subst m'
  exact A

section RoundParametrization

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ V₄ H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  {g : SmoothRiemannianMetric I M} {o : ManifoldOrientation I M 4}

/-- Pulling back the source metric and the round target metric in one
    parametrization gives the same change-of-basis determinant factor.
    No rank assumption on the Gauss differential is needed. -/
theorem gaussParamDensity_eq_mul_frameJacobian (n : M → GaussDirection)
    (p : V₄ → M) (z : V₄) (b : OrientedOrthonormalFrameAt g o (p z))
    (hp : MDifferentiableAt 𝓘(ℝ, V₄) I p z) (hn : MDifferentiableAt I (𝓡 4) n (p z)) :
    paramDensity gₛ (n ∘ p) z = paramDensity g p z * gaussFrameJacobian n b := by
  classical
  have hdim : Module.finrank ℝ V₄ = 4 := by simp
  let e := finCongr hdim
  let bW := b.basis.reindex e.symm
  let bV := chartModelBasis V₄
  let A := (mfderiv 𝓘(ℝ, V₄) I p z).toLinearMap
  let D := (mfderiv I (𝓡 4) n (p z)).toLinearMap
  let Bsrc := tangentBilinForm g (p z)
  let Btar := (tangentBilinForm gₛ (n (p z))).comp D D
  have hsrc : paramGramMatrix g p z = LinearMap.BilinForm.toMatrix bV (Bsrc.comp A A) := by
    ext i j
    rw [paramGramMatrix_apply, LinearMap.BilinForm.toMatrix_apply]
    rfl
  have htar : paramGramMatrix gₛ (n ∘ p) z =
      LinearMap.BilinForm.toMatrix bV (Btar.comp A A) := by
    ext i j
    rw [paramGramMatrix_apply, LinearMap.BilinForm.toMatrix_apply, mfderiv_comp z hn hp]
    rfl
  have hsrcFrame : LinearMap.BilinForm.toMatrix bW Bsrc = 1 := by
    ext i j
    rw [LinearMap.BilinForm.toMatrix_apply, Matrix.one_apply]
    change g.inner (p z) (b.basis.reindex e.symm i) (b.basis.reindex e.symm j) = _
    simp only [Module.Basis.reindex_apply, Equiv.symm_symm, b.orthonormal, e.injective.eq_iff]
  have htarFrame : Real.sqrt (LinearMap.BilinForm.toMatrix bW Btar).det =
      gaussFrameJacobian n b := by
    unfold gaussFrameJacobian
    congr 1
    rw [← Matrix.det_submatrix_equiv_self e]
    congr 1
    ext i j
    rw [LinearMap.BilinForm.toMatrix_apply, Matrix.submatrix_apply]
    change (gₛ).inner (n (p z)) (D (b.basis.reindex e.symm i)) (D (b.basis.reindex e.symm j)) =
      (gₛ).inner (n (p z)) (D (b.basis (e i))) (D (b.basis (e j)))
    simp
  rw [paramDensity_apply, paramDensity_apply, htar, hsrc,
    sqrt_det_bilinForm_pullback Btar bV bW A, sqrt_det_bilinForm_pullback Bsrc bV bW A,
    hsrcFrame, htarFrame, Matrix.det_one, Real.sqrt_one, mul_one]

variable [I.Boundaryless]

private local instance : MeasurableSpace V₄ := borel V₄
private local instance : BorelSpace V₄ := ⟨rfl⟩
private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

private theorem gaussDirection_borel :
    (inferInstance : MeasurableSpace GaussDirection) = borel GaussDirection :=
  BorelSpace.measurable_eq

private local instance : MeasurableSpace GaussDirection := borel GaussDirection
private local instance : BorelSpace GaussDirection := ⟨rfl⟩

/-- The principal-curvature product is continuous on the smooth normal
    locus by its local expression as a ratio of parametric densities. -/
theorem ImmersionGaussNormal.continuousOn_absPrincipalProduct
    {F : IsometricHypersurface g} (N : ImmersionGaussNormal F) {U : Set M}
    (hU : IsOpen U) (hn : ContMDiffOn I (𝓡 4) ∞ N.normal U)
    (P : ∀ x ∈ U, PrincipalFrameAt F o x)
    {k : M → ℝ} (hprod : ∀ x (hx : x ∈ U), k x = |∏ j, (P x hx).curvature j|) :
    ContinuousOn k U := by
  intro x hx
  let C := DifferentialGeometry.PartialDiffeomorph.extChartAt I ∞ x
  let O : Set V₄ := C.target ∩ C.symm ⁻¹' U
  let W : Set M := C.source ∩ U
  have hO : IsOpen O := C.contMDiffOn_invFun.continuousOn.isOpen_inter_preimage C.open_target hU
  have hW : IsOpen W := C.open_source.inter hU
  have hWx : x ∈ W := ⟨mem_extChartAt_source x, hx⟩
  have hp := C.contMDiffOn_invFun.mono (show O ⊆ C.target from inter_subset_left)
  have hnp := hn.comp hp (fun _ hy => hy.2)
  have hp₁ := hp.of_le (show (1 : ℕ∞ω) ≤ (∞ : ℕ∞ω) by simp)
  have hnp₁ := hnp.of_le (show (1 : ℕ∞ω) ≤ (∞ : ℕ∞ω) by simp)
  have hpos (z : V₄) (hz : z ∈ O) : 0 < paramDensity g C.symm z := by
    have hden := paramDensity_extChartAt_symm g x (w := z) hz.1
    change paramDensity g C.symm z = chartDensity g x (C.symm z) at hden
    rw [hden]
    apply chartDensity_pos
    rw [trivializationAt_baseSet_eq_chartAt_source (I := I), ← extChartAt_source (I := I)]
    exact C.toPartialEquiv.symm.map_source hz.1
  have hratio := (continuousOn_paramDensity gₛ hO hnp₁).div
    (continuousOn_paramDensity g hO hp₁) (fun z hz => (hpos z hz).ne')
  have hmap : MapsTo C W O := by
    intro y hy
    refine ⟨C.toPartialEquiv.map_source hy.1, ?_⟩
    change C.toPartialEquiv.symm (C y) ∈ U
    rw [C.toPartialEquiv.left_inv hy.1]
    exact hy.2
  have hcont : ContinuousOn k W := by
    refine (hratio.comp (C.contMDiffOn.continuousOn.mono inter_subset_left) hmap).congr ?_
    intro y hy
    let z := C y
    have hz : z ∈ O := hmap hy
    have hpz := (hp₁.contMDiffAt (hO.mem_nhds hz)).mdifferentiableAt one_ne_zero
    have hnz := (hn.contMDiffAt (hU.mem_nhds hz.2)).mdifferentiableAt (by simp)
    have h := gaussParamDensity_eq_mul_frameJacobian N.normal C.symm z
      (P (C.symm z) hz.2).frame hpz hnz
    rw [N.frameJacobian_eq_abs_prod (P (C.symm z) hz.2) hnz, ← hprod (C.symm z) hz.2] at h
    change k y = paramDensity gₛ (N.normal ∘ C.symm) z / paramDensity g C.symm z
    rw [h, mul_div_cancel_left₀ _ (hpos z hz).ne']
    exact congrArg k (C.toPartialEquiv.left_inv hy.1).symm
  exact ((hcont x hWx).continuousAt (hW.mem_nhds hWx)).continuousWithinAt

variable [PolishSpace M]

/-- Upgrade the regular chart sheets of a smooth unit normal to measured
    sheets with the absolute principal-curvature product as density. -/
def ImmersionGaussNormal.measuredSheets_of_principal
    {F : IsometricHypersurface g} (N : ImmersionGaussNormal F) {U : Set M}
    [SigmaCompactSpace M] (hU : IsOpen U) (hn : ContMDiffOn I (𝓡 4) ∞ N.normal U)
    (S : GaussRegularSheets (H := H) N.normal U)
    (P : ∀ x ∈ U, PrincipalFrameAt F o x)
    {k : M → ℝ} (hk : Measurable k)
    (hprod : ∀ x (hx : x ∈ U), k x = |∏ j, (P x hx).curvature j|) :
    GaussSheetAtlas N.normal U (riemannianVolumeMeasure I M g)
      (riemannianVolumeMeasure (𝓡 4) GaussDirection gₛ) (ENNReal.ofReal ∘ k) := by
  refine ⟨S.sheet, S.measurableSheet, S.disjoint, S.covers, S.injectiveOn, S.measurableImage, ?_⟩
  intro i
  obtain ⟨p, O, B, _, _, hO, hB, hBO, hp, hnp, hpi, hIm⟩ := S.parametrization hU hn i
  rw [← hIm]
  have hMeas : Measurable N.normal := by
    change @Measurable M GaussDirection (borel M) (borel GaussDirection) N.normal
    rw [← gaussDirection_borel]
    exact N.measurable
  apply gaussSheet_pushforward_of_paramDensity g gₛ hMeas hO hB hBO hp hnp hpi
    (hIm ▸ S.injectiveOn i) (ENNReal.measurable_ofReal.comp hk)
  intro z hz
  have hmem : p z ∈ U := S.covers ▸ subset_iUnion S.sheet i (hIm ▸ mem_image_of_mem p hz)
  have hpz := (hp.contMDiffAt (hO.mem_nhds (hBO hz))).mdifferentiableAt one_ne_zero
  have hnz := (hn.contMDiffAt (hU.mem_nhds hmem)).mdifferentiableAt (by simp)
  rw [gaussParamDensity_eq_mul_frameJacobian N.normal p z (P (p z) hmem).frame hpz hnz,
    N.frameJacobian_eq_abs_prod (P (p z) hmem) hnz, ← hprod (p z) hmem]
  exact ENNReal.ofReal_mul (Real.sqrt_nonneg _)

/-- The absolute principal-curvature product has a measurable extension
    from the locus and provides the density of the measured atlas. -/
theorem ImmersionGaussNormal.exists_measuredSheets_of_principal
    {F : IsometricHypersurface g} (N : ImmersionGaussNormal F) {U : Set M}
    [SigmaCompactSpace M] (hU : IsOpen U) (hn : ContMDiffOn I (𝓡 4) ∞ N.normal U)
    (S : GaussRegularSheets (H := H) N.normal U)
    (P : ∀ x ∈ U, PrincipalFrameAt F o x) :
    ∃ k : M → ℝ, Measurable k ∧ (∀ x (hx : x ∈ U), k x = |∏ j, (P x hx).curvature j|) ∧
      Nonempty (GaussSheetAtlas N.normal U (riemannianVolumeMeasure I M g)
        (riemannianVolumeMeasure (𝓡 4) GaussDirection gₛ) (ENNReal.ofReal ∘ k)) := by
  classical
  let k : M → ℝ := fun x => if hx : x ∈ U then |∏ j, (P x hx).curvature j| else 0
  have hprod : ∀ x (hx : x ∈ U), k x = |∏ j, (P x hx).curvature j| := fun x hx => dite_eq_left hx
  have hc := N.continuousOn_absPrincipalProduct hU hn P hprod
  have hk : Measurable k := by
    have hmeas := hc.measurable_piecewise (continuousOn_const (c := (0 : ℝ))) hU.measurableSet
    convert hmeas using 1
    ext x
    by_cases hx : x ∈ U <;> simp [k, hx]
  exact ⟨k, hk, hprod, ⟨N.measuredSheets_of_principal hU hn S P hk hprod⟩⟩

end RoundParametrization
end SmoothPoincare
