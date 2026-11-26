# E63b · The eta-zero face and its retained half

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance under MASTER-E63b, revision 1, construction B02. GPT-6.2
Sol/ultra was requested. Actual serving settings are unavailable.
Frozen [construction bundle](../manuscript/marked_immersed_handle_constructions.tex)
`93a6cf742e2df331` and [E62 assessment](../../../../master/research-progress/handoffs/E59_E62_SPECTRAL_WINDOWS_20261125.md)
`e2101647a907e16b`. The [short-seam section](../manuscript/short_seam.tex)
and [E59 calculation](E59_SHORT_SEAM.md) fix the actual Mazur cut,
orientation, metrics and Weyl normalization. This packet concerns
intrinsic smooth Riemannian metrics on a marked domain.

## What positive free trace forces

Let \(W\) be a compact oriented spin four-manifold with connected
marked boundary \(Y\). For the Mazur application it is the contractible
half of the \(n=1\) diagram fixed in E59. Fill any marked round
punctures by the original conformally flat caps. Include the actual
half-cylinder up to its midpoint if there is one. On the resulting
compact half \(h\), let \(J_h=-6\Delta_h+R_h\), with the outward
Neumann condition. Its free-trace quadratic form is
\[
 Q_h(u)=\int_W(6|du|_h^2+R_hu^2)\,dV_h,\qquad u\in H^1(W).
\]
Minimization on the round ends gives exactly the earlier reduction
on the punctured half, including the corresponding half-cylinder.
For the identity double with reflected metrics, restriction and
even extension give the equivalence between strict ordinary
closed sign and \(Q_h>0\) on every nonzero test.

At a totally geodesic product seam, suppose \(Q_h>0\).
Its lowest Neumann eigenvalue is positive by compactness and its
positive eigenfunction \(u\) is smooth, positive up to the boundary,
and satisfies \(\partial_\nu u=0\). One can also restrict the
positive first eigenfunction on the reflected double. It is
reflection invariant by simplicity. The conformal metric \(g=u^2h\)
has
\[
 R_g=u^{-3}J_hu=\lambda_1u^{-2}>0,\qquad
 \mathrm{II}_g=u\bigl(\mathrm{II}_h+h|_Y\,\partial_\nu\log u\bigr)=0 .
\]
Its induced boundary metric is \(u_Y^2\gamma\). A general
unequal-half gluing does not give this boundary derivative condition.

Take outward-normal-first boundary orientation and the boundary
spin convention of APS I, (4.1)–(4.2). For the ambient Dirac
operator the two boundary chiral operators \(A_\pm\) are paired by
normal Clifford multiplication, which exchanges their spectral signs.
In the integrated spin Lichnerowicz identity, the boundary term
at zero mean curvature is \(\int_Y\langle A_\pm\psi,\psi\rangle\).
For a harmonic spinor with nonpositive spectral trace the term is
nonpositive, while the bulk \(\int_W(|\nabla\psi|^2+R_g|\psi|^2/4)\)
is positive unless \(\psi=0\). The APS domains using strictly
negative or nonpositive trace both have zero kernel, and their
adjoints are the corresponding opposite chiral domains with the
complementary choice at zero. Both cokernels vanish. Enlarging the
negative domain by the zero modes adds their dimension to its index.
Consequently the boundary spin Dirac kernel itself vanishes.
Equivalently, the equality case for the lowest nonnegative boundary
eigenvalue at \(H=0\) in the spinorial Reilly theorem would give a
nonzero parallel bulk spinor, impossible when \(R_g>0\).
[Hijazi–Montiel–Zhang, *Dirac operator on embedded hypersurfaces*, (13), (17), Theorem 6](https://archive.intlpress.com/site/pub/files/_fulltext/journals/mrl/2001/0008/0002/MRL-2001-0008-0002-a008.pdf) ·
[Bär–Ballmann, *Guide to elliptic boundary value problems*, Examples 4.21, 5.12 and Corollary 6.2](https://hirzebruch.mpim-bonn.mpg.de/id/eprint/253/1/AT2013-InMemoryOfHirzebruch.pdf)

Transfer this conclusion to the actual product boundary \(\gamma\).
Conformal covariance in dimension three gives, after spin bundle
identifications,
\[
 D_{e^{2f}\gamma}(e^{-f}\phi)=e^{-2f}D_\gamma\phi.
\]
The boundary kernel dimension is therefore constant along the conformal
path from \(h\) to \(u^2h\), and the zero boundary kernel at the latter
endpoint gives a uniform spectral gap along the continuous compact
path. Under fixed Sobolev identifications the negative spectral
projections vary continuously in operator norm. For example, the
sign operators are obtained by parameter-dependent elliptic functional
calculus with the common gap. Local continuous identifications of
their ranges, lifted by the trace right inverse, give a continuous
Fredholm family. Thus the APS index for the product metric \(h\)
is zero. This argument transfers the APS index and boundary nullity.
It does not identify the APS eigenspaces or the individual eta values
under conformal multiplication. The adapted intrinsic boundary
operators also give the APS domains at the totally geodesic,
generally nonproduct, PSC endpoint.
[APS I, (4.1), (4.2) and Remark 2 after Theorem (4.2)](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps001.pdf) ·
[Bär–Ballmann, §§4 and 6](https://hirzebruch.mpim-bonn.mpg.de/id/eprint/253/1/AT2013-InMemoryOfHirzebruch.pdf)

On the original product-germ half the two primary APS formulae,
\(\widehat A_4=-p_1/24\) and \(L_4=p_1/3\), give
\[
 \operatorname{ind}_{\mathrm{APS}}D^+_h
 =-\frac{\sigma(W)+\eta_{\rm sig}(Y,\gamma)}8
   -\frac{\eta_{\rm spin}(Y,\gamma)+d_0(Y,\gamma)}2,\qquad
 d_0=\dim_\mathbb C\ker D_\gamma .
\]
Here \(\eta_{\rm spin}\) is the unreduced spin Dirac eta.
\(\eta_{\rm sig}\) is the unreduced odd signature eta on even forms.
Both change sign when the boundary orientation is reversed.
For the product contractible half \(\sigma(W)=0\).
Hence a genuinely positive free trace forces
\(d_0=0\) and \(4\eta_{\rm spin}+\eta_{\rm sig}=0\), regardless of
the Weyl energy. On the eta-zero face it forces \(\eta_{\rm spin}=0\).
[APS I, Theorems (4.2) and (4.14)](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps001.pdf)

## The actual homogeneous eta-zero metric passes this necessary test

Use the fixed left-invariant oriented Milnor coframe \(e^1,e^2,e^3\)
on \(Y=\Pi\backslash\widetilde{\rm PSL}_2(\mathbb R)\) from E59.
Its dual frame \(X_1,X_2,X_3\) has cyclic brackets \((a,a,-a)\).
Set
\[
 \gamma(v)=(e^1)^2+(e^2)^2+v^2(e^3)^2,\qquad v>0,\qquad
 v_*^2=\frac{\sqrt{159}}{11}-1 .
\]
The \(X_3\) flow is the right fiber rotation and has period
\(22\pi/a\). The global oriented spin framing gives the unique
spin structure since \(Y\) is an integral homology sphere.
In that framing put \(C_i=c(e_i)\) for the constant matrices in
the \(\gamma(v)\)-orthonormal frame and \(\omega=C_1C_2C_3\).
On the spin representation \(\omega=\pm 1\), with its sign fixed
by the choice of Clifford and orientation convention. The following
norm bound holds for either convention. Put
\[
 H=C_1X_1+C_2X_2,\qquad V=C_3X_3+\frac a2\omega .
\]
Koszul's formula for brackets \((a/v,a/v,-av)\) and the spin
connection give
\[
 D_v=H+v^{-1}V-\frac{av}{4}\omega,\qquad
 HV+VH=0 .
\]
Indeed the connection term is \(a/(2v)-av/4\) times the Clifford
volume. The anticommutator of \(H\) with \(C_3X_3\) is
\(-a\omega H\); the other term cancels it. The \(X_i\) are
skew adjoint for Haar volume on the unimodular quotient and the
\(C_i\) skew Hermitian, so the anticommutator identity gives
\(\|(H+v^{-1}V)\psi\|_2^2=\|H\psi\|_2^2+v^{-2}\|V\psi\|_2^2\).
In the global spin framing the \(X_3\) frequencies are among
\(i(a/11)\mathbb Z\). Since \(C_3\) has square \(-1\) and
commutes with \(\omega\), \(\|V\psi\|_2\ge (a/22)\|\psi\|_2\).
Thus
\[
 \operatorname{dist}\bigl(0,\operatorname{spec}D_v\bigr)
 \ \ge\ \frac{a}{22v}-\frac{av}{4}>0
 \quad\text{when }0<v^2<\frac2{11}.
\]
The eta-zero value lies in that range because \(\sqrt{159}<13\).
No spin spectral flow occurs between it and any sufficiently
collapsed positive fiber length.
[Milnor, *On the 3-dimensional Brieskorn manifolds*, Corollary 6.5 and §3](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/neuwir3.pdf) ·
[E59, fixed quotient and fibers](E59_SHORT_SEAM.md#the-actual-homogeneous-mazur-seam)

To fix the constant in the combined APS term, use Nicolaescu's
small-fiber spin computation. In the contact orientation
\(\theta\wedge d\theta>0\), the base area here is \(11\pi/(35a^2)\)
and \(\theta=(a/11)e^3\). Scaling by \(35a^2/11\) makes the base
area \(\pi\), the regular fiber radius \(r=\sqrt{385}\,v\), and
\(d\theta=(1/35)dA_{\rm base}\). This is precisely the connection
normalization \(d\theta=-2\ell\,dA_{\rm base}\) with
\(\ell=-1/70\) in Nicolaescu §1.2. The constant-curvature triangle
base and connection are fixed as \(v\) varies. Changing the
constant-curvature model through a marked isometry of the triangle
orbifold changes neither result. Connections with the same curvature
on that circle bundle differ by a closed one-form on the orbifold
base and are gauge equivalent since its real first cohomology
vanishes.

Here
\[
 (\alpha_i)=(2,5,7),\quad(\beta_i)=(1,1,2),\quad
 \kappa=11/70,\quad \rho=\{\kappa/(2\ell)\}=1/2 .
\]
The spin isotropies for the flat determinant operator in Nicolaescu
are \(\gamma_i=m\beta_i\bmod\alpha_i\) with
\(m=\kappa/(2\ell)-\rho=-6\), giving \((0,4,2)\).
The corresponding inverses \(q_i\) of \(\beta_i\) are \((1,1,4)\).
Equation (1.34) has a term proportional to \(1-2\rho\), hence zero
here. Its three Dedekind–Rademacher terms
\(s(\beta_i,\alpha_i;(\gamma_i+\beta_i\rho)/\alpha_i,-\rho)\)
are \((0,1/5,-1/7)\); the three fractions
\(\{(q_i\gamma_i+\rho)/\alpha_i\}\) are
\((1/4,9/10,3/14)\). These finite sums use the sawtooth equal to
zero on integers. Equation (1.35) sends the Levi–Civita spin
eta to this adiabatic value as \(r\downarrow0\). Substituting gives
\[
 \lim_{v\downarrow0}\eta_{\rm spin}(Y,\gamma(v))
 =-\ell/4+\ell/6+3/2-2(1/5-1/7)-(1/4+9/10+3/14)
 =\frac{19}{840}.
\]
Nicolaescu orients this Brieskorn link as the boundary of its
complex filling and uses the spin APS convention in the paired
formula (1.36). These are the same as the contact orientation and
spin APS convention here. The small-fiber odd signature limit is
\(-19/210\) from the primary signature excision computation in E59.
The combination is therefore zero in the limit. A product-ended
interpolation cylinder has signature zero; the spin APS index is
constant and zero for a path piece with invertible boundary Dirac
operators and no crossings. Combining both index formulae shows
that \(4\eta_{\rm spin}+\eta_{\rm sig}\) stays constant on the
gap interval. Equivalently choose a smooth path of product-germ
metrics on one fixed contractible filling, use the continuous APS
domains, and apply the combined index formula at each parameter.
It follows that throughout \(0<v^2<2/11\)
\[
 \eta_{\rm spin}(Y,\gamma(v))
   = -\eta_{\rm sig}(Y,\gamma(v))/4
   = \frac{38-121(2v^2+v^4)}{1680}.
\]
At \(v=v_*\) both eta values, the boundary nullity and the spin
APS index of every product-germ contractible filling vanish.
Thus this pair of APS tests gives no exclusion at the actual face.
[Nicolaescu, *Finite energy Seiberg–Witten moduli spaces*, §§1.2 and 3.2, (1.6), (1.34)–(1.36), Remark 1.13](https://arxiv.org/pdf/dg-ga/9711006v2) ·
[Nicolaescu, *Lattice points inside rational simplices*, §1](https://academicweb.nd.edu/~lnicolae/Casson-lattice.pdf)

As an arithmetic check, the normalized negative plumbing is
a central \(-1\) with arms \((-2),(-5),(-4,-2)\), with terminal
continued fraction \(7/2=[4,2]\). The central Schur complement
is \(-1+1/2+1/5+2/7=-1/70\), so its signature is \(-5\).
Solving \(Qw=\operatorname{diag}Q\bmod2\) with coefficients
zero or one gives only the \(-5\) vertex. Thus \(w^2=-5\) and
\(\bar\mu=0\). In Ruberman–Saveliev's even-case eta sum (5) the
unshifted terms for \((q,p)=(35,2),(14,5),(10,7)\)
are \(0,-1/5,-1/14\) and the shifted terms at \((1/2,1/2)\)
are \(1/8,-2/5,2/7\). That sum is zero, agreeing with this
fixed-metric calculation through the small-fiber interval.
[Ruberman–Saveliev, *The \(\bar\mu\)-invariant*, Theorem 1, equation (5), and §3](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/rubsav1.pdf)

## An equivalent filling test without an exact product premise

Fix the actual marked compact half \(W\) and its face metric
\(\gamma\), and a strict budget \(C>0\). The following are equivalent.

1. A reflected identity double, capped in the marked balls if there are
   punctures, has positive ordinary Yamabe sign, an exact product germ
   of \(\gamma\) at the midpoint, and both chiral energies \(<C\).
2. The marked half \(W\) has a smooth metric \(g\) of positive scalar
   curvature with totally geodesic boundary in the conformal class
   of \(\gamma\) in that marking, and
   \(E_+(g;W)+E_-(g;W)<C\).

For the forward implication include the half-cylinder and repeat the
Neumann argument. Weyl energy is conformally invariant in dimension
four. Reflection swaps chiralities so the half sum is exactly the
closed energy in each of its chiralities.

For the converse write \(g|_Y=b^2\gamma\) with \(b>0\) smooth.
Extend \(b\) positively to \(W\) with zero normal derivative at \(Y\)
and set \(h=b^{-2}g\). It has boundary metric \(\gamma\), zero second
fundamental form and the same Weyl integrals. In its Fermi collar
\(h=dt^2+h_t\) one has \(h_0=\gamma\), \(\partial_t h_0=0\).
Use that collar to form the oriented reflected double. Even reflection
of \(h_t\) gives a \(C^2\) metric, smooth away from the seam.
The corresponding even conformal factor is \(C^2\) by its zero
normal derivative. Its \(b^2\)-rescaling is strictly PSC on both
halves and across the midpoint by continuity. Therefore the
ordinary closed form of the even \(h\) is strictly coercive on
\(H^1\).

Let \(\chi\) be zero near \(0\), equal to one for \(s\ge1\) and
smooth, with \(0\le\chi\le1\). Replace \(h_t\) on both halves
by
\[
 h_t^\delta=\gamma+\chi(t/\delta)(h_t-\gamma).
\]
Its even double is smooth and exact product near the seam.
Taylor expanding the fixed Fermi metric at zero gives
\(\|h^\delta-h\|_{C^1}=O(\delta)\) on the fixed double and a
uniform \(C^2\) bound. The scalar densities on the changed
collar are uniformly bounded. Since the changed region
has volume \(O(\delta)\), Hölder and the fixed four-dimensional
Sobolev inequality bound the scalar form difference by
\(O(\delta^{1/2})\|u\|_{H^1}^2\). The gradient part is
\(o(1)\|u\|_{H^1}^2\) by \(C^0\) closeness. The chiral integrals
differ by \(O(\delta)\), since the changed region has that
volume order and the curvature is uniformly bounded there.
Thus the product flattening preserves a strict energy budget.

If round punctures are required, first flatten the interior metric
in small disjoint coordinate balls using its normal jets at their
centers and a radial cutoff. The same \(C^1\) and uniform \(C^2\)
estimates give preserved ordinary sign and vanishing added energy.
In a prescribed smooth ball marking, pull the metric back by a
diffeomorphism supported in a larger marked chart to put its
normal first jet at the marked center. Such a local orientation
compatible coordinate germ extends to a compactly supported
diffeomorphism by cutting off a local isotopy, first for its
positive linear derivative and then for its germ tangent to the
identity. If the puncture radius is fixed, a radial diffeomorphism
supported in the larger chart carries the prescribed ball and a
small adjacent annulus into the smaller flat ball by a constant
homothety there. Pullback preserves both energies and the
ordinary sign. A smooth positive conformal change with factor
\(1/r\) after normalizing the constant Euclidean coefficient gives
the actual exact unit round cylindrical collar, while capping the
interior ball conformally flat in its own marking. These operations
are supported away from the seam. The reflected metric and its
identity double use corresponding operations on both halves.

After the product flattening, the zero-length double already
has strict positive free-trace sign on one half. Coercivity and
the E59 length estimate preserve it for sufficiently small
positive insertions. The inserted cylinder cost is exactly
\(L\rho_\gamma\), so the strict energy budget also persists.
This establishes the equivalence with prescribed puncture marks
and arbitrarily short positive insertions. The positive length
and process of forming a new half are essential freedoms here.
It gives no statement about flattening a supplied half when
a fixed product width and unchanged exterior are imposed.

On the contractible eta-zero half, signature APS gives
\(E_+=E_-\) for each approximating product metric. The energy
convergence and conformal invariance transfer the equality
to the original totally geodesic \(g\). For \(C=8\pi^2\) one
may thus impose the equivalent half budget \(E_+(g;W)<4\pi^2\).

The totally geodesic boundary of such a PSC filling would be
strictly unstable as a minimal hypersurface in the reflected
double. Write \(\mu=\lambda_1(-8\Delta_{g|_Y}+R_{g|_Y})\).
It is negative because the Mazur boundary admits no metric of
nonnegative scalar curvature, as proved in E56. At zero second
fundamental form the Gauss equation gives
\(2\operatorname{Ric}_g(\nu,\nu)=R_g-R_{g|_Y}\).
Evaluating the Jacobi form on a unit lowest eigenfunction
\(\phi\) of the boundary conformal Laplacian gives
\[
 \lambda_1(-\Delta_{g|_Y}-\operatorname{Ric}_g(\nu,\nu))
 \le \tfrac12(\mu-\min_Y R_g)-3\int_Y|d\phi|^2<0 .
\]
This excludes a stable minimal filling in that conformal class.
Local strict positivity and total geodesicity themselves are
compatible with the fixed face. For instance
\(\cos^2(kt)(dt^2+\gamma(v_*))\) near \(t=0\) has those data
when \(6k^2+R_{\gamma(v_*)}>0\). Its scalar curvature is
\(\cos^{-2}(kt)(6k^2+R_{\gamma(v_*)})\). The local collar
does not provide a global filling or charge its interpolation.
[E56, Mazur boundary scalar-curvature obstruction](E56_MARKED_EXTERIOR.md#the-actual-mazur-double)

## E66b · Inclusive recognition on fixed twisted doubles

26 November 2026. Bounded follow-on MASTER-E66b, revision 1.
For a smooth compact oriented contractible \(W\) with marked
boundary \(Y\), suppose a specified smooth metric \(h\) on \(W\)
has positive scalar curvature and totally geodesic boundary
conformal to a prescribed smooth metric \(\gamma\) in that marking.
Let \(\Lambda_h\) be the larger of the two largest signed Weyl
eigenvalues. Put
\[
 B_h=E_+(h;W)+E_-(h;W),\qquad G_h=\int_W\Lambda_h^2\,dV_h .
\]
For any fixed orientation-preserving \(\gamma\)-isometry
\(f:Y\to Y\), the oriented smooth manifold \(M_f=W\cup_f(-W)\)
is a homotopy four-sphere by van Kampen, Mayer–Vietoris and
Poincaré–Lefschetz duality. The original orientation on the
second copy is reversed, so the same \(f\) reverses the induced
boundary orientations when regarded as the gluing map.
For every such \(f\) there are smooth positive Yamabe classes
on this fixed \(M_f\) with limits
\[
 E_\pm\longrightarrow B_h,\qquad
 P\longrightarrow 4B_h+6G_h .
\]
Here \(P=4E_++3\int\Lambda^2dV\) and \(T=4\pi^2\) are as in
the master's recognition theorem.

First make the boundary metric exactly \(\gamma\) by the fixed
conformal factor with zero normal derivative and use the previous
productization. For each sufficiently small cutoff width \(\delta\),
the single product half \(h_\delta\) has a positive ordinary
free-trace form by even extension and coercivity of the reflected
form. Both chiral Weyl densities and \(\Lambda^2dV\) are conformally
invariant in four dimensions. The product deformation has bounded
curvature on a set of volume \(O(\delta)\) and agrees with the
fixed conformal metric elsewhere. The energy and squared eigenvalue
integrals on each half tend to their values on \(h\). Round
punctures, if requested, are from the same disjoint marked
balls with their flattening radii tending to zero. Their metric
changes before conformal conversion have bounded curvature and
vanishing supported volume, so both integrals have the same limits.
The round collars and caps contribute no Weyl curvature.

Glue the two copies by \(f\), which preserves their actual product
germ. For this metric each global \(H^1\) function restricts to
an admissible free-trace function on both halves. Their ordinary
forms add and some restriction is nonzero, proving strict
positivity and hence positive Yamabe sign on this twisted
class. If a positive collar length \(s_\delta\) is desired, first
extend each half by half the cylinder. Choose \(0<s_\delta\le
\delta\) small enough for the reflected ordinary free-trace test
for that particular \(\delta\). The two extended halves remain
isometric under relabeling the product by \(f\), and the same
sum-of-forms proof applies. Retain the same \(f\) at every step.
Collared reparametrizations identify the length-inserted manifold
with \(M_f\), fixing each half off its seam collar and preserving
the boundary marking on the product coordinates. In particular
the positivity proof refers to the constructed metric on each
isometric gluing.

Opposite orientations on the two identical halves swap the two
chirality densities and preserve \(\Lambda^2dV\). Thus each
closed chiral energy is the sum of the two half chiral energies
plus its inserted strip charge. The closed \(\Lambda^2\) integral
is twice the half integral plus its strip charge. Each strip
integral is \(O(s_\delta)\) for the fixed \(\gamma\).
The displayed limits follow with the same \(B_h,G_h\) for all
of these isometries.

The infima over actual positive classes on each fixed \(M_f\)
are consequently at most \(4B_h+6G_h\) and \(B_h\). If
\[
 4B_h+6G_h\le 8T+\eta
 \qquad\text{or}\qquad B_h\le T+\varepsilon_* ,
\]
the corresponding inclusive master theorem gives
\(M_f\cong_{\rm diff} S^4\). At equality the constructed energies
need only approach the threshold. The hypothesis still asks for
an actual PSC totally geodesic filling on the stated marked half.
[Master uniform spectral recognition](../../../../master/manuscript/recognition_gap.tex) ·
[DESC isotropic spectral gap](../../../../master/01_fixed_type_variational_descent/manuscript/isotropic_gap.tex)

## Scope of the return

The \(v=1\) homogeneous face still has its previous energy obstruction
for all lengths. The actual \(v=v_*\) face passes the spin and signature
tests. Its ordinary and modified transverse first eigenvalues are
\(-a^2(2+v_*^2/2)\) and \(-3a^2(1+v_*^2/2)\). The zero-trace
test therefore still excludes the ordinary sign at
\(aL\ge\pi\sqrt{6/(2+v_*^2/2)}\), and the modified sign at
\(aL\ge\pi\sqrt{2/(1+v_*^2/2)}\). The strip charge is still
\((121\pi^2/105)aL\,v_*(1+v_*^2)^2\) in each chirality. These
are tests on the full actual product span. The ordinary and energy
conditions still have to be obtained on an actual half. The
equivalent totally geodesic filling test permits any boundary
conformal representative and removes exact product interpolation
as a separate existence premise at strict energy. It supplies
no such filling on the known Mazur presentation and no new
smooth-type realization. The further displayed nonextendible cork
double in E59 is already standard. The conditional isometric twist
comparison transfers only after one qualifying retained half is
supplied.

