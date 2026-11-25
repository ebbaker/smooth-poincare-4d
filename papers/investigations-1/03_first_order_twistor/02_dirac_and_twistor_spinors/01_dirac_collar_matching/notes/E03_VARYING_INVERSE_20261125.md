# Length-uniform Dirac inverse for varying slices

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Exact serving model and reasoning effort unavailable.
Conditional proof on a supplied smooth oriented Riemannian spin collar.
[Frozen request and local input versions](../research-progress/handoffs/E03_REQUEST_20261125.md)
· [Return](../research-progress/handoffs/E03_RETURN_20261125.md)

## Hypotheses and conclusion

Let \(I=[0,L]\), \(L\ge 2\), and use the product orientation on \(I\times S^3\).
Put \(\nu=+\partial_t\) in the unit normal form and identify the negative-chiral
target with the positive-chiral source by \(c(\nu)^{-1}\). In a smooth unitary
slice gauge let \(H=L^2(S^3,E)\) for a fixed Hermitian bundle \(E\) and fixed
smooth measure, and \(X=H^1(S^3,E)\) for a fixed reference metric and
connection. Use the norm
\[
 \|u\|_{X_I}^2=\|\partial_t u\|_{L^2(I;H)}^2+\|u\|_{L^2(I;X)}^2 .
\]
In this gauge \(X_I=H^1(I;H)\cap L^2(I;X)\). Let \(A_t\) be a smooth
self-adjoint first-order differential family of Dirac type, with common
domain \(X\). Assume uniform constants \(\kappa>0\) and \(C_{\mathrm{ell}}\) such that
\[
 \|w\|_H\le \kappa^{-1}\|A_tw\|_H,\qquad
 \|w\|_X\le C_{\mathrm{ell}}(\|A_tw\|_H+\|w\|_H).
\]
Write \(C_g=C_{\mathrm{ell}}(1+\kappa^{-1})\), or take any directly verified
uniform constant in \(\|w\|_X\le C_g\|A_tw\|_H\). Require
\[
 |(w,\dot A_t w)_H|\le\theta\|A_tw\|_H^2,\qquad 0\le\theta<1
 \tag{1}
\]
for every \(t\in I\) and \(w\in X\). For an inhomogeneous trace bound
also use \(C^{\uparrow}=\sup_{t\in I}\|A_t\|_{X\to H}<\infty\) uniformly
in \(L\). Let \(P_\pm(t)\) be the positive and negative spectral projections
and set
\[
 \mathcal D=\{u\in X_I:P_+(0)u(0)=0,\ P_-(L)u(L)=0\}.
\]
The gap excludes endpoint zero modes. The projections preserve \(H^{1/2}\)
by interpolation between \(H\) and the graph domain of \(A_t\).

Then \(D=\partial_t+A_t:\mathcal D\to L^2(I;H)\) is bijective, and
\[
 \|D^{-1}\|_{L^2(I;H)\to X_I}\le
 C_*=\max\{1,C_g(1-\theta)^{-1/2}\}.
 \tag{2}
\]
On the same domain \(D+B\) is bijective if
\(\|B\|_{X_I\to L^2(I;H)}\le b\) and \(bC_*<1\). Its inverse has norm
at most \(C_* /(1-bC_*)\). All these bounds are independent of \(L\)
when the stated constants and the perturbation margin are uniform.

## Signed identities and adjoint regularity

Write \(Q_t(z)=(z,A_tz)_H\), using the \(H^{1/2}\)-\(H^{-1/2}\) duality
at the ends, and \([Q_t(u(t))]_0^L=Q_L(u(L))-Q_0(u(0))\). Differentiate
the slice quadratic form in the fixed unitary gauge and take the real part
of the cross term. With \(D^\sharp=-\partial_t+A_t\) the formal adjoint,
\[
 \begin{aligned}
 \|Du\|_2^2
 &=\|\partial_t u\|_2^2+\|A_tu\|_2^2+[Q_t(u(t))]_0^L
    -\int_0^L(u,\dot A_tu)_H\,dt,\\
 \|D^\sharp v\|_2^2
 &=\|\partial_t v\|_2^2+\|A_tv\|_2^2-[Q_t(v(t))]_0^L
    +\int_0^L(v,\dot A_tv)_H\,dt .
 \end{aligned}
 \tag{3}
\]
Both are identities on \(X_I\). Smooth sections are dense there and
\(Q_t\) at fixed \(t\) is continuous on \(H^{1/2}\). For \(u\in\mathcal D\),
\(Q_0(u(0))\le0\) and \(Q_L(u(L))\ge0\), so the boundary contribution is
nonnegative. For
\[
 \mathcal D^\sharp
   =\{v\in X_I:P_-(0)v(0)=0,\ P_+(L)v(L)=0\}
\]
the signs of \(Q_0,Q_L\) are reversed and the signed contribution in the
second line is again nonnegative. Thus each operator on its stated
domain bounds \(\|\partial_t u\|_2^2+(1-\theta)\|A_tu\|_2^2\) by the
squared forcing norm. This gives (2) as an a priori estimate for both.

In the real principal symbol convention \(\sigma(D)(df)=[D,f]\),
the tangential symbol of \(A_t\) is skew-Hermitian. Thus
\(\sigma(D)(\tau dt+\xi)=\tau I+\sigma(A_t)(\xi)\) is invertible for
\((\tau,\xi)\ne0\), and \(D\) is boundary symmetric. The two inward normals
in the product coordinates are \(+\partial_t\) and \(-\partial_t\),
so the adapted operator for \(D\) on the two ends is
\(A_\partial=A_0\oplus(-A_L)\) and its inward normal symbol is \(I\oplus(-I)\).
The domain \(\mathcal D\) imposes the APS trace subspace
\(H^{1/2}_{(-\infty,0)}(A_\partial)\). Apply Bär–Ballmann's Standard Setup
1.5, Theorem 1.7, Theorem 1.12, Addendum 1.13 and §7.2 to this smooth
first-order boundary-symmetric operator. The Hermitian bundle and smooth
density are fixed, and completeness in the sense of their Definition 1.1
holds on this compact cylinder. Their APS condition is elliptic by Example
1.16(a), so the maximal realization with that trace condition has \(H^1\)
domain. The Hilbert adjoint is the formal adjoint with the annihilator trace
subspace and its maximal realization has \(H^1\) domain as well. Its adapted
operator is \(-A_\partial\). The annihilator condition flips the allowed
spectral subspace at each end because the normal symbol is \(I\) at the left
and \(-I\) at the right. Equivalently the smooth Green term is
\((u(L),v(L))_H-(u(0),v(0))_H\). This proves the full Hilbert adjoint domain
\(\mathcal D^\sharp\), including for an a priori weak \(L^2\) cokernel element.
[Bär–Ballmann, arXiv:1101.1196v2](https://arxiv.org/pdf/1101.1196v2)

The estimate and the closedness of \(\mathcal D\) in \(X_I\) imply closed
range, since convergence of \(Du_j\) makes \(u_j\) Cauchy in \(X_I\).
The adjoint estimate kills the orthogonal complement of the range, proving
surjectivity. Since \(D+B=(I+BD^{-1})D\), the perturbation assertion follows
from the Neumann series. For a smooth order-zero bundle map \(B\), it is also
bounded on \(L^2\) for each fixed compact collar. The perturbed Hilbert
adjoint then has domain \(\mathcal D^\sharp\) and expression
\(D^\sharp+B^*\). The inverse estimate uses only the indicated
\(X_I\to L^2\) smallness of \(B\).

## Prescribed traces

Take \(g_0\in H^{1/2}\cap\operatorname{ran}P_+(0)\) and
\(g_L\in H^{1/2}\cap\operatorname{ran}P_-(L)\). For the reference connection
\(\nabla_*\) let \(\Lambda=(1+\nabla_*^*\nabla_*)^{1/2}\) and choose a smooth
\(\chi\) supported in \([0,1)\) with \(\chi(0)=1\). Lift \(g_0\) by
\(\chi(t)e^{-t\Lambda}g_0\) and \(g_L\) by
\(\chi(L-t)e^{-(L-t)\Lambda}g_L\).
For each frequency \(\nu\ge 1\) of \(\Lambda\), the identity
\(\int_0^\infty \nu^2e^{-2t\nu}\,dt=\nu/2\) bounds the tangential \(H^1\)
and time-derivative contributions, including the cutoff term with a
constant depending on \(\chi\). Summing gives a lift \(\ell\) with
\(\|\ell\|_{X_I}\le C_{\rm tr}(\|g_0\|_{H^{1/2}}+\|g_L\|_{H^{1/2}})\)
independently of \(L\). Solve for the homogeneous correction with forcing
\(f-(D+B)\ell\). Writing \(C_{\rm inv}=C_* /(1-bC_*)\), the resulting bound is
\[
 \|u\|_{X_I}\le C_{\rm inv}\|f\|_2+
   [1+C_{\rm inv}(\sqrt{1+(C^\uparrow)^2}+b)]\,C_{\rm tr}
   (\|g_0\|_{H^{1/2}}+\|g_L\|_{H^{1/2}}).
 \tag{4}
\]

## Geometric measurement and warped example

In a geodesic slicing \(h=dt^2+g_t\), use spin parallel transport along
\(\nu\) to write the spinors in a fixed bundle. Let
\(\rho_t=(dV_{g_t}/dV_*)^{1/2}\) in that representation. The Riemannian case
of the hypersurface identity (3.6), with shape operator
\(W=-\nabla^{h}\nu|_{TS^3}\), writes \(c(\nu)^{-1}D_h^+\) as
\(\partial_t+\widehat A_t+\tfrac14\operatorname{tr}_{g_t}\dot g_t\) before
multiplication by \(\rho_t\). Here \(\widehat A_t\) is the transported
intrinsic slice Dirac with the sign from the fixed normal and chirality.
Since
\(\partial_t\log\rho_t=\tfrac14\operatorname{tr}_{g_t}\dot g_t\),
unitary conjugation by \(\rho_t\) cancels that scalar term exactly and
gives \(A_t=\rho_t\widehat A_t\rho_t^{-1}\), \(B=0\).
[Bär–Gauduchon–Moroianu, §3 (3.6) and §4 (4.1)](https://moroianu.perso.math.cnrs.fr/tex/2005mz.pdf)

One sufficient measurable criterion for (1) is
\[
 m=\sup_t\|\dot A_t\|_{X\to H},
 \qquad m C_g/\kappa<1.
 \tag{5}
\]
Indeed \( |(w,\dot A_tw)_H|\le m\|w\|_H\|w\|_X\).
For the geodesic slicing, the parallel-transport variation formula
involves \(\dot g_t\) against a first derivative and
\(\operatorname{div}_{g_t}\dot g_t\) and
\(d\operatorname{tr}_{g_t}\dot g_t\) as order-zero coefficients. Declaring
\(M_\rho\) to be multiplication by \(\partial_t\log\rho_t\), density
conjugation adds the order-zero commutator \([M_\rho,A_t]\). Its bound is
controlled by \(d\operatorname{tr}_{g_t}\dot g_t\). Thus the slice norms of
\(\dot g_t\) and \(\nabla^{g_t}\dot g_t\) in \(L^\infty\), with uniform
equivalence between the intrinsic and fixed-gauge \(H^1\) norms, give a
sufficient bound on \(m\). Gap, uniform graph estimate in the same gauge
and any remainder norm are separate inputs to be measured.
[Bär–Gauduchon–Moroianu, Theorem 5.1](https://moroianu.perso.math.cnrs.fr/tex/2005mz.pdf)

For \(g_t=r(t)^2\gamma_{S^3(1)}\) put \(r(t)=2+\tfrac12\sin t\) on every
\([0,L]\). In the scaled round frame the density factor can be taken to be
\(r^{3/2}\) and \(A_t=r^{-1}A_{\rm rd}\), where \(A_{\rm rd}\) is the
unit-round signed Dirac operator. Its gap is \(3/2\), so \(\kappa=3/5\)
works on every interval. With the unit-round covariant \(X\) norm,
the Schrödinger–Lichnerowicz formula at round scalar curvature \(6\)
gives \(\|w\|_X^2=\|A_{\rm rd}w\|_H^2-\tfrac12\|w\|_H^2\). Thus
\(C_g=5/2\) works. The identity \(\dot A_t=-(r'/r)A_t\) and the
slice gap \(3/(2r)\) give
\[
 |(w,\dot A_t w)_H|\le\tfrac23 |r'(t)|\|A_t w\|_H^2
      \le\tfrac13\|A_t w\|_H^2 .
\]
Here \(B=0\) and \(C_* \le (5/2)\sqrt{3/2}\). All slices have radii
between \(3/2\) and \(5/2\), so the difference from the unit-round product
is of order one in this gauge. The example shows that the criterion
allows an order-one metric change and nonconstant slice spectra.
[Bär, unit sectional curvature spectrum, Theorem 1](https://www.math.uni-potsdam.de/fileadmin/user_upload/Prof-Geometrie/Dokumente/Publikationen/sphere.pdf)
· [DIR §2.2, round Schrödinger–Lichnerowicz convention](../../manuscript/dirac_twistor_and_yamabe_rigidity.tex#L214)

## What a zero crossing can do

For the scalar mode \(\lambda(t)=(t-L/2)/L\), the endpoint signs are
negative at \(0\) and positive at \(L\). The incoming conditions then
impose no value on this mode and
\[
 u(t)=\exp[-(t-L/2)^2/(2L)]
\]
is in the kernel of \(\partial_t+\lambda(t)\). Reversing the crossing
imposes both \(u(0)=0\) and \(u(L)=0\). The integrating factor for the
reversed operator is \(e^{-(t-L/2)^2/(2L)}\) up to a constant. Thus the
forcing has to be orthogonal to this function, which spans its scalar
adjoint kernel. Either scalar block occurs on the \(3/2\)-eigenspace of
\(A_{\rm rd}-3/2+\lambda(t)\) using the corresponding crossing direction.
All the other modes remain at least \(1/2\) from zero for these families.
An arbitrarily small absolute time derivative \(1/L\) therefore permits
failure when the crossing destroys the relative bound (1) and the gap.
The shifted round operators are examples in the Dirac-type class used
for the estimate.

## Scope and source inspection

The estimates control a supplied collar problem in the fixed gauge.
Realizing the hypotheses on extracted collars and matching the actual core
and cap Cauchy spaces remain geometric and boundary problems for the
corresponding tasks. The reference sections inspected on 25 November 2026
were Bär–Ballmann, arXiv:1101.1196v2 (21 November 2011), Definition 1.1,
Definition 1.4 through Standard Setup 1.5, Theorem 1.7, Theorem 1.12,
Addendum 1.13, Example 1.16(a) and §7.2; Bär–Gauduchon–Moroianu,
author-hosted manuscript dated 30 January 2004, equations (3.6), (4.1)
and Theorem 5.1, published in Math. Z. 249 (2005), 545–580; and Bär's
[author-hosted round spectrum](https://www.math.uni-potsdam.de/fileadmin/user_upload/Prof-Geometrie/Dokumente/Publikationen/sphere.pdf),
Theorem 1, J. Math. Soc. Japan 48 (1996), 69–83 ([R52](../../../../../../references/README.md)).
The branch lead can integrate the two new primary source records in the
shared reference catalog.
