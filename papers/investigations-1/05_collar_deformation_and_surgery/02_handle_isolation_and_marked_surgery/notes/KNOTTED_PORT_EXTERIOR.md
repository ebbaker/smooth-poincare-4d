# A peripheral band with a knotted opposite return

26 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. SUR-B04 / bounded SUR-E02r,
[issue 1](../../research-progress/handoffs/KNOTTED_COMPLETION_ISSUE_20261126.md).
The issue routes this calculation to GPT-6.2 Sol/ultra. Independent serving
model and effort telemetry was unavailable. Scientific intake
`4da586548b445ccfe9145c6a5671c0f7ecd433f3`. The calculation concerns one smooth,
oriented, integrally framed pair with parametrized tubes in the rank-one inlet.

## The exact local link

Write \(Y_i=\#_i(S^1\times S^2)\). The inlet \(Y_1\) is the actual zero surgery
level of the initial split unknot \(A\) attached to \(D^4\). In a ball \(B\)
in the surviving \(S^3\) exterior, use the placement of \(L_{4,1}=Q\cup V_4\)
from Gompf–Scharlemann–Thompson (GST). Figure 1 gives the joint diagram in
\(S^3\). Figure 19 gives the same joint diagram in surgery notation after
the two bracketed ambient surgeries, with \(n=4\) and \(k=1\). The two
unbracketed circles are the attachments. GST §7 identifies the boundary
of their joint surgery as \(Y_2\) from the dual construction. By GST
Proposition 2.2 the two surgery coefficients and mutual linking are zero.
[GST, §1 and Figure 1, p. 2306](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-p.pdf#page=2) ·
[§2, Proposition 2.2, pp. 2310–2311](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-p.pdf#page=6) ·
[§7, Figures 9–13 and the passage following Question 2, pp. 2328–2332](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-p.pdf#page=24) ·
[§10, Figures 18–19, p. 2344](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-p.pdf#page=40)

Independently of the winding fixture, GST §1 identifies the second
component in Figure 1 as the connected sum of an \((n,n+1)\) torus
knot and its mirror. The positive spiral uses the cyclic \(n\)-strand
braid \(\delta=\sigma_1\cdots\sigma_{n-1}\) with a full twist
\(\delta^n\), giving the \((n,n+1)\) closure. The other spiral and its
full twist have the mirror handedness. The two joining arcs sum the
two knots after forgetting \(Q\). Thus
\(V_4=T(4,5)\mathbin{\#}\overline{T(4,5)}\) as a knot. GST §7 identifies
the same component after blowing down the bracketed circles.
Scharlemann §1, Figures 1–4, gives the diagram passage from GST Figure
12(d) to Figure 1, including the positions of both components. This is
the specified opposite return's completion in the marked ball.
[GST §1, Figure 1, and §7, Figure 13](https://arxiv.org/pdf/1103.1601#page=2) ·
[Scharlemann, *Proposed Property 2R counterexamples classified*, §1](https://arxiv.org/pdf/1208.1299#page=3)

## The band from the observed return

Cut \(Y_1\) at the specified horizontal sphere, writing the slab as
\(W=S^2\times[-1/2,1/2]\), with faces \(S_-\) and \(S_+\). Let \(R\) be
the moving lower return that follows the stationary longitude with a
gap, \(V\) the upper return that follows the cut-open \(V_4\), and \(K\)
their union after gluing. The marked short chord joining the two port
points has copies \(c_-\) and \(c_+\) on the respective faces. Take the
stationary tube chart \(q(s,r,\theta)\), with \(s\in\mathbb R/\mathbb Z\)
and boundary \(r=r_0\). In the chosen azimuth \(\theta_0\), \(R\) follows
\(\lambda_{r_1}=q(s,r_1,\theta_0)\) for \(r_1>r_0\) away from a short
open interval \(G\) and takes the two product rails to \(S_-\). Here
\(\lambda_{r_0}\) is the actual zero surgery slope of \(Q\).

In each transverse disk of the thin lower product box, the straight
interval
\[
  (1-u)z_0(v)+u z_1(v),\qquad 0\le u\le 1,
\]
between the two observed rails \(z_0(v),z_1(v)\) gives an embedded
rectangle \(C_-\) with ends \(\lambda_{r_1}|_{\overline G}\) and \(c_-\).
The transverse disks are disjoint at distinct box parameters \(v\).
At the mouth the box points out of the stationary collar, so \(C_-\)
meets the radial strip only along its short end. For the upper box the
same interval rule gives a rectangle \(C_+\) from \(c_+\) to the short
deleted subarc of the actual \(V_4\). The two product boxes follow the
disjoint access intervals at the two mouths and then the opposite
corridors of the slab. In \(B\) the access intervals start in local mouth
charts and otherwise run in the link exterior, with the upper box
outside the stationary collar. Small box widths make the interiors
disjoint from all other strands and each other. In particular pushing
the closed upper return across \(C_+\) restores \(V_4\) by an isotopy
in the complement of the stationary tube. Its endpoint is the actual
original strand in \(B\), with the rest of \(V_4\) in place. This
preserves the joint local diagram.
[Product boxes and the marked two-point cut](CUT_TANGLE_RECOVERY.md#the-framed-cut-tangle)

Join \(C_-\) to the radial annulus
\[
 \mathcal A_0=\{q(s,r,\theta_0): r_0\le r\le r_1\}.
\]
Their seam is the interval \(\lambda_{r_1}|_{\overline G}\).
After rounding, \(\mathcal A=\mathcal A_0\cup C_-\) is an embedded
annulus from \(\lambda_{r_0}\) to \(R\cup c_-\) in the stationary
exterior. Its interior misses the two moving arcs and the faces.
Choose a short closed interval \(I\subset S^1\setminus\overline G\)
on the exposed longitude, away from the two access boxes. For
\(r_0<r'<r_1\) the rectangle
\[
 D_I=\{q(s,r,\theta_0):s\in I,\ r'\le r\le r_1\}
\]
is an observed band from \(R\) to the marked parallel \(\lambda_{r'}\).
Use the orientation on that parallel opposite to the completed return
under \(\mathcal A\). Truncate \(\mathcal A\) at \(r=r'\) and cut out the
interior of \(D_I\), including its two attaching intervals in the
annulus boundary. The remaining annulus cut open along the band is a
disk. Its boundary consists of the band-summed return and \(c_-\).
In particular its interior lies in the unfilled exterior and avoids
\(V\). Pushing across the disk to a short collar push-off of \(c_-\),
regluing the faces, and pushing across \(C_+\) gives the two
local components \(Q,V_4\) in their given relative position. The
pushes on the arcs can be made in product normal neighborhoods before
smoothing the glued seam. They leave \(Q\) and its framed chart fixed
and carry the full moving tube. This construction derives the band
from the tube, longitude and cut, using no supplied slide.
[Slit annulus and returned relative tube](CUT_TANGLE_RECOVERY.md#peripheral-annulus-and-a-local-band)

Both original cores are null-homotopic in the inlet. For \(K\), either
follow the two rails in opposite directions around the generator, or
use the closed lift below. The longitude class of \(Q\) is zero in
the complement of \(Q\), as is \([V_4]\) there by the vanishing local
linking. As cycles in that complement, \(R\cup c_-\) and \(V\cup c_+\)
with opposite chord orientations add to \(K\). The lower closed arc
is homologous there to the stationary longitude up to sign, and the
upper arc is homologous to \(V_4\) up to sign. Consequently
\(\operatorname{lk}(K,Q)=0\). Linking is integral in this calculation
because both cores are null-homologous. The input coefficient of \(K\)
is zero in the Seifert convention. The band uses the actual zero
parallel of \(Q\), so the subtraction slide carries coefficient
\(f_K+f_Q-2\operatorname{lk}(K,Q)=0\). This formula follows by taking
the self-linking of the oriented band sum against its framed push-off.
In the final ball the transported tube therefore equips the exact
returned \(V_4\) with its zero longitude. If the local tube is written
in different zero-framed coordinates, the identification uses the
transported parametrization. The slide yields the outgoing type
\(Y_1\#Y_2=Y_3\) because the returned pair is supported in \(B\).
[GST, §2, the framed slide and its interpretation after filling, pp. 2308–2309](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-p.pdf#page=4)

## The cyclic cover

Lift \(B\) to balls \(B_j\subset S^2\times\mathbb R\) centered at integer
heights and compactify the two ends to \(S^3\). Index the moving lift
\(\widetilde K\) so it uses the cut-open \(V_4\) in \(B_0\) and the
cut-open \(Q^+\) in \(B_1\), where \(Q^+\) denotes the marked parallel.
The two period rails join these ends and the lift is closed. The
sphere at height \(1/2\) crosses the two rails once each. Capping
each return by the same chord in this sphere and reversing the product
box pushes gives \(V_4\) and \(Q^+\) in their respective half-balls.
Thus the unoriented type of \(\widetilde K\) is \(V_4\#Q\). All
other \(B_j\) miss \(\widetilde K\).

The local \(Q\cup V_4\) is nonsplit. A splitting sphere would give
\(S^3_0(Q)\# S^3_0(V_4)=Y_2\), so by uniqueness of prime decomposition
and the first Betti number one of each zero surgery, both factors
would be \(Y_1\). This contradicts Property R for the nontrivial
square knot. Each of \(\widetilde K\cup Q_0\) and
\(\widetilde K\cup Q_1\) is then nonsplit. At \(0\) the middle sphere
exhibits the first pair as \(Q\cup V_4\) with a local \(Q^+\) tied into
\(V_4\). At \(1\) it exhibits the second pair as \(Q\cup Q^+\) with a
local \(V_4\) tied into \(Q^+\). The pair \(Q\cup Q^+\) is nonsplit
because its spanning annulus would meet any splitting sphere in a
circle essential on the annulus, making \(Q\) isotopic to an unknot
on the sphere. Tying a local knot into one component preserves
nonsplitting. To see this, put a putative splitting sphere transverse
to the boundary of the ball meeting only the tied arc. An intersection
circle essential on that twice-punctured boundary would have linking
number \(\pm1\) with the modified knot, but it bounds a disk in the
splitting sphere disjoint from the knot. The remaining intersection
circles can be removed by surgery along innermost puncture-free disks
in the ball boundary. At each step keep a sphere that still separates
the components, as shown by the mod-two intersections of a path from
one component to the other. The resulting splitting sphere lies
outside the tied-arc ball and would separate the original pair.
[Milnor, *A Unique Decomposition Theorem for 3-Manifolds*, Theorem 1](https://doi.org/10.2307/2372800) ·
[Gabai, *Foliations and the topology of 3-manifolds III*, Corollary 8.3](https://doi.org/10.4310/jdg/1214441488) ·
[GST, Theorem 1.1](https://arxiv.org/pdf/1103.1601#page=1)

For every other index \(j\), \(\partial B_j\) splits
\(\widetilde K\cup Q_j\). Hence the nonsplit support is exactly
\(\{0,1\}\). If \(K\cup Q\) lay in a common ball, the lift of that ball
containing \(\widetilde K\) would contain only one stationary lift,
contradicting the support. The support is invariant up to translation
and reflection of the indices under changes of lift and marked inlet
diffeomorphisms. Such diffeomorphisms lift properly, so splitting is
preserved by moving each test sphere off the two ideal endpoints
before mapping it. In particular a transverse nonseparating sphere
missing \(Q\) has at least two intersections with \(K\). A sphere
missing both would give consecutive cut regions in the cyclic cover,
with \(\widetilde K\) entirely in one region, allowing nonsplit
support at only one stationary lift. The algebraic intersection is
zero, and the marked horizontal sphere attains two geometric points.
[Cyclic support and stacking](LIFTED_LINKS_AND_SPHERES.md)

The earlier local Figures 5–6 controls lie in a common ball. The
previous wound Figure 5 examples of winding \(n>1\) have nonsplit
stationary support of index distance \(n\). At one period the
index distance agrees, and the lifted knot distinguishes the
examples. For \(p,q>0\) coprime the Alexander polynomial of \(T(p,q)\)
is, up to a unit,
\[
 \frac{(t^{pq}-1)(t-1)}{(t^p-1)(t^q-1)}.
\]
For example, the group presentation \(\langle x,y\mid x^p=y^q\rangle\)
from the splitting torus gives this expression by the Alexander
matrix, using \(x\mapsto t^q,\ y\mapsto t^p\). Mirroring inverts \(t\),
and the Seifert matrices sum in blocks under connected sum, so the
breadths add. A trefoil has breadth \(2\), \(T(4,5)\) has breadth
\(12\), and \(Q,V_4,\widetilde K\) have breadths \(4,24,28\),
respectively. In the previous wound Figure 5 examples both lifted
components have breadth \(4\). Even with components unmarked, the
lifted knot types distinguish those examples from the new one.
[Prior winding family](LIFTED_LINKS_AND_SPHERES.md) ·
[Local Figure 6 control](GST_PAIR_MOVE.md)

## The two original single-prefix tests

For \(J=Q\) and \(J=K\), let \(Z_J\) be the actual zero surgery of
\(J\) in \(Y_1\). Both have \(H_1(Z_J;\mathbb Z)=\mathbb Z^2\).
Indeed the exterior of \(J\) has first homology generated by the
ambient \(\mathbb Z\) and the meridian, and filling the null-homologous
slope given by the zero longitude leaves those generators. The
actual prefix is \(X_J=D^4\cup h_A^2\cup h_J^2\). It is simply
connected and \(H_2(X_J)=\mathbb Z^2\) by the handle chain complex.
Poincaré–Lefschetz duality and the pair sequence identify the
intersection map \(H_2(X_J)\to H_2(X_J,Z_J)\) as zero because its
cokernel \(H_1(Z_J)\) is free of rank two. The inclusion
\(H_2(Z_J)\to H_2(X_J)\) is an integral isomorphism.

If a closed oriented positive-scalar-curvature three-manifold mapped
to \(Z_J\) with nonzero degree, the PSC domination decomposition
would give \(Z_J=Y_2\#\Sigma\), with \(\Sigma\) a connected sum of
integral homology spherical space forms. Each nontrivial such
summand is an oriented Poincaré sphere. Attaching two 3-handles to
\(X_J\) along the two product spheres of that decomposition removes
the free factors on the boundary. The two attaching classes form
an integral basis of \(H_2(X_J)\), so the smooth filling of
\(\Sigma\) is acyclic and simply connected, hence contractible.
Chodosh–Maximo–Mukherjee Proposition 4.2 forces \(\Sigma=S^3\).
Thus PSC domination would give \(Z_J=Y_2\).
[Chodosh–Maximo–Mukherjee, arXiv:2407.05574v1, Proposition 2.2, Corollary 2.3 and Proposition 4.2](https://arxiv.org/pdf/2407.05574v1)

In fact \(Z_J\ne Y_2\) in both orders. The nonmeridional single-knot
surgery theorem for \(Y_k\to Y_{k'}\), \(k'\ge k\), would give a
local unknot at \(k=1,k'=2\). Its spanning disk would lift to the
compactified cyclic cover. The lifts have types \(Q\) and \(V_4\#Q\),
whose Alexander breadths rule out a disk. Both original
single-prefix levels therefore fail PSC domination. The same
spanning-disk obstruction gives failure of a compression of either
actual longitude in the original common exterior, since such a
compression would give a disk for the core by adjoining its tube
annulus. No metric was chosen on a physical cut in this test.
[Meier–Schirmer–Zupan, Theorem 5.1, preprint pp. 9–10](https://arxiv.org/pdf/1507.06561#page=9)

The same single-prefix obstruction applies to the returned local
pair. The \(Q\)-first level is unchanged by the moving slide. For the
\(V_4\)-first level the same homology and compression argument applies,
and the lift of this local knot has Alexander breadth \(24\).
The radial slide therefore yields a joint local link with a free
outlet and no PSC-dominated single prefix.

## Verification scope

Primary inspection covered the GST published text for the indicated
passages, the authors' arXiv page images of Figures 1 and 19, Scharlemann's
diagram comparison text, the Meier–Schirmer–Zupan single-knot theorem,
and the cited Chodosh–Maximo–Mukherjee passages. The returned geometric
move carries the marked joint integral link. The next step concerns
the smooth replacement for that returned trace in the marked ball.

| Input | SHA-256 prefix |
| --- | --- |
| [Issue 1](../../research-progress/handoffs/KNOTTED_COMPLETION_ISSUE_20261126.md) | `c8368156e307` |
| [One-period two-point cut](CUT_TANGLE_RECOVERY.md) | `5a5b08d61702` |
| [Several-turn product ports](PORTS_THROUGH_SEVERAL_TURNS.md) | `9d0de8d2ce65` |
| [Cyclic cover](LIFTED_LINKS_AND_SPHERES.md) | `6325b628f09a` |
| [One-turn band](GENERATOR_BAND_PAIR.md) | `e88a6a83dd98` |
| [GST control](GST_PAIR_MOVE.md) | `4b6467e4c2b3` |
| [Prior assessment](../../reviews/EXTERIOR_RECOVERY_AND_CORE_RETENTION_20261126.md) | `a2ea8af27626` |
| [Incoming surgery draft](../manuscript/recognition_from_marked_handle_cuts.tex) | `62a3caecf3fb` |
