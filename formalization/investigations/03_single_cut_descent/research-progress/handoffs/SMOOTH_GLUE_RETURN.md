# E25b · Smooth reassembly on the marked open patches

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. The route activation records a request for GPT-6.2 Sol at ultra. The serving runtime does not independently expose its model variant and reasoning effort. This bounded execution packet verifies the assembly of supplied smooth maps. [Route activation](ACTIVATION_20261125.md)

## Verified declarations

`FirstOrderTwistor.SmoothCutGluing I J M Xhat` gives the core and exterior maps as Mathlib `OpenPartialHomeomorph`s with `ContMDiffOn` in both directions. Their sources and targets each cover their respective manifold. The collar is an actual open partial homeomorphism from the full source overlap onto the full target overlap, and the two forward maps restrict to it. Its inverse takes each point in the target overlap to a source point in both patches. Applying the respective right inverse at that point proves inverse agreement. Both collar maps are therefore smooth on their open domains.

`SmoothCutGluing.toDiffeomorph` defines both global maps piecewise. The piecewise maps restrict to both forward patch maps and both inverse patch maps. The two covers and the local inverse identities give the global inverse identities, and the Mathlib open-union lemma proves smoothness in each direction. The six `toDiffeomorph_eq_*` and `toDiffeomorph_symm_eq_*` theorems give the actual restriction equations on the core, exterior and collar. [Lean source](../../../../FirstOrderTwistor/SmoothCutGluing.lean)

## Scope and input versions

The proposition applies to charted spaces with specified manifold models at smooth regularity and concludes a Mathlib `Diffeomorph` of those models. Specializing it to the normal-coordinate cut still requires the geometric construction of the open patches, smooth maps and their shared collar germ from the cut and recognized exterior. The local orientations and their preservation are a separate proof obligation. [E03 normal-coordinate marking](../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E03_EMBEDDED_CUT_20261125.md) · [E02/E05 smooth identification](../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E02_E05_SAME_TYPE_DESCENT_20261125.md)

The frozen inputs at `7db310a2a9219c537b440d7c2fb39e602a32b729` agreed with the files checked at `0c3399d831d71a1a17c29ffcba14ee0593315cbe`. The E03 and E02/E05 SHA-256 prefixes were `6ecef368cfe3b840` and `61d01e1cf53be476`. Lean `4.35.0-rc3`, Mathlib `c55e6e786f49` and DifferentialGeometry `788efe978944` were pinned by the unchanged toolchain and Lake manifest.

## Checks

`lake env lean FirstOrderTwistor/SmoothCutGluing.lean` and `lake build FirstOrderTwistor.SmoothCutGluing` passed. A separate import elaborated `#check SmoothCutGluing.toDiffeomorph`. `#print axioms` returned `propext`, `Classical.choice` and `Quot.sound` for the construction, inverse agreement, inverse collar smoothness and all six restriction theorems.
