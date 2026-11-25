# FOT-E16a · Annular bounds and iterated limits

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. The request assigns GPT-6.2 Sol/ultra. Actual serving model and effort are unavailable. This is a bounded E task proving real inequalities after the chart or field estimate is supplied. [Issued request](LAUNCH_REQUESTS_20261125.md) · [Lean module](../../../../FirstOrderTwistor/AnnularBounds.lean)

The request freezes `cf03e8f09359cac317499f6928edb09e4f80c280`. The work ran at its child `ad23403e9be521ebbc8395a9d958c0a02aef3c84`, the activation commit. The formalization input files used here agree with the frozen revision. The SEC source SHA-256 is `329513a3cfd8e939373533fad90f36b9108ce0ea41a22f9cc348587a4110fe66`. Lean was `4.35.0-rc3`, Mathlib was `c55e6e786f49471c72fbddbec5415808896aec1e`, and DifferentialGeometry was `788efe97894474c032de6dfb1289d515f613d15a`. The Lake manifest stayed unchanged. [Pinned baseline](../../../research-progress/01_BASELINE.md)

## Callable results

All declarations are in `FirstOrderTwistor`. The chart and field declarations both return the following proposition for `energy : ℕ → ℕ → ℝ`, where `L` is the trimming parameter and `i` is the sequence index.

```lean
∀ ε > 0, ∀ᶠ L in Filter.atTop, ∀ᶠ i in Filter.atTop, energy L i ≤ ε
```

| Declaration | Inputs |
| --- | --- |
| `noNeckOfSuppliedCharts` | Nonnegative real constants `C`, `K₀`, `B₀`. Eventually in `L` and then in `i`, deviation and Hessian norm are nonnegative, `hessian L i ≤ K₀`, `bach L i ≤ B₀`, and the E14 numerical upper bound holds with this `C`. The deviation satisfies the displayed smallness proposition with `deviation` in place of `energy`. |
| `noNeckOfSuppliedField` | Nonnegative real constants `Λ₀`, `W₀`. Eventually in `L` and then in `i`, `transverse L i ≤ Λ₀`, `weyl L i ≤ W₀`, Bach and defect are nonnegative, and `energy L i ≤ 8 * transverse L i * bach L i + 4 * weyl L i * defect L i`. Both Bach and defect satisfy the displayed smallness proposition in place of `energy`. |
| `annularLimsup_le_iff` | At fixed `L`, take a real sequence `energy : ℕ → ℝ` with an eventually nonnegative tail and `Filter.atTop.IsBoundedUnder (· ≤ ·) energy`. Then `Filter.limsup energy Filter.atTop ≤ a` iff for every `b > a`, eventually `energy i ≤ b`. |
| `annularSmallness_iff_tendsto_limsup` | Take `hnonneg : ∀ᶠ L in Filter.atTop, ∀ᶠ i in Filter.atTop, 0 ≤ energy L i` and `hbounded : ∀ᶠ L in Filter.atTop, Filter.atTop.IsBoundedUnder (· ≤ ·) (energy L)`. The displayed proposition is equivalent to `Filter.Tendsto (fun L => Filter.limsup (energy L) Filter.atTop) Filter.atTop (𝓝 0)`. |

The scalar smallness conclusions are upper bounds, so energy nonnegativity is consumed by the limsup bridge. In the forward direction, the bound `hbounded` can be supplied from the smallness conclusion at `ε = 1` as `(hsmall 1 zero_lt_one).mono fun _ h => ⟨1, h⟩`. In the reverse direction, a fixed-scale eventual upper bound is needed. Its value may depend on `L`.

The chart proof takes the deviation threshold at most one and bounds the bracket by `B₀ + (K₀ + 1) * (1 + K₀)`. The field proof takes one smallness threshold for both Bach and defect using the sum of the two uniformly bounded coefficients. The proofs intersect inner tails after fixing `L`, so each starting index may depend on `L` and the tolerance.

## Geometric premises supplied to the scalar results

- E14 still supplies smooth charts on the enlarged annuli, uniform constants and the numerical estimate `msneck:annulus-bound`. Its deviation threshold is eventually attained when `ε₀ > 0` and the deviation satisfies the nested smallness hypothesis. The required annular scale ratio and fixed cutoff buffers belong to the geometric premise. The globally vanishing Bach hypothesis is stronger than the bounded Bach hypothesis needed by the chart argument. [SEC `msneck:annulus` and `msneck:annulus-bound`](../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L5562)
- E15 still supplies a smooth transverse field with `X(τ) = 1` and a compactly supported weight with values in `[0,1]` that equals one on the trimmed region. The formula uses the supported curvature norm, the supremum of `|X||∇τ|`, the supported Bach norm and the differentiated weighted defect. The integrated flux identity, the estimate for the weighted energy and its comparison with trimmed energy belong to the geometric premise. [SEC `msneck:integrated` and `msneck:neck`](../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L5874)
- Both SEC estimates bound the full four-index Weyl energy. If `energy` is the positive-chiral Hilbert–Schmidt energy on an oriented Riemannian four-manifold, supply its domination by full-tensor energy when discharging `hbound`. This packet supplies scalar control of a given trimmed annulus. B03 still owns geometric realization of the inputs on the actual necks, and E17 owns coverage of the remaining energy. [SEC `msneck:no-neck-target`](../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L6507) · [Route plan](../../research-plan/PLAN.md)

## Checks

The module elaborated with `lake env lean` and was compiled to a temporary `.olean` for import. All four declarations passed `#check` and `#print axioms` through that import. Each depends on exactly `propext`, `Classical.choice` and `Quot.sound`.

Temporary Lean probes also checked the two relevant boundaries. The family `energy L i = if i ≤ L then 1 else 0` satisfies nested smallness and has diagonal energy one. The sequence `energy L i = (i : ℝ)` has no eventual upper bound and fails nested smallness, but its Mathlib real limsup is zero because its set of eventual upper bounds is empty and `Real.sInf_empty` is zero.
