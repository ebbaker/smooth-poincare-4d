# Compression boundaries at a four-point cut

26 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. Fixed execution packet SUR-E02aa, issue 1. The issue
selects a bounded GPT-6.2 Sol/ultra helper. Actual serving model and effort are
unavailable. Git intake `4d73fdde6804ce93fc2a3e4cef403e16eb941dab`.
[Four-point issue](../../research-progress/handoffs/FOUR_POINT_MARKED_RETURNS_20261126.md)

For the specified same-face and through pairing, a nonseparating compression
boundary projects to a preferred longitude after its two through holes are
capped. It has algebraic intersection of absolute value one with the return
meridian. The full homology class on the twice-punctured torus still leaves two
geometric questions. The curve can require three intersections with the
meridian, or can intersect it once and use a different face chord. A
nonseparating compression in the once-holed torus cut off by the prescribed
face separator does give a bridge for the prescribed chord.

## The marked disk test

Work in the smooth oriented category. Let \(Y_r=\#_r(S^1\times S^2)\). An
integral two-component attachment \(Q,K\) goes from \(Y_1\) to \(Y_3\). Cut
the marked nonseparating sphere in \(Y_1\) to \(W=S^2\times I\). The stationary
tube \(Q\) is interior. The moving tube \(K\) cuts into the returns \(R_-,R_+\)
and the two through arcs \(T_1,T_2\) of the issue. Let \(E\) be the drilled
slab and \(X\) its actual stationary filling. At either face write
\(U=F\cup A\), where \(F\) is the sphere with four open disks removed and
\(A\) the side annulus of that return. Smooth the corners. Its boundary
circles are the two through ends \(e_1,e_2\). The fixed return meridian
\(\mu\) is a core of \(A\). With the tube parametrized as \(D^2\times I\),
the meridian is \(\partial D^2\times\{t\}\). A section across \(A\) is
longitudinal and meets it once.

Fix the truncated face chord \(\alpha\subset F\) between the return end
circles. Write \(\gamma_m\) for \(\alpha\) joined to a section of \(A\), where
\(m\) counts the winding relative to the section giving the capped zero
longitude. The section and chord carry matching end germs. The radial strip
in the return tube extends the section to the arc core. A proper disk in
\(X\) on \(\gamma_m\) gives a bridge disk by attaching this strip and the short
chord continuations in the end disks. Its interior misses all other arc cores
and the cut faces. Conversely, clip a bridge disk in collar position along its
return edge to obtain such a proper disk, shrinking the other tubes first if
necessary. Thus, for each prescribed strip,
\[
 \text{marked bridge disk}\quad\Longleftrightarrow\quad
 [\gamma_m]=1\text{ in }\pi_1(X).
\]
For the reverse implication, a boundary collar puts the singular spanning disk
in the form required by Dehn's lemma. Apply the lemma to the prescribed simple
boundary and smooth the resulting proper disk relative to the collar. If the
stationary torus has slope \(\alpha_Q\), this criterion in \(\pi_1(E)\) tests
membership in the normal closure of the stationary slope word. The same
criterion with the opposite sign of the loop or another base path is equivalent.
[Dehn's lemma, Papakyriakopoulos, p. 169](https://www.maths.ed.ac.uk/~v1ranick/papers/papa.pdf)
· [Earlier peripheral test](LOWER_PORT_PERIPHERAL_GROUP.md#peripheral-criterion-for-another-marked-cut)

Any compression whose boundary has geometric intersection one with \(\mu\)
admits some chord-and-section representative. First put the curve in minimal
position, take a thin annular collar of \(\mu\) in which the only segment is
the transverse crossing, and carry this collar back to \(A\) by rescaling.
Straighten that segment to a section. The remaining segment lies in \(F\)
and gives the chord. That chord can vary even when the full homology class of
the boundary and the return meridian are fixed.

## What the free rank fixes

Orient the arcs and all moving meridians along \(K\). Proper arcs ending on
the same face have signed intersection zero with a product sphere, and the
through arcs cross in opposite directions. Excision for \((W,E)\) gives the
five relative meridian disk generators in degree two. This follows from the
pairs \((D^2\times S^1,\partial D^2\times S^1)\) at \(Q\) and
\((D^2\times I,\partial D^2\times I)\) at the arcs. The map from \(H_2(W)\)
imposes the signed difference of the two through meridians. Since \(H_1(W)=0\),
\(H_1(E)\) is free on \(\mu_Q,\mu_-,\mu_+,\mu_t\), with both through meridians
represented by \(\mu_t\).

For comparison, cap both faces by balls. In each ball complete the return and
join the two through ends by disjoint trivial arcs using disjoint chords, with
the return completion following its prescribed chord. The closed components
in \(S^3\) are \(Q,J_-,J_+,C\), where \(C\) uses the through arcs. Inclusion
of \(E\) into the completed link exterior sends the four generators bijectively
to its oriented link meridians. It is therefore an isomorphism on integral
first homology. No extra homology generator or relation arises from the two
trivial arcs per face in this comparison. The fixed chord and its strip follow
the completed return in a small collar of the capping arc, disjoint from the
through cap. Thus the zero-winding loop \(\lambda=\gamma_0\) represents the
preferred capped longitude in the completed link exterior. On the lower
\(U\), choose the sign of a through boundary class \(\delta\) to map to
\(\mu_t\). Then \([\mu],[\lambda],\delta\) is a basis of \(H_1(U)\), the last
class generating the kernel of the abstract disk capping map. The same basis
description holds on the upper \(U\).

In the original joint exterior in \(Y_1\) both cores are null-homologous and
the rank is three, by the same relative meridian calculation. The outlet rank
is also three. Each slope relation therefore vanishes in the exterior's free
abelian group. The integral slopes have zero self-framing, and the total
\(\operatorname{lk}_{Y_1}(Q,K)\) vanishes. Put
\(a=\operatorname{lk}(Q,J_-)\), \(b=\operatorname{lk}(Q,J_+)\),
\(u=\operatorname{lk}(Q,C)\), using the capped link. A Seifert surface for
\(Q\) can be taken in the interior of \(W\), since \(Q\) is null-homologous
there. It computes \(a+b+u=0\). It also computes the same stationary zero
framing in the slab, capped link and original inlet. Thus \(H_1(X)\) is the
quotient by the stationary relation \((0,a,b,u)\). The base sum alone permits,
for example, the homological pattern \((a,b,u)=(1,0,-1)\), which would kill
\([\mu_-]-\delta\).

The degree-three cyclic cover gives the stronger conclusion
\(a=b=u=0\). The map from the original exterior group to the cyclic deck group
factors through \(\pi_1(Y_1)\), and the meridians and preferred longitudes of
both components map to zero. Thus the cover extends over all fillings. Its
inlet is again \(S^2\times S^1\), with three lifts of each of \(Q,K\), each
null-homologous. The lifted exterior has first homology free of rank seven by
the relative meridian calculation. The covered outlet has fundamental group an
index-three subgroup of \(F_3\) and first homology of rank seven. Each lifted
filling relation therefore vanishes. In particular, each linking number of a
lift of \(Q\) with a lift of \(K\) is zero. In a fixed chamber of this cover,
the two through arcs belong to one lift of \(K\). The lower and upper returns
belong to the other two lifts, one from each neighboring chamber. This follows
by traversing \(K\) along the seams with the given pairing, which places its
through arcs in one chamber and its returns across opposite seams. The three
chambers remain distinct modulo three. The three linking numbers of the
stationary lift, measured on its lifted Seifert surface, are exactly \(a,b,u\).
This proves the assertion and leaves all four meridians independent in
\(H_1(X;\mathbb Z)\).

Write an oriented lower compression boundary as
\([\gamma]=p[\mu]+q[\lambda]+k\delta\). Put
\(c=\operatorname{lk}(J_-,J_+)\) and \(d=\operatorname{lk}(J_-,C)\).
The longitude in the capped link has coordinates \((a,0,c,d)\). Comparison
and filling give the following necessary equation for a disk boundary.
\[
 (0,p,qc,qd+k)=0\qquad\text{in }\mathbb Z^4.
\]
For a nonseparating boundary, disk capping of the through holes leaves a
nonseparating curve in a torus, with primitive class \((p,q)\). It follows
that \(p=0\), \(q=\pm1\), \(c=0\), and \(k=-qd\). The upper return has the
same test with the roles of the two returns exchanged and its own linking
with \(C\). In particular the fixed-chord family has at most the single
candidate \(\gamma_0\) on either face, since \([\gamma_m]=[\lambda]+m[\mu]\).
It requires both \(c=d=0\) on the tested side even in homology. The
candidate's actual null word is the disk test.

An essential separating boundary has a planar side. If that side contains one
through hole, the curve is peripheral and its meridian image in \(H_1(X)\)
excludes a disk. If it contains neither, the curve bounds a disk in \(U\).+If it contains both, the planar side is a pair of pants and the other side a
once-holed torus. The boundary represents zero in \(H_1(U)\). Its algebraic
intersection with the return meridian is zero even if its geometric
intersection is positive. The longitude calculation does not exclude this
separating type.

## Surface tests with the full longitude class fixed

The following constructions concern curves on \(U\). Neither asserts a disk
in the filled slab of a free-outlet example.

**Three forced crossings.** Cut \(U\) along the fixed \(\mu\), obtaining an
annulus with two holes. On both copies of the meridian mark points \(1,2,3\)
in the same circle order. Call the copies \(M_0,M_1\). Join \(2\) to \(3\) on
\(M_1\) by a return which cuts off one through hole and joins the interval
avoiding \(1\). Join \(3\) to \(1\) on \(M_0\) by a return which cuts off the
other hole and joins the interval avoiding \(2\). Draw the remaining spanning
arc from \(1\) on \(M_1\) to \(2\) on \(M_0\) in the complement. These arcs
exist by drawing the returns in disjoint collars of the two annular boundaries,
each enlarged to contain its hole. Any prescribed location of the two holes
can be carried to this model by an annulus diffeomorphism fixing its boundary.
Regluing and smoothing gives one simple curve with crossing signs \(+,+,-\).
There is no bigon with \(\mu\). Each same-side return cuts off a hole on one
side and the other annular boundary on the other. The spanning arc has
endpoints on different sides. The bigon criterion gives \(i_U(\gamma,\mu)=3\).
[Farb–Margalit, Proposition 1.7](https://euclid.nmu.edu/~joshthom/teaching/ma589/farbmarg.pdf)

Orient \(\gamma\) so its longitude coefficient is one. A twist along a curve
in \(F\) encircling one return end and one through end acts on this class by
adding \(\pm[\mu]\pm\delta\). This uses the annular twist formula, since the
twist curve's class is \(\pm[\mu]\pm\delta\) and the absolute algebraic
intersection is one. A twist along \(\mu\) adds only \(\pm[\mu]\). Powers of
these two twists first set the \(\delta\) coefficient and then the \([\mu]\)
coefficient to zero. Both preserve geometric intersection with \(\mu\). Thus
even the exact class \([\lambda]\) can have geometric intersection three.
The first twist can instead tune any specified \(\delta\) coefficient.

**One crossing on the wrong chord.** Choose an arc in \(F\) from \(e_1\) to
\(e_2\) crossing the fixed chord \(\alpha\) once. To construct it, cut \(F\)
along \(\alpha\) to a pair of pants. Join each hole to the corresponding copy
of one interior point of \(\alpha\) by disjoint arcs and reglue. The boundary
\(s\) of a thin neighborhood of the joining arc and both through circles is a
separating curve in \(F\) disjoint from \(\mu\), with \([s]=0\) on \(U\).
It meets \(\lambda\) geometrically twice. The segment of \(\lambda\) on the
pair-of-pants side separates its through holes. The segment on the torus side
crosses \(\mu\) once, so cannot bound a bigon with an arc of \(s\), which
misses \(\mu\). Twisting once about \(s\) produces a curve with the exact
class \([\lambda]\) and \(i_U(T_s\lambda,\mu)=1\). It is not isotopic to
\(\lambda\), since \(i_U(T_s\lambda,\lambda)=4\). Every other winding of
the fixed chord has different homology. The twist changes the face arc and
fixes the wall of the return. After the holes are replaced by marked points,
this twist is a push of one point around the other. It becomes trivial once
both marks are forgotten. [Farb–Margalit, Proposition 3.2 and the push-map
description in §4.2](https://euclid.nmu.edu/~joshthom/teaching/ma589/farbmarg.pdf)

## Capping and disjoint disk tests

Abstract capping determines the longitude but loses the geometric data in the
two constructions. Within \(X\) the end circles cannot be individually capped
by disks because their classes are \(\pm\mu_t\ne0\). Restoring the two through
tubes attaches \(D^2\times I\) along each lateral annulus and kills their
meridians in the fundamental group. A disk in this quotient geometry can meet
the restored arc cores. Its boundary word must already vanish in \(\pi_1(X)\)
for the marked bridge, or the disk must be made disjoint from both cores before
re-drilling. The homology comparison using the separately capped link supplies
neither condition.

Disjoint nonisotopic nonseparating compression boundaries on one \(U\) are
impossible. After cutting along one, the other separates the two new boundary
circles. If the two boundaries are not isotopic, each region between them
contains one through hole. The difference of their coherently oriented classes
is then \(\pm\delta\), which cannot vanish in \(H_1(X)\). A nonseparating
curve does admit a disjoint separating curve enclosing both holes, obtained by
joining the holes in its cut complement and taking the boundary of a regular
neighborhood. This surface construction also applies to the curve with three
forced crossings. It does not place that separating curve in the marked face.

Here is a sufficient disjoint compression test. Fix a separator \(s_0\subset
F\) bounding the pair of pants around the two through ends and missing the
prescribed chord. Suppose a nonseparating compression has its boundary
disjoint from this \(s_0\), for instance as part of a disjoint pair of disks
with separating boundary exactly \(s_0\). Its boundary lies on the torus side
\(V\), a once-holed torus consisting of \(A\) and the remaining face pair of
pants. So does \(\mu\). On \(V\) the intersection of their primitive capped
classes has absolute value one and is realized geometrically. To see the latter
directly, cut \(V\) along \(\mu\) to a pair of pants. Opposite signs in minimal
position would require same-side returns on both meridian copies. An essential
return at one copy separates the other copy from the hole, producing two
annuli. A return at the other copy is boundary parallel in its annulus.
That would give a bigon. Hence one crossing suffices. Its face arc now joins
distinct return boundaries in a pair of pants and is isotopic to the fixed
chord with endpoints allowed to slide on their circles. Drag the section along
and restore the prescribed end germs. The resulting closed curve belongs to
the fixed-chord family. The homology test fixes its winding, and collar isotopy
of the original disk gives the actual marked bridge.

The sufficient test needs the marked location of \(s_0\) and the
nonseparating disk disjoint from it. It gains no selection from arbitrary
separating or disjoint compression boundaries. Finding a marked bridge on the
general pairing remains a separate step beyond the existence of a compression.

## Input receipts

Working SHA-256 prefixes were `ac934a5d0253` for the issue, `fe2aa3bcc284`
for the [two-port reader](../../reviews/TWO_PORT_LOCALIZATION_READER.md),
`27b35bdba6db` for the [two-port slope proof](COMPRESSED_PORT_SLOPE.md), and
`15f63bca22cb` for the [peripheral disk criterion](LOWER_PORT_PERIPHERAL_GROUP.md).
The surface tests and degree-three homology calculation are for the given
pairing. No metric input or global smooth recognition is used.
