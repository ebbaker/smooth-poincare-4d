# The actual marked prism fiber and the cost of moving its puncture

27 November 2026, for Edward B. Baker III, OpenAI-assisted lead. Actual lead model/effort unavailable. Baseline bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0. This is a smooth Riemannian four-dimensional construction on a specified punctured mapping torus. The initial unit round metric is three-dimensional. The exterior energies use the mean of the squared Hilbert–Schmidt Weyl blocks. The analytic inputs are the [finite-length formula](E26_LENGTH_TEST.md), its [replay](../reviews/E27_LENGTH_REPLAY.md), and the [positive radial bending construction](E05_TWISTED_EXTERIORS.md). Independent readings cover [marking](../reviews/E28_PRISM_REPLAY.md), [magnetic cost](../reviews/E29_MOVING_PUNCTURE.md), and [electric cost](../reviews/E31_ELECTRIC_CAPACITY.md).

## A meridian in the actual double-action space form

Let \(Y=\Gamma\backslash S^3\) with \(\Gamma=Q_8\times C_{17}\) acting on unit quaternions by \(q\mapsto u q z^{-1}\), \(u\in Q_8\), \(z\in\langle e^{2\pi i/17}\rangle\). The factors have coprime orders, and a fixed point would make the two elements conjugate. Thus the action is free. Put \(b=(1+i+j+k)/2\). The isometry \(J(q)=b q j^{-1}\) cycles the three quaternionic axes and inverts \(C_{17}\). For every lift of the quotient isometry the left factor \(ub\) has real part \(1/2\) or \(-1/2\), and \(zj\) has real part zero. On the round unit sphere the minimal displacement of \(q\mapsto b_1 q b_2^{-1}\) is the absolute difference of the two quaternion angles in \([0,\pi]\): conjugate one imaginary axis to the other to attain the maximum real part of \(q^{-1}b_1 q b_2^{-1}\). Thus the quotient displacement has sharp minimum \(d=\pi/6\). Choose \(p\) with \(p j p^{-1}=(i+j+k)/\sqrt3\); then \(Jp=p\exp(-j\pi/6)\) upstairs. The shortest arc for the indicated lift gives the actual correction. At every center the injectivity radius is at most \(\pi/17\) by the right cyclic action. The central-left deck pair \((-1,e^{16\pi i/17})\) improves that upper bound to \(\pi/34\), since its displacement is \(\pi/17\) at every point. We retain the weaker upper bound in the energy comparisons below. Globally the injectivity radius is at least \(\pi/68\) since the smallest nonzero possible difference of a left deck angle \(0,\pi/2,\pi\) and a right deck angle is \(\pi/34\).

Move a punctured round ball along that great-circle arc by a smooth time-dependent localized vector field. On the small moving ball take the infinitesimal transvection, that is, the ordinary round rotation in the geodesic's real two-plane. Choose its extension to vanish outside an embedded concentric ball. Its flow \(\Psi_t\) is isotopic to the identity on the closed quotient, takes the actual small ball to the terminal ball at \(Jp\), and agrees there with the prescribed local isometry. The map \(\Psi_1^{-1}J\) of the punctured fiber has a lift fixing \(p\). Its based deck automorphism is precisely the cycle and inversion, because the canonical lift of the flow commutes with deck transformations. Van Kampen kills the stable letter when filling by \(S^2\times D^2\). It then imposes \(i=j=k=ij\) and \(z=z^{-1}\), killing both factors. Both smooth framings are simply connected with Euler characteristic two, hence homotopy spheres by duality, Hurewicz and Whitehead. This proves neither framing standard. The previous [type-II source audit](E05_TWISTED_EXTERIORS.md) treats the distinction between unpointed and punctured periodicity. A targeted search found no recognition of both of these precise order-seventeen framed surgeries. Teragaito's enumerated examples and the 2026 order-seven preprint do not imply it. [Teragaito, Theorem 1.1 and introduction](https://da.lib.kobe-u.ac.jp/da/kernel/D1000984/D1000984.pdf) · [Jabłonowski, arXiv:2609.29839](https://arxiv.org/abs/2609.29839).

## The path and its three coefficients

Over \(0\le t\le1\), let \(v(t)\) be arc speed with \(\int v=d\). It may be chosen zero near the endpoints. Around the moving center transport the same smooth radial three-dimensional bend of positive scalar curvature, with a totally geodesic smoothly doubling inner face. The outer part of the bend is exactly unit round. Write \(r_0<R\) for geodesic radii in the original unit round chart. The flow equals the transvection for \(r\le r_0\); the transition is in the embedded round shell \(r_0<r<R\). Let \(\widetilde h_t\) be the resulting punctured metric about the moving center and \(h_t=\Psi_t^*\widetilde h_t\). The inner bent region is stationary on the reference fiber. Outside it the path consists of pullbacks of round metrics; therefore \(\operatorname{Ric}_{h_t}^{\circ}\) and the time-dependent tensors have disjoint supports up to their common smooth boundary. Rotational invariance gives \(\widetilde h_1=J_*\widetilde h_0\), hence \(h_1=(J^{-1}\Psi_1)^*h_0\), the inverse convention to the displayed based map. Reversing the base exchanges the conventions and preserves the two fillings and mean energy. The seam reflects smoothly, and sufficiently large \(L\) gives positive scalar curvature on the double.

For \(g_L=L^2dt^2+h_t\), [E26](E26_LENGTH_TEST.md) gives exactly
\[
 e_X(L)=A L+B/L+C/L^3,\qquad A=\tfrac14\int|\operatorname{Ric}_{h_t}^{\circ}|^2,\quad
 B=\int|M|^2,\quad C=\tfrac14\int|(-\partial_t K+HK)^\circ|^2 .
\]
Here \(K=\tfrac12\partial_t h_t,\ H=\operatorname{tr}K,\ M=\pm\operatorname{sym}\operatorname{curl}K\), and all integrals are on the single exterior with measure \(dt\,dV_{h_t}\). In particular \(B\ge0\) because of the support property. Positivity at long length is a theorem about the sign. The energy inequalities below apply even at lengths where the sign has not been tested.

Write the radial three-metric as \(ds^2+f(s)^2g_{S^2}\). Before the round outer face pick the last point \(s_*\) with \(f'=0\), and set \(a=f(s_*)>0\). This point exists since the inner face is totally geodesic and \(f'=\cos r_0>0\) at the outer face. On the last increasing segment, \([f(1-f'^2)]'=f'f^2 R_h/2\ge0\); in particular \(f'\le1\) there and \(a\le\sin^3 r_0\). The static coefficient on this segment is \((2\pi/3)\int [f''+(1-f'^2)/f]^2ds\). The derivative of \((1-f'^2)/f^2\) equals \(-2 f'[f''+(1-f'^2)/f]/f^2\). Its endpoint values are \(1/a^2\) and one. Since \(\int f'^2/f^4\,ds\le 1/(3a^3)\), Cauchy gives
\[
 A\ \ge\ \frac{\pi}{2a}(1-a^2)^2 .
\]
This estimate requires neither a minimum length of cylindrical collar nor monotonicity on earlier parts of the bend.

## Magnetic obstruction for a localized multiple of the transvection

Let the extension be \(v\chi(r) Z\), with \(Z\) the instantaneous unit transvection and \(\chi\) any smooth scalar cutoff equal to one on the inner ball and zero outside the shell. In centered polar coordinates \(Z^\flat=P\,dr+\sin r\cos r\,dP\) with \(P\) a unit linear spherical harmonic. On round three-space symmetrizing the curl of \(\operatorname{sym}\nabla V\) gives one half the symmetric gradient of \(\operatorname{curl}V\); the constant-curvature commutators are antisymmetric. The vector curl of \(\chi Z\) is, up to orientation, \(w\) times the axial rotation, where \(w=\chi'\cot r-2\chi\). The rotation has norm \(\sin r\sqrt{1-P^2}\). Its Killing equation and \(\int_{S^2}(1-P^2)=8\pi/3\) give
\[
 B=\frac{\pi}{3}\int v^2dt\int_{r_0}^R (w')^2\sin^4r\,dr .
\]
Integration of \((\chi\cos^2r)'=w\sin r\cos r\) with \(w(R)=0\) gives \(2\cos^2r_0=\int_{r_0}^R w'(\sin^2r-\sin^2r_0)\,dr\). By Cauchy, \(B\ge4\pi d^2\cos^4r_0/[3(R-r_0)]\). Since \(a\le\sin r_0,\ a(R-r_0)\le R^2/4\), combining the static and magnetic bounds yields
\[
 e_X(L)\ge2\sqrt{AB}\ge 4\pi\sqrt{2/3}\,\frac{d}{R}\cos^4R
 \ \ge\ \frac{34\pi}{3}\sqrt{2/3}\,\cos^4(\pi/17)>\frac{8\pi^2}{3}.
\]
The last strict comparison follows from \(\pi<22/7,\ \sqrt{2/3}>4/5,\ \cos^4(\pi/17)>93/100\). It covers every allowed embedded shell, bend, cutoff and positive base length in this localized-transvection ansatz.

## Gradient flexibility and the cost of starting the motion

The same inner isometry admits a different extension,
\[
 V^\flat=d(\chi\sin r\cos r\,P)+2\widehat\chi \sin^2r\,P\,dr .
\]
The cutoffs preserve the prescribed inner and outer germs. Now \(w=-2\widehat\chi\). On \([\rho,2\rho]\) the magnetic integral can be of order \(\rho^3\int v^2\), a different power from the preceding \(1/\rho\) lower bound. The [gradient calculation](E30_GRADIENT_PUNCTURE.md) gives its infimum. Thus the magnetic estimate alone cannot be transferred to arbitrary angular velocities.

For a fixed smooth extension \(V\) transported along the great-circle segment by its local transvections, put \(k=\operatorname{sym}\nabla V\) on the shell. Assume here that the **speed vanishes at both ends**. In the co-moving chart \(K\) is the pullback of \(vk\), and \((-\partial_tK+HK)^\circ\) pulls back from \(-v'k^\circ+v^2 U_0\) for one fixed spatial tensor \(U_0\). For example \(U_0=(-\mathcal L_{V-Z} k+(\operatorname{tr} k)k)^\circ\) in the round shell. The mixed integral vanishes because \(\int v'v^2dt=0\). Cauchy applied to \(v'\) against \(1/2-t\) gives \(\int(v')^2dt\ge12d^2\). Consequently \(C\ge 3d^2\int|k^\circ|^2\).

Use stereographic Euclidean radius \(x=2\tan(r/2)\), \(g=\Omega^2\delta,\ \Omega=(1+x^2/4)^{-1}\). For the unit displacement vector \(p_0\), \(n=x_{\rm vec}/x\), the Euclidean tracefree solenoidal stress is
\[
 T_{ij}=\frac{3}{2x^2}\big[n_i(p_0)_j+n_j(p_0)_i-(\delta_{ij}-n_i n_j)(n\cdot p_0)\big].
\]
Taking its Euclidean divergence gives zero on the shell. The covariant tensor \(\Omega^{-1}T\) is tracefree and divergence-free for \(g\), by the conformal connection formula in dimension three. Its flux against \(Z\) is independent of radius since \(Z\) is Killing. Taking \(x\downarrow0\) and integrating \(T(n)\cdot p_0=3(1+(n\cdot p_0)^2)/(2x^2)\) gives flux \(8\pi\). For \(V=Z\) at the inner face and \(V=0\) at the outer face, integration by parts pairs this same absolute flux with \(k^\circ\). The squared Euclidean norm is \(9(1+2(n\cdot p_0)^2)/(2x^4)\). Therefore the squared round norm integral of the stress is at most \(30\pi\sec^6(R/2)/x_0,\ x_0=2\tan(r_0/2)\). Cauchy gives
\[
 C\ge (32\pi/5)d^2 x_0\cos^6(R/2).
\]
Since \(B\ge0\), minimize \(AL+C/L^3\) over all positive \(L\). It follows that
\[
 e_X(L)\ge\frac{4\pi}{3^{3/4}}\left(\frac45\right)^{1/4}
     (1-a^2)^{3/2}\cos^{3/2}(R/2)\sqrt d\,(x_0/a^3)^{1/4}.
\]
In particular \(a\le\sin^3 r_0\le r_0^3,\ x_0\ge r_0\) imply \((x_0/a^3)^{1/4}\ge r_0^{-2}\). Here \(R\le\pi/17<1/5,\ d=\pi/6>1/2\), so even the crude bounds \(4/3^{3/4}>1,\ (4/5)^{1/4}>9/10,\ (1-a^2)^{3/2}>9/10,\ \cos^{3/2}(R/2)>9/10,\ \sqrt d>2/3,\ r_0^{-2}>25\) give \(e_X>12\pi>8\pi^2/3\). This excludes **all fixed co-moving velocity profiles with resting endpoints** in this radially bent, embedded chart model, including the gradient correction, across every allowed chart width and every base length.

## Boundaries of the static-shell energy estimates

The topological data and the positive reflective double are realized. The two base-length estimates above have different hypotheses. A nonresting time germ removes the acceleration term. The great-circle isometry carries the oriented tangent to the terminal tangent, and the angular identification allows the matched continuations treated below. A spatially varying velocity can also change the timewise decomposition of the electric coefficient. No upper energy certificate below \(8\pi^2/3\) or determination of the individual smooth fillings follows. The count of subcritical entries on unrecognized smooth types remains zero. This example goes to the other branches as a **failed metric construction on specified topology**.

## A positive-double obstruction for time-varying, volume-preserving motion

There is a third test when the extension on the moving round shell is divergence-free. Its spatial profile and speed may change with time. On the ball it agrees with the required unit transvection times the speed and outside the shell it vanishes. An added instantaneous Killing rotation of the centered ball gives the same translational stress flux (its flux is zero in the limit at the center). In the bent region \(h_t\) is fixed and in the round region the pullback metric has time-independent volume, so \(H=0\). At each instant the preceding round stress gives
\[
 \int |K|^2\,dV_{h_t} \ge (32\pi/15)v(t)^2 x_0\cos^6(R/2).
\]
No time derivative or acceleration of the velocity enters this estimate. Keep fixed embedded radii and the same smooth radial bend throughout.

A single test function for the double avoids any dependence on the length or scalar integral of the bent collar. On the final increasing segment above let \(x\) satisfy \(d\log x=ds/f\) and \(x=x_0=2\tan(r_0/2)\) at the round end. At the last turning point,
\[
 \log(x_0/x_*)\ge\int_{s_*}^{s_{\rm end}}f'/f\,ds=\log(\sin r_0/a);
 \qquad x_*/x_0\le \sin^2r_0 <1/16.
\]
This shell is conformal to the reference unit round punctured ball with stereographic radial coordinate \(x\), \(h=w^4g_{\rm rd}\), since both metrics are conformal to \(dx^2+x^2 g_{S^2}\); \(w\) matches one at the round end with matching normal derivative. Set \(wu=\zeta\), where \(\zeta\) is zero on \(x\le x_0/16\), one on \(x\ge x_0/8\), and linear between. Extend \(u=0\) further into the bend, and \(u=1\) on the round shell and outside. This \(H^1\) test is time independent on the reference fiber: only the transported bend has \(u\ne1\), and in that ball the pullback identifies the bend isometrically at all times. It also matches through the monodromy, including an angular end rotation. Reflect it on both halves; it vanishes near their common face.

Use the three-dimensional conformal scalar identity with gradient coefficient eight, compactly supported away from the inner endpoint. Outside the bent chart the metric is locally the pullback of the round quotient. On the one-fiber integral,
\[
 S_6[u]=\int(6|\nabla u|_{h_t}^2+R_{h_t}u^2)\le
 \int_Y(8|\nabla\zeta|^2_{g_{\rm rd}}+6\zeta^2)\le
 6\,\mathrm{Vol}(Y)+\frac{14\pi}{3}x_0.
\]
In the moving chart \(\zeta\) is the same radial function centered at the instantaneous center, extended by zero inside its fictive round hole. Indeed the stereographic volume-gradient factor for the derivative is \(\Omega\le1\) and \(8(4\pi)(16/x_0)^2\int_{x_0/16}^{x_0/8} x^2dx=(14\pi/3)x_0\). Using the Yamabe numerator of the actual four-dimensional double and dividing both numerator contributions by two, positivity now requires
\[
 L^2>\frac{(32\pi/15)d^2 x_0\cos^6(R/2)}
 {6(2\pi^2/136)+(14\pi/3)x_0}.
\]
The negative temporal shear is fully sampled because \(u=1\) on its support. This condition holds at constant speed and for a time-varying divergence-free extension; there is no resting-end assumption.

For a simple strict comparison, \(R<1/5,\ x_0<21/100,\ d>1/2,\ \cos^6(R/2)>9/10\) and the denominator is less than 5. Thus \(L^2>(7/25)r_0\), using \(\pi>3\) and \(x_0\ge r_0\). Also \(a\le r_0^3<1/125\) gives \(A> (7/5)r_0^{-3}\). Consequently \(e_X\ge AL>(7/5)(\sqrt7/5)r_0^{-5/2}> 8\pi^2/3\) throughout the positive-double range. This covers the volume-preserving puncture correction even when its angular velocity is changed in time. A compressible extension introduces trace terms in the variational numerator; an unrestricted metric need not coincide with the round metric outside a radial bend. [Independent variational reading](../reviews/E33_VOLUME_PRESERVING.md).

The [through-running gradient test](E30_GRADIENT_PUNCTURE.md) also excludes a conventional pair of bounded radial cutoffs in a shell with \(R=2r_0\), including nonzero constant speed, by its axial electric contribution. The circle jets for this actual branch match by the conjugacy \(J_*Z=Z\) along the covered great circle. [Independent gradient and endpoint reading](../reviews/E32_GRADIENT_REPLAY.md).
