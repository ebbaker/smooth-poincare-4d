# SP4-CME-E57 — Critical fixed linear estimate on a compact bundle

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Configured helper `gpt-6.2-sol` / `ultra`. Independently introspected runtime and lead settings are unavailable. This fixed linear construction follows [B38][b38]. All three input hashes in the [frozen request][req] matched. No new external primary input is used.

## Statement and localized spaces

Let \(M\) be a smooth closed real Riemannian four-manifold and \(E\) a finite-rank real bundle with fixed smooth metric and connection \(D\). Let

\[
 L=C^{ij}(x)D_iD_j+B^i(x)D_i+C^0(x)
\]

have fixed smooth coefficients and satisfy \(\operatorname{Re}\langle C^{ij}(x)\xi_i\xi_j v,v\rangle\ge c|\xi|^2|v|^2\) for real \(\xi\) and complexified fiber vectors. We keep the Riemannian volume and the fixed Hermitian pairing. If \(D\) is replaced by a metric connection for the auxiliary energy construction, only fixed first- and zeroth-order coefficients change. All constants may use finitely many fixed derivatives. Put \(s=1/2\), and write \(B^\sigma=B^\sigma_{8,1}(\mathbb T^4)\) with the volume-one torus blocks of E53. There is a finite atlas, as specified below, and a fixed \(T_0>0\) such that for \(0<T\le T_0\) and \(U_0\in\mathcal B^s,\ f\in L^1(0,T;\mathcal B^s)\) the strongly traced distributional solution in the localized class satisfies

\[
 E_T(U)\le C\bigl(\|U_0\|_{\mathcal B^s}+\|f\|_{L^1\mathcal B^s}\bigr),
 \qquad U_t=LU+f,\quad U(0)=U_0 . \tag{1}
\]

The class is complete and gives uniqueness and continuous dependence. The constants in (1) are uniform for \(T\le T_0\).

Start with finitely many precompact master charts and smooth orthonormal frames covering \(M\), with uniform coordinate and metric comparisons. Later restrict to small coordinate balls in these charts, translating their images into the interior of the fixed torus cube without rescaling the coordinate derivatives. Use a partition of unity \(\sum_a\eta_a=1\) with \(\operatorname{supp}\eta_a\) compact in the small chart and nested cutoffs \(0\le\rho_a,\chi_a\le1\), with \(\rho_a=1\) near \(\operatorname{supp}\eta_a\) and \(\chi_a=1\) near \(\operatorname{supp}\rho_a\), both compactly supported in that chart. For a section \(U\) let \(u_a\) be the coordinates of \(\eta_a U\) extended by zero in the torus. Each extension is of a compactly supported piece, defined distributionally by restriction of the torus test function to a chart and a cutoff equal to one near the support. Write \(\|U\|_{\mathcal B^\sigma}=\sum_a\|u_a\|_{B^\sigma}\). For time-continuous paths set

\[
 \begin{split}
 M_T(U)&=\sum_{a,j}2^{sj}\sup_{0\le t\le T}\|\Delta_j u_a(t)\|_8,\\
 H_T(U)&=\sum_{a,j}2^{(s+2)j}\int_0^T\|\Delta_j u_a(t)\|_8\,dt,\qquad
 E_T=M_T+H_T.
 \end{split} \tag{2}
\]

The solution class is \(C([0,T];\mathcal B^s)\) with finite (2). The first sum retains the time supremum at each block. Tonelli identifies the second sum with the sum of the Bochner \(L^1 B^{s+2}\) norms of the local pieces. The finite block sums give strongly measurable approximations in the higher norm at almost every time.

For explicit comparisons, a section is reconstructed by pushing \(\rho_a u_a\) into its chart and summing. Each product of this reconstruction with a compactly supported cutoff in another chart is an operator of the form \(Tv(x)=A(x)v(\Phi(x))\) on the overlap, extended by zero, with a smooth matrix multiplier \(A\) supported compactly inside the overlap. Frame transitions are included in \(A\), and \(\Phi\) is the fixed coordinate change. Since the chart cutoffs are compactly supported, \(T\) is bounded on \(L^8\) and \(W^{4,8}\), by bounded Jacobians and the ordinary chain rule. For an input block \(v_j\), derivative Bernstein gives \(\|Tv_j\|_{W^{4,8}}\le C2^{4j}\|v_j\|_8\). For output blocks \(k\ge1\), the bounded annular multiplier obtained by dividing the block symbol by the fourth-order symbol of \(({-\Delta})^2\) also gives \(\|\Delta_k z\|_8\le C2^{-4k}\|z\|_{W^{4,8}}\). Consequently

\[
 \|\Delta_k Tv_j\|_8\le C\min(1,2^{4(j-k)})\|v_j\|_8 \quad(k\ge1),
 \qquad \|\Delta_0 Tv_j\|_8\le C\|v_j\|_8 . \tag{3}
\]

Summing in \(k\) with weight \(2^{\sigma k}\), for \(0<\sigma<4\), bounds the contribution of \(v_j\) by \(C_\sigma2^{\sigma j}\|v_j\|_8\). The same argument takes a time supremum of each input block before the sum, so it proves the needed comparison for the first term of (2) as well as the Bochner norm in the second. It also applies to fixed chart multipliers and relates all the finite changes of cutoff and frame used here. Local coordinate derivatives can be transferred by this estimate and the chain rule. [E53, kernel and Bernstein estimates][e53].

To see completeness, let \(I\) send a section to its partition pieces, and \(R\) reconstruct from an arbitrary finite array of pieces using \(\rho_a\). Then \(RI=\mathrm{id}\), and \(IR\) is a bounded projection on the product of local spaces by (3). Its range is the image of the claimed global space. This works for the trace space and the path space: the local path spaces are complete by uniform convergence in \(B^s\) from the first term of (2) and Fatou in the two weighted block sums. Their first sum has uniformly small tails, so blockwise continuity implies strong \(B^s\) continuity. The same conclusions hold for the range of \(IR\). For the data, approximate each piece by a trigonometric polynomial in \(B^s\) and reconstruct with \(R\). This proves density of smooth sections. Smooth time-dependent sections are dense in \(L^1_t\mathcal B^s\) by this spatial density and Bochner time approximation, and can be chosen smooth up to the endpoints. Finally \(\mathcal B^s\hookrightarrow C^0\) by the summable Bernstein estimate on each piece and reconstruction. [E53, local completeness and trace][e53].

## Frozen constant matrix problem

In chart coordinates and an orthonormal fiber frame, define \(C_a^{ij}\) as the local leading coefficient and freeze it at the chart center \(x_a\). On the unit torus the semigroup of \(L_a^{\mathrm{fr}}=C_a^{ij}(x_a)\partial_i\partial_j\) has symbol \(e^{-tP_a(k)}\) with \(P_a(\zeta)=4\pi^2 C_a^{ij}(x_a)\zeta_i\zeta_j\). The uniform Hermitian lower bound gives \(\|e^{-tP_a(\zeta)}\|\le e^{-c_1t|\zeta|^2}\) by differentiating the squared norm of its action on a vector. For a first real symbol derivative,

\[
 \partial_\ell e^{-\tau P}=-\int_0^\tau e^{-(\tau-r)P}(\partial_\ell P)e^{-rP}\,dr .
\]

This follows from the ODE for the exponential, including for noncommuting matrices. Iteration gives integrals of products of exponentials with derivatives of \(P\) inserted, over simplices of total time \(\tau\). On a fixed annulus the coefficient derivatives are bounded, and the product of the exponential bounds is \(e^{-c_2\tau}\). Each simplex contributes a power of \(\tau\). Thus any fixed finite number of derivatives of the cutoff symbol \(\psi(\zeta)e^{-\tau P_a(\zeta)}\) is bounded by \(C(1+\tau)^N e^{-c_2\tau}\), which is at most \(C'e^{-c_3\tau}\) with a smaller positive rate. With \(\tau=2^{2j}t\), E53's periodization gives the operator bound \(Ce^{-c_3 2^{2j}t}\) on the \(j\)-th block, \(j\ge1\). The low block has finitely many modes, including the constant. Each frozen matrix mode is bounded on \(0\le t\le1\). Summing these coefficients gives a uniform \(L^8\) bound for the block. Time integration of the low block costs at most \(T\le1\). For the high blocks the time integral of the kernel costs at most \(C2^{-2j}\), also for the causal forcing term by Tonelli. Taking blockwise time suprema and summing therefore gives the constant-coefficient form of (1), with a constant \(A_\mathrm{fr}\) uniform in the chart centers. This constant only needs the common frozen symbol bounds and the fixed torus blocks. It is independent of the partition and cutoff derivatives. [E53, periodized kernels and Duhamel summation][e53].

## Localization and absorption

In the chart, write \(L=C_a^{ij}(x)\partial_{ij}+b_a^i\partial_i+c_a^0\). The fixed connection and base coordinate terms appear only in \(b_a,c_a^0\). Choose the small charts so that \(\sup|C_a-C_a(x_a)|\le\delta\) on the entire support of \(\chi_a\). Uniform continuity in the finite master charts permits any single small \(\delta>0\), with the same frozen constants. In torus coordinates \(u_a\) satisfies

\[
 (\partial_t-L_a^{\mathrm{fr}})u_a=f_a+e_a^{ij}\partial_{ij}u_a
               +\widetilde b_a^i\partial_i u_a+\widetilde c_a^0u_a
               -([L,\eta_a]U)_{a,\mathrm{ext}}, \tag{4}
\]

where \(f_a=(\eta_a f)_{a,\mathrm{ext}}\), \(e_a^{ij}=\chi_a(C_a^{ij}-C_a^{ij}(x_a))\) extended by zero, and the tilded coefficients are the same compactly supported extensions using \(\chi_a\). The subscript denotes zero extension after expressing the supported section in the chart frame. The commutator is first order and has compactly supported coefficients. In particular the second-order part supplies \(C_a^{ij}((\partial_i\eta_a)\partial_j+(\partial_j\eta_a)\partial_i+(\partial_{ij}\eta_a))\), with both first-order terms retained. Derivatives stay supported inside the cutoff neighborhood. Thus (4) is an actual torus equation for each localized piece and has no boundary term.

For a smooth periodic matrix \(e\), E54's difference characterization yields at \(0<s<1\)

\[
 \|ev\|_{B^s}\le C_s\bigl(\|e\|_\infty\|v\|_{B^s}
                           +\operatorname{Lip}(e)\|v\|_8\bigr). \tag{5}
\]

Indeed \(\delta_h(ev)=(\tau_he)\delta_hv+(\delta_he)v\), and \(\int_{|h|\le1}|h|\,|h|^{-4-s}dh\) is finite. For \(v=\partial_{ij}u_a\), the first term of (5) uses \(\|u_a\|_{B^{s+2}}\) and the second uses \(\|u_a\|_{B^2}\), both by the derivative kernel estimate. The constant in the first term uses only the fixed torus difference norm, derivatives and finite spatial index count, independent of the number and size of the charts. Hence the only principal small contribution in the sum of the frozen estimates is \(A_\mathrm{fr}C_s'\delta H_T(U)\), from the same local piece on both sides of (4). Choose \(\delta\) so this coefficient is at most \(1/4\), prior to fixing the finite cover and cutoffs. The remaining cutoff and fixed lower terms, by reconstruction and (3), are controlled by a fixed multiple of \(\sum_a\int_0^T(\|u_a\|_{B^{s+1}}+\|u_a\|_{B^s})dt\). For example, differentiate the reconstruction \(\sum_b \rho_b u_b\) in the overlap, giving terms of order one or zero in \(u_b\), and then apply (3) at order \(s\). These comparison constants and the Lipschitz norms of \(e_a\) may depend on the finished cover. They multiply only lower norms. [E54, difference characterization and derivative bounds][e54].

For \(s\le\sigma<s+2\) put \(\theta=(\sigma-s)/2\). Hölder in the block sum gives \(\|u_a\|_{B^\sigma}\le \|u_a\|_{B^s}^{1-\theta}\|u_a\|_{B^{s+2}}^\theta\). Apply Hölder in time and in the finite chart sum to obtain

\[
 \sum_a \int_0^T\|u_a\|_{B^\sigma}\,dt
 \le T^{1-\theta}M_T^{1-\theta}H_T^\theta
 \le T^{1-\theta}E_T . \tag{6}
\]

Here the last inequality is weighted Young. At \(\sigma=2,s+1,s\), the factors are \(T^{1/4},T^{1/2},T\), respectively. Summing (4) using its frozen bounds therefore gives

\[
 E_T\le A_\mathrm{fr}\bigl(\|U_0\|_{\mathcal B^s}+\|f\|_{L^1\mathcal B^s}\bigr)
          +\tfrac14 H_T+C_\mathrm{loc}T^{1/4}E_T
 \quad(T\le1).
\]

Choose \(T_0\le1\) with \(C_\mathrm{loc}T_0^{1/4}\le1/4\). This proves (1) for smooth global solutions. The highest-order term was absorbed before any estimate that requires overlap comparison constants.

## Global construction and distributional uniqueness

For smooth data, construct solutions globally on the bundle by fixed elliptic Galerkin projection. The underlying form estimate is

\[
 \operatorname{Re}(Lw,w)_2\le -c_0\|\nabla w\|_2^2+C_0\|w\|_2^2 . \tag{7}
\]

Here \(\nabla\) is any fixed metric connection, and the density is fixed. To prove (7), integrate by parts using the equivalent divergence form \(L=\operatorname{div}_\nabla(C\nabla)+B_{\rm new}^i\nabla_i+C^0_{\rm new}\). Passing from the covariant Hessian to divergence differentiates \(C\) once, and replacing \(D\) by \(\nabla\) contributes only smooth terms of order at most one. These are bounded in the pairing by \(C\|w\|_2\|\nabla w\|_2+C\|w\|_2^2\). For the divergence quadratic form freeze the array and density in small charts and apply Plancherel using the frozen rank-one inequality. Absorb the small variations in the gradient term, and sum using a smooth squared partition of unity, with bounded lower-order cutoff errors. This is the fixed divergence-form Gårding argument of E41 with additional fixed lower terms. The Besov estimate here uses the frozen constant multipliers above, independently of E41's heat-kernel function spaces. [E41, Gårding construction][e41].

Let \(\Lambda=(I+\nabla^*\nabla)^{1/2}\) and \(Q_N\) be its finite orthogonal spectral projections. The positive elliptic inverse follows by the coercive \(H^1\) form and is compact on \(L^2\) by compact embedding. Its eigenvectors are smooth and its integer graph norms agree with geometric Sobolev norms. For these standard elliptic facts one can freeze the smooth coefficients in charts, use the second-order Fourier estimate, and absorb the lower derivatives by interpolation. The weak \(H^2\) starting estimate follows by local difference quotients in the form. Higher estimates follow by commuting chart derivatives, and odd graph orders follow using the \(H^1\) form norm. Thus \(Q_N\) is uniformly bounded on each geometric Sobolev space. For even \(k\), \(\Lambda^k\) is differential with scalar top symbol. The Galerkin equation is

\[
 \partial_t U_N=Q_N(LU_N+f),\qquad U_N(0)=Q_NU_0 .
\]

Testing with \(\Lambda^{2k}U_N\) removes the projection. Apply (7) to \(\Lambda^k U_N\). Since the differential top symbol of \(\Lambda^k\) is scalar, \([\Lambda^k,L]\) has order at most \(k+1\), with fixed smooth coefficients. Its \(L^2\) norm is bounded by \(C_k\|U_N\|_{H^{k+1}}\), which in the energy pairing is absorbed up to \(C_k\|U_N\|_{H^k}^2\). In particular

\[
 \frac{d}{dt}\|\Lambda^kU_N\|_2^2+c_k\|U_N\|_{H^{k+1}}^2
 \le C_k\bigl(\|U_N\|_{H^k}^2+\|f\|_{H^k}^2\bigr).
\]

Thus \(\sup_t\|U_N\|_{H^k}\) is bounded uniformly in \(N\) on the fixed interval for every even \(k\), with constants using the smooth data norms. The equation bounds the time derivatives in \(H^{k-2}\). Compact Sobolev embedding and interpolation give convergence along a diagonal subsequence in \(C_tH^{k-1}\) at each such \(k\). The projection tends strongly to identity, so the limit solves the global equation with its smooth initial trace. Taking all \(k\) and using the time equation gives smoothness up to the endpoints for smooth forcing and initial data. This global smooth solution has finite \(E_T\) by the \(2^{-4j}\) high-block bound on each piece.

Approximate arbitrary \(U_0,f\) strongly in the data norms by the smooth data above. The difference of their solutions obeys (1), so the approximating sequence is Cauchy in the complete path class. Its limit has the strong \(\mathcal B^s\) trace and the uniform spatial trace. The equation passes in distributions from uniform \(L^8\) convergence and \(L^1\) convergence of the force, by testing against the fixed smooth formal adjoint of \(L\). This gives a solution and the estimate for all stated data.

For uniqueness take the difference \(W\) of two solutions with equal datum and source. Interpolation at \(\sigma=s+1\) gives \(\sum_a\|w_a\|_{L^2 B^{s+1}}\le M_T(W)^{1/2}H_T(W)^{1/2}\). Derivative Bernstein and reconstruction therefore give \(W\in L^2 H^1\) on the compact manifold. Since \(W_t=LW\), the divergence rewrite gives \(W_t\in L^2H^{-1}\), and the strong trace is also strong in \(L^2\). Time smoothing in the weak equation justifies the energy identity \(\tfrac12\partial_t\|W\|_2^2=\operatorname{Re}(LW,W)\) in duality. Equation (7) and Grönwall give \(W=0\). This proves (1) as a bounded solution map in the specified trace and uniqueness class. The endpoint Bernstein bound also gives \(\int_0^T\|\nabla^2U\|_\infty\,dt\le C H_T(U)\) by summing on the local pieces, with reconstruction contributing only fixed coefficients and lower derivatives. The argument uses a finite short-time interval and the fixed linear operator.

[req]: ../research-progress/handoffs/SP4-CME-E57_REQUEST_v1.md
[b38]: ../brainstorm/notes/B38_COMPACT_CRITICAL_TRANSFER_20261122.md
[e53]: 53_CRITICAL_FINITE_P_HEAT_20261122.md
[e54]: 54_CRITICAL_QUASILINEAR_MODEL_20261122.md
[e41]: 41_COMPACT_LINEAR_ESTIMATES_20261122.md
