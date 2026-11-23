# SP4-CME-E70 — Independent audit of fixed-slice strain control

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Configured helper `gpt-6.2-sol` / `ultra`. Independently introspected runtime and lead settings are unavailable. All four hashes in the [frozen request][req] matched. This assistant authored E47. This is a separate audit of E66 and its use of the assessed E47 realization, with no claim of independent verification of E47. No new primary source was inspected or imported.

**Verdict.** The full E66 static estimate passes for the supplied smooth connection satisfying the exact two fixed slice equations and small reference values of both connection and curvature differences. The proof gives the \(W^{2,(4,1)}\) and localized critical pair norms from the live Lorentz strain. No higher derivative enters the threshold. [E66][e66].

## Fixed matrix operator and strong endpoints

With \(M=\operatorname{tf}L_0\) in the native pairing, E47 supplies \(P_0=\sqrt8\,M\) and the operator \(G_0=d_0^*P_0^*P_0d_0+S_0\Delta_0S_0^*+d_0d_0^*\). The positive \(L^2\) realization and the elliptic \(H^2\) graph estimate give \(\|G_0^{-1}f\|_{H^2}\lesssim\|f\|_2\): the spectral gap removes \(\|G_0^{-1}f\|_2\) from the graph estimate. Smooth \(f\) gives smooth inverse by the assessed fixed elliptic regularity. These are exactly the endpoints from E47 that E66 uses. [E47][e47].

For the frozen positive matrix symbol \(A_*(\xi)=A^{lm}(x_*)\xi_l\xi_m\), Fourier transforming \(L_*=-A^{lm}(x_*)\partial_{lm}\) gives \(\partial_{ij}v=\mathscr M_{ij}(L_*v)\) with symbol \(-\xi_i\xi_jA_*(\xi)^{-1}\). The singularity at the zero frequency is immaterial for the \(L^2\) multiplier. Homogeneity, the positive margin and the differentiated matrix inverse bound all fixed annulus derivatives uniformly on the fixed coordinate comparisons. Each annular kernel is a scaled Schwartz kernel with zero integral, since its symbol vanishes at zero. For spatial derivative order \(r=0,1\), summing \(2^{(4+r)\ell}(1+2^\ell|x|)^{-N}\) on either side of \(2^\ell|x|=1\) gives \(C|x|^{-4-r}\) for \(N>5\). Plancherel and bounded overlap identify the strong \(L^2\) multiplier limit. Away from the support of a compactly supported \(L^1\cap L^2\) input the absolute summed kernel bound identifies the ordinary convolution there with this limit.

The cancellation used in the weak estimate is \(\int b_Q=0\) for the vector-valued bad part of each dyadic cube. The homogeneous off-origin kernel also has spherical mean zero. Indeed its inverse-transform distribution has degree \(-4\), so its pairing with \(\chi(\lambda x)-\chi(x)\) vanishes for radial smooth \(\chi=1\) near zero with compact support. This test vanishes near zero, and the radial factor in its pairing with the off-origin kernel is \(\int_0^\infty[\chi(\lambda r)-\chi(r)],dr/r=-\log\lambda\). Thus the angular mean must be zero. A possible mass at the origin causes no off-support term in E66's argument.

Specifically, for \(y\in Q\) and \(x\) outside a fixed enlargement \(Q^*\), subtract \(K(x-x_Q)\) in the bad-part convolution. The derivative bound gives \(\int_{(Q^*)^c}|K(x-y)-K(x-x_Q)|dx\lesssim \ell(Q)\int_{c\ell(Q)}^\infty r^{-2}dr\lesssim1\). Disjoint bad cubes have total volume at most \(\|f\|_1/\lambda\), and the good part satisfies \(\|g\|_2^2\lesssim\lambda\|f\|_1\). Their \(L^2\) limits allow Fatou outside the enlarged cubes. Together these give weak \((1,1)\) for the multiplier and for its adjoint matrix symbol. For \(1<p<2\), split the input at magnitude \(\lambda\). The output distribution bound is at most a constant times

\[
 \lambda^{-1}\int_{|f|>\lambda}|f|+
 \lambda^{-2}\int_{|f|\le\lambda}|f|^2 .
\]

Integration against \(p\lambda^{p-1}d\lambda\) gives \((p-1)^{-1}\) and \((2-p)^{-1}\) from the two terms. At \(p=8/7\) this bounds the adjoint. Dual testing on smooth functions gives the original \(L^8\) operator and identifies its action with the \(L^2\) multiplier on common inputs. This checks the matrix \(L^8\) estimate without a scalar-kernel assumption. [E66, (4) and subsequent estimates][e66].

The fixed freezing and patching also checks. For each compactly supported piece \(v\), the leading coefficient variation multiplies only \(\|\partial^2v\|_8\) on that piece, so it is absorbed after choosing the chart radii using the uniform frozen bound. The commutators with the partition and the fixed lower-order coefficients cost at most one derivative. The interpolation \(\|\partial v\|_8\le Ch\|\partial^2v\|_8+Ch^{-1}\|v\|_8\) follows by subtracting the scale-\(h\) convolution and moving the derivative onto the mollifier in the remaining term. Applying it in the fixed charts, reconstructing, and absorbing the cutoff's \(Ch\|D_0u\|_8\) error gives (5) of E66. For the remaining \(L^8\) value term, the localized \((I-\Delta)^{-1}\) kernel's high blocks have \(L^{8/5}\) bounds \(C2^{-2\ell}2^{3\ell/2}=C2^{-\ell/2}\), and the low block is smooth. Young's inequality gives \(H^2\hookrightarrow L^8\) after localization. The \(L^2\) inverse and \(\|f\|_2\le V^{3/8}\|f\|_8\) thus remove the value remainder. Approximation by smooth data shows that the \(W^{2,8}\) inverse agrees with the \(H^2\) inverse on \(L^8\) inputs. [E66, (5) and value-remainder removal][e66].

## Lorentz norm and common weak inverse

For \(A_2=\|h\|_2\), \(A_8=\|h\|_8\), the two rearrangement majorants switch at \(s_*=(A_2/A_8)^{8/3}\). Integrating \(s^{-3/4}A_8s^{-1/8}\) below and \(s^{-3/4}A_2s^{-1/2}\) above gives \(8A_8s_*^{1/8}+4A_2s_*^{-1/4}=12A_2^{1/3}A_8^{2/3}\). Extending the upper integral to infinity only enlarges it. The zero cases are trivial. Tonelli gives \(\|f\|_{4,1}=4\int\mu_f(v)^{1/4}dv\). Completeness follows from the rearranged partial integrals \(J_f(s)=\sup_{\nu(E)=s}\int_E|f|\) and the identity \(\|f\|_{4,1}=V^{-3/4}J_f(V)+\frac34\int_0^V s^{-7/4}J_f(s)ds\). This gives both the triangle inequality and the continuous inclusion in \(L^1\). For a Cauchy sequence its \(L^1\) limit and Fatou in the displayed identity give convergence of the Lorentz norms of the differences. [E66, (6)–(7)][e66]. [E53, layer norm][e53].

For \(B_j=D_0^jG_0^{-1}\), the arbitrary vector layer \(f_v=(f/|f|)1_{|f|>v}\) has endpoint norms \(\mu_f(v)^{1/2}\) and \(\mu_f(v)^{1/8}\), and the two endpoint actions agree there. The output norm is bounded by \(12b_{j,2}^{1/3}b_{j,8}^{2/3}\mu_f(v)^{1/4}\). Strong measurability follows from endpoint norm continuity of the layers off the countable positive-measure levels and the interpolated norm bound on their differences. The layer integral also converges in \(L^2\) because \(\mu_f(v)^{1/2}\le V^{1/4}\mu_f(v)^{1/4}\), and equals \(f\) by integrating bounded truncations. Boundedness on \(L^2\) identifies its image, while the output Lorentz Bochner integral agrees in \(L^1\) with that same image. This gives \(C_G=3\sum_{j=0}^2b_{j,2}^{1/3}b_{j,8}^{2/3}\) in the reference \(W^{2,(4,1)}\) inverse estimate, with the three components the weak derivatives of one \(H^2\) section. [E66, (8)–(9)][e66].

## Native expansion, strain comparison and value absorption

The native perfect reference has \(F_{0i}\wedge F_{0j}=\delta_{ij}\mu_0\), and its self-dual forms have unit norm. Expanding \(F=F_0+\beta\), the two mixed wedges give \(2L_0\beta\) since \(\beta_i\wedge F_{0j}=(\beta_i,F_{0j})_0\mu_0\). Write \(C_{ij}=\beta_i\wedge\beta_j/\mu_0\), \(\sigma=(2\operatorname{tr} L_0\beta+\operatorname{tr}C)/3\). Then \(\mu=(1+\sigma)\mu_0\) and

\[
 q=Q-I=2M\beta+R,
 \qquad R=\frac{\operatorname{tf}C-2\sigma M\beta}{1+\sigma}.
\]

The reference chiral identification and \(F_0,\mu_0\) are parallel, so \(D_0M=0\). The remainder numerator is quadratic with derivative bounded by \(C|\beta||D_0\beta|\), and the derivative of the reciprocal denominator has size at most \(C|D_0\beta|\) in the value tube. Thus \(|R|\le C|\beta|^2\), \(|D_0R|\le C|\beta||D_0\beta|\). This is the native normalization and uses the ordered derivative with no commutation. [E66, (10)–(12)][e66]. [E59][e59].

The same smooth positive-plane and volume reconstruction verified in E59 gives the native metric comparison by the graph \(F_-F_+^{-1}\) and scalar factor \((1+\sigma)^{1/2}\). A small tube separately gives \(\tfrac12g_0\le g_A\le\tfrac32g_0\) and \(\tfrac12 dV_0\le dV_A\le\tfrac32dV_0\). The independent volume estimate uses \(1+\sigma\). The one-form norm comparison and distribution formula give \(\|W\|_{4,1;0}\le2^{1/4}\sqrt{3/2}\|W\|_{4,1;A}\) and, in reverse, the factor \((3/2)^{1/4}\sqrt2\). For \(N_X=\nabla_X^AQ\), the strain definition and \(\operatorname{tr}N_X=0\) give \(N_X=2ST_XS-\frac23\operatorname{tr}(QT_X)Q\). Half the quadratic form of this self-adjoint operator on trace-free symmetric matrices is the sum of off-diagonal weights \(\sqrt{\lambda_i\lambda_j}\) times squares and the diagonal weighted variance \(\sum_i\lambda_i (t_i-\bar t)^2\), with \(\bar t=\sum_i\lambda_i t_i/3\). The variance is bounded by evaluation at zero, so the entire operator lies between zero and \(2\lambda_{\max} I\), giving \(|N_X|\le6|T_X|\). Summing the covector slots and applying the live-to-fixed Lorentz factor gives (15) of E66. [E66, (13)–(15)][e66].

Both imposed slice expressions vanish identically. Therefore \(S_0\Delta_0S_0^*a=d_0d_0^*a=0\), and from \(\beta=d_0a+B(a)\), \(B(a)=[a\wedge a]/2\),

\[
 G_0a=8d_0^*M^*Md_0a=4d_0^*M^*(q-R-2MB(a)).
\]

The parallel adjoint \(M^*\) and the fixed codifferential estimate the terms by first derivatives. Since \(I\) is parallel and central, \(D_0 q=N-[\operatorname{ad}(a),q]\) with no base correction on the zero-form itself. Reference bounds from the curvature identity are \(|\beta|\lesssim|D_0a|+|a|^2\), \(|D_0\beta|\lesssim|D_0^2a|+|a||D_0a|\), and \(|D_0B|\lesssim |a||D_0a|\), by parallel alternation and bracket. Thus \(|[\operatorname{ad}(a),q]|\lesssim\rho|a|\), \(|D_0R|\lesssim\rho(|D_0^2a|+\rho|D_0a|)\) and \(|D_0B|\lesssim\rho|D_0a|\) for the imposed \(C^0\) bounds and \(\rho\le1\). E66's error is exactly of the absorbable reference \(C\rho W^{2,(4,1)}\) form. Choose \(\rho\le(2C_GC_{\rm err})^{-1}\) within the fixed geometric tube. Applying the inverse to \(G_0a\) absorbs at most half the left side. No smallness of \(D_0a\) or \(D_0\beta\) is used. [E66, (16)–(19)][e66].

## Critical pair and scope of the slice

On a unit torus, E53's weighted inverse-derivative block applied to a layer of measure \(m\) is bounded by \(C\min(2^jm^{1/2},2^{-j/2}m^{1/8})\). They cross at \(2^j=m^{-1/4}\). Summing the two geometric series gives \(Cm^{1/4}\), and integrating layers gives the full-gradient Lorentz term. For the finite low block, each Fourier coefficient is bounded by \(\|v\|_1\), giving \(\|\Delta_0v\|_8\le C\|v\|_1\). This verifies the strengthened low term in (20). [E53][e53]. [E66, (20)][e66].

The derivative of a supported local piece is \(\partial_i(\chi U)=\chi D_{0i}U+(\partial_i\chi)U-L_i(\chi U)\) in its frame, with interior zero extension. Smooth fixed coefficient multipliers and coordinate density comparability give the required Lorentz comparison by the same layer argument. The low \(L^1\) term is bounded by \(V^{3/4}\) times the Lorentz term. Thus the critical pair norm is bounded by the reference \(L^{4,1}\) norms of \(U,D_0U\). The previous bounds for \(\beta,D_0\beta\) control these by the \(W^{2,(4,1)}\) norm of \(a\), closing (21) with constants depending on the fixed localization. The theorem assumes both \(S_0^*a=0\) and \(d_0^*a=0\) for the given connection. There is no construction of an automorphism meeting these conditions. [E59, fixed localization][e59]. [E66, (21) and scope][e66].

[req]: ../research-progress/handoffs/SP4-CME-E70_REQUEST_v1.md
[e66]: ../notes/66_FIXED_SLICE_STRAIN_ESTIMATE_20261122.md
[e47]: ../notes/47_ROUND_STABLE_LINEAR_20261122.md
[e53]: ../notes/53_CRITICAL_FINITE_P_HEAT_20261122.md
[e59]: ../notes/59_CRITICAL_PATH_STRAIN_20261122.md
