# SP4-TWA-E02 · Flat periodic torus cylinder

28 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. This fixed E derivation follows [request v1](../research-progress/handoffs/E02_REQUEST_v1.md), which records the lead selection as GPT-6.2 Astra/ultra and the helper configuration as GPT-6.2 Sol/ultra. Actual backend model and reasoning effort were unavailable. HEAD was `280376dd7a1820fa2878d0ab0ee2e639facb2eeb` and all six frozen SHA-256 digests matched. The result is an analytical replay for one flat product and a two-dimensional real endpoint space.

## Radial action and unique radial solution

Let \(M=[0,L]\times T^3\) with \(L>0\), its oriented flat Riemannian product metric, and the periodic spin structure on the flat torus of volume \(V>0\). Use the positive half-spin bundle \(S^+\) on which real self-dual two-forms act. Fix a unit parallel spinor \(\psi_0\). Use the Levi–Civita spin connection, \(X\cdot X=-|X|^2\), \(D=\sum_i e_i\cdot\nabla_{e_i}\) and \(P_X=\nabla_X+\tfrac14 X\cdot D\). The real spinor pairing \((\, ,\, )_{\mathbb R}\) is the real part of the Hermitian pairing. The [branch conventions](../research-overview/OVERVIEW.md) use \(S=J_g^4\), four times the [inherited action](../../02_invariants/notes/RELATIVE_TWISTOR_ACTION.md#a-boundary-relation-on-a-flat-product).

Use \(e_0=\partial_t\) and a global parallel orthonormal torus frame \(e_1,e_2,e_3\). For \(\psi=e^{u(t)}\psi_0\) and \(v=u'\), the Dirac term is \(D\psi=e^u v\,e_0\cdot\psi_0\). Therefore

\[
 (P\psi)(e_0)=\frac34 e^u v\,\psi_0,\qquad
 (P\psi)(e_a)=\frac14 e^u v\,e_a\cdot e_0\cdot\psi_0\quad (1\le a\le3).
\]

All the Clifford products in the second formula preserve the norm on unit vectors. The component sum gives \(|P\psi|^2=(9+3)e^{2u}v^2/16=3e^{2u}v^2/4\). Hence

\[
 S_{\mathrm{rad}}[u]=\frac{9V}{16}\int_0^L |u'|^4\,dt .
\]

The fixed-end radial Euler–Lagrange equation is \(((u')^3)'=0\). The real cube is injective, so every smooth radial stationary path is affine, including at zero momentum. For \(\Delta=u_1-u_0\) the solution and its action are

\[
 u_*(t)=u_0+\frac{\Delta}{L}t,\qquad
 S_{\mathrm{cl}}(u_0,u_1)=\frac{9V}{16L^3}\Delta^4 .
\]

The strict convexity of \(v\mapsto v^4\) also gives \(\int_0^L |u'|^4\,dt\ge L|\Delta/L|^4\), with equality only at the constant velocity. Thus the path is the unique radial minimizer, also among \(W^{1,4}\) logarithms with these endpoints.

## Full first variation and the spinor-valued normal density

For any smooth zero-free \(\psi\) on this compact product, the variation \(\psi+s\eta\) remains zero-free for sufficiently small real \(s\) for each smooth \(\eta\in\Gamma(S^+)\). Differentiating both factors of the integrand yields

\[
 \delta S(\psi;\eta)=4\int_M
 \left((W,P\eta)_{\mathbb R}
 -\frac{|P\psi|^4}{|\psi|^6}(\psi,\eta)_{\mathbb R}\right)dV_g ,
 \qquad W=|\psi|^{-4}|P\psi|^2P\psi .
\]

The Clifford trace of \(W\) vanishes because \(\sum_i e_i\cdot(P\psi)(e_i)=D\psi-D\psi=0\). Clifford skew-adjointness then gives \((W,P\eta)_{\mathbb R}=(W,\nabla\eta)_{\mathbb R}\). Integrating by parts gives the bulk coefficient \(4(-\sum_i \nabla_{e_i}W(e_i)-|\psi|^{-6}|P\psi|^4\psi)\) in this parallel frame, and the boundary covector density

\[
 \mathcal P_\nu(\eta)=4(W(\nu),\eta)_{\mathbb R}\,dA_g .
\]

For every radial \(u\), the torus derivatives of \(W\) vanish in the parallel frame, and

\[
 W(e_0)=\frac9{16}e^{-u}v^3\psi_0,\qquad
 -\partial_t W(e_0)-|\psi|^{-6}|P\psi|^4\psi
 =-\frac9{16}e^{-u}(v^3)'\psi_0 .
\]

In the last identity, differentiating \(e^{-u}\) produces the term \((9/16)e^{-u}v^4\psi_0\), exactly canceled by the differentiated denominator. Thus \(u_*\) solves the full bulk equation pointwise. For every smooth spinor variation \(\eta\) with zero end traces, the boundary term vanishes as well, including for variations with torus dependence and components perpendicular to the real ray.

Put \(\sigma_0=-1\), \(\sigma_1=+1\), so that \(\nu=\sigma_i e_0\) on end \(i\). On \(\psi_*=e^{u_*}\psi_0\), the unintegrated density, with the real metric identification of covectors, is

\[
 4W(\nu)\,dA_g=\sigma_i\,\frac94 e^{-u_i}v^3\psi_0\,dA_g,\qquad
 v=\Delta/L .
\]

The trace parametrization \(u_i\mapsto e^{u_i}\psi_0\) sends a scalar variation \(\delta u_i\) to \(e^{u_i}\delta u_i\,\psi_0\). Pairing before integrating over the torus gives \(\sigma_i(9/4)v^3\delta u_i\,dA_g\). The integrated scalar covector at the end is \(q_i=\sigma_i p\), with

\[
 p=\frac{9V}{4}v^3=\frac{9V}{4L^3}\Delta^3,\qquad
 dS_{\mathrm{cl}}=-p\,du_0+p\,du_1 .
\]

## Endpoint graph and its projections

In \(T^*(\mathbb R\times\mathbb R)\) with outward covectors, this is the graph of \(dS_{\mathrm{cl}}\). It is an embedded real-analytic surface. Pulling back the tautological one-form \(\theta=q_0\,du_0+q_1\,du_1\) gives \(dS_{\mathrm{cl}}\), and the pullback of \(-d\theta\) vanishes. The ambient dimension is four, so the surface is exact Lagrangian everywhere. In the incoming/outgoing convention use \(p_{\rm in}=-q_0=p\) and \(p_{\rm out}=q_1=p\). The signed product then has tautological one-form \(-p_{\rm in}\,du_0+p_{\rm out}\,du_1\) and the canonical relation is

\[
 \Lambda_L=\{(u_0,p;u_0+Lv,p)\mid u_0,v\in\mathbb R,\ p=(9V/4)v^3\}
 \ \subset\ (T^*\mathbb R)^-\times T^*\mathbb R .
\]

The projection to the pair of endpoint positions is a diffeomorphism even at equal endpoints. The projections to either incoming or outgoing phase space have rank two for \(v\ne0\) and rank one at \(v=0\), since \(dp/dv=(27V/4)v^2\). At unequal endpoints, \(p\) has the sign of \(\Delta\) and the phase-space map is a smooth exact symplectomorphism on \(p\ne0\). At equal endpoints it is the identity on \(p=0\), and the relation remains analytic in \((u_0,v)\). As a phase-space map on all of \(T^*\mathbb R\) it is the homeomorphism

\[
 (u_0,p)\longmapsto\big(u_0+L\,\sqrt[3]{4p/(9V)},\ p\big).
\]

The inverse velocity is \(1/3\)-Hölder at zero with optimal exponent. Its difference quotient there has magnitude \((4/(9V))^{1/3}|p|^{-2/3}\), so neither the phase-space map nor its inverse is differentiable across \(p=0\). For the endpoint function,

\[
 \operatorname{Hess} S_{\mathrm{cl}}=
 \frac{27V}{4L^3}\Delta^2
 \begin{pmatrix}1&-1\\-1&1\end{pmatrix}.
\]

It has rank one at unequal endpoints and vanishes on the diagonal. This degeneracy concerns the velocity and momentum, and the endpoint graph itself retains its dimension everywhere.

## Minimization and evidence scope

At equal endpoints, the parallel field attains the absolute minimum zero among all smooth zero-free spinors with the prescribed traces. The same conclusion holds if the admissible class permits isolated interior zeros. In either class, zero action implies \(P\psi=0\) on the nonzero locus and everywhere by continuity. In the parallel frame write \(\Delta_g=\sum_i\partial_i^2\). Taking the divergence of the twistor equation gives \(\Delta_g\psi=-\tfrac14D^2\psi=\tfrac14\Delta_g\psi\), so \(\psi\) is harmonic. Subtract the parallel field with the common boundary value, multiply the harmonic equation by the difference and integrate by parts. The zero traces imply zero Dirichlet energy for the difference, proving uniqueness of the zero-action spinor. The same argument implies that zero action is impossible for unequal radial endpoint values, since a harmonic spinor with the prescribed constant end traces is the affine spinor interpolant and its nonzero time derivative gives \(P\psi(e_0)\ne0\). A positive lower bound for the full unequal-end problem and full minimization by \(\psi_*\) remain open here. Full critical-set classification and a boundary relation for general spinor traces belong to [TWA-B01](../research-plan/PLAN.md).

The frozen [DIR-E06, Clifford convention](../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E06_20261124.md), [DIR-E07, Clifford projection](../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E07_20261124.md), and [DIR-E10, restricted Clifford trace](../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E10_20261124.md) were inspected. Primary passages checked on 28 November 2026 were Friedrich §1 equation (1.1) and §2 Example 2 for the twistor convention and flat-model comparison, and Vankerschaver–Liao–Leok §4 Theorems 4.1–4.2 for the generating-functional context. The Lagrangian dimension, outward sign and projection test follow directly from the finite-dimensional formulas above. Biran–Cornea Definition 2.1.1 and the cylindrical-end definition in §4.1 were read for their geometric scope. [Friedrich](https://dml.cz/bitstream/handle/10338.dmlcz/701462/WSGP_09-1989-1_7.pdf#page=2) · [Vankerschaver–Liao–Leok, arXiv:1111.0280v2, §4](https://arxiv.org/html/1111.0280v2#S4) · [Biran–Cornea](https://dms.umontreal.ca/~cornea/lcob1-JAMS.pdf#page=2)
