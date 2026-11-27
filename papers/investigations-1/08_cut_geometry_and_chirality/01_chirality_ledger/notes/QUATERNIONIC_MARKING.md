# Two invariant metric families on the same quaternionic link

27 November 2026, for Edward B. Baker III, with OpenAI assistance. Lead's actual model and effort unavailable. Research decision B03 and calculation E10. Input checkout bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0. This note uses the E01 Berger calculation and the APS round offset independently checked for E06.

Fix the actual oriented quotient \(Q_8\backslash S^3\), with the boundary orientation of the quaternion basis \((1,i,j,k)\). The degree of the cover is eight. The APS fixed-point sum gives \(\eta_0=-3/4\). All left-invariant lifts descend. A right-invariant lift descends exactly when its defining inner product is invariant under \(\mathrm{Ad}(Q_8)\): in the right frame left translation changes components by the fixed matrix \(\mathrm{Ad}(q)\). Conjugation by \(i,j,k\) flips two axis signs, so every diagonal inner product descends. Conversely the three off-diagonal entries must vanish. Right translations are transitive isometries for this second family. Inversion interchanges the lifts on the cover, reverses orientation, and exchanges left and right deck actions. The *difference* of eta from round changes sign under inversion upstairs. On the fixed quotient divide this difference by eight by pulling back the relative signature transgression; keep the original round offset.

For length axes \((1,1,t)\), \(t>0\), take the Hopf fibre along \(k\). E01 gives the signed change \(+2(t^2-1)^2/3\) in the frame with positive structure equations, which is the right-invariant coframe in the chosen quaternion orientation. On the **right-invariant lift of the fixed left quotient** the result is
\[
 \eta_R(t)=-\tfrac34+\tfrac1{12}(t^2-1)^2,\qquad
 |\eta_R(t)|<\tfrac23\quad\Longleftrightarrow\quad
 \sqrt2<t<\sqrt{1+\sqrt{17}} .
\]
Indeed the squared difference lies strictly between 1 and 17. The left-invariant lift has a minus instead of a plus and never crosses on this slice. For three unequal lengths the variations are likewise opposites on this common marking, so the positive-cone expression of E04 applies to both.

The intrinsic sectional curvatures in the Hopf and horizontal planes are respectively \(t^2,t^2,4-3t^2\). For example use an orthonormal left frame with \([e_1,e_2]=2t e_3\), \([e_2,e_3]=2e_1/t\), \([e_3,e_1]=2e_2/t\); Koszul gives \(\nabla_1 e_2=t e_3,\ \nabla_2 e_3=t e_1,\ \nabla_3 e_2=(t-2/t)e_1\), with cyclic metric-skew partners and zero diagonal. Inversion preserves the sectional curvatures of the right metric. Thus \(R=8-2t^2\), and \(\sqrt2<t<2\) meets the strict eta inequality with a positive scalar representative. At \(t=\sqrt3\), \(R=2\) and \(\eta=-5/12\); an umbilic cut with this datum would cost at least \(5\pi^2\) of closed chiral energy. Orientation reversal changes eta's sign and preserves the test.

This is an intrinsic metric on the actual link. Realizing the marked circle fibration as the boundary of a specified tube and constructing a positive closed metric with controlled energy are obligations of the tube and entry investigations. Intrinsic positivity independently checks one necessary condition.
