# E162 — Topology of a supplied smooth ALE core

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E packet under [B82][b82]. Configured
`gpt-6.2-sol` / `ultra`. Independent runtime attestation and actual lead
settings are unavailable. I authored the related E154 metric-source
audit and E158 topology audit. Neither is a proof input here. I did
not author B82 or E160. The [request][req] and its three input digests
were verified and are recorded in the [return][ret].

## Statement

Let \(X\) be a connected, complete, smooth oriented Riemannian
four-manifold that is nonflat, Ricci-flat, anti-self-dual
(\(W^+=0\) for the chosen orientation), and ALE in the sense of
Wright §2. Let \(K\) be a smooth compact truncation of its end.
There is no orientation-preserving smooth embedding \(K\to\Sigma\)
into a closed connected smooth oriented integral homology
four-sphere \(\Sigma\). The same holds for a full smooth compact
core with a product complement. A smooth homotopy four-sphere
satisfies the ambient hypothesis.

Wright's ALE end has a diffeomorphism to the exterior of a ball
in \(\mathbb R^4/\Gamma_\infty\), with \(\Gamma_\infty<SO(4)\)
finite and free on \(S^3\), and derivative decay of the metric
in lifted coordinates of positive order. A sufficiently large
regular radial section is \(Y=S^3/\Gamma_\infty\).
The exterior is a product with \(Y\) as its section, so \(K\) is
connected and \(X\) deformation retracts to \(K\) by collapsing
the end radially. Changing its large truncation radius attaches
or removes a product collar. Here a full core with product
complement means a smooth compact codimension-zero submanifold
whose whole exterior with boundary is a product on \(\partial K\).
Because \(X\) has one end, this boundary is connected. Collapsing
that product gives the same homotopy equivalence. Its boundary
has fundamental group \(\Gamma_\infty\) by the cofinal argument
below. [Wright v2, §2 including Remark 2][wright].

### Comparing product ends

Two product descriptions give cofinal systems of connected tails.
Choose nested tails \(A_1\supset B_1\supset A_2\supset B_2\),
where the \(A_i\) come from one product and the \(B_i\) from the
other. Use one basepoint in \(B_2\). Each same-system inclusion
induces an isomorphism on fundamental groups. Hence the map
\(\pi_1(A_2)\to\pi_1(B_1)\) is injective by the composition
to \(\pi_1(A_1)\) and surjective by the composition from
\(\pi_1(B_2)\). This identifies the fundamental groups of their
sections. Only cofinality and the product inclusions are needed.

## Integral calculation for the two sides

Suppose there is an embedding and write \(U\) for the image of \(K\),
\(Y=\partial U\), and \(V=\overline{\Sigma\setminus U}\). The
embedding and smooth collars make \(V\) a compact manifold with
boundary \(Y\) of opposite boundary orientation. The exterior
collar of the connected \(Y\) lies in a single component of
\(\Sigma\setminus U\). Every exterior component must have a
point of \(Y\) in its closure, since otherwise it would be
open and closed in the connected \(\Sigma\). Near such a
point the exterior in a collar chart is connected and lies in
the exterior collar. Thus every exterior component is the same
one, and \(Y\) separates into the two connected sides \(U,V\).

Use integral (co)homology in this calculation. Since \(\pi_1(Y)\)
is finite, \(H_1(Y)\) is finite. Closed oriented three-dimensional
duality and the universal coefficient theorem give
\[
 H_2(Y)\simeq H^1(Y)\simeq\operatorname{Hom}(H_1(Y),\mathbb Z)=0 .
\]
Mayer–Vietoris, using open thickenings by collars, gives
\[
 H_2(U)\oplus H_2(V)=0,\qquad
 H_1(Y)\xrightarrow{\ \cong\ }H_1(U)\oplus H_1(V).
 \tag{1}
\]
For the first equation the terms on either side of \(H_2(U)\oplus
H_2(V)\) are \(H_2(Y)=0\) and \(H_2(\Sigma)=0\). For the
second the adjacent terms are \(H_2(\Sigma)=H_1(\Sigma)=0\).
Both first homology groups on the right are finite. Projection
in (1) makes \(H_1(Y)\to H_1(U)\) surjective, with kernel
isomorphic to \(H_1(V)\). The exact sequence of \((U,Y)\)
identifies this kernel with \(H_2(U,Y)\) because \(H_2(U)=0\).
The integral Poincaré–Lefschetz duality and universal coefficient
isomorphisms give
\[
 H_2(U,Y)\simeq H^2(U)
 \simeq\operatorname{Ext}^1_{\mathbb Z}(H_1(U),\mathbb Z).
 \tag{2}
\]
The \(\operatorname{Hom}(H_2(U),\mathbb Z)\) term is zero.
For a finite abelian group the Ext group in (2) is isomorphic
to the group itself by its cyclic decomposition. Combining
(1)–(2) gives the abstract isomorphism
\[
              H_1(Y;\mathbb Z)\simeq G\oplus G,
             \qquad G=H_1(U;\mathbb Z).
 \tag{3}
\]
If \(G\) is nontrivial, the exponent of \(G\oplus G\) is
the exponent of \(G\), at most \(\lvert G\rvert\) and
strictly below \(\lvert G\rvert^2\). Therefore \(H_1(Y)\)
cannot be nontrivial cyclic. This uses the group structure.

## Positive second Betti number

Since \(X\) retracts to \(K\), \(b_2(X)=b_2(K)\). Positive
\(b_2(K)\) already contradicts (1). The corresponding
intersection obstruction can be seen directly. The finite
\(\pi_1(Y)\) gives \(H_1(Y;\mathbb Q)=H_2(Y;\mathbb Q)=0\),
so \(H_2(K;\mathbb Q)\to H_2(K,Y;\mathbb Q)\) is an
isomorphism. Pair duality and rational universal coefficients
make the resulting rational intersection form nonsingular and
symmetric. A nonzero such space has a vector with nonzero
self-pairing by polarization. After clearing denominators this
gives an integral homology class \(a\) modulo torsion. Wright
also identifies the form as negative definite in the given
orientation. [Wright v2, §2 and Remark 3][wright].

Let \(\alpha\) be the real relative degree-two dual of \(a\).
The collar identifies \(H^2(K,Y;\mathbb R)\) with compactly
supported degree-two cohomology of \(\operatorname{int}K\).
Choose a closed smooth compactly supported form there representing
\(\alpha\). Under the orientation-preserving embedding its
extension by zero is a smooth closed form on \(\Sigma\). Its
square integrates to the same value as the square on \(K\),
namely the nonzero self-intersection of \(a\). Its cohomology
class on \(\Sigma\) is zero because \(H^2(\Sigma;\mathbb R)=0\),
so the square integral on \(\Sigma\) is zero by Stokes' theorem.
This proves the needed preservation and contradiction at the
level of homology classes. No embedded surface representative is
required.

## Zero second Betti number

### The classified cover and its circle action

If \(X\) is simply connected, its restricted \(SU(2)\) holonomy
is its full holonomy. Wright §2 applies the hyperkähler ALE
classification and describes the intersection lattice by the
exceptional curves of the minimal resolution. The nontrivial
finite groups in Table 1 give positive \(b_2\). The trivial
case is the one-monopole Gibbons–Hawking space, which is flat
as recorded in §8. Consequently the supplied nonflat \(X\)
with \(b_2=0\) is non-simply-connected.
[Wright v2, §2 with Table 1 and §8][wright].

Theorem A identifies such \(X\) as an isometric quotient of
its simply connected Gibbons–Hawking cover \(\widetilde X\)
by the finite cyclic deck group \(D=C_d\), \(d>1\). Write \(k\)
for the number of monopoles. The deck action covers rotations
in \(\mathbb R^3\) about the common center used in §7.2 and
preserves the circle generator \(\partial_\theta\). The
generator preservation is asserted in the proof of Theorem A.
For \(k=2\) the proof first conjugates the action to one preserving
the Gibbons–Hawking circle direction up to sign. For both
\(k=2\) and \(k>2\), a nonidentity deck element reversing
the direction would reverse the circle over a fixed base
point and hence have a fixed point on that fiber. A fixed
monopole would itself give a fixed point on the cover. Freeness
therefore leaves the positive sign. In this circle presentation,
every deck transformation commutes with the principal \(S^1\)
action. [Wright v2, Theorem A and §§7.1–7.2][wright].

### The end group

Use the circle presentation just described and take \(R\) so that all
monopoles lie strictly inside \(S_R^2\). The bundle
\(\widetilde Y_R=\pi^{-1}(S_R^2)\to S_R^2\) has Chern
number \(-k\) for outward sphere orientation. In fact the outer
sphere is homologous to the sum of small outward spheres in the
punctured ball, and the Chern number is \(-1\) on each by
Theorem 2. The homotopy sequence of the circle bundle has boundary
map \(\pi_2(S^2)=\mathbb Z\to\pi_1(S^1)=\mathbb Z\) given
by the Chern number up to sign, as seen by clutching the two
hemisphere trivializations. Since \(\pi_1(S^2)=0\), it follows
that \(\pi_1(\widetilde Y_R)=C_k\), generated by the oriented
fiber loop. [Wright v2, §7.1 Theorem 2][wright].

The sections are invariant under \(D\). They give a product
description outside radius \(R\) by lifting the radial vector
field using a \(D\)-invariant circle connection. Such a connection
is obtained by averaging over \(D\), since the elements commute
with the circle, and flow between finite radii exists on the
compact bundles over closed annuli. These products exhaust the
end. Indeed the preimage of a compact base region is compact
away from the monopoles. Near each monopole the metric in
Theorem 2 has \(V\) comparable to the inverse of the base
distance \(s\) to that point. A horizontal radial lift has
length bounded by a constant times \(\sqrt{s}\) down to the
single added point, and the circle lengths are also bounded by
a constant times \(\sqrt{s}\). The completed preimage of a
closed ball is therefore compact. The invariant product descends
to \(X\) and the product-end comparison identifies
\(\pi_1(Y_R)\), for \(Y_R=\widetilde Y_R/D\), with
\(\Gamma_\infty\). In particular the connected regular cover
\(\widetilde Y_R\to Y_R\) yields
\[
           1\longrightarrow C_k\longrightarrow\Gamma_\infty
                  \longrightarrow C_d\longrightarrow1.
 \tag{4}
\]
This realizes Wright's Proposition 1 in the actual circle
presentation and identifies a generator of the kernel.
[Wright v2, §3 Proposition 1 and §§7.1–7.2][wright].

The kernel in (4) is central. A representative loop in \(Y_R\)
lifts to a path \(\lambda\) in \(\widetilde Y_R\) between
a point and its image under some deck transformation. The
transformation sends the positive fiber loop at the first point
to the positive fiber loop at the second because it commutes
with \(S^1\). The cylinder of loops
\((z,t)\mapsto z\cdot\lambda(t)\), \(z\in S^1\), transports
one fiber class to the other under the same change of basepoint.
This is precisely the covering-space conjugation action on the
kernel and fixes its generator. Lift a generator of the cyclic
quotient \(C_d\) to \(t_0\in\Gamma_\infty\). Every element
of \(\Gamma_\infty\) is a product of a power of \(t_0\)
and a central kernel element, so \(\Gamma_\infty\) is abelian.

Any finite abelian subgroup of \(SO(4)\) acting freely on \(S^3\)
is cyclic. Its commuting unitary matrices on the complexified
representation admit a common eigenvector, yielding a
character \(\Gamma_\infty\to S^1\). An element in the
kernel fixes that complex vector, hence fixes its nonzero real
or imaginary part, and therefore fixes a point of \(S^3\).
Freeness makes the character injective. Its finite image in
\(S^1\) is cyclic. Thus \(\Gamma_\infty=C_{kd}\) by (4),
and \(H_1(Y;\mathbb Z)\) is the same cyclic group for any
full product core.

Finally, Table 1 gives \(\chi(\widetilde X)=k\) from its
cyclic end group of order \(k\). Remark 3 gives
\(\chi(X)=1+b_2(X)=1\). The \(d\)-sheeted cover multiplies
Euler characteristic by \(d\): lift the deformation retraction
to \(K\) to its finite cover and count cells in finite CW
structures. Hence \(k=d\), and
\[
           H_1(Y;\mathbb Z)\simeq C_{d^2},\qquad d>1 .
 \tag{5}
\]
This contradicts (3) and completes the zero-\(b_2\) case.
In §8's proof of Corollary B, the phrase “\(k-1\) monopoles”
is inconsistent with its formulas and §7.1. Here \(k\) counts
the points of the ansatz, and \(k-1=b_2(\widetilde X)\).
The proof uses the bundle and Table 1 directly.
[Wright v2, Table 1, Remark 3 and Corollary B proof][wright].

## Source and scope

Reopened Evan P. Wright, *Quotients of gravitational instantons*,
arXiv:1102.2442v2, revised 29 April 2011, on 22 November 2026.
The versioned primary PDF text, HTML and metadata were accessible.
Selected passages are Theorem A (printed p. 1), §2 and Table 1
(pp. 2–3), §3 including Remark 3 and Proposition 1 and its
proof (pp. 4–5), §7.1 Theorem 2 and the description of the
circle action (p. 16), §7.2 including the \(k=2\) reduction
and free action argument (pp. 17–19), and §8 Corollary B's
proof (pp. 19–20). The publication metadata carried by R31
give *Annals of Global Analysis and Geometry* 41 (2012),
91–108, DOI 10.1007/s10455-011-9272-2. The published
edition was not used for theorem wording. One primary work,
zero discovery queries, no retained local reading copy.
[Version record][meta] · [PDF][wright] · [HTML][html] · [R31][r31].

The hyperkähler resolution and cyclic classification are Wright's
stated uses of Kronheimer [16]–[17]. The circle ansatz is Wright's
statement of Gibbons–Hawking [9]. The original papers were not
opened. Wright cites Bando–Kasue–Nakajima [2] for the ALE
coordinate upgrade and cover characterization. The topology proof
starts with the given smooth ALE end and uses no decay-rate upgrade
or original Bando–Kasue–Nakajima theorem. It uses the quotient
description in the forward direction and needs no classification
of spherical space forms, curvature energy threshold, or spin
or simple-connectivity premise on \(\Sigma\).
[Wright v2, §§2–3, §7 and references][wright].

The argument applies to a supplied smooth full core, including
any sufficiently large standard truncation. E160's analytical
extraction question persists. A regular subset of a singular
orbifold core, or a compact subset omitting part of the smooth
core, has no asserted topology here. The lemma supplies the
contradiction if extraction gives a smooth nonflat complete
Ricci-flat ASD ALE candidate and the indicated embedding.
[E160][e160] · [E160 assessment][e160a].

[req]: ../research-progress/handoffs/SP4-CME-E162_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E162_RETURN_v1.md
[b82]: ../brainstorm/notes/B82_ALE_CORE_TOPOLOGY_TEST_20261122.md
[e160]: ../reviews/E160_FOUR_DIMENSIONAL_NONCOLLAPSE_SOURCE_TEST_20261122.md
[e160a]: ../reviews/E160_NONCOLLAPSE_SOURCE_ASSESSMENT_20261122.md
[r31]: ../../../../references/SOURCE_NOTES_CME_CONTINUATION_COMPARISON_20261122.md#r31--wright-ale-quotients
[meta]: https://arxiv.org/abs/1102.2442v2
[wright]: https://arxiv.org/pdf/1102.2442v2
[html]: https://arxiv.org/html/1102.2442v2
