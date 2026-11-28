# WIN-E09 · Independent replay C, chiral transport

27 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. The configured reader in the
[frozen request](../research-progress/handoffs/REQUEST_REPLAY_PENCIL_R1.md)
is GPT-6.2 Sol at ultra effort. Actual serving variant and effort are
unavailable. Baseline `86b24d9f9c2d6d634236f723eae0de4dd99fc5a7`.
The reader did not author the assigned proofs.

| Frozen input | SHA-256 |
| --- | --- |
| [E11 ordered loops](../notes/E11_ORDERED_LOOPS.md) | `103d522c723a44cf6497947d36626f5ff133993898db0f90023b71f985cc7629` |
| [E12 full holonomy](../notes/E12_FULL_HOLONOMY.md) | `5db5092afb892f74c8b8838bb21cfd982bcc9d4fc24c326860140281a4c2c86b` |
| [E15 singular scale](../notes/E15_SINGULAR_SCALE.md) | `d98f8b1beee36a1ba36e8339638cba1ef0be2b47a5ba17ef9907c0292303c71f` |
| [DIR-E07](../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E07_20261124.md) | `54542c510feec3c530e467533660b82ab884d115f7d48ac78d0ebb9d478a932d` |
| [A1](../../../01_chiral_transfer_and_pole_forms/notes/E01_A1.md) | `db13563024da1a55899c724c3ba0034e9b98beda2549afa4a5cdfe455ec0accd` |
| [A2](../../../01_chiral_transfer_and_pole_forms/notes/E02_A2.md) | `919cd9579feb6cf2473dfad403f2a18b1ebaf61b85692b28ad8f7d0cebce1f48` |

**Disposition.** All three pass non-author replay within the assigned
scope. A1 and A2 enter with their existing evidence. This reading checks
their use on the form produced by transport and checks the elementary
actual-group proof independently. The all-marking supremum on a putative
nonstandard type has the nonemptiness condition stated in E15.

## E11 · Marked round transport

In the plane of the cap, \(p=\cos r\,m_r+\sin r\,v_r\). For the polar
parametrization using \(\cos t\,v_r-\sin t\,e_j\), the outward radial
derivative at \(p\) is \(-e_1\), and the positively traversed edge has
velocity \(-\sin r\,e_j\). The polar area density is \(\sin\vartheta\), so the
oriented cap area is \(2\pi(1-\cos r)\). Constant normals in the ambient
orthogonal complement stay parallel. The tangential connection has
curvature \(d\omega=-\sin\vartheta\,d\vartheta\wedge dt\) in the convention
\(\omega=\langle\nabla U,V\rangle\). Use a smooth tangent frame over the
whole disk and its spin lift. If \(I_j=c(e_1)c(e_j)|_{S^+_p}\), the lift
of the infinitesimal tangent rotation is \(I_j/2\) by Clifford
commutation. The transport equation and Stokes therefore give
\(H_j=\exp(A_j I_j/2)\). The hemisphere gives \(-1\) in
\(\mathrm{SU}(2)\) and the identity in orthogonal tangent transport.

The axes anticommute and square to \(-1\). For \(q=H_2\) and
\(\alpha=A_2/2\), conjugation by \(q\) rotates the plane spanned by
\(I_3,I_2I_3\) through \(2\alpha\). Thus the scalar part of the
commutator, for \(\beta=A_3/2\), is
\(\cos^2\beta+\sin^2\beta\cos(2\alpha)\). Doubling gives
\(2-4\sin^2\alpha\sin^2\beta\). The pairs of areas \((2\pi,\pi)\),
\((\pi/2,\pi)\) and \((\pi,\pi)\) give \(2,0,-2\), respectively.
Holding \(A_3=\pi\) and moving \(A_2\) from \(\pi\) to \(2\pi\) realizes
the whole interval. Reversal of either loop in this two-axis family
preserves the trace. A common frame change at the basepoint conjugates
both transport matrices.

Stereographic projection from \(e_4\) puts both complete cap spheres on
the shell \(|x|=1\). The compactly supported conformal multiplier in E11
is the inverse of the round multiplier on the ball \(|x|<2\). The flat
spin frame on that ball trivializes transport of the same fixed loops.
For the two area-\(\pi\) caps the trace consequently changes from
\(-2\) to \(2\) in the same conformal class.

## E12 · Actual holonomy and finite deletion

For a finite deletion the base remains path connected, by perturbing
paths off the deleted points. A ball about each deletion adds a simply
connected open set that intersects the current domain in a punctured
four-ball. Van Kampen thus gives trivial fundamental group as on \(M\).
An actual piecewise smooth loop can be reparametrized to a smooth loop
with flat joins. Take a smooth disk filling relative to a collar, and
contract the loop by circles in the disk tangent to its boundary at the
marked point. This gives a smooth based contraction with unchanged
initial holonomy. Smooth dependence of transport on the contraction gives
a smooth path in the actual group from each element to the identity.

Let \(V\) be the span of identity velocities of smooth curves in the
actual group. If \(V=0\), translate each such contraction along the group
to see its velocity vanishes at every interior parameter. The group is
then trivial. Conjugation preserves \(V\). A dimension one or two forces
a preserved line in \(\operatorname{Im}\mathbb H\), using the orthogonal
complement for dimension two. Path connectedness makes the line action
positive, so the group fixes an imaginary axis and is contained in its
centralizer circle. A nonconstant smooth group path supplies a nonzero
velocity after translation, which in the circle gives an open arc. This
forces the whole circle. If \(V\) has dimension three, multiplying three
curves with independent velocities yields an identity neighborhood in
the subgroup by the inverse function theorem. Connectedness of
\(\mathrm{SU}(2)\) then gives the whole group. This argument yields group
elements realized by loops directly.

If the group is proper, transport a fixed complex line along all paths.
The holonomy invariance makes the result independent of path. A smooth
connection across a deleted point extends the line there by transport
along straight coordinate segments from a fixed nearby point. Agreement
on segments avoiding the deletion gives agreement on the punctured
ball by density and continuity. The closed unitary splitting is then
\(L\oplus L^{-1}\), and \(c_2=-c_1(L)^2=0\) since \(H^2(M;\mathbb Z)=0\).
The stipulated \(\langle c_2(S^+),[M]\rangle=-1\) rules this out. This applies to the smooth
closed Levi-Civita connection and to its restriction after any finite
deletion, at any of the allowed basepoints. The argument also applies to
any smooth \(\mathrm{SU}(2)\) connection on the same closed bundle.
Taking \(i\) and \(\exp(jt)\) as the two realized elements gives trace
\(2\cos(2t)\), so the unrestricted interval is \([-2,2]\) in each case.

## E15 · Singular scale and recognition

On the complement of the single transverse zero, the given smooth
spinor satisfies \(|\psi|_g\asymp\rho\). Write \(h=f^2g\) with
\(f=|\psi|_g^{-2}\). Under conformal transport the spinor norm acquires
the square root of the metric length multiplier, so the factor in
\(|\psi|_g^{-4}g\) cancels and \(h\) stays the same. An abelian holonomy
group either is central or
centralizes a noncentral element. In both cases it fixes a nonzero
imaginary axis in the adjoint representation. Under the positive
half-spin convention that representation is \(\Lambda_h^+\). The
axis transports to a nonzero smooth parallel two-form. It is closed
because alternation of the torsion-free covariant derivative gives
exterior differentiation. Since the four-dimensional middle Hodge star
is invariant under conformal scaling, it is also self-dual for \(g\).
If its \(h\)-norm is \(b>0\), its \(g\)-norm is
\(f^2b=b|\psi|_g^{-4}=O(\rho^{-4})\). This is exactly the exhaustion
hypothesis of A1 for the smooth compact representative \(g\) and one
puncture. A1 identifies it with a nonzero pole form, and A2 applies
because it vanishes nowhere. The leading compact-chart coefficient in
A1 belongs to \(\Lambda_p^-\) because the inverted end chart reverses
orientation. The actual form on \(X\) has positive chirality in the
given orientation. Finite relative defect provides the stated first
jet and is stronger than the norm bound needed in this inference.
[A1, §§1 and 3](../../../01_chiral_transfer_and_pole_forms/notes/E01_A1.md) ·
[A2 and its replay](../../../01_chiral_transfer_and_pole_forms/reviews/E02_REPLAY.md)

The A2 conclusion is a diffeomorphism of closed smooth manifolds. Its
relative end agreement follows from the product cap with two positively
intersecting symplectic spheres of trivial normal bundle and equal area,
with every spherical period an integral multiple of that area. I
checked the splitting and prescribed-neighborhood clause in the primary
page image. The cutoff gives a constant form on the end, and the end
identification is a similarity in the inverted coordinates, giving the
smooth extension at the marked point. This reading uses the existing
weighted exhaustion result in A1.
[Gromov, *Pseudo holomorphic curves in symplectic manifolds*, §2.4.A′₁–A₂, p. 337](https://www.ihes.fr/~gromov/wp-content/uploads/2018/08/945.pdf#page=31)

For the round control, on the chart take a unit parallel Euclidean
positive spinor and apply conformal weight \(u^{1/2}\) for
\(u=2/(1+|x|^2)\). Its norm near the puncture is
\(\sqrt2|y|/(1+|y|^2)^{1/2}\) in inverted coordinates. In a smooth spin
frame a small annulus cutoff gives a distributional twistor-equation
error bounded by \(O(\epsilon^4)\), from one cutoff derivative, the
order-one zero and the four-dimensional volume. The principal symbol
of \(P^*P\) is \(\tfrac34|\xi|^2 I\), so elliptic regularity gives a smooth
extension. The norm limit in each direction gives an invertible real
derivative at the puncture. The spinor has zero twistor defect and
selects \(h=\delta\), whose holonomy is trivial. Multiplication of this
spinor by the positive smooth \(a\) from E15 leaves the jet near the
puncture unchanged and gives a second admissible marking. On the inner
ball \(a^{-4}\delta=u^2\delta\) is round. Its positive chiral curvature
values span \(\mathfrak{su}(2)\), since constant round sectional curvature
is the identity curvature operator and the positive spin representation
acts nontrivially on every self-dual generator. In a frame with the
connection zero at the basepoint, small square transport has the curvature
as its order-two coefficient, up to the traversal sign. A torus would
place all these coefficients in its one-dimensional Lie algebra. The
actual group alternatives therefore give full holonomy for this second
round marking.
[Friedrich, *On the conformal relation between twistors and Killing spinors*, §1, pp. 59–60](https://dml.cz/bitstream/handle/10338.dmlcz/701462/WSGP_09-1989-1_7.pdf#page=2)

The path and group argument above uses smoothness on the base of the
loops, so it applies to \(h\) on the simply connected punctured sphere.
Abelian group gives trace set \(\{2\}\). Full group gives \([-2,2]\).
The infimum over all pairs is an attained \(2\) or \(-2\). A trace
equal to \(2\) on one pair says the pair commutes, since \(2\) in the
defining representation forces the commutator to be the identity.
Recognition requires the all-loop abelian condition on a supplied
marking. The two round markings give both infima on the same smooth
sphere. Existence of a marking with infimum \(2\) is equivalent to
standardness. On a putative nonstandard type the supremum of the
marking-wise infima is \(-2\) if the admissible domain is nonempty.
The frozen transport proofs supply no method to check all loop pairs
or all markings in a candidate presentation.

For the conformal bundle identification, let \(v=\log f\). The finite
twistor-defect jet makes \(|\psi|_g=|a_p|\rho(1+O(\rho))\) with a radially
differentiable Taylor expansion, hence \(\partial_\rho v=-2/\rho+O(1)\).
The connection difference on a unit vector orthogonal to
\(\operatorname{grad}_g v\) is \(-c(Y)c(\operatorname{grad}_g v)/2\).
Its positive spin operator norm is \(|\operatorname{grad}_g v|_g/2\),
using Clifford norm preservation and the two factors exchanging
chirality. This proves unboundedness in the specified identification.
For an abelian group the closed Chern-number obstruction above rules
out a smooth extension on the same closed positive bundle through any
other unitary identification on the complement. That last argument
uses the abelian case and the fixed closed bundle.
