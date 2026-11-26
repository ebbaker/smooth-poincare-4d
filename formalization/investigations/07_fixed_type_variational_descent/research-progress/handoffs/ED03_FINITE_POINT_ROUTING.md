# Edition 03 · Smooth routing of finite point families

25 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. The dispatch selected GPT-6.2 Sol at ultra effort.
Independent serving telemetry is unavailable. Starting repository revision
`4bec4df82e8b949935dd5a43f12f52cd3d018acb`; Lean `4.35.0-rc3`, Mathlib
`c55e6e786f49`, DifferentialGeometry `788efe978944`, Lake manifest
SHA-256 prefix `839111aae86b6935`.

On a Hausdorff preconnected boundaryless smooth four-manifold,
`exists_finitePointRouting` takes two injective point families with the same
finite label type and yields one ambient smooth diffeomorphism sending each
source point to its assigned target. The proof moves one source image at a time.
Earlier target images remain fixed. The ambient map is in the original smooth
model.

The support for each move lies in the complement of the already assigned
targets. The complement is preconnected by finite induction. For the induction
step, the current complement is an open submanifold, and the pinned
`ModelWithCorners.isPathConnected_compl_singleton` removes one point
from it. The pinned
`exists_supported_isotopy_apply_eq_of_isPreconnected` supplies the ambient
motion after changing to the Euclidean atlas. Conjugation by the identity maps
between atlases gives the desired diffeomorphism in the original model.

`exists_finitePointRouting_into_opens` assigns a nonempty open target
to each label. The targets may overlap. In a Euclidean chart, the complement of
the finitely many forbidden chart values is dense, so each open target supplies
a point outside the earlier images. Local contractions then fit the complete
disks inside the inverse images of these targets in the marked-disk separator.
[Proof source](../../../../SmoothPoincare/Variational/FinitePointRouting.lean)
· [Marked-disk separator](../../../../SmoothPoincare/Variational/MarkedDiskSeparation.lean)

The 26 November 2026 UTC integration used working base
`5706ef811adc3691fd85e75507a0a399cb81d18d` and the same pins. The final
`FinitePointRouting.lean` compiled with `lake env lean -j1` without diagnostics.
Its SHA-256 is `b050f7e86404fe5b8dd7c7228c30ecf504d5a4909ab2728a37d93f4a2f6d0e51`.
The kernel replay through `SmoothPoincare.Variational.BalancedPhysicalDivision`
checked `isPreconnected_compl_finset_four`, `exists_finitePointRouting` and
`exists_finitePointRouting_into_opens`. Each depends on `propext`,
`Classical.choice` and `Quot.sound`.
