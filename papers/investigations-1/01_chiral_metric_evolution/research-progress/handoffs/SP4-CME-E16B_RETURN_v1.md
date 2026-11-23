# SP4-CME-E16B return v1 — conditional strain energy estimate

22 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol` /
`ultra`. Actual backend model and effort were not independently exposed.
Selected lead settings unavailable. Return to [request v1](SP4-CME-E16B_REQUEST_v1.md).
Exact term accounting and conditional implications are in the
[derivation note](../../notes/18B_STRAIN_ENERGY_ESTIMATE_20261122.md).

## Disposition

Completed the frozen estimate. Every remainder after extracting the
self-adjoint diffusion and round reaction has bound
\(c(K|q||T|+|T||\nabla T|+|T|^3)\) for \(|q|\le1/8\).
E09's Ricci correction multiplies \(X=O(T)\). All differentiated
coefficients and \(\Xi\) use at most one spatial derivative of \(T\).
The algebraic reaction has no source at \(T=0\).
E16A supplies \(\langle T,Z^\circ T\rangle\le-12K|T|^2\).

The inverse-metric derivative supplies the exact negative contraction
\(-\langle H_g,\mathcal A_T\rangle\), bounded in absolute value by E14
times \(|T|^2\). The volume derivative is zero. Integrating the diffusion
starts with \(-7D_T\) and the round reaction with \(-24K E_T\).
Shrinking to a universal \(\epsilon_0>0\) absorbs the \(K|q||T|^2\)
error. One Young inequality on \(|T|^2|\nabla T|\) then gives
\[
 E_T'\le -D_T-K E_T+C\int |T|^4\,dV_g.
\]
Under the assumed uniform scalar Sobolev inequality with constant \(C_S\)
and interval bound \(\|T\|_4^2\le(2CC_S)^{-1}\), the squared \(L^2\)
strain decays at rate \(K/2\). Pinching, the Sobolev inequality and
critical-norm persistence remain interval premises. The estimate does
not give the E14 supremum-in-space time integral, continuation or
convergence.

## Frozen and received versions

| Branch input | Checked SHA-256 |
| --- | --- |
| `brainstorm/notes/B15_STRAIN_ENERGY_TEST_20261122.md` | `42927a06c824fdf3d0749033bd897a73e778b2427057bf1e2031762e3f50eda0` |
| `notes/17_STRAIN_EVOLUTION_STRUCTURE_20261122.md` | `d8caa4e811178ba1357552526f311e5d283ec5e04ffd18851c7e378bfcfd5ec3` |
| `notes/16_TEMPORAL_STRAIN_CRITERION_20261122.md` | `204022875cd34b4672850e9e9540c9a099caa21f8f35c4c82915b359d4412193` |
| `notes/11_TRANSPORT_CURVATURE_COMPARISON_20261122.md` | `c5e66058a3c73e13d6582a5f84c3e297080c67ae2ee6458c0a8bf5ac30e266ae` |
| `research-progress/handoffs/SP4-CME-E16B_REQUEST_v1.md` | `e7a1d60ef030a6917e2300ca25fa6c9ca42d5bbdcf24cea5986044c0274a53e7` |
| `notes/18A_ROUND_STRAIN_REACTION_20261122.md`, subsequently received E16A dependency | `eb12c9f24b25d0ae8ed99eaa65485218ad8caed3c6497a9fb44e8dfa94c0dd4d` |

This calculation uses the exact E15 equation, E09 derivative and Ricci
estimates, E14 moving metric, and the received E16A gap. It is analytic,
with no numerical artifact.

## 22 November 2026 — typesetting clarification

The opening frozen-request link line break and the Kato norm delimiters were
clarified after E19 verified and used the original derivation. The frozen
E19 input note had SHA-256 `8e64d9636552a2608bdb4f972ca2a9745f5698d709a7e651a01c43e394a83a87`.
The corrected note SHA-256 is `3f1854a9facef8e1f773ffa482807f9064188b56ac9b98ab5429692dc7ceee42`.
The packet return before this correction record had SHA-256 `c1cb608bae4dc290097f84c954e9d98cde07f105bc7bbbb9100478247c655711`.
