# VAR-E04d · Moving oriented chiral coefficients

25 November 2026, America/New_York. Revision 1, prepared for Edward B.
Baker III with OpenAI Codex assistance. The bounded helper routing
selected GPT-6.2 Sol/ultra. The helper inherited its serving configuration.
Independent serving model and effort telemetry were unavailable.

[Packet](../../../research-progress/handoffs/ED03_GLOBAL_GEOMETRY_PACKETS_20261125.md) ·
[Route register](../REGISTER.md) ·
[Lean module](../../../../SmoothPoincare/Variational/MovingChiralFrame.lean)

## Scope and sources

The issue checkout was `2fba0882dbf8766c95094ef4d1207190b0c24bc2` with
working edits. The pinned toolchain is Lean `4.35.0-rc3`,
`470d5ce1400764999581fd26d5d72b00d990b0f4`, with manifest
`839111aae86b6935`, Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e`,
and DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`.

| Input | SHA-256 prefix |
| --- | --- |
| [First-order splice manuscript, `weak:splice`](../../../../../papers/master/manuscript/first_order_splice.tex) | `e31283f6c8429f7f` |
| [SpliceDensity.lean](../../../../SmoothPoincare/Variational/SpliceDensity.lean) | `45260991e7582a12` |
| [SpliceRemainderL2.lean](../../../../SmoothPoincare/Variational/SpliceRemainderL2.lean) | `d534a0886701062c` |
| DifferentialGeometry `Analysis/Calculus/ContDiff/OrthonormalBasis.lean` | `d53f6144c450dbbf` |

## Checked statements

- `exists_orientedMovingFrame` starts with a basis `e` of a fixed real
  four-dimensional normed chart model. It applies the pinned varying-metric
  Gram–Schmidt theorem to the cone of positive symmetric forms. The
  determinant of each resulting basis in `e` is nonzero and continuous,
  so the sign correction is locally constant. The result has orientation
  `e.orientation`, is orthonormal for its input form, and is smooth in
  that form in every basis vector.
- `norm_chartGramUnit_le` gives the fixed chart norm bound
  $\lVert v\rVert\le 1/\sqrt{\ell}$ for each vector with $B(v,v)=1$
  when $B(v,v)\ge\ell\lVert v\rVert^2$ and $\ell>0$.
- `movingCurvatureSlots_tensor` transports all 256 ordered coefficients
  of any four-linear form from `e` to the moving vectors. Both input and
  output use the switched final pair of
  `FirstOrderTwistor.metricCurvatureFrameTensor`. The proof expands every
  vector in the fixed basis and applies multilinearity. The resulting
  continuous linear operator is continuous in the moving basis in
  operator norm.
- `tendstoUniformlyOn_movingChiralProjector` combines this slot transport,
  the existing trace-free self-dual compression, and the coordinate
  half-density $(\det B_e)^{1/4}$. A closed bilinear operator-norm ball
  intersected with symmetry and a positive lower ellipticity bound is
  compact in finite dimensions. On this window the composed operator is
  uniformly continuous. Uniform convergence of coefficient forms
  therefore gives uniform operator-norm convergence on the same domain.
  The continuity premise on the frame is supplied by
  `exists_orientedMovingFrame`.

The result supplies convergence for the positive chiral array and the
coordinate Lebesgue half-density. The manuscript's linear rate in the
coefficient difference, the opposite chiral compression, and the
identification with the reference-metric measure in
`tendstoUniformly_geometricSpliceEnergy` remain separate statements.
To use the theorem on the selected physical shells, the construction
must still supply the same marked oriented chart and domain, a common
ellipticity window, and uniform convergence of the actual pulled-back
coefficient forms there. The curvature residual and the globally
admissible transplant remain separate inputs.

## Verification

The [module](../../../../SmoothPoincare/Variational/MovingChiralFrame.lean)
has SHA-256 `18c91f73b81967991292b06ff13d8bd64e1bcb6b9b7055f36f99ec817da57af7`.
`lake build +SmoothPoincare.Variational.MovingChiralFrame` succeeded from
`formalization/`. An imported-module check elaborated the frame
existence, unit-vector bound, curvature identification and convergence
statements. The axiom screen for these declarations, the compactness
theorem, the coordinate formula, and the density continuity theorem
reported only `propext`, `Classical.choice`, and `Quot.sound`.
