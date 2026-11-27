# SP4-CUT-SEAM-E02 — Trial cap near the round Cauchy datum

27 November 2026, packet date (America/New_York convention). Prepared for Edward B. Baker III with OpenAI Codex assistance. Requested helper GPT-6.2 Sol/ultra, with actual serving model and effort unavailable. This is a direct estimate and Taylor calculation for a fixed smooth extension. It awaits an independent replay.

Inputs at HEAD `bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0`: [frozen request r1](../research-progress/handoffs/E02_REQUEST_R1.md), SHA-256 `4033f0904c0b888ded8ec518b7c19129aeb5b5fee35b16db9c06728206814a3c`, and [B01 choice](../brainstorm/notes/B02_B01_BOUNDARY_CHOICES_20261127.md), SHA-256 `21d16c5c0c3054a213c15857a4d47e0512837c5d30767ba070d1097fa2a045f4`. [Parent manuscript](../../manuscript/cuts_of_subcritical_conformal_classes.tex), SHA-256 `ccb52d6a2548fb8fbddbab4ab01b9aea3d9cc560bbec477c86e7273a389d7fb0`, supplies the curvature and energy conventions (Sections 1 and 2.1) and the intended use (Proposition 8.1 and Section 9, Problem 4).

## Marked cap and bound

Let \(B^4\) be the smooth oriented unit round hemisphere, with inward normal coordinate \(s\), equator metric \(\gamma\), round metric \(g_0=ds^2+\cos^2(s)\gamma\), and Levi-Civita derivative \(\nabla_0\). Use a fixed smooth boundary marking by \(S^3\) and a representative for which the smooth boundary data are \(h=\gamma+a\) and \(\operatorname{tr}_{h}b=0\). Here \(b(X,Y)=g(\nabla_X\nu,Y)\) is the second fundamental form for the forward seam normal. All metrics, tensors and bundles are real and Riemannian. The curvature operator of the unit sphere is the identity on two-forms.

Define \(\rho(u)=e^{-1/u}\) for \(u>0\) and \(\rho(u)=0\) for \(u\le0\), and set
\[
 \chi(s)=\frac{\rho(1/2-s)}{\rho(1/2-s)+\rho(s-1/4)},\qquad
 q_\sigma=\chi(s)(a+\sigma\,2s b),\qquad
 g_\sigma=g_0+q_\sigma,\qquad \sigma\in\{+1,-1\}.
\]
The formula pulls \(a,b\) back from the equator, with zero radial components, and sets \(q_\sigma=0\) for \(s\ge 1/2\). The denominator of \(\chi\) is positive and \(\chi=1\) on \([0,1/4]\). In particular \(g_\sigma\) is exactly round near the pole, so the polar-coordinate degeneracy does not enter the construction. At the boundary,
\[
 (g_\sigma)_{\mathrm{tan}}=\gamma+a,\qquad
 \tfrac12\partial_s(g_\sigma)_{\mathrm{tan}}=\sigma b .
\]
Indeed, for a metric \(ds^2+h_s\), \(g(\nabla_X\partial_s,Y)=\tfrac12\partial_s h_s(X,Y)\) by metric compatibility and torsion freeness. If the original signed distance \(t\) increases in the forward direction, use \(\sigma=+1\) to cap \(t\le0\) with \(s=t\) across the join, and \(\sigma=-1\) to cap \(t\ge0\) with \(s=-t\). The cap's outward normal is \(-\partial_s\), so the two outward second fundamental forms at either join have opposite signs. Reversing the cap orientation exchanges its chiral blocks and preserves their half-sum.

Write \(|\cdot|_0\) for the pointwise full tensor norm of \(g_0\), including all indices in the sum of squares. Define the explicit extension size
\[
 D_\sigma=\max_{0\le j\le2}\ \sup_{B^4}|\nabla_0^j q_\sigma|_0,\qquad
 D=\max(D_{+1},D_{-1}).
\]
This defines a norm of the pair \((a,b)\) because the extension and its first normal derivative recover the data. On the fixed slice \(s=1/8\) the two extensions differ by \(b/2\), so restriction to the slice and its fixed round connection control two angular derivatives of \(b\) in terms of \(D\). The statement is in this fixed marking and representative. The result for either sign is
\[
 D_\sigma\le\tfrac1{100}\quad\Longrightarrow\quad
 g_\sigma\text{ smooth and positive definite},\qquad R_{g_\sigma}\ge8,\qquad
 e_{\rm cap}^{\rm trial}(\sigma)
 :=\tfrac12\int_{B^4}(|W^+_{g_\sigma}|_{\rm HS}^2+|W^-_{g_\sigma}|_{\rm HS}^2)\,dV_{g_\sigma}
 \le 3750\pi^2 D_\sigma^2 .
\]
The same statements for both signs hold with \(D\) in place of \(D_\sigma\). In units \(T=4\pi^2\), the energy coefficient is \((1875/2)T\).

### Proof of the nonlinear estimate

Write \(q=q_\sigma\), \(g=g_\sigma\), \(d=D_\sigma\). Initially assume \(d\le1/2\). The eigenvalues of \(g\) relative to \(g_0\) belong to \([1/2,3/2]\). Put \(A=\nabla^g-\nabla_0\), a tensor of type \((1,2)\). The torsion-free metric connection identity in a \(g_0\)-orthonormal frame is
\[
 A^i{}_{jk}=\tfrac12 g^{i\ell}
    \big((\nabla_0)_j q_{k\ell}+(\nabla_0)_k q_{j\ell}-(\nabla_0)_\ell q_{jk}\big).
\]
Each of the three permutations in parentheses has norm at most \(d\). The inverse metric has operator norm at most 2 and \(\nabla_0g^{-1}=-g^{-1}(\nabla_0 q)g^{-1}\) has full tensor norm at most \(4d\). The product rule therefore gives \(|A|_0\le3d\) and \(|\nabla_0 A|_0\le3d+6d^2\).

Use \(R^g(X,Y)=[\nabla_X^g,\nabla_Y^g]-\nabla^g_{[X,Y]}\). Expanding this definition, \(R^g-R^{g_0}\) is the difference of two permutations of \(\nabla_0 A\) plus \(A(X,A(Y,Z))-A(Y,A(X,Z))\) on \(Z\). Each contraction of two copies of \(A\) has full tensor norm bounded by \(|A|_0^2\) by Cauchy–Schwarz. Consequently,
\[
 |R^g-R^{g_0}|_0 \le 6d+30d^2 \le21d .
\]
Let \(K_g(X,Y)Z=g(Y,Z)X-g(X,Z)Y\), so \(R^{g_0}=K_{g_0}\). Each summand of \(K_g-K_{g_0}\) is a permutation of \(q\otimes\operatorname{Id}\), and \(|\operatorname{Id}|_0=2\). Thus \(|R^g-K_g|_0\le25d\). A tensor of type \((1,3)\) satisfies \(|L|_g\le \sqrt{(3/2)2^3}\,|L|_0\le4|L|_0\). Define the residual covariant curvature
\[
 C_g(X,Y,Z,U)=g\big((R^g(X,Y)-K_g(X,Y))U,Z\big).
\]
Lowering the vector index with \(g\) is isometric for the \(g\)-norm. Hence \(|C_g|_g\le100d\). Its scalar contraction in a \(g\)-orthonormal frame is \(R_g-12=\sum_{i,j}(C_g)_{ijij}\). The Cauchy–Schwarz bound for this sum is \(4|C_g|_g\), so \(|R_g-12|\le400d\). This proves \(R_g\ge8\) for \(d\le1/100\), including the boundary.

For an algebraic curvature tensor \(C\) at \(g\), let \(\operatorname{Ric}_g(C)_{jl}=\sum_i C_{ijil}\) in a \(g\)-orthonormal frame and let \(\operatorname{scal}_g(C)\) be its trace. With
\[
 (P\owedge g)_{ijkl}=P_{ik}g_{jl}+P_{jl}g_{ik}-P_{il}g_{jk}-P_{jk}g_{il},
\]
the \(g\)-orthogonal projection to the completely trace-free curvature tensors is
\[
 \Pi_g C=C-\tfrac12\big(\operatorname{Ric}_g(C)-\tfrac{\operatorname{scal}_g(C)}{6}g\big)\owedge g.
\]
For this formula, contraction of \(P\owedge g\) is \(2P+(\operatorname{tr}_g P)g\), and its inner product with a trace-free curvature tensor is zero by the curvature symmetries. In particular the covariant Weyl tensor is \(\Pi_g C_g\), since the covariant curvature of \(K_g\) is \(\tfrac12g\owedge g\). The orthonormal \(e_i\wedge e_j\), \(i<j\), omit the two repeated orders of each alternating pair, so the squared endomorphism norm is one quarter of the full covariant squared norm. The Weyl endomorphism is block diagonal for the Hodge splitting in dimension four. Thus the pointwise energy density is \(\tfrac18|\Pi_g C_g|_g^2\le \tfrac18(100d)^2\). The volume is bounded above by \((3/2)^2\operatorname{Vol}_{g_0}(B^4)=3\pi^2\), using \(dV_{g_0}=\cos^3(s)\,ds\,dV_\gamma\) and \(\operatorname{Vol}(S^3,\gamma)=2\pi^2\). Integration proves the bound.

**Primary passage receipt.** The block property used here is the pointwise decomposition in M. F. Atiyah, N. J. Hitchin and I. M. Singer, *Self-duality in four-dimensional Riemannian geometry*, Proc. R. Soc. Lond. A **362** (1978), 425–461, §1, printed p. 427, Eq. (1.1) and the decomposition immediately following it. It uses an oriented positive-definite four-metric and identifies the two trace-free diagonal blocks as \(W^+\) and \(W^-\). Read visually in the [existing local copy](../../../../../references/Atiyah.pdf), PDF p. 4, for this packet, 27 November 2026. The copy has 11,176,148 bytes and SHA-256 `a4d55168994f0581232305d17397b8a69b5cf5a28b20a8dc8677a04e18394ee6`. The conversion between full tensor and HS norms above is direct. [Published source](https://doi.org/10.1098/rspa.1978.0143).

## Taylor quadrature

Write \((\,\cdot\,)^{\sharp_0}\) for raising one index with \(g_0\), and form the linear connection variation
\[
 \mathcal A(q)(X,Y)=\tfrac12
  \big((\nabla_{0,X}q)(Y,\cdot)+(\nabla_{0,Y}q)(X,\cdot)-(\nabla_0q)(\cdot,X,Y)\big)^{\sharp_0}.
\]
Define
\[
 \begin{split}
 \mathcal L(q)(X,Y,Z,U)={}& g_0\big((\nabla_{0,X}\mathcal A(q))(Y,U)
       -(\nabla_{0,Y}\mathcal A(q))(X,U),Z\big)\\
       &-q(Y,U)g_0(X,Z)+q(X,U)g_0(Y,Z).
 \end{split}
\]
This is the derivative of \(C_{g_0+tq}\) at \(t=0\). The derivative of the lowering metric multiplies the zero base residual, so the two last terms come entirely from varying \(K_g\). The derivative of the covariant Weyl tensor is \(\Pi_0\mathcal L(q)\), with \(\Pi_0=\Pi_{g_0}\), since \(C_{g_0}=0\).

To evaluate \(\mathcal L\) on the collar, set \(f=\cos s\). For \(s\)-independent angular vector fields \(X,Y\), the connection formulas obtained from the round collar metric are
\[
 \nabla_{0,\partial_s}\partial_s=0,\quad
 \nabla_{0,X}\partial_s=\nabla_{0,\partial_s}X=(f'/f)X,\quad
 \nabla_{0,X}Y=\nabla_{\gamma,X}Y-ff'\gamma(X,Y)\partial_s.
\]
With \(U_a=\Pi_0\mathcal L(\chi a)\), \(V_b=\Pi_0\mathcal L(2s\chi b)\), the quadratic Taylor term is
\[
 Q_\sigma(a,b)=\frac18
   \int_0^{1/2}\!\cos^3(s)\!\int_{S^3}
   \big(|U_a|_0^2+|V_b|_0^2+2\sigma\langle U_a,V_b\rangle_0\big)\,dV_\gamma\,ds .
\]
It uses the round contractions and at most two derivatives of the given tensors. The two formulas differ by the sign of their mixed term. The fixed-extension estimate can be sharpened near zero to
\[
 e_{\rm cap}^{\rm trial}(\sigma)=Q_\sigma(a,b)+O(D_\sigma^3).
\]
Indeed the inverse metric differs from \(g_0^{-1}\) by \(O(D_\sigma)\), its first derivative is \(O(D_\sigma)\), and the connection difference and its first derivative differ from \(\mathcal A(q_\sigma)\) and \(\nabla_0\mathcal A(q_\sigma)\) by \(O(D_\sigma^2)\). These facts follow from the connection expression and the differentiated inverse formula above. The curvature identity and subtraction of \(K_g\) then give \(C_g=\mathcal L(q_\sigma)+O(D_\sigma^2)\) uniformly on the compact cap. The projection coefficients, tensor inner product and volume density differ from their round counterparts by \(O(D_\sigma)\), yielding the cubic error by squaring and integrating.

In particular, for any curve of data smooth in the \(C^2\) topology with \(a(0)=b(0)=0\) and \(\operatorname{tr}_{\gamma+a(t)}b(t)=0\),
\[
 e_{\rm cap}^{\rm trial}(\sigma;t)=t^2 Q_\sigma(\dot a(0),\dot b(0))+O(t^3).
\]
Here \(\operatorname{tr}_\gamma\dot b(0)=0\), and the second derivative of the trial energy is \(2Q_\sigma(\dot a(0),\dot b(0))\). For a chiral quadrature, take \(\mathcal W_\sigma'\) to be the endomorphism represented by \(\Pi_0\mathcal L(q_\sigma(\dot a(0),\dot b(0)))\) and \(P_\pm^0=(1\pm *_0)/2\). The \(t^2\) coefficient for \(E_\pm\) is
\[
 \int_{B^4}|P_\pm^0\,\mathcal W_\sigma'\,P_\pm^0|_{\rm HS,0}^2\,dV_{g_0}.
\]
The derivative of \(P_\pm\) contributes zero at this order because the round Weyl tensor vanishes. The half-sum recovers \(Q_\sigma\).

## Scope of the result

The estimate pertains to a specific smooth cap on the standard marked ball for each nearby datum. An infimum of cap energies over an admissible class that contains this metric lies between zero and the trial bound. The Taylor coefficient computed here is for the trial metric. Applying the estimate in Proposition 8.1 requires the matching marked representative on both sides, the capped classes' positivity, and passage to smooth metrics with energies controlled at the strict thresholds used there. The cap construction establishes its own scalar positivity and matches the first jet. A join to a given smooth side with that jet is \(C^{1,1}\) in a common Gaussian collar, with possible jumps of second derivatives. Global positivity and smoothing estimates for the capped manifolds require their own argument.
