# E03 — Zero-energy exteriors with positive doubles

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance. Bounded analytical packet SP4-CUT-TUBE-E03. Requested helper configuration `gpt-6.2-sol`/ultra. Actual assistant model and reasoning effort are unavailable in this runtime. Inputs are the [frozen request](../research-progress/handoffs/E03_REQUEST_R1.md), the [B01 decision](../brainstorm/notes/B01_EXTERIOR_ROUTES.md), and the [parent manuscript](../../manuscript/cuts_of_subcritical_conformal_classes.tex) at `bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0` (manuscript SHA-256 `ccb52d6a2548fb8fbddbab4ab01b9aea3d9cc560bbec477c86e7273a389d7fb0`). The inherited numerical checks are immaterial to the equality argument. [Primary-source receipt](../references/E03_SOURCES.md).

**Result.** Let \(X\) be a compact connected smooth oriented Riemannian four-manifold with \(H_*(X;\mathbb Q)\cong H_*(S^1;\mathbb Q)\) and connected umbilic boundary \(\Sigma\cong S^1\times S^2\). With the parent's Hilbert–Schmidt norms, assume \(e_X=\tfrac12(E_+(X)+E_-(X))=0\) and assume the reflective double has positive Yamabe constant. Then \(X\) is diffeomorphic as a manifold with boundary to \(S^1\times D^3\), and both framings of its \(S^2\times D^2\) filling give the standard smooth \(S^4\). In fact the latter conclusion holds for every smooth boundary identification. The smooth conformal pair is a half-cylinder quotient with a positive translation length and an \(SO(3)\) rotation of the hemisphere. The geometry allows arbitrary rotation angles.

## 1. Smooth reflection across the actual boundary

The nonnegative integrands and smoothness imply \(W^+=W^-=0\) on \(X\), up to the boundary. The contracted Bianchi identity then gives vanishing Cotton tensor. To obtain flat coordinates **up to** \(\Sigma\), work on a small contractible smooth coordinate half-ball. In the given metric scale, the parallel equations of the standard tractor connection for a section \((\sigma,\mu,\rho)\) read

\[
\nabla_i\sigma=\mu_i,\qquad
\nabla_i\mu_j=-\sigma A_{ij}-\rho g_{ij},\qquad
\nabla_i\rho=A_i{}^j\mu_j,
\quad A=\tfrac12(\operatorname{Ric}-\tfrac16 Rg).
\]

The connection is smooth on the closed half-ball, and its curvature consists of Weyl and Cotton terms, hence is zero. Use parallel transport from the boundary point to extend initial data \((1,0,0)\) on a small half-ball. Transport along radial coordinate paths gives a smooth extension up to the boundary, and flatness gives a parallel section. The equations preserve \(2\sigma\rho+|\mu|^2=0\), and shrinking gives \(\sigma>0\). The Schouten transformation then yields

\[
 A_{\sigma^{-2}g}=A_g+\sigma^{-1}\nabla^2\sigma
                   -\tfrac12\sigma^{-2}|d\sigma|^2g=0.
\]

Since the Weyl tensor also vanishes, this representative is flat. Parallel orthonormal coframes, integrated on the half-ball, provide a smooth Euclidean chart up to the boundary. This argument uses only the tractor formulas in Gover–Nurowski §3.1, with the extension to a half-ball as above. [Source receipt GN](../references/E03_SOURCES.md#gn--local-conformal-geometry).

In these Euclidean coordinates the boundary remains umbilic. Euclidean Codazzi applied to \(B=\kappa h\) makes \(\kappa\) locally constant. With the outward-normal convention \(B(X,Y)=g(\nabla_X\nu,Y)\), the normal is constant if \(\kappa=0\), and \(x-\kappa^{-1}\nu\) is constant if \(\kappa\ne0\). Thus locally the boundary is planar or spherical. An inversion centered at a different point of the supporting sphere sends the latter to a plane without a pole in the chart. After Euclidean rigid motions the boundary lies in \(x_4=0\) and the half lies in \(x_4\ge0\). Reflect each flat chart across its plane to chart the double.

For the transition argument and the later action on the cylinder, the needed form of Liouville's theorem follows directly from the Schouten formula. If \(F^*\delta=s^{-2}\delta\) on a connected Euclidean domain, then \(\operatorname{Hess}s=(|ds|^2/(2s))\delta\). Commuting third derivatives makes the common diagonal coefficient constant. Write \(s=a+b\cdot x+c|x|^2\), where \(|b|^2=4ac\). Either \(s\) is a positive constant, or \(s=c|x-x_0|^2\) with \(c>0\). In the first case \(F\) is a Euclidean similarity. In the second, composing with inversion at \(x_0\) reduces it to the first case. Thus \(F\) is the restriction of a Möbius map, including for orientation-reversing transitions. In particular a map fixing a patch in a plane pointwise has unit conformal factor along that plane. The nonconstant quadratic expression just obtained precludes this, so it is either the identity or the plane reflection.

Each one-sided transition therefore extends to a Möbius transformation that carries the boundary plane, completed by infinity, to the target plane. Conjugating reflection in the source plane by the transition fixes the target plane pointwise and gives a nonidentity involution, so it is reflection in the target plane. Near a shared boundary point the extension has no pole since the original transition extends continuously to a finite point there. These transitions agree with the charts reflected on the second half. They define a smooth conformally flat atlas on \(D=X\cup_\Sigma\overline X\), and the interchange \(j\) is a smooth conformal involution fixing exactly \(\Sigma\). The inclusion of each half in the atlas restricts to its original smooth structure. A smooth metric in this atlas can be made \(j\)-invariant by averaging it with its pullback, since they are pointwise conformal. Call the resulting smooth metric \(k\). Its fixed hypersurface is totally geodesic. The normal collar of \(k|_X\) is the restriction of a two-sided normal collar of \(k\), so the atlas realizes the usual smooth double using this collar.

## 2. Yamabe positivity of the smooth conformal double

Choose the smooth representative \(g_0\) of the actual half used for the weak double, conformally adjusted to make its boundary totally geodesic. Doubling in its Gaussian collar gives the usual reflected \(C^{1,1}\) metric with its scalar curvature defined almost everywhere. First derivatives match at the seam, so there is no singular scalar-curvature measure. Its Yamabe quotient can be written as the sum of the half numerators divided by the squared \(L^4\) norm on the union. The test space is pairs of \(H^1\) functions on the halves with equal traces on \(\Sigma\). In a collar this characterization follows by the trace theorem and integration by parts, where equality of traces cancels the jump term in the distributional first derivative. Thus the characterization is also valid for the smooth atlas in §1, and density of smooth functions gives the same infimum as the usual smooth Yamabe quotient there.

On \(X\) put \(k=u^2g_0\) for a smooth positive \(u\). Because both boundaries are totally geodesic, the conformal boundary formula gives \(\partial_{\nu_{g_0}}u=0\). With \(\Delta=\operatorname{div}\nabla\), the scalar transformation \(R_{u^2g_0}=u^{-3}(-6\Delta_{g_0}u+R_{g_0}u)\) and integration by parts give

\[
 \int_X (6|dv|^2_k+R_kv^2)\,dV_k
 =\int_X (6|d(uv)|^2_{g_0}+R_{g_0}(uv)^2)\,dV_{g_0}
   -6\int_\Sigma uv^2\partial_{\nu_{g_0}}u\,dS_{g_0}.
\]

The boundary term vanishes, and \(\int_X v^4dV_k=\int_X(uv)^4dV_{g_0}\). Use the same \(u\) on the two copies. Multiplication is an isomorphism of the matched-trace spaces. The two doubled Yamabe constants are equal, so \(Y(D,[k])>0\). The calculation transfers the assumed positivity to a smooth representative in the reflected conformal class, and this representative has exactly zero Weyl curvature.

## 3. Equality and the cylinder

Throughout this paragraph homology has rational coefficients. Poincaré–Lefschetz duality gives \(H_2(X,\Sigma)=H^2(X)=0\) and \(H_1(X,\Sigma)=H^3(X)=0\), so \(H_1(\Sigma)\to H_1(X)\) is an isomorphism. Mayer–Vietoris gives \(b_1(D)=1\), and \(\chi(D)=2\chi(X)-\chi(\Sigma)=0\). Closed orientable duality therefore gives \(b_2(D)=0\), \(b_3(D)=1\), and \(\tau(D)=0\).

The smooth closed oriented \((D,k)\) satisfies the equality hypotheses of the \(b_1\) pinching result. In the parent's conventions the closed Chern–Gauss–Bonnet formula is

\[
 8\pi^2\chi(D)=\int_D\left(|W^+|_{\rm HS}^2+|W^-|_{\rm HS}^2
                        +R^2/24-|Z|^2/2\right)dV_k,
 \qquad Z=\operatorname{Ric}-\tfrac14Rk.
\]

Here \(W=0\) and \(\chi(D)=0\), so \(\int_D|Z|^2=\tfrac1{12}\int_D R^2\). With \(W=0\), this is exactly equality in Bour–Carron Corollary 1.3, equation (1.8), where the Ricci term carries coefficient \(1/2\) and the scalar term coefficient \(1/24\). Their Corollary 1.3(iii), with the equality proof in §7.2, gives a metric in \([k]\) that is a quotient of the round cylinder. Normalize its sphere to radius one, with \(t\) measured in that radius. The simply connected conformal universal cover is

\[
 (\widetilde D,[\widetilde k])\cong (\mathbb R\times S^3,[dt^2+g_{S^3}]).
\]

The result is usually attributed to Gursky (1998). The 1998 theorem text was unavailable through the Annals landing page and JSTOR record. The splitting here uses the inspected published Bour–Carron proof. [Source receipt BC and G98](../references/E03_SOURCES.md#bc--pinching-equality-and-the-product).

## 4. Reflection, deck group and the half

Every conformal automorphism of the cylinder in §3 is an isometry of the product metric. Indeed \((t,x)\mapsto e^t x\) identifies the cylinder conformally with \(\mathbb R^4\setminus\{0\}\). By the flat-map argument in §1, a global conformal automorphism extends to a Möbius map on \(S^4\) preserving the unordered pair \(\{0,\infty\}\). A map fixing both is a similarity fixing the origin. A map interchanging them is such a similarity composed with inversion about the origin. In cylinder coordinates both cases have the form

\[
 (t,x)\longmapsto(\varepsilon t+c,Bx),\qquad
 \varepsilon\in\{+1,-1\},\quad B\in O(4).
\]

This applies to every deck transformation and to every lift of \(j\). It is independent of whether the Yamabe minimizer chosen to express the equality is invariant under \(j\).

Write \(p:\widetilde D\to D\) for the cover and \(\Gamma\) for its deck group. Choose a lift \(q\) of a point of \(\Sigma\) and the unique lift \(J\) of \(j\) fixing \(q\). Its square is a deck transformation fixing \(q\), so \(J^2=1\). The component \(H\) of \(p^{-1}(\Sigma)\) containing \(q\) is fixed pointwise by uniqueness of path lifting for paths in the fixed set. Conversely \(\operatorname{Fix}(J)\subset p^{-1}(\Sigma)\), and near \(q\) its fixed-set dimension is three. If \(\varepsilon=-1\), the fixed points lie at \(t=c/2\), and a three-dimensional fixed component forces \(B=I\). Then \(H=\{c/2\}\times S^3\). The restriction to any component of the inverse image of the connected seam is a covering onto \(\Sigma\), by restriction to evenly covered neighborhoods and path lifting. This would make the compact simply connected \(S^3\) a finite-sheeted universal cover of \(S^1\times S^2\), which has infinite fundamental group. If \(\varepsilon=1\), a fixed point forces \(c=0\) and the three-dimensional fixed set forces a three-dimensional \(+1\) eigenspace for \(B\). Thus \(J\) is reflection across a great equator and \(H=\mathbb R\times S^2\) for that equator.

The deck group is transitive on the components of \(p^{-1}(\Sigma)\). In fact each component contains a lift of the same base point of \(\Sigma\), and the deck group is transitive on its fiber. Every component is therefore the product of the real line with a great equator. Any two great equators of \(S^3\) meet, so \(p^{-1}(\Sigma)=H\). Since \(H\) is simply connected and \(\Gamma\) preserves it, the covering \(H\to\Sigma\) is universal with deck group \(\Gamma\). Restrictions are faithful by freeness and transitive on each fiber. In particular \(\Gamma\cong\pi_1(\Sigma)\cong\mathbb Z\).

The kernel of the projection \(\Gamma\to\operatorname{Isom}(\mathbb R)\) is finite by proper discontinuity on any compact slice \(\{t\}\times S^3\). It is trivial because \(\Gamma\) is infinite cyclic. Thus no finite spherical space-form factor occurs. The generator of an infinite cyclic subgroup of \(\operatorname{Isom}(\mathbb R)\) is a nonzero translation, taken positive after inverting the generator if necessary. The two components of \(\widetilde D\setminus H\) project into distinct interiors of the two copies of \(X\): both interiors occur by surjectivity, and each component has connected image. A deck transformation preserves both sides. Orientability of \(D\) now gives \(B\in SO(4)\) for the generator, and side preservation forces \(B\) to fix the unit normal of the equator. Therefore \(B\) acts on the equatorial three-plane by some \(C\in SO(3)\).

Using a rotation-equivariant diffeomorphism of the closed hemisphere with \(D^3\), the half is

\[
 X\cong (\mathbb R\times D^3)/\langle (t,y)\mapsto(t+\ell,Cy)\rangle,
 \qquad \ell>0.
\]

Choose a skew-symmetric \(L\) with \(e^L=C\), which exists by the axis-angle form of rotations in three dimensions. The map \([t,y]\mapsto(e^{2\pi it/\ell},e^{-tL/\ell}y)\) is a diffeomorphism to \(S^1\times D^3\) carrying boundary to boundary. Conversely, the hemisphere quotient with any such \(\ell,C\) has a smooth conformally flat double of scalar curvature \(6\) and an umbilic seam. The smooth conformal pair conclusion therefore describes the allowed geometries up to the quotient normal form, without making a uniqueness claim for its parameters.

## 5. Fillings and evidence scope

In the product marking, identity filling by \(D^2\times S^2\) gives the rounded boundary of \(D^2\times D^3\), diffeomorphic to standard \(S^4\). The other framing uses \((e^{i\theta},x)\mapsto(e^{i\theta},R_\theta x)\), where \(R_\theta\) rotates by \(\theta\) about a fixed axis in \(\mathbb R^3\). It extends by the same formula into \(S^1\times D^3\), so gluing by it gives the same diffeomorphism type. For an arbitrary boundary marking, apply Ding–Geiges, §2, Proposition 2. Their other mapping class generators, circle reversal and the antipodal map on \(S^2\), likewise extend over \(S^1\times D^3\). An isotopy between gluing maps extends in a collar, so every gluing is diffeomorphic to the product gluing. Orientations can be matched by using the product corner boundary convention, and the standard \(S^4\) admits an orientation-reversing diffeomorphism. [Source receipt DG](../references/E03_SOURCES.md#dg--smooth-boundary-markings).

**Evidence.** This is an analytical proof for the exact zero-energy class under the stated positivity and seam hypotheses. No interval or floating-point estimates are involved. Independent internal replay remains pending. The positive-energy range \(0<e_X<\tfrac23T\), where \(T=4\pi^2\), remains outside this packet.
