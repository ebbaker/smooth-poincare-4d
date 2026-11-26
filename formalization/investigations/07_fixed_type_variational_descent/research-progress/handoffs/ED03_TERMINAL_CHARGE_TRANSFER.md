# Edition 03 · Positive terminal Ricci charge in a pointed limit

26 November 2026 UTC. Prepared for Edward B. Baker III with OpenAI Codex
assistance. This bounded E43-F execution uses the E42 working snapshot
on base `95a4f50eb9ec6e0e98454170279f45a66b000211`. Actual serving
model and reasoning effort are unavailable.
[E42 assessment](../../../reviews/MARKED_GLUE_AND_CURVED_COST_20261125.md) ·
[Sequence and charge](../../../../SmoothPoincare/Variational/TerminalChargeTransfer.lean) ·
[Comparison map naturality](../../../../SmoothPoincare/Variational/TerminalChargeTransferNaturality.lean) ·
[Pointed limit application](../../../../SmoothPoincare/Variational/TerminalChargeTransferPointed.lean)

## Scope and hypotheses

Fix a positive terminal time \(\tau\) on actual supplied Ricci flows on
smooth, oriented, connected, compact, boundaryless Riemannian
four-manifolds \(M_i\). The source manifolds may vary. Use the common
E42 carrier, regular interior, Ricci lower form bound
\(\operatorname{Ric}_{g_i(s)}\ge-(b/s)g_i(s)\) with \(b<1/2\),
full curvature norm bound \(A\), and differentiated Ricci square
budget \(L^2\). The initial full ordered curvature square integrates
to at least \(\epsilon^2\) on \(P_i\), which lies in the plateau
of the actual terminal cutoff. The entire terminal radius-\(R+1\)
open ball lies in the measurable initial comparison region \(Q_i\).
On \(Q_i\) the initial combined charge
\[
  4(|W_i^+|_{\mathrm{HS}}^2+|W_i^-|_{\mathrm{HS}}^2)+R_i^2/6
\]
tends to zero in the initial volume. Here \(R_i\) in the displayed
density denotes scalar curvature. Cutting off this nonnegative
combination between zero and one preserves its convergence to zero.
The E42 local Euler estimate then yields, eventually in the source,
\[
  c\le \int_{B_{g_i(\tau)}(p_i,R+1)}
       |\operatorname{Ric}^{\circ}_{g_i(\tau)}|^2\,dV_{g_i(\tau)}
\]
for any \(0<c<\epsilon^2/2-2(144AL)\sqrt{\tau/(1-2b)}\).
The time restriction can choose \(c=\epsilon^2/4\) throughout
a small fixed positive-time interval when the same budgets apply.
[Intrinsic E42 proof](../../../../SmoothPoincare/Variational/IntrinsicTerminalCharge.lean) ·
[E42 normalization and hypotheses](ED03_INTRINSIC_TERMINAL_CHARGE.md)

The comparison is for the pointed sequence consisting of these exact
terminal metrics and the same centers \(p_i\). It uses a cofinal
subsequence, canonical pointed metric convergence data and completeness
of the indicated limit metric. Fix any \(r>R+1>0\). The closed limit
ball of an intermediate radius is compact and ultimately covers each
smaller source ball under the actual comparison maps. The limit
integral on the open radius-\(r\) ball is at least \(c\). The charge
density is \(|\operatorname{Ric}|_g^2-\operatorname{Scal}_g^2/4\).
Its pullback identity uses naturality of the Ricci tensor, scalar
curvature and tensor norm on the open comparison. In dimension four,
metric trace Cauchy–Schwarz gives its nonnegativity independently of
a choice of orientation on the limit. The lower bound uses convergence
of the actual integrals over the comparison images. The pinned
comparison proof derives this convergence from metric jets through
order two on the common gauge and from the corresponding Riemannian
volume change of variables. The compact intermediate ball leaves
a strictly positive distance margin and avoids a moving-ball boundary
convergence premise.
[Buffered comparison](../../../../SmoothPoincare/PhysicalScales/PointedTerminalBuffer.lean)

## Supplying the data

The scientific source is `thm:charged-modified-flow` in
`modified_ball_charge.tex`. It conditionally constructs the relevant
sequence in the strict subcritical band at vanishing modified spectral
deficit. Its added hypothesis is a common upper bound \(Vr^4\) on
modified ball volumes at all centers for \(0<r\le r_0\).
The construction takes smooth modified conformal approximations and
the first radii carrying a fixed small full-curvature integral.
It uses Lee–Lee Theorem 1.1 for uniform positive-time curvature,
injectivity, local curvature energy and the two-point estimate.
The two-point estimate applied along a chain in an initial minimizing
geodesic gives the plateau inclusion. Lee–Lee Lemma 3.2 gives the
reverse support inclusion in a fixed enlarged initial ball after
rescaling. The scale-invariant global energy and differentiated
curvature budget come from the evolving form bound and tensor energy
calculation. The shrinking scale and initial upper volume bound make
the enlarged initial ball have vanishing unscaled volume. This is
where the vanishing scalar and both Weyl-square integrals supply
\(Q_i\). Pointed compactness in a common positive-time flow gauge
provides the indicated metric comparisons, applied at each fixed
eligible \(\tau\). The parent geometric estimates and compactness
existence are supplied premises of the Lean transfer.
[Manuscript](../../../../../papers/master/01_fixed_type_variational_descent/manuscript/modified_ball_charge.tex) ·
[Independent scientific check](../../../../../papers/master/01_fixed_type_variational_descent/reviews/E71_CHARGED_FLOW.md) ·
[Lee–Lee, Theorem 1.1 and Lemma 3.2](https://arxiv.org/html/2510.12673v2) ·
[Hamilton, pointed Ricci-flow compactness](https://doi.org/10.2307/2375080)

The checkout supplies this conditional scientific construction. The
search found no instantiated source sequence, a Lean construction of
the first-radius smoothing data with the required budgets, or an
inference of the small-ball upper volume ratios from the fixed-type
minimizing hypotheses. The charge concerns the modified metrics in
the positive-time flow gauge. The original physical annulus requires
a separate comparison with its own scale and marking.

## Retention of source volume

On each nonempty compact source, write \(V(s)=\operatorname{Vol}_{g(s)}M\).
The same full-curvature budget in the interior gives
\[
 \left|V'(s)
ight|
 =\left|\int_M \operatorname{Scal}_{g(s)}\,dV_{g(s)}
ight|
 \le \sqrt 6 A\sqrt{V(s)}.
\]
The scalar bound comes from the normalized curvature decomposition
\(\operatorname{Scal}^2/6\le |\operatorname{Rm}|^2_{
m tens}\) and
spatial Cauchy–Schwarz against the constant one. Compactness and
positivity of Riemannian measure on open sets give \(0<V(s)<\infty\).
The actual solution gives continuity of \(V\) on its full carrier
and its volume derivative at regular times. The endpoint estimate
therefore uses \([0,\tau]\) in the carrier with \((0,\tau)\) regular.
The mean value theorem gives
\[
 \left|\sqrt{V(\tau)}-\sqrt{V(0)}
ight|
 \le (\sqrt 6/2)A\tau .
\]
For a sequence with common \(A\), real initial volumes tending
to infinity yield real terminal volumes tending to infinity at
each fixed eligible \(\tau\). For the manuscript's unit-volume
modified approximations at shrinking scales \(a_i\), the initial
rescaled volumes are \(a_i^{-4}\). The volume transfer takes
the resulting initial divergence as its input.
[Terminal volume proof](../../../../SmoothPoincare/Variational/TerminalVolumeRetention.lean) ·
[E71 energy and volume check](../../../../../papers/master/01_fixed_type_variational_descent/reviews/E71_EULER_TRANSPORT.md)

## Input versions and checks

- Intrinsic E42 charge SHA-256
  `d58d9de51ac429953d579b66b9e526f014314f17bfedea40f285a07b6ac2fdef`.
- Terminal E42 cutoff SHA-256
  `3489cbe08d22e05d94af428c0f93329b782f3801053c7933867ad8300146fc01`.
- Master TeX SHA-256
  `8f58cd62654a4dee2ab26c31b1be3b2da6b02b309c0dfc0181129937a186ceec`.
- Lean `4.35.0-rc3`, DifferentialGeometry
  `788efe97894474c032de6dfb1289d515f613d15a`, mathlib
  `c55e6e786f49471c72fbddbec5415808896aec1e`.

The three transfer modules and `TerminalVolumeRetention.lean` passed
direct elaboration with no diagnostics.
The exact signatures of `terminalPointedFlowSequence` and
`ricciFlow_terminalBall_intrinsicRicciCharge_pointedLimit` were checked.
The volume estimate and divergence signatures were also checked. All 17
public declarations across the four modules use only `propext`,
`Classical.choice`, and `Quot.sound`. The fixed-time theorem returns a
real Bochner integral on the open larger ball, with integrability supplied
by the compact closed ball of that radius.
