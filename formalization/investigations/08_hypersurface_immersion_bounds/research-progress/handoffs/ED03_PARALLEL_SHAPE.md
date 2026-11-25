# IMM-E01d · Curvature of a parallel shape operator

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Actual serving model and reasoning effort were
unavailable. Bounded E proof using manuscript SHA-256 prefix
`d294f6e4600927f5` and the checked inputs `CodazziJets.lean`
(`8d4279c5d32919ca0`) and `InducedBlock.lean` (`668860729fb2887d`).
[Open-saturation argument](../../../../../papers/master/manuscript/immersion_entry.tex#L62) ·
[Prior jet proof](ED03_CODAZZI_JETS.md)

## Local curvature calculation

`connectionFormCurvature_commutes_of_parallelOn` uses one connection
form on both sides of an endomorphism $J$. The connection form is
differentiable at the point and $J$ is $C^2$ on an open neighborhood.
The covariant derivative $B=\nabla J$ is zero on that neighborhood.
The pinned differentiated identity for `bundleMapCovDeriv_curvature`
expresses the difference $R(Ju)-J(Ru)$ by two terms linear in $B$ and
two covariant derivatives of $B$. The first two vanish at the point.
Openness gives the neighborhood equality of each evaluated $B$ with the
zero function, so its Fréchet derivative and its covariant derivative
vanish there. The resulting curvature commutation is a conclusion.

`metricChartConnectionForm` uses the actual metric's Levi–Civita
Christoffel contraction in the centered extended chart. Its evaluation
formula and its differentiability in the interior of the chart target
are public declarations. `chartRiemannCLM_commutes_of_parallelOn`
transports the connection-form result through the pinned centered
chart identification into the actual tangent fiber. The endomorphism
there is the conjugate of the supplied chart representative at the
center.

## Adapted frame and the mixed wedge

`metricCurvatureFrameTensor_commutes_of_parallelOn` evaluates the
actual curvature in an oriented orthonormal frame diagonalizing the
endomorphism at that point. For an eigenvalue array $l$ it derives
$R_{ijuv}l_v=l_uR_{ijuv}$ using the conventions
$R_{ijuv}=g(R(e_i,e_j)e_v,e_u)$. Orthonormality identifies the frame
covectors of the endomorphism from its eigenvector action.

`saturatedPrincipalFrame_noParallelShapeInChart` applies this to one
supplied principal frame of the actual Euclidean hypersurface with
spectrum $(-a,-a,a,a)$ and $a>0$. It invokes the previous mixed-Gauss
contradiction with the now-derived commutation identity.
[Lean module](../../../../SmoothPoincare/Immersions/ParallelShapeCurvature.lean)

The application on a saturated open set needs a $C^2$ chart representative
of the actual shape operator, the diagonal action at the center and
vanishing of its chart covariant derivative throughout the open set.
These are the remaining links from the projected smooth shape data and
pointwise Codazzi jets to the geometric commutation result. The chart
theorems use the pinned connection-form and curvature identities from
`ConnectionForm/Curvature.lean` and `Submanifold/Gauss.lean`, with scoped
access to their private lemmas as supported by the pinned packages.

## Verification

Lean `4.35.0-rc3` at `470d5ce1400764999581fd26d5d72b00d990b0f4`,
Lake manifest SHA-256 prefix `839111aae86b6935`. DifferentialGeometry
`788efe97894474c032de6dfb1289d515f613d15a` and Mathlib
`c55e6e786f49471c72fbddbec5415808896aec1e`.

- `lake build +SmoothPoincare.Immersions.ParallelShapeCurvature`
  passed in the pinned package (9,728 jobs).
- The importing `lake env lean --stdin` checked the public formula and
  commutation declarations. All eight public `#print axioms` reports
  list `propext`, `Classical.choice` and `Quot.sound`.
- Checked module SHA-256
  `9656f4c37eecc802ed365c3703b69d8aa7e695130f37242c7c08fafee02276a2`.
