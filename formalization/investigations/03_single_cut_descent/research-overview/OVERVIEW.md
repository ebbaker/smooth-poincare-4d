# Single spherical cut and descent · Research overview

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. The serving model variant and reasoning effort are unavailable.

[Overall overview 01](../../research-overview/01_OVERVIEW.md) · [Overall plan 01](../../research-plan/01_PLAN.md) · [Program register](../../research-progress/REGISTER.md) · [Verified baseline 01](../../research-progress/01_BASELINE.md) · [Route plan](../research-plan/PLAN.md) · [Route register](../research-progress/REGISTER.md)

## Two full sides in the master manuscript

At the positive-class infimum, a cut can be useful even before a smooth limiting bubble is identified. Let the two sides of the middle sphere have full raw chiral masses $m_1+m_2=e_i$. If the caps are positive, have energies bounded by $m_j+\gamma_j$, and $e_i+\gamma_1+\gamma_2<8\pi^2$, at least one cap has energy strictly below $4\pi^2$. Recognize that cap and follow its attaching map. The other cap $s$ is then a competitor on the original type, so $m_{3-s}\le e_i-I^+(M)+\gamma_s$. The retained side can change with the source index. This excludes two uniformly charged sides when the cap costs tend to zero. [Two-side comparison](../../../../papers/master/manuscript/marked_cut.tex) · [Program overview](../../research-overview/02_OVERVIEW.md)

The analytic question is how the actual oriented splice chart supplies these costs and positive caps. Straighten in a fixed domain on the joined manifold, apply Route 05's scalar-flat wall along the path, then stretch the product and test both closures. The critical harmonic-annulus theorem furnishes a further sufficient chart condition. Extracting that chart on a physical minimizing sequence remains a question in the master investigation. [First-order splice](../../../../papers/master/manuscript/first_order_splice.tex) · [Short marked cut](../../../../papers/master/manuscript/variational_comparison.tex) · [Harmonic shell](../../../../papers/master/manuscript/critical_annulus.tex)

## Why the marking matters

Let $M$ be a smooth, closed, connected, oriented homotopy four-sphere. Write $E_+$ for the integral of the squared Hilbert–Schmidt norm of the self-dual Weyl endomorphism. A smoothly embedded separating $S^3$ with specified collar and attaching maps splits $M$ into two pieces. Capping each with a smooth four-ball gives two homotopy spheres. If both capped conformal classes have positive Yamabe constant and the sum of their chiral energies is below $8\pi^2$, at least one capped side satisfies the strict recognition criterion $E_+<4\pi^2$. To identify the original smooth type we need to know **which** side was recognized and how the other cap was attached. [Supplied-collar construction](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/brainstorm/notes/USING_A_SUPPLIED_COLLAR_20261125.md) · [SEC recognition proposition](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L178)

For the stronger result use a fixed smooth type and a supplied sequence of volume-one positive Yamabe minimizers with $4\pi^2\le E_+(g_i)\le8\pi^2-\delta$, $E_+(g_i)\to e$, and $\int_M|B_{g_i}|\,dV_i\to0$. Assume a smooth, complete, nonflat ALE limit $X$ at a shrinking scale, with differentiated end decay of positive order through order five and simultaneous orientation-preserving comparison of whole fixed compact truncations. Route 02 supplies the one-ended, trivial-link conclusion, smooth compactification, and strict residual. The separation and gluing arguments use the orientation throughout. [SEC compactification](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L4173) · [Shared component estimates](../../02_neck_energy_accounting/research-overview/OVERVIEW.md)

Cut on a small normal sphere about the added point of $\widehat X$. Its two buffers and boundary marking transfer in one embedding. The cap estimates give the **capped exterior** a positive Yamabe constant and chiral energy strictly below $4\pi^2$. Recognition identifies it as standard. On the other side the missing ball is the specified smooth ball in $\widehat X$. Tracking both identifications through the connected sum yields an orientation-preserving diffeomorphism and an energy bound on the original smooth type,

$$
M\cong_{\rm diff}\widehat X,\qquad
I^+(M)\le E_+(\widehat X)=e_X\le e-\kappa_\delta,\quad e_X>4\pi^2 .
$$

Here $I^+(M)$ is the infimum over smooth positive-Yamabe classes on $M$. Consequently an exact minimizing sequence excludes this kind of bubble using strict residual alone. The uniform $\kappa_\delta>0$ extends the exclusion to $e-I^+(M)<\kappa_\delta$. The transferred Bach-flat class may itself have positive energy. Obtaining a further decrease on that class and realizing a suitable cut on a general sequence remain mathematical questions. [Same-type descent proof](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E02_E05_SAME_TYPE_DESCENT_20261125.md) · [Joint assessment](../../../../papers/investigations-1/03_first_order_twistor/reviews/JOINT_COLLAR_ASSESSMENT_20261125.md)

## What a weaker collar can certify

The first model uses a conformal representative close in $C^2$ to the round product on a strip with protected buffers. It assumes $C^4$ control on the splice to bound the added Bach cost. A second model uses small $C^0$ metric and $L^4$ first-derivative errors plus a physical $L^2$ curvature budget for an inexpensive Weyl splice. A finite quotient link requires its own test before treating the slice as $S^3$. Each model exports its own hypotheses and costs. The spinor route can reuse measured first-order data through the parent's B05 decision. [Smooth cap](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E01_TWO_CAP_AUDIT_20261125.md) · [First-order cap](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E07_FIRST_ORDER_CAP_20261125.md) · [Quotient-link test](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E08_QUOTIENT_LINK_TEST_20261125.md) · [Dirac route](../../04_dirac_collar_transmission/research-overview/OVERVIEW.md)

## Inputs at setup

The Version 01 sources below are recorded at `6879850c01a741618210815be0cc8041abe45a94`. Their SHA-256 prefixes identify the exact inputs for this route. The package uses Lean `4.35.0-rc3`, Mathlib `c55e6e786f49` and DifferentialGeometry `788efe978944`. The [Lake manifest](../../../lake-manifest.json) pins all ten packages. The numbered program baseline records the full source digests and revisions. [Reproducible baseline](../../research-progress/01_BASELINE.md)

| Input | SHA-256 prefix |
| --- | --- |
| [Sections and Connections manuscript](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex) | `329513a3cfd8e939` |
| [Two-cap cost and Yamabe estimates](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E01_TWO_CAP_AUDIT_20261125.md) | `58969f8b827d0487` |
| [Marked cut on a supplied core](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E03_EMBEDDED_CUT_20261125.md) | `6ecef368cfe3b840` |
| [Descent on the original smooth type](../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E02_E05_SAME_TYPE_DESCENT_20261125.md) | `61d01e1cf53be476` |

At setup the existing pilot's three-axis Weyl theorem was Lean-verified. The route now has checked conditional statements for the marked reassembly, metric pullback, and curvature-derived same-type descent. The full geometric realization remains open. [Current route evidence](../research-progress/REGISTER.md) · [Pilot evidence](../../01_sections_and_connections/research-progress/REGISTER.md)
