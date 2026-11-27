# Manuscript — cuts of subcritical conformal classes

[`cuts_of_subcritical_conformal_classes.tex`](cuts_of_subcritical_conformal_classes.tex) is the initial draft, requested by the author when the investigation was set up. Intended author: Edward B. Baker III. Drafted by Claude (Anthropic), model `claude-fable-5-2`, reasoning effort at the session's configured maximum, 26 November 2026 (America/New_York), at repository state `841d606`.

**Scope.** Analytical statements about cuts of entering classes: the chirality ledger, positivity of umbilic cuts, the seam atlas, the energy of circle-symmetric caps, the sweepout criterion, the minimal cut and free cuts, followed by the outstanding problems. Numerical work appears only in Remark 6.3, as supporting evidence.

**Evidence.** Proofs are written out and have not been read independently (task SP4-CUT-E02). The sign of the boundary term in the ledger is untested (SP4-CUT-E01). The cap functional was verified symbolically and against Gauss–Bonnet by [check_01](../../../master/brainstorm/notes/claude/USES_OF_THE_FIRST_ORDER_AND_MARKED_CUT_TOOLS_20261126_checks/check_01_kk_cap_energy.py); the cap costs come from [check_02](../../../master/brainstorm/notes/claude/USES_OF_THE_FIRST_ORDER_AND_MARKED_CUT_TOOLS_20261126_checks/check_02_cap_costs.py) and are floating point. Results quoted from the master manuscript and from the manuscripts of 03, 05 and 06 are working theorems of those manuscripts.

**Build.** `python3 tools/build_manuscripts.py 08_cut_geometry_and_chirality` from the repository root; the PDF goes to `output/pdf/08_cut_geometry_and_chirality/`. The draft built in the session's cloud workspace with latexmk and the shared bibliography: 14 pages, 26 references, no undefined reference, one overfull line of 1.6 points. It was not built on the author's machine.

No manuscript snapshots are kept; the draft history records milestones.
