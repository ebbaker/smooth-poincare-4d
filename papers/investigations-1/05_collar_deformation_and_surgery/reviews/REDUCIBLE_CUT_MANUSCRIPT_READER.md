# Independent reading of reducible cuts and the clasp minimum

26 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. Bounded verification of smooth oriented,
integrally framed traces and of the compactified cyclic-lift argument.
Input HEAD 9c80575988ad8915ad39515c64400e3d8590cf46. Independent
serving model and effort are unavailable. The text versions read are
listed below.

The reducible-cut localization theorem, its terminal count, the
arbitrary-puncture family, and the clasp's sharp minimum of four all
check. The two geometric minimum proofs use different information:
the banded longitude survives in the unfilled knot group, whereas
the Whitehead completion is trivial there and is detected by
nonsplitting of its capped pair.

## Adversarial check of the clasp minimum

Use \(S_0\) in the compactified cyclic cover \(S^3\) and keep only the
moving lift \(k\) and the two adjacent stationary lifts. On either side
of \(S_0\) there are two proper returns and one stationary knot. The
proof uses four **individual** nonsplit capped pairs. The two lower
completions and the upper \(41\) completion are native \(U\) parallels.
If a sphere split one of these from its stationary \(Q\), its core
would be trivial in the capped \(Q\)-complement even after filling,
contrary to the surviving fiber class. Changing a closing chord does
not affect this nonsplitting test: once the other return is forgotten,
simple arcs on \(S_0\) with the same two marked endpoints are isotopic,
and the isotopy is carried in a collar disjoint from the stationary
knot. The upper \(23\) completion is the Whitehead pattern on the
specified zero parallel \(L\) of \(Q\). The native radial annulus for
\(L,Q\) certifies nonsplitting of the two parallels. A splitting sphere
would meet the annulus in an essential circle, since an arc joining its
boundary curves has odd intersection with the sphere and can avoid
any collection of inessential circles. Such a circle has the knot type
of \(Q\) in \(S^3\), impossible for a simple circle on a sphere.

The pattern-side torus is incompressible by the Whitehead link cusp
description. Outside the carrier, a compression surviving after
forgetting \(Q\) would have the longitudinal slope in the exterior
of \(L\), and would give an unknotting disk for \(L\) upon adding its
radial annulus. A splitting sphere for the pattern and \(Q\) can
therefore be made disjoint from the carrier torus by inessential-circle
surgery, retaining separation by a mod-two joining arc. Inside the
carrier it would put the pattern in a ball, giving a carrier meridian
off the pattern. Outside it would split \(L,Q\). Both are impossible.
This test uses the actual Whitehead pattern in the untwisted chart.
The companion test with the capped \(U\)
in place of \(Q\) uses the same carrier argument and the native
\(L,U\) parallel annulus. For the more detailed claim about \(k\)
and the lower stationary lift in the clasp reader, the co-core
surgery also works. If a meridian in the lower-ribbon carrier avoids
\(k\), compare it to the two-punctured co-core. Remove circles
cutting off unpunctured co-core disks by retaining the disk with the
meridian boundary. An innermost disk on the meridian then encloses
either one or both co-core punctures. The first gives an odd
sphere intersection with a closed knot. The second, joined to the
outer annulus of the co-core on its side of approach, gives a meridian
disjoint from the co-core and from \(k\). After cutting along the
co-core, this meridian separates the two co-core faces. Otherwise a
joining arc between matching points of the faces would close to a
loop with intersection one with the co-core and zero with a meridian.
Capping the two cut returns on their own faces recovers the native
\(J,U\) pair by the disjoint product access rectangles. The claimed
meridian would split those completions. The minimum-four proof below
needs only the individual four capped pairs, so it does not rely on
this additional co-core comparison.
[Thurston, *The Geometry and Topology of Three-Manifolds*, §§3.3 and 4.4](https://library.slmath.org/nonmsri/gt3m/PDF/Thurston-gt3m.pdf#page=42) ·
[GST, Figure 5, Lemma 6.2(3) and Corollary 6.4](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-p.pdf)

A proper disk compressing the four-holed \(S_0\) has interior in
one of the two balls cut by \(S_0\). Any boundary splitting the two
endpoints of a return is impossible, including a peripheral curve
enclosing a single endpoint. The remaining essential case separates
one whole return from the other. The disk cuts the ball into two
balls by smooth Schoenflies. The return in the ball without the
stationary knot can be closed there by a chord on its boundary patch
of \(S_0\). Pushing the chord slightly inside the patch gives a
split capped pair. This contradicts the individual nonsplitting and
excludes every essential boundary slope, including nonstandard
chords or compressions on either side.

For a sphere \(T\) separating the two stationary lifts and meeting
\(k\) at most twice, minimize the number of transverse circles of
\(T\cap S_0\). Make the sets of punctures on the two spheres disjoint.
If any circle on \(T\) cuts off an unpunctured disk, an innermost
such disk on \(T\) has interior disjoint from \(S_0\), since nested
disks are also unpunctured. Its boundary cannot be essential or
peripheral on the punctured \(S_0\), by the preceding disk test.
It bounds an unpunctured disk in \(S_0\). Choose an innermost
unpunctured disk on \(S_0\), allowing a different boundary circle,
so its interior misses \(T\). This is the disk used for surgery.
Push its two copies to the two sides of \(S_0\), one in the germ
of each of the two retained pieces of \(T\), then round. Neither
copy acquires a puncture. The two new spheres each have fewer
intersection circles. Their classes add to \([T]\) in mod-two
homology of the complement of the stationary knots, since the
change is the local disk surgery in a neighborhood missing both
knots. Equivalently intersect with a path joining marked points on
the stationary knots and avoiding a thin disk neighborhood. At
least one sphere still separates the stationary knots. Thus a
minimizer has no such circle.

If a circle remains, each of its two sides on \(T\) contains one
puncture. Its mod-two linking number with \(k\) is one, so exactly
one of the two disks it cuts off in \(S_0\) has one puncture, and
the other has three. The innermost once-punctured disk has interior
disjoint from \(T\), since each strictly nested circle would cut off
either zero punctures, already excluded, or the same one puncture.
Each pushed-off copy for surgery intersects \(k\) once, since the
puncture is transverse and away from the rounding at its boundary.
Each replacement sphere consequently has two punctures. Separation
is retained by one of them by the same mod-two argument, again with
fewer circles. The final no-circle case is also impossible. A
disjoint \(T\) lies wholly on one side of \(S_0\) and must enclose
that side's stationary knot in the ball away from \(S_0\). Both
ends of each proper return lie outside that ball, so both returns
meet \(T\) evenly. One return misses \(T\) and caps on \(S_0\) off
\(T\), contradicting its nonsplitting with the enclosed knot.

For any nonseparating inlet sphere missing \(Q\), its dual character
generates \(H^1(Y_1;\mathbb Z)\) and defines the same cyclic cover.
Deck translation sends the cut region containing the first stationary
lift to the adjacent region containing the second. Thus the same
two lifts are separated by some lift of the competing sphere. The
moving knot has winding zero, giving a one-to-one projection of \(k\)
to the downstairs moving knot. Four distinct intersections upstairs
therefore force four downstairs. The argument permits an arbitrary
competing sphere and uses a single moving lift. It applies to the
specified pair before the filled-core passage. The first returned
unfilled pair has a displayed two-point seam, and the subsequent
unfilled ribbon isotopy gives its absolute minimum zero by pullback.
The earlier clasp derivation's range \(2\) or \(4\) is superseded by
this separate compactified-cover argument.

## Reducible native cuts and the three-dimensional sources

In the \(Y_1\to Z\to Y_3\) order the change of \(b_1\) is at most one
per knot surgery. The required change is two, so both attain one.
For \(Q\), this forces rational null homology, then integral null
homology in \(Y_1\). The exterior has \(H_1=\mathbb Z^2\): the added
meridian is free since the original knot class has intersection zero
with every closed surface. The longitude given by a Seifert surface
is null in that exterior homology. An integral slope with any
nonzero meridian coefficient would lower the rank, so the native
slope is zero and \(H_1(Z;\mathbb Z)=\mathbb Z^2\). This last
torsion-free statement is essential in the first application of
Scharlemann.

Scharlemann's Theorem 6.1 assumes an irreducible and
boundary-irreducible common exterior and an input containing a sphere
that bounds no rational homology ball (or a compressible input
boundary). In both uses here the input has a nonseparating sphere,
and a single exterior boundary torus would be incompressible if
the exterior were irreducible: compression would give a sphere
bounding a ball on the interior side and would make the exterior a
solid torus, whose fillings have cyclic homology. Theorem 6.1(a,b)
has solid-torus outputs with boundary, and (d) an irreducible output.
In (c) the genuine cable has winding of absolute value at least two.
Surgery on its cabling-annulus slope splits off a lens space whose
torsion order is that winding. One local derivation cuts the cabling
torus and compresses both sides along the cable slope: the carrier
side is the carrier solid torus filled by a second solid torus with
meridian that slope. The filling distance from the original carrier
meridian is the absolute winding. The added-in-proof case expressly
assumes \(H_1(M';\mathbb Q)=0\), so neither positive-rank output
can fall under it. These exceptions are excluded for \(Y_1\to Z\)
when \(Z\) is reducible and for \(Y_1\#S^3_0(Q)\to Y_3\).
[Scharlemann, *Producing reducible 3-manifolds by surgery on a knot*, Theorem 6.1 and added correction, pp. 497–499](https://web.math.ucsb.edu/~mgscharl/papers/reducible.pdf#page=17) ·
[GST, Theorem 3.3 proof and Lemma 4.1](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-p.pdf#page=10)

A separating essential sphere of the common exterior has a capped
side away from its boundary torus that is a nontrivial common
summand of the two fillings. In the first application, prime
uniqueness in \(Y_1\) forces this summand to be \(Y_1\). In the
second, Gabai's prime and genus conclusion for zero surgery on
a nontrivial knot makes \(M=S^3_0(Q)\) irreducible and distinct
from \(Y_1\). The only possible nontrivial common summand of
\(Y_1\#M\) and \(Y_3\) is therefore \(Y_1\). In either case an
interior sphere in the punctured product summand is nonseparating
and missing the attachment. The local unknot case is read from
Meier–Schirmer–Zupan's actual \(Y_2\to Y_3\) single-knot theorem:
its hypothesis is a nontrivial Dehn surgery, satisfied since the
ranks differ. The knot is an unknot in a ball and the slope zero.
The ball can be carried to a spot missing the original seam and
the stationary core by an ambient isotopy in the filled cut.
[Gabai, Corollary 8.3 and Remarks 8.3′ and 8.5, reproduction of published pp. 525–526](https://www.scribd.com/document/1026013102/2-Gabai) ·
[Meier–Schirmer–Zupan, Theorem 5.1](https://arxiv.org/pdf/1507.06561#page=9)

For \(Y_1\#M\) with \(M\) irreducible, all nonseparating spheres
are ambient isotopic. For disjoint spheres, cut on the first and
cap both ends. The result is \(M\) by prime uniqueness. The other
sphere bounds a ball containing exactly one cap, since containing
neither or both would make it separating after regluing. The ball
between its boundary and the contained cap is a product after
removing the cap interior. For intersecting spheres, innermost-disk
surgery gives a disjoint chain, keeping a nonseparating sphere at
each stage by the oriented sum in \(H_2\). Trace's Proposition 4
is this disjoint-chain argument. The shorter version in the final
surgery TeX for the unfilled longitude family also checks. In the
unfilled exterior \(E\), the cut along a nonseparating sphere
missing \(Q\) remains connected after drilling, by perturbing paths
off the knot. Its capped cut is a knot exterior in \(S^3\), because
the meridional filling of the capped cut, summed with \(Y_1\), is
\(Y_1\). This knot exterior is irreducible and the disjoint-pair
product is away from its torus boundary. Perform the disk surgeries
inside \(E\), using the oriented sum in ambient \(H_2(Y_1)\) to
choose the nonseparating successor. This gives the ambient isotopy
in \(E\) relative to the torus. Apply it to the competing sphere
and the moving knot together. The resulting moving loop has the
same conjugacy class in the fixed free-product splitting, with at
most one stable letter per actual crossing. In the banded family
the four intervening unfilled vertex words are nontrivial: three
survive in \(M\), and the fourth is \(\lambda_Q^n\), a nonzero
power of the boundary curve of the once-punctured genus-two fiber.
The reduced four-letter cyclic edge path gives the claimed
absolute lower bound. The associated 2+2 face-compression
contradiction follows by the same oriented sphere sum.
[Trace, Proposition 4 and its proof](https://msp.org/pjm/1982/99-1/pjm-v99-n1-p13-s.pdf)

The forward and reversed inclusions of the moving trace yield
the two group presentations written in the surgery TeX. Their
abelianizations force the forward relator to have zero abelianization
and the reverse relator to have primitive nonzero abelianization.
The reverse relator is a nonpower. Antolín–Dicks–Linnell Corollary
6.5(i) applies on the Cayley tree of the free group with the one
relator, a strongly staggerable singleton. Its root subgroup in the
quotient is trivial for a nonpower. The natural basis of the
relation module is the lifted attaching loops, so the presentation
complex is aspherical. A subgroup of its group has a
two-dimensional classifying space via covering. It cannot be
the group of the closed aspherical \(M\) with third group homology
\(\mathbb Z\). Hence the localized element is nonidentity. The
optional Freiheitssatz argument applies because compact orientable
irreducible \(M\) has positive \(b_1\), giving local indicability
by the cited Howie–Short theorem. Its second factor is infinite
cyclic. In the height kernel the single surviving chamber projection
is a necessary word consequence of conjugacy to a nonidentity
vertex element. In the mixed pairing it is exactly one among
\(ac,b,d\). The final parent phrasing states the same trichotomy.
Neither the trichotomy nor the cylinder's winding decides the
existence of a bridge in the corresponding fully drilled exterior.
[Antolín–Dicks–Linnell, Corollaries 4.4 and 6.5(i), and Setting 6.3](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/C30665BA028A514089D9EDC0DF3A2085/S0017089511000231a.pdf/on_the_localindicability_cohenlyndon_theorem.pdf) ·
[Boyer–Rolfsen–Wiest, Theorem 3.1](https://www.numdam.org/article/AIF_2005__55_1_243_0.pdf)

## Puncture claims and marked assemblies

For the banded family, use different normal azimuths for the \(n\)
longitudes and different longitudinal stations for the \(n-1\)
bands. Orient the bands to fuse equally oriented parallels, reversing
the attaching interval parameter at one end. The bands stay external
to the radial capping annuli and disjoint from the moving supports.
After filling, their incidence path joins \(n\) disks by \(n-1\)
bands to an orientable disk with \(n\) identical signed intersections
with \(Q^*\). For any competing disk, restore the moving tubes,
cap the sphere ends, and join the two oriented boundaries by the
chord-and-wall homotopy off \(Q^*\). Gluing with the opposite
orientation gives a sphere map in the aspherical \(M\), so it cannot
change the signed count. This proves the lower bound for every disk
and every admissible chord and winding, even outside the exhibited
support. It is a bound on this particular marked bridge problem.
The twist obstruction retains the actual capped \(41\) drill. Its
meridian is infinite order in first homology by the exact sequence
of its tubular neighborhood and null homology of the capped \(41\)
knot. The enclosed port \(4\) contributes its meridian once, whereas
the restored \(23\) drill contributes none. A nonzero twist changes
the class by a nonzero multiple; the wall windings on \(23\) have
already died in this quotient.

For the clasp variant, the two punctures are opposite. Zero
punctures would split the completed pattern and \(Q\); one would
make the winding-zero pattern conjugate to the nontrivial
unfilled longitude. These exclusions hold for arbitrary admissible
chords by the cap-side argument above. The surgery TeX wording
“its bridge has exactly two opposite core punctures” refers to
the exhibited minimum disk. The minimum concerns the marked bridge.
The terminal closing uses the stated sequence of moves.

The general filled-sphere comparison carries \(K\) by the ambient
isotopy taking the reducing sphere to the original seam. Perturb
the \(K\)-track transverse to \(Q^*\times I\) relative to the ends,
so there are finitely many single spatial passages. The local
meridian disk at each passage has boundary the actual framed
longitude of \(Q\), giving a signed framed slide on the unfilled
diagram as in GST's proof of Proposition 3.2. The remaining
isotopy intervals are read on the common exterior with its
product collar. Apply the isotopy only on the last collar of
the actual stationary trace and carry the moving tube framing.
It extends over the moving handle in its transported coordinates,
with the inverse slice-wise collar isotopy. For later handles the
chart is \(P_jt_j\), inverse \(t_j^{-1}P_j^{-1}\), at its own cut.
The closing \(\gamma P^{-1}\) has inverse \(P\gamma^{-1}\).
The outgoing boundary transport preserves the original reversed
charts. Geometric cancellation uses the new product-marked duals.

For the immediate cap, the localized general pair can be carried
into a buffered ball of the common exterior of the split \(A\)
surgery, then placed before \(A\) in \(S^3\) by commuting the
disjoint attachments. The outlet below \(A\) is the actual
local \(Y_2\). Match the split \(A\) product sphere to a single
upper belt by a boundary map extending over the actual upper
body, with the prescribed orientation sign of the closing.
The dual meets that belt once and the other belts zero times.
The new rank-two closing \((\partial C)b\) and inverse
\(b^{-1}\partial(C^{-1})\) carry the retained piece correctly.
This gives \(3\to2\) in both middle and upper counts for an arbitrary
returned local pair. For the explicit
Figure 5 successors the actual \(Q\)-first intermediate level
is \(Y_1\#M\). Commuting the local handles and taking \(U\)
first gives \(Y_2\), so the published slide of \(Q\) over \(U\)
gives the split zero pair in the correct trace order with outlet
\(Y_3\). An extending upper re-marking now matches the two local
duals and the original split \(A\) dual to three separate belts.
The two local cancellations leave the split \(Y_2\) and \(Y_1\)
levels, and the last cancels \(A\). Counts are
\((0,3,3),(0,2,2),(0,1,1),(0,0,0)\) under the immediate cap.
With unspecified intervening levels there is a relative trace
comparison with count change zero through the block.
[GST, Proposition 3.2 proof and Figure 5](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-p.pdf#page=6) ·
[Laudenbach–Poénaru, proof of Theorem A](https://www.numdam.org/item/10.24033/bsmf.1741.pdf#page=7) ·
[Milnor, Theorem 5.4](https://webhomes.maths.ed.ac.uk/~v1ranick/surgery/hcobord.pdf#page=53)

The parent and surgery statements preserve the necessary scope:
either reducible native second cut suffices for a strict reduction
in the indicated terminal \(Y_1\to Y_3\) pair with one split
lower zero. The two remaining native orders then have irreducible
second cuts of \(b_1=2\) in a least-three presentation of this form.
The final surgery open-section sentence about positive scalar
curvature domination follows from Chodosh–Maximo–Mukherjee
Proposition 2.2. A closed connected oriented target of such a
nonzero-degree map must be a sphere or a connected sum of spherical
space forms and \(S^1\times S^2\) factors. Irreducibility and
\(b_1=2\) contradict that decomposition. The localization
argument leaves both irreducible native cuts and unrestricted
recognition of a local two-component link open in general.
[Chodosh–Maximo–Mukherjee, arXiv:2407.05574v1, Proposition 2.2](https://arxiv.org/pdf/2407.05574v1#page=4)

| Reading copy | SHA-256 |
| --- | --- |
| [Parent manuscript](../manuscript/marked_collars_and_smooth_recognition.tex) | a467aee79302637ffdce7c7aeedb3cbd7d3008d11c36e0ffded6238ca3c9b126 |
| [Surgery manuscript](../02_handle_isolation_and_marked_surgery/manuscript/recognition_from_marked_handle_cuts.tex) | 426a444406b5659be56791670025f2adb98352d2f42a5fdbd389736cd53c26b3 |
| [Clasp reader](ALTERNATING_CLASP_READER.md) | 6b35cfc53a5939c4909cb9152cc09a111ad6e465ce07c08573a428d19d4887c6 |
| [Clasp derivation](../02_handle_isolation_and_marked_surgery/notes/ALTERNATING_CLASP_RETURN.md) | 77e544c4d5dc7632f643550f01f58bbc30f6c6a46928ed890e7f015525df70d7 |
| [Banded longitude derivation](../02_handle_isolation_and_marked_surgery/notes/BANDED_LONGITUDE_FAMILY.md) | 8b3c28ca62e5d4177a049d42e56de7b48390b552c295e80577c4c48cbc7ed3bd |
