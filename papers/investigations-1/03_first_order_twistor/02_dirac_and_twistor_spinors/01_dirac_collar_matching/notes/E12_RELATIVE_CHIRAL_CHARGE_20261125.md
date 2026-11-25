# SP4-FOT-MATCH-E12 · Relative chiral charge of a residual

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Delegated configuration gpt-6.2-sol / ultra.
Serving metadata are unavailable for independent verification. This is a
relative characteristic number identity and its consequence under
supplied small boundary transgression. Input versions are fixed in
[request revision 1](../research-progress/handoffs/E12_REQUEST_20261125.md).

## Chiral Chern–Weil density and sign

Let \(U\) be a smooth compact domain in an oriented Riemannian spin
four-manifold. Orient its boundary by the outward-normal-first convention.
Use the Levi-Civita spin connections on \(S^\pm|_U\), with anti-Hermitian
curvatures \(F_\pm\) and trace in the complex two-dimensional representation.
Set
\[
 I_\pm(U,g)=\int_U \left(|W^\pm|_{\mathrm{HS}}^2+\frac{s_g^2}{48}
                              -\frac{|\mathrm{Ric}_0|^2}{4}\right)dV_g .
\]
In the DIR convention \(S^+\) is the half-spin bundle acted on by
\(\Lambda^+\). If \(\sigma_+=-1\), \(\sigma_-=+1\), then
\[
 \operatorname{tr}(F_\pm\wedge F_\pm)=\sigma_\pm
 \left(|W^\pm|_{\mathrm{HS}}^2+\frac{s_g^2}{48}
                              -\frac{|\mathrm{Ric}_0|^2}{4}\right)dV_g . \tag{1}
\]
Here the scalar and Ricci terms use the physical metric.

To check (1), write the curvature operator in form blocks
\[
 \mathcal R=\begin{pmatrix} W^++(s_g/12)I & B\\ B^*&W^-+(s_g/12)I\end{pmatrix}.
\]
For the Dirac convention \(c(X)^2=-|X|^2\), the spin curvature on
\(X\wedge Y\) is \(-c(\mathcal R(X\wedge Y))/2\), restricted to the
relevant output chirality. On that chirality,
\(-\operatorname{tr}(c(\omega)c(\eta))=4\langle\omega,\eta\rangle\)
for \(\omega,\eta\) in the corresponding real form block. The factor
\(1/2\) in the spin curvature and the fundamental trace therefore
identify the squared norms of the self-dual and anti-self-dual
*input* parts of \(F_+\) with the squared Hilbert–Schmidt norms of
\(W^++(s_g/12)I\) and \(B\), respectively. Tracelessness of \(W^+\)
gives the scalar term \(3(s_g/12)^2=s_g^2/48\). In an orthonormal
eigenbasis for \(\mathrm{Ric}_0\), with eigenvalues \(\lambda_i\) of zero
sum, pair \(e^{1j}\) with its oriented complementary form. The
off-diagonal block has squared norm
\(\sum_{j=2}^4(\lambda_1+\lambda_j)^2/4=|\mathrm{Ric}_0|^2/4\).
For anti-Hermitian curvature the trace wedge is the negative squared
norm on the self-dual input part and the positive squared norm on the
anti-self-dual input part. The same calculation for \(F_-\) exchanges
the two input norms and yields \(\sigma_-\).
[DIR §2.3 spin curvature and Clifford trace](../../manuscript/dirac_twistor_and_yamabe_rigidity.tex#L276)
· [SEC operator and curvature norms](../../../01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L148)

In this trace convention \(c_2=[\operatorname{tr}(F\wedge F)/(8\pi^2)]\)
for a determinant-one bundle. The factor follows by expanding
\(\det(I+iF/(2\pi))\) with \(\operatorname{tr} F=0\). On the unit
round four-sphere, \(I_+=I_-=8\pi^2\) by \(s=12\) and
\(\operatorname{Vol}(S^4)=8\pi^2/3\). Thus the positive bundle has
second Chern number \(-1\), in agreement with the DIR topological
normalization. [DIR §3.2](../../manuscript/dirac_twistor_and_yamabe_rigidity.tex#L438)

## Boundary trivializations and relative integer

Supply smooth \(\mathrm{SU}(2)\) frames \(\tau_\pm\) of \(S^\pm\) on
the boundary components. A smooth nonzero chiral spinor on a
boundary component supplies such a frame by normalization and
quaternionic conjugation, using the invariant antiunitary quaternionic
structure on the corresponding half-spin bundle. In that frame write
\(A_\pm\) for the pullback spin connection one-form on the boundary
and \(F_\pm^\top=dA_\pm+A_\pm\wedge A_\pm\) for its tangential curvature.
The forms are for the physical ambient spin bundle restricted to the
boundary. This restriction includes the extrinsic connection data.
Use the unnormalized transgression
\[
 \operatorname{CS}(A)=\operatorname{tr}\left(A\wedge dA+\tfrac23 A^{\wedge3}\right)
      =\operatorname{tr}\left(A\wedge F^\top-\tfrac13 A^{\wedge3}\right),
 \qquad C_\pm=\sum_{\Sigma\subset\partial U}\int_\Sigma \operatorname{CS}(A_\pm).
\]
All terms in the sum use the orientation of the boundary of the
residual. Extend the frames a short distance into a collar. Modify
the connection there by smoothly cutting its matrix to zero near
\(\partial U\), leaving it unchanged outside the collar. On the collar
\(d\operatorname{CS}(A)=\operatorname{tr}(F\wedge F)\), so the
modification subtracts \(C_\pm\) from the curvature integral by Stokes.
Glue this bundle and modified connection to a trivial flat bundle on
the oppositely oriented copy of \(U\), using \(\tau_\pm\). The closed
double has second Chern number
\[
 k_\pm=\frac{1}{8\pi^2}\left(\int_U\operatorname{tr}(F_\pm\wedge F_\pm)-C_\pm\right)
      \in\mathbb Z .                                                 \tag{2}
\]
This is the relative second Chern number for the supplied boundary
framing. It depends on that framing; all choices of the collar
extension and cut-off give the same formula (2). In particular the
frame is needed only on the boundary. Equations (1) and (2) give
\[
 I_\pm(U,g)=\sigma_\pm\bigl(8\pi^2 k_\pm+C_\pm\bigr).                \tag{3}
\]
[Chern–Simons, *Characteristic Forms and Geometric Invariants*, §3, Proposition 3.2](https://math.mit.edu/juvitop/pastseminars/notes_2019_Fall/Chern-Simons.pdf#page=6)

On a closed boundary component change frame by \(\tau' =\tau q\),
where \(q:\Sigma\to\mathrm{SU}(2)\). The connection transforms as
\(A'=q^{-1}Aq+q^{-1}dq\). The integrated difference of the two CS
forms is
\[
 \int_\Sigma(\operatorname{CS}(A')-\operatorname{CS}(A))
       =-\tfrac13\int_\Sigma\operatorname{tr}((q^{-1}dq)^{\wedge3}) .  \tag{4}
\]
For example vary \(A\) from zero to its value. The integrated CS
variation is \(2\int\operatorname{tr}(\dot A\wedge F^\top)\), so the
two variations agree under gauge transport. At zero the difference
is the Maurer–Cartan expression in (4). Orient \(\mathrm{SU}(2)\) by
the left-invariant quaternion basis \((i,j,k)\). The cubic trace is
then \(-12\) times the unit three-sphere volume form, because
\(ijk=-1\) and \(\operatorname{tr}(-1)=-2\). Formula (4) is therefore
\(+8\pi^2\deg(q)\). The number \(k_\pm\) changes by the negative sum
of these degrees, preserving (3). A gauge extending over \(U\) has
zero summed degree by Stokes. This is the covariance needed for
the relative integer; numerical smallness of \(C_\pm\) uses a
specified small representative of the boundary transgression.

## Checking the small-boundary premise

In the supplied frames and physical induced boundary metrics, Hölder
gives on every connected boundary component
\[
 \left|\int_\Sigma\operatorname{CS}(A)\right|
 \le C\left(\|A\|_{L^3(\Sigma)}\|F^\top\|_{L^{3/2}(\Sigma)}
                        +\|A\|_{L^3(\Sigma)}^3\right).              \tag{5}
\]
Vanishing of the sum of the right sides suffices. For a fixed finite
number of ends, it suffices that each connection norm vanish and
each curvature norm stay bounded. Formula (5) uses tangential
curvature and is invariant under constant length rescaling of the
ambient metric with the induced spin isometry. For a nonzero spinor
\(\psi\) defining \(\tau\), the pointwise connection norm is bounded
by \(C|\nabla^\top(\psi/|\psi|)|\le C|\nabla^\top\psi|/|\psi|\).
Nonvanishing alone gives a frame. For example, the flat Dirac pole
\(c(x)\eta/|x|^4\) has no zero on the punctured end. Its unit frame on
a sphere has absolute degree one relative to a constant frame by the
real linear isometry \(\omega\mapsto c(\omega)\eta/|\eta|\). The
curvature is zero but its single-sphere CS integral has absolute
value \(8\pi^2\) by (4). This tests the numeric boundary hypothesis
even for an actual harmonic half-spinor and a flat end.

If the fields or comparison frames come from a nonconstant
conformal representative, pull them to the physical bundle by the
spin isometry and determine the physical connection in the resulting
frame. For \(h=a^2g\), the identified connection changes by
\(-c(X)c(\nabla\log a)/2-X(\log a)/2\) in the \(X\) direction.
Thus a small-boundary conclusion in another conformal metric
requires a transgression comparison or direct verification of (5)
for \(g\). The integer in a fixed framing is topological. The
boundary term and the density containing \(s_g\) and \(\mathrm{Ric}_0\)
refer to the same physical connection for (3).
[DIR conformal connection formula](../../manuscript/dirac_twistor_and_yamabe_rigidity.tex#L343)

## Consequence in the physical Yamabe band

Use SEC §11's volume-one Yamabe minimizers \(g_i\) on smooth oriented
homotopy four-spheres, so \(s_{g_i}=Y_i\) with
\(Y_i\le 8\sqrt6\,\pi\), \(E_+(g_i)=E_-(g_i)=E_i\le8\pi^2-\delta\)
and \(D_i:=\int_{M_i}|\mathrm{Ric}_{0,g_i}|^2\,dV_{g_i}\le4E_i\).
For a compact actual residual \(U_i\) of volume \(v_i\), nonnegativity
of the separate integrals gives
\[
 -8\pi^2+\delta\ \le\ -D_i/4\ \le\ I_\pm(U_i,g_i)
  \ \le\ E_i+Y_i^2v_i/48\ \le\ 8\pi^2-\delta+8\pi^2v_i .         \tag{6}
\]
For a tested chirality, if \(8\pi^2 v_i+|C_{\pm,i}|<\delta\),
equations (3) and (6) put \(8\pi^2 k_{\pm,i}\) strictly between
\(-8\pi^2\) and \(8\pi^2\). Therefore \(k_{\pm,i}=0\). With
\(v_i\to0\) and \(C_{\pm,i}\to0\) this holds for all sufficiently
large \(i\), and the exact residual equality is
\[
 \begin{aligned}
 E_\pm(U_i,g_i)
 &=\tfrac14\int_{U_i}|\mathrm{Ric}_{0,g_i}|^2\,dV_{g_i}
       -\tfrac{Y_i^2}{48}v_i+\sigma_\pm C_{\pm,i}\\
 &=\tfrac14\int_{U_i}|\mathrm{Ric}_{0,g_i}|^2\,dV_{g_i}+o(1).         \tag{7}
 \end{aligned}
\]
If both boundary hypotheses are supplied, (7) holds for both
chiralities and their residual energies differ by \(o(1)\).
If the geometric comparison is in the SEC iterated order, the same
proof applies: for every sufficiently remote fixed truncation whose
limsup of \(8\pi^2v_{i,R}+|C_{\pm,i,R}|\) is below \(\delta\), the
charge vanishes for large \(i\), and the error in (7) vanishes when
the truncations exhaust. This needs the scalar-volume and boundary
smallness in that order.

The conclusion uses the actual compact residual and its boundary
frames, with no assumptions on the interior frame or a full exterior
chart. For energy vanishing it leaves the residual trace-free Ricci
integral as an additional quantity to control. Volume vanishing
alone controls the constant scalar term. Neither the propagation
of end gauges nor small transgression on every actual boundary
component is supplied by the relative Chern–Weil identity.
[SEC §11.1 source budgets](../../../01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L3875)
· [SEC §12.4 residual accounting](../../../01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L4639)
