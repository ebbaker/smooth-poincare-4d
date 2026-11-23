# SP4-CME-E230 return v1 — Independent effective stationary coercivity audit

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Bounded E work under B108, configured gpt-6.2-sol / ultra. Independent runtime and lead settings are unavailable. I previously authored E222, E224 and the separate E228 upper-witness audit. The E230 calculation uses the assessed E202 block and E218/E219 closed sign as shared premises. [Detailed audit](../../reviews/E230_LINEAR_SPECTRAL_COERCIVITY_AUDIT_20261123.md)

## Disposition

Pass. The new exact verifier forms the determinant polynomial in the original variables, then substitutes onto the square and uses the closed-form binomial power-to-Bernstein conversion. Its \((37,23)\) natural numerator-pair array has canonical SHA-256 `9f595dbd0db6cc88c9489fd7545cbb617b9452a55cc300c7de0ca588b9d98978` and denominator \(4311134142332645259085973815296000\). All 911 nonzero pairs pass the exact test \((A-D_{\rm B})+B\sqrt{14}\ge0\), with sole zero at \((37,0)\), proving the common floor \(\delta_0=1\). The verifier implements the determinant-first route separately from E229's entry-first arithmetic and does not regenerate other minors.

For every \(1\le r\le7/2\), all ordered model spectra with \(v^2\le r\) and all actual zero-speed arrays \(X\) in old \(K=1\) units,
\[
 R_Q(X)\ \ge\ k(7/2-r)|X|^2,\qquad
 k=\frac{3}{704\cdot27648^3\cdot880^2}=\frac1{3840678118509930086400}.
\]
The coefficient floor gives \(\det M\ge(7/2-r)/4\). The upper bounds \(\|R\|\le120\), \(|X|^2\le11|Z|^2\) and \(4\lambda\ge3/2\) give the \(G\) eigenvalue cap \(880\). The positive semidefinite eigenvalue product and \(\det G=\det M/(8L^3)\) with \(L\le27648\) give the stated lower bound. The norm comparison has the needed direction for transferring the lower bound from \(Z\) to \(X\). The result covers repeated spectra and the round edge. At the closed endpoint it gives nonnegativity, with equality along the assessed radical. Frame covariance and independence of fixed old \(K>0\) in matching old orthonormal frames were checked. The estimate is pointwise on the stationary kernel. Neither optimal constants nor flow applications were assessed.

## Integrity

All eight frozen inputs match. The 126-line verifier ran with Python 3.10.0 and reproduced all stated exact outcomes. Only the two assigned records and the optional verifier were written.

- [Request v1](SP4-CME-E230_REQUEST_v1.md) SHA-256 73ace8f00d6f1eead21bf7a7b7bb3e8e93ce99e2e32f36c2f98f6eee6df14e4f.
- [Frozen E229 note](../../notes/229_LINEAR_SPECTRAL_COERCIVITY_20261123.md) SHA-256 64931775e41b7ec8d4954be80553ed68e7118611f866b2a951c4f6034d107471.
- [E230 verifier](../../numerics/e230_linear_spectral_verify.py) SHA-256 bb6a92b0c74033193e2235475ac10d809ac66dbd6ebb263adf0ca192f06ae244.
- [E230 audit](../../reviews/E230_LINEAR_SPECTRAL_COERCIVITY_AUDIT_20261123.md) SHA-256 fb732a3ab1034f9c81c16c8b54d5de301fef20d8f90eb2aab4158bb3c00c96c8.
