import SmoothPoincare

/-!
Independent Edition 05 applications for Edward B. Baker III, 26 November 2026,
with OpenAI Codex assistance. Serving model and effort were unavailable.
The applications take their target coefficients and hypotheses from scientific
06 at the intake identified in `ED05_E47_READBACK.md`.
-/

set_option autoImplicit false

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Integral.Measure FirstOrderTwistor Filter MeasureTheory
open SectionsAndConnections Set SmoothPoincare
open scoped BigOperators ContDiff ENNReal Manifold Topology

section NormChecks

local notation "E4" => EuclideanSpace ℝ (Fin 4)

variable {H M : Type*} [TopologicalSpace H]
  {I : ModelWithCorners ℝ E4 H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]

-- One quarter of the four-slot norm is Bour's squared full-curvature norm.
example (g : SmoothRiemannianMetric I M) (o : ManifoldOrientation I M 4) (x : M)
    (frame : OrientedOrthonormalFrameAt g o x) :
    frameTensorNormSq (metricCurvatureFrameTensor g o x frame) / 4 =
      hilbertSchmidtSq (geometricChiralBlock g o x frame) +
      hilbertSchmidtSq (endpointNegativeWeylBlock g o x frame) +
      (∑ a : Fin 4, ∑ b : Fin 4, (ricciTensor g x (frame.basis b) (frame.basis a) -
        (metricScalarAt g x / 4) * (if a = b then 1 else 0)) ^ 2) / 2 +
      metricScalarAt g x ^ 2 / 24 := by
  rw [metricFrameTensorNormSq_eq_chiral_ricci_scalar, endpointRicciDefectDensity_eq_ricci]
  ring

end NormChecks

section ThresholdChecks

-- The end-count formula alone permits two ends at the inclusive Ricci ceiling.
example : ∃ (k : ℕ) (ePlus eMinus D : ℝ), 1 < k ∧ 0 ≤ ePlus ∧ 0 ≤ eMinus ∧
    D = 2 * (ePlus + eMinus) + 32 * Real.pi ^ 2 * ((k : ℝ) - 1) ∧ D ≤ 32 * Real.pi ^ 2 := by
  refine ⟨2, 0, 0, 32 * Real.pi ^ 2, ?_⟩
  norm_num

-- A nonempty energy set at the inclusive upper band endpoint still has strict entry.
example (A : Set ℝ) (hA : A.Nonempty) {δ : ℝ} (hδ : 0 < δ)
    (hBand : sInf A ≤ 8 * Real.pi ^ 2 - δ) : ∃ e ∈ A, e < 8 * Real.pi ^ 2 :=
  exists_lt_of_csInf_lt hA (hBand.trans_lt (sub_lt_self _ hδ))

end ThresholdChecks

section PhysicalSourceChecks

open SmoothPoincare.Bour

variable {H M : Type*} [TopologicalSpace H]
  {I : ModelWithCorners ℝ (EuclideanSpace ℝ (Fin 4)) H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [ConnectedSpace M] {o : ManifoldOrientation I M 4}

local instance : MeasurableSpace M := borel M
local instance : BorelSpace M := ⟨rfl⟩

example (q : SignedCollarMetric o) (hEuler : bourEuler q = 16 * Real.pi ^ 2) (α : ℝ) :
    bourEnergy α q = 2 * (1 - α) * q.energy .plus + α * bourRicci q / 2 ∧
    bourEnergy α q = 2 * q.energy .plus + α * bourScalar q / 24 - 16 * α * Real.pi ^ 2 ∧
    bourFullCurvature q = 16 * Real.pi ^ 2 + bourRicci q := by
  refine ⟨bourEnergy_eq_chiral_ricci α q, ?_, ?_⟩
  · rw [bourEnergy_eq_chiral_scalar, hEuler]
    ring
  · rw [bourFullCurvature_eq_euler_add_ricci, hEuler]

example (entry : SignedCollarMetric o) (hY : 0 < classYamabeFour o.dimension_eq entry.metric)
    (hEntry : entry.energy .plus < 8 * Real.pi ^ 2) (hNormalize : BourYamabeNormalization o)
    (α : ℕ → ℝ) (hα : ∀ j, 0 < α j) :
    ∃ η > 0, ∃ q : ℕ → SignedCollarMetric o, ∀ j,
      riemannianVolumeMeasure I M (q j).metric univ = 1 ∧
      (∀ x, metricScalarAt (q j).metric x = classYamabeFour o.dimension_eq (q j).metric) ∧
      (∀ sign, (q j).energy sign ≤ 8 * Real.pi ^ 2 - η) ∧
      (q j).energy .plus ≤ sInf (geometricPositiveEnergies o) + (α j) ^ 2 := by
  obtain ⟨η, hη, q, hq⟩ := exists_bourYamabeStarts o entry hY hEntry hNormalize α hα
  refine ⟨η, hη, q, fun j => ?_⟩
  obtain ⟨_, hv, hscalar, _, hGap, _, hExcess⟩ := hq j
  refine ⟨hv, hscalar, ?_, by linarith only [hExcess]⟩
  intro sign
  cases sign with
  | plus => exact hGap
  | minus => exact (q j).signature_zero.symm.le.trans hGap

example {P : Type*} [TopologicalSpace P] [PreconnectedSpace P] {start : P} {α : ℝ}
    (f : OriginalTrajectory o α start) (hα : 0 < α) (hα₁ : α < 1)
    (hEuler : ∀ q : SignedCollarMetric o, bourEuler q = 16 * Real.pi ^ 2)
    (hStrict : α * f.yamabe start ^ 2 < 48 * (8 * Real.pi ^ 2 - f.energy start)) :
    ∀ t, (∀ sign, sInf (geometricPositiveEnergies o) ≤ (f.slice t).energy sign) ∧
      bourScalar (f.slice t) ≤ f.yamabe start ^ 2 + 48 * f.excess / α ∧
      bourRicci (f.slice t) + (384 * Real.pi ^ 2 - f.yamabe start ^ 2) / 12 ≤
        4 * sInf (geometricPositiveEnergies o) + 4 * f.excess / α := by
  intro t
  have hMargin := (bourInitialMargin_pos_iff f (hEuler _)).2 hStrict
  have h := bourOriginalFlow_budget f hα hα₁ hEuler hMargin t
  refine ⟨?_, h.scalar, by linarith only [h.ricci_sharp]⟩
  intro sign
  cases sign with
  | plus => exact h.plus_infimum
  | minus =>
    rw [h.minus_eq_plus]
    exact h.plus_infimum

example {P : ℕ → Type*} [∀ j, TopologicalSpace (P j)] [∀ j, PreconnectedSpace (P j)]
    (α : ℕ → ℝ) (start : ∀ j, P j) (f : ∀ j, OriginalTrajectory o (α j) (start j))
    (hα : ∀ j, 0 < α j ∧ α j < 1) (hαlim : Tendsto α atTop (𝓝 0))
    (hEuler : ∀ q : SignedCollarMetric o, bourEuler q = 16 * Real.pi ^ 2)
    (hEntry : sInf (geometricPositiveEnergies o) < 8 * Real.pi ^ 2)
    (hExcess : ∀ j, (f j).excess ≤ (α j) ^ 2) :
    ∃ y η d : ℝ, 0 < y ∧ 0 < η ∧ d < 32 * Real.pi ^ 2 ∧
      ∃ j₀, ∀ j ≥ j₀, ∀ t : P j, y ≤ (f j).yamabe t ∧
        (∀ sign, ((f j).slice t).energy sign ≤ 8 * Real.pi ^ 2 - η) ∧
        bourRicci ((f j).slice t) ≤ d := by
  let δ := 8 * Real.pi ^ 2 - sInf (geometricPositiveEnergies o)
  have hδ : 0 < δ := sub_pos.mpr hEntry
  obtain ⟨hTail, _⟩ := eventually_bourOriginalFlow_budget f hα hαlim hEuler hEntry hExcess
  obtain ⟨j₀, hj₀⟩ := hTail
  refine ⟨Real.sqrt (24 * δ), δ / 2, 32 * Real.pi ^ 2 - 2 * δ,
    Real.sqrt_pos.mpr (by positivity), half_pos hδ, by linarith only [hδ], j₀, ?_⟩
  intro j hj t
  obtain ⟨_, hY, hE, _, hD, hDMax, _, _⟩ := (hj₀ j hj).2.2 t
  exact ⟨hY, fun sign => (hE sign).2, hD.trans hDMax⟩

end PhysicalSourceChecks

section RoundCharges

open SmoothPoincare.Bour

local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 5)) = 4 + 1) := ⟨by simp⟩
local instance : MeasurableSpace StandardFourSphere := borel StandardFourSphere
local instance : BorelSpace StandardFourSphere := ⟨rfl⟩

example (o : ManifoldOrientation (𝓡 4) StandardFourSphere 4)
    (f : ∀ x, OrientedOrthonormalFrameAt standardRoundFourMetric o x) :
    let q := bourChargeOn o standardRoundFourMetric f univ
    q .ricci = 0 ∧ q .scalar = 384 * Real.pi ^ 2 ∧ q .full = 64 * Real.pi ^ 2 := by
  intro q
  obtain ⟨_, _, hD, hS, hFull⟩ := bourStandardRound_charge_values o f
  exact ⟨hD, hS, by linarith only [hFull]⟩

end RoundCharges

section MarkedArithmeticChecks

-- The Euler step precedes construction of a compactification or its signature theorem.
example {k : ℕ} (hk : 0 < k) {p m D : ℝ} (hp : 0 ≤ p) (hm : 0 ≤ m)
    (hGB : D = 2 * (p + m) + 32 * Real.pi ^ 2 * ((k : ℝ) - 1))
    (hStrict : D < 32 * Real.pi ^ 2) : k = 1 := by
  apply bourOneEuclideanEnd hk hp hm (dMax := D) _ le_rfl hStrict
  nlinarith only [hGB]

example {p m D dMax eSrc : ℝ} (hEuler : p + m - D / 2 = 0) (hSign : p = m)
    (hD : D ≤ dMax) (hp : p ≤ eSrc) (hm : m ≤ eSrc) :
    D = 4 * p ∧ p ≤ eSrc ∧ m ≤ dMax / 4 := by
  obtain ⟨_, hRicci, hPlus, hMinus⟩ := bourSignedEndEnergy hEuler (sub_eq_zero.mpr hSign) hD hp hm
  exact ⟨hRicci, hPlus.trans (min_le_left _ _), hMinus.trans (min_le_right _ _)⟩

example (rawCore capped source : ℕ → CollarChirality → ℝ) {δ : ℝ}
    (hCore : ∀ sign, Tendsto (fun i => rawCore i sign) atTop (𝓝 (5 * Real.pi ^ 2)))
    (hSource : ∀ᶠ i in atTop, ∀ sign, source i sign ≤ 8 * Real.pi ^ 2 - δ)
    (hSplice : ∀ᶠ i in atTop, ∀ sign, capped i sign ≤ source i sign - rawCore i sign + δ) :
    ∀ᶠ i in atTop, ∀ sign, capped i sign < 4 * Real.pi ^ 2 :=
  bourCappedExterior_both_lt le_rfl rawCore capped source
    (fun _ => by nlinarith only [sq_pos_of_pos Real.pi_pos]) hCore hSource hSplice

end MarkedArithmeticChecks

section PointedMapChecks

open DifferentialGeometry.CheegerGromovCompactness TopologicalSpace

universe u uE uH

variable {E : Type uE} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [NeZero (Module.finrank ℝ E)]
  {H : Type uH} [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  {X : PointedRiemannianSeq.{u,uE,uH} I} {P : PointedRiemannianManifold.{u,uE,uH} I}
  {φ : ℕ → ℕ}

attribute [local instance] PointedRiemannianManifold.topology PointedRiemannianManifold.charted
  PointedRiemannianManifold.smooth PointedRiemannianManifold.t2
  PointedRiemannianManifold.sigmaCompact PointedRiemannianManifold.t2TangentBundle

local instance (Q : PointedRiemannianManifold.{u,uE,uH} I) : MeasurableSpace Q.M := borel Q.M
local instance (Q : PointedRiemannianManifold.{u,uE,uH} I) : BorelSpace Q.M := ⟨rfl⟩
local instance : CompleteSpace E := FiniteDimensional.complete ℝ E

example (F : PointedRiemannianConvergenceMaps X P φ)
    (oP : ManifoldOrientation I P.M 4) (oX : ∀ i, ManifoldOrientation I (X.obj i).M 4)
    (hOrientation : ∀ᶠ i in atTop, bourComparisonPreservesOrientation F oP oX i)
    {K core : Set P.M} (hK : IsCompact K) (U : Opens P.M) (hUK : (U : Set P.M) ⊆ K)
    (hCore : core ⊆ U) (left right : Set P.M) (hLeft : left ⊆ U) (hRight : right ⊆ U) :
    ∀ᶠ i in atTop, bourComparisonPreservesOrientation F oP oX i ∧
      ∃ f : PartialDiffeomorph I I P.M (X.obj (φ i)).M ∞,
        f.source = U ∧ f.symm '' (F.map i '' core) = core ∧
        f.symm '' (F.map i '' left) = left ∧ f.symm '' (F.map i '' right) = right := by
  let buffer := fun mark : Bool => if mark then left else right
  have hb : ∀ b, buffer b ⊆ U := by
    intro b
    cases b
    · simpa [buffer] using hRight
    · simpa [buffer] using hLeft
  filter_upwards [bourWholeCoreComparison F oP oX hOrientation hK U hUK hCore buffer hb] with i hi
  obtain ⟨hO, _, f, hs, _, _, _, hC, hB⟩ := hi
  exact ⟨hO, f, hs, hC, by simpa [buffer] using hB true, by simpa [buffer] using hB false⟩

example (F : PointedRiemannianConvergenceMaps X P φ) (C : MetricConvergenceData F)
    (hCanonical : ∀ i, C.domain i = CanonicalMetricCompactness.canonicalSourceData F i)
    {d : ℝ≥0∞}
    (hCeil : ∀ᶠ i in atTop, (∫⁻ x, ENNReal.ofReal (intrinsicTraceFreeRicciSq (X.obj (φ i)).metric x)
        ∂riemannianVolumeMeasure I (X.obj (φ i)).M (X.obj (φ i)).metric) ≤ d) :
    (∫⁻ x, ENNReal.ofReal (intrinsicTraceFreeRicciSq P.metric x)
      ∂riemannianVolumeMeasure I P.M P.metric) ≤ d := by
  apply (bourPointedTraceFreeRicci_le_liminf F C hCanonical).trans
  simpa using liminf_le_liminf hCeil

example (F : PointedRiemannianConvergenceMaps X P φ) (C : MetricConvergenceData F)
    (hCanonical : ∀ i, C.domain i = CanonicalMetricCompactness.canonicalSourceData F i)
    (hd : Module.finrank ℝ E = 4) (hCompact : ∀ i, CompactSpace (X.obj i).M)
    (g : ∀ i, SmoothRiemannianMetric I (X.obj i).M) (a : ℕ → ℝ) (ha : ∀ i, 0 < a i)
    (hScale : ∀ i, (X.obj i).metric = scaleMetric (a i) (ha i) (g i)) {dMax : ℝ} :
    let D := fun i => ∫ x, intrinsicTraceFreeRicciSq (g (φ i)) x
      ∂riemannianVolumeMeasure I (X.obj (φ i)).M (g (φ i))
    (∀ᶠ i in atTop, D i ≤ dMax) →
    (∫ x, intrinsicTraceFreeRicciSq P.metric x ∂riemannianVolumeMeasure I P.M P.metric) ≤
      min (liminf D atTop) dMax := by
  intro D hBound
  obtain ⟨_, hLSC, hBoundLimit⟩ := bourPointedTraceFreeRicci_real_le_liminf F C hCanonical hd
    hCompact g a ha hScale hBound
  exact le_min hLSC hBoundLimit

end PointedMapChecks

section SeamChecks

variable {H M N : Type*} [TopologicalSpace H]
  {I : ModelWithCorners ℝ (EuclideanSpace ℝ (Fin 4)) H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T3Space M]
  [TopologicalSpace N] [ChartedSpace H N] [IsManifold I ∞ N] [T2Space N] [PreconnectedSpace N]

example (core exterior : PartialDiffeomorph I I M N ∞)
    (oM : ManifoldOrientation I M 4) (oN : ManifoldOrientation I N 4)
    {K V W : Set M} (hK : IsCompact K) (hV : IsCompact V)
    (hCore : K ⊆ core.source) (hExt : V ⊆ exterior.source)
    (hW : IsOpen W) (hSeam : K ∩ V ⊆ W) (hAgree : EqOn core exterior W)
    (hOverlap : core '' K ∩ exterior '' V ⊆ core '' (K ∩ V))
    (hCover : K ∪ V = univ) (hTarget : core '' K ∪ exterior '' V = univ)
    {p : M} (hp : p ∈ K)
    (hSign : Orientation.map (Fin 4)
      ((core.isLocalDiffeomorphAt I I ∞ (hCore hp)).mfderivToContinuousLinearEquiv
        (by simp)).toLinearEquiv (oM.orientation p) = oN.orientation (core p)) :
    ∃ F : M ≃ₘ⟮I, I⟯ N, F.preservesOrientation oM oN ∧
      EqOn F core K ∧ EqOn F exterior V ∧
      EqOn F.symm core.symm (core '' K) ∧ EqOn F.symm exterior.symm (exterior '' V) := by
  obtain ⟨F, U, U', hOrient, hKU, hVU, _, _, hF, hF', hInv, hInv'⟩ :=
    bourGlueMarkedInverse core exterior oM oN hK hV hCore hExt hW hSeam hAgree hOverlap
      hCover hTarget hp hSign
  exact ⟨F, hOrient, hF.mono hKU, hF'.mono hVU, hInv.mono (image_mono hKU),
    hInv'.mono (image_mono hVU)⟩

end SeamChecks

section ReturnChecks

variable {H K M N : Type*} [TopologicalSpace H] [TopologicalSpace K]
  {I : ModelWithCorners ℝ (EuclideanSpace ℝ (Fin 4)) H} [I.Boundaryless]
  {J : ModelWithCorners ℝ (EuclideanSpace ℝ (Fin 4)) K} [J.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [Nonempty M] [TopologicalSpace N] [ChartedSpace K N] [IsManifold J ∞ N]
  [T2Space N] [CompactSpace N] [Nonempty N]
  {oM : ManifoldOrientation I M 4} {oN : ManifoldOrientation J N 4}

local instance : MeasurableSpace M := borel M
local instance : BorelSpace M := ⟨rfl⟩
local instance : MeasurableSpace N := borel N
local instance : BorelSpace N := ⟨rfl⟩

-- Second pointed input. The upper bound is the actual source limit, supplied here by its liminf.
example (source : ℕ → SignedCollarMetric oM) (q : SignedCollarMetric oN)
    (Φ : M ≃ₘ⟮I, J⟯ N) (hΦ : Φ.preservesOrientation oM oN)
    (BM : SmoothRiemannianMetric I M → Prop) (BN : SmoothRiemannianMetric J N → Prop)
    (hFlat : BN q.metric) (hPull : BN q.metric → BM (Diffeomorph.pullbackMetricCross q.metric Φ))
    {y : ℝ} (hy : 0 < y) (hY : y ≤ classYamabeFour oN.dimension_eq q.metric)
    (hLimit : Tendsto (fun j => (source j).energy .plus) atTop (𝓝 (sInf (geometricPositiveEnergies oM))))
    (hLSC : q.energy .plus ≤ liminf (fun j => (source j).energy .plus) atTop) :
    let pull := q.pullbackCross Φ hΦ
    y ≤ classYamabeFour oM.dimension_eq pull.metric ∧ BM pull.metric ∧
      ∀ sign, pull.energy sign = sInf (geometricPositiveEnergies oM) := by
  rw [hLimit.liminf_eq] at hLSC
  have h := bourAttainsOfSignedPullback q Φ hΦ BM BN hFlat hPull (hy.trans_le hY) hLSC
  refine ⟨?_, h.2⟩
  rwa [SignedCollarMetric.yamabe_pullbackCross]

-- The closed branch compares all metrics on the same target before pulling the limit back.
example (source : SignedCollarMetric oM) (Φ : N ≃ₘ⟮J, I⟯ M) (hΦ : Φ.preservesOrientation oN oM)
    (G₀ : (g : SmoothRiemannianMetric J N) →
      (x : N) → DifferentialGeometry.Tensor0SBundle.Tensor0SSpace 2 J x)
    (BM : SmoothRiemannianMetric I M → Prop)
    {y : ℝ} (hy : 0 < y) (hY : y ≤ classYamabeFour oM.dimension_eq source.metric)
    (hElem : source.energy .plus = sInf (geometricPositiveEnergies oM)) :
    let limit := source.pullbackCross Φ hΦ
    BourBachFlat G₀ limit.metric →
    (BourBachFlat G₀ limit.metric → BM (Diffeomorph.pullbackMetricCross limit.metric Φ.symm)) →
    ∃ pull : SignedCollarMetric oM, y ≤ classYamabeFour oM.dimension_eq pull.metric ∧ BM pull.metric ∧
      ∀ sign, pull.energy sign = sInf (geometricPositiveEnergies oM) := by
  intro limit hFlat hTransport
  have hSource : Tendsto (fun _ : ℕ => source.energy .plus) atTop
      (𝓝 (sInf (geometricPositiveEnergies oM))) := hElem ▸ tendsto_const_nhds
  have hReturn := bourClosedReturn (fun _ => source) limit (fun _ => Φ) (fun _ => hΦ) G₀ BM
    hTransport hy (fun _ => hY) (fun _ => 0) tendsto_const_nhds hSource
    (fun _ => ⟨tendsto_const_nhds, tendsto_const_nhds⟩) tendsto_const_nhds
    (fun _ x v => by simp [show G₀ limit.metric x = 0 from hFlat x, limit])
    (fun _ => tendsto_const_nhds) (fun _ _ => tendsto_const_nhds)
    (fun _ _ => tendsto_const_nhds) (fun _ _ => tendsto_const_nhds)
  exact ⟨_, hReturn⟩

local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 5)) = 4 + 1) := ⟨by simp⟩

example {oS : ManifoldOrientation (𝓡 4) StandardFourSphere 4}
    (Φ : M ≃ₘ⟮I, 𝓡 4⟯ StandardFourSphere) (hΦ : Φ.preservesOrientation oM oS)
    (BM : SmoothRiemannianMetric I M → Prop) (BS : SmoothRiemannianMetric (𝓡 4) StandardFourSphere → Prop)
    (hf : BS standardRoundFourMetric)
    (hPull : BS standardRoundFourMetric → BM (Diffeomorph.pullbackMetricCross standardRoundFourMetric Φ)) :
    ∃ q : SignedCollarMetric oM, 0 < classYamabeFour oM.dimension_eq q.metric ∧ BM q.metric ∧
      (∀ sign, q.energy sign = 0) ∧ sInf (geometricPositiveEnergies oM) = 0 := by
  obtain ⟨hY, hFlat, hE, hI⟩ := bourRoundReturn Φ hΦ BM BS hf hPull
  exact ⟨_, hY, hFlat, fun s => (hE s).trans hI, hI⟩

end ReturnChecks

section BranchChecks

variable {H M : Type*} [TopologicalSpace H]
  {I : ModelWithCorners ℝ (EuclideanSpace ℝ (Fin 4)) H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [Nonempty M] {o : ManifoldOrientation I M 4}

local instance : MeasurableSpace M := borel M
local instance : BorelSpace M := ⟨rfl⟩

-- First pointed arm: compare at the allowed excess, and retain the Yamabe deficit.
example (start returned : SignedCollarMetric o) {α : ℝ} (hα : 0 < α)
    (hPos : 0 < classYamabeFour o.dimension_eq returned.metric)
    (hStart : start.energy .plus - sInf (geometricPositiveEnergies o) ≤ α ^ 2)
    (hBudget : 4 * returned.energy .plus ≤ 4 * sInf (geometricPositiveEnergies o) +
      4 * (start.energy .plus - sInf (geometricPositiveEnergies o)) / α +
      ((classYamabeFour o.dimension_eq start.metric) ^ 2 - 384 * Real.pi ^ 2) / 12) :
    384 * Real.pi ^ 2 - (classYamabeFour o.dimension_eq start.metric) ^ 2 ≤ 48 * α :=
  (bourFirstPointed_excess_and_deficit start returned hα hPos rfl hBudget hStart).2

-- Test the alternating first branches without selecting a single first-branch subsequence.
example (start q : ℕ → SignedCollarMetric o) (returned : SignedCollarMetric o)
    (α : ℕ → ℝ) (hα : Tendsto α atTop (𝓝 0))
    (hPos : 0 < classYamabeFour o.dimension_eq returned.metric)
    (hEnergy : returned.energy .plus ≤ sInf (geometricPositiveEnergies o)) :
    let deficit := fun j => 384 * Real.pi ^ 2 - (classYamabeFour o.dimension_eq (start j).metric) ^ 2
    let D := fun j => ∫ x, intrinsicTraceFreeRicciSq (q j).metric x
      ∂riemannianVolumeMeasure I M (q j).metric
    (∀ᶠ j in atTop, 0 ≤ deficit j) →
    (∀ᶠ j in atTop, deficit j ≤ 48 * α j ∨
      deficit j / 12 + D j ≤ 4 * sInf (geometricPositiveEnergies o) + 4 * α j) →
    4 * returned.energy .plus ≤ liminf D atTop →
    returned.energy .plus = sInf (geometricPositiveEnergies o) ∧ Tendsto deficit atTop (𝓝 0) := by
  intro deficit D hNonneg hArms hRicci
  have hRound : ∀ᶠ j in atTop, (classYamabeFour o.dimension_eq (start j).metric) ^ 2 ≤
      384 * Real.pi ^ 2 := hNonneg.mono fun _ h => sub_nonneg.mp h
  have hBranches := hArms.mono fun j h => h.imp_right (fun hClosed => show
      D j ≤ 4 * sInf (geometricPositiveEnergies o) + 4 * α j +
        ((classYamabeFour o.dimension_eq (start j).metric) ^ 2 - 384 * Real.pi ^ 2) / 12 by
    dsimp only [deficit] at hClosed
    linarith only [hClosed])
  obtain ⟨hEq, hY⟩ := bourMixedPointed_startYamabeSq_tendsto start q returned α hα hPos
    hEnergy hRound hBranches hRicci
  refine ⟨hEq, ?_⟩
  have hDef : Tendsto deficit atTop (𝓝 ((384 * Real.pi ^ 2 : ℝ) - 384 * Real.pi ^ 2)) :=
    tendsto_const_nhds.sub hY
  rwa [sub_self] at hDef

end BranchChecks

section FixedReturnBudgetChecks

open SmoothPoincare.Bour

variable {H M : Type*} [TopologicalSpace H]
  {I : ModelWithCorners ℝ (EuclideanSpace ℝ (Fin 4)) H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [Nonempty M] {o : ManifoldOrientation I M 4}

local instance : MeasurableSpace M := borel M
local instance : BorelSpace M := ⟨rfl⟩

example {P : Type*} [TopologicalSpace P] {α p : ℝ} {s : P}
    (f : OriginalTrajectory o α s) (q : SignedCollarMetric o) (hr : ReturnedMeasurements f q p)
    (hα : 0 < α) (he : f.excess ≤ α ^ 2) (hb : ∀ t, TimeBudget f t)
    (hY : 0 < classYamabeFour o.dimension_eq q.metric) (hEuler : bourEuler q = 16 * Real.pi ^ 2) :
    (∀ sign, sInf (geometricPositiveEnergies o) ≤ q.energy sign ∧
      q.energy sign ≤ f.energy s / (1 - α)) ∧ p ∈ Icc 0 α := by
  obtain ⟨hL, hU, hp, hp', _⟩ := fixedReturn_budget f q hr hα he hb hY hEuler
  refine ⟨?_, ⟨hp, hp'⟩⟩
  intro sign
  cases sign with
  | plus => exact ⟨hL, hU⟩
  | minus =>
    rw [← q.signature_zero]
    exact ⟨hL, hU⟩

example {P : ℕ → Type*} [∀ j, TopologicalSpace (P j)] {α p : ℕ → ℝ} {s : ∀ j, P j}
    (f : ∀ j, OriginalTrajectory o (α j) (s j)) (q : ℕ → SignedCollarMetric o)
    (hα : Tendsto α atTop (𝓝 0)) (hPos : ∀ j, 0 < α j)
    (hExcess : ∀ j, (f j).excess ≤ α j ^ 2)
    (hBud : ∀ᶠ j in atTop, ∀ t, TimeBudget (f j) t)
    (hReturn : ∀ᶠ j in atTop, ReturnedMeasurements (f j) (q j) (p j))
    (hY : ∀ᶠ j in atTop, 0 < classYamabeFour o.dimension_eq (q j).metric)
    (hEuler : ∀ j, bourEuler (q j) = 16 * Real.pi ^ 2) :
    Tendsto (fun j => (q j).energy .minus) atTop (𝓝 (sInf (geometricPositiveEnergies o))) ∧
      Tendsto p atTop (𝓝 0) := by
  obtain ⟨hE, hp⟩ := mixedReturn_energy_and_parameter f q hα hPos hExcess hBud hReturn hY hEuler
  exact ⟨hE .minus, hp⟩

end FixedReturnBudgetChecks

section StationaryChecks

open DifferentialGeometry.Geometry.Operator

variable {H M : Type*} [TopologicalSpace H]
  {I : ModelWithCorners ℝ (EuclideanSpace ℝ (Fin 4)) H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [Nonempty M]

local instance : MeasurableSpace M := borel M
local instance : BorelSpace M := ⟨rfl⟩

example (g : SmoothRiemannianMetric I M) (x : M) {r : ℝ} (hr : 0 < r) (hr₁ : r ≤ 1)
    (hCut : ∀ x r, 0 < r → r ≤ 1 →
      8 * Real.sqrt (bourBallVolume g x (r / 2)) ≤ (24 / r ^ 2 + 8) * bourBallVolume g x r) :
    r ^ 4 / 256 ≤ bourBallVolume g x r := by
  convert bourBallVolume_lower_of_cutoff (by simp) g (by norm_num : (0 : ℝ) < 8)
      (by norm_num : (0 : ℝ) ≤ 8) hCut x hr hr₁ using 1 <;> ring

example (g : SmoothRiemannianMetric I M) {y R : ℝ} (hy : 0 < y)
    (hY : y ≤ classYamabeFour (by simp) g) (hR : ∀ x, metricScalarAt g x = R)
    (f : C^∞⟮I, M; ℝ⟯) (hf : ∀ x, 0 ≤ f x) :
    let h := scaleMetric 2 (by norm_num) g
    y * Real.sqrt (capFactorVolume h f) ≤
      6 * (∫ x, normGradSqFun h f x ∂riemannianVolumeMeasure I M h) +
        R / 2 * ∫ x, f x ^ 2 ∂riemannianVolumeMeasure I M h :=
  bourYamabe_smooth_test_scale (by simp) g hy hY hR (by norm_num) f hf

example [PreconnectedSpace M] (g : SmoothRiemannianMetric I M) {y R C : ℝ} (hy : 0 < y)
    (hY : y ≤ classYamabeFour (by simp) g) (hR : ∀ x, metricScalarAt g x = R)
    (hR₀ : 0 ≤ R) (hRC : R ≤ C) :
    ∀ a ≥ 1, ∀ ha : 0 < a, ∀ x : M, ∀ r : ℝ, 0 < r → r ≤ 1 →
      (y / (4 * (6 * bourCutoffSlope ^ 2 + C))) ^ 2 * r ^ 4 ≤
        bourBallVolume (scaleMetric a ha g) x r := by
  intro a ha₁ ha x r hr hr₁
  exact bourBallVolume_lower_of_yamabe_scale (by simp) g hy hY hR hR₀ hRC ha ha₁ x hr hr₁

end StationaryChecks

section DissipationChecks

open DifferentialGeometry.Tensor0SBundle SmoothPoincare.Bour

variable {H M : Type*} [TopologicalSpace H]
  {I : ModelWithCorners ℝ (EuclideanSpace ℝ (Fin 4)) H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M]

local instance : MeasurableSpace M := borel M
local instance : BorelSpace M := ⟨rfl⟩
local instance : IsManifold I 1 M := IsManifold.of_le (by decide : (1 : ℕ∞ω) ≤ ⊤)

-- The unit backward interval for a metric rescaled by two uses one quarter
-- of a unit of original time, and the physical squared-gradient integrals agree.
example (g : ℝ → SmoothRiemannianMetric I M)
    (G : ℝ → (x : M) → Tensor0SSpace (𝕜 := ℝ) (I := I) 2 x) (t₀ : ℝ) :
    (∫ s in (-1 : ℝ)..0, gradientSq (scaleMetric 2 (by norm_num) (g (s / 4 + t₀)))
      (fun x => (2 : ℝ)⁻¹ • G (s / 4 + t₀) x)) =
      ∫ t in (t₀ - 1 / 4)..t₀, gradientSq (g t) (G t) := by
  have h := parabolic_dissipation_eq (by simp) g G (by norm_num : (0 : ℝ) < 2) t₀ (-1) 0
  norm_num at h
  rw [show t₀ - 1 / 4 = -(1 / 4) + t₀ by ring]
  simpa only [one_div] using h

end DissipationChecks

section VariationChecks

variable {H M : Type*} [TopologicalSpace H]
  {I : ModelWithCorners ℝ (EuclideanSpace ℝ (Fin 4)) H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [Nonempty M] {o : ManifoldOrientation I M 4}

local instance : MeasurableSpace M := borel M
local instance : BorelSpace M := ⟨rfl⟩

example (v : BourPositiveMetricVariation o)
    (hNegative : deriv (deriv (fun t => (v.path t).energy .minus)) 0 < 0) :
    (v.path 0).energy .plus ≠ sInf (geometricPositiveEnergies o) ∧
      ∀ ε > 0, ∃ t ∈ v.domain.regular, |t| < ε ∧
        0 < classYamabeFour o.dimension_eq (v.path t).metric ∧
        (v.path t).energy .plus < (v.path 0).energy .plus := by
  obtain ⟨hNotMin, hSmall⟩ := bourNegativeSecondVariationExcludesAttainment v .minus hNegative
  refine ⟨hNotMin, fun ε hε => ?_⟩
  obtain ⟨t, ht, hClose, hPos, hDecrease⟩ := hSmall ε hε
  exact ⟨t, ht, hClose, hPos, hDecrease .plus⟩

end VariationChecks

#print axioms SmoothPoincare.Bour.bourEuler_eq_charges
#print axioms SmoothPoincare.Bour.bourStrictSublevel_yamabeFloor
#print axioms SmoothPoincare.Bour.bourOriginalFlow_budget
#print axioms SmoothPoincare.Bour.eventually_bourOriginalFlow_budget
#print axioms SmoothPoincare.Bour.bourStandardRound_charge_values
#print axioms SmoothPoincare.exists_bourYamabeStarts
#print axioms SmoothPoincare.bourWholeCoreComparison
#print axioms SmoothPoincare.bourPointedTraceFreeRicci_le_liminf
#print axioms SmoothPoincare.bourPointedTraceFreeRicci_real_le_liminf
#print axioms SmoothPoincare.bourPointedSignedWeyl_le_liminf
#print axioms SmoothPoincare.bourOneEuclideanEnd
#print axioms SmoothPoincare.bourSignedEndEnergy
#print axioms SmoothPoincare.bourCappedExterior_both_lt
#print axioms SmoothPoincare.bourGlueMarkedInverse
#print axioms SmoothPoincare.bourAttainsOfSignedPullback
#print axioms SmoothPoincare.bourBachFlat_of_criticalLimit
#print axioms SmoothPoincare.bourClosedReturn
#print axioms SmoothPoincare.bourRoundReturn
#print axioms SmoothPoincare.bourFirstPointed_excess_and_deficit
#print axioms SmoothPoincare.bourMixedPointed_startYamabeSq_tendsto
#print axioms SmoothPoincare.Bour.fixedReturn_budget
#print axioms SmoothPoincare.Bour.mixedReturn_energy_and_parameter
#print axioms SmoothPoincare.Bour.mixedReturn_pointed_saturation
#print axioms SmoothPoincare.bourBallVolume_lower_of_cutoff
#print axioms SmoothPoincare.bourYamabe_smooth_test_scale
#print axioms SmoothPoincare.bourBallVolume_lower_of_yamabe_scale
#print axioms SmoothPoincare.Bour.energy_drop_eq_two_dissipation
#print axioms SmoothPoincare.Bour.metricVelocity_scale_time
#print axioms SmoothPoincare.Bour.parabolic_dissipation_eq
#print axioms SmoothPoincare.Bour.volume_constant_of_scale_variation
#print axioms SmoothPoincare.bourAttainedVariation
#print axioms SmoothPoincare.bourNegativeSecondVariationExcludesAttainment
#print axioms SmoothPoincare.bourRoundAttainedVariation
#print axioms SmoothPoincare.bourRoundScalingVariation
