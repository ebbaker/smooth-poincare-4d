# SP4-CUT-TUBE-E09 · Independent replay of the marked exterior arguments

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance.
Actual helper model and reasoning effort are unavailable. The [frozen
request](../research-progress/handoffs/E09_REQUEST_R1.md) specifies a
bounded analytical reading at repository baseline
bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0. Read
[E03](../notes/E03_EQUALITY.md), SHA-256 beginning a7c4011f154029f4,
and [E05](../notes/E05_TWISTED_EXTERIORS.md), SHA-256 beginning
547b0e4385cc510a, with the relevant [parent Sections 5–6](../../manuscript/cuts_of_subcritical_conformal_classes.tex).
The convention is smooth oriented Riemannian four-manifolds, Hilbert–Schmidt
chiral norms, \(e_X=(E_++E_-)/2\), and \(T=4\pi^2\).

E03's zero-energy classification and both smooth fillings replay.
E05's positive-energy collapsing family, marked group computations and
sign obstructions replay. Its periodic filling construction supplies a
smooth effective circle action, and the general smooth recognition conclusion
uses the classification cited below. The strict inequality
\(0<e_X<\tfrac23T\) with positive double and trivial meridian quotient
still presents a separate recognition problem.

## Zero energy and the reflected double

1. Zero total Weyl energy forces both smooth Weyl components to vanish,
   including at the boundary. The contracted Bianchi identity makes Cotton
   vanish. The standard tractor connection is flat by Gover–Nurowski
   (3.4), (3.7), with the null pairing given by (3.2). Parallel transport on a
   contractible half-chart produces a smooth section up to the face. Its
   positive scale \(\sigma\) satisfies
   \(\nabla^2\sigma=-\sigma A-\rho g\) and \(2\sigma\rho+|d\sigma|^2=0\).
   In the given Schouten convention the transform by \(\sigma^{-2}\)
   has vanishing Schouten tensor. Together with \(W=0\) this gives a
   genuine smooth flat half-chart.
   [Gover–Nurowski, author preprint §§2.1, 3.1](https://www.esi.ac.at/preprints/esi1486.pdf)

2. Euclidean umbilicity gives constant principal curvature by Codazzi.
   A nonzero common curvature centers the supporting sphere at
   \(x-\kappa^{-1}\nu\), while zero curvature gives a plane. The local
   inversion used in E03 has its pole outside the half-chart. The flat-map
   calculation gives a Möbius extension of each one-sided transition,
   including the orientation-reversing maps. A pointwise fixation of a
   planar patch makes its conformal scale one on that patch. The
   nonconstant quadratic scale cannot satisfy that restriction, and a
   Euclidean isometry fixing the patch is either the identity or the
   reflection. This checks the gluing of reflected charts on overlaps.
   The reflected atlas carries a smooth invariant representative, and
   its normal collar realizes the smooth double of the original half.

3. The weak doubled Yamabe form and smooth doubled form have the same
   domain described as two \(H^1(X)\) functions with common trace.
   To compare representatives, use \(k=u^2g_0\) on the half, with both
   boundaries totally geodesic. The boundary transformation gives
   \(\partial_{\nu_{g_0}}u=0\). Integration by parts changes the numerator to
   that of \(uv\), with the boundary term
   \(-6\int_\Sigma uv^2\partial_{\nu_{g_0}}u=0\), and the denominator has
   the same multiplication law. This proves equality of the two
   infima without needing higher regularity of an identified weak metric.

4. Duality and the relative exact sequence give the rational
   isomorphism \(H_1(\Sigma)\to H_1(X)\), so the closed oriented double
   has \(b_1=1,\ \chi=0,\ b_2=0\). In the Hilbert–Schmidt convention,
   Chern–Gauss–Bonnet gives
   \(\int |W|_{\rm HS}^2+\frac12\int|Z|^2=\frac1{24}\int R^2\)
   here because \(\chi=0\) and \(W=0\).
   Corollary 1.3(iii) of Bour–Carron applies to this smooth positive
   class. Their proof in §7.2 yields a conformal product quotient.
   It uses the curvature-operator norm \(|W|^2=|W_{ijkl}|^2/4\).
   Their Remark 7.1 distinguishes the product scale from a Yamabe
   minimizer. The original Gursky theorem is unnecessary here.
   [Bour–Carron, published text, pp. 44–45 and 61](https://www.numdam.org/item/10.24033/asens.2238.pdf)

5. In the cylinder universal cover, removing \(0,\infty\) from the
   Möbius sphere identifies its conformal transformations with
   \((t,x)\mapsto(\pm t+c,Bx)\). The reflection lift fixing a chosen
   seam lift has order two and fixes that entire connected lift
   by path lifting. Its three-dimensional fixed locus is either
   a slice \(S^3\) for the negative sign or
   \(\mathbb R\times S^2\) for the positive sign. The former
   cannot cover \(S^1\times S^2\), since a compact cover has finite
   degree and \(S^3\) is simply connected. The latter is simply
   connected and all its deck translates meet it because great
   equators meet. Thus the seam has a single lift, its deck
   group is the full \(\mathbb Z\), and there is no finite kernel
   in the real-line projection. Properness gives finiteness of
   the kernel and torsion-freeness gives triviality. The translation
   generator preserves each half, since the two connected
   half-interiors project into different components of the seam
   complement. Ambient orientation then makes its action on the
   equatorial plane an element of \(SO(3)\).

6. The hemisphere quotient trivializes smoothly using any logarithm
   of the \(SO(3)\) rotation. Identity gluing to \(S^2\times D^2\)
   is the rounded product boundary \(\partial(D^3\times D^2)\).
   The rotating twist extends over \(S^1\times D^3\) by its
   rotation on each ball. Circle reversal and sphere antipodal
   reversal also extend over that side. Ding–Geiges §2,
   Proposition 2 and the split sequence preceding it give those
   three generators for all smooth boundary components. Hence
   both framings, and in fact every smooth boundary identification,
   give \(S^4\).
   [Ding–Geiges, journal text, §2](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/537877E89BFF957F24AF6F4C2E4E80D0/S0010437X09004606a.pdf/the-diffeotopy-group-of-s1s2-via-contact-topology.pdf)

## Collapse, peripheral group, and smooth action

For E05's collar set \(f'^2=y(f)\). The radial identity
\(R_h=2(1-y-vy')/v^2\) gives exactly
\(6-4a\chi/v+2a(1-v^2)\chi'/v^2\). On \(a\le v\le b\) it is at
least two, and on \(b\le v\le2b\) the two deviations from six
are bounded below by \(-1\) and \(-2\), strictly. At the splice
\(2ff''+f'^2\) tends from the curved side to \(1-a^2<1\).
The separately bounded \(f,f',f''\) and nonnegative convolution
preserve a strict margin on a small interval, and the paste
transition lies where the original solution is smooth. Thus the
invariant collar and its positive smooth double have the asserted
regularity. For the product \(dt^2+h\) a fibre Ricci eigenvalue
\(\rho_i\) yields \(-(\rho_i-R_h/3)/2\) on the mixed Weyl bivector
and on its complementary vertical bivector. This gives the stated
chiral energy identity with coefficient \(\ell/4\). The collar has
positive trace-free Ricci square \(2/(3a^4)\), which makes the
energy strictly positive. The constant Yamabe test is \(O(\sqrt\ell)\).
All these comparisons are analytic.

The rational homology of the punctured space form and the Wang
sequence give rational circle homology. In the surgery the entire
image of \(\pi_1(\Sigma)\) is killed, which is the normal closure
of the marked stable letter. The lens-space conjugation inverts
the scalar generator, fixes the indicated point, and preserves
orientation in real dimension four. For odd \(m>1\) the identity
and inversion quotients are respectively \(C_m\) and \(1\). The
latter case gives a homotopy sphere for both framings since
\(\chi=2\) and simple connectivity give integral homology
and homotopy of \(S^4\). Meanwhile the double has a finite-index
subgroup \((C_m*C_m)\times\mathbb Z\), so it contains
\(\mathbb Z^2\) and cannot be a compact cylinder quotient,
whose discrete deck group is virtually cyclic. Thus E05 refutes
topological rigidity close to equality even on the intended
meridian-killing examples. The identity example refutes the
literal unrestricted assertion omitting the meridian-killing
hypothesis.

An actual order-\(d\) punctured monodromy gives a translation
circle of period \(d\ell\), with no kernel by the definition of
\(d\). The averaged boundary metric uniformizes equivariantly.
In product coordinates the angular displacement is
\((d\theta,k\theta)\), and twisting the identification changes
only the sphere weight to \(k+jd\). The Cartesian extension
\((z,u)\mapsto(e^{id\theta}z,A_{(k+jd)\theta}u)\) is smooth.
Averaged collars extend that equivariance through the seam.
Hatcher's smooth homotopy-type result gives all markings
modulo factor signs and the twist. The two factor signs extend
over the cap, so every marking in this scope produces a smooth
effective action after the corresponding choice of filling
representative. The implication to standardness in the
homotopy-sphere case imports the Fintushel–Pao recognition
and three-dimensional Poincaré. I inspected Hatcher's main
corollary, Dinkelbach–Leeb Corollary 5.4(i) and Theorem E for
the invariant spherical representatives, and Plotnick's
Proposition 6.1 and proof sketch for the periodic construction.
Plotnick formulates that proposition for knots already in
\(S^4\). It corroborates the construction but by itself cannot
replace the general recognition implication. The full 1976 and
1978 recognition proofs were not available in this replay.
[E04 source receipt](../references/E04_SOURCES.md)
· [Hatcher, December 2003 revision](https://www.maths.gla.ac.uk/~mpowell/Hatcher-newDiffS1xS2.pdf)
· [Dinkelbach–Leeb, author version](https://www.math.lmu.de/~leeb/pub/act3mfs.pdf)
· [Plotnick, §6](https://scispace.com/pdf/equivariant-intersection-forms-knots-in-and-rotations-in-2-25sarw02x6.pdf)

Plotnick–Suciu §5, type II, independently confirms the based
automorphism with order-three action on \(Q_8\) and inversion
on \(C_m\), and distinguishes its marked realization from
periodicity. Its meridian quotient computation is immediate
from the quaternion multiplication and oddness of \(m\).
The later prism-\(P_7\) source was accessible here only at the
abstract level, which reports standardness of both example
framings. Neither historical classification passage is needed
for the analytic collar examples or for the sign obstruction.
[Plotnick–Suciu, pp. 523–524](https://deepblue.lib.umich.edu/bitstream/handle/2027.42/135209/jlms0514.pdf?sequence=1)
· [Jabłonowski, arXiv record](https://arxiv.org/abs/2609.29839)

## Sign obstruction and a regular variable-lapse extension

With coordinate \(t\) taken before division by \(\ell\), the
normal shape operator is \(K/\ell\). The normal Ricci and Gauss
equations give
\(R_{g_\ell}=R_{h_t}-\ell^{-2}(2H'+H^2+|K|^2)\).
For a fixed path pointwise nonnegativity along \(\ell\downarrow0\)
implies \(H'\le-H^2/2\) on complete suspension lines. A nonzero
value is incompatible with smooth continuation in one time
direction by the reciprocal inequality. Thus \(H\) and then \(K\)
vanish. For the quadratic form, integrating \(-2H'w^2\) against
\(dV_{h_t}\,dt\) gives \(4Hww'+2H^2w^2\) with no net endpoint
term; subtracting \(H^2+|K|^2\) leaves
\(H^2-|K|^2=2H^2/3-|K^\circ|^2\). This proves E05's exact square
identity. The invariant density choice annihilates the square,
and the positive factor gives a strict negative sign if
\(K^\circ\) is nonzero on an open set.

The same identity gives an additional restriction. On the smooth
doubled mapping torus of a **fixed** marked monodromy preserving
a smooth positive density \(\nu\), allow
\[
g_\ell=\ell^2N_{t,\ell}^2dt^2+h_{t,\ell},
\qquad N_{t,\ell}>0,
\]
with zero shift. Suppose \(k_{t,\ell}=N_{t,\ell}^{-2}h_{t,\ell}\)
is precompact in smooth metrics on the compact slab, with smooth
positive definite limits and matching endpoint jets. The same
claim allows a fixed smooth shift once straightening its flow
gives such a fixed marked monodromy and invariant density.
Conformal multiplication by \(N^{-2}\) leaves the sign of the
closed Yamabe form unchanged. Set \(q_\ell=dV_{k_{t,\ell}}/d\nu\).
Test on \(q_\ell^{-1/3}\) and use uniform boundedness of the
fibre scalar and gradient terms after taking a convergent
subsequence. Positive sign along such a subsequence gives
\[
\int |K^\circ_\ell|_{k_{t,\ell}}^2 q_\ell^{-2/3}\,dV_{k_{t,\ell}}dt
\le C\ell^2 ,
\qquad K_\ell=\tfrac12\partial_t k_{t,\ell}.
\]
The limiting \(K^\circ\) vanishes. Since
\(\partial_t(q_\ell^{-2/3}k_{t,\ell})=
2q_\ell^{-2/3}K_\ell^\circ\), the limiting normalized metric is
constant and preserved by the marked map. In the compact
abelian Lie group which is the closure of its powers, a point
in the identity torus can cancel the \(d\)-th power of the map
by taking a \(d\)-th root, where \(d\) is the component order.
This gives a periodic representative by a boundary-preserving
isotopy, retaining any boundary point fixed by the original
map. Thus genuinely nonperiodic marked classes cannot produce
the desired positive doubles by this smoothly precompact
variable-lapse collapse. No bound here controls degenerating
rescaled fibres or a varying marked shift.

## A further test using the meridional cohomology class

When the closing is a homotopy sphere, integral Mayer–Vietoris
gives \(H_1(\Sigma;\mathbb Z)\simeq H_1(X;\mathbb Z)\), since the
cap is simply connected. The meridional integral class
\(H^1(X;\mathbb Z)\) therefore has a relative dual in
\(H_3(X,\Sigma;\mathbb Z)\) whose boundary is the generator of
\(H_2(\Sigma;\mathbb Z)\), up to chosen sign. This also gives
a smooth representative by extending the boundary projection
to a circle-valued map and taking a regular value. Positivity of
the double can be carried to a smooth symmetric approximation
and its positive invariant first conformal-Laplacian eigenfunction.
On the half, a small conformal adjustment can then make the
totally geodesic boundary strictly mean convex while preserving
positive scalar curvature. This opens a relative minimizing
hypersurface test with the meridian kept in the data.

The preliminary test has a concrete limitation. Both E05 lens
examples admit a calibrated cross-section, since the closed form
\(dV_h\) descends, has comass one, and restricts to zero on the
exterior boundary. The fibres attain the relative mass bound and
have the same positive metric, yet the marked return maps on the
cut differ and their meridian quotients differ. For a general
marked exterior the relative class alone also allows disconnected
representatives and gives no product structure for the cut
four-dimensional cobordism. A new estimate would have to control
the topology of that cobordism and its marked return, or give a
marked smooth cancellation argument that bypasses the return.
No such estimate follows from the scalar-curvature stability
inequality on one section. This test leaves recognition in the
positive-energy range unresolved.

## Relative pinching and the post-surgery seam

I read the lead's [impasse](../brainstorm/notes/POSITIVE_ENERGY_IMPASSE.md)
and [relative pinching calculation](../notes/RELATIVE_PINCHING.md),
with SHA-256 prefixes a3ca55d35ad27def and bb1198397a7bc4f5e,
respectively. The relative coefficient checks as
\(36\cdot\tfrac23\cdot4=96\). The first factor is Chen–Zhu's
strict chiral eigenvalue criterion, the second the trace-free
three-dimensional matrix bound, and the third the full Weyl
integral on the reflective double in units of \(e_X\).
The strict inequalities survive the indicated smoothing and
Yamabe convergence. The orientable classification and
\(\chi(DX)=0\) leave one cylinder summand. If \(G=\pi_1(X)\)
properly contains the infinite cyclic peripheral image \(H\),
alternating the two copies of \(g\in G\setminus H\) gives
infinitely many distinct \(H\)-cosets in \(G*_H G\). An infinite
subgroup of a virtually cyclic group has finite index. Thus
\(G=H\) and the double is diffeomorphic to \(S^1\times S^3\) under
the stronger pinching. The absolute exterior budget and the
relative test remain genuinely different.
[Chen–Zhu, Theorem 1.4](https://www.intlpress.com/site/pub/files/_fulltext/journals/cag/2014/0022/0005/CAG-2014-0022-0005-a002.pdf)
· [Chen–Tang–Zhu, main classification](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/926-JDG-91-1-a2-che.pdf)

One can take a further marked step **under this stronger premise**.
Suppose \(DX\cong S^1\times S^3\) and a seam section
\(\gamma=S^1\times\{p\}\subset\Sigma\) represents its generator.
An equivariant normal tube is \(S^1\times D^3\), with reflection
across the equatorial \(D^2\). It is obtained by adjoining the
reflection's normal line to a trivialized normal two-plane
bundle of \(\gamma\) in \(\Sigma\). Do framed circle surgery,
replacing this tube by \(D^2\times S^2\) with reflection across the
equator of \(S^2\). On the fixed set this exchanges
\(S^1\times D^2\) for \(D^2\times S^1\).
The two boundary framings are obtained by the product marking
and by rotating the hemisphere around its axis once as the
circle parameter traverses \(S^1\). This changes the ambient
normal framing by the generator of \(\pi_1SO(3)\), and commutes
with the reflection.

The ambient surgery is smooth standard \(S^4\) for both framings.
Indeed a homotopy of loops in a smooth four-manifold can be
made a family of embeddings relative to embedded endpoints:
the equal-time double point test has domain dimension three
and coincidence codimension four, and the immersion test also
has codimension four. Isotopy extension takes this generator
loop to the product circle in \(S^1\times S^3\), with reversal
if necessary. Its complement is \(S^1\times D^3\), where the
rotating change of framing extends. Identity filling is the
rounded boundary of \(D^2\times D^3\).

The involution on the surgered \(S^4\) has fixed set \(S^3\).
To see the filling identification with its smooth structure,
split the original \(D^2\times S^2\) cap into the products of its
disc with the two hemispheres, using the chosen boundary marking.
The first piece attaches to \(X\) along \(S^1\times D^2\)
as a two-handle, giving a half \(W\) of the equivariant
surgery. The second piece attaches along
\(\partial(D^2\times D^2)\cong S^3\) after rounding and is a
four-ball. Hence the original marked filling is obtained by
capping \(W\) with that four-ball. The other half of the
equivariant surgery is its reflected copy. In particular, the
post-surgery fixed set presents a specific smooth Schoenflies
question in standard \(S^4\). A smooth identification of a half
as \(D^4\) would recognize the filling. The unmarked cylinder
classification gives the ambient standard sphere but supplies
no diffeomorphism of this half. The absolute exterior hypotheses
also give no access to the stronger pinching premise, as the
collapsing examples demonstrate.

I found no omitted route that settles the unrestricted
positive-energy statement. The extra tests identify the
regularity and marked topological data that would still be
needed. The collapsing and pinching arguments carry analytical
evidence. No interval or floating result enters this replay.
