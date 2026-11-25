# SP4-FORM-HT-E04a · The Morse middle-index floor

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded E audit, revision 1. Actual serving model and reasoning
effort were unavailable. [Master proof](../../../../papers/master/manuscript/immersion_entry.tex) · [Marked topology companion](../../../../papers/investigations-1/04_hypersurface_immersions/02_two_handle_recognition/manuscript/recognition_from_marked_morse_heights.tex)

## The same smooth manifold and its marked end bodies

Let $M$ be a closed connected oriented smooth homotopy four-sphere, and
let $h:M\to\mathbb R$ be smooth with all critical points nondegenerate.
Write $n_i$ for its critical point counts. On a compact source this is a
finite list. Coincident critical values are allowed. Separate them, when
needed, by disjoint bumps constant near each critical point. The derivative
of $h$ has positive minimum norm on the compact supports of the bump
derivatives, so small amplitudes preserve the critical set and its
Hessians. Milnor's rearrangement and self-indexing results yield an ordered
auxiliary Morse presentation on the same $M$ with the same indices.
Regular collars and the one-critical-point attachment theorem give framed
attaching tubes with an outgoing boundary marking. The chosen cuts belong
to that presentation. An identification with a specified physical level
of the unmodified $h$ requires an additional comparison.
[Milnor, *Lectures on the h-Cobordism Theorem*, Theorems 4.7–4.8](https://www.math.auckland.ac.nz/~hekmati/Books/Milnor2.pdf)
· [Milnor, *Morse Theory*, Theorems 3.1–3.2](https://pagine.dm.unipi.it/~a019210/Milnor_Morse%20theory.pdf)

The lower 0–1 body $P$ is connected because every later attaching
sphere is connected and $M$ is connected. Reversal gives the same result
for the upper dual 0–1 body $Q$. In each incidence graph, select a
spanning tree with 0-handles as vertices and 1-handles as edges.
Attach the tree edges first. At a leaf, the attaching sphere $S^0$ of that
edge meets the belt $S^3$ of the leaf ball in exactly one transverse point.
This is the geometric cancellation pair in the common three-dimensional
level, with the other feet carried by the composition of collared body
diffeomorphisms. Equivalently, after rounding, the union of the leaf
ball, its adjacent handle and the other ball is a single ball. The non-tree
feet remain disjoint disks on the new boundary, giving the oriented
1-handlebodies $P'\cong\natural_\ell(S^1\times D^3)$ and
$Q'\cong\natural_r(S^1\times D^3)$, where
$\ell=n_1-n_0+1$ and $r=n_3-n_4+1$. The rank-zero body is $D^4$.
The count vector is $(1,\ell,n_2,r,1)$. Thus $\chi(M)=2$ gives
$n_2=\ell+r$.
[Milnor, *Lectures*, Theorem 5.4](https://www.math.auckland.ac.nz/~hekmati/Books/Milnor2.pdf)

Let $C$ be the middle cobordism, $p:\partial P\to\partial_-C$ and
$q:\partial Q\to\partial_+C$ the actual boundary identifications, and
$\alpha:P'\to P,\ \beta:Q'\to Q$ the end-body diffeomorphisms. An incoming
tube $a_j:S^1\times D^2\to\partial_-C$ becomes
$(\partial\alpha)^{-1}p^{-1}a_j$. The reversed tubes pull back under
$(\partial\beta)^{-1}q^{-1}$, with the forward belt circle and normal
disk becoming the dual attaching data. If $X$ is the body with the
transported middle handles attached and $\eta:\partial X\to\partial_+C$
is the outgoing marking, the gluing to $Q'$ is
$\varphi=(\partial\beta)^{-1}q^{-1}\eta$. It reverses the induced
outward-boundary orientations. The assembly represents the original
oriented $M$ via $\alpha,\operatorname{id}_C,\beta$ in compatible
collars. If a trace diffeomorphism $s:X_{\rm new}\to X$ changes lower
coordinates, the outgoing marking becomes $\varphi\partial s$.
[Companion, Lemma lem:trees](../../../../papers/investigations-1/04_hypersurface_immersions/02_two_handle_recognition/manuscript/recognition_from_marked_morse_heights.tex)

## The two recognized cases

- **Zero middle handles.** Here $\ell=r=0$ and the product middle
  band leaves a marked double of four-balls. Hatcher's p. 553 recalls
  Cerf's components result for $\operatorname{Diff}(S^3)$ and $O(4)$.
  The actual boundary diffeomorphism is isotopic to an orthogonal
  restriction in its orientation component. Extend the isotopy through a
  collar and extend the orthogonal map linearly over the disk. The marked
  double is diffeomorphic to the standard $S^4$.
  [Hatcher, *Annals of Mathematics* 117 (1983), p. 553](https://pi.math.cornell.edu/~hatcher/Papers/SmaleConjecture.pdf)
- **One middle handle.** Reverse the auxiliary presentation, if needed, to
  obtain $(1,0,1,1,1)$. The cut after the sole middle handle has lower
  body the trace of the actual framed knot $K\subset S^3=\partial D^4$.
  The upper dual body is $S^1\times D^3$, the orientable disk
  neighborhood of its circle core, so the actual common boundary is
  diffeomorphic to $S^1\times S^2$. If the knot framing integer is $k$
  relative to the preferred longitude, the filling slope $k\mu+\lambda$
  kills $k$ times the meridian generator of exterior $H_1$.
  Consequently the filled $H_1\cong\mathbb Z$ forces $k=0$.
  The $S^2$ factor is a genus-zero oriented nonseparating surface in the
  zero surgery. Gabai's Corollary 8.3 equates the minimum such genus to
  the knot genus, giving the unknot as in Remark 8.5. The zero-framed
  trace is the trivial oriented disk bundle $S^2\times D^2$, using the
  spanning disk and handle core with product framing. Laudenbach–Poénaru
  Theorem A, at $p=1$, applies to every smooth identification of the two
  boundaries. The transported actual marking $\varphi$ therefore gives
  the standard $S^4$. Reflection of the standard sphere corrects the
  orientation of the output diffeomorphism if needed.
  [Gabai, *J. Differential Geom.* 26 (1987), Corollary 8.3 and Remark 8.5, pp. 525–526](https://doi.org/10.4310/jdg/1214441488)
  · [Reproduction checked](https://www.scribd.com/document/1026013102/2-Gabai)
  · [Laudenbach–Poénaru, *Bull. Soc. Math. France* 100 (1972), Theorem A, p. 337](https://www.numdam.org/item/10.24033/bsmf.1741.pdf)

Thus a nonstandard candidate has $n_2(h)\geq2$ for every Morse function.
The argument uses the original count of critical points through index
preservation. At $n_2=2$, the odd ranks can be $(0,2),(1,1),(2,0)$.
Any mixed cancellation claim would require the actual framed diagram on
the chosen intermediate three-manifold and a single transverse
attaching-circle/belt-sphere intersection after allowed moves. The
Euler identity yields the ranks and leaves that geometric premise open.
[Companion, marked middle-handle tests](../../../../papers/investigations-1/04_hypersurface_immersions/02_two_handle_recognition/manuscript/recognition_from_marked_morse_heights.tex)

## Pinned Lean scope

The pinned DG library exposes `exists_selfIndexing` in
`Topology/Morse/Rearrangement/SelfIndexing.lean` and
`exists_distinct_selfIndexing` in its companion. They take a
`MorseStrip` and preserve critical point/index data within the strip.
`exists_cancel_index_zero_step` in `Topology/Morse/Handle/LowHandles.lean`
takes a connected self-indexing strip with an occupied lower regular level.
`isCancellingPair` in `Topology/Morse/Cancellation/CancellingPair.lean`
has explicit geometric crossing data. `exists_contMDiff_isClosedEmbedding_attachingRegion`
in `Topology/Morse/Attachment/SmoothHandle.lean` gives the smooth attaching
region in a single-critical-point band. These are candidate ingredients
for a marked decomposition. The bounded source audit found no assembled
closed four-manifold reduction retaining both framed end markings, or
pinned declarations for the needed Cerf boundary extension, Gabai's
Property R or Laudenbach–Poénaru's four-dimensional gluing theorem.
The floor is an external mathematical consequence in this packet. A Lean
application of the full floor still requires those smooth inputs.

The Sard statement `ImmersionGaussNormal.ae_invertible_mfderiv_on_two_normal_fibers`
gives invertibility of the actual signed unit-normal differential at each
point over $u$ or $-u$, on a conull set for the scaled round volume.
At a height critical point, its ambient direction and the supplied unit
normal each lie in the same one-dimensional normal line. In the signed
Weingarten formula invertibility forces all four principal curvatures to
be nonzero. The height Hessian is diagonal in a principal frame with
entries either all $k_i$ or all $-k_i$. Each such critical point is
nondegenerate. The Lean declaration `orientedHeight_ae_nondegenerate`
applies this to the globally constructed normal and pointwise principal
frames. It supplies smoothness and the Morse condition under normalized
`gaussRoundArea`, with critical values permitted to coincide. On a compact source the full
regular fibers are finite by the local inverse theorem and compactness.
The topological floor concerns the resulting finite index-two count
on the same immersion and requires the separate topology argument above.
[Morse height Lean module](../../../SmoothPoincare/Heights/RegularMorseHeights.lean)
· [Both-sign Sard receipt](../research-progress/handoffs/ED03_MANIFOLD_GAUSS_SARD.md)

## Inputs

Workspace base `2fba0882dbf8766c95094ef4d1207190b0c24bc2`. The master
immersion and topology companion TeX had SHA-256 prefixes
`f7a9522959429fdb` and `9681e2deb71434b7`. The check used Mathlib
`c55e6e786f49471c72fbddbec5415808896aec1e`, DifferentialGeometry
`788efe97894474c032de6dfb1289d515f613d15a` and Lean `4.35.0-rc3`.
