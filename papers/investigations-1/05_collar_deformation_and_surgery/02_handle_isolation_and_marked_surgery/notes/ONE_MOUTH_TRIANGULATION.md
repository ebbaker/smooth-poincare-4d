# Marked triangulation for the one-mouth mixed return

26 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. Fixed execution packet SUR-E02ag. The issue
selected a bounded GPT-6.2 Sol/ultra worker. Actual serving model and
reasoning effort are unavailable. Intake HEAD 226b8f404b6e, with issue
SHA-256 prefix d97cf414e6fc before the diagram follow-up and 22757603371c
with the added SUR-E02aj. [Frozen one-mouth input](../../research-progress/handoffs/ONE_MOUTH_MIXED_20261126.md)

The actual Figure 5 specimen has the lower face compression along
\(\partial D_{12}\), no lower bridge for any chord or wall winding, and an
upper bridge on the shallow cap. The group certificates below refer to the
specified GST link. The executable tetrahedral certificate in this packet
uses the authorized second mixed model with the stationary and capped
return components a split zero-framed unlink. For that model both marked
short chords have bridges at winding zero.

## Diagram-relative construction for GST Figure 5

Work with compact oriented three-dimensional PL pairs and round their
locally flat marked surfaces and arcs to recover the smooth fixture. All
surgeries use zero longitudes in the native oriented link. The usual
left-panel overpasses specify a lift of the actual diagram. In particular,
the band in the middle panel must stay outside the input. [Gompf–Scharlemann–Thompson, Figure 5 and Proposition 2.2, pp. 2310–2311](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-p.pdf#page=6)

A finite tetrahedral recipe relative to the published link diagram is as
follows. A rational polygonal tracing means a planar graph with cyclic
order of edges at each crossing, a pairing into opposite branches,
component labels, and the over-branch, in the embedding realized by the
left panel. An ordered crossing word without the over-branches and planar
embedding is insufficient input.

1. Isolate each crossing in a disjoint rational square, and the intervals
   between crossings in disjoint strips. In each square place the two
   linear branches at heights \(+1,-1\), respectively over and under. Use
   affine ramps to height zero on the adjoining strips, with breaks where
   they enter the crossing squares. Away from the squares the two
   projected strands have disjoint interiors. Complete the resulting
   rational arcs to closed polygons with the indicated planar join
   at every crossing. By the crossing-square and strip isotopies, the
   lifted link has the given diagram. Pick a noncrossing segment of \(U\)
   and a small rational rectangular box \(C\) in a transverse coordinate
   chart about it. Take \(C\) disjoint from \(Q\) with precisely one
   straight \(U\)-arc in it. The exterior of \(\operatorname{int}C\)
   in the capped ambient box is the required complementary ball.
2. Put the rational polyhedra into a finite complex. In a larger convex
   rational box, use the planes supporting the faces of \(C\), the
   coordinate planes of the crossing squares, and two independent
   planes through the support line plus a transverse endpoint plane at
   each vertex of each lifted segment. The bounded regions and all
   their faces form a rational polytopal complex in which the segments
   of the link and \(\partial C\) are subcomplexes. Triangulate the
   complex by coning in increasing dimension from the barycenters of
   its faces, and cone the outer boundary from a new vertex to form
   \(S^3\). Drill by closed PL regular neighborhoods in a derived
   subdivision, relative to the ball boundary, after subdividing until
   \(Q\) and the return have disjoint neighborhoods meeting \(\partial C\)
   in exactly the two prescribed return end disks. This is a choice of
   marked tubular neighborhoods. A transverse meridian circle and a
   section of the normal interval product at the cut segment specify the
   collars of the tube ends.
3. On \(\partial C\) take \(D\) a disk neighborhood of the two end disks
   joined by the short chord coming from the straight \(C\)-arc. Its
   complementary disk is the separator. Refine the triangulation to
   contain this boundary circle, the chord, and both disks of the
   partition. Map \(D\) to the lower mouth patch in the slab and the
   complementary disk to the geometric separator in the slab. One can
   realize the piecewise-linear boundary gluing by triangulating common
   refinements of the marked boundary disks and of their collars. Replace
   the lower box used in the executable control by this marked
   complementary ball. The upper cap and through rectangle may be taken
   exactly as in the control below. This arranges the required common
   two-patch picture on the end spheres. The seam identification sends
   each labeled cuff to its same labeled cuff. The gluing is in the
   marked product charts and preserves the normal section in the
   short-arc comparison.
4. Record an edge representative of \(\mu_Q\) on \(T_Q\) as a cross
   sectional tube boundary and \(\lambda_Q\) as a push-off of \(Q\)
   corrected by minus its self-linking number times \(\mu_Q\). The
   correction is integral, and a diagram computes the self-linking of
   a blackboard push-off as the signed self-writhe of that component.
   Realize the corrected longitude by a simple PL curve meeting
   \(\mu_Q\) once using tube coordinates. Glue a triangulated solid torus
   with filling meridian carried to this curve and its complementary
   longitude carried to the marked meridian, with the orientation
   signs required by the boundary gluing. For example, use a
   triangulated disk times a subdivided circle, cut each boundary torus
   along its marked pair to a fundamental polygon, overlay the two PL
   subdivisions in common polygon coordinates, and triangulate the
   induced subdivisions in collars before joining. The original
   unfilled tests keep \(T_Q\) and \(\lambda_Q\) marked without this
   gluing. Choose the lower return's zero section by the same
   self-linking correction on the original capped \(U\). The upper
   zero section follows the explicit planar shallow cap.
5. Given the triangulation with the curves marked as edge paths, an
   edge presentation of the stationary-filled group takes a maximal
   edge tree, one generator per oriented edge off the tree with
   reversal as inversion, and one relator per triangle. Thus an edge
   loop on the lower or upper face and its wall reads in the exact
   drilled-and-filled group. In the unfilled mesh one obtains the same
   group by adjoining the relator \(\lambda_Q\). A separate direct
   verification of any candidate compression or bridge disk can use
   triangulated proper disk subcomplexes after subdivision, or a finite
   normal-surface test with the loop as boundary pattern. The marked
   disk test and the reduction of selectable chords to a face
   compression are given in the [four-point decision](FOUR_PORT_FACE_DECISION.md).

This gives a finite construction from digitized crossing data. It fixes
the PL operations, link and tube markings needed for replay. The Figure 5
left panel and its framed move were inspected in the published PDF. An
exact polygon input and its induced GST tetrahedron and edge lists were
unavailable in this execution. Neither the GST mesh nor a marked normal
surface search on it was run. Direct PDF download failed at DNS and the
runtime had no Regina, SnapPy or Spherogram installation. The control
replay below uses only Python's standard library.

## Actual GST face and word tests

In the GST model the lower separator \(E\) is the complementary disk
from step 3, and its slope is \(s=\partial D_{12}\) in the four-holed
lower face. It is present both before and after stationary filling. The
return component cut off by \(E\) is the \(U\)-exterior in \(S^3_0(Q)\).
The short chord and the zero section give the preferred longitude
\(\lambda_U\) in this exterior. The word for winding \(m\) is
\(\lambda_U\mu_U^m\), up to conjugacy and the choice of orientation.
The longitude has zero absolute homology, and the return meridian is
primitive. Thus the homology calculation leaves only \(m=0\).

For an arbitrary selectable lower chord \(a\), cap the two pairs of pants
of the face along the disk \(E\) and project the resulting disk free
product onto the lower return-side factor. Let \(j(a)\) be the exponent
of \(\mu_U\) in the projection of the detour relative to the short chord.
The projected lower word is \(\lambda_U\mu_U^{m+j(a)}\). The peripheral
torus injects into the return-side group. A compressing slope would have
to be the homological longitude. Compressing on that slope and then
comparing the two actual fillings at distance one would give
\(S^3_{0,0}(Q\cup U)\cong(S^1\times S^2)\# S^3_0(Q)\), contrary to the
Figure 5 joint surgery and nontriviality of the square knot by prime
uniqueness and Property R. A separate calculation detects the same lower
words in \(A_4\) using the closed genus-two fiber of \(S^3_0(Q)\); its
meridional filling map is applied as a quotient of the actual drilled
group. Hence no selected lower chord or winding gives a null word.
[Return-side word and finite quotient](ONE_MOUTH_RETURN_WORD.md)
· [Peripheral injection and uniqueness of \(s\)](ONE_MOUTH_FACE_DISKS.md)

The upper face has the corresponding slope bounding the patch \(D_{34}\)
and its shallow return ball has drilled exterior a solid torus. The
truncated short chord and planar wall section bound the clipped cap,
disjoint from the lower ball and the rails. Thus the upper winding-zero
word is trivial, and nonzero windings survive the upper meridian
coordinate. This gives an admissible selectable upper chord also. The
same pair-of-pants and free-product argument forces its separator class
for any other admissible chord, since the upper return and through
meridians have infinite order in their separate factors. In that
pair of pants the return chord is unique with its endpoints free on
their own cuffs, and a change of end tracks shifts the winding label.
The concrete cap is used in the [marked trace](ONE_MOUTH_TRACE.md).

## Executable second mixed model

The generating mesh is the [standard-library script](../numerics/one_mouth_control.py).
From the surgery investigation directory run

```sh
python3 numerics/one_mouth_control.py --mesh /tmp/one_mouth_control_mesh.json
```

Use the two-sphere \(\partial([0,16]^2\times[0,1])\) with spatial
coordinates \((x,y,u)\), and the slab parameter \(t\in[0,12]\).
The front patch is \(u=0\). Both face spheres have identical cuffs at
the squares of side two centered respectively at
\((3,3),(11,3),(3,11),(11,11)\) in \((x,y)\). The seam map is identity on
the three spatial coordinates. The lower return and upper return
are thickened orthogonal U-shaped strips of half-width one on the front
patch. Their projected sides run from the paired holes to \(t=2\) and
\(t=10\), respectively. Two rails at \(x=3,11\) start at \(y=11,t=0\),
pass through \(y=11,t=6\) and \(y=3,t=6\), then end at \(y=3,t=12\).
Their corners and the rectangular band between them can be rounded
into the untwisted sweep of the issue. The mouth boxes are
\([1,13]\times[1,7]\times[0,4]\) and
\([1,13]\times[9,13]\times[8,12]\) in \((x,y,t)\). Their off-face
boundaries are proper disks whose edge boundaries give the checked
face slopes. In each marked face the program cuts the triangle adjacency
across that slope, checks two pairs of pants, and reads off the cuff
partition 12 | 34.

In the stationary cube
\([6,7]\times[5,6]\times[2,3]\) of the lower mouth take a small planar
unknot disjoint from the return. Its zero surgery in this ball gives
punctured \(S^2\times S^1\): the \(S^3\) exterior of the unknot and the
filling solid torus glue meridian to meridian, yielding
\(S^2\times S^1\). Removing the outside ball retains the prescribed
stationary cube boundary. In the code the filling piece uses the
boundary of a unit cube for \(S^2\), four edges for \(S^1\), and omits
one product cube before gluing by a vertex identification on the
six faces. Cubes use the six staircase tetrahedra, with the circle
edge from vertex 3 to vertex 0 reversed to agree with the chosen
global vertex order. This implements the stationary zero filling in
the control. It uses the split stationary component to identify the
filled piece directly.

The explicit clipped bridge disks are the rectangles
\[
\begin{split}
 [4,10]\times\{3\}\times[0,1],\qquad
 [4,10]\times\{11\}\times[11,12]
\end{split}
\]
in front-patch \((x,y,t)\) coordinates. Their face edges and their
complementary three wall edges are the prescribed chords and sections.
The program checks the exact match between these edge paths and the
disk boundary. It checks face and wall incidences, the labels of all
eight cuffs, the seam identification of cuff paths by their spatial
coordinates, connectedness and orientability of the tetrahedra, and
the disk or sphere link at every vertex. The marked face surfaces
are spheres with four holes and the wall surfaces are annuli.
The marked separators and the clipped bridges are proper disk
subcomplexes. Cutting on the two separators has three connected
tetrahedron regions as specified by the mouth boxes and their
complement.

For nonzero windings the program constructs integral edge cocycles
that are dual to the lower meridian, upper meridian, through
meridian and stationary meridian. The first two use intersection
with rationally shifted proper rectangles. The third uses a
piecewise rectangular cross-section between the two rails, with levels
\(y=11+1/4,\ t=6+1/3,\ y=3+1/4\). The fourth evaluates on the
oriented circle edge \(2\to3\) of the stationary piece, and is zero
on the puncture boundary. The script verifies every triangular
cocycle equation with exact integers and evaluates the four
coordinates on the named meridians as the identity matrix. Thus
the winding-zero words are trivial by their checked disks. A wall
winding \(m\) gives evaluation \(m\) in the corresponding return
coordinate, so the prescribed word is nontrivial for every
\(m\ne0\). End turns in a chord shift its reference winding.

In particular, the lower selected separator in the control cuts off a
solid torus summed in its interior with \(S^2\times S^1\), and the
cocycles on its lower and stationary meridians certify that this region
is not a solid torus. The lower bridge rectangle is still present.
A smaller regular neighborhood of that disk and the once-holed torus
at the wall instead produces a separator cutting off a solid torus.
This checks why the type of the component cut off by one chosen
separator alone is insufficient for a bridge decision. In the
actual GST case the stronger conclusion follows from the incompressible
marked return torus and the word calculation above. For both faces in
the control, a bridge gives a freely selectable chord; as in the
actual upper face, the one-circle wave calculation restricts every
admissible chord to the single free-end class on its respective
return pair of pants.

The [execution record](../numerics/one_mouth_control_result.json)
was produced by Python 3.10.0 on Darwin arm64. It gives the canonical
mesh hash, 7,470 vertices, 40,068 tetrahedra, and the marked counts
and evaluations. The mesh export is generated on demand from the compact
inputs. Its sorted vertex IDs index tetrahedra with region and relative
orientation sign, all marked surface triangles and separator
boundaries, and all marked paths.

## A failed prescribed chord and its replacement on the same mesh

SUR-E02al, same date and execution environment. Keep the upper tube, wall
section, face point marking and stationary filling unchanged. On the upper
front patch use the rectangular twist circle
\(d=\partial([1,5]\times[1,13])\) in \((x,y)\) coordinates. It encloses
port 1, a through cuff, and port 3, a return cuff. Replace the original
upper chord from \((4,11)\) to \((10,11)\) by the following embedded
edge path, with each displayed interval subdivided at its integer points:
\[
 (4,11),(5,11),(5,13),(1,13),(1,1),(5,1),(5,10),
 (6,10),(6,11),(10,11).
\]
The original chord crosses \(d\) once at \((5,11)\). The detour follows
\(d\) from this crossing and offsets the final edge of \(d\) around one
triangle pair in the unit square \([5,6]\times[10,11]\). Sliding across
that square gives the usual based insertion of \(d\) at the crossing,
with the sign chosen by its indicated traversal. An offset in a thin
annular collar gives the same embedded once-twisted arc, relative to
the cuff endpoints.

The [follow-up script](../numerics/one_mouth_twist.py) verifies the
same triangulation, all edge incidences and end data for the twisted
path, the partition of the upper face along \(d\) into the two pairs
of pants \(13\mid24\), and the equality of the oriented difference of
the two chords with \(d\) plus the boundary of those two triangles.
Closing the twisted chord by the original wall section evaluates
to \((0,1,1,0)\) in the fixed cocycle coordinates. Adding \(m\) upper
wall windings changes only its second coordinate, so the third
coordinate is 1 for every integral \(m\). Thus **the prescribed twisted
chord has no bridge with any wall winding** on this mesh.
With chords freely selectable, the original chord is a replacement
on the same face with the same ends. Its original wall section gives
the verified proper disk of 12 triangles. The result follows from
that disk, in addition to the zero cocycle vector of its boundary.

Run `python3 -B numerics/one_mouth_twist.py` from the surgery
investigation directory to reproduce the
[follow-up execution record](../numerics/one_mouth_twist_result.json).
The record gives the same mesh hash and all prescribed and replacement
path results.
