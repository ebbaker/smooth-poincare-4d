# Checks for the program assessment of 27 November 2026

These scripts support [PROGRAM_ASSESSMENT_AND_PATH_FORWARD_20261127.md](../PROGRAM_ASSESSMENT_AND_PATH_FORWARD_20261127.md). They were written for Edward B. Baker III by Claude (Anthropic, model `claude-fable-5-2`, Cowork session) from the definitions only. No repository script was read or reused. Move them to a `numerics/` folder if preferred.

| Script | Content | Checks |
| --- | --- | ---: |
| `check_01_beta_dictionary.py` | Gauss–Bonnet and signature on the round $S^4$, the Fubini–Study $\mathbb{CP}^2$ and the product $S^2\times S^2$; the values $\beta=0,4,8$; the dictionary $\beta=4e/(8\pi^2-e)$ on a homotopy sphere and its thresholds; Gursky's threshold equals $E_+<4\int\sigma_2$; $\beta\ge8$ for indefinite forms; the arithmetic of the reduction to homotopy spheres through the universal cover | 25 |
| `check_02_half_pic_band.py` | $\nu_{\max}\le\sqrt{2/3}\,\lvert W\rvert$; the Yamabe-gauge identity $Y^2=96\int\sigma_2+12D$; the Cauchy–Schwarz bound of Lemma B; one gauge for both chiralities only up to $e\le T$; the four-section contrast identity and the arithmetic of the fixed-width bound; the identity $P-8T=D+\Delta/12$; PIC$_+$ as positivity of $R/3-2W^+$; the pointwise inequality $\lvert W^+\rvert^2\ge(8/3)\det A$ on a hypersurface of $\mathbb R^5$ and the bound $9E_+/(32\pi^2)$ on the mean number of index-two points | 26 |
| `check_03_bubble_budget.py` | the closed and ALE forms of Gauss–Bonnet as curvature budgets; flat space, Eguchi–Hanson and the two-ended neck $(1+r^{-2})^2g_{\rm Euc}$, with $\int\lvert\mathrm{Ric}\rvert^2=32\pi^2$ by exact integration; the general end inequality; its instances on a homotopy sphere, on $\mathbb{CP}^2$ and on $S^2\times S^2$ | 20 |
| `check_04_repository_counts.sh` | the repository counts, the Lean evidence lines, the workflow list and the citation counts quoted in the note; read-only, uses git | — |

Run the Python checks with `bash run_all.sh` (a few seconds; needs numpy, sympy and mpmath). [output.txt](output.txt) is the log of the run made for the note: 71 lines beginning `ok`, none beginning `FAIL`. It was made in the session's cloud workspace with Python 3.13.18, because the Linux environment bridged to the author's computer has no SymPy.

Run the fourth script from anywhere inside the repository with `sh check_04_repository_counts.sh`. [repository_counts.txt](repository_counts.txt) is its output at `b607bd1`, made on the author's computer through the session bridge. It counts tracked files only, so the files of this note do not enter the counts.

Scope. The Python scripts are computer-algebra and floating-point tests of identities, constants and sampled inequalities. They are not proofs, and they do not test the topological statements of the note, the imported theorems, or anything about the Lean libraries beyond the text searches of the fourth script. No Lean code was built.
