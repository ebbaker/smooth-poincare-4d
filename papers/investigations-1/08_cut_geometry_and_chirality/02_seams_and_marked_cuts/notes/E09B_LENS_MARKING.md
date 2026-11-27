# SP4-CUT-SEAM-E09B · Marking and energy of the round lens-pair model

27 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Requested GPT-6.2 Sol/ultra. Actual serving model and effort unavailable. HEAD bc2c1bbccc1d. Inputs [E09 r1](../research-progress/handoffs/E09_REQUEST_R1.md), SHA-256 432daff006fd20fdccab0733616b8235ce63636dfbf3038855fa276ecf9c0e43, [B05](../brainstorm/notes/B05_LENS_PAIR_TEST.md), 1b41e5a5f6b3c5a2, [E09A](E09A_LENS_METRIC.md), 1c1775edb1faf9651, and the [connection curvature derivation of 07](../../../07_positive_subcritical_entry/notes/CONNECTION_CURVATURE.md), 708236af423b65eb. The metric category is oriented positive-definite, with real HS Weyl blocks and \(T=4\pi^2\).

**Result.** In the model with product round-punctured-lens exteriors, marked puncture fibres and unit round half-disk bases, changing frames with a flat connection cannot produce the needed signed projections. Allowing arbitrary smooth \(SO(3)\) connection curvature on the unit round half-disks while keeping the indicated \(C^1\) first-jet matching and an umbilic diameter costs more than \(2T\) for the two halves. The result uses the marked gluing that carries the displayed lens ends and spherical connector to their partners, allowing an exchange of ends. It covers angle-dependent curvature and independent connections on the two halves.

## Signed projections and transport

Write \(L=S^3/\langle \zeta I\rangle\), \(\zeta=e^{2\pi i/3}\), using its action on \(\mathbb C^2\), and \(N=L\setminus B(p,r)\), \(0<r<\pi/3\). Each half is \(N\times I\) with the half-disk cap attached along its puncture cylinder \(S^2\times I\). The cap is simply connected and the attaching set is connected and simply connected. By van Kampen \(\pi_1(V_i)=\langle u_i\mid u_i^3=1\rangle\). In the oriented boundary \(L\#-L\), use generators \(x_-,x_+\) taken from the same quotient generator under the product identification on one half. Their inclusions into that half are both \(u_1\). After a marked gluing, their two inclusions into the other half are \(u_2^{\epsilon_-}\) and \(u_2^{\epsilon_+}\), with \(\epsilon_\pm=\pm1\). An exchange of ends just interchanges the labels. The pushout has relations \(u_1=u_2^{\epsilon_-}=u_2^{\epsilon_+}\). It is \(C_3\) for equal signs and trivial for opposite signs. The latter also makes the integral Mayer–Vietoris map on \(H_1\) invertible, since the two signed rows have determinant a unit mod \(3\). The other middle homology groups vanish, and the closed oriented result is a homotopy four-sphere in that case.

An isometry of one marked round punctured lens piece to another lifts to the sphere with the three lifted balls removed. This is the universal cover, by van Kampen applied when the balls are filled. A spherical isometry on this connected open domain is the restriction of an element \(A\) of \(O(4)\), as follows by matching its value and derivative on an open ball and continuing by normal neighbourhoods. Its action on the generator satisfies \(A\zeta I A^{-1}=\zeta^\epsilon I\). Since \(\zeta I=\cos(2\pi/3)I+\sin(2\pi/3)J\) for the standard complex structure \(J\), this gives \(AJ=\epsilon JA\). At the marked centre, \(Jp\) is the oriented Hopf unit tangent. The puncture sphere action therefore takes the point labelled by \(Jp\) to the point labelled by \(\epsilon J(Ap)\). For example complex conjugation fixes \(p=(1,0)\), reverses the generator, and is a half-turn on the tangent sphere. The same conclusion holds if the marked round pieces are only required to match conformally. A smooth conformal map between connected spherical domains extends to a Möbius transformation. For the local proof in stereographic Euclidean coordinates, if its metric factor is \(v^{-2}\), equality of the Schouten tensors to zero gives \(\nabla^2 v=|\nabla v|^2I/(2v)\). Commuting third derivatives makes the coefficient of \(I\) constant. With the same identity, the resulting quadratic \(v\) is either constant or a positive constant times \(|x-x_0|^2\). The map is consequently a similarity or a similarity composed with an inversion, and the local transformations agree on overlaps. The lift still conjugates its deck group, so its smooth spherical conformal factor is invariant under \(\zeta I\). In the spherical Ricci formula the reciprocal factor has pure-trace Hessian, hence it is a constant plus a linear function of the ambient coordinates. This follows by taking a divergence and solving the resulting equation \(\nabla^2(v-\bar v)=-(v-\bar v)g\) along great circles. The deck rotation has no nonzero fixed vector, so that linear function vanishes. Thus the Möbius lift is spherical isometric.

Use the physical product transport along the exterior attaching arc to identify its endpoint \(S^2\)'s, so the two Hopf marks are represented by the same axis \(v_i\). Let \(T_i\in SO(3)\) be cap transport along the diameter between these endpoints in that marking. Write \(f_-,f_+\in O(3)\) for the endpoint actions of the boundary matching, after relabelling if the ends are exchanged. The product connector in its parallel frame has Ricci eigenvalues \(0,1,1\), so an isometry preserves the fibre distribution. A product isometry has a constant fibre rotation in parallel frames. The angular conclusion also holds for a marked conformal matching of the connector. In its Euclidean annulus gauge a Möbius map sends its two concentric boundary spheres to the two concentric spheres of the target. For a similarity this gives one constant orthogonal action on their spherical directions. For a similarity composed with an inversion, any inversion centre distinct from the common source centre would give two distinct image centres, by the inverse-sphere centre formula \(x_0+(c-x_0)/(|c-x_0|^2-r^2)\). The only possible inversion is therefore radial in the marked gauge, with the same orthogonal action on both ends. Consequently
\[
 f_+T_1=T_2f_-,\qquad f_\pm v_1=\epsilon_\pm v_2 .
\]
Here the same conjugacy and distance calculation applies if opposite endpoint parametrizations replace a \(T_i\) by its inverse. For opposite signs \(f_+f_-^{-1}\) sends \(v_2\) to \(-v_2\). It has determinant \(+1\) by the first equation, so its rotation angle is \(\pi\). In the bi-invariant angle metric,
\[
 \pi=d(I,f_+f_-^{-1})
 \le d(I,T_1)+d(I,T_2).
\]
In particular flat connection on a half-disk makes the connector and attaching arc transports agree, since the two paths are homotopic there. Thus zero-cost rotations of the independent endpoint frames change coordinate labels together with the Hopf marks. They cannot change the signed projections.

A round lens mapping torus with monodromy reversing the cyclic generator has a puncture-sphere half-turn when the puncture centre is fixed, or the same reversal after trivializing moving centres by a product of round isometries in the identity component. For fixed puncture data its \(SO(3)\) monodromy cannot extend as a flat connection over a disk. Also the product isometry \((t,z)\mapsto(-t,z)\) on the cover descends for involutive monodromy, but its halfway slice has fixed points only in the fixed locus of that monodromy. A product isometric reflection \((t,z)\mapsto(-t,\phi z)\) fixes the whole first lens slice only if \(\phi=I\), and fixes the whole other candidate slice only if \(\phi\) is the monodromy. Thus this replacement does not supply two pointwise fixed lens slices by a single product reflection. Local reflections demand the connector and cap checks below.

## Curvature needed for the marking

Keep the unit-radius round fibre and let \(q_i\) be the metric of a spherical half-disk of radius \(S_i>\pi/2\) on the unit \(S^2\). An \(SO(3)\) connection on this cap is permitted to depend on both base coordinates. In a local oriented frame let \(b=*_{q_i}F_A\) be its curvature vector with the Euclidean Lie algebra norm for unit angular speed. The metric is the product of the horizontal \(q_i\) and the round vertical metric, with horizontal lifts specified by the connection.

At the attaching arc, matching the first jet in the common marked fibre collar with the flat exterior forces \(b=0\). Indeed the metric determines horizontal lifts algebraically, and their vertical bracket is determined by first derivatives. Along the connector, take horizontal unit tangent \(e_1\) to the base diameter, horizontal unit normal \(e_2\), \(p\in S^2\), and a vertical tangent \(Z\). Koszul gives
\[
 B(e_1,Z)=\langle\nabla_{e_1}e_2,Z\rangle=-\tfrac12\langle b\times p,Z\rangle .
\]
Its off-diagonal value is untouched by subtracting mean curvature or by conformally rescaling the metric. Umbilicity at every point of the fibre forces \(b=0\) along the diameter. In particular a nonzero circle-symmetric twist already fails on the diameter. Curvature localized in the interior remains admissible for the following lower bound.

Travel around the cap boundary using its diameter and its reverse attaching arc, whose transport is \(I\) in the exterior product frames. The resulting holonomy is \(T_i\) or \(T_i^{-1}\), depending on the orientation. Its angle distance to \(I\) is at most \(\int|b|\,dA_{q_i}\). To see this, sweep the disk with concentric loops in any disk parametrization. Radial parallel transport identifies each loop's basepoint frame. Differentiating its parallel-transport ODE gives the right-translated derivative of the loop holonomy as the integral of curvature conjugated by parallel transports, with the oriented area density. Conjugation preserves the angle norm. Integrating the speed from the constant loop to the boundary gives the bound. One obtains the same result for the piecewise smooth boundary by exhaustion. Thus opposite signs imply
\[
 \sum_{i=1}^2\int |b_i|\,dA_{q_i}\ge\pi .
\]

On each half-disk, \(|b_i|\) has zero trace on the full boundary. It extends by zero into the hemisphere bounded by the great circle containing the diameter. For an open unit hemisphere the positive coordinate normal to the equator satisfies \(-\Delta v=2v\). Integration of the identity \(\int(|df|^2-2f^2)=\int v^2|d(f/v)|^2\) for compactly supported tests, and then density, gives the Dirichlet bound \(2\). Since \(|d|b_i||\le|D_A b_i|\), it follows that
\[
 \int |D_A b_i|^2\,dA_{q_i}\ \ge\ 2\int |b_i|^2\,dA_{q_i}.
\]

## Signed curvature budgets

Take the oriented orthonormal frame with horizontal \(e_1,e_2\), vertical \(e_3,e_4\), \(e_4=p\times e_3\). Set \(C=b\times p\), \(c=|C|^2\), and \(h=b\cdot p\). In the convention \(\mathcal R_{ij,kl}=\langle R(e_i,e_j)e_l,e_k\rangle\), the first diagonal in the chiral basis beginning \((e^{12}\pm e^{34})/\sqrt2\) is \(d_\pm=(K+1-c)/3\mp h\) and the other two diagonals are \(-d_\pm/2\). These follow by inserting the connection identities
\[
 (\nabla_XY)^V=-\tfrac12 F_A(X,Y)\times p,\qquad
 \langle\nabla_U X,Y\rangle=\tfrac12\langle F_A(X,Y)\times p,U\rangle
\]
for basic horizontal \(X,Y\) and vertical \(U\). The horizontal and vertical sectional curvatures are \(K-3c/4\) and \(1\). The mixed sectional curvatures are \(C_\alpha^2/4\). The cross entries \(\mathcal R_{12,34},\mathcal R_{13,24},\mathcal R_{14,23}\) are \(-h,-h/2,h/2\), using \(d_{S^2}C^\flat=2h\,dA_{S^2}\). The scalar subtraction in the Weyl blocks is \(R/12\). This replays the signed diagonals of the [07 curvature note](../../../07_positive_subcritical_entry/notes/CONNECTION_CURVATURE.md).

For the derivative terms choose geodesic base frames at the base point and a fibre gauge with \(A=0\) there. The remaining relevant entries are
\[
 u_{i\alpha}:=\mathcal R_{12,i\alpha}
     =-\tfrac12\langle (D_i b)\times p,e_\alpha\rangle,\qquad
 \mathcal R_{34,i\alpha}=0.
\]
In fact \((R(e_1,e_2)e_i)^V=(D_i b)\times p/2\) by differentiating the vertical connection term. Terms containing the vertical bracket in this expression are horizontal by total geodesy of the fibres. The entries with three vertical indices vanish because the fibres are totally geodesic. In the chiral bases completed by \((e^{13}\mp e^{24})/\sqrt2,(e^{14}\pm e^{23})/\sqrt2\), the first row off-diagonals are consequently \((u_{13}\mp u_{24})/2,(u_{14}\pm u_{23})/2\). Their pair of HS cross terms integrates to zero on a fibre, since it is a signed multiple of \(p\cdot(D_1 b\times D_2 b)\). For either sign the non-cross terms integrate to \((\pi/3)|D_A b|^2\) using the round sphere mean \(\operatorname{avg}|w\times p|^2=2|w|^2/3\). This step uses each actual chiral projection and permits independent orientations on the two cap calculations. [Atiyah–Hitchin–Singer §1, Eq. (1.1), printed p. 427](https://doi.org/10.1098/rspa.1978.0143). I inspected the [local copy](../../../../../references/Atiyah.pdf), PDF p. 4, in E07A, hash a4d55168994f0581.

For \(K=1\), integrating the diagonal contribution \(3d_\pm^2/2\) on a fibre, using the means \(2|b|^2/3,8|b|^4/15,|b|^2/3\) of \(c,c^2,h^2\), yields in either chirality
\[
 E_\pm(\mathrm{cap}_i)\ \ge\ \frac{\pi}{2}\int
 \left(\frac{16}{3}+\frac49|b_i|^2+\frac{32}{45}|b_i|^4+\frac23|D_A b_i|^2\right)dA_{q_i}.
\]
The signed odd terms average to zero. The estimate has the same coefficients as the circle model in parent §6, but does not require a choice of a fixed curvature axis. It follows from the listed entries alone.

Put \(A_i=1-\cos S_i\), so each half-disk has area \(\pi A_i\). At the outer arc the flat exterior has boundary radius \(a=\ell/\sin r_i\) and outward derivative \(a'=-a\cos r_i\). Matching \(a=\sin S_i\), \(a'=\cos S_i\) gives
\[
 A_i=1+\frac{\cos r_i}{\sqrt{1+\cos^2r_i}}>1+\frac1{\sqrt5}.
\]
The product lens exterior is conformally flat. More generally its Weyl energy is nonnegative and cannot decrease this cap estimate. The holonomy bound and Cauchy–Schwarz yield
\[
 \sum_i\int |b_i|^2\,dA_{q_i}\ge \frac{\pi}{A_1+A_2}.
\]
Combining this with the Dirichlet estimate, dropping the quartic term, and adding the two cap costs gives, for either chirality of an oriented gluing,
\[
 \frac{E_\pm}{T}
 \ \ge\ \frac23(A_1+A_2)+\frac{2}{9(A_1+A_2)}
 \ >\ \frac43\left(1+\frac1{\sqrt5}\right)+\frac{1}{9(1+1/\sqrt5)}
 \ >\ 2 .
\]
The comparison uses monotonicity in \(A_1+A_2\) above \(2(1+1/\sqrt5)\). The last sign follows by multiplying by \(9(1+1/\sqrt5)\), when the difference from \(2\) becomes \(-13/5+6/\sqrt5>0\). For the E09A parameters the lower bound is \(100/51+17/225>2\). Reversing either cap orientation swaps its chiral labels, leaving the two separate lower bounds applicable. For two such \(C^{1,1}\) joined halves, a smoothing converging in \(C^1\cap W^{2,2}\) preserves their strict energy excess for all sufficiently small smoothing parameters.

The E09A metric supplies a positive untwisted half with the smaller energy, and the marked opposite-sign gluing is available topologically. Within this unit round half-disk connection model the necessary opposite signs and strict entry are incompatible. A normalized base of variable curvature, a non-round fibre geometry, or a gluing that abandons the marked puncture decomposition would need another estimate or construction.
