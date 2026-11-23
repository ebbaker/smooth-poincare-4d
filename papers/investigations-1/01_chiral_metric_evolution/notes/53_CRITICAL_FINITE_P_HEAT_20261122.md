# E53 — Finite-exponent endpoint embedding and damped heat on the four-torus

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Configured helper gpt-6.2-sol/ultra.
Independent runtime attestation and actual lead settings are unavailable.
The [request][req] freezes the inputs. [B37][b37] sets the flat
problem with a full spatial gradient.

## Dyadic partition and kernel bounds

Use \(\mathbb T^4=(\mathbb R/\mathbb Z)^4\) with volume-one
Lebesgue measure and frequencies \(e^{2\pi i k\cdot x}\),
\(k\in\mathbb Z^4\). Values lie in a fixed finite-dimensional
real Euclidean space, with its induced tensor norms, and
\(\Delta=\sum_{i=1}^4\partial_i^2\).
Choose a smooth radial nonincreasing cutoff \(\chi\) on
\(\mathbb R^4\) with values in \([0,1]\), equal to one for
\(|\zeta|\leq1\) and zero for \(|\zeta|\geq2\). Put
\[
 \varphi_0(\zeta)=\chi(\zeta),\qquad
 \varphi_j(\zeta)=\chi(2^{-j}\zeta)-\chi(2^{1-j}\zeta)
                 =\varphi(2^{-j}\zeta),\quad j\geq1,\qquad
 \varphi=\chi-\chi(2\,\cdot).
\]
The Fourier multiplier \(\Delta_j\) has symbol \(\varphi_j(k)\).
The low block includes \(k=0\) and vanishes for \(|k|\ge2\).
For \(j\geq1\), \(\varphi_j\) is supported on
\(2^{j-1}\leq|\zeta|\leq2^{j+1}\) and vanishes at the
two endpoints. Products vanish for \(|j-\ell|\geq2\),
including low-to-high products. The partition telescopes to one.
For \(s>0\) use the inhomogeneous norm
\[
 \|U\|_{B^s_{8,1}}=\sum_{j\geq0}2^{sj}\|\Delta_j U\|_8 .
\]
Take \(\psi\in C_c^\infty(\mathbb R^4)\) equal to one on
\(1/2\leq|\zeta|\leq2\), with support in \(1/4<|\zeta|<4\).
For the low block take \(\psi_0=1\) on \(|\zeta|\leq2\)
and supported in \(|\zeta|<4\).

For a smooth compactly supported symbol \(m\), the convolution
kernel with symbol \(m(2^{-j}k)\) is the periodization
\[
 K_{j,m}(x)=\sum_{\ell\in\mathbb Z^4}2^{4j}\check m(2^j(x+\ell)),
 \qquad
 \check m(y)=\int_{\mathbb R^4}e^{2\pi i y\cdot\zeta}m(\zeta)\,d\zeta .
\]
The Fourier coefficient formula follows by integrating termwise
over a fundamental cube and unfolding its translates. It converges
absolutely by integration by parts in the inverse transform.
Indeed \(\|K_{j,m}\|_1\leq\|\check m\|_1\).
For \(x\) in a centered fundamental cube,
\(\sum_\ell(1+2^j|x+\ell|)^{-N}\) is bounded uniformly in \(j,x\)
for \(N>4\), by separating the nearest finitely many translates
and summing the remaining lattice tail. Thus
\(\|K_{j,m}\|_\infty\leq C_m2^{4j}\).
It follows that
\[
 \|K_{j,m}\|_r\leq C_m2^{4j(1-1/r)}\qquad(1\leq r\leq\infty),     \tag{1}
\]
where on a fixed symbol support \(C_m\) is controlled by finitely
many sup norms of symbol derivatives.
In particular the blocks are uniformly bounded on \(L^8\).
Taking \(m(\zeta)=(2\pi i\zeta)^\beta\psi(\zeta)\), or the
fixed low analogue, and using Young's inequality with kernel
exponent \(8/7\) gives
\[
 \|D^\beta\Delta_j U\|_\infty
    \leq C_\beta 2^{(|\beta|+1/2)j}\|\Delta_j U\|_8 .               \tag{2}
\]
This acts on the already localized block, using the cutoff
which is one on its support.

The Fourier series \(\sum_j\Delta_j U\) reconstructs \(U\) in
distributions. For finite \(B^s_{8,1}\) norm and \(s>0\)
it converges absolutely in \(L^8\), giving
\(\|U\|_8\leq\|U\|_{B^s_{8,1}}\).
The space defined on distributions is complete. A Cauchy
sequence converges in \(L^8\), and the convergence of each
block there plus summation of the nonnegative block norms
gives convergence in \(B^s_{8,1}\). Smooth trigonometric
polynomials are dense. For the partial sum through \(N\),
apply \(\Delta_\ell\) to its omitted blocks, use (1) and
the finite overlap, and bound the \(B^s_{8,1}\) error by
\(C\sum_{j>N}2^{sj}\|\Delta_j U\|_8\).
Equation (2) with \(\beta=0\) also gives a continuous
representative and \(\|U\|_\infty\leq C\|U\|_{B^{1/2}_{8,1}}\)
by uniform convergence of the block series.

## Full-gradient endpoint embedding

Use the [E21 rearrangement convention][e21] on volume one,
\[
 \|f\|_{4,1}=\int_0^1 s^{-3/4} f^*(s)\,ds ,
\]
with \(f^*\) the decreasing rearrangement of the Euclidean
tensor norm \(|f|\). For smooth \(U\), set \(f_i=\partial_iU\).
For \(j\geq1\), the inverse derivative identity is
\[
 \Delta_j U=2^{-j}\sum_{i=1}^4 K_{j,m_i}*f_i,\qquad
 m_i(\zeta)=\varphi(\zeta)\frac{\zeta_i}{2\pi i|\zeta|^2}.
\]
Each \(m_i\) extends smoothly by zero near the origin. The
identity follows from summing \(k_i^2/|k|^2\) on nonzero
frequencies. The operator on the right is defined for arbitrary
tensor fields \(f\). Given any \(f=f^{(2)}+f^{(8)}\), apply
(1) to these two parts with \(r=8/5\) and \(r=1\), respectively.
Young's inequality gives
\[
 2^{j/2}\|\Delta_j U\|_8
   \leq C\bigl(2^j\|f^{(2)}\|_2+2^{-j/2}\|f^{(8)}\|_8\bigr).
\]
Taking the infimum gives
\[
 2^{j/2}\|\Delta_j U\|_8\leq C\,t_j^{-\theta}K(t_j,f),              \tag{3}
\]
where
\[
 K(t,f)=\inf_{f=u+v}(\|u\|_2+t\|v\|_8),\qquad
 t_j=2^{-3j/2},\qquad\theta=2/3 .
\]
In (3) the \(L^2\)-to-\(L^8\) kernel gain is
\(2^{(3/2)j}\), and the factor \(2^{-j}\) is the inverse
derivative. Neither part of the split need be a gradient.
Since \(K(t,f)\) is nondecreasing, for
\(t_j\leq t\leq t_{j-1}\) we have
\(t^{-\theta}K(t,f)\geq \tfrac12t_j^{-\theta}K(t_j,f)\).
The intervals have a fixed positive length in \(dt/t\).
This bounds the dyadic sum by a constant times
\(\int_0^\infty t^{-\theta}K(t,f)\,dt/t\).

To bound this integral directly, let
\(\mu(v)=|\{|f|>v\}|\) and \(e(x)=f(x)/|f(x)|\)
where \(f\ne0\), with \(e=0\) elsewhere. The vector
layer formula is \(f=\int_0^\infty e\,1_{\{|f|>v\}}\,dv\).
For fixed \(t>0\) put the layers with
\(\mu(v)^{1/2}\leq t\mu(v)^{1/8}\) into \(L^2\) and
the others into \(L^8\). The cost of each layer is the
smaller of those two quantities. The split integrals
converge in their indicated spaces, since the minimum
is at most \(t^\theta\mu(v)^{1/4}\) and
\[
 \|f\|_{4,1}=4\int_0^\infty \mu(v)^{1/4}\,dv
\]
by the layer formula for \(f^*\) and Tonelli.
Minkowski gives
\(K(t,f)\leq\int_0^\infty\min(\mu(v)^{1/2},t\mu(v)^{1/8})\,dv\).
At any \(0<\mu\leq1\) the crossover is \(t=\mu^{3/8}\).
Integrating on each side yields
\[
 \int_0^\infty t^{-\theta}\min(\mu^{1/2},t\mu^{1/8})\,\frac{dt}{t}
 =\left(\frac{1}{1-\theta}+\frac1\theta\right)\mu^{1/4}.
\]
The zero-measure case contributes zero. Tonelli in \(t,v\)
now bounds the sum in (3) by \(C\|dU\|_{4,1}\).
The low block has \(\|\Delta_0 U\|_8\leq C\|U\|_8\)
by (1). Together these prove
\[
 \boxed{\ \|U\|_{B^{1/2}_{8,1}}
          \leq C\bigl(\|U\|_8+\|dU\|_{4,1}\bigr).\ }               \tag{4}
\]

The completion of smooth fields for the right side of (4) is
the weak-derivative graph \(U\in L^8,\ dU\in L^{4,1}\).
Here are details of the density and closedness.
For \(F_f(s)=\int_0^s f^*(u)\,du\), the layer formula on
the nonatomic torus gives
\(F_f(s)=\sup_{|E|=s}\int_E |f|\). The weighted layer
representation is
\[
 \|f\|_{4,1}=F_f(1)+\tfrac34\int_0^1s^{-7/4}F_f(s)\,ds .
\]
It proves the triangle inequality and contraction by
normalized nonnegative convolution kernels, the latter
by taking the supremum after averaging functions translated
against each \(1_E\). Also \(\|f\|_1\leq\|f\|_{4,1}\).
An \(L^{4,1}\) Cauchy sequence therefore has an \(L^1\)
limit. The functionals \(F_f(s)\) are continuous in \(L^1\)
at each \(s\), and Fatou in the displayed representation
proves convergence in \(L^{4,1}\). Thus the derivative graph
is closed by distributional integration by parts.

Amplitude truncation approximates \(f\) in \(L^{4,1}\),
since the rearrangement of \(f1_{\{|f|>N\}}\) is bounded
by \(f^*\) on \((0,\mu(N))\) and vanishes thereafter.
For bounded \(f\), a positive smooth periodic approximate
identity converges in \(L^1\). Its differences with \(f\)
have bounded sup norm and rearrangement tending to zero
at each \(s>0\) by the \(L^1\) convergence, so dominated
convergence gives convergence in \(L^{4,1}\). Convolution
contractivity and truncation extend this to general
\(f\in L^{4,1}\). Applying the same mollifier to \(U\) and
its distributional derivative gives smooth approximation
in the graph norm. Estimate (4) passes by completeness of
\(B^{1/2}_{8,1}\) and identification of its \(L^8\) limit.
It also yields uniform convergence of these smooth
approximants to the unique continuous representative,
by (2). This identifies the representative that can be
used as the initial heat datum.

## Damped heat and the initial trace

Let \(H(t)=e^{t(\Delta-1)}\) with Fourier multipliers
\(e^{-t(1+4\pi^2|k|^2)}\). For \(j\geq1\) apply the
kernel construction to
\[
 m_\tau(\zeta)=\psi(\zeta)e^{-4\pi^2\tau|\zeta|^2},
 \qquad \tau=t2^{2j}.
\]
On the fixed annulus supporting the cutoff every required
derivative is bounded by \(C(1+\tau)^N e^{-c_0\tau}\).
The polynomial can be absorbed into \(Ce^{-c\tau}\)
for \(0<c<c_0\), so the \(L^1\) estimate in (1) has this
bound on its constant. Hence
\[
 \|H(t)\Delta_j V\|_8
      \leq C e^{-c2^{2j}t}\|\Delta_j V\|_8
      \qquad(j\geq0,\ t\geq0).                                   \tag{5}
\]
For \(j=0\), sum its finitely many Fourier modes, each
decaying at least as \(e^{-t}\), with their coefficients
bounded by \(\|\Delta_0 V\|_1\leq\|\Delta_0 V\|_8\).
This handles the zero mode and proves (5) with common
\(C\) and \(0<c\leq1\).

For \(U_0\in B^{1/2}_{8,1}\) and \(f\in L^1(0,T;B^{1/2}_{8,1})\)
define
\[
 U(t)=H(t)U_0+\int_0^t H(t-s)f(s)\,ds .
\]
By (5) the semigroup is bounded on \(B^{1/2}_{8,1}\);
density of trigonometric polynomials gives strong
continuity at zero and the semigroup identity gives
it at other times. The Bochner integral exists and is
continuous in \(B^{1/2}_{8,1}\) by dominated convergence
and the time-integrable \(B^{1/2}_{8,1}\) norm of the source.
It tends to zero at the initial slice because it is bounded
there by \(C\int_0^t\|f(s)\|_{B^{1/2}_{8,1}}\,ds\).
Thus \(U(0)=U_0\) strongly in \(B^{1/2}_{8,1}\) and
uniformly in space for the continuous representatives.
For the homogeneous term, a datum in the weak derivative graph
also converges in that graph at zero. The undamped heat kernel
is the periodized normalized Euclidean Gaussian and hence a
positive approximate identity. Apply the preceding graph
convergence argument using
\(dH(t)U_0=H(t)dU_0\) and \(e^{-t}\to1\).

Take the time supremum of the block Duhamel estimate
with (5). Integrating its decaying exponential kernel in
time gives the same right side after multiplying by \(2^{2j}\).
For each \(j\), this is
\[
 \sup_{0\leq t\leq T}\|\Delta_j U(t)\|_8
 +2^{2j}\int_0^T\|\Delta_j U(t)\|_8\,dt
 \leq C\left(\|\Delta_j U_0\|_8
                 +\int_0^T\|\Delta_j f(t)\|_8\,dt\right).
\]
Fubini or Tonelli applies to the positive scalar majorant,
including on the infinite time interval. Multiplying by
\(2^{j/2}\) and summing gives
\[
 \begin{aligned}
 E_T(U)
  &=\sum_{j\geq0}2^{j/2}\sup_{0\leq t\leq T}\|\Delta_j U(t)\|_8
         +\sum_{j\geq0}2^{5j/2}\int_0^T\|\Delta_j U(t)\|_8\,dt\\
  &\leq C\bigl(\|U_0\|_{B^{1/2}_{8,1}}
                  +\|f\|_{L^1(0,T;B^{1/2}_{8,1})}\bigr)
       \qquad(0<T\leq\infty).                                    \tag{6}
 \end{aligned}
\]
The constant is independent of \(T\).
The equation holds distributionally, either by the scalar
Fourier equations or by approximating the data by trigonometric
polynomials and the source by smooth finite-frequency functions
compactly supported in time on \((0,T)\). These approximations
are dense in the indicated spaces by the spatial density
above and Bochner \(L^1\) approximation in time.
Their solutions converge in (6), by applying the same estimate
to their differences. Uniqueness among distributional
solutions in the finite-\(E_T\), strongly traced class
follows by testing against each Fourier mode. Its coefficient
satisfies the scalar distributional ODE
\(\partial_t U_k=-(1+4\pi^2|k|^2)U_k+f_k\), so the
integrating factor and the trace determine it uniquely.
For blockwise continuous paths with finite \(E_T\), the
summable tails of the first term give strong continuity
in \(B^{1/2}_{8,1}\) from continuity of the finitely many
remaining blocks. This is the path class realized by the
Duhamel solution and its smooth approximations.
It is complete for \(E_T\). The first sum controls the
uniform \(B^{1/2}_{8,1}\) path norm, so a Cauchy sequence
has a continuous path limit, and passage to each block
followed by Fatou in the sum and time integral gives
convergence also in \(E_T\).

Finally (2) for \(|\beta|\leq2\) gives, for almost every \(t\),
uniform convergence of the block series together with its
spatial derivatives through order two, because the second
sum in (6) is finite. In particular
\[
 \int_0^T\|D^2U(t)\|_\infty\,dt
        \leq C\sum_{j\geq0}2^{5j/2}\int_0^T
                         \|\Delta_j U(t)\|_8\,dt
        \leq C E_T(U).                                           \tag{7}
\]
The derivatives also arise as the \(L^1_t C^0_x\) limits of
the finite-block derivatives, which gives measurability and
identifies the weak Hessian.

This flat bound uses the full gradient and a low-frequency
value norm. It controls the constant-coefficient heat
problem with a specified source. The distinct crude
\(L^1_tL^{4,1}_x\) principal-forcing estimate tested in
[E25][e25] is outside (6). Nonlinear principal coefficients
and estimates from intrinsic strain remain separate.

[req]: ../research-progress/handoffs/SP4-CME-E53_REQUEST_v1.md
[b37]: ../brainstorm/notes/B37_FINITE_P_CRITICAL_CONTROL_20261122.md
[e21]: 21_LORENTZ_HEAT_BENCHMARK_20261122.md
[e25]: 25_PRINCIPAL_FORCING_OBSTRUCTION_20261122.md
