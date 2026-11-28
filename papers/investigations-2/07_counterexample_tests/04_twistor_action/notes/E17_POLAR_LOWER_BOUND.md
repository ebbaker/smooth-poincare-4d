# SP4-TWA-E17 · A global polar comparison on the periodic cylinder

28 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. [Frozen request v1](../research-progress/handoffs/E17_REQUEST_v1.md) records the selected lead GPT-6.2 Astra/ultra and configured helper GPT-6.2 Sol/ultra. Actual backend model and reasoning effort were unavailable. HEAD was `280376dd7a1820fa2878d0ab0ee2e639facb2eeb` and all seven frozen SHA-256 digests matched.

## Statement and polar variables

Use \(M=[-1,1]\times Y\), \(Y=(\mathbb R/\mathbb Z)^3\), its oriented flat Riemannian product, periodic spin lift, and volume \(D=2\). Fix a parallel unit positive half-spinor \(\sigma\), with positive chirality the one on which real self-dual two-forms act. Use the parallel frame \(e_0=\partial_t,e_j=\partial_{x^j}\), Clifford multiplication \(c_i=e_i\cdot\) with \(c_i c_j+c_j c_i=-2\delta_{ij}\), and the real part \((\, ,\, )\) of the Hermitian pairing. Write \(\mathcal D=\sum_i c_i\partial_i\) for the Dirac operator and \(P_i=\partial_i+\tfrac14 c_i\mathcal D\). We use \(S=J^4\) as in the [branch conventions](../research-overview/OVERVIEW.md).

For \(b\in\mathbb R\), consider smooth positive spinors with traces \(e^{-b}\sigma,e^b\sigma\), allowing finitely many transverse interior zeros with \(P\psi=0\) at each. With

\[
B_*=\frac{17\pi}{8},
\]

the unique global minimizer for every \(|b|\le B_*\) is \(\psi_*(t,x)=e^{bt}\sigma\), with \(S[\psi_*]=9b^4/8\). This comparison is over all smooth admissible fields with the exact end traces, including the stated zeros. [B08 scope](../brainstorm/notes/B08_SLOPE_AND_HELICITY.md)

Off the zero set write \(\psi=e^{bt+u}g\), where \(u=\log|\psi|-bt\) and \(g=\psi/|\psi|\) is a unit spinor. The traces of \(u\) and \(w=g-\sigma\) are zero at both faces. At a transverse zero, let \(r\) denote local distance to the zero. Smoothness and transversality give \(|\psi|\asymp r\), \(u=\log r+O(1)\), \(|du|=O(r^{-1})\), and \(|dg|=O(r^{-1})\). These functions and derivatives are locally square integrable in dimension four. They represent the weak derivatives as well. Integration of a first derivative against a smooth test on the domain with small radius-\(r\) balls removed has inner surface terms of size \(O(r^3(1+|\log r|))\) for \(u\) and \(O(r^3)\) for \(g\). They vanish as \(r\to0\), and all volume integrals converge by integrability. This gives \(u,w\in H^1\) with zero traces, since the original trace is nowhere zero and the polar fields are smooth near both end faces. At each admitted zero the compatible jet also gives \(|P\psi|=O(r)\), hence the quotient \(|P\psi|/|\psi|\) is locally bounded. Values assigned on the finite zero set are immaterial to all the inequalities. [Compatible zeros and the quotient](E09_UNEQUAL_TRACE_GAP.md#holder-unequal-traces-and-the-diagonal)

## Integrated polar identity and angular current

Write \(a=b\,dt+du\), \(Q=|P\psi|^2/|\psi|^2\), and define the real current

\[
K_i=\sum_{j\ne i}(g,c_i c_j\partial_j g).
\]

The pointwise twistor projection identity is \(|P\psi|^2=|\nabla\psi|^2-\tfrac14|\mathcal D\psi|^2\). Off the zeros, \((g,\partial_i g)=0\) gives \(|\nabla\psi|^2/|\psi|^2=|a|^2+|dg|^2\). Moreover \(\mathcal D\psi/|\psi|=c(a)g+\mathcal Dg\). For its cross term, Clifford skew-adjointness gives \((c_i g,c_j\partial_j g)=-(g,c_i c_j\partial_j g)\), with the term at \(i=j\) vanishing. Therefore

\[
Q=\tfrac34|a|^2+|dg|^2-\tfrac14|\mathcal Dg|^2+\tfrac12 a\cdot K .
\]

Every term is integrable by the \(H^1\) estimates and \(|g|=1\). On zero-trace \(w\), the flat identity \(\mathcal D^2=-\Delta\) and Dirac integration by parts give \(\|\mathcal Dw\|_2^2=\|dw\|_2^2\), first on smooth zero-trace fields and then by \(H^1\) density. Since \(\sigma\) is parallel, the same integrated equality holds for \(g=w+\sigma\). The zero traces of \(u\) give \(\int_M \partial_t u=0\). Thus the integrated identity is

\[
\int_M Q
=\tfrac34 Db^2+\tfrac34\int_M(|du|^2+|dg|^2)
+\tfrac12\int_M du\cdot K+\tfrac b2\int_M K_0 .
\]

For fixed \(j\), the three spinors \(-c_ic_jg\), \(i\ne j\), are orthonormal in the real pairing. Indeed their norms are one, and the adjoint product of the operators corresponding to distinct \(i\) reduces, up to sign, to a skew-adjoint Clifford product of two distinct unit vectors. Cauchy–Schwarz in the three summands for each \(i\), then the orthonormal bound at fixed \(j\), gives

\[
\sum_i |K_i|^2
\le3\sum_j\sum_{i\ne j}|(-c_i c_jg,\partial_jg)|^2
\le3|dg|^2 .
\]

Completing the square now gives

\[
\int_M Q-\tfrac34 Db^2
=\tfrac34\|du+K/3\|_2^2
+\int_M\big(\tfrac34|dg|^2-\tfrac1{12}|K|^2\big)
+\tfrac b2\int_M K_0
\ge \tfrac34\|du+K/3\|_2^2
+\tfrac12\|dg\|_2^2+\tfrac b2\int_M K_0 .
\]

## Sharp helicity bound

Let \(T=\sum_{i=1}^3 c_0c_i\partial_i\). Periodicity gives \(\int_M(\sigma,Tw)=0\), hence \(\int_M K_0=\int_M(w,Tw)\). This holds for \(H^1\) fields by continuity. For a torus Fourier mode with \(k=2\pi n\), \(n\in\mathbb Z^3\), the symbol on the complexification of the real spinor fibers is \(T_k=i\sum_{j=1}^3 k_jc_0c_j\). The matrices \(c_0c_j\) are real skew-adjoint, square to \(-I\), and anticommute for distinct \(j\). Thus \(T_k\) is Hermitian and \(T_k^2=|k|^2I\), so \(|T_k|=|k|I\).

Put \(\lambda_1=(\pi/2)^2\), the first time Dirichlet eigenvalue. Each coefficient \(w_n(t)\) has zero end traces, so Parseval and the interval Poincaré inequality give

\[
\left|\int_M K_0\right|\le\sum_n |k|\|w_n\|_{L^2_t}^2,\qquad
\|dg\|_2^2=\|dw\|_2^2\ge
\sum_n(|k|^2+\lambda_1)\|w_n\|_{L^2_t}^2.
\]

For \(k\ne0\), the quantity \((|k|^2+\lambda_1)/|k|\) is minimal at \(|k|=2\pi\), since \(r+\lambda_1/r\) is increasing for \(r\ge2\pi\). Its minimum is \(B_* = 2\pi+\pi/8\). The time energy of the zero mode is controlled by the same Poincaré inequality and contributes no helicity. In particular the following estimate retains its zero-mode term:

\[
\|dg\|_2^2-B_*\left|\int_M K_0\right|
\ge\lambda_1\|w_0\|_{L^2_t}^2.
\]

The constant in \(|\int_M K_0|\le B_*^{-1}\|dg\|_2^2\) is optimal. In the linear zero-trace space write \(J_1=c_0c_1\), take a real unit spinor \(p\), and put

\[
w_*(t,x)=\cos(\pi t/2)\big(\cos(2\pi x^1)p+\sin(2\pi x^1)J_1p\big).
\]

Then \(Tw_*=-2\pi w_*\); the first tangential and time modes attain the ratio \(B_*^{-1}\). To see the same optimal constant among unit fields of trace \(\sigma\), choose \(p\perp\operatorname{span}_{\mathbb R}\{\sigma,J_1\sigma\}\), a nonzero \(J_1\)-invariant complement, so \(w_*\perp\sigma\). For \(g_\epsilon=(\sigma+\epsilon w_*)/(1+\epsilon^2|w_*|^2)^{1/2}\), the unit norm and trace are exact. Also \(g_\epsilon-\sigma=\epsilon w_*+O(\epsilon^2)\) in \(H^1\), so continuity of the two quadratic forms gives the same limiting ratio. The estimate is strict for every nonconstant unit field in this class. Indeed equality requires \(w_0=0\), but \(|\sigma+w|^2=1\) gives \(|w|^2+2(\sigma,w)=0\) almost everywhere. Integrating on \(Y\) at almost every \(t\) gives \(\int_Y |w|^2=0\) when \(w_0=0\).

## Action and the endpoint equality case

For \(|b|\le B_*\), the integrated polar and helicity bounds give

\[
\int_M Q-\tfrac34 Db^2
\ge \tfrac34\|du+K/3\|_2^2
+\tfrac12(1-|b|/B_*)\|dg\|_2^2
+\frac{|b|\lambda_1}{2B_*}\|w_0\|_{L^2_t}^2 \ge 0.
\]

Since \(S[\psi]=\int_M Q^2\), Jensen's inequality gives

\[
S[\psi]\ge D^{-1}\left(\int_M Q\right)^2
\ge D(3b^2/4)^2=\frac{9b^4}{8}.
\]

For \(\psi_*\) we have \(u=0\), \(g=\sigma\), \(K=0\), and \(Q=3b^2/4\) constant, so both inequalities are exact. Conversely equality implies \(\int_M Q=\tfrac34 Db^2\), including at \(b=0\). For \(|b|<B_*\) the gradient term forces \(dg=0\), and the trace gives \(g=\sigma\). At \(|b|=B_*\) the zero-mode term forces \(w_0=0\), and the unit-length argument again gives \(g=\sigma\). In either case \(K=0\) and the square term forces \(du=0\), hence \(u=0\) by trace. Thus the competitor equals \(\psi_*\) almost everywhere and then everywhere by smoothness.

## Evidence and scope

All seven frozen inputs were checked. The [B07 closing](../continuation-notes/CLOSING_B07_GLOBAL_MINIMUM_20261128.md), [E11 comparison](E11_GLOBAL_COMPARISON.md), [E12 cylinder constant](E12_CYLINDER_CONSTANT.md), and [E13 replay](../reviews/E13_GLOBAL_MINIMUM_REPLAY.md) supply the prior global comparison and its range. [E08](E08_LOCAL_DIRICHLET.md) supplies the flat projection and homogeneous Dirichlet conventions, and B08 fixes the varying-slope target on the same product. The polar identity, extension through zeros, helicity estimate and action comparison are derived here directly. The optimal helicity constant is a statement about the angular quadratic bound. The sharp threshold for global action minimization beyond this sufficient interval remains open in this packet.
