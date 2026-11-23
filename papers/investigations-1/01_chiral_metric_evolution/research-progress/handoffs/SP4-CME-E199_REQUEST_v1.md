# SP4-CME-E199 request v1 — Axial stationary-kernel sign classification

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Fixed E algebra under B97, assigned gpt-6.2-sol/ultra. Lead settings and independent runtime attestation unavailable.

Execute only B97's one-parameter t>0 classification. Own notes/199_AXIAL_STATIONARY_SIGN_REGION_20261122.md, numerics/e199_axial_stationary_sign.py, numerics/e199_axial_stationary_sign_results.json, and research-progress/handoffs/SP4-CME-E199_RETURN_v1.md. Do not edit shared files or frozen inputs; no subdelegation, new literature, general spectra, unrelated computations or manuscript edits. Disclose inherited work.

Use exactly E187 (1)–(3): an oriented Euclidean real four-point, positive chirality, bracket epsilon, K=1, Sigma_1=dx14+dx23, Sigma_2=dx24+dx31, Sigma_3=dx34+dx12, Q=3 diag(1,1,t²)/(2+t²), F=−sqrt(Q) Sigma, and the 20 axis-major trace-free symmetric first derivatives X_a. Bianchi determines b via its compatibility inverse, Xi includes b, and R is restricted to the exact V=0 constraint. Eliminate only common nonzero scalars. Determine the constraint rank for all positive t, giving exceptional values if any, then derive an exact symbolic basis or finite block congruence for R on its kernel. A basis singularity is not a rank loss without a separate check.

Classify the inertia for every positive parameter and at every positive transition root. Supply exact polynomial/rational factors with denominator signs and exact root counts/order. Sturm, rational arithmetic and symbolic simplification are allowed routine choices; avoid numerical eigenvalue certification. The finite object is this one 12-dimensional generic restricted form only, not general spectra. Validate symbolic identities, full Bianchi recovery, constraint residuals, congruence rank on its domains and consistency with all seven E187 cases. At transitions specify nullity and a kernel certificate; explicit nullspace bases may be given over the corresponding algebraic number field. If symbolic growth prevents completion, stop with the exact reduced finite problem and no unsupported interval assertion.

Use installed symbolic libraries if available and record versions; no installation needed unless ordinary local execution requires it. Keep reproducible code and compact outputs. Return strongest justified conclusion and limitations. No global stationary/flow result or novelty claim follows automatically. Stop at this packet boundary; the lead chooses subsequent work.

## Frozen inputs

| Input | SHA-256 |
| --- | --- |
| [B97](../../brainstorm/notes/B97_AXIAL_STATIONARY_SIGN_REGION_20261122.md) | 001d4b4b696bf9aecbc9ae28e370164281a03526d7540dddba605ae5bae7697c |
| [E187 proof](../../notes/187_STATIONARY_KERNEL_QUADRATIC_TEST_20261122.md) | 6e8d687f60bb724d06d3e42d4c1238e124c19d32c20581055cdad8c088c3c9c4 |
| [E187 script](../../numerics/e187_stationary_kernel.py) | fc14caed87b5d7511f8fae7cb0551879273ef7a83d9dad03287bee609df85d56 |
| [E187 exact data](../../numerics/e187_stationary_kernel_results.json) | 0d08809322760e103e98e54e2e0370203069ec9b8effdc6fa414f04d80fe7aad |
| [E189 independent verifier](../../numerics/e189_stationary_kernel_verify.py) | e45ef341349d97039496451e3d9e846bb1a14e0c9dc1be914a713eb7eb5f1bd8 |
| [E187/E189 assessment](../../reviews/E187_E189_STATIONARY_KERNEL_ASSESSMENT_20261122.md) | 65340bab67c625edce42351649ef69399c0c6f671c5fc021ac7238f9f5630c40 |
| [E05](../../notes/07_PINCHED_ENERGY_GAP_20261122.md) | cbb2f95b2961cb1772014e311ec9b759af88ebd0f739a6d0556c6a0fe3d8d3bb |
