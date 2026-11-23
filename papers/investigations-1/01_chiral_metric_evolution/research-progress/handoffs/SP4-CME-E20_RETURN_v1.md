# SP4-CME-E20 return v1

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The fixed E helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and the
lead's actual settings were unavailable. See the
[frozen request](SP4-CME-E20_REQUEST_v1.md),
[exact-arithmetic script](../../numerics/broad_run_exact_checks.py),
and [execution transcript](../../numerics/BROAD_RUN_EXACT_CHECKS_20261122.txt).

## Disposition

The requested command ran at 12:51:56 EST with Python 3.10.0
and exited successfully. All four fixed checks passed.

| Check | Exact result |
| --- | --- |
| E08 scalar jet | At \(\varepsilon=1/16\), the pairings are \(-1/256\) and \(385/24576\) in both their directly calculated and evaluated symbolic forms. |
| E09 relative Sylvester | The two prescribed expressions agree for the recorded noncommuting symmetric first derivatives and symmetric mixed derivative at \(S=\operatorname{diag}(1/3,5/3,1/3)\). |
| E15 strain maps | \(GM=I\) and \(G\mathscr L M=\mathscr L\) hold on all five trace-free symmetric basis elements at both the diagonal \(Q\) and its conjugate by the rational \(3\)-\(4\)-\(5\) rotation. \(S\) and \(S^{-1}\) are conjugated as well. |
| E16A round operator | The full 20-dimensional matrix is self-adjoint for the recorded Gram matrix, \(A^2=A+6I\), and \(\operatorname{tr}A=0\). The exact spectrum of \(Z/K\) is \(-52\) with multiplicity 12 and \(-12\) with multiplicity 8. |

E08 and E09 are individual samples. E15 checks complete basis
actions at two fixed matrices. E16A checks the entire fixed round
matrix. The general identities and nonlinear PDE statements retain
their analytical evidence requirements.

## Input and output identities

All four frozen note hashes matched. The transcript records the
command, runtime, case data and actual stdout.

| File | SHA-256 |
| --- | --- |
| SP4-CME-E20_REQUEST_v1.md | `6239e4d715e78739bcbef487e1fb4659368f393020b7e4fc5758efac390a4edd` |
| 10_SCALAR_PINCHING_JET_20261122.md | `2689bc30072a5ff95823aba189bc1c1c002074cac90da46dfa2485261f411f06` |
| 11_TRANSPORT_CURVATURE_COMPARISON_20261122.md | `c5e66058a3c73e13d6582a5f84c3e297080c67ae2ee6458c0a8bf5ac30e266ae` |
| 17_STRAIN_EVOLUTION_STRUCTURE_20261122.md | `d8caa4e811178ba1357552526f311e5d283ec5e04ffd18851c7e378bfcfd5ec3` |
| 18A_ROUND_STRAIN_REACTION_20261122.md | `eb12c9f24b25d0ae8ed99eaa65485218ad8caed3c6497a9fb44e8dfa94c0dd4d` |
| broad_run_exact_checks.py | `c85d4de5aafd2d10287d3d0790d762355e18d6d86d174a2e257d39af3d0f4eb1` |
| BROAD_RUN_EXACT_CHECKS_20261122.txt | `c174be10b9050434b06f09c3e316808e3ee7435906bda433af28017918d219fb` |
