# Independent replay of the parent chirality ledger

27 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI assistance. The frozen request specified gpt-6.2-sol/ultra. Actual execution identifier and effort were unavailable. [SP4-CUT-LED-E05 request 1](../research-progress/handoffs/E05_REQUEST_R1.md) fixes checkout bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0, the [parent manuscript](../../manuscript/cuts_of_subcritical_conformal_classes.tex) §§2–3, the [parent conventions](../../research-overview/OVERVIEW.md#fixed-setting-and-conventions), the [child plan](../research-plan/PLAN.md) and [register](../research-progress/REGISTER.md), and the L4 claim in the [child continuation](../continuation-notes/CONTINUATION.md#after-the-first-horizon). Proofs below use smooth oriented Riemannian metrics and Hilbert–Schmidt curvature-operator norms.

| Frozen passage | Result |
| --- | --- |
| Theorem 3.1, lines 230–301 | Ledger sign and \(12\pi^2\) coefficient follow from Stokes and the APS normalization. |
| Proposition 3.2, lines 308–332 | The tangential Weyl reconstruction takes a plus sign. Outward-first and the magnetic tensor in §2 give \(W^\pm\leftrightarrow\mathcal E\mp\mathcal H\). Codazzi gives \(\operatorname{sym}\operatorname{curl}B^\circ=\mathcal H\) and fixes the sign of the pairing in \(\mathcal T\). |
| Corollary 3.3 and round examples, lines 335–361 | Eta bound and listed round values verified. |
| Corollary 3.4 and its sequel, lines 363–380 | Collar equality and raw Hölder estimate verified. The \(L^3\) norm of \(B^\circ\) is conformally invariant. The \(L^{3/2}\) norm of the raw curl can change. Its symmetric part gives an invariant, stronger estimate. |
| Corollary 3.5, lines 382–387 | Both conditional energy equalities verified. |
| Remark 3.6, lines 389–397 | Independent local analytic germ proof below. The cited LeBrun theorem concerns conformal infinity. Biquard's published abstract supports the near-round whole-ball scope. |
| Child L4 | Exact bound verified. A positive tolerance for the whole open band needs a strict gap to the cutoff. The cyclic model values are arithmetic lower bounds and their model cuts are ruled out topologically. |

## Theorem 3.1

Use \(R^\nabla(X,Y)=[\nabla_X,\nabla_Y]-\nabla_{[X,Y]}\) and \(R_{abcd}=\langle R^\nabla(e_a,e_b)e_d,e_c\rangle\). Thus the curvature operator on simple two-forms is the identity on the unit sphere. Orient the boundary by \((\nu,e_1,e_2,e_3)\). Write \(B(X,Y)=\langle\nabla_X\nu,Y\rangle\), \(C_{il}=(\operatorname{curl}_h B^\circ)_{il}=\varepsilon_l{}^{jk}\nabla_jB^\circ_{ik}\), and \(S=(C+C^T)/2\).

In a geodesic collar for \(g\), take \(g_0=dt^2+h\) near the boundary and interpolate to \(g\) in the interior. This gives common boundary normal and full inner product on \(TV|_\Sigma\). With \(\omega^a{}_b=\langle\nabla e_b,e_a\rangle\) on \(\Sigma\), write \(\theta=\omega-\omega_0\) and \(\omega_t=\omega_0+t\theta\). The Bianchi identity gives
\[
\frac{d}{dt}\operatorname{tr}(\Omega_t\wedge\Omega_t)
 =2d\operatorname{tr}(\theta\wedge\Omega_t),\qquad
\Omega_t=\Omega_0+t d_0\theta+t^2\theta\wedge\theta .
\]
For \(p_1=-(8\pi^2)^{-1}\operatorname{tr}(\Omega\wedge\Omega)\), integration in \(t\) gives the coefficients \(2,1,2/3\) in the manuscript's \(Tp_1\). The boundary \(\Omega_0\) is tangential, \(\theta^i{}_\nu=B_i\), \(\theta^\nu{}_i=-B_i\), and \(d_0\theta\) has the same off-diagonal form with \(B_i\) replaced by \((d^\nabla B)_i\). Hence
\[
\operatorname{tr}(\theta\wedge\Omega_0)=\operatorname{tr}(\theta^3)=0,\qquad
\operatorname{tr}(\theta\wedge d_0\theta)=-2\sum_i B_i\wedge(d^\nabla B)_i .
\]
The sum is \(\langle B,\operatorname{curl}_hB\rangle d\sigma\). The \(1/2\) in the components of \(d^\nabla B_i\) cancels against antisymmetry in its two derivative terms. Writing \(B=B^\circ+fh\), the tensor \((\operatorname{curl}(fh))_{il}=\varepsilon_l{}^{ji}\nabla_jf\) is skew, and \(\operatorname{tr}(\operatorname{curl}B^\circ)=\varepsilon_i{}^{jk}\nabla_j B^\circ_{ik}=0\). Both cross terms and the pure trace term vanish pointwise. Stokes then gives
\[
\int_V(p_1(g)-p_1(g_0))=\frac{1}{4\pi^2}\oint_\Sigma\langle B^\circ,C\rangle d\sigma.
\]

To check the conversion to chiral energy, \(\Omega^a{}_b=\mathcal R(e^a\wedge e^b)\) by pair symmetry and \(-\operatorname{tr}(\Omega\wedge\Omega)=2\sum_{a<b}\Omega^a{}_b\wedge\Omega^a{}_b\). A two-form \(F\) satisfies \(F\wedge F=(|F^+|^2-|F^-|^2)dV\). Summing over an orthonormal basis of inputs to \(\mathcal R\), the squared norms of the off-diagonal curvature blocks cancel by adjointness. The scalar parts \((R/12)I_3\) of the two diagonal blocks cancel by trace-freeness of \(W^\pm\). Therefore \(p_1=(4\pi^2)^{-1}(|W^+|^2_{\rm HS}-|W^-|^2_{\rm HS})dV\).

[Atiyah–Patodi–Singer I, Theorem (4.14), p. 66](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps001.pdf), checked in the published 1975 text on 27 November 2026, applies to an oriented compact \(4k\)-manifold with a metric product near its boundary. Its signature is taken on the relative-to-absolute middle cohomology image. Its \(\eta(0)\) is the value for the odd signature operator on even forms. At \(k=1\), \(L_1=p_1/3\), so \(\int_V p_1(g_0)=3(\tau(V)+\eta(\Sigma,h))\), with the boundary terms summed using their outward orientations. In particular,
\[
E_+(V)-E_-(V)=12\pi^2(\tau(V)+\eta(\Sigma,h))+\mathcal T(\Sigma),\qquad
\mathcal T(\Sigma)=\oint_\Sigma\langle B^\circ,C\rangle d\sigma .
\]

### Conformal covariance

For \(\hat g=e^{2u}g\), \(\hat\nu=e^{-u}\nu\) and the conformal connection formula give \(\hat B=e^u(B+\nu(u)h)\), \(\hat B^\circ=e^u B^\circ\) as covariant tensors. In the rescaled frames \(\hat e_i=e^{-u}e_i,\ \hat e^j=e^u e^j\), the mixed-frame one-forms \(\hat B^\circ_i=\hat B^\circ_{ij}\hat e^j=B^\circ_i\) are unchanged. With \(u_i=e_i(u|_\Sigma)\), \(\hat\omega^i{}_j-\omega^i{}_j=u_j e^i-u_i e^j\). The opposite ordered indices give the opposite sign. Since \(d^\nabla B_i^\circ=d B_i^\circ+\omega^i{}_j\wedge B_j^\circ\), the change of the three-form in the parent display is correct. Its two summed terms vanish by \(\sum_i B_i^\circ\wedge e^i=0\) and symmetry.

Applying the rescaled Hodge star on two-forms to \((u_j e^i-u_i e^j)\wedge B^\circ_j\) gives the orthonormal components
\[
\hat C_{il}=e^{-2u}(C_{il}+\varepsilon_l{}^{ik}a_k),\qquad
a_k=\sum_j u_j B^\circ_{jk}.
\]
The contribution with \(u_i\) vanishes by symmetry of \(B^\circ\). The added tensor is skew in \(i,l\). Consequently \(|\hat B^\circ|=e^{-u}|B^\circ|\) and \(|\hat S|=e^{-2u}|S|\). Together with \(d\hat\sigma=e^{3u}d\sigma\) these prove invariance of \(\|B^\circ\|_{L^3}\), \(\|S\|_{L^{3/2}}\), and the density \(\langle B^\circ,S\rangle d\sigma=\langle B^\circ,C\rangle d\sigma\). For a counterexample to invariance of \(\|C\|_{L^{3/2}}\), take the flat three-torus, \(B^\circ=\operatorname{diag}(1,-1,0)\), and a smooth nonconstant periodic \(u=u(x^1)\). Then \(C=0\), while \(\varepsilon_l{}^{i1}u_1\ne0\) wherever \(u_1\ne0\). The datum is realized by \(dt^2+h+2tB^\circ\) for small \(|t|\), with chosen normal \(\partial_t\) at zero. In the ledger, the Cauchy datum means the simultaneous equivalence class \((h,B^\circ)\sim(e^{2u}h,e^uB^\circ)\) with fixed normal direction.

For \(h_1=e^{2w}h_0\), smoothly rescale \(dt^2+h_0\) on a cylinder with the specified two end values. The product extends to \(\mathbb R\times\Sigma\), and \(s\mapsto 2t-s\) is an orientation-reversing isometry fixing the slice \(s=t\) pointwise. The chiral norms therefore agree pointwise on the product and the chiral measures remain equal after conformal rescaling. Both ends are umbilic. The cylinder's signature is zero because restriction from its absolute \(H^2\) to one end is an isomorphism. Reversing the orientation of the three-manifold negates the odd signature operator, hence also its eta invariant. The ledger gives \(\eta(h_1)=\eta(h_0)\). The primary attribution is [Atiyah–Patodi–Singer II, equation (4.7), pp. 420–421](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps002.pdf), checked on the same date. Equation (4.7) uses a cylinder with product metrics near the ends and gives the real signature eta difference.

## Proposition 3.2

Set \(\alpha_i=e^i\wedge\nu^\flat\), \(\beta_i=\tfrac12\varepsilon_{ijk}e^j\wedge e^k\). Outward-first gives \(*\alpha_i=-\beta_i\), \(*\beta_i=-\alpha_i\). For example \(e^1\wedge\nu^\flat\wedge e^2\wedge e^3\) is the negative volume form. The Weyl operator commutes with \(*\), so its matrix in \((\alpha,\beta)\) has equal diagonal blocks \(\mathcal E\) and equal symmetric off-diagonal blocks \(\mathcal H\) as defined in §2. The chiral orthonormal bases are \((\alpha_i\mp\beta_i)/\sqrt2\) on \(\Lambda^\pm\). Thus
\[
\begin{aligned}
 W_{i\nu j\nu}&=\mathcal E_{ij},&
 W_{ijk\nu}&=\varepsilon_{ij}{}^l\mathcal H_{lk},&
 W_{ijkl}&=+\varepsilon_{ijm}\varepsilon_{kln}\mathcal E^{mn},\\
 [W^+]&=\mathcal E-\mathcal H,&
 [W^-]&=\mathcal E+\mathcal H,&
 |W^+|^2_{\rm HS}-|W^-|^2_{\rm HS}&=-4\langle\mathcal E,\mathcal H\rangle .
\end{aligned}
\]
The \(1/\sqrt2\) in the bases eliminates an additional factor in the individual matrices. Their squared norm difference gives the factor \(4\).

For a pure-electric algebraic Weyl tensor take both diagonal blocks equal to \(\operatorname{diag}(1,-1,0)\) and off-diagonal blocks zero. The Ricci contractions vanish by \(\sum_k\varepsilon_{ikm}\varepsilon_{jkn}E_{mn}=\delta_{ij}\operatorname{tr}E-E_{ij}\). The \(23\)- and \(13\)-plane components are \(W_{2323}=1\) and \(W_{1313}=-1\). The manuscript's tangential minus sign yields \(\mathrm{Ric}_{11}=1+0+1=2\) on this example. With the correct sign the chiral Hilbert–Schmidt norms squared are both \(2\), the full operator norm squared is \(4\), and the all-lowered four-tensor norm squared is \(16\).

Tangential projection of \(R^\nabla(e_j,e_k)\nu\) gives \(\nabla_jB_{ik}-\nabla_kB_{ij}=R_{jki\nu}\). The Schouten part at these indices is \(\delta_{ji}A_{k\nu}-\delta_{ki}A_{j\nu}\), whence
\[
(\operatorname{curl} B)_{il}=\mathcal H_{li}+\varepsilon_l{}^{ik}A_{k\nu}.
\]
The last term and the curl of the mean-curvature term in \(B\) are skew. Thus \(S=\mathcal H\) and \(\mathcal T=+\oint\langle B^\circ,\mathcal H\rangle d\sigma\). An umbilic hypersurface has \(\mathcal H=0\) and equal chiral squared norms at every point. With this convention the L3 foliation derivative in the increasing normal direction is \(-4\int_{\Sigma_t}\langle\mathcal E,\mathcal H\rangle\phi\,d\sigma\), by the ledger between slices and coarea with lapse \(\phi\).

## Corollaries 3.3 to 3.5 and L4

For an embedded separating cut of a homotopy sphere \(M=V\cup_\Sigma V'\), the map \(H^2(V,\partial V;\mathbb R)\to H^2(V;\mathbb R)\) factors through \(H^2(M,V';\mathbb R)\to H^2(M;\mathbb R)\) by excision and restriction, so the map vanishes. The same holds for \(V'\), and both signatures vanish. Reversing the normal and the boundary orientation together negates \(B^\circ\) and negates the curl operator. It therefore negates \(\mathcal T\), and reverses the sign of \(\eta\) as well. Put \(Q=12\pi^2\eta+\mathcal T\) on the outward side \(V\). Then
\[
E_+(V)-E_-(V)=Q,\qquad E_+(V')-E_-(V')=-Q,\qquad
e\ge |Q| \ge 12\pi^2|\eta|-\|B^\circ\|_{L^3}\|S\|_{L^{3/2}} .
\]
For \(Q\ge0\), the nonnegative \(E_-(V)\) implies \(E_+(V)\ge Q\); for \(Q\le0\), apply the same argument to \(V'\). This proves the exact arbitrary-cut bound and its invariant estimate. The raw curl also gives a valid, weaker Hölder estimate in each chosen gauge. For an umbilic cut the boundary term vanishes and \(e\ge 3T|\eta|\), \(T=4\pi^2\). Thus \(e<2T\) and \(e<T\) imply \(|\eta|<2/3\) and \(|\eta|<1/3\), respectively.

For the product collar \(C\cong\Sigma\times[0,1]\) the signature is zero by restriction to one end. Orient both slices with the normal pointing along increasing collar parameter. The oriented top boundary has that normal, while at the lower boundary both the normal and slice orientation are reversed. The identity becomes
\[
E_-(C)=E_+(C)-12\pi^2(\eta_1-\eta_0)-\mathcal T_1+\mathcal T_0,\qquad
|\mathcal T_i|\le \|B_i^\circ\|_{L^3}\|S_i\|_{L^{3/2}}.
\]
The same numerical \(\mathcal T_i\) is determined by the smooth end datum. A small end error from a common model calls for control of \(\eta_1-\eta_0\) and both boundary pairings. Closeness of the end data without a specified regularity or norm supplies no quantitative bound on those errors.

If \(W^+=0\) on \(V\) with umbilic boundary, then \(-E_-(V)=12\pi^2(\tau(V)+\eta)\), so \(e_V=6\pi^2|\tau(V)+\eta|\). If also \(W^-=0\) on the opposite side of an umbilic cut in \(M\), then each surviving chiral energy equals \(12\pi^2|\eta|\), so \(e\) has that value. These equalities assume the actual smooth pieces in the statements.

### Round models and the tolerance in L4

[Atiyah–Patodi–Singer II, Proposition (2.12), pp. 412–413, and equations (2.13)–(2.16)](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps002.pdf), checked in the primary text on 27 November 2026, gives the cyclic cotangent formula for the standard metric of a free linear action and its equivariant interpretation. In the oriented quaternion basis \((1,i,j,k)\), left multiplication by \(\cos\theta+i\sin\theta\) rotates the oriented \((1,i)\) and \((j,k)\) planes by \(\theta\). Every \(\gamma\) is conjugate to an element of this form with \(\cos\theta=\operatorname{Re}\gamma\). Its equivariant term is \(-\cot^2(\theta/2)\) and the identity contributes zero by an orientation-reversing isometry of the round sphere. The quotient eta is the average by the projection onto invariant eigenspaces. This yields absolute values \(0,2/9,1/2,4/5\) for cyclic orders \(2,3,4,5\), respectively, from
\[
\frac1p\sum_{j=1}^{p-1}\cot^2\frac{\pi j}{p}=\frac{(p-1)(p-2)}{3p}.
\]
The sum follows by differentiating the logarithm of the sine product for \(\sin(px)\) twice and comparing constant terms at \(x=0\), then using \(\cot^2=\csc^2-1\). For \(Q_8\), the nonidentity real parts are \(-1\) once and \(0\) six times, giving \(6/8=3/4\). For the binary tetrahedral group they are \(-1\) once, \(0\) six times, and \(\pm1/2\) eight times each. The sum divided by 24 is \((6+8\cdot3+8/3)/24=49/36\). The [marked-neck manuscript](../../../03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/marked_necks_and_chiral_energy.tex) lines 395–416 gives the same \(Q_8\) value and \(9\pi^2\) threshold in the product collar setting.

For an oriented model value \(\eta_m\), write \(\Delta=|\eta-\eta_m|\), \(\beta=\|B^\circ\|_{L^3}\) and \(\mu=\|S\|_{L^{3/2}}\). The sufficient exclusion criterion for \(e<8\pi^2\) is
\[
12\pi^2\Delta+\beta\mu
 \ \le\ 12\pi^2\bigl(|\eta_m|-2/3\bigr).
\]
In particular the round \(Q_8\) datum has tolerance \(\pi^2\). Round cyclic order five and binary tetrahedral models have arithmetic tolerances \(8\pi^2/5\) and \(25\pi^2/3\), respectively. The general assertion of a positive tolerance around every datum at or above the threshold requires a strict gap \(|\eta_m|>2/3\). At equality a total error equal to zero suffices, or one may impose a fixed ambient energy margin \(\delta>0\). To exclude \(e\le 8\pi^2-\delta\) the displayed left-hand side must then be strictly below \(12\pi^2(|\eta_m|-2/3)+\delta\). The bounds in an explicit topology on data follow when that topology quantitatively controls \(\Delta,\beta,\mu\). This calculation uses no eta variation estimate.

For cyclic orders three and four the numbers \(2T/3\) and \(3T/2\) are the values of the round lower-bound expression. In fact any rational homology three-sphere \(\Sigma\) embedded in a homotopy four-sphere satisfies \(H_1(\Sigma;\mathbb Z)\cong A\oplus A\) for a finite abelian group \(A\). Indeed \(H_2(\Sigma;\mathbb Z)=0\) by three-dimensional duality and finiteness of \(H_1(\Sigma;\mathbb Z)\). Mayer–Vietoris gives \(H_2(V)=H_2(V')=0\) and identifies \(H_1(\Sigma)\) with \(H_1(V)\oplus H_1(V')\) via inclusion projections, up to the Mayer–Vietoris sign. The exact sequence of \((V,\Sigma)\) therefore identifies \(H_1(V')\) with \(H_2(V,\Sigma)\). Poincaré–Lefschetz duality and the universal coefficient theorem identify the latter with \(H^2(V)\cong\operatorname{Ext}(H_1(V),\mathbb Z)\), isomorphic as an abstract group to the finite \(H_1(V)\). No nontrivial finite cyclic group has the direct-sum form. This rules out the cyclic cut for every induced metric and second fundamental form.

## Remark 3.6

[LeBrun, *H-space with a cosmological constant*, 1982, p. 171, abstract and opening](https://doi.org/10.1098/rspa.1982.0035), checked in the publisher's preview reproduced [here](https://www.researchgate.net/publication/252614229_H_-Space_with_a_cosmological_constant), treats a real-analytic conformal metric at conformal infinity of a germ-unique self-dual Einstein metric. That passage does not provide an arbitrary trace-free second fundamental form as independent Cauchy data at a regular boundary. [Biquard, *Métriques autoduales sur la boule*, published abstract, 2002](https://doi.org/10.1007/s002220100203) confirms the scope of a whole-ball characterization for near-round data on the three-sphere. The full theorem hypotheses were not checked in this packet. Its scope supplies no arbitrary-topology filling claim.

For the analytic germ assertion there is a direct local argument. Fix an analytic representative \((h_0,B^\circ_0)\) on the marked, cooriented analytic hypersurface, with \(B^\circ_0\) trace-free for \(h_0\). Prescribe either chirality. Use Gaussian coordinates \(g=dt^2+h_t\), reached for an existing analytic conformal germ as follows. Given an analytic representative \(g_*\), solve
\[
\operatorname{div}_{g_*}(|dt|_{g_*}^{2}\nabla_{g_*}t)=0
\]
with \(t=0\) on the hypersurface and signed normal derivative prescribed so \(|dt|^2g_*\) induces \(h_0\) there. The coefficient of the second normal derivative is \(3|dt|^2\) in a \(g_*\)-orthonormal frame adapted to the initial surface since \(dt\) is normal there, hence nonzero. Cauchy–Kowalevski gives an analytic solution. With \(\hat g=|dt|_{g_*}^2 g_*\), one has \(|dt|_{\hat g}=1\) and \(\Delta_{\hat g}t=0\), the latter by the conformal Laplacian transformation on functions in dimension four. Normal flow yields Gaussian coordinates with \(\partial_t dV_{h_t}=0\). In this gauge \(B^\circ=B=\tfrac12 h'_0\) along the initial surface, and the chosen representative of \(B^\circ_0\) is preserved.

Conversely, impose the fixed-density Gaussian gauge and write \(h_t=h_0\exp K_t\) as a positive bilinear form, with \(K_t\) trace-free and \(h_0\)-self-adjoint. In \(\mathcal E_{ij}=R_{itjt}-A_{ij}-h_{ij}A_{tt}\) the terms containing \(h''\) have sum \(-\tfrac14(h'')^\circ_{ij}\). Indeed \(R_{itjt}\) and \(\mathrm{Ric}_{ij}\) each have pure second normal term \(-h''_{ij}/2\), \(\mathrm{Ric}_{tt}\) has \(-\operatorname{tr}_{h_t}h''/2\), and \(R\) has \(-\operatorname{tr}_{h_t}h''\). The trace of \(h''\) is fixed by lower jets via the density gauge. The magnetic tensor uses only tangential derivatives of \(B^\circ\). Consequently \(\mathcal E\mp\mathcal H=0\) solves for \(K''\) with no purely second normal derivatives on the right. The derivative of the positive-definite exponential chart identifies trace-free self-adjoint endomorphisms with tangent vectors to the fixed-density positive forms. The analytic initial conditions are \(K_0=0\) and \(K'_0=2h_0^{-1}B^\circ_0\). Cauchy–Kowalevski gives a unique local analytic solution. Uniqueness in the gauge identifies local patches, yielding an analytic collar germ modulo conformal changes and boundary-fixing analytic diffeomorphisms with the marked normal. Compactness gives a common small collar when the hypersurface is closed. Any comparison of two patches must identify this weighted datum and use compatible normal and chirality conventions. This argument concerns analytic germs. Existence on an entire prescribed piece is an additional filling condition.
