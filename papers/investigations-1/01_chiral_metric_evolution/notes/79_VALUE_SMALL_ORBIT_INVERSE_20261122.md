# SP4-CME-E79 — Value-small inverse for the actual orbit direction

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. The helper launch was configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and
selected lead settings were unavailable. I authored E48 and the
E73 audit. I did not author E71 or B47. The frozen digests in the
[request][req] matched before use. This derivation uses the assessed
round complement and fixed reference conventions. No new primary
source was inspected. [B47][b47]. [Lead assessment][assess]. [Return][ret].

## Reference data and elimination of the horizontal variable

Let \(A_0\) be the smooth positive perfect chiral connection on the
compact, closed, oriented round Riemannian \(S^4\). Use its native
metric \(g_0\) and the positive internal metric from the negative
Killing form. Every pairing, adjoint, and Sobolev norm below
uses these fixed reference data. Denote by \(d_0=d_{A_0}\)
the covariant derivative on sections of the internal bundle \(E\).
For smooth \(A=A_0+a\), set
\[
 \beta=F_A-F_0,\qquad S_Au=\iota_uF_A,\qquad
 \epsilon=\|a\|_\infty+\|\beta\|_\infty .
\]
Take \(\epsilon\le\epsilon_*\) for a reference-dependent positive
\(\epsilon_*\) chosen below. The tube can be chosen inside the
positive definite region because its pointwise curvature margin
at \(A_0\) is positive and the base is compact. Write \(S_0\)
for \(S_{A_0}\). E71 gives \(S_0^*S_0=\tfrac32 I\).
[E71 (1)–(2)][e71]. [E73, native splitting][e73].

Set
\[
 C_A=S_0^*S_A,\qquad H_A=C_A^{-1}S_0^*,\qquad
 \Pi_A=I-S_AH_A .                                                       \tag{1}
\]
The contraction bound \(\|S_A-S_0\|_\infty\le c\|\beta\|_\infty\)
gives \(\|C_A-\tfrac32 I\|_\infty\le c\|\beta\|_\infty\).
The pointwise Neumann inverse gives a uniform bound for
\(C_A^{-1}\) in the tube and
\(\|C_A^{-1}-\tfrac23 I\|_\infty\le c\|\beta\|_\infty\).
Consequently \(H_A,\Pi_A\) are uniformly bounded and
\[
 \|H_A-H_0\|_\infty+\|\Pi_A-\Pi_0\|_\infty
       \le c\|\beta\|_\infty .                                         \tag{2}
\]
Here \(H_0=\tfrac23S_0^*\) and \(\Pi_0=I-S_0H_0\).
The identities \(H_AS_A=I\), \(S_0^*\Pi_A=0\) and
\(\Pi_A|_{\ker S_0^*}=I\) show that \(\Pi_A\) is the fiber
projection onto \(\ker S_0^*\) along \(\operatorname{im}S_A\).
For instance \(\Pi_Av=0\) is equivalent to \(v=S_AH_Av\).
This projection uses the image of \(S_A\) and the fixed slice
test \(S_0^*\). Its definition requires no adjointness of
\(\Pi_A\).

## Uniform weak inverse on the fixed complement

Let \(K_0=d_0^*\Pi_0d_0\) and let \(N=\ker K_0\) be the
finite-dimensional smooth reference kernel of E71. Set
\[
 V=H^1(E)\cap N^\perp,\qquad
 Z=\{\ell\in H^{-1}(E):\langle\ell,\psi\rangle=0
                         \text{ for all }\psi\in N\}.
\]
The perpendicular sign uses \(L^2\). E71 gives
\(K_0:V\to Z\) bounded invertible by coercivity of
\(\|\Pi_0d_0\phi\|_2^2\) on \(V\). It also gives
\(d_0\psi\in\operatorname{im}S_0\) for \(\psi\in N\).
[E71 (5)–(6)][e71]. [E73, weak inverse][e73].

For \(\phi,\eta\in H^1(E)\) define \(K_A=d_0^*\Pi_A d_A\)
weakly by
\[
 \langle K_A\phi,\eta\rangle
    =(\Pi_A(d_0\phi+[a,\phi]),d_0\eta)_{L^2}.                           \tag{3}
\]
Since \(\operatorname{im}\Pi_A=\ker S_0^*\), the pairing vanishes
for \(\eta\in N\). Thus \(K_A\) has range in \(Z\) on all of
\(H^1\). The identical test gives \(d_0^*\Pi_A r\in Z\) for
every \(L^2\) one-form \(r\). The cancellation concerns the
test argument in (3). The \(N\) component of the input is
treated separately below.

Subtracting the reference form gives
\[
 \begin{split}
 \langle (K_A-K_0)\phi,\eta\rangle
  &=((\Pi_A-\Pi_0)d_0\phi,d_0\eta)_{L^2}
     +(\Pi_A[a,\phi],d_0\eta)_{L^2},\\
 |\langle (K_A-K_0)\phi,\eta\rangle|
  &\le C\epsilon\|\phi\|_{H^1}\|\eta\|_{H^1}.
 \end{split}                                                          \tag{4}
\]
In particular the possibly nonsymmetric form remains coercive
on \(V\) for small \(\epsilon_*\). Equivalently, reduce the tube
so that
\(\|K_0^{-1}(K_A-K_0)|_V\|_{V\to V}\le\tfrac12\).
On \(V\), \(K_A=K_0(I+K_0^{-1}(K_A-K_0)|_V)\), hence the
Neumann series gives
\[
 B_A=(K_A|_V)^{-1}:Z\longrightarrow V,\qquad
 \|B_Af\|_{H^1}\le 2\|K_0^{-1}\|_{Z\to V}\|f\|_{H^{-1}}.               \tag{5}
\]
This is a two-sided inverse with the indicated domain and
codomain. It depends for its bound only on the fixed reference
estimate and the value tube. No derivatives of \(a\) or \(\beta\)
are used in (2)–(5). In particular this argument accommodates
the reference kernel without a kernel vanishing assumption.

## Exact splitting and excluded parameters

Let \(\mathcal X=\{r\in L^2(T^*S^4\otimes E): S_0^*r=0,\
d_0^*r=0\text{ in }H^{-1}\}\). For any \(r\in L^2\) put
\[
 \phi=B_A d_0^*\Pi_A r,\qquad
 u=H_A(r-d_A\phi),\qquad
 r_{\rm sl}=\Pi_A(r-d_A\phi).                                          \tag{6}
\]
The forcing bound \(\|d_0^*\Pi_A r\|_{H^{-1}}\le C\|r\|_2\),
(5), and the uniformly bounded map \(d_A:H^1\to L^2\) give
\[
 \|\phi\|_{H^1}+\|u\|_2+\|r_{\rm sl}\|_2\le C\|r\|_2.                  \tag{7}
\]
The identity \(I=S_AH_A+\Pi_A\) gives the decomposition
\(r=d_A\phi+S_Au+r_{\rm sl}\). Its residual has
\(S_0^*r_{\rm sl}=0\) and \(d_0^*r_{\rm sl}=d_0^*\Pi_A r-K_A\phi=0\)
weakly. If a decomposition has \(\phi\in V\) and a residual
in \(\mathcal X\), applying \(d_0^*\Pi_A\) recovers the equation
for \(\phi\) in (6). Applying \(H_A\) then determines \(u\).
This proves uniqueness for the restricted parameters.

The bounded residual operator is
\[
 \mathcal P_A=\Pi_A-\Pi_A d_A B_A d_0^*\Pi_A .                           \tag{8}
\]
For \(r\in\mathcal X\) one has \(\Pi_A r=r\) and \(d_0^*r=0\),
so \(\mathcal P_A r=r\). Thus (8) is a projection with range
\(\mathcal X\). Every element of
\[
 \mathcal Y_A=\{d_A\phi+S_Au:\phi\in V,\ u\in L^2(TS^4)\}              \tag{9}
\]
has zero residual by uniqueness, and a zero residual gives
exactly this representation by (6). Hence
\(\mathcal Y_A=\ker\mathcal P_A\) is closed in \(L^2\) and
\(L^2=\mathcal Y_A\oplus\mathcal X\). Equation (7) bounds the
inverse of the restricted direction map on \(\mathcal Y_A\).
At \(A_0\) this projection recovers E71's orthogonal projection.
At a general \(A\), (8) is a projection along (9); its
construction asserts no orthogonality.

For \(\psi\in N\), split its effect using
\[
 \theta_A(\psi)=B_AK_A\psi\in V,\qquad
 w_A(\psi)=\psi-\theta_A(\psi),\qquad
 z_A(\psi)=\Pi_A d_A w_A(\psi).
                                                                            \tag{10}
\]
Then \(K_Aw_A(\psi)=0\), so \(z_A(\psi)\in\mathcal X\);
in fact \(z_A(\psi)=\mathcal P_A d_A\psi\). The identity
\[
 d_A\psi=d_A\theta_A(\psi)
       +S_AH_A d_A w_A(\psi)+z_A(\psi)
\]
shows that the full image of all weak infinitesimal orbit
parameters \(H^1(E)\times L^2(TS^4)\) is
\(\mathcal Y_A\oplus z_A(N)\). This is a direct sum with a
finite-dimensional subspace of \(\mathcal X\). Its equality
with \(\mathcal Y_A\) holds exactly when \(z_A(N)=0\).
Equation (4) gives
\(\|\theta_A(\psi)\|_{H^1}\le C\epsilon\|\psi\|_{H^1}\).
The reference identity \(\Pi_0d_0\psi=0\) and (2) then imply
\(\|z_A(\psi)\|_2\le C\epsilon\|\psi\|_{H^1}\).
The exact unrestricted zero-direction pairs are
\[
 \big(w_A(\psi),-H_A d_A w_A(\psi)\big),
        \qquad \psi\in N,\quad z_A(\psi)=0.
\]
Indeed a zero direction gives \(K_A\phi=0\), and decomposing
\(\phi\) into \(V+N\) yields (10). Its horizontal parameter is
forced by \(H_A\). The converse follows from the two terms
\(S_AH_A d_A w_A+\Pi_A d_A w_A\).

In particular a previously stabilizing pair
\((\psi,-H_0d_0\psi)\) produces at \(A\) the direction
\([a,\psi]-(S_A-S_0)H_0d_0\psi\). This can be nonzero.
To realize this, lift a nonzero rotational Killing field of
the round sphere naturally to chiral frames. The lift
preserves \(A_0\) because the base isometries preserve the
Levi-Civita connection and the oriented chiral splitting.
Write its \(A_0\)-vertical component as \(\psi\) and base
component as \(u_0\). The infinitesimal formula below gives
\(d_0\psi+S_0u_0=0\), hence \(\psi\in N\) and \(\psi\) is
nonzero since \(S_0\) is injective and \(u_0\ne0\).
Choose a point \(p\) with \(\psi(p)\ne0\). In a local
reference gauge with \(A_0(p)=0\), take a cutoff one-form
\(a=t\chi b\,dx^1\), with \(\chi=1\) near \(p\) and \(b\)
a constant internal component with \([b,\psi(p)]\ne0\).
Then \(\beta(p)=0\) and the displayed old-pair direction
at \(p\) is \(t[b,\psi(p)]dx^1\). The perturbation is in
the tube for sufficiently small \(t\).
Whether a direction contributes to the residual is
governed by \(z_A\) in (10).

## Higher Sobolev bounds and smoothness

Use \(\partial_j\mapsto i\xi_j\) and \(w_\xi e=\xi\otimes e\).
The positive second-order principal symbol is
\(w_\xi^*\Pi_A w_\xi\). For real \(\xi\) and real or
complex internal \(e\),
\[
 \operatorname{Re}(w_\xi^*\Pi_A w_\xi e,e)
 \ge
 \big(\tfrac23-\|\Pi_A-\Pi_0\|_\infty\big)|\xi|^2|e|^2 .
                                                                            \tag{11}
\]
Shrink the fixed tube so that the parenthesis is at least
\(1/3\). This is a rank-one estimate on the symmetric part.
In a local fixed frame (3) is a divergence form with
leading coefficients from \(\Pi_A\), the reference metric
and the volume density. The lower form coefficients
involve the fixed connection or \([a,\cdot]\). All these
coefficients are smooth algebraic functions of the fixed
data, \(a,\beta\) and \(C_A^{-1}\). From
\(D(C_A^{-1})=-C_A^{-1}(DC_A)C_A^{-1}\) and (1),
the form coefficient bounds through order \(m\) are
controlled by the fixed reference, the tube and
\(\|a\|_{W^{m,\infty}}+\|\beta\|_{W^{m,\infty}}\).

For use with \(L^2\) forcing, freeze the leading coefficient
on a small chart. The real-part bound (11) and Plancherel
control the derivative norm for the frozen principal form.
The coefficient variation can be absorbed by shrinking
the chart; the radius may depend on the first coefficient
derivatives. For weak \(\phi\in H^1\) with \(K_A\phi=f\in L^2\),
test by \(-\delta_{-h}(\chi^2\delta_h\phi)\) for interior
cutoff \(\chi\). The quotient integration by parts has a
leading form with translated coefficient and \(\chi\delta_h\phi\).
The coefficient quotient multiplies \(\partial\phi\) and is
bounded in terms of the coefficient's first derivatives and
\(\|\phi\|_{H^1}\). Each cutoff error is bounded by
\(C\|\delta_h\phi\|_2(\|\chi\delta_h\phi\|_{H^1}+
\|\delta_h\phi\|_2)\); this also controls the first-order cross
terms when the leading coefficient is nonsymmetric.
The forcing is bounded using
\(\|\delta_{-h}(\chi^2\delta_h\phi)\|_2
\le C(\|\chi\delta_h\phi\|_{H^1}+\|\phi\|_{H^1})\).
Lower form terms use the same estimate for a quotient on
the undifferentiated test, or the first coefficient
derivative bound when the quotient is moved onto the
coefficient times \(\phi\).
The translated leading coefficients obey the same localized
bound. Young's inequality and \(\|\delta_h\phi\|_2\le
C\|\phi\|_{H^1}\) give uniform \(H^1\) bounds on
\(\chi\delta_h\phi\) and hence interior \(H^2\).

For integer \(s\ge1\), commute \(s\) coordinate derivatives
in the expanded differential equation and apply the interior
\(H^2\) estimate to the commuted equation. Commutators have
at most \(s+1\) derivatives of \(\phi\), controlled in the
induction, and at most \(s+1\) derivatives of the form
coefficients, counting the derivative in divergence form.
Nested subcharts and a finite cover give
\[
 \|\phi\|_{H^{s+2}}\le C_{s,A}
       (\|K_A\phi\|_{H^s}+\|\phi\|_{H^1}),\qquad s\in\mathbb Z_{\ge0}.
                                                                            \tag{12}
\]
The constants here can depend on coefficient bounds through
order \(s+1\). This quotient and commutation argument uses
the same local regularity mechanism as E71 with (11) in
place of its exact symmetric symbol. [E71 (3)–(4)][e71].
[E73, domain regularity][e73].

For \(r\in H^m\) and integer \(m\ge1\), multiplication by
\(\Pi_A\) and application of \(d_0^*\) give
\(\|d_0^*\Pi_A r\|_{H^{m-1}}\le C_{m,A}\|r\|_{H^m}\).
Combining (5), (6) and (12) gives
\[
 \|\phi\|_{H^{m+1}}+\|u\|_{H^m}+\|r_{\rm sl}\|_{H^m}
       \le C_{m,A}\|r\|_{H^m}.                                         \tag{13}
\]
Sufficient coefficient control for these constants is the
fixed reference and tube together with
\(\|a\|_{W^{m,\infty}}+\|\beta\|_{W^{m,\infty}}\).
Equation (7) supplies the separate value-only estimate
at \(m=0\). Smooth \(A,r\) give smooth \(\phi,u,r_{\rm sl}\)
by the estimates at every nonnegative order.

The bounds also extend to negative integer \(m=-k\) by
duality, \(k\ge1\). Let \(\Phi_A r=B_A d_0^*\Pi_A r\). For
smooth \(g\), solve for \(\eta\in V\) by the transpose of
the restricted isomorphism:
\(\langle K_A\zeta,\eta\rangle=(g,\zeta)_{L^2}\) for \(\zeta\in V\).
Then \(\|\eta\|_{H^1}\le C\|g\|_2\), and
\(K_A^{\mathrm t}\eta-g\) belongs to \(N\) as a smooth
finite-rank forcing, because it annihilates \(V\).
Its coefficients in any fixed \(L^2\)-orthonormal basis
\(\psi_j\) of \(N\) are
\(\langle K_A\psi_j,\eta\rangle-(g,\psi_j)_{L^2}\)
and are bounded by \(C\|g\|_2\).
The weak transpose \(K_A^{\mathrm t}=d_A^*\Pi_A^* d_0\)
has the same real-part symbol bound and the same derivative
count on coefficients. Applying (12) to it with \(s=k-1\)
gives \(\|\eta\|_{H^{k+1}}\le C_{k,A}\|g\|_{H^{k-1}}\).
Since \(\Phi_A^{\mathrm t}g=\Pi_A^*d_0\eta\), one has
\(\Phi_A^{\mathrm t}:H^{k-1}\to H^k\).
Consequently \(\Phi_A:H^{-k}\to H^{1-k}\), and (6) gives
the corresponding \(H^{-k}\) bounds for \(u,r_{\rm sl}\).
Positive derivatives through order \(k\) of the coefficients
suffice here as well.

## Actual horizontal lift and scope

For smooth parameters, use the vertical equivariant
generator with \(A\)-component \(\phi\) and the actual
\(A\)-horizontal lift of \(u\). Denote their sum by \(Y\).
It satisfies \(A(Y)=\phi\) and its base projection is \(u\).
If \(\Psi_t\) is its smooth flow, Cartan's formula gives
\[
 \left.\frac{d}{dt}\Psi_t^* A\right|_0
    = \iota_Y F_A+d_A(A(Y))=S_Au+d_A\phi .
\]
The first equality follows by expanding
\(F_A=dA+\tfrac12[A\wedge A]\) and canceling the two bracket
terms. The inverse-pullback left action
\(A\mapsto(\Psi_t^{-1})^* A\) reverses this sign.
The estimates use fixed reference pairings while the
horizontal lift uses \(A\).
[E48, infinitesimal action][e48]. [E73, pullback convention][e73].

Equations (5)–(9) give an infinitesimal inverse and fixed-slice
projection in a value tube. Finite orbit evolution and
nonlinear slice existence remain outside this result.

[req]: ../research-progress/handoffs/SP4-CME-E79_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E79_RETURN_v1.md
[b47]: ../brainstorm/notes/B47_VALUE_SMALL_ORBIT_INVERSE_20261122.md
[assess]: ../reviews/E71_E73_LINEAR_SLICE_ASSESSMENT_20261122.md
[e71]: 71_LINEAR_ROUND_SLICE_20261122.md
[e73]: ../reviews/E73_LINEAR_SLICE_AUDIT_20261122.md
[e48]: 48_FIXED_STABILITY_GAUGE_20261122.md
