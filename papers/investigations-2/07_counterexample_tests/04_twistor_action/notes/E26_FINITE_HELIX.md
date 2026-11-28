# SP4-TWA-E26 · Global comparison for the circular helix

28 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. The [frozen request](../research-progress/handoffs/E26_REQUEST_v1.md) records the author-selected GPT-6.2 Astra/ultra lead and configured GPT-6.2 Sol/ultra helper. Actual serving model and reasoning effort were unavailable. Execution used checkout `7c6bbab9a0a66532d81599b3dd0952f5a371c8d4` with all three requested SHA-256 digests matched.

For either spatial helicity in E15, the radial field is the unique global action minimizer at \(b=51\pi/16\) among smooth circular helices with arbitrary time angle and time log amplitude. The favorable helicity admits the quantitative lower bound in (4). The argument uses the [E15 density](E15_HELICAL_COMPETITOR.md), whose sign and normalization were checked in [E20](../reviews/E20_SLOPE_CONTROLS_REPLAY.md), at the traces and product fixed in the [B08 closing](../continuation-notes/CLOSING_B08_SLOPE_20261128.md).

## Exact scalar reduction and minimizing amplitude

Use the oriented flat Riemannian product \(M=[-1,1]\times(\mathbb R/\mathbb Z)^3\), with the periodic spin structure and volume two. Take the positive half-spinor convention of E15, with \(\sigma=1\) in its oriented quaternionic frame. For \(\eta\in\{-1,1\}\) set \(\lambda=2\pi\eta\) and

\[
n_\eta(x_1)=\mathbf j\cos(\lambda x_1)+\mathbf k\sin(\lambda x_1),
\qquad
\psi=e^{bt+u(t)}\bigl(\cos\theta(t)+\sin\theta(t)n_\eta(x_1)\bigr).
\]

Smooth real \(u,\theta\) satisfy \(u(\pm1)=0\) and \(\theta(\pm1)=0\), so \(\psi\) is zero-free with full end traces \(e^{\pm b}\sigma\). The proof also covers angles with endpoint values in \(2\pi\mathbb Z\).

Set \(\omega=\pi/2\), \(C=3/4\), \(x=\omega t\), \(B=b/\omega=51/8\), \(d=4/3\), \(a=(b+u_t)/\omega\), and \(w=\sin^2\theta\). A subscript \(x\) differentiates the time profile in the variable \(x\). Write \(\mathbb E\) for the uniform average on \(I=[-\pi/2,\pi/2]\), and \(\mu=\mathbb E w\). In these variables

\[
\begin{aligned}
q&=\frac{|P\psi|^2}{C\omega^2|\psi|^2}
  =a^2+\theta_x^2+16w-2\eta d\,aw-\eta d\,w_x\\
 &= (a-\eta d w)^2+H_\eta,\qquad
H_\eta=(\theta_x-\eta d\sin\theta\cos\theta)^2+(16-d^2)w.
\end{aligned}
\]

The reduced constraint is \(\mathbb E a=B\), which is equivalent to the two conditions on \(u\) upon reconstructing it by integration from the left endpoint. The exact action is \(S=2C^2\omega^4\mathbb E q^2\) with radial value \(2C^2\omega^4 B^4=9b^4/8\).

At fixed smooth \(\theta\), the mean of \(r=a-\eta d w\) must equal \(B-\eta d\mu>0\). For \(\ell>0\), each \(x\) determines exactly one positive solution \(r_\ell(x)\) of

\[
r_\ell^3+H_\eta r_\ell=\ell .
\]

The derivative of the left-hand side in \(r_\ell\) is positive at the solution, so \(r_\ell(x)\) is smooth. Its mean is strictly increasing and continuous in \(\ell\). The bound \(r_\ell\le\ell^{1/3}\) gives mean zero in the limit \(\ell\downarrow0\), and the positive root for \(H_\eta=\max_I H_\eta\) is a uniform lower bound tending to infinity as \(\ell\to\infty\). There is consequently one multiplier giving the required mean and one corresponding smooth optimal amplitude. The derivative of \((r^2+H_\eta)^2\) is \(4\ell\) at this \(r_\ell\); its strict convexity on \(\mathbb R\) and the mean constraint prove global optimality and uniqueness for the fixed angle.

## Comparison for the favorable helicity

Take \(\eta=1\) and put \(y=a-B\), \(z=\sin\theta\), \(\widehat w=w-\mu\), \(V=\mathbb E\widehat w^2\). Since \(2dB=17\), the exact density satisfies

\[
 q-B^2=2(B-dw)y+y^2+\theta_x^2-w-d w_x,
 \qquad \mathbb E y=0 .
\]

Use \(L=B^2+5\widehat w=W+5w\) with \(W=B^2-5\mu>0\). The inequality \(q^2\ge 2Lq-L^2\) and the endpoint values \(w(\pm\pi/2)=0\) give

\[
\frac{\mathbb E q^2-B^4}{2}
\ge \mathbb E\bigl[Ly^2+2L(B-dw)y+L(\theta_x^2-w)\bigr]-\frac{25}{2}V .
\]

Indeed \(\mathbb E[Lw_x]=0\), since \(L\) is affine in \(w\). In the term linear in \(y\), subtract \(B^2(B-d\mu)\) from \(L(B-dw)\) using \(\mathbb E y=0\). With \(D=(7/2)B\),

\[
 L(B-dw)-B^2(B-d\mu)=-(D+5dw)\widehat w .
\]

Complete the square in \(y\) pointwise, and use \(z_x^2=(1-w)\theta_x^2\). The result is

\[
\begin{aligned}
\frac{\mathbb E q^2-B^4}{2}
 &\ge W\mathbb E(z_x^2-z^2)
       +(W+5)\mathbb E(w\theta_x^2)-5\mathbb E w^2
       -\mathbb E\bigl[G(w)\widehat w^2\bigr],\\
G(s)&=\frac{25}{2}+\frac{(D+5ds)^2}{W+5s}.
\end{aligned}
\tag{1}
\]

The first term is nonnegative by Dirichlet Poincaré on an interval of length \(\pi\). The remaining terms use both a nonlinear periodic Poincaré estimate and the endpoint value of \(w\).

First, \(w_x^2=4w(1-w)\theta_x^2\) implies \(4w\theta_x^2\ge(1+w)w_x^2\). The function \(w^{3/2}\) belongs to periodic \(H^1\) because its two endpoint values agree. Periodic Poincaré at frequency two gives

\[
 \mathbb E[w w_x^2]=\frac49\mathbb E\bigl[(w^{3/2})_x^2\bigr]
 \ge \frac{16}{9}\operatorname{Var}(w^{3/2}).
\]

For \(s,t\ge0\), the divided difference of \(s^{3/2}\) and \(t^{3/2}\) has squared magnitude at least \(s+t\). This follows from

\[
 (s+t+\sqrt{st})^2-(s+t)(\sqrt{s}+\sqrt{t})^2=st .
\]

Apply this pointwise with two independent copies of \(w\) under the normalized time measure. The identity \(\operatorname{Var}(X)=\mathbb E[(X-X')^2]/2\) then gives

\[
 \operatorname{Var}(w^{3/2})
 \ge \mathbb E[w\widehat w^2]+\mu V .
\]

It follows that

\[
 (W+5)\mathbb E(w\theta_x^2)
 \ge \frac{W+5}{4}\mathbb E w_x^2
     +\frac49(W+5)\bigl(\mathbb E[w\widehat w^2]+\mu V\bigr).
\]

For \(0\le s\le1\), the bounds \(W\ge2281/64>71/2\) and \(D+5d=1391/48<29\) give \(G'(s)\le 2(20/3)29/(71/2)<11\). Also

\[
 G(0)=\frac{99}{4}+\frac{245}{4W}\mu\le \frac{99}{4}+2\mu,
 \qquad
 \frac49(W+5)\ge\frac49 B^2>18.
\]

Use these estimates in (1) and \(\mathbb E w^2=V+\mu^2\) to obtain

\[
\frac{\mathbb E q^2-B^4}{2}
\ge W\mathbb E(z_x^2-z^2)
 +\frac{W+5}{4}\mathbb E w_x^2
 -\left(\frac{119}{4}-16\mu\right)V-5\mu^2 .
\tag{2}
\]

Second, expand \(w\) in its periodic Fourier series on the interval \(I\), with constant term \(\mu\) and real coefficients \(A_n,B_n\) in the basis \(\cos(2n(x+\pi/2)),\sin(2n(x+\pi/2))\). Periodic \(H^1\) regularity gives an absolutely and uniformly convergent series by Cauchy–Schwarz, so the endpoint trace is \(\mu=-\sum_{n\ge1}A_n\). The last three terms in (2) are

\[
 \frac12\sum_{n\ge1}\left[(W+5)n^2-\frac{119}{4}+16\mu\right]\,(A_n^2+B_n^2)-5\mu^2 .
\]

For \(n=1\), the bracket is \(1017/64+11\mu>15\). For \(n\ge2\), it is at least \((B^2-119/16)n^2=(2125/64)n^2>32n^2\). Take \(c_1=15\) and \(c_n=32n^2\) for \(n\ge2\). Weighted Cauchy–Schwarz and the bound \(\sum_{n\ge2}n^{-2}\le1/4+\int_2^\infty x^{-2}\,dx=3/4\) give

\[
 5\mu^2\le
 \frac{173}{192}\left(\frac12\sum_{n\ge1} c_n(A_n^2+B_n^2)\right),
 \qquad
 10\sum_{n\ge1}c_n^{-1}\le 10\left(\frac1{15}+\frac3{128}\right)=\frac{173}{192}.
\tag{3}
\]

Since \(V=\sum_{n\ge1}(A_n^2+B_n^2)/2\), (2)–(3) prove the explicit gap

\[
 \mathbb E q^2-B^4
 \ge 2W\mathbb E(z_x^2-z^2)+\frac{95}{32}\operatorname{Var}(w).
\tag{4}
\]

Equality in the action comparison forces \(\operatorname{Var}(w)=0\). The endpoint trace and continuity give \(w\equiv0\), so \(\theta\) is a constant multiple of \(2\pi\). In that case \(\mathbb E q^2=\mathbb E a^4\ge B^4\), with equality only at \(a=B\) by strict convexity. The amplitude trace then gives \(u=0\).

## Opposite helicity

For \(\eta=-1\), the square decomposition gives \(\mathbb E q\ge (B+d\mu)^2+(16-d^2)\mu\) by Jensen and \(H_-\ge(16-d^2)w\). Hence \(\mathbb E q^2\ge B^4\), with a strict gap if \(\mu>0\). If \(\mu=0\), the preceding constant-angle and strict convexity argument gives the same equality case.

## Numerical checks on the exact amplitude equation

For the favorable helicity, the table uses \(F_n(x)=\sin(n(x+\pi/2))\). At each angle, solve the nested scalar equations \(r^3+H_+r=\ell\) and \(\mathbb E r=B-d\mu\) by positive-root bisection and multiplier bisection. Use normalized Gauss–Legendre quadrature with 64, 128 and 256 nodes on \(I\). The numbers are dimensionless action excesses \(\mathbb E q^2-B^4\), rounded to six places, agreeing across these quadrature orders at that precision.

| Time angle | Optimized excess |
| --- | ---: |
| \(\tfrac12F_1+\tfrac18F_2\) | 2.028650 |
| \(\tfrac54F_1-\tfrac38F_2+\tfrac14F_3\) | 58.688704 |
| \(\tfrac34F_2\) | 69.715141 |
| \(2F_1+\tfrac14F_3\) | 111.493909 |
| \(4F_1-\tfrac3{10}F_2+\tfrac14F_5\) | 787.375321 |

An exploratory 12-mode Dirichlet search with fixed first coefficient between \(0.025\) and \(5\) lowered the numerical costs of the pure first mode upon varying higher modes and retained positive costs at the sampled amplitudes. A preliminary floating-point search with unconstrained first coefficient reported negative excesses of order \(10^{-11}\) close to the radial field, within the sensitivity of that multiplier and quadrature calculation. These calculations are diagnostics. Equations (1)–(4), including the constants checked by exact fraction arithmetic, supply the certificate for every allowed smooth time profile.

The certified class is the circular E15 angular family with its single fixed spatial rotation and time-only log amplitude. Whether the radial field minimizes in the unrestricted admissible class at the crossing remains open in this packet, including for spatially varying amplitude, superposed waves and fields with compatible zeros.
