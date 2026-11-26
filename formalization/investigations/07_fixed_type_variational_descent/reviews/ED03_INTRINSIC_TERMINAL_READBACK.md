# Edition 03 · Independent readback of the intrinsic terminal ball charge

26 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded independent review on Git base `95a4f50eb9ec6e0e98454170279f45a66b000211`. Independent serving model and effort telemetry are unavailable. [Intrinsic terminal statement](../../../SmoothPoincare/Variational/IntrinsicTerminalCharge.lean) · [Earlier terminal ball statement](../../../SmoothPoincare/Variational/TerminalBallEulerCharge.lean) · [Owning derivation](../../../../papers/master/01_fixed_type_variational_descent/manuscript/modified_ball_charge.tex)

Let \(W\) be the sum of the two physical squared Weyl-block norms, \(S=R^2\), \(Z=|\operatorname{Ric}_0|^2\), and \(U=|\operatorname{Rm}|^2\) in the full ordered convention. The earlier decomposition and Pfaffian normalization give, pointwise,
\[
 U=4W+2Z+S/6,\qquad e=2\operatorname{Pf}_{\rm frame}=W+S/24-Z/2.
\]
Hence \(U/4-e=Z\), \(U/2+2e=4W+S/6\), and \(Z+2e=2W+S/12\ge0\). The intrinsic subtractions cancel exactly the expected Ricci or Weyl-scalar terms. In particular the initial combined charge integrates to the earlier \(4(m_++m_-)+m_{\rm scalar}/6\) in the same initial volume with the same cutoff.

The fixed test is \(\chi=\min(\max(R+1-d_{g_\tau}(p,\cdot),0),1)\) along the entire interval. The initial measurable attaining set \(P\) lies inside the closed plateau \(d_{g_\tau}\le R\). The test vanishes at and outside \(d_{g_\tau}=R+1\), so its terminal charge is bounded above by the unweighted charge on the actual open ball \(B=\{d_{g_\tau}<R+1\}\), without any assumption on the measure of that boundary. Write \(E_s=\int\chi e_s\,dV_s\) and \(M_0=\int\chi U_0\,dV_0\). The proof uses \(M_0\ge\varepsilon^2\), \(E_\tau\le E_0+C\), and \(\int_B Z_\tau\,dV_\tau\ge -2E_\tau\). Its lower bound is exactly
\[
 \varepsilon^2/2-\int\chi(U_0/2+2e_0)\,dV_0-2C.
\]
Thus the loss has a minus sign and coefficient two. The Lipschitz constant of this clipped terminal test is one, giving \(C=144AL\sqrt{\tau/(1-2b)}\) and the same loss as the earlier frame-explicit theorem. The upper direction of the tested absolute-value estimate suffices for the charge inequality.

`intrinsicTerminalRicci_lower_of_testedEuler` supplies endpoint spatial integrability for two arbitrary smooth metrics by continuity of the intrinsic slice densities and compactness. It assumes the tested Euler bound directly. `ricciFlow_terminalBall_intrinsicRicciCharge` supplies that bound from the flow and keeps orientation and the original flow hypotheses. There are no supplied pointwise frame fields or assumed frame-dependent endpoint integrals in the intrinsic terminal statement. The closed interval \([0,\tau]\) must lie in the continuous carrier and \((0,\tau)\) in the regular set. The lower Ricci bound \(-b g_s/s\) is used at positive interior times. The transport uses \(\tau>0\), \(b<1/2\), and nonnegative bounds \(A,L\), with the uniform spatial curvature \(L^2\) bound and the interval-integrable derivative-square test of integral at most \(L^2\). The power is integrable because \(-2b>-1\), with squared weight integral \(\tau/(1-2b)\). For fixed \(b<1/2\) and uniform budgets the transport loss is \(O(\sqrt\tau)\), under the same hypotheses. A singular limit of sources, quantitative positivity of the right-hand charge, and comparison to a separately marked original metric require further inputs.

## Published import check

Lean `4.35.0-rc3`, Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e` and DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`. The Lake manifest SHA-256 is `839111aae86b693524cd57db5ce7f2e8edc972dad49296468eb18d6735e52239`. `IntrinsicTerminalCharge.lean` was read at SHA-256 `d58d9de51ac429953d579b66b9e526f014314f17bfedea40f285a07b6ac2fdef` and `TerminalBallEulerCharge.lean` at `3489cbe08d22e05d94af428c0f93329b782f3801053c7933867ad8300146fc01`.

The independent replay imported the published `SmoothPoincare.Variational.IntrinsicTerminalCharge` artifact using `lake env lean -j1`. Its `#check @` signatures cover the three intrinsic definitions, their normalization bridge, the tested-moment lower bound, and both terminal-ball formulations. The same seven `#print axioms` calls report only `propext`, `Classical.choice` and `Quot.sound`. Temporary Lean examples checked the normalization algebra, the one-sided transport deduction, and the equality of the integrated intrinsic initial charge with the earlier weighted frame charges.
