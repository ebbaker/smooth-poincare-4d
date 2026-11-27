# SP4-CUT-TUBE-E04 — Cap, seam atlas and circle-action review

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance under the [frozen E04 request](../research-progress/handoffs/E04_REQUEST_R1.md). Requested helper setting gpt-6.2-sol/ultra. Actual model and effort are unavailable to this worker. Fixed repository inputs were read at `bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0`. The [parent manuscript](../../manuscript/cuts_of_subcritical_conformal_classes.tex) has SHA-256 beginning `ccb52d6a2548fb8f`. The [source receipt](../references/E04_SOURCES.md) gives inspection levels and records the primary-text access limits.

**Result.** The cap energy, a square-completion lower bound and its flux refinement, the seam atlas for connected sums of \(S^1\times S^2\), and the smooth action on the marked mapping-torus filling replay. Proposition 6.1 requires two amendments. Its core regularity conditions need polar regularity, and its positive-Yamabe conclusion needs a global conformal-Laplacian check. The trefoil collar admits no extension of its scalar-flat gauge with nonnegative scalar curvature over the exterior. The explicit E01 cap admits a conformal rescaling that joins the original round-product exterior and has positive scalar curvature throughout the glued metric away from the seam. Both trefoil framings give the standard sphere by the twist-spin-specific sources. The separate audit of Fintushel and Pao's original texts reached bibliographic metadata and Pao's abstract. The general standardness conclusion also follows from a checked published restatement by Galaz-García and Searle. Direct inspection of the original classification passages remains open.

## 1. Cap curvature and the normalization

Use the parent oriented Riemannian convention and \(T=4\pi^2\). Work away from the axes in the orthonormal coframe \(e^1=ds, e^2=a\,d\psi, e^3=d\vartheta, e^4=\sin\vartheta(d\phi+b\,d\psi)\). Put \(f=F\sin\vartheta, f_s=F'\sin\vartheta, c=\cot\vartheta\), \(K=-a''/a\), and \(w=a'/a\). With \(de^i+\omega_{ij}\wedge e^j=0\), the nonzero connection forms for \(i<j\) are
\[
\omega_{12}=-w e^2-\tfrac f2e^4,\quad
\omega_{14}=-\tfrac f2e^2,\quad
\omega_{24}=\tfrac f2e^1,\quad
\omega_{34}=-c e^4.
\]
The curvature operator in the ordered basis \((12,13,14,23,24,34)\) has diagonal \((K-3f^2/4,0,f^2/4,0,f^2/4,1)\). Its distinct nonzero entries above the diagonal are
\[
(12,14)=-f_s/2,\quad (12,34)=-fc,\quad
(13,24)=-fc/2,\quad (14,23)=fc/2.
\]
The Ricci diagonal is \((K-f^2/2,K-f^2/2,1,1+f^2/2)\) with off-diagonal entry \(\mathrm{Ric}_{24}=-f_s/2\). Thus \(R=2(K+1)-f^2/2\). Subtracting the trace terms gives
\[
|W|^2_{\mathrm{HS}}
=\tfrac13(K+1)^2-\tfrac23(K+1)f^2+\tfrac13 f^4
 +\tfrac14 f_s^2+3f^2c^2.
\]
The endomorphism norm on two-forms is one quarter of the squared four-index norm. Since \(dV=a\sin\vartheta\,ds\,d\psi\,d\vartheta\,d\phi\), the mean of the chiral energies is \(2\pi^2\int a |W|^2_{\mathrm{HS}}\sin\vartheta\,d\vartheta\,ds\). Integration in \(\vartheta\) gives
\[
\frac{e_{\rm cap}}{\pi^2}
 =\int_0^S a\left[\tfrac43(K+1)^2+\tfrac49(5-4K)F^2+\tfrac{32}{45}F^4+\tfrac23 F'^2\right]ds
 =\int_0^S a\left[\tfrac43(K+1-\tfrac23F^2)^2+4F^2+\tfrac{16}{135}F^4+\tfrac23 F'^2\right]ds.
\]
This is an independent differential-form derivation of (6.3). The original `check_01` and its archived output agree. Its Gauss–Bonnet and quadrature tests on closed bundles are floating diagnostics. The original `check_02` output records optimizations with finite constraint and quadrature errors. The one trefoil interval enclosure cited below uses a different explicit competitor.

## 2. Matching and regularity

On a polar collar of \(0<\theta<\operatorname{inj}(p)\), the exterior metric in its original gauge is \(dt^2+dr^2+\sin^2r\,g_{S^2}\) on the covering chart. In the mapping-torus convention in the parent, let \(\chi\) be the polar angle upstairs and set \(\phi=\chi+\beta\psi, \psi=2\pi t/\ell, \beta=\alpha/(2\pi)+n\). This descends because \((t+\ell,\chi)\sim(t,\chi+\alpha)\). Division by \(\sin^2r\) on the collar gives (6.1) with \(ds=dr/\sin r\), positive \(s\) directed from the cap into the exterior. There \(a_{\rm ext}=\ell/(2\pi\sin r)\) and \(a_{\rm ext}'=-\ell\cot r/(2\pi)\). In these fixed coordinates (6.2) matches values and first derivatives precisely when
\[
a(S)=a_{\rm ext}(\theta),qquad a'(S)=a'_{\rm ext}(\theta),qquad
b(S)=-\beta,qquad F(S)=0 .
\]
For \(b(0)=0\) the signed flux is \(\int aF=-\beta\). Reversing the chosen axial orientation reverses both signs and allows the absolute-value formulation. With the profiles \(C^{1,1}\) up to the seam on each side this is a \(C^{1,1}\) match.

At the collapsed disc coordinate, \(a(s)=s(1+s^2 A(s^2))\) and \(b(s)=s^2 B(s^2)\) with smooth \(A,B\) suffice for smoothness in Cartesian disc coordinates. Bounded \(F\) and \(a(0)=0, a'(0)=1, b(0)=0\) alone are insufficient for \(C^1\). For example, \(a=s+s^2\) and \(b=0\) give \(g_{yy}=1+2|x|+x^2\) on the \(x\)-axis of the disc. The needed regularity is verified by the polynomial E01 profile.

The exterior is conformally flat in the original smooth gauge and in every smooth positive rescaling. Consequently the mean energy of the \(C^{1,1}\) joining metric is \(e_{\rm cap}\). On a homotopy four-sphere the two total chiral energies equal this mean by signature, with the \(C^{1,1}\) identity obtained by smooth approximation. The spherical collar is umbilic exactly at \(\theta=\pi/2\) since its second fundamental form in the divided gauge has principal curvatures \((-\cos\theta,0,0)\) for the normal from the cap into the exterior. The cap's identity double there is topologically \(S^2\times S^2\). For \(a(s)=\sin s, F=0, S=\pi/2\) and \(\ell=2\pi\) its energy is \(16\pi^2/3=4T/3\), the hemisphere value.

## 3. Square completion, equality and flux

Let \(D=1-a'(S)\), \(A_0=\int_0^S a>0\) and \(J=\int_0^S aF^2\). Integrating \(-a''\) gives \(\int aK=D\). The exact identity is
\[
\frac{e_{\rm cap}}{\pi^2}
=\frac{16D}{3}+\int_0^S a\left[
\tfrac43(K-1-\tfrac23F^2)^2+\tfrac49F^2+
\tfrac{16}{135}F^4+\tfrac23 F'^2\right]ds .
\]
Thus \(e_{\rm cap}\ge\tfrac43T D\), valid even when \(D\le0\), with a trivial bound there. Equality requires \(F=0, K=1\) on the open cap and forces \(a=\sin s, 0<S<\pi\). With prescribed boundary data, equality is possible exactly when \(\beta=0\) and \(a(S)^2+a'(S)^2=1\) with \(a(S)>0\). Neither positivity of a double nor scalar curvature enters the identity. For \(F=0, \theta=\pi/2\) the equality requires \(\ell=2\pi\).

The flux and Jensen or Cauchy–Schwarz give \(J\ge\beta^2/A_0\) and \(\int aF^4\ge J^2/A_0\). Applying Cauchy–Schwarz also to the square gives
\[
\frac{e_{\rm cap}}{\pi^2}\ge
\frac{16D}{3}
+\frac4{3A_0}\big(D-A_0-\tfrac23J\big)^2+\frac49J
+\frac{16}{135A_0}J^2.
\]
Dropping the square yields an additive refinement \(4\beta^2/(9A_0)+16\beta^4/(135A_0^3)\) above the original bound. Re-expanding the right side yields a sum of \(4A_0/3+8D/3\) and nonnegative terms \(20J/9+4(D-2J/3)^2/(3A_0)+16J^2/(135A_0)\). A strict subcritical cap thus has \(A_0<6-2D\) and \(D<3/2\). In that band the additive refinement remains valid with \(6-2D\) substituted for \(A_0\). The bound distinguishes different absolute fluxes as necessary energy costs. The fixed-end minima would require a separate comparison. The sign flip \(F\mapsto-F\) preserves the entire functional, so the two half-turn lifts \(\beta=\pm 1/2\) have equal infima in the signed ansatz.

For the spherical collar \(D=1+\ell\cot\theta/(2\pi)\). The strict band implies \(\cot\theta<\pi/\ell\). For \(0<\theta<\pi/2\) this is \(\tan\theta>\ell/\pi\). At the equator the cotangent version is finite and automatic. For \(\pi/2<\theta<\operatorname{inj}(p)\) the cotangent is negative and the condition is likewise automatic. For the flat product model divided by \(r^2\), \(ds=dr/r, a'= -\ell/(2\pi r)\) and \(r/\ell>1/\pi\) is necessary. This bound excludes the trial ratio \(0.3\). The ratio \(1.0\) remains above the band only as a floating trial result.

## 4. Global Yamabe sign and the exact trefoil repair

On the collar the divided exterior is locally a product of surfaces of Gaussian curvatures \(-1\) and \(+1\), so \(R=0\). The distance to \(p\) continues only as a Lipschitz function at the cut locus in general. A smooth positive extension \(u\) of \(\csc r\) to the exterior produces a conformally flat exterior but requires a separate scalar-curvature check.

There is a stronger obstruction in the trefoil row. Write \(g_0=dt^2+h_{\rm round}\) on \(X\), \(\widehat g=u^2g_0\), and \(Q_g(f)=\int_X(6|\nabla f|_g^2+R_gf^2)\,dV_g\). Conformal covariance and integration by parts on a manifold with boundary give
\[
Q_{\widehat g}(f)=Q_{g_0}(uf)-6\int_{\partial X}
 u\,\partial_{\nu_0}u\, f^2\,d\sigma_0 ,
\]
where \(\nu_0=-\partial_r\) is the exterior outward normal. For \(f=\csc\theta/u\), using \(R_{g_0}=6\), this becomes
\[
Q_{\widehat g}(f)=6\ell\csc^2\theta
\left(\operatorname{Vol}(S^3/\Gamma\setminus B_\theta)-4\pi\sin\theta\cos\theta\right).
\]
For \(|\Gamma|=3, \theta=8\pi/25\), the volume in parentheses is \(2\pi^2/3-2\pi(\theta-\sin\theta\cos\theta)\) before subtracting the boundary term. The sign is negative because \(\pi/3-\theta=\pi/75<1/4<\sin\theta\cos\theta\). Therefore no such \(u\) can give \(R_{\widehat g}\ge0\) throughout this exterior. This is a statement about the fixed collar jet. The closed cap-plus-exterior conformal Laplacian includes the cap contribution.

A sufficient closed sign test is to exhibit a smooth positive cap factor \(v\) with \(L_gv=(-6\Delta_g+R_g)v\ge0\) and logarithmic outward derivative at least \(\cos\theta\) along the boundary. The ground-state identity bounds \(Q_{\rm cap}\) below by \(6\int_{\partial X}f^2\partial_s\log v\,d\sigma_{\widehat g}\). The exterior boundary contribution is \(-6\cos\theta\int_{\partial X} f^2\,d\sigma_{\widehat g}\) in the joined boundary gauge, so the terms cancel or leave a nonnegative remainder. The strictly positive exterior form and interior gradient term imply positivity of the first eigenvalue of the closed form by compactness. Here the convention is \(\Delta=\mathrm{div}\,\nabla\).

There is a direct positive-curvature construction for the explicit E01 profile. With \(s\in[0,2]\), \(x=s^2/4\), \(a=sP(x)\), and
\[
v(x)=\sin\theta+\sin\theta\cos\theta(x-1)+\tfrac3{50}(x-1)^2,
\]
it satisfies \(v(S)=\sin\theta\) and \(\partial_s v(S)=\sin\theta\cos\theta\). These are the value and first derivative of \(\sin r\) in the matching \(s\) coordinate. Thus \(v^2g_{\rm cap}\) and the original product \(g_0\) match in \(C^{1,1}\), and no extension of \(\csc r\) is needed for this construction. For any cap radial factor \(v(x)\), \(\Delta_gv=x v_{xx}+(1+xP'/P)v_x\). Substitution verifies the Laplace formula used in [E01's rational enclosure](../numerics/trefoil_certificate.py). The companion candidate \(z(x)=1+3x/4+3x^2/20\) has logarithmic derivative \(21/38>\cos(8\pi/25)\) at \(S\). Substituting \(z\) and \(z_x\) in the same 2048-cell rational loop also gives \(z\ge1\) and \(L_gz\ge7881/10000\). This independently checks the Robin sign for the same cap. E01's direct factor matches the exterior's first jet.

I reran the E01 certificate. It returned \(R_{\rm cap}\ge819/625\), \(v\ge2259/5000\), \(L_gv\ge3951/10000\) and \(e_{\rm cap}/\pi^2\in[38411/5000,19281/2500]\). These are rational interval results for this particular profile. The rescaled cap scalar curvature is \(v^{-3}L_gv>0\) and the exterior scalar curvature is \(6\). Smooth approximation can be supported in a shrinking collar, with \(C^1\) convergence and second derivatives uniformly bounded. For the positivity of the resulting class it suffices that the quadratic forms converge, since the scalar curvatures converge in \(L^2\) and the \(H^1\to L^4\) Sobolev bound is uniform. The same approximation gives convergence of the chiral energies and permits retaining the strict band. E01 also describes preservation of a positive pointwise lower bound by mollifying the collar coefficients. The frozen optimizer's numerical energy \(7.6271\pi^2\) is a different, floating competitor. [E01 note](../notes/E01_CAP.md).

## 5. Seam atlas and the scope of its one-tube use

For a connected oriented separating cut \(\Sigma\) in a homotopy four-sphere, the rational Mayer–Vietoris map \(H_i(\Sigma)\to H_i(V)\oplus H_i(V')\) is an isomorphism for \(i=1,2\). The fundamental class boundary map \(H_4(M)\to H_3(\Sigma)\) is an isomorphism, so \(b_3(V)=b_3(V')=0\). In the long exact sequence of \((V,\Sigma)\), the kernel in degree two is the image of \(H_3(V,\Sigma)\simeq H^1(V)\). The preceding map \(H_3(V)\to H_3(V,\Sigma)\) vanishes. For \(\Sigma=\#_k S^1\times S^2\) and \(a=b_1(V)\), these facts give \(b_2(V)=k-a\) and \(\chi(V)=1+k-2a\). The double has \(b_1(\mathcal D V)=a\) because the boundary \(H_1\) map to each copy is onto, and \(b_2(\mathcal D V)=2(k-a)\) by Euler characteristic and duality. The reflection forces signature zero, so \(b_2^+=b_2/2\), and exchanges the chiral energies, giving \(E_\pm(\mathcal D V)=2e_V\).

For the two Gursky bounds, Fu's reproductions in Theorems A and C give the parent's constants after division of the four-index norms by four. The \(b_1>0\) bound on the double becomes \(e_V\ge T\chi(V)\), and the \(b_2^+>0\) bound becomes \(e_V\ge(2/3)T\chi(V)\). At an umbilic boundary choose a representative making it totally geodesic, then reflect it to a \(C^{1,1}\) double. Its positive Yamabe type can be interpreted as a strictly positive first eigenvalue of the weak conformal-Laplacian form. Smooth seam approximations with a uniform second-derivative bound converge to the doubled curvatures in \(L^p\) for finite \(p\). In particular, \(L^2\) convergence of the scalar curvature and the \(H^1\to L^4\) estimate preserve the sign of a strictly positive form. This supplies the positive smooth approximants used in Section 5, with energy convergence. The general Yamabe-square bound can likewise be passed from smooth approximants because the coefficients of the form converge in these norms and the volume densities converge uniformly. [Source receipt](../references/E04_SOURCES.md#gursky-and-the-doubling-inequality).

For \(0<a<k\), the two \(b_1\) inequalities sum to \(e\ge2T\). For \(a=0\) or \(a=k\), with \(k>0\), the side with \(b_2=k\) costs at least \((2/3)T(1+k)\). This proves the stated atlas for the specified cuts. For any connected seam with positive doubles and \(e<2T\), a side with \(\chi\ge3\) has \(b_2>0\), hence costs at least \(2T\). Thus the Euler pairs in the manuscript follow. When both Euler characteristics are one, at least one side has \(b_1=0\), since the two \(b_1\) bounds otherwise contradict the band. That side is a rational homology ball.

The inference in Section 6 needs two scope statements. The atlas tests the family \(\#_k S^1\times S^2\). Positive doubles for an arbitrary seam leave other boundary topologies to separate arguments. For \(k=1\) the atlas identifies the rational homology and energy of the two sides. Identifying the \(b_2=1\) side with \(S^2\times D^2\) requires an independent geometric or handle hypothesis. A split zero-framed unknot provides such a handle description. For the trefoil row \(\theta\ne\pi/2\), the seam is nonumbilic, so its entry example uses the cap construction and the global scalar argument, independent of the atlas.

## 6. Smooth action and topology

For this construction assume an orientation-preserving isometry \(\varphi\) of the connected oriented space form with finite exact order \(\tau\), fixing \(p\). An isometry fixing a point and acting trivially on its tangent space is the identity by the exponential map and continuation. Hence \(D\varphi_p\) has exact order \(\tau\) and the integers \(\tau\) and \(k=\tau\beta\) are coprime. Translation in \(t\) has period \(\tau\ell\) with effective normalized action. Its collar expression is \((\psi,\phi)\mapsto(\psi+\tau\lambda,\phi+k\lambda)\) for \(\lambda\in\mathbb R/2\pi\mathbb Z\). In Cartesian cap-disc coordinates it extends as weight-\(\tau\) disc rotation and weight-\(k\) sphere rotation. These are smooth actions independent of metric regularization. The axial orientation fixes the sign of \(k\). For \(|k|>1\) the generic core stabilizer has order \(|k|\). Changing \(n\) by one composes the boundary marking with a single full rotation, the Gluck map. A change by two is null-homotopic in \(SO(3)\) and extends over the disc, so the marked framings are specified by parity. Fukuda's \(K^{m,n}\) convention has \(n>0\) and uses \(n\) for the stabilizer order on the core. The parent's pairs \((\tau,1)\) and \((\tau,1-\tau)\) are action weights. An identification with an oriented Fukuda label requires its orientation convention. Fukuda describes the Gluck replacement as \(K^{m,n}\mapsto K^{\epsilon' m,\epsilon'(m+n)}\) for the image of the twisted core with the conventions of the proof of Corollary 3.3 and Remark 3.4. [Topology sources](../references/E04_SOURCES.md#primary-topology-passages).

For the trefoil put \(\omega=e^{2\pi i/3}\) and take the free \(\mathbb Z_3\) action \(\gamma(u,v)=(\omega u,\omega^{-1}v)\) on the unit \(S^3\subset\mathbb C^2\). The swap \((u,v)\mapsto(v,u)\) normalizes this action and induces an orientation-preserving involution on the quotient. To identify it as a branched deck transformation, the invariant map \((u,v)\mapsto(X,Z)=(u^3+v^3,uv)\) realizes the quotient by the group generated by the swap and \(\gamma\). Indeed, \(u^3,v^3\) are the unordered roots of \(Y^2-XY+Z^3=0\), and the compatible choices of cubic roots are exactly the group orbit. The discriminant is \(X^2=4Z^3\), and the involution acts as a sign on a complex normal coordinate away from the origin. Radial scaling of \((u,v)\) commutes with the action and sends \((X,Z)\) to \((t^3X,t^2Z)\). The inverse image of the unit sphere in \((X,Z)\) has a unique transverse intersection with every ray in \((u,v)\), giving an equivariant identification with the round \(S^3\). On the unit sphere in \((X,Z)\) the branch curve has constant magnitudes and phase relation \(2\arg X=3\arg Z\), the trefoil. Thus the marked quotient is its cyclic double branched cover, up to orientation choices.

Choose the image of \(p=(1,1)/\sqrt2\). Every point of the round sphere is displaced by \(2\pi/3\) under either nonidentity power of \(\gamma\), giving \(\operatorname{inj}(p)=\pi/3\) in the quotient. The involution derivative fixes the tangent to the diagonal circle and negates its two orthogonal directions, so \(\alpha=\pi\). The values \(\theta=8\pi/25<\pi/3\), \(\ell=16/5\) and \(|\beta|=1/2\) match E01. By Zeeman's main theorem, the punctured mapping torus at a branch point is the exterior of the corresponding two-twist spin. The geodesic invariant ball and the branched local ball are equivalent as smooth rotation balls via local equivariant collars. The exterior group is \(\mathbb Z_3\rtimes_{-1}\mathbb Z\), since puncturing a three-manifold preserves its fundamental group and the involution conjugates \(\gamma\) to \(\gamma^{-1}\). This group proves the core is knotted. Either filling kills the base generator and hence kills the entire group, with Euler characteristic two. Zeeman gives the smooth standard sphere for the twist-spin framing. Gordon's Theorem 3.1 and its smooth-category remark give the standard sphere for its Gluck framing. No smooth inference from the topological Poincaré conjecture in dimension four is needed. [Topology sources](../references/E04_SOURCES.md#primary-topology-passages).

The general circle-action conclusion of Proposition 6.2(2) uses the classification of effective locally smooth actions on a homotopy four-sphere by its orbit data, and Pao's recognition of the smooth total space once the orbit space is \(S^3\) or \(D^3\). A smooth action meets the local linearization assumption. The hypothesized homotopy sphere supplies closedness and simple connectedness. Three-dimensional Poincaré and the ball version after capping a spherical boundary are the inputs for the orbit space. Galaz-García and Searle's published Theorem 3.2 gives an accessible route. A closed simply connected smooth four-manifold with a smooth circle action is diffeomorphic to a connected sum of \(S^4\), signed \(\mathbb{CP}^2\), and \(S^2\times S^2\). In the homotopy-sphere case \(b_2=0\), so the sum has only \(S^4\) factors. This is a checked restatement and application of the historical classification. The source receipt records the original Fintushel and Pao access limits separately. [Topology sources](../references/E04_SOURCES.md#primary-topology-passages).

The master's Fuchsian one-tube comparison proves standardness for the comparison surgery in the cyclic Hopf manifold. Its original ambient Fuchsian manifold has free fundamental group of rank \(n\ge2\), and one circle surgery kills at most one generator of its abelianization. For simultaneous surgeries, a global circle action requires equivariance of the full exterior and all attaching maps for the *same* action. The presence of a hemisphere for one lifted tube gives the master's energy comparison, with separate hypotheses for the smooth-action statement. [Master's reflective seams and tube section](../../../../master/manuscript/claude/umbilic_doubling.tex).

## Disposition

Use the exact bound and its equality and domain statements in the cap analysis. Use the explicit E01 Yamabe and topology arguments for the certified knotted example. Amend the parent statements about global scalar flatness, cap regularity, the atlas's topology hypotheses and the status of the floating table by lead handoff. The general recognition claim has a checked published restatement. Direct inspection of the original Fintushel and Pao passages remains open. This packet yields no exclusion for a general exterior or for a filling without the global circle action.
