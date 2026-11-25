import FirstOrderTwistor.CylinderDirac

/-!
# Fixed-domain reflection of cylindrical Dirac fields

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. The serving model and effort are unavailable. Input checkout
`5ff7014` with the E24a fixed-domain inverse and pinned Lean dependencies.

The full augmented Dirac target contains the forcing and both incoming
traces. In the common increasing normal the incoming traces are `P₊u(0)`
and `P₋u(L)`, and the outgoing traces are `P₋u(0)` and `P₊u(L)`.
The homogeneous forcing coordinate of an incoming lift is zero. For
fixed reference projections the perturbation has zero incoming coordinates.

Each scattering estimate allows either full endpoint pair or a single
incoming lift and outgoing extraction. Uniform inverse, lift and trace
bounds give the same constants at every cylinder length. This proves
same-end reflection from zero same-end blocks on the reference cylinder.
Separate one-sided weighted estimates, such as
`diracWeighted_remoteTrace_norm_le`, give decay of perturbed transmission.
-/

namespace FirstOrderTwistor

variable {X Y G H T : Type*}
  [NormedAddCommGroup X] [NormedSpace ℝ X]
  [NormedAddCommGroup Y] [NormedSpace ℝ Y]
  [NormedAddCommGroup G] [NormedSpace ℝ G]
  [NormedAddCommGroup H] [NormedSpace ℝ H]
  [NormedAddCommGroup T] [NormedSpace ℝ T]

/-- The exact linear resolvent identity for two invertible maps on one domain. -/
theorem fixedDomainDirac_resolvent_identity
    (reference solution : X ≃L[ℝ] Y) (difference : X →L[ℝ] Y)
    (hSolution : ∀ x, solution x = reference x + difference x) :
    (solution.symm : Y →L[ℝ] X) - reference.symm.toContinuousLinearMap =
      -(reference.symm.toContinuousLinearMap.comp
        (difference.comp solution.symm.toContinuousLinearMap)) := by
  ext y
  simp only [sub_apply, neg_apply,
    ContinuousLinearMap.comp_apply, ContinuousLinearEquiv.coe_coe]
  apply reference.injective
  rw [map_sub, map_neg, reference.apply_symm_apply, reference.apply_symm_apply]
  have hy : reference (solution.symm y) + difference (solution.symm y) = y := by
    rw [← hSolution, solution.apply_symm_apply]
  rw [eq_sub_of_add_eq hy]
  abel

/-- The augmented inverse attains the lifted incoming data for either operator
when the perturbation has zero incoming coordinates. -/
theorem fixedDomainDirac_perturbedSolution_incoming
    (reference solution : X ≃L[ℝ] Y) (difference : X →L[ℝ] Y)
    (hSolution : ∀ x, solution x = reference x + difference x)
    (incoming : Y →L[ℝ] T) (hIncoming : incoming.comp difference = 0) (y : Y) :
    incoming (reference (solution.symm y)) = incoming y := by
  have hy : reference (solution.symm y) + difference (solution.symm y) = y := by
    rw [← hSolution, solution.apply_symm_apply]
  have hzero : incoming (difference (solution.symm y)) = 0 := by
    simpa using congrArg (fun A : X →L[ℝ] T => A (solution.symm y)) hIncoming
  simpa only [map_add, hzero, add_zero] using congrArg (fun z => incoming z) hy

/-- Apply the homogeneous incoming lift, solve on the fixed domain, and read
the complementary outgoing trace. Lifting at one end and extracting at
either end selects the corresponding block of the scattering operator. -/
def fixedDomainDiracScattering
    (solution : X ≃L[ℝ] Y) (incomingLift : G →L[ℝ] Y) (outgoing : X →L[ℝ] H) :
    G →L[ℝ] H :=
  outgoing.comp (solution.symm.toContinuousLinearMap.comp incomingLift)

/-- The exact scattering difference factors through the fixed outgoing
trace of the reference inverse and the full operator perturbation. -/
theorem fixedDomainDiracScattering_sub
    (reference solution : X ≃L[ℝ] Y) (difference : X →L[ℝ] Y)
    (hSolution : ∀ x, solution x = reference x + difference x)
    (incomingLift : G →L[ℝ] Y) (outgoing : X →L[ℝ] H) :
    fixedDomainDiracScattering solution incomingLift outgoing -
      fixedDomainDiracScattering reference incomingLift outgoing =
        -(((outgoing.comp reference.symm.toContinuousLinearMap).comp difference).comp
          (solution.symm.toContinuousLinearMap.comp incomingLift)) := by
  ext x
  have h := congrArg (fun F : Y →L[ℝ] X => outgoing (F (incomingLift x)))
    (fixedDomainDirac_resolvent_identity reference solution difference hSolution)
  simpa only [fixedDomainDiracScattering, sub_apply, neg_apply,
    ContinuousLinearMap.comp_apply, map_sub, map_neg] using h

variable [CompleteSpace Y]

/-- Quantitative scattering comparison for arbitrary incoming and outgoing
blocks. In the round MATCH-E01 norm one may take the three norm constants
`C`, `Ctrace` and `Clift` equal to one. -/
theorem fixedDomainDiracScattering_sub_norm_le
    (reference solution : X ≃L[ℝ] Y) (difference : X →L[ℝ] Y)
    (hSolution : ∀ x, solution x = reference x + difference x)
    (incomingLift : G →L[ℝ] Y) (outgoing : X →L[ℝ] H)
    {C δ Ctrace Clift : ℝ} (hC : ‖(reference.symm : Y →L[ℝ] X)‖ ≤ C)
    (hδ : ‖difference‖ ≤ δ) (hsmall : δ * C < 1)
    (htrace : ‖outgoing.comp reference.symm.toContinuousLinearMap‖ ≤ Ctrace)
    (hlift : ‖incomingLift‖ ≤ Clift) :
    ‖fixedDomainDiracScattering solution incomingLift outgoing -
      fixedDomainDiracScattering reference incomingLift outgoing‖ ≤
        Ctrace * δ * (C / (1 - δ * C)) * Clift := by
  obtain ⟨perturbed, hPerturbed, hInv⟩ :=
    fixedDomainDiracPerturbation_inverse_norm_le reference difference hC hδ hsmall
  have hsame : perturbed = solution := by
    ext x
    rw [hPerturbed, hSolution]
  rw [hsame] at hInv
  rw [fixedDomainDiracScattering_sub reference solution difference hSolution, norm_neg]
  let R := outgoing.comp reference.symm.toContinuousLinearMap
  let U := solution.symm.toContinuousLinearMap
  calc
    ‖(R.comp difference).comp (U.comp incomingLift)‖ ≤
        (‖R‖ * ‖difference‖) * (‖U‖ * ‖incomingLift‖) :=
      (ContinuousLinearMap.opNorm_comp_le _ _).trans
        (mul_le_mul (ContinuousLinearMap.opNorm_comp_le _ _)
          (ContinuousLinearMap.opNorm_comp_le _ _) (norm_nonneg _) (by positivity))
    _ ≤ (Ctrace * δ) * ((C / (1 - δ * C)) * Clift) :=
      mul_le_mul (mul_le_mul htrace hδ (norm_nonneg _) ((norm_nonneg _).trans htrace))
        (mul_le_mul hInv hlift (norm_nonneg _) ((norm_nonneg _).trans hInv))
        (by positivity) (mul_nonneg ((norm_nonneg _).trans htrace) ((norm_nonneg _).trans hδ))
    _ = Ctrace * δ * (C / (1 - δ * C)) * Clift := by ring

/-- A vanishing same-end reference block gives the perturbative reflection
bound for that end. It uses the fixed trace maps for both operators. -/
theorem fixedDomainDiracScattering_sameEnd_norm_le
    (reference solution : X ≃L[ℝ] Y) (difference : X →L[ℝ] Y)
    (hSolution : ∀ x, solution x = reference x + difference x)
    (incomingLift : G →L[ℝ] Y) (outgoing : X →L[ℝ] H)
    (hzero : fixedDomainDiracScattering reference incomingLift outgoing = 0)
    {C δ Ctrace Clift : ℝ} (hC : ‖(reference.symm : Y →L[ℝ] X)‖ ≤ C)
    (hδ : ‖difference‖ ≤ δ) (hsmall : δ * C < 1)
    (htrace : ‖outgoing.comp reference.symm.toContinuousLinearMap‖ ≤ Ctrace)
    (hlift : ‖incomingLift‖ ≤ Clift) :
    ‖fixedDomainDiracScattering solution incomingLift outgoing‖ ≤
      Ctrace * δ * (C / (1 - δ * C)) * Clift := by
  simpa only [hzero, sub_zero] using fixedDomainDiracScattering_sub_norm_le
    reference solution difference hSolution incomingLift outgoing hC hδ hsmall htrace hlift

/-- With the round reference transmission bound, the full perturbed scattering
norm is bounded by the sum of that decay and the reflection comparison budget. -/
theorem fixedDomainDiracScattering_norm_le_round_add
    (reference solution : X ≃L[ℝ] Y) (difference : X →L[ℝ] Y)
    (hSolution : ∀ x, solution x = reference x + difference x)
    (incomingLift : G →L[ℝ] Y) (outgoing : X →L[ℝ] H)
    {length C δ Ctrace Clift : ℝ}
    (hRound : ‖fixedDomainDiracScattering reference incomingLift outgoing‖ ≤
      Real.exp (-(3 / 2) * length))
    (hC : ‖(reference.symm : Y →L[ℝ] X)‖ ≤ C)
    (hδ : ‖difference‖ ≤ δ) (hsmall : δ * C < 1)
    (htrace : ‖outgoing.comp reference.symm.toContinuousLinearMap‖ ≤ Ctrace)
    (hlift : ‖incomingLift‖ ≤ Clift) :
    ‖fixedDomainDiracScattering solution incomingLift outgoing‖ ≤
      Real.exp (-(3 / 2) * length) + Ctrace * δ * (C / (1 - δ * C)) * Clift := by
  let Sh := fixedDomainDiracScattering solution incomingLift outgoing
  let S0 := fixedDomainDiracScattering reference incomingLift outgoing
  have hcompare : ‖Sh - S0‖ ≤ Ctrace * δ * (C / (1 - δ * C)) * Clift :=
    fixedDomainDiracScattering_sub_norm_le reference solution difference hSolution incomingLift
      outgoing hC hδ hsmall htrace hlift
  calc
    ‖Sh‖ = ‖S0 + (Sh - S0)‖ := by rw [add_comm S0 (Sh - S0), sub_add_cancel]
    _ ≤ ‖S0‖ + ‖Sh - S0‖ := norm_add_le _ _
    _ ≤ _ := add_le_add hRound hcompare

end FirstOrderTwistor
