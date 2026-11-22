# Geometry audit for the manuscript

All statements below are local in the holomorphic category. Shrink to a simply connected coordinate neighborhood when discussing holonomy or choosing parallel fields. Set

\[
N=\begin{pmatrix}0&0\\1&0\end{pmatrix},\qquad
g_H=2du\,dv+2dz\,dw+H(u,z)du^2.
\]

## Intrinsic class and normal form

**Proposition.** A holomorphic metric in complex dimension four has two pointwise independent parallel vector fields spanning a totally null plane if and only if it admits local coordinates in which it is \(g_H\) for a holomorphic function \(H\). In neutral real geometry this is the strict Walker class. A parallel null plane alone is a weaker condition and does not suffice.

**Proof of necessity.** Let \(X,Y\) be the parallel null fields, with \(g(X,Y)=0\). Their dual forms \(\alpha=g(X,\cdot)\), \(\beta=g(Y,\cdot)\) are independent and parallel. Torsion-freeness makes them closed, so choose local holomorphic functions \(u,z\) with \(\alpha=du\), \(\beta=dz\). The common kernel of \(du,dz\) is the null plane \(\operatorname{span}(X,Y)\): it is the orthogonal complement of that plane, which equals the plane itself in dimension four. Also \([X,Y]=\nabla_XY-\nabla_YX=0\). Holomorphic Frobenius/commuting-flow coordinates therefore give \(X=\partial_v,Y=\partial_w\), retaining \(u,z\) as the transverse coordinates. Since \(g(\partial_v,\cdot)=du\) and \(g(\partial_w,\cdot)=dz\), the metric has form

\[
g=2du\,dv+2dz\,dw+Adu^2+2Cdu\,dz+Bdz^2.
\]

Parallel fields are Killing, so \(A,B,C\) are independent of \(v,w\). Choose local holomorphic primitives \(G,F\) satisfying

\[
G_z=B/2,\qquad F_z=C-G_u.
\]

Put \(V=v+F(u,z)\), \(W=w+G(u,z)\). Substitution of \(dv=dV-F_u du-F_z dz\) and \(dw=dW-G_u du-G_z dz\) gives

\[
g=2du\,dV+2dz\,dW+(A-2F_u)du^2.
\]

Relabel \(V,W\) as \(v,w\) and set \(H=A-2F_u\). Conversely, the Christoffel symbols below immediately show that \(\partial_v,\partial_w\) are parallel and span a totally null plane. This proves the proposition.

This is an elementary coordinate refinement of the standard strict Walker form, rather than a new classification of Walker metrics. Primary reference: J. C. Díaz-Ramos, E. García-Río, R. Vázquez-Lorenzo, *Four-dimensional Osserman metrics with nondiagonalizable Jacobi operators*, J. Geom. Anal. **16** (2006), 39–52, DOI 10.1007/BF02930986, [arXiv:math/0507556](https://arxiv.org/pdf/math/0507556), Remark 3 (PDF p. 11), together with equation (3). The reference gives the neutral real version; the proof above supplies the holomorphic local statement directly.

## Holonomy equivalence

Let \(\mathcal P\) be a maximal totally null two-plane in a complex orthogonal four-space. Its pointwise stabilizer in \(SO(4,\mathbb C)\) is a one-dimensional unipotent subgroup. To see this, choose a Witt decomposition \(V=\mathcal P\oplus\mathcal P^*\), with metric matrix \(\begin{psmallmatrix}0&I\\I&0\end{psmallmatrix}\). An isometry fixing \(\mathcal P\) pointwise must have block form

\[
\begin{pmatrix}I&C\\0&I\end{pmatrix},\qquad C^T=-C.
\]

Skew two-by-two matrices form a one-dimensional space, and these isometries are unipotent. Conversely, this group fixes \(\mathcal P\) pointwise. On a simply connected neighborhood the holonomy principle makes the following equivalent:

1. Two independent parallel null vector fields spanning a totally null plane.
2. Holonomy contained in the pointwise stabilizer of such a plane.
3. After choosing the appropriate spin chirality, restricted spin holonomy contained in \(\{I+tN\}\times\{I\}\subset SL(2,\mathbb C)\times SL(2,\mathbb C)\).

The spin chirality is selected by the null-plane family; interchanging the two families interchanges the spin factors. The connected spin lift has no ambiguity from the discrete kernel locally. The displayed metric conventions choose the unprimed factor to carry \(N\).

For \(g_H\), the connection is scalar-valued in the fixed Lie algebra \(\mathbb C N\). Its holonomy is trivial when \(H_{zz}\equiv0\), and its restricted complex holonomy is the full one-dimensional unipotent group when \(H_{zz}\not\equiv0\) on the connected neighborhood. Indeed, all parallel transports belong to that group; a nonzero curvature value spans its Lie algebra. This is strictly smaller than generic complex hyperkähler holonomy \(SL(2,\mathbb C)\).

Taking the coordinates and \(H\) real gives neutral signature \((2,2)\). Nonflat members do not admit a compatible Riemannian real slice: a nontrivial unipotent holonomy subgroup cannot lie in a compact unitary holonomy group. An alternative argument is that the curvature operator of a positive-definite metric is self-adjoint, whereas the nonzero curvature here is nilpotent. Avoid calling these nonflat Riemannian hyperkähler examples.

## Levi–Civita connection and curvature

The coordinate metric and inverse are

\[
(g_{ij})=\begin{pmatrix}H&1&0&0\\1&0&0&0\\0&0&0&1\\0&0&1&0\end{pmatrix},
\qquad
(g^{ij})=\begin{pmatrix}0&1&0&0\\1&-H&0&0\\0&0&0&1\\0&0&1&0\end{pmatrix},
\]

in the order \((u,v,z,w)\), and \(\det g=1\). The only nonzero coordinate Christoffel symbols are

\[
\Gamma^v_{uu}=H_u/2,\qquad
\Gamma^v_{uz}=\Gamma^v_{zu}=H_z/2,\qquad
\Gamma^w_{uu}=-H_z/2.
\]

For the curvature convention

\[
R^a{}_{bcd}=\partial_c\Gamma^a{}_{db}-\partial_d\Gamma^a{}_{cb}
+\Gamma^a{}_{ce}\Gamma^e{}_{db}-\Gamma^a{}_{de}\Gamma^e{}_{cb},
\]

the independent curvature component is \(R_{uzuz}=-H_{zz}/2\). Equivalently, if \(\Omega=du\wedge dz\),

\[
R_{abcd}=-\tfrac12H_{zz}\Omega_{ab}\Omega_{cd}.
\]

All contractions vanish, since the indices \(u,z\) only contract nontrivially against \(v,w\), which do not occur in this tensor. Thus \(\operatorname{Ric}=0\), and \(W=R\). With volume form \(du\wedge dv\wedge dz\wedge dw\), \(*\Omega=-\Omega\), hence the metric is ASD in the stated convention. It is flat exactly when \(H_{zz}=0\).

Choose

\[
\theta^{AA'}=\begin{pmatrix}du&dz\\-dw&dv+Hdu/2\end{pmatrix}.
\]

Then \(g=2(\theta^{00'}\theta^{11'}-\theta^{01'}\theta^{10'})\). The spin connection is

\[
\Gamma^A{}_B=\tfrac12H_z\,du\,N^A{}_B,\qquad \Gamma^{A'}{}_{B'}=0.
\]

Both preserve their skew forms. All torsion equations vanish: the only nonzero exterior derivative is \(d\theta^{11'}=(H_z/2)dz\wedge du\), canceled by \(\Gamma^1{}_0\wedge\theta^{01'}\). The unprimed curvature is \((H_{zz}/2)dz\wedge du\,N\); its apparent sign relative to \(R_{uzuz}\) follows from the displayed conventions and index positions.

## Alpha distribution and Shaw map

The dual frame is

\[
e_{00'}=\partial_u-\tfrac12H\partial_v,\quad e_{01'}=\partial_z,
\quad e_{10'}=-\partial_w,\quad e_{11'}=\partial_v.
\]

Because the primed spin connection vanishes, the affine projective spinor coordinate \(\zeta\) is horizontally constant and

\[
L_0=\partial_u-\tfrac12H\partial_v+\zeta\partial_z,\quad
L_1=-\partial_w+\zeta\partial_v
\]

span the alpha distribution. They commute; the \(H\) coefficient is independent of \(v,w\).

Let \(J\) solve \((\partial_u+\zeta\partial_z)J=H/2\), with \(J\) independent of \(v,w\). Then

\[
p=z-\zeta u,\quad q=v+\zeta w+J
\]

are first integrals. The usual tangent-incidence construction for \(\omega=(p,q)\), \(\pi_{A'}=(1,\zeta)\), gives

\[
a=z,\quad b=-u,\quad c=v+J-\zeta J_\zeta,\quad d=w+J_\zeta.
\]

The inverse first recovers \(u=-b,z=a\), then solves the affine equations for \(v,w\). It is therefore locally biholomorphic wherever \(J\) is holomorphic, with no assumption on \(J_{\zeta\zeta}\).

For a fixed source point,

\[
\frac{d}{d\zeta}(a,b,c,d)=J_{\zeta\zeta}(0,0,-\zeta,1).
\]

This is null for \(\eta=2(da\,dd-db\,dc)\), but can vanish. The manuscript must say that the trajectory is immersed where \(J_{\zeta\zeta}\ne0\). For \(H=z^2\), \(J_{\zeta\zeta}=u^3/3\), so all trajectories with \(u=0\) are stationary even though the correspondence map remains locally invertible. The usual Shaw denominator is nonzero on the affine direction chart; degeneration of the resulting trajectory is a distinct issue.

Put \(K_0=\partial_b-\zeta\partial_a\), \(K_1=\partial_d-\zeta\partial_c\), and \(h=-J_z\). Differentiating the equation for \(J\) with respect to \(\zeta\) yields \((\partial_u+\zeta\partial_z)J_\zeta=-J_z\). Therefore

\[
f_*L_0=-K_0+hK_1,\qquad f_*L_1=-K_1.
\]

This verifies distribution preservation, with target homogeneous primed direction \((-\zeta,1)\).

## Transport and the tangent-spinor distinction

Using the original spin frame to identify the abstract fibers, inverse pullback gives exactly

\[
A_H=-\tfrac12H_z(-b,a)db\,N,\qquad
F_{A_H}=-\tfrac12H_{zz}(-b,a)da\wedge db\,N.
\]

There is no direction component. Hence the auxiliary bundle connection descends and extends across every projective direction wherever \(H\) is holomorphic in \((-b,a)\). It is ASD for \(\eta\), since its curvature vanishes on every \(\operatorname{span}(K_0,K_1)\). It has the desired expression with \(\Gamma_{01'}=-H_z(-b,a)N/2\) and all other coordinate coefficients zero.

The differential identifies source unprimed alpha-tangent components with target ones through

\[
T=-I+hN,\qquad h=-J_z.
\]

Under \(\nu=T\lambda\), the connection becomes \(T\Gamma T^{-1}-dT\,T^{-1}=\Gamma+dh\,N\). The relation \(L_0h=-H_z/2\), \(L_1h=0\) makes this transformed connection vanish along the two alpha generators. It does not make the full connection flat. For the quadratic example \(h=ab+\zeta b^2/2\), and the transformed full form is

\[
\bigl(b\,da+\zeta b\,db+\tfrac12 b^2d\zeta\bigr)N.
\]

Its curvature remains \(-da\wedge db\,N\). This form is not the pullback of a spacetime one-form because of its direction dependence and \(d\zeta\) term. The matrix \(T\) has a pole at \(\zeta=\infty\) for generic \(b\), so it is not a regular gauge transformation between the globally extended bundles. The theorem should therefore assert an auxiliary chiral bundle, not a globally regular identification with target tangent spinors.

## Recovery and residual freedoms

In the displayed fixed gauge, write \(A=-\Phi(a,b)db\,N\). Then \(H_z(u,z)=2\Phi(z,-u)\), and

\[
H(u,z)=2\int_{z_0}^z\Phi(t,-u)dt+f(u).
\]

The ambiguity is an isometry: if \(F'(u)=f(u)/2\), the substitution \(V=v+F(u)\) pulls back \(g_H\) to \(g_{H+f}\). Thus this is recovery within the ansatz and chosen coordinate/gauge identification. It is not yet a reconstruction from arbitrary gauge-equivalence classes on an unmarked flat domain. General changes of base coordinates, spin frame, and normal-form choices must be tracked for such a theorem.

## Complete-fiber rigidity

The proposed rigidity statement is correct as written, and does not require global injectivity of the map. Let \(M_0\) lie in one holomorphic coordinate chart. Suppose \(\Psi:U\times\mathbb{CP}^1\to\mathbb P(S')|_{M_0}\) is holomorphic, locally biholomorphic, and maps the flat alpha distribution to the curved one. For each \(y\), coordinate functions of \(p_M\Psi(y,\cdot)\) are holomorphic on the compact sphere, hence constant. Thus \(p_M\Psi=f\circ p_U\). The rank of \(dp_M\circ d\Psi\) is four, so \(df\) is invertible. Restriction of \(\Psi\) to each direction sphere is a local biholomorphism \(\mathbb{CP}^1\to\mathbb{CP}^1\), hence a Möbius isomorphism. Therefore \(df\) carries the whole family of flat alpha planes onto the curved family, preserving null cones. Two nondegenerate quadratic forms on a complex four-space with the same null cone are proportional, giving a local conformal map. Hence \(W=0\) on the projected image. The converse uses local conformal coordinates and a spin lift.

Important restrictions: (a) a single-valued holomorphic inverse over the entire target sphere is needed; range coverage is not enough; (b) the projected image must stay in one curved coordinate neighborhood; (c) mere bundle gluing is not governed by this theorem; (d) no general ASD or special-holonomy failure is proved by this argument. In the present nonflat strict Walker class, the theorem shows precisely why the geometric inverse must fail at some direction while the bundle extension can succeed.
