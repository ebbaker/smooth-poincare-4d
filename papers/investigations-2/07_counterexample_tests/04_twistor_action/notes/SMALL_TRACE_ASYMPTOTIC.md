# The leading order of the unrestricted Dirichlet infimum

28 November 2026, for Edward B. Baker III with Codex lead assistance. Selected GPT-6.2 Astra/ultra; independent execution telemetry unavailable. Checkout `280376dd7a18`. Corollary of the bounds in [E09](E09_UNEQUAL_TRACE_GAP.md) and the quartic [radial trial](E02_FLAT_TORUS.md). The domain is their fixed periodic flat product, with smooth admissible spinors and the same constant-ray traces. This calculation uses the original action only.

Write \(a_\pm=e^{m\pm d/2}\) for the endpoint amplitudes. For the ordinary affine interpolation \(h\), put \(A=\|Ph\|_2\), \(H=\|h\|_4\). The cylinder volume is \(VL\). Direct integration gives
\[
 A=\sqrt{3V/(4L)}\,e^m\,2|\sinh(d/2)|,\qquad
 H^4=VL\,e^{4m}\frac{\sinh(5d/2)}{5\sinh(d/2)}
\]
with the quotient extended by continuity at zero. Consequently, on this fixed cylinder,
\[
 \frac{A}{H}=\kappa |d|(1+O(d^2)),\qquad
 \kappa=\frac{\sqrt3}{2}V^{1/4}L^{-3/4}.
\]
The constant in the remainder is independent of \(m\). Let \(I(d)\) denote the infimum of \(J_g^4\) over *all* admissible fields with these traces. Constant field scaling removes \(m\). If \(C\) is the fixed homogeneous Sobolev constant in E09, its lower bound for \(J_g\) is \((A/H)/\sqrt{1+C^2(A/H)^2}\); the radial upper bound is exactly \(\kappa|d|\). Taking fourth powers and squeezing shows
\[
 0\leq \frac{9V}{16L^3}d^4-I(d)\leq K_{g,L}|d|^6
 \quad\text{for all sufficiently small } |d|.
\]
In particular the radial coefficient \(9V/(16L^3)\) is the leading coefficient of the unrestricted fixed-end infimum. The estimate requires neither attainment at unequal ends nor a classification of the minimizing sequences. It concerns fixed boundary data on this cylinder. No differentiability of the value function of order four is required for this asymptotic statement.

There is also first-order rigidity of competitors whose action is at most the radial trial. Normalize \(m=0\), set \(x=\|P(\psi-h)\|_2\), and use E09's orthogonality and Hölder to get
\[
 A^2+x^2\le\kappa^2 d^2(H+Cx)^2.
\]
Here \(H\) stays bounded, and \(\kappa^2d^2H^2-A^2=O(d^4)\) by the two explicit expansions. Absorbing the \(d^2x^2\) term and applying Young's inequality to \(O(d^2)x\) gives \(x=O(d^2)\), uniformly over every competitor with this action bound. Hence \(\|\psi-h\|_{H^1}=O(d^2)\) by the exact homogeneous Dirichlet twistor identity and Poincaré. The affine *amplitude* interpolation \(h\) used in this estimate also differs from the radial exponential interpolant by \(O(d^2)\) in \(H^1\). This places the first-order deviation in a weak norm; whether the fields that compete for the minimum belong to the locally unique strong solution branch is a further compactness question.
