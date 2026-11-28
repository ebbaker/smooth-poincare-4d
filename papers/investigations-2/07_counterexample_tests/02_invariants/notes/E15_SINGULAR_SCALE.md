# WIN-E15 · Holonomy in the spinor-selected scale

27 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. The [frozen request](../research-progress/handoffs/REQUEST_AVERAGE_R1.md)
specifies `gpt-6.2-sol` at ultra effort. Independent serving metadata are
unavailable. Inputs are the frozen request (SHA-256 prefix
`d15cc9a322553a13`) and checkout
`86b24d9f9c2d6d634236f723eae0de4dd99fc5a7`. Working project deduction using
the replayed A1 and A2 statements.

## Reduction in the singular scale

Let \(M\) be a closed oriented smooth homotopy four-sphere, \(g\) a smooth
Riemannian metric and \(\psi\) a smooth positive half-spinor with exactly one
transverse zero \(p\) and finite relative twistor defect \(J_g(\psi)\). The
positive half-spin convention identifies real self-dual two-forms with the
adjoint representation of \(\mathrm{Sp}(1)=\mathrm{SU}(2)\). Put
\(X=M\setminus\{p\}\), \(h=|\psi|_g^{-4}g\) and \(\rho=d_g(p,\cdot)\) near
\(p\). Transversality gives \(c\rho\le |\psi|_g\le C\rho\). The finite-defect
criterion also gives \(\nabla^g_Y\psi(p)=Y\cdot_g a\), where
\(a=-D_g\psi(p)/4\ne0\). Only the norm comparison is needed for the pole
argument. The same conformal covariance shows that replacing \(g\) by
\(f^2g\) and transporting \(\psi\) with weight \(f^{1/2}\) selects the same
metric \(h\). [DIR-E07, Domain and zeros and Conformal invariance](../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E07_20261124.md)

Suppose the **full** based holonomy \(H\) of the positive chiral Levi-Civita
connection of \(h\) lies in an abelian subgroup of \(\mathrm{SU}(2)\). If
\(H\) contains a noncentral element, it lies in that element's centralizer,
a circle fixing a nonzero axis in the adjoint representation. If \(H\) is
central, the entire adjoint representation is fixed. Parallel transport of
a nonzero fixed element of \(\Lambda^+_{h,x}\) therefore gives a well-defined
smooth \(h\)-parallel self-dual two-form \(\omega\) on \(X\). It is closed by
the vanishing torsion of the Levi-Civita connection, and its constant
\(h\)-norm \(b>0\) implies it is nowhere zero. In four dimensions the Hodge
star on two-forms is conformally invariant. The compact-metric norm is
\[
|\omega|_g=b|\psi|_g^{-4}=O(\rho^{-4}).
\]
Thus \(\omega\) is a smooth closed \(g\)-self-dual two-form on \(X\) satisfying
the growth bound in A1, which identifies it with a pole form of nonzero
residue in \(\mathcal H_p([g])\). The exhaustion statement of A1 uses its own
auxiliary asymptotically Euclidean metric and only this growth bound for the
input form. A2 applies to the zero-free pole form and gives a smooth
diffeomorphism \(M\cong S^4\). Its recognition proof uses the end cutoff,
product cap and prescribed tail agreement from Gromov's relative splitting.
[A1, §§1 and 3](../../../01_chiral_transfer_and_pole_forms/notes/E01_A1.md) · [A2, integrated proof](../../../01_chiral_transfer_and_pole_forms/brainstorm/notes/B01_RECOGNITION_SOURCE.md#integrated-proof-on-the-original-source) · [Gromov, §2.4.A′₁–A₂, p. 337](https://www.ihes.fr/~gromov/wp-content/uploads/2018/08/945.pdf#page=31)

## Round existence and a second marking

In an oriented stereographic chart on the unit round sphere with pole
\(p\), put \(u=2/(1+|x|^2)\), so \(g_{\rm rd}=u^2\delta\). Transport a
constant unit positive Euclidean spinor \(s\) to
\(\psi=u^{1/2}\beta s\), with \(\beta\) the unitary metric comparison. It
solves \(P^{g_{\rm rd}}\psi=0\) on the chart by the conformal law. In the
inverted chart at \(p\) its norm is
\(\sqrt{2}\,|y|/(1+|y|^2)^{1/2}\). Extend it by zero at \(p\). In a smooth
round spin frame the distributional twistor equation holds across \(p\)
by cutting off on an annulus of radius \(\epsilon\). The error has size
\(O(\epsilon^{-1})O(\epsilon)O(\epsilon^4)\) when paired with a smooth
test section. Elliptic regularity for \(P^*P\) gives a smooth extension.
The displayed norm gives \(|d\psi_p(v)|=\sqrt{2}|v|\) in numerical
\(y\)-coordinates, so the zero is transverse. This spinor has \(J=0\) and
selects \(h=\delta\) on \(X\), with trivial positive chiral holonomy.
[DIR-E07, Conformal invariance and Elliptic estimate](../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E07_20261124.md) · [Friedrich, §1, pp. 59–60](https://dml.cz/bitstream/handle/10338.dmlcz/701462/WSGP_09-1989-1_7.pdf#page=2)

The round sphere also admits a marking with full chiral holonomy. Keep
\(g_{\rm rd}\), and multiply this \(\psi\) by a smooth positive scalar
\(a\) equal to \(u^{-1/2}\) on a coordinate ball and to 1 outside a larger
ball. It has the same zero and jet at \(p\), so the relative defect is
finite. The selected metric \(a^{-4}\delta\) is round of sectional
curvature 1 in the first ball. At a basepoint there, its spin curvature
on tangent orthonormal bivectors is the positive chiral Clifford action
with nonzero factor \(\pm 1/2\), from the spin lift
\(F(U,V)=\tfrac14\sum_{ij}g(R(U,V)e_i,e_j)e_i\cdot e_j\).
The projected bivectors span
\(\Lambda^+\), so the curvature values span \(\mathfrak{su}(2)\). For a
small coordinate square of side \(t\), based transport has expansion
\(I\pm t^2 F(U,V)+o(t^2)\), obtained by integrating the linear term of
the connection in a frame with zero connection matrix at the basepoint.
The commutator term in that integration is higher order because the
matrix on the sides is \(O(t)\). A circle subgroup would force every such
curvature value into its one-dimensional tangent space. The group
alternatives below therefore give full holonomy for this marking.

## Actual holonomy and the trace range

Deleting the pole preserves the fundamental group. The cover of \(M\)
by \(X\) and a coordinate ball at \(p\) has intersection retracting to
\(S^3\), so van Kampen gives \(\pi_1(X)=\pi_1(M)=0\). Thus every
piecewise smooth based loop can be contracted through a smooth family
after reparametrizing its pieces with flat derivatives at the joints and
smoothing a based null-homotopy relative to its smooth boundary loops.
Parallel transport depends smoothly on that family. Every element of
\(H\) is consequently connected to the identity by a smooth path in
\(H\).

These paths classify the actual group. If \(H\ne\{1\}\), translate a
regular point of a nonconstant
path to obtain a smooth curve \(\alpha(t)\) in \(H\) with \(\alpha(0)=1\)
and nonzero tangent \(v\). If every element preserves \(\mathbb R v\)
under the adjoint action, connectedness forces it to fix \(v\). Hence
\(H\) lies in the centralizer circle of \(v\), and the curve with nonzero
tangent gives an open arc there. The subgroup is the entire circle.
Otherwise choose \(k\in H\) with \(w=\mathrm{Ad}_k v\) independent of
\(v\). The conjugate curve \(k\alpha(t)k^{-1}\) has tangent \(w\). Its
conjugate by \(\alpha(s)\) has tangent \(\mathrm{Ad}_{\alpha(s)}w\), whose
derivative at \(s=0\) is \([v,w]\), a nonzero multiple of the cross
product of the two imaginary quaternions. For some small \(s\) these
three tangents are independent. The product of the three curves is then a
local submersion into \(\mathrm{SU}(2)\) at the identity with image in
\(H\). This makes \(H\) open, hence the full connected group. The
alternatives are \(\{1\}\), a whole circle, and \(\mathrm{SU}(2)\).

Use the unnormalized trace in the defining complex two-dimensional
representation and let \(m(g,\psi)\) be the infimum over all pairs of
piecewise smooth loops based at the same \(x\in X\) of
\(\operatorname{tr}(ABA^{-1}B^{-1})\), where \(A,B\) are their
holonomies. Basepoint and spin frame changes conjugate the group and
preserve this set of traces. For either abelian group the trace set is
\(\{2\}\). In the full group choose \(A=i\) and
\(B=\cos t+j\sin t\), using quaternion units \(i,j\). The commutator is
\(B^{-2}\), of trace \(2\cos(2t)\). Thus the trace set is \([-2,2]\),
including its endpoints on actual loops. The two possible values of
\(m\) are \(2\) and \(-2\).

For a supplied marking, \(m=2\) recognizes the standard sphere.
A single trace less than 2 certifies noncommutation on its marking,
and the full-holonomy standard control also realizes \(m=-2\). A trace
equal to 2 for one pair certifies only that the pair commutes. For a
smooth-type test one can take the supremum of \(m\) over all smooth
metrics and spinors with the stated single-zero and finite-defect
properties. On a standard sphere it equals 2, attained by a round
marking. On a hypothetical nonstandard sphere every admissible marking
has \(m=-2\), so the supremum equals \(-2\) whenever the domain is nonempty.
The existence of a marking with the first value is equivalent to
standardness. An upper bound below 2 on a candidate requires a certificate
covering the whole admissible domain. Finding such a certificate remains
open in this test.

## Smooth extendibility on the original positive bundle

A smooth connection with structure group \(\mathrm{SU}(2)\) on the
closed \(S_g^+\) has full holonomy. The same path argument applies on
simply connected \(M\). If the group were contained in a circle, parallel
transport of its invariant complex eigenline would split the closed
bundle as \(L\oplus L^{-1}\), giving \(c_2(S_g^+)=-c_1(L)^2=0\), since
\(H^2(M;\mathbb Z)=0\). This contradicts \(c_2(S_g^+)[M]=-1\) in the
fixed convention. The restriction of a smooth connection on this bundle
to \(X\) also has full holonomy. Based loops in \(M\) can be approximated
in the piecewise \(C^1\) topology by based loops avoiding \(p\), and
their transports converge by the smooth connection ODE. Each of the
allowed groups on \(X\) is closed, so a proper group on \(X\) would also
contain the holonomies on \(M\). [Frozen bundle convention](../research-progress/handoffs/REQUEST_TWISTOR_R1.md) · [Chiral charge, equations (2)–(4)](../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/01_dirac_collar_matching/notes/E12_RELATIVE_CHIRAL_CHARGE_20261125.md)

Under the unitary conformal identification of \(S_h^+\) with
\(S_g^+|_X\), the connection of the selected scale differs from the
closed connection by
\(-\tfrac12(Y\cdot_g\operatorname{grad}_g v\cdot_g+Y(v))\) on a vector
\(Y\), where \(v=-2\log|\psi|_g\). The first jet gives
\(\partial_\rho v=-2/\rho+O(1)\). For a unit \(Y\) orthogonal to
\(\operatorname{grad}_g v\), the product of the two Clifford actions
has operator norm \(|\operatorname{grad}_g v|_g\) on the positive
half-spin bundle. The difference is unbounded in this identification,
so it cannot extend smoothly through \(p\) there. For abelian holonomy
the closed-bundle obstruction also rules out extension on the same
closed bundle via any other unitary spin-bundle identification on \(X\).
The flat round connection can instead be put on the trivial bundle in
its Euclidean parallel frame, which has different closed bundle data.
[DIR-E07, conformal connection calculation](../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E07_20261124.md#conformal-invariance)
