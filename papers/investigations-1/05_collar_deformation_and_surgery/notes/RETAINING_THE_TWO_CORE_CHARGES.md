# Retaining both core charges through a round cut

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded CDS-E02m, [issue 2](../research-progress/handoffs/EXTERIOR_RECOVERY_AND_NATIVE_CAPS_20261126.md), classified as E work before execution. The issue specifies GPT-6.2 Sol/ultra for bounded execution and GPT-6.2 Astra/ultra for the lead. Actual serving model and effort are unavailable. Working HEAD `8471728a1549614f155a8751c709904cbcf994d6`. This is an analytical construction on one smooth finite source and its resulting peak comparison on an entered minimizing sequence.

## Finite assertion

Fix one actual [E61](../../../master/01_fixed_type_variational_descent/manuscript/spectral_windows.tex) source. Let $M$ be the closed oriented smooth homotopy four-sphere, $g=g_i$ its positive Yamabe representative and $D$ the specified smoothly parametrized closed disk. Write $V=M\setminus\operatorname{int}D$, and take the given measurable protected region $Q\subset\operatorname{int}D$ with nonempty interior. Use the same fixed subsets $D,V,Q$ throughout. For $\sigma\in\{+,-\}$ let $E_\sigma(g;U)=\int_U |W_g^\sigma|_{\rm HS}^2\,dV_g$, with real Weyl endomorphism Hilbert–Schmidt norms. Put

$$
 e=E_+(g;M)=E_-(g;M)<2T,\quad T=4\pi^2,\quad I=I^+(M),\quad d=e-I,
 \qquad q^\sigma=E_\sigma(g;Q),\quad K=\max_\sigma q^\sigma.
$$

For every $\eta>0$, there is a smooth path $g_s$, $0\le s\le1$, from $g$ to an exact round product on a positive subwidth of the actual marked face $\partial D$, with

$$
 E_\sigma(g_s;Q)\ge q^\sigma\quad (0\le s\le1),\qquad
 e+K\le H:=\max_s E_+(g_s;M)\le e+K+\eta.
\tag{1}
$$

If $e+K+\eta<2T$, the joined path and the two explicit capped endpoints have positive Yamabe classes. The exterior cap has the smooth type of $M$ and the disk cap has the smooth type of $S^4$. Their full signed energies are, respectively,

$$
 E_\sigma(\widehat g_V)=e+\Delta-\beta,
 \qquad E_\sigma(\widehat g_D)=K+\beta,
 \qquad \beta\ge0,\quad |\Delta|+\beta<\eta.
\tag{2}
$$

Both $\Delta$ and $\beta$ have the same value in the two chiralities. The data $q^+,q^-$ can differ. The path preserves their respective lower bounds at all times, including exact equality with each original value at the initial time. The later energy in $Q$ can be newly created curvature in a very small part of $Q$.

## A common increment with a monotone start

An exactly supported metric modification in any open set $U\subset M$ changes the two integrals on $U$ by the same amount. Indeed the closed difference $E_+-E_-=12\pi^2\tau(M)$ is fixed by signature, and the two energy densities on $M\setminus U$ stay fixed. Apply this to each site separately before combining disjoint sites. Under a conformal multiplier, each squared Weyl norm has weight minus four and the volume has weight plus four. The resulting measure in each sign is unchanged. [Hirzebruch, signature theorem, §4](https://hirzebruch.mpim-bonn.mpg.de/id/eprint/84/1/signature%20theorem.pdf) · [Energy normalization](../../../master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex)

For a reference mode on the oriented Euclidean unit ball take $h=\psi(y)(y^1)^2\,dy^2\otimes dy^2$, where $\psi\in C_c^\infty(B_{1/2})$ equals one near zero. There the only independent component of linearized Riemann curvature is the sectional component in the $12$ plane $A\ne0$, up to the convention for the sign of curvature. At zero, linearizing the Weyl decomposition gives $W'_{1212}=W'_{3434}=A/3$ and $W'_{1234}=0$. Pairing with the unit forms $(dy^1\wedge dy^2\pm dy^3\wedge dy^4)/\sqrt2$ gives $A/3$ in each block. This mode has nonzero linearized Weyl in both signs. The mode lies outside the infinitesimal conformal and diffeomorphism directions, along which linearized Weyl vanishes at the flat metric.

For a smooth metric $u$ on the unit ball define

$$
 F^\sigma_u(a)=E_\sigma(u+ah; B_1).
$$

Since the initial Weyl tensor at $u=\delta$ vanishes, the second derivative at $a=0$ is $2\int_{B_1}|(W^\sigma)'_\delta(h)|_{\rm HS}^2dy>0$. On a uniformly positive neighborhood of $\delta$ the integrand and its first two derivatives in $a$ are smooth functions of the metric two-jet. Thus there are $a_0,c>0$ and a $C^2$ neighborhood of $\delta$ such that $u+ah$ is positive definite and $(F_u^\sigma)''(a)\ge c$ for $|a|\le a_0$. The neighborhoods can be chosen once for this mode and both signs.

At an arbitrary site center $p_j$, use an oriented normal chart $\phi_j(z)=\exp_{p_j}^g(s_j A_j z)$ with $A_j:\mathbb R^4\to T_{p_j}M$ an oriented $g$-orthonormal frame. Shrinking $s_j$ makes $u_j=s_j^{-2}\phi_j^*g$ approach $\delta$ in $C^2(\overline B_1)$. Constant scaling in dimension four leaves the energies unchanged. Thus replacing $u_j$ by $u_j+ah$ is an exactly supported perturbation on $U_j=\phi_j(B_1)$ with both $F_{u_j}^\sigma(a)-F_{u_j}^\sigma(0)$ equal. Select $\varepsilon_j\in\{-1,1\}$ so $\varepsilon_j(F_{u_j}^+)'(0)\ge0$. In the direction $\varepsilon_j h$ this derivative is nonnegative in both signs. For $0\le a\le a_0$, writing $\kappa_j(a)$ for the common increment on that site, integration gives

$$
 \kappa_j'(a)\ge c a,\qquad \kappa_j(a)\ge \tfrac12 c a^2.
\tag{3}
$$

The terminal increment in each site has a positive lower bound independent of its scale. Choose $N$ so $Nc a_0^2/2\ge K$. Any designated open ball inside $Q$ contains $N$ such pairwise disjoint sites with compact closures. Choose distinct centers first and then shrink the site radii to fit and meet the $C^2$ condition. Interpolate simultaneously at parameter $a$ in each chosen direction. By (3) the sum of increments rises continuously from zero to at least $K$, so stop at the unique $a_*>0$ with $\sum_j\kappa_j(a_*)=K$ if $K>0$. For $K=0$ use the empty family. This calibrates any finite common prescribed increment, with $K$ the one used here. During the ramp one has the exact identities

$$
 E_\sigma(g_a;Q)=q^\sigma+\sum_j\kappa_j(a),\qquad
 E_\sigma(g_a;M)=e+\sum_j\kappa_j(a),\qquad
 E_\sigma(g_a;V)=E_\sigma(g;V).
\tag{4}
$$

In particular there is no early-time loss, even if the original metric has nonzero Weyl and a nonzero linear response at the chosen sites. Denote the final combined tensor perturbation by $P$ and the union of the supporting site balls by $U_*$. The terminal energy on $U_*$ is $E_\sigma(g;U_*)+K\ge K$ in each sign.

## A disjoint cuff and a compression fixing the sites

Use the buffered disk chart $F$ from the [fixed-source transport construction](TRANSPORT_ON_THE_CHARGED_DISK.md#the-buffered-marking-and-the-flattening). Its $R=1$ sphere has the original angle $y$, and near that sphere $t=R-1$ is the original physical Gaussian coordinate, increasing into $V$. Put its center at a chosen $p\in\operatorname{int}Q$ by an interior diffeomorphism of the disk and arrange the normal-coordinate germ there, keeping the entire boundary germ. For the centering change one may flow a compactly supported time-dependent vector field along a smooth interior path to $p$. For the germ change, use a positive linear normalization near the center followed by a cutoff of the higher-order displacement to the oriented normal chart, as in the cited construction. The resulting chart covers $D=F(\overline B_1)$ and a smaller exterior buffer.

Choose $r>0$ small enough that $F(\overline B_{4r})\subset\operatorname{int}Q$ is in the normal-coordinate germ, and put the sites above in $F(B_{r/2})$. Write $U_b=F(B_b)$, where $b=5r/2$. In chart coordinates choose a radial cutoff $\chi_r$ supported in $r<R<4r$ and identically one on $2r\le R\le3r$, obtained from one fixed profile by scaling. With $u\in[0,1]$ prepare the cuff by the uncharged metrics $g^{(u)}$ defined on the support of the cutoff by

$$
 F^*g^{(u)}=F^*g+u\chi_r(\delta-F^*g).
$$

Outside that support $g^{(u)}=g$. Use $g^{(u)}+P$ on the charged path. The cuff does not meet any site. In the normal germ $F^*g-\delta=O_i(r^2)$ and its first and second derivatives are $O_i(r)$ and $O_i(1)$ on the support. The derivatives of $\chi_r$ scale as $r^{-1}$ and $r^{-2}$, giving uniform curvature bounds there and $O_i(r^4)$ volume, all along the interpolation. The incoming Weyl measure on the cuff also has mass $O_i(r^4)$. Therefore

$$
 \Delta(u):=E_\sigma(g^{(u)};M)-e=O_i(r^4)
$$

uniformly in $u$, with the same $\Delta(u)$ in both signs by closed signature. Set $g_f=g^{(1)}$ and $\Delta=\Delta(1)$. The energy of the *uncharged* $g_f$ on $U_b$ is $O_i(r^4)$ in both signs, since the cuff bounds and the smooth source bounds cover that entire ball. Choose $r$ so the sum of this bound and the uniform bound for $|\Delta(u)|$ is below $\eta$. Constants in these bounds come from $g$, the centered chart and the cutoff profile. The number and scales of the sites do not enter them. During the entire cuff stage the total is $e+K+\Delta(u)$, while the unchanged sites alone give $E_\sigma(g^{(u)}+P;Q)\ge K\ge q^\sigma$. The original face, its collars and the entire $V$ retain the original metric throughout the ramp and cuff stages.

Fix a sphere radius $\ell>0$ and a positive sufficiently small native subwidth $w$. The interval $b\exp([-w,w]/\ell)$ is compactly inside $(2r,3r)$. Choose a smooth positive radial $\Omega$ equal to $\ell/\rho$ on a neighborhood of this interval of output radii $\rho$, and equal to one outside $(2r,3r)$. Inserting the factor by $\Omega^{2u}(g_f+P)$ preserves every chiral measure. The physical original face and collars still retain their metrics during this step. At its end put $k=\Omega^2(g_f+P)$.

Choose any exterior buffer $0<t<\omega$ in the chart, with $w<\omega/2$, and make a smooth increasing radial diffeomorphism $\zeta$ with

$$
 \zeta(R)=R\quad (R\le r\text{ or }R\ge1+\omega),\qquad
 \zeta(R)=b\exp((R-1)/\ell)\quad (|R-1|\le w).
$$

For small $r$ the prescribed image intervals are strictly ordered. On each gap, extend the positive derivatives of the two endpoint germs across sufficiently short neighborhoods, use a small positive derivative elsewhere and add a nonnegative interior bump to obtain the required integral. This realizes the indicated endpoint values and strict monotonicity. Let $\Phi_s$ be the radial map with radius $\zeta_s(R)=(1-s)R+s\zeta(R)$ and angle $y$, extended by the identity on the rest of $M$. Its inverse uses $\zeta_s^{-1}$ and the same angle. It is an orientation-preserving isotopy fixed on a neighborhood of every site. The transport path is $\Phi_s^* k$, with total $e+K+\Delta$ in each sign. It leaves the metric on the sites fixed and hence retains the lower bounds on literal $Q$. On the original collar $|t|\le w$ the image radius stays greater than $r$ along the whole transport, so the charged collar metrics there equal those of the same cuff and transport with $P=0$. On $V\setminus\{0\le t<\omega\}$ the metric remains $g$ throughout. At the outgoing face the metric is exactly $dt^2+\ell^2\gamma$ for the original signed Gaussian coordinate $t$ and the original angle, since $d\rho/\rho=dt/\ell$ and the image is in the flattened annulus. Here $\gamma$ has sectional curvature one. Both native central subwidths $w$ are physical lengths in the endpoint product as well as in the incoming Gaussian coordinate. Concatenate with smooth time parameters constant near the stage junctions to obtain (1).

## Whole sides and the cap prices

Let $m^\sigma=E_\sigma(g;D)$, $v^\sigma=E_\sigma(g;V)$, and $\mu_f^\sigma$ be the energy measure of the uncharged $g_f$. During transport put $b_s=(1-s)+sb$. Ignoring the zero-volume faces, $\Phi_s(D)=F(\overline B_{b_s})$, and the entire site set $U_*$ always lies in this image. Change of variables and conformal invariance give

$$
 \begin{aligned}
 E_\sigma(\Phi_s^*k;D)&=K+\mu_f^\sigma(F(B_{b_s})),\\
 E_\sigma(\Phi_s^*k;V)&=v^\sigma+\mu_f^\sigma(F(B_1\setminus\overline B_{b_s})).
 \end{aligned}
\tag{5}
$$

The exterior gains the entire outgoing annular measure, monotonically during transport. In particular it never loses its original charge $v^\sigma$. At $s=1$ the increment over $v^\sigma$ is $m^\sigma+\Delta-\beta^\sigma$, where $\beta^\sigma=\mu_f^\sigma(U_b)$. Its whole increase is supported in the selected original exterior buffer. The $O_i(r^4)$ uncharged remainder $\beta^\sigma$ stays inside the outgoing disk along with the whole calibrated increment $K$.

Attach the exterior cap in the marking $F(y)\leftrightarrow by$ for $|y|=1$. Use the Euclidean-coordinate ball $|x|\le b$ with a smooth positive radial multiplier times $\delta$, equal to $(\ell/|x|)^2$ near its boundary and constant near zero. The common product germ uses $t=\ell\log(\rho/b)$, with outward normals of the retained exterior and cap ball equal to $-\partial_t$ and $+\partial_t$. The comparison to $M$ is $\Phi_1$ on $V$ and $F$ on the appended coordinate ball. It is a smooth oriented diffeomorphism by the germ, with inverse $\Phi_1^{-1}$ on the retained image and $F^{-1}$ on the ball. Its energy on the appended ball vanishes.

For the disk cap, glue the stereographic exterior $|x|\ge b$ with its point at infinity in the same angular marking. Use the same product factor near $b$, smoothly joined to $4/(1+|x|^2)^2$ times $\delta$ towards infinity. The outward normals of the retained disk and the cap are now $+\partial_t$ and $-\partial_t$. The comparison to the standard smooth $S^4$ is $F^{-1}\Phi_1$ on $D$ and the identity on the stereographic exterior, with inverse $\Phi_1^{-1}F$ on the coordinate ball and the identity on the rest. Inversion in $|x|=b$ gives that exterior with infinity its standard disk structure. Both appended metrics are conformally flat. Their actual regional measures are zero. The disk-side closure therefore has energy $K+\beta^\sigma$. Signature applied to this smoothly capped $S^4$ yields $\beta^+=\beta^-=:\beta$, proving (2) in both signs. No recognition theorem about the topology of an unmarked ball is needed.

For $H<2T$, the joined path remains in positive Yamabe classes. At a first zero of the lowest eigenvalue of $L=-6\Delta+R$, its positive eigenfunction gives a scalar-flat representative. In the present convention Gauss–Bonnet on that representative gives $2E_+=16\pi^2+\frac12\int|\operatorname{Ric}_0|^2\,dV$, which contradicts $H<2T$. The positive class Yamabe representatives give $Y^2\ge48(2T-H)$ by the same formula. Inserting a cylinder of any finite length into the exact product germ is a path on the joined type with unchanged energy. The same Yamabe lower bound holds at every length. Test functions of compact support on each infinite half-cylinder extension then obey that bound by extension by zero on a sufficiently long joined cylinder. The stated cap metrics conformally compactify these ends. Cutoffs avoiding the added center are dense in $H^1$ by zero point capacity in dimension four. Together with conformal covariance this gives the same positive lower bound on each compact cap. [Chern–Gauss–Bonnet normalization, (0.4)](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf#page=3) · [Lee–Parker, (2.7) and the Yamabe existence result](https://users.math.msu.edu/users/parker/YamabeProblem.pdf) · [Marked collar positivity and reassembly](../manuscript/marked_collars_and_smooth_recognition.tex)

## Peak bound and minimizing comparison

For any joined path with the same marked disk, an exact round-product endpoint and a strict subcritical peak, the positive exterior cap has energy exactly that of the full endpoint $V$, and has type $M$. Thus $E_\sigma(g_1;V)\ge I$ in both signs. If the endpoint retains the two numerical core lower bounds, nonnegativity gives

$$
 H\ge E_\sigma(g_1;V)+E_\sigma(g_1;D)\ge I+q^\sigma,
 \qquad I+K\le H<2T.
\tag{6}
$$

Equality in the lower bound would require a minimizing positive exterior cap, peak attained at the endpoint, and zero disk-side mass off $Q$ in a sign attaining $K$. The strict inequality in (6) concerns the subcritical wall. The construction gives $H-(I+K)\le d+\eta$, provided $e+K+\eta<2T$. In particular if $I+K\ge2T$ there is no qualifying strict subcritical path. The range $I+K<2T\le e+K$ remains undecided by this construction at an individual index.

For any subsequence with $d_i\to0$ and $I+\max_\sigma q_i^\sigma\le2T-\epsilon$ for a fixed $\epsilon>0$, choose $\eta_i\downarrow0$ with $d_i+\eta_i<\epsilon$ at each late index. The achievable joined peak exceeds the necessary lower bound by at most $d_i+\eta_i\to0$. For the original E61 disk one has $q_i^\sigma\le E_\sigma(g_i;D_i)<\zeta/4$ by its chosen full tensor curvature ceiling $\zeta$ and $4|W^\sigma|_{\rm HS}^2\le|\mathrm{Rm}|_{\rm tens}^2$. If the ceiling was chosen with $\zeta/4<2T-I$, this supplies that headroom uniformly on the selected late sources. For a core on another marked enlargement the actual two masses must be inserted. The argument gives no uniform bounds on site scale, curvature, or marked convergence as $i\to\infty$.

The metric on $Q$ changes through the local perturbations and through the compression away from the sites. The numerical retention in (1) therefore leaves open preservation of the original metric or distribution on $Q$. The exterior comparison (2) differs from the original joined energy by $\Delta-\beta$, independently of $K$. A competitor below the infimum would require $\Delta-\beta<-d$, whereas positivity on the original type gives $e+\Delta-\beta\ge I$. The exterior cap can approach $e$ arbitrarily closely as the cuff shrinks.

Inspected SHA-256 prefixes are `227aff1a5cf6a3a7` (issue), `8063d76ad6875e80` (E61), `3afb193895a79e3b` (transport), `51b3b161e4876ab4` (assessment), `14c76574806a408e` (collar manuscript), `9462b4c6824ed5ba` (marked-cut manuscript) and `c9320f8f8b8c111d` (normalization). The local first and second variations, cap measures and limiting error bounds above are analytic.
