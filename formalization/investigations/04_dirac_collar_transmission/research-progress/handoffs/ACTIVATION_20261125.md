# Route 04 activation and frozen requests, revision 1

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex. Checkout `5ff7014caff55ad9cc49bb910b8e5fbcb546bd11`. The author selected GPT-6.2 Astra/ultra for the lead. The serving lead variant and effort are not independently exposed. Each delegated proof used the explicit selection `gpt-6.2-sol`, reasoning effort `ultra`. [Route plan](../../research-plan/PLAN.md) · [Live register](../REGISTER.md)

All requests use the checked-in Lean toolchain and manifest. Each helper owns the named module under `formalization/FirstOrderTwistor/`. Each returns compiled declarations, axiom reports and remaining premises. Only the lead changes common files. A change to chirality, normalization, physical metric, boundary signs, or the conclusion goes back to FOT-B04.

| Packet | Frozen question and finite output | Primary input |
| --- | --- | --- |
| SPIN-E01 | Prove the exact opening type, then prove its set-integral form on measurable intersections with a residual, allowing empty and overlapping families. `SpinCoverBounds.lean`. | Route plan, MATCH-E05 |
| FOT-E18a | Compute the norm in an explicit positive half-spin fiber, the Clifford trace and its projection. Use the symmetric trace-free matrix and the signed factor −1/2. `SpinCurvature.lean`. | DIR §2.3, MATCH-E05 |
| FOT-E18b | Independently recompute the signs and factor. Integrate the per-field identity on a finite family's joint positive locus and on sets with a supplied floor. Preserve the zero-set term and integrability. `SpinDefectDensity.lean`. | DIR §2.3, MATCH-E05/E10/E15 |
| FOT-E22a/E24a/E33a | Check the homogeneous signed round eigenmode equation and its decay from the incoming endpoint. Check fixed-domain perturbation of an actual bounded isomorphism. `CylinderDirac.lean`. | MATCH-E01/E02/E09 |
| FOT-E30a/E31a/E32a | Solve the two supplied affine trace graphs with the two propagation directions, test a regular family's critical-mass obstruction and, if feasible, compose two jumps with a continuous global correction. `CoreTraces.lean`. | MATCH-E06/E07/E08 |
| FOT-E23a/E18d | Bound the first-order perturbation by the principal coefficient, connection coefficient and Sobolev constant. Use buffered interpolation and check the local differentiated estimate from cutoff absorption, first-order error and Ricci forcing. `SpinStrip.lean`. | Route 02 E14, EXTRACT-E01, MATCH-E10 |
| SPIN-E02 | Following SPIN-E01, construct the Route 02 accounting interface with strip-local measures, a.e. spinor density identities, individual floors, potentially growing covers and explicit uncovered energy. `SpinCoverAccounting.lean`. | SPIN-E01, FOT-E18b, Route 02 Accounting and ConformalEnergy |
| FOT-E18c (lead) | Compute the self-dual alternating derivative of the Clifford correction in an oriented normal frame and obtain the projected curvature formula on spin two-jets satisfying the spin commutator. Relate the result to the actual metric curvature block. | DIR §2.3, Route 03 GeometricChiralBlock, FOT-E18a |

The [baseline](../../../research-progress/01_BASELINE.md) is historical. This checkout already builds both public libraries. Route 02 completed its shared integration in an earlier session. Its [handoff](../../../02_neck_energy_accounting/research-progress/handoffs/INTEGRATION_20261125.md) and the [parent register](../../../research-progress/REGISTER.md) identify the public owner and the existing accounting interface. Intake found a clean tracked and untracked checkout, so this lead can integrate the Route 04 additions.

## Follow-on packets under B04

Each E request below used the same author, date, checkout, pins and isolated writer arrangement. These requests were issued as their prerequisites became available. Acceptance requires a checked declaration or a scoped API report, plus a comparison with the precise source hypothesis.

| Packet | Frozen question and output |
| --- | --- |
| E18e/f | Show that the positive spin lift preserves skew matrix brackets. Use Fréchet Hessian symmetry to compute the coordinate spin commutator and apply the lift to the matrix curvature. `SpinConnectionLift.lean`, `SpinCovariantJet.lean`. |
| E18g | Prove the pair symmetries of the actual metric frame curvature, hence symmetry of the compressed chiral block. `SpinMetricBlock.lean`. |
| E18h | Derive the signed spin Ricci contraction from Bianchi, identify the actual Ricci trace and test constant sectional curvature. Differentiate a local harmonic equation and expose the covector slot. `SpinRicciForcing.lean`. |
| E18i/k/m | Derive metric curvature from actual coordinate Christoffel coefficients in an aligned normal chart. Compare it with the transformed connection at a frame with identity value and zero first derivative, derive the first jets of the upper/lower Clifford symbols and compose with the local projected identity. `SpinLeviCivita.lean`, `SpinNormalGauge.lean`, `SpinNormalChart.lean`. |
| E18c follow-on, lead | Differentiate the coordinate definition of the twistor operator with varying symbols using Fréchet derivatives. Instantiate the metric jet and both measured strip interfaces. `SpinTwistorDerivative.lean`, `SpinJetResidual.lean`. |
| E02b, lead integration | Build accounting on each joint nonzero region, allowing different gauges and larger measured norm regions. Prove energy equality from summed squared ratio bounds. `SpinRatioAccounting.lean`, `SpinResidualEstimate.lean`. |
| E18j, E18j-cover | From MATCH-E11's regularized integrated estimate pass to the relative estimate with a.e. positive joint mass. Use integral and finite-sum Cauchy–Schwarz on the mixed term. For a physical region where weights sum to at least one, charge it to the sum of local weighted costs. `SpinRelativeBochner.lean`, `SpinCutoffCover.lean`. |
| E22b/E33b | Prove square-summable signed-mode propagation, the exact integrated midpoint floor test, and length-uniform modal bounds with continuous forcing. `CylinderSpectral.lean`. |
| E24b/E33c | Prove the resolvent identity with fixed incoming and outgoing maps. Obtain the small same-end reflection from the vanishing round reference block. `SpinReflection.lean`. |
| E20a/E19a | Obtain a unit-mass kernel element by compact embedding and weak Hilbert compactness; extend vanishing of a continuous block across a supplied dense nonzero locus. `SpinCompactness.lean`. |
| SPIN-E01v/E02v, E18v | Check overlapping measured strips, shrinking floors, growing cover costs, and a compatible Ricci-flat algebraic jet with nonzero projected curl and zero first jet. [Cover checks](SPIN_EXAMPLES.lean) · [Spin jet](SPIN_JET_EXAMPLE.lean) |
| E18/02v review | Independently inspect jet norms, gauge and measure restrictions, finite real norms and limit order. [Review with correction](../../reviews/RESIDUAL_PREMISE_CHECK_20261125.md) |
| E18n | Differentiate the actual Hilbert-space cutoff $\chi/(\|\Psi\|^2+\epsilon)^{1/2}$ and bound its squared operator norm times $Q$, using $Q\ge\|d\Psi\|_{\rm op}^2$. Check its finite-frame interpretation. `SpinBochnerCutoff.lean`. |
| SPIN-E02c | Derive iterated smallness of the summed relative Bochner budget from bounded total curvature and vanishing Ricci, relative fourth-power and cutoff costs. Compose with physical weighted coverage and the component energy identity. `SpinBochnerAccounting.lean`. |
| Verification | Replay two fractional weights on a single measured region, recheck the revised manuscript passages against intake, and inspect all new public types and axioms through the package entry point. [Fractional weights](SPIN_CUTOFF_EXAMPLE.lean) · [Audit input](PUBLIC_CHECKS.lean) |
