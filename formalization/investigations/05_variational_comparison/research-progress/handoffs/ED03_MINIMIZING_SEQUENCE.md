# VAR-B01 / E01s · A minimizing sequence on the original smooth type

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded E work. The actual serving variant and reasoning effort
are unavailable. The checkout was `483ad3cef5a0af4328c5d35cabbc1f5224d26b1e`.
The master manuscript and `GeometricCutDescent.lean` agreed with the
assigned revision `9c579f0`, with SHA-256 prefixes `d2d3a4151a4414f6` and
`366a3620d48bc89b`, respectively. The Lake manifest prefix was
`839111aae86b6935`. [Manuscript, `eq:band`](../../../../../papers/master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex#L233) ·
[Lean module](../../../../SmoothPoincare/Variational/MinimizingSequence.lean)

`SmoothPoincare.existsGeometricMinimizingSequence` starts with a smooth
Riemannian metric on the original compact boundaryless oriented
four-manifold, a pointwise oriented orthonormal frame, a positive class
Yamabe constant and an integrable positive-block squared norm. Its
curvature energy $e_*$ belongs to `geometricPositiveEnergies` and
satisfies $e_*<8\pi^2$. Set $I=\inf A$ for this witnessed real energy
set and $\delta=(8\pi^2-e_*)/2>0$. For each $n$, membership and the
defining property of the infimum give a chosen energy

$$
I\le e_n<I+\min\{\delta,1/(n+1)\}.
$$

Since $I\le e_*$, the sequence has $e_n\le8\pi^2-\delta$ for every
index. The squeeze theorem gives $e_n\to I$. Unpacking each selected
membership and choosing its witnesses gives actual smooth metrics and
dependent frames on the same oriented type, with the corresponding
positive signs and integrable geometric energies. The lower threshold
for nonstandard homotopy spheres in `eq:band` depends on the separate
recognition theorem. [Geometric energy set](../../../../FirstOrderTwistor/GeometricCutDescent.lean)

`SmoothPoincare.existsPhysicalYamabeMinimizingSequence` adds a premise
for each positive subcritical smooth metric and frame with integrable
energy. The premise supplies a smooth logarithmic conformal factor,
the associated conformal metric's frame, volume one in its physical
Riemannian measure, scalar curvature equal pointwise to the original
class Yamabe constant, integrability, and equality of the two measured
chiral energies. The proof chooses one such factor and frame at each
selected index. Reparametrizing the defining range by addition of the
fixed conformal factor identifies the two class Yamabe constants.
Consequently the new metrics have positive class constants, scalar
curvature equal to their own class constants, and exactly the same
energy convergence and uniform gap. The normalization premise carries
smooth Yamabe attainment and the matched chiral energies. Entry on a
given smooth type is supplied by the initial metric. [Yamabe constant model](../../../../FirstOrderTwistor/YamabeTransport.lean)

## Verification

`lake env lean SmoothPoincare/Variational/MinimizingSequence.lean` and
`lake build SmoothPoincare.Variational.MinimizingSequence` passed under
Lean `4.35.0-rc3` with Mathlib `c55e6e786f49` and DifferentialGeometry
`788efe978944`. The targeted build had 4,034 jobs. In a fresh import,
`#check` confirmed the dependent frames on the actual metric sequences,
the normalized volume and pointwise scalar equalities, the common gap,
and convergence to the same real infimum. `#print axioms` reported only
`propext`, `Classical.choice` and `Quot.sound` for both public theorems.
[Lake manifest](../../../../lake-manifest.json)
