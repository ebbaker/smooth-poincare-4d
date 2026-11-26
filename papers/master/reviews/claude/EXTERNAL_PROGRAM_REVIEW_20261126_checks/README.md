# Supporting checks for the program review of 26 November 2026

These scripts support [EXTERNAL_PROGRAM_REVIEW_20261126.md](../EXTERNAL_PROGRAM_REVIEW_20261126.md).
They were written for Edward B. Baker III by Claude (Anthropic, model `claude-fable-5-2`) during the review session,
from the definitions and statements in the manuscripts only. No verification script, Lean file or numerical record
of the repository was read or run. They are kept beside the review so that the review and its evidence travel
together; move them to a `numerics/` folder if preferred.

## What they do

Each script tests statements at load-bearing points of the master manuscript, of sub-investigation 05, or of the
review's own findings. Curvature is computed from first principles: `check_01` builds the curvature of a Euclidean
hypersurface from the Gauss equation, and `su2_curvature.py` derives the full curvature operator of a metric
`dt^2 + a_1(t)^2 (th^1)^2 + a_2(t)^2 (th^2)^2 + a_3(t)^2 (th^3)^2` on `I x SU(2)` from the Koszul formula with
`sympy`, in the convention in which the unit round sphere has identity curvature operator. The Hodge star, the two
chiral blocks and all norms are then formed numerically. This is the normalisation of Section 2 of the master
manuscript: Hilbert–Schmidt norms of the Weyl blocks on `Lambda^+` and `Lambda^-`, `T = 4 pi^2`.

| Script | Content | Checks |
| --- | --- | ---: |
| `su2_curvature.py` | shared library (no checks of its own; validated in `check_02` on round `S^4` and Fubini–Study `CP^2`) | |
| `check_01_hypersurface_weyl.py` | master Theorem 3.1 (`thm:immersed-entry`): Weyl blocks of a hypersurface in `R^5`; the sharp inequality `|W^pm|^2 >= (8/3) det A` on the signature-(2,2) locus and its minimiser; the inequality with constant `8/9` and its optimality; the two determinant bounds behind the shape threshold `16 sqrt2 pi/3`; the thresholds `64 pi^2/9` and `9/4` | 14 |
| `check_02_normalizations.py` | master Section 2 and Lemma 2.2: round `S^4`; Fubini–Study (signature formula, `12 pi^2`); a smooth non-conformally-flat metric on `S^4` on which `E_+ = E_-`, Chern–Gauss–Bonnet, the curvature budget and `4 int sigma_2 = 16 pi^2 - (E_+ + E_-)` are evaluated by quadrature; symbolic identities including `P - 8T = D + (36 l^2 - Y^2)/12` | 13 |
| `check_03_exact_face_cost.py` | sub-investigation 05, exact-face cost `Delta(s) = w s^2 c + O(w^2)` with `c = (|A0|^2/16) int r^4 chi''^2`, on an explicit collar, for four widths and both chiralities; the two chiral increments of a half-strip agree exactly | 8 |
| `check_04_algebra_and_thresholds.py` | eigenvalue bounds `3/2 <= |W|^2/lmax^2 <= 6`; the isotropic pair-sum inequality under Hamilton's block ODE; eta invariants of `S^3/Q_8`, of the quotients by its cyclic subgroups of order four, and of `RP^3`; round boundary form `6(l+1)`; the band-width rescaling `rho d^2 < 3 pi^2`; balanced-disk arithmetic; Gursky's Einstein bound `e >= (4/3) T` | 10 |
| `check_05_flow_and_fillings.py` | product cylinder `|W^pm|^2 = |Ric_0(h)|^2/4`; the clamped connector profile with minimum 4; algebra of the convex filling theorem of 05; Bour's functional `F^alpha` in the manuscript's normalisation, the hypothesis of his Theorem 1.11 on a Yamabe metric, and the restart count of review finding F2; `int |Ric_0|^2 = 32 pi^2` on a two-ended scalar-flat conformally flat neck; the product-handle cost `64 pi^2/3 > 16 pi^2` of review finding F1 | 23 |

## Running

```
pip install numpy scipy sympy
bash run_all.sh        # about 35 seconds; writes output.txt
```

`run_all.sh` calls `python3 -B`, so no `__pycache__` directory is written into the repository.

[output.txt](output.txt) is the log of the run made for the review (2026-11-26T17:36:26Z; Python 3.13.18,
numpy 2.5.3, scipy 1.18.1, sympy 1.14.0): 68 `[ok]` lines, 0 `[FAIL]` lines.

## Limits

These are floating-point and computer-algebra checks of identities, sharp constants and one asymptotic formula,
at sample points, on explicit cohomogeneity-one metrics and on random algebraic data. They show that the tested
formulas, constants and normalisations are right where tested. They are not proofs, and they do not touch the
analytic arguments (compactness, smoothing, concentration) or the topological arguments of the manuscripts.
The inequalities in `check_01` and `check_04` are sampled, not certified; each has a short hand proof, given in
the manuscripts. Three first attempts at `check_03` failed because of defects in the test itself (a quadrature
across the breakpoints of the cutoff, a tolerance that ignored a genuine `O(w)` term, and an expected convergence
rate that was too pessimistic); the script contains the corrected tests, and the formula under test was right
throughout. `check_05` (d)–(f) test arithmetic used in the review's own proposals, not statements of the manuscripts.
