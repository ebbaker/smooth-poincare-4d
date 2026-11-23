# SP4-CME-E213 return v1 — Independent intermittent spectral return audit

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Bounded E audit under B102, configured gpt-6.2-sol / ultra. Independent runtime and lead settings are unavailable. I authored E179, E203 and E205 and audited E209 in E210. The new E212 combination was checked independently.

## Disposition

The occupation bound and both sufficiency arguments pass. **Required wording repair:** the finite-slice test can be checked using only pinched time accumulated through \(t_n\). The claim that it can hold with finite total pinched time over the resulting global path is false. Smooth convergence of that actual path to one fixed perfect round pair implies \(Q_{A(t)}\to I\) uniformly, so \(S\) contains every sufficiently late time. Replace the sentence by “This finite-time test uses only the pinched time accumulated by \(t_n\).” The proof and frozen E212 file are preserved. [Independent audit](../../reviews/E213_INTERMITTENT_SPECTRAL_RETURN_AUDIT_20261123.md)

The E209/E210 assessment supplies \(H_{\rm grad}\) precisely for the smooth positive-plane, round-compatible definite class on the general closed oriented base, at every instant with \(\sup_M\rho(Q)\le9/4\), including equality. The native constants are \(\gamma=48/[5(1+4C_0)]\) and \(\beta=\kappa/(1+4C_0)\) with the assessed \(C_0,\kappa\). The frozen E212 note remains historical and conditional. Compact-time-slab positivity and the Rayleigh quotient bound give a continuous ratio supremum and a relatively closed pinched set. Its cumulative measure is absolutely continuous. The integrating-factor proof gives the weighted derivative and scalar bounds on all compact time slabs without an energy denominator or derivative of the indicator, including for empty or zero-measure sets and positive-measure sets with empty interior. [Gradient assessment](../../reviews/E209_E210_PINCHED_GRADIENT_ASSESSMENT_20261123.md)

On the fixed oriented homotopy four-sphere and bundle, the simultaneous late \(\Psi\) and diameter bounds alone exclude a finite maximal endpoint. Infinite accumulated pinched time then gives zero limiting energy and the E179 fixed original round tail without aligning the two sets of times. The strict finite test at one qualifying actual unshifted slice instead uses the uniform entry theorem directly and identifies its tail with the original path by recentered uniqueness. The non-effective threshold gives no waiting-time bound. The round-tail native \(C^k\) exponent \(\lambda_1(G_0)/2\) is separate from the occupation-time energy exponent \(\gamma\). Only the scoped review and return were written. [Stationary accumulation assessment](../../reviews/E179_E181_STATIONARY_ACCUMULATION_ASSESSMENT_20261122.md) · [Uniform entry assessment](../../reviews/E182_E185_UNIFORM_ENTRY_ASSESSMENT_20261122.md)

## Verified files

- [E213 request](SP4-CME-E213_REQUEST_v1.md) SHA-256 17e0b104cc7f9a5e0018831f8b5a8b73b2b2fec38077d3d5dd45c9e7cc3d4afc.
- [Frozen E212 note](../../notes/212_CONDITIONAL_INTERMITTENT_SPECTRAL_RETURN_20261123.md) SHA-256 581dcc209b7f2683ad0a676f5a225d3c41f675c47578a9bb2871dc2ce1ca0a99.
- [E213 review](../../reviews/E213_INTERMITTENT_SPECTRAL_RETURN_AUDIT_20261123.md) SHA-256 341c4f3c7fbeceeacbb62f4637b80c73f1fef0179d5b9b24fefe362ff7f4d160.
- All seven frozen input digests matched. The return digest accompanies the handoff.
