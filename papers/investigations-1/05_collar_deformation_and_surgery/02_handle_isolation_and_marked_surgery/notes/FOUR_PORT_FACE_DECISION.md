# Deciding marked bridges on the four-holed faces

26 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. Fixed execution packet SUR-E02ae. The issue selects
a bounded GPT-6.2 Sol/ultra helper. Actual serving model and reasoning effort
are unavailable. Intake HEAD `14cb15842422`. Input SHA-256 prefixes were
`7e808251d2d8` for the [four-point issue](../../research-progress/handoffs/FOUR_POINT_MARKED_RETURNS_20261126.md),
`66d52926f68f` for the [unique face slope](FOUR_PORT_UNIQUE_FACE_SLOPE.md), and
`96591a372a0c` for the [peripheral disk and homology tests](FOUR_PORT_BOUNDARY_PATTERN.md).

Write \(Y_r=\#_r(S^1\times S^2)\). For a triangulated instance of the smooth
oriented integral \(Y_1\to Y_3\) pairing in the issue, there is a finite
decision for whether either specified face admits a bridge chord with some
wall section in the actual stationary-filled slab. There is also a finite
decision for simultaneous bridge disks whose face chords become disjoint on
the common seam. The decisions apply to reducible slabs. A positive answer
yields the chords and disks in the supplied marking.

## A clean essential disk on one selected face

Let \(X\) be the drilled slab with the stationary torus filled on its actual
integral slope. The input is a finite triangulation of this pair, with the two
marked faces \(F_-,F_+\), all four wall annuli, the labeled cuff identifications
across the seam and the tube charts represented piecewise linearly. One can
also construct \(X\) by triangulating the specified solid torus attachment to
the drilled exterior. Both return annuli join cuffs on one face, and both
through annuli join the two faces. Thus \(\partial X\) is one closed surface
of genus three. Each of the four cuffs on one face has homology class in
\(H_1(X;\mathbb Z)\) equal to a return or through meridian with a sign. The two
return meridians, the common oriented through meridian and the stationary
meridian are independent by the degree-three cover calculation. In particular
each cuff is essential in \(\partial X\). A curve in the interior of a selected
face \(F\) that bounds a disk on \(\partial X\) bounds a disk in \(F\). Any cuff
inside such a disk would be inessential in \(\partial X\), so the disk stays in
the face. [Meridian computation](FOUR_PORT_BOUNDARY_PATTERN.md#what-the-free-rank-fixes)

Cut \(X\) along a complete system of interior normal spheres and cap the new
sphere boundaries with balls. Retain the irreducible component \(P\) carrying
the entire original boundary, with its marking unchanged by the cutting.
A finite search for such a system follows from the weight bound for compact
orientable triangulated manifolds with boundary in Lackenby and Yazdi,
Theorem 8.8. For each candidate, test essentiality of its spheres, then cut,
cap and test irreducibility of the resulting components. Matveev's Theorem
4.1.12 reduces the latter test to finitely many
fundamental spheres and doubled fundamental projective planes. A nonseparating
sphere is essential. For a separating sphere, test whether a side having only
that spherical boundary is a ball by capping it and recognizing \(S^3\).
[Lackenby and Yazdi, Definition 8.7 and Theorem 8.8](https://doi.org/10.1112/plms.12500)
· [Matveev, 2nd ed., §4.1.4](https://doi.org/10.1007/978-3-540-45899-9)
· [Schleimer, §1](https://arxiv.org/abs/math/0407047)

An original boundary loop has the same nullity in \(P\) and \(X\). In fact
the component carrying the original boundary before capping has unchanged
fundamental group upon capping. Reconstructing \(X\) from the cut components
puts this group into a free factor by van Kampen, since all sphere interfaces
are simply connected. Nonseparating sphere cuts contribute free generators
when their interfaces are restored. For a simple loop on the original
boundary, Dehn's lemma equates nullity with existence of a proper disk in
either manifold. This preserves disk existence for the exact loop, including
when different disks with that boundary can occur in reducible \(X\).
[Papakyriakopoulos, Dehn's lemma, p. 169](https://www.maths.ed.ac.uk/~v1ranick/papers/papa.pdf)

Make \(F\) and its boundary subcomplexes of the triangulation of \(P\). Choose
the boundary pattern \(\Gamma\) to be the boundary 1-skeleton outside
\(\operatorname{int}F\), including all of \(\partial F\). Its complement in
\(\partial P\) consists of \(\operatorname{int}F\) and the interiors of the
triangles of the complementary region. A clean disk misses \(\Gamma\).
A boundary contained in a complementary triangle bounds a clean disk on the
boundary, so an essential clean disk has its boundary in \(\operatorname{int}F\).
Conversely every proper disk on a face-essential curve, placed off its cuffs,
is essential and clean for this pattern. Apply Matveev's Theorem 4.1.13 to
\((P,\Gamma)\) to construct one such disk or certify there is none. The proof
of his Theorem 4.1.15 uses the same pattern on the complement of the specified
subsurfaces. [Matveev, Definitions 3.3.9–3.3.11 and Theorems 4.1.13 and
4.1.15](https://doi.org/10.1007/978-3-540-45899-9)

## From one disk to a bridge decision

A peripheral curve on \(F\) represents a nonzero meridian, so a returned
compression boundary \(s\) separates the four cuffs into two pairs. A mixed
pair containing one return and one through cuff has nonzero class
\(\pm[\mu_R]\pm[\mu_t]\) in \(H_1(X;\mathbb Z)\). Hence in the stated class
the only possible partition separates the return cuffs from the through cuffs.
Determine the partition directly from the returned curve. If there is no
clean compression, there is no bridge. A bridge on any chord supplies its
separator by thickening the clipped bridge disk and the once-holed torus on
the return side. The resulting separator disk cuts off a solid torus there.

If a bridge exists on some chord, the separator it supplies is the unique
isotopy class of essential compressible face circle by SUR-E02ac. In that
argument a different slope in minimal position gives alternating waves in
the two pairs of pants. They represent nonzero powers of the cuff classes
in separate factors of the disk free product, so their word cannot be
trivial. Thus when a bridge exists, any essential clean disk returned by
the procedure has the same boundary class, even if the particular disk
returned has a different interior. [Free-product argument](FOUR_PORT_UNIQUE_FACE_SLOPE.md#uniqueness-in-the-four-holed-face)

On the return pair of pants cut off by \(s\), choose an embedded arc \(a\)
between the return cuffs. It is unique up to isotopy with endpoints allowed
to move along those cuffs. Restore the chosen end germs and append a section
of the actual return annulus, giving a simple closed curve \(\gamma_m\), where
\(m\in\mathbb Z\) is the section's winding relative to a reference section.
Choose signs so that
\[
[\gamma_m]=[\gamma_0]+m[\mu_R]\quad\text{in }H_1(X;\mathbb Z).
\]
Integer homology computation leaves at most one candidate, namely the negative
of the \([\mu_R]\) coefficient of \([\gamma_0]\), provided all other coefficients
vanish. A change of end turns in a face chord changes the reference winding.
An isotopy of free-end chords extends over the annulus by carrying the two
endpoint tracks and then extends over a collar of \(\partial X\). It thereby
carries the entire family of closed loops to the family on the new chord,
with a possible shift of winding labels. Thus an arbitrary representative
of the recovered chord class suffices when all windings are allowed.

For the remaining candidate decide \([\gamma_m]=1\) in \(\pi_1(X)\). In the
drilled slab this is the word test modulo the normal closure of the actual
stationary slope. A finite construction specific to this simple boundary
curve uses Matveev's Theorem 4.1.10 on \((X,\gamma_m)\). Genus zero is
equivalent to a proper spanning disk, hence to triviality of the word by
Dehn's lemma. Matveev computes the genus by finding a least-genus orientable
surface with the specified boundary, so the genus-zero case gives a disk.
Restore the radial strip in the marked return tube to obtain the bridge.
If the homology step yields no candidate or the genus test fails, the
assumption of a bridge would have forced the recovered separator and its
tested chord class, a contradiction. [Matveev, Theorem 4.1.10 and its
proof](https://doi.org/10.1007/978-3-540-45899-9) · [Clipping and radial
restoration](FOUR_PORT_BOUNDARY_PATTERN.md#the-marked-disk-test)

## Simultaneous chords and seam comparison

Run the face decision twice. If both faces return bridges, compare their
separator classes as unoriented curves on the common four-holed sphere using
the actual seam map. The seam sends each face's return pair to the other
face's through pair. Two disjoint chords for the two complementary pairs
have disjoint separator representatives, obtained by taking small disjoint
regular neighborhoods of the chords and their cuffs. Two disjoint essential
nonperipheral circles on this surface are isotopic, since the complement of
one consists of two pairs of pants. Equality is therefore necessary. It is
decidable by removing bigons and testing whether the remaining intersection
number is zero. [Farb and Margalit, Proposition 1.7](https://doi.org/10.23943/princeton/9780691147949.003.0002)

Conversely, equality supplies one representative separator on the common
face. Choose one chord in each of its opposite pairs of pants and pull them
back to their respective actual faces. The chords can meet the prescribed
endpoints and have product germs at the seam. Endpoint turns can be absorbed
by moving the sections on the actual annuli, with their unique admissible
windings read again in the original charts. The two return annuli are
disjoint, and these choices are independent. The resulting closed boundaries
are disjoint in \(\partial X\). Proper spanning disks for them can be made
disjoint by taking an innermost intersection circle on one disk and replacing
the subdisk it bounds on the other by a slightly pushed copy. There are only
circle intersections since the boundaries are disjoint. Each replacement
reduces their number and leaves both boundaries fixed, also in reducible
\(X\). Rounding the disks and restoring the two disjoint radial strips gives
simultaneous smooth bridges with matching face data.

The decision concerns the supplied four-point sphere and mixed pairing, with
chords selectable in the marked faces and wall windings allowed to vary.
If exact chords or wall windings are prescribed, use their precise boundary
loops and test the required chord disjointness under the seam. The procedure
decides bridge existence after stationary filling. The stationary filling
core can meet these disks. Core puncture bounds, framed subtraction slides,
transport of successor tubes and terminal handle accounting require further
geometric checks for the actual presentation.
