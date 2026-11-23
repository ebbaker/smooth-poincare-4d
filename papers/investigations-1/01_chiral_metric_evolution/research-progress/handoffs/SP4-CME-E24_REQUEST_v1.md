# SP4-CME-E24 request v1 — Temporal bootstrap and finite-time limits

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Authorized configured Sol 6.2/ultra; selected lead actual settings unavailable. Read B20 and root instructions. Own notes/24_TEMPORAL_BOOTSTRAP_20261122.md and research-progress/handoffs/SP4-CME-E24_RETURN_v1.md only. No shared edits or chat capture.

Take the actual smooth unadjusted independent-connection Fine flow on a closed oriented Riemannian four-manifold, positive definite round-positive component, fixed K>0 and the conventions of E14. For J(t)=integral_0^t sup(|nabla_A T|+|T|^2), a=C_*J and eta=sup|q(0)|, verify
sup|q(t)| <= sqrt(3)((1+eta)exp(a)-1),
and, if scalar Sobolev constant at time zero is S0 in ||u||4^2<=S0(integral|du|^2+K integral u^2), a valid constant at t is S0 exp(a), using fixed dV pointwise. Derive an explicit positive J budget for any chosen pinching epsilon>sqrt(3)eta, and combine E19 with initial ||T0||4^2 < 1/(2 C S0 exp(a_budget)) to obtain conditional critical-strain decay up to first exhaustion of that budget. Account for using a common epsilon small enough for E16/E19. Do not claim the budget persists.

Independently, assume a finite maximal candidate endpoint Tstar<infinity and J(Tstar)<infinity. Use the exact velocity v=−4*[(nabla Q−tr(Q nabla Q)I/3) wedge F] and E14's bound on K^−1 S^−1 F_t to prove, or identify a missing step in, uniform time integrability of |A_t| and |F_t| measured by fixed g(0) and fixed internal metric. The Q eigenvalues are universally <=3, metric is uniformly comparable, and integral||T||infinity dt is bounded by sqrt(Tstar integral||T||infinity^2 dt). Establish C0 spatial limits of connection differences A−A(0) and curvature, distributional curvature compatibility, and strict definiteness of the limiting curvature if justified. Explicitly distinguish continuous limiting connection coefficients/curvature from smooth extension; no gauge or PDE continuation theorem is authorized by these bounds alone. Work in fixed smooth bundle trivializations and show gauge covariance of the resulting assertions.

Finite scope: these two consequences of existing identities only. Return any need for an additional regularity or gauge assumption to B20, without silently adding it.

## Frozen inputs

- `brainstorm/notes/B20_TEMPORAL_BOOTSTRAP_DECISION_20261122.md` SHA-256 `b552bbe9f7338301af7c5354eabc6b2cb57be84a0f38b06d801a4d91448f61a4`
- `notes/16_TEMPORAL_STRAIN_CRITERION_20261122.md` SHA-256 `204022875cd34b4672850e9e9540c9a099caa21f8f35c4c82915b359d4412193`
- `notes/20_CRITICAL_STRAIN_ENERGY_20261122.md` SHA-256 `5b7b6ec68d806188a6a54209a7cc513ce0a0a3a10b1582368ef073ae12585228`
