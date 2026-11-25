# SP4-MASTER-E08 · Independent local replacement check

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. The packet requests GPT-6.2 Sol at ultra effort. Actual serving model and reasoning effort are unavailable. Input `fc60509a27f6b97f48e2619f9e6f0f6cd4eb36e2` for the marked recovery and same-type ALE descent manuscripts. The frozen master inputs match the SHA-256 prefixes `a499b313e6d5` (main) and `f93717b0b73c` (first-order splice). The assessment recomputes the local variational argument and traces its use in the supplied-limit theorems. [Frozen request](../research-progress/handoffs/E08_VARIATIONAL_CHECK.md) · [Master manuscript](../manuscript/chiral_weyl_energy_and_smooth_poincare.tex) · [First-order splice](../manuscript/first_order_splice.tex)

**Assessment.** The interpolation and vanishing-defect argument hold for both chiralities under the supplied marking and comparison curvature bound. Fixed-smooth-type minimization also gives Bach-flatness of the smooth limit. The stationarity step uses a uniform quadratic energy remainder for fixed smooth variations. The argument applies to a supplied full smooth rescaled AE comparison at the infimum.

## Set-up and the local curvature bound

Let $M$ be a closed connected oriented smooth homotopy four-sphere with smooth Riemannian metrics $g_i$. Write $E_\pm=\int |W^\pm|_{\rm HS}^2\,dV$ for the energies of the real Weyl endomorphism blocks. The source has $Y([g_i])>0$, $e_i=E_+(g_i)=E_-(g_i)\le 8\pi^2-\delta$ with $\delta>0$, and $e_i\to I^+(M)$, the infimum over smooth positive-Yamabe classes on $M$. These are total energies. The equality of the blocks on $M$ follows from $E_+-E_-=12\pi^2\tau(M)=0$.

On a relatively compact oriented coordinate region $D$ with embeddings $\Phi_i$ defined on a neighborhood of $\overline D$, write $m_i=f_i^2\Phi_i^*g_i$ for smooth $f_i>0$. Assume $m_i\to h$ uniformly and strongly in $W^{1,4}$, with $h$ smooth and positive definite, and assume comparison full curvature bounded in $L^2$ on the compacts used below. All component-space norms use the fixed coordinates. The metrics in those norms are uniformly equivalent.

The local comparison scalar-square bound also suffices. In the oriented orthonormal frame obtained from $m_i^{-1/2}$, the Levi-Civita connection $\omega_i$ is bounded in $L^4$. The connection $t\omega_i$ has curvature $t\Omega_i+(t^2-t)\omega_i\wedge\omega_i$. The Pfaffian transgression from the flat frame connection bounds the primitive of the Euler form by $C(|\omega_i||\operatorname{Rm}_{m_i}|+|\omega_i|^3)$. With full tensor norms and Euler density $\mathcal E_i=|W|^2-2|\operatorname{Ric}_0|^2+R^2/6$, one has $|\operatorname{Rm}|^2+\mathcal E_i=2|W|^2+R^2/3$. Integrating against $\zeta^2$ for a fixed cutoff $\zeta$, the boundary term is bounded by

$$
C\|\zeta\operatorname{Rm}_{m_i}\|_2\,\|d\zeta\,\omega_i\|_2
 +C\|d\zeta\|_4\|\omega_i\|_4^3.
$$

Young's inequality absorbs the first term into the full-curvature integral and a bounded error. The Weyl integral is bounded by the source energies by conformal invariance. The assumed comparison scalar-square bound controls the other term, yielding the full-curvature bound on smaller compacts. This use of transgression is local. [Chern–Simons, §3, Proposition 3.2 and (3.5)](https://math.mit.edu/juvitop/pastseminars/notes_2019_Fall/Chern-Simons.pdf) · [Marked recovery, Lemma `lem:weyl`](../../investigations-1/03_first_order_twistor/01_sections_and_connections/02_dirac_collar_extraction/manuscript/physical_volume_and_marked_conformal_limits.tex#L87)

## Interpolation, energy and admissibility

Fix $0\le\chi\le 1$ in $C_c^\infty(D)$ and put $v_i=m_i-h$, $a_t=1-t\chi$, $n_{i,t}=h+a_tv_i$ for $0\le t\le1$. These metrics are convex combinations of $m_i$ and $h$. Transplant $f_i^{-2}n_{i,t}$ by $\Phi_i$ and retain $g_i$ on the exterior. The resulting path $G_{i,t}$ is smooth on $M$, since $n_{i,t}=m_i$ near the rim. This construction needs smooth local conformal factors and embeddings. Every index uses its own factor, and its derivatives need no uniform estimates. The localized energy equals that of $n_{i,t}$ by conformal invariance.

The all-lowered curvature in the fixed coordinates has the form $\mathcal R(p)=L(D^2p)+Q_p(Dp,Dp)$ with $L$ constant coefficient and $Q_p$ algebraic and smooth in $p$. This follows by using the Christoffel symbols of the first kind for the second derivatives. The product rule gives

$$
L(D^2n_{i,t})-a_t L(D^2m_i)-(1-a_t)L(D^2h)
   =O(|Da_t||Dv_i|+|D^2a_t||v_i|).
$$

The right side tends uniformly in $t$ to zero in $L^2$. Also, $n_{i,t}\to h$ uniformly and $Dn_{i,t}\to Dh$ strongly in $L^4$ uniformly in $t$. Therefore $Q_{n_{i,t}}(Dn_{i,t},Dn_{i,t})$, $Q_{m_i}(Dm_i,Dm_i)$ and $Q_h(Dh,Dh)$ all have the same strong $L^2$ limit. This proves the corresponding curvature interpolation up to $o_{L^2}(1)$. It uses control of $\mathcal R(m_i)$ and never estimates the complete coordinate Hessian.

For either chirality define $F_\pm(p)=P_p^\pm\mathcal R(p)$ using the chiral Weyl projection, its matrix in the frame of $p^{-1/2}$, and the density factor $(\det p)^{1/4}$. Thus $|F_\pm(p)|^2dx=|W_p^\pm|_{\rm HS}^2dV_p$. The algebraic maps $P_p^\pm$ depend smoothly on $p$. Changing them from $P_{n_{i,t}}^\pm$ to $P_{m_i}^\pm$ or $P_h^\pm$ costs at most $C\|v_i\|_\infty(\|\mathcal R(m_i)\|_2+\|\mathcal R(h)\|_2)$. This proves

$$
F_\pm(n_{i,t})=a_t F_\pm(m_i)+(1-a_t)F_\pm(h)+o_{L^2}(1)
$$

uniformly in $t$. Bounded all-lowered curvature and its distributional convergence from the same coordinate formula imply $\mathcal R(m_i)\rightharpoonup\mathcal R(h)$ in $L^2$. Uniform convergence of the projections then gives $r_i=F_\pm(m_i)-F_\pm(h)\rightharpoonup0$ in $L^2$. Expanding the two energy squares and comparing with the unchanged exterior gives

$$
e_i-E_\pm(G_{i,t})
 =\int_D(2t\chi-t^2\chi^2)|r_i|^2\,dx+o(1),
 \qquad 0\le t\le1.
$$

The omitted cross term is $2t\int_D\chi\langle F_\pm(h),r_i\rangle dx$, which tends to zero uniformly in $t$. In particular the energy on the entire path is at most $e_i+o(1)$. At $t=1$ the drop weight is $2\chi-\chi^2$.

To check positivity, the sign of $Y([G])$ is the sign of the lowest eigenvalue of $-6\Delta_G+R_G$, with $\Delta=\operatorname{div}\nabla$. A positive eigenvalue and the scalar quadratic form together control the $H^1$ norm, hence the $L^4$ norm by Sobolev. A nonpositive eigenvalue can be tested on its first eigenfunction. The lowest eigenvalue is continuous along a fixed smooth path by the Rayleigh variational formula and uniform comparison of the forms there. At a zero eigenvalue the smooth positive first eigenfunction gives a scalar-flat metric conformal to $G$ by the scalar-curvature transformation. [Lee–Parker, §2, equation (2.7)](https://users.math.msu.edu/users/parker/YamabeProblem.pdf)

For a scalar-flat metric $q$ on $M$, Gauss–Bonnet and signature give $16\pi^2=2E_+(q)-\tfrac12\int_M|\operatorname{Ric}_{0,q}|^2dV_q$, hence $E_+(q)\ge8\pi^2$. Each chiral energy is conformally invariant. The path starts positive and, for large $i$, stays strictly below $8\pi^2$, so it stays positive all the way. Minimality now gives

$$
0\le \int_D(2\chi-\chi^2)|r_i|^2dx\le e_i-I^+(M)+o(1)\longrightarrow0.
$$

Taking $\chi=1$ on any smaller compact proves strong $L^2_{\mathrm{loc}}$ convergence of both matrix densities, hence strong $L^1_{\mathrm{loc}}$ convergence of their squares. Both variations use the same infimum because signature equates the total chiral energies on the original smooth type.

## Stationarity of the smooth limit

Fix a smooth symmetric tensor $H$ compactly supported in $D$. Use the same transplant for $m_i+sH$ and denote the resulting source metric by $G_i(s)$. For a sufficiently small fixed range of $s$ the local metrics stay uniformly positive. In the all-lowered curvature formula the principal part varies linearly in $s$ with derivative $L(D^2 H)$. The remaining Taylor terms and their first two $s$ derivatives are bounded in $L^2$ by smooth coefficient bounds and the uniform $L^4$ first-derivative bound. In particular $\mathcal R(m_i+sH)$ and its first two $s$ derivatives are bounded in $L^2$. Applying the projections, whose first two $s$ derivatives are uniformly bounded, gives

$$
E_\pm(G_i(s))=e_i+s A_i+O_H(s^2),
\qquad A_i=2\int_D\langle F_\pm(m_i),DF_\pm(m_i)[H]\rangle dx,
$$

with both the remainder constant and $|A_i|$ bounded independently of $i$. Choose the $s$ interval still smaller to keep the whole energy path below $8\pi^2$. The same eigenvalue argument gives positive Yamabe sign for both directions of the variation. Minimality implies $sA_i\ge -(e_i-I^+(M))-C_Hs^2$.

The derivative $DF_\pm(m_i)[H]$ converges weakly in $L^2$ to $DF_\pm(h)[H]$. Its only weak curvature term is $DP^pm_{m_i}[H]\mathcal R(m_i)$, with uniformly converging coefficients. The curvature variation has the fixed principal term $L(D^2H)$, and its lower-order terms converge strongly in $L^2$. The strong convergence of $F_\pm(m_i)$ on the support of $H$ therefore gives $A_i\to A_h$. Taking the index limit at fixed $s$ and then sending $s\to0$ from both sides gives $A_h=0$. Control of this quadratic remainder matters because the full-curvature defect can be merely weak, and the projections for a fixed nonzero $s$ can sample it.

Taking the sum of the two chiral first variations gives compactly supported stationarity of the full Weyl functional $4(E_++E_-)$, whose gradient is $-4B_h$ in the owning convention. Therefore $B_h=0$ on the smooth marked open set. Applying this on coordinate compacts and using smoothness across any ordinary marks gives the same conclusion on a supplied smooth filled base. These arguments replace the two uses of the source Bach norm in the marked-recovery curvature lemma. The Yamabe factor and transfer arguments still use their own geometric and comparison hypotheses. [Bahuaud–Guenther–Isenberg–Mazzeo, arXiv:2508.06633v1, §1](https://arxiv.org/html/2508.06633v1#S1) · [Marked recovery, Theorem `thm:marked-recovery` and Lemma `lem:weyl`](../../investigations-1/03_first_order_twistor/01_sections_and_connections/02_dirac_collar_extraction/manuscript/physical_volume_and_marked_conformal_limits.tex#L74)

## Supplied smooth rescaled component

For volume-one source Yamabe metrics and smooth, oriented whole-truncation convergence of $\iota_i^*(\lambda_i^{-2}g_i)$ with $\lambda_i\downarrow0$, the local hypotheses hold on each fixed compact, with $f_i=\lambda_i^{-1}$. The scalar curvature tends to zero because $\lambda_i^2Y_i\to0$, and the stationarity argument gives $B_h=0$. These were the two limit equations at the start of the owning same-type descent proof. In that proof the use of small source Bach norm is to obtain the latter equation. The transported Yamabe inequality and curvature budgets continue to hold, and the end and cap arguments continue with their existing hypotheses. For the removable point after conformal inversion, constant scalar curvature and obstruction-flatness at the puncture are required, together with the stated $C^0$ orbifold asymptotics. With the trivial group they give a smooth extending chart. [Same-type ALE descent, Theorem `thm:ale-descent`](../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/marked_necks_and_chiral_energy.tex#L556) · [Ache–Viaclovsky, Definition 1.6, Theorem 1.8 and Remark 7.2](https://arxiv.org/abs/1106.1249)

For the resulting single AE end, the owning identities give $d=\int_X|\operatorname{Ric}_h|^2=4e_X$ and $d\le4e+y^2/12-32\pi^2$, where $e=\lim e_i$, $y=\lim Y_i$ on a subsequence and $e_X$ is the positive-chiral energy of the compactification. Its positive-Yamabe Bach-flat class has $e_X>4\pi^2$ by nonflatness and the closed gap. Its Yamabe constant is at least $y$ and is strictly below $Y_{\rm rd}$ by sharp Yamabe rigidity. Thus $e-e_X\ge(Y_{\rm rd}^2-y^2)/48>0$. Since $e-e_X<4\pi^2-\delta$, the owning marked cap transfer puts the compactification on the original smooth type and gives a strict competitor at $e=I^+(M)$. The qualitative strict inequality suffices here. This application requires the supplied full smooth comparison, positive differentiated end order and the actual topology of the marked truncations. A smooth limit on individual balls alone gives local stationarity and no global cap conclusion. [Same-type descent, equations `eq:AEenergy` and `eq:residual`](../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/marked_necks_and_chiral_energy.tex#L611) · [Schoen, Theorem 2](https://math.jhu.edu/~js/Math646/schoen.yamabe.pdf)

Signed assessment, OpenAI Codex, 25 November 2026.
