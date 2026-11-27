# Robin sign, smoothing and capped descent

27 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded execution packet SP4-CUT-SEAM-E04, request r1. The request specifies `gpt-6.2-sol` / `ultra`. Actual serving model and effort were unavailable for independent verification. Working HEAD `bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0`. Inputs were the parent manuscript §§2, 5 and 8 (SHA-256 beginning `ccb52d6a2548fb8f`), the B02/B01 choice (`21d16c5c0c30`) and request (`e8e425664156`). This check gives proofs in the stated category and a seam-jet example. [Request](../research-progress/handoffs/E04_REQUEST_R1.md) · [B decision](../brainstorm/notes/B02_B01_BOUNDARY_CHOICES_20261127.md) · [Parent manuscript](../../manuscript/cuts_of_subcritical_conformal_classes.tex) · [Sole register](../research-progress/REGISTER.md)

## The whole-side Robin criterion

Let \(V\) be a compact connected smooth Riemannian four-manifold with smooth boundary. Take \(\Delta=\operatorname{div}\nabla\), outward unit normal \(\nu\), \(B(X,Y)=g(\nabla_X\nu,Y)\), and trace mean curvature \(H=\operatorname{tr}_h B\). In dimension four the conformal metric is \(\tilde g=w^2g\), \(w>0\) smooth. The transformations

\[
R_{\tilde g}=w^{-3}(-6\Delta_g w+R_gw),\qquad
\tilde H=w^{-1}(H+3\partial_\nu\log w),\qquad
\tilde\nu=w^{-1}\nu
\]

follow from the scalar conformal change and the transformation of \(B\). They give the covariant pair

\[
L_g=-6\Delta_g+R_g,\qquad
\mathcal B_g=6\partial_\nu+2H,qquad
L_{\tilde g}u=w^{-3}L_g(wu),\qquad
\mathcal B_{\tilde g}u=w^{-2}\mathcal B_g(wu).
\]

Green's identity gives the form

\[
Q_V^g(u)=\int_V(6|\nabla u|^2+Ru^2)\,dV+2\int_{\partial V}H|u|^2\,dA
=\int_VuL_gu\,dV+\int_{\partial V}u\mathcal B_gu\,dA
\]

for real smooth \(u\), with extension to \(H^1(V)\). The volume and boundary scale factors cancel the weights in the last two integrals, so \(Q_V^{\tilde g}(u)=Q_V^g(wu)\). With mean curvature averaged by three, the boundary term would instead be six times the averaged mean curvature. The two sides of a cut see opposite \(H\) in the same smooth gauge. [Parent manuscript §2](../../manuscript/cuts_of_subcritical_conformal_classes.tex) · [Lee–Parker §§1–2][lp]

The first Robin eigenvalue \(\lambda_V=\inf_{u\ne0} Q_V^g(u)/\|u\|_2^2\) is the lowest eigenvalue of \(L_gu=\lambda u\) with \(3\partial_\nu u+Hu=0\). The trace estimate \(\|u|_{\partial V}\|_2^2\le\epsilon\|\nabla u\|_2^2+C_\epsilon\|u\|_2^2\) gives \(Q_V\ge a\|\nabla u\|_2^2-C\|u\|_2^2\) for some \(a>0\). Compact embedding in \(L^2\) and compactness of the trace into \(L^2(\partial V)\) yield a minimizing eigenfunction. The form is coercive on \(H^1\) if \(\lambda_V>0\), by taking a convex combination of the gradient estimate and \(Q_V\ge\lambda_V\|u\|_2^2\). If \(\lambda_V=0\), the form is nonnegative with a nonzero null function, and if \(\lambda_V<0\) there is a negative test function. Multiplication by \(w\) is an isomorphism of \(H^1\), so the sign is conformally invariant.

For an umbilic boundary take \(\partial_\nu\log w=-H/3\) along the boundary. The resulting \(B=0\) makes the even reflection \(G\) on \(\mathcal D V\) of class \(C^2\) in geodesic collars, where \(G=dt^2+h(|t|)\) and \(h'(0)=0\). Its weak scalar form is the sum of the two Neumann forms. For every \(H^1\) function on the double, restricting to the two halves gives \(Q_{\mathcal D V}\ge\lambda_V\|u\|_2^2\) in this gauge. Conversely, even extension of an \(H^1(V)\) competitor doubles numerator and squared \(L^2\) norm. Thus the first closed eigenvalue of this specific reflected metric equals the first side eigenvalue in the normalized gauge. The sign of the closed Yamabe quotient

\[
Y(G)=\inf_{u\ne 0}\frac{Q_{\mathcal D V}^G(u)}
{\bigl(\int_{\mathcal D V}|u|^4\,dV_G\bigr)^{1/2}}
\]

is the same sign, by coercivity and \(H^1\hookrightarrow L^4\) in the positive case, and the null or negative test in the other cases. A second totally geodesic gauge has a conformal ratio with vanishing normal derivative, and multiplication by that factor on both copies preserves matching traces and the quotient. An equivalent interpretation for the positive case is that all sufficiently close smoothings have positive Yamabe constant. A representative with \(R>0\) and \(H\ge0\) already proves positivity on that side. In particular \(R>0\) and \(H=0\) on a cut in the same ambient gauge prove positivity of both doubles when the cut is umbilic.

An ambient conformal reflection which interchanges the two entire sides gives a separate sufficient condition. Averaging the representative and its pullback is conformal and makes the reflection isometric. Each side then reflects to the ambient class and inherits its sign. The retained local reflection in 07's direct equators gives \(B=0\) but has no stated extension across the assembled sides. The regular and long cuffs settle the three-dimensional sign, and the short cuffs obstruct entry. The two whole-side signs for the regular and long cuffs remain unevaluated. The prescribed product-circle face passing the three-dimensional test generally has nonzero \(B^\circ\). The Mazur swap-invariant class has the ambient sign on each side, with a strict entering budget already excluded by 07. The standalone eta-zero Robin sign of the Mazur half is still unresolved. [07 direct seam readback, SHA-256 \(019cf5c4d869\)](../../../07_positive_subcritical_entry/reviews/DIRECT_SEAMS_READBACK.md) · [07 prescribed seams, SHA-256 \(bb2fb165d08c\)](../../../07_positive_subcritical_entry/reviews/SEAM_REPLAY.md) · [07 register](../../../07_positive_subcritical_entry/research-progress/REGISTER.md)

## Smoothing and the weak Yamabe bound

For two smooth pieces with identified boundary metrics and opposite outward second fundamental forms, use boundary normal collars with a common signed normal coordinate. The assembled metric \(G\) is \(C^{1,1}\) and piecewise smooth. Its distributional second derivatives are the ordinary side derivatives almost everywhere because the first derivatives agree. Local convolution of tensor components and a fixed smooth partition of unity give smooth positive metrics \(G_k\to G\) in \(C^1\cap W^{2,p}\) for each finite \(p\), with positivity of the matrices following from uniform convergence. Curvature terms have linear second-derivative terms with converging coefficients and quadratic first-derivative terms. Thus \(R\) and the Weyl blocks converge strongly in \(L^2\) using \(p=2\). The volume densities, contractions and chiral projections are controlled by the uniformly converging metrics. Both chiral energies converge to the sum of their piece integrals, using the orientation of the glued manifold.

On a fixed closed underlying manifold the scalar form is continuous in the sense

\[
|Q^{G_k}(u)-Q^G(u)|\le o(1)\|u\|_{H^1}^2 ,
\]

with the norms measured in a fixed smooth background. The scalar part uses Hölder with \(R_{G_k}-R_G\) in \(L^2\) and the Sobolev estimate for \(u\) in \(L^4\). The \(L^4\) denominators are uniformly equivalent with ratios tending to one. Under \(L^4\) normalization the scalar integrals of approximate minimizers are uniformly bounded in absolute value by the bounded \(L^2\) scalar norms. The gradient term has a fixed positive ellipticity constant, giving bounded \(H^1\) norms. Fixed test functions give the upper limit and uniform form convergence on these bounded minimizing sequences gives the lower limit. Hence \(Y(G_k)\to Y(G)\) for each sign. In a zero-sign limit the convergence alone gives no strict sign for the smooth metrics.

Use the real curvature-operator Hilbert–Schmidt chiral blocks and \(e_V=(E_+(V)+E_-(V))/2\), \(T=4\pi^2\). Opposite orientations on the reflected halves give \(E_+(G)=E_-(G)=2e_V\), and \(\chi(\mathcal D V)=2\chi(V)\). Apply the closed Yamabe theorem to each smooth metric \(G_k\), normalizing the minimizing representative to volume one and scalar curvature \(Y(G_k)\). Closed Chern–Gauss–Bonnet gives

\[
16\pi^2\chi(V)=E_+(G_k)+E_-(G_k)+\frac{Y(G_k)^2}{24}
-\frac12\int_{\mathcal D V}|\operatorname{Ric}_0|^2\,dV .
\]

This proves \(e_V\ge T\chi(V)-Y(G)^2/96\) for the umbilic double, including the nonpositive Yamabe signs. In particular \(Y=0\) implies \(e_V\ge T\chi(V)\). If \(e_V<T\chi(V)\) and the Robin sign is nonpositive, then \(Y\le-\sqrt{96(T\chi(V)-e_V)}\). The weak bound alone provides no sign when the sign has not been tested. [CGY (0.4)][cgy] · [Lee–Parker §11][lp] · [Master double calculation](../../../../master/manuscript/claude/umbilic_doubling.tex)

## Positive caps with either bending sign

Let \(V_i\), \(i=1,2\), be the two closed sides of a smooth cut \(\Sigma\cong S^3\) in a smooth oriented homotopy four-sphere \(M\). Write \(D_i\) for a marked smooth four-ball cap and \(G_i\) for the resulting matched first-jet metric on \(X_i=V_i\cup D_i\). Use the orientation of \(M\) on each \(V_i\) and extend that orientation over its cap. A smooth conformal gauge imposes any chosen boundary representative and the trace \(H=0\) by fixing the boundary value and first normal derivative of \(\log w\). It imposes \(H=0\) on both sides at once and generally retains opposite nonzero trace-free forms. Match the cap with \(h_{D_i}=h_{V_i}\), \(B_{D_i}=-B_{V_i}\), both forms defined outward. In the inward cap collar the initial derivative is \(h'_{D_i}(0)=2B_{V_i}\). The cap for the other side uses the other bending sign.

If the B01 trial cap is sufficiently close in \(C^2\) to the unit round hemisphere, its scalar curvature is positive, since the round value is 12. In the trace-zero gauge its Robin form is positive for either bending sign, with coercivity following from the scalar lower bound. The matched closed form is exactly

\[
Q_{G_i}(u)=Q_{V_i}(u|_{V_i})+Q_{D_i}(u|_{D_i}).
\]

This follows since the bulk integrals add and the boundary terms cancel on the common trace. Hence side Robin positivity and positive cap Robin sign imply closed Yamabe positivity, and smoothing preserves it. Side sign zero with a strictly positive cap also suffices. Both forms are then nonnegative. If the closed form has infimum zero on the \(L^2\) unit sphere, its compact minimizer has zero cap restriction and therefore zero trace. The side restriction must be a first Robin null function. Such a function can be taken nonnegative by replacing it by its absolute value, and must be positive up to the boundary by elliptic regularity, the strong maximum principle and the boundary point lemma with the Robin condition. This contradicts its zero trace. For the free cut the round hemisphere has the same positive cap sign with zero Weyl cost. Positive cap sign uses the strong scalar curvature estimate or a separate sign check. [B01 trial choice](../brainstorm/notes/B02_B01_BOUNDARY_CHOICES_20261127.md)

## Capped descent with both chiral inequalities

The capped manifolds \(X_i\) are smooth homotopy four-spheres. The fundamental group of \(M\) is the free product of those of the sides by van Kampen across \(S^3\), so both are trivial, including after capping. Mayer–Vietoris gives \(H_1(V_i)=H_2(V_i)=0\), and the orientation connecting map \(H_4(M)\to H_3(S^3)\) is an isomorphism, giving \(H_3(V_i)=0\). Capping gives integral sphere homology and simply connectedness gives the homotopy type. With boundary markings matching the given cut, \(M\cong X_1\# X_2\). Cerf's connectedness theorem for \(\operatorname{Diff}^+(S^3)\) and extension of a linear reflection show that every smooth boundary diffeomorphism extends over the standard ball. An isotopy in a collar followed by the identity on the remaining ball gives the extension in the orientation-preserving case. Consequently if \(X_i\cong S^4\), then \(M\cong X_j\) for \(j\ne i\). [Cerf, Introduction (1) and Kuiper's summary][cerf]

Put \(e=e_1+e_2\), \(e_i=e_{V_i}\), \(C_{i,\pm}=E_\pm(D_i)\) and \(c_i=(C_{i,+}+C_{i,-})/2\). Smooth approximation and the closed signature formula with \(\tau(X_i)=\tau(M)=0\) give

\[
E_\pm(M)=E_\pm(V_1)+E_\pm(V_2)=e,qquad
E_\pm(V_i)+C_{i,\pm}=q_i:=e_i+c_i .
\]

The second equality is an exact identity of limiting energies. For either one of the two choices of \(i\), if \(Y(G_i)>0\) and \(q_i<T\), smooth positive approximations have energy strictly below \(T\) for all sufficiently large indices. Chang–Gursky–Yang then give \(X_i\cong S^4\). Their four-index norm yields \(\int |W|^2=8q_i\) at the limit, while the threshold is \(16\pi^2\chi(X_i)=32\pi^2\). Orientation and homology exclude \(\mathbb{RP}^4\). If both capped Yamabe constants are positive and each \(q_i<T\), then \(M\cong S^4\). With both capped Yamabe constants positive, the aggregate bound \(e+c_1+c_2<2T\) guarantees at least one of the strict inequalities. At a limiting threshold \(q_i=T\) the strict test has no margin. If there is a smooth positive capped representative attaining the exact threshold, CGY Theorem B also recognizes this homotopy sphere, since equality alternatives outside \(S^4,\mathbb{RP}^4\) have either nonzero \(b_2\) or infinite \(\pi_1\). [CGY Theorems A and B, Remark 2][cgy] · [Closed signature case of APS I (4.14)][aps]

For a cap of nonpositive Yamabe sign, the closed Chern–Gauss–Bonnet argument gives

\[
q_i\ge 2T-\frac{Y(G_i)^2}{48}.
\]

In particular if \(q_i<2T\) and \(Y(G_i)\le0\), then \(Y(G_i)\le-\sqrt{48(2T-q_i)}\). If the sign is unknown this implication does not establish it. If either cap does have positive sign and meets the strict recognition threshold, the topology conclusion for that side needs no sign information on the other cap.

For the energy comparison let \(I(M)=\inf\{e(g'):\ g'\text{ smooth and }Y([g'])>0\text{ on }M\}\). Suppose \(X_i\cong S^4\) is established and \(Y(G_j)>0\) for \(j\ne i\). Transfer smooth positive approximants of \(G_j\) to \(M\cong X_j\). Their energies tend to \(q_j\), so \(I(M)\le q_j=e_j+c_j\). If \(e\le I(M)+\delta\) for \(\delta\ge0\), then on the side removed,

\[
e_i\le c_j+\delta,\qquad
E_+(V_i)\le C_{j,+}+\delta,\qquad
E_-(V_i)\le C_{j,-}+\delta.
\]

For each chiral inequality subtract \(E_\pm(V_j)\) from \(e\le q_j+\delta\). At a minimizer \(\delta=0\). For example, if \(M\) is nonstandard and both capped signs are positive with \(e+c_1+c_2<2T\), exactly one capped side is standard and the other cap gives these bounds. For a free cut use \(c_1=c_2=0\). Then every removed side in this conclusion is conformally flat by smoothness of the original metric and nonnegativity of each chiral integrand. The same proof covers near-free cuts once the matched cap budgets and signs are known. A global conformal reflection interchanging the two sides of an entering free cut supplies both Robin signs, hence both positive hemispherical caps, and symmetry gives \(e_1=e_2=e/2<T\). It therefore recognizes the ambient sphere.

## The exact-energy claim and the development step

The metric of a free side capped with a round hemisphere has exactly the side energy as a piecewise smooth integral. First-jet smoothing proves convergence, which suffices for the strict tests and infimum comparison above. To see the obstruction to a smooth gluing that preserves the two pieces, start on the round \(S^4\) with equatorial distance \(t\) and perturb the tangential metric by \(t^2\chi(t)k\), where \(\chi=1\) near zero and is supported in a collar, and \(k\) is a small, smooth, nonzero trace-free tensor for the round three-metric. The equator retains its free datum. Its second normal metric derivative gains \(2k\). At the seam the normal curvature block gains \(-k\), while the tangential curvature is unchanged. The tangential Ricci gains \(-k\), and the normal Ricci and scalar are unchanged. Thus the electric Weyl component gains \(-k/2\). The cap remains Weyl-flat in every smooth conformal gauge, so preserving both classes all the way to the seam cannot yield a smooth joined class in this example. Positivity and entering energy still hold for the perturbed sphere if the perturbation is small in \(C^2\). An unrelated smooth metric of the same numerical energy is a separate assertion. Proposition 8.1(1) is established with the energy equality for the piecewise metric and arbitrarily accurate smooth approximants.

For the paragraph following Proposition 8.1, let \(V\) be a compact simply connected smooth side with smooth Weyl-flat metric and connected free boundary. Here is the boundary extension needed to show that development gives a round ball. A neighborhood of a boundary point admits a smooth flat conformal chart up to the boundary. On a small coordinate half-ball the standard tractor in a smooth scale is the connection on triples

\[
D_i(\sigma,\mu_j,\rho)=(\partial_i\sigma-\mu_i,\,
\nabla_i\mu_j+A_{ij}\sigma+g_{ij}\rho,\,
\partial_i\rho-A_i{}^j\mu_j).
\]

Its curvature is given by Weyl and Cotton, both zero by Weyl-flatness and the contracted Bianchi identity. The formulas extend to the boundary by smoothness. Parallel transport in the half-ball gives a parallel triple with initial value \((1,0,0)\) at the boundary point. The connection preserves \(2\sigma\rho+|\mu|^2\), so the triple is null and \(\sigma>0\) near the point. It satisfies \(\mu=d\sigma\), \(\nabla^2\sigma=-\sigma A-\rho g\), \(|d\sigma|^2=-2\sigma\rho\). The Schouten transform of \(\sigma^{-2}g\) is zero, and its Weyl tensor is also zero. Its flat Levi-Civita connection gives a parallel coframe, whose local primitives give Euclidean coordinates smooth up to the boundary. [Gover–Nurowski §3.1, connection and curvature (3.7)][gn]

The interior is simply connected by the collar retraction and admits a conformal developing map to \(S^4\). On each half-chart the map extends to the seam by a Möbius transformation of that chart, using Liouville on the interior overlap. In each flat chart the boundary is umbilic, hence lies in a sphere or a plane. Indeed Codazzi gives constant principal curvature for an umbilic Euclidean hypersurface, and integrating the normal derivative gives a fixed centre or normal. Thus each boundary image lies in a round \(S^3\subset S^4\). Overlapping open boundary patches and connectedness give the same round \(S^3\) everywhere. The boundary map is a local diffeomorphism to it and is a diffeomorphism by compactness and simple connectivity of the target. Postcompose the developing map on the second copy of \(V\) with the Möbius reflection fixing that \(S^3\) pointwise. The resulting map on the topological double is locally a homeomorphism, including at the seam where the two half-charts map into opposite sides. The double is compact and connected, so it covers \(S^4\) and is mapped homeomorphically onto it. Each side map is already a smooth conformal local diffeomorphism up to the boundary, hence sends the side conformally diffeomorphically onto a closed round ball. This establishes the claimed conformal interpretation at the free-cut minimizer, conditional on the capped signs. [Schoen–Yau p. 47 and §1][sy]

## Primary passage receipts

Read 27 November 2026. The input texts above are repository manuscripts or earlier checks. No external reading copy was added to the repository.

| Inspected primary text | Passage and use |
| --- | --- |
| J. M. Lee and T. H. Parker, *The Yamabe problem*, Bull. Amer. Math. Soc. 17 (1987), 37–91 | Equations (1.2), (1.4) and (1.5) and §11 Yamabe Theorem, p. 85. The smooth closed result in dimension four gives a minimizer of the closed quotient and, at volume one, constant scalar curvature equal to the Yamabe constant, without a sign restriction. The Robin identity was derived directly. [Text][lp] |
| S.-Y. A. Chang, M. J. Gursky and P. C. Yang, *A conformally invariant sphere theorem in four dimensions*, arXiv:math/0309287v1, 17 September 2003, published in Publ. Math. IHÉS 98 (2003), 105–143 | Theorems A and B, Remark 2 and (0.4), preprint pp. 2–4. On smooth closed four-manifolds the positive conformal Yamabe constant and strict four-index integral bound imply \(S^4\) or \(\mathbb{RP}^4\). The equality statement assumes those diffeomorphism types are absent. Formula (0.4) fixes the coefficients and the norm conversion. [Text][cgy] |
| M. F. Atiyah, V. K. Patodi and I. M. Singer, *Spectral asymmetry and Riemannian geometry. I*, Math. Proc. Cambridge Philos. Soc. 77 (1975), 43–69 | Theorem (4.14), p. 66. For a smooth closed oriented four-manifold the boundary correction is absent and the degree-four \(L\)-class is \(p_1/3\). The chiral energy normalization is that of parent §2. [Text][aps] |
| J. Cerf, *Sur les difféomorphismes de la sphère de dimension trois (\(\Gamma_4=0\))*, Lecture Notes in Mathematics 53 (1968) | Introduction statement (1), p. 1, and Kuiper's English summary. Connectedness of the orientation-preserving smooth diffeomorphism group of \(S^3\) gives isotopy to the identity and the collar extension used above. [Text][cerf] |
| A. R. Gover and P. Nurowski, *Obstructions to conformally Einstein metrics in \(n\) dimensions*, arXiv:math/0405304v3, 9 June 2004 | §3.1, pp. 16–17, metric, connection and curvature (3.7). The displayed smooth connection and its curvature imply flatness in the Weyl-flat half-chart. The boundary extension is the local parallel transport argument above. [Text][gn] |
| R. Schoen and S.-T. Yau, *Conformally flat manifolds, Kleinian groups and scalar curvature*, Invent. Math. 92 (1988), 47–71 | Introduction p. 47 and §1. Liouville and monodromy give the conformal developing immersion in dimension at least three on the simply connected interior. Injectivity here follows from the explicit boundary reflection and covering argument. [Text][sy] |

[lp]: https://users.math.msu.edu/users/parker/YamabeProblem.pdf
[cgy]: https://arxiv.org/pdf/math/0309287
[aps]: https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps001.pdf
[cerf]: https://web.ma.utexas.edu/users/abhishek/files/cerf_theory/cerf_theorem.pdf
[gn]: https://arxiv.org/pdf/math/0405304
[sy]: https://math.jhu.edu/~js/Math646/schoen-yau.conformal.pdf
