# Checks for the entry note of 26 November 2026

These scripts support [ENTRY_DIRECT_APPROACHES_20261126.md](../ENTRY_DIRECT_APPROACHES_20261126.md). They were written for Edward B. Baker III by Claude (Anthropic, model `claude-fable-5-2`) from the definitions only. No repository script was read or reused. Move them to a `numerics/` folder if preferred.

| Script | Content | Checks |
| --- | --- | ---: |
| `check_01_gamma2_and_seams.py` | pointwise form of entry and the Newton tensor; the Gauss equation `R_Sigma = -2G(nu,nu) + 2 sigma_2(kappa)` on two families of metrics; the fold inequality with constant `sqrt6/9`; the folded count `2 pi^2` and the index rule on a folded map `S^2 x S^2 -> R^4` | 16 |
| `check_02_hypersurface_classes.py` | Weyl quartic of a hypersurface of `R^5`; which tube cores cost energy; `Gamma_2` principal curvatures are 3-convex; exact energy of the `S^2` tube and Gursky's minimum; pancake rim; the zero-cost hyperbolic core in the notation of E15 | 13 |
| `check_03_gluck_flux.py` | curvature of the rotation-flux metric on `D^2 x S^2`, computed symbolically; constant flux; energy `4 pi^2 c`; a cut-off profile reaching the Gluck twist | 9 |

Run with `bash run_all.sh` (about 20 seconds; needs numpy, scipy, sympy). [output.txt](output.txt) is the log of the run made for the note: 38 `[ok]` lines, 0 `[FAIL]` lines.

These are floating-point and computer-algebra tests of formulas and constants on explicit examples and random data. They are not proofs, and they do not test the topological statements of the note.
