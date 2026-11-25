# E59c · The marked short product seam

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
Bounded execution MASTER-E59c, revision 1, for the immersed construction B02
and master entry tests. Actual serving model and reasoning effort are
unavailable. Frozen repository base
`b5ce9f481a7604a411b9e1bde5383b2bc122fb5c`, with SHA-256 prefixes
`5c0005ef70f9` for [E56d](E56_MARKED_EXTERIOR.md) and
`e81683ba443b` for the [construction seam section](../manuscript/marked_double_exterior.tex).
The [master](../../../../master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex)
and [DESC](../../../../master/01_fixed_type_variational_descent/manuscript/fixed_type_chiral_energy_descent.tex)
are read at the same base. The calculation concerns intrinsic smooth Riemannian
metrics in the frozen markings. \(W^\pm\) are operators on real chiral
two-forms with Hilbert–Schmidt norms, and \(-\Delta\) is nonnegative.
It uses no immersion or Lean result.

## Fixed halves and their trace forms

Let \(X_i\) be the retained compact halves of smooth oriented contractible
four-manifolds with connected boundary, punctured at finitely many
interior marked balls. The outer boundary of each \(X_i\) has the unit
round product metric in each ball marking. Name the other boundary
\(Y_i\). Use a collar on it, with exact product face metric.
The maps \(j_0:Y\to Y_0\) and \(j_1:Y\to Y_1\) identify the faces
of the inserted product \([0,L]\times(Y,\gamma)\). Both are isometries
for the respective face metrics. The second half has its orientation
reversed in the joined manifold. In the E56d convention
\(j_0=\mathrm{id}\) and \(j_1=f\), with \(f\) orientation preserving
as a map between the original oriented boundaries. Hence the physical
trace at \(Y_1\) of a cylinder-side trace \(\psi_1\) is
\(\psi_1\circ f^{-1}\). Collared reparametrization identifies this
manifold with the zero-length gluing, fixed off the seam neighborhoods.
After capping the punctures in the given coordinates, van Kampen and
Mayer–Vietoris give the homotopy type of \(S^4\).

For a potential \(V\), use \(V=R\) for the ordinary test and
\(V=R-6\Lambda\) for the modified test, where \(\Lambda\) is the maximum
of the two largest signed Weyl eigenvalues. On \(X_i\) put
\[
 q_i(u)=\int_{X_i}(6|du|^2+Vu^2)\,dV_{h_i}
 +6\sum_b\langle \tau_bu,\sqrt{1-\Delta_{S^3}}\,\tau_bu\rangle .
\]
Here \(b\) runs over the round puncture faces, with their actual
parametrizations. The round-end term is the exact minimum over
the corresponding conformally flat infinite cylinders. The
minimizer of each round mode of frequency \(\lambda\) is
\(e^{-s\sqrt{1+\lambda}}\) times its boundary coefficient. The
round-end construction identifies this form test with positive
ordinary conformal-Laplacian sign, or with positive modified form
sign, respectively, on the marked capped class. Strict positivity
on all nonzero tests gives a genuine positive normalized quotient:
the closed first Rayleigh value is attained by compactness, and the
bounded potential then gives \(H^1\) coercivity and the Sobolev bound.
[Master round-boundary form](../../../../master/manuscript/marked_cut.tex#L117) ·
[E54 marked-exterior review](../../../../master/reviews/E54_SPECTRAL_ENDPOINT.md#recognition-from-a-marked-exterior)

If \(q_i\) is nonpositive on a nonzero test with zero \(Y_i\)-trace,
that test extends by zero through the seam and gives failure for
every \(L\) and every compatible marking. Otherwise \(q_i\) is
coercive on the zero-seam-trace subspace. The compact \(L^2\)
embedding, bounded interior potential, elliptic gradient term, and
nonnegative weakly lower semicontinuous round-end term prove this
by the Rayleigh argument. For fixed seam trace \(\psi_i\) in cylinder
coordinates, minimize by solving the homogeneous equation on \(X_i\)
with the round-end condition
\(6\partial_\nu u+6\sqrt{1-\Delta_{S^3}}\,\tau_bu=0\).
Dirichlet data are \(u|_{Y_i}=\psi_i\circ j_i^{-1}\).
The unique affine minimum defines the quadratic trace form
\[
 d_i[\psi_i]=\inf_{\operatorname{Tr}_{Y_i}u=\psi_i\circ j_i^{-1}}q_i(u)
 =\big\langle\psi_i,6j_i^*(\partial_{\nu_i}u|_{Y_i})\big\rangle.
\]
The last pairing uses the exterior unit normal on \(X_i\) and is
interpreted weakly between \(H^{1/2}\) and \(H^{-1/2}\).
For a duplicate copy \(h_1=h_0=h\), its contribution in the original
marking is \(d_h[\psi_1\circ f^{-1}]\). Orientation reversal
preserves either potential.

## Exact cylinder contribution and admissible length

Set \(A=-6\Delta_\gamma+V_\gamma\), where \(V_\gamma=R_\gamma\)
for the ordinary test and \(V_\gamma=3r_{\min}\) for the modified
test. The product Riemann tensor gives chiral eigenvalues
\(R_\gamma/6-r_i/2\) in a Ricci eigenframe, which proves the
modified potential and the energy density below. Enumerate the
real eigenbasis \(\phi_j\) in \(L^2(\gamma)\), with eigenvalues
\(\ell_j\), and write \(\psi_i=\sum_j x_{ij}\phi_j\).
The potential is bounded and the eigenbasis and \(H^{1/2}\) form
domains follow from the compact elliptic resolvent.

If \(\ell_1+6\pi^2/L^2\le 0\), the cylinder already gives a
nonpositive Dirichlet test with zero seam traces. Otherwise it is
coercive on its zero-endpoint subspace. The exact minimum for the
two specified traces is
\[
 c_L[\psi_0,\psi_1]=
 \sum_j (x_{0j},x_{1j})\, C_L(\ell_j)
                     (x_{0j},x_{1j})^{\mathsf T}.
\]
For \(k=\sqrt{|\ell|/6}\) and real \(0<L<\pi/k\) in the
negative case, the matrices are
\[
 \begin{aligned}
 C_L(\ell>0)&=6k
 \begin{pmatrix}\coth(kL)&-\operatorname{csch}(kL)\\
                 -\operatorname{csch}(kL)&\coth(kL)\end{pmatrix},\\
 C_L(0)&=\frac6L\begin{pmatrix}1&-1\\-1&1\end{pmatrix},\\
 C_L(\ell<0)&=6k
 \begin{pmatrix}\cot(kL)&-\csc(kL)\\
                 -\csc(kL)&\cot(kL)\end{pmatrix}.
 \end{aligned}
\]
For each mode the minimizer solves \(6b''=\ell b\); substitution
into \(6[b b']_0^L\) gives the displayed entries. Strict positivity
on the joined domain is equivalent to all three zero-trace
subproblems being strictly positive and
\[
 d_0[\psi_0]+d_1[\psi_1]+c_L[\psi_0,\psi_1]>0
 \quad\text{for every nonzero trace pair in }H^{1/2}(Y)^2 .
\]
To prove the equivalence, subtract the minimizer on each piece.
The cross term vanishes by its weak equation, leaving this trace
form and the three positive zero-trace quadratic remainders.

For the identity double of a fixed \(h\), split at the midpoint and
allow a free trace there. Restriction and even extension give
equivalence to positivity on this one half. On the trace at its
junction with \(h\) the test is \(d_h+n_L\), where the eigenvalues
of \(n_L\) in the same basis are
\[
 \ell>0:\ 6k\tanh(kL/2),\qquad
 \ell=0:\ 0,\qquad
 \ell<0:\ -6k\tan(kL/2).
\]
The minimizer has \(b'(L/2)=0\). Its orthogonal zero-junction
subproblem has lowest eigenvalue \(\ell_1+6\pi^2/L^2\),
by the Dirichlet–Neumann eigenvalue on \([0,L/2]\).
For a twist by a \(\gamma\)-isometry \(f\), the two pieces cut
at the midpoint are still isometric to this half because
\((t,y)\mapsto(t,f(y))\) relabels a \(\gamma\)-product end.
Positivity of the identity double therefore implies positivity
of the twisted double. The exact two-trace form is available
when the twist is specified. Even extension through the twisted
seam is admissible for invariant midpoint data.

A fixed reflected half with free-seam coercivity
\(q_h(u)\ge c\|u\|_{H^1}^2\) gives a quantitative sufficient test.
Write \(\|\operatorname{Tr}_Y u\|_{L^2}\le C_{\rm tr}\|u\|_{H^1}\)
and \(k_0=\sqrt{-\ell_1/6}\) when \(\ell_1<0\). The largest
negative part of \(n_L\) is \(6k_0\tan(k_0 L/2)\), so the
identity and compatible twist both pass whenever
\[
 0<L<\frac{2}{k_0}\arctan\!\left(\frac{c}{6k_0 C_{\rm tr}^2}\right).
\]
If \(\ell_1\ge0\), the cylinder has no negative free-end contribution
for any \(L>0\). Conversely, if \(\ell_1<0\) and
\(d_h[\phi_1]\le0\) for its unit first eigenfunction, every
positive \(L\) fails on the identity double. If
\(\beta=d_h[\phi_1]>0\), the same mode fails starting at
\(2k_0^{-1}\arctan(\beta/(6k_0))\). The general two-half
version uses \(d_0[\phi_1]+d_1[\phi_1]\) in place of \(2\beta\).
This value includes the optimum cost of extending through the
actual retained metrics and round puncture ends. Positivity
still requires all trace pairs in the general test.

## Both chiral energies

With \(\rho_\gamma=\tfrac14\int_Y|\operatorname{Ric}^0_\gamma|^2
\,dV_\gamma\), the closed energies for the fixed half metrics are
\[
 E_\pm(L)=E_\pm(h_0;X_0)+E_\mp(h_1;X_1)+L\rho_\gamma .
\]
The reflection changes the sign of the Hodge star on two-forms
and swaps \(+\) and \(-\) on the second half. The Weyl-flat
round caps contribute zero. For duplicate halves and any compatible
twist, both energies equal \(B_h+L\rho_\gamma\) with
\(B_h=E_+(h;X)+E_-(h;X)\). For two different halves the closed
energies also coincide by zero signature. The additive formula
includes interpolation and retained seam-collar costs inside the
corresponding half terms. Pure seam charge can tend to zero
with \(L\). A positive entry class needs the same ordinary
form and \(B_h+L\rho_\gamma<8\pi^2\) in the duplicate case.
If a qualifying \(h\) has \(B_h<8\pi^2\) and \(\rho_\gamma>0\),
the preceding sufficient length must also be less than
\((8\pi^2-B_h)/\rho_\gamma\). A fixed conformal change in the globals
transfers the sign using the conformal Laplacian and preserves these
energies. The trace formulas themselves are for the exact product
representative in the stated markings.

## The actual homogeneous Mazur seam

Use the E56d cut through \(W^-(0,3)\) in Isoshima's Figure 37 at
\(n=1\), so \(Y=\Sigma(2,5,7)\) up to orientation. Its identity
double is smoothly standard by Isoshima's Theorem 3.3.
Akbulut–Kirby's Proposition 1 relates \(W^-(0,3)\) to \(W^+(0,0)\),
whose boundary is their Theorem 2(1). The punctures remain in the
two corresponding interiors. For this \(Y\) the transverse
\(\ell_1\) is negative for every \(\gamma\) for both potentials,
by the nonnegative scalar curvature obstruction checked in E56d.
[Isoshima, Proposition 2.11, Theorem 3.3 and Figure 37](https://arxiv.org/pdf/2403.17356v2) ·
[Akbulut–Kirby, Proposition 1 and Theorem 2(1)](https://math.berkeley.edu/~kirby/papers/Akbulut%20and%20Kirby%20-%20Mazur%20manifolds%20-%20MR0544597.pdf) ·
[E56d](E56_MARKED_EXTERIOR.md#the-actual-mazur-double)

For the frozen family \(\gamma_a\) of cyclic brackets \((a,a,-a)\)
with \(a>0\), the Ricci eigenvalues in the original coframe
\(e^1,e^2,e^3\) are
\((-3a^2/2,-3a^2/2,a^2/2)\).
The third direction generates the right rotations of the
Seifert fibration with angular speed \(a\). The projection
to its base is a Riemannian submersion with unit vertical
field and \(|[e_1,e_2]^{\mathrm{vert}}|=a\). The horizontal
sectional curvature is \(-7a^2/4\), and adding the submersion term
\(3a^2/4\) gives base curvature \(-a^2\). The orientation-preserving
triangle quotient has area \(22\pi/(70a^2)\).
Milnor's central presentation gives relations
\(g_1^2=g_2^5=g_3^7=g_1g_2g_3=c\), where \(c\) is a full
positive rotation covering the identity. The abelianization has
order \(11\); the image of \(c\) generates, since otherwise all
images of \(g_i\) would be zero by their orders and coprimality
with \(11\). The commutator quotient model consequently has
regular fiber period \(22\pi/a\); the base triangle group image
is surjective because one can correct every lift by a central
power. Thus
\[
 \operatorname{Vol}_{\gamma_a}(Y)=\frac{242\pi^2}{35a^3},
 \qquad
 L\rho_{\gamma_a}=\frac{484\pi^2}{105}\,aL.
\]
The strip alone rules out subcritical entry whenever
\(aL\ge 210/121\), even if its ordinary quadratic form passes.
The E56d ordinary and modified zero-trace sign limits are
\(aL\ge\pi\sqrt{12/5}\) and \(aL\ge 2\pi/\sqrt3\), respectively.
The variable \(aL\) and the energy are invariant under simultaneous
dilation. The length in any of these strip obstructions can include
adjacent retained exact product collars with the same cross-section.
[Milnor, Brieskorn manifolds, §§2.5–2.6, Theorem 3.1, Corollaries 3.2 and 6.5](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/neuwir3.pdf) ·
[Milnor, Curvatures of left invariant metrics, §4, equation (4.2) and Theorem 4.3](https://core.ac.uk/download/pdf/82428733.pdf)

### Boundary signature cost for this cross-section

The product-boundary signature theorem applies after capping the
marked round holes in each half, leaving the \(Y\) product germ
in place. The filling is contractible and hence has zero signature.
With outward-normal-first boundary orientation, the convention is
\[
 \operatorname{sign}(X)=\frac{E_+(X)-E_-(X)}{12\pi^2}
                          -\eta_{\mathrm{sig}}(Y,\gamma_a).
\]
Here \(\eta_{\mathrm{sig}}\) is the value at zero for
\(B=(-1)^p(*d-d*)\) on \(\Omega^{2p}(Y)\), omitting zero eigenvalues.
There is no kernel term in this version of the signature theorem.
The \(L\)-density is \(p_1/3\), with
\(p_1=-\operatorname{tr}(\Omega\wedge\Omega)/(8\pi^2)\).
In the curvature-operator blocks the Pontryagin density uses the
difference of traces of the squares of \(W^\pm+R/12\).
The mixed blocks cancel, and the scalar squares agree on the
two rank-three blocks. Thus the Weyl norms in the displayed
formula are precisely the Hilbert–Schmidt norms in this note.
Orientation reversal changes the sign of the eta value and swaps
the two norms. The caps are Weyl-flat.
[Atiyah–Patodi–Singer, Spectral asymmetry I, §1, Theorem (4.14)](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps001.pdf) ·
[Biquard–Herzlich–Rumin, §2, pp. 596–597](https://www.numdam.org/article/ASENS_2007_4_40_4_589_0.pdf)

Here is the boundary eta calculation in the orientation
\(\theta\wedge d\theta>0\), with the fiber generator normalized
to period \(2\pi\). The base curvature and period give
\(\theta=(a/11)e^3\), \(d\theta=(a^2/11)dA\), and its degree
\(d=-\int_{\mathrm{base}}d\theta/(2\pi)=-1/70\).
If the cone order is \(\alpha_i\), write
\(g_i\equiv m_i c\) in the abelianization. Since
\(\alpha_i m_i=1\bmod 11\), one can use \(m_i=(6,9,8)\).
A lift in the commutator is \(g_i c^{-m_i}\). In local disk
and fiber coordinates it rotates the base by \(2\pi/\alpha_i\)
and translates the lifted rotation parameter by
\(2\pi(1/\alpha_i-m_i)/a\). For example, a radial horizontal
section \(s(x)\) satisfies \(s(Rx)=k s(x)k^{-1}\) for the lift
\(k\) of the positive rotation about the center. Left translation
of \(s(x)\exp(t e_3)\) by \(g_i c^{-m_i}\) gives
\(s(Rx)\exp((t+2\pi(1/\alpha_i-m_i)/a)e_3)\).
The local action weights in Biquard–Herzlich–Rumin's convention are
therefore \(\beta_i=(1-\alpha_i m_i)/11\bmod\alpha_i=(1,1,2)\).
Their classical Dedekind sums are \(s(1,2)=0\), \(s(1,5)=1/5\),
\(s(2,7)=1/14\), as follows from the finite sawtooth sum.

Apply APS to the disk orbifold of the Seifert line bundle,
with its three isolated cone points excised. The inner boundary
components are \(-L(\alpha_i,\beta_i)\), with the local lens
weights \((1,\beta_i)\) and opposite orientation from the
corresponding balls in \(\mathbb C^2\). Excision preserves the
rational intersection form because each link is a rational
homology sphere. The disk orbifold retracts onto its zero
section, whose rational self-intersection is the line bundle
degree \(d<0\). The excised manifold has signature \(-1\).

Use the fiber metric \(ds^2+F_\epsilon(s)^2\theta^2\) with
\(F_\epsilon(s)=\epsilon F(s/\epsilon)\), \(F(x)=x\) near
zero and \(F=1\) near the outer radius. Add the fixed base metric
horizontally. The outer boundary is product with induced metric
\(g_{\mathrm{base}}+\epsilon^2\theta^2\).
At fixed \(\epsilon\) take invariant normal coordinates by each
cone point. Flatten by cutoff to a Euclidean quotient in a
small ball, then make a round product by radial conformal
change in a smaller spherical annulus. The first change has
bounded curvature at fixed \(\epsilon\) as its support shrinks,
so its signature density integral tends to zero. The conformal
change preserves the Weyl signature density. The inner eta
values are therefore those of the round links.

Compare the Levi–Civita connection with the direct sum of the
pulled-back base tangent and Seifert line connections. The
direct-sum Pontryagin four-form vanishes since it is pulled
back from the surface. In a boundary orthonormal frame ordered
by a horizontal pair followed by radial and fiber vectors,
the line block of the reference connection has skew entry
\(-\theta\), while the corresponding Levi–Civita entry is
zero on the product boundary. The horizontal Levi–Civita
block tends to the base block and its other mixed terms tend
to zero by \(d(\epsilon\theta)=\epsilon d\theta\).
Thus the outer transgression of \(\operatorname{tr}(\Omega^2)\)
tends to \(2\theta\wedge d\theta\): the difference entry
\(\theta\) against reference curvature \(-d\theta\) contributes
\(4\theta\wedge d\theta\) from the linear term and
\(-2\theta\wedge d\theta\) from the quadratic term.
Using \(\int_Y\theta\wedge d\theta=-4\pi^2d\) and the factor
\(-1/(24\pi^2)\) for \(p_1/3\), the integral tends to \(d/3\).

The primary round-lens formula is
\(\eta_{\rm sig}(L(\alpha,\beta))=-4s(\beta,\alpha)\) in
the standard orientation. The inner orientation reverses this
value in the APS boundary sum. Therefore
\[
 -1=\frac d3-\eta_{\mathrm{ad}}-4\sum_i s(\beta_i,\alpha_i),
 \qquad
 \eta_{\mathrm{ad}}=1+\frac d3-4\sum_i s(\beta_i,\alpha_i)
                    =-\frac{19}{210}.
\]
Summing the residue classes with the actual local action weights
in Biquard–Herzlich–Rumin (75)–(77) gives the same sign.
Pair the \(n\) and \(-n\) terms in (76). The local term in
(77) for a cone of order \(\alpha\) gives
\(\{n\beta/\alpha\}-\{-n\beta/\alpha\}
=2((n\beta/\alpha))\) for \(n>0\), where the sawtooth is zero
at integers. Split the resulting Dirichlet series into residues
\(r\bmod\alpha\); using \(\zeta(0,r/\alpha)=1/2-r/\alpha\)
gives \(-2s(\beta,\alpha)\) at zero. Formula (75) doubles it.
Their displayed finite-metric formula gives the same
metric-dependent terms. Its plus-Dedekind term with the literal
direct action weights disagrees with this calculation, as can
also be seen on \(L(3,2)\) by comparing with their (93).
The original Ouyang article listing was located. Its full text
could not be inspected in this run.
[Atiyah–Patodi–Singer II, Proposition (2.12), p. 412](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps002.pdf) ·
[Biquard–Herzlich–Rumin, Theorem 5.2 and equations (75)–(77), (93)](https://www.numdam.org/article/ASENS_2007_4_40_4_589_0.pdf) ·
[Ouyang, Trans. AMS 346 (1994), 641–659](https://doi.org/10.1090/S0002-9947-1994-1257644-9)

For the finite metric correction, rescale the third coframe by
a factor \(v>0\), keeping \(e^1,e^2\) fixed.
In the resulting orthonormal trivialization the torsion-free
connection has skew entries
\[
 \omega_{12}=-a(1+v^2/2)e^3,\qquad
 \omega_{23}=(av/2)e^1,\qquad \omega_{31}=(av/2)e^2 .
\]
Using \(de^1=-a e^{23}\), \(de^2=-a e^{31}\) and
\(de^3=a e^{12}\) gives
\[
 \operatorname{tr}(\omega\wedge d\omega+\tfrac23\omega^3)
                 =-a^3(2+2v^2+v^4)e^{123}.
\]
A product-ended cylinder interpolating two positive \(v\)'s
has zero signature. Apply the signature theorem, transgress
\(p_1\) in the same global coframe extended across that cylinder,
and then let the first \(v\) tend to zero. This gives
\[
 \eta(v)-\eta_{\mathrm{ad}}
   =\frac{a^3\operatorname{Vol}_{\gamma_a}(Y)}{24\pi^2}(2v^2+v^4),
 \qquad
 \eta(1)=-\frac{19}{210}+\frac{121}{140}=\frac{65}{84}.
\]

For each retained half in its original orientation the signed
difference is \(12\pi^2\eta_{\mathrm{sig}}(Y,\gamma_a)\),
and its sum is at least \(12\pi^2|\eta_{\mathrm{sig}}|\).
A matching orientation-preserving seam identification keeps the
same signed value for the two original half orientations. On the
joined orientation the signs of the half differences cancel.
Thus on the reflected identity model, or on a twist with both
actual seam metrics pulled back from the same \(\gamma_a\),
the lower bound is
\[
 E_+(L)=E_-(L)\ \ge\
 \frac{65\pi^2}{7}+\frac{484\pi^2}{105}aL .
\]
Indeed the energy on each chirality comes from the two
nonnegative half energies, and their sum over both chiralities
is at least twice the signature cost of one half. The displayed
bound already exceeds the entry ceiling when \(L=0\).
It applies to the specified homogeneous metric and exact
product seam germ on contractible halves, also after a smooth
global conformal change of that construction. It places no
lower bound of this size on a different cross-section metric
or a general seam.

The same calculation gives a second actual boundary metric on this
marked quotient. With vertical length multiplied by \(v>0\),
\[
 \eta(v)=\frac{121(2v^2+v^4)-38}{420},\qquad
 E_\pm(\mathrm{strip};v)=\frac{121\pi^2}{105}\,aL\,v(1+v^2)^2 .
\]
The cyclic brackets become \((a/v,a/v,-av)\), so Milnor's formula
gives the Ricci eigenvalues
\((-a^2(1+v^2/2),-a^2(1+v^2/2),a^2v^2/2)\).
Their trace-free square is \(2a^4(1+v^2)^2/3\), and the
volume is \(v\operatorname{Vol}_{\gamma_a}\).
At \(v^2=\sqrt{159}/11-1>0\) the boundary signature contribution
vanishes. The change of vertical length changes the relative fiber
scale in the fixed marked metric. Both transverse first eigenvalues
are still negative because their potentials are negative constants.
A short-seam entry test for this new metric needs the ordinary
free-trace estimate and a charged half budget for this same fixed
new germ.

## A further marked gluing

Auckly–Kim–Melvin–Ruberman's Mazur cork \(C\) and its displayed
involution \(\tau\) give a separate actual nonextendible smooth
gluing. Their Figure 2 exhibits Kirby reductions of both
\(C\cup_{\mathrm{id}}(-C)\) and \(C\cup_\tau(-C)\) to \(S^4\).
Choose interior ball markings on corresponding copies and use
any \(\tau\)-invariant face metric
\(\gamma=(\gamma_0+\tau^*\gamma_0)/2\); the involution is an
isometry of this metric. The exact product on a boundary
collar and the round puncture neighborhoods can be
prescribed on the same half metric by smooth interpolation.
The original half metrics are then shared by the two gluings.
The sign comparison above applies at every \(L\), and their
both-chiral energies agree identically at every \(L\).
There is no need to identify this boundary marking with
the E56d homogeneous seam marking. The choice of an invariant
face metric alone does not estimate \(B_h\) or the ordinary
free-boundary form \(q_h\), and no such estimate on this
retained half was found in the supplied inputs. The uncapped
part of a pulled-back round metric on the known \(S^4\) would
have to meet these product-germ and matching requirements
before it could supply this comparison.
[Auckly–Kim–Melvin–Ruberman, Equivariant corks, AGT 17 (2017), pp. 1771–1775, Figures 1–2 and §1](https://msp.org/agt/2017/17-3/agt-v17-n3-p11-s.pdf)

| Presentation | Smooth type and entry consequence |
| --- | --- |
| E56d identity double at the marked homogeneous Mazur seam | Known \(S^4\). Fixed homogeneous product germ exceeds the energy ceiling for every \(L\), regardless of the retained metric and ordinary sign. |
| The displayed cork and its actual nonextendible boundary twist | Both closed smooth types are known \(S^4\). For common compatible retained geometry, the identity sign implies the twisted sign and the exact energies agree. A controlled half realizing the threshold remains missing. |
| Further unknown smooth type | The trace test requires actual marked retained half metrics, or an explicit exterior with the same role, together with the signed trace form and full energy budget. The checked examples introduce no such input. |

The calculation gives a conditional exterior comparison and a
failure for a specified fixed cross-section metric. Any new entry
attempt through a different marked metric needs a separately
specified geometric construction and an ordinary trace estimate
with the charged half energies.

