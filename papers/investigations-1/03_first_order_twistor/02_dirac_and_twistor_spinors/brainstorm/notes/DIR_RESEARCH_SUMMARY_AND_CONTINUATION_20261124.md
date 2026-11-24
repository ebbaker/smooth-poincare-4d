# Dirac and twistor spinors — results and continuation

24 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI assistance. The selected model identifier and reasoning effort
were unavailable. This discussion uses repository revision
`e76752648b69969b1234d0295530c87fce9fcdcb`. The
[original routing](../../continuation-notes/CONTINUATION.md),
[first handoff](../../continuation-notes/01_AFTER_CONCENTRATION_AND_BALANCE_20261124.md),
[current handoff](../../continuation-notes/02_AFTER_FIVE_EIGENFUNCTION_RIGIDITY_20261124.md)
and [progress register](../../research-progress/REGISTER.md) give the
underlying scope and evidence. The continuation ideas below are proposals
for discussion.

## What the branch has established

**A chiral twistor spinor gives an exact geometric endpoint.** On a
smooth closed Riemannian homotopy four-sphere, a nontrivial positive chiral
twistor spinor forces $W^+=0$. Signature zero then forces $W^-=0$, and
conformal development identifies the manifold with the standard sphere.
Round Killing spinors supply the chiral twistor solution in the converse
direction. The normalized lowest twistor energy has infimum zero in
every conformal class, including classes where the spinor mass can
concentrate and the infimum is unattained. The hard step is constructing
a metric and spinor with a smooth nonzero limit on the given manifold.
[Construction assessment](../../reviews/DIR_B05_CONSTRUCTION_ASSESSMENT_20261124.md) ·
[Recognition audit](../../../notes/SH_E01_20261124.md)

**The twisted Dirac comparison exposed a second concentration problem.**
Optimizing the modified Yamabe functional over degree-one maps in a
fixed conformal class gives $\min\{Y([g]),0\}$. The supremum is attained
exactly in conformally round classes. A single shrinking ball can carry
the full degree. On a supplied Yamabe minimizer, mean-zero maps whose
modified Yamabe values tend to zero have a first-eigenfunction limit.
The limit can lose the degree. With a uniform positive lower bound on the
coordinate covariance, the limit has five independent coordinates and
the rigidity theorem below applies directly. Degree-zero eigenmaps
into a great $S^2$ or $S^3$ at scalar equality remain open on nonround
homotopy spheres.
[Construction assessment](../../reviews/DIR_B05_CONSTRUCTION_ASSESSMENT_20261124.md) ·
[Spectral assessment](../../reviews/DIR_B22_FIVE_EIGENFUNCTIONS_20261124.md)

**Five scalar eigenfunctions recognize a round metric.** For a
unit-volume Yamabe minimizer on a smooth closed connected four-manifold,
let $s$ be its scalar curvature and count the positive eigenvalues
$\lambda_i$ of $d^*d$ with multiplicity. The branch proves

$$
\frac35\sum_{i=1}^5\lambda_i-s\ge 0,
$$

with equality exactly for the round sphere up to scale. The second
variation gives $s\le 3\lambda_1$. At $s=3\lambda_1$, the fourth variation
bounds the fourth moment of each normalized first eigenfunction by $15/7$.
Five independent first eigenfunctions saturate the bound and yield a
sphere-valued map whose differential recovers the round metric up to
scale. For a sequence with $s_j>0$ and $3\lambda_5(g_j)/s_j\to1$ on
actual Yamabe minimizers, scale the first five $L^2$-orthonormal
eigenfunctions by $1/\sqrt{5}$. Their joint distribution tends to uniform
measure on $S^4$. Smooth recognition in that regime still requires
geometric control. The additional pointwise bound
$\operatorname{Ric}_{g_j}\ge(1-\delta_j)(s_j/4)g_j$ with $\delta_j\to0$
is one sufficient condition.
[Spectral assessment](../../reviews/DIR_B22_FIVE_EIGENFUNCTIONS_20261124.md) ·
[Ricci comparison](../../notes/DIR_E45_20261124.md)

**A puncture gives Dirac boundary data on every input.** One can choose
a metric flat near the marked point and deform it away from the point to
make its compact Dirac operator invertible. Its Green spinor gives a
harmonic half-spinor approaching a nonzero constant on the exactly
Euclidean end. Parallelism would supply the recognizing
compact twistor spinor. Even on the standard sphere, zero-free Green
spinors can have arbitrarily small scale-invariant first-order error
while the chiral Weyl energy diverges. The curvature identity locates
the missing control in a projection of the derivative of the twistor
error. [Boundary assessment](../../reviews/DIR_B19_GREEN_BOUNDARY_ASSESSMENT_20261124.md) ·
[Curvature projection](../../notes/DIR_E12_20261124.md)

## The next comparison

I would start with the current handoff's gluing test. Fix one punctured
core and one neck profile, and compare core-supported and round-chamber
Yamabe tests before estimating the spectrum. The four-dimensional
Yamabe quotient of a compactly supported test is invariant under
homothetic rescaling of the core. A core test below the spherical value
can therefore compete even as the core volume tends to zero. The first
question is whether the minimizing conformal factor and the five
near-round trial modes occupy the same region. A fixed nonround
conformal class on the standard sphere would provide a control for the
comparison.

If the chamber controls the actual minimizers, the next checks are
$s_j>0$, the relative pinching $3\lambda_5(g_j)/s_j\to1$ on those
minimizers, and geometric control strong enough to detect the original
smooth structure. If a lower-energy core defeats that profile, a
nonconformal deformation that controls the minimizing metric and its
first five modes is a more direct next candidate. The Green-spinor
route becomes competitive if a new equation can control the
curvature-bearing derivative. Excluding the remaining low-dimensional
eigenmaps would sharpen the fixed-metric theorem and would still leave
metric construction open.
[Current handoff](../../continuation-notes/02_AFTER_FIVE_EIGENFUNCTION_RIGIDITY_20261124.md)
