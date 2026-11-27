# Cuts from geometry — progress register

26 November 2026, America/New_York. Prepared for Edward B. Baker III by Claude (Anthropic), model `claude-fable-5-2`, reasoning effort at the session's configured maximum. Setup baseline `4655e38`. Sole live owner of the task family `SP4-CUT-GEO`. This opening table records the 26 November setup. The live entries below supersede those initial states. Tasks that came from the parent family keep their definitions; the [crosswalk](../../research-progress/CROSSWALK_20261126.md) records each change of identifier. [Plan](../research-plan/PLAN.md) · [Overview](../research-overview/OVERVIEW.md) · [Parent register](../../research-progress/REGISTER.md) · [Continuation](../continuation-notes/CONTINUATION.md)

| Task | Current state | Evidence or exact dependency |
| --- | --- | --- |
| SP4-CUT-GEO-B01 | Ready, unactivated | First conceptual decision of this child; GEO-E02 is its first input. Formerly SP4-CUT-B02. |
| SP4-CUT-GEO-E01 | Dependent | Needs GEO-B01 and an explicit immersion named by 04. Formerly SP4-CUT-E06. |
| SP4-CUT-GEO-E02 | Ready, unactivated | Inputs fixed: the class of Proposition 6.2(1) of the parent manuscript in its product gauge. |
| SP4-CUT-GEO-E03 | Ready, unactivated | Inputs fixed: Lemma 7.1 and Theorem 7.2 of the parent manuscript and the three exact cylinders. |
| SP4-CUT-GEO-B02 | Ready, unactivated | Independent of GEO-B01. |
| SP4-CUT-GEO-B03 | Reserved | Entered when GEO-B01 or GEO-B02 reports that the minimal cut fails. |

**Imported material, not a task.** The statements of the [parent manuscript](../../manuscript/cuts_of_subcritical_conformal_classes.tex) that this child starts from carry the status recorded in the parent register: proofs written out and not read independently (SP4-CUT-E02 is that reading).

**Returns.** Completed tasks return to the parent lead, and to the registers of other branches only by handoff.

**Outgoing handoffs at setup.** None then. The lead lists each one here with its date, the branch that receives it and whether it has been acknowledged.

**Questions for the author.** None yet. The lead records a question here and continues unless every remaining step depends on the answer.

## Activation • 27 November 2026

E02/E03 launched first. E01 proceeds on 04’s named rotational immersion and two-birth calibration via E05. B01–B03 are routed in the [decision](../brainstorm/notes/CUT_SELECTION_20261127.md). E04, E06, E07 are executing source, local sign and barrier tests. E08 tests the orbit and meridian flows. E09–E11 are assigned to independent readers after the corresponding evidence exists. [Frozen issues](handoffs/ISSUE_REPLAYS_20261127.md).

**Outgoing handoffs**, 27 November, acknowledgment pending: [04, supplied levels](handoffs/TO_04_HYPERPLANE_LEVELS_20261127.md), [SEAM, first-width constant](handoffs/TO_SEAM_MINIMAL_CUT_CONSTANT_20261127.md), [TUBE, thin exterior](handoffs/TO_TUBE_COLLAPSING_ORBITS_20261127.md).

E12 and E13 are active under [near-round compactness](handoffs/ISSUE_NEAR_ROUND_20261127.md) and [cut alignment](handoffs/ISSUE_ALIGNMENT_20261127.md). Incoming TUBE request read, [exact fiber germ and exterior returned](handoffs/TO_TUBE_ROUND_FIBER_GERM_20261127.md).

## Assessed dispositions • 27 November 2026

This table supersedes the activation entries above. **End state 2, complete without (S)**, in the component scopes defined in the original continuation. Independently checked here means a second Sol derivation or reading with named premises. Specialist review is outstanding.

| Component | Tasks | Definite result, limits and evidence |
| --- | --- | --- |
| G1 • examples | E02, E08, E15 | Established in the named families. The exact raw equality join has one closed embedded SO(3)-invariant minimal three-dimensional hypersurface (the seam); the specified compact join also has meridional three-spheres. The seam has distinct side Hessians. In smooth positive-Ricci untwisted joins a complete principal-orbit sweep must reach the two-sphere. A meridional height removes this event. For the actual two-twist trefoil the raw cap has a single radial minimal leaf, full index one, which disappears in the supplied compact gauge. Other twisted entries have the cap-local result only. [Exact model](handoffs/E02_MODEL.md) · [Section 6 table](../notes/ORBIT_SWEEPOUT_20261127.md) · [Trefoil](../notes/TREFOIL_RADIAL_CUT_20261127.md) · [model reading](../reviews/ORBIT_AND_HEIGHT_REPLAY.md) · [trefoil reading](../reviews/TREFOIL_FACE_REPLAY.md). |
| G2 • degenerate leaves | E03, E10 | Established locally for smooth Morse–Bott data, with normal access, two singular coefficients and the bounded-ratio test. At a critical surface lower boundedness on a whole compact patch is equivalent to minimality of the core. The three exact cylinders and examples deciding the finite sign are computed. [Derivation](handoffs/E03_LEAVES.md) · [replay](../reviews/LEAF_GERM_BAND_REPLAY.md). |
| G3 • minimal cut | B02, E04, E06, E11–E14 | Established near round, reduced in general. For every nonpositive-Schur index-one candidate one needs a strictly smaller-area closed minimal competitor, equivalently exclusion from least area including ties. Flat and negative Berger germs defeat a local proof, and every closed two-pole biaxial entering metric has positive-scalar regular orbits. The independently proposed angular competitor for triaxial completions was tested. [Impasse](../brainstorm/notes/FIRST_WIDTH_IMPASSE_20261127.md) · [source and comparison replay](../reviews/FIRST_WIDTH_REPLAY.md) · [closed test](../notes/GLOBAL_AREA_TEST_20261127.md) · [additional replay](../reviews/INTRINSIC_TEST_REPLAY.md). |
| G4 • sweepout | B01, E08–E09, E12–E14 | Refuted for exclusion by full principal-orbit mean curvature flow on explicit round entering S⁴ and its smooth untwisted family. Positive replacement proved in the near-round setting through each **actual** width surface. An intrinsic spectral test needs a supremum Hessian error and a belt gradient floor. The general first-width ordinary MCF problem remains open. [Aligned sweepout](../notes/ALIGNED_FIRST_WIDTH_20261127.md) · [replay](../reviews/NEAR_ROUND_REPLAY.md) · [intrinsic test](../notes/INTRINSIC_HEIGHT_TEST_20261127.md). |
| G5 • positive cuts | B03, E07, E10 | Decided for both the construction and its proposed inference. Stable prescribed-curvature local positive cuts always exist with freely chosen forcing. Independent marked-band width is not supplied by entry. The explicit round stable orbit cut retains a two-sphere collapse under ordinary MCF from its inner side. [Band proof](handoffs/E07_BANDS.md) · [review](../reviews/LEAF_GERM_BAND_REPLAY.md). |
| G6 • actual hyperplanes | E01, E05, E09 | Computed. On 04's closed rotational immersion a transverse regular section first loses strict positivity at either end when the absolute height reaches C. Below C there are negative points on all interior regular levels. Axial regular sections are round. The two-birth calibration has negative points on both sides of each index-two value and in a specified version on the three named regular levels. Its general cutoff-dependent first failure value is undetermined. [Proof](handoffs/E05_SECTIONS.md) · [replay](../reviews/ORBIT_AND_HEIGHT_REPLAY.md). |

**Handoffs at closure.** [04](handoffs/TO_04_HYPERPLANE_LEVELS_20261127.md) remains outstanding only for an optional first-failure location in 04's general calibration. [SEAM](handoffs/TO_SEAM_MINIMAL_CUT_CONSTANT_20261127.md) [replied](../../02_seams_and_marked_cuts/research-progress/handoffs/TO_GEO_MINIMAL_CUT_20261127.md) with a lower constant. [TUBE](handoffs/TO_TUBE_COLLAPSING_ORBITS_20261127.md) requested the [normalized return](handoffs/TO_TUBE_ROUND_FIBER_GERM_20261127.md) and independently [computed the same model](../../03_tubes_and_exteriors/notes/SWEEPOUT_RETURN.md). Its trefoil calculation received the [radial-cut handoff](handoffs/TO_TUBE_TREFOIL_RADIAL_CUT_20261127.md). Parent [manuscript corrections](handoffs/TO_PARENT_SECTION_7_CORRECTIONS_20261127.md) and [lane decision](handoffs/TO_PARENT_GEOMETRIC_CUTS_20261127.md) await parent integration. No author decision is pending. [Closing and continuation](../continuation-notes/CLOSING_20261127.md).

**Verification and chat.** Both rational scripts reproduced the reported bounds. All child Markdown targets resolved and repository hygiene passed. The [partial public record](../chat-histories/UNREGISTERED_PARTIAL_20261127.md) preserves the request and visible progress messages; the authoritative thread source was unavailable. No commit or external communication was made.

## Reopened G3 • actual Berger orbit, 27 November 2026

GEO-B04 tests the marked boundary flux before a global cap search. GEO-E16 and E17 compute it by independent routes. E18 fixes an actual smooth two-pole test and its angular area; E19–E20 independently read the resulting proofs. [Issued scope](handoffs/ISSUE_BERGER_COMPLETION_20261127.md).

### Closure of the reopened G3 test

**The actual E06 germ has no closed entering completion on any smooth homotopy four-sphere.** At the endpoint \(t^2=65/16\), the two signed differences are exactly \(-75\pi^2\) and \(+75\pi^2\), forcing \(E_+(M)=E_-(M)>75\pi^2\). Each cap of the full germ has \(4\int_V\sigma_2(A)<-67\pi^2\). This strengthens the G3 entry in the earlier table. The unrestricted first-width question and the other component dispositions stand. [Research result](../notes/BERGER_COMPLETION_OBSTRUCTION_20261127.md).

| Work | Assessed outcome |
| --- | --- |
| B04, E16–E17, E19 | Closed. Boundary signature and independent polar transgression agree including the round pole terms. A separate reader checked cap doubling, the two strict bounds and the continuous E06 parameter interval. [E16](handoffs/E16_BERGER_LEDGER.md) · [E17](handoffs/E17_POLAR_TRANSGRESSION.md) · [replay](../reviews/BERGER_FLUX_REPLAY.md). |
| E18, E20 | Closed. Smooth sine poles and the exact central germ give a standard \(S^4\), with negative scalar curvature at both transition midpoints. A transverse integral fundamental-class sweepout yields \(\mathbf W_1\le I<\pi^2\sqrt{65}/2\) on this metric. [Construction](handoffs/E18_SHORT_SUSPENSION.md) · [replay](../reviews/BERGER_COMPLETION_REPLAY.md). |
| E21 | Closed. Integer interval integration of all three cofactors and both polar ends gives \(1.901985\le I\le1.903738\). Lead reran the certificate and checked the angular concavity bounds, radial monotonicity, endpoint series and an independent floating quadrature. [Computation](handoffs/E21_ANGULAR_AREA.md) · [script](../numerics/berger_meridian_area.py). |
| E22 | Closed. At the same endpoint \(h\), index one with positive normal Ricci gives \(b^2<73/65\), while reducing the signed energy below threshold requires \(b^2>2145/8\). The conclusion covers arbitrary horizontal shear magnitude and general normal acceleration. [Issue](handoffs/ISSUE_BERGER_SHEAR_20261127.md) · [reading](../reviews/BERGER_SHEAR_REPLAY.md). |

**Handoffs.** [Parent and chirality ledger](handoffs/TO_PARENT_BERGER_COMPLETION_20261127.md), prepared for integration. The incoming [TUBE response on the join and trefoil](../../03_tubes_and_exteriors/research-progress/handoffs/TO_GEO_BOTH_GERMS_20261127.md) confirms the scopes of those gauge-specific examples. The Berger first and second fundamental forms come from GEO-E06. The [current continuation](../continuation-notes/AFTER_BERGER_OBSTRUCTION_20261127.md) starts with different data and a signed-energy test. No author decision pending. The [branch chat record](../chat-histories/UNREGISTERED_PARTIAL_20261127.md) remains partial because the exact transcript was unavailable.

The area certificate reproduced all three regional enclosures and the combined bound. A branch-wide link check resolved 331 local Markdown targets, and repository hygiene and the scoped diff check passed.
