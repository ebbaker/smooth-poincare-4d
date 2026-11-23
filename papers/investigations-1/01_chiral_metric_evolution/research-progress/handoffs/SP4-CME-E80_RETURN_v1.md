# SP4-CME-E80 return v1

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and
selected lead settings were unavailable. I authored E71 and did
not author E79 or E73. See the [request][req] and [audit][review].

## Disposition

E79 passes in its stated smooth native round value tube.
The audit found no mathematical correction to the claims.

- The raw value bounds on \((a,\beta)\) give the claimed fiber
  elimination and bounded nonorthogonal projection \(\Pi_A\).
  Both \(K_A\phi\) and \(d_0^*\Pi_A r\) annihilate the reference
  kernel in the test argument. The restricted isomorphism
  \(K_A|_V:V\to Z\) follows by a value-only perturbation
  of E71's weak inverse. It gives uniform \(L^2\)-input
  mixed \(H^1/L^2\) bounds.
- The residual is the exact bounded projection onto the
  fixed slice, with the closed restricted orbit image as
  its kernel. The unrestricted image equals the restricted
  image plus \(z_A(N)\), a finite-dimensional subspace of
  the slice. Actual infinitesimal stabilizers use precisely
  the parameters in \(\ker z_A\). The old-pair example gives
  nonzero motion at a point with \(\beta(p)=0\). Its projected
  residual is a separate calculation.
- In density-weighted coordinates, write the raw form blocks
  as \((\mathsf A^{ij},\mathsf B^i,\mathsf C^j,\mathsf D)\).
  The transpose exchanges the two lower first-order blocks
  and takes their adjoints. Its expanded zero-order term is
  \(\mathsf D^*-\partial_i\mathsf C^{i*}\), with no additional
  derivative of the leading block. Thus \(H^{s+2}\) estimates
  for either operator with \(H^s\) forcing use at most
  \(s+1\) raw coefficient derivatives.
- At negative integer order \(-k\), the restricted
  transpose equation has a finite-rank forcing correction
  in the smooth fixed \(N\). Its coefficients use only the
  weak bound. The transposed parameter map then takes
  \(H^{k-1}\) into \(H^k\), giving the desired dual gain
  \(H^{-k}\to H^{1-k}\) with coefficient derivatives through
  \(k\). The higher-order constants depend on those
  derivatives. The value-only estimate is the \(L^2\) endpoint.
- For the actual \(A\)-horizontal generator, active pullback
  has derivative \(d_A\phi+S_Au\). Inverse pullback has the
  opposite sign.

The conclusion is infinitesimal. Finite nonlinear slice
existence remains open in the audited setting. No new
primary source was inspected. Only the named audit and return
were edited.

## File identities

The three frozen inputs matched the request before use.
The B47 digest records the observed rationale.

| File | SHA-256 |
| --- | --- |
| SP4-CME-E80_REQUEST_v1.md | `f8ba7670420d8e0b101d030d5afd9d31b89c8500d96e9b8be072cb4f92a8ff50` |
| B47_VALUE_SMALL_ORBIT_INVERSE_20261122.md | `13539118593c28cbebf5399bbff0779f60e7b9acd06806c4c7ce32aaef306c9c` |
| 79_VALUE_SMALL_ORBIT_INVERSE_20261122.md | `1a88243342f6b805b82d4297043adde37e66bef632c7ca09a71f5449f52c5560` |
| 71_LINEAR_ROUND_SLICE_20261122.md | `40a572ac01c81e65ec41798721a378fbff082a9023fcd7d69faec74dbff809ef` |
| E73_LINEAR_SLICE_AUDIT_20261122.md | `d64056adc3bfff226ba69a9cccff29a7a667b946d394f4be0a933c7eb0cc099f` |
| E80_ORBIT_INVERSE_AUDIT_20261122.md | `10009438d0eca3e7fe8eb8ebdb78082b9b200812ca8fdb31b99698368ebab39f` |

[req]: SP4-CME-E80_REQUEST_v1.md
[review]: ../../reviews/E80_ORBIT_INVERSE_AUDIT_20261122.md
