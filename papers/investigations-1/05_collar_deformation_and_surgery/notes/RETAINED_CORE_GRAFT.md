# Retaining a charged core during marked disk transport

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. CDS-B03 / E02k, [issue 1](../research-progress/handoffs/EXTERIOR_RECOVERY_AND_NATIVE_CAPS_20261126.md) (`1f4b94e43838`). Intake `8471728a1549614f155a8751c709904cbcf994d6`. The dispatch records GPT-6.2 Sol/ultra with a GPT-6.2 Astra/ultra lead. Actual serving model and effort are unavailable. Fixed inputs are [E61](../../../master/01_fixed_type_variational_descent/manuscript/spectral_windows.tex) (`8063d76ad687`), [E02j transport](TRANSPORT_ON_THE_CHARGED_DISK.md) (`3afb193895a7`), [E21 graft](../../../master/notes/E21_ROUND_RESTART.md) (`fe25b0b69af4`), and the [closed wall and stretch](../../../master/manuscript/variational_comparison.tex) (`d52c8d2ad83e`). The calculation concerns one fixed smooth source and its actual parametrized disk.

Preparing a round annulus outside the prescribed core gives a path that preserves its physical metric at every time. A finite bound on the annular interpolation suffices for a subcritical joined peak and two positive caps. The same core can also be grafted into the disk emptied by E02j. That second path restores the core at its endpoint, while the whole exterior retains the energy delivered by E02j. The common charge of the standard sphere carrying the core is the exact added energy during the insertion.

## Source, round annulus and standard sphere carrying the core

Let $(M,g)$ be the smooth, closed, oriented Riemannian homotopy four-sphere at a fixed E61 index, with positive Yamabe class and common closed energy $e<2T$, where $T=4\pi^2$. For each $\sigma\in\{+,-\}$ use $E_\sigma(g;U)=\int_U|W_g^\sigma|_{\mathrm{HS}}^2\,dV_g$ on the real chiral two-forms. Write $I=I^+(M)$, $d=e-I$. Let $D$ be the supplied parametrized disk, $V=M\setminus\operatorname{int}D$, $m^\sigma=E_\sigma(g;D)$, $v^\sigma=e-m^\sigma$, and take the specified compact $Q\Subset\operatorname{int}D$ with charge $q^\sigma=E_\sigma(g;Q)$ positive in the selected sign. The oriented buffered chart $F$ of E02j has $D=F(\overline B_1)$, with $F((1+t)y)$ the original face angle $y$ and signed physical Gaussian distance $t$ increasing into $V$. Write $p=F^*g$ and $\rho=|x|$. Fix

$$
0<a_0<a_1<b<a_2<a_3<1,qquad Q\Subset F(B_{a_0}).
$$

Choose a smooth radial $0\le\chi\le1$, zero for $\rho\le a_0$ and $\rho\ge a_3$, and one on $[a_1,a_2]$. Choose $\ell>0$ and a smooth radial $u>0$, equal to $\ell/\rho$ near $b$ and one outside a compact subannulus of $a_1<\rho<a_2$. The annulus at $b$ with metric $u^2\delta$ has product coordinate $t=\ell\log(\rho/b)$ and metric $dt^2+\ell^2\gamma$, where $\gamma$ is the unit round metric on $S^3$.

Use an oriented stereographic chart of the actual standard $S^4$. Take a smooth positive $u_b$ there, equal to $u$ on a neighborhood of $\overline B_b$ and equal to $2/(1+|x|^2)$ near infinity. A positive log interpolation gives it on the intervening region. Define $\vartheta=1-\chi$ on $\rho\le b$ and zero beyond $b$. It is smooth and zero for $\rho\ge a_1$. In this chart define a standard-sphere metric path

$$
k_\tau=u_b^2\bigl[\delta+\tau\vartheta(p-\delta)\bigr],
\qquad 0\le\tau\le1.
$$

Here the bracket is exactly $\delta$ beyond $B_{a_1}$, so $p$ is only used in its known chart. The convex interpolation and the round germ at infinity make every $k_\tau$ smooth and Riemannian on the standard sphere. The initial metric is in the round class. The entire family has the fixed round product at $\rho=b$. By $F$, $k_1$ gives the original physical metric on a neighborhood of $Q$. Put

$$
K(\tau)=E_+(k_\tau;S^4)=E_-(k_\tau;S^4),qquad
K_*=\max_{0\le\tau\le1}K(\tau).
$$

The equality is closed signature and both integrals are supported in $B_{a_1}$. Thus $K(0)=0$ and $K(1)\ge\max_\sigma q^\sigma$. More exactly, the two off-core contributions are $K(1)-q^\sigma$. If the original core has unequal chiral energies, at least one contribution is at least $|q^+-q^-|$. An orientation-preserving insertion respects each of these charges.

## A path fixing the core at every time

Set $A=\{a_0<\rho<a_3\}$ and $p_s=\delta+(1-s\chi)(p-\delta)$. Let $g_s$ be $p_s$ in $F$-coordinates and $g$ outside the support of the change. During this path $g_s=g$ near $Q$ and on all of $V$. With

$$
J_\sigma(s)=E_\sigma(p_s;A),qquad
H_{\mathrm{rel}}=e+\max_{0\le s\le1}(J_\sigma(s)-J_\sigma(0)),
$$

the complete disk has $m^\sigma+J_\sigma(s)-J_\sigma(0)$. The signed differences $J_\sigma(s)-J_\sigma(0)$ agree for the two signs by closed signature on $M$. Apply the conformal change from $g_1$ to $h=u^2g_1$ via positive powers of $u$, extended as one globally. It changes neither regional chiral measure.

Fix any available small outer Gaussian buffer $A^+\subset V$. Take a native subwidth $w>0$ so that $|R-1|\le w$ lies in the Gaussian chart, and $b\exp((R-1)/\ell)$ on it lies where $u=\ell/\rho$. Complete

$$
\zeta(R)=b\exp((R-1)/\ell) \quad (|R-1|\le w)
$$

to an increasing smooth radial function which is the identity on a neighborhood of $[0,a_0]$ and before the outer buffer ends. The ordered endpoint values permit arbitrary positive gap lengths and positive prescribed derivative germs. In each gap, match the derivative germs on short end neighborhoods, join with a sufficiently small positive derivative in the middle and add a nonnegative interior bump of the integral needed to obtain the exact endpoint value. The identity germ near zero gives smoothness in Cartesian coordinates. For $\zeta_\lambda=(1-\lambda)\mathrm{id}+\lambda\zeta$, let $\Phi_\lambda$ be the radial orientation-preserving diffeomorphism in $F$-coordinates, extended by the identity. Its inverse uses $\zeta_\lambda^{-1}$ and the same angle. The path $\Phi_\lambda^*h$ preserves $g$ on a neighborhood of $Q$ because $h=g$ and $\Phi_\lambda=\mathrm{id}$ there. Its closed energy is the constant $E_\sigma(h;M)$. With $b_\lambda=(1-\lambda)+\lambda b$ the two complete side energies along transport are

$$
E_\sigma(\Phi_\lambda^*h;D)=E_\sigma(h;F(B_{b_\lambda})),\qquad
E_\sigma(\Phi_\lambda^*h;V)=E_\sigma(h;M)-E_\sigma(h;F(B_{b_\lambda})).
$$

The full joined peak is exactly $H_{\mathrm{rel}}$. Smooth time switches constant near each junction give a smooth joined path, fixed outside $D\cup A^+$. At its endpoint the original face has $dt^2+\ell^2\gamma$ in the original Gaussian $t=R-1$ on $|t|\le w$. Within the product slab the physical distance between its slices is the intervening $t$-width, attained by constant-angle segments. The map $\Psi=F^{-1}\Phi_1|_D:D\to\overline B_b$ has the explicit inverse $x=\rho y\mapsto F(\zeta^{-1}(\rho)y)$. It extends the boundary marking across the disk, is $F^{-1}$ near $Q$, and carries the endpoint disk isometrically to $k_1|_{\overline B_b}$. The inner metric used for the disk cap is hence a marked copy of the core-carrying disk of $S^4$.

For the disk cap attach the stereographic complementary ball $\{\rho\ge b\}\cup\{\infty\}$ with metric $k_1$ there. Its inverse coordinates at infinity are given by radial inversion. The disk cap closes to $k_1$ by $\Psi$ on the retained disk and the identity on the added ball, with inverses on the corresponding pieces. For the exterior cap attach $\overline B_b$ with $u^2\delta$ and boundary point $by$ at $f(y)=F(y)$. Its diffeomorphism to $M$ is $\Phi_1$ on $V$ and $F$ on the attached disk, inverted by $\Phi_1^{-1}$ and $F^{-1}$. The entire signed log-radius collars glue. The outgoing normals are $+\partial_t$ for the disk and $-\partial_t$ for the exterior, so both maps preserve the oriented assemblies. The added regions have zero Weyl energy. On the open half-cylinders $t=\ell\log(\rho/b)$ the cap metrics are the product multiplied by $(u_b\rho/\ell)^2$ on the disk cap and $(u\rho/\ell)^2$ on the exterior cap. Each multiplier is one near the seam and gives the smooth corresponding point compactification at its remote end.

Write $P=F(B_b)$, $U=F(B_{a_3}\setminus\overline B_b)$, and define the signed outer-connector increment $L^\sigma=E_\sigma(h;U)-E_\sigma(g;U)$. Since $h=g$ beyond $F(B_{a_3})$, the exact two capped prices and the increase against the full raw exterior are

$$
\begin{aligned}
E_\sigma(\mathrm{disk\ cap})&=K(1),\\
E_\sigma(\mathrm{exterior\ cap})&=e-E_\sigma(g;P)+L^\sigma,\\
E_\sigma(\mathrm{exterior\ cap})-v^\sigma&=m^\sigma-E_\sigma(g;P)+L^\sigma.
\end{aligned}
$$

The two closed prices each agree across signs. All complete exterior growth on the physical source is inside $A^+$. The first sufficient test is $H_{\mathrm{rel}}<2T$. Every joined class is then positive by the scalar-flat wall, with Yamabe constant at least $\sqrt{48(2T-H_{\mathrm{rel}})}$. Indeed a first zero eigenvalue of $-6\Delta+R$ has a positive eigenfunction giving a scalar-flat representative by conformal covariance. Gauss–Bonnet and signature would give $E_\sigma=2T+\tfrac14\int |\operatorname{Ric}|^2$. The same Gauss–Bonnet identity in the positive unit-volume Yamabe gauge gives the quantitative lower bound. Inserting arbitrary exact product length leaves the endpoint energy unchanged. A compactly supported test on either half-infinite product extension embeds into a sufficiently long joined source and inherits the lower bound. Compactifying the half-cylinder and cutting tests off at the added point, with squared gradient cost $O(r^2)$ in dimension four, gives the same lower bound on both closed caps. [Lee–Parker, §2, equation 2.7](https://users.math.msu.edu/users/parker/YamabeProblem.pdf#page=7) · [Chang–Gursky–Yang, equation 0.4 and norm conversion](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf#page=3) · [Finite marked stretch and cap](../../../master/manuscript/variational_comparison.tex)

Consequently $E_\sigma(g;P)-L^\sigma\le d$ in both signs, and $H_{\mathrm{rel}}\ge I+K(1)\ge I+\max_\sigma q^\sigma$. A measured endpoint reduction beyond $d$ would contradict the subcritical peak test. This uses the entire outer connector $U$ and includes the displaced mass $m^\sigma-E_\sigma(g;P)$ in the increase on the complete exterior.

## Grafting into the disk emptied by transport

To center the E02j pocket outside $Q$, choose the common chart $F$ from the start with its center at an interior point of $D\setminus Q$. A supported coordinate isotopy along an interior arc puts the center there. Install the normal germ there before choosing the donor radii and take the E02j flattening ball disjoint from $Q$. Use this same chart for both radial maps, with no angular shear and the same $\ell$. Its endpoint $G$ has $G|_D=A_0^*(u_{\mathrm{ev}}^2\delta)$ under its orientation-preserving radial disk map $A_0:D\to\overline B_{b_{mathrm{ev}}}$, with $A_0(F((1+t)y))=b_{\mathrm{ev}}e^{t/\ell}y$ near the fixed face. Its joined peak is at most $e+\eta$ for any fixed $0<\eta<2T-e$ by the choice of flattening radius. At the endpoint $E_\sigma(G;D)=0$ and $E_\sigma(G;V)=e+\Delta$, where $|\Delta|\le\eta$ and $\Delta\ge-d$ since the E02j exterior cap is positive on the source type. Take $w$ within both available product strips.

Dilate the coordinates $A_0$ to radius $b$ by $x\mapsto (b/b_{\mathrm{ev}})x$, obtaining $A_b$ and the corresponding conformal metric $u_{\mathrm{ev},b}^2\delta$ on $B_b$. In its face germ the multiplier is $\ell/\rho$ by the dilation formula. The radial diffeomorphism $A_b^{-1}\Psi$ of $D$ is the identity on a collar of its boundary. The convex interpolation of its radial function with the identity is an isotopy relative to that collar. Near zero each radius function is linear with positive slope and the interpolation is smooth in Cartesian coordinates. Extend this isotopy by the identity on $V$ and pull back $G$. Its endpoint on $D$ is $\Psi^*(u_{\mathrm{ev},b}^2\delta)$, with zero Weyl energy throughout on $D$. Replace $u_{\mathrm{ev},b}$ by $u_b$ by log interpolation, fixed at the face. The metric is now $\Psi^* k_0$ on $D$. Along the graft stage set the metric equal to $\Psi^*k_\tau$ on $D$ and $G$ on all of $V$. Both metrics agree throughout the fixed native product germ and this is a smooth path on the original type. At $\tau=1$ it equals $g$ on a neighborhood of $Q$. The two intermediate zero-Weyl paths make the passage from the actual E02j metric to the prescribed reference of the graft exact.

The whole joined peak of the three-part construction is bounded by

$$
\max\{e+\eta, e+\Delta+K_*\}.
$$

In the graft stage the signed complete disk and exterior charges are exactly $K(\tau)$ and $e+\Delta$. The second sufficient test is $e+\Delta+K_*<2T$. The source path and the entire donor path are positive under this test, using the positive round start of $k_\tau$. The positive exterior cap is the E02j cap and costs $e+\Delta$, an increase of $m^\sigma+\Delta$ against the original exterior. The disk cap is exactly $k_1$, at cost $K(1)$. The required inequality for an exterior saving past $I$ would be $\Delta<-d$, which is excluded by the exact exterior identification. If $e+\Delta+K_*\ge2T$, this specified graft path reaches the energy wall. That observation alone decides neither the sign beyond the wall nor the existence of another path. At the intermediate time of emptying $Q$ has zero charge, so a positively charged $Q$ is retained only after reinsertion. The exact endpoint ledger still gives the necessary peak $I+K(1)$.

## Finite jet tests and a local positive-core instance

On a bounded chart region $S$ let $0<\lambda\le1\le\Lambda$ give the Euclidean eigenvalue bounds $\lambda\delta\le p\le\Lambda\delta$. Set $M_j=\sup_S|\partial^j(p-\delta)|_\delta$, $0\le j\le2$, and let $c_j$ bound the derivatives of a scalar interpolation coefficient $0\le a\le1$. For $p_a=\delta+a(p-\delta)$, the first and second derivative bounds are $D_1=M_1+c_1M_0$ and $D_2=M_2+2c_1M_1+c_2M_0$ in Euclidean tensor norms. The all-lowered curvature consists of four second derivative terms with factor $1/2$ and two contracted products of first-kind Christoffel coefficients. Their Euclidean norm is at most $2D_2+(9/2)\lambda^{-1}D_1^2$. The metric norm of a covariant four-tensor is bounded by $\lambda^{-2}$ times its Euclidean norm. Using $dV_{p_a}\le\Lambda^2dx$ yields the uniform two-sign estimate

$$
E_\sigma(p_a;S)\le
\mathcal B(S)=\Lambda^2\lambda^{-4}\operatorname{vol}_\delta(S)
\bigl(2D_2+\tfrac92\lambda^{-1}D_1^2\bigr)^2.
$$

For $J_\sigma(s)$ use $S=A$, $a=1-s\chi$. For $K_*$ use $S=B_{a_1}$, $a=\tau\vartheta$, using conformal invariance to remove $u_b^2$. At radial transition width $w_0=\min(a_1-a_0,a_3-a_2)>0$, a fixed smooth cutoff profile gives $c_1\le C/w_0$ and $c_2\le C(w_0^{-2}+a_0^{-1}w_0^{-1})$. This follows from the derivatives of the Euclidean radius on the support of the cutoff derivatives. Thus $e+\mathcal B(A)-J_\sigma(0)<2T$ certifies the full-time path and $e+\Delta+\mathcal B(B_{a_1})<2T$ certifies the separated graft. The same bounds control the donor path independently whenever $\mathcal B(B_{a_1})<2T$. The no-cost radial extensions are exact, so these tests use the original coordinate jets and cutoff widths without estimates of derivatives of a compressed graft metric.

Suppose the specified core contains an interior point $x_0$ of nonzero $W^{\sigma_0}$. At that fixed source index, recenter $F$ at $x_0$ and take its normal germ there, keeping the original face marking. Let $\widehat Q_r=F(\overline B_r)\Subset\operatorname{int}Q$ and take $(a_0,a_1,b,a_2,a_3)=(2r,3r,4r,5r,6r)$ within the normal germ. The bounds $M_j=O_g(r^{2-j})$ and $c_j=O(r^{-j})$ give $J_\sigma(s),\,K(\tau)=O_g(r^4)$ uniformly in both parameters. The actual signed charge of the small protected ball is

$$
E_\sigma(g;\widehat Q_r)
=\frac{\pi^2}{2}|W_g^\sigma(x_0)|_{\rm HS}^2r^4+O_g(r^5).
$$

This follows by integrating the smooth Weyl density against the normal-coordinate volume density. The selected sign is positive for every sufficiently small $r$. For any desired fixed-index headroom $0<\eta<2T-e$, choose $r$ so $C_g r^4<\eta$ and apply the full-time construction with $\widehat Q_r$ as the protected core. It preserves $g$ near $\widehat Q_r$ for all times, gives the named product collar on the original face, and has $H_{\mathrm{rel}}\le e+\eta$. In each sign its actual disk cap costs $K(1)=O_g(r^4)$ and its exterior cap costs $e-E_\sigma(g;F(B_{4r}))+L^\sigma=e+O_g(r^4)$, since the old inner mass and the complete outer-connector increment are both $O_g(r^4)$. The complete exterior increase is $m^\sigma-E_\sigma(g;F(B_{4r}))+L^\sigma$. Both caps are positive. The radius and all constants are fixed-index quantities.

This instance protects a specified small ball within $Q$. Pricing a path that keeps the entire original $Q$ needs the finite annular measurements above. E61's incoming curvature bounds give neither a cutoff-jet estimate for an arbitrary such annulus nor a uniform margin along a minimizing sequence. A prescribed core satisfying $I+\max_\sigma q^\sigma\ge2T$ is excluded from every strictly subcritical matched comparison with a positive zero-cost exterior cap on the original type.
