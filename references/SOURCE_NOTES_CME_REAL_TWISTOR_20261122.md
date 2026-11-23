# Sources for the real twistor coordinate proposal

22 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. Actual selected model identifier and effort are
unavailable. The selected lead checked the passages below for the
author-requested planning integration SP4-CME-SETUP-E01. This is a
selected-passage check, not a full proof or novelty review.

The author supplied a summary from another chat. It is treated as the
current author's proposed direction; no inspection of that chat's private
or unsupplied content is claimed. The consuming documents are the CME
[overview](../papers/investigations-1/01_chiral_metric_evolution/research-overview/OVERVIEW.md)
and [plan](../papers/investigations-1/01_chiral_metric_evolution/research-plan/PLAN.md).
Input hashes are recorded in the [integration record](../papers/investigations-1/01_chiral_metric_evolution/reviews/RESEARCH_PLAN_INTEGRATION_20261122.md).

| Source/version | Passage and inspection | Use and boundary |
| --- | --- | --- |
| Fine–Panov, *Symplectic Calabi–Yau manifolds, minimal surfaces and the hyperbolic geometry of the conifold*, [arXiv:0802.3648v2](https://arxiv.org/html/0802.3648v2), 5 March 2008; published JDG 82 (2009), 155–205 | Full-text HTML §2.1 Proposition 2.1; §2.2 and the sign convention in Definition 2.6; §2.3 Definition 2.9 and Remark 2.10. Version and journal metadata checked on the [arXiv record](https://arxiv.org/abs/0802.3648v2). | A definite SO(3) connection gives a symplectic form and a specified compatible almost complex structure on its sphere bundle. The curvature ray identifies the underlying smooth bundle with metric twistor space. Remark 2.10 explicitly distinguishes its almost complex structure from the metric twistor structures. Signs and fiber orientations must be translated to F = −KΣ before comparison. The sphere-bundle construction is published background, not a new result of this program. |
| Atiyah–Hitchin–Singer, [*Self-duality in four-dimensional Riemannian geometry*](https://doi.org/10.1098/rspa.1978.0143), 1978 | The existing [reading copy](Atiyah.pdf), journal pp. 435–436, PDF pages 12–13, rendered and visually read: Theorem 4.1 and the following description of vertical/horizontal splitting. The DOI endpoint was inaccessible to the web tool. | The natural twistor almost complex structure is integrable exactly when the relevant Weyl component vanishes. The source states W₋ = 0; after changing the chirality convention this is W⁺ = 0 for the selected bundle in CME. The theorem does not assume a global spin structure. Local spinor/degree-one formulas still require attention to their lifts and transition laws. |
| Earlier [chiral descent manuscript](../papers/initial-investigations/02_chiral_descent_and_double_copy/manuscript/chiral_connection_descent_and_double_copy.tex) | Section `sec:general`, Proposition `prop:general-chart`, equation `eq:general-jet-chart`, and its proof; starting near source line 575 | The first-jet chart assumes a holomorphic submersion to CP¹ and a complete local four-complex-parameter family of sections with normal bundle O(1) ⊕ O(1). These hypotheses establish local complex charts, not real almost-complex charts on arbitrary Riemannian twistor bundles. Working-draft claim; no new general proof audit. |
| Earlier [generalized isothermal manuscript](../papers/initial-investigations/01_generalized_isothermal_coordinates/manuscript/generalized_isothermal_wave_metrics.tex) | Section `sec:bundle`, Lemma `lem:descent` and proof, equations `eq:factor`, and Proposition `prop:two-reconstructions`; starting near source line 351 | Degree-one directional coefficients follow from global holomorphic O(1) sections after fiber triviality and a holomorphic partial connection on the specified flat alpha distribution are supplied. Flatness of the partial connection gives ASD. Two-patch splitting is explicit for the wave family. These assumptions cannot be inferred from the real sphere fibers alone. |
| Current [CME manuscript](../papers/investigations-1/01_chiral_metric_evolution/manuscript/chiral_curvature_and_metric_evolution.tex) | §4.2 `rec:adapted-frame`, §4.4 `rec:compatibility`, and §14 generalized isothermal representations away from integrability | Supplies the orthonormal self-dual identification, compatibility variable and existing open coordinate question. The author's distortion relation is verified separately in the [pointwise check](../papers/investigations-1/01_chiral_metric_evolution/notes/03_direction_distortion_check_20261122.md). No along-flow estimate is imported. |

The AHS reading copy is the same file previously recorded in the
[background source notes](SOURCE_NOTES_CME_BACKGROUND_20261121.md),
11,176,148 bytes, SHA-256
`a4d55168994f0581232305d17397b8a69b5cf5a28b20a8dc8677a04e18394ee6`.
Its earlier retrieval provenance remains unchanged; it was not downloaded
again. Fine–Panov was inspected remotely, with no local PDF added.

Fine's exact defect flow, its short-time result and its local stability
hypotheses retain the canonical records in
[the earlier source notes](SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md).
The proposed new work concerns quantitative real chart/transport comparison
and its coupling to that flow. It does not import the different volume
functional or hypersymplectic flow.

## Activated-run source reinspection — 22 November 2026

The selected lead, with actual model/effort unavailable, re-read Fine–Panov
v2 §2.1 Proposition 2.1, §2.2 Definition 2.6, §2.3 Definition 2.9 and
Remark 2.10 through the primary arXiv HTML. The horizontal almost complex
structure is selected by the curvature ray. The sphere identification can
reverse fiber orientation, so the sign must be calibrated against the
round model before comparing complex structures. The definition alone
supplies neither a holomorphic direction projection nor a controlled
first-jet chart.

The same local AHS PDF identified above was rendered with Poppler, PDF
pages 12–13 (journal pp. 435–436), and read visually. Theorem 4.1 and the
following geometric description use the Levi–Civita horizontal splitting;
projectivization does not require global spin. The subsequent remark makes
clear that the spin bundle and the degree-one line bundle themselves need
the spin obstruction to vanish. Thus projective twistor geometry and a
chosen degree-one coefficient bundle must not be conflated. On a contractible
base patch the necessary spin lift is available; overlap covariance remains
part of a new comparison protocol.

The lead also read the earlier chiral descent manuscript's
`prop:general-chart` and proof and the generalized isothermal manuscript's
`lem:descent` and proof. Their holomorphic fibration, complete line family,
and flat-partial-connection premises remain as stated above. This reinspection
supports the forthcoming B01/B02 decisions; it does not upgrade those drafts
to a general real reconstruction theorem.

## Along-flow real comparison consumers — E137/E139/E141

22 November 2026. The selected lead integrated the
[E137 derivation](../papers/investigations-1/01_chiral_metric_evolution/notes/137_REAL_COMPARISON_TIME_CONTROL_20261122.md),
[E139 audit](../papers/investigations-1/01_chiral_metric_evolution/reviews/E139_REAL_COMPARISON_TIME_AUDIT_20261122.md)
and [assessment](../papers/investigations-1/01_chiral_metric_evolution/reviews/E137_E139_REAL_COMPARISON_ASSESSMENT_20261122.md)
in manuscript subsection “Time control of the real direction-sphere comparison.”
[E141](../papers/investigations-1/01_chiral_metric_evolution/reviews/E141_REAL_COMPARISON_MANUSCRIPT_AUDIT_20261122.md)
checks that integration. These are new consumers of the exact Fine–Panov
and AHS passages recorded above; no primary source was re-inspected for
these packets, and no reading copy, source version or inspection level
has changed.

The inherited sphere-bundle construction and distinction between
connection and metric twistor structures support the comparison's
definitions. The time-integrated estimates are branch derivations for
smooth actual native Fine flows in one fixed round connection/curvature
value basin on the standard oriented four-sphere. They use the independently
assessed intrinsic temporal strain budget. They control complete-fiber
direction maps, inverse maps and transported vertical complex structures
through two vertical derivatives, horizontal mismatch with one specified
Levi–Civita base derivative, and the positive chiral curvature error.
All sphere fibers have unit round area \(4\pi\); the native internal metric
is the negative Killing form, \(g=2K\widehat g\), and \(\tau=2Kt\).
The time derivative of the direction map uses fixed original \(E\)-labels,
not an arbitrary moving self-dual frame. Exact stretch discrepancy uses
the operator norm; derivative estimates use full component norms.

The result neither imports an off-integrable holomorphic first-jet theorem
from the initial manuscripts nor asserts pointwise \(W^+=0\). AHS retains
its Riemannian integrability hypothesis and chirality translation. The
smooth two-chart vertical transition is of degree two; a global degree-one
line bundle or spin lift is not inferred. The earlier table's section
numbers describe its historical input manuscript; the named labels are
the stable locators for the current working manuscript.
