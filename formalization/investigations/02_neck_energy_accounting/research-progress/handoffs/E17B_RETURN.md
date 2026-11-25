# FOT-E17b · Iterated accounting limits

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. GPT-6.2 Sol/ultra was requested. Serving variant and effort are unavailable. This is bounded E work with the real limit argument fixed in [the issued request](LAUNCH_REQUESTS_20261125.md#route-02--issued-execution-requests-revision-1).

Lean `4.35.0-rc3` checked [AccountingLimits.lean](../../../../FirstOrderTwistor/AccountingLimits.lean) at working HEAD `ad23403e9be521ebbc8395a9d958c0a02aef3c84`. The request cites `cf03e8f09359cac317499f6928edb09e4f80c280`. The tested SEC manuscript retained the requested SHA-256 `329513a3cfd8e939373533fad90f36b9108ce0ea41a22f9cc348587a4110fe66`, and the installed commits were Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e` and DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`. The module imports `Mathlib.Topology.Instances.Real.Lemmas`.

## Callable declarations

All names are in `FirstOrderTwistor`. The implicit data are `{ι : Type*} {sourceFilter : Filter ι} {t : ι → ℝ} {c : ℕ → ι → ℝ} {a : ℕ → ℝ} {e s : ℝ}`, with `s` absent from the fixed-truncation declaration. The source filter specializes to `atTop` for natural source indices. The truncation filter is `atTop` on `ℕ` throughout.

```lean
ht : Tendsto t sourceFilter (𝓝 e)
hc : ∀ L, Tendsto (c L) sourceFilter (𝓝 (a L))
ha : Tendsto a atTop (𝓝 s)
hle : ∀ L, ∀ᶠ i in sourceFilter, c L i ≤ t i
hsmall : ∀ ε : ℝ, 0 < ε →
  ∀ᶠ L in atTop, ∀ᶠ i in sourceFilter, t i - c L i ≤ ε
```

| Call | Conclusion | Filter premise |
| --- | --- | --- |
| `tendstoAccountingRemainder ht hc L` | `Tendsto (fun i => t i - c L i) sourceFilter (𝓝 (e - a L))` | Any source filter |
| `accountedEnergy_le_totalEnergy ht hc ha hle` | `s ≤ e` | `[sourceFilter.NeBot]` |
| `totalEnergy_eq_accountedEnergy ht hc ha hle hsmall` | `e = s` | `[sourceFilter.NeBot]` |

Subtraction commutes with the limit at each fixed truncation. Closedness of the real order first passes each eventual source inequality to its fixed-truncation limit. The resulting inequalities then pass to the outer truncation limit. For equality, the nested assumption gives `e - s ≤ ε` for each `ε > 0`. A putative positive difference is contradicted by taking half that difference. The comparison theorems use `NeBot` because convergence and eventual inequalities on the bottom filter are vacuous. The natural sequence case supplies `NeBot` by typeclass inference.

## Verification and scope

`lake env lean FirstOrderTwistor/AccountingLimits.lean` succeeded. A temporary import probe checked all three types using `#check @...` and reported `[propext, Classical.choice, Quot.sound]` for each `#print axioms`. It also checked the natural sequence with total energy `1` and captured energy `0` for `i ≤ L` and `1` for `L < i`. Its nested remainder vanishes while its remainder along `i = L` is `1`.

The declarations implement the limit step of SEC [§12.4, `msgap:accounting`](../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L4692) and [§15](../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L6522). Geometric suppliers still have to identify `c L i` with measured energies of disjoint truncations, prove fixed-truncation convergence and component exhaustion, and control the entire complement for `hsmall`. The proof needs no stronger limit premise or geometric conversion within this packet. Those geometric obligations remain with E17 composition and B03.
