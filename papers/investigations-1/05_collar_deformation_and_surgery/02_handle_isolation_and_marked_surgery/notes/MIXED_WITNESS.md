# A physical positive-scalar-curvature band in the marked Mazur double

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
SP4-CDS-SUR-E02c, [issue 1](../../research-progress/handoffs/PREFIX_AND_INTERIOR_20261126.md),
dispatched on the GPT-6.2 Sol/ultra route. Actual serving model and reasoning
effort were unavailable. Repository baseline `e2968b2898b5aab00b307f6b6580454d0f325bb4`.
The [pinned comparison](POSITIVE_SCALAR_INTERMEDIATE_CUTS.md) has SHA-256
`16590e9d992a487026ab37d47004c129ba3f970a4485d5a3b67ed598bbf81af6`.
The input is one smooth oriented closed double with a specified two-middle
handle presentation. The new result constructs a smooth Riemannian metric on
that marked double. The earlier comparison identifies the abstract cut types.

## The two orders on the double

Fix Figure 37 of Isoshima with $n=1$. Use the dotted unknot $U$, the long
attaching circle $a$, and its small zero-framed meridian $b$. Orient $a$ so
that the lower incidence row is $(1,0)$. The meridian is in a ball disjoint
from $U$. The diagram has the displayed lower $0/1$-body and the omitted
upper $3/4$-closure. Its closed type is known to be the standard sphere.
Keep the two framed tubes fixed in their common lower level, and realize
each order by attaching the corresponding tube first. The cut in each
case is the smooth boundary of that actual lower sublevel. [Isoshima,
arXiv:2403.17356v2, Figure 37, p. 35](https://arxiv.org/pdf/2403.17356v2#page=35)
· [Theorem 3.3, p. 10](https://arxiv.org/pdf/2403.17356v2#page=10)
· [Source record for the marked diagram](../../../../../references/SOURCE_NOTES_MASTER_ENDPOINT_20261125.md)

* **$a$ first.** The cut $Y_a$ is $\partial W^-(0,3)=\Sigma(2,5,7)$ up to
  orientation. It is a nonsimply connected integral homology sphere bounding
  the smooth contractible Mazur piece. A nonzero-degree map from a closed
  oriented PSC three-manifold would force $Y_a$ to be a connected sum of
  spherical space forms and $S^1\times S^2$ factors. Such a sum admits PSC,
  and the homology sphere and smooth contractible filling hypotheses then
  force $Y_a\cong S^3$. Thus there is no degree witness in this order. From
  the upper end this same cut follows the dual $b^*$, with winding of
  absolute value one since the one-attachment surgery minor has determinant
  minus the square of the winding. The obstruction applies with either
  orientation. [Mazur boundary identification and exact passages](../../../../../references/SOURCE_NOTES_MASTER_ENDPOINT_20261125.md)
  · [Chodosh–Maximo–Mukherjee, arXiv:2407.05574v1, Proposition 2.2,
  Corollary 2.3 and Proposition 4.2](https://arxiv.org/pdf/2407.05574v1)
* **$b$ first.** The lower cut $Y_b$ is the result of surgery on the actual
  split meridian in a three-ball in $S^1\times S^2$. The ball may contain
  a strand of $a$. The meridian has the zero disk framing and bounds an
  unknotted disk when considering its surgery alone. Surgery replaces the
  ball by a punctured $S^1\times S^2$, giving
  $Y_b\cong \#_2(S^1\times S^2)$. The surviving $a$ tube is transported by
  the identity on the exterior of the removed tube of $b$, which is the
  common marked part of $\partial H_-^1$ and $Y_b$. It retains its disk
  parametrization. Read this same cut from the upper $0/1$-body after the
  single dual attachment $a^*$. The ordinary boundary matrix
  $\left(\begin{smallmatrix}0&u\\u&v\end{smallmatrix}\right)$ has integral
  cokernel $\mathbb Z^2$, so $u=v=0$. The framing and attachment of $a^*$
  here are the actual duals with coordinates from the common outgoing level.
  [Pinned boundary and gluing calculation](POSITIVE_SCALAR_INTERMEDIATE_CUTS.md)

Write $P,Q$ for the complete compact sides of $Y_b$, with $P$ read from the
lower end and $Q$ from the upper end. The lower split meridian gives a
diffeomorphism of $P$ with
\[
 V=(S^1\times D^3)\natural(S^2\times D^2),
\]
where $\natural$ denotes boundary connected sum. To identify $Q$, convert
its dotted unknot to zero in the ordinary surgery description of its
boundary. The resulting two-component surgery yields $\#_2(S^1\times S^2)$
and the first component is an unknot. The isotopy in the proof of
Gompf–Scharlemann–Thompson Proposition 3.2 puts the other knot in a ball in
the surgered $S^1\times S^2$ as an unknot. Use that isotopy in the actual
boundary of the upper one-handlebody and extend it through a collar. It
carries the framed tube of $a^*$. In the ball the surgery coefficient must
be zero, because the surgery adds a free rank-one homology summand. Thus
this upper trace is also diffeomorphic to $V$. The conversion of the dot
was the boundary calculation used to obtain the isotopy. The upper
four-dimensional diffeomorphism uses the isotopy in the original trace.
[Gompf–Scharlemann–Thompson, Proposition 3.2 and proof, pp. 2313–2314](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf#page=9)

Let $f:\partial P\to\partial Q$ be the actual gluing, reversing the
outward boundary orientations. For the resulting side identifications
$j_-:P\to V$ and $j_+:Q\to V$, the marking in model coordinates is
$(\partial j_+) f(\partial j_-)^{-1}$. Its inverse is
$(\partial j_-) f^{-1}(\partial j_+)^{-1}$. All constructions below use
$f$ itself. In particular no extension of $f$ over either copy of $V$
is required. This is the same cut read in the two directions, distinct
from interchanging the middle-handle order in the forward presentation.

## A collared metric on the actual closed trace

Give $V$ a PSC metric that is a product on an inward boundary collar. For
$m=2,3$, use $dr^2+\eta(r)^2g_{S^{m-1}}$ on $D^m$ with $\eta=\sin r$ near
the tip and $\eta'=\chi(r)\cos r$, where a smooth nonincreasing cutoff
$\chi$ equals one near the tip and vanishes before $r=\pi/2$. End the disk
where $\eta$ is constant. The radial sectional curvatures are
$-\eta''/\eta$, and the tangential ones when $m=3$ are
$(1-(\eta')^2)/\eta^2$. This gives nonnegative Gaussian curvature on
$D^2$ and strictly positive scalar curvature on $D^3$, with smooth tips
and product boundary collars. The products with a flat circle for
$S^1\times D^3$ and with the unit round $S^2$ for $S^2\times D^2$ both
have PSC. Their boundary connected sum attaches an index-one handle to
the two disconnected boundary components. The incoming surgery sphere
is $S^0$, of codimension three in the three-dimensional boundary. The
PSC trace theorem extends the incoming metrics as a product at both ends.
The theorem is used for this index-one connecting handle only.
[Walsh, arXiv:0811.1245v1, Definition 4.3 and Theorem 1.2, pp. 45–46](https://arxiv.org/pdf/0811.1245v1#page=45)

Pull these metrics back to the side pieces by $j_-$ and $j_+$ to obtain
$g_P,g_Q$. Write $h$ for the boundary metric induced on $Y_b=\partial P$ and $h_Q$ for
the metric induced on $\partial Q$. Both $h$ and $f^*h_Q$ are PSC metrics
on the same closed connected oriented three-manifold. Bamler–Kleiner's
Theorem 1.1 gives a continuous path between them in the $C^\infty$
topology. To obtain a smooth path $h_s$, choose finitely many short
segments whose linear interpolants lie in $C^2$-open sets of PSC metrics
around the continuous path. Parametrize each segment smoothly with
constant germs at its endpoints. This gives a smooth path constant near
$s=0,1$, with $\min_{Y_b\times[0,1]}R_{h_s}>0$.
[Bamler–Kleiner, arXiv:1909.08710v1, Theorem 1.1, pp. 1–2](https://arxiv.org/pdf/1909.08710v1#page=2)

Give the cylinder $C_D=Y_b\times[0,D]$ metric $g_D=dx^2+h_{x/D}$. For its slices
$K=(2D)^{-1}h_s'$ and $H=\operatorname{tr}_{h_s}K$. The scalar identity
$R_g=R_{h_s}-H^2-|K|^2-2\partial_xH$ bounds the error away from $R_{h_s}$
by a constant times $D^{-2}$ on the whole compact path. Choose one
sufficiently large finite $D$ and fix it. The cylinder is PSC and matches
both complete pieces through product germs, using the identity at the
lower end and $f$ at the upper end.

Insert before this transition a product $B_L=Y_b\times[-L/2,L/2]$ with
metric $dt^2+h$, for any fixed $L>0$. Absorb the inserted cylinders into
the original bicollar by a smooth increasing change of normal coordinate,
equal to translations on the matching ends when written in signed collar
coordinates. Send the old central hypersurface to $t=0$. More precisely,
keep the original angular coordinate $y$ from $\partial P$ throughout
the stretched collar and use $f(y)$ in the upper coordinates. The normal
change and its inverse can be chosen to agree with the product
identifications on neighborhoods of the outer faces, so the
reparametrization is the identity on the complementary pieces outside
these collars. If the normal change is $t=\psi_L(q)$ on the original
signed collar, its inverse uses $q=\psi_L^{-1}(t)$ and, on the upper
side, $y=f^{-1}(z)$ for upper angular coordinate $z$. Relative to inward
collar parameters the lower and upper normals have opposite signs. This
pullback defines a smooth PSC metric $g_L$ on the original closed double,
with the original $Y_b$ as the central product slice. Reversing the cut
uses $f^{-1}$ and the opposite signed normal coordinate. It interchanges
the two complete sides while recovering exactly the same closed assembly.

## Measured witness and both Weyl energies

Set $\rho=\min_{Y_b}R_h>0$. The coordinate $t$ on $B_L$ is 1-Lipschitz and
vertical segments realize length $L$. The actual intrinsic width is $L$,
and the minimum scalar curvature of the band is $\rho$. The two outward
mean curvatures are zero. The central slice is totally geodesic and
$\operatorname{Ric}_{g_L}(\partial_t,\partial_t)=0$ there. Its second
variation is $\int_{Y_b}|\nabla u|^2\,dV_h$ for every smooth normal
variation $u$. The slice is two-sided and stable. Its projection has
degree one with the induced orientation, and its identity map as a PSC
three-manifold supplies the degree witness directly. In the slice test
the lapse is one and $K=H=0$ identically in $B_L$. The particular choice
$L=\pi\sqrt{3/\rho}$ attains the width test threshold. The finite-end
left side is $\sqrt{\rho/3}\,L>0$ for every $L>0$. Both quantities are
computed on the actual compact product band. At the $a$-first cut the
obstruction continues to apply for this same closed metric. Every marked
band over $Y_a$ satisfies $\rho_a d_a^2<3\pi^2$ for its own positive
scalar minimum and intrinsic width, and no stable separator can have nonzero
projection degree in a PSC band about that cut. [Räde,
arXiv:2104.10120v4, Corollary 2.25, p. 6](https://arxiv.org/pdf/2104.10120v4#page=6)
· [Marked slice and separator criteria](POSITIVE_SCALAR_INTERMEDIATE_CUTS.md)

Use the Hilbert–Schmidt norm of each Weyl operator on real two-forms, as
in the investigation. At a point of $h$ choose an orthonormal Ricci
eigenframe with eigenvalues $r_i$ and write $R=\sum_i r_i$. The product
curvature operator is zero on $dt\wedge e_i$ and is diagonal on the
tangential two-forms $e_j\wedge e_k$, with complementary sectional
curvatures $R/2-r_i$. In the self-dual and anti-self-dual bases formed
from these pairs by sums and differences divided by $\sqrt{2}$, both
diagonal curvature blocks have eigenvalues $(R/2-r_i)/2$. Subtracting
$R/12$ gives eigenvalues $-(r_i-R/3)/2$ for each chiral Weyl operator.
Consequently
\[
 E_+(g_L;B_L)=E_-(g_L;B_L)
 =\frac L4\int_{Y_b}|\operatorname{Ric}_h-\tfrac13R_hh|_h^2\,dV_h.
\]
For fixed $h$ the integral is strictly positive. Its vanishing would
make $h$ Einstein and hence of constant positive sectional curvature
in dimension three, incompatible with $\pi_1(Y_b)$ free of rank two.
Write $J=\int_{Y_b}|\operatorname{Ric}_h-\tfrac13R_h h|_h^2\,dV_h$.
The reparametrization identifies the complete sides of the central slice
with the fixed pieces and the indicated parts of the cylinders. Thus for
each $\sigma\in\{+,-\}$ the full side energies are
\[
 \begin{aligned}
 E_\sigma(g_L;P)&=E_\sigma(g_P;P)+LJ/8,\\
 E_\sigma(g_L;Q)&=E_\sigma(g_Q;Q)+E_\sigma(g_D;C_D)+LJ/8.
 \end{aligned}
\]
The total energy of each chirality grows linearly and exceeds the
subcritical wall $8\pi^2$ for all sufficiently large $L$. Global PSC puts
each metric in a positive Yamabe class. This construction provides no
upper energy bound at the width threshold and no strict energy comparison
on a minimizing source. [Energy normalization and subcritical wall](../../research-overview/OVERVIEW.md)

The new witness is a matched closed metric with a measured band on the
specified meridian-first handle level. The two handle orders specify
topological Morse levels on the same smooth closed source. Relating
either embedding to a level selected by an immersion or to the charged
disk of a minimizing sequence would require a supplied marked comparison
and measurements in that metric. The band construction also supplies
no decrease of the displayed middle-handle count.
