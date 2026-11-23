# SP4-CME-E155 return v1 — Pair compactness from a supplied metric limit

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Bounded E proof, configured gpt-6.2-sol /
ultra. Independent runtime attestation and actual lead identifiers
are unavailable. The executor authored E145 and E148 and the related
E03A and E14 calculations. E09, E137
and the E148/E150 assessment are inherited work. [Request][req] ·
[Derivation][note].

## Disposition

**Pass with the supplied \(C^1\) metric convergence.** On the fixed
smooth principal \(SO(3)\) bundle and base, with the native internal
metric and specified positive-plane curvature-map sign, E155
constructs smooth equivariant \(H_n\) covering the supplied
\(\varphi_n\). The normalized connection and curvature have a
uniformly convergent subsequence in one fixed smooth affine pair
background. Its limit is a positive continuous pair with the same
sign, reconstructs \(g_\infty\), and is compatible in distributions.

## Main checks

- The curvature isometries are
  \(\sigma_n=-F_n^\sharp S_n^{-1}:E\to\Lambda^+_{g_n}\).
  With \(g'_n=\varphi_n^*g_n\), their pullback has source
  \(\varphi_n^*E\) and target \(\Lambda^+_{g'_n}\).
  The positive tangent metric isometry from a fixed \(g_b\) to
  \(g'_n\) induces \(J_n:\Lambda^+_{g_b}\to\Lambda^+_{g'_n}\)
  by inverse pullback on forms, and \(J_n\) converges in \(C^1\).
  The fixed \(\sigma_b:E\to\Lambda^+_{g_b}\) can be chosen from
  the first connection. The oriented isometry
  \(U_n=(\varphi_n^*\sigma_n)^{-1}J_n\sigma_b:E\to\varphi_n^*E\)
  induces \(H_n\) on the original oriented frame bundle.
- In the fixed internal labels the transformed chiral derivative
  is exactly \((J_n\sigma_b)^{-1}D^{+,g'_n}(J_n\sigma_b)\).
  Its coefficients use the normalized metric and its first
  derivatives and converge uniformly. This formula accounts for
  the derivatives of the bundle identifications without a
  separate bound on \(D\varphi_n\) or \(DH_n\).
- The native bounds are
  \(|b|\le2\sqrt6|T|\) and
  \(|\nabla^\Gamma b|\le\sqrt2(6|\nabla^AT|+
  (36+8\sqrt3)|T|^2)\). The inverse strain identity gives
  \(|\nabla^AQ|\le6|T|\). Uniform frame and coordinate comparison
  then bounds the ordinary coordinate derivatives of \(b'_n\)
  and \(Q'_n\). Finite-chart Arzelà–Ascoli gives simultaneous
  convergence, and \(F'_n=-\sqrt{Q'_n}J_n\sigma_b\) gives uniform
  curvature convergence. The floor and trace pass to the limit,
  with wedge volume \(dV_{g_\infty}\). The fixed-reference
  distributional curvature formula gives compatibility.
- The spectral floor is equivalent to a supplied uniform bound
  for E137's whole-fiber distortion
  \(\sqrt{\lambda_{\max}/\lambda_{\min}}\), using trace three.
  The supplied uniform \(|T|+|\nabla^AT|\) bound is equivalent
  to a supplied uniform bound for E145's spatial \(\Psi\).
  These are static comparisons. For actual late slices of a
  single original smooth flow, with the stated hypotheses,
  the normalized subsequence meets the assessed E148 criterion
  and implies smooth original continuation.

This packet supplies no base metric compactness theorem and
does not establish the hypotheses along a flow. The supplied
\(C^1\) metric convergence yields the uniform pair conclusion
with no higher convergence assumed. No fresh source or
numerical experiment was used. Only the specified derivation
and return were written.

## Verified identities

| File | SHA-256 |
| --- | --- |
| E155 request | bc099c1113d2695aa7d91a58f9ab356978ce1fd25452f736278932308d390ded |
| B78 decision | e5a9b33906e6b5fa8879098c5f57478411d84c47569f02485a44ce5aa9e8c63e |
| E09 derivation | c5e66058a3c73e13d6582a5f84c3e297080c67ae2ee6458c0a8bf5ac30e266ae |
| E137 derivation | 8b2622b44a5a46106f28f67e2a37b2e1a129d238281a7be1f811498a48d95193 |
| E145 derivation | 544d6d1299560adcd99327d206ca737d44e4a1449567efac8795176ef34833f4 |
| E148 derivation | 526fa0a48fe414989549172efc4c2c71b3093b8a4b22ae537c2035e0709ee894 |
| E148/E150 assessment | 6c9480a6dfaedbff17156541faa9c350e61bcf7925d5ae4cec88e8a7d93d4557 |
| E155 derivation | e8533973ae350ab1c887633212fa942fbfbd0b453a0a3949af5051de8d783ce6 |

[req]: SP4-CME-E155_REQUEST_v1.md
[note]: ../../notes/155_PAIR_COMPACTNESS_FROM_METRIC_LIMIT_20261122.md

