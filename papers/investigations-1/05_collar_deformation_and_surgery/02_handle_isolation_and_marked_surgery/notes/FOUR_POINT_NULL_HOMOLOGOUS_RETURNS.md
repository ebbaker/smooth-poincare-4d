# Null-homologous prescribed returns with no bridge disks

26 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. Bounded execution packet SUR-E02ad in the
[four-point issue](../../research-progress/handoffs/FOUR_POINT_MARKED_RETURNS_20261126.md).
The issue selects GPT-6.2 Sol/ultra for bounded derivations. Actual serving
model and effort are unavailable. The category is smooth oriented
three-manifolds with parametrized integral attaching tubes. The proof uses
the actual stationary longitude filling and the seam with four marked ports
of this specimen.

For every integer \(k\ne0\), the twist in SUR-E02ad gives two prescribed
return chords whose closed loops at the original wall sections vanish in
\(H_1(X;\mathbb Z)\). On each face, the closed loop is nontrivial in
\(\pi_1(X)\) for every wall winding. Thus neither prescribed chord admits
its bridge disk in the stationary-filled drilled slab \(X\).

## The slab and its seam

Cut the inlet along the actual product sphere to \(W=S^2\times I\). Drill
the stationary \(Q\), the same-face returns \(R_-=1_-2_-\) and
\(R_+=3_+4_+\), and the two through strands \(T_3=3_-1_+\) and
\(T_4=4_-2_+\), obtaining \(X_0\). Fill just \(Q\) along its marked zero
longitude to obtain \(X\). The original bridge on each face clips to a disk
in \(X\) bounded by its short face chord and the section of its own return
wall. Its unclipped version lies in the filled slab with the return core
as one boundary arc. The two original disks are disjoint and each has one
transverse intersection with the stationary filling core. [Actual disk and
outlet construction](FOUR_MARKED_BRIDGE_DISKS.md)

Give \(W\) the product orientation and identify both four-holed faces with
the same oriented \(F\subset S^2\) by the seam map. The upper induced
boundary orientation is that of \(F\), and the lower one is its reverse.
Use the orientation on the moving core for which \(T_3\) goes up and
\(T_4\) goes down, \(R_-\) goes from \(1_-\) to \(2_-\), and \(R_+\)
goes from \(4_+\) to \(3_+\). Positive meridians of the oriented strands
use the oriented normal disk in \(W\). A port circle positively oriented
as the boundary of its hole disk in the common \(F\) gives the positive
strand meridian when the core points in the increasing \(I\) direction
and the negative one otherwise. Write \(\mu_\pm\) for the two return
meridians and \(m_i\) for the meridian of \(T_i\). The images in \(H_1(X)\)
are as follows.

| Face | Port 1 | Port 2 | Port 3 | Port 4 |
| --- | --- | --- | --- | --- |
| Lower | \(\mu_-\) | \(-\mu_-\) | \(m_3\) | \(-m_4\) |
| Upper | \(m_3\) | \(-m_4\) | \(\mu_+\) | \(-\mu_+\) |

The pair sequence of \((W,X_0)\) and excision give five generators in
\(H_2(W,X_0)\), one meridian disk for each drilled component. A horizontal
sphere generates \(H_2(W)\) and maps to the difference of the two through
disks, as only the two through strands meet it and their intersection
signs are opposite. Since \(H_1(W)=0\), this gives \(H_1(X_0)\cong\mathbb Z^4\)
with the two return meridians, the meridian of \(Q\), and \(m=m_3=m_4\) as
a basis. In the two external capping balls, complete the two through
strands to the one knot \(C\) using the original short \(34\) chord below
and \(12\) chord above, pushed just outside \(W\). Complete each return
by its own short capping arc. In capped \(S^3\), linking with \(Q\), the
two separate capped returns, and \(C\) gives the dual basis, with \(C\)
oriented along the two through strands as above. The linking of the
stationary longitude with \(Q\) is zero by the zero framing. Its linking
with each capped return is zero: the longitude is isotopic to \(Q\) in
the stationary tube, disjoint from the capped return, and the original
exterior annulus and cap collar exhibit the capped return as a zero
parallel of \(Q\) in the complement of \(Q\). The linking of the
stationary longitude with \(C\) is \(\operatorname{lk}(Q,C)=0\). The
actual joint pair \((Q,C)=L_{4,1}\) follows by the two through-box pushes,
and its zero linking follows from its published joint surgery and the
two-component case of Proposition 2.2. The longitude class vanishes in
\(H_1(X_0)\). Filling quotients by this class, so \(H_1(X)\cong\mathbb Z^4\)
with the same basis. [Gompf–Scharlemann–Thompson, Figure 1, Proposition 2.2
(p. 2310) and §7 (p. 2332)](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf)

## Twisting the prescribed chords

Take \(s\subset F\) around \(12\) separating the original two chords,
and \(d\subset F\) around \(13\) as in the issue. Write \(s_1=\tau_d(s)\),
\(f=\tau_{s_1}^k\) and \(s_k=f(s)\), where \(\tau\) uses the common
orientation of \(F\). Transport the same map \(f\) to the two faces via
the seam identification. Relative to their induced boundary orientations
the twists have opposite signs. Their supports lie away from the port
collars, so the maps fix the endpoints and port germs and give matching
disjoint image chords across the seam. Both twist maps fix every boundary
circle, so \(s_1\) and \(s_k\) separate \(12\) from \(34\). The return side
is \(12\) below and \(34\) above. The other side on each face contains the
two through ports.

Orient \(s\) around \(12\). In the two copies of \(F\), the punctured disk
on the \(12\) side gives \([s]=\mu_--\mu_-=0\) below and \([s]=m_3-m_4=0\)
above in \(H_1(X)\). The class of \(s_1\) in \(H_1(F)\) is the same as
that of \(s\), since it is the sum of the same oriented port circles. Let
\(b\) be the appropriate original oriented return chord, and \(b'=f(b)\).
The endpoints are fixed, so \(b'-b\) is an absolute cycle. In a twist
annulus a traversing subarc picks up \(k\) times the core with its
traversal sign. Consequently \([b'-b]\) is an integral multiple of
\([s_1]\), and its image in \(H_1(X)\) is zero. Here the signed traversal
count also vanishes already on \(F\), since both endpoints of \(b\) lie on
the same side of \(s_1\). Closure using the original wall section preserves
the zero class of the original disk boundary in the full \(H_1(X)\).
A change of winding by \(n\) adds \(n\mu_-\) or \(n\mu_+\) with the
appropriate orientation. Thus the original section is the unique
homologically admissible winding on either face.

## The two group obstructions

The enclosing pairs \(12\) and \(13\) imply \(i(s,d)>0\). Cutting \(F\)
along \(s\) gives two pairs of pants, and any essential circle disjoint
from \(s\) must be isotopic to \(s\) or peripheral on \(F\). The geometric
intersection formula \(i(\tau_a^j(b),b)=|j|i(a,b)^2\) for essential simple
closed curves on an oriented surface then gives
\[
 i(s_1,s)=i(d,s)^2>0,
 \qquad i(s_k,s)=|k|i(s_1,s)^2>0.
\]
[Farb–Margalit, *A Primer on Mapping Class Groups*, Proposition 3.2,
pp. 72–73](https://www.nzdr.ru/data/media/biblio/kolxoz/M/MD/Farb%20B.%2C%20Margalit%20D.%20A%20primer%20on%20mapping%20class%20groups%20%28draft%2C%20PUP%2C%202011%29%28ISBN%200691147949%29%28509s%29_MD_.pdf)

On the chosen face, thicken the unclipped original bridge in the filled
slab. A regular neighborhood of the disk relative to the face is a ball
meeting the face in a disk neighborhood of the chord and its two end
disks. It contains only this return as a trivial proper arc. Choose the
neighborhood to enclose its drilled tube and avoid the other three tubes,
using the original bridge and a narrow collar along the return. After
drilling, the return piece \(V\) is a solid torus. The frontier of the
ball off the face is a proper disk \(\Delta\subset X\), with boundary
isotopic to \(s\) in \(F\) by the collar between the two circles on the
return side. Extend this boundary isotopy in a collar of \(X\) so that
\(\partial\Delta=s\). The other piece \(Z\) is connected, since \(X\) is
connected and \(V\) attaches along the single disk \(\Delta\). Van Kampen
gives \(\pi_1(X,p_0)=\pi_1(V,p_0)*\pi_1(Z,p_0)\) for \(p_0\in s\).
The return pair of pants lies in \(\partial V\), and the through pair
of pants in \(\partial Z\).

Put \(s_k\) in minimal position with \(s\). Its subarcs between crossings
alternate between the two pairs of pants. Each has its two ends on \(s\)
and is essential, since an innermost boundary-parallel subarc would give
a bigon. Each therefore separates the two port holes in its pair of
pants. Close the arc by paths in \(s\) from and to \(p_0\). Since \(s\)
contracts in \(\Delta\), the choice of these paths makes no difference in
its factor. They can be chosen so the resulting peripheral loop surrounds
exactly one hole, up to conjugacy and orientation. In \(V\) it is a
conjugate of a signed return meridian, a generator of the solid-torus
group. In \(Z\) it is a conjugate of a signed through meridian, nonzero
even in \(H_1(X)\). Each syllable is therefore nontrivial in its own
factor. Multiplying the syllables gives a representative up to conjugacy
of \(s_k\), because the intervening paths from and to \(p_0\) cancel. The
word is nonempty and reduced, so \(s_k\) is nontrivial in \(\pi_1(X)\).
This applies separately below and above with their respective return
pieces \(V\). The disk decomposition works in a reducible slab as well.

To identify the obstruction with the prescribed bridge boundary, let
\(p,q\) be the endpoints of \(b'\) and \(u,v\) the positive common-face
port loops based at \(p,q\), respectively. The curve \(s_k\) is isotopic
to the third boundary of a regular neighborhood of the two port circles
joined by \(b'\). Thus its word is \(u b' v(b')^{-1}\) up to conjugacy and
reversal, with paths in traversal order. For any section \(a:p\to q\)
of the return wall, the annulus identifies its circle fibers, and the
common-face orientations at the two ends are opposite relative to these
fibers. Hence \(a v a^{-1}=u^{-1}\). Setting \(w=b'a^{-1}\) gives
\[
  u b' v(b')^{-1}=u w u^{-1}w^{-1}.
\]
The separator's nontriviality forces \(w\ne1\) for every \(a\), including
the unique winding with zero integral homology. A bridge disk would
null-homotope this loop after clipping the return tube. Neither prescribed
bridge exists, and a simultaneous bridge system containing either one is
impossible.

## Scope and input versions

The twists modify the two chosen chord isotopy classes on the fixed
marked face. If chords may be reselected, the original short chords
still give the simultaneous bridges and the framed four-to-two-to-zero
reduction. The cyclic-cover support has cardinality three for the
original pair, two for the first successor, and one for the returned local
joint pair. These counts distinguish the original and first-successor
nonlocality from the localization after the second subtraction. Other
cuts, tunnel systems and relative smooth trace comparisons have their own
certificates. [Framed subtraction and outlet](FOUR_MARKED_BRIDGE_DISKS.md)
· [Support and closing](FOUR_POINT_SUPPORT_AND_CLOSING.md)
· [Earlier twist with a homological obstruction](FOUR_POINT_TWISTED_CHORDS.md)

Working intake HEAD 14cb1584242225baeccc28674d5a681572ea00ee.
Issue SHA-256 39d36f4e7c25dcc7b8d86700c668e1eb771708c2cb3f45a0e5a966c10d87cde1.
The bridge and earlier twist notes had SHA-256 prefixes 5859f9f3b565
and 48e5a935dc2d. Primary passage inspection covered the cited GST
joint surgery and linking argument and the cited twist intersection
formula. The computations use the two original geometric bridge disks
as input, independently of the proposed general face-slope assertion
in SUR-E02ac.
