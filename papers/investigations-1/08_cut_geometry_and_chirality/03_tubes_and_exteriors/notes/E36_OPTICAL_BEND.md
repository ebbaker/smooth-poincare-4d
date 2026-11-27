# SP4-CUT-TUBE-E36 — sharp optical radial cost and the positive-double test

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance. Sol 6.2/ultra requested. Actual model and effort unavailable to this worker. Analytical return to [E36_REQUEST_R1](../research-progress/handoffs/E36_REQUEST_R1.md), checkout `bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0`. Inputs are the [marked prism model](MARKED_PRISM_17.md), [finite-length decomposition](E26_LENGTH_TEST.md), [radial bend](E05_TWISTED_EXTERIORS.md), and [E31 electric estimate](../reviews/E31_ELECTRIC_CAPACITY.md).

For arbitrary smooth positive radial optical profiles with the specified round outer germ and umbilic seam, the sharp static infimum is \((8\pi/3)\cot r_0\). No scalar sign is needed. It extends E31's all-length exclusion to optical bends for fixed co-moving velocity fields with resting endpoint speeds. A conformal test with nonzero boundary trace also excludes Yamabe-positive subcritical lengths for compatible time-changing divergence-free fields, including nonresting ends. The earlier radius bound \(a\le\sin^3 r_0\) does not follow from positivity of the four-dimensional reflected double, even with a smooth physical positive-scalar radial fibre before the lapse change.

## Optical geometry and sharp static infimum

Take \(g=N^2L^2dt^2+h_t\), where \(N\) is radial and stationary in the transported inner bend and constant on the round moving region. Normalize the exterior value of \(N\) to one by absorbing that constant into \(L\). The positive conformal change \(N^{-2}g=L^2dt^2+\widehat h_t\) gives the optical metric \(\widehat h_t=N^{-2}h_t\). The two Weyl energies are unchanged, and the smooth reflected class has the same Yamabe sign when the end jets give the smooth optical double. Umbilicity is conformally invariant. The optical seam, which is stationary and has zero shape in the \(t\) direction, is therefore totally geodesic. In optical radial arclength \(s\) the bend has the form \(ds^2+f(s)^2g_{\mathbb S^2}\), \(f>0\), with
\[
       f'(0)=0,\qquad f(S)=b=\sin r_0,\qquad f'(S)=p=\cos r_0 .
\]
The end near \(S\) is exactly unit round. The static coefficient on the bend, in the Weyl normalization of E26, is
\[
 A=\frac14\int|\operatorname{Ric}_{\widehat h}^\circ|^2\,dV_{\widehat h}
   =\frac{2\pi}{3}\int_0^S \left[f''+\frac{1-(f')^2}{f}\right]^2 ds .
\]
The optical bend is stationary on the reference fibre and the complementary metric is round up to pullback, so there is no other contribution to \(A\) in the model. The curvature and conformal numerator identities of E26 hold without its extra spatial scalar hypothesis. The last increasing component alone also gives the bound below.

Set \(du=ds/f\), \(b_{\rm opt}=1/f\), \(dv=b_{\rm opt}\,du=ds/f^2\), and \(y(v)=b_{\rm opt}^2\). With \(V=\int_0^S ds/f^2\) and \(\lambda=p/b=\cot r_0\), one has \(y_v=2(b_{\rm opt})_u=-2f'/f\) and
\[
 q(v)=1-\tfrac12 y_{vv}=1+f f''-(f')^2,
 \qquad
 \int_0^V q\,dv=V+\lambda .
\]
Consequently
\[
 A=\frac{2\pi}{3}\int_0^V q^2\,dv
   \ge\frac{2\pi}{3}\frac{(V+\lambda)^2}{V}
   \ge \frac{8\pi}{3}\lambda .
\]
No monotonicity or scalar assumption is used. Repeating the same calculation from the last zero of \(f'\) gives the same lower bound on the last increasing component.

Equality in the two inequalities requires \(V=\lambda,\ q\equiv2\). Then \(y(v)=b^{-2}+\lambda^2-v^2\), which corresponds to
\[
     f(s)=a_*\cosh(s/a_*),\qquad
     a_*=\frac{b}{\sqrt{1+p^2}},\qquad
     S=a_*\operatorname{arsinh}p.
\]
It is smooth by even reflection at the inner face and attains the round first jet at the outer face. The optical scalar curvature there is negative on the cosh side, \(R_{\widehat h}=-2(1+3(f')^2)/f^2\). An exact round germ has \(q=0\) and hence precludes equality for a smooth bend with a round collar. Sharpness follows by matching this cosh profile instead at \(r_j\uparrow r_0\), continuing with the exact round metric and smoothing the two matching first jets in an arbitrarily narrow region inside \(r_0\). This can be done with uniform \(C^1\) convergence and bounded second derivatives for each fixed \(j\), leaving the inner end and outer round germ intact. Its energy tends to the piecewise-profile value \((8\pi/3)\cot r_j\) by dominated convergence. Taking \(j\to\infty\) gives the claimed infimum. This is sharp over arbitrary optical radii and conformal widths. An assigned physical bend would in addition fix \(\int ds/f\), since that radial modulus is unchanged by a radial lapse change.

## Fixed co-moving resting fields remain supercritical

The separation of the static trace-free Ricci and time tensors persists after the lapse change, so \(B\ge0\) in E26. E31 acts only on the round shell, which is untouched. For a fixed co-moving spatial vector profile with both endpoint speeds zero it gives
\[
 C\ge\frac{32\pi}{5}d^2x_0\cos^6(R/2),\qquad
 d=\pi/6,\quad x_0=2\tan(r_0/2).
\]
Positive or negative optical scalar curvature plays no role in that argument. Minimize \(AL+C/L^3\) over \(L>0\) using the new bound for \(A\) and the displayed bound for \(C\). In the exterior budget normalization,
\[
 \left(\frac{e_X(L)}{8\pi^2/3}\right)^4
 \ge \frac{256}{405\pi^2}\,x_0\cot^3 r_0\,\cos^6(R/2).
\]
Indeed the fourth power of the unconstrained minimum of \(A_0 L+C_0/L^3\) is \(256A_0^3C_0/27\). For \(0<r_0<R\le\pi/17<1/5\), use \(x_0\ge r_0\), \(\cot r_0\ge\cos r_0/r_0\), \(\cos^3r_0,\cos^6(R/2)>9/10\), and \(\pi^2<10\). The right side is strictly greater than \(32/25>1\). This excludes the fixed co-moving resting class at every base length without a positivity test. The acceleration argument does not cover time-varying profile shapes or general nonresting angular jets.

## A boundary test for time-changing divergence-free transport

Use a round conformal coordinate on the **entire** optical bend, writing \(dx/x=ds/f\) with \(x(S)=x_0\). This is possible even where \(f\) decreases. If \(\rho=2\arctan(x/2)\) and \(g_{\rm rd}=(1+x^2/4)^{-2}(dx^2+x^2g_{\mathbb S^2})\), then
\[
 \widehat h=w^4g_{\rm rd},\qquad
 w^2=f/\sin\rho,\qquad
 \partial_s\log w=\frac{f'-\cos\rho}{2f}.
\]
Choose \(u=w^{-1}\) on the bend and \(u=1\) outside. It is smooth on each half, time-independent, and has the same value on the reflected face, so its reflected extension is an admissible \(H^1\) test. A derivative condition at the reflection face is unnecessary for the quadratic form. The monodromy preserves the radial coordinate on the bend and carries its complement to itself, so this test descends even for compatible nonresting jets.

By three-dimensional conformal covariance, the coefficient-eight spatial form on the bend satisfies
\[
 \int_{\rm bend}(8|\nabla u|^2+R_{\widehat h}u^2)\,dV_{\widehat h}
   =6\operatorname{Vol}_{\rm rd}(B_{r_0}\setminus B_{\rho_i})
             +8\int_{\partial\,{\rm bend}}u\,\partial_\nu u\,dA_{\widehat h},
 \qquad \rho_i=\rho(0).
\]
Indeed \(wu=1\) and \((-8\Delta_{\widehat h}+R_{\widehat h})u=w^{-5}6\). The boundary term is zero at the outer face since \(w=1\) in its germ. At the inner face \(\nu=-\partial_s\) and \(f'(0)=0\), so \(\partial_\nu u=-u\cos\rho_i/(2f(0))\). The boundary term there is exactly \(-16\pi\sin\rho_i\cos\rho_i\) after integrating the sphere. It is negative because \(0<\rho_i<r_0<\pi/2\).

Lowering the gradient coefficient to six and adding the round exterior contribution gives the single-half spatial test
\[
 S[u]\le 6\operatorname{Vol}(Y)
     -6\operatorname{Vol}_{\rm rd}(B_{\rho_i})
     -16\pi\sin\rho_i\cos\rho_i
 \le \frac{3\pi^2}{34}.
\]
Where positivity of the double forces this test to have \(S[u]>0\), it bounds the **conformal** inner radius \(\rho_i\), through \(16\pi\sin\rho_i\cos\rho_i<6\operatorname{Vol}(Y)\). This quantity depends on the radial conformal width. The inequality does not directly bound the optical areal radius or the last turning radius.

As in [E33](../reviews/E33_VOLUME_PRESERVING.md), for compatible time-changing divergence-free velocity in the round shell one has \(H=0\) there and the optical bend is stationary. The time form of this test is therefore \(T[u]=-\int|K|^2\), because \(u=1\) on the shell where \(K\) is supported. The instantaneous stress gives \(-T[u]\ge F_0=(32\pi/15)d^2x_0\cos^6(R/2)\). No assumption on the derivative or endpoint values of the speed enters. Doubling multiplies the numerator by two. Positivity of the doubled class forces \(S[u]>0\) and \(L^2>F_0/(3\pi^2/34)\). Using \(e_X\ge AL\) and the sharp static bound yields
\[
 \left(\frac{e_X}{8\pi^2/3}\right)^2
 >\frac{272}{405\pi}\,x_0\cot^2r_0\cos^6(R/2)
 \ \ge\frac{4624}{405\pi^2}\cos^2r_0\cos^6(R/2).
\]
Both cosine factors exceed \(19/20\) because \(R<1/5\). Together with \(\pi^2<10\) this makes the last expression strictly greater than \(4624(19/20)^2/4050>1\). Thus every Yamabe-positive length in the E33 class also exceeds the budget with arbitrary radial optics, regardless of the spatial scalar sign. For stationary optical paths the same test gives the conformal-radius restriction directly. In a general compressible moving shell the time form of this test has an additional trace term, so the sign argument does not extend on that basis.

## Positive optical doubles can violate the radial mass bound

The pointwise nonnegative-scalar argument used \(\mu=f(1-(f')^2)\), \(\mu'=\tfrac12 R_{\widehat h} f^2 f'\), so on the last increasing branch it forced its turning radius \(a\) to be at most \(b^3\). The reflected Yamabe condition does not imply this inequality. Fix an embedded pair \(r_0<R\) in the specified round prism. Write \(m=b^3\). Start with the following piecewise smooth radial comparison metric, before a lapse representation is chosen. Use an inner product collar of radius \(m\). Continue with the increasing solution
\[
        f''=m/(2f^2),\qquad (f,f')_{\rm initial}=(m,0),
        \qquad (f')^2=1-m/f
\]
until \(f=b\). The first integral follows from the ODE. It gives \(f'(S)=\sqrt{1-b^2}=\cos r_0\), matching the first jet of the unit-round exterior. This branch has scalar curvature zero. The two joins are \(C^{1,1}\), with scalar curvature nonnegative almost everywhere and positive on the inner product collar and on the exterior. Reflection at the inner boundary preserves a whole product region.

Transport this reference radial shape in the marked correction, pulling back by the correction flow, and reflect. The spatial form of this \(C^{1,1}\) reference fibre is uniformly coercive in \(t\):
\[
  S_{0,t}[w]=\int_{DP}(6|\nabla w|^2+R_{0,t}w^2)\,dV_{0,t}
            \ge c\,\|w\|_{H^1(DP)}^2
\]
for a fixed smooth background norm and some \(c>0\). Indeed the metrics are uniformly equivalent to a smooth background, the scalar term is nonnegative, and there is a fixed subcollar where it is uniformly positive. The gradient norm and the \(L^2\) norm on that subcollar control the full \(H^1\) norm by the Poincaré inequality on the connected double. This argument uses no sign hypothesis on a perturbation of the reference.

Now smooth the two joins, retaining an open inner product collar and keeping the exact round germ at \(r_0\). At the inner join use nonnegative local radial convolution with a cutoff, so the smoothed profile stays at least \(m\) there. At the outer join one can instead blend from the smooth mass-branch extension to the round profile over a small interval on the inner side of \(r_0\). The difference of the two profiles is \(O((S-s)^2)\), with derivative \(O(|S-s|)\), so the one-sided blend converges in \(C^1\) and has uniformly bounded second derivatives. Choose the smoothing neighborhood of the inner join smaller than a fixed region on which a bump is identically one. Add \(\delta>0\) times that bump to \(f\), constant from the inner face through the smoothed join and fading to zero only on a compact subinterval of the mass branch where \(f'>0\). For small \(\delta\) there is strict increase after the constant-bump region, including the outer join. The last zero of \(f'\) therefore occurs where \(f\ge m+\delta\). In particular \(a>b^3\). The profile remains smooth and optical reflection is smooth.

The modified fibre metrics approach the comparison metrics in \(C^1\). Their scalar curvatures converge in \(L^{3/2}\) uniformly in the indicated \(t\)-charts, since second derivatives stay bounded on shrinking smoothing regions and the bump is a small smooth perturbation. The background three-dimensional Sobolev inequality controls the scalar perturbation by \(O(\|R-R_0\|_{L^{3/2}})\|w\|_{H^1}^2\), with the uniform volume equivalence. The gradient forms converge by metric equivalence and uniform convergence. Spatial coercivity thus persists for sufficiently small smoothing regions and \(\delta\). Choose a smoothly matched resting correction for this counterexample, using the same radial chart along the arc. With its fixed optical path the doubled four-dimensional conformal numerator is
\[
  \int_0^1\left[L S_t[w]
       +L^{-1}\int_{DP}(6|\partial_t w|^2-D_t w^2)\,dV_t\right]dt,
 \qquad D_t=2\partial_t H+H^2+|K|^2 .
\]
The potential \(D_t\) is bounded. Thus for all sufficiently large \(L\) this numerator controls a positive multiple of the full \(H^1\) norm. The compact four-dimensional Sobolev inequality gives a positive Yamabe constant of the actual optical double.

The example can be realized by a lapse on a physical positive-scalar radial bend. Start with one smooth E05 physical bend with an inner product collar and the same unit-round exterior germ. In the optical comparison above choose the product interval long enough that its conformal radial width \(\int ds/f\) strictly exceeds that of the physical bend, with room for the small perturbations just used. Extend the physical product collar to match the optical width exactly. In the common logarithmic radial coordinate based at the outer round face, the two bend metrics have the forms \(f_{\rm phys}^2(d\tau^2+g_{\mathbb S^2})\) and \(f_{\rm opt}^2(d\tau^2+g_{\mathbb S^2})\). Thus \(N=f_{\rm phys}/f_{\rm opt}\) is smooth and radial, is one on the outer round germ, and is constant near the reflecting inner face. It changes the physical bend to the optical one as specified, and the four-dimensional positive Yamabe sign is preserved by that smooth conformal change. This disproves recovery of the particular mass-radius restriction from the true double criterion. The two obstructions above concern their stated transport classes. No subcritical example or smooth-type recognition follows.
