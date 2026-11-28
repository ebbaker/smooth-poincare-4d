# SP4-TWA-E30 · Exact slice comparison with variable amplitude

28 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. The [frozen request](../research-progress/handoffs/E30_REQUEST_v1.md) records the author-selected lead GPT-6.2 Astra/ultra and configured helper GPT-6.2 Sol/ultra. Actual backend model and reasoning effort were unavailable. HEAD was `7c6bbab9a0a66532d81599b3dd0952f5a371c8d4`. All three frozen SHA-256 digests matched. The identities and controls below are exact and use the [closing conventions](../continuation-notes/CLOSING_B08_SLOPE_20261128.md), [polar variables](E17_POLAR_LOWER_BOUND.md) and [prescribed-norm comparison](B08_PRESCRIBED_NORM.md).

## Slice identity and sharp relaxation of the amplitude jet

Let \(M=[-1,1]\times Y\), \(Y=(\mathbb R/\mathbb Z)^3\), with the oriented flat Riemannian product, periodic spin structure and unit positive spinor \(\sigma=1\) in a parallel quaternionic frame. Use \(c(v)(s_+,s_-)=(v s_-,-\bar v s_+)\) for \(v\in\mathbb H\), so the self-dual two-forms act on the positive factor and \(c_0c_j\) acts by left multiplication by \(I_j\). Identify the imaginary quaternions with \(\mathbb R^3\) using this spatial basis. Put \(b=51\pi/16\), \(C=3/4\), \(h=e^{-bt}\psi=e^u g\) with \(g\) a unit quaternion, and \(Q=|P\psi|^2/|\psi|^2\). The full traces of \(h\) are \(1\) on both ends. Write \(Q_0=Cb^2\), so \(S[\psi]=\int_M Q^2\) and \(S[e^{bt}]=2Q_0^2=9b^4/8\). Bars denote spatial means and slice norms are over \(Y\) of volume one.

Set \(z_\mu=(\partial_\mu g)g^{-1}\), all imaginary, \(a_0=b+u_t\), and define
\[
 T=\sum_j I_j\partial_j,\qquad
 (Tg)g^{-1}=K_0+L,qquad
 K_0=-\sum_j I_j\cdot z_j,\qquad
 L=\sum_j I_j\times z_j,\qquad K_x=z_0-L.
\]
In particular \(K=(K_0,K_x)\) is the angular current of [E17](E17_POLAR_LOWER_BOUND.md). Right multiplication by \(g^{-1}\) preserves the real pairing. Applying \(c_0\) to the Dirac operator on positive spinors gives \(-\partial_t+T\). Thus the normalized squared Dirac norm is \((a_0-K_0)^2+|z_0-\nabla_xu-L|^2\), and the Clifford projection gives
\[
 Q=a_0^2+|z_0|^2+|\nabla_xu|^2+|\nabla_x g|^2
 -\tfrac14\big((a_0-K_0)^2+|z_0-\nabla_xu-L|^2\big).
\]
The real pairing with \(|h|^{-2}h\) yields \((h,Th)/|h|^2\! = (g,Tg)=K_0\) pointwise because \(\sum_j I_j u_j\) is skew-adjoint. The squared norm of the Dirac term retains the spatial amplitude gradient.

Periodicity and the Clifford relations give \(T^*=T\), \(T^2=-\Delta_x\) and \(\int_Y(K_0^2+|L|^2)=\|\nabla_xg\|^2\). Write \(H(t)=\overline{K_0}(t)\). Differentiating \(\int_Y(g,Tg)\) gives \(H'=2\int_Y z_0\cdot L\). Consequently
\[
 \boxed{\quad
 \bar Q=C\big(\overline{a_0^2}+\|g_t\|^2+\|\nabla_xg\|^2+\|\nabla_xu\|^2\big)
 +\frac b2 H+\frac14H'+\frac12\mathcal M,
 \qquad
 \mathcal M=\int_Y (u_t K_0+\nabla_x u\cdot K_x).
 \quad}
\]

Let \(v=b+\overline{u_t}\), \(r=u_t-\overline{u_t}\), \(k=K_0-H\), and let \(\mathcal P_Y\) be the real \(L^2(Y)\) projection of spatial vector fields onto periodic gradients. Integration by parts gives \(\mathcal P_Y K_x=\nabla_x\Delta_x^{-1}\operatorname{div}_x K_x\), where the inverse has zero spatial mean and \(\Delta_x=\sum_j\partial_j^2\). Completing the two amplitude squares gives the exact identity
\[
 \begin{aligned}
 \bar Q={}&B_Y
  +C\left\|r+\frac{k}{3}\right\|^2
  +C\left\|\nabla_xu+\frac{\mathcal P_Y K_x}{3}\right\|^2,\\
 B_Y={}&C\big(v^2+\|g_t\|^2+\|\nabla_xg\|^2\big)+\frac{vH}{2}+\frac{H'}4
 -\frac{\|k\|^2+\|\mathcal P_YK_x\|^2}{12}.
 \end{aligned}
\]
In particular \(\bar Q\ge B_Y\) is sharp on any single smooth interior slice for fixed \(g,g_t,v\). One can prescribe the zero-mean part of \(u_t\) and the gradient of \(u\) independently there and extend their smooth jets using a time cutoff with support in the interior. On the whole cylinder the trace requires \(\int_{-1}^1 v\,dt=2b\), and the slice choices for \(u_t\) and \(\nabla_xu\) must come from the same \(u\). The full quartic action decomposes as
\[
 S=\int_{-1}^1\bar Q^2\,dt+\int_M(Q-\bar Q)^2
 \ \ge\int_{-1}^1 (B_Y)_+^2\,dt.
\]

## Integration by parts and periodic phase control

The residual \(\mathcal M\) can be integrated by parts exactly. The right logarithmic derivatives satisfy \(\partial_\mu z_\nu-\partial_\nu z_\mu=[z_\mu,z_\nu]\), with quaternion commutator \([a,b]=2a\times b\) for imaginary \(a,b\). In the given orientation,
\[
 \begin{aligned}
 \mathcal M(t)&=\frac{d}{dt}\int_Y uK_0-\int_Y u\,\operatorname{div}K,\\
 \operatorname{div}K&=-\sum_j I_j\cdot[z_0,z_j]
 -\tfrac12\sum_{i,j,k}\epsilon_{ijk}I_k\cdot[z_i,z_j].
 \end{aligned}
\]
Here \(\operatorname{div}K=\partial_tK_0+\operatorname{div}_xK_x\); the second term of the formula is obtained by antisymmetrizing \(\operatorname{div}_x L\) in \(i,j\). A spatial integration therefore leaves a time flux and a commutator term.

For a real periodic phase \(\phi(t,x)\) take \(g=\exp(I_1\phi)\) and require the exact end values \(g(\pm1,x)=1\). All commutators vanish, \(H=0\), and \(\mathcal M=-\frac{d}{dt}\int_Y u\,\partial_1\phi\). For example \(\phi=F(t)\sin(\lambda x_1)\), \(u=G(t)\cos(\lambda x_1)\) with \(\lambda=2\pi\) and \(F,G\) vanishing at the two ends gives \(\mathcal M=-\lambda(FG)'/2\), of either sign on an interior slice. If \(F(0)=1\), \(F'(0)=G(0)=0\) and \(G'(0)=\lambda/3\), the mixed term and amplitude-square cost on that slice sum to \(-\lambda^2/24\) relative to \(u=0\) at the same \(g,g_t\) and \(v=b\). Nevertheless the mixed term integrates to zero on the cylinder because \(u(\pm1,x)=0\). In this class \(\int_M Q=2Q_0+C(\|du\|_{L^2(M)}^2+\|d\phi\|_{L^2(M)}^2)\), so Jensen's inequality gives the radial action bound for arbitrary log amplitude, with equality only for the reference field. The local signed cancellation fails even though the global phase comparison holds.

## Circular control with a finite mean deficit

Take \(\omega=\pi/2\), \(\lambda=4\omega\) and \(n=I_2\cos(\lambda x_1)+I_3\sin(\lambda x_1)\). Let \(g=\cos\theta(t)+\sin\theta(t)n\) and \(u=u(t)\), with zero end data for \(\theta,u\). Then \(z_0=\theta'n\), \(K_0=-\lambda\sin^2\theta\), and \(L=-\lambda\sin\theta\cos\theta\,n\). Thus \(H=K_0\), \(\operatorname{div}_x K_x=0\), \(\mathcal M=-\lambda u_t\sin^2\theta\), and \(B_Y=\bar Q=Q\). With \(v=b+u_t\), the exact density is
\[
 Q=C\big(v^2+\theta'^2+\lambda^2\sin^2\theta\big)
 -\tfrac{\lambda}{2}\big(v\sin^2\theta+\theta'\sin\theta\cos\theta\big).
\]
The last angular derivative contributes the flux \(H'/4\). It vanishes after integration in time and remains in \(S\), as in [E15](E15_HELICAL_COMPETITOR.md). For the integrated mean only, completing the square at fixed \(\theta\) and \(\int_{-1}^1 v=2b\) gives the minimizing derivative \(u_t=(\lambda/3)(\sin^2\theta-\langle\sin^2\theta\rangle_t)\), where \(\langle\cdot\rangle_t\) is the time average. The integrated amplitude contribution \(C\int u_t^2+\frac12\int\mathcal M\) is then \(-\frac{\lambda^2}{12}\int(\sin^2\theta-\langle\sin^2\theta\rangle_t)^2\). In particular its sign can be strictly negative even after paying the amplitude-square cost.

For a finite zero-free control put \(F=\cos(\omega t)\), \(\sin\theta=\varepsilon F\) with the principal arcsine, and \(u_t=(\lambda/3)\varepsilon^2(F^2-1/2)\), taking \(u(-1)=0\). Both full end traces are exact. Since \(C\lambda^2-\lambda b/2=-C\omega^2\), the quadratic time integral cancels. Using \(\int(F^2-1/2)^2=1/4\) and \(\int F^2(F')^2=\omega^2/4\), one obtains
\[
 \int_M Q-2Q_0
 =\varepsilon^4\left(C\int_{-1}^1\frac{F^2(F')^2}{1-\varepsilon^2F^2}\,dt-\frac{\omega^2}{3}\right).
\]
For \(0<|\varepsilon|\le1/2\) this lies between \(-7\varepsilon^4\omega^2/48\) and \(-\varepsilon^4\omega^2/12\). This gives a strict obstruction to the required radial bound on \(\int Q\).

The exact quartic action still has positive excess on this finite family. Writing \(p=F^2\), the same density gives
\[
 Q-Q_0=\varepsilon^2\omega^2\left(\tfrac{45}{8}\cos(2\omega t)+\sin(2\omega t)\right)+\varepsilon^4 R,
 \qquad
 \frac R{\omega^2}=\frac{3p(1-p)}{4(1-\varepsilon^2p)}+\tfrac13-\tfrac43 p^2.
\]
The first term of \(R/\omega^2\) belongs to \([0,1/4]\) when \(|\varepsilon|\le1/2\), so \(|R|\le\omega^2\). The time cosine in this formula has unit \(L^2\) norm. Its projection alone gives \(\|Q-Q_0\|_{L^2(M)}^2\ge\varepsilon^4\omega^4(45/8-\sqrt2/4)^2>25\varepsilon^4\omega^4\). Also \(2Q_0(\int_M Q-2Q_0)\ge-(18207/2048)\varepsilon^4\omega^4\). Adding these two terms yields \(S-2Q_0^2>16\varepsilon^4\omega^4\) in the same range. This test controls the chosen mean-minimizing amplitudes and arcsine profiles. The general variable-amplitude quartic comparison remains open in this packet.

## Admitted zeros

For finitely many transverse compatible zeros, use the polar variables off the zeros. The E17 bounds give \(u=O(1+|\log r|)\) and \(du,dg,K=O(r^{-1})\) near each zero at distance \(r\). The slice identities hold on all slices avoiding those finitely many times. The compatible jet gives bounded \(Q\) near the zero, and the identities use integrable quadratic terms on the cylinder. The identity for \(H'\) extends in distributions with \(H\in W^{1,1}(-1,1)\) by smooth approximation of \(g\) in \(H^1(M)\) and the spatial integration-by-parts identity. The product \(u\operatorname{div}K\) is locally integrable since the commutator is \(O(r^{-2})\). Excision yields a vanishing inner flux of order \(O(r^2(1+|\log r|))\) for \(uK\), so the flux identity also holds in distributions. The smooth nonzero end values give the stated time and spin traces and eliminate the boundary fluxes. No external existence or regularity result is needed for these identities.
