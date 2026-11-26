# The marked direct trial, the zero-Yamabe threshold and band variation

26 November 2026, for Edward B. Baker III with OpenAI Codex assistance. B02 lead calculation, selected GPT-6.2 Astra/ultra, exact serving metadata unavailable. Working intake 1c81a3048c8c. Inputs are the [tube and inverse maps](MARKED_CONNECTION_ASSEMBLY.md), [complete exterior](FUNNEL_EXTERIOR.md), [single-relator closings](SINGLE_RELATOR_CLOSURES.md), [local Ricci floor](RETAINED_FLAT_WALL.md) and [width issues](../research-progress/handoffs/DIRECT_SECOND_ISSUE_20261126.md). Versions and independent readings are in the [return](../research-progress/handoffs/DIRECT_EQUATOR_RETURNS_20261126.md).

## Physical representative and interpolation

Use the minus length-14 presentation and both framed embeddings \(\Phi_i\) in the marked assembly. Fix a hyperbolic metric in the actual planar coordinates of its labeled pants \(F\) as follows. Form the Schottky double of the circular domain \(F\) with its planar complex structure. Uniformize that closed genus-two double to curvature \(-1\). The involution interchanging the copies and planar complex conjugation are isometries. The three real-axis intervals between successive boundary components cut the original pants into upper and lower hexagonal disks. In the target use the pants \(P_L\) made by doubling a right-angled hexagon along the three common perpendiculars between labeled cuffs. Its three alternating cuff segments have length \(L/2\). Double \(P_L\) across its cuffs. Label corresponding cuffs by the outer circle and the two holes, each perpendicular by its incident pair, and distinguish the upper hexagon and the original pants copy. Identify the two cell decompositions respecting these labels and cyclic order. Extensions over the edge intervals and the four disk faces give a unique homotopy class of oriented homeomorphisms. This assertion follows by isotopy on each interval relative to its ends and then on the disks relative to their boundaries.

Let \(h_L\) be the unique harmonic diffeomorphism of the closed hyperbolic doubles in this class. Uniqueness makes it intertwine the corresponding reflections. It takes the source pants into the assigned copy. Indeed the labeled cell map is equivariant, the cuff geodesics have distinct free homotopy classes, and interchange of copies would interchange the two distinct pants subgroups in the double. Equivalently, the signed cuff classes on each boundary circle have the orientation specified by the cell map, and restriction of an orientation-preserving diffeomorphism to the other half reverses that boundary assignment. Put \(q_L=h_L^*g_{P_L}\) on \(F\). This fixes all derivatives in the *original* coordinates used to displace the relator paths. No computation of the harmonic coordinates is assumed. Orient each cuff by the boundary orientation and start its arclength at the endpoint of the seam to the first other cuff in the order outer, left, right. The funnel metric is independent of this origin. [Schoen–Yau, §3 corollary, degree one on closed surfaces of the same genus greater than one](https://archive.ymsc.tsinghua.edu.cn/pacm_download/59/11042-Shing-Tung_Yau_47.pdf) · [Wolf, §2, closed negative-curvature harmonic marking theorem and original attributions](https://pagine.dm.unipi.it/~a019210/Wolf_Teichmuller%20theory%20of%20harmonic%20maps.pdf#page=4)

On \(U_i=[0,1/8]\times S^1\times S^2\), put \(r=1+s\), use angle \(\theta=2\pi t\), and evaluate the fixed \(\Phi_i\) at \((t,rp)\). Let \(A=ds^2+\sinh^2r\,d\theta^2+\sigma\), \(B_i=\Phi_i^*(q_L+\sigma)\) in these radial variables, and \(s_*=3/32\). Freeze
\[
 g_{i,\varepsilon}=(1-a_\varepsilon)A+a_\varepsilon B_i,\qquad
 a_\varepsilon(s)=H\big((s-s_*)/\varepsilon+1/2\big).
\]
Here \(H(t)=j(t)/(j(t)+j(1-t))\), where \(j(t)=e^{-1/t}\) for \(t>0\) and zero otherwise. The baseline \(\varepsilon=1/16\) gives \(H(16s-1)\). All positive-definite coefficients, including mixed and normal coefficients, are interpolated. Adjoin the positive-facing hyperbolic disk of radius one times \(S^2(1)\) at each inner face. Keep the full compactification of \(q_L+\sigma\), with its specified radial factor, at both outer faces. Exact jets agree across all faces. For the baseline the switch becomes constant precisely at the outer face and the attached exterior supplies its open outer germ. Both surgery maps and their inverses are those of the marked assembly. Each sign on the **closed** metric equals \(c_1+c_2\), where both signs on \(U_i\) equal \(c_i>0\) by the separate closing \(N_i\) and longitude holonomy.

## One finite narrow trial

Take \(L=2\operatorname{arcosh}5\) and the same width on both bands. For each \(i\) let \(b_i>0\) be the finite width bound \(\min\{\rho, A_iD/[2(C_i+1)]\}\) of the [negative Rayleigh test](THIN_DIRECT_SIGN.md), with the constants defined there, all evaluated at \(q_L\). Write \(K_i>0\) for the explicit frozen electric integral called \(C_i\) in the [signed energy calculation](DIRECT_WIDTH_WEYL.md). Define \(P_{i,\pm}(z)=z^3 E_\pm(U_i;g_{i,z})\) for \(0<z\le1/128\) and \(P_{i,\pm}(0)=K_i\). These are smooth from the right at zero. In the layer coordinates the two-jet formula for rescaled curvature, volume density and Hodge projectors is smooth in \(z\) on the closed parameter interval, in finitely many fixed tangent charts with a partition of unity. The denominator is bounded away from zero there by positive definiteness. Integrating on the fixed layer establishes the claimed regularity. The complement of that layer carries zero Weyl curvature.

Define the finite number \(D_i=1+\max_{\pm,\,0\le z\le1/128}|\partial_z P_{i,\pm}(z)|\). One particular trial has
\[
 \varepsilon=\min_{i=1,2}\{1/128,\ b_i,\ K_i/(2D_i),\ (K_i/(32\pi^2))^{1/3}\}.
\]
All inputs are integrals, smooth maps or extrema on the specified geometry. Each band separately has \(P_{i,\pm}(\varepsilon)\ge K_i/2\), hence \(c_i\ge16\pi^2\). A smooth global Rayleigh test supported in either band gives a strictly negative numerator. This is a finite counterexample to this width strategy on a seam-positive exterior. The width is defined without a numerical estimate of the constants. No bound at \(\varepsilon=1/16\) follows. [Long-cuff seam](LONG_CUFF_SEAM.md) · [Closed finite-width sign test, with cuff radius parameter replaced by \(L/(2\pi)\)](DIRECT_CLOSED_SIGN.md)

## A two-sided Yamabe interval excluded at fixed exterior

Fix the scalar-flat product region \(K\Subset\Omega_1\Subset\Omega\) with its loxodromic cuff and the constant \(\kappa>0\) of the [retained-region calculation](RETAINED_FLAT_WALL.md). All arguments here apply separately to any one fixed \(q_L\) and every completion that preserves \(g_0=q_L+\sigma\) on \(\Omega\). For a unit-volume Yamabe minimizer \(u^2g\) write \(Y=Y(M,[g])\). On \(\Omega\), \(-6\Delta u=Yu^3\) and \(\int_\Omega u^4\le1\). We claim some \(\eta>0\) satisfies
\[
 |Y|<\eta\quad\Longrightarrow\quad e\ge8\pi^2+\kappa/16 .
\]
At \(Y=0\) the stronger \(\kappa/4\) margin holds. Here \(e\) is either full chiral energy.

To include the positive side, suppose \(Y_j\to0\), taking unit-volume minimizers \(u_j\). For a fixed cutoff \(\zeta\) compactly supported in \(\Omega\), write \(v=u_j^2\). Testing the equation by \(\zeta^2u_j^3\) gives
\[
 \tfrac34\int\zeta^2|\nabla v|^2
 +\int\zeta v\,\nabla\zeta\cdot\nabla v
 =\tfrac{Y_j}{6}\int v(\zeta v)^2 .
\]
The fixed four-dimensional Sobolev inequality and Young's inequality yield
\[
 \|\zeta v\|_4^2
 \le C |Y_j|\,\|v\|_2\|\zeta v\|_4^2
       + C\int(\zeta^2+|\nabla\zeta|^2)v^2 .
\]
The coefficient can be absorbed since \(\|v\|_2\le1\). Taking the cutoff equal to one on a neighborhood of \(\overline{\Omega_1}\) bounds \(u_j\) in \(L^8\) there uniformly. Interior \(W^{2,8/3}\) estimates on smaller sets, followed by Morrey embedding, bound \(u_j\) in \(C^{0,\alpha}\) for \(0<\alpha<1/2\) on \(\overline{\Omega_1}\). Thus the potential \(Y_j u_j^2/6\) tends to zero locally in \(C^{0,\alpha}\). The positive normalized \(u_j/u_j(o)\) obeys the linear equation with this potential. On compact subsets of the connected \(\Omega_1\), Harnack and interior Schauder estimates give a subsequence converging in \(C^2\) to a positive harmonic function with value one at \(o\). Applying this extraction to a subsequence realizing the lower limit, the scale-invariant local trace-free Ricci integral on \(K\) therefore has liminf at least \(\kappa\), by the definition of the latter infimum. In particular it is at least \(\kappa/2\) for every such closed completion with \(|Y|\) sufficiently small. The constants are uniform over the completion since only the fixed interior geometry and the global unit-volume normalization entered.

In the two-form Hilbert–Schmidt norm, signature and Gauss–Bonnet on this homotopy sphere give
\[
 e=8\pi^2+\tfrac14\int_M|\operatorname{Ric}_0(u^2g)|^2\,dV_{u^2g}-Y^2/48 .
\]
Shrink \(\eta\) to at most \(\sqrt{3\kappa}\). This proves the claim. In particular, subcritical positive completions of this fixed exterior must have \(Y\ge\eta>0\). A path from a positive to a negative closed class preserving this product must cross \(Y=0\), where its signed cost is at least \(8\pi^2+\kappa/4\). The constants depend on the local retained metric and are existence bounds. [Yamabe equation and conformal covariance, Lee–Parker](https://math.jhu.edu/~js/Math646/lee-parker.yamabe.pdf) · [Interior estimates and Harnack inequality, Gilbarg–Trudinger](https://doi.org/10.1007/978-3-642-61798-0)

## Descent at exact energy equality

On the smooth single-relator closing \(N_i\) use \(\mathcal W=\int(|W^+|_{\rm HS}^2+|W^-|_{\rm HS}^2)\,dV\). Relative to smooth variations through metrics with the prescribed end germs, \(\mathcal W=2c_i\). Its metric \(L^2\) gradient \(G\) is a nonzero universal multiple of the Bach tensor. If \(G=0\) in the band interior, it vanishes on the entire closed \(N_i\), since the complement is locally conformally flat and all joins are smooth. A connected smooth Bach-flat four-manifold carrying a Weyl-flat open set has \(W=0\) everywhere, by Lassas–Liimatainen, Theorem 1.4 or 3.8, using the dimension-four obstruction tensor. This contradicts the nontrivial exterior longitude and the trivial cap longitude under the given parametrization. Thus \(G\ne0\) on some open subset compactly inside the band. The same argument applies when open, Weyl-flat end collars are held fixed. [Chang–Gursky–Yang, discussion preceding Theorem C](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf#page=6) · [Lassas–Liimatainen, Theorem 3.8](https://arxiv.org/pdf/1912.08030#page=27) · [Longitude mismatch](HYPERBOLIC_EXTERIOR.md)

Choose any nonnegative smooth bump \(\chi_i\) supported there and positive at a point where \(G\ne0\). The variation \(g_t=g-t\chi_iG\) is positive definite for sufficiently small positive \(t\) and
\[
 \left.\partial_t c_i(g_t)\right|_0=-\tfrac12\int_{U_i}\chi_i|G|^2\,dV<0 .
\]
Make the two modifications in disjoint bands on \(M\). Both chiral costs strictly decrease, all prescribed caps, exterior and smooth identifications persist, and strict positivity of the closed conformal Laplacian persists for sufficiently small \(t\) if it held initially. Consequently an actual positive completion at equality \(e=8\pi^2\) in this marked two-band problem would give strict entry. In the short-cuff obstruction range **every positive completion with these two LCF ends and the retained seam** satisfies \(e>8\pi^2\), including the case of equality in the length test. For general positive completions retaining only this umbilic seam in the same short-cuff range, its sign directly implies the weak bound \(e\ge8\pi^2\). The descent has no uniform energy saving. Applied to the known positive cylindrical construction it yields positive perturbations of lower cost, with no certified crossing of the entry budget. These statements concern smooth unrestricted variations in the bands, which can leave the prescribed convex interpolation family.
