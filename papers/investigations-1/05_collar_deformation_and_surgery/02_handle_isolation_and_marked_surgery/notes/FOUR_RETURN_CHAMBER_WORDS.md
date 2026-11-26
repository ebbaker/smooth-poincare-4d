# Chamber words for the mixed and alternating four-port cuts

26 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. Fixed execution packet SUR-E02an in the
[issued request](../../research-progress/handoffs/CAPPED_FACTORS_AND_FOUR_RETURNS_20261126.md),
SHA-256 prefix `6c0be03d8237`, intake HEAD `9c80575988ad`. The selected
helper configuration was GPT-6.2 Sol/ultra. Actual serving model and effort
are unavailable. Smooth oriented slabs, parametrized integral attaching
tubes and the stated seam. This calculates the words for arbitrary arc
interiors with either stated endpoint pairing. The outlet consequences use
the companion trace-group argument.

## Based slab and chamber groups

Cut $Y_1=S^1\times S^2$ along the marked sphere disjoint from the
stationary knot $Q$. Write $W=S^2\times I$ with faces $S_-,S_+$.
Restore every moving tube and carry out the actual stationary filling,
giving $N$. Capping its two spherical faces gives $M=S^3_0(Q)$
for the joint integral $Y_1\to Y_3$ inputs. Both face caps preserve the
fundamental group, so write $G=\pi_1(N)=\pi_1(M)$ using the paths
below. Gluing the faces by the seam gives the stationary-filled inlet
$Z=Y_1\# M$. Van Kampen gives $\pi_1(Z)=G*\langle t\rangle$.
The height character sends $t$ to 1 and $G$ to 0. Its cover is a
stack of copies $N_j$, with the upper face of $N_j$ glued to the
lower face of $N_{j+1}$. The intersections are spheres, so the group
of the cover is $H=*_{j\in\mathbb Z}G_j$, with
$G_j=t^jGt^{-j}$. Indeed finite substacks give the corresponding
finite free products and every loop or homotopy in the stack is compact.
This uses the same orientation of the stack as the earlier mixed
[equivariant calculation](FOUR_PORT_EQUIVARIANT_LINKING.md).

Choose $q_\pm\in S_\pm$ matched by the seam, a path $u:q_-\to q_+$
in $N$, and face whiskers $\eta_i^\pm:q_\pm\to i_\pm$, matched
by the seam. Thus $t=[u]$ after face gluing. Products of paths run
from left to right. Set $u_-=1$ and $u_+=u$. For an oriented
arc $\alpha:i_\epsilon\to j_{\epsilon'}$, use the based class in $G$

$$
 \overline\alpha=[u_\epsilon\eta_i^\epsilon\,\alpha\,
                 (\eta_j^{\epsilon'})^{-1}u_{\epsilon'}^{-1}].
$$

For a return this is the based class of the arc followed by its completion
on the same face. For a through arc it measures the path relative to $u$.
A chamber $j$ arc contributes $(\overline\alpha)_j=t^j\overline\alpha t^{-j}$.
Consecutive face whiskers cancel at each seam. Changing the starting
point on the oriented moving knot or the path to it conjugates the
resulting word. Reversing its orientation inverts the word up to conjugacy.

Here ellipticity means conjugacy into one $G_j$ in $H$, with the
identity included. This is equivalent to conjugacy into $G$ in
$G*\langle t\rangle$ because a conjugator in the latter can be written
as $h t^j$ with $h\in H$. A word of height zero conjugate into
$\langle t\rangle$ must be the identity. The test below uses cyclic
free-product reduction. A cyclically reduced word with length at least
two has powers of unbounded reduced length. The powers of a fixed
conjugate of a single-factor element have uniformly bounded reduced
length. These facts give both directions of the ellipticity test.

## Mixed pairing

Use the orientation and labels of the [mixed issue](../../research-progress/handoffs/FOUR_POINT_MARKED_RETURNS_20261126.md).
The letters below denote the barred classes in $G$.

| Moving arc in oriented order | Letter | Chamber |
| --- | --- | --- |
| $3_-\to1_+$, through | $a$ | $0$ |
| $1_-\to2_-$, lower return | $b$ | $1$ |
| $2_+\to4_-$, through | $c$ | $0$ |
| $4_+\to3_+$, upper return | $d$ | $-1$ |

Based by $\eta_3^-$, the moving class is

$$
 K=a t b t^{-1} c t^{-1} d t=a_0 b_1 c_0 d_{-1}.
$$

If both $b,d$ survive, the word is cyclically reduced after deleting
any trivial $a,c$, and its length is at least two. If both returns are
trivial, the word is $(ac)_0$. If $b=1$ and $d\ne1$, it is
$(ac)_0d_{-1}$, which is elliptic precisely when $ac=1$. If $d=1$
and $b\ne1$, a cyclic rotation reads $(ca)_0 b_1$, with the same
test $ac=1$. In particular the full result is

| Return classes | Condition for ellipticity | Elliptic representative |
| --- | --- | --- |
| $b=d=1$ | All $a,c$ | $(ac)_0$ |
| $b\ne1, d=1$ | $ac=1$ | $b_1$ |
| $b=1, d\ne1$ | $ac=1$ | $d_{-1}$ |
| $b\ne1, d\ne1$ | Impossible |  |

Equivalently, ellipticity here means that at most one of the three
chamber retractions of $K$, with values $ac,b,d$, is nonidentity.
The class $ac$ is the central completion of the through arcs, joining
them by an upper $12$ chord and a lower $34$ chord. The extreme
chambers isolate the individual returns. The exact identity test is
$b=d=1$ and $ac=1$.

## Alternating pairing

Use the oriented cycle $1\to2\to3\to4\to1$ of the issued alternating
pairing. Start on its upper $41$ return so the next chamber is $1$.

| Moving arc in oriented order | Letter | Chamber |
| --- | --- | --- |
| $4_+\to1_+$, upper return | $a$ | $0$ |
| $1_-\to2_-$, lower return | $b$ | $1$ |
| $2_+\to3_+$, upper return | $c$ | $0$ |
| $3_-\to4_-$, lower return | $d$ | $1$ |

Based by $u\eta_4^+$, the moving class is

$$
 K=a t b t^{-1} c t d t^{-1}=a_0 b_1 c_0 d_1.
$$

If all four letters survive, this is cyclically reduced of length
four. Once at least one is trivial, combine the opposite letters in
the other chamber, cyclically rotating when needed. The surviving
word is conjugate to a product of at most two syllables, the products
$ac$ and $bd$ in their two chambers, up to a cyclic permutation
within each product. It is elliptic precisely when one product is
the identity. The exact cases are

| Number of nonidentity letters | Condition for ellipticity | Elliptic representative |
| --- | --- | --- |
| $4$ | Impossible |  |
| $3$ | The two on the same face are mutual inverses | The sole nonidentity return on the other face |
| $2$ | Both occur on the same face | Their oriented product in that chamber |
| $1$ | Always | The nonidentity letter in its chamber |
| $0$ | Always | $1$ |

In particular the exact identity test is $a=c=1,\ bd=1$ or
$b=d=1,\ ac=1$. The retractions by themselves only see $ac$ and
$bd$. Even if both are trivial, the word can be hyperbolic. Taking
$c=a^{-1}$ and $d=b^{-1}$ with $a,b\ne1$ leaves the cyclically
reduced commutator of $a_0$ and $b_1$.

## End chords and geometric scope

An arbitrary face chord completing a given return may replace the
whisker connector. After restoring the moving tubes, both paths
between the same endpoints lie on the same $S^2$ and are homotopic
relative to the endpoints. This also applies to the two end chords
in the mixed through completion. Sliding an endpoint adds its track
on the restored face. Tracks around the old cuffs and wall-section
windings disappear in $N$ because the meridian bounds a disk in the
restored tube. Thus the capped class with a fixed base convention
is unchanged. Choosing a different base convention can conjugate
it. To compare two return classes on a single face, use the common
face whiskers so the equality $ac=1$ or $bd=1$ is a based comparison.
The two individual free conjugacy classes alone do not test that equality.

A change $u'=hu$, $h\in G$, gives $t'=ht$ and replaces a
barred arc by $h^{s(\epsilon)}\overline\alpha h^{-s(\epsilon')}$,
where $s(-)=0$, $s(+)=1$. In the mixed table this gives
$(a h^{-1},b,h c,h d h^{-1})$, preserving $ac$ and the identity
tests on the returns. In the alternating table it conjugates $a,c$
by the same $h$ and preserves $b,d$. Substituting $t'$ cancels
these changes in the mixed based word and conjugates the alternating
based word by $h$, in agreement with its new basing path.

For a true integral rank-three free outlet and nontrivial $Q$, the
[trace-group calculation](TRACE_GROUP_ELLIPTICITY.md) gives a
nonidentity elliptic moving class. On a mixed cut, both capped returns
therefore cannot survive. If exactly one survives then the through
completion is trivial. If both returns are trivial then the through
completion survives. On an alternating cut, at least one capped
return is trivial and three can survive. In the issued ribbon diagram
the two lower returns are opposite sides of the untwisted ribbon.
Its boundary runs along both oriented returns and the two lower
short edges $23$ and $41$, so it gives the based relation $bd=1$.
The shallow upper $23$ return has $c=1$. Each of the other three
returns completes to a parallel of the Figure 5 unknot $U$, allowing
inversion and conjugation. Its class survives in square-knot zero
surgery by the earlier [nonseparating fiber witness](ONE_MOUTH_RETURN_WORD.md#one-finite-quotient-detects-every-lower-word),
which uses GST Lemma 6.2(3) and Corollary 6.4. The chamber word
reduces to $a_0$. The [ribbon packet](ALTERNATING_RIBBON_TRACE.md)
owns the native framing, outlet and geometric trace checks.
[Gompf–Scharlemann–Thompson, Figure 5 and §6](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-s.pdf)

For stationary $Q$ the unknot, the companion calculation with the
same true outlet gives $K=1$. The exact identity tests above then
apply. In particular both mixed returns and the through completion
are trivial, and at most two alternating returns survive. Any two
that do survive occupy the same face with inverse based classes.

There is a forgetful map from the actual stationary-filled drilled
slab to $N$. A bridge for any actual chord and wall section has a
clipped boundary trivial in the drilled slab, hence its capped
return class is trivial in $G$. Thus any surviving return class
rules out every such bridge on that return, even when the interior
of a proposed disk may cross the stationary filling core. A trivial
capped return class gives an endpoint-relative homotopy in $N$ to
any given face chord. To obtain a geometric bridge one still needs a
disk in the drilled slab on the clipped boundary for an admissible
wall section. There the return meridians and other moving-strand
obstacles remain. For instance, [twisted prescribed chords](FOUR_POINT_TWISTED_CHORDS.md)
in the actually bridged mixed fixture preserve capped triviality
while obstructing every wall winding on the changed specified chords.
The old chords still work when the face chords may be chosen freely.
The [double Whitehead specimen](../../reviews/WHITEHEAD_MIXED_RETURNS_20261126.md)
shows that its capped-trivial upper return can still require two
stationary-core passages. The chamber calculation leaves existence
of a freely chosen geometric bridge to the marked drilled-slab test.

The calculations above use the working copies of
[equivariant linking](FOUR_PORT_EQUIVARIANT_LINKING.md) `6042e3619b0b`,
[Figure 5 return word](ONE_MOUTH_RETURN_WORD.md) `3aa7c08f1852`, and
[the twisted-chord control](FOUR_POINT_TWISTED_CHORDS.md) `48e5a935dc2d`.
Published GST Figure 5, Lemma 6.2 and Corollary 6.4 were checked for this
packet.
