# Research plan — Tubes and exteriors

26 November 2026, America/New_York. Prepared for Edward B. Baker III by Claude (Anthropic), model `claude-fable-5-2`, reasoning effort at the session's configured maximum. Setup baseline `4655e38`. The [overview](../research-overview/OVERVIEW.md) states the question and what is inherited; the [parent overview](../../research-overview/OVERVIEW.md) fixes the conventions and the route; statements are cited by their numbers in the [parent manuscript](../../manuscript/cuts_of_subcritical_conformal_classes.tex). The [register](../research-progress/REGISTER.md) alone owns live status. These were the pre-activation priorities of 26 November. The dated extension records the activated work.

**Routing.** B tasks are conceptual and go to the lead; E tasks have fixed inputs, method and completion test and go to bounded helpers, as in the [model workflow](../../../../../GPT_RESEARCH_MODEL_WORKFLOW.md). In a Claude session Fable leads and takes B tasks and Opus takes E packets, in the roles that workflow gives Astra and Sol; a GPT lead uses Astra/ultra and Sol 6.2/ultra. The lead selected by the author takes precedence.

**Evidence and escalation.** An E return separates symbolic identities, interval bounds, floating diagnostics and proofs, and names every premise taken from another manuscript. An E task that meets a change of mechanism, target or evidence standard stops and returns to the B task named in its row, or to the lead. A B note records the alternatives considered and the reason for the choice.

| Task and routing | Input and reason for routing | Deliverable, stopping test and next decision |
| --- | --- | --- |
| SP4-CUT-TUBE-B01 · B, Fable | Ready on activation. The exterior gap: a piece with the rational homology of a circle, umbilic boundary \(S^1\times S^2\), positive double and \(e_X<\tfrac23T\). Possible approaches: stability of the equality case of Gursky's inequality on the double; classification when \(e_X=0\); a counterexample from a twisted exterior. | A dated note that selects one approach, states the target inequality or classification and what would refute it, and hands the computation to an E request. If the sign of the double cannot be controlled, return that as the obstruction. |
| SP4-CUT-TUBE-E01 · E, Opus | Ready on activation. The functional (6.3), the boundary data of the two-twist-spun trefoil row of Remark 6.3, and one profile. Interval arithmetic on a fixed admissible cap. | A certified upper bound below \(8\pi^2\) for one explicit cap with positive scalar curvature, or the precise step at which the enclosure fails. One example only. |
| SP4-CUT-TUBE-E02 · E, Opus | Ready on activation. The Euler–Lagrange system of (6.3) and its first integrals. A fixed calculation. | The equations for \((a,F)\), the conserved quantity of the untwisted case, the natural condition at the free length, and a comparison with the direct minimization of the checks on three rows. Stop at agreement to the accuracy of the checks, or at the row that disagrees. |
| SP4-CUT-TUBE-B02 · B, Fable | Ready on activation. Proposition 6.2 removes every circle-symmetric tube. What is left: exteriors with nonabelian holonomy on the normal sphere, exteriors that carry Weyl energy, and tubes around a projective plane with a quaternionic seam of \(\lvert\eta\rvert<\tfrac23\). Which is examined first, and what has to be computed for a tube without symmetry, is undecided. | A dated note that names one candidate class, the invariant to compute and the stop rule. Candidates for entry are returned to 07 and master B02 by handoff. |
| SP4-CUT-TUBE-E03 · E, Opus | Depends on TUBE-B01. The case \(e_X=0\): the double is a closed conformally flat manifold of positive Yamabe type with the rational homology of \(S^1\times S^3\). The statements about such manifolds were quoted from memory in the proposing note and must be taken from the primary sources. | The classification with each cited theorem inspected and its hypotheses matched, concluding which exteriors occur and whether their closings are standard; or the first hypothesis that cannot be verified. |
| SP4-CUT-TUBE-B03 · B, Fable | Reserved. Tubes around surfaces: by Corollary 4.3 an umbilic tube has a sphere or a projective plane as core, and nothing is known for tubes that are not umbilic. | Agreement or refusal recorded by handoff. On agreement, a statement of what this branch computes for 07 and what it does not. |

**Order.** TUBE-E02 and TUBE-E01 at any time; TUBE-B01 first among the decisions; TUBE-E03 follows it; TUBE-B02 after the first returns. A failed test is recorded with its evidence and followed by the alternative named in the [overview](../research-overview/OVERVIEW.md#place-in-the-route-to-the-conjecture); it does not end a session.

**Stop.** Only at an end state named in the [continuation note](../continuation-notes/CONTINUATION.md), or at an author decision. A return that changes a statement of the parent manuscript or of another branch is handed off and the work continues. The completion of the rows above is not a stop: they are the first horizon, and the lead adds the next rows as that note describes. This rule was revised on 27 November 2026 at the author's instruction. Results go to the parent lead for the lane decision SP4-CUT-B01 in the [parent plan](../../research-plan/PLAN.md). Numerical work stays within the scope stated in its row.

**Launch.** Use the prompt in this child's [continuation note](../continuation-notes/CONTINUATION.md).

## Dated extension, 27 November 2026

Research was activated under the launch note. B01 tested equality and collapse, B02 selected the framed sphere and projective-plane cap models, and [B04](../brainstorm/notes/B04_BEYOND_EQUALITY.md) selected relative pinching and actual native meridians. Each bounded row has its rationale, inputs, mathematical completion test, disjoint output and escalation in the [frozen requests](../research-progress/handoffs/README.md); all use Sol 6.2/ultra routing. The current status is in the register.

| E packet | Fixed scope and completion |
| --- | --- |
| E04 | Replay parent cap, topology, collar regularity and lower bound, or identify the failing implication. |
| E05 | Construct the short-circle exterior, compute its fillings, and test fixed nonperiodic paths. |
| E06 | Minimize the untwisted cap in the area variable and distinguish the thin limits. |
| E07 | Replay the quaternionic disk obstruction, its marked axis and the attempted triaxial extension. |
| E08 | Nonproducer replay of the trefoil certificate, variational comparison and continuum minimum. |
| E09 | Nonproducer replay of the smooth reflected equality case and positive-energy collapse. |
| E10 | Replay of the framed holonomy bound, round-fiber class and group hypotheses. |
| E11 | Use the five supplied peripheral lifts without enlarging the slide enumeration. |
| E12 | Replay of relative Yamabe pinching on the double and its marked group consequence. |
| E13 | Check the claimed identification of the two specific doubled disks against both primary papers and the native boundary marking. |
| E14 | Test the eta-admissible short-axis marking on one smooth positive-scalar cap by a fixed round-to-Berger collar construction. |
| E15 | Verify intrinsic quaternionic spherical rigidity, its one-sided consequences and the new short-axis realization. |
| E16 | Verify the complete signed nonabelian connection formula and the actual sweepout cap. |
| E17 | In response to SEAM, test one bounded family of direct triaxial short-axis caps, with a rigorous sign and upper bound required for success. |
| E18 | Identify the actual short-axis switched gluing in the round orbit diagram, and test all smooth boundary markings between the same two disk bundles. |
| E19 | Validate one actual direct-trial cost and sign at the short-axis marking against the strict single-filling budget. |
| E20 | Read back the switched pair and the fixed direct triaxial profile, its signed cost and scope. |
| E21 | Test a positive finite-width shear change keeping an open region of the actual round chamber, in response to E20. |
| E22 | On an actual fibered exterior, test the aspherical-prime obstruction from stable minimal hypersurfaces in its positive double. |
| E23 | Independently read the fiber obstruction, the long-circle sign test, and the two round-chamber estimates. |
| E24–E25 | Test and independently check pointed finite-order realization on each transitive one-sided spherical space form, carrying both framings. |
| E26 | For a fixed positive-scalar fiber path compute the finite-base-length budget before choosing a different exterior or a collapse. |

[B05](../brainstorm/notes/B05_DIRECT_SHORT_AXIS.md) chose the direct short-axis trial and [B06](../brainstorm/notes/B06_ROUND_CHAMBER.md) records the subsequent decisions and packet bounds. See the [dated continuation](../continuation-notes/RESUME_20261127.md) for the next inputs and stopping tests.

E27 replays the finite-length coefficients, their static normalization, and the two ends of the positive half-flat collar in a [bounded independent reading](../research-progress/handoffs/E27_REQUEST_R1.md).

E28 checks the concrete order-seventeen based action and exact displacement. E29 checks the finite-length energy obstruction for its actual localized puncture motion over the entire chosen radial cutoff class. Both are bounded to the [marked prism calculation](../notes/MARKED_PRISM_17.md).

E30 tests the gradient correction of the transvection with the same prescribed inner and outer germs. It determines whether the magnetic obstruction persists under this additional freedom and records the remaining electric and Yamabe terms. [Frozen scope](../research-progress/handoffs/E30_REQUEST_R1.md).

E31 independently checks the acceleration cost and the transverse tracefree stress estimate on the actually transported round shell, including the scope of the fixed-profile and time-end hypotheses. [Frozen request](../research-progress/handoffs/E31_REQUEST_R1.md).

E32 independently checks the gradient-corrected through-running trial, including the angular integral, strict thresholds and end jets. [Frozen request](../research-progress/handoffs/E32_REQUEST_R1.md).

E33 tests a positive-double Yamabe obstruction for arbitrary localized divergence-free extensions of the true moving puncture. The test includes nonresting motions and time-dependent spatial profiles. [Frozen request](../research-progress/handoffs/E33_REQUEST_R1.md).

## Next decision and dependent packets

| ID and owner | Input and readiness | Evidence required to finish |
| --- | --- | --- |
| B07, lead | The [actual order-seventeen model](../notes/MARKED_PRISM_17.md) survives the topological tests. The computed localized families exceed the energy ceiling. Choose a genuinely different background or deformation and specify the entire marked path. | Identify the part of the angular geometry, volume transport or exterior curvature that changes the proved estimates. Freeze E34 when the physical metric and its jets are specified. |
| E34, bounded Sol | Depends on a B07 metric on the same marked mapping torus. Use the single-exterior normalization, signed costs, and the exact doubled sign test in E26. | One certified energy-and-positivity decision or a quantified obstruction on the specified family. An unknown smooth filling with a passing metric returns to 07 and master. |
| B08, lead | The [short-axis positive filling](../notes/E19_TRIAXIAL_CERTIFICATE.md) and the positive half-flat face germ provide initial data. No qualifying cap has been supplied. | Give a marked core continuation with a bound on the smaller chirality, or a coercive estimate on all such cores. Route a fixed calculation as E35 after choosing its geometric input. |
| E35, bounded Sol | Depends on B08. Fix the actual short collapsing axis, outward chirality, positive Neumann sign and whole disk bundle. | Compare the smaller energy with \(3\pi^2/2\) and preserve the strict endpoint. Communicate the qualifying cap or exact failure to SEAM. |

## Second turn, 27 November 2026

[B07](../brainstorm/notes/B07_GLOBAL_PRISM.md) fixes a global velocity, optical radial bend, Seifert collapse and through-running transport along the full projected geodesic. [B08](../brainstorm/notes/B08_COVER_SIGNATURE.md) tests the marked double cover, a complex-structure obstruction and the conic side of the Fubini–Study model. E34–E41 have disjoint bounded scopes in the handoffs folder, including complete signed integrals whenever a metric is tested.

## Dependent calculations on the marked groups and fillings

B09 selected the order-twelve branched surgery calculation, genuine orbifold comparison and native monopole quotient. B10 uses the Hopf projection of the actual section and the two old singular strands. The [new packet receipt](../research-progress/handoffs/RETURNS_SECOND_20261127.md) pairs each ID with its scope, owner and return.

| IDs | Owner and input | Decision tested |
| --- | --- | --- |
| E34–E40, E43–E47, E53 | Bounded Sol/ultra on the round and Berger prism, the geodesic tube, lens cover and invariant cap | Sharp strain and static bend cost, genuine transport or fixed-complement obstruction; check the actual covering and framings |
| E41–E42, E49–E50, E52, E55–E56 | Bounded Sol/ultra on conic orbit shapes, half-flat germ and Atiyah–Hitchin quotient | Pass or exclude the signed short-axis budget; distinguish local resolution from replacing a whole annulus |
| E48, E51, E54, E57–E59 | Bounded Sol/ultra and lead on the actual 68-circle lift and lens quotient | Recover actual primitive slopes, groups, ordinary core isotopy and scope for smooth recognition |
| E60–E63 | Bounded Sol/ultra, actual marked Hopf and Dirichlet models | Keep the singular locus through the knot isotopy and compute a marked diagram or presentation, including both basic slopes |
| E64–E69 | Bounded Sol/ultra on the developed circuit, marked Hopf crossing and drill-and-fill covers | Compare both native branch doubles, compute the centered Alexander specialization and test cyclicity with the actual slopes. |
| E70–E76, E79 | Bounded Sol/ultra on the quotient tangle, independent diagram, single-branch covers and framed two-stage operation | Identify both basic groups, all integer recognition slopes and the corresponding original smooth closure. Replay the full four-dimensional transfer independently. |
| E77–E78 | Bounded Sol/ultra on the orthogonal great circle, lifted section and cable filling | Check the determinant-one changed representative with a projective representation and classify the scope over these two cable families. |
| E80–E82 | Lead B14 and independent bounded Sol/ultra readings on the recognized two-knot and its actual monodromy | Test a fibre-preserving boundary twist and a marked meridian presentation for a geometric odd-framing cancellation. |
| E83 | Bounded Sol/ultra, exact nonumbilic SEAM collar from the smooth disk face | Apply the nested signed defect at the real incoming jet and locate the permitted core budget. |

The conceptual choices are [B11](../brainstorm/notes/B11_SINGULAR_KNOT_DETERMINANT.md), [B12](../brainstorm/notes/B12_MARKED_GROUPS.md), [B13](../brainstorm/notes/B13_ORTHOGONAL_CABLING.md) and [B14](../brainstorm/notes/B14_FRAMED_MONODROMY.md). Every bounded request and return is located by the [second receipt](../research-progress/handoffs/RETURNS_SECOND_20261127.md). The working start point is the [resume note](../continuation-notes/RESUME_20261127.md).
