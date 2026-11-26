# Prescribed-seam and Mazur reflection check

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. The E01 issue requested GPT-6.2 Sol/ultra. Actual serving model and reasoning effort were unavailable. This is a bounded analytical replay from working HEAD `1c81a3048c8c`, with the [frozen issue](../research-progress/handoffs/FIRST_ASSEMBLY_ISSUE_20261126.md) at blob `aa97267bec13`. The marked-double, boundary-class and eta-zero sections were at blobs `7af8da38430d`, `c316b250fa83` and `0b048ceb66a6`. The [source map](../references/README.md) records the inputs and the [register](../research-progress/REGISTER.md) owns task status.

**Result.** A smooth entering class requires a strictly positive first eigenvalue of the seam operator in the prescribed seam data. The product-circle face passes this test. The smooth reflected Mazur double cannot have both positive Yamabe sign and closed chiral energy below $8\pi^2$ in a swap-invariant class. The standalone Robin sign at the prescribed eta-zero face remains unresolved in the inspected sources.

## The strict test and its covariance

Let $M$ be a closed, connected, oriented smooth homotopy four-sphere with a smooth Riemannian metric $g$. Use $\Delta=\operatorname{div}\nabla$, and let $E_\pm$ use the Hilbert–Schmidt norms of the Weyl operators on real chiral two-forms. Put $e=E_+(g;M)=E_-(g;M)$ by signature zero. For $A=(\operatorname{Ric}-Rg/6)/2$, Chern–Gauss–Bonnet gives $4\int_M\sigma_2(g^{-1}A)\,dV=16\pi^2-2e$. Chang–Gursky–Yang's Schouten tensor is $2A$, so the signs of the integrated $\sigma_2$ conditions agree. If $Y(M,[g])>0$ and $e<8\pi^2$, Corollary B supplies a smooth representative $\hat g$ with $R_{\hat g}-2\operatorname{Ric}_{\hat g}(\nu,\nu)>0$ for every $\hat g$-unit normal. [Master conventions](../../../master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex) · [Chang–Gursky–Yang, (0.2), Theorem A and Corollary B](https://arxiv.org/pdf/math/0409583v1#page=4)

On a smooth closed two-sided hypersurface $Y\subset M$, let $h=g|_{TY}$, $B(X,Z)=g(\nabla_X\nu,Z)$, $H=\operatorname{tr}_hB$, and $B^\circ=B-Hh/3$. Summing the tangential Gauss identities gives

$$
 R_h=R_g-2\operatorname{Ric}_g(\nu,\nu)+H^2-|B|_h^2,
 \qquad H^2-|B|_h^2=\tfrac23H^2-|B^\circ|_h^2.
$$

Consequently $R_{\hat h}+|\hat B^\circ|_{\hat h}^2>0$ throughout $Y$. The operator $P_{h,B}=-8\Delta_h+R_h+|B^\circ|_h^2$ has strictly positive quadratic form $Q_{\hat h,\hat B}$ in the hatted data, with a uniform positive Rayleigh lower bound by compactness.

For an ambient change $\hat g=b^2g$, $b>0$, the normal is $\hat\nu=b^{-1}\nu$. The transformed connection gives

$$
 \hat B=b(B+\nu(\log b)h),\qquad
 \hat H=b^{-1}(H+3\nu(\log b)),\qquad
 \hat B^\circ=bB^\circ .
$$

Write $v=(b|_Y)^{1/2}$, so $\hat h=v^4h$, $dA_{\hat h}=v^6dA_h$, and $|\hat B^\circ|_{\hat h}^2=v^{-4}|B^\circ|_h^2$. The three-dimensional scalar conformal law is $(-8\Delta_{\hat h}+R_{\hat h})u=v^{-5}(-8\Delta_h+R_h)(vu)$. The bending term has the same weight. Hence

$$
 P_{\hat h,\hat B}u=v^{-5}P_{h,B}(vu),\qquad
 \int_Y uP_{\hat h,\hat B}u\,dA_{\hat h}=\int_Y (vu)P_{h,B}(vu)\,dA_h .
$$

Multiplication by $v$ is an isomorphism of $H^1(Y)$, and both $v$ and $v^{-1}$ are bounded. The first-eigenvalue sign is therefore invariant, and the prescribed $P_{h,B}$ must satisfy $\lambda_1(P_{h,B})>0$. The trace-free form vanishes throughout the conformal class whenever it vanishes in one representative. An umbilic seam in an entering class thus has a positive-scalar-curvature representative in its **induced** conformal class. [Inherited seam argument](../../../master/reviews/DIRECT_ENTRY_AND_REDUCIBLE_CUT_PRIORITIES_20261126.md#a-change-to-the-master-entry-problem)

For a three-dimensional Yamabe minimizer $\phi$ with $\|\phi\|_{L^6}=1$, the inequality $Q_{h,B}(\phi)>0$ and Hölder give

$$
 0<Y(Y,[h])+\int_Y |B^\circ|^2\phi^2\,dA_h
 \le Y(Y,[h])+\left(\int_Y |B^\circ|^3\,dA_h\right)^{2/3} .
$$

For constant $R_h<0$, the test $u=1$ separately gives $\int_Y |B^\circ|^2\,dA_h>-R_h\operatorname{Vol}(Y,h)$. Both tests apply at every collar width.

## The product-circle face

For $h=ds^2+g_{S^2(1)}$ with $s$ arclength on a circle of any positive length, $R_h=2$. Thus $\lambda_1(P_{h,B})\ge2$ for any smooth bending, with equality for an umbilic germ. In the master model the seam is $C_\rho\times S^2(1)\subset\mathbb H^2(-1)\times S^2(1)$, $\rho>0$. Its principal curvatures are $(\kappa,0,0)$ with $|\kappa|=\partial_\rho\log\sinh\rho=\coth\rho$, so $|B^\circ|^2=2\kappa^2/3$. The potential is constant and the constant eigenfunction realizes

$$
 \lambda_1(P_{h,B})=2+\tfrac23\coth^2\rho>0 .
$$

This local test passes for either normal sign. The product-cap lower bound still depends on the signed normal germ in disk Gauss–Bonnet and exceeds the whole closed budget. [Product-cap model, “The cost of a product circle cap”](../../../master/01_fixed_type_variational_descent/manuscript/fixed_type_chiral_energy_descent.tex)

## Reflection and the half-budget

Let $W$ be a smooth compact oriented contractible four-manifold. Its boundary is an integral homology sphere by Lefschetz duality. If $\partial W$ is an umbilic seam of an entering class, the induced positive-scalar-curvature (PSC) representative allows only $S^3$ or an oriented connected sum of Poincaré spheres by Corollary 2.3. Proposition 4.2 forces the sum to be empty because $W$ is smooth and contractible. The conclusion identifies the boundary smoothly. The same proposition identifies the filling topologically with $B^4$. [Chodosh–Maximo–Mukherjee, v1, Corollary 2.3, Lemma 4.1 and Proposition 4.2](https://arxiv.org/pdf/2407.05574v1)

For $W=W^-(0,3)$ the marked half in Figure 37 at $n=1$ has boundary $\Sigma(2,5,7)$ up to orientation. Here $1/2+1/5+1/7=59/70<1$. Milnor's theorem and corollary give a finite circle-bundle cover over a closed surface of genus at least two, so the boundary has infinite fundamental group. The identity double $D=W\cup_{\rm id}(-W)$ is the standard smooth sphere by Isoshima's Theorem 3.3. The obstruction below uses only the homotopy-sphere topology of the double, the marked boundary and the swap. [Marked example](../../04_hypersurface_immersions/01_immersed_handle_constructions/manuscript/marked_double_exterior.tex) · [Akbulut–Kirby, Proposition 1 and Theorem 2(1)](https://math.berkeley.edu/~kirby/papers/Akbulut%20and%20Kirby%20-%20Mazur%20manifolds%20-%20MR0544597.pdf) · [Isoshima, v2, Figure 37 and Theorem 3.3](https://arxiv.org/pdf/2403.17356v2) · [Milnor, Theorem 2.7 and Corollary 6.6](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/milnbries.pdf)

If $\iota$ is the smooth swap and $\iota^*[g]=[g]$, then $(g+\iota^*g)/2$ is an invariant smooth representative of $[g]$. The swap fixes the seam pointwise and reverses its normal, so $B=0$ there. Umbilicity survives passage to the Chang–Gursky–Yang representative. An entering class would therefore force $\Sigma(2,5,7)\cong S^3$, a contradiction. The obstruction holds for any swap-invariant positive class on this marked double, independent of collar width and of the choice of induced boundary class.

On the invariant representative, $\iota$ reverses orientation, so its pullback exchanges the Hodge star eigenspaces and their Weyl blocks. The seam has zero four-volume. Hence $E_\pm(D)=E_+(W)+E_-(W)$ with the half marked in its original orientation. Every swap-invariant positive class on $D$ thus has $E_+(W)+E_-(W)\ge8\pi^2$. This also rules out a smooth PSC totally geodesic half below the strict budget. In a Fermi collar its tangential metric has $\partial_t h_0=0$, so even reflection is $C^2$, including tangential derivatives. Smooth $C^2$-approximation on the compact double followed by averaging with the swap preserves positivity and the strict budget for sufficiently small error. The [eta-zero filling section](../../04_hypersurface_immersions/01_immersed_handle_constructions/manuscript/eta_zero_filling.tex) supplies the stronger inherited approximation by smooth metrics with an exact product seam germ.

## The prescribed boundary and the Robin sign

In the actual eta-zero family $\gamma(v)=(e^1)^2+(e^2)^2+v^2(e^3)^2$, the orthonormal cyclic bracket constants are $(a/v,a/v,-av)$ with $a>0$. For constants $(c_1,c_2,c_3)$ the Ricci diagonal from Koszul is $\operatorname{Ric}_{ii}=\tfrac12(c_i^2-(c_j-c_k)^2)$ with cyclic indices. Summing gives $R_{\gamma(v)}=-a^2(2+v^2/2)$. Since $v_*^2=\sqrt{159}/11-1$ lies strictly between $0$ and $2/11$, this is a negative constant at the prescribed face. For $B^\circ=0$, the first seam eigenvalue equals $R_{\gamma(v_*)}<0$. Any entering completion with that induced metric must instead satisfy the strict constant-test bound

$$
 \int_Y |B^\circ|^2\,dA_{\gamma(v_*)}
 > a^2(2+v_*^2/2)\operatorname{Vol}(Y,\gamma(v_*)) .
$$

The four-dimensional Robin form controls PSC filling with zero boundary mean curvature. For a smooth PSC extension $g$ of the exact $\gamma(v_*)$ on $W$, let $J_g=-6\Delta_g+R_g$, take $H_g$ to be the outward trace, and let $\mathcal N_g f=\partial_\nu u_f$ for $J_gu_f=0$, $u_f|_Y=f$. The Dirichlet form is positive. If $u=u_f+w$ with $w|_Y=0$, integration by parts yields

$$
 Q_g^{\rm Rob}(u)=6\langle f,\mathcal N_g f\rangle
 +2\int_Y H_g f^2\,dA_\gamma
 +\int_W(6|dw|^2+R_gw^2)\,dV_g .
$$

Strict positivity of the trace term for all nonzero $f\in H^{1/2}(Y)$ is equivalent to strict positivity of the Robin form. By the compact Robin spectral problem, the first eigenfunction $u>0$ then has positive eigenvalue and satisfies $3\partial_\nu u+H_gu=0$. The metric $u^2g$ has positive scalar curvature and zero boundary mean curvature. Bär–Hanke's boundary deformation applies with target second fundamental form zero, since the target and initial forms have trace zero. It gives a PSC totally geodesic filling with the induced class $[\gamma(v_*)]$. Conversely, normalize a PSC totally geodesic filling conformally to the exact boundary metric. The quadratic Robin sign is preserved by the conformal covariance of $J_g$ and $6\partial_\nu+2H_g$. The resulting positive Dirichlet problem $J_gw=1$, $w|_Y=1$, gives $w>0$ by the maximum principle for the positive Dirichlet realization. The metric $w^2g$ preserves the exact boundary metric, has PSC and retains the positive Robin sign. [Boundary trace criterion](../../04_hypersurface_immersions/01_immersed_handle_constructions/manuscript/boundary_class.tex) · [Bär–Hanke, v5, Definition 3.1 and Theorem 3.7](https://arxiv.org/pdf/2012.09127v5)

Sweeney's Proposition 1.2 applies to this Mazur half and gives a PSC metric with mean-convex boundary in some induced class. Shi–Wang–Wei's Theorem 1.1 supplies a PSC extension of the prescribed metric, with the range of controlled mean curvatures in Remark 2.1 only bounded above by an unspecified constant. Neither result supplies the positive Robin trace form at the eta-zero face. For a totally geodesic PSC half the Gauss term is $R_g-2\operatorname{Ric}_g(\nu,\nu)$. The strict entry obstruction uses the positive sign furnished by Chang–Gursky–Yang in the presence of the four-dimensional Weyl budget. [Sweeney, v1, Proposition 1.2](https://arxiv.org/html/2507.15719v1) · [Shi–Wang–Wei, v3, Theorem 1.1 and Remark 2.1](https://arxiv.org/pdf/2007.06756v3)
