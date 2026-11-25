# Progress register

This is the live register for the `SP4-FORM-SEC` task family. See the
[plan](../research-plan/PLAN.md) for scope and acceptance checks and
the [overview](../research-overview/OVERVIEW.md) for input versions.

## 25 November 2026

Initialized the investigation for Edward B. Baker III with OpenAI Codex
assistance. The serving model identifier and reasoning effort are
unavailable. The installed Lean `v4.35.0-rc3` was confirmed and
`lake build` passed for the starter package. This is the build
baseline for the pilot. The author subsequently activated E01.

| Task | Status | Evidence or dependency |
| --- | --- | --- |
| SP4-FORM-SEC-B03 | Decided | [Coordinate pairing and proof interface for E01](../brainstorm/notes/E01_COORDINATE_PAIRING.md) |
| SP4-FORM-SEC-E01 | Verified | [`SectionsAndConnections.threeAxisWeylEstimate`](../../../SectionsAndConnections/ThreeAxisWeyl.lean) · [verification](#e01-verification) · [bounded returns](handoffs/E01_20261125.md) |
| SP4-FORM-SEC-B01 | Ready | Flat symbol statement and proof sketch in the blueprint |
| SP4-FORM-SEC-E02 | Reserved | Awaiting the B01 decision |
| SP4-FORM-SEC-B02 | Ready | Chiral curvature source conventions and pinned geometry library |
| SP4-FORM-SEC-E03 | Reserved | Awaiting the B02 decision |
| SP4-FORM-SEC-E04 | Reserved | Awaiting the B02 decision and E03 proof |

### E01 verification

25 November 2026, for Edward B. Baker III, with OpenAI Codex assistance.
The author selected Astra at ultra for the lead. The runtime supplied
no independent lead model or effort identifier. The source of the
estimate is manuscript §2.1, `secjet:orthogonal`. The [blueprint](../../../blueprint/src/content.tex)
uses `def:null-evaluations` and `lem:three-axis-weyl`.

The manuscript, blueprint input and manifest SHA-256 digests matched the
[setup record](../research-overview/OVERVIEW.md#inputs-at-setup).
Lean reported `4.35.0-rc3`, commit `470d5ce1400764999581fd26d5d72b00d990b0f4`,
and Lake reported `5.0.0-src+470d5ce`. All ten package checkouts matched
`lake-manifest.json` with clean tracked sources, including Mathlib
`c55e6e786f49471c72fbddbec5415808896aec1e` and DifferentialGeometry
`788efe97894474c032de6dfb1289d515f613d15a`.

The [library entry point](../../../SectionsAndConnections.lean) imports the
[proof module](../../../SectionsAndConnections/ThreeAxisWeyl.lean). Its
public hypotheses are `W : Matrix (Fin 3) (Fin 3) ℝ`, `W.IsSymm`, and
`W.trace = 0`. Its first conclusion is the equality with \(3/4\) times
the diagonal sum plus the strict upper-triangular sum. Its second is the
lower bound on the same sum of squared magnitudes by \(1/2\) times the
double sum over all entries. The lemma `axisNullEvaluation_eq` needs
only symmetry and proves the component formula for the normalized
bilinear pairing. A second elaboration checked the literal chained
display using componentwise division by \(\sqrt2\). [Integration record](handoffs/E01_20261125.md)

Run from `formalization/`:

```sh
lake build
lake env lean --stdin <<'LEAN'
import SectionsAndConnections
#check SectionsAndConnections.axisNullEvaluation_eq
#check SectionsAndConnections.threeAxisWeylEstimate
#print axioms SectionsAndConnections.axisNullEvaluation_eq
#print axioms SectionsAndConnections.threeAxisWeylEstimate
LEAN
make -C blueprint
```

The Lake build completed successfully (1619 jobs). For each declaration
Lean reported exactly `[propext, Classical.choice, Quot.sound]`.
The audit therefore closes E01 with no `sorryAx` or project axiom.

The PDF and web blueprint rebuilt. The web blueprint marks the coordinate
definition, lemma statement and lemma proof as checked. The four names
in `blueprint/lean_decls` resolve through the library entry point. In the
section and the dependency graph, each link reaches its defining source
line. The verified module has SHA-256
`003da61e9d593fbc9c1c61b900098ac9de3c0c6768202314add227583efd3350`.
The annotated `blueprint/src/content.tex` has SHA-256
`e97c1131cf0bfdbd62a10adff7e517eacbb7cc8ebee80cead6a571398aa6a278`.

Chat provenance: the exact-thread diagnostic found no local source or
registration, and the app's thread reader returned error `-32000`.
