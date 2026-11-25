# Premise review for the projected defect and residual energy

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Actual serving model and reasoning effort are unavailable. This
review uses the DIR and MATCH-E10 sources at
`5ff7014caff55ad9cc49bb910b8e5fbcb546bd11` and the Route 04 Lean modules
developed from that checkout, with the checked-in Lake manifest and Lean
`4.35.0-rc3`. It checks the local identities, norm interfaces and order of
limits. [DIR §2.3](../../../../papers/investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/manuscript/dirac_twistor_and_yamabe_rigidity.tex#L276) · [MATCH-E10](../../../../papers/investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/01_dirac_collar_matching/notes/E10_INTERIOR_SPINOR_DEFECT_20261125.md)

## From the two-jet to measured energy

- `metricProjectedFrameTwistorCurl_normSq` has the DIR squared coefficient
  $1/2$ for positive half-spinors, the Hilbert–Schmidt norm of the positive
  Weyl block, and the actual smooth metric in an oriented orthonormal
  four-frame. The normalized self-dual basis is $(01+23,02+31,03+12)/\sqrt2$.
  The spin commutator uses the signed $-1/2$ curvature action. The Clifford
  correction and scalar block lie in the trace-adjoint image, so both are
  killed by projection. The pointwise theorem assumes a compatible ordered
  two-jet. `projectedCoordinateTwistorCurl` computes the coordinate curl
  with supplied normal symbols and curvature identification. Application to
  actual collar fields still requires that gauge, the matching spin lift and
  the corresponding measured fields. [SpinNormalFrame.lean](../../../FirstOrderTwistor/SpinNormalFrame.lean) · [SpinTwistorDerivative.lean](../../../FirstOrderTwistor/SpinTwistorDerivative.lean)
- `ofMetricJets` packages the three squared densities, and
  `validOn_ofMetricJets` supplies the floor-based accounting premise from
  the a.e. commutator. Its volume is supplied independently. An application
  must identify it with the measured strip metric and give restricted energy
  equality, local integrability of curvature and each squared projected
  curl, and the positive joint floor. For the normalized factory, the
  commutator identity is used on the joint nonzero locus, where local Weyl
  integrability makes its normalized integral finite. [SpinJetResidual.lean](../../../FirstOrderTwistor/SpinJetResidual.lean) · [SpinDefectDensity.lean](../../../FirstOrderTwistor/SpinDefectDensity.lean)
- On a clipped strip $s=S\cap U_j$, the measure comparison is
  $\mu|_s=(|W^+_{g_j}|^2\,dV_{g_j})|_s$. A conformally related gauge can
  supply this equality from the four-dimensional volume and squared
  curvature factors with matched oriented coefficients. The comparison
  uses the same measurable physical region on both sides. Strip charts on
  other carriers require transport to that region. For the normalized
  factory the contribution is further restricted to the family's measurable
  joint nonzero locus. Any energy at joint zeros outside the other
  contributing strips is part of the uncovered term. [ConformalEnergy.lean](../../../FirstOrderTwistor/ConformalEnergy.lean) · [SpinCoverAccounting.lean](../../../FirstOrderTwistor/SpinCoverAccounting.lean) · [SpinRatioAccounting.lean](../../../FirstOrderTwistor/SpinRatioAccounting.lean)

## From the interior estimate to the normalized cost

`spinStrip_projectedDerivative` assembles MATCH-E10 (3)–(5) given the
cutoff equation, reference operator estimate, first-order bound, return to
the strip metric, Ricci product and positive floor. The differentiated
equation and geometric norm comparisons enter as premises. The conclusion
includes `MemLp` for the normalized ratio. The singleton bridge accepts that
finiteness explicitly and computes twice the square of its real $L^2$ norm
as the strip cost once both density arrays have been identified. Use the
Hilbert fibre norm for the projected components.
`normSq_projectedFrameTwistorCurl_eq_sum` proves that the squared `WithLp 2`
norm is the sum used in the jet density. If the analytic estimate is on a
larger protected set in the same strip gauge, the singleton bridge restricts
`MemLp` and compares the extended norms by measure domination. Its finite
upper norm justifies the comparison of their real values. [SpinStrip.lean](../../../FirstOrderTwistor/SpinStrip.lean) · [SpinJetResidual.lean](../../../FirstOrderTwistor/SpinJetResidual.lean) · [SpinRatioAccounting.lean](../../../FirstOrderTwistor/SpinRatioAccounting.lean)

The initial E10 cutoff interface admitted real norms of `V`, `D0V` and
`DhV - D0V` with no finiteness witness for `V` or `D0V`.
Mathlib sets `lpNorm` to zero outside `MemLp`, including when the extended
norm is infinite. The initial perturbation premise could therefore accept
an infinite operator error. The revised signatures require
`MemLp V 2 reference` and `MemLp (DhV - D0V) 2 reference`. The cutoff equation
gives `MemLp DhV 2 reference` from finite forcing and commutator, and
subtracting the finite operator difference gives `MemLp D0V 2 reference`.
The revised estimates therefore use finite real norms throughout.

## From strips to the accounting limit

Both factories sum at fixed truncation $L$ and source index $i$, then
require both the summed cost and the original uncovered energy to be small
eventually in $i$ for each sufficiently large $L$. The source cutoff may
depend on $L$ and the tolerance. Overlaps may increase the sum, and the
uncovered energy enters once. The floor route uses the clipped strips and
the normalized route uses their joint nonzero subsets. Neither first-order
strip estimates nor individually small local
costs yield the summed bound for a growing cover. MATCH-E10's bounded-energy
oscillation tests the first-order inference with normalized actual Green
fields and a growing Bach norm. On a proposed physical sequence the
summed differentiated estimate, measured coverage and uncovered bound
remain inputs. [Accounting.lean](../../../FirstOrderTwistor/Accounting.lean) · [Checked finite-cover examples](../research-progress/handoffs/SPIN_EXAMPLES.lean)
