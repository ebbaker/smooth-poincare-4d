# SP4-MASTER-E03 · Joint selection and individual volume-ball repairs

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E execution after B03. The dispatch specified GPT-6.2 Sol/ultra. The helper could not independently attest the serving values. The [issued packet](../research-progress/handoffs/E03_VOLUME_REPAIRS.md) identifies upstream commit `fc60509a27f6b97f48e2619f9e6f0f6cd4eb36e2`. Its working TeX fingerprints were verified before the derivation: main `a499b313e6d5`, marked cut `3f3722b56d34`, splice `f93717b0b73c`, physical volume `8ff80d4d42e5`. This note proves a measured selection statement and a conditional repair estimate on the same minimizing sequence.

## Source measures and eligible points

Fix a closed oriented smooth homotopy four-sphere $M$ and one sequence of smooth unit-volume Riemannian Yamabe minimizers $g_i$ in positive classes, with $e_i=E_+(g_i)\to I^+(M)=e$ and $e_i\le 8\pi^2-\delta$. Use $E_+=\int |W^+|_{\mathrm{HS}}^2dV$ on the positive Weyl block as an operator on real two-forms. Let

$$
\mu_i=dV_{g_i},\qquad \lambda_i=|W^+_{g_i}|_{\mathrm{HS}}^2\,dV_{g_i},\qquad
\nu_i=|\mathrm{Rm}_{g_i}|_{\mathrm{tens}}^2\,dV_{g_i}.
$$

In particular $4\lambda_i\le\nu_i$ and $\sup_i\nu_i(M)<\infty$. Use the smooth conformal positive-Ricci metrics $H_i$ at the physical half-volume scale, with centers $q_i$. Apply the extraction results `vol:median`, `vol:regular` and `vol:smooth-balls` on the resulting pointed subsequence. They give a proper geodesic limit $(X,d,q)$, bounded-window packing by at most $C_D r^{-4}$ many $r$-balls, $dV_{H_i}\rightharpoonup m=\mathcal H^4$ locally, and $\mu_i\rightharpoonup\mu=fm$ with $f\in L^\infty_{\mathrm{loc}}$ and $\mu(X)=1$. Take local weak limits $\lambda,\nu$ on the same pointed subsequence, with $4\lambda\le\nu$. Let $\mathcal R$ be the set of four-dimensional Euclidean-regular points, where $m(B_r(x))/(\omega_4r^4)\to1$. It has full $m$-measure. Define $G_\zeta=\{x\in\mathcal R:\nu(\{x\})<\zeta\}$ for a fixed total-curvature tolerance $\zeta>0$. Then $\mu(G_\zeta)=1$. A point in $G_\zeta$ admits arbitrarily small balls with a strict margin below the curvature tolerance and nearly maximal gauge volume. Here and below limits on balls use joint continuity radii and are taken in a common pointed realization. [Master physical curvature budget](../manuscript/chiral_weyl_energy_and_smooth_poincare.tex#L238) · [Extraction, `vol:median` and `vol:regular`](../../investigations-1/03_first_order_twistor/01_sections_and_connections/02_dirac_collar_extraction/manuscript/volume_witnesses.tex#L184) · [Extraction, `vol:regular` and `vol:smooth-balls`](../../investigations-1/03_first_order_twistor/01_sections_and_connections/02_dirac_collar_extraction/manuscript/volume_witnesses.tex#L368)

## Joint selection with a curvature ceiling

**Claim.** At any fixed $\epsilon,\zeta,r_*>0$ there are finitely many marked balls $\Omega_{ij}$ as in `vol:smooth-balls` on the same measured subsequence. They satisfy

$$
\liminf_i\mu_i\bigl(\textstyle\bigcup_j\Omega_{ij}\bigr)>1-\epsilon,
\qquad
\liminf_i\lambda_i\bigl(\textstyle\bigcup_j\Omega_{ij}\bigr)>\lambda(G_\zeta)-\epsilon.
$$

The bound holds including for diffuse $\lambda$ singular to $m$, at eligible points. The outer and inner comparison radii can moreover be chosen with total limiting $\lambda$-mass between them less than $\epsilon$.

Put $\sigma=\mu+\lambda$. Fix a bounded window containing all but $\epsilon/4$ of each measure's mass on $G_\zeta$, chosen using the finite *limit* measures. We need fine radii with both a small loss from shrinking and a doubling bound for $\sigma$, which could fail to be doubling at all radii. For $x$ in this window and $r$ dyadic, consider $A_r=\{x:\sigma(B_r(x))<r^5\}$. A maximal $r/2$-separated family in $A_r$ covers it by $r$-balls centered in $A_r$ and has at most $C_Dr^{-4}$ members, by the bounded-window packing (with a changed constant). Thus $\sigma(A_r)\le C_Dr$, summable for dyadic $r\downarrow0$. Outside a $\sigma$-null set, monotonicity then gives $\sigma(B_r(x))\ge 2^{-5}r^5$ for every sufficiently small $r$.

Given $0<\eta<1$, choose $\theta=1-3\tau$ with $0<\tau<1/6$ and $5\log(1/\theta)<\log(1+\eta)/8$. Let $k$ be the least integer with $\theta^{-k}\ge5$. Fix $K>1$ sufficiently large that $5k\log(1/\theta)<\log(K)/8$. At any point satisfying the preceding lower bound, choose a starting radius $r_0>0$ so that for $r_j=r_0\theta^j$ all of $r_j$, $(1-\tau)r_j$, $\theta r_j$ and $5r_j$ are continuity radii for $m,\mu,\lambda,\nu$. At a fixed center there are only countably many excluded radii for each measure. Set $a_j=-\log\sigma(B_{r_j}(x))$. The sequence is nondecreasing and $a_j\le 5j\log(1/\theta)+C_x$ for large $j$. Summing the increments $a_{j+1}-a_j$ shows that the upper asymptotic proportion of indices where that increment exceeds $\log(1+\eta)$ is at most $5\log(1/\theta)/\log(1+\eta)$. Summing $a_j-a_{j-k}$, in which each increment occurs at most $k$ times, gives the upper proportion $5k\log(1/\theta)/\log K$ for increments exceeding $\log K$. Since $B_{5r_j}(x)\subset B_{r_{j-k}}(x)$, at arbitrarily small radii $r$ one has both

$$
\sigma(B_{\theta r}(x))\ge (1+\eta)^{-1}\sigma(B_r(x)),\qquad
\sigma(B_{5r}(x))\le K\,\sigma(B_r(x)).
$$

For centers in $G_\zeta$ in the window also impose $r<r_*$, $\nu(\overline B_r(x))<\zeta$, and the almost-maximal volume threshold at $s=(1-\tau)r$ with strict margin. All sufficiently small radii at such a center satisfy these extra requirements. With the noncollapsed Ricci lower bound, Cheeger–Colding's Appendix A gives an embedded open ball inside the smooth source $B_s$ whose image contains the concentric ball of radius $(1-\tau)s$. The relative radius can be fixed here because the volume deficit can be chosen sufficiently small after $\tau$ is fixed. There is room for the closed ball of radius $\theta r$, since $(1-\tau)^2>1-3\tau$. No estimates on pullbacks of $g_i$ are used in this step. [Cheeger–Colding, JDG 46 (1997), Theorem 5.9 and Appendix A, Theorems A.1.8–9](https://doi.org/10.4310/jdg/1214459974) · [Owning argument, `vol:smooth-balls`](../../investigations-1/03_first_order_twistor/01_sections_and_connections/02_dirac_collar_extraction/manuscript/volume_witnesses.tex#L430)

Use the greedy $5r$ selection on this fine family of closed balls, taking maximal disjoint collections in descending dyadic size ranges. Each discarded ball intersects a chosen ball of at least half its radius, and is contained in the corresponding fivefold dilate. Every center outside all selected closed balls has arbitrarily small family members disjoint from any fixed finite initial group of selected balls. It therefore lies in the union of the fivefold dilates of the remaining selected balls for every initial group. The $\sigma$-mass of this union tends to zero by $\sigma(5B)\le K\sigma(B)$ and finite total mass of the disjoint balls. This gives coverage for $\sigma$ on the eligible set in the window. The argument uses the metric $5r$ selection and the good radii just proved, rather than assuming a differentiation theorem for $\sigma$ on $X$. [Mattila, Cambridge Studies in Advanced Mathematics 44 (1995), §2, Theorem 2.1 and proof](https://doi.org/10.1017/CBO9780511623813.004)

Keep enough selected balls that each measure loses less than $\epsilon/4$ of the eligible mass in the window. For outer balls $B_{r_j}(x_j)$, the sum of $\sigma$-losses from shrinking them to $B_{\theta r_j}(x_j)$ is at most $\eta\sigma(X)$. Choose $\eta$ so this is less than $\epsilon/4$. Disjointness of the closed outer balls in the geodesic space gives a strict separation margin at radii $s_j$. Freeze the window, finite family and radii, then transfer centers and all ball inequalities to the sources. The resulting smooth marked closed parameter disks obey

$$
\overline B_{\theta r_j}^{H_i}(x_{ij})\subset\operatorname{int}\Omega_{ij}
\subset \Omega_{ij}\subset B_{s_j}^{H_i}(x_{ij}),\qquad
\nu_i(\Omega_{ij})<\zeta.
$$

This proves both claims, including the thin-shell bound between $\theta r_j$ and $s_j$. The finite family can depend on the tolerances and the subsequential limits. Its cardinality stays fixed as $i\to\infty$.

## Complement and variational consequences

Write $e_\infty=e-\lambda(X)\ge0$. On continuity windows it is the iterated limit $\lim_{D\to\infty}\lim_i\lambda_i(M\setminus B_D^{H_i}(q_i))$. The volume tail bound gives no bound of this kind for $\lambda_i$. On each jointly selected family,

$$
\limsup_i \lambda_i\bigl(M\setminus\textstyle\bigcup_j\Omega_{ij}\bigr)
\le e_\infty+\lambda(X\setminus G_\zeta)+\epsilon.
$$

At fixed $\zeta$, only the mass outside the regular set or on atoms of $\nu$ of size at least $\zeta$ remains uncontrolled in bounded windows. Points with $\nu(\{x\})>\zeta$ cannot be included via a fixed continuity inner ball and this per-ball bound. At equality, weak convergence gives no strict margin. Allowing arbitrary $\zeta\downarrow0$ retains all diffuse chiral mass on $\mathcal R$ and excludes every atomic chiral mass, since $4\lambda\le\nu$. Tightness of $\lambda_i$, together with $\lambda$ supported on $\mathcal R$ and atomless, is sufficient to make the complement bound vanish without uniform absolute continuity against $\mu_i$. The three possible residual contributions are escape, mass on nonregular points, and the excluded atoms. None is estimated by the physical volume alone.

If individual same-type positive Yamabe repairs on the jointly selected balls have costs $\gamma_{ij}$ as in `prop:replacement`, then at fixed tolerances

$$
\lambda(G_\zeta)-\epsilon\le \limsup_i\sum_j\gamma_{ij}.
$$

Hence if repairs exist with aggregate limsup tending to zero as $\epsilon\downarrow0$ for fixed $\zeta$, the minimizing sequence has $\lambda(G_\zeta)=0$. Positive eligible mass alone would contradict the infimum, even with additional mass in the residual. If the residual also vanishes by an independent hypothesis, the inequality gives $e=0$. The use of the infimum here is valid because each repair is tested on the original smooth type, with the source index taken first at fixed cardinality. [Master, `prop:replacement` and its corollary](../manuscript/chiral_weyl_energy_and_smooth_poincare.tex#L282)

## What an exterior-retaining repair costs

For a single disk $\Omega$ at index $i$, let $c_i(\Omega)$ be the infimum of $E_+(k;\Omega)$ over smooth Riemannian $k$ on $M$ with $Y([k])>0$ and $k=g_i$ on a neighborhood of $M\setminus\operatorname{int}\Omega$. The admissible set contains $g_i$. With $m_i^\pm=E_\pm(g_i;\Omega)$, exact exterior retention gives

$$
\max\{0,\ m_i^+-(e_i-e),\ m_i^+-m_i^-\}\le c_i(\Omega)\le m_i^+.
$$

The second term in the maximum is the infimum comparison. The third term follows from the closed signature identity on $M$ for both metrics. Holding the exterior fixed forces $E_+(k;\Omega)-E_-(k;\Omega)=m_i^+-m_i^-$, regardless of positivity. Thus a bound $c_i=o(1)$ needs a genuine admissible construction and cannot hold if there is a fixed positive chiral imbalance on the disk. A boundary-fixed conformal change alone preserves $m_i^+$ exactly. [Master, signature identity and conformal invariance](../manuscript/chiral_weyl_energy_and_smooth_poincare.tex#L160) · [Master, disk replacement](../manuscript/chiral_weyl_energy_and_smooth_poincare.tex#L272)

A sufficient nonconformal construction is the following conditional flattening test. Suppose an oriented smooth parametrization $\Phi_{ij}:\overline B_1\to\Omega_{ij}$ and a positive constant $c_{ij}$ give $h=c_{ij}^{-2}\Phi_{ij}^*g_i$ with

$$
a=\|h-\delta_{\rm Euc}\|_{L^\infty(B_1)},\qquad b=\|Dh\|_{L^4(B_1)},\qquad
K_0=\|\operatorname{Rm}_{\mathrm{low}}(h)\|_{L^2(B_1,dy)}.
$$

Assume $a$ is small. Then $K_0$ is uniformly bounded by the physical curvature budget and metric comparability. Use a fixed smooth cutoff $0\le\chi\le1$, zero on $\overline B_u$ for some $0<u<1$ and one near $\partial B_1$. Replace $h$ by $h'=\delta_{\rm Euc}+\chi(h-\delta_{\rm Euc})$, restore the constant scale, and keep $g_i$ in the exterior. This gives a smooth oriented metric $k_i$ on $M$. Write $A_{ij}=\Phi_{ij}(B_1\setminus\overline B_u)$ for the annulus where the incoming energy may remain.

For positivity, use $g=g_i$ as the background and set $e_g=k_i-g$, with $\|e_g\|_{L^\infty(g)}\le Ca$ and $D_g=\|\nabla^g e_g\|_{L^4(g)}\le C_\chi(a+b)$. The estimates follow in the chart by differentiating $(\chi-1)(h-\delta_{\rm Euc})$ and using $|\Gamma(h)|\le C|Dh|$. The constant scale cancels in the critical norms. With $P^{ij}=(dV_{k_i}/dV_g)k_i^{ij}$ and $L=\nabla^{k_i}-\nabla^g$, the Ricci difference gives the divergence of $P^{ij}L^p{}_{ij}-P^{ip}L^q{}_{iq}$ plus terms bounded by $C(|\nabla^g e_g|^2+a|\operatorname{Ric}_g|)$. Integrate against $v^2$, including the gradient-form change, to obtain

$$
|Q_{k_i}(v)-Q_g(v)|\le C\left(
 a\|dv\|_2^2+D_g\|v\|_4\|dv\|_2
 +(D_g^2+a\|\operatorname{Ric}_g\|_2)\|v\|_4^2\right).
$$

All right-hand norms use $g$. Here $Q_g(v)\ge6\|dv\|_2^2$ by positive scalar curvature and $Q_g(v)\ge\sqrt{48\delta}\,\|v\|_4^2$ by the source Yamabe lower bound. Uniform $L^2$ control of $\operatorname{Ric}_g$ follows from the physical budget, so for $a+b$ sufficiently small at fixed cutoff the right side is less than $Q_g(v)/2$. The pointwise metric comparison controls the new $L^4$ denominator. Consequently the repaired class is positive. This comparison uses constant rescaling of the marked physical gauge and the global physical Yamabe form. [Master, physical Yamabe and full-curvature bounds](../manuscript/chiral_weyl_energy_and_smooth_poincare.tex#L182) · [Master, scalar divergence calculation in a model gauge](../manuscript/first_order_splice.tex#L94)

For the curvature cost, the lower-index curvature is a constant linear operator on $D^2h$ plus terms quadratic in $Dh$ with bounded inverse-metric coefficients. Thus $\operatorname{Rm}_{\mathrm{low}}(h')-\chi\operatorname{Rm}_{\mathrm{low}}(h)$ has $L^2(dy)$ norm at most $C_\chi(a+b+b^2)$. The principal second derivatives cancel before Weyl projection. Represent the positive Weyl projection in oriented orthonormal frames obtained from the coordinates by the positive metric square root, including the volume density to the one-half power. These projection-and-density maps vary by $O(a)$ between $h$ and $h'$, so

$$
E_+(k_i;\Omega_{ij})^{1/2}\le \lambda_i(A_{ij})^{1/2}+\xi_{ij},\qquad
\xi_{ij}=C_\chi\bigl(b+b^2+a(1+K_0)\bigr).
$$

The core is exactly flat and the coefficient of the incoming square root is one, since $0\le\chi\le1$. The cost in `prop:replacement` is the entire new interior energy when the exterior is fixed. The useful *decrement* is obtained by subtracting the incoming annular energy from the whole disk's incoming energy:

$$
\lambda_i(\Phi_{ij}(B_u))
\le e_i-e+2\xi_{ij}\lambda_i(A_{ij})^{1/2}+\xi_{ij}^{,2}.
$$

In particular, on a fixed family with $a+b\to0$ and uniform cutoffs, every flat-core candidate must already have vanishing chiral mass as $i\to\infty$. One such marked core containing a fixed continuity inner ball with positive limiting $\lambda$-mass is enough to contradict minimizing, regardless of the annular mass. For the aggregate-cost test, if the charts also put the selected $\overline B^{H_i}_{\theta r_j}(x_{ij})$ inside $\Phi_{ij}(B_u)$, the annuli lie in the measured shells. Then $\limsup_i\sum_j E_+(k_i;\Omega_{ij})\le\epsilon$ at fixed selection, using the shell estimate and finite cardinality. The inclusion and uniform cutoff bounds in these charts are additional inputs. A smooth embedding with compact inner inclusion supplies neither $a+b\to0$ nor a fixed parameter collar containing that inner ball. [Master, principal curvature cancellation and chiral projection](../manuscript/first_order_splice.tex#L56) · [Extraction, scope of the smooth markings](../../investigations-1/03_first_order_twistor/01_sections_and_connections/02_dirac_collar_extraction/manuscript/volume_witnesses.tex#L475)

## Scope check

The complement cannot be controlled using only the measure hypotheses of `vol:smooth-balls`. On a fixed positively Ricci-curved round four-sphere, take fixed normalized round measure $\mu_i=\mu$, and smooth nonnegative densities for $\lambda_i$ of total mass $e>0$ supported in $B_{r_i}(p)$, where $r_i\downarrow0$. Set $\nu_i=4\lambda_i$ or add a bounded smooth background. The metric packing and probability estimates hold in this fixed gauge, but the weak chiral measure is $e\delta_p$. For every fixed volume tolerance the smooth-ball selection away from $p$ can leave the entire chiral mass in the complement for large $i$. The shrinking balls themselves show failure of uniform absolute continuity. This is a counterexample to an inference from volume and bounded nonnegative curvature-measure data. These prescribed densities do not model the actual Weyl curvature of the round metric or establish concentration on a geometric minimizing sequence. Conversely the diffuse model $\lambda_i=e\mu$ shows why a small upper bound for each selected ball, by itself, does not bound the total when the family is increased as the tolerance shrinks.

The proof was checked at fixed continuity radii, including diffuse singular mass, shell losses, the sign of the cost relative to the incoming exterior, and positivity before the minimization comparison. Cheeger–Colding's named volume and embedding passages were inspected in an author-posted copy of the published paper. Mattila’s named theorem and greedy proof were inspected in a copy of the published book. The coverage for $\sigma$ uses the tail argument above. The remaining geometric work is to construct the actual low-cost marked charts or another exterior-retaining competitor at a point of positive eligible chiral mass, or to test the ineligible/escaping concentration when eligible mass is absent. The measured argument alone proves neither alternative.
