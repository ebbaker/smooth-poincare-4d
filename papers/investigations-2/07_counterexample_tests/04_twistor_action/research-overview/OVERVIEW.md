# The relative twistor action and its boundary data

28 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Actual serving variant and reasoning effort unavailable. Baseline `86b24d9f9c2d` plus the [working-tree inputs](../references/README.md). Setup preserves the evidence status of those inputs.

## Fields and action

Let \((M,g)\) be a smooth, compact, oriented spin four-manifold with a smooth Riemannian metric, with or without smooth boundary. Use smooth commuting sections \(\psi\not\equiv 0\) of the complex rank-two positive half-spin bundle \(S_g^+\), the chirality on which real self-dual two-forms act. The spin connection is the Levi–Civita lift. Use \(X\cdot X=-|X|_g^2\), \(D_g=\sum_{i=1}^4 e_i\cdot\nabla^g_{e_i}\) and \((P_g\psi)(X)=\nabla_X^g\psi+\tfrac14X\cdot D_g\psi\). Pair all variations by the real part of the Hermitian product. The classical Euclidean action is exactly

\[
S_g[\psi]=J_g(\psi)^4=\int_{M\setminus Z(\psi)}\frac{|P_g\psi|^4}{|\psi|^4}\,dV_g.
\]

For the initial variational problem fix \(g\), fix the spin data and require a nonzero boundary trace. Start on zero-free domains, then allow isolated transverse interior zeros. At a transverse zero \(p\), \(|\psi|\asymp r\). A finite action requires \(P_g\psi(p)=0\), equivalently \(\nabla_X^g\psi(p)=X\cdot a_p\) with \(a_p=-D_g\psi(p)/4\ne0\). In that case \(P_g\psi=O(r)\); an incompatible first jet gives a logarithmic divergence. The initial admissible variations fix the zero set and first jets, including by taking support away from zeros. Extensions must specify the variations of zeros and jets and justify differentiation and integration by parts on the punctured domain. The closed homotopy four-sphere initialization in DIR-E06 gives one admissible field at a prescribed zero for a supplied metric. [Jet construction](../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E06_20261124.md) · [Admissibility criterion](../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E07_20261124.md)

For \(h=f^2g\), \(f>0\) smooth, transport by \(\psi_h=f^{1/2}\beta\psi\) with the unitary conformal spin identification \(\beta\). The norm of \(P_h\psi_h\) has weight \(-1/2\), and that of \(\psi_h\) has weight \(+1/2\). The quotient has weight \(-1\), cancelled at fourth power by the volume weight \(+4\). The action is dimensionless and invariant under constant nonzero complex field rescaling and this joint conformal change. On \(M\setminus Z(\psi)\) the induced scale is \(h=|\psi|^{-4}g\), with unit spinor \(\phi=|\psi|^{-1}\beta\psi\) and \(S_g[\psi]=\int |P_h\phi|_h^4\,dV_h\). Here \(h\) depends on \(\psi\); fixing \(h\) and varying a unit spinor is a different problem. The zero-infimum criterion in DIR-E07 is a fixed-conformal-class statement. [Conformal transport](../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E07_20261124.md) · [Induced scale](../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E10_20261124.md)

## Normalization of inherited calculations

The [canonical action note](../../02_invariants/notes/RELATIVE_TWISTOR_ACTION.md) uses \(S_{\mathrm{old}}=\tfrac14 J_g^4\). The formulas here are its factor-four conversion. If \(W=|\psi|^{-4}|P_g\psi|^2P_g\psi\) and \(\nu\) is the outward unit normal, the inherited variation on a compact zero-free domain becomes

\[
\delta S_g(\psi;\eta)=4\int_M\operatorname{Re}\Big\langle
P_g^*W-\frac{|P_g\psi|^4}{|\psi|^6}\psi,\eta\Big\rangle\,dV_g
+4\int_{\partial M}\operatorname{Re}\langle W(\nu),\eta\rangle\,dA_g.
\]

The stationary equation for fixed boundary trace is the same for both normalizations. The normal momentum is \(4W(\nu)\) paired against the trace with \(dA_g\), or the corresponding momentum density when the surface measure is included in the covector. Any specified nonzero boundary momentum must be converted to the present normalization. At a nonvanishing twistor solution on a compact domain the expansion starts at fourth order and the Hessian vanishes, including at a constant parallel spinor in the flat control. The zero Hessian leaves no Gaussian kinetic operator there.

For the flat \([0,L]\times T^3\) with \(L>0\), the periodic spin structure and a unit parallel \(\psi_0\), use \(\psi=e^{u(t)}\psi_0\) and \(V=\operatorname{Vol}(T^3)\). The inherited identity \(|P\psi|^2=\tfrac34 e^{2u}|\dot u|^2\) gives the following converted radial formulas:

\[
S_{\mathrm{rad}}[u]=\frac{9V}{16}\int_0^L|\dot u|^4\,dt,\qquad
S_{\mathrm{cl}}(u_0,u_1)=\frac{9V}{16L^3}(u_1-u_0)^4,
\qquad p=\frac{9V}{4L^3}(u_1-u_0)^3.
\]

The affine radial path is stationary under smooth fixed-end spinor variations, as in the inherited calculation. For radial logarithmic endpoint coordinates the outward covectors are \((-p,p)\). Their graph is the graph of \(dS_{\mathrm{cl}}\) in \(T^*(\mathbb R\times\mathbb R)\), with a reversed sign on the incoming cotangent factor in the canonical-relation convention. The graph remains well defined at \(u_0=u_1\), where the radial momentum map has zero derivative in the velocity variable. The formula covers the radial graph. Existence, smooth parameter dependence and maximality for arbitrary spinor traces are open in this setup. [Flat cylinder calculation](../../02_invariants/notes/RELATIVE_TWISTOR_ACTION.md#a-boundary-relation-on-a-flat-product)

## Boundary relation, gluing and a possible cobordism

The proposed boundary relation records the traces and outward covectors of critical fields for a specified domain and class of solutions. A differentiable on-shell generating functional on admissible boundary data supplies isotropy in the appropriate cotangent trace space under the hypotheses of the cited variational framework. Establishing a general Lagrangian relation will require a precise trace space and duality, regularity of the critical-field family and the relevant maximality test. For a collared cut \(Y\), use a common spin identification, common field trace and opposite outward covectors. The resulting cancellation is a first-variation gluing test. The seam regularity needed for a smooth glued solution and the solvability and cleanliness needed for composition are further questions. The first control uses two flat cylinders joined along \(T^3\), including the zero-velocity case. [Boundary source record](../references/README.md)

A symplectic Lagrangian cobordism in the sense of Biran–Cornea is a different geometric object. The proposed route must identify a symplectic target, the additional symplectic plane or strip coordinates and the actual embedded Lagrangian with specified cylindrical ends in the product. It must check Lagrangian dimension and vanishing symplectic pullback, and the end, properness and any extra Floer hypotheses relevant to the exact claim. This geometric construction remains a question after the radial boundary graph. [Cobordism source record](../references/README.md)

If a specific comparison needs a regular quadratic fluctuation operator, freeze a positive prescribed background scale \(\rho\) of conformal weight \(+1/2\) and consider the inherited comparison \(S_{2,\rho}=\tfrac12\int_M\rho^{-6}|P_g\psi|^2\,dV_g\), with fixed-scale Hessian \(P_g^*\rho^{-6}P_g\). Its factor \(1/2\) belongs to the separate quadratic definition. Compare it on the same data where defined and track dependence on \(\rho\). The primary question remains the quartic action.

Any candidate smooth invariant must account for metric and auxiliary dependence, equivalence of cuts and deformation or gluing on the relevant family. This branch initially tests the classical action and its boundary geometry. [Field-theory owner](../../03_field_theory/README.md) · [Invariant comparison owner](../../02_invariants/README.md) · [Finite plan](../research-plan/PLAN.md)

## Current finite-amplitude comparison

At \(b=51\pi/16\) the smooth admissible class on the marked cylinder has zero-free members only, by the common sign of compatible transverse indices. Its full amplitude can be eliminated exactly for each angular map. The radial field is the unique minimizer on the zero plus first favorable spatial angular eigenspace with free amplitude. In the unrestricted problem the positive threshold satisfies \(17\pi/6<b_G\le51\pi/16\). A strictly earlier transition would have a second relaxed minimizer at \(b_G\). [B09 results and open inequality](../continuation-notes/CLOSING_B09_ENDPOINT_20261128.md)
