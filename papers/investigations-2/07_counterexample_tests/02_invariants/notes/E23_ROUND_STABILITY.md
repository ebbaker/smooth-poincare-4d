# WIN-E23 · Round Möbius stability for the frozen metric

28 November 2026, New York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E execution, requested GPT-6.2 Sol/ultra, actual serving variant and effort unavailable. [Frozen request R1](../research-progress/handoffs/REQUEST_B08_FROZEN_METRIC_R1.md), SHA-256 prefix `6f14dfe99143`, and [pencil energy estimate](BALANCED_SPECTRAL_BOUND.md), SHA-256 prefix `8dff6f0d96d7`, on checkout `86b24d9f9c2d`.

## The primary estimate

Fix \(V_0=8\pi^2/3\), \(\mu_q=dV_q/V_0\) and use the extrinsic real Hilbert–Schmidt derivative into \(\mathbb R^5\). For a Riemannian domain metric \(k\) and unit round target write
\[
 \delta_k(f)=\frac{1}{16V_0}\int_{S^4}|df|_k^4\,dV_k-1.
\]
The denominator is fixed by the target volume and the four domain dimensions. When \(|\deg f|=1\), this is nonnegative by the pointwise arithmetic–geometric mean on four squared singular values and the signed degree integral. In dimension four \(\delta_g=\delta_\gamma\) by conformal invariance of the domain energy.

Guerra–Lamy–Zemas, Theorem 1.1 and equations (1.3)–(1.5), use \(n=5\) for the unit round \(S^4\) on both sides. For every \(f\in W^{1,4}(S^4_q;S^4_q)\) of degree \(+1\), a finite dimension-only \(C_5>0\) satisfies
\[
   \inf_{\phi\in\mathrm{Möb}_+(S^4)}
        \int |df-d\phi|_q^4\,d\mu_q\le C_5\delta_q(f).
\]
The fourth power also applies to the derivative distance. The constant is uniform over maps without an energy cutoff in the statement. Remark 1.3 gives the degree \(-1\) version with the same constant, by composing with an orthogonal reflection of the target and replacing \(\mathrm{Möb}_+\) by \(\mathrm{Möb}_-\). This is the sign of the [kernel maps under the stated projective orientation](E13_SPINOR_PENCIL.md). Section 2.2, (2.10), uses a target rotation and a stereographic dilation, with arbitrary pole and positive dilation factor. The estimate takes the infimum over all of those choices, including unbounded dilations. Lemma 2.5 and §3 Step 1 center \(f\circ\psi\) in \(\mu_q\) by **domain** Möbius precomposition. For the frozen metric, a pencil instead satisfies \(\int f\,dV_g=0\). Domain precomposition changes that integral to \(\int f\,d(\psi_*dV_g)\) and moves the anisotropy if used as a coordinate change. Theorem 1.1 supplies no estimate fixing those gauges for \(g\).

Theorem 1.1 gives no numerical upper bound for \(C_5\). Section 3 Steps 0 and 2 use unspecified small dimensional constants and Step 3 uses Lemmas 2.4–2.5 and subsequential compactness to enter the local regime (3.4). The proof as presented gives no numerical entry threshold at that step. Remark 1.2 and Appendix A concern the exponent of the deficit, rather than a numerical stability constant. Here the checked primary version is the [31 May 2023 arXiv v1 PDF](https://arxiv.org/pdf/2305.19886v1), pp. 2, 6–8, 11–12 and 18–22, with the [arXiv HTML](https://arxiv.org/html/2305.19886v1) used to check the integral normalization. The [author-hosted pagination](https://www.math.univ-toulouse.fr/~xlamy/papers/guerra-lamy-zemas--stability_moebius_sphere_valued.pdf) also has the unspecified constant and global compactness step. Publication metadata is [Trans. Amer. Math. Soc. 378 (2025), 1235–1259](https://doi.org/10.1090/tran/9272).

## Identity, a centered round trial map, and the two infima

Put \(t=\epsilon\chi(s)(y^1)^2\). On \(s\le a\), where \(\rho=1\), the eigenvalues of \(G=q^{-1}\gamma\) are \(1,1+t,1-t,1\). Off that cap \(t=0\) and \(G=I\). Thus \(|t|\le\tau=a^6\). In the round ambient coordinate identification the identity has \(\delta_q(\mathrm{id})=0\) and
\[
 \delta_\gamma(\mathrm{id})
   =\int[\Phi(t^2)-1]\,d\mu_q,\qquad
 \Phi(z)=\frac{(2-z)^2}{4(1-z)^{3/2}} .
\]
Here \(\Phi(t^2)=\sqrt{\det G}(\operatorname{tr}G^{-1}/4)^2\). Since \(\Phi'(z)=(4-z^2)/(8(1-z)^{5/2})\) lies in \([1/2,1]\) for \(0\le z\le 1/16\), the integrand is between \(t^2/2\) and \(t^2\). The Euclidean four-ball moment \(\int_{|y|\le r}(y^1)^4\,dy=\pi^2r^8/32\) follows by radial integration of the fourth angular moment. Use \(\chi=1\) on \(s\le a/2\) and \(1\le\Omega\le2\) on the entire cap to obtain
\[
 \frac{3}{2^{17}}a^{16}\le\delta_\gamma(\mathrm{id})
       \le\frac{3}{16}a^{16}.
\]
This order is \(\epsilon^2a^8=\tau^2a^4\). It refers to the frozen-metric energy evaluated on the round identity. The round deficit of that map vanishes exactly.

The fixed physical measure can also be centered by a round trial map. In the stereographic identification take the fifth coordinate to be \(x^5=(1-s^2)/(1+s^2)\). The other four are odd under the corresponding \(y^i\)-reflection. The radial metric \(\rho^2\delta\) has inversion-invariant volume and \(x^5\) is odd under \(s\mapsto 1/s\), so the identity's fifth moment for it vanishes. The factor \(\sqrt{1-t^2}\) in \(dV_g\) reduces the volume within \(s\le a\), where \(x^5>0\). With \(d\mu_g=dV_g/\operatorname{Vol}(g)\), the identity's fifth \(\mu_g\)-moment \(M(0)\) is therefore strictly negative. On \(1/2\le s\le1\) the density relative to \(dy\) is \((1+s^2)^{-4}\ge1/16\), so \(\operatorname{Vol}(g)\ge15\pi^2/512\). The bound \(1-\sqrt{1-t^2}\le t^2\) and the same ball moment give \(|M(0)|\le (16/15)a^{16}\).

Let \(\phi_\lambda\) be \(y\mapsto\lambda y\), \(\lambda=e^{-u}\). The other four moments still vanish. The fifth moment \(M(u)=\int (x^5\circ\phi_\lambda)\,d\mu_g\) has derivative with integrand \(4\lambda^2s^2/(1+\lambda^2s^2)^2\), at least \(1/16\) on that annulus if \(0\le u\le\log 2\). Since \(\operatorname{Vol}(g)\le V_0\) by \(\rho\le\Omega\) and \(\sqrt{1-t^2}\le1\), \(M'(u)\ge45/65536\) there. Consequently \(M(u)=0\) for some \(0<u\le 2^{11}|M(0)|<2^{12}a^{16}\). This trial map has \(\delta_q(\phi_\lambda)=0\), and
\[
 \delta_\gamma(\phi_\lambda)
   =\int L_\lambda^4[\Phi(t^2)-1]\,d\mu_q,\qquad
 L_\lambda=\lambda\frac{1+s^2}{1+\lambda^2 s^2}.
\]
Indeed \(L_\lambda\) is the round conformal dilation of \(\phi_\lambda\) and \(\int L_\lambda^4\,d\mu_q=1\). For \(1/2\le\lambda\le1\), \(L_\lambda\in[1/2,2]\), so
\[
     \frac{3}{2^{21}}a^{16}\le\delta_\gamma(\phi_\lambda)\le3a^{16}.
\]
A fixed target reflection gives the same trial in degree \(-1\) with the same energies and centering. That map is realized by smooth generators, which can be made \(L^2\)-orthonormal by common scaling. Its energy gives an upper bound on the centered **map deficit** infimum, with no estimate on a realizing pair's \(R\) from this trial. The round deficit infimum over centered kernel maps is exactly zero. [Kernel realization](E13_SPINOR_PENCIL.md) · [Common normalization](CENTERED_EXTREMA.md)

Without centering, the frozen-metric deficit infimum is also zero. Let \(\lambda\) decrease to zero in the same formula. Then \(L_\lambda\le\lambda(1+a^2)\) on the support of \(t\). At fixed \(g\) the fifth moment converges to \(1\) by dominated convergence, so this sequence lies outside the centered class.

## Transfer and precision

For a smooth \(|\deg f|=1\) map, in a \(q\)-orthonormal frame put \(B=(df)^*df\), \(S=\operatorname{tr} B/4\) and \(F_q=S^2-\sigma J_q\), with \(\sigma=\deg f\) and \(J_q\) the signed Jacobian. For the four eigenvalues \(b_i\) of \(B\), apply AM–GM to \(b_i b_j,b_k b_l\) in each pair partition. Averaging gives \(\sqrt{\det B}\le\sum_{i<j}b_i b_j/6\). Hence \(|B-SI|^2\le12F_q\). Write \(G^{-1}=I+D\), \(c=\operatorname{tr}D/4=t^2/[2(1-t^2)]\) and \(d=D:(B-SI)/4\). Since \(|D|_{\mathrm{HS}}\le2|t|\) on \(|t|\le1/4\), \(|d|\le\sqrt3|t|\sqrt{F_q}\). Subtract the common signed Jacobian density in the two metrics. Using \(\sqrt{\det G}(1+c)^2=\Phi(t^2)\ge1\), the frozen-metric deficit density in \(\mu_q\) satisfies
\[
 \sqrt{\det G}\big[(1+c)S+d\big]^2-\sigma J_q
 \ge F_q-4|t|S\sqrt{F_q}
 \ge \tfrac12 F_q-8t^2S^2 .
\]
Integrating yields \(\delta_q\le2\delta_\gamma+16\tau^2\int_{s\le a} S^2\,d\mu_q\). This comparison leaves the centering measure unchanged.

For a centered \(f\), write \(dV_g=(w/16)dV_q\). The factor \(w\) equals one off the two round caps \(s\le2a\) and \(s\ge(2a)^{-1}\). On them \(|w-1|\le32a^2\), using \((1+4a^2)^4-1\le32a^2\) and the determinant factor above. Their joint \(\mu_q\)-mass is at most \(96a^4\) by \(\Omega\le2\) and round inversion. Thus \(m=\int f\,d\mu_q=\int f(1-w)\,d\mu_q\) has norm at most \(3072a^6\). The first positive eigenvalue \(4\) gives \(\int S\,d\mu_q\ge1-|m|^2\). Expanding \((S-1)^2\) gives \(\int(S-1)^2\,d\mu_q\le\delta_q+2|m|^2\). The cap \(s\le a\) has measure at most \(3a^4\), and \(2|m|^2\le a^4\) for the frozen \(a\). Therefore \(\int_{s\le a}S^2\,d\mu_q\le2(4a^4+\delta_q)\). Absorbing \(32\tau^2\delta_q\) gives
\[
             \delta_q(f)\le 4\delta_\gamma(f)+256a^{16}.
\]
The only spectral input here is [GLZ v1, §2.1, (2.1), (2.7)](https://arxiv.org/pdf/2305.19886v1#page=5). In particular a centered sequence approaching the infimum of \(\delta_\gamma\) has \(\limsup\delta_q\le268a^{16}\). The upper bound does not force a positive round deficit.

For a centered pencil the [determinant estimate](BALANCED_SPECTRAL_BOUND.md) gives \(\delta_\gamma\le(102/\sqrt{V_0})\sqrt{1+\delta_\gamma}\sqrt R\). Thus the round Möbius theorem by substitution bounds the derivative distance above by \(C_5(4\delta_\gamma+256a^{16})\) in the fourth power. The error persists as \(R\to0\), the constant is unspecified, and matching a Möbius map can hold exactly for a centered kernel map even with positive frozen-metric deficit. A certified positive lower bound for \(b(g)\) requires another estimate detecting the anisotropy in derivatives with that precision. The [fixed-metric qualitative theorem](FIXED_METRIC_GAP.md) gives positivity by a different argument.
