# Research plan — Cuts from geometry

26 November 2026, America/New_York. Prepared for Edward B. Baker III by Claude (Anthropic), model `claude-fable-5-2`, reasoning effort at the session's configured maximum. Setup baseline `4655e38`. The [overview](../research-overview/OVERVIEW.md) states the question and what is inherited; the [parent overview](../../research-overview/OVERVIEW.md) fixes the conventions and the route; statements are cited by their numbers in the [parent manuscript](../../manuscript/cuts_of_subcritical_conformal_classes.tex). The [register](../research-progress/REGISTER.md) alone owns live status. Nothing here is activated.

**Routing.** B tasks are conceptual and go to the lead; E tasks have fixed inputs, method and completion test and go to bounded helpers, as in the [model workflow](../../../../../GPT_RESEARCH_MODEL_WORKFLOW.md). In a Claude session Fable leads and takes B tasks and Opus takes E packets, in the roles that workflow gives Astra and Sol; a GPT lead uses Astra/ultra and Sol 6.2/ultra. The lead selected by the author takes precedence.

**Evidence and escalation.** An E return separates symbolic identities, interval bounds, floating diagnostics and proofs, and names every premise taken from another manuscript. An E task that meets a change of mechanism, target or evidence standard stops and returns to the B task named in its row, or to the lead. A B note records the alternatives considered and the reason for the choice.

| Task and routing | Input and reason for routing | Deliverable, stopping test and next decision |
| --- | --- | --- |
| SP4-CUT-GEO-B01 · B, Fable | Ready on activation. The primary route needs a canonical cut and flow. The simplest one-tube class already has a natural totally geodesic seam whose symmetric mean-convex flow collapses onto the core sphere, an index-two event on the standard sphere. The choice of object is conceptual. | A dated note that fixes one cut and one flow in an entering gauge, states the first falsifiable claim about index-two events on the standard-sphere examples, and specifies the computation that tests it as an E request. If no canonical choice survives the examples, say which alternative of the parent overview is entered. |
| SP4-CUT-GEO-E01 · E, Opus | Depends on GEO-B01 and on an explicit immersion named by 04. Evaluate \(\sigma_2\) of the second fundamental form restricted to hyperplane sections at mid-levels; by the Gauss equation in the hyperplane, the section has positive scalar curvature exactly where it is positive. | The sign of the restricted \(\sigma_2\) on the named levels, with the level where it first fails. |
| SP4-CUT-GEO-E02 · E, Opus | Ready on activation. Half of the product of two unit spheres closed by its conformally flat exterior, with \(\ell=2\pi\). Hypersurfaces invariant under the rotations of the sphere factor are products of that sphere with curves in a surface of revolution, so every quantity is one-dimensional. | The index and nullity of the totally geodesic seam; the list of invariant minimal hypersurfaces; the singular leaf of the invariant mean-convex flow from each. Stop at that table. |
| SP4-CUT-GEO-E03 · E, Opus | Ready on activation. Theorem 7.2 is stated for nondegenerate critical points, while singular leaves of flows have degenerate Hessians: for the cylinders over \(S^3\), \(S^2\) and \(S^1\) the numbers \(s_i\) are positive, positive and zero. Fixed inputs: the exact cylinders with a quadratic perturbation of the radius. | The extension of Theorem 7.2 to critical submanifolds, and for each cylinder the sign of the scalar curvature of nearby leaves at the first order where it is decided. Stop at the three models. |
| SP4-CUT-GEO-B02 · B, Fable | Ready on activation. Proposition 7.5 leaves one eigenvalue of the conformal Laplacian of the minimal cut undetermined. Possible approaches: a balancing argument with a second test function; use of the entering gauge beyond \(R>0\); a search for a counterexample among metrics of cohomogeneity one. | A dated note that selects one approach and states the inequality to be proved or the example to be computed, with the stop rule. A counterexample sends the parent route to its first alternative. |
| SP4-CUT-GEO-B03 · B, Fable | Reserved. Cuts that are positive by construction: stable hypersurfaces of a prescribed-mean-curvature functional in a wide band, as in the band criterion of 05. | A decision whether such cuts exist in an entering gauge with the available width, and what sweepout question is asked of them. |

**Order.** GEO-E02 and GEO-E03 first, in parallel: they are the inputs of GEO-B01. Then GEO-B01 and GEO-B02. GEO-E01 waits for an immersion from 04. A failed test is recorded with its evidence and followed by the alternative named in the [overview](../research-overview/OVERVIEW.md#place-in-the-route-to-the-conjecture); it does not end a session.

**Stop.** Only at an end state named in the [continuation note](../continuation-notes/CONTINUATION.md), or at an author decision. A return that changes a statement of the parent manuscript or of another branch is handed off and the work continues. The completion of the rows above is not a stop: they are the first horizon, and the lead adds the next rows as that note describes. This rule was revised on 27 November 2026 at the author's instruction. Results go to the parent lead for the lane decision SP4-CUT-B01 in the [parent plan](../../research-plan/PLAN.md). Numerical work stays within the scope stated in its row.

**Launch.** Use the prompt in this child's [continuation note](../continuation-notes/CONTINUATION.md).

## Activated extensions • 27 November 2026

The opening paragraph describes setup. The [live register](../research-progress/REGISTER.md) and [cut selection](../brainstorm/notes/CUT_SELECTION_20261127.md) record activation. All IDs below have prefix SP4-CUT-GEO. Conceptual work stays with the selected lead. Frozen execution requests give inputs, bounds, evidence, output ownership and escalation.

| ID | Fixed method and dependency | Completion or escalation |
| --- | --- | --- |
| E04 | Zhou source and parent index estimate; independent of example | Exact width theorem, remaining scalar sign. [Request](../research-progress/handoffs/ISSUE_20261127.md) |
| E05 | G6, named examples in the 04 manuscripts | Actual axial and transverse levels and a regular sign test at the inserted births. If profiles are unspecified report the affected levels. [Request](../research-progress/handoffs/ISSUE_20261127.md) |
| E06 | G3, normal jets and projection off Jacobi ground state | A tested strictly pinched germ, and a one-dimensional sign criterion. Global realization returns to B02. [Request](../research-progress/handoffs/ISSUE_SECOND_20261127.md) |
| E07 | G5, Räde, marked width and calibrated prescribed curvature | Test coercivity, marking and ordinary flow endpoints. Return unforced width to B03. [Request](../research-progress/handoffs/ISSUE_SECOND_20261127.md) |
| E08 | B01 and model results; direct orbit ODE and metric-generated angular height | Test smooth compact entering gauge, opposite cut and Section 6 applicability. New symmetry assumptions return to B01. [Request](../research-progress/handoffs/ISSUE_REPLAYS_20261127.md) |
| E09–E11 | Independent readings after each named input has been written | Recompute statements and check sources, return corrections and overlooked approaches for execution. [Assignments](../research-progress/handoffs/ISSUE_REPLAYS_20261127.md) |

E12 tests the global least-area comparison and a spectral choice of height on a smooth neighborhood of the round metric. Its [fixed issue](../research-progress/handoffs/ISSUE_NEAR_ROUND_20261127.md) gives the regularity, source, stop and failure conditions. A general quantitative neighborhood from intrinsic pinching would require a new input.

E13 depends on global one-sheet convergence in E12; the [alignment issue](../research-progress/handoffs/ISSUE_ALIGNMENT_20261127.md) tests whether a metric-selected height can have the *given* first-width hypersurface as its zero set, and whether all resulting levels have positive induced scalar curvature. A different reader checks compactness and alignment together.

E14 reformulates a sufficient spectral height test directly on the entering metric, checks it on round coordinate and orbit heights, and separately replays the missed angular area approach from E11. [Fixed scope](../research-progress/handoffs/ISSUE_INTRINSIC_TEST_20261127.md).

E15 responds to the newly supplied TUBE interval certificate. On the single two-twist trefoil cap compute and compare its radial cuts in the two specified conformal gauges. [Frozen issue](../research-progress/handoffs/ISSUE_TREFOIL_FACE_20261127.md).

## G3 reopening • the fixed Berger germ

GEO-B04 selects a boundary curvature calculation and an explicit smooth test manifold. GEO-E16 computes the nonumbilic APS correction; E17 independently subtracts a flat polar connection; E18 controls a closed two-pole suspension and its meridian. E19 and E20 independently read the signed flux, per-cap Euler budget and full angular sweepout. The [first issue](../research-progress/handoffs/ISSUE_BERGER_COMPLETION_20261127.md) and [reader addendum](../research-progress/handoffs/ISSUE_BERGER_REPLAY_ADDENDUM_20261127.md) give outputs, assumptions and stop conditions.

A bounded [E21 full angular integration](../research-progress/handoffs/ISSUE_BERGER_ANGULAR_INTEGRAL_20261127.md) records the area itself on E18's failed completion, with the analytic strict comparison independently available.

E22 checks the remaining option of changing only the magnitude of the horizontal shear on the fixed endpoint metric. [Bounded task](../research-progress/handoffs/ISSUE_BERGER_SHEAR_20261127.md). The [reopened G3 result](../notes/BERGER_COMPLETION_OBSTRUCTION_20261127.md) settles the prescribed completion question. The [next candidate](../continuation-notes/AFTER_BERGER_OBSTRUCTION_20261127.md) changes the marked Cauchy data.
