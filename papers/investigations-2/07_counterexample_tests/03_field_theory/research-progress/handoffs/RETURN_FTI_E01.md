# FTI-E01 · Boundary operator and quotient

28 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex
assistance. The delegated execution was configured for GPT-6.2 Sol at ultra
effort. Independent serving attestation is unavailable.
Checkout `7c6bbab9a0a6`.
[Request r1](REQUEST_FTI_E01.md), SHA-256 prefix `7e60efafac11d597`.
[B01](../../brainstorm/notes/B01_ACTUAL_CUT.md), prefix `bd923836031876e2`.
[Sole register](../REGISTER.md).

**Result.** On both frozen auxiliary Riemannian collars the tangential
connection kernel consists of a constant inward normal coefficient and
the harmonic longitudinal one-form. The tangential spinor kernel is zero.
Complementary APS conditions give Fredholm linear operators on the compact
pieces. The same kernels occur with either framing when all structures are
transported. The original Gerig first jet gives a definite obstruction
to transferring the marked Honda form through the frozen chart. The
operator and its domains below use the unchanged B01 unmarked charts.

## 1. Product operator, inward convention

Use the smooth oriented compact pieces, positive chirality, spin-induced
spinᶜ structure with trivial determinant, and the zero-spinor flat
reducible of B01. Write \(u\ge 0\) for inward collar distance, \(\mu=\partial_u\),
and orient \(Y\) by the outward normal \(-\mu\) first. In particular
\(\operatorname{vol}_4=-du\wedge\operatorname{vol}_Y\).
Write the imaginary charge-one perturbation as
\(\alpha=f\,du+b\), where \(f\) is imaginary-valued and \(b\) a tangential
imaginary one-form. The isometric identification
\[
 K_\mu(\eta)=\frac{du\wedge\eta-*_Y\eta}{\sqrt2}
     \colon T^*Y\longrightarrow\Lambda^+
\]
follows from \(*_4(du\wedge\eta)=-*_Y\eta\). Since
\(d\alpha=du\wedge(\partial_u b-d_Yf)+d_Yb\) and
\(d^*\alpha=-\partial_u f+d_Y^*b\), the row normalization is
\[
 \begin{pmatrix}-d^*\alpha\\ \sqrt2 K_\mu^{-1}d^+\alpha\end{pmatrix}
   =(\partial_u+B_{\mathrm{form}})\binom{f}{b},\qquad
 B_{\mathrm{form}}
   =\begin{pmatrix}0&-d_Y^*\\-d_Y&-*_Yd_Y\end{pmatrix}.
\]
Here \(d^+=(1+*_4)d/2\). Equivalently, scale the four-dimensional
rows by \((-1,\sqrt2)\) and use \(K_\mu^{-1}\) in the target collar.
There is no derivative of \(K_\mu\) in this product computation.

Take ambient Clifford multiplication with \(c(v)^2=-|v|^2\) and set
\(c_Y(v)=-c(\mu)c(v)\) for tangent \(v\), restricted to \(S^+|_Y\).
The induced connection on this restriction is the product Levi-Civita
spin connection with the flat charge-one connection in its fixed
trivialization. Parallel normal transport and the zero second fundamental
form give
\[
 D^+=c(\mu)(\partial_u+B_{\mathrm{spin}}),\qquad
 B_{\mathrm{spin}}=\sum_{j=1}^3 c_Y(v_j)\nabla_{v_j}.
\]
The normal symbol \(c(\mu)\) carries \(S^+\) to \(S^-\) isometrically.
On the interval cover of each \(Y\), the tangential spin block is
\(c_Y(\partial_s)\partial_s+D_{S^2}\) in a product spin frame, with
\(D_{S^2}=\sum_{j=1}^2 c_Y(v_j)\nabla_{v_j}\) for sphere tangent \(v_j\).
These two terms anticommute. The square is
\(-\partial_s^2+D_{S^2}^2\), preserved by the seam transitions in §4.
The tangential block for \(D^-=(D^+)^*\) in the target bundle is
\(-c(\mu)B_{\mathrm{spin}}c(\mu)^{-1}\) when the inward normal symbol of
\(D^-\) is used. Write \(B=B_{\mathrm{form}}\oplus B_{\mathrm{spin}}\)
on the source bundle.

## 2. Kernels and the gauge quotient

Both tangential operators are symmetric on the closed three-manifold.
For the forms this uses the adjoint pair \(d_Y,d_Y^*\) and
\(\langle *_Y d_Y b,\beta\rangle=\langle b,*_Y d_Y\beta\rangle\), by
integration by parts. Also,
\[
 B_{\mathrm{form}}^2
   =\begin{pmatrix}\Delta_0&0\\0&\Delta_1\end{pmatrix}.
\]
The off-diagonal identities are \(d_Y^**_Yd_Y=0\) and \(d_Y^2=0\);
on one-forms \((*_Yd_Y)^2=d_Y^*d_Y\). On spinors the
Schrödinger–Lichnerowicz identity has no line-curvature term at this flat
background. The product scalar curvature is \(2/r^2\) on either quotient,
so \(\|B_{\mathrm{spin}}\psi\|_2^2\ge (2r^2)^{-1}\|\psi\|_2^2\).
Equivalently the only nonzero sectional-curvature contribution in the
spin curvature contraction comes from the sphere plane and is \(1/(2r^2)\).
These elliptic squares give ellipticity of \(B\). Its symmetric \(L^2\)
realization with domain \(H^1(Y)\) is self-adjoint with compact resolvent.
Indeed elliptic regularity places the maximal adjoint domain in \(H^1\),
and the graph norm controls \(H^1\), which embeds compactly in \(L^2\).

Each \(Y\) is an oriented sphere mapping torus over the length \(2\pi\)
circle. It is connected and its simply connected fiber gives
\(H^1(Y;\mathbb Z)=\mathbb Z\) with generator \([ds/(2\pi)]\).
The descended \(ds\) is parallel. Thus both collars have
\[
 \ker B_{\mathrm{form}}
   =\{(i c,i h\,ds):c,h\in\mathbb R\},\qquad
 \ker B_{\mathrm{spin}}=0 .
\]
These are kernels of the tangential operators at the frozen reducible.
In particular the result about spinors concerns boundary modes.

For an \(H^4\) gauge \(v\) on a piece the action is
\((\alpha,\Phi)\mapsto(\alpha-v^{-1}dv,v\Phi)\) in the charge-one
description. Its boundary restriction has order \(H^{7/2}\). The
tangential Hodge quotient by full boundary gauges removes the exact
part of \(b\). The harmonic connection is \(i h\,ds\) with
\(h\in\mathbb R/\mathbb Z\) because \(v=e^{ins}\) shifts \(h\) by \(-n\).
The corresponding shift in the determinant connection is \(-2i n\,ds\).
The coexact part of \(b\) survives the tangential quotient. The constant
circle stabilizes a flat connection representative and acts with weight
one on spinors. A nonzero winding sends the chosen background to a
different gauge-equivalent representative and intertwines the Dirac
operators at those two backgrounds. There is no extra flat determinant
sign from the seam in §4.

For Lie algebra parameter \(\xi\in H^4(i\mathbb R)\), the changes of
the boundary components are \(-d_Y\gamma\xi\) and
\(-\gamma\partial_u\xi\), respectively. The latter is \(H^{5/2}\) and
can be present when \(\gamma\xi=0\). Thus \(f\) is a field component
even at the constant boundary mode. In particular the scalar mode of
\(B_{\mathrm{form}}\) and the constant gauge stabilizer have different
roles. Local Coulomb gauge uses the unique Dirichlet solution
\(\Delta\xi=d^*\alpha,\ \gamma\xi=0\) of order \(H^4\) when
\(\alpha\in H^3\). After this fixing the infinitesimal Dirichlet
residual is zero by the Dirichlet energy identity.

For the full boundary-identity group there is a discrete qualification.
Write \(T\) for the tube, \(X\) for its exterior truncated at the
outer \(S^3\), and \(W=T\cup_Y X\) for the truncated \(4\)-ball.
The restriction \(H^1(T;\mathbb Z)\to H^1(Y;\mathbb Z)\) is an
isomorphism. Since \(H^1(W;\mathbb Z)=H^2(W;\mathbb Z)=0\),
Mayer–Vietoris gives \(H^1(X;\mathbb Z)=0\). Both pieces are connected
and \(H^1(T,\partial T;\mathbb Z)=0\). For \(X\) with both boundary
values set to identity, the relative group of components is
\(H^1(X,\partial X;\mathbb Z)\simeq\mathbb Z\) from the difference of
the two boundary constants in the cohomology sequence. Representatives
in Coulomb gauge are \(v_n=\exp(2\pi i n q)\), with \(q\) harmonic,
\(q=1\) on \(Y\) and \(q=0\) on the outer sphere. They affect the
normal derivative and leave the tangential connection on each
boundary fixed. These discrete choices occur if quotienting by the
whole boundary-identity group. On the fixed reassembly the common
boundary gauge must extend to both pieces, so it has winding zero on
\(Y\). The winding lattice describes the independent boundary or tube
quotient. The constant circle is retained in the problem on the closed
connected standard comparator.

## 3. APS and full transmission

Identify the source traces by the prescribed gluing, including the
bundle lift, and use the tube operator \(B_T\) as reference. Each side
uses its inward \(u\). The normal coefficient \(f\) changes sign between
the two sides, while the tangential \(b\) agrees and the induced
orientations on \(Y\) are opposite. With \(C\) the trace identification
from the tube to the exterior, \(C(f,b)=(-f,b)\) on forms in a shared
tangential chart, and
\[
 C^{-1} B_X C=-B_T .
\]
For forms this follows from \(*_{Y,X}=-*_{Y,T}\) and the sign of \(f\).
On spinors the shared four-dimensional \(S^+\) is identified by the
fixed lift and the factor \(-c(\mu)\) in \(c_Y\) changes sign.

| Side | Vanishing projection with its inward operator | Allowed traces in the tube identification |
| --- | --- | --- |
| Tube | \(P_{[0,\infty)}(B_T)\gamma=0\) | \(H^{5/2}_{(-\infty,0)}(B_T)\) |
| Exterior at \(Y\) | \(P_{(0,\infty)}(B_X)\gamma=0\) | \(H^{5/2}_{[0,\infty)}(B_T)\) |

The spectral zero block is assigned to the exterior once. Its
allowed condition is a generalized APS cut at a small positive number
below the least positive eigenvalue. At the outer sphere of \(X\), use its
own inward adapted operator \(B_{\rm out}\) for the fixed product data
and impose homogeneous \(P_{[0,\infty)}(B_{\rm out})\gamma=0\) on
perturbations for the APS experiment. Fixing the background data
leaves an allowed half-space for the perturbations. With a cap and a
split APS computation at that interface, its inward operator is the
transported \(-B_{\rm out}\), and its allowed traces include the zero
block once. With an actual cap transmission the paired full traces
are used at that interface.

The fields have order \(H^3\), targets \(H^2\), and full field traces
\(H^{5/2}\). The spectral projections act continuously on these trace
spaces, also on the \(H^{1/2}\) traces of the Hilbert-space operator
domains. The boundary-value theorem applies after complexifying the
form block (then taking its real form). The symbols of both bulk blocks
are elliptic. For the form block the symbol in the normal direction
is invertible after row normalization and unitary target identification,
and its normalized tangential symbol is skew-Hermitian in the
derivative-symbol convention. One may also check
\(({-d^*},\sqrt2\,d^+)^*({-d^*},\sqrt2\,d^+)=\Delta_1\) as an interior
differential-operator identity. For the spin block these properties
follow from the Clifford relations. The product formulas identify
adapted boundary operators and verify boundary symmetry in both
source and target. The pieces and boundaries are smooth and compact,
so completeness and coercivity at infinity are automatic for the
operators and formal adjoints in the cited sense. Generalized APS
domains are infinitely regular. Thus each restricted \(H^1\to L^2\)
problem is Fredholm. Higher regularity places its solutions for
\(H^2\) image data in \(H^3\). The image of the \(H^3\to H^2\) problem
is the \(H^2\) intersection with the \(L^2\) image, determined by the
finite smooth adjoint kernel, so this problem is also Fredholm. This
is a result for the augmented linear problem on these smooth compact
pieces. [Bär–Ballmann v2, Defs. 1.1, 1.4 and Standard Setup 1.5, pp. 4–5](https://arxiv.org/pdf/1101.1196v2#page=4) · [Examples 1.16(a), 7.27 and Thm. 7.17, pp. 8, 51, 57](https://arxiv.org/pdf/1101.1196v2#page=51) · [Ex. 8.3(a), Thm. 8.5 and Cor. 8.6, pp. 59–60](https://arxiv.org/pdf/1101.1196v2#page=59)

The augmented bulk operator and chiral Dirac block have different
source and target bundles. For an allowed trace subspace \(L\) and
normal symbol \(J\), the Hilbert adjoint uses the condition
\(J^*\gamma_{\rm target}\in L^\perp\) in the \(L^2\) Green pairing.
Thus the self-adjoint assertion above is for the tangential operator.
The \(L^2\) doubled realization on the sum of source and target
uses the closed APS operator and its Hilbert adjoint as opposite
off-diagonal entries, with the two paired domains. The spectral
domain here is imposed after gauge fixing. Independent raw gauges
need not preserve its trace projection. [Bär–Ballmann v2, Thm. 1.7, Addendum 1.13 and Rem. 1.14, pp. 6, 8](https://arxiv.org/pdf/1101.1196v2#page=8)

Full transmission at the inner seam is
\(\gamma_X(\alpha,\Phi)=C\gamma_T(\alpha,\Phi)\).
In the first-order \(H^1\to L^2\) formulation equality of the full
traces gives a global \(H^1\) field with the weak equation across the
seam. This realizes the original cut-and-reglued operator. With an
uncut outer boundary, its elliptic condition is kept. With an outer
cap the same full compatibility holds there. At \(H^3\) one may start
with global \(H^3\) fields, which on the pieces entails matching
normal jets through order 2 in a common collar trivialization. Equivalently,
for a weak \(H^1\) transmitted solution with a *globally* \(H^2\) source,
elliptic regularity across the seam gives those jets. Equality of the
zeroth traces of arbitrary piecewise \(H^3\) fields alone makes them
global \(H^1\).

The split homogeneous APS domains give separate problems. Their allowed
trace spaces are complementary in the shared identification; requiring
both half-domain conditions and full trace equality would force the
seam trace to vanish. For a smooth compact **closed** capped comparison,
one may apply the splitting theorem to the signed pair to equate the
uncut index and the split index, with one allocation of the kernel.
That index relation gives neither inverses nor the transmitted solution
space. [Bär–Ballmann v2, Ex. 7.28, pp. 57–58, Thm. 8.17 and proof, pp. 67–68](https://arxiv.org/pdf/1101.1196v2#page=57)

## 4. Seam actions, geometry and the Gerig marking

Let \(R_1(\theta)e_2=\cos\theta\,e_2+\sin\theta\,e_3\) and
\(R_1(\theta)e_3=-\sin\theta\,e_2+\cos\theta\,e_3\). In the twisted
model the terminal point \((2\pi,x)\) is glued to \((0,Ax)\) with
\(A=R_1(\pi)\), whereas the reference uses the identity. This is the
rotation in Honda's theorem that preserves its explicit two-form
and sends a vector in \(\mathbb R e_3\) to its negative. On forms
and scalars the transition is the ordinary tensor transport. In
particular \(f(2\pi,x)=f(0,Ax)\) and \(b(2\pi,x)=(A^*b(0,\cdot))_x\)
on the sphere component, with the same pullback rule on the whole
tangential one-form. The normal direction and \(ds\) are preserved
at the longitudinal seam. The operations \(d^*,d,*_Y,K_\mu\)
intertwine this orientation-preserving isometry, so all the indicated
scalar, one-form and self-dual target fields descend. Gauge functions
carry the scalar transition. [Honda, author revision 13 January 2004,
Prop. 5 and Thm. 6, pp. 5–6](https://www.math.ucla.edu/~honda/moser.pdf#page=5)

The periodic oriented \(\tau\)-frame at the circle is
\((ie^{is},-e^{is},1_w,i_w)\); the first two vectors make one ambient
plane rotation. A continuous spin lift therefore returns with sign
minus. For the frozen twisted chart
\(F_+(s,x)=\tau(s,R_1(s/2)x)\), multiply this lifted frame along the
interval by \(\widetilde R_1(s/2)\) starting at the identity. Hence the
terminal-to-initial lift is \(-\widetilde R_1(\pi)\), acting on both
spinor chiralities in their respective representations. For instance,
\(\Phi(0,Ax)=\rho_+(-\widetilde R_1(\pi))\Phi(2\pi,x)\) in the
corresponding interval spin charts, with the sphere action understood
as the restriction of the normal rotation lift. For the identity
reference it is \(-1\). The inverses act in the opposite direction.
With our convention the lift is
\(\widetilde R_1(\theta)=\exp(\theta e_2e_3/2)\) in the Clifford
algebra and \(\widetilde R_1(\pi)^2=-1\). The charge-one line uses
the trivial transition. The underlying spin restriction is that of the
actual tube in both identifications, with the lift stated in each
chart.

The diffeomorphism \([s,x]\mapsto(s,R_1(s/2)x)\) from the twisted
quotient to the ordinary smooth product trivializes the underlying tube.
If the whole metric, spin structure, flat background and domain are
transported, naturality conjugates the boundary operators and their
spectral projections. In ordinary product coordinates the transported
metric has sphere term
\(g_{S^2_r}(dy-V(y)\,ds,dy-V(y)\,ds)\), where
\(V\) generates the rotation \(R_1(s/2)\). This is the passive
change of coordinates. Keeping \(ds^2+g_{S^2_r}\) in both frozen
quotient charts is a geometric choice. The same displayed local
metric has different longitudinal return maps. The Ricci-null line
is the parallel length direction in each metric. Its flow has
period \(2\pi\) at every point of the untwisted quotient, and has
period \(4\pi\) off the rotation poles of the twisted quotient.
An isometry would preserve the Ricci-null line and the unit-speed
periods. Thus these two product-quotient metrics are nonisometric.
The common kernels computed above require only the local formulas
and the stated seam conditions.

**Actual first jet.** The frozen tube lies inside the unmodified
birth-form region because \(|(z,w)|\le a+r<\sqrt2\,a\), and the
outer sphere at \(64a\) lies past the standard end cutoff. In the
oriented Euclidean orthonormal coframe at \(C\), put
\(t=a\,ds\) and \(\beta_i=t\wedge dx_i+dx_j\wedge dx_k\) for cyclic
\((i,j,k)\). Gerig's coefficient of the standard form has first
variation \(-2a x_1\). The coefficient in his \(dz\wedge dw\) term
has first variation \(Q=R(x_2+i x_3)-ae^{-is}(x_2-i x_3)\).
Since \(dz=e^{is}(-dx_1+it)\) and
\(dz\wedge dw=ie^{is}(\beta_2+i\beta_3)\) at \(C\), the coefficient
variations of \(\beta_2,\beta_3\) are
\(-\Re(e^{is}Q),\Im(e^{is}Q)\). The jet matrix, up to the single
nonzero constant multiplying the inner form, is
\[
 L(s)=
 \begin{pmatrix}
  -2a&0&0\\
  0&a-R\cos s&R\sin s\\
  0&R\sin s&a+R\cos s
 \end{pmatrix}.
\]
It is symmetric, traceless and invertible for \(R>a\). Its
exceptional-sign eigenline has eigenvalue \(a+R\) in the displayed
convention and is
\(\mathbb R R_1(-s/2)e_3\). For a positive constant multiplier
the displayed \(s\)-direction has two negative eigenvalues.
Taking the canonically oriented tangent instead gives two positive
eigenvalues and identifies this same line as the negative line.
Changing the overall sign selects the tangent sign accordingly.
The line is Möbius. [Gerig, arXiv:1905.10938v3, 9 November 2020,
Ex. 1.7, p. 3](https://arxiv.org/pdf/1905.10938v3#page=3) ·
[Perutz, arXiv:math/0601320v2, 15 January 2007, §2.3 and Prop. 2.2, PDF pp. 6–7](https://arxiv.org/pdf/math/0601320v2#page=6)

With the specified positive rotation convention, the frozen chart
\(F_+\) takes Honda's marked line to \(\mathbb R R_1(s/2)e_3\),
which differs from the actual Gerig line at a general \(s\).
Using the opposite half-rotation would align the lines, and the
terminal lift for that chart would be
\(-\widetilde R_1(-\pi)=+\widetilde R_1(\pi)\), since the two changes of
frame differ by one full rotation. This identifies the ambiguity if
the sign of \(R_1\) in B01 is taken as unspecified. B02 must choose the
chart and transport its lift, metric, domains and seam data together
if the marked comparison is retained.

Even a line-aligned chart does not give an exact smooth identification of
the forms. Where \(R\ne 3a\), the magnitudes \(2a\) and \(R-a\) of the
two same-sign eigenvalues differ. Honda's linear model has equal
same-sign eigenvalues. At a zero, an orientation-preserving smooth
identification of the form germs would carry the three-planes
\(\operatorname{im}D\omega=\Lambda^+\) into one another under pullback,
so its differential would be conformal for the two induced metric
classes. Its conformal differential changes the normal matrix by
orthogonal conjugation and a common scale (two powers from the
two-form and one from the derivative, with an overall sign if the
tangent or form sign is reversed). Therefore it preserves the
unordered same-sign ratio up to reciprocal. This rules out a smooth
germ equality up to overall sign or constant for the frozen
sufficiently small \(a\) and large \(R\) regime. Honda's Thm. 7
provides local representatives after a deformation of closed forms
on its stated domain, with common zeros and symplecticity off the
zeros. It supplies no isometry or equality of the two original jets.
[Honda, Thm. 7 and proof, pp. 6–7](https://www.math.ucla.edu/~honda/moser.pdf#page=6) ·
[Earlier first-jet check](../../../../02_zero_circles/notes/E03_LOCAL_SOURCES.md#first-jet-and-smooth-models)

## Return to B02

The ordinary linear operator on the frozen smooth collar has no
coupling to the distinct eigenline, and its zero modes and local
gauge quotient agree on both collars. The marked comparison needs a
consistent chart and induced lift as above and a separately specified
coupling or boundary condition that uses the marking. The first-jet
obstruction applies to identifying the original form with the exact
Honda representative. The calculation ends at the tangential kernels,
covariant frame transport and these compact linear domains. A spectrum,
nonlinear relative state or defect invariant would require another
frozen question.

Primary passages were checked on 28 November 2026 at the links above.
The boundary-theorem source is Christian Bär and Werner Ballmann,
*Boundary value problems for elliptic differential operators of first
order*, Surveys in Differential Geometry 17 (2012), pp. 1–78.
The inspected version is arXiv:1101.1196v2, dated 21 November 2011.
