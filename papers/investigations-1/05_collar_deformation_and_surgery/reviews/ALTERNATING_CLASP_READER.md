# Independent review of the alternating Whitehead return

26 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. Independent read of SUR-E02ap
[the Whitehead return](../02_handle_isolation_and_marked_surgery/notes/ALTERNATING_CLASP_RETURN.md)
at SHA-256 prefix 77e544c4d5dc, intake HEAD 9c80575988ad. Independent
serving model and effort are unavailable. Smooth oriented links and
spheres, the actual fixed zero filling, and the supplied disjoint native
support charts. The complementary [ribbon construction](../02_handle_isolation_and_marked_surgery/notes/ALTERNATING_RIBBON_TRACE.md)
was read at 7e29c8c43c97 and the [issued geometry](../research-progress/handoffs/CAPPED_FACTORS_AND_FOUR_RETURNS_20261126.md)
at eb30364191d8.

The two adjacent nonsplit stationary lifts and the sharp two core
punctures on the upper $23$ bridge both check. The original unfilled
pair has absolute nonseparating-sphere minimum **four**. The proof
uses the four individual capped sublinks before stationary surgery.
The first returned diagram has a displayed two-point seam and
absolute minimum zero.

## Torus and lift checks

Compactify the open cyclic cover to $S^3$. Use the moving lift $k$
whose lower returns $12,34$ lie above the native seam $S_0$ along the
ribbon in $W_0$ and whose upper returns $23,41$ lie below it in
$W_{-1}$. Denote the stationary components there by $Q_0,Q_{-1}$,
respectively. Under the fixed mouth charts, capping either lower
return on $S_0$ gives a Figure 5 $U$ parallel relative to $Q_0$.
The two upper return completions are jointly the Whitehead pattern
$J$ on the zero parallel $L$ of $Q_{-1}$ and another $U$ parallel,
relative to $Q_{-1}$. For any one of these completions, the face
chord may be changed after the other moving arcs are forgotten. An
isotopy of two embedded arcs with the same endpoints on the
restored sphere extends into a collar of the sphere away from the
stationary component. The paired upper completions use their native
disjoint chords.

The Whitehead pattern exterior inside the carrier $V_J=\nu L$ is
the Whitehead-link exterior. Both cusp tori of the complete
hyperbolic exterior inject, as seen from the horosphere quotients
at its cusps. On the outside, a compressing disk for $\partial V_J$
would give a compression of the exterior of the nontrivial
square-knot parallel $L$, even upon forgetting every exterior
component. The boundary of such a disk must be a primitive slope
with zero meridian coefficient by the exterior homology. A disk
with this zero-longitude slope, joined to the radial annulus to
the core $L$, would unknot $L$. Thus the outer-side test also holds
with either $Q_{-1}$ or the completed $U$ present.
[Thurston, *The Geometry and Topology of Three-Manifolds*, §3.3](https://library.slmath.org/nonmsri/gt3m/PDF/Thurston-gt3m.pdf)

For a knot $A$ outside a carrier $V$, an incompressible $\partial V$
on both sides of the pattern-and-$A$ exterior lets one make a
splitting sphere disjoint from $\partial V$. Indeed an innermost
disk on the sphere either compresses the torus or has a boundary
inessential on it. In the latter case surgery along an innermost
inessential disk on the torus reduces the number of circles. The
mod-two intersection with a path joining the components ensures
one of the replacement spheres still splits. A splitting sphere
inside $V$ puts the pattern in a ball in $V$, which can be moved
off a meridian disk. This would compress the inner torus. A
splitting sphere outside $V$ separates the core of $V$ from $A$,
since the entire carrier is on the pattern side.

Here $L\cup Q_{-1}$ is nonsplit. A splitting sphere would meet the
spanning annulus of the two parallels in an essential circle, since
every arc crossing the annulus from one boundary to the other has
odd mod-two intersection with the sphere. If all intersection
circles were inessential in the annulus, such a crossing arc could
avoid them by going around their disks. An essential circle bounds
a disk on the sphere and is isotopic in the annulus to $Q_{-1}$,
contradicting its knot type. Also $L\cup U$ is the native Figure 5
pair after forgetting $Q_{-1}$, using the radial annulus from $L$
to $Q_{-1}$ that misses the completed $U$. It is nonsplit.
The Figure 5 slide gives the joint zero outlet $Y_2$. GST
Corollary 6.4 then represents $U$, up to slides over $Q$, by a curve
in the closed fiber whose projection to the four-punctured sphere
is an essential embedded curve. Lemma 6.2(3) makes the lift
nonseparating. The fiber group injects into the mapping-torus
group, and the slides preserve the free homotopy class after
stationary filling by banding to the killed longitude. Thus $U$
survives in $\pi_1(S^3_0(Q))$, which also rules out splitting before
filling. Applying the carrier argument first with $A=Q_{-1}$ and
then with $A=U$ proves both $J\cup Q_{-1}$ and $J\cup U$ nonsplit.
[GST, Figure 5 and §6, Lemma 6.2(3) and Corollary 6.4](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf)

For $Q_{-1}$, the independent group test uses the lower ribbon with
oriented boundary $r_{12}c_{23}r_{34}c_{41}$. In the complement of
$Q_{-1}$ the four-arc word based at port $1$ becomes

$$
r_{12}(r_{23}c_{23}^{-1})r_{12}^{-1}\,c_{41}^{-1}r_{41}.
$$

The first conjugated factor is the Whitehead completion, trivial
already in the carrier group since the pattern winding is zero.
The remaining factor is the $U$ completion and survives even after
zero filling. A splitting sphere for $k\cup Q_{-1}$ would put $k$
in a ball off $Q_{-1}$, contradicting this group image.

For $Q_0$, the solid torus $V$ made from the ball below $S_0$ and
the thin lower ribbon handle contains $k$. Its core is the native
$U$ in the complement of $Q_0$, by retracting the same product
access strips and closing the native gap. The outside of $V$ is a
solid torus since this $U$ is unknotted. Any outside compression
avoiding $Q_0$ would have its meridional slope and would cut that
exterior solid torus into a ball containing $Q_0$. This would split
$Q_0$ from the $U$ core of $V$.

Inside $V$ let $D_0$ be the co-core disk of the ribbon handle, with
one puncture from each moving rail. Any compressing meridian
disjoint from $k$ can be made disjoint from $D_0$. Place boundaries
disjoint and minimize intersection circles. Circles bounding
puncture-free disks on $D_0$ can be removed using an innermost such
disk to replace a subdisk of the meridian. Among the remaining
circles take an innermost one on the meridian. It cannot surround
one puncture on $D_0$, since the resulting capped sphere would
intersect the closed $k$ once. If it surrounds both, cap the
puncture-free outer annulus of $D_0$ with that innermost disk.
Push the annulus to the side occupied by the disk germ and round.
This supplies a meridian disjoint from $D_0$ and $k$.

Cutting along $D_0$ gives a ball. Such a meridian in it separates
the two copies of $D_0$. Otherwise a disjoint joining arc could
close to a loop dual to $D_0$ but missing a meridian of $V$.
Each of the two proper returns ends on a different copy. Capping
them there gives the joint $J\cup U$ diagram via the two halves
of the ribbon. The meridian doubled by a disk in the complementary
ball would split these completions. This verifies the inner-side
test and finishes the carrier argument for $k\cup Q_0$.

All other stationary lifts have a diagram ball in their own slabs
missing $k$. If the original unfilled pair lay in a common ball
downstairs, the ball lift containing $k$ could contain at most one
stationary lift and would separate $k$ from every other one. Thus
the support is exactly $\{-1,0\}$ and the unfilled pair is nonlocal.

## Sharp minimum among inlet spheres

The four-holed part of $S_0$ is incompressible on both sides in the
three-component exterior of $k,Q_{-1},Q_0$. To see this, a disk on
one side with boundary essential in the punctured sphere cuts the
ball on that side into two balls. If it separated the ends of an
arc, that arc would have to cross the disk. The only remaining
essential case places the two returns on different sides of the
disk. Complete the return on the side missing the stationary knot
by a chord contained in that disk side's boundary patch on $S_0$.
It would then split from the stationary component on its original
side of $S_0$. This contradicts the individual nonsplitting checks
for the two lower $U$ completions and the upper $J,U$ completions.
This includes all essential slopes, since the disk can only
separate the endpoints assigned to its two complementary patches.

Suppose a sphere $T$ separated $Q_{-1}$ from $Q_0$ and met $k$ at
most twice. Arrange transversality to $S_0$ and $k$, with disjoint
sets of intersection points with $k$, and choose such a $T$ with
the fewest circles of $T\cap S_0$. If a circle bounds an unpunctured
disk on $T$, take one innermost there. The incompressibility just
proved implies it bounds an unpunctured disk on $S_0$. Choose an
innermost such disk on $S_0$ and do surgery on $T$ along it.
Parallel copies of this disk pushed off $S_0$ give two spheres
with fewer intersection circles and at most two punctures each.
At least one still separates the stationary components, by
mod-two intersection with a path joining fixed points on those
components. In both this surgery and the one below, the path can
avoid the small product neighborhood of the surgery disk and the
two replacements add to $T$ as mod-two cycles outside that
neighborhood. This contradicts minimality.

Any remaining intersection circle separates the two punctures of
$T$, since intersection of a sphere with a closed knot has even
parity. Such a circle has odd mod-two linking with $k$. On $S_0$
it therefore cuts off one puncture on one side and three on the
other. Choose a once-punctured disk on $S_0$ innermost among these
disks, so its interior has no intersection circle. Surgery on
$T$ along it gives two spheres each meeting $k$ twice, one
puncture from a piece of $T$ and one from a pushed-off copy of
the surgery disk. One sphere still separates $Q_{-1}$ and $Q_0$,
and each has fewer intersection circles. Minimality now makes
$T$ disjoint from $S_0$.

The disjoint sphere lies inside one of the two balls at $S_0$
and encloses that ball's stationary component on the side away
from $S_0$. Each of its two proper returns has both endpoints
outside $T$, so it contributes an even number of punctures.
At most two punctures leave at least one return disjoint from
$T$. Closing that return on $S_0$ produces a split pair with the
enclosed stationary knot, again impossible. This rules out all
such $T$ with zero or two punctures, regardless of its meridional
position.

For any nonseparating inlet sphere disjoint from the stationary
tube, cutting along it and stacking gives the same cyclic cover,
since its oriented dual character generates $H^1(Y_1;\mathbb Z)$.
The two adjacent stationary lifts occupy consecutive regions of
that stack. Choose its lifted sphere between them. It is a sphere
$T$ as above. The moving lift projects one-to-one to the moving
knot, since the knot has zero winding. Thus the downstairs sphere
meets the moving knot at least four times. The native $S_0$
attains four and misses the stationary tube. This is a lower
bound for arbitrary nonseparating inlet spheres of the stated
kind. [Earlier cyclic-cover convention](../02_handle_isolation_and_marked_surgery/notes/LIFTED_LINKS_AND_SPHERES.md)

## Two punctures of the filled bridge

The standard Whitehead disk loses two meridian subdisks in the
drilled complementary component. The resulting cuffs in the
carrier are two opposite copies of its zero longitude. The
actual zero chart on the parallel $L$ identifies these with the
boundaries of two parallel copies of the radial annulus and native
filling-meridian cap, trimmed at $\partial V_J$. Each crosses the
actual filling core $Q^*$ once. Matching the cuffs, adding the
native mouth rectangle and rounding yields a proper bridge for
the return $23$, disjoint from the other moving arcs by the
specified supports. [Thurston, *A Norm for the Homology of
3-Manifolds*, §2, Example 1 and Figure 2](https://people.math.harvard.edu/~ctm/home/text/others/thurston/norm/norm.pdf)

For zero punctures, shrink the core tube off the disk and absorb
the remaining torus collar back into the stationary exterior.
After closing the mouth and capping the faces it would span
$J$ away from $Q$, splitting them. For one puncture the same
operation leaves an annulus making $J$ conjugate, up to orientation,
to $\lambda_Q$ in the unfilled capped knot group. The winding-zero
pattern is trivial already in the carrier while the zero longitude
is the nontrivial boundary word of the once-punctured genus-two
fiber. The latter fiber group injects into its mapping-torus
group. Both lower bounds also apply after changing the face
chord: in the capped unfilled three-sphere the restored face
chord is isotopic to the native one after forgetting the other
moving arcs, using a collar away from $Q$. The exhibited two
opposite punctures are therefore sharp over all admissible chords.
[GST, §6, pp. 2323–2325](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf#page=19)

The first filled push across $S_0$ removes ports $2,3$ and places
the new short arc beside the ribbon edge $23$. The next disk
extends the lower ribbon by the short product strip between these
two arcs and misses $Q^*$ and the other moving return. This
second move can be made in the corresponding returned unfilled
diagram, keeping the stationary tube fixed. It localizes that
pair to a slab ball, proving absolute minimum zero for this
returned unfilled pair. The displayed seam counts are $4,2,0$,
whereas the absolute minima of the successive unfilled diagrams
are $4,0,0$. The original and first returned unfilled pairs
differ by the push through the stationary filling core. The
review uses the actual zero framing and the disjoint access
charts of the issue.
