# FOT-E26b/E28a · Selection of a fixed radius for one cut

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E work. The serving model variant and reasoning effort are unavailable.

[Route plan](../../research-plan/PLAN.md) · [Lean module](../../../../FirstOrderTwistor/CutSelection.lean) · [Two-cap audit][audit] · [Embedded cut][cut] · [Same-type descent][descent]

## Checked conclusion

`FirstOrderTwistor.selectFixedSphericalCut` first chooses an integer buffer length `ℓ ≥ 1` using the limit of the localization loss. For every positive radius bound it then chooses one fixed radius `s` inside that bound. With `ℓ` and `s` fixed, it intersects the source tails for total energy, core transfer, collar transfer and the cap inequalities. All three bounds hold at every source index beyond a single cutoff.

$$
E_{+,\mathrm{ext}}<e-e_X+4\varepsilon,\qquad
E_{+,\mathrm{ext}}<T,\qquad
Y_{\mathrm{ext}}>\frac12\min\{y_0,Y_{\rm rd}/2\}>0.
$$

The energy allowances are the source total overshoot, the compactification tail, the core transfer error and the added quadratic Weyl cost. The same collar error controls the Weyl cost and the linear Yamabe perturbation. The proof uses `exteriorEnergyLtThresholdOfStrictError` and `halfCapYamabeMargin`. The inequality `4 * ε < δ` allows the endpoint `eX = T`. The equality example in CUT-E01 concerns a non-strict exterior estimate that exhausts the entire margin. [Scalar threshold](../../../../FirstOrderTwistor/CutMargin.lean) · [Yamabe margin](../../../../FirstOrderTwistor/CapEstimates.lean)

## Geometric inputs

In the application, use the smooth, oriented Riemannian homotopy four-spheres and the self-dual Weyl Hilbert–Schmidt normalization of NECK-E02/E05. Set $T = 4\pi^2$, $y_0 = \sqrt{48\delta}$ and $\mathrm{bufferLoss}(\ell) = C_I\ell^{-3/2}$. The initial sequence supplies the limit $e$ of total self-dual Weyl energies, its energy budget and the uniform source Yamabe lower bound. [Same-type descent][descent]

The limit core is the compactification with the normal ball of radius $\exp(1)s$ removed. Its energy tends to $e_X$ by exhaustion. Its full orientation-preserving comparison embedding must also carry the marked collar and the retained buffers. For every sufficiently small fixed radius at the given length, the core energy must converge in the source sequence. The normalized collar must converge in $C^2$ on that full fixed strip. Its limiting product error is $O_\ell(s^2)$. [Embedded cut][cut]

The cap hypothesis supplies the upper energy bound and lower Yamabe bound on the actual exterior produced by that cut, with the same radius, source index and collar error. The energy comparison uses the disjointness of the retained exterior from the inner compact core and charges all exterior source energy to the total energy. It also uses the separate Weyl splice estimate. The Yamabe comparison uses the supplied local form bounds and the IMS error on the protected buffer. The present Lean result starts with those scalar bounds and the fixed-parameter limits. Smooth embeddings, conformal compactification, the geometric Weyl and Yamabe estimates, and smooth recognition and reassembly enter outside the selection proof. [Two-cap audit][audit] · [Same-type descent][descent]

## Verification

The frozen note inputs were checked at `7db310a2a9219c537b440d7c2fb39e602a32b729`. Their SHA-256 prefixes are `58969f8b827d` for NECK-E01, `6ecef368cfe3` for NECK-E03 and `61d01e1cf53b` for NECK-E02/E05. The pinned tools are Lean `4.35.0-rc3`, Mathlib `c55e6e786f49` and DifferentialGeometry `788efe978944`.

`lake build FirstOrderTwistor.CutSelection` succeeded. The theorem elaborated through `import FirstOrderTwistor.CutSelection` and `#print axioms` reported `[propext, Classical.choice, Quot.sound]`. A constant-family probe used $e_X=T=1$, $e=3/2$, $\delta=1/2$ and $\varepsilon=1/16$ and obtained the conclusion through the public theorem.

[audit]: ../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E01_TWO_CAP_AUDIT_20261125.md
[cut]: ../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E03_EMBEDDED_CUT_20261125.md
[descent]: ../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E02_E05_SAME_TYPE_DESCENT_20261125.md
