# SP4-MASTER-E02 · Quantile block and physical ball marking

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. This is bounded E execution of the [issued B03 test](../research-progress/handoffs/E02_QUANTILE_CHART.md). The requested helper routing was GPT-6.2 Sol/ultra, and the actual serving model and reasoning effort are unavailable. The committed geometric inputs are at `fc60509a27f6b97f48e2619f9e6f0f6cd4eb36e2`. The frozen working SHA-256 prefixes of the main TeX, marked cut, first-order splice and physical-volume files were respectively `a499b313e6d5`, `3f3722b56d34`, `f93717b0b73c` and `8ff80d4d42e5`. The evidence is a conditional substitution into the two-cap theorem and a symbolic calculation in one flat local model. [Initial edition review](../reviews/INITIAL_EDITION_20261125.md)

## Two complete sides of the physical quantile block

Use smooth Riemannian volume-one Yamabe metrics $g_i$ on a fixed closed oriented smooth homotopy four-sphere. Set $e_i=E_+(g_i)le 8\pi^2-\delta$, $Y([g_i])\ge y_0>0$, and $T=4\pi^2$. Here $W^+$ acts on the oriented self-dual two-forms and its norm is Hilbert–Schmidt. Choose $\ell\ge1$ with $C_I\ell^{-3/2}<\frac12\min\{y_0,Y_{\rm rd}/2\}$ before $i\to\infty$. Fix the dyadic block size $m$ with $m\log2>2(\ell+2)$, allowing this logarithmic room in the radial interval. With NECK-E11's physical radii $a_i^{\rm q}<b_i^{\rm q}$, use the complete sets $D_{i,-}=B_{g_i}(x_i,a_i^{\rm q})$ and $D_{i,+}=M\setminus B_{g_i}(x_i,b_i^{\rm q})$, each of chiral mass $\eta>0$. The middle-half selection when $b_i^{\rm q}/a_i^{\rm q}\to\infty$ supplies one complete block $C_i$ having $\int_{C_i}|\mathrm{Rm}_{g_i}|_{\mathrm{tens}}^2\,dV_{g_i}\le\Lambda/p_i\to0$, where $p_i$ is the number of disjoint candidate blocks. Radial room and the ball-volume lower bound leave the chart and separation to be verified. [NECK-E11](../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E11_BALANCED_BLOCK_AND_NONCOLLAPSE_20261125.md#a-region-with-two-positive-chiral-masses) · [Owning quantile selection and `prop:weakquantiles`](../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/marked_necks_and_chiral_energy.tex#L821)

Suppose one oriented annulus chart into $C_i$ reaches both prescribed buffers and its middle link puts $D_{i,-}$ and $D_{i,+}$ in opposite full components. On the chart use the constant physical rescaling $m_i=\rho_i^{-2}\Phi_i^*g_i=\delta_{\rm Euc}+v_i$. Write $a_i=\|v_i\|_\infty$, $d_i=\|Dv_i\|_4$, $K_i=\|\mathrm{Rm}_{m_i}\|_{2,T_{i,-}\cup T_{i,+}}$, and $q_{i,j}=E_+(g_i;T_{i,j})$ on the source splices. Scaling and $E_+(g;U)\le\int_U|\mathrm{Rm}_g|_{\mathrm{tens}}^2/4$ give $K_i=o(1)$ and $\sqrt{q_{i,j}}\le K_i/2$. If $a_i+d_i\to0$, set

$$
\Delta_i=C(a_iK_i+d_i^2+d_i+a_i),\qquad
\gamma_{i,j}=2\sqrt{q_{i,j}}\,\Delta_i+\Delta_i^2=o(1).
$$

The capped Yamabe constants are bounded below by

$$
\min\{y_0,(1-C_\ell(a_i+d_i))Y_{\rm rd}\}-C_I\ell^{-3/2}>0
$$

for large $i$. The two raw masses $m_{i,j}=E_+(g_i;P_{i,j})$ satisfy $\eta\le m_{i,j}\le e_i-\eta$. Each cap therefore has $E_+(\widehat g_{i,j})\le e_i-\eta+\gamma_{i,j}$. For a hypothetical nonstandard $M$, once $e_i+\gamma_{i,-}+\gamma_{i,+}<2T$, the raw side opposite the exceptional cap $s$ has mass at most $e_i-I^+(M)+\gamma_{i,s}$. Both inequalities $m_{i,j}>e_i-I^+(M)+\gamma_{i,-j}$ hold on a minimizing sequence and give the contradiction. The bounds concern the entire sides and use the placement of both complete sets, which are disjoint from both modifications. [Master `weak:splice`, `weak:side-cost`, `weak:yamabe` and `weak:balanced`](../manuscript/first_order_splice.tex) · [Finite-cut criterion and net splice excess](../manuscript/marked_cut.tex)

If the supplied chart is on a finite oriented quotient, first use the downstairs straightening estimate on the closed source. An $o(1)$ cost puts the exact product link in a metric of global $E_+<9\pi^2$, so the source link test gives $\Gamma=1$. Only then apply the spherical-cap argument. The exact Bach-flat extraction theorem already supplies a smooth spherical chart in this separated-quantile regime. Chang, Qing and Yang's Theorem 3.1 uses exact Bach flatness, a positive Yamabe metric, $b_1=0$, an annular component meeting the outer sphere, scale and curvature bounds, and the inner area bound (3.4). The small critical integrals and the physical lower ball-volume bound of NECK-E11 alone have no such extraction conclusion. [Owning `prop:link`](../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/marked_necks_and_chiral_energy.tex#L363) · [Owning `thm:exactcut`](../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/marked_necks_and_chiral_energy.tex#L895) · [Chang–Qing–Yang, Theorem 3.1, pp. 9–10, inspected 25 November 2026](https://arxiv.org/pdf/math/0508621v2#page=10)

## What the smooth volume ball supplies at its actual marked face

The ball in `vol:smooth-balls` is the image of a closed concentric parameter ball compactly contained in the smooth open embedding from the almost-maximal-volume theorem. Separation and the inclusion of the smaller metric ball are statements about the rescaled positive-Ricci gauge $k_i=H_i$. They persist under reparametrization supported in the parameter interior that preserves the chosen closed parameter ball. A smooth two-sided collar follows locally from the open embedding. The given inclusion radii supply neither the prescribed logarithmic width about that face nor first-order comparison through the two buffers. Cheeger–Colding Appendix A, Theorems A.1.8–A.1.9, provides the embedding and smaller-ball inclusion from the small-radius near-maximal-volume hypothesis under a Ricci lower bound. Its Hölder conclusions and the smoothness for smooth sources do not give metric derivative norms in the marked chart. [Owning `vol:smooth-balls`](../../investigations-1/03_first_order_twistor/01_sections_and_connections/02_dirac_collar_extraction/manuscript/volume_witnesses.tex#L430) · [Cheeger–Colding I, Appendix A, pp. 458–459, inspected 25 November 2026 via author-uploaded copy](https://www.researchgate.net/publication/315331142_On_the_structure_of_spaces_with_Ricci_curvature_bounded_below_I)

In particular, if $g_i=w_i^2k_i$, $\bar k_i=\sigma_i^{-2}\Phi_i^*k_i$, and $f_i=\sigma_i(w_i\circ\Phi_i)/\rho_i$, then $m_i=f_i^2\bar k_i$ and

$$
D m_i=f_i^2D\bar k_i+2f_i(Df_i)\otimes\bar k_i.
$$

Even a first-order estimate on $\bar k_i$ would require a further estimate to transfer by this formula to the constant-scale physical metric. The local upper bound for $w_i$ only compares the volume density from above and gives an upper bound on physical distances. It supplies no lower bound or small derivative of $f_i$. One could work directly in a conformal representative with checked comparison and its own splice curvature bound, since chiral energy and the source Yamabe constant are conformally invariant. The physical full curvature bound is for $g_i$. [Volume theorem and physical-factor estimate](../manuscript/physical_volume.tex#L24) · [Upper density estimate](../manuscript/physical_volume.tex#L153)

Let $P_{i,\rm in}=\Omega_{i\ell}$ be the full inside and let $P_{i,\rm out}$ be the full compact exterior cut at its actual face. These have $0\le m_{i,\rm in}<\zeta/4$ and $m_{i,\rm out}>e_i-\zeta/4$. The volume lower bound for the union provides no inner chiral lower bound, and if $\zeta<4\eta$ no such ball can supply the inner quantile side with mass $\eta$. On a putative nonstandard minimizing sequence $e_i\ge T$, so $\zeta<4T$ does give a positive exterior lower bound. If both actual capped metrics exist with positive Yamabe sign and the cut budget holds, and the interior cap is subthreshold, the exceptional side must be the exterior. Then $m_{i,\rm in}\le e_i-I^+(M)+\gamma_{i,\rm out}$, a one-sided removal estimate. The energy of the full complement of the volume-bearing union needs its own estimate. [Physical ball witness and chiral mass comparison](../manuscript/physical_volume.tex#L224) · [Master finite-cut criterion](../manuscript/marked_cut.tex#L9)

## Euclidean model in an oriented, near-isometric marking

Take an oriented Euclidean parameter ball containing the closure of $A_\ell=\{e^{-\ell-2}<|y|<e^{\ell+2}\}$ and take its marked spherical face to be $|y|=1$. Use a fixed admissible splice profile $\theta(\log |y|)$ on $T_+=\{1<|y|<e\}$, and choose a rectangular box $Q$ compactly contained in an open subset of $T_+$ on which $0<\lambda_0\le\theta\le1-\lambda_0<1$. Let $\chi$ be smooth, equal to one near $Q$, and supported in that subset. With $A>0$ fixed and $n$ a positive integer tending to infinity, define

$$
s_n(y)=A n^{-2}\chi(y)\bigl(\cos(n y_2)+\cos(n y_3)\bigr),\qquad
F_n(y)=y+s_n(y)e_1.
$$

For large $n$, $\|Ds_n\|_\infty=O_A(n^{-1})<1$. Each $F_n$ is a global orientation-preserving diffeomorphism, by the derivative bound and the identity outside the support. It preserves the parameter ball, the marked ball $B_1$, the annulus and the two splices as sets. It fixes neighborhoods of their relevant faces. Physical balls, their measures and their containment relations are unchanged in the source. The marked metric $m_n=F_n^*\delta_{\rm Euc}$ is flat and the embedding and its inverse are $1+O_A(n^{-1})$ bilipschitz. In this Cartesian marking $a_n=O_A(n^{-1})$. On $Q$, however, $(v_n)_{12}=\partial_2 s_n$ and

$$
\partial_2(v_n)_{12}=-A\cos(n y_2),\qquad
\liminf_n d_n^4\ge 3A^4|Q|/8>0.
$$

The last step uses the mean of $\cos^4$ on a fixed interval. This example permits even perfect Euclidean volume ratios and ambient curvature while violating the derivative hypothesis at fixed width. Reparametrizing with $F_n^{-1}$ restores the exact flat comparison on the same marked region.

The literal componentwise splice can also incur a fixed positive cost in this marking. Let $p_n=\delta_{\rm Euc}+\theta v_n$ on $T_+$. At $y\in Q$, first freeze the cutoff to $\lambda=\theta(y)$. With $z_1=y_1+\lambda s_n$ the frozen metric is the product of a flat two-plane and the graph metric $dy_2^2+dy_3^2+c^2ds_n^2$, where $c^2=\lambda(1-\lambda)$. Its Gaussian curvature is

$$
K_G=\frac{c^2 A^2\cos(n y_2)\cos(n y_3)}{(1+c^2 |Ds_n|^2)^2}.
$$

Only one sectional curvature of the product's curvature operator is nonzero in its product frame, so the self-dual block of the curvature operator has diagonal $(K_G/2,0,0)$. Subtract $R/12=K_G/6$ to get $|W^+|_{\rm HS}^2=K_G^2/6$. The graph determinant factor is $1+O_A(n^{-2})$ and the triangular change from $y_1$ to $z_1$ has unit determinant on $Q$. In the special case of a plateau $\theta=\lambda$ on $Q$, the chiral integral there tends to $c^4 A^4|Q|/24$, by the mean $1/2$ of each squared cosine.

For a general fixed profile the variable metric and the frozen metric have the same metric value at the evaluation point. Their all-lowered curvatures differ by at most $C A+o_{n\to\infty;A}(1)$ on $Q$. Indeed the linear second-derivative part differs by $O(|D\theta||Dv_n|+|D^2\theta||v_n|)$, and the quadratic first-derivative part differs by $O((|Dv_n|+|D\theta||v_n|)|D\theta||v_n|)$. Here $Dv_n=O(A)+O_A(n^{-1})$ and $v_n=O_A(n^{-1})$. Their chiral projections and volume density factor agree at that point. The $L^2(Q,dy)$ norm of the frozen chiral density has lower limit at least $c_Q A^2$ with $c_Q>0$, using the positive lower bound for $\theta(1-\theta)$ and the squared cosine means. The variable density has lower limit at least $c_Q A^2-C_Q A>0$ after choosing $A$ sufficiently large and holding it fixed. The source splice energy is zero. Conformal multiplication by $|y|^{-2}$ preserves chiral energy, so this is a positive lower bound for the net surcharge of the literal splice on $T_+$. The other splice is unmodified in Euclidean coordinates and has surcharge zero. [All-lowered comparison and density convention](../manuscript/first_order_splice.tex#L53)

The corresponding cap-side scalar form behaves differently in this model. Put $G_n(y)=y+\theta(y)s_n(y)e_1$. It is $C^1$-close to the identity and is the identity near the splice endpoints and the buffer. Direct expansion gives

$$
p_n-G_n^*\delta_{\rm Euc}
=\theta(1-\theta)ds_n^{\otimes2}
-2s_n\,dy_1\odot d\theta-2\theta s_n\,ds_n\odot d\theta
-s_n^2 d\theta^{\otimes2},
$$

where $\odot$ is the half-symmetrized tensor product. Since $s_n=O_A(n^{-2})$, $Ds_n=O_A(n^{-1})$ and $D^2s_n=O_A(1)$, the right side tends to zero in $C^1$. In coordinates given by $G_n$ the same holds, using uniformly bounded first and second derivatives of $G_n^{-1}$. The conformal multiplier changes from $|y|^{-2}$ to $|G_n^{-1}(z)|^{-2}$, which tends to $|z|^{-2}$ in $C^1$ on the fixed splice. The cap-side quadratic form thus has the model comparison $(1-o(1))Y_{\rm rd}$ by the first-order scalar-form estimate, after the support-preserving change of coordinates on the *output*. Given a globally positive Yamabe source with this local comparison, the fixed-buffer localization preserves positivity. The flat model itself has no global quantile or closed-source hypotheses. [Cap scalar-form comparison and localization](../manuscript/first_order_splice.tex#L89)

## Remaining comparisons

True physical geodesic normal coordinates on a whole suitable annulus would fix the reparametrization freedom used here. They require injectivity past the outer radius in the chosen physical scale and quantitative metric estimates on that same annulus. For example, on a slightly larger protected annulus, $\|v_i\|_\infty\to0$ with $\|D^2v_i\|_2$ bounded implies $\|Dv_i\|_4\to0$ on the smaller annulus. Cut $v_i$ off on the larger annulus and integrate the divergence of $|Df|^2 Df$ against each compactly supported component $f$, to get $\|Df\|_4^2\le C\|f\|_\infty\|D^2f\|_2$. The cutoff terms are bounded in $L^2$ by the local $H^2$ estimate $\|Df\|_2\le C(\|D^2f\|_2+\|f\|_2)$ on the protected support, obtainable by integration by parts. The rescaled $L^2$ curvature budget does not itself bound the coordinate Hessian, as the flat calculation illustrates. The packet establishes neither the needed normal radius and estimates from the geometric hypotheses nor an obstruction to choosing a better marking.

The invariant cut target remains an actual embedded separating sphere with both full raw masses measured, positive Yamabe forms for the actual fillings, and small net chiral excess on each side. These may be obtained through a better gauge on the whole buffered separator or a different filling and estimates for its actual form and excess. On the physical witness ball this target gives at most one-sided removal unless there is further chiral information. On a separated-quantile block it gives the minimizing contradiction once both full sides are verified. The almost Bach-flat and unrestricted chart-extraction steps remain open here, as does the regime where the two quantiles have bounded logarithmic separation.
