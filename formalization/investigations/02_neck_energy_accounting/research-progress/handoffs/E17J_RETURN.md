# FOT-E17j · Volume density relative to a fixed reference metric

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. The packet specified GPT-6.2 Sol at ultra. Actual serving model and reasoning effort were unavailable.

For smooth Riemannian metrics $q$ and $g$ on the comparison manifold and inclusion $\iota_A\colon A\to M$, the Lean proof sets $\nu_A=\operatorname{vol}_q\mathbin{.\mathrm{comap}}\iota_A$ and $J_A(x)=\operatorname{riemannianVolumeDensity}(q,g)(x)$. Applying the pinned ambient volume-density identity on images of measurable subtype sets and changing variables along the inclusion yields $\operatorname{vol}_g\mathbin{.\mathrm{comap}}\iota_A=\texttt{energyMeasure}\ \nu_A\ J_A$. The density is positive and smooth on the ambient manifold, hence measurable on the subtype. The pinned finiteness-on-compacts theorem makes $\nu_A$ a finite measure when $A$ is compact. [Lean module](../../../../FirstOrderTwistor/RiemannianComparison.lean) · [Pinned volume density theorem](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Analysis/Integration/Measure/VolumeDensity.lean) · [Pinned compact finiteness theorem](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Analysis/Integration/Measure/Riemannian/Properties.lean)

| Declaration in `FirstOrderTwistor` | Result |
| --- | --- |
| `riemannianVolume_comap_subtype_eq_energyMeasure` | Volume on a measurable subtype for $g$ is the $J_A$-weighted subtype volume for $q$. |
| `isFiniteMeasure_riemannianVolume_comap_subtype` | The subtype volume for a smooth metric is finite on a compact set. |
| `riemannianVolume_transport_of_compact_referenceMetric` | With the metric pullback identity on a neighborhood of a compact truncation, provides finite reference volume, the measurable embedding $\Phi_A$, a.e. measurability and nonnegativity of $J_A$, and $\operatorname{vol}_h\mathbin{.\mathrm{comap}}\Phi_A=\texttt{energyMeasure}\ \nu_A\ J_A$. |

The specialization takes the smooth metrics, smooth partial diffeomorphism, and metric pullback identity on the neighborhood as in E17h. Its density and measure identity follow from those data. The E17g family still needs its comparisons, eventual separation, exhaustion and convergence premises, including the orientation and Weyl-frame identifications on the fixed domains. The pinned API uses the canonical Borel measurable spaces as in E17h. [E17h](E17H_RETURN.md) · [E17g comparison family](../../../../FirstOrderTwistor/ComparisonFamily.lean)

## Verification

The upstream build produced the pinned `VolumeDensity` and `Riemannian.Properties` modules. `lake env lean --stdin` elaborated the complete `RiemannianComparison` module with type and axiom probes. All three public declarations and the upstream `riemannianVolumeMeasure_eq_withDensity`, `riemannianVolumeDensity_pos`, `riemannianVolumeDensity_contMDiff`, and `riemannianVolumeMeasure_isFiniteMeasureOnCompacts` reported `[propext, Classical.choice, Quot.sound]`. The probes checked the identity comparison on the closed unit ball of Euclidean four-space, using two arbitrary supplied smooth metrics and deriving finite reference volume and the volume density. The probe with coincident metrics recovered density $1$.

Working checkout `0c3399d831d71a1a17c29ffcba14ee0593315cbe`. The manifest and toolchain matched packet base `cf03e8f09359cac317499f6928edb09e4f80c280`. SEC SHA-256 `329513a3cfd8e939373533fad90f36b9108ce0ea41a22f9cc348587a4110fe66`. Lean `4.35.0-rc3`, Mathlib `c55e6e786f49`, DifferentialGeometry `788efe978944`.
