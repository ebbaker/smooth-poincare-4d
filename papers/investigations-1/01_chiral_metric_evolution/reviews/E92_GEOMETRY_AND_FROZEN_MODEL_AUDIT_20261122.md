# SP4-CME-E92 — Independent geometry and frozen-model audit

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and
selected lead settings were unavailable. I authored inherited E14
and previously audited E84 and E88 in E86 and E89. Earlier related
derivations include E63, E66, E74 and E76. I did not author E90,
E91, E02C, E84, E53, E79 or E88. This audit checks E90 and E91
against their [frozen requests][e90req] and [E91 request][e91req],
as specified by the [E92 request][req]. No new primary source was
inspected or imported. [Return][ret].

The two frozen notes and their inherited note and review hashes
matched. For E90 the live TeX had advanced from the historical digest
`02ae44f97f59670272c326d5d3675482228b9799e89beafc6258e5454f709901`
to `abe7b70355bec456ece001e8a38ac3bbb1d0e94b79abaf6ed8d5aaa2d0f1d8ba`.
The lead identified the intervening E88/E89 proposition insertion.
I verified that its exact fragment, with digest
`01c39f3de911858e7be42a9f04124f1063ec073036c23ba8c1c07fd823d99e65`,
occurs once in the live bytes. Removing it in memory gives exactly
the historical digest from E90's request. This recovers the
relevant historical TeX passages for comparison without changing
the manuscript or writing a snapshot. [Manuscript path][ms] ·
[E90 request][e90req].

## E90 check — Endpoint geometry and variational comparisons

**Pass.** The argument keeps the assessed smooth invariant orbit
neighborhood \(\mathcal W\) and the inclusive small-strain threshold
\(\ell\le\ell_*\). The frozen corollary and the matching E84–E86
assessment give the global original flow, its smooth round-pullback
limit on the fixed round bundle, and \(J(\infty)\le
C_{\rm budget}\ell\). Here \(\ell\) is the live native
\(L^{4,1}\) strain. These premises supply the endpoints of the
comparison. [B52][b52] · [E90][e90] ·
[E84–E86 assessment][e8486] ·
[Frozen manuscript, cor:intrinsic-orbit-budget][ms].

### Forms, limiting endomorphism, and exact volume

E14 (4) gives the relative tensor bounds with
\(C_*=4512\sqrt2\) and
\(\mathcal G=|\nabla^A T|_{\widehat g_A}+|T|_{\widehat g_A}^2\).
For a fixed base vector \(X\ne0\), the logarithmic derivative
of \(\widehat g_A(X,X)\) uses
\(\widehat g_A^{-1}\widehat g_{A,t}\) on a unit vector
for the current metric, so its absolute value is at most
\(C_*\mathcal G\).
For \(v\ne0\) in a fixed internal fiber, set \(S=Q^{1/2}\).
The ratio from differentiating \(\log\langle Qv,v\rangle\)
is the Rayleigh quotient of \(S^{-1}Q_tS^{-1}\) on \(Sv\).
This compares full quadratic forms under integration.
Taking \(\sup_x\mathcal G\) before integrating gives
\(e^{\pm C_*J(t)}\) against each initial form. With smooth
convergence in the fixed identification, both inequalities
can be inverted in their orientation as comparisons against
the limiting form. With \(D=C_*C_{\rm budget}\ell\),
the endpoint bounds are exactly
\[
 e^{-D}h\le g\le e^Dh,\qquad
 e^{-D}I\le Q(A_{\rm in})\le e^DI .
\]
Curvature pullback conjugates \(Q\) by the induced
internal isometry \(U_x\), so \(Q(A_\infty)=U_x^{-1}IU_x=I\).
This is independent of the internal isometry appearing
in a given representation of the round pullback.
Multiplying the base metric forms by the same constant
gives the same bounds in the native scale.
[E14 (4)–(5)][e14] · [E90 (1)][e90] · [E84 (11)][e84].

The E02C identity is pointwise on the original flow,
\(\partial_t\mu_A=0\), with
\(\mu_A=2K^2dV_{\widehat g_A}\).
It follows there from the vanishing three-form
\(\sum_i v_i\wedge F_i=0\) and the Bianchi variation formula
\(\partial_t\mu_A=\tfrac23 d\sum_i v_i\wedge F_i\).
It applies to the unadjusted base and bundle identification
used in E90. With smooth convergence it gives
\(dV_g=dV_h\) as four-forms on that same base.
Since the endpoint is a fixed smooth pullback, the common
volume is \(f_\infty^*\) of the reference round volume at
the respective scale. This is stronger than just equality
of total volumes. [E02C, volume and gauge dependence][e02c] ·
[E90 (2)][e90] · [Frozen manuscript, flow:pointwise-volume][ms].

### Scale, distance and spectral comparison

For \(c=2K\), \(g^{\rm F}=c\widehat g\),
\(h^{\rm F}=c\widehat h\), \(\tau=ct\).
The internal normalization leaves \(Q\), \(T\) and
their covariant tensor derivatives unchanged. The norm
square of the one-slot \(T\) and the norm of the two-slot
\(\nabla^A T\) each acquire \(c^{-1}\), which cancels
\(d\tau=c\,dt\). In dimension four the Lorentz scaling
has modulus factor \(c^{-1/2}\) and measure factor
\(c^2\). In the layer integral the latter contributes
\(c^{1/2}\) and cancels the former.
The normalized limiting round curvature \(K\) becomes
\(K/c=1/2\) in the native scale. Equality of volumes is
preserved with the common \(c^2\) volume factor.
[E84, normalization][e84] · [E90, hypotheses and
normalization][e90].

Taking square roots of the metric form comparison
gives the length factors \(e^{\pm D/2}\) for every
piecewise smooth curve. Infimizing over curves with
fixed endpoints gives the same distance factors, and
the diameter bounds follow by taking the supremum.
The round diameter is \(\pi/\sqrt K\) in the normalized
metric and \(\pi\sqrt2\) in the native metric, with
distances in the latter multiplied by \(\sqrt c\).
[E90 (3)][e90].

For eigenvalues, the inverse metric inequalities give
\[
 e^{-D}\mathcal E_h(u)\le \mathcal E_g(u)
       \le e^D\mathcal E_h(u),\qquad
 \mathcal E_m(u)=\int|du|_m^2\,d\nu,\quad
 d\nu=dV_g=dV_h .
\]
The two Dirichlet forms have the same \(H^1\) domain
and the same \(L^2(d\nu)\) denominator. For each form,
adding the \(L^2\) term gives a coercive realization
whose inverse is compact on \(L^2\) by the compact
inclusion of \(H^1\). The finite-dimensional min–max
formula follows by testing the first \(j+1\)
eigenfunctions for the upper bound and by selecting a
vector orthogonal to the first \(j\) eigenfunctions
in any test space of dimension \(j+1\) for the lower
bound. Thus comparing the quotients on every test
space bounds each indexed scalar eigenvalue, with
multiplicity, by \(e^{\pm D}\lambda_j(h)\). The case
\(j=0\) is the common zero eigenvalue.
Under \(g\mapsto cg\), the energy acquires \(c\)
and the squared \(L^2\) denominator \(c^2\), so the
eigenvalues acquire \(c^{-1}\). The common volume
prevents any further comparison factor.
[E90 (4)–(5)][e90].

### Sobolev coefficient and zero strain

All \(L^p\) norms of functions agree for \(g,h\)
at a given scale because their volume forms coincide.
A supplied round \(\|u\|_4^2\le
C_\nabla\mathcal E_h(u)+C_2\|u\|_2^2\) therefore
passes with coefficients \(e^D C_\nabla,C_2\).
A single larger common coefficient is valid when
the round input uses a single common coefficient.
The \(L^4\) norm squared and the gradient energy
both scale by \(c\). The squared \(L^2\) norm
scales by \(c^2\). Thus the native \(C_2\) is the
normalized \(C_2\) divided by \(c\), and
\(C_\nabla\) is unchanged. This also checks the
common-coefficient form with the \(L^2\) term
weighted by the appropriately scaled round curvature.
No exact value of a round Sobolev constant is used.
The test on smooth functions extends by the common
\(H^1\) closure, with the inequality bounding the
\(L^4\) norm of differences. [E90 (6)][e90].

At \(\ell=0\) the budget and the comparison exponent
vanish. The same finite-time inequalities give
\(Q(t)=I\) throughout. The original gradient vanishes
in its \(q=Q-I\) expression, or by self-duality and
Bianchi in the native formula at \(Q=I\).
Hence the flow is stationary and its initial connection
equals its round-pullback limit. For general positive
strain the conclusion is the stated form, volume and
variational comparison on \(\mathcal W\) at the
given threshold. There is no additional quantitative
curvature, injectivity radius, or higher-coordinate
derivative estimate from this argument.
[E90, zero strain and scope][e90] ·
[Frozen manuscript, flow:gradient-equation][ms].

## E91 check — Frozen periodic shear and horizontal growth

**Pass in the specified frozen model.** The signs and
normalizations give an exact mean-zero split. The critical pair
decays like \(n^{-1/4}\) while the chosen horizontal output has
\(C^1\) growth like \(n^{1/4}\), for one fixed \(r_0\).
[B53][b53] · [E91][e91].

### Exact triple, shear and split

For the ordered flat oriented coframe in E91, the Hodge star
sends \(dx^{12},dx^{13},dx^{14}\) to
\(dx^{34},-dx^{24},dx^{23}\), respectively.
Thus the three displayed sums with coefficient \(1/\sqrt2\)
are unit self-dual forms. Their wedges are
\(\delta_{ij}dx^{1234}\), since for self-dual forms the
wedge pairing relative to the volume equals their ordinary
two-form inner product. Contracting with \(u_0=e_1\) and
\(v=e_2\) gives
\[
 r_0=\tfrac1{\sqrt2}(dx^2,dx^3,dx^4),\qquad
 S_0v=\tfrac1{\sqrt2}(-dx^1,-dx^4,dx^3).
\]
In particular \((S_0v)(u_0)=-q_1/\sqrt2\), and
\(d(f_n S_0v)=f_n'(0,-dx^{14},dx^{13})/\sqrt2\).
These are the signs in the candidate pair.

The map \(\Psi_\theta(x)=x+\theta f_n(x^1)e_2\)
is globally periodic, fixes \(x^1\), and has inverse
\(\Psi_{-\theta}\). The derivative is
\(I+\theta f_n'e_2\otimes dx^1\), the added rank-one
term squares to zero, and the determinant is one.
Replacing \(dx^2\) by \(dx^2+\theta f_n'dx^1\)
in the triple adds exactly \(\theta\beta_n\).
The pulled-back wedge Gram is unchanged, so the
triple is positive and orthonormal self-dual for the
flat metric \(\Psi_\theta^*g_{\rm flat}\).
The splitting below uses the fixed flat adjoints.

For \(u_\theta=e_1-\theta f_n'e_2\) the derivative
\(D\Psi_\theta\) sends \(u_\theta\) to \(u_0\).
Hence \(S_\theta u_\theta=\Psi_\theta^*r_0\),
and the latter is
\(r_0+\theta f_n' dx^1q_1/\sqrt2\).
With \(\phi_\theta=-\theta f_nq_1/\sqrt2\), its
derivative cancels this addition exactly, so
\(r_0=d\phi_\theta+S_\theta u_\theta\).
The vertical parameter has zero mean since \(f_n\)
is a sine of integer frequency, and the residual is
zero, meeting both fixed slice conditions.
[E91, triple and exact decomposition][e91].

### Selected weak inverse and the frequency scales

For any covector \(\zeta\ne0\), use an oriented
orthonormal coframe with first covector
\(\zeta/|\zeta|\). Contraction of a unit self-dual
form by \(\zeta^\sharp\) has norm
\(|\zeta|/\sqrt2\) and is an isometry up to that scale
from the self-dual plane to \(\zeta^\perp\).
Thus \(S_0^*S_0=\tfrac32I\) and for
\(w_\zeta e=\zeta\otimes e\),
\(|S_0^*w_\zeta e|^2=|\zeta|^2|e|^2/2\).
The orthogonal projection \(\Pi_0\) then has
\(w_\zeta^*\Pi_0w_\zeta=\tfrac23|\zeta|^2 I\).
Since all coefficients here are constant and the
spatial derivative is the ordinary \(d\),
\(K_0=(2/3)d^*d\) with the stated nonnegative
Laplacian sign. Its kernel is the constant internal
vectors. On mean-zero tests the Fourier gap gives
the coercive reference inverse.

For \(|\theta|\le1\), the curvature-form perturbation
has sup norm \(|\theta|\epsilon_n\). Hence
\(C_\theta=S_0^*S_\theta\) is invertible for all
large \(n\), and \(\|\Pi_\theta-\Pi_0\|_\infty\le
C|\theta|\epsilon_n\). The perturbation of the
weak form \(d^*\Pi_\theta d\) on mean-zero \(H^1\)
costs that sup bound times the product of the
\(H^1\) norms. All weak right sides annihilate the
constants because \(d\) kills constant tests.
The Neumann series thus gives the same unique
mean-zero solver as used in E91.
Applying \(d^*\Pi_\theta\) to a splitting with
fixed-slice residual gives its vertical equation,
since \(\Pi_\theta S_\theta=0\) and
\(\Pi_\theta s=s\) in the fixed slice.
The displayed \(\phi_\theta\) solves it. Applying
\(H_\theta S_\theta=I\) determines \(u_\theta\) and
hence the residual. The argument never requires
a derivative of the perturbed coefficients.
[E91, weak inverse][e91] · [E79, method][e79].

With \(n=2^j\), \(j\ge1\), the only input modes are
\(\pm n e_1\). Under the E53 mode-index cutoff their
\(j\)-block symbol is \(\chi(1)-\chi(2)=1\) and every
other symbol vanishes at those indices.
The change from unit to period-\(2\pi\) torus uses
fixed volume and coordinate factors. Pointwise
\[
 |a_n|=\sqrt{3/2}(\epsilon_n/n)|\sin(nx^1)|,\qquad
 |\beta_n|=\epsilon_n|\cos(nx^1)|.
\]
The trigonometric distributions do not depend on
integer \(n\) by periodic change of variables.
Thus the pair \(L^8\) norm is bounded below by
\(c\epsilon_n\) from \(\beta_n\) and above by
\(C\epsilon_n\) by the sum of the two norms.
The dyadic weight multiplies it by \(n^{1/2}\)
exactly, yielding order \(n^{-1/4}\) at
\(\epsilon_n=n^{-3/4}\).
[E91, frequency bounds][e91] · [E53, partition][e53].

At \(\theta=1\) the horizontal sup norm is
\(\sqrt{1+\epsilon_n^2}\), its reference difference
has sup norm \(\epsilon_n\), and
\(\|Du_1\|_\infty=n\epsilon_n\).
Thus for the stated sum \(C^1\) norm
\(\|u_1-u_0\|_{C^1}=(1+n)\epsilon_n\) and both the
full and difference norms are of order \(n^{1/4}\).
Equidistribution of the sine and cosine also
verifies the separate Lorentz table. In particular,
the norms of \(a_n,\phi_1\) are their stated
\(O(\epsilon_n/n)\) values, and the norms of
\(\beta_n,d\phi_1,u_1-u_0\) are \(O(\epsilon_n)\),
with the displayed constants. The derivative norm
of \(u_1\) is \(n\epsilon_n L_*\), and the horizontal
value norm tends to the constant reference value.

The input \(r_0\) is constant with modulus
\(\sqrt{3/2}\). For volume \(\mathsf V=(2\pi)^4\),
its \(L^2,L^{4,1},B^{1/2}_{8,1},C^1\) norms are,
respectively,
\(\sqrt{3/2}\mathsf V^{1/2}\),
\(4\sqrt{3/2}\mathsf V^{1/4}\),
\(\sqrt{3/2}\mathsf V^{1/8}\), and \(\sqrt{3/2}\).
The Besov norm uses only the fixed low block.
The derived forcing \(d^*\Pi_\theta r_0\) is
a separate object. Its weak norm is \(O(\epsilon_n)\)
from \(\Pi_0r_0=0\), the sup perturbation estimate,
and the fixed \(L^2\) value norm of \(r_0\).
[E91, value and Lorentz norms][e91].

### Model boundary and finite behavior

The sequence excludes a uniform horizontal \(C^1\)
bound and \(C^1\) continuity at the zero pair for
this frozen solver under the full critical coefficient
norm, even with the same \(r_0\). Every smaller positive
critical radius still contains a tail of the sequence.
The explicit shear itself has displacement
\(|\theta|\epsilon_n/n\) in its small coordinate lift
and derivative difference \(|\theta|\epsilon_n\) in
sup norm. It is a finite \(C^1\)-small map. Its smallness
and the diverging derivative of \(u_\theta\) are
compatible because the shear and the instantaneous
splitting output are different maps in the construction.
The estimate yields no conclusion of failure of a
finite horizontal flow or of finite placement, nor
a result on a different chosen solver.

The compatibility boundary is exact:
an actual adjoint covariant exterior derivative has
\(d_A^2\phi=[F_A,\phi]\). The prescribed reference
\(d\) has \(d^2=0\), while the nonzero triple \(F_0\)
acts nontrivially by the faithful \(\mathfrak{so}(3)\)
adjoint representation. Thus \(d\) cannot accompany
this \(F_0\) as the actual curved reference, even
locally. The frozen exterior identity
\(\beta_n=da_n\) imposes neither the actual curved
reference nor the connection bracket terms.
The computation gives a frozen model obstruction
only. [E91, scope][e91] · [B53][b53].

[req]: ../research-progress/handoffs/SP4-CME-E92_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E92_RETURN_v1.md
[e90req]: ../research-progress/handoffs/SP4-CME-E90_REQUEST_v1.md
[e91req]: ../research-progress/handoffs/SP4-CME-E91_REQUEST_v1.md
[b52]: ../brainstorm/notes/B52_INTRINSIC_ALMOST_ROUND_GEOMETRY_20261122.md
[b53]: ../brainstorm/notes/B53_HORIZONTAL_SOLVER_DERIVATIVE_TEST_20261122.md
[e90]: ../notes/90_INTRINSIC_ALMOST_ROUND_GEOMETRY_20261122.md
[e91]: ../notes/91_FROZEN_HORIZONTAL_DERIVATIVE_TEST_20261122.md
[e14]: ../notes/16_TEMPORAL_STRAIN_CRITERION_20261122.md
[e02c]: ../notes/04C_VOLUME_AND_JETS_20261122.md
[e84]: ../notes/84_INTRINSIC_SLICE_ORBIT_BUDGET_20261122.md
[e8486]: E84_E86_INTRINSIC_ORBIT_ASSESSMENT_20261122.md
[e53]: ../notes/53_CRITICAL_FINITE_P_HEAT_20261122.md
[e79]: ../notes/79_VALUE_SMALL_ORBIT_INVERSE_20261122.md
[ms]: ../manuscript/chiral_curvature_and_metric_evolution.tex
