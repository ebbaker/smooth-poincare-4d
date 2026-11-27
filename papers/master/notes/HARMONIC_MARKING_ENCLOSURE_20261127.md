# Harmonic marking bounds on the actual long-cuff bands

27 November 2026, prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded conceptual and analytical work under [master B02](../research-progress/REGISTER.md), with actual serving model and reasoning effort unavailable. Intake HEAD `48f36794f9b1`. The [marked-tests receipt](../research-progress/handoffs/MARKED_TESTS_AND_ATTAINMENT_20261127.md) and [Neumann test](HOPF_NEUMANN_TEST_20261127.md) have working blobs `4fb78e2ee249` and `0a88a993bc54`. The [07 trial](../../investigations-1/07_positive_subcritical_entry/notes/DIRECT_TRIAL_AND_VARIATION.md), [tube marking](../../investigations-1/07_positive_subcritical_entry/notes/MARKED_CONNECTION_ASSEMBLY.md), [long cuffs](../../investigations-1/07_positive_subcritical_entry/notes/LONG_CUFF_SEAM.md) and [band form](../../investigations-1/07_positive_subcritical_entry/notes/THIN_DIRECT_SIGN.md) have blobs `e999229fcdf9`, `59c3993e018e`, `2cd30856714e` and `90510ea2b924`.

For the smooth Riemannian \(L=2\operatorname{arcosh}5\), width-\(1/16\) minus Miller–Schupp trial, the actual harmonic marking has \(\operatorname{tr}_{\rm flat}q_L<28\) on both entire planar band footprints. This gives a pointwise lower bound for the trace-free switching term throughout both bands, and an integrated pure switching contribution greater than \(60\) per band in the specific scalar quadratic form below. A residual estimate gives a way to validate the position of a numerical marking with the six labeled reflecting sides. The remaining quadratic form terms, the common-complement Neumann sign and both chiral energies at this width are open.

## The source and target hexagons

The source upper half is the portion of
\[
 F=\overline D_4(0)\setminus\big(D_{1/4}(-1)\cup D_{1/4}(1)\big)
\]
with \(\operatorname{Im}z\ge0\). Its three semicircular cuff sides alternate with the real gaps \([-4,-5/4],[-3/4,3/4],[5/4,4]\). The restriction of \(h_L\) is a diffeomorphism to the corresponding labeled target hexagon \(K\) and intertwines the six reflections upon doubling. Existence, uniqueness and preservation of the degree-one marking use the negative-curvature case of the corollary in Schoen–Yau §3 and the harmonic marking in Wolf §2. The local harmonic map equation in the original planar coordinate is the flat-domain equation by conformal invariance of harmonicity in dimension two. [Schoen–Yau, pp. 271–272](https://archive.ymsc.tsinghua.edu.cn/pacm_download/59/11042-Shing-Tung_Yau_47.pdf#page=8) · [Wolf, pp. 452–453](https://pagine.dm.unipi.it/~a019210/Wolf_Teichmuller%20theory%20of%20harmonic%20maps.pdf#page=4) · [Eells–Sampson, §5(B), p. 126](https://math.jhu.edu/~js/Math646/eells-sampson.pdf)

In the hyperboloid use \(\langle X,Z\rangle=-X_0Z_0+X_{\rm sp}\cdot Z_{\rm sp}\), \(o=(1,0,0)\), and \(e_i=(\cos(2\pi i/3),\sin(2\pi i/3))\). The three side seams are orthogonal to \(n_i=(\sqrt3,2e_i)\), with \(K\) on their nonpositive sides. The cuff between seams \(i,j\), with remaining index \(k\), has inward spacelike unit normal
\[
 m_{ij}=(-1/\sqrt2,\sqrt{3/2}\,e_k).
\]
Indeed its Klein equation is \(x\cdot(e_i+e_j)=1/\sqrt3\), with \(o\) on the inward side. The six vertices are
\[
 V_{ij}=\frac{n_j+5n_i}{\sqrt{24}}=\left(\frac3{\sqrt2},\frac{e_j+5e_i}{\sqrt6}\right),\qquad i\ne j.
\]
These formulae use the target mirror geometry of the actual cuff length. A nonnegative hyperboloid linear function on \(K\) is convex along its geodesics, since its restriction to any unit-speed geodesic has second derivative equal to its value. Its maximum is at a vertex, by first restricting to geodesic chords and then to the edges.

## A position enclosure without solving for the harmonic map

On the upper half write \(U=h_L\) in its hyperboloid lift and fix one cuff with normal \(m\). Then \(\ell=\langle U,m\rangle=\sinh d(U,m^\perp)\) on \(K\), where the distance is to the entire cuff geodesic. The equation in the original planar coordinate is \(\Delta U=|dU|^2 U\), since the normal to the hyperboloid is \(U\). Thus \(\Delta\ell=|dU|^2\ell\ge0\). This function vanishes on the corresponding semicircle. Its normal derivative is zero on the two incident real gaps by equivariance and \(\langle m,n_i\rangle=\langle m,n_j\rangle=0\). The vertex formula gives \(\ell\in[0,15/4]\) on \(K\): the values on the six vertices are \(0,3/4,15/4\), each twice.

On the upper hexagon the following three estimates hold for the respective cuff functions, and the same formulas hold on the reflected lower hexagon in its reflected target chart.
\[
 0\le \ell_{\mathrm{outer}}(z)\le\frac{15}{4}\min\!\left\{1,\frac{\log(4/|z|)}{\log(16/5)}\right\},
 \qquad
 0\le \ell_c(z)\le\frac{15}{4}\min\!\left\{1,\frac{\log(4|z-c|)}{\log 7}\right\},\quad c=\pm1.
\]
For the outer cuff the barrier vanishes on \(|z|=4\), has zero normal derivative on the incident real gaps and is at least one on the other two cuffs and the opposite gap, where \(|z|\le 5/4\). At \(z=0\) the barrier is \(+\infty\). The comparison follows by removing a small half disk there and then taking its radius to zero. The hole barrier vanishes on its own circle, has zero normal derivative on its incident real gaps and is at least one on the other three Dirichlet sides, where \(|z-c|\ge 7/4\). The maximum principle for the difference excludes a positive maximum in the interior or on a smooth Neumann edge, with the endpoint bounds supplied by the Dirichlet edges. These are enclosures of three concrete target components with exact planar barriers.

## A uniform derivative bound on the two tube footprints

With \(r=1+s\), \(0\le s\le1/8\), radius coefficient \(\delta=1/16\), and \(p=(u,v,w)\in S^2\), the planar tube point is \(z=c_i(t)+\delta r(u,v)\). Each letter loop, and every pause, lies within distance \(2\) of \(0\) and at distance at least \(1\) from either hole center. Hence the distance from every band point \(z\) to the boundary of \(F\) is at least
\[
 \rho=1-9/128-1/4=87/128.
\]
Each open Euclidean disk \(D_\rho(z)\) meets at most one real gap. Its intersection with the real line is an interval and it misses the removed disks. The image of this disk therefore lifts into \(K\) alone or into \(K\cup s_i K\), the two adjacent target hexagons across the corresponding seam, where \(s_i\) is its reflection. For \(K\) alone one can use any of the seam centers in the next estimate.

The foot of \(o\) on seam \(i\) is \(p_i=(2,\sqrt3 e_i)\). The function \(\cosh d(p_i,X)=-\langle p_i,X\rangle\) has vertex maximum \(9/\sqrt2\) on \(K\), since \(\min_{j\ne k}(e_j+5e_k)\cdot e_i=-3\). Reflection fixes \(p_i\) and gives the same bound on the two-copy image. Write \(R_*=\operatorname{arcosh}(9/\sqrt2)\) and \(E=|dU|^2\) with the Euclidean domain norm. The Bochner identity with flat domain and curvature \(-1\) target gives \(\frac12\Delta E=|\nabla dU|^2+2|U_x\wedge U_y|^2\ge0\). This is the local identity of Eells–Sampson §3, equation (16) with \(E\) twice their energy density. Also \(\operatorname{Hess}_{\mathbb H^2} d(p_i,\cdot)^2\ge2g_{\mathbb H^2}\) by polar coordinates, including at \(p_i\). Thus \(b=d(p_i,U)^2\) has \(\Delta b\ge2E\). [Eells–Sampson, pp. 123–124](https://math.jhu.edu/~js/Math646/eells-sampson.pdf)

For every \(0<t<\rho\) the disk mean of \(E\) is at least \(E(z)\). Therefore the circular mean \(M_b(t)\) satisfies \(M_b'(t)\ge tE(z)\). Integrating and letting \(t\uparrow\rho\) proves
\[
 \operatorname{tr}_{\rm flat}q_L(z)=E(z)\le \frac{2(R_*^2-b(z))}{\rho^2}\le \frac{2R_*^2}{\rho^2}<28.
\]
For the strict rational comparison, the \(0\) through \(10\) even Taylor terms of \(\cosh(127/50)\) sum to more than \(1273/200>9/\sqrt2\), and \(2(127/50)^2/(87/128)^2<28\). The bound gives \(0<q_L<28g_{\rm flat}\) as quadratic forms. The strict positivity uses the harmonic diffeomorphism.

An absolute first-derivative bound for \(q_L\) also follows on the same footprints. In \(D_\rho(z)\) use \(T_i=\partial_iU\), \(D_i\) for the pullback target connection and \(S_{ij}=D_i T_j\). Differentiating harmonicity gives \(\sum_a D_aD_a T_j=\sum_a R(T_a,T_j)T_a\). In commuting \(D_i\) through this rough Laplacian on \(T_j\), the term \(\sum_a R(D_aT_a,T_i)T_j\) vanishes and \(\nabla R=0\) in the target. The six remaining contractions have types
\[
 R(S_{ia},T_j)T_a,\quad R(T_a,S_{ij})T_a,\quad R(T_a,T_j)S_{ia},
 \quad R(T_a,S_{ai})T_j,\quad 2R(T_a,T_i)S_{aj}.
\]
Each, with its multiplicity, is bounded in the Euclidean tensor norm by \(E|S|\) using the curvature-\(-1\) formula and Cauchy–Schwarz in the summed \(a\). Consequently \(\Delta |S|^2\ge-12E |S|^2\).

Take \(b_0=1/12\). On \(D_{2b_0}(z)\) the same distance argument on disks of radius \(\rho-2b_0\) gives \(E\le 2R_*^2/(\rho-2b_0)^2<50\). The disk Green identity centered at \(z\) gives
\[
 \int_{D_{b_0}(z)} |S|^2\le\frac{50\pi}{\log2},
\]
because the Green weight \(\log(2b_0/|x-z|)\) is at least \(\log 2\) on the smaller disk and \(\Delta E\ge 2|S|^2\). The function \((x,t)\mapsto |S(x)|^2e^{\sqrt{600}\,t}\) is subharmonic in the Euclidean three-ball of radius \(b_0\) centered at \((z,0)\). Its ball mean is at most \(3e^{\sqrt{600}b_0}/(2\pi b_0^2)\) times the disk integral. Thus \(|S(z)|<360\), using \(\log 2>2/3\) and \(e^{\sqrt{600}/12}<8\). The latter also follows from \(\log 2>2/3+2/81\) by the power series for \(2\operatorname{artanh}(1/3)\). Since \(\partial_k(q_L)_{ij}=\langle S_{ki},T_j\rangle+\langle T_i,S_{kj}\rangle\), this gives \(|\partial q_L|_{\rm flat}<4000\). This absolute estimate and pointwise positivity give neither a competitive lower eigenvalue bound nor a small enough remainder for the form.

## Consequences for the fixed-width quadratic form

Keep the notation \(A=ds^2+\sinh^2r\,d\theta^2+\sigma\), \(B_i=\Phi_i^*(q_L+\sigma)\), \(a=H(16s-1)\) and \(h=((1-a)A+aB_i)|_{T(S^1\times S^2)}\). Let \(N\) be the lapse for increasing \(s\). The radial derivative of the marking gives
\[
  (B_i)_{ss}=\delta^2\big(q_L((u,v),(u,v))+w^2\big)\le 7/64,
  \qquad 1-a\le N^2\le1-a+(7/64)a .
\]
The lapse bounds follow by minimizing the full metric norm of \(\partial_s+Y\) over slice tangents \(Y\). On the two framed sphere poles \(p=(0,0,\pm1)\), \((B_i)_{ss}=\delta^2\), all radial mixed entries vanish, and \(N^2=1-a+a\delta^2\) exactly.

For any nonzero sphere tangent \(Y\), the end metric ratios satisfy
\[
 \frac{B_i(Y,Y)}{A(Y,Y)}\le 28\delta^2r^2<\frac17,
 \qquad
 \frac{B_i(\partial_\theta,\partial_\theta)}{A(\partial_\theta,\partial_\theta)}
 \ge\frac{\sin^2(\pi/3-9/128)}{\sinh^2(9/8)}>\frac13.
\]
For the longitude estimate the azimuthal part alone gives the stated lower bound, including the second latitude by spherical reflection. For example, \(\sin(\pi/3-9/128)>9/11\) follows from \(\sin(\pi/3)>6/7\) and the quadratic lower bound for cosine. The first four terms of the sinh series at \(9/8\), plus the last retained term divided by \(49\), give an upper bound less than \(7/5\), since the successive omitted-term ratios are less than \(1/50\).

An end metric ratio \(x\) in a given direction gives Rayleigh ratio \((x-1)/(1-a+ax)\) for \(\partial_a h\) relative to \(h\). This function is increasing in \(x\). Taking the longitude and sphere directions bounds the spectral spread of \(h^{-1}\partial_a h\) below by
\[
 \frac{4}{21(1-2a/3)(1-6a/7)}.
\]
The squared Hilbert–Schmidt norm after removing its trace is at least half the spread squared. For the pure switching tensor \(P=(\partial_a h)^\circ_h/(2N)\) in the [band form](../../investigations-1/07_positive_subcritical_entry/notes/THIN_DIRECT_SIGN.md), this gives
\[
 |P|_h\ge\frac{\sqrt2}{21\sqrt{1-a+(7/64)a}(1-2a/3)(1-6a/7)}.
\]
These inequalities hold also at the two edges of the prescribed switch. They do not use derivative estimates for the relator speed or a choice of orthogonal coordinate tangent directions for \(h\).

For \(d\mu=d\theta\,dA_\sigma\), \(J=dV_h/d\mu\) and \(\mathcal A(s,a)=\int |P|_h^2 NJ^{1/3}\,d\mu\), one has \(J\ge(1-a)^{3/2}\sinh r\). In particular
\[
 \mathcal A(s,a)\ge \frac{16\pi^2}{441}\frac{\sqrt{1-a}\,(\sinh r)^{1/3}}{\sqrt{1-a+(7/64)a}(1-2a/3)^2(1-6a/7)^2}.
\]
For \(a=H(x)\), \(0<x<1\), the exact step has \(H'(x)=a(1-a)(x^{-2}+(1-x)^{-2})\ge8a(1-a)\). Integrate the pure switching coefficient against the test \(f=\chi J^{-1/3}\), choosing a smooth cutoff in \(0<s<1/8\) with \(\chi=1\) from \(s=1/16\) to the point where \(a=15/16\). The change of variable \(a=H(16s-1)\), the bound \(\sinh r>1\), and the inequalities \(\pi^2>9\) and \(\sqrt{y}\ge y\) for \(0\le y\le1\) give
\[
 \int \chi^2(a')^2\mathcal A(s,a)\,ds\ge
 \frac{2048\cdot9}{441}\int_0^{15/16}
 \frac{a(1-a)\,(1-a)/(1-a+7a/64)}{(1-2a/3)^2(1-6a/7)^2}\,da>60.
\]
An exact rational check divides this interval at \(k/16\). On \([l,b]=[k/16,(k+1)/16]\) use the decreasing ratio \((1-b)/(1-b+7b/64)\), the increasing reciprocal squared factors at \(l\) and the exact integral \((b^2-l^2)/2-(b^3-l^3)/3\). The floors of \(1000\) times the resulting lower contributions, including the prefactor, are \(77,264,500,797,1171,1643,2238,2987,3924,5080,6466,8020,9480,10050,7716\), summing to \(60413\). The bound applies to both bands. The form contains \(-|a'P+S|^2 f^2\), with \(S\) the fixed-weight normal and shift term. This computation controls its pure switching part. The cross term, slice and lapse terms and the cutoff gradients still require estimates on the same metric.

## A residual-to-position estimate and the derivative requirement

Let \(v\) be a smooth approximate map of the doubled surfaces, respecting the marked homotopy class and all reflections, and carrying the source upper half into the specified target hexagon. In conformal coordinates use the flat-domain tension \(\tau(v)\) and let \(m(v)\) be the smallest singular value of \(dv\) with Euclidean source and hyperbolic target norms. Suppose \(m(v)>0\) and \(|\tau(v)|\le\eta\,m(v)^2\) everywhere, with \(0\le\eta<1\). The ratio is invariant under changes of conformal source coordinate. Choose matching equivariant lifts of \(h_L,v\) to \(\mathbb H^2\), so that their separation \(d\) descends to the compact double. Away from coincidence, the Jacobi fields for the connecting geodesic give the distance Hessian, on endpoint vectors \(a,b\), as
\[
 \coth d\big(|a_\perp|^2+|b_\perp|^2\big)-2\operatorname{csch}d\langle a_\perp,\Pi b_\perp\rangle
 =\coth d\big|a_\perp-\operatorname{sech}d\,\Pi b_\perp\big|^2+\tanh d\,|b_\perp|^2.
\]
Here \(\Pi\) is parallel translation and the subscript denotes projection transverse to the geodesic. The formula follows by solving \(J''-J=0\) for its perpendicular endpoint data and evaluating the endpoint term of the index form. Since the transverse target space is one-dimensional, the sum of the squared projections of the two \(dv\)-images onto it is at least \(m(v)^2\). The chain rule and harmonicity of \(h_L\) therefore give \(\Delta d\ge m(v)^2\tanh d-|\tau(v)|\). At any positive maximum the left side is nonpositive, so \(d\le\operatorname{artanh}\eta\). Smooth equivariance makes seam and corner maxima ordinary interior maxima of the doubled problem. A first-order approximate trace on a hexagon, without smooth doubled matching or certified residual, does not meet this estimate.

For a compactly supported band test the scalar form can be evaluated with coefficient bounds through the first derivatives of the metric. In the slice fix \(h^0=d\theta^2+\sigma\), write \(C=\Gamma(h)-\Gamma(h^0)\), \(w=Nf^2J\), and use \(\nabla^0\) and \(d\mu=dV_{h^0}\). Integration by parts of the connection-difference scalar formula gives
\[
 \begin{aligned}
 \int Nf^2 R_h\,dV_h={}&\int\Big[w h^{ij}\big(\operatorname{Ric}^0_{ij}+C^k_{k\ell}C^\ell_{ij}-C^k_{j\ell}C^\ell_{ik}\big)\\
 &\hspace{17mm}-\nabla^0_k(w h^{ij})C^k_{ij}+\nabla^0_j(w h^{ij})C^k_{ik}\Big]\,d\mu,\\
 -2\int f^2\Delta_hN\,dV_h={}&4\int f\langle d_hf,d_hN\rangle_h\,dV_h.
 \end{aligned}
\]
Thus a local negative witness would require useful first derivatives of \(q_L\) from a validated map through its second derivatives. Direct differentiation of the metric would require marking derivatives through order three. The [product curvature identity](FIRST_JETS_FOR_BOTH_BAND_COSTS_20261127.md) eliminates this derivative for both Weyl densities on the actual convex bands. The residual estimate above validates positions only. Neither a residual for a specific numerical map nor these higher derivative errors are certified by the present bounds.

A separate distortion estimate would be needed for a useful explicit lower coefficient bound. In flat coordinates write \(\mathcal H,\mathcal L\) for the squared complex-linear and complex-antilinear stretches, with \(J_U=\mathcal H-\mathcal L>0\) the planar Jacobian, and put \(T=1-\mathcal L/\mathcal H\). On \(\mathcal L>0\), the local harmonic map identities give
\[
 \Delta\log(\mathcal L/\mathcal H)=-4J_U,\qquad
 \Delta T=4J_U(1-T)-\frac{|dT|^2}{1-T}\le4\mathcal H T .
\]
The last inequality extends across \(\mathcal L=0\) by smoothness. The area identity \(\int_F J_U\,dx\,dy=2\pi\) can seed a lower bound for \(T\) from its positive average, once \(\mathcal H\) is bounded on the whole reflected domain. To turn that argument into a metric enclosure would require explicit constants for the weak Harnack comparison and an absolute lower bound for \(\mathcal H\) in planar coordinates. The curvature and marking alone give the intrinsic bound \(\mathcal H/\sigma_0\ge1\), where \(\sigma_0|dz|^2\) is the normalized source metric. This follows at its minimum on the closed double from \(\Delta_{\sigma_0}\log(\mathcal H/\sigma_0)=2J_U/\sigma_0-2\). The planar source conformal factor and a Harnack-chain constant at useful scales were not evaluated. No lower distortion estimate of the precision needed for the fixed-width comparison is claimed. [Wolf, §2, equations (1)–(2), p. 453](https://pagine.dm.unipi.it/~a019210/Wolf_Teichmuller%20theory%20of%20harmonic%20maps.pdf#page=5)

## A lower directional enclosure on the central real seam

Let index \(i\) denote the target seam corresponding to the source gap \([-3/4,3/4]\) and let \(V=V_{ij}\) correspond to its right endpoint. The left-right symmetry of the marking sends the midpoint \(0\) to \(p_i\). Let \(e_\parallel\) be the spacelike unit tangent to the target seam at \(p_i\), pointing to \(V\). In the upper hexagon and its reflection across the central seam use \(\ell=\langle U,e_\parallel\rangle\). Reflection across the source imaginary axis changes the sign of \(\ell\); reflection across the central real gap preserves \(\ell\). In fact \(\ell>0\) on the part of the right half of this pair of hexagons corresponding to \(x>0\), since a point mapping to the symmetry axis would be fixed under the source reflection by injectivity. On the right hole cuff, \(\ell=(2\sqrt2)^{-1}\cosh u\), where \(u\) is target arclength from \(V\). The initial value is the vertex component \(\langle V,e_\parallel\rangle=1/(2\sqrt2)\) and the first derivative vanishes at the right-angled join. Thus the right cuff supplies a positive Dirichlet bound. The seam has length \(2\operatorname{arcosh}(3/(2\sqrt2))=\log 2\) because \(-\langle p_i,V\rangle=3/(2\sqrt2)\). In particular the endpoints give
\[
 \frac{2}{3}\int_{-3/4}^{3/4} (q_L)_{xx}(x,0)\,dx
 \ \ge\ \frac49(\log 2)^2
\]
by Cauchy–Schwarz along the actual harmonic marking. [Left-right isometry in the physical coordinates](FIXED_WIDTH_BAND_TEST_20261127.md#the-actual-exchange)

For a lower bound limited to the native pause footprint, use the source corridor
\[
 D=\{(x,y): |y|<1/6,\quad 0<x<X(y)\},\qquad
 X(y)=1-\sqrt{1/16-y^2},\qquad X_*=\max X=1-\sqrt5/12 .
\]
For each point in its closure, the open Euclidean disk of radius \(b_*=5/24\) is a valid evaluation chart for the harmonic map, using reflection across the right hole cuff if needed. Indeed its center has distance at least \(1/4\) from \(1\), so the chart stays at distance greater than \(1/24\) from that point. The right cuff inversion \(z\mapsto 1+1/(16\overline{z-1})\) sends the needed points into \(F\) at distance less than \(3/2\) from \(1\). The disk and these reflected points miss the left hole and the outer circle. The largest real coordinate met in the disk is at most \(3/4+b_*<1\), using \(X(y)+\sqrt{b_*^2-y^2}\le 3/4+b_*\). Inversion fixes the side of \(1\) on the real axis. Hence the only seam met is the central one. Cuff inversion and reflection across the real axis commute since the cuff has real center. The lifted map on each disk lies in the four target hexagons reflected across the two perpendicular sides at \(V\), both reflections fixing \(V\).

For a given vertex, the six values of \(-\langle V,V_{k\ell}\rangle\) are \(1,5/4,5,25/4,25/4,29/4\), by the vertex formula. The argument with the squared distance and the mean value of \(E\) therefore gives
\[
 E\le \frac{2\operatorname{arcosh}(29/4)^2}{(5/24)^2}< 336
\]
throughout the corridor. The rational bound follows from \(1+(27/10)^2/2!+(27/10)^4/4!+(27/10)^6/6!>29/4\).

Put \(\beta=[2\sqrt2\,\sinh(21X_*)]^{-1}\). The function \(v(x,y)=\beta\sinh(21x)\cos(3\pi y)\) is nonnegative on \(D\) and satisfies \((\Delta-E)v\ge0\) since \(21^2-9\pi^2>336\). It vanishes on \(x=0\) and on the two horizontal edges. At the right cuff \(v\le(2\sqrt2)^{-1}\le\ell\). Since \((\Delta-E)\ell=0\), the maximum principle proves \(v\le\ell\) on \(D\). On the central seam \(\ell=\sinh \xi\) in signed target arclength \(\xi\) from \(p_i\). Both functions vanish at \(x=0\). Therefore
\[
 (q_L)_{xx}(0,0)\ge (21\beta)^2,\qquad
 \frac{1}{2b}\int_{-b}^{b}(q_L)_{xx}(x,0)\,dx
 \ge \left[\frac{\operatorname{arcsinh}(\beta\sinh(21b))}{b}\right]^2
 \quad(0<b\le 9/128).
\]
The first bound follows from the derivative at the origin of the comparison function on the seam. The second follows from the enclosed image length and Cauchy–Schwarz. For each fixed \(s\) at a letter pause the native tube contains this interval with \(b=\delta(1+s)\), by taking \(v=0\) in the planar displacement \((u,v)\) on its sphere. The bound at the center is about \(3.2\times 10^{-13}\). This is one directional lower estimate and gives no usable conditioning for the scalar comparison.

## An angular average with a cuff-length lower bound

For every fixed \((s,p)\) on either band, the \(i\)-th marked planar trajectory \(c_i(t)+\delta r(u,v)\) restricted to one letter interval is a closed loop. The starting and ending points coincide at the displaced basepoint \(\delta r(u,v)\). The straight homotopy undoing the displacement stays within \(F\) by the band-footprint distance estimate. Thus this loop represents the labeled hole cuff or its inverse in free homotopy, and its length in \(q_L\) is at least \(L\), the corresponding closed geodesic length. The displacement is constant in \(\theta\) and the sphere has constant latitude \(\phi_i+\delta r w\). This yields
\[
 \frac{1}{2\pi}\int_0^{2\pi}(B_i)_{\theta\theta}\,d\theta
 \ \ge\ \frac{49L^2}{4\pi^2}+\sin^2(\phi_i+\delta r w).
\]
Indeed each of the seven intervals has angular length \(2\pi/7\), so Cauchy–Schwarz gives at least \(7L^2/(2\pi)\) for the integral of the squared planar angular velocity on each interval. This enclosure averages in the literal longitude parameter. Weighted quadratic-form terms still depend on the physical volume, lapse and shift, and on scalar and shear terms quadratic in derivatives. No sign conclusion follows from this angular average.
