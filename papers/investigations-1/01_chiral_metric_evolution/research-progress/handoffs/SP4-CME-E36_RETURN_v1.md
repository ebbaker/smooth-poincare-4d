# SP4-CME-E36 return v1 — coupled operator and smooth constraint propagation

22 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol` /
`ultra`. Actual backend model and effort were not independently exposed.
Selected lead settings unavailable. Return to [request v1](SP4-CME-E36_REQUEST_v1.md).
The [derivation](../../notes/36_COUPLED_CURVATURE_SYSTEM_20261122.md)
contains the full coefficient and constraint calculations.

## Disposition

The proposed independent \(A,F\) system is genuinely second-order
quasilinear. The principal coefficients depend smoothly on
\((x,a,F,\bar F)\), with \(\bar g=g(\bar F)\). In the potentially
problematic term \(d_A^{*g}C\), the Christoffels of \(g(F)\)
multiply \(C=F-F_A\), giving products of first derivatives only.
Differentiating the affine first-jet expression \(W\) produces
value-only principal coefficients and quadratic first-order
terms. This includes all live-metric derivative terms.

At the reference the ordinary Fourier symbol is block diagonal,
with \(-|\zeta|_{\bar g}^2 I\) on connection amplitudes and
\(-\mathbb B_{\zeta,\lambda}\) on the independent curvature
amplitudes. The latter is exactly E34, using the specified
Bianchi-reduced physical extension also off the constraint.
Reference coercivity for sufficiently large fixed \(\lambda\)
persists in a small \(C^0\) value neighborhood in the fixed
reference direct-sum pairing. Compact definite reference
curvature sets give uniform algebraic constants. This supplies
no derivative-independent lower-order estimates.

The exact constraint evolution is
\[
 C_t=-[C,\phi]-\lambda d_A^{*g}d_A C-d_A d_A^{*g} C .
\]
Its moving-metric energy has the two negative adjoint pairings
and an error at most \(3\|g^{-1}g_t\|_\infty\int|C|^2\,dV_g\),
including both inverse-metric slots and volume variation. Thus
zero \(C\) persists on the supplied smooth interval. Compatible
smooth pairs correspond exactly to supplied smooth solutions
of the E27 adjusted connection equation by \(F=F_A\).
No existence theorem, automorphism endpoint estimate, or
regularity and continuation conclusion follows from this packet.

## Frozen inputs

| Branch input | Checked SHA-256 |
| --- | --- |
| `brainstorm/notes/B29_COUPLED_CURVATURE_SYSTEM_20261122.md` | `87fa12235a2d89bf3086201664d1a6e2bd90956347023ae42e56157abcfa0bcb` |
| `notes/34_CURVATURE_BIANCHI_SYMBOL_20261122.md` | `d74fde2a534598c013c184dadb40d6ac8a1574e59ab01ff2edbdfdc817d9c037` |
| `notes/27_FIXED_ADJOINT_GAUGE_TEST_20261122.md` | `755dbe5d1956bdc895f8da2214e9d6e0e9aa405d28f87958373a7d4c59fb1590` |
| `notes/30_CURVATURE_COEFFICIENT_REGION_20261122.md` | `426b99a3e5cda892f192fc43a4e4efd8736bd44d11695daa3e44bef559fcf1cd` |
| `research-progress/handoffs/SP4-CME-E36_REQUEST_v1.md` | `61746d8a85a5aee99da9b258bf4441953cc756fc8869d455f63c22029d58e34f` |

The checks are analytic. No numerical artifact was used.
