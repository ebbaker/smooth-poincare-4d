# SP4-CME-E130 return v1

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol` / `ultra`. Independent runtime and selected lead identifiers were unavailable. I authored E53 and E42 and previously audited E57's use in E64. I did not author E57, E119 or E128. E121 was a source check separate from E119's proof. The independent check here covers E128's new analytic arguments. [Request][req], [audit][audit], [E128][e128], [B66][b66].

## Disposition

**Pass.** For \(p=8\), \(s=1/2\) and \(0<T\le1\), the derivative and time assumptions yield frequency-block \(L^1_tL^\infty\) bounds \(C\epsilon 2^{-2j}\) for \(A_j\) and \(C\epsilon2^{-j}\) for \(B_j,C_j\). Splitting at \(2^{-2j}\) works also when the split lies beyond \(T\). The low block costs \(T\) or \(\sqrt T\). The low-coefficient/high-defect term uses the single bounded partial-sum multiplier, with a short/late time split for the \(t^{-1/2}\) coefficients. The high-coefficient/low-defect term sums with separation powers \(3/2\) and \(1/2\). Comparable pairs can output at every lower scale including the constant mode, and \(s>0\) sums those weights. These give
\[
 \|AD^2 q+BDq+Cq\|_{L^1_t\mathcal B^{1/2}}
       \le C\epsilon E_T(q)
\]
without a governing equation for either the coefficients or the defect path.

Localization uses E57's nested cutoffs and full fixed product derivatives, placing their smooth lower terms in allowable derivative orders. The fixed overlap block bound \(\min(1,2^{4(j-k)})\) sums at \(\sigma=s,s+2\), since both \(\sigma,4-\sigma>0\). The proof works from Fourier polynomials in \(q\) with the original coefficients, then passes to the completed source by spatial truncation and reconstruction. The strong E57 trace is respected by uniform smooth approximation in the remaining finite modes. Arbitrary measurable paths receive only the corresponding spatial approximation. On positive strips the products agree with their ordinary distributional values, and continuity in the weighted coefficient norms needs no coefficient trace or time cutoff at zero. [E53][e53], [E57][e57].

E119 (10) gives the \((3,1)\) parameter-datum derivative on the same uniform balls. The differentiated band speed is still \(O(r^{-1})\) on its original band with the same source bounds. Stationarity and datum integration give the linear size of the parameter derivatives. Expanding \(D_V^3\) for \(W=\nabla^0_V V\) gives \(D^3(V,V,V)+D^2(W,V)+2D^2(V,W)+D_{\nabla^0_VW}\). Polarization and the adjacent-slot curvature identities on \(DZ\) and \(D^2Z\) recover the full ordered third jet. They include base curvature on the covector slot and the derivative of fixed bundle curvature. Uniform spanning right inverses and the lower weighted jets absorb every correction. The chain rules give \(C\delta t^{-m/2}\) for the principal array through \(m=3\) and \(C\delta t^{-(m+1)/2}\) for the affine first-jet arrays through \(m=2\), controlled by \(D^3U\) at the highest order. This is a linear datum bound. A third-order Taylor remainder and any application to the geometric equation remain outside scope. No new primary theorem or mathematical correction was needed. [E119][e119], [E119/E122 assessment][a119].

## File identities

All seven E130 frozen inputs and all five E128 frozen inputs matched. Only the designated audit and return were written.

| File | SHA-256 |
| --- | --- |
| SP4-CME-E130_REQUEST_v1.md | `d6fde4ce7ca420b6ae1717315a4d276a0eeee656adc343657da83910ffe7c804` |
| 128_MIXED_PARABOLIC_COEFFICIENT_PRODUCTS_20261122.md | `26e1a08d8e4439a628818d3e6ccc3a794126fc63487bbc9a85ebbd3c0b1ab79f` |
| SP4-CME-E128_REQUEST_v1.md | `b9497e14313e34212dbac8636c085ef55c3f8385629e9993bdeffc4595a93d5c` |
| SP4-CME-E128_RETURN_v1.md | `39380f83f075e2ea2e0d0e07c31e977104adc8522903dc5a0e4295fef3cc1170` |
| B66_MIXED_DEFECT_PRODUCT_TEST_20261122.md | `8b88be9f2ccc4f29ad3b55fd3f81ed0ae7f737d8d22a91d65a1a927c8669399c` |
| 53_CRITICAL_FINITE_P_HEAT_20261122.md | `6c30a73e93b435c9a6414628b2125235c0d72d58a93b5919608afb67b882c312` |
| 57_COMPACT_CRITICAL_LINEAR_20261122.md | `8bc1cc7551e137d58324ce9f837c174d0766330f9d61586d14c6c24e4778a3d7` |
| 119_UNIFORM_PARABOLIC_REMAINDER_20261122.md | `4f95593842c04f25d45535912cc91c032cb1588e5fd3892d33cbc194382988ea` |
| E119_E122_UNIFORM_REMAINDER_ASSESSMENT_20261122.md | `0f3d1c976e6f244e42498ca6cc9a749001a6b73aef06c21be8e97c2a1dfc0174` |
| 42_SMALL_VALUE_ROUGH_SYSTEM_20261122.md | `4e1f0bcf6d9b4dd0fbd1a0c49f416154ff2b92a256502ce0bba2d7a14e36fd77` |
| E130_MIXED_COEFFICIENT_AUDIT_20261122.md | `b052ba0474bb3aaa3d984acb3f35d331d14213555a801e4ae05f88fe7a069497` |

[req]: SP4-CME-E130_REQUEST_v1.md
[audit]: ../../reviews/E130_MIXED_COEFFICIENT_AUDIT_20261122.md
[e128]: ../../notes/128_MIXED_PARABOLIC_COEFFICIENT_PRODUCTS_20261122.md
[b66]: ../../brainstorm/notes/B66_MIXED_DEFECT_PRODUCT_TEST_20261122.md
[e53]: ../../notes/53_CRITICAL_FINITE_P_HEAT_20261122.md
[e57]: ../../notes/57_COMPACT_CRITICAL_LINEAR_20261122.md
[e119]: ../../notes/119_UNIFORM_PARABOLIC_REMAINDER_20261122.md
[a119]: ../../reviews/E119_E122_UNIFORM_REMAINDER_ASSESSMENT_20261122.md
