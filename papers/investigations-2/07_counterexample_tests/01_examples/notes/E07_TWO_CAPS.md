# WEX-E07 · Two cap belts and the Whitehead boundary sum

28 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex assistance, on checkout `e171829f1c59a8a1fc66a2f1bd7ff42b2037aa6b`. Fixed E07 revision 1. Exact serving variant and effort are unavailable. This is a working smooth construction in the one original marked puncture \(W\) of \(\Sigma_P\). It gives a proper disk for the signed latitude unknot and a separate proper genus-one surface for \(J=D_+(T_{2,3},2)\). Each has two intersections of opposite signs with each original belt sphere. [Frozen request](../../research-progress/handoffs/REQUEST_TWO_CAPS_R1.md) · [WEX-E04](E04_NATIVE_SURFACE.md)

## The second tether

Keep the local pole ball \(B\), first tether, puncture radius \(r=1/16\), and outward mark \(\iota(u)=\chi(rR(u))\), \(R(u)=(-u_1,u_2,u_3,u_4)\), of E04. Set \(v_0=1/32\), \(s_0=1/16\), \(\epsilon=1/16\), \(\lambda=\epsilon(1+s_0)=17/256\), and \((\phi_1,\phi_2)=(\pi/3,2\pi/3)\), measuring \(\phi\) from the north pole. Define the two 3-balls \(A_1,A_2\) by the disk \(|\zeta|\le1+s_0\) times \(n(v)=(\sin v,0,-\cos v)\), using
\[
 I_1=[-v_0,\pi+v_0],\qquad I_2=[-v_0,v_0].
\]
The interval \(I_1\) has length less than \(2\pi\), so \(n\) is an embedded arc on each interval. In \(C_i=D^2\times S^2\), use \((\zeta,n(v))\) for \(|\zeta|\le1\). For \(\zeta=(1+s)m(t)\), \(0\le s\le s_0\), use the exterior point
\[
 \Phi_i(t,(1+s)n(v))
 =\left(c_i(t)+\epsilon(1+s)(\sin v,0),\
 P\big(\phi_i-\epsilon(1+s)\cos v,2\pi t\big)\right).
\]
These are smooth across both seams, where the signed chart in each case has the same condition \(n=n(v)\) on both sides. Its inverse preserves \(t,n\). The cap centers use Cartesian \(\zeta\). The exterior parts of the balls lie in the two disjoint radius-\(1+s_0\) tubes, and have disjoint latitude intervals \([\phi_i-\lambda,\phi_i+\lambda]\). The local ball \(B\) stays within \(\rho\le1/6\). The first tether is unchanged because the enlargement of \(I_1\) leaves its entire attaching neighborhood at \(v=0\) as in E04. Its open track satisfies \(\phi<1\) even on the rounding support and it clears the enlarged radius of \(A_1\) until the attaching disk. [CERT E06, seam and inverse](../../../05_certificates/notes/E06_PRESENTATION_HANDLES.md#framed-handles-and-the-two-collar-identifications) · [POLE E07, signed charts](../../../01_chiral_transfer_and_pole_forms/notes/E07_MARKED_ATLAS.md#2-cartesian-caps-and-signed-seams) · [E04, first tether](E04_NATIVE_SURFACE.md#a-handle-with-explicit-endpoint-frames)

For the second handle, write \(x=X\), \(\theta=2\pi t\), with the smooth longitude lift near zero in the sphere face, and let \(c_{iX},c_{iY}\) denote the components of \(c_i(t)\). Put
\[
 d_1(x,\theta)=\phi_1+\sqrt{\lambda^2-(x-c_{1X}(t))^2},\qquad
 d_2(x,\theta)=\phi_2-\sqrt{\lambda^2-(x-c_{2X}(t))^2}.
\]
These are the \(s=s_0\) graphs near \(v=\pi\) for \(A_1\) and \(v=0\) for \(A_2\). Use the original flat step \(H\) extended by its constant endpoint values and put \(\gamma(h)=H(2h-1/2)\). On \(|x|,|\eta|,|\theta|<1/1024\), \(-1/1024<h<1+1/1024\), define the sphere-face chart
\[
 G(h,x,\eta,\theta)=
 \left(x,\ \eta+(1-\gamma(h))c_{1Y}(t)+\gamma(h)c_{2Y}(t),\
 d_1(x,\theta)+h(d_2(x,\theta)-d_1(x,\theta)),\ \theta\right)
\]
in order \((X,Y,\phi,\theta)\). The same flat-step estimate as in E04 gives \(|c_i(t)|\le2\pi e^{-510}<1/4096\) for each component. In fact \(7t\) is within \(1/512\) of a slot endpoint and either circle satisfies \(|L_j(u)|=2|\sin(\pi u)|\). Thus \(|x-c_{iX}|<1/512\) and
\[
 0<\pi/3-2\lambda\le d_2-d_1\le \pi/3-2\lambda+1/256<1 .
\]
The inverse reads \(X,\theta\), obtains \(h=(\phi-d_1)/(d_2-d_1)\), then subtracts the known \(Y\)-shift. It is a smooth chart. The second handle is \(G(h,x,0,\theta)\) for \(0\le h\le1,\ x^2+\theta^2\le(1/4096)^2\). At \(x=\theta=0\) it follows the prescribed \(q=0,\theta=0\) meridian interval \([\phi_1+\lambda,\phi_2-\lambda]\).

Throughout the chart \(\phi>1\) and \(|q|<1/256\), with \(\phi<\pi\), so it misses the first tether and its rounding, the pole ball, and the side and rounded faces. For \(0<h<1\) we have \(\phi>d_1\) and \(\phi<d_2\). Thus
\[
 (x-c_{iX})^2+(\phi-\phi_i)^2>\lambda^2,\qquad i=1,2.
\]
This clears each full radius-\(1+s_0\) tube before adding the nonnegative squared \(Y\)-offset. At the left endpoint equality holds for cap 1, with \(Y=c_{1Y}(t)\), and at the right endpoint for cap 2, with \(Y=c_{2Y}(t)\). Because \(\gamma\) is constant near the ends, the handle and each ball are in their common slices \(Y=c_{iY}(t)\). The ball lies on the \(h\le0\) side at cap 1 and \(h\ge1\) at cap 2 in those slices. In an extension of width \(1/1024\), the transverse physical norm at either end exceeds \(67/1024\) and thus exceeds the unit-tube radius \(\epsilon\). There
\[
 |\sin v|=\frac{|x-c_{iX}|}{\epsilon(1+s)}
 <\frac{2}{67}<\sin v_0
\]
on the branch near \(\pi\) or zero. This proves that the handle meets each ball exactly in its prescribed small attaching disk and clears both removed unit tubes, with clearance for rounding. The ends run through the retained parts of the auxiliary radius-\(5/4\) charts.

Orient each \(A_i\) by its oriented disk followed by \(dv\), and orient the handle by \(dh\wedge dx\wedge d\theta\). At the cap 1 center \(s_h=(d_2-d_1)/\epsilon>0\) and \(v_x=-1/\lambda\). At the cap 2 center \(s_h=-(d_2-d_1)/\epsilon<0\) and \(v_x=1/\lambda\). At both centers \(t_\theta=1/(2\pi)>0\). Hence the sign of \(ds\wedge dt\wedge dv\) is the sign of \(-s_h t_\theta v_x\), which is positive at both ends. The same sign holds throughout the endpoint disks by nonsingularity of the polar coordinate change in the common slice. The first handle and \(B\) use the E04 orientations.

Round the reentrant attachment rims in their common slices using the E04 graph \(q'=|p'|\) and the same even smoothing at width \(\omega=(1/4096)/64\). At the cap 1 and cap 2 rims of the second handle, \(|x|<5/16384\), so the bound on \(|\sin v|\) improves to \(|v-\pi|<1/64\) and \(|v|<1/64\) respectively. Round the convex cap-ball corners at \(s=s_0,v\in\partial I_i\), using the negative of the smoothed absolute value in widths \(1/1024\). These supports stay clear of both seams and all attaching rims. The first handle, its rim on \(A_1\), and its attachment on \(B\) retain their E04 roundings.

Three balls joined by the two handles in a chain have smooth boundary a sphere. Each operation joins two punctured sphere boundaries along a cylinder, giving their connected sum. Only the original part of \(\partial B\) meets the puncture, exactly as in E04. It loses one closed coordinate disk and the boundary is unchanged under E04's pointwise boundary-fixed straightening. Write \(D_{12}\) for the resulting oriented proper disk. Its product collar is over the latitude
\[
 U(\alpha)=\big(-k\cos\alpha,\ k\sin\alpha,\ \ell,\ 0\big),\qquad
 k=\sqrt{55}/8,\quad \ell=3/8,\quad \alpha\ \text{increasing}.
\]
For the oriented belt \(Q_i=\{0\}\times S^2\subset C_i\), the surface at the lower endpoint of \(I_i\) has sign \(-1\) and that at the upper endpoint has sign \(+1\). Both are transverse intersections in the Cartesian cap charts, whose ambient orientation is disk followed by sphere. Thus the ordered pairs are \((-1,+1)\) at \((-v_0,\pi+v_0)\) in \(C_1\) and \((-1,+1)\) at \((-v_0,v_0)\) in \(C_2\). [E04, puncture and orientation](E04_NATIVE_SURFACE.md#rounding-and-the-puncture)

## Place the Whitehead surface and protect the two band feet

Work in the **model** oriented \(S^3\) and then use the mark \(\iota\). Take \(J=D_+(T_{2,3},2)\) with positive clasp and \(t=+2\) in the Hedden–Ording convention, on the right-handed companion. The box in their Figure 1 is \(t-3\) full right-handed turns, so its entry is \(-1\). Use the canonical surface \(P_J\) consisting of the companion annulus with the \(t\) twist convention and the positive clasp band joining its two boundary circles. Its boundary diagram is Figure 1 with that box filled, and its oriented surface has one boundary and Euler characteristic \(0-1=-1\). The clasp, the companion crossings and all full twists are outside the small boundary chart used to place the band foot. [Hedden–Ording, Theorem 1.1, Figure 1 and §2.1](https://arxiv.org/pdf/math/0512348)

For the placement, use positive stereographic coordinates \(S_+(u)=(x,y,Z)=(u_1,u_2,u_3)/(1-u_4)\) on the model sphere. Positivity follows at \(u=-e_4\) from the outward-first frame \((-e_4,e_1,e_2,e_3)\). Choose a point of the crossing-free outer return arc in Figure 1, on the right of the crossing region, and rotate the point to \(-e_4\) by a map in \(SO(4)\). In a small \(S_+\) chart about this point, flatten the surface collar to a planar half-plane through zero whose boundary arc is a straight line, by an oriented straightening supported in that chart.

The positive stereographic projection from the chosen point \(-e_4\) is \(S_-(u)=(-u_1,u_2,u_3)/(1+u_4)\). It is \(S_+\) composed with the \(SO(4)\) half-turn \((u_1,u_4)\mapsto(-u_1,-u_4)\). On the overlap, with \(w=S_+(u)\) and \(R_3(w)=(-w_1,w_2,w_3)\), the transition is
\[
 S_-(u)=\frac{R_3(w)}{|w|^2},\qquad
 \det D(S_-\circ S_+^{-1})(w)=|w|^{-6}>0 .
\]
This transition takes the local flat half-plane to a flat half-plane outside a compact set. Choose a round truncation radius in \(S_-\) large enough that the surface near that sphere is entirely in this flat half-plane. Truncation replaces the selected tiny boundary arc by a planar semicircle on the round truncation sphere. In \(S_+\) this replaces a straight interval by a semicircle with the same endpoints, cutting off a small half-disk. Rounding these two junctions amounts to a planar isotopy of the trivial arc, extending in its normal direction. It preserves the surface and knot up to oriented isotopy, supported away from the clasp and twist data.

Rescale and orient the placed truncation ball in the model coordinates by a positive Euclidean similarity so that its center is \((c,0,\ell)\), \(c=k+1/4\), its radius is \(b=1/16\), and the flat semicircle is the west semicircle in \(Z=\ell\). Arrange the \(J\)-orientation at its west tip along increasing \(y\), using a half-turn about the \(x\)-axis through the center if needed. This half-turn preserves the west semicircle and the orientation of the three-dimensional coordinates. Perform the two old trivial-arc corner roundings inward close to the semicircle endpoints so the whole surface stays in the closed ball. The middle of the west semicircle and its inward flat collar are then protected. This places an oriented representative of \(P_J\), still denoted \(P_J\).

Let \(A_U\) be the planar annulus \(k-1/32\le\sqrt{x^2+y^2}\le k\), \(Z=\ell\), oriented by \(-dx\wedge dy\). Its outer boundary is \(U\) with its exact orientation, and let \(U'\) be the inner circle given the same clockwise orientation as \(U\). Set \(d=1/128\) and use the band
\[
 \mathcal B
  =\left\{(x,y,\ell):|y|\le d,\quad
 \sqrt{k^2-y^2}\le x\le c-\sqrt{b^2-y^2}\right\}.
\]
Its left foot is on the rightmost arc of \(U\), containing \(\alpha=\pi\) and oriented with \(y\) decreasing. Its right foot is on the protected west arc of \(J\), oriented with \(y\) increasing. The band interior is beyond the outer radius of \(A_U\) and outside the placed ball of \(P_J\). In a small neighborhood of each foot both surfaces and the band are in the same plane. Give the band orientation \(-dx\wedge dy\), which induces \(+dy\) on the left foot and \(-dy\) on the right. The surfaces and band thus induce opposite orientations on their common feet. The side at \(y=d\) is traversed toward increasing \(x\), and the side at \(y=-d\) toward decreasing \(x\).

Smooth the four band endpoints in their common plane, using small graph roundings disjoint from \(U'\), the two old trivial-arc roundings and the clasp and twist regions. All of \(A_U\) lies in \(x\le k\), and all of the placed \(P_J\) lies in \(x\ge c-b=k+3/16\). The plane \(x=k+1/8\) therefore lies strictly between the feet for every \(|y|\le d\), and its one-point compactification in \(S^3\) separates the two surfaces. Choose all four endpoint roundings away from this plane. The two outgoing strands meet it at \(y=\pm d,\ Z=\ell\), with \(+dx\) direction at \(y=d\) and \(-dx\) at \(y=-d\). Capping these arcs on either side recovers the original oriented \(U\) and \(J\), with the trivial foot replacements in their flat collars. This is the oriented connected-sum sphere for the outgoing knot \(K=U\# J\). Its \(U\) tangle is planar and closes to the unknot, so \(K\) is oriented isotopic to \(J\). The antipodal chart transition and the placements preserve the model orientation. The reflection \(R\) in \(\iota\) gives the fixed orientation-preserving mark of the puncture boundary.

## Realize the sum in the actual puncture

After this rounding let \(P=A_U\cup\mathcal B\cup P_J\) denote the smooth oriented spatial surface. Its boundary is \(K\sqcup(-U')\) and \(\chi(P)=0-1-1=-2\). Take a number \(\delta>0\) so that \(4\delta<r/2\) and \(D_{12}\) has its radial product collar for \(0\le\rho-r<4\delta\). Use the collar embedding \((u,s)\mapsto \chi((r+s)R(u))\).

Truncate \(D_{12}\) at \(s=3\delta\) and retain the part at greater radius. In \(2\delta\le s\le3\delta\) attach an annulus of model latitude circles in \(Z=\ell\), interpolating the planar radius from \(k-1/32\) at the lower end to \(k\) at the higher end, with the radius constant on end intervals. Choose its orientation so it meets the truncated disk with cancelling boundary orientations and its lower edge is the clockwise \(U'\).

Place the rounded surface \(P\) in \(0\le s\le2\delta\) as the graph of a smooth radial height function on \(P\). In a surface collar of \(K\) use \(s=\delta f(w)\), and in a disjoint surface collar of \(U'\) use \(s=2\delta-\delta f(w)\), with \(w\ge0\) inward and \(f(0)=0,\ f'(0)>0,\ 0<f(w)\le1\) for \(w>0\), and \(f=1\) near the far ends of the collars. Set \(s=\delta\) on the rest. The embedding is injective by its spatial projection. In each boundary band, the level loops are a smooth isotopy of the corresponding boundary loop, parameterized by the radial height since \(f'(0)>0\). Extend its reverse into an ambient angular tube about the loop, with a small radial cutoff. For example, in coordinates given by extending the surface collar \(w\) in a normal direction, use the flow of a cutoff times \(\partial_w\), with time minus the collar value of \(w\) at that height. This fixes the end level pointwise and makes the graph a radial product near that end. The two straightening supports are disjoint. The graph and annulus now glue with matching product collars at \(U'\) and opposite induced boundary orientations. The annulus and disk have matching product collars at \(U\). The three interiors have disjoint radial ranges except for these joins. The outside edge of the new proper surface is the exact model knot \(K\) carried by \(\iota\), with the orientation above and a product collar.

The surface is connected and orientable. The disk contributes Euler characteristic \(1\), the annulus contributes \(0\), and \(P\) contributes \(-2\). Gluing circles has Euler cost zero. The resulting Euler characteristic is \(-1\) with one boundary component, hence the genus is one. All new surface pieces lie at \(\rho<r+4\delta<3r/2\) inside the pole chart and away from both caps. The four intersections with the original belts remain precisely the two signed pairs of \(D_{12}\). This gives the claimed genus-one upper bound through both belts for the actual signed knot; the disk \(D_{12}\) itself has boundary \(U\).

## Inspectability

Frozen request SHA-256 prefix `fab10d9daf5a3eee`; E04 input `cd07e974baf73568`. The original signed seam formulas are those cited above. I inspected Hedden–Ording's primary Figure 1, including the \(t-3\) box, on 28 November. The construction specifies the two handle domains and inverses, protected feet, band orientations, separated regions and product collar gluings. The geometric claim awaits non-author replay.
