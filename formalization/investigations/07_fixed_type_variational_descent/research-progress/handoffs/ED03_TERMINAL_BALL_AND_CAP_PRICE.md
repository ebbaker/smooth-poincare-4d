# Positive cap cost and Euler transport to the terminal ball

25 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Author-selected GPT-6.2 Astra/ultra lead with bounded GPT-6.2 Sol/ultra derivations and independent readers. Independent serving telemetry unavailable. The scientific inputs, 10 package commits and 19 transitive pins are frozen in the [intake](../../../research-progress/handoffs/ED03_MARKED_GLUE_INPUTS_20261125.md).

## Cap allowance on the original selected disk

For $V=(\operatorname{int}B)^c$, $Q$ the protected closed core, $W$ the entire marked trim, and $\Delta_s(A)=\lambda_h^s(A)-\lambda_g^s(A)$, compare a separate positive cap with the modified exterior. If $E_s(\mathrm{cap})\le\lambda_h^s(V)+\delta$, the finite floor and actual physical division give
\[
I-2^{-k}(e-\lambda_g^s(Q))-\epsilon < \Delta_s(V\cap W)+\Delta_s(V\setminus W)+\delta .
\]
For any $a<I$, first fix positive depth with $(1-2^{-k})I>a$. Then, eventually along a minimizing sequence with division errors tending to zero, every qualifying cap at either sign has $\Delta_s(V)+\delta>a$. If $I>T$ and the entire exterior agrees, use $a=T$. Strict disk saving at an attained positive endpoint pays only the decrease on the disk. In particular a conformal change with zero signed increment cannot improve this bound. [Cap proof](../../../../SmoothPoincare/Variational/CurvedCapPrice.lean)

## The actual tested flow

Choose any oriented orthonormal frame at $(t,x)$. The pinned Uhlenbeck evolution through the identity transports its bundle slots by $\mathrm{Ric}^\sharp$ and stays in the same orientation on an open time interval. On fixing the four base arguments instead, their determinant relative to the evolving frame is the volume ratio. Thus the fixed-base variation yields
\[
\partial_s\big[\rho(g_t,g_s)e(g_s)\big]_{s=t}=\operatorname{div}_{g_t}X_t .
\]
The intrinsic $e$ is smooth on regular spacetime. Against the fixed reference volume differentiate its product with the smooth volume ratio and any fixed continuous cutoff. Compactness and continuity of this partial time derivative give local domination. For a smooth test the sign in integration by parts is negative. No differentiated arbitrary frame field enters the integrated assertion. [Gauge](../../../../SmoothPoincare/Variational/EulerGaugeFrames.lean) · [Moving volume](../../../../SmoothPoincare/Variational/TestedEulerIntegral.lean) · [Tested Euler derivative](../../../../SmoothPoincare/Variational/TestedEulerTransgression.lean) · [Independent review](../../reviews/ED03_CURVED_AND_GLOBAL_READBACK.md)

For $\mathrm{Ric}_s\ge-(b/s)g_s$, compare $s^{-2b}g_s(v,v)$ on each $[s,\tau]$ using the actual metric PDE and continuity at the terminal carrier time. Length distortion is bounded by $(\tau/s)^b$. Apply the sharp spatial inequality to the original terminal Lipschitz cutoff on each slice. The regular-time derivative is controlled by $144\delta A(\tau/s)^b\,\|\nabla\mathrm{Ric}\|_{L^2(g_s)}$. Integrating the speed of the actual moment across the interval and applying time Cauchy–Schwarz produces $144\delta A L\sqrt{\tau/(1-2b)}$. The cutoff clipped from $R+1-d_\tau(p,\cdot)$ has Lipschitz constant one, a full closed plateau of radius $R$ and zero value outside its terminal open ball of radius $R+1$. The measurable initial attaining set must lie in the plateau. Both chiral charges and the scalar-square moment have their initial cutoff and initial volume. The trace-free Ricci lower bound has the terminal volume. The hypotheses do not compare the modified solution to the original physical metric at separated quantiles. [Metric distortion](../../../../SmoothPoincare/Variational/TerminalMetricPowerBound.lean) · [Terminal Lipschitz transport](../../../../SmoothPoincare/Variational/TerminalLipschitzEuler.lean) · [Terminal ball](../../../../SmoothPoincare/Variational/TerminalBallEulerCharge.lean) · [Owning modified-flow derivation](../../../../../papers/master/01_fixed_type_variational_descent/manuscript/modified_ball_charge.tex)
