# SP4-TWA-E38 · Independent angular length and relative degree replay

28 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. The [frozen request](../research-progress/handoffs/E38_REQUEST_v1.md) specifies a non-author GPT-6.2 Sol/ultra helper. Actual serving model and effort were unavailable. HEAD was `7c6bbab9a0a66532d81599b3dd0952f5a371c8d4`. Both frozen SHA-256 digests matched. The reviewer authored neither frozen input.

The unrestricted length estimate and the four-stage strict action comparison pass. The oriented relative degree of the specified trial is \(-1\) with the conventions below. The same relative homotopy class has representatives of arbitrarily small length.

## Temporal energy and length

Take the oriented flat Riemannian product \(M=[-1,1]\times Y\), with \(Y=(\mathbb R/\mathbb Z)^3\) of unit volume and with the periodic spin lift. Write the nowhere-zero positive spinor in the parallel quaternion frame as \(\psi=e^{bt+u}g\), with \(|g|=1\), \(g|_{\partial M}=1\) and \(u|_{\partial M}=0\). The compatible-zero count covers the entire admitted smooth trace class. Set \(b=b_{\rm H}=51\pi/16\), \(D=2\), \(Q=|P\psi|^2/|\psi|^2\), \(Q_0=3b^2/4\), \(S=\int_M Q^2\), \(p=-\int_M K_0\), \(T_t=\int_M|\partial_tg|^2\) and \(X=\int_M|d_xg|^2\). The radial action is \(DQ_0^2=9b^4/8\). With \(\Delta=\int_M Q-DQ_0\), the independently replayed projected mean estimate gives

\[
\Delta\ge \tfrac23(T_t+X)-\tfrac b2p+\tfrac{p^2}{12D}.
\tag{1}
\]

The discarded amplitude term is a nonnegative square for every smooth zero-end \(u(t,x)\). [E36 projected mean](E36_UNRESTRICTED_REPLAY.md#current-norm-and-the-projected-mean) · [E33 zero count](E33_AMPLITUDE_ENVELOPES_REPLAY.md#zero-count)

To bound \(p\), take the spatial Fourier coefficients \(g_\xi(t)\) in the complexification of the real quaternion fiber, with \(\xi\in 2\pi\mathbb Z^3\). The Hermitian symbol \(i\sum_{j=1}^3\xi_j c_0c_j\) has square \(|\xi|^2I\) and vanishes for \(\xi=0\). Thus

\[
|p|\le\sum_{\xi\ne0}|\xi|\,\|g_\xi\|_{L^2_t}^2
\le \tfrac{X}{k},\qquad k=2\pi.
\]

As \(Q\ge0\), Jensen implies that \(S<DQ_0^2\) forces \(\Delta<0\). Then (1) requires \(p>0\), and substituting \(X\ge kp\) gives, with \(a=3b/4-k=25\pi/64\),

\[
 T_t<ap-\tfrac{p^2}{8D}
      =2Da^2-\tfrac{(p-4Da)^2}{8D}\le 2Da^2.
\]

As the time interval has length two, \(L(g)=\int_{-1}^1\|\partial_t g(t,\cdot)\|_{L^2(Y)}\,dt\le\sqrt{2T_t}\). A strict competitor therefore has \(L(g)<25\sqrt2\pi/32\). For an action tie the argument gives weak inequalities. At a tie with \(p=0\), (1) forces \(dg=0\) and the amplitude square forces \(du=0\), so the traces fix the radial field. The same energy estimates apply in the relaxed polar \(W^{1,4}\) class because (1) and the quadratic Fourier bounds hold there and \(g\) is absolutely continuous in time with values in \(L^2(Y)\). [E17 spatial symbol](../notes/E17_POLAR_LOWER_BOUND.md#sharp-helicity-bound) · [B09 relaxed class](../notes/B09_POLAR_COMPACTNESS.md)

## The four prescribed rotations

Let \(A=e^{\mathbf i kx_1}\mathbf j\) and \(B=e^{\mathbf i kx_2}\). The successive pairs \((1,A),(A,B),(B,\mathbf j),(\mathbf j,1)\) each consist of pointwise orthogonal unit quaternions. On each stage, \(g=\cos\theta\,U+\sin\theta\,V\) with \(\theta\) increasing from zero to \(\pi/2\) and flat at the endpoints. The phases have unit modulus, and \(|\partial_tg|=|\theta'|\) pointwise. The volume of \(Y\) is one, so each stage has \(L^2(Y)\) length exactly \(\pi/2\). Arbitrary stage durations and all the allowed time profiles give \(L=2\pi\), hence \(T_t\ge2\pi^2\). Completing the scalar square in (1) gives the uniform lower bound

\[
\Delta\ge\tfrac23(T_t-2Da^2)
\ge\tfrac23\big[2\pi^2-4(25\pi/64)^2\big]
=\tfrac{1423\pi^2}{1536}>0.
\]

Jensen therefore gives \(S>DQ_0^2\) for every allowed timing and every smooth zero-end log amplitude, including amplitudes with \(x_3\) dependence.

For the degree, orient \(N=[-1,1]\times T^2_{12}\) by \(dt\wedge dx_1\wedge dx_2\), and orient the unit quaternion sphere by the outward normal in the ordered coordinates \((1,\mathbf i,\mathbf j,\mathbf k)\). The first, third and fourth stages depend on at most one spatial angle and give zero pullback of the volume three-form. Write \(\alpha=kx_1\), \(\beta=kx_2\), \(c=\cos\theta\) and \(s=\sin\theta\). On the second stage,

\[
g=(s\cos\beta,s\sin\beta,c\cos\alpha,c\sin\alpha),
\qquad
\det[g,g_\theta,g_\alpha,g_\beta]=-sc.
\]

The determinant follows at \(\alpha=\beta=0\) and is unchanged by rotations in the two complex lines. The unnormalized volume integral is \(-k^2\int_0^{\pi/2}\sin\theta\cos\theta\,d\theta=-2\pi^2\). Dividing by the volume of the unit \(S^3\) gives the signed relative degree \(-1\), of absolute value one. Both end maps are constant, so the integral pairs the pullback under \(g:(N,\partial N)\to(S^3,\{1\})\) with the relative fundamental class. [Frozen trial](../notes/B09_ANGULAR_LENGTH.md)

## Scope of the degree and the remaining comparison

The same relative homotopy class has smooth representatives with arbitrarily small \(L\). To see this directly, use a timing with positive derivative on the middle stage. Every allowed timing is homotopic to this one relative to the ends by interpolating the continuous total rotation parameters in \([0,2\pi]\). The value \(q_*=(\mathbf i+\mathbf k)/\sqrt2\) has exactly one preimage on \(N\), at \(\theta=\pi/4\), \(\alpha=\beta=\pi/2\) in the middle stage. The determinant above shows it is regular. The other stages omit \(q_*\) because at least one complex line there has real phase. A sufficiently small spherical cap about \(q_*\) therefore has its whole inverse image inside a coordinate ball in the interior of \(N\).

Postcompose the trial with a based map of \(S^3\) that sends the cap complement to \(1\) and is based homotopic to the identity. For an explicit construction, let \(r\) denote distance from \(q_*\), take a smooth radial profile \(R(r)\) that is linear near zero and equal to \(\pi\) outside a slightly smaller cap, and interpolate from \(r\) to \(R(r)\). The resulting radial maps \(\Phi_s\) are smooth at the two poles because their radial profiles are linear in the distance to each pole near that pole. Normalize each by left multiplication by \(\Phi_s(1)^{-1}\). The homotopy now fixes \(1\), and its final composition with the trial is a field \(\tilde g\) equal to \(1\) outside a compact subset of the coordinate ball.

Rescale this ball isotropically by \(\epsilon\in(0,1]\) in the three coordinates \((t,x_1,x_2)\) and extend by \(1\), keeping independence of \(x_3\). This is a relative homotopy through smooth fields for positive \(\epsilon\). There are two spatial coordinates in the slice integral, so the factor \(\epsilon^{-1}\) in \(\partial_tg\) cancels the square root of the spatial Jacobian and \(L(g_\epsilon)=\epsilon L(\tilde g)\). Moreover \(T_t(g_\epsilon)+X(g_\epsilon)=\epsilon[T_t(\tilde g)+X(\tilde g)]\) and \(p(g_\epsilon)=\epsilon^2p(\tilde g)\), since \(K_0\) contains one spatial derivative. The right-hand side of (1) is strictly positive for all sufficiently small \(\epsilon\), uniformly over the choice of log amplitude. The rescaling proves that the infimum of the length in this degree class is zero.

For the mixed spectrum, the length criterion follows from the mean bound and is necessary for strict improvement. There are mixed fields with a strict mean deficit and a strict action excess. For example, fix a sufficiently small nonzero helix parameter and its mean-minimizing amplitude from E27, for which both strict signs hold. With that amplitude fixed, multiply its angular field on the left by \(\exp[\mathbf i\eta\chi(t)\cos(4\pi x_2)]\), where \(\chi\) is a nonzero smooth interior cutoff and \(\eta\) is a small nonzero real number. This preserves the unit norm and traces. The mode with spatial vector \((0,\pm4\pi,0)\) has nonzero derivative in \(\eta\) at zero because the original helix has a nonzero spatial mean. The first-shell helical modes persist by continuity. Both strict signs persist by continuity in \(C^1\), so these mixed fields also obey the length bound. Deciding the general comparison at \(51\pi/16\) still requires control of the variance of \(Q\), an equivalent full-action comparison, or a strict action trial. [E27 helix and variance](../notes/E27_POLAR_DEFECT.md#quartic-variance-and-the-full-action) · [E37 first spatial shell](E37_SPATIAL_SHELL_REPLAY.md)
