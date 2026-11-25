# E56a · Ricci flow at the unattained endpoint

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance and the collaborating master lead. Bounded E derivation on the
closed Riemannian four-dimensional endpoint. Actual serving model and
reasoning effort are unavailable. Frozen master and descent TeX bundles
`15c0f568bb52bdde` and `d68f8bb116c8bdbd`, respectively. Inspected
[endpoint input](../manuscript/endpoint_charge.tex) SHA-256 prefix
`b877c61b76b7` and [E53–E55 assessment](../../research-progress/handoffs/E53_E55_ENDPOINT_CHARGE_20261125.md)
SHA-256 prefix `7a5d95fb9860`. The [manuscript proof](../manuscript/endpoint_smoothing.tex)
is ready for independent reading. The curvature threshold argument and
the volume-based recognition step incorporate the lead's derivations.

## Result and scope

The modified Yamabe estimates suffice for uniform positive-time Ricci
flow smoothing and closed endpoint attainment. They give a global,
vanishing $L^2$ norm for the curvature exceeding a fixed bounded
background. This allows an absorption estimate on the closed manifold
and avoids needing uniform upper volume ratios on its initial balls.
The only initial scalar lower bound used by the flow is a common finite
bound, available from $R_{q_i}-6L_{q_i}=c_i$ with $L_{q_i}\ge0$.
After transport of the full Einstein defect, the evolving volumes and
Chern–Gauss–Bonnet recover energy $T=4\pi^2$ on an actual smooth
positive limit. The inclusive recognition theorem excludes that limit on
a nonstandard smooth homotopy sphere. All estimates are uniform over
varying smooth homotopy spheres. In particular, the argument yields some
$\eta>0$ such that any positive Yamabe class of energy less than
$T+\eta$ on a homotopy sphere identifies the standard smooth type.
There is no numerical value of $\eta$ in this proof. Positive entry on
arbitrary smooth types and descent through the higher energy band remain
open.

## Initial data and analytic constants

Use the oriented real Weyl endomorphism normalization of the descent
draft and the ordered four-index tensor norm for $\mathrm{Rm}$. Let
$e_i=E_+(g_i)\to T$, with smooth volume-one positive ordinary Yamabe
representatives $g_i$ on hypothetical nonstandard smooth homotopy
four-spheres. On each class the strict endpoint deficit gives
$D_i+B_i\to0$ and $Y_i,6\|L\|_2\to y_*=8\sqrt3\pi$. The volume-one
modified Yamabe metrics have $R_{q_i}-6L_{q_i}=c_i\to0$. They satisfy
$\|R_{q_i}-y_*\|_2\to0$, $\|\operatorname{Ric}_{0,q_i}\|_2\to0$, and
$\||\mathrm{Rm}_{q_i}|^2-64\pi^2\|_1\to0$. Only the part of the endpoint
input through its auxiliary curvature density estimate is needed. Its
subsequent finite disk selection and comparison metric never enter the
flow construction. Approximate the positive $C^{2,\alpha}$ conformal
factor in $C^2$ on each individual compact source, choose errors small
enough to preserve all limits, and renormalize each volume to one. The
smooth metrics $h_i$ have $R_{h_i}\ge-1$ eventually and
$\|\operatorname{Ric}_{h_i}-(y_*/4)h_i\|_2\to0$. The spectral and modified
Yamabe inputs are recorded in the [E54 source review](../../reviews/E54_SPECTRAL_ENDPOINT.md).

The Yamabe quotient gives the uniform initial inhomogeneous Sobolev
inequality $\|f\|_4^2\le S_0(\|df\|_2^2+\|f\|_2^2)$, because
$(Y_i-\|R_{h_i}-y_*\|_2)\|f\|_4^2\le6\|df\|_2^2+y_*\|f\|_2^2$.
Ye's Theorem D* uses the initial Sobolev constant from (2.4), with the
prescribed coefficient $\operatorname{Vol}^{-1/n}$ for the unsquared
$L^2$ term. The inhomogeneous inequality here has an arbitrary uniform
coefficient for that term. Use the direct entropy calculation and
Ye's Theorem 5.5 instead. For $\|f\|_2=1$ and
$Q_t=\int(|df|^2+Rf^2/4)dV_t$, Jensen gives
$$
\int f^2\log f^2\,dV_0\le 2\log\|f\|_4^2
\le 2\log[S_0(Q_0(f)+5/4)]
\le \sigma Q_0(f)-2\log\sigma+C_0,
\quad 0<\sigma\le5.
$$
This yields a lower bound for $\mu(h_i,\sigma/4)$, with normalization
$\mathcal W=\sigma Q-\int f^2\log f^2-2\log(\pi\sigma)-4$. Perelman's
monotonicity carries it to the weighted logarithmic inequality for
$0<\sigma<1$, on time intervals $t\le1$ within each independently started
smooth compact flow. The scalar minimum principle retains $R\ge-1$.
Apply Ye's Theorem 5.5 with logarithmic dimension $4$, positive parameter
cutoff $1$, and potential $R/4$ (negative part bounded by $1/4$).
This gives $\|f\|_4^2\le A Q_t(f)+B\|f\|_2^2$ with uniform $A,B$.
[Perelman, arXiv:math/0211159v1, (3.1)–(3.4)](https://arxiv.org/pdf/math/0211159v1#page=8)
· [Ye, arXiv:0707.2424v4, (2.4) and Theorem 5.5, (5.17)–(5.18)](https://arxiv.org/pdf/0707.2424v4#page=22)

## Curvature excess and smooth continuation

For $U=|\mathrm{Rm}|$, use $(\partial_t-\Delta)U\le aU^2$ with a
dimensional $a>0$. Set $K_0=8\pi$, $\phi(0)=K_0$, $\phi'=a\phi^2$,
and $v=(U-\phi)_+$. Fix the horizon $t_*$ before either $\phi$ or the
Einstein coefficient can diverge, with $\phi\le2K_0$. Initially
$v^2\le |U^2-64\pi^2|$ and $\|v(0)\|_2=o(1)$. The distributional
positive-part rule gives $(\partial_t-\Delta)v\le a(v^2+2\phi v)$.
The scalar contraction has $R_+\le c_4(\phi+v)$. Whenever $\|v\|_2\le\delta$,
the scalar term with $v$ in the weighted Sobolev inequality costs at
most $(A c_4/4)\delta\|f\|_4^2$, absorbed for small $\delta$. This gives
a uniform unweighted Sobolev inequality at those times. In the weighted
volume evolution the energy then satisfies
$$
 \frac{d}{dt}\|v\|_2^2+2\|dv\|_2^2
 \le 2a\|v\|_2\|v\|_4^2+C\|v\|_2^2.
$$
With smaller fixed $\delta$ this yields a Gronwall bound
$\sup_t\|v\|_2\le C\|v(0)\|_2=o(1)$ and a gradient integral bounded by
$C\|v(0)\|_2^2$. Continuity of the norm for each individual smooth
solution closes the smallness interval through every existing time up to
$t_*$. No uniform existence was used to derive that interval estimate.

The unweighted Sobolev constant controls volume from below independently
of Ricci curvature. A cutoff equal to one on $B(x,r/2)$ and zero outside
$B(x,r)$ gives $V(r/2)^{1/2}\le 5S r^{-2}V(r)$ for $r\le1$. Iteration
of $m(r)=r^{-4}V(r)\ge (20S)^{-1}m(r/2)^{1/2}$ and smoothness at the
fixed point give $m(r)\ge (20S)^{-2}$. At a running spacetime maximum
$(x,t)$ of $sU(x,s)$, put $K=U(x,t)$. If $tK\ge2$, then $U\le2K$
globally on $[t-K^{-1},t]$. In scale $K=1$, the compact maximum
principle applied to $s|\nabla\mathrm{Rm}|^2+A_1|\mathrm{Rm}|^2$ with
large $A_1$ gives a unit bound up to a dimensional factor. This is
the global first derivative estimate. After rescaling it gives
$|\nabla\mathrm{Rm}|\le C K^{3/2}$ at time $t$. If
$K\ge\max(1,8K_0)$, then the ball of radius $cK^{-1/2}$ around $x$ has
$v\ge K/4$. The volume bound gives $\int v^2\ge c'>0$, uniformly,
contradicting the vanishing curvature excess. Hence $tU$ is uniformly
bounded. The compact bounded-curvature continuation criterion now gives
existence through $t_*$. This proof needs no bound on the initial
maximum or its spatial location. [Hamilton, *Three-manifolds with positive Ricci curvature*, §§7, 13–14](https://doi.org/10.4310/jdg/1214436922)

There is also an iteration proof of the curvature estimate. For
$p=2,3$, testing against $pv^{p-1}$ gives dissipation
$4(p-1)p^{-1}\|d(v^{p/2})\|_2^2$ and a reaction bounded by
$ap\|v\|_2\|v^{p/2}\|_4^2+C_p\|v\|_p^p$. Absorb the critical term for
these two fixed exponents. The $p=2$ gradient estimate bounds
$\int_0^t\int v^3\le C\|v(0)\|_2^3$. Choose a time in the central
portion of any existing interval with small spatial $L^3$ norm by
averaging, and apply the $p=3$ estimate to all later times. Once
$H=\sup\|v\|_3$ is controlled, use
$\int v f^2\le H\|f\|_3^2\le H\|f\|_2^{2/3}\|f\|_4^{4/3}$
with $f=v^{p/2}$ and Young's inequality to absorb one gradient term
at cost $C(1+p^3(1+H^3))\|f\|_2^2$. Increasing $p$ by the spacetime
Sobolev exponent $3/2$ on nested time intervals with time cutoffs gives
the interior $L^\infty$ estimate. For a proposed finite maximal time
$t_0\le t_*$, this may first use constants depending on $t_0>0$ and
still rule out a finite maximal time. Once existence is uniform, the
same argument gives uniform positive-time constants. The running
maximum proof in the manuscript avoids this iteration.

## Defect and energy at a fixed positive time

Write $P=\operatorname{Ric}-\lambda(t)h_i(t)$ and
$\lambda'=2\lambda^2$, $\lambda(0)=y_*/4$. In the moving orthonormal
frame the Ricci equation is $(\partial_t-\Delta)\operatorname{Ric}
=2\mathrm{Rm}(\operatorname{Ric})$. Substitution gives the homogeneous
defect equation $(\partial_t-\Delta)P=2\mathrm{Rm}(P)+2\lambda P$.
The moving frame contraction uses $\mathrm{Rm}(h_i)=\operatorname{Ric}$.
After integration, boundedness of $\lambda,\phi$ and $R\ge-1$ leave
only $C\int v|P|^2$ in addition to the lower order $L^2$ term.
Kato, Hölder and the established uniform Sobolev constant absorb that
term as before. Thus $\sup_t\|P\|_2=o(1)$. Let $V_i=\operatorname{Vol}_{h_i(t)}$.
Then $V_i\le e^{t_*}$ and $V_i'+4\lambda V_i=-\int\operatorname{tr}P$
approximates the shrinking Einstein volume equation with uniform
$o(1)$ error. This gives $V_i(t)\to(1-2\lambda(0)t)^2$ uniformly.

At a fixed interior time, the curvature bound, ball volume lower bound,
and total volume upper bound give injectivity radius and diameter
bounds. For diameter, pack disjoint balls of a fixed small radius along
a minimizing geodesic. Curvature derivative estimates at a positive
time give smooth compactness modulo diffeomorphisms. In particular the
limit is closed and diffeomorphic to all sufficiently late members of
the chosen subsequence. The limit is positive Einstein and has
$\int R^2=(4\lambda(t))^2(1-2\lambda(0)t)^2=y_*^2=192\pi^2$.
Hence Chern–Gauss–Bonnet and equality of chiral energies give
$16\pi^2=2e+192\pi^2/24$, or $e=T$. The limit's scalar curvature is
positive, placing the actual smooth class within the inclusive
recognition theorem. The proof therefore uses the exact energy of the
limit and requires no estimate of Weyl energy monotonicity under the
flow. [Cheeger–Gromov–Taylor, Theorem 4.7](https://doi.org/10.4310/jdg/1214436699)
· [Hamilton, *A compactness property for solutions of the Ricci flow*](https://doi.org/10.2307/2375080)
· [Descent draft, inclusive threshold](../manuscript/fixed_type_chiral_energy_descent.tex#L76)

The scalar inequality $R-6L\ge-o(1)$ also yields a small initial
distance to the invariant nonnegative isotropic-curvature cone.
In dimension four the two smallest eigenvalues of each diagonal
curvature block sum to $R/6-z_\pm$. The minimum of these sums is
$R/6-L$. Adding $k$ times the unit constant-curvature tensor adds
$2k$ to each sum, so the initial distance is $o(1)$ pointwise after
$C^2$ smoothing. A parallel, closed, convex curvature cone $\mathcal C$
invariant under the quadratic evolution ODE has fibre distance $d$ with
$(\partial_t-\Delta)d\le C U d$ weakly. At a tensor $X$ outside the
cone, write $P_\mathcal C(X)$ for its Euclidean projection. Convexity
handles the diffusion, the projection normal pairs nonpositively with
the reaction at $P_\mathcal C(X)$, and the quadratic reaction difference
is bounded by $C|X|d$ since $|P_\mathcal C(X)|\le|X|$. This gives the
same $L^2$ propagation estimate for the cone distance. In this
dimension, the cone invariance also follows from Hamilton's block
equations. At a boundary face with $a_1+a_2=0$, the lowest-two trace
of $A^2+BB^{\mathsf T}+2A^\#$ is bounded below by
$a_1^2+a_2^2+2a_3(a_1+a_2)=a_1^2+a_2^2$, and the other diagonal
block works the same way. On a smooth positive-time limit the cone
distance is zero.
This is a separate check on the requested isotropic defect, independent
of the recognition proof. An alternative recognition would use the
classification of compact positive Einstein four-manifolds with
nonnegative isotropic curvature, followed by simple connectivity and
$b_2=0$. [Hamilton, *Four-manifolds with positive curvature operator*, §2, pp. 157–158](https://doi.org/10.4310/jdg/1214440433)
· [Brendle, Duke Math. J. 151 (2010), Theorem 1](https://arxiv.org/pdf/0812.0335v3#page=2)
· [Gursky–LeBrun, *On Einstein manifolds of positive sectional curvature*, §1](https://arxiv.org/pdf/math/9807055#page=1)

## Comparison to local smoothing theorems

Chan–Huang–Lee's Theorem 1.1 concerns complete noncompact smooth
manifolds of dimension at least four. The quantitative input includes a
scalar lower bound, volume doubling and a Euclidean-power upper volume
bound through scale one, a lower localized $\bar\nu$ entropy bound,
and uniformly small local $L^{n/2}$ full curvature on unit balls.
The ineffective lower Ricci bound is used for the exhaustion at
infinity. Their conclusion includes a common lifetime, a pointwise
$C\varepsilon/t$ curvature bound and local integral and injectivity
bounds. Martens's Theorem 1.1 removes the scalar lower bound and uses
the upper volume ratios, local entropy and curvature smallness with the
same type of ineffective lower Ricci input. His Claim 3.1 treats
bounded-curvature flows, using expanding balls in the critical
concentration argument. Smooth compact metrics can be started
individually and require no exhaustion. These primary statements alone
still leave an initial upper volume ratio condition in the local method.
[Chan–Huang–Lee, *Manifolds with small curvature concentration*, arXiv:2207.07495v1, Theorem 1.1 and Remark 1.1](https://arxiv.org/pdf/2207.07495v1#page=3)
· [Martens, *Removing scalar curvature assumption for Ricci flow smoothing*, arXiv:2408.11115v2, Theorem 1.1 and Claim 3.1](https://arxiv.org/html/2408.11115v2)

If an initial $q_i$-ball upper volume bound $V(r)\le C_0r^4$ were
available, then the curvature density estimate would give
$\int_{B_{q_i}(x,r)}U^2\le64\pi^2 C_0r^4+o_i(1)$ uniformly in $x$.
One chooses a small fixed scale first and then late indices. The
global initial Sobolev bound supplies a local $\bar\nu$ lower bound
by zero extension and the same normalized Jensen calculation with
the gradient energy. Under $h\mapsto r^{-2}h$, the coefficient of
the lower-order integral in the Sobolev inequality acquires a factor
$r^2$, so these entropy bounds are uniform when $r\le1$. The Sobolev
bound also gives the needed volume lower ratio,
which together with the proposed upper ratio gives controlled doubling.
The E55 capacity bound controls auxiliary volume of comparison
$k_i$-balls and supplies no inequality comparing those distances to
$d_{q_i}$. Thus that bound does not justify taking the local theorems
as a direct black box. Yang's convergence route uses a superscale
$L^p$ Ricci bound, $p>n/2$, in addition to small critical local full
curvature and the volume and Sobolev hypotheses. The estimates at this
endpoint are critical, and the compact excess argument above avoids
importing that stronger initial Ricci hypothesis. [Yang, *Convergence of Riemannian manifolds with integral bounds on curvature II*, Theorem 3.1 and its §2 mechanism](https://numdam.org/item/10.24033/asens.1647.pdf#page=3)
