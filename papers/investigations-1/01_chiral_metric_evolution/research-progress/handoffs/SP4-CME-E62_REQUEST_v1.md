# SP4-CME-E62 request v1 — whole-time critical strain budget

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Helper configured gpt-6.2-sol/ultra; lead actual identifiers unavailable. Read B41. Own notes/62_GLOBAL_CRITICAL_STRAIN_BUDGET_20261122.md and research-progress/handoffs/SP4-CME-E62_RETURN_v1.md only.

Frozen inputs:
- notes/59_CRITICAL_PATH_STRAIN_20261122.md SHA-256 2441c43abbed3380facfa1ad105c91c3455f016ea2a36949df54b689d93a9a1a
- notes/49_FIXED_GAUGE_NONLINEAR_STABILITY_20261122.md SHA-256 45ed7b07731863a78a7d5c82fd150b27f28ec8ada8faf8769cb193e5606a1a16
- notes/50_SMALL_VALUE_STABILITY_TRANSFER_20261122.md SHA-256 ae7a4d7ae529ec298dd8517d5c36a8714799da3d89249c492c3e80eba63b81bf
- notes/42_SMALL_VALUE_ROUGH_SYSTEM_20261122.md SHA-256 4e1f0bcf6d9b4dd0fbd1a0c49f416154ff2b92a256502ce0bba2d7a14e36fd77
- notes/53_CRITICAL_FINITE_P_HEAT_20261122.md SHA-256 6c30a73e93b435c9a6414628b2125235c0d72d58a93b5919608afb67b882c312
- notes/16_TEMPORAL_STRAIN_CRITERION_20261122.md SHA-256 204022875cd34b4672850e9e9540c9a099caa21f8f35c4c82915b359d4412193

Use this exact named premise Hcrit, separately pursued in E60: on the fixed round reference there are Tcrit>0,epscrit,Ccrit such that every smooth compatible initial pair of localized critical norm delta<epscrit has the E36 adjusted solution, identical to the E42 solution, smooth through zero and compatible on [0,Tcrit], with E_Tcrit(U)≤Ccrit delta. Norm p8,s1/2 is localized as E57/B38/E59, with any finite atlas differences justified. State the result conditional on Hcrit, without claiming that E60 has already been accepted or silently reading an unfrozen in-progress note.

Prove global original-flow existence (using E49/E50) and J(infinity)≤Omega(delta) for a modulus Omega(delta)→0, with fixed m≥6. Use a single common smoothing/splice time tau0 in (0,Tcrit), small enough to lie in E42's common interval. Derive a finite monotone modulus omega(delta)→0 for the H^m smoothed connection using exactly E42 positive-time continuity and the critical-to-uniform embedding. Do not assume it is Lipschitz. Estimate the stable tail integrand by fixed H^m norm and its square, using F=dA+A² and H^m→C³ for m≥6 on S4, retaining fixed connection and frame terms. Integrate E49 exponential decay. Use exact E50 product/inverse recovery ordering and actual uniqueness overlap, and E59's timewise naturality, to obtain the bound for the original solution in E14 norms and clock.

State for every requested positive budget b a sufficiently small initial critical threshold giving J∞<b. Give the consequent relative metric and Q comparison from E14, with exact factor 4512sqrt(2) and initial reference matrices if used; no scalar pinching invariant region may be assumed. Optionally derive a sufficient small ||U0||L8+||D0U0||L^(4,1) condition from E53 after all local cutoff and connection terms are accounted for. Keep initial smoothness and compatibility, a fixed standard round reference, and the full gradient assumption.

No limiting automorphism, original solution from continuous input, linear modulus, general intrinsic-strain criterion or arbitrary-sphere initialization is claimed. Acceptance requires every smallness/clock/supremum/time quantifier and the dependence on Hcrit explicit. Return a precise missing implication if needed. Record new primary dependencies, if any; the frozen proofs suffice for a direct derivation.
