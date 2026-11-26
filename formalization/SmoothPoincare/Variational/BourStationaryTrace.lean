import SmoothPoincare.Variational.BourGradientComparison
import DifferentialGeometry.Analysis.Elliptic.HarmonicRigidity

/-! # Local scalar trace of the physical Bour gradient

E51, 26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Actual serving model and reasoning effort were unavailable.
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
  [I.Boundaryless]

local notation "J" => Fin (Module.finrank ℝ E)

private local instance : IsManifold I 1 M := IsManifold.of_le (by decide : (1 : WithTop ℕ∞) ≤ ∞)
private local instance : IsManifold I 2 M := IsManifold.of_le (by decide : (2 : WithTop ℕ∞) ≤ ∞)

omit [I.Boundaryless] in
private theorem bourScalarHessian_eq_lastTrace (g : SmoothRiemannianMetric I M)
    (x : M) (b : Module.Basis J ℝ (TangentSpace I x))
    (hb : ∀ i j, g.inner x (b i) (b j) = if i = j then 1 else 0)
    (u v : TangentSpace I x) :
    metricNabla0S g (duSec (metricScalarAt g) (metricScalar_smooth g)) x (vec2 u v) =
      ∑ i, metricNabla0S g (metricNabla0S g (metricRicci g)) x (vec4 u v (b i) (b i)) := by
  classical
  let N := metricNabla0S g (metricRicci g)
  let e := traceNablaShuffle 0
  let P := Tensor0SField.domDomCongr ∞ e N
  have hslots {y : M} (a c d : TangentSpace I y) :
      metricTraceInput (I := I) a c (fun _ : Fin 1 => d) ∘ e = vec3 d a c := by
    funext k
    fin_cases k <;> rfl
  have hd : metricTraceFirstTwoField g P = duSec (metricScalarAt g) (metricScalar_smooth g) := by
    ext y w
    obtain ⟨c, hc⟩ := exists_orthonormal_basis (I := I) g y
    have hInv := metricInverseInBasis_identity_of_orthonormal g c hc
    have hw : w = fun _ : Fin 1 => w 0 := by
      funext k
      fin_cases k
      rfl
    rw [hw, metricTraceFirstTwoField_apply, metricTraceFirstTwo0STensor_apply,
      metricTraceFirstTwo0SAt_eq_sum_basis g c _ hInv, duSec_apply]
    unfold metricTrace0S2InBasis
    have hDer := differential_metricTrace_eq_trace_totalNabla_inBasis (metricCov g) g
      (leviCivitaConnectionOfMetric_isMetricCompatible g) (metricRicci g) c _ hInv (w 0)
    dsimp only at hDer
    change differential1FormFun (I := I) (metricScalarAt g) y (fun _ : Fin 1 => w 0) = _ at hDer
    rw [hDer]
    refine Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun j _ => ?_
    simp only [P, Tensor0SField.domDomCongr_apply, Tensor0SSpace.domDomCongr_apply,
      N, metricNabla0S_apply]
    change _ * (totalNabla0SFun 2 (metricCov g) (metricRicci g) y)
      (metricTraceInput (I := I) (c i) (c j) (fun _ : Fin 1 => w 0) ∘ e) = _
    rw [hslots]
  rw [← hd, metricNabla0S_apply]
  have htail : Fin.cons u (fun _ : Fin 1 => v) = vec2 (I := I) u v := by
    funext k
    fin_cases k <;> rfl
  have h2 (a c : TangentSpace I x) :
      Fin.cons u (metricTraceInput (I := I) a c (fun _ : Fin 1 => v)) ∘ frontExtendEquiv e =
        vec4 u v a c := by
    funext k
    fin_cases k <;> rfl
  have hInv := metricInverseInBasis_identity_of_orthonormal g b hb
  rw [← htail, nabla_metricTraceFirstTwo0S (metricCov g) g
    (leviCivitaConnectionOfMetric_isMetricCompatible g) P b _ hInv]
  simp only [P, totalNabla0SFun_domDomCongr, Tensor0SSpace.domDomCongr_apply,
    ← metricNabla0S_apply, N, identityInvMetric, diagonalInvMetric, ite_mul, one_mul, zero_mul,
    Finset.sum_ite_eq, Finset.mem_univ, ite_true]
  refine Finset.sum_congr rfl fun i _ => ?_
  change metricNabla0S g N x
    (Fin.cons u (metricTraceInput (I := I) (b i) (b i) (fun _ : Fin 1 => v)) ∘ frontExtendEquiv e) = _
  rw [h2]

private theorem bourScalarLaplacian_eq_hessianTrace (g : SmoothRiemannianMetric I M)
    (x : M) (b : Module.Basis J ℝ (TangentSpace I x))
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
  have hslot (i j : J) :
      metricTraceInput (I := I) (b i) (b j) Fin.elim0 = vec2 (b i) (b j) := by
    funext k
    fin_cases k <;> rfl
  simp only [hslot, identityInvMetric, diagonalInvMetric, ite_mul, one_mul, zero_mul,
    Finset.sum_ite_eq, Finset.mem_univ, ite_true]
  rfl

/-- The metric trace commutes with the physical rough Laplacian on Ricci. -/
theorem bourRoughRicci_trace (g : SmoothRiemannianMetric I M)
    (x : M) (b : Module.Basis J ℝ (TangentSpace I x))
    (hb : ∀ i j, g.inner x (b i) (b j) = if i = j then 1 else 0) :
    (∑ i, roughLap0SField g (metricRicci g) x (vec2 (b i) (b i))) =
      ΔG g ⟨metricScalarAt g, metricScalar_smooth g⟩ x := by
  classical
  have hinv := metricInverseInBasis_identity_of_orthonormal g b hb
  have hSlots (i j : J) (u v : TangentSpace I x) :
      metricTraceInput (I := I) (b i) (b j) (vec2 u v) = vec4 (b i) (b j) u v := by
    funext k
    fin_cases k <;> rfl
  have hRough (u v : TangentSpace I x) :
      roughLap0SField g (metricRicci g) x (vec2 u v) =
        ∑ i, metricNabla0S g (metricNabla0S g (metricRicci g)) x
          (vec4 (b i) (b i) u v) := by
    rw [roughLap0SField, covDiv0SField, metricTraceFirstTwoField_apply,
      metricTraceFirstTwo0STensor_apply, metricTraceFirstTwo0SAt_eq_sum_basis g b _ hinv]
    unfold metricTrace0S2InBasis
    simp only [hSlots, identityInvMetric, diagonalInvMetric, ite_mul, one_mul, zero_mul,
      Finset.sum_ite_eq, Finset.mem_univ, ite_true]
  simp_rw [hRough, bourScalarLaplacian_eq_hessianTrace g x b hb,
    bourScalarHessian_eq_lastTrace g x b hb]
  exact Finset.sum_comm

/-- The Hamilton curvature–Ricci term has trace equal to the ordinary
Ricci square. Its trace is insensitive to the commutator relocation. -/
theorem bourHamiltonCurvatureRicci_trace (g : SmoothRiemannianMetric I M)
    (x : M) (b : Module.Basis J ℝ (TangentSpace I x))
    (hb : ∀ i j, g.inner x (b i) (b j) = if i = j then 1 else 0) :
    (∑ i, hamiltonCurvatureRicciAt g x (vec2 (b i) (b i))) =
      normSq0S g x 2 (metricRicciAt g x) := by
  classical
  let S := metricNabla0S g (metricNabla0S g (metricRicci g)) x
  have hComm (i : J) :
      (∑ j, (S (vec4 (b j) (b i) (b j) (b i)) - S (vec4 (b i) (b j) (b j) (b i)))) =
        bourRicciSquare g x (vec2 (b i) (b i)) - hamiltonCurvatureRicciAt g x (vec2 (b i) (b i)) :=
    bourCrossedRicci_eq_ricciSquare_sub_curvature g b hb _ _
  have hDiff : (∑ i, ∑ j, S (vec4 (b j) (b i) (b j) (b i))) =
      ∑ i, ∑ j, S (vec4 (b i) (b j) (b j) (b i)) := by
    rw [Finset.sum_comm]
    refine Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun j _ => ?_
    exact metricNabla2Ric_last_two_symm g x _ _ _ _
  have hSum := congrArg (fun F : J → ℝ => ∑ i, F i) (funext hComm)
  simp only [Finset.sum_sub_distrib, hDiff, sub_self] at hSum
  have hInv := metricInverseInBasis_identity_of_orthonormal g b hb
  have hSquare (i : J) : bourRicciSquare g x (vec2 (b i) (b i)) =
      ∑ j, (metricRicciAt g x (vec2 (b i) (b j))) ^ 2 := by
    rw [bourRicciSquare_apply, hamiltonRicciSquareAt_apply g b _ hInv]
    simp only [identityInvMetric, diagonalInvMetric, ite_mul, one_mul, zero_mul,
      Finset.sum_ite_eq, Finset.mem_univ, ite_true, metricRicci_apply]
    refine Finset.sum_congr rfl fun j _ => ?_
    rw [metricRicciAt_symm g x (b j) (b i), pow_two]
  rw [← sub_eq_zero.mp hSum.symm,
    normSq0S_identity_eq_sum_sq _ _ _ b hInv, sum_fin_two_fun]
  simp only [hSquare]
  refine Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun j _ => ?_
  rw [component0S_apply]
  congr 2
  funext k
  fin_cases k <;> rfl

/-- Pointwise physical gradient trace in dimension four. The result
requires only local differential geometry of the given metric. -/
theorem bourCovariantGradient_trace_eq_scalarLaplacian [BoundarylessManifold I M]
    (hDim : Module.finrank ℝ E = 4) (α : ℝ) (g : SmoothRiemannianMetric I M) (x : M) :
    metricTracePair0SAt g (bourCovariantGradient α g x) =
      -(α / 4) * ΔG g ⟨metricScalarAt g, metricScalar_smooth g⟩ x := by
  classical
  obtain ⟨b₀, hb₀⟩ := exists_orthonormal_basis (I := I) g x
  let b : Module.Basis J ℝ (TangentSpace I x) := b₀
  have hb : ∀ i j : J, g.inner x (b i) (b j) = if i = j then 1 else 0 := hb₀
  have hinv := metricInverseInBasis_identity_of_orthonormal g b hb
  have hSc : (∑ i, metricRicciAt g x (vec2 (b i) (b i))) = metricScalarAt g x := by
    rw [metricScalarAt_def, metricTracePair0SAt_eq_sum_basis _ b _ hinv]
    simp only [identityInvMetric, diagonalInvMetric, ite_mul, one_mul, zero_mul,
      Finset.sum_ite_eq, Finset.mem_univ, ite_true]
  rw [metricTracePair0SAt_eq_sum_basis _ b _ hinv]
  simp only [identityInvMetric, diagonalInvMetric, ite_mul, one_mul, zero_mul,
    Finset.sum_ite_eq, Finset.mem_univ, ite_true]
  simp only [bourCovariantGradient_apply_commuted, hb, ite_true, mul_one,
    Finset.sum_add_distrib, Finset.sum_sub_distrib, ← Finset.mul_sum,
    bourRoughRicci_trace g x b hb, ← bourScalarLaplacian_eq_hessianTrace g x b hb,
    bourHamiltonCurvatureRicci_trace g x b hb, hSc, Finset.sum_const, Finset.card_univ,
    Fintype.card_fin, nsmul_eq_mul, hDim, bourBulkDensity]
  ring

/-- At any point of a positive-parameter stationary slice, scalar
curvature is harmonic there. Compactness enters only in the next result. -/
theorem bourStationary_scalarLaplacian_eq_zero [BoundarylessManifold I M]
    (hDim : Module.finrank ℝ E = 4) {α : ℝ} (hα : 0 < α)
    (g : SmoothRiemannianMetric I M) (x : M) (hStat : bourCovariantGradient α g x = 0) :
    ΔG g ⟨metricScalarAt g, metricScalar_smooth g⟩ x = 0 := by
  have h := bourCovariantGradient_trace_eq_scalarLaplacian hDim α g x
  rw [hStat, metricTracePair0SAt] at h
  have hZ : inner0S g x 2 (metricTensor0S g x) (0 : Tensor0SSpace 2 I x) = 0 := by
    calc
      _ = inner0S g x 2 (metricTensor0S g x) ((0 : ℝ) • metricTensor0S g x) := by simp
      _ = 0 := by rw [inner0S_smul_right, zero_mul]
  have h0 : -(α / 4) * ΔG g ⟨metricScalarAt g, metricScalar_smooth g⟩ x = 0 := h.symm.trans hZ
  exact (mul_eq_zero.mp h0).resolve_left (neg_ne_zero.mpr (div_ne_zero hα.ne' (by norm_num)))

/-- The stationary scalar equation stated using the physical Levi–Civita
Laplacian of the same metric. -/
theorem bourStationary_scalar_harmonicAt [BoundarylessManifold I M]
    (hDim : Module.finrank ℝ E = 4) {α : ℝ} (hα : 0 < α)
    (g : SmoothRiemannianMetric I M) (x : M) (hStat : bourCovariantGradient α g x = 0) :
    laplacian (LeviCivita g) g (metricScalarAt g) x = 0 := by
  exact (laplacian_levi_eq g (metricScalar_smooth g) x).trans
    (bourStationary_scalarLaplacian_eq_zero hDim hα g x hStat)

/-- The zero-parameter gradient is pointwise trace-free. -/
theorem bourCovariantGradient_trace_zero_at_zero [BoundarylessManifold I M]
    (hDim : Module.finrank ℝ E = 4) (g : SmoothRiemannianMetric I M) (x : M) :
    metricTracePair0SAt g (bourCovariantGradient 0 g x) = 0 := by
  rw [bourCovariantGradient_trace_eq_scalarLaplacian hDim]
  simp

/-- Positive-parameter physical stationarity forces constant scalar
curvature on a connected closed Riemannian four-manifold. -/
theorem bourStationary_scalar_constant [BoundarylessManifold I M] [CompactSpace M] [ConnectedSpace M]
    (hDim : Module.finrank ℝ E = 4) {α : ℝ} (hα : 0 < α)
    (g : SmoothRiemannianMetric I M) (hStat : ∀ x, bourCovariantGradient α g x = 0) :
    ∃ R : ℝ, ∀ x, metricScalarAt g x = R :=
  Analysis.Laplacian.exists_eq_const_of_laplacian_eq_zero g
    ⟨metricScalarAt g, metricScalar_smooth g⟩
    (fun x => bourStationary_scalarLaplacian_eq_zero hDim hα g x (hStat x))

end
end SmoothPoincare.Bour
