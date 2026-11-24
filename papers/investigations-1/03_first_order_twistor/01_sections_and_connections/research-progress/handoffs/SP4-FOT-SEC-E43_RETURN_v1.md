# SP4-FOT-SEC-E43 · Projected quadratic curvature · return v1

24 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The author-selected lead and effort
were retained. The [issued request][request] records configured
helper routing `gpt-6.2-sol` / `ultra`. Actual backend identifiers
and effort for the lead and helper were unavailable for independent
verification.

**Outcome.** The [analytic note][note] proves the requested limit in
the E27 symmetric fixed-volume chart at a supplied smooth reference.
For the longitudinal fields from a real smooth compactly supported
cutoff in an exterior Gaussian patch, the correction \(p_N=QLe_N\)
gives exact smooth kernel tensors \(k_N=e_N-p_N\). For each smooth
adjoint field \(Z\in\ker L^*\),
\[
 \langle Z,F_r''(0)[k_N,k_N]\rangle_{L^2(r)}
 \longrightarrow \tfrac18\int_M b^2\langle Z,W\rangle_r\,dV_r .
\]
Mixed projected Hessians for a finite family of disjoint compact
supports tend to zero.

The pure longitudinal and longitudinal-correction pairings each
tend to \(-\tfrac18\int_M b^2\langle Z,W\rangle_r\,dV_r\).
The exact derivative of the infinitesimal polar rotation in the
base direction \(v\) is the infinitesimal pullback of
\([v^\sharp,e_N^\sharp]/8\). It vanishes in the pure test and tends
to zero after pairing in the mixed test. The correction-correction
term tends to zero by the paired \(H^1\) Hessian bound. The sign in
the kernel pairing follows by subtracting the two mixed terms.

**Evidence and handoff.** All five pinned working versions matched
the SHA-256 values in the request. The note records the exact
manuscript equations and the checked Fefferman–Graham, Kottke and
Melrose passages. The result supplies the analytic moment input for
[E44][e44], whose exterior sign and finite-dimensional balance
hypotheses need separate assessment.

[request]: SP4-FOT-SEC-E43_REQUEST_v1.md
[note]: ../../notes/SEC_E43_20261124.md
[e44]: SP4-FOT-SEC-E44_REQUEST_v1.md
