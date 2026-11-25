# What the source itself supplies on a balanced block

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex. Lead requested as GPT-6.2 Astra, ultra. The lead runtime does not independently expose its serving variant or reasoning setting. Delegated checks explicitly select gpt-6.2-sol, ultra. Working checkout `cec037fa20d8b9e74636e4c313e802df9f71bd3d`. [SEC §11.1](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L3868)


## An intrinsic volume bound before extracting a chart

Suppose $(M_i,g_i)$ are the smooth closed four-dimensional volume-one positive Yamabe minimizers of the fixed band. Write $Y_i=s_i\in[y_0,S]$, with $y_0=\sqrt{48\delta}$ and $S=Y_{\rm rd}$. For any center $x$ let $V(r)=\operatorname{vol} B(x,r)$. The Lipschitz function equal to one on $B(x,r/2)$, decreasing linearly to zero at radius $r$, is an admissible $H^1$ Yamabe test. Thus
$$
 y_0 V(r/2)^{1/2}\le (24/r^2+S)V(r).
$$
For any fixed $r_0>0$ and $r\le r_0$ put $v(r)=V(r)/r^4$. The inequality gives $v(r)\ge c\,v(r/2)^{1/2}$, $c=y_0/[4(24+S r_0^2)]$. Its $j$-fold iterate has right side $c^{2(1-2^{-j})}v(2^{-j}r)^{2^{-j}}$. Smoothness at each *individual* center implies $v(2^{-j}r)\to\omega_4$ as $j\to\infty$. Consequently
$$
 \operatorname{vol}_{g_i} B(x,r)\ge c^2 r^4\qquad(0<r\le r_0)
$$
uniformly in $i,x$. The earlier requests for noncollapse on candidate blocks can therefore use this ball lower bound directly. Ball-volume upper control, the area bound on an interval of geodesic sphere radii, injectivity, and a chart in which the metric and its first derivatives are close to those of a cone are additional questions. A ball intersecting a thin annular component need not be contained in that component.

Fix $0<r_1\le r_0$. A minimizing diameter geodesic of length $D_i$ contains $1+\lfloor D_i/(2r_1)\rfloor$ centers spaced $2r_1$ apart. Their open $r_1$-balls are disjoint. Unit total volume therefore gives $D_i<2/(c^2r_1^3)$. This uniform upper bound for the physical diameter does not give a rescaled upper ball-volume ratio.

## A region with two positive chiral masses

Let $\mu_i=|W^+|_{\rm HS}^2dV_i$ and fix a center $x_i$ and $\eta>0$ such that $2\eta<E_i=\mu_i(M_i)$. The distribution $r\mapsto \mu_i(B(x_i,r))$ is continuous. A positive-radius sphere of the distance function has four-volume zero, by a.e. differentiability, the unit norm of the gradient off the center and its a.e. vanishing on any level set of positive volume. Absolute continuity of $\mu_i$ then gives the claim. Choose radii $a_i,b_i$ attaining cumulative masses $\eta,E_i-\eta$. Suppose $b_i/a_i\to\infty$. For $N_i=\lfloor\log_2(b_i/a_i)\rfloor$ and fixed integer $m$, form disjoint $m$-shell blocks inside the middle half of the dyadic indices. Their number $p_i$ is at least $\lfloor(N_i/2-2)/m\rfloor$ for large $i$. The full Riemann curvature budget $\Lambda$ from SEC §11.1 yields one complete block $C_i$ with
$$
 \int_{C_i}|\mathrm{Rm}|^2_{\rm tens}\,dV_i\le\Lambda/p_i .
$$
If the sequence has vanishing total Bach norm, each such block also has vanishing $L^1$ Bach norm. The geometric selection and ball lower bound above do not need this last assumption. $m$ can be fixed large enough for the predetermined Yamabe buffers. Both $B(x_i,a_i)$ and $M_i\setminus B(x_i,b_i)$ lie outside the block and carry mass $\eta$ each. Separation of these two sets by a middle slice is a further requirement; an embedded chart on a small side branch need not do it.

## A finite test for the remaining chart problem

The outer quantile radius is bounded by the preceding diameter estimate. The entire selected middle block has outer radius at most $C_m b_i 2^{-N_i/4}$, tending to zero. Seek *one* oriented fixed-width embedded finite-quotient cone chart in $C_i$ whose middle slice separates those two sets, with protected buffers and
$$
 \|g_i^{\rm sc}-g_{\rm eucl}\|_\infty+
 \|D(g_i^{\rm sc}-g_{\rm eucl})\|_{L^4}\longrightarrow0
$$
in the Euclidean coordinates on the **lift** after a constant physical rescaling on a fixed normalized annulus. If derivative norms are measured downstairs, multiply by $|\Gamma|^{1/4}$ for the cover convention. Alternatively the downstairs-only critical derivative bound, with the physical curvature budget, suffices for the uniform Weyl straightening estimate of E07. Apply E08 first. Once the link is spherical, the derivative norms upstairs and downstairs coincide for the Yamabe comparison. One can more generally put the chart anywhere between the two quantile sets if their separation and these estimates are verified and both mass sets lie outside the splice regions. The Riemann budget used in [the first-order splice](E07_FIRST_ORDER_CAP_20261125.md) is then the physical source budget. The [signature test](E08_QUOTIENT_LINK_TEST_20261125.md) gives $\Gamma=1$ once the straightening costs less than the margin to $9\pi^2$. The Yamabe test and [two-sided mass estimate](E10_NONSPLITTING_MINIMIZERS_20261125.md) exclude this output on a putative nonstandard smooth type with $E_i\to I^+(M)$: each side has raw mass at least $\eta$, whereas one must have mass tending to zero. In particular, if this chart implication held for every equibounded pair of radii with separated quantiles in this source class, the log-width between those quantiles would stay bounded on minimizing families in that class. It is the chart implication that requires new geometry. This conclusion supplies neither a bound on the absolute concentration radius nor a classification of the case of bounded log-width.

Chang–Qing–Yang Theorem 3.1 uses exact Bach flatness, positive Yamabe gauge, $b_1=0$, a component meeting the outer sphere, inner area estimates and scale/energy inequalities. Its spherical-quotient output in the theorem's specified region is a benchmark for the proposed extraction. Passing only the two critical integrals and a ball-volume lower bound does not verify its hypotheses. [Theorem 3.1, pp. 9–10](https://arxiv.org/pdf/math/0508621)
