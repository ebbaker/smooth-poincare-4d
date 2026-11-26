import FirstOrderTwistor.ChiralFramePullback
import FirstOrderTwistor.MetricJetEnergy
import SmoothPoincare.Variational.MarkedCapTestFactors
import SmoothPoincare.Variational.PositiveScalarYamabeFour
import SmoothPoincare.Variational.SignedCollarRepair

/-!
# Whole-carrier returns on the original oriented type

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
Actual serving model and effort were unavailable. BAT-E01/E05 uses the Edition 05
revision 1 handoff and its Route 13 plan at intake HEAD `4d73fdde6804ce93fc2a3e4cef403e16eb941dab`.
The stationary convention is Bour, Proposition 4.4, as stated in the working
attainment manuscript. Geometric limit inputs and Bach transport are explicit.
-/

noncomputable section

open DifferentialGeometry DifferentialGeometry.Geometry.Curvature
open DifferentialGeometry.Tensor0SBundle
open DifferentialGeometry.CheegerGromovCompactness DifferentialGeometry.Integral.Measure
open FirstOrderTwistor Filter MeasureTheory
open SectionsAndConnections Set
open scoped ContDiff Manifold Topology

namespace SmoothPoincare

variable {E F H K M N : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
  [TopologicalSpace H] [TopologicalSpace K]
  {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  {J : ModelWithCorners ℝ F K} [J.Boundaryless]
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [T2Space M]
  [CompactSpace M] [Nonempty M]
  [TopologicalSpace N] [ChartedSpace K N] [IsManifold J ∞ N] [T2Space N]
  [CompactSpace N] [Nonempty N]
  {oM : ManifoldOrientation I M 4} {oN : ManifoldOrientation J N 4}

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩
private local instance : MeasurableSpace N := borel N
private local instance : BorelSpace N := ⟨rfl⟩

namespace SignedCollarMetric

omit [I.Boundaryless] [J.Boundaryless] [CompactSpace M] [Nonempty M] [Nonempty N] in
private theorem signedBlock_pullbackCross (q : SignedCollarMetric oN)
    (Φ : M ≃ₘ⟮I, J⟯ N) (hΦ : Φ.preservesOrientation oM oN) (sign : CollarChirality) (x : M) :
    signedCollarWeylBlock oM (Diffeomorph.pullbackMetricCross q.metric Φ)
      (pullbackOrientedOrthonormalFrames q.metric Φ hΦ q.frame) sign x =
      signedCollarWeylBlock oN q.metric q.frame sign (Φ x) := by
  cases sign with
  | plus => exact geometricChiralBlock_pullback q.metric Φ hΦ x (q.frame (Φ x))
  | minus =>
    change traceFreeChiralBlock (antiSelfDualCurvatureBlock _) =
      traceFreeChiralBlock (antiSelfDualCurvatureBlock _)
    exact congrArg (fun r => traceFreeChiralBlock (antiSelfDualCurvatureBlock r))
      (metricCurvatureFrameTensor_pullback q.metric Φ hΦ x (q.frame (Φ x)))

omit [J.Boundaryless] [Nonempty M] [Nonempty N] in
private theorem signedEnergy_pullbackCross (q : SignedCollarMetric oN)
    (Φ : M ≃ₘ⟮I, J⟯ N) (hΦ : Φ.preservesOrientation oM oN) (sign : CollarChirality) :
    chiralFrameEnergy (Diffeomorph.pullbackMetricCross q.metric Φ)
      (signedCollarWeylBlock oM (Diffeomorph.pullbackMetricCross q.metric Φ)
        (pullbackOrientedOrthonormalFrames q.metric Φ hΦ q.frame) sign) = q.energy sign := by
  unfold energy
  unfold chiralFrameEnergy
  simp_rw [signedBlock_pullbackCross]
  have hEmb : MeasurableEmbedding (Φ.symm : N → M) := Φ.symm.toHomeomorph.measurableEmbedding
  rw [riemannianVolumeMeasure_pullback_cross, hEmb.integral_map]
  simp only [Φ.apply_symm_apply]

set_option backward.isDefEq.respectTransparency false in
/-- Both signed blocks follow the actual oriented pullback metric and its physical volume. -/
def pullbackCross (q : SignedCollarMetric oN) (Φ : M ≃ₘ⟮I, J⟯ N)
    (hΦ : Φ.preservesOrientation oM oN) : SignedCollarMetric oM where
  metric := Diffeomorph.pullbackMetricCross q.metric Φ
  frame := pullbackOrientedOrthonormalFrames q.metric Φ hΦ q.frame
  integrable sign := by
    simp_rw [signedBlock_pullbackCross]
    have hEmb : MeasurableEmbedding (Φ.symm : N → M) := Φ.symm.toHomeomorph.measurableEmbedding
    rw [riemannianVolumeMeasure_pullback_cross, hEmb.integrable_map_iff]
    change Integrable (fun y => hilbertSchmidtSq
      (signedCollarWeylBlock oN q.metric q.frame sign (Φ (Φ.symm y))))
      (riemannianVolumeMeasure J N q.metric)
    simp only [Φ.apply_symm_apply]
    exact q.integrable sign
  signature_zero := (signedEnergy_pullbackCross q Φ hΦ .plus).trans
    (q.signature_zero.trans (signedEnergy_pullbackCross q Φ hΦ .minus).symm)

omit [J.Boundaryless] [Nonempty M] [Nonempty N] in
/-- The total energy of each chirality is invariant under this oriented identification. -/
theorem energy_pullbackCross (q : SignedCollarMetric oN) (Φ : M ≃ₘ⟮I, J⟯ N)
    (hΦ : Φ.preservesOrientation oM oN) (sign : CollarChirality) :
    (q.pullbackCross Φ hΦ).energy sign = q.energy sign :=
  signedEnergy_pullbackCross q Φ hΦ sign

/-- The same identification preserves the conformal Yamabe constant. -/
theorem yamabe_pullbackCross (q : SignedCollarMetric oN) (Φ : M ≃ₘ⟮I, J⟯ N)
    (hΦ : Φ.preservesOrientation oM oN) :
    classYamabeFour oM.dimension_eq (q.pullbackCross Φ hΦ).metric =
      classYamabeFour oN.dimension_eq q.metric :=
  classYamabeFour_pullback oM.dimension_eq oN.dimension_eq q.metric Φ

omit [Nonempty N] in
/-- For an actual common-carrier sequence, two-jet metric convergence in
convergent framed slots gives convergence of both physical signed totals.
The weighted densities are tested on one physical reference volume. -/
theorem energy_tendsto_of_metricCPConvergence
    (q : ℕ → SignedCollarMetric oN) (limit : SignedCollarMetric oN)
    (R ref : SmoothRiemannianMetric J N)
    (hConv : MetricCPConvergenceOn univ 2 (fun i => (q i).metric) limit.metric R)
    (hFrame : ∀ x a j, Tendsto
      (fun i => (limit.frame x).basis.repr (((q i).frame x).basis a) j) atTop
      (𝓝 ((limit.frame x).basis.repr ((limit.frame x).basis a) j)))
    {bound : N → ℝ} :
    let μ := riemannianVolumeMeasure J N ref
    let density := fun i => chiralHSDensity
      (fun x => geometricChiralBlock (q i).metric oN x ((q i).frame x))
      (riemannianVolumeDensity ref (q i).metric)
    (∀ i, AEStronglyMeasurable (density i) μ) → Integrable bound μ →
    (∀ i, ∀ᵐ x ∂μ, ‖density i x‖ ≤ bound x) →
    ∀ sign, Tendsto (fun i => (q i).energy sign) atTop (𝓝 (limit.energy sign)) := by
  intro μ density hMeas hBound hDom sign
  have hPlus : Tendsto (fun i => (q i).energy .plus) atTop (𝓝 (limit.energy .plus)) := by
    have hInt := tendsto_geometricChiralIntegral_of_framedCurvature oN
      (fun i => (q i).metric) limit.metric ref (fun i => (q i).frame) limit.frame
      (K := univ) MeasurableSet.univ (bound := bound)
      (fun a b c d => Eventually.of_forall fun x =>
        tendsto_metricCurvatureFrameTensor_of_metricCPConvergence hConv isCompact_univ
          (mem_univ x) (fun i => (q i).frame x) (limit.frame x) (hFrame x) a b c d)
      (Eventually.of_forall fun x =>
        tendsto_riemannianVolumeDensity_of_metricCPConvergenceOn ref hConv isCompact_univ (mem_univ x))
      (by simpa only [Measure.restrict_univ, density, μ] using hMeas)
      (by simpa only [integrableOn_univ] using hBound)
      (by simpa only [Measure.restrict_univ, density, μ] using hDom)
    simpa only [setIntegral_univ, energy, chiralFrameEnergy, signedCollarWeylBlock] using hInt
  cases sign with
  | plus => exact hPlus
  | minus =>
    have hSig : limit.energy .plus = limit.energy .minus := limit.signature_zero
    rw [← hSig]
    exact hPlus.congr fun i => (q i).signature_zero

end SignedCollarMetric

/-- A whole marked positive candidate at or below the source infimum attains it
on the actual pullback metric. Bach-flatness is a separate geometric input and
its transport refers to the very same metric and diffeomorphism. -/
theorem bourAttainsOfSignedPullback
    (q : SignedCollarMetric oN) (Φ : M ≃ₘ⟮I, J⟯ N) (hΦ : Φ.preservesOrientation oM oN)
    (BachFlatM : SmoothRiemannianMetric I M → Prop) (BachFlatN : SmoothRiemannianMetric J N → Prop)
    (hBach : BachFlatN q.metric)
    (hBachTransport : BachFlatN q.metric → BachFlatM (Diffeomorph.pullbackMetricCross q.metric Φ))
    (hY : 0 < classYamabeFour oN.dimension_eq q.metric)
    (hUpper : q.energy .plus ≤ sInf (geometricPositiveEnergies oM)) :
    let pull := q.pullbackCross Φ hΦ
    0 < classYamabeFour oM.dimension_eq pull.metric ∧ BachFlatM pull.metric ∧
      ∀ sign, pull.energy sign = sInf (geometricPositiveEnergies oM) := by
  intro pull
  have hPositive : 0 < classYamabeFour oM.dimension_eq pull.metric := by
    rwa [SignedCollarMetric.yamabe_pullbackCross]
  have hMember := pull.energy_mem_of_positive hPositive
  have hPlus : pull.energy .plus = sInf (geometricPositiveEnergies oM) := by
    refine le_antisymm ?_ (csInf_le (geometricPositiveEnergies_bddBelow oM) hMember)
    rwa [SignedCollarMetric.energy_pullbackCross]
  refine ⟨hPositive, hBachTransport hBach, ?_⟩
  intro sign
  cases sign with
  | plus => exact hPlus
  | minus => exact pull.signature_zero.symm.trans hPlus

/-- Flatness of the supplied covariant normalization of the Weyl gradient. -/
def BourBachFlat
    (G₀ : (g : SmoothRiemannianMetric J N) → (x : N) → Tensor0SSpace 2 J x)
    (g : SmoothRiemannianMetric J N) : Prop :=
  ∀ x, G₀ g x = 0

omit [J.Boundaryless] [T2Space N] [CompactSpace N] [Nonempty N] in
/-- The mixed constant-scalar-curvature Euler equation passes to the Weyl
Euler equation. The supplier identifies `G₀` with its geometric Weyl gradient
and supplies continuity of its fourth-order components. The scalar, Ricci and
metric components use the actual Levi-Civita quantities of the given sequence. -/
theorem bourBachFlat_of_criticalLimit
    (G : ℕ → SmoothRiemannianMetric J N) (g : SmoothRiemannianMetric J N)
    (G₀ : (g : SmoothRiemannianMetric J N) → (x : N) → Tensor0SSpace 2 J x)
    (p : ℕ → ℝ) (hp : Tendsto p atTop (𝓝 0))
    (hEuler : ∀ i x (v : Fin 2 → TangentSpace J x), G₀ (G i) x v =
      p i / 12 * metricScalarAt (G i) x *
        (metricRicciAt (G i) x v - metricScalarAt (G i) x / 4 * (G i).inner x (v 0) (v 1)))
    (hScalar : ∀ x, Tendsto (fun i => metricScalarAt (G i) x) atTop (𝓝 (metricScalarAt g x)))
    (hRicci : ∀ x (v : Fin 2 → TangentSpace J x),
      Tendsto (fun i => metricRicciAt (G i) x v) atTop (𝓝 (metricRicciAt g x v)))
    (hMetric : ∀ x (v : Fin 2 → TangentSpace J x),
      Tendsto (fun i => (G i).inner x (v 0) (v 1)) atTop (𝓝 (g.inner x (v 0) (v 1))))
    (hBach : ∀ x (v : Fin 2 → TangentSpace J x),
      Tendsto (fun i => G₀ (G i) x v) atTop (𝓝 (G₀ g x v))) :
    BourBachFlat G₀ g := by
  intro x
  apply ContinuousMultilinearMap.ext
  intro v
  have hProd := ((hp.div_const 12).mul (hScalar x)).mul
    ((hRicci x v).sub (((hScalar x).div_const 4).mul (hMetric x v)))
  have hZero : Tendsto (fun i => G₀ (G i) x v) atTop (𝓝 0) := by
    simp only [hEuler]
    simpa only [zero_div, zero_mul] using hProd
  exact tendsto_nhds_unique (hBach x v) hZero

/-- A closed comparison sequence carries the source Yamabe floor and signed
energy to the limiting metric in the whole marking. The chosen returned map is
one inverse comparison, so its pullback has the original underlying manifold.
The needed conformal test integrals, chiral energy convergence, geometric Euler
equation and limits of its components are all stated on the compared metrics. -/
theorem bourClosedReturn
    (source : ℕ → SignedCollarMetric oM) (q : SignedCollarMetric oN)
    (Φ : ℕ → N ≃ₘ⟮J, I⟯ M) (hΦ : ∀ i, (Φ i).preservesOrientation oN oM)
    (G₀ : (g : SmoothRiemannianMetric J N) → (x : N) → Tensor0SSpace 2 J x)
    (BachFlatM : SmoothRiemannianMetric I M → Prop)
    (hBachTransport : BourBachFlat G₀ q.metric →
      BachFlatM (Diffeomorph.pullbackMetricCross q.metric (Φ 0).symm))
    {y : ℝ} (hy : 0 < y) (hY : ∀ i, y ≤ classYamabeFour oM.dimension_eq (source i).metric)
    (p : ℕ → ℝ) (hp : Tendsto p atTop (𝓝 0))
    (hSource : Tendsto (fun i => (source i).energy .plus) atTop
      (𝓝 (sInf (geometricPositiveEnergies oM)))) :
    let compared := fun i => (source i).pullbackCross (Φ i) (hΦ i)
    let G := fun i => (compared i).metric
    let pull := q.pullbackCross (Φ 0).symm (Diffeomorph.preservesOrientation_symm (hΦ 0))
    (∀ u : C^∞⟮J, N; ℝ⟯,
      Tendsto (fun i => capTestScalar (conformalMetric (G i) u)) atTop
        (𝓝 (capTestScalar (conformalMetric q.metric u))) ∧
      Tendsto (fun i => capTestVolume (conformalMetric (G i) u)) atTop
        (𝓝 (capTestVolume (conformalMetric q.metric u)))) →
    Tendsto (fun i => (compared i).energy .plus) atTop (𝓝 (q.energy .plus)) →
    (∀ i x (v : Fin 2 → TangentSpace J x), G₀ (G i) x v =
      p i / 12 * metricScalarAt (G i) x *
        (metricRicciAt (G i) x v - metricScalarAt (G i) x / 4 * (G i).inner x (v 0) (v 1))) →
    (∀ x, Tendsto (fun i => metricScalarAt (G i) x) atTop (𝓝 (metricScalarAt q.metric x))) →
    (∀ x (v : Fin 2 → TangentSpace J x), Tendsto (fun i => metricRicciAt (G i) x v) atTop
      (𝓝 (metricRicciAt q.metric x v))) →
    (∀ x (v : Fin 2 → TangentSpace J x), Tendsto (fun i => (G i).inner x (v 0) (v 1)) atTop
      (𝓝 (q.metric.inner x (v 0) (v 1)))) →
    (∀ x (v : Fin 2 → TangentSpace J x), Tendsto (fun i => G₀ (G i) x v) atTop
      (𝓝 (G₀ q.metric x v))) →
    y ≤ classYamabeFour oM.dimension_eq pull.metric ∧ BachFlatM pull.metric ∧
      ∀ sign, pull.energy sign = sInf (geometricPositiveEnergies oM) := by
  intro compared G pull hTests hEnergy hEuler hScalar hRicci hMetric hBach
  have hJoined : HasJoinedCapTests G q.metric := fun u =>
    ⟨id, fun _ => u, (hTests u).1, (hTests u).2⟩
  have hYq : y ≤ classYamabeFour oN.dimension_eq q.metric :=
    hJoined.yamabeFloor oN.dimension_eq oN.dimension_eq hy (fun i => by
      change y ≤ classYamabeFour oN.dimension_eq (compared i).metric
      rw [SignedCollarMetric.yamabe_pullbackCross]
      exact hY i)
  have hBachq := bourBachFlat_of_criticalLimit G q.metric G₀ p hp hEuler hScalar hRicci hMetric hBach
  have hSourceTransport : Tendsto (fun i => (compared i).energy .plus) atTop
      (𝓝 (sInf (geometricPositiveEnergies oM))) := hSource.congr fun i =>
    ((source i).energy_pullbackCross (Φ i) (hΦ i) .plus).symm
  obtain ⟨_, hFlat, hAttain⟩ := bourAttainsOfSignedPullback q (Φ 0).symm
    (Diffeomorph.preservesOrientation_symm (hΦ 0)) BachFlatM (BourBachFlat G₀)
    hBachq hBachTransport (hy.trans_le hYq) (tendsto_nhds_unique hEnergy hSourceTransport).le
  exact ⟨by rwa [SignedCollarMetric.yamabe_pullbackCross], hFlat, hAttain⟩

section Round

local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 5)) = 4 + 1) := ⟨by simp⟩
private local instance : Nonempty StandardFourSphere :=
  (NormedSpace.sphere_nonempty (x := (0 : EuclideanSpace ℝ (Fin 5))) (r := 1)).mpr zero_le_one
    |>.to_subtype

private theorem standardRoundFour_signedBlock_eq_zero
    (oS : ManifoldOrientation (𝓡 4) StandardFourSphere 4) (sign : CollarChirality)
    (x : StandardFourSphere) :
    signedCollarWeylBlock oS standardRoundFourMetric
      (orientedOrthonormalFrameAt standardRoundFourMetric oS) sign x = 0 := by
  cases sign with
  | plus => exact standardRoundFour_chiralBlock_eq_zero oS x _
  | minus =>
    change traceFreeChiralBlock (antiSelfDualCurvatureBlock
      (metricCurvatureFrameTensor standardRoundFourMetric oS x _)) = 0
    rw [standardRoundFour_curvatureFrameTensor]
    have hGauss : principalGaussTensor (fun _ => 1) = constantSectionalFrameTensor 1 := by
      funext a b c d
      change _ = 1 * ((if a = c then (1 : ℝ) else 0) * (if b = d then 1 else 0) -
        (if a = d then 1 else 0) * (if b = c then 1 else 0))
      exact (one_mul _).symm
    rw [← hGauss, principalGauss_chiralBlocks_eq, hGauss, traceFreeSelfDualBlock_constantSectional]

/-- Both actual chiral blocks vanish on the named unit round four-sphere. -/
def standardRoundFourSignedMetric
    (oS : ManifoldOrientation (𝓡 4) StandardFourSphere 4) : SignedCollarMetric oS where
  metric := standardRoundFourMetric
  frame := orientedOrthonormalFrameAt standardRoundFourMetric oS
  integrable sign := by
    simp [standardRoundFour_signedBlock_eq_zero, hilbertSchmidtSq]
  signature_zero := by
    simp [chiralFrameEnergy, standardRoundFour_signedBlock_eq_zero, hilbertSchmidtSq]

/-- The actual round candidate on a supplied oriented standard type tests the
attainment criterion, with the Bach supplier retained for the same pullback. -/
theorem bourRoundReturn
    {oS : ManifoldOrientation (𝓡 4) StandardFourSphere 4}
    (Φ : M ≃ₘ⟮I, 𝓡 4⟯ StandardFourSphere) (hΦ : Φ.preservesOrientation oM oS)
    (BachFlatM : SmoothRiemannianMetric I M → Prop)
    (BachFlatS : SmoothRiemannianMetric (𝓡 4) StandardFourSphere → Prop)
    (hBach : BachFlatS standardRoundFourMetric)
    (hBachTransport : BachFlatS standardRoundFourMetric →
      BachFlatM (Diffeomorph.pullbackMetricCross standardRoundFourMetric Φ)) :
    let pull := (standardRoundFourSignedMetric oS).pullbackCross Φ hΦ
    0 < classYamabeFour oM.dimension_eq pull.metric ∧ BachFlatM pull.metric ∧
      (∀ sign, pull.energy sign = sInf (geometricPositiveEnergies oM)) ∧
      sInf (geometricPositiveEnergies oM) = 0 := by
  have hInf := (geometricInfimum_eq_zero_of_roundIdentification Φ hΦ standardRoundFour_yamabe_pos).2
  have hEnergy : (standardRoundFourSignedMetric oS).energy .plus = 0 := by
    simp [SignedCollarMetric.energy, standardRoundFourSignedMetric, chiralFrameEnergy,
      standardRoundFour_signedBlock_eq_zero, hilbertSchmidtSq]
  obtain ⟨hY, hFlat, hE⟩ := bourAttainsOfSignedPullback (standardRoundFourSignedMetric oS) Φ hΦ
    BachFlatM BachFlatS hBach hBachTransport standardRoundFour_yamabe_pos (hEnergy.trans hInf.symm).le
  exact ⟨hY, hFlat, hE, hInf⟩

end Round

end SmoothPoincare
