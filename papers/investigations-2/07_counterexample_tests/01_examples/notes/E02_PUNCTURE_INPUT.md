# WEX-E02 · Original puncture and surface collars

28 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex assistance. Frozen E02, revision 1, checkout `e171829f1c59a8a1fc66a2f1bd7ff42b2037aa6b`. The request designates GPT-6.2 Sol / ultra. This helper has no independent access to serving model or effort. Scope is the single original smooth outward-oriented minus Miller–Schupp presentation sphere \(\Sigma_P\). The calculation fixes a coordinate puncture, gives a local unknot collar and traces cap disks through both specified seams. The exterior surface needed for a distinguishing boundary knot is still missing. [Request](../research-progress/handoffs/REQUEST_E01_E02_R1.md)

## 1. Puncture and knot orientation

Keep the original exterior \(E\) of the two open attaching tubes in the rounded boundary of \(F\times D^3\). Here \(F\) is the radius-4 planar disk with the two open radius-\(1/4\) disks about \((\pm1,0)\) removed. Use the CERT rounding with \(\delta=1/128\), the original order \(X,Y,z_1,z_2,z_3\) in the five-dimensional product, and its outward-first boundary orientation. On the sphere face write \((q,N)=((X,Y),N)\). The pole is \(p=(0,e_3)\), with B04's ordered tangent frame \(X,Y,N_1,N_2\) at the north pole. In the actual E07 chart put
\[
  \chi(y)=\big((X,Y),\cos(v)e_3+
    \operatorname{sinc}(v)(y_3,y_4,0)\big),\qquad
  y=(X,Y,y_3,y_4),\quad v=(y_3^2+y_4^2)^{1/2},\quad \rho=|y|<1/4.
\]
The chart fills in at zero. Its inverse takes \(q\) unchanged and \((y_3,y_4)=(v/\sin v)(N_1,N_2)\) with \(v=\arccos N_3\), smoothly continued at \(v=0\). The derivative at the pole is positive since the outward normal is \(e_3\) in the last three-factor and moving it past \(X,Y\) is even. Hence \(\chi\) is orientation preserving on its domain. The planar domain stays at least \(1/2\) from the two hole boundaries and misses the rounded corners. Its colatitude is \(v<1/4<\pi/3-5/64\), below both enlarged attaching bands. [B04, The specimen](../../../01_chiral_transfer_and_pole_forms/brainstorm/notes/B04_MARKED_PILOT_20261127.md#the-specimen) · [E07, §4](../../../01_chiral_transfer_and_pole_forms/notes/E07_MARKED_ATLAS.md#4-marked-chart-and-compact-cover)

Fix \(a=1/16=0.0625\), \(B_p=\chi(\{\rho\le a\})\) and \(W=\Sigma_P\setminus\operatorname{int}B_p\). This is a radius in the original \(y\) coordinates. The outward normal of \(W\) points toward decreasing \(\rho\). Its boundary orientation is therefore the negative of the usual boundary orientation of \(B_p\). For the oriented knot in the unit sphere with its usual outward-first orientation use
\[
 \mathcal R(u)=(-u_1,u_2,u_3,u_4),\qquad
 \iota:S^3\longrightarrow\partial W,\qquad u\longmapsto \chi(a\mathcal R(u)).
\]
The reported oriented knot is \(\iota^{-1}(\partial S)\), where \(S\subset W\) carries the surface orientation. Use this convention for the signed knot diagram and its genus comparison. [WEX conventions](../research-overview/OVERVIEW.md#what-a-witness-would-establish)

One local control in the retained sphere face is
\[
 (\rho,t)\longmapsto \chi(0,0,\rho\cos(2\pi t),\rho\sin(2\pi t)),\qquad
 a\le\rho\le1/8,\quad t\in\mathbb R/\mathbb Z .
\]
It is an embedded radial collar, transverse to \(\partial W\), and has orientation \(d\rho\wedge dt\). Its inner boundary is oriented by \(-dt\), giving the reported unknot \(J_0(t)=(0,0,\cos(2\pi t),-\sin(2\pi t))\). The outer edge \(\rho=1/8\) lies in the same retained sphere-face chart.

## 2. Both ambient seams and a surface through each

The original JSON gives the ordered rows
\[
 (x^{-1},y,y,x,y^{-1},y^{-1},y^{-1}),\qquad
 (x^{-1},y,x,x,y^{-1},x^{-1},x^{-1}).
\]
As in CERT E06, let \(L_x(u)=(-1+\cos 2\pi u,\sin 2\pi u)\) and \(L_y(u)=(1-\cos 2\pi u,-\sin 2\pi u)\). On slot \(k\) for letter \(b^\sigma\), \(c_i(t)=L_b(\sigma H(7t-k))\) with the original flat step \(H(u)=j(u)/(j(u)+j(1-u))\), \(j(u)=e^{-1/u}\) for \(u>0\) and zero otherwise. Set \(m(t)=(\cos 2\pi t,\sin 2\pi t)\), \(P(\phi,\theta)=(\sin\phi\cos\theta,\sin\phi\sin\theta,\cos\phi)\), and \(\epsilon=1/16\). The ordered seam maps in the original coordinate framing are
\[
 \begin{aligned}
 a_1(m(t),n)&=\Phi_1(t,n)
   =\big(c_1(t)+\epsilon(n_1,n_2),\,P(\pi/3+\epsilon n_3,2\pi t)\big),\\
 a_2(m(t),n)&=\Phi_2(t,n)
   =\big(c_2(t)+\epsilon(n_1,n_2),\,P(2\pi/3+\epsilon n_3,2\pi t)\big).
 \end{aligned}
\]
The cap \(C_i=D^2\times S^2\) is on \(s\le0\) with \((\zeta,n)=((1+s)m(t),n)\). The exterior on \(s\ge0\) uses \(\Phi_i(t,(1+s)n)\), where the same formula is defined on the whole enlarged tube. To invert the exterior map recover \(t=\arg(N_1+iN_2)/(2\pi)\) modulo one, \(\phi=\arccos N_3\), and \(w=\epsilon^{-1}(q-c_i(t),\phi-\phi_i)\) with \((\phi_1,\phi_2)=(\pi/3,2\pi/3)\), then read \(s=|w|-1\) and \(n=w/|w|\). The inverse surgery restores the cradle through exactly the same \(a_i\) and the extension \(\Phi_i(t,(1+s)n)\) to \(s\le0\). The framings, longitudes and inverse maps are specified for both components. [CERT E06, Framed handles](../../../05_certificates/notes/E06_PRESENTATION_HANDLES.md#framed-handles-and-the-two-collar-identifications) · [Original JSON](../../../05_certificates/numerics/e06_handles.json) · [CERT E09, Marked smooth replay](../../../05_certificates/reviews/E09_FORMAT_HANDLE_REPLAY.md#marked-smooth-replay) · [E07, Signed seam](../../../01_chiral_transfer_and_pole_forms/notes/E07_MARKED_ATLAS.md)

With \(dA\) the outward sphere area form of \(n\), the positively oriented collar order is \(ds\wedge dt\wedge dA\) on both sides. On the exterior this follows from the negative sign of raw \((t,w)\) coordinates in the \((X,Y,\phi,\theta)\) orientation and
\[
  -dt\wedge dw_1\wedge dw_2\wedge dw_3
  =(1+s)^2ds\wedge dt\wedge dA.
\]
The boundary orientation induced by the cap is \(+dt\wedge dA\) and that induced by the exterior is \(-dt\wedge dA\). The restored cradle has the cap-side seam sign.

For each \(i\) fix \(n=e_3\) in the transverse sphere. The cap disk \(D^2\times\{e_3\}\) extends across \(a_i\) by \((s,t)\mapsto\Phi_i(t,(1+s)e_3)\) for \(0\le s\le1/8\). It is smooth and transverse to its seam because in the signed chart it is exactly \(n=e_3\). Give the disk its standard complex orientation. On its signed collar this is \(ds\wedge dt\), so its external trace at \(s=1/8\) travels with increasing \(t\). The same formulas with \(n=-e_3\) give a parallel disjoint disk and collar. An oppositely oriented copy uses decreasing \(t\). The two components' enlarged tube images are disjoint, and each \(\Phi_i\) is injective through the chosen collars. This supplies actual disk-to-collar joins and disjoint parallel patches.

## 3. First missing exterior join

An orientable exterior connector from the puncture to full cap-disk traces must balance the signed longitude degrees at **each** used seam. To see this, let \(Q\subset E\cap W\) be compact and oriented, with all boundary curves on the puncture or the seam hypersurfaces, with those seam cuts taken either at \(s=0\) or \(s=1/8\). A seam curve projects to \(F\) with class \(\deg(t|_{\mathrm{curve}})[c_i]\) in \(H_1(F;\mathbb Z)\). Indeed the planar displacement in the tube can be homotoped linearly to zero inside \(F\) by the clearance in E06. A puncture curve projects into \(|q|\le a\), so its class is zero. Since the projection of \(\partial Q\) bounds the projected oriented chain, the sums \(d_i\) of degrees on each seam satisfy \(d_1[c_1]+d_2[c_2]=0\). The ordered class rows in generator basis \(([L_x],[L_y])\) are \((0,-1)\), \((-1,0)\), so \(d_1=d_2=0\).

Consequently the exterior piece cannot join a boundary knot at the marked puncture to just one of the section disks or to one such disk on each of the two seams. An opposite-sign pair of section disks on an individual seam passes this homology check. For a distinguishing surface the first missing geometry is a compact embedded oriented exterior piece linking a named signed chart knot's collar to explicitly chosen seam traces of total signed longitude zero at each seam. A movie or band encoding for that piece needs its boundary parametrizations, smooth collar joins and disjoint interiors. A link drawn in a four-dimensional handle realization would also need a transport of its surface and boundary mark to this particular chart. [06, Candidate geometry](../../../06_invariants_and_candidates/notes/CANDIDATE_INPUTS_20261127.md) · [Gay–Kirby, §4.1 and Lemma 4.7](https://msp.org/gt/2007/11-4/gt-v11-n4-p03-p.pdf)

For an eventual proper oriented genus-\(g\) surface the inherited filter is \(|\tau(J)|\le g\), since the puncture is an integral homology ball and the relative class terms in Ozsváth–Szabó's Theorem 1.1 vanish. Apply the same theorem to the reflected boundary of the oppositely oriented homology ball for the other sign. Plamenevskaya's Theorem 1 then bounds every standard-tight Legendrian representative of a disk boundary by \(tb\le-1\). The standard-ball inequality from Rasmussen's Theorem 1 would make \(|s_{\mathbb Q}(J)|>2g\) sufficient for the proposed comparison. [Puncture filter](../../../01_chiral_transfer_and_pole_forms/research-progress/handoffs/TO_06_PUNCTURE_KNOT_FILTER_20261127.md) · [Ozsváth–Szabó, Theorems 1.1–1.2 and Lemma 3.3](https://arxiv.org/pdf/math/0301149) · [Plamenevskaya, Theorem 1](https://msp.org/agt/2004/4-1/agt-v4-n1-p20-p.pdf) · [Rasmussen, Theorem 1 and §4.4](https://arxiv.org/pdf/math/0402131)

## Input versions and scope

The SHA-256 prefixes of the files read at the stated checkout are E06 `0718114604f51a00`, original JSON `f898a23925988690`, E09 `abeae6b620db0bfc`, B04 `d87dc4f71886074e`, E07 `ea60a02278bd296a`, puncture filter `3ad45844113f7638`, and 06 Candidate Inputs `59ead88f6f7361a9`. Primary reading on 28 November covered the displayed presentation in [Shehper et al., v2 §3.3](https://arxiv.org/html/2408.15332v2), the recognition question in [Gabai, v2 §13.5–13.6](https://arxiv.org/pdf/2212.02004v2), and the named Gay–Kirby and genus-bound passages above. The chart identification is inherited from the marked atlas and its certificate replay. The collar calculations and necessary degree condition are working deductions for the stated pieces in this marked input.
