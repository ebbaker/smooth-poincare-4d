import SmoothPoincare.Variational.BourTensorFirstVariation
import DifferentialGeometry.Geometry.Curvature.CurvatureOperator.Identities.ContractedBianchi
import DifferentialGeometry.Geometry.Operator.Laplacian.LeviCivitaIdentification

/-! # Contracted Bianchi for Bour's Ricci weight

Prepared for Edward B. Baker III with OpenAI Codex assistance, 26 November 2026.
The covariant divergences use the original physical metric.
-/

open Bundle DifferentialGeometry DifferentialGeometry.Geometry.Connection
  DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Geometry.Operator
  DifferentialGeometry.PDE.RicciFlow DifferentialGeometry.Tensor0SBundle
  DifferentialGeometry.Tensor.RSTensor
open scoped ContDiff Manifold BigOperators

namespace SmoothPoincare.Bour

noncomputable section

variable {E H M : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]

private local instance : IsManifold I 1 M := IsManifold.of_le (by decide : (1 : WithTop ℕ∞) ≤ ∞)
private local instance : IsManifold I 2 M := IsManifold.of_le (by decide : (2 : WithTop ℕ∞) ≤ ∞)

private theorem covDiv_smul {s : ℕ} (g : SmoothRiemannianMetric I M) (c : ℝ)
    (A : Tensor0SField (I := I) (M := M) ∞ (s + 1)) :
    covDiv0SField g (c • A) = c • covDiv0SField g A := by
  simp only [covDiv0SField, metricNabla0S_smul, metricTraceFirstTwoField_smul]

private theorem covDiv_add {s : ℕ} (g : SmoothRiemannianMetric I M)
    (A B : Tensor0SField (I := I) (M := M) ∞ (s + 1)) :
    covDiv0SField g (A + B) = covDiv0SField g A + covDiv0SField g B := by
  simp only [covDiv0SField, metricNabla0S_add, metricTraceFirstTwoField_add]

private theorem covDiv_metricRicci (g : SmoothRiemannianMetric I M) :
    covDiv0SField g (metricRicci g) =
      (1 / 2 : ℝ) • duSec (metricScalarAt g) (metricScalar_smooth g) := by
  ext x v
  have hv : v = fun _ => v 0 := by
    funext i
    fin_cases i
    rfl
  rw [hv, covDiv0SField, metricTraceFirstTwoField_apply, metricNabla0S_apply]
  change _ = (1 / 2 : ℝ) * differential1FormFun (metricScalarAt g) x (fun _ => v 0)
  rw [contracted_bianchi_metric, differential1FormFun_apply_eq_inner_gradientFun]

/-- The covariant derivative of a scalar multiple of the physical metric is
the scalar differential in the derivative slot times the metric. -/
theorem bourMetricNabla_scalarMetric (g : SmoothRiemannianMetric I M)
    (f : M → ℝ) (hf : ContMDiff I 𝓘(ℝ) ∞ f) (x : M) (X Y Z : TangentSpace I x) :
    metricNabla0S g (tensor0SFieldSmulByFun ∞ f hf (metricTensorField g)) x
      (Fin.cons X (vec2 Y Z)) =
    differential1FormFun f x (fun _ => X) * g.inner x Y Z := by
  let cov := metricCov g
  let T := metricTensorField g
  obtain ⟨U, hU⟩ := ContMDiffSection.exists_eq_at (I := I) (F := E)
    (V := TangentSpace I) (n := (⊤ : ℕ∞)) x X
  obtain ⟨V, hV⟩ := ContMDiffSection.exists_eq_at (I := I) (F := E)
    (V := TangentSpace I) (n := (⊤ : ℕ∞)) x Y
  obtain ⟨W, hW⟩ := ContMDiffSection.exists_eq_at (I := I) (F := E)
    (V := TangentSpace I) (n := (⊤ : ℕ∞)) x Z
  rw [← hU, ← hV, ← hW, metricNabla0S_apply, totalNabla0SFun_apply_section,
    nabla0S_two_apply]
  have hmetric (u v : TangentSpace I x) : T x (vec2 u v) = g.inner x u v := by
    simp [T, metricTensorField_apply, vec2]
  rw [← hmetric (V x) (W x), differential1FormFun_apply_eq_mvfderiv]
  have hpair : MDiffAt (fun y => T y (vec2 (V y) (W y))) x := by
    let vs : Fin 2 → ContMDiffSection I E ∞ (TangentSpace I : M → Type _) :=
      fun i => if i = 0 then V else W
    have hslots (y : M) : (fun i => vs i y) = vec2 (V y) (W y) := by
      funext i
      fin_cases i <;> simp [vs, vec2]
    have h := tensor0SField_eval_smooth_slots_contMDiffAt T vs x
    simp_rw [hslots] at h
    exact h.mdifferentiableAt (by simp)
  have hparallel := nabla_metric_zero cov g
    (leviCivitaConnectionOfMetric_isMetricCompatible g) U x
  have hz := congrArg (fun A : Tensor0SSpace 2 I x => A (vec2 (V x) (W x))) hparallel
  rw [nabla0S_two_apply] at hz
  change _ = (0 : ℝ) at hz
  simp only [tensor0SField_smulByFun_apply, Tensor0SSpace.smul_apply, smul_eq_mul]
  rw [mvfderiv_mul_apply (hf.mdifferentiableAt (by simp)) hpair]
  linear_combination f x * hz

private theorem covDiv_scalarMetric (g : SmoothRiemannianMetric I M)
    (f : M → ℝ) (hf : ContMDiff I 𝓘(ℝ) ∞ f) :
    covDiv0SField g (tensor0SFieldSmulByFun ∞ f hf (metricTensorField g)) = duSec f hf := by
  classical
  ext x w
  obtain ⟨n, e, b, -, heb, he, -, hexp, -⟩ :=
    TensorMetric.exists_tangent_orthonormalBasis_with_norm_sum g x
  have hb (i j : Fin n) : g.inner x (b i) (b j) = if i = j then 1 else 0 := by
    rw [heb i, heb j, he]
  have hinv := metricInverseInBasis_identity_of_orthonormal g b hb
  rw [covDiv0SField, metricTraceFirstTwoField_apply, metricTraceFirstTwo0STensor_apply,
    metricTraceFirstTwo0SAt_eq_sum_basis g b identityInvMetric hinv]
  unfold metricTrace0S2InBasis
  have hinput (i j : Fin n) :
      metricTraceInput (I := I) (b i) (b j) w = Fin.cons (b i) (vec2 (b j) (w 0)) := by
    funext k
    fin_cases k <;> rfl
  simp_rw [hinput, bourMetricNabla_scalarMetric]
  simp only [identityInvMetric, diagonalInvMetric, ite_mul, one_mul, zero_mul,
    Finset.sum_ite_eq, Finset.mem_univ, ite_true]
  rw [duSec_apply]
  let L := differential1FormFun (I := I) f x
  let l := cotangentToDual (I := I) L
  have hw : w = fun _ => w 0 := by funext i; fin_cases i; rfl
  have hl (v : TangentSpace I x) : l v = L (fun _ => v) := cotangentToDual_apply _ _
  change (∑ i : Fin n, L (fun _ => b i) * g.inner x (b i) (w 0)) = L w
  rw [hw]
  simp_rw [← hl]
  calc
    _ = l (∑ i : Fin n, g.inner x (b i) (w 0) • b i) := by
      rw [map_sum]
      refine Finset.sum_congr rfl fun i _ => ?_
      rw [map_smul, smul_eq_mul, mul_comm]
    _ = l (w 0) := by
      congr 1
      simpa only [heb] using (hexp (w 0)).symm

/-- Contracted Bianchi and metric compatibility for the full physical
weight, without a constant scalar curvature premise. -/
theorem bourRicciWeight_divergence (α : ℝ) (g : SmoothRiemannianMetric I M) :
    covDiv0SField g (bourRicciWeight α g) =
      ((α + 2) / 12) • duSec (metricScalarAt g) (metricScalar_smooth g) := by
  rw [bourRicciWeight, covDiv_add, covDiv_smul, covDiv_metricRicci, covDiv_scalarMetric,
    ← add_smul]
  congr 1
  ring

/-- The twice-diverged weight is the indicated multiple of the scalar
Laplacian, with the analyst's sign convention. -/
theorem bourRicciWeight_doubleDivergence [I.Boundaryless]
    (α : ℝ) (g : SmoothRiemannianMetric I M) (x : M) :
    covDiv0SField g (covDiv0SField g (bourRicciWeight α g)) x Fin.elim0 =
      ((α + 2) / 12) * ΔG g ⟨metricScalarAt g, metricScalar_smooth g⟩ x := by
  rw [bourRicciWeight_divergence, covDiv_smul]
  change ((α + 2) / 12) * covDiv0SField g
    (duSec (metricScalarAt g) (metricScalar_smooth g)) x Fin.elim0 = _
  congr 1
  let cov := leviCivitaConnectionOfMetric (I := I) g
  have hc := leviCivitaConnectionOfMetric_contMDiffCovariantDerivativeLocally (I := I) g
  have hm := leviCivitaConnectionOfMetric_isMetricCompatible (I := I) g
  have hd := scalarLap_smooth cov hc g hm (x := x) (metricScalarAt g) (metricScalar_smooth g)
  rw [← laplacian_levi_eq g (metricScalar_smooth g) x,
    covDiv0SField, metricTraceFirstTwoField_apply, metricTraceFirstTwo0STensor_apply]
  exact hd.symm

end
end SmoothPoincare.Bour
