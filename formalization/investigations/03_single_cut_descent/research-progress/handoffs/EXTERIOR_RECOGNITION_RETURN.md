# FOT-E25f · Recognition of the specified capped exterior

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E work. The serving model variant and reasoning effort are unavailable.

[Route plan](../../research-plan/PLAN.md) · [Marked cap correction](RECOGNITION_RETURN.md) · [Lean module](../../../../FirstOrderTwistor/ExteriorRecognition.lean)

## Recognition on the recorded exterior

`FirstOrderTwistor.exists_markedExteriorRecognition` uses the actual smooth Riemannian metric on the capped exterior `Vhat`. CUT-E01 applies to `chiralFrameEnergy g W` with threshold $4\pi^2$. The positive `classYamabeFour` test and the strict energy bound go to the supplied parent E04 recognition principle. Its witness is an orientation-preserving smooth diffeomorphism to the Euclidean unit four-sphere. In the geometric application, `W` presents the self-dual Weyl endomorphism in oriented orthonormal frames. The homotopy-sphere topology gives $\tau=0$, $\chi=2$ and simple connectivity. The full four-index Weyl integral is $8E_+$ and thus lies below $16\pi^2\chi$. The orientation of the recognized map can be chosen by a reflection of the sphere. [SEC recognition proposition][sec] · [Chang–Gursky–Yang, Theorem A and Remarks 1–2][cgy]

The model cap `standardFourSphereCap` is the closed southern hemisphere. The cap marking is a partial diffeomorphism from an open model neighborhood containing that hemisphere to the recorded cap neighborhood in `Vhat`. The chain rule proves that composing this marking with the initial recognition preserves orientation on the local domain. The separately supplied Palais extension principle applies to an oriented partial self-diffeomorphism of the model sphere whose source contains the hemisphere. It yields an oriented ambient diffeomorphism agreeing with that local map near the cap. E25c then supplies the corrected recognition and its inverse, agreement with both directions of the marking on open neighborhoods, and both directions of the image identities on the cap complements and on the complements of the cap interiors. The latter include the cut boundary. [Marked descent audit](../../reviews/MARKED_DESCENT_AUDIT_20261125.md) · [Palais, Theorem C, p. 277][palais]

The geometric application supplies the actual positive-block identification, the E04 recognition instance, the cap-neighborhood marking and the hemisphere instance of the Palais extension theorem. The corrected map and its open overlap agreements are the input for the exterior patch in smooth reassembly. [Exterior patch](PATCH_RETURN.md) · [Orientation of the glued map](ORIENTED_GLUE_RETURN.md)

## Two capped energies

`FirstOrderTwistor.eitherSummandEnergyLtThreshold` proves that if the sum of two capped energies is below $2T$, at least one energy is below $T$. `FirstOrderTwistor.twoSummandEnergyCounterexample` gives the positive scalar example $E_{\rm core}=T/4$ and $E_{\rm ext}=3T/2$ for every $T>0$. These sum to $7T/4<2T$ with the exterior above $T$. The strict bound on the specified exterior therefore uses its own cut comparison. [Single-cut descent][descent]

## Verification

The source inputs use the frozen note revision `7db310a2a9219c537b440d7c2fb39e602a32b729` and working checkout `0c3399d831d71a1a17c29ffcba14ee0593315cbe`. The pinned tools are Lean `4.35.0-rc3`, Mathlib `c55e6e786f49` and DifferentialGeometry `788efe978944`. [Lake manifest](../../../../lake-manifest.json)

`lake build FirstOrderTwistor.ExteriorRecognition` succeeded with 4,043 jobs. A separate import checked the theorem with the actual `classYamabeFour` definition. The four theorem declarations each reported axioms `[propext, Classical.choice, Quot.sound]`. A further example specialized the scalar counterexample to $T = 4\pi^2$ and the summed bound $8\pi^2$.

[sec]: ../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L178
[cgy]: https://www.numdam.org/item/10.1007/s10240-003-0017-z.pdf#page=3
[palais]: https://doi.org/10.1090/S0002-9939-1960-0117741-0
[descent]: ../../../../../papers/investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E02_E05_SAME_TYPE_DESCENT_20261125.md
