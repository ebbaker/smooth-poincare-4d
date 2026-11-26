# A common nonseparating sphere for the two knot fillings

26 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. Bounded SUR-B04 execution after the
[capped-factor and four-return issue](../../research-progress/handoffs/CAPPED_FACTORS_AND_FOUR_RETURNS_20261126.md),
input HEAD `9c80575988ad`. The session selected GPT-6.2 Astra/ultra lead
and bounded GPT-6.2 Sol/ultra derivations. Independent serving-model
and effort telemetry are unavailable. The statements are in the smooth
oriented category with actual framed attaching tubes.

Let \(Y_j=\#_j(S^1\times S^2)\). In \(Y_1\), let \(Q\) be a
nontrivial knot in a ball off the supplied product seam \(S\), with its
native zero framing. Stationary surgery gives
\(Z=Y_1\# M\), where \(M=S^3_0(Q)\). Let \(K\) be the remaining
framed knot and suppose its actual integral surgery in \(Z\) gives
\(Y_3\). Then the exterior of \(K\) in \(Z\) contains a sphere
nonseparating in both fillings. In the closed \(Z\) this sphere is
ambient isotopic to \(S\). Carrying \(K\) along the isotopy and
converting its crossings of the fixed stationary filling core into
framed slides over \(Q\) localizes the pair in a ball of \(Y_1\).
The two-component surgery in that ball, capped to \(S^3\), gives
\(Y_2\).

## Reducibility of the moving exterior

Let \(E=Z\setminus\operatorname{int}\nu K\), with meridian \(\mu\)
and the integral attaching slope \(\alpha\). Its only boundary is a
torus and \(\Delta(\mu,\alpha)=1\). Gabai's Corollary 8.3 gives
primeness of \(M\) and identifies the minimum genus of its oriented
nonseparating surfaces with the genus of \(Q\). For nontrivial \(Q\)
that genus is positive. A closed orientable prime admitting an
essential sphere is \(Y_1\), so \(M\) is irreducible and distinct
from \(Y_1\). Also \(H_1(M;\mathbb Z)=\mathbb Z\). The sphere \(S\)
is nonseparating in \(Z\), so it bounds no rational homology ball.
[Gabai, *Foliations and the topology of 3-manifolds III*, Corollary 8.3](https://doi.org/10.4310/jdg/1214441488)

Suppose \(E\) is irreducible. A compression disk for its boundary
torus produces an interior sphere that caps the compressed collar
with a ball on the side away from the boundary. Reversing the
compression identifies \(E\) with a solid torus. Its fillings have
first Betti number at most one, contrary to \(b_1(Z)=2\). Thus this
hypothesis on \(E\) also gives boundary irreducibility, as required
in Scharlemann's Theorem 6.1. Apply it with initial manifold \(Z\),
surgered manifold \(Y_3\), and the admissible sphere just identified.
Both manifolds are closed, excluding the theorem's solid-torus cases
(a) and (b). Case (d) requires an irreducible outlet. The added-in-proof
case (e) has a rational homology sphere or a sum of rational homology
spheres at the outlet, and arose from \(H_1(M';\mathbb Q)=0\) in the
theorem's notation. Here \(H_1(Y_3;\mathbb Q)=\mathbb Q^3\).
[Scharlemann, *Producing reducible 3-manifolds by surgery on a knot*,
Theorem 6.1, pp. 497–498, and added in proof, p. 499](https://web.math.ucsb.edu/~mgscharl/papers/reducible.pdf#page=17)

For case (c), a genuine cable sits on the boundary of a solid torus
\(V\) with winding \(|q|\ge2\); the slope is the one from the cabling
annulus. Cap the ends of this annulus by two parallel meridian disks
of the surgery torus. The sphere separates the part on the \(V\) side.
There the operation is a 2-handle on an annular neighborhood of the
\((p,q)\) curve on \(\partial V\). Capping its spherical boundary
gives the union of \(V\) with a solid torus whose meridian intersects
the old meridian \(|q|\) times. That genus-one filling is a lens space
with integral first homology \(\mathbb Z/|q|\). It is a summand in
the outlet, so case (c) would give torsion in \(H_1(Y_3;\mathbb Z)\).
This contradicts the free integral homology of \(Y_3\). The original
irreducibility assumption on \(E\) is therefore impossible.
[Scharlemann, Lemma 3.4 and the cable filling in the proof of
Theorem 6.1, pp. 489–490 and 498](https://web.math.ucsb.edu/~mgscharl/papers/reducible.pdf#page=18)

## A sphere that survives both fillings

Choose a sphere \(T\subset\operatorname{int}E\) that does not bound
a ball there. If \(T\) is nonseparating in \(E\), attaching a solid
torus to the connected cut exterior preserves connectivity, so \(T\)
is nonseparating in each filling. Otherwise let \(C^\circ\) be the
side of \(T\) away from \(\partial E\), and cap \(T\) on this side to
obtain \(C\). The capped side is unchanged by either filling. It is
nontrivial, since \(C\cong S^3\) would imply \(C^\circ\) is a ball.
By prime uniqueness \(C\cong Y_1\): the only prime common to
\(Z=Y_1\#M\) and \(Y_3\) is \(Y_1\), and it occurs once in \(Z\).
The punctured \(Y_1\) side contains a product sphere nonseparating
there, which also stays nonseparating in \(E\) and both fillings.
This proves the assertion even when the first reducing sphere found
is separating. The same common-summand argument excludes a ball in
\(Z\) containing \(K\): surgery in such a ball leaves \(Z\), hence
\(M\), as a summand.
[Milnor, *A unique decomposition theorem for 3-manifolds*, Theorem 1](https://doi.org/10.2307/2372800)

Fix a common nonseparating sphere \(T\). Cutting and capping its two
faces gives \(M\) on the \(Z\) side and \(Y_2\) on the outlet side,
by the same prime uniqueness argument. In particular the resulting
group of the cut-open \(Z\) is a conjugate of the original \(M\) factor
in \(\pi_1(Z)\), as explained below. Any loop in \(Z\) missing \(T\),
including \(K\), is elliptic in this free splitting.

## Isotopy in the closed stationary filling

Put \(G=\pi_1M\) and \(\Gamma=\pi_1Z=G*\langle t\rangle\), using
the supplied seam \(S\) for the stable letter \(t\). By the
Kneser–Stallings theorem, the group of the closed irreducible \(M\)
is freely indecomposable. It is noncyclic. Indeed \(H_1(M)=\mathbb Z\)
implies its group is infinite, and the Sphere Theorem makes the
universal cover acyclic: it is simply connected, has \(\pi_2=0\),
and is a noncompact 3-manifold. It is contractible by Hurewicz and
Whitehead. Thus \(H_3(G;\mathbb Z)=H_3(M;\mathbb Z)=\mathbb Z\),
which rules out an infinite cyclic \(G\).
[Hatcher, *Notes on Basic 3-Manifold Topology*, Chapter 3](https://pi.math.cornell.edu/~hatcher/3M/3M.pdf)
· [Hatcher–Wahl, §2, on the freely indecomposable prime factors](https://web.math.ku.dk/~wahl/HatcherWahl.3manifolds.pdf)

For any nonseparating sphere in \(Z\), its connected cut caps to
\(M\). Its group is a free factor of \(\Gamma\) conjugate to \(G\)
by Grushko uniqueness. Choose the lift of the cut region giving
exactly \(G\), and let \(t'\) denote the corresponding stable letter.
Then \(t'=a t^{\varepsilon} b\) with \(a,b\in G\) and
\(\varepsilon=\pm1\). To check this, the two free-product
presentations give the automorphism of \(\Gamma\) fixing \(G\) and
taking \(t\) to \(t'\). Apply the Fouxe–Rabinovitch generators listed
in Hatcher–Wahl §2. Factor automorphisms, inversion of \(t\),
partial conjugation of \(t\) by an element of \(G\), and left or right
multiplication of \(t\) by an element of \(G\) all preserve the given
form and preserve \(G\) setwise. There is no factor permutation.
Partial conjugation of \(G\) by a power of \(t\) is inner, since that
inner automorphism fixes \(t\). These statements show the asserted
form up to inner automorphism. An inner conjugation between two
representatives both preserving \(G\) has conjugator in \(G\), by
malnormality of a nontrivial free factor. This gives the stated form
for the actual \(t'\).
[Grushko uniqueness as stated in Diao–Feighn, Theorem 1.1](https://msp.org/gt/2005/9-4/gt-v9-n4-p02-s.pdf)
· [Hatcher–Wahl, §2, generator list](https://web.math.ku.dk/~wahl/HatcherWahl.3manifolds.pdf)

The trees dual to the respective lifted spheres in the universal
cover have vertices \(gG\) and edges from \(gG\) to \(gtG\), or
from \(gG\) to \(gt'G\), with \(g\in\Gamma\). For \(\varepsilon=1\)
match the new edge at \(g\) to the old edge at \(ga\); for
\(\varepsilon=-1\) match it to the reversed old edge at
\(ga t^{-1}\). This is a \(\Gamma\)-equivariant tree isomorphism.
Take matched oriented edges for lifts \(\widetilde T,\widetilde S\).
They cut the ends of the universal cover into the same two sets.
For a direct check, choose a point in each of the two lifted cut
regions with stabilizer \(G\). In one \(\Gamma\)-invariant lifted
metric their translates stay a uniformly bounded distance apart.
The choice of paired edges gives the same side for each pair of
translates, by its vertex label. Cocompactness lets points on any
proper ray be approximated within bounded distance by translates
of either chosen point. Far along the ray the approximation stays
on its side of either compact lifted sphere. Hence the end
partitions agree.

In the simply connected cover the oriented homology class of a
compact sphere is determined by its end partition. For example its
Poincaré dual in compactly supported degree-one cohomology is the
connecting image of the locally constant function on the end space
which is one on its positive side and zero on its negative side.
Thus \([\widetilde T]=[\widetilde S]\) in integral \(H_2\), and
Hurewicz gives homotopic lifts. Project to \(Z\) and use Laudenbach's
homotopy-implies-isotopy theorem for embedded 2-spheres (the
no-fake-ball hypothesis follows from the three-dimensional Poincaré
theorem). Isotopy extension then gives an ambient isotopy taking
\(T\) to \(S\). This compares embedded spheres in the filled
three-manifold and allows the knot and all actual collar marks to
be transported by that ambient isotopy.
[Hatcher–Wahl, proof of Lemma 9.1, on homology detected by ends](https://web.math.ku.dk/~wahl/HatcherWahl.3manifolds.pdf)
· [Laudenbach, *Topologie de la dimension trois*, Chapter III,
Theorem 1.3](https://www.maths.gla.ac.uk/~mpowell/Laudenbach-topology-in-3-dims-homotopy-and-isotopy.pdf)

## The actual slides and the remaining local problem

Use the ambient isotopy from \(T\) to \(S\) to move the full framed
tube of \(K\). Its endpoint misses \(S\). Keep the stationary surgery
core \(Q^*\) fixed as a comparison subset of \(Z\), and make the
moving core's path generic with respect to it. An endpoint
perturbation off \(Q^*\) can be supported off \(S\). The two-dimensional
track of the moving core is transverse to \(Q^*\times I\) in
\(Z\times I\) and has only finitely many intersections. On a compact
time interval away from these times, shrink the normal disks where
needed and identify the core complement with the original common
exterior by absorbing the punctured filling collar. Choose this
identification fixed near \(S\). At a transverse passage, the two
detours on either side differ by band summing the moving arc with a
meridian of \(Q^*\) in the local passage chart. In the unfilled
stationary torus that meridian is the specified \(\lambda_Q\).
The product strips at the crossing carry the actual normal disks
and turn this into a signed framed slide of \(K\) over \(Q\) in
\(Y_1\). Reversing the order and time direction gives the inverse
isotopies and slides. This is the core-passage move used in the
proof of GST Proposition 3.2. It requires a filled-level isotopy
and the actual stationary framing, both available here.
[Gompf–Scharlemann–Thompson, §2, Lemma 2.1 and Proposition 3.2,
pp. 2308 and 2313–2314](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf#page=9)

The returned moving tube and \(Q\) lie off the fixed seam in
\(S^2\times I\). Cap both boundary spheres by balls. Choose a thin
connecting arc between the two caps avoiding the tubes and take a
regular neighborhood of the caps and arc. Two balls joined by a
single 1-handle form a ball. Smooth Schoenflies gives a ball on the
other side of its rounded boundary, lying in the cut slab and
containing the two tubes with their actual markings. The pair now
has outlet \(Y_1\#N\), where \(N\) is its capped \(S^3\)-surgery.
Since the outlet comparison is induced by the marked isotopies and
slides, \(Y_1\#N\cong Y_3\), and hence \(N\cong Y_2\). The two
diagonal framings and mutual linking of the capped link vanish by
its full-rank free integral surgery homology.
[Hatcher, Chapter 1, smooth Schoenflies and prime decomposition](https://pi.math.cornell.edu/~hatcher/3M/3M.pdf)
· [GST, Proposition 2.2, p. 2310](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf#page=6)

For the marked trace let \(d\) be the induced outlet map. Propagate
each later attaching chart \(e\) by \(de\), with inverse
\(e^{-1}d^{-1}\) on its image, and extend by the identity in its
transported handle model. The final map \(\widehat d\) changes the
outer closing \(\gamma\) to \(\gamma\widehat d^{-1}\), with inverse
\(\widehat d\gamma^{-1}\). No stabilization enters the localization.
For an immediate standard rank-three cap and a lower split zero
handle \(A\), suppose the supplied product marking has the actual
dual of \(A\) meeting the seam once and missing \(Q\). Move the
returned tube slightly off that dual, still off the seam. Use the
cut dual arc as the connecting arc in the preceding construction.
The resulting ball pulls back to the initial \(S^3\) exterior of
\(A\) by inverse filling, so the original (A) becomes a separate
split zero attachment before closing. The cap extension of
Laudenbach–Poénaru then matches its product sphere to one belt of
the reversed upper body, and the one dual intersection gives a
2/3 cancellation. The remaining counts are \((0,2,2)\) and the
remaining local capped pair carries the actual rank-two closing.
The argument leaves its Property 2R problem open in general. With
unspecified later residual handles the conclusion is a relative
localization of the two-handle block.
[Laudenbach–Poénaru, proof of Theorem A](https://www.numdam.org/item/10.24033/bsmf.1741.pdf#page=6)
· [Milnor, handle cancellation, Theorem 5.4](https://webhomes.maths.ed.ac.uk/~v1ranick/surgery/hcobord.pdf#page=53)

The ambient isotopy in \(Z\) does not give a sphere disjoint from
\(Q^*\) together with \(K\) in a genuinely nonlocal example. If
such a common sphere existed, shrink the two tubes off it and
pull it from the complement of the two cores back to \(Y_1\).
Its nonseparation persists under the inverse torus filling, since
the connected cut complement remains connected. A nonseparating
sphere in \(Y_1\) cuts to \(S^2\times I\), and the same cap-joining
construction would put the initial pair in a ball. This contradicts
the [nonlocal cyclic-lift witnesses](ALTERNATING_CLASP_RETURN.md#detecting-the-two-stationary-lifts).
The localization acts on the framed trace by the slides above.
The sphere existence proof leaves the number of slides and their
metric cost undetermined.
