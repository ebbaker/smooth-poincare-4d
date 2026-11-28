# WIN-E21 · Independent replay of the fixed-metric centered gap

28 November 2026 UTC, for Edward B. Baker III, with OpenAI Codex assistance. The [frozen request](../research-progress/handoffs/REQUEST_REPLAY_GAP_R1.md) specifies GPT-6.2 Sol / ultra. Actual serving variant and effort are unavailable. Checkout `86b24d9f9c2d6d634236f723eae0de4dd99fc5a7`. The reader did not author the submitted gap proof or its E19/E20 ingredients. This is a mathematical replay with Lean verification pending.

| Input | SHA-256 |
| --- | --- |
| [Fixed-metric gap, revision 1](../notes/FIXED_METRIC_GAP.md) | `5499d2881623a98d59c5d6d65a620b617574316edd83e55d41136c27a21d422c` |
| [E19 weak deficit](../notes/E19_WEAK_DEFICIT.md) | `6bb234f961ce49cffd6d87f519dc1513defac9df7727f9a9ec0ae2d364cbf09d` |
| [E20 regularity and centering](../notes/E20_REGULARITY_AND_CENTER.md) | `1b23d9ba983c8a2d7c329eda820c26736d9fb0bbfac1037a6920cd329a06a5cd` |
| [Determinant estimate](../notes/BALANCED_SPECTRAL_BOUND.md) | `8dff6f0d96d781987d247243c6cd67704b1ea21c61ef810fc0f1409cb1a0250b` |
| [Centered extrema](../notes/CENTERED_EXTREMA.md) | `5ca81169c76e3edec6f097b3eb497db4e6d13da84791ed15e1e84ce45e840b83` |

The fixed-metric characterization and the uniform absolute continuity variant replay. On a closed connected oriented smooth homotopy four-sphere, \(b(g)=0\) precisely in the round conformal class, where an admissible pencil attains zero on each representative. In a fixed non-conformally-round class a family with uniformly absolutely continuous normalized volumes has a strictly positive common lower bound. These are qualitative gap results. Positive attainment and an effective bound below the scalar spectral threshold remain open in this comparison.

## From residue to compactness

Use the unit outward-oriented target \(S^4\subset\mathbb R^5\), Hilbert–Schmidt differential norm, and \(R=\int |Bk|^4/m^4\,dV\) for a unit kernel vector \(k\) and \(m=\|E\|_{\rm op}\). The logarithmic coefficient of the angular mean is \(12R\), whereas \(b(g)\) uses \(\sqrt R\). The admissible centered family is nonempty by the [centered-extrema construction](E18_CENTERED_EXTREMA.md#density-gram-matrix-and-fixed-metric-existence).

For any sequence with \(R_j\to0\), take first the fixed representative \(g\). For the varying conformal family write \(h_j=a_j^2g\) and transport its generators to \(g\) keeping the parameter metric and coordinates. The transport from \(g\) to \(h_j\) scales the spinors by \(a_j^{1/2}\) under the fibre isometry and the twistor norm by \(a_j^{-1/2}\). Thus the kernel map \(f_j\) is unchanged and the fourth power of \(|Bk|/m\) scales by \(a_j^{-4}\), which cancels the volume factor. The transported pencil still generates every fibre. Its Gram and volume centering in \(g\) are unnecessary for the following pointwise estimate. [DIR-E07, conformal covariance][dir07]

In oriented orthonormal frames \(A_j=df_j=S_j+N_j\), with \(S_j\) a similarity of one fixed sign \(\sigma\) or zero, \(S_j\perp N_j\), and \(d_j=|N_j|=2|B_jk|/m_j\). The polynomial \(F(A)=|A|^4-16\sigma\det A\) and its first derivative vanish at \(S_j\). Along \(S_j+tN_j\), the second directional derivative of the norm term has bound \(12|A_j|^2 d_j^2\). The determinant term has bound \(16\cdot12 |A_j|^2d_j^2\) by two-column replacements and \(|S_j+tN_j|\le|A_j|\). Taylor integration over \(0\le t\le1\) gives the factor \(102\), and the deficit is pointwise nonnegative by AM–GM. Using \((\int d_j^4)^{1/2}=4\sqrt{R_j}\), Cauchy–Schwarz and the absolute degree one of the smooth maps, for \(H_j=(\int|df_j|^4\,dV_g)^{1/2}\) and \(V_0=\operatorname{Vol}(S^4)\) this gives
\[
 16V_0\le H_j^2\le16V_0+408H_j\sqrt{R_j},\qquad
 0\le\int_M F(df_j)\,dV_g\le408H_j\sqrt{R_j}.
\]
Thus \(\{f_j\}\) is bounded in extrinsic \(W^{1,4}\) and the deficits tend to zero. Reflexivity, compact embedding into \(L^2\) and subsequence extraction give a weak \(W^{1,4}\), strong \(L^2\) and a.e. limit \(f\) with \(|f|=1\) a.e. The Sobolev chain rule on the sphere-valued limit gives \(f\cdot df=0\) a.e.

At fixed volume measure the strong \(L^2\) limit is centered and therefore nonconstant. For variable volumes put \(\mu_j=dV_{h_j}/\operatorname{Vol}(h_j)\) and suppose \(f=z\) is a unit vector a.e. Then for every \(\eta>0\),
\[
 \int_M |f_j-z|\,d\mu_j\le \eta+2\mu_j(\{|f_j-z|>\eta\}).
\]
The set on the right has \(g\)-volume tending to zero by strong \(L^2\). Uniform absolute continuity gives a zero limit for its \(\mu_j\)-mass. This forces \(\int f_j\,d\mu_j\to z\), contradicting centering. No convergence of \(\mu_j\) is needed. If their densities have \(L^p(dV_g)\) norm at most \(C\) for fixed \(p>1\), Hölder gives \(\mu_j(U)\le C\operatorname{Vol}_g(U)^{1-1/p}\), which suffices.

## The oriented deficit under the weak limit

In a positively oriented source chart of metric matrix \(G\), write \(v=\sqrt{\det G}\), \(z'=z/\max(1,|z|)\) and \(L=D G^{-1/2}\). The coordinate integrand is
\[
 v|L|^4-16\sigma\det[z',D_1,D_2,D_3,D_4].
\]
The second term uses the outward target volume form, with the determinant already expressed relative to coordinate Lebesgue measure. Changing the last four columns from \(D\) to \(L\) multiplies that determinant by \(1/v\). Its absolute value before the change is at most \(v\prod_i s_i(L)\le v|L|^4/16\), since \(|z'|\le1\). Thus the integrand lies between zero and \(2v|L|^4\) for every ambient value and derivative. At fixed \((x,z)\) its first term is convex in \(D\) and its other term is a fixed linear combination of maximal minors. For an affine gradient plus a compactly supported gradient variation the integral of a minor is unchanged, by expanding the wedge of the coordinate differentials and integrating each exact term. Jensen's inequality then gives quasiconvexity.

Multiplying by nonnegative partition functions with compact supports in oriented charts and extending by zero yields Carathéodory integrands defined on the entire coordinate space, with \(0\le L_i(x,z,D)\le C_i|D|^4\). Each coordinate restriction is bounded linear on the ambient Sobolev spaces. Acerbi–Fusco Theorem [II.4], p. 137, applies with \((n,m,p)=(4,5,4)\), using measurability and continuity (II.2), quasiconvexity (II.3) and the nonnegative \(p\)-growth bound (II.6). The finite sum of lower semicontinuity inequalities yields zero limiting deficit. This import uses the combined nonnegative integrand. Weak convergence of the separate signed Jacobian integral is irrelevant. [Acerbi–Fusco, original article, Theorem II.4][af]

With \(df\) tangent to the unit sphere, equality in the singular-value estimate forces either \(df=0\) or four equal positive singular values and \(\sigma J_f>0\). This conclusion retains the orientation information needed for the regularity step even when the weak sequence might otherwise lose degree.

## From the almost-everywhere equality to a diffeomorphism

If \(\sigma<0\), compose with a fixed round reflection. Then \(J>0\) or \(df=0\) a.e., the finite-distortion hypothesis in Goldstein–Hajłasz–Pakzad. Their Theorem 4 applies to the extrinsic \(W^{1,n}\) space for the isometric embedding of the compact smooth oriented target, with both manifolds smooth, oriented, equal-dimensional and without boundary. It yields a continuous representative. The representative stays in \(S^4\) by closedness of the sphere and full support of source volume. By continuity its image near each point lies in a compact subset of a target chart. Smoothly extending chart coordinates by a cutoff and tubular projection permits the Sobolev chain rule, giving local \(W^{1,4}\) in those coordinates. [Goldstein–Hajłasz–Pakzad, authors' arXiv version, pp. 2–3 and Theorem 4][ghp]

In the final published Liimatainen–Salo, Definition 2, p. 352, locally constant Jacobian sign means each coordinate Jacobian is nonnegative or nonpositive a.e. Their Riemannian differential norm is the Hilbert–Schmidt norm divided by \(\sqrt n\), and their \(\operatorname{Det}_g\) is nonnegative volume dilation. For our map the fourth power of the normalized norm and volume dilation are both \(\lambda^4\) at a similarity of scale \(\lambda\), and both are zero at a zero derivative. This is exactly their \(K=1\) condition. Theorem 4.1(3) removes the zero-Jacobian set up to measure zero for the nonconstant map. Theorem 4.4, pp. 355–356, then gives a local \(C^{r+1}\) conformal diffeomorphism for \(n\ge3\) and \(C^r\) metrics, \(r>1\). Apply for arbitrarily large \(r\) to the smooth metrics. The resulting map is a smooth local diffeomorphism, proper by compactness. Its image is open and closed, and properness makes it a covering. Since \(M\) is connected and \(S^4\) simply connected, the covering is a diffeomorphism, including after undoing the reflection. [Liimatainen–Salo, published §4][ls]

Thus a centered sequence of residues tending to zero makes the fixed class conformally round. If there is such a sequence in the round class with a fixed comparison metric and the stated uniformly absolutely continuous centering, its subsequential conformal limit has \(\int|df|^4\,dV_g=16V_0\) by the change of variables formula for the diffeomorphism. The upper and lower estimates for \(H_j^2\) give convergence to that value for \(df_j\). Weak convergence plus norm convergence in the uniformly convex \(L^4\) space of differential tensors gives strong derivative convergence on this subsequence. This argument concerns kernel-map derivatives. In a non-conformally-round class any sequence of representatives with \(b(h_j)\to0\) therefore violates uniform absolute continuity.

## Centered attainment and the perturbed metric

For any given conformally round \(g\), choose an orientation-preserving conformal diffeomorphism \(A\) to the round spatial sphere, reflecting the round sphere if necessary. Write \(k_{\rm rd}\) for the exact round pencil's kernel map, an isometry to the unit parameter sphere. The pushforward of \(dV_g/\operatorname{Vol}(g)\) by \(k_{\rm rd}\circ A\) is nonatomic. For the conformal transformations \(T_a\) of E16, the average \(a\mapsto\int T_a\,d\mu\) extends to the identity on the boundary of the parameter ball by dominated convergence. Any such map has a zero, since normalizing a nowhere-zero average would retract the ball onto its boundary. The resulting \(T\) is orientation preserving by its isotopy to the identity. [E16, target centering](../notes/E16_SPECTRAL_CONTROL.md#centering-a-diffeomorphic-kernel-map)

Set \(H=k_{\rm rd}^{-1}T k_{\rm rd}A\), an oriented conformal diffeomorphism from \(g\) to the spatial round sphere. Spin pullback of the exact round pencil to \(H^*g_{\rm rd}\) followed by conformal twistor transport to \(g\) preserves the exact twistor equation and gives centered kernel \(k_{\rm rd}H\). To impose the Gram condition let \(V=\operatorname{Vol}(g)\) and multiply both sections by \(w=\sqrt{2/V}/m\). The integrated Gram operator becomes \((2/V)\int (I-P_{\ker E_x})\,dV_g=I\), since the traceless part of the kernel projector is half the Hopf-coordinate matrix. At an incidence point \(P_g(w s_k)=w P_gs_k\), as the terms containing \(dw\) multiply \(s_k(x)=0\). This ensures zero residue for the normalized pair on the same metric. An arbitrary lift with this kernel map need not have zero residue. [E20, compatible lift and normalization](../notes/E20_REGULARITY_AND_CENTER.md#a-centered-zero-residue-pencil-on-the-given-representative)

In the specified DIR-E33 control the Hessian of the perturbation gives curvature entries \(R_{1212}=-\epsilon\), \(R_{1313}=+\epsilon\) and zero scalar curvature at the center. Projecting the curvature operator onto the self-dual orthonormal wedge basis gives \(W^+(0)=\operatorname{diag}(-\epsilon/2,\epsilon/2,0)\). Hence for each sufficiently small nonzero \(\epsilon\) the fixed metric is outside the round conformal class and \(b(g_\epsilon)>0\). The argument gives no numerical gap size on this control. [DIR-E33, metric and curvature jet][dir33]

[af]: https://www.academia.edu/95555857/Semicontinuity_problems_in_the_calculus_of_variations
[ghp]: https://arxiv.org/pdf/1705.05773#page=3
[ls]: https://intlpress.com/site/pub/files/_fulltext/journals/mrl/2014/0021/0002/MRL-2014-0021-0002-a011.pdf#page=12
[dir07]: ../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E07_20261124.md
[dir33]: ../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E33_20261124.md#metric-end-and-curvature-jet
