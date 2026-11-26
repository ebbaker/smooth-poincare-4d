# Cyclic support and closing for the four-point pair

26 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. SUR-E02y is a bounded E calculation from the
[four-point issue](../../research-progress/handoffs/FOUR_POINT_MARKED_RETURNS_20261126.md)
at Git `4d73fdde6804ce93fc2a3e4cef403e16eb941dab` and issue SHA-256
`2a4ced74aa2df28b23e175f493d245797c3394ce4746938812fbd1182a4d214f`.
The issue selects GPT-6.2 Sol/ultra for this packet. Actual serving model
and effort are unavailable. Work is smooth and oriented, with the frozen
integral framing, marked seam and full parametrized tubes. The lower-return
slide is taken first to fix the successor. The count concerns this specimen.

## The closed lift and the first successor

Let \(Y_r=\#_r(S^1\times S^2)\) and take the cyclic cover of the actual inlet
\(Y_1\). Number the slabs \(W_j\) so that \(S_+(j)=S_-(j+1)\), write \(B_j\)
for their diagram balls, and write \(Q_j\subset B_j\) for their stationary
knots. Fix the moving lift \(\widetilde K\) whose two \(V_4\) segments lie in
\(W_0\). Its itinerary displays the seam identifications.

\[
 (3_-)_{0}\longrightarrow(1_+)_{0}=(1_-)_{1}
 \xrightarrow{R_-}(2_-)_{1}=(2_+)_{0}
 \longrightarrow(4_-)_{0}=(4_+)_{-1}
 \xrightarrow{R_+}(3_+)_{-1}=(3_-)_{0}.
\]

This is a single closed lift mapping by degree one to the moving core.
Both cores thus have winding zero, so linking and the input Seifert-zero
coefficients are integral in the inlet. The two seams bounding \(W_0\)
each meet this lift twice. Cap the arcs on each cut with the short
marked chord. The product boxes move the capped middle arcs back to
the two actual deleted arcs of the joint \(V_4\) diagram, fixing \(Q_0\).
The other two capped arcs are the stationary zero parallels, each in its
own chamber. Thus, in the end compactification \(S^3\), the moving lift
has knot type \(V_4\#Q\#Q\), up to orientations of the summands. The joint
placements at the three capped pieces are
\((Q_{-1},Q_{-1}^{+}), (Q_0,V_4), (Q_1,Q_1^{+})\).

The lower subtraction and its disk push replace \(R_-\) by the short
lower \(12\) chord pushed into its slab collar. On regluing, the two
through arcs join along that chord. Pushing the resulting detour across
the disjoint upper \(12\) access rectangle restores the actual upper mouth
of \(V_4\). The two \(V_4\) strands now form a single lower \(34\) return
whose fixed-chord completion is the original \(V_4\) with \(Q\) in the
ball. The upper \(34\) return \(R_+\) retains its parallel and product
fingers. The moving lift \(\widetilde K_1\) therefore uses \(W_{-1},W_0\),
has knot type \(V_4\#Q\), and still intersects the seam between those
chambers twice. Upper-first gives the reflected support calculation.
The second subtraction and the last access push return the exact local
zero-framed \(L_{4,1}=Q\cup V_4\). The two return parallels and the
published \(V_4\) all have linking zero with \(Q\). Capping each pair of
arcs by oppositely oriented copies of the seam chords computes
\(\operatorname{lk}(K,Q)=0\). Each subtraction changes the self-linking by
\(f_Q-2\operatorname{lk}(K,Q)=0\) and preserves the mutual linking.
The geometric moves use the [marked bridge disks](FOUR_MARKED_BRIDGE_DISKS.md).
[GST, Figure 1, §2 Proposition 2.2, §7 and Figures 11–13](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf).

## Complete support and sharp geometric minima

For a fixed moving lift \(J\), let
\[
 \mathcal S(J)=\{j\in\mathbb Z: J\cup Q_j
               \text{ is nonsplit in the compactified }S^3\}.
\]
The local pair \(Q\cup V_4\) is nonsplit. Its joint zero surgery is
\(Y_2\) by GST §7. If the pair split, the two individual zero surgeries
would give a connected sum decomposition of \(Y_2\), with each factor
having first Betti number one. Prime uniqueness would give \(Y_1\) for
each factor. Gabai's Property R would make the square knot an unknot.
The pair \(Q_j\cup Q_j^+\) is also nonsplit. The spanning annulus would
meet a splitting sphere in an essential circle. An arc joining its ends
has odd intersection with the sphere, and all inessential intersection
circles together contribute zero modulo two. The essential circle lies on
a sphere and is isotopic along the annulus to \(Q_j\), a contradiction.
[GST, §7](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf#page=24) ·
[Milnor, prime decomposition, Theorem 1](https://doi.org/10.2307/2372800) ·
[Gabai, Corollary 8.3](https://doi.org/10.4310/jdg/1214441488).

For each occupied chamber retain its stationary knot and forget the other
stationary copies. The capped seam description ties the other chambers'
knots locally into the moving component of the nonsplit pair in that
chamber. To check preservation of nonsplitting, use a tying sphere meeting
the moving core twice and missing the stationary knot. A circle essential
in its twice-punctured sphere links the moving knot once, so cannot also
lie on a splitting sphere. Surgery along an innermost puncture-free cap
removes inessential circles. At least one resulting sphere still splits
the components by mod-two intersection with a path joining them. Iteration
puts a splitting sphere outside the tying ball, since both components
have points outside it. Untying there would split the original pair.
For an unoccupied index \(j\), the sphere \(\partial B_j\) splits its
stationary knot from the moving lift and all other stationary copies.
This gives exactly \(\mathcal S(\widetilde K)=\{-1,0,1\}\) and
\(\mathcal S(\widetilde K_1)=\{-1,0\}\). After the second return the local
lift has support \(\{0\}\).

A different lift translates the indices, and reversing the deck generator
reflects them. A diffeomorphism of \(Y_1\) lifts to a proper diffeomorphism,
so it preserves splitting after allowing these changes of index. One may
move a test sphere off the two ideal end points before transporting it.
If the projected pair lay in a ball, its lift would have support in the
single stationary copy in that ball lift. Both the original and first
successor are nonlocal.

For a smooth nonseparating sphere \(S\) missing \(Q\) and transverse to
the moving core, the complement cut at \(S\) stacks into this same cyclic
cover. In fact the class of \(S\) is primitive since a path in the connected
cut complement closes to a loop crossing \(S\) once. Each chamber contains
one stationary copy, ordered by the deck generator. The moving lift must
enter every chamber indexed by its support. If it misses a chamber, it
lies on one side of that chamber, and the intervening lift of \(S\) gives a
splitting sphere for that pair. A closed transverse lift visiting the
extreme support chambers must cross each intervening sphere at least twice.
Projection to the starting moving knot counts each lift crossing once.
The supplied seam attains these bounds and misses the whole stationary
tube. The minima are therefore four for \(K\), two for the first successor,
and zero after localization.

| Pair | Support up to translation or reflection | Minimum seam count | Moving lift in \(S^3\) |
| --- | --- | ---: | --- |
| Four-point specimen before slides | \(\{-1,0,1\}\) | 4 | \(V_4\#Q\#Q\) |
| Lower return removed | \(\{-1,0\}\) | 2 | \(V_4\#Q\) |
| Earlier winding-two lane | \(\{0,2\}\) | 4 | \(Q\) |

The old winding-two lane has a single excursion past an unoccupied middle
index and one longitude subtraction returns the Figure 5 partner \(U\).
The new extrema span the same distance, with the intervening \(V_4\)
chamber also in the support. The breadths of the Alexander polynomials of
the moving lifts in the three rows are \(32,28,4\), respectively. A torus
knot \(T(p,q)\) has breadth \((p-1)(q-1)\). Breadth is unchanged by
mirroring and adds under connected sum. The first successor also differs
from the old winding-one lane, whose moving lift has breadth \(4\).
[Earlier lifted support](LIFTED_LINKS_AND_SPHERES.md) ·
[The earlier annulus with several turns](PORTS_THROUGH_SEVERAL_TURNS.md).

## Sharp puncture count for the prescribed bridges

Let \(Q^*\) be the core of the stationary longitude filling. For each
sign, \(R_\pm\cup c_\pm\) is a square-knot parallel in the \(S^3\) obtained
by capping the two slab faces. The product rectangle restores the short omitted
longitude interval in the stationary collar. If a bridge disk with this
boundary missed \(Q^*\), its compact image would miss a sufficiently small
tube of the core. The part of the filled solid torus outside that tube is
a product torus collar. Absorb it into the unfilled exterior by a collar
identification fixed on the faces and the moving arcs. Capping the slab
faces would then give an embedded spanning disk for the square-knot
parallel in \(S^3\), which is impossible.

Conversely each radial annulus and its access rectangle caps by a filling
meridian disk at its own azimuth. The two azimuths give disjoint meridian
disks, with one transverse core intersection each, and the access boxes
keep the exterior parts disjoint. The minimum puncture count of a
simultaneous system for the prescribed bridges is exactly two, one for
each return. The upper bridge retains minimum one after the lower move.
These minima are for the specified returning arcs and their fixed chords.

## Relative trace comparison and the actual closing

Use the common product adjunction of the disjoint incoming tubes to put
\(Q\) first if necessary. Write \(Z=Y_1\#S^3_0(Q)\) for its filled level.
In \(Z\) the two band subtractions and the port pushes give successive
framed isotopies of the full moving tube. In particular the added parallel
is contracted using the corresponding meridian disk of the stationary
filling. Extend each tube motion to an ambient isotopy \(J_t\) of \(Z\).
The trace comparison on the level collar is
\((z,s)\mapsto(J_{\eta(s)}z,s)\), with \(\eta\) constant at the ends,
identity on the first trace and identity in the coordinates of the
transported moving handle. Its inverse uses \(J_{\eta(s)}^{-1}\) and the
inverse reordering if needed. Composing these comparisons gives
\(F_{\rm loc}\) and the inverse in reverse order. GST's actual joint
diagram proves the localized surgery outlet \(Y_1\#Y_2=Y_3\), hence this is
also the outlet of the original trace. The order puts the knotted \(Q\)
first and leaves \(Z\) as that intermediate level.
[GST, §2 and Proposition 3.2](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf#page=9) ·
[Milnor, isotopy extension, Theorem 5.8](https://webhomes.maths.ed.ac.uk/~v1ranick/surgery/hcobord.pdf#page=68).

In the localized presentation round \(B\times I\) and its two handles
to the local trace \(D_L\). Its lower and lateral interface rounds to a
parametrized boundary three-disk. Cap the local outlet \(Y_2\) by
\(H_2=\natural_2(S^1\times D^3)\) with an orientation-reversing
identification. The closed handle counts give simple connectivity and
Euler characteristic two, hence a homotopy four-sphere. Since it has no
1-handles and exactly two 2-handles, one attached on the generalized
square knot \(Q=T_{3,2}\#T_{-3,2}\), Meier–Zupan's Theorem 1.1 identifies
it with smooth \(S^4\). In the standard sphere the embedded-cap argument
of Laudenbach–Poénaru's Lemma 1 identifies the auxiliary \(H_2\) with
the cap of the two split zero handles. Restrict to the closures of their
complements to get an oriented diffeomorphism
\(f_0:D_L\to D_{\rm sp}=\natural_2(S^2\times D^2)\).
Apply Palais to the two equioriented parametrizations of the interface
disk, enlarged slightly over the rounded rim, in the connected boundary of
the split trace. Extend the resulting isotopy by a cutoff in an inward
collar, using the inverse isotopy at each collar level for the inverse.
Straighten the inward collar over the enlarged disk by a boundary-fixed
isotopy of the inward fields with support in the buffer. The adjusted
comparison and its inverse are the prescribed product on a neighborhood
of the interface, so they extend by identity through the complementary
inlet product. This gives \(F_{\rm sp}\) with its relative inverse. The
full trace comparison \(F=F_{\rm sp}F_{\rm loc}\) has inverse
\(F_{\rm loc}^{-1}F_{\rm sp}^{-1}\). The split trace has first intermediate
level \(Y_2\). Property R and prime uniqueness distinguish it from \(Z\).
[Meier–Zupan, Theorem 1.1, p. 70](https://par.nsf.gov/servlets/purl/10464744#page=2) ·
[Laudenbach–Poénaru, proof of Lemma 1, p. 338](https://www.numdam.org/item/10.24033/bsmf.1741.pdf#page=3) ·
[Palais, Theorem B and Corollary 1](https://doi.org/10.1090/S0002-9939-1960-0117741-0) ·
[Earlier relative disk calculation](KNOTTED_PORT_CLOSING.md).

Set \(d_0=\partial_+F\). The same transport applies to localization alone,
starting with \(\partial_+F_{\rm loc}\). At each later level carry the entire
tube \(t_j:S^1\times D^2\to Y^{\rm old}_j\) to \(d_jt_j\), with inverse
\(t_j^{-1}d_j^{-1}\) on its image. Extend by identity in the new handle
coordinates with the full transported collar and take the next outlet map.
The inverse extends \(d_j^{-1}\) using the same handle coordinates. A
tube originally displayed and disjoint at the inlet is first read at its
actual later level through the common exterior. Write \(d\) for the final
outlet map after all such extensions. For the original closing
\(\gamma:Y^{\rm old}_{\rm final}\to\partial U\), the reassembled map and
inverse are
\[
 \gamma_{\rm sp}=\gamma d^{-1},\qquad
 \gamma_{\rm sp}^{-1}=d\gamma^{-1}.
\]
The assembled comparison uses the extended trace map below and identity
on \(U\), with the extended inverse below and the same upper identity.
Both maps have matching product germs and both closings reverse the
outward boundary orientations. This interior comparison has zero net
handle-count change.

For an immediate closing, \(d=d_0\). An original outgoing face
\(o_i:D^2\times S^1\to Y^{\rm old}_{\rm final}\) supplies the reverse tube
\(\gamma o_i\tau=\gamma_{\rm sp}(d o_i)\tau\), with inverse
\(\tau^{-1}o_i^{-1}d^{-1}\gamma_{\rm sp}^{-1}\) on its image. Here
\(\tau:S^1\times D^2\to D^2\times S^1\) switches factors. For a later
closing the formula uses the map and face at the level where that face is
present. An occupied face is read after the later handle is undone in
reverse. The cancellation below uses the outgoing faces of the new split
handles. The original \(A\) face is read on the lower \(A\)-trace, fixed
by the inlet-relative comparison.

## Terminal cancellations and the optional stabilized diagram

Suppose the block is terminal and \(U\cong H_3\). Choose a model closing
\(\lambda\) sending the two split product spheres to distinct reverse
1-handle belt spheres, each meeting its corresponding new dual once. The
spheres and isolated dual circles are supplied by the split zero surgery
summands. The orientation-preserving boundary map
\(\lambda\gamma_{\rm sp}^{-1}\) of the actual cap extends over it by
Laudenbach–Poénaru. Its inverse has boundary \(\gamma_{\rm sp}\lambda^{-1}\).
Reparametrize the upper cap by this extension, fixing the split trace.
In reverse, order the belt paired with the first reverse 2-handle last
among the reverse 1-handles. The corresponding adjacent handles cancel
by Milnor's one-intersection theorem. Repeat on the other split summand.
Their neighborhoods are disjoint, so both product replacements can be
made relative to the inlet of the two-handle block and the retained
reverse 1-handle. The forward and inverse strip maps use the product flow
and its backwards flow.
[Laudenbach–Poénaru, Theorem A and the extension in §2](https://www.numdam.org/item/10.24033/bsmf.1741.pdf#page=7) ·
[Milnor, Theorem 5.4](https://webhomes.maths.ed.ac.uk/~v1ranick/surgery/hcobord.pdf#page=53).

Let \(G\) be the cumulative map from the old assembly above \(A\) to the
reduced upper \(H_1\), including the relative trace comparison, the cap
reparametrization and the two cancellations. For the original level gluing
\(\kappa:\partial D_A\to\partial_-(\text{old upper assembly})\), the
residual closing and inverse are
\[
 \gamma_A=\partial G\,\kappa,\qquad
 \gamma_A^{-1}=\kappa^{-1}\partial(G^{-1}).
\]
The final reverse tube is \(\gamma_A o_A\tau\), with inverse
\(\tau^{-1}o_A^{-1}\gamma_A^{-1}\). For the original split zero \(A\),
choose a rank-one model closing \(\lambda_A\) matching its product-circle
dual to one geometric belt intersection. Extend
\(\lambda_A\gamma_A^{-1}\) over the reduced cap, with inverse boundary
\(\gamma_A\lambda_A^{-1}\), and cancel the last adjacent reverse pair.
In forward indices the sequence is
\[
 (n_1,n_2,n_3)=(0,3,3)\ \,\longrightarrow\ \, (0,2,2)
 \ \,\longrightarrow\ \, (0,1,1)\ \,\longrightarrow\ \, (0,0,0).
\]
This identifies the terminal closed manifold with the standard smooth
\(S^4\) for every supplied closing to the stated upper body. The two marked
subtractions and the relative recognition introduce zero stabilizations.

GST §10 independently gives a stabilized local diagram comparison once
the two marked returns have produced \(L_{4,1}\). Proposition 10.1 adds
one canceling Hopf pair, with its added even-framed component on the
meridian of a bracketed surgery circle and a dotted partner. In Figure 18
the four-slide step moves the even-framed component around the torus and
passes the moving component over it at the two twist boxes. Use the
inverse steps to take \(n=4\) to \(n=0\) with \(k=1\). At \(n=0\), the
Figures 12–13 identification with Figure 5 gives the local unlinking
slide. The proof of Proposition 10.1 recovers a zero-framed meridian of
the dotted component and clears its disk by slides over that meridian,
so the same Hopf pair can be removed. The diagram option uses one
temporary 1/2 pair and zero extra split zero components. The terminal
count goes \((0,3,3)\to(1,4,3)\to(0,3,3)\) before the three upper
cancellations. The unstabilized comparison above is through recognition
of the relative smooth trace. The minimum length of unrestricted
local unlinking slide sequences remains open here.
[GST, Proposition 10.1 and Figures 17–20](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf#page=37).
