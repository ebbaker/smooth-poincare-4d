# CUT-E02j · Whole physical charges in the marked comparison

25 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. Actual serving model and effort were unavailable.
This was a bounded E composition on one source metric. The
[Route 03 register](../REGISTER.md) owns the live status.

| Input or result | SHA-256 prefix or revision |
| --- | --- |
| [AnchoredShell.lean](../../../../SmoothPoincare/PhysicalScales/AnchoredShell.lean) | `6f26c4b8f1c425de` |
| [CutNonsplitting.lean](../../../../SmoothPoincare/Variational/CutNonsplitting.lean) | `c4514e99511affe7` |
| [CurvatureMeasure.lean](../../../../SmoothPoincare/PhysicalScales/CurvatureMeasure.lean) | `057ab91fe0bc6cd1` |
| [Anchored-annulus manuscript](../../../../../papers/master/manuscript/critical_annulus.tex) | `8fdb856aaac2dd9c` |
| [Marked-cut manuscript](../../../../../papers/master/manuscript/marked_cut.tex) | `0275b20c9bb7cdc3` |
| [ChargedCut.lean](../../../../SmoothPoincare/PhysicalScales/ChargedCut.lean) | `e45f7a7e6a229bb528a67c941ffe80eca38fe2fe91e59b5f1bc2581e2bc962bd` |
| DifferentialGeometry pin | `788efe97894474c032de6dfb1289d515f613d15a` |
| Mathlib pin | `c55e6e786f49471c72fbddbec5415808896aec1e` |

Issue checkout `b5de9758f16e14f22162b4a1e091166ea126c389`. Lean
`4.35.0-rc3` at `470d5ce1400764999581fd26d5d72b00d990b0f4` and
[manifest](../../../../lake-manifest.json) SHA-256 prefix `839111aae86b6935`.

## Finite result

`SmoothPoincare.geometricChargedCut_le_excess` uses one actual smooth
Riemannian source metric, one oriented curvature frame and its finite
physical chiral measure. Its two supplied set inclusions put the actual
inner ball in the full left raw side and the complement of the actual
median ball in the full right raw side. A lower charge bound on either
set transfers by monotonicity to its full raw side. On a measurable raw
side the real mass of this same measure equals the regional
Hilbert–Schmidt integral. In the quantile application the lower charges
can be the prescribed fraction of total energy for the inner ball and
half the total energy for the entire median exterior.

The inputs carry two actual positive capped metrics, both oriented
recognition tests at the inclusive threshold and both signed marked
reassembly realizations. The raw sides cover the entire source and
are disjoint up to a physical volume null set. Either a nonstrict bound
on the sum of the two capped energies or the nonstrict bound on source
energy plus both surcharges suffices.

- If the left cap supplies the marked competitor, the full right raw
  mass and the whole exterior's lower charge are at most the source
  excess plus the left surcharge.
- If the right cap supplies the marked competitor, the full left raw
  mass and the inner ball's lower charge are at most the source
  excess plus the right surcharge.

Each branch returns the actual oriented competitor with the marked
images and positive pullback metric. If both charge lower bounds
strictly exceed their respective opposite-surcharge bounds, the
same theorem gives a contradiction.

`anchoredShell_places_charged_sets` first gives the containments in
the two open components. Composing those containments with the
inclusions of the open components into the corresponding marked raw
sides supplies the two inputs here. The shell theorem also protects the
closed trim. Construction of the oriented shell, identification of the
actual raw sides and their marks, and the positive cap and energy
estimates remain geometric prerequisites of the application.

## Verification

- `lake build SmoothPoincare.PhysicalScales.ChargedCut` passed without
  diagnostics. The imported-module screen checked the precise placement
  and charged comparison interfaces.
- An imported example supplied exact equality of the sum of the two
  capped energies with twice the threshold. In that case the two strict
  opposite-surcharge charge inequalities still yielded a contradiction.
- `#print axioms` on `geometricChargedCut_le_excess` reported only
  `propext`, `Classical.choice`, and `Quot.sound`.
