# Which piece carries the two chiral charges?

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex. The requested lead is GPT-6.2 Astra on ultra. Its serving configuration is not independently exposed. Bounded helper calls selected gpt-6.2-sol on ultra. Working checkout `6879850c01a741618210815be0cc8041abe45a94`.

On an oriented smooth homotopy four-sphere set
$$
 Q_\pm(g)=\bigl(|W^\pm|^2+s^2/48-|\operatorname{Ric}_0|^2/4\bigr)dV_g .
$$
Both integrate to $8\pi^2$ on the closed source by signature and Gauss–Bonnet. These are the two real chiral spin Chern–Weil densities, with their signs chosen to integrate positively on round $S^4$. An oriented, compact, smooth piece $U$ with boundary has $\int_U Q_\pm=8\pi^2 n_\pm+\varepsilon_\pm$ where $\varepsilon_\pm$ is the signed total boundary Chern–Simons term modulo $8\pi^2$ in the respective spin connection. One can choose its nearest representative. Each boundary face is measured in its own actual gauge. There is no assumed extension of the chosen boundary frames across $U$. [Precise conventions and integral normalization](E12_RELATIVE_CHIRAL_CHARGE_20261125.md)

**Finite partitions in the physical unit-volume Yamabe metric.** Assume $E_+=E_-\le8\pi^2-\delta$. The global bound $D/4:=\int_M|\operatorname{Ric}_0|^2/4\le E_+$ gives $\int_UQ_\pm\ge-8\pi^2+\delta$ on every piece. Suppose at fixed finite partition size $k$ that $|\varepsilon_{j,\pm}|\le\epsilon$ on each of the $k$ pieces, with $2\epsilon<\delta$ and $k\epsilon<8\pi^2$. Every $n_{j,\pm}\ge0$, and their sum on each chirality is one by integrality and the closed total. Also
$$
 \left|\int_{U_j}(Q_+-Q_-)\right|
 =|E_+(U_j)-E_-(U_j)|\le 8\pi^2-\delta .
$$
Thus $n_{j,+}=n_{j,-}$. Precisely one piece carries one unit of each relative charge. It has $s^2\operatorname{vol}(U_j)/48\ge 8\pi^2-E_+(M)-\epsilon$, hence volume at least $(\delta-\epsilon)/(8\pi^2)$ since $s^2\le384\pi^2$. Each remaining piece satisfies $|E_\pm(U_j)+s^2\operatorname{vol}(U_j)/48-D(U_j)/4|\le\epsilon$. No classification of the smooth type of the charge-carrying piece follows. When the number of pieces grows, the corresponding sum of absolute errors, the per-piece margin and the full coverage all need verification.

**A boundary test in another metric of the same class.** Write $A=(\operatorname{Ric}-s g/6)/2$. In any representative $h$ with $\sigma_2(A_h)>0$, $Q_\pm(h)=|W^\pm|^2dV_h+2\sigma_2(A_h)dV_h$ are positive measures with the same fixed totals. Such a representative exists in the positive subcritical band by Chang–Gursky–Yang. Let $d_\pm$ be the distance of the signed total Chern–Simons boundary term to $8\pi^2\mathbb Z$. Exact transgression gives
$$
 d_\pm=\min\left\{\int_UQ_\pm(h),\int_{M\setminus U}Q_\pm(h)\right\}
 \ \ge\ \min\{E_\pm(U),E_\pm(M\setminus U)\}.
$$
The right hand energies have the same values in the original Yamabe metric. For a chosen chirality, if the exterior carries at least $\eta>0$ along the exhaustion and $d_\pm\to0$, then $E_\pm(U)\to0$. This applies to disconnected boundary and to a middle of unknown topology. Only a single *signed sum* in the positive gauge matters. The same statement applies to original metric balls with smooth boundary, regardless of the auxiliary metric's radial geometry. [Positive gauge and radial calculation](../../../01_sections_and_connections/01_neck_geometry/notes/E18_POSITIVE_SCHOUTEN_BOUNDARY_FLUX_20261125.md)

On each face $\Sigma$, a nonzero half-spinor in $h$ defines a unit quaternionic frame with its quaternionic partner. In that frame the tangential connection form $a$ satisfies $|a|\le C|\nabla^h_{\mathrm{tan}}\psi|/|\psi|$, by normalization and parallelism of the quaternionic structure. If $x_\Sigma$ is the $L^3(\Sigma,h)$ norm of this quotient and $z_\Sigma=\|F_{\tan}\|_{L^{3/2}(\Sigma,h)}$, the formula $\operatorname{tr}(a\wedge F-a^3/3)$ gives
$$
 \min\{E_\pm(U),E_\pm(M\setminus U)\}
 \le C\sum_{\Sigma\subset\partial U}(x_\Sigma z_\Sigma+x_\Sigma^3).
$$
This tests *first tangential derivatives on actual end fields*. A smoothly normalized Dirac trace with measured covariant derivative can be used. Plain $H^{1/2}$ transmission and a lower bound for the trace amplitude do not give these boundary norms. If $x_\Sigma$ is large there can still be cancellation in the signed sum. On a balanced separating boundary with bounded $z_\Sigma$, these estimates impose a quantitative obstruction to choosing spinors with arbitrarily small relative first derivative on every face. Small flux in an independent physical Yamabe frame transforms by an explicit current under a variable conformal multiplier. [Current and scale factors](../../../01_sections_and_connections/02_dirac_collar_extraction/notes/E07_CONFORMAL_BOUNDARY_CURRENT_20261125.md)
