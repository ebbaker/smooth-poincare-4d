# SP4-FOT-MATCH-E06 · True Cauchy traces on cores with exact product germs

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Bounded E check under MATCH-B02. Recommended
gpt-6.2-sol / ultra. The helper's exact serving model and reasoning effort
are unavailable. The [request](../research-progress/handoffs/E06_REQUEST_20261125.md)
records the input versions and finite scope.

## Hypotheses and statement

Let a smooth compact oriented Riemannian spin four-manifold \(C_L\) have
one boundary, equipped with an exact unit-round product germ
\([-2,0]\times S^3\). Let \(t\) increase from core to filling. Fix a
spin identification with the product and use the positive
half-spinor \(S^+\), \(c(X)^2=-|X|^2\), and
\(D^+=c(\partial_t)(\partial_t+A)\) in this gauge. Here \(A\) is the
tangential Dirac operator on \(S^+|_{S^3}\) in the increasing-\(t\)
normal convention. Its spectral gap is \(\gamma=3/2\). Denote by
\(H_\pm\) the positive and negative spectral summands of
\(H^{1/2}(S^3,S^+|_{S^3})\) with norm
\(\|v\|_{1/2}=\|(1+A^2)^{1/4}v\|_2\), and by \(P_\pm\) their
projections. Use a conformally round spin filling on \(t\ge0\)
that is an exact cylinder on \([0,2]\) and closes at the point
corresponding to \(t=\infty\). The intrinsic sphere spin structure
is unique and the filling's structure extends across its ball.
Assume the resulting closed conformal class of the capped core
has \(Y\ge y_0>0\). The proof concentrates on the component with the
boundary. Any closed components also inherit the same lower bound
by testing functions supported there. Their Dirac operators have
no kernel by the argument below.
[Matching normal convention](../brainstorm/notes/RELAXING_COLLAR_HYPOTHESES_20261125.md) · [Bär, Theorem 1](https://www.math.uni-potsdam.de/fileadmin/user_upload/Prof-Geometrie/Dokumente/Publikationen/sphere.pdf#page=6)

Then the actual boundary traces of \(H^1\) positive harmonic half-spinors
on \(C_L\) are exactly
\[
 \{z+G_Lz:z\in H_-\},\qquad G_L:H_-\to H_+,\qquad
 \|G_L\|\le C(y_0).
 \tag{1}
\]
Each trace in (1) has a unique harmonic extension on \(C_L\) in
\(H^1\). The right piece \(C_R\) with its product germ extending
towards increasing \(t\) from its boundary has the reversed graph
\(G_R:H_+\to H_-\), under the same increasing-\(t\) convention
on a joining exact cylinder. Uniformity concerns the indicated
trace and the \(H^1\) norm inside a fixed seam neighborhood. The
proof also controls a weighted interior \(L^2\) norm, in the
specific closed comparison metric.

## The closed inverse with a fixed product near the seam

Write \(Z_L\) for the closed capped core and start with its smooth
metric \(g\) equal to the product on \([-2,2]\times S^3\). Choose
a fixed smooth cutoff \(\chi\) equal to one on \([-1,1]\times S^3\)
and supported in \((-3/2,3/2)\times S^3\). Take
\(\widetilde g=\vartheta^2g\), \(\vartheta=\chi+(1-\chi)\epsilon\)
with \(0<\epsilon\le1\) such that
\(\epsilon^4\operatorname{Vol}(Z_L,g)\le1\).
The total volume \(V\) of \(\widetilde g\) is then at most
\(3\operatorname{Vol}(S^3(1))+1\), and the exact unit product on
\([-1,1]\times S^3\) is retained. This construction keeps the Yamabe
class and carries harmonic spinors of the two core representatives to
one another with the same boundary traces by conformal covariance.
The cutoff and lower bound on \(Y\) apply to each piece independently.

For the nonnegative Laplacian let
\(L_{\widetilde g}=6\Delta_{\widetilde g}+s_{\widetilde g}\).
The Yamabe quotient and Hölder give, for every nonzero smooth scalar
\(q\),
\[
 \frac{\langle q,L_{\widetilde g}q\rangle}{\|q\|_2^2}
 \ \ge\ Y([\widetilde g])\,\frac{\|q\|_4^2}{\|q\|_2^2}
 \ \ge\ y_0 V^{-1/2}.
\]
The first eigenfunction \(f\) can be taken positive on the connected
capped core, with eigenvalue \(\mu\ge y_0 V^{-1/2}\). In
\(\widehat g=f^2\widetilde g\) the scalar curvature is
\(s_{\widehat g}=\mu f^{-2}\). For a closed Dirac eigenspinor \(D\psi
=\lambda\psi\) in \(\widetilde g\), conformal covariance gives
\(\widehat D\widehat\psi=\lambda f^{-1}\widehat\psi\) for
\(\widehat\psi=f^{-3/2}\beta\psi\). The integrated twistor identity
\(\|P\widehat\psi\|_2^2=(3/4)\|\widehat D\widehat\psi\|_2^2
-(1/4)\int s_{\widehat g}|\widehat\psi|^2\,dV_{\widehat g}\)
has multiplier \((3\lambda^2-\mu)/4\) times the positive integral
\(\int f^{-2}|\widehat\psi|^2dV_{\widehat g}\). This proves the
four-dimensional Hijazi bound \(\lambda^2\ge\mu/3\), including
exclusion of \(\lambda=0\). The full Dirac operator is therefore
invertible and
\[
 \|D_{\widetilde g}^{-1}\|_{L^2\to L^2}
 \le (3V^{1/2}/y_0)^{1/2}\le C(y_0).
 \tag{2}
\]
The inverse takes negative sources to positive solutions because
\(D\) anticommutes with chirality. This uses the closed, smooth
Riemannian spin setting. No geometry of the shrinkage transition
enters (2).
[Hijazi, CMP 104 (1986), pp. 151–162](https://doi.org/10.1007/BF01210797) · [DIR, twistor identity](../../manuscript/dirac_twistor_and_yamabe_rigidity.tex#L205) · [DIR, conformal weights](../../manuscript/dirac_twistor_and_yamabe_rigidity.tex#L343)

For \(w=D_{\widetilde g}^{-1}F\) there is a uniform **local** estimate
\[
 \|w\|_{H^1([-1/4,1/4]\times S^3)}
       +\|\tau_0w\|_{1/2}
 \le C(\|F\|_{L^2([-1,1]\times S^3)}
              +\|w\|_{L^2([-1,1]\times S^3)}).
 \tag{3}
\]
Apply the integrated Schrödinger–Lichnerowicz identity in the exact
product to \(\zeta w\), where \(\zeta\) is supported in \((-1,1)\)
and equals one on \([-1/2,1/2]\). The product scalar curvature is six,
and \(D(\zeta w)=\zeta F+c(d\zeta)w\). The fixed product trace inequality
then gives (3). The inverse has \(H^1\) regularity for each smooth
compact representative by elliptic theory. Equation (3) needs no
uniform global \(H^1\) estimate as the representative varies.

## Which modes fill a regular cap

View the cap minus its closing point in the infinite cylindrical
gauge. Its smooth metric is conformal to this gauge and can be
taken to be a constant times the flat polar metric
\(r^2(dt^2+\gamma_{S^3})\) near the point, \(r=e^{-t}\), before
or after the shrinkage away from the seam. In the corresponding
spin frames a smooth spinor has cylindrical amplitude
\(O(e^{-3t/2})\). If it is harmonic, its cylindrical eigencomponents
solve
\[
 \partial_t u_\lambda+\lambda u_\lambda=0.
\]
All negative modes would grow, so the only possible seam values
are in \(H_+\) for the left core's filling. The conclusion uses
the same spin lift in the product and conformal gauges.

Conversely, for \(a=\sum_{\lambda>0}a_\lambda\) in \(H_+\),
\(u(t)=\sum_{\lambda>0}e^{-\lambda t}a_\lambda\) is an \(H^1\)
harmonic extension on the semi-infinite cylinder. For each mode,
\(\int_0^\infty(1+2\lambda^2)e^{-2\lambda t}dt
=(1+2\lambda^2)/(2\lambda)\lesssim(1+\lambda^2)^{1/2}\).
Also \(\|u(t)\|_2\le e^{-3t/2}\|a\|_2\). Transport into the flat
metric multiplies spin amplitudes by \(r^{-3/2}\) up to a constant.
The flat \(L^2\) norm squared on a shell with \(r\asymp\delta\)
is bounded by
\(\int_{r\asymp\delta} r\|u(t)\|_2^2\,dt\le C\delta^4\|a\|_2^2\).
The analogous bound holds on a small ball by summing dyadic shells.
Testing the smooth-coefficient Dirac equation with a cutoff at
radius \(\delta\) therefore gives a boundary error
\(O(\delta^3)\) for each smooth test spinor. Here the cutoff gradient
on the shell has \(L^2\) norm \(O(\delta)\), while the extended
spinor's \(L^2\) norm there is \(O(\delta^2)\). The extension is
distributionally harmonic across the point and smooth by elliptic
regularity. For the right core the outward filling goes toward
decreasing \(t\), so the extendible subspace is \(H_-\) in the
common \(A\) convention.
[DIR, conformal covariance](../../manuscript/dirac_twistor_and_yamabe_rigidity.tex#L346) · [DIR, removable-point argument](../../manuscript/dirac_twistor_and_yamabe_rigidity.tex#L570)

## Constructing the graph

Fix \(z\in H_-\). On the **core** side of the left seam use
\[
 \ell(t)=\chi_L(t)e^{t|A|}z,\qquad -1<t\le0,
\]
where \(\chi_L=1\) for \(t\ge-1/4\) and zero for \(t\le-3/4\).
This is an \(H^1\) spinor since the preceding spectral integral
also applies to \(t\le0\) after sign reversal. Extend by zero on
the rest of the core. Its Dirac image
\(F=c(\partial_t)\chi_L'(t)e^{t|A|}z\) is supported strictly inside
the core's exact product region. As it vanishes near the seam,
\(F\) extends by zero to all of \(Z_L\) as an \(L^2\) source.
In particular \(\|F\|_2\le C\|z\|_{1/2}\).
The lift \(\ell\) itself is used only on the core.

Set \(w=D_{\widetilde g}^{-1}F\). Its cap restriction is harmonic
and smooth across the cap point, so \(P_-\tau_0w=0\). On the core,
\(u_L=\ell-w\) is harmonic and
\[
 P_-\tau_0u_L=z,\qquad P_+\tau_0u_L=-P_+\tau_0w=G_Lz .
\]
Equations (2)–(3) show \(\|G_Lz\|_{1/2}\le C(y_0)\|z\|_{1/2}\)
and uniformly bound the solution on a fixed core-side product
neighborhood in \(H^1\). They bound \(\|\ell-w\|_{2,\widetilde g}\)
on the core as well. This establishes existence for each \(z\).
If \(u_L\) is harmonic and \(P_-\tau_0u_L=0\), its trace extends
harmonically to the filling by the positive modes. Across the
seam the two \(H^1\) sections glue with equal full trace and their
weak Dirac equations give a closed harmonic spinor. The removable
point argument and (2) make it zero. Subtracting the constructed
extension for \(z=P_-\tau_0u_L\) from any core harmonic spinor
proves (1), including uniqueness. For \(C_R\) with boundary
\(t=L\), the core lies toward \(t\ge L\), and the lift is
\(\chi_R(t-L)e^{-(t-L)|A|}z\) for \(z\in H_+\).
Its closed correction fills toward decreasing \(t\), giving the
right graph in the same way.

## Composing two actual graphs and a pole shift

Use oriented spin identifications of the two exact germs with
the respective ends of \([0,L]\times S^3\), with the same product
spin gauge used in their \(A\)-projections. A regular core uses
its homogeneous graph. If a fixed interior singularity is
prescribed in a piece, suppose one particular spinor \(p\) there
has the specified pole, is harmonic off it, and is smooth near
the seam. Use the affine class obtained by adding regular
harmonic spinors to \(p\), so all differences extend regularly
at the marked point. For a left pole the graph is shifted by
\(b_L=P_+\tau p-G_LP_-\tau p\). For a right pole it is shifted by
\(b_R=P_-\tau p-G_RP_+\tau p\). Regular pieces have \(b=0\).
If the chosen particular spinor is the Green spinor on the
corresponding closed capped core with a normalized distributional
source of negative chirality at an interior point of the piece,
then on the auxiliary filling it is regular and harmonic.
Its prescribed-mode projection therefore vanishes, and \(b\)
is the remaining projection of its actual trace. The closed
invertibility in (2) gives a unique distributional Green spinor
for each such source. The Euclidean leading pole and its
normalization require the flat germ and source convention at
that point. These hypotheses are separate from the seam geometry.
[Ammann–Humbert–Morel, §2.1 and Proposition 2.3](https://intlpress.com/site/pub/files/_fulltext/journals/cag/2006/0014/0001/CAG-2006-0014-0001-a007.pdf#page=4) · [DIR §4.1, flat germ and normalization](../../manuscript/dirac_twistor_and_yamabe_rigidity.tex#L516)

Let \(x=P_+u(0)\) and \(y=P_-u(L)\) be the incoming cylinder
traces. For the source-free product cylinder the outgoing
traces are \(P_+u(L)=T_+ x\) and \(P_-u(0)=T_- y\), where
\(T_\pm=e^{-L|A|}|_{H_\pm}\). Both have norm at most
\(e^{-3L/2}\). Matching the entire boundary trace at each seam is
equivalent to
\[
 x=G_LT_-y+b_L,\qquad y=G_RT_+x+b_R.
\]
The return operator on \(H_+\) is \(G_LT_-G_RT_+\), of norm at
most
\[
 m=\|G_L\|\|G_R\|e^{-3L}.
\]
For \(m<1\), its resolvent has norm \(\le(1-m)^{-1}\) and
\[
 \|x\|_{1/2}
   \le\frac{\|b_L\|_{1/2}+\|G_L\|e^{-3L/2}\|b_R\|_{1/2}}{1-m},
 \qquad
 \|y\|_{1/2}\le\|G_R\|e^{-3L/2}\|x\|_{1/2}+\|b_R\|_{1/2}.
 \tag{4}
\]
The cylinder field from \(x,y\) obeys a length-uniform \(H^1\)
bound by \(\|x\|_{1/2}+\|y\|_{1/2}\), applying the same spectral
integral to the positive and negative modes from their incoming
ends. Tangential \(H^1\) is equivalent to the \(A\)-graph norm on
the fixed round sphere. Together with (1), this constructs the
matching solution with the specified poles. Equality of full
traces gives the weak equation through each seam, and elliptic
regularity gives smoothness there. With both pieces regular and
\(m<1\) the only homogeneous closed solution from this procedure
is zero. For a family with a common \(y_0\), the constants in
(4) are uniform once the length makes \(m\le m_*<1\), with the
sizes of the two affine shifts on the right side.

## Application boundary

The construction applies to the actual trace spaces of the two
specified **exact product** pieces. If the germs were made exact
by altering the metrics near the cut, it applies to those
altered metrics, provided their separately capped classes have
the stated common Yamabe lower bound. To apply it on an original
sequence with only near-product collars one needs a quantitative
transfer of the actual trace ranges, or a proof for those
operators and cap comparisons in their own gauges. The
construction uses the measured affine shifts in the common
gauge. A nonzero pointwise spinor lower bound, quantitative
control of a pole trace under degeneration, and estimates for
the differentiated twistor defect need separate inputs.
The required length is the one making \(m<1\). A fixed-width
short strip supplies no such conclusion unless the measured
graph norms already make the product less than one.
