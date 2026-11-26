# HT-E07e · The actual outgoing collar of both native rims

26 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex
assistance. The Edition 03 intake was a7bb158d6af806d2573a7702386622ed4c0bb1f1.
Serving model and reasoning effort were unavailable. The input includes
the native edge block checked in the same turn. [Owning register](../REGISTER.md) ·
[Marked edge block](ED03_ROUNDED_EDGE_BLOCK.md) ·
[Lean source](../../../../SmoothPoincare/Heights/RoundedOutgoingCollar.lean)

For a compact smooth four-manifold with the selected isolated index-one
handle, write $\Phi$ for the actual signed regular-height collar around
$f(p)+\varepsilon$. Let $T$ be the checked radial comparison from the
rounded cap to the native outgoing height quadric. If the rounding core
radius is strictly larger than the attaching radius, the two full native
rim spheres lie inside the open domain of $T$ and the rounding core.
The map from the compact rim parameter space $S^0\times S^2$ to the outgoing
level sends each pair to $T$ of its native rim point. Restrict $T$ to the
core and pull the outgoing collar back by its inverse. The resulting
partial diffeomorphism has an open source containing both outgoing rim
images at signed parameter zero. The generalized tube lemma supplies a
single open neighborhood of those images and one positive common width
$w$ for which the full signed strip lies in that source. The proof also
keeps $w\le\varepsilon/2$. [Actual outgoing collar](../../../../SmoothPoincare/Heights/OutgoingHandleCollar.lean) ·
[Block comparison](../../../../SmoothPoincare/Heights/RoundedEdgeBlock.lean)

The returned rounded collar $\Psi$ is exactly $T^{-1}\Phi$ throughout
this strip. Its inverse is $\Phi^{-1}T$ on its image. The rounded height
of $\Psi(x,t)$ is $f(p)+t$, so either inverse recovers the same signed
parameter. Both native rims are matched pointwise at parameter zero
and their complete $(S^0,S^2)$ markings are retained. Since the actual
outgoing strip stays above the critical height, the earlier ambient
foot normalization fixes its full image in both directions. [Foot
normalization and fixed outgoing chart](../../../../SmoothPoincare/Heights/MarkedTreeEdgeFeet.lean)

The existence theorem compares the rounded patch to the actual outgoing
collar of the selected step. Extending it across both incoming bodies
needs compatible collar maps on the complementary pieces, a global
filtration of the body incidences, and the full residual framed tube
markings. [Actual one-edge incidence](../../../../SmoothPoincare/Heights/NativeEdgeIncidence.lean)
The local statement uses the specified rounded cap function. Relating that
function to the stored attaching diffeomorphism still requires the
factorization discussed in the edge-block receipt.

## Checks

The direct module check passed without diagnostics.
The targeted Lake build completed in 10,115 jobs. An importing replay
checked the types and kernel axioms of both public declarations
`roundedRimOutgoingPoint` and `exists_roundedOutgoingCollar_nearNativeRims`.
Each depends only on `propext`, `Classical.choice` and `Quot.sound`.
The module SHA-256 is
`20bad2b6b3a5f04dbd19cce4fde88d80abec086afe71e716dd685c6eef078fe5`.
The toolchain and dependency pins are those in the edge-block receipt.
