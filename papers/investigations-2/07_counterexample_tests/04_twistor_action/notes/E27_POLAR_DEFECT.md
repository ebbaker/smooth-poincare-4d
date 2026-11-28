# SP4-TWA-E27 · Polar mean and variance on the critical helix

28 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Author-selected lead GPT-6.2 Astra/ultra, configured bounded helper GPT-6.2 Sol/ultra. Actual serving model and effort unavailable. Checkout `7c6bbab9a0a66532d81599b3dd0952f5a371c8d4`. All four SHA-256 digests in the [frozen request v1](../research-progress/handoffs/E27_REQUEST_v1.md) matched.

At the crossing, an explicit smooth zero-free helix with relaxed log amplitude gives \(\int Q<2Q_0\), where \(Q_0=3b^2/4\) is the radial value. On the same angular profile another log amplitude makes \(Q\) constant while the gradient projection penalty remains positive. The fourth-order action comparison, with the log amplitude optimized, is strictly positive.

## Exact zero-end projection

Use the oriented flat Riemannian cylinder \(M=[-1,1]\times(\mathbb R/\mathbb Z)^3\), the periodic spin structure and positive half-spinors. In the quaternionic convention \(v\cdot(s_+,s_-)=(vs_-,-\bar v s_+)\), take the parallel unit spinor \(\sigma=1\). In the oriented frame \((1,\mathbf i,\mathbf j,\mathbf k)\), positive chirality is where the self-dual two-forms act. Set \(C=3/4\), \(\omega=\pi/2\), \(\lambda=2\pi=4\omega\), and \(b=51\pi/16=(51/8)\omega\). Write \(\psi=e^{bt+u}g\) with \(u=0\) and \(g=\sigma\) on both faces. Put \(Q=|P\psi|^2/|\psi|^2\), \(Q_0=Cb^2\), \(\overline f=\frac12\int_M f\) and \(V(Q)=\|Q-\overline Q\|_2^2\), the integrated squared deviation. The action is \(S=J_g^4=\int_M Q^2\), with \(S_{\mathrm{rad}}=2Q_0^2=9b^4/8\). [Frozen geometry and action](../continuation-notes/CLOSING_B08_SLOPE_20261128.md) · [Quaternionic convention](E15_HELICAL_COMPETITOR.md) · [Friedrich, published §1 and (1.1)](https://dml.cz/bitstream/handle/10338.dmlcz/701462/WSGP_09-1989-1_7.pdf#page=2)

The polar current is \(K_i=\sum_{j\ne i}(g,c_i c_j\partial_jg)_{\mathbb R}\). Let \(p\) be its orthogonal \(L^2\) projection onto \(dH^1_0(M)\), with zero traces on both ends and torus periodicity. This range is closed by the zero-end Poincaré inequality. Define the excess \(\Delta=\int_M Q-2Q_0\). The exact polar identity and its gradient square are

\[
\begin{aligned}
\Delta&=C\|du\|_2^2+C\|dg\|_2^2+\tfrac12\langle du,K\rangle+\tfrac b2\int_M K_0\\
&=C\|du+p/(4C)\|_2^2+A_g-\tfrac1{16C}\|p\|_2^2,\qquad
A_g=C\|dg\|_2^2+\tfrac b2\int_M K_0.
\end{aligned}
\tag{1}
\]

Here the integration identity uses \(\|Dg\|_2^2=\|dg\|_2^2\) for \(g-\sigma\) of zero end traces, while the cross term uses \(\langle du,p\rangle=\langle du,K\rangle\). E17 also justifies the polar identity through the admitted transverse zeros. The fields computed below are smooth and zero-free. [E17 polar identity](E17_POLAR_LOWER_BOUND.md) · [B08 use of cancellation away from the crossing](B08_STRICT_GLOBAL_EXTENSION.md)

Set \(F(t)=\cos(\omega t)\), \(\theta=\epsilon F\), \(n(x^1)=\mathbf j\cos(\lambda x^1)+\mathbf k\sin(\lambda x^1)\), and \(g=\cos\theta+\sin\theta\,n\). Put \(s=\sin\theta\), \(c_\theta=\cos\theta\). On positive spinors \(c_0c_1=\mathbf i\) by left multiplication and \(\partial_1g=\lambda s\mathbf i n\). Hence \(K_0=-\lambda s^2\). Also \(K_1=(g,-\mathbf i\,\partial_tg)_{\mathbb R}=0\) because \(g,\partial_t g\in\operatorname{span}_{\mathbb R}\{1,n\}\), perpendicular to \(\operatorname{span}_{\mathbb R}\{\mathbf i,\mathbf i n\}\). The remaining components depend only on \(t,x^1\). They pair to zero with any zero-end periodic gradient by integration in \(x^2,x^3\). The constant part of \(K_0\,dt\) pairs to zero by the two end traces. The difference \((K_0-\overline{K_0})\,dt\) is the gradient of its time primitive of zero end traces. Consequently

\[
p=-\lambda(s^2-\overline{s^2})\,dt,\qquad
u_{\rm m}'=\tfrac{\lambda}{3}(s^2-\overline{s^2}),\qquad u_{\rm m}(-1)=0 .
\tag{2}
\]

The last formula gives the unique amplitude minimizing \(\int Q\) for this \(g\) over all zero-end amplitudes, including those depending on \(x\).

## A strict scalar obstruction and an exact zero-variance test

Since \(C\lambda^2-b\lambda/2=-C\omega^2\) and \(\int_{-1}^1(F')^2=\omega^2\), (1) gives the exact minimum mean excess

\[
\Delta_{\rm m}=C\omega^2\left(\epsilon^2-\int_{-1}^1 s^2\,dt\right)
-\frac{\lambda^2}{12}\int_{-1}^1(s^2-\overline{s^2})^2\,dt.
\tag{3}
\]

Using \(\int F^2=1\), \(\int F^4=3/4\), \(\int(F^2-1/2)^2=1/4\), its expansion is

\[
A_g=\tfrac{3}{16}\omega^2\epsilon^4+O(\epsilon^6),\quad
\frac{\|p\|_2^2}{12}=\tfrac13\omega^2\epsilon^4+O(\epsilon^6),\quad
\Delta_{\rm m}=-\tfrac7{48}\omega^2\epsilon^4+O(\epsilon^6).
\]

One explicit negative range follows without a remainder estimate. For \(0<|\epsilon|\le1/2\), use \(\sin^2 y\ge y^2-y^4/3\) for \(|y|\le1/2\), and set \(H(X)=\sin^2(\epsilon\sqrt X)\) on \([0,1]\). Then \(H'(X)=\epsilon^2\operatorname{sinc}(2\epsilon\sqrt X)\ge\epsilon^2(1-2\epsilon^2/3)\). The double-integral formula for the variance of \(H(F^2)\) bounds it below by \(\epsilon^4(1-2\epsilon^2/3)^2\int(F^2-1/2)^2\). In (3) this gives

\[
\Delta_{\rm m}\le\omega^2\epsilon^4\Big(\tfrac3{16}-\tfrac13(1-2\epsilon^2/3)^2\Big)
\le-\tfrac{19}{432}\omega^2\epsilon^4 .
\tag{4}
\]

For a time-only amplitude put \(v=b+u'\). The exact density from the Clifford action is

\[
Q=C\big(v^2+(\theta')^2+\lambda^2 s^2\big)-\tfrac{\lambda}{2}\big(vs^2+\theta'sc_\theta\big)
=C(v-\lambda s^2/3)^2+L_\epsilon(t),
\]

where \(L_\epsilon=C((\theta')^2+\lambda^2s^2)-\lambda\theta'sc_\theta/2-\lambda^2s^4/12\). There is a smooth time-only solution with \(Q\equiv\kappa\) for small \(|\epsilon|\). Indeed take \(v=\lambda s^2/3+\sqrt{(\kappa-L_\epsilon)/C}\) and solve \(\int_{-1}^1 v\,dt=2b\) near \((\epsilon,\kappa)=(0,Q_0)\). The derivative of the integral with respect to \(\kappa\) there is \(1/(Cb)>0\). The positive radicand is uniform on the compact interval near this point. The resulting amplitude \(u\) has both prescribed end values. For every sufficiently small nonzero \(\epsilon\), (2) has \(p\ne0\) and (4) gives \(\|p\|_2^2/12-A_g>0\), while \(V(Q)=0\) for this choice of \(u\). Thus neither the raw projection penalty nor the remaining negative scalar defect after minimizing over amplitudes can be universally bounded above by any finite constant times \(V(Q)\). The zero-variance amplitude pays the square in (1).

## Quartic variance and the full action

Let \(u'=\epsilon^2 z\) with \(\int z=0\), and write \(c_2(t)=\cos(2\omega t)\), \(s_2(t)=\sin(2\omega t)\). Their squared \(L^2[-1,1]\) norms are one and they are orthogonal. At order \(\epsilon^2\), the mean of \(Q-Q_0\) vanishes and its coefficient is

\[
q+2Cbz,
\qquad q=C((F')^2-\omega^2F^2)-\tfrac\lambda2FF'
=\omega^2(-\tfrac34 c_2+s_2).
\]

With \(z_{\rm m}=\frac\lambda6 c_2\), \(d=z-z_{\rm m}\), \(h=q+2Cbz_{\rm m}=\omega^2(\frac{45}8 c_2+s_2)\), the exact quartic coefficients in (1) and in the variance are

\[
\begin{aligned}
\Delta&=\epsilon^4\big(-\tfrac7{48}\omega^2+C\|d\|_2^2\big)+O(\epsilon^6),\\
V(Q)&=\epsilon^4\|h+2Cb d\|_2^2+O(\epsilon^6),\qquad
\|h\|_2^2=\tfrac{2089}{64}\omega^4 .
\end{aligned}
\tag{5}
\]

The same coefficients hold for \(u'=\epsilon^2 z+O(\epsilon^4)\) uniformly with exact end traces, as follows directly from the shifted square in (1) and the order-two coefficient of \(Q\). In particular, the exact minimum-mean amplitude (2) has quartic variance \(2089\omega^4/64\) and quartic action excess \(48641\omega^4/2048\). The exact constant-\(Q\) amplitude has \(d=-h/(2Cb)\) at order two, so its quartic mean excess is \(15217\omega^2/124848>0\).

For every amplitude, \(S-S_{\mathrm{rad}}=2Q_0\Delta+\Delta^2/2+V(Q)\). Its quartic coefficient in (5) is

\[
 -2Q_0\tfrac7{48}\omega^2+2C^2b^2\|d\|_2^2+\|h+2Cb d\|_2^2.
\]

Completing the square gives the minimum at \(d=-h/(3Cb)\), with quartic variance \(2089\omega^4/576\). The minimum action coefficient is

\[
-2Q_0\tfrac7{48}\omega^2+\tfrac13\|h\|_2^2
=\tfrac{12227}{6144}\omega^4>0.
\tag{6}
\]

The lower bound applies locally in \(\epsilon\) even with unrestricted smooth amplitudes for this fixed angular profile. For fixed \(g\) and \(a=b\,dt+du\), \(Q\) is a nonnegative quadratic in \(a\) with Hessian \(2C I\), so \(Q^2\) is convex in \(a\). First average any amplitude over \(x^2,x^3\) at each \(t,x^1\). The density before substitution depends on the base point only through \(t,x^1\), so Jensen lowers the action. The two averaged gradient components in those directions are zero by periodicity. For the resulting field \(Q=Q(t,v)+C(\partial_1u)^2\), since \(K_1=0\) and the remaining coefficients of the restricted density depend only on \(t\). Another Jensen average, over \(x^1\), lowers the action to that of a time-only amplitude. The exact time-only minimizer solves \(\partial_v Q^2=\mu\) with \(\int v=2b\). At \(\epsilon=0,v=b\), the derivative \(\partial_v^2 Q^2=12C^2b^2>0\) permits uniform pointwise inversion near \(v=b\). The integral of the inverse has positive derivative in \(\mu\), which fixes a smooth multiplier for small \(|\epsilon|\). Strict convexity in \(v\) gives global minimization at that solution for the fixed profile. The solution is even in \(\epsilon\). Expanding its multiplier equation at order two selects the minimizing \(d\) in (6), since that equation at this order is the constrained first variation of the quartic coefficient. Thus the exact amplitude-minimized action has the positive excess (6) times \(\epsilon^4\), with remainder \(O(\epsilon^6)\). This agrees with the longitudinal relaxation of [E15](E15_HELICAL_COMPETITOR.md).

The estimates here are analytic. The obstruction concerns a scalar comparison for \(Q\) at \(b=51\pi/16\) and the proposed bound on the projected-current penalty by the variance alone. The positive action comparison is for the stated single angular profile and sufficiently small nonzero \(\epsilon\). The unrestricted crossing inequality for general angular fields remains open in this packet.
