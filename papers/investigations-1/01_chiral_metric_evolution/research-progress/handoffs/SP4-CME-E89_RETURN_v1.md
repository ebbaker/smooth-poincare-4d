# SP4-CME-E89 return v1

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and
selected lead settings were unavailable. I authored E71, E66 and E80
and did not author E88, E79 or E70.
See the [request][req] and [audit][review].

## Disposition

E88 passes in the stated fixed native round value tube.
For the exact E79 infinitesimal solver the output
\(W^{1,(4,1)}\) and \(C^0\) norms of \(\phi\), and
\(L^{4,1}\) norms of \(u,r_{\rm sl}\), are bounded by
\(C\|r\|_{4,1}\). The tube and constant use only the
reference and the stated sup bounds on \(a,\beta\).

- For arbitrary flux \(w\) the weak data are
  \(d_0^*w-R_Nw\), with
  \(R_Nw=\sum_j(w,d_0\psi_j)_{L^2}\psi_j\).
  The smooth finite-rank correction is controlled from
  the fixed basis. It vanishes for fluxes in
  \(\ker S_0^*\), including \(\Pi_0w\).
- The divergence form and cutoff fluxes have the stated
  signs. After freezing, the flux is
  \(F_\chi+(A_*-A)\partial v-Mv\), and the value input is
  \(G_\chi+(I-D_1)v\).
  The scalar reference symbol on \(E\) is
  \(\frac23\mu|\xi|_{g_0}^2I\). The gradient flux matrix
  has positive \(\xi_i\xi_j\) numerator.
  Annular kernel bounds, the vector weak \((1,1)\)
  estimate and adjoint duality prove the \(L^8\) flux
  estimate. The value kernels sum in \(L^1\).
  Fixed-cutoff mollification and the weak \(L^2\) bound
  remove the \(L^8\) value remainder.
- The \(L^2\) and \(L^8\) extensions agree by smooth
  density. Layer integration against arbitrary vector
  inputs yields the fixed Lorentz divergence inverse.
  This is a separate multiplier estimate from E66's
  non-divergence result.
- The weak perturbation is exactly
  \(d_0^*((\Pi_A-\Pi_0)d_0\phi+\Pi_A[a,\phi])\).
  Its flux and \(\Pi_A r\) both annihilate the finite
  correction, so applying \(K_0\) to the Neumann
  identity recovers E79 on all \(H^1\) tests.
  The inverse preserves \(N^\perp\). No derivative of a
  varying coefficient enters the uniform bound.
- Ray integration gives the endpoint \(C^0\) inequality.
  Translation continuity in \(L^{4,1}\) and interior
  patch mollification give smooth density in the weak
  graph space and identify the continuous representative.

No correction was found. The estimate is infinitesimal
and leaves \(u\) in the stated \(L^{4,1}\) control.
Finite slice placement and a \(C^1\) horizontal flow
remain outside the result. No primary source was newly
inspected or imported. Only the designated audit and
return were edited.

## File identities

The frozen E88 note and the five inherited inputs matched
their requests. The B51 digest records the observed rationale.

| File | SHA-256 |
| --- | --- |
| SP4-CME-E89_REQUEST_v1.md | `fafe7a85427ba8fe83d98b93449de20a1ea0a9fc9dd738f9bc1067f1dccc2c08` |
| SP4-CME-E88_REQUEST_v1.md | `2f739e67a3e42db159ff387ea7a7f8f10a40a34fcdfce705898869a9c3fcdfb0` |
| B51_VALUE_UNIFORM_LORENTZ_ORBIT_INVERSE_20261122.md | `1f4e1c7bbf675acf2467272001d10cbaf241555e98ad4f76dc7c14c787017511` |
| 88_LORENTZ_ORBIT_SOLVER_20261122.md | `91277aa9a194c8ee83b4ce6434619722202844ff4400b687a842b559f709f274` |
| 71_LINEAR_ROUND_SLICE_20261122.md | `40a572ac01c81e65ec41798721a378fbff082a9023fcd7d69faec74dbff809ef` |
| 79_VALUE_SMALL_ORBIT_INVERSE_20261122.md | `1a88243342f6b805b82d4297043adde37e66bef632c7ca09a71f5449f52c5560` |
| E80_ORBIT_INVERSE_AUDIT_20261122.md | `10009438d0eca3e7fe8eb8ebdb78082b9b200812ca8fdb31b99698368ebab39f` |
| 66_FIXED_SLICE_STRAIN_ESTIMATE_20261122.md | `09ff98b37c5c4b3b84db9bc32e8745ce93b73efdc6e720a5c7d6a5b9393d0a66` |
| E70_FIXED_SLICE_AUDIT_20261122.md | `d9d1ace690255fa6af7c7a37e5852e991538e24988e003636929573cb768272c` |
| E89_LORENTZ_ORBIT_AUDIT_20261122.md | `0f3e17807d50c6c35be82c2c442a3f3fce0bc139dfbb1cd83074ced88b371484` |

[req]: SP4-CME-E89_REQUEST_v1.md
[review]: ../../reviews/E89_LORENTZ_ORBIT_AUDIT_20261122.md
