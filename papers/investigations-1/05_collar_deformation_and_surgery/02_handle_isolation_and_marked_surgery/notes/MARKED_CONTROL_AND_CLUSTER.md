# Marked control traces and the mixed lower cluster

26 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance.
Bounded SUR-E01/E02a under [activation revision 1](../../research-progress/handoffs/ACTIVATION_20261126.md),
at input commit `c8fb08dcf2e39ae68d4c9d9ebd6a69893ce9cce4`, with the
[versioned working sources](../../references/README.md#working-inputs).
Dispatch records GPT-6.2 Sol/ultra for this E packet. Independent serving metadata is unavailable. The calculation is smooth oriented
four-dimensional topology on a marked control and a conditional mixed
family, with a smooth collar marking for the control.

## Surgery coordinates and direction of the markings

Let $P$ and $Q$ be the lower 0/1 body and the upper dual 0/1 body of
the mixed presentation. Work in the lower coordinates $Y_0=\partial P$.
Write $a_i:S^1\times D^2\hookrightarrow Y_0$ for the mutually disjoint
full framed embeddings. The maps from the lower model and its comparison
are $p:\partial P\to\partial_-N$ and $p^{-1}$, where $N$ denotes the
actual middle cobordism. Thus an incoming tube recorded in $N$ as
$\tilde a_i$ has coordinates $a_i=p^{-1}\tilde a_i$. In the model
$p=\mathrm{id}$. Orient regular levels by the lower sublevel. The closing
map $\gamma:Y_{12}\to\partial Q$, with both body boundaries oriented
outward, reverses boundary orientation.

Here are the maps used for either surgery order. For $I\subset\{1,2\}$,
replace the selected tubes by the outgoing faces
$b_i:D^2\times S^1\hookrightarrow Y_I$. In the complement of their
interiors take the identity in the collared exterior. The gluing and
inverse at the torus are
$$
 b_i(z,w)\longleftrightarrow a_i(z,w),\qquad |z|=|w|=1.
$$
The remaining incoming tubes are the original parametrizations read in
that exterior. Equivalently use product flow on the exterior collars
to the selected level, with reverse flow for the inverse. Denote the
boundary identification of $Y_I$ with the resulting cross-section by
$m_I$. On the exterior, $m_I$ is the collar transport from $p$, and
on inserted tori it is the outgoing handle coordinate. The inverse is
reverse collar transport followed by $p^{-1}$, or the inverse outgoing
coordinate. All product seams below use compatible collars and rounding.
The identification between the two full-order outputs is identity on the
common exterior and the inserted coordinate factors, with inverse given
by the same recipe. This follows by doing both replacements in disjoint
regions, with separate collar lengths if the critical values are distinct.

Read from the upper body, the dual framed attachment of a forward
2-handle present at the top is
$$
 a_i^*(w,z)=\gamma b_i(z,w),\qquad
 (a_i^*)^{-1}(y)=\mathrm{swap}\, b_i^{-1}\gamma^{-1}(y)
$$
on its image, where `swap` sends $(z,w)$ to $(w,z)$.
The dual handle reverses the replacement and takes the inverse
collar identification. In upper coordinates at a subsequent level,
use the transported $\gamma$. Following both reverse replacements,
the closing map in the lower coordinates is $p^{-1}$ from the actual
bottom cross-section. This tracks the whole normal disk factor in both
directions. The product attaching and belt framings agree with
[the quadratic handle calculation, Proposition `prop:trace`](../../../04_hypersurface_immersions/01_immersed_handle_constructions/manuscript/marked_immersed_handle_constructions.tex)
and the boundary conventions of
[marked height recognition, Lemma `lem:trees`](../../../04_hypersurface_immersions/02_two_handle_recognition/manuscript/recognition_from_marked_morse_heights.tex).

## Lower and upper cancellations in the split control

Put $P=S^1_z\times (D^2_w\times[0,1])$ with rounded corners.
Its belt sphere is $B=\{1\}\times\partial(D^2_w\times[0,1])$.
Take the first incoming tube to be $a_K(z,w)=(z,w,1)$ in the flat
top face. Its core $K$ represents the positive generator of
$H_1(Y_0)$, crosses $B$ once transversely, and has the product
framing of the zero-framed meridian in the control dotted diagram.
Place the split zero-framed spectator $S$ in a small ball in the
untouched boundary away from $a_K$ and $B$, with its spanning disk
there. Its framed tube includes the product push-off along that disk.

The lower body $W_K=P\cup h_K$ is a ball with the explicit map
$$
 G_K:W_K\longrightarrow D^2_{2}\times D^2_w,\quad
 (z,w,t)\longmapsto((2-t)z,w),\qquad (Z,w)_{h_K}\longmapsto(Z,w).
$$
Here $D^2_2$ is the disk of radius two. At $|Z|\le1$ the inverse
uses $h_K$. At $1\le |Z|\le2$ it is
$(Z/|Z|,w,2-|Z|)$ in $P$. Across $|Z|=1$ the smooth structure is
the standard collar gluing, with $|Z|-1$ the signed collar coordinate.
The corner rounding of one product is carried to the other. In particular
$G_K$ restricts to a forward marking of $Y_K$ and its inverse is
the stated restriction of $G_K^{-1}$. It sends the incoming residual
tube to $G_K a_S$ on the surviving exterior. This is the explicit
product absorption in the example. For a general geometrically
cancelling adjacent pair the corresponding end map is the product
flow map of Milnor's theorem and its inverse is reverse flow. The
hypothesis is a single transverse intersection of the attaching sphere
with the belt sphere at the common level.
[Milnor, Theorem 5.4](https://www.math.auckland.ac.nz/~hekmati/Books/Milnor2.pdf) ·
[Source record](../../../04_hypersurface_immersions/02_two_handle_recognition/references/README.md)

Fix a boundary identification $L:Y_K\to S^3\subset\mathbb C^2$
for the split control, using the rounded $G_K$ ball, in which the
spectator tube is
$$
 L a_S(z,v)=(\sqrt{1-\epsilon^2|v|^2}\,z,\epsilon v),
 \qquad |v|\le1,quad 0<\epsilon<1 .
$$
To fix the marking, let $R$ be radial projection of the rounded
$G_K$ boundary to the unit sphere. Its inverse takes each unit
direction to the intersection of its ray with the chosen rounded
boundary. Let $\sigma$ be stereographic projection from a pole
off the displayed tube, and let $T\in SO(4)$ send the chosen
point in the untouched patch of the radially projected boundary
to the antipode of that pole. For the dilation $d_\lambda$ of
$\mathbb R^3$ with $\lambda>1$, take
$L=\sigma^{-1}d_\lambda\sigma T R\,\partial G_K$. Its inverse
reverses the factors and uses $d_{1/\lambda}$ in the chart,
with stereographic dilation extended smoothly at the pole.
For sufficiently large $\lambda$ the pullback of the displayed
tube lies in the untouched patch. Use this to define $a_S$ with
the displayed disk framing. The exterior in $S^3$ has coordinates
$$
 q=y/|y|,\qquad u=x/\sqrt{1-\epsilon^2},\qquad
 (x,y)=\big(\sqrt{1-\epsilon^2}\,u,
       \sqrt{1-(1-\epsilon^2)|u|^2}\,q\big).
$$
Here $|y|\ge\epsilon$, so the formulas are smooth through $x=0$.
The new spectator outgoing tube $b_S(u,q)$ uses the same torus
coordinates $(u,q)$ on its edge. The top level is two copies of this
disk glued at $|u|=1$, times $S^1_q$. Use the double as $S^2$,
with disk markings $\iota_-$ for the exterior and $\iota_+$ for the
new face, and put $Q=S^1_q\times D^3$. Choose the control closing
map by
$$
 \begin{aligned}
 \gamma(y_0)&=(q,\iota_-(u))&&
    \text{if }y_0\text{ belongs to the exterior, with }L(y_0)=(x,y),\\
 \gamma b_S(u,q)&=(q,\iota_+(u)).
 \end{aligned}
$$
The inverse on the exterior hemisphere is $L^{-1}$ of the displayed
$(x,y)$. On the other hemisphere it is $b_S(u,q)$. Orient $Q$ so
the gluing has the stated orientation. The product sphere
$\{q=1\}\times S^2$ of the upper 3-handle meets the spectator belt
circle $\gamma b_S(0,q)$ once transversely. Reading downwards, the
dual spectator tube is $(q,u)\mapsto(q,\iota_+(u))$. Present the
upper $D^3$ as $D^2\times[0,1]$ with $\iota_+$ its top disk.
The same radial formula as $G_K$, now in the $q$ coordinate, and
its piecewise inverse identify the upper body including that dual
handle with a ball. At the spherical intermediate cut both complete
sides are consequently standard balls. Their actual boundary gluing
is the one obtained by transport. Alternatively the full lower trace
is $S^2\times D^2$, from the zero-framed unknot in $W_K\cong D^4$,
and its actual gluing to $Q$ gives the standard sphere by Theorem A
at one summand.
[Laudenbach–Poénaru, Theorem A, p. 337](https://www.numdam.org/item/10.24033/bsmf.1741.pdf)

In the other forward order the spectator surgery acts in its small
ball. Replacing the ball by the punctured zero surgery on the split
unknot gives $Y_S\cong (S^1\times S^2)\#(S^1\times S^2)$.
Its marking is identity on the complement of the split ball and the
punctured version of the two-disk marking above inside it. The inverse
uses those same pieces backwards. The residual $K$ tube is the
original $a_K$ there. The common final boundary is the $Y_{KS}$
above. In the reverse order, undoing $S$ first gives $Y_K\cong S^3$
and undoing $K$ first gives $Y_S\cong\#_2(S^1\times S^2)$.
In each case the dual framed embedding is the specified swap formula
in the actual upper marking, followed by the inverse operation on the
survival region.

## The slid control and the second order

Take a push-off $K^+$ of $K$ in its framed product, just outside
$a_K$ using a slightly enlarged tube. Choose a narrow band from $S$
to $K^+$ away from $B$, with interior clear of the tubes and the
split spanning disk. For example its centerline connects the split
ball to an exterior collar of the meridian at an angle $z\ne1$ in
the connected cut-open product $(S^1\setminus\{1\})\times S^2$.
Choose it to enter the split disk and parallel annulus at their
edges, with the untwisted product thickening. The band and its
framed parallel define $S'=S\mathbin{\#_{\mathrm{band}}}K^+$.
The slide leaves $K$ in place. The band misses $B$, so the two
oriented cores cross $B$ once each, with algebraic row $(1,1)$.
The pushed-off copies of both summands and the parallel band fix the
framed attachment, including its two disk coordinates. This is the
framed slide convention of
[Gompf–Scharlemann–Thompson, §2, pp. 2308–2309](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf).

In $Y_K$ the pushed-off $K^+$ bounds an explicit disk: take
$D^2_z\times\{w_0\}$ in the outgoing face for the chosen direction
$w_0\in S^1$ and add the short exterior annulus to the push-off.
Varying the argument of $w_0$ gives its parallel disks. Their
framing agrees with the band parallel at the joining edge.
Shrink the band detour over this disk in $Y_K$. In a product
neighborhood of the disk and band this gives a framed isotopy of the
spectator tube from $a_S$ to $a_{S'}$, both read on the same
surviving exterior. Choose the parametrization of the band-summed
tube to be the endpoint of this isotopy. Denote its ambient
extension by $J_t$, with $J_0=\mathrm{id}$.
One construction on a slightly enlarged moving tube $a_t$ is
to extend $\dot a_t\circ a_t^{-1}$ using a bump in its normal
coordinate, then take the time-dependent flow. This gives equality
$J_1a_S=a_{S'}$ as maps. Inverse transport on the tube is
$a_{S'}^{-1}=a_S^{-1}J_1^{-1}$ on its image.

For comparison of the full lower traces take
$$
 F:W_{KS'}\longrightarrow W_{KS}.
$$
In a collar $Y_K\times[0,1]$ before the spectator handle it is
$(y,t)\mapsto(J_{\lambda(t)}^{-1}y,t)$ with a smooth
$\lambda=0$ near the earlier end and $1$ near the later end.
It is identity on the spectator's handle coordinates and below
this collar. The inverse uses $J_{\lambda(t)}$ on the collar
and identity in the other coordinates. Lower gluing is $p$ in
both diagrams. For the slid diagram the top gluing and its
inverse are
$$
 \gamma'=\gamma\,\partial F,\qquad
 (\gamma')^{-1}=(\partial F)^{-1}\gamma^{-1}.
$$
The assembled comparison is $F\cup\mathrm{id}_Q$ with inverse
$F^{-1}\cup\mathrm{id}_Q$. In particular the $S'$ dual
attachment in $\partial Q$ is literally the previous $S$ dual
attachment, since $\partial F b_{S'}=b_S$. For the $K$
dual tube, use $\gamma'b_K\mathrm{swap}$ with the new $b_K$
and its full inverse. This formula gives the transported image of the $K$ tube in the
original upper coordinates.

If $S'$ is attached first, shrink the other band detour over the
split spanning disk of $S$ in $Y_0$, then translate the framed
$K^+$ back to $K$ in the enlarged product tube. Both moves
can be extended by the same vector-field construction as above.
Write $A:Y_0\to Y_0$ for the endpoint. The parametrization of
this isotopy can be chosen to give $A a_{S'}=a_K$. The extra
parameter at this step is only an orientation-preserving choice
of circle coordinate and the disk-frame interpolation with
zero twist, since both disk parallels were fixed at the band
edges. The move also transports the remaining $a_K$.
The forward marking of the $S'$-first level is the restriction
of $G_K$ composed with $A$ on the exterior and identity in
the new handle coordinates. Its inverse first applies the
boundary inverse of $G_K$, then $A^{-1}$ on the exterior and
identity on the new face. The residual framed embedding in
this $S^3$ is $G_K A a_K$. To glue back the actual trace,
attach that tube, undo $A$ on the exterior and use the
common full-output identification before applying $\gamma'$.
Thus reversal in the slid diagram gives $S^3$ whichever
handle is undone first. When the first dual handle is $S'$,
the explicit radial cancellation on the upper end applies.
The other reverse order uses the indicated cut marking and
the known full-trace comparison.

| Diagram | First forward handle | First reverse handle yielding the same cut | Intermediate boundary |
| --- | --- | --- | --- |
| Split | $K$ | $S^*$ | $S^3$ |
| Split | $S$ | $K^*$ | $\#_2(S^1\times S^2)$ |
| Slid | $K$ | $(S')^*$ | $S^3$ |
| Slid | $S'$ | $K^*$ | $S^3$ |

The mixed count starts at $(1,1,2,1,1)$ in both diagrams and
any order. Performing one actual lower or upper cancellation
gives $(1,0,1,1,1)$ or $(1,1,1,0,1)$. Cancelling both in the
$K$-first control with the returned markings gives $(1,0,0,0,1)$.
All moves in this replay act directly on the original handles.

## A clean bigon for one component, with a movable spectator

Let $K_1$ meet the fixed belt sphere $B$ at precisely three
transverse points with signs $+,+,-$ up to reversal. Suppose
an arc $\alpha\subset K_1$ between consecutive opposite
crossings and an arc $\beta\subset B$ bound an embedded
disk $\Delta$. The boundary arcs have disjoint interiors.
Require $\operatorname{int}\Delta\cap(B\cup K_1)=\varnothing$,
$\operatorname{int}\beta\cap K_1=\varnothing$, and a product neighborhood
of the one-sided disk and belt patch after rounding the corners. The initial spectator is allowed to run
through that neighborhood or through the disk itself.

Push $\alpha$ across $\Delta$ to a parallel arc just
beyond $\beta$, with the endpoints of the supported arc
lying past the two crossings. The opposite signs permit
the two end segments to stay on that same far side. A thin
product neighborhood of the disk, extended across its belt
edge, gives an isotopy of the arc supported away from the
third crossing and the rest of $K_1$. Extend it over a
tube and to an ambient isotopy $H_t$ on $Y_0$, by the
moving-tube vector field above. Keep $B$ as the fixed
reference for the resulting diagram. Carry *both* framed
maps to $H_1a_i$. The ambient map keeps their tubes disjoint
and allows the sweep to meet the spectator. Its geometric intersection
count with the fixed belt sphere can change. Isotopy to the identity
preserves its algebraic intersection count. A small perturbation
away from the chosen tube restores spectator transversality to $B$
if needed.
An assertion relative to a protected spectator or exterior
would require its own support condition.

Here is a local instance with a genuinely occupied disk.
Use small coordinates $(x,y,z)$ with $B=\{z=0\}$ and
a chosen arc $y=0, z=f(x)=x(x^2-a^2)$ around
$[-a,a]$, for small $a>0$. Its crossings are
$-a,0,a$, with signs $+,-,+$. The bigon lies in
$y=0$ between $z=0$ and $z=f(x)$ for $-a\le x\le0$.
At $x_*=-a/2$ take the transverse circle $(x_*,R\cos\theta,c+R\sin\theta)$ in the plane $x=x_*$, with radius $R$ such that
$c-R<0<c+R<f(x_*)$. It crosses the belt twice, meets the
bigon at $y=0,z=c+R$, and bounds a disk disjoint from
the chosen arc. Give it its disk framing. Take a cutoff
$\chi(x)$ equal to one on $[-a,0]$ supported in
$(-a-\eta,\eta)$ with $0<\eta<a/4$. On the swept
region use the flow $(x,y,z)\mapsto(x,y,z-tC\chi(x))$,
where $C>\max_{[-a,0]} f$, multiplying its vector field
by a compactly supported cutoff equal to one on the swept
graph and spectator disk. The final graph
has $z<0$ across the first two crossings and retains
only the one at $a$. The moved circle and its disk are
below the belt since $c+R<f(x_*)<C$. The final graph is a
single transverse crossing arc, straightenable in the crossing box
by an isotopy preserving the belt patch. A small regular neighborhood
of the final spectator disk is a ball disjoint from the chosen tube
and belt. The inverse flow in this box therefore installs the two extra
crossings in a split control and carries its full framing and upper
gluing.

In the conditional general case put a product collar on
$Y_0$ and extend $H_t$ along it, starting at identity on
its lower face. The new-to-old comparison uses
$H_{\lambda(t)}^{-1}$ in that collar and identity in the
framed handle coordinates. The inverse uses
$H_{\lambda(t)}$, and the new upper gluing is the old
one composed with the new-to-old boundary map. Now attach
$K_1$ first. Its one transverse crossing satisfies Milnor's
hypothesis, so replace the adjacent pair by its product and
pull back the remaining attachment by the product flow
identification (with inverse given by reverse flow). This
strictly reduces $n_2$ from two to one. On a smooth
homotopy sphere the residual attachment is an integer-framed
knot in $S^3$ with surgery $S^1\times S^2$. The first
homology forces framing zero, and the one-knot Property R
theorem yields the unknot. The resulting trace and its
actual gluing are therefore recognized by Theorem A.
[Gabai, Corollaries 8.3 and 8.6 and the one-middle-handle proof](../../../04_hypersurface_immersions/02_two_handle_recognition/references/README.md) ·
[Marked height recognition, `prop:one` and `prop:belt`](../../../04_hypersurface_immersions/02_two_handle_recognition/manuscript/recognition_from_marked_morse_heights.tex)

The existence of the disk for a general three-crossing
component is an additional hypothesis. In the normalized
mixed incidence row $(1,0)$, the first-order surgery cut
has integral homology of $S^3$, and the second-order cut
has first homology $\mathbb Z^2$. These follow from the
two minors of the ordinary surgery matrix
$\left(\begin{smallmatrix}0&1&0\\1&d&b\\0&b&0\end{smallmatrix}\right)$.
The first minor has determinant $-1$, the second is
zero, and the zero spectator diagonal is forced by the
rank-one first homology of the full output. The upper-end
version is tested on the actual dual tubes. The homology
calculations leave the diffeomorphism types of the
unrecognized intermediate cuts open. The cited Mazur double is a standard sphere with an
intermediate integral homology sphere of nontrivial fundamental group.
[Marked height recognition, `thm:mixed` and `thm:mixed-meridian`](../../../04_hypersurface_immersions/02_two_handle_recognition/manuscript/recognition_from_marked_morse_heights.tex) ·
[Primary Mazur source record](../../../../../references/SOURCE_NOTES_MASTER_ENDPOINT_20261125.md)

## Whole cluster and the physical seam decision

Take the whole lower cluster to be a rounded regular
neighborhood of the lower 0/1 body and both attachments, with
the joining tubes retained. Its outgoing boundary is the
full $Y_{12}$, or a collar-parallel copy inside this trace.
In the supplied mixed presentation the actual closing map to
the reduced upper $Q\cong S^1\times D^3$ gives
$$
 \gamma:\partial(P\cup h_1\cup h_2)\xrightarrow{\cong}
 \partial Q\cong S^1\times S^2.
$$
Its inverse is the actual upper marking read backwards. This
is a diffeomorphism given by the upper end and, in the control,
by the explicit two-disk formula. It holds in either order
and after transporting the upper gluing through a slide or
isotopy. The group $\pi_1=\mathbb Z$ excludes this whole
cluster boundary as a spherical cut. A partial neighborhood
of an individual handle or an intermediate level is a
different specified cut with different complete sides.

For the unslid and slid $K$-first controls the spherical
intermediate level $Y_K$ has the smooth angular marking
above, with a bicollar from the regular-level product and
both complete sides identified by the trace. Reversing the
handle order or using the conditional bigon requires using
the corresponding transported level and maps. SUR-B02 must
supply a physical embedded comparison to a level of the
particular Riemannian source, its two native widths, gauge,
protected regions and admissible curvature costs before a
metric cut test applies. For a general mixed diagram lacking
a selected bigon or other marked recognition, SUR-B02 also
needs an actual intermediate $S^3$ identification, a
specified relative move on a nonspherical face, or a
different embedded cut.
