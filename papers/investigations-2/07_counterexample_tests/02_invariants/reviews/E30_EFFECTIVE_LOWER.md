# WIN-E30 A · Replay of the effective lower bound

28 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded non-author analytical replay, requested GPT-6.2 Sol/ultra, actual serving variant and effort unavailable. Checkout `86b24d9f9c2d`, [replay request](../research-progress/handoffs/REQUEST_B08_FINAL_REPLAY_R1.md) SHA-256 prefix `eff7a7b97d9d`, [lead proof v1](../notes/B08_EFFECTIVE_LOWER.md) SHA-256 `2ea1b468bd4f7a6830327f53b47d63a6445505d89935a2cc946bd9cfac8c5378`.

The replay verifies the lower bound for every smooth generating positive half-spinor quaternionic pencil on the frozen standard oriented Riemannian four-sphere, with the specified volume-centering and coefficient metric. For \(r=R_g(E)^{1/4}\) it gives \(r>2^{-40}a^7\). Thus the centered \(L^2(g)\)-orthonormal infimum obeys \(b(g)\ge 2^{-3664}\) at \(a=2^{-256}\).

## Frame, volume, and derivative comparison

The frozen anisotropy has round eigenvalues \((0,\alpha,-\alpha,0)\), where \(\alpha=\epsilon\chi(s)(y^1)^2\) and \(|\alpha|\le\tau=a^6\). With reciprocal radial variable \(t=\min(s,s^{-1})\), put \(W=(1+\eta(t)t^2)^4\sqrt{1-\alpha^2}\). Then \(dV_g=(W/16)dV_q\). The factor \(W-1\) is supported on two round caps of probability at most \(96a^4\) in total. On those caps \(|W-1|\le32a^2\) by the derivative bound for \((1+x)^4\) on \([0,4a^2]\) and \(1-\sqrt{1-\alpha^2}\le\alpha^2\). Because \(\int f W\,d\nu=0\) for \(\nu=dV_q/V_0\), the round mean \(m_q=\int f\,d\nu\) has norm at most \(3072a^6\), which is enough for the lead bound \(4096a^6\). This uses the actual fixed physical volume form.

Conformal twistor transport preserves \(f\) and \(R_g\) with the same coefficient metric. The differential of the equation \(E_x k(x)=0\) sends the derivative of the kernel line to \(-\nabla s_k\) through evaluation of norm \(m(x)\). Passing to the unit round Hopf target gives length factor \(2\). In \(\gamma\)-orthonormal frames the twistor equation therefore splits \(df=S+N\) orthogonally, with \(S\) a similarity or zero and \(\int |N|_\gamma^4\,dV_\gamma=16r^4\). All nonzero \(S\) have the common Clifford orientation sign \(\sigma\). For \(B=(q^{-1}\gamma)^{1/2}\), \(A=(S+N)B\) is the round-frame matrix. Both \(\|B\|_{\mathrm{op}}\) and \(\|B^{-1}\|_{\mathrm{op}}\) are at most \(2\), and \(\|B-I\|_{\mathrm{op}}\le\tau\).

To check the round energy independently, write \(A=S+L\), \(L=S(B-I)+NB\), \(X=\|A\|_{L^4(\nu)}^2\). The bound \(dV_\gamma\ge(1-\tau)^2dV_q\) gives \(\|L\|_{L^4(\nu)}^2\le4\tau^2 X+24r^2\) by the triangle inequality, \(\|B\|_{\mathrm{op}}\le\sqrt{1+\tau}\), and \(V_0>1\). For \(F(A)=|A|^4-16\sigma\det A\), value and first derivative vanish at \(S\) by the cofactor formula for similarities, also at zero. The second derivatives of the two quartics \(|A|^4\) and \(\det A\) have bounds \(12|A|^2|L|^2\), the latter by the twelve ordered column replacements. Along the segment from \(S\) to \(A\), the norm is at most \((1-\tau)^{-1/2}|A|\). Taylor's factor \(1/2\) therefore gives \(F(A)\le204|A|^2|L|^2\). Using \(\sigma\deg f\le1\) and Cauchy–Schwarz yields
\[
 X^2\le16+816\tau^2 X^2+4896r^2X.
\]
Under \(r\le2^{-40}a^7\) one has \(r^2\le\tau^2\) and \(\tau<10^{-3}\), so \(0.99 X^2\le16+0.01X\) forces \(X<5\). Substitution gives \(e=X^2-16\le25000(\tau^2+r^2)\), with \(e\ge0\) by degree and the singular value bound. This calculation permits vanishing and orientation-reversing derivatives.

## First harmonics and transverse-tracefree pairing

In \(f=m_q+Ax+u\), now with \(A\) the matrix of the first-harmonic projection, put \(d=e/8+4|m_q|^2\). Dirichlet orthogonality and eigenvalues \(4\) then \(10\) give \(\|du\|_2^2\le5d/3\), \(\|u\|_2^2\le d/6\), using \(\|df\|_2^2\le\sqrt{16+e}\le4+e/8\). Also \(\|A\|_{\mathrm{HS}}\le\sqrt5\). The round moment
\[
 \int (x^\top C x)^2\,d\nu
   =\frac{2|C|^2+(\operatorname{tr}C)^2}{35}
\]
for symmetric \(C\), together with \(|Ax|+|f|<4\), gives \(|A^\top A-I|^2\le280(|m_q|^2+d/6)\). For \(O\) from a singular value decomposition of \(A\), \(|A-O|^2\le|A^\top A-I|^2\) follows from \(s+1\ge1\) for each singular value \(s\). Hence \(D=\int|df-d(Ox)|^2d\nu\le39d+224|m_q|^2\le380(e+|m_q|^2)\). Substitution of \(e\le50000a^{12}\) and \(|m_q|^2\le2^{24}a^{12}\) gives \(D\le2^{40}a^{12}\).

For the E25 detector, the diagonal Euclidean Weyl tensor \(C\) has \(C_{2121}=1\), \(C_{3131}=-1\). Its contraction \(T^{\rm flat}_{ij}=C_{ikjl}\partial_{kl}\phi\) is symmetric, tracefree and divergencefree by the curvature symmetries and commuting partial derivatives. The radial bump has radius \(a/3<a/2\). Its radial Hessian term proportional to the flat metric drops out by tracefreeness of \(C\). The other term has norm at most \(4\cdot 4\cdot8=128\) after contraction, since \(|C|=4\) and \(\sup|\beta''|<8\). The conformal weight \(T=\Omega^{-2}T^{\rm flat}\) cancels the \(+2\,d(\log\Omega)\) divergence term for a flat tracefree symmetric two-tensor in dimension four. Its norm decreases since \(\Omega\ge1\) on the support. In the pairing, both inverse \(q\)-metrics cancel the volume factor, and the weights of \(T\) and \(h\) cancel. Twice integrating by parts produces \(4\epsilon\int\phi\,dy\). The bump is at least \((a/3)^2/9\) on the ball of radius \(a/(3\sqrt2)\), giving the lower bound \(\epsilon a^6/34992>2^{-16}a^{10}\) after dividing by \(V_0\).

Write \(v=O^{-1}f-x\) and \(P=f^*q_{\rm tar}\). For \(\beta(Y)=\langle v,dx(Y)\rangle\), the sphere's second fundamental form gives
\[
 P=q+2\operatorname{sym}\nabla\beta+2\langle v,x\rangle q+(dv)^*dv.
\]
Integration against \(T\) kills the first three terms by trace and divergence. The fourth pairs in absolute value to at most \(128D\), since \(|(dv)^*dv|\le|dv|^2\).

## Localized remainder and contradiction

The Gram matrix of \(SB\) is \(u\gamma\) with \(u\ge0\). Thus \(Z=P-u\gamma\) corresponds to \(A^*A-(SB)^*(SB)\) in the round frame used for the spinor split. Hilbert–Schmidt triangle and product bounds give \(|Z|_q\le(|A|+|SB|)|NB|\le10|df|_q|N|_\gamma\). Here \(|S|\le|AB^{-1}|\) by orthogonality, so \(|SB|\le4|A|\). The density \(dV_\gamma/dV_q\ge1/2\) and \(V_0>1\) give \(\|N\|_{L^4(\nu)}\le4r\). In \(U=\{s\le a\}\), \(\nu(U)\le3a^4\) and
\[
 \|df\|_{L^2(U,\nu)}\le2\sqrt3\,a^2+\sqrt D\le5a^2 ,
\]
since \(2^{20}a^6\le a^2\). Hölder with the remaining factor \(\|\mathbf 1_U\|_{L^4(\nu)}\) gives
\[
 Z_U:=\int_U |Z|_q\,d\nu
   \le10(5a^2)(4r)(3a^4)^{1/4}<2^9 a^3r
\]
for \(r>0\), with the non-strict bound at \(r=0\). This accounts for the local factor \(a^3\).

Tracing \(P=u(q+h)+Z\) against \(q\), using \(\operatorname{tr}_q h=0\), \(|\operatorname{tr}_qZ|\le2|Z|\), and \(|d(Ox)|=2\), gives \(\int_U|u-1|\,d\nu\le\sqrt D+D/4+Z_U/2\). Since \(|h|_q\le2\tau\) and \(T\) is supported in \(U\),
\[
 \left|\int\langle T,h\rangle d\nu\right|
 \le128[D+2\tau(\sqrt D+D/4)+(1+\tau)Z_U]
 \le2^{49}a^{12}+2^{17}a^3r.
\]
Indeed \(2^{40}+2^{21}+2^{39}<2^{42}\) bounds the first bracket's coefficient after removing \(a^{12}\), and \(128\cdot 2\cdot2^9=2^{17}\). The hypothesized \(r\le2^{-40}a^7\) bounds the last expression by \((2^{-463}+2^{-23})a^{10}<2^{-16}a^{10}\), contradicting the test. Squaring the strict individual bound and taking the infimum gives the stated non-strict \(2^{-80}a^{14}=2^{-3664}\). The proof applies without Gram normalization for the same parameter metric, so in particular it covers the prescribed orthonormal class. This replay concerns the fixed representative and the value bound.

Supporting inputs, SHA-256 prefixes: [E22](../notes/E22_METRIC_AND_SPECTRUM.md) `4a7a988d5db8`, [E24](../notes/E24_ROUND_HARMONICS.md) `f3d95399b300`, [E25](../notes/E25_TT_DETECTOR.md) `f077061d0ecd`, [E26](../notes/E26_TRANSFER_DEFICIT.md) `31de11b62b9b`, [E27](../notes/E27_STRAIN_TEST.md) `44b14d7c24e6`, and [spinor split](../notes/BALANCED_SPECTRAL_BOUND.md) `8dff6f0d96d7`.
