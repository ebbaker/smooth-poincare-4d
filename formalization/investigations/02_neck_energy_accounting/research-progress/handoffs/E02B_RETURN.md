# FOT-E02b · Chiral frame reconstruction and compression

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. Actual serving model and reasoning effort were unavailable.

`FirstOrderTwistor.selfDualCurvatureBlock_chiralFrameTensor` proves `selfDualCurvatureBlock (chiralFrameTensor WPlus WMinus) = WPlus` for arbitrary real $3\times3$ matrices. The two APIs use the same row and column order, the oriented wedge triples $(01,02,03)$ and $(23,31,12)$, and the normalized self-dual sums. Each compressed entry is half the sum of two copies of $(W_++W_-)/2$ and two of $(W_+-W_-)/2$ in that entry. This yields exactly the supplied positive block, with unit coefficient and the displayed index order. [Lean proof](../../../../FirstOrderTwistor/FrameCompression.lean) · [Frame reconstruction](../../../../FirstOrderTwistor/FrameEnergy.lean) · [Curvature compression](../../../../FirstOrderTwistor/GeometricChiralBlock.lean)

`FirstOrderTwistor.traceFreeChiralBlock_chiralFrameTensor` gives the same equality after trace removal under `WPlus.trace = 0`. The results identify the two algebraic conventions for the reconstructed four-slot array. Their geometric application requires the oriented orthonormal frame and Weyl coefficients of the actual metric in the sibling operator convention $g(R(e_a,e_b)e_d,e_c)$. [SEC four-slot and chiral norms](../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L146)

## Verification

`lake env lean FirstOrderTwistor/FrameCompression.lean` passed. An appended `lake env lean --stdin` probe printed the exact theorem types and `[propext, Classical.choice, Quot.sound]` as the axioms of both. The regression used $(W_+)_{01}=3$, $(W_+)_{10}=5$, $(W_-)_{01}=7$, and $(W_-)_{10}=11$, with the other entries zero. It recovered entries $3$ and $5$, verified that the reconstructed mixed slots $(01,31)$ and $(01,13)$ give $-2$ and $2$, and checked the recovered $(0,1)$ coefficient after trace removal.

Working checkout `0c3399d831d71a1a17c29ffcba14ee0593315cbe`. The manifest and toolchain matched packet base `cf03e8f09359cac317499f6928edb09e4f80c280`. SEC SHA-256 `329513a3cfd8e939373533fad90f36b9108ce0ea41a22f9cc348587a4110fe66`. Lean `4.35.0-rc3`, Mathlib `c55e6e786f49`, DifferentialGeometry `788efe978944`.
