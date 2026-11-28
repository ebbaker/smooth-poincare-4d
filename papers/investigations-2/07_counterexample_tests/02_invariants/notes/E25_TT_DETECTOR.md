# A transverse-tracefree test on the frozen metric

28 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. WIN-E25, analytical calculation. Actual serving model and reasoning effort unavailable. Baseline `86b24d9f9c2d` and the working-tree [WIN-B08 frozen request, revision 1](../research-progress/handoffs/REQUEST_B08_FROZEN_METRIC_R1.md), which fixes a member of the [DIR-E33 compact family](../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E33_20261124.md). The calculation uses the specified smooth Riemannian metrics on the standard oriented four-sphere.

Write \(q=\Omega^2\delta\) for the unit-round metric in the prescribed stereographic coordinates, with \(\Omega=2/(1+|y|^2)\), and use the frozen \(a=2^{-256}\), \(\epsilon=a^4\), and \(h=(\Omega/\rho)^2g-q\). In \(|y|<a/2\), both \(\rho\) and \(\chi\) are one, so

\[
 h=\epsilon\Omega^2(y^1)^2(dy^2\otimes dy^2-dy^3\otimes dy^3).
\]

There is a smooth symmetric covariant two-tensor \(S\), supported in \(|y|\le a/3\), with

\[
 \operatorname{tr}_q S=0,\qquad \nabla_q^i S_{ij}=0,\qquad
 \|S\|_{L^\infty(q)}\le128,\qquad
 \int_{S^4}\langle S,h\rangle_q\,dV_q\ge\frac{\pi^2}{13122}\epsilon a^6.
\]

The pointwise tensor norm is the Hilbert–Schmidt norm. With \(d\mu_q=dV_q/\operatorname{Vol}(q)\), the pairing has lower bound \(\epsilon a^6/34992\), hence at least \(2^{-16}\epsilon a^6\).

## Euclidean construction

Let \(C\) be diagonal as a symmetric bilinear form on \(\Lambda^2\mathbb R^4\) in the standard elementary basis. In tensor notation set

\[
 C_{1212}=C_{3434}=1,\qquad C_{1313}=C_{2424}=-1,\qquad
 C_{1414}=C_{2323}=0.
\]

Extend by skew symmetry in each pair and symmetry under exchange of pairs. The first Bianchi sum vanishes for distinct indices because the form is diagonal and for repeated indices by these symmetries. The contraction \(\sum_i C_{ikil}\) is zero. For \(k\ne l\) this follows from diagonality, and for \(k=l\) each row of sectional entries sums to zero. Thus \(C\) is an algebraic Weyl tensor and its Euclidean four-tensor norm is \(4\), since each of the four nonzero sectional entries contributes four components of square one.

Set \(r=a/3\), let \(\beta(t)=\exp[-1/(1-t)]\) for \(t<1\) and zero for \(t\ge1\), and define

\[
 \phi(y)=r^2\beta(|y|^2/r^2),\qquad T_{ij}=C_{ikjl}\,\partial_k\partial_l\phi.
\]

The exponential and each derivative tend to zero at the cutoff, so the radial scalar and the tensor are smooth everywhere. Pair exchange and symmetry of the Hessian give symmetry of \(T\). The contraction of \(C\) gives \(\operatorname{tr}_\delta T=0\). Commuting \(\partial_i\partial_k\) and skew symmetry of \(C\) in \(i,k\) give \(\partial^i T_{ij}=0\).

The Hessian is \(2\beta'\delta_{kl}+4\beta'' y^ky^l/r^2\). Its first term vanishes on contraction with \(C_{ikjl}\). For \(0\le t<1\), put \(z=(1-t)^{-1}\). Then \(\beta''(t)=e^{-z}(z^4-2z^3)\), so

\[
 |\beta''|\le(4/e)^4+2(3/e)^3<8.
\]

Here each maximum is the elementary maximum of \(z^k e^{-z}\) for \(z>0\). The strict inequality follows already from \(e>8/3\). Cauchy–Schwarz on the contraction of \(C\) with \(y\otimes y\) gives \(|T|_\delta\le4\cdot8\cdot4=128\) on the support.

## Round transport and pairing

Put \(u=\log\Omega\) and \(S=\Omega^{-2}T\), extended by zero at the point at infinity. To check the weight, for any Euclidean tracefree symmetric covariant two-tensor \(T\) and real \(w\) in dimension four, the connection formula

\[
 \Gamma^l_{ij}(e^{2u}\delta)=\delta^l_i u_j+\delta^l_j u_i-\delta_{ij}u^l
\]

gives

\[
 \nabla_{e^{2u}\delta}^i(e^{wu}T_{ij})
 = e^{(w-2)u}\bigl(\partial^i T_{ij}+(w+2)u^iT_{ij}\bigr),
\]

where the right-hand indices are raised by \(\delta\). The connection contribution on the first tensor index is \(2u^iT_{ij}\) and the contribution on the second is zero by symmetry and tracefreeness. Taking \(w=-2\) gives the round divergence condition. The round trace is \(\Omega^{-4}\operatorname{tr}_\delta T=0\). The norm is \(|S|_q=\Omega^{-4}|T|_\delta\le128\), since \(\Omega\ge1\) on the support.

The two round inverse metrics in \(\langle S,h\rangle_q\) cancel the factor \(\Omega^4\) in \(dV_q\). The factors \(\Omega^{-2}\) of \(S\) and \(\Omega^2\) of \(h\) also cancel. Twice integrating by parts on \(\mathbb R^4\) gives

\[
 \begin{aligned}
 \int_{S^4}\langle S,h\rangle_q\,dV_q
 &=\epsilon\int_{\mathbb R^4}(y^1)^2(T_{22}-T_{33})\,dy\\
 &=2\epsilon(C_{2121}-C_{3131})\int_{\mathbb R^4}\phi\,dy
 =4\epsilon\int_{\mathbb R^4}\phi\,dy.
 \end{aligned}
\]

For \(|y|\le r/\sqrt 2\), \(\beta(|y|^2/r^2)\ge e^{-2}>1/9\). The Euclidean volume of that ball is \(\pi^2r^4/8\), giving \(\int\phi\,dy\ge\pi^2r^6/72\). The pairing is therefore at least \(\pi^2\epsilon r^6/18=\pi^2\epsilon a^6/13122\). Integrating \(\Omega^4\) in the stereographic coordinates gives \(\operatorname{Vol}(q)=8\pi^2/3\) and the stated probability normalization. The measures in this calculation serve only to evaluate the test against the frozen anisotropy. The centering constraint for the pencils still uses \(dV_g/\operatorname{Vol}(g)\).
