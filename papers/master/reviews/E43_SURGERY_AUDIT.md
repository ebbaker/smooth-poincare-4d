# SP4-MASTER-E43 · Audit of marked two-middle-handle surgery

25 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI
Codex assistance. Bounded independent E check. Actual serving model and
reasoning effort were unavailable. The frozen mathematical baseline is
`2689540e6dae1656b7f5ad4be52504db044995f2`. The additional working input
[E36](../notes/E36_MARKED_HEIGHT.md) had SHA-256
`33bcac0c687b219107002d80c6e722ce1bc64d1d7b7fe1efe2a09ec795c711e5`.

The one-sided recognition and the mixed recognition at an actual
$\#_2(S^1\times S^2)$ cut both pass. The mixed proof can use one
sphere surgery followed by its inverse. A simply connected intermediate
integral homology sphere is another sufficient mixed cut, and in that
case both sides are standard four-balls. These conclusions concern
smooth oriented homotopy four-spheres with the specified marked
presentations. An immersion is one possible source of the presentation.

## The two tree maps and the one-sided case

Use $N$ for the ordered collared cobordism with two index-two handles.
Let $P,Q$ be the connected lower and upper (viewed dually) 0–1 bodies.
Connectedness follows because the handles added subsequently in each
direction have connected attaching sets and cannot join components.
In each body a 0-handle ball at a leaf and its tree 1-handle enlarge
the adjacent ball along a boundary disk. With collars rounded the
enlargement is a four-ball, carrying every unused 1-handle foot as a
marked disk. Repeating along the whole spanning tree gives actual
diffeomorphisms $\alpha:P'\to P$ and $\beta:Q'\to Q$ of the reduced
bodies and leaves the middle handles unchanged. The numbers of
remaining 1-handles in the two bodies are $\ell$ and $r$.
Each of $\alpha$ and $\beta$ has its own boundary map.

For the incoming and outgoing identifications
$p:\partial P\to\partial_-N$ and $q:\partial Q\to\partial_+N$,
an original lower attaching tube $a$ is carried by
$(\partial\alpha)^{-1}p^{-1}a$. An upper dual tube is carried by
$(\partial\beta)^{-1}q^{-1}$ applied to that tube. Writing $\eta$
for the induced upper boundary identification of the new lower trace
$X$, its actual upper gluing is
$(\partial\beta)^{-1}q^{-1}\eta$. Thus a framed-slide diffeomorphism
$s:X_{\rm new}\to X$ enters this gluing as $\partial s$ on the right.
At an intermediate cut the incoming and dual upper marked
identifications give the two actual sides of the same $Y$.
In either case changing their coordinates changes the boundary
map by composition with the induced boundary identifications.
The count $(1,\ell,2,r,1)$ has $\ell+r=2$ by Euler characteristic.
[E36, transported end maps](../notes/E36_MARKED_HEIGHT.md#one-height-and-both-transported-ends)
· [Milnor, *Lectures on the h-Cobordism Theorem*, §§4–5](https://www.math.auckland.ac.nz/~hekmati/Books/Milnor2.pdf)

For $(\ell,r)=(2,0)$ reverse the entire marked presentation.
In $(0,2)$ the actual two-component attaching link is in $\partial
D^4$ and its outgoing surgery is $\#_2(S^1\times S^2)$, by the actual
upper body. The integral surgery matrix has rank zero because its
cokernel has rank two. This forces both preferred-longitude framings
and the mutual linking number to vanish. If one component is unknotted,
Gompf–Scharlemann–Thompson Proposition 3.2 slides the framed link to
the zero-framed unlink. Its proof holds the unknotted component fixed
while realizing a boundary isotopy by slides of the other component.
The resulting trace is $\natural_2(S^2\times D^2)$. Apply
Laudenbach–Poénaru Theorem A with $p=2$ to its actual gluing to
$Q'\cong\natural_2(S^1\times D^3)$. The theorem quantifies over all
boundary diffeomorphisms, including the one induced from the trace
and $\partial\beta$. An unknotted component exhibited by supplied
framed slides of the actual trace also suffices.
[Gompf–Scharlemann–Thompson, *Geom. Topol.* 14 (2010),
Propositions 2.2 and 3.2, pp. 2310–2314](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-p.pdf)
· [Laudenbach–Poénaru, *Bull. Soc. Math. France* 100 (1972),
Theorem A, p. 337](https://www.numdam.org/item/10.24033/bsmf.1741.pdf)

## Mixed case with a cut diffeomorphic to \(\#_2(S^1\times S^2)\)

Let $\ell=r=1$ and cut between the two handles. Each side, from
its own marked end, is an actual $S^1\times D^3$ with one 2-handle.
On the upper side the 2-handle is the dual of the other original
handle. Identify each $S^1\times S^2$ incoming boundary with zero
surgery on the dotted unknot $U$. Replacing the dot by a zero
surgery coefficient serves here to read the boundary. The original
piece still has a 1-handle. With the other attaching circle $K$ this
is a two-component surgery giving $Y$. Its matrix therefore forces
the framing and linking of $K$ in this $S^3$ diagram to be zero.

The published proof of Proposition 3.2 provides the stronger
intermediate fact needed here. In zero surgery on $U$, the knot
$K$ is isotopic in $S^1\times S^2$ to an unknot in a ball. The
authors obtain that location from reducibility of the knot exterior
after their satellite and tautness tests, and use one-knot Property
R in the ball. Only when representing the isotopy back in $S^3$ do
crossings of the dual of $U$ become slides over $U$. In the mixed
four-dimensional piece use the isotopy directly in its actual
$S^1\times S^2$ boundary. Ambient isotopy transports the tube and its
framing and extends over a collar of the actual $S^1\times D^3$.
The transported framing in the final ball is zero because otherwise
the surgery on the ball unknot does not add a free generator to
$H_1(Y)$. The two sides are thus

$$
X_-\cong (S^1\times D^3)\natural(S^2\times D^2)
\cong X_+ .
$$

This uses the upper and lower marked isotopies independently and
allows their induced boundary gluing to be arbitrary. In particular
the mixed argument does not apply a 2-handle slide over a dotted
1-handle as a move on the original four-dimensional trace.
[Gompf–Scharlemann–Thompson, Proposition 3.2 proof,
pp. 2313–2314](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-p.pdf)

**One-surgery proof.** In the $S^2\times D^2$ summand of $X_-$
replace an interior $S^2\times D^2_\epsilon$ by $D^3\times S^1$
along the product boundary, leaving its outer collar. The remaining
annulus is a product collar on $S^2\times S^1$. Thus the changed
side is $B_-\cong\natural_2(S^1\times D^3)$ with the same outer
boundary marking. The actual glued manifold $Z=B_-\cup X_+$ is
diffeomorphic to the canonical gluing of these standard pieces.
Indeed, the discrepancy between the actual gluing and the canonical
gluing is a boundary self-diffeomorphism on $B_-$. It extends over
$B_-$ by the 1-handlebody boundary-extension theorem. The orientation
preserving extension is explicit in the original proof of Theorem A.
An orientation reversing discrepancy can also be absorbed by
composing with a reflection of the 1-handlebody, viewed as a rounded
product of a three-dimensional handlebody with an interval.
The canonical gluing matches the boundary connected-sum disks and
gives the connected sum of the pairwise standard gluings. One is
$S^1\times S^3$ (double of $S^1\times D^3$), the other is $S^4$
(the boundary of $D^2\times D^3$ with corners rounded). Consequently
$Z\cong S^1\times S^3$.
[Laudenbach–Poénaru, proof of Theorem A, pp. 341–342](https://www.numdam.org/item/10.24033/bsmf.1741.pdf)
· [Moussard, arXiv:2412.10210, Theorem 2.5, explicit extension statement](https://arxiv.org/pdf/2412.10210)

The inverse surgery on the core circle $\gamma$ of the inserted
$D^3\times S^1$ recovers $M$. This inverse uses its actual tubular
neighborhood and boundary identification. Under $Z\cong S^1\times S^3$,
the complement of an open tube around $\gamma$ has the same
fundamental group as $Z$, by general position for paths and disks
relative to a circle of codimension three. Its boundary
$S^1\times S^2$ maps its generator to the class of $\gamma$.
Filling by $D^2\times S^2$ kills this generator by van Kampen.
Thus $\pi_1(M)=\mathbb Z/\langle[\gamma]\rangle$, and
$\pi_1(M)=1$ forces $[\gamma]=\pm1$. Up to reversing the circle it
is freely homotopic to the product core. In a generic homotopy
relative to the endpoints the derivative in the circle direction
has no zero (codimension four in a two-dimensional parameter
space), and there are no equal-time double points (codimension
four in a three-dimensional pair-and-time parameter space).
This gives a smooth isotopy through embeddings. Ambient isotopy
extension and tubular-neighborhood uniqueness identify the
complement with that of a product core, namely $S^1\times D^3$.
The isotopy carries the original surgery framing. Arbitrary
resulting gluing to $D^2\times S^2$ is covered by
Laudenbach–Poénaru Theorem A at $p=1$, so $M\cong S^4$.
[Laudenbach–Poénaru, Theorem A, p. 337](https://www.numdam.org/item/10.24033/bsmf.1741.pdf)

**Check of the two-surgery proof in E36.** Replacing both product
sphere neighborhoods instead gives the double of $B_-$, since the
outer mismatch can be extended across the other genus-two
1-handlebody while fixing $B_-$. That double is
$\#_2(S^1\times S^3)$. The core in $B_-$ then remains a standard
product core in one summand. Its inverse surgery uses Theorem A
at $p=1$ and leaves $S^1\times S^3$ with the other core still
embedded. The primitivity and framing check just proved applies
to that core. The two proofs require the same geometric
hypothesis on $Y$.

## Mixed case with a simply connected integral homology sphere cut

When the actual middle cut $Y$ is an integral homology sphere with
$\pi_1(Y)=1$, the three-dimensional Poincaré theorem yields
$Y\cong S^3$ smoothly. Take either actual piece $T=(S^1\times D^3)
\cup h^2$ and cap $Y$ by a smooth standard $D^4$ using any boundary
diffeomorphism. Turn over the trace of $h^2$. The dual tube is in
the boundary $S^3$ of the cap, with its framing pulled back by the
chosen gluing. Surgery on its actual attaching knot gives
$S^1\times S^2$, the boundary of the other end of this trace.
Its integer framing relative to the preferred longitude has to
be zero because the surgery has $H_1\cong\mathbb Z$. Gabai's
Property R makes this dual knot the unknot. The capped manifold
is therefore $(S^2\times D^2)\cup(S^1\times D^3)$ with the actual
induced boundary gluing, and Theorem A at $p=1$ gives $S^4$ for
every choice of the cap map.
[Morgan–Tian, *Ricci Flow and the Poincaré Conjecture*,
Corollary 0.2(a), p. x](https://www.claymath.org/wp-content/uploads/2022/03/Ricci-pdf.pdf#page=11)
· [Gabai, *J. Differential Geom.* 26 (1987), Corollary 8.3
and Remark 8.5, reproduction of the published text](https://www.scribd.com/document/1026013102/2-Gabai)
· [Laudenbach–Poénaru, Theorem A, p. 337](https://www.numdam.org/item/10.24033/bsmf.1741.pdf)

The cap is a parametrized smooth standard disk in the resulting
$S^4$. To see that its complement is standard, shrink the disk
inside its own parametrization by the isotopy of disk embeddings
$x\mapsto j(tx)$ for $1\ge t\ge t_0>0$. For sufficiently small
$t_0$, write $f$ for $j$ in a fixed stereographic chart at $j(0)$.
The embeddings $x\mapsto f(0)+t_0(f(tx)-f(0))/t$ for
$0<t\le t_0$ run from the small disk to the ellipsoid given at
$t=0$ by $f(0)+t_0 Df(0)x$. The ellipsoid is isotopic to a
round disk in the same chart. Ambient isotopy extension carries the
original embedded disk to a round disk. Its complement is $D^4$.
This uses the parametrized cap. It assumes nothing about the two
complements of a general embedded $S^3$. Both actual $T$ pieces
are therefore standard $D^4$. For the original arbitrarily
marked gluing, one recognized ball serves as the cap of the
other piece, and the preceding arbitrary-cap proof applies.

In the normalized E36 lower diagram with row $(1,0)$, attaching
$K_1$ first gives an integral homology sphere already by the
determinant $-1$ of the two-component surgery matrix for
$U_0\cup K_1$. The corresponding test is its actual fundamental
group. Attaching $K_2$ first gives $H_1\cong\mathbb Z^2$, and the
test above asks for its actual $\#_2(S^1\times S^2)$
diffeomorphism type. In the integral homology sphere case each
side has a one-generator, one-relation handle complex with
attaching degree $\pm1$, so it is both simply connected and
acyclic, hence contractible. Consequently
van Kampen on the closed assembly does not force
$\pi_1(Y)=1$. The algebraic row reduction preserves the actual
trace under the corresponding 2-handle slides. A further basis
change using $U_0$ in the boundary surgery matrix alone gives
no new interior cancellation. Neither intermediate recognition
test follows from the two-middle-handle count and the verified
homology calculations.

The published GST proof and LP statement and extension passages
were checked on 25 November 2026. The boundary extension was
cross-checked against Moussard's explicit statement. The
publisher page for Gabai did not supply the text in this run.
Corollary 8.3 and Remark 8.5 were checked in the linked
reproduction of the published article. No individual immersed
height diagram was supplied to test the intermediate hypotheses.
