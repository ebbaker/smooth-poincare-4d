# E199/E201 — Lead assessment of the exact axial stationary sign region

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Selected lead model and effort are unavailable; helper launch configuration was gpt-6.2-sol/ultra, without independent runtime attestation. This is lead review of the separately authored E199 calculation and E201 audit. Their original dated files remain unchanged.

Accepted as an exact pointwise algebraic classification. In the older internal bracket convention, positive oriented Euclidean tangent metric, K=1, F=-c diag(1,1,t) Sigma with c²=3/(t²+2), the actual corrected velocity map has rank eight and a twelve-dimensional kernel for every t>0. The full E05 derivative form on this kernel is positive definite exactly when
\[
 \sqrt{(\sqrt{201}-13)/8}<t<\sqrt{7/2}.
\]
It is positive semidefinite of inertia (8,4,0) at the two endpoints, and has inertia (8,0,4) outside the closed interval. Inertia is ordered (positive,zero,negative). These statements include the complete Bianchi-recovered skew term. The four explicit null directions at each endpoint are radicals of the restricted symmetric form, not merely isotropic vectors.

I read the full E199 note, custom rational-polynomial generator and return, and the full E201 independent proof and verifier. The E199 replay was byte-identical to its frozen JSON. The root E201 run completed successfully, matching all seven inherited exact samples and verifying the cleared identities at 25 rational nodes with the proved degree bounds. The independent construction solves the unstarred exterior Bianchi equation and uses the quaternion coframe from E189. It does not use E199's rational-function implementation to reconstruct the form.

The fixed eight-by-eight minor is 589824 t⁸/(t²+2)², strictly positive for t>0. The four-row quaternion relation supplies the matching upper rank bound. The twelve explicit basis vectors and all six off-block pairings check. The four three-dimensional blocks are explicitly congruent to diagonal forms whose only changing signs are those of P(s)=4s²+13s-2 and L(s)=7-2s, s=t². Their positive denominators and the nonzero congruence determinants cover all positive parameters. The P-root is unique for s>0 since P′=8s+13>0; the L-root is 7/2. All endpoint radicals are independent by invertibility of those congruences. The independent degree argument clears the full kernel Gram by 9t⁴(t+1)(t²+2)⁵, with degree at most 19; the minor check has degree at most 24 after its positive denominator is cleared. Twenty-five distinct positive rational nodes therefore certify identities over the whole parameter line rather than sampling a sign conjecture.

This assessment discharges the axial algebra premise H_axial in E203. The separate E203/E204 lead assessment must still verify its application to a supplied smooth critical connection, arbitrary K and frame choices. Nothing here realizes an abstract derivative as a global critical connection, controls a flow, or classifies the general three-eigenvalue region. Failure of the sign outside the axial interval only concerns the derivative form on the stated algebraic kernel.

| Artifact | SHA-256 |
| --- | --- |
| [199_AXIAL_STATIONARY_SIGN_REGION_20261122](../notes/199_AXIAL_STATIONARY_SIGN_REGION_20261122.md) | e19bde002e0edf57f5ddf46f2c277c1cc0875fc46ccacef746cd453e2486342d |
| [e199_axial_stationary_sign](../numerics/e199_axial_stationary_sign.py) | 015822bfcb450d58a023688dc0ae73651cb9e83e2f3ae73ca88fd1ba033c9862 |
| [e199_axial_stationary_sign_results](../numerics/e199_axial_stationary_sign_results.json) | df3af1193ad64823c132a8a39c429f0343aace80166772479c0d2614f2e7bead |
| [SP4-CME-E199_RETURN_v1](../research-progress/handoffs/SP4-CME-E199_RETURN_v1.md) | 5506d9dd58de70f062f4e48a75683e5bec7854771e0e0b3d000d8183b946369e |
| [E201_AXIAL_STATIONARY_SIGN_AUDIT_20261122](../reviews/E201_AXIAL_STATIONARY_SIGN_AUDIT_20261122.md) | c87ef42cf1daede198aa460fba6f0aec034e428551315f9a8462ef6cd9a82a1a |
| [e201_axial_sign_verify](../numerics/e201_axial_sign_verify.py) | abfcd93dd0bd8e268b8d04b613c652033501407d5a5d3d571333fddb86b2d47c |
| [SP4-CME-E201_RETURN_v1](../research-progress/handoffs/SP4-CME-E201_RETURN_v1.md) | e4242fe5207957106179ddcb40437992925690c6766c9748b006a2503e4759a3 |
| [E187_E189_STATIONARY_KERNEL_ASSESSMENT_20261122](../reviews/E187_E189_STATIONARY_KERNEL_ASSESSMENT_20261122.md) | 65340bab67c625edce42351649ef69399c0c6f671c5fc021ac7238f9f5630c40 |
