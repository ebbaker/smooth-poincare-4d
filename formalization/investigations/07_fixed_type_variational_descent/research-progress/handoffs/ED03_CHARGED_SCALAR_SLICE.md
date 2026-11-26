# FOT-E43 · Scalar positivity on the charged regular slice

26 November 2026 UTC. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E follow-up to terminal charge transfer. The actual serving model and reasoning effort are unavailable. [Charged-flow manuscript](../../../../../papers/master/01_fixed_type_variational_descent/manuscript/modified_ball_charge.tex) · [Terminal charge transfer](ED03_TERMINAL_CHARGE_TRANSFER.md)

For a supplied smooth Riemannian Ricci solution, let $t$ be a regular time. Suppose its actual scalar curvature $R$ is nonnegative on a two-sided time neighborhood at $x$ and on a spatial neighborhood of $x$ at time $t$. If $R(t,x)=0$, both restricted functions have local minima there. The actual scalar evolution and the time minimum give
\[
 0=\partial_tR(t,x)=\Delta_{g(t)}R(t,x)+2|\operatorname{Ric}_{g(t)}|^2(x).
\]
The spatial metric-compatible minimum theorem gives a nonnegative Laplacian. The project intrinsic charge in dimension four is $|\operatorname{Ric}|^2-R^2/4$. Strictly positive charge therefore gives a positive reaction and rules out $R(t,x)=0$. Neither the time nor spatial minimum uses compactness, completeness, an orientation, or a global spatial sign hypothesis. [Lean proof](../../../../SmoothPoincare/Variational/ChargedScalarSlice.lean) · [Intrinsic charge identity](../../../../SmoothPoincare/Variational/TerminalChargeTransfer.lean)

At a regular time, a strictly positive integral of that charge over an open set makes the charge positive at some point of that same set. A two-sided local nonnegativity test on its fixed carrier points supplies the two neighborhood hypotheses at the detected point. The ball version uses the actual open Riemannian ball and volume of the tested slice. The integration corollaries use a sigma-compact carrier and do not require a compact one. Charge transfer, regular time, and the nonnegative scalar condition on the tested solution remain inputs. The result gives a point of strictly positive scalar curvature in the charged ball. A conclusion on every point of the connected limit or on a later slice would use a separate strong minimum principle. [Slice application](../../../../SmoothPoincare/Variational/ChargedScalarSlice.lean)

The charged manuscript input has SHA-256 prefix 8f58cd62654a4dee. The terminal charge transfer source has prefix 807ba315a93362fb. The Lean module uses scalar evolution and regularity from the pinned DifferentialGeometry checkout 788efe97894474c032de6dfb1289d515f613d15a.

The named Lake build passed all 9,955 jobs on Lean 4.35.0-rc3. The three public axiom checks reported only `propext`, `Classical.choice` and `Quot.sound`. The checked source SHA-256 is `66c31223e80f817e5a7a3a822f81db20ab4b712a35e2cd09fcb22273f7af6dff`.
