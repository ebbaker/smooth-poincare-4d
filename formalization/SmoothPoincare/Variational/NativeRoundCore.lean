import SmoothPoincare.Variational.MatchedCurvedDisk
import SmoothPoincare.Variational.AttainedRecognition
import DifferentialGeometry.Topology.Manifold.CompactCutoff
import DifferentialGeometry.Topology.Manifold.PartialDiffeomorph.Chart

/-! # A unit-round metric germ on the protected marked core -/

open DifferentialGeometry DifferentialGeometry.Geometry DifferentialGeometry.Geometry.Curvature
open FirstOrderTwistor Filter Function Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

noncomputable section

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E₄ H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]

/-- Insert a supplied ambient metric germ at the marked center by a
compactly supported cutoff inside the protected inner disk. The original
exact-width cutoff realizes the affine path and preserves the whole trim
and closed exterior as metric germs along that path. -/
theorem exists_selectedCoreGermPath
    (g r : SmoothRiemannianMetric I M) (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (n : ℕ) (hn : 0 < n)
    (hBuffer : Metric.closedBall (0 : E₄) (1 + 1 / ((n : ℝ) + 1)) ⊆ F.source) :
    ∃ (χ : M → ℝ) (hχ : ContMDiff I 𝓘(ℝ) ∞ χ) (hχ01 : ∀ y, χ y ∈ Icc (0 : ℝ) 1)
      (b : SmoothRiemannianMetric I M),
      let path := chartSpliceMetric g b χ hχ hχ01
      path 0 ⟨le_rfl, zero_le_one⟩ = g ∧ path 1 ⟨zero_le_one, le_rfl⟩ = b ∧
      (∀ᶠ z in 𝓝 (F 0), ∀ u v : TangentSpace I z, b.inner z u v = r.inner z u v) ∧
      (∀ y : M, ∀ u v : TangentSpace I y, ∀ t : ℝ, ∀ ht : t ∈ Icc (0 : ℝ) 1,
        (path t ht).inner y u v = (1 - t) * g.inner y u v + t * b.inner y u v) ∧
      ∀ y ∈ selectedDiskTrim F n ∪ (interior (selectedChartDisk F))ᶜ,
        ∀ᶠ z in 𝓝 y, ∀ u v : TangentSpace I z, ∀ t : ℝ, ∀ ht : t ∈ Icc (0 : ℝ) 1,
          (path t ht).inner z u v = g.inner z u v := by
  let w := 1 / ((n : ℝ) + 1)
  have hw : 0 < w := by dsimp [w]; positivity
  have hw' : w < 1 := by
    dsimp [w]
    exact (div_lt_one (by positivity)).2 (by exact_mod_cast Nat.succ_lt_succ hn)
  let A := F '' Metric.closedBall (0 : E₄) (1 - w)
  let O := F '' Metric.ball (0 : E₄) (1 - w)
  have hOuter : Metric.closedBall (0 : E₄) 1 ⊆ F.source :=
    (Metric.closedBall_subset_closedBall (by change (1 : ℝ) ≤ 1 + w; linarith)).trans hBuffer
  have hInner : Metric.closedBall (0 : E₄) (1 - w) ⊆ F.source :=
    (Metric.closedBall_subset_closedBall (by linarith)).trans hOuter
  have hO : IsOpen O :=
    image_opens_isOpen F (U := ⟨_, Metric.isOpen_ball⟩) (Metric.ball_subset_closedBall.trans hInner)
  have hCenter : F 0 ∈ O :=
    ⟨0, Metric.mem_ball_self (sub_pos.mpr hw'), rfl⟩
  obtain ⟨β, hβ, -, hβsupp, hβ01, hβone⟩ :=
    DifferentialGeometry.Topology.exists_contMDiff_cutoff_of_isCompact (I := I)
      isCompact_singleton hO (singleton_subset_iff.mpr hCenter)
  let b := r.convexComb g β hβ hβ01
  have hAgree (y : M) (hy : y ∉ A) (u v : TangentSpace I y) :
      b.inner y u v = g.inner y u v := by
    have hz : β y = 0 := image_eq_zero_of_notMem_tsupport
      (fun h => hy (image_mono Metric.ball_subset_closedBall (hβsupp h)))
    simp [b, convexComb_inner, hz]
  have hGerm : ∀ᶠ z in 𝓝 (F 0), ∀ u v : TangentSpace I z, b.inner z u v = r.inner z u v := by
    filter_upwards [eventually_nhdsSet_iff_forall.mp hβone (F 0) (mem_singleton _)] with z hz
    have hz' : β z = 1 := hz
    intro u v
    simp [b, convexComb_inner, hz']
  obtain ⟨χ, hχ, hχ01, hzero, hone, haff, hfix⟩ :=
    exists_selectedClampedCorePath g b F n hn hBuffer hAgree
  have hInterior : A ⊆ interior (selectedChartDisk F) := by
    rw [interior_selectedChartDisk F hOuter]
    apply image_mono
    intro x hx
    rw [Metric.mem_closedBall, dist_zero_right] at hx
    rw [Metric.mem_ball, dist_zero_right]
    linarith
  have hDisjoint := (selectedReference_innerDisk_partition F n hBuffer).2.2.1
  refine ⟨χ, hχ, hχ01, b, hzero, hone, hGerm, haff, ?_⟩
  intro y hy
  apply hfix y
  rcases hy with hTrim | hExterior
  · exact fun h => disjoint_left.mp hDisjoint h hTrim
  · exact fun h => hExterior (hInterior h)

local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 5)) = 4 + 1) := ⟨by simp⟩

/-- The unit round four-sphere has nonzero lowered curvature at every point. -/
theorem standardRoundFour_curvature_ne_zero (p : StandardFourSphere) :
    metricRm04At standardRoundFourMetric p ≠ 0 := by
  let D := (Tensor0SBundle.tangentMetricData (I := 𝓡 4) standardRoundFourMetric p).metric
  let _ : InnerProductSpace.Core ℝ (TangentSpace (𝓡 4) p) := D.toCore
  let _ : NormedAddCommGroup (TangentSpace (𝓡 4) p) :=
    @InnerProductSpace.Core.toNormedAddCommGroup ℝ (TangentSpace (𝓡 4) p) _ _ _ D.toCore
  let _ : InnerProductSpace ℝ (TangentSpace (𝓡 4) p) :=
    @InnerProductSpace.ofCore ℝ (TangentSpace (𝓡 4) p) _ _ _ D.toCore.toCore
  have hdim : Module.finrank ℝ (TangentSpace (𝓡 4) p) = 4 := by
    change Module.finrank ℝ E₄ = 4
    simp
  let B := (stdOrthonormalBasis ℝ (TangentSpace (𝓡 4) p)).reindex (finCongr hdim)
  have hInner (i j : Fin 4) :
      standardRoundFourMetric.inner p (B i) (B j) = if i = j then 1 else 0 := by
    change D.inner (B i) (B j) = _
    rw [← D.toCore_inner, B.inner_eq_ite]
  have hSection : metricRm04StandardAt standardRoundFourMetric p (B 0) (B 1) (B 1) (B 0) = 1 := by
    rw [roundMetric_sec_value]
    norm_num [hInner]
  intro hFlat
  rw [metricRm04StandardAt_apply, hFlat] at hSection
  norm_num at hSection

/-- Every buffered selected disk admits an actual ambient endpoint that
is unit round near its marked center and has nonzero physical curvature
there. Its exact-width affine splice retains the incoming metric germs on
the full selected trim and the complete closed exterior at every parameter. -/
theorem exists_selectedNativeRoundCorePath [SigmaCompactSpace M]
    (g : SmoothRiemannianMetric I M) (F : PartialDiffeomorph I₄ I E₄ M ∞)
    (n : ℕ) (hn : 0 < n)
    (hBuffer : Metric.closedBall (0 : E₄) (1 + 1 / ((n : ℝ) + 1)) ⊆ F.source) :
    ∃ (χ : M → ℝ) (hχ : ContMDiff I 𝓘(ℝ) ∞ χ) (hχ01 : ∀ y, χ y ∈ Icc (0 : ℝ) 1)
      (b : SmoothRiemannianMetric I M) (p : StandardFourSphere)
      (S : PartialDiffeomorph (𝓡 4) I StandardFourSphere M ∞)
      (V : TopologicalSpace.Opens StandardFourSphere),
      let path := chartSpliceMetric g b χ hχ hχ01
      path 0 ⟨le_rfl, zero_le_one⟩ = g ∧ path 1 ⟨zero_le_one, le_rfl⟩ = b ∧
      p ∈ V ∧ (V : Set StandardFourSphere) ⊆ S.source ∧ S p = F 0 ∧
      (∀ x ∈ V, ∀ u v : TangentSpace (𝓡 4) x, standardRoundFourMetric.inner x u v =
        b.inner (S x) (mfderiv (𝓡 4) I (S : StandardFourSphere → M) x u)
          (mfderiv (𝓡 4) I (S : StandardFourSphere → M) x v)) ∧
      metricRm04At b (F 0) ≠ 0 ∧
      (∀ y : M, ∀ u v : TangentSpace I y, ∀ t : ℝ, ∀ ht : t ∈ Icc (0 : ℝ) 1,
        (path t ht).inner y u v = (1 - t) * g.inner y u v + t * b.inner y u v) ∧
      ∀ y ∈ selectedDiskTrim F n ∪ (interior (selectedChartDisk F))ᶜ,
        ∀ᶠ z in 𝓝 y, ∀ u v : TangentSpace I z, ∀ t : ℝ, ∀ ht : t ∈ Icc (0 : ℝ) 1,
          (path t ht).inner z u v = g.inner z u v := by
  obtain ⟨p, hp⟩ := (NormedSpace.sphere_nonempty
    (x := (0 : EuclideanSpace ℝ (Fin 5))) (r := 1)).mpr zero_le_one
  let q : StandardFourSphere := ⟨p, hp⟩
  let C := DifferentialGeometry.PartialDiffeomorph.extChartAt (𝓡 4) ∞ q
  let T : E₄ ≃ₘ[ℝ] E₄ :=
    { toEquiv := Equiv.addRight (-C q)
      contMDiff_toFun := (contDiff_id.add contDiff_const).contMDiff
      contMDiff_invFun := (contDiff_id.add contDiff_const).contMDiff }
  have hT : T (C q) = 0 := add_neg_cancel _
  have hC : q ∈ C.source := mem_extChartAt_source q
  let S := (C.trans T.toPartialDiffeomorph).trans F
  have h0 : (0 : E₄) ∈ F.source := by
    apply hBuffer
    rw [Metric.mem_closedBall, dist_self]
    positivity
  have hq : q ∈ S.source := by
    refine ⟨⟨hC, mem_univ _⟩, ?_⟩
    change T (C q) ∈ F.source
    rw [hT]
    exact h0
  have hS : S q = F 0 := by
    change F (T (C q)) = F 0
    rw [hT]
  obtain ⟨r, U, hU, hUS, hIsometry, -⟩ :=
    PartialDiffeomorph.exists_metric_preserving_on_neighborhood_of_is_compact S
      standardRoundFourMetric g isCompact_singleton (singleton_subset_iff.mpr hq)
  obtain ⟨χ, hχ, hχ01, b, hZero, hOne, hGerm, hAff, hFix⟩ :=
    exists_selectedCoreGermPath g r F n hn hBuffer
  obtain ⟨W, hW, hOpen, hCenter⟩ := mem_nhds_iff.mp hGerm
  let V : TopologicalSpace.Opens StandardFourSphere :=
    ⟨(U : Set StandardFourSphere) ∩ (S : StandardFourSphere → M) ⁻¹' W,
      (S.contMDiffOn_toFun.continuousOn.mono hUS).isOpen_inter_preimage U.isOpen hOpen⟩
  have hV : q ∈ V := ⟨hU (mem_singleton _), by simpa only [mem_preimage, hS] using hCenter⟩
  have hVS : (V : Set StandardFourSphere) ⊆ S.source := fun _ hx => hUS hx.1
  have hPull (x : StandardFourSphere) (hx : x ∈ V) (u v : TangentSpace (𝓡 4) x) :
      standardRoundFourMetric.inner x u v =
        b.inner (S x) (mfderiv (𝓡 4) I (S : StandardFourSphere → M) x u)
          (mfderiv (𝓡 4) I (S : StandardFourSphere → M) x v) :=
    (hIsometry x hx.1 u v).trans (hW hx.2 _ _).symm
  refine ⟨χ, hχ, hχ01, b, q, S, V, hZero, hOne, hV, hVS, hS, hPull, ?_, hAff, hFix⟩
  intro hFlat
  apply standardRoundFour_curvature_ne_zero q
  ext v
  have hSlots : vec4 (v 0) (v 1) (v 2) (v 3) = v := by
    funext i
    fin_cases i <;> rfl
  have heq := metricRm04StandardAt_eq_of_partialDiffeomorph_restriction S V hVS
    standardRoundFourMetric b (fun x => hPull x x.property) ⟨q, hV⟩ (v 0) (v 1) (v 2) (v 3)
  have hFlatCenter : metricRm04At b (S q) = 0 := by
    rw [hS]
    exact hFlat
  simpa only [metricRm04StandardAt_apply, hSlots, hFlatCenter, zero_apply] using heq

end

end SmoothPoincare
