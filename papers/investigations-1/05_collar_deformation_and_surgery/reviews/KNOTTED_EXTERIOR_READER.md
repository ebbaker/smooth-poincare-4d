# Independent reading of the knotted two-point cut

26 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. Bounded E check CDS-E02 / SUR-E02r,t,u. The issue
selects a GPT-6.2 Astra/ultra lead and GPT-6.2 Sol/ultra reader.
Independent serving model and effort telemetry are unavailable. Scientific
intake `4da586548b445ccfe9145c6a5671c0f7ecd433f3`. This check concerns
smooth oriented manifolds and the integral marked attachments at the
single issued cut. [Reading issue and revised pin](../research-progress/handoffs/TWO_PORT_INDEPENDENT_READINGS_20261126.md) ·
[Specified cut](../research-progress/handoffs/KNOTTED_COMPLETION_ISSUE_20261126.md)

The checks agree on the returned framed link \(L_{4,1}=(Q,V_4)\), exact
cyclic support \(\{0,1\}\), and the lower zero longitude as the sole
disk-bounding slope on its port after stationary filling. The minimum
geometric intersection of a transverse lower bridge disk with the
stationary filling core is one.

## Published link and observed band

I inspected published Figures 1, 13 and 19 and the surrounding text.
Figure 1 specifies the interleaving of \(Q\) and the two joined spiral
portions of \(V_4\). At \(n=4\) a four-strand cyclic spiral with its
additional full twist closes to \(T(4,5)\) and the other has mirror
handedness. The figure gives the position of the two components together.
Section 7 follows the diagram through Figures 11–13 to the blowdowns,
identifies the result with Figure 1 for \(k=1\), and gives the full surgery
boundary \(Y_2=\#_2(S^1\times S^2)\). Section 10 identifies Figure 19 with
the same \(L_{n,k}\) presentation after rotating the twist boxes, before
specializing the subsequent calculation to \(n=0\). Thus at \(n=4,k=1\)
the bracketed \(+1,-1\) circles specify the ambient surgeries. The two
unbracketed components give the attaching link, both with zero integer
coefficients and mutual linking zero by Proposition 2.2. Scharlemann's
diagram comparison also identifies Figure 19 as a version of Figure 11.
[GST, §1 and Figure 1, p. 2306](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf#page=2) ·
[Proposition 2.2, p. 2310](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf#page=6) ·
[§7, Figures 11–13, pp. 2330–2332](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf#page=26) ·
[§10, Figures 18–19, p. 2344](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf#page=40) ·
[Scharlemann, arXiv:1208.1299v3, §5, Figure 27](https://arxiv.org/pdf/1208.1299#page=21)

In the cut slab fix the stationary zero-framed tube coordinates
\((s,r,\theta)\). Along the observed lower return take the constant-azimuth
radial annulus between the stationary torus \(r=r_0\) and the parallel at
\(r=r_1\). At each level of the lower product box the straight interval
between its two rails gives an embedded rectangle, since the rails are
distinct and the cross-sectional disks are disjoint. The box points out
from \(r_1\), so the rectangle attaches to the annulus along its missing
mouth interval. The union, with rounded seam, gives an annulus from
\(\lambda_Q\) to the lower return closed by its marked chord. The
opposite access box and its return miss this annulus. An interval on
the exposed run of \(r=r_1\), away from both boxes, times the radial
interval to any \(r'\) with \(r_0<r'<r_1\), gives an embedded band.
Truncate the annulus at \(r'\) and slit it along this band. The oriented
boundary of the resulting disk uses the opposite-oriented parallel in
the band sum, and the disk gives the slide-return isotopy to the face
chord. The upper product rectangle then replaces the opposite detour by
the short deleted segment of the original \(V_4\), while fixing the
stationary tube. This recovers the original joint placement in the
diagram ball. The band came from the observed rails and radial chart.
[Issued coordinates](../02_handle_isolation_and_marked_surgery/notes/CUT_TANGLE_RECOVERY.md#the-framed-cut-tangle) ·
[GST, §2, framed band sum](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf#page=4)

The two return closures add to the moving core in the stationary
complement, with canceling chord orientations. Their linking numbers
with \(Q\) are zero, respectively by the radial annulus and the
published pair. The moving core has winding zero in \(Y_1=S^2\times S^1\)
and hence has an integral Seifert zero framing there. Taking a parallel
of the oriented band sum gives its coefficient as
\(f_K+f_Q-2\operatorname{lk}(K,Q)=0\). The new zero framing in the
diagram ball is therefore the framing of the transported moving tube.
The framing statement is about that full tube after the slide. The
upper zero longitude used in the capped exterior below is the one
defined by the capped component in \(S^3\).

## Cyclic support and sharp sphere intersection

In the two-ended cyclic cover, take the moving lift using the opposite
mouth in ball \(B_0\) and the stationary parallel mouth in \(B_1\). The
two rails run between these balls and close the lift. After adding the
two ideal points, the intervening sphere meets the moving lift in two
points. Capping the two arcs by its chord and using the product
rectangles gives the lower stationary parallel, isotopic to \(Q\), and
the original \(V_4\) in the corresponding half-balls. The knot type of
the lift is \(V_4\#Q\), up to orientations of the summands.

The pair \((Q,V_4)\) in \(S^3\) is nonsplit. A splitting sphere would
express \(Y_2\) as the sum of the two individual zero surgeries. Each
factor has first Betti number one, so prime uniqueness would make
\(S^3_0(Q)=Y_1\), contrary to Property R for the nontrivial square
knot. The pair \((Q,Q^+)\) is also nonsplit. A splitting sphere must
meet the parallel annulus in an essential circle, and such a circle on
the sphere would unknot \(Q\).
[Milnor, prime uniqueness, Theorem 1](https://doi.org/10.2307/2372800) ·
[GST, Theorem 1.1, p. 2305](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf#page=1)

For the support at index 0 the lifted pair is \((Q,V_4)\) with a local
\(Q\) tied into \(V_4\). At index 1 it is \((Q,Q^+)\) with a local
\(V_4\) tied into \(Q^+\). Local knot tying preserves nonsplitting here.
An essential circle on the twice-punctured tying sphere links the
modified component once, so it cannot lie on a splitting sphere
disjoint from the link. For the other circles, compress a putative
splitting sphere using an innermost puncture-free disk on the tying
sphere. At least one result still separates the components by mod-two
intersection with a joining path. Repeating yields a splitting sphere
outside the tying ball, which would split the original pair. For every
other index the boundary of \(B_j\) splits the lifted pair. This gives
exactly \(\{0,1\}\). A common ball downstairs would put the moving lift
in a ball with only one stationary lift, which contradicts this support.
An inlet diffeomorphism lifts and permutes the ends and the stationary
indices up to translation and reflection. A splitting sphere can be
moved off the two ideal points before transport.

A nonseparating sphere disjoint from both cores would give cyclically
stacked cut regions. Each region contains one stationary lift, and the
closed moving lift would lie in just one region. The boundary spheres
separate it from all stationary lifts in other regions, again contrary
to the computed support. The winding number zero makes intersection
counts with any transverse sphere even. The two marked intersections
therefore attain the minimum. The earlier local controls are
distinguished by support, and the earlier multi-period nonlocal
controls by the distance between its indices. For the earlier
one-period example the lift was an unknot summed with \(Q\).
The torus-knot Alexander expression
\((t^{pq}-1)(t-1)/((t^p-1)(t^q-1))\) gives breadth \(2\) for the
trefoil and \(12\) for \(T(4,5)\). Mirroring preserves breadth and
connected sum adds it. The two lifts in the present fixture have
breadths \(4\) and \(28\), whereas both earlier one-period lifts have
breadth \(4\).
[Earlier cover and local-knot comparison](../02_handle_isolation_and_marked_surgery/notes/LIFTED_LINKS_AND_SPHERES.md)

## The two drilled ports and the lower filling slope

Drilling the returns and stationary tube gives a compact exterior \(E\)
with three boundary tori. On each face the punctured sphere is an
annulus joined to the lateral annulus of the return tube. Cap the faces
with separate balls and use boundary-parallel cap arcs on the marked
chords. In a cap ball written as \(D^2\times I\) with the cap arc as
\(\{0\}\times I\), its drilled complement is \(S^1\) times a rectangle.
The old face annulus is the product with the three consecutive outer
sides, while the new cap-tube annulus is the product with the remaining
side. After rounding, absorption of this collar identifies the
exteriors while carrying the meridian and the interval of the marked
chord. The two product rectangles turn the capped return detours into
the original mouth intervals, fixing \(Q\) throughout. Thus \(E\) is the
marked exterior of \((Q,J,V_4)\) in \(S^3\), where \(J\) is the zero
parallel of \(Q\).

Clip the lower radial-and-rail annulus along the lower return tube,
using its radial strip at the long edge, to obtain a proper annulus in
\(E\). The lower boundary loop is the truncated chord joined to the
section of the tube side. In the capped chart its push-off follows the
parallel annulus toward \(Q\), so its self-linking with \(J\) is
\(\operatorname{lk}(Q,J)=0\). It transfers to \(\lambda_J\) and represents,
up to choice of orientation and base paths, the same conjugacy class
as \(\lambda_Q\). All pairwise linkings of \((Q,J,V_4)\) vanish. The
linking coordinates on \(H_1(E;\mathbb Z)\) thus give the three
meridians as a basis and send all zero longitudes to zero. Filling
\(T_Q\) along \(\lambda_Q\) leaves this basis in first homology.
On \(T_J\), a slope \(p\mu_J+q\lambda_J\) then has image
\(p[\mu_J]\). A disk boundary must have \(p=0\), and primitivity gives
\(|q|=1\). In particular, any nonzero shift of the marked lower strip
by meridian winding fails.

In the longitude filling the cap meridian disk joins the proper
annulus on \(\lambda_Q\) and crosses the attached core \(Q^*\) once.
Restoring the radial strip gives a bridge for the specified lower
return and chord, with interior missing the opposite return and
both faces. Any bridge disk avoiding the core would fit outside a
sufficiently small core tube. The region between it and the original
torus is a collar and can be absorbed into the unfilled exterior
with the chord fixed. Adding the boundary-parallel chord cap would
give a spanning disk for the square-knot parallel \(J\) in \(S^3\).
This is impossible by its Alexander breadth. The single puncture
is thus minimal. The lower longitude is nontrivial in \(\pi_1(E)\)
by Dehn's lemma and the annulus from the longitude to \(J\), since a
proper disk would again span the square knot. It is trivial in
\(\pi_1(E(\lambda_Q))\). Cutting the one-puncture disk at a small core
tube and restoring the torus collar gives exactly the longitude annulus
used for the subtraction band.
[Papakyriakopoulos, Dehn's lemma, p. 169](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/papa.pdf#page=2) ·
[GST, Proposition 3.2, pp. 2313–2314, for core passages as slides](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf#page=9)

For a specified simple marked strip loop and a primitive stationary
filling slope, van Kampen kills the normal closure of that slope.
Collaring the loop turns triviality in the filled group into the
boundary-regular null-homotopy needed by Dehn's lemma. Its proper disk
restores the bridge in the strip chart. A finite marked triangulation
gives a finite presentation and a word for the specified loop. The
uniform compact 3-manifold group word problem decides triviality
after adjoining the filling relation. The minimum puncture count
here uses the explicit annulus and the knot obstruction.
[Aschenbrenner–Friedl–Wilton, §4.1, Theorems 4.1–4.2 and Lemma 4.3](https://arxiv.org/pdf/1405.6274)

## Single-prefix checks

The two original individually filled levels each have first homology
\(\mathbb Z^2\). In each order the corresponding filling from \(D^4\)
has two 2-handles, is simply connected, and the boundary inclusion
induces an integral \(H_2\) isomorphism. Indeed the map from absolute
to relative \(H_2\) is between rank-two free groups and has rank-two
free cokernel, and the preceding relative \(H_3\) is zero by
Poincaré–Lefschetz duality. Under PSC domination the target would
decompose as \(Y_2\#\Sigma\), with \(\Sigma\) a possibly empty sum of
oriented Poincaré homology spheres. The two auxiliary 3-handles on the
product spheres would kill an integral basis without adding homology
or changing simple connectivity, producing a contractible smooth
filling of \(\Sigma\). Chodosh–Maximo–Mukherjee Proposition 4.2 forces
\(\Sigma=S^3\), and the rank-increasing single-knot surgery theorem
would then make the first component an unknot in a ball. A spanning
disk would lift to the cyclic cover, contradicting the checked knot
types. The same obstruction rules out a disk on either corresponding
framing slope in the original common exterior. After the one slide,
the stationary first component is still \(Q\) and the local moving
first component is the nontrivial \(V_4\), so the same test still
fails individually. The joint marked surgery has outlet \(Y_3\)
because the returned pair lies in the diagram ball and its local
outlet is \(Y_2\).
[Chodosh–Maximo–Mukherjee, Propositions 2.2 and 4.2, Corollary 2.3, arXiv:2407.05574v1](https://arxiv.org/pdf/2407.05574v1) ·
[Meier–Schirmer–Zupan, Theorem 5.1](https://arxiv.org/pdf/1507.06561#page=9)

## Inputs and scope

The peripheral document used the follow-up pin, which differs from
the initial issue. The check ends at the local returned pair and its
outlet. It gives no scope to a different cut or to a smooth closure
assembled with upper handles.

| Reviewed input | SHA-256 |
| --- | --- |
| [Exterior and slide](../02_handle_isolation_and_marked_surgery/notes/KNOTTED_PORT_EXTERIOR.md) | `19a85a5cb87225e819dcc9c2333a761c8d18c8f8e599870f9a767c0252fc21cd` |
| [Filled bridge disk](../02_handle_isolation_and_marked_surgery/notes/BRIDGE_DISK_FROM_THE_FILLED_EXTERIOR.md) | `e41fb64709ccac15ef89cb8275053c0578130a22fe6af8444cd39918d8bfc1fa` |
| [Lower peripheral group, follow-up pin](../02_handle_isolation_and_marked_surgery/notes/LOWER_PORT_PERIPHERAL_GROUP.md) | `15f63bca22cbf96c03702a591e24019aeb9d9b664b54d487491b31d21f966c31` |
