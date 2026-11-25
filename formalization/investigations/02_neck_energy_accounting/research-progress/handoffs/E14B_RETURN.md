# FOT-E14b · Pointwise differentiated flux estimate

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. The request assigns GPT-6.2 Sol/ultra. Actual serving model and effort are unavailable. This bounded E task estimates the pointwise contraction in SEC's interpolation proof in an orthonormal coordinate system on Euclidean four-space. [Issued request](LAUNCH_REQUESTS_20261125.md) · [Lean module](../../../../FirstOrderTwistor/FluxDerivative.lean) · [SEC `msneck:interpolation`](../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L5539)

The working revision was `7db310a` during implementation and had advanced to `0c3399d831d71a1a17c29ffcba14ee0593315cbe` by return preparation. The frozen SEC hash is `329513a3cfd8e939373533fad90f36b9108ce0ea41a22f9cc348587a4110fe66`. The toolchain and dependencies are the request's Lean `4.35.0-rc3`, Mathlib `c55e6e786f49` and DifferentialGeometry `788efe978944`. This packet imports the checked E14a module and uses its actual cutoff flux and directional derivatives. [E14a return](E14A_RETURN.md) · [Pinned baseline](../../../research-progress/01_BASELINE.md)

## Callable results

- `FirstOrderTwistor.bufferedFlux_partial` gives the exact product rule for the derivative in direction $a$ of each flux component $F_{ja}=\eta^4 |Du|^2\partial_a u_j$. The Hessian `euclideanHessian` uses two applications of `euclideanPartial`, with the inner coordinate in the first pair and the outer coordinate in the final slot. This formula assumes differentiability of the cutoff at the given point and $C^2$ regularity of every real component there.
- `FirstOrderTwistor.hessianTraceNorm_le` proves $\lvert\sum_a H_{j,a,a}\rvert_{\ell^2_j}\le 2|H|_{\rm HS}$ for an arbitrary real array indexed by `(ι × Fin 4) × Fin 4` with `[Fintype ι]`. The proof uses the squared Cauchy–Schwarz inequality in the four diagonal coordinates.
- `FirstOrderTwistor.abs_bufferedFlux_contraction_le` assumes the local differentiability and $C^2$ hypotheses above and $0\le\eta(x)$. It proves the pointwise estimate below using the Euclidean coefficient norm `coordinateNorm` on each listed array.

$$
\left|\sum_{j,a}u_j\partial_a F_{ja}\right|
 \le |u|\left(4\eta^3|D\eta|\,|Du|^3 +4\eta^4|Du|^2|D^2u|\right).
$$

The proof uses finite Cauchy–Schwarz contractions for $A_a=\sum_j u_j\partial_a u_j$ and $B_a=\sum_{j,b}\partial_bu_j\partial_a\partial_bu_j$. The derivative of $|Du|^2$ contributes $2|u|\eta^4|Du|^2|D^2u|$. The Hessian trace contributes another term with the same coefficient. The proof also applies when the coordinate gradient vanishes.

## Checks and scope

`lake env lean` elaborated the module. All public types were checked through a temporary compiled import. Each of the three theorem axiom checks reported exactly `propext`, `Classical.choice`, and `Quot.sound`. Temporary probes checked that a zero gradient gives zero contraction and that the dimension-four identity matrix attains equality in the trace bound.

The result is pointwise in Euclidean coordinates. Compact support, the integrated identity and the $L^p$ estimates enter when composing this result with E14a and E14c. The scale-invariant bound on the cutoff profiles and the Weyl first variation in the chart remain separate obligations. [SEC `msneck:ceta` and `msneck:annulus-bound`](../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L5534)
