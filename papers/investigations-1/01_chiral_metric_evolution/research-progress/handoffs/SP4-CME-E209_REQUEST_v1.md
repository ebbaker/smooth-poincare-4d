# SP4-CME-E209 request v1 — Pinched gradient domination derivation

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Fixed E derivation under B101, configured gpt-6.2-sol/ultra; independent runtime and selected lead settings unavailable.

Own notes/209_PINCHED_GRADIENT_DOMINATION_20261123.md and research-progress/handoffs/SP4-CME-E209_RETURN_v1.md only. No shared artifacts, new sources, subdelegation, numerical search or enlarged spectral region. Disclose authorship of E202 and older formulas. Derive and check the exact quantitative proposal in B101 for all derivative tensors at Q with eigenvalue ratio≤9/4, preserving the actual corrected velocity and complete Bianchi reconstruction.

Finite tasks: (1) verify the explicit right inverse of W on its eight-dimensional image and its Frobenius bound, including the reproduced third row and orthogonal minimal preimage. (2) Check L0=81 for the full symmetric derivative quadratic form from the inherited Sylvester/mismatch bounds and polarization; no kernel restriction in that bound. (3) Prove the proposed kappa/2, C0 estimate by orthogonal decomposition and absorption, or state precise corrected constants. (4) Recompute the old gradient identity from independent variation with dV_hat versus mu_old, then combine with E05 without dropping K or internal pairing factors. (5) Transfer to native negative-Killing normalization and derive a static gradient domination estimate for every supplied smooth critical-or-noncritical definite connection in the region, using local existence only if needed to evaluate the exact identity at one instant. Obtain an explicit positive gamma with E_native≤gamma^(-1)∫|V_native|²dV_native, and hence E_native(t)≤exp[-gamma(t-t0)]E_native(t0) on any supplied smooth original interval where the ratio bound holds everywhere. State any accompanying integrated |nabla Q|² term with exact convention. Preserve closed connected smooth oriented real four-manifold, positive planes, round-compatible sign, arbitrary fixed K>0 for old formulas, and native metric/time for the final decay. No homotopy-sphere assumption should be inserted unless actually needed. No pinching preservation, lifespan or Ck convergence is inferred from the energy bound alone.

Return a complete derivation with finite explicit constants, or a precise obstruction/counterexample. If B101's proposed normalization is incorrect, correct it rather than silently using native volume in the old clock. Stop at this quantitative finite boundary. Independent audit follows separately.

## Frozen inputs

| Artifact | SHA-256 |
| --- | --- |
| [B101_PINCHED_GRADIENT_DOMINATION_20261123](../../brainstorm/notes/B101_PINCHED_GRADIENT_DOMINATION_20261123.md) | a60adc8b1f68e7ccbebaf039e19d99d8e367c35bb2c973c6b0f75b3e5a840722 |
| [202_GENERAL_STATIONARY_PINCHING_TEST_20261122](../../notes/202_GENERAL_STATIONARY_PINCHING_TEST_20261122.md) | 332761652fed6f6d4b861ab3790dba9c85191cc76e72afdedde4729ff9ae858c |
| [E204_GENERAL_STATIONARY_PINCHING_AUDIT_20261122](../../reviews/E204_GENERAL_STATIONARY_PINCHING_AUDIT_20261122.md) | 7e757ba40013fe243db961b287ee1dcdfce074815b3c8fe37602d5fa767c9fba |
| [E202_E204_STATIONARY_PINCHING_ASSESSMENT_20261123](../../reviews/E202_E204_STATIONARY_PINCHING_ASSESSMENT_20261123.md) | 83c2699b8244f6300863cb2528af7bf4454cf4435faef01ce5ad9171fd353fe8 |
| [07_PINCHED_ENERGY_GAP_20261122](../../notes/07_PINCHED_ENERGY_GAP_20261122.md) | cbb2f95b2961cb1772014e311ec9b759af88ebd0f739a6d0556c6a0fe3d8d3bb |
| [E04_E07_ESTIMATES_ASSESSMENT_20261122](../../reviews/E04_E07_ESTIMATES_ASSESSMENT_20261122.md) | 1ba3564c2f05a9efb796d0c7c0f8d6e75fb04b611610e6611615d98139f2cd1c |
| [E01_FOUNDATION_ASSESSMENT_20261122](../../reviews/E01_FOUNDATION_ASSESSMENT_20261122.md) | 83e1daa219c826454c9201776dd94542095a026d223976c3820dfe6c759045c6 |
| [203_CONDITIONAL_STATIONARY_PINCHING_GAP_20261122](../../notes/203_CONDITIONAL_STATIONARY_PINCHING_GAP_20261122.md) | 6b75c027d6bedd25be4b4d2be16de3c091d16577bc2b228ae04e776371a397c1 |
| [E206_LATE_SPECTRAL_CONVERGENCE_AUDIT_20261123](../../reviews/E206_LATE_SPECTRAL_CONVERGENCE_AUDIT_20261123.md) | 2fe692ce764688a97eab6f7e25b680eeaafdd4a8ea50b61e953b10e1fe756e19 |
