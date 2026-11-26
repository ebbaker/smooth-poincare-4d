# HT-E05a · The two native end-handle filtrations

25 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. This bounded E packet started at
`4bec4df82e8b949935dd5a43f12f52cd3d018acb` with the working Edition 03
marked-reduction sources. The dispatch selected GPT-6.2 Sol at ultra
effort. Independent serving telemetry is unavailable. The toolchain is Lean
`4.35.0-rc3` at `470d5ce14007` with DifferentialGeometry
`788efe97894474c032de6dfb1289d515f613d15a` and Mathlib
`c55e6e786f49471c72fbddbec5415808896aec1e`.
[Prior assessment](../../../reviews/MARKED_REDUCTION_AND_SIGNED_REPAIRS_20261125.md)

## Checked scope

For a compact Hausdorff smooth boundaryless four-manifold, take a smooth
real-valued function with nondegenerate critical points and distinct
critical values. Suppose every critical point on or below a prescribed cut
has index at most one and lies strictly below that cut.
`exists_endHandleFiltration` enumerates precisely these actual critical
points in increasing value order, starting at an empty sublevel. Each
successive closed interval has exactly the designated critical point
in its interior, and the successive intervals share their regular cuts.
The geometric data include an isolated native smooth adjunction inside
each interval and smooth ambient comparisons from the interval endpoints
to its inner attachment levels. Each of those comparisons carries the
whole corresponding sublevel and its marked level. The terminal
comparison has the same two properties up to the prescribed cut.

The local construction uses the specified Morse chart after shrinking its
radius below the smooth radius and both distances in height to the fixed
band edges. The pinned `Attachment/SublevelTransport.lean` supplies
`exists_morseHandleAdjunction_diffeomorph_upperSublevel_of_morseChart_zero`
and `exists_morseHandleAdjunction_diffeomorph_upperSublevel_of_morseChart`.
Both instances supply a diffeomorphism of the rounded native trace to the
actual upper sublevel, smooth inclusions from the lower sublevel and handle,
and forward and inverse comparisons on the deep lower region. The
index-zero attaching region is empty. Its native adjunction has a
homeomorphism to the disjoint union of the actual incoming body and a
standard closed four-disk. The index-one attaching map has the full
domain `Handle.AttachingRegion 1 3`, namely the two feet
$S^0\times D^3$. The native map into the lower regular level is smooth
and a closed embedding.

For `OrderedMorsePresentation I f h` and `MiddleIndexCuts I h a b`,
`exists_orderedEndHandleFiltrations` applies the construction at $a$
for $h$ and at $-b$ for $-h$. The latter end is the actual superlevel
$\{h\ge b\}$. The critical set is carried by the identity on the source
and each index is complemented in dimension four. The endpoint
`exists_selectedHandleReduction_of_inducedEnergy_le` can supply the
same $h,a,b$ at the inclusive induced-energy bound. The end-filtration
construction itself needs neither an energy hypothesis nor a homotopy
sphere hypothesis.
[Source and public declarations](../../../../SmoothPoincare/Heights/EndHandleBands.lean) ·
[Marked end-reduction target, Lemma 1](../../../../../papers/investigations-1/04_hypersurface_immersions/02_two_handle_recognition/manuscript/recognition_from_marked_morse_heights.tex)

## Remaining geometry

The filtration supplies each actual native attachment and its neighboring
ambient level maps. Building the graph from these feet, identifying its
component relation with that of the end body, and contracting its spanning
tree by smooth marked maps remain separate. Matching the resulting maps to
the collar germs and the middle-handle closure is also separate. The
statement uses the ordinary smooth atlas and gives smoothness and a closed
topological embedding for the feet. The pinned packaged smooth-embedding
predicate has an additional analytic atlas premise.

## Frozen source

| Input | SHA-256 prefix |
| --- | --- |
| Lake manifest | `839111aae86b6935` |
| Ordered Morse height | `3c7d02bb9f9ad4e4` |
| Isolated middle attachment | `d6953eba13193db8` |
| Selected handle reduction | `6314de355688e45a` |
| Complementary end indices | `cd6ca20467f8d573` |

`EndHandleBands.lean` has SHA-256
`d5a8a1bf3f1cb37df78ac4a56762f90304e7b958a984062e5a9e470d9a28422c`.

The targeted `lake build +SmoothPoincare.Heights.EndHandleBands` completed
successfully in the pinned project with 9,973 jobs. A separate Lean import of
the module printed axioms for the empty attaching region, the two birth
homeomorphisms, smoothness and closed embedding of the feet, isolated
zero- and one-handle existence, finite filtration existence and the paired
ordered filtration theorem. Every report listed only `propext`,
`Classical.choice` and `Quot.sound`.
