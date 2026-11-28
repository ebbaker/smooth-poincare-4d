# E08 · Non-author replay of the signed second-collar moments

28 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex assistance. Fixed E replay, request 1. The request designates GPT-6.2 Sol/ultra for dispatch. The executing Codex helper is GPT-6 based. Exact serving variant and effort were unavailable. Base 6a422ce7814fe1ad278d6904970e3b19b05a9890. The reader wrote the E07 cover and did not author the lead's shell-moment argument. Analytic replay on the single frozen marked specimen. [Request](../research-progress/handoffs/REQUEST_E08_COLLAR_MOMENT_REPLAY_20261127.md) · [Lead proof](../notes/E08_SIGNED_COLLAR_MOMENTS.md) · [Versioned return](../research-progress/handoffs/RETURN_E08_MOMENT_REPLAY_20261127.md)

## Marked chart, norms and exact clearances

Write \(\tau=t'=1+s\) at the second seam and \(\theta=2\pi t\) in the E07 marking. The cap and retained collar through \(s=1/16\) have the same metric \(d\tau^2+\sinh^2\tau\,d\theta^2+g_{S^2}\). In \(w=\tanh(\tau/2)e^{i\theta}\), the disk part is \(4|dw|^2/(1-|w|^2)^2\). For the Cayley map \(\xi+ib=i(1+w)/(1-w)\), the formulas \(b=(1-|w|^2)/|1-w|^2\) and \(\lvert d(\xi+ib)/dw\rvert=2/|1-w|^2\) give \(b^{-2}(d\xi^2+db^2)\). The positive holomorphic Jacobian preserves the disk orientation. Under \(Z=(\xi,Y)=(\xi,bn)\), \(d^4 Z=b^2\,d\xi\wedge db\wedge dA\) in the target's Cartesian order. This agrees with the positive disk-then-sphere orientation and with the signed seam chart. Also \(g_{\rm E}=d\xi^2+db^2+b^2g_{S^2}\), so \(h=b^{-2}g_{\rm E}\) here. For a two-form \(F\) the physical norm is \(b^2|F|_{\rm E}\) and \(d\operatorname{vol}_h=b^{-4}\,d^4Z\). Thus the squared norm integrated against volume has the same value in both metrics, with no extra factor. [B04 analytical decision](../brainstorm/notes/B04_ANALYTIC_METHOD_20261127.md) · [E07, signed seam charts](../notes/E07_MARKED_ATLAS.md#2-cartesian-caps-and-signed-seams)

Put \(a_\pm=1\pm1/16\). In the half-plane the image of \(\tau<a\) satisfies
\[
 \xi^2+(b-1)^2<\tanh^2(a/2)(\xi^2+(b+1)^2),
\]
which simplifies to the disk with center \((0,\cosh a)\) and radius \(\sinh a\). Its lower endpoint is \(b=e^{-a}>0\), so crossing \(Y=0\) introduces no chart degeneracy. Write \(D_a\) for its image after adding the sphere as in \(Z\), and \(\Gamma_1=\partial D_1\). For \(a<a'\), the minimal Euclidean distance of the two profile circles is
\[
 \sinh a'-\sinh a-\cosh a'+\cosh a=e^{-a}-e^{-a'}.
\]
The triangle inequality gives the lower bound and the two lower endpoints attain it. Since \((\xi,Y)\mapsto(\xi,|Y|)\) is 1-Lipschitz, the same lower bound holds for the four-dimensional boundaries. Choosing a common \(n\) over the two lower endpoints attains it there as well. Thus the exact clearances from \(\Gamma_1\) are \(e^{-15/16}-e^{-1}\) inward and \(d=e^{-1}-e^{-17/16}\) outward. The former equals \(e^{1/16}d>d\). Consequently the open \(d\)-ball around every seam point is contained in \(S=D_{a_+}\setminus\overline{D_{a_-}}\), the physical region \(-1/16<s<1/16\).

## Signed sampling constant and propagation

Let \(F_u\) be the flat-coordinate expression of the actual \(L u\) for one fixed B04 unit input \(u\), including the first trial \(u_1\). The output pairing uses a fixed Euclidean unit self-dual two-form \(\beta\), with \(f_u=\langle F_u,\beta\rangle_{\rm E}\). Middle-degree conformal invariance and the orientation computation give \(*_{\rm E}F_u=F_u\). Since \(dF_u=0\), \(d_{\rm E}^*F_u=0\) as well, and each Cartesian coefficient, hence \(f_u\), is harmonic on \(D_{a_+}\). For \(0<\ell<d\), set \(k_\ell(Z)=C(1-|Z|^2/\ell^2)_+^2\), \(C=12/(\pi^2\ell^4)\). Using \(|S^3|=2\pi^2\) and \(t=r^2/\ell^2\), independently
\[
 \int_{\mathbb R^4} k_\ell
   = C\pi^2\ell^4\int_0^1t(1-t)^2\,dt=1.
\]
The integral is supported in the shell after translation by any seam point. The radial spherical-mean identity for the harmonic scalar consequently gives \(\int_S k_\ell(Z-z)f_u(Z)\,d^4Z=f_u(z)\) for every \(z\in\Gamma_1\).

For unit \(v\), on its support \(\partial_v k_\ell=-4C(v\cdot Z)(1-|Z|^2/\ell^2)/\ell^2\), and the function and gradient vanish at the support boundary. The angular average of \((v\cdot Z)^2\) is \(r^2/4\), so that
\[
 \|\partial_v k_\ell\|_2^2
 =4C^2\pi^2\ell^2\int_0^1 t^2(1-t)^2\,dt
 =\frac{96}{5\pi^2\ell^6}.
\]
Applying the \(L^2(\mathbb R^4)\) integral of this derivative along a straight translation from \(z\) to \(z_j\) bounds the norm of the difference of those two kernels by \(|z-z_j|\sqrt{96/5}/(\pi\ell^3)\). The norm of the extended scalar \(1_S f_u\) is at most \(\sqrt{G_S(u)}\), where \(G_S(u)=\int_S |F_u|_{\rm E}^2\,d^4Z\) equals the physical two-form energy by the preceding norm computation.

For the proposed grid use \(N\) equal subdivisions of the profile angle, colatitude, and sphere longitude, with the poles included. Nearest grid angles differ by at most \(\pi/N,\pi/(2N),\pi/N\), respectively. Moving only along the profile circle costs at most \(\pi\sinh 1/N\) in \(\mathbb R^4\) at fixed \(n\). Moving along the sphere coordinate curves costs at most \(3\pi e/(2N)\) because \(b\le e\) on the profile and the longitude circle has unit-sphere radius at most 1. This yields the claimed Euclidean net radius \(\pi(\sinh 1+3e/2)/N\). The grid profile angle is independent of the physical longitude. The inverse Cayley map is \(w=(\xi+ib-i)/(\xi+ib+i)\), and its argument gives the marked \(t=\arg(w)/(2\pi)\). The outward continuation is exactly \(\Phi_2(t,(1+s)n)\).

For any \(\eta\)-net the reproduction formula and Cauchy–Schwarz give
\[
 \inf_{\Gamma_1} f_u \ge
 \min_j m_j(u)-\eta\,\frac{\sqrt{96/5}}{\pi\ell^3}\sqrt{G_S(u)}=A(u).
\]
The harmonic minimum principle on \(\overline{D_1}\subset D_{a_+}\) propagates this to the whole original second cap. If \(A(u)>0\), then \(\inf_{C_2}|Lu|_h\ge e^{-2}A(u)\) because \(|F_u|_{\rm E}\ge f_u\) and \(b\ge e^{-1}\) on \(\overline{D_1}\). This particular shell test propagates inward from the seam \(\Gamma_1\). A bound on the true outer interface \(\partial D_{a_+}\) can propagate across the larger \(D_{a_+}\); the seam moments do not alone furnish that bound.

## Dependence on the global source and verdict

In the normalization of A1 §2, \(D_h=(d_h^*,\sqrt2 P_h^-d)\). The fixed end potential \(A_{\rm end}(u)\) from B04 has zero restriction in a neighborhood of the shell. With \(f_{\rm end}=-\sqrt2 P_h^-dA_{\rm end}(u)\), the weighted A1 construction gives \(Lu=d(A_{\rm end}(u)+D_h^{-1}(0,f_{\rm end}))\) for solving weight \(-1/2\). On the shell the first term drops out. The moment is therefore a signed pairing of the marked coordinate image of the actual global inverse response. Its sign is relative to the oriented test form \(\beta\). The unsigned shell energy controls the variation error. The signs require separate moment enclosures. [A1, §§2–3](../notes/E01_A1.md) · [B04, fixed cutoff and solve](../brainstorm/notes/B04_ANALYTIC_METHOD_20261127.md)

**Accepted in the stated scope.** All constants, the two clearances, the physical mark, the sign convention, and the propagation on the original second cap reproduce. No numerical campaign was run. A strict certificate needs lower enclosures of the actual signed \(m_j(u)\) and an upper enclosure of the actual \(G_S(u)\) that give \(A(u)>0\). The replay leaves those enclosures open, along with the proof for every other core piece.
