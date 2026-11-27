# SP4-CUT-TUBE-E40 — Transport in the complete marked geodesic tube

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance. [Frozen E40 request](../research-progress/handoffs/E40_REQUEST_R1.md), baseline bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0. The requested setting was gpt-6.2-sol/ultra. Actual model and effort are unavailable. The inputs are the [marked prism](../notes/MARKED_PRISM_17.md), [E28 marking replay](E28_PRISM_REPLAY.md), [E39 stabilizer](../notes/E39_PRISM_FILLINGS.md), [E26 curvature identities](../notes/E26_LENGTH_TEST.md) and [E36 radial cost](../notes/E36_OPTICAL_BEND.md). Calculations below concern smooth metrics and fibrewise jets on the actual order-seventeen punctured bundle.

The mean exterior Weyl budget fails at every base length for a stationary radially bent puncture transported along the full solid torus with a round shear annulus. In the annulus the longitudinal and angular profiles may depend arbitrarily and smoothly on radius and time. On a doubly warped replacement the electric and scalar costs change. The reflected-double positivity test below gives a quantitative restriction on a small longitudinal radius and its restoration to the round germ.

## Actual core, normal frame and equation for the path

Use the unit round group-action model and the great circle \(C=p_0e^{js}\) of the marked prism. In the following \(r\) is distance from \(C\) and \(s\) is its arclength parameter upstairs. The angle \(\theta\) is positive in the normal plane for the rotation \(w\mapsto e^{j\theta}w\). Thus in a thin tube we write
\[
q=p_0\big(\cos r\,e^{js}+\sin r\,e^{j\theta}i\big).
\]
The stabilizer of \(C\) in the deck group \(\Gamma=Q_8\times C_{17}\) is \(\{1,-1\}\), since it is the intersection of \(\Gamma\) with the order-twelve stabilizer \(\langle J\rangle\) in E39 and \(J^6=-1\). The lattice has generators \((\pi,\pi)\) and \((0,2\pi)\); its coordinate area is \(2\pi^2\). The core length in \(Y\) is \(\pi\) and the deck normal gluing angle is \(\pi\). The mapping isometry \(J\) shifts \((s,\theta)\) by \((-\pi/6,5\pi/6)\). The marked arc is longitudinal through \(+\pi/6\) in the \(J^{-1}\) endpoint convention. Along it a rigid torus rotation preserves the bent ball germ. Adding such an angular velocity changes the normal transport and keeps the section and the pair of cap framings.

For a round embedded closed tube of radius \(R\) about the projection of \(C\), the disjoint translates condition gives \(R\le\pi/34<1/10\). To see this, the right element \(z^8\) alone gives a distinct translate at distance \(\pi/17\) from \(C\): the angle between \(j\) and \(\operatorname{Ad}_{z^8}j\) is \(2\pi/17\), and a unit quaternion realizing this angle has distance \(\pi/17\) from the identity. Conjugating one prescribed axis to the other attains that distance. Midpoints of a shortest pair of points are common to the two radius-\(\pi/34\) tubes. This upper bound suffices and is weaker than the minimum over all deck translates.

Write the spatial torus metric as \(dr^2+F^2ds^2+G^2d\theta^2\), with \(F=\cos r,\ G=\sin r\) in the round case. In the annulus \(r_0\le r\le R\), use \(V=v(r,t)\partial_s+w(r,t)\partial_\theta\). Integrate \(V\) by translations of the two torus coordinates at fixed \(r\). Outside \(R\) it vanishes, and in the inner torus its longitudinal displacement is \(d=\pi/6\), so \(\int_0^1v(r_0,t)dt=d\). The specified constant speed has \(v(r_0,t)=d\) at all times. Keep the puncture bend stationary in the transported chart by taking the torus velocity rigid on its germ. A radial bend with round face radius \(\rho\le r_0\) fits in this germ. Rigid torus translations commute with \(J\), so the matched time jets may be chosen as through-running jets; the electric estimate needs no acceleration or resting-end constraint. Extra shear in a nonround puncture bend would change the static-plus-round estimate.

## Electric cost and chiral check

In the moving orthonormal coframe \((dr,F ds,G d\theta)\), pulled back by the time-dependent torus translations, let
\[
q_s=Fv_r/2,\qquad q_\theta=Gw_r/2,\qquad
\mathcal Q=F^2v_r^2+G^2w_r^2.
\]
The only nonzero components of \(K\) are \(K_{rs}=q_s,\ K_{r\theta}=q_\theta\) and their transposes. The trace is zero because the translations preserve the volume \(FG\,dr\,ds\,d\theta\). The fixed-coordinate time derivative of the pulled-back \(K\) pulls back from \(\partial_tK_{\rm mov}+\mathcal L_V K_{\rm mov}\). The first summand is off diagonal. In the coordinate coframe before pullback, \((\mathcal L_V K_{\rm mov})_{rr}=2K_{rs}^{\rm coord}v_r+2K_{r\theta}^{\rm coord}w_r=\mathcal Q\). The other components of this Lie derivative vanish. The E26 electric tensor \(U=(-\partial_tK+HK)^\circ\) therefore has diagonal
\[
\operatorname{diag}U=\frac{\mathcal Q}{3}(-2,1,1).
\]
In particular \(\frac14|U|^2\ge\mathcal Q^2/6\), with equality if the off-diagonal time derivatives vanish. The negative radial diagonal sign follows from the covariant time derivative in E26.

For completeness, put \(a=F'/F,\ b=G'/G\) and let \(\sigma=\epsilon_{rs\theta}\) in this frame. E26's convention is \(M_{ij}=-\operatorname{sym}_{ij}(\epsilon_j{}^{kl}\nabla_kK_{li})\). The only entries on and above the diagonal that can be nonzero are
\[
M_{rs}=\frac{\sigma}{2}\big(q_\theta'+(2b-a)q_\theta\big),
\qquad
M_{r\theta}=-\frac{\sigma}{2}\big(q_s'+(2a-b)q_s\big).
\]
For the standard orientation induced from \((1,i,j,k)\) and the positive left-\(j\) normal rotation above, \(\sigma=-1\): at \(s=\theta=0\) the frame in order \((q,e_r,e_s,e_\theta)\) orients as \((1,i,j,-k)\). In either orientation the signed integral \(\int\langle U,M\rangle\) is zero when the shear jets match in time and vanish at the annulus boundaries. Indeed its integrand divided by \(\sigma\) is
\[
-(q_s)_t(q_\theta'+(2b-a)q_\theta)
 +(q_\theta)_t(q_s'+(2a-b)q_s).
\]
Time integration by parts replaces the terms with radial derivatives by \(-\partial_r(q_\theta(q_s)_t)\); the remaining terms are \(-(a+b)q_\theta(q_s)_t\). Radial integration against \(FG\) cancels them since \((FG)'=(a+b)FG\). The trace-free intrinsic Ricci matrix is diagonal on a doubly warped tube, so its contraction with \(M\) is zero there. The bend is stationary and contributes neither magnetic term. Thus both integrated chiral energies agree in this class, also for the spatially changed tube.

## All base lengths for the round shear annulus

In a round shear annulus the intrinsic trace-free Ricci is zero. In the stationary bend the time-dependent tensors are zero, so the cross term in \(B\) vanishes and \(B\ge0\). Discard the angular term in \(\mathcal Q\). Hölder in \(r\) at each time and then in \(t\) gives
\[
\begin{aligned}
C&\ge\frac{\pi^2}{3}
 \int_0^1\int_{r_0}^R F^5 G\,|v_r|^4\,dr\,dt\\
 &\ge \frac{\pi^2 d^4}{3}
 \left[\int_{r_0}^R(\cos^5r\sin r)^{-1/3}\,dr\right]^{-3}.
\end{aligned}
\]
The factor \(\pi^2/3\) uses the actual coordinate area of the torus and \(1/6\) from the electric diagonal. With \(c=\cos R\), one has \(\sin r\ge c r\) and \(\cos r\ge c\). This implies
\[
C\ge \frac{8\pi^2}{81}d^4c^6R^{-2}.
\]
By E36, the stationary radial bend gives \(A\ge(8\pi/3)\cot\rho\). Its proof uses \(dv=ds_{\rm bend}/f^2\) for the bend radius \(f\) and \(\int q\,dv=V+\cot\rho\), where \(q=1+ff''-(f')^2\) and \(V=\int dv\). Applying Cauchy and minimizing over \(V\) gives the stated bound with no pointwise scalar sign. Using \(R<1/10\) and \(\rho\le r_0<R\) gives \(A>72\) and \(C>25/9\). For example \(c>9/10,\ c^6>1/2,\ d>1/2\) suffice. Consequently for every \(L>0\)
\[
e_X(L)\ge AL+C/L^3\ge \frac{4}{3^{3/4}}\,A^{3/4}C^{1/4}
 >32>\frac{8\pi^2}{3}.
\]
This compares with the exterior budget without assuming positivity of the double. The disjoint spatial support is essential to the estimate \(B\ge0\).

## Spatially changed tube and the actual double

For a smooth doubly warped variation, take \(F>0,\ G>0\) off the core with the polar core conditions \(F\) even and \(G\) odd with \(G'(0)=1\). Keep the round germs \(F=\cos r,\ G=\sin r\) at \(R\) and the same torus lattice. The electric estimate uses \(F^5G\) in the longitudinal weight. For instance, if \(F=\varepsilon\) on a fixed shear interval and \(w=0\) there, at fixed \(v\) the contribution of its electric diagonal to \(C\) is proportional to \(\varepsilon^5\) for fixed \(G\). The restoring region also contributes to the energy. In the changed region intrinsic Ricci and electric terms may have overlapping support, so the round argument for \(B\ge0\) no longer applies.

The spatial scalar and the scalar of \(g_L=L^2dt^2+h_t\) in the tube satisfy
\[
R_h=-2\left(F''/F+G''/G+F'G'/(FG)\right),
\qquad R_{g_L}=R_h-\frac{\mathcal Q}{2L^2}.
\]
As a first restriction, if \(G=\sin r\) throughout and the unpunctured spatial tube has \(R_h\ge0\), then \((\sin r\, F')'\le\sin r\, F\). With \(M_F=\max_{[0,R]}F\), integrating from the smooth core gives \(F'\le M_F\tan(r/2)\). Hence
\[
F(0)\ge(1+2\log\cos(R/2))\,M_F
       \ge(1+2\log\cos(R/2))\,\cos R .
\]
In fact the same lower bound holds for \(\min F\) by integrating from any point of minimum with \(F'=0\), or by taking a minimum at the boundary and using \(F(R)=\cos R\). Thus the whole longitudinal coefficient cannot be made arbitrarily small while retaining the round meridional profile and pointwise nonnegative spatial scalar curvature.

There is a necessary condition under the weaker positive Yamabe requirement on the actual doubled exterior. Choose a smooth radial cutoff \(\phi\) that vanishes on a tube large enough to contain the entire puncture bend, and equals one near \(R\). The function \(u=F^{-1/2}\phi\) is time independent in the pulled-back tube, is zero on the bend, and extends by the constant \(F(R)^{-1/2}\) over the round complement. Its reflection gives an \(H^1\) test on the smooth double and \(u\) descends in time. Direct integration of the spatial part of the dimension-four conformal numerator gives
\[
\int_0^R FG(6u'^2+R_hu^2)\,dr
=-2[G a\phi^2]_0^R+
\int_0^R\left[8G(\phi')^2-2G''\phi^2-\frac12G(a\phi+2\phi')^2\right]dr .
\]
For example, before completing the square the derivative terms are \(6G(\phi')^2-2Ga\phi\phi'-\tfrac12Ga^2\phi^2-2G''\phi^2\), after integrating \(-2(Ga)'\phi^2\) by parts. The volume of each torus coordinate cell is \(2\pi^2 FG\,dr\). Divide the reflected numerator by \(4\pi^2 L\). Positivity of the double requires the following strict inequality for every such nonzero test:
\[
\frac12\int_0^R G(a\phi+2\phi')^2\,dr
+\frac{1}{2L^2}\int_0^1\!\int_0^R G\phi^2\mathcal Q\,dr\,dt
<
\frac{6\operatorname{Vol}(Y\setminus T_R)}{2\pi^2 F(R)}
-2G(R)a(R)+\int_0^R(8G(\phi')^2-2G''\phi^2)\,dr .
\]
Here \(T_R\) is the whole solid torus in the original round quotient. The boundary term is fixed by the round end. The rest of the right side uses the actual round complement and the chosen \(G,\phi\). The left side simultaneously charges longitudinal restoration and temporal shear.

In particular, suppose \(\phi=1\) on \([r_a,R]\), with \(r_a\) outside the bent core, and denote the right side by \(D_\phi\). The test implies \(D_\phi>0\) and
\[
\left|\log\frac{F(R)}{F(r_a)}\right|^2
 < 2D_\phi \int_{r_a}^R\frac{dr}{G(r)}.
\]
For a fixed \(G=\sin r\) and fixed cutoff away from the core, this is a positive lower bound on \(F\) throughout that restoring interval, independently of \(L\) and without spatial scalar positivity. If \(G\) varies monotonically and still has the round outer germ, \(D_\phi\) is uniformly bounded for a fixed cutoff. Indeed \(-2\int G''\phi^2=-2G'(R)+4\int G'\phi\phi'\), and the integral of \(G'\) is fixed by the outer value. Thus an arbitrarily small \(F\) can evade this particular test only if a uniform bound for the reciprocal-meridional integral is lost, or if the test cutoff itself must degenerate. The derived condition applies to the whole reflected double. It does not supply a Yamabe-positive subcritical metric for a tube in which both warps change.
