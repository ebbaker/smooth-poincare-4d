# GEO-E14 · Independent replay of the intrinsic and area tests

27 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. [Replay request](../research-progress/handoffs/ISSUE_INTRINSIC_TEST_20261127.md)
revision 1. GPT-6.2 Sol/ultra was requested. Actual serving model and effort
were unavailable. Reviewed the [intrinsic height note](../notes/INTRINSIC_HEIGHT_TEST_20261127.md)
(`cfd623f048b0`) and the [global area note](../notes/GLOBAL_AREA_TEST_20261127.md)
(`270954fe0173`), with SHA-256 prefixes as read. The parent
[Theorem 4.1](../../manuscript/cuts_of_subcritical_conformal_classes.tex)
uses baseline `bc2c1bb`. The area calculation also uses the central radii
and derivatives from [E06](../research-progress/handoffs/E06_GERM.md)
(`589e2ad26823`). The reader was independent of the two notes being tested.
This is an exact Riemannian calculation and a check of the stated hypotheses.

The height criterion gives positive scalar curvature on every regular
level under its two pointwise bounds. The width bound from the
quaternionic equator and the Berger-ratio obstruction both hold for
their specified smooth suspensions. The bounds in the two tests remain
to be checked on any proposed triaxial completion.

## Pointwise height criterion

Write \(P(n)=R-2\operatorname{Ric}(n,n)\) and
\(p=\min_{|n|=1}P(n)>0\) in the entering gauge. At a regular level of
\(f\) with normal \(n=\nabla f/|df|\), put
\(C=\nabla^2 f|_{n^\perp}\). Its second form is \(C/|df|\).
In the tangent three-plane, the identities are

\[
R_\Sigma=P(n)+\frac{2\sigma_2(C)}{|df|^2},
\qquad
2\sigma_2(C)=\frac23(\operatorname{tr}C)^2-|C^\circ|^2.
\]

For \(D=\nabla^2 f+\mu f g\), the tangential trace-free part of
\(D|_{n^\perp}\) is exactly \(C^\circ\). Both restriction and
trace-free projection contract the Hilbert–Schmidt norm. Thus on
\(|f|\le\delta\), the gradient floor \(|df|\ge v\) gives
\(R_\Sigma\ge p-\|D\|_\infty^2/v^2>0\). For \(|f|>\delta\),
\(\|D\|_\infty<\mu\delta\) makes the full Hessian definite,
with sign opposite to \(f\). Its tangential restriction on a
regular level is definite as well, so \(\sigma_2(C)>0\).
The same estimate gives a uniform positive scalar lower bound over
the regular levels. Under \(g\mapsto \ell^2g\) with fixed \(f\),
the thresholds and \(\|D\|_\infty\) each scale as \(\ell^{-2}\)
when \(\mu\mapsto\ell^{-2}\mu\) and \(v\mapsto\ell^{-1}v\).

The nonempty belt has no critical point, placing the global minimum
strictly below \(-\delta\) and the global maximum strictly above
\(\delta\). All critical points are nondegenerate extrema. With
only index zero and four handles, the latter cannot join distinct
components, since the attaching \(S^3\) is connected. Connectedness
therefore forces one minimum. Applying the same argument to \(-f\)
forces one maximum. The normalized gradient field
\(\nabla f/|df|^2\) parametrizes the regular levels, between
the two extrema. A specified cut can anchor this sweepout when
supplied as an actual regular level or by a separate alignment
result.

For \(-\Delta f=\lambda f\), the divergence Laplacian convention
gives \(D=(\nabla^2f)^\circ\) at \(\mu=\lambda/4\).
Integrating Bochner on the closed manifold gives
\(\int|\nabla^2 f|^2=\int(\Delta f)^2-
\int\operatorname{Ric}(\nabla f,\nabla f)\).
Subtracting \(\int(\Delta f)^2/4\) and then using
\(\int|df|^2=\lambda\int f^2\) reproduces, under
\(\operatorname{Ric}\ge 3k g\),
\[
\int|D|^2
=\tfrac34\lambda^2\int f^2-\int\operatorname{Ric}(\nabla f,\nabla f)
\le\tfrac34\lambda(\lambda-4k)\int f^2 .
\]
Pointwise Hessian control and a gradient floor remain additional
inputs to the sweepout criterion.

On the unit round sphere the coordinate eigenfunction has
\(\nabla^2f=-fg\) and \(|df|^2=1-f^2\), so
\(v=\sqrt{1-\delta^2}\) works for \(0<\delta<1\).
The orbit height is the restriction of the homogeneous harmonic
polynomial \(|x_{\mathbb R^2}|^2-(2/5)|x|^2\), of spherical
eigenvalue \(2(2+3)=10\). On its critical \(S^2\),
\(f=-2/5\) and the tangential Hessian is zero. If
\(\delta\ge2/5\), the gradient bound fails there. If
\(\delta<2/5\), evaluation on a unit tangent to the
critical \(S^2\) gives \(\|D\|_\infty\ge 2\mu/5>\mu\delta\).
This obstruction in fact holds for every \(\mu>0\).

## Quaternionic equator and width

On the specified two-pole suspension, the angular equator
\(S=\{x_0=0\}\) closes smoothly by the polar hypotheses. In
the polar normal charts its cone is a linear three-plane, transformed
by the permitted orthogonal angular identifications. The regular
part is a product interval times a two-sphere, with a three-ball
at each end. Thus the closed competitor is an embedded three-sphere.

With \(q=x_0+\sum x_i e_i\), the left-invariant fields
\(E_i=qe_i\) give \(E_i x_0=-x_i\) and
\(E_i x_j=x_0\delta_{ij}+\sum_k\epsilon_{kij}x_k\).
Put \(m_i=a_i^{-2}\), \(v^2=\sum_i m_i x_i^2\).
The ambient angular unit normal near the equator is
\(-\sum_i m_i x_i E_i/v\). The volume form is
\(a_1a_2a_3\,ds\,dV_{\mathrm{round}}\).
The \(E_i\) have zero divergence for Haar measure and have
zero radial component, so their ambient divergences also vanish.
Differentiating the coefficients gives
\[
\operatorname{div}n=
-\frac{x_0}{v}\sum_i m_i
+\frac{x_0}{v^3}\sum_i m_i^2x_i^2.
\]
The cubic term in the differentiation of \(v\) cancels by
alternation after multiplication by the symmetric weights
\(m_i m_jx_i x_j x_k\). This proves minimality on the
regular equator, and smoothness extends it over the poles.

The round orbit-normal components on the equator are
\(-\omega_i\) in the left frame. Changing the metric in that
frame by the diagonal matrix with entries \(a_i^2\) scales
two-dimensional area by the determinant factor times the
inverse-metric norm of the former unit normal. The radial
tangent contributes a factor one. Consequently
\[
I=\int_0^L a_1a_2a_3
     \int_{S^2}\sqrt{\sum_i a_i^{-2}\omega_i^2}\,d\omega\,ds
\le\frac{4\pi}{\sqrt3}\int_0^L
   a_1a_2a_3\sqrt{\sum_i a_i^{-2}}\,ds .
\]
The bound uses \((4\pi)^{-1}\int\omega_i^2=1/3\) and
concavity of the square root. The round unit model has
\(a_i=\sin s\), \(0\le s\le\pi\), giving
\(I=4\pi\int_0^\pi\sin^2s\,ds=2\pi^2\).
An orbit has area \(2\pi^2a_1a_2a_3\) at its own radial
coordinate. All areas scale as \(\ell^3\) under ambient length
rescaling by \(\ell\). With the closed connected orientable
ambient manifold and positive Ricci hypothesis, Zhou's integral
fundamental-class width inequality gives \(W_1\le I\), since
the smooth comparator is orientable and minimal.
[Zhou, arXiv:1210.2112v2, Theorem 1.1 and (7.1)](https://arxiv.org/pdf/1210.2112v2)

For the E06 germ, at \(s_0\) the central radii are \((1,1,t)\)
with \(t=\sqrt{65}/4\), so its orbit area is \(2\pi^2t\).
For a direct check of the comparison scale, set
\(\alpha=\sqrt{1-t^{-2}}\). The integrand in \(I\) at
\(s_0\) is \(2\pi[1+t\arcsin(\alpha)/\alpha]\), obtained
by integrating \(t\sqrt{1-\alpha^2\omega_3^2}\) on
\(S^2\). A symmetric collar of half-width \(d\) contributes
\(2d\) times this value plus \(O(d^3)\). The two exterior
cap integrals remain to be estimated for a specified completion.
A strict \(I<2\pi^2t\) excludes the central orbit from
realizing the width. The comparison yields only the upper
bound when this strict inequality fails.

## Biaxial obstruction and scope

Under \(a_1=a_2=a\), \(a_3=c\), smooth polar closure in
the stated round markings gives \(c/a\to1\) at both ends.
A value \(c/a\ge2\) would force an interior maximum with
\((c/a)'=0\). There the shape eigenvalues
\(a'/a,a'/a,c'/c\) all agree, so the orbit is umbilic.
The entering inequality and contracted Gauss equation then give
\(R_\Sigma=P(n)+6(a'/a)^2>0\). Scaling the unit horizontal
Berger calculation gives
\(R_\Sigma=2(4-(c/a)^2)/a^2\le0\) at that same orbit.
It follows that every orbit has \(c/a<2\) and strictly positive
intrinsic scalar curvature. The conclusion uses the entering
gauge throughout the biaxial completion.

In the E06 germ the log derivatives of the two unit radii are
\(b,-b\), with \(b=1/(2\sqrt2)>0\). For nearby positive
and negative parameters these radii separate, while the long
radius remains separated from both. Thus the germ lies outside the
biaxial subclass as a collar. The quaternionic comparison, if used
on a triaxial completion, still needs the two cap integrals.
The height estimate certifies supplied pointwise data and the
area test compares supplied completions. They leave the general
first-width sign and sweepout problems open.
