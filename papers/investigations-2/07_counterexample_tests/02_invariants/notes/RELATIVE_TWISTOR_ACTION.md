# A classical action for the relative twistor error

28 November 2026, for Edward B. Baker III with OpenAI Codex assistance. Working-tree input at 86b24d9f9c2d. Fixed-metric calculation with an independent Sol/ultra reading of the variation. Exact serving settings unavailable.

Let the field be a smooth commuting positive half-spinor on an oriented Riemannian spin four-manifold. With the repository convention for Clifford multiplication, use the Euclidean action

\[
 S_g[\psi]=\frac14J_g(\psi)^4=\int_{M\setminus Z(\psi)}
             \frac{|P_g\psi|^4}{4|\psi|^4}\,dV_g .
\]

This density depends on the first jet and integrates additively over pieces. The action is dimensionless, invariant under constant nonzero rescaling of the field and conformally invariant under the joint change \(h=f^2g,\ \psi_h=f^{1/2}\beta\psi\). On the nonzero locus one may set \(h=|\psi|^{-4}g\) and \(\phi=|\psi|^{-1}\beta\psi\). Then the same action is the quartic twistor energy of a unit spinor in its own conformal scale. Varying \(\psi\) varies this scale too. [DIR-E07, zeros and conformal covariance](../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E07_20261124.md) · [DIR-E10, spinor scale](../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E10_20261124.md)

Put \(W=|\psi|^{-4}|P_g\psi|^2P_g\psi\). On a compact domain on which the spinor does not vanish, varying \(\psi\) by \(\eta\) gives

\[
 \delta S=\int_M\operatorname{Re}\left\langle
 P_g^*W-\frac{|P_g\psi|^4}{|\psi|^6}\psi,\eta\right\rangle dV_g
 +\int_{\partial M}\operatorname{Re}\langle W(\nu),\eta\rangle\,dA_g .
\]

Here \(\nu\) is outward and \(W\) is Clifford-trace-free, so projecting the covariant derivative in \(P_g\) introduces no additional boundary factor. This gives the bulk equation and the normal momentum. An exact twistor field minimizes the action at zero. On a region where such a field stays nonzero the Taylor expansion starts in fourth order, and there is no Gaussian kinetic term about that solution. At a transverse zero, \(|\psi|\asymp r\). Smoothness makes the ratio locally bounded if \(P_g\psi(p)=0\). Otherwise the radial integral diverges as \(\int dr/r\). Variations across a zero must preserve the allowed first jet or the action can immediately become infinite.

## A boundary relation on a flat product

Take \([0,L]\times T^3\) flat, the periodic spin structure, a unit parallel spinor \(\psi_0\), and boundary data in its positive real ray. Write \(\psi=e^{u(t)}\psi_0\) and \(V=\operatorname{Vol}(T^3)\). The twistor projection satisfies \(|P\psi|^2=|\nabla\psi|^2-|D\psi|^2/4=3e^{2u}|\dot u|^2/4\). Consequently

\[
 S=\frac{9V}{64}\int_0^L|\dot u|^4dt,\qquad
 S_{\rm cl}(u_0,u_1)=\frac{9V}{64L^3}(u_1-u_0)^4 .
\]

The solution has affine \(u\). It is stationary under all smooth spinor variations vanishing at the ends. Indeed translation invariance on the torus reduces the first variation to that of the averaged variation. For arbitrary spatially constant spinors the action is \(9V/64\) times the quartic path energy on the product of the real log-radius line and the unit spinor sphere, using \( |d\psi|^2/|\psi|^2=du^2+|d(\psi/|\psi|)|^2\). The affine radial path is a constant-speed geodesic of this product. The graph of \(dS_{\rm cl}\) is an exact Lagrangian in the cotangent space of the two **radial** endpoint values. With outward signs the two momenta are \((-p,p)\), \(p=9V(u_1-u_0)^3/(16L^3)\). General boundary spinors and cobordisms between Lagrangian submanifolds pose separate problems.

If a quadratic fluctuation operator is wanted, one possible related action uses a prescribed smooth positive scale \(\rho\) of the same conformal weight as \(\psi\):

\[
 S_{2,\rho}=\tfrac12\int_M \rho^{-6}|P_g\psi|^2dV_g .
\]

The conformal factors are \(f^{-3}, f^{-1}, f^4\) in the three factors of the integrand. This action is smooth at spinor zeros and its fixed-background operator is \(P_g^*\rho^{-6}P_g\). It adds background data and gives no metric-independent invariant by itself.

## Primary reference passages

Inspected 28 November 2026. These are selected passages only, read online without archiving a PDF. [Two BibTeX entries for the shared bibliography owner](../references/variational_boundary.bib)

- J. Vankerschaver, C. Liao and M. Leok, *Generating functionals and Lagrangian partial differential equations*, J. Math. Phys. **54** (2013), 082901. Inspected arXiv:1111.0280v2, §4, Theorems 4.1–4.2. A differentiable on-shell generating functional gives an isotropic image on its admissible boundary data. The finite-dimensional graph above is computed explicitly. Smooth solvability and maximality for the full singular equation remain open. [Primary text](https://arxiv.org/pdf/1111.0280v2)
- P. Biran and O. Cornea, *Lagrangian cobordism. I*, J. Amer. Math. Soc. **26** (2013), 295–340. Inspected the authors’ journal copy, Definition 2.1.1 and §4.1. The geometric construction requires an embedded Lagrangian in the product of a symplectic strip with a symplectic manifold, with specified Lagrangian ends. Additional hypotheses enter their Floer results. [Primary text](https://dms.umontreal.ca/~cornea/lcob1-JAMS.pdf)
