# Critical-curvature smoothing and the physical metric

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance, under the bounded E23 request dated 25 November 2026.
The request specifies gpt-6.2-sol/ultra. Actual serving settings are unavailable.
Input checkout `7db310a2a9219c537b440d7c2fb39e602a32b729`.
[Frozen request](../research-progress/handoffs/E23_THIRD_REQUEST_20261125.md) ·
[Joint hypotheses and marking](../../../reviews/SECOND_COLLAR_ASSESSMENT_20261125.md)

## Inputs on the selected block

Let $g_i$ be smooth unit-volume positive Yamabe minimizers on a fixed smooth
closed oriented homotopy four-sphere. Use the SEC Hilbert–Schmidt positive
chiral energy band $4\pi^2\le E_+(g_i)\le 8\pi^2-\delta$, with $\delta>0$, and
assume $\int_M |B_{g_i}|\,dV_{g_i}\to0$. Let the two centered physical radii
$a_i<b_i$ enclose cumulative chiral masses $\eta$ and $E_+(g_i)-\eta$, with
$2\eta<E_+(g_i)$, fixed $\eta>0$ and $b_i/a_i\to\infty$. Choose the growing
middle block $[\ell_i,u_i]$ as in E12 and set $\rho_i=\sqrt{\ell_i u_i}$,
$h_i=\rho_i^{-2}g_i$. The choice uses the full tensor curvature budget and
E11's physical diameter bound. It also works with approximate Bach
flatness. The rescaled blocks exhaust each fixed positive radial interval,
$\rho_i\to0$, and their full tensor $L^2$ curvature norms $\varepsilon_i$
tend to zero. Both marked mass sets stay outside the block. For each
$h_i$ the original Yamabe inequality is

$$
 \|f\|_{4,h_i}^2 \le \frac{6}{Y_i}\|df\|_{2,h_i}^2
          +\rho_i^2\|f\|_{2,h_i}^2,\qquad Y_i\ge\sqrt{48\delta}.
$$

Extension by zero gives it on protected balls. E11 also gives a scale-uniform
lower bound $\operatorname{Vol}_{h_i}B(x,r)\ge c r^4$ on fixed windows, by
applying its physical bound at radius $\rho_i r$. Its ball test gives a lower
bound. Unit total physical volume only gives the scale-dependent upper bound
$\rho_i^{-4}$ in $h_i$. The hypothesis audit has not obtained the needed uniform
upper ball-volume ratio by these estimates.
[NECK-E11](E11_BALANCED_BLOCK_AND_NONCOLLAPSE_20261125.md) ·
[NECK-E12](E12_EXACT_BACH_BALANCED_CUT_20261125.md)

## Primary theorem checked

The local result of Man-Chun Lee and Tang-Kai Lee, *Local mollification of
metrics with small curvature concentration*, arXiv:2510.12673v2, 1 June 2026,
Theorem 1.1, pp. 2–3, also published in *Compositio Mathematica* 162 (2026),
2675–2697, applies in dimension $n\ge3$ to a smooth initial metric
$k$ with $B_k(q,3+\bar r)\Subset M$, $\bar r\ge0$. It requires, at every
$x\in B_k(q,2+\bar r)$, an upper volume ratio $\operatorname{Vol}_k B_k(x,r)
\le v_0 r^n$ for every $0<r\le1$, an inhomogeneous $W^{1,2}_0\to
L^{2n/(n-2)}$ inequality with coefficient $C_s$ on $B_k(x,1)$, and small
$L^{n/2}$ full curvature there. There is no initial Ricci lower bound. Take
$\bar r=0$ and, if needed for protection, first rescale $h_i$ by one fixed
constant so the required balls are inside the middle block. This preserves the
critical curvature norm. The volume ratio must be uniform in $i$, including
at centers and radii below the block scale. Thus the only unverified geometric
input for this **local smoothing theorem** on the protected balls is the upper
ratio. Its constants depend on $n,v_0,C_s$. At $t>0$ it controls curvature,
injectivity and local $L^{n/2}$ curvature on a smooth flow through the actual
initial metric. Its time-zero distance comparison is bi-Hölder. Theorem 1.3,
p. 3, requires a global upper ratio together with a uniform Sobolev constant,
total critical curvature bound and diameter bound on compact manifolds. Its
limit is Gromov–Hausdorff, with a topological manifold off finitely many
points. The stronger small-*total*-curvature case in Remark 4.5 is a
different hypothesis from having small curvature on one long annulus.
[Lee–Lee, published Theorems 1.1 and 1.3](https://doi.org/10.1017/S0010437X26103595) ·
[arXiv v2 with Remarks 4.5–4.6](https://arxiv.org/pdf/2510.12673v2)

For comparison, the exact positive-Yamabe estimates of Chang–Qing–Yang use
$B=0$ to control the Ricci equation in their Theorem 2.4. Their Theorem 3.1
also uses $b_1=0$, separated scales, inner-area upper bounds and small full
annular curvature, and begins its proof with Theorem 2.4. Under the E23
hypotheses the Ricci equation has an inhomogeneity controlled only in $L^1$.
E17 demonstrates failure of the direct pointwise bound, including after
physical Yamabe minimizer selection. Its perturbation is small in $C^1$
and $W^{2,p}$ before renormalization, so it provides no adverse test of a
first-order chart. Deane Yang's compactness theorem uses lower volume, bounded diameter,
small critical full curvature and a supercritical $L^p$ Ricci bound, $p>n/2$.
Its local harmonic-coordinate theorem uses a ball Sobolev constant with
small curvature and a supercritical Ricci norm. Neither the local $L^2$ full curvature
norm nor vanishing integrated Bach verifies this extra Ricci input.
[Chang–Qing–Yang v2, equation (2.5), Theorems 2.4 and 3.1](https://arxiv.org/pdf/math/0508621v2) ·
[NECK-E17](E17_WEAK_BACH_CURVATURE_SPIKES_20261125.md) ·
[Yang, Ann. Sci. ÉNS 25 (1992), Theorems 3.1 and 7.1, pp. 181 and 186](https://www.numdam.org/item/10.24033/asens.1647.pdf)

## A conditional chart with a small exceptional set

Assume the upper ratios of Lee–Lee's Theorem 1.1 at one protected center
$q_i$ on the fixed ball scale just described. Write $k_i(t)$ for the local
flow, and $k_i(0)$ for the actual constant rescaling of $g_i$. In dimension
four the theorem gives $|\mathrm{Rm}_{k_i(t)}|\le C(\varepsilon_i+\sqrt t)/t$,
$\operatorname{inj}_{k_i(t)}\ge c\sqrt t$, and

$$
 \|\mathrm{Rm}_{k_i(t)}\|_{L^2(B_{k_i(t)}(q_i,1/2))}
       \le C(\varepsilon_i+\sqrt t).
$$

The bi-Hölder comparison puts a fixed small initial ball
$D_i=B_{k_i(0)}(q_i,r_*)$ inside $B_{k_i(t)}(q_i,1/2)$ for all sufficiently
small times, uniformly in $i$. To see this, take $r_*$ within the theorem's
comparison radius and use its lower bound on $d_{k_i(0)}(q_i,x)$ in terms of
$d_{k_i(t)}(q_i,x)$. The resulting exponent for the upper bound on the
latter distance stays uniformly positive when $\varepsilon_i$ is small.
Hence for each small $t$,

$$
 \int_0^t\int_{D_i}|\mathrm{Ric}_{k_i(s)}|_{k_i(s)}^2\,dV_{k_i(s)}\,ds
 \le C(\varepsilon_i^2 t+t^2).
 \tag{1}
$$

At each $x\in D_i$ put $F_t(x)=\int_0^t |\mathrm{Ric}_{k_i(s)}|_{k_i(s)}(x)\,ds$.
The metric obeys $|\partial_s\log k_i(s)(v,v)|\le2|\mathrm{Ric}|(x,s)$ for
any fixed nonzero tangent vector at $x$, and the volume density obeys
$|\partial_s\log dV_{k_i(s)}|=|R_{k_i(s)}|\le2|\mathrm{Ric}|$. On
$A_i(t,a)=\{x\in D_i:F_t(x)>a\}$, stop at the first forward time when the
accumulated integral reaches $a>0$. Up to that stopping time the volume
density and the initial density are comparable within $e^{2a}$.
Cauchy–Schwarz on the stopped interval gives $a^2\le t\int |\mathrm{Ric}|^2ds$
over that interval. Integrate over the bad points in the initial measure
and use (1), extending each time integration to the full interval after the
measure comparison. The same argument run from $t$ backward compares with
the time-$t$ density. This gives the two-sided bad-volume estimate

$$
 \max_{s\in\{0,t\}}\operatorname{Vol}_{k_i(s)} A_i(t,a)
 \le C e^{2a}a^{-2} t^2(\varepsilon_i^2+t).
 \tag{2}
$$

In an oriented $k_i(t)$-orthonormal frame at $q_i$, use the time-$t$
exponential map applied to $\sqrt t\,z$ for $|z|<c_0$, where $c_0$ is below
the uniform rescaled injectivity bound. For sufficiently small $t$, the
image lies in $D_i$. Indeed the other bi-Hölder inequality bounds initial
distances by a fixed constant times a uniformly positive power of the
smoothed distance for points on the initial sphere of radius $r_*$. A
length-$c_0\sqrt t$ radial geodesic cannot reach that sphere. Along these
geodesics the rescaled sectional curvatures are bounded by
$C(\varepsilon_i+\sqrt t)$. The Jacobi equation in parallel frames gives
Euclidean coefficient error $C(\varepsilon_i+\sqrt t)$ for the pullback of
$t^{-1}k_i(t)$ on the fixed model ball. Off the pulled-back bad set,
$e^{-2a}k_i(t)\le k_i(0)\le e^{2a}k_i(t)$. For $0<a\le1$, the coefficient
error of the pullback of $t^{-1}k_i(0)$ there is at most
$C(a+\varepsilon_i+\sqrt t)$. By (2) and the smooth metric's comparison, the
model Euclidean measure of the bad set and its rescaled original measure
are both at most $C a^{-2}(\varepsilon_i^2+t)$. Thus with $a=t^{1/4}$, first
take $i\to\infty$ at fixed short time and then $t\downarrow0$. Both the error
outside the bad set and the two normalized bad measures vanish in this
order. The original metric is being compared after **constant** rescalings,
using embeddings from a **different**, positive-time metric on the same
source domain. This assertion is local and places no restriction on the
shape or capacity of the exceptional set.

## Implication still needed for the branch

Even with the upper ratio, (2) produces one local ball, with a second
shrinking radius $\sqrt t$ within the normalized scale. A balanced cut
needs an embedded spherical or finite spherical-quotient annulus with
protected buffers that contains every crossing between the two source
mass sets, as in the complete-shell argument of E12. It also needs the
original physical tensors to be close on that annulus in $L^\infty$ and
with first derivatives close in $L^4$, or a replacement estimate that
controls the metric splice and keeps the source separation through the
exceptional sets. A small exceptional volume gives neither such estimate
nor the positioning of the boundaries. The curvature estimate at positive
time cannot simply be integrated at zero in $L^\infty$: its
$C\varepsilon_i/t$ term has divergent time integral for each
$\varepsilon_i>0$. Smoothness of the individual $g_i$ provides an
initial-time bound depending on $i$, with no uniform comparison here.
For a base alternative, EXTRACT-E09/E11 still require genuine embeddings
on full compact truncations with smooth conformal comparison and a smooth
removable gauge on the completed base. Lee–Lee's distance limit gives no
such smooth conformal representative of the original data.
[EXTRACT-E09](../../02_dirac_collar_extraction/notes/E09_CONFORMAL_BASE_VOLUME_DICHOTOMY_20261125.md) ·
[EXTRACT-E11](../../02_dirac_collar_extraction/notes/E11_VANISHING_FACTOR_GREEN_LIMIT_20261125.md)

First take the geometric-mean rescaling of the growing physical annuli
and fix a protected window. The conditional estimate takes the source-index
limit on that
window at each fixed smoothing time before sending the time to zero. It
therefore gives no simultaneous comparison on expanding windows. The first
open implication in this smoothing route is a local uniform upper volume
ratio in the original physical gauge, or a smoothing theorem dispensing
with that premise in the same source class. The subsequent comparison
requires source tensor control and genuine marked coverage. A new route
to either implication returns to NECK-B05.
