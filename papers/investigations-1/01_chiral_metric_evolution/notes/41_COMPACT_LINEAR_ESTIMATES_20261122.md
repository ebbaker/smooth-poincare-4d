# SP4-CME-E41 — Fixed-reference compact-bundle linear estimates

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Configured helper `gpt-6.2-sol` / `ultra`. Independently introspected runtime and lead settings are unavailable. This is a fixed linear estimate. The [request][request] records the four frozen inputs, whose hashes were verified.

## Statement and source conventions

Let \(M\) be a smooth compact closed real four-manifold. Fix a metric, a smooth positive density \(d\nu\), a finite-rank bundle with a smooth fiber metric, and a smooth metric connection \(D\). Write \(L u=\operatorname{div}_D(P_0 Du)\), where divergence is minus the formal adjoint of \(D\) for these choices. Assume smooth \(P_0\) and the fixed-pairing Legendre–Hadamard inequality

\[
 \operatorname{Re}\langle P_0(x,\xi)v,v\rangle\ge c|\xi|^2|v|^2,
 \qquad P_0(x,\xi)=P_0^{ij}(x)\xi_i\xi_j,
\]

for all real \(\xi\) and complexified fiber vectors \(v\). No symmetry or full gradient-array positivity is required. The same inequality for real vectors suffices for real coefficients by complexification. Fix \(p>6\), \(q=p/2\), and use the request's norms. In particular set \(Q_r^+(x)=(r^2/2,r^2)\times B_r(x)\) and \(Q_r(x)=(0,r^2)\times B_r(x)\). The upper-cylinder terms on \(Du,f,G\) have weights \(r^{1-6/p},r^{2-6/q},r^{1-6/p}\), respectively, multiplying their unnormalized \(L^p,L^q,L^p\) norms. The tent terms are \(r^{-2}\|Du\|_{L^2(Q_r)}\), \(r^{-4}\|f\|_{L^1(Q_r)}\), and \(r^{-2}\|G\|_{L^2(Q_r)}\).

For some \(T_0>0\), all \(0<T\le T_0\), and a constant \(C\) independent of \(T\), one has

\[
 \|e^{tL}u_0\|_{X_T}\le C\|u_0\|_\infty,
 \qquad
 \left\|\int_0^t e^{(t-s)L}(f+\operatorname{div}_D G)(s)\,ds\right\|_{X_T}
 \le C\bigl(\|f\|_{Y_T^0}+\|G\|_{Y_T^1}\bigr).
 \tag{1}
\]

The homogeneous solution has a strong uniform initial trace for continuous \(u_0\). Finite-norm forcing has a well-defined solution with distributional zero trace. The forcing solution has zero uniform trace for smooth forces and for their completion in the indicated norms. The maps depend continuously on the data in these norms. Constants and the time cutoff may use finitely many derivatives of the fixed coefficients, atlas, density and connection.

The organizing argument is Koch–Lamm's split into pointwise, energy and local parabolic Calderón–Zygmund bounds, with the systems proviso on Gaussian and Calderón–Zygmund estimates. Rechecked their *Parabolic equations with rough data*, arXiv:1310.3658v1 (14 October 2013), on 22 November 2026, America/New_York, particularly §2, pp. 4–5, with §§3 and 4.1–4.2 previously checked in E37. The text extraction of p. 5 displays the upper \(Y^0\) term with an outer \(r\) and an inner \(r^{-(d+2)/2}\) inside the \(1/q\) power. Equation (1) uses the dimensionally scaled norms specified above. The proof below supplies the bundle and linear estimates. The source is already recorded at root as R20. No new source or local PDF copy was used. [Koch–Lamm v1, §2][kl]. [Canonical record][r20]. [E37][e37].

## Gårding inequality on the fixed bundle

There are \(c_1>0\) and \(C_1<\infty\) such that

\[
 \operatorname{Re}\int_M\langle P_0 Dv,Dv\rangle,d\nu
 \ge c_1\|Dv\|_2^2-C_1\|v\|_2^2. \tag{2}
\]

On a sufficiently small coordinate ball with a smooth orthonormal fiber frame, freeze the smooth arrays \(P_0^{ij}\) and the coordinate density. For a compactly supported section in this frame, Plancherel gives the lower bound for the frozen array from the symbol inequality. Shrink the ball so the quadratic form error from the coefficient and density variations is at most half this bound. The connection terms replacing \(\partial v\) by \(Dv\) are bounded by a small multiple of \(\|Dv\|_2^2\) plus a fixed multiple of \(\|v\|_2^2\). Sum using a finite partition with \(\sum_\ell\chi_\ell^2=1\). The first-order cutoff cross terms sum to zero since \(\sum_\ell\chi_\ell D\chi_\ell=0\), and the remaining cutoff terms are zeroth order. This proves (2) even for nonsymmetric arrays.

## Global Cauchy kernel

In an orthonormal bundle frame write \(L=P_0^{ij}\partial_{ij}+b^j\partial_j+b_0\). Let \(k_y(t,z)\) be the whole-space kernel of the frozen principal array at \(y\). Its Fourier multiplier is \(e^{-tP_0(y,\xi)}\). On the fixed charts accretivity gives \(\|e^{-tP_0(y,\xi)}\|\le e^{-ct|\xi|^2}\) with a uniform chart constant. For the complex Fourier shift \(\xi+i\eta\) the real part of the symbol is bounded below by \(c'|\xi|^2-C|\eta|^2\), by expanding the quadratic polynomial and absorbing the mixed term. Thus the matrix exponential on the shifted contour has norm at most \(e^{-c't|\xi|^2+Ct|\eta|^2}\), by the norm-square differential inequality. Shift by \(\eta\) proportional to \(z/t\) with a sufficiently small positive factor. The exponential from the Fourier phase gives Gaussian decay. The shifted Fourier integrand is entire, and the Gaussian bound on intermediate contours justifies the shift by truncation. Polynomial factors in \(\xi+i\eta\) give, for any fixed multi-index and integer \(j\ge0\),

\[
 |\partial_z^\alpha\partial_t^j k_y(t,z)|
 \le C_{\alpha,j}t^{-2-|\alpha|/2-j}e^{-c_2|z|^2/t}. \tag{3}
\]

This proof covers nonsymmetric matrices and gives uniform bounds for arrays from the fixed charts.

Use a finite chart partition \(\phi_\ell(y)\) and smooth cutoffs \(\chi_\ell(x)\) equal to one on neighborhoods of the corresponding partition supports. On each chart take convex coordinate balls with compactly contained supports and bounded coordinate and volume comparisons. Define a global approximate kernel \(K_0(t,x,y)\) by summing the chart terms

\[
 \chi_\ell(x)\phi_\ell(y)\rho_\ell(y)^{-1}
 k_{\ell,y}(t,x_\ell-y_\ell),
\]

interpreted as maps between the two fibers by their chart frames and extended by zero outside the chart. Here \(\rho_\ell\) is the coordinate density, so the integral uses \(d\nu(y)\). The sum is a globally defined kernel. Continuity of the finite-dimensional coefficient-to-multiplier map and (3) give the approximate identity uniformly on continuous sections. In detail use \(y_\ell=x_\ell-\sqrt t\,z\) near each support, replace the frozen matrix and the section in the integrand by their values at \(x\), and use the Gaussian bound for the uniformly small tails in \(z\). The resulting frozen kernel integrates to the identity and the partition sums to one. The initial identity also holds strongly in \(L^2\) by this uniform trace on smooth data, the Schur bound on \(K_0\), and density.

Write \(N_b(t,x,y)=t^{-2}e^{-b d(x,y)^2/t}\), with \(d\) the fixed metric distance. From (3) and the compact charts, \(|D_x^kK_0|\le C t^{-k/2}N_b\) for \(k=0,1\), and the residual \(R=(\partial_t-L_x)K_0\) for \(t>0\) satisfies \(|R|\le Ct^{-1/2}N_b\). The leading residual comes from \(P_0(x)-P_0(y)=O(|x_\ell-y_\ell|)\) multiplying two spatial derivatives of the frozen kernel. Smooth chart, frame and cutoff terms have at most one derivative of that kernel. Extend causally in time so \((\partial_t-L_x)K_0=\delta+R\), with \(\delta\) the space-time identity kernel.

Write \(*\) for causal time and space convolution of kernels. Define

\[
 K=K_0+\sum_{m=1}^\infty(-1)^m K_0*R^{*m}. \tag{4}
\]

To control the series with a common Gaussian exponent, for any chain of \(m+1\) links with times \(\tau_i>0\) summing to \(t\), use \(\sum_i d_i^2/\tau_i\ge d(x,y)^2/t\). Extract half of the exponential by this inequality. In the remaining product, bound the factor with largest \(\tau_i\) by \((m+1)^2 t^{-2}\) with its exponential dropped. The other spatial integrals can be performed from that link towards both ends, giving a factor bounded by \(C^m\), since \(\int_M N_{b/2}(s,x,y)d\nu(y)\le C\) uniformly for small \(s\). This last bound follows from volume comparison on the fixed charts and Gaussian decay. For \(D_x^k\) on the series, \(k=0,1\), the remaining time weight is \(\tau_0^{-k/2}\prod_{i=1}^m\tau_i^{-1/2}\). The simplex integral is

\[
 t^{m/2-k/2}
 \frac{\Gamma(1-k/2)\Gamma(1/2)^m}{\Gamma(1-k/2+m/2)}.
\]

These bounds give absolute convergence, differentiation once in \(x\), and \(\|K(t)-K_0(t)\|_{L^\infty\to L^\infty}=O(\sqrt t)\) as well as the analogous \(L^2\) bound by Schur. The convolution identity gives \((\partial_t-L_x)K=\delta\) distributionally by cancellation of the residual series. Hence \(K\) gives a global Cauchy solution with the asserted initial trace, also in \(L^2\) for bounded measurable initial values. On every compact positive time interval its sections satisfy the weak parabolic energy identity, since the first derivative bound gives \(L^2_tH^1_x\) and the equation gives the time derivative in \(L^2_tH^{-1}_x\). This identity follows by smoothing the weak equation in time before testing. From (2) and Grönwall, solutions of the homogeneous equation in this class with strong \(L^2\) trace are unique, by applying the identity from positive times tending to zero. In particular \(K(t)K(s)=K(t+s)\) whenever the sum is in the construction interval.

The adjoint is of the same divergence form with coefficient array \(P_0^{ji*}\), and satisfies the same rank-one bound. Its kernel constructed by (4) equals \(K(t,y,x)^*\). Indeed pair the two Cauchy solutions at times \(s\) and \(t-s\), differentiate using the weak equations on the interior interval, and take the respective strong traces at the ends. Applying the first-variable estimate for the adjoint yields the source derivative estimate. In particular

\[
 |K(t,x,y)|\le C N_b(t,x,y),\qquad
 |D_xK(t,x,y)|+|D_yK(t,x,y)|\le Ct^{-1/2}N_b(t,x,y) . \tag{5}
\]

All constants may be reduced to a common positive time interval and Gaussian exponent. The kernel globally performs the evolution across charts and bundle transitions.

## Uniform and tent bounds

The homogeneous sup estimate follows by integration in (5). For smooth \(f,G\), the inhomogeneous solution uses \(K\) against \(f\) and \(-D_yK\) contracted against \(G\), by integration by parts in the fixed density. Fix \((t,x)\), let \(r=\sqrt t\), and cover successive annuli of width \(r\) about \(x\) by radius \(r\) balls, with at most polynomial growth in the annulus index \(a\). Fixed compact volume comparisons give such a cover by packing disjoint smaller balls. The Gaussian yields a summable factor \(e^{-c'a^2}\), with a uniform constant for the inner annuli.

For \(s<t/2\), the kernel bounds are \(Cr^{-4}\) and \(Cr^{-5}\) times that Gaussian factor. Each covering ball has \(L^1\) mass of \(f\) at most \(r^4\|f\|_{Y_T^0}\) on the full tent. Cauchy–Schwarz gives \(L^1\) mass of \(G\) at most \(Cr^5\|G\|_{Y_T^1}\). For \(s>t/2\), the remaining Gaussian on the spacetime slab gives a kernel \(L^{q'}\) norm at most \(Cr^{6/q'-4}\), finite because \(4q'<6\), and a differentiated kernel \(L^{p'}\) norm at most \(Cr^{6/p'-5}\), finite because \(5p'<6\). Here prime denotes the Hölder conjugate. Pair with the upper-cylinder bounds \(r^{6/q-2}\|f\|_{Y_T^0}\) and \(r^{6/p-1}\|G\|_{Y_T^1}\). The powers cancel and the sum over annuli is bounded. Thus

\[
 U:=\sup_{[0,T]\times M}|u|\le C(\|u_0\|_\infty+\|f\|_{Y_T^0}+\|G\|_{Y_T^1}). \tag{6}
\]

For the tent bound, test the equation with \(\eta^2u\) for \(\eta=1\) on \(B_r\), supported in \(B_{2r}\) with \(|d\eta|\le C/r\). Apply (2) to \(\eta u\) and absorb the cutoff cross terms and the gradient term from divergence forcing into \(c_1\|D(\eta u)\|_2^2\). The integrated remainder is bounded by the initial localized squared \(L^2\) norm and a constant times

\[
 (1+r^{-2})r^2 |B_{2r}|U^2
 +U\int_0^{r^2}\!\int_{B_{2r}}|f|
 +\int_0^{r^2}\!\int_{B_{2r}}|G|^2 .
\]

The initial term is at most \(Cr^4\|u_0\|_\infty^2\). One can first test from a positive time and pass to zero using the strong \(L^2\) trace. Cover \(B_{2r}\) with a bounded number of radius \(r\) balls for the forcing tents. Divide by \(r^4\), take square roots, and use (6). This proves the \(L^2\) tent part of (1) from rank-one positivity via (2).

## Parabolic Calderón–Zygmund estimate and upper cylinders

For a frozen constant array \(P_*\), let \(H_*=\partial_t-P_*^{ij}\partial_{ij}\). The operator \(\partial_kH_*^{-1}\partial_i\) has bounded spacetime Fourier multiplier \(-\xi_k\xi_i(i\tau+P_*(\xi))^{-1}\), since \(\|(i\tau+P_*(\xi))^{-1}\|\le(c|\xi|^2)^{-1}\) by accretivity for \(\xi\ne0\). Its off-diagonal kernel is \(\partial_k\partial_i k_*(t,x)\) extended by zero to negative time. With \(\varrho(t,x)=\sqrt{|t|}+|x|\), (3) bounds the kernel and its first spatial and first time derivatives by \(C\varrho^{-6}\), \(C\varrho^{-7}\), and \(C\varrho^{-8}\). The Gaussian allows zero extension smoothly at \(t=0\) away from \(x=0\). For \(\varrho(z)>C\varrho(h)\) the difference is bounded by \(C\varrho(h)\varrho(z)^{-7}\), using these space and time estimates along a segment. Its integral over that region is bounded uniformly in \(h\).

For clarity, the resulting \(L^p\) estimate follows by decomposing at height \(\lambda\) on dyadic rectangles with time side \(2^{-2j}\) and spatial sides \(2^{-j}\). The good part is bounded by \(C\lambda\), with squared \(L^2\) norm at most \(C\lambda\|F\|_1\), so the multiplier bound controls its exceptional set. Each bad part has zero mean. Outside a fixed enlargement of its rectangle, the integral kernel difference from the kernel at the rectangle center controls the \(L^1\) norm of its image by \(C\) times its \(L^1\) norm. The enlarged rectangles have total measure \(\le C\|F\|_1/\lambda\). This proves weak \((1,1)\); interpolation with \(L^2\) and duality for the adjoint prove boundedness on \(L^p\). These arguments apply componentwise to the finite matrix kernel with constants uniform for the arrays in (3). The nondivergence forcing uses \(\partial_k k_*\) restricted to \(0<t<1\), which is in spacetime \(L^{p/(p-1)}\) by (3) and \(p>6\). Young's inequality maps \(L^q\) into \(L^p\) on a unit time slab. Together, the unit-slab estimates give

\[
 \|\partial v\|_{L^p}\le C(\|g\|_{L^q}+\|J\|_{L^p}),\qquad H_*v=g+\partial_iJ^i,
 \tag{7}
\]

for zero initial data and sources supported in the slab, with the gradient norm restricted to the slab. The bounded singular integral is applied causally, so cutting off sources after the top time does not affect (7).

To use (7), choose a uniform local chart at the center of \(B_r(x)\) with a cutoff supported in \(B_{Cr}(x)\) in chart scale, and rescale \(x\) by \(r\) and time by \(r^2\). Work on \(0<\tau<1\); set \(v=\eta u\) with \(\eta=1\) on the upper cylinder and zero for \(\tau\le1/4\). Use (P_*=P_0(x)\) in that chart. The scaled forcing is \(f_*=r^2 f\), \(G_*=rG\) with equivalent chart norms. In coordinates the scaled equation has leading divergence \(\partial_i(P_r^{ij}\partial_j u)\), first-order coefficients smoothly bounded by \(Cr\), and zeroth-order coefficients bounded by \(Cr^2\). Connection and density terms in \(\operatorname{div}_D G\) add a scaled zeroth-order term bounded by \(Cr|G_*|\). These are fixed metric, density, and frame contributions. The difference \(P_r-P_*\) is bounded by \(Cr\) on the support. In the cutoff equation it contributes \(\partial_i((P_r-P_*)^{ij}\partial_j v)\). Cutoff commutators consist of bounded zeroth-order terms in \(u\) and divergence terms whose arrays are bounded by \(C|u|\). Explicitly, the only cutoff-gradient term containing \(\partial_j u\) is of the form \((\partial_i\eta)P_r^{ij}\partial_j u\). Rewrite it as \(\partial_j((\partial_i\eta)P_r^{ij}u)-\partial_j((\partial_i\eta)P_r^{ij})u\). The fixed first-order terms admit the same rewriting. The cutoff multiplying \(\partial_iG_*^i\) gives both a divergence term in \(G_*\) and a term bounded by \(C|G_*|\), the latter in \(L^q\) by finite cylinder volume.

By (7), for \(r\le\sqrt{T_0}\) sufficiently small the term \(Cr\|\partial v\|_{L^p}\) is absorbed. Apply the argument up to times increasing to the top of the slab when needed, using causality and then monotone convergence. The other terms give

\[
 \|\partial v\|_{L^p}\le C\bigl(U+\|f_*\|_{L^q(\mathcal Q)}+\|G_*\|_{L^p(\mathcal Q)}\bigr),
\]

where \(\mathcal Q\) is the support cylinder at times \([1/4,1]\). This computation applies to smooth sections at positive times. For the kernel solutions with smooth forcing on positive time intervals, that regularity follows directly by taking spatial difference quotients in smaller charts with initial time cutoff. The difference quotient satisfies the same leading divergence equation with extra forcing in divergence form from the difference quotient of the smooth coefficient times the known gradient. Testing with the cutoff times the difference quotient and (2) bounds its gradient in \(L^2\) uniformly in the increment. Iteration on nested cylinders gives each spatial derivative in local \(L^2\), and the equation gives the time derivatives inductively. Sobolev embedding on positive-time subcylinders then gives smoothness. The first (H^1) bound needed here comes from (5), using the undifferentiated smooth source (f+\operatorname{div}_D G) in the kernel integral. The same induction applies to the homogeneous solution for bounded data.

Undo the scaling, with the covariant derivative differing from the chart derivative by a bounded lower-order expression. On the enlarged support cylinder use radius \(r\) balls for the time range \([r^2/2,r^2]\) and radius \(r/\sqrt2\) balls for \([r^2/4,r^2/2]\). Each spatial cover has bounded multiplicity and bounded size. Both time ranges match the upper-cylinder intervals in the packet norms. This proves \(r^{1-6/p}\|Du\|_{L^p(Q_r^+(x))}\le C(U+\|f\|_{Y_T^0}+\|G\|_{Y_T^1})\), uniformly in the center and radius. With (6) and the tent estimate this proves (1).

## Finite-norm forcing and traces

For smooth forcings the kernel integral is a distributional solution and tends uniformly to zero by the homogeneous sup bound applied to the bounded smooth source \(f+\operatorname{div}_D G\). The uniform \(X_T\) estimate extends it to the completion of smooth source pairs in \(Y_T^0\oplus Y_T^1\). Completeness in \(X_T\) follows by combining the uniform limit with the local \(L^2\) and \(L^p\) gradient limits on the defining cylinders, which coincide with its distributional gradient. Forcing limits exist in distributions by the tent norms, so the equation also passes to the limit. The zero uniform trace passes by convergence in the sup component.

For any finite-norm \(f,G\), the tent bounds and a finite radius \(\sqrt T\) cover give global spacetime \(L^1\) and \(L^2\), respectively. Truncating them to \(s\ge\delta>0\) gives global \(L^q,L^p\) by the upper-cylinder estimates using a finite collection of radii and centers for \([\delta,T]\). Smooth approximation of these truncated pairs in spacetime \(L^q\oplus L^p\), supported in \(s\ge\delta/2\), converges also in the \(Y\) norms. Radii below \(\sqrt{\delta/2}\) see zero forcing and the weights on the remaining radii are bounded. Thus the kernel estimate for the truncated pair is bounded by that pair's \(Y\) norm, in turn bounded by the original norm. The integrals against \(K\) and \(D_yK\) converge as \(\delta\downarrow0\) by the bounds proving (6), uniformly on every time interval bounded away from zero by the global \(L^1\) integrability and (5). On each defining cylinder weak compactness and lower semicontinuity yield the same gradient bounds for the limit, whose gradient is identified by the distributional limit. This proves (1) for arbitrary finite-norm forcing and gives the equation by distributional convergence.

For a smooth spatial test section \(\psi\), the adjoint formula \(e^{tL^*}\psi=\psi+\int_0^t e^{sL^*}L^*\psi\,ds\) follows from the equation and Cauchy uniqueness. Estimate (5) gives a uniform \(C^1\) bound for this expression at small time, since \(s^{-1/2}\) is integrable. Pairing the rough Duhamel solution with \(\psi\) therefore tends to zero as \(t\downarrow0\) by the global \(L^1\) forcing bounds. This is a distributional trace. The homogeneous result applies to bounded measurable \(u_0\) with strong \(L^2\) trace, and continuous \(u_0\) with strong uniform trace. Linearity and (1) give continuous dependence.

[request]: ../research-progress/handoffs/SP4-CME-E41_REQUEST_v1.md
[kl]: https://arxiv.org/pdf/1310.3658v1#page=4
[r20]: ../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md#rough-data-source--inspected-preprint-and-publication-metadata
[e37]: 37_ROUGH_DATA_SOURCE_TEST_20261122.md
