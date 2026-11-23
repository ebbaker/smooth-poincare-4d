# E127 — Audit of the exact compatible adjusted defect equation

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol` / `ultra`. Independent runtime and selected lead identifiers were unavailable. I authored E02C (the frozen 04C note), E36, E42 and E102, and audited E60 in E64 and E123 in E124. I did not author E125, E02A, E02B, E60 or E104. Independence concerns the new compatible-gauge combination, using those existing foundations as assessed. [Request][req], [E125 derivation][e125], [B65][b65], [return and file identities][ret].

## Disposition and conventions

**Pass at the exact structural scope.** The normalized defect on a supplied smooth compatible E36/E42 path has principal operator \(g^{ij}\mathscr L_Q\) on \(D_0^2q\). Once the constant term \(-12q\) is retained, the remaining coefficients on \(D_0q\) and \(q\) are affine in \(D_0U\) with smooth value dependence and vanish at the full zero jet. No second pair jet and no quadratic first-pair coefficient remain outside the principal Hessian. The adjusted density has a nontrivial horizontal transport term. This check supplies no mixed-norm or endpoint estimate. [E125 request][req125], [E125 return][ret125].

Work on the smooth closed oriented native round Riemannian \(S^4\) and its genuine positive chiral \(\mathrm{SO}(3)\) bundle with negative-Killing metric, reference \(A_0,F_0\), and curvature \(1/2\) for \(G=g(F_0)\). Set \(a=A-A_0\), \(F=F_A=F_0+\zeta\), \(U=(a,\zeta)\), \(q=Q(F)-I\). Write \(D_0\) for the fixed \(A_0,G\) derivative, with every base and internal slot included. Use \(\nabla\) for the live \(A,g(F)\) derivative and native time \(\tau\). Restrict values to the fixed positive tube of E125 and E42. [E36 (1)–(2)][e36], [E42, compatible passage][e42].

## Independent native calculation of the physical coefficients

In the manuscript pairing a bracket-orthonormal basis \(e_m^{\rm old}\) has negative Killing matrix \(2I\). Thus the native orthonormal frame is \(e_m^{\rm old}/\sqrt2\), with negative-Killing structure constants \(\epsilon_{mki}/\sqrt2\), and the corresponding curvature component two-forms gain \(\sqrt2\). The wedge Gram and its trace density gain a factor \(2\), leaving \(Q\) invariant. With \(c=2K\), the old manuscript density \(2K^2dV_{\widehat g}\) therefore becomes \(4K^2dV_{\widehat g}=dV_{c\widehat g}\). The live base scale is \(g=c\widehat g\), which leaves the spatial Levi-Civita connection unchanged. On two-forms the codifferential is \(-g^{ab}\nabla_a\) contracted in the first form slot, so \(d_A^{*g}=c^{-1}d_A^{*\widehat g}\). Uniform internal scaling does not change this operator on the underlying adjoint-valued forms. For \(H=q-|q|^2I/6\), \(B(F)=2I+4H\), and Bianchi and self-duality give \(d_A^{*g}F=0\). The physical field is therefore \(v_{\rm F}=-4d_A^{*g}(HF)\), \(c^{-1}\) times its old form on the same connections. This proves \(\tau=ct\). In the old equation the spatial contractions across the derivative slots each use a single inverse metric. On converting time they acquire precisely the new live contraction. The old reaction factor \(24K\) becomes \(24K/(2K)=12\). [E04A (1)–(6)][e04a], [E04B][e04b], [E02 assessment][a02].

The coefficient check can also be done entirely natively. At a point take the E04A self-dual symbols \(\eta_{m,ac}\) in a native orthonormal coframe. If \(S=Q^{1/2}\), the components \(F_{m,ac}\) are \(-S_{mn}\eta_{n,ac}/\sqrt2\). In particular \(\langle F_m,F_n\rangle_g=Q_{mn}\) with the ordinary two-form inner product. Define \(X_a=\nabla_aQ\), \(C_a=\nabla_a H=X_a-\tfrac13\operatorname{tr}(QX_a)I\) and \(Y_{mn,a}=4\langle\nabla_a F_m,F_n\rangle_g\). Then \(Y_a+Y_a^\top=4X_a\), and \(\Xi_a=Y_a-2X_a\) is skew. The factor four is exact. Compared in a common derivative covector slot, the two old form-index contractions acquire \(c^{-2}\), the two component rescalings give \(2\), and the ordinary two-form inner product contributes \(\tfrac12\). Multiplying by \(4\) gives \(4/c^2=1/K^2\) times the old component sum. Hence this is exactly the original \(Y\) and \(\Xi\) before tracing their derivative slots. In the adapted chiral frame \(\nabla_a F=-(\nabla_a S)\Sigma/\sqrt2-S\,\operatorname{ad}(A-\Gamma_A^+)_a\Sigma/\sqrt2\), with \(\Sigma\) the norm-\(\sqrt2\) self-dual triple. This gives \(Y=4((\nabla S)S+S\operatorname{ad}(A-\Gamma_A^+)S)\). Subtracting \(2\nabla(S^2)\) agrees with the stated mismatch formula for \(\Xi\). [E04A (5)][e04a], [E125 (2)][e125].

At an orthonormal point \(v_{mb}=4(C_c)_{mk}F_{k,cb}\). The curvature velocity \(d_Av\) and cyclic Bianchi give
\[
 (F_\tau)_{m,ab}=4\big((\nabla_a C_c)_{mk} F_{k,cb}
             -(\nabla_b C_c)_{mk}F_{k,ca}
             +(C_c)_{mk}\nabla_c F_{k,ab}\big).
\]
In \(Z_{mn}=(F_{\tau,m}\wedge F_n)/\mu\) for this physical velocity, use \(\mu=dV_g\), self-duality of \(F_n\), and the factor \(\tfrac12\) in the form inner product. The product of two \(F\) components is
\(F_{n,ab}F_{k,cb}=\tfrac12(Q_{nk}\delta_{ac}+\Omega_{nk,ac})\), with
\(\Omega_{nk,ac}=S_{nr}S_{ks}\epsilon_{rst}\eta_{t,ac}\). Hence
\[
 Z_{mn}=2((\nabla^a C_a)Q)_{mn}
       +\Omega_{nk,ac}([\nabla_a,\nabla_c]H)_{mk}+(C^aY_a)_{mn}.
 \tag{1}
\]
The antisymmetric Hessian in the middle term is the curvature action on the internal endomorphism zero-form. The base Christoffels cancel by torsion-freeness. In the native frame \(\operatorname{ad}(e_m)=J_m/\sqrt2\) with \((J_m)_{ik}=\epsilon_{imk}\). Thus \(\operatorname{ad}F_{ac}=-\tfrac12 S_{mt}\eta_{t,ac}J_m\), and the middle term of (1) is
\[
 -2\det(S)\,\epsilon_{nkm}([J_m,Q])_{ik}
       =-2\det(S)(3Q_{in}-\delta_{in}\operatorname{tr}Q)
       =-6\det(S)\,q_{in},
\]
writing \(i\) for the first free internal slot. The contraction uses the determinant identity for the three \(S\) factors and \(\eta_{r,ac}\eta_{s,ac}=4\delta_{rs}\). The two commutator components contract to \(Q_{ni}-\delta_{in}\operatorname{tr}Q\) and \(2Q_{in}\). This verifies the exact native reaction in \(Z+Z^\top\), including its sign. The commutator used actual compatibility \(F=F_A\). [E04A (3)–(5) and reaction contraction][e04a].

For the trace, \(\operatorname{tr}(QC_a)=0\) and thus \(\operatorname{tr}(Q\nabla^a C_a)=-|X|^2\), whereas \(\operatorname{tr}(C^aY_a)=2|X|^2\). The middle term is itself trace-free, so the physical numerator \(Z\) has zero trace and gives \(\mu_\tau=0\) in the fixed base identification. For its symmetric part, substitute
\[
 \nabla^a C_a=\Delta_Aq-\tfrac13\operatorname{tr}(Q\Delta_Aq)I-\tfrac13|X|^2 I,
 \qquad C_aY_a+Y_a^\top C_a=4X_a^2-\tfrac43\operatorname{tr}(QX_a)X_a+[X_a,\Xi_a]
\]
in live orthonormal slots. This gives
\(\mathscr L_Q(Z_0)=2(QZ_0+Z_0Q)-\tfrac43\operatorname{tr}(QZ_0)Q\)
on trace-free symmetric \(Z_0=\Delta_Aq\) and verifies the four first-derivative contractions in tensor form
\[
 \mathcal N_Q(X,\Xi)=g^{ij}
 \left(4X_iX_j-\tfrac43\operatorname{tr}(QX_i)X_j
                 -\tfrac43\operatorname{tr}(X_iX_j)Q+[X_i,\Xi_j]\right).
 \tag{2}
\]
Here the \(g^{ij}\) contraction symmetrizes the products whose individual ordered terms need not be symmetric. The trace of the first product cancels that of the third, and the other products are trace-free. These calculations also recheck the physical volume identity used in E125. [E04A, physical trace and products][e04a], [E04C, volume][e04c].

## Actual head gauge and the moving density

On the compatible graph the curvature difference is \(\zeta=d_0a+\tfrac12[a\wedge a]\), so the E36 horizontal input \(\beta_{\rm h}=\zeta+\tfrac12[a\wedge a]\) is \(d_0a+[a\wedge a]=d_Aa\). The base vector is \(u=-S_F^*d_A^{*g}\beta_{\rm h}\) for \(S_Fu=\iota_u F\), and the fixed-metric vertical parameter is \(\phi=d_A^{*G}a\). The latter equals \(d_0^{*G}a\) exactly, since the difference is \(-G^{ij}[a_i,a_j]=0\). Thus the compatible connection velocity is \(v_{\rm F}-d_A\phi+\iota_uF\). The E36 extra \(d_A^{*g}(F-F_A)\) and \(-\lambda d_A^{*g}d_AF\) vanish identically on this smooth graph, by compatibility and Bianchi. [E36 (1), (2), compatible graph][e36], [E60 (1), smooth comparison][e60].

In a fixed local frame, let \(\mathsf W=(F_m\wedge F_n)_{mn}=\mu Q\), with \(\mu=\tfrac13\operatorname{tr}\mathsf W\). Curvature variation by the vertical velocity is \(-d_A^2\phi=-[F,\phi]=[\phi,F]\). The induced velocity of \(\mathsf W\) is the commutator \([\operatorname{ad}\phi,\mathsf W]\) since the internal action is skew. Its trace vanishes, and the normalized defect contribution is \(+[\operatorname{ad}\phi,q]\). There is no differentiated \(\phi\) term in this velocity, by the exterior curvature identity. For the horizontal velocity, Bianchi gives the covariant Cartan identity
\[
 d_A\iota_uF=(d_A\iota_u+\iota_u d_A)F=\mathcal L_uF+[A(u),F].
\]
This follows by expanding \(d_A\) and applying the contraction rule to its connection wedge term. On \(\mathsf W\) the local resulting velocity is
\[
 \mathcal L_u(\mu Q)+[\operatorname{ad} A(u),\mu Q]
   =\mu\,u(Q)+Q\mathcal L_u\mu+[\operatorname{ad} A(u),\mu Q].
\]
The trace gives \(\mu_\tau|_{\rm hor}=\mathcal L_u\mu\). Differentiating \(\mathsf W=\mu Q\) cancels the entire \(Q\mathcal L_u\mu\) term, including all spatial derivatives of \(u\) that occur on its top-degree form slots. Hence the defect gets \(+\nabla_u q\). This is a slice-wise infinitesimal identity with the given time-dependent parameter. No \(\partial_\tau u\) appears. [E04C, gauge dependence][e04c], [E125 (4)–(8)][e125].

Combining with (1)–(2) gives
\[
 q_\tau=\mathscr L_Q(\nabla^i\nabla_i q)-12\sqrt{\det Q}\,q
        +\mathcal N_Q(X,\Xi)+\nabla_uq+[\operatorname{ad}\phi,q],
 \qquad
 \mu_\tau=\mathcal L_u\mu=(\operatorname{div}_g u)\mu .
 \tag{3}
\]
In particular \(\operatorname{tr}_g g_\tau=2\operatorname{div}_g u\) by the variation of \(dV_g\). Since \(S^4\) is closed, the Lie derivative integrates to zero, although the density can change pointwise.

For the density symbol, linearize the base vector at \(A_0\) along the compatible variation \(b\). The background \(\beta_{\rm h}=0\) makes every metric/adjoint variation on it vanish, yielding \(\dot u=-S_0^*d_0^{*G}d_0 b\). The background \(u=0\) also kills the metric variation in the divergence. At a real covector \(\xi\neq0\), \(d_0^*d_0\) has symbol \((-i\iota_{\xi^\sharp})(i\xi\wedge)=\iota_{\xi^\sharp}(\xi\wedge\,\cdot)\). The amplitude \(B=S_0\xi^\sharp\) is transverse because \(F_0(\xi^\sharp,\xi^\sharp)=0\). The round native norm-one self-dual forms have \(|\iota_vF_{0m}|^2=|v|^2/2\), so \(S_0^*S_0=\tfrac32 I\) by polarization. The divergence symbol at this amplitude is therefore \(-\tfrac32 i|\xi|^4\), with order three in \(b\), the extra power coming from the chosen amplitude. In fixed normal coordinates and a local frame at \(p\), use \(b(x)=\chi(x)(\xi\cdot x)^3 B/6\), with constant frame coefficients \(B\) and smooth cutoff equal to one near \(p\). All lower jets vanish there and the third derivative is \(\xi^{\otimes3} B\). With real derivatives this realizes \(\operatorname{div}_G\dot u(p)=+\tfrac32|\xi|^4\), since \(i^3=-i\) in the displayed symbol. Extending by zero gives a smooth variation of actual connections \(A_0+\varepsilon b\), whose curvature is compatible and definite for sufficiently small \(\varepsilon\). It realizes nonzero adjusted density velocity at \(p\). [E125, density symbol after (8)][e125], [E36][e36].

## Full fixed-reference derivative allocation

Put \(\mathcal A_i=\operatorname{ad}(a_i)\) and \(\Delta^k{}_{ij}=(\nabla^g-\nabla^G)^k{}_{ij}\). The Levi-Civita difference is
\[
 \Delta^k{}_{ij}=\tfrac12 g^{k\ell}
     \big((D_0)_i g_{j\ell}+(D_0)_j g_{i\ell}-(D_0)_\ell g_{ij}\big).
\]
Since \(g=g(x,\zeta)\) is smooth in curvature values, the reference derivative of \(g\) is affine in \(D_0\zeta\) with smooth value coefficients. The fixed-value term at \(\zeta=0\) vanishes by \(D_0G=0\). The first derivative of the defect is \(X_j=(D_0)_jq+[\mathcal A_j,q]\). On its endomorphism-valued one-form the exact live derivative is \((D_0)_iX_j+[\mathcal A_i,X_j]-\Delta^k{}_{ij}X_k\). Expanding gives
\[
 (\nabla^2 q)_{ij}=(D_0^2q)_{ij}
    +[\mathcal A_j,(D_0)_iq]+[\mathcal A_i,(D_0)_jq]
    +[\operatorname{ad}((D_0a)_{ij}),q]
    +[\mathcal A_i,[\mathcal A_j,q]]-\Delta^k{}_{ij}X_k .
 \tag{4}
\]
Here \(D_0a\) includes the base covector slot. This produces precisely \(g^{ij}\mathscr L_Q\) on the full fixed Hessian in (3). Symmetry of \(g^{ij}\) kills its antisymmetric part. The Fourier symbol is \(-|\xi|_g^2\mathscr L_Q\), with coefficient difference from \(4G^{ij}\mathrm{Id}\) of order \(O(|U|)\) by the smooth value reconstruction and \(\mathscr L_I=4\mathrm{Id}\). Differentiating the coefficient to express the principal part as a fixed divergence introduces only an affine first-pair coefficient multiplying \(D_0q\). [E04B, coercivity and symbol][e04b], [E125 (9)–(10)][e125].

The lower terms can be exhaustively allocated as follows.

- For **each** product in (2), retain one \(X=(D_0q)+[\mathcal A,q]\) as the explicit \(D_0q\) or \(q\) factor. For \(X_iX_j\), \(\operatorname{tr}(QX_i)X_j\) and \(\operatorname{tr}(X_iX_j)Q\), the other \(X\) is a smooth affine map of \(D_0\zeta\) with value terms, by \(Q=Q(x,F_0+\zeta)\) and the \(\mathcal A\) action. For \([X_i,\Xi_j]\), the expression \(Y_j-2X_j\) gives the same affine allocation. In detail \(\nabla_i F\) is \((D_0)_iF\) plus the internal action of \(a_i\) and both base-slot actions of \(-\Delta^k{}_{ij}\) on the two-form. Each is affine in the first pair jet since \(F\) and all metric contractions are values. This treatment needs no estimate of the chiral mismatch by the strain.
- The corrections in (4) use only value products and one \(D_0a\) or one first pair jet in \(\Delta\) multiplying the explicit \(D_0q\) or \(q\). The reaction after \(-12q\) has value coefficient \(-12(\sqrt{\det Q}-1)\), zero at the reference. The vertical correction uses \(\phi=-G^{ij}(D_0a)_{ij}\) linearly, by the fixed adjoint and the exterior-square identity.
- In the base velocity the first derivative \(D_0\beta_{\rm h}\) is \(D_0\zeta+\tfrac12D_0[a\wedge a]\), the latter having one \(D_0a\) and one \(a\). In the live codifferential the internal connection difference acts on \(\beta_{\rm h}\), and the two form slots use the first-jet Levi-Civita difference. The adjoint \(S_F^*\) itself is algebraic in \(F,g\). Thus \(u\) is affine in \(D_0U\), and \(\nabla_u q=u^iX_i\) preserves that allocation. Spatial derivatives of \(u\) are precisely the high-order terms canceled by the top-degree quotient.
- Possible second pair jets in the E36 constraint/Bianchi additions vanish because those expressions are identities equal to zero on the whole compatible path. For the physical term the only removal of an antisymmetric Hessian uses actual curvature compatibility in (1). In the principal \(D_0^2q\), the chain rule does contain \(D_\zeta Q[D_0^2\zeta]\) and products of first curvature jets. They belong to the displayed principal defect Hessian. The independent-pair expressions are used to describe coefficient order, while the allocation of the second \(X\) uses \(q=Q(F_0+\zeta)-I\) on this path.

All coefficients are smooth in values. At \((U,D_0U)=(0,0)\), the metric difference and its covariant derivative, the pair's connection correction, \(\phi,u\), \(X\) and \(\Xi\) vanish, using \(D_0F_0=0\). After \(-12q\), the lower operators have total coefficient zero there. In notation \(B_0(x,U)+B_1(x,U)[D_0U]\) and \(C_0(x,U)+C_1(x,U)[D_0U]\), this asserts \(B_0(x,0)=C_0(x,0)=0\). The linear maps \(B_1(x,0),C_1(x,0)\) need not vanish separately. For example the \(D_0a\)-commutator in (4) at reference coefficients combines with the fixed vertical term with net coefficient \(4-1=3\). The fixed compact tube bounds the entire lower remainder by \(C(|U|+|D_0U|)(|D_0q|+|q|)\). There is neither a remaining second pair derivative coefficient nor a quadratic first-pair derivative coefficient on \(q\). [E125, fixed-reference inventory][e125], [E36 (1)][e36].

## Perfectness and limits

On a supplied smooth compatible path freeze its value and derivative coefficients in the homogeneous equation just checked. In the fixed \(L^2(dV_G)\) pairing the leading energy term after integration by parts is \(-\int g^{ij}\langle (D_0)_i q,\mathscr L_Q(D_0)_j q\rangle\). Indeed \(\mathscr L_Q\) is symmetric on the trace-free symmetric space and has quadratic form \(4\operatorname{tr}(Q(Z-\theta I)^2)\), \(\theta=\operatorname{tr}(QZ)/3\). Positivity of \(Q,g\) in the tube gives a uniform positive leading gradient coefficient relative to \(G\). First derivatives of the principal coefficient and the lower coefficients are bounded on each compact interval of the given smooth path, giving cross terms bounded by Young's inequality. Therefore \(d\|q\|_2^2/d\tau\le C_{\rm path}\|q\|_2^2\). If \(q\) vanishes on an initial slice of such an interval, it stays zero there. This proves the asserted smooth path-dependent preservation and uses no uniform control as the derivatives of the ambient pair vary. The round linearization has exactly \(4\Delta_0-12\). The packet does not address rough closed-equation uniqueness at time zero or endpoint estimates. No fresh primary source or external premise was needed. [E04B, positivity][e04b], [E125, perfectness][e125].

[req]: ../research-progress/handoffs/SP4-CME-E127_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E127_RETURN_v1.md
[req125]: ../research-progress/handoffs/SP4-CME-E125_REQUEST_v1.md
[ret125]: ../research-progress/handoffs/SP4-CME-E125_RETURN_v1.md
[b65]: ../brainstorm/notes/B65_DEFECT_ONLY_ENDPOINT_ROUTE_20261122.md
[e125]: ../notes/125_ADJUSTED_DEFECT_EQUATION_20261122.md
[e04a]: ../notes/04A_NONLINEAR_Q_20261122.md
[e04b]: ../notes/04B_NONLINEAR_Q_20261122.md
[e04c]: ../notes/04C_VOLUME_AND_JETS_20261122.md
[a02]: E02_NONLINEAR_ASSESSMENT_20261122.md
[e36]: ../notes/36_COUPLED_CURVATURE_SYSTEM_20261122.md
[e42]: ../notes/42_SMALL_VALUE_ROUGH_SYSTEM_20261122.md
[e60]: ../notes/60_COMPATIBLE_CRITICAL_EVOLUTION_20261122.md
