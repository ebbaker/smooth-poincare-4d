# E68 · Alexander polynomial from the actual tetrahedral crossing

27 November 2026, for Edward B. Baker III, with OpenAI assistance. Bounded E68 packet from the research lead. Actual worker model and effort are unavailable. Checkout bc2c1bb. The inputs are [E62, tetrahedral figure-eight](E62_FIGURE_EIGHT_LIFT.md), SHA-256 prefix 9c2a0e2235b8a591, [E64, cut-open Seifert diagram](../reviews/E64_FIGURE_EIGHT_REPLAY.md), a381318675c96306, and [E66, marked two-variable conventions](../reviews/E66_ALEXANDER_REPLAY.md), cc987b358362da9b. The computation is exact for the smooth oriented three-dimensional exterior \(E'\) of the actual lifted surgery curve in \(M^+=S^3/(T^*\times C_{17})\).

The primitive free-variable Alexander polynomial of \(E'\), centered at exponent zero, is \(\pm(5t^{-1}+7+5t)\). It determines \(\det S_0=3\) for the old singular knot in the first ordinary filling, and \(\det K_1=49\) for the ordinary twofold lift of the old singular knot in the second filling. Thus the first actual orbifold group is noncyclic and its possible odd-dihedral rotation subgroup has order three. The second actual orbifold group is noncyclic as well. Neither determinant identifies a nonabelian fundamental group.

## The marked surgery link in a zero-framed solid torus

Use E64's section of the ordinary circle bundle over the base with the three cone disks deleted. Its integer shift is one at the order-two disk and zero at the two order-three disks. The positively oriented base disk containing the two order-three holes is embedded as the cross-section \(D^2\) of a standard zero-framed solid torus \(D^2\times S^1\) in \(S^3\). The two interior regular-fibre replacements are \(F_+,F_-\). The external core \(B\) is oriented so that the positive fibre \(f\) represents its positive meridian \(m_B\). The exterior order-two disk is on the other side of the outer boundary, so \(d_2=-\partial D^2=-l_B\), with \(l_B\) the preferred longitude. Inside, \(d_\pm=m_\pm\) and \(f=l_\pm\) in the zero framing. The E64 attachments therefore read
\[
    3m_B+2l_B,\qquad 3m_+-2l_+,\qquad 3m_--2l_- .
\]
The lifted crossing component \(K\) is drilled and no relation is imposed along its torus. Its two lobes go negatively around \(F_+\) and positively around \(F_-\), with the second crossing preimage higher. The section gauge of E64 puts all heights in one interval with no winding in the \(S^1\) direction. A change of the heights within that interval with fixed crossing order preserves the knot, by linear interpolation after identifying the interval with a real interval. The regular neighbourhood of the oriented figure-eight is a pair of pants. The two internal complementary annuli contain the two marked cone boundaries, and the exterior annulus meets the outer boundary. Matching these annuli and the cyclic order of the four crossing branches gives an oriented disk diagram of the required pair.

For exact coordinates take \(F_+\) and \(F_-\) to be oriented counterclockwise squares at \(z=0\), with right edges at \(x=7\) and \(x=5\). More precisely the vertices for a radius \(r\) are \((r,-r,0),(r,r,0),(-r,r,0),(-r,-r,0)\), in this order. Use \(B\) with successive vertices \((0,0,-10),(0,0,10),(0,-12,10),(0,-12,-10)\), closed cyclically. The straight part of the product chart near the right edges is
\[
     (x_{\rm base},y_{\rm base},h)\ \longmapsto\ (6+x_{\rm base},h,-y_{\rm base}) .
\]
This chart preserves the base-followed-by-fibre orientation. The two squares are parallel zero-linking longitudes, and the upward segment of \(B\) pierces both positively oriented square disks. The polygon for the base figure-eight has successive vertices
\[
 (0,0),(1,1),(2,0),(1,-1),(0,0),(-1,1),(-2,0),(-1,-1),
\]
with heights \((0,1,2,3,4,3,2,1)/8\) in the straight product chart and cyclic closure. Thus the right lobe winds negatively, the left lobe positively, and the second passage through \((0,0)\) passes above the first. The polygon is a piecewise linear representative of the marked smooth link. Corners may be rounded in disjoint small neighbourhoods without changing the crossings used below.

In the order \((B,F_+,F_-,K)\) the only nonzero pairwise oriented linkings are
\[
 \operatorname{lk}(B,F_\pm)=1,\qquad
 \operatorname{lk}(K,F_+)=-1,\qquad
 \operatorname{lk}(K,F_-)=1 .
\]
With meridian images \(b,u,v,w\) in a free cyclic quotient, the three cone relations in abelianization give
\[
 3b+2(u+v)=0,\qquad 3u-2(b-w)=0,\qquad 3v-2(b+w)=0.
\]
They force \((b,u,v,w)=(0,-2,2,3)g\) for an integral primitive generator \(g\). The preferred longitudes in the same order have images \((0,-3,3,4)g\). This assignment evaluates the longitude words as well as the meridians. In particular the core of the \(B\) attachment has free exponent zero, so a torsion formula dividing by a nontrivial core character at every attachment would be inapplicable on this diagram.

## Exact Fox calculation

Use the orientation-preserving projection chart \((x,y,z)\mapsto(x+z/3,y+z/7,z)\), with larger \(z\) over smaller, and enumerate the polygon edges from zero starting at the specified first vertex of each component. The [checker](../numerics/e68_crossing_alexander.py) intersects the first two coordinates over the rationals. An edge position is its index plus its segment parameter. There are nine transverse crossings, with distinct heights and no endpoint intersections.

| Over position | Under position | Sign |
| --- | --- | --- |
| \(B:143/84\) | \(F_+:157/42\) | \(+\) |
| \(B:43/28\) | \(F_-:23/6\) | \(+\) |
| \(F_+:137/42\) | \(B:99/28\) | \(+\) |
| \(F_-:19/6\) | \(B:311/84\) | \(+\) |
| \(F_+:1579/3136\) | \(K:5/4\) | \(-\) |
| \(K:13/4\) | \(F_+:1683/3136\) | \(-\) |
| \(F_-:1187/2240\) | \(K:19/4\) | \(+\) |
| \(K:27/4\) | \(F_-:1179/2240\) | \(+\) |
| \(K:185/28\) | \(K:137/28\) | \(-\) |

Number the arcs \(1,2\) on \(B\), \(3,4\) on \(F_+\), \(5,6\) on \(F_-\), and \(7,8,9\) on \(K\). The first arc on each component starts at edge zero and extends to the first undercrossing. If the over meridian is \(x_j\) and the signed over-under determinant is \(\epsilon\), the transported outgoing under meridian is \(x_j^{-\epsilon}x_{\rm in}x_j^\epsilon\). One sign check uses a positive crossing with over direction \(+x\), under direction \(+y\), and basing paths from higher \(z\). Moving the under basing path across the crossing traces a positive meridian of the over strand. The based transported longitude is the product of the signed over meridians in undercrossing order, multiplied by its own meridian to minus the self-crossing writhe. Hence the three preferred longitude words used for surgery are \(x_4x_6,\ x_8^{-1}x_1,\ x_7x_1\), respectively. The \(K\) longitude gives the expected class \(4g\).

Impose \(x_1^3(x_4x_6)^2,\ x_3^3(x_8^{-1}x_1)^{-2},\ x_5^3(x_7x_1)^{-2}\) as relators. Five Wirtinger relations solve successively for \(x_8,x_4,x_2,x_6,x_9\), so the remaining Fox matrix has seven rows on \(x_1,x_3,x_5,x_7\). Prefix exponents use the exact character \((0,-2,2,3)\). The checker verifies the Fox boundary identity row by row. For each three-row, three-column minor, exact Laurent multiplication and the rational Euclidean algorithm give the primitive polynomial gcd, and the gcd of the integer minor contents recovers the integral scalar. Across the full matrix the result is \(5+7t+5t^2\), with minor-content gcd one. Deleting the \(x_7\) column alone gives \((1+t+t^2)(5+7t+5t^2)\) after integral primitive normalization. The extra factor is the Fox kernel entry \((t^3-1)/(t-1)\). The unrestricted minors both check this factor and avoid depending on its removal. Centering gives
\[
       \Delta_{E'}(t)=5t^{-1}+7+5t .
\]
Here a polynomial order, and not a presentation-matrix determinant with an extra column factor, is used. [Fox, *Free Differential Calculus I*, incidence interpretation and product rule](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/fox1.pdf) · [Turaev, *Reidemeister torsion in knot theory*, §1.1 and Theorem 1.6.1](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/turaev1.pdf)

## Specializations for the two single branch knots

Let \(D(x,y)=\Delta_{S_0\cup U}(x,y)\) be the centered two-variable polynomial from E66, with \(x\) for the old singular meridian \(\sigma\) and \(y\) for the meridian \(a\) of the dual unknot \(U\). In the two-link exterior \(Z\) the other peripheral relation is \(\mu=3\sigma-3a\). For \(E'\), start with the twofold cover of \(Z\) branching after filling along the old lift, whose parity sends both \(\sigma\) and \(a\) to the nontrivial element. The character \(\sigma\mapsto1,\ a\mapsto t^{-1}\) restricts to the primitive character just computed, since \(A=2a\) maps to \(t^{-2}\) and \(\mu\) maps to \(t^3\). Splitting the two sheet representations gives torsion \(D(1,t^{-1})D(-1,-t^{-1})\) for the cover of \(Z\). Its lift of the old solid torus is filled along \(\sigma^2\). A liftable longitude differs from the old preferred longitude by \(\sigma\) if needed for parity, and its character is \(t^{\pm3}\) by the winding-three datum. This filling divides the torsion by \(t^3-1\) up to a unit. By the Torres axis specialization and the boundary rank-one convention,
\[
 \Delta_{E'}(t)\doteq
 \frac{(t-1)D(1,t^{-1})D(-1,-t^{-1})}{t^3-1}\doteq D(-1,-t).
\]
The sign and monomial units removed here are the usual torsion and Alexander units. One may see the sheet product directly by using symmetric and antisymmetric sums of the two cell lifts. The constant basis-change determinants cancel by Euler characteristic zero. The solid-torus factor comes from its core circle, and the common torus is acyclic with torsion a unit under the given nontrivial longitude character. [Turaev, §1.3 and rank-one formula in §1.6](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/turaev1.pdf) · [Kadokami, Lemmas 3.1–3.2, surgery core and link torsion](https://www.kurims.kyoto-u.ac.jp/~kyodo/kokyuroku/contents/pdf/1747-06.pdf) · [Torres, Chapter II, Theorems 2 and 3](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/torres.pdf)

For the chosen representative the values at \(t=1,-1,i,-e^{i\pi/3}\) are \(17,-3,7,2\). In the \(y+y^{-1}\) variable the centered polynomial \(D(-1,y)\) is therefore \(\pm(7-5(y+y^{-1}))\). The Torres factor in \(D(-1,1)\) has absolute value one, so \(\det S_0=3\). In particular \(\pi_1\Sigma_2(S_0)\) has abelianization \(C_3\). Its cyclicity, which is needed for the first odd-dihedral possibility, remains undecided.

For \(s=1\) let \(W_1\) be the exterior of \(S_1\) in the ordinary \(\mathbb{RP}^3\) filling. Its primitive free generator \(g_1\) has \(\sigma=2g_1,\ a=3g_1\) by the relation \(3\sigma-2a=0\). In surgery on \(U\), the curve \(a\) meets the filled meridian once and so represents the attached core, up to orientation. Its character is \(t^3\). Thus
\[
     \Delta_{W_1}(t)\doteq
     \frac{(t-1)D(t^2,t^3)}{t^3-1}.
\]
For the ordinary degree-two ambient lift of \(W_1\), the restriction of the free character has image \(2\mathbb Z\). The resulting exterior of the single knot \(K_1\subset S^3\) has variable \(s=t^2\). The symmetric and antisymmetric characters of the unbranched cover give
\[
 \Delta_{\operatorname{ext}(K_1)}(t^2)\doteq\Delta_{W_1}(t)\Delta_{W_1}(-t).
\]
The rank-one torsion denominators multiply to \(1-t^2\), which cancels the covered exterior's denominator up to sign. At \(t=i,-i\), the two ratios \((t-1)/(t^3-1)\) have absolute value one and \(|D(-1,\pm i)|=7\). Hence \(\det K_1=49\). Its double branched cover has nontrivial first homology. The [marked single-knot criterion](MARKED_LENS_CORE.md#the-remaining-singular-knot-and-its-cyclic-lifts) therefore rules out cyclicity of the second actual orbifold group. This is the group with only the old weight-two knot and a regular new core. The cyclic or odd-dihedral circle-action recognition route cannot handle this second filling by its stated group hypotheses.
