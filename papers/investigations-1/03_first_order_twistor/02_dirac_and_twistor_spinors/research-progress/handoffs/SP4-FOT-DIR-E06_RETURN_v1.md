# SP4-FOT-DIR-E06 · Prescribed zero jet and finite cost · return v1

24 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Fixed E routing was specified as
`gpt-6.2-sol` / `ultra`. Actual helper and lead model identifiers and
reasoning effort were unavailable.
[Request v1](SP4-FOT-DIR-E06_REQUEST_v1.md) · [Owning register](../REGISTER.md) ·
[Derivation](../../notes/DIR_E06_20261124.md)

**Completed.** For the given arbitrary smooth positive-definite metric
on a smooth oriented homotopy four-sphere, the allowed positive
half-spinor class contains a smooth section with just one transverse
zero at the chosen point and prescribed first jet \(X\mapsto X\cdot\eta\)
for each nonzero \(\eta\in S_p^-\).

- The characteristic number is \(\langle c_2(S^+),[M]\rangle=-1\).
  The Clifford-linear jet has local degree \(-1\) because the complex
  orientation of the positive quaternionic spinor module in the chosen
  model reverses its tangent quaternionic orientation. This identifies
  the sign with \(S^+\) defined by the self-dual action.
- The ball complement is contractible. In its unitary trivialization,
  the normalized collar section has degree zero because the ball jet
  accounts for the entire Euler number. A smooth collar extension
  produces no exterior zeros.
- At the zero \(D_g\psi=-4\eta\), so \(P_g\psi=0\) there. The ratio
  \(|P_g\psi|/|\psi|\) is bounded near the zero. For an incompatible
  transverse jet the fourth-power integral diverges logarithmically.

HEAD was `f178fbb604f7f972b639fa8c1fc05f649c9bc8fc`. All four
request digests matched the working-tree bytes. The derivation records
the passages read and uses Friedrich's published equation (1.1) for
the operator convention and Hirzebruch's equation (16) for the
Pontryagin number. No reading copy or computational artifact was saved.

The fixed-metric finite-cost domain is nonempty. This closes the
initialization premise of [B06](../../brainstorm/notes/DIR_B06_RELATIVE_DEFECT_20261124.md).
Comparison with the independent fixed-class estimate belongs to E07.
Control of the cost as the conformal structure varies and attainment
still require separate arguments.
