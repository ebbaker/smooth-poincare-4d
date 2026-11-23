# SP4-CME-E43 return v1

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The configured helper launch was
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and selected
lead settings were unavailable. See the [frozen request][req] and
[proof audit][audit]. I did not write E41. My prior participation
included related source and geometric packets.

## Verdict

E41 (1) passes under its fixed smooth compact-bundle hypotheses.
The audit verified all four requested steps.

- The nonselfadjoint Fourier shift gives a Gaussian for the
  frozen kernel. Removing a longest time link in the spatial
  convolution gives one exponent for the Levi series. The time
  simplex powers \(t^{(m-k)/2}\) for \(k=0,1\) and the Gamma
  denominator justify causal summation, the first output derivative
  and the strong initial trace. Energy uniqueness and adjoint
  duality give the source derivative without differentiating the
  singular parametrix twice.
- Rank-one Fourier positivity gives the Gårding inequality
  used in the localized energy estimate. Early slab powers
  \(r^{-4},r^{-5}\) cancel the local forcing masses.
  The late slab integrals converge because
  \(4q'<6\) and \(5p'<6\), and the Hölder scale factors cancel.
- The frozen two-derivative multiplier and parabolic dyadic
  decomposition give the upper-cylinder divergence estimate.
  Young's exponents for the other forcing obey
  \(1+1/p=1/q+1/p'\). After rescaling, the cutoff commutators
  have bounded lower-order or divergence form and the principal
  coefficient error costs \(O(r)\) times the gradient. Positive-time
  smoothness for the initial smooth-source argument follows from
  difference quotients before applying the cutoff estimate.
- The bound extends to arbitrary finite \(Y\) by truncation and
  weak gradient convergence. This gives distributional zero trace.
  Uniform zero trace holds for smooth forces through \(t=0\)
  and for their \(Y\)-completion. E41 lines 26 and 134 could
  make the closed-slab smoothness explicit. The audit includes a
  finite-\(Y\) scalar example proving the need for this distinction.

The audit preserves the dimensionally scaled packet norms and
checks the printed Koch–Lamm normalization separately. The
reopened source was the existing arXiv:1310.3658v1 record.
No additional primary theorem, new file download, shared edit or
nonlinear conclusion is needed. No unresolved linear proof gap
was found.

## Input and output identities

All four frozen input hashes matched.

| File | SHA-256 |
| --- | --- |
| SP4-CME-E43_REQUEST_v1.md | `3409f1fb28b05d18941e3ed7d9954969a09c5012550cd1c1cd2fe7884f50ed4e` |
| 41_COMPACT_LINEAR_ESTIMATES_20261122.md | `8a35523c145e5781f2bac77163cb7f7a2972e10a69deb37f0c69c26adf573ca3` |
| SP4-CME-E41_REQUEST_v1.md | `b431ac9d4b3d14ab3651b78cc995bd87a9d1fc0f795725067f6e18bd180743c1` |
| 37_ROUGH_DATA_SOURCE_TEST_20261122.md | `de2c9c2887a6df86d32c0c40f8ae2ce8da6bfc16a7c2a0158a2c3a8862ed424d` |
| B33_COMPACT_ROUGH_SYSTEM_20261122.md | `fd2f7557e141a15479daecbdd331ddec0207ca5be035bfa8180db24b6d9cb734` |
| E43_COMPACT_LINEAR_AUDIT_20261122.md | `c649f1c7deef0c63acb48a37a21bf61cead23bdf9be9299287a3e0451924a43f` |

[req]: SP4-CME-E43_REQUEST_v1.md
[audit]: ../../reviews/E43_COMPACT_LINEAR_AUDIT_20261122.md
