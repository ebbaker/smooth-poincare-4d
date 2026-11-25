import DifferentialGeometry.Geometry.Metric.Comparison.PartialDiffeomorphCurves
import FirstOrderTwistor.CurvatureCompressionBound
import DifferentialGeometry.Geometry.Metric.Distance.Boundary
import DifferentialGeometry.Geometry.Measure.Area.ManifoldEuclidean
import DifferentialGeometry.Topology.SphereSeparation.ComplementPair
import DifferentialGeometry.Topology.VanKampen.TwoSidedCollarSeparation
import Mathlib.Analysis.Normed.Module.Ball.RadialEquiv
import Mathlib.Order.Interval.Set.IsoIoo
import SmoothPoincare.PhysicalScales.MetricQuantiles

/-!
# Physical ball protection and side placement in a supplied anchored chart

The estimates use the Riemannian length distance of the source metric. The
closed bands are actual images inside one chart. Only subsegments proved to
remain in such a band are compared with coordinate lengths.
-/

open DifferentialGeometry DifferentialGeometry.Geometry DifferentialGeometry.Geometry.Riemannian
open DifferentialGeometry.Integral.Measure FirstOrderTwistor MeasureTheory SectionsAndConnections
open DifferentialGeometry.Topology.SphereSeparation
open Set
open scoped ContDiff ENNReal Manifold Topology

namespace SmoothPoincare

abbrev ShellCoordinates := EuclideanSpace ℝ (Fin 4)

/-- Coordinate annulus with open radial bounds. -/
def openRadialBand (u v : ℝ) : Set ShellCoordinates := {z | u < ‖z‖ ∧ ‖z‖ < v}
/-- Coordinate annulus with closed radial bounds. -/
def closedRadialBand (u v : ℝ) : Set ShellCoordinates := {z | u ≤ ‖z‖ ∧ ‖z‖ ≤ v}

variable {M : Type*} [TopologicalSpace M] [ChartedSpace ShellCoordinates M]
  [IsManifold (𝓡 4) ∞ M] [T2Space M]

/-- One radial sphere in the source of the actual annular chart. -/
def anchoredSphere (F : ShellCoordinates → M) (r : ℝ) : Set M := F '' {z | ‖z‖ = r}

/-- The image of a closed radial band in the actual annular chart. -/
def anchoredBand (F : ShellCoordinates → M) (u v : ℝ) : Set M := F '' closedRadialBand u v

private theorem isCompact_closedRadialBand (u v : ℝ) : IsCompact (closedRadialBand u v) := by
  have hEq : closedRadialBand u v = Metric.closedBall 0 v ∩ {z : ShellCoordinates | u ≤ ‖z‖} := by
    ext z
    simp only [closedRadialBand, mem_ofPred_eq, mem_inter_iff, Metric.mem_closedBall, dist_zero_right]
    exact and_comm
  rw [hEq]
  exact (isCompact_closedBall _ _).inter_right (isClosed_le continuous_const continuous_norm)

private theorem closedRadialBand_subset_openRadialBand {u v u' v' : ℝ} (hu : u' < u) (hv : v < v') :
    closedRadialBand u v ⊆ openRadialBand u' v' := fun _ hz => ⟨hu.trans_le hz.1, hz.2.trans_lt hv⟩

variable (F : PartialDiffeomorph (𝓡 4) (𝓡 4) ShellCoordinates M ∞)

omit [IsManifold (𝓡 4) ∞ M] in
private theorem anchoredBand_isClosed {u v : ℝ} (hsource : closedRadialBand u v ⊆ F.source) :
    IsClosed (anchoredBand (F : ShellCoordinates → M) u v) :=
  ((isCompact_closedRadialBand u v).image_of_continuousOn
    (F.contMDiffOn_toFun.continuousOn.mono hsource)).isClosed

omit [IsManifold (𝓡 4) ∞ M] [T2Space M] in
private theorem image_openRadialBand_subset_interior {u v : ℝ}
    (hsource : closedRadialBand u v ⊆ F.source) :
    (F : ShellCoordinates → M) '' openRadialBand u v ⊆
      interior (anchoredBand (F : ShellCoordinates → M) u v) := by
  have hsub : openRadialBand u v ⊆ closedRadialBand u v := fun _ hz => ⟨hz.1.le, hz.2.le⟩
  have hopen : IsOpen (openRadialBand u v) :=
    (isOpen_lt continuous_const continuous_norm).inter (isOpen_lt continuous_norm continuous_const)
  exact interior_maximal (image_mono hsub)
    (F.toOpenPartialHomeomorph.isOpen_image_of_subset_source hopen (hsub.trans hsource))

omit [IsManifold (𝓡 4) ∞ M] in
/-- The frontier of a closed embedded band lies in the two actual face images. -/
theorem frontier_anchoredBand_subset_faces {u v : ℝ}
    (hsource : closedRadialBand u v ⊆ F.source) :
    frontier (anchoredBand (F : ShellCoordinates → M) u v) ⊆
      anchoredSphere (F : ShellCoordinates → M) u ∪ anchoredSphere (F : ShellCoordinates → M) v := by
  intro x hx
  have hxClosed := frontier_subset_closure hx
  rw [(anchoredBand_isClosed F hsource).closure_eq] at hxClosed
  obtain ⟨z, hz, rfl⟩ := hxClosed
  by_cases hu : ‖z‖ = u
  · exact Or.inl ⟨z, hu, rfl⟩
  by_cases hv : ‖z‖ = v
  · exact Or.inr ⟨z, hv, rfl⟩
  exact False.elim (hx.2 (image_openRadialBand_subset_interior F hsource
    ⟨z, ⟨lt_of_le_of_ne hz.1 (fun h => hu h.symm), lt_of_le_of_ne hz.2 hv⟩, rfl⟩))

omit [T2Space M] in
private theorem coord_norm_diff_le_length
    (g : SmoothRiemannianMetric (𝓡 4) M) {K : Set ShellCoordinates} (hK : K ⊆ F.source)
    {C : ℝ} (hC : 0 ≤ C)
    (hlower : ∀ z ∈ K, ∀ w : TangentSpace (𝓡 4) z,
      (standardEuclideanMetric ShellCoordinates).inner z w w ≤ C ^ 2 * g.inner (F z)
        (mfderiv (𝓡 4) (𝓡 4) (F : ShellCoordinates → M) z w)
        (mfderiv (𝓡 4) (𝓡 4) (F : ShellCoordinates → M) z w))
    {γ : ℝ → M} {s t : ℝ} (hst : s ≤ t)
    (hγ : ContMDiffOn 𝓘(ℝ) (𝓡 4) 1 γ (Icc s t))
    (hmem : MapsTo γ (Icc s t) ((F : ShellCoordinates → M) '' K)) :
    ENNReal.ofReal |‖F.symm (γ s)‖ - ‖F.symm (γ t)‖| ≤
      ENNReal.ofReal C * metricPathELength g γ s t := by
  let flat := standardEuclideanMetric ShellCoordinates
  have htarget : MapsTo γ (Icc s t) F.target := by
    intro u hu
    obtain ⟨z, hz, hzmap⟩ := hmem hu
    rw [← hzmap]
    exact F.map_source (hK hz)
  have hcoord : ContMDiffOn 𝓘(ℝ) (𝓡 4) 1 ((F.symm : M → ShellCoordinates) ∘ γ) (Icc s t) :=
    (F.symm.contMDiffOn_toFun.of_le (by simp)).comp hγ htarget
  have hUpper := PartialDiffeomorph.metric_upper_symm_of_metric_lower F flat g hK hlower
  have hlength := PDE.RicciFlow.Perelman.KappaSolutions.metricPathELength_comp_le
    g flat F.symm hC hγ (fun u hu => htarget hu)
    (fun u hu => hUpper (γ u) (hmem ⟨hu.1.le, hu.2.le⟩))
  have hdist := edistOf_le_metricPathELength flat hst hcoord
  change riemannianEDistOf flat (F.symm (γ s)) (F.symm (γ t)) ≤ _ at hdist
  rw [riemannianEDistOf_standardEuclideanMetric, edist_dist] at hdist
  exact (ENNReal.ofReal_le_ofReal (abs_norm_sub_norm_le _ _)).trans (hdist.trans hlength)

/-- A point buffered from both coordinate faces has a whole physical ball
inside the closed embedded band, even if ambient paths can leave the chart. -/
theorem physicalBall_subset_anchoredBand_of_face_margin
    (g : SmoothRiemannianMetric (𝓡 4) M) {u v : ℝ}
    (hsource : closedRadialBand u v ⊆ F.source)
    {C : ℝ} (hC : 0 < C)
    (hlower : ∀ z ∈ closedRadialBand u v, ∀ w : TangentSpace (𝓡 4) z,
      (standardEuclideanMetric ShellCoordinates).inner z w w ≤ C ^ 2 * g.inner (F z)
        (mfderiv (𝓡 4) (𝓡 4) (F : ShellCoordinates → M) z w)
        (mfderiv (𝓡 4) (𝓡 4) (F : ShellCoordinates → M) z w))
    {z : ShellCoordinates} {δ : ℝ} (hδ : 0 < δ)
    (hz₁ : u + δ ≤ ‖z‖) (hz₂ : ‖z‖ + δ ≤ v) :
    riemannianBallOf g (F z) (δ / C) ⊆ anchoredBand (F : ShellCoordinates → M) u v := by
  have hz : z ∈ openRadialBand u v := ⟨by linarith, by linarith⟩
  have hzsource : z ∈ F.source := hsource ⟨hz.1.le, hz.2.le⟩
  intro y hy
  by_contra! hyK
  obtain ⟨γ, hγ0, hγ1, hγ, hlen⟩ := exists_lt_of_edistOf_lt g hy
  obtain ⟨t, ht, hstay, hfront⟩ := exists_first_exit_frontier
    (anchoredBand_isClosed F hsource) zero_lt_one hγ.continuousOn
    (hγ0 ▸ image_openRadialBand_subset_interior F hsource ⟨z, hz, rfl⟩) (hγ1 ▸ hyK)
  have hnorm := coord_norm_diff_le_length F g hsource hC.le hlower ht.1.le
    (hγ.mono (Icc_subset_Icc le_rfl ht.2)) hstay
  have hstart : F.symm (γ 0) = z := hγ0.symm ▸ F.left_inv hzsource
  have hgap : δ ≤ |‖z‖ - ‖F.symm (γ t)‖| := by
    rcases frontier_anchoredBand_subset_faces F hsource hfront with h | h
    · obtain ⟨w, hw, hFw⟩ := h
      have hCoord : F.symm (γ t) = w := hFw ▸ F.left_inv (hsource
        ⟨hw.ge, hw.le.trans (hz.1.trans hz.2).le⟩)
      rw [hCoord, show ‖w‖ = u from hw]
      rw [abs_of_nonneg (sub_nonneg.mpr hz.1.le)]
      linarith
    · obtain ⟨w, hw, hFw⟩ := h
      have hCoord : F.symm (γ t) = w := hFw ▸ F.left_inv (hsource
        ⟨(hz.1.trans hz.2).le.trans hw.ge, hw.le⟩)
      rw [hCoord, show ‖w‖ = v from hw]
      rw [abs_of_nonpos (sub_nonpos.mpr hz.2.le)]
      linarith
  rw [hstart] at hnorm
  have hcompar : ENNReal.ofReal C * metricPathELength g γ 0 t <
      ENNReal.ofReal δ := by
    calc
      _ ≤ ENNReal.ofReal C * metricPathELength g γ 0 1 :=
        mul_le_mul_right (metricPathELength_mono g γ le_rfl ht.2) _
      _ < ENNReal.ofReal C * ENNReal.ofReal (δ / C) :=
        ENNReal.mul_lt_mul_right (ENNReal.ofReal_ne_zero_iff.mpr hC) ENNReal.ofReal_ne_top hlen
      _ = _ := by rw [← ENNReal.ofReal_mul hC.le, mul_div_cancel₀ _ hC.ne']
  exact (not_lt_of_ge ((ENNReal.ofReal_le_ofReal hgap).trans hnorm)) hcompar

omit [ChartedSpace ShellCoordinates M] [IsManifold (𝓡 4) ∞ M] [T2Space M] in
private theorem frontier_right_subset_sphere {S : Set M} (side : ComplementPair S) :
    frontier side.right ⊆ S := by
  intro z hz
  by_contra! hn
  have hcomp : z ∈ side.left ∪ side.right := by simpa [side.union_eq_compl] using hn
  rcases hcomp with hl | hr
  · exact Set.disjoint_left.mp (side.disjoint.closure_right side.isOpen_left)
      hl (frontier_subset_closure hz)
  · exact hz.2 (side.isOpen_right.interior_eq.symm ▸ hr)

/-- A short path from an exterior point to the middle sphere cannot start on
the outward side. Its actual subpath after the last entry into the closed
band would have to cross the wide outer radial gap. -/
theorem anchoredPoint_mem_inner_of_short_anchor
    (g : SmoothRiemannianMetric (𝓡 4) M) {u v : ℝ} (hu : u < 1) (hv : 1 < v)
    (hsource : closedRadialBand u v ⊆ F.source) {C : ℝ} (hC : 0 < C)
    (hlower : ∀ z ∈ closedRadialBand u v, ∀ w : TangentSpace (𝓡 4) z,
      (standardEuclideanMetric ShellCoordinates).inner z w w ≤ C ^ 2 * g.inner (F z)
        (mfderiv (𝓡 4) (𝓡 4) (F : ShellCoordinates → M) z w)
        (mfderiv (𝓡 4) (𝓡 4) (F : ShellCoordinates → M) z w))
    (side : ComplementPair (anchoredSphere (F : ShellCoordinates → M) 1))
    (hInnerFace : anchoredSphere (F : ShellCoordinates → M) u ⊆ side.left)
    {x y : M} (hx : x ∉ anchoredBand (F : ShellCoordinates → M) u v)
    (hy : y ∈ anchoredSphere (F : ShellCoordinates → M) 1)
    (hAnchor : riemannianEDistOf g x y < ENNReal.ofReal ((v - 1) / C)) :
    x ∈ side.left := by
  have hmid : anchoredSphere (F : ShellCoordinates → M) 1 ⊆
      interior (anchoredBand (F : ShellCoordinates → M) u v) := by
    rintro z ⟨w, hw, rfl⟩
    have hwOpen : w ∈ openRadialBand u v := ⟨hw ▸ hu, hw ▸ hv⟩
    exact image_openRadialBand_subset_interior F hsource ⟨w, hwOpen, rfl⟩
  have hxcomp : x ∈ side.left ∪ side.right := by
    rw [side.union_eq_compl]
    exact fun hxS => hx (interior_subset (hmid hxS))
  rcases hxcomp with hLeft | hRight
  · exact hLeft
  exfalso
  obtain ⟨γ, hγ0, hγ1, hγ, hlen⟩ := exists_lt_of_edistOf_lt g hAnchor
  have hStart : γ 0 ∈ interior side.right :=
    hγ0 ▸ (side.isOpen_right.interior_eq.symm ▸ hRight)
  have hEnd : γ 1 ∉ interior side.right := by
    rw [side.isOpen_right.interior_eq, hγ1]
    exact fun hr => side.right_subset_compl hr hy
  obtain ⟨t, ht, hBefore, hFront⟩ :=
    exists_first_exit_frontier_of_not_mem_interior zero_lt_one hγ.continuousOn hStart hEnd
  have hγt := frontier_right_subset_sphere side hFront
  have hnot : ¬ MapsTo γ (Icc 0 t) (anchoredBand (F : ShellCoordinates → M) u v) := by
    intro h
    exact hx (hγ0 ▸ h ⟨le_rfl, ht.1.le⟩)
  obtain ⟨s, hs, hstay, hsFront⟩ := exists_last_entry_frontier_Icc_of_not_mapsTo
    (anchoredBand_isClosed F hsource) (hγ.continuousOn.mono (Icc_subset_Icc le_rfl ht.2))
    (hmid hγt) hnot
  have hsRight : γ s ∈ side.right := interior_subset (hBefore s ⟨hs.1.le, hs.2⟩)
  rcases frontier_anchoredBand_subset_faces F hsource hsFront with hWrong | hOuter
  · exact Set.disjoint_left.mp side.disjoint (hInnerFace hWrong) hsRight
  obtain ⟨z, hz, hzmap⟩ := hOuter
  obtain ⟨w, hw, hwmap⟩ := hγt
  have hsCoord : F.symm (γ s) = z := hzmap ▸ F.left_inv (hsource
    ⟨(hu.trans hv).le.trans hz.ge, hz.le⟩)
  have htCoord : F.symm (γ t) = w := hwmap ▸ F.left_inv (hsource
    ⟨hu.le.trans hw.ge, hw.le.trans hv.le⟩)
  have hsegment := coord_norm_diff_le_length F g hsource hC.le hlower hs.2.le
    (hγ.mono (Icc_subset_Icc hs.1.le ht.2)) hstay
  rw [hsCoord, htCoord, hz, hw, abs_of_nonneg (sub_nonneg.mpr hv.le)] at hsegment
  have hshort : ENNReal.ofReal C * metricPathELength g γ s t < ENNReal.ofReal (v - 1) := by
    calc
      _ ≤ ENNReal.ofReal C * metricPathELength g γ 0 1 :=
        mul_le_mul_right (metricPathELength_mono g γ hs.1.le ht.2) _
      _ < ENNReal.ofReal C * ENNReal.ofReal ((v - 1) / C) :=
        ENNReal.mul_lt_mul_right (ENNReal.ofReal_ne_zero_iff.mpr hC) ENNReal.ofReal_ne_top hlen
      _ = _ := by rw [← ENNReal.ofReal_mul hC.le, mul_div_cancel₀ _ hC.ne']
  exact (not_lt_of_ge hsegment) hshort

/-- A charged ball whose diameter is smaller than the two buffers cannot
meet the protected radial band if the whole larger band has less mass. -/
theorem disjoint_anchoredBand_of_ballMass_obstacle
    [MeasurableSpace M] (g : SmoothRiemannianMetric (𝓡 4) M)
    (chiral : Measure M) [IsFiniteMeasure chiral] {u v u' v' δ a C : ℝ}
    (hsource : closedRadialBand u v ⊆ F.source) (hC : 0 < C)
    (hlower : ∀ z ∈ closedRadialBand u v, ∀ w : TangentSpace (𝓡 4) z,
      (standardEuclideanMetric ShellCoordinates).inner z w w ≤ C ^ 2 * g.inner (F z)
        (mfderiv (𝓡 4) (𝓡 4) (F : ShellCoordinates → M) z w)
        (mfderiv (𝓡 4) (𝓡 4) (F : ShellCoordinates → M) z w))
    (hδ : 0 < δ) (hu : u + δ ≤ u') (hv : v' + δ ≤ v)
    {x : M} (ha : 0 < a) (hdiam : 2 * a ≤ δ / C)
    (hmass : chiral.real (anchoredBand (F : ShellCoordinates → M) u v) <
      chiral.real (riemannianBallOf g x a)) :
    Disjoint (riemannianBallOf g x a) (anchoredBand (F : ShellCoordinates → M) u' v') := by
  rw [Set.disjoint_left]
  rintro p hp ⟨z, hz, rfl⟩
  have hball : riemannianBallOf g x a ⊆ riemannianBallOf g (F z) (δ / C) := by
    intro y hy
    change riemannianEDistOf g (F z) y < ENNReal.ofReal (δ / C)
    change riemannianEDistOf g x (F z) < ENNReal.ofReal a at hp
    change riemannianEDistOf g x y < ENNReal.ofReal a at hy
    calc
      _ ≤ riemannianEDistOf g (F z) x + riemannianEDistOf g x y :=
        riemannianEDistOf_triangle g (F z) x y
      _ < ENNReal.ofReal a + ENNReal.ofReal a := by
        rw [riemannianEDistOf_comm g (F z) x]
        exact ENNReal.add_lt_add hp hy
      _ = ENNReal.ofReal (2 * a) := by rw [← ENNReal.ofReal_add ha.le ha.le, two_mul]
      _ ≤ _ := ENNReal.ofReal_le_ofReal hdiam
  have hcap := physicalBall_subset_anchoredBand_of_face_margin F g hsource hC hlower hδ
    (hu.trans hz.1) ((add_le_add_left hz.2 δ).trans hv)
  exact (not_lt_of_ge (measureReal_mono (hball.trans hcap))) hmass

omit [T2Space M] in
private theorem ball_subset_inner_side
    (g : SmoothRiemannianMetric (𝓡 4) M) {S : Set M} (side : ComplementPair S)
    {z : M} (hz : z ∈ side.left) {r : ℝ}
    (hfront : ∀ p ∈ S, ENNReal.ofReal r ≤ riemannianEDistOf g z p) :
    riemannianBallOf g z r ⊆ side.left := by
  have hball := Geometry.Metric.riemannianEDistOf_ball_subset_of_le_frontier_distance g
    (A := side.left) (side.isOpen_left.interior_eq.symm ▸ hz)
    (fun p hp => hfront p (frontier_right_subset_sphere side.swap hp))
  simpa only [riemannianBallOf, side.isOpen_left.interior_eq] using hball

private noncomputable def radialOrderIso (u v : ℝ) (huv : u < v) : ℝ ≃o Ioo u v := by
  let c := (v - u) / 2
  let m := (u + v) / 2
  have hc : 0 < c := by dsimp [c]; linarith
  let affine : Ioo (-1 : ℝ) 1 ≃o Ioo u v :=
    { toFun := fun t => ⟨m + c * (t : ℝ), by
        have ht := t.property
        dsimp only [m, c]
        constructor <;> nlinarith [ht.1, ht.2, mul_pos (sub_pos.mpr huv) (show 0 < (t : ℝ) + 1 by linarith [ht.1]),
          mul_pos (sub_pos.mpr huv) (show 0 < 1 - (t : ℝ) by linarith [ht.2])]⟩
      invFun := fun r => ⟨((r : ℝ) - m) / c, by
        have hr := r.property
        exact ⟨(lt_div_iff₀ hc).2 (by dsimp [m, c]; linarith [hr.1]),
          (div_lt_iff₀ hc).2 (by dsimp [m, c]; linarith [hr.2])⟩⟩
      left_inv := fun t => Subtype.ext (by
        change (m + c * (t : ℝ) - m) / c = (t : ℝ)
        exact (div_eq_iff hc.ne').2 (by ring))
      right_inv := fun r => Subtype.ext (by
        change m + c * (((r : ℝ) - m) / c) = (r : ℝ)
        rw [mul_div_cancel₀ _ hc.ne']
        ring)
      map_rel_iff' := by
        intro s t
        change m + c * (s : ℝ) ≤ m + c * (t : ℝ) ↔ (s : ℝ) ≤ (t : ℝ)
        rw [add_le_add_iff_left, mul_le_mul_iff_right₀ hc] }
  exact (orderIsoIooNegOneOne ℝ).trans affine

omit [IsManifold (𝓡 4) ∞ M] in
/-- The radial halves are the two actual components of the middle sphere on
an ambient simply connected manifold. The labels come from the same chart. -/
theorem exists_anchoredSphere_radialSides [SimplyConnectedSpace M]
    {u v : ℝ} (hu₀ : 0 ≤ u) (hu : u < 1) (hv : 1 < v)
    (hsource : openRadialBand u v ⊆ F.source) :
    ∃ side : ComplementPair (anchoredSphere (F : ShellCoordinates → M) 1),
      (∀ z ∈ openRadialBand u v, ‖z‖ < 1 → F z ∈ side.left) ∧
      (∀ z ∈ openRadialBand u v, 1 < ‖z‖ → F z ∈ side.right) := by
  let _ : LocallyPathConnectedSpace M := ChartedSpace.locallyPathConnectedSpace ShellCoordinates M
  let UnitSphere := Metric.sphere (0 : ShellCoordinates) 1
  have hSphereConn : IsConnected UnitSphere := isConnected_sphere
    (Module.one_lt_rank_of_one_lt_finrank (by simp [ShellCoordinates])) 0 zero_le_one
  let _ : ConnectedSpace UnitSphere := isConnected_iff_connectedSpace.mp hSphereConn
  let e := radialOrderIso u v (hu.trans hv)
  let t₀ := e.symm ⟨1, hu, hv⟩
  let shifted t := e (t + t₀)
  have hzero : shifted 0 = (⟨1, hu, hv⟩ : Ioo u v) := by simp [shifted, t₀]
  let posIncludes : Ioo u v → Ioi (0 : ℝ) := inclusion (fun _ ht => hu₀.trans_lt ht.1)
  have hInc : Topology.IsOpenEmbedding posIncludes :=
    Topology.IsOpenEmbedding.inclusion _ (isOpen_Ioo.preimage continuous_subtype_val)
  have hShift : Topology.IsOpenEmbedding shifted :=
    e.toHomeomorph.isOpenEmbedding.comp (Homeomorph.addRight t₀).isOpenEmbedding
  let polar := fun p : UnitSphere × ℝ => ((shifted p.2 : Ioo u v) : ℝ) • (p.1 : ShellCoordinates)
  have hPolar : Topology.IsOpenEmbedding polar := by
    let h := homeomorphUnitSphereProd ShellCoordinates
    have hm := (isOpen_compl_singleton : IsOpen ({0}ᶜ : Set ShellCoordinates))
    exact hm.isOpenEmbedding_subtypeVal.comp (h.symm.isOpenEmbedding.comp
      ((Topology.IsOpenEmbedding.id (X := UnitSphere)).prodMap (hInc.comp hShift)))
  have hPolarNorm (p : UnitSphere × ℝ) : ‖polar p‖ = (shifted p.2 : ℝ) := by
    have hs : ‖(p.1 : ShellCoordinates)‖ = 1 := by simpa only [UnitSphere, Metric.mem_sphere, dist_zero_right, mem_ofPred_eq] using p.1.property
    simp [polar, norm_smul, hs, abs_of_pos (hu₀.trans_lt (shifted p.2).2.1)]
  have hPolarSource (p : UnitSphere × ℝ) : polar p ∈ F.source := by
    apply hsource
    change u < ‖polar p‖ ∧ ‖polar p‖ < v
    rw [hPolarNorm]
    exact (shifted p.2).property
  let lifted := fun p : UnitSphere × ℝ => (⟨polar p, hPolarSource p⟩ : F.source)
  have hLift : Topology.IsOpenEmbedding lifted :=
    Topology.IsOpenEmbedding.of_comp lifted F.open_source.isOpenEmbedding_subtypeVal hPolar
  let eSphere := fun s : UnitSphere => F (s : ShellCoordinates)
  let collar : DifferentialGeometry.Topology.ThreeManifold.TwoSidedCollar eSphere :=
    { toFun := fun p => F (polar p)
      isOpenEmbedding_toFun := F.toOpenPartialHomeomorph.isOpenEmbedding_restrict.comp hLift
      zero_eq := by intro s; simp [polar, eSphere, hzero] }
  have hRange : range eSphere = anchoredSphere (F : ShellCoordinates → M) 1 := by
    ext p
    constructor
    · rintro ⟨s, rfl⟩
      exact ⟨(s : ShellCoordinates), by simpa only [UnitSphere, Metric.mem_sphere, dist_zero_right, mem_ofPred_eq] using s.property, rfl⟩
    · rintro ⟨z, hz, rfl⟩
      exact ⟨⟨z, by simpa only [UnitSphere, Metric.mem_sphere, dist_zero_right, mem_ofPred_eq] using hz⟩, rfl⟩
  have hRepresent (z : ShellCoordinates) (hz : z ∈ openRadialBand u v) :
      ∃ (s : UnitSphere) (t : ℝ), polar (s, t) = z ∧ (shifted t : ℝ) = ‖z‖ := by
    have hz₀ : z ≠ 0 := norm_pos_iff.mp (hu₀.trans_lt hz.1)
    let polarHomeomorph := homeomorphUnitSphereProd ShellCoordinates
    let pair := polarHomeomorph (⟨z, hz₀⟩ : ({0}ᶜ : Set ShellCoordinates))
    let t := e.symm ⟨‖z‖, hz.1, hz.2⟩ - t₀
    have ht : shifted t = (⟨‖z‖, hz.1, hz.2⟩ : Ioo u v) := by simp [shifted, t]
    have heq : (pair.2 : ℝ) = ‖z‖ := homeomorphUnitSphereProd_apply_snd_coe _ _
    refine ⟨pair.1, t, ?_, congrArg Subtype.val ht⟩
    have hback := congrArg Subtype.val (polarHomeomorph.symm_apply_apply
      (⟨z, hz₀⟩ : ({0}ᶜ : Set ShellCoordinates)))
    change (pair.2 : ℝ) • (pair.1 : ShellCoordinates) = z at hback
    simpa only [polar, ht, heq] using hback
  have hmono : StrictMono (fun t : ℝ => (shifted t : ℝ)) :=
    fun _ _ hst => e.strictMono (add_lt_add_left hst t₀)
  refine ⟨{ left := collar.negativeSide, right := collar.positiveSide
            isOpen_left := collar.isOpen_negativeSide, isOpen_right := collar.isOpen_positiveSide
            isConnected_left := isConnected_connectedComponent.image _ continuous_subtype_val.continuousOn
            isConnected_right := isConnected_connectedComponent.image _ continuous_subtype_val.continuousOn
            disjoint := collar.disjoint_negativeSide_positiveSide
            union_eq_compl := by rw [← hRange]; exact collar.complement_eq_negativeSide_union_positiveSide.symm }, ?_, ?_⟩
  · intro z hz hinner
    obtain ⟨s, t, hzs, ht⟩ := hRepresent z hz
    have hneg : t < 0 := hmono.lt_iff_lt.mp (by rw [ht, hzero]; exact hinner)
    simpa only [collar, hzs] using collar.toFun_mem_negativeSide_of_neg s hneg
  · intro z hz houter
    obtain ⟨s, t, hzs, ht⟩ := hRepresent z hz
    have hpos : 0 < t := hmono.lt_iff_lt.mp (by rw [ht, hzero]; exact houter)
    simpa only [collar, hzs] using collar.toFun_mem_positiveSide_of_pos s hpos

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

section PhysicalMeasure

variable [CompactSpace M]

/-- The physical chiral measure is dominated by the physical full-tensor
curvature measure. The factor-one estimate suffices for chart exclusion. -/
theorem geometricChiralMeasure_real_le_metricFullCurvatureMeasure
    (g : SmoothRiemannianMetric (𝓡 4) M) (o : ManifoldOrientation (𝓡 4) M 4)
    (frame : ∀ x, OrientedOrthonormalFrameAt g o x) {s : Set M} (hs : MeasurableSet s)
    (hChiral : Integrable (fun x => hilbertSchmidtSq (geometricChiralBlock g o x (frame x)))
      (riemannianVolumeMeasure (𝓡 4) M g))
    (hFull : IntegrableOn (fun x => frameTensorNormSq (metricCurvatureFrameTensor g o x (frame x)))
      s (riemannianVolumeMeasure (𝓡 4) M g)) :
    (geometricChiralMeasure o g frame).real s ≤ (metricFullCurvatureMeasure g o frame).real s := by
  rw [geometricChiralMeasure_real_eq_setIntegral o g frame hChiral hs,
    metricFullCurvatureMeasure_real_eq_setIntegral g o frame hs hFull]
  exact setIntegral_mono_on hChiral.integrableOn hFull hs
    (fun x _ => hilbertSchmidtSq_traceFreeSelfDualBlock_le_frameTensorNormSq _)

/-- At a fixed source index the wide volume test, the small-ball lower volume
test, and the single short anchor assign the two complete marks to the two
actual components. The chart obstacle protects the whole closed trim. -/
theorem anchoredShell_places_charged_sets
    (g : SmoothRiemannianMetric (𝓡 4) M) (o : ManifoldOrientation (𝓡 4) M 4)
    (frame : ∀ x, OrientedOrthonormalFrameAt g o x)
    [IsFiniteMeasure (riemannianVolumeMeasure (𝓡 4) M g)]
    {L C A D R V a b : ℝ} (hL : 8 < L) (hC : 0 < C) (ha : 0 < a)
    (hA : 0 ≤ A) (hD : 0 ≤ D) (hR : 0 < R)
    (hsource : closedRadialBand (3 / 16) (3 * L / 4) ⊆ F.source)
    (hlower : ∀ z ∈ closedRadialBand (3 / 16) (3 * L / 4),
      ∀ w : TangentSpace (𝓡 4) z,
      (standardEuclideanMetric ShellCoordinates).inner z w w ≤ C ^ 2 * g.inner (F z)
        (mfderiv (𝓡 4) (𝓡 4) (F : ShellCoordinates → M) z w)
        (mfderiv (𝓡 4) (𝓡 4) (F : ShellCoordinates → M) z w))
    (hdiam : 2 * a ≤ (1 / 16) / C)
    (side : ComplementPair (anchoredSphere (F : ShellCoordinates → M) 1))
    (hInnerFace : anchoredSphere (F : ShellCoordinates → M) (1 / 4) ⊆ side.left)
    (hOuter : (F : ShellCoordinates → M) '' openRadialBand 2 (L / 2) ⊆ side.right)
    {x y : M} (hy : y ∈ anchoredSphere (F : ShellCoordinates → M) 1)
    (hAnchor : riemannianEDistOf g x y ≤ ENNReal.ofReal A)
    (hWidth : A < (L / 2 - 1) / C)
    (hTravel : ∀ p ∈ anchoredBand (F : ShellCoordinates → M) (1 / 4) 4,
      riemannianEDistOf g y p ≤ ENNReal.ofReal D)
    (hFar : A + D + R < b)
    (hChiral : Integrable (fun z => hilbertSchmidtSq (geometricChiralBlock g o z (frame z)))
      (riemannianVolumeMeasure (𝓡 4) M g))
    (hFull : IntegrableOn (fun z => frameTensorNormSq (metricCurvatureFrameTensor g o z (frame z)))
      (anchoredBand (F : ShellCoordinates → M) (3 / 16) (3 * L / 4))
      (riemannianVolumeMeasure (𝓡 4) M g)) :
    let vol := riemannianVolumeMeasure (𝓡 4) M g
    let chiral := geometricChiralMeasure o g frame
    let full := metricFullCurvatureMeasure g o frame
    let trim := anchoredBand (F : ShellCoordinates → M) (1 / 4) 4
    vol.real univ ≤ 1 →
    (vol.real side.left ≤ 1 / 2 → vol.real side.left ≤ V) →
    (vol.real side.right ≤ 1 / 2 → vol.real side.right ≤ V) →
    V < vol.real ((F : ShellCoordinates → M) '' openRadialBand 2 (L / 2)) →
    (∀ p, V < vol.real (riemannianBallOf g p R)) →
    full.real (anchoredBand (F : ShellCoordinates → M) (3 / 16) (3 * L / 4)) <
      chiral.real (riemannianBallOf g x a) →
    riemannianBallOf g x a ⊆ side.left ∧
      (riemannianBallOf g x b)ᶜ ⊆ side.right ∧
      Disjoint (riemannianBallOf g x a) trim ∧ Disjoint (riemannianBallOf g x b)ᶜ trim := by
  intro vol chiral full trim hVol hSmallLeft hSmallRight hOuterVol hBallVol hMass
  have : IsFiniteMeasure chiral := geometricChiralMeasure_finite o g frame hChiral
  have : IsFiniteMeasure vol := inferInstanceAs
    (IsFiniteMeasure (riemannianVolumeMeasure (𝓡 4) M g))
  have hChartMeas := (anchoredBand_isClosed F hsource).measurableSet
  have hChiralSmall :=
    (geometricChiralMeasure_real_le_metricFullCurvatureMeasure g o frame hChartMeas hChiral hFull).trans_lt hMass
  have hProtected : Disjoint (riemannianBallOf g x a)
      (anchoredBand (F : ShellCoordinates → M) (1 / 4) (L / 2)) :=
    disjoint_anchoredBand_of_ballMass_obstacle F g chiral hsource hC hlower (by norm_num)
      (by norm_num) (by linarith) ha hdiam hChiralSmall
  have hsmallSource : closedRadialBand (1 / 4) (L / 2) ⊆ F.source :=
    fun z hz => hsource ⟨(by norm_num : (3 : ℝ) / 16 ≤ 1 / 4).trans hz.1,
      hz.2.trans (by linarith)⟩
  have hsmallLower : closedRadialBand (1 / 4) (L / 2) ⊆ closedRadialBand (3 / 16) (3 * L / 4) :=
    fun _ hz => ⟨(by norm_num : (3 : ℝ) / 16 ≤ 1 / 4).trans hz.1, hz.2.trans (by linarith)⟩
  have hS1 : anchoredSphere (F : ShellCoordinates → M) 1 ⊆ trim := by
    rintro p ⟨z, hz, rfl⟩
    exact ⟨z, ⟨(by norm_num : (1 : ℝ) / 4 ≤ 1).trans hz.ge,
      hz.le.trans (by norm_num)⟩, rfl⟩
  have hTrim : trim ⊆ anchoredBand (F : ShellCoordinates → M) (1 / 4) (L / 2) :=
    image_mono (fun _ hz => ⟨hz.1, hz.2.trans (by linarith)⟩)
  have hBallS1 : Disjoint (riemannianBallOf g x a) (anchoredSphere (F : ShellCoordinates → M) 1) :=
    hProtected.mono_right (hS1.trans hTrim)
  have hxBall : x ∈ riemannianBallOf g x a := by
    change riemannianEDistOf g x x < ENNReal.ofReal a
    rw [riemannianEDistOf_self]
    exact ENNReal.ofReal_pos.mpr ha
  have hxInner := anchoredPoint_mem_inner_of_short_anchor F g (by norm_num)
    (by linarith : 1 < L / 2) hsmallSource hC
    (fun z hz => hlower z (hsmallLower hz)) side hInnerFace
    (fun hx => Set.disjoint_left.mp hProtected hxBall hx) hy
    (hAnchor.trans_lt ((ENNReal.ofReal_lt_ofReal_iff (hA.trans_lt hWidth)).mpr hWidth))
  have hInnerBall := ball_subset_inner_side g side hxInner
    (fun p hp => le_of_not_gt (fun hnear => Set.disjoint_left.mp hBallS1 hnear hp))
  have hRightLarge : 1 / 2 < vol.real side.right := by
    by_contra! h
    exact (not_lt_of_ge ((measureReal_mono hOuter).trans (hSmallRight h))) hOuterVol
  have hTwo := measureReal_union (μ := vol) side.disjoint side.isOpen_right.measurableSet
  have hTwoBound : vol.real (side.left ∪ side.right) ≤ vol.real univ :=
    measureReal_mono (subset_univ _)
  have hLeftBound : vol.real side.left ≤ V := hSmallLeft (by linarith)
  have hNear (p : M) (hp : p ∈ side.left) :
      ∃ q ∈ anchoredSphere (F : ShellCoordinates → M) 1,
        riemannianEDistOf g p q < ENNReal.ofReal R := by
    by_contra! h
    exact (not_lt_of_ge ((measureReal_mono (ball_subset_inner_side g side hp h)).trans
      hLeftBound)) (hBallVol p)
  have hDsum : ENNReal.ofReal A + ENNReal.ofReal D + ENNReal.ofReal R =
      ENNReal.ofReal (A + D + R) := by
    rw [ENNReal.ofReal_add (add_nonneg hA hD) hR.le, ENNReal.ofReal_add hA hD]
  have hNearTrim : trim ⊆ riemannianBallOf g x b := by
    intro p hp
    calc
      riemannianEDistOf g x p ≤ riemannianEDistOf g x y + riemannianEDistOf g y p :=
        riemannianEDistOf_triangle g x y p
      _ ≤ ENNReal.ofReal A + ENNReal.ofReal D + ENNReal.ofReal R :=
        (add_le_add hAnchor (hTravel p hp)).trans le_self_add
      _ < ENNReal.ofReal b := hDsum.symm ▸
        (ENNReal.ofReal_lt_ofReal_iff (by linarith)).mpr hFar
  have hNearLeft : side.left ⊆ riemannianBallOf g x b := by
    intro p hp
    obtain ⟨q, hq, hpq⟩ := hNear p hp
    have hqp : riemannianEDistOf g q p ≤ ENNReal.ofReal R :=
      riemannianEDistOf_comm g p q ▸ hpq.le
    have hxyq := (riemannianEDistOf_triangle g x y q).trans
      (add_le_add hAnchor (hTravel q (hS1 hq)))
    calc
      riemannianEDistOf g x p ≤ riemannianEDistOf g x q + riemannianEDistOf g q p :=
        riemannianEDistOf_triangle g x q p
      _ ≤ ENNReal.ofReal A + ENNReal.ofReal D + ENNReal.ofReal R := add_le_add hxyq hqp
      _ < ENNReal.ofReal b := hDsum.symm ▸
        (ENNReal.ofReal_lt_ofReal_iff (by linarith)).mpr hFar
  refine ⟨hInnerBall, ?_, hProtected.mono_right hTrim, ?_⟩
  · intro p hp
    have hcomp : p ∈ side.left ∪ side.right := by
      rw [side.union_eq_compl]
      exact fun h => hp (hNearTrim (hS1 h))
    exact hcomp.resolve_left (fun h => hp (hNearLeft h))
  · exact Set.disjoint_left.mpr (fun _ hext htrim => hext (hNearTrim htrim))

end PhysicalMeasure

end SmoothPoincare
