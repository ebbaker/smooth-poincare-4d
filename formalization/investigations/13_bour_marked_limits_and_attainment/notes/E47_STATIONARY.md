# BAT-E04 · Stationary estimates in the two physical gauges

26 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. Actual serving model and reasoning effort
were unavailable. Bounded E proof at intake checkout
`4d73fdde6804ce93fc2a3e4cef403e16eb941dab`, Lean `4.35.0-rc3`,
DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`,
Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e`.
The [issued packet](../../research-progress/handoffs/ED05_E47_PACKETS_20261126.md)
freezes the [scientific manuscript](../../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/manuscript/fixed_type_attainment.tex)
at SHA-256 `719bbea527c6db649eaeee93e58e1f6b50f101772d79b406ee3ec378dca357f1`.
The supporting [CSC estimates](../../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/02_marked_limits_and_attainment/notes/CSC_ESTIMATES_20261126.md)
have SHA-256 `db5e120ef9dbbb0b387f492e8d2e1d9a3fff2c6210ff4875bd1d0a44b3451247`.

## Checked physical estimates

[`BourStationary.lean`](../../../SmoothPoincare/Variational/BourStationary.lean)
uses an actual smooth positive-definite metric and its physical measure
and open distance balls on a compact boundaryless real four-manifold.
The estimates require neither an orientation nor sphere topology.
Fix a positive Yamabe floor $y$, a constant scalar $0\le R\le C$,
and a scale $a\ge1$. The two gauges for the stationary argument are
$a=1$ and $a=Q_j$ for late curvature maxima $Q_j\to\infty$.

- `bourYamabe_smooth_test` uses the infimum over smooth logarithmic
  conformal factors, the existing logarithmic approximation for a
  nonnegative test with zeros, and Green's identity. The output uses
  the true fourth-power mass and the coefficient six.
  `bourYamabe_smooth_test_scale` rescales that result. The volume
  measure has weight $a^2$, the squared gradient integrand has
  weight $a^{-1}$, and the scalar coefficient becomes $R/a$.
- `bourBallVolume_lower_of_cutoff` accepts the manuscript's exact
  cutoff moment inequality with $24/r^2+C$ and derives its volume
  bound with constant $[y/(4(24+C))]^2$. For $d_n=r/2^n$ the normalized
  ratios $v_n=V(d_n)/d_n^4$ satisfy $v_n\ge c\sqrt{v_{n+1}}$,
  $c=y/[4(24+C)]$. If $v_0<c^2$, then $v_n/c^2\le(v_0/c^2)^{n+1}$
  tends to zero. The pinned `exists_uniform_small_ball_volume_lower_bound`
  supplies an eventual strictly positive lower bound for this single
  metric. That seed may deteriorate along the sequence.
- `bourTraceFreeRicci_scale` checks the actual covariant component
  identity for $E=\operatorname{Ric}-Rg/4$. `bourVolume_scale` checks
  the exact whole-manifold volume weight, so unit-volume sources have
  rescaled volumes $Q_j^2$.

The smooth radial approximation result adds an explicit cutoff profile
on the supplying metric. A linear distance cutoff of radius $3r/4$
is smoothed with error $1/12$ and derivative bound $2/r$ before
composing with the fixed profile. This gives a smooth test in $[0,1]$
equal to one on the open half-ball and zero outside the open $r$-ball.
Its gradient is bounded by $(1+8D)/r$ with $D$ the pinned profile's
global derivative bound. Applying the Yamabe test estimate and the
dyadic argument gives `bourBallVolume_lower_of_yamabe_scale` with
$[y/(4(6(1+8D)^2+C))]^2$. One positive lower constant therefore works
for the whole mixed parameter sequence in both physical gauges.

In the unit-volume gauge this lower constant $\kappa$ yields the
classical diameter bound $16/\kappa$. A minimizing geodesic of length
$L$ supplies $\lfloor L\rfloor+1$ unit-separated centers with disjoint
open half-unit balls of volume at least $\kappa/16$. This counting
and the injectivity step are separate from the checked estimates above.
For bounded full curvature, the pinned
`intrinsicInjRadius_ge_cheeger_gromov_taylor` is a candidate
integral-to-injectivity interface. It uses the global curvature bound,
the metric norm realization, a local diffeomorphism for the framed
exponential on its chosen radius, and a radial pullback volume in
the denominator. The application still needs a common exponential
radius and an upper bound on the radial pullback volume, or an existing
quantitative consequence with those conditions already discharged.
[Cheeger–Gromov–Taylor, Theorem 4.7](https://doi.org/10.4310/jdg/1214436699)

## Harmonic-coordinate supplier boundary

The geometric Euler field in Bour's conventions is an external
analytic input at the pin. For a smooth CSC Riemannian metric,
with $\nabla^*\nabla=-\nabla^a\nabla_a$, Bour's Proposition 4.4
and the contraction of the four-dimensional Ricci decomposition give
$G_p=\tfrac12\nabla^*\nabla E-W^\circ(E)+E\circ E-
\tfrac14|E|^2g+\tfrac{2-p}{12}RE$.
In particular $G_p=0$ implies $G_0=(p/12)RE$.
Each term has covariant weight $a^{-1}$ under $g\mapsto ag$,
as the connection is unchanged and contractions use the scaled inverse
metric. This is the source calculation for the mixed exact and
regularized sequence. The checked trace-free Ricci component identity
above provides one part of its geometric Lean implementation.
[Bour v1, Proposition 4.4 and Proposition 9.3](https://arxiv.org/html/1012.0342v1)

On the bounded-curvature gauge the first analytic chart input is
Peters Theorem 4.3, which gives harmonic charts from bounded sectional
curvature and positive injectivity radius on compact metrics.
The argument following Theorem 4.3 shrinks to fixed Euclidean interior
balls. The chart metric has uniform ellipticity and $C^{1,\gamma}$
control for a chosen $0<\gamma<1$. The next input is DeTurck–Kazdan
Lemma 4.1 and (4.3), giving
$g^{ab}\partial_a\partial_b g_{ik}
=-2(E_{ik}+Rg_{ik}/4)+P_{ik}(g^{-1},\partial g)$.
Here $P$ contains only first metric derivatives and smooth metric
coefficients. In dimension four the right side is uniformly bounded
under the chart and full curvature bounds.
[Peters, Theorem 4.3 and following proof](https://www.numdam.org/item/CM_1987__62_1_3_0.pdf#page=10)
· [DeTurck–Kazdan, §4](https://www.numdam.org/item/10.24033/asens.1405.pdf#page=7)

Choose a fixed Sobolev exponent $b>4$. The first PDE estimate
needed is local nondivergence interior $W^{2,b}$ with a bounded
right-hand side and a uniform Hölder modulus for the leading
coefficients. The metric equation supplies a $W^{2,b}$ metric bound
and hence $\partial\Gamma\in L^b$ on smaller balls. In the tensor
equation the leading coefficients are the same scalar diagonal
$g^{ab}$. Its first-order matrix coefficient uses bounded $\Gamma$
and its zeroth-order coefficient uses $\partial\Gamma+\Gamma*\Gamma$.
The product of that zeroth-order coefficient with the bounded $E$
is $L^b$, as are the algebraic curvature terms. Interpolation absorbs
the bounded first-order term on nested balls using the $L^b$ norm of
$E$ and the same interior estimate. The resulting $W^{2,b}$ estimate
for $E$ starts the Morrey and alternating Schauder steps. These steps
do not require a differentiated curvature bound at the start. In the
equations $p\in[0,1)$ enters only through $2-p\in(1,2]$.

The pinned `exists_harmonic_replacement_with_coordinate_bounds`
gives a Euclidean weak Dirichlet minimizer with componentwise bounds.
Its weak equation has the Euclidean identity coefficient and its
output has no chart diffeomorphism or uniform harmonic radius.
The inspected pins did not yield a Peters harmonic-radius theorem,
a harmonic-coordinate Ricci theorem, or the required nondivergence
interior $W^{2,b}$ theorem for this bootstrap. The pinned
`variable_coefficient_interior_schauder_estimate_of_cutoff` instead
has a Hölder source, a cutoff and controlled coefficient oscillation
premises. It is a candidate for the later Schauder steps after the
Sobolev and Morrey estimates have supplied the Hölder source.

Given those uniform bounds for all curvature derivatives, the pinned
`exists_canonical_metric_compactness_of_boundedGeometry` expects
a complete connected pointed sequence, `SeqBoundedGeometry` and
`BaseInjBound` and returns canonical smooth metric compactness data.
The two proposed outputs still need the corresponding geometric
bridge. On the original scale the diameter bound forces compactness
and a late whole embedding is a diffeomorphism. On the curvature
scale a compact pointed limit would give a late whole comparison,
contradicting volume divergence. Smooth convergence, vanishing
$R/Q_j$, the Weyl Euler residual $(p_j/12)(R/Q_j)E$, and the
curvature-one base point would then give the marked-core packet's
complete noncompact scalar-flat Bach-flat nonflat input. Passing
compact Sobolev tests and physical charge bounds is a separate operation.
[Bour, Theorem 7.1](https://arxiv.org/html/1012.0342v1#S7)

## Verification

`lake build +SmoothPoincare.Variational.BourStationary` succeeded.
`#print axioms` on the six public theorems above reported only
`propext`, `Classical.choice` and `Quot.sound`. The Cheeger–Gromov–Taylor
dependency compiled. The harmonic replacement, interior Schauder
and canonical compactness candidates were inspected at their pinned
source signatures. A build of those optional targets was stopped during
its transitive compilation. No stationary chart, elliptic or comparison
theorem from that optional build is used by the checked leaves.
