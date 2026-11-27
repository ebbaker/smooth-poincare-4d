# SP4-CUT-TUBE-E72 · Half-turn presentation of the marked prism fillings

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance.
Actual helper model and effort are unavailable. Baseline checkout
bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0. This calculation uses the
marked smooth oriented three-dimensional lift, with the old local order
two downstairs. It takes the [E70 equivariant product chart](E70_EQUIVARIANT_SURGERY.md#1-equivariant-pair-of-pants-section-and-crossing)
as input and independently reads the group in the covering diagram.
The framings are those of [E64](../reviews/E64_FIGURE_EIGHT_REPLAY.md)
and [E68](E68_CROSSING_ALEXANDER.md). The input SHA-256 prefixes are
ade2987d8bf24aa9 for E70, a381318675c96306 for E64 and 32db148ec2a35f1d
for E68.

The presentation gives \(G_0=S_3\) and a surjection
\(G_{-1}\twoheadrightarrow\operatorname{PSL}_2(\mathbb F_{29})\).
Here \(G_s\) is the native \(a+s\mu\) filling group with only the old
singular knot. The \(s=-1\) group is noncyclic even though its
abelianization is \(C_8\). The independent abelianization checks for
\(s=0,1\) give \(C_2,C_4\), respectively. The exact rational diagram
and the finite group checks are in
[e72_rotation_presentation.py](../numerics/e72_rotation_presentation.py).

## Symmetric rational diagram

Use the positive chart
\((x,v,\theta)\mapsto ((10+v)\cos\theta,(10+v)\sin\theta,x)\)
on the product solid torus, with \(\theta\) now measured in radians.
The deck involution is \(\tau(X,Y,Z)=(X,-Y,-Z)\). The orientations of
the two regular-fibre replacements \(F_+,F_-\) are positive in
\(\theta\). The lift \(K\) is oriented by increasing \(u\).
The orientation of the external component \(B\) runs upward on its
near-axis branch, so \(\operatorname{lk}(B,F_\pm)=1\). Use these exact
polygons, with cyclic closure:

* \(B\) has successive vertices
  \((0,-10/7,-10),(0,10/7,10),(-30,200,10),(-30,-200,-10)\).
* \(F_+\) has successive vertices
  \((10,-10,21/20),(10,10,21/20),(-10,10,19/20),(-10,-10,19/20)\).
  The list for \(F_-\) is obtained by applying \(\tau\) and reversing
  parameter while keeping the image of vertex zero first.
* For \(K\), put \(z=2\sin u,\ r=10+2\sin u\cos u,\ t=-\cos u/8\),
  and take
  \[
   (X,Y,Z)=\Big(r\frac{1-t^2}{1+t^2},\frac{2rt}{1+t^2},z\Big)
  \]
  at \((\sin u,\cos u)=(0,1),(3/5,4/5),(1,0),(3/5,-4/5)\).
  Append their images under \(\tau\) in that order.

The isotopy from E70's height \(-H\cos u\) to
\(2\arctan(-\cos u/8)\) keeps the real anti-periodic lift of the height.
The two points over the crossing remain in the same strict height order.
This moves only \(K\) in the product chart with both cone circles in
their horizontal levels. The external core is represented by closing a
long vertical axis segment outside the patterned solid torus in the
negative \(X\) direction. The two branches and their far connectors
remain disjoint from all other components as their \(Y\)-coordinates
are sheared to the displayed values.

The circle \(F_+\) can be expanded radially to the square boundary and
tilted to \(Z=1+X/200\), and \(F_-\) is moved by \(\tau\). To check
disjointness during this operation, at heights \(19/20\le Z\le21/20\)
the two smooth \(K\) branches have
\(\sin u=Z/2\) and \(|\sin 2u|>4/5\). Since \(|t|\le1/8\),
the negative-\(v\) branch is inside the starting radius-ten circle, and
the positive-\(v\) branch has \(X>(54/5)(63/65)>10\), outside the final
square. The lower component follows by the half-turn. Interpolate the
four quarter-arcs of \(K\) to their respective chords at fixed \(Z\).
The two branches at any \(0<|Z|<2\) have opposite \(Y\)-signs and
\(|Y|<3\), so the interpolation stays embedded. The \(Z=0\)
points lie on opposite sides of \(Y=0\), and the \(Z=\pm2\) extremal
vertices stay fixed. In \(19/20\le Z\le21/20\), the positive-\(v\)
chord has \(X>10\): its endpoint \(X\)-coordinates are \(630/65\)
and \((274/25)(99/101)\), and the interval starts at fraction
\(19/24\) along the chord. The negative-\(v\) chord has \(X<10\)
because both its endpoint \(X\)-coordinates are below ten.
Thus the chord isotopy avoids the final squares. It avoids the
external axis by its positive \(X\)-coordinate and the height bound.
All interpolations commute with \(\tau\), and corners may be rounded
inside disjoint small neighbourhoods after computing crossings.

Project to \((Y,Z)\) with larger \(X\) over smaller. This plane has
positive normal \(+X\). The two fixed points of \(B\) project to one
ordinary crossing at the origin with independent projected tangents.
No fixed point of \(K\) occurs. On the four components the ordered arc
labels are respectively \(1,\ldots,7\), \(8,\ldots,11\),
\(12,\ldots,15\), \(16,17\), starting from the first listed vertex.
The exact projection checker uses rational line intersections,
rejects overlapping segments, endpoint hits and multiple crossings,
and finds the following ordered triples. For \((q,i,j)\) the relator
is \(g_q^{-1}g_i g_qg_j^{-1}\), with \(g_{-m}=g_m^{-1}\).

| Under component | Triples \((q,i,j)\) in order |
| --- | --- |
| \(B\) | \((-17,1,2),(15,2,3),(9,3,4),(16,4,5),(-17,5,6),(3,6,7),(16,7,1)\) |
| \(F_+\) | \((-16,8,9),(-17,9,10),(3,10,11),(16,11,8)\) |
| \(F_-\) | \((-17,12,13),(3,13,14),(16,14,15),(17,15,12)\) |
| \(K\) | \((-9,16,17),(15,17,16)\) |

## Peripheral words and descent to the native filling

The signed crossing number is the oriented determinant of the
over- and under-tangents in \((Y,Z)\). With the basing paths on the
observer side, crossing a positive overstrand conjugates the
outgoing under meridian by the inverse of the positive over
meridian, and contributes the positive over meridian to the
transport word. The push-off word is the ordered product of those
signed over meridians at undercrossings. Subtract the component's
self-writhe as a terminal meridian power to obtain its preferred
zero longitude. The only self-crossing in this projection is the
positive crossing of \(B\). [Burde–Zieschang, *Knots*, 2nd ed., §3.B, Remark 3.13](https://www.nzdr.ru/data/media/biblio/kolxoz/M/MP/Burde%20G.%2C%20Zieschang%20H.%20Knots%20%282ed.%2C%20de%20Gruyter%2C%202002%29%28ISBN%203110170051%29%28572s%29_MP_.pdf).

In the table, integers denote letters \(g_j\) with the same signed
convention. The three cone attachments in this ordinary surgery link
use E68's zero-longitude convention
\(d_2=-\lambda_B,\ f=\mu_B\) on the external torus and
\(d_\pm=\mu_\pm,\ f=\lambda_\pm\) on the two interior tori.

| Component | Meridian | Zero longitude | Cone relator |
| --- | ---: | --- | --- |
| \(B\) | \(1\) | \(-17,\ 15,\ 9,\ 16,\ -17,\ 3,\ 16,\ -1\) | \(\mu_B^3\lambda_B^2\) |
| \(F_+\) | \(8\) | \(-16,\ -17,\ 3,\ 16\) | \(\mu_+^3\lambda_+^{-2}\) |
| \(F_-\) | \(12\) | \(-17,\ 3,\ 16,\ 17\) | \(\mu_-^3\lambda_-^{-2}\) |
| \(K\) | \(16\) | \(-9,\ 15\) | |

For the quotient group take a basepoint fixed on the \(+X\) axis
beyond the link. The basing paths run in a common front plane before
approaching their meridians. The front plane is simply connected and
invariant, so rotating an arc meridian gives the literal signed
meridian of its image with these conventions. The fixed basepoint
gives an order-two section in the quotient orbifold group. Its
generator \(h=g_{18}\) obeys \(h^2=1\) and
\(hg_jh^{-1}=g_{\rho(j)}\) for the signed permutation
\[
 \big(\rho(1),\ldots,\rho(17)\big)
 =(-5,-4,-3,-2,-1,-7,-6,-12,-15,-14,-13,-8,-11,-10,-9,17,16).
\]
The involution preserves the three cone attachments, reversing the
orientation of \(B\) and exchanging \(F_+,F_-\) with their orientations
reversed. The action of \(h\) therefore extends across the cone
surgeries. [Catanese, *Topological methods in moduli theory*, Definition 22 and Remark 23](https://doi.org/10.1007/s13373-015-0070-1).

On \(K\), the half-circle from vertex zero to its opposite has a
single undercrossing, hence half-word \(W=g_9^{-1}\).
The descended push-off is \(Wh\): the last path back from the rotated
starting arc is the deck path defined by the fixed basepoint. Its
square is
\[
 (Wh)^2=W\rho(W)=g_9^{-1}g_{15}=\lambda_{\rm zero}
\]
because the self-writhe of \(K\) is zero in the \((Y,Z)\) projection.
The product-fibre push-off still has self-linking \(-1\) in the
zero-framed ball of E64, so \(\lambda_{\rm H}=\lambda_{\rm zero}-\mu\)
in additive peripheral coordinates. Since E64 gives
\(\lambda_{\rm H}=2a+\mu\), the native boundary slope \(a+s\mu\) lifts
twice to \(\lambda_{\rm zero}+(2s-2)\mu\).
In the downstairs torus lattice this fixes the peripheral word:
the unique class with that double is
\[
       W h\,g_{16}^{\,s-1}=g_9^{-1}h\,g_{16}^{\,s-1}.
\]
The filled group imposes this word itself. Thus the new solid torus
has a regular core, while the order-two old meridian is retained
through the half-turn orbifold quotient.

## Exact group certificates

The 17 crossing relators, three cone relators, \(h^2\), 17
conjugation relators and one native word give 39 relators on 18
generators. The checker eliminates generators by solving relators
containing a single occurrence. It also checks the Smith factors
from the integral minors of the resulting three-column exponent
matrix. These are \(8,2,4\) for \(s=-1,0,1\), respectively.

For \(s=0\), 15 eliminations leave \(b=g_5,f=g_{15},h=g_{18}\).
The displayed relators after those eliminations include
\[
 h^2=1,\qquad hbh=b^{-1},\qquad hfh=bfb^{-1},\qquad
 f^2(hb)f^{-1}(hb)=1 .
\]
Thus \(hb\) commutes with \(f\) and squares to one, so \(f=1\).
Substituting \(f=1\) into the reduced \(B\) relator gives a conjugate
of \(b^{-3}\). This bounds the group by the presentation
\(\langle b,h\mid b^3=h^2=1,\ hbh=b^{-1}\rangle\).
Conversely the checker evaluates every remaining relation at
\(b=(012),h=(01),f=1\). This gives the full six-element group and
establishes \(G_0=S_3\). The substitutions and all retained words
are printed for replay.

For \(s=-1\), 15 eliminations leave \(g_3,g_{17},g_{18}\).
Take these matrices modulo 29 and then pass to their projective
classes:
\[
 g_3\longmapsto\begin{pmatrix}0&12\\12&2\end{pmatrix},\qquad
 g_{17}\longmapsto\begin{pmatrix}13&11\\7&6\end{pmatrix},\qquad
 g_{18}\longmapsto\begin{pmatrix}0&28\\1&0\end{pmatrix}.
\]
All determinants are one. Reversing the substitutions yields
matrices for the full 18 generators. The checker directly multiplies
all 39 original relators and gets a central sign on each. It then
enumerates the subgroup closure of the three displayed projective
classes. There are \(12180=29(29^2-1)/2\) classes, the full
\(\operatorname{PSL}_2(\mathbb F_{29})\). In particular \(G_{-1}\)
cannot be the cyclic group \(C_8\). This finite quotient check does
not identify \(G_{-1}\) itself.
