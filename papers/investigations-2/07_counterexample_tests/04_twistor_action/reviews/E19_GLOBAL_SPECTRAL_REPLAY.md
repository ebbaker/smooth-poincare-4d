# SP4-TWA-E19 · Independent replay of the global and spectral thresholds

28 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. The [frozen request](../research-progress/handoffs/E19_REQUEST_v1.md) records GPT-6.2 Astra/ultra as the selected lead and GPT-6.2 Sol/ultra as the configured helper. Independent backend model and reasoning telemetry were unavailable. HEAD was `280376dd7a1820fa2878d0ab0ee2e639facb2eeb`, and all ten frozen SHA-256 digests matched. The reviewer authored none of the three arguments under review.

| Frozen claim | Disposition |
| --- | --- |
| [E14 Hessian](../notes/E14_FIRST_NEGATIVE_MODE.md) | Pass. At \(b_{\rm H}=51\pi/16\) in absolute slope the first transverse block has six real null directions. For every \(|b|>b_{\rm H}\) there is a smooth zero-free cheaper competitor. |
| [E17 global polar comparison](../notes/E17_POLAR_LOWER_BOUND.md) | Pass. The radial field uniquely attains the full admissible infimum \(9b^4/8\) for \(|b|\le B_*=17\pi/8\), including the endpoints. |
| [B08 convex-ray threshold](../notes/B08_GLOBAL_TRANSITION.md) | Pass. Radial attainment holds exactly on a closed interval \([-b_{\rm G},b_{\rm G}]\), with \(B_*\le b_{\rm G}\le b_{\rm H}\). The radial minimizer is unique in its strict interior. At either endpoint an additional minimizer exists exactly when the corresponding infimum of fieldwise thresholds is achieved. |

## Fixed geometry and normalization

Take \(M=[-1,1]\times(\mathbb R/\mathbb Z)^3\) with flat Riemannian metric, orientation \(dt\wedge dx_1\wedge dx_2\wedge dx_3\), volume \(D=2\), and periodic spin lift. Use a unit parallel positive half-spinor \(\sigma\), the chirality on which self-dual two-forms act, the real part of the Hermitian pairing, and Clifford square \(c(e)^2=-|e|^2 I\). Let \(\mathcal D=\sum_j c(e_j)\partial_j\), \(P=\Pi d\), and \(\Pi=I-c^*c/4\) with \(c\) denoting Clifford contraction. Prescribe the full spinor traces \(e^{-b}\sigma,e^b\sigma\) at \(t=-1,1\), respectively. The admissible positive half-spinors are smooth up to both faces and are zero-free or have finitely many transverse interior zeros with \(P\psi=0\) at each. The normalization is \(S=J_g^4=\int_{M\setminus Z(\psi)}|P\psi|^4/|\psi|^4\). For the parallel tensor map \(Az=\Pi(dt\otimes z)\), \(A^*A=3I/4\) and \(A^*T=T(\partial_t)\) on \(\operatorname{im}\Pi\).

## E14 · Exact Hessian and crossing

Write \(B=P+bA,\ a=bA\sigma,\ k^2=3b^2/4\). At \(\psi=e^{bt}(\sigma+\epsilon v)\) the product rule cancels the exponentials from the density, leaving \(|a+\epsilon Bv|^4|\sigma+\epsilon v|^{-4}\). For \(u=(\sigma,v)\), \(bA^*a=k^2\sigma\) cancels the zero-order terms of the first derivative, leaving \(4k^2(a,Pv)\). Its integral is the boundary pairing against the parallel tensor \(a\), and vanishes for the zero trace. Thus \(\psi_b=e^{bt}\sigma\) is stationary for all \(b\), with \(S[\psi_b]=Dk^4=9b^4/8\). The additive and radial-log/unit-quaternion paths with the same first variation have the same second variation, because their acceleration difference has zero end traces and is paired against the first variation.

The first two derivatives of the denominator factor are \(-4u\) and \(24u^2-4|v|^2\). Writing \(Y=Bv\) and \(\ell=(\sigma,(Pv)(\partial_t))\), the density second derivative is
\[
4k^2|Y|^2+8(a,Y)^2-32k^2(a,Y)u+k^4(24u^2-4|v|^2).
\]
Using \((a,Y)=b\ell+k^2u\), \(A^*A=3I/4\), and \((Pv,Av)=((Pv)(\partial_t),v)\) cancels all zero-order terms. The remainder is
\[
4k^2|Pv|^2+8b^2\ell^2+8bk^2\big(((Pv)(\partial_t),v)-2u\ell\big).
\]

In the oriented quaternion model take \(c(e)(s_+,s_-)=(e s_-,-\bar e\,s_+)\), with the ordered basis \(1,I_1,I_2,I_3\) and \(I_iI_j=-\delta_{ij}+\epsilon_{ijk}I_k\). The operators \(c(e_0)c(e_i)\) act on the first summand by \(I_i\). For example \(c(e_0)c(e_1)+c(e_2)c(e_3)\) acts by \(2I_1\) there and zero on the second summand, so the first summand is the stated positive chirality. Use \(\sigma\) for \(1\) and decompose \(v=u+w\), with \(w\) imaginary. Direct quaternion multiplication in the normal twistor component gives
\[
(Pv)(\partial_t)=\tfrac34\partial_t(u+w)+
\tfrac14(-\operatorname{div}_x w+\nabla_x u+\operatorname{curl}_x w).
\]
In particular \(\ell=(3u_t-\operatorname{div}_x w)/4\) and
\[
((Pv)(\partial_t),v)-2u\ell
=\tfrac38\partial_t(|w|^2-u^2)+\tfrac14\operatorname{div}_x(uw)
+\tfrac14 w\cdot\operatorname{curl}_x w .
\]
The time derivative has zero endpoint difference by the zero traces and the tangential divergence integrates to zero by periodicity. For homogeneous Dirichlet fields, \(\|Pv\|_2^2=(3/4)\|dv\|_2^2\), by zero extension in time and the projection symbol or by the flat Dirac square with zero boundary pairings. This yields the exact integrated real Hessian
\[
\mathcal H_b(v,v)=
\tfrac94 b^2(\|du\|_2^2+\|dw\|_2^2)
+\tfrac12 b^2\|3u_t-\operatorname{div}_x w\|_2^2
+\tfrac32 b^3\int_M w\cdot\operatorname{curl}_x w.
\]
Polarization gives the bilinear form. The formula is continuous on the homogeneous \(H^1\) form domain, and \(v\mapsto e^{bt}v\) is bounded and invertible there for each fixed \(b\).

The zero tangential frequency has no curl. For \(j\ne0\) with \(\xi=2\pi j\), the gradient term is orthogonal between the longitudinal and transverse components. The square term couples only the scalar and longitudinal fields and leaves that block positive for \(b\ne0\). On the complex transverse plane the curl symbol \(i\xi\times\) is Hermitian, with eigenvalues \(h\lambda\) on complex lines, \(h=\pm1\) and \(\lambda=|\xi|\). Time Dirichlet frequencies are \(\omega_n=n\pi/2\), with sine profiles \(\sin(\omega_n(t+1))\) for \(n\ge1\). The transverse block thus has \(L^2\) coefficients
\[
k^2[3(\lambda^2+\omega_n^2)+2bh\lambda].
\]
Only \(h=-\operatorname{sgn}(b)\) can cross at \(b\ne0\). Its crossing slope has magnitude \((3/2)(\lambda^2+\omega_n^2)/\lambda\). First minimize over \(n\) at \(n=1\), then over \(\lambda\ge2\pi\), since \(\lambda+(\pi/2)^2/\lambda\) is strictly increasing there. This gives \(b_{\rm H}=51\pi/16\), with \(|j|=1\) and \(n=1\). Conjugation pairs the same helicity at \(j\) and \(-j\). The three opposite-frequency pairs each supply two real directions, so the kernel at the first crossing is six-dimensional. The same mode formula gives all other nonzero-slope resonances. The Hessian vanishes identically at \(b=0\). For \(0<|b|<b_{\rm H}\), the mode threshold inequality bounds the negative helicity contribution by \(|b|/b_{\rm H}\) times the transverse gradient term. Therefore \(\mathcal H_b(v,v)\ge (9/4)b^2(1-|b|/b_{\rm H})\|dv\|_2^2\).

Independently check the real witness
\[
w(t,x)=\cos(\pi t/2)\big(0,\cos(2\pi x_1),\operatorname{sgn}(b)\sin(2\pi x_1)\big).
\]
It has zero end traces, zero spatial divergence, curl \(-\operatorname{sgn}(b)\,2\pi w\), and \(\|w\|_2^2=1\). The corresponding imaginary perturbation \(W\) is pointwise real-orthogonal to \(\sigma\), so \(e^{bt}(\sigma+\epsilon W)\) is zero-free with the exact end traces. For \(|b|>b_{\rm H}\), its second derivative of \(S\) at \(\epsilon=0\) is precisely the negative mode coefficient, and its first derivative vanishes. Taylor expansion then gives a strictly cheaper field for sufficiently small nonzero \(\epsilon\) at each such fixed \(b\).

## E17 · Unrestricted comparison and endpoint rigidity

Off the zeros put \(g=\psi/|\psi|\), \(u=\log|\psi|-bt\) and \(w=g-\sigma\). The end traces of \(u,w\) vanish. At a transverse zero, smoothness gives \(|\psi|\asymp r\), \(|du|+|dg|=O(r^{-1})\), and \(u=\log r+O(1)\). These fields and derivatives are locally \(L^2\) in dimension four. Integrating the distributional derivative against a smooth test on the excised domain produces inner boundary terms of sizes \(O(r^3(1+|\log r|))\) for \(u\) and \(O(r^3)\) for \(g\). They vanish, so \(u,w\in H^1\), with the asserted traces from smoothness near both faces. Compatibility gives \(|P\psi|=O(r)\), so the relative quotient is bounded near the zeros.

Put \(a=b\,dt+du\), \(Q=|P\psi|^2/|\psi|^2\), \(c_i=c(e_i)\), and \(K_i=\sum_{j\ne i}(g,c_i c_j\partial_jg)\). Because \((g,\partial_jg)=0\), the squared covariant derivative after division by \(|\psi|^2\) is \(|a|^2+|dg|^2\). The corresponding Dirac field is \(c(a)g+\mathcal Dg\), and \((c_i g,c_j\partial_jg)=-(g,c_i c_j\partial_jg)\). Its diagonal terms vanish in the cross pairing. Inserting this into the projection identity gives the sign and factor in
\[
Q=\tfrac34|a|^2+|dg|^2-\tfrac14|\mathcal Dg|^2+\tfrac12 a\cdot K .
\]
All terms are integrable with the \(H^1\) extensions. The flat Dirac identity gives \(\|\mathcal Dg\|_2^2=\|dg\|_2^2\) by applying it to \(w\) with zero traces, first for smooth fields and then by \(H^1\) density. Also \(\int \partial_t u=0\). For fixed \(j\), the three spinors \(-c_i c_jg\), \(i\ne j\), are real orthonormal. Each has norm one, and for distinct \(i,\ell\ne j\), \((-c_i c_j)^*(-c_\ell c_j)=-c_i c_\ell\) is skew-adjoint. Cauchy–Schwarz over the three terms in each \(K_i\) and Bessel's inequality at each \(j\) give \(|K|^2\le3|dg|^2\). Consequently completing the square gives
\[
\int_M Q-\tfrac34 Db^2
=\tfrac34\|du+K/3\|_2^2+\tfrac34\|dg\|_2^2-\tfrac1{12}\|K\|_2^2+\tfrac b2\int_M K_0
\ge\tfrac34\|du+K/3\|_2^2+\tfrac12\|dg\|_2^2+\tfrac b2\int_M K_0 .
\]

The spatial operator \(T=\sum_{i=1}^3 c_0c_i\partial_i\) satisfies \(\int_M K_0=\int_M(w,Tw)\), as the linear pairing with \(\sigma\) vanishes by periodicity. On a Fourier mode of tangential frequency \(\xi=2\pi j\), its symbol \(i\sum_i \xi_i c_0c_i\) is Hermitian. The \(c_0c_i\) are skew and anticommute, each with square \(-I\), so the symbol has square \(|\xi|^2I\). With \(\lambda_1=(\pi/2)^2\), time Dirichlet Poincaré bounds the derivative energy of each mode below by \((|\xi|^2+\lambda_1)\|w_j\|_{L^2_t}^2\), and its current is bounded in absolute value by \(|\xi|\|w_j\|_{L^2_t}^2\). The minimum of \((|\xi|^2+\lambda_1)/|\xi|\) for \(\xi\ne0\) is \(B_*=2\pi+\pi/8=17\pi/8\), attained at \(|j|=1\). The spatial zero mode contributes no current. Thus
\[
\|dg\|_2^2 - B_*\left|\int_M K_0\right|\ge\lambda_1\|w_0\|_{L^2_t}^2 .
\]
The angular constant is sharp. Indeed for \(J_1=c_0c_1\) and a real unit spinor \(p\), the first time mode times \(\cos(2\pi x_1)p+\sin(2\pi x_1)J_1p\) has \(T\)-eigenvalue \(-2\pi\) and realizes the quadratic ratio on zero-trace fields. Taking \(p\perp\operatorname{span}_{\mathbb R}\{\sigma,J_1\sigma\}\) makes this mode \(w_*\) pointwise orthogonal to \(\sigma\). Normalizing \(\sigma+\epsilon w_*\) gives exactly unit fields of trace \(\sigma\), with \(g_\epsilon-\sigma=\epsilon w_*+O(\epsilon^2)\) in \(H^1\). Their quadratic ratios tend to \(B_*^{-1}\). Equality for a unit field requires \(w_0=0\), and integrating \(|w|^2+2(\sigma,w)=0\) over the torus on almost every time slice then gives \(w=0\).

For \(|b|\le B_*\) the two estimates combine to give
\[
\int_M Q-\tfrac34 Db^2\ge
\tfrac34\|du+K/3\|_2^2+\tfrac12(1-|b|/B_*)\|dg\|_2^2+
\frac{|b|\lambda_1}{2B_*}\|w_0\|_{L^2_t}^2 .
\]
Cauchy–Schwarz gives \(S=\int Q^2\ge D^{-1}(\int Q)^2\ge9b^4/8\), attained at \(u=0,\ g=\sigma\). Equality forces the displayed right side to vanish, since \(Q\ge0\) and equality of the action forces equality of its mean lower bound. For \(|b|<B_*\) this gives \(dg=0\) and the trace yields \(g=\sigma\). At \(|b|=B_*\) it gives \(w_0=0\), and the unit constraint yields \(g=\sigma\) as above. Now \(K=0\), so the square term and the trace give \(u=0\). This also covers \(b=0\). The original smooth spinor equals the radial field everywhere, even though the polar calculation was performed off its finite zero set.

## B08 · A common competitor class and the closed threshold

The substitution \(h=e^{-bt}\psi\) gives trace \(\sigma\) at both faces. It rescales each zero's real linear jet by a positive scalar, since the term differentiating the amplitude is proportional to the vanishing spinor. Thus the compatible jet condition is preserved in both directions and the class of smooth admissible \(h\) is independent of \(b\). Off zeros let \(X=Ah/|h|\) and \(Y=Ph/|h|\). Then \(|X|^2=3/4\) and \(Y\) is bounded, including near compatible zeros. By the product rule, for \(b>0\), \(s=1/b\),
\[
b^{-4}S[e^{bt}h]=\Phi_h(s)=\int_M |X+sY|^4,\qquad
\Phi_h(0)=9/8 .
\]
This quartic polynomial is strictly convex when \(Y\) is nonzero on a set of positive measure. The integrand is strictly convex on each such line and convex elsewhere. If \(Y=0\) almost everywhere, smoothness gives \(Ph=0\), and the zero-trace twistor identity applied to \(h-\sigma\) forces \(h=\sigma\). In the strict case the leading coefficient \(\int |Y|^4\) is positive. The slope at zero is \(m_h=4\int|X|^2(X,Y)\). If \(m_h\ge0\), strict convexity and the supporting tangent at zero give \(\Phi_h(s)>9/8\) for every \(s>0\). If \(m_h<0\), then \(\Phi_h\) decreases below \(9/8\) for small positive \(s\) and tends to infinity as \(s\to\infty\). Continuity and strict convexity give exactly one positive root \(s_h\) of \(\Phi_h(s_h)=9/8\), with strict inequality below that level exactly for \(0<s<s_h\). Thus \(h\) is cheaper precisely when \(b>1/s_h\).

There is at least one such root by E14. In the periodic parallel frame, \(R(t,x)=(-t,-x)\) reverses the sign of every derivative and preserves the quotient norm under composition. It exchanges traces, preserves the compatible zero class, and proves symmetry in \(b\). Combining the positive-slope tests gives \(b_{\rm G}=\inf_{m_h<0}1/s_h\). For \(0<b\le b_{\rm G}\), no field is cheaper and the radial field attains the infimum. For strict interior positive slopes, every nonconstant competitor has strict inequality. At \(b=b_{\rm G}\) a nonconstant competitor ties exactly if its root realizes the infimum. The zero slope has the unique parallel minimizer by the zero-trace twistor identity. Thus by symmetry the full attainment interval is closed and uniqueness holds in its strict interior. For \(|b|>b_{\rm G}\) there is a cheaper admissible field by the defining infimum. This assertion requires no attainment by a nonradial field there.

## Exact ranges and evidence

The E11–E12 sufficient positive-margin bound is \(0<|b|<(2+24\sqrt{3\sqrt2})^{-1}\), with uniqueness at \(b=0\) separately. Its endpoint is below \(1/2\), whereas \(B_*=17\pi/8=(2/3)b_{\rm H}\). The combined sharp-threshold information is
\[
\frac{17\pi}{8}\le b_{\rm G}\le\frac{51\pi}{16}.
\]
E17 establishes uniqueness at \(B_*\). If \(b_{\rm G}=B_*\), its positive endpoint therefore has no additional minimizer. E14 supplies the loss of radial minimality for \(|b|>b_{\rm H}\). The location of \(b_{\rm G}\) inside the displayed interval and the general equality test at \(|b|=b_{\rm H}\) require the separate nonlinear comparison.

[E08](../notes/E08_LOCAL_DIRICHLET.md) concerns nearby full traces and critical fields in an \(H^5\) neighborhood of the field at \(b=1/200\). The [fixed-trace convergence theorem](E13_GLOBAL_MINIMUM_REPLAY.md) has \(H^1\) convergence at that pair, with an explicit minimizing sequence unbounded in \(H^5\). The earlier varying-jump comparison has a different competitor cutoff and limit. The present slope results supply comparison, equality and a spectral test at the stated constant-ray trace pairs. Extending the \(H^5\) or \(H^1\) conclusions to these ranges would require checking the respective regularity or compactness arguments for those claims.

The frozen [overview](../research-overview/OVERVIEW.md) and [B08 decision](../brainstorm/notes/B08_SLOPE_AND_HELICITY.md) fix the chirality, product and normalization. I rechecked Friedrich's published §1, p. 59, orthogonal twistor projection and equation (1.1) as context for the convention. The quaternion signs, Hessian, integrated current, spectral inequalities and convex comparison above are derived on the fixed product. The numerical prior comes from the frozen [E12 estimate](../notes/E12_CYLINDER_CONSTANT.md) and its [E13 replay](E13_GLOBAL_MINIMUM_REPLAY.md). This review leaves the extra nonlinear trial and any formal verification status untouched. [Friedrich, published scan](https://dml.cz/bitstream/handle/10338.dmlcz/701462/WSGP_09-1989-1_7.pdf#page=2)
