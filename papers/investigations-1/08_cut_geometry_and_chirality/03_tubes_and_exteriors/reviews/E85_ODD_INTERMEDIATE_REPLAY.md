# E85 · The odd prism intermediate and its marked reverse circle

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance.
Actual helper model and effort are unavailable.
[Frozen E85 request](../research-progress/handoffs/E85_REQUEST_R1.md),
checkout 72068cef1973d23aee808fe66476c44ed4b99cc5. The marked inputs
are [E70](../notes/E70_EQUIVARIANT_SURGERY.md),
[E75](../notes/E75_RATIONAL_TANGLE_GROUP.md),
[E74](E74_ALL_SLOPES.md) and [E76](E76_RECOGNITION_TRANSFER.md),
with SHA-256 prefixes ade2987d8bf24aa9, b2473179335f0847,
5591b1d3c6d16b81 and 0684e09e90f743a67. The argument uses the actual
smooth oriented four-dimensional intermediate \(W_1\) for \(a+\mu\)
and its marked framed inverse circle \(\delta\). The corresponding
orbit orbifold \(Q_1\) retains order two along the old knot.

The intermediate is smoothly the mapping torus of an order-four
diffeomorphism of the actual index-four smooth orbifold cover
\(X=\Sigma_2(K_1)\). Its two prime summands are orientation-preservingly
diffeomorphic lens spaces of order seven, and the monodromy exchanges
them. The marked circle can be represented by a section. It cannot
lie in the invariant neck suspension or in the suspension of the two
punctured lens pieces. Even in the degree-four smooth product cover,
its lift has a nontrivial commutator spanning both prime factors.
These conclusions give a geometric reduction of the odd framed
surgery and leave the lens parameter and the smooth closing open.

## Recover the smooth fibre from the action

Let \(h\) denote a principal orbit in \(\Pi=\pi_1(W_1)\).
The relative product model and the Thom calculation give
\(H_1(W_1;\mathbb Z)=\mathbb Z\), with the actual inverse circle
\(\delta\) of degree one. The action fibration gives
\(\Pi/\langle h\rangle=G_1=\pi_1^{\rm orb}(Q_1)\), and \(h\) is
central in \(\Pi\). The marked presentation is
\[
 G_1=\langle q,c\mid q^4=c^2=(cq^2)^7=1\rangle
     =C_4*_{C_2}D_{14}.
\]
Here \(v=q^2\) generates the edge group, and the native meridian \(\mu\)
maps to \(L=qc\) in the displayed presentation. The inverse circle
projects to that meridian: the local replacement has core
\(S^1_\mu\), with \(a+\mu\) filled by the attached disk. The group
abelianization is \(C_4\), with \(\kappa(q)=1,\ \kappa(c)=2\) for the
chosen map \(\kappa:G_1\to\mathbb Z/4\). Consequently \(|\deg h|=4\).
The orientation of the circle action can be taken to have \(\deg h=4\).
[E76, inverse circle and action sequence](E76_RECOGNITION_TRANSFER.md)
· [E70, \(s=1\) peripheral words and eliminations](../notes/E70_EQUIVARIANT_SURGERY.md#4-eliminations).

Choose a smooth closed real one-form representing the primitive
integral degree class, and average it over the action to obtain
\(\alpha\). The cohomology class is unchanged because each circle
element acts by a map isotopic to the identity. For the action
generator \(V\) of period one, Cartan's formula gives
\(d(\alpha(V))=0\). Its constant value is the integral over a full
principal orbit, namely \(4\). Thus \(\alpha\) is nowhere zero.
Integrating it modulo its integral periods gives a smooth submersion
\[
 p:W_1\longrightarrow \mathbb R/\mathbb Z,\qquad
 p(\Phi_u w)=p(w)+4u .
\]
The compact domain makes \(p\) a smooth fibration. Its fibre \(X\)
is connected because \(p_*\) on fundamental groups is surjective,
as witnessed by \(\delta\). In fact the action gives the explicit
mapping-torus trivialization \((x,t)\mapsto\Phi_{t/4}x\) on
\(X\times[0,1]\), with \((x,1)\sim (g x,0)\) for
\(g=\Phi_{1/4}|_X\). This time map preserves the fibre orientation
and \(g^4=1\). Its order is exactly four because generic principal
orbits intersect \(X\) in four distinct points. Slice charts identify
\(X/\langle g\rangle\) with \(Q_1\) as an orbifold. A trivial
stabilizer gives four points over a base point. An old order-two
stabilizer gives two points and the inherited smooth local branched
map.

The smooth degree-four cover of the whole intermediate can be
written explicitly as
\[
 \widehat W_1=\{(w,z):p(w)=4z\},\qquad
 X\times(\mathbb R/\mathbb Z)\longrightarrow\widehat W_1,\quad
 (x,z)\longmapsto(\Phi_z x,z).
\]
The inverse is \((w,z)\mapsto(\Phi_{-z}w,z)\). The full orbit \(h\)
is the positive circle factor in these coordinates. In particular
the pullback principal bundle over \(X\) is trivial despite the
possibility of torsion in \(H^2(X;\mathbb Z)\).

## The two lens factors and their branch knots

Put \(r_0=cv\) and \(r_1=qr_0q^{-1}\). The marked presentation
can equivalently be written with \(r_0^7=r_1^7=q^4=1\) and
\[
 qr_0q^{-1}=r_1,\qquad qr_1q^{-1}=r_0^{-1}.
\]
For the second relation use \(v r_0v^{-1}=r_0^{-1}\).
Conversely \(c=r_0v\) recovers the order-two relation for \(c\).
This gives \(H=\ker\kappa=\langle r_0\rangle*\langle r_1\rangle\),
with both factors \(C_7\). Since \(h\) has degree four,
\(\Pi\to G_1\) restricts to an isomorphism of \(\ker(\deg)\) with
\(H\). Thus \(\pi_1(X)=C_7*C_7\). Conjugation by a lift of a
generator of \(G_1/H\) gives the outer monodromy action, up to
sign according to the mapping-torus convention. It exchanges the
two conjugacy classes of maximal order-seven subgroups. Its square
inverts both.

Since the ambient \(Q_1\) has underlying \(\mathbb{RP}^3\), its
ordinary universal cover is \(S^3\). The old singular knot has odd
winding in the lens dual exterior, so its inverse image there is
one knot \(K_1\). The meridians of the old order-two branch have
image \(2\) under \(\kappa\). Accordingly the quotient
\(X/\langle g^2\rangle\) is this \(S^3\) with the marked knot, and
\(X=\Sigma_2(K_1)\). The fixed set of \(g^2\) in \(X\) is one
circle. It projects homeomorphically to \(K_1\) and degree two to
the old singular circle in \(Q_1\). Neither \(g\) nor \(g^3\) has a
fixed point, since the only nontrivial orbit isotropy is order two.
[Marked underlying cover](../notes/MARKED_LENS_CORE.md#the-remaining-singular-knot-and-its-cyclic-lifts)
· [E74, deep cover](E74_ALL_SLOPES.md).

The Kneser realization of the free splitting \(C_7*C_7\) gives
two prime pieces with fundamental group \(C_7\). Their simply
connected finite covers are \(S^3\) by three-dimensional Poincaré,
and the orientation-preserving deck actions can be linearized.
A free cyclic linear action of order seven on \(S^3\) is a lens
action. Hence \(X\) is the connected sum of two order-seven lens
spaces. The following equivariant decomposition also identifies
their common oriented diffeomorphism type up to the value of the
lens parameter. [Stallings's realization of the Kneser splitting,
stated in Feustel, Theorem K, p. 123](https://msp.org/pjm/1973/46-1/pjm-v46-n1-p09-s.pdf)
· [Milnor, prime decomposition](https://doi.org/10.2307/2372800)
· [Dinkelbach–Leeb, Theorem E](https://msp.org/gt/2009/13-2/gt-v13-n2-p15-p.pdf).

Apply the equivariant sphere system theorem to the finite oriented
deck action on \(X\). It gives a \(g\)-invariant finite disjoint
collection of embedded spheres whose cut-and-cap components are
irreducible. All spheres separate because \(H_1(X;\mathbb Q)=0\),
so their dual graph is a tree. Keep the path connecting the two
lens vertices. Every other edge cuts off a tree of \(S^3\)
components, so omitting those edge spheres only restores balls.
The retained collection remains invariant because \(g\) exchanges
the two lens vertices. Its intermediate components are
twice-punctured \(S^3\)'s, hence smooth product shells by
Schoenflies. Taking these shells together with invariant collars
at the ends gives a \(g\)-invariant neck \(N\cong S^2\times I\).
The two punctured lens complements are exchanged by \(g\), which
therefore carries one oriented capped lens space to the other.
Write the decomposition as \(X=L(7,r)\#L(7,r)\), with the lens
parameter \(r\) unspecified.
[Equivariant sphere system in Chen–Tshishiku, Theorem 3.1(1)
and Remark 3.2](https://d-nb.info/1383654557/34).

On the retained path \(g^2\) fixes each vertex and each edge, so
it preserves both sides of every separating sphere. Its sphere
restriction is an orientation-preserving involution. It cannot
fix the sphere pointwise, since its differential would then be
the identity tangentially and normally at a fixed point, forcing
the involution to be the identity as an isometry for an invariant
metric. Its two fixed points are transverse meetings with the
fixed curve in \(X\), by the half-turn on the tangent sphere and
the trivial normal action. Therefore the sphere quotients in
\(X/\langle g^2\rangle=S^3\) meet the branch knot in two points.
Cap each quotient region by the standard arc balls. The
intermediate shells give trivial knot summands: their capped
covers are \(S^3\) with involution, which is conjugate to a linear
half-turn by Theorem E, and its branch circle in the quotient is
unknotted. The two lens endpoint caps give the same branch knot
up to ambient orientation-preserving diffeomorphism, because \(g\)
exchanges the endpoints and commutes with the involution.
Consequently the actual knot \(K_1\) decomposes as \(J\#J\) up to
the orientation of the knot parameter, with
\(\Sigma_2(J)=L(7,r)\). The exact value of \(r\) requires a marked
identification of \(J\) or equivalent data on a capped lens
factor. [Dinkelbach–Leeb, Theorem E](https://msp.org/gt/2009/13-2/gt-v13-n2-p15-p.pdf).

## The section class spans the two summands

The quotient class of \(\delta\) is the word \(qc\), cyclically
reduced of length two in the amalgam because neither entry lies
in the edge subgroup \(C_2=\langle v\rangle\). It is hyperbolic
for the Bass–Serre action and has infinite order in \(G_1\).
The suspension of the invariant neck \(N\) has infinite cyclic
fundamental group with degree an isomorphism to \(\mathbb Z\).
It contains a principal orbit representing the fourth power of
that generator, since \(h\) has degree four. Its image in \(G_1\)
is therefore finite. Consequently the marked circle cannot be
freely homotoped into the neck suspension. The suspension of the
union of punctured primes is a fibration with a two-component
fibre and the interchange monodromy. Every loop in it has even
degree, so the same localization is impossible there.

One can also calculate the particular word carried by the lift.
The marked quotient class \(\kappa(qc)=3\) implies that in the
chosen degree convention a degree-one lift \(t\) of \(q^{-1}\)
exists. Choose base paths consistently in \(\Pi\) and its
quotient. Then
\[
  L=r_1q^{-1},\qquad
  L^2=r_1r_0v,\qquad
  L^4=r_1r_0r_1^{-1}r_0^{-1}.
\]
The equality of quotient classes and degrees gives
\(\delta=r_1t\) in \(\Pi\) after identifying \(H\) with
\(\ker(\deg)\), since the only possible ambiguity is a power of
\(h\). The unique connected lift of \(\delta\) to the degree-four
cover thus has class
\[
    \big([r_1,r_0],1\big)\in
    \pi_1(X\times S^1)=(C_7*C_7)\times\mathbb Z .
\]
The first entry is cyclically reduced with four alternating
syllables, and is not conjugate into either prime subgroup.
Therefore that lifted circle also cannot be homotoped into a
single punctured lens product or into the neck product.

Degree one does allow a different simplification: in a mapping
torus any degree-one loop class has a representative that is a
section, by choosing a path in a fibre with endpoints related by
the monodromy and taking its graph over the base. Smooth the
endpoint jets in the fibration chart. The actual inverse circle
is then smoothly ambiently isotopic to that section, since a
generic free homotopy of embedded loops in a four-manifold
avoids simultaneous double points and singular tangents. The
isotopy transports the original framing. This places the odd
closing in a mapping torus with interchanged equal lens
summands, while the inverse surgery retains the nonlocal
section class and its actual framing.
