# SP4-MASTER-E33 · Reduction of the extreme handles and the middle-index Gauss integral

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance, under the [frozen E33 handoff](../research-progress/handoffs/E33_INDEX_TWO_HANDLES.md).
Requested GPT-6.2 Sol/ultra. Actual serving model and reasoning effort
were unavailable to this helper. Frozen base
`b3cd11a2b839b6d2cb6262f8210f33d19d6f5a0a`, master main hash prefix
`c8a9f68da492`. The checked inputs include the
[E26 handle and height return](E26_FOUR_CRITICAL_HEIGHTS.md) and
[E29 deficit note](../notes/E29_GAUSS_DEFICIT.md), with the latter at
SHA-256 `f00929b135fd96604c5870029a02c6b94ef761e42cff48496ef4ab55cb111140`.
The handle reduction takes place on the given smooth manifold. The
curvature integral and all counts below are on the immersion domain.

## One minimum and one maximum with the original middle count

Let $M$ be a closed connected oriented smooth four-manifold, let
$f$ be a smooth Morse function on $M$, and write $m_j$ for the
number of its critical points of index $j$. Reorder the handles by
index on the same $M$ with the same counts. The rearrangement
theorem supplies a self-indexing auxiliary Morse function. The
reduction does not require the auxiliary function to be a height.
Take collared cuts between the index-one and index-two blocks and
between the index-two and index-three blocks. Write the resulting
pieces as $P$, $N$, and $Q$, with $P$ the lower $0$–$1$ body,
$N$ the middle index-two cobordism, and $Q$ the upper dual $0$–$1$
body. In the absence of middle handles use a product collar for $N$.
[Milnor, Lectures on the h-Cobordism Theorem, §4, Final Rearrangement Theorem and self-indexing formulation](https://www.maths.ed.ac.uk/~v1ranick/surgery/hcobord.pdf)

The piece $P$ is connected. Every remaining handle has index at
least two and its attaching domain $S^{j-1}\times D^{4-j}$ is
connected, so it cannot join two different components. The same
argument on the reversed decomposition proves that $Q$ is
connected. The corresponding graphs, with one vertex for each
$0$-handle and one edge for each $1$-handle, are therefore
connected, including the possible one-vertex graph with loops.

Choose a spanning tree in each graph. In each $1$-handlebody
the union of the $0$-handles and the tree-edge handles is a
standard smooth four-ball after rounding corners. One way to
see this is to absorb leaf edges one at a time. A leaf ball
and its tree handle are a collar enlargement across the single
foot of the handle on the rest of the tree body. Equivalently,
this is a geometric $0$–$1$ cancellation: the two feet are in
different components before the given tree handle attaches,
and the attaching zero-sphere meets the selected leaf belt
sphere in one point. The other handles have disjoint attaching
feet, which remain marked disks on the boundary after the tree
body is identified with one ball. Thus the same $P$ has a
presentation with one $0$-handle and $m_1-m_0+1$ $1$-handles.
The reversed presentation of $Q$ gives one $4$-handle and
$m_3-m_4+1$ $3$-handles in the forward order. These are independent
changes of disjoint end bodies.
[Milnor, §5, First Cancellation Theorem](https://www.maths.ed.ac.uk/~v1ranick/surgery/hcobord.pdf)
· [Scharlemann, Comment. Math. Helv. 83 (2008), pp. 422–423, spanning-tree argument in Corollary 2.2](https://ems.press/content/serial-article-files/43163?nt=1)

The boundary identifications must be transported with these
changes. If $\alpha:P'\to P$ and $\beta:Q'\to Q$ are
diffeomorphisms from the new presentations, compose the actual
boundary attachments of $N$ with the boundary restrictions
of $\alpha,\beta$ in the directions required by the gluing.
The induced map on $P'\cup N\cup Q'$ uses $\alpha$, the
identity on the collared middle cobordism, and $\beta$.
Using product collars, it is a diffeomorphism onto the original
$M$. In particular the index-two handles of $N$ keep their number
and their attaching data under the induced boundary identifications.
The resulting count vector is
\[
 (1,\ m_1-m_0+1,\ m_2,\ m_3-m_4+1,\ 1).
 \tag{1}
\]
This construction never identifies two pieces by a freely chosen
boundary diffeomorphism in place of the actual marking.

## The one-middle-handle consequence

Now assume $M$ is a smooth homotopy four-sphere, so $\chi(M)=2$.
Let $\ell=m_1-m_0+1$ and $r=m_3-m_4+1$. Formula (1) gives
$m_2=\ell+r$, where both $\ell,r$ are nonnegative integers.

If $m_2=0$, the two pieces are standard four-balls. The actual
gluing diffeomorphism of $S^3$ is isotopic to the restriction of
an orthogonal linear map by the components assertion of the
Smale conjecture. The isotopy extends on a collar and the
orthogonal map extends over the disk. The marked double therefore
has the standard smooth type.
[Hatcher, Ann. of Math. 117 (1983), p. 553](https://pi.math.cornell.edu/~hatcher/Papers/SmaleConjecture.pdf)

If $m_2=1$, precisely one of $\ell,r$ is one. Reverse the
decomposition if necessary to get $(1,0,1,1,1)$. The lower side
of a cut just after the $2$-handle is a framed knot trace on the
actual $0$-handle. The upper side viewed dually has one $0$-handle
and one $1$-handle; it is the orientable disk neighborhood of a
circle, $S^1\times D^3$. The boundary of the trace is thus
$S^1\times S^2$. If the framing relative to the preferred
longitude is $n$, the meridian generates knot exterior
$H_1\cong\mathbb Z$ and filling kills $n$ times it. Hence
$H_1(S^1\times S^2)\cong\mathbb Z$ forces $n=0$.
Gabai's Property R gives the unknot, using Corollary 8.3 and
Remark 8.5. The lower piece is therefore $S^2\times D^2$.
For every boundary diffeomorphism between these two smooth
pieces, Laudenbach–Poénaru's Theorem A at $p=1$ gives the
standard $S^4$. This applies to the actual gluing even after the
chosen piece identifications change the boundary coordinates.
If an oriented diffeomorphism is desired, compose with a
reflection of the standard sphere if needed.
[Gabai, J. Differential Geom. 26 (1987), pp. 525–526](https://doi.org/10.4310/jdg/1214441488)
· [Laudenbach–Poénaru, Bull. Soc. Math. France 100 (1972), Theorem A, p. 337](https://www.numdam.org/item/10.24033/bsmf.1741.pdf)

Gabai's Corollary 8.6, attributed to Poénaru, gives another
route in the latter case. The union before the final $4$-handle
has $H_2=0$ since attaching that handle leaves $H_2$ unchanged.
It is a ball by the corollary, and the same marked double
argument finishes. Scharlemann's Corollary 2.2 is a direct
precedent in the PL category for a homology four-sphere with
one $2$-handle and no $3$-handles, which is the dual count vector.
The smooth proof above uses smooth boundary maps and the smooth
gluing theorem. The Gabai statements were checked in a
reproduction of the published text; the publisher endpoint
was inaccessible in this execution.
[Gabai reproduction, Corollaries 8.3 and 8.6](https://www.scribd.com/document/1026013102/2-Gabai)
· [Scharlemann, Corollary 2.2, pp. 422–423](https://ems.press/content/serial-article-files/43163?nt=1)

Thus every Morse function on a hypothetical nonstandard homotopy
four-sphere has at least two index-two critical points. This
conclusion is about the original count of each function, since
(1) preserved $m_2$.

## The averaged split determinant

Let $F:M\looparrowright\mathbb R^5$ be a smooth immersion of a
closed oriented smooth homotopy four-sphere and $g=F^*g_{\rm eucl}$.
Choose the unit normal $\nu$ compatibly with the orientation
and use $d\nu=-dF\circ A$ for the shape operator $A$.
Write $\Omega=\{x\in M:A(x)\text{ has two positive and two
negative eigenvalues}\}$ and $\omega=\operatorname{Vol}(S^4)
=8\pi^2/3$. Let $n_2(u)$ count the index-two critical points of
$h_u=\langle F,u\rangle$ for Morse directions $u$.

For $u$ and $-u$ both regular values of $\nu$, the critical sets
are exactly the preimages of $u$ and $-u$. At such a point the
Hessian is $\langle u,\nu\rangle\,g(A\cdot,\cdot)$. It is
nondegenerate and has index two exactly on $\Omega$, since reversal
of the sign of a nonsingular form in dimension four preserves
the index-two case. Sard's theorem makes the excluded directions
a null set. The absolute Jacobian of $\nu$ is $|\det A|$ with
the induced domain measure, and $\det A$ is positive on $\Omega$.
The area formula there, once for each normal sign, gives
\[
 \frac1\omega\int_{S^4}n_2(u)\,d\sigma(u)
       =\frac2\omega\int_\Omega\det A\,dV_g .
 \tag{2}
\]
Distinct preimages at self-intersections of $F$ are distinct
critical points of the function on $M$. The formula is the
index-two specialization of the height-count argument in
[E26](E26_FOUR_CRITICAL_HEIGHTS.md) and uses both normal signs.
On a hypothetical nonstandard type, (2) gives
\[
 K:=\int_\Omega\det A\,dV_g\ge\omega .
 \tag{3}
\]

For comparison let $J=\int_M(-\det A)_+\,dV_g$ and let
$P_{\rm def}$ be the integral of $\det A$ on the positive- or
negative-definite locus. The same area formula counts odd-index
critical points with mean $2J/\omega$ and extrema with mean
$2P_{\rm def}/\omega$. Each Morse height has at least two
extrema, and its Euler identity gives
$n_1(u)+n_3(u)=n_2(u)+n_0(u)+n_4(u)-2\ge n_2(u)$.
Thus $P_{\rm def}\ge\omega$ and $J\ge K$ on every such immersed
homotopy sphere, consistent with the signed identity
$P_{\rm def}+K-J=\omega$. In particular (3) also recovers
$J\ge\omega$ on the nonstandard branch.

The strict bound $K<\omega$ suffices for recognition by (2) and
the one-middle-handle theorem. At $K=\omega$, (2) alone allows
every regular Morse direction to have exactly two middle points.
On the hypothetical nonstandard branch this must happen, since
$n_2$ is locally constant on the antipodal regular direction
set and its mean is two. The present handle reduction leaves
the reduced possibilities $(\ell,r)=(2,0),(1,1),(0,2)$ when
$m_2=2$. It supplies no recognition from those handle counts
alone. The curvature use of (3) is independent of finding a
height with a smaller count at equality.
