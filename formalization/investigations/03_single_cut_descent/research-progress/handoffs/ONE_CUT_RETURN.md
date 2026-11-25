# FOT-E28i · One specified cut and descent on the original type

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E work. The serving model variant and reasoning effort are unavailable.

[Lean module](../../../../FirstOrderTwistor/OneCutDescent.lean) · [Marked exterior recognition](EXTERIOR_RECOGNITION_RETURN.md) · [Exterior patch construction](PATCH_RETURN.md) · [Same-type descent source][descent]

## Result

`FirstOrderTwistor.oneCutDescent` takes one smooth oriented capped exterior $\widehat V$ with cap metric $g_V$, one compactification $\widehat X$ with metric $g_X$, and the specified partial inverse of the core embedding into the original manifold $M$. Both energies integrate the squared Hilbert–Schmidt norm of the actual positive Weyl block in supplied pointwise oriented orthonormal frames. The squared norms are assumed integrable with respect to their metric volumes. The exterior comparison bounds its energy by $e-x+\eta$, where $x$ is the energy of $g_X$, $x>4\pi^2$, $e\le 8\pi^2-\delta$ and $0\le\eta\le\delta$. Both metrics have positive conformal Yamabe constants.

The theorem applies CUT-E01 and the furnished E04 recognition and Palais extension to that exterior. The recognized map and its open cap neighborhood are then passed to the local realization hypothesis. `MarkedCutRealization` supplies the retained exterior and normal-ball partial diffeomorphisms, the three charts on a common signed parameter domain, two covers, both exact overlap equalities, and the forward patch formulas and orientations. The realization is required for corrected maps with the cap and complement identities and takes its collar inside the returned open cap neighborhood. The core partial map is fixed before recognition. The gluing theorem constructs an oriented diffeomorphism $\Phi:M\to\widehat X$ agreeing with that exact core map on its source. [Exterior recognition](EXTERIOR_RECOGNITION_RETURN.md) · [Smooth gluing](SMOOTH_GLUE_RETURN.md)

For that same returned map $\Phi$, the theorem states positivity of the conformal Yamabe constant of $\Phi^*g_X$, integrability of its squared positive-block norm in the transported frames, and the exact equality $E_+(\Phi^*g_X)=E_+(g_X)=x$. It then gives membership of $x$ in `geometricPositiveEnergies oM` and $I_M\le x<e$, where $I_M$ is the infimum of that set. The strict part uses the Route 02 Euler and Ricci budgets, Yamabe comparison, and a strict compactification Yamabe bound through `strictComponentResidual`. Given $0<d<Y_{\rm rd}$ and $Y([g_X])\le Y_{\rm rd}-d$, the same cut supplies $0<\kappa(d)$, $x\le e-\kappa(d)$ and $\kappa(d)\le e-I_M$, with $\kappa(d)=\big(Y_{\rm rd}^2-(Y_{\rm rd}-d)^2\big)/48$. Thus $e-I_M<\kappa(d)$ excludes these supplied cut data. [Geometric transport](../../../../FirstOrderTwistor/GeometricCutDescent.lean) · [Route 02 residual](../../../../FirstOrderTwistor/ComponentBudgets.lean)

## Geometric application

The smooth global comparison inputs for the chosen cut remain the actual full core embedding and cap realization, the protected-core and splice energy inequality and the strict compactification energy gap. Recognition takes the topology of the particular capped homotopy sphere and the standard hemisphere extension as supplied. The chart and overlap fields must be realized in the smooth normal-coordinate cut, with the common angular factor specialized to the marked $S^3$. These local conditions specify domains on each side and identify the two formulas on an open collar. The residual conditions come from the specified limiting source data and compactification. [Normal-coordinate cut][cut] · [Same-type descent source][descent]

## Verification

The source notes match the revision at `7db310a2a9219c537b440d7c2fb39e602a32b729`. The working checkout was `0c3399d831d71a1a17c29ffcba14ee0593315cbe`. The Lean version was `4.35.0-rc3` with Mathlib `c55e6e786f49` and DifferentialGeometry `788efe978944`. [Lake manifest](../../../../lake-manifest.json)

`lake build FirstOrderTwistor.OneCutDescent` passed with 4,051 jobs. In a fresh module import, `#check` confirmed the dependent conclusion on the same diffeomorphism, the core equality, both energy bounds and the quantified residual. `#print axioms` returned `[propext, Classical.choice, Quot.sound]` for both public declarations.

[cut]: ../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E03_EMBEDDED_CUT_20261125.md
[descent]: ../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E02_E05_SAME_TYPE_DESCENT_20261125.md
