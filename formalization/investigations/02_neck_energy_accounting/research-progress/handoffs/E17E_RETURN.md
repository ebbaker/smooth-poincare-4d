# FOT-E17e · Convergence of chiral densities on a fixed truncation

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. The packet named GPT-6.2 Sol/ultra. Actual serving model and reasoning effort were unavailable. The result concerns the supplied coefficient, Jacobian and measure data on one fixed truncation. [Issued request](LAUNCH_REQUESTS_20261125.md) · [Lean module](../../../../FirstOrderTwistor/ChiralDensity.lean)

## Checked declarations

| Declaration in `FirstOrderTwistor` | Inputs and conclusion |
| --- | --- |
| `chiralHSDensity W jac x` | Takes real $3\times3$ coefficients $W$ and real relative volume Jacobian $J$. It evaluates $J(x)\sum_{a,b=0}^2 W_{ab}(x)^2$ using the existing `SectionsAndConnections.hilbertSchmidtSq`. |
| `chiralHSDensity_nonneg` | From $0\le J(x)$, proves nonnegativity of the density at $x$. |
| `tendsto_chiralHSDensity` | For any source filter, pointwise convergence of each coefficient and of the Jacobian gives pointwise convergence of the density. |
| `chiralHSDensity_integrableOn_and_tendsto` | On the restriction of the reference volume $\nu$ to a fixed set $K$, assume a.e. convergence of each coefficient and of the Jacobian as $i\to\infty$ in $\mathbb N$. Supply a.e. strong measurability of every weighted density and a common $L^1(K,\nu)$ majorant for their absolute values. The approximating and limiting densities are integrable on $K$, and their set integrals converge in $\mathbb R$. |

The proof takes the intersection of the nine full-measure coefficient conditions and the Jacobian condition, passes the squares and both finite sums to the limit, and multiplies by the Jacobian. Mathlib’s Bochner dominated convergence theorem then gives convergence of the integrals. On a finite-volume truncation, uniform bounds of $C$ on the absolute coefficients and $J_*$ on the absolute Jacobians give the integrable constant majorant $9J_*C^2$, for nonnegative $C,J_*$. [Existing matrix norm](../../../../SectionsAndConnections/ThreeAxisWeyl.lean#L32) · [SEC `eq:energies`][norm]

## Geometric interface

- For the positive chirality, $W_i$ must be the operator coefficients of $W^+$ in supplied oriented orthonormal frames of the self-dual two-forms of the pulled-back Riemannian metrics on the fixed truncation. The same convention applies to the limit. Use the same chirality on the source and limit by requiring orientation-preserving comparison maps. Application requires the geometric identification of the coefficients with the chiral operator and the Hilbert–Schmidt norm on that frame. [SEC `eq:energies`][norm] · [SEC `msale:source-euler`, `msale:budgets`][rescale]
- The pulled-back volume measure must have density $J_i$ with respect to $\nu$. For a metric volume in coordinates this is the positive ratio of the volume densities. If the comparison uses rescaled metrics, identifying the transported integral with the original source chiral energy uses the scale invariance in SEC. The analytic proposition retains $J_i$ and $J_\infty$ explicitly. [SEC `eq:energies`][norm] · [SEC `msale:budgets`][rescale]
- SEC supplies smooth pullback comparison on neighborhoods of each fixed compact truncation. To instantiate the coefficient and Jacobian convergence, use compatible local orthonormal frames in which the metric, its first two derivatives, and the relevant Hodge projectors converge, with positive-definite limiting metric. The analytic hypotheses can also be established by measurable frames on a partition of the fixed truncation. The choice and comparison of frames and the geometric volume pullback identity remain inputs. [SEC §11.1][rescale] · [SEC `msgap:accounting`][account]
- For E17d, take the fixed truncation as the reference measurable subtype and specialize the set integrals to `Set.univ`. The E17d image-mass identity must identify each source image mass with this Jacobian-weighted integral. `chiralHSDensity_nonneg` applied a.e. to the limit Jacobian and the returned integrability prove the premises of the E17d mass identity on the limit. This fits fixed-truncation comparison before any removal of the truncation. [E17d measure identities](../../../../FirstOrderTwistor/EnergyDensity.lean) · [SEC `msgap:accounting`][account]

## Verification and input versions

`lake env lean FirstOrderTwistor/ChiralDensity.lean` from `formalization/` passed. A temporary stdin check printed the types and axioms of all four declarations. Each used exactly `propext`, `Classical.choice` and `Quot.sound`. A temporary matrix calculation with sole nonzero entries $W_{01}=W_{10}=a$ gave density $J(2a^2)$, checking the two ordered entries and the volume multiplier. Public-import verification belongs to lead integration.

The working checkout read during the packet was `ad23403e9be521ebbc8395a9d958c0a02aef3c84`. The SEC manuscript matched the issued SHA-256 `329513a3cfd8e939373533fad90f36b9108ce0ea41a22f9cc348587a4110fe66`, with Lean `4.35.0-rc3`, Mathlib `c55e6e786f49` and DifferentialGeometry `788efe978944`. [Baseline](../../../research-progress/01_BASELINE.md)

[norm]: ../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L144
[rescale]: ../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L3889
[account]: ../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L4692
