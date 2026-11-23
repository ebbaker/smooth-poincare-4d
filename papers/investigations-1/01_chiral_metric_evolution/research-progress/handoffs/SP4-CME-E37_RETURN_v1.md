# SP4-CME-E37 return v1 — rough-data source audit and conditional operator map

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Configured helper `gpt-6.2-sol` / `ultra`. Independently introspected runtime and lead settings are unavailable. All five [frozen input][request] hashes were verified. Request SHA-256 `6154c2edceee67e4ee908cc9fef471afc4b1f5adbe5c2bcbfdf11d9be831bfd9`. The E36 return was outside this packet's inputs.

[E37 derivation and source audit][note], SHA-256 `de2c9c2887a6df86d32c0c40f8ae2ce8da6bfc16a7c2a0158a2c3a8862ed424d`.

## Source evidence

The official DML record confirms Koch–Lamm, *Mathematica Bohemica* 140 (2015), 457–477, DOI `10.21136/MB.2015.144463`. Its published PDF timed out again and the university mirror did not provide the file. Exact text checked in [arXiv v1][kl], preprint pages 2–8 and 12. [Official record][journal].

Theorem 1.1 on pp. 2–3 gives the Euclidean scalar continuous-data statement. Sections 2–3 use a fixed-point class with an upper-cylinder \(L^p\) gradient seminorm for \(p>d+2\) and a tent \(L^2\) gradient seminorm. The source's uniqueness claim for weak solutions assumes \(\sqrt t\|Du(t)\|_\infty\le c_1\varepsilon\). Use the weighted smoothing estimates for positive spatial derivative orders. Section 4.2 expressly permits the rank-one route for small \(L^\infty\) perturbations of uniformly continuous data, with Gaussian and Calderón–Zygmund estimates. Its BMO route invokes integral coercivity (4.1) for the operator evaluated at heat-smoothed data. Full gradient-array positivity is one sufficient condition for that coercivity. Section 4.1 addresses uniform manifolds and Theorem 5.3 addresses tensor Ricci–DeTurck, whose leading coefficient acts as a scalar on the fiber. A uniform compact-bundle construction for the proposed strongly coupled system remains to be supplied, including quantitative control of the value range, the global estimates and uniqueness. [Koch–Lamm, preprint][kl].

## Operator and time criteria

Conditional on E36's order, polynomial-jet and reference-pairing symbol checks, write the independent system in a fixed frame as \(U_t=P^{ij}(x,U)\partial_{ij}U+f(x,U,DU)\), with \(U=(A-\bar A,F-\bar F)\). In divergence form the forcing acquires \(-\partial_i^xP^{ij}p_j\) and \(-\big(D_UP^{ij}[p_i]\big)p_j\). The additional terms are first and second degree in \(p=DU\). The smooth changes of frame and value cutoffs have the same structural bounds on an interior reference tube where the symbol is uniformly coercive in the fixed pairing. Rescaling to time one weights the degree-zero, degree-one and degree-two coefficients by \(T,\sqrt T,1\), respectively.

A common initial continuity modulus determines a common radius for small local oscillation. A common time additionally needs a uniform margin inside the parabolic value tube, uniform kernel and parabolic estimates for the global construction, and the coefficient bounds including the fixed background, frame and cutoff derivatives. A common sup bound ensures the needed margin if it places the values in a strictly smaller reference-centered tube. With the verified operator and uniform bundle extension, the source's argument would give a common local lifespan for continuous data or their smooth compatible approximations in that tube, continuous trace, positive-time smoothing and weighted-gradient class uniqueness. [Detailed map][note].

Disposition: **source audit and conditional operator map complete**. Rough constraint propagation from distributionally compatible traces, convergence of smooth compatible approximations, and recovery of a smooth unadjusted flow across the endpoint remain open in this packet.

[request]: SP4-CME-E37_REQUEST_v1.md
[note]: ../../notes/37_ROUGH_DATA_SOURCE_TEST_20261122.md
[kl]: https://arxiv.org/pdf/1310.3658v1
[journal]: https://dml.cz/handle/10338.dmlcz/144463
