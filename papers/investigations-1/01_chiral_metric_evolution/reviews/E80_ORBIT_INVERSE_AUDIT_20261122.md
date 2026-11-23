# SP4-CME-E80 — Independent audit of the value-small actual orbit inverse

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and
selected lead settings were unavailable. I authored the frozen E71
reference input and did not author E79 or E73. All three digests
matched the [request][req] before use. This review independently
checks E79's varying-connection calculation with the fixed reference
results from E71 and E73. No new primary source was inspected.
[B47][b47] · [E79][e79] · [Return][ret].

**Disposition.** E79 passes in its stated smooth, fixed native round
value tube. The weak inverse and restricted complement have uniform
value-only bounds. The excluded finite-dimensional effect and
stabilizer formulas are correct. The positive and negative Sobolev
estimates use coefficient derivatives only through their stated
order. In particular the transpose weak form has the same required
coefficient count as the original form. No correction to the stated
estimates was found.

## Fiber elimination and weak annihilator

Use the native round \(S^4,g_0,A_0\) and fixed internal pairing.
With \(\beta=F_A-F_0\), curvature contraction gives
\(S_A-S_0:u\mapsto\iota_u\beta\), so
\(C_A=S_0^*S_A\) differs from \(S_0^*S_0=\tfrac32I\)
by \(O(\|\beta\|_\infty)\). A small value tube bounds the inverse
and its difference from \(\tfrac23 I\) by the Neumann formula.
For \(H_A=C_A^{-1}S_0^*\), \(\Pi_A=I-S_AH_A\) one has
\[
 H_AS_A=I,\qquad S_0^*\Pi_A=0,\qquad
 \Pi_A|_{\ker S_0^*}=I,\qquad \Pi_A S_A=0.
\]
It follows that the range is \(\ker S_0^*\), the kernel is
\(\operatorname{im}S_A\), and \(\Pi_A^2=\Pi_A\).
This also gives the two claimed value-only differences from
the reference \(\Pi_0,H_0\) in E79 (2). At \(A_0\) this recovers
the reference orthogonal projection. [E79 (1)–(2)][e79] ·
[E71 (1)–(2)][e71] · [E73, native splitting][e73].

Let \(N=\ker(d_0^*\Pi_0d_0)=\ker(\Pi_0d_0)\) on \(H^1(E)\).
Put \(V=H^1\cap N^\perp\) with \(L^2\) orthogonality and
\(Z=N^\circ\subset H^{-1}\), the annihilator.
For \(\psi\in N\), \(d_0\psi\in\operatorname{im}S_0\).
The exact weak form is
\[
 \langle K_A\phi,\eta\rangle
   =(\Pi_A(d_0\phi+[a,\phi]),d_0\eta)_{L^2}.
\]
The right factor \(d_0\psi\) is orthogonal to the range of
\(\Pi_A\). Hence both \(K_A\phi\) and \(d_0^*\Pi_A r\) lie in
\(Z\), by testing against each \(\psi\in N\).
Here the vanishing is in the test slot. An input \(\psi\in N\)
can have \(K_A\psi\ne0\).

In the weak norm, the difference of forms is the sum of
\(((\Pi_A-\Pi_0)d_0\phi,d_0\eta)\) and
\((\Pi_A[a,\phi],d_0\eta)\).
Cauchy–Schwarz and the bounded pointwise bracket give the
\(C(\|a\|_\infty+\|\beta\|_\infty)\|\phi\|_{H^1}\|\eta\|_{H^1}\)
estimate. No differentiation of either coefficient occurs.
The E71 reference isomorphism is \(K_0:V\to Z\). Thus
\(K_A|_V=K_0(I+K_0^{-1}(K_A-K_0)|_V)\) has a two-sided
inverse \(B_A:Z\to V\) as soon as the perturbation norm is
at most \(1/2\). The fixed complement is closed and all these
norms are taken on their stated domain and codomain. This
proves E79 (5), with the factor \(2\) from the Neumann bound.
[E79 (3)–(5)][e79] · [E71 (5)–(6)][e71] ·
[E73, weak inverse][e73].

## Projection, finite residual and actual stabilizers

For \(r\in L^2\), \(f=d_0^*\Pi_A r\) satisfies
\(\|f\|_{H^{-1}}\le C\|r\|_2\), since its weak pairing uses
\((\Pi_A r,d_0\eta)\). With \(\phi=B_A f\), put
\(u=H_A(r-d_A\phi)\) and \(r_{\rm sl}=\Pi_A(r-d_A\phi)\).
Then \(r=d_A\phi+S_Au+r_{\rm sl}\).
The first slice condition follows from \(S_0^*\Pi_A=0\);
the second is \(f-K_A\phi=0\) as an \(H^{-1}\) identity.
The \(H^1\) norm of \(\phi\) and \(L^2\) norms of \(u,r_{\rm sl}\)
are bounded by \(C\|r\|_2\), since \(d_A\) is bounded
\(H^1\to L^2\) with a value-only constant.

Conversely, apply \(d_0^*\Pi_A\) to any decomposition with
\(\phi\in V\) and residual in the fixed slice \(\mathcal X\).
It determines \(\phi\) by the restricted inverse, and \(H_A\)
determines \(u\). Thus the residual map
\(\mathcal P_A=\Pi_A-\Pi_A d_A B_A d_0^*\Pi_A\)
fixes its range \(\mathcal X\) and has kernel exactly
\(\mathcal Y_A=d_A(V)+S_A(L^2(TS^4))\).
In particular it is an idempotent bounded projection and the
restricted orbit sum is closed. Its orthogonality at \(A_0\)
is the reference E71 statement. The varying construction uses
the stated direct complement without an orthogonality assertion.
[E79 (6)–(9)][e79] · [E71 (7)–(11)][e71].

For \(\psi\in N\), E79's
\(\theta=B_AK_A\psi\) lies in \(V\),
\(w=\psi-\theta\) satisfies \(K_Aw=0\),
and \(z_A(\psi)=\Pi_A d_Aw=\mathcal P_A d_A\psi\)
lies in \(\mathcal X\). The exact decomposition of its direction is
\[
 d_A\psi=d_A\theta+S_AH_A d_Aw+z_A(\psi).
\]
Every \(H^1\) parameter splits into \(V+N\), so the full image is
\(\mathcal Y_A\oplus z_A(N)\), with the sum direct by projection
onto \(\mathcal X\). It is closed as a bounded projection preimage
of the closed finite-dimensional space \(z_A(N)\). It equals
\(\mathcal Y_A\) precisely when \(z_A(N)=0\).
Since \(K_0\psi=0\), (4) and (5) bound
\(\|\theta\|_{H^1}\le C\epsilon\|\psi\|_{H^1}\).
The identity \(\Pi_0 d_0\psi=0\) gives
\(\|\Pi_A d_A\psi\|_2\le C\epsilon\|\psi\|_{H^1}\)
by the same two coefficient differences. Subtracting
\(\Pi_A d_A\theta\) proves the asserted bound on \(z_A(\psi)\).

If \(d_A\phi+S_Au=0\), applying \(d_0^*\Pi_A\) gives
\(K_A\phi=0\). Decompose \(\phi=\psi+\phi_V\).
The inverse gives \(\phi_V=-\theta_A(\psi)\).
Applying \(\Pi_A,H_A\) to the zero direction yields,
respectively, \(z_A(\psi)=0\) and \(u=-H_A d_Aw_A(\psi)\).
Those conditions also suffice for a zero direction.
The weak zero-direction pairs are smooth for smooth \(A\):
\(K_Aw=0\) and the elliptic estimate below bootstrap \(w\),
and the formula then gives \(u\). Their invariant vector
fields are the infinitesimal stabilizers because their flows
have zero Lie derivative of \(A\). This identifies the
stabilizer using \(\ker z_A\) and does not require its dimension.
[E79 (10) and excluded parameters][e79].

The old-pair example also checks. A nonzero rotational base
Killing field \(u_0\) lifts to the oriented chiral frame bundle
by the action of its isometries, preserving \(A_0\). Its vertical
part \(\psi\) obeys \(d_0\psi+S_0u_0=0\). It belongs to \(N\)
and is not identically zero because \(S_0\) is injective.
Choose \(p\) with \(\psi(p)\ne0\) and a gauge with \(A_0(p)=0\).
For \(a=t\chi b\,dx^1\), with \(\chi=1\) near \(p\) and constant
internal \(b\) chosen with \([b,\psi(p)]\ne0\), we have
\(d_0a(p)=0\) and \([a\wedge a]=0\). Thus \(\beta(p)=0\)
while the old parameter pair has direction
\([a,\psi]-(S_A-S_0)H_0d_0\psi\) with value
\(t[b,\psi(p)]dx^1\) at \(p\). The curvature and connection
values are small for small \(t\), since the cutoff and gauge are
fixed. Here the old pair means fixed parameter components with
their horizontal lift taken at the current \(A\). Its nonzero
direction alone gives no conclusion that its projected residual
\(z_A(\psi)\) is nonzero. [E79, old-pair example][e79].

## Local regularity and the transpose coefficient count

At the reference the symbol on \(E\) is
\(w_\xi^*\Pi_0w_\xi=\tfrac23|\xi|^2I\), with
\(w_\xi e=\xi\otimes e\).
Therefore the real part of \(w_\xi^*\Pi_Aw_\xi\)
is bounded below by
\((\tfrac23-\|\Pi_A-\Pi_0\|_\infty)|\xi|^2I\).
It is at least \(\tfrac13|\xi|^2I\) on the stated smaller
tube, including after complexification. The same lower bound
holds for the adjoint symbol. A local coordinate metric or
density comparison changes only fixed constants.
[E79 (11)][e79] · [E71 (2)][e71] · [E73, exact symbol][e73].

To count coefficient derivatives, use an internal orthonormal
frame and incorporate the fixed volume density \(\mu(x)\)
in the form. Put \(d_A=\partial+\gamma_A\) on sections,
where \(\gamma_A=\gamma_0+\operatorname{ad}(a)\). Let
\(\mathsf A^{ij}=\mu g_0^{i\ell}(\Pi_A)_\ell{}^j\);
use \(*\) on the finite internal matrix blocks. In flat
coordinate integration the weak form is
\[
 \int\Big[
   (\mathsf A^{ij}\partial_j\phi,\partial_i\eta)
  +(\mathsf B^i\phi,\partial_i\eta)
  +(\mathsf C^j\partial_j\phi,\eta)
  +(\mathsf D\phi,\eta)\Big]\,dx,                                   \tag{1}
\]
where
\[
 \mathsf B^i=\mathsf A^{ij}\gamma_{A,j},\qquad
 \mathsf C^j=\gamma_{0,i}^*\mathsf A^{ij},\qquad
 \mathsf D=\gamma_{0,i}^*\mathsf A^{ij}\gamma_{A,j}.
\]
These are the raw form coefficients. Their derivatives through
order \(m\) need \(\|a\|_{W^{m,\infty}}+\|\beta\|_{W^{m,\infty}}\),
the fixed coefficient derivatives, and inverse bounds on \(C_A\).
This follows by differentiating \(C_A C_A^{-1}=I\) and the
pointwise formula for \(\Pi_A\). No derivatives of the input
geometry enter the raw coefficients beyond those in \(a,\beta\).

The coordinate differential expressions for \(\mu K_A\) and
\(\mu K_A^{\mathrm t}\), using the same fixed density, are
\[
 \begin{split}
 \mu K_A\phi
    &=-\partial_i(\mathsf A^{ij}\partial_j\phi+\mathsf B^i\phi)
                +\mathsf C^j\partial_j\phi+\mathsf D\phi,\\
 \mu K_A^{\mathrm t}\eta
    &=-\partial_i(\mathsf A^{ji*}\partial_j\eta+\mathsf C^{i*}\eta)
                +\mathsf B^{j*}\partial_j\eta+\mathsf D^*\eta .
 \end{split}                                                       \tag{2}
\]
The second line follows by exchanging test and field in (1)
before integration by parts. It agrees with
\(K_A^{\mathrm t}=d_A^*\Pi_A^*d_0\).
After expansion, the zero-order coefficient is
\(\mathsf D-\partial_i\mathsf B^i\) in the first line,
and \(\mathsf D^*-\partial_i\mathsf C^{i*}\) in the second.
Each uses a single derivative on a lower form block.
There is no term using two derivatives of
\(\mathsf A^{ij*}\). Transposing the expanded second-order
term alone would produce such a zero-order term, which is
canceled by transposing the derivative-of-leading-coefficient
part of the expanded first-order term. Formula (2) implements
the cancellation directly.

The weak \(H^2\) step works for either line of (2).
For a small chart the frozen leading real-part symbol gives
the local principal form lower bound by Plancherel.
The variation of the leading array is absorbed by selecting
the chart radius using its first derivative bound.
For a weak \(H^1\) solution with \(L^2\) forcing, use
\(-\delta_{-h}(\chi^2\delta_h\phi)\) as test.
Difference-quotient integration by parts moves a quotient
onto the leading product, producing the translated leading
coefficient and a quotient of that coefficient times
\(\partial\phi\). The latter uses just its first derivatives.
Writing \(v=\delta_h\phi\), the difference between the translated
principal form with inputs \(v,\chi^2 v\) and the one on
\(\chi v,\chi v\) consists of two cross terms and a square
term supported at cutoff derivatives. Symmetry is unnecessary:
each cross term is bounded by
\(C\|v\|_2(\|\chi v\|_{H^1}+\|v\|_2)\).
The divergence lower block uses a quotient of its
coefficient times \(\phi\), controlled by the
coefficient's first derivatives and \(\|\phi\|_{H^1}\).
For the lower blocks without a test derivative, and for the
\(L^2\) forcing, the original test has \(L^2\) norm controlled
by \(C(\|\chi v\|_{H^1}+\|\phi\|_{H^1})\).
Uniform local coercivity for the translated coefficients and
Young's inequality give the interior \(H^2\) estimate by passing
to the limit of the quotients. This extends the E71/E73 method
to nonsymmetric leading form blocks.

For forcing in \(H^s\), \(s\ge1\), expand (2) and commute
\(s\) derivatives. Leading commutators have at most \(s+1\)
derivatives of the field. The expanded first- and zero-order
coefficients have at most one derivative of raw form
coefficients, so differentiating them through order \(s\)
uses at most \(s+1\) raw derivatives. The commuted force is in
\(L^2\) with the lower field norms controlled inductively.
Apply the interior \(H^2\) step to the commuted fields on
nested subcharts, then use a finite cover. This gives for
either operator \(L=K_A,K_A^{\mathrm t}\)
\[
 \|v\|_{H^{s+2}}
   \le C_{s,A}\big(\|Lv\|_{H^s}+\|v\|_{H^1}\big),
       \qquad s\in\mathbb Z_{\ge0}.                                 \tag{3}
\]
The coefficient order is \(s+1\), including \(s=0\).
The comparison from \(\mu L\) to \(L\) differentiates only
the fixed smooth density. The initial chart scale and the
higher constants can depend on coefficient derivatives.
[E79 (11)–(12)][e79] · [E71 (3)–(4)][e71] ·
[E73, domain regularity][e73].

At positive integer \(m\), \(d_0^*\Pi_A r\) is in \(H^{m-1}\)
with norm bounded by \(C_{m,A}\|r\|_{H^m}\), using coefficient
derivatives through \(m\). Apply (3) with \(s=m-1\) and bound
the \(H^1\) remainder by (5) of E79. Multiplication by \(H_A\)
and \(\Pi_A\) and the derivative \(d_A\) then give the
\(H^m\) estimates for \(u,r_{\rm sl}\) at the same order.
For \(m=0\) the preceding weak argument uses no coefficient
derivatives. Smoothness follows by all nonnegative orders.
[E79 (7), (12)–(13)][e79].

## Negative integer orders

Set \(\Phi_A r=B_A d_0^*\Pi_A r\) initially for smooth \(r\).
Identify \(Z\) with \(V^*\) by restriction, using the bounded
fixed \(H^1\) splitting into \(V+N\). Its transpose gives, for
smooth \(g\), the unique \(\eta\in V\) such that
\(\langle K_A\zeta,\eta\rangle=(g,\zeta)_{L^2}\) for
\(\zeta\in V\), with \(\|\eta\|_{H^1}\le C\|g\|_2\).
More explicitly this is the transpose of \(K_A|_V:V\to Z\)
under the fixed pairing between \(Z\) and \(V\). It solves the
transposed equation on the restricted test space.

The functional \(K_A^{\mathrm t}\eta-g\) annihilates \(V\);
for an \(L^2\)-orthonormal smooth basis \(\psi_\ell\) of \(N\)
it is the smooth forcing
\[
 \sum_\ell
    \big(\langle K_A\psi_\ell,\eta\rangle-(g,\psi_\ell)_{L^2}\big)
                  \psi_\ell .
\]
This follows by decomposing any \(H^1\) test into its \(V\)
component and its \(N\) coordinates. Its coefficients are
bounded by \(C\|g\|_2\) using the weak form bound with the fixed
basis. Its \(H^{k-1}\) norm is thus bounded by \(C_k\|g\|_2\).
In particular differentiating the finite-rank forcing does
not differentiate \(K_A\psi_\ell\) as a spatial function.
It only differentiates the fixed basis. For \(k\ge1\) the
transpose estimate (3) with \(s=k-1\) gives
\(\|\eta\|_{H^{k+1}}\le C_{k,A}\|g\|_{H^{k-1}}\).

The transpose of the parameter-solving map is exactly
\(\Phi_A^{\mathrm t}g=\Pi_A^*d_0\eta\). Indeed testing the
transpose equation with \(\zeta=\Phi_A r\in V\) gives
\[
 (g,\Phi_A r)_{L^2}
  =\langle d_0^*\Pi_A r,\eta\rangle
  =(r,\Pi_A^*d_0\eta)_{L^2}.
\]
Here \(\Pi_A^*d_0\eta\) is in \(H^k\) with coefficient
derivatives through \(k\). Thus by duality and smooth density
\(\Phi_A:H^{-k}\to H^{1-k}\). Differentiating \(\phi\)
by \(d_0\) and multiplying by the bracket coefficient in
\(d_A\) both map \(H^{1-k}\) to \(H^{-k}\), with the bracket
and the matrices \(H_A,\Pi_A\) estimated by duality from
the positive multiplication bounds. This gives
\(u,r_{\rm sl}\in H^{-k}\) with the stated derivatives
through \(k\) of the coefficient data. The extended
identities agree with the \(L^2\) construction by density.
The resulting constants are coefficient-dependent at these
orders. [E79, higher Sobolev bounds][e79].

## Actual horizontal action and exact scope

For a smooth equivariant generator \(Y\) projecting to
\(u\) and satisfying \(A(Y)=\phi\), Cartan's formula yields
\[
 \mathcal L_Y A=\iota_Y dA+d(A(Y))
            =\iota_YF_A+d_A\phi .
\]
Indeed \(\iota_Y[A\wedge A]/2=[\phi,A]\), whose subtraction
from \(\iota_YF_A\) gives the bracket in \(d_A\phi\).
Because \(F_A\) is horizontal, \(\iota_YF_A=S_Au\) in base
notation. This is the active pullback derivative.
Differentiating the inverse pullback gives its negative.
The generator in E79 uses the actual \(A\)-horizontal component.
This differentiates a smooth path of automorphisms at one
smooth connection, with fixed reference metrics used for
the pairings. It is an infinitesimal result in the stated
value tube. Finite nonlinear slice existence remains open.
[E79, horizontal lift and scope][e79] · [E73, action convention][e73].

[req]: ../research-progress/handoffs/SP4-CME-E80_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E80_RETURN_v1.md
[b47]: ../brainstorm/notes/B47_VALUE_SMALL_ORBIT_INVERSE_20261122.md
[e79]: ../notes/79_VALUE_SMALL_ORBIT_INVERSE_20261122.md
[e71]: ../notes/71_LINEAR_ROUND_SLICE_20261122.md
[e73]: E73_LINEAR_SLICE_AUDIT_20261122.md
