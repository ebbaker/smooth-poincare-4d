# WEX-E03 · The unknot controls and exclusion for one birth

27 November 2026 (America/New_York), 28 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex assistance. The recorded helper dispatch specifies `gpt-6.2-sol` at ultra effort. The serving settings were not independently observable from the helper. Checkout `e171829f1c59a8a1fc66a2f1bd7ff42b2037aa6b`. Inputs [request R1](../research-progress/handoffs/REQUEST_E03_R1.md), SHA-256 `dcd0d7f034a5194b9f92c7a1abfd8c5122c981a1364200861a73fdd32f77f86f`, the [B01 decision](../brainstorm/notes/B01_MOVIE_CLASS.md) and the [E01 knot intake](E01_KNOT_INPUT.md). Evidence comprises explicit smooth embedded controls and a deductive exclusion using a checked theorem.

## One outward minimum forces an unknot boundary

Suppose \(D\) is a smooth properly embedded disk in the oriented standard \(B^4\) with oriented boundary \(K\) at radius one, a terminal product collar, and a radial Morse movie with one interior minimum and arbitrary finite saddle and maximum counts. A radial Morse movie is smooth on the disk, so for the radius function this assumes the disk avoids the origin. The same argument also applies to squared radius when the unique nondegenerate minimum is at the origin. The compact disk attains its smallest radius at the unique minimum \(p\). After choosing a small neighborhood of \(p\), its complement in \(D\) has a strictly larger minimum radius. A sufficiently small regular value above \(\rho(p)\) therefore cuts off just the embedded Morse subdisk. Its level boundary is an unknot \(U\). In fact \(p\) has its tangent plane in the ambient level when \(\rho(p)>0\). One may then use a product chart of the levels whose two spatial coordinates project diffeomorphically on that subdisk. The cut is a small planar circle in the Morse coordinates, graphed into a three-ball of the regular level. The graph can be flattened there. If \(p=0\) and squared radius is used, smoothness gives a local graph over the tangent plane with derivative zero at the origin. Scaling the graph function to zero gives an isotopy of its small spherical intersections to a round circle, since the squared norm along each radial ray of the graph is increasing near the origin uniformly during this scaling.

The complement in \(D\) of the open bottom subdisk is an annulus properly embedded in a spherical shell. The radial identification of the shell with \([0,1]\times S^3\) keeps each level identified by \(x\mapsto x/|x|\). Straightening at the cut gives a product collar, since the intersection is transverse and a short shell consists of a smooth isotopy of the level knots. In outward time this annulus runs from \(U\) to \(K\) and has only indices 1 and 2. Reverse time and reverse its surface orientation to obtain a concordance from \(K\) to \(U\) with the oriented ends in the convention \(-K\sqcup U\). The radial identification introduces no spatial reflection. Under reversal, an index 2 becomes index 0 and index 1 stays index 1. The reversed annulus is a ribbon concordance in Zemke's sense. His Theorem 1.5 gives \(g_3(K)\leq g_3(U)=0\), where \(g_3\) is Seifert genus in \(S^3\). A genus-zero Seifert surface is an embedded disk in \(S^3\), so \(K\) is an unknot. [Zemke, *Knot Floer homology obstructs ribbon concordance*, Ann. Math. 190 (2019), §1 and Theorem 1.5, pp. 931, 934](https://annals.math.princeton.edu/wp-content/uploads/annals-v190-n3-p05-s.pdf)

Dunfield–Gong define their census in Theorem 1.1 to consist of nontrivial prime knots of at most 19 crossings, up to ambient homeomorphism. Their §1.8 defines \(\mathrm{PS}_{19}\) within this census and their Table 11 identifies `16n68278` as one of its members. Consequently `16n68278` cannot be the boundary of a proper standard-ball disk with this one-minimum radial Morse property. This conclusion applies to either mirror and any crossing or band budget within the one-birth class. A standard-ball disk movie for a nontrivial knot requires at least two outward minima. Sliceness beyond the one-birth class remains open for this target. [Dunfield–Gong v1, Theorem 1.1, §1.8 and Table 11](https://arxiv.org/pdf/2512.21825)

## One coordinate system for both controls

Write \(x,y,z\) for the positively oriented coordinates of the chart

\[
 \Psi(x,y,z)=\frac{(2x,2y,2z,x^2+y^2+z^2-1)}{1+x^2+y^2+z^2}\in S^3
\]

and put \(\Xi(\rho,x,y)=\rho\Psi(x,y,0)\). This embeds the planar diagram levels times the positive radius into the oriented ball. The chart is positive because at the south pole the ordered columns \((-e_4,e_1,e_2,e_3)\) are positive and the coordinate derivative scales the tangent columns by 2. All diagram isotopies below take place in the plane \(z=0\). Orient a regular diagram as the boundary of its planar sublevel when the movie comes from a height graph. This orders the feet compatibly with the surface orientation.

Both controls end at the same positive oriented planar circle diagram, represented geometrically by \(C=\{F=2\}\) for

\[
 F(x,y)=(x^2+y^2-1)^2+x/2.
\]

More generally, every level \(F=h\) with \(3/2\leq h\leq2\) is smooth and meets every radial ray in the plane once, at a radius in \((1,2)\). Indeed \(F<3/2\) on the closed unit disk and \(F\geq8\) at radius 2. On \(r\geq1\) the radial derivative \(4r(r^2-1)+\tfrac12\cos\theta\) is strictly increasing. The root at that larger value of \(F\) lies where the derivative is positive. Write \(R(\theta)\) for the smooth polar radius of \(C\). At the terminal diagram use the intersection with the negative \(x\)-axis as basepoint.

**Ordinary disk.** For \(1/4\leq\rho\leq1\) take the planar radial graph

\[
 r(\rho,\theta)=(1-\lambda(\rho))\sqrt{\rho-1/4}+\lambda(\rho)R(\theta),
 \qquad (x,y)=r(\rho,\theta)(\cos\theta,\sin\theta),
\]

in \(\Xi\), where \(\lambda\in[0,1]\) is smooth, zero for \(\rho\leq1/2\) and one for \(\rho\geq3/4\). Collapse the initial circle at \(\rho=1/4\). Near the collapse it is exactly the graph \(\rho=1/4+x^2+y^2\) with a nondegenerate minimum. For \(\rho>1/4\), the positive planar radius gives an embedded loop and the ambient radial coordinate distinguishes the levels. There is a product collar near one. Orient the birth with \(dx\wedge dy\) and extend the orientation, so the boundary is counterclockwise on \(C\). The counts are \((b,s,d)=(1,0,0)\).

**Padded disk.** For \(F\leq3/2\) take the graph \((x,y)\mapsto\Xi((1+F(x,y))/4,x,y)\), oriented using \(dx\wedge dy\). This graph is inside the positive-radius chart because \(F\leq3/2\) gives \(r<2\) and \(F\geq -r/2>-1\). For \(5/8\leq\rho\leq1\), continue the planar level loops with \(F=(1-\eta(\rho))(4\rho-1)+2\eta(\rho)\), where \(\eta\in[0,1]\) is smooth, zero near \(5/8\) and one for \(\rho\geq3/4\). The level function in this formula stays in \([3/2,2]\) and matches the previous graph on a collar of the join, so the resulting end is smooth and is a product near one. The graph part is an embedding because the planar coordinate projection recovers its input. The rest has embedded planar loops on distinct radii. It has a single boundary, with orientation that of the planar sublevel at the join and hence counterclockwise on \(C\).

The graph's only critical points have \(y=0\). At \(r=1\), \(F_x=1/2\), and away from that circle the equation \(F_y=0\) forces \(y=0\). The three roots of \(4x(x^2-1)+1/2=0\) satisfy

\[
 -2<x_1<-1,\qquad 0<x_2<1/\sqrt 3,\qquad 1/\sqrt 3<x_3<1.
\]

The Hessian along the axis is diagonal with entries \(4(3x^2-1)\) and \(4(x^2-1)\), so \(x_1\) is a minimum, \(x_3\) a saddle and \(x_2\) a maximum. Their values are ordered as \(F(x_1,0)<F(x_3,0)<F(x_2,0)<3/2\). The middle inequality follows from the strictly negative axis derivative between \(x_2\) and \(x_3\). The minimum is negative and the positive-axis saddle value is positive. The outward graph events therefore occur at distinct positive radii in the order birth, saddle, death. Starting at the birth, the compact planar sublevels are first disks, then annuli after the attachment of one orientable planar one-handle to the disk, then disks again upon filling the hole. Outside critical levels the planar curves vary by a planar isotopy. In particular the graph and its end collar form a connected oriented smooth disk with \((b,s,d)=(1,1,1)\), \(\chi=1\) and one boundary component.

For the saddle, choose an oriented Morse chart \((u,v)\) in the plane in which \(F=S-u^2+v^2\) with \(S=F(x_3,0)\). On a nearby incoming level \(S-\delta\) mark the two arcs \(u=\pm\sqrt{\delta+v^2}\) with \(|v|\leq h\), taking \(\delta,h>0\) small enough that the rectangle between them fits this chart. Take the band

\[
 \{(u,v):\ |v|\leq h,\ -\sqrt{\delta+v^2}\leq u\leq\sqrt{\delta+v^2}\}.
\]

Its interior has \(F>S-\delta\), so the strip sits entirely in an empty face of that level diagram. The two feet lie on the single incoming edge, with left foot oriented from \(-h\) to \(h\) and right foot from \(h\) to \(-h\). If \(L_\pm,R_\pm\) label their endpoints at \(v=\pm h\), this orders them cyclically as \((L_-,L_+,R_+,R_-)\). Use the untwisted planar framing. Replacing the feet by the two sides of the band gives the upper-level pairing \(v=\pm\sqrt{\delta+u^2}\). Locally the sides and upper arcs are planar arcs with the same endpoint pairing after transporting endpoints in the regular part of the Morse chart, and can be isotoped there through disjoint arcs. The saddle is genuine, with one negative and one positive Hessian eigenvalue, and splits the circle into the two boundary components of the annular sublevel.

For the death, use a small Morse disk \(u^2+v^2\leq h'^2\) in the plane of the maximum with \(F=M-u^2-v^2\), \(M=F(x_2,0)\). At the starting level \(M-\delta'\) with \(0<\delta'<h'^2\), its smaller circle of radius \(\sqrt{\delta'}\) bounds a marked planar disk containing no part of the other component. The graph over this smaller disk is the cap. It stays disjoint from the other cylinder throughout the slab, because the planar ball contains only the shrinking circle at these levels and the graph projection is injective. The local birth also occurs in an empty planar disk. The maximum's vanishing circle is thus explicitly split, including in the levels where the curves are nested in projection.

The padded movie uses only one empty-face planar band, four ordered feet, zero half-twists, at most two crossingless circles, at most two diagram edges and no Reidemeister moves. The ordinary movie uses only its birth. Both end at the same oriented based planar diagram. The theorem excludes the entire one-birth class for the named knot.
