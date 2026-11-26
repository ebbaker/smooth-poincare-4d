# Edition 03 · Actual curvature costs in the native conformal core

26 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded follow-on to DESC-E08a on Git base `95a4f50eb9ec6e0e98454170279f45a66b000211`. Independent serving model and effort telemetry are unavailable. [Lean leaf](../../../../SmoothPoincare/Variational/ConformalCoreCosts.lean) · [Native conformal core](ED03_CONFORMAL_CORE_REFERENCE.md) · [Chiral charges](ED03_CONFORMAL_CHIRAL_CHARGES.md)

Let \(g\) be a smooth Riemannian metric on a four-manifold, let \(u\) be smooth, and write \(g_t=e^{2tu}g\). All volume and scalar-curvature factors below refer to actual metrics on the source. Set \(R=R_g\), \(L=\Delta_g u\) with the divergence-of-gradient convention, and \(Q=|\nabla_g u|_g^2\). The exact tested identity holds for every Borel measurable \(A\), with sigma-compactness in the volume construction:

\[
  S_A(t):=\int_A R_{g_t}^2\,dV_{g_t}
  =\int_A (R-6tL-6t^2Q)^2\,dV_g.
\]

The two scalar factors contribute \(e^{-4tu}\), exactly canceled by the conformal volume derivative \(e^{4tu}\). Both sides are real Bochner integrals on the same set. On a compact source all the scalar tests used in the next step are integrable. Averaging the squared numerators at \(t,-t\) yields \((R-6t^2Q)^2+(6tL)^2\). Subtracting \(18t^4Q^2-R^2\) leaves \(2(R-3t^2Q)^2+(6tL)^2\). Thus for every real \(t\)

\[
  \frac{S_A(t)+S_A(-t)}{2}
   \;\ge\;18t^4\int_A Q^2\,dV_g-\int_A R^2\,dV_g.
\]

In the full ordered tensor normalization, the pointwise four-dimensional decomposition gives \(|\operatorname{Rm}_{g_t}|_{g_t}^2\ge R_{g_t}^2/6\). Consequently for \(H_A(t)=\int_A |\operatorname{Rm}_{g_t}|_{g_t}^2\,dV_{g_t}\) the analogous bound is

\[
  \frac{H_A(t)+H_A(-t)}{2}
  \;\ge\;3t^4\int_A Q^2\,dV_g-\frac{1}{6}\int_A R^2\,dV_g.
\]

The curvature norm uses the intrinsic covariant tensor in the changed metric, with the full sum over ordered frame indices. The measure comparison identifies the test with the existing raw physical measure on \(A\) for any supplied pointwise oriented orthonormal frames. Each test is finite by smoothness on the compact source.

On a connected compact source with the selected native chart \(F\), take the existing buffered width \(w=(n+1)^{-1}\) with \(n>0\), and \(A=F(B_{1-w})\). The selected bump has \(u(F(0))=1\), support compactly inside \(A\), and \(du\ne 0\) at an interior point. Positive definiteness gives \(Q>0\) there. Its square is continuous and is positive on a nonempty open subset of \(A\), so the positive-open-set property of \(dV_g\) gives \(\int_A Q^2\,dV_g>0\). The two-direction bound gives an amplitude exceeding any fixed raw full-energy ceiling in at least one direction along this fixed supported family. Monotonicity of the nonnegative measure gives the same conclusion for the containing selected closed disk. If the incoming class Yamabe constant is positive, all these amplitudes stay in that same positive class. The support condition fixes the original trim and exterior metric germs. The independent signed conformal charge results apply to the same amplitudes. This establishes a full-curvature cost obstruction to an amplitude-independent bound for this conformal family. Strict matched saving and control of the selected minimizing competitors require their own inputs.

## Verification

Pinned Lean `4.35.0-rc3`, Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e` and DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`. The Lake manifest SHA-256 is `839111aae86b693524cd57db5ce7f2e8edc972dad49296468eb18d6735e52239`. The `ConformalCoreReference.lean` and `IntrinsicEulerDensity.lean` SHA-256 values are `7314515321ee202eadc56c04ce39c27798895ce85edc9a43f5a8eb9bf5370b2b` and `4dce68219b405de638dff42195937e9c6e9f9efafa0fee1bcdac82dbfd5149aa`.

`lake build +SmoothPoincare.Variational.ConformalCoreCosts` completed cleanly with 9922 jobs and 8.1 s on the leaf. The standalone `lake env lean -j1` import replay checked all 13 public signatures and reported only `propext`, `Classical.choice` and `Quot.sound` for each. The final leaf SHA-256 is `813538ea7eefa346e1ea42cb12690d5ab4100bda8db0ec977c3ddd8333b33b25`.

- `conformalCore_scalarCost_eq` transfers the actual scalar test to the source volume. `conformalCore_scalarCost_two_direction` gives its finite quartic estimate.
- `scalarSq_div_six_le_intrinsicCurvatureSq`, `conformalCore_scalarCost_div_six_le_fullCost` and `conformalCore_fullCost_two_direction` take this estimate into the full ordered tensor norm. `conformalCore_fullCost_eq_metricMeasure_real` identifies the actual raw measure on the same test set.
- `conformalCore_integral_gradientSq_sq_pos` uses a nonzero differential in the fixed open test set. `conformalCore_exists_fullCost_gt` converts the positive coefficient into arbitrary finite thresholds. `exists_selectedConformalCoreCosts_unbounded` applies both to the selected native inner disk.
