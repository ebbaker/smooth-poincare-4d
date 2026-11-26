# Chiral diagonals of the unit-radius connection cap

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Fixed analytical packet E02a, revision 1. GPT-6.2 Sol/ultra was requested in the issue. Actual serving model and effort were unavailable. Inputs at working HEAD `1c81a3048c8c` are the [connection-cap issue](../research-progress/handoffs/CONNECTION_CAP_ISSUE_20261126.md) (working blob `c510d0817f71`), the [first assembly issue](../research-progress/handoffs/FIRST_ASSEMBLY_ISSUE_20261126.md) (`aa97267bec13`), and the [branch normalization](../research-overview/OVERVIEW.md) (`8069eae94a2f`). The calculation is pointwise on the smooth Riemannian cap and uses the Hilbert–Schmidt norm of the Weyl operators on real two-forms.

## Frame and conventions

Let the original connection metric have base metric \(q_0\) and smooth positive fiber radius \(r\) on the oriented disk \(D\). Set \(q=r^{-2}q_0\). In the unit-radius representative \(g_0\), the horizontal metric is \(q\), the vertical metric is the unit round sphere metric, and the summands are orthogonal. The original metric, with any additional smooth positive conformal multiplier, is conformal to \(g_0\). In four dimensions the Hodge star on two-forms and each density \(|W^\pm|_{\mathrm{HS}}^2dV\) are unchanged under this conformal rescaling. Write \(K=K(q)\).

Use a local oriented orthonormal trivialization of the rank-three bundle and identify \(\mathfrak{so}(3)\) with \(\mathbb R^3\) by \(a\mapsto (p\mapsto a\times p)\). Here the matrix commutator corresponds to the vector cross product. The connection has expression \(d+a\times\), so its curvature is \(F(X,Y)=da(X,Y)+a(X)\times a(Y)\). The horizontal lift of a base field \(X\) has vertical component \(-a(X)\times p\), and the vertical bracket of lifts is \([X^H,Y^H]^V=-F(X,Y)\times p\). Indeed, the ordinary vector-field bracket of the linear fields \(p\mapsto a\times p\) and \(p\mapsto c\times p\) is \(p\mapsto -(a\times c)\times p\).

Take \(e_1,e_2\) to be oriented orthonormal horizontal lifts. At a unit fiber point \(p\), choose an oriented orthonormal vertical frame \(e_3,e_4\) with \(e_4=p\times e_3\). The total orientation is \(e_{1234}\). Put

\[
 b=F(\pi_*e_1,\pi_*e_2),\qquad C=b\times p,\qquad h=b\cdot p,\qquad c=|C|^2.
\]

Use \(R(X,Y)=\nabla_X\nabla_Y-\nabla_Y\nabla_X-\nabla_{[X,Y]}\) and \(\mathcal R_{ij,kl}=\langle R(e_i,e_j)e_l,e_k\rangle\), so the curvature operator of a unit sphere is positive. This fixes the cross-entry signs as well as the sectional curvatures.

## Sectional curvatures from the connection

For basic horizontal fields \(X,Y\), write \(C_{XY}=F(\pi_*X,\pi_*Y)\times p\) and define the horizontal vector \(A_X U\) for vertical \(U\) by \(\langle A_X U,Y\rangle=\langle C_{XY},U\rangle/2\). The horizontal lift flows act on the fibers by rotations, and \([X,U]\) is vertical. The vertical Koszul equation, for vertical \(U,V\), gives

\[
2\langle\nabla_U V,X\rangle=-X\langle U,V\rangle+\langle[X,U],V\rangle+\langle U,[X,V]\rangle=0.
\]

Thus the fibers are totally geodesic and \(\nabla_U V=\nabla^S_U V\). The horizontal Koszul equation and metric compatibility give

\[
\nabla_XY=(\nabla^q_{\pi_*X}\pi_*Y)^H-\tfrac12 C_{XY},\qquad
\nabla_U X=A_X U,\qquad \nabla_X U=A_X U+[X,U].
\]

Here the vertical component in the first identity is half the vertical bracket by Koszul, the horizontal component of the second follows from torsion and metric compatibility, and its zero vertical component follows from the fibers being totally geodesic.

For \(X=e_1,Y=e_2\), the horizontal parts of the three terms in \(\langle R(X,Y)Y,X\rangle\) from base covariant derivatives give \(K\). The vertical part \(-C/2\) of \(\nabla_XY\) contributes \(-c/4\) through \(-\nabla_Y\nabla_X Y\). The vertical part \(-C\) of \([X,Y]\) contributes \(-c/2\) through \(-\nabla_{[X,Y]}Y\). Hence \(\mathcal R_{12,12}=K-3c/4\). Along a fiber \(\mathcal R_{34,34}=1\). For a unit basic \(X\) and unit vertical \(U\), the term \(\nabla_X\nabla_UU\) has no component along \(X\), because \(\nabla_UU\) is vertical and \(C_{XX}=0\). The terms containing \([X,U]\) are vertical. The remaining contribution to the mixed sectional curvature is \(-\langle\nabla_U(A_X U),X\rangle=|A_X U|^2\). Thus

\[
\mathcal R_{i\alpha,i\alpha}=\tfrac14\langle C,e_\alpha\rangle^2
\quad(i=1,2,\ \alpha=3,4),\qquad
s=2(K+1)-\tfrac12 c .
\]

The scalar curvature \(s\) is twice the sum of the six sectional curvatures.

## Cross entries and chiral compression

Along one fiber, \(\nabla_U e_1=\langle C,U\rangle e_2/2\) and \(\nabla_U e_2=-\langle C,U\rangle e_1/2\). The normal connection therefore has form \(C^\flat J/2\), where \(Je_1=e_2\). The tangential derivative of the sphere field \(C\) is

\[
\nabla^S_U C=\operatorname{proj}_{p^\perp}(b\times U)=h\,p\times U,
\qquad d_S C^\flat=2h\,dA_{S^2}.
\]

The normal connection curvature is \(d_S C^\flat\,J/2\), since \(\mathfrak{so}(2)\) is abelian. The fibers are totally geodesic, so this is the ambient curvature on their normal plane for two vertical inputs. By pair symmetry,

\[
\mathcal R_{12,34}=\mathcal R_{34,12}=\langle R(e_3,e_4)e_2,e_1\rangle=-h .
\]

For the other two cross entries, the same connection identities give \(\langle R(e_1,U)V,e_2\rangle=-\langle\nabla^S_U C,V\rangle/2\) for vertical \(U,V\). In fact, \(\nabla_{e_1}\nabla_U V\) contributes \(\langle C,\nabla^S_U V\rangle/2\) and \(-\nabla_U\nabla_{e_1}V\) contributes \(-U\langle C,V\rangle/2\), while \([e_1,U]\) is vertical. Consequently \(\mathcal R_{13,24}=-h/2\) and \(\mathcal R_{14,23}=h/2\). These entries satisfy \(\mathcal R_{12,34}-\mathcal R_{13,24}+\mathcal R_{14,23}=0\) by their explicit values, as required by the first Bianchi identity.

Use the orthonormal chiral bases

\[
 \frac{e^{12}\pm e^{34}}{\sqrt2},\qquad
 \frac{e^{13}\mp e^{24}}{\sqrt2},\qquad
 \frac{e^{14}\pm e^{23}}{\sqrt2}.
\]

The diagonal Weyl block is the corresponding compression of \(\mathcal R\) minus \(sI/12\), since the trace-free Ricci term exchanges chiralities. The first diagonal is therefore

\[
 d_\pm=\tfrac12(K+1-3c/4)\mp h-\tfrac{s}{12}
 =\frac{K+1-|b\times p|^2\mp 3b\cdot p}{3} .
\]

The remaining diagonal entries both equal \(c/8\pm h/2-s/12=-d_\pm/2\). This gives \(|W^\pm|_{\mathrm{HS}}^2\ge\tfrac32 d_\pm^2\). The first diagonal agrees with the issued formula, with the displayed assignment of signs for this lift and orientation convention. Reversing the cap orientation exchanges the two chiralities. In a flat connection region the metric is locally a product, and the chiral spectra are \((K+1)(1/3,-1/6,-1/6)\). [Product-cap passage in the fixed-type descent manuscript](../../../master/01_fixed_type_variational_descent/manuscript/fixed_type_chiral_energy_descent.tex)

The proof applies pointwise to arbitrary smooth connection fields and base metrics, including transitions represented by the same ansatz. The chiral lower bound uses only the indicated entries. The formulas take the normalized base and its inverse-facing boundary data as hypotheses when used for the cap budget. The frame calculation itself is independent of the signed boundary curvature and provides no assembly or Yamabe sign estimate.
