# Eliminating the log amplitude at the first crossing

28 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Author-selected lead GPT-6.2 Astra/ultra, independent backend telemetry unavailable. Checkout `7c6bbab9a0a6`. Inputs are the [B08 closing](../continuation-notes/CLOSING_B08_SLOPE_20261128.md), [quaternion frame](E14_FIRST_NEGATIVE_MODE.md) and [polar current](E17_POLAR_LOWER_BOUND.md). The fixed Riemannian product has orientation \(dt\wedge dx_1\wedge dx_2\wedge dx_3\), its parallel periodic positive-spin frame, length two and unit spatial volume. The discussion concerns exactly \(S(\psi)=J_g^4\) for full traces \(e^{\pm b}\sigma\).

## The smooth trace class and its zeros

In the parallel quaternion frame a compatible transverse first jet is \(X\mapsto Xq\), \(q\ne0\), since \(P\psi=0\) at the zero and Clifford multiplication from the negative factor is left multiplication by \(X\). All such jets have positive real determinant \(|q|^4\) in this frame. On the complement of small balls around the zeros integrate the closed three-form \(g^*\Omega\), where \(g=\psi/|\psi|\) and \(\Omega\) is the volume form on the unit quaternions normalized to integral one. Stokes equates the sum of the integrals on the small outward-oriented spheres to the integral on the outer boundary. The latter is zero, since both full end maps are constant. Each small sphere has integral one, by the homotopy of the normalized smooth field there to its invertible linearization. Thus *every* admitted smooth field on this marked product is zero-free. This derives a property of the full class from its prescribed traces and compatible transverse jets. It does not require a positive lower norm uniform over competitors.

## The exact comparison for each angular field

Write \(\psi=e^{bt+u}g\), \(u|_{\partial M}=0\), \(g|_{\partial M}=\sigma\) and \(|g|=1\). Put \(C=3/4\), and use E17's real current \(K_i=\sum_{j\ne i}(g,c_ic_j\partial_jg)\). For a one-form \(z\), \(L_g z=\Pi(z\otimes g)\) satisfies \(L_g^* L_g=CI\). From the pointwise twistor projection, \(2(L_gz,Pg)=z\cdot K/2\). Consequently the nonnegative orthogonal remainder and the shifted one-form
\[
 V=|Pg|^2-|K|^2/12,\qquad p=b\,dt+K/3
\]
give the exact squared quotient \(Q=C|p+du|^2+V\). With a general smooth unit \(g\) fixed, define
\[
 D_b(g)=\sup_{\substack{j\in L^{4/3}(T^*M)\\ \operatorname{div}j=0}}
  \int_M\!\left[p\cdot j-3C^2r^4-2CVr^2+V^2\right],\qquad
 4Cr(Cr^2+V)=|j|,\quad r\ge0.                                      \tag{1}
\]
The divergence is distributional on the interior. There is no restriction on normal flux at the two faces because the amplitude variation vanishes there.

Then \(D_b(g)=\inf_{u\in C^\infty,\,u|_{\partial M}=0} S(e^{bt+u}g)\). To see this, take the Legendre transform of \(F_V(z)=(C|z|^2+V)^2\). The maximizing vector for the transform is parallel to \(j\) and its norm satisfies the displayed cubic, giving \(F_V^*(j)=3C^2r^4+2CVr^2-V^2\), including \(j=0\). Fenchel's inequality gives the lower bound in (1) after integration by parts. Conversely coercivity and convexity give a minimizer \(u_*\) in the zero-trace \(W^{1,4}\) space by weak lower semicontinuity and Poincaré. The integrand is strictly convex in the gradient, including where \(V=0\), so this minimizer is unique. Smooth zero-end amplitudes are dense and their energies converge under strong \(W^{1,4}\) approximation. The first variation puts
\[
 j_*=4C\big(C|p+du_*|^2+V\big)(p+du_*)\in L^{4/3}
\]
in the divergence-free class. Pointwise equality for this flux proves (1) and attainment of its supremum. In particular, a flux certificate in (1) for each smooth angular map suffices for the full endpoint. A strict failure of (1) at the target for even one smooth angular map would yield a smooth strict competitor by amplitude approximation. The minimizing amplitude need not be presumed smooth in making either inference.

The unrestricted problem is now an inequality on smooth maps to the compact target \(S^3\). At \(b=51\pi/16\) the remaining statement is \(D_b(g)\ge 9b^4/8\) for every such \(g\). For \(g=\sigma\) the flux is \(4C^2 b^3dt\). The [mean obstruction](E27_POLAR_DEFECT.md) and [slice test](E30_SLICE_COMPARISON.md) show why controlling the average of \(Q\) alone cannot supply this inequality.
