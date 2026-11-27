# E79 · Independent replay of the even prism recognition

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance.
Actual helper model and reasoning effort are unavailable.
[Frozen E79 request](../research-progress/handoffs/E79_REQUEST_R1.md),
checkout 72068cef1973d23aee808fe66476c44ed4b99cc5. Reviewed inputs
are [E39](../notes/E39_PRISM_FILLINGS.md),
[E70](../notes/E70_EQUIVARIANT_SURGERY.md),
[E73](E73_FIRST_GROUP_REPLAY.md) and
[E76](E76_RECOGNITION_TRANSFER.md), SHA-256 prefixes
566185d2f1c515a7, ade2987d8bf24aa9, 63e3efb890f1e5046 and
0684e09e90f743a67, respectively. The category is smooth and oriented.
The group input is the actual native filled three-orbifold, with its
old order-two isotropy and a regular new core.

The even marked prism filling, represented by the longitude \(a\),
is diffeomorphic to standard \(S^4\). The local replacement and reverse
circle preserve the marking used in the \(S_3\) computation. The
reverse framed surgery carries a smooth effective circle action, to
which the published smooth classification applies. Even parity here
is relative to \(a\). The smooth type of the initial odd framed
filling remains open.

## The regular tube and its relative replacement

The monodromy is the period-six map induced by \(J=b(\cdot)j^{-1}\).
The chosen lift \([t,p_0e^{j\pi t/6}]\) closes because
\(Jp_0=p_0e^{-j\pi/6}\). Its projection to the orbit base is the
quotient of its great circle by the freely acting cyclic setwise
stabilizer of order twelve. E39 checks that other translates of the
great circle are disjoint. In particular the projected loop lies in
the principal stratum and the actual section projects to it with
degree one. The old exceptional locus is disjoint from a sufficiently
small closed tube about this regular loop. The group of the capped
mapping torus is \((Q_8\times C_{17})\rtimes\mathbb Z\), with the
actual section as stable generator. Conjugation by the generator
cycles \(i,j,k\) and inverts the order-seventeen generator, up
to simultaneously choosing the inverse convention. Killing the
section identifies \(i,j,k\), after which \(ij=k\) kills them all.
The inversion relation kills the odd-order cyclic factor. Thus
either framed circle surgery is simply connected. The surgery
changes the mapping torus's Euler characteristic from zero to two,
so duality and Hurewicz–Whitehead give a homotopy four-sphere for
each framing. [E39, actual suspension and regular marking](../notes/E39_PRISM_FILLINGS.md#the-canonical-suspension-and-the-actual-marked-torus).

The principal bundle over the tube trivializes because the base
solid torus has \(H^2=0\). The actual section over its core extends
to a constant-fibre section in that trivialization, by a gauge
depending on the core coordinate and extended radially. Denote the
product by \(A\times D^2_\mu\times F\), with \(A=S^1_a\) and
\(F=S^1_f\) the principal orbit direction. Use a chart in which the
core longitude on the boundary is \(a+s\mu\). From the \(a\)-chart
it rotates the normal disk through \(s\) turns along \(A\) and
keeps the fibre coordinate fixed. The circle section's oriented
normal three-framing therefore changes by \(s\bmod2\) in
\(\pi_1SO(3)\). This is the same normal framing class for all even
\(s\), and the same other class for all odd \(s\).

For the first surgery choose a ball \(B\subset D_\mu^2\times F\)
centered on the core fibre and invariant under meridional disk
rotation. It meets that fibre in a short interval. Remove
\(A\times\operatorname{int}B\) and insert \(D^2_a\times\partial B\)
in the fixed framing. The compressed sphere \(S_T\) consists of
\(A\) times the remaining core interval and the two disks
\(D^2_a\) at the poles of \(\partial B\). The disk coordinate
transverse to the core agrees with the two polar disk coordinates
on \(\partial B\). This gives a product normal neighbourhood of
\(S_T\), with one common polar angle \(S^1_\mu\).

One can see the relative product by deleting a tube of small fixed
disk radius about the remaining core, together with the matching
polar disks in the attached piece. Each meridional angle slice of
the exterior left in \(D_\mu^2\times F\) is an annulus with a notch
at its inner boundary from \(B\). The remaining belt of
\(\partial B\) is \(S^1_\mu\times I\), with \(I\) the notch edge.
Thus the complement of the sphere in the modified tube is
\(S^1_\mu\) times \(A\) times that annulus, with a three-dimensional
two-handle \(D^2_a\times I\) on its inner torus. This compresses
the inner torus to a sphere. Equivalently, straighten the annulus
relative to its outer boundary and take \(I\) as a subarc of
the inner copy of \(F\). Adding \(D^2_a\) over the complementary
arc of \(F\) fills the compressed sphere by a three-ball. This
last addition, times \(S^1_\mu\), is precisely the sphere surgery.
After rounding product corners the whole local replacement is
\[
        S^1_\mu\times D^2_a\times F .
\]
The parametrization is relative to the outer product torus. Hence
translation in \(F\) extends the old action by a free action on the
new piece. Its orbit replacement fills along \(a+s\mu\) with a
regular dual core, so the old order-two orbit survives unchanged.
The inverse circle \(\delta\) is the core of the inserted
\(S^1_\mu\times D^3\), with the product framing inherited from
this sphere surgery. Reversing that framed attachment recovers
the particular sphere \(\Sigma_s\) from the first surgery.
[E76, relative local construction](E76_RECOGNITION_TRANSFER.md#actual-geometric-hypotheses-and-reverse-circle).

## The actual group and the retained order-two orbit

I replayed the \(s=0\) substitutions in the E70 presentation. Its
native word puts \(L=\lambda_L\). With \(b_1=LbL^{-1}\) and
\(\lambda_L=b_1^{-1}F^{-1}\), this yields \(L=F^{-1}b\) and
\(b_{\rm top}=b\). Then \(\lambda_F=cF\). Its peripheral commutator
forces \(F\) to commute with \(c\), and \(F^3(cF)^{-2}=1\) forces
\(F=1\), since \(c^2=1\). This gives \(c_{\rm top}=c\) and reduces
the outer relation to \((cb)^3=1\). The substitutions also solve
the original relations in the group
\(\langle b,c\mid b^2=c^2=(cb)^3=1\rangle\), which is \(S_3\).
E73 separately checks the signed crossing words and the finite
order using the other diagram. The slope and original isotropy in
this presentation are those of the relative replacement above.
[E70, original tangle relations and \(s=0\) elimination](../notes/E70_EQUIVARIANT_SURGERY.md#4-eliminations)
· [E73 independent replay](E73_FIRST_GROUP_REPLAY.md#signed-crossing-check-and-the-first-group).

Let \(W_0\) be the action manifold after the second surgery. By the
Thom isomorphism for the product neighbourhood of \(S_T\), its
exterior in the homotopy sphere has \(H_1=\mathbb Z\), generated
by the normal meridian. The same exterior in \(W_0\) is completed
by \(S^1\times D^3\). The boundary fundamental homology generator
maps to that meridian on the exterior and to the core on the
attachment. Consequently \(H_1(W_0)=\mathbb Z\) with primitive
generator \([\delta]\). Take this generator as degree one.

The principal orbit \(h\) is central in \(\Pi=\pi_1(W_0)\), by
moving its basepoint along loops using the action cylinder.
The fibration of the Borel model
\(S^1\to ES^1\times W_0\to ES^1\times_{S^1}W_0\)
identifies \(\Pi/\langle h\rangle\) with the filled orbifold group
\(S_3\). In the model the local classifying spaces are those of the
actual slice groups. The exact sequence does not require that
the orbit orbifold already have a manifold cover. On abelianizing,
\(\mathbb Z/\langle\deg h\rangle=C_2\), so \(|\deg h|=2\) and
\(h\) has infinite order. The old order-two exceptional orbit \(e\)
satisfies \(e^2=h^{\pm1}\) by retracting its principal orbit in the
slice to the core. Thus \(|\deg e|=1\).

The commutator of \(\Pi\) maps onto \(C_3=[S_3,S_3]\) and has
trivial intersection with \(\langle h\rangle\), since a nonzero
power of \(h\) has nonzero degree. It is therefore isomorphic to
\(C_3\). Any degree-one lift \(t\) splits the degree homomorphism.
Its image in \(S_3\) is a transposition and it acts by inversion on
\(C_3\). Every degree-one element has form \(yt\) with \(y\in C_3\).
Since \(xtx^{-1}=x^2t\) and squaring is bijective on \(C_3\), all
degree-one elements are conjugate. Orient \(e\) to have degree one.
The two curves \(e,\delta\) are freely homotopic.

## Actual reverse framing and published recognition

The free homotopy can be perturbed relative to endpoint collars to
an isotopy of embedded circles. The equal-time coincidence domain
for distinct source points has dimension three, less than the
diagonal codimension four. The zero-tangent condition has
codimension four on the two-dimensional parameter domain. The
isotopy therefore transports the actual inverse framed surgery
from \(\delta\) to \(e\) by smooth isotopy extension.

For the oriented slice along \(e\), the stabilizer \(C_2\) has a
faithful orientation-preserving three-dimensional representation,
a half-turn about an axis. In a suitable oriented normal frame
the circle action on \(S^1\times D^3\) takes the form
\[
       u\cdot(z,y)=(u^m z,R_{k\arg u}y),\qquad |m|=2,\quad k\ \text{odd}.
\]
Here \(m\) allows either orbit orientation, and \(R\) rotates about
the slice axis. These product coordinates follow by extending
the stabilizer representation to the circle in
\(S^1\times_{C_2}D^3\). Identifying the boundary to \(D^2\times S^2\)
in this frame extends the action by
\((w,x)\mapsto(u^m w,R_{k\arg u}x)\).
Rotating the frame once as \(z\) runs around the orbit changes its
class by the generator of \(\pi_1SO(3)\) and replaces \(k\) by
\(k+m\), up to the sign convention for the coordinate change.
The same formula therefore works for the transported framing in
either class. Choose smooth collars with invariant radial
coordinates so the actions match. A surviving principal orbit
in the complement gives effectivity of the action on the sphere.

I reopened Galaz-García–Searle's published Theorem 3.2, printed
page 1404. It applies to a closed simply connected smooth
four-manifold with a smooth circle action and gives a diffeomorphism
to a connected sum of \(S^4\), signed \(\mathbb{CP}^2\), and
\(S^2\times S^2\). Sectional curvature is absent from that theorem.
The sphere here has \(b_2=0\), so its only possible smooth type
on that list is \(S^4\). The theorem is the published synthesis of
Fintushel, Pao and three-dimensional Poincaré, and is sufficient
without importing the newer order-seven recognition proposition.
[Galaz-García–Searle, §3.2, Theorem 3.2](https://msp.org/gt/2014/18-3/gt-v18-n3-p05-s.pdf#page=8).

The two slice extensions concern the two possible **inverse**
framings of \(\delta\) in the same \(W_0\). Switching that framing
amounts to changing the regluing along the compressed \(S_T\) by
the Gluck map, a full rotation of its \(S^2\) along the normal
meridian circle. The **initial** odd framing twists along the
original section \(\gamma\) and changes the native orbit filling
used to form the intermediate action manifold. The result
established here is therefore the initial \(a\)-framed sphere
(and any even representative of its normal framing class).
The group computations at \(s=1,-1\) do not supply the recognition
hypothesis for the initial odd framing. [E70, second group](../notes/E70_EQUIVARIANT_SURGERY.md#4-eliminations)
· [E73, alternate odd slope](E73_FIRST_GROUP_REPLAY.md#infinitude-and-recognition-scope).
