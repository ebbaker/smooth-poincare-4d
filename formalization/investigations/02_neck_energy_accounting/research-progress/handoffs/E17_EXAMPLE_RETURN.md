# FOT-E17 · Two-point verification of measured accounting

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. The request specifies GPT-6.2 Sol at ultra. The actual serving model variant and reasoning effort are unavailable. Verified at `0c3399d831d7` with Lean `4.35.0-rc3`, Mathlib `c55e6e786f49` and DifferentialGeometry `788efe978944`. The package manifest retains SHA-256 `839111aae86b693524cd57db5ce7f2e8edc972dad49296468eb18d6735e52239`. [Issued request](LAUNCH_REQUESTS_20261125.md) · [Lean example](E17_MEASURE_EXAMPLE.lean)

The two-point source has the fixed reference volume $\delta_{\mathrm{false}}+\delta_{\mathrm{true}}$. At source index $i$, its density is $1$ at `false` and $d_i=1/(i+1)$ at `true`. The one-point base has unit mass. Its fixed comparison embeds onto `false`, with unit Jacobians for both inclusions used in `FixedTruncationComparison`. Its constant truncations exhaust the base. The kernel checks the source volume pullback, the weighted density comparison and the resulting family built with `TruncationFamily.ofEnergyComparisons`.

The singleton strip $\{\mathrm{true}\}$ is the actual source complement at every $L,i$, so the mass outside its union is zero. A supplied positive frame matrix with sole entry $\sqrt{d_i}$ has Hilbert–Schmidt square $d_i$. With zero negative block, the full four-slot strip integral is exactly $4d_i$. The strip's chiral mass and full cost are positive at each finite index and the costs tend to zero in the prescribed order. The total mass $1+d_i$ tends to $1$. The example calls `energyIdentityOfFullWeylStrips` to derive equality with the sum of the exhausted component masses. [Comparison family API](../../../../FirstOrderTwistor/ComparisonFamily.lean) · [Full-Weyl strip composition](../../../../FirstOrderTwistor/WeylAccounting.lean)

From `formalization/`, the command below exited successfully through `import FirstOrderTwistor`, with additional Mathlib imports for the reciprocal limit and Dirac measures.

```sh
lake env lean investigations/02_neck_energy_accounting/research-progress/handoffs/E17_MEASURE_EXAMPLE.lean
```

The public type printed the framed strip, iterated smallness, actual uncovered-mass and total-limit premises. `#print axioms` reported precisely `propext`, `Classical.choice` and `Quot.sound` for both the public theorem and `E17MeasureExample.twoPointAccounting`. The synthetic frame supplies the algebraic density on a finite measured space. Geometric curvature, orientation and chart extraction are outside the example's scope. [Independent premise check](../../reviews/ACCOUNTING_PREMISE_CHECK_20261125.md)
