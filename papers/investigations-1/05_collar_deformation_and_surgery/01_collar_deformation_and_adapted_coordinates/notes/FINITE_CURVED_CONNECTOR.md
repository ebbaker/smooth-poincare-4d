# A finite connector for a convex cap with trace matched

26 November 2026, America/New_York · Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded DEF-E03c, [issue 1](../../research-progress/handoffs/TWO_ATTACHMENTS_AND_FACE_ERROR_20261126.md). The request specifies GPT-6.2 Sol/ultra. Actual serving model and effort are unavailable. Input commit `5ddaabd76595b3679d1ea415e9f6d9643802f9ef`. The checked deformation manuscript and spectral-window source have SHA-256 prefixes `734c4860811c69a6` and `8063d76ad6875e80`, respectively. This is a finite endpoint estimate on one supplied marking and gauge. [Owning register](../research-progress/REGISTER.md) · [Exact curved filling, Theorem `thm:convex`](../manuscript/deformation_of_marked_spherical_collars.tex) · [Selected bicollar, Corollary `cor:thin-raw-collar`](../../../../master/01_fixed_type_variational_descent/manuscript/spectral_windows.tex)

## The sides and the width

Fix a smooth Riemannian metric $g$ on an oriented smooth homotopy four-sphere $M$, an actual parametrized disk $D$, its face $(\Sigma,h)$, and the complete exterior $V=M\setminus\operatorname{int}D$. Take the normal from $D$ into $V$, with shape $K$ and mean $H=\operatorname{tr}K$. Suppose a marked strictly convex Euclidean four-ball $C$ with flat metric $b$ induces $h$ in this same marking and has outward shape $S$. Use this boundary identification and its inverse in the gluing. The identification of the two marked disks extends to an oriented diffeomorphism of the glued source relative to the exterior, as in the exact curved filling. All energies below use real chiral Weyl endomorphisms with Hilbert–Schmidt norms and the induced orientation from $M$.

Choose a smooth positive $u$ on $C$ with $u=1$ and $\partial_{\nu_b}\log u=(H-\operatorname{tr}S)/3$ at the boundary. In the inward Euclidean collar this is obtained by multiplying the prescribed linear normal jet of $\log u$ by a smooth cutoff and extending by zero. Put $p=u^2b$. The face shape of $p$ is $S+(H-\operatorname{tr}S)\operatorname{Id}/3$ and its face metric is $h$. Under lowering by $h$, define the symmetric trace-free tensor

$$
d=h\big((K^0-S^0)\,\cdot,\cdot\big).
$$

Use each metric's own signed Gaussian distance $t$, increasing into $V$ and transported from the common face marking. The original metric supplies a smooth continuation $dt^2+a_t$ of the exterior through $t=0$ into $D$. Write the cap as $dt^2+p_t$ in its Gaussian collar. In particular $a_0=p_0=h$ as slice metrics. For the replacement choose $0<w\le W$, where $W$ is a measured buffered common inward Gaussian width for the original continuation and the cap *after* conformal normalization. The extent of the exterior's outer collar enters only in supplying its smooth marked germ. The metric on the entire exterior is retained. Widths here are lengths in these Gaussian charts, with no rescaling of $t$ except in the cutoff argument.

Fix a smooth $0\le\chi\le1$ on $[0,1]$, equal to one near zero and zero near one. On $U_w=[-w,0]\times\Sigma$ set $x=-t/w$, $\psi(x)=x\chi(x)$, and

$$
q_t=p_t+\chi(x)(a_t-p_t),\qquad g_w=dt^2+q_t.
$$

Elsewhere use $p$ on $C$ and $g$ on $V$. The convex interpolation is positive definite. Its plateau agrees with the original germ on the cap side of the seam, and its zero region agrees with the conformal Euclidean cap near the inward boundary of the connector. Thus the endpoint $g_w$ is smooth on the same marked oriented $M$.

## Guarded derivatives and the Weyl cost

Use $D_h=\nabla^h$, $h$-norms and the sum of angular sup norms through order two for $C^2_h$. On the two inward charts of width $W$ suppose $\lambda h\le a_t,p_t\le\Lambda h$, with $0<\lambda\le1\le\Lambda$. Let $M_j$ be the larger of the two suprema on these charts of the slice $C_h^2$ norm of the $j$th normal derivative for $j=1,2$. Set $L_j=\|\chi^{(j)}\|_\infty$ for $j=1,2$, $P=\|\psi''\|_\infty$, $D_0=\|d\|_\infty$, and $A=\operatorname{Area}_h(\Sigma)$. If $\delta=a_t-p_t$, then

$$
\delta(0)=0,\quad \delta'(0)=2d,\quad
\|\delta-2td\|_{C_h^2}\le t^2M_2,\quad
\|\delta'-2d\|_{C_h^2}\le2|t|M_2.
$$

The bounds $\|q_t-h\|_{C_h^2}\le wM_1$, $\|q_t'\|_{C_h^2}\le N=(1+2L_1)M_1$ hold by interpolation and $\|\delta\|_{C_h^2}\le 2|t|M_1$. Differentiating twice, using $2t\chi(x)d=-2w\psi(x)d$, gives

$$
q_t''=-\frac{2}{w}\psi''(x)d+r_2(t),\qquad
\|r_2\|_{C_h^2}\le J=(1+4L_1+L_2)M_2.
$$

Indeed $r_2=(1-\chi)p_t''+\chi a_t''+2\partial_t\chi(\delta'-2d)+\partial_t^2\chi(\delta-2td)$. These inequalities hold on the full connector including both cutoff plateaus.

Use the curvature convention with positive sphere sectional curvature. In initially tangential coordinates the normal-normal block of the curvature operator is $-q_t''/2+q_t'q_t^{-1}q_t'/4$. The tangential block comes from the slice curvature and Gauss terms quadratic in $q_t'/2$. The mixed block is the antisymmetrized slice covariant derivative of $q_t'/2$, up to the orientation of its two-form indices. At $q_t=h$ consider the raw curvature supported in the normal block with symmetric trace-free entry $B$. Its Ricci tensor in the angular block is $B$ with vanishing scalar. Removing the Schouten term gives normal block $B/2$. In a diagonal angular frame the complementary-plane Weyl entry is $-(B_{ii}+B_{jj})/2=B_{kk}/2$. The mixed block is zero. Thus in the $1/\sqrt2$ chiral bases of normal two-forms and their tangential Hodge duals, each signed Weyl operator is $B/2$.

For finite estimates take the matrices of $W^\sigma$ in oriented frames transferred from $dt^2+h$ by the positive square root, multiplied by $\det_h(q_t)^{1/4}$. Denote the resulting density-weighted matrix by $F_\sigma$. Its squared Hilbert–Schmidt integral against $dt\,dA_h$ is $E_\sigma(g_w;U_w)$. By the block formulas it has the form

$$
F_\sigma=\mathcal L_\sigma(q_t)q_t''+\mathcal R_\sigma(q_t,D_hq_t,D_h^2q_t,q_t',D_hq_t';\mathrm{Rm}_h),
\qquad \mathcal L_\sigma(h)d=-d/4.
$$

The following bounds specify finite algebraic suprema for a guarded calculation. $C_{0,\sigma}$ and $C_{1,\sigma}$ are operator-norm suprema of $\mathcal L_\sigma$ and its first matrix derivative on tangential matrices with eigenvalues in $[\lambda,\Lambda]$, measured in an $h$-orthonormal frame. $C_{2,\sigma}(w)$ bounds $|\mathcal R_\sigma|$ there with the first and second angular jets bounded by $wM_1$, and the first normal and mixed jets bounded by $N$. Use $|\mathrm{Rm}_h|\le\sup_\Sigma|\mathrm{Rm}_h|$ in this supremum. The defining maps are obtained from the displayed curvature blocks, contracting for Ricci and scalar, taking the Weyl and Hodge projections, and using the density factor. To compute intrinsic slice curvature in this box, use the connection difference

$$
L^k{}_{ij}=\tfrac12 q^{k\ell}\big((D_h)_i q_{j\ell}+(D_h)_j q_{i\ell}-(D_h)_\ell q_{ij}\big).
$$

Differentiate once and add the antisymmetrized square of the difference to the $h$-curvature. In the mixed block use $D_h(q_t'/2)$ and this same connection difference. Each supremum is over a compact finite-dimensional set with the inverse bounded. The angular jets and the full face curvature occur in $C_{2,\sigma}$.

The mean-value bound between $h$ and $q_t$ now gives

$$
\left|F_\sigma-\frac{\psi''(x)}{2w}\,d\right|\le B_\sigma(w),\qquad
B_\sigma(w)=C_{0,\sigma}J+2P C_{1,\sigma}M_1D_0+C_{2,\sigma}(w).
$$

For either chirality define the leading norm $\ell=\|\psi''\|_{L^2(0,1)}\,\|d\|_{L^2(h)}/(2\sqrt w)$ and the error norm $b_\sigma=\sqrt{Aw}\,B_\sigma(w)$. The actual connector charge $c_\sigma(w)=E_\sigma(g_w;U_w)$ satisfies

$$
\boxed{(\max(0,\ell-b_\sigma))^2\le c_\sigma(w)\le (\ell+b_\sigma)^2.}
$$

This is the triangle inequality and its reverse for the density-weighted matrices. In particular at fixed source and cap, as $w\downarrow0$,

$$
c_\sigma(w)=\frac{\int_0^1 |(x\chi(x))''|^2\,dx}{4w}\int_\Sigma|K^0-S^0|_h^2\,dA_h+O(1)\qquad(\sigma=+,-).
$$

More explicitly the error in this squared expansion has absolute value at most $2\ell b_\sigma+b_\sigma^2$. When $d=0$ the cost is bounded by $Aw B_\sigma(w)^2$. For a fixed nonzero $d$ the lower bound diverges at small width. On a regular convex Euclidean height in the induced gauge the earlier $K=\beta S$ computation gives $d=(\beta-1)h(S^0\cdot,\cdot)$ and $H<\operatorname{tr}S$. Its leading term uses the squared weighted nonumbilicity $\int(1-\beta)^2|S^0|^2_h\,dA_h$. This applies to that marked convex model when the stated disk and collar are available. [Height calculation](../manuscript/deformation_of_marked_spherical_collars.tex)

## Scalar cancellation and a finite positive endpoint test

The normal variation of the trace mean curvature in the Gaussian collar gives the scalar identity

$$
R_{g_w}=R_{q_t}-\operatorname{tr}_{q_t}q_t''+\tfrac34|q_t'|_{q_t}^2-\tfrac14(\operatorname{tr}_{q_t}q_t')^2.
$$

At the large normal term, $\operatorname{tr}_{q_t}d=\operatorname{tr}((q_t^{-1}-h^{-1})d)$ because the means were matched. The inverse identity and $\|q_t-h\|_\infty\le wM_1$ give $|\operatorname{tr}_{q_t}d|\le\lambda^{-1}wM_1D_0$. In particular this scalar term has a finite bound even though the signed Weyl blocks have a term of size $w^{-1}$. With $C_R(w)$ the absolute bound for intrinsic slice scalar on the angular jet box above, a scalar bound valid on the full connector is

$$
|R_{g_w}|\le B_R(w)=C_R(w)+\frac{2P M_1D_0+\sqrt3 J}{\lambda}+\frac{3N^2}{4\lambda^2}.
$$

The quadratic expression in $q_t'$ is nonnegative by the three-dimensional trace inequality and bounded above by $3|q_t'|^2_{q_t}/4$.

Let $g_0$ denote the piecewise metric equal to $p$ on $C$ and $g$ on $V$. The common face values make it Lipschitz in the glued collar. Use its piecewise $H^1$ norm with a common boundary trace $\varphi$ and write $Q_0$ for the piecewise Yamabe quadratic form. On the cap the formula $R_p=-6u^{-3}\Delta_bu$ and integration by parts give

$$
Q_0(f)=Q_V(f)+6\int_C|d(uf)|_b^2\,dV_b+2\int_\Sigma(\operatorname{tr}S-H)|\varphi|^2\,dA_h.
$$

The boundary term is $-6\int_\Sigma \partial_{\nu_b}u\,|\varphi|^2$ because $u=1$ there. This identity holds for smooth tests by integration by parts and for $H^1$ by trace continuity. Use a measured coercivity constant $c_0>0$ for $Q_0(f)\ge c_0\|f\|_{H^1(g_0)}^2$. For example suppose $H\le\operatorname{tr}S$ and $R_g\ge r_V>0$ on $V$. Let $C_{\rm tr}$ satisfy $\|\varphi\|_{L^2(h)}^2\le C_{\rm tr}\|f\|_{H^1(V,g)}^2$ and take $C_u$ with $\|f\|_{H^1(C,p)}^2\le C_u(\|d(uf)\|_{L^2(b)}^2+\|\varphi\|_{L^2(h)}^2)$. The latter exists by the Poincaré inequality with boundary term and the fixed smooth multiplier. Then one may take

$$
c_0=\left[\frac{1+C_u C_{\rm tr}}{\min(6,r_V)}+\frac{C_u}{6}\right]^{-1}.
$$

A measured negative part of the boundary term can also be absorbed by subtracting $2C_{\rm tr}\|(\operatorname{tr}S-H)_-\|_\infty$ from $\min(6,r_V)$ when the resulting constant is positive. The exterior of a volume-one positive Yamabe metric has $r_V=Y([g])$.

For the finite error set $\eta=\lambda^{-1}(2wD_0+w^2 M_2)$ and require $\eta<1$. It bounds the operator norm of the relative tangential metric change from $g_0$ to $g_w$. The volume ratio lies in $[r_-,r_+]$ for $r_\pm=(1\pm\eta)^{3/2}$. The kinetic term's relative density times inverse metric differs from the identity in operator norm by at most

$$
\kappa=\max\{1-r_-/(1+\eta),\ r_+/(1-\eta)-1\}.
$$

Let $B_p(w)=\sup_{U_w}|R_p|$. For the potential estimate, the one-dimensional trace inequality in the cap chart gives

$$
\int_{U_w}|f|^2\,dV_{g_0}
\le \Lambda^{3/2}(2w C_{\rm tr}+w^2\lambda^{-3/2})\|f\|_{H^1(g_0)}^2.
$$

In fact $|f(t,y)|^2\le2|\varphi(y)|^2+2|t|\int_t^0|\partial_s f(s,y)|^2 ds$. Integrating the latter term first in $t$ gives a coefficient at most $w^2$, and the cap densities relative to $dt\,dA_h$ lie in $[\lambda^{3/2},\Lambda^{3/2}]$. Together the estimates give

$$
|Q_{g_w}(f)-Q_0(f)|\le \varepsilon(w)\|f\|_{H^1(g_0)}^2,
\qquad \varepsilon(w)=6\kappa+(r_+B_R(w)+B_p(w))\Lambda^{3/2}(2w C_{\rm tr}+w^2\lambda^{-3/2}).
$$

At fixed source, this bound is $O(w)$ by the trace cancellation and the finite chart guards. The strict finite inequality $\varepsilon(w)<c_0$ makes $[g_w]$ positive. If $\|f\|_{L^4(g_0)}^2\le S_0\|f\|_{H^1(g_0)}^2$ is a Sobolev bound, it yields $Y([g_w])\ge(c_0-\varepsilon(w))/(r_+^{1/2}S_0)$. This sign test concerns the capped endpoint and the entire $V$.

## Complete energy and the test at a charged index

Set $m^\sigma=E_\sigma(g;D)$, $v^\sigma=E_\sigma(g;V)$, and $e=m^\sigma+v^\sigma=E_\sigma(g;M)$, independent of $\sigma$. Conformal flatness of $p$ off $U_w$ and the retained exterior give the exact ledger

$$
E_\sigma(g_w;M)=v^\sigma+c_\sigma(w)=e-m^\sigma+c_\sigma(w),\qquad
c_+(w)-c_-(w)=m^+-m^-.
$$

The last equality is closed signature on the two oriented metrics. The unchanged exterior contributes its complete charge $v^\sigma$. The connector is additional cap-side charge in each sign, so its signed increment against the raw exterior comparator is $+c_\sigma$. Relative to the original closed metric the signed increment is $c_\sigma-m^\sigma$. The construction replaces all of the original disk, including its core, and makes no bound on the peak of a joined path.

At finite index $i$ of the charged minimizing sequence let $I=I^+(M)$, $d_i=e_i-I$ and $T=4\pi^2$. Once the positivity test passes, a certified contradiction to the infimum is

$$
(\ell_i+b_{i,\sigma})^2<m_i^\sigma-d_i
$$

in either sign. For recognition it suffices that $e_i-m_i^\sigma+(\ell_i+b_{i,\sigma})^2\le T$ in either sign. On a source where the lower bound $(\ell_i-b_{i,\sigma})_+^2\ge m_i^\sigma-d_i$ holds, this particular endpoint at that width cannot strictly descend, by the exact ledger and equality of the closed signed totals. If the two bounds straddle the allowance, the test is inconclusive. Any positive endpoint has $c_{i,\sigma}\ge m_i^\sigma-d_i$ and any same-type fill of this form must satisfy the displayed difference of charges.

The physical disk theorem and its thin raw bicollar give incoming charge and raw measure estimates. The convex fit, Gaussian widths, derivative and ellipticity guards, and scalar form constants above need separate measurements. In particular the leading cost tests $\|K_i^0-S_i^0\|_{L^2(h_i)}^2/w_i$ independently of the raw strip mass. Shrinking the strip at fixed mismatch can give a positive endpoint with divergent connector energy in both signs. For a varying source the energy and sign tests must hold at the **same** $w_i\le W_i$. Applying the result to a selected index remains contingent on the strict charge margin and the independent scalar coercivity margin displayed above. [Raw source geometry and complete-complement caveats](../../notes/SOURCE_WITNESSES.md) · [Charged disk, signature and recognition](../../../../master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex)
