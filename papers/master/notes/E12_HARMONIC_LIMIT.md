# SP4-MASTER-E12 · Physical energy radius and harmonic regularity

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E execution for B04. The handoff requested GPT-6.2 Sol/ultra. Actual serving model and effort are unavailable. Upstream mathematical inputs are frozen at `fc60509a27f6b97f48e2619f9e6f0f6cd4eb36e2`, and the master main input matches `a499b313e6d5`. This note verifies the source-to-limit implication and checks its hypotheses against the separate E11 complete-limit exclusion. [Frozen E12 request](../research-progress/handoffs/E12_HARMONIC_LIMIT.md) · [E08 local replacement](../reviews/E08_LOCAL_REPLACEMENT_CHECK.md) · [E11 complete-limit exclusion](../reviews/E11_COMPLETE_LIMIT_CHECK.md)

## Claim and hypotheses

Fix a hypothetical nonstandard closed oriented smooth homotopy four-sphere $M$ with a positive Yamabe class below $8\pi^2$. Let $g_i$ be smooth volume-one physical Yamabe metrics on $M$ with $R_{g_i}=Y_i\in[y_0,Y_{\rm rd}]$, $y_0>0$, and chiral energies $e_i=E_+(g_i)=E_-(g_i)\to I^+(M)$ in the fixed band $4\pi^2\le e_i\le8\pi^2-\delta$, $\delta>0$. The energy uses the Hilbert–Schmidt norms of the two Weyl endomorphism blocks. Let $r_i$ be the minimum physical radius of any ball carrying $e_i/2$ in positive chiral energy, and $p_i$ be a center attaining that value. Geodesic spheres have volume measure zero, so the smooth chiral measure of a ball is continuous in center and radius. Compactness of $M$ then gives such a center. Suppose $r_i\downarrow0$ along a subsequence, and for each fixed $A<\infty$ suppose

$$
 \sup_{B_{g_i}(p_i,A r_i)} |\operatorname{Rm}_{g_i}| \le C_A r_i^{-2}
 \tag{1}
$$

on the same subsequence, with $C_A$ allowed to vary with $A$. One may drop the nonstandard assumption for the source-to-limit implication if $\liminf e_i>0$ is supplied. That lower bound is used to force nonflatness. [Master variational conventions and band](../research-overview/OVERVIEW.md#the-variational-problem-on-a-fixed-smooth-type)

Under these hypotheses there is a complete connected smooth oriented nonflat scalar-flat Bach-flat pointed limit $(X,h,p)$ with smooth oriented embeddings of neighborhoods of its whole compact exhaustions. The pulled-back metrics $r_i^{-2}g_i$ converge locally uniformly and strongly in $W^{1,4}$, and weakly in local $W^{2,q}$ for finite $q>1$. On any fixed compact the source chiral densities converge strongly in $L^1$. Applying the E11 complete-limit exclusion under these first-order marked hypotheses contradicts (1). The argument below derives the smoothness of the limit and first-order convergence of the source. It gives no pointwise convergence of the source curvatures.

## Noncollapse and pointed markings

Write $\widehat g_i=r_i^{-2}g_i$ and $\widehat s_i=r_i^2Y_i\to0$. Discard finitely many indices so $0\le\widehat s_i\le Y_{\rm rd}$. The Yamabe inequality, unchanged by constant scale, reads

$$
 y_0 \|u\|_{L^4(\widehat g_i)}^2
 \le 6\|du\|_{L^2(\widehat g_i)}^2+\widehat s_i\|u\|_{L^2(\widehat g_i)}^2 .
$$

For any center $x$, take a Lipschitz cutoff equal to one on $B(x,s/2)$, zero outside $B(x,s)$, with gradient at most $2/s$, where $0<s\le1$ and distances are for $\widehat g_i$. Smooth approximation justifies the inequality. Write $v_x(s)=s^{-4}\operatorname{Vol} B(x,s)$. The cutoff gives $v_x(s)\ge c\sqrt{v_x(s/2)}$ for a common $0<c<1$. Iterate at fixed $i,x$ and use $v_x(s/2^m)\to\omega_4$ as $m\to\infty$. This gives $\operatorname{Vol} B(x,s)\ge c^2s^4$ uniformly. [Yamabe inequality and scalar transformation, Lee–Parker §2](https://users.math.msu.edu/users/parker/YamabeProblem.pdf)

For centers in any fixed ball about $p_i$, apply the local Cheeger–Gromov–Taylor loop estimate and the conjugate-radius lower bound in a buffered ball. The hypotheses there are a local sectional curvature bound, relative compactness and a lower volume bound at a fixed small radius. They hold by (1), completeness and the cutoff estimate. This gives a uniform injectivity radius on each such ball. Bishop comparison on the larger bounded-curvature ball also gives an upper bound for its volume. Anderson–Cheeger's local $W^{1,p}$ harmonic radius theorem for any fixed $p>4$ now supplies harmonic charts with a uniform radius, uniform ellipticity and a uniform $W^{1,p}$ bound on the metric components. Its local size $s_M(x)$ in (0.6) is bounded below on the inner balls by the buffered injectivity bound. The hypothesis on the lower Ricci bound is used locally, as in Remark (2) preceding the definition of harmonic radius and in the compact-domain application. These conclusions involve no bound on the total scaled volume $r_i^{-4}$. [Cheeger–Gromov–Taylor, J. Differential Geom. 17 (1982), pp. 45–46, Theorem 4.3 and the preceding injectivity discussion](https://projecteuclid.org/journals/journal-of-differential-geometry/volume-17/issue-1/Finite-propagation-speed-kernel-estimates-for-functions-of-the-Laplace/10.4310/jdg/1214436699.pdf#page=32) · [Anderson–Cheeger, J. Differential Geom. 35 (1992), pp. 266–269, equation (0.5) and Theorem 0.3](https://doi.org/10.4310/jdg/1214448075) · [Inspected Anderson–Cheeger copy](https://electronicsandbooks.com/edt/manual/Magazine/J/Journal%20of%20Differential%20Geometry/1992/35-2-265.pdf#page=4)

Here are the regularity and domain details for the pointed application of harmonic compactness. In each harmonic chart the local metric $m_i$ satisfies

$$
 m_i^{ab}\partial_a\partial_b (m_i)_{cd}
 =-2(\operatorname{Ric}_{m_i})_{cd}+Q_{cd}(m_i^{-1},\partial m_i),
 \tag{2}
$$

where $Q$ is quadratic in first derivatives. Start with $p>8$ in the harmonic radius theorem. The coefficients are uniformly Hölder by Sobolev embedding and the right side of (2) is uniformly bounded in $L^{p/2}$ by (1) and the $W^{1,p}$ bound. Interior elliptic estimates then give uniform $W^{2,p/2}$, hence $C^{1,\alpha}$ for a fixed $0<\alpha<1-8/p$ on smaller charts. Reinserting this first-derivative bound in (2) gives uniform $W^{2,q}$ on smaller charts for each finite $q>1$. Harmonic coordinate transitions solve the homogeneous scalar harmonic equation for each component, and have uniform $C^{3,\alpha}$ bounds on trimmed overlaps by interior Schauder in the same harmonic gauge. Use finite nets on growing balls, with uniformly bounded cardinality for each fixed radius by the lower small-ball volume bound and the upper volume bound on the buffered ball. The local compact-domain harmonic chart gluing therefore applies radius by radius: extract convergent metrics and transitions on smaller chart domains, glue the limiting charts, and diagonalize across the radii. The limit is a connected pointed length manifold without boundary. Its bounded closed balls are compact by the same finite-net bounds and the pointed exhaustion, so it is complete. Initially the atlas has $C^{3,\beta}$ transitions and the metrics converge locally in $C^{1,\beta}$ for $0<\beta<\alpha$, hence also in $W^{1,4}$. Weak $W^{2,q}$ convergence follows after extraction. Scalar and curvature limits are taken in these local harmonic charts. [Belegradek–Kapovitch, arXiv:math/0002028v1, Theorem 3.1 and proof, compact-domain chart gluing](https://arxiv.org/pdf/math/0002028#page=6) · [Avalos–Cogo–Royo Abrego, equation (4.1), harmonic Ricci identity](https://arxiv.org/html/2610.35257v1#S4)

Once $h$ is proved smooth in the limiting harmonic charts below, their transitions are smooth as solutions of $\Delta_h x^a=0$. For clarity, the smooth whole-domain embeddings in the chart-gluing argument can then be obtained by the Euclidean embedding of a finite atlas with blocks $(\eta_a,\eta_a x^a)$, using cutoffs $\eta_a$ supported inside chart domains and positive on a cover of a neighborhood of the chosen compact. Use the same coordinate formulas on the corresponding source charts. In each such chart the resulting map converges in $C^{3,\beta}$ on smaller domains, by the transition control. Project from a tubular neighborhood of the smoothly embedded limit onto the limit and invert on an interior neighborhood of the compact. Local inverse maps exist on a common radius after shrinking. They agree globally there: distinct nearby preimages are excluded by the local inverse theorem, and preimages separated by a fixed distance are excluded by compactness and injectivity of the limiting Euclidean embedding. The source maps can be oriented and arranged to take $p$ to $p_i$ by a small coordinate adjustment. These embeddings inherit local $C^{1,\beta}$ and weak $W^{2,q}$ metric convergence by the chart change formula and the $C^{3,\beta}$ comparison of the maps. One can use a growing diagonal in the exhaustion index. For fixed $R$, choose a compact containing a neighborhood of the closed $h$-ball of radius $R+1$. Any source path starting at $p_i$ that leaves the image of the open $h$-ball of radius $R+1$ must spend length at least $(1-o(1))(R+1)$ before first exit, by pulling back that segment and using local uniform metric comparison. Thus the image of the fixed compact contains the entire $\widehat g_i$-ball of radius $R$ for large $i$.

## Removing the chiral defect at a rough limit

Use a compactly supported chart cutoff $0\le\chi\le1$ within one of the marked harmonic charts, and let $m_i$ denote the smooth pulled-back metrics there. Let $q>4$ and approximate the positive definite $h$ by smooth positive definite $h_j$ on a neighborhood of the cutoff support with $h_j\to h$ strongly in $W^{2,q}$. The latter implies uniform and strong $W^{1,4}$ convergence. Define, for $0\le t\le1$,

$$
 a_t=1-t\chi,\qquad n_{i,t}=a_tm_i+(1-a_t)h,\qquad
 n_{i,t,j}=a_tm_i+(1-a_t)h_j.
$$

Only $n_{i,t,j}$ is transplanted back to a smooth metric $G_{i,t,j}$ on the original $M$. In the local comparison it is scaled by $r_i^2$ and equals the original metric near the chart boundary. The argument requires a smooth local chart map for each $i$, which is already available before completing the whole-domain gluing.

In fixed coordinates, $\mathcal R(m)=L(D^2m)+Q_m(Dm,Dm)$ for all-lowered curvature, where $L$ has constant coefficients. Denote by $F_\pm(m)$ the corresponding chiral Weyl matrix times the square root of the volume density, so $|F_\pm(m)|^2dx$ is chiral energy. The product rule for the cutoff yields the same E08 curvature interpolation for rough $n_{i,t}$: both derivative commutators with $a_t$ converge strongly to zero in $L^2$, and all lower-jet curvature terms converge strongly by the strong $W^{1,4}$ and uniform convergence. The chiral projection coefficients converge uniformly. Thus, uniformly in $t$,

$$
 F_\pm(n_{i,t})=a_t F_\pm(m_i)+(1-a_t)F_\pm(h)+o_{L^2}(1).
 \tag{3}
$$

Weak $W^{2,q}$ implies weak $L^2$ convergence of the all-lowered curvature and hence of each $F_\pm(m_i)$. Also $n_{i,t,j}-n_{i,t}=(1-a_t)(h_j-h)$ is small strongly in $W^{2,q}$ **uniformly** in $i,t$. On the cutoff region the metrics are uniformly elliptic, and the $W^{2,q}$ norms are bounded independently of $i,t,j$ for large indices. The formula for $\mathcal R$ and algebraic smoothness of the projection therefore give $\|F_\pm(n_{i,t,j})-F_\pm(n_{i,t})\|_2\le C\|h_j-h\|_{W^{2,q}}$. Write $\eta_j\to0$ for the resulting uniform bound on the change of the local integrated energy. If $D_i=F_\pm(m_i)-F_\pm(h)$, (3) and weak convergence give

$$
 e_i-E_\pm(G_{i,t,j})
 =\int (2t\chi-t^2\chi^2)|D_i|^2dx+o_i(1)+O(\eta_j).
 \tag{4}
$$

The cross term is $2t\int\chi\langle F_\pm(h),D_i\rangle$, which converges to zero uniformly in $t$. For $j$ large so the error is less than half the fixed band margin, the whole smooth path has energy strictly below $8\pi^2$ for large $i$. Its Yamabe class remains positive because a sign crossing would supply a scalar-flat conformal metric on the closed same smooth type, whose Gauss–Bonnet and signature identities force $E_+\ge8\pi^2$. This is the E08 positivity argument on the actual smooth path. Minimality at $t=1$ gives $\limsup_i\int(2\chi-\chi^2)|D_i|^2\le C\eta_j$. Send $j\to\infty$. Exhaust the chart interior by cutoffs equal to one on fixed compacts. This proves strong $L^2_{\rm loc}$ convergence of both chiral Weyl matrices and strong $L^1_{\rm loc}$ convergence of their energy densities. [E08 interpolation and positivity](../reviews/E08_LOCAL_REPLACEMENT_CHECK.md#interpolation-energy-and-admissibility)

## Local stationarity and smoothness

For a smooth compactly supported tensor $H$ on a local harmonic chart, transplant $m_i+sH$ for small positive and negative $s$. The localized Taylor expansion of $F_\pm$ and its squared integral has uniform quadratic remainder in $s$, since $m_i$ is bounded in $W^{2,q}$ and in a compact ellipticity range. The path remains within the band and positive by the preceding sign argument after reducing the common $s$ range. Thus

$$
 s\,DE_\pm(m_i)[H]\ge -(e_i-I^+(M))-C_Hs^2,
$$

with $DE_\pm$ here denoting the derivative supported on the chart. For fixed $H$, $DF_\pm(m_i)[H]$ converges weakly in $L^2$. Its term with weak second derivatives is the derivative of the projection times the weakly converging curvature. The principal differentiated curvature term is the fixed $L(D^2H)$ and all lower derivative terms converge strongly. Multiplication by the strongly converging $F_\pm(m_i)$ proves convergence of the first variations to $DE_\pm(h)[H]$. First let $i\to\infty$ for fixed $s$ in the inequality, then take both signs of $s\to0$. The full Weyl functional, $4(E_++E_-)$, consequently has vanishing compactly supported first variation at $h$. This check concerns the derivative at zero with a uniform remainder. A finite varied energy at fixed nonzero $s$ need not converge through weak curvature jets. [E08 stationarity](../reviews/E08_LOCAL_REPLACEMENT_CHECK.md#stationarity-of-the-smooth-limit)

In this chart $R_h=0$ in distributions because the scalar contraction of curvature has weak convergence and $R_{m_i}=r_i^2Y_i\to0$. The local curvature bound in (1) and weak convergence also give $\operatorname{Rm}_h\in L^\infty_{\rm loc}$. To identify the weak Euler–Lagrange equation, mollify $h$ strongly in $W^{2,q}$, $q>4$, on a slightly larger region than each test support. The ordinary first variation identity for the smooth approximants passes to the limit, since the Weyl energy and its derivative are continuous in this strong topology by the local curvature formula. The Bach tensor is continuous from $W^{2,q}$ to $W^{-2,q}$ by the curvature and connection formulas. The metric contractions and volume density multiplying each test converge in $W^{2,q}$ and thus give admissible convergent dual tests. Multiplication by those coefficients is invertible on compactly supported $W^{2,q'}$ tests, $q'=q/(q-1)$, by Sobolev multiplication and positivity of $h$. Density of smooth tests therefore gives $B_h=0$ as a tensor distribution. [Avalos–Cogo–Royo Abrego, arXiv:2610.35257v1, Lemma 2.1 and equation (2.3)](https://arxiv.org/html/2610.35257v1#S2.SS1) · [Smooth first variation, Bahuaud–Guenther–Isenberg–Mazzeo §1](https://arxiv.org/html/2508.06633v1#S1)

Now apply the distributional Ricci equation of Avalos–Cogo–Royo Abrego, Lemma 5.1, equation (5.6), with $h\in W^{2,q}_{\rm loc}$, $q>4$, $R_h=0$, $B_h=0$. It gives $\Delta_h\operatorname{Ric}_h=\operatorname{Rm}_h*\operatorname{Ric}_h$ in the sense used there, with a locally bounded right side. Their **interior** Theorem 2.2(ii) for the tensor Laplacian with $k=2$ and $p=q$ applies because $\operatorname{Ric}_h\in L^{q'}_{\rm loc}$ and the right side lies in $L^q_{\rm loc}$. Therefore $\operatorname{Ric}_h\in W^{2,q}_{\rm loc}\subset C^{1,\gamma}_{\rm loc}$ for $\gamma<1-4/q$. The harmonic coordinates remain harmonic by the strong first-order convergence. In (2), with $h$ in place of $m_i$, the coefficients and right side now have the Hölder control needed to get $h\in C^{2,\gamma}_{\rm loc}$ on smaller regions. Written in these coordinates, the Ricci equation has Hölder coefficients, including the zero-order terms from derivatives of the connection, and gives $\operatorname{Ric}_h\in C^{2,\gamma}_{\rm loc}$. Alternating the two elliptic Schauder estimates bootstraps both to smoothness. The proof uses the local equations in the physical gauge, where the scalar equation is already homogeneous. [Avalos–Cogo–Royo Abrego, Interior Theorem 2.2(ii)](https://arxiv.org/html/2610.35257v1#S2.SS2) · [Distributional Ricci equation, Lemma 5.1](https://arxiv.org/html/2610.35257v1#S5)

## Anchored mass and consequence

Take a fixed compact of the smooth complete limit whose image contains $B_{\widehat g_i}(p_i,1)$ for large $i$, and a nonnegative smooth compact cutoff at least one on that compact. The anchored positive chiral energy is at least $e_i/2$ on the source ball, and constant rescaling preserves the integral. Strong local convergence of the chiral energy gives positive integrated $W_h^+$ on the cutoff support, bounded below by $\liminf e_i/2$. Thus $h$ is nonflat. The use of integrated mass matters because pointwise curvature normalization would not pass through the available convergence. The local Weyl convergence also holds in the whole marked embeddings, by the local chart change and the strong curvature-density convergence in the individual charts. Compactly supported Yamabe tests pass through the marked convergence with $\widehat s_i\to0$ to the homogeneous Sobolev inequality with lower constant $y_0$. A compact complete limit would violate this inequality by the constant test, so the limit is noncompact. Weak curvature convergence and exhaustion give the inherited full curvature and Ricci-square bounds.

The limit meets every E11 comparison hypothesis, including first-order physical convergence, whole marked truncations and a smooth nonflat complete limit. E11 therefore rules out (1) at the infimum. For every subsequence with $r_i\to0$ there is a fixed finite $A$ and a further subsequence with points $x_i\in B_{g_i}(p_i,A r_i)$ such that

$$
 r_i^2|\operatorname{Rm}_{g_i}|(x_i)\longrightarrow\infty.
$$

Indeed, if the limsup of the scaled supremum were finite at every integer radius on a given subsequence, the simultaneous bounds (1) would hold there, increasing each constant to cover its finite exceptional indices. The asserted further subsequence then follows from an infinite limsup at one radius. This locates strictly smaller curvature scales within a fixed multiple of the anchored half-energy radius. The statement depends on the E11 exclusion and on a positive limiting chiral mass. It supplies no bound on the energy carried at the smaller scales. [E11 complete-limit exclusion](../reviews/E11_COMPLETE_LIMIT_CHECK.md)
