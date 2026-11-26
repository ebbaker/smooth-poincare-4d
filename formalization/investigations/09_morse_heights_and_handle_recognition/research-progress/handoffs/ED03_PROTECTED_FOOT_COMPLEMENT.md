# HT-E06c · Complement of finitely many protected foot balls

26 November 2026, UTC. Prepared for Edward B. Baker III with OpenAI Codex
assistance. This bounded E packet specializes an existing finite-family
complement theorem to the protected disks in a regular level. Serving model
and effort telemetry are unavailable. The worktree was based on
`5706ef811adc3691fd85e75507a0a399cb81d18d`. The toolchain is Lean `4.35.0-rc3`
at `470d5ce14007`, DifferentialGeometry
`788efe97894474c032de6dfb1289d515f613d15a` and Mathlib
`c55e6e786f49471c72fbddbec5415808896aec1e`.
[Prior signed collar packet](ED03_RELATIVE_FOOT_COLLAR.md)

## Checked statement

On a preconnected Hausdorff Euclidean-modeled three-dimensional level, take a
finite family of smooth partial ball charts, with nonnegative marked radii.
Each open chart source contains its whole marked closed ball, including the
rim. Suppose the marked closed-ball images are pairwise disjoint. Then their
union is compact and its complement is preconnected. The pinned proof
thickens each compact marked ball inside its chart while avoiding the other
marked balls. The resulting punctured neighborhoods are chart images of
connected Euclidean annuli. An open-cover argument extends a separation of
the complement to one of the original level. These local neighborhoods can
overlap each other. The hypotheses use disjointness of the marked balls.
[Pinned finite-family complement theorem](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Topology/ClosedBallComplement.lean) · [Pinned open-cover argument](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Topology/ConnectedComplement.lean)

`protectedFootBalls_compact_and_compl_preconnected` returns both set
conditions for arbitrary marked radii. For the pinned `OrientedBallEmbedding`
type, `protectedUnitFeet_compact_and_compl_preconnected` uses its radius-two
room to cover the unit feet. `exists_relativeFootLevelIsotopy_awayFromFiniteFeet`
feeds both conditions into the relative isotopy when the source and target
unit feet each avoid every member of the protected family. It returns one
supported level isotopy relative to the whole union with the full unit-foot
endpoint equation. The signed collar lift then fixes any protected tube
represented over that union in its product coordinates.
[Lean source and public signatures](../../../../SmoothPoincare/Heights/ProtectedFootComplement.lean) · [Immediate collar application](ED03_RELATIVE_FOOT_COLLAR.md)

To apply this to native marks, identify each protected level section with
a closed disk image of the stated chart type and verify its pairwise
disjointness on the component being normalized. For other protected sets,
the corresponding compactness and complement condition remain separate.

## Frozen inputs and verification

| Input | SHA-256 prefix |
| --- | --- |
| Lake manifest | `839111aae86b6935` |
| HT-E06b Lean source | `7a41cf8e3b0c7b3c` |
| Pinned closed-ball complement | `8e2baac6485311b2` |
| Pinned connected-complement argument | `9105068ae36c74eb` |

The frozen SHA-256 of `ProtectedFootComplement.lean` is
`7f4c432c0c47e48e171eb752272bcba02b06d8abdd0735df62e244b73079679e`.
`lake build +SmoothPoincare.Heights.ProtectedFootComplement` completed
successfully with 4,268 jobs. A downstream Lean import checked the exact
signatures of all three public theorems and printed their axioms. Each
report listed only `propext`, `Classical.choice` and `Quot.sound`.
