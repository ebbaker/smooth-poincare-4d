# The two isolated connectors on a product strip

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded execution DEF-E03e, [issue 1](../../research-progress/handoffs/NONLOCAL_PAIR_AND_NATIVE_STRIP_20261126.md), working HEAD `19c187ad8dbe936cf165017c753a94add775ebaf`. The request specifies Sol/ultra for bounded execution. Independent serving model and effort metadata are unavailable. Working SHA-256 prefixes at intake are `6626a8a20f1b` for the request, `2575660c6240` for the [deformation manuscript](../manuscript/deformation_of_marked_spherical_collars.tex), `c5ce2a1b550f` for [isolation](ISOLATING_A_COUPLED_PATH.md), and `ea5494dc454e` for the [preceding assessment](../../reviews/TWO_ATTACHMENTS_AND_PHYSICAL_FACE_COST_20261126.md). This calculation concerns a prescribed smooth metric and path on the oriented standard four-sphere.

At native width $10^{-8}$, the joined path decreases its closed chiral energy from a value below $\pi^2/1000$, preserving fixed positive Weyl charge on both sides, and ends at the marked round product. Each isolated path reaches $2T=8\pi^2$. Its isolated endpoint connector alone has energy greater than $72\pi^2$ in each sign. All three paths retain pointwise positive scalar curvature. The large cost is caused by twice differentiating the isolation cutoff where the incoming anisotropy is constant. The complete-side ledgers below compute both signs and all path times.

## One marked source and three paths

Write the complement of the two poles of the standard smooth sphere as $\mathbb R_x\times SU(2)$. Let $(\omega^i)$ be the positive round unit coframe with cyclic brackets $[e_j,e_k]=2e_i$. Orient by $dx\wedge\omega^1\wedge\omega^2\wedge\omega^3$. Fix the seam at $x=0$ with the identity angular marking and increasing coorientation. The two closed sides $D,V$ are $x\le0$ and $x\ge0$ with their respective poles included. These are marked standard balls in the smooth radial compactification.

Define $P(r)=\exp(-1/[r(1-r)])$ for $0<r<1$, extended by zero, and let $\Theta(r)=\int_{-\infty}^rP/\int_0^1P$. For $z\ge0$ set $v(z)=\Theta(z-3)\tanh(z-3)$ and put

$$
\phi(x)=\exp\left(-\int_0^{|x|}v(z)\,dz\right),\qquad
g[f]=\phi^2\left(dx^2+\sum_{i=1}^3(1+q_i f)(\omega^i)^2\right),\qquad
(q_1,q_2,q_3)=(1,-1,0).
$$

The background $g[0]$ is conformally flat and is exactly product for $|x|\le3$. For $|x|\ge4$, $\phi=C\operatorname{sech}(|x|-3)$ with $C=\phi(4)\cosh(1)$. In the radial variable $r=e^{-(|x|-3)}$ the metric is $4C^2(dr^2+r^2\gamma)/(1+r^2)^2$, so both poles close smoothly with a round germ. Where $3\le |x|\le4$, the scalar curvature of $g[0]$ is $6\phi^{-2}(1-v^2+v')\ge6\operatorname{sech}^2(1)$. The tail has scalar curvature $12/C^2\ge12\operatorname{sech}^2(1)$. These follow from the scalar conformal law $R_{g[0]}=6\phi^{-3}(\phi-\phi'')$ for the rescaled four-dimensional product. [Lee–Parker, §2, scalar conformal covariance (2.7)](https://users.math.msu.edu/users/parker/YamabeProblem.pdf)

Put $B(x)=1-\Theta(2|x|-1)$, $B_L(x)=B(4(x+2))$ and $B_R(x)=B(4(x-2))$. The bridge $B$ is one on $[-1/2,1/2]$ and vanishes off $[-1,1]$. The two core functions have disjoint support intervals of length $1/2$ centered at $-2$ and $2$. Fix $b_L=10^{-6}$, $b_R=b_L/2$, $F_0=b_L B_L+b_R B_R$, and use

$$
w=10^{-8},\qquad a=w^{3/2}=10^{-12},\qquad
A=[-w,0]\times S^3,\quad r=(x+w)/w,\quad \eta(r)=\Theta(3r-1).
$$

Extend $\chi(x)=\eta((x+w)/w)$ over the sphere by its constant values. It is zero near the inner end of $A$ and one near its outer end and on the complete exterior. The whole $A$ has width $w$ and its changing part has width $w/3$. All the perturbations are supported where $\phi=1$, so $x$ is the signed Gaussian distance across the product chart for every metric below. The original bicollar $[-1,1]\times S^3$ has width $1$ on each side. For $0\le s\le1$ take

$$
\begin{aligned}
g&=g[F_0+aB],&h_s&=g[F_0+(1-s)aB],\\
p_s&=g[F_0+aB(1-s+s\chi)],&q_s&=g[F_0+aB(1-s\chi)].
\end{aligned}
$$

These are precisely the affine isolations of the supplied joined path since $g[f]$ is affine in $f$. The part of $h_s-g$ crossing the seam is supported on the fixed bridge. Both cores remain fixed in every metric. At $s=1$ the joined metric is an exact round product on the entire original bicollar. A round-ended copy of the unperturbed opposite half of $g[0]$ closes either matched side, using the given angular marking. Its chiral cost is zero and its scalar curvature is positive.

## Exact chiral integrands and positivity

Use the curvature operator convention of the manuscript, with the unit round metric having curvature operator $\mathrm{Id}$. The signed measure is $|W^\sigma|_{\mathrm{HS}}^2dV$ on real two-forms. In the product chart let $\ell_i=1+q_i f$, $d=\ell_1\ell_2\ell_3=1-f^2$, $\mu_i=2\ell_i/\sqrt d$, $k_i=\ell_i'/(2\ell_i)$ and let primes here denote derivatives in $x$. For cyclic $(i,j,k)$ put

$$
\begin{aligned}
r_i&=\tfrac12(\mu_i^2-(\mu_j-\mu_k)^2),&N_i&=-k_i'-k_i^2,\\
T_i&=(r_j+r_k-r_i)/2-k_jk_k,&
M_i&=\mu_i k_i-\tfrac12(\mu_i+\mu_j-\mu_k)k_j-\tfrac12(\mu_i-\mu_j+\mu_k)k_k.
\end{aligned}
$$

Indeed the slice brackets are $[E_j,E_k]=\mu_i E_i$ with $E_i=\ell_i^{-1/2}e_i$. The Koszul coefficient for cyclic indices is $2\langle\nabla_{E_j}^{\rm slice} E_k,E_i\rangle=\mu_i-\mu_j+\mu_k$, giving the slice Ricci eigenvalues $r_i$ by substitution. The shape has diagonal $k_i$. The normal curvature equation and Gauss equation give $N_i$ and $T_i$. For the mixed entry in the ordered real two-form frame $(dx\wedge E^i,E^j\wedge E^k)$, one can compute $\langle R(E_j,E_k)E_i,\partial_x\rangle$ using $\langle\nabla_{E_j}E_j,\partial_x\rangle=-k_j$ and the Koszul coefficients. The two differentiated terms give the negative $k_j,k_k$ terms and the bracket term is $\mu_i k_i$. These three types of entries are diagonal in the index $i$ because rotations by $\pi$ about the principal axes preserve the homogeneous metric. The cyclic sum of $M_i$ is zero. With $\sigma\in\{+1,-1\}$ the signed Weyl eigenvalues and the angle-integrated physical density are therefore

$$
W_i^\sigma=\frac12\left(N_i+T_i-\frac13\sum_m(N_m+T_m)\right)+\sigma M_i,
\qquad
\mathcal W_\sigma[f]\,(x)=2\pi^2\sqrt d\sum_i(W_i^\sigma)^2.\tag{1}
$$

The chiral projection uses the vectors $(dx\wedge E^i+\sigma E^j\wedge E^k)/\sqrt2$. In particular the mixed term is counted once per chiral matrix entry. The other regions have zero Weyl curvature. Formula (1) uses the actual physical chart and the volume of the unit round three-sphere. There is no tensor-norm factor of four in its energies.

For the scalar check, the trace of the slice shape is $-ff'/d$ and the slice scalar is $6-2f^2/d$. Since $R=\sum_i r_i-2(\sum_i k_i)'-(\sum_i k_i)^2-\sum_i k_i^2$, one obtains

$$
R(g[f])=6-\frac{2f^2}{d}+\frac{2ff''}{d}+\frac{(3+f^2)(f')^2}{2d^2}\qquad (|x|\le3).\tag{2}
$$

The bound $\int_0^1 P\ge\tfrac12e^{-16/3}$, together with $0\le P\le e^{-4}$ and $|P'|\le16e^{-4}$, gives $\|\Theta'\|_\infty<8$ and $\|\Theta''\|_\infty<128$. The derivative bounds through order two are $(16,512)$ for $B$, $(64,8192)$ for either core profile and $(24,1152)$ for $\eta$. On $A$ the isolated profiles have $|f|\le a$ and $|ff''|\le 1152a^2/w^2=1152w$. Off $A$ the core and bridge support bounds just listed apply separately. Formula (2) gives $R\ge6-\frac83(f^2+|ff''|)>5$ throughout $|x|\le3$ along all three paths. The background bound then gives $R\ge 6\operatorname{sech}^2(1)>0$ on the closed sphere. Thus all the closed conformal classes are positive throughout. The sign certification is pointwise and also applies to the two matched capped halves.

## Complete-side ledgers and joined peak

Define the following quadratures of (1). In them $g[uB]$ has bridge amplitude $u$, and a profile $G$ on $[0,1]$ represents the coefficient $f(x)=aG((x+w)/w)$ on $A$.

$$
\begin{aligned}
C_{L,\sigma}&=\int_{\mathbb R}\mathcal W_\sigma[b_L B_L]\,dx,&
C_{R,\sigma}&=\int_{\mathbb R}\mathcal W_\sigma[b_R B_R]\,dx,\\
L_\sigma(u)&=\int_{-1}^{-w}\mathcal W_\sigma[uB]\,dx,&
U_\sigma(u)&=\int_0^1\mathcal W_\sigma[uB]\,dx,\\
S_\sigma[G]&=w\int_0^1\mathcal W_\sigma[aG((x+w)/w)]\big|_{x=-w+wr}\,dr.
\end{aligned}
$$

In $S$ the derivatives in (1) are $aG'/w$ and $aG''/w^2$. Let $u=(1-s)a$. The following entries are the energies on the *complete* sides in ambient chirality $\sigma$.

| Metric | $D$ | $V$ |
| --- | --- | --- |
| $g$ | $C_{L,\sigma}+L_\sigma(a)+S_\sigma[1]$ | $C_{R,\sigma}+U_\sigma(a)$ |
| $h_s$ | $C_{L,\sigma}+L_\sigma(u)+S_\sigma[1-s]$ | $C_{R,\sigma}+U_\sigma(u)$ |
| $p_s$ | $C_{L,\sigma}+L_\sigma(u)+S_\sigma[1-s+s\eta]$ | $C_{R,\sigma}+U_\sigma(a)$ |
| $q_s$ | $C_{L,\sigma}+L_\sigma(a)+S_\sigma[1-s\eta]$ | $C_{R,\sigma}+U_\sigma(u)$ |

For signed changes subtract the first row in the corresponding column. On a core plateau with $f=b_j\ne0$, $M_i=N_i=0$, and $r_1-r_2=8f/d$. The two Weyl matrices are nonzero there, so both core charges are strictly positive. Each full core has equal charges in both signs because its coefficient is even about its center and the mixed term changes sign under reflection. The full bridge energy $F(u)=\int_{-1}^1\mathcal W_\sigma[uB]dx$ is also independent of $\sigma$ by reflection. The joined total is $C_L+C_R+F((1-s)a)$.

To certify its peak, the linear Weyl entries at $f=0$ are $q_i(-f''/4-2f+\sigma 3f'/2)$, as follows from (1). Thus the quadratic coefficient of $F(u)$ is $F_2=4\pi^2\int_{-1}^1(-B''/4-2B+\sigma 3B'/2)^2dx\ge16\pi^2$ by the unit plateau. For a finite monotonicity bound extend (1) analytically to signed complex amplitude $z$ in $|z|\le1/4$, retaining the squares and the square-root branch with value one at zero. There $|f'|\le4$, $|f''|\le128$, $|\ell_i|\ge3/4$, $|\mu_i|<3$, $|k_i|\le8/3$ and $|W_i^\sigma|<200$ directly from the displayed curvature formulas. Integration gives $|F(z)|<5\cdot10^5\pi^2$. The derivative contribution of powers of order three and higher is bounded by $256(5\cdot10^5\pi^2)u^2$ for $0\le u\le10^{-12}$ by Cauchy's coefficient inequality and the geometric series. This is less than $2F_2u$ when $u>0$. Hence $F$ is strictly increasing on $[0,a]$ and the exact joined peak is $H=C_L+C_R+F(a)=e$.

For a direct upper bound, at real $|f|\le1/2$ formula (1) implies

$$
\left|d^{1/4}W_i^\sigma+q_i f''/4\right|
\le 2|ff''|+2(f')^2+9|f|+16|f'|.\tag{3}
$$

In fact $|N_i+q_i f''/2|\le |ff''|+(f')^2$, the intrinsic sectional curvature differs from one by at most $9|f|$, $|k_j k_k|\le(f')^2$, and $|M_i|\le16|f'|$. The half trace-free projection has componentwise error bounded by the corresponding unprojected uniform error. Finally $1-d^{1/4}\le f^2$. Equation (3) and the support derivative bounds give $|d^{1/4}W_i^\sigma|<0.004$ on each core and $<10^{-9}$ on the joined bridge. Since the support lengths are $1/2,1/2,2$, this proves $H<\pi^2/1000$. The endpoint retains exactly $C_L$ and $C_R$ on its respective complete sides.

## Isolated costs and a strict finite surplus

The raw connector energies at every time are $S_\sigma[1-s+s\eta]$ and $S_\sigma[1-s\eta]$. The costs against the original strip subtract $S_\sigma[1]$. The interaction and the disk-side remainder of the isolation identity are exactly

$$
\begin{aligned}
J_\sigma(s)&=S_\sigma[1-s+s\eta]+S_\sigma[1-s\eta]-S_\sigma[1-s]-S_\sigma[1],\\
R_\sigma(s)&=S_\sigma[1-s+s\eta]-S_\sigma[1-s].
\end{aligned}
$$

The complete-side table yields $E_\sigma(p_s;S^4)+E_\sigma(q_s;S^4)=e+E_\sigma(h_s;S^4)+J_\sigma(s)$. Closed signature in the manuscript's normalization gives $J_+(s)=J_-(s)$ exactly for all $s$. This equality concerns the four-term combination of the physical regional energies. [Deformation manuscript, §1 and its signature reference](../manuscript/deformation_of_marked_spherical_collars.tex)

At fixed $w$ with variable amplitude $a$ the quadratic term of $J_\sigma(s)$ can also be read off from (1). The linearization applied to a coefficient $f$ is $q_i(-f''/4-2f+\sigma 3f'/2)$. Squaring, adding the two cutoffs, subtracting the two constant profiles and integrating by parts gives

$$
J_\sigma(s)=8\pi^2a^2s^2\left[\frac{\int_0^1(\eta'')^2dr}{16w^3}
+\frac{5\int_0^1(\eta')^2dr}{4w}-4w\int_0^1\eta(1-\eta)dr\right]+O_w(a^3s^2).
$$

The terms odd in $\sigma$ cancel using $\eta'(0)=\eta'(1)=0$ and $\int_0^1\eta\eta' dr=1/2$. At fixed $w$ the amplitude Taylor remainder is uniform through two $s$ derivatives on $[0,1]$ by (1). Both the value and first $s$ derivative of $J_\sigma$ vanish at zero, giving the displayed factor $s^2$ in the error. The following explicit bound verifies the large surplus at the chosen finite amplitudes.

For a finite bound throughout both isolated paths, write $\mathscr A_2=\int_0^1(\eta'')^2dr$. Equation (3) bounds each component of the scaled density error after multiplying by $\sqrt w$ by

$$
(2304+1152)w^{3/2}+9w^2+384w<10^{-5}.
$$

Here the principal term in $\sqrt w\,d^{1/4}W_i^\sigma$ is $-s q_i\eta''/4$ for $p_s$ and $+s q_i\eta''/4$ for $q_s$. For each raw connector energy $E$ the norm $\sqrt{E/(2\pi^2)}$ differs from $s\sqrt{2\mathscr A_2}/4$ by less than $\sqrt3\,10^{-5}$, uniformly for $0\le s\le1$ in both signs. The exact quadratures give the values near $s=0$ where this absolute error can dominate. On the unit interval $\int_0^1(\frac12-r)\Theta''dr=1$, giving $\int_0^1(\Theta'')^2dr\ge12$. Compressing the varying part to the middle third gives $\mathscr A_2\ge324$.

At $s=1$ both scaled connector norms exceed $6$, so each raw cost is greater than $72\pi^2$. The incoming strip lies in the bridge plateau, and $0\le S_\sigma[1]<H<\pi^2/1000$. The matched strip has $S_\sigma[0]=0$. This proves $R_\sigma(1)>72\pi^2$ and the finite interaction surplus $J_\sigma(1)>143\pi^2$. Each isolated endpoint has closed energy at least its raw connector energy. Starting from $e<\pi^2/1000$, the isolated paths each reach $2T$ by continuity. At the first crossing $s_*$ for either path, the exact ledger even gives $J_\sigma(s_*)\ge 8\pi^2-e-E_\sigma(h_{s_*};S^4)> (8-2/1000)\pi^2$ in both signs. Formula (2) certifies positive scalar curvature there as well.

The fixed standard type has $I^+(S^4)=0$. The actual bridge and both core profiles produce this charged source and the actual fixed strip. The [E61 comparison](../../../../master/01_fixed_type_variational_descent/manuscript/spectral_windows.tex) starts instead from a marked disk selected on a positive Yamabe minimizing sequence. Its measured raw masses and smooth collar at an individual index leave the bridge, admissible deformation, and cutoff costs to be determined on that source. The finite surplus here demonstrates the isolation effect at one width on the supplied standard sphere.
