# E242 Independent audit of closed realization and local growth in the original flow

23 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E audit under B111, configured
gpt-6.2-sol/ultra. Selected-lead settings and independent runtime
attestation are unavailable. I authored the E235 local germ and
its E02C quotient input, as well as E42 and E49 in the inherited
adjusted local and round-stability arguments. E240 and E241 were separately
authored. The independent checks below concern the new cutoff,
transfer and local-maximum argument. They consume the assessed
germ and evolution theorems.

## Disposition

**Pass.** The prescribed E240 cutoff has the stated global
curvature and connection estimates, retains the E235 germ,
and supplies exactly \(H_{\rm cutoff}\). The conditional
E241 application to the assessed small-value basin and its
one-sided continuation of a strict local maximum are valid.
E241's frozen premise remains conditional in that record.
The combined conclusion concerns the already standard sphere,
an actual original flow and a continuing local maximum.

## Radial gauge and polynomial coefficients

Fix the old \(K=1\) oriented round metric \(\widehat g_{\rm rd}\)
on standard \(S^4\), the positive chiral principal \(SO(3)\)
bundle, and its round-compatible perfect connection. At the
center \(p\), match the old orthonormal fiber frame to the
positive chiral triple of the oriented normal chart so
\(F_{\rm rd}(0)=-\Sigma\). Fix a closed coordinate ball of
radius \(R_0\le1\) inside the chart. Parallel transport along
\(t\mapsto tx\) in a smooth local trivialization solves a smooth
connection ODE with parameter \(x\). It gives a smooth radial
frame, including at \(x=0\). In that frame \(x^iA_i(x)=0\).

Differentiate the radial identity to get
\(x^i\partial_j A_i=-A_j\). The bracket in \(x^iF_{ij}\)
vanishes, so \(x^iF_{ij}=x^i\partial_i A_j+A_j\).
At \(tx\) this is the derivative of \(t A_j(tx)\). Its
initial value at \(t=0\) is zero, and hence
\[
 A_{{\rm rd},j}(x)=\int_0^1 t x^i(F_{\rm rd})_{ij}(tx)\,dt .
\]
Subtracting the constant curvature integrand gives
\(\tfrac12\iota_xF_{\rm rd}(0)\) as the linear term and a
remainder \(E_{\rm rd}\). For
\(L=\sup_{y,u,z}|\iota_z\partial_u F_{\rm rd}(y)|\) with
\(|u|=|z|=1\) on the fixed chart ball, the integrand remainder
has norm at most \(Lt^2|x|^2\). Its derivative in direction
\(u\) is the sum
\[
 t\iota_u(F_{\rm rd}(tx)-F_{\rm rd}(0))
       +t^2\iota_x\partial_uF_{\rm rd}(tx).
\]
Each term is bounded by \(Lt^2|x||u|\).
Integration gives \(L|x|^2/3\) and \(2L|x|/3\) as the
respective value and derivative operator bounds. These
agree with E240 in the fixed chart norms.

For \(r=1+\epsilon\), \(0<\epsilon\le1\), put
\(h=\epsilon/(2+\epsilon)\le1/3\). The assessed germ has
\(Q_r=\operatorname{diag}(1-h,1,1+h)\). Write
\(q=Q_r-I\), \(s_i=\sqrt{(Q_r)_{ii}}\) and
\(d=\prod_i s_i\le1\). Since
\(|s_i-1|=|(Q_r)_{ii}-1|/(s_i+1)\), we get
\(|s_i-1|\le h\le\epsilon/2\) and \(s_i^{-1}\le\sqrt{3/2}\).
Also \(|q|=\sqrt2h\le\epsilon/\sqrt2\).
The trace-free projection of
\(\operatorname{diag}(-1/(1-h),0,1/(1+h))\) has norm below
\(2\). The squared norm of \(T=\operatorname{diag}(1-h,-2,1+h)\)
is \(6+2h^2\), so \(|T|\le3\). In the E235 coefficient,
\[
 \epsilon\mu(r)=\frac{r+1}{32}
   \left(\frac{8(r+1)^2}{r}+
                    \frac{24\epsilon}{\sqrt r}+1\right)
 \le\frac{3}{32}(72+24+1)<10 .
\]
It follows that \(|B|\le2+30/\epsilon\le32/\epsilon\) and
\(|U|=|B-dq/2|\le33/\epsilon\). For each base covector
\(dx^a\) the three \(J_jdx^a\) are orthonormal, so the
cubic coefficient array satisfies
\[
 |V^a|^2=\sum_{i,j}|U_{ij}|^2/s_j^2
        \le \frac{(33\sqrt{3/2})^2}{\epsilon^2}.
\]
This reproduces the prescribed uniform coefficient bounds.
The cubic connection term is
\(\tfrac16\sum_a(x^a)^3V^a\), so its uniform coefficient
norm on \(|x|\le R\) is at most \(C_V R^3/(6\epsilon)\)
and its derivative operator norm at most \(C_VR^2/(2\epsilon)\),
where \(C_V=33\sqrt{3/2}\). The estimates use
\(\sum|x^a|^3\le |x|^3\) and
\(\sum|x^a|^2|u^a|\le |x|^2|u|\).
The affine coefficient difference is
\(\tfrac12\iota_x(F^*-F_{\rm rd}(0))\).
Since \(|\iota_x\Sigma_i|=|x|\), \(s_2=1\) and
\(|s_i-1|\le\epsilon/2\), its value and derivative are
bounded by \(\epsilon|x|\) and \(\epsilon\). These steps
need no quantitative radius for the original local maximum.
[E240 construction](../notes/240_CLOSED_CUTOFF_RATIO_REALIZATION_20261123.md) ·
[Assessed E235 germ](E235_E236_ALL_RATIO_LOCAL_ASSESSMENT_20261123.md).

## Fixed cutoff and the actual curvature

Set \(R=\epsilon^2<R_0\) and \(a_\epsilon=
\chi(x/R)(A_r^{\rm loc}-A_{\rm rd})\). The difference of
connection forms transforms homogeneously as an
adjoint-valued one-form because the identical
inhomogeneous terms cancel on overlaps. Multiplication by
the scalar cutoff preserves this transformation. Its
support is compactly contained in the chart and the
smooth exterior plateau gives smooth zero extension. Thus
\(A_{\rm rd}+a_\epsilon\) is a global connection on the
fixed chiral bundle.

Let \(M=\sup|\chi|\), \(L_\chi=\sup|D\chi|\) and choose
fixed bounds \(C_{\rm rd}=L/3\) and \(C_V\) as above.
The difference before cutoff on \(|x|\le R\) has value
bound \(P_0=\epsilon R+C_{\rm rd}R^2+C_VR^3/(6\epsilon)\)
and derivative bound
\(P_1=\epsilon+2C_{\rm rd}R+C_VR^2/(2\epsilon)\).
Hence \(\|a_\epsilon\|_{C^0}\le MP_0\) and
\(\|D a_\epsilon\|_\infty\le MP_1+L_\chi P_0/R\) in
coefficient norms. The three terms of \(P_0\) have orders
\(\epsilon^3,\epsilon^4,\epsilon^5\), and each term of
\(P_1\) and \(P_0/R\) is \(O(\epsilon)\). Fixed
background norm comparison on the compact chart and
bounded reference connection coefficients convert this to
\(O(\epsilon^3)\) in \(C^0\) and \(O(\epsilon)\) in
\(C^1\). The derivative comparison adds fixed bounded
coefficients times \(a_\epsilon\).

The exact expansion
\[
 F_{A_{\rm rd}+a_\epsilon}-F_{\rm rd}
      =d_{A_{\rm rd}}a_\epsilon+\tfrac12[a_\epsilon\wedge a_\epsilon]
\]
uses the actual connection. In the ordinary two-form norm
the square of the alternating covariant derivative is at
most \(2|\nabla^{A_{\rm rd}}a_\epsilon|^2\), by expanding
its \(ij\) slots and using \(|u-v|^2\le2(|u|^2+|v|^2)\).
The bracket term has \(ij\) slot \([a_i,a_j]\) for
\(i<j\). By the oriented cross-product norm bound, the
sum of their squared norms is at most
\(\sum_{i<j}|a_i|^2|a_j|^2\le|a_\epsilon|^4/2\).
Thus its norm is at most \(|a_\epsilon|^2/\sqrt2\).
The uniform curvature difference is \(O(\epsilon)\).
These estimates apply on the entire sphere after zero
extension.

For a unit internal vector \(u\), the old reference
curvature \(F_{\rm rd}(u)\) has ordinary two-form norm
\(\sqrt2\). If \(b=(F_{A_\epsilon}-F_{\rm rd})(u)\) and
\(\mathcal M\) is the wedge Gram divided by
\(2dV_{\widehat g_{\rm rd}}\), then
\[
 |u^{\mathsf T}(\mathcal M-I)u|
   \le\sqrt2|b|+\tfrac12|b|^2 \le C_M\epsilon
\]
for a fixed \(C_M\) and all sufficiently small
\(\epsilon\). This follows by expanding the square of
\(F_{\rm rd}(u)+b\) under the wedge pairing and applying
the norm bound for the Hodge star. The same bound holds
pointwise for every \(F_{\rm rd}+\theta(F_{A_\epsilon}-F_{\rm rd})\),
\(0\le\theta\le1\). For \(C_M\epsilon<1/2\) all such
Gram matrices are positive. Along the segment the
curvature identification remains invertible onto its
positive plane, so its orientation sign is constant.
It has the reference round-compatible sign. This gives
global positive definiteness and the sign for actual
\(F_{A_\epsilon}\). The segment argument compares
curvature values and needs no realization of intermediate
segment values by connections.

The quotient \(Q=3\mathcal M/\operatorname{tr}\mathcal M\)
has the same ratio as \(\mathcal M\). The Rayleigh bounds
give the upper ratio
\((1+C_M\epsilon)/(1-C_M\epsilon)\le1+4C_M\epsilon\).
The center has ratio \(1+\epsilon\). Therefore
\(\sup\rho=1+O(\epsilon)\) with the E240 two-sided
bounds. On \(|x|<R/2\) the equality to the E235 germ
is exact. It retains the first quotient derivative, the
negative scalar Hessian and the actual original direction
evaluation, since those are local differential expressions.
A smaller ball inside this open set retains the strict
local maximum. The old \(K=1\) directional derivative
of \(\log\rho\) is \(1\); the native velocity factor \(1/2\)
and the unchanged \(Q\) give \(1/2\) in native time.
[E240 local conclusion](../notes/240_CLOSED_CUTOFF_RATIO_REALIZATION_20261123.md) ·
[E235/E236 old/native factors](E235_E236_ALL_RATIO_LOCAL_ASSESSMENT_20261123.md).

## The premise, fixed smoothing, and individual initial smoothness

The data are on the given standard \(S^4\) bundle with
actual curvature, belong to the stated positive sign class
and agree near \(p\) with the stipulated germ. Their
fixed-reference pair distances tend to zero. More
explicitly, the old-to-native reference change doubles
the internal metric and the base metric. The squared
norm of an adjoint-valued one-form gains \(2(1/2)=1\);
that of a two-form gains \(2(1/2)^2=1/2\). Thus the
native \(C^0\) pair distance is still \(O(\epsilon)\).
This supplies each clause of E241's \(H_{\rm cutoff}\).

Fix one \(m\ge6\), for example \(m=6\). The accepted
E49/E50/E52 theorem uses exactly the fixed round reference,
smooth positive definite compatible pair data and a strict
threshold on the sum of the two fixed \(C^0\) errors.
For sufficiently small \(\epsilon\) both the parabolic
value neighborhood and the smaller stability-transfer
threshold hold. At the zero datum its adjusted path is
stationary: \(Q=I\) gives zero original gradient and the
reference adjustments vanish. Positive-time derivative
continuity in the assessed E42 result gives
\(\widehat A_\epsilon(\tau)-A_{\rm rd}\to0\) in
\(C^m\), hence in \(H^m\), at the one fixed
\(\tau=T/2>0\). This is the strict entry condition for
the smooth stable adjusted solution. It uses the common
adjusted time \(T\) in the fixed-reference pair theorem.

For initial smoothness, separately fix \(\epsilon\).
The connection operator on the curvature graph has
principal coefficients depending on \((x,A,F_A)\).
The initial jet image of this datum is contained in the
open parabolic region and is compact. The assessed E29
smooth jet cutoff there supplies an individual smooth
adjusted path, with the same reference and initial datum.
The curvature lift solves the E36 system and is smooth
through time zero. On a short \([0,\ell]\) let its
pair difference from the reference be \(U\).
A sup bound on the smooth spatial derivative \(DU\)
bounds the weighted gradient contributions to \(X_\ell\)
by \(C\sqrt\ell\sup|DU|\). The value sup tends to its
initial value, which is strictly inside the completion
ball by the basin's smallness. Thus the smooth lift
lies in that ball for small \(\ell\). Its smoothness
also gives membership in the smooth completion. The
restriction of the common E42 solution is in the same
ball by the bounds of the fixed-time construction.
Uniqueness identifies the two solutions on this
individual interval. This proves smoothness of the head
through zero for each datum. The comparison interval
can shrink with the smooth jet. The separate E42 smoothness
for positive times still reaches the fixed \(\tau\) and
slightly beyond.
[E28/E29 smooth local theorem](E28_E29_LOCAL_FLOW_ASSESSMENT_20261122.md) ·
[E41–E44 local adjusted theorem](E41_E44_ROUGH_LOCAL_ASSESSMENT_20261122.md) ·
[E49–E52 transfer assessment](E49_E52_ROUND_STABILITY_ASSESSMENT_20261122.md).

## Recovery order and the actual original path

Use the action \(g\cdot A=(g^{-1})^*A\) and composition
\(gh=g\circ h\). Thus the infinitesimal action of an
invariant bundle field \(\xi\) is \(-\mathcal L_\xi A\).
The assessed adjusted equation in either gauge is
\(A_{{\rm adj},t}=v(A_{\rm adj})+\mathcal L_\xi A_{\rm adj}\)
in these conventions. Integrate
\(\dot j=-\xi\circ j\), \(j(0)=\mathrm{id}\).
The invariant field is smooth on each relevant compact
time interval, and the total principal bundle is compact.
The smooth flow exists there with a smooth inverse and
is equivariant by ODE uniqueness, hence covers a
base isotopy from the identity. Pullback differentiation
checks the cancellation directly:
\[
 \frac{d}{dt}j(t)^*A_{\rm adj}(t)
   =j(t)^*\bigl(A_{{\rm adj},t}
                       -\mathcal L_{\xi(t)}A_{\rm adj}(t)\bigr)
   =v(j(t)^*A_{\rm adj}(t)).
\]
For the head, the individual smooth comparison supplies
this calculation up to and including zero. Thus the
original path has the actual given datum and the actual
native derivative \(v(A_\epsilon)\) there. The flow is
recovered on a compact interval through \(\tau\) and a
little beyond, using the positive-time smoothness as well.

Put \(g_{\rm loc}=j_{\rm loc}^{-1}\) and
\(c=g_{\rm loc}(\tau)\). For the stable solution \(B(u)\)
with \(B(0)=\widehat A_\epsilon(\tau)\), use
\(g_{\rm st}=j_{\rm st}^{-1}\) starting at identity.
The tail \((c g_{\rm st}(t-\tau))\cdot B(t-\tau)\)
equals \(c\cdot B(0)\) at \(\tau\), the very same
datum as the head. It solves the original equation
by the fixed naturality of \(c\). Recentered original
smooth uniqueness on a right overlap identifies the
two paths and gives the smooth splice. Positivity and
the chosen sign hold along the adjusted paths and under
the orientation-preserving recoveries. The inverse of
\(c g_{\rm st}(u)\) is \(g_{\rm st}(u)^{-1}c^{-1}\),
and left action composition therefore identifies the
comparison path with \(B(u)\). The accepted stable
estimate gives the prescribed exponential \(H^m\)
bound with native exponent \(\lambda_1(G_0)/2\).
This use of the basin controls the original solution
modulo smooth time-dependent bundle automorphisms.
[E50 recovery and splice](../notes/50_SMALL_VALUE_STABILITY_TRANSFER_20261122.md) ·
[E49–E52 assessed rate](E49_E52_ROUND_STABILITY_ASSESSMENT_20261122.md).

## One-sided continuation at the local maximum

Fix one datum. In its original chart, smoothness through
zero and openness of the simple spectrum give a
spacetime half-neighborhood where
\(f(x,t)=\log\rho(Q(A_\epsilon(t))(x))\) is smooth to
\(t=0\). The exact germ and original initial tangent
yield
\[
 f(0,0)=\log(1+\epsilon),\quad
 D_x f(0,0)=0,\quad D_x^2 f(0,0)=-|G_r|^2 I,\quad
 \partial_t f(0,0)=1/2 .
\]
Here \(t\) is native. The coordinate Hessian is strictly
negative for each fixed \(r>1\). Let \(\Phi=D_x f\).
For \(t<0\), extend it by \(2\Phi(x,0)-\Phi(x,-t)\).
At zero its value and \(x\)-derivative agree across
zero, and its left \(t\)-derivative is
\(\partial_t\Phi(x,-t)\), so it also agrees.
This is a \(C^1\) extension of the implicit function
only. Invertibility of \(D_x\Phi(0,0)\) allows the
ordinary finite-dimensional implicit-function theorem.
On the positive half-neighborhood it gives a \(C^1\)
critical branch \(y(t)\) through zero. Differentiating
the implicit relation gives
\[
 y'=-[D_x\Phi(y,t)]^{-1}\partial_t\Phi(y,t).
\]
The bracketed matrix remains invertible after shortening
the interval. Its right side is a smooth function of
\((y,t)\) up to the half-boundary, so repeated
differentiation bootstraps the branch to smoothness
with continuous right derivatives at zero. The
negative Hessian persists on the short branch and
makes each point a strict spatial local maximum.

Writing \(u(t)=f(y(t),t)\), its chain-rule spatial term
vanishes. Thus \(u'(0)=1/2\), and one can take
\(u'(t)\ge1/4\) throughout a smaller interval for this
datum. For every sufficiently small \(t>0\) the local
maximum value of the ratio is then at least
\((1+\epsilon)e^{t/4}>1+\epsilon\). Its initial ratio
derivative is \((1+\epsilon)/2\). This conclusion is in
the fixed original identification. The hypotheses give
only a local initial maximum and the coarse global
ratio bound. The interval and spectral simplicity
neighborhood are datum dependent.
[E241 one-sided argument](../notes/241_CONDITIONAL_FLOW_LOCAL_MAXIMUM_REALIZATION_20261123.md).

## Source bookkeeping and scope

The canonical R15 record already identifies Fine
arXiv:1111.5005v2 of 29 November 2011, Proposition 4.2
and (4.1) on p. 30 for the original native gradient
and Lemmas 3.2 and 4.4, (3.4), (4.3)–(4.4) on
pp. 19 and 31 for the action and recovery.
The E241 locators match. The exact pairing and time
translation are the assessed branch conversion.
R19 already records Taylor's undated repaginated
author text, §7.3, printed pp. 147–149, including
Propositions 7.3.A–B. The compact-bundle smooth local
construction is E29's branch argument. The inspected
file and pagination are distinct from a new published
version or a direct theorem on the present bundle.
The E42 method's inherited Koch–Lamm context remains
in the canonical R20 record. The compatible adjusted
construction and the fixed-gauge global stability
used here are their assessed branch results. The
radial gauge computation and finite-dimensional
implicit-function argument are displayed locally.
No new primary version or source inspection is needed.
[Canonical source notes](../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md) ·
[Canonical catalog](../../../../references/README.md).

The cutoff is the one fixed near-round family on
standard \(S^4\). The crossing is of its local maximum
value. A global pinching-cap crossing, a uniform
crossing interval, convergence of the comparing
automorphisms, and arbitrary-ratio or arbitrary-base
globalization remain outside this packet.

## Verified identities

| Artifact | SHA-256 |
| --- | --- |
| [E242 request](../research-progress/handoffs/SP4-CME-E242_REQUEST_v1.md) | ee4f547e2735c8fcaace0339550b5e5f118ad0244fa54259fccc830ba27a1151 |
| [B111](../brainstorm/notes/B111_CLOSED_REALIZATION_OF_LOCAL_RATIO_GERMS_20261123.md) | 15db8371803239f8e98f739b43100ca743909bce983fa3c922291268d3e094ca |
| [E240 cutoff](../notes/240_CLOSED_CUTOFF_RATIO_REALIZATION_20261123.md) | e8bf6be314dbde48a6495057f800de637534dbc7ec1c5b6d0c054514540770fa |
| [E241 conditional application](../notes/241_CONDITIONAL_FLOW_LOCAL_MAXIMUM_REALIZATION_20261123.md) | fd11af9ac59082fc453b749cfd03ff7681dbb6f339c5827f7ce41a8a26370101 |
| [E235/E236 assessment](E235_E236_ALL_RATIO_LOCAL_ASSESSMENT_20261123.md) | c8f229dbc5421449ccc1e548af0502d5524a8bf771d7e9544efed5ce846a7c50 |
| [E49–E52 assessment](E49_E52_ROUND_STABILITY_ASSESSMENT_20261122.md) | f8596dc6467ef65c146c6ccd45a83255ea59829b52d72d6c8d598edd01739bee |
| [E50 transfer](../notes/50_SMALL_VALUE_STABILITY_TRANSFER_20261122.md) | ae7a4d7ae529ec298dd8517d5c36a8714799da3d89249c492c3e80eba63b81bf |

Only this audit and its return were written.
