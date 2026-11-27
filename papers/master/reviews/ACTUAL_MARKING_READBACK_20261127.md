# The actual width-one-sixteenth marking and a harmonic-map error estimate

27 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance, master B02. Actual serving model and effort were unavailable. Intake `48f36794f9b1`. The [07 direct trial](../../investigations-1/07_positive_subcritical_entry/notes/DIRECT_TRIAL_AND_VARIATION.md), [framed maps](../../investigations-1/07_positive_subcritical_entry/notes/MARKED_CONNECTION_ASSEMBLY.md) and [funnel compactification](../../investigations-1/07_positive_subcritical_entry/notes/FUNNEL_EXTERIOR.md) had blobs `e999229fcdf9`, `59c3993e018e` and `0cc56c281145`. The tests are on the regular and long equicuff variants of the same smooth oriented marked minus Miller–Schupp presentation. The marking-error estimate is conditional on the residual and singular values of a comparison map.

## Physical metric and two-band symmetry

The planar pants $F$ has outer radius $4$ and holes of radius $1/4$ centered at $\pm1$. Its Schottky double has the conformal structure of the specified circular domain. The conformal structure determines the closed hyperbolic source. The target right-angled hexagon is determined by the three alternating lengths $L/2$. Its doubling across the perpendiculars and the subsequent doubling across the cuffs specify the target and its labeled cells. In the source the three real-axis intervals cut the original pants into its two hexagonal disks. Label-preserving edge matching with the specified orientation fixes the homotopy on the edges relative to their endpoints and then on the disk interiors. The genus-two harmonic marking is a unique diffeomorphism. Equivariance under the two reflections follows by uniqueness. In particular the labels and orientation specify the hexagon to which the upper half maps. The boundary orientations also distinguish the source and target pants copies because each single cuff is nonseparating in the closed double and its nonzero integral homology class is distinct from its negative. This fixes the native tensor $q_L$ on $F$. [Schoen–Yau, §3 corollary](https://archive.ymsc.tsinghua.edu.cn/pacm_download/59/11042-Shing-Tung_Yau_47.pdf) · [Wolf, §2](https://pagine.dm.unipi.it/~a019210/Wolf_Teichmuller%20theory%20of%20harmonic%20maps.pdf#page=5)

The equal-time letters use the inherited flat-ended speed step $H$. Put $\delta=1/16$, $\theta=2\pi t$, $r=1+s$ and $p=(u,v,w)\in S^2$. With $\xi=c_i(t)+\delta r(u,v)$ the full exterior tensor is

\[
 B_i=q_{L,ab}(\xi)\,d\xi^a d\xi^b+\delta^2d(rw)^2
       +\sin^2(\phi_i+\delta rw)\,d\theta^2 .
\]

The angular variable of the exterior advances at unit $\theta$ speed, including at a pause of $c_i$. The pullback of the product orientation to the tube is positive relative to $dr\wedge d\theta\wedge dA_{S^2}$. Indeed the volume sign is that of $du\wedge dv\wedge dw\wedge d\theta$ in the Cartesian transverse frame, and $du\wedge dv\wedge dw=r^2dr\wedge dA_{S^2}$ in transverse polar coordinates. It is also the orientation of the radius-one cap in increasing polar radius. The outward normals of the retained exterior and cap meet with opposite signs in the common radial coordinate.

The cap is smooth at its center since $\sinh t'=t'+O(t'^3)$ is odd analytic with derivative one at zero. The band agrees with the cap germ on an open inner interval. At $s=1/8$, the baseline $H(16s-1)$ has exterior jets of every order and the available larger tube provides the exterior germ on the other side. The compactification equals one through a collar of each hyperbolic waist. On each outer tail it gives $B^{-2}(dv^2+\sin^2v\,\sigma+\ell^2d\eta^2)$, smooth across the collapsed two-sphere in a polar three-disk. Both the circle phase convention and alternate ways of identifying the original auxiliary corner rounding act by a diffeomorphism that fixes the native band charts. In particular the choice of the corner rounding in the first construction does not leave a metric ambiguity for the physically defined closed assembly up to marked isometry. The regular and long cases correspond to $L=2\operatorname{arcosh}2$ and $L=2\operatorname{arcosh}5$. [Completed exterior](../../investigations-1/07_positive_subcritical_entry/notes/FUNNEL_EXTERIOR.md)

The planar reflection $P(x,y)=(-x,y)$ exchanges the two holes and preserves the outer circle. The equicuff target has the same labeled reflection, so uniqueness makes $P$ an isometry of $q_L$. In the doubled target hexagon the two incident lengths of each type are identified by the same labeled symmetry. In contrast, an arbitrary exchange of the outer cuff with an inner one in the equicuff target supplies no matching Euclidean symmetry of the source tube coordinates.

The exact timed relator comparison uses $P$ and $t\mapsto5/7-t$. With uppercase inverses the two letter sequences are $(X,y,y,x,Y,Y,Y)$ and $(X,y,x,x,Y,X,X)$. The input interval $j$ is sent to target interval $4-j\pmod 7$. Reflection sends $x$ to $y^{-1}$ and $y$ to $x^{-1}$. Reversal of the timed parameter gives the sequence $(Y,x,x,y,X,X,X)$, equal to the second word read on intervals $4,3,2,1,0,6,5$. The identity $H(1-u)=1-H(u)$ makes this a literal timed relation. The sphere isometry $(\phi,\theta)\mapsto(\pi-\phi,10\pi/7-\theta)$ and the transverse map $(u,v,w)\mapsto(-u,v,-w)$ then intertwine the two actual $\Phi_i$. On the cap the same map is smooth in polar coordinates. The sphere map preserves sphere orientation and $P$ reverses planar orientation, so the product isometry reverses four-dimensional orientation. It exchanges the complete bands, the signed costs with chirality reversed, and the two reflected Hopf tests. The separate closed cost comparison already gives equality of the two chiralities on each band, so both bands have a common cost $c$ at either baseline length. The original budget is equivalent to $c<4\pi^2$. The Hopf lifts can be matched by the corresponding isometry between their cyclic holonomy covers. [Existing Hopf form and separate cost equality](../notes/HOPF_NEUMANN_TEST_20261127.md)

## A quantitative estimate for validating a trial map

Let $h$ now denote the actual harmonic map, and let $k$ be any smooth diffeomorphism of the doubles with the same labeled marking and both reflection equivariances. Let $m>0$ be a lower bound for the least singular value of $dk$ on $F$ with native Euclidean domain metric and curvature-$-1$ target metric. Compute the tension $\tau(k)$ using those same metrics. In two domain dimensions the closed harmonic equation becomes the Euclidean harmonic equation on $F$. The boundary terms in differentiating its energy vanish for the geodesic homotopy between $k$ and $h$. At any cuff the homotopy stays in the target geodesic and the native normal derivative of the reflected map is perpendicular to it. Circular reflection has that same normal eigendirection. All norms below are Euclidean on the domain. Both maps have pointwise lifts into the same assigned target hexagon, or its lower reflection. Their compatible pointwise distance $D$ is bounded by the diameter $D_0$ of that hexagon.

Put $A=\cosh(L/2)$ and let $d$ be the other alternating side length. The right-angled hexagon cosine identity gives $\cosh d=A/(A-1)$. The distances of vertices two steps apart have cosh $A^2/(A-1)$ by the right-triangle law. For opposite vertices use three consecutive sides of type $L/2,d,L/2$. Along the middle geodesic the parallel transported unit perpendicular points into the polygon at both ends. The hyperboloid distance formula gives cosh $A^2\cosh d-\sinh^2(L/2)=1+A^2/(A-1)$. Convexity of distance along geodesics gives a maximizing pair of vertices. Thus

\[
 D_0=\operatorname{arcosh}(5)\quad\text{or}\quad
 D_0=\operatorname{arcosh}(29/4)
\]

in the regular and long cases, respectively.

Write $k_b$ for the pointwise constant-speed geodesic homotopy, $b\in[0,1]$, and $E(b)=\tfrac12\int_F|dk_b|^2$. Differentiation, with $E'(1)=0$, gives

\[
 \int_0^1 E''(b)\,db=-E'(0)
 \le \|\tau(k)\|_2\,\|D\|_2.
\]

For each native orthonormal source direction, let $J$ be its variation field along the target geodesic, in a parallel frame. The corresponding curvature-$-1$ integrand of $E''$ is $|J'|^2+D^2|J_\perp|^2$. Among paths with prescribed $J_\perp(0)$ and free far endpoint its perpendicular contribution is minimized by multiplication by $\cosh(D(1-b))/\cosh D$. Its minimized value is $D\tanh D\,|J_\perp(0)|^2$. Summing the initial perpendicular derivative squares gives at least $m^2$. The decreasing ratio $\tanh D/D$ therefore gives

\[
 \|D\|_{L^2(F)}\le \frac{D_0}{m^2\tanh D_0}\|\tau(k)\|_{L^2(F)}.
\]

Keeping just the $|J'|^2$ term and using Cauchy–Schwarz along each path also gives $\|dh^{\parallel}-dk\|_2^2\le\|\tau(k)\|_2\|D\|_2$, where $dh^{\parallel}$ is parallel transported to $k$. Both estimates hold irrespective of how the comparison map was computed.

The convexity of distance on the product of two hyperbolic planes gives $\Delta D\ge-|\tau(k)|$ on native interior disks, in distributions. One can first smooth the distance at zero by $\sqrt{D^2+\epsilon^2}$, which preserves convexity, and pass to the limit. Every projection of an enlarged tube through radius $5/4$ has distance at least $3/4-5/64=43/64$ from both hole boundaries. Its exterior circular boundary is farther away. Each such point therefore has a Euclidean disk of radius $2/3$ in $F$. On that disk apply the area submean inequality to the subharmonic function $D+\|\tau(k)\|_\infty|x-x_0|^2/4$. It gives the explicit local estimate

\[
 \sup_{\text{projected enlarged tubes}}D
 \le \frac{3D_0}{2\sqrt\pi\,m^2\tanh D_0}\|\tau(k)\|_{L^2(F)}
       +\frac1{18}\|\tau(k)\|_{L^\infty(F)}.
\]

The lower bound for $m$ and the upper bounds for the residual require a concrete comparison map. The estimate certifies displacement in the actual marked class and integral first-derivative error. A certificate for a fixed-width chiral cost or first spectral sign still needs validated derivative bounds or an independent finite-width Rayleigh inequality. The foregoing checks give no sign conclusion at $1/16$.

## Readback of the independent long-cuff enclosure

The [long-cuff enclosure](../notes/HARMONIC_MARKING_ENCLOSURE_20261127.md) at blob `428815a2a99a` checks on both actual band footprints. The three unit seam normals have pairwise Lorentz product $-5$. The displayed cuff normal pairs with the six vertices in the values $0,3/4,15/4$, each twice. The logarithmic cuff barriers are harmonic where needed, with Neumann data on the two real edges incident to their cuff and dominating values on the other edges. The seam foot $p_i$ gives $\max_K\cosh d(p_i,\cdot)=9/\sqrt2$ by the vertex minimum $-3$ of $(e_j+5e_k)\cdot e_i$. A native disk of radius $87/128$ meets at most one real edge, so this bound holds on both possible lifted halves. The submean inequality for $E=|dU|^2$ and $\Delta d(p_i,U)^2\ge2E$ yield the claimed $E<28$. On the smaller disks for the differentiated estimate, the same argument with radius $87/128-1/6$ gives $E<50$. Both strict comparisons follow from the degree-ten Taylor polynomial of $\cosh(127/50)$ and rational arithmetic.

Write $T_i=\partial_iU$ and $S_{ij}=D_iT_j$ as in the enclosure. Each of the six contractions in the rough Laplacian is bounded by $E|S|$ in the full Frobenius norm. For example, $|\sum_a R(S_{ia},T_j)T_a|\le|T_j| E^{1/2}(\sum_a|S_{ia}|^2)^{1/2}$, and squaring and summing the free indices gives the asserted norm. The same bound applies to the other four contraction types with the stated multiplicities. The Green disk identity, using $\Delta E\ge2|S|^2$, gives $\int_{D_{1/12}}|S|^2\le50\pi/\log2$ with the claimed factor of $\pi$. Lifting by $e^{\sqrt{600}t}$ and applying the three-ball mean bound gives $|S|^2<86400/\log2<360^2$. Contracting the differentiated pullback metric gives $|\partial q_L|\le2\sqrt E|S|<4000$ in the full Euclidean Frobenius norm. The separate residual-to-supremum estimate uses the Jacobi endpoint form and the least singular value of the comparison map. Its distance Hessian lower bound and maximum-principle sign agree with the curvature calculation above. [Harmonic enclosure and distortion calculation](../notes/HARMONIC_MARKING_ENCLOSURE_20261127.md)

The radial Schur-complement bounds and the two tangential end ratios also check. In particular the sphere ratio is bounded by $28(9/128)^2=567/4096<1/7$. The longitude ratio uses $\sin(\pi/3-9/128)>9/11$ and $\sinh(9/8)<7/5$, which give a ratio greater than $1/3$. The Rayleigh difference of the two directions bounds the spectral spread even if the directions are not $h$-orthogonal. Removing the trace costs a factor at most two in the squared-norm comparison. Recomputing all fifteen lower rectangles using rational arithmetic, with the exact cell integrals of $a(1-a)$, gives the listed sum of floored contributions $60413$ in thousandths. This proves the pure switching lower contribution exceeds $60$ for the stipulated supported density test.

For that test $f=\chi J^{-1/3}$, the tangential gradient adds $+(2/3)\int\chi^2NJ^{1/3}|d_h\log J|_h^2\,ds\,d\mu$. Integrating the lapse Laplacian over the slice produces the signed term $-(4/3)\int\chi^2J^{1/3}\langle d_h\log J,d_hN\rangle_h\,ds\,d\mu$. The normal square contributes $+6\int J^{1/3}N^{-1}(\chi'-\chi\operatorname{div}_\mu\beta/3)^2\,ds\,d\mu$. The inner cutoff of the supported test with $f(0)=0$ and $\chi(1/16)=1$ costs strictly more than $4900$ on the exact scalar-flat inner germ. This follows by Cauchy–Schwarz with weights $\sinh(1+s)$ and its reciprocal. A constant extension with the matching inner value throughout the cap and inner germ removes that expense. The pure switching bound neither bounds the total shear $|a'P+S|^2$ below by $60$ nor decides the sign in competition with the positive terms. The derivative and position bounds are absolute, and the displayed numbers provide no certified finite-width sign or chiral cost. [Density test and inner-germ check](../notes/FIXED_WIDTH_BAND_TEST_20261127.md#the-cost-of-the-inner-cutoff-in-the-density-test)

The central-seam and angular additions at blob `9d99310de5af` also check. Each corridor disk of radius $5/24$ avoids the right-hole center by at least $1/24$. For points of the disk inside that hole, inversion reflects to radius at most $3/2$ about $1$, so it misses the other two cuffs. Any real intersection of the original disk has $x<1$ because $\sqrt{1/16-y^2}>\sqrt{(5/24)^2-y^2}$ at the center ordinate where the comparison is needed. The inverted real intersections stay left of the center, so only the central seam and right cuff reflections enter. These commute and fix their common target vertex. The six vertex values of its cosh distance are exactly $1,5/4,5,25/4,25/4,29/4$, giving $E<336$ by the same Bochner comparison. The target signed axial component has value $1/(2\sqrt2)$ at the right vertex and zero cuff derivative there because the cuff tangent is normal to the seam. The proposed $\beta\sinh(21x)\cos(3\pi y)$ satisfies the boundary comparison and has $(\Delta-E)$ nonnegative. Differentiation and the signed target arc length $\operatorname{arcsinh}\ell$ give the point and averaged lower bounds on $(q_L)_{xx}$. The full-seam average uses its exact length $\log2$. Each displaced letter loop stays in its peripheral free homotopy class, so its angular interval $2\pi/7$ yields an integrated squared speed at least $7L^2/(2\pi)$. Summing gives the claimed unweighted longitude average. These bounds concern one planar direction or an unweighted circle average. [Central-seam and longitude estimates](../notes/HARMONIC_MARKING_ENCLOSURE_20261127.md#a-lower-directional-enclosure-on-the-central-real-seam)

## First-derivative evaluation of the band curvature

Use $R(X,Y)Z=\nabla_X\nabla_YZ-\nabla_Y\nabla_X Z-\nabla_{[X,Y]}Z$ and $R_{ijkl}=g(R(\partial_i,\partial_j)\partial_k,\partial_l)$. Lowering the Christoffel index before differentiating gives

\[
R_{ijkl}=\tfrac12(\partial_{ik}g_{jl}+\partial_{jl}g_{ik}-\partial_{il}g_{jk}-\partial_{jk}g_{il})
  +g_{mn}(\Gamma^m_{ik}\Gamma^n_{jl}-\Gamma^m_{jk}\Gamma^n_{il}).
\]

The derivatives of the metric introduced by lowering the index cancel the appropriate connection products by $\partial_i g_{lm}=g_{mn}\Gamma^n_{il}+g_{ln}\Gamma^n_{im}$. For the unit round sphere in stereographic coordinates $g=4(1+|x|^2)^{-2}\delta$, at $x=(1,0,0,0)$ the displayed linear and quadratic contributions to $R_{1221}$ are $-1$ and $2$, giving sectional curvature $+1$. The compatible contractions are $\operatorname{Ric}_{jk}=g^{il}R_{ijkl}$ and $\langle\mathcal R(e_i\wedge e_j),e_k\wedge e_l\rangle=R_{ijlk}$ in an orthonormal frame.

Let $Q(g)$ be the quadratic Christoffel expression, $D=B-A$, and $K_{pq;uv}=a_{pq}D_{uv}+a_p\partial_qD_{uv}+a_q\partial_pD_{uv}$. For $g=A+aD$ the identity yields

\[
R(g)_{ijkl}=(1-a)R(A)_{ijkl}+aR(B)_{ijkl}
 +[Q(g)-(1-a)Q(A)-aQ(B)]_{ijkl}
 +\tfrac12(K_{ik;jl}+K_{jl;ik}-K_{il;jk}-K_{jk;il}).
\]

Both end curvatures are exact products of surfaces of sectional curvatures $-1$ and $+1$. In the marked band chart, the full $R(B)$ is the pullback of their product tensor and uses $q_L$ and $D\Phi_i$ algebraically. The quadratic and product-rule terms use first derivatives of $q_L$, at most two derivatives of the prescribed tube map, and the known second derivatives of the switch. The expression is exact at each endpoint by the constant jets of $a$. The smooth endpoints are Weyl-flat. A signed Weyl quadrature can therefore start from validated first derivatives of $q_L$, or second derivatives of the harmonic marking, by taking Ricci traces and Hodge projections algebraically. This improves the derivative requirement of directly differentiating the band metric. The present bounds still leave the numerical cost unverified.
