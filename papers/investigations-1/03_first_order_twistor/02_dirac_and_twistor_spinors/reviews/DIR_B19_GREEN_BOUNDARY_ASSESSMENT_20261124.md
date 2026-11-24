# A Dirac boundary field on every punctured smooth homotopy four-sphere

24 November 2026, America/New_York. Research for Edward B. Baker III, assessed by the selected OpenAI lead. The lead’s actual model identifier and reasoning effort were unavailable. The analytical and example packets were configured for gpt-6.2-sol/ultra. Their requests and returns give working-file hashes at HEAD f178fbb604f7f972b639fa8c1fc05f649c9bc8fc. [Decisions B15–B19 and evidence](../research-progress/REGISTER.md) · [Primary passages](../../../../../references/SOURCE_NOTES_DIRAC_CONTINUATION_20261124.md).

## What can always be constructed

For every smooth closed oriented homotopy four-sphere $M$ and $p\in M$, choose a metric flat on a coordinate ball at $p$. The unique spin structure has complex chiral index $-\tau(M)/8=0$. Ammann–Dahl–Humbert's relative deformation theorem gives an invertible full Dirac operator after changing the metric inside a disjoint ball. This leaves the flat germ exact. The resulting metric has no prescribed scalar sign. [E26 and its primary theorem](../notes/DIR_E26_20261124.md)

Let $h=\omega^2g$ on $N=M\setminus\{p\}$ with $\omega=r^{-2}$ near $p$. It has one exactly Euclidean end and zero ADM mass. Write $\beta$ for the oriented conformal spin identification. For a nonzero negative-chiral source $\eta$, in the flat compact frame the positive Green field is
\[
 G_\eta(x)=-\frac{x\cdot\eta}{|S^3|r^4}+\gamma(x).
\]
Here $\gamma$ is smooth and harmonic near $p$. The ordinary harmonic end field is $\Psi=\omega^{-3/2}\beta G_\eta$. In the oriented inversion chart, with a fixed reflection in a unit vector $a$, it tends to $a\cdot\eta/|S^3|$ with error $O(R^{-3})$ and derivative $O(R^{-4})$. Prescribing this constant determines the solution in that decay class by compact removability and invertibility. Choose $|\eta|=|S^3|$ for unit amplitude. Twistor-weight transport back gives the smooth compact section $\psi=\omega^{-2}G_\eta$, with the prescribed simple Clifford jet at $p$. A compact eigenspinor equation for $\psi$ is unnecessary. [E27](../notes/DIR_E27_20261124.md)

The field on the end has infinite total $L^2$ norm and finite Dirichlet energy. Its flux vanishes at infinity, and hence
\[
 \int_N s_h|\Psi|^2\,dV_h=-4\int_N|\nabla^h\Psi|^2\,dV_h .
\]
An independently established nonnegative left side would force a parallel spinor. The compact transport would be a nonzero positive-chiral twistor spinor. Integrability forces $W^+=0$ where it is nonzero, extending by continuity, and the signature and developing arguments recognize $M$. The compact pole zero is allowed throughout. [E28](../notes/DIR_E28_20261124.md) · [SH-E01](../../notes/SH_E01_20261124.md)

## Interior zeros and conformal optimization

For this boundary problem $P_h\Psi=\nabla^h\Psi$. Its critical relative integral $\int_{\Psi\ne0}|\nabla\Psi|^4/|\Psi|^4$ is finite exactly when there are no interior zeros. A smooth zero forces $|\Psi|\le Cr$; the spherical means of truncated $\log|\Psi|$ cannot have that rate of decrease with a bounded $W^{1,4}$ seminorm. The end contributes a finite tail. For a fixed pole the chiral Green kernel is a map of quaternionic lines. Changing the unit source rotates every value, preserving its norm, all zeros and the relative cost. When the interior zeros are transverse their signed sum is zero. Both local signs occur for flat linear solutions. These facts give neither transversality nor cancellation of actual zeros. [E29](../notes/DIR_E29_20261124.md) · [E36](../notes/DIR_E36_20261124.md)

For a zero-free solution, $k=|\Psi|^{4/3}h$ carries the unit ordinary harmonic spinor $\xi$; the twistor choice $|\Psi|^{-4}h$ serves a different equation. Put $V=|\nabla^k\xi|^2$. Then $s_k=-4V$. For positive $v=1$ outside a compact set, the harmonic transport to $v^{-4}k$ has energy and relative cost
\[
 Q(v)=\int_N (12|dv|^2+Vv^2)\,dV_k,\qquad
 J(v)^4=\int_N(V+12|d\log v|^2)^2\,dV_k .
\]
Thus $J(1)^4=\|s_k\|_2^2/16$. In a fixed $k$, the infimum $P$ of $Q$ is positive whenever $V$ is nonzero. Its relaxed minimizer solves $(12\Delta_k+V)v=0$ with asymptotic value one, giving $P=\int Vv$. The $R^{-2}$ coefficient of $v$ is $-P/(24|S^3|)$. Compact variations keep zero ADM mass; the relaxed metric has normalized mass $P/(6|S^3|)$. [E31](../notes/DIR_E31_20261124.md) · [E32](../notes/DIR_E32_20261124.md)

## Why the remaining estimate is geometric

- **A fixed perturbation.** On the standard sphere, a small metric bump away from the pole preserves a zero-free Green field and the compact jet, with $J\asymp|\epsilon|$. Its nonzero $W^+$ excludes a parallel chiral scale. The weighted scalar integral is strictly negative of order $\epsilon^2$. [E33](../notes/DIR_E33_20261124.md)
- **Loss of core scale.** Even fixing the flat end chart, its unit boundary value and the compact flat germ, a homothety and an extending end dilation multiply the energy by $t^2$ and core spinor mass by $t^4$. The critical relative integral is invariant, including when infinite. The unrestricted Dirichlet infimum is therefore zero on every input. Smooth zero-energy attainment would recognize the sphere. [E34](../notes/DIR_E34_20261124.md)
- **Uncontrolled derivative.** An explicitly oscillatory family on the standard sphere has genuine zero-free positive Green fields with fixed end value, $J^4=O(n^{-2})$, and $\|s_{k_n}\|_2=O(n^{-1})$. Yet $\int|W^+_{g_n}|_{\mathrm{op,HS}}^2\ge cn$. The compact metrics converge in $C^{1,1/4}$ and retain the pole germ. This extends the earlier arbitrary-section counterexample to the actual Dirac boundary fields. E12 identifies the unconstrained curvature projection of the next derivative. E35 v1 stopped on a changed E31 digest, and v2 used the finalized input. [E35](../notes/DIR_E35_20261124.md) · [E12](../notes/DIR_E12_20261124.md)

The unconditional output is a field with a known nonzero boundary value. Turning it into a recognizing structure requires parallelism, a separate curvature estimate, or compactness strong enough to yield an attained twistor solution. Control of the first-order critical cost alone fails on the calibrated family.

An independent review checked the compact and punctured conformal weights, the coefficient 12, the five distinct flux and mass normalizations, core scaling, and the simultaneous Green-field and Weyl estimates. [E46](../notes/DIR_E46_20261124.md)
