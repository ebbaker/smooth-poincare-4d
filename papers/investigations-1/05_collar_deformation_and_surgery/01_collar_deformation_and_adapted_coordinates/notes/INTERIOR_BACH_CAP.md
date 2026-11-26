# Interior Bach variation on the native marked cap

26 November 2026 UTC. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded execution DEF-E03h from the [issued exterior recovery and native cap tests](../../research-progress/handoffs/EXTERIOR_RECOVERY_AND_NATIVE_CAPS_20261126.md), baseline 8471728a1549614f155a8751c709904cbcf994d6. The dispatch specifies GPT-6.2 Sol/ultra. Actual serving model and effort are unavailable. This derivation combines the [quantified interior variation](INTERIOR_VARIATION.md) and the [physical boundary response](PHYSICAL_BOUNDARY_RESPONSE.md) on the same finite source.

## The fixed cap and its signed mass

Fix an index of the smooth volume-one positive Yamabe sequence on the closed oriented smooth homotopy four-sphere \(M\). Set \(g=g_i\), \(Y=Y([g])=R_g>0\), \(T=4\pi^2\), \(I=I^+(M)\), \(e=E_\pm(g;M)<2T\), and \(d=e-I\). Each \(E_\sigma\) is the integral of the squared Hilbert–Schmidt norm of the real Weyl endomorphism on \(\Lambda^\sigma\), for the fixed orientation. Use the actual parametrized E61 disk \(D=D_i\), its bicollar, and the complete exterior \(V=M\setminus\operatorname{int}D\). The face is \(\Sigma=\partial D\) with the original metric \(h\). Fix an open patch \(U\) compactly contained in the interior of \(D\) away from the whole bicollar, including the inward native strip. The nested parametrized disks in the E61 proof leave such an interior region, with positive charge in the selected sign for the original disk. [E61 selection, Corollary on a marked bicollar with small incoming curvature](../../../../master/01_fixed_type_variational_descent/manuscript/spectral_windows.tex)

For a smooth compactly supported \(g\)-self-adjoint trace-free endomorphism \(A\) in \(U\), take

\[
g_t(X_1,X_2)=g(e^{tA}X_1,X_2),\qquad
N_g(A)=\|A\|_\infty+\|\nabla A\|_{4,U}+\|\nabla^2A\|_{2,U}\le1,\qquad
K=\|\operatorname{Rm}_g\|_{2,U,\mathrm{tens}}.
\]

The metric is smooth and Riemannian for every finite \(t\). The exponential has determinant one, so \(dV_{g_t}=dV_g\) pointwise. The cap is the same marked disk with \(g_t|_D\), glued by the original marking. The exterior and the native strip have metric \(g\) throughout. In particular the intrinsic face metric, its measure, the two outward normals, and all the metric jets on the original strip are fixed. All modified curvature lies in \(U\), including the cutoff layers.

Let \(m^\sigma=E_\sigma(g;D)\), \(v^\sigma=e-m^\sigma\), \(c^\sigma(t)=E_\sigma(g_t;D)\), and \(f(t)=E_\pm(g_t;M)\). Closed signature equates the two signed increments, since the exterior terms are fixed. Thus with \(S(t)=e-f(t)\) the exact ledger is

\[
c^\sigma(t)=m^\sigma-S(t),\qquad f(t)=v^\sigma+c^\sigma(t),\qquad
c^+(t)-c^-(t)=m^+-m^-.
\]

The common saving is bounded by
\[
 S(t)\le \min_\sigma E_\sigma(g;U),\qquad
 c^\sigma(t)\ge E_\sigma(g;D\setminus U).
\]
These bounds count all curvature left between the patch and the original face. In particular, a bound on the original strip alone does not account for the cap.

## Finite variation and the two cost tests

In the convention of Bahuaud, Guenther, Isenberg and Mazzeo the covariant-metric gradient of \(\int_M |W|^2_{\mathrm{tens}}\,dV\) is \(-4B_g\). The ordered tensor norm counts each antisymmetric pair twice, so \(|W|_{\mathrm{tens}}^2=4(|W^+|_{\mathrm{HS}}^2+|W^-|_{\mathrm{HS}}^2)\). Closed signature therefore gives \(\int_M |W|^2_{\mathrm{tens}}\,dV=8f\). The supported first derivative in either sign is

\[
f'(0)=-\tfrac12\int_U\langle B_g,gA\rangle_g\,dV_g .
\]

If \(B_g\ne0\) somewhere in the allowed patch, choose a smooth nonnegative bump \(\chi\) there with \(\int_U\chi|B_g|^2dV_g>0\). Put \(A_0=\chi B_g^\sharp\) and \(A=A_0/N_g(A_0)\). This gives \(p=-f'(0)=\int_U\chi|B_g|^2dV_g/(2N_g(A_0))>0\). The physical cutoff is included before evaluating \(N_g(A_0)\). For a transition on a layer of width \(w\) with physical parameter \(\rho\), the source product rule uses \(w^{-1}\|d\rho\|_4\) and \(w^{-2}\|d\rho\|_4^2+w^{-1}\|\nabla^2\rho\|_2\). [Bach first variation, §1 and (1.1)](https://arxiv.org/html/2508.06633v1#S1) · [Physical cutoff estimate](INTERIOR_VARIATION.md#the-trial-in-the-physical-metric)

The [master core variation, Proposition on quantified localized variations](../../../../master/01_fixed_type_variational_descent/manuscript/core_variation.tex) gives \(F=C_F(1+K)^2\) bounding \(|f^{(j)}(t)|\) for \(1\le j\le4\) on \(|t|\le1\), where \(C_F\) depends only on dimension. For any normalized direction with nonzero first derivative, choose its descending sign so \(p=-f'(0)>0\). Since \(p\le F\), the segment \(0\le t\le a=p/F\) is nonincreasing by \(f'(t)\le-p+Ft\). Its exact peak is \(e\). The closed scalar-flat wall keeps the entire segment in the positive Yamabe locus. Hence, on this entire segment,

\[
 p t-\tfrac12Ft^2\le S(t)\le d,\qquad
 \frac{p^2}{2F}\le S(a)\le d .
\]

This is a finite descent when the localized pairing is nonzero. Its upper bound \(S\le d\) applies to every positive cap on the same fixed type. The first derivative bound \(p\le\sqrt{2Fd}\) holds at every positive subcritical index, including \(d=0\) by contradiction if \(p>0\). For the localized Bach direction it yields
\[
\int_U\chi|B_g|^2\,dV_g\le 2N_g(\chi B_g^\sharp)\sqrt{2Fd}.
\]
On the E61 tail \(K^2<\zeta\) for the chosen comparison-ball ceiling. Thus the first variation on the normalized physical critical unit ball is \(O(\sqrt{d_i})\), with constant at most \(\sqrt{2C_F}(1+\sqrt\zeta)\). A symmetric trial also gives \([-f''(0)]_+\le2d/t^2+Ft^2/12\) for \(0<t\le \min\{1,(2T-e)/(2F)\}\): both signed endpoints are positive and the odd Taylor terms cancel. On a tail with a uniform wall margin, the admissible optimizer gives \(\sqrt{2Fd_i/3}\) for small \(d_i>0\), and letting \(t\downarrow0\) gives zero at \(d=0\). The Weyl charge gives no positive lower bound for \(p\). The master product-germ example supplies nonzero charge with zero Bach tensor on a standard source. [Curvature derivatives, symmetric test and product-germ example](../../../../master/01_fixed_type_variational_descent/manuscript/core_variation.tex) · [Scalar-flat wall and Yamabe bound](../../../../master/manuscript/variational_comparison.tex)

The complete caps have the following thresholds at this same finite source.

| Positive endpoint comparison | Equivalent cap cost in either sign | Equivalent saving |
| --- | --- | --- |
| Strict improvement relative to the infimum, \(f(t)<I\) | \(c^\sigma(t)<m^\sigma-d\) | \(S(t)>d\) |
| Attainment of the infimum, \(f(t)=I\) | \(c^\sigma(t)=m^\sigma-d\) | \(S(t)=d\) |
| Inclusive smooth recognition, \(f(t)\le T\) | \(c^\sigma(t)\le m^\sigma-(e-T)\) | \(S(t)\ge e-T\) |

A strictly improving positive cap would contradict the definition of \(I\). At equality a positive cap attains \(I\), so its first variation vanishes and its second variation is nonnegative along smooth variations in the open positive locus. For direct recognition at \(T\), the strict and equality cases of Chang–Gursky–Yang apply on a positive smooth closed class. Here \(\chi(M)=2\) and \(\tau(M)=0\) give the tensor energy threshold \(8T\); simple connectivity and \(H^2(M)=0\) exclude their other alternatives. The master recognition gap supplies the stronger inclusive test \(f(t)\le T+\varepsilon_*\), with a universal, nonnumerical \(\varepsilon_*>0\). On the hypothetical nonstandard E61 source \(I>T+\varepsilon_*\), so either recognition saving exceeds \(d\). Also, the disk ceiling alone gives \(m^\sigma<\zeta/4\) since \(4|W^\sigma|_{\mathrm{HS}}^2\le|\operatorname{Rm}|_{\mathrm{tens}}^2\). If \(m^\sigma<e-T\) in either sign, the fixed exterior already exceeds the direct inclusive level. The E61 choice \(\zeta\le4\varepsilon_*\) guarantees this on the hypothetical nonstandard band. [Chang–Gursky–Yang, Theorems A and B](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf#page=3) · [Master recognition and definition of the infimum](../../../../master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex) · [Uniform recognition gap](../../../../master/manuscript/recognition_gap.tex)

For a clamped endpoint reached without a subwall path, a strict mass fit \(f(t)<I\) gives \(Y([g_t])\le-\sqrt{48(2T-f(t))}<0\): positivity contradicts the defining infimum, a zero class meets the scalar-flat wall, and Gauss–Bonnet in a volume-one Yamabe representative bounds the absolute Yamabe constant. In particular the same-width spectral test must fail. If its cap Dirichlet eigenvalue is positive, the full joined response then has a negative Rayleigh value. [Scalar-flat wall](../../../../master/manuscript/variational_comparison.tex) · [Exact capped sign test](PHYSICAL_BOUNDARY_RESPONSE.md#the-physical-split-and-the-exact-sign)

## Spectral comparison on the actual strip

Take \(L_t=-6\Delta_{g_t}+R_{g_t}\) with \(\Delta=\operatorname{div}\operatorname{grad}\). Write \(Q_{X,t}\) for its ordinary energy form on \(X=D,V,M\). Use \(H^1\) with the physical baseline \(g\); all finite trial metrics have the same \(L^2\) and \(L^4\) measures. Set \(a_0=\|A\|_\infty\), \(b_s=e^{s a_0}\) and \(r_s=\sup_{|t|\le s}\|R_{g_t}-Y\|_{L^2(g)}\) for \(0\le s\le1\). The common-frame calculation used for the Weyl variations also gives

\[
 r_s\le C_R s\big(K+\|\nabla^2 A\|_{2,U}+\|\nabla A\|_{4,U}^2\big)
       \le C_R s(1+K).
\]

Indeed, the Koszul difference of the two Levi–Civita connections is a smooth coefficient in \(t,A\) times \(\nabla A\). The curvature terms \(R^g,d^\nabla(\nabla^{g_t}-\nabla^g)\) and the square of the connection difference give, in the oriented frames \(e^{-tA/2}\), smooth coefficients of \(R^g,\nabla^2 A,(\nabla A)^2\). The coefficients and their first time derivatives are dimensionally bounded on \(|t|\le1\) and \(\|A\|_\infty\le1\). Taking the scalar trace in those frames and integrating the derivative proves the estimate. [Common-frame curvature calculation](../../../../master/01_fixed_type_variational_descent/manuscript/core_variation.tex)

The inverse-metric eigenvalues relative to \(g\) lie in \([b_s^{-1},b_s]\). Hölder and the baseline closed Yamabe inequality \(Y\|u\|_4^2\le Q_{M,0}(u)\) give

\[
 |Q_{M,t}(u)-Q_{M,0}(u)|\le
 \epsilon_s Q_{M,0}(u),\qquad
 \epsilon_s=b_s-1+r_s/Y .
\]

If \(\epsilon_s<1\), this supplies comparison factors \(c_-=1-\epsilon_s\), \(c_+=1+\epsilon_s\). There are positive factors even when this small-perturbation lower bound degenerates. On any interval \(J\subset[-s,s]\) containing \(0\) with peak \(H=\max_{t\in J}f(t)<2T\), set \(y_*=\sqrt{48(2T-H)}\). The closed sign argument gives \(Y([g_t])\ge y_*\) for all \(t\in J\). From \(Q_{M,t}\le b_s Q_{M,0}+r_s\|u\|_4^2\) and \(Q_{M,0}\le b_s Q_{M,t}+b_s r_s\|u\|_4^2\), one can use

\[
 c_-=\frac{1}{b_s(1+r_s/y_*)},\qquad
 c_+=b_s+r_s/Y,\qquad c_-Q_{M,0}\le Q_{M,t}\le c_+Q_{M,0}.
\]

The reverse inequality uses \(Y\|u\|_2^2-b_sY\|u\|_2^2\le0\) in the reversed kinetic comparison. These factors apply over the entire finite monotone Bach segment, with \(H=e\). If \(2T-e_i\ge\delta>0\) on the late sources, then \(\epsilon_s\le C_0s\) where \(C_0=(\exp(1)-1)+C_R(1+\sqrt\zeta)/\sqrt{48\delta}\). In particular \(\epsilon_s\le1/2\) for \(s\le\min\{1,1/(2C_0)\}\). These relative constants require the physical normalized direction and the curvature ceiling. Their uniformity requires no uniform lower bound on either native width. [Yamabe quadratic form and scalar-flat wall](../../../../master/manuscript/variational_comparison.tex) · [Lee–Parker, §2 and the Yamabe theorem](https://users.math.msu.edu/users/parker/YamabeProblem.pdf)

**Cap Dirichlet spectrum.** Zero extension of \(H^1_0(D)\) gives the same comparison for \(Q_{D,t}\) on that domain. Its unchanged \(L^2\) denominator gives, for every Dirichlet eigenvalue with multiplicity,
\[
 c_-\lambda_{j,D}(0)\le\lambda_{j,D}(t)\le c_+\lambda_{j,D}(0),\qquad
 \lambda_{j,D}(0)=Y+6\lambda_j(-\Delta_{g|_D,\mathrm{Dir}}).
\]
In particular the cap and exterior admit unique \(L_t\)-harmonic extensions of each trace in \(H^{1/2}(\Sigma)\). On the interval \(J\), one also has \(\lambda_{1,D}(t)\ge y_*/\operatorname{Vol}_g(D)^{1/2}\), by the closed Yamabe bound and Hölder on the zero extension.

**Full outward response.** Let \(H_{X,t}\varphi\) be the harmonic extension and \(\mathcal N_{X,t}\varphi=\partial_{\nu_X} H_{X,t}\varphi\) its weak outward derivative. The outward normal to \(D\) points into \(V\), and the exterior normal is its negative. Use \(dA_h\) for all real trace pairings. Write
\[
 B_t(\varphi)=6\langle\varphi,(\mathcal N_V+\mathcal N_{D,t})\varphi\rangle_h
             =\inf_{\substack{u\in H^1(M)\\u|_\Sigma=\varphi}}Q_{M,t}(u).
\]
The identity follows from Green's formula and the independent two harmonic minimizations at the common trace. Equality of the traces glues the two extensions into \(H^1(M)\). The original strip is smooth across the cut, so the outward derivatives require no mean-curvature correction. Inequalities for every closed test function descend to the full trace form:
\[
 c_- B_0(\varphi)\le B_t(\varphi)\le c_+ B_0(\varphi),\qquad
 c_-\mu_0\le\mu_t\le c_+\mu_0,\qquad
 \mu_t=\inf_{\|\varphi\|_{L^2(h)}=1}B_t(\varphi).
\]
\(B_0\) is an equivalent squared \(H^{1/2}\) norm by the trace theorem and a bounded extension on the fixed geometry, using \(R_g=Y\). Hence the infima are attained by weak form compactness and the compact trace embedding in \(L^2(h)\).

For a bound using an available native width \(w_V>0\) on the exterior, let \(j_->0\) be a lower bound for \(dA_{h_\rho}/dA_h\) on \(0\le\rho\le w_V\) in the original exterior Gaussian coordinates. The fundamental theorem of calculus on each normal fiber and integration in \(\rho\) give
\[
 \|\varphi\|_{L^2(h)}^2\le j_-^{-1}\big[(2/w_V)\|u\|_{2,V}^2+w_V\|du\|_{2,V}^2\big]
\]
for an extension \(u\) on \(V\). With the exterior harmonic extension and \(Q_{D,0}\ge0\), this yields the absolute bound
\[
 \mu_t\ge c_-\,j_-\,\min\{Yw_V/2,\ 6/w_V\}>0 .
\]
The absolute bound uses the measured width and area density at this index. The relative comparison uses the full response to every trace on the same face.

For the change of the cap operator itself, \(V\) contributes exactly the same form at both times. In the small-perturbation range, polarization of \(|B_t-B_0|\le\epsilon_s B_0\) in the \(B_0\) inner product gives
\[
 \big|6\langle\varphi,(\mathcal N_{D,t}-\mathcal N_{D,0})\psi\rangle_h\big|
   \le \epsilon_s\sqrt{B_0(\varphi)B_0(\psi)} .
\]
The same estimate uses \(\max\{1-c_-,c_+-1\}\) on the whole interval \(J\). With \(q_{D,t}\) the bilinear form of \(Q_{D,t}\), the exact finite-time change is
\[
 6\langle\varphi,(\mathcal N_{D,t}-\mathcal N_{D,0})\psi\rangle_h
   =(q_{D,t}-q_{D,0})(H_{D,t}\varphi,H_{D,0}\psi).
\]
For the first term this follows by replacing the second harmonic extension with the same trace at time zero, using zero-trace orthogonality for \(q_{D,t}\). For the second term do the corresponding replacement of the first extension for \(q_{D,0}\). Thus the response change is determined by an integral over \(U\), even though the harmonic extensions depend on the entire cap. The measured cap response need not itself be preserved by fixing the strip. [Exact Green identity and the coupled sign criterion](PHYSICAL_BOUNDARY_RESPONSE.md#the-physical-split-and-the-exact-sign)

## Scope and input receipt

The estimates are on the original physical cap. They certify a positive, finite, strictly lowering trial if a supported descending pairing is measured. Every positive trial has saving at most the minimizing excess, and the source gives neither a nonzero pairing nor a negative quadratic evaluation in the permitted patch. The significant additional estimate over the disjoint interior preparation is the two-sided spectral comparison, including the full outward response on the unreplaced strip. It requires only the physical critical norm and the closed positive Yamabe margin for an index-uniform relative estimate.

Inspected SHA-256 prefixes were 1f4b94e438383b60 for the issue, 2d2a076bf232cea5 for the earlier interior trial, d1b1dced54363b77 for the physical boundary response, 65c76bc676af0725 for the master core variation, 8063d76ad6875e80 for E61, d52c8d2ad83e21d0 for the scalar-flat wall, c9320f8f8b8c111d for direct recognition, and f4c5ce2687a2ba87 for the recognition gap. The cited Bach first variation and equality classification were checked against the linked primary texts. The inequalities are analytical.
