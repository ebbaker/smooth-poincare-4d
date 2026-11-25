# VAR-E06t · Shifted repair surplus and finite threshold

25 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. Actual serving model and effort were unavailable.
This bounded E packet follows the revised `cor:vol-reduction` in the
[master manuscript](../../../../../papers/master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex).
The [Route 07 register](../REGISTER.md) owns the live status.

## Pinned inputs

| Input or result | SHA-256 |
| --- | --- |
| Master TeX at issue | `9741e3d805c76fa9d13d09e723e35b5e3d57bd432d54fdc0125fbc48a54a24a2` |
| Complete `cor:vol-reduction` and its proof | `5fbb022ee247918285f5ad20cd1149b0c278ee3ba23dcf28b08ff2a974cf2d97` |
| [Replacement.lean](../../../../SmoothPoincare/Variational/Replacement.lean) | `132ae83265d702ec71b17dbc66102e6ed84482318d866b913a55f9c719afb68d` |
| [CurvatureMeasure.lean](../../../../SmoothPoincare/PhysicalScales/CurvatureMeasure.lean) | `057ab91fe0bc6cd15e10e3234e8a98e64766e02b49fa76ed66f4a19247c3b6ed` |
| [MeasureAccounting.lean](../../../../FirstOrderTwistor/MeasureAccounting.lean) | `8dc6831b76abc396d24419f25c7d6767b06d8bc18c04f07ca35fbd81e7d3755f` |
| [RepairThreshold.lean](../../../../SmoothPoincare/Variational/RepairThreshold.lean) | `c838a5320c0110b9cb87f735fd2be88479de92068768b8f50c9d89296de3339f` |

Lean `4.35.0-rc3` at `470d5ce1400764999581fd26d5d72b00d990b0f4`,
Lake `5.0.0-src+470d5ce`, and [manifest](../../../../lake-manifest.json)
SHA-256 prefix `839111aae86b6935`.

## Checked conclusions

`SmoothPoincare.geometricRepairThreshold` takes one actual smooth
Riemannian source on a compact boundaryless oriented four-manifold.
Its positive Yamabe sign and integrable squared self-dual Weyl block
are supplied in the existing framed energy convention. The nonempty
family of measurable domains has pairwise null intersections for the
physical chiral measure, and each corresponding actual repair is a
smooth positive metric on that same manifold with its own integrable
density. Each repair has the prescribed net cost bound relative to its
raw exterior. Both conclusions use the same data.

- Let $I$ be the fixed-type infimum, $e$ the source energy, $r$ the
  physical chiral mass of the entire complement, $N$ the cardinality,
  and $\Gamma$ the summed net surcharges. Finite additivity and the
  individual replacement inequality give
  $I\le r+\Gamma+(N-1)(e-I)$.
- If $r+\Gamma+(N-1)(e-T)\le T$, the sum of the individually certified
  upper bounds is at most $NT$. A particular index therefore has an
  actual repair energy at most $T$. The output includes the index and
  its membership proof, the positive Yamabe witness, and the
  integrability and energy bounds for that repair. Equality in the
  finite test is included.

`SmoothPoincare.geometricRepairLiminf` applies the shifted inequality
on a single subsequence carrying all the eventual geometric hypotheses.
The lower limit uses the order-complete extended reals with each score
computed in the reals first. The estimate needs neither convergence of
the source energies nor a uniform cardinality bound. A strict lower
limit below $T$ gives $I<T$. Equality of the lower limit with $T$ gives
$I\le T$, which permits an unattained $I=T$.

The mathematical recognition theorem at $T=4\pi^2$, construction of the
marked repair metrics, and control of their actual costs and complement
remain geometric inputs. The argument uses the full complement of the
same domains that appear in the repair bound.

## Verification

- `lake env lean SmoothPoincare/Variational/RepairThreshold.lean` and
  `lake build SmoothPoincare.Variational.RepairThreshold` passed.
- An imported-module screen checked inclusive threshold equality for a
  singleton actual metric family and the strict lower-limit inference.
  A scalar admissible-ray example checks the distinction between an
  infimum at $T$ and a witness at or below $T$.
- `#print axioms` on both declarations reported only
  `propext`, `Classical.choice`, and `Quot.sound`.
