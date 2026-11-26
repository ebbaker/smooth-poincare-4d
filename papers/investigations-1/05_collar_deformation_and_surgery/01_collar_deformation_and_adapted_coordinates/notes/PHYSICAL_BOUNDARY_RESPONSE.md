# The coupled boundary response at one physical width

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded DEF-E03f, [issue 1, row 4](../../research-progress/handoffs/NONLOCAL_PAIR_AND_NATIVE_STRIP_20261126.md), on the actual E61 marking. The issue specifies GPT-6.2 Sol/ultra for execution. Actual serving model and effort are unavailable. The working checkout at intake was `19c187ad8dbe936cf165017c753a94add775ebaf`, and the issue cites baseline `5ddaabd76595b3679d1ea415e9f6d9643802f9ef`. The file versions inspected are recorded below. This is a fixed-index analytical test for one supplied cap and one positive width. [Finite curved connector](FINITE_CURVED_CONNECTOR.md) · [Hyperbolic reference](../../notes/SPACE_FORM_REFERENCE.md) · [E61 marked bicollar](../../../../master/01_fixed_type_variational_descent/manuscript/spectral_windows.tex) · [Balanced enlargement](../../../../master/01_fixed_type_variational_descent/manuscript/balanced_exterior.tex)

## The physical split and the exact sign

Fix a smooth volume-one positive Yamabe source $g=g_i$ on the oriented smooth homotopy four-sphere $M$. Its scalar curvature is the positive constant $Y=Y([g])$. Let $D$ denote the original selected parametrized disk, or one supplied balanced enlargement, with smooth face $(\Sigma,h)$ and complete exterior $V=M\setminus\operatorname{int}D$. Use $\nu$ pointing from $D$ into $V$ and write $K=\nabla\nu|_{T\Sigma}$ and $H=\operatorname{tr}_h K$. The outward normal on $V$ is $-\nu$. Let $C$ be a smooth standard ball with a smooth Riemannian cap metric $p$ inducing exactly $h$ in the given marking and with outward trace $H$. Match by the marked identification and its inverse. This gives the original oriented smooth type, relative to the exterior, by the disk marking as in the [curved-filling construction](../../notes/SPACE_FORM_REFERENCE.md#the-scalar-form-and-a-finite-width-comparison).

Let $C_w$ mean the entire cap with the strip of inward Gaussian width $w>0$ changed by the connector below, so that the complete metric $g_w$ is smooth across the same face. The trace and its $L^2$ measure are the same for $V,C,C_w$. Write $L_X=-6\Delta_X+R_X$, with $\Delta=\operatorname{div}\operatorname{grad}$, and $Q_X(f)=\int_X(6|df|^2+R_X f^2)\,dV$. For $X$ with positive first Dirichlet eigenvalue, let $\mathcal H_X\varphi$ solve $L_X f=0$ with trace $\varphi$. Set $\mathcal N_X\varphi=\partial_{\nu_X}\mathcal H_X\varphi$ in the outward direction. The pairings below are real $H^{1/2}(\Sigma)$–$H^{-1/2}(\Sigma)$ pairings based on $dA_h$. In particular $\mathcal N_V$ uses the full unchanged exterior and its physical metric.

Green's formula and zero-trace orthogonality give, for each piece,

$$
Q_X(f)=6\langle\varphi,\mathcal N_X\varphi\rangle_h
       +Q_X(f-\mathcal H_X\varphi).
$$

At finite width define the form and its lowest Rayleigh value by

$$
\mathcal B_w(\varphi)=6\langle\varphi,(\mathcal N_V+\mathcal N_{C_w})\varphi\rangle_h,
\qquad
\mu_w=\min_{\|\varphi\|_{L^2(h)}=1}\mathcal B_w(\varphi).
$$

$Q_V(f)\ge\min(6,Y)\|f\|_{H^1(V,g)}^2$ gives Dirichlet positivity immediately. If the first Dirichlet eigenvalue of $C_w$ is positive, the signs of $Y([g_w])$ and $\mu_w$ agree, including equality at zero. Indeed, minimization at fixed trace gives $\mathcal B_w$, with strictly positive zero-trace remainder. If the first Dirichlet eigenvalue of $C_w$ is negative, extend its eigenfunction by zero to get a negative test. If that eigenvalue is zero, extend the positive first Dirichlet eigenfunction $\psi$ by zero. It pairs under the joined form with any test of common trace $\varphi$ as $6\int_\Sigma\varphi\,\partial_{\nu_{C_w}}\psi\,dA_h$. The normal derivative is strictly negative by the boundary point lemma for a positive eigenfunction. Adding a small positive multiple of a test with trace one to the zero extension gives a strictly negative quadratic form. Thus at a nonpositive cap Dirichlet eigenvalue the joined sign is strictly negative, and the formula for $\mathcal B_w$ was asserted only in the positive-Dirichlet case. The boundary point lemma also applies with a sign-changing scalar potential here by shifting the potential by its negative part and using $\psi\ge0$.

For the compactness and coercivity in the trace test, set $U_X=\mathcal H_X1$, which is strictly positive up to the face. Its negative part vanishes by Dirichlet positivity, and the interior strong maximum principle for nonnegative solutions gives strict positivity. Direct integration by parts in $f=U_X z$ gives

$$
Q_X(f)=G_X(f)+\int_\Sigma \beta_X\varphi^2\,dA_h,\qquad
G_X(f)=6\int_X U_X^2|d(f/U_X)|^2\,dV,\qquad
\beta_X=6\partial_{\nu_X}U_X.
$$

Multiplication by $U_X^{\pm1}$ is bounded on $H^1$. On each fixed piece the Poincaré inequality with boundary term bounds $\|f\|_{H^1}^2$ by a constant times $G_X(f)+\|\varphi\|_2^2$. This inequality follows by compactness: a sequence with unit $L^2$ norm, vanishing gradient and vanishing trace converges to a constant with zero trace. The trace inequality therefore makes every sequence of extensions minimizing $\mathcal B_w$ on the unit trace sphere bounded in piecewise $H^1$. Weak compactness there and compactness of the trace into $L^2(h)$ give an attained minimum by this identity. If $\mu_w>0$, put $B=\|(\beta_V+\beta_{C_w})_-\|_\infty$. Then the full $Q_{g_w}$ controls the common trace by $\|\varphi\|_2^2\le Q_{g_w}/\mu_w$ and controls $\sum_XG_X$ by $(1+B/\mu_w)Q_{g_w}$. If $C_E,C_\Sigma$ bound the squared piecewise $H^1$ norm by $C_E\sum_XG_X+C_\Sigma\|\varphi\|_2^2$, its coercivity constant is at least $[C_E(1+B/\mu_w)+C_\Sigma/\mu_w]^{-1}$. The compact four-dimensional Sobolev inequality turns this into a strict Yamabe lower bound after dividing by the $H^1\to L^4$ squared norm constant. If $\mu_w=0$, a minimizing trace and its two harmonic extensions give a nonzero zero test. If $\mu_w<0$, they give a negative one. The same trace argument applies to the piecewise form $Q_0=Q_V+Q_C$ before the connector, defining $\mathcal B_0,\mu_0$ when the reference cap has positive Dirichlet form.

## The boundary correction and the exterior contribution

Let the reference $b$ on $C$ induce $h$, with outward trace $H_b$. Choose the smooth positive multiplier $u$ with $u=1$ and $\partial_{\nu_b}\log u=(H-H_b)/3$ on $\Sigma$, and put $p=u^2b$. The shape transforms by $S_p=u^{-1}(S_b+\partial_{\nu_b}\log u\operatorname{Id})$. In four dimensions $L_{u^2 b}f=u^{-3}L_b(uf)$. At the face, $\nu_p=\nu_b$ and $\partial_{\nu_p} f=\partial_{\nu_b}(uf)-\varphi\partial_{\nu_b}u$. Thus if $b$ has positive Dirichlet form,

$$
\mathcal B_0(\varphi)
=6\langle\varphi,(\mathcal N_V+\mathcal N_b)\varphi\rangle_h
+2\int_\Sigma(H_b-H)\varphi^2\,dA_h.
$$

This is the normal derivative picked up by conformal normalization. The uncorrected exterior and the trace-matched cap already have opposite outward means, so no further mean term is added. The conformal covariance and Green's formula also give the cap's positive Dirichlet form when the reference is Euclidean or hyperbolic in a bounded flat conformal chart. See the compact Yamabe conventions in [Lee–Parker, equation (2.7)](https://users.math.msu.edu/users/parker/YamabeProblem.pdf) and the one-sided Robin trace calculation in the [marked boundary manuscript](../../../04_hypersurface_immersions/01_immersed_handle_constructions/manuscript/boundary_class.tex).

In that flat chart write $b=\Omega^2 b_{\rm E}$, with $\Omega=1$ in the Euclidean case, and set $c=(H_b-H)/3$, $\ell=\partial_{\nu_b}\log\Omega$. If $F_\varphi$ is Euclidean harmonic with boundary data $\Omega\varphi$, then $\mathcal H_C\varphi=(u\Omega)^{-1}F_\varphi$. Since $\nu_b=\Omega^{-1}\nu_{\rm E}$ and $dA_h=\Omega^3dA_{\rm E}$ at the face,

$$
6\mathcal N_C\varphi
=6\Omega^{-2}\partial_{\nu_{\rm E}}F_\varphi+6(c-\ell)\varphi,\qquad
6\langle\varphi,\mathcal N_C\varphi\rangle_h
=6\int_C |dF_\varphi|^2\,dV_{\rm E}+6\int_\Sigma(c-\ell)\varphi^2\,dA_h.
$$

In particular the real scalar function $\beta_C=6\mathcal N_C1$ needs one Euclidean harmonic solve with boundary value $\Omega$, and equals $2(H_b-H)$ directly for a flat reference. The relative size of the normal derivative $\ell$ and the trace gap $c$ can matter even for a hyperbolic first-jet match.

The exterior contributes a strictly positive form. The elementary lower bound is $6\langle\varphi,\mathcal N_V\varphi\rangle_h\ge\min(6,Y)\|\varphi\|_2^2/C_{\rm tr,V}$ if $\|f|_\Sigma\|_2^2\le C_{\rm tr,V}\|f\|_{H^1(V,g)}^2$. For a lower bound using only the physical outward collar from the same face, use $0\le s\le a$ increasing *into* $V$, where $a$ is an available native Gaussian width. Let $M_H=\sup_{[0,a]\times\Sigma}|\partial_s\log dA_{h_s}|$ and set

$$
\alpha=\frac{Y}{12+6a M_H+Ya^2/4},\qquad v(s)=1-\alpha s(a-s).
$$

On that collar $L_Vv=Yv-6(v''+(\partial_s\log dA_{h_s})v')\ge0$. Also $U_V\le1$ by the maximum principle and $v=1$ at both endpoints. Comparison gives $U_V\le v$ on the collar. The outward derivative at $s=0$ therefore satisfies $\beta_V=6\partial_{\nu_V}U_V\ge 6\alpha a>0$. This bound needs only the exterior geometry on that collar, in the physical gauge. One can take $a=w$ when that much outward Gaussian width is measured. An upper bound in the constant trace direction follows from minimizing over extensions of one:

$$
\int_\Sigma \beta_V\,dA_h=Q_V(U_V)\le Q_V(1)=Y\operatorname{Vol}_g(V).
$$

Writing $P_X(\varphi)=\inf_{\mathrm{tr}f=\varphi}G_X(f)$ gives $\mathcal B_0=P_V+P_C+\int_\Sigma(\beta_V+\beta_C)\varphi^2\,dA_h$. Each $P_X$ is nonnegative and has exactly the constants in its kernel. Thus the infimum of the summed row $\beta_V+\beta_C$ is a lower bound for $\mu_0$, and its average is an upper bound. If the sum is constant, it equals $\mu_0$. A nonnegative sum which is positive somewhere also gives $\mu_0>0$, by attainment and the characterization of the kernels. A negative average forces $\mu_0<0$. The constant trace tests one direction when the sum varies. The exact spectral threshold is zero for the full minimized form.

## A bracket at the actual connector width

Choose $w$ within the common inward Gaussian width for the original continuation and this normalized cap. Use the finite connector $dt^2+q_t$ from the [previous calculation](FINITE_CURVED_CONNECTOR.md#guarded-derivatives-and-the-weyl-cost). In these charts $q_t=p_t+\chi(-t/w)(a_t-p_t)$ on $[-w,0]$, with $a_t$ the physical continuation of $g$ from the face. The initial metrics match $h$ and trace $H$. Thus their first normal difference is $2d$, with $d=h((K^0-S_b^0)\cdot,\cdot)$ trace free, and $q''_t=-2(x\chi(x))''d/w+O(1)$. The inverse identity and $q_t-h=O(w)$ bound $\operatorname{tr}_{q_t}d=O(w)$. Consequently the inverse-width contribution in $-\operatorname{tr}_{q_t}q_t''$ is bounded using the same finite jet guards. Each chiral cost still has an inverse-width leading term for nonzero $d$ at fixed geometry.

Use the [finite scalar bounds](FINITE_CURVED_CONNECTOR.md#scalar-cancellation-and-a-finite-positive-endpoint-test) at this $w$. Let $\lambda h\le p_t,a_t\le\Lambda h$ be the measured chart bounds, $\kappa$ the bound for the relative inverse-metric density error, $r_+$ the upper volume ratio, and $B_R,B_p$ the sup bounds for $|R_{g_w}|,|R_p|$ on the strip. For clarity $\kappa=\max\{1-r_-/(1+\eta),r_+/(1-\eta)-1\}$ with $r_\pm=(1\pm\eta)^{3/2}$ and $\eta=\lambda^{-1}(2w\|d\|_\infty+w^2M_2)<1$, where $M_2$ bounds the second normal jets in those charts. Set

$$
A(w)=6\kappa+(r_+B_R+B_p)\Lambda^{3/2}w^2\lambda^{-3/2},
\qquad
B(w)=2w(r_+B_R+B_p)\Lambda^{3/2}.
$$

For a cap test $f$ with trace $\varphi$, the exact form difference satisfies

$$
|Q_{C_w}(f)-Q_C(f)|\le A(w)\|df\|_{L^2(p)}^2+B(w)\|\varphi\|_2^2.
$$

The kinetic term is bounded by $6\kappa\|df\|_2^2$. In a normal fiber the fundamental theorem of calculus gives $|f(-s)|^2\le2|\varphi|^2+2s\int_0^s|\partial_t f(-v)|^2dv$. Integration to $w$ bounds the latter by $w^2$ times the normal energy, and transfer of the $p_t$ density gives the displayed factors. This uses the trace on the cap itself and makes the potential error quadratic in width on zero-trace tests.

Choose cap-only constants $A_C,B_C$ with $\|df\|_{L^2(p)}^2\le A_C G_C(f)+B_C\|\varphi\|_2^2$. For $f=U_C z$, write $m=\inf U_C$, $M_0=\sup U_C$, and $M_1'=\sup|dU_C|_p$. If $P$ bounds $\|z\|_2^2$ by $P(\|dz\|_2^2+\|\mathrm{tr}z\|_2^2)$ on $C$, one may use $A_C=(2M_0^2+2P(M_1')^2)/(6m^2)$ and $B_C=2P(M_1')^2$. Define $\delta=A(w)A_C$ and $\zeta=A(w)B_C+B(w)$. If $\delta<1$, the zero-trace correction leaves $C_w$ Dirichlet-positive. Minimizing at every trace yields the two-sided estimate

$$
P_V+(1-\delta)P_C+\int_\Sigma(\beta_V+\beta_C-\zeta)\varphi^2\,dA_h
\ \le\ \mathcal B_w(\varphi)\ \le\
P_V+(1+\delta)P_C+\int_\Sigma(\beta_V+\beta_C+\zeta)\varphi^2\,dA_h ,
$$

where the $P_X$ are evaluated at $\varphi$. The exterior is identical on the two sides of this bracket. With $\beta_{\min}=\inf_\Sigma(\beta_V+\beta_C)$ it implies

$$
(1-\delta)\mu_0+\delta\beta_{\min}-\zeta\ \le\ \mu_w\ \le\
(1+\delta)\mu_0-\delta\beta_{\min}+\zeta.
$$

The single constant-trace cap response and the measured exterior collar give $\mu_w\ge\inf_\Sigma\beta_C+6\alpha a-\zeta$. For a flat reference and $\zeta<6\alpha a$, positivity permits a negative mean gap down to $H_b-H>(\zeta-6\alpha a)/2$ pointwise. The constant trace gives $\mu_w<0$ when $\int_\Sigma\beta_C\,dA_h+Y\operatorname{Vol}_g(V)+\zeta\operatorname{Area}_h(\Sigma)<0$. When the lower and upper bounds straddle zero, the finite-width sign remains unmeasured. Equality in a bound is distinct from an exactly vanishing $\mu_w$. At fixed smooth geometry the guards give $\delta,\zeta=O(w)$, and all the constants in the bounds use the supplied physical charts.

## Finite-index cost and what E61 supplies

Use $T=4\pi^2$, $I=I^+(M)<2T$, $e_i=E_\pm(g_i;M)$ and $d_i=e_i-I$. Write $m_i^\sigma=E_\sigma(g_i;D)$ for either chirality, with Hilbert–Schmidt norm on the Weyl endomorphism. For the conformally flat reference cap with its strip the exact ledger at the same $w$ is

$$
E_\sigma(g_w;M)=e_i-m_i^\sigma+c_\sigma(w),\qquad
c_+(w)-c_-(w)=m_i^+-m_i^- .
$$

Here $c_\sigma(w)$ is the entire strip cost and the second identity is closed signature on the same oriented type. Both the raw and capped metrics keep the whole physical exterior literally. The finite estimate has the form $(L_w-b_\sigma)_+^2\le c_\sigma(w)\le(L_w+b_\sigma)^2$ with $L_w=\|(x\chi(x))''\|_{L^2(0,1)}\|d\|_{L^2(h)}/(2\sqrt w)$ and the guarded remainder $b_\sigma$ from the [connector note](FINITE_CURVED_CONNECTOR.md#complete-energy-and-the-test-at-a-charged-index). At positive $\mu_w$ a strict saving relative to $I$ would require $c_\sigma(w)<m_i^\sigma-d_i$ in either sign, and $(L_w+b_\sigma)^2<m_i^\sigma-d_i$ suffices for that comparison. A lower bound $(L_w-b_\sigma)_+^2\ge m_i^\sigma-d_i$ excludes strict descent at this width. Recognition by the energy threshold $T$ instead uses $e_i-m_i^\sigma+c_\sigma(w)\le T$ and the same strict positivity. The cap replaces the whole disk including the core, and these are endpoint tests.

Conversely, on this minimizing source a verified strict cost fit already forces a scalar obstruction. If $E_w=e_i-m_i^\sigma+c_\sigma(w)<I$, then $Y([g_w])\le0$ by the definition of $I$. The scalar-flat Gauss–Bonnet wall excludes equality because $E_w<2T$. In fact the unit-volume Yamabe representative gives

$$
Y([g_w])\le-\sqrt{48(2T-E_w)}.
$$

For a positive cap Dirichlet form this yields an explicit upper bound on the finite boundary threshold. Let $F>0$ be the Yamabe minimizer for $g_w$ normalized by $\|F\|_{4,g_w}=1$. Then $Q_{g_w}(F)=Y([g_w])<0$ and $\|dF\|_2^2\le \|(R_{g_w})_-\|_2/6$. Its trace is bounded by the physical exterior estimate, $\|F|_\Sigma\|_2^2\le C_{\rm tr,V}(\operatorname{Vol}_{g_w}(M)^{1/2}+\|(R_{g_w})_-\|_2/6)$. Since $\mathcal B_w(F|_\Sigma)\le Q_{g_w}(F)$, one obtains

$$
\mu_w\le
-\frac{\sqrt{48(2T-E_w)}}{C_{\rm tr,V}\big(\operatorname{Vol}_{g_w}(M)^{1/2}
+\|(R_{g_w})_-\|_{2,g_w}/6\big)}<0.
$$

Denote the positive fraction in this inequality by $J_w$. Combining it with the lower bracket when $\delta<1$ forces $\beta_C\le\zeta-6\alpha a-J_w$ somewhere on this face. For a Euclidean reference this means $H-H_b\ge(6\alpha a+J_w-\zeta)/2$ at some point. The bound uses the actual smooth endpoint and the unchanged physical trace at this index. More generally $\mu_w=0$ with positive cap Dirichlet form is excluded at every $E_w<2T$. [Closed wall and scalar normalization](../../../../master/manuscript/variational_comparison.tex) · [Existence of the negative Yamabe minimizer, Lee–Parker Theorem 4.5](https://users.math.msu.edu/users/parker/YamabeProblem.pdf)

E61 gives the positive $Y_i$, the physical smooth face and bicollar, fixed selected-sign charge on both complete sides, and a comparison-ball ceiling and small incoming shell mass in the physical curvature measure. The radius selecting the ball uses the auxiliary comparison metric. Smoothness gives positive Gaussian widths at the finite index. These data certify the sign of the exterior contribution, and $d_i\to0$ eventually gives a strict positive allowance $m_i^{s_*}-d_i$ in the selected sign. They give no value for the actual cap response or its jet mismatch and no estimate of a width at which the two guarded tests both pass. At a fixed dyadic enlargement with residual error $r_i^\sigma$ and protected mass $q_i^\sigma$, insert $m_i^\sigma=(1-2^{-k})e_i+2^{-k}q_i^\sigma-r_i^\sigma$, where $r_i^\sigma=E_\sigma(g_i;V)-2^{-k}(e_i-q_i^\sigma)$. The face, response and width must be measured on that enlargement itself. Its raw exterior bound does not measure any of these data. No cap for either selected marking was supplied in this packet.

### Input receipt

SHA-256 prefixes at inspection were `6626a8a20f1b3fcd` (issue), `2575660c6240b615` (deformation manuscript), `cd10e9537da67da9` (connector), `cfbd7149db0f0a66` (space-form reference), `8063d76ad6875e80` (E61), `a9ca27404bc8013a` (E61r2 review), `96ec25cd36bf5d31` (balanced exterior), `d52c8d2ad83e21d0` (closed wall), and `6653690f64c21fae` (marked boundary manuscript). Lee–Parker equation (2.7) and Theorem 4.5 were checked against the author-hosted journal text. The form brackets and sign estimates above are analytical.
