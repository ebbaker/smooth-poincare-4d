# Edition 03 · Intrinsic terminal ball Ricci charge

26 November 2026 UTC. Prepared for Edward B. Baker III with OpenAI Codex
assistance. This bounded E42 execution follows intake
`95a4f50eb9ec6e0e98454170279f45a66b000211`. The actual serving model and
reasoning effort are unavailable.
[Intrinsic terminal charge](../../../../SmoothPoincare/Variational/IntrinsicTerminalCharge.lean) ·
[Terminal ball cutoff](../../../../SmoothPoincare/Variational/TerminalBallEulerCharge.lean) ·
[Finite transport](ED03_TESTED_EULER_TRANSPORT.md)

On a supplied Ricci flow on a compact, oriented, connected, boundaryless
four-manifold, write \(U_s^2\) for the full ordered Riemann tensor square
and \(e_s\) for the normalized intrinsic Euler density, computed in the
actual metric \(g_s\). The raw densities
\[
 Z_s^2=U_s^2/4-e_s,\qquad P_s=U_s^2/2+2e_s
\]
are respectively the trace-free Ricci square and the combined charge
\(4(|W_s^+|^2+|W_s^-|^2)+R_s^2/6\). The two Weyl squares use
Hilbert–Schmidt norms in the normalized oriented chiral frames. The
pointwise comparison with frames is used only to prove normalization,
nonnegativity of the required densities and \(-2e_s\le Z_s^2\).

Let \(\chi\) be the terminal distance cutoff with plateau on the closed
radius-\(R\) ball and zero from radius \(R+1\) outward. Its values are in
\([0,1]\). The measured initial charged set \(Q\) lies in the actual
terminal plateau. With \(B\) the open radius-\(R+1\) terminal ball and
\(\int_Q U_0^2\,dV_0\ge\epsilon^2\), the actual terminal lower bound is
\[
 \int_B Z_\tau^2\,dV_\tau \ \ge\ \epsilon^2/2
 -\int_M \chi P_0\,dV_0-2(144 A L)\sqrt{\tau/(1-2b)}.
\]
Use the supplied carrier \([0,\tau]\), regular interior, positive
\(\tau\), \(b<1/2\), lower Ricci form bound \(-(b/s)g_s\),
curvature \(L^2\) cap \(A\) and time-integrable differentiated Ricci
square budget \(L^2\). Each integral uses the volume at its indicated
slice. Continuity of each slice density and of \(\chi\), together with
compactness, supplies all required endpoint integrability. Carrier
continuity enters the weighted time estimate. The cutoff sandwich and
scalar algebra then give the displayed bound. The flow, budgets and
plateau containment remain supplied geometric data.

## Verification

`intrinsicTerminalCharge_eq_modifiedChargeDensity` gives the three
pointwise normalization identities for any supplied oriented frame.
`intrinsicTerminalRicci_lower_of_testedEuler` takes two actual smooth
metrics, a continuous fixed test with the stated plateau and support,
an initial mass lower bound and the tested moment difference bound.
`ricciFlow_terminalBall_intrinsicRicciCharge` takes the actual flow,
terminal ball and the geometric budgets above. The proof constructs
the endpoint integrability and the tested Euler transport.

With pinned Lean `4.35.0-rc3`, direct Lean passed without diagnostics.
Six declaration type and axiom checks and the exact \(b=0\) terminal
ball application passed. The axiom union is `propext`,
`Classical.choice`, and `Quot.sound`. In the \(b=0\) application the
Ricci hypothesis reduces to nonnegative Ricci and the time factor to
\(\sqrt\tau\). The source SHA-256 is
`d58d9de51ac429953d579b66b9e526f014314f17bfedea40f285a07b6ac2fdef`.
The direct importing check SHA-256 is
`2e239262a78b97eee4dc3f7d24e65294250376f971779e3e90acb04f282125b3`.
The clean 10,650-job public build and the sole-import fixture passed.
The public fixture log SHA-256 is
`42c2c07abddd3ed7f7de1a386c32ec1327fbc4bdd2d0cf408ff7ae8986f163b2`.
[Exact public fixture](../../reviews/ED03_CURVED_AND_GLOBAL_READBACK.lean)
