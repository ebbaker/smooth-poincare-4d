# WIT-E09A · Replay of the four based seam paths

28 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex assistance. Non-author execution under [request R1](../research-progress/handoffs/REQUEST_BASED_EXTERIOR_R1.md), on checkout `e171829f1c59a8a1fc66a2f1bd7ff42b2037aa6b`. The request lists GPT-6.2 Sol / ultra for bounded helpers. Actual serving variant and effort are unavailable. Scope is a connected smooth oriented exterior surface with four full original cap sections in the marked minus puncture, and the corresponding problem of continuous maps of oriented surfaces to the planar base.

The marked projection, seam signs and genus bound pass. For the ordered seam words \((r,r^{-1},s,s^{-1})\) with projected cut paths \((1,x^m,1,y^n)\), a genus-zero map exists exactly at \((m,n)=(0,0)\). The lower bound applies to an embedded exterior connector if its cut paths realize those data. The converse constructs a surface map to the planar base.

## Marked geometry and orientations

The rounded exterior is a subspace of the original \(F\times D^3\), so projection to the radius-4 disk with holes of radius \(1/4\) at \((\pm1,0)\) is defined even at the rounded faces. In [the signed handle data](../../05_certificates/numerics/e06_handles.json), the consecutive loop slots are \((x^{-1},y,y,x,y^{-1},y^{-1},y^{-1})\) and \((x^{-1},y,x,x,y^{-1},x^{-1},x^{-1})\). Each positive core makes one counterclockwise circuit about its own hole, beginning at the origin, and their union is a based rose. Cutting across the two original planar strips gives the corresponding free generators. The ordered words and exponent columns are

\[
r=x^{-1}y^2xy^{-3},\qquad s=x^{-1}yx^2y^{-1}x^{-2},\qquad
\overline r=(0,-1),\quad \overline s=(-1,0).
\]

I checked the minus sign of the second relator against the displayed equation with \(y^{-1}\) in Shehper et al., using the original JSON to fix the based representative. Gabai's Problem 13.6 gives the family containing this presentation. The signed seams themselves come from the repository marking. [Shehper et al., v2 §3.3](https://arxiv.org/html/2408.15332v2#S3.SS3) · [Gabai, v2 §13, Problem 13.6](https://arxiv.org/pdf/2212.02004v2#page=62)

For a full section disk with transverse coordinate \(n\) fixed, the circle at outward collar coordinate \(u\in[0,1/8]\) projects to \(c_i(t)+\epsilon(1+u)(n_1,n_2)\), where \(\epsilon=1/16\). Multiplying the displacement by a parameter between zero and one is a homotopy in \(F\). The cores have distance at least 1 from either hole center and at most 2 from the outer center. The entire displacement is bounded by the certified \(5/64\). At \(t=0\), the moving basepoint travels on the straight segment between the displaced point and the planar origin \(q_0\). The puncture knot projects into the central disk of radius \(1/16\) because the pole chart reads \(X,Y\) unchanged. A fixed central disk of radius \(1/4\) contains both this projection and all the seam basepoint segments. It gives a contractible setting for the short identifications. [CERT E06, strands and framed handles](../../05_certificates/notes/E06_PRESENTATION_HANDLES.md#framed-handles-and-the-two-collar-identifications) · [WEX-E02, puncture and seams](../01_examples/notes/E02_PUNCTURE_INPUT.md)

The original seam preserves \((t,n)\). Its cap disk has standard collar orientation \(du\wedge dt\), hence boundary \(+dt\) at the outer edge. The exterior continues with the same surface orientation and the normal to its boundary there is \(-\partial_u\), hence its boundary word is read with \(-dt\). An oppositely oriented cap disk has exterior word read with \(+dt\). At either seam the exterior surface therefore contributes the inverse word at the positive disk and the forward word at the negative disk. In WEX-E07 the lower endpoints of both intervals carry the negative disks and the upper endpoints the positive disks. [WEX-E07, second tether and section signs](../01_examples/notes/E07_TWO_CAPS.md#the-second-tether)

## The cut paths and the polygon relation

Use a root on the knot of the exterior surface \(Q\). Write \(a\) for the path from \(q_0\) to its projection in the central disk. For cut \(j\), write \(b_j\) for its projected path from the projected root to the displaced seam basepoint and \(d_j\) for the straight path from that basepoint to \(q_0\). Then \(h_j=[a b_j d_j]\). If \(\alpha_j\) is the oriented seam loop at its displaced basepoint, the displacement homotopy gives \(t_j=[d_j^{-1}\alpha_j d_j]\). Thus the boundary loop based along cut \(j\) represents \(h_jt_j h_j^{-1}\). The knot loop contributes the identity.

Cutting the connected surface along the four disjoint-interior boundary cuts merges the five boundary components and preserves its genus. A standard handle cut on the resulting once-bordered surface expresses its based boundary as a product of \(g\) commutators up to inversion, with the four seam factors in the order actually read by the cut polygon. Thus \(\operatorname{cl}(W)\le g\). Capping the seam circles also preserves genus, since each added disk increases Euler characteristic by one and decreases the number of boundary components by one. For the converse, take a genus-\(g\) surface with the specified boundary and cut data, choose loops for a factorization of \(W^{-1}\) into \(g\) commutators, and assign them to the handle curves. If needed, pad a shorter factorization with identity commutators. The projected attaching loop of the cut polygon is then null-homotopic. Its null-homotopy extends the prescribed loops and paths over the polygon, and the matching copies of the cuts descend to the surface map. This argument tests exactly the boundary and cut data in the planar target. A smooth embedded connector in the four-manifold supplies such a map by projection and requires its own construction.

## Integer windings

With \([a,b]=aba^{-1}b^{-1}\), inserting the prescribed basings gives

\[
W=r(x^m r^{-1} x^{-m})s(y^n s^{-1}y^{-n})=[r,x^m][s,y^n].
\]

The abelianization vanishes for all \(m,n\). In the integral Heisenberg group with coordinates \((A,B,C)\), the group law adds the coordinates and adds \(AB'\) to the central coordinate. Consequently a commutator has central coordinate \(AB'-A'B\). Under \(x\mapsto I+E_{12},\ y\mapsto I+E_{23}\), the two commutators have central coordinates \(m\) and \(-n\) respectively. A planar map in this family therefore requires \(m=n\).

For every \(m\ne0\), the reduced form of \([r,x^m]\) is

\[
x^{-1}y^2xy^{-3}x^m y^3 x^{-1}y^{-2}x^{1-m},
\]

with its last power omitted at \(m=1\). All adjacent displayed nonempty blocks use different generators. Its first letter is \(x^{-1}\). For every \(n\ne0\), \([s,y^n]^{-1}=y^n s y^{-n}s^{-1}\) is freely reduced at all three joins because both ends of \(s\) and of \(s^{-1}\) have generator \(x\). Its first letter has generator \(y\). If both windings are nonzero, these two reduced words cannot be equal, so \(W\ne1\). If just one winding vanishes, its commutator is the identity and the other is nontrivial by the same reduced forms. If both vanish, \(W=1\) and the polygon extends with no handle curves. In particular, the class-two test vanishes at \((1,1)\) while the free word forces positive genus.

Changing the common basepoint path conjugates the whole product and preserves commutator length. Changing an individual cut can change its basing, and changing the cut system can change the order read by the polygon. Under a change of cut system on the same surface, one must use the resulting relation including its handle loops. The disk obstruction is conditional on realization of the prescribed marking. For the known meridian tree control, the pole part and both tether charts project into the central disk. The two cap access corridors can stay close to \(t=0\), where the original core paths are near \(q_0\), and detour around the small tether feet before reaching the four seam basepoints. In this connected set one can take disjoint-interior rooted paths by using a small neighborhood of an embedded tree joining the five boundary components. Their projections read trivial words. This agrees with the planar disk and the separate terminal three-ball replacements of that tree. [Tree construction](../01_examples/notes/E07_TWO_CAPS.md#the-second-tether) · [First tether](../01_examples/notes/E04_NATIVE_SURFACE.md#a-handle-with-explicit-endpoint-frames) · [Leaf removal](../notes/TWO_BELT_LEAF.md)

## Evidence

SHA-256 prefixes identify the inspected [lead note](../notes/BASED_EXTERIOR.md) `9a8c1ac14d317e04`, [request](../research-progress/handoffs/REQUEST_BASED_EXTERIOR_R1.md) `2ff5b6688437e017`, [original JSON](../../05_certificates/numerics/e06_handles.json) `f898a23925988690`, [CERT E06](../../05_certificates/notes/E06_PRESENTATION_HANDLES.md) `0718114604f51a00`, [WEX-E02](../01_examples/notes/E02_PUNCTURE_INPUT.md) `f1e6e75d0af37e82`, [WEX-E04](../01_examples/notes/E04_NATIVE_SURFACE.md) `cd07e974baf73568`, [WEX-E07](../01_examples/notes/E07_TWO_CAPS.md) `041381b5956cedd4`, and [leaf note](../notes/TWO_BELT_LEAF.md) `3ace20e9eeb98ce`. The original `e06_check.py` passed the signed rows, clearance and collar data. Primary inspection on 28 November concerned the displayed presentation and family in the cited passages. The polygon, sign and all-integer free reductions above were independently checked for this packet.
