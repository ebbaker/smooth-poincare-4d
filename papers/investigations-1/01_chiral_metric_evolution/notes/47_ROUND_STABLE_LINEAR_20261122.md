# SP4-CME-E47 — The round stability operator and forced evolution

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Configured helper `gpt-6.2-sol` / `ultra`. Independently introspected runtime and lead settings are unavailable. This packet proves a linear result on the fixed round sphere. The [request][request] records the frozen hashes, all matched. The [B35 decision][b35] fixes the gauge.

## Round conventions and exact Hessian

Let \(A_0\) be the perfect chiral connection on the smooth compact, closed, oriented round Riemannian four-sphere. Use Fine's metric \(g_0=g(A_0)\), native flow time and the internal positive pairing from the negative Killing form. All quantities use one fixed positive curvature scale \(\kappa\) for \(g_0\). If a round representative is given before the curvature-volume normalization, use the induced native round representative for the operator and its norms. Thus \(F_0:E\to\Lambda^+\) is a fiber isometry when \(E\) is the internal bundle in Fine's identification. Let \(d_0=d_{A_0}\), \(S_0(u)=\iota_u F_0\), and \(\Delta_0=(\nabla^{g_0})^*\nabla^{g_0}\) on vector fields. All adjoints below use the indicated fixed metrics. [Fine v2, Definitions 1.4–1.5 and Lemma 2.2][fine].

Write \(L_0(T)_{ij}=((T_i,F_{0j})+(T_j,F_{0i}))/2\) and \(\Pi_0=\operatorname{tf}\) on symmetric endomorphisms. Since \(\operatorname{tr}Q=3\) and the curvature volume integrates to a fixed topological quantity, Fine's energy has the form

\[
 \mathcal E(A)=8\pi^2 p_1(E)[S^4]+\int_{S^4}|Q(A)-I|^2\,d\mu_A .
\]

At \(A_0\), \(Q=I\) and \(\delta_0Q[b]=2\Pi_0L_0(d_0 b)\). Both derivatives of the squared term at perfection give

\[
 \operatorname{Hess}_{A_0}\mathcal E(b,c)=2(\delta_0Q[b],\delta_0Q[c])_{L^2(g_0)}
 =8 (\Pi_0L_0d_0 b,\Pi_0L_0d_0 c)_{L^2(g_0)} . \tag{1}
\]

The full linearization of the negative gradient at this critical point is therefore \(-d_0^*P_0^*P_0d_0\) with \(\boxed{P_0=\sqrt8\,\Pi_0L_0}\). Derivatives of the gradient pairing drop out because the gradient at the reference is zero. This agrees with (4.5), where the restriction of \(\Theta_0\) to trace-free symmetric endomorphisms is \(8I\) and the positive square root is used. Proposition 4.12's proof on pp. 38–39 prints an inverse square root in its reference back to (4.5). The displayed (4.5) and (1) fix the normalization. Both factors give the same kernel at perfection. [Fine v2, Proposition 1.12, (3.1)–(3.3), Proposition 4.2 and (4.5)][fine].

In B35 the two fixed differential gauge expressions vanish at \(a=A-A_0=0\). Their linearizations are exactly \(-d_0d_0^*b\) and \(-S_0\Delta_0S_0^*b\). Thus the negative of the full adjusted linearization is precisely

\[
 G_0=d_0^*P_0^*P_0d_0+ S_0\Delta_0S_0^*+d_0d_0^* . \tag{2}
\]

The same fixed operator occurs in Fine's Proposition 4.12. This comparison concerns only the operator at the reference. [B35][b35]. [Fine v2, equation (4.9) and Proposition 4.12][fine].

## Strong symbol and vanishing kernel

For \(\xi\ne0\), denote wedge by \(\xi\) from zero-forms to one-forms by \(w_0\), and from one-forms to two-forms by \(w_1\). Put \(H_\xi=P_0w_1\). The symbol of \(G_0\) in the convention \(\partial_i\mapsto i\xi_i\) has quadratic form

\[
 |H_\xi b|^2+|\xi|_{g_0}^2|S_0^*b|^2+|w_0^*b|^2 . \tag{3}
\]

The map \(H_\xi\) is onto \(S^2_0E\). Indeed projecting \(\xi\wedge\xi^\perp\) onto \(\Lambda^+\) is an isomorphism, and the remaining symmetrization and removal of trace are onto. Its kernel contains both \(\mathrm{im}\,w_0\) and \(\mathrm{im}\,S_0\). The first inclusion is the wedge-square identity. For the second, contract the zero five-form \(\xi\wedge F_{0i}\wedge F_{0j}\) by \(u\) and use \(F_{0i}\wedge F_{0j}=\delta_{ij}d\mu_0\). In the convention for \(L_0\) above this gives \(L_0(\xi\wedge\iota_uF_0)=\tfrac12\xi(u)I\), which is killed by \(\Pi_0\). The two images intersect only at zero. If \(u\ne0\), the three covectors \(\iota_u F_{0i}\) span \(u^\perp\), whereas each component of \(w_0 e\) is in \(\mathbb R\xi\). Their dimensions are four and three, whose sum equals the dimension of \(\ker H_\xi\). Hence the simultaneous nullspace in (3) is zero. Compactness of the unit covector and unit amplitude bundles gives a uniform positive lower bound after factoring out \(|\xi|^2\). This is strong ellipticity for the operator in (2), by the symbol argument of Fine's Lemmas 3.5 and 4.9. [Fine v2, pp. 20–22, 34–35][fine].

Integration by parts gives the exact quadratic form

\[
 \langle G_0 b,b\rangle=\|P_0d_0b\|_2^2+\|\nabla^{g_0}(S_0^*b)\|_2^2+\|d_0^*b\|_2^2 . \tag{4}
\]

The terms are symmetric by polarization. For an element of the kernel, elliptic regularity gives a smooth section, and (4) gives vanishing of all three terms. Then \(S_0^*b\) is parallel, and the positive constant sectional curvature implies it is zero. For if \(v\) is parallel and nonzero at a point, taking \(Y=v\) and \(X\perp v\) gives \(R(X,Y)v=\kappa |v|^2 X\ne0\).

Thus \(b\in V=\ker S_0^*\). Under the parallel isometry in Lemma 2.2, Fine's Lemmas 3.7–3.9 and §3.4 identify \(V\otimes\mathbb C=S^-\otimes\operatorname{Sym}^3 S^+\). The operator \((\delta_0Q,d_0^*)\) on \(V\) is the twisted Dirac \(D^-\) up to invertible constant rescalings on the two target summands. Specifically the two parallel symbol projections are the symmetric trace-free self-dual projection of the exterior derivative and the divergence. Their allowable target scalings are nonzero by ellipticity, and the operators are the parallel maps composed with the same Levi-Civita derivative, so this is a kernel identification at the operator level. By (1) and (4) this gives \(D^-b=0\). Fine's Proposition 4.12 invokes Theorem 3.13 here. Its compact, oriented, anti-self-dual Einstein and nonzero scalar curvature hypotheses hold on the round sphere, since \(W^+=0\), \(\mathrm{Ric}=3\kappa g_0\), and scalar curvature is \(12\kappa\). In Fine the Dirac/twistor link in Theorem 3.11 cites Hitchin [18], Theorem 4.1(ii), and Theorem 3.13 attributes the positive case to LeBrun [25] and the negative case to Horan [20]. The round vanishing can also be derived directly as follows. [Fine v2, §§3.4 and 3.6, Theorems 3.11 and 3.13, Proposition 4.12][fine].

The round sphere is spin. Set \(W=\operatorname{Sym}^3S^+\), with its induced connection. In a normal orthonormal frame, write \(c_i=c(e_i)\), \(c_i c_j+c_j c_i=-2\delta_{ij}\). Squaring the twisted spin Dirac and grouping mixed derivatives yields the rough Laplacian plus \(\sum_{i<j}c_ic_j(R^{S}_{ij}\otimes I+I\otimes R^W_{ij})\). The spin connection represents the round curvature by \(R^{S}_{ij}=-\kappa c_ic_j/2\), obtained from \(\tfrac14\sum_{a,b}(R(e_i,e_j)e_a,e_b)c_ac_b\). The spin term therefore contributes \(3\kappa I\). The \(S^+\) curvature is a self-dual two-form in its base covectors, since the round curvature operator is \(\kappa I\) on two-forms and the anti-self-dual action on \(S^+\) is zero. The same self-duality holds for the induced \(W\) curvature. Clifford action of self-dual two-forms vanishes on \(S^-\), so the twisting term is zero on \(S^-\otimes W\). Restricting the square to that summand gives \((D^-)^*D^-=\nabla^*\nabla+3\kappa I\). Integration by parts now gives \(\ker D^-=0\) for the round operator, proving \(\ker G_0=0\) on this sphere.

## Realization and Sobolev scale

Strong ellipticity gives \(q[b]:=\langle G_0b,b\rangle\ge c\|Db\|_2^2-C\|b\|_2^2\) for any fixed smooth comparison derivative \(D\). For this version of Gårding, freeze the leading coefficient and density on a small chart and use (3) by Plancherel. The smooth coefficient errors are absorbed after shrinking the chart. A squared partition of unity cancels first cutoff cross terms in the quadratic principal part, and bounded lower-order and cutoff terms are absorbed by Young's inequality with a multiple of \(\|b\|_2^2\). Combining with \(q[b]\ge0\) proves \(\|b\|_2^2+q[b]\asymp\|b\|_{H^1}^2\). The closed symmetric form of \(I+G_0\) thus gives its positive self-adjoint realization on \(L^2\). More explicitly, its weak inverse exists by coercivity on \(H^1\). That inverse is a symmetric bounded map \(L^2\to H^1\), compact as an \(L^2\) map, so it has an orthonormal eigenbasis with positive eigenvalues tending to zero. [Related fixed-bundle construction in E29][e29].

For the required regularity and norm comparisons, freezing the smooth coefficients and using the second-order Fourier estimate on small charts gives \(\|b\|_{H^{s+2}}\lesssim\|G_0b\|_{H^s}+\|b\|_2\) for nonnegative integral \(s\). At \(s=0\) absorb the small leading variation and the lower term \(\|b\|_{H^1}\) by interpolation. At higher orders commute spatial derivatives in the charts, yielding terms of order at most \(s+1\) with bounded smooth coefficients, and absorb likewise. For weak \(H^1\) solutions with \(G_0b\in L^2\), the initial local \(H^2\) estimate follows by taking a spatial difference quotient in the weak form and testing with a cutoff times that difference quotient. Terms from differentiating coefficients are bounded by the known \(H^1\) norm and a small part of the energy. Move the forcing's difference quotient onto the test, where its norm is bounded by the norm of the test gradient. Gårding before letting the increment go to zero gives interior \(H^2\), and higher-order regularity follows by differentiation. Thus the realization has domain \(H^2\), smooth core and smooth eigenvectors. The spectrum consists of eigenvalues \(\lambda_j\ge0\) tending to infinity. Kernel vanishing and the compact inverse give \(\lambda_1=\inf\operatorname{spec}G_0>0\).

Set \(J=I+G_0\), \(\|u\|_{\mathcal H^s}=\|J^{s/2}u\|_2\). At even integer orders, iterating the elliptic estimate for \(J\) and its bounded inverse gives equivalence to geometric Sobolev norms. At order \(2k+1\), use

\[
 \|J^{k+1/2}u\|_2^2=\|J^ku\|_2^2+q[J^ku]\asymp\|J^ku\|_{H^1}^2
 \asymp \|u\|_{H^{2k+1}}^2 .
\]

These comparisons extend by density and give the claimed graph scale with the fixed geometric norms.

## Half-line isomorphism

Fix integer \(m\ge6\) and \(0<\alpha<\lambda_1\). For \(a_t+G_0a=f\) set \(b=e^{\alpha t}a\), \(g=e^{\alpha t}f\), and \(B=G_0-\alpha I\). Then \(b_t+Bb=g\) and \(B\ge\theta J\) in the spectral order, with \(\theta=(\lambda_1-\alpha)/(1+\lambda_1)>0\). In a finite spectral projection, solve the scalar evolution equations with the projected data and pair with \(J^m b\). For a.e. time,

\[
 \tfrac12\frac{d}{dt}\|b\|_{\mathcal H^m}^2+\theta\|b\|_{\mathcal H^{m+1}}^2
 \le \|g\|_{\mathcal H^{m-1}}\|b\|_{\mathcal H^{m+1}} . \tag{5}
\]

Apply Young's inequality, integrate and take the sup over time. Since \(B:\mathcal H^{m+1}\to\mathcal H^{m-1}\) is bounded, the equation also controls \(\|b_t\|_{L^2\mathcal H^{m-1}}\). Apply the same estimate to differences of spectral truncations. For projected data converging in \(\mathcal H^m\oplus L^2\mathcal H^{m-1}\), this gives convergence in \(C_b([0,\infty);\mathcal H^m)\), \(L^2\mathcal H^{m+1}\), and with the time derivative in \(L^2\mathcal H^{m-1}\). The projection solutions have the prescribed strong trace and solve their equations, so the limit has the prescribed trace and solves in distributions. Uniqueness follows by projection, since every component solves its scalar absolutely continuous equation with its trace. Finally \(e^{\alpha t}a_t=b_t-\alpha b\). In equivalent geometric norms the conclusion is

\[
 \sup_{t\ge0}e^{\alpha t}\|a(t)\|_{H^m}
  +\|e^{\alpha t}a\|_{L^2H^{m+1}}
  +\|e^{\alpha t}a_t\|_{L^2H^{m-1}}
 \le C\bigl(\|a_0\|_{H^m}+\|e^{\alpha t}f\|_{L^2H^{m-1}}\bigr). \tag{6}
\]

For the full solution space, \(b\in L^2\mathcal H^{m+1}\) with distributional \(b_t\in L^2\mathcal H^{m-1}\) is a closed graph condition and hence complete. The continuous trace follows directly from this graph norm. For finite projections \(v\) of \(b\), integrate \(d\|v\|_{\mathcal H^m}^2/dt=2\operatorname{Re}\langle J^{(m-1)/2}v_t,J^{(m+1)/2}v\rangle\) to a sequence tending to infinity where \(\|v\|_{\mathcal H^m}\to0\). Then \(\sup\|v\|_{\mathcal H^m}^2\le2\|v_t\|_{L^2\mathcal H^{m-1}}\|v\|_{L^2\mathcal H^{m+1}}\). Applying it to the difference of two projections gives uniform convergence to a continuous representative, including at zero. It also shows this representative tends to zero at infinity, since each finite projection does. Multiplication by \(e^{\alpha t}\) identifies the weighted solution space with this graph space, using the bounded term \(\alpha b\). Therefore the operator-and-trace map \(a\mapsto(a_t+G_0a,a(0))\) is bounded with bounded inverse between the indicated complete solution and forcing-plus-data spaces.

## Trace in Fine's displayed anisotropic space

The frozen PDF p. 39 prints the squared \(P_{2k}\) norm \(\sum_{j=0}^k\|e^{\alpha t}\partial_t^j a\|_{L^2H^{2(k-j)}}^2\). It also prints a trace into \(L_k^2=H^k\), and uses \(P_{2k-2}\times L_k^2\) as the target of the asserted derivative isomorphism, pp. 39–40. The terms \(j=0,1\) and the graph trace argument above with \(m=2k-1\) give a bounded trace into \(H^{2k-1}\) for the displayed norm. This is the actual trace space on the round sphere. Indeed every datum in \(H^{2k-1}\) has the extension \(a=e^{-tG_0}a_0\). Integrating the \(j\)th time derivative mode contributes a factor \((1+\lambda)^{2(k-j)}\lambda^{2j}/[2(\lambda-\alpha)]\lesssim(1+\lambda)^{2k-1}\). Smooth finite spectral truncations followed by a smooth cutoff far out in time verify that the extension belongs to the displayed completion. Thus for \(k\ge3\) the trace map to \(H^k\) is continuous, but the asserted derivative isomorphism with that target is not surjective. For example forcing zero and datum in \(H^k\setminus H^{2k-1}\) cannot have a preimage. This is a specific mismatch between the printed spaces and the printed isomorphism. Estimate (6) uses the proved trace rather than that isomorphism. The nonlinear stability statements of §4.3 are outside this packet. [Fine v2, Theorem 4.13 proof, pp. 39–40][fine].

## Primary-version record

Joel Fine, *A gauge theoretic approach to the anti-self-dual Einstein equations*, arXiv:1111.5005v2, 29 November 2011. Inspected selected passages on 22 November 2026, America/New_York. Checked Definitions 1.4–1.5 (pp. 4–5), Proposition 1.12 (p. 9), Lemma 2.2 (p. 12), (3.1)–(3.3) (pp. 17–18), Lemma 3.5 and §3.4 (pp. 21–24), the round index remark and Theorems 3.11 and 3.13 (§3.6, pp. 25–29), Proposition 4.2 (p. 30), (4.5) and Lemma 4.9 (pp. 32–35), and §4.3 (pp. 37–40). Visually verified the displayed equations and trace notation on rendered local pp. 28, 33 and 38–40. The Hitchin, LeBrun and Horan entries were identified from Fine's bibliography on p. 51, with no independent import of their papers. The existing ignored root copy is 447930 bytes with SHA-256 `d92e0dca0fd864beab3f416ef80d998fa421c9fdf68854b3f21490c3da7139c8`. It was re-identified without replacement. Original retrieval date and original transfer URL remain unavailable. [Primary PDF version][fine]. [Prior canonical provenance][canonical].

[request]: ../research-progress/handoffs/SP4-CME-E47_REQUEST_v1.md
[b35]: ../brainstorm/notes/B35_FIXED_STABILITY_GAUGE_20261122.md
[e29]: 29_LOCAL_PARABOLIC_INPUT_20261122.md
[fine]: https://arxiv.org/pdf/1111.5005v2
[canonical]: ../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md#fixed-reference-stability-follow-up
