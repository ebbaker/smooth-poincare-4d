# Certified native Hopf basis and a bounded search for the two cuff parameters

27 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance under master B02, checkout `48f36794f9b1`. Selected Astra/ultra scientific lead and bounded Sol/ultra readings. Independent serving telemetry unavailable. We use the [07 circular pants and long cuffs](../../investigations-1/07_positive_subcritical_entry/notes/DIRECT_TRIAL_AND_VARIATION.md) and the [two-real-parameter reconstruction](NATIVE_HARMONIC_DATA_20261127.md). This calculation validates the two holomorphic coefficient fields on the original domain and bounds the unknown coefficients of the actual marking. The scalar conformal factor and exact pair of coefficients remain to be enclosed to the accuracy of the Neumann sign test.

Put \(d=1/4\), and take \(\epsilon=+1,-1\). Use the two rim potentials taking the values \(0,A_\epsilon,\epsilon A_\epsilon\) on the outer, right, and left cuffs, where the explicit positive \(A_\epsilon\) is fixed below. Their native complex gradients \(P_\epsilon=v_{\epsilon,x}-i v_{\epsilon,y}\) give a basis \(P_+^2,P_-^2\) for the symmetric real Hopf differentials by reflection and parity. Squaring removes the sign in reflection across a cuff on which the potential is constant. On the Schottky double the half-turn quotient has genus one with two branch points, so the half-turn invariant quadratic differentials have complex dimension two. Conjugation cuts out the real subspace. The distinct values at 0 and 2 below establish linear independence directly. [Basis and normalized harmonic measures](HOPF_PARAMETER_BASIS_20261127.md)

## Harmonic potentials with an exact residual

For a pole at the right hole define real harmonic functions on the pants
\[
 G(z)=\log\left|\frac{16-z}{4(z-1)}\right|,\qquad
 V_k(z)=\operatorname{Re}\left[\left(\frac d{z-1}\right)^k-
                          \left(\frac{d z}{16-z}\right)^k\right].
\]
Both terms vanish on the outer boundary as real functions (for \(V_k\), the two complex entries have the same real part). Let \(w(z)=G(z)+\sum_{k=1}^{24} b_k V_k(z)\). The coefficients are separately computed for each parity. The approximate potential is \(w(z)+\epsilon w(-z)\). Its circular mean on the right hole is
\[
 A_\epsilon=\log 15+\epsilon\log(17/8)+
 \sum_{k=1}^{24} b_k\left[-(d/15)^k+\epsilon\{(-d/2)^k-(-d/17)^k\}\right].
\]
The finite sum has absolute value below \(1/10\) by rational replay. Both means exceed one. At \(z=1+d\zeta\) the positive Taylor modes of the logarithmic remainder, after removing the mean and the unit-circle log-radius term, have real coefficients
\[
 L_n=\frac{-(d/15)^n+\epsilon[(-d/2)^n-(-d/17)^n]}n .
\]
The regular multipole remainder from mode \(k\) is
\[
 S_k(\zeta)=-\left(\frac{d(1+d\zeta)}{15-d\zeta}\right)^k+
 \epsilon\left[\left(\frac{-d}{2+d\zeta}\right)^k-
               \left(\frac{-d(1+d\zeta)}{17+d\zeta}\right)^k\right].
\]
The singular term is just \(\zeta^{-k}\), whose real part on the cuff equals \(\operatorname{Re}\zeta^k\). Compute and round the 24 coefficients by the iteration in the [exact replay](../numerics/native_harmonic_measures.py). It checks directly that the sum over \(1\le n\le24\) of the absolute residuals \(|L_n+b_n+\sum_k b_k[\zeta^n]S_k|\) is less than \(10^{-21}\). No convergence assertion about this iteration is needed.

On \(|\zeta|=4\), the three nonconstant analytic logarithms have combined absolute bound \(\log(2(15/14)(17/16))<1\) by their power series. Here \(|S_k|\le(1/28)^k+(1/4)^k+(1/32)^k\). By Cauchy's bound the whole tail on the unit circle is at most
\[
 \frac{1+\sum_{k=1}^{24}|b_k|[(1/28)^k+(1/4)^k+(1/32)^k]}{3\,4^{24}} .
\]
Adding the low-mode residual gives \(\eta<2\cdot10^{-15}\) for each parity. Reflection gives the same absolute error on the left cuff. The maximum principle bounds the error by \(\eta\) on the whole pants. Around every point of both footprints the radius-\(1/2\) Euclidean disk is contained in the pants. Around 4 the error has odd harmonic extension through the outer circle by inversion, since its boundary value is exactly zero. The inverted part of this disk is still in the pants. On a circle of radius \(r\) where the real harmonic error is at most \(\eta\), each positive coefficient of the local holomorphic primitive is bounded by \(2\eta/r^n\) by Fourier integration. Therefore, uniformly on both native footprints,
\[
 |P_\epsilon-P_\epsilon^{\rm app}|\le4\eta,\qquad
 |P'_\epsilon-(P_\epsilon^{\rm app})'|\le16\eta .
\]
These are uniform certified derivative errors of actual harmonic fields. The approximate fields and their derivatives at any point are ordinary rational functions of \(z\) with rational coefficients.

## Two interior anchors for the actual marking

The two real anchors \(0,2\) are on the native footprints (take the projection of a framed sphere pole at an endpoint or at the midpoint of a right-hole letter). Taylor differentiation of the actual rational approximants and the disk errors gives

| Field | At 0 | At 2 |
| --- | --- | --- |
| \(P_+\) | \(0\) by parity | \((-1.378,-1.377)\) |
| \(P_-\) | \((1.92,1.94)\) | \((-0.765,-0.764)\) |

At either point the actual \(|\Phi|\le E/4<7\). In the unnormalized coordinates of this note write \(\Phi=\alpha P_+^2+\beta P_-^2\). Both parameters are real and the two evaluations imply
\[
 |\beta|<7/1.92^2<1.9,\qquad
 |\alpha|<(7+1.9(0.765)^2)/(1.377)^2<4.3 .
\]
This is a verified compact initial search rectangle for the *actual* harmonic marking. Neither component may be chosen to fit a desired Rayleigh sign. At a proposed parameter cell one must solve or bracket the nonlinear scalar equation with its three Neumann data and reject cells for which the right or outer length misses \(2\operatorname{arcosh}5\). The exchanged hole then has the right length as well. On feasible cells the first-jet bounds, the integral on the complete band, and all endpoint terms enter the sign check. The above \(10^{-15}\)-scale error applies to the basis, not to that nonlinear solution.

## Turning a trial scalar field and four parameter edges into a certificate

Here is a residual comparison allowing actual nonzero cuff errors. On a parameter box fix a smooth symmetric approximation \(\tilde u\) to the scalar field, possibly parameter-dependent. For every member let \(u\) be the exact scalar solution and \(F_p(v)=2(e^v-|\Phi_p|^2e^{-v})\). Bound
\[
 |\Delta\tilde u-F_p(\tilde u)|\le s,\qquad
 |\partial_\nu\tilde u-g|\le b
\]
on the full original pants and the original three cuffs, with \(g=-1/2,8,8\), respectively. The certified multipole residual can be included directly in \(s\) when taking the \(|\Phi_p|^2\) range. For each real symmetric Hopf parameter the exact solution comes from the hyperbolic marked double by Wolf's theorem. The circular boundary and reflection charts are the same. The lower barrier \(e^u\ge h_0=1/18000\) follows from the [explicit comparison](NATIVE_ELLIPTICITY_20261127.md), since \(|z^2-1|\le17\) on \(F\). This lower barrier uses only the scalar differential inequality and the three boundary derivatives. Set \(m=2\min(h_0,\inf e^{\tilde u})>0\). The mean derivative of \(F_p\) between \(u\) and \(\tilde u\) is at least \(m\).

The function \(B=6+2|z|^2-2\log|z^2-1|\) satisfies \(0<B<40\), \(\Delta B=8\), and \(\partial_\nu B>1\) on every cuff. At an inner circle use \(8-8/7-5>1\), and at the outer circle use \(16-4/3>1\). Write \(w=\tilde u-u\) and \((\Delta-a)w=\Delta\tilde u-F_p(\tilde u)\). Then \(a\ge m\) and \(s/m+b(B+8/m)\) dominates both \(w\) and \(-w\) by the Neumann comparison principle. In particular
\[
 |w|\le S:=s/m+b(40+8/m).
\]
An evaluated larger lower bound on the cell can improve \(m\), for example by first deriving \(S\) and then using \(e^{\tilde u-S}\). On a footprint disk of radius \(r\le1/2\), bound \(a\le A\) from \(\tilde u\pm S\) and the field intervals. At its center the Poisson and Green kernels imply
\[
 |\nabla w|\le 4S/(\pi r)+(2r/3)(s+A S).
\]
This gives continuous jet errors on the native bands if the stated residuals are validated. A piecewise linear finite element field would first need a smooth reconstruction or an estimator accounting for its derivative jumps. Its algebraic nonlinear residual does not bound \(s\).

To isolate the actual root on a small two-parameter box, let \(C(p)=(\ell_{\rm outer}(p)-L,\ell_{\rm right}(p)-L)\) use the *full* cuff lengths in \(q_p\), with \(L=2\operatorname{arcosh}5\). On all four edges use scalar and boundary intervals to enclose the integrals. A fixed invertible numerical preconditioner \(D\) may be used. If each component of \(DC\) is strictly negative on its lower parameter face and strictly positive on its upper face (reverse a row when needed), the boundary straight-line homotopy to the centered identity avoids zero. Brouwer degree then gives an interior root. The marked equal-length reconstruction identifies that root uniquely. Thus a successful local four-edge check avoids scanning the larger initial rectangle. This is a sufficient certificate; no four-edge sign is inferred from a fitted root.
