# SP4-CME-E41 return v1 — compact-bundle linear estimates

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Configured helper `gpt-6.2-sol` / `ultra`. Independently introspected runtime and lead settings are unavailable. All four frozen input hashes match the [request][request], SHA-256 `b431ac9d4b3d14ab3651b78cc995bd87a9d1fc0f795725067f6e18bd180743c1`.

[Linear construction and estimates][note], SHA-256 `8a35523c145e5781f2bac77163cb7f7a2972e10a69deb37f0c69c26adf573ca3`.

## Result

For the fixed smooth divergence-form bundle operator with uniform rank-one Hermitian accretivity, the homogeneous \(L^\infty\to X_T\) and zero-data \(Y_T^0\oplus Y_T^1\to X_T\) Duhamel bounds hold uniformly for \(0<T\le T_0\). The constants are for a fixed operator and reference geometry. Strong uniform trace holds for continuous homogeneous data and for inhomogeneous terms in the smooth forcing completion. Arbitrary finite-norm forcing is covered by the distributional Duhamel interpretation, with distributional zero trace. Both maps are bounded linear maps in the stated norms.

The proof constructs a global short-time kernel by summing frozen chart parametrices and iterating their Gaussian residual, with the first derivative in the source variable obtained from the adjoint. Gårding via Plancherel and local freezing yields the tent energy estimate. The parabolic upper-cylinder estimate follows from a Fourier and dyadic Calderón–Zygmund proof for frozen divergence forcing and local absorption of the variable coefficient error. Smooth transitions and cutoff terms are estimated in the construction. The scope is the fixed linear problem.

## Reference workflow

Rechecked Herbert Koch and Tobias Lamm, *Parabolic equations with rough data*, arXiv:1310.3658v1, 14 October 2013, PDF text §2, pp. 4–5, inspection date 22 November 2026, America/New_York. Sections 3 and 4.1–4.2 were checked in E37. The p. 5 extracted upper \(Y^0\) term has an outer \(r\) and inner \(r^{-(d+2)/2}\) in the \(1/q\) power. E41 uses the explicit scale-invariant packet norms. The paper's pointwise, tent and local gradient proof structure is attributed at its use. The Gaussian and parabolic Calderón–Zygmund inputs for this operator are derived in the E41 note. No new primary source or local PDF copy was used. [Preprint v1][kl]. [Existing canonical record R20][r20].

Disposition **fixed-reference linear result proved**, with the stated forcing trace classes.

[request]: SP4-CME-E41_REQUEST_v1.md
[note]: ../../notes/41_COMPACT_LINEAR_ESTIMATES_20261122.md
[kl]: https://arxiv.org/pdf/1310.3658v1#page=4
[r20]: ../../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md#rough-data-source--inspected-preprint-and-publication-metadata
