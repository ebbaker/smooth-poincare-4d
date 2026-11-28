# SP4-POLE-E07 · Compact atlas for the frozen marked pole

28 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex assistance. Fixed E packet, request 1. The request designates GPT-6.2 Sol/ultra for dispatch. The executing helper is Codex, GPT-6 based, with exact serving variant and effort unavailable. Base 6a422ce7814fe1ad278d6904970e3b19b05a9890 and the working-tree inputs linked below. Working analytic verification for one smooth oriented Riemannian four-dimensional boundary, pending non-author replay. [Request](../research-progress/handoffs/REQUEST_E07_MARKED_ATLAS_20261127.md) · [B04](../brainstorm/notes/B04_MARKED_PILOT_20261127.md) · [Register](../research-progress/REGISTER.md)

## 1. Fixed boundary and angular indices

Write \(Y=\partial V_\delta\) for the rounded boundary of \(V=F\times D^3\), oriented outward first in ambient order \((X,Y,z_1,z_2,z_3)\). The retained exterior is \(E=Y\setminus\bigcup_i\Phi_i(S^1\times\operatorname{int}D^3)\). The free faces \(C_i=D^2\times S^2\) close it by \(a_i\). Work on the punctured closed boundary \(X=M\setminus\{p\}\) with the B04 metric \(g\), conformal metric \(h\), and input basis \(u_1,u_2,u_3\). The compact core \(K_R\) is \(M\) with the marked normal ball \(\rho<1/(2R)\) removed, with B04's sufficient radius \(R\ge32\).

Use the original ordered rows \((x^{-1},y,y,x,y^{-1},y^{-1},y^{-1})\) and \((x^{-1},y,x,x,y^{-1},x^{-1},x^{-1})\), with \(c_i(t)=L_a(\sigma H(7t-k))\) for row entry \(a^\sigma\) in slot \(k\). Here \(L_x(v)=(-1+\cos(2\pi v),\sin(2\pi v))\), \(L_y(v)=(1-\cos(2\pi v),-\sin(2\pi v))\), and \(H\) is the frozen flat step. Put \(P(\phi,\theta)=(\sin\phi\cos\theta,\sin\phi\sin\theta,\cos\phi)\). With \(\epsilon=1/16\) and \((\phi_1,\phi_2)=(\pi/3,2\pi/3)\), the original framed map is
\[
 \Phi_i(t,w)=\big(c_i(t)+\epsilon(w_1,w_2),P(\phi_i+\epsilon w_3,2\pi t)\big),\qquad |w|\le5/4.
\]
The right and left feet retain the CERT coordinates \(U=-1,+1\), respectively. Positive travel goes from right to left. Physical \(q=(X,Y),z\) agree across each foot, so the foot cuts create no additional sheet of \(Y\). In the joining strip, \(U=(a-X)/(1/8)\), and the strip height parameter is \((Y-Y_{\rm low}(X))/(Y_{\rm high}(X)-Y_{\rm low}(X))\), with the original hole and outer upper semicircle heights. These are smooth near the feet, and the forward planar Jacobian in order \((U,\text{height})\) is negative. [CERT geometry, §§1–3](../../05_certificates/notes/E06_PRESENTATION_HANDLES.md) · [Ordered data](../../05_certificates/numerics/e06_handles.json) · [CERT replay](../../05_certificates/reviews/E09_FORMAT_HANDLE_REPLAY.md)

For either sphere variable \(n\), index six patches by \(j=(k,\sigma)\), \(k\in\{1,2,3\}\), \(\sigma=\pm1\). If \((k,a,b)\) is cyclic, set
\[
 S_j(\xi,\eta)=\sigma\sqrt{1-\xi^2-\eta^2}\,e_k+\xi e_a+\sigma\eta e_b,\qquad
 S_j^{-1}(n)=(n_a,\sigma n_b).
\]
The open domain is \(\xi^2+\eta^2<1\), and the compact part \(\sigma n_k\ge1/2\) is the closed disk \(\xi^2+\eta^2\le3/4\). These parts cover the sphere since \(\max_k|n_k|\ge1/\sqrt3\). The oriented area is \(dA=d\xi\wedge d\eta/\sqrt{1-\xi^2-\eta^2}\). For a circle parameter \(t\) or \(\lambda\), use four lifted intervals \((\ell/4-1/5,\ell/4+1/5)\), \(\ell=0,1,2,3\), with compact subintervals \([\ell/4-1/6,\ell/4+1/6]\). Their projections cover the circle. A change of lift locally adds an integer. The sphere changes are \(S_{j'}^{-1}S_j\) on the open overlaps.

## 2. Cartesian caps and signed seams

**Cartesian cap pieces \(C_{ij}\).** The open chart is \((U,V,\xi,\eta)\mapsto(\zeta=(U,V),n=S_j(\xi,\eta))\) for \(|\zeta|<1\), with inverse \((\zeta,S_j^{-1}n)\). Take \(|\zeta|\le15/16\) and the compact sphere patch. These include the entire center fibers in Cartesian coordinates. The cap orientation is disk followed by sphere, since the outward normal \(n\) to the free face passes two disk directions in the standard-oriented handle.

**Signed seam pieces \(T_{i\ell j}\).** Use \((s,t,\xi,\eta)\) on \(|s|<3/16\), with \(n=S_j(\xi,\eta)\) and \(t\) in its lift. Write \(m(t)=(\cos 2\pi t,\sin 2\pi t)\). The two sides are
\[
 \Psi_i(s,t,n)=
 \begin{cases}
 ((1+s)m(t),n)\in C_i,&s\le0,\\
 \Phi_i(t,(1+s)n)\in E,&s\ge0.
 \end{cases}
\]
They agree at zero by \(a_i(m(t),n)=\Phi_i(t,n)\). This uses the source's signed collar formulas also on a slightly larger open band, since \(1+3/16<5/4\) and the cap radial variable stays positive. Take \(|s|\le1/8\) and the two compact angular patches. The exterior side includes the full metric transition \(1/16\le s\le1/8\) and its joins.

On the cap the inverse reads \(s=|\zeta|-1\), \(t=\arg(\zeta)/(2\pi)\) in its lift, and \(n\) unchanged. On the exterior, with physical sphere point \(N=P(\phi,\theta)\), it reads
\[
 t=\arg(N_1+iN_2)/(2\pi),\quad
 w=\epsilon^{-1}(q-c_i(t),\arccos N_3-\phi_i),\quad
 s=|w|-1,\quad n=w/|w|.
\]
Longitude is a valid circle coordinate in each of the two disjoint attaching bands. Its inverse remains smooth at all planar repetitions and stationary slot joins. At \(s=0\), \(w=n\), giving \(a_i^{-1}\). Reinstating the cradle uses precisely \(\Phi_i(t,(1+s)n)\) on \(s\le0\) and the same inverse on that side, preserving the longitude and the coordinate framing.

The orientation on the exterior sphere face is that of \((X,Y,\phi,\theta)\). The derivative \(d\theta=2\pi\,dt\) crosses three transverse factors, so the pullback has the sign of
\[
 -dt\wedge dw_1\wedge dw_2\wedge dw_3
   = |w|^2\,ds\wedge dt\wedge dA .
\]
The raw attaching coordinates reverse orientation. The tangent-first transverse convention changes the sign of \(w_3\). The actual attachment uses the CERT coordinate framing, whose reference-spin extension is the one checked by the CERT lift comparison. Cap polar coordinates likewise give positive \(ds\wedge dt\wedge dA\). The outward normals at zero are \(+\partial_s\) for the cap and \(-\partial_s\) for the exterior. Their seam orientations are \(+dt\wedge dA\) and \(-dt\wedge dA\), respectively, at both seams. The restored cradle has the cap's sign. [CERT framing and collar](../../05_certificates/notes/E06_PRESENTATION_HANDLES.md#framed-handles-and-the-two-collar-identifications) · [CERT spin replay](../../05_certificates/reviews/E09_FORMAT_HANDLE_REPLAY.md#marked-smooth-replay)

For a cap frame write \(\tau=|\zeta|\), \(\theta=2\pi t\). Use the frozen \(a_i(\tau)\) and connection \(A_i\), so that \(D n=dn+A_i\times n\) and the metric is \(d\tau^2+a_i^2d\theta^2+|D n|^2\). For the radial and tangential disk projections \(P_r,P_t\), an oriented orthonormal coframe is
\[
 (P_r+(a_i/\tau)P_t)d\zeta,\qquad
 \langle E_3,D n\rangle,\quad\langle E_4,D n\rangle,\qquad
 E_3=\frac{\partial_\xi S_j}{|\partial_\xi S_j|},\quad E_4=n\times E_3 .
\]
The first term supplies two entries. For \(C_1\) the planar block is the identity and \(A_1=0\) near \(\tau=0\). For \(C_2\) the connection is zero, and \((\sinh(\tau)/\tau-1)/\tau^2\) is smooth and even, which removes the apparent singularity in \(P_t\). Both coframes are smooth at the centers. On the shared germ \(|s|<1/16\), the oriented orthonormal coframe has entries \(ds\), \(a_i(1+s)2\pi dt\), and the two sphere coframe entries applied to \(dn\). The frozen radial factors are \(a_1(1+s)=\sinh(1-s)\), \(a_2(1+s)=\sinh(1+s)\). The connection vanishes throughout the cap part of the larger signed chart, and the same polar coframe works there.

On the exterior signed chart the original \(g_0\) is \(|dq|^2+d\phi^2+\sin^2\phi(2\pi dt)^2\). Use exactly the original tensor sum between this metric and the seam germ, with \(H(16s-1)\). This is \(g_0\) from \(s=1/8\) on. The actual unit normal toward increasing \(s\) in the band is
\[
 \nu_s=\frac{\partial_s-\sum_{k=1}^3(C^{-1}b)_k\partial_{\upsilon_k}}{\sqrt{A-b^T C^{-1}b}},
 \qquad
 G=\begin{pmatrix}A&b^T\\b&C\end{pmatrix},\quad \upsilon=(t,\xi,\eta).
\]
Here \(A=1-H(16s-1)+H(16s-1)\epsilon^2\), and \(b=(H(16s-1)\epsilon\,c_i'(t)\cdot (n_1,n_2),0,0)^T\), since \(n\cdot dn=0\). On the product germ this normal is \(\partial_s\). The metric on the caps and signed charts is also \(h\). [07 trial, exact cap and band metrics](../../../investigations-1/07_positive_subcritical_entry/notes/MARKED_CONNECTION_ASSEMBLY.md#one-whole-smooth-trial)

## 3. Exterior faces and rounded charts

Let \(\alpha=0,1,2\) label the outer circle and two holes. Their centers \(o_\alpha\) are \((0,0),(-1,0),(1,0)\), radii \(r_\alpha\) are \(4,1/4,1/4\), and signs \(\kappa_\alpha\) are \(-1,+1,+1\), respectively. Near each original corner write
\[
 q=o_\alpha+(r_\alpha+\kappa_\alpha B)m(\lambda),\qquad z=(1-D)N .
\]
Here \(B=b(q)=\kappa_\alpha(|q-o_\alpha|-r_\alpha)\) in the planar collar, and \(D=d(z)=1-|z|\). The collars of width \(3\delta\), with \(\delta=1/128\), are disjoint and \(|q-o_\alpha|>0\) in each. Every enlarged attaching tube stays at least \(43/64\) from the hole boundaries and \(123/64\) from the outer circle. Thus these collars miss the attaching tubes and the puncture neighborhood.

**Sphere face pieces \(P_j\).** Use \((X,Y,\xi,\eta)\mapsto(q,S_j(\xi,\eta))\) with \(b(q)>\delta\) and outside the closed unit tubes and the pole. The inverse reads \((q,S_j^{-1}N)\). The compact restriction uses \(b(q)\ge3\delta/2\), the compact sphere patch, \(K_R\), and the complement of the open tubes of radius \(17/16\). These pieces overlap the exterior signed collars for \(1/16<s<1/8\). The ambient outward normal is \((0,N)\) and the raw chart orientation is positive.

**Side face pieces \(D_{\alpha\ell}\).** Use \((\lambda,z)\mapsto(o_\alpha+r_\alpha m(\lambda),z)\) with \(|z|<1-\delta\). The inverse reads the angle of \(q-o_\alpha\) and the Cartesian \(z\). Take \(|z|\le1-3\delta/2\) and the compact circle patch. In particular \(z=0\) is covered. The outward normal is \((-\kappa_\alpha m,0)\), so the raw \((\lambda,z_1,z_2,z_3)\) orientation has sign \(-\kappa_\alpha\).

**Rounded pieces \(B_{\alpha\ell j}\) and \(D^{\rm rd}_{\alpha\ell j}\).** Put
\[
 b_*=\delta\frac{\log 2}{1+\log 2},\qquad
 f(T)=\delta\frac{-\log(1-\psi(T/\delta))}{1-\log(1-\psi(T/\delta))}\quad(T>0).
\]
This is the single graph solving the exact equation \(\psi(B/\delta)+\psi(D/\delta)=1\) when one distance \(T\) is strictly positive. Indeed \(\psi^{-1}(a)=-\log a/(1-\log a)\) for \(0<a\le1\), and \(f\) is smooth at \(\delta\), where its value and all derivatives are zero by flatness of \(\psi\) at 1. The \(B\)-chart takes \(B\in(b_*/2,3\delta)\) free and \(D=f(B)\); the \(D^{\rm rd}\)-chart takes \(D\) in that same interval free and \(B=f(D)\). Both use the displayed ambient product map with the lifted \(\lambda\) and \(N=S_j(\xi,\eta)\). The inverse reads the free distance, the angle of \(q-o_\alpha\), and \(S_j^{-1}(z/|z|)\), with \(|z|>0\) throughout. The compact pieces use \([b_*,2\delta]\) and the compact angular patches. Every active corner point has \(B\ge b_*\) or \(D\ge b_*\), since both being smaller would make the sum exceed one. These pieces contain the flat joins at \(B=\delta,D=0\) and \(B=0,D=\delta\), and extend into the original faces.

The outward ambient normal is parallel to
\[
 \delta^{-1}\big(\kappa_\alpha\psi'(B/\delta)m,-\psi'(D/\delta)N\big).
\]
At least one term is nonzero everywhere on the defining level. The same gradient gives the original face normals at the flat joins, using the smooth extension of \(\psi\) near zero with \(\psi'(0)=-1\). In order \((B,\lambda,D,\xi,\eta)\) the ambient volume has sign \(-\kappa_\alpha\). On the first graph decreasing \(D\) at fixed \(B\) is transverse outward, so the raw \((B,\lambda,\xi,\eta)\) orientation has sign \(\kappa_\alpha\). On the second graph decreasing \(B\) is transverse outward, so the raw \((D,\lambda,\xi,\eta)\) orientation has sign \(-\kappa_\alpha\). On the common graph region \(f'(B)=-\psi'(B/\delta)/\psi'(D/\delta)<0\), confirming the relative sign. The exterior metric is the induced Euclidean \(g_0=h\) on these charts near the corners. [CERT rounding, §1](../../05_certificates/notes/E06_PRESENTATION_HANDLES.md#one-zero-handle-and-its-two-one-handles)

## 4. Marked chart and compact cover

**Marked piece \(N_p\).** In the frozen product exponential chart, \(y=(X,Y,y_3,y_4)\), \(v=\sqrt{y_3^2+y_4^2}\), \(\rho=|y|\), and
\[
 (q,N)=\big((X,Y),\cos(v)e_3+\operatorname{sinc}(v)(y_3,y_4,0)\big),\qquad 0<\rho<1/4.
\]
The inverse reads \((X,Y)\) and \((y_3,y_4)=(v/\sin v)(N_1,N_2)\), where \(v=\arccos N_3\) and the expression continues smoothly at the north pole. For \(|q|<1/4\) the distance to either hole boundary is at least \(1/2\), and \(v<1/4\) avoids both enlarged latitude bands. The compact piece \(1/(2R)\le\rho\le1/8\) overlaps the product pieces and contains \(R\le r\le 2R\) in the inverted end variable \(r=|x|\), \(x=y/\rho^2\).

The conformal orthonormal coframe is
\[
 e_h=\rho^{-2\theta(\rho)}\operatorname{diag}(I_2,P_r+\operatorname{sinc}(v)P_t)\,dy ,
\]
using the sphere block radial and tangential projections with smooth continuation at \(v=0\). The outward \(h\)-unit normal at the inner core boundary is \(-\rho^{2\theta(\rho)}\partial_\rho\). The coframe for \(g\) at \(p\) is \(dy\), with the same positive derivative as \(P_{(3,+)}\). The inverse inversion has derivative \(D_xy=r^{-2}(I-2\hat x\hat x^T)\), reversing the raw coordinate orientation. The leading columns \(\beta_k\) therefore have precisely the coefficients of \(u_k\) in raw \(dx\), anti-self-dual for the usual Euclidean \(x\)-orientation and self-dual for the physical one. On \(r\ge16\), inserting \(D_xy\) in \(e_h\) cancels the scalar conformal factor, leaving the same block matrix followed by \(I-2\hat x\hat x^T\). B04's far-end bound on the common region uses the same input coefficients. [B04, mark and truncation](../brainstorm/notes/B04_MARKED_PILOT_20261127.md) · [A1, §1 and expansion](E01_A1.md)

There are \(12+48+6+12+144+1=223\) indexed compact sets, each contained in its stated open chart. The cap pieces reach \(\tau=15/16\); the signed seam pieces start at \(\tau=7/8\) in each cap and extend all the way through the exterior band. The original sphere face with \(b(q)\ge3\delta/2\) is in the product pieces unless a retained point is inside an excluded \(17/16\)-radius tube, in which case \(0\le s<1/16\) places it in the signed seam pieces. The remaining original sphere face has \(\delta\le B\le3\delta/2\) and is in the \(B\)-pieces. The original side faces with \(D\ge3\delta/2\) are in the \(D_{\alpha\ell}\) pieces, and their portions with \(\delta\le D\le3\delta/2\) are in the \(D^{\rm rd}\) pieces. The active corner arcs lie in the two graph families by the threshold argument. These cases exhaust the rounded boundary because on either old face its corresponding \(\psi\) is 1, while away from old faces the smoothed boundary is the stated level. The normal annulus adds the common end region. All cuts are closed and bounded, yielding the asserted compact cover of \(K_R\).

## 5. Transition and two-form rules

Transitions are between the open chart domains. Angular changes within any chart type use §1, and the following substitutions, together with their inverses, apply on the indicated open overlaps. Their restrictions give all transitions at intersections of compact-piece edges.

| Overlap | Forward map and inverse |
| --- | --- |
| Cap and signed seam | \((\zeta,n)\leftrightarrow(s,t,n)\) by \(s=\lvert\zeta\rvert-1,\ t=\arg(\zeta)/(2\pi)\) and \(\zeta=(1+s)m(t)\). |
| Signed seam and exterior | \((s,t,n)\leftrightarrow(q,N)\) by \(\Phi_i(t,(1+s)n)\) and the \(w,t\) recovery in §2. |
| Rounding graph pair | \((B,\lambda,N)\leftrightarrow(D,\lambda,N)\) by \(D=f(B)\) and \(B=f(D)\) when both distances are positive. |
| \(B\)-graph and sphere face | \(q=o_\alpha+(r_\alpha+\kappa_\alpha B)m(\lambda)\) with \(z=N\); recover \(B=b(q)\) and the angle of \(q-o_\alpha\). The overlap has \(D=0\). |
| \(D^{\rm rd}\)-graph and side face | \((D,\lambda,N)\leftrightarrow(\lambda,z)\) by \(z=(1-D)N\), \(D=1-\lvert z\rvert\), \(N=z/\lvert z\rvert\). The overlap has \(B=0\). |
| Marked chart, exterior and end | Use the product exponential and its inverse of §4, and \(x=y/\rho^2\) with inverse \(y=x/r^2\). |

For the cap transition, \(d\zeta=m(t)ds+2\pi(1+s)m_\perp(t)dt\), with \(ds=(U\,dU+V\,dV)/|\zeta|\) and \(2\pi dt=(U\,dV-V\,dU)/|\zeta|^2\). In the cap coframe the planar entries are the rotation through \(2\pi t\) of \((ds,a_i(1+s)2\pi dt)\) on the cap overlap, with the same sphere entries in a common sphere chart.

For the exterior transition,
\[
 dq=c_i'(t)dt+\epsilon\big((n_1,n_2)ds+(1+s)d(n_1,n_2)\big),\qquad
 d\phi=\epsilon\big(n_3ds+(1+s)dn_3\big),\qquad
 dN=P_\phi d\phi+2\pi P_\theta dt .
\]
The inverse uses \(2\pi dt=(N_1dN_2-N_2dN_1)/(N_1^2+N_2^2)\), \(d\phi=-dN_3/\sin\phi\), \(ds=n\cdot dw\), and \(dn=(I-nn^T)dw/|w|\), with \(dw\) differentiating the displayed recovery formula. A local change of longitude lift leaves the tangent map unchanged. By the flat step, \(c_i\) is smooth across all seven slot endpoints and the periodic cut.

The rounding changes use \(dq=\kappa_\alpha m\,dB+2\pi(r_\alpha+\kappa_\alpha B)m_\perp\,d\lambda\), \(dz=-N\,dD+(1-D)dN\), and \(dD=f'(B)dB\) on the common interior. At a flat join the free-distance graph and the original face have matching derivatives to every order by flatness of \(f\). The marked overlap uses the derivative of the given product exponential and the explicit inversion derivative.

For any raw chart coordinate column \(y_j\) let \(G_j\) be the matrix of \(h\) from its metric pullback, and let \(D_j=\operatorname{diag}(\varepsilon_j,1,1,1)\) for the raw orientation sign \(\varepsilon_j\) computed above. Then \(e_j=D_j G_j^{1/2}dy_j\) is a smooth, oriented orthonormal coframe. The cap and marked coframes already given are alternative choices. If \(e_j=E_jdy_j\) and \(y_k=T(y_j)\), then
\[
 J=DT,\qquad e_k=Qe_j,\qquad Q=E_k J E_j^{-1}\in SO(4).
\]
A two-form with antisymmetric raw matrices \(B_j,B_k\) satisfies \(B_j=J^T B_kJ\). In the oriented orthonormal frames the rule is \(\mathcal B_j=Q^T\mathcal B_k Q\). The three components in the self-dual basis
\[
 (e^{12}+e^{34},\ e^{13}-e^{24},\ e^{14}+e^{23})/\sqrt2
\]
are obtained by restricting that action to the three displayed basis forms. This preserves chirality and the two-form norm. The raw Hodge star uses the physical orientation sign of its chart, including the reversal at inversion. All changes act on the target two-form indices of each \(Lu_k\), using a single fixed coefficient vector in the input basis at \(p\).

This proves coverage and tensor matching for the frozen \((M,g,p,h)\) at the sufficient unevaluated B04 radius. The argument uses the project formulas and no additional imported theorem. The magnitude of the actual A1 field on the compact pieces is left to E08.
