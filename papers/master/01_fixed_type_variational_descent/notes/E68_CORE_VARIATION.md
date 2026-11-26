# E68a v1 · A localized variational test on the charged disk

25 November 2026 (America/New_York, 26 November UTC). Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E execution on the actual E61 marking. The frozen transitive TeX prefixes are eaf123254a7eb391 (master) and d9a6557377462fd3 (descent). The requested helper configuration was GPT-6.2 Sol/ultra. Actual serving model and effort are unavailable. The packet gives a finite-index variational test, a quantitative necessary condition on the supplied minimizing sequence, and a separate local obstruction model. [E63–E67 receipt](../../research-progress/handoffs/E63_E67_BALANCED_DISKS_20261125.md) · [E61 selected disk](../manuscript/spectral_windows.tex) · [E63 connector](E63_CONNECTED_REPAIR.md) · [E65 enlargement](../manuscript/balanced_exterior.tex) · [Proposed manuscript proof](../manuscript/core_variation.tex)

## The actual interior test

Let \(M\) be the fixed oriented smooth homotopy four-sphere, \(T=4\pi^2\), \(I=I^+(M)<2T\), and \(g_i\) the smooth, volume-one positive Yamabe metrics with \(e_i=E_\pm(g_i)\to I\). The chiral energies use the Hilbert–Schmidt norm of the real Weyl endomorphisms. Take \(U_i\) strictly inside the E61 marked disk, or inside the E65 enlargement if measuring a larger support. The metric perturbation has compact support in \(U_i\). Its smooth type and orientation are fixed by the identity on \(M\). The signed exterior cost is exactly zero. Any layer inside \(U_i\) used to make the direction compactly supported is included in the cost.

For a smooth \(g\)-self-adjoint trace-free endomorphism \(A\) supported in \(U\), set
\[
 N=\|A\|_{\infty,U}+\|\nabla A\|_{4,U}+\|\nabla^2A\|_{2,U},
 \qquad K=\|\mathrm{Rm}_{g}\|_{2,U}.
\]
The norms use \(g\), including the full tensor curvature norm, and are invariant under constant rescaling. Write \(g_t(X,Y)=g(e^{tA}X,Y)\) and \(f(t)=E_s(g_t)\), where \(s\) denotes either chirality. The path preserves \(dV_g\), and equality of the total chiral energies by signature gives equality of the signed local increments on \(U\).

If \(N\le1\), then \(\sup_{|t|\le1}|f^{(j)}(t)|\le D=C(1+K)^2\) for \(1\le j\le4\), with dimension-only \(C\). For the proof, identify the oriented orthonormal bundles by \(e^{-tA/2}\). The difference of Levi-Civita connections \(S_t=\nabla^{g_t}-\nabla^g\) satisfies
\[
 2g_t(S_t(X,Y),Z)=(\nabla_Xg_t)(Y,Z)+(\nabla_Yg_t)(X,Z)-(\nabla_Zg_t)(X,Y).
\]
The mixed curvature is \(R^{g_t}=R^g+d^\nabla S_t+S_t\wedge S_t\). This expresses the Weyl blocks in the common frames as smooth coefficients of \(t,A\) acting on \(R^g,\nabla^2A,(\nabla A)^2\), with a fixed algebraic chiral projection. The coefficients and their first four time derivatives are bounded on \(|t|\le1\), \(\|A\|_\infty\le1\). The Weyl blocks and the indicated derivatives therefore have \(L^2(U,g)\) norms bounded by \(C(K+\|\nabla^2 A\|_2+\|\nabla A\|_4^2)\). Differentiate their squared norms using the common volume form. No derivatives of the background curvature enter this estimate.

For \(e=f(0)\) and \(d=e-I\), take \(t_*=\min\{1,(2T-e)/(2D)\}\). For \(|t|\le t_*\) the energy stays at most \(e+(2T-e)/2\). The first conformal Laplacian eigenvalue is continuous along this smooth same-type path. At a zero eigenvalue its positive eigenfunction gives a scalar-flat representative with \(E_s=2T+\|\mathrm{Ric}\|_2^2/4\) by signature and Gauss–Bonnet. Thus every tested point stays positive and \(f(t)\ge I\). Unit-volume Yamabe replacement at an endpoint preserves the energy. [Source wall](../manuscript/fixed_type_chiral_energy_descent.tex#L120) · [Lee–Parker, §2](https://math.jhu.edu/~js/Math646/lee-parker.yamabe.pdf)

For each \(0<t\le t_*\), choosing the descending sign in the first Taylor expansion gives a saving of at least \(|f'(0)|t-Dt^2/2\). The average of \(f(t)\) and \(f(-t)\) cancels both odd Taylor terms. It gives a saving of at least \(-f''(0)t^2/2-Dt^4/24\) on one sign. Either bound strictly greater than \(d\) produces a contradiction to the infimum at this actual source index. Equivalently,
\[
 |f'(0)|\le d/t+Dt/2,\qquad
 [-f''(0)]_+\le 2d/t^2+Dt^2/12.
\]
Uniform \(K_i\) bounds hold on the E61 marked disk from its measured physical curvature ceiling and on E65 from the full physical curvature budget. The wall margin is uniform on the late sources. Minimizing in \(t\) gives \(O(\sqrt{d_i})\) on both quantities on the critical unit ball and gives zero when \(d_i=0\). For an unnormalized direction the resulting bounds have an extra \(N\) and \(N^2\), respectively.

In the Bach convention of Bahuaud–Guenther–Isenberg–Mazzeo, \(DE_s(g)[gA]=-\tfrac12\int_U\langle B_g,gA\rangle_g\,dV_g\), since \(\int|W|^2_{\rm tens}=8E_s\) on \(M\). The estimate controls the Bach functional dual to the displayed critical norm. The affine Hessian differs from \(f''(0)\) by the first variation \(DE_s(g)[gA^2]\). Conformal invariance removes the trace and the product rule bounds the trace-free part of \(A^2\) by \(CN^2\) in the critical norm. The Hessian lower bound is therefore \( -C N^2\sqrt{d_i}\) in the affine coordinates as well. Pure conformal changes preserve each chiral density and diffeomorphism flows supported in \(U\) preserve the total energy. The norm estimate does not bound the total Bach norm. [Bahuaud–Guenther–Isenberg–Mazzeo, arXiv v1, §1, (1.1) and the preceding formula](https://arxiv.org/html/2508.06633v1#S1) · [E07 variational norm audit](../../notes/E07_BACH_SELECTION.md)

## Actual cutoff width

For a fixed smooth profile \(0\le\chi\le1\) of \(\rho/w\) in the actual transition layer \(C_0\) with smooth collar parameter \(\rho\), match constants smoothly at both edges. The product rule gives
\[
\begin{split}
 N_g(\chi A;U)\le N_g(A;U)+C_\chi\big[&
 w^{-1}\|d\rho\|_{4,C_0}
       \big(\|A\|_{\infty,C_0}+\|\nabla A\|_{4,C_0}\big)\\
 &+\big(w^{-2}\|d\rho\|_{4,C_0}^2+w^{-1}\|\nabla^2\rho\|_{2,C_0}\big)
       \|A\|_{\infty,C_0}\big].
\end{split}
\]
On a smooth physical signed-distance layer the first norm is \(\operatorname{Vol}_g(C_0)^{1/4}\) and the second is the \(L^2\) norm of the parallel-face second fundamental form. The \(w^{-2}\) term is retained at small width. The actual admissible parameter for a direction of cutoff norm \(N>0\) is \(t/N\) at normalized parameter \(t\). Thus small incoming curvature on the chosen collar alone gives neither the size nor the sign of a localized direction. An interior change on an E65 enlargement that falls short of beating \(d_i\) by itself would still have to enter the signed joined and capped comparison. Its gain would have to be shown at the measured support and width. [E65 signed requirement](../manuscript/balanced_exterior.tex)

## Product-germ obstruction

Take \(P=S^2\times S^2\) with its product orientation and the product \(p\) of unit round metrics. Both chiral Weyl spectra are \((2/3,-1/3,-1/3)\), since the curvature operator is one on the factor area forms, zero on the mixed forms, and \(R_p/12=1/3\). Hence each \(E_s(p)=32\pi^2/3\). Also \(\chi(P)=4\), \(\tau(P)=0\), and \(b^+(P)=1\).

For any positive Yamabe class on \(P\), a nonzero self-dual harmonic form supplies \(Y^2\le24E_+\). In detail, at points where \(v=|\omega|>0\), write \(\nabla\omega=\sum_j\alpha_j\otimes\omega_j\) in an orthonormal self-dual frame with \(\omega_1=\omega/v\). The equation \(d\omega=0\) gives \(\sum_j*(\alpha_j\wedge\omega_j)=0\). Each map \(\alpha\mapsto*(\alpha\wedge\omega_j)\) scales length by \(1/\sqrt2\). It follows that \(|dv|^2=|\alpha_1|^2\le2(|\alpha_2|^2+|\alpha_3|^2)\), so \(|\nabla\omega|^2\ge\tfrac32|dv|^2\). The harmonic two-form Weitzenböck inequality is
\[
 \tfrac12\Delta v^2\ge|\nabla\omega|^2+(R/3-2L_+)v^2,
 \qquad L_+=\lambda_{\max}(W^+).
\]
For \(u_\epsilon=(v^2+\epsilon^2)^{1/4}\), the derivative terms in \(\Delta u_\epsilon\) have lower bound zero by the Kato inequality. At \(v=0\) one uses \(d(v^2)=0\). The remaining inequality is
\[
 (-6\Delta+R)u_\epsilon
 \le 6L_+u_\epsilon+R_+\epsilon^2u_\epsilon/(v^2+\epsilon^2).
\]
Test with \(u_\epsilon\) and bound the last integral by \(\epsilon\int R_+\). Use the Yamabe quotient, then let \(\epsilon\to0\) and use the nonzero limiting \(L^4\) norm and \(L_+^2\le(2/3)|W^+|_{\rm HS}^2\). Gauss–Bonnet in a volume-one Yamabe representative gives \(32\pi^2\le2E_++Y^2/24\le3E_+\). Thus \(p\) minimizes both chiral energies on the positive classes of \(P\). This is the product case of Gursky's inequality, proved here with the Hilbert–Schmidt convention. The Annals page verifies the primary metadata and Fu reproduces the theorem in the full-tensor convention. [Gursky, Ann. Math. 148 (1998), 315–337](https://annals.math.princeton.edu/articles/12993) · [Fu, Pacific J. Math. 296 (2018), pp. 80–81](https://msp.org/pjm/2018/296-1/pjm-v296-n1-p05-s.pdf)

If a source metric is conformal to \(p\) in an oriented marked open set containing the support, divide any clamped source path by the fixed source multiplier on that set and extend it by \(p\) on \(P\). The corresponding chiral increments are identical. A strictly lowering endpoint on \(P\) has negative Yamabe sign, since positive sign has the lower bound above and zero sign implies \(E_s\ge16\pi^2\) by Gauss–Bonnet applied to its scalar-flat representative. The path crosses zero sign on \(P\), so any strict lowering on the source requires energy at least \(e+16\pi^2/3\) somewhere on the source path. This rules out clamped improvements below \(2T\) whenever \(e\ge8\pi^2/3\). In particular every clamped first variation vanishes and the clamped Hessian is nonnegative on the germ by positive Yamabe openness on \(P\). The obstruction survives normalization to the physical source Yamabe metric by conformal invariance.

For an illustration in the full source band on standard \(S^4\), paste a product metric into a round normal coordinate ball of radius \(r\), using a cutoff equal to one on a smaller open ball. The normal metric mismatch is \(O(r^2)\), with derivatives \(O(r)\) and \(O(1)\) through order two, so the cutoff path costs \(O(r^4)\). In a disjoint round stereographic box, in its fixed Euclidean conformal gauge, change \(dx_2^2\) to \((1+t\epsilon\chi\cos(Nx_1))^2dx_2^2\), with \(0<\epsilon<1/2\) and \(\chi=1\) on an interior subbox, zero near the exterior. Restore the source multiplier. At \(t=1\) on the subbox this is a surface with curvature \(-a''/a\), \(a=1+\epsilon\cos(Nx_1)\), times a flat plane. Each chiral squared norm is \((a''/a)^2/6\), so the energy tends to infinity. Stop at the first parameter giving any prescribed energy in \([T,2T)\). The path remains positive by the source wall. Pass to a physical Yamabe representative and choose a small closed marked disk strictly inside the conformal product germ. Smoothness gives arbitrarily small full physical curvature on a containing ball, while the interior has positive energy in both signs, with positive exterior charge for a sufficiently small disk. Shrinking the bicollar at that fixed disk gives arbitrarily small incoming curvature relative to its positive charge.

This construction tests the data at a smooth positive source with the measured local charges and ceiling. It supplies no example of a nonstandard minimizing sequence. On the actual E61 disk the hypotheses of the first and second variation tests are measured, but the local data have yielded no lower bound on a strict saving. The product test also leaves unclamped comparisons and independent positivity tests open.
