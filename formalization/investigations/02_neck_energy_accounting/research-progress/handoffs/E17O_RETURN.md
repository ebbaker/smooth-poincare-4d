# FOT-E17o · Moving orthonormal frames at one tangent space

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. Actual serving model and effort are unavailable. This bounded E task uses checkout `0c3399d831d71a1a17c29ffcba14ee0593315cbe`, Lean `4.35.0-rc3`, Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e` and DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`. [Feasibility and API review](../../reviews/CONVERGING_FRAMES_20261125.md) · [Lean module](../../../../FirstOrderTwistor/ConvergingFrames.lean)

`FirstOrderTwistor.orthonormalFrameFromReferenceAt g frame` constructs the actual `OrientedOrthonormalFrameAt g o x` from a prescribed `frame : OrientedOrthonormalFrameAt glim o x` at the same tangent space. It orthonormalizes the given ordered basis under the pairing of `g` and preserves its orientation. Positivity of the Gram–Schmidt pivots and their norm normalization supplies the determinant sign.

`FirstOrderTwistor.tendsto_orthonormalFrameFromReferenceAt` uses the following input and output for `g : α → SmoothRiemannianMetric I M`, a filter `l`, the limiting metric `glim` and the specified reference frame.

```lean
(hGram : ∀ i j, Tendsto (fun k => (g k).inner x (frame.basis i) (frame.basis j)) l
  (𝓝 (glim.inner x (frame.basis i) (frame.basis j)))) (i : Fin 4) :
Tendsto (fun k => (orthonormalFrameFromReferenceAt (g k) frame).basis i) l
  (𝓝 (frame.basis i))
```

The generic lemma `tendsto_metricInner_of_basis` derives convergence of pairings on moving vectors from entrywise Gram convergence and convergence of both vectors. The finite-dimensional coordinate expansion uses continuous coordinate linear maps in the original topology. Well-founded induction then establishes convergence of the Gram–Schmidt pivots, and positive norm normalization gives convergence of the basis. `metricGramSchmidtBasis_eq_of_orthonormal` shows that the construction fixes a basis already orthonormal in the metric. [Lean module](../../../../FirstOrderTwistor/ConvergingFrames.lean)

This gives pointwise moving frames in the fixed comparison tangent space. The comparison still supplies metric coefficient convergence and the curvature-slot convergence required for the density theorem. Measurability of frame fields over a truncation is outside the fixed-point theorem. [Curvature density return](E17L_RETURN.md)

`lake env lean` elaborated the module, and a temporary `.olean` import passed the public type checks. `#print axioms` for `metricGramSchmidtBasis_orientation`, `orthonormalFrameFromReferenceAt` and `tendsto_orthonormalFrameFromReferenceAt` reported exactly `propext`, `Classical.choice` and `Quot.sound`.
