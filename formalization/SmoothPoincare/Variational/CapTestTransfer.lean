import SmoothPoincare.Variational.YamabeWall
import SmoothPoincare.Variational.CutNonsplitting
import FirstOrderTwistor.CapSplice

/-! # Passing the joined Yamabe floor to each capped metric

A witness for each cap test consists of actual log-conformal metrics on the
joined source. The length sequence may depend on the test and on the side.
Both the scalar numerator and the volume converge in the given marking.
-/

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Integral.Measure FirstOrderTwistor Filter MeasureTheory Set
open SectionsAndConnections
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [T2Space M] [CompactSpace M] [Nonempty M]

local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 5)) = 4 + 1) := ⟨by simp⟩

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

noncomputable def capTestScalar (g : SmoothRiemannianMetric I M) : ℝ :=
  ∫ x, metricScalarAt g x ∂riemannianVolumeMeasure I M g

noncomputable def capTestVolume (g : SmoothRiemannianMetric I M) : ℝ :=
  (riemannianVolumeMeasure I M g).real univ

omit [I.Boundaryless] in
private theorem capTestVolume_pos (g : SmoothRiemannianMetric I M) : 0 < capTestVolume g := by
  let μ := riemannianVolumeMeasure I M g
  let : IsFiniteMeasureOnCompacts μ := riemannianVolumeMeasure_isFiniteMeasureOnCompacts g
  let : μ.IsOpenPosMeasure := riemannianVolumeMeasure_isOpenPosMeasure g
  exact ENNReal.toReal_pos (isOpen_univ.measure_pos μ univ_nonempty).ne' (measure_ne_top μ univ)

private theorem joinedFloor_le_test {d : Module.finrank ℝ E = 4}
    {g : SmoothRiemannianMetric I M} {b : ℝ} (hb : 0 < b)
    (hg : b ≤ classYamabeFour d g) (u : C^∞⟮I, M; ℝ⟯) :
    b ≤ capTestScalar (conformalMetric g u) / Real.sqrt (capTestVolume (conformalMetric g u)) := by
  let S := range (fun v : C^∞⟮I, M; ℝ⟯ =>
    capTestScalar (conformalMetric g v) / Real.sqrt (capTestVolume (conformalMetric g v)))
  change b ≤ sInf S at hg
  have hBelow : BddBelow S := by
    by_contra h
    rw [Real.sInf_of_not_bddBelow h] at hg
    exact hb.not_ge hg
  exact hg.trans (csInf_le hBelow (mem_range_self u))

variable {F K X : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
  [TopologicalSpace K] {J : ModelWithCorners ℝ F K} [J.Boundaryless]
  [TopologicalSpace X] [ChartedSpace K X] [IsManifold J ∞ X]
  [T2Space X] [CompactSpace X] [Nonempty X]
  {P : Type*}

/-- Each smooth positive conformal factor on this cap is tested by a sequence
on the same joined family. No sign assumption is imposed on the cap. -/
def HasJoinedCapTests (joined : P → SmoothRiemannianMetric I M) (cap : SmoothRiemannianMetric J X) :
    Prop := ∀ u : C^∞⟮J, X; ℝ⟯, ∃ (t : ℕ → P) (v : ℕ → C^∞⟮I, M; ℝ⟯),
      Tendsto (fun n => capTestScalar (conformalMetric (joined (t n)) (v n))) atTop
        (𝓝 (capTestScalar (conformalMetric cap u))) ∧
      Tendsto (fun n => capTestVolume (conformalMetric (joined (t n)) (v n))) atTop
        (𝓝 (capTestVolume (conformalMetric cap u)))

theorem HasJoinedCapTests.yamabeFloor
    {joined : P → SmoothRiemannianMetric I M} {cap : SmoothRiemannianMetric J X}
    (hTests : HasJoinedCapTests joined cap) (dM : Module.finrank ℝ E = 4)
    (dX : Module.finrank ℝ F = 4) {b : ℝ} (hb : 0 < b)
    (hJoined : ∀ t, b ≤ classYamabeFour dM (joined t)) :
    b ≤ classYamabeFour dX cap := by
  let Q := fun u : C^∞⟮J, X; ℝ⟯ =>
    capTestScalar (conformalMetric cap u) / Real.sqrt (capTestVolume (conformalMetric cap u))
  change b ≤ sInf (range Q)
  apply le_csInf (range_nonempty Q)
  rintro _ ⟨u, rfl⟩
  obtain ⟨t, v, hScalar, hVol⟩ := hTests u
  have hQ := hScalar.div ((Real.continuous_sqrt.tendsto _).comp hVol)
    (Real.sqrt_pos_of_pos (capTestVolume_pos _)).ne'
  exact ge_of_tendsto hQ (Eventually.of_forall fun n => joinedFloor_le_test hb (hJoined (t n)) (v n))

variable {L Hv V : Type*} [NormedAddCommGroup L] [NormedSpace ℝ L] [FiniteDimensional ℝ L]
  [TopologicalSpace Hv] {IV : ModelWithCorners ℝ L Hv} [IV.Boundaryless]
  [TopologicalSpace V] [ChartedSpace Hv V] [IsManifold IV ∞ V]
  [T2Space V] [CompactSpace V] [Nonempty V]

/-- Both cap tests use one strictly subcritical path. Each cap has its own
test transplants; the two caps may be on different smooth types. -/
theorem twoCapSigns_of_joinedTests [TopologicalSpace P] [PreconnectedSpace P]
    (o : ManifoldOrientation I M 4) (joined : P → SmoothRiemannianMetric I M)
    (frame : ∀ t x, OrientedOrthonormalFrameAt (joined t) o x)
    (level : P → ℝ) (start : P) {gap : ℝ} (hgap : 0 < gap)
    (hcont : Continuous level) (hstart : 0 < level start)
    (hsign : ∀ t, 0 < level t ↔ 0 < classYamabeFour o.dimension_eq (joined t))
    (hzero : ∀ t, level t = 0 → classYamabeFour o.dimension_eq (joined t) = 0)
    (hint : ∀ t, Integrable (fun x => SectionsAndConnections.hilbertSchmidtSq
      (geometricChiralBlock (joined t) o x (frame t x))) (riemannianVolumeMeasure I M (joined t)))
    (hEuler : ∀ t, 48 * (8 * Real.pi ^ 2 - chiralFrameEnergy (joined t)
      (fun x => geometricChiralBlock (joined t) o x (frame t x))) ≤
      classYamabeFour o.dimension_eq (joined t) ^ 2)
    (hband : ∀ t, chiralFrameEnergy (joined t) (fun x => geometricChiralBlock (joined t) o x
      (frame t x)) ≤ 8 * Real.pi ^ 2 - gap)
    (left : SmoothRiemannianMetric J X) (right : SmoothRiemannianMetric IV V)
    (dX : Module.finrank ℝ F = 4) (dV : Module.finrank ℝ L = 4)
    (hl : HasJoinedCapTests joined left) (hr : HasJoinedCapTests joined right) :
    0 < Real.sqrt (48 * gap) ∧ Real.sqrt (48 * gap) ≤ classYamabeFour dX left ∧
      Real.sqrt (48 * gap) ≤ classYamabeFour dV right := by
  have hb : 0 < Real.sqrt (48 * gap) := by positivity
  have h t := (admissibleAlongSubcriticalMetricPath o joined frame level start gap hgap
    hcont hstart hsign hzero hint hEuler hband t).2.1
  exact ⟨hb, hl.yamabeFloor o.dimension_eq dX hb h, hr.yamabeFloor o.dimension_eq dV hb h⟩

private local instance : MeasurableSpace X := borel X
private local instance : BorelSpace X := ⟨rfl⟩

/-- Install the recovered positive sign on the actual cap with its marked
closed complementary core. The maps are inputs from the same cut. -/
def HasJoinedCapTests.markedSide
    {joined : P → SmoothRiemannianMetric I M} {q : SmoothRiemannianMetric J X}
    (hTests : HasJoinedCapTests joined q) (o : ManifoldOrientation I M 4)
    (oc : ManifoldOrientation J X 4) (frame : ∀ x, OrientedOrthonormalFrameAt q oc x)
    {b : ℝ} (hb : 0 < b) (hJoined : ∀ t, b ≤ classYamabeFour o.dimension_eq (joined t))
    (raw : Set M) (hm : MeasurableSet raw) (core : PartialDiffeomorph I J M X ∞)
    (marking : PartialDiffeomorph (𝓡 4) J StandardFourSphere X ∞)
    (hmark : standardFourSphereCap ⊆ marking.source) (hcore : raw ⊆ core.source)
    (hImage : core '' raw = (interior (marking '' standardFourSphereCap))ᶜ)
    (hi : Integrable (fun x => hilbertSchmidtSq (geometricChiralBlock q oc x (frame x)))
      (riemannianVolumeMeasure J X q)) : GeometricMarkedCutSide (I := I) (M := M) oc where
  raw := raw
  rawMeasurable := hm
  core := core
  marking := marking
  capInMarking := hmark
  rawInCore := hcore
  coreImage := hImage
  metric := q
  frame := frame
  positive := hb.trans_le (hTests.yamabeFloor o.dimension_eq oc.dimension_eq hb hJoined)
  integrable := hi

omit [I.Boundaryless] [Nonempty M] [J.Boundaryless] [Nonempty X] in
/-- Charge the changed half-collar and its entire complement on one specified
cap. Apply once with each orientation inherited from the joined source. The
new cap outside the comparison strip must be included in the exterior bound. -/
theorem cappedEnergy_le_raw_add_halfCollarError
    {A C : Type*} [MeasurableSpace A] {ν : Measure A} [NormedAddCommGroup C] [NormedSpace ℝ C]
    (o : ManifoldOrientation I M 4) (g : SmoothRiemannianMetric I M)
    (frame : ∀ x, OrientedOrthonormalFrameAt g o x)
    (oc : ManifoldOrientation J X 4) (q : SmoothRiemannianMetric J X)
    (fc : ∀ x, OrientedOrthonormalFrameAt q oc x)
    (raw strip : Set M) (trim : Set X)
    (hs : MeasurableSet strip) (ht : MeasurableSet trim) (hsub : strip ⊆ raw)
    (incoming outgoing : A → C) (θ : A → ℝ) {β : ℝ}
    (hi : MemLp incoming 2 ν) (ho : MemLp outgoing 2 ν)
    (hθ : AEStronglyMeasurable θ ν) (hCut : ∀ᵐ x ∂ν, |θ x| ≤ 1)
    (hErr : lpNorm (fun x => outgoing x - θ x • incoming x) 2 ν ≤ β) :
    let W := fun x => hilbertSchmidtSq (geometricChiralBlock g o x (frame x))
    let V := fun x => hilbertSchmidtSq (geometricChiralBlock q oc x (fc x))
    let μ := riemannianVolumeMeasure I M g
    let σ := riemannianVolumeMeasure J X q
    Integrable W μ → Integrable V σ →
    (∫ x in strip, W x ∂μ) = ∫ x, ‖incoming x‖ ^ 2 ∂ν →
    (∫ x in trim, V x ∂σ) = ∫ x, ‖outgoing x‖ ^ 2 ∂ν →
    (∫ x in trimᶜ, V x ∂σ) ≤ ∫ x in raw \ strip, W x ∂μ →
    chiralFrameEnergy q (fun x => geometricChiralBlock q oc x (fc x)) ≤
      (∫ x in raw, W x ∂μ) + 2 * Real.sqrt (∫ x in strip, W x ∂μ) * β + β ^ 2 := by
  intro W V μ σ hW hV hI hO hOutside
  have hNorm {f : A → C} (hf : MemLp f 2 ν) :
      lpNorm f 2 ν = Real.sqrt (∫ x, ‖f x‖ ^ 2 ∂ν) := by
    rw [lpNorm_eq_integral_norm_rpow_toReal (by norm_num) (by simp) hf.aestronglyMeasurable,
      Real.sqrt_eq_rpow]
    norm_num [Real.rpow_two, one_div]
  have hBound := (capSpliceNormTriangle (spliced := outgoing) hi hθ hCut).trans
    (add_le_add le_rfl hErr)
  rw [hNorm hi, hNorm ho, ← hI, ← hO] at hBound
  have hn : 0 ≤ ∫ x in trim, V x ∂σ := integral_nonneg fun x => Finset.sum_nonneg fun _ _ => Finset.sum_nonneg fun _ _ => sq_nonneg _
  have hm : 0 ≤ ∫ x in strip, W x ∂μ := integral_nonneg fun x => Finset.sum_nonneg fun _ _ => Finset.sum_nonneg fun _ _ => sq_nonneg _
  have hSq := pow_le_pow_left₀ (Real.sqrt_nonneg _) hBound 2
  rw [Real.sq_sqrt hn, add_sq, Real.sq_sqrt hm] at hSq
  have hSplit := integral_add_compl ht hV
  have hRaw := setIntegral_sdiff hs hW.integrableOn hsub
  change (∫ x, V x ∂σ) ≤ _
  linarith only [hSq, hOutside, hSplit, hRaw]

end SmoothPoincare
