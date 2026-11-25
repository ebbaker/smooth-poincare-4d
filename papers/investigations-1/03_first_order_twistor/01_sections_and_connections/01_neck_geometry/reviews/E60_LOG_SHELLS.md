# MASTER-E60r3 · Independent check of logarithmic radial selection

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded independent E review under NECK-B04/B05. Actual
serving model and reasoning effort were unavailable. The frozen input
commit is `b5ce9f481a7604a411b9e1bde5383b2bc122fb5c`. The reviewed
[E59b note](../notes/E59_LOG_SHELLS.md) had SHA-256 prefix
`779b3dc277f10488`, and the frozen [E56 proof](../notes/E56_PHYSICAL_RADIAL_FLUX.md)
and [owning TeX](../manuscript/anchored_physical_shell.tex) had prefixes
`2a0e895cdac9081b` and `ffdb821e81ecb21f`. I independently checked
logarithmic selection, the signed-measure estimate, both Ricci
premises, and the required change from the E56 shift.
[Owning register](../research-progress/REGISTER.md)

**Assessment.** The full-defect criterion and the two stated
Ricci routes are valid as conditional results on the selected physical
source. Either Ricci route gives the unshifted distance equation
on a supplied proper flat comparison at the selected scale.
The centered comparison uses control through the core. The protected
comparison instead uses a pointwise radial lower bound after its
inner radius and a measured fourth-order transition volume. The
supplementary compact source embeddings and radial alignment are
still required. The separately stated scalar-only criterion uses its
own shift and comparison-image hypotheses.

## Defect measure and finite error

Use the E59 smooth oriented Riemannian sources, $h_i=\rho_i^{-2}g_i$,
physical distance $d_i=d_{h_i}(x_i,\cdot)$ and
$\Delta_{h_i}=\operatorname{div}_{h_i}\nabla_{h_i}$. Away from
$x_i$ the signed measure
$\mu_i=4dV_{h_i}-\Delta_{h_i}(d_i^2/2)$ contains the cut-locus
term. The cut-locus part of $\Delta d_i$ is nonpositive, and
so is that of $\Delta(d_i^2/2)$, by the chain rule. This follows
from the Radon Laplacian decomposition in the primary paper.
[Mantegazza–Mascellani–Uraltsev, Theorem 2.10 and Corollaries 2.11–2.12](https://msp.org/pjm/2014/270-1/pjm-v270-n1-p07-p.pdf)

For $V_i(t)=\operatorname{vol}_{h_i}(B(x_i,t))$ and an interior
radial cutoff $\eta$, coarea and $|dd_i|=1$ almost everywhere
give
\[
 \int\eta(d_i)\,d\mu_i
 =\int(4\eta+t\eta')V_i'\,dt
 =-\int(5\eta'+t\eta'')V_i\,dt.
\]
The compact Lipschitz test can be approximated uniformly and
strongly in $W^{1,2}$ on the source. In the first expression the
Radon pairing uses uniform approximation and the weak gradient
pairing uses the Sobolev approximation. Adding $C_i$ to
$V_i$ leaves the integrated second expression unchanged.
The pure fourth-power contribution also vanishes because
$(4\eta+t\eta')t^3=(t^4\eta)'$. On a trim where $\eta=1$,
$|\mu_i|$ is bounded by
\[
 \left|\int\eta(d_i)\,d\mu_i\right|
 +2\mu_i^-(\operatorname{supp}\eta(d_i)),
\]
using $|\mu|=\mu+2\mu^-$ and $0\le\eta\le1$. This proves
the stated bound even when the constant prefix volume
$C_i$ diverges and the curvature measure on that prefix has no
smallness. Controlling the signed radial integral alone would
still leave $\mu_i^-$ in the bound.

The logarithmic selection uses adjacent subintervals lying in
the middle half of the log range. Endpoint differences of a
nonincreasing scalar telescope, and the curvature integrals
add over intervals since the distance spheres have zero
four-volume. An interval therefore satisfies the stated bound
by the arithmetic mean. With $N_i$ of order $\sqrt{T_i}$,
both the interval width and its two endpoint buffers in log
scale tend to infinity, while the sum bound tends to zero.
The distance ratios to the original quantiles and bounded
diameter imply $\rho_i\to0$.

## Verification of the Ricci premises

For the centered route a constant $K$ with
$\operatorname{Ric}_{g_i}\ge-3K g_i$ on the physical centered
ball suffices. Only radial Ricci enters the smooth Riccati
inequality along pre-cut minimizing segments. The polar
Jacobian divided by $\operatorname{sn}_K(t)^3$ starts at one
and decreases along each ray, and is set to zero after its cut.
The coarea ratio is nonincreasing, as is its weighted ball
average with denominator $v_K(t)=4\omega_4\int_0^t
\operatorname{sn}_K(u)^3du$. After scaling, the model is
$v_{K\rho_i^2}$. On a fixed positive-distance strip its
fourth-power error tends to zero at order $K\rho_i^2$.
Riccati and the nonpositive singular cut term bound
$\Delta(d_i^2/2)$ above by
$(1+3d_i\,\operatorname{sn}'_{K\rho_i^2}(d_i)/
\operatorname{sn}_{K\rho_i^2}(d_i))dV_{h_i}$.
The excess of this coefficient over four is $O(K\rho_i^2)$
on the strip, and its normalized full volume is bounded by the
same centered model. This gives small $\mu_i^-$ and controls
the entire signed defect in the preceding estimate.

For the protected route let $s_i$ be the inner protected
radius in the physical source. On a minimizing ray before its
cut and at any $r_0>s_i$, the mean-curvature function $H$
satisfies $H'+H^2/3\le3K$ beyond $r_0$. The model
$3\operatorname{sn}'_K(t-r_0)/\operatorname{sn}_K(t-r_0)$
is initially larger since it has a pole at $r_0$. Scalar
comparison until the cut, followed by $r_0\downarrow s_i$,
gives the shifted upper bound on the smooth locus. The
distributional cut sign gives it everywhere in the protected
open annulus. If $A(t)=V'(t)$ in the physical metric, testing
that distributional inequality against $\eta(d)$ for
nonnegative smooth $\eta$ yields
\[
 DA \le 3(\operatorname{sn}'_K/\operatorname{sn}_K)(t-s_i)\,
 A(t)\,dt.
\]
Multiplying by $\operatorname{sn}_K(t-s_i)^{-3}$ proves the
area ratio decreases. Its positive-weight average beginning
at $2s_i$ is also nonincreasing. At $4s_i$ the denominator
$v_K(3s_i)-v_K(s_i)$ is at least a fixed multiple of
$s_i^4$. Thus the specified measured volume bounds this
ratio uniformly, without including the core. The lower
normalization floor on $[8s_i,\min(1,b_i)]$ follows from the
physical volume floor on the ball of radius $t/8$ centered
at distance $t/2$ along a minimizing segment from $x_i$.
That ball stays strictly in $\{2s_i<d<t\}$.

Logarithmic selection makes $s_i/\rho_i\to0$. In normalized
variables set $\sigma_i=s_i/\rho_i$ and $k=K\rho_i^2$.
The model for the selected ratio after removal of the constant
core prefix is $v_k(t-\sigma_i)-v_k(\sigma_i)$. Uniformly on
a fixed positive-radius strip it differs from $\omega_4t^4$
by $O(\sigma_i+k)$. The same parameters bound the excess of
$1+3t\,\operatorname{sn}'_k(t-\sigma_i)/
\operatorname{sn}_k(t-\sigma_i)$ over four. The normalized
strip volume, which uses neither the core nor the constant
prefix, is uniformly bounded by the outer model ratio.
Both inputs to the defect bound therefore tend to zero.
The E53 absolute transition volume $o(1)$ lacks the
required fourth-order rate. A protected supercritical
integral bound on physical Ricci can be used on its stated
local balls, whereas Petersen–Wei Lemma 2.3 estimates centered
volume ratios using the negative Ricci deficit on the entire
larger comparison ball and $p>2$ in dimension four.
[Petersen–Wei, §2 and Lemma 2.3](https://www.math.ucla.edu/~petersen/Papers/28.pdf)
· [Physical transition-volume assessment](../../../../../master/reviews/E25_ANNULAR_VOLUME.md)

## Fixed shift, scalar omission, and the resulting mark

The finite E56 calibration supplies positivity of
$\mu_\alpha=4dV_h-\Delta_h((r-\alpha)^2/2)$ with fixed
$\alpha>0$. On the same finite interval the weak product rule
and eikonal identity give
\[
 \mu_0=\frac{r}{r-\alpha}\,\mu_\alpha
       -\frac{3\alpha}{r-\alpha}\,dV_h .
\]
A genuine shifted equality gives a strictly negative unshifted
defect there. A genuine unshifted equality gives
$\mu_\alpha=3\alpha\,dV_h/r$. E59's protected Ricci argument
has the different source shift $\sigma_i\to0$, which yields
the unshifted result even if the actual comparison $r$ is
defined only on the finite E53 range. The centered E59 route has
shift zero from the beginning. Neither uses E56's shifted
volume equality. [Frozen E56 review](E56_FLUX_CHECK.md)

For the separate scalar route, centered full shell masses
minus actual omitted masses give measured image shell masses
with the *same* normalization. A discrepancy between the two
normalized omissions survives even when the full scalar volumes
saturate. If both omissions vanish separately, a lower bound
on the full-shell normalized values proves the positive
limiting image value. In this source that lower bound follows
by placing a ball of radius $(v-u)\rho_i/4$ at distance
$(u+v)\rho_i/2$ on a minimizing segment from $x_i$ for a
fixed positive normalized interval $(u,v)$. The median
exterior guarantees a segment reaching $v\rho_i$ at late
indices, and the physical small-ball floor bounds the volume
of this internal ball below by a multiple of $\rho_i^4$.
A ball-ratio floor by itself need not imply a lower bound on a
difference of two ball volumes. To use E56 beginning at fixed
$\alpha>0$, apply this image-volume accounting with the
shifted fourth-power denominator.

For the full-defect route, every compactly supported
comparison test has bounded supremum norm and lies on a single
fixed normalized source trim at late indices. The all-source
total variation bound controls its transport regardless of
how much annular volume lies outside the image. Uniform metric
and distance convergence with local uniform Lipschitz control
give the limiting distributional unshifted equation. The
separate compact comparison and properness ensure the Bochner
cone is available across the whole buffered strip. The
critical-curvature and first-order physical estimates then
supply the inherited quotient exclusion and anchored marking.
Both cap costs are evaluated relative to the actual raw sides.
Their vanishing and the fixed source margin below $2T$
give the same-type minimizing contradiction. This conclusion
still requires a proper flat comparison at the particular
selected scale, together with a verified Ricci route or the
finite measure test, on the actual separated-quantile source.
