# SP4-CME-E14 return v1

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The fixed E helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and the
selected lead's actual settings were unavailable. See the
[frozen request](SP4-CME-E14_REQUEST_v1.md) and
[derivation](../../notes/16_TEMPORAL_STRAIN_CRITERION_20261122.md).

## Disposition

The B13 polynomial and the full relative curvature identity hold
on the smooth definite interval of the unadjusted flow. With
\(h_c=\operatorname{tr}(QT_c)\), \(k_c=\operatorname{tr}(Q^2T_c)\),
and \(\mathcal D_a{}^c=\nabla_a^A N^c+[P_a,N^c]\), the checked
identities are
\[
 \begin{aligned}
 N_c&=2T_cQ-\tfrac23h_cQ-\tfrac23k_cI
                      +\tfrac29h_c\operatorname{tr}(Q^2)I,\\
 S^{-1}F_{t,ab}
   &=-4K\bigl(\mathcal D_a{}^c\Sigma_{cb}
             -\mathcal D_b{}^c\Sigma_{ca}
             +N^c(P_c+B_c)\Sigma_{ab}\bigr).
 \end{aligned}
\]
Using the full covariant base-slot derivatives and the stated
Frobenius and two-form conventions gives
\[
 |N|\le36|T|,\qquad
 |\nabla^A N|\le36|\nabla^A T|+156|T|^2,\qquad
 K^{-1}|S^{-1}F_t|\le360|\nabla^A T|+4512|T|^2 .
\]
These constants use the trace-three constraint and the relative
bounds for \(P\) and \(b\) across the positive cone.

Pointwise \(\mu_t=0\) makes \(\widehat g^{-1}\widehat g_t\)
trace-free and removes the trace term in \(Q_t\). The two
matrices \(\widehat g^{-1}\widehat g_t\) and \(S^{-1}Q_tS^{-1}\)
each have norm at most \(\sqrt2 K^{-1}|S^{-1}F_t|\).
The upper right Dini derivatives of both signs of
\(\log D\), \(D=\sqrt{\lambda_{\max}(Q)/\lambda_{\min}(Q)}\),
are bounded by \(C_*(|\nabla^A T|+|T|^2)\) with
\(C_*=4512\sqrt2\), including at eigenvalue multiplicities.

On a compact closed base with a smooth definite interval
\([0,\tau)\), put \(J(t)=\int_0^t\sup_x(|\nabla^A T|+|T|^2)\,ds\)
and \(D_0=\sup_x D(0,x)\). For every \(t<\tau\) one has
\[
 \begin{aligned}
 e^{-C_*J(t)}\widehat g(0)&\le \widehat g(t)
                          \le e^{C_*J(t)}\widehat g(0),\\
 \sup_x D(t,x)&\le D_0e^{C_*J(t)},\\
 \lambda_{\min}(Q(t,x))&\ge D_0^{-2}e^{-C_*J(t)} .
 \end{aligned}
\]
The last bound follows directly from the minimum Rayleigh
quotient and uses no assumed positive eigenvalue floor during
the evolution. If \(J(\tau)<\infty\) as an improper integral,
these are uniform up to \(\tau\). At round all three velocities
vanish. Finiteness of the integral, higher-derivative and gauge
control, and smooth continuation remain open.

## Input and output identities

All five frozen hashes matched when read.

| File | SHA-256 |
| --- | --- |
| SP4-CME-E14_REQUEST_v1.md | `1fc2de102a9d390bbaa2e8fc7d54186df779b1be93321037aa99a70543329fd3` |
| B13_TEMPORAL_RELATIVE_CURVATURE_20261122.md | `48592d85159345384fafd53a227faa0f76098ad421198da3d556876cbe516279` |
| 04A_NONLINEAR_Q_20261122.md | `4568aff07ef8678e66b87c099fcabe787ef0c07afb5ef8873dfc80e2e99b3a19` |
| 05A_REAL_TWISTOR_COMPARISON_20261122.md | `ffae9af03ae0f42c6578abac85f275015cba23efbffef843b230a0a4e546bbf2` |
| 11_TRANSPORT_CURVATURE_COMPARISON_20261122.md | `c5e66058a3c73e13d6582a5f84c3e297080c67ae2ee6458c0a8bf5ac30e266ae` |
| E01A_AUDIT_20261122.md | `c111d9c9128dcc5139e660edcab6307cecf7693ecaa4800bdb12ea7ea4a6791f` |
| 16_TEMPORAL_STRAIN_CRITERION_20261122.md | `204022875cd34b4672850e9e9540c9a099caa21f8f35c4c82915b359d4412193` |
