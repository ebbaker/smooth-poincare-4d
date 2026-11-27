import SmoothPoincare

/-! # FOT-E52 independent downstream checks for the analytic formal routes

27 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
The tests use a finite form fixture or explicitly supplied geometric data.
-/

open DifferentialGeometry DifferentialGeometry.Integral.Measure
open Filter FirstOrderTwistor MeasureTheory SectionsAndConnections Set
open SmoothPoincare SmoothPoincare.IntrinsicEntry
open scoped BigOperators ContDiff Manifold Topology

noncomputable section

private def zeroCore :
    ThreeCuffForm Unit Unit (fun _ => Unit) (fun _ => Unit) where
  closedEnergy := fun _ => ∑ _ : Fin 3, 6 * (2 / Real.pi)
  closedNormSq := fun _ => 1
  coreEnergy := fun _ => 0
  funnelEnergy := fun _ _ => 6 * (2 / Real.pi)
  restrictCore := id
  restrictFunnel := fun _ => id
  coreTrace := fun _ => id
  funnelTrace := fun _ => id
  traceNormSq := fun _ _ => 1
  traceNormSq_nonneg := by simp
  trace_match := fun _ _ => rfl
  energy_split := by simp
  funnel_trace_bound := by simp

private def zeroCoreGround : ThreeCuffGroundState zeroCore where
  mode := ()
  eigenvalue := ∑ _ : Fin 3, 6 * (2 / Real.pi)
  normalized := rfl
  energy_eq := by simp [zeroCore]
  rayleigh_minimal := by simp [zeroCore]
  traceNormSq_pos := by simp [zeroCore]

example : 0 < zeroCore.closedFirstValue :=
  closedPositive_of_threeCuff_neumann_nonneg zeroCore zeroCoreGround (neumann := 0)
    (fun _ _ => le_rfl) le_rfl

/-- The explicit comparison takes the Neumann infimum on the core domain,
with a different positive mass from that of the original closed test. -/
example : 0 < zeroCore.closedFirstValue := by
  let coreNormSq : Unit → ℝ := fun _ => 2
  have hLeast : IsLeast (zeroCore.neumannRayleighValues coreNormSq) 0 := by
    constructor
    · exact ⟨(), by norm_num [coreNormSq], by simp [zeroCore]⟩
    · rintro _ ⟨v, hv, rfl⟩
      simp [zeroCore]
  exact closedPositive_of_threeCuff_neumannFirst_nonneg zeroCore zeroCoreGround coreNormSq
    ⟨0, hLeast.2⟩ (by norm_num [coreNormSq])
    (by rw [ThreeCuffForm.neumannFirstValue, hLeast.csInf_eq])

private def criticalSymmetricBands : ThreeCuffBandCosts where
  plus := fun _ => 4 * Real.pi ^ 2
  minus := fun _ => 4 * Real.pi ^ 2
  band_balance := fun _ => rfl

example : ¬ (criticalSymmetricBands.closedPlus < threeCuffEntryWall ∧
    criticalSymmetricBands.closedMinus < threeCuffEntryWall) := by
  rw [criticalSymmetricBands.strictCost_iff_of_exchange rfl]
  exact lt_irrefl _

section Robin

variable {V C B Test : Type*} [MeasurableSpace V] [MeasurableSpace C] [MeasurableSpace B]
  (D : MatchedBallRobinData V C B Test)

example (hGround : D.HasGroundState)
    (hEnd : negativeMeanL3 D.boundaryVolume D.outwardMean = roundBallMeanThreshold) :
    0 < D.firstEigenvalue :=
  matchedBall_robinPositive_of_traceBound D hGround hEnd.le

example (t : Test) (hMass : 0 < D.joinedMassSq t)
    (hCoreZero : D.coreRestriction t =ᵐ[D.coreVolume] 0) : 0 < D.joinedForm t :=
  D.joinedForm_pos_of_coreZero t hMass hCoreZero

example (t : Test)
    (hEnd : negativeMeanL3 D.boundaryVolume D.outwardMean = roundBallMeanThreshold)
    (hCore : ¬ D.coreRestriction t =ᵐ[D.coreVolume] 0) : 0 < D.joinedForm t :=
  D.joinedForm_pos_of_coreNonzero t hEnd.le hCore

end Robin

section Weighted

/-- A negative value satisfies the squared Raulot inequality at the
sharp threshold and fails the unsquared comparison. -/
example : (3 / 4 : ℝ) ≤ 3 / 4 ∧
    (4 / 3 : ℝ) * (3 / 4) ≤ (-1 : ℝ) ^ 2 ∧ ¬ (1 : ℝ) ≤ -1 := by
  norm_num

example : (1 : ℝ) ≤ 1 :=
  firstHalfLaplacian_ge_one_of_raulot (p₁ := 1) (p₂ := 3 / 4)
    (by norm_num) (by norm_num) (by norm_num)

private def nonzeroMeanGauss : UmbilicBoundaryGauss
    (fun _ : Unit => -2) (fun _ : Unit => 26 / 3) where
  ambientScalar := fun _ => 12
  normalRicci := fun _ => 3
  traceFreeRicci := fun _ _ _ => 0
  ambientScalarPos := by norm_num
  traceFree := by simp
  pinched := by norm_num
  normalRicci_eq := by norm_num
  gauss := by norm_num

example : (0 : ℝ) < (26 / 3) ∧ |(-2 : ℝ)| < 3 * boundaryScalarWeight (fun _ : Unit => 26 / 3) () :=
  nonzeroMeanGauss.scalar_pos_and_absMean_lt ()

variable {V C B Test : Type*} [MeasurableSpace V] [MeasurableSpace C] [MeasurableSpace B]
  (D : MatchedBallRobinData V C B Test) (R : B → ℝ)
  (G : UmbilicBoundaryGauss D.outwardMean R) (S : WeightedBallBoundarySpectrum D R)

example (t : Test) :
    (∫ x, boundaryScalarWeight R x * D.coreTrace t x ^ 2 ∂D.boundaryVolume) ≤
      S.p1PhysicalForm (D.coreTrace t) :=
  S.p1PhysicalForm_lower (fun x => (G.scalar_pos_and_absMean_lt x).1) t

example (hGround : D.HasGroundState) : 0 < D.firstEigenvalue :=
  weightedMatchedBall_robinPositive_of_pinched_umbilic_cut D R G S hGround

end Weighted

section SameType

local notation "E₄" => EuclideanSpace ℝ (Fin 4)
local notation "I₄" => 𝓘(ℝ, E₄)
local instance : Fact (Module.finrank ℝ (EuclideanSpace ℝ (Fin 5)) = 4 + 1) := ⟨by simp⟩

variable {M A : Type} [TopologicalSpace A] [TopologicalSpace M] [ChartedSpace E₄ M]
  [IsManifold I₄ ∞ M] [T2Space M] [CompactSpace M] [Nonempty M]
  {o : ManifoldOrientation I₄ M 4}
  {oS : ManifoldOrientation I₄ StandardFourSphere 4}
  {source : SignedCollarMetric o} {left right : MarkedCapGeometry I₄ M I₄ M}
  {formL formR : C^∞⟮I₄, M; ℝ⟯ → ℝ}

private local instance : MeasurableSpace M := borel M
private local instance : BorelSpace M := ⟨rfl⟩

/-- Independently consume the signed convergence at a strict raw threshold. -/
example (S : MarkedCapSmoothing (oX := o) source left formL)
    (hPos : ∀ᶠ n in atTop, 0 < classYamabeFour o.dimension_eq (S.smooth n).metric)
    (hRaw : source.charge .plus left.raw < 4 * Real.pi ^ 2) :
    ∃ n, 0 < classYamabeFour o.dimension_eq (S.smooth n).metric ∧
      ∀ sign, (S.smooth n).energy sign < 4 * Real.pi ^ 2 := by
  obtain ⟨hLim, _⟩ := markedCap_energyLimit_of_firstJet S
  obtain ⟨n, hY, hSmall⟩ := (hPos.and ((hLim .plus).eventually_lt_const hRaw)).exists
  refine ⟨n, hY, ?_⟩
  intro sign
  cases sign
  · exact hSmall
  · have hBalance : (S.smooth n).energy .plus = (S.smooth n).energy .minus :=
      (S.smooth n).signature_zero
    exact hBalance ▸ hSmall

/-- Given a positive measured cost on the left, it is the right side that
vanishes in both signs after applying the attained-type comparison. -/
example (capsL : MarkedCapSmoothing (oX := o) source left formL)
    (capsR : MarkedCapSmoothing (oX := o) source right formR)
    (hPosL : ∀ᶠ n in atTop, 0 < classYamabeFour o.dimension_eq (capsL.smooth n).metric)
    (hPosR : ∀ᶠ n in atTop, 0 < classYamabeFour o.dimension_eq (capsR.smooth n).metric)
    (keepL : ∀ n m hY₁ hY₂, MarkedSideReplacement (A := A) o oS
      (left.toSide (capsL.smooth n) hY₁) (right.toSide (capsR.smooth m) hY₂))
    (keepR : ∀ m n hY₂ hY₁, MarkedSideReplacement (A := A) o oS
      (right.toSide (capsR.smooth m) hY₂) (left.toSide (capsL.smooth n) hY₁))
    (hAttain : source.energy .plus = sInf (geometricPositiveEnergies o))
    (hSubcritical : source.energy .plus < 2 * (4 * Real.pi ^ 2))
    (hCover : left.raw ∪ right.raw = univ)
    (hOverlap : AEDisjoint (riemannianVolumeMeasure I₄ M source.metric) left.raw right.raw)
    (hL : 0 < source.charge .plus left.raw) :
    ∀ sign, source.charge sign right.raw = 0 := by
  rcases attainedRoundCut_discarded_zero capsL capsR hPosL hPosR keepL keepR
      hAttain hSubcritical hCover hOverlap with hzero | hzero
  · exact (hL.ne' (hzero .plus)).elim
  · exact hzero

/-- The reassembly is an oriented map with the prescribed core germ and the
actual image of the discarded raw side. -/
example {keep discard : GeometricMarkedCutSide (I := I₄) (M := M) o}
    (R : MarkedSideReplacement (A := A) o oS keep discard)
    (hSubcritical : discard.cappedEnergy < 4 * Real.pi ^ 2) :
    ∃ Φ : M ≃ₘ⟮I₄, I₄⟯ M, Φ.preservesOrientation o o ∧
      EqOn Φ keep.core keep.core.source ∧
      Φ '' discard.raw = keep.marking '' standardFourSphereCap :=
  R.reassemble hSubcritical

/-- Pass the weighted strict first value to the actual smooth capped sequence. -/
example {Core Cap B Test : Type*} [MeasurableSpace Core] [MeasurableSpace Cap] [MeasurableSpace B]
    (D : MatchedBallRobinData Core Cap B Test) (R : B → ℝ)
    (G : UmbilicBoundaryGauss D.outwardMean R) (S : WeightedBallBoundarySpectrum D R)
    (cap : RoundCapSmoothing (oX := o) source left D) (hGround : D.HasGroundState) :
    ∀ᶠ n in atTop, 0 < classYamabeFour o.dimension_eq (cap.smoothing.smooth n).metric :=
  cap.eventually_positive_of_eigenvalue hGround
    (weightedMatchedBall_robinPositive_of_pinched_umbilic_cut D R G S hGround)

end SameType

example : (∫ s in (0 : ℝ)..6, bourClosedCapRadialEuler (bourClosedCapProfile 2) s) =
    16 * Real.pi ^ 2 := by
  have h : (0 : ℝ) < 2 := by norm_num
  have hjet := bourClosedCapProfile_endJets h
  exact bourClosedCapRadialEuler_integral (bourClosedCapProfile_smooth 2) hjet.1 (by
    convert hjet.2 using 1
    norm_num)

#print axioms closedPositive_of_threeCuff_neumann_nonneg
#print axioms closedPositive_of_threeCuff_neumannFirst_nonneg
#print axioms matchedBall_robinPositive_of_traceBound
#print axioms firstHalfLaplacian_ge_one_of_raulot
#print axioms weightedMatchedBall_robinPositive_of_pinched_umbilic_cut
#print axioms markedCap_energyLimit_of_firstJet
#print axioms standard_of_attained_roundCut_traceBound
#print axioms standard_of_attained_roundCut_weighted
#print axioms bourClosedCapEuler_integral
#print axioms bourClosedCaps_ricci_identity
#print axioms bour_closedCaps_force_oneEnd
#print axioms bourClosedCaps_signedBounds
