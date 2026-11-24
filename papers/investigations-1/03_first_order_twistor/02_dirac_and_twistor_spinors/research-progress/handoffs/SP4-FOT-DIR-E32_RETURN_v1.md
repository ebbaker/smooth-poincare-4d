# SP4-FOT-DIR-E32 · Capacity and strict positivity in the fixed unit-spinor scale · return v1

24 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Fixed E routing: gpt-6.2-sol / ultra. Actual helper
and selected lead model identifiers and reasoning efforts were unavailable.
[Request v1](SP4-FOT-DIR-E32_REQUEST_v1.md) ·
[Owning register](../REGISTER.md) · [Derivation](../../notes/DIR_E32_20261124.md).

**Completed.** HEAD was `f178fbb604f7f972b639fa8c1fc05f649c9bc8fc` and
all six frozen working-tree digests matched.

1. The fixed AE metric has a homogeneous $L^4$ Sobolev bound. On a ball
   of volume $b>0$ with $V\ge c>0$, it implies
   $Q(v)\ge b/(b^{1/2}S^2/12+c^{-1})$.
   Thus $P=\inf Q$ is positive exactly when $V\not\equiv0$.
2. The unique relaxed minimizer $v_*\in1+D^{1,2}$ is smooth,
   $0<v_*\le1$, and solves $12\Delta_k v_*+Vv_*=0$.
   Positive compact competitors converge to it in the affine energy
   space. When $V$ is nonzero $v_*<1$ everywhere, so the original
   compact class does not attain its infimum. For $V=0$ both problems
   have optimizer $v=1$.
3. $P=\int_N Vv_*\,dV_k$ and the outward metric flux of $dv_*$ tends
   to $P/12$. A radial barrier, Newton potential and rescaled elliptic
   estimates give $v_*=1-\big(P/(24|S^3|)\big)R^{-2}+O_1(R^{-3})$.
   The note verifies the weighted second-derivative and integrable
   scalar-curvature requirements for ADM mass.
4. The normalized ADM mass of $v_*^{-4}k$ is $P/(6|S^3|)$, and the
   unnormalized coordinate flux is $P$. All compact-variation metrics
   have zero ADM mass. The positive limit mass is compatible with
   energy approximation because the relaxed optimizer has a nonzero
   $R^{-2}$ coefficient. Its limiting spinor flux is $P/4$.

The proof uses only the given fixed AE unit-spinor data and the
returned E31 energy formula. This settles the scalar optimization in
that supplied geometry.
