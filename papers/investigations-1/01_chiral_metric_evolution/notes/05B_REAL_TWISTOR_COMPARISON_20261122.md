# SP4-CME-E03B — Round twistor first jets, reality and direction labels

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. The helper was configured as gpt-6.2-sol /
ultra. Independent runtime settings and lead model/effort were
unavailable. The [frozen request][request] specifies one round
benchmark and one anisotropic fiber test. The [return][return]
records the inspected inputs.

## Round incidence and both fiber patches

Use the positive Riemannian round metric with sectional curvature
\(K>0\) on the real oriented \(S^4\). Choose an oriented stereographic
chart with dimensionless coordinates \(x\in\mathbb R^4\) and
\(z=(x^1+\mathrm i x^2,x^3+\mathrm i x^4)\in\mathbb C^2\).
The round metric in these coordinates is
\[
g_K=\frac{4}{K(1+|z|^2)^2}\,|dz|^2 .
\]
The conformal factor is positive. AHS Theorem 4.1 and the adjacent
geometric description use a conformally invariant twistor almost
complex structure. They use the opposite chirality, and their
\(W_-=0\) condition for that choice becomes \(W^+=0\) for the
chirality selected here. The orientation-preserving stereographic
identification therefore gives the flat complex twistor structure
on the round chart. The two Levi–Civita horizontal distributions
for the two representatives of the conformal class can differ.
[Atiyah–Hitchin–Singer, journal pp. 435–436][ahs].

In each copy of \(\mathbb C^2\), use the antilinear operator
\(j(v_1,v_2)=(-\bar v_2,\bar v_1)\), so \(j^2=-I\).
Take \(a=z\) and \(b=ja\). Here \(b\) is the second incidence
coefficient only. Write \(b_{\mathrm{conn}}\) for the connection
compatibility one-form below. In homogeneous coordinates
\([\pi_0:\pi_1:w^1:w^2]\), the line over the real base point is
\[
w=\pi_0 a+\pi_1 b .
\]
On the north chart \(\pi_0\ne0\), let \(\zeta=\pi_1/\pi_0\) and
\(w_N=w/\pi_0=a+\zeta b\). On the south chart \(\pi_1\ne0\),
let \(\eta=\pi_0/\pi_1\) and \(w_S=w/\pi_1=\eta a+b\).
On the overlap \(w_S=\eta w_N\) and \(\eta=1/\zeta\), the
component transition for \(\mathcal O(1)^{\oplus2}\).
Both expressions are regular at their respective poles. On the
complement of the line \(\ell_\infty=\{\pi_0=\pi_1=0\}\) in
\(\mathbb CP^3\), this same transition presents the entire
holomorphic bundle \(\mathcal O(1)^{\oplus2}\) over \(\mathbb CP^1\).
In these coordinates the normal bundle of each section is the
vertical bundle along the section, hence \(\mathcal O(1)^{\oplus2}\).

The real involution of \(\mathbb CP^3\) is
\([\pi:w]\mapsto[j\pi:jw]\). It squares to the identity
projectively and has no fixed points. Indeed an antilinear
quaternionic operator squaring to \(-I\) has no complex
eigenline. It sends \(\zeta\) to \(-1/\bar\zeta\) where both
ratios are finite and nonzero. Using opposite patch coordinates
it reads
\[
(\zeta,w_N)\longmapsto(-\bar\zeta,jw_N)_S,\qquad
(\eta,w_S)\longmapsto(-\bar\eta,-jw_S)_N .
\]
The sign in the second expression comes from dividing by the
new first homogeneous coordinate \(-1\). Applying the two
formulas in succession uses \(j^2=-I\). More generally the
line with independent coefficients \((a,b)\) is sent to the
line with coefficients \((-jb,ja)\). It is invariant exactly
when \(b=ja\). Invariance here means that each point is sent
to its fiber antipode. The real section space is real
four-dimensional even though the fibers are complex spheres.

For the real base the northern evaluator \(T_\zeta a=a+\zeta ja\)
has inverse
\[
a=\frac{w_N-\zeta jw_N}{1+|\zeta|^2}.
\]
In the south the inverse is
\(a=(\bar\eta w_S-jw_S)/(1+|\eta|^2)\).
\(\langle a,ja\rangle_{\mathbb C^2}=0\) gives
\(|T_\zeta a|^2=(1+|\zeta|^2)|a|^2\), with the analogous
formula in \(\eta\). Thus at fixed direction the evaluation has
real rank four. Retaining direction gives real rank six on the
twistor chart. For the norm of the base derivative relative to
\(g_K\), the factor in the north chart is
\(\sqrt K(1+|z|^2)\sqrt{1+|\zeta|^2}/2\).
The corresponding factor in the south uses \(\eta\).
The closed chart discs \(|\zeta|\leq1\) and \(|\eta|\leq1\)
cover the complete fiber and each direction factor is between
\(1\) and \(\sqrt2\). The fiber norm here is the unit round
norm, with metric \(4|d\zeta|^2/(1+|\zeta|^2)^2\) and area
\(4\pi\). These fixed-direction scale formulas concern a given
stereographic trivialization.

## First jets and overlap scope

At fixed base, the northern and southern first-jet formulas are
\[
\begin{split}
a&=w_N-\zeta\partial_\zeta w_N,\qquad b=\partial_\zeta w_N,\\
a&=\partial_\eta w_S,\qquad b=w_S-\eta\partial_\eta w_S .
\end{split}
\]
Differentiating \(\eta w_N(1/\eta)\) gives
\(\partial_\eta w_S=w_N-\zeta\partial_\zeta w_N\),
so the inversion agrees on the overlap. At fixed direction
this map of jets is a complex-linear isomorphism from the
four-complex-dimensional space of sections with independent
coefficients \((a,b)\) to the jet space. The value-only
evaluation on the complexified base has complex rank two and
two-dimensional kernel. Retaining direction makes the complex
first-jet chart rank five as a correspondence chart. On the real
base the first-jet image satisfies \(b=ja\) after inversion.
The rank at fixed direction is four **real** into an
eight-real-dimensional jet space. This gives an embedding onto
the real jet locus. With direction retained it has rank six real.

The map \([\pi:w]\mapsto[\pi_0:\pi_1]\) on the complement of
\(\ell_\infty\) has no continuous extension along that line.
Approaching a given \([0:w]\) along \([t\pi:w]\) gives
different limits as \([\pi]\) varies. The global twistor map is
instead \(\mathbb CP^3\to\mathbb HP^1=S^4\), sending a
complex line to its quaternionic span with its \(j\)-conjugate.
The omitted line is the twistor fiber of the missing
stereographic point. More generally a nonconstant
holomorphic map \(\mathbb CP^3\to\mathbb CP^1\) would pull back
the positive generator of \(H^2(\mathbb CP^1)\) to \(dH\) with
\(d>0\) by positivity. Its square would be zero by functoriality
but equal to \(d^2H^2\ne0\) on \(\mathbb CP^3\).

Projective chirality and the sphere twistor bundle do not require
a global spin structure. For the displayed degree-one formulas,
choose the spin lift of the oriented coframe on the contractible
base chart. In a second such trivialization the projective
directions transform by the relevant chiral projective spin
action, while homogeneous spinors and degree-one data transform
by a chosen linear lift. A central sign disappears on the
projectivization and can affect the linear data. Gluing such
linear data across general base patches requires compatible
lifts and their cocycle. The fiber overlap computed above is
within a single base trivialization. The AHS remarks on p. 436
make this distinction between the projective geometry and the
spin and degree-one bundles. The earlier chiral descent
proposition assumes a holomorphic submersion and a complete
four-complex-parameter family. The earlier isothermal descent
lemma assumes full projective-fiber triviality and a holomorphic
partial connection. These hypotheses describe separate
holomorphic settings. [AHS p. 436][ahs] ·
[Chiral descent first-jet construction][chiral] ·
[Generalized isothermal descent and splitting][isothermal].

## Lie-algebra orientation, vertical convention and round transport

In an oriented orthonormal coframe use the manuscript's
\(\Sigma_i=\tfrac12\eta_{i,ab}e^a\wedge e^b\), where
\(\eta_{i,jk}=\epsilon_{ijk}\) and \(\eta_{i,j4}=\delta_{ij}\).
The ordinary two-form normalization is \(\Sigma_i\wedge
\Sigma_j=2\delta_{ij}dV_{g_K}\). In the Fine–Panov right-index
contraction, a two-form \(\alpha\) gives
\(J(\alpha)^a{}_b=g^{ac}\alpha_{cb}\).
Consequently
\[
\eta_i\eta_j=-\delta_{ij}I-\epsilon_{ijk}\eta_k,\qquad
R_i=-\eta_i,\qquad
[R_i,R_j]=2\epsilon_{ijk}R_k .
\]
Thus the bracket-positive target frame is
\(-\Sigma_i/\sqrt2\). Multiplying the \(R_i\) by \(1/2\)
gives unit bracket constants without changing orientation.
The manuscript's input internal basis is oriented by
\([e_i,e_j]=\epsilon_{ijk}e_k\) and has norm
\(-2\operatorname{tr}_{SU(2)}\). In that basis and the
bracket-positive target frame the curvature map
\[
F(u)=-K\Sigma(Su)=\sqrt2K\sum_i(Su)_i(-\Sigma_i/\sqrt2),
\qquad S=Q^{1/2}>0,
\]
has positive determinant. The scalar \(\sqrt2K\) corresponds
to the manuscript's norm and has no effect on rays. This is
the frame translation of Fine–Panov's positive round curvature
map, whose chiral block is \(+KI\) in the source's metric
identifications. This sign also follows independently from
Fine–Panov's Corollary 3.3 for positive Einstein scalar
curvature. The raw displayed \(\Sigma_i\) carry the opposite
orientation to the bracket-positive frame. [Fine–Panov
Definition 2.6, §3.1 before Theorem 3.1, and Corollary 3.3][fp].

The unit direction \(u=(u_i)\) in the oriented target frame
\(-\Sigma_i/\sqrt2\) gives the orthogonal complex structure
\(I_u=\sum_i u_iR_i\) on the base. To fix the complex orientation
of the fiber explicitly, let \(I_0\) denote multiplication by
\(\mathrm i\) in the oriented complex coordinates \(z\) above.
Then \(I_0=R_3\), the antilinear \(j=-R_2\) as a real map, and
\(I_0j=R_1\). For \(\zeta=\alpha+\mathrm i\beta\), the evaluator
\(T_\zeta=I+\alpha j+\beta I_0j\) pulls \(I_0\) back to
\[
T_\zeta^{-1}I_0T_\zeta
=\frac{2\alpha R_1+2\beta R_2+(1-|\zeta|^2)R_3}
        {1+|\zeta|^2}.
\]
This follows from \(I_0j=-jI_0\) and
\((\alpha j+\beta I_0j)^2=-|\zeta|^2I\).
The resulting \(u\) is the usual oriented stereographic map
to the unit sphere. At \(\zeta=0\) its coordinate derivatives
are \(2e_1,2e_2\) with \(u=e_3\). Thus the standard
\(\mathbb CP^1\) complex orientation in the incidence chart
matches \(J_V v=u\times v\). The antipode changes this
complex structure's orientation by an antiholomorphic map.

Fine–Panov's Proposition 2.1 and Definition 2.9 use the
**signed ray** of the horizontal curvature component to
choose the base complex structure. Remark 2.10 states that
the normalized curvature ray is fiber-orientation preserving
on the positive component. Their §4.2 uses the Levi–Civita
horizontal lift and the standard vertical complex structure
for the AHS choice \(J_+\). At round the connection is the
chiral Levi–Civita connection and the curvature ray is the
identity in the calibrated labels on source and target.
Consequently the horizontal component is \(I_u\) for both
structures and the vertical component is the same standard
complex structure. This comparison fixes the sign using
the source's ray convention, the Lie orientation and the
verified round case. It applies to compatible representatives
of the same conformal structure, so a positive constant
volume normalization difference has no effect here.
[Fine–Panov Prop. 2.1, Def. 2.9, Rem. 2.10 and §4.2][fp] ·
[AHS p. 436][ahs].

For the manuscript's connection and metric use
\(Q=I\), \(\widehat g=g_K\), \(b_{\mathrm{conn}}=
A-\Gamma_A^+=0\) under the chiral orthonormal identification,
and \(W^+=0\). Both \(A\) and \(\Gamma_A^+\) parallel-transport
the same direction along every base path. In real frame
components, each solves the same transport equation
\(\dot u + [A(\dot x),u]=0\), because \(S=I\) and
\(f=\phi(u)=u\). A time-independent round connection has
\(q=0\), so its Fine velocity is zero and the time map is
also stationary in a fixed internal identification.
Coincidence of these two chiral transports is a statement
about the round representative. It does not make \(\zeta\)
constant under its Levi–Civita transport in a stereographic
frame.

## One anisotropic fiber test

At one point take the trace-three matrix
\(Q_\varepsilon=\operatorname{diag}(1+\varepsilon,1,1-\varepsilon)\)
for \(|\varepsilon|<1\). Use round source and target spheres
with the calibrated common orientation. With
\(S=Q_\varepsilon^{1/2}\) and \(f=\phi(u)=Su/|Su|\),
\[
d\phi_u(v)=\frac{(I-f\otimes f)Sv}{|Su|}.
\]
This map preserves orientation because \(S\) deforms to \(I\)
through SPD matrices and each ray map is a diffeomorphism,
with inverse the ray map of \(S^{-1}\). At \(u=e_2\), the
point is fixed and tangent singular values are
\(\sqrt{1+\varepsilon}\) and \(\sqrt{1-\varepsilon}\).
They agree exactly for \(\varepsilon=0\). Thus the map fails
conformality and holomorphicity for \(\varepsilon\ne0\);
at zero it is the identity. For every direction the differential
and its inverse have norms at most
\(\sqrt{(1+|\varepsilon|)/(1-|\varepsilon|)}\), by
\(|Su|\ge\sqrt{1-|\varepsilon|}\), the orthogonal projection
bound and the same calculation for \(S^{-1}\). These are
unit round fiber bounds. \(K\) cancels in the normalized ray.
The example defines only pointwise fiber algebra.

Given any local pair of coefficient fields with the indicated
spin weights, contracting them with \(\pi\) builds a section
of degree one in the fiber variable. It has zero remainder
under projection to the degree-one section space by construction.
This imposes no equation on horizontal derivatives or the
curvature. Ambient twistor integrability still depends on
the AHS Weyl condition, and control along a flow needs an
independent estimate of the horizontal quantities.

[request]: ../research-progress/handoffs/SP4-CME-E03B_REQUEST_v1.md
[return]: ../research-progress/handoffs/SP4-CME-E03B_RETURN_v1.md
[ahs]: https://doi.org/10.1098/rspa.1978.0143
[fp]: https://arxiv.org/html/0802.3648v2
[chiral]: ../../../initial-investigations/02_chiral_descent_and_double_copy/manuscript/chiral_connection_descent_and_double_copy.tex
[isothermal]: ../../../initial-investigations/01_generalized_isothermal_coordinates/manuscript/generalized_isothermal_wave_metrics.tex
