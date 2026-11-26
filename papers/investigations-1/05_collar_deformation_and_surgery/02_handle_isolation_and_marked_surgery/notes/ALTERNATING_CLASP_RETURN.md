# The Whitehead return in the alternating four-port diagram

26 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. Bounded execution SUR-E02ap in the
[four-return issue](../../research-progress/handoffs/CAPPED_FACTORS_AND_FOUR_RETURNS_20261126.md),
SHA-256 prefix `6c0be03d8237`, intake HEAD `9c80575988ad`. The issue selects
GPT-6.2 Sol/ultra. Independent serving-model and effort telemetry are
unavailable. All links, isotopies, disks and tube charts are smooth and
oriented. Fillings use the actual integral zero slopes.

The modified upper return has a bridge with precisely two stationary-core
punctures. The next bridge uses the lower ribbon without punctures and
recovers the local Figure 5 pair. Before either move the unfilled link is
genuinely nonlocal. In the compactified cyclic cover one moving lift forms
nonsplit sublinks with exactly two adjacent stationary lifts. The original
nonseparating-sphere intersection minimum is either two or four.

## The two bridge moves after stationary filling

Use slabs \(W_j\) between seams \(S_j\) and \(S_{j+1}\), with the lower
\(12,34\) returns in \(W_j\) and the upper \(23,41\) returns in the same
slab. Each \(Q_j\) is in the interior of \(W_j\). In the cover the
moving lift \(\widetilde K\) having lower returns in \(W_0\) has upper
returns in \(W_{-1}\). Write \(c_{23}\) and \(c_{41}\) for disjoint
native chords on their shared seam \(S_0\), oriented \(2\to3\) and
\(4\to1\). The lower ribbon rectangle \(R\) in \(W_0\) has boundary
the two lower returns and the two chords. Its long sides follow the
same nearly complete \(U_0\) in opposite directions. For the Whitehead
insertion take the carrier torus \(V_J\) to be a small tube of the
specified zero parallel \(L\) of \(Q\). Keep it and the access
rectangle disjoint from the lower ribbon, the actual upper \(U\)
parallel, and that parallel's short-gap rectangle. These are the
separate product supports in the fixture. Completing each upper
return with its native chord and moving the chord through its access
rectangle recovers the actual closed pattern \(J\) in \(V_J\) and the
zero parallel of the actual Figure 5 \(U\), jointly with \(Q\). The
radial annulus identifying \(L\) with \(Q\) can be taken disjoint from
the completed upper \(U\).

After stationary zero surgery let \(Q^*\) be the filling core. The
standard Whitehead link, with the complementary unknot drilled, gives
a pair of pants in the pattern carrier. Its outer boundary is the
Whitehead component and its two inner cuffs are parallel zero
longitudes of the carrier. In the standard diagram the spanning disk
of the flat component is pierced twice by the complementary unknot.
Drilling that unknot removes two meridian disks, whose boundaries
become zero longitudes on the carrier by the genus-one gluing of
\(S^3\). The two cuffs have opposite orientations. The untwisted
carrier identification preserves those longitudes. In the filled slab,
the radial annulus from \(L\) to \(\lambda_Q\), capped by a filling
meridian, gives a disk bounded by \(L\). Remove its radial subannulus
inside \(V_J\) and take two parallel copies of the resulting disk
outside \(V_J\), each crossing \(Q^*\) once. Their boundaries attach
to the two cuffs; rounding gives a disk for \(J\) punctured twice with
opposite signs. Open this disk at the short mouth and join the access
rectangle to obtain the bridge from the actual upper \(23\) return
to \(c_{23}\). The spanning surface and its caps avoid the other moving
arcs. [Thurston, *A Norm for the Homology of 3-Manifolds*, §2,
Example 1 and Figure 2, pp. 108–109](https://people.math.harvard.edu/~ctm/home/text/others/thurston/norm/norm.pdf)
· [Earlier carrier and mouth check](WHITEHEAD_RAIL_DISK.md)

Zero punctures would give a spanning disk in the capped unfilled
\(Q\)-exterior. Indeed a small tube of \(Q^*\) misses the putative
disk, and the remaining part of the filling torus is a collar on the
original torus boundary. Such a disk would split \(J\) from \(Q\).
This pair is nonsplit by the carrier argument below, applied to
\(V_J\) and \(Q\). One puncture would instead give an annulus
from \(J\) to the native \(\lambda_Q\), up to orientation. The class
of \(J\) is trivial in the carrier group since its winding is zero.
The class of \(\lambda_Q\) is nontrivial in the capped unfilled
square-knot exterior: the fiber is once punctured of genus two,
its group injects into the bundle group, and its boundary is the
nontrivial fiber boundary word. This excludes one puncture. The
bridge construction therefore realizes the minimum two for the
marked completion. The lower bound also applies to an admissible
embedded replacement face chord once its moving drills are restored:
the new chord and the native one are homotopic in the face sphere
relative to the two endpoints, and isotopic there when the other
ports are forgotten. The isotopy is supported in the cap collar away
from \(Q\), which is all the capped obstruction needs.
[GST, §6, pp. 2323–2325](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf#page=19)

Push the upper \(23\) arc along its punctured disk in the
stationary-filled level. First put it just above \(c_{23}\), then push
past the seam into the lower collar. The height of the interval in
the seam chart has one tangency that removes exactly the ports \(2,3\),
with the \(1,4\) germs fixed. The new lower return is the concatenation
of \(12\), the short pushed arc \(23\), and \(34\). A thin strip
from the short pushed arc to the original short edge of \(R\) extends
\(R\) to a bridge disk for this combined return against \(c_{41}\).
Use a product strip with no interior intersection with \(R\) and round
the shared edge. This second disk is already in the unfilled
\(Q\)-exterior of the returned diagram and misses the upper moving
tube. Push the combined return along this disk and across the seam.
The remaining ports \(1,4\) disappear at a second tangency. The short
new arc restores the \(U\) gap through its native rectangle. Thus the
intersection sequence on the seam is \(4,2,0\), with the actual local
joint Figure 5 placement as the final diagram after filling \(Q\).

## Detecting the two stationary lifts

Here is the carrier argument used in both chambers. Let a knot \(P\)
lie in a solid torus \(V\subset S^3\) and a knot \(A\) outside \(V\).
Suppose \(\partial V\) has no compressing disk in either side of
\(S^3\setminus(P\cup A)\) and the core of \(V\) is nonsplit from \(A\).
Then \(P\) is nonsplit from \(A\). To see this, minimize the number of
circles on a putative splitting sphere transverse to \(\partial V\).
If all circles were essential on \(\partial V\), an innermost circle
on the sphere would compress it. For an inessential circle choose a
disk innermost on \(\partial V\), and surger the sphere along the disk.
At least one new sphere still splits by mod-two intersection with a
path joining the two knots. This reduces the number of circles. A
sphere disjoint from \(\partial V\) would either lie inside \(V\) and
put \(P\) in a ball there, or lie outside and split the core of \(V\)
from \(A\). A knot in a ball in \(V\) admits a disjoint meridian
disk of \(V\) (shrink the ball inside a collar of itself and move it
off a fixed meridian). This excludes the inside possibility.

For \(V_J\) the inner torus is incompressible because
\(V_J\setminus\operatorname{int}\nu J\) is the Whitehead-link exterior,
whose cusp groups inject. The ideal octahedron construction gives
the complete hyperbolic link complement. The outer torus stays
incompressible even after forgetting the exterior knot: a disk in
the exterior of the nontrivial core \(L\) would have the zero-longitude
slope by homology and would give a spanning disk for \(L\) using a
radial annulus. The parallel pair \(L,Q\) is nonsplit. Otherwise a
splitting sphere would meet the annulus between them in a circle
essential in the annulus (use mod-two intersection of a spanning arc
of the annulus with the sphere), making \(Q\) unknotted. This verifies
the claim about \(J,Q\) used in the puncture lower bound.
[Thurston, *The Geometry and Topology of Three-Manifolds*, §3.3 and
the opening of Chapter 4](https://library.slmath.org/nonmsri/gt3m/PDF/Thurston-gt3m.pdf)

The other use of \(V_J\) is with the completed upper \(U\) as the
exterior knot. The pair \(L,U\) has the original GST placement by
the native gap comparisons and the radial annulus. In particular it
is nonsplit. One way to check this directly for the published pair
is that \(U\) is nontrivial in \(\pi_1(S^3_0(Q))\). The Figure 5
slide gives the actual joint zero outlet \(Y_2\). GST Corollary 6.4
therefore identifies \(U\), up to slides over \(Q\), with a curve on
the closed fiber projecting homeomorphically to an essential curve
of the quotient four-punctured sphere. Lemma 6.2(3) makes the lifted
curve nonseparating, hence nontrivial in the fiber group, which
injects into the mapping-torus group. Each allowed slide bands to a
zero longitude of \(Q\), trivial in that filling, so it preserves
the free homotopy class there. Splitting in the unfilled \(S^3\)
would make the class trivial already before filling. The carrier
argument now proves that the **two upper completions \(J\) and \(U\)**
are nonsplit after forgetting \(Q\).
[GST, Figure 5, p. 2310, Lemma 6.2(3), p. 2325, and Corollary 6.4,
p. 2327](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf#page=19)
· [Filled core calculation](ONE_MOUTH_RETURN_WORD.md)

### The stationary lift in the upper chamber

Compactify the ends of the cyclic cover to a three-sphere. In the
complement of \(Q_{-1}\) the lower ribbon relation is
\(R_{12}c_{23}R_{34}c_{41}=1\) for path composition in traversal
order. Hence the moving word based at port 1 is
\[
 [\widetilde K]=
 [R_{12}(R_{23}c_{23}^{-1})R_{12}^{-1}]
 [c_{41}^{-1}R_{41}].
\]
The upper \(23\) completion \(R_{23}c_{23}^{-1}\) is a conjugate of
\(J\) and is null-homotopic in the carrier of \(J\). The last factor
is the actual \(U\) completion up to base path and orientation and
survives even in the stationary zero filling. A splitting sphere for
\(\widetilde K,Q_{-1}\) would put \(\widetilde K\) in a ball in the
\(Q_{-1}\)-complement and kill its word. Thus this sublink is nonsplit.

### The stationary lift next to the lower ribbon

Let \(B\) be the closed half below \(S_0\), capped at the lower end
of the cover. Attach a thin three-dimensional 1-handle along the
lower ribbon \(R\), using the two short chord patches on \(S_0\)
for its feet. Push the two long sides slightly into its interior
and round the resulting boundary. The union \(V\) is a solid torus
containing \(\widetilde K\) and missing \(Q_0\). The core of \(V\) uses
the long center of the lower ribbon and a short connecting arc just
inside \(B\). The lower product access strips carry this short
connection back to the native short gap. Thus the core of \(V\),
relative to \(Q_0\), is the original Figure 5 unknot. The co-core
disk \(D_0\) of the added 1-handle meets the two moving rails once
each. Cutting \(V\) along \(D_0\) gives a ball with two returns,
each with both ends on its own copy of the disk. The product rails
and original short-gap rectangles identify the two closures on those
disks jointly with the upper \(J,U\) completions just tested.

Suppose a meridian disk \(D\) of \(V\) misses \(\widetilde K\).
Put its boundary parallel to and disjoint from \(\partial D_0\), and
minimize intersection circles with \(D_0\) among such disks. Any
circle cutting off a puncture-free disk of \(D_0\) can be eliminated:
choose an innermost such disk on \(D_0\), replace the subdisk of \(D\)
that it bounds, and push and smooth the replacement. If circles
remain, take an innermost one on \(D\) with disk \(E\). It cannot
enclose just one puncture of \(D_0\), since the union of \(E\) with
the corresponding subdisk would give a sphere with one transverse
intersection with the closed knot. If it encloses both punctures,
adjoin \(E\) to the outer annulus in \(D_0\) between the circle and
\(\partial D_0\). Round and push the annulus to the same side of
\(D_0\) as the germ of \(E\) along the circle. This gives a meridian
disk disjoint from both the knot and \(D_0\). Thus in every case
where a meridian disjoint from the knot exists, one exists disjoint
from \(D_0\).

In the cut ball such a disk separates the two exposed copies of
\(D_0\). Otherwise an arc connecting them and closing through the
1-handle would represent the generator of the solid torus and miss
its meridian. The disk then separates the two returns and their
caps on these copies. Capping the cut ball off and doubling the disk
with a disk in the added ball gives a splitting sphere for the upper
\(J,U\). Their proven nonsplitting excludes \(D\). Therefore
\(\partial V\) is incompressible on the \(\widetilde K\) side. On the
outside, \(S^3\setminus\operatorname{int}V\) is a solid torus since
\(V\) has unknotted core. A compression avoiding \(Q_0\) would cut
this exterior solid torus into a ball containing \(Q_0\), splitting
\(Q_0\) from the core of \(V\), contrary to the Figure 5 placement.
The carrier argument proves that \(\widetilde K,Q_0\) are nonsplit.

Every other \(Q_j\) can be separated by a sphere in the interior of
its slab enclosing the diagram ball and missing \(\widetilde K\).
Thus the set of nonsplit stationary translates is exactly
\(\{-1,0\}\). If the inlet pair lay in a common ball, that ball would
lift to disjoint balls and a chosen moving lift could be nonsplit
with at most one stationary lift. This proves nonlocality in the
original unfilled inlet. For any nonseparating sphere missing the
stationary tube, the cyclic stacking of its cut-open inlet puts
\(Q_{-1}\) and \(Q_0\) in adjacent regions. The moving lift must enter
both to avoid separation and cross their intervening sphere at least
twice. Its projection counts distinct intersections because the core
has winding zero and each lift maps one-to-one to it. The displayed
seam supplies four intersections and every candidate has even count
by zero winding. This leaves \(2\) or \(4\) for the minimum of the
initial pair. The two-point stage above is reached by a filled-level
isotopy through \(Q^*\), so it provides no two-point sphere for the
unchanged initial unfilled pair. [Cyclic-cover separation and lower
bound](LIFTED_LINKS_AND_SPHERES.md)

## Framings and the outlet

In the unfilled \(Q\)-exterior the moving cycle is homologous to the
sum of its two upper completions, by the lower ribbon relation with
the oriented short chords. The Whitehead completion has zero winding
in its carrier and the Figure 5 completion has mutual linking zero
with \(Q\). Both are contained in the slab. Thus the moving core
bounds an oriented Seifert surface in the unfilled \(Q\)-exterior.
Its zero surface framing remains zero after stationary filling,
where the same surface survives. Transport the parametrized normal
disks through both arc isotopies. The terminal local \(U\) also
bounds a Seifert surface in the \(Q\)-exterior, and its unfilled zero
framing likewise agrees with the zero framing in the filled level.
This verifies the zero coefficient at the returned diagram.

Attach \(Q\) first. The intermediate level is \(Y_1\# S^3_0(Q)\).
For a filled-level ambient isotopy \(I_t\) of the moving tube,
extend in its product trace collar by
\((z,s)\mapsto(I_{\eta(s)}z,s)\) with a cutoff constant at the ends.
Use the inverse with \(I_{\eta(s)}^{-1}\), and the identity in both
the lower trace and the transported moving handle coordinates. This
compares the trace relative to its inlet. Replay the actual Figure 5
slide on the local successor, taking the moving \(U\) first in that
local diagram to slide \(Q\) over it. The pair is then the split
zero-framed unlink in the slab ball. Its joint surgery replaces the
ball by punctured \(Y_2\), so the actual outlet of the initial pair
is \(Y_3\). [GST, §2 and Figure 5, pp. 2308–2311](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf#page=6)

For the composite outlet map \(d\), a residual later attaching chart
\(e\) becomes \(de\) with inverse \(e^{-1}d^{-1}\). Extend by the
identity in those handle coordinates at each later level. With final
transported map \(\widehat d\), the closing \(\gamma\) becomes
\(\gamma\widehat d^{-1}\) with inverse \(\widehat d\gamma^{-1}\).
At an immediate rank-three cap put \(\gamma_{\rm sp}=\gamma d^{-1}\).
The reverse attaching chart given by the original plug chart \(o\) and
coordinate switch \(\tau\) is
\(\gamma o\tau=\gamma_{\rm sp}(do)\tau\), with inverse
\(\tau^{-1}o^{-1}d^{-1}\gamma_{\rm sp}^{-1}\) on its image. For the
new split handles take the product spheres given by capping their
spanning disks with filling meridians. Choose a model closing
\(\lambda_3\) matching those spheres to distinct belts of the rank-three
cap read in reverse. Laudenbach–Poénaru extends
\(\lambda_3\gamma_{\rm sp}^{-1}\) over the upper body, with inverse
extension having boundary \(\gamma_{\rm sp}\lambda_3^{-1}\). The split
dual cores now cancel against their matched upper handles. The native
cuts after the first two cancellations are the actual split \(Y_2\)
and \(Y_1\), with the remaining tubes in their transported charts.
The final split zero attachment from \(D^4\) cancels by its single
dual intersection. The middle and upper counts go from three to zero
with no temporary births. With later residual tubes the calculation
gives the relative trace replacement and preserves the middle count
through that block. No metric is specified for this fixture.
[Laudenbach–Poénaru, proof of Theorem A, pp. 341–342](https://www.numdam.org/item/10.24033/bsmf.1741.pdf#page=6)
· [Milnor, Theorem 5.4, p. 52](https://webhomes.maths.ed.ac.uk/~v1ranick/surgery/hcobord.pdf#page=53)
· [Native collar and inverse charts](ONE_MOUTH_TRACE.md#arbitrary-immediate-closing-and-geometric-cancellations)
