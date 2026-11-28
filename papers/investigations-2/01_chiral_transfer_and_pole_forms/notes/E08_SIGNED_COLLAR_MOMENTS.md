# E08 · Finite signed volume tests for the true cap trace

27 November 2026 (New York). Prepared for Edward B. Baker III by the Codex lead, exact serving variant and effort unavailable. Base 6a422ce. Working project theorem on the [B04 specimen](../brainstorm/notes/B04_MARKED_PILOT_20261127.md), [223-piece cover](E07_MARKED_ATLAS.md) and [signed flat comparison](../brainstorm/notes/B04_ANALYTIC_METHOD_20261127.md). This companion derivation uses the open *physical* hyperbolic product collar on both sides of the second seam. Its purpose is to replace a pointwise boundary estimate by signed integrals and one energy upper bound, all for the actual A1 field.

## A shell with an explicit Euclidean clearance

Use oriented coordinates \(Z=(\xi,bn)\) and their Euclidean norm from the B04 Cayley map. In these coordinates the product disk of hyperbolic radius \(a\) times the marked sphere has image
\[
 D_a=\{(\xi,Y):\ \xi^2+(|Y|-\cosh a)^2<\sinh^2 a\}.
\]
Indeed \(|w|<\tanh(a/2)\) is equivalent to \(|(\xi+ib)-i|<\tanh(a/2)|(\xi+ib)+i|\). The metric is \(b^{-2}g_{\rm E}\). Set \(a_-=15/16,\ a_+=17/16\), \(S=D_{a_+}\setminus\overline{D_{a_-}}\), and \(d=e^{-1}-e^{-a_+}>0\). The seam \(\Gamma_1=\partial D_1\) is the original marked \(s=0\). For every \(z\in\Gamma_1\), the open Euclidean four-ball \(B_d(z)\) lies in \(S\). To see this, project \((\xi,Y)\) to \((\xi,|Y|)\), a 1-Lipschitz map. For nested profile disks of radii \(a<a'\) in the hyperbolic coordinate, the Euclidean boundary separation is at least
\[
 \sinh a'-\sinh a-(\cosh a'-\cosh a)=e^{-a}-e^{-a'}.
\]
The gap to the inner profile is \(e^{-15/16}-e^{-1}>d\), and the gap to the outer is at least \(d\). The shell corresponds exactly to \(-1/16<s<1/16\) in the signed tube of E07. Its entire metric agrees with the indicated product.

## Finite tests and their error

Fix one unit pole coefficient \(u\) in the B04 basis (the first trial is \(u_1\)) and a constant Euclidean self-dual unit test form \(\beta\). Push \(L u\) into the flat coordinates and write the resulting form as \(F_u\). The scalar \(f_u=\langle F_u,\beta\rangle_{\rm E}\) is harmonic on \(D_{a_+}\): in these coordinates closedness and self-duality imply coclosedness for the Euclidean metric, and the Hodge Laplacian acts componentwise. For any \(0<\ell<d\) define
\[
 k_\ell(v)=\frac{12}{\pi^2\ell^4}(1-|v|^2/\ell^2)_+^2,\qquad
 m_j(u)=\int_S k_\ell(z-z_j) f_u(z)\,d^4z .
\]
Choose any finite Euclidean \(\eta\)-net \(\{z_j\}\subset\Gamma_1\). For example take equal angular grids on the profile circle \((\xi,b)=(\sinh1\cos t,\cosh1+\sinh1\sin t)\) and on the unit sphere in colatitude and longitude. With \(N\) equal subintervals in each angle and including the poles, the chord covering radius is at most \(\pi(\sinh1+3e/2)/N\) by travel along each coordinate curve. The inverse Cayley map gives each physical longitude on the marked cap disk; continue outward via \(\Phi_2(t_{\rm mark},(1+s)n)\) with \(t_{\rm mark}=\arg(w)/(2\pi)\). The profile circle angle used for the grid is separate from this longitude.

Radial integration gives \(\int k_\ell=1\). Every spherical mean of \(f_u\) about a seam point equals its center value up to radius \(\ell\), since the derivative of the mean is the flux of its gradient divided by the sphere area, and the flux vanishes by harmonicity. Hence \(m_j(u)=f_u(z_j)\). For a unit vector \(v\),
\[
 \|\partial_v k_\ell\|_2^2=\frac{96}{5\pi^2\ell^6}.
\]
In detail, rotational symmetry gives one quarter of the squared norm of the full gradient. The radial integral for the latter uses \(\int_0^1 t^2(1-t)^2 dt=1/30\) after \(t=r^2/\ell^2\). For any two translates the fundamental theorem of calculus along the segment between their centers, in \(L^2(\mathbb R^4)\), gives the directional derivative bound times their Euclidean separation. Both endpoint kernels are supported in \(S\); the intervening kernels need no support condition because we evaluate their norm on all of Euclidean space.

Write \(G_S(u)=\int_S |F_u|_{\rm E}^2 d^4 z\). This equals the physical two-form energy on the shell by the conformal scaling of the four-volume and two-form norm. Applying Cauchy–Schwarz to the difference of two translates paired with \(1_S f_u\) gives
\[
 \min_{\Gamma_1} f_u\ \ge \min_j m_j(u)-\eta\frac{\sqrt{96/5}}{\pi\ell^3}\sqrt{G_S(u)}=:A(u).
\]
In particular, rigorous lower enclosures for the finitely many signed moments and an upper enclosure for the single shell energy suffice. If \(A(u)>0\), the harmonic minimum principle propagates the bound to \(\overline{D_1}\); its proof follows also from the local spherical-mean property. Since \(b\ge e^{-1}\) there, \(\min_{C_2}|Lu|_h\ge e^{-2}A(u)\). This last estimate is for the entire original second cap. The outer interface estimate on \(\partial D_{17/16}\) has its own, larger domain of propagation.

## Exact remaining data

Each moment is a linear functional of the global solution on a ball contained in the actual signed collar. It can be read in the B04 operator formulation as follows. Let \(A_{\rm end}(u)\) be the fixed cutoff end primitive and \(f_{\rm end}=-\sqrt2P_h^-dA_{\rm end}(u)\). On this shell \(Lu=dD_h^{-1}(0,f_{\rm end})\); the end primitive is identically zero there. Push this exact response through the marked chart in the integral for \(m_j(u)\). The kernel orientation and the signs of these local moments matter. The positive definiteness of a cap energy matrix or a scalar bound on the norm of this solution supplies no signed lower enclosure. We have derived the quadrature-free test and its constant; the actual moments and a quantitative shell energy on this pilot have yet to be enclosed. Even a successful test here would leave the first cap, mixed exterior bands and residual exterior to check for the same input.
