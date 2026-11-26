# Curvature first hits on the original regular time interval

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Selected lead Astra/ultra. Separate serving telemetry unavailable. [Input generations](../../research-progress/handoffs/ED06_E51_WORKING_GENERATIONS.json) · [Physical proof](../../../SmoothPoincare/Variational/BourFirstHitWindows.lean) · [Independent reading](../../reviews/E51_INDEPENDENT_READBACK_20261126.md)

Fix one \(p\in[0,1]\) and an original smooth negative twice-gradient path on a closed oriented four-manifold, with constant Euler integral and an order-connected regular interval. Start at a regular time \(a\). Suppose the supremum of the ordered curvature after \(a\) is unbounded. Take \(Q_n\to\infty\) above its initial maximum. For each \(n\) a later regular compact slab contains a point with \(|\mathrm{Rm}|\ge Q_n\). Joint regularity of the curvature square and compactness of that slab times \(M\) give an earliest crossing \(t_n\) and a point \(x_n\). At the earliest crossing continuity gives equality and the same upper bound everywhere on its final slice. Every compact slab starting at \(a\) has bounded curvature, so these times are cofinal in the regular interval. This argument accommodates a finite open terminal time.

Use \(h_n(s)=Q_ng(t_n+s/Q_n^2)\). The *same* \(t_n,x_n\) works for every fixed \(A\le0\). Eventually the real window lies in regular time, \(|\mathrm{Rm}(h_n)|\le1\) on \(M\times[A,0]\), and the value at \((x_n,0)\) is one. E50 dissipation, combined with \(G^p(cg)=c^{-1}G^p(g)\), gives
\[
\int_A^0\int_M|G^p(h_n(s))|_{h_n(s)}^2\,dV_{h_n(s)}\,ds\longrightarrow0.
\]
All curvature bounds here use the full ordered tensor norm. In the quarter convention the squared norm at the marked endpoint is \(1/4\).

If smooth comparison maps through the terminal slice and the metric and gradient comparisons of the transfer theorem exist, the limiting gradient vanishes throughout the slab. Curvature convergence preserving the marked endpoint would retain nonflatness. Existence of such maps and smooth convergence for the original fourth-order evolution are analytical premises. On a bounded-curvature closed trajectory the cofinal dissipation and closed comparison theorem apply directly whenever whole compactness and suitable windows are available. Neither argument yields a uniform estimate as \(p\downarrow0\). [Comparison theorem](E51_TERMINAL.md) · [Gradient scaling](E51_GRADIENT_SCALING.md)
