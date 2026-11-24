# Five first eigenfunctions and round recognition in four dimensions

24 November 2026, America/New_York. Prepared for Edward B. Baker III by the selected OpenAI lead. The lead retained the selected configuration; actual model identifier and effort were unavailable. Fixed proofs, estimates, examples and source comparisons were delegated to gpt-6.2-sol/ultra. The [register](../research-progress/REGISTER.md) points to the dated notes and [issued packets](../research-progress/handoffs/README.md). The checked inputs use HEAD f178fbb604f7f972b639fa8c1fc05f649c9bc8fc and individually hashed working-tree texts. [Source records](../../../../../references/SOURCE_NOTES_DIRAC_CONTINUATION_20261124.md)

## Fixed-metric recognition

Let $(M^4,g)$ be smooth, closed, connected, Riemannian and of volume one. Suppose $g$ realizes the Yamabe minimum of its conformal class. Write $s$ for its constant scalar curvature and $0<\lambda_1\le\lambda_2\le\cdots$ for the positive eigenvalues of $d^*d$, with multiplicity. Then
\[
 \boxed{\quad \frac35\sum_{i=1}^5\lambda_i-s\ \ge0,\qquad
        \frac35\sum_{i=1}^5\lambda_i=s
        \quad\Longleftrightarrow\quad (M,g)\text{ is homothetically round }S^4.\quad}
\]
No spin, orientation, Ricci bound, assumed map or positive Yamabe class is required. The second variation gives $s\le3\lambda_1$, so equality in the box forces $s=3\lambda_1>0$ and multiplicity at least five. The fourth variation gives the reverse multiplicity bound and a map recognizing the round metric. [E37](../notes/DIR_E37_20261124.md) · [E38](../notes/DIR_E38_20261124.md) · [independent proof and literature comparison](../notes/DIR_E39_20261124.md)

Here is the step in which minimizing the Yamabe quotient enters. Write $\lambda=\lambda_1=s/3$. For any $\Delta\phi=\lambda\phi$ with $\int\phi^2=1$ one has
\[
 \int\phi^4\le15/7,\qquad
 \int\phi^4=15/7\quad\Longrightarrow\quad
 \Delta(\phi^2-1)=(5\lambda/2)(\phi^2-1).
\]
The squared minimizing inequality is $\big[\int(u^2+2|du|^2/\lambda)\,dV_g\big]^2\ge\int u^4\,dV_g$. In $u=1+t\phi+t^2w$, the cubic coefficient forces $\int\phi^3=0$. At $w=\phi^2-1$ the quartic coefficient is $25-(35/3)\int\phi^4$. If it vanishes, varying $w$ gives the asserted centered-square equation. All products of three first eigenfunctions integrate to zero by polarization. [E37](../notes/DIR_E37_20261124.md)

For an orthonormal first basis $\phi_1,\ldots,\phi_d$, average the bound over its unit coefficient sphere. With $S=\sum_i\phi_i^2$ this gives
\[
 \frac{3d}{d+2}\le\frac{3}{d(d+2)}\int S^2\le\frac{15}{7}.
\]
Hence $d\le5$. At five, $S=5$ and every direction attains equality. The map $X=(\phi_1,\ldots,\phi_5)/\sqrt5$ takes values in $S^4$. Polarizing the centered-square equation gives
\[
 \langle dX_i,dX_j\rangle_g
       =\frac{\lambda}{4}(\delta_{ij}-X_iX_j).
\]
Its differential has rank four everywhere and $X^*g_{S^4}=(\lambda/4)g$. Compactness makes $X$ a covering of the unit sphere, hence a diffeomorphism. The round coordinate functions attain all inequalities. This proof uses no degree continuity. Carlotto–Chodosh–Rubinstein give the cubic reduction for degenerate metrics; Obata's classical criterion assumes a Hessian equation. The limited primary search established no priority for the quartic argument here. [E38](../notes/DIR_E38_20261124.md) · [E39](../notes/DIR_E39_20261124.md)

## Consequence for the coupled Dirac comparison

Resume the oriented smooth homotopy-sphere hypotheses of [E14](../notes/DIR_E14_20261124.md). For a smooth degree-one sphere map $f$, let $Y_f$ be the modified Yamabe quotient infimum with potential $s-3|df|^2$. Balance means $\int f=0$, and put $C_f=\int ff^T$. Every degree-one map can be precomposed with a smooth orientation-preserving diffeomorphism to achieve both balance and $C_f=I/5$. A tilt by the 19 independent first and trace-free second moments and volume-form transport give this even for pushforwards with atoms. Derivatives of the transport can grow without bound along a sequence. [E40](../notes/DIR_E40_20261124.md)

If $C_f\ge\delta I$ with $0<\delta\le1/5$, orthonormalize the five coordinates in $L^2$, apply the eigenvalue trace principle, and test $Y_f$ with $u=1$. This yields
\[
 Y_f\le s-3\lambda_1-3\delta\sum_{i=2}^5(\lambda_i-\lambda_1).
\]
The upper bound is strictly negative on every fixed nonround minimizing metric. In particular, for the balanced class with $C_f=I/5$, the supremum equals zero exactly on the round metric up to homothety, where an orientation-preserving homothety attains it. No Jacobian or fourth-energy hypothesis is needed for this recognition. On any fixed nonround minimizing metric, a balanced sequence approaching zero must lose a covariance direction. Its E14 limit has proper linear span. A full-span degree-zero first-eigenmap at the supplied scalar equality is excluded. The existence of a lower-span example on a nonround smooth homotopy sphere remains open. [E41](../notes/DIR_E41_20261124.md)

## Tests on the remaining degree alternatives

| Tested input | Assessed consequence |
| --- | --- |
| First eigenmap into a great $S^2$ at scalar equality | The Hopf circle connection gives $\lambda^{(1)}_{\rm coex}<\lambda_1/4=s/12$. Rank two occurs on an open dense set, and rank one occurs somewhere. There a Ricci direction has curvature $-|\nabla dF|^2/\lambda_1\le0$. Either a sufficiently large coexact gap or positive Ricci excludes this case. The two checked products separate the hypotheses. [E18](../notes/DIR_E18_20261124.md), [E19](../notes/DIR_E19_20261124.md), [E20](../notes/DIR_E20_20261124.md), [E21](../notes/DIR_E21_20261124.md) |
| Great $S^3$, full target, and smooth metric stresses | A degree-zero map pulls back the quaternionic Hopf bundle trivially. The energy of every lift connection is at least $\lambda_1/4$; on a fixed full-span first eigenmap the lower bound is strict, but curvature includes $a\wedge a$. A separate finite stress test detects homothety by metric variation. B20 settles the full-span case at Yamabe equality without these additional estimates. [E22](../notes/DIR_E22_20261124.md), [E23](../notes/DIR_E23_20261124.md) |
| Smooth degree-one maps with strong $W^{1,2}$ limit $F$ and bounded fourth energy | The signed Jacobian defect consists of finitely many atoms, each of integer multiplicity $k$. The fourth-energy defect at each costs at least $16\,\mathrm{Vol}(S^4)|k|$. Globally $\liminf\int|df_j|^4\ge\int|dF|^4+16\,\mathrm{Vol}(S^4)|1-\deg F|$. Balanced bubble recovery attains the coefficient. A strict per-atom cap retains degree; diffuse excess energy may remain. [E24](../notes/DIR_E24_20261124.md), [E25](../notes/DIR_E25_20261124.md), [E30](../notes/DIR_E30_20261124.md) |

The earlier [B05 assessment](DIR_B05_CONSTRUCTION_ASSESSMENT_20261124.md) remains the record for the original unrestricted infima. The independent [punctured Dirac assessment](DIR_B19_GREEN_BOUNDARY_ASSESSMENT_20261124.md) gives a field that exists on every input and identifies the derivative estimate it still lacks.

## Near equality across changing minimizing metrics

Suppose $g_j$ are smooth unit-volume Yamabe minimizers with $s_j>0$ and
\[
 \epsilon_j=3\lambda_5(g_j)/s_j-1\longrightarrow0.
\]
Choose any orthonormal basis $u_1,\ldots,u_5$ of the first five modes in eigenvalue order and set $X=(u_i)/\sqrt5$. Each $X$ maps into $\mathbb R^5$; it need not be sphere-valued. **The laws $X_*(dV_{g_j})$ converge weakly to uniform probability on the unit $S^4$.** The domain may vary, and the conclusion gives neither a lower injectivity radius nor a differentiable limit map. [E42](../notes/DIR_E42_20261124.md) · [E43](../notes/DIR_E43_20261124.md) · [E44](../notes/DIR_E44_20261124.md)

To specify what is controlled, let $L=3\Delta_g/s$, $\Gamma(u,v)=(3/s)\langle du,dv\rangle_g$, and $\|w\|_H^2=\int(w^2+\Gamma(w,w))$. The minimizing inequality gives a uniform embedding $H\hookrightarrow L^4$ in these units. Iteration on the first five scalar equations gives a uniform $L^\infty$ bound. Averaging the quartic test in the two signs of $t=\epsilon^{1/4}$ gives
\[
 \left|\int\phi^4-15/7\right|\le C\sqrt\epsilon,\qquad
 \|\,|X|^2-1\,\|_2\le C\epsilon^{1/4}
\]
for every unit coefficient direction $\phi=\sum a_i u_i$. Perturbing the quadratic correction in the quartic test gives, including constant tests,
\[
 \left\|\Gamma(X_i,X_k)-\tfrac14(\delta_{ik}-X_iX_k)\right\|_{H^*}
 \le C\epsilon^{1/4}.
\]
Compositions with fixed smooth target derivatives have uniformly bounded $H$ norm. Consequently, a subsequential law $\mu$ is supported on the unit sphere and satisfies
$4\int x_i h\,d\mu=\int(\delta_{ik}-x_ix_k)\partial_k h\,d\mu$ (sum on $k$). On homogeneous polynomials of degree $m>0$, this determines moments recursively by $m(m+3)\int P\,d\mu=\int\Delta_{\rm Eucl}P\,d\mu$. Uniform sphere measure satisfies the same identity, and restrictions of polynomials are dense. [Independent proof review](../notes/DIR_E47_20261124.md)

For the spectral gap $A=(3/5)\sum\lambda_i-s$ in the box, $A/s\le\epsilon\le5A/s$ when $s>0$. Thus the *relative* gap must vanish for the varying-metric conclusion. Absolute gaps tending to zero can be insufficient if $s$ tends to zero. If one independently has $\operatorname{Ric}_g\ge(1-\delta)(s/4)g$, the rescaled metric $(1-\delta)sg/12$ has $\mathrm{Ric}\ge3g_{\rm rescaled}$. Aubry’s theorem applies once $4(\epsilon+\delta)/(1-\delta)$ is below his dimension-four threshold. This gives actual smooth recognition and a Gromov–Hausdorff estimate. The weak Gram identity supplies no such pointwise premise. [E45 and the primary theorem](../notes/DIR_E45_20261124.md)

## Remaining global gap

There is a recognizing equality on a supplied metric and a spherical joint law under relative near equality. The investigation has neither produced a positive-scalar Yamabe minimizing family with relative five-eigenvalue gap tending to zero on every smooth homotopy four-sphere nor shown that such pinching alone detects a region of vanishing volume carrying nonstandard smooth geometry. An attained zero gap would settle recognition at once. The punctured Dirac construction provides a boundary field on every input, but supplies neither the spectral condition nor the missing geometric compactness. [Continuation](../continuation-notes/02_AFTER_FIVE_EIGENFUNCTION_RIGIDITY_20261124.md)
