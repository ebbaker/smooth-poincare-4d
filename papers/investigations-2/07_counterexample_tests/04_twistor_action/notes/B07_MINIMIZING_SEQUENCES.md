# What strong convergence follows from the global comparison?

28 November 2026, America/New_York, for Edward B. Baker III with Codex lead assistance. Author-selected GPT-6.2 Astra/ultra; independent serving telemetry unavailable. Checkout `280376dd7a18`. This corollary uses the quantitative [comparison](E11_GLOBAL_COMPARISON.md) and [product estimate](E12_CYLINDER_CONSTANT.md) on the single fixed product and trace pair in [B07](../brainstorm/notes/B07_GLOBAL_COMPARISON.md).

Write \(D=2\), \(k^2=3b^2/4\), \(b=1/200\), \(f=e^{-bt}\psi=\sigma+v\), and \(\delta=J_g(\psi)^2-k^2\sqrt D\). The comparison gives \((2/3)\|\nabla v\|_2^2\le\delta\|f\|_4^2\). Since \(\|f\|_4\le D^{1/4}+24\|\nabla v\|_2\), any sequence with action tending to the radial value has \(\|\nabla v\|_2\to0\), by absorbing \(24\sqrt\delta\,\|\nabla v\|_2\) for large indices. Zero trace and multiplication by the fixed smooth exponential give \(\psi\to\psi_*\) strongly in \(H^1\). The statement concerns the whole sequence at fixed \(b\); the [prior \(O(d^2)\) estimate](SMALL_TRACE_ASYMPTOTIC.md) concerned competitors at or below the trial for \(d\to0\) after centering the mean log amplitude.

There is an explicit minimizing sequence that leaves every bounded \(H^5\) ball. For integers \(n\ge2\) put
\[
 \psi_n=e^{bt}\{1+n^{-2}\sin[n\pi(t+1)/2]\}\sigma .
\]
Its given end traces and positivity are immediate. The conjugated perturbation is \(O(n^{-1})\) in \(C^1\), so the quartic densities converge uniformly to the radial density and \(J_g(\psi_n)^4\to J_g(\psi_*)^4\). Its fifth time derivative in conjugated variables has \(L^2\) norm \((\pi/2)^5 n^3\), since the sine or cosine squared integrates to one over this interval for every positive integer \(n\). Multiplication by \(e^{-bt}\) is bounded on \(H^5\), hence the original \(H^5\) norms also tend to infinity. These are competitors. The [earlier \(H^5\) uniqueness result](E08_LOCAL_DIRICHLET.md) quantifies over critical fields in its specified neighborhood with nearby, potentially nonradial, boundary data.
