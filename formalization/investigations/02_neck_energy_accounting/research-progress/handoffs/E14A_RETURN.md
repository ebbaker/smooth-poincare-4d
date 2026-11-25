# FOT-E14a · Buffered interpolation identity and scalar bounds

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. The request assigns GPT-6.2 Sol/ultra. Actual serving model and effort are unavailable. This bounded E task checks the opening Euclidean integration by parts and the final scalar implications of SEC `msneck:interpolation`. [Issued request](LAUNCH_REQUESTS_20261125.md) · [Lean module](../../../../FirstOrderTwistor/BufferedInterpolation.lean) · [SEC `msneck:interpolation`](../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L5539)

Work started during the activation at `ad23403e9be521ebbc8395a9d958c0a02aef3c84`, the child of frozen `cf03e8f09359cac317499f6928edb09e4f80c280`. The checkout advanced to `7db310a` during the turn. SEC SHA-256 `329513a3cfd8e939373533fad90f36b9108ce0ea41a22f9cc348587a4110fe66` agrees with the request. Lean was `4.35.0-rc3`, Mathlib was `c55e6e786f49471c72fbddbec5415808896aec1e`, and DifferentialGeometry was `788efe97894474c032de6dfb1289d515f613d15a`. The Lake manifest stayed unchanged. [Pinned baseline](../../../research-progress/01_BASELINE.md)

## Callable results

`FirstOrderTwistor.bufferedInterpolation_integrationByParts` takes a scalar cutoff `η : EuclideanFour → ℝ`, finitely indexed real components `u : ι → EuclideanFour → ℝ` with `[Fintype ι]`, and the hypotheses below. `EuclideanFour` abbreviates `EuclideanSpace ℝ (Fin 4)`.

```lean
(hη : ContDiff ℝ 1 η)
(hcompact : HasCompactSupport η)
(hu : ∀ j x, x ∈ tsupport η → ContDiffAt ℝ 2 (u j) x)
```

The component derivatives in `euclideanPartial` evaluate `fderiv ℝ` on the actual Euclidean unit vectors. `euclideanGradientSq` sums their squares over component and direction. For `p = (j, a)`, `bufferedFlux η u p` is `η⁴ |Du|² ∂ₐuⱼ`. The conclusion is the identity

$$
\int_{\mathbb R^4}\eta^4 |Du|^4\,dx
  =-\int_{\mathbb R^4}\sum_{j,a}u_j\,\partial_a(\eta^4 |Du|^2\partial_a u_j)\,dx.
$$

The proof applies Mathlib's `integral_mul_fderiv_eq_neg_fderiv_mul_of_integrable` to every scalar component and coordinate direction for Euclidean `volume`. It proves all three integrability hypotheses from continuity near the cutoff support and compact support of the products. The flux derivative has support contained in the flux support, which is contained in the cutoff support. The local regularity on `u` therefore suffices even if its total representative has arbitrary values away from the buffered region.

`FirstOrderTwistor.bufferedInterpolation_of_quartic` takes real `U`, `c`, `X`, `Y` with all four nonnegative. Its input and two outputs are

```lean
(hquartic : Y ^ 4 ≤ U * (4 * c * Y ^ 3 + 4 * Y ^ 2 * X)) :
Y ≤ 4 * c * U + 2 * Real.sqrt (U * X) ∧
  Y ^ 2 ≤ 32 * c ^ 2 * U ^ 2 + 8 * U * X
```

The proof treats `Y = 0` directly and otherwise divides by `Y²`. The intended substitutions are `U = ‖u‖∞`, `c = cη`, `X = ‖η²D²u‖₂` and `Y = ‖ηDu‖₄`.

## Outstanding connection

The differentiated flux formula and its pointwise bound, including `|Δu| ≤ 2|D²u|` in dimension four, remain explicit obligations to B03. The conversion to the integrated quartic inequality also needs the identification of these coordinate integrals with the named (L^p) norms and Hölder's inequality. A follow-on proof must use a nonnegative cutoff from the chart construction or use absolute values on its odd powers in the pointwise bound. The uniform cutoff estimate `msneck:ceta` and E14 Weyl variation estimate `msneck:annulus-bound` remain distinct premises for the annular estimate. [SEC cutoff and interpolation](../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L5520) · [E16a scalar use of the supplied estimate](E16A_RETURN.md)

## Checks

`lake env lean` elaborated the module, and a temporary compiled import checked the public types. `#print axioms` reported exactly `propext`, `Classical.choice`, and `Quot.sound` on both the integration and scalar theorems. Temporary probes instantiated the identity with a zero cutoff and arbitrary coordinate functions, and the scalar result with `Y = 0`.
