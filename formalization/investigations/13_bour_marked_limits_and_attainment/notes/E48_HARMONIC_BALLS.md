# BAT-E04 · Uniform physical balls for the harmonic-coordinate step

26 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. Actual serving model and reasoning effort
were unavailable. Intake checkout `226b8f404b6e5c99f8e71f85280e5c9988bbf652`.
Lean `4.35.0-rc3`, DifferentialGeometry
`788efe97894474c032de6dfb1289d515f613d15a`, Mathlib
`c55e6e786f49471c72fbddbec5415808896aec1e`.
The [stationary module](../../../SmoothPoincare/Variational/BourStationary.lean)
has SHA-256 `9aa23e36d2669e98c0684d6f8f3f4246a72cb7280c32f2a537bebc016f75214e`.
The [06 manuscript](../../../../papers/investigations-1/06_bour_flow_and_fixed_type_attainment/manuscript/fixed_type_attainment.tex)
has SHA-256 `719bbea527c6db649eaeee93e58e1f6b50f101772d79b406ee3ec378dca357f1`.
[Readback of E47 physical noncollapse](../reviews/E47_STATIONARY_AND_DEFICIT_READBACK.md) ·
[E47 assessment](../../reviews/ED05_E47_BOUR_BUDGET_AND_MARKED_RETURN.md)

Fix a smooth compact connected boundaryless Riemannian four-manifold.
Use the ordered four-index tensor norm, the ordinary two-tensor Ricci
norm, and the actual distance and volume of each physical metric.
Neither the orientation nor the homotopy-sphere hypothesis is used for
these estimates. The universal quantifier over eligible metrics in
[`BourHarmonicBalls.lean`](../../../SmoothPoincare/Variational/BourHarmonicBalls.lean)
allows arbitrary subsequence and either stationary scale without
changing the constant.

## From physical small balls to normal coordinates

`bourUniformInjectivity_of_ballVolume` takes a common bound
$\sup|\operatorname{Rm}|\le K$ and the lower ratio
$\operatorname{Vol}_g B_g(x,s)\ge\kappa s^4$ for all $0<s\le1$.
Choose the Jacobi comparison radius $d\in(0,1]$ with $K$ and the
dimension already fixed. Put $\rho=\min(d,\pi/\sqrt K)$ and $s=\rho/8$.
The pin's pointwise norm-to-Ricci formula gives
$\operatorname{Ric}\ge-16K\,g$, so $q=\sqrt{16K/3}$ is a common
hyperbolic comparison parameter. Its local Jacobi theorem controls the
framed exponential differential on the same radius for every metric.
The local Cheeger–Gromov–Taylor theorem uses a volume floor
$\kappa s^4$ and a hyperbolic denominator $D$ for the sum of the
physical ball volume and the exponential pullback volume. Both terms
in $D$ depend on the chosen radii and $q$ and are finite. Consequently
$(s/2)\kappa s^4/(D.\mathrm{toReal}+1)$ is a common positive injectivity
lower bound. The Riemannian bundle and pseudo-emetric structure are
instantiated with the supplying metric at each application. [Cheeger–Gromov–Taylor, Theorem 4.7](https://doi.org/10.4310/jdg/1214436699)

`bourUniformNormalBalls_of_ballVolume` uses that lower bound together
with the pin's normal-metric radius. It produces genuine smooth
partial diffeomorphisms from $B(0,r)$ onto $B_g(x,r)$ with the origin
mapped to $x$. The quadratic form of the pulled-back metric lies
between $\tfrac12|v|^2$ and $2|v|^2$ at every point of the chart.
The same $r>0$ works before choosing a metric or a center. The
target equality uses the pinned minimizing exponential image theorem
and the realized Riemannian distance.

## Curvature, scalar and parameter

`bourFullCurvatureSq_scale` checks that the ordered square has
weight $a^{-2}$ for the actual rescaling $g\mapsto ag$.
`bourFullCurvatureNorm_scale` gives the norm weight $a^{-1}$.
`bourFullCurvatureNorm_le_of_quarterSq` converts the pointwise
bound $|\operatorname{Rm}|^2/4\le K_q^2$ into
$|\operatorname{Rm}|\le2K_q$. Thus `bourUniformNormalBalls_of_yamabe`
takes the original metric with positive Yamabe floor and
$0\le R\le C$ constant, a scale $a\ge1$, and the pointwise
bound $|\operatorname{Rm}_g|^2/4\le(a K/2)^2$.
It applies the radius estimate on the actual metric $ag$ using
the E47 noncollapse theorem. At scale one the premise is a
pointwise full curvature bound. The compact pointwise norm attains a maximum by
`bourFullCurvatureNorm_attains_max`. At a chosen positive
$Q=\max_x|\operatorname{Rm}_g(x)|\ge1$, take $a=Q$ and $K=1$.
The theorem `bourCurvatureMaximum_scale` then gives a
normalized full norm bounded by one everywhere and equal to one at the
base point. The integrated E47 quarter-square budget gives no pointwise
ceiling. Selection of the two gauges uses the actual pointwise
curvature maximum and a subsequence.

`bourStationary_scalarCoefficient_bound` checks
$0\le(2-p)R/(12a)\le C/6$ for the mixed $p\in[0,1)$ and
$a\ge1$. The stationary principal coefficient remains $1/2$.
The tensor identity, including its Weyl gradient identification,
remains the explicit CSC equation input.
[Bour, Proposition 4.4](https://arxiv.org/html/1012.0342v1#S4)

For the supplied CSC identity
$G_0=(p/12)(R/a)\operatorname{Ric}_0$,
the squared physical residual integral is
$[(p/12)(R/a)]^2D(g)$, since the ordinary Ricci square has weight
$a^{-2}$ and the dimension-four volume has weight $a^2$.
The term lies between zero and $[(p/12)C]^2d$ on any tail with
$D(g)\le d$. Thus it tends to zero as $p\to0$ in both scales by
`bourStationary_residualSq_tendsto_zero`.
Smooth geometric comparison or weak convergence of the actual
fourth-order Euler operator needs a separate argument.

## Remaining harmonic supplier

The checked coordinate diffeomorphisms are normal charts with uniform
ellipticity. The harmonic step still needs a construction of
$\Delta_g u^i=0$ on a smaller common ball with uniformly invertible
coordinate Jacobians and uniform $C^{1,\gamma}$ metric coefficients
in those harmonic charts. Starting with the normal maps, this would
require estimates for the variable-coefficient Dirichlet problem and
quantitative control of the coordinate change. The quantitative derivative estimates are an additional analytic input.
Peters Theorem 4.3 gives the required harmonic chart estimates from
bounded sectional curvature and injectivity. The matching theorem
remains open in the inspected pins. The pin's `exists_harmonic_replacement_with_coordinate_bounds`
uses Euclidean identity coefficients. Its `exists_quadratic_laplacian_coordinates`
controls the equation for harmonic maps from the plane into a target
with prescribed coordinates.
The sibling [harmonic Ricci packet](../../../SmoothPoincare/Variational/BourHarmonicRicci.lean)
checks the DeTurck–Kazdan principal identity on actual chart jets
under the harmonic gauge premises. Construction of those charts and
the interior nondivergence $W^{2,b}$ estimate for $b>4$ are separate inputs.
[Peters, Theorem 4.3](https://www.numdam.org/item/CM_1987__62_1_3_0.pdf#page=10) ·
[DeTurck–Kazdan, Lemma 4.1 and (4.3)](https://www.numdam.org/item/10.24033/asens.1405.pdf#page=7)

## Verification

The targeted Lake build of the geometric module passed. The final
source including the residual theorem elaborated with
`lake env lean SmoothPoincare/Variational/BourHarmonicBalls.lean`.
A scratch application constructs the actual standard round four-sphere
normal charts at a single radius for every center and every scale
at least one. `#print axioms` on all ten public theorems reports
`propext`, `Classical.choice` and `Quot.sound` only.
