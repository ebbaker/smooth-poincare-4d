# Spin transfer on one embedded ALE-end collar

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The exact serving model and reasoning
effort are unavailable. This is a conditional fixed-strip derivation
for SP4-FOT-EXTRACT-E02, using the source versions frozen in
[revision 1](../research-progress/handoffs/E02_EMBEDDED_REQUEST_20261125.md).

## The source collar and its normalization

Assume the positive Yamabe sequence and supplied nonflat oriented
Riemannian ALE limit with full embedded compact truncations from
[NECK-E03](../../01_neck_geometry/notes/E03_EMBEDDED_CUT_20261125.md).
The trivial spherical link follows from SEC §11.3 and the smooth
compactification \((\widehat X,\bar h)\), with \(\bar h=a^2h\), is the
one in §11.4. Use one comparison embedding for the entire
truncation containing the buffered cylinder. Write \(I_T=[-T,T]\)
with \(T=\ell+2\), and use any inner closed strip \(I\subset I_T\)
of length at least two retaining a positive buffer at both ends.
Let \(h_0=dt^2+\gamma_{S^3(1)}\).

On the marked cut from the smooth normal chart at \(p\),
\(\rho=s e^{-t}\), \(\Phi(t,\omega)=\exp_p(s e^{-t}J\omega)\)
with a fixed angular reflection \(J\). That reflection compensates
the inward radial direction in the normal ball, so the chart
preserves the orientation \(dt\wedge dV_\gamma\). With
\(F_i=\iota_i\circ\Phi\) and \(g_i^{\rm phys}=F_i^*g_i\),
the normalized cylinder metric is
\[
 \kappa_i=f_i^2 g_i^{\rm phys},\qquad
 f_i=\frac{a\circ\Phi}{\lambda_i s e^{-t}},\qquad
 \|\kappa_i-h_0\|_{C^1(h_0)}
  \le C_Ts^2+o_i(1;s,T).
\]
For \(I=[t_-,t_+]\) the end \(t_-\) is on the bubble-core side
of the strip, and \(t_+\) is farther down the end toward \(p\).
At each end the inverse conformal scale is
\(f_i^{-1}=\lambda_i s^{-1}e^{t_\pm}(1+O_T(s^\epsilon))\)
uniformly on the slice, with \(\epsilon>0\) from the SEC compactifying
factor. In the direct ALE-coordinate strip of radius \(r=R e^t\),
use the oriented end chart \(\Phi(t,\omega)=\chi(R e^t\omega)\)
and the corresponding \(F_i\). There the exact factor is
\(f_i=(\lambda_i R e^t)^{-1}\), with \(C^1\) error bounded by
\(C_T R^{-\alpha}+o_i(1;R,T)\). The same end labels apply.
These lengths are local physical scales on \(M_i\). They need
no comparison chart from the base side.

The spin structure on \(M_i\) exists and is unique because
\(H^2(M_i;\mathbb Z/2)=H^1(M_i;\mathbb Z/2)=0\).
Its pullback by the oriented \(F_i\) is isomorphic to the
product spin structure on the entire buffered cylinder, since
\(H^1(I_T\times S^3;\mathbb Z/2)=0\). Choose one lift, with
its common choice of sign on both ends. In particular chirality
is preserved. Restriction to each slice gives the unique spin
structure on \(S^3\), which also extends across the marked
standard cap. The model normal is \(+\partial_t\) throughout.
The outward boundary normals of the strip are \(-\partial_t\)
at \(t_-\) and \(+\partial_t\) at \(t_+\).

## Compare Dirac operators in the fixed product bundles

Write \(k_i=\kappa_i-h_0\) and
\(\eta_{1,i}=\|k_i\|_{C^1(h_0)}\).
The positive symmetric map \(b_i=(1+h_0^{-1}k_i)^{-1/2}\)
sends \(h_0\)-orthonormal frames to \(\kappa_i\)-orthonormal
frames. It gives the symmetric spin frame identification
\(U_\pm:S_{h_0}^\pm\to S_{\kappa_i}^\pm\) in the chosen lift.
For small \(\eta_{1,i}\), smooth dependence of the inverse
square root gives
\[
 |b_i-\mathrm{Id}|\le C|k_i|,\qquad
 |\nabla^{h_0}b_i|\le C|\nabla^{h_0}k_i|.
\]
In an \(h_0\)-orthonormal frame, the pulled-back chiral Dirac
operator has coefficients multiplying the derivatives in the
directions \(b_i e_\mu\), with Clifford matrices fixed by the lift.
The difference of the Levi-Civita connections is bounded by
\(C|\nabla^{h_0}k_i|\) from the metric compatibility formula.
Expressing the connection in the \(b_i e_\mu\) frames adds a term
controlled by \(\nabla^{h_0}b_i\) and, when the differentiation
direction changes, a term of size \(C|k_i|\) in a fixed
product frame. The associated spin connection acts through the
fixed spin representation and has the same bounds. Thus the
first- and zeroth-order differences have pointwise operator
norms bounded by \(C|k_i|\) and
\(C(|k_i|+|\nabla^{h_0}k_i|)\), respectively.
The constants can be taken uniformly in the cylinder length
using translated product frames over a fixed finite angular
atlas. [DIR §3.3, conditional attainment criterion](../../../02_dirac_and_twistor_spinors/manuscript/dirac_twistor_and_yamabe_rigidity.tex#L489)

Identify the reference negative-chirality target with the
positive-chirality source using \(c_0(dt)^{-1}:S_{h_0}^-\to
S_{h_0}^+\). In this convention \(L_0=\partial_t+A\),
with \(A=c_0(dt)^{-1}D_{0,\mathrm{tan}}\) acting on positive
chiral spinors. The tangential spectrum is the unit round
\(S^3\) Dirac spectrum in this normal convention, with gap
\(3/2\). For
\[
 L_i=c_0(dt)^{-1}U_-^{-1}D_{\kappa_i}^+U_+
\]
on the fixed reference bundles, the coefficient bounds give
\[
 \|(L_i-L_0)u\|_{L^2(h_0)}
     \le C\eta_{1,i}\|u\|_{H^1(h_0)}
\]
for every \(u\) on \(I\times S^3\), with no boundary condition
needed for the comparison. The normal used in the operator
identification is the *reference* normal. It does not presume
that the actual metric has product lapse and zero shift.
If a product-volume \(L^2\)-unitary identification is desired,
replace \(U_\pm\) by \(J_i^{-1/2}U_\pm\), with
\(J_i=dV_{\kappa_i}/dV_{h_0}\). The extra zeroth-order coefficient
is \(O(|\nabla^{h_0} k_i|)\), as follows by differentiating the
determinant. A slice \(L^2\) identification uses its own volume
ratio. [MATCH model convention and threshold](../../../02_dirac_and_twistor_spinors/01_dirac_collar_matching/brainstorm/notes/RELAXING_COLLAR_HYPOTHESES_20261125.md)

In the candidate matching norm from that model, any translated
subslab \(B\subset I\) of length in \([1,2]\) has
\(\operatorname{vol}_{h_0}(B\times S^3)\le4\pi^2\).
Consequently
\[
 \|k_i\|_\infty+
 \sup_B\|\nabla^{h_0}k_i\|_{L^4(B\times S^3,h_0)}
 \le \big(1+(4\pi^2)^{1/4}\big)\eta_{1,i}.
\]
For either chart, choose the width first, the remote center
second, and \(i\) last on the fixed full comparison domain.
The left side tends to zero in the order
\(\lim_{s\downarrow0}\limsup_i\), or
\(\lim_{R\to\infty}\limsup_i\). This gives the geometric
hypothesis for the fixed model boundary domain, with incoming
positive spectral projection of \(A\) at \(t_-\) and incoming
negative spectral projection at \(t_+\).

## Relate the fields to the physical metric

Let \(\beta_i:S_{g_i^{\rm phys}}^\pm\to S_{\kappa_i}^\pm\)
be the fiberwise conformal frame isometry, distinct from the
identification with the fixed model bundles. In dimension four,
\[
 D_{\kappa_i}^+\big(f_i^{-3/2}\beta_i\psi\big)
   = f_i^{-5/2}\beta_i D_{g_i^{\rm phys}}^+\psi .
\]
In the model positive bundle the normalized field is therefore
\(U_+^{-1}(f_i^{-3/2}\beta_i\psi)\).
At each fixed slice the weight \(f_i^{-3/2}\) has size
\((\lambda_i s^{-1}e^t)^{3/2}\) in the normal chart, and equals
\((\lambda_i R e^t)^{3/2}\) in the ALE chart. These are weights
for the field before any optional volume-density conjugation.
The coefficient smallness refers to the normalized operator,
so no uniform physical-scale Sobolev bound is inferred from it.
[DIR conformal spin law](../../../02_dirac_and_twistor_spinors/manuscript/dirac_twistor_and_yamabe_rigidity.tex#L346)

A single transferred strip supplies the specified operator and
trace gauge. Estimating the actual Cauchy data of adjoining
interiors and controlling frames on longer comparisons are
separate tasks. A low-energy curvature block alone supplies
neither this spin lift from a marked product nor the small
coefficient norm.
