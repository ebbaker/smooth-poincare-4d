# SP4-FORM-HT-E04d · The standard one-pair product model

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded execution packet with fixed product coordinates,
smoothness checks and an explicit collar. Actual serving model and
reasoning effort were unavailable.
[Lean module](../../../../SmoothPoincare/Heights/StandardSurgeryModel.lean)
· [Route register](../REGISTER.md)
· [Marked Morse heights, Proposition `prop:one`](../../../../../papers/investigations-1/04_hypersurface_immersions/02_two_handle_recognition/manuscript/recognition_from_marked_morse_heights.tex)

## Model and attaching face

Write $E_k=\mathbb R^{k+1}$, with unit disk $D^{k+1}$ and boundary unit
sphere $S^k$. The split round unit sphere in $E_m\oplus E_n$ has
dimension $m+n+1$. Its two closed regions are determined by
$\|x\|^2\le 1/2$ and $\|y\|^2\le 1/2$. With $c=\sqrt{1/2}$, the
maps from $D^{m+1}\times S^n$ and $S^m\times D^{n+1}$ are
$$
(a,v)\longmapsto(ca,\sqrt{1-c^2\|a\|^2}\,v),\qquad
(u,b)\longmapsto(\sqrt{1-c^2\|b\|^2}\,u,cb).
$$
Each inverse divides the small block by $c$ and takes the unit
direction of the other block. The other block has squared norm at least
$1/2$. The two regions cover the sphere and meet where both squared
norms are $1/2$. On the common face the maps send $(u,v)$ to $(cu,cv)$
in the same factor order. This gives the untwisted identification of
the boundary factors.

The open seam chart retains both sphere directions and uses the signed
variable $t=\|x\|^2-1/2$. Its forward map on $|t|<1/2$ is
$$
(u,v,t)\longmapsto
\bigl(\sqrt{1/2+t}\,u,\sqrt{1/2-t}\,v\bigr).
$$
Both square roots have positive arguments. The inverse uses the
normalized block projections and $t$, and both directions are smooth.
The left piece has $t\le0$ and the right piece has $t\ge0$. The zero
section is the shared attaching face.

At $(m,n)=(1,2)$ the pieces are the $D^2\times S^2$ trace model and
the $S^1\times D^3$ handlebody model in a round $S^4$. At $(m,n)=(1,1)$
the same coordinates give two solid tori in a round $S^3$. The right
core is the coordinate circle at $y=0$. In the left exterior a loop
in the first face factor bounds a disk with the second coordinate
direction held fixed. This is the slope used for the preferred
longitude of this model by the zero-framed filling.

## Scope of the one-handle reduction

The Lean output gives the canonical product pieces, the explicit face
identification, and a smooth two-sided chart in the round sphere. The
original Morse function still needs a marked reduction to a single knot
trace. The homology computation fixes the integer framing. Property R
identifies an arbitrary knot in $S^3$ with zero surgery
$S^1\times S^2$ as the unknot. A framed diffeomorphism must then compare
the actual zero trace to the product trace. The canonical chart treats
the displayed identification. Laudenbach–Poénaru's Theorem A, with
$p=1$, applies to the actual boundary diffeomorphism of the reduced
four-dimensional pieces. These inputs remain separate from the checked
coordinates. The module uses the ordinary smooth structure of a real
Euclidean unit sphere and gives unoriented recognition data. Boundary orientations belong to the marked handle decomposition.
[Gabai, Corollary 8.3 and Remark 8.5](https://doi.org/10.4310/jdg/1214441488)
· [Laudenbach–Poénaru, Theorem A](https://www.numdam.org/item/10.24033/bsmf.1741.pdf)
· [Height-floor audit](../../reviews/ED03_HEIGHT_FLOOR_AUDIT.md)

## Input versions

Request anchor `b5ce9f481a76`. Execution workspace base
`bfdf0660e4f7d574cf507333af8e5e6781fa7915` plus working changes.
The marked-height manuscript SHA-256 prefix is `9681e2deb71434b7`.
The frozen Lean source SHA-256 prefix is `596468a673966d46`.
The manifest prefix is `839111aae86b6935`, with Mathlib
`c55e6e786f49471c72fbddbec5415808896aec1e` and DifferentialGeometry
`788efe97894474c032de6dfb1289d515f613d15a`. The pinned toolchain is
Lean `4.35.0-rc3` and Lake `5.0.0-src+470d5ce`.

## Verification

The targeted build command was
`lake build +SmoothPoincare.Heights.StandardSurgeryModel`. It passed with
one unused-tactic linter warning on a proof-local `change` in the forward
seam chart. A separate `lake env lean` import checked the $(1,2)$
specializations of `leftCoordinates`, `rightCoordinates`, `seamChart`,
`seamChart_sides` and `seamChart_at_zero`, and the $(1,1)$
specializations of `leftCoordinates` and `seamChart`.

The imported axiom reports for these declarations, the cover and
intersection equalities, the two up-to-boundary smoothness proofs, and
`pieces_agree_on_face` contained only `propext`, `Classical.choice`
and `Quot.sound`.
