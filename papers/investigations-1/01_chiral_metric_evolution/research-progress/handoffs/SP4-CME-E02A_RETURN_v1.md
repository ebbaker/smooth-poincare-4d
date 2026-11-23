# SP4-CME-E02A return v1

22 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. The bounded E helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and the selected
lead's actual model and effort were unavailable. See the
[frozen request](SP4-CME-E02A_REQUEST_v1.md) and the
[full derivation](../../notes/04A_NONLINEAR_Q_20261122.md).

## Disposition

The B01 candidate is exact for the \(Q\)-Hessian on the smooth definite
interval. In the manuscript clock and fixed time identification, set
\(X_c=\nabla_c Q\), \(S=\sqrt Q\), \(b=A-\Gamma_A^+\), and
\(\Xi_c=2[\nabla_c S,S]+4S\operatorname{ad}(b_c)S\) in an instantaneous
orthonormal coframe. The result is
\[
 \begin{aligned}
 Q_t&=\mathscr L_Q(\Delta_A Q)+\mathcal G
          -24K\sqrt{\det Q}(Q-I),\\
 \mathscr L_Q(T)&=2(QT+TQ)-\tfrac43\operatorname{tr}(QT)Q,\\
 \mathcal G&=4\sum_c X_c^2-\tfrac43\sum_c\operatorname{tr}(QX_c)X_c
             -\tfrac43|\nabla Q|^2Q+\sum_c[X_c,\Xi_c],\\
 \mu_t&=0,\qquad \operatorname{tr}_{\widehat g}\widehat g_t=0.
 \end{aligned}
\]
The reaction contribution to a minimum eigendirection is
\(24K\sqrt{\det Q}(1-\lambda_{\min})\ge0\), with a coefficient that
vanishes at the boundary. Its first variation gives
\(-24K q_1\). The full round linearization is
\((q_1)_t=-4(\nabla_{A_0}^*\nabla_{A_0}+6K)q_1\).

The volume result is pointwise for the unadjusted flow. In the trace
of the wedge quotient the Hessian cancels and two opposite
quadratic-gradient traces cancel. Independently
\(\sum_i v_i\wedge F_i=2\sum_c\operatorname{tr}(C_c Q)\iota_{e_c}\mu=0\)
and Bianchi gives the same volume law. The manuscript's general
arbitrary-path variation permits changes in local volume density.
Its flow-specific sentence after `flow:gradient` merits the pointwise
qualification. A time-dependent base change produces an additional
Lie derivative of the volume form.

For \(m=\lambda_{\min}(Q)\) and \(M_*=\lambda_{\max}(Q)\),
the Frobenius quadratic form of \(\mathscr L_Q\) lies between
\(4m|T|^2\) and \(4M_*|T|^2\) on trace-free symmetric \(T\).
Its Rayleigh quotient on \(T=I-3P_{\min}\), with \(P_{\min}\)
the projector onto a line in a minimum eigenspace, is \(2m(3-m)\).
This shows genuine degeneration as \(m\downarrow0\). The minimum
eigenvalue direction of the principal term couples to Hessians
of the other entries. The note gives eigenvalue-dependent bounds
for \(\nabla S\), \(b\), \(\Xi\) and \(\mathcal G\).
The adapted geometry and horizontal derivatives remain in the
exact equation. Pointwise density conservation leaves control of
the metric coefficients and derivatives, the lower eigenvalue
bound and nonlinear continuation open for lead assessment.

## Input and output identities

The frozen mathematical inputs matched. The live B01 decision was
subsequently extended with a follow-up after the frozen text. The
original 20-line prefix was separately hashed and matches the request.
Fine was inspected in HTML at Propositions 4.2 and 4.5. The local
reading-copy hash identifies the bytes on disk.

| File | SHA-256 |
| --- | --- |
| SP4-CME-E02A_REQUEST_v1.md | `3879fbd70f055499d4c15381dadb8db3f46d8bedd24efee9d2d8e2518f81c1f0` |
| chiral_curvature_and_metric_evolution.tex | `4af6ef2f1c6ce7cd5102fc1d75d17f34e3c5a5357f51e70e61f07a967a361ec0` |
| E01_FOUNDATION_ASSESSMENT_20261122.md | `83e1daa219c826454c9201776dd94542095a026d223976c3820dfe6c759045c6` |
| B01_NONLINEAR_Q_DECISION_20261122.md, original prefix | `7f8ee74718d73baa1230f3757c4135ad23219b26dbf8c849519f6d3f0773d2df` |
| B01_NONLINEAR_Q_DECISION_20261122.md, with follow-up when checked | `a9a8d2640a50437278079b49fd69e54a6e2d1ab13d339222912468391a1e1d54` |
| 02_riemannian_s4_metric_evolution_20261121.md | `fca4cad10ee49b497628932e7ee1b150bfe4e701a3422b6e3b1f2e764cd16347` |
| 1111.5005v2.pdf | `d92e0dca0fd864beab3f416ef80d998fa421c9fdf68854b3f21490c3da7139c8` |
| 04A_NONLINEAR_Q_20261122.md | `4568aff07ef8678e66b87c099fcabe787ef0c07afb5ef8873dfc80e2e99b3a19` |
