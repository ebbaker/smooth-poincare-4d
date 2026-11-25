# E17q · Physical energy of a metric sequence on a fixed compact truncation

25 November 2026, America/New_York. For Edward B. Baker III with OpenAI Codex. Lead requested as GPT-6.2 Astra/ultra, exact serving configuration unavailable. Bounded components were dispatched to GPT-6.2 Sol/ultra. SEC source SHA-256 `329513a3cfd8e939373533fad90f36b9108ce0ea41a22f9cc348587a4110fe66`. The shared proof uses the actual geometric self-dual block from the simultaneous [single-cut formalization](../../../03_single_cut_descent/research-progress/handoffs/GEOMETRIC_BLOCK_RETURN.md). The [integration record](INTEGRATION_20261125.md) gives the toolchain, dependency pins, public checks and input revisions.

Fix a compact set $K$ in a smooth oriented Riemannian four-manifold without boundary. Lean uses a Hausdorff, sigma-compact manifold. Let $G_i$ converge to $g$ on $K$ in the pinned intrinsic two-jet norm relative to any smooth reference metric $R$. Choose a positive $g$-orthonormal tangent frame pointwise, and apply Gram–Schmidt for each $G_i$. Let $q$ be a smooth metric supplying the fixed reference volume, $J_i=dV_{G_i}/dV_q$, and $T_i$ the full lowered Riemann tensor array in those frames.

The remaining local integration hypotheses are measurable weighted chiral densities up to null sets on $K$, and one $L^1(dV_q)$ function $b$ on $K$ with $J_i\sum_{abcd}(T_i)_{abcd}^2\le b$ almost everywhere for each $i$. Under these inputs the physical integrals satisfy

$$
\lim_i\int_K |W^+_{G_i}|_{\rm HS}^2\,dV_{G_i}
=\int_K |W^+_g|_{\rm HS}^2\,dV_g.
$$

The frame construction derives convergence in the actual tangent space. The curvature comparison expresses all four moving slots in a fixed basis. At each fixed point, the chart Riemann perturbation bound for the two-jets and the convergence of the metric pairing give convergence of the lowered tensor. Compression to the positive subspace and trace removal commute with this coefficient limit. The Gram determinant gives convergence of the actual $J_i$. The full curvature bound dominates the projected square and fixed-measure dominated convergence gives the stated limit. [Frames](E17O_RETURN.md) · [Curvature coefficients and chart proof](E17N_RETURN.md) · [Volume density](E17P_RETURN.md) · [Projection bound](E02C_RETURN.md) · [Metric composition](../../../../FirstOrderTwistor/MetricJetEnergy.lean)

The independent fixed-domain theorem accepts four-slot curvature convergence directly, with possibly varying comparison point maps in its weighted form. The physical integral theorem uses a change of volume on the measured set and concludes energy convergence in the metrics' respective Riemannian volumes. Applications to embedded source truncations still require the actual comparison, the density on its image and the full complement estimate. [Changing volume](../../../../FirstOrderTwistor/FixedMetricEnergy.lean) · [Comparison construction](E17G_RETURN.md) · [Actual curvature block](E17L_RETURN.md)

The public default package and both metric-energy declarations compiled in the final build. The complete [type and axiom checks](PUBLIC_CHECKS.lean) reported only Lean’s standard logical axioms.
