# E46 · Retained scalar deficit and perturbative coercivity

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Serving model and effort telemetry were unavailable for this bounded proof packet. The starting repository HEAD was `8471728a1549614f155a8751c709904cbcf994d6`. The packet uses the working [scalar deficit derivation](../../../../../papers/investigations-1/05_collar_deformation_and_surgery/01_collar_deformation_and_adapted_coordinates/notes/SCALAR_DEFICIT_AND_CAP_RESPONSE.md) at SHA-256 `46780a336ce38bced159127a4d09de68a734ec2e3eed6b53ab875b0886a40a77` and the [exterior and core assessment](../../../../../papers/investigations-1/05_collar_deformation_and_surgery/reviews/EXTERIOR_RECOVERY_AND_CORE_RETENTION_20261126.md) at SHA-256 `a2ea8af276265c9b19f93880b757755315c43f5a13e693e5b2953b18e8f21d10`.

The proof uses the physical Riemannian volume, the scalar curvature of the selected representative, and the existing Yamabe infimum over smooth logarithmic factors. On a nonempty compact boundaryless four-manifold, the nonnegative gradient term and Hölder's inequality give $Y(h)\geq-\|R_h^-\|_2$ for any smooth metric $h$. If a smooth positive factor attains the infimum and the metric is scalar-positive on a set of positive physical volume, the same calculation retains a strictly positive contribution from $R_h^+$. Theorem 4.5 supplies the required smooth positive minimizer when a class is negative on the connected compact smooth four-manifold of the source. The Lean statements take the attaining log factor explicitly. [Lee–Parker, §2 and Theorem 4.5](https://users.math.msu.edu/users/parker/YamabeProblem.pdf)

With the normalized Euler inequality $48(8\pi^2-E)\leq Y(h)^2$, a strict bound $\|R_h^-\|_2^2<48(8\pi^2-E)$ gives a positive class without attainment. The inclusive bound requires $E<8\pi^2$, a scalar-positive set of positive physical volume, and attainment in the negative case. The conclusion includes $Y(h)\geq\sqrt{48(8\pi^2-E)}$. The normalized Euler inequality remains an explicit input for the actual closed candidate. [Master comparison and normalization](../../../../../papers/master/manuscript/variational_comparison.tex)

For the matched cap, fix the original disk chart $B$ and one measurable subset $A\subset B$ for the connector. The actual source and cap metric germs and oriented frames agree on the full closed exterior. The source scalar curvature is nonnegative on that exterior and positive at one point there. Continuity and positivity of open-set physical volume give the positive region for the capped metric. For either chirality the theorem evaluates the cap's total energy as the incoming energy minus the old disk charge plus the new charges on $A$ and $B\setminus A$. The negative scalar square uses the same sets and the actual capped volume. The inclusive scalar budget then gives positive energy membership on the original oriented type. A cap whose energy is strictly below both the wall and the same-type infimum must strictly exceed the scalar budget. Cap construction at the selected width and the Euler inequality are supplied.

The perturbative estimate uses a physical Sobolev constant $D>0$ of the same metric. For a floor $\rho\geq 0$ it gives

\[
 Y(h)\ \geq\ \frac{\min(\rho,6)}{D}-\|(\rho-R_h)_+\|_{L^2(h)}.
\]

The fixed-metric Sobolev constant follows from the pinned intrinsic Sobolev theorem and the squared $L^4$ norm identity. If $R_h\geq\rho$ off a measurable patch and $\rho-R_h\leq b$ on it with $b\geq 0$, then the squared shortfall is at most $b^2$ times that patch's actual physical volume. This form applies before a separate family-wide comparison of the Sobolev constants and without an Euler inequality.

| Checked declarations | Lean module |
| --- | --- |
| `neg_scalarDeficitNorm_le_classYamabeFour`, `neg_scalarDeficitNorm_lt_classYamabeFour_of_attains`, `signedMetric_yamabe_pos_of_scalarDeficit_lt`, `signedMetric_yamabe_pos_of_retainedScalar`, `selectedMatchedCap_scalarTest` | [RetainedScalarDeficit.lean](../../../../SmoothPoincare/Variational/RetainedScalarDeficit.lean) |
| `exists_scalarSobolev_bound`, `scalarFloorDeficitNorm_sq_le_of_floor_off`, `classYamabeFour_lower_of_scalarFloorDeficit` | [ScalarCoercivity.lean](../../../../SmoothPoincare/Variational/ScalarCoercivity.lean) |

Lean `4.35.0-rc3`, DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`, Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e`. The targeted Lake build of `SmoothPoincare.Variational.ScalarCoercivity` including its dependencies passed. The eight declarations in the table each reported the Lean axioms `propext`, `Classical.choice`, and `Quot.sound`.
