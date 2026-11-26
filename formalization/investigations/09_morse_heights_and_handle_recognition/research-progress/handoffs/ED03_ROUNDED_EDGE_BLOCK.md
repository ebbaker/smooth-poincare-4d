# E41 · The native rounded edge block

26 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex
assistance. This was a bounded Edition 03 execution task from intake
`a7bb158d6af806d2573a7702386622ed4c0bb1f1`. The serving model identifier
and reasoning effort for this worker were unavailable. The return concerns
one actual isolated index-one step of the selected smooth four-dimensional
filtration. [Owning register](../REGISTER.md) ·
[Previous assessment](../../../reviews/NATIVE_FEET_AND_PHYSICAL_JETS_20261125.md) ·
[Lean source](../../../../SmoothPoincare/Heights/RoundedEdgeBlock.lean)

## The marked block and signed rounding map

Use the selected step's own IsolatedOneHandle, with critical value
$c=f(p)$, regular levels $c\pm\varepsilon$, cocore radius $r>0$, and
Morse chart $\chi$. The chart runs from model coordinates into the manifold.
In coordinates $(a,z)\in\mathbb R^1\times\mathbb R^3$, the block chart is
$$
 E(a,z)=\chi\bigl(\sqrt{2\varepsilon+r^2\|z\|^2}\,a,rz\bigr).
$$
After applying $\chi^{-1}$ to an actual point, the inverse divides its
transverse coordinate by $r$ and its axial coordinate by
$\sqrt{2\varepsilon+\|w\|^2}$, with $w$ the unscaled transverse
coordinate. Both maps are smooth across the entire two-sided open block,
whose source is the preimage of the doubled Morse ball. The exact height is
$$
 f(E(a,z))=c-\varepsilon+
     (1-\|a\|^2)(\varepsilon+r^2\|z\|^2/2).
$$
The lower sublevel corresponds to $\|a\|\ge1$, and its defining level
to $\|a\|=1$. For both native attaching labels $b\in S^0$ and every
$z\in D^3$, the map sends $(b,z)$ to the original cocore embedding.
The inverse recovers both parameters. Composing with the previously
constructed ambient normalization $F$ gives the model-foot equality for
$F\circ E$ and its inverse with the selected transverse isometry $A_b$,
including when $A_b=-\mathrm{id}$. The hypotheses for applying that
normalization include distinct actual incoming components and furnished
orientation, model and protected foot charts. The protected-tube equations
apply to $F$ throughout its supplied signed strip. [Simultaneous native
foot normalization](../../../../SmoothPoincare/Heights/MarkedTreeEdgeFeet.lean) ·
[Actual chart used at births and edges](../../../../SmoothPoincare/Heights/NativeBirthBody.lean)

In the original Morse coordinates $(u,w)$, set $s=\|u\|^2$,
$b=\|w\|^2$, and let $C(s)$ be the pinned smooth cap.
Set $\Delta(s)=2\varepsilon+s-C(s)$. The rounded rim transport on the
actual ambient manifold, expressed in $\chi$, is
$$
 (u,w)\longmapsto
 \left(u,\sqrt{\frac{b+\Delta(s)}{b}}\,w\right).
$$
Its inverse changes $\Delta$ to $-\Delta$, using the new transverse
radius in the denominator. The open domain is specified by $b>0$,
$b+\Delta(s)>0$ and both points lying in the doubled Morse ball. Axial
coordinates and transverse directions are preserved. On the core
$\operatorname{morseNorm}\le R_0<R_1$ of the pinned rounded function,
the exact forward and inverse relation is
$$
 f(Tx)-(c+\varepsilon)=
     \operatorname{morseRoundedFunction}(x)-c .
$$
Thus the local comparison carries the rounded sublevel, level and exterior
to the corresponding sides of the actual outgoing cut. The sign agrees
with the signed-height collar convention. The full unit transverse rims of
both native feet are in the map's domain. If $R_0$ is at least the native
attaching radius, both rim spheres land on the outgoing cut, with the
explicit inverse returning each point. A strict radius inequality places
them inside the open rounding core. [Pinned cap and attached
function](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Topology/Morse/Attachment/ModelCell.lean#L2728) ·
[Pinned rounded
function](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Topology/Morse/Attachment/ManifoldHandle.lean#L16355) ·
[Native outgoing collar](../../../../SmoothPoincare/Heights/OutgoingHandleCollar.lean)

## Remaining input for the global merging edge

The selected filtration gives an actual finite collection of native
sublevels and regular transports. Its one-handle step has an actual
attachment and a rounded trace diffeomorphism to the upper sublevel.
The companion incidence module identifies the two actual incoming
body classes and describes the fibers of their component map.
Distinct body classes imply disjoint incoming level components.
The local edge block uses the given one-handle independently of
its position in a global forest. The separate birth result gives
the chart of the entire component at its outgoing birth cut.
Transporting two such charts to a chosen merging edge requires the
intervening component and attachment comparisons. [Selected end
presentation](../../../../SmoothPoincare/Heights/SelectedEndHandlePresentation.lean) ·
[Actual edge incidence](../../../../SmoothPoincare/Heights/NativeEdgeIncidence.lean) ·
[Marked tree-edge model](../../../../SmoothPoincare/Heights/MarkedEndTree.lean)

The pinned internal attachment engine builds a comparison through a
rounded-function sublevel with explicit rounding parameters. The public
existence wrapper and `IsolatedEndHandle` retain a diffeomorphism, the
smooth lower and handle maps and deep-lower identities. Reusing the
particular witness through its rounded-function factorization requires
retaining that factorization or reconstructing it from the engine. The
local radial comparison above uses the same source chart and the pinned
rounded function. A global comparison needs the marked maps on the two
complementary bodies, agreement of their full collar germs with the chosen
rim map on overlaps, and the transition to the supplied outgoing marking.
Each residual framed tube then needs its complete domain in the compared
boundary and the corresponding marked comparison. These data are inputs
to extending the local result to a smooth merged four-ball and iterating
the tree reduction. [Pinned attachment
engine](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Topology/Morse/Attachment/SublevelTransport.lean#L656) ·
[Public attachment
wrapper](https://github.com/qinz1yang/differential-geometry/blob/788efe97894474c032de6dfb1289d515f613d15a/DifferentialGeometry/Topology/Morse/Attachment/SublevelTransport.lean#L1033) ·
[Scientific marked end reductions](../../../../../papers/investigations-1/04_hypersurface_immersions/02_two_handle_recognition/manuscript/recognition_from_marked_morse_heights.tex)

## Checks

The module uses Lean `4.35.0-rc3` at
`470d5ce1400764999581fd26d5d72b00d990b0f4`, Lake
`5.0.0-src+470d5ce`, Mathlib
`c55e6e786f49471c72fbddbec5415808896aec1e`, and DifferentialGeometry
`788efe97894474c032de6dfb1289d515f613d15a`. The manifest SHA-256 is
`839111aae86b693524cd57db5ce7f2e8edc972dad49296468eb18d6735e52239`.
The TeX source SHA-256 starts `9681e2deb71434b7`.

The direct module check passed without diagnostics using
`lake env lean SmoothPoincare/Heights/RoundedEdgeBlock.lean`.
The targeted Lake build completed in 10,114 jobs. The importing replay
queried every public declaration with the kernel axiom command. Each
contains only propext, Classical.choice and Quot.sound. The module SHA-256
is 7cc970f8b148930ff6e08f92dfe77d138aae922b0bd46b2a08d82d2e761f3238.
