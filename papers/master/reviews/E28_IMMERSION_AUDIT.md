# E28 · Independent extrinsic entry check

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E execution under B02. Requested GPT-6.2 Sol/ultra. Actual serving model and reasoning effort were unavailable. Checked HEAD `b3cd11a2b839b6d2cb6262f8210f33d19d6f5a0a` and [E23](../notes/E23_IMMERSION_ENTRY.md) SHA-256 `e1e3245bd95e40a4c4a63ace2f7cf41a02be44fc50773fdc4294a1a14e028b06` under [frozen E28 revision 1](../research-progress/handoffs/E28_IMMERSION_AUDIT.md).

The E23 pointwise bound, immersed Sobolev inequality, and supported negative test hold. A smooth immersion of a smooth closed oriented homotopy four-sphere in Euclidean five-space gives direct smooth recognition under the weak bound \(\|A^\circ\|_{L^4}^2\le2\sqrt6\,\pi\). Universal immersion existence leaves that quantitative bound open. All norms, derivatives and measures in the result are on the oriented induced domain and count each preimage separately.

## Principal curvatures and the sharp constant

Let \(g=F^*g_{\mathrm{Euc}}\), let \(A\) be the shape operator in the orientation-compatible unit normal and set \(H=\operatorname{tr}A\), \(A^\circ=A-HI/4\). In an oriented principal frame the Euclidean Gauss equation gives sectional curvatures \(k_i k_j\) and scalar curvature \(R=H^2-|A|^2=3H^2/4-|A^\circ|^2\). On the paired chiral bases, the two diagonal curvature blocks both have entries \(s_j/2\), with \(s_1=k_1k_2+k_3k_4\) and the other two obtained by the other pairings. The Weyl blocks subtract \(R/12\) from each diagonal entry. Thus

\[
 |W^+|_{\mathrm{HS}}^2=|W^-|_{\mathrm{HS}}^2
 =\tfrac1{12}\sum_{i<j}(s_i-s_j)^2 .
\]

This uses Hilbert–Schmidt norms of the operators on the real chiral two-form bundles. Adding the same constant to the principal curvatures changes all three \(s_i\) by the same number. For the trace-free eigenvalues \(a_j\), put \((x,y,z)=(a_1+a_2,a_1+a_3,a_1+a_4)\) and \(N=\sum_j a_j^2=x^2+y^2+z^2\). The first pair sum is \(a_1a_2+a_3a_4=x^2-N/2\), and similarly for \(y,z\). This yields

\[
 |W^\pm|_{\mathrm{HS}}^2=\tfrac14(x^4+y^4+z^4-N^2/3)\le\tfrac16|A^\circ|^4.
\]

The difference is \((x^2y^2+x^2z^2+y^2z^2)/2\). Equality away from the umbilic locus requires precisely principal trace-free data proportional to \((1,1,-1,-1)\), up to permutation. Such data occur at the origin of a graph with that diagonal Hessian and zero gradient, proving sharpness of the pointwise constant. The rank-two case \((k_1,k_2,0,0)\) gives \(|W^\pm|^2=(k_1k_2)^2/6\), even though the Gauss-map Jacobian \(\det A\) vanishes. The normal Gauss map \(\nu\) has \(TM\simeq\nu^*TS^4\) as oriented bundles, so \(2\deg\nu=\chi(M)=2\). Its signed total Jacobian \(8\pi^2/3\) supplies no pointwise control of the rank-two Weyl density. [Master curvature conventions](../manuscript/chiral_weyl_energy_and_smooth_poincare.tex#L165)

## Immersed Sobolev inequality and recognition at equality

I checked Brendle's arXiv v4, Corollary 2 and §2, including the normalization, contact coverage, determinant bound and shell integration. Compose with the inclusion into \(\mathbb R^6\). The mean curvature vector is the trace of the second fundamental form and has length \(|H|\). The second normal direction contributes zero to that form. On the smooth closed connected domain, rescale a positive smooth weight \(w\) so \(\int \sqrt{|dw|^2+H^2w^2}=4\int w^{4/3}\) and solve

\[
 \operatorname{div}_g(w\nabla u)=4w^{4/3}-\sqrt{|dw|^2+H^2w^2}.
\]

The rescaling is possible because a compact immersion cannot have \(H\equiv0\). Otherwise \(\Delta_g F=0\) would force each component of \(F\) to be constant. The normalized equation has mean-zero right side, and its solution is \(C^{2,\alpha}\) for \(\alpha<1\) by the same Lipschitz right-side argument. For every unit-ball vector \(\xi\), minimize \(u-\langle F,\xi\rangle\) on the domain. The first and second derivative conditions put \(\xi\) in the image of the contact set under \(\Phi(x,v)=dF_x(\nabla u)+v\), for \(v\) in the normal space of the immersion at \(x\). The local Jacobian is \(\det(\nabla^2u-\langle\mathrm{II},v\rangle)\) and lies between zero and \(w^{4/3}\) on that set, by the equation, Cauchy–Schwarz and the trace–determinant inequality. Different preimages of ambient points are distinct points of the normal-bundle domain. The area formula uses their multiplicities for the needed upper bound on ambient covered volume. In codimension two the normal shell fiber for \(\sigma^2<|\Phi|^2<1\) has area at most \(\pi(1-\sigma^2)\). Divide the area bound by \(1-\sigma^2\), let \(\sigma\to1\), and undo the weight normalization. Writing \(\omega_4=\pi^2/2\) gives

\[
 4\omega_4^{1/4}\|w\|_{4/3}\le \int_M\sqrt{|dw|^2+H^2w^2}\,dV_g .
\]

These steps use immersion, compactness and the native domain measure. Injectivity of \(F\) plays no role. The proof gives the inequality without importing an equality classification for immersions. [Brendle, arXiv:1907.09446v4, Corollary 2, §2 and Lemmas 4–6](https://arxiv.org/pdf/1907.09446v4)

Approximate \(|v|^3\) for a smooth real \(v\) by \((v^2+\varepsilon^2)^{3/2}\). Cauchy–Schwarz after the limit gives \(16\sqrt{\omega_4}\|v\|_4^2\le9\|dv\|_2^2+\|Hv\|_2^2\). Set \(K_B=32\sqrt{\omega_4}/3\) and \(B=\|A^\circ\|_4^2\). Multiplying the previous inequality by \(2/3\) and using the full scalar formula gives

\[
 Q_g(v)\ge K_B\|v\|_4^2-\int_M(|A^\circ|^2-H^2/12)v^2,dV_g
 \ge (K_B-B)\|v\|_4^2+\tfrac1{12}\|Hv\|_2^2.
\]

In particular the smaller E23 penalty \(\|(|A^\circ|^2-H^2/12)_+\|_2<K_B\) suffices for \(Y([g])>0\). With the plain penalty, even \(B=K_B\) guarantees positive Yamabe sign: test the last bound on the strictly positive first conformal-Laplacian eigenfunction. Its \(H^2v^2\) integral is positive since \(H\not\equiv0\). No energy threshold follows at that particular Yamabe endpoint from the bound \(E_+\le B^2/6\).

Under \(B\le2\sqrt6\,\pi\), the Yamabe bound has a strictly positive margin because \(2\sqrt6\,\pi<K_B\), and the Weyl inequality gives \(E_+\le4\pi^2\). The full four-index integral equals \(8E_+\) and \(\chi(M)=2\). Chang–Gursky–Yang Theorem A handles strict inequality, with simple connectivity selecting \(S^4\). At equality, among manifolds outside \(S^4\) and \(\mathbb {RP}^4\), Theorem B leaves \(\mathbb {CP}^2\) or a manifold isometrically covered by the round product \(S^3\times S^1\) in the classified conformal metric. The former has \(b_2=1\). The latter cannot be simply connected, because the connected covering would then be trivial. This gives smooth recognition at the inclusive energy threshold, with no Bach-flat hypothesis on the input and no assertion that the input metric is conformally round. The same applies if the exact chiral integral is \(\le4\pi^2\) and the smaller E23 penalty is strictly below \(K_B\). [Chang–Gursky–Yang, Theorems A and B and Remark 2 on the four-index norm](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf#page=3)

The larger weak bound \(B\le4\sqrt3\,\pi\) still gives positive Yamabe sign and the algebraic inequality gives \(E_+\le8\pi^2\). The energy bound is strict if \(B<4\sqrt3\,\pi\) or if the pointwise bound is strict at some point, by continuity. The possible all-point equality in the latter estimate is unclassified here. E23's strict \(B<4\sqrt3\,\pi\) condition therefore suffices for entry.

## Supported negative test and quantifier of immersion existence

On the graph \(\Sigma=(x,y,xy)\subset\mathbb R^3\), direct differentiation gives \(K=-(1+x^2+y^2)^{-2}\) and \(dA=(1+x^2+y^2)^{1/2}\,dx\,dy\). In polar coordinates the parameter unit disk has signed curvature \(-c_0=-2\pi(1-1/\sqrt2)\), and lies inside the ambient radius-two set. The extrinsic distance \(\rho=|(x,y,xy)|\) has \(|d\rho|\le1\). Its \(\rho\le R\) set for \(R\ge2\) lies in \(|x|,|y|\le R, |xy|\le R\). Bound the area density by \(1+|x|+|y|\) there. The first-quadrant part with \(0\le x\le1\) contributes at most \(3R/2+R^2/2\le5R^2/4\). The part with \(1\le x\le R\), \(0\le y\le R/x\), contributes at most \(R\log R+3R^2/2\le5R^2/2\). Thus the four-quadrant total is at most \(16R^2\), as claimed. For the cutoff \(\chi\) linear in \(\log\rho\) between \(2\) and \(2^{N+1}\), its \(N\) dyadic annuli each have \(\int\rho^{-2}dA\le64\). This gives \(\int |d\chi|^2\le64/[N(\log2)^2]\). At \(N=1000\), six times that bound is less than \(c_0\), and \(K\le0\) outside the inner disk. Thus \(6\int|d\chi|^2+2\int K\chi^2\le-c_0\).

On the product graph with the two flat factors the scalar curvature is \(2K\). For test \(v=\chi(x,y)\phi(z/L)\) with a fixed nonzero smooth compactly supported \(\phi\) on the two flat coordinates, the negative two-dimensional term scales as \(-c_0L^2\int \phi^2\), while the flat gradient cost is \(6\int\chi^2\int |d\phi|^2\), independent of \(L\). Choose finite \(L\) large and smooth the cutoff in \(H^1\) inside a fixed larger box. Multiplying the graph height by a cutoff equal to one near the test support preserves its computation. Scaling all ambient coordinates by \(\lambda>0\) multiplies the quadratic form by \(\lambda^2\), so the scaled graph can be inserted into a flattened source graph chart without changing the negative sign. This yields a negative Yamabe class for every such completion on the closed source by extension by zero of the test. Graph interpolation relative to the fixed graph exterior preserves immersion because the horizontal differential is the identity.

For the high-energy patch, at frequency \(k=m\pi/a\) on the fixed cube the two active principal curvatures have product \(\varepsilon_k^2k^2\cos(kx_1)\cos(kx_2)/w_k^4\), where \(w_k^2=1+|Du_k|^2\). Indeed the active metric determinant is \(w_k^2\) and the active second fundamental form is \(D^2_{12}u_k/w_k\). The rank-two Weyl computation and graph volume density then give denominator \(w_k^7\), validating the divergent lower bound in E23 for \(\varepsilon_k=k^{-1/2}\). These graph perturbations are small in \(C^1\) relative to the flattened base and leave the same regular homotopy class. The energy divergence and negative Yamabe examples do not require control of the completion beyond retaining the support. They are statements about possible representatives in each existing class.

Finally \(p_1(TM)=0\) follows from the four-dimensional signature formula and \(H^4(M;\mathbb Z)\simeq\mathbb Z\), while the Euler class has evaluation two. Under an oriented homotopy equivalence with \(S^4\), the corresponding oriented rank-four bundle has clutching data \((h,j)\) for \(v\mapsto u^hv u^j\). Milnor's characteristic class calculation gives the Pontryagin coefficient \(\pm2(h-j)\). Evaluation at a fixed unit vector gives Euler coefficient \(h+j\) up to the fixed orientation convention. The power map on \(S^3\) has this degree because multiplication induces addition on \(\pi_3\). The two classes therefore determine the tangent bundle as the pullback of \(TS^4\), giving \(TM\oplus\mathbb R\) trivial. Smooth a frame and take \((k,n,r)=(4,5,1)\) in Hirsch Theorem 6.1 to realize the bundle data by a smooth immersion. Its equivariant frame criterion provides no estimate on second derivatives. In each regular homotopy class the patch examples rule out automatic quantitative control of representatives, while existence of some controlled immersion on every smooth type is still open. [Hirzebruch, §3, Theorem 3.1](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/hirzpnas.pdf#page=3) · [Milnor, §3, Lemma 3 and proof](https://sites.math.rutgers.edu/~feehan/teaching/math866/milnor7sphere.pdf#page=4) · [Hirsch, §6, Theorems 6.1–6.2](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/hirsch.pdf#page=29)
