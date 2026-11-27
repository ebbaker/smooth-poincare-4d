# Native harmonic data from two cuff lengths and a scalar equation

27 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E calculation for master B02. The requested dispatch was GPT-6.2 Sol/ultra. Actual serving model and effort were unavailable. Intake HEAD `48f36794f9b1`. The 07 inputs are the [direct trial][trial] `e999229fcdf9`, [framed assembly][assembly] `59c3993e018e`, [long-cuff geometry][long] `2cd30856714e` and [integrated band form][thin] `90510ea2b924`. The master inputs are the [fixed-width receipt][receipt], [absolute enclosure][enc] `f103fccfd777`, [marking readback][readback] `897eb8d94825` and [first-jet curvature identity][curv] `ddb5b8b7a6bd`.

For the unchanged smooth oriented width-\(1/16\), \(L=2\operatorname{arcosh}5\) Miller–Schupp trial, the native harmonic marking is determined by a scalar Neumann problem with two real Hopf parameters fixed by two literal cuff lengths. The first derivatives of its pullback metric vanish at the planar basepoint. On both complete band footprints its traceless first derivatives have norm less than \(280\), and \(|\partial q_L|_{\rm flat}<1100\). The conditional error estimate below gives pointwise first-jet errors from a smooth equivariant comparison map and its tension through order one. The subsequent [whole-domain certificate](NATIVE_MARKED_JET_CERTIFICATE_20261127.md) isolates the native length root and gives substantially tighter absolute first-jet errors on both complete bands.

## The exact scalar problem on the planar pants

Write \(F=\overline D_4(0)\setminus(D_{1/4}(-1)\cup D_{1/4}(1))\) and \(z=x+iy\). The doubled source and target have hyperbolic curvature \(-1\). Use the 07 oriented, cuff-labeled harmonic diffeomorphism \(h_L\), and let
\[
 \Phi(z)=\langle\partial_z h_L,\partial_z h_L\rangle,\qquad
 \mathcal H=e^u,\qquad
 \mathcal L=|\Phi|^2e^{-u},\qquad
 J=\mathcal H-\mathcal L>0 .
\]
The target scalar product is complex bilinear in the first formula. The linear and antilinear squared stretches \(\mathcal H,\mathcal L\) use the Euclidean source coordinate. The Hopf differential \(\Phi\,dz^2\) is holomorphic and
\[
 \begin{split}
 q_L &= (e^u+|\Phi|^2e^{-u})|dz|^2+2\operatorname{Re}(\Phi\,dz^2),\\
 E&=\operatorname{tr}_{\rm flat}q_L=2(\mathcal H+\mathcal L),\\
 \Delta u&=2(e^u-|\Phi|^2e^{-u}).
 \end{split}
\]
For the last equation, write the hyperbolic source as \(\sigma_0|dz|^2\). Wolf's closed-surface equation is \(\Delta_{\sigma_0}\log(\mathcal H/\sigma_0)=2J/\sigma_0-2\). Add \(\Delta\log\sigma_0=2\sigma_0\) to remove \(\sigma_0\) entirely. [Wolf, §2, formulas (I)–(III), (VI) and (VIII), and Theorem 3.1][wolf]

Let \(\nu\) be the Euclidean outward unit normal of \(F\). The tensor \(e^u |dz|^2\) on the Schottky double is invariant under the cuff reflection. Therefore all three cuffs are geodesic for this conformal metric. Their Euclidean signed geodesic curvatures are \(1/4\) at the outer cuff and \(-4\) at each hole. The curvature formula \(k_{e^u|dz|^2}=e^{-u/2}(k_{\rm flat}+\partial_\nu u/2)\) gives
\[
 \left.\partial_\nu u\right|_{|z|=4}=-\frac12,
 \qquad
 \left.\partial_\nu u\right|_{|z\mp 1|=1/4}=8.
\]
Integration of these data gives \(\int_F J\,dx\,dy=2\pi\). On the upper half, the three real seams have \(\partial_yu=0\) and \(\Phi\) real. On a circular cuff with center \(c\), \(\Phi(z)(z-c)^2\) is real by reflection in that cuff. On the full \(F\), \(\Phi(\bar z)=\overline{\Phi(z)}\), \(u(\bar z)=u(z)\), \(\Phi(-z)=\Phi(z)\), and \(u(-z)=u(z)\).

For comparison by solving for the map itself, fix the upper target hexagon \(K\) in the hyperboloid \(-X_0^2+X_1^2+X_2^2=-1\), \(X_0>0\). Use the labeled alternating normals \(n_i=(\sqrt3,2e_i)\) for the seams and \(m_{ij}=(-1/\sqrt2,\sqrt{3/2}\,e_k)\) for the cuffs, where \(k\) is the index other than \(i,j\) and \(e_j=(\cos(2\pi j/3),\sin(2\pi j/3))\). If a source edge is labeled by target spacelike unit normal \(n\), its native mixed data are
\[
 \langle U,n\rangle_{2,1}=0,\qquad
 \partial_{\nu}U-\langle\partial_{\nu}U,n\rangle_{2,1}n=0.
\]
Here \(U\) is the hyperboloid lift of \(h_L\), solving \(\Delta U=|dU|^2 U\) with the hyperbolic norm on \(dU\). The two normals of adjoining sides are perpendicular and the corner value is their assigned intersection. For a map version of a numerical certificate, impose smooth equivariance by Euclidean conjugation at each real seam and anti-conformal circle inversion at each cuff, together with reflection across the corresponding target geodesic. In particular the edge condition prescribes the geodesic containing the image and the perpendicularity of the normal derivative. The tangential parametrization of the edge is determined by the solution. [Target coordinates and labeled sides][enc]

### Why there are two real parameters

On the Schottky double, complex conjugation \(C\) preserves both pants copies and cuff reflection \(I\) exchanges them. They commute. Their composition is a holomorphic involution with six fixed points, the seam endpoints. Its quotient is a sphere by Riemann–Hurwitz. Its invariant holomorphic quadratic differentials descend to meromorphic quadratic differentials on the sphere with at most simple poles at those six branch values. Indeed the local quotient \(w=z^2\) sends \(\Phi(z)dz^2\) with \(\Phi\) even to \(\Phi(\sqrt w)dw^2/(4w)\). The latter space has complex dimension three by Riemann–Roch, equal to the dimension of all holomorphic quadratic differentials of a genus-two surface. Thus \(CI\) acts trivially on this space, and the anti-real conditions for \(C\) and \(I\) agree.

The holomorphic half-turn \(z\mapsto-z\) of each copy has precisely two fixed points on the double, one in each copy, and the quotient has genus one. Its invariant quadratic differentials descend in the same way, now allowing at most simple poles at two distinct points of the torus. Riemann–Roch and degree two give complex dimension two. The half-turn commutes with \(C\). The fixed space of the anti-linear real structure \(\Phi\,dz^2\mapsto\overline{C^*(\Phi\,dz^2)}\) has real dimension two in that invariant complex space.

For each element of this real space Wolf's parametrization supplies a hyperbolic harmonic pullback on the given double. Equivariance follows from uniqueness. The fixed coefficient \(\Phi\) determines \(u\) uniquely by the displayed Neumann equation. In fact the difference of two solutions satisfies a linear equation \(\Delta v=b(z)v\) with \(b>0\) and zero normal derivative. Integration against \(v\) forces \(v=0\). The original marking corresponds to the unique element of the two-real-dimensional space for which the outer cuff and right cuff satisfy
\[
 \int_{C_j}\sqrt{e^u+|\Phi|^2e^{-u}
                    +2\operatorname{Re}(\Phi\,t_j^2)}\,d\ell_{\rm flat}=L .
\]
Here \(t_j\) is the complex Euclidean unit tangent of the actual planar cuff \(C_j\). The left cuff is isometric to the right by the half-turn. For uniqueness of the two parameters, the metric of each solution has geodesic cuffs and seams by the involutions. The upper disk lifts isometrically to the hyperbolic plane and is a labeled right-angled hexagon, with each cuff half-length equal to half its full cuff length. Right-angled hexagon uniqueness for those three alternate side lengths identifies it with the specified target hexagon preserving the label order. Reflection extends that isometry to the specified doubled marking, so both pullbacks must be the unique harmonic one. This gives the two native length equations without Teichmüller twist parameters. The [enclosed common length root and native first derivatives](NATIVE_MARKED_JET_CERTIFICATE_20261127.md) use the two harmonic-measure squares. [Harmonic marking and fixed homotopy][trial] · [Wolf, Theorem 3.1 and §5.1][wolf]

For a coefficient and scalar solution enclosure, the first jets follow by algebra and holomorphic differentiation. In particular, if \(D=e^u+|\Phi|^2e^{-u}\) is the scalar part of \(q_L\), then
\[
 \partial_a D=J\partial_a u+
      2e^{-u}\operatorname{Re}(\overline\Phi\,\partial_a\Phi).
\]
At \(z=0\), the actual marking sends the source to the midpoint of the target seam between the two hole cuffs, namely the foot \(p_i=(2,\sqrt3e_i)\) of the hexagon center on that seam. This follows from the seam and hole-exchange reflections. Conjugation gives \((q_L)_{xy}(0)=0\), and the half-turn gives \(\partial q_L(0)=0\). These are exact native data at the center point of the projected pauses.

## Absolute first derivatives on both footprints

Write \(\rho=87/128\) and \(R_* = \operatorname{arcosh}(9/\sqrt2)<127/50\). A Euclidean \(D_\rho(z_0)\) at each footprint point maps into one or two reflected target hexagons lying in the ball of radius \(R_*\) about the foot of the corresponding seam. The Bochner and squared-distance comparison gives \(E(z)<2(127/50)^2/(\rho-r)^2\) on \(\overline D_r(z_0)\) for \(r<\rho\). At \(r=\rho/3=29/128\), holomorphic Cauchy differentiation and \(|\Phi|\le E/4\) give
\[
 |\Phi'(z_0)|<\frac{(127/50)^2}{2(\rho-r)^2r}<70.
\]
The trace-free matrix of \(q_L\) has entries \(2\operatorname{Re}\Phi,-2\operatorname{Re}\Phi\) on the diagonal and \(-2\operatorname{Im}\Phi\) off the diagonal. Its first-derivative tensor has flat Frobenius norm \(4|\Phi'|<280\). [Two reflected hexagons and Bochner bound][enc]

For the scalar trace, use the explicit lower barrier
\[
 h(z)=\frac{e^{|z|^2/64}}{256\,|z^2-1|^{3/2}},\qquad \mathcal H\ge h .
\]
The boundary comparison uses \(\partial_\nu\log h\le-1/2\) on the outer circle and \(\partial_\nu\log h\le8\) on the holes. At radius four the sum of the two outward derivatives of \(\log|z-1|\) and \(\log|z+1|\) is \((136-16\cos^2\theta)/(289-64\cos^2\theta)\ge8/17\). On a hole the self term in \(\partial_\nu\log h\) is \(6\), the other logarithm contributes at most \(6/7\), and the radial term at most \(5/128\). Since \(|z-1|,|z+1|\ge1/4\) and their sum is at least two, their product is at least \(7/16\). Thus \(2h<1/24\) using \(e^{1/4}<4/3\) and \((16/7)^{3/2}<4\). Consequently \(\Delta\log h=1/16\ge2h\). With \(\Delta u=2J\le2\mathcal H\), integration against \((\log h-u)_+\) proves the comparison, including the boundary.

On \(\overline D_{1/4}(z_0)\), the previous energy estimate gives \(E<70\). Also \(|z|\le 2+9/128+1/4\) implies \(|z^2-1|<7\), so \(1/5000<\mathcal H<35\). The oscillation of \(u\) there is less than \(\log(175000)<49/4\). For the disk of radius \(b=1/4\), split \(u\) as its harmonic extension from the circle plus its zero-trace Poisson solution. The gradient of the harmonic part at the center has norm at most \(4/(\pi b)\) times half the oscillation, by integrating the absolute directional derivative of the Poisson kernel. The derivative of the Green kernel has integral zero and integral of its norm \(2b/3\). Since \(0\le\Delta u\le E<70\), subtract 35 from this source for the derivative estimate. This proves \(|\nabla u(z_0)|<98/\pi+35/6<39\). At the center \(J\le E/2<14\), \(|\Phi|/\mathcal H<1\), and \(|d\Phi|=\sqrt2|\Phi'|\). It follows that \(|dD|<14\cdot39+140\sqrt2<746\). Orthogonality of trace and traceless parts gives
\[
 |\partial q_L|^2_{\rm flat}<2\cdot746^2+280^2<1100^2.
\]
These bounds apply to all angles of each complete physical band footprint.

## A pointwise first-jet error bound for a comparison map

Let \(v\) be a smooth map of the same marked doubles with the stated reflection equivariance, whose upper half has image in the labeled \(K\). Use \(\tau\) for its native Euclidean-domain tension, and assume its smallest singular value on \(F\) with hyperbolic target norm is at least \(m>0\). For any certified \(\eta<1\) with \(\sup_F |\tau|\le\eta m^2\), the hyperbolic distance comparison gives \(d(h_L,v)\le\operatorname{artanh}\eta\). Smooth doubled matching and the same target labels are needed to apply this comparison. [Position estimate from the endpoint Jacobi form][enc]

For a footprint center \(z_0\), use a matched hyperboloid lift \(U,V\) of \(h_L,v\) on \(\overline D_{1/4}(z_0)\), with the seam foot as the origin of the hyperboloid chart. The ambient Euclidean norm of either hyperboloid position, and the norm of the inclusion differential from its hyperbolic tangent plane, are bounded by \(M=9\). In fact the latter norms are bounded by \(\sqrt{\cosh(2R_*)}=\sqrt{80}\), as seen by separating radial and angular vectors. The ball is geodesically convex. Thus with \(W=U-V\) one has
\[
 \sup |W|\le w=9\operatorname{artanh}\eta .
\]
Let \(A_U,A_V\) bound \(|\partial U|,|\partial V|\) and \(D_U,D_V\) bound \(|\partial^2U|,|\partial^2V|\) on this disk, using ambient Euclidean Frobenius norms. Admissible fixed bounds are \(A_U=76\), \(D_U=11430\). Indeed \(E<70\) and \(9\sqrt{70}<76\). For the ambient second derivatives set \(S_{ij}=\nabla_i\partial_jU\) with the hyperbolic connection. At any point of the disk use the Bochner estimate on radius \(2/16\), where \(E<140\) from the remaining radius \(\rho-1/4-1/8\). Then \(\Delta |S|^2\ge-1680|S|^2\). The disk Green bound gives \(\int_{D_{1/16}}|S|^2\le 140\pi/\log2\), and subharmonic lifting by \(e^{\sqrt{1680}t}\) to the three-ball gives
\[
 |S|^2\le\frac{3\cdot140\cdot256}{2\log2}e^{\sqrt{1680}/16}<1200^2 .
\]
Here \(e^{\sqrt{1680}/16}<16\) and \(\log2>2/3\). Since \(\partial_i\partial_j U=S_{ij}+\langle U_i,U_j\rangle_{2,1}U\), this proves \(D_U\le9(1200+70)\). [Differentiated Bochner estimate][enc]

For a vector-valued \(F_0\) on a closed Euclidean disk of radius \(R\) suppose
\[
 |F_0|\le w_0,qquad
 |\Delta F_0|\le a_0|F_0|+b_0|\nabla F_0|+c_0,
 \qquad a_0,b_0,c_0\ge0 .
\]
Define
\[
 \gamma=\frac1{2(1+b_0R)},\qquad
 \mathcal G(R,a_0,b_0;w_0,c_0)
 =\frac2R\left(\frac{3w_0}{\gamma}
                +\gamma R^2(a_0 w_0+c_0)\right).
\]
Then \(|\nabla F_0|\le\mathcal G\) on the disk of radius \(R/2\). To prove this, the disk Poisson and Green formulas give \(|\nabla F_0(x)|\le 2w_0/r+(2r/3)\sup_{D_r(x)}|\Delta F_0|\). The first constant follows from the two first Fourier coefficients of the boundary data. The second is the integral norm of the derivative kernel used above. Set \(d_x=R-|x-z_0|\), \(r=\gamma d_x\), and \(G=\sup_x d_x|\nabla F_0(x)|\). On this small disk the gradient is bounded by \(G/((1-\gamma)d_x)\). After multiplying by \(d_x\) and taking the supremum, its coefficient is \(2\gamma b_0R/(3(1-\gamma))<1/3\). Solving the resulting inequality and dividing by \(d_x\ge R/2\) gives the formula.

In the chart use \(c_0=\sup|\tau|_{\mathbb R^3}\) and \(c_1=\sup|\partial\tau|_{\mathbb R^3}\), where the tension is represented by its ambient tangent vector along \(V\). These constants and the bounds for \(V\) use only the supplied comparison map. Set \(A_*=A_U+A_V\), \(D_*=D_U+D_V\) and
\[
 a=70,\qquad b=MA_*,\qquad
 a_*=2a+b+2A_U D_U+MD_*+A_*A_V .
\]
Writing \(E_U=|dU|^2\) with hyperbolic target norm, the map equation gives
\[
 \Delta W=E_U W+V\sum_i\langle U_i+V_i,W_i\rangle_{2,1}-\tau .
\]
Thus \(|\Delta W|\le a|W|+b|\nabla W|+c_0\). Differentiating once, the coefficient of \(\nabla^2W\) remains bounded by \(b\), the energy derivative is bounded by \(2A_U D_U\), and derivatives of the two factors in the term multiplying \(W_i\) contribute \(MD_*+A_*A_V\). Consequently for the stacked field \(P=(W,\partial_1W,\partial_2W)\) one has \(|\Delta P|\le a_*|P|+b|\nabla P|+c_0+c_1\). Taking the disk estimates first on radius \(1/4\) and then on radius \(1/8\) yields
\[
 g_1=\mathcal G(1/4,a,b;w,c_0),\qquad
 g_2=\mathcal G(1/8,a_*,b;w+g_1,c_0+c_1),
 \qquad
 |\partial W(z_0)|\le g_1,\quad |\partial^2 W(z_0)|\le g_2.
\]
For \(q_v=v^*g_{\mathbb H^2}\), differentiating the ambient Gram matrix now proves
\[
 |q_L-q_v|(z_0)\le A_*g_1,qquad
 |\partial q_L-\partial q_v|(z_0)\le 2A_Ug_2+2D_Vg_1 .
\]
These constants are conservative. They convert verified native position and tension data into pointwise tensor and first-derivative intervals on every footprint point, with uniform constants if the comparison bounds are uniform. Bounds on the least singular value and on the value and first derivative of the tension must cover the actual smoothly reflected map. An interval enclosure of the two scalar length parameters and the scalar solution would use the algebraic jet formula above. Both routes still need a numerical solve and a certificate. The common-core Neumann and original closed signs and the exact value of the chiral cost remain undetermined by these estimates. An independent lower bound already puts the specified trial above the entry budget. [Native band integration][budget]

[trial]: ../../investigations-1/07_positive_subcritical_entry/notes/DIRECT_TRIAL_AND_VARIATION.md
[assembly]: ../../investigations-1/07_positive_subcritical_entry/notes/MARKED_CONNECTION_ASSEMBLY.md
[long]: ../../investigations-1/07_positive_subcritical_entry/notes/LONG_CUFF_SEAM.md
[thin]: ../../investigations-1/07_positive_subcritical_entry/notes/THIN_DIRECT_SIGN.md
[receipt]: ../research-progress/handoffs/FIXED_WIDTH_AND_MARKED_CLOSING_20261127.md
[enc]: HARMONIC_MARKING_ENCLOSURE_20261127.md
[readback]: ../reviews/ACTUAL_MARKING_READBACK_20261127.md
[curv]: FIRST_JETS_FOR_BOTH_BAND_COSTS_20261127.md
[budget]: ../reviews/NATIVE_TRIAL_INTEGRATION_20261127.md
[wolf]: https://pagine.dm.unipi.it/~a019210/Wolf_Teichmuller%20theory%20of%20harmonic%20maps.pdf#page=5
