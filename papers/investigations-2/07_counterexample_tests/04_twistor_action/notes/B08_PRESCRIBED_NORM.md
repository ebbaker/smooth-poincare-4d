# Global comparison with prescribed pointwise norm

28 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex, author-selected GPT-6.2 Astra/ultra. Independent backend metadata unavailable. Inputs at checkout `280376dd7a18` with the working-tree [polar identity](E17_POLAR_LOWER_BOUND.md) and [Hessian](E14_FIRST_NEGATIVE_MODE.md).

On the fixed unit periodic flat product of the [overview](../research-overview/OVERVIEW.md), impose the additional interior constraint \(|\psi(t,x)|=e^{bt}\) and retain the full boundary values \(e^{\pm b}\sigma\). Thus \(\psi=e^{bt}g\) for a unit positive half-spinor \(g\) of trace \(\sigma\). Put \(B=17\pi/8\), \(Q=|P\psi|^2/|\psi|^2\), and \(w=g-\sigma\). In the E17 polar identity \(du=0\) identically, and hence
\[
 \int_M Q-\tfrac32 b^2
 =\tfrac34\|dg\|_2^2+\tfrac b2\int_M(w,Tw),\qquad T=\sum_{i=1}^3 c_0c_i\partial_i .
\]
The rigid helicity estimate \(|\int(w,Tw)|\le B^{-1}\|dg\|_2^2\) is strict for nonconstant unit \(g\) by the zero spatial mode argument in E17. Thus \(\int Q\ge 3b^2/2\) throughout \(|b|\le 3B/2=51\pi/16\), with equality only for \(g=\sigma\). Cauchy–Schwarz on the cylinder of volume two gives \(S\ge9b^4/8\) with the same unique equality field.

For \(|b|>3B/2\), take \(w_*(t,x)=\cos(\pi t/2)(0,\cos(2\pi x_1),\operatorname{sgn}(b)\sin(2\pi x_1))\) in the imaginary basis of E14 and set \(g_\epsilon=(\sigma+\epsilon w_*)/|\sigma+\epsilon w_*|\). These fields satisfy both the exact norm constraint and the end data. At \(\epsilon=0\) the unconstrained first variation vanishes on all zero-trace accelerations, so the constrained second variation on this path is the E14 Hessian evaluated at \(w_*\), which is strictly negative. This proves an exact transition for this restricted class. In particular any unrestricted field strictly beating the radial action at or below \(51\pi/16\) must vary its norm away from \(e^{bt}\) somewhere in the interior. The angular dependence may be arbitrary in this argument.
