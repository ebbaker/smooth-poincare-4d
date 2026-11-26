# Smooth Poincaré in four dimensions

This research program studies the smooth four-dimensional Poincaré conjecture: whether every smooth, closed homotopy four-sphere is diffeomorphic to the standard four-sphere. Its geometric approach explores chiral connections, curvature reconstruction, and metric evolution.

The initial investigation was motivated by **Edward B. Baker III's unfinished draft papers** on generalized conformal maps, generalized isothermal coordinates, and twistor reconstruction. The three original drafts are retained in [references/unfinished_notes](references/unfinished_notes/README.md) and recorded in the [reference catalog](references/README.md) and [bibliography](references/references.bib).

The [master manuscript and research program](papers/master/README.md) study fixed-smooth-type descent for chiral Weyl energy. The chiral metric evolution manuscript develops a local and perturbative framework near the round four-sphere. Initial geometric structures on an arbitrary homotopy sphere, preservation of definiteness, global regularity, compactness, and convergence remain research questions. The earlier holomorphic and neutral-signature studies did not directly investigate the smooth Poincaré conjecture. They are preserved separately in `papers/initial-investigations/`; applying them to the Riemannian global problem would require additional arguments. Existing manuscripts retain their original claims and qualifications; repository setup supplies no new mathematical verification.

## Investigations

| Collection | Investigation | Role |
| --- | --- | --- |
| `investigations-1` | [01 — Chiral metric evolution](papers/investigations-1/01_chiral_metric_evolution/README.md) | Direct smooth Poincaré study |
| `investigations-1` | [02 — Bach flow](papers/investigations-1/02_bach_flow/README.md) | Direct study through the evolution of chiral Weyl curvature |
| `investigations-1` | [03 — First-order twistor constructions](papers/investigations-1/03_first_order_twistor/README.md) | Shared foundations for separate sections/connections and Dirac/twistor-spinor sub-investigations |
| `investigations-1` | [04 — Hypersurface immersions](papers/investigations-1/04_hypersurface_immersions/README.md) | Immersed handle constructions, two-middle-handle recognition and a bounded folded-height test |
| `investigations-1` | [05 — Collar deformation and surgery](papers/investigations-1/05_collar_deformation_and_surgery/README.md) | Deform a marked spherical collar and use it to isolate handle interactions or compare metrics on the original smooth sphere. |
| `investigations-1` | [06 — Bour's flow and fixed-type attainment](papers/investigations-1/06_bour_flow_and_fixed_type_attainment/README.md) | Working proof of smooth Bach-flat attainment on each strictly entered type, with specialist checks outstanding. |
| `investigations-1` | [07 — Positive subcritical entry](papers/investigations-1/07_positive_subcritical_entry/README.md) | Construct the first positive subcritical class on a marked smooth type and return its coverage to the master. |
| Master | [Fixed-type variational descent](papers/master/01_fixed_type_variational_descent/README.md) | Intrinsic competitors, closed minimizers and round restarts |
| `initial-investigations` | [01 — Generalized isothermal coordinates](papers/initial-investigations/01_generalized_isothermal_coordinates/README.md) | Earlier coordinate and reconstruction study |
| `initial-investigations` | [02 — Chiral descent and double copy](papers/initial-investigations/02_chiral_descent_and_double_copy/README.md) | Earlier descent and double-copy study |

Each investigation has an overview, plan, one progress register per task family, and dedicated locations for notes, reviews, computations, references, chat histories, and continuation prompts. Nested sub-investigations own separate task families; their parent links their registers without duplicating live status. The investigation README links its current material and scope.

## Start here

- Read [AGENTS.md](AGENTS.md), the relevant investigation README, and its sole progress register.
- Use [the setup workflow](INVESTIGATION_SETUP_WORKFLOW.md) and [B/E research workflow](GPT_RESEARCH_MODEL_WORKFLOW.md) for sustained research and bounded handoffs.
- Follow [the reference workflow](REFERENCE_WORKFLOW.md) and [public chat-history workflow](tools/CHAT_HISTORY.md).
- Browse the [numbered conversation chronology](chat-histories/CHRONOLOGY.md) for the recovered project history.
- See [CONTINUATION.md](CONTINUATION.md) for the next-session choices and [MANIFEST.md](MANIFEST.md) for the file map.
- See [the repository audit](reviews/REPOSITORY_AUDIT_20261121.md) for verified local write access, complete source coverage, workflow comparison and transfer repairs. [SETUP_STATUS.md](SETUP_STATUS.md) and [the organization correction](ORGANIZATION_UPDATE.md) retain the earlier preparation receipts.

The [historical project overview](papers/research-overview/PROJECT_SUMMARY_2026-11-20.md) explains the earlier twistor program; it predates the current sphere manuscript. [Import provenance](IMPORT_MANIFEST.json) records every relocated source and its hash. Original source files were left intact. No investigations, results, result-summary collection, or avoidance collection from the workflow-template project were imported.

## Local tools

The [Lean formalization](formalization/README.md) has its own Lake package and toolchain in `formalization/`.

```sh
python3 tools/check_repository_hygiene.py
python3 -m unittest discover -s tools/tests
python3 tools/build_manuscripts.py --list
python3 tools/build_manuscripts.py
```

Manuscript sources are in each branch's `manuscript/`; generated PDFs are in `output/pdf/<branch>/`. Published reading PDFs are retained locally and excluded from Git. The author's three unfinished draft PDFs are retained in Git. See [LARGE_FILES.md](LARGE_FILES.md), [tools/README.md](tools/README.md), and [CONTRIBUTING.md](CONTRIBUTING.md).

Research and text follow CC BY 4.0; code follows MIT under the existing [license](LICENSE.txt). Third-party works retain their own rights. [CITATION.cff](CITATION.cff) supplies repository metadata without claiming a publication or release.
