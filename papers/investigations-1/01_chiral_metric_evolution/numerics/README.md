# Computations and bounded checks

Keep branch-specific symbolic or numerical code and small reproducible execution records here. Computations support named questions; they do not substitute for the global statements of the smooth four-sphere program.

Before a new run, record a finite question, fixed inputs, equations and normalization, method, work limit, expected failure modes, and acceptance test in a task or packet. Record versions, actual outputs, and errors afterward. A pre-existing verification script is inherited evidence, not a new run or independent review during setup.

Large outputs follow [LARGE_FILES.md](../../../../LARGE_FILES.md). Live task status belongs in [REGISTER.md](../research-progress/REGISTER.md).

### Sharp stationary certificate — 23 November 2026

Use [e218_stationary_spectral_range_v2.py](e218_stationary_spectral_range_v2.py) for the sharp7/2 Bernstein certificate and endpoint check, with the single canonical [JSON record](e218_stationary_spectral_range.json). The frozen [v1](e218_stationary_spectral_range.py) preserves the original E218 input; two intermediate endpoint basis coefficients are corrected in v2, with the same final certificate output. The [independent E219 verifier](e219_sharp_stationary_verify.py) reconstructs all1511 coefficients, their inverse expansion and all actual endpoint basis/radical checks. The [assessment](../reviews/E218_E219_SHARP_STATIONARY_ASSESSMENT_20261123.md) records exact identities, correction and scope. The finite grid is a screen, while the polynomial coefficients prove the closed-region sign.

The [E229 coefficient-floor script](e229_linear_spectral_coercivity.py) and [small exact record](e229_linear_spectral_coercivity.json) certify all 911 positive determinant coefficients at least one. The [E230 determinant-first verifier](e230_linear_spectral_verify.py) independently reproduces that array and comparison while sharing the assessed scalar block. Their [assessment](../reviews/E229_E230_LINEAR_COERCIVITY_ASSESSMENT_20261123.md) records the exact scope and input identities. No extra spectral search or subdivision is involved.
