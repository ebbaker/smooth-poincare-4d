# SP4-CME-E16A return v1

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The fixed E helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and the
selected lead's actual settings were unavailable. See the
[frozen request](SP4-CME-E16A_REQUEST_v1.md) and
[exact proof](../../notes/18A_ROUND_STRAIN_REACTION_20261122.md).

## Disposition

The expected spectrum is confirmed in the manuscript's round
sign and time. On the real 20-dimensional tensor space use
\(J_i\) with \((J_i)_{ca}=\eta_{i,ac}=-\eta_{i,ca}\) and
\(R_i=[\operatorname{ad}(e_i),\,\cdot\,]\).
The normalized mixed curvature action is
\(\mathcal A=\sum_iJ_i\otimes R_i\). Both factors are
skew-adjoint, so \(\mathcal A\) is self-adjoint. The
quaternionic identity with the calibrated sign, together with
\(\sum_iR_i^2=-6I\) and \([R_i,R_j]=\epsilon_{ijk}R_k\),
gives \(\mathcal A^2=6I+\mathcal A\). Its zero trace
then gives \(-2\) of multiplicity 12 and \(+3\) of
multiplicity 8.

Thus \(Z=-36KI+8K\mathcal A\) has eigenvalues \(-52K\) (12)
and \(-12K\) (8). For the round linear strain,
\[
 (\partial_t-4\Delta)|T|^2
   =-8|\nabla^{A_0}T|^2+2\langle T,ZT\rangle
   \le -8|\nabla^{A_0}T|^2-24K|T|^2 .
\]
The bound holds on the whole pointwise tensor space and hence
on actual strains subject to the curl constraint. E16B was sent
the exact spectrum and the proof's hash. This is a finite
round linear check. The nonlinear estimate requires the
separate E16B bookkeeping.

## Input and output identities

All four frozen inputs matched when read. The proof uses exact
matrix identities and traces.

| File | SHA-256 |
| --- | --- |
| SP4-CME-E16A_REQUEST_v1.md | `37dc14649bd848d569daef1e8514fc32f0abf76e4bc76f172967a42d7daada8a` |
| B15_STRAIN_ENERGY_TEST_20261122.md | `42927a06c824fdf3d0749033bd897a73e778b2427057bf1e2031762e3f50eda0` |
| 17_STRAIN_EVOLUTION_STRUCTURE_20261122.md | `d8caa4e811178ba1357552526f311e5d283ec5e04ffd18851c7e378bfcfd5ec3` |
| 16_TEMPORAL_STRAIN_CRITERION_20261122.md | `204022875cd34b4672850e9e9540c9a099caa21f8f35c4c82915b359d4412193` |
| 11_TRANSPORT_CURVATURE_COMPARISON_20261122.md | `c5e66058a3c73e13d6582a5f84c3e297080c67ae2ee6458c0a8bf5ac30e266ae` |
| 18A_ROUND_STRAIN_REACTION_20261122.md | `eb12c9f24b25d0ae8ed99eaa65485218ad8caed3c6497a9fb44e8dfa94c0dd4d` |
