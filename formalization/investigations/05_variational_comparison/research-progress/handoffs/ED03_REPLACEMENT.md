# VAR-E01 · Independent replacement return

25 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. Actual serving model and effort were unavailable.
This was a bounded E proof from the
[Route 05 plan](../../research-plan/PLAN.md) and its
[sole live register](../REGISTER.md).

## Inputs

- Issue checkout `a1a8b8866fafd24cc11236b426fcd67d7cdfee2b`, Route 05
  plan SHA-256 prefix `9555dc499aa01476`, and
  [variational manuscript input](../../../../../papers/master/manuscript/variational_comparison.tex)
  `0c9b1dce4aa655be`.
- The issue reported main TeX prefix `f5ece6cb00e65ecc`. The live main TeX
  gave `8bfc6287c7b128598` on opening and `d2d3a4151a4414f6` on
  recheck. The complete `prop:replacement` statement and proof had the
  same SHA-256 prefix `7e396e24466b4841` in the checked-out text and
  the Edition 03 committed source `2689540` (main TeX
  `6c47f8fe412eb856`). That passage and the fenced Lean proposition
  determine the proof target.
  [Master replacement](../../../../../papers/master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex)
- Lean `4.35.0-rc3` at `470d5ce1400764999581fd26d5d72b00d990b0f4`,
  Lake `5.0.0-src+470d5ce`, and
  [manifest](../../../../lake-manifest.json) `839111aae86b6935`.
  The existing [geometric energy API](../../../../FirstOrderTwistor/GeometricCutDescent.lean)
  provides the lower bound for `geometricPositiveEnergies` and
  membership transport along an oriented smooth diffeomorphism.

## Checked declarations

All three are in [Replacement.lean](../../../../SmoothPoincare/Variational/Replacement.lean)
at SHA-256 `132ae83265d702ec71b17dbc66102e6ed84482318d866b913a55f9c719afb68d`.

| Declaration in `SmoothPoincare` | Evidence |
| --- | --- |
| `repairedMass_le_excess_sum` | Exact fenced type. For each index in the finite set, `csInf_le` applies to the individual repair from the same set. The argument rearranges the supplied upper bound and sums. Original entry is an explicit premise. |
| `geometricRepairedMass_le_excess_sum` | Actual smooth Riemannian metrics on the same compact boundaryless oriented four-manifold. The removed mass is the set integral of the squared Hilbert–Schmidt norm of the source metric's actual self-dual Weyl block in its pointwise oriented orthonormal frame, with the physical Riemannian volume. The source and each repair have supplied positive class Yamabe value and integrability in their own volumes. |
| `geometricRepairedMass_le_excess_sum_of_pullback` | The source metric witnesses admission directly. Each actual repair on an oriented copy supplies its own smooth orientation-preserving marking. `geometricEnergy_mem_of_pullback` gives the witness on the original type for that index. The same-manifold statement uses the identity marking. |

The geometric cost premise compares each total repaired energy with the
original total less that region's source mass plus its full net surcharge.
Marked ball construction, admissibility of a constructed repair, and
bounds on the net surcharge remain geometric inputs. Disjointness is
unneeded in the finite comparison and belongs to a subsequent union
estimate. The existing frame-based norm and class Yamabe value are used
at their stated conventions. Frame independence and the intrinsic
variational identification remain shared dependencies.

## Verification

- `lake env lean SmoothPoincare/Variational/Replacement.lean` and
  `lake build SmoothPoincare.Variational.Replacement` both passed.
- A direct-module `lake env lean --stdin` screen checked a term at the
  exact fenced type, the empty index set with vacuous repair inputs,
  the exact-minimizer specialization, and a one-index case with
  `e = 5`, `sInf A = c = 3`, `m = 4` and `γ = 2`.
- `#print axioms` on each named theorem reported only
  `propext`, `Classical.choice` and `Quot.sound`.

The integration lead owns the public import, blueprint and register
entries.
