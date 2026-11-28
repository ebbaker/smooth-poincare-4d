# SP4-POLE-E08b · The combined residual estimate on the second cap

28 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex assistance. Fixed E packet, revision 1. The request designates GPT-6.2 Sol with ultra effort. The actual serving variant and effort are unavailable to this helper. Base `6a422ce7814fe1ad278d6904970e3b19b05a9890`. This is a working analytical result on the frozen smooth oriented Riemannian pilot, pending non-author replay. [Request](../research-progress/handoffs/REQUEST_E08_CAP_ESTIMATES_20261127.md) · [Register](../research-progress/REGISTER.md)

The working-tree inputs are the [B04 marked metric and end](../brainstorm/notes/B04_MARKED_PILOT_20261127.md) (`d87dc4f71886074e`), its [method decision](../brainstorm/notes/B04_ANALYTIC_METHOD_20261127.md) (`1473402e7f2028b7`) and [marking replay](../reviews/B04_MARKING_REPLAY.md) (`e614ecc71399d668`), the [E07 atlas](E07_MARKED_ATLAS.md) (`ea60a02278bd296a`), and [A1](E01_A1.md) (`db13563024da1a55`). Hashes are SHA-256 prefixes. The original [07 metric trial](../../../investigations-1/07_positive_subcritical_entry/notes/MARKED_CONNECTION_ASSEMBLY.md#one-whole-smooth-trial) fixes the step and band metric.

## 1. Cutoff potentials and their residuals

Write \(X=M\setminus\{p\}\) and \(\Omega_u=Lu\) for the A1 form with actual leading coefficient \(u=\sum_{i=1}^3u^i u_i\in\Lambda_p^-\) in the fixed orthonormal frame at \(p\). All two-form norms below use \(h\) unless marked Euclidean. Let \(\beta_u\) be the corresponding constant two-form in the inverted chart, with the physical orientation reversed from the raw coordinate order. Let \(E_x=\sum_i x^i\partial_{x^i}\), \(\lambda_u=\tfrac12\iota_{E_x}\beta_u\) and \(\chi_e(r)=H((r-16)/16)\), where \(H\) is the prescribed flat step. The end potential is \(A_e=\chi_e\lambda_u\), extended by zero for \(r\le16\) and off the marked chart. Cartan's formula for the Euler field gives \(d\lambda_u=\beta_u\). With \(D_h=(d_h^*,\sqrt2 P_h^-d)\), the residual used in the anti-self-dual equation is

\[
 f_e=-\sqrt2 P_h^-\left(\chi_e\beta_u+
       \tfrac1{16}H'((r-16)/16)\,dr\wedge\lambda_u\right).
\]

The derivative term is supported in the closed annulus \(16\le r\le32\). For \(r\ge32\), \(f_e=-\sqrt2 P_h^-\beta_u=O_\infty(r^{-2})\) by asymptotic Euclidean order two and the flat chirality of \(\beta_u\).

For the second cap use \(K_*=\{t'\le17/16\}\), including the product germ up through \(s=t'-1=1/16\). Set \(w=\tanh(t'/2)e^{i\theta}\), \(\xi+ib=i(1+w)/(1-w)\) and \(F=(\xi,bn)\) with coordinates \(Z=(Z_0,Z_1,Z_2,Z_3)\). On \(K_*\), the oriented conformal chart has \(F^*g_{\mathrm{Eucl}}=b^2 h\). Let \(\beta=(dZ_0\wedge dZ_1+dZ_2\wedge dZ_3)/\sqrt2\) and \(\lambda=\tfrac12\iota_{\sum_i Z_i\partial_{Z_i}}\beta\), so \(d\lambda=\beta\). Extend \(F\) via the same \((t',\theta,n)\) coordinates in the signed second tube to an open neighborhood of \(s=3/32\) using E07 §2. This extension gives smooth coordinate functions there. In the curved band the metric is the original tensor interpolation. Set \(\chi_c=1-H(32(s-1/16))\) and \(A_c=\chi_cF^*\lambda\), with \(\chi_c=1\) on \(K_*\) and \(A_c=0\) beyond the collar. Then

\[
 dA_c=\chi_c F^*\beta-32H'(32(s-1/16))\,ds\wedge F^*\lambda,
 \qquad f_c=-\sqrt2 P_h^-dA_c.
\]

Flatness of \(H\) at 0 and 1 makes both extensions smooth. On \(K_*\), \(F^*\beta\) is \(h\)-self-dual by conformal invariance. Consequently \(\operatorname{supp}f_c\subset\{1/16\le s\le3/32\}\) in the signed second tube. There the full displayed formula uses the actual \(P_h^-\), including its action on \(\chi_c F^*\beta\). The whole tube misses the B04 pole chart by the latitude bounds in E07 §§2 and 4. In particular the support of \(f_c\) is disjoint from the end residual support \(\{r\ge16\}\), even in the curved band. The end potential and its differential vanish on a neighborhood of \(K_*\).

The conformal factor follows from \(F^*g_{\mathrm{Eucl}}=d\xi^2+db^2+b^2g_{S^2}\). The Cayley map is holomorphic, with \(|d(\xi+ib)|^2/b^2=4|dw|^2/(1-|w|^2)^2=dt'^2+\sinh^2t'\,d\theta^2\). On \(K_*\) the exterior metric cutoff is zero and the second cap metric has exactly this disk factor and the round sphere factor. The polar map \((b,n)\mapsto bn\) pulls the positive Euclidean three-volume back to \(b^2\,db\wedge dA_n\), so \(F\) preserves the product orientation throughout \(K_*\).

For every \(u\ne0\), \(f_e\) is nonzero on the end. At \(y=(0,0,\rho,0)\) with \(0<\rho<1/32\), the round factor has radial eigenvalue 1 and transverse coefficient \(\sigma^2=(\sin\rho/\rho)^2\). The inversion reflection at that point is diagonal, giving \(h=\operatorname{diag}(1,1,1,\sigma^2)\) in \(x\). In \(h\)-orthonormal raw order \((dx^1,dx^2,dx^3,\sigma dx^4)\), the physically anti-self-dual subspace is the self-dual one for that raw order. The projections of the three \(\beta_{u_i}\) onto its three standard unit generators have respective coefficients \(\tfrac12(1-\sigma^{-1})\), \(\tfrac12(1-\sigma^{-1})\), \(\tfrac12(\sigma^{-1}-1)\). Thus \(|f_e|_h=|1-\sigma^{-1}|\,|u|_{g(p)}/\sqrt2>0\) at these points, where the end cutoff is already one.

## 2. The prescribed best constant and the cap-only source

The solving weight is \(\delta=-1/2\) and the data space is \(\mathcal H=W^{3,2}_{-3/2}(\Lambda_h^-)\). Use a smooth positive weight function \(\varpi\) equal to \(r\) on \(r\ge16\), with the local derivative norm

\[
 \|f\|_{\mathcal H}^2=\sum_{j=0}^3\int_X\varpi^{2j-1}|\nabla_h^j f|_h^2\,dV_h.
\]

This gives the A1 weighted space because \(h=I+O_\infty(r^{-2})\) on the end. In raw coordinates the connection coefficients decay as \(O_\infty(r^{-3})\), so lower-order terms in each covariant derivative are controlled with the stated weights. The exponent is \(2(j-(-3/2))-4\). The tail of each weighted squared integrand for \(f_e\), after integration over the coordinate spheres, is \(O(r^{-2})\,dr\), so \(f_e\in\mathcal H\). The cap source is smooth and compactly supported and belongs to the same space. Local derivatives preserve supports, hence

\[
 \|f_e+f_c\|_{\mathcal H}^2=\|f_e\|_{\mathcal H}^2+\|f_c\|_{\mathcal H}^2.
\]

By A1 §2 the inverse goes from target order three and weight \(-3/2\) to order four and weight \(-1/2\). This use of A1 is under its smooth asymptotically Euclidean hypotheses with \(b_2(M)=0\), and both solving weights used here lie in its root-free interval \((-3,0)\). The primary inputs for the A1 argument are Lockhart–McOwen, Theorem 6.2 and Lemma 7.1, printed pp. 434–435, for the Fredholm realization of the asymptotically translation-invariant cylindrical elliptic operator and stability of its nullspaces between nonexceptional weights in one interval. I checked those passages. The isomorphism and its Euclidean weight conversion are A1's deductions. [Primary scan](https://www.numdam.org/item/ASNSP_1985_4_12_3_409_0.pdf) · [A1 §2](E01_A1.md#2-weighted-invertibility) · [A1 replay](../reviews/E01_REPLAY.md)

For each nonempty compact \(K\subset X\), define the localized map and its best norm by

\[
 T_K f=\bigl(dD_{h,-1/2}^{-1}(0,f)\bigr)|_K,
 \qquad N_K=\sup_{0\ne f\in\mathcal H}\frac{\|T_K f\|_{C^0(K,h)}}{\|f\|_{\mathcal H}}.
\]

The inverse, exterior differentiation, and the ordinary interior \(W^{3,2}\)-to-\(C^0\) embedding in four dimensions give \(N_K<\infty\). By A1 §3 the true error of the trial two-form is exactly

\[
 \Omega_u|_K-d(A_e+A_c)|_K=T_K(f_e+f_c).
\]

In fact let \(A\) be any smooth compactly supported one-form and put \(f_A=-\sqrt2 P_h^- dA\). Solve both at \(-1/2\) and at \(-3/2\) with data \((0,f_A)\). The compact source belongs to both target spaces. The \(-3/2\) solution belongs to the \(-1/2\) space and solves the same equation, so injectivity identifies the two solutions \(a_A\). Since \(D_ha_A=0\) on the far end, the homogeneous annular estimates of A1 give \(a_A=O_\infty(r^{-3/2})\) and \(da_A=O_\infty(r^{-5/2})\). By construction \(d(A+a_A)\) is a smooth closed self-dual two-form on \(X\) with zero leading coefficient and remainder \(O_\infty(r^{-5/2})\). A1 uniqueness gives \(d(A+a_A)=0\). This argument includes the gauge condition \(d_h^*a_A=0\) through the first component of the inverse equation. In particular,

\[
 T_K f_A=-dA|_K,\qquad N_K\|f_A\|_{\mathcal H}\ge\|dA\|_{C^0(K,h)}.
\]

## 3. Failure of the strict lower bound and its scope

On any nonempty compact \(K\subset K_*\), the combined residual estimator has the best allowance \(N_K\|f_e+f_c\|_{\mathcal H}\). Testing its norm on \(f_c\) gives

\[
 N_K\|f_e+f_c\|_{\mathcal H}
 \ \ge\ \|dA_c\|_{C^0(K,h)}
     \sqrt{1+\frac{\|f_e\|_{\mathcal H}^2}{\|f_c\|_{\mathcal H}^2}}
 \ >\ \|dA_c\|_{C^0(K,h)}\qquad(u\ne0).
\]

Here \(f_c\ne0\) by the identity \(T_K f_c=-dA_c|_K\) and \(dA_c=F^*\beta\) nowhere zero on \(K_*\). For \(u=0\) the square root is one and the allowance is at least the trial maximum. For \(u\ne0\) even localization to \(K=\{q\}\) leaves the strict inequality. The first failed bound is the reverse triangle test \(\inf_K |dA_c|_h > N_K\|f_e+f_c\|_{\mathcal H}\), needed for a positive certified minimum.

For \(K=K_*\) the bounds are exact on the trial side. At \(|w|=a=\tanh(t'/2)\), \(b=(1-a^2)/|1-w|^2\) ranges from \((1-a)/(1+a)=e^{-t'}\) to \((1+a)/(1-a)=e^{t'}\). The extrema occur at \(w=-a\) and \(w=a\), respectively. Since \(|F^*\beta|_h=b^2\), we have

\[
 \inf_{K_*}|dA_c|_h=e^{-17/8},\qquad
 \sup_{K_*}|dA_c|_h=e^{17/8}.
\]

Hence the allowance for the unit flat trial, at every nonzero pole coefficient, exceeds \(e^{17/8}\), which is \(e^{17/4}\) times the smallest trial magnitude. Scaling the cap potential by any nonzero real amplitude multiplies its trial extrema by the absolute amplitude and leaves the same strict obstruction.

The proof applies to every smooth compactly supported cap bump \(A\), with arbitrary spatial dependence, for which \(\operatorname{supp} f_A\) is disjoint from \(\operatorname{supp} f_e\) and the observation piece is in the region where \(dA_e=0\). Support of \(A\) away from the end chart is sufficient. If \(dA\) vanishes throughout the piece, the trial itself has zero lower bound. Otherwise the same strict inequality holds for \(u\ne0\). It also holds for a source-space restriction containing both \(f_A\) and \(f_e+f_A\), including the span of the two separate sources with the inherited norm. The argument uses that norm's disjoint-support identity and its use of the cap-only source as a test vector. A source class with prescribed correlations excluding that test vector or a bound on the particular error vector falls outside this result.

The negative estimated margin is a property of this scalar allowance. The actual cap field satisfies \(\Omega_u|_{K_*}=T_{K_*}f_e\), since the cap-only correction cancels \(dA_c\) exactly. Its coefficient values and zeros are undetermined by the estimate. The missing input for the product-cap comparison is a signed component bound for the true tangential trace at the outer mark \((t,n)\mapsto\Phi_2(t,(17/16)n)\), for the same fixed \(u\). No numerical estimate or formal verification is used.
