# SP4-CUT-SEAM-E07A · Independent trial-cap readback

27 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Requested GPT-6.2 Sol/ultra. Actual serving model and effort unavailable. Frozen [E07 r1](../research-progress/handoffs/E07_REQUEST_R1.md). At HEAD bc2c1bbccc1d, read [E02 cap](../notes/E02_CAP.md), SHA-256 52436a3020141a3e787eaf426e29a8ee6a8d0ffef6e1d5221376af6f7bbc36a5, [E02 r1](../research-progress/handoffs/E02_REQUEST_R1.md), and the [B01 choice](../brainstorm/notes/B02_B01_BOUNDARY_CHOICES_20261127.md). This is an independent analytic replay within the collaboration.

The trial result checks. For either signed extension, its stated norm \(D_\sigma\le1/100\) gives \(R\ge8\) and the half-sum energy bound \(3750\pi^2D_\sigma^2\). The quadratic coefficient is the full covariant Weyl linearization squared, integrated with the round metric and divided by eight. The fixed norm can be checked directly or bounded by the angular data as below.

## Cutoff and matching

The explicit \(\chi\) has no vanishing denominator, is smooth with flat transitions at \(s=1/4,1/2\), and is identically one near the equator. In the transition write \(x=8(s-3/8)\), \(y=x/(1-x^2)\), \(r=(1-x^2)^{-1}\) and \(L=16y\). Then \(\chi=(1+e^L)^{-1}\) and \(r^2-r=y^2\), so \(r\le1+y^2\). Differentiation gives
\[
 \begin{split}
 L'&=128(r+2y^2),\\
 L''&=2048x(3+x^2)r^3,\\
 \chi'&=-\tfrac14 \operatorname{sech}^2(8y)L',\\
 \chi''&=\tfrac14\operatorname{sech}^2(8y)\left((1-2\chi)(L')^2-L''\right).
 \end{split}
\]
For the first derivative, \(r+2y^2\le1+3y^2\le\cosh^2(8y)\), and equality holds at \(s=3/8\). Thus \(\|\chi'\|_\infty=32\). In the second derivative the term with \((L')^2\) has absolute value at most \(4096\), using \(1+3y^2\le\cosh(8y)\). The term with \(L''\) has absolute value at most \(256\), using \(|L''|\le8192|y|(1+y^2)^2\), \(8|y|\le\cosh(8y)\), and \((1+y^2)^2\le\cosh(8y)\). Hence \(\|\chi''\|_\infty\le4352\).

For an explicit angular-only certificate, let \(N=\max_{j\le2}\sup_{S^3}(|\nabla_\gamma^j a|_\gamma+|\nabla_\gamma^j b|_\gamma)\). In the auxiliary product metric \(\bar g=ds^2+\gamma\), the cutoff bounds give \(|q_\sigma|\le N\), \(|\bar\nabla q_\sigma|\le35N\), and \(|\bar\nabla^2q_\sigma|\le4549N\). The second bound sums \(\|\chi'\|_\infty+2\) for the radial derivative and \(1\) for angular derivatives. The third sums \(\|\chi''\|_\infty+4\|\chi'\|_\infty\) for two radial derivatives, \(2(\|\chi'\|_\infty+2)\) for the mixed directions, and \(1\) for angular directions. On this support \(f=\cos s\ge1/2\) and the connection difference \(S=\nabla_0-\bar\nabla\) has \(|S|_{\bar g}\le6\), \(|\bar\nabla S|_{\bar g}\le10\). Its three nonzero types have coefficients \(-ff'\), \(f'/f\), \(f'/f\) on three angular basis vectors. The corresponding radial derivatives have absolute values at most \(1,4,4\). Acting on a covariant rank-\(j\) tensor costs at most \(j|S|\) times its norm. It follows that
\[
 |\nabla_0q|_{\bar g}\le|\bar\nabla q|_{\bar g}+12|q|_{\bar g},\qquad
 |\nabla_0^2q|_{\bar g}\le|\bar\nabla^2q|_{\bar g}+30|\bar\nabla q|_{\bar g}+236|q|_{\bar g}.
\]
The rank-\(j\) covariant norm changes by at most \(2^j\) from \(\bar g\) to \(g_0\). Thus \(D\le16(4549+30\cdot35+236)N=93{,}360N\). These constants are sufficient and deliberately loose. The stated result in \(D_\sigma\) needs no conversion.

The boundary angular tensor is \(h=\gamma+a\), and its inward half-normal derivative is \(\sigma b\) since \((\cos^2 s)'=0\) there. With positive forward signed distance, retaining \(t\le0\) and adjoining the cap on \(t\ge0\) requires \(\sigma=+1\). Retaining \(t\ge0\) and adjoining the cap on \(t\le0\) requires \(\sigma=-1\). The outward cap normal is \(-\partial_s\). Trace-freeness in \(h\) gives zero trace in each sign. The support ends before the pole, so the cap remains smooth there.

## Curvature and constants

With \(d=D_\sigma\le1/2\), eigenvalues of \(g\) relative to \(g_0\) are in \([1/2,3/2]\). The formula for the connection difference gives \(3d\), from three permutations with the factor \(\|g^{-1}\|_{\rm op}/2\). Differentiating gives \(3d+6d^2\), from the bound \(4d\) on \(\nabla_0g^{-1}\). The two alternating connection derivative terms and two quadratic terms then give \(6d+30d^2\le21d\). For each metric-dependent constant-curvature term the original norm uses \(|\operatorname{Id}|_0=2\), so subtraction of \(K_g\) costs at most \(4d\). The change in the \((1,3)\)-tensor norm is bounded by \(\sqrt{(3/2)2^3}\le4\). This gives \(|C_g|_g\le100d\). The scalar contraction is \(\sum_{ij}C_{ijij}\) in the convention with \(R(g_0)=12\). Its absolute value is at most \(4|C_g|_g\). All constants therefore place \(R(g)\ge8\) at \(d\le1/100\).

The subtraction in \(\Pi_g\) is orthogonal to every algebraic trace-free curvature tensor because every term in \(P\owedge g\) contains a metric contraction. Its Ricci contraction is \(2P+(\operatorname{tr}_g P)g\), giving exactly the coefficient and scalar subtraction in the trial formula. With the usual unit two-form basis, the sum over ordered covariant index pairs counts each endomorphism entry four times. The energy being a half-sum of the two chiral squared norms, \(e_{\mathrm{cap}}=\int|\Pi_g C_g|^2_g\,dV_g/8\). The reference hemisphere volume is \(4\pi^2/3\). The volume density ratio is at most \((3/2)^2\), so the bound is \(100^2(3\pi^2)/8=3750\pi^2\).

I independently inspected Atiyah–Hitchin–Singer §1, printed p. 427, Eq. (1.1) and the following decomposition, in [the local PDF](../../../../../references/Atiyah.pdf), PDF p. 4. The inspected copy has 11,176,148 bytes and SHA-256 a4d55168994f0581232305d17397b8a69b5cf5a28b20a8dc8677a04e18394ee6. In the oriented positive-definite four-dimensional convention, \(W^+\) and \(W^-\) are the trace-free diagonal components in the Hodge splitting. [Published source](https://doi.org/10.1098/rspa.1978.0143)

## Taylor coefficient and scope

In the convention of the note, differentiating \(g((R^g-K_g)(X,Y)U,Z)\) kills the variation of the lowering metric at \(g_0\). Differentiating \(-K_g\) gives exactly \(-q(Y,U)g_0(X,Z)+q(X,U)g_0(Y,Z)\). Differentiating \(R^g\) gives the alternating first derivative of the linear connection variation. Since the residual vanishes at \(g_0\), differentiating the projection also contributes zero. In particular the Weyl derivative of the trial is \(U_a+\sigma V_b\), so the signed mixed term in the squared norm is \(2\sigma\langle U_a,V_b\rangle\). All inverse, curvature and projection coefficients are smooth in the metric and its first two jets in the indicated uniform positive-definite neighborhood. The quadratic remainder in the Weyl tensor, paired with the linear term, gives \(O(D_\sigma^3)\) in the energy. The round norm and volume errors give the same order. This also checks the second derivative \(2Q_\sigma\) along a \(C^2\)-norm smooth data curve. At the chiral level, differentiation of the Hodge projections multiplies zero base Weyl and hence does not change either quadratic coefficient.

The verified bound is an upper bound for this marked trial extension. For example, a constant scalar multiple of \(\gamma\) with \(b=0\) keeps the whole cap a round-fibre warped product and has vanishing Weyl tensor, so even the trial quadratic form has a kernel in the unrestricted data space. The review leaves the positivity of each joined class and the energy of any optimized filling to their own hypotheses.
