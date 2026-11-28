# B01 independent replay

27 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex
assistance. This bounded reading follows [request revision 1](../research-progress/handoffs/REQUEST_REPLAY_B01_20261127.md).
The dispatch selected gpt-6.2-sol/ultra. The helper has no separate serving
telemetry. Inputs were the
working tree on `6a422ce`, [B01](../brainstorm/notes/B01_GATE_SCOPE.md)
(SHA-256 prefix `70fe3a0850e0270bf`), the
[marked-end normalization](../../01_chiral_transfer_and_pole_forms/research-progress/handoffs/TO_02_03_MARKED_END_20261127.md)
and the [first master's metric conventions](../../../master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex).

**Disposition.** The continuum estimates and the bridge quantifiers replay.
For the specified marked pole, both base profiles and A at $t=-33/64$ have
certified zero-free triples, positive Yamabe sign and $e<2T$. At $t=-3/4$ for
A, the estimates leave all three questions inconclusive. At $t=3/4$ for B,
the zero-free triple is certified while the Yamabe and subcritical estimates
are inconclusive.

## Fourier estimate and pointwise norm

**Project theorem replay.** The density of the Fourier measure of
$h=(3/2)1_{[-1/2,1/2]}^{*4}$ is a positive constant times the fourth power
of a real sinc function. Its integral is $h(0)=1$. The convolution identity
also follows from the usual inclusion–exclusion integration of the sum of
four variables in $[-1/2,1/2]$, which yields the two cubic pieces of $h$.
Let $d\nu$ be the probability Fourier measure of the product of the four
copies of unmollified $h$. Writing $L(\xi)=\sum_j w_j e^{-ic_j\cdot\xi}$,
the normalized Fourier transform of the mollifier contributes the factors
$\int e^{-i\xi_k s}\rho(s)\,ds$, each of modulus at most one. Thus
$\|F\|_A\le\int|L|\,d\nu\le (\int |L|^2\,d\nu)^{1/2}=b$.
Fourier inversion evaluates this second moment including all signed cross
terms. Since $\sum |w_j|=1$, $|L|\le1$ and $b\le1$.

**Certificate.** For the four nonzero centers in order let
$(h_1,h_2,h_3,h_4)=(23/32,5/9,121/256,53/125)$ be the values of $h$ at their
nonzero coordinates. A pair of different nonzero centers has product
correlation $h_ih_j$. Hence
\[
 b^2=\left(w_0+\sum_{j=1}^4w_jh_j\right)^2+
        \sum_{j=1}^4 w_j^2(1-h_j^2),\qquad
 b_A^2=\frac{4403963}{6150400},\quad
 b_B^2=\frac{54360023}{276768000}.
\]

**Project theorem replay.** At a nonzero frequency with unit covector $n$,
the closed flat symbols are $n\wedge\alpha$ for $\alpha\perp n$. Its two
Hodge projections both have norm $|\alpha|/\sqrt2$, so the map $T_0$ from
minus to plus is an isometry on each nonzero frequency, also for the
complex Fourier coefficients. Left composition by $T_0$ therefore preserves
the coefficient matrix operator norm there. If $\psi$ is the smooth minus
part of the normalized A1 pole triple, it is compactly supported. Its plus
remainder differs from $T_0\psi$ by a flat self-dual closed form with
coefficients tending to zero. Here $T_0\psi$ tends to zero by Fourier
integrability, and the pole expansion supplies the other limit. Flat
closed self-dual forms are coclosed, so the difference vanishes by applying
harmonic Liouville to each coefficient. The resulting graph equation
$\psi=tF(I+T_0\psi)$ has a unique Wiener solution for $v=|t|b<1$ since
$\|tF\|_A\le v$. The sum from order one onward bounds both
$\|\psi\|_A$ and $\|T_0\psi\|_A$ by $v/(1-v)$.

With $V=I+T_0\psi$, the Cartesian graph form has coefficients
$(1+tF)Vu$ on $dx^{0i}/\sqrt2$ and $(1-tF)Vu$ on $dx^{jk}/\sqrt2$ for
cyclic $i,j,k$. In the oriented orthonormal coframe $(a\,dx_0,dy)$ the
first coefficient becomes $(1+tF)Vu/a=(1-tF)Vu$, giving
$|\omega_u|_g=(1-tF)|Vu|$. In particular any common lower bound $d$ for
$1-tF$ gives $m_\omega\ge d\max(0,(1-2v)/(1-v))$ for all spatial points
and unit directions. One can take $d=1-v$ for either profile, and $d=1$
for A with negative $t$ because $F\ge0$ for A. At infinity the norm tends
uniformly to 1 on unit directions, giving $m_\omega\le1$. These norms
use the asymptotically Euclidean metric $g$.

## Curvature, polynomial integrals and compact Yamabe sign

**Project theorem replay.** For $\theta^0=a\,dx_0$ and $\theta^i=dy_i$,
the only independent connection forms are $\omega_{0i}=a_i\,dx_0$. The
curvature forms are $-(a_{ij}/a)\theta^0\wedge\theta^j$ for the $0i$
entries, and zero for $ij$. In particular derivatives in $x_0$ drop
out by exterior multiplication. With the unit-sphere-positive curvature
convention, set $M=-D_y^2a/a$. The curvature operator is $M$ on the
$\theta^0\wedge\theta^i$ sector and zero on the spatial sector. Its
diagonal chiral blocks are $M/2$. Since $R=2\operatorname{tr}M$, the
two Weyl blocks are $M_0/2$. The volume is $a\,dx$, so the chiral
Hilbert–Schmidt integral divided by $T=4\pi^2$ is
$\int |(D_y^2 a)_0|^2/a\,dx/(16\pi^2)$ on either chirality. On the
flat end the compactifying factor gives the round germ in the inverted
chart. The chiral integrals carry to the compact representative by
four-dimensional conformal invariance.

**Certificate.** Integration of the polynomial powers on the two positive
half-intervals and use of evenness gives
\[
\begin{array}{c|ccccc}
 \text{integrand}&h^2&(h')^2&(h'')^2&h^4&(h')^4\\
 \hline
 \text{integral}&151/140&3/2&6&122559/160160&1233/1120.
\end{array}
\]
For the unmollified product the squared transverse Hessian norm is
$3\cdot6(151/140)^3+6(3/2)^2(151/140)^2=1641672/42875<49$.
The squared bound for $\||\nabla_yF|^2\|_2$ before mollification and
translation is $9(1233/1120)(122559/160160)^3<81/16$. These bounds for
$F$ follow by $L^2$ contraction of convolution on the Hessian and by
$L^4$ contraction on each first derivative before applying the triangle
inequality to $\sum_i(\partial_iF)^2$. The $\ell^1$ norm of either weight
vector is 1.

**Project theorem replay.** The chain rule gives
\[
 D_y^2 a=\frac{2t}{(1-tF)^2}D_y^2 F+
           \frac{4t^2}{(1-tF)^3}\nabla_yF\otimes\nabla_yF.
\]
Thus $D=14|t|/d^2+9t^2/d^3$ bounds its $L^2(dx)$ norm, and
$m=(1-v)/(1+v)$ satisfies $m\le a,1/a$. The energy bound follows by
discarding the trace from the norm estimate. The compact support of $a-1$
justifies integration by parts twice, giving
$\|\Delta_y a\|_2^2=\sum_{i,j}\|a_{ij}\|_2^2$. For real compactly
supported $z$, the gradient term in the Yamabe numerator has weights
$a^{-1}$ for $\partial_0z$ and $a$ for $\nabla_yz$ against $dx$. The scalar
term is $-2\int\Delta_y a\,z^2\,dx$. Together these give the stated
$6m\|Dz\|_2^2-2D\|z\|_4^2$ lower bound.

**Import checked in the primary source.** Giorgio Talenti, *Best Constant
in Sobolev Inequality*, Annali di Matematica Pura ed Applicata **110** (1976),
353–372, DOI [10.1007/BF02418013](https://doi.org/10.1007/BF02418013).
The checked passage on 27 November 2026 was §0, equations (1)–(2),
pp. 353–354, where the hypothesis is sufficient smoothness and decay on all
of $\mathbb R^n$, with $1<p<n$ and $q=np/(n-p)$. Compactly supported
smooth real $z$ qualifies. At $(n,p,q)=(4,2,4)$ the gamma quotient is
$\Gamma(3)\Gamma(4)/(\Gamma(2)\Gamma(3))=6$. The coefficient in
$\|z\|_4\le S\|Dz\|_2$ is $6^{1/4}/(2\sqrt{2\pi})$, giving
$S^2=\sqrt6/(8\pi)$. [Inspected primary article](https://math.jhu.edu/~js/Math646/talenti.sobolev.pdf)

**Project theorem replay.** If $K=(48\pi/\sqrt6)m-2D>0$, the numerator
is at least $K\|z\|_{4,dx}^2$, and $a\le1/m$ gives the quotient
bound $\sqrt m K$. With $\Delta_g=\operatorname{div}_g\nabla_g$ and
$\ell=\log\Omega$, contraction of the connection difference gives the
scalar curvature $\Omega^{-2}(R_g-6\Delta_g\ell-6|d\ell|_g^2)$.
Taking the divergence in the volume $\Omega^4dV_g$ gives the transformed
Laplacian $\Omega^{-2}(\Delta_g f+2\langle d\ell,df\rangle_g)$.
Combining them by the product rule gives the conformal Laplacian
$\Omega^{-3}(-6\Delta_g+R_g)(\Omega f)$.
Integrating against $f\,dV_{\Omega^2g}$ for tests supported away from $p$
gives the numerator for $z=\Omega f$ against $dV_g$. The $L^4$ denominators
agree as well. On the smooth compact representative, a radial cutoff with
$|d\chi_\delta|=O(\delta^{-1})$ on a shell of volume $O(\delta^4)$ costs
$O(\delta^2)$ in squared $L^2$ norm of the extra gradient for each smooth
test. This gives convergence in $H^1$ and $L^4$. Smooth density and the
compact Sobolev embedding then pass the inequality to the Yamabe infimum.
If $K\le0$, the stated positivity test is inconclusive.

## Stress cases and quantifiers

**Certificate.** The entries below are outward rational evaluations of the
continuum estimates, with $m$ from $v$, and $d=1-v$ except for A at $t<0$.
They follow from $846/1000<b_A<847/1000$ and
$443/1000<b_B<444/1000$ by comparing squares, and from
$3<\pi<22/7$, $12/5<\sqrt6<5/2$. If $m_\pm$ and $D_\pm$ are the
corresponding endpoint bounds, use
$288m_-/5-2D_+\le K\le440m_+/7-2D_-$ and
$D_+^2/(144m_-)$ for the energy upper bound. The $m_\omega$ column uses
the upper endpoint of $v$ in the lower-bound formula. All entries come
from the analytic bounds.

| Profile | $t$ | Lower bound for $m_\omega$ | Interval for $K$ | Upper bound for $e/T$ |
| --- | ---: | ---: | ---: | ---: |
| A, B | $0$ | 1.00 | $[57.60,62.86]$ | 0.00 |
| A | $-1/4$ | 0.73 | $[29.34,32.79]$ | 0.18 |
| A | $1/4$ | 0.57 | $[23.90,27.36]$ | 0.50 |
| A | $-5/16$ | 0.64 | $[22.98,26.07]$ | 0.33 |
| A | $5/16$ | 0.47 | $[12.88,15.99]$ | 1.27 |
| A | $-33/64$ | 0.22 | $[3.35,5.46]$ | 1.64 |
| A | $-3/4$ | 0.00 | $[-18.28,-17.06]$ | 7.55 |
| B | $\pm1/4$ | 0.77 | $[35.63,39.88]$ | 0.24 |
| B | $\pm5/16$ | 0.72 | $[29.01,33.04]$ | 0.49 |
| B | $3/4$ | 0.33 | $[-52.51,-49.59]$ | 22.95 |

At A $t=-3/4$, even the lower endpoint for $v$ exceeds $1/2$ and the
Fourier lower bound is identically zero. At A $t=-3/4$ and B $t=3/4$,
$D_-^2/[16(22/7)^2m_+]>2$ in both cases, so the B01 energy upper bound
is too large to certify subcriticality even before outward rounding.
Every base row and A at $-33/64$ certifies all three strict conditions.

**Project theorem replay.** The bridge has the existential quantifiers
$\exists p\,\exists[u]\,\forall q\ne p$ for zero-freeness of a given
positive subcritical class. Its refutation needs one such class with
$\forall p\,\forall[u]\,\exists q\ne p$ exhibiting a zero. For fixed
$c$, the parameter space of $(p,[u])$ is the compact projectivized
rank-three bundle over $S^4$. On a three-disk disjoint from $p$ a
continuous evaluation in a trivialization with positive boundary norm
margin and nonzero degree has a zero inside. A perturbation uniformly
smaller than that margin on the boundary preserves the degree and thus
gives a neighborhood of parameters with a zero. A finite certification
using such neighborhoods must cover the parameter space of a single
class. B01's one-pole estimates already provide a witness for each of its
certified classes. A vanishing lower bound leaves the existence of a
zero open. At a single pole and spatial point, a singular evaluation
certifies precisely the directions in the projectivization of its kernel.
