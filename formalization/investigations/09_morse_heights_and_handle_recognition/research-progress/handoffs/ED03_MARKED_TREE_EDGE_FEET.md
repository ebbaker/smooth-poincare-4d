# HT-E06k · Simultaneous normalization of one merging edge

26 November 2026, UTC. Prepared for Edward B. Baker III with OpenAI Codex
assistance. This bounded E packet combines the checked native one-foot
ambient motion with the shared calibrated collars of a merging edge.
Serving model and effort telemetry are unavailable. The worktree was based
on `4b15d52a9301ca6796002774b712fc51a82c09c9`. The Lean toolchain is
`4.35.0-rc3` at `470d5ce14007`, DifferentialGeometry
`788efe97894474c032de6dfb1289d515f613d15a` and Mathlib
`c55e6e786f49471c72fbddbec5415808896aec1e`.

## Native input and ambient comparison

Let $p$ be the specified index-one critical point on a compact Hausdorff
smooth four-manifold, and take the native Morse-handle data with isolated
incoming cut $c=f(p)-\epsilon$. The two chosen foot labels have disjoint
connected components in that incoming level. Each component has a supplied
orientation, an oriented model ball chart and a finite family of protected
oriented ball charts. The protected closed unit-foot images in each component
are pairwise disjoint and avoid the actual and model closed unit-foot images.

`IsolatedOneHandle.exists_ambientNativeFootNormalization_inCollar` performs
one normalization in a prescribed exact signed collar of its actual level
component. The collar is calibrated by $f=c+t$. It yields a global smooth
self-diffeomorphism preserving height in both directions, with a compact
support in the collar image. `NativeFootCollarEquations` records the full
native unit-foot coordinate law for $|t|\le r/3$, with the inverse law and
the protected tube equations on all $|t|<r$.

`IsolatedOneHandle.exists_markedTreeEdgeFootNormalization` applies this
construction to both component strips of the same native height collar.
Their common half-width satisfies $0<r\le\epsilon/2$ and their ambient
targets are disjoint. The two ambient motions fix the complements of their
compact supports. Injectivity implies that each map preserves its own
component strip, so their composition and its inverse agree on each strip
with the corresponding single-foot maps. For each foot the full model
coordinate is $A_i z$, with the recorded choice $A_i=I$ or $A_i=-I$.
The composite fixes both protected systems, preserves height globally and
fixes the complement of the union of the disjoint compact supports in both
directions. Its restriction to $t=0$ gives the equations on the actual
incoming feet.
[Lean source and exact declarations](../../../../SmoothPoincare/Heights/MarkedTreeEdgeFeet.lean)

Every point of either support lies strictly below $f(p)$. At the actual
outgoing level $f(p)+\epsilon$, the calibrated outgoing collar has half-width
$\rho>0$. `IsolatedOneHandle.exists_fixedOutgoingSignedHeightCollar` gives
the explicit positive half-width $\min(\rho,\epsilon/2)$ on which the ambient
comparison and its inverse fix every point of that outgoing collar, for
positive and negative signed parameters.

The signed comparison operates on the two feet of a specified merging edge.
A smooth collapse of the rounded four-dimensional rim and propagation of
such collapses through the tree require further geometric constructions.

## Frozen inputs and verification

| Input | SHA-256 prefix |
| --- | --- |
| Lake manifest | `839111aae86b6935` |
| Native one-foot ambient source | `fddb7833d7d1cc29` |
| Shared calibrated component collars | `508bf1be521ae4de` |
| Native outgoing collar | `b8c7a2c9441a6e97` |
| Centered native height collar | `33b435d9ffc52359` |

The frozen SHA-256 of `MarkedTreeEdgeFeet.lean` is
`21c150cbaba32780ba898799f2cd116883445e0c0dbbda2aa93cabb6d491d973`.
`lake build +SmoothPoincare.Heights.MarkedTreeEdgeFeet` completed with
10,112 jobs. A downstream import checked the exact signatures of the
marking data, the collar equations and the three public theorems. The
axiom reports for all three theorems listed only `propext`,
`Classical.choice` and `Quot.sound`.
