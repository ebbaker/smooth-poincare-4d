# A framed Miller–Schupp boundary and a non-product circle cap

Working derivation, 26 November 2026, for Edward B. Baker III with OpenAI Codex assistance. Selected lead GPT-6.2 Astra/ultra, serving configuration not independently available. [Intake and helpers](../research-progress/handoffs/FIRST_ASSEMBLY_ISSUE_20261126.md) · [Curvature packet](../research-progress/handoffs/CONNECTION_CAP_ISSUE_20261126.md). The conclusions concern smooth oriented Riemannian four-manifolds and real two-form operator norms. We select a test presentation within an open family. No distinction of diffeomorphism types is assumed.

## The attaching maps, exterior and inverse

Use the relators
\[
 r_1=x^{-1}y^2xy^{-3},\qquad r_2=x^{-1}yx^2y^{-1}x^{-2}.
\]
Here \(x=yx^2y^{-1}x^{-2}\), and the word on the right has exponent sum zero on \(x\). Miller–Schupp, Corollary 3, gives the trivial group. The exponent-sum rows in the order \(x,y\) are \((0,-1),(-1,0)\). Gabai's Problem 13.6 in arXiv v2 (12.6 in the shorter author PDF) places the associated five-dimensional thickenings in an explicit recognition problem. This choice moves beyond the marked Mazur and recognized Akbulut–Kirby controls in the inspected sources. Neither computational AC difficulty nor the five-ball question decides the smooth boundary type. [Presentation source reading](PRESENTATION_SOURCES.md) · [Miller–Schupp](https://doi.org/10.1090/conm/250/03848)

Take the planar surface \(F=\overline D_4(0)\setminus(D_{1/4}(-1,0)\cup D_{1/4}(1,0))\). Start with \(V=F\times D^3\), rounding its corners within distance 1/64 of \(\partial F\times S^2\). It has a zero-handle and two one-handles. Use counterclockwise loops \((-1+\cos 2\pi t,\sin 2\pi t)\) and \((1-\cos 2\pi t,-\sin 2\pi t)\) for \(x,y\), respectively. They meet at the basepoint zero. Traverse the letters of each relator on equal time subintervals, inverting by reversal. Smooth the speed on each interval with the same increasing step flat at the two endpoints. Denote these closed paths by \(c_i(t)\), \(t\in\mathbb R/\mathbb Z\). In the face \(\operatorname{int} F\times S^2\) use polar coordinates \(p(\phi,\theta)\) on the second factor. With \(\epsilon=1/16\), \(\phi_1=\pi/3\), \(\phi_2=2\pi/3\), freeze
\[
 \Phi_i(t,(u,v,w))=
 \big(c_i(t)+\epsilon(u,v),\ p(\phi_i+\epsilon w,2\pi t)\big).
\]
These formulas extend past the closed unit three-ball to radius \(5/4\). The disjoint latitude bands separate the two images. Longitude recovers \(t\), then planar displacement and latitude recover \((u,v,w)\). This proves smooth embeddedness even at a pause or a repeated projected letter. The three coordinate directions specify the entire transverse tube framing, also on the inverse map. The latitude is nullhomotopic in the full \(S^2\), so the relators read in \(V\) are exactly the displayed ones.

Attach \(D^2\times D^3\) to \(V\) along each \(\Phi_i\), orienting handles compatibly with the orientation on \(F\times D^3\). Write
\[
 X=\partial V\setminus\bigcup_i\Phi_i(S^1\times\operatorname{int}D^3),\qquad
 M=X\cup_{a_1} C_1\cup_{a_2} C_2,\quad C_i=D^2\times S^2.
\]
The cap-to-exterior closing is \(a_i(e^{2\pi it},p)=\Phi_i(t,p)\), and its inverse recovers \((e^{2\pi it},(u,v,w))\) by the same longitude, displacements and latitude. The inverse *surgery* on each dual sphere reinstalls \(S^1\times D^3\) by this same boundary parametrization. All of \(X\), including the other faces of \(\partial V\), is retained. These maps specify the closed marked smooth type independently of the choice of metric or a recognition theorem. The five-dimensional spine is simply connected and acyclic by the relators and unimodular boundary matrix, hence contractible. Relative dual handles have index at least three. The boundary is simply connected, and duality gives a homology four-sphere. Gromov–Lawson Theorem A gives some PSC metric on this boundary by the point and circle surgeries. [Master entry and topology](../../../master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex) · [Theorem A](https://www.ihes.fr/~gromov/wp-content/uploads/2018/08/827.pdf)

## One whole smooth trial

Set the dimensionless matching radius to \(\rho=1\). In each cap use radial \(t'\in[0,1]\), angular \(\theta\) of period \(2\pi\), and let \(s=t'-1\). Continue \(s\) into \(X\) as framed tubular radius minus one, keeping \(\theta,p\) fixed under the above closing. In a cap use a round unit fiber with connection \(A\) and base metric \(dt'^2+a(t')^2d\theta^2\). Its horizontal lifts are \(v-(A(v)\times p)\). Choose the smooth step \(H(u)=j(u)/(j(u)+j(1-u))\), where \(j(u)=\exp(-1/u)\) for \(u>0\) and zero otherwise. Use this same step, rescaled, for the loop speeds. Prescribe:

* On \(C_1\), set \(h=H(4t'-2)\), \(a=(1-h)t'+h\sinh(2-t')\) and \(A=j(t'-1/4)j(1/2-t')\,e_3\,d\theta\), with \(e_3\) a fixed unit rotation axis. The connection extends smoothly across the disk center because \(A=0\) there. On an open interior annulus \(dA\ne0\). In particular no fiber rotation trivializes this connection. Both its switching regions and the interpolation in \(a\) are inside the counted disk.
* On \(C_2\), use \(a=\sinh t'\), \(A=0\). This cap is the hyperbolic disk times the unit sphere and has both Weyl tensors zero.
* Take the induced Euclidean metric \(g_0\) on the full rounded boundary of \(V\subset\mathbb R^2\times\mathbb R^3\) as exterior background. In each framed band \(0\le s\le 1/8\) set \(h_X=H(16s-1)\). Interpolate by the positive tensor sum \((1-h_X)g_{\mathrm{collar},i}+h_Xg_0\), where the collar metric is \(ds^2+\sinh^2(1\mp s)d\theta^2+g_{S^2}\), minus for the first and plus for the second cap. Use \(g_0\) on the rest of \(X\). Arbitrary choices of the small initial corner rounding are allowed since every such exterior obeys the estimate.

The cap and exterior formulas agree on a two-sided smooth germ and share the same fiber framing. On the first cap the boundary curvature for disk Gauss–Bonnet is \(a'(1)/a(1)=-\coth 1\). On the second it is \(+\coth 1\). The former sign arises because the retained direction goes toward smaller hyperbolic radius. These are prescribed choices of physical metric, not properties inferred from a topology theorem.

## Lower bound for every connection and both signs

More generally allow any smooth \(SO(3)\) connection on the cap, base metric, positive base-dependent round radius and an overall positive smooth conformal factor. Divide first by the conformal factor and then by the squared fiber radius. The normalized cap has a unit round fiber, a base metric \(q\) on the disk and the same horizontal distribution. The separate four-dimensional Weyl energy densities times volume are unchanged. The hypothesis on the first end is the normalized, fiber-marked, inverse-facing germ. The other pieces of \(M\) may have arbitrary smooth metrics matching that germ.

For \(K=K_q\) and the connection curvature vector \(b=*_{q}F_A\in\mathfrak{so}(3)\simeq\mathbb R^3\), the unit chiral basis vector from the horizontal area and oriented fiber area has Weyl diagonal
\[
 d_\pm=(K+1-|b\times p|^2)/3\mp b\cdot p.
\]
The sign labels here use the horizontal-then-fiber orientation. Reversing orientation interchanges them. The horizontal sectional curvature is \(K-3|b\times p|^2/4\), the vertical one is 1 and scalar curvature is \(2K+2-|b\times p|^2/2\). Curvature of the horizontal normal plane along the totally geodesic fiber gives the cross term. Derivatives of the connection in the other entries need no estimate from above. [Frame derivation](CONNECTION_CURVATURE.md)

A trace-free symmetric three-by-three matrix with first diagonal \(d\) has squared Hilbert–Schmidt norm at least \(3d^2/2\). On the round fiber the odd term in \(p\) integrates to zero. Put \(z=|b|^2\). In each chirality the spherical integral is bounded below by \(2\pi/3\) times
\[
 (K+1)^2-\tfrac43(K+1)z+\tfrac8{15}z^2+3z
 =4K+(K-1-\tfrac23z)^2+\tfrac13z+\tfrac4{45}z^2.
\]
The fiber-and-base volume factors even for a nontrivial connection. Integrating over the *whole* disk and applying disk Gauss–Bonnet therefore gives
\[
 E_\pm(C_1)\ge\frac{8\pi}{3}\left(2\pi-\int_{\partial D}k_q\,d\ell_q\right)
 =\frac{16\pi^2}{3}(1+\cosh\rho)>\frac{32\pi^2}{3}.
\]
The last two expressions use the inverse-facing radius \(\rho>0\). For an exact smooth germ \(K=-1\) near the boundary, so even the first comparison with the integrated \(4K\) is strict. More generally the integrated bound rules out strict entry whenever \(\int k_q\,d\ell_q\le-\pi\). This threshold is necessary for escaping this particular obstruction, not sufficient for entry. [Averaging and inequality](CONNECTION_BUDGET.md) · [Zero-connection check](WARPED_CAP.md)

In the actual trial, for each sign
\[
 E_\pm(M)=E_\pm(C_1)+0+
 \sum_{i=1}^2 E_\pm(\text{exterior band }i)+E_\pm(\text{rest of }X).
\]
Every unevaluated integral on the right has a nonnegative density. Hence the closed strict upper bounds fail regardless of the sign of its conformal Laplacian. Signature zero gives equality of the two closed energies. The pinched representative is also excluded for this class by Chern–Gauss–Bonnet. The product-circle seam itself has positive first modified seam eigenvalue, \(2+2\coth^2\rho/3\). Thus the failure has a different source from the reflected Mazur seam. The standalone Robin sign stays with 04. [Seam replay](../reviews/SEAM_REPLAY.md)

## Changing the first germ and testing the retained exterior

Replace the first cap and its exterior transition by the positive-facing formulas for the second. Both caps are then exactly Weyl-flat. In the specified Euclidean boundary background the region below survives every interpolation in the construction. Take
\[
 F_* = D_{39/10}(0)\setminus\big(\overline D_{1/3}(-1,0)\cup\overline D_{1/3}(1,0)\big),\qquad
 S_* = \{p:\ |\phi-\phi_i|>1/12\text{ for }i=1,2\}.
\]
The rounding misses this region. Both enlarged tubes through radius \(5/4\) are confined to latitude displacements at most \(5/64<1/12\). Thus the metric on \(F_*\times S_*\) is precisely flat planar times unit round. Its two Weyl densities are each \(1/6\), since the Weyl eigenvalues for a product of surfaces are \((K_1+K_2)(1/3,-1/6,-1/6)\). The base area is \(\pi((39/10)^2-2/9)>72\pi/5\). The two latitude bands have total angular width \(1/3\) and area at most \(2\pi/3\). Hence
\[
 E_\pm(X)\ \ge\ \tfrac16\operatorname{Area}(F_*)\operatorname{Area}(S_*)>
 \tfrac16\tfrac{72\pi}{5}\tfrac{10\pi}{3}=8\pi^2 .
\]
This supplies a second, disjoint failure in the original trial and decides the changed-germ trial even with zero cap costs. It holds for every replacement retaining this metric on this region. A general exterior or a rescaled base with a changed conformal class requires another calculation. [Changed exterior and longitude test](HYPERBOLIC_EXTERIOR.md)
