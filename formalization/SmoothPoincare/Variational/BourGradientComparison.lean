import SmoothPoincare.Variational.BourOriginalGradient
import SmoothPoincare.Variational.BourGradientBianchi
import SmoothPoincare.Variational.BourCrossedRicci
import DifferentialGeometry.Geometry.Connection.TensorNabla.Tensor0S.Algebra.ProductLeibniz
import DifferentialGeometry.Geometry.Connection.TensorNabla.Tensor0S.MetricConnectionDifference

/-! # Curvature-commuted formula for the physical Bour gradient

E50, 26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Actual serving model and reasoning effort were unavailable.
-/

open Bundle DifferentialGeometry DifferentialGeometry.Geometry.Connection
  DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Geometry.Operator
  DifferentialGeometry.PDE.RicciFlow DifferentialGeometry.Tensor0SBundle
  DifferentialGeometry.Tensor.RSTensor
open scoped ContDiff Manifold

namespace SmoothPoincare.Bour

noncomputable section

variable {E H M : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]

private local instance : IsManifold I 1 M := IsManifold.of_le (by decide : (1 : WithTop ℕ∞) ≤ ∞)
private local instance : IsManifold I 2 M := IsManifold.of_le (by decide : (2 : WithTop ℕ∞) ≤ ∞)

private theorem covDiv3_apply_orthonormal (g : SmoothRiemannianMetric I M)
    (A : Tensor0SField (I := I) (M := M) ∞ 3) {x : M}
    (b : Module.Basis (Fin (Module.finrank ℝ E)) ℝ (TangentSpace I x))
    (hb : ∀ i j, g.inner x (b i) (b j) = if i = j then 1 else 0)
    (u v : TangentSpace I x) :
    covDiv0SField g A x (vec2 u v) =
      ∑ i, metricNabla0S g A x (vec4 (b i) (b i) u v) := by
  classical
  have hinv := metricInverseInBasis_identity_of_orthonormal g b hb
  rw [covDiv0SField, metricTraceFirstTwoField_apply, metricTraceFirstTwo0STensor_apply,
    metricTraceFirstTwo0SAt_eq_sum_basis g b identityInvMetric hinv]
  unfold metricTrace0S2InBasis
  have hin (i j : Fin (Module.finrank ℝ E)) :
      metricTraceInput (I := I) (b i) (b j) (vec2 u v) = vec4 (b i) (b j) u v := by
    funext k
    fin_cases k <;> rfl
  simp [hin, identityInvMetric, diagonalInvMetric, ite_mul]

/-- Read the two crossed terms in the actual Koszul-flux adjoint with
the first derivative fixed in front of the permuted three slots. -/
theorem bourRicciFluxAdjoint_apply_orthonormal (g : SmoothRiemannianMetric I M)
    (A : Tensor0SField (I := I) (M := M) ∞ 2) {x : M}
    (b : Module.Basis (Fin (Module.finrank ℝ E)) ℝ (TangentSpace I x))
    (hb : ∀ i j, g.inner x (b i) (b j) = if i = j then 1 else 0)
    (u v : TangentSpace I x) :
    let S := metricNabla0S g (metricNabla0S g A) x
    bourRicciFluxAdjoint g A x (vec2 u v) =
      (1 / 2 : ℝ) * ((∑ i, S (vec4 (b i) v (b i) u)) +
        (∑ i, S (vec4 (b i) v u (b i))) -
        ∑ i, S (vec4 (b i) (b i) u v)) := by
  dsimp only
  let e := (Equiv.swap (0 : Fin 3) 1).trans (Equiv.swap (0 : Fin 3) 2)
  let f := (Equiv.swap (0 : Fin 3) 2)
  have hperm (σ : Equiv.Perm (Fin 3)) (p : Fin 4 → TangentSpace I x) :
      metricNabla0S g (Tensor0SField.domDomCongr ∞ σ (metricNabla0S g A)) x p =
        metricNabla0S g (metricNabla0S g A) x (p ∘ frontExtendEquiv σ) := by
    rw [metricNabla0S_apply, totalNabla0SFun_domDomCongr, Tensor0SSpace.domDomCongr_apply]
    rfl
  have hE (z : TangentSpace I x) :
      vec4 z z u v ∘ frontExtendEquiv e.symm = vec4 z v z u := by
    funext j
    fin_cases j <;> rfl
  have hF (z : TangentSpace I x) :
      vec4 z z u v ∘ frontExtendEquiv f.symm = vec4 z v u z := by
    funext j
    fin_cases j <;> rfl
  simp only [bourRicciFluxAdjoint, ContMDiffSection.coe_smul, Pi.smul_apply,
    ContMDiffSection.coe_sub, Pi.sub_apply, ContMDiffSection.coe_add, Pi.add_apply,
    Tensor0SSpace.sub_apply, Tensor0SSpace.add_apply, Tensor0SSpace.smul_apply, smul_eq_mul]
  rw [roughLap0SField]
  simp only [covDiv3_apply_orthonormal g _ b hb, hperm]
  simp only [e, f] at hE hF
  simp only [hE, hF]

/-- Metric compatibility identifies the uncommuted derivative with the
ordered trace of the second derivative. -/
theorem bourNablaDivergence_apply_orthonormal (g : SmoothRiemannianMetric I M)
    (A : Tensor0SField (I := I) (M := M) ∞ 2) {x : M}
    (b : Module.Basis (Fin (Module.finrank ℝ E)) ℝ (TangentSpace I x))
    (hb : ∀ i j, g.inner x (b i) (b j) = if i = j then 1 else 0)
    (u v : TangentSpace I x) :
    metricNabla0S g (covDiv0SField g A) x (vec2 u v) =
      ∑ i, metricNabla0S g (metricNabla0S g A) x (vec4 u (b i) (b i) v) := by
  classical
  have hinv := metricInverseInBasis_identity_of_orthonormal g b hb
  have h := nabla_metricTraceFirstTwo0S (metricCov g) g
    (leviCivitaConnectionOfMetric_isMetricCompatible g) (metricNabla0S g A)
    b identityInvMetric hinv u (fun _ => v)
  have hu : Fin.cons u (fun _ => v) = vec2 (I := I) u v := by
    funext k
    fin_cases k <;> rfl
  have hin (i j : Fin (Module.finrank ℝ E)) :
      Fin.cons u (metricTraceInput (I := I) (b i) (b j) (fun _ => v)) =
        vec4 u (b i) (b j) v := by
    funext k
    fin_cases k <;> rfl
  rw [hu] at h
  simp only [hin, identityInvMetric, diagonalInvMetric, ite_mul, one_mul, zero_mul,
    Finset.sum_ite_eq, Finset.mem_univ, ite_true] at h
  exact h

private theorem metricNabla0S_zero' {s : ℕ} (g : SmoothRiemannianMetric I M) :
    metricNabla0S g (0 : Tensor0SField (I := I) (M := M) ∞ s) = 0 := by
  simpa only [sub_self] using
    (metricNabla0S_sub g (0 : Tensor0SField (I := I) (M := M) ∞ s) 0)

private theorem scalarDifferential_eq_zero (g : SmoothRiemannianMetric I M)
    (R : ℝ) (hR : ∀ y, metricScalarAt g y = R) :
    duSec (metricScalarAt g) (metricScalar_smooth g) = 0 := by
  ext x w
  have hw : w = fun _ => w 0 := by funext i; fin_cases i; rfl
  rw [hw, duSec_apply, differential1FormFun_apply_eq_mvfderiv]
  rw [show metricScalarAt g = fun _ => R from funext hR]
  simp [mvfderiv, mfderiv_const]

variable [BoundarylessManifold I M]

omit [BoundarylessManifold I M] in
private theorem roughLap_metricRicci_symm (g : SmoothRiemannianMetric I M) (x : M)
    (u v : TangentSpace I x) :
    roughLap0SField g (metricRicci g) x (vec2 u v) =
      roughLap0SField g (metricRicci g) x (vec2 v u) := by
  classical
  obtain ⟨b, hb⟩ := exists_orthonormal_basis (I := I) g x
  change Module.Basis (Fin (Module.finrank ℝ E)) ℝ (TangentSpace I x) at b
  rw [roughLap0SField, covDiv3_apply_orthonormal g _ b hb,
    covDiv3_apply_orthonormal g _ b hb]
  exact Finset.sum_congr rfl fun i _ => metricNabla2Ric_last_two_symm g x (b i) (b i) u v

omit [BoundarylessManifold I M] in
private theorem curvatureRicci_symm (g : SmoothRiemannianMetric I M) (x : M)
    (u v : TangentSpace I x) :
    hamiltonCurvatureRicciAt g x (vec2 u v) = hamiltonCurvatureRicciAt g x (vec2 v u) := by
  classical
  obtain ⟨b, hb⟩ := exists_orthonormal_basis (I := I) g x
  let B := identityInvMetric (Idx := Fin (Module.finrank ℝ (TangentSpace I x)))
  have hB := metricInverseInBasis_identity_of_orthonormal g b hb
  let R := metricRm04 g x
  let Q := metricRicci g x
  have hδ (p : Fin (Module.finrank ℝ (TangentSpace I x))) (T : _ → ℝ) :
      (∑ q, B p q * T q) = T p := by
    simp [B, identityInvMetric, diagonalInvMetric, ite_mul]
  have hraised (p q : Fin (Module.finrank ℝ (TangentSpace I x))) :
      raised02CompAt (I := I) b B Q p q = Q (vec2 (b p) (b q)) := by
    unfold raised02CompAt
    calc
      _ = ∑ i, B p i * ∑ j, B q j * Q (vec2 (b i) (b j)) := by
        simp only [Finset.mul_sum, mul_assoc]
      _ = _ := by simp only [hδ]
  have hpair := rm04PairSymmAt_of_leviCivita_realizes g (metricRm04 g)
    (metricCurvatureSections g).rm04Realizes (x := x)
  have hin := rm04InputSkewAt_of_leviCivita_realizes g (metricRm04 g)
    (metricCurvatureSections g).rm04Realizes (x := x)
  have hout := rm04OutputSkewAt_of_leviCivita_realizes g (metricRm04 g)
    (metricCurvatureSections g).rm04Realizes (x := x)
  rw [hamiltonCurvatureRicciAt_eq_raised_contraction g b B hB,
    hamiltonCurvatureRicciAt_eq_raised_contraction g b B hB]
  simp_rw [show metricRicci g x = Q from rfl, hraised]
  rw [Finset.sum_comm]
  refine Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun j _ => ?_
  rw [hpair u (b j) (b i) v, ← neg_neg (R (vec4 (b i) v u (b j)))]
  rw [← hin (b i) v u (b j), ← hout v (b i) (b j) u]
  rw [show Q (vec2 (b j) (b i)) = Q (vec2 (b i) (b j)) from
    metricRicciSymm g b B hB j i]

omit [BoundarylessManifold I M] in
/-- A second differentiation of a scalar times the parallel metric gives
the Hessian in the first two slots and the metric in the last two. -/
theorem bourMetricNabla2_scalarMetric (g : SmoothRiemannianMetric I M)
    (f : M → ℝ) (hf : ContMDiff I 𝓘(ℝ) ∞ f) (x : M)
    (X Y U V : TangentSpace I x) :
    metricNabla0S g
      (metricNabla0S g (tensor0SFieldSmulByFun ∞ f hf (metricTensorField g))) x
      (vec4 X Y U V) =
      metricNabla0S g (duSec f hf) x (vec2 X Y) * g.inner x U V := by
  let F := duSec f hf
  let T := metricTensorField g
  let P := tensor0SFieldProduct ∞ F T
  have hF : metricNabla0S g (tensor0SFieldSmulByFun ∞ f hf T) = P := by
    ext y w
    have hw : w = Fin.cons (w 0) (vec2 (w 1) (w 2)) := by
      funext i
      fin_cases i <;> rfl
    rw [hw, bourMetricNabla_scalarMetric]
    change _ = tensor0SFieldProduct ∞ F T y _
    rw [tensor0SField_product_apply]
    have hleft : (Fin.cons (w 0) (vec2 (w 1) (w 2))) ∘ Fin.castAdd 2 =
        (fun _ : Fin 1 => w 0) := by funext i; fin_cases i; rfl
    have hright : (Fin.cons (w 0) (vec2 (w 1) (w 2))) ∘ Fin.natAdd 1 =
        vec2 (w 1) (w 2) := by funext i; fin_cases i <;> rfl
    rw [hleft, hright]
    simp [F, T, metricTensorField_apply, vec2]
  have hFR : TotalNabla0SRealizes 1 (metricCov g) F (metricNabla0S g F) :=
    totalNabla0S_realizes 1 (metricCov g) F _
  have hTR : TotalNabla0SRealizes 2 (metricCov g) T (metricNabla0S g T) :=
    totalNabla0S_realizes 2 (metricCov g) T _
  have hPR : TotalNabla0SRealizes 3 (metricCov g) P (metricNabla0S g P) :=
    totalNabla0S_realizes 3 (metricCov g) P _
  have hLeib := totalNabla0SRealizes_unique hPR
    (tensor0SProductNabla_realizes (metricCov g) F (metricNabla0S g F) T (metricNabla0S g T) hFR hTR)
  have hv : vec4 (I := I) X Y U V =
      Fin.cons X (Fin.append (fun _ : Fin 1 => Y) (vec2 U V)) := by
    funext i
    fin_cases i <;> rfl
  rw [hF, hLeib, hv, tensor0SProductNabla_apply,
    show Fin.cons X (fun _ : Fin 1 => Y) = vec2 (I := I) X Y by
      funext i; fin_cases i <;> rfl]
  rw [show metricNabla0S g T = 0 from metricNabla0S_self g]
  simp [F, T, metricTensorField_apply, vec2]

omit [BoundarylessManifold I M] in
private theorem weighted_secondDerivative (g : SmoothRiemannianMetric I M)
    (α : ℝ) (x : M) (X Y U V : TangentSpace I x) :
    metricNabla0S g (metricNabla0S g (bourRicciWeight α g)) x (vec4 X Y U V) =
      metricNabla0S g (metricNabla0S g (metricRicci g)) x (vec4 X Y U V) +
      (α - 4) / 12 * metricNabla0S g (duSec (metricScalarAt g) (metricScalar_smooth g)) x
        (vec2 X Y) * g.inner x U V := by
  simp only [bourRicciWeight, metricNabla0S_add, metricNabla0S_smul, ContMDiffSection.coe_smul,
    Pi.smul_apply, ContMDiffSection.coe_add, Pi.add_apply, Tensor0SSpace.add_apply,
    Tensor0SSpace.smul_apply, smul_eq_mul, bourMetricNabla2_scalarMetric]
  ring

omit [BoundarylessManifold I M] [FiniteDimensional ℝ E] [T2Space M] in
private theorem bilinear_trace_of_orthonormal
    (g : SmoothRiemannianMetric I M) {x : M} (T : Tensor0SSpace 2 I x)
    (b : Module.Basis (Fin (Module.finrank ℝ E)) ℝ (TangentSpace I x))
    (hb : ∀ i j, g.inner x (b i) (b j) = if i = j then 1 else 0)
    (u v : TangentSpace I x) :
    (∑ i, T (vec2 (b i) v) * g.inner x (b i) u) = T (vec2 u v) := by
  classical
  have hB := metricInverseInBasis_identity_of_orthonormal g b hb
  let T' := T.domDomCongr (Equiv.swap (0 : Fin 2) 1)
  let L := ricciCovAt T' v
  have hL (w : TangentSpace I x) : L w = T (vec2 w v) := by
    change T' (vec2 v w) = _
    dsimp only [T']
    rw [Tensor0SSpace.domDomCongr_apply]
    congr 1
    funext i
    fin_cases i <;> rfl
  have hrepr (i : Fin (Module.finrank ℝ E)) :
      b.repr u i = g.inner x (b i) u := by
    rw [basis_repr_eq_sum_inv_inner g x b identityInvMetric hB, g.symm x (b i) u]
    simp [identityInvMetric, diagonalInvMetric, ite_mul]
  simp_rw [← hL, ← hrepr]
  calc
    _ = L (∑ i, b.repr u i • b i) := by
      rw [map_sum]
      refine Finset.sum_congr rfl fun i _ => ?_
      rw [map_smul, smul_eq_mul, mul_comm]
    _ = L u := by rw [b.sum_repr]

omit [BoundarylessManifold I M] in
private theorem scalarLaplacian_eq_orthonormalHessianTrace [I.Boundaryless]
    (g : SmoothRiemannianMetric I M) {x : M}
    (b : Module.Basis (Fin (Module.finrank ℝ E)) ℝ (TangentSpace I x))
    (hb : ∀ i j, g.inner x (b i) (b j) = if i = j then 1 else 0) :
    ΔG g ⟨metricScalarAt g, metricScalar_smooth g⟩ x =
      ∑ i, metricNabla0S g (duSec (metricScalarAt g) (metricScalar_smooth g)) x
        (vec2 (b i) (b i)) := by
  classical
  let cov := leviCivitaConnectionOfMetric (I := I) g
  have hc := leviCivitaConnectionOfMetric_contMDiffCovariantDerivativeLocally (I := I) g
  have hm := leviCivitaConnectionOfMetric_isMetricCompatible (I := I) g
  have hd := scalarLap_smooth cov hc g hm (x := x) (metricScalarAt g) (metricScalar_smooth g)
  have hinv := metricInverseInBasis_identity_of_orthonormal g b hb
  rw [← laplacian_levi_eq g (metricScalar_smooth g) x]
  change laplacian cov g (metricScalarAt g) x =
    ∑ i, metricNabla0S g (duSec (metricScalarAt g) (metricScalar_smooth g)) x (vec2 (b i) (b i))
  rw [hd.eq_trace, scalarLapTraceAt_eq_firstTwo, metricTraceFirstTwo0SAt_eq_sum_basis _ b _ hinv]
  unfold metricTrace0S2InBasis
  have hslot (i j : Fin (Module.finrank ℝ E)) :
      metricTraceInput (I := I) (b i) (b j) Fin.elim0 = vec2 (b i) (b j) := by
    funext k
    fin_cases k <;> rfl
  simp only [hslot, identityInvMetric, diagonalInvMetric, ite_mul, one_mul, zero_mul,
    Finset.sum_ite_eq, Finset.mem_univ, ite_true]
  rfl

/-- Curvature-commuted flux terms with the Hessian and Laplacian
contributions retained on a general slice. -/
theorem bourRicciFluxAdjoint_apply_commuted [I.Boundaryless]
    (α : ℝ) (g : SmoothRiemannianMetric I M) (x : M) (u v : TangentSpace I x) :
    let H := metricNabla0S g (duSec (metricScalarAt g) (metricScalar_smooth g)) x
    let D := ΔG g ⟨metricScalarAt g, metricScalar_smooth g⟩ x
    let c := (α - 4) / 12
    bourRicciFluxAdjoint g (bourRicciWeight α g) x (vec2 u v) =
      (1 / 2 : ℝ) * H (vec2 v u) + c * H (vec2 u v) +
      bourRicciSquare g x (vec2 v u) - hamiltonCurvatureRicciAt g x (vec2 v u) -
      (1 / 2 : ℝ) * (roughLap0SField g (metricRicci g) x (vec2 u v) +
        c * D * g.inner x u v) := by
  classical
  obtain ⟨b, hb⟩ := exists_orthonormal_basis (I := I) g x
  change Module.Basis (Fin (Module.finrank ℝ E)) ℝ (TangentSpace I x) at b
  let H := metricNabla0S g (duSec (metricScalarAt g) (metricScalar_smooth g)) x
  let D := ΔG g ⟨metricScalarAt g, metricScalar_smooth g⟩ x
  let c := (α - 4) / 12
  let S := metricNabla0S g (metricNabla0S g (metricRicci g)) x
  dsimp only
  rw [bourRicciFluxAdjoint_apply_orthonormal g _ b hb]
  simp_rw [weighted_secondDerivative g α x, show (α - 4) / 12 = c from rfl]
  change (1 / 2 : ℝ) * ((∑ i, (S (vec4 (b i) v (b i) u) + c * H (vec2 (b i) v) * g.inner x (b i) u)) +
    (∑ i, (S (vec4 (b i) v u (b i)) + c * H (vec2 (b i) v) * g.inner x u (b i))) -
    ∑ i, (S (vec4 (b i) (b i) u v) + c * H (vec2 (b i) (b i)) * g.inner x u v)) = _
  have hs (i : Fin (Module.finrank ℝ E)) :
      S (vec4 (b i) v u (b i)) = S (vec4 (b i) v (b i) u) :=
    metricNabla2Ric_last_two_symm g x (b i) v u (b i)
  have hg (i : Fin (Module.finrank ℝ E)) : g.inner x u (b i) = g.inner x (b i) u := g.symm x u (b i)
  have hN := bourNablaDivergence_apply_orthonormal g (metricRicci g) b hb v u
  have hDiv := bourRicciWeight_divergence 4 g
  have hw : bourRicciWeight 4 g = metricRicci g := by simp [bourRicciWeight]
  rw [hw, show ((4 : ℝ) + 2) / 12 = 1 / 2 from by norm_num] at hDiv
  rw [hDiv, metricNabla0S_smul] at hN
  have hD : (∑ i, S (vec4 v (b i) (b i) u)) = (1 / 2 : ℝ) * H (vec2 v u) :=
    hN.symm
  have hC := bourCrossedRicci_eq_ricciSquare_sub_curvature g b hb v u
  dsimp only at hC
  change (∑ i, (S (vec4 (b i) v (b i) u) - S (vec4 v (b i) (b i) u))) = _ at hC
  rw [Finset.sum_sub_distrib, hD] at hC
  have hscross : (∑ i, c * H (vec2 (b i) v) * g.inner x (b i) u) = c * H (vec2 u v) := by
    simp_rw [mul_assoc]
    rw [← Finset.mul_sum, bilinear_trace_of_orthonormal g H b hb u v]
  have hslap : (∑ i, c * H (vec2 (b i) (b i)) * g.inner x u v) = c * D * g.inner x u v := by
    rw [← Finset.sum_mul, ← Finset.mul_sum, ← scalarLaplacian_eq_orthonormalHessianTrace g b hb]
  simp_rw [hs, hg, Finset.sum_add_distrib]
  rw [hscross, hslap, roughLap0SField, covDiv3_apply_orthonormal g _ b hb]
  linarith only [hC]

omit [BoundarylessManifold I M] in
private theorem bourRicciTraceAdjoint_apply_laplacian [I.Boundaryless]
    (α : ℝ) (g : SmoothRiemannianMetric I M) (x : M) (u v : TangentSpace I x) :
    bourRicciTraceAdjoint g (bourRicciWeight α g) x (vec2 u v) =
      ((α + 2) / 12) * ΔG g ⟨metricScalarAt g, metricScalar_smooth g⟩ x * g.inner x u v := by
  simp only [bourRicciTraceAdjoint, tensor0SField_smulByFun_apply,
    Tensor0SSpace.smul_apply, smul_eq_mul]
  change covDiv0SField g (covDiv0SField g (bourRicciWeight α g)) x Fin.elim0 *
    (metricTensorField g x (vec2 u v)) = _
  rw [bourRicciWeight_doubleDivergence]
  simp [metricTensorField_apply, vec2]

omit [BoundarylessManifold I M] in
private theorem scalarHessian_symm (g : SmoothRiemannianMetric I M) (x : M)
    (u v : TangentSpace I x) :
    metricNabla0S g (duSec (metricScalarAt g) (metricScalar_smooth g)) x (vec2 u v) =
      metricNabla0S g (duSec (metricScalarAt g) (metricScalar_smooth g)) x (vec2 v u) :=
  hessSymm g (metricScalarAt g) (metricScalar_smooth g) u v

/-- The curvature-commuted expression of the same physical gradient on
an arbitrary smooth Riemannian slice. The Laplacian is the trace of the
Hessian and the curvature slots are those of the Hamilton contraction. -/
theorem bourCovariantGradient_apply_commuted [I.Boundaryless]
    (α : ℝ) (g : SmoothRiemannianMetric I M) (x : M) (u v : TangentSpace I x) :
    let H := metricNabla0S g (duSec (metricScalarAt g) (metricScalar_smooth g)) x
    let D := ΔG g ⟨metricScalarAt g, metricScalar_smooth g⟩ x
    let R := metricScalarAt g x
    bourCovariantGradient α g x (vec2 u v) =
      -(1 / 2 : ℝ) * roughLap0SField g (metricRicci g) x (vec2 u v) +
        (α + 2) / 12 * H (vec2 u v) -
        hamiltonCurvatureRicciAt g x (vec2 u v) -
        (α - 4) / 12 * R * metricRicciAt g x (vec2 u v) -
        (α - 1) / 12 * D * g.inner x u v +
        (1 / 2 : ℝ) * bourBulkDensity α g x * g.inner x u v := by
  dsimp only
  have hslots (a b : TangentSpace I x) :
      (fun i => vec2 (I := I) a b ((Equiv.swap (0 : Fin 2) 1) i)) = vec2 b a := by
    funext i
    fin_cases i <;> rfl
  have hbulk (a b : TangentSpace I x) :
      bourBulkMetricCorrection α g x (vec2 a b) =
        -bourRicciSquare g x (vec2 a b) -
          (α - 4) / 12 * metricScalarAt g x * metricRicciAt g x (vec2 a b) +
          (1 / 2 : ℝ) * bourBulkDensity α g x * g.inner x a b := by
    change ((-bourRicciSquare g x -
      ((α - 4) / 12) • (metricScalarAt g x • metricRicci g x) +
      (1 / 2 : ℝ) • (bourBulkDensity α g x • metricTensorField g x)) :
        Tensor0SSpace 2 I x) (vec2 a b) = _
    rw [show -bourRicciSquare g x = (-1 : ℝ) • bourRicciSquare g x by simp]
    simp [metricRicci_apply, metricTensorField_apply, vec2, mul_assoc]
  simp only [bourCovariantGradient, bourSymmetricPart, ContMDiffSection.coe_smul, Pi.smul_apply,
    ContMDiffSection.coe_sub, Pi.sub_apply, ContMDiffSection.coe_add, Pi.add_apply,
    Tensor0SSpace.sub_apply, Tensor0SSpace.add_apply, Tensor0SSpace.smul_apply, smul_eq_mul,
    Tensor0SField.domDomCongr_apply, Tensor0SSpace.domDomCongr_apply, hslots]
  simp only [bourRicciFluxAdjoint_apply_commuted α g, bourRicciTraceAdjoint_apply_laplacian α g,
    hbulk, roughLap_metricRicci_symm g x v u, scalarHessian_symm g x v u,
    curvatureRicci_symm g x v u, metricRicciAt_symm g x v u, g.symm x v u]
  ring

omit [BoundarylessManifold I M] in
private theorem scalarLaplacian_eq_zero_of_csc [I.Boundaryless]
    (g : SmoothRiemannianMetric I M) (R : ℝ) (hR : ∀ y, metricScalarAt g y = R) (x : M) :
    ΔG g ⟨metricScalarAt g, metricScalar_smooth g⟩ x = 0 := by
  rw [← laplacian_levi_eq g (metricScalar_smooth g) x]
  change laplacian (LeviCivita g) g (metricScalarAt g) x = _
  rw [show metricScalarAt g = fun _ => R from funext hR, laplacian_const]

/-- On a constant-scalar slice the actual crossed Koszul adjoint equals
the Ricci square minus the Riemann–Ricci action and half the rough trace. -/
theorem bourRicciFluxAdjoint_apply_csc [I.Boundaryless]
    (α : ℝ) (g : SmoothRiemannianMetric I M)
    (R : ℝ) (hR : ∀ y, metricScalarAt g y = R) (x : M)
    (u v : TangentSpace I x) :
    bourRicciFluxAdjoint g (bourRicciWeight α g) x (vec2 u v) =
      bourRicciSquare g x (vec2 v u) - hamiltonCurvatureRicciAt g x (vec2 v u) -
        (1 / 2 : ℝ) * roughLap0SField g (metricRicci g) x (vec2 u v) := by
  rw [bourRicciFluxAdjoint_apply_commuted, scalarDifferential_eq_zero g R hR,
    metricNabla0S_zero', scalarLaplacian_eq_zero_of_csc g R hR x]
  simp

/-- On a constant-scalar slice the Hessian and scalar Laplacian vanish
and the covariant Ricci square cancels in the computed gradient. -/
theorem bourCovariantGradient_apply_csc [I.Boundaryless]
    (α : ℝ) (g : SmoothRiemannianMetric I M) (R : ℝ) (hR : ∀ y, metricScalarAt g y = R)
    (x : M) (u v : TangentSpace I x) :
    bourCovariantGradient α g x (vec2 u v) =
      -(1 / 2 : ℝ) * roughLap0SField g (metricRicci g) x (vec2 u v) -
        hamiltonCurvatureRicciAt g x (vec2 u v) -
        (α - 4) / 12 * R * metricRicciAt g x (vec2 u v) +
        (1 / 2 : ℝ) * bourBulkDensity α g x * g.inner x u v := by
  rw [bourCovariantGradient_apply_commuted, scalarDifferential_eq_zero g R hR,
    metricNabla0S_zero', scalarLaplacian_eq_zero_of_csc g R hR x, hR x]
  simp

/-- Equality of a covariant speed with minus twice the physical gradient
is equivalent to its explicit geometric evolution on all tangent pairs. -/
theorem bourOriginalVelocity_eq_negTwoGradient_iff_components [I.Boundaryless]
    (α : ℝ) (g : SmoothRiemannianMetric I M) (x : M) (K : Tensor0SSpace 2 I x) :
    let H := metricNabla0S g (duSec (metricScalarAt g) (metricScalar_smooth g)) x
    let D := ΔG g ⟨metricScalarAt g, metricScalar_smooth g⟩ x
    let R := metricScalarAt g x
    K = (-2 : ℝ) • bourCovariantGradient α g x ↔
      ∀ u v : TangentSpace I x, K (vec2 u v) =
        roughLap0SField g (metricRicci g) x (vec2 u v) -
          (α + 2) / 6 * H (vec2 u v) +
          2 * hamiltonCurvatureRicciAt g x (vec2 u v) +
          (α - 4) / 6 * R * metricRicciAt g x (vec2 u v) +
          (α - 1) / 6 * D * g.inner x u v -
          bourBulkDensity α g x * g.inner x u v := by
  dsimp only
  constructor
  · intro h u v
    rw [h, Tensor0SSpace.smul_apply, smul_eq_mul, bourCovariantGradient_apply_commuted]
    ring
  · intro h
    apply tensor0SSpace_ext
    intro w
    have hw : w = vec2 (w 0) (w 1) := by funext i; fin_cases i <;> rfl
    rw [hw, h, Tensor0SSpace.smul_apply, smul_eq_mul, bourCovariantGradient_apply_commuted]
    ring

end
end SmoothPoincare.Bour
