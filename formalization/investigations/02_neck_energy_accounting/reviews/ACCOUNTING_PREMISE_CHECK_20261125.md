# Independent premise check for the finite accounting theorem

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded FOT-E17f audit. GPT-6.2 Sol at ultra was requested. The actual serving configuration is unavailable. Checked at working HEAD `ad23403e9be5`, engine Lean 4.35.0-rc3, Mathlib `c55e6e786f49` and DifferentialGeometry `788efe978944`. The audited `Accounting.lean` SHA-256 is `d011134593b9e423a48afac9c0db1dfd4d2afa95b66cbda4f103be43637bc820`. The SEC manuscript retains the issued SHA-256 `329513a3cfd8e939373533fad90f36b9108ce0ea41a22f9cc348587a4110fe66`. [Request][REQUEST] · [Accounting module][ACCOUNTING] · [Geometric audit][GEOM]

## Checked public interface

| Declaration | Hypotheses and effect |
| --- | --- |
| `TruncationFamily.sum_componentEnergy_le` | A common sequence of finite source measures and a finite family of component measures. Each component's increasing truncations exhaust it up to its own null sets. For each fixed truncation the source images are eventually measurable and pairwise a.e. disjoint. Individual image masses converge to the corresponding fixed truncation masses. With total mass converging to $e$, the sum of total component masses is at most $e$. |
| `TruncationFamily.tendsto_remainder` | Under the same data, the mass of the actual source complement converges at each fixed $L$ to $e$ minus the sum of the component masses at $L$. It uses the eventual additive split independently of the availability of geometric remainder estimates. |
| `energyIdentityOfCoveredRemainder` | Also requires `RemainderEstimates`. At each sufficiently large $L$ and then sufficiently large source index $i$, every listed strip mass is bounded by its error. For each positive tolerance both the sum of all errors and the mass of the complement outside the strip union are bounded in that order. The conclusion is energy equality. |
| `noPositiveBubbleOfCoveredRemainder` | The family is indexed by `Option ι` over `Finset.insertNone J`. The `none` index is the base, including when the bubble set $J$ is empty. The theorem applies E01 after deriving the identity and using nonnegativity of finite real masses. Its explicit scalar premises are the source band with $\delta>0$, the base and bubble gap alternatives, and the strict residual for each positive bubble. It concludes that every bubble energy is zero and $e$ is the base energy. |

The pairwise condition applies to the comparison images, where overlapping null faces are allowed. The strip index set can change with both $L$ and $i$. Strips can overlap and may extend beyond the target complement. The E17a inequality charges their total mass by subadditivity and includes the actual uncovered set. In this abstract layer the upper bound also works for nonmeasurable strips because it uses the finite measure on arbitrary sets. To instantiate the bound by geometric strip integrals, supply the measurable sets needed by the chosen integral identities. Component domains are required to be increasing with a.e. exhaustion. SEC's smooth compact domains provide these properties and measurability. [SEC `msgap:accounting` and §15][SEC] · [E17a callable types][E17A]

For fixed $L$, the proof passes first to the source limit. It then takes $L\to\infty$ in the finite sum of component masses. Equality uses separate half-tolerance estimates on the summed errors and uncovered mass. Thus the threshold in $i$ may depend on $L$ and on the tolerance. E17b's example, whose captured mass is zero for $i\le L$ and one for $i>L$ while total mass is one, passes the iterated limit and retains a unit remainder on the diagonal $i=L$. E29 selects a slow diagonal under its own compact comparison hypotheses. Its output controls that selected end region and still needs a separate estimate on any gap to a prescribed adjacent region. [E17b callable types][E17B] · [E29a return][E29]

## Uncovered-mass test

Lean checked the constant sequence of unit point masses on `PUnit`, an empty comparison family and an empty strip family. All strip bounds and the zero summed error hold at every $L,i$. The source mass tends to one, the component sum is zero, and the actual uncovered mass is one at every $L,i$. Thus deleting `uncoveredSmall` makes the proposed equality false even for constant finite data.

The same failure can occur in the numerical band with a positive supplied bubble and strictly positive residual. On a finite space of three points put masses $0$, $5\pi^2$, $\pi^2$ on the base image, bubble image and uncovered point, respectively. Use unchanged one-point truncations and no strips. Then $e=6\pi^2$ and $\delta=\pi^2$ satisfy the band, the bubble and base gaps hold and $e-e_X=\pi^2>0$. All strip errors vanish. The positive uncovered mass permits the bubble. This is a counterexample to dropping a premise of the abstract theorem.

## Verification and remaining inputs

`lake env lean --stdin` checked the structure fields and theorem types through `import FirstOrderTwistor` and checked E01 through `import SectionsAndConnections`. The four table declarations and E01 reported exactly `propext`, `Classical.choice` and `Quot.sound`. The one-point probe also elaborated. The field names and assumptions agree with the finite comparison, cover and limit implications supplied by E17a and E17b.

E17d can supply `compareMass` after proving the measured embedding and volume Jacobian identity and the convergence of the weighted chiral densities on each fixed truncation. E17e uses the nine squared operator entries and the explicit volume Jacobian. Its dominated convergence conclusion can be composed with E17d's separate image and limit mass identities. The bundled uniform-convergence theorem in E17d requires uniform convergence as its own input. The real estimates in E16a and E29a can supply some strip bounds once the geometric region and norm identities are proved. The public type still requires analytic and topological input for comparisons, null boundary intersections, the component gaps and strict residual, and estimates over all actual omitted regions. Identifying the original smooth type from the base uses a separate geometric argument. [E17d return][E17D] · [E17e return][E17E] · [E16a return][E16] · [Geometric obligations][GEOM]

[REQUEST]: ../research-progress/handoffs/LAUNCH_REQUESTS_20261125.md
[ACCOUNTING]: ../../../FirstOrderTwistor/Accounting.lean
[GEOM]: GEOMETRIC_PREMISES_20261125.md
[SEC]: ../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L4692
[E17A]: ../research-progress/handoffs/E17A_RETURN.md
[E17B]: ../research-progress/handoffs/E17B_RETURN.md
[E17D]: ../research-progress/handoffs/E17D_RETURN.md
[E17E]: ../research-progress/handoffs/E17E_RETURN.md
[E16]: ../research-progress/handoffs/E16A_RETURN.md
[E29]: ../research-progress/handoffs/E29A_RETURN.md
