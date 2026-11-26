# The fixed cutoff at a round umbilic face

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. The [frozen request, revision 1](../../research-progress/handoffs/ACTIVATION_20261126.md) records the lead selection GPT-6.2 Astra/ultra and the helper dispatch GPT-6.2 Sol/ultra. The helper's serving model and reasoning effort are unavailable for independent confirmation. Inputs are the [deformation overview](../research-overview/OVERVIEW.md), [plan](../research-plan/PLAN.md), [register](../research-progress/REGISTER.md) and [shared comparison](../../brainstorm/notes/MARKED_COLLAR_AND_CUT_20261126.md) at `c8fb08dcf2e39ae68d4c9d9ebd6a69893ce9cce4`. All 17 [frozen source hashes](../../references/README.md#working-inputs) matched on replay. The conformal transformation was checked against Curry–Gover §6.1, Proposition 6.1 and Remark 6.5, with the tensor and trace conventions converted below. [Author-hosted text](https://math.okstate.edu/people/scurry/cg15.pdf)

The return for DEF-E01/E02a is a smooth marked metric path on one fixed source. It has uniform cost $O(w_L+w_R)$ in each joined chiral energy. For a nonzero trace-free second jet the signed leading cost is positive and quadratic in the path parameter, even on each complete side. The calculation uses the exact compatible face and a fixed Gaussian chart. Its constants are for a single smooth source and the chosen scale and profiles.

## Normalization and both markings

Take a compact smooth oriented Riemannian four-manifold $(M,g)$, a smooth separating embedded bicollar with middle $\Sigma\cong S^3$, and its two complete sides $P_L,P_R$. Let $a:S^3\to\Sigma$ be the prescribed middle marking, let $\nu$ be the $g$-unit normal pointing toward $P_R$, and let $\gamma$ be unit round. Assume $a^*(g|_\Sigma)=e^{-2v}\gamma$ for a smooth $v$, and $K=H g|_\Sigma/3$, where $K(X,Y)=g(\nabla_X\nu,Y)$ and $H=\operatorname{tr}K$. These hypotheses specify both the intrinsic class in the given angular marking and the extrinsic first jet.

In the original $g$-Gaussian chart $\Psi(x,q)=\exp^g_{a(x)}(q\nu)$, set

$$
 u(\Psi(x,q))=\rho(q)\bigl(v(x)-q\,H(a(x))/3\bigr),
$$

with one fixed smooth $\rho$ equal to one near zero and supported inside the available collar. Extend by zero. For $\widehat g=e^{2u}g$, the new normal is $\widehat\nu=e^{-u}\nu$ along the face. Using $\widehat\nabla_XY=\nabla_XY+X(u)Y+Y(u)X-g(X,Y)\nabla u$ and tangential $X,Y$ gives $\widehat K=e^u(K+\nu(u)g|_\Sigma)$. Thus $a^*\widehat g|_\Sigma=\gamma$ and $\widehat K=0$. The value $v$ and the normal derivative $-H/3$ have been prescribed independently.

Use the new signed normal exponential chart

$$
 F(x,t)=\exp^{\widehat g}_{a(x)}(t\widehat\nu),
 \qquad F^{-1}(p)=(a^{-1}(\pi_{\widehat g}(p)),t_{\widehat g}(p)).
$$

Here $\pi_{\widehat g}$ and $t_{\widehat g}$ are the normal foot and signed distance on the tubular chart. Compactness of the embedded face gives a fixed positive chart radius on each side. For an original bicollar $\Phi$ with $\Phi(x,0)=a(x)$, the two coordinate changes on their overlap are $\Phi^{-1}\circ F$ and $F^{-1}\circ\Phi$. At a constant normalized height $t_j$ the marking is $x\mapsto F(x,t_j)$ with inverse the first component of $F^{-1}$. The original outer-face markings remain the supplied restrictions of $\Phi$ and $\Phi^{-1}$. At the cut the two copies of the angular marking are $a_L,a_R$. Reassembly uses $a_R\circ a_L^{-1}$ from left to right and $a_L\circ a_R^{-1}$ from right to left. Their outward normals are respectively $+\nu$ and $-\nu$, so the reassembly reverses boundary orientation.

The two widths $w_L,w_R>0$ below are taken independently in the actual $t$-chart, inside the respective available physical regions. If the supplied widths are in the old signed Gaussian coordinate $q$, then $q(F(x,t))=e^{-v(x)}t+O(t^2)$ uniformly on the face. Consequently any sufficiently small $w_j$ at most a fixed positive multiple of the old available width on side $j$ fits inside it. For another signed collar parameter $q$ the coefficient is $dq(\widehat\nu)>0$ at the middle, with fixed upper and lower bounds. The numerical widths in the two gauges can differ. Stretching an existing product near its middle happens after the transition strips have been matched.

## Cutoff path and bounds

Write $F^*\widehat g=dt^2+h_t$, so $h_0=\gamma$, $\partial_t h_0=0$. On each side put $t=\epsilon_j w_j r$, $0\le r\le1$, with $\epsilon_L=-1$, $\epsilon_R=1$. Write $\chi_j(r)$ for the fixed half-profile used there, with $0\le\chi_j\le1$, $\chi_j=1$ near $0$, and $\chi_j=0$ near $1$. An even cutoff is the case $\chi_L=\chi_R$. The calculation uses the two half-profiles of any fixed smooth cutoff with these properties. For $0\le s\le1$, set

$$
 D_t=h_t-\gamma,qquad b=1-s\chi_j(r),qquad h_{t,s}=\gamma+bD_t.
$$

Each half-profile is constant near the middle, so the formulas join smoothly through $t=0$, including when the widths differ. The metric is positive as a convex combination of $\gamma$ and $h_t$. Near both outer strip faces it equals the normalized source. Push it forward by $F$ and extend by $\widehat g$ to obtain $N_s$ on the supplied smooth manifold. The physical path $G_s=e^{-2u}N_s$ starts at $g$ and equals $g$ outside the changed strips and near each outer face. The angular marking and the two complete physical sets remain fixed. If an exact product representative is required on the physical path, use $e^{2s\beta u}G_s$ with a smooth $\beta=1$ near the middle and supported in the terminal product germ. It gives an exact $dt^2+\gamma$ germ at $s=1$ and retains exact agreement with $g$ near the outer faces.

With angular covariant differentiation $\nabla^\gamma$, the fixed-chart bounds are $\|(\nabla^\gamma)^q\partial_t^pD_t\|_\gamma\le C|t|^{2-p}$ for $p+q\le2$. For $p=2$ the right side is interpreted as $C$ at the origin. These follow by Taylor expansion using the zero angular tensors $D_0$ and $\partial_tD_0$. On each side the derivatives through order two are

$$
\begin{aligned}
 (\nabla^\gamma)^q(bD_t)&=b(\nabla^\gamma)^qD_t &&(0\le q\le2),\\
 (\nabla^\gamma)^q\partial_t(bD_t)&=b(\nabla^\gamma)^qD_t'+b'(\nabla^\gamma)^qD_t &&(0\le q\le1),\\
 \partial_t^2(bD_t)&=bD_t''+2b'D_t'+b''D_t,&
 b'&=-s\epsilon_j\chi_j'/w_j,qquad b''=-s\chi_j''/w_j^2.
\end{aligned}
$$

These yield bounds $C_j w_j^{2-p}$ for every $p+q\le2$, uniform in $s$. If widths are at most one, smoothness and compactness on the fixed chart give uniform inverse-metric, volume-density and curvature bounds in the normalized gauge. The constants use the ellipticity of $h_t$ against $\gamma$, its mixed derivatives on that chart, the fixed angular geometry, and the two cutoff derivative bounds. In particular, each original or deformed strip has chiral energy $O(w_j)$ in either chirality.

For a positive conformal change $e^{2z}$, the Hodge star on two-forms stays fixed, the Weyl operator weight is $e^{-2z}$, and the volume weight is $e^{4z}$. Both chiral energy densities are unchanged pointwise. Thus the normalization, its restoration, and the optional final product gauge contribute zero energy on every measurable region, even when their derivatives are large. All these paths have the same chiral costs. With $\sigma\in\{+,-\}$ put $m_{j,\sigma}=E_\sigma(g;P_j)$, $\Delta_{j,\sigma}(s)=E_\sigma(G_s;P_j)-m_{j,\sigma}$, and $e_\sigma=E_\sigma(g;M)$. The signed difference is exactly the strip increment, so

$$
 |\Delta_{j,\sigma}(s)|\le C_j w_j,qquad
 E_\sigma(G_s;M)=e_\sigma+\Delta_{L,\sigma}(s)+\Delta_{R,\sigma}(s)\le e_\sigma+C_Lw_L+C_Rw_R.
$$

The signs are taken in the ambient orientation on both sides. Reversing only the normal convention exchanges the left and right labels with their widths and profiles. Reversing the ambient orientation exchanges the two chiralities. On a closed homotopy four-sphere the joined chiral totals agree by signature, while their full-side components are measured separately. [Energy and norm conventions](../../../../master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex) · [Existing first-order splice in a fixed marked annular chart](../../../../master/manuscript/first_order_splice.tex)

## Signed coefficient from the trace-free second jet

Let $A=\tfrac12\partial_t^2 h_t|_{t=0}$, with $A^\circ=A-\tfrac13(\operatorname{tr}_\gamma A)\gamma$. Define $B_j(r)=\tfrac12(r^2\chi_j(r))''$. The Taylor formula $D_t=t^2A+O(t^3)$ holds with its differentiated remainders through order two. At $t=\epsilon_j w_jr$, the derivative formulas give

$$
 \tfrac12\partial_t^2 h_{t,s}=(1-sB_j(r))A+O(w_j).
$$

The estimates in this calculation are uniform for $(x,r,s)\in S^3\times[0,1]^2$ and after up to two $s$-derivatives. Indeed the two-jet of $h_{t,s}$ is affine in $s$, and each error at this stage has the same Taylor bounds after one derivative and vanishes after two. The odd sign of $\partial_t$ on the left cancels on taking the displayed second derivative.

Use the curvature convention in which the real two-form operator of the unit round sphere is the identity and $R_{0i0j}$ denotes its normal-normal block. For $dt^2+h_{t,s}$ the Gaussian normal block is $-\partial_tK_{t,s}+K_{t,s}h_{t,s}^{-1}K_{t,s}$, with $K_{t,s}=\tfrac12\partial_th_{t,s}=O(w_j)$. The mixed blocks are $O(w_j)$ by Codazzi, since angular derivatives of $K_{t,s}$ are $O(w_j)$. The tangential block is the round identity plus $O(w_j^2)$ by Gauss, since $h_{t,s}=\gamma+O(w_j^2)$ through two angular derivatives and the quadratic $K_{t,s}$ correction is $O(w_j^2)$. These block bounds also hold after applying $\partial_s$ or $\partial_s^2$ to the errors. Passing to an oriented metric-orthonormal frame from a $\gamma$-orthonormal angular frame uses a positive matrix inverse square root $I+O(w_j^2)$. This also controls its first two $s$-derivatives. For $\alpha_i=dt\wedge e^i$, take $\eta_i=*\alpha_i$, so $(\alpha_i\pm\eta_i)/\sqrt 2$ are orthonormal chiral bases. The restricted curvature block is the average of the normal and tangential diagonal blocks plus signed mixed terms of order $w_j$. Its trace-free part is the Weyl block, giving

$$
 W^\pm=-\tfrac12(1-sB_j(r))A^\circ+O(w_j),qquad
 dV_{N_s}=(1+O(w_j^2))\,|dt|\,dA_\gamma .
$$

The error, with its first two $s$-derivatives, remains bounded at the stated order because curvature, the projections, the trace and the density are smooth functions of the bounded metric jets on the fixed ellipticity range. This accounts for the factor $1/2$ on each chiral operator, hence $1/4$ in either squared norm when the second jet means $A$.

For each half-strip, $\int_0^1 B_j\,dr=0$ because $(r^2\chi_j)'=0$ at both endpoints. Expanding $(1-sB_j)^2-1$ and integrating therefore leaves only $s^2\int_0^1B_j^2\,dr$. The profile integral is strictly positive since $B_j=1$ near zero. It also equals $\tfrac14\int_0^1r^4(\chi_j'')^2\,dr$. To see this, write $B_j=(r^2/2)\chi_j''+2r\chi_j'+\chi_j$. In its squared integral, the cross terms involving $\chi_j''$ integrate to $\int(\chi_j^2-r^2(\chi_j')^2)$ and $-3\int r^2(\chi_j')^2$, respectively. The remaining cross term is $-2\int\chi_j^2$. All integrations are over $[0,1]$, with boundary terms zero. Subtracting the source and using $|dt|=w_j\,dr$ yields the full-side formula for both chirality choices

$$
 \boxed{\displaystyle
 \Delta_{j,\sigma}(s)=w_j s^2 c_j+O_{C^2([0,1])}(w_j^2),qquad
 c_j=\frac{\|A^\circ\|_{L^2(S^3,\gamma)}^2}{16}
          \int_0^1 r^4(\chi_j''(r))^2\,dr .}
$$

If the trace-free second jet is written as $J^\circ=(\partial_t^2 h_t|_{t=0})^\circ$, the coefficient is $\|J^\circ\|_2^2\int_0^1 r^4(\chi_j'')^2\,dr/64$. For example the normalized collar $dt^2+\gamma+t^2 A$ with $A=\varepsilon((\theta^1)^2-(\theta^2)^2)$ for a unit round left-invariant coframe of $S^3$ has $\|A^\circ\|_2^2=4\pi^2\varepsilon^2$. For nonzero $\varepsilon$ this gives $c_j=(\pi^2\varepsilon^2/4)\int_0^1 r^4(\chi_j'')^2\,dr>0$ within a fixed positive-definite collar.

If $A^\circ\not\equiv0$, each signed increment has positive leading term at each fixed $s>0$. For sufficiently small $w_j$, the remainder bound gives $\Delta_{j,\sigma}''(s)>0$ on $[0,1]$, and $\Delta_{j,\sigma}(1)>0=\Delta_{j,\sigma}(0)$. Convexity then places the path maximum of each complete side and the joined path at $s=1$, with joined maximum

$$
 e_\sigma+w_L c_L+w_R c_R+O(w_L^2+w_R^2).
$$

The reverse path, at parameter $\tau$ measured from the product end, has signed side change $\Delta_{j,\sigma}(1-\tau)-\Delta_{j,\sigma}(1)$, with leading term $w_j c_j((1-\tau)^2-1)$. The same markings apply in either path direction. When $A^\circ\equiv0$, the displayed leading coefficient vanishes and the remainder bounds the signed increment in absolute value. An exact cylindrical source has zero increment throughout. The positive coefficient describes this fixed path for a nonzero jet, and its proof gives the endpoint peak without assuming monotonicity at very small $s$.

## Joined positivity and finite-source use

On a closed homotopy sphere with $Y([g])>0$ and $e_+<8\pi^2$, take the two widths sufficiently narrow that the joined bound is strictly below $8\pi^2$ all along the path. The scalar-flat wall then gives positivity throughout. In the exact product germ a nonnegative interior bump in the normal length element stretches the collar at zero Weyl cost, with the same marking and joined positive Yamabe lower bound as in the master's short-cut argument. On either side, attach a product half-cylinder in the marking $a_j$. For outward arclength $\ell$, take the positive multiplier to be one near the joining sphere and $e^{-2\ell}$ for large $\ell$. The radial map $r=e^{-\ell}$ gives the smooth conformally flat cap with inverse $\ell=-\log r$ away from its center. The boundary map from the cap to the raw side is $a_j$, with inverse $a_j^{-1}$. Orient the cap so that this map reverses the induced boundary orientations, extending the side's ambient orientation. The compact-support test on the stretched joined manifold and density across the compactifying point give positive capped classes by the same argument. The cap in either chirality has exactly the complete-side energy $m_{j,\sigma}+\Delta_{j,\sigma}(1)$. Thus the short width choice is priced before the free stretch, and all resulting signed computations refer to the actual two full sides. [Strict wall and short marked cut, `eq:zero-wall` and `prop:short-cut`](../../../../master/manuscript/variational_comparison.tex) · [Finite cut and smooth reassembly, `prop:cut-energy`](../../../../master/manuscript/marked_cut.tex)

The narrow-width quantifier is at a fixed smooth source and marking. A sequence requires either available widths and constants at each physical index or separate uniform controls. The calculation leaves the geometric selection of a compatible round umbilic face open. Any initial metric adjustment outside the conformal class requires its own complete-side and joined path budget.
