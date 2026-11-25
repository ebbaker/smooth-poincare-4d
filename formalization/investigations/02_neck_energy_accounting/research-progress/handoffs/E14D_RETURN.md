# FOT-E14d · Buffered Euclidean interpolation

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex assistance. The request assigns GPT-6.2 Sol/ultra. Actual serving model and effort are unavailable. This bounded E task composes the three checked steps of SEC `msneck:interpolation` on the same Euclidean coordinate fields. [Issued request](LAUNCH_REQUESTS_20261125.md) · [Lean module](../../../../FirstOrderTwistor/AnnularInterpolation.lean) · [SEC `msneck:interpolation`](../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L5539)

The working revision at the start of the packet was `0c3399d831d71a1a17c29ffcba14ee0593315cbe`. The frozen SEC input is SHA-256 `329513a3cfd8e939373533fad90f36b9108ce0ea41a22f9cc348587a4110fe66`. The package uses the frozen Lean `4.35.0-rc3`, Mathlib `c55e6e786f49` and DifferentialGeometry `788efe978944` pins. The three producer modules and Lake manifest were unchanged by this packet. [Pinned baseline](../../../research-progress/01_BASELINE.md)

## Callable result

`FirstOrderTwistor.bufferedInterpolation` takes a real scalar cutoff `η` on `EuclideanFour`, a finite family of real component functions `u`, and a real constant `U`. Its hypotheses are that `η` is globally $C^1$, nonnegative and compactly supported, that every component of `u` is $C^2$ at every point of `tsupport η`, and that $U\ge0$ bounds the coordinate norm of `u` on that support.

The declaration defines $Y=\|\eta Du\|_{L^4(dx)}$, $X=\|\eta^2D^2u\|_{L^2(dx)}$ and $c=\|D\eta\|_{L^4(dx)}$ by the corresponding roots of the integrals of the powers of the actual coordinate Euclidean norms. The volume is Euclidean `volume`. The conclusion is

$$
\begin{aligned}
 Y^4 &\le U(4cY^3+4Y^2X),\\
 Y &\le 4cU+2\sqrt{UX},\\
 Y^2 &\le 32c^2U^2+8UX.
\end{aligned}
$$

With the smooth manuscript cutoff, $c_\eta=\|D\eta\|_{L^4}+\|D^2\eta\|_{L^2}\ge c$ gives the same bounds with $c_\eta$ by monotonicity. The first derivative of the cutoff is enough for the interpolation argument. The proof includes the zero cutoff and zero gradient cases.

E14d derives the Hölder inputs from the existence of a common compact support. The cutoff derivative, weighted gradient, weighted Hessian and signed flux contraction are continuous, and vanish outside `tsupport η`. This gives the required `MemLp` conclusions for the first three and integrability for the flux. On the cutoff support, E14b gives the pointwise estimate and the supremum bound replaces $|u|$ by $U$. Outside the support both the cutoff and flux derivative vanish. The left side of the E14a integration-by-parts identity is rewritten using the equality of the squared coordinate gradient norm with `euclideanGradientSq`. E14c then supplies the actual integral inequalities and the algebraic endpoints. [Integration by parts](E14A_RETURN.md) · [Pointwise estimate](E14B_RETURN.md) · [Hölder estimate](E14C_RETURN.md)

## Evidence scope

The declaration has the listed regularity, cutoff and norm-bound hypotheses. There are no independent integrability, pointwise-flux, Hölder or quartic-inequality hypotheses. E14 still needs the actual scale-uniform cutoff construction and Weyl first-variation argument for `msneck:annulus-bound` in a supplied annular chart. Applying that estimate to a sequence also requires geometry supplying the charts and their uniform controls. [SEC `msneck:ceta` and `msneck:annulus-bound`](../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L5534) · [E16a scalar consequence](E16A_RETURN.md)

## Checks

`lake env lean` elaborated the module. A temporary compiled import passed `#check` and reported exactly `propext`, `Classical.choice`, and `Quot.sound` under `#print axioms`. The same import instantiated the theorem with a zero cutoff, zero supremum bound and arbitrary coordinate components.
