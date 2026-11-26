# Independent check of successive zero-winding cuts

26 November 2026. For Edward B. Baker III with OpenAI Codex assistance.
SP4-CDS-SUR-E02g, [issue 1](../research-progress/handoffs/ZERO_WINDING_TOWER_20261126.md).
Packet routing was GPT-6.2 Sol/ultra. The actual serving model and reasoning
effort were unavailable. Repository baseline
`e2968b2898b5aab00b307f6b6580454d0f325bb4`, tower issue SHA-256
`778df28edfafc37f67547c76d80fc6e66ec359c83917cb68fc00f5ab549d7ed3` and
[single-knot input](../research-progress/handoffs/LAST_HANDLE_ANY_RANK_20261126.md)
SHA-256 `bdfa07581c289fff1010e948d2ce53dd7806017583254d21dbc35cef46367d9b`.
This readback takes the rank-general single-knot lemma as a dependency and
checks the assembly and return surgery on the smooth oriented source.

## Actual pieces of the mixed presentation

Write $H_r=\natural_r(S^1\times D^3)$, $T_r=\natural_r(S^2\times D^2)$,
and $Y_r=\#_r(S^1\times S^2)$, with $H_0=T_0=D^4$ and $Y_0=S^3$.
Fix one reduced $(1,1,m,m-1,1)$ presentation, $m\ge2$, with tubes ordered
$b_1,\ldots,b_{m-1},a$ after genuine framed slides normalize the winding
row to $(0,\ldots,0,1)$. Let $P_j$ include the lower $H_1$ and the first
$j$ zero-winding attachments. The hypothesis is PSC domination of each
actual $\partial P_j$, $1\le j\le m-1$, in this one ordered trace.

The full ordinary surgery matrix, after converting the dot to zero and
placing $a$ second in the matrix, has leading block
$A=\left(\begin{smallmatrix}0&1\\1&d\end{smallmatrix}\right)$,
off-block with first row zero, and zero-winding block $C$. Since the full
outgoing boundary is $Y_{m-1}$, the full matrix of size $m+1$ has rank two.
The bottom-right entry of $A^{-1}$ is zero, so its Schur complement is
$C$ and $C=0$. Each ordinary zero prefix includes the converted dot and
has zero matrix of size $j+1$. The comparison filling has trivial
$\pi_1$, zero intersection form, and $H_2\cong\mathbb Z^{j+1}$. The pair
sequence identifies $H_2$ of the boundary with $H_2$ of the filling. The
degree hypothesis gives a connected sum of spherical space forms and
exactly $j+1$ copies of $S^1\times S^2$. Torsion-free first homology
makes the spherical residual an integral homology sphere. Compress along
the $j+1$ factor spheres, which represent a basis, to give a contractible
smooth comparison filling of the spherical residual. The latter must be
$S^3$. Thus $\partial P_j\cong Y_{j+1}$. No comparison filling is used
as a piece of the closed assembly. [Zero-matrix compression and its primary
inputs](../02_handle_isolation_and_marked_surgery/notes/POSITIVE_SCALAR_INTERMEDIATE_CUTS.md)

Each actual attachment $b_j$ now goes from $Y_j$ to $Y_{j+1}$. The
single-knot input gives an ambient isotopy of the incoming boundary
that carries its tube to a disk-framed unknot in a ball. Extend the
isotopy over the inward collar by tapering its time from one to zero,
and extend the trace comparison by identity in the handle coordinates.
Adding the local handle produces a boundary sum with $T_1$. The
outgoing comparison maps each future tube by its restriction to the
survivor exterior, so assignments of parametrizations and the final
closure are composed with this actual comparison, including its inverse.
Inductively the whole physical lower piece $P=P_{m-1}$ is identified
with $P_{\rm mod}=H_1\natural T_{m-1}$. This argument concerns the
successive framed attachments in their changing incoming boundaries.

To identify the other complete side, write $\gamma$ for the original
gluing of the full outgoing level to $\partial H_{m-1}$ from the top,
$o_a:D^2\times S^1\to Y_{m-1}$ for the actual outgoing tube of $a$, and
$\tau(z,w)=(w,z)$ from $S^1\times D^2$ to the outgoing model. The
dual tube in the upper body is $\gamma o_a\tau$, with inverse on its
image $\tau^{-1}o_a^{-1}\gamma^{-1}$. Its surgery goes from $Y_{m-1}$
to the actual $Y_m=\partial P$. The same single-knot input, applied in
that direction, identifies the complete upper piece $Q$ with
$Q_{\rm mod}=H_{m-1}\natural T_1$. The extension through the collar
and through the dual handle is as above. In particular, this upper
identification follows from the last zero-prefix hypothesis alone.

## Marked surgery and return

Write $f:\partial P\to\partial Q$ for the actual orientation-reversing
gluing, and choose oriented piece identifications $i_-,i_+$ with the
indicated models. In the $T_1$ summand of the upper model, remove
$S^2\times\operatorname{int}D^2_\epsilon$ about $S^2\times\{0\}$ and
replace it by $D^3\times S^1$, using the product identification on
$S^2\times S^1$. Choose the boundary connected-sum disk away from the
surgery. The remaining annulus in $T_1$ is a product boundary collar
after the insertion. The surgered upper piece $\widetilde Q$ has an
identification $\widetilde i_+:\widetilde Q\to H_m$ with the inherited
outer boundary marking. The old gluing in the new coordinates is
$g=(\partial\widetilde i_+)f(\partial i_-)^{-1}$. If $g_0$ is the
reference gluing matching the boundary connected summands, then
$g_0g^{-1}$ is an orientation-preserving diffeomorphism of $\partial H_m$.
It extends over $H_m$ by the boundary-extension conclusion in the proof
of Laudenbach–Poénaru Theorem A. Use this extension on the surgered
upper piece and the identity on the lower model to reach the reference
gluing. The inverse uses the inverse extension. Neither extension is
being asserted over the original $Q$.
[Laudenbach–Poénaru, proof of Theorem A, pp. 341–342](https://www.numdam.org/item/10.24033/bsmf.1741.pdf#page=6)

With $g_0$, matching the connecting boundary disks turns the separate
gluings into their ordinary connected sum. The two $H_1$ summands
glue as the product double $S^1\times S^3$. Each $T_1$ closes with
an $H_1$ as the two faces of $\partial(D^2\times D^3)$. All
these latter summands are $S^4$. The surgered closed source $N$ is
therefore diffeomorphic to $S^1\times S^3$, with the actual inverse
surgery curve $\kappa$ transported by the diffeomorphism just specified.

In $N$, removing the core circle $\kappa$ and then restricting to the
exterior of its tubular neighborhood preserves fundamental group.
Paths, loops, and homotopies of loops can avoid a circle in dimension
four by relative transversality, and the punctured tube retracts to its
boundary. In van Kampen, replacement by $S^2\times D^2$ kills the class
of the boundary circle, which is $[\kappa]$ in the fundamental group of
the exterior. The replacement is the inverse of the actual surgery and
recovers $M$. Thus $1=\pi_1(M)=\mathbb Z/\langle[\kappa]\rangle$ and
$[\kappa]=\pm1$. Orient the core to give a free homotopy to a factor
circle. Relative parametric transversality makes that homotopy an
isotopy. Vanishing derivative in the circle direction has codimension
four in the two-dimensional domain. Equal-time double points off the
diagonal have codimension four in the three-dimensional pair-and-time
domain. Extend the resulting isotopy to the ambient manifold and use
tubular-neighborhood uniqueness to identify the exterior with
$S^1\times D^3$. Laudenbach–Poénaru Theorem A at rank one applies to the
actual boundary identification with $S^2\times D^2$, so either framing
returns $S^4$. Equivalently, a loop of normal frame rotations acts by
$(z,v)\mapsto(z,A(z)v)$ and extends over the product exterior. The
argument gives a diffeomorphism of the original smooth type.
[Laudenbach–Poénaru, Theorem A, p. 337](https://www.numdam.org/item/10.24033/bsmf.1741.pdf#page=2)
· [The corresponding rank-two calculation](../../04_hypersurface_immersions/02_two_handle_recognition/manuscript/recognition_from_marked_morse_heights.tex)

## The one-sided case and three-middle scope

For a one-sided $m$-component link with upper body $H_m$, the full linking
matrix is zero since its integral cokernel is $\mathbb Z^m$. With PSC
domination of successive actual prefix boundaries, the same comparison
and compression give $Y_0\to Y_1\to\cdots\to Y_m$. Apply the single-knot
input in each incoming boundary, using Gabai's Property R at $Y_0=S^3$.
The successive relative trace identifications give $T_m$, and Theorem A
closes it with the original upper $H_m$ and its induced boundary map.
The final output $Y_m$ is supplied by the upper body. A witness on that
final level is automatic and cannot by itself justify the trace
identifications through the preceding cuts.

For three middle handles on the mixed side, the two required witnesses
are $Y_b\cong Y_2$ and $Y_{bc}\cong Y_3$ in the same ordered trace.
In the stabilized $n=1$ Isoshima example, retain the zero-framed meridian
$b$ and put the stabilizing disk-framed unknot $c$ in a disjoint small
ball in the exterior of both original tubes. The $b$ surgery is local in
its ball and leaves $c$ alone. The two cuts are thereby the indicated
$Y_2$ and $Y_3$, which supply their own degree-one PSC witnesses. The
$a$-first embedding still bounds the original Mazur half, so its
nontrivial homology-sphere boundary has no PSC degree witness. This is
the physical handle trace obtained by the split stabilization. The
stabilizing summand and its matching upper handle can be cancelled
locally, giving an actual $3\to2$ decrease back to the marked Mazur
double. The witnesses here are intrinsic metrics on the cut
three-manifolds. [Marked stabilized control and actual upper closure](../02_handle_isolation_and_marked_surgery/notes/THREE_PREFIX.md#a-rank-one-witness-with-a-failed-first-cut)

For $m>2$ a witness only on the last zero prefix identifies the upper
trace, while the preceding marked lower trace identifications remain
unproved. The argument with all witnesses directly recognizes the
closed type. It gives a smaller presentation by pulling back the
standard Morse presentation once recognition is established. It does
not identify a geometric cancellation of an original pair on a
general tower, or select the witnesses for a general mixed or one-sided
presentation. No metrics are transported between levels or onto a
minimizing source by this readback.
