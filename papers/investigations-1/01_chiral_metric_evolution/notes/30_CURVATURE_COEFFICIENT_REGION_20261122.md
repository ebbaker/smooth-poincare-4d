# SP4-CME-E30 — curvature-value dependence of the corrected principal coefficients

22 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol` / `ultra`.
Actual backend model and effort were not independently exposed. Selected
lead settings unavailable. This is the finite analytic check in the
[E30 request][request] under the [B25 decision][decision]. The
[return][return] records the frozen input identities.

## Operator and derivative variables

Use a smooth compact closed oriented real four-manifold and a fixed
smooth definite connection \(\bar A\) on the oriented Euclidean rank-three
bundle, in the round-positive component. Work in Fine's native convention
from [E27][e27]. The internal positive metric is given by the negative
Killing form, the base metric \(g_A\) has the curvature volume, and the
gradient speed \(v\) uses the native clock. In manuscript conventions
\(g_A=2K\widehat g_A\) for fixed \(K>0\), so a uniform comparison or
limit in one normalization has the same content in the other.
[Fine v2, Definition 1.4 and Proposition 4.2][fine] · [E27][e27].

Write \(a=A-\bar A\), \(F=F_A\), \(\bar F=F_{\bar A}\),
\(g=g_A\) and \(\bar g=g_{\bar A}\). The tested adjusted vector field is
\[
 V_{\rm fixed}(A)=v(A)-d_A d_A^{*\bar g}a
                   -S_A S_A^*d_A^{*g}d_Aa,\qquad S_A(u)=\iota_uF .
 \tag{1}
\]
Only the base metric in the vertical adjoint is frozen. The other
adjoints, including \(S_A^*\), use the live reconstructed metric and
the fixed internal pairing.

Choose fixed smooth base coordinates and a fixed smooth orthonormal
bundle trivialization. Component arrays of \(g,Q,g^{-1},S_A,S_A^*\)
are smooth pointwise functions of \((x,F)\) on the open definite
curvature region. The first derivatives of \(A\) enter these expressions
only through curvature. For example write \(g=\mathcal G(x,F)\). Then
\[
 \partial_\ell g=(\partial_{x^\ell}\mathcal G)(x,F)
                         +D_F\mathcal G(x,F)[\partial_\ell F].
 \tag{2}
\]
The explicit \(x\)-derivative allows the smooth coordinate and frame
choices to be carried in the coefficients. A fixed round-reference
metric is unnecessary for this algebraic statement. The smooth
positive-plane and volume reconstruction is the one checked in E27.

For the internal bracket convention in the fixed frame,
\[
 F_{ij}=\partial_i A_j-\partial_j A_i+[A_i,A_j],\qquad
 \partial_\ell F_{ij}
 =\partial_\ell\partial_i A_j-\partial_\ell\partial_j A_i
   +[\partial_\ell A_i,A_j]+[A_i,\partial_\ell A_j].
 \tag{3}
\]
Thus a coefficient times \(\partial_\ell F\) splits into a second jet
and a term linear in the first jet of \(A\), with coefficients depending
on \(A,F\). The coordinate array \(A\) has twelve components. Derivatives
of fixed coordinate or frame transitions only change the fixed
\(x\)-dependent coefficients and lower-order terms.

## Exact coefficient inventory

### Physical vector field

In the native notation write
\(B(F)=4Q(F)-\tfrac23\operatorname{tr}(Q(F)^2)I\).
Acting on the internal factor, \(B(F)F\) is self-dual in the
reconstructed metric. The codifferential sign and Bianchi identity
give the exact local expression
\[
 v(A)=-d_A^{*g}(B(F)F)=*_g d_A(B(F)F)
                       =*_g\bigl((d_A B(F))\wedge F\bigr).
\]
Here \(d_A B(F)\) is the derivative on the internal endomorphism
bundle. Its local derivative terms are \(D_F B(x,F)[\partial_\ell F]\),
the explicit \(x\)-derivative, and the commutator with the connection
coefficient \(A_\ell\). The wedge and \(*_g\) in this expression are
pointwise maps of \(F\). Therefore \(v\) is a sum of coefficients of
\((x,F)\) times \(\partial_\ell F\) and a term of \((x,A,F)\). No
derivative of the star remains after the exact self-duality
substitution. [Fine v2, Proposition 4.2][fine].

### Fixed-metric vertical term

The fixed-metric codifferential of \(a\) is
\[
 d_A^{*\bar g}a
 =-\bar g^{ij}\partial_i A_j+L_0(x,A),\qquad
 L_0(x,A)=\bar g^{ij}
       \bigl(\partial_i\bar A_j+\bar\Gamma^k{}_{ij}a_k-[A_i,a_j]\bigr).
\]
Here \(\bar\Gamma\) is the Christoffel symbol of \(\bar g\), and all
background fields in \(L_0\) are fixed. In \(-d_A d_A^{*\bar g}a\),
the outer derivative gives the second-order term whose \(\ell\)
component is \(\bar g^{ij}\partial_\ell\partial_i A_j\).
Terms from \(\partial\bar g^{ij}\), \(D_A L_0[\partial A]\) and the
outer connection bracket applied to the inner first derivative
are linear in \(\partial A\). Differentiation of \(L_0\) in \(x\)
at fixed \(A\), and the outer bracket with \(L_0\), give zeroth-order
terms in the variable jet representation. Derivatives up to
\(\partial^2\bar A\) and \(\partial^2\bar g\) may occur in these
lower-order coefficients. The principal coefficient uses only
the value \(\bar g=\mathcal G(x,\bar F)\).

### Live-metric horizontal term

The useful identity is
\[
 \beta=d_A a=F-\bar F+\tfrac12[a\wedge a].
 \tag{4}
\]
It follows by comparing
\(F=\bar F+d_{\bar A}a+\tfrac12[a\wedge a]\) with
\(d_Aa=d_{\bar A}a+[a\wedge a]\).
In particular \(\beta_{ij}=F_{ij}-\bar F_{ij}+[a_i,a_j]\).
Its coordinate derivative is exactly
\[
 \partial_\ell\beta_{ij}=\partial_\ell F_{ij}-\partial_\ell\bar F_{ij}
    +[\partial_\ell A_i-\partial_\ell\bar A_i,a_j]
    +[a_i,\partial_\ell A_j-\partial_\ell\bar A_j].
 \tag{5}
\]
Thus the undifferentiated two-form in this term is algebraic in
\(A,F,\bar A,\bar F\). The live codifferential is
\[
 (d_A^{*g}\beta)_j=-g^{ik}\bigl(
 \partial_i\beta_{kj}+[A_i,\beta_{kj}]
 -\Gamma^m{}_{ik}(g)\beta_{mj}-\Gamma^m{}_{ij}(g)\beta_{km}\bigr).
 \tag{6}
\]
The Christoffel symbol is linear in \(\partial g\) with coefficients
depending smoothly on \(g\). By (2), its variable derivative
part is linear in \(\partial F\). Its multiplier \(\beta\) in
(6) is the undifferentiated array (4), so that multiplier depends
on curvature values and connection values. By (5), the other
variable derivative terms are linear in \(\partial F\) or
\(\partial A\) with the same type of coefficients. The fixed
\(\partial\bar F\) and \(\partial\bar A\) appear at lower order.
Finally, the outer \(S_A S_A^*\) is a pointwise function of the live
curvature and metric, with no derivative outside it. This accounts
for all terms of the horizontal adjustment.

### Resulting form

Substitution of (3) in the physical and horizontal terms and
addition of the fixed-metric vertical term prove the requested
representation
\[
 V_{\rm fixed}(A)
  =\sum_{i,j}\mathsf P^{ij}(x,A,F;\bar A,\bar F)\,\partial_i\partial_j A
   +\sum_i\mathsf B^i(x,A,F)\,\partial_i A
   +\mathsf C(x,A,F).
 \tag{7}
\]
The semicolon in \(\mathsf P\)'s arguments displays the background
values whose dependence is fixed in \(x\). The \(\mathsf B^i,\mathsf C\)
coefficients in (7) also include the fixed smooth background and
its finitely many derivatives described above. In particular,
the principal coefficient requires no derivative of the background
beyond the value \(\bar F\). This sharper fact holds even though
\(\partial\bar g\) and \(\partial^2\bar g\) enter lower-order terms.
All coefficients multiply the twelve connection components in
fixed local frames. They are smooth functions of the indicated
arguments while both curvature arrays are definite. Holding
\(x,A,F\) fixed while changing the symmetric part of the first
jet preserves every principal coefficient. The full first jet
can occur in the displayed linear lower-order term, and (7) does
not bound it.

## Algebraic parabolic region with a fixed reference

Use the Fourier convention \(\partial_i\mapsto i\xi_i\), and measure
the principal quadratic form using the fixed base pairing \(\bar g\)
and the internal metric. By E27, at the reference values
\((A,F)=(\bar A,\bar F)\) the principal symbol is strictly negative
in that pairing for every nonzero \(\xi\). Compactness of the
reference unit cosphere and of the unit amplitude sphere gives a
strict uniform gap \(\kappa_{\bar A}>0\). The sign is the one for
the evolution \(A_t=V_{\rm fixed}(A)\). The symbol need not be
self-adjoint. All that is used is its quadratic form in the
specified pairing. [E27 reference symbol and coercivity][e27].

By (7) the symbol is continuous in the two current values \(A,F\),
uniformly over a sufficiently small compact value tube about the
reference on a finite collection of fixed charts. A small enough
fixed-background \(C^0\) difference in both \(A-\bar A\) and
\(F-\bar F\) therefore keeps the negative gap at least
\(\kappa_{\bar A}/2\) in the fixed pairing, for example. Such a
neighborhood also stays definite, by openness and compactness.
Equivalence of the smooth fixed norms allows any fixed smooth
comparison metric on the compact base when stating the smallness
condition. This algebraic symbol estimate uses only the stated value differences,
with no smallness condition on the whole first jet.
The quadratic form itself is tested in the reference pairing.
Changing that pairing for a nonsymmetric symbol is a distinct
operation from comparing the norms used to state closeness.

## What the E24 limits supply

Now restrict to the hypothesis of [E24][e24] that the unadjusted
smooth definite solution has a finite temporal budget approaching
a finite candidate endpoint. Its connection and curvature then
converge uniformly in the fixed identification to continuous
\(A_\star,F_\star\), with \(F_\star\) still strictly definite. The
native constant rescaling of the metric and time does not affect
this statement. Use any fixed background norms on a finite chart
cover. The values \((x,A(t,x),F(t,x))\) extend jointly continuously
to the endpoint on compact late cylinders, and the curvature
values range over a compact subset of the definite region.

Choose a smooth late reference \(\bar A=A(t_0)\) for \(t_0\) before
the endpoint. Uniform endpoint convergence implies both
\(\|A(t)-A(t_0)\|_{C^0}\) and \(\|F(t)-F(t_0)\|_{C^0}\) are small
uniformly for \(t\ge t_0\) when \(t_0\) is late. To compare this
with a reference-dependent algebraic threshold, use the joint
principal map in (7). Reference symbol coercivity at equal current
and background values is a pointwise property of definite
curvature, by E27's algebraic reference formula. It holds also
at the limiting values \(F_\star\). The reference metrics vary
over a compact positive metric set, and are uniformly equivalent
to one fixed comparison metric. Thus compactness of the joint
reference value set, with the respective reference pairings, gives
a uniform positive reference gap for late \(t_0\). The principal
map is uniformly continuous on a compact definite value tube of
these reference pairs. Consequently the \(C^0\) value threshold
for the gap can also be taken uniform for late smooth references.
This addresses only the coefficient values, with no dependence
on derivatives of \(g_{\bar A}\) in this algebraic threshold.

For a fixed late smooth reference, composition with (7) gives a
continuous extension of \(\mathsf P(x,A(t),F(t))\) along the given
unadjusted fields. It has a uniform continuity modulus on a
compact late cylinder including the endpoint. The same conclusion
holds uniformly in the parameter \(t_0\) for these principal
coefficient values, since the joint map depends on \(\bar A,\bar F\)
only through their continuous values on that parameter set. In time,
the compact value tube bounds the derivatives of \(\mathsf P\) with
respect to the current variables uniformly in the late reference. The
chain rule along the smooth unadjusted path and E24's integrable
velocities give, for late \(s\le t\),
\[
 \|\mathsf P(t)-\mathsf P(s)\|_{C^0}
 \le C\int_s^t\bigl(\|A_\sigma\|_{C^0}+\|F_\sigma\|_{C^0}\bigr)\,d\sigma,
\]
where \(A_\sigma,F_\sigma\) are time derivatives. Neither this time
modulus nor uniform convergence in space gives a specific Hölder
or Dini modulus. For each fixed smooth \(\bar A\), evaluations of
\(\mathsf B^i,\mathsf C\) also extend continuously as coefficient
values, since their background derivatives are then fixed smooth
functions. If \(t_0\) varies toward the endpoint, E24 supplies
no uniform spatial bounds or moduli for those higher reference
derivatives. In particular its uniform convergence of the values
of \(g_{\bar A}\) does not bound their first or second spatial
derivatives.

These are coefficient evaluations on the **given unadjusted
fields**. They do not assert that those fields solve (1), or that
an adjusted trajectory or a reverse bundle automorphism has
controlled norms near the endpoint. A time-dependent automorphism
can change the local connection and curvature coefficients and
their comparison to the chosen reference. Even the corrected
vertical generator still uses first derivatives in its lower
orders. A restart would require regularity of the adjusted fields,
control of their comparison and the automorphism equation, and
endpoint data in spaces compatible with local parabolic estimates
and an existence time. A moving reference would additionally
require any uniform higher background norms those estimates use.
These dependencies are separate from (7) and the algebraic symbol
gap. This packet provides no adjusted-trajectory regularity,
existence-time, or endpoint continuation result.

[request]: ../research-progress/handoffs/SP4-CME-E30_REQUEST_v1.md
[return]: ../research-progress/handoffs/SP4-CME-E30_RETURN_v1.md
[decision]: ../brainstorm/notes/B25_CURVATURE_COEFFICIENT_REGION_20261122.md
[e27]: 27_FIXED_ADJOINT_GAUGE_TEST_20261122.md
[e24]: 24_TEMPORAL_BOOTSTRAP_20261122.md
[fine]: https://arxiv.org/html/1111.5005v2
