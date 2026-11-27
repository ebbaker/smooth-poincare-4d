# Research plan — cut geometry and chirality

26 November 2026, America/New_York. Prepared for Edward B. Baker III by Claude (Anthropic), model `claude-fable-5-2`, reasoning effort at the session's configured maximum. Setup baseline `4655e38`; first written 26 November 2026 at `841d606` and revised when the child plans were created. The [overview](../research-overview/OVERVIEW.md) fixes the category, conventions and the route. The [register](../research-progress/REGISTER.md) alone owns live status. Nothing here is activated.

**Routing.** B tasks are conceptual and go to the lead; E tasks have fixed inputs, method and completion test and go to bounded helpers, as in the [model workflow](../../../../GPT_RESEARCH_MODEL_WORKFLOW.md). In a Claude session Fable leads and takes B tasks and Opus takes E packets, in the roles that workflow gives Astra and Sol; a GPT lead uses Astra/ultra and Sol 6.2/ultra. The lead selected by the author takes precedence.

**Evidence and escalation.** An E return separates symbolic identities, interval bounds, floating diagnostics and proofs, and names every premise taken from another manuscript. An E task that meets a change of mechanism, target or evidence standard stops and returns to the B task named in its row, or to the lead. A B note records the alternatives considered and the reason for the choice.

| Task and routing | Input and reason for routing | Deliverable, stopping test and next decision |
| --- | --- | --- |
| SP4-CUT-E02 · E, Opus, independent reader | Ready on activation. Sections 2 to 5, 7 and 8 of the [manuscript](../manuscript/cuts_of_subcritical_conformal_classes.tex). The claims and proofs are fixed. | A line-by-line replay of each proof, with every gap, sign or hypothesis that fails listed against its statement. Stop when each numbered statement is marked replayed, corrected or open. Corrections go to the lead; a failed statement that a child or another branch already uses triggers a handoff to its register. |
| SP4-CUT-B01 · B, Fable | Depends on SP4-CUT-LED-E01, SP4-CUT-E02 and at least one of SP4-CUT-GEO-B01, SP4-CUT-TUBE-B01, SP4-CUT-SEAM-B01. Chooses the closing lane for the sphere statement and what is returned to entry. | A decision note with the lane, the reason, the first E request in that lane, and the condition under which the choice is revisited. This is the first assessed milestone of the parent. |

The other tasks first listed here now live in the child plans, with their definitions unchanged and new identifiers given in the [crosswalk](../research-progress/CROSSWALK_20261126.md).

| Child plan | Family | Question | Ready on activation |
| --- | --- | --- | --- |
| [Chirality ledger](../01_chirality_ledger/research-plan/PLAN.md) | `SP4-CUT-LED` | How much of the two chiral energies of a piece of a four-manifold is fixed by the Cauchy datum \(([h],B^\circ)\) of its boundary, and what does that fix on a neck, a seam or a half-flat piece? | LED-E01, LED-E02, LED-B01 |
| [Seams and marked cuts](../02_seams_and_marked_cuts/research-plan/PLAN.md) | `SP4-CUT-SEAM` | Which levels of a handle presentation can be seams of an entering class, and what does a seam, or a cut that is nearly one, recognize? | SEAM-E01, SEAM-B01, SEAM-B02, SEAM-E03 |
| [Tubes and exteriors](../03_tubes_and_exteriors/research-plan/PLAN.md) | `SP4-CUT-TUBE` | What can be built by closing one tube, and what must the exterior of the tube carry for the result to be a nonstandard type? | TUBE-B01, TUBE-E01, TUBE-E02, TUBE-B02 |
| [Slide filters](../04_slide_filters/research-plan/PLAN.md) | `SP4-CUT-SLIDE` | What do the filters of the slide enumeration prove about the number of slides needed with arbitrary band paths, and what do the same representations certify about cuts? | SLIDE-E02 |
| [Cuts from geometry](../05_cuts_from_geometry/research-plan/PLAN.md) | `SP4-CUT-GEO` | Does an entering gauge produce a cut, and a sweepout starting from it, from which the sphere can be recognized? | GEO-B01, GEO-E02, GEO-E03, GEO-B02 |

**Order.** SP4-CUT-LED-E01, SP4-CUT-E02 and SP4-CUT-SEAM-E01 first, in parallel on disjoint files: they test what the other branches would use. Then the first decision of each child on the route (SP4-CUT-GEO-B01 with its inputs GEO-E02 and GEO-E03, SP4-CUT-TUBE-B01, SP4-CUT-SEAM-B01), then SP4-CUT-B01. The remaining ready tasks are independent. A failed test is recorded with its evidence and followed by the alternative named in the overview; it does not end the session.

**Stop.** At the SP4-CUT-B01 milestone; at an independently read statement that changes the status of entry or of the sphere statement; at a refuted statement that another branch already uses, after the handoff; or at an author decision.
