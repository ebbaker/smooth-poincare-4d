# R07 — Independent replay of pole-form dependence and openness

27 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance by the R07 reader, dispatched as `gpt-6.2-sol` at ultra. Working-tree baseline `6a422ce7814f`. Inputs were the [frozen R07 request](../research-progress/handoffs/REQUEST_DEPENDENCIES_R1_20261127.md), the [B02 decision](../brainstorm/notes/B02_OPENNESS.md) (`26d3a59ecf16a90bc`), the [E01 inverse and uniqueness](../notes/E01_A1.md) (`db13563024da1a55`), the [B01 kernel conventions](../brainstorm/notes/B01_KERNEL.md) (`e8c1089f347455ac`) and the [second master's conventions](../../../master-2/research-overview/OVERVIEW.md#fixed-setting-and-conventions) (`08293b2062cfcd324`).

**Disposition.** Project theorem, replayed conditional on E01's isomorphism at weight $-1/2$ and characterization of bounded-end solutions by their leading coefficient. I checked the topology on classes, the exact choice of moving coordinates, the use of a single weighted domain and target, the parameter norm for inversion, and the estimate uniform at infinity. The sharp endpoint estimate from E01 is unnecessary for the openness step. No additional primary-source theorem enters this replay.

## Common coordinates and comparison of operators

Choose a smooth positive density $\nu$ on the closed four-manifold. The representative of volume $\nu$ is $g_\nu=(\nu/dV_g)^{1/2}g$. This formula is invariant under $g\mapsto e^{2f}g$ and depends smoothly on the representative, which implements the chosen $C^\infty$ topology. The projections defining $\Lambda^-_{c,p}$ depend continuously on $(c,p)$ and smoothly along smooth finite-dimensional families. Nearby images are identified by restriction of the reference projection, which supplies a local trivialization. Multiplication by the fixed $\nu$ identifies the B01 density-divided inputs with covariant coefficients. Passing from a nonzero coefficient to its projective line preserves the zero test by linearity.

For a nearby pair $(c_t,p_t)$ frame the new metric by Gram–Schmidt in a fixed oriented chart, starting with the frame used at $(c_0,p_0)$. On a single small ball define $F_t=\exp^{g_t}_{p_t}\circ (\exp^{g_0}_{p_0})^{-1}$ using the two framed identifications with $\mathbb R^4$. Smooth dependence and local invertibility on a common ball follow from the geodesic ODE and uniform closeness of the derivatives to those of the initial map. To extend the germ, multiply its displacement from the identity in the fixed chart by a fixed cutoff. The resulting displacement $h_t$ has a global Euclidean extension by zero with $\|Dh_t\|_\infty<1$. For each target $z$ the equation $y=z-h_t(y)$ has a unique solution by contraction. Its local inverse is smooth by the derivative bound. The map is the identity outside the chart and orientation preserving by continuity of the determinant. Thus everything pulls back to the one punctured $X_0=M\setminus p_0$.

On the common framed normal ball the metric is $\mathrm{Id}+O(|y|^2)$ uniformly, and the norm of the difference between two such remainders after division by $|y|^2$ is controlled by the corresponding difference of second derivatives. Higher estimates come from Taylor's integral formula and differentiation. With $y=x/|x|^2$, the end metric is

$$
 h_t(x)=R_x^{\mathsf T}g_t^{\mathrm{normal}}(x/|x|^2)R_x.
$$

Each $x$-derivative costs one additional power of $r^{-1}$, so $h_t-\mathrm{Id}$ has uniformly bounded differentiated $O(r^{-2})$ estimates. The estimates also control the difference from $h_0$, with constants tending to zero with the relevant finite number of metric derivatives. Parameter derivatives of positive order preserve these bounds because the degree-zero and degree-one normal Taylor coefficients are constant in the parameters.

Use the identity on the one-form domain and the projection $P_{h_0}^-|_{\Lambda^-_{h_t}}$ on the two-form row to view the elliptic operators $\widetilde D_t$ as maps into a fixed bundle. The projection is invertible for nearby data, with bounded inverse on the compact core and on every end annulus. On an annulus of radius $R$, let $u_R(z)$ denote the coefficient vector $u(Rz)$ in the Cartesian coefficient frame. With E01's weighted norms, the domain is equivalent on the end to the square sum of $R^{-\delta}\|u_R\|_{H^{k+1}}$. Similarly the target uses $R^{1-\delta}\|v_R\|_{H^k}$. Under this rescaling,

$$
 R^{1-\delta}\|[(\widetilde D_t-D_0)u]_R\|_{H^k}
 \le C\epsilon_t R^{-\delta}\|u_R\|_{H^{k+1}},
$$

with $\epsilon_t\to0$ uniform in $R$. Indeed the $C^k$ norm of the coefficients of the rescaled operator $R(\widetilde D_t-D_0)$ goes to zero on each fixed-size rescaled annulus uniformly. The zeroth-order coefficients coming from the metric derivatives have the same closeness after rescaling, and the finite interior charts give the ordinary version of the same estimate. Finite overlaps and summation give operator norm convergence. Smoothness in that norm along any smooth finite-dimensional family follows by applying these estimates to parameter derivatives. The invertibility proof then uses the bounded geometric series in the fixed target space for $1+(\widetilde D_t-D_0)D_0^{-1}$, with the same argument for differentiation of the inverse. This proof supplies neighborhoods in the smooth topology because each finite-order estimate only needs finitely many derivative bounds.

## Solutions and the infinity estimate

In the common end use the B01 coefficients in the new framed normal chart for the constant two-form $\omega_t^0$ in the $x$ coframe. It is self-dual for the limiting metric with the manifold orientation, since the inversion reverses the coordinate orientation. The one-form $A_t^0=\tfrac12\chi\,\iota_x\omega_t^0$, with fixed $\chi=1$ sufficiently far out and zero on the compact core, has $dA_t^0=\omega_t^0$ outside the cutoff region. There its wrong projection for $h_t$ is $O(r^{-2})$, varying continuously with that bound and with all finite differentiated bounds. With $\delta=-1/2$ the weighted contribution from the radius-$R$ annulus to the target norm is thus $O(R^{1-\delta}R^{-2})=O(R^{-1/2})$ before squaring. The sum converges uniformly over neighboring data and also for differences, which verifies the required right-hand-side continuity and the smooth-family parameter estimates. The scalar row stays zero since only the correction $a_t$ is in the gauge. The inverse yields $a_t$ continuous in $W_\delta^{k+1,2}$ and smooth along those families. The resulting form $d(A_t^0+a_t)$ is closed and self-dual and has the specified leading coefficient. E01's exhaustion and uniqueness identify it with the pole form.

For $k>2$ in dimension four, $H^k$ embeds in the supremum norm on smaller fixed annuli. Applying this to the rescaled gradient of $a_t$ gives

$$
 \sup_{A_R}|da_t|
 \le C R^{\delta-1}\|a_t\|_{W_\delta^{k+1,2}}
 \le C'R^{-3/2}.
$$

The second estimate holds on a single small parameter neighborhood by norm continuity of the inverse and the data. Increasing $k$ establishes all spatial derivatives on compact subsets and the claimed smooth finite-dimensional dependence. The common puncture trivialization permits the same assertions in the original moving coordinates away from the puncture. In particular, a smooth family given by source points and local source frames at fixed class gives joint smoothness in the two kernel variables off the diagonal.

For a zero-free base member, the initial constant coefficient has positive Euclidean norm. One can keep that norm uniformly positive in a neighborhood, then choose a single exterior radius for which the correction is smaller than the lower bound. On the remaining compact set the initial form has a positive minimum with respect to the reference norm, and $C^0$ convergence preserves that lower bound up to shrinking the neighborhood. The class forgetful map is open in the local product of class, point and nonzero source coefficients. This proves both versions of the asserted openness without a curvature or energy assumption.
