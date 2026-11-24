# SP4-FOT-DIR-E48 · Conformal class of the core-and-chamber gluing · request v1

24 November 2026, America/New_York. For Edward B. Baker III. Lead in this session: Claude Fable 5.2 (`claude-fable-5-2`), Claude Cowork, reasoning effort max as configured. Recommended E routing is gpt-6.2-sol / ultra; that helper was not available, so the lead executes the packet itself and the return is not independent of the [B23 decision](../../brainstorm/notes/DIR_B23_CORE_AND_CHAMBER_20261124.md). The question, the method and the completion test below were fixed before the return was written; exploratory calculation in the same session preceded this text. [Owning register](../REGISTER.md).

Take a smooth closed Riemannian four-manifold $(M,g_0)$ flat on a coordinate ball at $p$, and the unit round sphere. Remove a ball of radius $\rho$ at $p$ and a ball around a point of the sphere, and glue the flat collars by an inversion composed with a reflection and a dilation. (i) Decide whether the resulting conformal class depends on the neck size, the relative scale or the interpolation, and compare it with $[g_0]$; give an explicit conformal diffeomorphism or a conformal invariant that separates them. (ii) State the consequence for the Yamabe constant, the minimizing metrics and $\epsilon=3\lambda_5/s-1$, and quantify, in a minimizing metric, the volume of the chamber and the Rayleigh quotient of a function that is constant on the core. (iii) For a class that agrees with a unit-volume Yamabe metric outside a ball of radius $r$, bound its Yamabe constant from above with an explicit test function. Method: direct proof; constants explicit where they are used. Completion: three statements with proofs, or a counterexample to (i). Escalate to B23 if the class moves. Do not treat a neck that is not conformally flat.

## Frozen repository inputs
HEAD 3fb565b70247a57e4fcc7e65886c57ce0ca0e1ab, working-tree bytes.
- papers/investigations-1/03_first_order_twistor/brainstorm/notes/SETUP_AND_TASK_CROSSWALK_20261124.md  `0445e1698fe6f12fed177f1d1124294c2f1405b3cb4ebeb4f7498165b3bbd322`
- papers/investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/continuation-notes/02_AFTER_FIVE_EIGENFUNCTION_RIGIDITY_20261124.md  `548ef536ac2cfb7e4b2ad48083145c4da7f585186ed75f2438dc1eee8b705433`
- papers/investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/reviews/DIR_B22_FIVE_EIGENFUNCTIONS_20261124.md  `7ac8da041a6832117ab7369cbd1cd8f1d625577b2ecfcc704cd9320e038de97d`
- papers/investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/manuscript/dirac_twistor_and_yamabe_rigidity.tex  `35b9c19b26c7ba68755fce831551dd75c169d0fc8356cb349994c6ec3a29aaee`
- papers/investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E26_20261124.md  `44b2c43fd957197ae8c34f7e53cd281cbb9f3ed474166135ba9a4aeb7f26f18b`
- papers/investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E38_20261124.md  `9b1b23d547b3c35c13edcc86682ebd688ea91a9b8f14634349c9190efdbc9dc1`

## Ownership and return
Write `notes/DIR_E48_20261124.md` and `research-progress/handoffs/SP4-FOT-DIR-E48_RETURN_v1.md` in this owning investigation. No manuscript edits and no numerics. Register, plan and source records are integrated by the lead after assessment.
