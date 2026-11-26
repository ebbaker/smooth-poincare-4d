# The local conformal factor of the transported pocket

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Bounded E45 follow-up on working revision `19c187ad8dbe936cf165017c753a94add775ebaf`. Selected helper setting Sol 6.2/ultra. Independent serving metadata are unavailable.

[Euclidean pocket and conformal factor](../../../../SmoothPoincare/Variational/EuclideanPocketCapGerm.lean) · [Closed marked cap comparison](E45_TRANSPORTED_DISK_CAPS_20261126.md) · [Native pocket metric](../../../../SmoothPoincare/Variational/NativePocketFlattening.lean)

Take the actual partial physical chart $F$ and its open Euclidean region $U$ containing the entire pocket $\overline B_b$. From the forward tensor identity for the flattened metric, the inverse chart identity follows by differentiating $F\circ F^{-1}=\operatorname{id}$ on the open target. This works for all tangent vectors at every point of $F(U)$.

Let $C_b$ denote the scaled stereographic marking and $A=C_b^{-1}F^{-1}\phi$ the disk core. Write $\xi=F^{-1}\phi(y)$. In the pinned radius-two convention the round metric pulled back by $C_b^{-1}$ has Euclidean density
$$
\rho_b(\xi)=\frac{16(2/b)^2}{(4+|(2/b)\xi|^2)^2}>0.
$$
For the conformal transported metric with log factor $u$ on the physical source, the actual local disk log factor is
$$
u_D(p)=u(F(C_b(p)))-\tfrac12\log\rho_b(C_b(p)).
$$
It is smooth on the open set $\operatorname{source}(C_b)\cap C_b^{-1}(U)$, which contains the whole retained closed hemisphere and its boundary. On a neighborhood of the marked closed original disk, the differential of $A$ is the product of the differentials of $C_b^{-1}$, $F^{-1}$ and $\phi$ in that order. The two inverse chart evaluations and the identity $\exp(2u_D(Ay))\rho_b(\xi)=\exp(2u(\phi y))$ give equality of the full metric germs. The test uses the entire tensor through that same differential, so the physical and stereographic changes cannot be selected independently.

The cap germ leaf consumes the forward Euclidean chart identity through `euclideanPocket_inverseMetric_of_forward` and the round tensor identity through the explicit radius-scaled density. The prior global cutoff uses this actual smooth local log factor on the same marked hemisphere to construct the installed cap. The compatibility calculation itself does not need a curvature estimate or an energy threshold. Positivity and both outgoing ledgers enter through the fixed-source cap construction.

The native pocket metric lemma supplies the forward tensor on a specified open ball. The pocket radius must be chosen strictly inside that ball to supply $U$. The stereographic density formula is checked separately for the actual round model. [Round stereographic metric](../../../../SmoothPoincare/Variational/StereographicCapMetric.lean)

## Verification

The direct leaf check and `lake build +SmoothPoincare.Variational.EuclideanPocketCapGerm` passed in Lean `4.35.0-rc3`. The targeted build completed 10,015 jobs. The leaf SHA-256 is `98f8ba42ea6f87f30134b1462b9e3fa5bf443fd4e6b2e8b79c7694a93b982048`. The exact three signatures and axiom readback have SHA-256 `aacfd0ef3480de5e413bd59b031d637529375003687058baa7dd8bb5afed4568`. The transitive axiom union is `propext`, `Classical.choice` and `Quot.sound`.

The [coordinate fixtures](E45_EUCLIDEAN_POCKET_GERM_FIXTURES.lean) passed direct checking. They evaluate the actual round density at the center of a pocket of radius one third and apply the reverse tensor statement with the actual Euclidean metric and an identity marking. Their SHA-256 is `ff6f620fb469db869974a5528a13662f2ca445cc02ca1eeb5b4b26854d37c346`.
