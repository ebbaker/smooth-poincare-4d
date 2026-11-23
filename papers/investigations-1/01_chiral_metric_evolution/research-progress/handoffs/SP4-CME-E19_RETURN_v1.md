# SP4-CME-E19 return v1 — conditional critical strain bootstrap

22 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol` /
`ultra`. Actual backend model and effort were not independently exposed.
Selected lead settings unavailable. Return to [request v1](SP4-CME-E19_REQUEST_v1.md).
The full calculation is in the
[derivation note](../../notes/20_CRITICAL_STRAIN_ENERGY_20261122.md).

## Disposition

Verified the quartic strain inequality with universal \(\epsilon_1>0\),
\(c=8\), and finite \(C>0\) on a given smooth interval with
\(|q|\le\epsilon_1\). The projected diffusion residual has
\(\|\mathscr L_Q-4I\|_{\rm op}\le4|q|+(4/3)|q|^2\). The non-scalar
cross term consumes at most \(25G_4/6\) of the \(-14G_4\) principal
coercivity on \(|q|\le1/8\), where \(G_4=\int|T|^2|\nabla T|^2\,dV_g\).
The scalar part contributes \(-8\int|d(|T|^2)|^2\,dV_g\).
The changing inverse metric is retained and bounded using E14.
The remaining errors are of degrees \(K|q||T|^4\),
\(|T|^4|\nabla T|\), and \(|T|^6\). After shrinking \(\epsilon_1\)
and applying Young to the mixed term,
\[
 F_4'\le-cG_4-KF_4+C\int|T|^6\,dV_g,\qquad
 F_4=\int|T|^4\,dV_g.
\]

Under the assumed uniform scalar Sobolev inequality with constant
\(C_S\), the explicit initial condition
\(F_4(0)^{1/2}< (C C_S)^{-1}\min\{c/8,1/2\}\) implies the critical
smallness persists along the given interval. The decay factors for
\(F_4\) and for \(\|T\|_4^2\) are respectively \(e^{-Kt/2}\) and
\(e^{-Kt/4}\). The proof uses a first-exit argument rather than an
assumption of persistent \(L^4\) smallness. Interval pinching and the
uniform Sobolev constant remain assumptions. No E14 supremum-integral
bound, continuation, or convergence conclusion follows.

## Frozen versions

| Branch input | Checked SHA-256 |
| --- | --- |
| `brainstorm/notes/B17_CRITICAL_STRAIN_BOOTSTRAP_20261122.md` | `05b69d39dfe3276ba5512acb8d19fd514e3b08c7242f9456a32dfa37552c92f3` |
| `notes/18A_ROUND_STRAIN_REACTION_20261122.md` | `eb12c9f24b25d0ae8ed99eaa65485218ad8caed3c6497a9fb44e8dfa94c0dd4d` |
| `notes/18B_STRAIN_ENERGY_ESTIMATE_20261122.md` | `8e64d9636552a2608bdb4f972ca2a9745f5698d709a7e651a01c43e394a83a87` |
| `notes/16_TEMPORAL_STRAIN_CRITERION_20261122.md` | `204022875cd34b4672850e9e9540c9a099caa21f8f35c4c82915b359d4412193` |
| `research-progress/handoffs/SP4-CME-E19_REQUEST_v1.md` | `6936062028496934247cdc6bd15c59b0d7b194106e960486953d8100b5ddcf95` |

The proof is analytic. No numerical artifact was used.
