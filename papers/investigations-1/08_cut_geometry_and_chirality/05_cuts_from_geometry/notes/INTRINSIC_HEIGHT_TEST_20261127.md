# A pointwise test that can be applied without a round identification

27 November 2026, for Edward B. Baker III with OpenAI Codex. Lead selected Astra/ultra, actual serving settings unavailable. GEO-E14, extension of the checked Gauss identity of parent Theorem 4.1. Fixed smooth closed connected four-manifold and entering gauge. Positive definiteness and compactness give \(p=\min_{x,|n|=1}(R-2\operatorname{Ric}(n,n))>0\).

Suppose a nonconstant smooth real function f is given, with \(\mu,\delta,v>0\). Set \(D=\nabla^2 f+\mu f g\), with the Hilbert–Schmidt norm of the bilinear form. The following two bounds suffice:
\[
 |df|\ge v\quad\text{on } |f|\le\delta,\qquad
 \|D\|_\infty<\min\{\mu\delta,\ v\sqrt p\}.
\]
Assume the belt is nonempty, for instance f has mean zero. All critical points lie outside the belt. There the Hessian is strictly definite by the first error threshold, with negative sign on the positive side. Thus f is Morse with only extrema. Since an extremum exists on either end and no handle connects different initial balls or separates upper components in dimension four, connectedness gives exactly one minimum and one maximum.

For each unit level normal restrict to its orthogonal three-plane. If C denotes the tangential Hessian, then
\[
 2\sigma_2(C)=\tfrac23(\operatorname{tr} C)^2-|C^\circ|^2
 \ge -|(D|_{n^\perp})^\circ|^2\ge -|D|^2.
\]
On the belt, Gauss gives \(R_\Sigma\ge p-\|D\|_\infty^2/v^2>0\). On either cap the definite tangential Hessian gives \(\sigma_2(C)>0\), and the same Gauss identity gives \(R_\Sigma>0\) wherever the level is regular. This test supplies a gradient sweepout for the data it certifies. To anchor it at a specified width hypersurface also require that hypersurface to be a regular level, or supply a controlled alignment such as E13.

For a Laplace eigenfunction \(-\Delta f=\lambda f\), choose \(\mu=\lambda/4\), so D is its trace-free Hessian. Integrating the Bochner identity on the closed manifold gives exactly
\[
 \int |D|^2=\tfrac34\lambda^2\int f^2-\int\operatorname{Ric}(\nabla f,\nabla f).
\]
If \(\operatorname{Ric}\ge3k g\) this yields \(\int |D|^2\le\tfrac34\lambda(\lambda-4k)\int f^2\). This does not bound the supremum error or supply a gradient floor on the belt. Both missing bounds are explicit targets for a candidate metric.

On the unit round sphere a coordinate f=x₁ has μ=1, D=0, and |df|²=1−f². The test holds for every 0<δ<1. In the same metric the principal-orbit height \(f=|x_{\mathbb R^2}|^2-2/5\) is a trace-free quadratic spherical harmonic of eigenvalue 10, with critical surface at the two-sphere. At that surface f=−2/5, \(df=0\), and the Hessian vanishes on its tangent plane. If \(\delta\ge2/5\) the gradient floor fails, while for \(\delta<2/5\) a unit vector tangent there gives \(|D|\ge\mu(2/5)>\mu\delta\). The same test therefore distinguishes two geometrically defined heights in one smooth entering metric. This is one way to attempt a nonsymmetric continuation on an identified candidate; it supplies no general spectral pinching theorem.
