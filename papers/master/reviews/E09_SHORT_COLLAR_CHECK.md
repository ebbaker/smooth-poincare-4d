# SP4-MASTER-E09 · Independent check of the short marked collar

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. The packet requests GPT-6.2 Sol/ultra. The actual serving model and reasoning effort are unavailable. The committed baseline is fc60509a27f6b97f48e2619f9e6f0f6cd4eb36e2. The frozen main TeX, first-order splice and marked cut have SHA-256 prefixes a499b313e6d5, f93717b0b73c and 3f3722b56d34. This review independently recomputes the proposed argument for one supplied short spherical collar. [Issued E09](../research-progress/handoffs/E09_SHORT_COLLAR_CHECK.md) · [E02 fixed-mark check](../notes/E02_QUANTILE_CHART.md)

## Short-collar result

Let $M$ be a smooth closed oriented homotopy four-sphere with smooth Riemannian metrics $g_i$, $Y([g_i])>0$ and $e_i=E_+(g_i)\le 8\pi^2-\delta$ for a fixed $\delta>0$. The convention is the Hilbert–Schmidt norm of $W^+$ on the self-dual two-forms. Fix a width $b>0$ before $i$. Suppose there is an oriented smooth embedding $\Phi_i$ of $A_b=\{e^{-b}<|y|<e^b\}$ with middle sphere $\Sigma_i$. Suppose a smooth positive conformal factor in this marking gives the comparison metric $m_i=\delta_{\rm Euc}+v_i$, with $a_i=\|v_i\|_\infty$, $d_i=\|Dv_i\|_{L^4(dy)}$, and $a_i+d_i\to0$. On the two compactly supported splices $T_{i,\pm}$ assume $K_i=\|\mathrm{Rm}_{m_i}\|_{L^2(m_i)}$ is bounded, in the full tensor norm. This bound is required in the actual comparison gauge.

There are then smooth marked caps $\widehat g_{i,\pm}$ with positive Yamabe constants and signed net chiral excesses bounded above by $\gamma_{i,\pm}=o(1)$. More quantitatively, write $q_{i,j}=E_+(g_i;T_{i,j})$, $q_i=\sum_jq_{i,j}$ and
$$
\Delta_i=C_b(a_iK_i+d_i^2+d_i+a_i),\qquad
G_i=2\sqrt{q_i}\,\Delta_i+\Delta_i^2,\qquad
\gamma_{i,j}=2\sqrt{q_{i,j}}\,\Delta_i+\Delta_i^2.
$$
At an individual index where the uniform metric comparison holds and $e_i+G_i<8\pi^2$, let $e_i'$ be the actual energy on the closed source after simultaneous straightening and $E_{i,j}$ that of cap $j$. Then
$$
E_{i,-}+E_{i,+}=e_i'\le e_i+G_i,\qquad
E_{i,j}\le E_+(g_i;P_{i,j})+\gamma_{i,j},
$$
$$
Y([\widehat g_{i,j}])\ \ge\ \sqrt{48(8\pi^2-E_{i,j})}
\ \ge\ \sqrt{48(8\pi^2-e_i')}
\ \ge\ \sqrt{48(8\pi^2-e_i-G_i)}>0 .
$$
Here $P_{i,j}$ is an entire raw side, with its energy measured in $g_i$. The uniform lower bound is at least $\sqrt{24\delta}$ for large $i$. The strict threshold applies to the maximum energy of the actual straightening path. The inequality using $G_i$ is a sufficient estimate for it. [Owning first-order energy estimate](../manuscript/first_order_splice.tex#L29) · [Master cut and cap model](../manuscript/marked_cut.tex)

## Straightening and the sign on the original smooth type

Write $t=\log|y|$ and choose a smooth profile $\theta(|t|)$ equal to zero near the middle and one near both outer faces, with transitions contained within the fixed annulus. Each splice is taken from the middle face through its transition, ending where the profile has become one. Choose a global conformal representative of $g_i$ equal to $|y|^{-2}m_i$ in the region used for this interpolation. Extend the logarithm of its chart multiplier via a cutoff supported in the available outer chart margin. Near the outer interface the path agrees exactly with this representative and outside the chart it may be taken equal to $g_i$. Use there and throughout the splices
$$
p_{i,u}=\delta_{\rm Euc}+\lambda_u v_i,\qquad
\lambda_u=1-u+u\theta,\qquad 0\le u\le1,
$$
with the metric $|y|^{-2}p_{i,u}$ in the chart. Positivity of the matrices follows from convexity. The profile is constant near $t=0$, so this is a smooth metric across the middle even at intermediate $u$. At $u=1$ it is exactly $dt^2+\gamma_{\rm rd}$ in a neighborhood of $\Sigma_i$.

In Cartesian coordinates the all-lowered curvature splits into a constant-coefficient linear second-derivative part and a smooth metric-dependent term quadratic in first derivatives. In $\mathrm{Rm}_{\rm low}(p_{i,u})-\lambda_u\mathrm{Rm}_{\rm low}(m_i)$ the uncut Hessian cancels. The derivative terms are bounded in $L^2(dy)$ by $C_b(d_i^2+d_i+a_i)$, uniformly in $u$. Changing the chiral projection and its volume factor contributes at most $C_b a_iK_i$. Thus the new chiral density has norm at most $\sqrt{q_i}+\Delta_i$ on the union by $0\le\lambda_u\le1$. The chiral energy outside remains the source energy there by conformal invariance. Subtracting $q_i$ proves the path ceiling $e_i+G_i$. Restricting the same estimate to one splice at $u=1$ and subtracting $q_{i,j}$ gives the stated per-side surcharge. These constants can grow as $b$ decreases and are used at the previously fixed width. [Owning derivation and density convention](../manuscript/first_order_splice.tex#L53) · [Signed excess identity](../manuscript/marked_cut.tex#L161)

For every smooth metric $h$ on this closed homotopy type, including classes of either Yamabe sign, take a unit-volume Yamabe minimizer $h_Y$. Its constant scalar curvature equals $Y([h])$. The signature is zero, so the integrated full Weyl tensor norm squared equals $8E_+(h)$. Gauss–Bonnet gives
$$
Y([h])^2=48(8\pi^2-E_+(h))+12\int_M|\operatorname{Ric}_{0,h_Y}|^2\,dV_{h_Y}.
$$
Thus a zero of $Y$ requires $E_+(h)\ge8\pi^2$, with a Ricci-flat Yamabe minimizer if equality holds. Along each smooth metric path the Yamabe constant is continuous. For a local proof, nearby metrics have uniformly close inverse metrics, volume densities and scalar curvatures, and their quadratic forms differ by at most $o(1)\|f\|_{H^1}^2$ in a fixed nearby background. Normalize $\|f\|_4=1$. Almost minimizing tests then have uniformly bounded gradient energy by the uniform lower scalar bound and the upper bound from any fixed test. Comparison in both directions proves continuity at the given metric. This sign argument uses the strict energy ceiling, and the formula by itself supplies no positive quantitative lower bound when the ceiling reaches $8\pi^2$. [Chang–Gursky–Yang, (0.4) and Remark 2, p. 107, inspected 25 November 2026](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf#page=3) · [Schoen, Theorem 3 and the minimization proof, pp. 493–495, inspected 25 November 2026](https://math.jhu.edu/~js/Math646/schoen.yamabe.pdf#page=15)

## Stretch, transfer, and compactification

For each fixed $i$ with the strict path ceiling, stretch the exact middle product by length $L\ge0$ on the joined original manifold. In its product subcollar replace the coefficient of $dt^2$ by $(1+L\kappa(t))^2$, where $\kappa$ is a fixed nonnegative smooth bump supported in the exact product and has integral one. The arclength coordinate identifies this region with a longer exact product, and all joins to the existing collar are smooth because $\kappa=0$ near its endpoints. Equivalently one has the two finished sides joined by $[0,L]\times S^3$ with the original marking. The family at finite $L$ is continuous on the fixed smooth type and the energy is exactly $e_i'$. The added product is conformally Euclidean. Since $L=0$ has positive sign, the same continuity and Gauss–Bonnet argument gives $Y\ge\sqrt{48(8\pi^2-e_i')}$ for every finite $L$.

Take the complete manifold $X_{i,j}$ formed from the corresponding straightened side and its infinite round product end. Any smooth compactly supported test on $X_{i,j}$ sits isometrically in the stretched joined metric for all sufficiently large $L$. Its extension by zero has the same Yamabe quotient. Consequently the uniform lower bound from the joined type holds on all such tests. The argument first fixes $i$ and an individual compact test, then takes the auxiliary length large enough for that test. The source marking and its width stay fixed in this step.

Use the smooth rotationally symmetric ball cap from the owning construction. Its metric $ds^2+a(s)^2\gamma_{\rm rd}$ has $a=1$ in the gluing collar and $a(s)\sim s$ at the smooth center. On the punctured cap the coordinate $dt=-ds/a(s)$ thus runs from a finite value to $+\infty$ at the center, with the punctured metric $a(s)^2(dt^2+\gamma_{\rm rd})$. The punctured capped piece is conformal to $X_{i,j}$ by this factor, extended as one on the whole straightened side. Yamabe covariance preserves the quotient for compactly supported tests under the corresponding multiplication by the conformal factor. For an arbitrary smooth test on the compact capped piece, multiply it by a cutoff vanishing within distance $\epsilon$ of the cap center and equal to one from distance $2\epsilon$. Its difference from the original test tends to zero in $L^4$ and $H^1$ since the transition has volume $O(\epsilon^4)$ and the cutoff gradient has $L^2$ norm $O(\epsilon)$. The Yamabe inequality thus passes across the missing point. This proves positivity on each closed cap at the joined-type lower bound. The caps are smooth homotopy four-spheres by the owning marked-topology argument. Their energies sum to $e_i'$ because both caps are conformally flat. Gauss–Bonnet on each cap now gives the separate, potentially stronger bound $\sqrt{48(8\pi^2-E_{i,j})}$. [Smooth ball model, conformal parametrization and conformal covariance](../manuscript/marked_cut.tex#L130) · [Cap topology](../manuscript/marked_cut.tex#L29)

## Measured-cut consequence

If complete sets of fixed physical chiral mass at least $\beta>0$ lie on opposite full raw sides and outside both splices, then $E_+(g_i;P_{i,j})\le e_i-\beta$ and each cap has energy at most $e_i-\beta+\gamma_{i,j}$. No matter how small the physical collar volume is, it is this side placement that supplies the two lower masses. In the minimizing case the actual sum $E_{i,-}+E_{i,+}<8\pi^2$ makes at least one cap strictly subthreshold. The original smooth type is the possible exceptional cap, and the opposite raw mass is at most $e_i-I^+(M)+\gamma_{i,s}$ if the exceptional cap is $s$. This contradicts $\beta>0$ as $e_i\to I^+(M)$ on a nonstandard $M$. A physical volume ball from the E02 test still gives only the one-side bound already recorded there. The new implication removes the need for long comparison buffers once a short spherical marking with both first-order estimates and bounded comparison curvature is supplied. A way to extract that marking, and the placement of the complete quantile sets, remains a separate requirement. [Master finite-cut criterion](../manuscript/marked_cut.tex#L9) · [E02 physical side accounting](../notes/E02_QUANTILE_CHART.md)
