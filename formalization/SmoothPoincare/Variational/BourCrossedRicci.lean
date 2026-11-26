import SmoothPoincare.Variational.BourMetricContractions
import DifferentialGeometry.Geometry.Connection.LeviCivita.Curvature.Identities
import DifferentialGeometry.Geometry.Curvature.Bochner.OrthonormalFrameTrace
import DifferentialGeometry.Geometry.Curvature.Contractions.CurvatureActionLowering
import DifferentialGeometry.Geometry.Curvature.MetricPairing

/-! # The crossed Ricci commutator in Bour's gradient

E50, 26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Actual serving model and effort were unavailable.
-/

open Bundle DifferentialGeometry DifferentialGeometry.Geometry.Connection
  DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Geometry.Operator
  DifferentialGeometry.PDE.RicciFlow DifferentialGeometry.Tensor0SBundle
  DifferentialGeometry.Tensor.RicciIdentity DifferentialGeometry.Tensor.RSTensor Set
open scoped ContDiff Manifold

namespace SmoothPoincare.Bour

noncomputable section

variable {E H M : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [BoundarylessManifold I M]

omit [BoundarylessManifold I M] in
private theorem bourMetricRicci_ricciIdentity (g : SmoothRiemannianMetric I M) (x : M) :
    Tensor0SRicciIdentityAt (I := I) (metricRm13 g) (metricRicci g x)
      (metricNabla0S g (metricNabla0S g (metricRicci g)) x) := by
  let A := metricRicci g
  let B := metricNabla0S g A
  apply tensor0S_ricciIdentity_of_leviCivita g (metricRm13 g) A B _ _ _
    (metricCurvatureSections g).rm13Realizes rfl rfl
  have hA : TotalNabla0SRealizes 2 (metricCov g) A B :=
    totalNabla0S_realizes 2 (metricCov g) A _
  have hB : TotalNabla0SRealizes 3 (metricCov g) B (metricNabla0S g B) :=
    totalNabla0S_realizes 3 (metricCov g) B _
  exact ⟨fun y X slots => hA X y slots, fun X slots => hB X x slots⟩

omit [BoundarylessManifold I M] in
private theorem bourMetricRm04_lower (g : SmoothRiemannianMetric I M) (x : M) :
    Rm04LowersRm13At (I := I) g x (metricRm13 g x) (metricRm04At g x) := by
  rw [← metricRm04_apply]
  exact rm04LowersRm13At_of_realizes (I := I) g _ (metricRm13 g) (metricRm04 g)
    (metricCurvatureSections g).rm13Realizes (metricCurvatureSections g).rm04Realizes x

/-- The native crossed second derivative of Ricci differs from the ordinary
derivative of its divergence by the squared Ricci endomorphism and the
curvature action. The `metricRm04At` slots use the convention
`Rm(X,Y,Z,W) = g(R(X,Y)Z,W)`. -/
theorem bourCrossedRicci_commutator (g : SmoothRiemannianMetric I M)
    {x : M} (b : Module.Basis (Fin (Module.finrank ℝ E)) ℝ (TangentSpace I x))
    (hb : ∀ p q, g.inner x (b p) (b q) = if p = q then 1 else 0)
    (u v : TangentSpace I x) :
    let S := metricNabla0S g (metricNabla0S g (metricRicci g)) x
    (∑ p, (S (vec4 (b p) u (b p) v) - S (vec4 u (b p) (b p) v))) =
      bourRicciSquare g x (vec2 u v) -
        ∑ p, ∑ q, metricRicci g x (vec2 (b p) (b q)) *
          metricRm04At g x (vec4 (b p) u v (b q)) := by
  classical
  dsimp only
  let A := metricRicci g x
  let S := metricNabla0S g (metricNabla0S g (metricRicci g)) x
  let R := metricRm04At g x
  let B := identityInvMetric (Idx := Fin (Module.finrank ℝ E))
  have hB := metricInverseInBasis_identity_of_orthonormal g b hb
  have hδ (p : Fin (Module.finrank ℝ E)) (T : Fin (Module.finrank ℝ E) → ℝ) :
      (∑ q, B p q * T q) = T p := by
    simp [B, identityInvMetric, diagonalInvMetric, ite_mul]
  have haction (p : Fin (Module.finrank ℝ E)) :
      S (vec4 (b p) u (b p) v) - S (vec4 u (b p) (b p) v) =
        -((∑ q, A (vec2 (b q) v) * R (vec4 (b p) u (b p) (b q))) +
          ∑ q, A (vec2 (b p) (b q)) * R (vec4 (b p) u v (b q))) := by
    have h := bourMetricRicci_ricciIdentity g x (b p) u (vec2 (b p) v)
    rw [curvatureAction0SAt_eq_rm04 g b B hB (metricRm13 g) R (bourMetricRm04_lower g x)] at h
    have hinput (X Y : TangentSpace I x) :
        metricTraceInput (I := I) X Y (vec2 (b p) v) = vec4 X Y (b p) v := by
      funext j
      fin_cases j <;> rfl
    have hslot₀ (q : Fin (Module.finrank ℝ E)) :
        Function.update (vec2 (I := I) (b p) v) 0 (b q) = vec2 (b q) v := by
      funext j
      fin_cases j <;> rfl
    have hslot₁ (q : Fin (Module.finrank ℝ E)) :
        Function.update (vec2 (I := I) (b p) v) 1 (b q) = vec2 (b p) (b q) := by
      funext j
      fin_cases j <;> rfl
    have hzero : (vec2 (I := I) (b p) v) 0 = b p := rfl
    have hone : (vec2 (I := I) (b p) v) 1 = v := rfl
    simpa only [hinput, Fin.sum_univ_two, hslot₀, hslot₁, hzero, hone, hδ] using h
  have htrace (q : Fin (Module.finrank ℝ E)) :
      (∑ p, R (vec4 (b p) u (b p) (b q))) = -A (vec2 u (b q)) := by
    rw [show A (vec2 u (b q)) = ricciTensor (I := I) g x u (b q) by
      rw [show A = metricRicci g x by rfl, metricRicci_apply, metricRicciAt_apply_eq_ricciTensor],
      ricciTensor_eq_orthonormal_trace g x u (b q) b hb, ← Finset.sum_neg_distrib]
    refine Finset.sum_congr rfl fun p _ => ?_
    change metricRm04At g x (vec4 (b p) u (b p) (b q)) = _
    rw [metricRm04At_inner]
    change g.inner x (riemannOp (LeviCivita g) x (b p) u (b p)) (b q) = _
    have hskew := riemannOp_metric_skew (I := I) g x (b p) u (b p) (b q)
    rw [g.symm x (b p) _] at hskew
    linarith
  have hfirst :
      (∑ p, ∑ q, A (vec2 (b q) v) * R (vec4 (b p) u (b p) (b q))) =
        -(∑ q, A (vec2 u (b q)) * A (vec2 (b q) v)) := by
    rw [Finset.sum_comm, ← Finset.sum_neg_distrib]
    refine Finset.sum_congr rfl fun q _ => ?_
    rw [← Finset.mul_sum, htrace]
    ring
  have hsquare :
      bourRicciSquare g x (vec2 u v) = ∑ q, A (vec2 u (b q)) * A (vec2 (b q) v) := by
    rw [bourRicciSquare_apply, hamiltonRicciSquareAt_apply g b B hB]
    simp only [hδ, A]
  change (∑ p, (S (vec4 (b p) u (b p) v) - S (vec4 u (b p) (b p) v))) = _
  simp_rw [haction]
  simp only [Finset.sum_neg_distrib, Finset.sum_add_distrib, hfirst, hsquare, A, R]
  ring

set_option maxHeartbeats 400000 in
/-- The crossed Ricci commutator with the curvature action from the
pinned Hamilton tensor conventions. -/
theorem bourCrossedRicci_eq_ricciSquare_sub_curvature (g : SmoothRiemannianMetric I M)
    {x : M} (b : Module.Basis (Fin (Module.finrank ℝ E)) ℝ (TangentSpace I x))
    (hb : ∀ p q, g.inner x (b p) (b q) = if p = q then 1 else 0)
    (u v : TangentSpace I x) :
    let S := metricNabla0S g (metricNabla0S g (metricRicci g)) x
    (∑ p, (S (vec4 (b p) u (b p) v) - S (vec4 u (b p) (b p) v))) =
      bourRicciSquare g x (vec2 u v) - hamiltonCurvatureRicciAt g x (vec2 u v) := by
  classical
  dsimp only
  rw [bourCrossedRicci_commutator g b hb]
  congr 1
  let B := identityInvMetric (Idx := Fin (Module.finrank ℝ E))
  have hB := metricInverseInBasis_identity_of_orthonormal g b hb
  have hδ (p : Fin (Module.finrank ℝ E)) (T : Fin (Module.finrank ℝ E) → ℝ) :
      (∑ q, B p q * T q) = T p := by
    simp [B, identityInvMetric, diagonalInvMetric, ite_mul]
  have hraised (p q : Fin (Module.finrank ℝ E)) :
      raised02CompAt (I := I) b B (metricRicci g x) p q =
        metricRicci g x (vec2 (b p) (b q)) := by
    unfold raised02CompAt
    calc
      _ = ∑ i, B p i * ∑ j, B q j * metricRicci g x (vec2 (b i) (b j)) := by
        simp only [Finset.mul_sum, mul_assoc]
      _ = _ := by simp only [hδ]
  rw [hamiltonCurvatureRicciAt_eq_raised_contraction g b B hB]
  simp only [hraised, metricRm04_apply]
  refine Finset.sum_congr rfl fun p _ => Finset.sum_congr rfl fun q _ => ?_
  have hswap : metricRm04At g x (vec4 (b p) u v (b q)) =
      metricRm04At g x (vec4 u (b p) (b q) v) := by
    simp only [metricRm04At_inner]
    let _ : CovariantDerivative.ContMDiffCovariantDerivative (metricCov (I := I) g) ∞ :=
      CovariantDerivative.contMDiffCovariantDerivativeOn_univ_iff.mp
        (metricCov_smooth (I := I) g isOpen_univ)
    rw [riemannOp_swap (metricCov g) x (b p) u v, map_neg, neg_apply]
    have hskew := riemannOp_metric_skew (I := I) g x u (b p) (b q) v
    rw [g.symm x (b q) _] at hskew
    change g.inner x (riemannOp (metricCov g) x u (b p) (b q)) v +
      g.inner x (riemannOp (metricCov g) x u (b p) v) (b q) = 0 at hskew
    linarith only [hskew]
  rw [hswap, mul_comm]

end
end SmoothPoincare.Bour
