import DifferentialGeometry.Topology.Handle.Basic
import DifferentialGeometry.Topology.Homology.IntegralChainMaps
import DifferentialGeometry.Topology.Homology.SingularPair
import Mathlib.Analysis.Convex.Contractible
import Mathlib.Algebra.Homology.ShortComplex.ModuleCat
import Mathlib.LinearAlgebra.Dimension.Localization

/-! # The reversed last attaching core on a rank-increasing cut

The two regular cuts lie in the same trace. The forward relative group in
degree two and the reverse relative group in degree one constrain the actual
inclusion on integral first homology. The marked reverse core bounds the
forward cocore in that trace.
-/

open CategoryTheory CategoryTheory.Limits DifferentialGeometry.Topology
open DifferentialGeometry.PDE.RicciFlow.Surgery.Topology
open scoped ContinuousMap

namespace SmoothPoincare

noncomputable section

universe u

variable {W : Type u} [TopologicalSpace W]

/-- For a trace with lower first homology of rank `r+1` and upper first
homology free of rank `r`, the smaller end includes injectively. The
relative hypotheses are the degree-two lower group and the degree-one
upper group of this same trace. -/
theorem reverseMiddleAttachment_injectiveH1 (Z U : Set W) (r : ℕ)
    (hZ : IntegralHomology Z 1 ≃ₗ[ℤ] (Fin (r + 1) → ℤ))
    (hU : IntegralHomology U 1 ≃ₗ[ℤ] (Fin r → ℤ))
    (hrelZ : SingularPair.relativeHomology integralCoefficients (TopCat.of W) Z 2 ≃ₗ[ℤ] ℤ)
    (hrelU : IsZero (SingularPair.relativeHomology integralCoefficients (TopCat.of W) U 1)) :
    Function.Injective (SingularPair.inclMap integralCoefficients (TopCat.of W) U 1) := by
  let lower : IntegralHomology Z 1 →ₗ[ℤ] IntegralHomology W 1 :=
    (SingularPair.inclMap integralCoefficients (TopCat.of W) Z 1).hom
  let upper : IntegralHomology U 1 →ₗ[ℤ] IntegralHomology W 1 :=
    (SingularPair.inclMap integralCoefficients (TopCat.of W) U 1).hom
  let δ : SingularPair.relativeHomology integralCoefficients (TopCat.of W) Z 2 →ₗ[ℤ]
      IntegralHomology Z 1 := (SingularPair.δ integralCoefficients (TopCat.of W) Z 1).hom
  let : Module.Finite ℤ (IntegralHomology Z 1) := Module.Finite.equiv hZ.symm
  let : Module.Finite ℤ (IntegralHomology U 1) := Module.Finite.equiv hU.symm
  let : Module.Finite ℤ (SingularPair.relativeHomology integralCoefficients (TopCat.of W) Z 2) :=
    Module.Finite.equiv hrelZ.symm
  let : Module.IsTorsionFree ℤ (IntegralHomology U 1) :=
    hU.injective.moduleIsTorsionFree _ (fun a x => hU.map_smul a x)
  let : Module ℤ (LinearMap.ker lower) := (LinearMap.ker lower).module
  let : Module ℤ (LinearMap.range lower) := (LinearMap.range lower).module
  let : Module ℤ (LinearMap.range δ) := (LinearMap.range δ).module
  let : Module ℤ (LinearMap.ker upper) := (LinearMap.ker upper).module
  let : Module ℤ (IntegralHomology Z 1 ⧸ LinearMap.ker lower) :=
    Submodule.Quotient.module (LinearMap.ker lower)
  let : Module ℤ (IntegralHomology U 1 ⧸ LinearMap.ker upper) :=
    Submodule.Quotient.module (LinearMap.ker upper)
  have hz : Module.finrank ℤ (IntegralHomology Z 1) = r + 1 := by simpa using hZ.finrank_eq
  have hu : Module.finrank ℤ (IntegralHomology U 1) = r := by simpa using hU.finrank_eq
  have hrel : Module.finrank ℤ
      (SingularPair.relativeHomology integralCoefficients (TopCat.of W) Z 2) = 1 := by
    simpa using hrelZ.finrank_eq
  have hker : LinearMap.ker lower = LinearMap.range δ := by
    exact (SingularPair.les_exact₁ integralCoefficients (TopCat.of W) Z 1).moduleCat_range_eq_ker.symm
  have hkerRank : Module.finrank ℤ (LinearMap.ker lower) =
      Module.finrank ℤ (LinearMap.range δ) :=
    congrArg (fun S : Submodule ℤ (IntegralHomology Z 1) =>
      @Module.finrank ℤ S _ _ S.module) hker
  have hkerZ : Module.finrank ℤ (LinearMap.ker lower) ≤ 1 := by
    exact hkerRank.le.trans ((LinearMap.finrank_range_le δ).trans_eq hrel)
  have hrankZ := (LinearMap.ker lower).finrank_quotient_add_finrank
  have hsur : Function.Surjective upper := by
    intro x
    apply (ShortComplex.moduleCat_exact_iff _).mp
      (SingularPair.les_exact₂ integralCoefficients (TopCat.of W) U 1) x
    exact congrArg (fun f : IntegralHomology W 1 ⟶
      SingularPair.relativeHomology integralCoefficients (TopCat.of W) U 1 => f x)
      (hrelU.eq_of_tgt _ 0)
  let : Module.Finite ℤ (IntegralHomology W 1) := Module.Finite.of_surjective upper hsur
  have hlq := lower.quotKerEquivRange.finrank_eq
  have hle : r ≤ Module.finrank ℤ (IntegralHomology W 1) :=
    (show r ≤ Module.finrank ℤ (LinearMap.range lower) by omega).trans (Submodule.finrank_le _)
  have hrankU := (LinearMap.ker upper).finrank_quotient_add_finrank
  have huq := (LinearMap.quotKerEquivOfSurjective upper hsur).finrank_eq
  have hzero : Module.finrank ℤ (LinearMap.ker upper) = 0 := by omega
  let : Subsingleton (LinearMap.ker upper) := Module.finrank_zero_iff.mp hzero
  change Function.Injective upper
  exact LinearMap.ker_eq_bot.mp Submodule.eq_bot_of_subsingleton

variable {O : Type u} [TopologicalSpace O]

/-- The actual reversed attaching tube is the outgoing belt face read in
the upper marking, with the full circle and disk coordinates exchanged. -/
def reverseMiddleTube {U : Set W} (γ : O ≃ₜ U) (o : C(Handle.BeltRegion 2 2, O)) :
    C(Handle.AttachingRegion 2 2, U) :=
  ⟨fun p => γ (o p.swap), γ.continuous.comp (o.continuous.comp continuous_swap)⟩

/-- Its oriented circle is parametrized by the boundary of the forward
cocore disk. -/
def reverseMiddleCore {U : Set W} (γ : O ≃ₜ U) (o : C(Handle.BeltRegion 2 2, O)) :
    C(ULift.{u} (CellBoundary 2), U) :=
  (reverseMiddleTube γ o).comp
    ⟨fun z => Handle.attachingSphereInclusionAttachingRegion 2 2 z.down,
      (Handle.continuous_attachingSphereInclusionAttachingRegion 2 2).comp continuous_uliftDown⟩

/-- The full, marked outgoing face identifies the reverse core with the
boundary of the actual forward cocore in the trace. The rank profile then
forces its class to be zero in the upper boundary itself. -/
theorem reverseMiddleCore_nullHomologous (Z U : Set W) (r : ℕ)
    (hZ : IntegralHomology Z 1 ≃ₗ[ℤ] (Fin (r + 1) → ℤ))
    (hU : IntegralHomology U 1 ≃ₗ[ℤ] (Fin r → ℤ))
    (hrelZ : SingularPair.relativeHomology integralCoefficients (TopCat.of W) Z 2 ≃ₗ[ℤ] ℤ)
    (hrelU : IsZero (SingularPair.relativeHomology integralCoefficients (TopCat.of W) U 1))
    (γ : O ≃ₜ U) (o : C(Handle.BeltRegion 2 2, O))
    (c : C(Handle.StandardHandle 2 2, W))
    (hface : ∀ p, (γ (o p)).val = c (Handle.beltInclusion 2 2 p))
    (z : IntegralHomology (ULift.{u} (CellBoundary 2)) 1) :
    integralHomologyMap 1 (reverseMiddleCore γ o) z = 0 := by
  let i : C(U,W) := ⟨Subtype.val, continuous_subtype_val⟩
  let j : C(ULift.{u} (CellBoundary 2), ULift.{u} (ClosedCell 2)) :=
    ⟨fun v => ULift.up (cellBoundaryInclusion 2 v.down),
      continuous_uliftUp.comp ((continuous_cellBoundaryInclusion 2).comp continuous_uliftDown)⟩
  let d : C(ULift.{u} (ClosedCell 2), W) :=
    ⟨fun v => c (Handle.cocoreDiskInclusion 2 2 v.down),
      c.continuous.comp ((Handle.continuous_cocoreDiskInclusion 2 2).comp continuous_uliftDown)⟩
  have h : i.comp (reverseMiddleCore γ o) = d.comp j := by
    ext v
    exact hface (Handle.beltSphereInclusionBeltRegion 2 2 v.down)
  let : ContractibleSpace (ClosedCell 2) := by
    have hball : {v : EuclideanSpace ℝ (Fin 2) | ‖v‖ ≤ 1} = Metric.closedBall 0 1 := by
      ext v
      simp [Metric.mem_closedBall, dist_zero_right]
    change ContractibleSpace ↥{v : EuclideanSpace ℝ (Fin 2) | ‖v‖ ≤ 1}
    rw [hball]
    exact (convex_closedBall _ _).contractibleSpace ⟨0, by simp⟩
  let : ContractibleSpace (ULift.{u} (ClosedCell 2)) :=
    (Homeomorph.ulift : ULift.{u} (ClosedCell 2) ≃ₜ ClosedCell 2).contractibleSpace
  have hD := SingularPair.isZero_of_contractible integralCoefficients
    (ULift.{u} (ClosedCell 2)) 1 one_ne_zero
  have hz : integralHomologyMap 1 j z = 0 :=
    congrArg (fun f : IntegralHomology (ULift.{u} (CellBoundary 2)) 1 ⟶
      IntegralHomology (ULift.{u} (ClosedCell 2)) 1 => f z) (hD.eq_of_tgt _ 0)
  have hcomp (X Y T : Type u) [TopologicalSpace X] [TopologicalSpace Y] [TopologicalSpace T]
      (f : C(X,Y)) (g : C(Y,T)) (x : IntegralHomology X 1) :
      integralHomologyMap 1 (g.comp f) x = integralHomologyMap 1 g (integralHomologyMap 1 f x) :=
    congrArg (fun k : IntegralHomology X 1 ⟶ IntegralHomology T 1 => k x)
      ((integralHomologyFunctor 1).map_comp (TopCat.ofHom f) (TopCat.ofHom g))
  apply reverseMiddleAttachment_injectiveH1 Z U r hZ hU hrelZ hrelU
  change integralHomologyMap 1 i (integralHomologyMap 1 (reverseMiddleCore γ o) z) =
    integralHomologyMap 1 i 0
  rw [← hcomp, h, hcomp, hz, map_zero, map_zero]

end

end SmoothPoincare
