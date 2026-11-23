# E129/E132 — Intrinsic endpoint head assessment

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. The selected lead read both complete derivations and checked the initial embedding, absorption, full strain derivative and time-frequency integration. Actual lead model and effort unavailable; helpers configured gpt-6.2-sol/ultra without independent runtime attestation.

[E129](../notes/129_CONDITIONAL_INTRINSIC_ENDPOINT_HEAD_20261122.md), SHA-256 d8934b1c8fce1ed0cec01ae8f4deec591d85eaccdab25e6a7cd08abd065cf707, and [E132](E132_INTRINSIC_ENDPOINT_HEAD_AUDIT_20261122.md), SHA-256 2eccf3b0a8a186f4dfbfb7ca708e0b2d797fe36cb80ee442b23007be8cf55359, establish the head estimate below. E129's helper authored E41/E57 and audited several inherited inputs, including E119. E132's helper authored E53/E42/E102/E84 and audited E125/E128, but did not author E129. Independence concerns the new combination with the inherited foundations at their assessed scope.

Fix the smooth closed oriented round Riemannian four-sphere, positive perfect chiral SO(3) reference connection, negative Killing pairing and native metric of sectional curvature 1/2. There are a fixed head time \(h>0\), fixed value radius \(v_*>0\), and constant \(C\) such that every smooth actual connection with
\[
v=\|A_{\rm in}-A_0\|_{\infty;0}
  +\|F_{A_{\rm in}}-F_0\|_{\infty;0}<v_*
\]
has compatible adjusted head defect \(q=Q-I\) satisfying \(E_h(q)\le C\ell\), where \(\ell\) is the initial live \(L^{4,1}\) strain norm with the rearrangement convention in E129. The original head obeys
\[
\int_0^h\sup_{S^4}
 \bigl(|\nabla^A T|_{g_A^{\rm F}}+|T|_{g_A^{\rm F}}^2\bigr)\,d\tau
\le C\ell .
\]
The radius and constants are independent of initial higher derivatives and of \(\ell\). No separate smallness condition on \(\ell\), slice equation or quantitative recovery derivative bound is imposed.

The slice-free defect estimate E102 and localized E53 embedding bound the initial \(B^{1/2}_{8,1}\) norm linearly by \(\ell\), including cutoff, frame, density and low-block terms. Individual smoothness through zero verifies finite path norm and the strong trace before absorption. The assessed [E125/E127 identity](E125_E127_ADJUSTED_DEFECT_ASSESSMENT_20261122.md) and [E128/E130 analytic bounds](E128_E130_MIXED_COEFFICIENT_ASSESSMENT_20261122.md) place the perturbation of \(4\Delta_0-12\) in the source space with norm at most \(CvE_h(q)\). The fixed E57 estimate absorbs this by reducing only the value radius.

The full derivative of \(T=\tfrac12(Q^{-1/2}\nabla^A qQ^{-1/2})_0\) includes the internal connection and the live Levi–Civita difference on its base slot. It is bounded by the fixed Hessian of \(q\) plus \(C(|U|+|D_0U|)(|D_0q|+|q|)\). The dyadic split at \(2^{-2j}\) bounds the time integral of \((1+\tau^{-1/2})(|D_0q|+|q|)\) by \(CE_h(q)\), including the low block and truncated early intervals. For the squared strain, use the independent \(Cv(1+\tau^{-1/2})\) background estimate for one factor and the defect estimate for the other. This gives a linear contribution \(CvE_h(q)\); it does not square the singular background bound. Same-time naturality of the complete live tensors gives the original head estimate.

This discharges the historical conditional head premise in E131 without altering the frozen E129 note. It does not assess the later-time argument or itself assert a whole-time estimate. No new primary source was inspected or imported. The reference-dependent inherited results remain at their recorded inspection levels.
