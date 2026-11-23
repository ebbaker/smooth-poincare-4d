# SP4-CME-E25 — A periodic obstruction to the crude principal forcing estimate

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Helper configuration gpt-6.2-sol / ultra.
Independent runtime settings and lead model/effort were unavailable.
This fixed test follows [B21][decision] and the [frozen request][request].
Input identities are in the [return][return].

Use the flat torus \(\mathbb T^4=(\mathbb R/2\pi\mathbb Z)^4\)
with normalized probability measure \(d\nu=(2\pi)^{-4}dx\).
The operator is \(\Delta=\sum_{a=1}^4\partial_a^2\), and the
Lorentz norm, following the [E21 rearrangement convention][heat],
is
\[
\|h\|_{4,1}=\int_0^1s^{-3/4}h^*(s)\,ds,
\]
where \(h^*\) rearranges \(|h|\) with respect to \(d\nu\).
The proposed uniform inequality
\[
\int_0^1\|\Delta e^{4t\Delta}f\|_{4,1}\,dt\leq C\|f\|_{4,1}
\]
fails even on the prescribed smooth real trigonometric polynomials.

## Upper bound at the initial slice

For \(N\geq1\), use exactly
\[
f_N(x)=\sum_{j=1}^N\cos(\lambda_jx^1),\qquad \lambda_j=4^j .
\]
Different cosines are orthogonal under \(d\nu\), with squared
norm \(1/2\) each. Thus \(\|f_N\|_2=\sqrt{N/2}\).
Also \(\|f_N\|_\infty=N\) by \(|\cos|\leq1\) and equality
at \(x^1=0\). Chebyshev's inequality, or the \(L^2\) norm
of the rearrangement on \((0,s)\), gives
\[
f_N^*(s)\leq\min(N,\sqrt{N/2}\,s^{-1/2}).
\]
The branches meet at \(s_0=(2N)^{-1}\). Integrating there,
\[
\begin{aligned}
\|f_N\|_{4,1}
&\leq N\int_0^{s_0}s^{-3/4}\,ds
 +\sqrt{N/2}\int_{s_0}^1s^{-5/4}\,ds\\
&=4Ns_0^{1/4}+4\sqrt{N/2}(s_0^{-1/4}-1)\\
&=8\,2^{-1/4}N^{3/4}-4\sqrt{N/2}
\leq C_0 N^{3/4},\qquad C_0=8\,2^{-1/4}.
\end{aligned}
\]

## One positive contribution per heat-time interval

Write \(w_N(t)=\Delta e^{4t\Delta}f_N\).
The Fourier coefficient in the positive \(\lambda_j\)
direction is
\[
\int_{\mathbb T^4}w_N(t,x)e^{-i\lambda_jx^1}\,d\nu(x)
=-\tfrac12\lambda_j^2e^{-4t\lambda_j^2}.
\]
The \(1/2\) coefficient comes from the cosine after normalized
torus integration. This gives \(\|w_N(t)\|_1\geq
\lambda_j^2e^{-4t\lambda_j^2}/2\).
Also \(\|h\|_{4,1}\geq\|h\|_1\) on the probability
space because \(s^{-3/4}\geq1\) on \((0,1)\) and the
integral of \(h^*\) is \(\|h\|_1\).

Let \(I_j=[\lambda_j^{-2},2\lambda_j^{-2}]\).
These intervals lie in \((0,1)\). The largest right
endpoint is \(1/8\), and the right endpoint of \(I_{j+1}\)
is \(\lambda_j^{-2}/8\), strictly before the left endpoint
of \(I_j\). Using the single coefficient on its own
interval yields
\[
\int_{I_j}\|w_N(t)\|_{4,1}\,dt
\geq \tfrac12\int_1^2 e^{-4u}\,du
=c_0,\qquad c_0=(e^{-4}-e^{-8})/8>0 .
\]
Here \(u=t\lambda_j^2\). Summing over the disjoint intervals
gives a lower bound \(c_0N\) for the full integral. Therefore the
ratio of the integral to the initial norm is at least
\((c_0/C_0)N^{1/4}\), which is unbounded.

For every \(\varepsilon>0\), multiplying \(f_N\) by
\(\varepsilon/\|f_N\|_{4,1}\) sets the initial norm to
exactly \(\varepsilon\) while preserving the ratio.
There is also a vanishing initial norm example under simple
rescaling of the same polynomials. The data \(N^{-7/8}f_N\)
have initial norm at most \(C_0N^{-1/8}\), and the forcing
integral is at least \(c_0N^{1/8}\).

## Damping and the scope of the obstruction

For fixed nonnegative damping \(\kappa\) in \(4\Delta-\kappa I\),
the coefficient is multiplied by \(e^{-\kappa t}\), which
is at least \(e^{-\kappa/8}\) on all the selected intervals.
The lower bound becomes \(e^{-\kappa/8}c_0 N\), with the
same unbounded norm ratio. On intervals with
\(2\lambda_j^{-2}\leq1/\kappa\) for \(\kappa>0\),
the damping cost is at most the single factor \(e^{-1}\).
This applies to all sufficiently high frequencies for
any fixed \(\kappa\).

For any fixed nonzero scalar coefficient \(\eta\), as small
as desired, the \(L^1_tL^{4,1}_x\) norm of
\(\eta\Delta e^{4t\Delta}f_N\) is \(|\eta|\) times the
unbounded-ratio quantity. Hence the proposed forcing step
cannot treat a general small constant multiple of \(\Delta U\)
as an \(L^1_tL^{4,1}_x\) source using only the initial Lorentz
norm. A fixed small scalar diffusion coefficient can instead
be absorbed into the heat generator \((4+\eta)\Delta\)
when \(4+\eta>0\). This example tests one estimate on the flat
torus. It gives no obstruction for the actual Fine flow or
its compatible strain system, and does not test methods
that incorporate the principal coefficient into the operator.

[decision]: ../brainstorm/notes/B21_PRINCIPAL_PERTURBATION_TEST_20261122.md
[request]: ../research-progress/handoffs/SP4-CME-E25_REQUEST_v1.md
[return]: ../research-progress/handoffs/SP4-CME-E25_RETURN_v1.md
[heat]: 21_LORENTZ_HEAT_BENCHMARK_20261122.md
