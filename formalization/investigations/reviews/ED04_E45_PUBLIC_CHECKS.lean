import SmoothPoincare

/-! Independent public applications for FOT-E45. -/

set_option autoImplicit false

section FiniteEnergyChecks

open Filter MeasureTheory Set SmoothPoincare.IntrinsicEntry
open scoped Topology

example (l : ℕ) (w : ℝ → ℝ) (hDiff : ∀ t ∈ Ioi 0, DifferentiableAt ℝ w t)
    (hE : IntegrableOn (fun t ↦ (deriv w t) ^ 2 + ((l : ℝ) + 1) ^ 2 * (w t) ^ 2) (Ioi 0)) :
    Tendsto w atTop (𝓝 0) :=
  roundCylinderMode_tendsto_zero_of_finiteEnergy l w hDiff hE

example (w : ℝ → ℝ) (hTrace : w 0 = -3) (hRight : ContinuousWithinAt w (Ici 0) 0)
    (hDiff : ∀ t ∈ Ioi 0, DifferentiableAt ℝ w t)
    (hE : IntegrableOn (fun t ↦ (deriv w t) ^ 2 + 3 ^ 2 * (w t) ^ 2) (Ioi 0)) :
    RoundCylinderModeAdmissible 2 (-3) w :=
  (roundCylinderModeAdmissible_iff_finiteEnergy 2 (-3) w).2
    ⟨hTrace, hRight, hDiff, by norm_num at hE ⊢; exact hE⟩

example : sInf (roundCylinderModeEnergy 2 '' {w | w 0 = -3 ∧
    ContinuousWithinAt w (Ici 0) 0 ∧ (∀ t ∈ Ioi 0, DifferentiableAt ℝ w t) ∧
    IntegrableOn (fun t ↦ (deriv w t) ^ 2 + 9 * (w t) ^ 2) (Ioi 0)}) = 162 := by
  have h := roundCylinderMode_finiteEnergy_inf_eq 2 (-3)
  norm_num at h ⊢
  exact h

end FiniteEnergyChecks

section MixedFaceJetChecks

open Set SmoothPoincare
open scoped ContDiff

variable {A : Type*} [NormedAddCommGroup A] [NormedSpace ℝ A]

example {U : Set (A × ℝ)} (hU : IsOpen U) {D : A × ℝ → ℝ} (hD : ContDiffOn ℝ ∞ D U)
    (s wL wR : ℝ) {z : A × ℝ} (hz : z ∈ U) (v w : A) :
    let θ := exactFaceJetWeight s wL wR
    let N := exactFaceCoordinateSplice s wL wR D
    fderiv ℝ (fderiv ℝ N) z (v, 0) (w, 0) =
      θ z.2 * fderiv ℝ (fderiv ℝ D) z (v, 0) (w, 0) := by
  simpa using (exactFaceCoordinateSplice_two_jets hU hD s wL wR hz (v, 0) (w, 0)).2

example {U : Set (A × ℝ)} (hU : IsOpen U) {D : A × ℝ → ℝ} (hD : ContDiffOn ℝ ∞ D U)
    (s wL wR : ℝ) {z : A × ℝ} (hz : z ∈ U) (v : A) :
    let θ := exactFaceJetWeight s wL wR
    let N := exactFaceCoordinateSplice s wL wR D
    fderiv ℝ (fderiv ℝ N) z (v, 0) (0, 1) =
      θ z.2 * fderiv ℝ (fderiv ℝ D) z (v, 0) (0, 1) +
        deriv θ z.2 * fderiv ℝ D z (v, 0) := by
  simpa using (exactFaceCoordinateSplice_two_jets hU hD s wL wR hz (v, 0) (0, 1)).2

example {U : Set (A × ℝ)} (hU : IsOpen U) {D : A × ℝ → ℝ} (hD : ContDiffOn ℝ ∞ D U)
    (hFace : ∀ x : A, (x, 0) ∈ U → D (x, 0) = 0) {a : A} (ha : (a, 0) ∈ U)
    (hNormal : fderiv ℝ D (a, 0) (0, 1) = 0) : fderiv ℝ D (a, 0) = 0 :=
  fderiv_eq_zero_of_exactFace hU hD hFace ha hNormal

end MixedFaceJetChecks

section VolumeChecks

open DifferentialGeometry DifferentialGeometry.Integral.Measure Manifold MeasureTheory Set SmoothPoincare
open scoped ContDiff Manifold

local notation "RoundTubeModel" => ModelWithCorners.prod (𝓡 3) (𝓘(ℝ))
local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 4)) = 3 + 1) := ⟨by simp⟩
local instance : MeasurableSpace ExactFaceTube := borel ExactFaceTube
local instance : BorelSpace ExactFaceTube := ⟨rfl⟩

example : (riemannianVolumeMeasure RoundTubeModel ExactFaceTube exactFaceRoundCylinder).real
    (univ ×ˢ Icc (-2 : ℝ) 3) = 5 * exactFaceAngularArea := by
  rw [exactFaceRoundCylinder_strip_volume (by norm_num : (-2 : ℝ) ≤ 3)]
  norm_num

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M]

local instance : MeasurableSpace M := borel M
local instance : BorelSpace M := ⟨rfl⟩

example (F : PartialDiffeomorph RoundTubeModel I ExactFaceTube M ∞)
    (g : SmoothRiemannianMetric I M) (u : C^∞⟮I, M; ℝ⟯) {WL WR : ℝ}
    (hS : exactFaceSlab WL WR ⊆ F.source) :
    ∃ R : SmoothRiemannianMetric I M, ∀ {wL wR : ℝ}
      (hL : 0 < wL) (hR : 0 < wR) (hwL : wL ≤ WL) (hwR : wR ≤ WR) (s : Icc (0 : ℝ) 1),
      (riemannianVolumeMeasure I M (exactFacePhysicalPath F g R u hL hR
        ((exactFaceSlab_mono hwL hwR).trans hS) s)).real (F '' (univ ×ˢ Icc (0 : ℝ) 0)) = 0 := by
  obtain ⟨R, V, _, _, applyBound⟩ := exists_exactFacePhysical_stripVolume F g u hS
  refine ⟨R, fun hL hR hwL hwR s => le_antisymm ?_ measureReal_nonneg⟩
  simpa using applyBound hL hR hwL hwR s (a := 0) (b := 0) (by linarith) le_rfl (by linarith)

variable {H4 N : Type*} [TopologicalSpace H4]
  {I4 : ModelWithCorners ℝ (EuclideanSpace ℝ (Fin 4)) H4} [I4.Boundaryless]
  [TopologicalSpace N] [ChartedSpace H4 N] [IsManifold I4 ∞ N] [T2Space N] [CompactSpace N]
  {o : ManifoldOrientation I4 N 4}

example (F : PartialDiffeomorph RoundTubeModel I4 ExactFaceTube N ∞)
    (g : SmoothRiemannianMetric I4 N) (u : C^∞⟮I4, N; ℝ⟯) {WL WR : ℝ}
    (hS : exactFaceSlab WL WR ⊆ F.source) :
    ∃ R : SmoothRiemannianMetric I4 N, ∀ {wL wR : ℝ}
      (hL : 0 < wL) (hR : 0 < wR) (hwL : wL ≤ WL) (hwR : wR ≤ WR) (s : Icc (0 : ℝ) 1)
      (q : SignedCollarMetric o),
      q.metric = exactFacePhysicalPath F g R u hL hR ((exactFaceSlab_mono hwL hwR).trans hS) s →
      (∀ sign, q.charge sign (F '' (univ ×ˢ Icc (0 : ℝ) 0)) = 0) := by
  obtain ⟨R, _, _, _, hBound⟩ := exists_exactFacePhysical_stripCharge (o := o) F g u hS
  exact ⟨R, fun hL hR hwL hwR s q hq sign => (hBound hL hR hwL hwR s q hq sign).1⟩

end VolumeChecks

section PairedChargeChecks

open FirstOrderTwistor SectionsAndConnections SmoothPoincare

example (R : CurvatureFrameTensor) :
    hilbertSchmidtSq (traceFreeChiralBlock (selfDualCurvatureBlock R)) +
      hilbertSchmidtSq (traceFreeChiralBlock (antiSelfDualCurvatureBlock R)) ≤ frameTensorNormSq R :=
  pairedChiralBlocks_le_frameTensor R

end PairedChargeChecks

section MarkedWidthChecks

open DifferentialGeometry Manifold Set SmoothPoincare.PositiveScalarCuts
open scoped ContDiff Manifold

variable {E H M F G Y : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [NormedAddCommGroup F] [NormedSpace ℝ F] [TopologicalSpace G] {J : ModelWithCorners ℝ F G}
  [TopologicalSpace Y] [ChartedSpace G Y] [IsManifold J ∞ Y] [Nonempty Y]

local notation "ProductModel" => J.prod 𝓘(ℝ)

example (g : SmoothRiemannianMetric I M) (Φ : PartialDiffeomorph ProductModel I (Y × ℝ) M ∞)
    (hBand : univ ×ˢ Icc (-2 : ℝ) 3 ⊆ Φ.source)
    (hLower : ∀ p ∈ univ ×ˢ Icc (-2 : ℝ) 3, ∀ v : TangentSpace ProductModel p,
      v.2 ^ 2 ≤ g.inner (Φ p) (mfderiv ProductModel I Φ p v) (mfderiv ProductModel I Φ p v))
    (hVertical : ∀ p ∈ univ ×ˢ Icc (-2 : ℝ) 3, ∀ s : ℝ,
      g.inner (Φ p) (mfderiv ProductModel I Φ p (0, s)) (mfderiv ProductModel I Φ p (0, s)) = s ^ 2) :
    let band := Φ '' (univ ×ˢ Icc (-2 : ℝ) 3)
    let lower := Φ '' (univ ×ˢ {(-2 : ℝ)})
    let upper := Φ '' (univ ×ˢ {(3 : ℝ)})
    markedBandEWidth g band lower upper = ENNReal.ofReal 5 ∧
      ∃ γ : ℝ → M, ContMDiffOn 𝓘(ℝ) I 1 γ (Icc (0 : ℝ) 1) ∧
        MapsTo γ (Icc (0 : ℝ) 1) band ∧ γ 0 ∈ lower ∧ γ 1 ∈ upper ∧
        markedBandPathELength g γ = ENNReal.ofReal 5 := by
  have h := markedBandEWidth_and_attainment g Φ (by norm_num : (-2 : ℝ) ≤ 3)
    hBand hLower hVertical
  norm_num at h ⊢
  exact h

end MarkedWidthChecks

section FiniteMismatchChecks

open DifferentialGeometry FirstOrderTwistor Manifold Set SmoothPoincare
open scoped ContDiff Manifold

example : connectorMismatchFloor 16 1 ((optimalConnectorRadius 9 16 1) ^ 2) = 4 := by
  have h16 : Real.sqrt 16 = 4 := by
    convert Real.sqrt_sq (show 0 ≤ (4 : ℝ) by norm_num) using 1
    norm_num
  have h9 : Real.sqrt 9 = 3 := by
    convert Real.sqrt_sq (show 0 ≤ (3 : ℝ) by norm_num) using 1
    norm_num
  calc
    _ = 16 / (4 * 1) := optimalConnectorFloor_of_interior (by norm_num) (by norm_num)
      (by rw [h16, h9]; norm_num)
    _ = _ := by norm_num

example : connectorMismatchFloor 16 1 ((optimalConnectorRadius 1 16 1) ^ 2) = 3 := by
  have h16 : Real.sqrt 16 = 4 := by
    convert Real.sqrt_sq (show 0 ≤ (4 : ℝ) by norm_num) using 1
    norm_num
  norm_num [optimalConnectorRadius, connectorMismatchFloor, h16, min_eq_left]

example : connectorMismatchFloor 16 0 ((optimalConnectorRadius 9 16 0) ^ 2) = 12 := by
  have h16 : Real.sqrt 16 = 4 := by
    convert Real.sqrt_sq (show 0 ≤ (4 : ℝ) by norm_num) using 1
    norm_num
  have h9 : Real.sqrt 9 = 3 := by
    convert Real.sqrt_sq (show 0 ≤ (3 : ℝ) by norm_num) using 1
    norm_num
  norm_num [optimalConnectorRadius, connectorMismatchFloor, h16, h9]

local notation "E4" => EuclideanSpace ℝ (Fin 4)
local notation "I4" => 𝓘(ℝ, E4)

variable {H N : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E4 H} [I.Boundaryless]
  [TopologicalSpace N] [ChartedSpace H N] [IsManifold I ∞ N] [T2Space N] [CompactSpace N] [Nonempty N]
  {o : ManifoldOrientation I N 4}

example (source cap : SignedCollarMetric o) (F : PartialDiffeomorph I4 I E4 N ∞)
    (hF : Metric.closedBall (0 : E4) 1 ⊆ F.source) {A b j w : ℝ}
    (hA : 0 ≤ A) (hb : 0 ≤ b) (hw : 0 < w)
    (hp : 0 < classYamabeFour o.dimension_eq cap.metric)
    (hCost : cap.energy .minus ≤ source.charge .minus (interior (selectedChartDisk F))ᶜ + j +
      (A / Real.sqrt w + b * Real.sqrt w) ^ 2) :
    connectorMismatchFloor (source.charge .minus (selectedChartDisk F) -
      (source.energy .plus - sInf (geometricPositiveEnergies o)) - j) b w ≤ A :=
  originalDisk_mismatch_at_width source cap F hF .minus hA hb hw hp hCost

end FiniteMismatchChecks

section ConnectorProfileChecks

open MeasureTheory Set SmoothPoincare

example {Y : Type*} [MeasurableSpace Y] (μ : Measure Y) [SFinite μ]
    (d : Y → ℝ) (profile : ℝ → ℝ) :
    (∫ p in univ ×ˢ Icc (0 : ℝ) 2, ‖connectorLeadingField d profile 2 p‖ ^ 2 ∂μ.prod volume) =
      (∫ y, ‖d y‖ ^ 2 ∂μ) * (∫ t in Icc (0 : ℝ) 1, (profile t) ^ 2) / 8 := by
  have h := connectorLeadingField_energy μ d profile (w := 2) (by norm_num)
  norm_num at h ⊢
  exact h

end ConnectorProfileChecks

section CoupledRepairChecks

open DifferentialGeometry FirstOrderTwistor Manifold Set SmoothPoincare
open scoped ContDiff Manifold

local notation "E4" => EuclideanSpace ℝ (Fin 4)
local notation "I4" => 𝓘(ℝ, E4)

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E4 H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [CompactSpace M] [Nonempty M]
  {o : ManifoldOrientation I M 4} {g : SignedCollarMetric o}
  {F : PartialDiffeomorph I4 I E4 M ∞} {A : Set M} {h p q : ℝ → SignedCollarMetric o}

example (d : SignedCoupledIsolation g F A h p q) (t : ℝ) :
    isolationInteraction g (h t) (p t) (q t) A .plus =
      isolationInteraction g (h t) (p t) (q t) A .minus :=
  d.interaction_signature t

example (d : SignedCoupledIsolation g F A h p q) (cap : SignedCollarMetric o)
    (hCap : 0 < classYamabeFour o.dimension_eq cap.metric)
    (hExterior : ∀ sign, cap.charge sign (interior (selectedChartDisk F))ᶜ =
      (h 1).charge sign (interior (selectedChartDisk F))ᶜ)
    {K : Set M} (hK : K ⊆ selectedChartDisk F \ A)
    (hFixed : ∀ sign, (h 1).charge sign K = g.charge sign K) (sign : CollarChirality) :
    sInf (geometricPositiveEnergies o) + g.charge sign K ≤
      (h 1).energy .plus + cap.charge sign (selectedChartDisk F) := by
  have hCore := d.endpoint_energy_leavingProtectedCore cap hCap hExterior hK hFixed sign
  linarith only [hCore]

example (d : SignedCoupledIsolation g F A h p q) (cap : SignedCollarMetric o)
    (hCap : 0 < classYamabeFour o.dimension_eq cap.metric)
    (hExterior : ∀ sign, cap.charge sign (interior (selectedChartDisk F))ᶜ =
      (h 1).charge sign (interior (selectedChartDisk F))ᶜ)
    (pWall : IsolatedYamabeWall g p) (qWall : IsolatedYamabeWall g q)
    (hg : 0 < classYamabeFour o.dimension_eq g.metric) (he : g.energy .plus < 2 * (4 * Real.pi ^ 2))
    {Hpeak : ℝ} (hPeak : ∀ t ∈ Icc (0 : ℝ) 1, (h t).energy .plus ≤ Hpeak)
    (hCross : ∃ t ∈ Icc (0 : ℝ) 1, 2 * (4 * Real.pi ^ 2) ≤ max ((p t).energy .plus) ((q t).energy .plus)) :
    ∃ t ∈ Ioc (0 : ℝ) 1,
      max ((p t).energy .plus) ((q t).energy .plus) = 2 * (4 * Real.pi ^ 2) ∧
      ∀ sign, 2 * (4 * Real.pi ^ 2) - (g.energy .plus - sInf (geometricPositiveEnergies o)) - Hpeak ≤
        isolationInteraction g (h t) (p t) (q t) A sign := by
  rcases d.firstWall_or_endpointCost cap hCap hExterior pWall qWall hg he hPeak with under | hit
  · obtain ⟨t, ht, hw⟩ := hCross
    exact False.elim (hw.not_gt (under.1 t ht).1)
  · obtain ⟨t, ht, hWall, _, hCost⟩ := hit
    exact ⟨t, ht, hWall, fun sign => (hCost sign).2⟩

end CoupledRepairChecks

section CapTransplantChecks

open DifferentialGeometry Manifold Set SmoothPoincare
open scoped ContDiff Manifold Topology

variable {E F H K M X : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
  [TopologicalSpace H] [TopologicalSpace K]
  {I : ModelWithCorners ℝ E H} {J : ModelWithCorners ℝ F K}
  [I.Boundaryless] [J.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [CompactSpace M]
  [TopologicalSpace X] [ChartedSpace K X] [IsManifold J ∞ X] [T2Space X] [CompactSpace X]

example (g : SmoothRiemannianMetric I M) (q : SmoothRiemannianMetric J X)
    (mark : PartialDiffeomorph I J M X ∞)
    (hIsometry : ∀ x ∈ mark.source, ∀ v w : TangentSpace I x,
      g.inner x v w = q.inner (mark x) (mfderiv I J mark x v) (mfderiv I J mark x w))
    (k : C^∞⟮J, X; ℝ⟯) (hk : ∀ y, 0 ≤ k y) (hSupport : tsupport k ⊆ mark.target) :
    ∃ f : C^∞⟮I, M; ℝ⟯, EqOn f 0 mark.sourceᶜ ∧ tsupport f = mark.symm '' tsupport k ∧
      capFactorScalar g f = capFactorScalar q k ∧ capFactorVolume g f = capFactorVolume q k := by
  obtain ⟨f, _, _, hZero, hSupp, hScalar, hVolume⟩ := exists_markedCoreTestTransplant g q mark hIsometry k hk hSupport
  exact ⟨f, hZero, hSupp, hScalar, hVolume⟩

end CapTransplantChecks

section RelativePairChecks

open DifferentialGeometry.Topology SmoothPoincare.RelativePairReplacement

variable {X X' Y Y' Q U : Type*} [TopologicalSpace X] [TopologicalSpace X']
  [TopologicalSpace Y] [TopologicalSpace Y'] [TopologicalSpace Q] [TopologicalSpace U]

example (F : X ≃ₜ X') (e : Y ≃ₜ Y') (γ : Y ≃ₜ U)
    (j : Y → X) (j' : Y' → X') (k : U → Q) (hF : ∀ y, F (j y) = j' (e y)) (q : Q) :
    let G := pairMoveClosedHomeomorph F e γ j j' k hF
    let γ' := e.symm.trans γ
    G (adjunctionLower (k ∘ γ) q) = adjunctionLower (k ∘ γ') q ∧
      G.symm (adjunctionLower (k ∘ γ') q) = adjunctionLower (k ∘ γ) q := by
  have h := pairMoveClosed_representatives F e γ j j' k hF
  exact ⟨h.2.2.1 q, h.2.2.2.1 q⟩

end RelativePairChecks

section TerminalPairChecks

open Set Manifold DifferentialGeometry.Topology DifferentialGeometry.Topology.Morse
open SmoothPoincare.RelativePairReplacement
open scoped ContDiff Manifold

variable {H M : Type*} [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {I : ModelWithCorners ℝ (Fin 4 → ℝ) H} [I.Boundaryless] [IsManifold I ∞ M]
  [BoundarylessManifold I M] [T2Space M] [CompactSpace M] [DecidableEq M]

example {f : M → ℝ} {a b l₀ r₀ l₁ r₁ : ℝ} {p₀ q₀ p₁ q₁ : M}
    (hf : MorseStrip I f a b) (ha : a ≤ l₀) (hb : r₁ ≤ b) (hsep : r₀ < l₁)
    (hreg₀ : ∀ x, f x = l₀ ∨ f x = r₀ → ¬ IsCriticalPointAt I f x)
    (hreg₁ : ∀ x, f x = l₁ ∨ f x = r₁ → ¬ IsCriticalPointAt I f x)
    (hpair₀ : isCancellingPair I f l₀ r₀ p₀ q₀) (hp₀ : morseIndex I f p₀ = 2)
    (hNext : ∀ g, ModifiedWithin f l₀ r₀ g → MorseStrip I g a b →
      isCancellingPair I g l₁ r₁ p₁ q₁ ∧ morseIndex I g p₁ = 2)
    (hFinite : {x | IsCriticalPointAt I f x}.Finite) (hWidth : l₁ < r₁)
    (hCount2 : {x | IsCriticalPointAt I f x ∧ morseIndex I f x = 2}.ncard = 3)
    (hCount3 : {x | IsCriticalPointAt I f x ∧ morseIndex I f x = 3}.ncard = 3) :
    ∃ h : M → ℝ, ModifiedWithin f l₀ r₁ h ∧ MorseStrip I h a b ∧
      {x | IsCriticalPointAt I h x ∧ morseIndex I h x = 2}.ncard = 1 ∧
      {x | IsCriticalPointAt I h x ∧ morseIndex I h x = 3}.ncard = 1 ∧
      (∀ t, r₀ ≤ t → t ≤ l₁ → h ⁻¹' {t} = f ⁻¹' {t} ∧ h ⁻¹' Iic t = f ⁻¹' Iic t) := by
  obtain ⟨h, hmod, hMorse, _, hTwo, hThree, hLevels⟩ :=
    exists_terminalPairReduction hf ha hb hsep hreg₀ hreg₁ hpair₀ hp₀ hNext hFinite hWidth
  simp only [SmoothPoincare.nativeMorseIndexSet] at hTwo hThree
  exact ⟨h, hmod, hMorse, by omega, by omega, hLevels⟩

end TerminalPairChecks

section TransportedDiskChecks

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature DifferentialGeometry.Integral.Measure
open FirstOrderTwistor SectionsAndConnections Manifold MeasureTheory Set SmoothPoincare
open scoped ContDiff Manifold

local notation "E4" => EuclideanSpace ℝ (Fin 4)
local notation "I4" => 𝓘(ℝ, E4)

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E4 H} [I.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M] [CompactSpace M]
  [Nonempty M] [PathConnectedSpace M] {o : ManifoldOrientation I M 4}

local instance : MeasurableSpace M := borel M
local instance : BorelSpace M := ⟨rfl⟩

example (g flat : SignedCollarMetric o) (F : PartialDiffeomorph I4 I E4 M ∞)
    (hF : Metric.closedBall (0 : E4) 1 ⊆ F.source) (φ : M ≃ₘ⟮I, I⟯ M)
    (hφ : φ.preservesOrientation o o) (u : C^∞⟮I, M; ℝ⟯)
    (hFlat : ∀ x ∈ φ '' selectedChartDisk F, metricRm04At flat.metric x = 0)
    (hPositive : 0 < classYamabeFour o.dimension_eq flat.metric) :
    let q := (flat.conformal u).pullback φ hφ
    let D := selectedChartDisk F
    let V := (interior D)ᶜ
    let increment := flat.energy .plus - g.energy .plus
    0 < classYamabeFour o.dimension_eq q.metric ∧
      ∀ sign, q.charge sign D = 0 ∧ q.charge sign V - g.charge sign V = g.charge sign D + increment ∧
        ∀ K ⊆ D, q.charge sign K = 0 := by
  have h := chargedDisk_flatPocket_transport g flat F hF φ hφ u hFlat hPositive
  refine ⟨h.1, fun sign => ?_⟩
  exact ⟨(h.2.2 sign).1, (h.2.2 sign).2.2⟩

example (g q : SignedCollarMetric o) (F : PartialDiffeomorph I4 I E4 M ∞)
    (hF : Metric.closedBall (0 : E4) 1 ⊆ F.source) (sign : CollarChirality)
    {A : Set M} (hA : MeasurableSet A) (hAV : A ⊆ (interior (selectedChartDisk F))ᶜ)
    (hOutside : q.charge sign ((interior (selectedChartDisk F))ᶜ \ A) =
      g.charge sign ((interior (selectedChartDisk F))ᶜ \ A))
    (hZero : q.charge sign (selectedChartDisk F) = 0) {η D : ℝ}
    (hSlack : g.energy .plus - η ≤ q.energy .plus) (hGap : η < g.charge sign (selectedChartDisk F))
    (hDensity : ∀ x ∈ A, hilbertSchmidtSq (signedCollarWeylBlock o q.metric q.frame sign x) ≤ D) :
    0 < D * (riemannianVolumeMeasure I M q.metric).real A := by
  have hPrice := transportedDisk_outerStrip_price g q F hF sign hA hAV hOutside hZero hSlack hDensity
  exact (add_pos_of_pos_of_nonneg (sub_pos.mpr hGap) (measureReal_nonneg (μ := g.chiralMeasure sign))).trans_le hPrice

end TransportedDiskChecks

section NativePocketChecks

open DifferentialGeometry DifferentialGeometry.Geometry DifferentialGeometry.Geometry.Curvature
open Manifold Set SmoothPoincare
open scoped ContDiff Manifold

local notation "E4" => EuclideanSpace ℝ (Fin 4)
local notation "I4" => 𝓘(ℝ, E4)

example : nativePocketCutoff 1 (0 : E4) = 1 :=
  nativePocketCutoff_eq_one (by norm_num) (by simp)

variable {H M : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E4 H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]

example (F : PartialDiffeomorph I4 I E4 M ∞) (g R : SmoothRiemannianMetric I M)
    {r : ℝ} (hr : 0 < r) (hS : Metric.closedBall (0 : E4) (3 * r) ⊆ F.source)
    (hMatch : ∀ x ∈ Metric.ball (0 : E4) (2 * r), ∀ v w : E4,
      (euclideanMetric E4).inner x v w = R.inner (F x)
        (mfderiv I4 I (F : E4 → M) x v) (mfderiv I4 I (F : E4 → M) x w)) :
    metricRm04At (nativePocketPath F g R hr hS ⟨1, zero_le_one, le_rfl⟩) (F 0) = 0 := by
  have hCentre : (0 : E4) ∈ Metric.ball (0 : E4) (2 * r) := by
    simpa only [Metric.mem_ball, dist_self] using (by positivity : (0 : ℝ) < 2 * r)
  exact (nativePocketPath_endpoint_flat F g R hr hS hMatch).2 0 hCentre

end NativePocketChecks
