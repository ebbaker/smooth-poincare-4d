# Independent replay of the fixed-profile amplitude estimate

28 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. WIN-E31, non-author analytical replay. Actual serving model and reasoning effort unavailable. Checkout `86b24d9f9c2d` and [E31 request](../research-progress/handoffs/REQUEST_B08_AMPLITUDE_REPLAY_R1.md). The [amplitude note](../notes/B08_AMPLITUDE_CONTROL.md) matched intake SHA-256 `36e4273d74192a45e35c2c1bdb0307e4a2ef58f61c4eed3b399fb81c5bd4dceb`. Supporting inputs are [E24](../notes/E24_ROUND_HARMONICS.md) `f3d95399b300`, [E26](../notes/E26_TRANSFER_DEFICIT.md) `31de11b62b9b`, [E28](../notes/E28_MATCHED_UPPER.md) `8f944be33b5c`, and the [localized estimate](E30_EFFECTIVE_LOWER.md) replaying lower proof `2ea1b468bd4f`.

On the standard oriented Riemannian four-sphere, keep the prescribed \(a=2^{-256}\) and the two cutoff profiles fixed. For every signed amplitude \(|\eta|\le a^4\), the replay verifies

\[
  2^{-80}\eta^2a^6\le b(g_\eta)\le4\sqrt2\,\pi\,\eta^2a^6.
\]

Each infimum uses volume-centered quaternionic \(L^2(g_\eta)\)-orthonormal smooth generating positive half-spinor pencils. Centering is with respect to the actual compact \(g_\eta\)-volume. The zero value is attained at \(\eta=0\).

## Uniform geometry and the centering moment

Write \(t=|\eta|a^2\), \(\alpha=\eta\chi(s)(y^1)^2\), and \(F=2\rho/\Omega\). In the round frame \(q^{-1}\gamma_\eta\) has eigenvalues \(1,1+\alpha,1-\alpha,1\) and \(\gamma_\eta=(\Omega/\rho)^2g_\eta\). Thus the distortion is bounded by \(t\le a^6\), and all metrics are positive. As in the [metric replay](E29_METRIC_SPECTRUM.md), \(4g_\eta\ge q\). The estimate on the anisotropic cap uses \(F=1+s^2\) and \(|\alpha|\le |\eta|s^2\), so \(F^2(1-|\alpha|)\ge1\). Outside that cap the metrics differ only by the factor \(F^2\).

Let \(d\nu=dV_q/V_0\), \(J=dV_{4g_\eta}/dV_q=F^4\sqrt{1-\alpha^2}\), and \(w=J/\int J\,d\nu\). On either conformal cap the previous bound \(0\le J-1\le32a^2\) follows from \(J\ge1\) and \(J\le F^4\). Normalizing therefore gives \(\|w-1\|_\infty\le32a^2\). Its squared \(L^2(\nu)\) error is at most \(1024a^4<1/384\), as required for mean absorption in E24.

The integral of the round embedding \(x\) against \(F^4d\nu\) vanishes by reflection of the horizontal coordinates and reciprocal inversion for the axial coordinate. On \(U=\{s\le a\}\) the perturbation of the density is bounded by \(F^4\alpha^2\le2t^2\), and it vanishes outside \(U\). Since \(\nu(U)\le3a^4\) and the relative mass \(\int J\,d\nu\ge1\),

\[
 M=\left|\int xw\,d\nu\right|\le6t^2a^4 .
\]

This gain in amplitude follows from the determinant's even dependence on \(\alpha\), while the pencil mean constraint is \(\int f w\,d\nu=0\).

## Lower bound with the variable distortion

Assume \(t>0\) and \(r=R^{1/4}\le 2^{-40}ta\). In E26 the metric square-root estimate needs the eigenvalue interval \([1-t,1+t]\), \(t\le10^{-3}\), and \(r^2\le t^2\). These conditions hold uniformly here. The signed deficit comparison uses the same oriented pencil jet and \(|\deg f|=1\). Consequently \(e=\int|df|_q^4d\nu-16\) is between zero and \(50000t^2\). The centering absorption in E24 gives \(O\in O(5)\) and

\[
 D=\int|df-d(Ox)|_q^2d\nu\le10e+1520M^2
 \le500000t^2+54720t^4a^8 < 2^{40}t^2 .
\]

The central localized estimate retains its bounds. In particular, square-root factors and inverses have operator norms at most two, \(dV_{\gamma_\eta}/dV_q\ge1/2\), and the non-Clifford term has \(L^4(\nu)\) norm at most \(4r\). The round derivative on \(U\) has \(L^2\) norm at most \(2\sqrt3 a^2+\sqrt D\le5a^2\), using \(2^{20}t\le a^2\). The local Hölder factor \(\nu(U)^{1/4}\le3^{1/4}a\) therefore yields the same estimate \(Z_U\le2^9a^3r\) for the local Gram error. For the round tracefree, divergencefree test tensor \(T\) with \(\|T\|_\infty\le128\), the spherical linear variation cancels, and the trace of the Gram identity absorbs the variable dilation. With \(|\gamma_\eta-q|_q\le2t\), this gives

\[
 \left|\int\langle T,\gamma_\eta-q\rangle_qd\nu\right|
 \le128\bigl[D+2t(\sqrt D+D/4)+(1+t)Z_U\bigr]
 \le2^{49}t^2+2^{17}a^3r.
\]

For the last bound, the coefficient of \(t^2\) in the bracket is bounded by \(2^{40}+2^{21}+2^{39}\) and \(128(1+t)2^9\le2^{17}\). The E25 test pairs linearly with \(\eta\), so it has absolute probability pairing at least \(2^{-16}|\eta|a^6=2^{-16}ta^4\) for both signs. Divide the upper estimate by \(ta^4\) and use the assumed residue bound to get \(2^{49}a^2+2^{-23}=2^{-463}+2^{-23}<2^{-16}\). This contradiction gives \(r>2^{-40}ta\). Squaring and taking the infimum gives the non-strict lower bound \(2^{-80}t^2a^2=2^{-80}\eta^2a^6\).

## Compatible upper bound

The exact round pencils in E28 have kernel maps with axial component \(T_\lambda(s)=(\lambda^2s^2-1)/(1+\lambda^2s^2)\). Their horizontal means for \(dV_{g_\eta}\) vanish by reflection. At \(\eta=0\) the compact density is inversion-symmetric and \(T_1\) is odd under reciprocal inversion. At either nonzero sign of \(\eta\), the density strictly decreases on an open set in \(s\le a\), where \(T_1<0\), so the physical axial integral becomes positive. At \(\lambda=1/2\), the round-pencil axial integral against \(dV_{g_0}\) is at most \(-(9/1024)\omega_4\), with \(\omega_4=\pi^2/2\), by the E28 shell estimate. Its change against \(dV_{g_\eta}\) has magnitude at most \(t^2a^4\omega_4\), strictly smaller. Hence some \(\lambda\in(1/2,1)\) centers the nonzero-amplitude pencil, and \(\lambda=1\) centers the zero control. All these maps have round dilation at most two.

For the positive frame map \(L=(q^{-1}\gamma_\eta)^{-1/2}\), the two moving eigenvalues and \(|\alpha|\le t\) give \(\|L-I\|_{\mathrm{HS}}\le\sqrt2\,t\), supported in \(U\). At incidence the constant-parameter round spinor vanishes, so differentiating the transported spinor eliminates the connection difference. The round Clifford jet norm divided by the evaluation norm is half the map's dilation and is at most one. Thus its projected relative residue is at most \(\sqrt2,t\). The cap's \(\gamma_\eta\)-volume is at most its round volume, at most \(8\pi^2 a^4\). It follows that \(R\le32\pi^2 t^4a^4\). Conformal transport preserves \(R\) and the kernel map. Centering against \(dV_{g_\eta}\) makes the common evaluation-norm rescaling in E28 produce the identity quaternionic Gram matrix, because the mean kernel projector is \(I/2\). Taking the square root gives \(b(g_\eta)\le4\sqrt2\pi t^2a^2\), including equality to zero at \(t=0\).

The estimates describe varying the anisotropic coefficient with fixed support and both fixed radial profiles. A pointwise rescaling of one representative in its conformal class preserves the ratios of the coordinate metric entries. Changing the amplitude changes those ratios wherever \(\chi(s)(y^1)^2>0\). Evenness in the bounds also agrees with the orientation-preserving isometry relating opposite signs by interchange of \(y^2,y^3\) and reflection of \(y^4\). The estimate concerns these marked compact metrics and the infima over their pencil fields.
