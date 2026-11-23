# SP4-CME-E88 return v1

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. The helper launch was configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and
selected lead settings were unavailable. I authored E79. I did
not author E71, E80, E66 or E70. [Request][req]. [Derivation][note].

## Disposition

The exact E79 solver satisfies the value-uniform estimate
\[
 \|\phi\|_{W^{1,(4,1)}}+\|\phi\|_{C^0}+\|u\|_{4,1}
                 +\|r_{\rm sl}\|_{4,1}\le C\|r\|_{4,1}
\]
in the fixed reference norms for smooth \(A,r\), when
\(\|A-A_0\|_\infty+\|F_A-F_0\|_\infty\) lies in a sufficiently
small fixed tube. The constant and threshold use no higher
derivative of those two coefficient differences.

The distinct fixed operator \(K_0^\dagger d_0^*\) uses
the finite-rank correction
\(\sum_j(w,d_0\psi_j)\psi_j\) on divergence input \(w\).
It vanishes on pointwise \(\ker S_0^*\) fluxes and is
bounded by the input at both endpoints for arbitrary flux.
The \(L^2\to H^1\) bound is E71's weak inverse.
For \(L^8\to W^{1,8}\), the cutoff terms are rearranged
as flux and value terms before freezing. The frozen
gradient from divergence forcing has an order-zero
multiplier with the needed kernel and first derivative
bounds. The value forcing uses an order-minus-one
gradient multiplier with summable \(L^1\) block kernels.
The reference coefficient oscillation is absorbed, and
a fixed mollifier interpolation removes the \(L^8\)
value remainder using the weak \(L^2\) bound.
Common endpoints therefore give the \(L^{4,1}\)
bound by the E66/E70 layer method.

The exact nonsymmetric perturbation remains inside the
weak divergence, including the lower bracket term.
Neumann inversion on \(W^{1,(4,1)}\cap N^\perp\) uses
only the two sup differences. Finite-volume embedding
in \(H^1\) and E79 weak uniqueness identify the solution.
The explicit ray kernel of degree minus three and layer
integration give the continuous \(W^{1,(4,1)}\) endpoint
for \(\phi\). The horizontal output is controlled only
in \(L^{4,1}\); finite nonlinear placement and \(C^1\)
horizontal flow remain outside this result. No new
primary source was needed or inspected. Only the named
note and return were edited.

## File identities

All five mathematical input hashes matched the frozen
request. The B51 digest records the observed decision.

| File | SHA-256 |
| --- | --- |
| SP4-CME-E88_REQUEST_v1.md | `2f739e67a3e42db159ff387ea7a7f8f10a40a34fcdfce705898869a9c3fcdfb0` |
| B51_VALUE_UNIFORM_LORENTZ_ORBIT_INVERSE_20261122.md | `1f4e1c7bbf675acf2467272001d10cbaf241555e98ad4f76dc7c14c787017511` |
| 71_LINEAR_ROUND_SLICE_20261122.md | `40a572ac01c81e65ec41798721a378fbff082a9023fcd7d69faec74dbff809ef` |
| 79_VALUE_SMALL_ORBIT_INVERSE_20261122.md | `1a88243342f6b805b82d4297043adde37e66bef632c7ca09a71f5449f52c5560` |
| E80_ORBIT_INVERSE_AUDIT_20261122.md | `10009438d0eca3e7fe8eb8ebdb78082b9b200812ca8fdb31b99698368ebab39f` |
| 66_FIXED_SLICE_STRAIN_ESTIMATE_20261122.md | `09ff98b37c5c4b3b84db9bc32e8745ce93b73efdc6e720a5c7d6a5b9393d0a66` |
| E70_FIXED_SLICE_AUDIT_20261122.md | `d9d1ace690255fa6af7c7a37e5852e991538e24988e003636929573cb768272c` |
| 88_LORENTZ_ORBIT_SOLVER_20261122.md | `91277aa9a194c8ee83b4ce6434619722202844ff4400b687a842b559f709f274` |

[req]: SP4-CME-E88_REQUEST_v1.md
[note]: ../../notes/88_LORENTZ_ORBIT_SOLVER_20261122.md
