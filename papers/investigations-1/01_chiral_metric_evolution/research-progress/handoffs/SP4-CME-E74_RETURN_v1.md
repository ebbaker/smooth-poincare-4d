# SP4-CME-E74 return v1

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and
selected lead settings were unavailable. I authored E63 and the
earlier E50 recovery transfer. This packet uses the assessed E63
smoothing estimate and supplies a new generator and ODE argument.
See the [request][req] and [derivation][note].

## Disposition

For the fixed native round reference and sufficiently small
smooth compatible full pair norm \(\delta\), the actual piecewise
field \(W=-\xi\) used in \(\dot j=W\circ j\), \(g=j^{-1}\),
satisfies \(\int_0^\infty\|W\|_{C^1(P)}\,d\tau\le C\delta\).

- On the initial interval \(d_Aa=\beta+[a\wedge a]/2\).
  The frozen-metric vertical term is exactly \(d_0^*a\).
  Expanding the live codifferential on \(d_Aa\) gives both
  Christoffel-difference terms. Their derivatives cost at
  most \(C(h_2+h_1^2)\), with \(h_j=\|D_0^j(a,\beta)\|_\infty\).
  The horizontal lift in a fixed chart contributes
  the product \(-A_iY^i\) and the derivative of the fixed
  fiber factors. The total \(C^1\) bound is
  \(C(h_0+h_1+h_2+h_1^2)\). E59's Bernstein estimates
  and blockwise time interpolation give \(C(H+MH)\)
  for its integral, bounded by \(C(\delta+\delta^2)\).
- On the stable tail \(W_{\rm st}=\delta_0b+\chi_B(\Delta_0S_0^*b)\).
  All inner operators are fixed. The chart lift product adds
  at most a quadratic term in \(\|b\|_{C^3}\).
  The fixed embedding \(H^m\to C^3\) for \(m\ge6\),
  E63 at the splice, and E49 decay give
  \(C(q_b+q_b^2)\), with \(q_b\le C\delta e^{-\alpha u}\).
- For \(c=g_{\rm loc}(\tau_0)\), the piecewise direct map on
  the tail is \(j(\tau)=j_{\rm st}(u)c^{-1}\).
  Consequently \(j_\infty=j_{{\rm st},\infty}c^{-1}\) and
  \(g_\infty=cg_{{\rm st},\infty}\).
  The finite-chart derivative ODE gives direct \(C^1\)
  convergence, a positive Jacobian lower bound, and
  uniformly bounded inverse derivatives. These, compactness
  and the inverse function theorem give a \(C^1\) equivariant
  automorphism with \(C^1\) inverse over an orientation-preserving
  base diffeomorphism. Inverse derivatives converge by uniform
  continuity of the limiting direct derivative at moving points.
  Both limit maps are \(O(\delta)\) from identity in the fixed
  chart \(C^1\) neighborhood. The inverse convergence assertion
  is qualitative in \(C^1\).
- In the given left action the recovered pair tends in \(C^0\)
  to \(j_\infty^*(A_0,F_0)=g_\infty\cdot(A_0,F_0)\).
  The continuous limiting potential has the indicated continuous
  curvature as the representative of its distributional
  exterior derivative plus bracket term. This follows by
  uniform convergence of both potentials and finite-time
  curvatures in smooth local sections.

The integrated estimate concerns the direct ODE generator.
The conjugated right velocity of \(g\), a smooth limiting
automorphism, and a \(C^1\) inverse convergence rate are outside
the established scope. All thresholds and constants are for
the fixed reference, atlases, bundle norm, value tube, order
\(m\), common times, splice strip, and stability and smoothing
constants. No higher smooth initial norm is used. No new
primary source was inspected or used. Only the designated
derivation and return were edited.

## File identities

The six frozen note and review digests matched before use.
The B45 digest records the observed conceptual input.

| File | SHA-256 |
| --- | --- |
| SP4-CME-E74_REQUEST_v1.md | `328140bef9a6fad4701f210e1a06c476cc69d224bf85756439b2bba152d47a91` |
| B45_CRITICAL_GAUGE_LIMIT_20261122.md | `10f60dd4e3ace603a10b0eaf2899352d384d0036f912042e8f3fb3d9aaddd883` |
| 59_CRITICAL_PATH_STRAIN_20261122.md | `2441c43abbed3380facfa1ad105c91c3455f016ea2a36949df54b689d93a9a1a` |
| 60_COMPATIBLE_CRITICAL_EVOLUTION_20261122.md | `c34bf22a1f80092a1ba33b154e4c2b308db1907ad56727099675321865a0246d` |
| 62_GLOBAL_CRITICAL_STRAIN_BUDGET_20261122.md | `a14e79a0ad8def1deed7af897aa33ebd734e26a3d0d161c95f30c415e82f0026` |
| 63_QUANTITATIVE_POSITIVE_TIME_SMOOTHING_20261122.md | `427b413cf2e4aaf4cee52d721014bb932fa1e5db8d0cc6db92649bd6aa73c1eb` |
| 49_FIXED_GAUGE_NONLINEAR_STABILITY_20261122.md | `45ed7b07731863a78a7d5c82fd150b27f28ec8ada8faf8769cb193e5606a1a16` |
| E67_GLOBAL_BUDGET_AUDIT_20261122.md | `abfb4370645ac042a039629dd4725bf67a0bb81897f52cf4ac49fdbe26c0c0c8` |
| 74_CRITICAL_RECOVERY_LIMIT_20261122.md | `b2178fb149712df61c6b660bca00e10451c1d38c5434bb562607d9ba369139fa` |

[req]: SP4-CME-E74_REQUEST_v1.md
[note]: ../../notes/74_CRITICAL_RECOVERY_LIMIT_20261122.md
