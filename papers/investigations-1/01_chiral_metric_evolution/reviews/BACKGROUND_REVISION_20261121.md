# Background revision of the chiral metric evolution manuscript

21 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI assistance. Actual model and effort were not independently exposed.
Task: **[E] SP4-CME-DOC-E01**, a bounded editorial revision performed by the
selected lead, with no subagents. The current user request supplies the
scope; it does not activate the separate SP4-CME-E01 scientific audit.

## Requested change and outcome

Only the manuscript in `01_chiral_metric_evolution` was revised. Both
initial-investigation manuscripts were read as background and left unchanged.
The abstract and opening paragraph now state the smooth four-dimensional
Poincaré conjecture and identify progress toward it as the long-term goal.
The introduction explains the ASD metric existence target and distinguishes
the present round-sphere analysis from the global inputs still needed.

Before “Here is the central statement,” the text now specifies the real,
smooth, oriented, positive-definite four-dimensional setting, the real
rank-three SO(3) bundle, the curvature reconstruction, its scale and energy.
The statement defines the source variation h, induced connection variation a,
reconstructed variation h-hat, TT conditions, coframe gauge, tensor Laplacian,
and the meaning and normalization of the linearized time evolution.

Section 2 explains the development from surface isothermal coordinates to
twistor integrability, complex four-dimensional geometry, deformation of
complete twistor lines, direction-dependent maps and bundle reconstruction.
It separates a complex four-manifold, its complex five-dimensional
correspondence space, and a real six-dimensional Riemannian twistor space.
The discussion then explains the neutral wave example, the Einstein versus
conformal-duality distinction, the role of nonzero scalar curvature, and
the additional conditions in ambitwistor gauge theory.

The bibliography grew from 5 to 14 entries. Baker is cited only through
arXiv:2301.00029, with “and references within.” No unpublished author paper
or earlier repository manuscript is cited in the revised scientific text.
Primary source details and inspected passages are recorded once in the
[shared source notes](../../../../references/SOURCE_NOTES_CME_BACKGROUND_20261121.md).

## Evidence scope

This revision improves exposition and source attribution. Sections 3–14,
including their statements, derivations, and open problems, are byte-for-byte
unchanged from the input; their numerical section/page positions may move.
No claim of an independent mathematical audit, new global result, or
solution of the conjecture is made. The original scientific tasks retain
their prior status in the [sole register](../research-progress/REGISTER.md).

## Validation

- The repository manuscript builder succeeded for the selected branch.
- A final `latexmk -pdf` build produced a 37-page PDF with no LaTeX warnings,
  unresolved references, or overfull/underfull boxes. The delivered PDF is
  byte-identical to that final build.
- PDF pages 1–9 and 36–37 were rendered and visually inspected, covering the
  abstract, contents, revised introduction and background, transition to
  Section 3, and bibliography. No clipping or layout defect was observed.
- Citation/label checks found 14 cited bibliography entries, no missing or
  uncited entries, no unresolved label references, and no duplicate labels.
- The only Baker bibliography key is `Baker2023`.
- Both initial-investigation manuscript hashes match their input hashes;
  the existing analytical body from Section 3 through Section 14 is unchanged.
- Existing unrelated working-tree changes in the repository-level access
  audit and setup-version comparison were preserved.
- `git diff --check` and `python3 tools/check_repository_hygiene.py` passed.

The revised source SHA-256 is
`85c78859ec3cc7a96da74245cea395db8d069b768c5d693ea4a40ae08039f60c`.
The generated PDF is
`output/pdf/01_chiral_metric_evolution/chiral_curvature_and_metric_evolution.pdf`
(515,969 bytes), SHA-256
`c5be49ae4150165860a344a4d7d7568d090b685221e48ecec04f10eab8774545`.

Authentic live chat capture was unavailable: exact thread identity was
available from session metadata, but the recorder found no matching local
source. No registration or final-response capture was fabricated. A separate
[unregistered partial public record](../chat-histories/UNREGISTERED_PARTIAL_BACKGROUND_REVISION_20261121.md)
preserves selected completed requests and updates.

## Input versions

The following hashes were recorded before edits. They identify the three
manuscript inputs and the inherited shared bibliography.

| Input | SHA-256 |
| --- | --- |
| `papers/investigations-1/01_chiral_metric_evolution/manuscript/chiral_curvature_and_metric_evolution.tex` | `330b9faa2bb228684cec8c186eba1fe5f6f87d9e84a1cb19e094b2994f4a019a` |
| `papers/initial-investigations/02_chiral_descent_and_double_copy/manuscript/chiral_connection_descent_and_double_copy.tex` | `cda9e01bbc2eee5d088409b1db7d08ab0f5a0dca99daf6d8dd076c8100686651` |
| `papers/initial-investigations/01_generalized_isothermal_coordinates/manuscript/generalized_isothermal_wave_metrics.tex` | `493d81a7e8007aa0963e0ea9f5f1534e0073b7fc81da8268076c7a4d52902f7d` |
| `references/references.bib` | `e6e06d0c1f175e5fe96bb9538bd9cfe2c7cc3a9bd1dc4c5f47e90c18f5143cf6` |
