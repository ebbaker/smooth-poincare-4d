# SP4-TWA-E15 · Helical competitors at the candidate crossing

28 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. The request records the author-selected GPT-6.2 Astra/ultra lead and GPT-6.2 Sol/ultra helper configuration. Actual backend model and reasoning effort were unavailable. HEAD was `280376dd7a1820fa2878d0ab0ee2e639facb2eeb` and all seven frozen SHA-256 digests matched at execution start. [Frozen request v1](../research-progress/handoffs/E15_REQUEST_v1.md) · [B08 slope and helicity](../brainstorm/notes/B08_SLOPE_AND_HELICITY.md)

## Quaternionic convention and exact quartic density

Use the oriented flat Riemannian product \(M=[-1,1]\times(\mathbb R/\mathbb Z)^3\) with the periodic spin structure, volume one on each torus slice, and commuting positive half-spinors. In the parallel oriented frame \((e_0,e_1,e_2,e_3)=(1,\mathbf i,\mathbf j,\mathbf k)\), with \(e_0=\partial_t\), identify the two half-spin spaces with \(\mathbb H\), complex by right multiplication by \(\mathbf i\), and choose the positive frame so the reference parallel unit spinor is \(\sigma=1\). Clifford action is

\[
 v\cdot (s_+,s_-)=(v s_-,-\bar v s_+).
\]

It squares to \(-|v|^2\), and \(e_0\cdot e_1+e_2\cdot e_3\) acts by left multiplication by \(2\mathbf i\) on the positive factor and by zero on the negative factor. This identifies positive chirality with the convention that real self-dual forms act there. The spinor pairing is the real part of the Hermitian pairing. With \(D=\sum_{\mu=0}^3 e_\mu\cdot\partial_\mu\) and \(P_X=\partial_X+\tfrac14X\cdot D\), the orthogonal Clifford projection gives \(|P\psi|^2=|\nabla\psi|^2-\tfrac14|D\psi|^2\). [Branch conventions](../research-overview/OVERVIEW.md) · [Projection and fixed-slope context](E08_LOCAL_DIRICHLET.md)

For signed \(\lambda=\pm2\pi\), set

\[
 n(x_1)=\mathbf j\cos(\lambda x_1)+\mathbf k\sin(\lambda x_1),\qquad
 g(t,x_1)=\cos\theta(t)+\sin\theta(t)n(x_1),\qquad
 \psi=e^{bt+u(t)}g .
\]

Take \(\theta,u\) smooth and zero at both endpoints. The field is smooth, periodic, zero-free, and has the traces \(e^{\pm b}\sigma\). Write \(s=\sin\theta\), \(c_\theta=\cos\theta\), \(v=b+u'\), and \(C=3/4\). Then \(n'=\lambda\mathbf i n\), where this derivative is in \(x_1\). Also \(g_t=\theta'(-s+c_\theta n)\), \(g_{x_1}=\lambda s\mathbf i n\), and \((g,g_t)_{\mathbb R}=0\). The chiral Dirac operator acting on this field gives

\[
 e^{-(bt+u)}D\psi=-(vg+g_t)+\mathbf i g_{x_1}
                 =-(vg+g_t+\lambda s n).
\]

Thus its squared norm in the quotient is \(v^2+(\theta')^2+\lambda^2s^2+2\lambda(vs^2+\theta' s c_\theta)\). The gradient squared norm in the quotient is \(v^2+(\theta')^2+\lambda^2s^2\). The exact density is independent of the torus variable and has both tangential cross terms:

\[
 Q=\frac{|P\psi|^2}{|\psi|^2}
 =C\big(v^2+(\theta')^2+\lambda^2\sin^2\theta\big)
   -\frac{\lambda}{2}
      \big(v\sin^2\theta+\theta'\sin\theta\cos\theta\big),\qquad
 S[\psi]=\int_{-1}^1 Q^2\,dt .
\]

Here \(S=J_g^4\). The time cross term is \(-(\lambda/4)(\sin^2\theta)'\) in \(Q\). It contributes when \(Q\) is squared. In the identification of imaginary quaternions with oriented torus vectors \(\operatorname{curl}n=-\lambda n\). For \(b\ne0\), the helicity lowering the quadratic coefficient has \(\lambda b>0\).

## Quartic coefficient after amplitude relaxation

Let \(\omega=\pi/2\), \(F(t)=\cos(\omega t)\), \(\theta=\varepsilon F\), and \(u=\varepsilon^2 w\) for smooth \(w\) with \(w(-1)=w(1)=0\). Use \(\alpha=C\lambda^2-\lambda b/2\). Expanding the exact formula gives \(Q=Q_0+\varepsilon^2Q_2+\varepsilon^4Q_4+O(\varepsilon^6)\), with

\[
 \begin{aligned}
 Q_0&=Cb^2,\\
 Q_2&=2Cb w'+C(F')^2+\alpha F^2-\frac{\lambda}{2}FF',\\
 Q_4&=C(w')^2-\frac{\alpha}{3}F^4-\frac{\lambda}{2}w'F^2
      +\frac{\lambda}{3}F^3F'.
 \end{aligned}
\]

The remainder is uniform in \(t\) for \(w\) bounded in \(C^1\) and \(b\) in a compact interval. We use \(\int F^2\,dt=1\), \(\int (F')^2\,dt=\omega^2\), \(\int FF'\,dt=0\), and \(\int w'\,dt=0\), with all integrals on \([-1,1]\). The second-order coefficient of \(S\) is

\[
 2Cb^2\big(C(\omega^2+\lambda^2)-\lambda b/2\big).
\]

It vanishes at \(\lambda b=2C(\omega^2+\lambda^2)\), which for the lowering helicity is \(|b|=51\pi/16\). The radial action there is \(S[e^{bt}]=2C^2 b^4=9b^4/8\).

At this crossing, \(\alpha=-C\omega^2\) and

\[
 q=C\big((F')^2-\omega^2 F^2\big)-\frac{\lambda}{2}FF'
   =-C\omega^2\cos(2\omega t)+\frac{\lambda\omega}{4}\sin(2\omega t).
\]

The fourth-order coefficient \(I[w]=\int (Q_2^2+2Q_0Q_4)\,dt\) becomes

\[
 I[w]=I[0]+\int_{-1}^1\big(6C^2b^2(w')^2+\ell(t)w'\big)\,dt,\qquad
 \ell=4Cbq-Cb^2\lambda F^2.
\]

The term proportional to \(F^3F'\) integrates to zero. Using \(\int F^4\,dt=3/4\) and the orthonormal sine and cosine at frequency \(2\omega=\pi\) in \(L^2[-1,1]\) gives

\[
 I[0]=C^2\omega^4+\frac{\lambda^2\omega^2}{16}
            +\frac{C^2b^2\omega^2}{2}.
\]

The zero endpoint constraint is equivalent to \(\int w'\,dt=0\). Thus the square is completed with the mean-zero part \(\widetilde\ell=\ell-\tfrac12\int\ell\,dt\), which is

\[
 \widetilde\ell
 =Cb\big(-(4C\omega^2+b\lambda/2)\cos(2\omega t)
                 +\lambda\omega\sin(2\omega t)\big).
\]

The optimum has \(w_*'=-\widetilde\ell/(12C^2b^2)\), which integrates to a smooth \(w_*\) with zero endpoint values. Its coefficient is

\[
 \begin{aligned}
 I[w_*]&=I[0]-\frac{\int_{-1}^1 \widetilde\ell^2\,dt}{24C^2b^2}\\
 &=C^2\omega^4+\frac{\lambda^2\omega^2}{16}
      +\frac{C^2b^2\omega^2}{2}
      -\frac{(4C\omega^2+b\lambda/2)^2+\lambda^2\omega^2}{24}\\
 &=\left(\frac{26609}{2048}-\frac{4225}{384}\right)\omega^4
   =\frac{12227}{6144}\omega^4
   =\frac{12227\pi^4}{98304}>0.
 \end{aligned}
\]

In the last line \(|\lambda|=4\omega\) and \(|b|=(51/8)\omega\) with \(\lambda b>0\). The positive value applies to both signs of \(b\). Every smooth \(w\) with the stated end data has \(I[w]\ge I[w_*]\). For \(0<|b|<51\pi/16\) and the same matched helicity, the second-order coefficient is positive.

## Exact amplitude minimization for a small fixed angular test

The same sign test applies if \(u\) is first minimized at fixed \(\theta=\varepsilon F\) for small \(\varepsilon\) and fixed \(b\ne0\). Indeed \(Q\) is a nonnegative quadratic in \(v\), with \(Q_{vv}=2C\). The second derivative of \(Q^2\) in \(v\) is \(2Q_v^2+4CQ\), positive except possibly at the single zero of \(Q_v\). Thus the integrand is strictly convex in \(v\). The amplitude constraint is \(\int_{-1}^1 v\,dt=2b\). The constant multiplier equation \(\partial_v(Q^2)=\kappa\) and this constraint determine the minimizer near \(\varepsilon=0\), \(v=b\), \(\kappa=4C^2b^3\). Pointwise inversion is smooth uniformly on the compact time interval since \(\partial_v^2(Q^2)=12C^2b^2>0\) at this reference. The derivative with respect to \(\kappa\) of the integral of the inverse is \(2/(12C^2b^2)>0\). The scalar implicit function theorem therefore gives a smooth multiplier and solution for small \(\varepsilon\). The tangent inequality for strict convexity shows that this solution is the unique minimizer among all smooth \(v\) with the prescribed mean. Integrating \(v-b\) from \(-1\) gives the corresponding smooth amplitude.

The multiplier and solution are even in \(\varepsilon\). At the crossing, expanding their equation gives \(12C^2b^2 w'+\ell=\text{constant}\) at order \(\varepsilon^2\), hence \(v=b+\varepsilon^2 w_*'+O(\varepsilon^4)\). The order-four term of \(v-b\) has zero integral by the mean constraint. Its first-order contribution through the radial linear response \(4C^2b^3\) therefore vanishes. The minimum action at the crossing equals \(9b^4/8+\varepsilon^4 I[w_*]+O(\varepsilon^6)\). At each fixed \(0<|b|<51\pi/16\) the same minimization retains the positive second-order coefficient. At \(b=0\) the radial action is zero by nonnegativity.

This establishes a positive local obstruction on the specified circularly polarized helical family, with its fixed first time profile and relaxed longitudinal log amplitude. The test is local in angular amplitude and uses one time profile. The global transition remains open. [Previous global comparison and its range](../continuation-notes/CLOSING_B07_GLOBAL_MINIMUM_20261128.md)

## Source inspection

The seven frozen inputs were inspected. The Clifford projection and action normalization are the frozen branch conventions. The helical density, Taylor coefficient, and amplitude minimization follow by the displayed calculations. Friedrich §1, equation (1.1), checked in the digitized published copy on 28 November 2026, supplies the Riemannian twistor convention. [Friedrich, published copy, §1](https://dml.cz/bitstream/handle/10338.dmlcz/701462/WSGP_09-1989-1_7.pdf#page=2) · [Independent replay of the earlier small-slope global result](../reviews/E13_GLOBAL_MINIMUM_REPLAY.md)
