# Parent FOT-E02a · Chiral frame normalization and the local Weyl bound

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. GPT-6.2 Sol/ultra was requested. Serving variant and effort are unavailable. This is the fixed coordinate execution packet adopted by [parent B01](../../../research-progress/REGISTER.md) and issued in the [follow-on requests](LAUNCH_REQUESTS_20261125.md#follow-on-fixed-packets--revision-1-same-date-and-pins).

[FrameEnergy.lean](../../../../FirstOrderTwistor/FrameEnergy.lean) checked under Lean `4.35.0-rc3`, Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e` and DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`. The working HEAD inspected at return was `7db310a2a9219c537b440d7c2fb39e602a32b729`, with manifest and toolchain identical to the request baseline `cf03e8f09359cac317499f6928edb09e4f80c280`. SEC SHA-256 is `329513a3cfd8e939373533fad90f36b9108ce0ea41a22f9cc348587a4110fe66`. DIR SHA-256 is `71dfada5256b2e33425c12d835bed57e66dc85cb87db6f89e4edabf18c0b198d`.

## Callable declarations

The declarations are in `FirstOrderTwistor`. For an oriented orthonormal frame in real Riemannian dimension four, use `u = (01, 02, 03)` and `v = (23, 31, 12)`. The matrices `WPlus` and `WMinus` are taken in the normalized `(u + v)/√2` and `(u − v)/√2` bases, respectively. The block entries in the `u, v` basis are `A = (WPlus + WMinus)/2` on both diagonal blocks and `B = (WPlus − WMinus)/2` on both off-diagonal blocks. `skewPairArray` gives an ordered-pair extension using the stated ordering of `v`, with `31` carrying the opposite sign from `13`. Applying it in both slots gives the actual four-index array `chiralFrameTensor WPlus WMinus` indexed by `Fin 4` in each slot. Symmetry and trace-freeness of the matrices are unnecessary for the coordinate identity.

| Call | Conclusion |
| --- | --- |
| `skewPairArray u v` | A `4 × 4` skew matrix extending the coefficients on the six ordered wedge representatives |
| `chiralFrameTensor WPlus WMinus` | The corresponding `Fin 4 → Fin 4 → Fin 4 → Fin 4 → ℝ` array with both skew pairs ordered |
| `frameTensorNormSq W` | `∑ a, ∑ b, ∑ c, ∑ d, W a b c d ^ 2` |
| `frameTensorNormSq_eq_four_chiral WPlus WMinus` | The reconstructed four-slot squared norm equals `4 * (hilbertSchmidtSq WPlus + hilbertSchmidtSq WMinus)` |
| `frameTensorIntegral_eq_four_chiral hPlus hMinus` | The local four-slot integral equals four times the sum of the local chiral integrals |
| `positiveChiralIntegral_le_quarterFrame hPlus hMinus` | The positive chiral integral is at most the local four-slot integral divided by `4` |

The integrals use a common measure `μ` and region `s`. The premises `hPlus` and `hMinus` are `IntegrableOn (fun x => hilbertSchmidtSq (plus x)) s μ` and `IntegrableOn (fun x => hilbertSchmidtSq (minus x)) s μ`. The theorem applies to every measurable region, with no closed-manifold signature premise. Each skew-pair sum contributes the factor two, and `2(A² + B²) = WPlus² + WMinus²` entry by entry. Nonnegativity of the negative chiral integral yields the quarter bound. The normalization is the one recorded in [SEC §1.1, `eq:energies`](../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L144) and [DIR §2.1](../../../../../papers/investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/manuscript/dirac_twistor_and_yamabe_rigidity.tex#L155).

## Verification and geometric input

`lake env lean FirstOrderTwistor/FrameEnergy.lean` succeeded. A temporary import probe checked all six public types and reported `[propext, Classical.choice, Quot.sound]` for all six. The probe checked the `01,01`, `01,23`, `02,31` and `02,13` entries for the pure positive block `diag(1, -1, 0)` and zero negative block. Its positive squared Hilbert–Schmidt norm is `2` and its full four-slot squared norm is `8`, attaining the quarter factor with positive energy.

The geometric supplier must identify `plus` and `minus` with the actual curvature-operator blocks in the stated oriented orthonormal frames and the reconstructed array with the actual Weyl tensor. In particular, applying the integral bound to an E14 or E15 estimate requires that its full integrand have this tensor norm in the same Riemannian volume measure. Frame-independent representation, curvature and volume transport, and the existence of such frames and comparisons on actual neck regions remain separate geometric obligations.
