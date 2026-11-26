# Metric transport onto the original charged disk

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. CDS-B03 / E02j, [issue 1](../research-progress/handoffs/TRANSPORT_ON_THE_SELECTED_DISK_20261126.md) (`69cba30478b8`), dispatched to GPT-6.2 Sol/ultra, with GPT-6.2 Astra/ultra lead. Independent serving model and effort were unavailable. Working HEAD `19c187ad8dbe936cf165017c753a94add775ebaf`. Inputs [E61](../../../master/01_fixed_type_variational_descent/manuscript/spectral_windows.tex) (`8063d76ad687`), [E21](../../../master/notes/E21_ROUND_RESTART.md) (`fe25b0b69af4`) and [two isolated paths](../01_collar_deformation_and_adapted_coordinates/notes/ISOLATING_A_COUPLED_PATH.md) (`c5ce2a1b550f`).

At one fixed subcritical index of E61, a smooth joined path can put an exact round product on the original marked face and a second product on an inner slab. Its outgoing marked disk has zero chiral charge. The complete retained exterior gains the original disk charge and the signed flattening increment. Both capped sides have positive Yamabe class. The exterior cap is isometric to a conformal representative of the flattened source, so its energy remains at or above the same-type infimum.

## The buffered marking and the flattening

Fix one actual smooth oriented source $(M,g)$ of E61 with $Y([g])>0$ and $e=E_+(g;M)=E_-(g;M)<2T$, $T=4\pi^2$. Use the real chiral Weyl endomorphism norms. Let $D$ be the selected parametrized disk, $V=M\setminus\operatorname{int}D$, $\Sigma=\partial D$, and let $t$ be signed physical Gaussian distance from $\Sigma$, increasing into $V$. The face angle is the original parametrization $f:S^3\to\Sigma$. At this index the smooth embedded bicollar has a positive common Gaussian radius. The disk chart and a smaller piece of the buffer give an oriented chart $F$ on a neighborhood of $\overline B_{1+\epsilon}$, with $D=F(\overline B_1)$ and

$$
F((1+t)y)=\exp^g_{f(y)}(t\nu),\qquad y\in S^3,\quad |t|<\epsilon.
$$

Here $0<\epsilon<1/4$ can be decreased. To arrange this germ, straighten the inward collar on the parametrized disk relative to the unchanged boundary using collar uniqueness, then extend it outward by the physical Gaussian embedding in the supplied buffer. This adjusts interior coordinates and keeps $D,\Sigma,V$ as fixed source regions. The original metric in this germ is $dt^2+h_t$. No control on $h_t$ in any rescaled sequence is needed.

The central coordinates can be normalized while retaining this boundary germ. If $G_0=(F^*g)(0)$, precompose near zero by the positive linear map $G_0^{-1/2}$, cut off by using the flow of a linear vector field multiplied by a smooth interior bump. The normalized metric is $\delta+O_i(|x|)$ there. For normal coordinates at the center instead, use $x\mapsto\exp^g_{F(0)}(dF_0x)$ near zero. The corresponding change in the normalized chart is $x+O_i(|x|^2)$ with first derivative $\mathrm{Id}+O_i(|x|)$, so a sufficiently small cutoff of its displacement is a diffeomorphism supported in the interior and gives the desired germ. All constants here depend on the fixed index $i$.

Choose a fixed smooth radial $\chi$ equal to one through radius two and zero beyond radius three. For $r>0$ small, flatten through the affine path with parameter $a\in[0,1]$

$$
F^*g_a=\delta+\bigl(1-a\chi(|x|/r)\bigr)(F^*g-\delta)
$$

on $F(B_{3r})$, keeping $g$ elsewhere. Write $g_f=g_1$. This is a smooth family of uniformly elliptic metrics at the fixed index, and $F^*g_f=\delta$ on $B_{2r}$. On $B_{3r}$ the perturbation has $C^0$ size $O_i(r)$, bounded first derivatives, and second derivatives $O_i(r^{-1})$. The curvature is $O_i(r^{-1})$ and the volume is $O_i(r^4)$. In normal coordinates these bounds improve to $O_i(r^2)$, $O_i(r)$ and $O_i(1)$ through order two, with bounded curvature. The same comparison holds through the whole affine path. Thus the integral of squared curvature on its support, and the change of either total chiral energy, are $O_i(r^2)$ in the first chart and $O_i(r^4)$ in the normal chart. The original support mass was $O_i(r^4)$ in either case.

For $p=2$ or $p=4$ as appropriate, choose $r$ so the bound $C_i r^p$ on the two chiral energy changes is less than $2T-e$. This makes the flattening path stay strictly below the wall. At a zero first eigenvalue the conformal Laplacian has a positive eigenfunction giving a scalar-flat representative. Gauss–Bonnet at that representative gives $16\pi^2=2E_+-\frac12\int|\operatorname{Ric}_0|^2$, hence $E_+\ge 2T$. Continuity of the first eigenvalue therefore keeps the entire path in positive Yamabe classes. Set

$$
\Delta=E_\sigma(g_f;M)-e,
\qquad m^\sigma=E_\sigma(g;D),\qquad v^\sigma=E_\sigma(g;V).
$$

The increment $\Delta$ is common to both signs by closed signature. At every flattening time the complete exterior has $v^\sigma$, the disk has $m^\sigma+E_\sigma(g_a;M)-e$, and any marked core $Q\subset\operatorname{int}D$ changes only by its measured increment on $Q\cap F(B_{3r})$, bounded in absolute value by $C_i r^p$. [E21 fixed-source flattening and exact conformal graft](../../../master/notes/E21_ROUND_RESTART.md#an-exact-marked-disk-graft) · [Energy normalization](../../../master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex)

## The pullback on two native slabs

Fix any $\ell>0$ in the working unit of physical length, let $\gamma$ be the unit round metric on $S^3$, and set $b=(r/2)\exp[-3\epsilon/(4\ell)]$. Use $R$ for chart input radius and $\rho$ for chart output radius. Choose a smooth strictly increasing map $\zeta$ of radii with

$$
\zeta(R)=b\exp((R-1)/\ell)\quad\text{for } |R-1|\le3\epsilon/4,
$$

linear with positive slope near zero and equal to $R$ for $R\ge 1+7\epsilon/8$. The two prescribed ranges are strictly ordered since the upper image of the exponential piece is $r/2$. On each gap choose a smooth positive derivative with the given germs and sufficiently small integral, then add a nonnegative interior bump so its integral is exactly the required increase of $\zeta$. This constructs the increasing completion, and its linear tip is smooth in Cartesian coordinates. In the flat ball put a smooth positive radial factor $\Omega=\ell/\rho$ on an open annulus containing the image of this exponential piece. Extend it as one at the center and outside $B_r$ by taking the exponential of a smooth cutoff of $\log(\ell/\rho)$ away from zero. Thus $(\Omega^2 g_f)|_{F(B_{2r})}$ is conformally Euclidean. First insert the conformal change by the path $\Omega^{2s}g_f$, $s\in[0,1]$. It preserves both chiral measures on all fixed sets by conformal invariance in dimension four and retains the positive class.

Set $t_0=-\epsilon/2$ and choose $\alpha(R)$ equal to one on $|R-1-t_0|\le \epsilon/16$ and zero for $|R-1-t_0|\ge\epsilon/8$. Let $A_\tau$ be the flow of a smooth angular vector field $X$ on $S^3$. For $0\le s\le1$ define the supported diffeomorphism in polar coordinates by

$$
\Phi_s(R,y)=\bigl(\zeta_s(R),A_{s\alpha(R)}(y)\bigr),
\qquad \zeta_s(R)=(1-s)R+s\zeta(R).
$$

Conjugate by $F$ and extend by the identity outside the chart. There is no angular change near the center or the outer end. The map is smooth and orientation preserving. Its inverse takes $(\rho,z)$ to $(\zeta_s^{-1}(\rho),A_{-s\alpha(\zeta_s^{-1}(\rho))}(z))$, with the Cartesian inverse of the linear dilation at the origin. The path starts at the identity and is supported in the buffered disk. Pull back the metric as $G_s=\Phi_s^*(\Omega^2g_f)$. This changes the metric on the source while the marked disk and exterior in each evaluation stay fixed. Positivity and the two closed chiral energies $e+\Delta$ persist exactly throughout this stage. Concatenate the three stages through smooth time parameters constant near their junctions. Its full joined peak satisfies $H\le e+C_i r^p<2T$.

Write $G=G_1$. In $|t|\le\epsilon/8$ the angular flow is the identity. Here $d\rho/\rho=dt/\ell$, and the exact pulled metric is $G=dt^2+\ell^2\gamma$. The native central subwidths are each $\epsilon/8$ in both source and endpoint collars, since the original Gaussian chart also has unit $dt$. Constant-angle segments attain their lengths, and any connecting curve within the slab has length at least its $t$-displacement. In $|t-t_0|\le\epsilon/16$ the angular flow is independent of $t$ so the exact endpoint there is $dt^2+k$, with $k=\ell^2 A_1^*\gamma$. Choose $X$ so $k$ is nonproportional to $h_{t_0}$ somewhere, while leaving the original face marking fixed. If proportionality already fails take $X=0$. Otherwise pick one angular point and a local angular vector field that vanishes there and has derivative $\operatorname{diag}(a,-a,0)$ in a $\gamma$-orthonormal frame with $a\ne0$, cut off in its coordinate ball. Its time-one derivative changes two angular eigenvalues by different factors. Those changes give nonproportionality throughout an open set. Cross terms can occur between the two slabs as the angular flow varies in $t$. The pulled region stays conformally flat there. The fixed inner slab therefore supplies both the incoming family $dt^2+h_t$ and the exact inner isolation target in its native coordinates. Any smaller positive width contained in that slab is available at this index.

## Complete sides and both caps

Let $\mu_f^\sigma$ denote the signed Weyl-energy measure of $g_f$, which is nonnegative for each chirality. During the conformal step all set energies are those of $g_f$. During transport, for every fixed measurable source region $U$ one has $E_\sigma(G_s;U)=\mu_f^\sigma(\Phi_s(U))$. In particular put $b_s=\zeta_s(1)=(1-s)+sb$ and disregard zero-volume cut faces. The radial map sends the marked $D$ onto $F(\overline B_{b_s})$ and the complete $V$ onto its complement. Therefore

$$
\begin{aligned}
E_\sigma(G_s;D)&=\mu_f^\sigma(F(B_{b_s})),\\
E_\sigma(G_s;V)&=v^\sigma+\mu_f^\sigma(F(B_1\setminus\overline B_{b_s})),\\
E_\sigma(G_s;Q)&=\mu_f^\sigma(\Phi_s(Q)).
\end{aligned}
$$

The full signed ledgers include the initial bump region and the entire radial transfer. At the endpoint $F(B_b)$ is flat for $g_f$. Thus $E_\sigma(G;D)=0$ and $E_\sigma(G;Q)=0$, while $E_\sigma(G;V)=e+\Delta$ in both signs. The exact expenditure against the originally retained complete exterior is $m^\sigma+\Delta$. In particular a positively charged core cannot remain physically or conformally fixed under this path. Formulae with a protected fixed core require that different support condition.

For the exterior cap, glue a copy of $F(\overline B_b)$ with its metric $\Omega^2g_f$ to $V$ at $F(y)\leftrightarrow F(by)$, using $t=\ell\log(\rho/b)$ in the collars. The normal at the boundary of the retained exterior is $-\partial_t$ and at the boundary of the cap ball is $+\partial_t$. The metric is a common product germ. The map on the resulting closed assembly is $\Phi_1$ on the exterior and the chart identity on the attached ball, with inverse $\Phi_1^{-1}$ on the retained image and identity on the ball. These formulas glue to an oriented isometry onto $(M,\Omega^2g_f)$. Consequently this capped exterior has the smooth type of the original $M$, positive Yamabe class with constant $Y([g_f])$, and energy $e+\Delta$ in each sign. The attached ball has zero Weyl energy.

For the disk cap, apply $\Phi_1$ on $D$ and use the stereographic exterior $\{|y|\ge b\}\cup\{\infty\}$ of the coordinate ball in $S^4$ as its cap. Near the face take the cap metric $(\ell/|y|)^2\delta$, and near infinity take the unit round stereographic metric $(2/(1+|y|^2))^2\delta$. A smooth positive radial interpolation in between gives the desired conformally Euclidean cap. The collar identification is $F(y)\leftrightarrow by$ on the face for unit $y$, with signed log distance increasing from the disk into the cap. The disk has boundary normal $+\partial_t$ and the attached exterior model has boundary normal $-\partial_t$. On the model the outer cap is a smooth disk via inversion $y\mapsto b^2y/|y|^2$, self-inverse and fixing the radial boundary pointwise. The combined map is $F^{-1}\Phi_1$ on the retained disk and identity in the stereographic exterior model, inverted by $\Phi_1^{-1}F$ on the inner coordinate ball. Its conformal factor relative to the round sphere is positive and smooth everywhere, since it is constant relative to the round metric near infinity and the two factors match in the common product germ. Thus this capped disk has the conformal class of the standard round $S^4$ and zero energy in both signs. These two positivity conclusions concern closed Yamabe classes, which is the sign required by the variational comparison.

## Transfer and the infimum

Put $I=I^+(M)$ and $d=e-I$. The exterior cap minus the original total has energy increment $\Delta$, since its increase against the whole raw exterior is $m^\sigma+\Delta$. A strict saving beyond the minimizing excess would require $m^\sigma+\Delta<m^\sigma-d$. This is impossible in this construction since $e+\Delta\ge I$. The metric transport moves the original disk charge into the physical exterior and empties the protected core. The comparison measures these changes on the original specified subsets of $M$.

One can choose an allowed centered chart with $\Delta>0$ on this fixed smooth source. Precompose normal coordinates near the interior center by the shear $y^2=x^2+(a/2)(x^1)^2$, $a\ne0$, keeping $y^j=x^j$ for $j\ne2$, using a sufficiently small cutoff of its displacement off the center. The incoming first jet in the resulting normalized chart has only mixed metric entry $g_{12}=a x^1+O_i(|x|^2)$ and its transpose. In rescaled coordinates $x=rz$ the flattened endpoint metric, divided by the constant metric factor $r^2$, is $\delta+r(1-\chi(|z|))L(z)+O_i(r^2)$ in $C^2(B_3)$, where $L_{12}=L_{21}=a z^1$. At $z=(0,s,0,0)$ with $2<s<3$ and $(1-\chi)'(s)\ne0$, the linearized curvature has only the $12$ sectional term, of magnitude $|a(1-\chi)'(s)|$. This follows by differentiating $z^1(1-\chi(|z|))$ twice, giving only the $12$ and $21$ Hessian entries there. Each chiral linearized Weyl block is nonzero, since the $12$ and $34$ Weyl sectional entries both have magnitude one third of that sectional term. The rescaled strip consequently has chiral integral $c_\sigma r^2+O_i(r^3)$ with $c_\sigma>0$, whereas the original $F(B_{3r})$ has $O_i(r^4)$. Chiral energies are invariant under the constant rescaling, so $\Delta>0$ for sufficiently small $r$ and the same full joined ceiling still applies. Normal coordinates give the smaller $O_i(r^4)$ error, whose sign is undetermined by this estimate.

## Outer width and partial retention of the core

For any sufficiently small original Gaussian width $b_{\rm out}>0$, take the construction supported in $D$ and $A^+=\{0\le t<b_{\rm out}\}\subset V$ by decreasing $\epsilon$ in the fixed chart. Choose the flattening scale so $|\Delta|\le\eta<m^\sigma$ in the selected charged sign. The endpoint and incoming metric coincide on $V\setminus A^+$. Thus the full exterior increase $m^\sigma+\Delta$ is on $A^+$, and its density relative to the incoming volume satisfies

$$
\sup_{A^+}\frac{d\mu_G^\sigma}{dV_g}\ \ge\ \frac{m^\sigma-\eta}{\operatorname{vol}_g(A^+)}.
$$

The same lower bound holds for the supremum of the difference of endpoint and incoming densities, by integrating that difference. At the fixed index $\operatorname{vol}_g(A^+)=b_{\rm out}\operatorname{area}_g(\Sigma)+O_i(b_{\rm out}^2)$. Sending $b_{\rm out}$ to zero rules out a $C^2$-convergent subsequence with smooth positive definite limit across the original marked face, despite a uniform strict joined energy ceiling. This density comparison uses the incoming volume in the fixed source marking. It does not control abstract pointwise curvature after a change of marking.

More generally suppose a joined path on this source has peak $H\le e+\eta<2T$ and a matched round endpoint $h_1$. The marked stretch-and-cap test makes its exterior cap positive on the original type with precisely the exterior energy. Accordingly $E_\sigma(h_1;V)\ge I$, and every fixed core $Q\subset\operatorname{int}D$ satisfies $E_\sigma(h_1;Q)\le d+\eta$. If the incoming core charge is $q^\sigma$, at least $q^\sigma-d-\eta$ must be lost from that subset. This applies to partial retention of the core and rules out full physical or conformal preservation if $q^\sigma>d+\eta$. The present path attains zero endpoint core charge. Its chosen flattening scale and Gaussian subwidths are fixed-index data. [Whole retained cap and core bound](../01_collar_deformation_and_adapted_coordinates/notes/ISOLATING_A_COUPLED_PATH.md)
