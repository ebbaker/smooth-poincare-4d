# SP4-CME-E09 return v1

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. The helper was configured as gpt-6.2-sol /
ultra. Independent runtime settings and lead model/effort were
unavailable. The [derivation][note] completes [request v1][request].

On every smooth definite slice under the stated sign and
normalization, the compatibility inverse is parallel for the
joint \(\Gamma\) and base connection. Differentiating it gives
\(\nabla^\Gamma b=-\mathscr C^{-1}\mathcal J(\nabla^\Gamma P)\)
with \(P=S^{-1}\nabla^A S\) and
\(\nabla^\Gamma_Y P=\nabla^A_Y P-[\operatorname{ad}(b_Y),P]\).
The derivation gives the explicit floor bound depending on \(m_0\).

The optional uniform calculation also succeeds. With
\(U_X=\operatorname{sym}P_X\), the differentiated Sylvester
identity is
\[
\mathcal S_S((\nabla^A_Y P)_X)
=2(\nabla^A_Y U)_X S+S[P_X,P_Y].
\]
The two inverse maps on left and right multiples of \(S\) have
eigenframe multipliers at most one. This gives
\[
|\nabla^\Gamma b|
\leq 6|\nabla^A T|+(36+8\sqrt3)|T|^2
\]
with a constant independent of \(\lambda_{\min}Q>0\).
The identity was checked algebraically and by exact rational
arithmetic for two noncommuting derivative pairs at different
positive diagonal scales. The direct derivation applies to all
definite data.

The normalized block error is
\[
\begin{aligned}
\tfrac1{\sqrt2}|F_\Gamma+K\Sigma|
&=\bigl(|W^+|_{\rm op,HS}^2+|\operatorname{Ric}_0|^2/4
 +(s-12K)^2/48\bigr)^{1/2}\\
&\le K|q|+6|\nabla^A T|+(42+8\sqrt3)|T|^2 .
\end{aligned}
\]
In the fixed near-perfect regime \(|q|\leq1/8\), \(m\geq7/8\)
and the defect coefficient can be sharpened to
\(K/(1+\sqrt{7/8})\). All terms vanish on the round benchmark.
The estimate uses the ordinary reconstructed metric and internal
norms. It controls \(W^+\), \(\operatorname{Ric}_0\), and the
scalar error. \(W^-\) is the trace-free part of the absent
anti-self-dual diagonal block. An along-flow bound on the
supplied \(\nabla^A T\) norm, full curvature, metric comparison,
noncollapse, or a continuation theorem remain separate tasks.

## Frozen inputs and evidence

All frozen inputs matched when read. The manuscript byte identity
below is for the supplementary chiral block source inspected
at equations `rec:chiral-curvature` and `rec:ricci-block`.

| File | SHA-256 |
| --- | --- |
| `B08_CHIRAL_CURVATURE_CONTROL_20261122.md` | `8ca70ae7e79e719414fbfc0d22c3309df38f4447390baa598aee61d22f843f2e` |
| `05A_REAL_TWISTOR_COMPARISON_20261122.md` | `ffae9af03ae0f42c6578abac85f275015cba23efbffef843b230a0a4e546bbf2` |
| `E01A_AUDIT_20261122.md` | `c111d9c9128dcc5139e660edcab6307cecf7693ecaa4800bdb12ea7ea4a6791f` |
| `04A_NONLINEAR_Q_20261122.md` | `4568aff07ef8678e66b87c099fcabe787ef0c07afb5ef8873dfc80e2e99b3a19` |
| `SP4-CME-E09_REQUEST_v1.md` | `fe90e4d14089746b38b64796943a87c0a4ebf5447d66d809c5f5de73fdfd0dac` |
| `chiral_curvature_and_metric_evolution.tex` | `ca65408b82f4c0bdf27883f79f1f22c807cd215526bafbbd939525e75f982a2b` |
| `11_TRANSPORT_CURVATURE_COMPARISON_20261122.md` | `c5e66058a3c73e13d6582a5f84c3e297080c67ae2ee6458c0a8bf5ac30e266ae` |

[request]: SP4-CME-E09_REQUEST_v1.md
[note]: ../../notes/11_TRANSPORT_CURVATURE_COMPARISON_20261122.md
