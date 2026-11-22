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
