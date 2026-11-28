# SP4-POLE-E08a · Fibre projection and the marked second-cap trace

28 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex assistance. Fixed E packet, revision 1. The request designates GPT-6.2 Sol/ultra. The runtime identifies the executing helper as Codex, GPT-6 based, with exact serving variant and effort unavailable. Base 6a422ce7814fe1ad278d6904970e3b19b05a9890. Working project derivation on one smooth oriented Riemannian specimen, pending non-author replay. [Request](../research-progress/handoffs/REQUEST_E08_CAP_ESTIMATES_20261127.md) · [Input versions](../research-progress/handoffs/RETURN_E08_CAP_TRACE_20261127.md)

Use the marked minus-presentation boundary, metric \(h\), puncture \(p\) and ordered input frame \(u_1,u_2,u_3\) of [B04](../brainstorm/notes/B04_MARKED_PILOT_20261127.md). On \(X=M\setminus\{p\}\), write \(\Omega=Lu\) for the smooth \(h\)-self-dual form with the A1 leading coefficient \(u\in\Lambda_p^-\). We use the inner product in which a wedge of two distinct orthonormal covectors is a unit two-form. By [A1, §3](E01_A1.md#3-the-endpoint-estimate-and-exhaustion), \(\Omega=d(A^0+a)\) on \(X\).

## 1. Complete cap fibres

In either cap \(C_i=D^2\times S^2\), orient the fibre \(S_\zeta=\{\zeta\}\times S^2\) by the outward unit sphere area \(dA\), including at the disk centre and the rim. Use the \(h\)-orthogonal splitting into the vertical plane and its complement. Let \(v\) be the oriented area of the vertical plane extended by zero on the horizontal plane, and \(k\) the horizontal area oriented by the disk. The orientation is disk followed by sphere, so \(*_h v=k\). In the frozen first-cap connection metric, \(D n=dn+A\times n\) restricts to \(dn\) on \(S_\zeta\). Thus the induced fibre metric is unit round on both caps, with \(v|_{S_\zeta}=dA\). The positive horizontal and vertical areas give the unit self-dual form
\[
 J=\frac{v+k}{\sqrt 2},\qquad c_u=\langle\Omega,J\rangle_h .
\]
Since \(\Omega\) is self-dual, \(\langle\Omega,v\rangle_h=\langle\Omega,k\rangle_h=c_u/\sqrt 2\). The two-form pulled back to the fibre is accordingly \((c_u/\sqrt 2)dA\). Stokes on this smooth closed sphere in \(X\) yields
\[
 \int_{S_\zeta}\Omega=0,\qquad \int_{S_\zeta}c_u\,dA=0 .
\]
If \(c_u\) is not identically zero on the connected fibre, continuity and the zero integral give values of both signs and hence a zero. This applies also to the complete fibres in the product enlargement of \(C_2\). The fibre structures used here are those of the [original metric trial](../../../investigations-1/07_positive_subcritical_entry/notes/MARKED_CONNECTION_ASSEMBLY.md#one-whole-smooth-trial) and the [signed atlas](E07_MARKED_ATLAS.md#2-cartesian-caps-and-signed-seams).

At any point \(q\) where \(c_u(q)=0\), a template \(T(q)=\lambda(q)J(q)\) with any real amplitude obeys
\[
 |\Omega(q)-T(q)|_h^2=|\Omega(q)|_h^2+|\lambda(q)|^2 .
\]
Consequently every valid pointwise upper error bound there is at least \(|T(q)|_h\). On any compact chart piece containing \(q\), one also has \(\sup|\Omega-T|_h\ge |T(q)|_h\ge\inf|T|_h\). A subdivision covering a complete fibre contains such a point in at least one piece. The argument applies to each template defined at that point even if amplitudes or signs differ between pieces. It rules out the strict reverse-triangle certificate based entirely on templates in this line. The two perpendicular self-dual components of \(\Omega(q)\) are unconstrained by \(c_u(q)=0\).

On the product second cap, let \(R\in SO(3)\) act on \(n\) and average \(R^*\Omega\) over the rotation group. The metric, orientation and fibres are preserved. The averaged self-dual form is invariant. At each \(n\), the rotations fixing \(n\) act trivially on the base and rotate the vertical tangent plane, so an invariant form has no mixed horizontal–vertical coefficients. Its self-dual part lies in \(\mathbb R J\), and transitivity makes the coefficient constant on each fibre. The fibre integral of the average equals the unchanged integral of \(\Omega\), so that coefficient is zero. In particular, the rotation average is identically zero throughout the product region, and for any fibrewise constant amplitude \(\lambda(\zeta)\),
\[
 \sup_{n\in S^2}|\Omega(\zeta,n)-\lambda(\zeta)J(\zeta,n)|_h\ \ge\ |\lambda(\zeta)|.
\]
This last inequality also follows by taking the norm of the averaged difference and bounding it by the supremum.

## 2. Oriented flat coordinates on the enlarged second cap

Set \(\ell=17/16\) and let \(C_2^+\) be \(C_2\) together with the exterior germ \(0\le s\le 1/16\) in its signed chart. With \(t'=1+s\) in the collar and \(\theta=2\pi t\), the frozen metric on \(C_2^+\) is
\[
 h=dt'^2+\sinh^2(t')\,d\theta^2+g_{S^2}.
\]
Indeed the exterior tensor interpolation \(H(16s-1)\) vanishes throughout that closed germ. The boundary of \(C_2^+\) is parametrized by the actual exterior mark
\[
 j(t,n)=\Phi_2(t,\ell n),\qquad t\in\mathbb R/\mathbb Z,\quad n\in S^2,
\]
with the second seven-slot path, latitude \(2\pi/3\), and coordinate framing of [E07, §§1–2](E07_MARKED_ATLAS.md#1-fixed-boundary-and-angular-indices). On the exterior product face the positive volume direction is \(dX\wedge dY\wedge\sin\phi\,d\phi\wedge d\theta\). In the attaching map the \(dt\) terms in \(dX,dY\) drop out against \(d\theta=2\pi\,dt\). The remaining volume is a positive multiple of \(dw_1\wedge dw_2\wedge dw_3\wedge dt\), where \((w_1,w_2,w_3)=(1+s)n\) are the three transverse tube coordinates. This gives the physical orientation \(ds\wedge dt\wedge dA\), also positive on the disk-first cap side. Thus \(+\partial_s\) is the outward \(h\)-unit normal, the boundary has \(+dt\wedge dA\) orientation from \(C_2^+\), and its induced metric in the mark is \(h_\partial=(2\pi\sinh\ell)^2 dt^2+g_{S^2}\).

Use the prescribed maps
\[
 w=\tanh(t'/2)e^{i\theta},\qquad \xi+ib=i\,\frac{1+w}{1-w},
 \qquad F(t',\theta,n)=(Z^0,Z^1,Z^2,Z^3)=(\xi,bn).
\]
In Cartesian disk variables, \(w\) is \(U+iV\) times the positive smooth even factor \(\tanh(t'/2)/t'\). The radial function is strictly increasing, so the \(w\)-map is a smooth orientation-preserving disk diffeomorphism onto its image, including the origin. The Cayley map has derivative \(2i/(1-w)^2\) and \(b=(1-|w|^2)/|1-w|^2>0\). Direct substitution gives
\[
 \frac{d\xi^2+db^2}{b^2}
 =\frac{4|dw|^2}{(1-|w|^2)^2}
 =dt'^2+\sinh^2(t')\,d\theta^2 .
\]
The inverse of the last map reads \(\xi=Z^0\), \(b=|(Z^1,Z^2,Z^3)|\), and \(n=(Z^1,Z^2,Z^3)/b\). The inequality \(\left|(\xi+ib-i)/(\xi+ib+i)\right|\le\tanh(\ell/2)\) becomes
\[
 \xi^2+(b-\cosh\ell)^2\le\sinh^2\ell.
\]
Thus \(F(C_2^+)\) is a smooth compact Euclidean domain with \(e^{-\ell}\le b\le e^\ell\), and both extrema occur. Since \(n\cdot dn=0\),
\[
 F^*g_{\mathrm{Eucl}}=d\xi^2+db^2+b^2g_{S^2}=b^2h,\qquad
 F^*(dZ^0\wedge dZ^1\wedge dZ^2\wedge dZ^3)
 =b^2\,d\xi\wedge db\wedge dA .
\]
The Cayley map is holomorphic with nonzero derivative, so the second identity gives the positive physical orientation. The frozen metric enters the flat equation on the interior of \(C_2^+\), up to its boundary values. Its interpolation at \(s>1/16\) lies outside this argument.

## 3. Harmonic components, trace, and strict boundary test

Let \(\widehat\Omega=(F^{-1})^*\Omega\) on the Euclidean domain. Changing a metric \(h\) to \(b^2h\) multiplies two-form inner products by \(b^{-4}\) and the volume by \(b^4\). The oriented Hodge star on two-forms is therefore unchanged. It follows that \(\widehat\Omega\) is Euclidean self-dual and closed, and \(d^*\widehat\Omega=-*d*\widehat\Omega=0\). In Cartesian coordinates, \(d=\sum_a dZ^a\wedge\partial_a\) and \(d^*=-\sum_a\iota_{\partial_a}\partial_a\), so the anticommutator of wedge and contraction gives \(dd^*+d^*d=-\sum_a\partial_a^2\). Its scalar coefficients in any fixed orthonormal flat chiral basis are harmonic. The physical norm is
\[
 |\Omega|_h=b^2|\widehat\Omega|_{\mathrm{Eucl}} .
\]

Fix the prescribed flat unit target and its pullback
\[
 \beta_0=(dZ^0\wedge dZ^1+dZ^2\wedge dZ^3)/\sqrt2,\qquad T=F^*\beta_0.
\]
The marked tangential traces are \(\tau_u=j^*Lu\) and \(\tau_0=j^*T\). On the boundary \(\xi,b\) depend only on \(t\), so the explicit target trace in these coordinates is
\[
 \tau_0=\frac{1}{\sqrt2}\left[b\,d\xi\wedge dn_1
   +b\, db\wedge(n_2\,dn_3-n_3\,dn_2)+b^2\,dn_2\wedge dn_3\right].
\]
Here \(d\xi,db\) are the boundary differentials of the prescribed Cayley formula. The identity follows by expanding \(dZ^a=n_a\,db+b\,dn_a\) for \(a=1,2,3\) and dropping \(d\xi\wedge db\) on the boundary.

For any self-dual two-form \(B\) at an oriented hypersurface with outward-first convention, its tangential two-form \(\tau\) determines it as
\[
 B=\tau+\nu^\flat\wedge *_\partial\tau.
\]
In an oriented orthonormal frame with normal first, \(*_4\tau=\nu^\flat\wedge *_\partial\tau\), and the two summands are orthogonal with equal norm. The resulting norm and inner-product factors for the restriction are \(\sqrt2\) and \(2\), respectively. Apply this to \(h\) and then use the conformal scaling to compare with the Euclidean norm:
\[
 \begin{aligned}
 |\widehat\Omega-\beta_0|_{\mathrm{Eucl}}\circ F
 &=\sqrt 2\,b^{-2}|\tau_u-\tau_0|_{h_\partial},\\
 \langle\widehat\Omega,\beta_0\rangle_{\mathrm{Eucl}}\circ F
 &=2b^{-4}\langle\tau_u,\tau_0\rangle_{h_\partial}
 \end{aligned}
\]
on the marked boundary, with the left sides restricted via \(j\).

In the Euclidean domain the scalar \(f=\langle\widehat\Omega,\beta_0\rangle_{\mathrm{Eucl}}\) is harmonic. Its minimum is bounded below by the boundary minimum. The squared norm of \(\widehat\Omega-\beta_0\) has nonnegative Euclidean Laplacian, since the Laplacian is twice the sum of the squared gradients of its harmonic coefficients. Its maximum is bounded by the boundary maximum. For both principles, adding a positive small multiple of \(|Z|^2\) to the subharmonic function (use \(-f\) for the lower bound) excludes an interior maximum, and the limit of that multiple gives the stated bound on the closed domain.

In particular, for one fixed \(u\), the sufficient **one-sided** condition and its cap margin are
\[
 \boxed{\quad
 m_u:=\min_{(t,n)\in S^1\times S^2}2b(t)^{-4}
          \langle \tau_u(t,n),\tau_0(t,n)\rangle_{h_\partial}>0
 \quad\Longrightarrow\quad
 |Lu|_h\ge e^{-17/8}m_u\quad\text{on }C_2^+ .\quad}
\]
Equivalently, \(\max 2b^{-4}\langle\tau_0-\tau_u,\tau_0\rangle_{h_\partial}<1\), since \(2b^{-4}|\tau_0|_{h_\partial}^2=1\). This test applies in particular to the fixed first input \(u_1=(e^{12}-e^{34})/\sqrt2\) at \(p\). In the full-error version, \(\varepsilon_u=\sqrt2\max b^{-2}|\tau_u-\tau_0|_{h_\partial}<1\) gives \(|Lu|_h\ge e^{-17/8}(1-\varepsilon_u)\) on \(C_2^+\).

## 4. Lower bounds and the missing input

The target \(T\) is itself an exact closed \(h\)-self-dual form on \(C_2^+\). A primitive is the pullback of
\[
 \frac{Z^0dZ^1-Z^1dZ^0+Z^2dZ^3-Z^3dZ^2}{2\sqrt2}.
\]
All its complete fibre periods vanish by Stokes. Explicitly \(T|_{S_\zeta}=(b^2/\sqrt2)n_1dA\), since \(dn_2\wedge dn_3=n_1dA\) on the oriented unit sphere. Its scalar \(J\)-coefficient is \(b^2n_1\), which vanishes on the equator \(n_1=0\), while its full physical norm is \(b^2\) with exact minimum \(e^{-17/8}\) and maximum \(e^{17/8}\). The pullback of each nonzero constant flat self-dual form is likewise a zero-free exact local model. This shows compatibility of zero-freeness with the cap equations and all fibre periods on this region.

For the actual normalized field the quantity required is the signed component of \(\tau_u=j^*Lu\) on the **outer** tube \(\Phi_2(t,(17/16)n)\). This trace must come from the coupled A1 solution on the frozen punctured boundary. Neither the flux nor the local flat model supplies its sign for \(u_1\) or another fixed input. A verified positive lower bound for \(m_u\) would supply the displayed margin through the whole second cap and its unchanged outer germ. The genuine bound for the actual field used here remains the B04 end estimate \(|Lu|_h\ge 1/2\) for unit \(u\) and \(r\ge R\), including the common end annulus. Its sufficient radius \(R\) is fixed by the finite A1 remainder constants in B04. No positive whole-cap lower bound for the actual field was obtained by these tests.
