# SP4-CME-E128 return v1

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and selected
lead settings were unavailable. I authored E119 and E63 and
audited E57 in E61. I did not author E53 or E57. See the
[request][req], [B66 decision][b66] and [derivation][note].

## Mixed coefficient estimate

Pass. In the fixed E53/E57 inhomogeneous decomposition,
\[
       \|AD^2q+BDq+Cq\|_{L^1_t\mathcal B^{1/2}}
            \le C\epsilon \big(M_T(q)+H_T(q)\big)
\]
uniformly for \(0<T\le1\) under the stated weighted derivative
bounds. Annular division and integration across \(t=2^{-2j}\)
give \(L^1_tL^\infty\) coefficient block sizes \(C\epsilon 2^{-2j}\)
for \(A\), \(C\epsilon2^{-j}\) for \(B,C\). The low blocks obey
the same estimates at \(j=0\) since \(T\le1\).

In the low-coefficient case the partial sum is one bounded
low-pass multiplier, so \(A\) costs \(H_T(q)\). For \(B,C\) the
split on the high defect block at \(2^{-2k}\) gives the block
cost \(2^{(d-1)k}\sup_t\|q_k\|_8+
2^{(d+1)k}\int\|q_k\|_8\) before the output weight,
where \(d=0,1\). In the high-coefficient case the time-integrated
coefficient blocks give the summable separation powers \(2-s\)
and \(1-s\). Comparable blocks may output at any lower index,
including zero, and \(s>0\) sums those weights. Their time costs
are bounded by the same sup or split estimates.

Fixed cutoffs, frame changes and connection terms are included.
The actual nested localization uses the compact overlap block
bound \(\min(1,2^{4(j-k)})\) at both Besov exponents.
The estimate extends to the E57 path completion by spatial
truncation and then finite-mode time approximation in the
continuously traced class. It is continuous also for the
weighted coefficient completions. On positive strips the
completed products are the usual distributional products.
No equation or regular trace assumption on the coefficients
was used.

## Third weighted jet

Pass. E119's total order four applies to
\(\partial_s^\alpha D_u\Psi_r\) through \(|\alpha|=3\).
The band speed coefficients and their third parameter
derivatives still have amplitude at most \(C/r\) on the same
band. The source bounds and Neumann inverse are unchanged.
Stationarity and integration on the datum segment give the
linear estimate for these parameter derivatives. At \(t=r^2\)
the third directional derivative is \(r^3D_V^3\). With
\(W=\nabla_V^0V\), its lower terms are
\(D^2(W,V)+2D^2(V,W)+D_{\nabla_V^0W}\), applied to the
section. Polarization and the curvature commutators in both
adjacent slot pairs recover the full ordered third derivative.
The first-two swap includes base curvature on the derivative
covector slot, and the last-two swap includes the derivative
of the fixed bundle curvature. Both are controlled by lower
weighted jets. The resulting bound is
\[
 \sup_{0<t\le\mathcal T/4}\sum_{k=0}^3
       t^{k/2}\|D^k\mathsf S(u)(t)\|_\infty\le C\|u\|_\infty
\]
on one fixed smaller datum ball. The pointwise chain rule
gives the requested \(A\) coefficient bounds through \(D^3\)
and affine \(B,C\) bounds through \(D^2\). The highest latter
term is \(D^3U\).

This checks only an analytic source estimate and a linear
datum bound for the third background jet. No third-order
Taylor remainder, E125 application or geometric endpoint
theorem is claimed. Only the two named E128 files were written.
No new primary source was inspected.

## Verified file identities

| File | SHA-256 |
| --- | --- |
| E128 request | `b9497e14313e34212dbac8636c085ef55c3f8385629e9993bdeffc4595a93d5c` |
| B66 decision | `8b88be9f2ccc4f29ad3b55fd3f81ed0ae7f737d8d22a91d65a1a927c8669399c` |
| E53 | `6c30a73e93b435c9a6414628b2125235c0d72d58a93b5919608afb67b882c312` |
| E57 | `8bc1cc7551e137d58324ce9f837c174d0766330f9d61586d14c6c24e4778a3d7` |
| E119 | `4f95593842c04f25d45535912cc91c032cb1588e5fd3892d33cbc194382988ea` |
| E119/E122 assessment | `0f3d1c976e6f244e42498ca6cc9a749001a6b73aef06c21be8e97c2a1dfc0174` |
| E128 derivation | `26e1a08d8e4439a628818d3e6ccc3a794126fc63487bbc9a85ebbd3c0b1ab79f` |

[req]: SP4-CME-E128_REQUEST_v1.md
[b66]: ../../brainstorm/notes/B66_MIXED_DEFECT_PRODUCT_TEST_20261122.md
[note]: ../../notes/128_MIXED_PARABOLIC_COEFFICIENT_PRODUCTS_20261122.md
