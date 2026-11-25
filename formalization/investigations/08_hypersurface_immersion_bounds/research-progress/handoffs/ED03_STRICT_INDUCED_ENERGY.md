# IMM-E01 · Strict induced energy from indexed heights

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Actual serving model and reasoning effort were
unavailable. This bounded E integration uses manuscript SHA-256 prefix
`d294f6e4600927f5`, lines 43–74. The frozen Lean sources were
`InducedEndpoint.lean` (`eb5e6349cc483f14`) and `GaussSheets.lean`
(`444e675a325620c5`). The actual-fiber identity is from
`IndexedHeightFibers.lean` (`628c0f758d17d05c`).
[Immersion manuscript](../../../../../papers/master/manuscript/immersion_entry.tex#L43) ·
[Endpoint saturation](ED03_ENDPOINT.md) ·
[Indexed energy budget](../../../09_morse_heights_and_handle_recognition/research-progress/handoffs/ED03_INDEXED_BUDGET.md)

## Integrated conclusions

`inducedEnergy_strict_of_indexedMean` takes the indexed mean identity,
count integrability and almost-sure count floor of two as inputs. It
proves $E_+(g)>64\pi^2/9$ for the induced metric of the specified immersion.
At or below the threshold, `inducedEndpoint_forces_balancedPrincipalFrames`
would make the open middle locus nonempty and its actual principal spectra
balanced everywhere there. `noOpenBalancedPrincipalFrames` excludes
that conclusion for the same immersion.

`inducedEnergy_strict_of_gaussSheets` supplies the mean identity and
count integrability by `meanIndexTwo_eq_gaussMass`. The measured atlas uses
the normal of the specified immersion, the induced domain volume and
the same signed principal determinant on the open middle locus. Its
normalization uses total area $8\pi^2/3$ and an antipode that preserves
that area measure. The supplied count equals the actual two-normal
fiber multiplicity almost everywhere. Positivity of the signed product
on the ordered middle locus supplies the nonnegativity required
by the area theorem.

`inducedEnergy_strict_of_actualIndexTwo` takes one family of principal
frames on the domain and defines the middle locus from their actual
strict middle signature. On that locus the same frames are ordered
with the two negative entries first and agree with the energy frames.
`meanActualIndexTwo_eq_gaussMass` supplies the indexed mean of the
actual `Set.ncard` of nondegenerate index-two critical points.
The count is finite almost everywhere by the same identity package.
The almost-sure lower bound of two is assumed for this actual count.
[Actual height fibers](../../../09_morse_heights_and_handle_recognition/research-progress/handoffs/ED03_INDEXED_HEIGHT_FIBERS.md)

The determinant, frame compatibility and pointwise signed middle
spectrum are retained in all three theorem statements. Their energy is the
full chiral integral over the domain, including the exterior of the
middle locus. Integrability of the full Weyl density, determinant
integrability on the middle locus and continuity of the middle
deficit remain explicit. The second theorem assumes the measured
Gauss atlas and the almost-sure count identity and floor. The third
uses the measured atlas and the floor for the actual count. Constructing
that atlas and applying the smooth topological count theorem remain
separate requirements for recognition of the source.
[Lean module](../../../../SmoothPoincare/Immersions/StrictInducedEnergy.lean)

## Verification

Lean `4.35.0-rc3` at `470d5ce1400764999581fd26d5d72b00d990b0f4`.
Lake manifest SHA-256 prefix `839111aae86b6935`.

- `lake env lean SmoothPoincare/Immersions/StrictInducedEnergy.lean` passed
  with `GeometricOpenEquality.lean` at SHA-256 prefix `42a481fb255f465a`.
- `lake build +SmoothPoincare.Immersions.StrictInducedEnergy` passed
  (9,764 jobs).
- The importing `lake env lean --stdin` checked all three declarations.
  Each axiom report lists `propext`, `Classical.choice` and `Quot.sound`.
- Checked module SHA-256
  `b951c05c91d5e77a7777d9b690c1e3df4a228a2e07398e0a852a40b9ed5281ca`.
