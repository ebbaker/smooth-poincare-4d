# Positive Schouten curvature and boundary chiral flux · SP4-FOT-NECK-E18

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper configured as gpt-6.2-sol/ultra
per the issuing lead. The runtime does not independently expose
serving settings. The residual implication is conditional on the
physical boundary sum. The radial examples test that hypothesis.
[Frozen request](../research-progress/handoffs/E18_REQUEST_20261125.md)
· [Positive Ricci gauge, NECK-E14](E14_POSITIVE_RICCI_GAUGE_20261125.md)
· [Relative chiral charge, MATCH-E12](../../../02_dirac_and_twistor_spinors/01_dirac_collar_matching/notes/E12_RELATIVE_CHIRAL_CHARGE_20261125.md)

## Positive charge and the residual branch

Let \(M\) be a smooth closed oriented Riemannian homotopy
four-sphere in the positive Yamabe band \(E_+=E_-=E\le
8\pi^2-\delta\), with \(\delta>0\). Write \(P=8\pi^2\) and
take a smooth conformal representative \(h\) with
\(p_2=\sigma_2(h^{-1}A_h)>0\), where the standard Schouten
tensor is \(A_h=(\operatorname{Ric}_h-R_hh/6)/2\).
This representative is supplied by Chang–Gursky–Yang as
checked in E14. For either chirality set
\[
 Q_\pm=|W^\pm_h|_{\rm HS}^2+2p_2,\qquad
 I_\pm(U)=\int_U Q_\pm\,dV_h.
\]
With the real curvature endomorphism Hilbert–Schmidt norm,
Chern–Gauss–Bonnet and the signature formula give
\(I_\pm(M)=E+2\int_M p_2\,dV_h=P\).
Here \(Q_\pm\) denotes a chiral Chern–Weil density, distinct
from the Paneitz \(Q_4\) curvature. [NECK-E14, normalization](E14_POSITIVE_RICCI_GAUGE_20261125.md#existence-and-normalization)

Let \(U\subset M\) be an actual compact smooth domain with smooth
boundary, with \(U^c=\overline{M\setminus U}\).
Use the physical Levi-Civita half-spin connections on \(U\).
The homotopy sphere is spin. Any smooth \(\mathrm{SU}(2)\)
bundle on a closed three-manifold admits a smooth frame,
as extension of a section up to the three-skeleton uses
\(\pi_0,\pi_1,\pi_2\) of \(\mathrm{SU}(2)\), all zero.
Write \(C_\pm(\partial U)\) for the sum of the unnormalized
integrals of
\(\operatorname{tr}(A_\pm\wedge dA_\pm+\tfrac23 A_\pm^{\wedge3})\)
in any such frames with the outward-normal-first orientations.
Use \(s_+=-1\), \(s_-=1\) as in MATCH-E12. Its relative
integer identity gives
\[
 I_\pm(U)=s_\pm\big(Pk_\pm+C_\pm(\partial U)\big),
 \qquad k_\pm\in\mathbb Z,
\]
since \(2p_2=R_h^2/48-|\operatorname{Ric}_{0,h}|^2/4\).
Changing a boundary frame changes its CS integral by an
integer multiple of \(P\). Thus the relevant invariant
is the modular distance \(d_P(v)=\inf_{j\in\mathbb Z}|v-jP|\).
[Relative identity and chirality signs, MATCH-E12](../../../02_dirac_and_twistor_spinors/01_dirac_collar_matching/notes/E12_RELATIVE_CHIRAL_CHARGE_20261125.md#boundary-trivializations-and-relative-integer)
· [Chern–Simons, §3, Prop. 3.2](https://math.mit.edu/juvitop/pastseminars/notes_2019_Fall/Chern-Simons.pdf#page=6)

Positivity gives \(0\le I_\pm(U)\le P\) and
\(I_\pm(U^c)=P-I_\pm(U)\). Consequently
\[
 \begin{split}
 \varepsilon_\pm(U)
  &:=d_P(C_\pm(\partial U))
    =\min\{I_\pm(U),I_\pm(U^c)\}\\
  &\ge\min\{E_\pm(U),E_\pm(U^c)\}.
 \end{split}                                                     \tag{1}
\]
The chiral energies in this inequality are unchanged on the
same domains by any smooth positive conformal factor.
In the constant-\(p_2\) gauge set
\(v=\operatorname{Vol}_h(U)/\operatorname{Vol}_h(M)\).
The two positive masses in (1) are exactly
\[
 I_\pm(U)=E_\pm(U)+(P-E)v,\qquad
 I_\pm(U^c)=E_\pm(U^c)+(P-E)(1-v).
                                                                  \tag{2}
\]
For the signs, the congruence for the complement is the opposite
boundary orientation and \(s_\pm I_\pm(U^c)\equiv-s_\pm I_\pm(U)\).
Thus the volume terms in (2), with those orientations, give
the exact signed contribution modulo \(P\).

Suppose along a sequence \(E_\pm(U_i^c)\ge c>0\) eventually
and \(\varepsilon_\pm(U_i)\to0\). For large \(i\),
\(I_\pm(U_i^c)\ge c>\varepsilon_\pm(U_i)\), so
\[
 I_\pm(U_i)=\varepsilon_\pm(U_i),\qquad
 E_\pm(U_i)\le\varepsilon_\pm(U_i),\qquad
 \int_{U_i}p_2\,dV_{h_i}\le\tfrac12\varepsilon_\pm(U_i).
\]
In the constant gauge also \(v_i\le\varepsilon_\pm(U_i)/\delta\).
This uses no input from scalar or Ricci energy, metric
volume of \(U_i\), an interior extension of the frames,
or a common strip. A positive lower bound for \(I_\pm(U_i^c)\)
directly also suffices. For a sequence with an exhaustion
parameter \(L\), assume
\(\liminf_i E_\pm(U_{i,L}^c)\ge c>0\) for every sufficiently
large fixed \(L\) and
\(\lim_{L\to\infty}\limsup_i\varepsilon_\pm(U_{i,L})=0\).
For each sufficiently large fixed \(L\) the small branch
is then \(U_{i,L}\) for large \(i\), and the same iterated
limit of its chiral energy is zero. Use the relevant
physical representative for the boundary hypothesis at each
index. A bound for one chirality applies to that chirality.

Merely positive complementary energy with no uniform lower
bound allows the other branch. For example, fix a small
smooth non-conformally-flat perturbation of the round metric
still in \(\Gamma_2^+\), and remove a ball of shrinking radius
about a point where the tested chiral curvature is nonzero.
With \(U_i\) the complement of the ball,
\(E_\pm(U_i^c)>0\) for every \(i\) and \(I_\pm(U_i^c)\to0\).
Its boundary modular distance vanishes while \(E_\pm(U_i)\)
tends to the strictly positive total of the chosen metric.
For a single separating sphere with chiral energy at least
\(\eta\) on each side, (1) instead forces modular distance
at least \(\eta\). Thus small flux is incompatible with an
unpaired balanced cut. The hypothesis involves the oriented
sum on the boundary of the actual middle residual.

## Radial spherical calculation

Supply oriented coordinates with \(t=\log r\) and
\[
 h=e^{2w(t)}(dt^2+\gamma),\qquad
 \gamma=g_{S^3(1)},\qquad \operatorname{or}=dt\wedge dV_\gamma .
\]
A multiplier \(\Omega(r)^2\) of the flat Euclidean metric
corresponds to \(w(t)=t+\log\Omega(e^t)\). Put \(u=w'\).
For physical radial arclength \(ds=e^w\,dt\) and radius
\(a=e^w\), the derivatives satisfy \(a_s=u\) and
\(a_{ss}=e^{-w}u'\). The radial and tangential sectional
curvatures are
\[
 k_r=-e^{-2w}u',\qquad k_t=e^{-2w}(1-u^2).
\]
The metric is conformally flat. Its standard Schouten
eigenvalues are \(k_r-k_t/2,k_t/2,k_t/2,k_t/2\), hence
\(p_2=\frac32 k_r k_t\). In the \(\Gamma_2^+\) chamber,
positive radial Ricci \(3k_r\) implies \(u'<0\), and
\(p_2>0\) implies \(|u|<1\). Conversely these two strict
conditions give positive radial and tangential sectional
curvatures and hence \(\Gamma_2^+\) in this model.

Let \(\Phi(u)=u-u^3/3\) and
\[
 \mathcal C(u)
    =6\pi^2(\Phi(1)-\Phi(u))
    =4\pi^2-6\pi^2u+2\pi^2u^3 .
\]
Integrating \(Q_\pm=2p_2=-3e^{-4w}u'(1-u^2)\) gives
\[
 I_\pm([t_-,t_+]\times S^3,h)
     =\mathcal C(u(t_+))-\mathcal C(u(t_-)).
                                                                  \tag{3}
\]
The factor \(e^{4w}\) in \(dV_h\) cancels exactly, and
\(\operatorname{Vol}(S^3(1))=2\pi^2\). In the admissible
chamber the mass \(\mathcal C(u)\) increases from the
\(u=1\) endpoint value \(0\) to the \(u=-1\) value \(P\).
Equation (3) depends on the two slopes at the boundaries.

For the individual slice \(S_t\) with increasing-\(t\)
coorientation, its unnormalized ambient CS value is
\[
 C_\pm(S_t)\equiv s_\pm\mathcal C(u(t))\pmod P .
                                                                  \tag{4}
\]
For a proof fix the radial metric germ on a neighborhood
of the slice. Extend this germ radially on its earlier side
and choose \(w=t+c\) near the earlier pole by a smooth
interpolation. The resulting filling is a smooth ball
because the earlier germ is flat. Its spin bundle restricts
to the same spin structure and physical connection at the
slice, and the frame ambiguity is only integral. The charge
of the ball calculated by (3) is \(\mathcal C(u(t))\).
The topological transgression then gives (4). The
interpolation used to compute this individual reference
charge can have arbitrary scalar curvature.

The sign reverses for decreasing-\(t\) coorientation.
Consequently the two-end anomaly for a conformal change
\(w\mapsto w+f\) of the radial model is the difference
between
\(\mathcal C(u+f')-\mathcal C(u)\) at the two ends, with
the \(s_\pm\) sign for the CS sum. A constant change of
physical scale leaves it zero. A nonconstant multiplier
enters through its normal derivative in this model. For
\(|u|\le1\) the individual modular distance is
\[
 d_P(C_\pm(S_t))
    =2\pi^2(1-|u(t)|)^2(2+|u(t)|).
\]
It tends to zero when the end slope approaches either
flat-cone value \(+1\) or \(-1\).

## Round and long-strip checks

For the round sphere of any radius,
\(w(t)=\mathrm{const}-\log\cosh t\) and \(u=-\tanh t\).
The equator has \(u=0\) and thus individual modular distance
\(4\pi^2\). An exact round product cylinder likewise has
\(u=0\), each individual modular distance \(4\pi^2\), and
zero paired sum since the two end orientations are opposite.
The exact product lies on the boundary of the
\(\Gamma_2^+\) chamber. On round strips \(t\in[-L,0]\)
in the constant-\(p_2\) round metric, \(I_\pm\to4\pi^2\)
as \(L\to\infty\). Their modular two-end sum stays away from
zero. On \(t\in[-L,L]\), \(I_\pm\to P\) and the modular
sum tends to zero on the complementary branch, with
no positive complementary Weyl mass.

There are smooth global \(\Gamma_2^+\) representatives
of the round conformal class with a long near-product
region and persistent individual flux. Put
\[
 w_L(t)=L-\log 2
  -\tfrac12\bigl(\log\cosh(t+L)+\log\cosh(t-L)\bigr).
\]
Then \(u_L=-\tfrac12(\tanh(t+L)+\tanh(t-L))\) is strictly
decreasing with \(-1<u_L<1\). At both ends in \(t\) the
factor is a positive smooth multiple of the corresponding
flat pole germ, since the two hyperbolic cosines have
expansions in \(e^{2t}\) or \(e^{-2t}\). The metric extends
smoothly across both poles. On \([-L/2,L/2]\) one has
\(\|w_L\|_\infty+\|w_L'\|_\infty=O(e^{-L})\).
Both individual boundary distances tend to \(4\pi^2\)
while (3) and the oriented modular sum tend to zero.
The conformal class has zero Weyl curvature. This example
tests the individual CS hypothesis and the possibility of
two-end cancellation within the chamber.

Even a local constant-\(p_2\) condition permits this
distinction. Fix \(p_2=q>0\) and solve on \([-L,L]\)
with \(w(0)=-\log L\), \(u(0)=0\),
\[
 u'=-\frac{2q}{3}\frac{e^{4w}}{1-u^2},\qquad w'=u.
\]
As long as \(|w+\log L|\le1\) and \(|u|\le1/2\),
\(|u'|\le C_qL^{-4}\). Integration in either direction
gives \(|u|\le C_qL^{-3}\) and \(|w+\log L|\le C_qL^{-2}\),
so for large \(L\) the solution continues through
\([-L,L]\) inside those bounds. The local metric has
positive \(p_2\), individual distances tending to \(4\pi^2\),
and paired charge \(O_q(L^{-3})\). No global radial
constant-\(q\) completion of this example at a smooth
pole is supplied. In fact in this radial ODE
\((1-u^2)^2-\frac23q e^{4w}\) is constant, and a
smooth pole would make that constant zero. The value
at \(t=0\) in the present example tends to one.

The positive Schouten choice addresses the sign and the
period in the charge identity. Verifying that the oriented
modular sum tends to zero for the actual representative and
residual ends remains the required analytic input. Long
coordinate length alone does not verify that input, and
testing smallness of every end separately is a stronger
condition than the required sum.
