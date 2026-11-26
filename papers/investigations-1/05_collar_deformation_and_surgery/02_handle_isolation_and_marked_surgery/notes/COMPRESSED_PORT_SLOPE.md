# The slope and geometric effect of a compressed port

26 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. Fixed execution packet SUR-E02w, under CDS-B03 /
SUR-B04, [issued question](../../research-progress/handoffs/TWO_PORT_FREE_OUTLET_TEST_20261126.md).
The issue selects a GPT-6.2 Sol/ultra bounded helper. Independent serving
model and effort telemetry are unavailable. Scientific intake Git
`4da586548b445ccfe9145c6a5671c0f7ecd433f3`. This is a smooth, oriented
calculation for the actual marked integral pair with inlet $Y_1$ and
outlet $Y_3$, where $Y_i=\#_i(S^1\times S^2)$. The supplied product
sphere avoids $Q$ and meets the oriented moving knot twice with opposite
signs. Each cut face carries one returning arc.

## Capped exterior and zero framings

Write $W=S^2\times I$ for the cut slab. Use the given seam map to pick
matched copies $c_-,c_+$ of an embedded chord between the two seam
points. Shrink the marked tube radii and choose product germs at the cut
points by isotopy. Complete the two returning arcs in the distinct capping balls by
inward copies of those chords. Call the oriented completions $J,V$, with
orientations on the two returns inherited from the moving knot $K$.
Capping $W$ this way gives $S^3$. The exterior $E$ of $(Q,J,V)$
is the doubly drilled unfilled slab with collars on its port tori. In fact,
each cap drilled along its boundary-parallel arc is
$S^1\times[\epsilon,1]\times I$ in a straight cap-arc chart. Its
annulus of attachment is $S^1$ times the three outer sides of the
rectangle, after rounding. As a pair this adds a collar along the
punctured face annulus. The circle factor in the chart is the meridian of
the proper arc, so the cap collar preserves its meridian slope. Write
$\mu_i,\lambda_i$ for the positive meridian and oriented preferred
longitude of component $i$ in the capped $S^3$. We use those classes on
the drilled slab by this collar identification.

The free endpoints give both zero framings and zero total linking. Indeed,
the signed intersections with the product sphere vanish for both original
cores, hence they are null-homologous in $Y_1$. In their unfilled
exterior in $Y_1$, the long exact sequence of the pair and excision give
an extension of $H_1(Y_1)=\mathbb Z$ by the two free meridians. The map
from $H_2(Y_1)$ to the relative meridian-disk group vanishes by the same
intersection calculation. The surgery slope classes are the two columns
of the integral linking and framing matrix in that meridian summand.
Filling gives the quotient of the exterior's $H_1\cong\mathbb Z^3$ by
those two classes. Since the outlet also has first Betti number three,
both classes vanish. The zero framing of $Q$ in $Y_1$ is also its
preferred longitude in the capped $S^3$. To see this, take an oriented
Seifert surface for $Q$ in the interior of $W$, where $H_1=0$.
It computes the same push-off and the same linking whether the two
faces are capped or rejoined. In particular, with
\[
a=\operatorname{lk}(Q,J),\qquad b=\operatorname{lk}(Q,V),\qquad
c=\operatorname{lk}(J,V),
\]
its intersections with the two oriented returns compute
$a+b=\operatorname{lk}_{Y_1}(Q,K)=0$. The caps miss the surface.

## Compressing slope

In the meridian basis the three longitude classes in $H_1(E;\mathbb Z)$
are
\[
[\lambda_Q]=a\mu_J+b\mu_V,\qquad
[\lambda_J]=a\mu_Q+c\mu_V,\qquad
[\lambda_V]=b\mu_Q+c\mu_J.
\]
The actual stationary filling attaches a solid torus with meridian
$\lambda_Q$. Thus the two-port exterior $X$ has
\[
H_1(X;\mathbb Z)
=\frac{\mathbb Z\langle \mu_Q,\mu_J,\mu_V\rangle}
{\langle a\mu_J+b\mu_V\rangle}.
\]
Use the integral quotient, including its possible torsion. Suppose a
compressing disk has boundary on $T_J$ with primitive slope
$p\mu_J+q\lambda_J$. Its boundary vanishes in $H_1(X;\mathbb Z)$, so
for some $k\in\mathbb Z$,
\[
       (qa,p,qc)=(0,ka,kb).
\]
If $q=0$, primitivity gives $p=\pm1$, which would require
$ka=\pm1$ and $kb=0$. Since $a+b=0$, this is impossible. Hence
$q\ne0$, the first equation gives $a=0$, and then $b=0$, $p=0$
and $c=0$. Primitivity gives $q=\pm1$. Interchanging the ports gives
the same result. A compression on either port therefore forces all three
linking numbers to vanish, and its unoriented boundary slope is precisely
that port's preferred longitude. Homology alone gives a necessary slope.
Existence of a compressing disk uses the separate gluing calculation in
SUR-E02v.

## From the compressed slope to a localized framed pair

Assume $T_J$ has a compressing disk. In the cut slab its torus is the
union of the lateral annulus of the return tube and the annulus in the
punctured face. Truncate $c_-$ at the two end disks. On the lateral
annulus choose a section of the normal circle bundle of the return with
endpoints at the two truncated chord endpoints. The section joined to the
truncated chord gives a simple oriented meridian-dual loop. Changing the
section's relative winding by one adds a meridian to its class. Thus a
unique winding gives the preferred longitude after choosing the orientation
of the loop along the return. This allows the chord and the end germs to
be fixed first. The integer framing of the original closed attaching tube
is carried through the moves below. The winding used for the disk is a
choice of incident strip on the proper return.

Essential simple circles of the same slope on a torus are isotopic.
Extend the boundary isotopy over a small port collar so the compressing
disk has the chosen loop as its boundary. Restore the radial strip from
the chosen section to the core of the return and the two clipped chord
segments. Rounding gives a smooth bridge disk in the stationary-filled
slab with boundary the actual return and $c_-$, with interior off both
faces and away from the opposite return. The construction also clips in
reverse. [Marked strip and clipping](BRIDGE_DISK_FROM_THE_FILLED_EXTERIOR.md#the-peripheral-loop-and-its-framing)

Make this disk transverse to the stationary filling core $Q^*$. In a
sufficiently small tube of $Q^*$, the disk meets the tube in meridian
disks after straightening the finitely many transverse intersections.
The product torus collar between that tube and the stationary filling
boundary identifies the deleted disks with holes of slope $\lambda_Q$
in the unfilled stationary exterior. Use disjoint arcs from distinct
points of the return edge of this planar surface to the holes. They exist
one at a time, since a slit joining distinct boundary components keeps
the surface connected. Thicken the arcs to bands, choosing the framed
parallels of $Q$ along the puncture circles. Slitting makes a disk with
boundary the new return and the same chord. Each slit is an ordinary
signed framed slide of $K$ over $Q$, as the inner circle is the actual
filling slope. In the filled chart it caps by a meridian disk, with
parallel caps giving the framed move. The remaining disk pushes the
new return to a small inward parallel of the chord. All bands and the
disk push miss the opposite return, and the bands lie off the cut faces.
[Core punctures and relative framing](BRIDGE_DISK_FROM_THE_FILLED_EXTERIOR.md#converting-core-punctures-to-framed-slides) ·
[Gompf–Scharlemann–Thompson, §2 and Proposition 3.2](https://arxiv.org/pdf/1103.1601)

After rejoining the faces, move the short inward chord parallel and its
two crossings entirely into a collar on the $V$ side. In a product
chart for the seam this is the elementary push of a chord with two short
end germs across the seam and past the two transverse seam points. The
chart can be chosen to miss $Q$ and the rest of $V$. The resulting
closed $K'$ in the slit interior is the $V$ completion with the same
chord, relative to $Q$ in the capped slab. The same argument applies with
the labels exchanged. To exhibit a common ball, choose a point of $S^2$
off the smooth projections of the two compact cores of $Q,K'$ and then
a small disk about that point disjoint from their projections. Choose
$\delta>0$ so the cores lie between heights $\delta$ and $1-\delta$.
The complementary closed disk in $S^2$ times a slightly larger closed
height interval contains both cores in its interior and rounds to a ball.
Shrink the parametrized tube radii if needed, carrying the framing by
isotopy. The complement of this product ball in the capped slab is the
two capped end regions joined by the complementary disk's product
corridor, hence a ball. In particular the stationary component keeps its
capped knot type in the local link, and the local framing coefficients
use the actual transported tubes.

Let $L=(Q,K')$ in the sphere made by capping the common ball. The
slides and isotopies preserve the smooth trace relative to the inlet.
Surgery inside the ball identifies the outlet with $Y_1\# S^3_L$, so
prime decomposition gives $S^3_L\cong Y_2$. Its integral surgery
matrix has cokernel of rank two, so the coefficients and local mutual
linking vanish. If either actual local component is a generalized square
knot, the auxiliary local trace on $D^4$ closes against the rank-two
upper body to a homotopy sphere with no index-one handles and two
index-two handles. Meier–Zupan Theorem 1.1 gives the standard sphere, and
the marked local filling comparison gives a replacement by the split
zero-framed pair relative to the lower and lateral interface. Carry later
tubes by the outlet map and precompose the closing with its inverse. With
the initial split attachment and an immediate marked rank-three upper
closing, the returned split pair and the initial split handle cancel
against the upper handles after the boundary extension. The local
replacement itself preserves the number of index-two handles and needs
no extra pairs. [Milnor, Theorem 1](https://doi.org/10.2307/2372800) ·
[Meier–Zupan, Theorem 1.1, p. 70](https://par.nsf.gov/servlets/purl/10464744#page=2) ·
[Marked local comparison and closing](../../reviews/LOCAL_FILLING_READER.md)

## Two compressions force the stationary knot to be trivial

If both boundary tori compress, move each disk boundary to its chord
representative. The disks can be made disjoint. Their boundaries lie on
different tori, so transverse intersections consist only of circles.
Replace a subdisk of the second disk by a pushed-off innermost disk of
the first and iterate. Each step preserves the second boundary and removes
at least one intersection circle. Restore the two radial strips in their
separate return tubes. Make the disjoint bridge disks transverse to $Q^*$
simultaneously so their core intersections have distinct parameters. The
same puncture and slit construction now uses disjoint disks, disjoint bands
and distinct framed parallels at the cap parameters. The two sets of moves
may thus be performed in sequence, with the second return still admitting
its bridge disk in the stationary-filled slab after the first set.

Both returns now lie in narrow collars of the matched chord. When the
faces are joined, their union bounds the rounded product strip across
that chord in a seam neighborhood missing $Q$. It is a split local
unknot. The returned framing on it is zero by the free-end homology
calculation, or by applying the local surgery matrix calculation to a
ball containing the two components. A ball for $Q$ away from the seam
and a small ball for the chord strip exhibit the splitting. The outlet
is consequently $Y_2\# S^3_0(Q)$. Uniqueness of prime decomposition
and the actual outlet $Y_3$ give $S^3_0(Q)\cong Y_1$. Gabai's
Property R applied to this zero surgery on the capped knot in $S^3$
makes $Q$ the unknot. Thus a nontrivial stationary knot allows at most
one compressed port. Together with the separate free-outlet gluing test
this gives exactly one port in the nontrivial case. [Milnor, Theorem 1](https://doi.org/10.2307/2372800) ·
[Gabai, Corollary 8.3 and Remark 8.5, reproduction of the published text](https://www.scribd.com/document/1026013102/2-Gabai)

The construction gives a finite set of actual bands, with the number
depending on the disk and its core intersections. Its hypotheses include
the supplied two-point sphere and actual integral free endpoints. The
generalized-square-knot step requires the knot-type hypothesis on the
returned local link. The proof supplies a smooth marked replacement under
that hypothesis, with the geometric cancellation test applied at the
actual closing. A prescribed radial band or a fixed slide count requires
further information about the bridge disk. A slide-to-unlink result for an
arbitrary capped pair requires its own recognition argument.

## Input record

| Input | SHA-256 prefix |
| --- | --- |
| [SUR-E02w issue](../../research-progress/handoffs/TWO_PORT_FREE_OUTLET_TEST_20261126.md) | `6b0696d312a7` |
| [Selected knot-completion issue](../../research-progress/handoffs/KNOTTED_COMPLETION_ISSUE_20261126.md) | `c8368156e307` |
| [Prior bridge calculation](BRIDGE_DISK_FROM_THE_FILLED_EXTERIOR.md) | `f0d6012c61af` |
| [Prior localized filling check](../../reviews/LOCAL_FILLING_READER.md) | `fdc9fa3634aa` |

The published Meier–Zupan Theorem 1.1, the GST framed-band-sum passage and
the reproduction of Gabai's Corollary 8.3 and Remark 8.5 were rechecked.
The Milnor use follows the previously checked passage in the
[repository source map](../../references/README.md).
