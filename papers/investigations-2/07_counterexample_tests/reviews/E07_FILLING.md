# WIT-E07 · Independent replay of the Whitehead filling obstruction

28 November 2026 UTC, 27 November in America/New_York. Prepared for
Edward B. Baker III with OpenAI Codex assistance. Actual serving model
and effort unavailable. Checkout `e171829f1c59a8a1fc66a2f1bd7ff42b2037aa6b`.
The [non-author request R1](../research-progress/handoffs/REQUEST_E07_REPLAYS_R1.md)
has SHA-256 prefix `9af4987d7f633620`. I read
[INV-E08](../../06_invariants_and_candidates/notes/E08_TWO_BELT_KNOT.md)
at `17b7e3b0743ba149` and [WIT-E06](../notes/E06_SURGERY_CONTROL.md)
at `300f2b9e8882f1d1`. The knot-interface passage of
[WEX-E07](../01_examples/notes/E07_TWO_CAPS.md) was read at
`432eb2433d294fd5`. This packet checks the named knot, surgery and
filling argument, with the embedded construction assessed by the
separate geometry replay.

**Disposition.** For the signed \(J=D_+(T_{2,3},2)\) in
Hedden–Ording's convention, \(\tau(J)=0\), \(s_{\mathbb Q}(J)=+2\),
and \(g_4(J)=1\). The positive \(9/2\) surgery correction terms
replay from Tange's formulas and Ni–Wu. They exclude a rational
homology ball filling of the double branched cover. A hypothetical
proper disk in a marked integral homology ball would give a
mod-two homology ball filling. Hence \(J\) has genus one in every
such puncture, including the original marked minus sphere.

## Sign and companion

I checked Hedden–Ording, *The Ozsváth–Szabó and Rasmussen
concordance invariants are not equal*, Amer. J. Math. **130** (2008),
441–453, arXiv:math/0512348v1, Theorem 1.1 and Figure 1, p. 2.
The theorem names the right-handed trefoil and gives both values
of the concordance invariants. Figure 1 labels its box \(t-3\)
full right-handed twists. At \(t=+2\) the box entry is therefore
\(-1\). The \(+2\) designates the satellite relative to the Seifert
framing, while the \(-1\) designates the filled diagram box. Hedden,
*Knot Floer homology of Whitehead doubles*, Geom. Topol. **11**
(2007), 2277–2338, Figure 1 and §2, specifies the Seifert longitude
for the solid torus. His illustration uses the left-handed
companion and supplies the framing convention rather than this
particular diagram. WEX-E07 uses the right-handed Hedden–Ording
diagram with exactly the box entry \(-1\), and its boundary-sum
description retains the same signed \(J\) in the positively marked
model sphere. [Hedden–Ording, p. 2](https://arxiv.org/pdf/math/0512348#page=2)
· [Hedden, pp. 2278, 2288](https://msp.org/gt/2007/11-4/gt-v11-n4-p08-s.pdf)

I checked Tange, *Heegaard Floer homology of Matsumoto's manifolds*,
Adv. Math. **320** (2017), 475–499, author's version arXiv:1504.08202v3
(29 June 2015), §1.1, Figure 2 and Proposition 2 in §3. His \(T_{2,3}\)
is positive and \(D_+\) uses the positive clasp. His polynomial
specializes to \(5-2(t+t^{-1})\) at twist parameter \(2\), with
determinant nine. Proposition 2 is the primary Montesinos
identification used here. It gives the oriented double cover
\[
Y=\Sigma_2(J)=S^3_{+9/2}(T_{2,3}\#T_{2,3}^r).
\]
The superscript \(r\) is reversal of the knot orientation. In
the positive torus model in the unit sphere of \(\mathbb C^2\),
simultaneous complex conjugation is an orientation-preserving
orthogonal transformation taking the parametrization at \(t\)
to that at \(-t\). It is joined to the identity in \(SO(4)\).
This identifies \(T_{2,3}^r\) with the same right-handed oriented
trefoil after isotopy, so the connected sum agrees with WIT-E06.
The sign of the surgery coefficient is the one in Proposition 2.
Reversing the orientation of the resulting manifold changes
correction-term signs but preserves the existence question for
oriented fillings. [Tange, pp. 2, 12](https://arxiv.org/pdf/1504.08202)

## The finite correction-term check

Specialize Tange's \(s=2\) \(V\)-table on p. 14 at his companion
parameter \(p=1\). This gives \(V_0=V_1=1\) and \(V_k=0\)
for \(k\ge2\). His lens formula (4) at \(2r+1=9\) gives
\[
d(L(9,2),i)=\frac{(i-5)^2}{18}
             -\frac12\mathbf 1_{\{i\ {\rm even}\}}.
\]
In the same positive surgery labels, Ni–Wu Proposition 1.6 and
Remark 2.10 subtract twice the maximum of
\(V_{\lfloor i/2\rfloor}\) and \(V_{\lfloor(10-i)/2\rfloor}\).
I recomputed the following entries with exact rational arithmetic.
[Tange, pp. 14, 16](https://arxiv.org/pdf/1504.08202#page=14)
· [Ni–Wu, Proposition 1.6 and Remark 2.10](https://www.its.caltech.edu/~yini/Published/Cosmetic.pdf)

| Surgery label \(i\) | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| \(d(L(9,2),i)\) | \(8/9\) | \(8/9\) | \(0\) | \(2/9\) | \(-4/9\) | \(0\) | \(-4/9\) | \(2/9\) | \(0\) |
| \(d(Y,i)\) | \(-10/9\) | \(-10/9\) | \(-2\) | \(-16/9\) | \(-4/9\) | \(0\) | \(-4/9\) | \(-16/9\) | \(-2\) |

By the meridional surgery relation \(H_1(Y)=\mathbb Z/9\), and
duality gives \(H^2(Y)=\mathbb Z/9\). Tange's even-denominator
spin label is \((9+2-1)/2=5\). The value there is zero, so the
spin correction term alone permits a filling. The group-order
condition \(9\) square also permits it. The extension set is
the obstruction. [Tange, pp. 12–13](https://arxiv.org/pdf/1504.08202#page=12)

For a putative mod-two homology ball \(X\) filling \(Y\),
finiteness and universal coefficients give a rational homology
ball. Its vanishing \(H^1(X;\mathbb F_2)\) and
\(H^2(X;\mathbb F_2)\) give a unique spin structure.
Write \(A=H_1(X;\mathbb Z)\) and \(B=H_2(X;\mathbb Z)\).
Both are finite. The cohomology sequence of \((X,Y)\)
between \(H^1(Y)=0\) and the map from finite \(H^3(X)\) to
\(H^3(Y)=\mathbb Z\), with duality, makes the segment
\[
0\to B\to H^2(X)\to H^2(Y)\to A\to H^3(X)\to0
\]
exact as integral groups. The orders of \(H^2(X),H^3(X)\)
are respectively \(|A|,|B|\). The image in \(H^2(Y)\) and
its quotient each have order \(|A|/|B|\), hence order three.
Since the extending Spin\(^c\) classes are the translate of
this image by the restriction of the filling's spin structure,
their boundary labels are \(\{2,5,8\}\).
Ozsváth–Szabó Proposition 9.9 requires all three correction
terms to vanish. They are \((-2,0,-2)\). The other two cosets
also fail, and Owens–Strle Proposition 4.1 and Lemma 2.1
exclude a general rational homology ball as well. Tange's
Corollary 3 independently excludes \((p,n)=(1,2)\) for
his \(s=2\) family. [Ozsváth–Szabó, Proposition 9.9](https://arxiv.org/pdf/math/0110170#page=67)
· [Owens–Strle, Lemma 2.1 and Proposition 4.1](https://www.maths.ed.ac.uk/~v1ranick/papers/owens.pdf)
· [Tange, Corollary 3](https://arxiv.org/pdf/1504.08202#page=6)

## Disk cover and genus

Let \(D\) be a smooth proper disk in a smooth oriented integral
homology ball \(W\) marked by the outward \(S^3\), with boundary
the marked \(J\). Its normal disk bundle is a product.
Mayer–Vietoris of the bundle and its exterior, glued along
\(D\times S^1\), shows \(H_1\) of the exterior is freely
generated by the meridian. This uses \(H_2(W)=H_1(W)=0\).
The meridian map to \(\mathbb Z/2\) thus gives a connected
double cover, filled across the normal disk by complex
squaring, smooth in the branch charts with the covering
orientation off the disk. The boundary is the double branched
cover of the specified knot under the outward mark.

In a cellular decomposition adapted to the disk, use lifted
cells in the exterior and product radial sectors in the disk
bundle. Each open cell off \(D\) has two lifts and each cell on
\(D\) has one. Over \(\mathbb F_2\) the kernel of cellular
projection is the relative transfer of \(C_*(W,D)\), since
two lifts sum to zero under projection and their faces on
the branch disk cancel in pairs. Thus the mod-two chain
sequence in INV-E08 and WIT-E06 is short exact. The pair
\((W,D)\) is acyclic over \(\mathbb F_2\), because both spaces
are connected and mod-two acyclic. This makes the branched
cover a mod-two homology ball, contradicting the extension
calculation. The argument works with the orientation of the
marked filling and gives the same obstruction for its mirror
by reversing orientation.

The Whitehead Seifert surface has one boundary component and
Euler characteristic \(-1\), from the twisted companion annulus
and the clasp band. Its collar push works in any marked filling
and gives the upper bound one. Rasmussen's Theorem 1 supplies
the standard-ball lower bound from \(s_{\mathbb Q}(J)=+2\).
The native lower bound follows from the disk-cover obstruction.
Each coordinate puncture of a homotopy sphere is an integral
homology ball by excision. Therefore
\(g_{\Sigma}(J)=g_4(J)=1\) for every oriented smooth homotopy
four-sphere with this marking convention. In the named marked
minus sphere the two-belt genus-one surface for \(J\) is an
equality case, while a proper disk for the same boundary is
excluded independently of its belt counts.
[Hedden, genus-one Seifert surface, §6](https://msp.org/gt/2007/11-4/gt-v11-n4-p08-s.pdf#page=52)
· [Rasmussen, Theorem 1 and §4.4](https://arxiv.org/pdf/math/0402131v1)
