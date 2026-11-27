# E74 · All marked integer slopes and the alternate odd framing

27 November 2026 UTC. Prepared for Edward B. Baker III with OpenAI
assistance. Actual model and effort unavailable. Input checkout
bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0, [marked underlying lens
core](../notes/MARKED_LENS_CORE.md), [E54 peripheral
relations](../notes/E54_UNDERLYING_SLOPES.md), the marked [E68
Alexander calculation](../notes/E68_CROSSING_ALEXANDER.md), and
[E69 torsion transport](E69_COVER_TORSION.md). The last two
working SHA-256 prefixes are 32db148ec2a35f1d and 01f6268cf85585b2.
The argument is analytical for the actual marked smooth oriented three-dimensional
link exteriors and their indicated covers.

Among all integer slopes $a+s\mu$, only $s=-1$ gives determinant one
for the smooth double branched cover of the lifted singular knot.
Consequently $s=-1$ is the sole cyclic-group candidate, with candidate
group $C_8$. It represents the same odd normal-framing class as the
basic slope $s=1$. The second basic group and all other odd-slope
groups are infinite. The only possible odd-dihedral group occurs at
$s=0$, with candidate order six. At $s=-1$ the smooth branch cover is
an integral homology sphere, and its fundamental group remains to
be determined.

## The determinant formula for a general primitive slope

Use the link $L=S_0\cup U\subset S^3$ from the basic meridional
filling, with the unknot $U$ and oriented linking number $+3$.
Write $a$ for its positive meridian, $\lambda_U$ for its preferred
zero longitude, and $\sigma$ for the meridian of $S_0$. In the
two-component exterior $[\lambda_U]=3[\sigma]$ and
$\mu=-3a-\lambda_U$. Thus the marked slope $a+s\mu$, up to overall
sign, is
\[
 n a+s\lambda_U,\qquad n=3s-1,\qquad p=|n|.
\]
It is primitive for all integers $s$, and its underlying filling
is the lens space of order $p$ given by $(3s-1)/s$ surgery on $U$,
with the meridional convention when $s=0$. The retained singular
knot has class $3[a]$ in its cyclic ambient group, hence has a
single lift $K_s$ in the ordinary universal $p$-fold cover $S^3$
because $\gcd(3,p)=1$. [Marked lens core and covering lattice](../notes/MARKED_LENS_CORE.md#the-remaining-singular-knot-and-its-cyclic-lifts)

Let $D(y)=\Delta_L(-1,y)$ in the sign and reciprocity normalization
from E69, so
\[
 D(y)=7-5(y+y^{-1}).
\]
On the unfilled link exterior take the rank-one characters
$\chi_y(\sigma)=-1$, $\chi_y(a)=y$. The filling on $U$ permits them
exactly when $y^n=(-1)^s$, equivalent to $y^p=(-1)^s$. They differ
by the characters of the order-$p$ ordinary lens deck group.
Their restrictions to the knot exterior of $K_s$ are the
sign character, since a lift of the old meridian still maps
to the old meridian. Induction is their direct sum.
The Fourier basis is the same change of basis on each cell,
so its possible scalar factor cancels by the zero Euler
characteristic. [E69 based induction and gluing](E69_COVER_TORSION.md#induction-gluing-and-the-integral-unit)

Choose a complementary slope $u a+v\lambda_U$, so $nv-su=\pm1$.
The core character of the attached solid torus is
$w=(-1)^v y^u$, up to inversion. It obeys
\[
 w^p=(-1)^{p v+s u}=-1
\]
since $p\equiv n\pmod2$. Moreover $\gcd(u,p)=1$ by the same
Bezout equation, so all $p$ roots of $-1$ occur as core values.
In particular each attached core and boundary torus is acyclic
in this local system. The unfilled exterior torsion is
$\Delta_L(-1,y)$ at each character, with no extra Alexander
factor since the link has two components. These specializations
are all nonzero: if $D(y)=0$, the root of unity $y$ would give
the rational nonintegral algebraic integer $y+y^{-1}=7/5$.

Use the convention that the circle with character $w$ has
torsion $(w-1)^{-1}$. At each filling the boundary torus has
torsion of modulus one and the solid torus contributes the
core factor. Over all characters these factors multiply to
\[
 \prod_{w^p=-1}|w-1|^{-1}=\frac12.
\]
The twisted exterior sign torsion has modulus equal to half
the order of the homology of its smooth double branched knot
cover. Therefore the exact determinant formula is
\[
 \boxed{\quad
 |\!H_1(\Sigma_2(K_s);\mathbb Z)\!|
 =\prod_{y^p=(-1)^s}|7-5(y+y^{-1})|
 \quad} .
\]
This uses the regular new core of the actual native slope.
It branches only along the old lifted singular knot in $S^3$.
[Turaev, Theorems 0.2.3, 1.1.1–1.1.3 and Lemma 1.3.3](https://www.mathnet.ru/eng/rm1971)
· [Mayberry–Murasugi, §11, branched-cover homology order](https://doi.org/10.1090/S0002-9947-1982-0648083-1)

## Solving the determinant-one condition

If $s$ is even, $p$ is odd and the character set includes
$y=1$. This factor is $D(1)=-3$. The product over the
other $p$-th roots of unity is an integer, because $D(y)$
is an integral Laurent polynomial and the remaining full
root set is stable under all Galois conjugations. It is
nonzero by the algebraic-integrality argument above. Thus
the absolute determinant is divisible by three.

Now suppose $s$ is odd. Then $p=2d$ for a positive integer
$d$, and $y^p=-1$. Put
\[
 \alpha=\frac{7+i\sqrt{51}}{10},\qquad
 \beta=5\alpha=\frac{7+i\sqrt{51}}{2}.
\]
The roots $\alpha,\bar\alpha$ have modulus one,
$\beta+\bar\beta=7$ and $\beta\bar\beta=25$. Factor
$D(y)=-5y^{-1}(y-\alpha)(y-\bar\alpha)$. As $p$ is even,
the product of the $p$ roots of $y^p=-1$ is one. Hence
\[
 \prod_{y^p=-1}D(y)
 =5^p(1+\alpha^p)(1+\bar\alpha^p)
 =\beta^p+\bar\beta^p+2\cdot 5^p
 =(\beta^d+\bar\beta^d)^2 .
\]
Every factor is real and the product is strictly positive.
Write $u_d=\beta^d+\bar\beta^d$. It obeys
$u_0=2$, $u_1=7$, and $u_{d+2}=7u_{d+1}-25u_d$.
Modulo seven this forces $u_d\equiv0$ for odd $d$.
Such a determinant cannot be one.

For even $d=2m$, the squared roots have trace $-1$ and
norm $625$. Thus $w_m=(-1)^m u_{2m}$ is the trace power
of the two roots with sum $1$ and product $625$. For
$m\ge1$ expand the logarithmic derivative
$-z(\log(1-z+625z^2))'$ to get
\[
 w_m=1+
 \sum_{k=1}^{\lfloor m/2\rfloor}
 (-625)^k\,\frac{m}{k}\binom{m-k-1}{k-1}.
\]
For $m\ge2$ the $k=1$ term is $-625m$, of
$5$-valuation $4+v_5(m)$. For every term with $k\ge2$ the
valuation is at least $4k+v_5(m)-v_5(k)$, strictly greater
than $4+v_5(m)$. Hence
\[
 v_5(w_m-1)=4+v_5(m)\qquad(m\ge2).
\]
This excludes $w_m=1$, and $w_m\equiv1\pmod5$ excludes
$w_m=-1$. The only surviving case is $m=1$, where
$u_2=-1$. This is precisely $d=2$, $p=4$, and $s=-1$,
the only integer solution of $|3s-1|=4$.

| Marked slope | Underlying orbifold space | Branched homology order |
| --- | --- | ---: |
| $s=-1$ | $+4$ surgery on the unknot | $1$ |
| $s=0$ | $S^3$ | $3$ |
| $s=1$ | $\mathbb{RP}^3$ | $49$ |

An exact finite check for $-4\le s\le4$ used the determinant of
$7I-5(T+T^{-1})$, with $T$ the integral signed cyclic shift
satisfying $T^p=(-1)^sI$. It agrees with these orders and the
recurrence on all tested slopes.

## Group consequences and the alternate slope

Set $G_s=\pi_1^{\mathrm{orb}}(O(a+s\mu))$. The first covering
kernel is the orbifold group of $(S^3,K_s;2)$ and has index
$p$ in $G_s$. The deep kernel is
$\pi_1(\Sigma_2(K_s))$. It has index two in that covering
group and is characteristic there because the old meridian
parity is its unique nonzero character to $C_2$.
Thus it is normal in $G_s$, with a quotient of order $2p$.
The native abelianization is $C_{2p}$ by E48, so the quotient
of order $2p$ is cyclic. In particular $G_s$ is cyclic
exactly when the smooth branch cover has trivial fundamental
group. One direction follows because a cyclic $G_s$ is
equal to its abelianization and then has order $2p$. In the
other direction the deep kernel is trivial, giving exactly
the quotient of order $2p$. The determinant-one test is
only necessary. At $s=-1$ it proves that the smooth branched
cover is an integral homology sphere. Triviality of that
sphere's fundamental group remains unproved. Equivalently, the
marked recognition test is to show that $K_{-1}$ is an unknot,
by elliptization and linearization of the branch involution.
For nontrivial odd-dihedral groups the abelianization has
order two, so the only possible slope is $p=1$, namely
$s=0$. Since the smooth branch cover then has homology of
order three, an actual odd-dihedral group would have order
six. [E48, native abelianization](../notes/E48_LINK_SURGERY.md#4-abelianization-downstairs-with-the-regular-new-core)
· [Marked covering tower](../notes/MARKED_LENS_CORE.md#the-remaining-singular-knot-and-its-cyclic-lifts)
· [E65, linearized involution](E65_SIMULTANEOUS_CYCLIC.md#what-the-two-cyclic-assumptions-would-give)

For odd $s$ the cyclic deck quotient $C_{2p}$ of the deep
cover contains an order-four element whose square is the
branch involution. Thus the E69 pairing argument applies
at every such slope. The first homology of the smooth
branch cover is $B\oplus B$ with finite odd $B$: at an inert
odd prime the order-four action yields a module over the
unramified quadratic ring, and at a split prime the two
eigensummands are perfectly paired by torsion linking.
If the determinant exceeds one, some odd primary part
is noncyclic. The odd Sylow subgroups of a free spherical
three-dimensional group are cyclic, so elliptization
excludes a finite group for that smooth branch cover.
Consequently $G_s$ is infinite for every odd $s\ne-1$.
[E69, degree-four symmetry and elliptization](E69_COVER_TORSION.md#the-degree-four-symmetry-and-the-infinite-group-consequence)

In the local product $S^1_f\times S^1_a\times D^2$ used for
the marked section, one can rotate the oriented normal
disk by $s$ turns along $S^1_a$. This changes the induced
base slope to $a+s\mu$. On the normal real three-plane
of the section it changes the framing by $s\bmod2$
in $\pi_1 SO(3)$. Thus $s=-1$ and $s=1$ represent the
same odd framing of the original four-dimensional
circle surgery. The two orbit orbifolds differ because
the intermediate construction retains the actual
integer slope. Testing $s=-1$ along with $s=0$ covers
both framings at the level of this local construction.
The determinant test establishes no four-dimensional
smooth recognition for the remaining candidates.
[E39 marked local construction](../notes/E39_PRISM_FILLINGS.md#the-canonical-suspension-and-the-actual-marked-torus)
· [Jabłonowski, §8.1, Lemma 8.3 and Proposition 8.4](https://arxiv.org/abs/2609.29839)
