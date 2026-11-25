# FOT-E17p · Pointwise convergence of the Riemannian volume Jacobian

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E work. The serving model and reasoning effort are unavailable.

[Lean module](../../../../FirstOrderTwistor/MetricVolumeLimit.lean) · [Reference volume transport](E17J_RETURN.md) · [SEC §12.4](../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L4695)

Checkout `0c3399d831d71a1a17c29ffcba14ee0593315cbe`, Lean `4.35.0-rc3`, Mathlib `c55e6e786f49`, DifferentialGeometry `788efe978944`. The pinned `Evaluation.lean` and `VolumeDensity.lean` have SHA-256 values `0a762dc411389fab66aa2a770700d4f246c5ec2a6bc2429ecf1fe442fb96801a` and `41d232a10530fa5a81e48553b9f5c91fdea9873e563cd2f3c6df946cee0f8ee6`.

`FirstOrderTwistor.tendsto_riemannianVolumeDensity_of_metricCPConvergenceOn` takes a fixed smooth reference metric `q`, metrics `G i` converging to `g` in `MetricCPConvergenceOn K p G g R` for a compact `K`, and a point `x ∈ K`. It concludes `Tendsto (fun i => riemannianVolumeDensity q (G i) x) atTop (𝓝 (riemannianVolumeDensity q g x))`. The proof uses the zeroth-order consequence of the metric convergence, so the callable type includes any `p`, in particular `p = 2`.

`MetricCPConvergenceOn.tendsto_inner` supplies entrywise convergence of the Gram matrices on the chart basis at `x`. The determinant and its square root are continuous. In the chart at `x`, `riemannianVolumeDensity_apply_of_mem_chart_source` represents the actual comparison density as the ratio of these square roots, with the fixed positive denominator from `q`. This is the Jacobian used in E17j's volume transport field.

The input is a sequence of smooth metrics on the same finite-dimensional real manifold with a supplied compact-set metric convergence statement. In SEC `msgap:accounting`, the geometric comparison still has to furnish the pullback metrics, the appropriate convergence in the pinned metric norm, and the oriented coefficient fields and energy domination for the fixed-domain integral limit. The conclusion here is pointwise at fixed `x`.

## Verification

The targeted build of the pinned `Metric.Convergence.Metric.Evaluation` completed successfully with 4,017 jobs. `lake env lean FirstOrderTwistor/MetricVolumeLimit.lean` succeeded, and `lake build FirstOrderTwistor.MetricVolumeLimit` produced the package module with 4,062 jobs. A separate probe checked the callable type and its specialization to `MetricCPConvergenceOn K 2 G g R`. The theorem, pinned `MetricCPConvergenceOn.tendsto_inner`, and pinned `riemannianVolumeDensity_apply_of_mem_chart_source` each reported `[propext, Classical.choice, Quot.sound]` under `#print axioms`.
