# E191 — Conditional twistor comparison for pointed \(C^1\) metric limits

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Fixed E execution under B94, configured `gpt-6.2-sol` / ultra. Independent runtime and lead setting attestation unavailable. I authored the separate E168/E182 metric compactness arguments and audited their manuscript uses. The present comparison assumes its metric convergence. E190 remains a frozen proposed analytic input under separate audit, and its claimed conclusion is used only as the explicit hypothesis below.

## Conditional theorem

Assume \(H_{\rm pers}\) in the precise B94 sense. For a fixed smooth embedded regular \(J_0\)-holomorphic parametrized sphere in a smooth real six-manifold, fix auxiliary norms and a compact neighborhood of its image. Suppose the fixed linearization \(W^{1,8}\to L^8\) of the Cauchy–Riemann operator has a bounded linear right inverse. Then every smooth almost complex structure sufficiently close to \(J_0\) in \(C^0\) on that neighborhood admits a smooth nonconstant holomorphic sphere, homotopic to the fixed sphere within the neighborhood. The smallness threshold uses the fixed data and is independent of derivatives of the perturbation. This is an assumption throughout E191. [B94][b94] · [E190 proposed proof][pers]

Let \((M_i,g_i)\) be smooth oriented Riemannian four-manifolds with supplied tamed **metric** positive twistor spaces. Work in the connected pointed components. Suppose there is a smooth oriented Riemannian four-manifold \((X,g)\) with pointed \(C^1\) metric convergence by actual smooth orientation-preserving comparison embeddings. Specifically, on a neighborhood of each fixed compact domain in \(X\), the comparisons are defined for all sufficiently large \(i\) and their pulled-back metrics converge to \(g\) strongly in \(C^1\) on that compact domain. Suppose the universal cover with its lifted metric is hyperkähler, with hyperkähler orientation the given lifted orientation. Then, under \(H_{\rm pers}\), the universal cover contains no embedded smooth sphere holomorphic for any member of that hyperkähler sphere of complex structures.

The taming hypothesis uses the positive vertical-area Reznikov form for the Levi–Civita connection of \(g_i\). In Fine's curvature formulation its strict pointwise inequality is

\[
 |\langle \mathsf A\theta,\theta\rangle|> |B\theta|\,|\theta|,
 \qquad 0\ne\theta\in\Lambda^+,
 \qquad \mathsf A=W^++(s/12)I,
 \quad B:\Lambda^+\to\Lambda^- .                                   \tag{1}
\]

Fine's Theorem 1 specifies \(J_+\) for \(\det\mathsf A>0\) and \(J_-\) for \(\det\mathsf A<0\). The sign is constant on each connected component because (1) makes the symmetric \(\mathsf A\) definite. It also suffices to supply strict taming of a specified canonical almost complex structure on each pointed component. Pass to an infinite subsequence of one sign \(\epsilon\in\{+1,-1\}\). No lower bound uniform in \(i\) on the taming inequality is needed. The theorem is metric, in positive Riemannian signature and the positive chirality. [Fine v2, §1.1, (1)–(2), Theorem 1 and Definition 2][fine] · [E186 assessment][assess]

## Comparison of almost complex structures on the same sphere bundle

Work first over a relatively compact smooth comparison neighborhood \(U\subset X\), with a compact larger domain containing its closure, so that \(h_i=f_i^*g_i\to g\) in \(C^1\) there. The orientation-preserving embeddings satisfy naturality for the twistor structures and vertical connections, since \(f_i\) is an isometry from \((U,h_i)\) to its open image. Its induced map on positive two-forms over \(x\) is the forward covector map \(((df_i)_x^{-1})^*\). Consequently one first compares the metrics \(h_i\) and \(g\) on the same base. This avoids any requirement on coordinate convergence of derivatives of the comparison embeddings themselves.

Use the ordinary unit sphere model \(Z_g=S(\Lambda_g^+)\). A unit \(\alpha\) corresponds to the positive orthogonal complex structure \(I_{g,\alpha}\) defined by \(g(I_{g,\alpha}v,w)=\sqrt2\alpha(v,w)\). The \(\sqrt2\) accounts for the ordinary two-form norm of a four-dimensional unit Hermitian fundamental form. Use the natural orientation of the positive three-plane and the usual unit sphere orientation and complex structure. The comparison map of Fine's Lemma 6 starts with

\[
 \psi_i=\left.\frac{1+*_{h_i}}2\right|_{\Lambda_g^+}
     :\Lambda_g^+\longrightarrow \Lambda_{h_i}^+,
 \qquad \beta_i(x,\alpha)=\left(x,\frac{\psi_i\alpha}{|\psi_i\alpha|_{h_i}}\right). \tag{2}
\]

On the fixed compact region \(\psi_i\) is nonsingular for large \(i\) by its convergence to the identity inclusion. It is orientation preserving for the natural orientations by continuous variation from \(g\). The normalized map on each sphere is a diffeomorphism, with inverse normalized from \(\psi_i^{-1}\). It preserves the sphere orientation. Compose \(\beta_i\) with the twistor map of \(f_i\) to get the smooth fiberwise diffeomorphism onto its image \(\Phi_i:Z_g|_U\to Z_{g_i}\), covering \(f_i\). [Fine v2, §2.1 Lemma 6][fine]

Here are the first-jet details. In a local smooth oriented \(g\)-orthonormal frame \(e\) of \(\Lambda_g^+\), let \(G_i\) be the \(h_i\)-Gram matrix of the frame \(\psi_i e\). The frames \(e_i=(\psi_i e)G_i^{-1/2}\) are oriented \(h_i\)-orthonormal and converge in \(C^1\) to \(e\) as sections of the fixed ambient two-form bundle. In those source and target frames the sphere map has the coordinate expression \((x,y)\mapsto(x,G_i^{1/2}y/|G_i^{1/2}y|)\). Its derivative converges uniformly to the identity, jointly in base and sphere coordinates on the compact set. Indeed the Hodge star, Gram matrix, positive square root and nonzero denominator are smooth algebraic operations on this compact positive set. The base derivative uses only the metric first jet and the fixed frame derivative. Fiber differentiation uses the same bounded operations.

In the same sphere coordinates write \(\gamma_i\) for the positive-chiral Levi–Civita connection matrix of \(h_i\) in \(e_i\). Its coefficients converge in \(C^0\) to \(\gamma\) because the Christoffel coefficients and frame derivatives use just the first jets already controlled. The horizontal graph is \((v,-\gamma_i(v)y)\), and the vertical complex structure is the standard \(j_y\) of the unit sphere. For a tangent vector expressed as \((v,w)\), the two canonical structures, with the selected sign, are represented by

\[
 J_{\epsilon,h_i}(v,w)
   =\left(\epsilon I_{h_i,y}v,
      j_y\bigl(w+\gamma_i(v)y\bigr)-\gamma_i(\epsilon I_{h_i,y}v)y\right),  \tag{3}
\]

where \(I_{h_i,y}\) is the pointwise complex structure of the unit form with coordinates \(y\) in \(e_i\). Its metric expression uses only metric values and this form. Thus (3) converges uniformly in the local sphere coordinates. Pullback by (2) uses its values and the uniformly converging derivative and inverse derivative. A finite collection of local frames over the compact region gives

\[
 J_i:=\Phi_i^*J_{\epsilon,g_i}=\beta_i^*J_{\epsilon,h_i}
                       \longrightarrow J_{\epsilon,g}
                \quad\text{in }C^0.                               \tag{4}
\]

This is the first-jet version of the geometric comparison. The \(C^1\) comparison of the *twistor* structures in Fine's Lemma 6 needs a further derivative. Fine's Proposition 7 uses that derivative in its persistence proof. Equation (4) is used with \(H_{\rm pers}\) instead. [Fine v2, §2.1 Lemma 6 and §2.2 Proposition 7][fine] · [E186 source comparison][audit]

## Closed-form class and the covering neighborhood

On \(Z_g\), the vertical tangent plane \(V\) is the oriented plane perpendicular to the unit form in the pulled-back positive three-plane. Orthogonal projection of the pulled-back Levi–Civita connection gives a metric \(SO(2)\) connection on \(V\). Its scalar curvature, with sign chosen to restrict to positive unit sphere area, is the closed Reznikov form \(\omega\). With the ordinary integral Euler convention, Chern–Weil gives

\[
                    [\omega]/(2\pi)=e(V)_{\mathbb R}.              \tag{5}
\]

Indeed the projected connection on each fiber is its Levi–Civita connection. The fiber has area \(4\pi\) and Euler number \(2\), which fix the common positive factor and sign. The same construction applies to each prelimit. The positive vertical differential of \(\Phi_i\) is an oriented isomorphism \(V\to\Phi_i^*V_i\), so Euler naturality gives \([\omega_i]=[\omega]\) on \(Z_g|_U\), where \(\omega_i=\Phi_i^*\omega_{g_i}\). This is an equality of de Rham classes. It requires no estimates on the curvature or derivatives of the forms. The \(\omega_i\) strictly tame \(J_i\) individually. [Fine v2, §2.1 vertical curvature construction and Lemma 6][fine]

Let \(p:\widetilde X\to X\) be the oriented universal covering with the pulled-back metric. If the theorem fails, choose an embedded holomorphic parametrization \(f:(\mathbb{CP}^1,j)\to(\widetilde X,I_a)\) for a unit hyperkähler direction \(a\). Choose precompact neighborhoods \(W_0\Subset W\subset\widetilde X\) of its image and make the prior choice of \(U\) contain the compact set \(p(\overline W)\). The lift of the covering to positive twistor spaces, \(\Pi:Z_{\widetilde X}|_W\to Z_g|_U\), sends the unit form at \(\tilde x\) by the forward two-form isometry \(((dp_{\tilde x})^{-1})^*\). It is a smooth local diffeomorphism everywhere. Thus \(\widetilde J_i=\Pi^*J_i\) is an almost complex structure and \(\widetilde\omega_i=\Pi^*\omega_i\) is its tamer, whether or not \(p\) is injective on \(W\). The compact norm in (4) transfers using the bounded operator norms of \(d\Pi\) and its local inverse on the chosen compact neighborhood. The latter is the inverse on tangent spaces, independent of a global inverse. The cohomology equality pulls back to \([\widetilde\omega_i]=[\widetilde\omega]\), where \(\widetilde\omega=\Pi^*\omega\).

The parallel hyperkähler frame trivializes \(\Lambda^+\) on the cover, and in \(\widetilde Z=\widetilde X\times S^2\) this makes the limit form \(\widetilde\omega=\operatorname{pr}_{S^2}^*\omega_{S^2}\). The two limit almost complex structures in this product are \(J_\epsilon(x,b)=\epsilon I_b\oplus j_b\). For the fixed \(I_a\)-holomorphic parametrization use the lift

\[
                 u_\epsilon(z)=(f(z),\epsilon a).                  \tag{6}
\]

In particular the base complex structure at the lift is \(\epsilon I_{\epsilon a}=I_a\). The minus sign demands the constant \(-a\) lift in (6). This corrects the reading of the common-sign lift notation following the product formula in Fine §2.3. Both lifts are embedded and have zero \(\widetilde\omega\) area. Fix the compact neighborhood \(\overline W_0\times S^2\) in \(W\times S^2\) for \(H_{\rm pers}\), with (6) in its interior. All maps, forms, estimates and cohomology comparisons above are defined on an open neighborhood of that compact set. [Fine v2, §§2.3–2.4][fine]

## Regularity and bounded right inverse at \(p=8\)

The horizontal lift is in the embedded case of Fine's Proposition 8 and Corollary 9. Here the kernel and index can be read without a general computation of \(c_1\) on the whole twistor space. Rotate the parallel hyperkähler coordinates so \(I_a=I_3\) and \(I_1I_2=I_3\). Along (6), the complex bundle splits as \((f^*T\widetilde X,I_3)\oplus (T_{\epsilon a}S^2,j_{\epsilon a})\), the second factor being a constant complex line. With the convention \(\bar\partial_J u=(du+Jdu\,j)/2\), its linearization at (6) has vertical equation \(\bar\partial v\) and horizontal component

\[
              \bar\partial_{f^*T\widetilde X}\eta
                     +\tfrac{\epsilon}{2}I_v,df\,j .              \tag{7}
\]

The vertical component \(v\) is interpreted as a variation of the hyperkähler direction, with \(I_v\) its endomorphism. Equation (7) follows by differentiating the product almost complex structure. In the base connection the horizontal complex structure is parallel, so that term is the Dolbeault operator of the holomorphic pullback tangent bundle. The vertical projection is holomorphic and constant at (6), so an element of the kernel has \(v\) a holomorphic function into the constant tangent line, hence constant on the compact sphere.

Suppose \(v\ne0\). Rotate the horizontal \((I_1,I_2)\) axes and rescale the real infinitesimal solution so that \(\epsilon I_v=I_2\). Since \(df\,j=I_3df\) and \(I_2I_3=I_1\), its horizontal equation is \(\bar\partial\eta+I_1df/2=0\). The embedded map has everywhere a holomorphic normal line \(N=f^*T\widetilde X/df(T\mathbb{CP}^1)\). Contracting the nonvanishing parallel \(I_3\)-holomorphic symplectic form \(\Omega=\omega_{I_1}+i\omega_{I_2}\) with \(df\) gives a holomorphic one-form with values in \(N^*\). Project the horizontal equation to \(N\) and wedge with this form. The \(\bar\partial\) term integrates to zero by holomorphicity and Stokes. The other term has nonzero integral. In a positively chosen unit quaternionic frame \((e,I_3 e,I_1 e,I_2 e)\) with the first pair tangent, the complex coordinates at the point can be chosen so that \(\Omega=dz\wedge dw\) there. Then \(I_1df\) projected to \(N\) has the components \(dx\otimes\partial_{\operatorname{Re}w}-dy\otimes\partial_{\operatorname{Im}w}\) when \(df\) is unit on the chosen domain frame. Wedging against \(\Omega(df(\cdot),\cdot)\) gives \(2i\,dA_f\), where \(dA_f\) is the induced area. The factor \(1/2\) in (7) leaves \(i\int dA_f\ne0\), a contradiction. This is the embedded, no-branch-point form of Fine's computation, with \(\epsilon\) absorbed as above. [Fine v2, Proposition 8, (6)–(7) on printed pp. 9–10][fine]

It follows that the smooth kernel consists of holomorphic sections of \(f^*T\widetilde X\) with \(v=0\). The same holomorphic symplectic form identifies \(N\simeq (T\mathbb{CP}^1)^*=\mathcal O(-2)\), so \(H^0(N)=0\). The holomorphic sections of the ambient pullback therefore come from \(H^0(T\mathbb{CP}^1)\) via \(df\). The latter has complex dimension three, generated in the affine coordinate by the degree at most two polynomial vector fields. Thus the real kernel dimension is six. The total complex bundle has rank three and degree zero, because \(f^*T\widetilde X\) has trivial determinant from \(\Omega\) and the vertical line is trivial. The real Cauchy–Riemann index is \(2(3(1-0)+0)=6\), as in Fine's Corollary 9. Equivalently the off-diagonal coupling in (7) is zeroth order, and the uncoupled Dolbeault real index is six by the rank and degree formula. [Fine v2, Corollary 9, printed p. 10][fine]

To place this in the precise Sobolev spaces, let \(D_0:W^{1,8}(u_\epsilon^*T\widetilde Z)\to L^8(\operatorname{Hom}_{\overline{\mathbb C}}(T\mathbb{CP}^1,u_\epsilon^*T\widetilde Z))\) be that intrinsic linearization, with the anti-linearity taken at the fixed solution. Its principal symbol is the smooth elliptic Cauchy–Riemann symbol. The ordinary smooth elliptic estimate on the closed domain bounds the \(W^{1,p}\) norm by the \(L^p\) norm of the equation plus the \(L^p\) norm of the section, for \(1<p<\infty\). Compactness of \(W^{1,p}\hookrightarrow L^p\) gives closed range and finite kernel. Kernel elements and distributional \(L^{p/(p-1)}\) solutions of the adjoint equation are smooth by elliptic regularity, so both dimensions and the index are the same at \(p=8\) as in the above calculation. The cokernel therefore vanishes. Choose the \(L^2\)-orthogonal complement of its six-dimensional smooth kernel inside \(W^{1,8}\), using any fixed smooth auxiliary pairing. The finite-rank projection onto the kernel is bounded on \(W^{1,8}\) by its smooth basis and the continuous \(L^2\) inclusion. On the closed complement, \(D_0\) is a bounded linear bijection onto the target \(L^8\) space. Its inverse is bounded by the Banach inverse theorem. This supplies the required fixed right inverse into \(W^{1,8}\). [Fine v2, §2.2 setup and §§2.3 index calculation][fine]

## Same-class contradiction

By (4) pulled to the compact neighborhood of (6), for all sufficiently large \(i\) the \(\widetilde J_i\) meet the fixed \(C^0\) threshold in \(H_{\rm pers}\). That hypothesis, together with the regularity and right inverse just proved, supplies smooth nonconstant \(\widetilde J_i\)-holomorphic spheres \(u_i\), homotopic to (6) within the same neighborhood. Because both forms are closed, cohomology and homotopy give

\[
 \int_{\mathbb{CP}^1}u_i^*\widetilde\omega_i
    =\int_{\mathbb{CP}^1}u_\epsilon^*\widetilde\omega_i
    =\int_{\mathbb{CP}^1}u_\epsilon^*\widetilde\omega=0 .           \tag{8}
\]

The last equality uses the constant sphere coordinate in (6). On a positively oriented domain pair \((v,jv)\), the density of the left side is \(\widetilde\omega_i(du_i v,\widetilde J_i du_i v)\), nonnegative everywhere and strictly positive wherever \(du_i\ne0\). Smooth nonconstancy gives a nonempty open set of positive density. Thus the integral is strictly positive, contradicting (8). This uses itemwise strict taming, without a uniform positive taming constant or convergence of \(\widetilde\omega_i\) as forms. [Fine v2, §2.4][fine]

## Source and evidence boundary

On 22 November 2026 I reopened Joel Fine, *Limits of Riemannian 4-manifolds and the symplectic geometry of their twistor spaces*, arXiv:1602.03829v2, in primary HTML and the unversioned arXiv submission-history page. The latter sets the accepted v2 revision at 15 November 2016. The version-specific abstract URL returned a cache miss. E186 separately records the 4 April 2018 title-page display, the linked journal metadata (*Transactions of the London Mathematical Society* 4(1), 2017, 100–109, DOI 10.1112/tlm3.12003) and the different withdrawn v1 claim. The published body was not used. The inspected v2 passages were §1.1 definitions, (1)–(2), Theorem 1, Definition 2 and Theorem 3 (printed preprint pp. 1–3), §2.1 vertical curvature and Lemma 6 (pp. 5–7), §2.2 Proposition 7's \(p>2\) setup and comparison (pp. 7–8), §2.3 Proposition 8, (6)–(7) and Corollary 9 (pp. 8–10), and §2.4 (pp. 10–11). No other paper or discovery query was used. No local primary bytes were retained. [Primary v2 HTML][fine] · [Version history][meta] · [Exact locator record][audit]

The only additional analytic hypothesis of this comparison is \(H_{\rm pers}\). The smooth metric limit and metric twistor taming are supplied geometric hypotheses. In particular this derives neither metric taming from a separate definite native connection nor an extraction result. The proof concerns embedded spheres for the positively oriented hyperkähler triple, and leaves the multiple-cover question and the independent E190 audit outside scope.

| Input | SHA-256 |
| --- | --- |
| [E191 request][req] | `f5069f4e2d602ccb626d6617f1aeef5321317331b7357bc32563d0462702116f` |
| [B94][b94] | `c1ada5247f59596398e916c0b589a0f19bab818d666aee628ce7950c78da8d9a` |
| [E186 assessment][assess] | `aabd5b851a0373d8d2331a5ace9035a634eb2933d7f731632255780d08901f65` |
| [E186 source audit][audit] | `31ead6b42eff300f3afb0633e802ba3ba75f15e69a431cc5fc656003bc4f4c6e` |
| [E190 proposed proof][pers] | `c928a60dfe4fe6fbafe4428261f7b77164648a88382c20ca5ff06b8f9302a2ea` |

[req]: ../research-progress/handoffs/SP4-CME-E191_REQUEST_v1.md
[b94]: ../brainstorm/notes/B94_C1_TWISTOR_LIMIT_COMPARISON_20261122.md
[assess]: ../reviews/E186_TWISTOR_COMPARISON_ASSESSMENT_20261122.md
[audit]: ../reviews/E186_TWISTOR_LIMIT_SOURCE_AUDIT_20261122.md
[pers]: 190_C0_CURVE_PERSISTENCE_TEST_20261122.md
[fine]: https://arxiv.org/html/1602.03829v2
[meta]: https://arxiv.org/abs/1602.03829
