# Research plan — Seams and marked cuts

26 November 2026, America/New_York. Prepared for Edward B. Baker III by Claude (Anthropic), model `claude-fable-5-2`, reasoning effort at the session's configured maximum. Setup baseline `4655e38`. The [overview](../research-overview/OVERVIEW.md) states the question and what is inherited; the [parent overview](../../research-overview/OVERVIEW.md) fixes the conventions and the route; statements are cited by their numbers in the [parent manuscript](../../manuscript/cuts_of_subcritical_conformal_classes.tex). The [register](../research-progress/REGISTER.md) alone owns live status. Nothing here is activated.

**Routing.** B tasks are conceptual and go to the lead; E tasks have fixed inputs, method and completion test and go to bounded helpers, as in the [model workflow](../../../../../GPT_RESEARCH_MODEL_WORKFLOW.md). In a Claude session Fable leads and takes B tasks and Opus takes E packets, in the roles that workflow gives Astra and Sol; a GPT lead uses Astra/ultra and Sol 6.2/ultra. The lead selected by the author takes precedence.

**Evidence and escalation.** An E return separates symbolic identities, interval bounds, floating diagnostics and proofs, and names every premise taken from another manuscript. An E task that meets a change of mechanism, target or evidence standard stops and returns to the B task named in its row, or to the lead. A B note records the alternatives considered and the reason for the choice.

| Task and routing | Input and reason for routing | Deliverable, stopping test and next decision |
| --- | --- | --- |
| SP4-CUT-SEAM-E01 · E, Opus | Ready on activation. Corollary 4.4 and Theorem 5.2 against the exact statements of 05's mixed-presentation theorem and 07's seam tests. | A list of hypotheses that match, differ or are missing, and the insert-ready form of the two statements for 05 and 07. Stop at that list. A mismatch in the definition of domination or of a seam goes to SEAM-B01. |
| SP4-CUT-SEAM-B01 · B, Fable | Ready on activation. A quantitative form of the umbilic statements needs a cost of a cap for a Cauchy datum near the round one and a constant in statement (3) of Theorem 4.1. Whether Biquard's filling theory or an explicit interpolation gives a usable bound is undecided. | A definition of the capping cost, one inequality to be proved, and its use in Proposition 8.1 and Corollary 4.4. If neither source gives a bound, record the missing estimate and close the quantitative lane. |
| SP4-CUT-SEAM-E02 · E, Opus | Depends on SEAM-B01. The inequality it fixes, in the linearized regime at the round umbilic datum. | The second-order expansion of the capping cost at the round datum and the inequality with its constant in that regime, or the mode in which it fails. |
| SP4-CUT-SEAM-B02 · B, Fable | Ready on activation. Theorem 5.2 assumes positive doubles. The sign of a double is governed by a conformally invariant quadratic form with a boundary term in the mean curvature, and the two sides see that term with opposite signs. Which sufficient condition to adopt is undecided. | A dated note that fixes one verifiable criterion for positive doubles, for example a seam that is totally geodesic in the entering gauge, or restates the atlas with the bound \(e_V\ge T\chi(V)-Y(\mathcal DV)^2/96\). State which of 07's seams satisfy it. |
| SP4-CUT-SEAM-E03 · E, Opus | Ready on activation. The manuscript proves the atlas for levels \(\#_kS^1\times S^2\) and asserts the general balance of Euler characteristics in one sentence. | The full statement with proof for every seam with positive doubles whose three-manifold is a connected sum of spherical space forms and copies of \(S^1\times S^2\), with the list of allowed sides. Stop at the list, or at the first case the two inequalities do not decide. |
| SP4-CUT-SEAM-B03 · B, Fable | Reserved. Recognition at the winding-one cut when the cut is only nearly umbilic. | A decision whether the nearly umbilic corollary is attainable with the bounds in hand, and the first E request if it is. |

**Order.** SEAM-E01 and SEAM-E03 first, in parallel; then SEAM-B02 and SEAM-B01; SEAM-E02 follows SEAM-B01. A failed test is recorded with its evidence and followed by the alternative named in the [overview](../research-overview/OVERVIEW.md#place-in-the-route-to-the-conjecture); it does not end a session.

**Stop.** Only at an end state named in the [continuation note](../continuation-notes/CONTINUATION.md), or at an author decision. A return that changes a statement of the parent manuscript or of another branch is handed off and the work continues. The completion of the rows above is not a stop: they are the first horizon, and the lead adds the next rows as that note describes. This rule was revised on 27 November 2026 at the author's instruction. Results go to the parent lead for the lane decision SP4-CUT-B01 in the [parent plan](../../research-plan/PLAN.md). Numerical work stays within the scope stated in its row.

**Launch.** Use the prompt in this child's [continuation note](../continuation-notes/CONTINUATION.md).

## Activated research, 27 November 2026

The launch's end states apply. B02 chose the whole-side Robin test and B01 chose a marked hemisphere extension. The current work and evidence are in the [register](../research-progress/REGISTER.md). In the following table every E packet is routed to Sol 6.2/ultra when available, with the selected lead retaining B decisions. Each packet stops at a proof, a corrected statement or the stated unresolved input.

| ID | Fixed route and readiness | Output and escalation |
| --- | --- | --- |
| E04 | After B02/B01, replay reflection, the four-dimensional Robin form and §8 in the limit of smooth caps. | Sign and strict descent tests. Return missing coercivity to B02. |
| E05 | After choice of B01 extension, independently obtain the analytic lower bound needed for B03 in a fixed entering gauge. | Exact constants, scopes and marked corollary. Return loss of uniformity to B03. |
| E06 | After first atlas analysis, apply invariant bounds on finite covers, CGY, integral homology and known spherical embedding constraints. | Remaining cases and thresholds. Return missing geometry to B04. |
| B04 | Lead, once unrestricted spherical factors survive the first inequalities. Select the next test and organize the residual realization question. | Exact shared-boundary filling criterion, model controls or narrower obstruction. |
| E07 | On written geometry proofs, replay E02, E04 and E05 by a nonauthor for each. | Signed coefficient, regularity and uniformity readbacks. Reopen any failed claim. |
| E08 | On written applications, replay E01, E03, E06 and the paired filling criterion by nonauthors. | Exact recognition and atlas readbacks, including a search for missed routes in the reduction. |
| B05 | After E08C proposed a concrete reducible spherical exception, choose a punctured-lens model with its marked deck map. | Try the proposed exception, then identify a sign, marking, or energy obstruction. |
| E09 | B05 fixed the round punctured lens and a capped half-disk. | Actual matching, signed budget and Robin sign, or the exact obstruction and next test. |
| E10 | Test the required opposite endpoint signs by the curvature flux and Dirichlet energy, for the unit base and then constant base curvature. | A checked bound in the stated model. Escalate changes of exterior or fibre metric to B04. |
| E11 | After the side-group refinement and lens estimates, independently replay the marked, analytic and topological conclusions. | Corrected final wording, inputs for the receiving investigations, and explicit scope of the outstanding realization test. |
