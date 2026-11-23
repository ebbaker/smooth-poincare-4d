# E77 independent audit of high-order stability and the smooth recovery limit

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Helper configured as `gpt-6.2-sol` / `ultra`.
Independent runtime attestation and actual lead settings are unavailable.
This helper authored E47 and audited E49/E50 transfer in E52. I use
E47's assessed graph scale and check its application here. The new
E76 argument is independently audited below.
[Frozen request][req] · [E76 derivation][e76].

**Disposition.** E76 passes. The stable connection has the E49
rate \(\alpha=\lambda_1(G_0)/2\) in every fixed Sobolev order for each
smooth datum in the existing \(m=6\) basin, with order- and
datum-dependent constants. The actual stable recovery maps and inverses
converge exponentially in every fixed spatial \(C^r\) norm. Applying
the unchanged E50 small-value transfer at \(m=6\) gives smooth
exponential convergence of the original connection and curvature.
The metric limit follows from the same pullback order and is made
explicit below.

## Fixed tube and high-order product and composition

E49 chooses one \(R_0\) and first-jet radius \(r\) such that on the
closed global path ball of radius \(R\le R_0\),
\(\|(a,Da)\|_\infty\le r/2\). The closed jet ball of radius \(2r\)
lies in the fixed definite and parabolic coefficient region. Thus the
scaled jets \(\vartheta(a,Da)\), \(0\le\vartheta\le1\), and the
localized jets after a cutoff valued in \([0,1]\) stay in the same
smooth coefficient domain. The uniform \(H^5\) bound on
\(z=(a,Da)\) is \(C\|a\|_{H^6}\le CR\), independent of the target
order. E49's overlap argument supplies smoothness on every compact time
interval for these smooth input connections. [E49, (1)–(5) and common
lifespan][e49].

In a fixed local trivialization with nested smooth cutoffs, extend
compactly supported chart pieces by zero. For \(s\ge3\) the Fourier
convolution gives
\[
 \|uv\|_{H^s}\le C_s\bigl(\|u\|_{H^s}\|\widehat v\|_1
                    +\|\widehat u\|_1\|v\|_{H^s}\bigr)
 \le C'_s\bigl(\|u\|_{H^s}\|v\|_{H^3}
                    +\|u\|_{H^3}\|v\|_{H^s}\bigr).
\]
The first estimate uses
\(\langle\xi\rangle^s\le C_s(\langle\eta\rangle^s+
\langle\xi-\eta\rangle^s)\) and Young. For the second,
\(\langle\xi\rangle^{-3}\in L^2(\mathbb R^4)\) allows
Cauchy–Schwarz. Operations in the fixed tensor bundles are
componentwise in these charts. Transition, frame and cutoff
coefficients are fixed smooth multipliers. This proves (3), including
the algebra bound at \(s=3\).

At order five of \(F(x,\vartheta z)\), the chain rule yields bounded
mixed coefficient derivatives times positive-order jet derivatives
whose orders total at most five. At most one factor has order at
least three. Put it in \(L^2\). Every other factor has order at most
two and is in \(L^\infty\) by \(H^5\) on \(z\) and
\(H^3(\mathbb R^4)\hookrightarrow L^\infty\) on its second
derivatives. If there is no such higher factor, all factors are
bounded, and the supported chart volume gives \(L^2\). An explicit
\(x\) derivative of \(F\) reduces the available total jet-derivative
order and is bounded on the same compact tube. This verifies the
uniform \(H^5\) base bound and in particular the uniform \(H^3\)
bound for each needed coefficient map.

For the induction from order \(s-1\) to \(s\) with \(s\ge6\), include
all first coordinate derivatives of the localized coefficient:
\[
 \partial_i(\chi F(x,\vartheta z))
 =(\partial_i\chi)F(x,\vartheta z)+\chi F_{x_i}(x,\vartheta z)
  +\vartheta\chi F_z(x,\vartheta z)\partial_i z.
\]
The first two use the order-\((s-1)\) composition estimate, applied
to fixed smooth maps. For the product, the two allocations are
\(C_s(1+\|z\|_{H^{s-1}})\|\partial_i z\|_{H^3}\) and
\(C_s\|\partial_i z\|_{H^{s-1}}\), since \(F_z\) has bounded \(H^3\)
norm. The first is linear in the high norm because
\(\|\partial_i z\|_{H^3}\le C\|z\|_{H^5}\) is uniformly bounded.
The second is controlled by \(\|z\|_{H^s}\). This proves (4) for
all fixed \(s\ge5\), uniformly in \(\vartheta\). All differentiations
in this argument are on the one fixed jet domain. Constants may
increase with the order and the number of coefficient derivatives
used. [E76, (3)–(4)][e76].

## Exact remainder and one high factor

The stable vector field is affine in \(D^2a\) with smooth
coefficients in \(x,z\). In E48,
\(F_B=F_0+\operatorname{Alt}Da+[a\wedge a]/2\), so the curvature
derivative raises \(a\) to second order only linearly. The live
metric and curvature adjoints are algebraic maps of \(F_B\),
and the live Christoffel difference is affine in the derivative of
\(F_B\). The fixed vertical input is first order before \(d_B\)
is applied. The fixed horizontal input \(\Delta_0S_0^*a\) is
second order and the outside \(S_B\) depends on the curvature
values. This yields \(C_2(x,z)D^2a+\mathcal L(x,z)\). The
linearization at zero is \(C_2(x,0)D^2a+D_z\mathcal L(x,0)[z]\),
including all fixed lower-order terms, and is exactly \(-G_0a\).
The stationary value term is zero. Subtracting this linearization
therefore gives E76 (2) with the stated Taylor remainders.
[E48, (2)–(4), (6), (8)][e48].

Write \(z_s=\|z\|_{H^s}\), \(z_3=\|z\|_{H^3}\). In the integral
\(C^\sharp=\int D_zC_2(x,\vartheta z)[z]\,d\vartheta\),
(3)–(4) give \(C_s[z_s+(1+z_s)z_3]\) at order \(s\) and
\(Cz_3\) at order three. The high bound is \(C'_s z_s\) because
\(z_3\) is uniformly bounded and \(z_3\le C z_s\). In
\(L^\sharp=\int(1-\vartheta)D_z^2\mathcal L(x,\vartheta z)[z,z]
\,d\vartheta\) the high coefficient contributes
\(C_s(1+z_s)z_3^2\), while either high \(z\) gives
\(C_s z_s z_3\). The sum is \(C'_s z_s z_3\) by the same low
bound. At \(s=k-1\), the differentiated highest-order coefficient
is paired with \(D^2a\) in \(H^3\). The other placement pairs the
coefficient in \(H^3\) with \(D^2a\) in \(H^{k-1}\). Thus (6) is
precisely
\[
 \|N(a)\|_{H^{k-1}}\le C_k
 \bigl(\|a\|_{H^k}\|a\|_{H^5}
       +\|a\|_{H^4}\|a\|_{H^{k+1}}
       +\|a\|_{H^4}\|a\|_{H^k}\bigr)
 \le C'_k\|a\|_{H^6}\|a\|_{H^{k+1}} .
\]
No differentiated coefficient takes a second high factor and no
constant forcing term is left. [E76, (5)–(6)][e76].

## Weighted graph pairing and eventual absorption

Use the assessed E47 positive self-adjoint \(G_0\), the spectral gap
\(\lambda_1>0\), and equivalence of the geometric integer Sobolev
norms with \(\|w\|_{\mathcal H^\ell}=\|J^{\ell/2}w\|_2\) for
\(J=I+G_0\). With \(v=e^{\alpha u}a\) the equation is
\(v_u+(G_0-\alpha I)v=e^{\alpha u}N(a)\). On spectral
projections, testing against \(J^k v\) gives the nonlinear term
\[
 \operatorname{Re}\langle J^{(k-1)/2}e^{\alpha u}N(a),
                                  J^{(k+1)/2}v\rangle .
\]
The powers add to \(k\); the projections can be removed on compact
time intervals by smoothness. This is an exact fixed-operator pairing
and adds no principal commutator. The one high factor multiplied by
\(e^{\alpha u}\) is bounded by a fixed-order constant times
\(\|v\|_{\mathcal H^{k+1}}\). The remaining coefficient is
\(C_k\|a(u)\|_{H^6}\). Spectrally
\[
 (G_0-\alpha I)\ge\theta J,\qquad
 \theta=\frac{\lambda_1-\alpha}{1+\lambda_1}>0,
\]
since \((\lambda-\alpha)/(1+\lambda)\) is increasing above the
gap. This gives the common coercive margin in E76 (8).
[E47, graph scale and (5)][e47].

For an order \(k\), one can take
\(U_k=\alpha^{-1}\log \max\{1,2C_kC_6\eta_6/\theta\}\).
The nonlinear coefficient is then at most \(\theta/2\) for all
\(u\ge U_k\) by E49 (2) at \(m=6\). Integrating the weighted
energy gives (9) and hence \(H^k\) decay at the same \(\alpha\).
The weighted \(H^k\) norm on \([0,U_k]\), including the starting
energy for (9), is finite for the particular smooth path. The
result allows a constant depending on this finite initial part,
and imposes no smallness of its high norm. Each order uses its
own absorption time, with the same original input basin.
[E49, (2) and smooth continuation][e49] · [E76, (7)–(10)][e76].

## Stable generator and all finite-order recovery limits

For the E50 left action \(g\cdot A=(g^{-1})^*A\), set
\(\phi=\delta_0a\) and \(Y=\Delta_0S_0^*a\). The actual
stable direct generator is \(W=-\xi_{\rm st}=\phi+\chi_B(Y)\).
The sign follows from
\(R(\phi+\chi_B(Y),B)=-d_B\phi-S_BY\) and
\(B_u=v(B)-R(\xi_{\rm st},B)\).
Indeed differentiating \(j_{\rm st}^*B\) with
\(j_{\rm st}'=W\circ j_{\rm st}\) cancels the gauge terms.
For \(p=s(x)h\), the horizontal lift with connection form
\(\operatorname{Ad}_{h^{-1}}(B_i\,dx^i)+h^{-1}dh\) has group
component \(-B_iY^ih\), and the vertical part contributes
\(\phi h\). This is E76 (11).
[E50, (5), (7)–(9)][e50].

In the fixed bundle charts \(\phi\) has order one and \(Y\) order
two with fixed smooth coefficients. The \(A_{0i}Y^i\) factor in
the lift has bound \(C_r\|a\|_{C^{r+2}}\). Each differentiated
\(a_iY^i\) product has bound \(C_r\|a\|_{C^{r+2}}^2\);
derivatives of the matrix tangent conversion are bounded on the
fixed group charts and add only lower derivatives of the fields.
The zero reference therefore has zero generator. Sobolev
embedding on the four-dimensional base uses
\(k>r+2+4/2=r+4\), which holds for
\(k\ge\max(6,r+5)\). The rate from the graph estimate then yields
\(\|W(u)\|_{C^r(\mathcal P)}\le C_{r,B(0)}e^{-\alpha u}\),
integrable in every fixed \(r\). This controls the generator of
\(j_{\rm st}\) directly. [E76, (11)–(13)][e76].

The finite-time flows are smooth equivariant diffeomorphisms on
the compact total space. A sufficiently late \(u_*\) makes the
remaining \(C^1\) integral small relative to one fixed nested
atlas. The map \(\widetilde j(u)=j_{\rm st}(u)j_{\rm st}(u_*)^{-1}\)
starts at identity at \(u_*\) and has the same direct equation.
Its displacement, and the same bound for its inverse, come
from the tail speed integral. Smaller starting coordinate sets
remain in compact interiors of their larger charts, including
the inverse points. The late start is a proof choice for the
given datum. It requires no additional smallness on the datum.

In charts, if \(Z' = W_i(u,Z)\), then
\((DZ)'=(DW_i)(u,Z)DZ\), with integrable coefficient.
For order \(r\ge2\), the chain rule has one leading term
\(DW_i(u,Z)D^rZ\). Each other term uses \(D^\ell W_i\) with
\(2\le\ell\le r\) and factors of \(Z\) differentiated only
through \(r-1\). Inductively those factors are bounded, so the
inhomogeneous remainder is bounded by \(C_{r,B(0)}\|W\|_{C^r}\).
Gronwall bounds \(D^rZ\) on the tail. Substituting into its
equation gives
\(\|\partial_u D^rZ\|_\infty\le C_{r,B(0)}e^{-\alpha u}\).
The same bound for orders zero and one follows directly.
Integration gives the error at rate \(e^{-\alpha u}\) to a
limit at each finite order. Taking uniform limits on small
coordinate segments identifies the successive derivatives.
All orders describe the same smooth map.

The first derivative determinant is
\(\exp(\int_{u_*}^u\operatorname{tr}(DW_i)(s,Z(s))\,ds)\)
and is bounded below by a positive constant. The bounded
first derivative and determinant give a uniform bound on
inverse derivatives. Hence the finite inverse maps are globally
Lipschitz in the fixed metric, by the length estimate on curves.
The limiting direct map is injective by the corresponding lower
distance bound, and surjective by taking a convergent subsequence
of finite inverse images of each target. Its inverse is smooth
by the inverse function theorem. Equivariance passes to the
limit. The limiting base map and its inverse come from smooth
local sections and bundle projection. Invertibility and convergence
of the base derivatives preserve the positive sign of the finite
base determinants. [E76, (14) and fixed-atlas argument][e76].

For inverse rates, the uniform inverse Lipschitz bound gives the
\(C^0\) error from the direct \(C^0\) error. In charts the first
inverse derivative is \([D\widetilde j(u)(\widetilde g(u))]^{-1}\).
At order \(r\ge2\), differentiate
\(\widetilde j(u)\circ\widetilde g(u)=\mathrm{id}\) and solve for
\(D^r\widetilde g(u)\) by the same inverse matrix. Other terms
only contain inverse derivatives through order \(r-1\) and direct
derivatives through \(r\). An order-\(\ell\) direct derivative
evaluated at the moving inverse point has an error bounded by
the direct \(C^\ell\) error plus the inverse \(C^0\) error
multiplied by the bounded derivative \(D^{\ell+1}\widetilde j_\infty\).
The latter estimate is local on the fixed chart interiors, with
the nested margins allowing the connecting coordinate segment.
The difference identity for inverses and induction on these
finite products then gives inverse \(C^r\) decay at rate
\(e^{-\alpha u}\). The extra limiting derivative is available
from the already completed direct induction. Composing the maps
on the right by \(j_{\rm st}(u_*)\), and the inverses on the left
by its inverse, preserves the per-order rates by smooth chain and
product rules on the compact bundle. [E76, inverse-rate
argument][e76].

## Original-flow basin, pullback order and metric limit

Use the existing E50 value threshold for \(m=6\): smooth \(A_{\rm in}\)
with
\(\|A_{\rm in}-A_0\|_{C^0}+\|F_{A_{\rm in}}-F_0\|_{C^0}<\epsilon\)
on the fixed native round bundle enters the E49 \(H^6\) basin
at the same fixed positive time \(\tau\). The compatible local
path is smooth through zero for each datum as established in
E50. This gives the finite-time smooth recovery with end map
\(c=g_{\rm loc}(\tau)\). E50 supplies the
smooth actual-flow overlap at the splice. On the tail \(u=t-\tau\),
the inverse to \(g(t)=c\,g_{\rm st}(u)\) is
\(j(t)=j_{\rm st}(u)c^{-1}\), so
\[
 (A(t),F_{A(t)})=j(t)^*(B(u),F_{B(u)}),\qquad
 j_\infty=j_{{\rm st},\infty}c^{-1}.
\]
In particular \(A_\infty=j_\infty^*A_0\) and
\(F_{A_\infty}=j_\infty^*F_0\). Stable \(C^{r+1}\) decay for
\(B-A_0\), the curvature graph, and bounded \(C^{r+1}\) maps give
\(C^r\) decay for pullbacks of the stable errors. Pullbacks of the
fixed smooth round pair have \(C^r\) error bounded by the
\(C^{r+1}\) map error, using one extra derivative of the fixed
round coefficients at the moving points. This verifies (16)
with \(\alpha\) in native elapsed time.
[E50, (3), (8)–(12)][e50] · [E76, (15)–(16)][e76].

For the metric, let \(\bar j(t)\) and \(\bar j_\infty\) be the
base maps of \(j(t)\) and \(j_\infty\). Native reconstruction
uses the self-dual plane spanned by the curvature and volume
\(\tfrac13\sum_i F_i\wedge F_i\) in internal orthonormal frames.
The equivariant bundle map preserves the internal pairing and
its base map preserves orientation. The plane and volume pull
back, which gives the exact equality
\[
 g^{\rm F}_{A(t)}=\bar j(t)^*g^{\rm F}_{B(u)},\qquad
 g^{\rm F}_{A_\infty}=\bar j_\infty^*g_0,\qquad
 \bar j_\infty=\bar j_{{\rm st},\infty}\circ\overline{c^{-1}} .
\]
On the fixed tube the reconstruction map is smooth. Its
mean-value formula and the product and chain rules give
\(g^{\rm F}_{B(u)}-g_0=O(e^{-\alpha u})\) in each fixed \(C^r\)
from the stable curvature bound. Composing with \(\bar j(t)\)
uses \(r+1\) derivatives of the base maps for the two metric
slots and yields the same per-order convergence rate. This
makes the metric consequence of E76 explicit. The metric is a
smooth pullback of the original fixed round metric. All these
conclusions use the original E50 \(m=6\) basin. Constants for
higher orders can depend on the datum, order, and finite local
recovery. [E48, native metric dependence][e48] ·
[E50, native setting and recovery][e50].

## Input versions

All five frozen inputs matched. No primary source was newly opened
or imported. Only this review and its return were written.

| Artifact | SHA-256 |
| --- | --- |
| [E77 request][req] | `498cb72e99a29dfda642204c76dde72f4e48cc91b36301420806547311d37990` |
| [E76][e76] | `2365f03b30b930c86952faf2503f9d03b30c05fbb9e5a1c75b4a4c18ad3a2ab0` |
| [E49][e49] | `45ed7b07731863a78a7d5c82fd150b27f28ec8ada8faf8769cb193e5606a1a16` |
| [E48][e48] | `b2b5f9cecc513d4eff4726f091883cb8995535513e05e57a4fc97e22aa421e8b` |
| [E47][e47] | `ddfb53f02f6e5059bd9e2d9bea8128cb50f4da5de90870d7f5b5ec4c69e301d6` |
| [E50][e50] | `ae7a4d7ae529ec298dd8517d5c36a8714799da3d89249c492c3e80eba63b81bf` |

[req]: ../research-progress/handoffs/SP4-CME-E77_REQUEST_v1.md
[e76]: ../notes/76_HIGH_ORDER_STABLE_LIMIT_20261122.md
[e49]: ../notes/49_FIXED_GAUGE_NONLINEAR_STABILITY_20261122.md
[e48]: ../notes/48_FIXED_STABILITY_GAUGE_20261122.md
[e47]: ../notes/47_ROUND_STABLE_LINEAR_20261122.md
[e50]: ../notes/50_SMALL_VALUE_STABILITY_TRANSFER_20261122.md
