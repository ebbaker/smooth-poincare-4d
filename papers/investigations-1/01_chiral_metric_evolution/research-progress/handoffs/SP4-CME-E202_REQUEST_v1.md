# SP4-CME-E202 request v1 — General stationary pinching box

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Fixed E algebra under B98, assigned gpt-6.2-sol/ultra. Actual lead settings and independent runtime attestation unavailable.

Execute B98's single proposed ordered spectral region 1<=u<=v<=3/2, D=diag(1,u,v), c²=3/(1+u²+v²), S=cD, Q=c²D². Own notes/202_GENERAL_STATIONARY_PINCHING_TEST_20261122.md, numerics/e202_general_stationary_pinching.py, numerics/e202_general_stationary_pinching_results.json, and research-progress/handoffs/SP4-CME-E202_RETURN_v1.md. No shared edits, no source search, no subdelegation, no general full quadrant classification or flow theorem. Use the exact E187 formulas with d=(1,u,v) and the general Sylvester denominators d_i+d_j; do not impose repeated eigenvalues. Positive Riemannian signature, older bracket epsilon and K=1, oriented Sigma basis, F=-S Sigma, X axis-major trace-free symmetric, actual V=0 and Bianchi-recovered b, Frobenius form R all remain unchanged.

Derive a symbolic constraint kernel or exact block reduction, with rank and basis nonsingularity checked over the full closed triangle. The quaternion left relation gives an upper rank bound but a lower certificate is still required. Compute the restricted quadratic form from full Xi; do not omit the skew term. Seek a positive-definite exact certificate throughout this compact region, hence a uniform positive lower bound relative to sum|X_a|² by continuity and norm equivalence. A finite rational counterexample within the region instead settles the proposed claim negatively. Six grid points with u,v in {1,5/4,3/2}, u<=v, are allowed sanity checks, not a proof.

Allowed routine methods: fixed symbolic elimination, block symmetries with displayed invertible changes, exact principal-minor or congruence certificates, rational polynomial arithmetic and sign factorization. Use ordered square coordinates v=1+a/2, u=1+ab/2 for a,b in [0,1] if useful. For a Bernstein certificate, allow degree elevation through degree24 in each variable and at most32 rational rectangular subdivisions, recording exact positive coefficients/denominators. If that fixed effort leaves unresolved signs, return the exact finite polynomial question and do not claim a failed mathematical theorem merely from certificate failure. No numerical eigenvalues establish continuum positivity. Existing standard libraries or your own compact arithmetic are allowed; no installation or unrelated experiment is requested.

Check round R=4 sum|X|², all Bianchi and velocity residuals, symmetry and basis rank. Compare to accepted E187 axial samples when they lie in the present region; E199's new axial result remains under independent assessment and is optional background only. Return the exact strongest result, reproducible code and output digests, hypothesis boundaries and limitations. Stop at this packet boundary.

## Frozen inputs

| Artifact | SHA-256 |
| --- | --- |
| [B98_GENERAL_STATIONARY_PINCHING_TEST_20261122](../../brainstorm/notes/B98_GENERAL_STATIONARY_PINCHING_TEST_20261122.md) | 8619615c9a35c9c58cb834b277ebb1141a1f33f439283857bc2b42cab7553867 |
| [187_STATIONARY_KERNEL_QUADRATIC_TEST_20261122](../../notes/187_STATIONARY_KERNEL_QUADRATIC_TEST_20261122.md) | 6e8d687f60bb724d06d3e42d4c1238e124c19d32c20581055cdad8c088c3c9c4 |
| [e187_stationary_kernel](../../numerics/e187_stationary_kernel.py) | fc14caed87b5d7511f8fae7cb0551879273ef7a83d9dad03287bee609df85d56 |
| [e187_stationary_kernel_results](../../numerics/e187_stationary_kernel_results.json) | 0d08809322760e103e98e54e2e0370203069ec9b8effdc6fa414f04d80fe7aad |
| [E187_E189_STATIONARY_KERNEL_ASSESSMENT_20261122](../../reviews/E187_E189_STATIONARY_KERNEL_ASSESSMENT_20261122.md) | 65340bab67c625edce42351649ef69399c0c6f671c5fc021ac7238f9f5630c40 |
| [e189_stationary_kernel_verify](../../numerics/e189_stationary_kernel_verify.py) | e45ef341349d97039496451e3d9e846bb1a14e0c9dc1be914a713eb7eb5f1bd8 |
| [07_PINCHED_ENERGY_GAP_20261122](../../notes/07_PINCHED_ENERGY_GAP_20261122.md) | cbb2f95b2961cb1772014e311ec9b759af88ebd0f739a6d0556c6a0fe3d8d3bb |
