# SP4-CME-E02C — pointwise volume and a realizable minimum-eigenvalue jet

22 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. The helper launch was configured as `gpt-6.2-sol` /
`ultra`. Backend identity and effort were not independently exposed. Lead
settings unavailable. This executes the two finite checks in the
[frozen request](../research-progress/handoffs/SP4-CME-E02C_REQUEST_v1.md).
Input hashes are in the [return](../research-progress/handoffs/SP4-CME-E02C_RETURN_v1.md).
The evidence is exact local algebra and analysis.

## Pointwise reconstructed volume preservation

Use a smooth SO(3) connection \(A\) on the oriented Euclidean rank-three
bundle \(E\), in the positive definite-plane region of the chosen orientation
on a smooth real four-manifold. The round-compatible convention is
\(F=-KQ^{1/2}\Sigma\), where \(K>0\) is fixed and the positive reconstructed
metric \(g=\widehat g_A\) satisfies
\[
 \Sigma_i\wedge\Sigma_j=2\delta_{ij}dV_g,\quad
 F_i\wedge F_j=Q_{ij}\mu_A,\quad
 \mu_A=\tfrac13\sum_i F_i\wedge F_i=2K^2dV_g,\quad \operatorname{tr}Q=3.
\]
All form-index adjoints and sharps below use \(g\). The fiber bracket is
\([e_i,e_j]=\epsilon_{ijk}e_k\), with \(e_i\) orthonormal. Write
\(q=Q-I\), \(R=q-|q|^2I/6\), and \(D=d_A\) on the endomorphism bundle.
Use an internal frame fixed in time and the unadjusted velocity
\(v=-4d_A^*(RF)\) in the manuscript clock. See
[Fine v2, §4.1, Proposition 4.2](https://arxiv.org/html/1111.5005v2#S4.SS1)
and the [assessed scale conversion](../reviews/E01_FOUNDATION_ASSESSMENT_20261122.md#normalization-correction-to-integrate).

### Direct contraction

For a self-dual two-form \(G\), define the skew map on covectors
\(J_G\beta=*(\beta\wedge G)=\iota_{\beta^\sharp}G\). With a normalized
self-dual frame \(\Sigma_i\) and \(J_i=J_{\Sigma_i}\), direct application in an
oriented orthonormal coframe gives \(J_iJ_j+J_jJ_i=-2\delta_{ij}I\).
Consequently
\[
 J_{F_i}J_{F_j}+J_{F_j}J_{F_i}=-2K^2Q_{ij}I.
\]
Since \(RF\) is self-dual and \(d_AF=0\),
\[
 v=4*d_A(RF)=4*((D R)\wedge F),\qquad
 v_i=4\sum_j J_{F_j}(D R)_{ij}.
\]
The one-form-valued matrix \(D R\) is symmetric because \(A\) is metric.
The antisymmetric part of \(J_{F_i}J_{F_j}\) cancels in the sum. Hence
\[
 *\sum_i v_i\wedge F_i
 =4\sum_{i,j}J_{F_i}J_{F_j}(D R)_{ij}
 =-4K^2\operatorname{tr}(Q D R)=0.
\]
Here \(\operatorname{tr}(Q Dq)=\operatorname{tr}(qDq)=\tfrac12d|q|^2\), and
\(\operatorname{tr}(QI)=3\), so the scalar correction in \(R\) cancels the
first term exactly. This is an identity for the flow vector field at every
smooth definite connection.

### Orthogonality from diffeomorphism invariance

Fix a smooth compactly supported vector field \(X\) on the base and consider
its \(A\)-horizontal lift to the orthogonal frame bundle. For the pullback
variation Cartan's formula gives \(a=\iota_XF\), since the connection form
vanishes on the horizontal generator. Fine uses the inverse action and the
opposite sign, which gives the same orthogonality equation. The integrand
\(|q|^2\mu_A\) pulls back by the corresponding bundle automorphism. Its
first variation under the flow of \(X\) is an exact form with compact
support. On a closed manifold use the full functional. On a local domain
containing the support in its interior use the same compactly supported
first variation and integration by parts. The reconstruction pairing is
\(\int\sum_i\langle a_i,b_i\rangle_g dV_g\). The flow is the negative
gradient in this pairing, so for all such \(X\)
\[
 0=\int\sum_i\langle v_i,\iota_XF_i\rangle_g\,dV_g
   =-\int\left(*\sum_i v_i\wedge F_i\right)(X)\,dV_g.
\]
Localization gives the same pointwise three-form identity. The horizontal
infinitesimal action is recorded in
[Fine v2, §3.2, Lemma 3.2 and equation (3.4)](https://arxiv.org/html/1111.5005v2#S3.SS2).

### Consequences and gauge dependence

For any connection velocity \(a\), write \(F_t=d_Aa\). The Bianchi identity
and invariant contraction give
\[
 \partial_t\mu_A=\tfrac23\sum_i(d_Aa)_i\wedge F_i
 =\tfrac23 d\sum_i a_i\wedge F_i.
\]
An arbitrary path therefore has a constant integral on a fixed closed base.
A path satisfying the unadjusted flow has the stronger result
\(\partial_t\mu_A=0\) and \(dV_{g(t)}=dV_{g(0)}\) as tensors on the same
fixed base, on its whole smooth definite interval. For the manuscript's
velocity matrix \(Z_{ij}=((d_Av)_i\wedge F_j)/\mu_A\) this gives
\(\operatorname{tr}Z=0\), so the normalized quotient evolves as
\(Q_t=Z+Z^T\). The reconstructed metric velocity has zero metric trace.
The pointwise-volume assertion is specific to the unadjusted vector field,
whereas `rec:invariant-velocities` in the
[manuscript](../manuscript/chiral_curvature_and_metric_evolution.tex) holds
for general paths.

A time-dependent internal gauge term \(d_A\eta\) preserves \(\mu_A\) because
\(\sum_i (d_A\eta)_i\wedge F_i=d\sum_i\eta_iF_i\). In contrast to the
unadjusted flow, its three-form primitive need only be exact. With a base
velocity added in the convention \(a=v+d_A\eta+\iota_XF\), the volume equation
becomes \(\partial_t\mu_A=\mathcal L_X\mu_A\), by
\(\iota_X\sum_iF_i\wedge F_i=2\sum_i(\iota_XF_i)\wedge F_i\).
A diffeomorphism-adjusted flow therefore transports this density with its
base gauge. The fixed volume form controls the determinant in a fixed
identification. Metric anisotropy, curvature and geometric noncollapse
still require estimates on the reconstructed metric. The prior
[boundary family](../reviews/E01C_AUDIT_20261122.md) illustrates anisotropy
alongside a nonzero volume density.

## Local connection jet with decreasing minimum eigenvalue

The construction uses a fixed Euclidean oriented chart near \(p=0\), a
trivial rank-three adjoint bundle in a smooth orthonormal trivialization,
and \(K=1\). Use the constant normalized self-dual triple
\[
 \Sigma^*_1=dx^{14}+dx^{23},\quad
 \Sigma^*_2=dx^{24}+dx^{31},\quad
 \Sigma^*_3=dx^{34}+dx^{12},
\]
where \(dx^{ab}=dx^a\wedge dx^b\), and its maps \(J_j\) as above. Set
\[
 Q_* = \operatorname{diag}(1/2,1,3/2),\qquad
 s_i=(Q_{*,ii})^{1/2},\qquad F^*_i=-s_i\Sigma^*_i.
\]
Thus \(\mu_*=2dV_{\mathrm{eucl}}\) and the reconstructed metric is Euclidean
at \(p\). For curvature arguments in the neighborhood use
\(M_{ij}=(F_i\wedge F_j)/(2dV_{\mathrm{eucl}})\), so \(Q=3M/\operatorname{tr}M\).
The derivative at \(F^*\) is \(\delta Q=\delta M-Q_*\operatorname{tr}(\delta M)/3\).

### The fixed-covector symbol

At \(p\) take a unit covector \(\xi\). For a curvature variation
\(\delta F_i=\xi\wedge V_i\), let \(W_{ij}=\langle V_i,J_j\xi\rangle\).
The initial triple is self-dual, which gives
\[
 \delta M_{ij}=-\tfrac12(s_j W_{ij}+s_i W_{ji}).
\]
The four covectors \(\xi,J_1\xi,J_2\xi,J_3\xi\) are an orthonormal basis.
Every symmetric trace-free matrix \(H\) is realized by
\(V_i=-\sum_j(H_{ij}/s_j)J_j\xi\), because then \(\delta M=H=\delta Q\).
This real symbol of the variation \(A\mapsto Q\) maps a twelve-dimensional
space onto a five-dimensional one, hence has a seven-dimensional kernel.
Its three internal-gauge directions are \(\xi\eta\), \(\eta\in E\).
For any tangent vector \(Y\), the four horizontal directions
\(V=\iota_YF^*\) give \(\delta M=\xi(Y)Q_*\) since
\(\xi\wedge\iota_Y(F_i^*\wedge F_j^*)=\xi(Y)F_i^*\wedge F_j^*\).
Their intersection with the internal-gauge directions is zero, because
for \(Y\ne0\) the three covectors \(J_iY^\flat\) are mutually orthogonal and
nonzero. Thus these two subspaces give the full kernel. Scaling treats
any nonzero \(\xi\). The short exact sequence is also in
[Fine v2, §3.3, Lemmas 3.3–3.5 and equations (3.6)–(3.7)](https://arxiv.org/html/1111.5005v2#S3.SS3).
The right inverse above is the one used for the specified jets.

### The cubic perturbation and spatial Hessian

Let \(\alpha_a=\tfrac12\iota_{\partial_a}F^*\) and use the affine
connection \(A^0=\sum_a x^a\alpha_a\), with \(dA^0=F^*\). Choose just one
trace-free Hessian direction
\[
 H=\operatorname{diag}(1/16,-1,15/16),\qquad
 V^a_i=-\sum_j(H_{ij}/s_j)J_j dx^a,
\]
and the polynomial connection \(A^T=A^0+\tfrac{T}{6}\sum_a (x^a)^3 V^a\)
for a real constant \(T>0\). At \(p\), all these connections have
\(A^T(p)=0\), \(F^T(p)=F^*\), \(\partial F^T(p)=0\), and the same first
connection derivative \(\partial_a A^T(p)=\alpha_a\). The reconstructed
metric and the volume have the same first jets for all \(T\), with
\(g(p)\) Euclidean and \(\partial g(p)=0\), since the reconstruction is a
smooth algebraic function of \(F\) in fixed coordinates. In particular
\(\partial Q(p)=0\), and the covariant Hessian differs from the coordinate
Hessian by the fixed differentiated connection term
\([\partial_a A_b,Q_*]\).

The curvature Taylor expansion, with \(F^T=dA^T+\frac12[A^T\wedge A^T]\), is
\[
 F^T=F^*+\tfrac12[A^0\wedge A^0]
           +\tfrac T2\sum_a (x^a)^2 dx^a\wedge V^a+O_T(|x|^4).
\]
The quadratic background bracket is exact, the cubic correction contributes
only the shown diagonal second derivatives, and its bracket with the affine
term is of order four. Explicitly, the fixed mixed as well as diagonal
background curvature Hessians are
\(\partial_a\partial_b F^0(p)=[\alpha_a\wedge\alpha_b]\), using the wedge
Lie bracket of degree-one forms. Define \(\Phi(F)=3M(F)/\operatorname{tr}M(F)\)
and \(B_{ab}=D\Phi_{F^*}([\alpha_a\wedge\alpha_b])\). Since the first
curvature derivatives vanish, the chain rule has no second-derivative term
quadratic in \(\partial F\) at \(p\). The right inverse just constructed yields
\[
 \partial_a\partial_b Q(A^T)(p)=B_{ab}+T\delta_{ab}H.
\]
The use of an explicit polynomial connection enforces the full curvature
Bianchi identities. There are no other free curvature jets assumed.
The fixed mixed terms \(B_{ab}\) are included in the eigenvalue Hessian.

The smallest eigenvalue is simple at \(p\), and is smooth on a sufficiently
small neighborhood by continuity of the spectral gap. Since the first
matrix derivatives vanish at \(p\), the first eigenvalue derivatives vanish
and the eigenvalue Hessian is the \((1,1)\) matrix entry of the Hessian of
\(Q\). Thus its Hessian at \(p\) is \(b+(T/16)I_4\) with
\(b=((B_{ab})_{11})_{a,b=1}^4\). Any \(T>16\|b\|_{\mathrm{op}}\) makes this
Hessian strictly positive, giving a strict spatial local minimum. The
polynomial is smooth and definite on some ball about \(p\) by continuity
of the positive curvature plane and its chosen sign. The ball can depend
on \(T\).

### Exact initial flow derivative

At each \(A^T\), evaluate the unadjusted flow vector field using the direct
formula \(v_i=4\sum_j J_{F_j}(D R)_{ij}\). All first derivatives of \(Q\)
vanish and \(A(p)=0\), hence \(v(p)=0\). The first jet of \(F\) and the
first jet of \(g\) agree for all \(T\). The exact \(T\)-dependent difference
of \(\partial_a(D R)_b\) at \(p\) is therefore
\(T\delta_{ab} R'_*(H)\), where
\[
 R'_*(H)=H-\tfrac13\operatorname{tr}(Q_*H)I.
\]
Indeed the remaining terms are the common background Hessian and the
commutator \([\partial_a A_b,R_*]\), with \(A(p)=0\). The reconstructed Hodge
maps in \(v\) contribute no \(T\)-dependent derivative here because their
values and first jets agree. This verifies the reaction and gauge terms
are included in the fixed baseline. At \(p\), \(F_t=d_Av=dv\). The difference
in \(F_{i,t}\) between \(A^T\) and \(A^0\), coming from the \(a\)-th summand, is
\[
 4T\sum_j(R'_*(H))_{ij}\,dx^a\wedge J_{F^*_j}dx^a.
\]
Insert this into the fixed-covector wedge variation above for
\(\xi=dx^a\), using \(J_{F_j^*}=-s_j J_j\). Its \(\delta M\) is
\(2T(R'_*(H)Q_*+Q_*R'_*(H))\), whose trace is zero by
\(\operatorname{tr}(Q_*R'_*(H))=0\). Thus each axis contributes exactly
\(T\mathscr L_{Q_*}(H)\), where
\[
 \mathscr L_Q(H)=2(QH+HQ)-\tfrac43\operatorname{tr}(QH)Q.
\]
With \(H\) as chosen, \(\operatorname{tr}(Q_*H)=7/16\) and
\((\mathscr L_{Q_*}H)_{11}=-1/6\). There are four axes, so the initial
flow derivative of the smallest eigenvalue at \(p\) is exactly
\[
 (Q_t(A^T)(p))_{11}=(Q_t(A^0)(p))_{11}-\tfrac23T.
\]
These are evaluations of the differential of the eigenvalue on the flow
vector field. The baseline is finite and can be evaluated from the fixed
jets \(F^*,\alpha_a,B_{ab}\) in the same first-derivative formula for \(v\).
For example, choose any symbolic parameter
\(T>1+16\|b\|_{\mathrm{op}}+\tfrac32|(Q_t(A^0)(p))_{11}|\).
This enforces both a strict spatial local minimum and a strictly negative
initial derivative at that point. The conclusion about the sign is also
unaffected by adding an infinitesimal internal gauge or base transport at
\(p\), since conjugation preserves eigenvalues and the first spatial
derivative of this eigenvalue vanishes there.

This connection realizes the adverse principal term with all its local
constraints. It rules out an assertion that the smallest eigenvalue always
has a nonnegative derivative at every interior spatial local minimum
solely from the unadjusted equation and smooth local definiteness. If a
smooth solution has this local initial data, its initial derivative must
have the computed sign. The construction and calculation are local in base
and evaluate one initial vector field, with no solution existence or global
extension premise. They leave quantitative preservation under additional
hypotheses and actual approach to loss of definiteness open.
