import SmoothPoincare.Heights.MarkedMorseFeet
import SmoothPoincare.Heights.RelativeFootCollar
import DifferentialGeometry.Topology.Manifold.ConnectedComponent
import DifferentialGeometry.Topology.Manifold.PartialDiffeomorph

/-! # A native Morse foot in its own connected incoming-level component -/

open DifferentialGeometry DifferentialGeometry.Topology DifferentialGeometry.Topology.Morse Set
open DifferentialGeometry.Topology.Morse.CellAttachment
open DifferentialGeometry.Topology.Morse.ManifoldCellAttachment
open DifferentialGeometry.PDE.RicciFlow.Surgery.Topology
open scoped ContDiff Manifold Topology

namespace SmoothPoincare.IsolatedOneHandle

noncomputable section

variable {H M : Type} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {J : ModelWithCorners ℝ (MorseModel 4) H} [J.Boundaryless] [IsManifold J ∞ M]
  {f : M → ℝ} {hf : ContMDiff J 𝓘(ℝ, ℝ) ∞ f} {p : M} {lo hi : ℝ}
  (D : IsolatedOneHandle hf p lo hi)

local notation "L" => LevelSetSpace f (f p - D.ε)
local notation "hk₁" => (show (1 : ℕ) ≤ 4 by decide)

/-- The open connected component of the actual incoming level containing
the center of the chosen Morse foot. -/
def footComponent (b : CellBoundary 1) : TopologicalSpace.Opens L := by
  letI := D.footLevelEuclideanCharts
  exact connectedComponentOpen (I := ThreeModel) (D.footEuclideanChart b 0)

theorem footComponent_connectedSpace (b : CellBoundary 1) :
    ConnectedSpace (D.footComponent b) := by
  let := D.footLevelEuclideanCharts
  exact connectedComponentOpen_connectedSpace (I := ThreeModel) (D.footEuclideanChart b 0)

theorem footComponent_isManifold (b : CellBoundary 1) :
    letI := D.footLevelEuclideanCharts
    IsManifold ThreeModel ∞ (D.footComponent b) := by
  let := D.footLevelEuclideanCharts
  let := D.footLevelEuclidean_isManifold
  infer_instance

private theorem footComponent_nonempty (b : CellBoundary 1) :
    Nonempty (D.footComponent b) :=
  ⟨⟨D.footEuclideanChart b 0, mem_connectedComponent⟩⟩

/-- The complete radius-two disk maps to the component of its center. -/
theorem footEuclideanChart_closedBall_two_mapsTo_component (b : CellBoundary 1) :
    MapsTo (D.footEuclideanChart b) (Metric.closedBall (0 : ThreeSpace) 2)
      (D.footComponent b) := by
  let := D.footLevelEuclideanCharts
  let e := D.footEuclideanChart b
  have hcont : ContinuousOn e (Metric.closedBall (0 : ThreeSpace) 2) :=
    e.contMDiffOn_toFun.continuousOn.mono (D.footEuclideanChart_closedBall_two_subset_source b)
  have hconn := Metric.isPreconnected_closedBall.image e hcont
  have hcenter : e 0 ∈ e '' Metric.closedBall (0 : ThreeSpace) 2 :=
    mem_image_of_mem _ (Metric.mem_closedBall_self (by norm_num))
  exact fun _ hz => hconn.subset_connectedComponent hcenter (mem_image_of_mem _ hz)

/-- Restrict the smooth foot chart to the open connected component of the
center. The partial inverse still recovers the original transverse parameter. -/
def footComponentChart (b : CellBoundary 1) :
    letI := D.footLevelEuclideanCharts
    PartialDiffeomorph ThreeModel ThreeModel ThreeSpace (D.footComponent b) ∞ := by
  letI := D.footLevelEuclideanCharts
  let incl := DifferentialGeometry.Topology.PartialDiffeomorph.subtypeVal
    (I := ThreeModel) (D.footComponent b) (D.footComponent_nonempty b)
  exact (D.footEuclideanChart b).trans incl.symm

theorem footComponentChart_closedBall_two_subset_source (b : CellBoundary 1) :
    Metric.closedBall (0 : ThreeSpace) 2 ⊆ (D.footComponentChart b).source := by
  intro z hz
  refine ⟨D.footEuclideanChart_closedBall_two_subset_source b hz, ?_⟩
  change D.footEuclideanChart b z ∈ ((D.footComponent b).openPartialHomeomorphSubtypeCoe
    (D.footComponent_nonempty b)).target
  rw [TopologicalSpace.Opens.openPartialHomeomorphSubtypeCoe_target]
  exact D.footEuclideanChart_closedBall_two_mapsTo_component b hz

theorem footComponentChart_coe (b : CellBoundary 1) {z : ThreeSpace}
    (hz : z ∈ (D.footComponentChart b).source) :
    (D.footComponentChart b z).val = D.footEuclideanChart b z := by
  let incl := (D.footComponent b).openPartialHomeomorphSubtypeCoe (D.footComponent_nonempty b)
  exact incl.right_inv hz.2

/-- The point of the actual connected component given by a native unit-foot
parameter. -/
def footComponentPoint (b : CellBoundary 1) (z : ClosedCell 3) : D.footComponent b :=
  D.footComponentChart b z.val

private theorem footComponentPoint_mem_source (b : CellBoundary 1) (z : ClosedCell 3) :
    z.val ∈ (D.footComponentChart b).source := by
  apply D.footComponentChart_closedBall_two_subset_source b
  rw [Metric.mem_closedBall, dist_zero_right]
  exact z.property.trans (by norm_num)

theorem footComponentPoint_val (b : CellBoundary 1) (z : ClosedCell 3) :
    (D.footComponentPoint b z).val =
      cocoreAttachingEmbedding hk₁ (f p) D.ε D.r D.chart D.ε_pos D.attaching_radius (b, z) := by
  rw [footComponentPoint, D.footComponentChart_coe b (D.footComponentPoint_mem_source b z),
    D.footEuclideanChart_apply, D.footPartialDiffeomorph_apply_closedCell]

theorem footComponentChart_symm_point (b : CellBoundary 1) (z : ClosedCell 3) :
    letI := D.footLevelEuclideanCharts
    (D.footComponentChart b).symm (D.footComponentPoint b z) = z.val := by
  let := D.footLevelEuclideanCharts
  exact (D.footComponentChart b).toPartialEquiv.left_inv (D.footComponentPoint_mem_source b z)

/-- Re-express the native parameter using an orthogonal coordinate change.
A reflection is useful when the original chart reverses orientation. -/
def footComponentReparametrization (b : CellBoundary 1)
    (A : ThreeSpace ≃ₗᵢ[ℝ] ThreeSpace) :
    letI := D.footLevelEuclideanCharts
    PartialDiffeomorph ThreeModel ThreeModel ThreeSpace (D.footComponent b) ∞ := by
  letI := D.footLevelEuclideanCharts
  exact A.symm.toContinuousLinearEquiv.toDiffeomorph.toPartialDiffeomorph.trans
    (D.footComponentChart b)

theorem footComponentReparametrization_closedBall_two_subset_source (b : CellBoundary 1)
    (A : ThreeSpace ≃ₗᵢ[ℝ] ThreeSpace) :
    Metric.closedBall (0 : ThreeSpace) 2 ⊆ (D.footComponentReparametrization b A).source := by
  intro z hz
  refine ⟨mem_univ _, D.footComponentChart_closedBall_two_subset_source b ?_⟩
  change A.symm z ∈ Metric.closedBall (0 : ThreeSpace) 2
  rw [Metric.mem_closedBall, dist_zero_right, LinearIsometryEquiv.norm_map]
  simpa only [Metric.mem_closedBall, dist_zero_right] using hz

theorem footComponentReparametrization_apply (b : CellBoundary 1)
    (A : ThreeSpace ≃ₗᵢ[ℝ] ThreeSpace) (z : ThreeSpace) :
    D.footComponentReparametrization b A (A z) = D.footComponentChart b z := by
  change D.footComponentChart b (A.symm (A z)) = _
  rw [A.symm_apply_apply]

/-- An orientation calculation for the reparametrized native chart gives the
actual oriented-ball input to the relative-isotopy theorem. -/
def footComponentOrientedChart (b : CellBoundary 1) (A : ThreeSpace ≃ₗᵢ[ℝ] ThreeSpace) :
    letI := D.footLevelEuclideanCharts
    letI := D.footComponent_isManifold b
    ∀ o : ManifoldOrientation ThreeModel (D.footComponent b) 3,
      (∀ x, ∀ hx : x ∈ (D.footComponentReparametrization b A).source,
        Orientation.map (Fin 3)
          (IsLocalDiffeomorphAt.mfderivToContinuousLinearEquiv
            (PartialDiffeomorph.isLocalDiffeomorphAt ThreeModel ThreeModel ∞
              (D.footComponentReparametrization b A) hx) (by simp)).toLinearEquiv
          (((EuclideanSpace.basisFun (Fin 3) ℝ).toBasis.map
            (NormedSpace.fromTangentSpace x).symm.toLinearEquiv).orientation) =
          o.orientation (D.footComponentReparametrization b A x)) →
      OrientedBallEmbedding (D.footComponent b) o := by
  letI := D.footLevelEuclideanCharts
  letI := D.footComponent_isManifold b
  intro o h
  exact ⟨D.footComponentReparametrization b A,
    D.footComponentReparametrization_closedBall_two_subset_source b A, h⟩

/-- Normalize one actual foot on its own connected component relative to the
given protected set. The oriented presentation may use a common reflection
of the original transverse parameter on the two charts. -/
theorem exists_relativeFootComponentIsotopy [T2Space M]
    (b : CellBoundary 1) (A : ThreeSpace ≃ₗᵢ[ℝ] ThreeSpace) :
    letI := D.footLevelEuclideanCharts
    letI := D.footComponent_isManifold b
    ∀ (o : ManifoldOrientation ThreeModel (D.footComponent b) 3)
      (actual model : OrientedBallEmbedding (D.footComponent b) o)
      (C : Set (D.footComponent b)),
      (∀ z ∈ Metric.closedBall (0 : ThreeSpace) 1,
        actual.chart (A z) = D.footComponentChart b z) →
      IsCompact C → IsPreconnected Cᶜ →
      Disjoint (actual.chart '' Metric.closedBall (0 : ThreeSpace) 1) C →
      Disjoint (model.chart '' Metric.closedBall (0 : ThreeSpace) 1) C →
      ∃ K : SupportedLevelIsotopy ThreeModel C, ∀ z : ClosedCell 3,
        K.isotopy 1 (D.footComponentPoint b z) = model.chart (A z.val) ∧
        (K.isotopy 1).symm (model.chart (A z.val)) = D.footComponentPoint b z := by
  let := D.footLevelEuclideanCharts
  let := D.footComponent_isManifold b
  let := D.footComponent_connectedSpace b
  intro o actual model C hac hC hcomp ha hm
  obtain ⟨K, hK⟩ := exists_relativeFootLevelIsotopy o actual model C hC hcomp ha hm
  refine ⟨K, fun z => ?_⟩
  have hz : z.val ∈ Metric.closedBall (0 : ThreeSpace) 1 := by
    rw [Metric.mem_closedBall, dist_zero_right]
    exact z.property
  have hAz : A z.val ∈ Metric.closedBall (0 : ThreeSpace) 1 := by
    rw [Metric.mem_closedBall, dist_zero_right, LinearIsometryEquiv.norm_map]
    exact z.property
  have he : K.isotopy 1 (D.footComponentPoint b z) = model.chart (A z.val) := by
    change K.isotopy 1 (D.footComponentChart b z.val) = _
    rw [← hac z.val hz]
    exact hK (A z.val) hAz
  exact ⟨he, by rw [← he, Diffeomorph.symm_apply_apply]⟩

end
end SmoothPoincare.IsolatedOneHandle
