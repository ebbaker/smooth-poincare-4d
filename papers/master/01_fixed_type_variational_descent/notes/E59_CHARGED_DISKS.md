# MASTER-E59a · Concentric collars on E58 charged disks

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. This is bounded E execution of the v1 test of logarithmic
selection and a degree-one gauge on the actual E58 disks. The lead
selected GPT-6.2 Astra/ultra for B work and GPT-6.2 Sol/ultra for bounded E
work. Actual serving model and effort were unavailable to this helper.
The frozen commit is
`b5ce9f481a7604a411b9e1bde5383b2bc122fb5c`. SHA-256 prefixes are
`efb34dc87367bbbd` for [E58](../manuscript/subcritical_charge.tex),
`c1de1c225230b140f` for the [E56 collar](../manuscript/disk_collar_comparison.tex),
`e9168c7a5fdd4c400` for the [descent manuscript](../manuscript/fixed_type_chiral_energy_descent.tex),
`b972bc5466245c5d` for the [smooth-ball construction](../../manuscript/physical_volume.tex),
and `c695d75b90cd46b06` for the [continuation](../../continuation-notes/AFTER_UNIFORM_RECOGNITION_GAP_20261125.md).
[Owning register](../research-progress/REGISTER.md)

The E58 small-support estimate bounds the number of nested round-close
collars that can surround the selected disks. In particular, disjoint
outward collars of fixed normalized width around **all** the original
disks are impossible at sufficiently tight E58 volume tolerance, if
they stay in the containing comparison balls and have uniformly bounded
determinant-normalized distortion. On smaller or separately charged
cores, a finite measured test still gives simultaneous repair. The test
charges both sides, measures any discarded part of the original E58
charge, and can use either chirality.

## Capacity of an outward buffer on the actual source

Fix a sufficiently late E58 source on an oriented smooth homotopy
four-sphere, with $T=4\pi^2$, $e_i=E_\pm(g_i)$ and $e_i\to I<4T/3$.
The $E_\pm$ use the Hilbert–Schmidt norms on the Weyl endomorphisms,
with local measures $\lambda_i^\pm=|W_{g_i}^\pm|_{\rm HS}^2dV_{g_i}$.
Let $\mu_i=dV_{q_i}$ and
$\kappa_i=Y_i-6\ell_i/\sqrt2$, where
$\ell_i^2=\int L^2dV$. Thus $\kappa_i\ge\kappa>0$ on late
indices. Work with the actual disks $D_{ij}$, chosen in the E58
proof so that $\mu_i(\bigcup_j D_{ij})>1-d_0$ for a fixed
tolerance $d_0>0$. Choose the E58 radius ceiling at most one. A
containing $k_i$-ball of this radius then carries at most half the
total spectral measure $L^2dV$. For a Lipschitz cutoff $\chi$
supported there with plateau $C$, and with gradient supported on
$A$ up to null sets, the E58 Yamabe estimate, Hölder and
four-dimensional conformal invariance give
\[
 \kappa_i^2\,\mu_i(C)
 \le 36\,\mu_i(A)\int |d\chi|_{k_i}^4\,dV_{k_i}.
 \tag{1}
\]
The energy in this gradient integral is the same in $q_i$, $g_i$
and any conformally related gauge, whereas the plateau and gradient
support volumes in (1) are in $q_i$. [E58 small-support estimate](../manuscript/subcritical_charge.tex)

Suppose each protected compact core $C_j$ lies inside the inner
face of $N_j\ge1$ nested smooth bicollars $A_{j\ell}$. Take the
collars within its original E58 containing ball. Their closures can
have gaps, and all the annuli are mutually disjoint up to their faces.
The outermost face and its bounded marked disk lie inside the same
containing ball. All these outermost disks are disjoint between
different labels $j$. Each annulus is given on a neighborhood of the closure of
$\{e^{-1}<|y|<e\}$, with inner to outer orientation and
determinant-normalized metric $m_{j\ell}=\exp h_{j\ell}$ satisfying
$\|h_{j\ell}\|_\infty\le a$, where the operator eigenvalues of
$h_{j\ell}$ are bounded in absolute value by this norm.
The chart can vary between shells. Put $\chi_j=1$ on the whole
inner side, drop by $1/N_j$ using affine interpolation in
$\log|y|$ on each shell, continue constantly on each gap, and set
$\chi_j=0$ beyond the outermost face. This is a continuous
piecewise smooth admissible cutoff, with
\[
 \int |d\chi_j|_{k_i}^4\,dV_{k_i}
 \le e^{2a}\frac{2\pi^2}{(2N_j)^3}.
\]
In fact, in each normalized chart $\det m_{j\ell}=1$ and the
inverse metric costs at most $e^{2a}$ in the fourth power.
The Euclidean integral for a unit drop is
$2\pi^2/2^3$ and the factor is $N_j^{-4}$ on each of the
$N_j$ shells. More generally one can replace $2N_j$ by the
sum of the shell log widths, taking the drops proportional to their
widths. The exponent three is sharp for Euclidean annuli: along
each ray Hölder bounds the radial fourth-power energy below by the
inverse cube of the log length, and the radial log cutoff attains
the resulting integral over $S^3$.

Consequently
\[
 \sum_j N_j^3\mu_i(C_j)
 \le K_i(a)\sum_{j,\ell}\mu_i(A_{j\ell})
 \le K_i(a)\left[1-\mu_i\Bigl(\bigcup_j C_j\Bigr)\right],
 \qquad K_i(a)=\frac{9\pi^2 e^{2a}}{\kappa_i^2}.
 \tag{2}
\]
For $C_j=D_{ij}$, if $N_j\ge N$ on every disk then
\[
 N^3(1-d_0)<\frac{9\pi^2 e^{2a}}{\kappa^2}\,d_0 .
 \tag{3}
\]
This fails for any $N\ge1$ when the E58 tolerance is small
enough for the stated fixed distortion bound. In particular a
radial reparametrization cannot turn the short outward margin of
every original disk into a family of fixed-width round-close
annuli. The conclusion also applies to a change of gauge that
actually supplies such annuli. It concerns disjoint outward
buffers retaining the protected cores inside the E58 containing
balls. It allows a single disk or a subfamily with smaller
protected volume, a reselected core with a measured charge, thin
collars with different estimates, or a larger source region with
a separately established support inequality.

There is a corresponding limit to what E58's **volume argument**
certifies after shrinking all cores. For
$C=\bigcup_j C_j$ with $p=\mu_i(C)>0$, that argument before
weakening the Cauchy–Schwarz denominator gives
\[
 (\lambda_i^++\lambda_i^-)(C)\ge
 Q_i(p)=\frac{3}{2p}
       \left(Y_i/6-\ell_i\sqrt{1-p}\right)_+^2.
 \tag{4}
\]
Since $Y_i/6\le\ell_i$ and
$1-\sqrt{1-p}\le p$, one has $Q_i(p)\le2 e_i p$.
Subtracting the opposite global charge $e_i$ therefore supplies
no positive lower bound for either sign at $p\le1/2$. By (2)
this already applies if $N_j\ge N$ for every chosen core and
$N^3\ge K_i(a)$. Equation (4) describes the reach of the
E58 volume-to-charge estimate. The physical measure on such a
smaller core can itself be measured and can be larger.

## A weighted allowance for one fixed-width collar

Fix a collar chart $A=\{e^{-1}<|y|<e\}$ extending the marked disk
$B$ at $|y|=1$. In the pulled-back conformal class write the
determinant-one metric as $m=\exp h$ and use Euclidean component
norms in this chart. Define
\[
 a=\|h\|_{\infty,A},\quad d=\|h\|_{2,A},\quad
 \tau=\|DG(m)\|_{2,A},\quad
 w^2=4(\lambda_i^++\lambda_i^-)(A),\qquad
 b=w+\tau+d ,
\]
where $G_\alpha(m)=\partial_j(m^{\alpha\alpha}m^{j\alpha})$
with no sum on $\alpha$. Any notation evaluating
$\lambda_i^\pm$ on a coordinate set means its image in the
physical source. For sufficiently small universal $a$, a fixed
smooth cutoff $\psi$ supported compactly in $A$ and equal to
one near the seam gives the following estimate for
$m_s=\exp((1-s\psi)h)$, $0\le s\le1$:
\[
 \|F_\pm(m_s)-(1-s\psi)F_\pm(m)\|_{L^2(A)}
 \le s\beta,\qquad
 \beta=C(ab+\sqrt{db}+d).
 \tag{5}
\]
The square of the Euclidean norm of $F_\pm$ is the chiral energy
density, using the metric orthonormal frame and determinant factor
of E56. The same estimate holds upon restriction to either half,
and the original positive conformal multiplier is restored off
the comparison gauge. The constants use only the fixed profiles
and the universal smallness threshold. [E56](../manuscript/disk_collar_comparison.tex)

For the refined zero-order term in (5), take a fixed interior
cutoff $\chi$ equal to one on the support of $\psi$ and put
$X=\|\chi^2D^2h\|_2$, $Z=\|\chi Dh\|_2$ and
$J=\|\chi Dh\|_4^2$. E56's joint flat ellipticity of linearized
Weyl and $DG$ applied to $\chi^2h$ yields
\[
 X\le C(w+\tau+d+Z+aX+J).
\]
The cutoff commutators are bounded by $C(Z+d)$, since every
one-derivative commutator contains one factor of $\chi$.
Integration by parts gives
\[
 Z^2\le C(dX+dZ),\qquad
 J^2\le C(aXJ+\|h\|_4 J^{3/2}).
\]
In the second inequality the differentiated-cutoff term is
estimated by Hölder against $|h|$ in $L^4$ and
$|\chi Dh|^3$ in $L^{4/3}$. As
$\|h\|_4^2\le ad$, these bounds give
$Z\le C(\sqrt{dX}+d)$ and $J\le Ca(X+d)$.
Absorption for small $a$ then gives $X\le Cb$. To pass to (5),
write $F_\pm(\exp h)=P_\pm(h)D^2h+Q_\pm(h)[Dh,Dh]$ with smooth
coefficient maps. For $\theta=1-s\psi$, the principal coefficient
change is $P_\pm(\theta h)-P_\pm(h)=O(sa)$. The coefficient
$\theta^2Q_\pm(\theta h)-\theta Q_\pm(h)$ is $O(s)$.
Derivative terms falling on $\theta$ cost at most $Cs(Z+d)$
in $L^2$, including the factors of $h$ from differentiating
products. The error is therefore bounded by
$Cs(aX+J+Z+d)$, which proves (5).

There is a signed version of the joined and exterior costs.
For any selection of disjoint annuli let $A$ be their union,
$A^{\mathrm{out}}$ their exterior halves, $\beta^2$ the sum of
their squared allowances in (5), and $\beta_{\mathrm{out}}$
the aggregate bound on the exterior halves, which may be taken
equal to $\beta$. For a fixed sign set
\[
 S^\pm=\lambda_i^\pm(A),\quad S_{\mathrm{out}}^\pm=\lambda_i^\pm(A^{\mathrm{out}}),
 \quad
 H^\pm(s)=\int_A(1-s\psi)^2\,d\lambda_i^\pm,\quad
 H_{\mathrm{out}}^\pm(s)=\int_{A^{\mathrm{out}}}(1-s\psi)^2\,d\lambda_i^\pm ,
\]
with the chosen cutoff used on each disjoint chart. Certified
surcharges on the joined path and at the capped endpoint are
\[
 U_{\mathrm{join}}^\pm
 =\max\!\left\{0,(\sqrt{H^\pm(1)}+\beta)^2-S^\pm\right\},\qquad
 U_{\mathrm{out}}^\pm
 =(\sqrt{H_{\mathrm{out}}^\pm(1)}+\beta_{\mathrm{out}})^2
     -S_{\mathrm{out}}^\pm .
 \tag{6}
\]
Indeed, $\sqrt{H^\pm(s)}$ is the Hilbert norm of an affine
function of $s$. Adding $s\beta$ preserves convexity and
nonnegativity, so the maximum of its square occurs at an endpoint.
This uses the linear factor $s$ in (5). Unchanged portions have
their original energy. For the cap use (5) on the exterior halves
and add the original exterior charge outside those halves.
At the seam the new metric is conformal to the Euclidean metric;
the inherited stretch and cap are conformally flat and use the
chosen disk/angular marking on the actual source. Thus
$e_i+U_{\mathrm{join}}^\pm<2T$ suffices for positive Yamabe sign,
and the capped chiral energy is bounded by
$e_i-\lambda_i^\pm(\bigcup_j B_j)+U_{\mathrm{out}}^\pm$.
The entire source and each smooth capped metric have equal total
energies for their two signs by signature. One can use the tighter
path budget and the tighter capped bound independently.
[Simultaneous marked cap and Yamabe wall](../manuscript/fixed_type_chiral_energy_descent.tex)

## Finite selection with protected charge

Keep the disjoint buffered cores $C_j\subset D_{ij}$ and their
$N_j$ candidate rings. All their cuts bound actual marked
standard disks and contain the corresponding core. The weighted
allowances permit quantitative averaging when enough of these
candidates exist. For each $j$, sum over its candidates to define
\[
 W_j^2=\sum_\ell w_{j\ell}^2,\qquad
 \mathcal T_j^2=\sum_\ell\tau_{j\ell}^2,\qquad
 P_j^2=\sum_\ell d_{j\ell}^2,\qquad
 a_j=\max_\ell a_{j\ell}.
\]
In a common parent chart $x$, using $x=R_{j\ell}y$ for
a shell centered at radius $R_{j\ell}$ gives
$D_yG_y=R_{j\ell}^2D_xG_x$ on that shell. Thus
$\mathcal T_j^2$ is the parent-coordinate $L^2$ integral of
$DG$ on the union of rings, and
$P_j^2\le e^4\int_{\cup_\ell A_{j\ell}}|h|^2|x|^{-4}\,dx$.
The sums in the individual normalized charts also apply when
different parametrizations supply different rings. The physical
curvature ceiling in E58 gives $W_j^2<\zeta$ and
$\sum_j W_j^2\le8e_i$. By (5) and Cauchy–Schwarz,
\[
 \sum_\ell\bigl[w_{j\ell}^2+\beta_{j\ell}^2\bigr]\le
 \mathcal D_j
 = W_j^2+C\left[
        a_j^2(W_j^2+\mathcal T_j^2)+
        P_j(W_j+\mathcal T_j)+P_j^2\right].
 \tag{7}
\]
The constant in $\mathcal D_j$ is chosen from the universal
constant in (5). Pick one ring in each family minimizing
$w_{j\ell}^2+\beta_{j\ell}^2$. Both the joined surcharge and the
exterior surcharge, for each sign, are bounded above by
\[
 \Gamma=2\sum_j\mathcal D_j/N_j .
 \tag{8}
\]
For either region the raw sign-specific ring energy is
$S\le\sum_j w_{j\ell}^2/4$, so an upper bound without the
attenuation discount in (6) is
$2\sqrt S\,\beta+\beta^2\le S+2\beta^2$. The same estimate
holds on either half separately. The averaging rate in (8)
requires measured control of (7). The curvature ceiling only
supplies its $W_j$ term.

Let $\epsilon$ be the original E58 charge tolerance and set
$\Delta_i^\pm=\sum_j\lambda_i^\pm(D_{ij}\setminus C_j)$, including
every omitted disk if only a subfamily is being replaced. The
selected disks contain the protected cores, so their actual raw
charge satisfies
\[
 \lambda_i^\pm\Bigl(\bigcup_j B_j\Bigr)
 \ge \lambda_i^\pm\Bigl(\bigcup_j C_j\Bigr)
 \ge Y_i^2/24-e_i-\epsilon-\Delta_i^\pm .
 \tag{9}
\]
This also bounds the raw residual by
$2e_i-Y_i^2/24+\epsilon+\Delta_i^\pm$. Thus a finite sufficient
test on one source is $e_i+\Gamma<2T$ and
\[
 \Gamma+(e_i-I) <
 \lambda_i^\pm\Bigl(\bigcup_j C_j\Bigr)
 \tag{10}
\]
for either sign. One may instead use the smaller signed
surcharges (6), the actual selected disk charge in (10), or the
lower bound (9). For example, if the raw residual bound plus the
exterior surcharge is at most $T$ and the path budget holds,
the positive capped class lies in the inclusive recognition
range. All choices and estimates in (7)–(10) refer to marked
subsets and collars of one source. A limiting application takes
the source limit with the finite family and tolerances fixed.

A separate necessary check comes from signature on the same
smooth type. For a single selected disk let $c_\pm$ be the
actual signed change over its exterior half, retaining the
conformal class off the changed strip and placing a conformally
flat cap on the disk. Then
\[
 c_+-c_-=\lambda_i^+(B_j)-\lambda_i^-(B_j).
 \tag{11}
\]
For instance simultaneous exterior upper bounds $u_\pm$ must
satisfy
$\lambda_i^+(B_j)-\lambda_i^-(B_j)\le
u_++\lambda_i^-(A_{j\ell}^{\mathrm{out}})$, and the
corresponding reversed inequality. This follows from subtracting
the two closed signature identities and from
$c_\pm\ge-\lambda_i^\pm(A_{j\ell}^{\mathrm{out}})$.
Its scope is an actual disk with the matching retained exterior.
Local chiral imbalance can therefore force a surcharge even
when the joined-path bound alone permits a cap.

## What the degree-one gauge supplies

A four-harmonic chart would set $\mathcal T_j=0$ on its rings.
Liimatainen–Salo's determinant-one ellipticity theorem works in
an existing $n$-harmonic coordinate system. Its local
ellipticity supplies no quantitative chart on the marked E58
annulus. The E56 estimate uses its own flat symbol and a measured
residual. [Liimatainen–Salo, arXiv v1, §1 and Theorem 1.1](https://arxiv.org/pdf/1310.3666)

A direct Dirichlet stability estimate illustrates the additional
coordinate requirement. On a supplied parameter ball $\Omega$
with $\|h\|_\infty\le a$, solve the four scalar minimization
problems
$\int_\Omega (m^{jk}\partial_j f^\alpha\partial_k f^\alpha)^2dy$
with traces $y^\alpha$. Their weak solutions exist by convex
coercivity on the affine $W^{1,4}$ classes. For
$A_m(v)=(v^\top m^{-1}v)m^{-1}v$, strong monotonicity gives
\[
 [A_m(v)-A_m(u)]\cdot(v-u)\ge
 c(|v|+|u|)^2|v-u|^2 .
\]
One verifies this by integrating the derivative of
$v\mapsto |v|^2v$ along the segment after conjugation by
$m^{-1/2}$. The integral of the squared norm on that segment
is bounded below by a fixed multiple of $(|v|+|u|)^2$,
and uniform ellipticity gives the stated constant.
Test with $f^\alpha-y^\alpha$, subtract the constant Euclidean
flux $A_\delta(e_\alpha)$ against its zero-trace derivative,
and use
$|A_m(e_\alpha)-A_\delta(e_\alpha)|\le Ca$. Cauchy–Schwarz
and Young's inequality yield
\[
 \int_\Omega\bigl(|Df^\alpha-e_\alpha|^2+
                  |Df^\alpha-e_\alpha|^4\bigr)\,dy
 \le C a^2|\Omega|.
 \tag{12}
\]
This estimate does not control the Jacobian pointwise or show an
inverse spanning the annulus. Smooth maps equal to the identity
off a small ball can have degree one and arbitrarily small
$W^{1,4}$ derivative error and still reverse orientation on a
smaller ball. For example
$y\mapsto y-2y^1\eta(y/\rho)e_1$, with smooth $\eta$ equal to
one near zero and zero outside the unit ball, has those properties
as $\rho\downarrow0$. This example tests an inference from the
norm and degree alone.

One practical sufficient marking check on the whole parameter
ball is a smooth candidate $f$ fixing its boundary and
$\|Df-\mathrm{Id}\|_\infty\le\eta<1$. On a convex ball the
segment estimate proves injectivity, and the boundary identity
and degree one give surjectivity on the open ball. Its derivative
has positive determinant by the segment to the identity in
matrix space. The pulled metric in the new coordinates, after
determinant normalization, has log distortion at most
$C(a+\eta)$ for small $a+\eta$. Reapply (5)–(10) if the
actual buffer and the inclusion of each protected core have
been verified in those coordinates. A passive coordinate change
preserves the physical energies, while its new cut defines the
sets in (9). The source volume sandwich and (12) do not supply
this stronger marking check.

The remaining comparison is to produce actual rings around a
core whose measured charge pays (10), or a repair using a
different geometry with its own matched energy and sign
estimates. Equation (3) rules out doing this by adding uniformly
round-close outward collars to the entire E58 family at
arbitrarily tight volume tolerance.
