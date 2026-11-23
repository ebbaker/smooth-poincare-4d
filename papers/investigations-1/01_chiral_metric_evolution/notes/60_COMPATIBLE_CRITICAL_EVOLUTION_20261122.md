# SP4-CME-E60 — Compact critical evolution and compatible identification

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Configured helper `gpt-6.2-sol` / `ultra`. Independently introspected runtime and lead settings are unavailable. This is the [B40][b40] nonlinear application of the fixed E57 estimate. All five hashes in the [frozen request][req] matched. No primary source was newly imported or reinspected.

## Setting and conclusion

Let \(M\) be the fixed smooth oriented round Riemannian \(S^4\) with its positive perfect connection \(A_0\) and curvature \(F_0\) on the fixed \(SO(3)\) bundle. Use Fine's native time and internal positive metric from the negative Killing form, with \(\Lambda^+_{g(F)}=\operatorname{span}(F_i)\), \(dV_{g(F)}=\frac13\sum_iF_i\wedge F_i\), and \(Q(F)_{ij}=F_i\wedge F_j/dV_{g(F)}\) in a native orthonormal internal frame. Use the one fixed native round metric \(g_0=g(F_0)\) and its induced fixed reference pairing on \(\mathcal V=(T^*M\oplus\Lambda^2T^*M)\otimes E\), with \(E\) the adjoint bundle. The form norms count each increasing multi-index once. Use the induced metric reference derivative \(D_0\) from \(g_0,A_0\). Keep the E36 fixed sufficiently large \(\lambda\). The variable is \(U=(A-A_0,F-F_0)\), initially an independent pair. Put \(s=1/2\), \(p=8\), and use exactly the E57 localized spaces \(\mathcal B^s,E_T=M_T+H_T\), with the blockwise summed time suprema and the \(L^1_t\mathcal B^{s+2}\) term. Use those atlas, frame, and partition choices also for the finitely many derivative and coefficient tensor bundles. [E36][e36]. [E57][e57].

There exist \(R,\epsilon,T>0\) independent of the data, and a constant \(C\), such that \(\|U_{m in}\|_{\mathcal B^s}\le\epsilon\) determines an E36 distributional solution in the closed radius-\(R\) ball of the E57 path space, unique there, with strong \(\mathcal B^s\) and uniform spatial initial traces. It satisfies \(E_T(U)\le C\|U_{m in}\|_{\mathcal B^s}\) and the analogous Lipschitz difference bound. For **smooth compatible** data this solution equals the previously constructed E42 adjusted pair on the common \([0,T]\). It is smooth through the initial slice in that case and \(F=F_A\). The comparison below proves this without assuming positive-time smoothness of the critical fixed point.

## Source form and the stationary value

With \(a=A-A_0\), set \(g=g(F)\), \(B(F)=4Q(F)-\frac23\operatorname{tr}(Q(F)^2)I\), \(S_F(u)=\iota_uF\), \(\beta=F-F_0+[a\wedge a]/2\), \(C=F-F_A\), and \(\phi=d_A^{*g_0}a\). The actual E36 vector field uses

\[
 W=*_{g}((d_A B(F))\wedge F)-S_FS_F^*d_A^{*g}\beta,
 \qquad A_t=W-d_A\phi+d_A^{*g}C,
 \qquad F_t=d_AW-[F,\phi]-\lambda d_A^{*g}d_AF . \tag{1}
\]

All live adjoints in (1) use \(g(F)\), apart from the specified fixed metric in \(\phi\). Smooth value coefficients include \(g,g^{-1},*,S_F,S_F^*,B\), and the live Christoffel term is affine in \(DF\) with value coefficients. Thus \(W\) is affine in the first jets of the independent pair, since \(\beta\) is algebraic. Applying \(d_A\) to \(W\) gives second jets with value coefficients, and differentiating a coefficient times a first jet gives at most a quadratic first-jet term. The fixed-metric \(d_A\phi\) has a second \(A\)-jet and lower terms. In \(d_A^{*g}C\), the expression \(C=F-F_0-d_{A_0}a-[a\wedge a]/2\) is affine in \(Da\); the derivative of \(C\) gives a second jet, and the Christoffel term multiplying \(C\) is at most quadratic in first jets. Applying \(d_A^{*g}\) to \(d_AF\) likewise gives a second \(F\)-jet and at most quadratic first-jet terms. \([F,\phi]\) is only first order. Conversion to \(D_0\) adds smooth fixed coefficient terms of these same or lower orders. Consequently on a fixed value tube the equation is exactly

\[
 U_t=P^{ij}(x,U)D_{0i}D_{0j}U+h_0(x,U)+h_1(x,U)D_0U
                              +h_2(x,U)[D_0U,D_0U]. \tag{2}
\]

The coefficient maps in (2) are smooth in \((x,U)\); \(h_2\) is a bilinear map on gradient arrays. No first jet enters \(P\). At \(U=0\) perfection gives \(Q=I\) and \(B=2I\), hence \(d_{A_0}B=0\). Also \(\beta=C=\phi=0\) identically, and \(d_{A_0}F_0=0\) by Bianchi. Both rows of (1) vanish for this reference, so \(h_0(x,0)=0\). Set \(P_0(x)=P(x,0)\), \(L_0=P_0^{ij}D_{0i}D_{0j}\), and \(a^{ij}_{P}(x,U)=P^{ij}(x,U)-P_0^{ij}(x)\). E36's completed reference symbol has a uniform positive Hermitian rank-one margin in this fixed pairing for the chosen \(\lambda\). Thus E57 applies to \(L_0\), and (2) has source

\[
 N(U)=a_P(x,U)D_0^2U+h_0(x,U)+h_1(x,U)D_0U+h_2(x,U)[D_0U,D_0U]. \tag{3}
\]

The fixed first- and zeroth-order linear terms are allowed to remain in (3). [E36, order and reference symbol][e36]. [E57][e57].

## Local products, composition, and the short-time contraction

Take a fixed convex fiber tube \(|U|\le2\rho\) inside the definite smooth coefficient region, with \(\rho\) decreased below as needed. To estimate a chart product on the support of the E57 partition function \(\eta_a\), first replace each input by the zero-extended chart coordinates of \(\rho_a U\) using E57's nested cutoff \(\rho_a=1\) on a neighborhood of \(\operatorname{supp}\eta_a\). The norm of this new piece is bounded by the sum of the partition piece norms by E57 (3), and its values remain in the tube since \(0\le\rho_a\le1\) and the fiber frames are orthonormal. Extend the coefficient \(G(x,z)\) in spatial coordinates by a fixed compactly supported cutoff equal to one near \(\operatorname{supp}\eta_a\). This gives a smooth periodic \(G_a(x,z)\) on the prescribed value ball, and does not require a value outside that ball. The fixed baseline \(G_a(x,0)\) is a smooth term with finite inhomogeneous norm. At the end multiply by \(\eta_a\) and sum. Fixed tensor contractions and transitions are smooth multipliers bounded by the same comparisons.

On a chart the E54 difference norm and \(B^s_{8,1}\hookrightarrow L^\infty\) give the product norm bound at order \(s\), for fixed bilinear or multilinear operations. For composition set \(w=u-v\), \(z_\theta=v+\theta w\), using the two cutoff inputs on the torus. The identity \(G_a(x,u)-G_a(x,v)=\int_0^1 D_zG_a(x,z_\theta)w\,d\theta\) gives the \(L^8\) bound by \(C\|w\|_8\), and the spatial increment bound

\[
 \|\delta_h(G_a(\cdot,u)-G_a(\cdot,v))\|_8
 \le C\bigl(\|\delta_h w\|_8+|h|\|w\|_8
          +\|w\|_\infty(\|\delta_h u\|_8+\|\delta_h v\|_8)\bigr). \tag{4}
\]

Indeed the increment hits \(w\), the explicit spatial variable of \(D_z G_a\), or its value argument. The mixed derivative \(D_xD_zG_a\) bounds the second term, and \(D_z^2G_a\) bounds the third. Integrating the increments is valid because \(s<1\) for the \(|h|\) term. Summing the partition then gives the Lipschitz bound \(C(1+\|U\|_{\mathcal B^s}+\|V\|_{\mathcal B^s})\|U-V\|_{\mathcal B^s}\). In particular a coefficient with zero baseline has \(\mathcal B^s\) norm bounded by \(C\|U\|_{\mathcal B^s}\) on a fixed small ball, while general coefficient norms are bounded by their fixed baselines and this perturbation bound. The spatial derivatives implicit in the coefficient constants are fixed smooth derivatives in these charts. [E54, difference norm and products][e54]. [E57, chart comparison (3)][e57].

In the notation of E57, the fixed derivative bounds and interpolation give

\[
 \begin{split}
 \sup_t\|U(t)\|_{\mathcal B^s}&\le M_T(U),\\
 \|D_0^2U\|_{L^1\mathcal B^s}&\le C H_T(U),\\
 \|D_0U\|_{L^2\mathcal B^s}&\le C M_T(U)^{1/2}H_T(U)^{1/2}.
 \end{split} \tag{5}
\]

For the last two estimates differentiate the cutoff reconstruction in each chart and apply the bounded transfer to the derivatives on the source charts. The block derivative bound costs one or two powers of \(2^j\). The \(L^2\) estimate uses \(\|u_a(t)\|_{B^{s+1}}^2\le\|u_a(t)\|_{B^s}\|u_a(t)\|_{B^{s+2}}\), then Cauchy–Schwarz over the finite chart sum. Lower derivative terms are absorbed by the inhomogeneous norms. In particular \(D_0U\in L^2_tL^\infty_x\) and \(D_0^2U\in L^1_tL^\infty_x\), with strongly measurable continuous spatial representatives in the indicated integrability classes. [E54, time interpolation][e54]. [E57][e57].

On the closed \(E_T\) ball of radius \(R\le1\) with values in \(|U|\le\rho\), let \(d=U-V\). For the principal source in (3), its size in \(L^1\mathcal B^s\) is bounded by \(C M_T(U)H_T(U)\). Its difference is bounded by \(C(M_T(U)H_T(d)+M_T(d)H_T(V))\). The quadratic-gradient term uses both gradients in \(L^2\mathcal B^s\); the difference in a gradient slot costs \(C R E_T(d)\), and changing its coefficient costs \(C R^2 E_T(d)\). The bounded first-gradient coefficient and (5) give \(C\sqrt T E_T(d)\) for that term's difference, including changing the coefficient, since \(R\le1\). The difference of the value term is at most \(C T E_T(d)\). Hence with a fixed \(K\ge1\),

\[
 \|N(U)-N(V)\|_{L^1\mathcal B^s}\le K(R+\sqrt T+T)E_T(U-V),
 \qquad N(0)=0 . \tag{6}
\]

Let \(C_L\ge1\) bound the E57 linear solution map uniformly on \(T\le T_{57}\), and let \(C_{\rm emb}\) be a fixed embedding constant into \(C^0\). Take \(0<R\le\min(1,\rho/C_{\rm emb},(12C_LK)^{-1})\) and \(0<T\le\min(T_{57},T_{42}/2,R^2,1)\), where \(T_{42}\) is the fixed E42 round-reference interval. Then \(q=C_LK(R+\sqrt T+T)\le1/4\). For \(\|U_{\rm in}\|_{\mathcal B^s}\le\epsilon\le R/(4C_L)\), applying the linear solution map to \((U_{\rm in},N(U))\) sends the closed radius-\(R\) ball into the radius-\(R/2\) ball and is a contraction. Its fixed point and difference bounds have constant \(C_L/(1-q)\). The distributional equation and traces follow from E57. Conversely any distributional solution in this same small ball gives the source (3) in \(L^1\mathcal B^s\), and E57 uniqueness identifies it with the corresponding linear evaluation. This gives the asserted nonlinear uniqueness. The constants use the fixed reference, atlas, coefficient tube and its smooth bounds, \(\lambda\), and the E57 estimate. The smallness threshold will also use E42. There is no stationary forcing floor. [E57, (1)][e57].

## Short initial identification for smooth compatible data

Choose \(\rho\) small enough that the fixed E29 connection equation is strongly parabolic on the curvature graph for values \((A-A_0,F_A-F_0)\) in the tube. This follows by restricting (1): the correction \(d_A^{*g}C\) is identically zero, the vertical second jet has the fixed metric, and \(W\) is first order in the independent pair. Substituting \(F_A=F_0+d_{A_0}a+[a\wedge a]/2\) replaces \(D_0F\) by the fixed exterior-part operator on \(D_0^2a\) plus lower terms. Thus the connection principal coefficient depends on \((x,A,F_A)\) but not separately on the rest of the first jet. E29 gives its strict reference symbol. For each smooth compatible datum in the value tube, its actual compact initial first-jet image therefore admits a smooth cutoff in the open parabolic region. The individual E29 smooth construction with this fixed reference and that cutoff gives a genuine smooth adjusted connection on a possibly datum-dependent short interval. Its lift by \(F_A\) is a smooth solution to (1) by E36. [E29, smooth local construction][e29]. [E36, smooth compatible correspondence][e36]. [E42, compatible comparison][e42].

Let \(Z\) be this smooth lift expressed as a centered pair. Then

\[
 \lim_{\ell\downarrow0}E_\ell(Z)=\|U_{m in}\|_{\mathcal B^s}. \tag{7}
\]

For each fixed block, the time supremum tends to the initial block norm. A uniform spatial \(W^{4,8}\) bound of each local smooth piece on a fixed short interval supplies the summable majorant \(C2^{(s-4)j}\) for the weighted high blocks. The higher-time sum is \(O(\ell)\) by the same bound at \(s+2<4\). This proves (7), including the order of supremum and summation. For small enough \(\ell\) the lift is in the critical uniqueness ball, as is the restriction of the fixed point. They agree there. The lift is also in E42's smooth completion on a short enough interval, since its value converges uniformly at zero and its gradient seminorm is bounded by \(C\sqrt\ell\sup|DZ|\). The E42 small-ball uniqueness identifies it there with E42's path \(V\). We have \(U=V\) on a nontrivial initial interval, without comparing the entire two path classes. Shrink \(\epsilon\) to fit E42's initial value threshold. Its zero solution is stationary by (1), so its Lipschitz dependence at zero gives \(\|V\|_{C^0}\le C_{42}C_{\rm emb}\epsilon\). Shrink \(\epsilon\) again if needed to ensure both paths lie in the same small convex tube \(|U|,|V|\le\rho\) on \([0,T]\). These choices are independent of the smooth datum. [E42, (7) and compatible passage][e42].

## Positive-time weak–smooth comparison

Fix \(t_*>0\) inside the common initial interval of agreement. The E42 comparator is smooth on \([t_*,T]\) since \(T<T_{42}\). Write \(w=U-V\) and set \(\overline P=(P(x,U)+P(x,V))/2\). The exact principal difference is

\[
 P(x,U)D_0^2U-P(x,V)D_0^2V
 =\overline P D_0^2w+\tfrac12(P(x,U)-P(x,V))(D_0^2U+D_0^2V). \tag{8}
\]

For (8) use E57's frozen divergence-form Gårding estimate in the fixed metric and pairing,

\[
 \operatorname{Re}\!\int_M\langle P_0^{ij}D_{0j}w,D_{0i}w\rangle\,dV_{g_0}
 \ge \gamma\|D_0w\|_2^2-C_0\|w\|_2^2 .
\]

Before choosing the contraction radii, take \(\rho\) small enough that replacing \(P_0\) by \(\overline P\) in this quadratic form costs at most \((\gamma/4)\|D_0w\|_2^2\), by the uniform value perturbation measured in operator norm on full gradient arrays. Integration by parts of the first term of (8) also gives the term with \(D_0\overline P\). Its norm is at most \(C(1+\|D_0U\|_\infty+\|D_0V\|_\infty)\) by the spatial and value derivatives of \(P\). The second term of (8) pairs against \(w\) with a bound of \(C(\|D_0^2U\|_\infty+\|D_0^2V\|_\infty)\|w\|_2^2\). The first-order and quadratic lower differences are estimated pointwise by a bounded sum of \((1+|D_0U|+|D_0V|)|D_0w|\) and \((1+|D_0V|+|D_0V|^2)|w|\). For the quadratic term this follows by subtracting its two gradient slots with fixed coefficient at \(U\), and then subtracting the coefficient against the two comparator gradient slots. The value difference is bounded by \(C|w|\).

The Bochner bounds (5), the smooth tube coefficients, and (2) give \(U_t\in L^1([t_*,T];L^2)\) in distributions. The same holds for \(V\). As \(w\) is continuous in \(L^2\), it has the absolutely continuous \(L^2\) representative with that derivative. For almost every time its spatial second derivatives are in \(L^8\), and \(\overline P\) is spatially Lipschitz, so the preceding integration by parts applies. With the time chain rule and Young's inequality the bounds give

\[
 \frac12\frac{d}{dt}\|w\|_2^2+\frac{\gamma}{4}\|D_0w\|_2^2
 \le k(t)\|w\|_2^2,
 \quad
 k(t)=C\bigl(1+\|D_0U\|_\infty^2+\|D_0V\|_\infty^2
                 +\|D_0^2U\|_\infty+\|D_0^2V\|_\infty\bigr). \tag{9}
\]

The critical gradient square and Hessian are time-integrable by (5), while the comparator bounds are finite on this slab. Hence \(k\) is time-integrable before applying Grönwall. At \(t_*\) the strong trace difference is zero by initial identification. Thus \(U=V\) on the slab, and on all of \([0,T]\). This transfers the E42 curvature graph and regularity to the critical solution for smooth compatible input, with the E29 lift supplying smoothness through zero. No comparison with an original unadjusted trajectory is needed. [E57, fixed Gårding][e57]. [E42, compatible passage][e42].

[req]: ../research-progress/handoffs/SP4-CME-E60_REQUEST_v1.md
[b40]: ../brainstorm/notes/B40_COMPATIBLE_CRITICAL_EVOLUTION_20261122.md
[e29]: 29_LOCAL_PARABOLIC_INPUT_20261122.md
[e36]: 36_COUPLED_CURVATURE_SYSTEM_20261122.md
[e42]: 42_SMALL_VALUE_ROUGH_SYSTEM_20261122.md
[e54]: 54_CRITICAL_QUASILINEAR_MODEL_20261122.md
[e57]: 57_COMPACT_CRITICAL_LINEAR_20261122.md
