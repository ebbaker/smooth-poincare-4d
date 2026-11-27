# E83 · Corrected eta and a second cut for the short terminal collar

27 November 2026 UTC. Prepared for Edward Baker with OpenAI
assistance. Actual model and effort unavailable. Input checkout
bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0, [marked filling
result](../../02_seams_and_marked_cuts/notes/MARKED_FILLING_RESULT_20261127.md),
[short terminal collar](../../02_seams_and_marked_cuts/notes/B06_SHORT_TERMINAL_COLLARS.md),
[E12 axial moment](../../02_seams_and_marked_cuts/notes/E12_AXIAL_MOMENT.md)
and [E55 signed cut criterion](E55_RESOLUTION_REPLAY.md), with
working SHA-256 prefixes 619943e5f62f1440, 5880dfbd77007364,
1f86b5ea20b5b46a and 7d2c1e77e9f0d000, respectively. The results
are analytical in the outward-first convention for smooth
oriented Riemannian four-manifolds, with real chiral
Hilbert–Schmidt Weyl norms. Decimal values only illustrate the
exact comparisons.

The short terminal collar at $x=2/3$ has corrected eta
$-49/108$, above the exclusion level $-13/24$. A further
separating cut inside its core gives an energy restriction that
can strengthen the known early-orbit overshoot. An independent
axial estimate excludes the longer retained collar through
$x=201/400$ for invariant cores, with a positive exact margin.
These tests leave the existence of the matching $x=2/3$ core
open.

## The corrected eta uses the actual outward jet

Let $W$ be the prescribed marked disk bundle over
$\mathbb{RP}^2$, with collapsing axis $i$ and the final
umbilic Berger face $(1,1,\sqrt3)$. Its signature is zero
and $E_+(W)-E_-(W)=-5\pi^2$, so the strict target is
$E_+(W)/\pi^2<3/2$. On the exact outer collar use physical
outward arclength $s_k$, right-invariant coframe $\sigma_i$,
and parameters
\[
 b=\ell_k,\quad dv_k=b\,ds_k,\quad x=e^{2v_k},\quad
 b^2=1+4x-2x^2,\quad z=b^2-1.
\]
Both short lengths are one. At a cut $x=r$ the length
derivative is $b_{s_k}=4r(1-r)$, and the outward principal
curvatures are $(0,0,h)$ with $h=b_{s_k}/b$.
Use outward here to mean from the bolt toward the final
face. The collar's own inner boundary orientation is the
opposite orientation.

For this right-invariant metric on the fixed left quotient
$Q_8\backslash S^3$, the intrinsic signature eta is
$\eta=-3/4+z^2/12$. The round offset $-3/4$ is the
APS fixed-point average. The relative term can be read
from the right-invariant Chern–Simons calculation.
[APS II, §2](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps002.pdf)
· [E46 relative sign](E46_CAP_COVER.md#cover-and-eta)

For the extrinsic correction put
$e^i=\sigma_i,\ e^j=\sigma_j,\ e^k=b\sigma_k$ on a cut.
In the transgression pairing
$\mathcal T=\int\sum_a B_a\wedge(d^\nabla B)_a$ one
may use $B$ in place of $B^\circ$ because the trace terms
drop out pointwise. Only $B_k=h e^k$ is nonzero and
$de^k=2b\,e^i\wedge e^j$ tangentially. Thus the integrand
is $2b h^2 e^{ijk}$, with positive sign in the outward
orientation. Since the orbit volume is $\pi^2 b/4$, this
gives
\[
 \mathcal T=\frac{\pi^2}{2}b_{s_k}^2,\qquad
 \xi=\eta+\frac{\mathcal T}{12\pi^2}
    =-\frac34+\frac{z^2+b_{s_k}^2/2}{12}.
\]
At the requested face $r=2/3$, the exact values are
\[
 b=\frac53,\quad b_{s_k}=\frac89,\quad
 \eta=-\frac{473}{972},\quad
 \mathcal T=\frac{32\pi^2}{81},\quad
 \xi=-\frac{49}{108}.
\]
The signed ledger on the annulus of signature zero verifies
the result independently. In E22's axial eigenvalue formula,
$\lambda_k^+=-16x(1-x)$ and $\lambda_k^-=0$. The orbit volume
and $dv_k=b\,ds_k$ give
\[
 C(r):=\frac{E_+([r,1])}{\pi^2}
     =48\int_r^1 x(1-x)^2\,dx
     =4-24r^2+32r^3-12r^4,\qquad E_-([r,1])=0 .
\]
Thus $\xi(r)=-5/12-C(r)/12$, agreeing with the intrinsic
and extrinsic terms above. At $r=2/3$, $C=4/9$ and the distance
of $\xi$ above $-13/24$ is $19/216$. The core's energy
allowance in units of $\pi^2$ is $19/18$ and its signed
difference is $-49/9$. For comparison at $r=1/2$ the
intrinsic eta is $-9/16$, whereas corrected eta is $-25/48$.
The intrinsic value alone would incorrectly put that cut
below the wall. [APS I, Theorem (4-14)](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps001.pdf#page=24)
· [Parent transgression](../../01_chirality_ledger/reviews/PARENT_SECTION_3.md#theorem-31)
· [E22 axial replay](../../02_seams_and_marked_cuts/reviews/E22_SHORT_TERMINAL_COLLARS.md#signed-collar-energies-and-physical-jets)

The E55 polar cutoff is $\rho=\sqrt r$. Its rational
choice $\rho=2/3$ means $r=4/9$, where $C(r)=3500/2187$
already exceeds $3/2$. Here $C$ decreases strictly
between $0$ and $1$, so the signed obstruction for an
arbitrary smooth retained-collar core is exactly the
region $r\le r_*$ by this test, where the unique root
$C(r_*)=3/2$ has $r_*\simeq0.45985360$. Outside that
region the signed test of the exact collar alone
allows a strictly positive residual budget.

## One further cut inside the $2/3$ core

Let $\xi_A$ be the corrected eta of a further nested
separating quaternionic cut in the core and let
$\xi_B=-49/108$ be the corrected eta of the interface.
By the rational-homology-sphere splitting in E55,
both core regions have signature zero. Start the inner
region with $\xi=0$ at the limiting small tube about the
smooth bolt. Write $b_{\rm in}$ and $b_{\rm out}$ for
their respective $E_+/\pi^2$. The necessary inequalities
are
\[
 \begin{aligned}
 b_{\rm in}&\ge 12(\xi_A)_+,\qquad
 b_{\rm out}\ge12(\xi_B-\xi_A)_+,\\
 12\{(\xi_A)_++(\xi_B-\xi_A)_+\}&<\frac{19}{18},\\
 b_{\rm in}&<\mathcal B_A:=
          \frac{19}{18}-12(\xi_B-\xi_A)_+ .
 \end{aligned}
\]
In particular $-13/24<\xi_A<19/216$. These ledger
restrictions apply even when the core is non-invariant.
For a diagonal invariant cut, the direct E12 boundary
connection polynomial $\mathcal P_A$ obeys
$\xi_A=(\mathcal P_A-40)/48$, with the bolt term $40$,
so its required range is $14<\mathcal P_A<398/9$.

For an invariant core take the further cut at
$v_A=v_0=\tfrac12\log(8/5)$ in the short $i$-axis
horizontal-area-one gauge. It exists in any strict
competitor because E22 imposes $V>0.5428645\ldots$.
Put $y=\ell_i^2/(\ell_j\ell_k)$ in that gauge.
The causal estimate in the short-axis note uses only
the plus energy before $v_0$, rather than the total
core plus energy. Consequently
\[
 y(v_0)>\frac{69}{64}
   -\sqrt{\frac{621}{4096}\,\mathcal B_A}.
\]
For instance, if $\xi_A=-1/2$ then $\mathcal B_A=1/2$
and the required height is $y(v_0)>0.8027967\ldots$.
If $\xi_A=-17/32$ then $\mathcal B_A=1/8$
and the required height is $y(v_0)>0.9404608\ldots$.
For $\xi_A\ge\xi_B$ this bound recovers the prior
$0.6780822\ldots$ height. No value of $\xi_A$ at that
orbit is assumed in these conditional implications.
[Short-axis causal estimate](../../02_seams_and_marked_cuts/notes/B06_SHORT_AXIS_OBSTRUCTIONS.md#a-conformally-invariant-overshoot-on-an-actual-orbit)

For a separate two-piece constraint in the invariant
gauge, set $P=2\cosh(2u)$, $d=2\sinh(2u)$ and
$\mathcal D=-y'-4y+2P$, with the derivative in the core
coordinate $v$. On any interval $[a,b]$, E12 gives
\[
 6\int_a^b e^{2(v-b)}\lambda_i^+\,dv
 =\mathcal D(b)-q\mathcal D(a)
   +4\int_a^b e^{2(v-b)} y(u'+d/y)^2\,dv,\quad
 q=e^{-2(b-a)} .
\]
The square is at least $2(P')_+$, so the moment is
bounded below by
\[
 M_{a,b}=\mathcal D(b)-q\mathcal D(a)
                  +8q(P(b)-P(a))_+ .
\]
Cauchy–Schwarz and the axial coefficient of the
chiral norm give the lower energy
$L_{a,b}=(M_{a,b})_+^2/[24(1-q^2)]$ in $\pi^2$
units. Thus the core must satisfy the combined test
\[
 \max\{12(\xi_A)_+, L_{0,v_A}\}
 +\max\{12(\xi_B-\xi_A)_+,L_{v_A,V}\}<\frac{19}{18}.
\]
Here $(\mathcal D,P)=(-4,2)$ at the bolt and
$(8/3,34/15)$ at the interface. This inequality uses
data on the additional orbit and the two normalized
subinterval lengths. For example when $v_A=v_0$ and
$\xi_A=-1/2$, the first moment and $P(v_0)\ge2$
force $\mathcal D(v_0)<(3\sqrt{13}-10)/4$ from the
inner budget $1/2$. The full joined Robin condition
remains independent of these necessary energy tests.

## A different cutoff along the same exact solution

For a general $r$ in this family, the axial moment
at the core end gives
\[
 \mathcal D(V)=2b-2/b+h=\frac{4r(3-2r)}{b}.
\]
This is positive, and the bolt contribution and
nonnegative square in the moment imply that every finite
smooth invariant core costs strictly more than
$\mathcal D(V)^2/24$ in units of $\pi^2$.
At the rational cutoff $r=201/400>1/2$ the sum of the
collar cost and this lower bound is
\[
 C(r)+\frac{[4r(3-2r)]^2}{24(1+4r-2r^2)}
   =\frac32+\frac{3205130198003}{1282553600000000}.
\]
Thus any smooth invariant competitor retaining the exact
collar through this slice fails, and retaining farther
into the same profile still contains that slice. This
extends the $r=1/2$ incoming-jet obstruction a finite
distance outward. It uses the invariant short-axis bolt
normalization and gives no stronger arbitrary-core
cutoff than the signed criterion above.

For an alternative farther out than the signed wall,
$r=3/5$ spends $448/625$ and leaves the strict
core budget $979/1250$. It fixes
\[
 b=\sqrt{67}/5,\quad b_{s_k}=24/25,\quad
 \xi=-1191/2500,\quad
 \mathcal D(V)=108/(5\sqrt{67}),\quad P(V)=92/(5\sqrt{67}).
\]
Substituting these data into the whole-core moment
gives the necessary inequality
\[
 \big[\mathcal D(V)+(8P(V)-12)e^{-2V}\big]^2
 <24(979/1250)(1-e^{-4V}).
\]
Its positive root requires $V>0.6757224\ldots$.
This cutoff moves the required shape, normalized
length and residual energy together. The test supplies
neither a matching core nor an optimum over cutoffs.
