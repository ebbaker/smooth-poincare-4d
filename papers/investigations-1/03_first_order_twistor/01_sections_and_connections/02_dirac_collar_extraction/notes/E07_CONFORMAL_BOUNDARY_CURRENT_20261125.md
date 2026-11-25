# Conformal boundary current for the signed chiral charge

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Exact serving model and reasoning effort unavailable.
This is an identity and a conditional boundary estimate on a fixed smooth
oriented Riemannian spin domain. [Frozen request](../research-progress/handoffs/E07_REQUEST_20261125.md)
· [Return](../research-progress/handoffs/E07_RETURN_20261125.md)

## Signed conformal change

Let \(U\) be a compact smooth domain and let \(h=e^{2u}g\), with \(u\)
smooth on a neighborhood of \(U\). Use the same underlying oriented
\(U\) in both gauges. For \(g_t=e^{2tu}g\), \(0\le t\le1\), use the
normalized Schouten tensor and its first Newton tensor in covariant form
\[
 A_t=\tfrac12(\operatorname{Ric}_{g_t}-R_{g_t}g_t/6),\qquad
 N_t=(\operatorname{tr}_{g_t}A_t)g_t-A_t .
\]
Here \(\sigma_2(A_t)\) is applied to \(g_t^{-1}A_t\), and
\(\Delta=\nabla^i\nabla_i\) on functions. The contracted Bianchi
identity gives \(\operatorname{div}_{g_t}A_t=d(R_{g_t}/6)\),
hence \(\operatorname{div}_{g_t}N_t=0\). The infinitesimal conformal
Schouten law at \(g_t\) gives \(\partial_t A_t=-\nabla_{g_t}^2u\).
If \(K_t=g_t^{-1}A_t\), then
\(\partial_tK_t=-2uK_t-g_t^{-1}\nabla^2_{g_t}u\).
Differentiation of \(\sigma_2\) uses
\(T_1(K_t)=\operatorname{tr}(K_t)\operatorname{Id}-K_t\) and
\(\operatorname{tr}(T_1(K_t)K_t)=2\sigma_2(K_t)\).
The resulting \(-4u\sigma_2\) cancels the \(4u\) volume derivative,
so
\[
 \partial_t[\sigma_2(A_t)dV_{g_t}]
 =-\operatorname{div}_{g_t}
      [N_t^{\sharp_{g_t}}\nabla^{g_t}u]\,dV_{g_t}.
 \tag{1}
\]
The path requires no ellipticity or cone condition. The signs in
(1) are opposite to those of the convention \(g_t=e^{-2tu}g\).
[Gursky–Streets, §2.1 (2-1)–(2-5) and Lemma 2.1](https://msp.org/gt/2018/22-6/gt-v22-n6-p08-p.pdf)

Set \(q_g(U)=\int_U\sigma_2(A_g)dV_g\).
For each boundary face \(\Sigma\) use the outward \(g_t\)-unit normal
\(\nu_t\) and the induced area measure. With \(J\) the signed sum,
\[
 J=J(g,u;U)
 =\sum_{\Sigma\subset\partial U}
       \int_0^1\!\!\int_\Sigma N_t(\nu_t,\nabla^{g_t}u)\,dS_{g_t}\,dt,
 \qquad q_h(U)-q_g(U)=-J .
 \tag{2}
\]
For the MATCH-E12 normalization \(I_\pm(U,g)=E_\pm(U)+2q_g(U)\),
since \(2\sigma_2(A_g)=R_g^2/48-|\operatorname{Ric}_{0,g}|^2/4\).
Conformal invariance of the chiral Weyl measures gives
\[
 I_\pm(U,h)-I_\pm(U,g)=-2J .
 \tag{3}
\]
In particular the two chiral changes agree.

Transport the specified physical frames by the canonical conformal
spin isometry. The relative second Chern integers in these paired
frames agree. With anti-Hermitian fundamental trace and
\(\sigma_+=-1,\ \sigma_-=+1\), MATCH-E12 uses
\(I_\pm=\sigma_\pm(8\pi^2 k_\pm+C_\pm)\), where \(C_\pm\) is the
oriented sum of unnormalized Chern–Simons integrals. In these
frames (3) gives the real equality
\[
 C_\pm(h)-C_\pm(g)=-2\sigma_\pm J .
 \tag{4}
\]
The same relation holds on each closed boundary component for
the difference of the Chern–Simons integrals. For example, the
Chern–Weil transgression between the two Levi-Civita spin
connections is a global three-form under the conformal bundle
identification. Its integral agrees on each component with the
framewise difference. Alternatively, test (3) on a collar of one
component and extend \(u\) to be zero near the other collar
face, keeping its original germ at the tested face. Since that
other face has equal connections, (4) gives the single-face formula.
If independent frame degrees are used, only the corresponding
congruence modulo \(8\pi^2\) is frame independent. The modular
error is at most \(\operatorname{dist}(C_\pm(g),8\pi^2\mathbb Z)
+2\operatorname{dist}(J,4\pi^2\mathbb Z)\).
[MATCH-E12 signed curvature and frame convention](../../../02_dirac_and_twistor_spinors/01_dirac_collar_matching/notes/E12_RELATIVE_CHIRAL_CHARGE_20261125.md#boundary-trivializations-and-relative-integer)
· [EXTRACT-E06 physical frames](E06_PHYSICAL_END_FRAMES_20261125.md#signed-charge-and-the-physical-ricci-accounting-criterion)

## Physical boundary tensors

On a given face let \(\nu\) be its outward \(g\)-unit normal.
The \(\nu_t\), gradient and area factors in the integrand of (2)
are \(e^{-tu}\), \(e^{-2tu}\), \(e^{3tu}\), which cancel.
In covariant form
\(N_t=(\operatorname{tr}_{g}A_t)g-A_t\) and
\(A_t=A_g-t\nabla^2u+t^2du\otimes du-\tfrac12 t^2|\nabla u|^2g\).
Integrating the polynomial in \(t\) gives the exact face contribution
\[
 J_\Sigma
   =\int_\Sigma\left\{
     N_0(\nu,\nabla u)
     +\tfrac12[\nabla^2u(\nu,\nabla u)-(\Delta u)u_\nu]
     -\tfrac12|\nabla u|^2u_\nu\right\}dS_g ,
 \qquad
 N_0=\tfrac R4 g-\tfrac12\operatorname{Ric}_g.
 \tag{5}
\]
Thus no values of \(u\) appear, even if its constant offsets
differ between faces.

More explicitly let \(f=u|_\Sigma\), \(v=\nabla_\Sigma f\),
\(a=u_\nu\), \(II(X,Y)=g(\nabla_X\nu,Y)\), and \(H=\operatorname{tr}II\).
The normal-normal Hessian cancels in (5).
Use
\(\nabla^2u(\nu,v)=\langle\nabla_\Sigma a,v\rangle-II(v,v)\)
and
\(\Delta u=\nabla^2u(\nu,\nu)+\Delta_\Sigma f+Ha\).
An integration by parts on the closed face gives
\[
 J_\Sigma=\int_\Sigma\left\{
   aN_0(\nu,\nu)+N_0(\nu,v)-a\Delta_\Sigma f
   -\tfrac12II(v,v)-\tfrac12 H a^2
   -\tfrac12 a(a^2+|v|^2)\right\}dS_g .
 \tag{6}
\]
These terms use the curvature along the physical face, its second
fundamental form, tangential derivatives of its conformal factor,
and the first normal derivative. The term
\(-\int_\Sigma a\Delta_\Sigma f\) can equivalently be
\(\int_\Sigma\langle\nabla_\Sigma a,\nabla_\Sigma f\rangle\).
Under \(g\mapsto r^{-2}g\), derivative and shape magnitudes in
(6) have factors \(r\), curvature and tangential Hessian
magnitudes have factors \(r^2\), and \(dS\) has factor \(r^{-3}\).
The signed scalar flux stays invariant under such a constant rescaling.

## Sufficient smallness tests

Use the face measure in (6) and put
\[
 \alpha_\Sigma=\|\,|a|+|v|\,\|_3,\qquad
 \beta_\Sigma=\|N_0(\nu,\cdot)\|_{3/2}
                       +\|\Delta_\Sigma f\|_{3/2},\qquad
 \gamma_\Sigma=\|II\|_3.
\]
The Laplacian term can instead be estimated with
\(\|\nabla_\Sigma a\|_{3/2}\) using the equivalent integral.
Hölder and \(|H|\le\sqrt3|II|\) give
\[
 |J_\Sigma|
 \le C(\alpha_\Sigma\beta_\Sigma+
              \gamma_\Sigma\alpha_\Sigma^2+\alpha_\Sigma^3).
 \tag{7}
\]
Each norm in (7) is invariant under constant rescaling, including
on different physical scales at the two ends. A vanishing sum of
these products suffices. This allows only mixed-norm control of the
indicated jets on the boundary and does not use a bulk \(C^2\) bound.
In the linear product one can also use weak \(L^{3/2,\infty}\) for
the two coefficients in \(\beta_\Sigma\), paired with
\(L^{3,1}\) for \(a,v\), and keep the remaining strong \(L^3\)
bounds. The mixed estimate follows directly by rearranging
\(\int |AB|\) and bounding the rearrangement of the weak
coefficient by \(s^{-2/3}\|B\|_{3/2,\infty}\).
None of these norms sees the constant values of \(f\).

For a paired test use supplied parametrizations of the two faces by
one oriented link, with the common forward transverse direction.
Evaluate the scalar integrand in (5) in that direction on both
faces. Pull its product with each physical area density to the link,
obtaining \(j_0\) and \(j_1\). With the residual on the interval between
the faces, its left outward normal is backward and its right
outward normal is forward, so \(J_{\rm pair}=\int(j_1-j_0)\).
An \(L^1\)-small difference, or convergence of this pairing against
the constant function \(1\), suffices even when the single-face
currents are large. Sum over all actual boundary faces. Two
adjacent domains using the same gauge on their common face
give exact cancellation there by reversing the outward normal.

## Physical and target charge budgets

Under the E06 physical comparison, the oriented \(C_\pm(g)\)
in the prescribed flat end frames vanish in the stated iterated
exhaustion and the relative integer is zero after fixing
truncations with enough margin. Thus \(I_\pm(U,g)=o(1)\)
in that exhaustion. The assumptions include physical volume
and physical end gauges. If the target \(h\) has \(\sigma_2(A_h)\ge0\)
on \(U\), as in the \(\Gamma_2^+\) application of NECK-E18,
then \(0\le E_\pm(U)\le I_\pm(U,h)\). Equations (2)–(3) imply
\[
 0\le E_\pm(U)\le |I_\pm(U,g)|+2J_-,
 \qquad J_-=\max\{-J,0\}.
 \tag{8}
\]
Only the negative part of the signed total needs to vanish for
this energy inference. If \(|J|\to0\), then (4) also gives
real Chern–Simons smallness in the transported frames. If the
physical \(g\) is a unit-volume Yamabe minimizer,
\[
 J=q_g(U)-q_h(U)
 \le q_g(U)\le Y([g])^2\operatorname{Vol}_g(U)/96.
\]
The positive part is therefore already small when the physical
residual volume vanishes. The boundary issue is to control the
opposite sign. Conditions (6)–(7) can be tested in the same order
of limits as the physical end data.

For the separate target-only modular test, total chiral mass on
the closed homotopy sphere in the \(\Gamma_2^+\) gauge is \(8\pi^2\).
If the complement supplies a uniform positive lower \(h\)-mass,
then \(I_\pm(U,h)\) is uniformly below \(8\pi^2\).
Small modular Chern–Simons in \(h\) then puts the nonnegative
\(I_\pm(U,h)\) near the zero multiple. Equation (4) gives a way
to transfer that smallness from the physical frames by controlling
the signed flux modulo \(4\pi^2\).
[EXTRACT-E06, physical charge and limit order](E06_PHYSICAL_END_FRAMES_20261125.md#signed-charge-and-the-physical-ricci-accounting-criterion)
· [NECK-E14, cone sign and total mass](../../01_neck_geometry/notes/E14_POSITIVE_RICCI_GAUGE_20261125.md)
· [NECK-E18 target branch](../../01_neck_geometry/research-progress/handoffs/E18_REQUEST_20261125.md)

## Radial sign and the limitation of global bounds

For \(g=dr^2+r^2\gamma_{S^3(1)}\) on \(r_0\le r\le r_1\) and radial
\(u\), put \(p=ru'(r)\) and \(\omega_3=2\pi^2\).
Then \(N_0=0\), \(v=0\), and \(a=\pm p/r\), \(H=\pm3/r\),
where the plus sign is the outer face. Equation (6) gives
\[
 J_{\rm outer}=-\tfrac{\omega_3}{2}(3p(r_1)^2+p(r_1)^3),\qquad
 J_{\rm inner}=+\tfrac{\omega_3}{2}(3p(r_0)^2+p(r_0)^3).
\]
For \(u=\log(2/(1+r^2))\) the target is unit round,
\(p=-2r^2/(1+r^2)\), and \(J<0\) on each nonempty finite
shell. Equation (2) then gives positive \(q_h(U)\) as it should.
Sending \(r_0\downarrow0,\ r_1\to\infty\) gives
\(-J=4\pi^2\), the total round Schouten integral.
For the exact cylinder \(u=-\log r\) both values of \(p\) are
\(-1\), so the face currents cancel with nonzero magnitudes.
This checks the outward signs with different constant values
of \(u\) at the two faces.

Global bounds alone do not evaluate this boundary condition.
For an exact test on \(S^4\) let \(g\) be round and
\(h_\lambda=\Phi_\lambda^*g\), with stereographic dilation
\(\Phi_\lambda(x)=\lambda x\), \(\lambda\to\infty\).
Both gauges are isometric round metrics, hence have identical
positive Yamabe constants and global curvature norms, and
\(\sigma_2(A)=3/2\) in both unit round gauges. For fixed
\(0<a<b<\infty\), use the actual residual annulus
\(U_\lambda=\{a/\lambda\le |x|\le b/\lambda\}\).
Its \(g\)-volume tends to zero, while its \(h_\lambda\)-volume is
the fixed round volume of \(\{a\le |x|\le b\}\).
The identity \(J=q_g(U_\lambda)-q_{h_\lambda}(U_\lambda)\)
therefore has a strictly negative nonzero limit. The physical
connection on the scaled faces tends to the flat connection in
the Cartesian frames. This test is in the zero Weyl class.
It demonstrates the absence of a boundary estimate from the
global curvature and Yamabe bounds alone, even with positive
constant Schouten density and vanishing physical volume.
A result for the positive-energy band would have to use further
information on that class or on the chosen physical cuts.
