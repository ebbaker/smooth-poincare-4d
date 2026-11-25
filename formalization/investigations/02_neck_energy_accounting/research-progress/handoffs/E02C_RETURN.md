# FOT-E02c · A four-slot bound for the compressed positive block

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. Actual serving model and reasoning effort were unavailable.

`FirstOrderTwistor.hilbertSchmidtSq_traceFreeSelfDualBlock_le_frameTensorNormSq` proves

$$
\bigl\|\operatorname{tf}(R_{++})\bigr\|_{\mathrm{HS}}^2
\le \sum_{a,b,c,d=0}^3 R_{abcd}^2
$$

for every real four-slot array $R$, with constant $1$. Each compressed entry is a sum of four array coordinates with weight $1/2$. Cauchy–Schwarz bounds its square by the sum of their squares. Distinct matrix entries use disjoint four-slot positions because the six oriented wedges used in the compression are all distinct. Finally, taking the trace-free part of any real $3\times 3$ matrix $A$ subtracts $(\operatorname{tr} A)^2/3$ from its squared Hilbert–Schmidt norm. [Lean proof](../../../../FirstOrderTwistor/CurvatureCompressionBound.lean)

This gives a pointwise square bound for the trace-free self-dual compression of the actual full Riemann curvature array in the supplied oriented orthonormal frame. Identifying that array's ordered coordinate sum with the physical full curvature norm and building an integrable majorant in a comparison family are geometric and analytic inputs to later use. The bound applies to arbitrary arrays. E02a's sharper quarter factor applies to the tensor reconstructed from the two chiral Weyl blocks. [Geometric curvature API](../../../../FirstOrderTwistor/GeometricChiralBlock.lean) · [E02a chiral reconstruction](../../../../FirstOrderTwistor/FrameEnergy.lean)

## Verification

`lake env lean FirstOrderTwistor/CurvatureCompressionBound.lean` passed. An appended `lake env lean --stdin` probe confirmed the exact public type and axioms `[propext, Classical.choice, Quot.sound]`. It also checked equality with both sides equal to $4$ for the array taking value $1$ on the four pairs in $\{01,23\}\times\{02,31\}$ and zero elsewhere. This witnesses the optimal constant for arbitrary arrays.

Working checkout `0c3399d831d71a1a17c29ffcba14ee0593315cbe`. The manifest and toolchain matched packet base `cf03e8f09359cac317499f6928edb09e4f80c280`. SEC SHA-256 `329513a3cfd8e939373533fad90f36b9108ce0ea41a22f9cc348587a4110fe66`. Lean `4.35.0-rc3`, Mathlib `c55e6e786f49`, DifferentialGeometry `788efe978944`.
