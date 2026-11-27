# E05 · A uniform bending bound for one entering class

27 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. The [frozen request r1](../research-progress/handoffs/E05_REQUEST_R1.md) names GPT-6.2 Sol/ultra as the requested execution setting. Actual serving model and effort are unavailable. This is an analytical proof and a replay of the stated recognition implication. The companion marked recognition result retains its working-theorem status.

Inputs at HEAD `bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0` include the [B01 cap and S5 choices](../brainstorm/notes/B02_B01_BOUNDARY_CHOICES_20261127.md), the [parent TeX](../../manuscript/cuts_of_subcritical_conformal_classes.tex) (SHA-256 `ccb52d6a2548fb8fbddbab4ab01b9aea3d9cc560bbec477c86e7273a389d7fb0`) and the [05 marked-cut TeX](../../../05_collar_deformation_and_surgery/02_handle_isolation_and_marked_surgery/manuscript/recognition_from_marked_handle_cuts.tex) (SHA-256 `556753cbb5f4d73b962f597bb9ca96f43edbe15ff14c6d5330d8ac4b408afeab`). Source passages inspected on 27 November 2026 are listed below.

## The constant

Fix a smooth entering class on a closed, connected, oriented smooth homotopy four-sphere \(M\). Its gauges are positive-definite Riemannian metrics. The curvature operator of the unit sphere is the identity, the energies of the real chiral blocks are \(E_\pm=\int|W^\pm|^2_{\mathrm{HS}}\), and the entering threshold is \(e=E_+=E_-<2T\) with \(T=4\pi^2\) and positive Yamabe type. Fix one smooth entering gauge \(g\) and a smooth isometric embedding \(F:(M,g)\hookrightarrow\mathbb R^{3+m}\) with \(m\ge2\). Nash's compact embedding theorem allows \(3+m=46\). For a chosen lower-dimensional embedding one may add zero coordinates to ensure \(m\ge2\).

Write \(\mathrm{II}_F\) for the Euclidean normal-valued second fundamental form of \(F(M)\), and \(\omega_j\) for the volume of the Euclidean unit \(j\)-ball. Define
\[
\begin{aligned}
 p_g&=\min_{x\in M,\ |\nu|_g=1}\big(R_g(x)-2\operatorname{Ric}_g(\nu,\nu)\big)>0,\\
 K_F&=\max_{x\in M,\ L\in\operatorname{Gr}_3(T_xM)}
                    |\operatorname{tr}_{L}\mathrm{II}_F|<\infty,\\
 b_m&=3\left(\frac{(m+3)\omega_{m+3}}{m\omega_m}\right)^{1/3},\\
 C(g,F)&=\frac{b_m^2}{\max\{2,K_F^2/p_g\}}>0.
\end{aligned}
\]
For every smooth closed cut \(\Sigma\subset M\) with induced metric \(h\), let \(H=\operatorname{tr}_hB\), \(B(X,Y)=g(\nabla_X\nu,Y)\), \(B^\circ=B-\tfrac13Hh\), and \(P_g(\nu)=R_g-2\operatorname{Ric}_g(\nu,\nu)\). Then
\[
\begin{split}
 S_g(\Sigma)&:=\inf_{u\in C^\infty(\Sigma,\mathbb R),\ u\ne0}
 \frac{\int_\Sigma\{8|\nabla u|^2+(P_g(\nu)+\tfrac23H^2)u^2\}\,d\mu_h}
 {\|u\|_{L^6(h)}^2}\ \ge C(g,F),\\
 Y(\Sigma,[h])&\ \ge C(g,F)-\|B^\circ\|_{L^3(h)}^2.
\end{split}
\]
Thus the strict condition \(\|B^\circ\|_{L^3(h)}<\sqrt{C(g,F)}\) gives a smooth positive-scalar-curvature metric on \(\Sigma\) in \([h]\).

## Replay of Theorem 4.1 and proof

The parent entering-gauge lemma uses \(\chi(M)=2\), \(\tau(M)=0\), and
\(\int_M\sigma_2(A)=T-e/2>0\) for its normalized Schouten tensor
\(A=\tfrac12(\operatorname{Ric}-Rg/6)\). In the Chang–Gursky–Yang source, the Schouten tensor is \(2A\) and the Weyl terms are full tensor norms, with \(\tfrac14|W^\pm|_{\mathrm{tensor}}^2=|W^\pm|_{\mathrm{HS}}^2\). Theorem A and Corollary B therefore apply with positive Yamabe constant and positive integrated \(\sigma_2(2A)\). They give a smooth conformal metric with \(\sigma_2(A)>0\) and \(R>0\). In that gauge \(Z=\operatorname{Ric}-Rg/4\) satisfies \(\sigma_2(A)=R^2/96-|Z|^2/8\), so \(|Z|<R/(2\sqrt3)\). The trace-free eigenvalue bound \(\max_i|z_i|\le(\sqrt3/2)|Z|\) follows by writing each \(z_i=-\sum_{j\ne i}z_j\) and applying Cauchy–Schwarz. Hence \(0<\operatorname{Ric}(\nu,\nu)<R/2\) at every unit vector and compactness of the unit sphere bundle gives \(p_g>0\). One may use the explicit lower estimate \(p_g\ge\min_M(R/2-\sqrt3|Z|)>0\). [Chang–Gursky–Yang, Theorem A and Corollary B](https://arxiv.org/pdf/math/0409583#page=4)

A cut is a closed connected embedded hypersurface. Since \(H_3(M;\mathbb Z_2)=0\), its mod-two intersection number with every loop vanishes. A nonseparating or one-sided hypersurface admits a loop crossing it once, so a cut separates and is two-sided. A choice of side gives its outward unit normal and the normal-first orientation. Reversing the normal changes the signs of \(H\) and \(B^\circ\) and leaves the scalar and norm expressions unchanged.

The ambient scalar trace over the tangent three-plane is \(R_g-2\operatorname{Ric}_g(\nu,\nu)\). The extrinsic term in the scalar Gauss equation is \(H^2-|B|^2=2\sigma_2(B)=\tfrac23H^2-|B^\circ|^2\). Thus
\[
 R_h=P_g(\nu)+\tfrac23H^2-|B^\circ|^2.
\]
This gives Theorem 4.1(1), including equality in \(2\sigma_2(B)\ge0\), and gives (2) in the entering gauge since umbilicity is conformally invariant. Theorem 4.1(3) uses the three-dimensional conformal Laplacian \(-8\Delta_h+R_h\) with \(\Delta_h=\operatorname{div}_h\nabla\). Its Rayleigh quotient with the \(L^6\) denominator is bounded from below by \(S_g(\Sigma)-\|B^\circ\|_3^2\), since
\[
 \int_\Sigma |B^\circ|^2u^2\,d\mu_h
       \le \||B^\circ|^2\|_{3/2}\|u^2\|_3
       =\|B^\circ\|_3^2\|u\|_6^2.
\]
Taking the infimum over positive smooth \(u\) gives this lower bound for \(Y(\Sigma,[h])\). A strictly positive bound gives a positive first eigenvalue of the conformal Laplacian by \(\|u\|_6^2\ge\operatorname{Vol}_h(\Sigma)^{-2/3}\|u\|_2^2\). The smooth positive first eigenfunction \(\phi\) gives scalar curvature \(\phi^{-5}(-8\Delta_h+R_h)\phi>0\) for \(\phi^4 h\). [Conformal scalar-curvature law and quotient, Lee–Parker, equations (1.1), (1.4) and (1.5)](https://users.math.msu.edu/users/parker/YamabeProblem.pdf)

For the lower bound on \(S_g\), the image \(F(\Sigma)\) is a smooth compact embedded three-manifold without boundary. Its Euclidean mean curvature vector \(\mathcal H_E\) is the full trace. With the parent's convention on \(B\), the second fundamental form of \(\Sigma\) in \(M\), as a normal-valued tensor obtained by projecting \(\nabla_XY\), equals \(-B(X,Y)\nu\). Consequently the two Euclidean normal components give
\[
 \mathcal H_E=-H\,dF(\nu)+\operatorname{tr}_{T\Sigma}\mathrm{II}_F,
 \qquad |\mathcal H_E|^2=H^2+|\operatorname{tr}_{T\Sigma}\mathrm{II}_F|^2.
\]
The first component lies in \(dF(TM)\), and the second is normal to \(F(M)\). Smoothness of \(F\) and compactness of the bundle of tangent three-planes give the single \(K_F\) for all cuts.

Brendle's Theorem 1 in dimension \(3\) gives
\[
 b_m\left(\int_\Sigma f^{3/2}\,d\mu_h\right)^{2/3}
 \le\int_\Sigma\sqrt{|\nabla f|^2+|\mathcal H_E|^2 f^2}\,d\mu_h .
\]
It applies first to \(f=u^4+\varepsilon\) for \(\varepsilon>0\); compactness and smoothness allow \(\varepsilon\downarrow0\) for any smooth real \(u\). Cauchy–Schwarz then yields
\[
 b_m\|u\|_6^4
 \le \int_\Sigma |u|^3
       \sqrt{16|\nabla u|^2+|\mathcal H_E|^2u^2}\,d\mu_h
 \le \|u\|_6^3
       \left(\int_\Sigma(16|\nabla u|^2+|\mathcal H_E|^2u^2)\,d\mu_h\right)^{1/2}.
\]
Divide for \(u\ne0\) and square. The coefficients in the integral are bounded by \(\max\{2,K_F^2/p_g\}\) times those in the numerator of \(S_g\), using \(16/8=2\), \(1/(2/3)=3/2\), and \(K_F^2\le (K_F^2/p_g)P_g\). This proves the claim. There is no restriction on the volume of \(\Sigma\) or the support of \(u\). [Brendle, Theorem 1 and §2](https://arxiv.org/pdf/1907.09446)

## Uniformity and the marked hypothesis

- **Cuts.** The bound is simultaneous over all smooth closed embedded cuts for the fixed pair \((g,F)\). Mean curvature, volume, intrinsic topology and isotopy class can vary. The analytical argument requires a compact ambient manifold with \(P_g\ge p_g>0\) and a smooth isometric Euclidean embedding. The homotopy-sphere and chiral hypotheses supply the entering gauge and the topology used in recognition.
- **Representatives of one class.** For a fixed embedded \(\Sigma\) and \(\widehat g=e^{2w}g\), we have \(\widehat h=e^{2w}h\), \(\widehat B^\circ=e^wB^\circ\) as a covariant tensor, and \(|\widehat B^\circ|_{\widehat h}^3d\mu_{\widehat h}=|B^\circ|_h^3d\mu_h\). The Gauss identity writes the numerator of \(S_g\) as the Yamabe quadratic form plus \(\int|B^\circ|^2u^2\). The substitution \(\widehat u=e^{-w/2}u\) preserves the Yamabe form, the additional integral and the \(L^6\) norm. Thus \(S_{\widehat g}(\Sigma)=S_g(\Sigma)\) even if \(\widehat g\) is only a smooth representative of the fixed class. The bound from one pair \((g,F)\) therefore certifies the invariant quantities in every representative. The numerical expression \(C(g,F)\) uses its own choice of gauge and embedding. Simultaneously scaling \(g\) to \(\lambda^2 g\) and \(F\) to \(\lambda F\) preserves that expression, since \(p_g\) and \(K_F^2\) scale by \(\lambda^{-2}\).
- **Embeddings and different classes.** One fixed embedding suffices. Any family with \(m\) bounded and \(K_F^2/p_g\) bounded admits a common positive constant by the displayed formula. Arbitrary isometric embeddings need not satisfy this control, even for fixed \(g\) and fixed Euclidean dimension. For a nonconstant coordinate \(f\) of \(F\), replace the corresponding Euclidean coordinate line by the unit-speed embedded helix \(t\mapsto(\sqrt{1-a^2}\,t,a\cos(kt)/k,a\sin(kt)/k)\) for \(0<a<1\). This gives smooth isometric embeddings into one common \(\mathbb R^{N+2}\). The new normal component of the trace over \(L\) has magnitude \(ak|\nabla_L f|^2\), orthogonal to the original trace component. At a point where \(df\ne0\) take \(L\) containing \(\nabla f\). This gives \(K_F\to\infty\) for the new embeddings and the resulting expressions tend to zero. The intrinsic uniform bound supplied by the original choice is still positive. The entering-band assumptions used here supply \(p_g>0\) for each chosen gauge and the estimate supplies no common numerical bound across arbitrary entering classes.
- **Marked isotopy.** The same constant applies to every image along a smooth marked isotopy in the fixed class. The value of the bending integral can change when the submanifold moves. The recognition implication needs an abstract diffeomorphism between the supplied cut and \(Z_a\). It needs the actual attaching, closing and boundary data of the original mixed presentation when applying the topological theorem to that presentation.

## Replay of Corollary 4.4

The setting is an actual reduced mixed presentation of the same closed smooth homotopy four-sphere, with handle counts \((1,1,2,1,1)\) and lower signed winding row \((1,0)\) after the stated framed slides, order and orientation choices. The marked \(Z_a\) is the actual outgoing boundary after attaching the winding-one handle first to the lower rank-one body. The working theorem \(\texttt{thm:mixed}\), “The two normalized mixed cuts,” in the [05 marked-cut TeX](../../../05_collar_deformation_and_surgery/02_handle_isolation_and_marked_surgery/manuscript/recognition_from_marked_handle_cuts.tex) applies with the transported upper gluing and these original markings. The signed winding one kills \(\pi_1=\mathbb Z\) and gives a unit integral cellular boundary from the unique 2-handle to the unique 1-handle. Its lower trace is smooth, simply connected and acyclic, hence contractible, and \(Z_a\) is an integral homology sphere.

A smooth closed hypersurface diffeomorphic to \(Z_a\) with the strict bending bound gives \(Z_a\) a positive scalar curvature metric by transport. The identity map makes it PSC-dominated in the exact sense of 05. Thus the working theorem gives \(Z_a\cong S^3\) and \(M\cong S^4\). The boundary assertion also follows directly from the positive metric and contractible smooth filling via Chodosh–Maximo–Mukherjee, Corollary 2.3 and Proposition 4.2. The conclusion about \(M\) uses the working marked recognition theorem for the actual intermediate cut. A separate smooth embedding realizing the cut topology can supply the metric on \(Z_a\), without carrying either attached side. In the umbilic case Theorem 4.1(2) supplies positive scalar curvature directly, as in the parent Corollary 4.4. [Chodosh–Maximo–Mukherjee, Corollary 2.3 and Proposition 4.2](https://arxiv.org/pdf/2407.05574v1) · [04 marked recognition proof, §3, TeX tag \(\texttt{thm:mixed}\)](../../../04_hypersurface_immersions/02_two_handle_recognition/manuscript/recognition_from_marked_morse_heights.tex)

In particular, under that working recognition theorem, a nonstandard \(M\) in this presentation class would have \(\inf_{\Sigma\cong Z_a}\|B^\circ\|_{L^3(\Sigma)}\ge\sqrt{C(g,F)}\), with the infimum taken over smooth embedded copies in the fixed entering class. B03 still needs to decide what would supply a cut meeting the bound and assess the status of the recognition premise.

## Inspected primary passages

| Source and inspection | Input used |
| --- | --- |
| Simon Brendle, *The isoperimetric inequality for a minimal submanifold in Euclidean space*, J. Amer. Math. Soc. 34 (2021), 595–603, DOI 10.1090/jams/969. Checked [author preprint arXiv:1907.09446v4](https://arxiv.org/pdf/1907.09446), dated 6 October 2020, §1 Theorem 1 and §2 opening. | Compact Euclidean submanifold of dimension \(n\), codimension \(m\ge2\), possible boundary, positive smooth weight. The coefficient is \(n[((n+m)\omega_{n+m})/(m\omega_m)]^{1/n}\); the boundary term vanishes on closed \(\Sigma\); §2 specifies the full-trace mean curvature vector. |
| John Nash, *The Imbedding Problem for Riemannian Manifolds*, Ann. of Math. 63 (1956), 20–63. Checked [article reproduction, Part C, Theorem 2, printed p. 59](https://mccuan.math.gatech.edu/courses/6455/nash55.pdf#page=40). | Compact \(n\)-manifold with positive \(C^k\) metric, \(3\le k\le\infty\), has a \(C^k\) isometric Euclidean embedding in dimension \(n(3n+11)/2\). Applied with \(n=4\) and \(k=\infty\). |
| S.-Y. A. Chang, M. J. Gursky and P. C. Yang, *An equation of Monge–Ampère type in conformal geometry, and four-manifolds of positive Ricci curvature*, Ann. of Math. 155 (2002), 709–787. Checked [author version arXiv:math/0409583v1](https://arxiv.org/pdf/math/0409583#page=4), (0.1)–(0.3), Theorem A, Corollary B, and curvature-integral passage, pp. 709–713. | Positive Yamabe constant and positive integrated \(\sigma_2\) in their normalization give the smooth conformal gauge. Their curvature-integral formulas reconcile the chiral and Schouten factors. |
| J. M. Lee and T. H. Parker, *The Yamabe problem*, Bull. Amer. Math. Soc. (N.S.) 17 (1987), 37–91. Checked [author-hosted journal text](https://users.math.msu.edu/users/parker/YamabeProblem.pdf), §§1–2, (1.1), (1.4), (1.5), (2.7). | Scalar-curvature transformation, conformal covariance, and the Yamabe quotient on a closed Riemannian manifold, with the source's nonnegative-sign Laplacian. |
| O. Chodosh, D. Maximo and A. Mukherjee, *Complete Riemannian 4-manifolds with uniformly positive scalar curvature*. Checked [arXiv:2407.05574v1](https://arxiv.org/pdf/2407.05574v1), dated 8 July 2024, Proposition 2.2, p. 4, Corollary 2.3, p. 5, and Proposition 4.2, p. 10. | PSC gives the stated decomposition of an integral homology three-sphere, and a nonempty signed sum of Poincaré spheres cannot bound a smooth compact contractible four-manifold. The conclusion about the filling in Proposition 4.2 is topological. |
| Edward B. Baker III, [05 marked-cut TeX](../../../05_collar_deformation_and_surgery/02_handle_isolation_and_marked_surgery/manuscript/recognition_from_marked_handle_cuts.tex) §3, \(\texttt{thm:mixed}\), and [04 marked-height TeX](../../../04_hypersurface_immersions/02_two_handle_recognition/manuscript/recognition_from_marked_morse_heights.tex), \(\texttt{thm:mixed}\) (SHA-256 `9681e2deb71434b7e6036ce8d3db9b6a10e4f6d530406948e30bc8b74b1a15d9`). | Checked the exact presentation, definition of PSC-domination and invocation of marked recognition on the actual boundary. Retained the working theorem as the premise for the smooth four-dimensional recognition. |
