# Independent reading of the four-point compression

26 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. Bounded E reading 3 of the
[independent request](../research-progress/handoffs/FOUR_POINT_READINGS_20261126.md).
The selected bounded reader was GPT-6.2 Sol/ultra. Actual serving model
and effort are unavailable. The
[compression note](../02_handle_isolation_and_marked_surgery/notes/FOUR_PORT_SUBSURFACE_COMPRESSION.md)
was checked at SHA-256
`0da1c477d93a4c4c00e114f784cbbef8fbc115bf132ee353a79704f80a554988`.
The [scientific issue](../research-progress/handoffs/FOUR_POINT_MARKED_RETURNS_20261126.md)
was checked at SHA-256
`ac934a5d025385349fe1a9f7cf14b4090c4f60b6052e6ddcf003108e96a40996`.
The checked claim concerns smooth oriented integral surgery from
\(Y_1\) to \(Y_3\), with \(Y_j=\#_j(S^1\times S^2)\), and the supplied
four-point sphere and pairing.

**Verdict.** The argument proves that one of the two twice-punctured
tori \(U_-,U_+\) in the stationary-filled drilled slab \(X\) has a
smooth properly embedded compressing disk with essential, nonperipheral
boundary. The two based inclusions and both HNN gluings check. No
irreducibility hypothesis is used. The disk's geometric intersection
with the marked return meridian is undetermined by this argument.

## The cut and its annuli

Follow the moving knot from \(1_-\) along the lower return. Its wall
intervals on the boundary of the filling disk encounter labels
\(1,2,4,3\) in that cyclic order, through \(2_-\!-\!4_+\) and
\(3_-\!-\!1_+\). The sphere crossings at \(1,2,4,3\) have signs
\(+,-,-,+\), up to simultaneous reversal. Integrality makes the
positive old meridian the circle factor \(f\) of the solid torus.
In boundary coordinates the gluing sends the disk meridian to the
actual oriented integral slope, which is an old longitude plus an
integer multiple of the old meridian. This shear preserves the fibers
and puts each seam meridian over its corresponding labeled point.

Cut the filling disk along \(d_{12}\) and \(d_{34}\), cutting off the
two return intervals. Both pairs have opposite crossing signs. The
chord annuli attach to the four-holed sphere to make a connected
orientable closed surface \(F\) of Euler characteristic \(-2\).
Cutting along \(F\) leaves \(X\), two sectors times \(S^1_f\), and the
middle quadrilateral times \(S^1_f\). Each sector retracts to its
attaching interval relative to that interval, so the end blocks
extend the collars of the return walls. The only attachments of the
middle solid torus \(M\) to \(X\) are its two opposite side annuli
\(A_1,A_2\), each carrying the full circle factor.

The chord copies on the lower side are the end-sector \(d_{12}\) and
the middle \(d_{34}\). At the latter's two endpoints the through
annuli meet \(3_-,4_-\). The upper side has the end-sector \(d_{34}\)
and the middle \(d_{12}\) with endpoints at \(1_+,2_+\). Thus each
exposed \(F_\epsilon\) is its twice-punctured torus \(U_\epsilon\)
closed by the corresponding middle annulus \(B_\epsilon\). The cut
outlet \(C\) is connected because \(X\) is connected and all three
blocks attach to it. The outlet gluing \(h:F_-\to F_+\) uses the
original sphere identification and matches the two copies of each
chord in the same filling coordinates. In particular \(h\) exchanges
end-sector with middle chord copies. Its inverse reverses those
identifications.

## The two HNN constructions

Write \(G=\pi_1(X,b)\). In the inlet link exterior \(E\), the two
meridians freely generate the kernel of \(H_1(E)\to H_1(Y_1)\).
Indeed \(H_2(Y_1,E)\cong\mathbb Z^2\) by excision and the map
\(H_2(Y_1)\to H_2(Y_1,E)\) records algebraic intersections with
the two cores, both zero. Also \(H_1(Y_1,E)=0\). The quotient
\(H_1(Y_1)\cong\mathbb Z\) splits this exact sequence, so
\(H_1(E)\cong\mathbb Z^3\). Filling adds the two slope relations.
The outlet still has rank three, so both slope classes vanish
in \(H_1(E)\). The positive moving meridian survives with infinite
order after the stationary filling alone. The quotient identifying
the seam of \(X\) maps every positive wall fiber to this class.
In particular each through annulus injects into \(G\) and each
boundary loop of \(U_\epsilon\) has infinite order in \(G\).

Use left-to-right path concatenation. For either sign choose paths
\(a_{i,\epsilon}\) from \(b\) to a point \(x_{i,\epsilon}\) on
\(A_i\cap B_\epsilon\), with a common path into \(U_\epsilon\)
followed by a path in \(U_\epsilon\). Choose the endpoints at one
circle parameter. Let \(f_{i,\epsilon}\) be the positive fiber
there and \(m_\epsilon\) the horizontal arc in \(B_\epsilon\)
from \(x_{1,\epsilon}\) to \(x_{2,\epsilon}\). Then
\[
c_{i,\epsilon}=a_{i,\epsilon}f_{i,\epsilon}a_{i,\epsilon}^{-1},
\qquad
t_\epsilon=a_{1,\epsilon}m_\epsilon a_{2,\epsilon}^{-1}.
\]
Van Kampen on the two spaces \(X,M\) joined along the two annuli
uses \(A_1\) as the tree edge. Its map into \(\pi_1(M)\) is an
isomorphism, so the amalgam removes that vertex group. The
\(A_2\) edge leaves the presentation
\[
 \pi_1(C,b)=\langle G,t_\epsilon \mid
 t_\epsilon^{-1}c_{1,\epsilon}t_\epsilon=c_{2,\epsilon}\rangle.
\]
Both cyclic edge maps are embeddings. They may have coincident
or conjugate images in \(G\), which the base-group inclusion
theorem allows. If \(\eta_i\) is the horizontal arc in \(A_i\) from
its lower to its upper endpoint, the middle disk gives
\(m_+\simeq\eta_1^{-1}m_-\eta_2\) relative to endpoints. With
\(g_i=a_{i,+}\eta_i^{-1}a_{i,-}^{-1}\) in \(G\), the upper
presentation uses \(c_{i,+}=g_ic_{i,-}g_i^{-1}\) and
\(t_+=g_1t_-g_2^{-1}\).
[Higman–Neumann–Neumann, Theorems I and I′, pp. 248–249](https://londmathsoc.onlinelibrary.wiley.com/doi/pdf/10.1112/jlms/s1-24.4.247)

Closing \(P_\epsilon=\pi_1(U_\epsilon)\) with \(B_\epsilon\)
gives the same presentation with \(P_\epsilon,s_\epsilon,e_{i,\epsilon}\)
in place of \(G,t_\epsilon,c_{i,\epsilon}\). Here \(e_{i,\epsilon}\)
is the boundary loop oriented along \(f\) and based by the final
segment of \(a_{i,\epsilon}\). These are essential boundary circles,
so both edge maps are embeddings and the base group injects into
\(\pi_1(F_\epsilon)\). Inclusion maps the stable letter exactly
to \(t_\epsilon\). If \(P_\epsilon\to G\) injects, the inverse
image in \(P_\epsilon\) of \(\langle c_{i,\epsilon}\rangle\)
is precisely \(\langle e_{i,\epsilon}\rangle\), since every power
of \(c_{i,\epsilon}\) already has the specified antecedent.
Thus a stable-letter word reduced in \(\pi_1(F_\epsilon)\) stays
reduced in \(\pi_1(C)\) and is nontrivial there by Britton's
lemma. Words in \(P_\epsilon\) are handled by the two base maps.
Conversely any nonidentity kernel element of \(P_\epsilon\to G\)
survives in \(\pi_1(F_\epsilon)\) and vanishes in \(\pi_1(C)\).
[Britton, Lemmas 3–4, pp. 20–21](https://lib.ysu.am/articles_art/ff248019fda39fba752a57bb459f99cd.pdf#page=5)

If both \(P_\epsilon\to G\) inject, choose points on \(F_\pm\)
identified by \(h\) and paths \(q_\pm\) to them from \(b\).
For the actual outlet gluing, let \(\tau\) follow \(q_-\), cross
the gluing cylinder, and follow \(q_+^{-1}\). Its relations are
\(\tau^{-1}j_-(\gamma)\tau=j_+(h_*\gamma)\), where \(j_\pm\) use
those base paths. This is an HNN extension of \(\pi_1(C,b)\)
over the embedded surface groups, so the outlet group contains
a closed genus-two surface group. A subgroup of \(\pi_1(Y_3)\)
is free by the covering-graph construction. A closed orientable
genus-two surface is aspherical and its group has \(H_2=\mathbb Z\).
Hence the embedded surface group cannot occur, and some
\(P_\epsilon\to G\) has nontrivial kernel.
[Higman–Neumann–Neumann, Theorems I and I′, pp. 248–249](https://londmathsoc.onlinelibrary.wiley.com/doi/pdf/10.1112/jlms/s1-24.4.247)

## The disk boundary

Delete from the rounded \(X\) the boundary points outside
\(\operatorname{int}U_\epsilon\). The remaining smooth manifold
has boundary \(\operatorname{int}U_\epsilon\), which is homotopy
equivalent to \(U_\epsilon\) by its internal boundary collar.
A nullhomotopy of a kernel loop can be pushed into \(\operatorname{int}X\)
away from its domain boundary using the collar of \(X\). The Loop
Theorem applies to this possibly noncompact three-manifold and
produces a properly embedded disk with essential boundary. A
smooth choice after rounding is proper in \(X\) as well.
Any boundary-parallel essential circle represents a conjugate
of one of the two boundary loops up to orientation. Those have
infinite order in \(G\), as do their nonzero powers. Thus the
disk has nonperipheral boundary.
[Hatcher, Theorem 3.1 and the boundary restriction used in Corollary 3.2, pp. 45, 48](https://pi.math.cornell.edu/~hatcher/3M/3M.pdf#page=46)
