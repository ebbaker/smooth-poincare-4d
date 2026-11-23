# SP4-CME-E157 return v1 — Semidefinite limit rank test

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Bounded E proof, configured gpt-6.2-sol /
ultra. Independent helper runtime attestation and actual lead
identifiers are unavailable. The executor authored E155, E145 and
E148. E09 and the E148/E150 assessment are inherited.
[Request][req] · [Derivation][note].

## Disposition

**Pass conditional on the separate assessment of E155's extraction.**
On the fixed smooth compact closed connected simply connected
oriented real four-manifold with \(H^2(M;\mathbb R)=0\), the supplied
\(C^1\) positive metric convergence and uniform live strain bounds
suffice for a positive normalized uniform compatible pair limit
even with no assumed eigenvalue floor. This uses native negative
Killing conventions and the positive-plane, round-compatible
curvature-map sign on the fixed \(SO(3)\) bundle.

## Checked steps

- **Floor-free extraction.** The E155 smooth bundle maps are
  defined at each \(n\) by the individually positive \(Q_n\).
  The transformed chiral connection, the \(b,\nabla^\Gamma b\)
  bounds and the \(Q\) derivative estimate require no common
  floor. Arzelà–Ascoli gives a continuous limiting connection
  and semidefinite trace-three \(Q_\infty\). Continuity of the
  positive semidefinite square root gives
  \(F_\infty=-\sqrt{Q_\infty}\sigma_\infty\) uniformly, with
  \(\sigma_\infty\) a \(C^1\) orthonormal chiral triple for the
  given limiting metric. Both the exact curvature formula
  and the covariant Bianchi identity pass in distributions.
- **Relative transport.** The inverse strain expression yields
  \[
    |\langle(\nabla^A_YQ)v,v\rangle|
       \le4|Y|\,|T|\,\langle Qv,v\rangle .
  \]
  Two-sided Gronwall in the finite-slice parallel frames passes
  to each fixed curve by uniform connection convergence and the
  linear transport ODE. Kernels are carried onto kernels, so
  connectedness gives one rank and the kernel projection
  \(\Pi\) is parallel.
- **Low-regularity curvature.** Coordinate-line transport
  yields the continuous partials \(\partial_i\Pi=-[\mathcal A_i,\Pi]\),
  so \(\Pi\) is \(C^1\). The local continuous \(d\mathcal A\)
  allows mollification in the alternating product rule.
  Commuting distributional coordinate derivatives and using
  Jacobi gives \([\operatorname{ad}(F_{\infty,ij}),\Pi]=0\)
  pointwise. This requires no ordinary first derivative bounds
  for all connection coefficients.
- **Rank contradiction.** Rank two would give curvature in
  the line stabilizer, whose curvature values must lie in
  the kernel line, whereas the curvature image is its
  two-plane orthogonal complement. Rank one gives a global
  \(C^1\) parallel unit image section by simple connectivity.
  The corresponding scalar form is \(C^1\), self-dual of
  squared norm three, and closed by Bianchi. Smooth closed
  approximation by averaging small pullbacks justifies smooth
  de Rham and Stokes, contradicting its strictly positive
  wedge-square integral. Trace three excludes rank zero.

The remaining rank three limit reconstructs the supplied positive
metric and has the stipulated sign. For actual late slices of the
same original smooth flow it meets the assessed E148 criterion,
conditional on acceptance of the E155 extraction used here.
The construction supplies neither base metric normalizations nor
strain bounds along an evolution. No new primary source, numerical
experiment or metric compactness theorem was used. Only the
specified derivation and return were written.

## Verified identities

| File | SHA-256 |
| --- | --- |
| E157 request | 3e07b1bac3978f5aed2bfe1df4e44e47a9013c109a6d8b9e73fe25d275511d59 |
| B79 decision | 1c0e07dc6e4d986c34c541196d9a0ef1abba97f377292a6989b355d23252a23c |
| E155 derivation | e8533973ae350ab1c887633212fa942fbfbd0b453a0a3949af5051de8d783ce6 |
| E145 derivation | 544d6d1299560adcd99327d206ca737d44e4a1449567efac8795176ef34833f4 |
| E09 derivation | c5e66058a3c73e13d6582a5f84c3e297080c67ae2ee6458c0a8bf5ac30e266ae |
| E148/E150 assessment | 6c9480a6dfaedbff17156541faa9c350e61bcf7925d5ae4cec88e8a7d93d4557 |
| E157 derivation | 50e48a665f370b3c24b642f3e172e32f53ffbdc0775e3ae198dedb19fbabdde9 |

[req]: SP4-CME-E157_REQUEST_v1.md
[note]: ../../notes/157_SEMIDEFINITE_LIMIT_RANK_TEST_20261122.md

