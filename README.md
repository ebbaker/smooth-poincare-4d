# Smooth Poincaré in four dimensions

This research program studies the smooth four-dimensional Poincaré conjecture: whether every smooth, closed homotopy four-sphere is diffeomorphic to the standard four-sphere. Its geometric approach explores chiral connections, curvature reconstruction, and metric evolution.

The initial investigation was motivated by **Edward B. Baker III's unfinished draft papers** on generalized conformal maps, generalized isothermal coordinates, and twistor reconstruction. The three original drafts are retained in [references/unfinished_notes](references/unfinished_notes/README.md) and recorded in the [reference catalog](references/README.md) and [bibliography](references/references.bib).

The main working manuscript develops a local and perturbative framework near the round four-sphere. Initial geometric structures on an arbitrary homotopy sphere, preservation of definiteness, global regularity, compactness, and convergence remain research questions. The earlier holomorphic and neutral-signature studies did not directly investigate the smooth Poincaré conjecture. They are preserved separately in `papers/initial-investigations/`; applying them to the Riemannian global problem would require additional arguments. Existing manuscripts retain their original claims and qualifications; repository setup supplies no new mathematical verification.

## Investigations

| Collection | Investigation | Role |
| --- | --- | --- |
| `investigations-1` | [01 — Chiral metric evolution](papers/investigations-1/01_chiral_metric_evolution/README.md) | Direct smooth Poincaré study |
| `initial-investigations` | [01 — Generalized isothermal coordinates](papers/initial-investigations/01_generalized_isothermal_coordinates/README.md) | Earlier coordinate and reconstruction study |
| `initial-investigations` | [02 — Chiral descent and double copy](papers/initial-investigations/02_chiral_descent_and_double_copy/README.md) | Earlier descent and double-copy study |

Each investigation has an overview, plan, one live progress register, derivation notes, reviews, bounded computations, brainstorm notes, references, chat histories, and a continuation prompt. Plans are prepared but research is not activated by this setup.

## Start here

- Read [AGENTS.md](AGENTS.md), the relevant investigation README, and its sole progress register.
- Use [the setup workflow](INVESTIGATION_SETUP_WORKFLOW.md) and [B/E research workflow](GPT_RESEARCH_MODEL_WORKFLOW.md) for sustained research and bounded handoffs.
- Follow [the reference workflow](REFERENCE_WORKFLOW.md) and [public chat-history workflow](tools/CHAT_HISTORY.md).
- See [CONTINUATION.md](CONTINUATION.md) for the next-session choices and [MANIFEST.md](MANIFEST.md) for the file map.
- See [the repository audit](reviews/REPOSITORY_AUDIT_20261121.md) for verified local write access, complete source coverage, workflow comparison and transfer repairs. [SETUP_STATUS.md](SETUP_STATUS.md) and [the organization correction](ORGANIZATION_UPDATE.md) retain the earlier preparation receipts.

The [historical project overview](papers/research-overview/PROJECT_SUMMARY_2026-11-20.md) explains the earlier twistor program; it predates the current sphere manuscript. [Import provenance](IMPORT_MANIFEST.json) records every relocated source and its hash. Original source files were left intact. No investigations, results, result-summary collection, or avoidance collection from the workflow-template project were imported.

## Local tools

```sh
python3 tools/check_repository_hygiene.py
python3 -m unittest discover -s tools/tests
python3 tools/build_manuscripts.py --list
python3 tools/build_manuscripts.py
```

Manuscript sources are in each branch's `manuscript/`; generated PDFs are in `output/pdf/<branch>/`. Published reading PDFs are retained locally and excluded from Git. The author's three unfinished draft PDFs are retained in Git. See [LARGE_FILES.md](LARGE_FILES.md), [tools/README.md](tools/README.md), and [CONTRIBUTING.md](CONTRIBUTING.md).

Research and text follow CC BY 4.0; code follows MIT under the existing [license](LICENSE.txt). Third-party works retain their own rights. [CITATION.cff](CITATION.cff) supplies repository metadata without claiming a publication or release.
