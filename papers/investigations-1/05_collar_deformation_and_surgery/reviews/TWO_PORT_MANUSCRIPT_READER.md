# Independent reading of the two-port manuscripts

26 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. CDS-E02, bounded reading 4. The issued setting was
GPT-6.2 Sol/ultra. Actual serving model and effort are unavailable. This is
a mathematical readback of two working sources at intake Git
`4da586548b445ccfe9145c6a5671c0f7ecd433f3`. The SHA-256 pins reproduced are
`35cda08ac24f37803b48376589ec97c2a8c618145d70241b4f8691503f312925` for the
[surgery TeX](../02_handle_isolation_and_marked_surgery/manuscript/recognition_from_marked_handle_cuts.tex)
and `95690367a9312efb49ad0aff955caf98dc648b7b9c44ab1000dee81f27c29ba3` for the
[parent TeX](../manuscript/marked_collars_and_smooth_recognition.tex).
[Issued reading](../research-progress/handoffs/TWO_PORT_INDEPENDENT_READINGS_20261126.md)

The subsequent readback reproduced surgery SHA-256
`6baa758fd9d27ab8d0556c5d3187f2725820c9e3075bb81b5e03b0a13299856a` and parent
SHA-256 `db02d8e106356cc47d9bef3253cca1cfd068cbfb410331ef0fa49047863262ef`.
The final parent wording checked below is
SHA-256 `e3e4376936d180835e37c00b931b14707ef91ce384c7ace82295d4bb799bf29e`.

The supplied cut forces localization of the marked pair. The terminal
presentation with initial split attachment admits a net decrease from
three to two middle handles for every returned local pair. Recognition of
the local trace gives the further decrease to zero. The exact knotted
fixture has that recognition, using the actual published pair.

## The prescribed sphere gives a relative localization

Write $Y_r=\#_r(S^1\times S^2)$. The data are smooth, oriented, integral
parametrized attachments $Q,K$ in $Y_1$, joint outlet $Y_3$, and an actual
marked sphere with cut manifold $W=S^2\times I$. Its cut misses $Q$ and
meets $K$ at two opposite-sign points. Each oriented return begins and
ends on the same copy of the sphere. Cap the copies in separate balls and
complete the returns by trivial arcs along matching chords, giving the
joint link $Q,J,V$ in $S^3$. The exterior of a drilled cap arc is a solid
torus attached along an annulus parallel to the outer punctured face.
It adds a collar to that face annulus, with the circle direction the
meridian of the actual returning tube. Filling the $Q$ torus gives $X$,
the drilled slab with two marked torus boundaries.

In the actual $K$ filling, both cut meridians have distance one from the
filling meridian. A filling chart makes them two product longitudes
simultaneously. Spanning them by $S^1$ times a chord in the filling disk
closes the punctured sphere to a two-sided torus. On cutting, each half
of the filling disk contributes a solid-torus collar along the lateral
annulus of the corresponding return. Thus the cut of the outlet is $X$
with its actual face and lateral annuli. The reidentification uses the
original sphere marking and the two copies of the spanning annulus. A
shear from the integral framing is part of that identification. Since
$X$ is connected, van Kampen describes this as a single HNN gluing. If
both boundary maps on $\pi_1$ are monic, normal form embeds
$\mathbb Z^2$ in $\pi_1(Y_3)=F_3$, which has only cyclic abelian subgroups.
The Loop Theorem gives a proper compression at a failing torus. These
steps permit reducible $X$. [Higman–Neumann–Neumann, Theorem I](https://doi.org/10.1112/jlms/s1-24.4.247) ·
[Stallings, *On the Loop Theorem*](https://doi.org/10.2307/1970146)

The zero surgery slopes also follow directly from the end ranks. The
signed cut intersections make both original cores null-homologous, so
their exterior has free first homology of rank three with a rank-two
meridian summand. The $Y_3$ filling preserves rank three, forcing both
slope classes to vanish. In Seifert coordinates this gives both zero
coefficients and total linking zero. A Seifert surface for $Q$ in the
interior of $W$ computes its same framing in the capped slab and yields
$a+b=0$, where $a=\operatorname{lk}(Q,J)$ and
$b=\operatorname{lk}(Q,V)$. Put $c=\operatorname{lk}(J,V)$. From the
three-component exterior and the actual $Q$ filling, a compression of
the $J$ torus of primitive slope $p\mu_J+q\lambda_J$ satisfies
$(qa,p,qc)=k(0,a,b)$ in the integral meridian lattice. If $q=0$, then
$p=\pm1$ contradicts $a+b=0$. Otherwise the equations give
$a=b=p=c=0$, then $q=\pm1$. The argument with the two ports exchanged
has the same conclusions. The compressing slope is the preferred
longitude, meeting its own meridian once. A section of the lateral
annulus, with its ends fixed by the clipped face chord, realizes this
longitude by its relative winding. Restore the radial strip from the
section to the actual arc. This produces a bridge disk in the $Q$-filled
slab disjoint from the other arc. The original attaching framing is
carried by the resulting isotopy. A longitude word test on a triangulated
input uses Dehn's lemma in one direction and the bridge disk in the other.
[Aschenbrenner–Friedl–Wilton, Theorem 4.1](https://msp.org/gtm/2015/19-1/gtm-v19-n1-p08-s.pdf)

Puncture the bridge disk at its transverse intersections with the
$Q$ filling core. The deleted meridian disks have boundary the actual
$Q$ slope after identifying the intervening torus collar. Disjoint slits
from the returning edge to those holes give framed slides over signed
parallels of $Q$. The slit disk pushes the returned arc to the chord. The
seam push places the whole moving core on the opposite side, in the
interior of the unfilled slab. Its completion in the capped slab is the
opposite return with the same face chord, relative to $Q$. The compact
core projections miss a disk in $S^2$. The product of the complementary
closed disk and a closed interior height interval rounds to the desired
ball. The transported tubes fit in that ball after shrinking by isotopy.
Connected sum at the boundary of the ball gives $Y_3=Y_1\# S^3_L$ for
the actual returned local framed pair $L$. Prime uniqueness gives
$S^3_L\cong Y_2$. [GST, §2 and Proposition 3.2](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf) ·
[Milnor, Theorem 1](https://doi.org/10.2307/2372800)

If both ports compress, the disks have boundary on distinct tori and
can be made disjoint by innermost disk replacement. Straightening both
returns in the $Q$-filled slab gives a split seam unknot after the marked
regluing. Its coefficient is zero from the first Betti increase by one.
The resulting outlet is $Y_2\# S^3_0(Q)$, so prime uniqueness and Property
R force the capped $Q$ to be trivial. This proves uniqueness of the disk
side for nontrivial $Q$ within the theorem's hypotheses. [Gabai,
Corollary 8.3 and Remark 8.5](https://doi.org/10.4310/jdg/1214441488)

The converse holds in the same class. Suppose the capped $Q$ is an
unknot. In $M_Q=S^3_0(Q)=Y_1$ the first bridge, completed through its
trivial cap arc, gives a spanning disk for $J$ disjoint from $V$ after
naming the compressed port $J$. A small ball about this disk contains
$J$ and misses $V$. The localization just proved returns the framed
completion $V$ relative to $Q$, so the induced surgery on $V$ in $M_Q$
gives $Y_2$. Meier–Schirmer–Zupan's increasing-rank single-knot theorem
gives a spanning disk for $V$ in $M_Q$. Shrink and move the $J$ ball off
this disk by an ambient isotopy supported away from $V$ and pull the
disk back. Clipping it at the $V$ tube gives a meridian-dual compression
in the capped two-knot exterior, which is $X$ after removing the two cap
collar extensions. The slope calculation then identifies it with the
marked chord representative. [Meier–Schirmer–Zupan, Theorem 5.1](https://arxiv.org/pdf/1507.06561#page=9)

## The terminal count and the surviving closing

The intervening trace diffeomorphism can be realized by putting $Q$
first and extending the framed motion in the $Q$-filled level to an
ambient isotopy $J_t$. Use $(z,s)\mapsto(J_{\eta(s)}z,s)$ in the
collar between attachments, where $\eta$ has constant end germs, and
use the same handle coordinates on the two traces. Its inverse uses
$J_{\eta(s)}^{-1}$. Hence the localization has an inverse fixing the
incoming collar. For a regular outlet map $P$, transport the full
later tube $t$ to $Pt$ with inverse $t^{-1}P^{-1}$ on its image and
extend in the same later handle coordinates. If $\widehat P$ denotes
the resulting final outlet comparison, use closing $\gamma\widehat
P^{-1}$ and inverse $\widehat P\gamma^{-1}$. For an original outgoing
face $o_i$ at an immediate closing its reverse tube is still
$\gamma o_i\tau=(\gamma P^{-1})(P o_i)\tau$, where $\tau$ switches the
factors. Carry the face at its own level if the subsequent adjunction
occupies it.

In the corollary the original $Y_1$ is the actual boundary after a
split zero-framed $A$ on $D^4$. Move the parametrized localized ball
by an orientation-preserving ambient isotopy to a patch of the common
$S^3$ exterior of $A$, and extend back through the inlet collar. In
this chart the full tubes of $L$ and $A$ have disjoint supports in
$S^3$ and may be attached in the order $L,A$. The last attachment adds
a split $S^2\times D^2$ summand to $D_L$, the actual two-handle trace on
$D^4$. Write $U$ for the supplied rank-three upper body and $\gamma'$
for its transported closing at $\partial D_{L\sqcup A}=Y_2\#Y_1$.
Choose an orientation-reversing closing $\lambda$ to a model $H_3$
which aligns the last summand with the last reverse 1-handle. The
actual $A$ dual is the product circle in that summand, meeting the
model belt sphere once. Extend the orientation-preserving boundary
map $\lambda(\gamma')^{-1}$ to $h:U\to H_3$, with inverse restricting
to $\gamma'\lambda^{-1}$. Gluing by $\lambda$ is therefore identified
by the lower identity and $h$ above, with the corresponding inverse.
Read the $A$ dual as the first reverse 2-handle and apply adjacent
cancellation. The canceling neighborhood is in the split summand,
relative to the remaining two-handle trace. If $d$ is the actual
identification of $\partial D_L$ with the boundary of the model upper
piece plus the $A$ dual, and $C$ is its product cancellation map to
$H_2$, the surviving closing is $\partial C\,d$ with inverse
$d^{-1}(\partial C)^{-1}$. This gives $(n_2,n_3)=(3,3)\to(2,2)$ for
every returned local pair, with zero births. The revised corollary
spells out the induced rank-two closing and the inverse convention.
[Palais, Theorem B and Corollary
1](https://doi.org/10.1090/S0002-9939-1960-0117741-0) ·
[Laudenbach–Poénaru, proof of Theorem A](https://www.numdam.org/item/10.24033/bsmf.1741.pdf#page=7) ·
[Milnor, Theorem 5.4](https://webhomes.maths.ed.ac.uk/~v1ranick/surgery/hcobord.pdf#page=53)

The local closure has one 0-handle, no 1-handles, two 2-handles, two
3-handles and one 4-handle. It is simply connected with Euler
characteristic two, hence a homotopy sphere by duality, Hurewicz and
Whitehead. If one of the two actual local knots is a generalized square
knot, Meier–Zupan's Theorem 1.1 recognizes this closure. To obtain the
marked local equivalence, close a separate copy by an auxiliary $H_2$.
The pair argument in Laudenbach–Poénaru's proof of Lemma 1 compares
the embedded cap in that now recognized $S^4$ to a standard embedded
cap. Restriction gives a diffeomorphism of the two lower traces. Match
the parametrized incoming and vertical disk after rounding by a
boundary isotopy on the connected $Y_2$, extending across its inward
collar and straightening the product germs over a buffer. The map and
inverse then glue by identity outside the local block. The split
replacement cancels twice at the upper end using its new product
duals, with separate marking transport for the original faces. Thus
in the terminal assembly the count reaches $(0,0)$ without births,
and an interior replacement preserves the count until a successor move
is established. The use of the embedded-cap comparison is downstream
of Meier–Zupan or another independent smooth recognition. [Meier–Zupan,
Theorem 1.1](https://doi.org/10.4310/jdg/1668186788) ·
[Laudenbach–Poénaru, proof of Lemma 1](https://www.numdam.org/item/10.24033/bsmf.1741.pdf#page=3)

## Published fixture and remaining scope

In the selected slab the lower return follows the zero parallel of $Q$
with a gap. Its two access rails and the exposed radial annulus give an
annulus from the completed return to the actual stationary filling slope.
Cap it by one filling meridian disk. A bridge avoiding the filling core
could be pushed through the surviving torus collar to the unfilled
situation, where adding the trivial cap gives a spanning disk in $S^3$
for the completed square knot. Thus one puncture is minimal for this
marked bridge. Slitting the displayed annulus and reversing the opposite
access rectangle restores the actual $L_{4,1}=Q\cup V_4$ in the original
joint position, with both coefficients zero. GST identifies Figure 1 as
that square knot interleaved with $V_4=T_{4,5}\#\overline{T}_{4,5}$ and
gives its joint surgery $Y_2$ from the dual construction. Figure 19 uses
two bracketed surgeries to specify the ambient sphere. This makes the
required $Y_3$ outlet independent of the general compression theorem.
Uniqueness of the compressed side then follows from the nontrivial
stationary knot. GST §10 gives a separate comparison with one canceling
1/2 Hopf pair, peaking at four middle handles in the continuing terminal
assembly. The relative trace argument uses no Hopf pair. [GST, Figure 1,
§7 and §10](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf)

In the compactified cyclic cover the moving lift is $V_4\# Q^+$ and
is nonsplit with the two adjacent stationary lifts. At one end this
comes from the published nonsplit pair with a local $Q^+$ tied in. The
pair is nonsplit by prime uniqueness and Property R from $Y_2$ surgery.
At the other end it comes from the knotted parallel pair, whose annulus
would give an essential circle on a putative splitting sphere, with a
local $V_4$ tied in. Splitting spheres can be cleared of a local-knot
ball by innermost surgery, preserving a separating component. An inlet
ball would lift to disjoint balls with at most one stationary lift in
each, contradicting the two nonsplit pairs. Both first-cut tests
$Y_1\to Y_2$ fail since a local unknot lifts to an unknot, whereas both
actual lifted cores are knotted. The returned $Q$-first intermediate
level remains $Y_1\# S^3_0(Q)$. The subsequent recognized trace changes
the intermediate height. [Single-knot criterion, Theorem 5.1](https://arxiv.org/pdf/1507.06561#page=9)

For the specified terminal one-sided presentation with least middle
count three, a sphere missing one tube and meeting the other core zero
times would put both directly in a slab ball. Two intersections give
the proved reduction. In general the two-handle trace group read from
$Y_3$ has abelianization of rank at least one, and read from $Y_1$ is
$\mathbb Z$ modulo the two windings. Both windings vanish, so any
transverse sphere missing one tube must meet the other core at least
four times if such a sphere exists in this least-count class. This
applies to the presentation with the initial split $A$ and actual free
ends. The reduction stops at the unrecognized local two-component
$Y_2$-surgery link. In three-handle presentations outside the hypotheses,
selection of a split first attachment or a qualifying sphere is still
open. The parent selection discussion also retains its uncovered mixed
class.

The revised surgery TeX includes both follow-up deductions and the map
on the surviving closing. The final parent version specifies that the
four-point bound concerns a transverse nonseparating sphere missing one
tube and intersecting the other core. It also gives the direct slab ball
and initial-attachment cancellation for the disjoint sphere. The final
two-port proof and parent summary have the same scope.

The two-port argument uses smooth marked topology throughout. The
parent's analytic alternative still requires a physical identification
and estimates on that same source. In its real Hilbert–Schmidt Weyl
normalization a positive class at $E_+\le T=4\pi^2$ is a recognition
certificate. A finite minimizing comparison requires positive entry below
$2T$ and a complete positive same-type competitor saving strictly more
than $e_i-I^+(M)$. Positivity inferred through the joined barrier requires
a peak strictly below $2T$. This example supplies none of those metric
inputs, a PSC band estimate, or compactness in the original marking.
[Parent plan](../research-plan/PLAN.md)
