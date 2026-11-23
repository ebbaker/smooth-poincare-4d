# SP4-CME-E20 request v1 — reproducible exact finite checks

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. User-authorized fixed Sol 6.2/ultra E verification; selected lead actual settings unavailable. No conceptual change. Own numerics/broad_run_exact_checks.py, numerics/BROAD_RUN_EXACT_CHECKS_20261122.txt and research-progress/handoffs/SP4-CME-E20_RETURN_v1.md only. No shared edits, snapshots or chat capture.

Implement and run bounded pure-Python Fraction checks of these already derived identities. Record command, date/time, configured settings, input hashes, exact cases, pass/fail and evidence limitations in the small transcript. Do not use floating eigenvalues or a numerical survey.

1. E08 epsilon=1/16: exact q,H pairings <q,H>=−1/256 and <q,L_QH>=385/24576, with the epsilon symbolic expression evaluated at that rational sample. No irrational d comparison is needed beyond d<1 as proved in the note.
2. E09 relative Sylvester identity. Use positive rational S=diag(1/3,5/3,1/3), Q=S² with trace3, two explicitly recorded noncommuting symmetric first derivatives S_X,S_Y and one symmetric mixed derivative R. Set P_X=S⁻¹S_X, P_Y=S⁻¹S_Y, derivative_Y P_X=S⁻¹R−P_Y P_X and derivative_Y U_X=sym(derivative_Y P_X). Verify S derivative(P_X)+derivative(P_X) S=2 derivative(U_X) S+S[P_X,P_Y]. This identity does not require trace-three derivatives; record that scope.
3. E15 maps G,M,L at that Q and an SO(3) rational rotation of it (for example a 3–4–5 rotation). Verify on five trace-free symmetric basis matrices that G M=Id and G L M=L exactly; rotate S as well.
4. E16A full real 20-dimensional action using the specified eta, J_i and internal commutators. Build its matrix in a declared rational basis with the corresponding Frobenius Gram matrix; verify Gram-self-adjointness, A²=A+6I and tr A=0. Derive the two multiplicities from dimension/trace rather than floating diagonalization.

Acceptance: code with transparent finite checks, successful actual execution and small transcript, correct frozen versions and no claim that sample checks prove the general identities or validate the nonlinear PDE. Stop at boundary.

## Frozen inputs

- `papers/investigations-1/01_chiral_metric_evolution/notes/10_SCALAR_PINCHING_JET_20261122.md` SHA-256 `2689bc30072a5ff95823aba189bc1c1c002074cac90da46dfa2485261f411f06`
- `papers/investigations-1/01_chiral_metric_evolution/notes/11_TRANSPORT_CURVATURE_COMPARISON_20261122.md` SHA-256 `c5e66058a3c73e13d6582a5f84c3e297080c67ae2ee6458c0a8bf5ac30e266ae`
- `papers/investigations-1/01_chiral_metric_evolution/notes/17_STRAIN_EVOLUTION_STRUCTURE_20261122.md` SHA-256 `d8caa4e811178ba1357552526f311e5d283ec5e04ffd18851c7e378bfcfd5ec3`
- `papers/investigations-1/01_chiral_metric_evolution/notes/18A_ROUND_STRAIN_REACTION_20261122.md` SHA-256 `eb12c9f24b25d0ae8ed99eaa65485218ad8caed3c6497a9fb44e8dfa94c0dd4d`
