# Exchange symmetry of the fixed Miller–Schupp bands

27 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E calculation under master B02. Actual serving model and reasoning effort were unavailable. Intake 48f3679. The [07 direct trial](../../investigations-1/07_positive_subcritical_entry/notes/DIRECT_TRIAL_AND_VARIATION.md), [marked assembly](../../investigations-1/07_positive_subcritical_entry/notes/MARKED_CONNECTION_ASSEMBLY.md), [funnel exterior](../../investigations-1/07_positive_subcritical_entry/notes/FUNNEL_EXTERIOR.md), and [master trace test](HOPF_NEUMANN_TEST_20261127.md) had working blob prefixes e999229fcdf9, 59c3993e018e, 0cc56c281145, and 0a88a993bc54. The calculation uses the exact harmonic marking, positive-facing caps, retained product, and both complete fillings of the smooth oriented minus Miller–Schupp boundary. It applies at the common switching width \(1/16\), band length \(1/8\), and cuff length \(L=2\operatorname{arcosh}5\). The argument applies at any common width in this convex family and to either equal-cuff length in 07.

The two bands have the same real two-form chiral Hilbert–Schmidt cost \(c>0\) in both chiralities. Both Hopf signs coincide. The original closed sign and the sign of the three-cuff double each reduce exactly to a form on one pair of band traces. The sign of that form and the numerical value of \(c\) at width \(1/16\) remain undetermined. The symmetry yields a stricter necessary Hopf test for this family and a radial Rayleigh upper test with no exterior elliptic solve. [Previous comparison](THREE_FUNNEL_CROSSING_20261127.md)

## The actual exchange

Let \(P(x,y)=(-x,y)\) on the planar pants. It preserves the upper and lower hexagons, fixes the outer cuff as a set, and exchanges the left and right cuffs. It extends anti-conformally across the Schottky double, preserving each copy setwise, and is an isometry of its curvature-\(-1\) uniformization. On the target hexagon, the three alternating cuff segments are equal, and the right-angled hexagon cosine law gives equal seam lengths. Reversing cyclic order with the same labeled cuff swap is a hexagon isometry by congruence of right-angled hexagons with the same alternating sides. It extends to a reflection \(P_L\) of the target doubled surface, preserving both original pants copies and both labeled hexagons. The two reflections act in the same way on the labeled cell decompositions. Hence \(P_L^{-1}\circ h_L\circ P\) is in the marking class of \(h_L\). This follows on the vertices and intervals and then on each disk face by homotopy relative to its boundary. Composition with isometries preserves harmonicity. Uniqueness of the harmonic map in this marking class between the closed hyperbolic doubles gives \(h_L\circ P=P_L\circ h_L\), so \(P^*q_L=q_L\) on the actual planar domain. [07 harmonic marking](../../investigations-1/07_positive_subcritical_entry/notes/DIRECT_TRIAL_AND_VARIATION.md#physical-representative-and-interpolation) · [Wolf, §3, closed hyperbolic harmonic marking and uniqueness attribution](https://pagine.dm.unipi.it/~a019210/Wolf_Teichmuller%20theory%20of%20harmonic%20maps.pdf#page=6)

For inverse letters use uppercase. The words in the original order are
\[
(X,y,y,x,Y,Y,Y),\qquad (X,y,x,x,Y,X,X).
\]
The planar reflection sends the actual oriented loops \(x\mapsto Y\) and \(y\mapsto X\). The parameter change \(t\mapsto5/7-t\) sends the \(j\)-th letter interval of the first word to the \((4-j)\bmod7\)-th interval of the second, indexed from zero, with time reversed. Reflect each first-word letter under \(P\) and invert it to account for time reversal. This gives \((Y,x,x,y,X,X,X)\), the exact second-word sequence at indices \((4,3,2,1,0,6,5)\). The common flat step satisfies \(H(1-u)=1-H(u)\). Thus the timed loops satisfy \(c_2(5/7-t)=P(c_1(t))\), as maps in the original affine coordinates, including the pauses. Here \(c_i(t)\) denote the original planar paths.

On the exterior sphere let \(S(\phi,\theta)=(\pi-\phi,10\pi/7-\theta)\), the rotation by \(\pi\) about the equatorial axis at longitude \(5\pi/7\). Let \(D(u,v,w)=(-u,v,-w)\) be the rotation by \(\pi\) of the framed two-sphere about its \(v\)-axis. The complete framed identity is
\[
(P\times S)\Phi_1(t,rp)=\Phi_2(5/7-t,rDp),
\]
with the inverse given by the same involution. The outer metric \(B_i\) therefore pulls back into its partner. The map \((s,\theta,p)\mapsto(s,10\pi/7-\theta,Dp)\) also preserves the inner metric \(A\), the entire scalar switch, and the inner disk germ and cap, including the disk centers. The exterior isometry extends along each funnel by its induced boundary isometry and unchanged normal radius. It preserves the radial compactifying multiplier, including the smooth collapsed end. Consequently this is an orientation-reversing global isometric involution of \(M\), since the planar factor reverses orientation and the spherical rotation preserves it. It induces the same isometry of the three-cuff core \(V\) and extends to its double.

On the two cyclic Hopf exteriors the planar reflection conjugates the holonomy of the first loop to the inverse of that of the second, up to the choice of lift. The resulting isometry preserves absolute distance from the axes. The rotation \(S\) exchanges the chosen hemispheres. Thus the two Hopf chambers \(W_i\) are isometric when the conformal multiplier \(\operatorname{sech}r\) on the outer parts and its extension over the fills are chosen in matching pairs. It follows that their doubled classes have identical Yamabe constants. The separate single-relator closings give equal chiral costs on each band, and the exchange shows all four band integrals equal \(c\) and \(E_+(M)=E_-(M)=2c\). Both band Dirichlet spectra also coincide. If \(2c\le8\pi^2\), then **both** Hopf doubles must obey \(Y(DW_i)<-8\sqrt6\,\pi\). Indeed \(c\le4\pi^2\), the nonnegative Hopf sign is excluded in the preceding comparison, and its Gauss–Bonnet identity reads \(Y^2=96(8\pi^2-c)+12\int|\operatorname{Ric}_0|^2\), with strictly positive Ricci term. [07 single-relator closings](../../investigations-1/07_positive_subcritical_entry/notes/SINGLE_RELATOR_CLOSURES.md) · [Hopf sign exclusions and strict Ricci term](HOPF_NEUMANN_TEST_20261127.md#strict-exclusion-from-a-nonnegative-doubled-sign)

## Exactly one pair of traces in the original and three-cuff tests

Use the notation of the [master trace form](HOPF_NEUMANN_TEST_20261127.md#exact-forms-for-the-baseline-or-narrower-bands). Let \(T_*\) transport a function from either face of band 1 to the corresponding face of band 2 by the isometric exchange. If the common band Dirichlet eigenvalue is nonpositive, the extended Dirichlet test of 07 makes the closed sign strictly negative, including when that eigenvalue is zero. If it is positive, write \(B(\alpha,\beta)\) for the form of the first band and its attached cap at inner and outer traces. The closed sign of \(M\) for \(a=1\) and the sign of \(DV\) for \(a=0\) equal the sign of the infimum of
\[
2B(\alpha,\beta)+6\mathcal E_a(\beta,T_*\beta),
\qquad 2(\|\alpha\|_{L^2}^2+\|\beta\|_{L^2}^2)=1.
\]
The positive simple ground states of the closed assemblies are invariant under the exchange. Their traces therefore give the zero or negative direction on this subspace whenever the closed sign is zero or negative. If the closed sign is positive, the positive trace bound holds on the full space and hence on this subspace. The energy-minimizing extensions at invariant traces already commute with the exchange by uniqueness. In the three-cuff problem the same argument applies to the Neumann ground state on \(V\). In the individual Hopf tests use \(B+6\mathcal E_{H,1}\) once, since the two forms are conjugate.

The cap and funnel Fourier multipliers remain those for the literal face coordinates and physical face measures. For example, \(T_*\) maps the cap mode \(e^{im\theta}Y_{\ell k}(p)\) to \(e^{10\pi i m/7}e^{-im\theta}Y_{\ell k}(Dp)\). The latter spherical factor is in the same degree-\(\ell\) eigenspace. The compact pants term still couples the actual outer faces. The outer longitude squared length at \(w=0\) is \(3/4+|c_i'(t)/(2\pi)|_{q_L}^2\), strictly above \(3/4\) on each advancing letter and equal to \(3/4\) at each pause. The band metric therefore depends on \(\theta\), and the reduction retains tangential mode coupling in one band. [07 cap and exterior responses](../../investigations-1/07_positive_subcritical_entry/notes/DIRECT_CLOSED_SIGN.md#the-two-fixed-parts)

## Radial Rayleigh test without an exterior solve

For a smooth real profile \(\chi(s)\) on \([0,1/8]\), use it unchanged on both bands, extend by the constant \(\chi(0)\) on both scalar-flat caps, and set the unscaled exterior test to \(\chi(1/8)\) on the entire compact retained pants product. Across the three funnels continue this constant by the decaying normal harmonic mode. The matched tests are \(H^1\) on the compact assemblies. They give, for \(Q_g(f)=\int(6|df|^2+Rf^2)\,dV_g\),
\[
 Q_M(f)=2Q_{U_1}(\chi)+144L\,\chi(1/8)^2,
 \qquad Q_V(f)=2Q_{U_1}(\chi).
\]
The funnel contribution is \(6(2/\pi)\sum_{k=1}^3 4\pi L\), since each outward constant multiplier is \(2/\pi\) and the cuff area is \(4\pi L\). For each Hopf half choose any \(R\) enclosing the lifted tube between the two axial cuts at \(\pm R\), set the exterior test in the unscaled gauge to \(\chi(1/8)\) between those cuts and extend by the constant decaying mode on each cylindrical tail. If \(\ell_1\) is the holonomy translation length, put \(\tau_R=\arctan(\sinh R)\). Then the explicit trial satisfies
\[
 Q_{W_1}(f)=Q_{U_1}(\chi)
  +\frac{24\pi\ell_1}{\pi/2-\tau_R}\,\chi(1/8)^2.
\]
Each axial cut has unscaled area \(2\pi\ell_1\cosh R\), because the sphere factor is a hemisphere. Its constant response is \(\operatorname{sech}R/(\pi/2-\tau_R)\), and both cuts enter. The test in the scaled Hopf metric is the unscaled function divided by the chosen conformal multiplier. Seam conormals cancel in the covariance identity, and the outward conformal term at the hemisphere equator vanishes. Strict negativity of any right-hand side certifies the corresponding negative sign without assuming Dirichlet positivity. [Conformal covariance in dimension four, Lee–Parker, (2.7)](https://users.math.msu.edu/users/parker/YamabeProblem.pdf#page=7) · [Physical axial and funnel multipliers](HOPF_NEUMANN_TEST_20261127.md#exact-forms-for-the-baseline-or-narrower-bands)

For this radial test the lapse Laplacian makes zero integrated contribution on each closed slice. With the physical lapse \(N\), tangential metric \(h(s)\), second fundamental form \(K\) in the direction of increasing \(s\), trace \(k\), and measure \(dA_h\), set
\[
 A(s)=\int_{S^1\times S^2}N^{-1}\,dA_h,\qquad
 J(s)=\int_{S^1\times S^2}k\,dA_h,\qquad
 F(s)=\int_{S^1\times S^2}N(R_h+k^2-|K|^2)\,dA_h.
\]
The integrated band identity yields
\[
Q_{U_1}(\chi)=\int_0^{1/8}\big(6A(s)(\chi')^2+4J(s)\chi\chi'+F(s)\chi^2\big)\,ds
  +2J(0)\chi(0)^2-2J(1/8)\chi(1/8)^2.
\]
Indeed \(n\chi=\chi'/N\), and \(\int \Delta_hN\,dA_h=0\). The boundary terms use the actual physical mean curvatures. In particular \(J(0)=8\pi^2\cosh1\). To evaluate \(\int NR_h\,dA_h\) from first tangential derivatives of \(h,N\), take the connection difference with the fixed round-product slice connection and integrate its differentiated terms by parts over the closed slice. Hence the three radial upper tests can be evaluated with first metric derivatives inside the band and at its faces. Certification still requires their values for the actual harmonic pullback metric. A certified negative witness in this one-dimensional class would decide the corresponding sign. Positive values in the radial class leave the full form open. [Integrated Gauss identity for the physical band](../../investigations-1/07_positive_subcritical_entry/notes/DIRECT_CLOSED_SIGN.md#a-band-integral-at-the-prescribed-width)

## The cost of the inner cutoff in the density test

The [long-cuff harmonic enclosure](HARMONIC_MARKING_ENCLOSURE_20261127.md#consequences-for-the-fixed-width-quadratic-form) bounds \(\operatorname{tr}_{\rm flat}q_L<28\) and gives a pure switching integral greater than \(60\) per band for \(f=\chi J_{\rm vol}^{-1/3}\) with \(\chi=1\) from \(s=1/16\) through \(a=15/16\). Here \(J_{\rm vol}=dA_h/(d\theta\,dA_\sigma)\). If the test is extended by zero to the inner cap, then \(f(0)=0\). The entire \(0\le s\le1/16\) region is exactly the scalar-flat germ \(A\), where \(J_{\rm vol}=\sinh(1+s)\) and \(f\) is radial. Weighted Cauchy–Schwarz gives the exact optimal energy for these two collar traces:
\[
 Q_{[0,1/16]\times S^1\times S^2}(f)
 \ \ge\
 \frac{48\pi^2\,(\sinh(17/16))^{-2/3}}
      {\int_0^{1/16}\operatorname{csch}(1+s)\,ds} >4900.
\]
Equality in the first comparison holds in the collar with the radial harmonic interpolant, as an \(H^1\) function with prescribed endpoint values. The strict rational bound uses \(\pi^2>9\), \(\sinh 1>1\), and \(\sinh(17/16)<7/5\). The denominator is less than \(1/16\) and \((7/5)^{-2/3}>5/7\). The available lower estimate \(60\) for the pure switching contribution consequently falls short of the inner collar cost in the test with zero cap extension. This compares bounds on individual terms. The sign of the full Rayleigh quotient still requires the actual switching integral and the shear combination \(|a'P+S|^2\).

This inner expense vanishes if the test extends by its constant inner value to the cap and keeps \(f=(\sinh(17/16))^{-1/3}\) on the entire inner germ. It has the same trace and the same values on the changing layer, and it is \(H^1\) when matched across \(s=1/16\). An outer cutoff gives a global test by zero extension to the exterior. The slice scalar term, the shift term, the cross term in the shear and the outer cutoff cost still enter that test. To see the limitation of the zeroth-order enclosure, compose in the source by a compactly supported planar diffeomorphism \(z\mapsto z+n^{-3/2}\eta(z)\sin(n z_1)\,e_1\), equal to the identity near the cuffs and symmetrized on disjoint reflected patches. Its differential converges uniformly to the identity, and its second derivative on a patch where \(\eta=1\) is unbounded. The perturbed pullback metrics retain their constant curvature, cuff data, reflection, and strict zeroth-order enclosure for sufficiently large \(n\), yet their first derivatives become unbounded there. This example concerns the class obtained by dropping the harmonic marking equation. Controlling the first-order remainder for the fixed trial requires additional information about the actual marking.

## The last outer layer

For the fixed long-cuff geometry, the harmonic enclosure gives two generalized eigenvalues \(\lambda_1,\lambda_2<1/7\) for \(B_i|_{T(S^1\times S^2)}\) relative to \(A|_{T(S^1\times S^2)}\). This follows from its bound on the entire sphere tangent plane. It also gives \(\lambda_3>1/3\) by the longitude direction. The eigenvalues of \(h^{-1}\partial_a h\) are \((\lambda_j-1)/(1-a+a\lambda_j)\). In the region \(a\ge7/8\),
\[
\operatorname{tr}(h^{-1}\partial_a h)
 \le -\frac{2(6/7)}{1-6a/7}+\frac1a\le-\frac{40}{7}.
\]
The \(a''\) coefficient of the scalar curvature in the physical band is \(-\operatorname{tr}(h^{-1}\partial_a h)/N^2\), from the \(-2n(k)\) term in the contracted Gauss identity. The other differentiated-weight terms are \(O(|a'|+(a')^2)\). Freezing \(a\) as a constant gives a term \(O(1-a)\) since \(B_i\) is scalar-flat, using smooth positive matrices on the fixed compact band. For the given flat step, \(a''<0\) near \(s=1/8\), and \(1-a,|a'|,(a')^2=o(|a''|)\) there. The constants in the scalar expansion are uniform in the angles for the fixed marking. Thus **both entire outer layers** \(s_0<s<1/8\) have \(R<0\) for some \(s_0<1/8\). This strengthens the previous open-subset result. Its thickness depends on coefficient bounds and this gives no sign for the closed form. [07 outer-edge curvature calculation](../../investigations-1/07_positive_subcritical_entry/reviews/FUNNEL_READBACK.md) · [Long-cuff ratios and lapse](HARMONIC_MARKING_ENCLOSURE_20261127.md#consequences-for-the-fixed-width-quadratic-form)

A radial test \(\chi(s)\) that decreases from \(1\) at \(a=7/8\) to \(0\) at \(a=15/16\) incurs a large explicit gradient cost. On that interval \(N<1/2\) by the lapse bound and
\[
J_{\rm vol}\ge \sinh r\,(1-a)\sqrt{1-2a/3}>3/80
\]
by the eigenvalue product. Thus \(A(s)>27/5\). The identity \(a'=16H'\ge128a(1-a)\ge15/2\) bounds the interval in the coordinate \(s\) by \(1/120\). Cauchy–Schwarz gives \(6\int A(s)(\chi')^2ds>3888\) for that one contribution to the radial form. For an outer value of \(1\), the constant common-exterior trial instead costs at most \(144L<661\) on the two-band closed assembly. That switch removes the specified cutoff cost and leaves the scalar integral in the band to be estimated.

The available first-derivative bound for \(q_L\) does not supply a quantitative relative comparison to the scalar-flat \(B_i\) throughout the last outer region. At a framed pole and a longitude pause, the sphere tangent block is orthogonal to the longitude at both ends, and its eigenvalues are ratios of the form \(b=\delta^2r^2q_L(v,v)\) with the stated pointwise interval \(0<b<1/7\). With \(\alpha=1-a>0\), the relative inverse error in an eigenvector for such a ratio is
\[
\left|\frac{b}{\alpha+(1-\alpha)b}-1\right|
   =\frac{\alpha(1-b)}{\alpha+(1-\alpha)b}.
\]
It tends to \(1\) as \(b\downarrow0\) for each fixed \(\alpha>0\). These coefficient intervals allow order-one relative inverse error at every positive \(\alpha\). The exact scalar-flat cancellation at \(\alpha=0\) ensures the qualitative outer-layer result, while a numerical remainder estimate along this comparison needs an additional explicit lower bound. The length of the translated planar loops does give an exact mean lower estimate for the different longitude coefficient. [Harmonic marking and native coefficient bounds](HARMONIC_MARKING_ENCLOSURE_20261127.md)
