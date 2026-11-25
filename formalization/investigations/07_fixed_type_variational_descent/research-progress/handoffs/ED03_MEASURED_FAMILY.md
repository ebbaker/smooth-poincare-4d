# VAR-E06g · Measured independent repair family

25 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. Actual serving model and effort were unavailable.
This bounded E packet combines the checked finite repair inequality and the
fixed-tolerance limit from the [Route 07 plan](../../research-plan/PLAN.md).
The [route register](../REGISTER.md) owns the live status.

## Scope and inputs

The sources are the one-sided replacement and fixed-tolerance step of
`cor:vol-reduction` in master revision `2689540`. The passage in that
revision and in the inspected working text `d2d3a4151a4414f6` has SHA-256
prefix `887e42519fd5a6c6`. The Route 07 plan prefix is `147fe387b7fa9d779`.
`prop:joint-vol` in the physical-volume input `b972bc5466245c5d` can
provide a bound on the entire remainder if its geometric hypotheses hold.
[Master comparison](../../../../../papers/master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex) ·
[Physical-volume selection](../../../../../papers/master/manuscript/physical_volume.tex)

| Input or result | SHA-256 |
| --- | --- |
| [Replacement.lean](../../../../SmoothPoincare/Variational/Replacement.lean) | `132ae83265d702ec71b17dbc66102e6ed84482318d866b913a55f9c719afb68d` |
| [RepairResidual.lean](../../../../SmoothPoincare/Variational/RepairResidual.lean) | `ce2a364f877a8fbeb6782f44ab374d201fb5dd69afa6c2c7f473331ad919e820` |
| [CurvatureMeasure.lean](../../../../SmoothPoincare/PhysicalScales/CurvatureMeasure.lean) | `057ab91fe0bc6cd15e10e3234e8a98e64766e02b49fa76ed66f4a19247c3b6ed` |
| [MeasuredRepairFamily.lean](../../../../SmoothPoincare/Variational/MeasuredRepairFamily.lean) | `18934fcb88daacee80a5474ce2c0c77ad2a2423f923f8d898365de69e13d5505` |

The package uses Lean `4.35.0-rc3` at `470d5ce1400764999581fd26d5d72b00d990b0f4`,
Lake `5.0.0-src+470d5ce`, and the [manifest](../../../../lake-manifest.json)
with SHA-256 prefix `839111aae86b6935`.

## Exact conclusion

`SmoothPoincare.geometricEnergyBoundOfRepairFamily` takes one sequence
of actual smooth metrics on a fixed compact, boundaryless, oriented
smooth four-manifold. Each source metric has positive `classYamabeFour`
and an integrable squared positive Weyl-operator norm in the supplied
pointwise oriented orthonormal frame. Its physical chiral measure weights
its own Riemannian volume by this density. Its total energy converges
to the real infimum of `geometricPositiveEnergies` on that smooth type.

For one fixed tolerance, the chosen subsequence is indexed by the
natural numbers. Eventually its family has bounded cardinality, measurable
regions with chiral-null pairwise intersections, and an actual smooth
positive repair on the same oriented $M$ for each index. The repaired
energy is at most the source energy less that region's source chiral mass
plus its net surcharge. For each small error allowance, the eventual bounds
on the summed surcharge and entire uncovered chiral mass hold together.
Their two limiting bounds sum to an upper bound for the infimum.

The shared `geometricChiralMeasure` is defined through
`FirstOrderTwistor.energyMeasure`. Its `_finite`, `_real_eq_setIntegral`
and `_real_univ` theorems use that API in the physical metric. The proof
uses `measureReal_univ_eq_sum_add_compl` to get an equality before the
repair sum and the limit lemma are applied. Chiral-null intersections
also follow from volume-null intersections by absolute continuity of the
weighted volume. [Energy density](../../../../FirstOrderTwistor/EnergyDensity.lean) ·
[Measure accounting](../../../../FirstOrderTwistor/MeasureAccounting.lean)

Geometric selection of the marked domains, construction of their positive
repairs, and a bound for the full complement remain inputs. Raw uncovered
volume can supply the latter through an independently established uniform
absolute-continuity estimate. The limit estimate also applies when the
complement bound includes escaping, nonregular or excluded atomic mass.

## Verification

- `lake env lean SmoothPoincare/Variational/MeasuredRepairFamily.lean`
  passed without diagnostics. The corresponding `lake build` target built
  both the shared measure and measured repair modules.
- An imported-module screen instantiated a sequence with the empty repair
  family and fixed positive full complement mass `1`. It checked the
  conclusion `sInf (geometricPositiveEnergies o) ≤ 1` under the stated
  convergence and metric hypotheses.
- `#print axioms` reported only `propext`, `Classical.choice` and
  `Quot.sound` for the main theorem, the shared measure definition and
  each of its three companion theorems.
