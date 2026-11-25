# SP4-MASTER-E36 · Recognition from a marked two-middle-handle height

25 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded analytical E packet on the two tree reductions and two
specified surgery tests. Requested GPT-6.2 Sol/ultra. Actual serving model and
reasoning effort were unavailable. Base commit
`2689540e6dae1656b7f5ad4be52504db044995f2`. Input hashes and checked source
passages are recorded below.

**Result.** For a selected Morse height on a smooth homotopy four-sphere with
two middle handles, use both tree reductions and retain the induced boundary
markings. If all remaining odd handles are on one side, one unknotted
component of the actual two-component attaching link, after reversal if
needed, suffices for smooth recognition. If there is one odd handle on each
side, an intermediate level diffeomorphic to \(\#_2(S^1\times S^2)\) between
the middle handles suffices, including after framed slides that preserve the
closed manifold. The mixed dotted-circle diagram singles out a candidate
two-component sublink with first homology \(\mathbb Z^2\) after surgery. Its
three-manifold diffeomorphism type is a further geometric premise.

## One height and both transported ends

Let \(M\) be a closed connected oriented smooth homotopy four-sphere. For a
smooth immersion \(F:M\looparrowright\mathbb R^5\), take \(g=F^*g_{\rm Eucl}\)
and the chiral energy \(E_+(g)=\int_M |W^+|^2_{\rm HS}\,dV_g\), using the
real operator on \(\Lambda^+\). Under \(E_+(g)<8\pi^2\) on a hypothetical
nonstandard type, the [immersion theorem](../manuscript/immersion_entry.tex)
selects regular directions with exactly two index-two critical points. Fix
one such direction \(u\) for \(h=\langle F,u\rangle\) on the actual domain.
The following is a proof for any such marked presentation, with a supplied
diagram needed to check its additional geometric hypotheses on a particular
immersion.

Write \(n_i\) for the counts of \(h\). Rearrange the Morse presentation by
index on \(M\), choosing gradient-like data and collars for the auxiliary
ordered presentation. In particular the two index-two handles can attach
with disjoint framed embeddings to one incoming cut, by using a single
critical level for their index block. One can order them within that block
by attaching either first. These cuts and attaching maps come from the
auxiliary presentation. A comparison of their geometry with physical
height levels would require additional maps. [Milnor, *Lectures on the
h-Cobordism Theorem*, §4, Final Rearrangement Theorem and its self-indexing
formulation](https://www.math.auckland.ac.nz/~hekmati/Books/Milnor2.pdf)

Write \(M=P\cup_p N\cup_{q^{-1}} Q\), where \(P,Q\) are the lower and upper
dual \(0\)–\(1\) bodies, \(N\) is the collared middle cobordism, and
\(p:\partial P\to\partial_-N\), \(q:\partial Q\to\partial_+N\) are the
actual identifications. Each end body is connected since every subsequent
attaching region in its own direction is connected. In each graph of
0-handles and 1-handle feet, thicken a spanning tree and round it to one
four-ball. Successively absorbing the leaf balls and their tree edges gives
this identification and carries the unused feet as marked boundary disks.
Write \(P',Q'\) for the resulting presentations and \(\alpha:P'\to P\),
\(\beta:Q'\to Q\) for the diffeomorphisms of the actual end bodies. Their
numbers of 1-handles are \(\ell=n_1-n_0+1\) and \(r=n_3-n_4+1\),
respectively. [E33](../reviews/E33_INDEX_TWO_HANDLES.md) · [Milnor, §5,
First Cancellation Theorem](https://www.math.auckland.ac.nz/~hekmati/Books/Milnor2.pdf)

For each actual framed attaching tube \(a_i:S^1\times D^2\to\partial_-N\),
the transported attaching tube is
\[
 a'_i=(\partial\alpha)^{-1}\circ p^{-1}\circ a_i.
\]
The same construction on the turned-over cobordism pulls each dual tube
back by \((\partial\beta)^{-1}\circ q^{-1}\). Write
\(X=P'\cup_{a'_1,a'_2}(D^2\times D^2)^{\sqcup 2}\) and let
\(\eta:\partial X\to\partial_+ N\) be the induced outgoing trace marking.
Then the closed manifold is \(X\cup_\varphi Q'\), where
\[
 \varphi=(\partial\beta)^{-1}\circ q^{-1}\circ\eta.
\]
The comparison diffeomorphism is induced by \(\alpha,\operatorname{id}_N,\beta\)
on the collared pieces. After a framed slide with trace diffeomorphism
\(s:X_{\rm new}\to X\), the upper gluing is \(\varphi\circ\partial s\).
Reordering handles attached along disjoint tubes identifies the same trace
and keeps its outgoing marking under that identification. The reduced count
is \((1,\ell,2,r,1)\), and \(\chi(M)=2\) gives
\(\ell+r=2\). [E33](../reviews/E33_INDEX_TWO_HANDLES.md) · [Stipsicz,
*On the vanishing of the third spin cobordism group*, §1, p. 899](https://www.maths.ed.ac.uk/~v1ranick/papers/stipsicz.pdf)

## One-sided diagram with an unknotted component

For \((\ell,r)=(2,0)\), turn the entire marked presentation over. In the
resulting \((0,2)\) case let \(L\subset\partial D^4=S^3\) be the actual
two-component framed attaching link. The surgery boundary is the boundary
of \(Q'\cong\natural_2(S^1\times D^3)\), hence diffeomorphic to
\(\#_2(S^1\times S^2)\). Here \(\natural\) denotes boundary connected sum.
The surgery matrix presents \(H_1\) on the two meridians. Since that group
is \(\mathbb Z^2\), the matrix is zero, so both framings are zero relative
to the preferred longitudes and the linking number is zero. If one
component is the unknot, Proposition 3.2 gives framed slides taking the
link to the zero-framed unlink. Its proof allows the unknotted component to
remain fixed while the other slides over it. [Gompf–Scharlemann–Thompson,
*Geometry & Topology* 14 (2010), Propositions 2.2 and 3.2, pp. 2310–2314](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-p.pdf)

The resulting trace is \(\natural_2(S^2\times D^2)\). Use the trace
diffeomorphism to pull back the actual outgoing gluing. Theorem A at
\(p=2\) applies to this boundary diffeomorphism with the known \(Q'\),
giving \(M\cong S^4\). The proof also applies after any supplied framed slides
that exhibit an unknotted component. [Laudenbach–Poénaru, *Bull. Soc. Math.
France* 100 (1972), Theorem A, p. 337](https://www.numdam.org/item/10.24033/bsmf.1741.pdf)

## Mixed diagram and the intermediate surgery test

Now \(\ell=r=1\). In a Kirby diagram for \(X\) let \(U\) be the dotted
unknot for \(P'\cong S^1\times D^3\), and let \(K_1,K_2\) represent the
actual framed tubes in its boundary. Turning the dot on \(U\) to zero gives
a boundary presentation by the three-component framed link
\(U_0\cup K_1\cup K_2\). The outgoing boundary is still
\(\partial Q'\cong S^1\times S^2\). On the interior this is a circle
surgery, replacing a copy of \(S^1\times D^3\) by \(D^2\times S^2\)
away from the outgoing boundary. For instance the Euler characteristic
of the lower trace increases by two. Boundary-preserving moves on the full
three-component surgery link still give first Betti number one. A
two-component R-link must give \(\#_2(S^1\times S^2)\), which has first Betti
number two. [Stipsicz, §1, p. 899](https://www.maths.ed.ac.uk/~v1ranick/papers/stipsicz.pdf)

Attaching handles of indices three and four preserves \(H_1\), so
\(H_1(X)=0\). The 2-to-1 handle boundary is the row
\((\operatorname{lk}(U,K_1),\operatorname{lk}(U,K_2))\) because the meridian
of \(U\) generates \(H_1(\partial P')\). Its entries have greatest
common divisor one. Handle slides and orientations implement the Euclidean
algorithm on this row. Choose such a marked diagram with row \((1,0)\).
Writing \(a,c\) for the resulting framings and \(b=\operatorname{lk}(K_1,K_2)\),
the full surgery matrix is
\[
 \begin{pmatrix}0&1&0\\1&a&b\\0&b&c\end{pmatrix}.
\]
Its rank is two by the outgoing boundary, and its determinant is \(-c\).
Thus \(c=0\). In the surgery matrix, the basis change \(K_2\mapsto K_2-bU\)
also removes \(b\), leaving a unimodular rank-two block paired with the
zero class. Geometric cancellation still requires a cancelling position in
the dotted diagram. Passing to a sublink requires identifying its own
surgery boundary.

Keeping just \(U_0\cup K_2\) yields a two-component link with one unknot,
zero framings and zero linking. Its surgery has \(H_1\cong\mathbb Z^2\).
Geometrically it is the actual intermediate boundary \(Y\) when \(K_2\)
is attached first. **If \(Y\cong\#_2(S^1\times S^2)\), then \(M\cong S^4\).**
The hypothesis also makes sense directly for either order of any marked
mixed presentation.

To prove it, cut at \(Y\). The pieces \(X_-\) and \(X_+\) each consist,
from their respective ends, of \(S^1\times D^3\) and one actual 2-handle.
The handle for \(X_+\) is the dual of the other original 2-handle, with
its own attaching framing transported through the upper marking. In
either piece, convert its dotted circle to zero to read the boundary as
two-component surgery in \(S^3\). The dotted component becomes an unknot
with framing zero, and the boundary is \(Y\). The proof of Proposition 3.2
gives an isotopy of the other knot in the zero surgery on the unknot,
\(S^1\times S^2\), to a zero-framed unknot in a ball. The isotopy in
\(S^1\times S^2\) transports the framing, and the final framing is zero by
the surgery homology in that ball. Extend this framed isotopy over a
collar of the actual \(S^1\times D^3\) and reattach the 2-handle. Both
pieces therefore have the smooth form
\[
 X_\pm\cong (S^1\times D^3)\,\natural\,(S^2\times D^2),
\]
with their identifications inducing boundary coordinates on the original
gluing. [Gompf–Scharlemann–Thompson, Proposition 3.2 and its isotopy in
\(S^1\times S^2\), pp. 2313–2314](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-p.pdf)

In each displayed piece replace an interior product neighborhood of
\(S^2\times\{0\}\) by \(D^3\times S^1\), using the remaining annulus as a
collar. The new pieces are \(B_\pm\cong\natural_2(S^1\times D^3)\), glued
through the same outer boundary maps. The cores \(\gamma_\pm\) of the new
products lie in opposite pieces, and simultaneous inverse circle surgery
on the two cores recovers \(M\). The boundary-extension theorem on
\(B_+\) turns the marked gluing into the standard double of \(B_-\), while
the comparison restricts to the identity on \(B_-\). This double is
\(\#_2(S^1\times S^3)\), as one sees by doubling the boundary connected
sum along its separating 3-disk. In the double \(\gamma_-\) is a product
core in one standard \(S^1\times S^3\) summand. [Laudenbach–Poénaru,
proof of Theorem A, pp. 341–342](https://www.numdam.org/item/10.24033/bsmf.1741.pdf)
· [Moussard, arXiv:2412.10210, Theorem 2.5 and proof of the boundary-extension theorem](https://arxiv.org/abs/2412.10210)

Surgery on \(\gamma_-\) replaces this summand by \(S^4\): the complement
of a standard core neighborhood in \(S^1\times S^3\) is another
\(S^1\times D^3\), and the replacement is \(D^2\times S^2\). Theorem A
at \(p=1\) applies to the actual surgery framing. The connected-sum ball
can be chosen away from the core, so the first surgery leaves
\(S^1\times S^3\) up to diffeomorphism. The second core remains an embedded
circle in this manifold. If its class in \(\pi_1(S^1\times S^3)=\mathbb Z\)
is \(w\), van Kampen gives \(\pi_1(M)=\mathbb Z/\langle w\rangle\):
by general position removing a circle of codimension three preserves
fundamental group, and \(D^2\times S^2\) kills the boundary circle. Thus
\(w=\pm1\). After choosing its orientation the second core is freely
homotopic to the product core. In a generic smooth homotopy relative to the
endpoints, the derivative in the circle direction has no zeros by the
codimension-four rank condition, and two distinct points at a common time
have distinct images since the pair-and-time parameter space has dimension
three and the diagonal has codimension four. Hence the homotopy can be
chosen as an isotopy of the knots. Ambient isotopy extension and
tubular-neighborhood uniqueness put the remaining surgery on a standard
core. Theorem A at \(p=1\) again applies for the transported framing and
gives \(S^4\). If an oriented identification is desired, its orientation
can be adjusted by reflecting the standard sphere. [Laudenbach–Poénaru,
Theorem A, p. 337](https://www.numdam.org/item/10.24033/bsmf.1741.pdf)

A separate certificate in the mixed diagram is one transverse geometric
intersection of a 2-handle attaching circle with the 1-handle belt sphere
on the marked cut. The remaining 2-handle can be slid over the cancelling
one to remove each of its passages through the 1-handle before deleting the
pair. These are framed slides, and the outgoing marking is pulled back by
the resulting trace diffeomorphism. The counts become \((1,0,1,1,1)\),
so E33 applies. The integral row \((1,0)\) only controls the signed
intersection. [Stipsicz, §1, geometric cancellation and remaining handle,
p. 899](https://www.maths.ed.ac.uk/~v1ranick/papers/stipsicz.pdf) · [E33](../reviews/E33_INDEX_TWO_HANDLES.md#the-one-middle-handle-consequence)

## Scope and input versions

The curvature argument controls the original middle count. To obtain
recognition throughout the subcritical band by this route, one needs a
height direction and choices of marked handle presentation that exhibit a
recognized class, or a theorem covering the remaining diagrams. In the
mixed sublink test, the unresolved step is the diffeomorphism type of
\(Y\), which is stronger than the computed first homology. In the one-sided
case the additional hypothesis is an unknotted component in a diagram for
the actual trace. The supplied material includes no individual immersion or
drawn diagram on which to test either property. The recognition proofs use
the published special case of Property 2R in Proposition 3.2.

Primary passages inspected on 25 November 2026 are cited at their points of
use. The Proposition 3.2 check used the published Geometry & Topology
version (DOI `10.2140/gt.2010.14.2305`). The 1972 gluing paper was checked
at its Theorem A and the boundary diffeomorphisms in its proof, with the
explicit extension formulation cross-checked in Moussard's Theorem 2.5.
The published English version of Stipsicz's §1 documents the surgery and
diagram moves. Milnor's named passages were checked in a reproduction.
[Owning reference record](../../../references/SOURCE_NOTES_MASTER_RICCI_IMMERSION_20261125.md)

| Frozen input | SHA-256 |
| --- | --- |
| [Immersion section](../manuscript/immersion_entry.tex) | `512ef85cfa696497da0b43e6efee36c4c60dd1f7d1eb78f4442b6d078a0b2c8e` |
| [E33](../reviews/E33_INDEX_TWO_HANDLES.md) | `8e8d0078213eb5367c2ff35ae26d7bda246d101e522ac1283e3520765c6b62e8` |
| [E34](../reviews/E34_MIDDLE_WEYL_EQUALITY.md) | `af154cb515a24a51c9d4fb2aa58a61325fc023cdde5897ec08ea6826f77ec3bc` |
| [Parallel master handoff](../continuation-notes/PARALLEL_PROGRAM_20261125.md) | `558ee0badcbd72841688d22cd35757bcaffa72ad5ef5840535d6ca048939622c` |
| [Recognition branch handoff](../../investigations-1/04_hypersurface_immersions/02_two_handle_recognition/continuation-notes/CONTINUATION.md) | `fe845adf48553f6bbec2fdab04d156000b13dbf5ede7cdfb8c9555a3b0257a49` |
