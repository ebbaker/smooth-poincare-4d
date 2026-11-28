# Chiral transfer and pole forms on smooth homotopy four-spheres

Initial research manuscript prepared for Edward B. Baker III, 27 November 2026. [LaTeX source](chiral_transfer_and_pole_forms.tex) · [Compiled PDF](../../../../output/pdf/01_chiral_transfer_and_pole_forms/chiral_transfer_and_pole_forms.pdf).

The paper develops the compact chiral transfer, the weighted proof of A1, the distributional kernel and the relative symplectic proof of A2. It derives the common-direction criterion on a finite handle cover, the real twistor-fibre criterion and the fixed-end results for near-symplectic forms. The final sections give supporting examples and state the universal existence, last-circle, energy and coordinate problems.

| Part of the paper | Derivation and evidence |
| --- | --- |
| Chiral transfer, A1 and kernel | [Weighted proof](../notes/E01_A1.md) · [Kernel and density](../brainstorm/notes/B01_KERNEL.md) · [A1 replay](../reviews/E01_REPLAY.md) · [Kernel replay](../reviews/B01_REPLAY.md) |
| Recognition and the marked end | [Relative cap argument](../brainstorm/notes/B01_RECOGNITION_SOURCE.md) · [Original-source reading](../references/A2_ORIGINAL.md) · [A2 replay](../reviews/E02_REPLAY.md) |
| Atlas and twistor interpretation | [Original draft comparison](../notes/E05_DRAFTS.md) · [Fibre calculation](../reviews/E05_READING.md) · [Strict chart proposition](../../../initial-investigations/01_generalized_isothermal_coordinates/notes/RESEARCH_OBSTRUCTIONS_2026-11-20.md) |
| Smooth variation and zeros | [Moving pole](../brainstorm/notes/B02_OPENNESS.md) · [Fixed chart](../notes/E04_REALIZATION.md) · [First-zero replay](../reviews/E06_REPLAY.md) |
| Supporting evidence | [Exact radial family](../notes/E03_ALGEBRA.md) · [Companion continuum bound and certificate](../../../master-2/notes/UNIFORM_POLE_BOUND_PROFILE_A_20261127.md) |
| Outstanding challenges | [Bridge quantifiers](../../../master-2/research-progress/handoffs/TO_MASTER_GATE1_20261127.md) · [Cap and chamber proof](../../03_lines_and_broken_fibrations/notes/CAP_DEGREE_AND_CHAMBERS.md) · [Primitive period](../../03_lines_and_broken_fibrations/notes/CORE_PERIOD.md) |

From the repository root, build the reading copy with

```sh
python3 papers/investigations-2/01_chiral_transfer_and_pole_forms/manuscript/build.py
```

The build requires Python 3 and a TeX distribution with `latexmk` and BibTeX. It uses the [shared bibliography](../../../../references/references.bib) and takes any still-missing cited records from the [checked bibliography patch](../../05_certificates/references/SHARED_BIBLIOGRAPHY_20261127.patch) for this build. Accepted canonical records take precedence. [Primary source inspections](../references/README.md) · [Independent manuscript reading](../reviews/MANUSCRIPT_READING_20261127.md)
