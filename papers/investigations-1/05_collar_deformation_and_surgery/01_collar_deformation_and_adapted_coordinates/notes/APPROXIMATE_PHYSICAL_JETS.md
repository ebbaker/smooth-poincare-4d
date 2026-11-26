# Pricing approximate jets in a fixed physical collar

26 November 2026 · Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded E return SP4-CDS-DEF-E02b, [activation revision 1](../../research-progress/handoffs/ACTIVATION_20261126.md).
Requested helper setting GPT-6.2 Sol/ultra. The serving model and effort are
unavailable to this helper. The branch inputs are at
`c8fb08dcf2e39ae68d4c9d9ebd6a69893ce9cce4`. All 17 hashes in the
[parent source table](../../references/README.md) matched. This calculation
uses the [deformation overview](../research-overview/OVERVIEW.md), the fixed
plateau and physical Gaussian gauge from the lead's B01 decision, and the
master's Weyl-density convention. The evidence is a conditional estimate on
a supplied chart and a computed single tensor mode.

## A two-width estimate on the supplied chart

Work on a smooth oriented Riemannian four-manifold. Take an actual marked
Gaussian chart with cooriented coordinate $t$, left and right widths
$0<w_L,w_R\le1$, and $\Phi^*g=dt^2+h_t$ on
$S^3\times(-w_L,w_R)$. The same angular marking is used on both sides.
Let $\gamma$ be the unit round metric in that marking, with reference
$\bar g=dt^2+\gamma$ and area $A_\gamma=2\pi^2$. On each half-strip $U_j$
set $x=|t|/w_j$, and write $\epsilon_L=-1$, $\epsilon_R=1$.
Use the same smooth profile $0\le\chi\le1$ on $[0,1]$, equal to one on
$[0,\rho]$ and zero on $[R,1]$ for fixed $0<\rho<R<1$. Put
$\theta_s=1-s\chi(x)$ and set
$$
 \Phi^* g_s=dt^2+\gamma+\theta_s u,\qquad u=h_t-\gamma,\qquad 0\le s\le1.
$$
This is a smooth intrinsic metric path. Near $t=0$ the two factors are
the same constant $1-s$, and near each outer face $g_s=g$. At $s=1$
the product is exact on $(-\rho w_L,\rho w_R)$. The chart, its markings,
and the two complete sides are fixed throughout. The construction changes
only the given collar and uses no preliminary gauge change or connector.

For a tangential tensor use the sum of the sup norms of its first two
angular covariant derivatives and its value, all in $\gamma$, as
$\|\cdot\|_{C^2_\gamma}$. Assume on each used strip
$\lambda\gamma\le h_t\le\Lambda\gamma$ for $0<\lambda\le\Lambda<\infty$.
Every intermediate metric has the bounds
$\lambda_*=\min(1,\lambda)$ and $\Lambda_*=\max(1,\Lambda)$ relative to
$\bar g$. Define physical Gaussian jet controls
$$
 \alpha=\|h_0-\gamma\|_{C^2_\gamma},\qquad
 \beta=\|\partial_t h_0\|_{C^2_\gamma},\qquad
 M_j=\sup_{U_j}\|\partial_t^2 h_t\|_{C^2_\gamma}.
$$
Here the supremum means the supremum of the slice norms for $t$ on side $j$.
The Taylor estimates in $C^2_\gamma$ are
$$
 \|u(t)\|\le\alpha+|t|\beta+\tfrac12 t^2 M_j,\qquad
 \|\partial_t u(t)\|\le\beta+|t|M_j,\qquad
 \|\partial_t^2u(t)\|\le M_j .
$$
The same estimates with $t<0$ follow by integration toward $t=0$.
Let $L_k=\|\chi^{(k)}\|_\infty$ for $k=1,2$. For each $w=w_j$ define
$$
 \begin{aligned}
 P_j&=\alpha+w\beta+\tfrac12 w^2M_j, & Q_j&=\beta+wM_j,\\
 N_{j,s}&=Q_j+sL_1P_j/w,\qquad&
 H_{j,s}&=M_j+2sL_1 Q_j/w+sL_2P_j/w^2.
 \end{aligned}
$$
In fact, writing $v_s=\theta_s u$ and $D=\nabla^\gamma$,
$$
 \begin{aligned}
 D^k v_s &= \theta_s D^k u &&(0\le k\le2),\\
 \partial_t D^k v_s &= \theta_s\partial_t D^k u
       -s\epsilon_j \chi'(x)D^k u/w &&(0\le k\le1),\\
 \partial_t^2 v_s &= \theta_s\partial_t^2 u
       -2s\epsilon_j\chi'(x)\partial_t u/w
       -s\chi''(x)u/w^2 .
 \end{aligned}
$$
Thus $P_j,N_{j,s},H_{j,s}$ bound the respective angular, one-normal
and two-normal derivatives through total order two. In $\bar g$ this
gives bounds $C(P_j+N_{j,s})$ for the first jet and
$C(P_j+N_{j,s}+H_{j,s})$ for the second jet.

For $p=\bar g+v$ in the stated ellipticity interval, identify the oriented
$p$-orthonormal and $\bar g$-orthonormal frames by the positive square root.
Let $F_\sigma(v)$ be the matrix of the real two-form Weyl operator
$W^\sigma_p$, for $\sigma=+,-$, multiplied by
$(dV_p/dV_{\bar g})^{1/2}$. It has squared $L^2(dV_{\bar g})$ norm
$E_\sigma(p;\cdot)$ with the Hilbert–Schmidt convention. This is the
[density representation of the fixed-annulus splice](../../../../master/manuscript/first_order_splice.tex),
now using $\bar g$ on the physical product. To see its jet dependence,
write the connection difference as $p^{-1}$ contracted with
$\bar\nabla v$ via the Koszul formula. Differentiating once gives a term
linear in $\bar\nabla^2v$ and terms quadratic in $\bar\nabla v$.
The curvature difference also has the square of the connection difference.
Lowering indices, projecting in the moving metric, and multiplying by
the volume factor are smooth coefficient operations on the stated
ellipticity interval. Since $\bar g$ is conformally flat, Taylor expansion
at $v=0$ gives a linear operator $\mathcal L_\sigma$ and bounds
$$
 \begin{aligned}
 |\mathcal L_\sigma v|
   &\le C\bigl(|\overline{\mathrm{Rm}}|\,|v|+|\bar\nabla^2 v|\bigr),\\
 |F_\sigma(v)-\mathcal L_\sigma v|
   &\le C\bigl(|\overline{\mathrm{Rm}}|\,|v|^2+
                |v|\,|\bar\nabla^2v|+|\bar\nabla v|^2\bigr).
 \end{aligned}
$$
The background-curvature terms arise from the zeroth-order coefficients
acting on $\overline{\mathrm{Rm}}$. Differentiating the cutoff gives
both the $|v|\,|\bar\nabla^2v|$ term involving up to two cutoff derivatives
and the square of the one-derivative contribution. For example,
$(P_j+N_{j,s})^2$ contains
$(sL_1P_j/w)^2$ and $2sL_1P_j(P_j+Q_j)/w$.

As $|v_s|$ is also bounded pointwise by the ellipticity constants,
these bounds give, with $N_j=N_{j,1}$ and $H_j=H_{j,1}$,
$$
 \begin{aligned}
 E_\sigma(g_s;U_j)^{1/2}
 &\le C\sqrt{A_\gamma w_j}
    \bigl[P_j+N_j+H_j+(P_j+N_j)^2\bigr]\\
 &\le C\sqrt{A_\gamma}\bigl[Z_j+w_j^{3/2} Z_j^2\bigr],\\
 Z_j&=\frac{\alpha}{w_j^{3/2}}+
       \frac{\beta}{\sqrt{w_j}}+\sqrt{w_j}\,M_j .
 \end{aligned}
$$
The constant depends on $\lambda_*,\Lambda_*$, the dimension, the reference
curvature, and $L_1,L_2$. The reference area is displayed separately.
The coefficient bounds in the proof can be taken as suprema of the smooth
algebraic coefficient maps and their first two derivatives over matrices
with eigenvalues in $[\lambda_*,\Lambda_*]$ in a reference orthonormal frame.
Indeed $P_j\le Cw_j^{3/2}Z_j$, $N_j\le Cw_j^{1/2}Z_j$ and
$H_j\le Cw_j^{-1/2}Z_j$ for $w_j\le1$. The two widths need no comparison
with one another.

If the sphere separates two complete sides $P^{\rm full}_j$, their exact
signed increments are
$$
 \Delta_{j,\sigma}(s)
 =E_\sigma(g_s;P^{\rm full}_j)-E_\sigma(g;P^{\rm full}_j)
 =E_\sigma(g_s;U_j)-E_\sigma(g;U_j).
$$
In particular a certified upper allowance for either sign and the whole
path is
$$
 c_j=C^2 A_\gamma[Z_j+w_j^{3/2}Z_j^2]^2 .
$$
The full increment lies between $-E_\sigma(g;U_j)$ and
$c_j-E_\sigma(g;U_j)$.
If the two full sides exhaust the joined source, the joined path has
$\sup_s E_\sigma(g_s;M)\le E_\sigma(g;M)+c_L+c_R$. The unchanged exterior
and the product germ account for every metric change in this path.
On an oriented closed smooth homotopy sphere with a positive initial
class, the strict test $E_+(g;M)+c_L+c_R<8\pi^2$ implies positivity
throughout the joined path by the
[master's zero wall](../../../../master/manuscript/variational_comparison.tex).
The cap and any additional changes to the metric require their own
markings and accounting.

A sufficient smallness condition for a family in this fixed gauge is
uniform ellipticity and $Z_L,Z_R\to0$. For two shrinking widths it is
enough that
$$
 \alpha=o\bigl(w_{\min}^{3/2}\bigr),\qquad
 \beta=o\bigl(w_{\min}^{1/2}\bigr),\qquad
 \sqrt{w_j}\,M_j\to0\quad(j=L,R),
 \qquad w_{\min}=\min(w_L,w_R).
$$
An exact face with $\alpha=\beta=0$ and bounded $M_j$ recovers
$c_j=O(w_j)$. At a given index the displayed $c_j$ can be compared
directly with the allowed side cost. These are tests on the physical
Taylor data over each available strip.

## One nonround mode and its sharp cost

Identify the marked unit $S^3$ with $SU(2)$ using a round left-invariant
coframe $\omega^1,\omega^2,\omega^3$ whose dual frame has cyclic brackets
$[e_j,e_k]=2e_i$. Let
$$
 q=\omega^1\otimes\omega^1-\omega^2\otimes\omega^2,\qquad
 g_{a,b}=dt^2+h_t,\qquad h_t=\gamma+(a+bt)q .
$$
Fix a physical chart containing both strips and choose $|a|+|b|\sup|t|$
small enough for uniform positivity there. This is again the Gaussian
chart, with genuine face mismatch $a q$ and first normal jet $b q$.
The tensor is traceless and $\|q\|_{L^2(\gamma)}^2=4\pi^2$.
For $h=\gamma+f q$ with constant $f$, write
$l_i=1+f q_i$ where $(q_1,q_2,q_3)=(1,-1,0)$.
The bracket coefficients in an orthonormal frame are
$\mu_i=2l_i/\sqrt{l_1l_2l_3}$ for cyclic brackets. The Koszul coefficient
$2\langle\nabla_{E_i}E_j,E_k\rangle=\mu_k-\mu_i+\mu_j$ for
$E_i=l_i^{-1/2}e_i$ there yields
$\mathrm{Ric}_{ii}=\tfrac12(\mu_i^2-(\mu_j-\mu_k)^2)$.
Consequently the Ricci eigenvalues are $2+4fq_i+O(f^2)$ and differ for
all sufficiently small nonzero $f$. This perturbation is genuinely
nonround.

On $U_j$ the path has tangential coefficient
$f_s(t)=\theta_s(t)(a+bt)$. Fix the curvature-operator sign with positive
sectional curvature on the round sphere. In the linearization at $\bar g$,
the principal two-normal variation of Riemann has $0i0k$ component
$S_{ik}=-\tfrac12 f_s'' q_{ik}$. Its Ricci trace in the normal direction
and its scalar trace vanish by tracelessness. Its tangential Schouten
block is $S/2$. The principal Weyl block on $dt\wedge T^*S^3$ is therefore
$S/2$. The tangent-two-form block is the same after identifying it by
Hodge star, and the mixed block vanishes at this order. In the orthonormal
$\Lambda^\sigma$ basis $(dt\wedge\omega^i+\sigma*(dt\wedge\omega^i))/\sqrt2$
the principal chiral operator is thus $-\tfrac14 f_s'' q$ for each sign.
Since the reference Weyl tensor is zero, the density factor leaves this
linear term unchanged.

With $\delta_j=|a|+w_j|b|$, and $w=w_j\le1$, the mode satisfies
$$
 f_s''(t)=-s\left[
   \frac{a}{w^2}\chi''(x)
    +\frac{\epsilon_j b}{w}\bigl(x\chi''(x)+2\chi'(x)\bigr)\right].
$$
The remainder in $F_\sigma(f_s q)=-\tfrac14 f_s''q+\mathrm{error}$ has
pointwise size bounded by
$$
 C\bigl(|f_s|+|f_s'|+|f_s|\,|f_s''|+|f_s'|^2\bigr)
 \le C(w+\delta_j)\delta_j/w^2 .
$$
The first two terms include all tangential and mixed linear jets
of the fixed tensor. The other two bound the nonlinear terms above.
The incoming coefficient is linear in $t$, with first derivative $b$
and second derivative zero. Its strip energy is at most
$Cw(\delta_j+|b|+b^2)^2$, retaining the quadratic first-jet term even
when the widths shrink while $|b|$ grows. Define
$$
 J_j(a,b)=\frac{\|q\|_{L^2(\gamma)}^2}{16}
 \int_0^1
 \left[
   \frac{a}{w_j^{3/2}}\chi''(x)
   +\frac{\epsilon_j b}{w_j^{1/2}}\bigl(x\chi''(x)+2\chi'(x)\bigr)
 \right]^2 dx .
$$
The two scalar profiles in this integral have a positive definite Gram
matrix. A linear dependence would say that $((A+Bx)\chi)''=0$ for some
$(A,B)\ne(0,0)$. The affine function $(A+Bx)\chi$ is then zero near $1$
and agrees with $A+Bx$ near $0$, a contradiction. In particular
$J_j$ is comparable to $a^2/w_j^3+b^2/w_j$ with constants depending only
on the profile and $q$. The mixed term has the coorientation sign
$\epsilon_j$ and uses the native width $w_j$.

The principal part has squared norm $s^2J_j$, and the remainder has
$L^2$ norm at most $C(w_j+\delta_j) \sqrt{J_j}$. Since
$|b|\le\delta_j/w_j$ and $w_j\le1$, the incoming bound is at most
$C(w_j+\delta_j)^2\delta_j^2/w_j^3\le C(w_j+\delta_j)^2J_j$.
Subtracting it gives the full-side comparison
$$
 \Delta_{j,\sigma}(s)=s^2 J_j(a,b)+O\bigl((w_j+\delta_j)J_j(a,b)\bigr).
$$
The error is uniform in $s$, both signs and the ratio of widths, for
small $\delta_j$ and $w_j\le1$. The leading term on the joined path is
$s^2(J_L+J_R)$ with additive error bounded by the sum of the two
displayed errors. Its supremum is $J_L+J_R$ to that same accuracy,
by the upper bound for all $s$ and the value at $s=1$. Each pure jet
alone exhibits its stated inverse power, and the Gram bound precludes
cancellation of the two powers by tuning $a/b$ on one strip. For $a=0$
and any fixed admissible $b$, the formula gives the exact limit
$$
 \lim_{w_j\to0}w_j\Delta_{j,\sigma}(s)
 =\frac{s^2b^2\|q\|_{L^2(\gamma)}^2}{16}
    \int_0^1\bigl(x\chi''+2\chi'\bigr)^2 dx
$$
uniformly over $s$.

### Fixed face amplitude and vanishing widths

For fixed sufficiently small $a\ne0$ and fixed admissible $b$, the
quadratic width terms contribute to the exact $w_j^{-3}$ coefficient.
Set
$$
 l_i(x)=1+a(1-s\chi(x))q_i,\quad
 k_i=\frac{l_i'}{2l_i},\quad
 N_i=-\frac{l_i''}{2l_i}+\frac{(l_i')^2}{4l_i^2},\quad
 T_i=-k_jk_k\quad(\{i,j,k\}=\{1,2,3\}),
$$
with primes in $x$. The Gaussian curvature formulas in the
$g_s$-orthonormal frame give
$R_{0i0i}=-(\partial_t^2l_i)/(2l_i)+(\partial_tl_i)^2/(4l_i^2)$
and the tangential formula $R_{jkjk}=R(h_t)_{jkjk}-
(\partial_tl_j)/(2l_j)\,(\partial_tl_k)/(2l_k)$.
Multiplying curvature by $w_j^2$ leaves respectively $N_i$ and $T_i$
in the limit. The mixed Gauss–Codazzi terms, of order $w_j^{-1}$ at most,
and the bounded intrinsic tangential curvature disappear in this
rescaling. The width correction $\epsilon_j b w_j x$ in the tangential
coefficient disappears with both of its first two $x$-jets. The chiral
curvature block has limiting diagonal entries $(N_i+T_i)/2$,
and subtracting scalar curvature divided by $12$ subtracts their mean.
It follows that
$$
 \begin{aligned}
 \lim_{w_j\to0} w_j^3 \Delta_{j,\sigma}(s)
   &=\Lambda(s,a),\\
 \Lambda(s,a)
   &=\frac{A_\gamma}{4}\int_0^1 \sqrt{l_1l_2l_3}
      \sum_{i=1}^3\left(N_i+T_i-\frac13
          \sum_{m=1}^3(N_m+T_m)\right)^2dx .
 \end{aligned}
$$
The limit is uniform for $s\in[0,1]$ and the same on both sides and signs.
In particular $\Lambda(s,a)=s^2a^2(\kappa+O(|a|))$ where
$\kappa=\|q\|_{L^2(\gamma)}^2\int_0^1(\chi'')^2dx/16>0$.
The factor after dividing by $s^2a^2$ extends smoothly through $s=0$
and $a=0$ with $s$-derivative $O(|a|)$, by the formulas for $l_i',l_i''$.
Thus $\Lambda(s,a)$ is increasing in $s$ for sufficiently small fixed
$a\ne0$, and for arbitrary jointly shrinking widths the exact leading
joined peak increment is
$$
 (w_L^{-3}+w_R^{-3})\bigl(\Lambda(1,a)+o(1)\bigr).
$$
These examples show the inverse-width powers for the specified
interpolation on a physical collar. The estimate and examples consume
the given chart and its Taylor data. Selection of a chart with those
data from a face functional is a separate geometric premise.
