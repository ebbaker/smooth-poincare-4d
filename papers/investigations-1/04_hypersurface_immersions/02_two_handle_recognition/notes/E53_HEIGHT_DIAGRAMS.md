# E53d · Recognition from marked two-middle-handle diagrams

25 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI
Codex assistance. Actual serving model and reasoning effort were
unavailable. The bounded packet first chose the geometric tests (B01 and
B02) and then checked their smooth trace and boundary markings. Inputs
were repository base `b5de9758f16e14f22162b4a1e091166ea126c389`, the
height TeX bundle `6acf5b21c6791706`, the E52 master TeX bundle
`2867c940507acb77`, and the E43 audit with SHA-256
`bbe74e202f5b2ececc5e7e902cd8305a67c57a0318ccd40989b96f2e9a41072a`.
The [height draft](../manuscript/recognition_from_marked_morse_heights.tex)
now carries `thm:mixed-meridian` and `prop:onesided-stable`.
[E36](../../../../master/notes/E36_MARKED_HEIGHT.md) ·
[E43](../../../../master/reviews/E43_SURGERY_AUDIT.md) ·
[E51](../../../../master/research-progress/handoffs/E51_COMPANION_DRAFTS_20261125.md) ·
[E52](../../../../master/research-progress/handoffs/E52_RECOGNITION_ENDPOINT_20261125.md)

No marked height, immersed or otherwise, on a particular putative
nonstandard sphere was supplied. The tests apply to the actual
marked presentation of a selected two-middle Morse height once its data
are supplied. They also apply independently of an immersion to the
stated smooth handle classes.

## Mixed case: isotopy to the belt of the first 2-handle

Let $M$ be a smooth closed oriented homotopy four-sphere and let
$(1,1,2,1,1)$ be its marked ordered counts. Cut immediately after the
first middle handle. In this same collared $Y$, compare the belt circle
$B$ of the first 2-handle with the attaching core $C$ of the second.
An ambient isotopy of $Y$ carrying $C$ to $B$ suffices for $M\cong S^4$.
Use the statement in either orientation of the presentation and after
any framed slides for which the two circles are transported in the
resulting presentation. A local small meridian about the first
attaching knot in a ball avoiding the dotted circle and all other
strands certifies the isotopy in a common incoming diagram.

Extend the isotopy over the outgoing collar of the actual lower piece
$W=(S^1\times D^3)\cup h^2_1$ and carry the complete attaching tube.
Since $B$ bounds the co-core disk in $W$, attaching the second handle
does not change $\pi_1(W)$. Neither do the remaining 3- and 4-handles.
Writing $a$ for the winding of the first attaching knot in
$S^1\times S^2$, one has $\pi_1(W)=\mathbb Z/a\mathbb Z=1$, so
$a=\pm1$.

Choose the small meridian $\mu$ of the original first attaching knot
$K$ in the dotted-unknot diagram $U\cup K$. In the exterior it is
parallel to the original meridian of the tube about $K$. On the
filling torus that meridian has intersection number one with the
filling slope, so $\mu$ and the filling core are isotopic in $Y$.
Use these coordinates for both the transported actual framing and
the framing of the reverse trace of $h^2_1$. All framings on $\mu$
are integer changes of an exterior normal framing and can be written
in the $S^3$ diagram. Replacing the dot by zero only to compute
boundary surgery, the full integral matrix in $U,K,\mu$ coordinates
is

$$
\begin{pmatrix}0&a&0\\a&d&1\\0&1&b\end{pmatrix}.
$$

Here $d$ is the first framing, $b$ the $S^3$ preferred-longitude
coefficient of $\mu$, and orientations make the local linking $+1$.
The outgoing boundary of the actual trace is $S^1\times S^2$ by
the upper body. Its first homology has rank one, forcing
$-a^2b=0$. Reversing the first trace has the same outgoing boundary
type and yields the same $b=0$ in the chosen coordinates. Thus the
transported framed tube is isotopic to the attaching tube of the
inverse trace. Apply the trace diffeomorphism and absorb the
remaining top gluing discrepancy over the actual upper
$S^1\times D^3$ by 1-handlebody boundary extension. This realizes
$M$ as the identity double of $W$. The calculation uses no slide of
a 2-handle over a dotted handle in the original trace.
[Laudenbach–Poénaru, Theorem A proof, pp. 341–342](https://www.numdam.org/item/10.24033/bsmf.1741.pdf)

To recognize the double, round the corners of $W\times I$. The
thickened decomposition replaces the $4$-dimensional handles
$D^j\times D^{4-j}$ by $D^j\times D^{5-j}$ for $j=0,1,2$.
The 2-handle is attached to $S^1\times S^3$ along a circle of
winding $\pm 1$. With a choice of orientation it is freely
homotopic to a product factor. Relative parametric
transversality makes a smooth homotopy into an isotopy of
embeddings: the zero derivative condition has codimension four
on the two-dimensional space of domain and time, and the
equal-time double-point condition has codimension four on the
three-dimensional space of distinct pairs and time. Ambient
isotopy over a collar carries the attaching tube to the product
core, which meets the belt 3-sphere once. Geometric cancellation
gives $W\times I\cong D^5$ with corners rounded, and its boundary
is the standard $S^4$.
[Milnor, *Lectures on the h-Cobordism Theorem*, Theorem 5.4](https://www.math.auckland.ac.nz/~hekmati/Books/Milnor2.pdf)

For the marked example, take the $n=1$ instance of Isoshima's
Figure 37. The diagram places the extra zero-framed unknot as a
small meridian of the other undotted component. The two omitted
handles have indices three and four. Keep the dotted unknot and
first attaching knot for the lower piece $W^-(0,3)$. Section 1 of
Akbulut–Kirby identifies this with Mazur's example. Their
Proposition 1(2) identifies it with $W^+(2,-2)$ and Proposition 1(1)
identifies that with $W^+(0,0)$. Their Theorem 2(1) identifies the
boundary with $\Sigma(2,5,7)$, a nonsimply connected integral
homology sphere. The specified cut therefore gives a diagrammatic
test beyond the two intermediate diffeomorphism types treated
in E43. The example uses a published smooth handle presentation
of a known standard sphere. It makes no identification with an
immersed height and no claim about which earlier tests might apply
after arbitrary further handle moves.
[Isoshima, arXiv:2403.17356v2, Fig. 37 and §3](https://arxiv.org/pdf/2403.17356v2#page=35) ·
[Akbulut–Kirby, *Michigan Math. J.* 26 (1979), §§1, 7](https://math.berkeley.edu/~kirby/papers/Akbulut%20and%20Kirby%20-%20Mazur%20manifolds%20-%20MR0544597.pdf)

### Homology at arbitrary mixed cuts

For either end let $a_\pm$ be the winding of the one attaching
knot on that side, using the dual handle at the top. The respective
pieces have $H_1(X_\pm)=\mathbb Z/a_\pm\mathbb Z$ and the ordinary
surgery presentation of the common boundary has determinant
$-a_\pm^2$. If one winding vanishes, the group at the boundary has
positive rank and the other winding vanishes. Otherwise the two
absolute windings are equal by the order of the common group.
Mayer–Vietoris identifies $H_1(Y)$ with the direct sum of the groups
of the pieces. Consequently $H_1(Y)=\mathbb Z^2$ or
$(\mathbb Z/n\mathbb Z)^2$ with $n\ge1$. This rules out all lens
spaces of order greater than one and also $S^1\times S^2$ at such
a cut. An actual genus-one Heegaard diagram of $Y$ consequently
certifies the already recognized $S^3$ case. The group alternatives
hold before any normalization of the original incidence row.

An additional way to identify the existing $S^3$ case is a verified
irreducible Heegaard Floer $L$-space at an integral homology sphere
cut. Both pieces then have one 1-handle and one 2-handle with winding
$\pm1$ and are contractible. Conway–Tosun's Theorem 1 makes either
piece a standard disk and the cut $S^3$. Irreducibility and the
$L$-space hypothesis are additional input.
[Conway–Tosun, *Mazur-type manifolds with L-space boundary*, Theorem 1](https://www.jiconway.com/Papers/Mazur-type_manifolds.pdf)

## One-sided case: a tunnel system or a generalized square knot

After reversing if needed, the actual framed attaching link $L$ lies
in the boundary of the single 0-handle and its surgery is the actual
boundary $\#_2(S^1\times S^2)$ of the upper dual genus-two
1-handlebody. The surgery matrix forces both preferred-longitude
framings and the linking to be zero. The following criteria can also
be checked on the link after actual framed slides.

- Two tunnels with disjoint interiors in the complement and handlebody
  exterior of the union certify tunnel number at most two. The
  tunnel-one case is already in E51. For tunnel number two,
  Meier–Schirmer–Zupan's Corollary 1.3(2), with $c=2$, $k=0$,
  supplies framed slides of $L$ plus one split zero-framed unknot
  to the three-component zero-framed unlink. Insert the added
  unknot in a marked ball and the 3-handle on the nonseparating
  sphere in its new $S^1\times S^2$ factor. That sphere meets
  the new belt circle once and is disjoint from the original data.
  This is a cancelling 2–3 pair and retains the old closed manifold.
  With the transported gluing, after the cited slides the trace is
  $\natural_3(S^2\times D^2)$ and the cap is
  $\natural_3(S^1\times D^3)$. Laudenbach–Poénaru Theorem A at
  $p=3$ gives the smooth $S^4$.
  [Meier–Schirmer–Zupan, arXiv:1507.06561v1, Corollary 1.3 and proof](https://arxiv.org/pdf/1507.06561v1#page=11) ·
  [Laudenbach–Poénaru, Theorem A](https://www.numdam.org/item/10.24033/bsmf.1741.pdf)
- If one actual component is isotopic to $Q_{p,q}=T_{p,q}\#T_{-p,q}$
  for coprime $p,q\ge2$, Meier–Zupan's Theorem 1.1 recognizes the
  actual closed manifold. Theorem 1.2 expresses this as weak
  Property $2R$, allowing a split zero-framed unlink with its
  cancelling 3-handles and at most two cancelling Hopf pairs before
  simplification. Its hypotheses are the actual two-component
  $2R$ link and the specified knot type. This criterion includes
  the square knot.
  [Meier–Zupan, *J. Differential Geom.* 122 (2022), Theorems 1.1–1.2](https://par.nsf.gov/servlets/purl/10464744)

For comparison, an embedded $S^2$ in $S^3$ disjoint from and
separating the two components gives a split link. Surgery splits
as the connected sum of the two zero surgeries. Each has first
Betti number one, so uniqueness of the prime decomposition of
$\#_2(S^1\times S^2)$ identifies each as $S^1\times S^2$.
Property R recognizes each component as the unknot. This overlaps
the earlier criterion. A genus-one fibered component is excluded by
the slice-in-a-homotopy-ball condition. The trefoils and figure-eight
knot have determinants $3$ and $5$ respectively, whereas a knot slice
in an integral homology 4-ball has square determinant. Theorem 3.3 of
Gompf–Scharlemann–Thompson concerns a least-genus component in a
counterexample and does not by itself recognize an arbitrary fibered
component, while the generalized-square-knot theorem specifies one
family of such components.
[Gompf–Scharlemann–Thompson, Props. 2.3, 3.2 and Thm. 3.3](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-p.pdf)

## Effect on the height argument

The marked hypotheses give sufficient recognition certificates in both
odd-handle distributions. A physical height would have to supply the
actual matching cut and an isotopy of its circles, or the actual link
with a tunnel system or a knot-type certificate. The endpoint
condition is a diffeomorphism of the same closed four-manifold. Neither
the indexed Gauss area bound nor orthogonal direction selection
supplies one of these data. No unrestricted statement about Property
$2R$ and no diagram classification for the entire selected direction
set were used or obtained.
