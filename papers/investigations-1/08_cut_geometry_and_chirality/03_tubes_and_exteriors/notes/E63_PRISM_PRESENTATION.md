# E63 · A marked presentation procedure for the order-seventeen prism

27 November 2026 UTC. Prepared for Edward B. Baker III with OpenAI
assistance. Actual model and effort unavailable. Input checkout
bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0 and the certified
[E60 cell and arc description](E60_PRISM_PATTERN.md), with
[E39 marking](E39_PRISM_FILLINGS.md), [E48 integral slopes](E48_LINK_SURGERY.md),
[E54 peripheral homology](E54_UNDERLYING_SLOPES.md), and
[marked lens core](MARKED_LENS_CORE.md). The E60, E39, E48,
E54 and lens-core working SHA-256 prefixes are 32b793044e537f20,
566185d2f1c515a7, a00eb0253012f3ea, f82f1f43cf745559 and
d5817f7351ef7b91. The pair checker uses exact integers. The
finite presentation construction and homology argument are analytical.

The exact transition calculation below reads the normal winding
through both developed faces, including the face bisected by an
old singular strand. It supplies a finite triangulation and
peripheral-word procedure from the certified input. I did not
materialize the full triangulation or its nonabelian presentation.
Independently, the integral group homology in degree two of
each native filled orbifold is zero. Its finite nilpotent
quotients are cyclic.

## The two developed transitions and their normal actions

Use E60's labels $(A,r,b)$ for the rotations
$q\mapsto Aq(z^rj^b)^{-1}$ and let $J=((1+i+j+k)/2,0,1)$.
The two positive regular segments are developed by
$U_1=(1,10,0)$ and $U_2=(k,16,0)$ from the reference circle
$C=p_0e^{j\mathbb R}$, where $p_0jp_0^{-1}=(i+j+k)/\sqrt3$.
Their forward exits are $f_1=(-+--,11,0)$ and $f_2=(-k,9,1)$.
The face maps move outgoing points by $f_1^{-1}$ and
$f_2^{-1}$, respectively. Here $f_1^{-1}=(--++,6,0)$, and
$f_2^{-1}=f_2$. Multiplication and inversion of the exact
group pairs give
\[
 U_2^{-1}f_1^{-1}U_1=J^{10}=J^{-2},
 \qquad U_1^{-1}f_2^{-1}U_2=J^{3}.
\]
The checker [e63_prism_transitions.py](../numerics/e63_prism_transitions.py)
uses integral doubled coefficients for the left unit
quaternions and modular exponents for the right factor.
It verifies both equalities, the order of $J$, and
$f_1f_2=U_1J^{-1}U_1^{-1}=(-+++,3,1)$.

For a small fixed tube radius $\rho>0$, use reference coordinates
\[
 q(x,\theta)
 =p_0\left(\cos\rho\,e^{jx}+\sin\rho\,e^{j\theta}i\right).
\]
In these coordinates $J^k$ sends
$(x,\theta)$ to $(x-k\pi/6,\theta+5k\pi/6)$, with either angle taken
modulo $2\pi$. The phase $\Phi=\theta+5x$ is therefore unchanged by
each folded transition. More explicitly the first adds $\pi/3$ to
$x$ and to $\theta$ modulo $2\pi$, while the second subtracts
$\pi/2$ from $x$ and adds $\pi/2$ to $\theta$. In phase coordinates,
the marked $\mu$ makes a positive full turn at fixed $x$, the marked
$a$ advances $x$ by $\pi/6$ at fixed phase, and the slope $a+s\mu$
advances $x$ by $\pi/6$ while increasing phase by $2\pi s$.
These descriptions are in the regular tube and fix the normal
winding of the peripheral words.

Choose the base point of the lifted path in the open first chord.
Each endpoint of a regular chord lies on exactly one facet, the
circle crosses that facet transversely, and the other inequalities
are strict there. These are E60 certified signs. Away from the
endpoints the chord has a positive margin from the cell boundary
on compact subsegments. Thus for sufficiently small $\rho$ the
push-offs have the same two original facet crossings. At the
self-paired face, the crossing points stay on the respective sides
of its fixed diameter separated by the $S(-k,9)$ arc. The
two-letter developed product records holonomy in $\Lambda$.
It takes the same value for every integral $s$, so it cannot
serve by itself as the longitude word in the drilled orbifold.

## A finite cell presentation and a way to read its slopes

The following construction avoids any isotopy over the old
singular locus. It works with the entire E60 system of
Dirichlet inequalities, so it does not require a conjectural
reduction of its face pairs.

1. In $\mathbb R^4$, take the central linear hyperplanes of
   the Dirichlet inequalities. For each of the seven retained
   arc planes include two independent homogeneous linear
   equations whose common kernel is that plane. Close this
   list under $\Lambda$. Duplicates can be removed. Exact
   algebraic coefficients suffice: $p$ is integral, the
   cyclic data lie in the algebraic seventeenth-root field,
   and the circle spans in E60 are algebraic. Each translate
   of $D$ lies in the open hemisphere about its center.
   The hyperplanes stratify $S^3$ into finite spherical
   convex cells refining all translated Dirichlet faces, and
   every regular or singular arc is a union of edges. For
   example, the latter statement follows because a great
   circle is the intersection in $S^3$ of the two defining
   hyperplanes. This arrangement can be built within $D$
   and carried by the given face maps. The central
   arrangement construction also gives an explicit common
   refinement if local face subdivisions are used.

2. Subdivide by flags of faces, taking each spherical
   barycenter as the normalized sum of its unit extreme-ray
   vertices. Its location is equivariant under the finite
   rotation group. There is no inversion of a flag simplex
   because its vertices come from faces of distinct dimensions.
   The lifted regular circles and all old fixed circles are
   now disjoint link subcomplexes. Remove small open derived
   regular neighborhoods of both link subcomplexes before
   taking the quotient. Derived neighborhoods can be made
   arbitrarily small by subdivision, and the construction is
   equivariant. This is the regular-neighborhood construction
   for a link in a PL three-manifold. It gives two torus
   boundary components downstairs: the regular marked one
   and the old singular one made regular by excision. The
   complement has free group action, so its quotient is the
   ordinary marked link exterior
   $Z=|O|\setminus\operatorname{int}(\nu S\cup\nu\ell)$.
   [Rourke–Sanderson regular-neighborhood theorem, Theorem 3.11,
   stated and applied in Daverman–Venema, §1.6](https://people.math.ethz.ch/~dkosanovic/24-FS/Daverman-Venema-Embeddings-in-Manifolds.pdf)

3. Use the dual cell decomposition relative to the boundary.
   One vertex per tetrahedron, one oriented edge per shared
   interior triangle, and one two-cell per internal edge
   give a presentation after collapsing a maximal tree.
   The two-cell relator reads the circular sequence of
   tetrahedra around that edge. The dual complex is the
   complement of a boundary collar up to deformation and
   higher-dimensional cells do not affect $\pi_1$. The
   equivalent primal presentation uses directed edges,
   a maximal tree and oriented triangle relators. [Hatcher,
   *Algebraic Topology*, §§1.2 and 1.B](https://pi.math.cornell.edu/~hatcher/AT/ATch1.pdf)

4. Read a peripheral word by crossing the refined triangles
   along the explicit push-off in the preceding section. Use
   $\Phi$ constant for $u_a$, or $x$ constant and positive
   $2\pi$ variation of $\Phi$ for $u_\mu$. Start both at the
   same point of the regular tube and keep its based path
   fixed. Derived neighborhoods can first be taken small
   enough to avoid the chosen push-offs. All their crossings
   can be made transverse and off the refined edges by a
   small perturbation in the regular complement. A curve
   given before that perturbation has only finitely many
   event equations after intersecting it with the linear
   hyperplanes: write trigonometric terms in $x$ through
   $\tan(x/2)$ using integer harmonics $1$ and $12s-5$.
   With algebraic starting sine and cosine and algebraic
   $\cos\rho,\sin\rho$, the events are computable by real
   algebraic root isolation. Refined ordinary face crossings
   give the oriented dual edges, and a Dirichlet crossing
   must apply the exact inverse face label in the current
   developed chart. Positions along a self-pairing are
   retained by the same process. If a nongeneric segment
   lies on a face, a piecewise algebraic perturbation
   makes it transverse before recording crossings.
   This builds the longitude word itself, including
   internal crossings with trivial $\Lambda$ image.

5. At an interior point of an old fixed arc a meridian
   $u_\sigma$ can be read by the same local procedure:
   the lifted normal angle advances by $\pi$ and its
   endpoint identifies by that arc's half-turn. This
   produces an ordinary meridian of $S$ in $Z$, since
   the underlying chart is the normal squaring map.
   For the native orbifold the old core has order two
   and the new core is regular, so append the two
   relators $u_\sigma^2$ and $u_a u_\mu^s$. Base paths
   only conjugate these relators. This is the first-power
   native filling relation. Appending the twelfth power
   instead leaves a marked orbifold weight twelve on the
   new core. [E48, local filled covering](E48_LINK_SURGERY.md#3-local-filled-covering-and-the-undecided-group)

The presentation procedure is finite on the certified E60
data. The checker here verifies the two original transitions
and the holonomy and normal-angle convention. It does not
enumerate the refined face paths, simplify the resulting group
words, or determine the nonabelian filled groups.

## A native integral homology test

Let $G_s=\pi_1^{\rm orb}(O(a+s\mu))$ and let $N_s$ be the
ordinary exterior of the old singular circle in the underlying
lens filling. The ordinary homology calculation of E54 gives
\[
 H_1(N_s;\mathbb Z)
  =\langle\mu,\sigma\mid (1-3s)\mu-3\sigma=0\rangle
  \cong\mathbb Z,
\]
and the class of the old meridian $\sigma$ has nonzero index
$|3s-1|$ in this group. In particular $H_2(N_s;\mathbb Z)=0$:
its boundary is a single torus, so $\chi(N_s)=0$ by doubling,
its second Betti number is zero, and Poincaré–Lefschetz duality
and the universal coefficient theorem make this second
homology torsion-free.

An orbifold classifying space for the removed old tube
retracts to $S^1\times BC_2$. Locally the tube fibres are
disks with rotation isotropy $C_2$. The orientation of the
knot and of the ambient three-manifold orient the normal
two-plane, whose twisting along a circle is trivializable.
The disc contracts equivariantly to its center. The
boundary torus maps its normal meridian to the generator
of the $C_2$ factor and its longitude to a primitive
generator in the $S^1$ factor, possibly with an additional
$C_2$ component. The classifying space for the whole filled
orbifold is the homotopy gluing of this tube to $N_s$ along
that common ordinary boundary torus.

The boundary map $H_2(T^2)\to H_2(S^1\times BC_2)=C_2$
is onto: the exterior product of the two degree-one
generators maps to the product of the longitudinal generator
and the nonzero normal class. The map
$H_1(T^2)\to H_1(N_s)\oplus H_1(S^1\times BC_2)$ is injective:
the longitudinal component is detected by the free tube
factor and the remaining meridian by its nonzero class in
$H_1(N_s)$. Mayer–Vietoris then gives $H_2=0$ for this
orbifold classifying space. Attaching cells in dimensions
at least three makes a $K(G_s,1)$ and makes second homology
a quotient of the old second homology. Hence
\[
 H_2(G_s;\mathbb Z)=0
 \qquad\text{for }s=0,1 .
\]
The same calculation applies for every integer $s$ for which
the stated lens and peripheral descriptions are used.
The orbifold tube construction uses ordinary normal meridian
order two and does not introduce a finite group on the new core.
[Hatcher, §1.B, CW construction of $K(G,1)$](https://pi.math.cornell.edu/~hatcher/AT/ATch1.pdf)
· [E54 peripheral homology](E54_UNDERLYING_SLOPES.md#the-original-singular-knot-in-the-marked-exterior)

For the two native slopes, $G_s^{\rm ab}$ is $C_2$ or $C_4$
by E48. Any finite $p$-group quotient then has cyclic
abelianization, so is cyclic by the Frattini generating
criterion. Indeed the image of one lift generating the
quotient modulo $p$th powers and commutators generates
the whole finite $p$-group, since every maximal subgroup
contains both. Finite nilpotent groups are products of
their Sylow groups, so the finite nilpotent quotients
are precisely cyclic quotients of the corresponding
abelianization. Also $H_2(G_s;\mathbb F_2)\cong\mathbb F_2$
by universal coefficients, while $H_2(G_s;\mathbb F_p)=0$
for odd primes. These invariants do not decide whether the
native group is cyclic or admits a nonnilpotent quotient.
