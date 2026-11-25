# FOT-E17h · Riemannian volume transport on a compact truncation

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. The packet specified GPT-6.2 Sol at ultra. Actual serving model and reasoning effort were unavailable.

`FirstOrderTwistor.riemannianVolume_comap_of_partialDiffeomorph` takes a smooth partial diffeomorphism $\Phi\colon M\dashrightarrow N$ and smooth Riemannian metrics $g,h$ on the boundaryless manifolds. On an open neighborhood of a measurable set $A$ contained in the source, the supplied tangent-inner-product identity says $g=\Phi^*h$. The subtype map $\Phi_A\colon A\to N$ is a measurable embedding. Extensionality on its measurable subdomain sets and the pinned partial-diffeomorphism change-of-volume theorem applied to the constant density $1$ give

$$
\operatorname{vol}_h\mathbin{.\mathrm{comap}}\Phi_A
=\operatorname{vol}_g\mathbin{.\mathrm{comap}}\iota_A.
$$

Here $\iota_A\colon A\to M$ is inclusion. Its comap is the measure on the subtype whose pushforward is $\operatorname{vol}_g$ restricted to $A$. [Lean module](../../../../FirstOrderTwistor/RiemannianComparison.lean)

`FirstOrderTwistor.riemannianVolume_transport_of_compact_partialDiffeomorph` specializes to compact $A$ and supplies the four conjuncts of one E17g transport field. Given a reference measure $\nu$ on $A$, a nonnegative a.e. measurable $J$, and $\operatorname{vol}_g\mathbin{.\mathrm{comap}}\iota_A = \texttt{energyMeasure}\ \nu\ J$, it gives the measurable-embedding proof, the two density properties, and $\operatorname{vol}_h\mathbin{.\mathrm{comap}}\Phi_A = \texttt{energyMeasure}\ \nu\ J$. The family-level finite reference volume, Jacobian formula relative to that reference, existence of the comparisons and smooth metrics, convergence of weighted energy densities, and orientation and curvature-frame transport remain supplied. This volume step applies before the chiral curvature identification in SEC `msale:budgets` and `msgap:accounting`. [E17g transport data](../../../../FirstOrderTwistor/ComparisonFamily.lean) · [SEC comparison budgets](../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L3938)

The pinned volume API uses canonical `borel` measurable spaces on the two manifolds. For direct composition with E17g on a type whose default measurable space is propositionally equal to `borel` but definitionally distinct, select the canonical instance when forming the measures and the comparison data. The `EuclideanSpace` probe used this alignment.

## Verification

- The lead's `lake build DifferentialGeometry.Analysis.Integration.Measure.PullbackPartial` passed with 3,040 jobs. `#print axioms` on the upstream `riemannianVolumeMeasure`, `riemannianVolumeMeasure_pullback_cross`, and `setLIntegral_image_partialDiffeomorph` reported `[propext, Classical.choice, Quot.sound]` in each case.
- `lake env lean FirstOrderTwistor/RiemannianComparison.lean` passed. An appended `lake env lean --stdin` probe checked both public declaration types and reported `[propext, Classical.choice, Quot.sound]` for each. The probe applied the compact transport field to the identity partial diffeomorphism of Euclidean four-space on the closed unit ball, with the same supplied smooth metric on both sides and volume Jacobian $1$.

The working checkout advanced from `ad23403e9be521ebbc8395a9d958c0a02aef3c84` to `7db310a2a9219c537b440d7c2fb39e602a32b729` during the packets. The plan, manifest and toolchain matched packet base `cf03e8f09359cac317499f6928edb09e4f80c280`. SEC SHA-256 `329513a3cfd8e939373533fad90f36b9108ce0ea41a22f9cc348587a4110fe66`. Lean `4.35.0-rc3`, Mathlib `c55e6e786f49`, DifferentialGeometry `788efe978944`.
