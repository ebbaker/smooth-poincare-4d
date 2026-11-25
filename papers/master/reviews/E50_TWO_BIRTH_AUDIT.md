# SP4-MASTER-E50 · A two-birth height and its actual framed link

25 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI
Codex assistance. Bounded independent E execution of the proposed
[E49 model](../research-progress/handoffs/MARKED_TESTS_20261125.md).
Actual serving model and reasoning effort were unavailable. The
mathematical baseline is `2689540e6dae1656b7f5ad4be52504db044995f2`.
The frozen [immersion section](../manuscript/immersion_entry.tex) at
that commit has SHA-256 `512ef85cfa696497da0b43e6efee36c4c60dd1f7d1eb78f4442b6d078a0b2c8e`.
The working inputs [E36](../notes/E36_MARKED_HEIGHT.md) and
[E37](../notes/E37_GRAPH_HANDLE.md) have SHA-256
`33bcac0c687b219107002d80c6e722ce1bc64d1d7b7fe1efe2a09ec795c711e5`
and `008bea06b958d5cb6286a2fe3560546c44320c72c3a0e45f2516d6cae30b2785`,
respectively.

The [completed E49 note](../notes/E49_TWO_BIRTH_HEIGHT.md) was
checked at working SHA-256
`14c4187216c8602fa7e9a24b3e844c4d4a12420b683f19d9fea2e1d50b733294`.
Its cubic construction passes the cutoff, global embedding, common
level, framing and energy checks. The separate elementary
realization below also gives the proposed height on one
embedded standard $S^4$, with counts $(1,0,2,2,1)$, two disjoint
marked zero-framed unknots in a common actual $S^3$ level, and induced
chiral energies of order at most $r^4$. The height can already have
both index-two values below both index-three values.

## Direct checks of the E49 cubic construction

In the polynomial coordinates the cutoff annulus is compact and
avoids the sole zero of $D(Q+v^3)$. The perturbation of that
differential is $O_d(a^2)$ uniformly in the path parameter. In
the interior the axial equation is
$3v^2+3(1-2\tau)a^2=0$, and both roots after the birth lie in
the inner ball. Outside the cutoff the axial derivative
$3(v^2+a^2)$ stays positive. The affine-height conjugacy is a
global diffeomorphism at each fixed $a>0$. This proves the
absence of extra critical points, including the matching bands.
The common parameter has two simultaneous elementary
births at $\tau=1/2$. If a generic path with one birth at a time
is required, reparametrize the disjoint insertions on different
time intervals. The height and the energy estimates at the
endpoint are unaffected. [Borodzik–Powell–Teichner, *Link
Concordance Implies Link Homotopy*, §3.5, (3.5.1)](https://www.maths.gla.ac.uk/~mpowell/link-conc-implies-link-homotopy.pdf)

Put $D=3a_{\max}^3$ for the normalized gap between the incoming
level and zero. For each local $a=a_j$, $D/a^3\le3(1.1)^3<4$,
$C_a(-3a)=-18a^3$ and $C_a(-2a)=-2a^3$. Consequently $C_a+D$
has a unique simple root in $(-3a,-2a)$, and stays positive
from just beyond that root through $v=a$. The disk described
in E49 is smooth at its collapsed root. Its maximal radius is
$O(a_{\max}^{3/2})$, so all the actual disks and attaching
tubes lie inside the uncut cubic region. At the boundary circle
$C_a'(a)=0$, and the two tube vectors agree, up to positive
rescaling and order, with $\partial_v$ and $\partial_y$.
The latter is tangent to the actual incoming level and normal
to the disk along its whole length. This certifies the
zero-framing by a disk-disjoint push-off. Small smooth regular
neighborhoods of the two disks are disjoint balls in the same
actual $S^3$. The lower and upper critical values already
lie on opposite sides of zero. Thus the circles in that lower
level are the actual split framed link before either index-two
attachment.

In the E49 intermediate level, on $x=0$ the descending flow has
$\dot v=3(a^2-v^2)$ and $\dot y=-2y$. Thus every point on the
displayed belt circle tends to $(0,a)$ through the cubic core.
On $y=0$ the ascending flow has $\dot v=3(v^2-a^2)$ and
$\dot x=-2x$. The displayed attaching sphere tends to $(0,-a)$.
Their only common point is the origin, where the two tangent
spaces span the three-dimensional level. The formula for the
upper framing uses
$C_a(v)=2a^3-(v+a)^2(2a-v)$ near $v=-a$.
The regular level transports respect the product structure
on the clean exterior of the boxes. The global angular charts
also have uniform derivative control at fixed $a_j$. The
induced curvature bound and the volume of both cutoff regions
therefore give the stated $O(r^4)$ energy, uniformly along
the path, and the subcritical zero-Yamabe wall applies to it.

## A product birth with a controlled cutoff

Use coordinates $(t,y)=(t,y_-,z)\in[-1,1]\times\overline B^3_1$,
with $y_-\in\mathbb R^2$ and $z\in\mathbb R$. The unperturbed
height is $t$. Fix smooth cutoffs $0\le\eta,\beta,\alpha\le1$.
The cutoff $\eta$ is one for $|t|\le1/2$ and zero for
$|t|\ge3/4$. The cutoff $\beta$ is one for $|y|\le1/2$ and
zero for $|y|\ge3/4$. The cutoff $\alpha$ is one for $|y|\le
1/8$ and zero for $|y|\ge1/4$. Put
$q(y)=\varepsilon(-|y_-|^2+z^2)$ and take $\varepsilon>0$
small enough that $|\eta'(t)\beta(y)q(y)|<1/4$ and
$|\eta(t)\beta(y)q(y)|<1/16$.

Choose a smooth even bump $\zeta\ge0$ supported on
$[-1/2,1/2]$, with $\zeta(0)=1$, $\zeta''(0)<0$ and
$\zeta'(s)<0$ for $0<s<1/2$. Choose a smooth nonzero even bump
$b\ge0$ supported where $2/3<|s|<5/6$. Take $d>0$ so that
$\int_0^1(-2\zeta+db)\,ds=0$, and set

$$
u_\delta(t)=\int_0^t [1-2\zeta(s/\delta)+d b(s/\delta)]\,ds,\qquad
w_\delta(t)=u_\delta(t)-t .
$$

Then $u_\delta$ is odd, equals $t$ for $|t|\ge\delta$, and
$\|w_\delta\|_\infty\le C\delta$. Its derivative has exactly two
simple zeros at $t_\pm=\pm\delta s_*$, where
$\zeta(s_*)=1/2$ and $s_*>0$. It has a local maximum at $t_-$
and a local minimum at $t_+$. In particular $u_\delta(t_+)<0$
and $u_\delta(t_-)=-u_\delta(t_+)>0$. Define

$$
F_\delta(t,y)=t+\eta(t)\beta(y)q(y)+\alpha(y)w_\delta(t).
\tag{1}
$$

It equals $t$ on a neighborhood of the entire cylinder boundary.
Take $\delta$ sufficiently small that $\delta<1/4$,
$\|w_\delta\|_\infty<1/16$, and
$\|w_\delta\|_\infty\|D\alpha\|_\infty<2\varepsilon/8$.
Outside the support of the birth term $\partial_tF_\delta>3/4$.
On its support $\eta=\beta=1$. In the annulus
$1/8\le|y|\le1/4$ use $|Dq|=2\varepsilon|y|$ to exclude a
zero of the transverse derivative. Inside $|y|\le1/8$ any
critical point has $y=0$. The only remaining zeros are the two
points on the axis at $t_\pm$, with indices three at $t_-$
and two at $t_+$. These estimates cover the transition regions,
including their boundaries by smoothness. The image lies between
the bottom and top values $-1$ and $1$, with equality only on the
corresponding end faces.

For an actual one-parameter birth, ramp the term
$\eta\beta q$ from zero first, keeping $\partial_tF>0$. Then
ramp $s\,\alpha w_\delta$ from $s=0$ to $s=1$. The same
transverse estimate holds uniformly. On the axis the derivative
is $1-2s\zeta(t/\delta)+sd b(t/\delta)$. The unique degenerate
point is at $s=1/2$, $t=0$. It has nonzero $t$ third
derivative and $\partial_s\partial_tF=-2$, with fixed
nondegenerate transverse quadratic form of index two. This is
a generic local birth as in the standard cylinder formulation.
[Laudenbach, *Ann. Fac. Sci. Toulouse Math.* 23 (2014),
Definition 2.3, Remark 2.4 and §3.1](https://afst.centre-mersenne.org/item/10.5802/afst.1404.pdf)

## One round graph with both disjoint cylinders

Write the upper unit sphere near the north pole as
$h_0(x)=\sqrt{1-|x|^2}$ over $x\in\mathbb R^4$. Put
$c_r=\sqrt{1-r^2}$. Fix small constants $\kappa,\rho>0$.
For $(t,y)\in[-1,1]\times\overline B_1^3$ use the two maps

$$
\Phi_{r,\pm}(t,y)=
r\left(\pm\sqrt{1-2c_r\kappa t-r^2\kappa^2t^2-\rho^2|y|^2},
\ \rho y\right).
\tag{2}
$$

For all small $r>0$ the radicands are bounded below by a fixed
positive constant. The charts extend across the closed
cylinders, are injective since the first coordinate is strictly
monotone in $t$ at fixed $y$, and have uniformly bounded first
and second derivative and inverse bounds after dividing by $r$.
They have disjoint images near $\pm r e_1$. Direct substitution
gives $h_0\circ\Phi_{r,\pm}=c_r+\kappa r^2t$.
On the two images replace the latter prescription by
$c_r+\kappa r^2 F_{\delta_j}(t,y)$ for $j=1,2$, choosing
$\delta_1=\delta$ and $\delta_2=2\delta$. Use the same round
immersion elsewhere. Each $\delta_j$ is fixed independently of
$r$ and chosen to satisfy all the smallness bounds in (1).

The graph matches on open collars. Its horizontal coordinates
are unchanged. The graph stays strictly above the lower
hemisphere on the changed projection and stays inside the
upper coordinate neighborhood. This produces a smooth
embedding of the same oriented standard $S^4$. The function
defined by its last coordinate has the unmodified two
extrema at the poles and the four critical points from (1).
The two birth indices are ordered because their lower values
are below $c_r$ and their upper values above $c_r$.
Since $u_{\delta_j}(t_+)/\delta_j$ is the same negative
constant in both charts, the use of unequal $\delta_j$ makes
all four values distinct. This choice realizes the requested
index reordering in the actual vertical height itself.

## The shared incoming level and its two framing disks

Choose one constant $L$ larger than $2$ and larger than
$2\sup_{|s|\le1}|u_1(s)|$. The common local incoming value is
$A=-L\delta$, with $-1/2<A<0$ for small $\delta$. It lies
strictly below both index-two values in local coordinates.
The actual incoming cut is the global level
$h^{-1}(c_r+\kappa r^2 A)$. Since its only lower critical
point is the standard unique minimum, this cut is $S^3$.
In each cylinder, the portion of $F_{\delta_j}^{-1}(A)$ is
an embedded 3-ball. Indeed there is no critical point in the
local slab from $-1$ to $A$. A smooth vector field with
$dF_{\delta_j}(V)=1$ and $V=\partial_t$ in the lateral collar
exists by the submersion and partition of unity. Its flow in
that slab carries the bottom 3-ball onto the level at $A$.
The two resulting 3-balls in the common cut are disjoint.
[Milnor, *Morse Theory*, Theorems 3.1–3.2, regular-band
deformation and handle attachment](https://pagine.dm.unipi.it/~a019210/Milnor_Morse%20theory.pdf)

In each chart write $u=u_{\delta_j}$ and $t_+$ for its index-two
point's axial coordinate. The Morse formula $F=u(t)+
\varepsilon(-|y_-|^2+z^2)$ holds on the entire following
small level construction. The 2-handle attaches on

$$
t=t_+,\qquad z=0,\qquad
|y_-|=\left((u(t_+)-A)/\varepsilon\right)^{1/2}.
$$

The framed tube in the incoming level is supplied by nearby
parameters $(t,z)$ together with
$y_-=\sqrt{(u(t)+\varepsilon z^2-A)/\varepsilon}\,\theta$,
$\theta\in S^1$. Near $t_+$ use the positive Morse coordinate
$T=\mathrm{sgn}(t-t_+)\sqrt{u(t)-u(t_+)}$. This is the
product attaching tube of the actual index-two handle, because
in $(T,\sqrt{\varepsilon}\,y_-,\sqrt{\varepsilon}\,z)$ the
height is exactly the quadratic saddle. The descending core disks
can be chosen with $t=t_+$ and $z=0$ along the path to $A$.
Both tubes are disjoint, and their local Morse modifications can
be made within the two product-side cylinders. No handle slide or
comparison with a different height level is needed.

The spanning disk in that same level is explicitly

$$
z=0,\qquad A\le t\le t_+,\qquad
|y_-|^2=(u(t)-A)/\varepsilon .
\tag{3}
$$

Here $u(A)=A$ and $u'(A)=1$ since $A<-\delta_j$. For
$A<t\le t_+$ the radius is strictly positive, and the circle
fibers close smoothly at $t=A$ since locally
$t=A+\varepsilon|y_-|^2$. The ranges in $t$ and $|y|$ are
$O(\delta)$ and $O(\sqrt{\delta/\varepsilon})$, respectively.
Taking $\delta$ small after the fixed $\varepsilon$ puts
the disk and attaching tube in the separable core of (1).
The radius derivatives in both tube directions $t,z$ vanish
at the attaching circle. Thus its framing directions there are
$\partial_t,\partial_z$ up to the fixed Morse rescalings.
Along the disk $z=0$, $\partial_z$ is tangent to the level and
transverse to the disk, so the framed push-off has zero linking
with the attaching circle. Equivalently, $-\partial_t$ points
into the disk at that circle. The two disks lie in the two
disjoint local balls. This proves that the actual framed link
is a split zero-framed unlink, with the framing measured against
the preferred longitudes in the common $S^3$.

## Curvature cost and scope

In the projected coordinates of the upper graph the perturbation
has derivatives of orders $j=0,1,2$ bounded by $C r^{2-j}$,
by (1)–(2) with all normalized data fixed. The round graph already
has $|Dh_0|=O(r)$ and $|D^2h_0|=O(1)$ on these images.
Consequently the two changed regions have induced volume $O(r^4)$
and uniformly bounded second fundamental form. The Euclidean
Gauss equation bounds $|W^\pm|_{\rm HS}^2$ there by a constant
times $|A_{\rm shape}|^4$, and the untouched exterior is round.
Thus $E_\pm\le C r^4$. At either index-two point the shape
has signature $(2,2)$ and nonzero determinant, so the pointwise
chiral comparison in the frozen immersion section gives strictly
positive energy by continuity. This estimate includes both cutoff
regions. Here $A_{\rm shape}$ denotes the shape operator, distinct
from the incoming level value $A$ in (3).
[Frozen immersion section at the input commit](../manuscript/immersion_entry.tex)
· [E37 graph and collar estimate](../notes/E37_GRAPH_HANDLE.md)

The construction checks a global marked height on the standard
type. It supplies neither a height-selection theorem for a
nonstandard smooth type nor a replacement compatible with
arbitrary prescribed exterior height data. Its two controlled
handles occur in a deliberately chosen vertical direction.
