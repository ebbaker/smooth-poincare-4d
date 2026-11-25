import Mathlib.MeasureTheory.Integral.DominatedConvergence
import SectionsAndConnections.ThreeAxisWeyl

/-!
# Chiral densities on a fixed truncation

The matrices are supplied curvature-operator coefficients in oriented orthonormal
self-dual frames. The real volume Jacobian is relative to the fixed reference measure.
-/

namespace FirstOrderTwistor

open Filter MeasureTheory
open scoped BigOperators Topology

/-- The chiral Hilbert–Schmidt density with respect to the reference volume. -/
noncomputable def chiralHSDensity {α : Type*} (W : α → Matrix (Fin 3) (Fin 3) ℝ)
    (jac : α → ℝ) (x : α) : ℝ :=
  jac x * SectionsAndConnections.hilbertSchmidtSq (W x)

theorem chiralHSDensity_nonneg {α : Type*} {W : α → Matrix (Fin 3) (Fin 3) ℝ}
    {jac : α → ℝ} {x : α} (hJac : 0 ≤ jac x) : 0 ≤ chiralHSDensity W jac x := by
  unfold chiralHSDensity SectionsAndConnections.hilbertSchmidtSq
  exact mul_nonneg hJac (Finset.sum_nonneg fun a _ =>
    Finset.sum_nonneg fun b _ => sq_nonneg (W x a b))

/-- Componentwise convergence of the nine entries and of the volume Jacobian gives
pointwise convergence of the resulting density. -/
theorem tendsto_chiralHSDensity {α ι : Type*} {l : Filter ι}
    {W : ι → α → Matrix (Fin 3) (Fin 3) ℝ} {Wlim : α → Matrix (Fin 3) (Fin 3) ℝ}
    {jac : ι → α → ℝ} {jaclim : α → ℝ} {x : α}
    (hW : ∀ a b, Tendsto (fun i => W i x a b) l (𝓝 (Wlim x a b)))
    (hJac : Tendsto (fun i => jac i x) l (𝓝 (jaclim x))) :
    Tendsto (fun i => chiralHSDensity (W i) (jac i) x) l
      (𝓝 (chiralHSDensity Wlim jaclim x)) := by
  unfold chiralHSDensity SectionsAndConnections.hilbertSchmidtSq
  exact hJac.mul (tendsto_finsetSum Finset.univ fun a _ =>
    tendsto_finsetSum Finset.univ fun b _ => (hW a b).pow 2)

/-- Dominated convergence of the chiral energy integrals on one fixed truncation.
An integrable majorant also gives integrability of the densities and their limit. -/
theorem chiralHSDensity_integrableOn_and_tendsto {α : Type*} [MeasurableSpace α]
    {volume : Measure α} {s : Set α}
    {W : ℕ → α → Matrix (Fin 3) (Fin 3) ℝ} {Wlim : α → Matrix (Fin 3) (Fin 3) ℝ}
    {jac : ℕ → α → ℝ} {jaclim bound : α → ℝ}
    (hW : ∀ a b, ∀ᵐ x ∂volume.restrict s,
      Tendsto (fun i => W i x a b) atTop (𝓝 (Wlim x a b)))
    (hJac : ∀ᵐ x ∂volume.restrict s, Tendsto (fun i => jac i x) atTop (𝓝 (jaclim x)))
    (hMeas : ∀ i, AEStronglyMeasurable (chiralHSDensity (W i) (jac i)) (volume.restrict s))
    (hBound : IntegrableOn bound s volume)
    (hDom : ∀ i, ∀ᵐ x ∂volume.restrict s, ‖chiralHSDensity (W i) (jac i) x‖ ≤ bound x) :
    (∀ i, IntegrableOn (chiralHSDensity (W i) (jac i)) s volume) ∧
      IntegrableOn (chiralHSDensity Wlim jaclim) s volume ∧
      Tendsto (fun i => ∫ x in s, chiralHSDensity (W i) (jac i) x ∂volume) atTop
        (𝓝 (∫ x in s, chiralHSDensity Wlim jaclim x ∂volume)) := by
  have hEntries : ∀ᵐ x ∂volume.restrict s, ∀ a b,
      Tendsto (fun i => W i x a b) atTop (𝓝 (Wlim x a b)) :=
    ae_all_iff.2 fun a => ae_all_iff.2 (hW a)
  have hLimit : ∀ᵐ x ∂volume.restrict s,
      Tendsto (fun i => chiralHSDensity (W i) (jac i) x) atTop
        (𝓝 (chiralHSDensity Wlim jaclim x)) := by
    filter_upwards [hEntries, hJac] with x hx hj
    exact tendsto_chiralHSDensity hx hj
  refine ⟨fun i => hBound.mono' (hMeas i) (hDom i), ?_, ?_⟩
  · exact ⟨aestronglyMeasurable_of_tendsto_ae atTop hMeas hLimit,
      hasFiniteIntegral_of_dominated_convergence hBound.hasFiniteIntegral hDom hLimit⟩
  · exact tendsto_integral_of_dominated_convergence bound hMeas hBound hDom hLimit

end FirstOrderTwistor
