# Independent check of the weak marked base · EXTRACT-E14

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The request assigned gpt-6.2-sol/ultra.
Exact serving model and reasoning effort are unavailable. Starting
checkout `7db310a2a9219c537b440d7c2fb39e602a32b729`. The working derivation inspected had
SHA-256 `71fa1d973301df7034e2ffdf935aca93a187103f6eb6d60cbcbbc0dd34dea4da`.
[Frozen check](../research-progress/handoffs/WEAK_BASE_CHECK_REQUEST_20261125.md)
· [Derivation checked](../notes/E14_WEAK_MARKED_BASE_20261125.md)

The relative first variation, scalar-square replacement and Yamabe
form argument hold under the supplied weak comparison of whole marked
truncations. The strong curvature conclusion concerns the two Weyl
components. In the physical gauge the argument also gives local strong
\(W^{1,4/3}\) convergence of the metric tensors once the Yamabe factor
converges strongly in \(H^1\cap L^4\).

## Both chiral components and the Bach limit

Work in a fixed relatively compact oriented coordinate ball, with
smooth metrics \(m_i\to h\) uniformly and strongly in \(W^{1,4}\).
Write \(R_i=R(m_i)\) for the all-lowered curvature tensor and
\(F_i^\pm=P_{m_i}^\pm R_i\) for the chiral Weyl matrix in the positive
square-root metric frame including the density factor
\((\det m_i)^{1/4}\). The uniform local \(L^2\) bound on full curvature
and metric equivalence bound \(R_i\) in coordinate \(L^2\).
The formula \(R(m)=L(D^2m)+Q_m(Dm,Dm)\), with \(L\) constant,
gives distributional convergence of its first term and strong \(L^2\)
convergence of the quadratic term. Consequently \(R_i\) and \(F_i^\pm\)
converge weakly in \(L^2\) to \(R(h)\) and \(F_h^\pm\).
[NECK-E07, all-lowered formula](../../01_neck_geometry/notes/E07_FIRST_ORDER_CAP_20261125.md#comparison-before-chiral-projection)

Take \(v_i=m_i-h\) and a fixed smooth compactly supported nonnegative
weight \(\chi\). The exact expression for the varied curvature is
\[
 DR(m_i)[\chi v_i]
   = L(D^2(\chi v_i))
     +2Q_{m_i}(Dm_i,D(\chi v_i))
     +(DQ_{m_i}[\chi v_i])\bigl(Dm_i,Dm_i\bigr),
\]
with \(Q_m\) symmetrized. The commutator of \(L(D^2)\) with \(\chi\)
tends strongly to zero in \(L^2\), by \(Dv_i\to0\) in \(L^4\).
The last two terms tend to zero in \(L^2\). Also
\(Q_{m_i}(Dm_i,Dm_i)-Q_h(Dh,Dh)\to0\) in \(L^2\).
After including the projection derivative
\(DP_{m_i}^\pm[\chi v_i]R_i\), bounded by
\(C\|v_i\|_\infty\|R_i\|_2\), this yields
\[
 DF_i^\pm[\chi v_i]=\chi(F_i^\pm-F_h^\pm)+o_{L^2}(1).
\]
Extend the conformal gauge of \(m_i\) to a global representative
on the physical source by cutting off the logarithm of its conformal
factor outside the test support. Chiral energy uses the real
Hilbert–Schmidt norm and the signature makes the two closed first
variations equal. Each variation is \(-\tfrac12\int\langle B,H\rangle\).
The four-dimensional conformally invariant local total Bach norm
bounds \(|DE_\pm[\chi v_i]|\) by \(C\|v_i\|_\infty\|B_{g_i}\|_1\).
Subtracting the weakly vanishing pairing with \(\chi F_h^\pm\) now
proves \(\int\chi|F_i^\pm-F_h^\pm|^2\to0\). This step needs only
a bounded Bach norm. Strong \(L^1\) convergence of the two densities
follows by Cauchy–Schwarz.
[SEC §14.1](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L5220)

For a fixed smooth compactly supported variation \(H\),
\(DP_{m_i}^\pm[H]R_i\) converges weakly by uniform convergence of
its coefficient, whereas the remaining three terms converge
strongly by the displayed derivative formula. Pair with the now
strongly convergent \(F_i^\pm\) to pass the chiral first variation
to \(h\). The vanishing physical total Bach norm makes this limit
zero for every \(H\). Thus \(B_h=0\) away from the finitely many
marks and, by smoothness of \(h\), on the closed base.

## Local scalar-square replacement

The comparison assumption supplies \(L^4\) bounds on the connection
one-form \(\omega_i\) in the fixed coordinate square-root frame.
In the trivialized oriented orthonormal frame, use a normalized
polarized Euler polynomial \(\mathcal P\). The curvature of
\(t\omega_i\) is \(t\Omega_i+(t^2-t)\omega_i\wedge\omega_i\).
Differentiation, the Bianchi identity and invariance of
\(\mathcal P\) give
\[
 \mathcal P(\Omega_i,\Omega_i)
     =d\left(2\int_0^1
       \mathcal P\bigl(\omega_i,t\Omega_i+
              (t^2-t)\omega_i\wedge\omega_i\bigr)\,dt\right).
\]
This proves the needed local transgression directly. The three-form
is bounded by \(C(|\omega_i||\mathrm{Rm}_{m_i}|+|\omega_i|^3)\).
With four-index norms the Euler integrand, up to a constant,
is \(\mathcal E=|W|^2-2|\mathrm{Ric}_0|^2+R^2/6\), so
\(|\mathrm{Rm}|^2+\mathcal E=2|W|^2+R^2/3\).
For a fixed compactly supported smooth cutoff \(\eta\), integration
against \(\eta^2\) and Young's inequality therefore give
\[
 \int\eta^2|\mathrm{Rm}|^2\le C\left[
 \int\eta^2(|W|^2+R^2)
 +\int |d\eta|^2|\omega_i|^2
 +\int\eta|d\eta||\omega_i|^3\right].
\]
All norms are equivalent to fixed coordinate norms on this support.
The last two integrals are uniformly bounded already, and Weyl energy
is bounded by the conformally invariant physical source budget.
Thus a local scalar \(L^2\) bound gives the full curvature bound
on smaller patches. This uses neither physical smooth convergence
nor a bound on \(D^2m_i\) in coordinate norms.
[Chern–Simons, §3 transgression](https://annals.math.princeton.edu/1974/99-1/p03)
· [Chang–Gursky–Yang, (0.4)](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf)

The scalar premise is additional in a varying conformal gauge.
On a fixed smooth conformal class take \(m_i=e^{2\phi_i}h\) with
\(\phi_i=i^{-3/2}\zeta\sin(ix^1)\) on one coordinate ball and
\(\zeta=1\) on a smaller ball. The uniform and \(W^{1,4}\)
differences tend to zero, while on the smaller ball the scalar
conformal law has leading oscillation of size \(i^{1/2}\) from
\(-6\Delta_h\phi_i\). Its \(L^2\) norm diverges and Weyl energy
is unchanged. This illustrates the gauge issue on a fixed class.

## Yamabe tests and marked transfer

The coordinate scalar density is \(\partial_a A^a(m,Dm)+C(m,Dm)\),
where \(A\) is linear and \(C\) quadratic in \(Dm\).
This follows by integrating the derivative of each Christoffel
symbol against \(\sqrt{\det m}\,m^{-1}\) in the scalar curvature
formula. The differences converge strongly in \(L^4\) and \(L^2\),
respectively. In pairing with \(fk\), the divergence error costs
\(\|A_i-A_h\|_4(\|df\|_2\|k\|_4+\|f\|_4\|dk\|_2)\).
The quadratic error costs \(\|C_i-C_h\|_2\|f\|_4\|k\|_4\).
The principal term converges in operator norm from the uniform
metric comparison. This gives the stated local form estimate,
including one locally \(H^1\) factor cut off on a larger patch.
Transporting compact tests by \(u_i^{-1}\), then using point
cutoffs of vanishing \(H^1\) capacity, gives \(Y([h])\ge y\).

Test the physical factor equation with \(\eta^2u_i\).
The source volume bound and the form comparison give a uniform
local \(H^1\) bound. Hence the weak limit solves the equation in
the smooth metric \(h\), with global \(L^4\) mass at most one.
The puncture cutoff gradient is bounded in \(L^4\) and its
error is multiplied by the vanishing \(L^4\) mass of \(u\) in
its shrinking transition. The weak equation extends and a
nonzero factor has unit mass by \(Y([h])\ge y>0\).

For the subround case the critical test is justified locally
as follows. Put \(w_i=u_i-u\). Local almost-everywhere
convergence and fourth-power splitting give
\(\limsup_i\|w_i\|_4^4\le1\) on each fixed small ball.
Test the difference equation with \(\eta^2 w_i\). Terms
containing a fixed \(u\) in the cubic difference vanish by
truncating \(u\) in \(L^4\), using bounded critical norms for
the tail and strong subcritical convergence for the bounded
part. The leading term is bounded by
\(\|w_i\|_4^2\|\eta w_i\|_4^2\). Thus, for every sufficiently
small \(\varepsilon>0\), the sharp local Sobolev bound in the
smooth \(h\) metric gives
\[
 (Y_{\rm rd}-\varepsilon)\|\eta w_i\|_4^2
 \le 6\|d(\eta w_i)\|_2^2
 \le (y+o(1))\|\eta w_i\|_4^2+o(1).
\]
The strict gap gives strong local \(H^1\cap L^4\) convergence.
A positive physical-volume witness implies \(u\ne0\).
Also \(u_i^2\to u^2\) in \(L^2\) and
\(d(u_i^2)=2u_i\,du_i\to2u\,du\) in \(L^{4/3}\).
Multiplying by \(m_i\to h\) in \(C^0\cap W^{1,4}\) proves the
physical tensor convergence claimed above.
[Lee–Parker, Theorems 2.1–2.3 and the conformal Laplacian](https://users.math.msu.edu/users/parker/YamabeProblem.pdf)

At each fixed normal radius and fixed buffer length, the preliminary
splice \(h+\theta(m_i-h)\) preserves the chiral budget in the limit.
The constant principal curvature coefficient leaves just the
commutators with \(D\theta\) and \(D^2\theta\) and the quadratic
and projection errors already bounded on the fixed transition.
The same splice preserves the positive global Yamabe lower bound
up to \(o_i(1)\). In fact a compactly supported comparison cutoff
equal to one on the modified region, together with the complementary
cutoff in a squared partition, gives a localized gradient bound
by the source form plus \(C\|f\|_4^2\) via IMS. The complementary
form is nonnegative by source Yamabe positivity. The form difference
above then controls the global perturbation for arbitrary tests.
Taking \(i\to\infty\) before decreasing the normal radius enables
the inherited smooth caps on the exact \(h\) buffers. The marked
topology and the strict \(4\pi^2\) exterior gap apply to these caps.

If every fixed compared compact evacuates, choose the physical
volume test transition on the retained side beyond the splice.
Its \(L^4\) gradient norm is bounded by uniform metric comparison
and conformal invariance. Hölder controls its physical gradient
square by the square root of the vanishing transition volume.
This is precisely the input of the earlier evacuation proof.
The original Yamabe inequality concentrates the volume in one
exterior, whose positive cap then satisfies
\(\limsup Y_{\rm cap}\le y\). Gauss–Bonnet in its own Yamabe
gauge gives the deficit \((Y_{\rm rd}^2-y^2)/48\). At exact
minimization this contradicts the equality of base and source
energies. The premises of the check begin with the whole marked
weak comparison and its local curvature bound. Production of
that comparison and metric-space convergence remain outside the
verified implication.
[NECK-E09, marked caps](../../01_neck_geometry/notes/E09_FINITE_PUNCTURE_TRANSFER_20261125.md)
· [Earlier evacuation argument](../../../reviews/SECOND_COLLAR_LEAD_CHECK_20261125.md)
