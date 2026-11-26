# Independent reading of the base face and Whitehead support

26 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. Independent nonauthor reading 2 of the
[reader issue](../research-progress/handoffs/WHITEHEAD_MIXED_READINGS_20261126.md).
The issue selected a GPT-6.2 Sol/ultra reader. Actual serving model and
effort are unavailable. I inspected the working face proof with SHA-256
prefix eed4ef9d5635, which differs from the e02ai snapshot b76f714b3cbb
listed in the reader issue, and the expanded specimen issue at
0998bc2050df. The local disk return was independently read at
1e6ac20bc7e4. The category is smooth and oriented, with the specified
integral framings and marked sphere gluings.
[Base face proof](../02_handle_isolation_and_marked_surgery/notes/ONE_MOUTH_FACE_DISKS.md)
· [Specimen and insertions](../research-progress/handoffs/ONE_MOUTH_MIXED_20261126.md)
· [Local Whitehead disk](../02_handle_isolation_and_marked_surgery/notes/WHITEHEAD_RAIL_DISK.md)

The base face and full-port kernels are as claimed. The Whitehead
insertions preserve the lower word obstruction by a different map.
The double, single and empty configurations have sharp sphere
intersection minima \(4,2,0\) in the specified order. The sharp
two-puncture bound for each specified Whitehead bridge follows from
the displayed local disk, together with the global parity and
nontrivial-knot arguments below. The analogous exact puncture count
for a separating face disk needs its own geometric construction.

## Base face and port

The hemisphere is disjoint from the drills and the stationary filling
in the base fixture. Calling its two sides \(P,Z\), the marked
return factor \(P\) has the boundary torus formed from the return
once-holed torus and the hemisphere. Adding the short-arc ball
exterior is an annular collar and transports the peripheral
marking. Thus its distinguished slopes fill to \(S^3_0(Q)\) and
\(Y_2=\#_2(S^1\times S^2)\). The link rank implies zero framing
and zero mutual linking, so \(H_1(P;\mathbb Z)\) has the two meridians
as basis and the longitude spans the homological boundary kernel.
[GST, §2, Figure 5 and Proposition 2.2](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf#page=6)

If the torus map had any kernel, the Loop Theorem would give an
embedded disk with simple essential boundary. Its slope would have
to be the primitive longitude. Compressing a collar of the torus
then writes \(P=(S^1\times D^2)\# C\), with longitude the solid
torus meridian and with the same closed factor \(C\) in both native
fillings. The distance-one filling gives \(S^3_0(Q)\cong C\), while
the meridian filling of the solid-torus piece gives
\(Y_2\cong (S^1\times S^2)\# C\). Prime uniqueness gives
\(C\cong S^1\times S^2\), and Property R contradicts nontriviality
of the stationary knot. This proves the torus injection without
assuming irreducibility of \(P\). For the square knot itself, the
closed genus-two fiber injects in \(\pi_1 S^3_0(Q)\) and already
contradicts the proposed product factor. Discarding closed prime
summands preserves the injection in the boundary-bearing summand,
by van Kampen across the splitting spheres.
[Hatcher, Theorems 1.5 and 3.1](https://pi.math.cornell.edu/~hatcher/3M/3M.pdf)
· [GST, Theorem 1.1 and §6](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf)

The hemisphere gives a joint basepoint and the free product
\(\pi_1(P)*\pi_1(Z)\). The deleted hemisphere replaces a disk patch
of the undrilled complementary slab, so the latter has the same
homology as the slab. Excision for the two through arcs and the
upper return gives three meridian generators and the relation from
a sphere parallel to the upper face. This identifies the consistently
oriented through generators and leaves an infinite-order through
meridian in \(Z\). Killing the common cuff \(s\) in each surface
group therefore gives precisely
\[
 \pi_1(F_-)/\langle\!\langle s\rangle\!\rangle
    =\mathbb Z*\mathbb Z,\qquad
 \pi_1(U_-)/\langle\!\langle s\rangle\!\rangle
    =\mathbb Z^2*\mathbb Z,
\]
with each displayed quotient injecting into the ambient free
product. This proves both complete normal-closure descriptions.
The alternating-wave proof identifies the simple null curves.
A pair-of-pants wave in minimal position cuts off one of its other
cuffs and survives in the capped annulus. An essential
boundary-to-itself arc in the once-holed torus is nonseparating.
Indeed a separating one would cut off a disk, by Euler characteristic
and the fact that the original surface has one boundary component.
Closing a nonseparating arc across the cap produces an essential
curve on the torus, since the two halves of the cap attach to
the connected cut surface. These nonzero words alternate between
the two distinct ambient factors. A disjoint simple null curve is
then parallel to \(s\), with the peripheral cases excluded by
the meridians. A clipped bridge loop meets the marked wall
meridian algebraically once up to sign, including for arbitrary
chord and endpoint motion. Such a loop cannot have the slope \(s\).

## Which arguments transfer to the Whitehead fixtures

The access fingers can cross the base hemisphere. The base
free-product argument gives no presentation of the lower face or
port kernels after those insertions. For the lower bridge words a
direct map replaces it. Restore all moving tubes and cap the two
spherical faces after stationary filling. This gives
\(M=S^3_0(Q)\). Attaching a radial strip to the section sends the
lower word to the lower return core with its chosen chord. In
the capped face all chord paths between those endpoints are
homotopic relative to their endpoints, with wall meridians killed.
The unchanged lower return therefore maps to the class of the
actual Figure 5 unknot \(U\) in \(M\), for every chord and section.
By GST Corollary 6.4 and Lemma 6.2(3), slides over the stationary
zero-longitude curve take \(U\) to a nonseparating curve of the
closed genus-two fiber. Each slide preserves free homotopy in
\(M\), since the sliding longitude bounds the filling meridian
disk. The fiber group injects, which detects the lower word on
each modified fixture. This argument uses neither the old
hemisphere nor a completion of the through tubes that preserves
their drilled peripheral group.
[GST, §6, Lemma 6.2(3) and Corollary 6.4](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf#page=19)

## Support in the same marked cyclic cover

Index the chambers by \(S_+(i)=S_-(i+1)\), and put the two rails
of the selected moving lift in chamber zero. That lift visits
the lower return in chamber \(+1\) and the upper return in chamber
\(-1\), then closes after one traverse of the base moving core.
The rail pattern stays in chamber zero. The second, upper
pattern stays in chamber \(-1\). Moving the mouth through the
access box and capping at the relevant seams recovers the actual
pattern in each chamber, or the actual Figure 5 lower completion
in \(+1\). This uses the two sides of the supplied product
rectangle at the unobstructed mouths, with the side of the rail
replacement left in that same chamber. In particular the rail
pattern and the adjacent GST mouth involve different stationary
lifts. This conclusion depends on the identity seam and the
stated fixed end intervals.

The GST chamber is nonsplit, since splitting would split its
joint zero filling into the two individual zero surgeries. The
two fillings each have first Betti number one. Prime uniqueness
would make the square-knot zero surgery \(S^1\times S^2\),
contradicting its genus-two bundle description. The Whitehead
chamber is also nonsplit. Its companion torus separates the
pattern from the exterior of the two parallel square knots
\(Q,L\). No compressing disk exists on the pattern side, since
an essential disk in the solid torus is meridional and the
Whitehead pattern has geometric wrapping two. No compressing
disk exists outside the companion torus, already in the
exterior of the nontrivial companion \(L\). For a putative
splitting sphere, remove inessential circles on the companion
torus by innermost-disk surgery, retaining a sphere separating
the two link components by the mod-two path intersection
test. Any remaining innermost essential circle on the
sphere would compress the torus. A splitting sphere disjoint
from the companion torus would either put the pattern in a
ball in the solid torus, contradicting geometric wrapping,
or split \(Q\) from \(L\). The parallel annulus prevents the
latter: every circle of intersection of this annulus with a
sphere that is essential in the annulus would make its square-knot
core bound a disk. Without such a circle the two annular ends
lie on the same side of the sphere.
[Eisermann, Example 22 and Figure 1, p. 1218](https://pnp.mathematik.uni-stuttgart.de/igt/eiserm/publications/poincare.pdf)
· [Parallel-annulus split test](../02_handle_isolation_and_marked_surgery/notes/FOUR_POINT_SUPPORT_AND_CLOSING.md#complete-support-and-sharp-geometric-minima)

For the support test at a given stationary lift, forget all
other stationary lifts. A seam capping now ties the other
chambers' moving pieces locally into the moving component in
the retained chamber. A tying sphere meets the moving core
twice and misses the retained stationary component. An
intersection circle essential on this twice-punctured sphere
links the moving component once, so cannot lie on a splitting
sphere. Remove inessential circles by surgery along
puncture-free innermost caps, keeping a splitting sphere by
the same path-parity test. The resulting splitting sphere
misses the tying ball, since the stationary component and
some moving points both lie outside it. Untying would therefore
have split the unmodified local pair. Thus none of the
nonsplitting tests is lost by the other insertions. At every
other index a ball about the stationary copy or an intervening
seam misses the observed lift and separates it.

| Stage on its specified unfilled inlet | Nonsplit support | Minimum transverse intersection |
| --- | --- | ---: |
| Both Whitehead insertions | \(\{-1,0,+1\}\) | \(4\) |
| Upper pattern replaced by the short cap and pushed through the seam | \(\{0,+1\}\) | \(2\) |
| Rail pattern also replaced, with the comparison rectangle pushed into the collar | \(\{+1\}\) | \(0\) |

The lower bound concerns every nonseparating sphere disjoint
from the stationary core. Such a sphere represents a
primitive class. Its cut re-stacks into the same cyclic cover,
with the indexing of stationary copies changed only by a
translation or reflection. If the moving lift misses a
chamber with an occupied index, an intervening lift of the
sphere separates that pair in the compactification. A closed
lift visiting the extreme occupied chambers must cross every
intervening lift at least twice. Since the lift maps by degree
one to the moving circle, those intersections count in the
base. The original seam attains four. After the upper
replacement, the capping chord joins the two \(34\) ends of
the rails; pushing this junction into chamber zero leaves
only the two \(12\) seam points. Removing the rail pattern
permits the swept interval to push the remaining detour to
the lower mouth, giving the local Figure 5 diagram with zero
seam intersections. These are successive marked presentations
whose comparison isotopies use the stationary-filled level.
The differing support sets distinguish the presentations in
the unfilled inlet.

## Testing disks that leave the local pattern

The local Whitehead construction has a spanning disk in the
ordinary two-component pattern picture meeting the companion
unknot twice with opposite signs. In the complementary solid
torus this is a twice-punctured disk, with both extra boundary
circles longitudes in the specified zero-framing chart.
Two adjacent meridian disks of the stationary filling cap
them using the zero-parallel annuli. The orientations of the
two intersections with the filling core are opposite.
Extending by the prescribed thin access rectangle gives
the upper face bridge and the rail replacement disk within
the original filled slab. The latter is a disk for the
specified infected subarc and its short comparison interval.
It gives a face bridge after the upper move forms the
two-point successor. Thurston's Figure 2 and adjoining
classification of the two-punctured spanning disk were
checked on the published page images.
[Thurston, *A Norm for the Homology of 3-Manifolds*, §2, Example 1, pp. 108–109](https://people.math.harvard.edu/~ctm/home/text/others/thurston/norm/norm.pdf#page=5)

For the upper original return or the rail return of the
successor, consider any disk for that return, including ones
leaving all pattern neighborhoods or choosing another face
chord. Restore the moving tubes, clip or restore the radial
strip as appropriate, and cap the spherical faces. In
\(M=S^3_0(Q)\) any two chords are homotopic in the capped
face relative to the selected endpoints, through a homotopy
disjoint from the stationary core. Glue the candidate disk,
this boundary homotopy and the oppositely oriented displayed
disk to obtain a sphere map. The same comparison uses a
constant boundary homotopy for the specified original rail
replacement loop. The fiber \(F\) of \(M\to S^1\) has genus
two. The fibration exact sequence gives \(\pi_2(M)=0\),
so the sphere map has zero homological intersection with the
stationary filling core. Every such disk has the displayed
signed count zero, including disks outside the local pattern.
The local return's longitude-class calculation gives another
check when read in the unfilled capped square-knot exterior
with the fixed outer word. The sphere-map argument makes no
fixed-chord assumption.

Zero geometric punctures would put the compact disk outside
a small tube of the filling core. Absorb the difference
between the two solid-torus boundaries as a collar and restore
the original stationary meridian filling. Capping the slab
faces then gives an embedded spanning disk for the Whitehead
double of the square-knot parallel in \(S^3\). In checking the
knot type one may forget the other endpoint holes. The
chosen face chord is then isotopic to the short chord in
the face relative to the two endpoints, so the completion
has the same knot type. This double is nontrivial. The
companion torus injects on the pattern side by geometric
wrapping and on the other side by nontriviality of the
companion, as above. Van Kampen and amalgam normal form
inject its \(\mathbb Z^2\) into the satellite group, which
therefore is not the group of an unknot. Zero punctures
are impossible, and signed zero excludes one puncture.
The displayed two punctures attain the bound.
[GST, §6, closed genus-two fiber](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf#page=19)
· [Eisermann, Example 22, geometric wrapping of the Whitehead pattern](https://pnp.mathematik.uni-stuttgart.de/igt/eiserm/publications/poincare.pdf)

The upper filled face separator is obtained by thickening
the upper bridge. In the double-insertion presentation
an essential nonperipheral *unfilled* face disk on either
face would cut the four-punctured seam along a \(2+2\)
partition. Compressing the seam on this disk would produce
two twice-intersecting spheres whose oriented sum is the
old nonzero seam class. At least one would be nonseparating,
contradicting the sharp minimum four. Thus a marked
essential filled face disk there must meet the stationary
core. Capping its face boundary by a disk in the attached
ball gives a sphere class in \(M\), so its signed core
count is also zero. Consequently such a face disk has at
least two geometric punctures. A thin frontier of the
displayed bridge thickening has two parallel copies of
the twice-punctured patch, giving four punctures. The
bridge bound does not establish that this separating
frontier is optimal.
