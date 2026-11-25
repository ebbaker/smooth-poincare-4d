# Single spherical cut and descent · Progress register

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. The serving model variant and reasoning effort are unavailable.

This is the sole live status register for Route 03, including inherited FOT-E25, E26 and E28. [Task definitions and acceptance tests](../research-plan/PLAN.md) · [Current program plan](../../research-plan/02_PLAN.md) · [Program register](../../research-progress/REGISTER.md) · [Evidence at issue](../../research-progress/02_BASELINE.md)

## Version 02 tasks

| Task | Current state | Next proof or premise |
| --- | --- | --- |
| SP4-FORM-CUT-B02 | Adopted and used | The source sides cover the manifold, are volume-a.e. disjoint and both have signed collar data. Either can be retained. |
| SP4-FORM-CUT-E02 | Verified through the inclusive cap threshold | For actual positive capped metrics, either the measured cap sum or the sum of full raw masses and both costs may be at most twice the threshold. The tie preserves both marked side images in the oriented sphere identification. Positive signs and recognition at an attained threshold remain inputs. [Endpoint](handoffs/ED03_INCLUSIVE_CUT.md) |
| SP4-FORM-CUT-E03 | Ready to specify the tensor estimate | Derive the uniform cutoff and chiral projection error on the actual splice. The inherited norm inequality already consumes a supplied projection bound. |
| SP4-FORM-CUT-E04 | Positive-path and cut interfaces available | Use the common gap on the original joined type. The short interpolation, stretch and transfer of signs to the completed caps remain open. |
| SP4-FORM-CUT-E05 | Reserved | Prove the critical fixed-distortion estimate on the supplied enlarged harmonic shell and reduce to the short marked cut. Physical production of such a shell is open. |

The proofs in the next table concern the previously specified core. The [dated baseline](../../research-progress/02_BASELINE.md) identifies precisely which parts can be reused.

## Version 01 tasks

| Task | Current evidence | Remaining premise or next proof |
| --- | --- | --- |
| SP4-FORM-CUT-B01 | Adopted the normal ball, physical embedding, oriented signed collar and specified exterior. The Euclidean radial marking and two-open-patch reassembly are checked. | Realize the supplied smooth charts and cover geometry from the marked geometric cut. [Decision](../brainstorm/notes/MARKED_BOUNDARY_DECISION_20261125.md) |
| SP4-FORM-CUT-E01 | Verified with the exact launch type, the full-error endpoint and a checked equality example. Also verified the strictly smaller error variant at threshold bubble cost. | Closed. [Proof receipt](handoffs/CUT_E01_RETURN.md) |
| SP4-FORM-FOT-E25 | Conditional smooth reassembly. The marked correction acts on an open cap neighborhood. The maps glue to an actual oriented diffeomorphism with both restrictions. Recognition of the specified exterior targets the standard smooth unit sphere. | Construct the capped homotopy-sphere data, instantiate the parent strict sphere theorem and Palais neighborhood-extension input, and verify the actual signed charts and their domains. [Audit](../reviews/MARKED_DESCENT_AUDIT_20261125.md) · [Patch constructor](handoffs/PATCH_RETURN.md) |
| SP4-FORM-FOT-E26 | The two local form bounds, an IMS identity and measured cutoff cost give the Rayleigh lower bound. Integrated smooth Weyl/Bach costs and first-order splice estimates are checked under separate hypotheses. | Prove the closed capped metric's form comparisons and curvature bounds on the actual splice, including identification of the tested quotient with its class Yamabe constant. [Forms](handoffs/CAP_RETURN.md) · [Splice](handoffs/CAP_SPLICE_RETURN.md) |
| SP4-FORM-FOT-E28 | Fixed-core comparison charges the entire complement; joint cut selection fixes length, radius and source index. Strict and quantitative variational bounds follow on the original smooth type from a marked metric transfer and the corresponding Route 02 residual inputs. | Realize the metric and topological premises on the same chosen cut, the component identities and the strict or uniform deficit. Audit general conformity with the manuscript energy, including arbitrary frame independence. [Core](handoffs/CORE_RETURN.md) · [Selection](handoffs/SELECTION_RETURN.md) · [Yamabe transport](handoffs/YAMABE_RETURN.md) |

## Setup evidence

On 25 November 2026 the opening proposition in the route plan elaborated as `Prop` using `lake env lean --stdin` under Lean `4.35.0-rc3`. The existing package built successfully (1,619 jobs). `FirstOrderTwistor.exteriorEnergyLtThreshold` was a planned declaration at setup. The table above records its subsequent proof. [Checked proposition type](../research-plan/PLAN.md) · [Package pins and existing proofs](../../research-progress/01_BASELINE.md#lean-evidence)

The route lead records dated returns here, including the actual prover and effort when available. The program integrator owns shared build files, blueprint edits and FOT-E34. [Sustained continuation prompt](../continuation-notes/CONTINUATION.md) · [Platform roles](../../../FORMALIZATION_SETUP_WORKFLOW.md#platform-guidance)


## Activation and review · 25 November 2026

The route opened at `7db310a` and integrated the new Route 02 component and measure declarations at `0c3399d`. Read the [requests and version checks](handoffs/ACTIVATION_20261125.md), [integration evidence](handoffs/INTEGRATION_20261125.md) and [next session](../continuation-notes/AFTER_MARKED_DESCENT_20261125.md). The working manuscript and joint-note hashes agree with the Version 01 baseline. The later [second collar assessment](../../../../papers/investigations-1/03_first_order_twistor/reviews/SECOND_COLLAR_ASSESSMENT_20261125.md) concerns additional base alternatives and does not weaken the full-core hypothesis in this route.

On the compactified metric, `geometricChiralBlock` evaluates all four slots of Levi-Civita curvature in a real oriented orthonormal tangent basis, compresses to the normalized self-dual basis and removes the scalar trace. Curvature in the frame transported through the marked diffeomorphism agrees pointwise. This discharges the earlier audit's coefficient-identification concern for the new geometric-energy theorem. Its variational set contains energies of actual metrics with a positive class Yamabe constant and integrable squared block norm in a pointwise frame. A separate Hodge/coordinate comparison concerns arbitrary unrelated frames. [Curvature block](handoffs/GEOMETRIC_BLOCK_RETURN.md) · [Transported frame](handoffs/FRAME_PULLBACK_RETURN.md) · [Geometric variational theorem](../../../FirstOrderTwistor/GeometricCutDescent.lean)

A positive closed Bach-flat class above the recognition threshold can survive the decrease. Passing to another cut or continuing the descent requires additional geometry. The formal results use distinct metrics on the capped exterior and on the compactification, with the latter pulled back to the source. The paper's Bach-flatness of the transferred representative, general collar extraction and termination remain outside the checked conclusion.

The assembled `oneCutDescent` theorem now uses the same oriented map for the fixed-core equality, the positive Yamabe constant, the integrable curvature energy and the strict and conditional uniform bounds. Its recognition premise tests the metric on the specified exterior. The [third collar assessment](../../../../papers/investigations-1/03_first_order_twistor/reviews/THIRD_COLLAR_ASSESSMENT_20261125.md) gives more information about physical volume balls. Producing the requisite marked full core and separating cut on the approximately critical source sequence remains open. [One-cut theorem and audit](handoffs/ONE_CUT_RETURN.md)

**Edition 03 activation, 25 November 2026.** [Public integration and hypothesis audit](../../research-progress/handoffs/ED03_INTEGRATION_20261125.md) · [Next geometric tasks](../../continuation-notes/AFTER_PHYSICAL_QUANTILES_AND_INDUCED_CURVATURE_20261125.md)

**25 November 2026 · Geometric realization.** [Assessed chart and immersion milestone](../../research-progress/handoffs/ED03_CHART_GEOMETRY_20261125.md) · [Dated continuation](../../continuation-notes/AFTER_OPEN_EQUALITY_AND_MARKED_SHELL_20261125.md)
