# SP4-CME-E21 request v1 — flat heat benchmark for the temporal strain norm

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Authorized fixed Sol 6.2/ultra execution, lead actual settings unavailable. Read root instructions and B18. Own notes/21_LORENTZ_HEAT_BENCHMARK_20261122.md and research-progress/handoffs/SP4-CME-E21_RETURN_v1.md only. No shared edits or chat capture.

For U_t=4Δ_R4 U−12KU, K≥0, U0 smooth compactly supported with values in R20, prove or refute ∫_0^∞(||∇U(t)||∞+||U(t)||∞²)dt≤C(||U0||_{L^{4,1}}+||U0||_{L^{4,1}}²). Fix norm ∫_0^∞s^(1/4)f*(s)ds/s as E17, Euclidean vector/tensor norms and Lebesgue measure. C must be independent of K and the data; no optimal numerical constant needed.

Use explicit heat kernel (16pi t)^−2 exp(−|x|²/(16t)). Bound its gradient by a radial decreasing Gaussian majorant, rearrange that majorant and integrate in time to obtain the endpoint s^(−3/4) weight. For the squared term justify sup_t sqrt(t)||U||∞≤C||U0||4,1 and ∫t^−1/2||U||∞dt≤C||U0||4,1, then their product. Do not exchange an integral and a supremum in the wrong direction. Show all integrability/Tonelli steps and vector-valued norm domination. The K damping only improves the bounds. Explain scale invariance.

Finite scope: one explicit linear constant-coefficient model, no geometric kernel theorem or nonlinear extrapolation. State exactly why it is not the actual round connection heat equation or Fine flow, and which coefficient/gauge/moving-metric estimates a transfer would still need. Stop at boundary.

## Frozen inputs

- `papers/investigations-1/01_chiral_metric_evolution/brainstorm/notes/B18_LORENTZ_HEAT_BRIDGE_20261122.md` SHA-256 `7e8d9c1a5ffd508f0411c98ba4d7511f5df659b7a5e6fbd6ac0aa4dfdff26cfb`
- `papers/investigations-1/01_chiral_metric_evolution/notes/19_LORENTZ_SPATIAL_BENCHMARK_20261122.md` SHA-256 `32294f3f9d29bac5077e0a03ccd6d2e81712313afe40059d052467e3a371bb21`
- `papers/investigations-1/01_chiral_metric_evolution/notes/16_TEMPORAL_STRAIN_CRITERION_20261122.md` SHA-256 `204022875cd34b4672850e9e9540c9a099caa21f8f35c4c82915b359d4412193`
