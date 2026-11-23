# SP4-CME-E73 — Audit of the fixed round linear slice

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. The helper launch was configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and
selected lead settings were unavailable. I authored E48. I did not
author E71, E47 or E51. All four frozen input digests matched the
[request][req]. I used the internal normalization and action
conventions recorded in those inputs and independently checked the
E71 calculations. No new primary source was used. [Return][ret].

**Disposition.** E71 passes for the fixed native round sphere. The
weak inverse has the claimed one-derivative gain from connection
data at \(m=0\), the orbit sum is closed, and the residual map is the
\(L^2\) orthogonal projection. The fixed horizontal action test
identifies a derivative cost for differentiating smooth pullbacks in
a fixed direction. I found no proof gap within the stated linear
scope. [E71][e71].

## Native splitting and exact symbol

Use the oriented round Riemannian \(S^4\) with the positive perfect
connection \(A_0\), its native metric \(g_0\), and the internal
positive metric from the negative Killing form. The fixed
identification \(F_0:E\to\Lambda^+\) is a parallel isometry. Let
\(d=d_{A_0}\) and \(Su=\iota_uF_0\). For \(u\ne0\) choose an oriented
orthonormal frame with \(e_1=u/|u|\). For
\(\omega_j=(e^1\wedge e^j+*_{g_0}(e^1\wedge e^j))/\sqrt2\),
\(j=2,3,4\), contraction gives \(\iota_u\omega_j=|u|e^j/\sqrt2\).
Thus \(|\iota_u\omega|^2=|u|^2|\omega|^2/2\) for each self-dual
\(\omega\), and summing over an orthonormal frame of \(E\) proves
\(S^*S=\frac32 I\). This also shows that the three curvature
contractions span \(u^\perp\). [E47, normalization and
symbol][e47]. [E51, native conventions][e51].

Set \(H=\frac23 S^*\) and \(\Pi=I-SH\). The identities \(HS=I\)
and \((SH)^*=SH\) give an orthogonal splitting into
\(\operatorname{im}S\) and \(\ker S^*\). For a covector \(\xi\) let
\(w_\xi e=\xi\otimes e\). The adjoint identity
\[
 \langle S^*w_\xi e,u\rangle=F_0(e)(u,\xi^\sharp)
\]
gives \(|S^*w_\xi e|^2=\frac12|\xi|^2|e|^2\), including the
case \(\xi=0\). Since
\(|SHw_\xi e|^2=\frac23|S^*w_\xi e|^2\), subtraction from
\(|w_\xi e|^2\) gives \(|\Pi w_\xi e|^2=\frac23|\xi|^2|e|^2\).
Thus \(K=d^*\Pi d\) has symbol \(w_\xi^*\Pi w_\xi=
\frac23|\xi|^2 I_E\) in the convention \(\partial_j\mapsto i\xi_j\).
The adjoint supplies the opposite \(i\) factor. This is a uniform
rank-one bound. [E71 (1)–(2)][e71].

## Closed form, domain and weak inverse

The form is \(q(\phi,\eta)=(\Pi d\phi,\Pi d\eta)_{L^2}\) on
\(H^1(E)\). In a local trivialization its frozen principal form
controls first derivatives by Plancherel. The coefficient and
density differences on small charts cost at most a small multiple
of the derivative norm squared. The connection coefficients
contribute at most a small multiple of that norm squared plus a
fixed multiple of \(\|\phi\|_2^2\). The global localization identity,
with \(\sum_\gamma\chi_\gamma^2=1\), is
\[
 \sum_\gamma q[\chi_\gamma\phi]
   =q[\phi]+\sum_\gamma\|\Pi(d\chi_\gamma\otimes\phi)\|_2^2.
\]
The mixed terms cancel by \(\sum_\gamma\chi_\gamma d\chi_\gamma=0\).
This proves \(q[\phi]\ge c\|\phi\|_{H^1}^2-C\|\phi\|_2^2\).
With \(q\ge0\), the form norm \(q[\phi]+\|\phi\|_2^2\) is
equivalent to \(\|\phi\|_{H^1}^2\). The bound used by the Fourier
argument tests a covector and an internal amplitude at a time.
[E71 (3)][e71]. [E51, fixed realization][e51].

The coercive form \(q+(\cdot,\cdot)_{L^2}\) gives the solution
map \(R:L^2\to H^1\), which is symmetric, positive and injective
as an \(L^2\) operator. The compact embedding \(H^1\subset L^2\)
gives compactness of \(R\). The spectral realization \(R^{-1}-I\)
is self-adjoint and nonnegative with domain
\(\{\phi\in H^1:K\phi\in L^2\text{ weakly}\}\), since the
variational equation for \(R\) has right side \(\phi+K\phi\).
In a local chart take the weak test
\(-\delta_{-h}(\chi^2\delta_h\phi)\). The leading form after
difference-quotient integration by parts uses the translated
coefficient \(A_h\) on \(\chi\delta_h\phi\). In the product
\(\delta_h(A\partial\phi)=A_h\partial(\delta_h\phi)
+(\delta_h A)\partial\phi\), the second term acts on the known
\(H^1\) section. The leading coefficient symmetry in its combined
indices leaves only a quadratic cutoff error when passing to
\(\chi\delta_h\phi\). Its bound uses
\(\|\delta_h\phi\|_2\lesssim\|\phi\|_{H^1}\) on inner charts.
For lower-order terms with a derivative on the test, the
quotient of the smooth coefficient times \(\phi\) is bounded
in \(L^2\) by \(C\|\phi\|_{H^1}\).
For every term with the undifferentiated test, including the
\(L^2\) forcing, use
\[
 \|\delta_{-h}(\chi^2\delta_h\phi)\|_2
 \lesssim\|\chi\delta_h\phi\|_{H^1}+\|\phi\|_{H^1}.
\]
Uniform local Gårding for \(A_h\) and Young's inequality give a
uniform \(H^1\) bound on \(\chi\delta_h\phi\). Passing to weak
limits gives local \(H^2\). Differentiating the equation \(s\)
times gives smooth-coefficient commutators with at most \(s+1\)
derivatives of \(\phi\), already controlled by the preceding
step. A finite interior cover gives
\(\|\phi\|_{H^{s+2}}\le C_s(\|K\phi\|_{H^s}+\|\phi\|_{H^1})\)
for every integer \(s\ge0\). Conversely \(H^2\) sections have
\(K\phi\in L^2\) by the differential formula. This proves the
domain \(H^2\) and smoothness of the kernel \(N=\ker K\).
The kernel is finite dimensional because it is the eigenvalue-one
space of the compact \(R\). [E71 (3)–(4)][e71].

The form identity gives \(N=\{\psi\in H^1:\Pi d\psi=0\}\).
Coercivity of \(q\) on \(V=H^1\cap N^\perp\) follows by
contradiction. A unit-\(H^1\) sequence on \(V\) with form tending to
zero has a weak \(H^1\) and strong \(L^2\) limit in \(N\cap N^\perp\).
The form-norm equivalence then contradicts its unit norm.
For \(f\in H^{-1}(E)\) annihilating \(N\) the coercive form on
\(V\) gives a unique \(\phi\) in \(V\), solving \(K\phi=f\)
on the whole \(H^1\) test space and satisfying
\(\|\phi\|_{H^1}\le C\|f\|_{H^{-1}}\).
The finite-rank subtraction using an orthonormal smooth basis
of \(N\) is bounded on \(H^{-1}\), and defines \(K^\dagger\)
for arbitrary \(f\). It agrees on \(L^2\) with the spectral inverse
on \(N^\perp\) extended by zero on \(N\). The \(H^2\) claim
concerns the \(L^2\) operator domain. [E71 (5)–(6)][e71].

## Decomposition, closed orbit sum and all Sobolev bounds

For a connection difference \(a\in L^2(T^*S^4\otimes E)\),
\(\langle d^*\Pi a,\eta\rangle=(a,\Pi d\eta)_{L^2}\) has dual
norm at most \(C\|a\|_2\) and annihilates \(N\). Use the
\(H^{-1}\) inverse at this endpoint. Define
\[
 \phi=K^\dagger d^*\Pi a,\qquad u=H(a-d\phi),\qquad
 a_{\rm sl}=\Pi(a-d\phi).
\]
Using \(SH+\Pi=I\) gives \(a=d\phi+Su+a_{\rm sl}\).
The residual has \(S^*a_{\rm sl}=0\) in \(L^2\) and
\(d^*a_{\rm sl}=d^*\Pi a-K\phi=0\) in \(H^{-1}\).
The two slice conditions identify
\(\mathcal X=\ker S^*\cap\ker d^*\) with the orthogonal
complement of \(\mathcal Y=d(H^1(E))+S(L^2(TS^4))\).
The decomposition is onto \(L^2\), so an element of
\(\mathcal X^\perp\) has zero residual and lies in
\(\mathcal Y\). In particular the indicated sum itself is
closed. Applying \(\Pi\) and \(H\) to a zero orbit direction
shows that the parameter pairs differ exactly by
\((\psi,-Hd\psi)\), with \(\psi\in N\). Conversely such a pair
has zero orbit direction by \(\Pi d\psi=0\). The condition
\(\phi\perp N\) selects one pair.
The residual operator
\(\mathcal P=\Pi-\Pi d K^\dagger d^*\Pi\) fixes \(\mathcal X\)
and vanishes on \(\mathcal Y\). Both
\((\mathcal Pa,b)_{L^2}\) and \((a,\mathcal Pb)_{L^2}\) equal
\((\mathcal Pa,\mathcal Pb)_{L^2}\), giving self-adjointness.
[E71 (7)–(10)][e71].

For \(m=0\) use the weak \(H^{-1}\) estimate for \(\phi\).
For each integer \(m\ge1\), \(d^*\Pi\) maps \(H^m\) into
\(H^{m-1}\). The domain regularity estimate gives
\(\|\phi\|_{H^{m+1}}\lesssim_m\|a\|_{H^m}\)
after the \(H^1\) term is bounded by the weak estimate.
Since \(H\) and \(\Pi\) are smooth zeroth-order maps, it follows
that
\[
 \|\phi\|_{H^{m+1}}+\|u\|_{H^m}+\|\mathcal Pa\|_{H^m}
 \lesssim_m\|a\|_{H^m}\qquad(m\in\mathbb Z_{\ge0}).
\]
At these orders the range is \(\mathcal X\cap H^m\) and
the kernel is the stated sum with \(H^{m+1}\) and \(H^m\)
parameters, by the same decomposition. Smooth data yield
smooth fields by arbitrary-order estimates. [E71 (11)][e71].

E71 states (11) for nonnegative orders. The bound extends to
negative integer orders when interpreted on dual Sobolev spaces.
On smooth sections the adjoint of
\(\Phi=K^\dagger d^*\Pi\) is \(\Phi^*=\Pi dK^\dagger\).
For \(k\ge1\) the regularity estimate and bounded kernel
subtraction give \(K^\dagger:H^{k-1}(E)\to H^{k+1}(E)\).
Thus \(\Phi^*:H^{k-1}\to H^k\), and by duality
\(\Phi:H^{-k}\to H^{1-k}\). Bounded multiplication by the
smooth maps \(H,\Pi\) and differentiation then give the
\(H^{-k}\) bounds for \(u\) and the residual. The \(L^2\)
orthogonality assertion concerns the original pairing.

## Action convention, cancellation and frequency test

Let \(Y\) be the fixed \(A_0\)-horizontal lift of a smooth
base field \(X\), and let \(\Psi_t\) be its flow. For a
local section \(s(x)\) of the frame bundle, write
\(\Psi_t(s(x))=s(f_t(x))h_t(x)\) in the principal right
action convention. The active pullback of the difference
tensor is \(\operatorname{Ad}_{h_t^{-1}}f_t^*a\); for the
connection add \(h_t^{-1}dh_t\). The inverse-pullback left
action of E48 gives \(-\mathcal L_Y A\) when the generator
of \(\Psi_t\) is \(Y\), whereas active pullback gives
\(\mathcal L_Y A\). The active reference tangents are
\(SX\) and \(d\phi\) for the indicated horizontal and
vertical generators, so both conventions give the same
linear orbit subspace. [E48, infinitesimal generator and
active pullback][e48]. [E71 (12)–(13)][e71].

For \(A=A_0+a\), Cartan's formula gives
\(\mathcal L_Y A=\iota_YF_A+d_A(A(Y))\), and \(A(Y)=a(X)\).
Expanding \(F_A=F_0+da+\tfrac12[a\wedge a]\) gives
\(\iota_X[a\wedge a]/2=[a(X),a]\), which cancels
\([a,a(X)]\) in \(d_A(a(X))\). The full active derivative
therefore is \(SX+\iota_X da+d(a(X))\).
Writing \(D_0\) for the fixed covariant derivative on the
tensor gives
\[
 (\iota_X da)_i=X^j((D_0)_j a_i-(D_0)_i a_j),\qquad
 (d(a(X)))_i=X^j(D_0)_i a_j+a_j\nabla^{g_0}_iX^j .
\]
This proves the sign and both surviving derivative terms in
(14). It also agrees directly with differentiating the
local pullback formula, since horizontality gives
\(\dot h_0=-A_0(X)\) in that frame. [E71 (13)–(14)][e71].

For each tested integer \(m\ge0\), fix a global smooth \(X\)
equal to \(\partial_1\) on a neighborhood of the support of
a nonzero chart cutoff \(\chi\). In a smooth trivialization
take one fixed nonzero component with
\(a_n=n^{-m}\chi\sin(nx^1)\), extended by zero. The fixed
metric Sobolev norms of \(a_n\) are bounded. In this chart
the order-\(m\) coordinate derivative \(\partial_1^m\) of
the transported component has leading term
\(n\chi\sin(nx^1+(m+1)\pi/2)\). Its \(L^2\) norm is
bounded below by \(cn\) for large \(n\), since the squared
oscillation against the fixed smooth density times
\(\chi^2\) tends to one half its integral. Terms involving
the cutoff derivative, connection coefficients,
\(\nabla^{g_0}X\), and the fixed \(SX\) remain bounded
at that order. Local norm equivalence on the fixed patch
therefore gives unbounded \(H^m\) output. The test concerns
the derivative in \(t\) at \(0\) as the input \(a_n\) varies
for fixed \(X\). The reference tangent \(SX\) itself has
order zero in \(X\). This calculation and the linear
inverse leave nonlinear slice existence and regularity
unresolved. [E71, derivative count][e71].

[req]: ../research-progress/handoffs/SP4-CME-E73_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E73_RETURN_v1.md
[e71]: ../notes/71_LINEAR_ROUND_SLICE_20261122.md
[e47]: ../notes/47_ROUND_STABLE_LINEAR_20261122.md
[e48]: ../notes/48_FIXED_STABILITY_GAUGE_20261122.md
[e51]: E51_STABILITY_INPUTS_AUDIT_20261122.md
