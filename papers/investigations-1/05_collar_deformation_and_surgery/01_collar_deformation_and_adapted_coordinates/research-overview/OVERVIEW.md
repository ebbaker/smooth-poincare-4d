# Matching a marked sphere to a round cylinder

26 November 2026 · For Edward B. Baker III with OpenAI Codex assistance. [Scientific inputs and versions](../references/README.md) · [Plan](../research-plan/PLAN.md) · [Register](../research-progress/REGISTER.md)

Work on a smooth embedded bicollar of a cooriented $S^3$ in a Riemannian four-manifold. The outer faces are attached to specified pieces. A spacetime or complex twistor construction would require a separate Riemannian interpretation. For intrinsic spinor tests use the Levi–Civita spin connection of the tested metric. A freely deformed intrinsic metric needs an additional realization to invoke an immersion-specific recognition threshold.

## Physical input for a new comparison

For a specified physical metric, identify the proposed recognition mechanism, the saving required at the finite minimizing index, or the instability to be tested at an exact minimizer. Price the native widths, jets, positive protected core, all connectors and both signs on both whole sides. If the problem is instead the first entering metric on a new type, send the actual data to 07. The prescribed seam test can exclude a trial before any interpolation, while a passing test leaves the full collar cost open. [Physical acceptance criteria](../../research-plan/PLAN.md#conditional-analytic-work) · [07 seam test](../../../07_positive_subcritical_entry/research-overview/OVERVIEW.md#a-test-on-the-proposed-seam)

## The exact model and the first approximate one

In Gaussian normal coordinates write $g=dt^2+h_t$. Set $K=\frac12\partial_t h_0$, $H=\operatorname{tr}_{h_0}K$, and $K^\circ=K-Hh_0/3$. The target is $[h_0]=[\gamma_{\rm rd}]$ under a compatible angular marking and $K^\circ=0$. For $\widehat g=e^{2u}g$ the new second fundamental form is $e^u(K+\nu(u)h_0)$. The value of $u$ prescribes the round face metric. Independently setting $\nu(u)=-H/3$ there makes the face totally geodesic. Extend the factor smoothly and take normal coordinates again. Record the transported angular marking on both sides. [Conformal hypersurface sources](../references/README.md)

The discussion supplied the following fixed-source calculation for independent replay. In the resulting gauge $h_t-\gamma_{\rm rd}=O_g(t^2)$. For a smooth cutoff equal to one near zero and supported in $|t|<w$, put

$$
 h_{t,s}=\gamma_{\rm rd}+(1-s\chi(t/w))(h_t-\gamma_{\rm rd}),\qquad 0\le s\le1 .
$$

For smooth fixed data, tangential derivatives of the mismatch also vanish to the indicated order. The normal derivatives of the cutoff cost $O(1/w)$ and $O(1/w^2)$. The two powers of $t$ keep curvature bounded throughout the path. Each side then spends at most $O_g(w)$ in either chiral energy on the changed strip. The constant depends on the supplying geometry. An exact product can be stretched after both ends have been matched.

For approximate data the twice-differentiated cutoff acts on $h_0-\gamma_{\rm rd}$ at order $w^{-2}$ and on $\partial_t h_0$ at order $w^{-1}$ on the transition. These are curvature terms. Squaring and integrating also depends on the tangential derivatives, quadratic metric terms, choice of gauge, area, full curvature and width on each side. Price the initial adjustment to a matched face, including any change to the exterior. The [first-order splice lemma](../../../../master/manuscript/first_order_splice.tex) provides a comparison in a supplied annular chart. Establishing analogous control from selected face data is the new question.

## Finding the section and choosing coordinates

On a proposed sphere $\Sigma$ with induced metric $h$, test the dimensionless quantity

$$
 \mathcal D_g(\Sigma)=\int_\Sigma (|K^\circ|_h^3+|\operatorname{Cotton}(h)|_h)\,dA_h .
$$

Use the three-covariant Cotton tensor of the intrinsic three-metric. The two integrals are conformally invariant. Vanishing Cotton makes the smooth compact simply connected $S^3$ conformally round up to a diffeomorphism. An actual identification must still respect or transport the application's marking. A candidate selection varies the embedded section in a fixed metric while keeping the designated regions on opposite sides. Tiny regular spheres illustrate the need for that restriction. For deformations of the metric, the quantity to budget is the joined path cost and its two side costs. An arbitrarily inserted round germ can spend all of its energy near the outer faces. Small $\mathcal D$ alone has no established width-dependent splice estimate. [Sources for the face functional](../references/README.md)

A self-dual frame has three axes. A zero column of $W^+$ requires a kernel, and a single vanishing complex null evaluation can coexist with a large Weyl block. On an umbilic slice Codazzi gives $W(\nu,X,Y,Z)=0$ for tangent $X,Y,Z$. In a Euclidean hypersurface immersion a principal direction of its shape operator gives the same mixed vanishing by Gauss. To use that direction as the normal to leaves, test $\nu^\flat\wedge d\nu^\flat=0$ where the field is smooth. Then check the topology of a complete leaf, its marked intrinsic geometry and its actual width. The [sections estimates](../../../03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex) and the [spinorial projected derivative](../../../03_first_order_twistor/02_dirac_and_twistor_spinors/manuscript/dirac_twistor_and_yamabe_rigidity.tex) measure the curvature of a supplied metric. An independent estimate on the adapted coordinates or fields is needed to bound the cost of changing it.

For the actual energy on a collar region $U$, take a nowhere-zero positive half-spinor $\psi$ there and an orthonormal frame $(\omega_a)$ of self-dual two-forms. On positive half-spinors the self-dual curvature block contains $W^++(s_g/12)I$. Removing the scalar part isolates its three Weyl contributions. With the spin manuscript's Clifford action $c$, twistor operator $P$ and orthogonal projection $\Pi$ to the kernel of Clifford contraction, its identity gives

$$
E_+(g;U)
=\frac12\int_U\sum_{a=1}^3\frac{|c(W^+\omega_a)\psi|^2}{|\psi|^2}\,dV_g
=2\int_U\frac{|\Pi(d^\nabla P\psi)^+|^2}{|\psi|^2}\,dV_g .
$$

A frame rotation preserves the sum. An adapted normal can expose a geometric vanishing in the curvature tensor. Any resulting advantage for surgery must be measured in the total energy along the deformation and the cost of reattaching the two ends. [Proof and normalization, proposition `prop:weyl-defect`](../../../03_first_order_twistor/02_dirac_and_twistor_spinors/manuscript/dirac_twistor_and_yamabe_rigidity.tex)
