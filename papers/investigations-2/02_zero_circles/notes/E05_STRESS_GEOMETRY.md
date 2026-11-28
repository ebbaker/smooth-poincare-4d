# E05 — Geometry of the two stress profiles

27 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. The bounded dispatch specifies GPT-6.2 Sol at ultra effort. The actual serving variant and effort were unavailable. Base commit `6a422ce7814fe1ad278d6904970e3b19b05a9890`. Inputs were [request r1](../research-progress/handoffs/REQUEST_E05_STRESS_GEOMETRY_20261127.md) (SHA-256 prefix `c3b4defd1360b8e13`), [B01](../brainstorm/notes/B01_GATE_SCOPE.md) (prefix `70fe3a0850e0270b`) and the [first master's energy conventions](../../../master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex) (prefix `e5d8c2495f0e31ac9`).

## Certificate

The two fixed smooth Riemannian classes on the oriented standard $S^4$ have positive Yamabe constant and both chiral energies below $2T=8\pi^2$. The chart is the B01 end marked at infinity. Here $e$ is either of the two chiral integrals in Hilbert–Schmidt normalization and $T=4\pi^2$. The decimals below are outward rational bounds.

| Profile | $t$ | Certified $e/T$ interval | Certified Yamabe lower bound | Positivity estimate |
|---|---:|---:|---:|---|
| A | $-3/4$ | $[0.00590,1.00731]$ | $Y(c)>2.21$ | Gradient potential and diagonal Sobolev rescaling |
| B | $3/4$ | $[0.00183,1.30521]$ | $Y(c)>4.45$ | Positive Laplacian and Euclidean Sobolev inequality |

The initial $16^4$ cells gave inconclusive tests on both cases. For A, the energy upper bound was $3.22804$ and the gradient estimate yielded a numerator lower bound of $-9.45$. For B, the energy upper bound was $6.63517$ and the direct estimate yielded a numerator lower bound of $-29.31$. Both cases pass on the nested $32^4$ grid, where the refinement stopped. The certified bounds pertain to the exact mollified profiles.

## Metric and energy

**Project theorem (working).** Use the oriented Cartesian frame $(x_0,y_1,y_2,y_3)$ and set $g=a^2 dx_0^2+|dy|^2$, $a=(1+tF)/(1-tF)$. B01 fixes the five centers, the signed weights and the mollifier. The curvature sign makes the sphere curvature operator positive. With $B=D_y^2 a$, the only independent components in the orthonormal coframe $(a\,dx_0,dy)$ are $R_{0i0j}=-B_{ij}/a$. Indeed $d(a\,dx_0)=\sum_i a_i\,dy_i\wedge dx_0$, and the connection forms are $\omega_{0i}=a_i\,dx_0$ and $\omega_{ij}=0$. Thus the curvature operator is supported on the $0i$ block. In the normalized chiral bases its diagonal blocks are both $-B/(2a)$, and the corresponding Weyl blocks subtract the trace. Consequently

$$R_g=-2\Delta_y a/a,\qquad dV_g=a\,dx,\qquad
\frac{e}{T}=\frac{1}{16\pi^2}\int_{\mathbb R^4}\frac{|(D_y^2 a)_0|^2}{a}\,dx.$$

Multiplication by the squared round stereographic factor gives the compact metric $\Omega^2g$, with $\Omega=2/(1+|x|^2)$, and preserves the chiral measures. The subscript $0$ on the Hessian means transverse trace-free part. The ordinary flat Lebesgue measure $dx$ in these integrals comes from substituting the density $a$.

## Grid and arithmetic

**Certificate.** The Cartesian box $[-3,3]^4$ contains the support of $F$. Each coordinate of every center is between $0$ and $4/5$, and the one-dimensional convolution is supported in $[-2-1/64,2+1/64]$. Outside the box $a=1$ and all three certified integrands vanish. Edges on each axis are $-3+6j/N$, first for $N=16$ and then for $N=32$. Each exact volume is $(6/N)^4$.

Write $H=h*\rho$ and $\varepsilon=1/64$. For each translate, coordinate cell $[l,r]$ and derivative order $k\in\{0,1,2\}$, every value of $H^{(k)}(s-c_i)$ on that cell is an average of $h^{(k)}$ values on
$[l-c_i-\varepsilon,r-c_i+\varepsilon]$. Differentiation commutes with convolution through order two since $h$ is $C^2$ and compactly supported. The kernel is nonnegative with total mass one. This gives the enclosure by the exact minimum and maximum on the enlarged interval. The code checks both endpoints and every intersecting point of $\{-2,-1,-2/3,0,2/3,1,2\}$. The integer knots suffice for $h$ and $h''$, and $\pm2/3$ cover the interior extrema of $h'$.

All one-dimensional ranges start as rational polynomial evaluations. Interval products and signed sums enclose $F,F_i,F_{ij}$ independently. The trivial global bound $|F|\le1$ follows from $0\le H\le1$ and the sum of the absolute weights. In A, the weights also give $F\ge0$. These bounds are intersected with the interval for $tF$. With $d=1-tF$, the chain rule gives

$$
\alpha=\frac{2t}{d^2},\qquad
\beta=\frac{4t^2}{d^3},\qquad
a_i=\alpha F_i,\qquad B_{ij}=\alpha F_{ij}+\beta F_iF_j .
$$

On each cell the energy enclosure uses
$|B_0|^2=\tfrac13\sum_{i<j}(B_{ii}-B_{jj})^2+2\sum_{i<j}B_{ij}^2$.
The scalar enclosure takes the positive part of $\operatorname{tr} B$ before squaring. The gradient potential is $P=|D_y a|^2/a$, and the program encloses $P^2$. The recovery of fixed-point bounds uses unit $2^{-20}$. Each endpoint is rounded down or up by exact signed integer floor and ceiling, including after products, squaring and positive reciprocals. Products take the min and max of all four signed endpoint products, and squaring uses the exact range rule across zero. Integer arithmetic within a slab uses guarded signed 64-bit operations and all reductions to the full box use Python integers. Slabs have one $x_0$ cell and up to eight $y_1$ cells. The cumulative sums multiply by the exact cell volume and then divide by $2^{20}$. The same cell enclosures and the flat exterior bound $1/a$ below by $m_0$ and $a$ below by $m_1$. Thus $m=\min(m_0,m_1)$ bounds $\min(a,1/a)$ below throughout the chart.

The following are the raw rational bounds from $N=32$. Here $[L_E,U_E]$ bounds the energy integral before division by $16\pi^2$, $U_\Delta$ bounds $\int (\Delta_y a)_+^2\,dx$, and $U_P$ bounds $\int P^2\,dx$.

| Profile | $m_0$ | $m_1$ | $L_E$ | $U_E$ | $U_\Delta$ | $U_P$ |
|---|---:|---:|---:|---:|---:|---:|
| A | $1$ | $100083/524288$ | $64055129427/68719476736$ | $1366374050235/8589934592$ | $5401701562815/34359738368$ | $2616807764457/68719476736$ |
| B | $113043/262144$ | $418607/524288$ | $19890076581/68719476736$ | $14163749000937/68719476736$ | $6705519257241/68719476736$ | $527379484473/17179869184$ |

The ratio bounds divide $L_E$ by $16(3.14160)^2$ and $U_E$ by $16(3.14159)^2$. The script checks the bounds on $\pi$ using Machin's identity and alternating arctangent partial sums. It bounds square roots below by an integer square root on the $10^{-5}$ grid and above by adding one grid unit. Nested lower square root bounds give the lower fourth root bound. The numerical certificate uses fixed-point integers and rationals throughout.

## Yamabe positivity

**Import.** Giorgio Talenti, *Best Constant in Sobolev Inequality*, Ann. Mat. Pura Appl. **110** (1976), 353–372, §0 equations (1)–(2), pp. 353–354. The checked primary passage gives the Euclidean inequality for sufficiently smooth decaying functions with $1<p<n$ and $q=np/(n-p)$. For compactly supported smooth tests on $\mathbb R^4$, substituting $n=4$, $p=2$, $q=4$ gives $\|z\|_4^2\le S^2\|Dz\|_2^2$ with $S^2=\sqrt6/(8\pi)$. [Primary article, checked 27 November 2026](https://math.jhu.edu/~js/Math646/talenti.sobolev.pdf)

**Project theorem (working).** For real compactly supported smooth $z$, write the Yamabe numerator on the chart as

$$
Q_g(z)=\int_{\mathbb R^4}
\big(6a^{-1}|\partial_0z|^2+6a|D_y z|^2-2(\Delta_y a)z^2\big)\,dx .
$$

Hölder in $dx$ and Talenti give $Q_g(z)\ge K_D\|z\|_4^2$, where
$K_D=6m/S^2-2\sqrt{U_\Delta}$. This gives the positive bound for B.

For A, integrate the scalar term by parts to obtain $4\int z D_y a\cdot D_y z\,dx$. For $0<\lambda<6$, the pointwise square inequality gives

$$
\lambda a |D_y z|^2+4z D_y a\cdot D_y z\ge -\frac{4}{\lambda}P z^2 .
$$

For constants $b_0,b_1>0$, use the flat scaling $x_0=\sqrt{b_0}\,X_0$, $y=\sqrt{b_1}\,Y$. The gradient energy with those coefficients gains a factor $(b_0b_1^3)^{1/2}$, and the squared $L^4$ norm gains $(b_0b_1^3)^{1/4}$. Applying Talenti in the scaled variables and Hölder for $P$ gives $Q_g(z)\ge K_P\|z\|_4^2$ with

$$
K_P=\frac{(6m_0((6-\lambda)m_1)^3)^{1/4}}{S^2}-\frac{4}{\lambda}\sqrt{U_P} .
$$

Use $\lambda=24/7$. With $N=32$, the rational lower bound on $K_P$ for A is $325954879283/146969400000$, and the lower bound on $K_D$ for B is $85166894766883/12541388800000$. For positive $K$ we have $Q_g(z)/\|z\|_{4,g}^2\ge\sqrt{m_0}K$, since $a\le1/m_0$. For the compact metric this quotient transforms by taking $z=\Omega f$ on tests off the marked pole, using the conformal scalar curvature formula in B01. A smooth cutoff on the compact sphere vanishing on a radius-$\delta$ ball about the pole contributes $O(\delta^2)$ to the squared $L^2$ gradient error and tends to the identity in $L^4$. This extends the lower bound by density to all compact Yamabe tests. The rational lower bounds before outward reporting are $325954879283/146969400000$ for A and $5592654478656905961/1254138880000000000$ for B.

## Replay

Use Python 3.10 or later with NumPy and run the following from the repository root. The two $N=32$ runs and their enclosure logic were also checked by a second Codex worker.

```sh
python3 papers/investigations-2/02_zero_circles/numerics/e05_stress_geometry.py A 16
python3 papers/investigations-2/02_zero_circles/numerics/e05_stress_geometry.py B 16
python3 papers/investigations-2/02_zero_circles/numerics/e05_stress_geometry.py A 32
python3 papers/investigations-2/02_zero_circles/numerics/e05_stress_geometry.py B 32
```
