# Checks for the note on the first-order and marked-cut tools

26 November 2026 (America/New_York). Prepared for Edward B. Baker III by Claude (Anthropic), model `claude-fable-5-2`, in the Cowork session that wrote [the note](../USES_OF_THE_FIRST_ORDER_AND_MARKED_CUT_TOOLS_20261126.md). The scripts were written and run in the session's cloud workspace with Python 3.13, NumPy 2.5.3, SciPy 1.18.1 and SymPy 1.14.0. They need SciPy and SymPy, which the local virtual machine of this repository's sessions did not have, so they were not run on the repository's own machine.

| Script | What it establishes | Kind | Result |
| --- | --- | --- | --- |
| [`check_01_kk_cap_energy.py`](check_01_kk_cap_energy.py) | Scalar curvature and the fibre-integrated Weyl density of the circle-symmetric cap metric of section 5.2, for general profile functions; Gauss–Bonnet and a direct quadrature on two closed bundles where the connection term varies | symbolic, then numerical to $10^{-8}$ | 7 ok |
| [`check_02_cap_costs.py`](check_02_cap_costs.py) | The table of section 5.2: least cost of a cap closing one tube, by direct minimization over piecewise profiles; the scalar curvature of each minimizing cap is positive | floating point; each value is the cost of an admissible cap and so an upper bound for the least cost | 11 ok, 4 reported without a verdict |
| [`check_03_seams_eta_arithmetic.py`](check_03_seams_eta_arithmetic.py) | The seam table of section 4.2 and the Euler-characteristic balance; the eta invariants of round quotients in section 3.2, including the value $3/4$ for $Q_8$ used in investigation 03; the pointwise inequalities of section 4.1; the arithmetic of the height-direction count of investigation 04 | exact rational arithmetic and random sampling | 21 ok |

[`output.txt`](output.txt) is the output of the three scripts as run for the note. [`run_all.sh`](run_all.sh) reruns them; the second script takes about ten minutes.

## What the checks do not establish

- The scripts do not prove the ledger of section 3.1; that is the Atiyah–Patodi–Singer theorem with a transgression term computed by hand, and the constant in the transgression term is not tested here.
- `check_02` is not interval arithmetic. The rows within a few hundredths of the wall (the second framing of the three-twist exterior and the four-twist exterior) are reported as information only, and the five-twist row is above the wall at the lengths tried, which does not show that no cheaper cap exists outside the ansatz or at other lengths.
- The minimization is over circle-symmetric caps only. The exterior is the product conformally flat structure, so the total energy of the class equals the cost of the cap; the seam matches the metric to first order and the connection to zeroth order with vanishing curvature, which makes the glued metric $C^{1,1}$.
- `check_03` assumes the homology computation and the doubling inequality stated in the note; it verifies the arithmetic that follows from them.
- No script touches the theorems of investigations 03, 04 and 05 that the note uses.
