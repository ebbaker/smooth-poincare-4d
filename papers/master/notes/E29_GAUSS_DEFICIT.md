# SP4-MASTER-E29 · The sharp Gauss determinant contribution to the chiral deficit

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded execution of the
[frozen E29 request](../research-progress/handoffs/E29_GAUSS_DEFICIT.md).
Requested GPT-6.2 Sol/ultra. Actual serving model and reasoning effort
were unavailable to this helper. Master input commit
`b3cd11a2b839b6d2cb6262f8210f33d19d6f5a0a`, main TeX SHA-256 prefix
`c8a9f68da492`. The [E23 input](E23_IMMERSION_ENTRY.md) has SHA-256
`e1e3245bd95e40a4c4a63ace2f7cf41a02be44fc50773fdc4294a1a14e028b06`.
The pointwise result is an exact algebraic inequality. Its global use
takes the height recognition implication from the
[E26 return](../reviews/E26_FOUR_CRITICAL_HEIGHTS.md).

## Sharp pointwise inequality

Let $A$ be the shape operator of an oriented Riemannian hypersurface
in $\mathbb R^5$. Write $C=A^\circ$ for its trace-free part, and use
the real operator Hilbert–Schmidt norm for $W^+$. If $k_1,\ldots,k_4$
are the principal curvatures, set
\[
 x=\tfrac12(k_1+k_2-k_3-k_4),\qquad
 y=\tfrac12(k_1+k_3-k_2-k_4),\qquad
 z=\tfrac12(k_1+k_4-k_2-k_3).
\]
The Gauss curvature operator has sectional entries $k_i k_j$.
Its chiral block has the three diagonal entries given by half the
opposite-pair sums, and $R/12$ is subtracted for the Weyl block.
In the notation above the resulting Weyl eigenvalues are
$(x^2-N/3,y^2-N/3,z^2-N/3)/2$, where $N=|C|^2=x^2+y^2+z^2$.
Thus the deficit in [E23, (2)](E23_IMMERSION_ENTRY.md) is
\[
 D=\tfrac16|C|^4-|W^+|_{\mathrm{HS}}^2
   =\tfrac12(x^2y^2+x^2z^2+y^2z^2) .
\]
The same identity holds for $W^-$.

**Proposition.** For all real principal data,
\[
 D\ge\tfrac89(-\det A)_+ .
 \tag{1}
\]
If $\det A<0$, equality holds precisely for positive multiples of
$(-1,3,3,3)$ up to permutation and simultaneous reversal of the
principal signs. If $\det A\ge0$, equality holds precisely when
the four principal data can be grouped into two equal pairs,
including the all-equal case.

For $\det A\ge0$, the formula for $D$ proves the assertion.
Equality is equivalent to at most one of $x,y,z$ being nonzero.
Inverting the variables for $C$ identifies this with two pairs.
Conversely two pairs give a nonnegative determinant and $D=0$,
also when one pair vanishes.

If $\det A<0$, all four principal curvatures are nonzero.
Simultaneous reversal changes neither side, so assume one
negative and order the other three. Write them as
$(-a,t,b-h,b+h)$ with $a,t>0$, $0\le h\le b-t$.
Put $p=a+t$ and $r=2b+a-t\ge p$. Then the three Hadamard
coordinates in the displayed order are
$-r/2,-p/2-h,-p/2+h$, and
\[
 D=\frac{r^2p^2}{16}+\frac{p^4}{32}
       +\frac{h^2(r^2-p^2)}4+\frac{h^4}{2},
 \qquad (-\det A)=at(b^2-h^2).
\]
At fixed $a,t,b$, setting $h=0$ decreases the numerator and
increases the positive denominator, strictly in the ratio if
$h>0$. In the remaining case put $\ell=a/t>0$, $v=t/b\in(0,1]$
and $B=2(\ell-1)^2+(\ell+1)^2>0$. Then
\[
 \begin{aligned}
 \frac{D}{-\det A}
 &=\frac{(\ell+1)^2}{32\ell}
           \big[8+8(\ell-1)v+Bv^2\big]\\
 &=\frac{(\ell+1)^2B}{32\ell}
         \left(v+\frac{4(\ell-1)}{B}\right)^2
       +\frac{(\ell+1)^4}{4\ell B}.
 \end{aligned}
\]
The last term is at least $8/9$ because
\[
 9(\ell+1)^4-32\ell B=(3\ell^2-10\ell+3)^2 .
\]
Equality in that term requires $\ell=1/3$ or $3$. Equality in
the first square requires $v=4(1-\ell)/B$, so $\ell=3$ is
excluded and $\ell=1/3$ gives $v=1$. With $h=0$ this is
exactly the asserted principal ratio. For $(-1,3,3,3)$ itself
one has $|C|^2=12$, $W^+=0$, and $\det A=-27$, giving
$D/(-\det A)=24/27=8/9$. Such principal data occur at a point
of a Euclidean graph with zero slope and the prescribed Hessian.
This proves sharpness in the hypersurface category.

## Integrated thresholds

Let $F:M\to\mathbb R^5$ be a smooth immersion of a closed
oriented smooth homotopy four-sphere, with the induced metric $g$.
All integrals are on $M$ in $dV_g$ and thus count distinct
preimages separately in the presence of ambient overlaps.
Write
\[
 X=\|C\|_{L^4(g)}^2,\quad
 J=\int_M(-\det A)_+\,dV_g,\quad
 \omega=|S^4|=8\pi^2/3,\quad
 X_Y=\tfrac{32}{3}\sqrt{\operatorname{Vol}(B^4)}
            =\tfrac{32\pi}{3\sqrt2}.
\]
Equation (1) integrates to
\[
 E_+(g)\le X^2/6-\tfrac89 J .
 \tag{2}
\]
Both chiralities have equal density for a hypersurface. The
signed Gauss integral is $\omega$ by degree one. E26 obtains
$J\ge\omega$ on a hypothetical nonstandard smooth type using
the exact average Morse height count $2+4J/\omega$ and recognition
for a Morse height with at most four critical points.

[E23, (4)](E23_IMMERSION_ENTRY.md) gives $Y([g])>0$ for $X<X_Y$
from Brendle's codimension-two inequality on the induced domain
after adjoining a flat normal direction. It also gives the
sharper sufficient penalty
$P=\|(|C|^2-H^2/12)_+\|_2<X_Y$, with $H=\operatorname{tr}A$.
The inequality used is Corollary 2 with the trace mean curvature
normalization of §2. Its proof uses the contact map on the
normal bundle of the domain and the area inequality with
multiplicity, as checked in E23.
[Brendle, J. Amer. Math. Soc. 34 (2021), 595–603, Corollary 2 and §2](https://par.nsf.gov/servlets/purl/10232897)

The penalty also gives $Y([g])>0$ at $X=X_Y$. In fact, for a
nonumbilic closed connected immersion there is a nonempty open set
where both $H$ and $C$ are nonzero. Otherwise $A=(H/4)\operatorname{Id}$
throughout $\{H\ne0\}$, and the Euclidean Codazzi equation on this
open set forces $H$ to be constant on each component. Each such
component is then closed in $M$ by continuity and the local
connectedness of the open set. There is at least one component,
since $H\equiv0$ would make all Euclidean coordinate functions of
$F$ harmonic on a compact manifold and hence constant. Connectedness
would therefore make $M$ totally umbilic, a contradiction.
It follows that $P<X$ for every nonumbilic immersion. A totally
umbilic immersion has $X=0$.

For clarity, if only a constant $c$ in place of $8/9$ were known
in (1), the combined estimate on the nonstandard type would be
\[
 E_+(g)\le X^2/6-\tfrac83 c\pi^2 .
\]
Here $X_Y^2/6=(256/27)\pi^2$. For $X<X_Y$, the sufficient
condition to get $E_+<8\pi^2$ throughout that range is
$c\ge5/9$. At the sharp value $c=8/9$, (2) instead gives the
following closed endpoint statement on the nonstandard type:
\[
 X\le X_Y\quad\Longrightarrow\quad
 Y([g])>0,\qquad E_+(g)\le\tfrac{64}{9}\pi^2<8\pi^2 .
 \tag{3}
\]
For $X<X_Y$ the energy bound in (3) is strict at
$64\pi^2/9$. Thus the fixed entry margin at the closed
endpoint is at least $8\pi^2/9$. Energy itself would allow
$X<4\sqrt{35}\,\pi/3$ if positivity were supplied separately
and $J\ge\omega$. In any supplied positive class the smooth
volume-one Yamabe representative preserves the chiral energies.

For direct recognition, $J\ge\omega$ in (2) implies
\[
 X\le\frac{2\sqrt{86}}3\pi
       \quad\Longrightarrow\quad
       E_+(g)\le 4\pi^2,qquad Y([g])>0 .
 \tag{4}
\]
The scalar inequality follows because this threshold is strictly
below $X_Y$. For a closed homotopy four-sphere the full Weyl
tensor integral is $8E_+$ and $\chi=2$, so the strict case of
(4) enters Chang–Gursky–Yang Theorem A. Simple connectivity
excludes $\mathbb{RP}^4$. At equality Theorem B excludes the
remaining smooth types, since $\mathbb{CP}^2$ has nonzero second
homology and a manifold covered by $S^3\times S^1$ cannot be
simply connected. Both theorems assume positive Yamabe sign.
Together with E26 on the $J<\omega$ branch, (4) recognizes the
standard smooth type whenever a supplied immersion satisfies
$X\le2\sqrt{86}\,\pi/3$, including equality.
[Chang–Gursky–Yang, Publ. Math. IHÉS 98 (2003), Theorems A and B and norm Remark 2, pp. 107–108](https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf)

At the full Yamabe threshold, direct recognition by this comparison
with just $J\ge\omega$ would require $c\ge37/18$. The sharp value
rules that out. A sufficiently larger measured $J$, namely
$J\ge (37/6)\pi^2$, gives $E_+\le4\pi^2$ for all $X\le X_Y$
by (2).

A formal weighted example tests the scope of this last comparison.
Take principal data $(-1,3,3,3)$ with weight $\omega/27$,
$(1,1,0,0)$ with weight $6e$, and $(1,1,1,1)$ with weight $2\omega$,
where $e$ is a prescribed nonnegative energy. Then the signed
determinant is $\omega$, its negative part is $J=\omega$, and
(2) has equality with $E_+=e$ and $X^2=(16/3)\omega+6e$.
For $e=5\pi^2$, this gives $X<X_Y$ and $E_+>4\pi^2$. These are
algebraic data with weights. No actual immersed homotopy sphere
with these data is asserted. They show that the pointwise
identities together with the signed and negative-part determinant
integrals do not imply recognition throughout the Yamabe range.

The estimate (3) improves the sufficient entry range of E23.
A realization on each prescribed smooth type with controlled $X$
is still needed. The pointwise result controls the deficit in
terms of the negative determinant and by itself supplies no such
immersed realization.
