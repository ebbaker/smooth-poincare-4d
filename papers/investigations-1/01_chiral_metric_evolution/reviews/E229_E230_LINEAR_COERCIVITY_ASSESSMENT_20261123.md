# E229/E230 — Effective linear stationary coercivity assessment

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Selected lead model/effort unavailable and unchanged. Derivation and separately implemented audit used configured gpt-6.2-sol/ultra helpers, independent runtime attestation unavailable. [Sole register](../research-progress/REGISTER.md).

## Accepted result

For every 1<=r<=7/2, every positive trace-three model spectrum Q with rho(Q)<=r, and every actual zero-speed symmetric trace-free derivative array X in the old K=1 Frobenius conventions,

    R_Q(X) >= k (7/2-r)|X|^2,
    k = 3/[704*27648^3*880^2] = 1/3840678118509930086400.

Oriented chiral frame covariance covers all positive spectra in the class, including repeated eigenvalues and the round point. The same kernel and coefficients apply in matched old frames at each fixed K>0. At r=7/2 the inequality only asserts nonnegativity; the known endpoint radical realizes equality. This is a lower bound on the stationary restriction, not on arbitrary derivatives. It supplies exactly H_linear in E231, with explicit positive k.

The determinant certificate has 911 positive coefficients all at least one, and one zero at (37,0). The canonical numerator-array SHA remains 9f595dbd0db6cc88c9489fd7545cbb617b9452a55cc300c7de0ca588b9d98978, with natural degrees (37,23) and denominator 4311134142332645259085973815296000. The Bernstein partition gives det M >= (7/2-r)/4. The ordered edge-to-jet norm bound |X|^2<=11|Z|^2, full-form operator upper bound 120, lambda>=3/8 and L<=27648 give lambda_max(G)<=880 and lambda_min(G)>=det(G)/880^2. Since det(G)=det(M)/(8L^3), their combination gives the displayed constant.

Together with the separately accepted [E227/E228 upper bound](E227_E228_STRICT_INTERIOR_ASSESSMENT_20261123.md), this shows that kappa(r) has linear order as r increases to 7/2: k <= liminf kappa(r)/(7/2-r) <= limsup kappa(r)/(7/2-r) <=112/55. The upper number is the limit of 24r/[(r+2)(r+4)]. No limit or optimal leading coefficient is proved.

## Independent content and lead verification

The lead read both derivations/reviews, returns and scripts, checked returned hashes, replayed E229 to a byte-identical canonical JSON, and ran E230's separate verifier. Its output agrees fieldwise with that record. The lead checked the determinant-to-smallest-eigenvalue inequality and the norm direction: |Z|^2>=|X|^2/11 is required at the final lower estimate.

E229 reuses E219's entry-first specialization and triangular conversion. E230 independently implements original-variable cofactor determinant, exact square substitution and closed-form binomial power-to-Bernstein conversion; its sign tests use separate integer inequalities after subtracting the denominator. It shares only the assessed scalar block and its transitive definitions, and the prior semidefinite theorem used in the eigenvalue step. No other minors, spectral samples, subdivisions or degree elevations are needed. This is a branch arithmetic/proof audit, not independent specialist review or a novelty certification. No new primary source was imported or inspected.

## Frozen identities

| Artifact | SHA-256 |
| --- | --- |
| [notes/229_LINEAR_SPECTRAL_COERCIVITY_20261123.md](../notes/229_LINEAR_SPECTRAL_COERCIVITY_20261123.md) | `64931775e41b7ec8d4954be80553ed68e7118611f866b2a951c4f6034d107471` |
| [numerics/e229_linear_spectral_coercivity.py](../numerics/e229_linear_spectral_coercivity.py) | `b7c82c99d8b9649faadf4e21fa5459881d7cca8db1d67af915166e17ac4d83f7` |
| [numerics/e229_linear_spectral_coercivity.json](../numerics/e229_linear_spectral_coercivity.json) | `b639ede02a3ff497e88d7efbfb9e6e28fb48ff261e6247c8a218c1fadba24e8b` |
| [reviews/E230_LINEAR_SPECTRAL_COERCIVITY_AUDIT_20261123.md](../reviews/E230_LINEAR_SPECTRAL_COERCIVITY_AUDIT_20261123.md) | `fb732a3ab1034f9c81c16c8b54d5de301fef20d8f90eb2aab4158bb3c00c96c8` |
| [numerics/e230_linear_spectral_verify.py](../numerics/e230_linear_spectral_verify.py) | `bb6a92b0c74033193e2235475ac10d809ac66dbd6ebb263adf0ca192f06ae244` |
| [research-progress/handoffs/SP4-CME-E230_RETURN_v1.md](../research-progress/handoffs/SP4-CME-E230_RETURN_v1.md) | `3da42e7e86dac42e938a93b44e37b1462c0766badaabb1d542f6fb408baa3a7c` |
| [reviews/E218_E219_SHARP_STATIONARY_ASSESSMENT_20261123.md](../reviews/E218_E219_SHARP_STATIONARY_ASSESSMENT_20261123.md) | `be5a230ffaf7f0a8a31a8f2d55935927af055f2366545c48c636d8a06cc718aa` |
