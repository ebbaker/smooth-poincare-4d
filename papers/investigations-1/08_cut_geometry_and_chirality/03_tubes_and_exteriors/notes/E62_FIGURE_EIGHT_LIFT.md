# SP4-CUT-TUBE-E62 · The lifted marked knot in the tetrahedral Hopf base

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance.
Actual helper model and reasoning effort are unavailable.
[Frozen E62 request](../research-progress/handoffs/E62_REQUEST_R1.md),
checkout bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0.
The input [E39 marking](E39_PRISM_FILLINGS.md) has SHA-256 beginning
566185d2f1c515a7, and the [underlying core note](MARKED_LENS_CORE.md)
has SHA-256 beginning d5817f7351ef7b91.
The calculation is exact in the smooth oriented three-dimensional
cover. The decimal values below only report the sizes of exact angles.

On the unfilled cover \(X_0=(T^*\times C_{17})\backslash S^3\)
that branches along the old order-two locus, the lifted surgery knot
projects with multiplicity one along both open lobes of a single
immersed figure-eight in \(S^2/T\). There is one transverse crossing.
The lobes encircle the two different order-three points, and the
order-two point lies outside them. The Hopf-fibre push-off differs from
the lifted marked longitude by one positive meridian. Thus the two
native fillings lift to slopes \(\lambda_{\rm H}-\mu\) and
\(\lambda_{\rm H}+\mu\) in the Hopf push-off marking.

## The covering knot and projection

Write unit quaternions with ambient orientation \((1,i,j,k)\).
Let \(n=(i+j+k)/\sqrt3,\ b=e^{n\pi/3}\), and \(z=e^{2\pi i/17}\).
The full orbifold deck group of E39 acts by
\((A,B)q=AqB^{-1}\) and is
\(T^*\times_{\{\pm1\}}\langle z,j\rangle\). Its even right subgroup
is the free deck group \(T^*\times C_{17}\) for \(X_0\).
The twofold map to the unfilled underlying orbifold is branched
only along the old singular knot. The setwise stabilizer of the
marked circle \(C=p_0e^{j\mathbb R}\) in the full group is generated
by \(J(q)=bqj^{-1}\) and has order 12. Its intersection with the
even subgroup is \(\langle J^2\rangle\), of order six. Thus the
full lift of \(\ell\) to \(X_0\) is the single knot
\(K=C/\langle J^2\rangle\), and \(K\to\ell\) has degree two.
The parameter \(q(s)=p_0e^{js}\), with \(s\) increasing, has period
\(\pi/3\) on \(K\), since \(J\) shifts \(s\) by \(-\pi/6\).
These are unfilled covering data. The fillings must then use
primitive lifted slopes to obtain the smooth double branched
covers of the filled underlying spaces.

Choose the lift \(p_0\) so that
\[
 p_0 j p_0^{-1}=n,\qquad p_0 i p_0^{-1}=x_0=(1,-1,0)/\sqrt2 .
\]
Coordinates in triples are in the \((i,j,k)\) basis. The Hopf map is
\(q\mapsto qiq^{-1}\), with right fibre direction \(q e^{i\alpha}\),
\(\alpha\) increasing. Its image along the knot is
\[
 x(s)=\cos(2s)x_0+\sin(2s)(n\times x_0),\qquad
 n\times x_0=(1,1,-2)/\sqrt6 .
\]
It traces the equator perpendicular to \(n\). Let
\(\mathcal R=\operatorname{Ad}_b\), which cycles \(i,j,k\).
Then \(x(s+\pi/3)=\mathcal R x(s)\). The tetrahedral rotation group
\(T=T^*/\{\pm1\}\) consists of cyclic coordinate permutations and
even coordinate sign changes. A generic point of the equator
has three preimages in that equator under projection to \(S^2/T\),
given by the cyclic permutations. A nontrivial even sign change
keeps a point in the equator precisely when its unchanged
coordinate is zero. At such a point the other two coordinates
are nonzero and opposite, and the sign change gives its antipode,
so there are six equator preimages. The Hopf map has degree two
on \(C\), and division by the order-six knot stabilizer gives
one \(K\) preimage generically and two at this exceptional image.
The six equator points with one zero coordinate form one orbit
of \(T\). None of these points is an orbifold cone point.

In the \(s\)-interval \([0,\pi/3]\) the two crossing preimages
are \(0,\pi/6\), with \(\pi/3\) identified with \(0\).
At \(s=\pi/6\) the base lift is
\(x_1=(1,0,-1)/\sqrt2=\mathcal R^{-1}(-x_0)\).
After identifying \(x_1\) to \(x_0\) by
\(\operatorname{Ad}_{kb}\), the two oriented unit tangents
ordered by their preimages \(0,\pi/6\) are
\[
 t_0=(1,1,-2)/\sqrt6,\qquad t_1=(1,1,2)/\sqrt6.
\]
Hence \(t_0\cdot t_1=-1/3\) and
\(x_0\cdot(t_0\times t_1)=2\sqrt2/3>0\)
in the outward orientation on the unit angular sphere.
The oriented tangent angle is \(\arccos(-1/3)\); the acute
angle between the lines is \(\arccos(1/3)\).
There are no coincident arcs or tangencies.

## Lobes and their angular areas

A fundamental model for \(S^2/T\) is the union of the positive
and negative spherical octants modulo cyclic permutation, glued
along their boundaries by matching absolute coordinates.
In the interiors the sign of the coordinate product determines
the sheet. The two octant centres \(n,-n\) give two order-three
points, and the coordinate axes give the order-two point on the
join. The contact of the lobes lies at an edge midpoint on the
join, away from the order-two point. In either sheet the
equatorial image consists of the edges of the spherical medial
triangle modulo cyclic permutation. Its vertices in the positive
sheet are
\[
 (1,1,0)/\sqrt2,\qquad (0,1,1)/\sqrt2,\qquad
 (1,0,1)/\sqrt2 .
\]
The central triangle contains the cone point. The cyclic rotation
identifies its boundary arcs to one simple closed lobe. In the
negative sheet the triangle uses the antipodal vertices.
The lobes touch only at the crossing, and the region outside
both contains the order-two point.

For \(0<s<\pi/6\) the signs are \((+,-,-)\).
Applying \(P_i=\operatorname{Ad}_i\) folds the segment into the
positive octant, from \((1,1,0)/\sqrt2\) to \((1,0,1)/\sqrt2\).
Here the tangent-left normal in the oriented sphere is
\(P_i n\), which has dot product \(-1/3\) with \(n\).
The first lobe is therefore negative around \(n\).
For \(\pi/6<s<\pi/3\) the signs are \((+,+,-)\).
Applying \(P_k=\operatorname{Ad}_k\) folds it into the negative
octant, with tangent-left normal \(P_k n\) of dot product
\(1/3\) with \(-n\). The second lobe is positive around \(-n\).

Each of the three angular side lengths is \(\pi/3\), since the
dot products of the medial vertices are \(1/2\). The spherical
cosine rule gives all three internal angles
\(\arccos(1/3)\). Thus the enclosed orbifold area in the unit
angular metric, for either unsigned lobe, is
\[
       \Omega=\arccos(1/3)-\pi/3 .
\]
The full triangle area is \(3\Omega\), and the signed lobe areas
are \(-\Omega,+\Omega\). These are areas on the unit angular
sphere; the round Riemannian submersion Hopf sphere has radius
\(1/2\) and areas one quarter as large.

## Fibre height and unwrapped horizontal phases

The regular fibre period is \(P=\pi/17\). Indeed the right
\(C_{17}\) rotates through \(2\pi/17\), and the central left
\(-1\) acts as a right shift by \(\pi\). On a regular Hopf fibre
there are no further base stabilizers. Put
\[
    \vartheta=\arccos(1/\sqrt3),\qquad
    q_0=p_0,\quad q_1=p_0e^{j\pi/6},\quad q_2=p_0e^{j\pi/3}=b p_0 .
\]
The allowed left deck identification \(A_+=-kb\) takes
the base of \(q_1\) to that of \(q_0\). Directly,
\(p_0^{-1} k p_0=j/\sqrt3+\sqrt{2/3}\,k\) and
\(bq_1=p_0j\), so
\[
       A_+q_1=q_0e^{i\vartheta}.
\]
Thus in a positive local fibre chart the two branch heights
are \(0\) and
\[
       h=\vartheta-5\pi/17 \simeq 0.0313187788,
       \qquad h/P\simeq0.169474308 .
\]
This uses the representative \(0<h<P/2\).
For example \(\vartheta>15/16>5\pi/17\) and
\(\vartheta<31/32<11\pi/34\) follow from
\(3<\pi<22/7\) and the alternating Taylor bounds for
\(\cos(15/16)\) and \(\cos(31/32)\).
The other branch therefore lies on the increasing-height side
of the first in this local chart. A shift by an integral fibre
period changes the lifted height convention.

For the unit round Hopf connection
\(\alpha=\langle q^{-1}dq,i\rangle\),
the marked arc \(q(s)\) is horizontal.
Its curvature is \(d\alpha=-\tfrac12\omega\) in angular
unit-sphere area \(\omega\), pulled back by the Hopf map.
In fact \(d\alpha(j,k)=-2\) at the identity, and the base
images of \(j,k\) have oriented area \(4\). Hence the
horizontal phase from an ordinary signed area is one half that
signed angular area. In the folded octant descriptions of
both lobes the endpoint in the angular cover differs from
the start by \(\mathcal R^{-1}\). The endpoint is identified
by \(b\). On the fibre at \(n\) the action of \(b\) is
right rotation by \(+\pi/3\), and at \(-n\) it is right
rotation by \(-\pi/3\). With those specified lifts of the
local deck rotations the phases of the two horizontal lobes are
\[
       \frac{\pi}{3}-\frac{\Omega}{2}=\vartheta,\qquad
       -\frac{\pi}{3}+\frac{\Omega}{2}=-\vartheta .
\]
One can see the area terms by adding the radial paths from
the cone-centre lift to the two ends of an edge. The
sector has one third the total medial triangle area, with the
indicated lobe sign. The two radial paths are identified by
the base rotation, leaving the displayed fibre shift of \(b\).
The identity in the first phase follows from
\(\arccos(1/3)=\pi-2\vartheta\).
It also follows directly from the deck identifications:
in the positive chart \(i^{-1} b i=-kb\), and in the
negative chart \(k^{-1} b k=-jb\). The latter sends
\(q_2\) to \(q_1e^{-i\vartheta}\).
The phases are unwrapped relative to these explicit lifts;
the intrinsic holonomies are their classes modulo \(P\).

## Framed Seifert diagram and an ambient group check

The two octant disks above, their three labelled cone fibres,
the oriented arcs with their single crossing and the two
horizontal phases specify a Seifert diagram. Use height zero on
the first branch, height \(h\) on its crossing partner and
horizontal transport on each open lobe. The local positive
base generator acts at either order-three fibre by \(2/3\)
of a regular fibre turn and at the order-two fibre by \(1/2\).
For the positive order-three point use \(b\), and for the
negative one use \(b^{-1}\), with the base rotation taken
positive about the corresponding normal. For the order-two
point one can use \(i\) at base \(i\). The right fibre shifts
are respectively \(\pi/3,\pi/3,\pi/2\), modulo \(P\).
The connection curvature in turns integrates to \(-17/6\)
over the base, since its angular area is \(4\pi/12\).

Keep the E39 normal coordinates near \(C\),
\[
 q=p_0(\cos r\,e^{js}+\sin r\,e^{j\theta}i).
\]
The oriented positive meridian \(\mu\) advances \(\theta\)
by \(2\pi\). The lift of the marked longitude \(a\) from
the quotient is the primitive \(2a\),
with advances \((\Delta s,\Delta\theta)=(\pi/3,-5\pi/3)\)
from \(J^{-2}\). The Hopf push-off \(q(s)e^{i\epsilon}\),
for small \(\epsilon>0\), has \(r=\epsilon,\ \theta=s\).
It therefore gives the actual push-off longitude
\[
       \lambda_{\rm H}=2a+\mu .
\]
With the cover identified this way the native slope
\(a+m\mu\) has primitive lift \(2a+2m\mu
=\lambda_{\rm H}+(2m-1)\mu\). For the two native framings
\(m=0,1\) this gives the announced pair.
These instructions give a framed diagram without making a
recognition claim for the surgically filled cover.

The horizontal lobes can also be closed by opposite traversals
of the short vertical connector of height \(h\). Using the first
branch as base point, the resulting loops have ambient deck
words in the convention \((A,B)q=AqB^{-1}\)
\[
       \bigl((kb)^{-1},z^6\bigr),\qquad
       \bigl(kb^2,z^{-6}\bigr).
\]
Indeed the first horizontal arc followed by the backward
vertical connector lifts to \(q_1e^{-ih}
=(-kb)^{-1}q_0e^{i5P}\), and \(e^{i5P}=-z^{-6}\).
The product is \((b,1)\), as required by the full lift from
\(q_0\) to \(q_2\). These words check the marking in the ambient
space. A presentation of the drilled exterior or of either
filled orbifold requires additional relations.
