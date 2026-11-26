# Edition 03 · The intrinsic scalar Euler density

26 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex assistance. DESC-E08f is a bounded proof packet on Git base 95a4f50eb9ec6e0e98454170279f45a66b000211. Independent serving model and effort telemetry are unavailable. [Lean leaf](../../../../SmoothPoincare/Variational/IntrinsicEulerDensity.lean) · [E41 spatial flux](ED03_SPATIAL_EULER_FLUX.md) · [Actual curvature variation](ED03_SPATIAL_EULER_VARIATION.md) · [Scientific charged-flow receipt](../../../../../papers/master/research-progress/handoffs/E69_E72_CHARGED_FLOW_20261125.md)

## Pointwise normalization without a frame change

For a smooth Riemannian metric in the E41 convention, define the scalar
\[
 \mathcal E(g,x)=\tfrac14|\operatorname{Rm}_g|_{\mathrm{tens}}^2(x)
                   -|\operatorname{Ric}_g|_{\mathrm{tens}}^2(x)
                   +\tfrac14 R_g(x)^2 .
\]
The two squared norms use the full ordered covariant slots, with `normSq0S` at ranks four and two. `intrinsicEulerDensity_eq_frameEulerPfaffian` proves
\[
 \mathcal E(g,x)= 2\,\operatorname{Pf}_{\mathrm{E41}}\bigl(\operatorname{Rm}_{g,e}(x)\bigr)
\]
for every supplied oriented orthonormal frame \(e\) at the point of the oriented four-source. The inverse Gram in that frame is the identity by orthonormality. The curvature norm in the intrinsic formula becomes the actual ordered sum of squares. The project frame tensor has its last two slots swapped relative to `metricRm04StandardAt`; skew symmetry shows the same squared components. The Ricci trace convention transposes the two frame indices; the full sum of squares is invariant under that index permutation. The scalar contraction is the existing frame scalar identity. Applying the checked E41 Pfaffian polynomial gives the equality directly for each frame. The construction of the intrinsic scalar uses no fitted frame change, spatial frame extension, or frame smoothness.

The second pointwise theorem identifies the same scalar with the four tested E41 charge densities,
\[
 \mathcal E(g,x)=|W_g^+|^2_{\mathrm{HS}}+|W_g^-|^2_{\mathrm{HS}}
                 +\frac{R_g^2}{24}-\frac{|Z_g|^2_{\mathrm{tens}}}{2}.
\]
The factor is the density convention previously used for the Ricci concentration test. For unit sectional curvature the full ordered Riemann norm squared, Ricci norm squared and scalar curvature are \(24,36,12\), giving \(\mathcal E=6\) and Pfaffian coefficient \(3\).

## Regular spacetime and carrier endpoints

The actual `IsSolutionOn` data give continuous tensor families for the metric, full lowered Riemann curvature and Ricci tensor on the whole supplied carrier, and scalar continuity there. Applying the pinned tensor norm family theorem to each tensor gives joint continuity of the Euler scalar on the product of the carrier subtype and the source. The corresponding ambient `ContinuousOn` statement uses the same carrier, including any initial or boundary times actually supplied by the solution.

At regular times use the actual smooth metric family in an arbitrary ordinary coordinate chart. Its inverse Gram coefficients are smooth. Each squared tensor norm is the finite contraction of two copies of the covariant coefficients with one inverse Gram factor in every ordered slot. The lower Riemann components use the chart curvature coefficients and one Gram contraction. The Ricci components and scalar use the existing chart curvature and scalar regularity. This gives joint smoothness of the Euler scalar throughout the regular open time set times the source, and hence on a compact regular-time slab by restriction. The proof uses ordinary chart bases within the local coordinate contraction. It does not choose a smooth orthonormal frame on spacetime or require independent frame-transition certificates.

The construction supplies the scalar tested by the global Euler integral. The integral derivative and spatial current are separate results.

## Verification

Pinned Lean 4.35.0-rc3, Mathlib c55e6e786f49471c72fbddbec5415808896aec1e and DifferentialGeometry 788efe97894474c032de6dfb1289d515f613d15a. The Lake manifest SHA-256 is 839111aae86b693524cd57db5ce7f2e8edc972dad49296468eb18d6735e52239.

The E41 working Lean input SHA-256 prefixes were `fbc6342cb7b2b71` for `SpatialEulerFlux.lean`, `9cc7bd6b8a43d7d` for `SpatialEulerVariation.lean`, and `a3299bc26a9de8f` for `ModifiedFrameDecomposition.lean`. The regular-time proof uses the pinned chart curvature, inverse Gram, and scalar APIs and the same coordinate contraction underneath the upstream `normSq0S_jointContMDiffOn` theorem.

`lake build +SmoothPoincare.Variational.IntrinsicEulerDensity` passed cleanly with 9824 jobs and 8.9 s on the leaf. A separate `lake env lean -j1` import replay ran `#check @` and `#print axioms` for all seven public declarations. Each reports only `propext`, `Classical.choice` and `Quot.sound`. The final leaf SHA-256 is `4dce68219b405de638dff42195937e9c6e9f9efafa0fee1bcdac82dbfd5149aa`.

- `intrinsicEulerDensity` and `normSq0S_rm04_eq_frameTensorNormSq` give the intrinsic definition and the full ordered Riemann tensor norm in every supplied oriented orthonormal frame.
- `intrinsicEulerDensity_eq_frameEulerPfaffian` and `intrinsicEulerDensity_eq_modifiedChargeDensity` check the two pointwise comparisons.
- `intrinsicEulerDensity_continuous_carrier` and `intrinsicEulerDensity_continuousOn_carrier` give endpoint-inclusive continuity for the supplied solution. `intrinsicEulerDensity_contMDiffOn_regular` gives joint regular-time smoothness.
