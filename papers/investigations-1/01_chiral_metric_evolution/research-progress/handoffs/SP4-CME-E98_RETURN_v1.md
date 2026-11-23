# SP4-CME-E98 return v1

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. The helper launch was configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and
selected lead settings were unavailable. I authored E88 and did
not author E89, E66 or E93. [Request][req]. [Derivation][note].

## Disposition

The finite internal gauge result holds. For every smooth \(a\)
with sufficiently small reference \(\|a\|_{4,1}\), there is a
smooth \(u=e^\phi\in\Gamma SO(V)\) over the identity with
\[
 b=u a u^{-1}-(d_0u)u^{-1},\qquad d_0^*b=0,\qquad
 \|\phi\|_{W^{1,(4,1)}}+\|u-I\|_{C^0}+
    \|d_0u\|_{4,1}+\|b\|_{4,1}\le C\|a\|_{4,1}.
\]
The threshold and quantitative constant depend on the fixed
reference. They use no curvature smallness or higher
derivative bound on the input.

The ordinary scalar \(K=d_0^*d_0\) has trivial adjoint kernel
because a parallel section commutes with the curvature values
spanning \(\mathfrak{so}(3)\). The proof derives its distinct
divergence inverse via the weak \(L^2\) estimate, frozen
gradient multipliers on \(L^8\), and the common Lorentz
layer estimate. The \(W^{1,(4,1)}\) algebra and continuous
embedding justify the exponential chain rule. The exact
remainder in \(b=a-d_0\phi+N\) satisfies the required
bounds and gives the contraction \(\phi=K^{-1}d_0^*(a+N)\).
The resulting gauge condition holds in distributions.

To prove smoothness, the weak Coulomb equation tested against
\(v u^\top\) gives \(D^i(b_i u)=b_iD^i u\). For \(w=u-I\)
the equation becomes
\((I+\Delta_0)w=b_iD^iw-(D^iw)a_i+w-uD^ia_i\)
on endomorphisms. The coefficients of the first-order
perturbation are small in \(L^4\); the last two terms
are bounded for smooth \(a\). The fixed \(L^2\) resolvent
first gives \(H^2\). A Neumann solution in \(W^{2,3}\)
is identified by the small perturbation uniqueness on
\(H^2\). The resulting \(L^{12}\) bounds of \(Du\)
and \(b\) give an \(L^6\) right side and \(W^{2,6}\).
The higher fixed resolvent and algebra bootstrap give
smoothness, including a smooth local logarithm.
Higher regularity constants may depend on higher
norms of \(a\). No horizontal conclusion or stabilizer
uniqueness is asserted. No new primary source was
used, and Feehan's theorem was not invoked. Only the
named note and return were edited.

## File identities

All four frozen methodological inputs matched the request.
The B57 digest records the observed decision.

| File | SHA-256 |
| --- | --- |
| SP4-CME-E98_REQUEST_v1.md | `d381c51d891f922016a189b385b74ece7730bfac17b515bda5e68a641cbc7ef3` |
| B57_FINITE_LORENTZ_VERTICAL_GAUGE_20261122.md | `d3f7e1596d30e9a60811c4a3d60b0551708792d6df8bafeeaae64c378b7df85e` |
| 88_LORENTZ_ORBIT_SOLVER_20261122.md | `91277aa9a194c8ee83b4ce6434619722202844ff4400b687a842b559f709f274` |
| E89_LORENTZ_ORBIT_AUDIT_20261122.md | `0f3e17807d50c6c35be82c2c442a3f3fce0bc139dfbb1cd83074ced88b371484` |
| 66_FIXED_SLICE_STRAIN_ESTIMATE_20261122.md | `09ff98b37c5c4b3b84db9bc32e8745ce93b73efdc6e720a5c7d6a5b9393d0a66` |
| E93_CRITICAL_GAUGE_SOURCE_AUDIT_20261122.md | `19d15e665b7af7a0dabb21d6e8c0ed9797967d07aec5becc13ca9d824e43cc75` |
| 98_FINITE_LORENTZ_VERTICAL_GAUGE_20261122.md | `06c883cc5a6626f4748c218b75633ce1cdb947758b04f923b2255ca207251bf4` |

[req]: SP4-CME-E98_REQUEST_v1.md
[note]: ../../notes/98_FINITE_LORENTZ_VERTICAL_GAUGE_20261122.md
