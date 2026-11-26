# Edition 03 · Finite tested Euler transport and terminal Ricci charge

26 November 2026 UTC. Prepared for Edward B. Baker III with OpenAI Codex
assistance. This bounded execution follows the E42 intake at
`95a4f50eb9ec6e0e98454170279f45a66b000211`. Actual serving model and
reasoning effort are unavailable.
[Finite transport leaf](../../../../SmoothPoincare/Variational/TestedEulerTransport.lean) ·
[Global current](ED03_GLOBAL_EULER_CURRENT.md) ·
[Charged-flow manuscript](../../../../../papers/master/01_fixed_type_variational_descent/manuscript/modified_ball_charge.tex)

On a supplied smooth Ricci flow on a compact oriented boundaryless
four-manifold, use the actual slice metric \(g_s\), its volume, and
the stationary cutoff \(\chi\). Write \(e_s\) for the normalized
intrinsic scalar Euler density and \(m(s)=\int\chi e_s\,dV_s\). The
actual normalized spatial current has pointwise norm at most
\(144\,U_sN_s\), where \(U_s=|\mathrm{Rm}_{g_s}|\) and
\(N_s=|\nabla\operatorname{Ric}_{g_s}|\) are the full ordered tensor
norms on that slice. The proof confirms the frame-norm formula and
uses the intrinsic norms for integration. Slice \(L^2\) membership
follows from smoothness and compactness.

Take \(0<\tau\) with \([0,\tau]\) in the solution carrier and
\((0,\tau)\) regular. Assume \(b<1/2\), the gradient estimate
\(|d\chi|_{g_s}\le\delta\sqrt{\tau^{2b}s^{-2b}}\) at interior times,
the uniform curvature bound \(\|U_s\|_{2,s}\le A\), and the time
budget
\[
 \int_0^\tau\!\int_M N_s^2\,dV_s\,ds\le L^2
\]
with interval integrability of its inner integral. The gradient and
time budgets use the actual solution. They remain inputs from the
geometric smoothing estimate. Carrier continuity of the curvature
and volume gives continuity of \(m\) at both endpoints. On
\((0,\tau)\) its derivative equals the tested divergence. The
spatial flux is therefore measurable on the restricted time
measure, since the real derivative is measurable and the two
endpoints are null.

For a smooth cutoff, spatial integration by parts and Hölder leave
the integrable time product of the weighted gradient and the
instantaneous \(L^2\) Ricci derivative norm. Time Cauchy–Schwarz
gives
\[
 |m(\tau)-m(0)|\le144\,\delta A L
                    \sqrt{\frac{\tau}{1-2b}} .
\]
The proof uses the actual regular-time derivative for this moment
and the two actual carrier slices. It uses the smooth cutoff
spatial flux estimate.

The endpoint identification with the geometric charge reads
\[
m(s)=m_s^++m_s^-+\tfrac1{24}m_s^{\mathrm{scalar}}
                  -\tfrac12 m_s^{\mathrm{ricci}} .
\]
The weighted component integrability is supplied at both endpoints.
Using the same test equal to one on the initial charged set and zero
off the terminal region \(B\), the terminal trace-free Ricci square
integral on all of \(B\) is at least
\[
 \epsilon^2/2-4(m_0^++m_0^-)-m_0^{\mathrm{scalar}}/6
            -2K\sqrt{\frac{\tau}{1-2b}},
 \qquad K=144\,\delta A L .
\]
This uses the supplied initial full-curvature lower bound
\(\epsilon^2\) and the established cutoff sandwich on the initial
and terminal measures. Flow existence, the physical gradient
budget, the geometric scale and the relevant endpoint integrability
remain explicit inputs.

## Verification

The named Lake target `+SmoothPoincare.Variational.TestedEulerTransport`
passed through the pinned 9,940-job dependency set. A final direct
`lake env lean SmoothPoincare/Variational/TestedEulerTransport.lean`
passed without diagnostics. The source SHA-256 is
`f4545f8536bf5c69628c5b30860b6e4c1ba1765c294609851c27404a5f963436`.
Pinned Lean `4.35.0-rc3`, mathlib
`c55e6e786f49471c72fbddbec5415808896aec1e`, DifferentialGeometry
`788efe97894474c032de6dfb1289d515f613d15a`. The Lake manifest
SHA-256 is
`839111aae86b693524cd57db5ce7f2e8edc972dad49296468eb18d6735e52239`.
[Independent selected replay](../../reviews/ED03_CURVED_AND_GLOBAL_READBACK.lean)
