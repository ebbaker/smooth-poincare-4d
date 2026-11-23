# SP4-CME-E24 return v1

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The fixed E helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and the
selected lead's actual settings were unavailable. See the
[frozen request](SP4-CME-E24_REQUEST_v1.md) and
[full proof](../../notes/24_TEMPORAL_BOOTSTRAP_20261122.md).

## Temporal budget

For \(a=C_*J\), \(\eta=\sup_M|Q(0)-I|\), the E14 quadratic-form
comparison gives \(\sup_M|q(t)|\le\sqrt3((1+\eta)e^{a(t)}-1)\).
Fixed pointwise volume and the inverse metric comparison transfer
the scalar Sobolev inequality with constant \(S_0e^{a(t)}\).
Choose
\(\sqrt3\eta<\epsilon\le\min\{\epsilon_0^{\rm E16},\epsilon_1^{\rm E19}\}\).
Then the positive budget is
\[
 J_{\rm B}=\frac1{C_*}
   \log\left(\frac{1+\epsilon/\sqrt3}{1+\eta}\right),
 \qquad a_{\rm B}=C_*J_{\rm B}.
\]
On every already-smooth segment starting at zero with \(J(t)\le J_{\rm B}\),
pinching and the uniform \(S_0e^{a_{\rm B}}\) Sobolev constant hold
throughout. Using the E19 sixth-power constant \(C\), if
\(\|T(0)\|_4^2<(2CS_0e^{a_{\rm B}})^{-1}\), then
\(\|T(t)\|_4^2\le e^{-Kt/4}\|T(0)\|_4^2\) on that segment.
Budget persistence remains a separate premise.

## Finite endpoint

The frozen request's Hodge-star sign is reversed relative to the
audited convention. The actual flow satisfies
\(v=+4*(C\wedge F)\), since \(d_A^*=-*d_A*\) on self-dual two-forms
in dimension four. The resulting absolute-norm estimates are
independent of this sign correction.

Independently assume \(T_\star<\infty\) and \(J_\star=J(T_\star)<\infty\).
Let \(a_\star=C_*J_\star\). In the fixed \(g_0,\delta\) sup norms,
\[
 \int_0^{T_\star}\|A_t\|_\infty\,dt
 \le72\sqrt3 K e^{a_\star/2}\sqrt{T_\star J_\star},\qquad
 \int_0^{T_\star}\|F_t\|_\infty\,dt
 \le4512\sqrt3 K e^{a_\star}J_\star .
\]
Thus \(\alpha=A-A(0)\) and \(F\) have uniform spatially continuous
limits. Their curvature identity holds in distributions with the
quadratic term continuous under uniform convergence. The volume form
remains \(\mu(0)\) and \(Q_\star\ge e^{-a_\star}Q(0)>0\), so the
limiting curvature is strictly definite in the given sign and
reconstructs a continuous positive metric. Fixed smooth bundle
frames and gauge changes preserve these statements. Higher
regularity in an appropriate gauge and smooth continuation
remain unresolved by these bounds.

## Input and output identities

All three frozen inputs matched. E16B supplies the common threshold
and E02C verifies the velocity sign.

| File | SHA-256 |
| --- | --- |
| SP4-CME-E24_REQUEST_v1.md | `16419591e327e0af427684390d839ddbf2a40fc27d9db50e6c4d8e5306e93fc7` |
| B20_TEMPORAL_BOOTSTRAP_DECISION_20261122.md | `b552bbe9f7338301af7c5354eabc6b2cb57be84a0f38b06d801a4d91448f61a4` |
| 16_TEMPORAL_STRAIN_CRITERION_20261122.md | `204022875cd34b4672850e9e9540c9a099caa21f8f35c4c82915b359d4412193` |
| 20_CRITICAL_STRAIN_ENERGY_20261122.md | `5b7b6ec68d806188a6a54209a7cc513ce0a0a3a10b1582368ef073ae12585228` |
| 18B_STRAIN_ENERGY_ESTIMATE_20261122.md | `713aa0bd1c9a3644d57208fa6ae30b4fdcd18df060197b03ef0b39afcb800437` |
| 04C_VOLUME_AND_JETS_20261122.md | `0893466b285f5bdcfc2f9aae80f88338cacb06a64e270fd745fe4b3186af0838` |
| 24_TEMPORAL_BOOTSTRAP_20261122.md | `99e7fe2a042f8195d310f85a38744f5e6bb76cf47221d948419a3236aff6fc44` |
