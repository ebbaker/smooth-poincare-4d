# FOT-E17l · Curvature-entry convergence and geometric chiral energy

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. GPT-6.2 Sol/ultra was requested. Serving variant and effort are unavailable. This is bounded E work under the [follow-on request](LAUNCH_REQUESTS_20261125.md#follow-on-fixed-packets--revision-1-same-date-and-pins).

[CurvatureDensityLimit.lean](../../../../FirstOrderTwistor/CurvatureDensityLimit.lean) uses Lean `4.35.0-rc3`, Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e` and DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`. It was built at working HEAD `0c3399d831d71a1a17c29ffcba14ee0593315cbe` with the toolchain and manifest of the requested baseline `cf03e8f09359cac317499f6928edb09e4f80c280`. SEC SHA-256 is `329513a3cfd8e939373533fad90f36b9108ce0ea41a22f9cc348587a4110fe66`. The imported [GeometricChiralBlock.lean](../../../../FirstOrderTwistor/GeometricChiralBlock.lean) and [ChiralDensity.lean](../../../../FirstOrderTwistor/ChiralDensity.lean) sources had SHA-256 `7743079e81d003ad56ee0f4f305c38f3f87bfcd3e22f2912d85d5426a164dd69` and `0603faa6fbc4ce1aeb5bfd7de36bfd78c1abeee451dd60d4c2af7c72fa7f13c1`, respectively.

## Callable declarations

The declarations are in `FirstOrderTwistor`.

| Call | Conclusion |
| --- | --- |
| `traceFreeSelfDualBlock R` | `traceFreeChiralBlock (selfDualCurvatureBlock R)` on the four-slot `Fin 4` array |
| `tendsto_traceFreeSelfDualBlock_apply hR a b` | Convergence of each four-slot entry along the supplied filter gives convergence of block entry `a,b` |
| `curvatureFrameDensity_integrableOn_and_tendsto hR hJac hMeas hBound hDom` | Almost-everywhere four-slot convergence, convergent Jacobians and dominated measurable densities imply integrability of each density and its limit, and convergence of their set integrals |
| `tendsto_geometricChiralBlock o g glim point pointlim frame framelim hR` | Product-topology convergence of the actual `geometricChiralBlock` from entry convergence of `metricCurvatureFrameTensor` along the supplied filter |
| `geometricChiralDensity_integrableOn_and_tendsto o g glim point pointlim frame framelim hR hJac hMeas hBound hDom` | The integral conclusion for smooth Riemannian metrics and the actual chiral blocks evaluated using the supplied point maps and tangent frames |

The geometric declarations work on a smooth oriented Riemannian four-manifold. Their dependent frame arguments are `OrientedOrthonormalFrameAt` for the stated metric, orientation and point. The integral declaration evaluates all fields over one reference domain `X` with measure `volume` and region `s`. Its varying maps `point i : X → M` and limiting map `pointlim : X → M` permit different evaluation points for the metric sequence and limit. For each fixed choice of four slots, `hR` is almost-everywhere convergence relative to `volume.restrict s`. The finite slot family is combined into one almost-everywhere statement. Each self-dual compression entry is a sum of four entries divided by two, and the trace subtraction uses the finite diagonal sum.

The remaining inputs match E17e. `hJac` is almost-everywhere convergence of the real Jacobian factors. `hMeas` is almost-everywhere strong measurability of each Jacobian-weighted chiral density. `hBound` is integrability of the common real majorant on `s`, and `hDom` bounds the norm of every density by that majorant almost everywhere on `s`.

## Verification

`lake build FirstOrderTwistor.CurvatureDensityLimit` succeeded with 3,835 jobs. A separate `lake env lean --stdin` probe using the built import checked all five public types. Each `#print axioms` reported `[propext, Classical.choice, Quot.sound]`. The probe also checked convergence for the constant-sectional-curvature form with a varying scalar, vanishing of its trace-free block, and the actual-metric theorem for a constant sequence with a fixed point and oriented orthonormal frame.

## Geometric scope

The comparison supplier for [SEC §12.4, `msgap:accounting`](../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L4640) must still prove that its metric convergence implies the stated convergence of the four-slot curvature coefficients in the supplied oriented frames. It must also identify the reference volume and Jacobians with the Riemannian volume pullbacks and supply the stated measurability and domination. This packet starts at frame curvature convergence. It applies the actual curvature-defined block internally and proves the analytic passage to its integral on the fixed region.
