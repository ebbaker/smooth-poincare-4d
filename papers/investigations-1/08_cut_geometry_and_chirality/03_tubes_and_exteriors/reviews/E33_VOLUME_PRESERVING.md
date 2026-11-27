# SP4-CUT-TUBE-E33 — independent volume-preserving puncture check

27 November 2026. Prepared for Edward B. Baker III with OpenAI assistance. Sol 6.2/ultra requested. Actual model and effort unavailable to this reader. Independent analytic review under [E33_REQUEST_R1](../research-progress/handoffs/E33_REQUEST_R1.md), checkout `bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0`. The fixed model is the [actual marked order-seventeen prism](E28_PRISM_REPLAY.md). The inputs used below are the [finite-length Weyl and conformal forms](../notes/E26_LENGTH_TEST.md), the [radial bend estimate](E29_MOVING_PUNCTURE.md) and the [sphere stress calculation](E31_ELECTRIC_CAPACITY.md).

**Disposition.** The relative Yamabe test verifies for every compatible divergence-free transport in the specified round shell, including time-changing shapes and through-running endpoint speeds. Every length with positive Yamabe double has \(e_X>16\pi^2/3\), above the required exterior budget \(8\pi^2/3\). The assertion is conditional on the localized round-shell and isometrically transported radial-bend geometry.

## Instantaneous shear and the time-independent test

Let \(Y\) be the unit-round quotient by \(Q_8\times C_{17}\), so \(\operatorname{Vol}(Y)=2\pi^2/136=\pi^2/68\). Move the inner round chart of radius \(r_0\) along the specified arc of displacement \(d=\pi/6\), with signed speed \(v(t)\) on \(0\le t\le1\). Let \(V_t\) be a smooth divergence-free ambient velocity agreeing with \(v(t)Z_t\) in the inner germ, where \(Z_t\) is the unit transvection, and vanishing on the outer germ of the embedded shell with outer radius \(R\). The profile elsewhere in the shell may depend on \(t\). The transported bent region is fixed in the reference coordinates of the flow \(\Psi_t\) because that flow agrees with the isometric transport there. The reference complement of the bend maps to the physical complement at each time. The latter carries the unit-round metric. In the complement the derivative \(K=\tfrac12\partial_t h_t\) pulls back from \(\operatorname{sym}\nabla V_t\), with trace zero by the round divergence assumption. In the bend \(K=0\). Hence \(H=\operatorname{tr}K=0\) on the entire fibre. The same support separation as in E31 gives \(B=\int|M|^2\ge0\) and \(C\ge0\) in the finite-length energy.

At each time the E31 stress pairs with \(\operatorname{sym}\nabla V_t\) by the boundary flux \(8\pi v(t)\) up to sign. Its squared norm integral is at most \(30\pi\sec^6(R/2)/x_0\), where \(x_0=2\tan(r_0/2)\). The magnitude and bound are unchanged by the local round isometry taking the moving chart to the initial chart. The trace-free strain equals the whole strain. Thus
\[
  \int_0^1\int_{P}|K|^2\,dV_{h_t}\,dt
   \ \ge\ \frac{32\pi}{15}x_0\cos^6(R/2)\int_0^1v(t)^2\,dt
   \ \ge\ \frac{32\pi}{15}d^2x_0\cos^6(R/2)=:F_0.
\]
The last step uses only \(\int_0^1v=d\). Neither a time derivative of the spatial profile nor a value of \(v\) at the endpoints appears.

On a single reference half, the test \(u\) constructed below is radial in the stationary bend, zero near the reflection face and one on the whole round complement. It is time-independent. Under the end identification, the marking on the bend is the difference of the unpointed isometry \(J\) and the local transvection flow at the terminal point. This is an isometry fixing the reference center, and acts by an angular orthogonal map on the radial bend. The complement is taken to itself. Therefore \(u\) descends through the marking. Its two copies also give an \(H^1\) function on the reflected double. This uses the smooth reflected mapping-torus jets as a hypothesis for admitted transports, including any through-running ones.

## Conformal bound on the spatial form

Write the last increasing radial segment of the bend as \(h=ds^2+f(s)^2g_{\mathbb S^2}\). It begins at a last turning point where \(f=a>0,\ f'=0\), and ends at the unit-round outer germ \(f=\sin r_0,\ f'=\cos r_0\). The mass identity
\[
 (f(1-(f')^2))'=\tfrac12 R_h f^2f'
\]
gives \(0<f'\le1\) on the open segment and \(a\le\sin^3 r_0\). Define \(x\) by \(dx/x=ds/f\) with \(x=x_0\) at the outer face. If \(x_*\) is the value at the last turning point, monotonicity of \(x/f\) follows from
\[
       \frac{d}{ds}\log(x/f)=\frac{1-f'}{f}\ge0.
\]
Consequently \(x_*/x_0\le a/\sin r_0\le\sin^2 r_0<1/16\) since \(r_0<R\le\pi/17<1/5\).

In this coordinate \(h=(f/x)^2(dx^2+x^2g_{\mathbb S^2})\). The unit-round reference metric is \(g_{\rm rd}=\Omega^2(dx^2+x^2g_{\mathbb S^2})\) with \(\Omega=(1+x^2/4)^{-1}\), so \(h=w^4g_{\rm rd}\) for \(w=(f/(x\Omega))^{1/2}\). On the round germ, integrating \(dx/x=dr/\sin r\) gives \(x=2\tan(r/2)\) by the normalization, and \(x\Omega=\sin r=f\), hence \(w=1\) on that germ. Define \(w u=\zeta(x)\) on the last increasing segment, where \(\zeta=0\) on \(x\le x_0/16\), is linear up to \(\zeta=1\) at \(x_0/8\) and equals one thereafter. Extend by zero on the earlier part of the bend, and by one on its complement. This is a nonzero \(H^1\) test. Its constant germs make it valid on the glued double. The two interior corners of the cutoff can also be approximated in \(H^1\).

The three-dimensional conformal Laplacian satisfies \(L_{w^4g}u=w^{-5}L_g(wu)\) for \(L_g=-8\Delta_g+R_g\). Integrating this identity gives equality of the coefficient-eight spatial forms on the warped annulus and its normalized round model. The boundary term vanishes at the last turning point because \(u\) is zero near it, and at the outer face because \(w=1\) near it. Lowering the spatial gradient coefficient from eight to six can only lower the form on the bend. The round scalar contribution of \(\zeta\) accounts for at most \(6\operatorname{Vol}_{\rm rd}(B_{r_0})\), as \(0\le\zeta\le1\). The complement where \(u=1\) contributes exactly \(6\operatorname{Vol}_{\rm rd}(Y\setminus B_{r_0})\). The round gradient on the cutoff interval contributes at most
\[
  8\int|\nabla^{g_{\rm rd}}\zeta|^2\,dV_{g_{\rm rd}}
  =32\pi\int_{x_0/16}^{x_0/8}\Omega x^2(16/x_0)^2\,dx
  \ \le\ \frac{14\pi}{3}x_0 .
\]
All of these are spatial estimates for each individual time, with interval length one for the time integral. Thus in the [E26 form](../notes/E26_LENGTH_TEST.md) the single-half test satisfies
\[
 0<S[u]=\int\bigl(6|\nabla^{h_t}u|^2+R_{h_t}u^2\bigr)\,dt\,dV_{h_t}
 \ \le\ 6\operatorname{Vol}(Y)+\frac{14\pi}{3}x_0
 =\frac{3\pi^2}{34}+\frac{14\pi}{3}x_0=:S_0 .
\]

## Strict all-radii budget comparison

Since \(H=0\) and \(u'=0\), the time form is \(T[u]=-\int|K|^2u^2\le-F_0\). Indeed \(K\) vanishes in the bend and \(u=1\) on the round region. On the double the identical test on both halves multiplies the whole conformal numerator by two, preserving its sign. Positive Yamabe type thus implies \(L S[u]+T[u]/L>0\), and in particular \(L^2>F_0/S_0\).

The radial bound from E29 and E31 gives \(A\ge A_0=\pi(1-a^2)^2/(2a)\), and the other two coefficients are nonnegative, so \(e_X\ge A_0 L>A_0\sqrt{F_0/S_0}\). Substituting \(d=\pi/6\) and comparing with \(8\pi^2/3\) gives
\[
  \left(\frac{e_X}{8\pi^2/3}\right)^2
  >\frac{(1-a^2)^4\cos^6(R/2)}{480}
          \frac{x_0}{a^2(3\pi/34+14x_0/3)} .
\]
This has a uniform strict lower bound on the allowed shells. The function \(x/(3\pi/34+14x/3)\) is increasing, \(x_0\ge r_0\), and \(a\le r_0^3\). Hence the last fraction is at least
\[
   \frac{r_0^{-5}}{3\pi/34+14r_0/3}>\frac{5^5}{5/4}=2500 .
\]
Here the denominator is less than \(3/10+14/15<5/4\), using \(\pi<22/7\) and \(r_0<1/5\). Also \(a<1/125\) and \(\cos(R/2)>199/200\). Bernoulli's inequality gives \((1-a^2)^4>9/10\) and \(\cos^6(R/2)>9/10\). The squared ratio is consequently greater than \(2500(9/10)^2/480=135/32>4\), proving the stated \(e_X>16\pi^2/3\).

This checks the fixed comparison without a numerical optimizer or a time acceleration bound. The construction uses a constant lapse, zero shift, a unit-round embedded shell and an isometrically transported radial bend. The proof of the temporal term requires divergence-free transport. It leaves general compressible time-dependent transports and other geometries outside the tested class. The argument also leaves unaffected the smooth type of each of the two marked fillings.
