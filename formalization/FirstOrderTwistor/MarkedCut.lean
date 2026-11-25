import FirstOrderTwistor.ExteriorPatch
import FirstOrderTwistor.OrientedCutGluing

/-! # From a corrected cap germ to the original smooth type -/

open Set DifferentialGeometry
open scoped Manifold ContDiff Topology

namespace FirstOrderTwistor

/-- A cap neighborhood containing the entire middle sphere contains a two-sided
strip of a single positive width. The chart only needs to be continuous on its open domain. -/
theorem signedCollar_inside_capNeighborhood {A S : Type*} [TopologicalSpace A] [CompactSpace A]
    [TopologicalSpace S] {chart : ℝ × A → S} {domain : Set (ℝ × A)} {U : Set S}
    (hDom : IsOpen domain) (hChart : ContinuousOn chart domain) (hOpen : IsOpen U)
    (hSeam : ∀ angle : A, (0, angle) ∈ domain ∧ chart (0, angle) ∈ U) :
    ∃ width : ℝ, 0 < width ∧ ∀ (t : ℝ) (angle : A), |t| < width →
      (t, angle) ∈ domain ∧ chart (t, angle) ∈ U := by
  obtain ⟨u, v, hu, _, hZero, hv, huv⟩ := generalized_tube_lemma
    (isCompact_singleton (x := (0 : ℝ))) (isCompact_univ (X := A))
    (hChart.isOpen_inter_preimage hDom hOpen) (by
      rintro ⟨t, angle⟩ ⟨ht, _⟩
      have ht' : t = 0 := ht
      simpa [ht'] using hSeam angle)
  obtain ⟨w, hw, hwu⟩ := Metric.mem_nhds_iff.mp (hu.mem_nhds (hZero (mem_singleton _)))
  exact ⟨w, hw, fun t angle ht => huv ⟨hwu (by simpa [Metric.mem_ball, Real.dist_eq] using ht),
    hv (mem_univ angle)⟩⟩

variable {E F G L H K Hs Hv M X S V A : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
  [NormedAddCommGroup G] [NormedSpace ℝ G] [NormedAddCommGroup L] [NormedSpace ℝ L]
  [TopologicalSpace H] [TopologicalSpace K] [TopologicalSpace Hs] [TopologicalSpace Hv]
  {I : ModelWithCorners ℝ E H} {J : ModelWithCorners ℝ F K}
  {IS : ModelWithCorners ℝ G Hs} {IV : ModelWithCorners ℝ L Hv}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [TopologicalSpace X] [ChartedSpace K X] [IsManifold J ∞ X]
  [TopologicalSpace S] [ChartedSpace Hs S] [TopologicalSpace V] [ChartedSpace Hv V]
  [TopologicalSpace A]

/-- The corrected recognition of the specified exterior agrees with the cap
marking on U. The common signed coordinate takes values in U. The resulting oriented
map on the original manifold restricts to the exact core inverse and to the
composition through the recognized sphere on the exterior. -/
theorem originalTypeOfRecognizedExterior
    (oM : ManifoldOrientation I M 4) (oX : ManifoldOrientation J X 4)
    (core : PartialDiffeomorph I J M X ∞) (retained : PartialDiffeomorph I IV M V ∞)
    (r : V ≃ₘ⟮IV, IS⟯ S) (ball : PartialDiffeomorph IS J S X ∞)
    (mark : PartialDiffeomorph IS IV S V ∞) {U : Set S}
    (hr : EqOn r.symm mark U) (src : OpenPartialHomeomorph A M)
    (dst : OpenPartialHomeomorph A X) (sphere : A → S)
    (hU : MapsTo sphere src.source U)
    (hMark : EqOn (fun z => retained (src z)) (fun z => mark (sphere z)) src.source)
    (hDomain : src.source = dst.source)
    (hCover : core.source ∪ (exteriorPatchOfRecognition retained r ball).source = univ)
    (hCover' : core.target ∪ (exteriorPatchOfRecognition retained r ball).target = univ)
    (hOverlap : src.target = core.source ∩ (exteriorPatchOfRecognition retained r ball).source)
    (hOverlap' : dst.target = core.target ∩ (exteriorPatchOfRecognition retained r ball).target)
    (hCore : EqOn (fun z => core (src z)) dst src.source)
    (hBall : EqOn (fun z => ball (sphere z)) dst src.source)
    (hOrCore : PreservesPatchOrientation core.toOpenPartialHomeomorph oM oX)
    (hOrExt : PreservesPatchOrientation
      (exteriorPatchOfRecognition retained r ball).toOpenPartialHomeomorph oM oX) :
    ∃ Φ : M ≃ₘ⟮I, J⟯ X, Φ.preservesOrientation oM oX ∧ EqOn Φ core core.source ∧
      EqOn Φ (fun p => ball (r (retained p))) (exteriorPatchOfRecognition retained r ball).source := by
  have hRec : EqOn (fun z => r (retained (src z))) sphere src.source := by
    intro z hz
    calc
      r (retained (src z)) = r (mark (sphere z)) := congrArg r (hMark hz)
      _ = r (r.symm (sphere z)) := congrArg r (hr (hU hz)).symm
      _ = sphere z := r.apply_symm_apply _
  let patches := SmoothCutGluing.ofRecognizedExterior retained r ball src dst sphere core
    hDomain hCover hCover' hOverlap hOverlap' hCore hRec hBall
  exact ⟨patches.toDiffeomorph, patches.toDiffeomorph_preservesOrientation hOrCore hOrExt,
    patches.toDiffeomorph_eq_core, patches.toDiffeomorph_eq_exterior⟩

end FirstOrderTwistor
