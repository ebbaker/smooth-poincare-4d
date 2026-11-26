# The lower return word of the Figure 5 mouth

26 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. Fixed execution packet SUR-E02af, issue 1.
The issue selects GPT-6.2 Sol/ultra for the bounded derivation. Actual
serving model and effort are unavailable. Intake HEAD 226b8f404b6e.
[Frozen specimen](../../research-progress/handoffs/ONE_MOUTH_MIXED_20261126.md)

The specified lower separator already bounds a disk before stationary
filling. After filling, its return side is the exterior of the Figure 5
unknot in square-knot zero surgery, with its actual meridian and zero
longitude. Every lower chord-and-section word, allowing the entire
four-holed face and all integral windings, survives in one finite quotient
of the drilled slab. The separator therefore gives a face compression
but cuts off no marked solid torus.

## The separator and the actual return-side exterior

Work in the smooth oriented category with the tube markings in the issue.
Write \(W=S^2\times I\) for the cut slab, \(Q\) for the stationary square
knot, and \(U^\circ\) for the long lower arc. Let \(X\) be the slab with
all four moving arcs drilled and \(Q\) filled on its prescribed zero
longitude. Write \(F_-\) for the lower four-holed face, \(A_-\) for the
wall annulus of \(U^\circ\), and \(E\) for the hemisphere bounding the
one-mouth ball \(B\) on the inside of the slab. Its boundary
\(s=\partial D_{12}\) lies on \(F_-\). The collar and rail choices in the
issue keep every tube disjoint from \(E\), and the \(Q\)-filling is
supported inside \(B\). Thus \(E\) is a proper separating disk both before
and after that filling. In \(F_-\), \(s\) separates the return holes
\(1,2\) from the through holes \(3,4\).

Cut \(X\) along \(E\). Denote the return side by \(D\) and the other
side by \(Z\). If \(P_{12}\) is \(D_{12}\) with its two holes, the marked
boundary of \(D\) is the torus
\[
 T=(P_{12}\cup A_-)\cup E .
\]
Before the stationary filling, the capped pair \((Q,U^\circ\cup c_{12})\)
is the actual left diagram \(Q\cup U\) of GST Figure 5. More precisely,
the small ball excised in the issue contains a trivial short \(U\)-arc.
Its drilled complement is \(S^1\) times a rectangle. The annulus on the
outer three sides of the rectangle meets the drilled complementary
ball along the sphere with the two \(U\)-holes. The fourth side is the
wall of the short arc. Absorb this annular collar into the boundary of
the drilled complementary ball, fixing \(T_Q\). The identification
preserves the wall meridian and takes the short face chord to the
corresponding interval in the short-arc wall. It therefore transports
the marked peripheral basis. Here \(\mu\) is the oriented meridian of
\(U\), and \(\lambda\) is its preferred zero longitude in the capped
\(S^3\) diagram. The stationary slope is the same \(\lambda_Q\) on
both exteriors. After its filling this gives
\[
 D\cong S^3_0(Q)\setminus\operatorname{int}\nu U,\qquad
 D(\mu)\cong M=S^3_0(Q),\qquad
 D(\lambda)\cong Y_2=\#_2(S^1\times S^2).
\]
The last identification uses the actual framed slide in Figure 5,
which slides the square knot over the zero-framed unknot, giving the
ordinary zero-framed two-component unlink after isotopy.
The collar comparison also appears in the
[earlier marked capping calculation](LOWER_PORT_PERIPHERAL_GROUP.md#capping-the-drilled-slab).
[GST, §2 and Figure 5, pp. 2310–2311](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf#page=6)

## The words for a prescribed or freely chosen chord

Use a basepoint on \(s\) and a path in \(P_{12}\) to the first end of
the truncated short chord \(\alpha_0\). With the common base paths
understood, van Kampen across the disk gives a free product and its
retraction onto the return factor,
\[
 \pi_1(X)=\pi_1(D)*\pi_1(Z),\qquad
 r:\pi_1(X)\longrightarrow\pi_1(D).
\]
The canonical short chord \(\alpha_0\) with the marked wall section
of winding \(m\), measured relative to the capped zero longitude,
represents \(\lambda\mu^m\). Indeed, all these curves lie on \(T\),
traverse the wall longitudinally once, and differ by \(m\) meridian
turns.

Now let \(\alpha\) be any embedded lower chord joining the two return
cuffs in \(F_-\), with the same end germs. If end germs also vary, absorb
their tracks into the wall section. Orient both chords from the first
end to the second and the wall section in the opposite direction.
The based word of the closed boundary then is
\[
 [\gamma_{\alpha,m}]
   =[\alpha\alpha_0^{-1}]\,\lambda\mu^m
   \quad\text{in }\pi_1(X).
\]
The other pair of pants of \(F_-\) is \(P_{34}\), with common cuff
\(s\). Since \(s\) bounds \(E\), the face-group map factors through
\(\pi_1(F_-)/\langle\!\langle s\rangle\!\rangle\).
Capping \(P_{12}\) by \(E\) on the \(D\)-side gives an annulus whose
generator is \(\mu\). Capping \(P_{34}\) by \(E\) on the \(Z\)-side
gives an annulus whose image is in the complementary factor.
Consequently \(r([\alpha\alpha_0^{-1}])=\mu^j\) for some integer
\(j=j(\alpha)\), and
\[
 r([\gamma_{\alpha,m}])=\lambda\mu^{m+j}.
\]
The integer \(j\) is the signed exponent on the return-side annulus
after the complementary factor is killed. For the original chord
it is zero. Changing base paths conjugates the formulas.

The two components have linking number zero by GST Proposition 2.2,
or by the rank of first homology of their actual joint surgery. Thus
\(H_1(D;\mathbb Z)=\mathbb Z\langle\mu_Q,\mu\rangle\), since imposing
the \(Q\)-longitude adds a zero abelianized relation to the joint
exterior group. The slope \(\lambda\) has class zero there, and
\(\mu\) is primitive. The only winding that can vanish even in the
projected homology is \(m=-j\). In particular the canonical word at
\(m=0\) vanishes in \(H_1(X;\mathbb Z)\) by inclusion, so its obstruction
requires the group. A bridge disk with a prescribed section would,
after clipping its radial strip, be a proper disk on
\(\gamma_{\alpha,m}\) in \(X\). [GST, Proposition 2.2, pp. 2310–2311](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf#page=6)
· [Marked disk criterion](FOUR_PORT_BOUNDARY_PATTERN.md#the-marked-disk-test)

## One finite quotient detects every lower word

The meridional filling map \(\pi_1(D)\to\pi_1(M)\) kills \(\mu\) and
takes \(\lambda\) to the class of \(U\), up to base path and orientation.
For Figure 5 the hypothesis of GST Corollary 6.4 is satisfied by the
joint zero surgery above. That corollary puts \(U\), after possible
slides over \(Q\), in the genus-two fiber, with projection
homeomorphic to an essential simple curve of the four-punctured
quotient sphere. By GST Lemma 6.2(3) this is a nonseparating simple
curve \(c\) of the closed fiber \(F\) of \(M\). A slide of \(U\) over
\(Q\) bands \(U\) to a framed copy of \(\lambda_Q\), which bounds
a filling meridian disk in \(M\). Thus the slides used in the
corollary preserve the free homotopy class in \(M\). The original
class of \(U\) is represented there by \(c\).
[GST, §6, Lemma 6.2(3), p. 2325, and Corollary 6.4, p. 2327](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf#page=19)

Write \(\pi_1(M)=\pi_1(F)\rtimes\mathbb Z\) using a stable letter for
the fibered circle. Let \(H=H_1(F;\mathbb F_2)\cong(\mathbb F_2)^4\)
and write \(h_*\) for the monodromy action on \(H\), using the circle
direction that induces \(h_*\). GST gives \(h^3\) as the hyperelliptic
involution. It reverses the orientations of the nonseparating basis
curves of integral first homology, so \(h_*^3=1\) on \(H\).
Abelianize the fiber modulo two and reduce the stable letter modulo
three. This defines a surjection to the 48-element group
\[
 G=H\rtimes_{h_*}(\mathbb Z/3),\qquad
 (v,k)(w,l)=(v+h_*^k w,k+l).
\]
Since \(c\) is nonseparating, an oriented simple dual curve on \(F\)
has intersection number one with \(c\), so \([c]\ne0\) in \(H\).
The composite
\[
 \pi_1(X)\xrightarrow{r}\pi_1(D)\longrightarrow\pi_1(M)
      \longrightarrow G
\]
therefore sends each \([\gamma_{\alpha,m}]\) to a conjugate of
\(([c],0)\). This finite quotient of the actual stationary-filled
drilled group detects all chords because it kills both the
complementary factor and the return meridian.
[GST, §6 and Fig. 7, pp. 2323–2324, for the closed-fiber monodromy](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf#page=19)

An explicit smaller quotient is available. The abelianization of the
mapping-torus group over \(\mathbb F_2\) is
\(\mathbb F_2\oplus H/(h_*-1)H\), while square-knot zero surgery has
\(H_1(M;\mathbb F_2)=\mathbb F_2\). Thus \(h_*-1\) is invertible,
and \(h_*^2+h_*+1=0\). Regard \(H\) as \(\mathbb F_4^2\), with
\(\omega\in\mathbb F_4\) satisfying \(\omega^2+\omega+1=0\) and
multiplication by \(\omega\) given by \(h_*\). Choose the first basis
vector to be \([c]\). Projection to its coordinate gives a quotient
onto the twelve affine permutations \(z\mapsto a+\omega^k z\) of
\(\mathbb F_4\), the group \(A_4\). The lower word maps to a conjugate
of the nontrivial translation \(z\mapsto z+1\).

## Independent solid-torus test from the two fillings

Suppose \(\lambda=1\) in \(\pi_1(D)\). Dehn's lemma applied to this
essential simple boundary curve gives a proper compression disk.
Compressing a collar of \(T\) along that disk gives a sphere and
cuts off a punctured solid torus, with disk slope \(\lambda\) on
\(T\). To see the punctured solid torus, reverse the compression
by attaching one 1-handle to the sphere collar on its torus side.
Capping the other sphere boundary gives a closed summand \(N\).
The two fillings of the torus piece then give
\[
 D(\mu)\cong N,\qquad D(\lambda)\cong (S^1\times S^2)\# N.
\]
Here \(\mu\) meets \(\lambda\) once so fills the solid-torus portion
to \(S^3\). But \(D(\mu)=M\) and \(D(\lambda)=Y_2\). Hence
\(\pi_1(M)\) would embed as a free factor in the rank-two free
group. It would be free by the Nielsen–Schreier theorem, and
\(H_1(M;\mathbb Z)=\mathbb Z\) would force infinite cyclic rank one.
[Papakyriakopoulos, Dehn's lemma, p. 169](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/papa.pdf#page=2)

There is an elementary contradiction. The square knot is a trefoil
summed with its mirror. Its exterior group is the amalgam obtained
by identifying the meridians along the connected-sum annulus.
Send the two standard Wirtinger generators of one trefoil, satisfying
\(aba=bab\), to \((12)\) and \((23)\) in \(S_3\). On the other
summand use the cyclic map sending its meridian to the image
\((12)\) of the common meridian. The resulting map onto \(S_3\)
sends the zero longitude of \(Q\) into \(A_3\), as the longitude
has abelianization zero, and into \(C_{S_3}((12))\), as it commutes
with the meridian. The intersection is trivial. Therefore the
map descends to \(M\) and \(\pi_1(M)\) has a nonabelian quotient.
This proves \(\lambda\ne1\) in \(D\) independently of the direct
48-element detection and establishes that the return side has
incompressible torus boundary. Indeed, any essential simple
compressing slope \(p\mu+q\lambda\) must have \(p=0\) by \(H_1(D)\),
so would be \(\pm\lambda\).
[GST, opening of §6, p. 2323, for the square-knot summands](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf#page=19)

The bridge criterion concerns the closed strip-and-chord boundary in
the stationary-filled slab with all moving arcs drilled. Restoring the
lower tube in the capped return factor by meridional filling sends the
projected word to the core class in \(M\). That class is nontrivial here,
giving a sufficient test for the nontrivial drilled word. The elementary
\(S_3\) quotient of \(M\) above is used solely to contradict a consequence
of torus compression. The core \(U\) is an unknot in the original capped
\(S^3\), before the \(Q\)-surgery. Its contractibility there gives no disk
in \(X\). The further joint zero filling kills \(\lambda\) by definition.
The conclusion is for the marked lower return of this fixture.

The frozen issue, four-point assessment and marked-boundary input
have SHA-256 prefixes d97cf414e6fc, 87c03b0b2a02, and 58df53e34c84.
Figure 5 and the cited primary passages were inspected in the published
PDF. No metric or formalization is used.
