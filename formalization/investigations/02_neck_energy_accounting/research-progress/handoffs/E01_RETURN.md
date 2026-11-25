# FOT-E01 · Finite accounting with a strict residual

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. The packet specified GPT-6.2 Sol at ultra. Actual serving model and reasoning effort were unavailable.

`SectionsAndConnections.noPositiveBubbleOfFiniteAccounting` proves the exact [opening type](../../research-plan/PLAN.md#opening-proof). For a putative positive bubble, the upper band and its component gap imply $e-x_j<4\pi^2$. Erasing that index from the sum expresses $e-x_j$ as the base plus the remaining bubble energies. Nonnegativity bounds each of those terms above by the residual. The base gap and the remaining bubble gaps force them all to vanish, contradicting the strict residual. The accounting identity then gives $e=b$. [Lean proof](../../../../SectionsAndConnections/FiniteAccounting.lean)

## Evidence

`lake env lean SectionsAndConnections/FiniteAccounting.lean` passed. An appended `lake env lean --stdin` probe checked the exact anonymous quantified type by direct assignment, printed the theorem type and reported `[propext, Classical.choice, Quot.sound]` from `#print axioms`. The same probe checked these cases.

| Case | Lean-checked result |
| --- | --- |
| Empty family | With $e=b=5\pi^2$ and $\delta=\pi^2$, all hypotheses hold for an arbitrary energy function on the ambient index type. |
| Added zero piece | For arbitrary finite $J\subset\mathbb N$ and index $k$, the theorem applies to $J\cup\{k\}$ with zero bubble energies, $e=b=5\pi^2$ and $\delta=\pi^2$. |
| Singleton with the strict residual removed | With $J=\{j\}$, $b=0$, $e=x_j=5\pi^2$ and $\delta=\pi^2$, every other hypothesis holds, the residual is zero and the conclusion fails. The same example satisfies a nonnegative residual. |

## Supplied hypotheses and scope

The inputs are a finite index set with decidable equality, real energies and margin, positivity of the margin, nonnegativity of the base and all indexed bubble energies, the lower and upper band bounds, the full accounting equality, the base and bubble zero-or-strict-gap conditions, and strict positivity of the residual for each positive bubble. The lower band bound is preserved in the public type. The gap and strict residual inputs correspond to SEC `msgap:closed` and `msgap:strict`. SEC `msgap:accounting` supplies a geometric inequality under its stated comparison hypotheses. SEC §15 requires a full estimate on the complement to upgrade it to the equality used here. [SEC strict residual](../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L4416) · [SEC conditional energy identity](../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L6524)

The issued packet named checkout `cf03e8f09359cac317499f6928edb09e4f80c280`. The active checkout was `ad23403e9be521ebbc8395a9d958c0a02aef3c84`, with the opening plan, manifest and toolchain unchanged from the packet checkout. The SEC SHA-256 matched `329513a3cfd8e939373533fad90f36b9108ce0ea41a22f9cc348587a4110fe66`. Checks used Lean `4.35.0-rc3`, Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e` and DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`.
