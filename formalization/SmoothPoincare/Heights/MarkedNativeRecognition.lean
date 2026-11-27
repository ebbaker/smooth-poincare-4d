import SmoothPoincare.Heights.TransportedPrefixTrace
import SmoothPoincare.Heights.MarkedSeparatorDegree
import SmoothPoincare.Heights.SmoothMarkedSeam
import DifferentialGeometry.Topology.ThreeManifold.ConnectedSum.Finite
import DifferentialGeometry.Topology.ThreeManifold.SphereTwoTimesCircle.SmoothModel
import Mathlib.GroupTheory.PresentedGroup
import DifferentialGeometry.Topology.FundamentalGroup.HomotopyEquiv
import DifferentialGeometry.Topology.FundamentalGroup.Sphere
import DifferentialGeometry.Geometry.Flow.RicciFlow.Surgery.Topology.OrientationDegree

/-! # Recognition on a specified cut of a mixed two-handle presentation -/

open Set Manifold DifferentialGeometry DifferentialGeometry.Topology DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.PDE.RicciFlow.Surgery.Topology
open scoped ContDiff Manifold Topology ContinuousMap

namespace SmoothPoincare

noncomputable section

universe u

/-- Attachments are labeled by their normalized winding in the lower end.
A label denotes the first attachment when used as an order. -/
inductive NativeMiddleHandle
  | windingOne
  | windingZero
  deriving DecidableEq

namespace NativeMiddleHandle

def remaining : NativeMiddleHandle → NativeMiddleHandle
  | windingOne => windingZero
  | windingZero => windingOne

def winding : NativeMiddleHandle → ℤ
  | windingOne => 1
  | windingZero => 0

end NativeMiddleHandle

local notation "A" => Handle.AttachingRegion 2 2
local notation "B" => Handle.BeltRegion 2 2
local notation "TubeModel" => ModelWithCorners.prod (𝓡 1) 𝓘(ℝ, StandardSurgeryModel.Block 1)
local notation "OpenTube" => StandardSurgeryModel.BoundarySphere 1 × StandardSurgeryModel.Block 1

private def tubeParameters (a : A) : OpenTube :=
  (⟨a.1.val, mem_sphere_zero_iff_norm.mpr a.1.property⟩, a.2.val)

section Presentation

variable {E H M : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {I : ModelWithCorners ℝ E H}

/-- The marked boundary data supplied by a reduced mixed presentation on
the original manifold. The cut is identified with the embedded level for the
chosen order. The two outgoing boundary models carry the same physical face. -/
structure MarkedMixedNativePresentation (I : ModelWithCorners ℝ E H) (M : Type u)
    [TopologicalSpace M] [ChartedSpace H M] where
  lower : ConnectedClosedOrientedManifold.{u} 3
  upper : ConnectedClosedOrientedManifold.{u} 3
  nativeCut : NativeMiddleHandle → ConnectedClosedOrientedManifold.{u} 3
  outgoing : NativeMiddleHandle → ConnectedClosedOrientedManifold.{u} 3
  incomingTube : NativeMiddleHandle → PartialDiffeomorph TubeModel ThreeModel OpenTube lower.Carrier ∞
  fullTube : ∀ j, MapsTo tubeParameters univ (incomingTube j).source
  disjointTubes : Disjoint (range (incomingTube .windingOne ∘ tubeParameters))
    (range (incomingTube .windingZero ∘ tubeParameters))
  lowerInclusion : lower.Carrier → M
  lowerEmbedding : _root_.Topology.IsEmbedding lowerInclusion
  handleInclusion : NativeMiddleHandle → Handle.StandardHandle 2 2 → M
  handleEmbedding : ∀ j, _root_.Topology.IsEmbedding (handleInclusion j)
  handleAttaches : ∀ j a, handleInclusion j (Handle.attachingInclusion 2 2 a) =
    lowerInclusion (incomingTube j (tubeParameters a))
  core : NativeMiddleHandle → C(ULift.{u} (CellBoundary 2), lower.Carrier)
  coreIsTubeAxis : ∀ j z, core j z =
    incomingTube j (tubeParameters (Handle.attachingSphereInclusionAttachingRegion 2 2 z.down))
  coreGenerator : IntegralHomology (ULift.{u} (CellBoundary 2)) 1 ≃ₗ[ℤ] ℤ
  lowerGenerator : IntegralHomology lower.Carrier 1 ≃ₗ[ℤ] ℤ
  normalizedWinding : ∀ j,
    lowerGenerator (integralHomologyMap 1 (core j) (coreGenerator.symm 1)) = j.winding
  height : NativeMiddleHandle → M → ℝ
  smoothHeight : ∀ j, ContMDiff I 𝓘(ℝ, ℝ) ∞ (height j)
  level : NativeMiddleHandle → ℝ
  cutInclusion : (j : NativeMiddleHandle) → (nativeCut j).Carrier → M
  cutEmbedding : ∀ j, _root_.Topology.IsEmbedding (cutInclusion j)
  cutRange : ∀ j, range (cutInclusion j) = (height j) ⁻¹' {level j}
  prefixExterior : (j : NativeMiddleHandle) →
    PartialDiffeomorph ThreeModel ThreeModel lower.Carrier (nativeCut j).Carrier ∞
  pendingInExterior : ∀ j a, incomingTube j.remaining (tubeParameters a) ∈
    (prefixExterior j).source
  prefixBelt : (j : NativeMiddleHandle) → C(B, (nativeCut j).Carrier)
  prefixBeltInM : ∀ j b, cutInclusion j (prefixBelt j b) =
    handleInclusion j (Handle.beltInclusion 2 2 b)
  prefixCorner : ∀ j (p : Handle.Corner 2 2),
    prefixExterior j (incomingTube j (tubeParameters (Handle.attachingCornerInclusion 2 2 p))) =
      prefixBelt j (Handle.beltCornerInclusion 2 2 p)
  outgoingExterior : (j : NativeMiddleHandle) →
    PartialDiffeomorph ThreeModel ThreeModel lower.Carrier (outgoing j).Carrier ∞
  outgoingBelt : (j : NativeMiddleHandle) → NativeMiddleHandle → C(B, (outgoing j).Carrier)
  orderComparison : (outgoing .windingOne).Carrier ≃ₘ^∞⟮ThreeModel, ThreeModel⟯
    (outgoing .windingZero).Carrier
  orderOrientation : orderComparison.preservesOrientation
    (outgoing .windingOne).orientation (outgoing .windingZero).orientation
  orderExterior : ∀ x ∈ (outgoingExterior .windingOne).source ∩
      (outgoingExterior .windingZero).source,
    orderComparison (outgoingExterior .windingOne x) = outgoingExterior .windingZero x
  orderBelt : ∀ j p, orderComparison (outgoingBelt .windingOne j p) = outgoingBelt .windingZero j p
  outgoingInclusion : (j : NativeMiddleHandle) → (outgoing j).Carrier → M
  outgoingSameFace : ∀ x, outgoingInclusion .windingZero (orderComparison x) =
    outgoingInclusion .windingOne x
  upperInclusion : upper.Carrier → M
  upperEmbedding : _root_.Topology.IsEmbedding upperInclusion
  upperClosing : (outgoing .windingOne).Carrier ≃ₘ^∞⟮ThreeModel, ThreeModel⟯ upper.Carrier
  upperClosingReversesOrientation : upperClosing.preservesOrientation
    (outgoing .windingOne).orientation upper.orientation.opposite
  upperSameFace : ∀ x, upperInclusion (upperClosing x) = outgoingInclusion .windingOne x

namespace MarkedMixedNativePresentation

variable (P : MarkedMixedNativePresentation I M)

/-- The pending tube after the first surgery retains every circle and disk
coordinate through the marked exterior. -/
def residualTube (j : NativeMiddleHandle) :
    PartialDiffeomorph TubeModel ThreeModel OpenTube (P.nativeCut j).Carrier ∞ :=
  (P.incomingTube j.remaining).trans (P.prefixExterior j)

theorem residualTube_marked (j : NativeMiddleHandle) (a : A) :
    tubeParameters a ∈ (P.residualTube j).source ∧
      (P.residualTube j).symm (P.residualTube j (tubeParameters a)) = tubeParameters a := by
  have h : tubeParameters a ∈ (P.residualTube j).source :=
    ⟨P.fullTube _ (mem_univ a), P.pendingInExterior j a⟩
  exact ⟨h, (P.residualTube j).left_inv h⟩

/-- The same original upper gluing, read in the outgoing coordinates for
the order actually chosen. -/
def closing : (j : NativeMiddleHandle) →
    (P.outgoing j).Carrier ≃ₘ^∞⟮ThreeModel, ThreeModel⟯ P.upper.Carrier
  | .windingOne => P.upperClosing
  | .windingZero => prefixClosingMark P.orderComparison.symm P.upperClosing

theorem windingZeroClosing_marked :
    (∀ x, P.closing .windingZero x = P.upperClosing (P.orderComparison.symm x)) ∧
      (∀ y, (P.closing .windingZero).symm y = P.orderComparison (P.upperClosing.symm y)) :=
  prefixClosingMark_marked P.orderComparison.symm P.upperClosing

theorem closing_reversesOrientation (j : NativeMiddleHandle) :
    (P.closing j).preservesOrientation (P.outgoing j).orientation P.upper.orientation.opposite := by
  cases j
  · exact P.upperClosingReversesOrientation
  · exact Diffeomorph.preservesOrientation_trans
      (Diffeomorph.preservesOrientation_symm P.orderOrientation) P.upperClosingReversesOrientation

theorem closing_sameFace (j : NativeMiddleHandle) (x : (P.outgoing j).Carrier) :
    P.upperInclusion (P.closing j x) = P.outgoingInclusion j x := by
  cases j
  · exact P.upperSameFace x
  · rw [P.windingZeroClosing_marked.1, P.upperSameFace, ← P.outgoingSameFace,
      P.orderComparison.apply_symm_apply]

theorem closing_sameFace_inverse (j : NativeMiddleHandle) (y : P.upper.Carrier) :
    P.outgoingInclusion j ((P.closing j).symm y) = P.upperInclusion y := by
  rw [← P.closing_sameFace, Diffeomorph.apply_symm_apply]

/-- Reading from the upper end, the forward last handle attaches along
its outgoing face, with its two disk factors exchanged. -/
def reverseTube (j : NativeMiddleHandle) : C(A, P.upper.Carrier) :=
  ⟨fun a => P.closing j (P.outgoingBelt j j.remaining a.swap),
    (P.closing j).continuous.comp ((P.outgoingBelt j j.remaining).continuous.comp continuous_swap)⟩

theorem reverseTube_marked (j : NativeMiddleHandle) (a : A) :
    (P.closing j).symm (P.reverseTube j a) = P.outgoingBelt j j.remaining a.swap :=
  (P.closing j).symm_apply_apply _

theorem orderExterior_inverse {x : P.lower.Carrier}
    (hx : x ∈ (P.outgoingExterior .windingOne).source ∩
      (P.outgoingExterior .windingZero).source) :
    P.orderComparison.symm (P.outgoingExterior .windingZero x) =
      P.outgoingExterior .windingOne x := by
  rw [← P.orderExterior x hx, Diffeomorph.symm_apply_apply]

theorem orderBelt_inverse (j : NativeMiddleHandle) (p : B) :
    P.orderComparison.symm (P.outgoingBelt .windingZero j p) = P.outgoingBelt .windingOne j p := by
  rw [← P.orderBelt j p, Diffeomorph.symm_apply_apply]

/-- An order change on the full rounded lower trace, with its stated
boundary map, reassembles the original upper body by the identity. -/
def switchOrderAssembly {X₁ X₀ Q : Type u}
    [TopologicalSpace X₁] [TopologicalSpace X₀] [TopologicalSpace Q]
    (traceComparison : X₀ ≃ₜ X₁)
    (i₁ : (P.outgoing .windingOne).Carrier → X₁)
    (i₀ : (P.outgoing .windingZero).Carrier → X₀) (iQ : P.upper.Carrier → Q)
    (htrace : ∀ x, traceComparison (i₀ x) = i₁ (P.orderComparison.symm x)) :
    AdjunctionSpace i₀ (iQ ∘ P.closing .windingZero) ≃ₜ
      AdjunctionSpace i₁ (iQ ∘ P.closing .windingOne) :=
  transportedClosedAssemblyHomeomorph traceComparison P.orderComparison.symm.toHomeomorph
    (Homeomorph.refl Q) (Homeomorph.refl P.upper.Carrier) (Homeomorph.refl P.upper.Carrier)
    P.upperClosing.toHomeomorph i₁ i₀ iQ iQ htrace (fun _ => rfl)

end MarkedMixedNativePresentation

end Presentation


section Recognition

open StandardSurgeryModel

local instance : Fact (Module.finrank ℝ (Ambient 1 2) = 4 + 1) := ⟨by
  rw [(WithLp.prodContinuousLinearEquiv 2 ℝ (Block 1) (Block 2)).toLinearEquiv.finrank_eq,
    Module.finrank_prod]
  simp⟩

variable {E H M : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {I : ModelWithCorners ℝ E H}

/-- The two smooth targets selected by the normalized order. -/
def nativeCutModel : NativeMiddleHandle → ConnectedClosedOrientedManifold.{0} 3
  | .windingOne => standardThreeSphereLift
  | .windingZero => finiteConnectedSum [sphereTwoTimesCircleLift, sphereTwoTimesCircleLift]

/-- Route 10 supplies this implication on the actual cut. It uses a
contractible filling in the winding-one case and the ordinary zero-matrix
comparison filling with compression in the winding-zero case. -/
def MarkedNativeCutClassification (P : MarkedMixedNativePresentation I M)
    (j : NativeMiddleHandle) : Prop :=
  PscDominatesThreeCut (P.nativeCut j).orientation →
    Nonempty ((P.nativeCut j).Carrier ≃ₘ^∞⟮ThreeModel, ThreeModel⟯ (nativeCutModel j).Carrier)

/-- Carry the pending framed tube to the classified cut, using the whole
smooth boundary comparison in both directions. -/
def nativeResidualOnModel (P : MarkedMixedNativePresentation I M) (j : NativeMiddleHandle)
    (e : (P.nativeCut j).Carrier ≃ₘ^∞⟮ThreeModel, ThreeModel⟯ (nativeCutModel j).Carrier) :
    PartialDiffeomorph TubeModel ThreeModel OpenTube (nativeCutModel j).Carrier ∞ :=
  prefixResidualTube e.symm (P.residualTube j)

theorem nativeResidualOnModel_marked (P : MarkedMixedNativePresentation I M) (j : NativeMiddleHandle)
    (e : (P.nativeCut j).Carrier ≃ₘ^∞⟮ThreeModel, ThreeModel⟯ (nativeCutModel j).Carrier) :
    let v := nativeResidualOnModel P j e
    v.source = (P.residualTube j).source ∧
      (∀ p, e.symm (v p) = P.residualTube j p) ∧
      (∀ z, v.symm z = (P.residualTube j).symm (e.symm z)) := by
  have h := prefixResidualTube_marked e.symm (P.residualTube j)
  exact ⟨h.1, h.2.2⟩

/-- The terminal comparison on the original assembly with a full signed
collar. The terminal seam can differ from the native cut. In particular the
winding-zero cut cannot be used as the seam of the one-pair round model. -/
structure MarkedNativeRoundComparison (P : MarkedMixedNativePresentation I M)
    (j : NativeMiddleHandle) where
  seam : ConnectedClosedOrientedManifold.{u} 3
  assembly : M ≃ₜ OnePairRoundSphere
  signedCollar : PartialDiffeomorph (ThreeModel.prod 𝓘(ℝ, ℝ)) I (seam.Carrier × ℝ) M ∞
  seamMark : seam.Carrier ≃ₘ^∞⟮ThreeModel, (𝓡 1).prod (𝓡 2)⟯ OnePairSeam
  circlePoint : BoundarySphere 1
  spherePoint : BoundarySphere 2
  width : ℝ
  widthPos : 0 < width
  widthLe : width ≤ 1 / 2
  signedSource : signedCollar.source = {p | p.2 ∈ Ioo (-width) width}
  signedProduct : ∀ p ∈ signedCollar.source,
    assembly (signedCollar p) = seamChart circlePoint spherePoint (seamMark p.1, p.2)
  leftSmooth : ContMDiffOn I (𝓡 4) ∞ assembly (assembly ⁻¹' onePairLeftInterior)
  rightSmooth : ContMDiffOn I (𝓡 4) ∞ assembly (assembly ⁻¹' onePairRightInterior)
  leftInverseSmooth : ContMDiffOn (𝓡 4) I ∞ assembly.symm onePairLeftInterior
  rightInverseSmooth : ContMDiffOn (𝓡 4) I ∞ assembly.symm onePairRightInterior

/-- The remaining geometric recognition input for the chosen order. The
returned comparison is based on the residual tube, reversed upper tube,
and closing of this presentation, with the displayed inverse equations. -/
def MarkedNativeGeometricClosing (P : MarkedMixedNativePresentation I M)
    (j : NativeMiddleHandle) : Prop :=
  (∀ a : A, tubeParameters a ∈ (P.residualTube j).source ∧
    (P.residualTube j).symm (P.residualTube j (tubeParameters a)) = tubeParameters a) →
  (∀ a : A, (P.closing j).symm (P.reverseTube j a) = P.outgoingBelt j j.remaining a.swap) →
  (∀ x, P.upperInclusion (P.closing j x) = P.outgoingInclusion j x) →
  (∀ y, P.outgoingInclusion j ((P.closing j).symm y) = P.upperInclusion y) →
  ∀ e : (P.nativeCut j).Carrier ≃ₘ^∞⟮ThreeModel, ThreeModel⟯ (nativeCutModel j).Carrier,
    (∀ p, e.symm (nativeResidualOnModel P j e p) = P.residualTube j p) →
    (∀ z, (nativeResidualOnModel P j e).symm z = (P.residualTube j).symm (e.symm z)) →
    Nonempty (MarkedNativeRoundComparison P j)

/-- A PSC witness on the selected embedded cut yields a smooth standard
sphere once the actual order's boundary classification and relative
geometric closing are supplied. The open seam proves smoothness in both
directions. No metric assumption on the original four-sphere is used. -/
theorem standard_of_pscDominated_markedNativeCut (P : MarkedMixedNativePresentation I M)
    (j : NativeMiddleHandle) (psc : PscDominatesThreeCut (P.nativeCut j).orientation)
    (classify : MarkedNativeCutClassification P j)
    (close : MarkedNativeGeometricClosing P j) :
    Nonempty (M ≃ₘ^∞⟮I, 𝓡 4⟯ Metric.sphere (0 : EuclideanSpace ℝ (Fin 5)) 1) := by
  obtain ⟨cutModel⟩ := classify psc
  obtain ⟨Q⟩ := close (P.residualTube_marked j) (P.reverseTube_marked j)
    (P.closing_sameFace j) (P.closing_sameFace_inverse j) cutModel
    (nativeResidualOnModel_marked P j cutModel).2.1
    (nativeResidualOnModel_marked P j cutModel).2.2
  exact ⟨diffeomorphToS4OfSmoothMarkedSeam Q.assembly Q.signedCollar Q.seamMark Q.circlePoint
    Q.spherePoint Q.widthPos Q.widthLe Q.signedSource Q.signedProduct Q.leftSmooth Q.rightSmooth
    Q.leftInverseSmooth Q.rightInverseSmooth⟩

/-- The Mazur meridian-first control consumes its actual degree-one
certificate and returns the original marked assembly, with the long tube
retained by the exterior. The classification and relative closing remain
supplied geometric inputs on that fixture. -/
theorem mazur_meridianFirst_control (P : MarkedMixedNativePresentation I M)
    (S : ConnectedClosedOrientedManifold.{u} 3)
    (g : SmoothRiemannianMetric ThreeModel S.Carrier) (hg : ∀ x, 0 < metricScalarAt g x)
    (f : C(S.Carrier, (P.nativeCut .windingZero).Carrier))
    (hdeg : orientedDegree S.orientation (P.nativeCut .windingZero).orientation f = 1)
    (cutModel : (P.nativeCut .windingZero).Carrier
      ≃ₘ^∞⟮ThreeModel, ThreeModel⟯ (nativeCutModel .windingZero).Carrier)
    (close : MarkedNativeGeometricClosing P .windingZero) :
    Nonempty (M ≃ₘ^∞⟮I, 𝓡 4⟯ Metric.sphere (0 : EuclideanSpace ℝ (Fin 5)) 1) :=
  standard_of_pscDominated_markedNativeCut P .windingZero
    (.intro S.orientation g hg f (hdeg ▸ one_ne_zero)) (fun _ => ⟨cutModel⟩) close

/-- On the long-component-first Mazur cut, its nonspherical boundary and
the winding-one classification exclude PSC domination. -/
theorem mazur_longFirst_noPsc (P : MarkedMixedNativePresentation I M)
    (classify : MarkedNativeCutClassification P .windingOne)
    (nonSimplyConnected : ¬ SimplyConnectedSpace (P.nativeCut .windingOne).Carrier) :
    ¬ PscDominatesThreeCut (P.nativeCut .windingOne).orientation := by
  intro psc
  obtain ⟨e⟩ := classify psc
  let standard := e.trans standardThreeSphereLiftDiffeomorph.symm
  exact nonSimplyConnected (standard.toHomeomorph.toHomotopyEquiv.simplyConnectedSpace_iff.mpr
    sphereThreeSimplyConnectedSpace)

namespace HMP

/-- The returned meridian-first closing of the specified HMP cross-gluing.
Its successive maps are the boundary of the retained lower comparison,
the pre-`D) comparison, and the boundary of the upper cancellation. -/
structure Closing (P : MarkedMixedNativePresentation I M) where
  beforeD : ConnectedClosedOrientedManifold.{u} 3
  topAfterD : ConnectedClosedOrientedManifold.{u} 3
  boundaryJ : (P.outgoing .windingZero).Carrier ≃ₘ^∞⟮ThreeModel, ThreeModel⟯ beforeD.Carrier
  delta : beforeD.Carrier ≃ₘ^∞⟮ThreeModel, ThreeModel⟯ topAfterD.Carrier
  boundaryXiPlus : topAfterD.Carrier ≃ₘ^∞⟮ThreeModel, ThreeModel⟯ P.upper.Carrier
  factors : P.closing .windingZero = boundaryJ.trans (delta.trans boundaryXiPlus)

/-- The actual closing and its inverse, before and after changing the
order. The HMP convention has `F = P.orderComparison.symm`. -/
theorem Closing.marked {P : MarkedMixedNativePresentation I M} (Q : Closing P) :
    (∀ x, P.closing .windingZero x = Q.boundaryXiPlus (Q.delta (Q.boundaryJ x))) ∧
    (∀ y, (P.closing .windingZero).symm y =
      Q.boundaryJ.symm (Q.delta.symm (Q.boundaryXiPlus.symm y))) ∧
    (∀ x, P.closing .windingOne x =
      Q.boundaryXiPlus (Q.delta (Q.boundaryJ (P.orderComparison x)))) ∧
    (∀ y, (P.closing .windingOne).symm y =
      P.orderComparison.symm (Q.boundaryJ.symm (Q.delta.symm (Q.boundaryXiPlus.symm y)))) := by
  have hof (x : (P.outgoing .windingOne).Carrier) :
      P.closing .windingOne x = P.closing .windingZero (P.orderComparison x) := by
    rw [P.windingZeroClosing_marked.1, Diffeomorph.symm_apply_apply]
    rfl
  have hoi (y : P.upper.Carrier) :
      (P.closing .windingOne).symm y =
        P.orderComparison.symm ((P.closing .windingZero).symm y) := by
    rw [P.windingZeroClosing_marked.2, Diffeomorph.symm_apply_apply]
    rfl
  exact ⟨fun x => by rw [Q.factors]; rfl, fun y => by rw [Q.factors]; rfl,
    fun x => by rw [hof, Q.factors]; rfl, fun y => by rw [hoi, Q.factors]; rfl⟩

/-- A physical product slice in the marked HMP meridian-first bicollar,
parametrized with the increasing-normal orientation. -/
structure ProductSlice (P : MarkedMixedNativePresentation I M) where
  source : ConnectedClosedOrientedManifold.{u} 3
  sliceInclusion : source.Carrier → M
  sliceEmbedding : _root_.Topology.IsEmbedding sliceInclusion
  projection : source.Carrier ≃ₘ^∞⟮ThreeModel, ThreeModel⟯
    (P.nativeCut .windingZero).Carrier
  positive : PreservesTangentOrientation source.orientation
    (P.nativeCut .windingZero).orientation projection
  signedCollar : PartialDiffeomorph (ThreeModel.prod 𝓘(ℝ, ℝ)) I
    ((P.nativeCut .windingZero).Carrier × ℝ) M ∞
  time : ℝ
  center_in_source : ∀ z, (z, 0) ∈ signedCollar.source
  slice_in_source : ∀ z, (z, time) ∈ signedCollar.source
  centered : ∀ z, signedCollar (z, 0) = P.cutInclusion .windingZero z
  projection_marked : ∀ x, sliceInclusion x = signedCollar (projection x, time)
  inducedMetric : SmoothRiemannianMetric ThreeModel source.Carrier
  inducedPsc : ∀ x, 0 < metricScalarAt inducedMetric x

theorem ProductSlice.degree_one {P : MarkedMixedNativePresentation I M} (S : ProductSlice P) :
    orientedDegree S.source.orientation (P.nativeCut .windingZero).orientation
      ⟨S.projection, S.projection.continuous⟩ = 1 :=
  orientedDegree_diffeomorph S.source.orientation (P.nativeCut .windingZero).orientation
    S.projection S.positive

/-- The projection is the degree-one witness on the actual returned cut.
The geometric closing input uses the factored original closing. -/
theorem standard_of_markedProductSlice (P : MarkedMixedNativePresentation I M)
    (Q : Closing P) (S : ProductSlice P)
    (cutModel : (P.nativeCut .windingZero).Carrier
      ≃ₘ^∞⟮ThreeModel, ThreeModel⟯ (nativeCutModel .windingZero).Carrier)
    (close : P.closing .windingZero = Q.boundaryJ.trans (Q.delta.trans Q.boundaryXiPlus) →
      MarkedNativeGeometricClosing P .windingZero) :
    Nonempty (M ≃ₘ^∞⟮I, 𝓡 4⟯ Metric.sphere (0 : EuclideanSpace ℝ (Fin 5)) 1) :=
  mazur_meridianFirst_control P S.source S.inducedMetric S.inducedPsc
    ⟨S.projection, S.projection.continuous⟩ S.degree_one cutModel (close Q.factors)

end HMP

end Recognition

namespace MillerSchuppEquator

private def x : FreeGroup Bool := FreeGroup.of false
private def y : FreeGroup Bool := FreeGroup.of true

/-- The relators induced by the two actual framed caps in the equatorial
halves, in the order of the two complementary groups. -/
def Relators : Bool → Set (FreeGroup Bool)
  | false => {x⁻¹ * y ^ 2 * x * (y ^ 3)⁻¹}
  | true => {y * x ^ 2 * y⁻¹ * (x ^ 3)⁻¹}

private def dilation : Equiv.Perm ℚ where
  toFun t := 2 / 3 * t
  invFun t := 3 / 2 * t
  left_inv t := by dsimp; ring
  right_inv t := by dsimp; ring

private def translation : Equiv.Perm ℚ where
  toFun t := t + 1
  invFun t := t - 1
  left_inv t := by dsimp; ring
  right_inv t := by dsimp; ring

private def affineGenerators : Bool → Bool → Equiv.Perm ℚ
  | false, false => dilation
  | false, true => translation
  | true, false => translation
  | true, true => dilation⁻¹

private theorem affineRelators (side : Bool) (r : FreeGroup Bool) (hr : r ∈ Relators side) :
    FreeGroup.lift (affineGenerators side) r = 1 := by
  cases side
  · have hr' : r = x⁻¹ * y ^ 2 * x * (y ^ 3)⁻¹ := mem_singleton_iff.mp hr
    subst r
    simp only [x, y, map_mul, map_inv, map_pow, FreeGroup.lift_apply_of, affineGenerators]
    ext t
    simp only [pow_succ, pow_zero, one_mul, Equiv.Perm.mul_apply, Equiv.Perm.coe_inv, Equiv.Perm.coe_one, id_eq]
    change 3 / 2 * (2 / 3 * (t - 1 - 1 - 1) + 1 + 1) = t
    ring
  · have hr' : r = y * x ^ 2 * y⁻¹ * (x ^ 3)⁻¹ := mem_singleton_iff.mp hr
    subst r
    simp only [x, y, map_mul, map_inv, map_pow, FreeGroup.lift_apply_of, affineGenerators]
    ext t
    simp only [pow_succ, pow_zero, one_mul, Equiv.Perm.mul_apply, Equiv.Perm.coe_inv, Equiv.Perm.coe_one, id_eq]
    change 3 / 2 * (2 / 3 * (t - 1 - 1 - 1) + 1 + 1) = t
    ring

/-- Neither of the actual complementary group presentations is abelian.
The affine representations supply explicit noncommuting images. -/
theorem noncommuting_generators (side : Bool) :
    let X : PresentedGroup (Relators side) := PresentedGroup.of false
    let Y : PresentedGroup (Relators side) := PresentedGroup.of true
    X * Y ≠ Y * X := by
  intro X Y h
  let f := PresentedGroup.toGroup (affineRelators side)
  have hm := congrArg f h
  change f (PresentedGroup.of false * PresentedGroup.of true) =
    f (PresentedGroup.of true * PresentedGroup.of false) at hm
  simp only [f, map_mul, PresentedGroup.toGroup.of] at hm
  have h0 := DFunLike.congr_fun hm (0 : ℚ)
  cases side
  · simp only [affineGenerators, Equiv.Perm.mul_apply] at h0
    change (2 / 3 : ℚ) * (0 + 1) = 2 / 3 * 0 + 1 at h0
    norm_num at h0
  · simp only [affineGenerators, Equiv.Perm.mul_apply, Equiv.Perm.coe_inv] at h0
    change (3 / 2 : ℚ) * 0 + 1 = 3 / 2 * (0 + 1) at h0
    norm_num at h0

/-- Once the marked cap calculation identifies the fundamental group of an
actual equatorial complementary side, no ambient comparison can take it
onto a cyclic complementary side of a native winding-zero cut. This checks
either equatorial side and works with either assignment of the native sides. -/
theorem no_ambient_comparison_to_native_side
    {M N : Type*} [TopologicalSpace M] [TopologicalSpace N]
    (S : Set M) (T : Set N) (s : S) (side : Bool)
    (equatorGroup : FundamentalGroup S s ≃* PresentedGroup (Relators side))
    (nativeGroup : ∀ t : T, Nonempty (FundamentalGroup T t ≃* Multiplicative ℤ)) :
    ¬ ∃ e : M ≃ₜ N, e '' S = T := by
  rintro ⟨e, he⟩
  let f := (e.image S).trans (Homeomorph.setCongr he)
  let g := fundamentalGroupMulEquivOfHomotopyEquiv f.toHomotopyEquiv s (f s) rfl
  obtain ⟨cyclic⟩ := nativeGroup (f s)
  let k := (equatorGroup.symm.trans g).trans cyclic
  apply noncommuting_generators side
  apply k.injective
  rw [map_mul, map_mul, mul_comm]

/-- A homeomorphism taking the embedded equator onto the embedded native
cut would transport each connected component of the complement. One actual
equatorial side suffices to contradict cyclicity on both native sides. -/
theorem no_ambient_comparison_to_native_cut
    {M N : Type*} [TopologicalSpace M] [TopologicalSpace N]
    (equator : Set M) (cut : Set N) (p : M) (hp : p ∉ equator) (side : Bool)
    (equatorGroup : FundamentalGroup (connectedComponentIn equatorᶜ p)
      ⟨p, mem_connectedComponentIn hp⟩ ≃* PresentedGroup (Relators side))
    (nativeGroup : ∀ q ∉ cut, ∀ t : connectedComponentIn cutᶜ q,
      Nonempty (FundamentalGroup (connectedComponentIn cutᶜ q) t ≃* Multiplicative ℤ)) :
    ¬ ∃ e : M ≃ₜ N, e '' equator = cut := by
  rintro ⟨e, he⟩
  have hcompl : e '' equatorᶜ = cutᶜ := (image_compl_eq e.bijective).trans (congrArg compl he)
  have hq : e p ∉ cut := by
    change e p ∈ cutᶜ
    rw [← hcompl]
    exact mem_image_of_mem e hp
  have hside : e '' connectedComponentIn equatorᶜ p = connectedComponentIn cutᶜ (e p) := by
    rw [e.image_connectedComponentIn hp, hcompl]
  exact no_ambient_comparison_to_native_side _ _ ⟨p, mem_connectedComponentIn hp⟩ side
    equatorGroup (nativeGroup (e p) hq) ⟨e, hside⟩

end MillerSchuppEquator

end

end SmoothPoincare
