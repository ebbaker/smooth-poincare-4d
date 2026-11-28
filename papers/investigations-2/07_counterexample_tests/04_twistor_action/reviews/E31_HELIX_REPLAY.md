# SP4-TWA-E31 · Independent replay of the helix comparison

28 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. The request specifies a bounded non-author reviewer configured GPT-6.2 Sol/ultra. Actual serving model and reasoning effort were unavailable. Checkout `7c6bbab9a0a66532d81599b3dd0952f5a371c8d4` and all three frozen SHA-256 digests matched. The reviewer authored neither proof. [Frozen request with input hashes](../research-progress/handoffs/E31_REQUEST_v1.md)

**PASS.** E26's global bound, both helicity cases, equality and fixed-angle amplitude minimization hold as written. E27's two spatial averages, scalar-mean obstruction and comparison in the original action also hold. Strict convexity gives the equality condition in both averages. The same averaging argument applies to either helicity and every time angle in E26, so the radial field uniquely minimizes the action in that single circular angular family even for arbitrary smooth spatial log amplitudes.

## Action and admissible fields

Use the oriented flat Riemannian product \(M=[-1,1]\times(\mathbb R/\mathbb Z)^3\) of volume two, with the periodic spin structure, positive half-spinors and the parallel spinor \(\sigma=1\). Use Clifford action \(c(v)(s_+,s_-)=(vs_-,-\bar v s_+)\) in the oriented quaternionic frame \((1,\mathbf i,\mathbf j,\mathbf k)\), and use the real part of the spinor pairing. Write

\[
\begin{gathered}
C=\tfrac34,\qquad \omega=\tfrac\pi2,\qquad b=\tfrac{51\pi}{16},\qquad
\lambda=\eta\,2\pi,\quad \eta=\pm1,\\
n=\mathbf j\cos(\lambda x_1)+\mathbf k\sin(\lambda x_1),\qquad
g=\cos\theta(t)+\sin\theta(t)n,\qquad \psi=e^{bt+u}g .
\end{gathered}
\]

The angle \(\theta\) is smooth and has endpoint values in \(2\pi\mathbb Z\). The real log amplitude correction \(u\) is smooth, periodic in the torus coordinates and zero over each whole end face. This gives the full traces \(e^{\pm b}\sigma\) and an everywhere nonzero field. Set
\(Q=|P\psi|^2/|\psi|^2\), \(S=J_g^4=\int_M Q^2\) and \(Q_0=Cb^2\), so \(S_{\rm rad}=2Q_0^2\). Friedrich's published §1, p. 59, projection formula and (1.1) were reinspected for the convention \(P_X=\nabla_X+\tfrac14c(X)D\) in dimension four. The orthogonal Clifford projection yields \(|P\psi|^2=|\nabla\psi|^2-|D\psi|^2/4\). [Published Friedrich scan](https://dml.cz/bitstream/handle/10338.dmlcz/701462/WSGP_09-1989-1_7.pdf#page=2) · [Frozen E15 conventions](../notes/E15_HELICAL_COMPETITOR.md)

For \(u=u(t)\) put \(v=b+u'\), \(s=\sin\theta\), \(c_\theta=\cos\theta\) and \(w=s^2\). Since \(\partial_1n=\lambda\mathbf i n\), one has \(e^{-bt-u}D\psi=-(vg+g_t+\lambda sn)\). Its norm squared is \(v^2+\theta'^2+\lambda^2w+2\lambda(vw+\theta'sc_\theta)\). The gradient squared divided by \(|\psi|^2\) is \(v^2+\theta'^2+\lambda^2w\). Hence

\[
Q=C(v^2+\theta'^2+\lambda^2w)-\frac{\lambda}{2}(v w+\theta'sc_\theta).
\tag{R1}
\]

## E26 · Finite-amplitude comparison and endpoint equality

Write \(x=\omega t\), \(B=b/\omega=51/8\), \(d=4/3\), \(a=v/\omega\), \(z=\sin\theta\) and \(q=Q/(C\omega^2)\). In this section \(\mathbb E\) averages over the interval of length \(\pi\) in \(x\). Set \(\mu=\mathbb E w\). Equation (R1) gives

\[
q=(a-\eta d w)^2+H_\eta,\qquad
H_\eta=(\theta_x-\eta d s c_\theta)^2+(16-d^2) w.
\]

The constraint is \(\mathbb E a=B\), and \(S=2C^2\omega^4\mathbb E q^2\). For fixed angle the variable \(r=a-\eta d w\) has prescribed positive mean \(B-\eta d\mu\), since \(0\le w\le1\) and \(B>d\). For each \(\ell>0\) the equation \(r^3+H_\eta r=\ell\) has a unique positive solution \(r(x)\), smooth by \(3r^2+H_\eta>0\). Its mean is continuous and strictly increasing with \(\ell\). The upper bound \(r\le \ell^{1/3}\) gives zero mean in the limit at zero, and comparison with the root for \(\max H_\eta\) gives an unbounded mean at infinity. There is exactly one multiplier for the specified mean. The derivative of \((r^2+H_\eta)^2\) is constant along its solution. Strict convexity and the tangent inequality give the unique minimizer over all smooth real \(r\) at fixed mean. Strict convexity includes \(H_\eta=0\), where the function is \(r^4\). Integrating \(v-b\) from the left end reconstructs the unique smooth amplitude.

For \(\eta=-1\), \(\mathbb E q\ge (B+d\mu)^2+(16-d^2)\mu\). This is larger than \(B^2\) whenever \(\mu>0\), and \(\mathbb E q^2\ge(\mathbb E q)^2\). For \(\eta=1\) set \(y=a-B\), \(\widehat w=w-\mu\), \(V_w=\mathbb E\widehat w^2\), \(W=B^2-5\mu\), and \(L=W+5w\). Since \(2dB=17\),

\[
q-B^2=y^2+2(B-dw)y+\theta_x^2-w-dw_x .
\]

The identity \((q-L)^2\ge0\) and \(\mathbb E Lw_x=0\) give a lower bound on \((\mathbb E q^2-B^4)/2\) by the average of \(L(y^2+2(B-dw)y+\theta_x^2-w)\) minus \(25V_w/2\). The term with \(w_x\) vanishes because \(L\) is affine in \(w\) and both endpoint values of \(w\) are zero. The linear coefficient in \(y\) may be shifted by a constant because \(\mathbb E y=0\). With \(D_0=7B/2\), the shifted coefficient before the factor of two is

\[
L(B-dw)-B^2(B-d\mu)=-(D_0+5dw)\widehat w .
\]

Completing the \(y\) square pointwise, and using \(z_x^2=(1-w)\theta_x^2\), gives

\[
\begin{aligned}
\frac{\mathbb E q^2-B^4}{2}
&\ge W\mathbb E(z_x^2-z^2)+(W+5)\mathbb E(w\theta_x^2)-5\mathbb E w^2
-\mathbb E[G(w)\widehat w^2],\\
G(s)&=\frac{25}{2}+\frac{(D_0+5ds)^2}{W+5s}.
\end{aligned}
\tag{R2}
\]

The first Dirichlet frequency for \(z\) is one. For \(w^{3/2}\), the matching endpoint traces give a periodic \(H^1\) function whose first positive frequency is two. The chain rule and \(4w\theta_x^2\ge(1+w)w_x^2\) give

\[
\begin{aligned}
\mathbb E(w w_x^2)
&\ge \tfrac{16}{9}\operatorname{Var}(w^{3/2}),\\
\operatorname{Var}(w^{3/2})
&\ge \tfrac12\,\mathbb E_{s,t}\big[(s+t)(s-t)^2\big]
=\mathbb E[w\widehat w^2]+\mu V_w .
\end{aligned}
\]

In the second line \(s,t\) are independent copies of \(w\). The divided-difference square between \(s^{3/2}\) and \(t^{3/2}\) is at least \(s+t\), since \((s+t+\sqrt{st})^2-(s+t)(\sqrt{s}+\sqrt{t})^2=st\). The coincident zero case follows directly in the difference inequality. The resulting contribution from \((W+5)\mathbb E(w\theta_x^2)\) in (R2) is at least \((W+5)\mathbb E w_x^2/4+\frac49(W+5)(\mathbb E[w\widehat w^2]+\mu V_w)\).

The coefficient bounds are \(W\ge2281/64\), \(D_0+5d=1391/48\) and \(G'(s)\le2320/213<11\) for \(s\in[0,1]\). Also \(G(0)=99/4+245\mu/(4W)\le99/4+2\mu\), while \(\frac49(W+5)\ge289/16>18\). Absorb the resulting \(w\widehat w^2\) term and use \(\mathbb E w^2=V_w+\mu^2\) to obtain

\[
\frac{\mathbb E q^2-B^4}{2}
\ge W\mathbb E(z_x^2-z^2)
+\frac{W+5}{4}\mathbb E w_x^2
-\left(\frac{119}{4}-16\mu\right)V_w-5\mu^2.
\tag{R3}
\]

Use the periodic Fourier series of \(w\) with origin at the left endpoint and cosine and sine coefficients \(\alpha_n,\beta_n\) at frequency \(2n\). The periodic \(H^1\) coefficient bound and Cauchy–Schwarz give absolute, uniform convergence, so the actual zero trace gives \(\mu=-\sum_{n\ge1}\alpha_n\). Parseval gives frequency weights \((W+5)n^2-119/4+16\mu\) on \((\alpha_n^2+\beta_n^2)/2\) in (R3). At \(n=1\) this is \(1017/64+11\mu>15\). At \(n\ge2\) it is at least \((2125/64)n^2>32n^2\), since \(W+5\ge B^2\). Set \(c_1=15\) and \(c_n=32n^2\) for \(n\ge2\). The endpoint cost obeys

\[
5\mu^2\le
\left(10\sum_{n\ge1}c_n^{-1}\right)
\frac12\sum_{n\ge1}c_n(\alpha_n^2+\beta_n^2),\qquad
10\sum_{n\ge1}c_n^{-1}\le10\left(\frac1{15}+\frac3{128}\right)=\frac{173}{192}.
\]

The bound \(3/4\) on \(\sum_{n\ge2} n^{-2}\) follows from the \(n=2\) term and the integral from 2. At least \(19/192\) of the weighted sum survives the endpoint cost, giving

\[
\mathbb E q^2-B^4\ge 2W\mathbb E(z_x^2-z^2)+\frac{95}{32}V_w.
\tag{R4}
\]

Both terms are nonnegative. Equality implies \(V_w=0\) for the favorable helicity or \(\mu=0\) for the opposite one. Continuity and the zero endpoint trace of \(w\) then force \(w\equiv0\). The angle is constant because it takes values in the discrete set \(\pi\mathbb Z\), and its prescribed end values make it an even multiple of \(\pi\). The action then reduces to the average of \(a^4\). Strict convexity gives \(a=B\) for equality, and the zero-end amplitude is \(u=0\).

All rational budgets above were checked with exact fractions. The five numerical diagnostics in E26 were also reproduced to six decimal places at 64, 128 and 256 Gauss–Legendre nodes, using Newton iteration for the positive cubic root at each node and bisection for the multiplier. The last angle is \(4F_1-\frac3{10}F_2+\frac14F_5\), giving \(787.375321\). The proof uses (R2)–(R4) and the opposite-helicity Jensen bound. [Frozen E26](../notes/E26_FINITE_HELIX.md)

## E27 · Spatial averages, scalar defect and quartic action

For spatially varying \(u\), put \(a=b\,dt+du\) in this section and set \(K_i=\sum_{j\ne i}(g,c_i c_j\partial_jg)_{\mathbb R}\). The mixed term in \(|Dg+c(a)g|^2\) is \(-2a\cdot K\), using skew adjointness of \(c_i\) and \((g,\partial_i g)_{\mathbb R}=0\). The exact density as a function of the four components is

\[
Q(t,x_1;a)=C|a|^2+\tfrac12 a\cdot K+Q_g,\qquad Q_g=|Pg|^2.
\tag{R5}
\]

Here \(K_0=-\lambda w\) and \(K_1=0\). Indeed \(c_0c_1=\mathbf i\) on positive spinors and \(c_1c_0=-\mathbf i\), while \(g,g_t\in\operatorname{span}_{\mathbb R}\{1,n\}\) and multiplication by \(\mathbf i\) maps this real plane to its orthogonal complement. \(K_2,K_3\) depend only on \(t,x_1\), and \(Q_g=C(\theta'^2+\lambda^2w)-\lambda\theta'sc_\theta/2\) depends only on \(t\) by (R1).

At fixed base point (R5) is nonnegative for all real \(a\) by the Clifford projection and strictly convex with Hessian \(2CI\). Its square is strictly convex as the square function is strictly increasing and convex on nonnegative inputs. Averaging \(u\) over \(x_2,x_3\) at fixed \(t,x_1\) gives the average \(a\) in (R5), with zero components in those two directions by periodicity. The coefficients in (R5) are independent of those variables, so Jensen lowers the action. Equality implies \(a\) is constant on the averaging torus for almost every fixed \(t,x_1\). The averaged \(a_2,a_3\) are zero and smoothness gives \(\partial_2 u=\partial_3 u=0\) everywhere. With those components gone and \(K_1=0\), the remaining density has the form \(Q(t,b+\partial_t u)+C(\partial_1u)^2\) with all coefficients depending only on \(t\). Averaging \(u\) over \(x_1\) lowers the action by the same argument, with equality only for \(\partial_1u=0\). Both averages preserve the zero trace of \(u\) at each end. This proves the Jensen reduction and its equality condition for each fixed angular profile in E26 and E27.

For the mean calculation, use the favorable helicity, \(F=\cos(\omega t)\) and \(\theta=\epsilon F\). Let \(\overline f=\frac12\int_M f\), \(\Delta=\int_M Q-2Q_0\) and \(V(Q)=\int_M(Q-\overline Q)^2\). Direct integration of (R5) gives

\[
\begin{aligned}
p&=-\lambda(w-\overline w)\,dt,\\
\Delta&=C\|du+p/(4C)\|_2^2+
C\omega^2\left(\epsilon^2-\int_{-1}^1 w\,dt\right)-\frac{\|p\|_2^2}{12}.
\end{aligned}
\tag{R6}
\]

Indeed the pairing of \(K_2,K_3\) with the corresponding derivatives integrates to zero on their periodic axes, \(K_1=0\), and the constant time component pairs to zero with \(du\) by the endpoint condition. The remaining current is the derivative of a time primitive with zero end values. This identifies \(p\) as the zero-end gradient projection and gives the unique scalar-mean minimizing \(u_{\rm m}'=\lambda(w-\overline w)/3\). For the angle term, integrate the \(\theta'sc_\theta\) derivative in \(Q_g\), use \(C\lambda^2-b\lambda/2=-C\omega^2\), and use \(\int_{-1}^1(F')^2=\omega^2\).

The integrated angular contribution in (R6) is \(3\omega^2\epsilon^4/16+O(\epsilon^6)\), and the subtracted projection penalty is \(\omega^2\epsilon^4/3+O(\epsilon^6)\), using \(\int F^4=3/4\) and \(\int(F^2-1/2)^2=1/4\). Thus \(\Delta_{\rm m}=-(7/48)\omega^2\epsilon^4+O(\epsilon^6)\). For \(0<|\epsilon|\le1/2\), \(\sin^2 y\ge y^2-y^4/3\) on the range of \(\epsilon F\). Also \(X\mapsto\sin^2(\epsilon\sqrt X)\) on \([0,1]\) has derivative bounded below by \(\epsilon^2(1-2\epsilon^2/3)\). The two-copy variance formula therefore bounds \(\int(w-\overline w)^2\) below by \(\epsilon^4(1-2\epsilon^2/3)^2/4\). Substitution gives \(\Delta_{\rm m}\le-(19/432)\omega^2\epsilon^4<0\).

The constant-\(Q\) test holds for sufficiently small \(|\epsilon|\). At fixed angle write (R1) as \(Q=C(v-\lambda w/3)^2+L_\epsilon(t)\), with \(L_\epsilon(t)\) the smooth remainder independent of \(v\). Solve \(\int v=2b\) using \(v=\lambda w/3+\sqrt{(\kappa-L_\epsilon)/C}\) near \((\epsilon,\kappa)=(0,Q_0)\). The radicand is uniformly positive and the derivative of the integral in \(\kappa\) is \(1/(Cb)>0\) at that point. For small nonzero \(\epsilon\), \(p\ne0\) and the deficit after scalar-mean minimization is strictly negative even though this alternative amplitude has \(V(Q)=0\). Hence neither the positive projection penalty nor the positive size of that minimized scalar defect admits a finite bound by a constant times \(V(Q)\) on this class.

Finally \(S-S_{\rm rad}=2Q_0\Delta+\Delta^2/2+V(Q)\). To recompute its quartic term put \(c_2=\cos(2\omega t)\), \(s_2=\sin(2\omega t)\) and \(u'=\epsilon^2(\lambda c_2/6+\delta)+O(\epsilon^4)\) with \(\int\delta=0\) and exact end data. From (R1) the order-two coefficient in \(Q-Q_0\) is \(h+2Cb\delta\), where \(h=\omega^2(45c_2/8+s_2)\) and \(\int h=0\). Equation (R6) gives quartic coefficient \(-7\omega^2/48+C\|\delta\|_2^2\) for \(\Delta\). The variance contributes \(\|h+2Cb\delta\|_2^2\). Since \(\|h\|_2^2=2089\omega^4/64\), the relaxed action quartic is

\[
-2Q_0\tfrac7{48}\omega^2+\tfrac13\|h\|_2^2
=\tfrac{12227}{6144}\omega^4,
\qquad \delta=-h/(3Cb).
\]

This is the coefficient of the exact optimum. The fixed-angle multiplier equation \(\partial_v Q^2=\text{constant}\) and the constraint \(\int v=2b\) have smooth even solutions in \(\epsilon\) near zero by the implicit function theorem. At \(v=b,\epsilon=0\) the pointwise derivative \(\partial_v^2Q^2=12C^2b^2\) is uniformly positive, as is the derivative of the integral of the pointwise inverse in the multiplier. Expanding \((v-\lambda w/3)Q\), which is constant along the minimizing solution, gives \(3Cb^2\delta+bh=\text{constant}\) at order two after dropping a constant term. The zero means fix \(\delta=-h/(3Cb)\), and strict convexity makes the local branch the global amplitude optimizer at fixed angle. Together with the Jensen averages this gives the claimed positive quartic and \(O(\epsilon^6)\) remainder in the amplitude-minimized original action. The quartic variance at this optimum is \(2089\omega^4/576\). With the scalar-mean optimizer, the quartic variance and action excess are \(2089\omega^4/64\) and \(48641\omega^4/2048\). On the constant-\(Q\) branch the quartic mean excess is \(15217\omega^2/124848\). [Frozen E27](../notes/E27_POLAR_DEFECT.md)

The replay concerns the smooth, zero-free, single circular angular family with the specified positive slope and full end traces. The finite scalar obstruction is for \(0<|\epsilon|\le1/2\), while the constant-density branch and the relaxed quartic expansion are local in \(\epsilon\). The finite-amplitude estimate has the stated Dirichlet and periodic intervals and requires both end values of \(w\) to vanish. The unrestricted action comparison for general angular fields, including configurations with zeros, remains open.
