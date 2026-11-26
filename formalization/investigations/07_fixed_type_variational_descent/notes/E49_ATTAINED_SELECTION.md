# Least Ricci selection at the first attained Weyl value

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Actual serving model and reasoning effort were unavailable. Route 07, Edition 06 bounded E49 proof at working HEAD `9c80575988ad8915ad39515c64400e3d8590cf46`. The working [Edition 06 plan](../../research-plan/06_PLAN.md), [marked-neck chapter](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/closed_and_conformal_alternatives.tex), [scientific 06](../../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/manuscript/fixed_type_attainment.tex) and [master](../../../../papers/master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex) have SHA-256 prefixes `d86d59c000b9`, `5abc9c7713da`, `719bbea527c6` and `a866a87ca661` respectively. [Setup pins](../../research-progress/handoffs/ED06_SETUP_INPUTS_20261126.md) · [Route 07 register](../research-progress/REGISTER.md)

## Compactness at the exact value

Fix one nonstandard, smooth, closed, connected, oriented homotopy four-sphere with a positive subcritical class, and use smooth Riemannian metrics. Write $Y(g)=Y([g])$, $e(g)=E_+(g)=E_-(g)$, with the curvature-operator Hilbert–Schmidt normalization, and $I=\inf_{Y>0}e$. The working Theorem X of scientific 06 supplies a positive Bach-flat metric with $e=I$. The nonstandard closed gap gives $I>0$ and the entry gives $I<8\pi^2$. Thus $I$ belongs to the marked-neck set $\mathcal A_M$ of positive subcritical Bach-flat energies. Every value of $\mathcal A_M$ belongs to the unrestricted positive-class energy set, so $I=\inf\mathcal A_M=a_M$. Normalize the attained conformal class by the Yamabe theorem. Bach-flatness and $e$ are preserved under this smooth conformal change. The resulting metric belongs to the exact stratum
$$
\mathcal S=\{g\mid \operatorname{Vol}(g)=1,\ R_g\equiv Y(g)>0,\ B_g=0,\ e(g)=a_M\}.
$$
The compactness input is marked-neck `alt:critical` with $b=a_M$ and $0<\delta\le 8\pi^2-a_M$. Its exact same-type strict drop $\kappa_\delta>0$ gives $b<a_M+\kappa_\delta$. An accepted subsequence has actual oriented pullbacks on the original carrier and a smooth limit with the exact energy and Bach equation. The Lean input `AttainedFirstValueCompactness` supplies this geometric conclusion for every sequence in $\mathcal S$. The proof below supplies the limit's Yamabe gauge and positivity.

The ordinary trace-free Ricci integral $D=\int|\mathrm{Ric}_0|^2\,dV_g$ satisfies
$$
16\pi^2=2a_M+Y(g)^2/24-D(g)/2,
\qquad
D(g)=4I-\bigl(Y_{\rm rd}^2-Y(g)^2\bigr)/12.
$$
In particular $D\ge0$ and the band give $Y(g)\ge\sqrt{48\delta}$ on $\mathcal S$. This lower bound is derived from the integrated Euler identity with $\chi(M)=2$, the signature-zero signed ledgers and the unit-volume constant-scalar gauge. [Master budget](../../../../papers/master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex) · [Physical Euler ledger](../../../SmoothPoincare/Variational/BourTrajectoryBudget.lean)

## Passing the Yamabe inequalities to a smooth limit

Work on the common pulled-back carrier and write $g_j\to g$ smoothly. At each point, $R_{g_j}\to R_g$ by the two-jet scalar formula. Evaluating at one point proves $Y(g_j)\to s$. The same sequence of constants at each point gives $R_g\equiv s$. The floor gives $s\ge\sqrt{48\delta}>0$.

Write $dV_{g_j}=\rho_j dV_g$. The densities converge pointwise to $1$ and are uniformly bounded for large $j$ by the quadratic-form estimates on the compact carrier. Integration of $1$ gives $\operatorname{Vol}(g)=1$. Fix one test $u=e^v$ with smooth real $v$. The physical integrals of $u^2$ and $u^4$ converge. The inequalities $(1-\eta)g\le g_j\le(1+\eta)g$ hold everywhere at large $j$ for each fixed $0<\eta<1$. They imply the inverse-metric inequalities
$$
(1+\eta)^{-1}|du|_g^2\le |du|_{g_j}^2
\le(1-\eta)^{-1}|du|_g^2.
$$
Together with volume-density domination, they give convergence of the gradient integral. The scalar term converges by the constant-scalar property, the convergence of the constants and the $u^2$ integral. Therefore
$$
Y(g_j)\left(\int u^4\,dV_{g_j}\right)^{1/2}
\le\int\bigl(6|du|_{g_j}^2+R_{g_j}u^2\bigr)\,dV_{g_j}
$$
passes to $g$ with $s$ on the left. Taking the infimum over the actual smooth positive tests yields $s\le Y(g)$. The test $u=1$ gives $Y(g)\le s$ with equality in its quotient because $\operatorname{Vol}(g)=1$. The pulled-back and original Yamabe constants agree by diffeomorphism invariance. Thus the limit belongs to $\mathcal S$, and the original subsequence's Yamabe constants converge to $Y(g)$. [Yamabe functional and normalization](https://users.math.msu.edu/users/parker/YamabeProblem.pdf) · [Physical test proof](../../../SmoothPoincare/Variational/AttainedYamabeSelection.lean)

## The two selections

Choose a minimizing sequence for $Y^2$ in $\mathcal S$ and apply the preceding compactness and continuity argument. Its limit $g_*$ attains the minimum of $Y^2$ and therefore the minimum of ordinary $D$ on $\mathcal S$. Independently choose a maximizing sequence for $Y^2$ and obtain its limit $g^+$. The spherical comparison gives $Y(g^+)\le Y_{\rm rd}=8\sqrt6\pi$. Equality on a closed four-manifold forces the round conformal class up to a diffeomorphism by Schoen's strict comparison, which would give $e(g^+)=0$. This contradicts $I>0$. Therefore
$$
d_*:=Y_{\rm rd}^2-Y(g^+)^2>0,
\qquad
Y_{\rm rd}^2-Y(h)^2\ge d_*\quad\text{for all }h\in\mathcal S.
$$
Equality in the uniform lower bound occurs at $g^+$. The two selected metrics can coincide if $Y^2$ is constant across the stratum. The proof requires no uniqueness or finiteness of the Yamabe representatives. The deficit bound controls the exact stratum. After X, a fixed exact representative also witnesses recovery of the unrestricted infimum in the restricted positive-deficit set at any smaller deficit, so one can choose fixed-deficit prescribed-excess starts. A uniform bound for all near-infimal positive metrics, or recovery before X, needs its own argument. The previous `bourDeficitInfimum_eq_iff_near` gives the relevant separate test. [Schoen's four-dimensional result](https://doi.org/10.4310/jdg/1214439291) · [Lee–Parker, Theorem C and §3](https://users.math.msu.edu/users/parker/YamabeProblem.pdf) · [Prescribed-excess recovery](../../../SmoothPoincare/Variational/BourStartDeficit.lean)

## Lean scope

`attainedYamabe_limit_of_metricConvergence` restores the volume-one gauge and proves Yamabe convergence from actual metric jets, test factors and a common positive floor. `exists_attainedYamabe_leastRicci` takes X in the form of an attained positive Bach-flat witness and derives $I=a_M$ by comparing the two actual sets. It uses conformal normalization and Bach covariance, the exact geometric compactness input, the Euler identity and spherical comparison including its equality case. An abstract `BachFlat` predicate carries the stated geometric input. The selection depends on the working scientific theorems and leaves the marked geometric compactness, the Bach equation and the subsequent Hessian sign as separate obligations.

`lake env lean -j1 SmoothPoincare/Variational/AttainedYamabeSelection.lean` and `lake build +SmoothPoincare.Variational.AttainedYamabeSelection` passed with Lean `4.35.0-rc3` and the Edition 06 dependency pins. A separate direct-module import checked both public declarations and reported only `propext`, `Classical.choice` and `Quot.sound` for each.
