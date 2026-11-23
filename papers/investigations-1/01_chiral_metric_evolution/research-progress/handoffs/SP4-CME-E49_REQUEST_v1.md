# SP4-CME-E49 request v1 — nonlinear round stability in the fixed gauge

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Configured helper gpt-6.2-sol/ultra; selected lead preserved, actual identifiers unavailable.

Own only notes/49_FIXED_GAUGE_NONLINEAR_STABILITY_20261122.md and research-progress/handoffs/SP4-CME-E49_RETURN_v1.md. Read B35, B36 and E47–E48 lead assessment. No shared edits.

Prove the exact H_st hypothesis frozen for E50: on the fixed round oriented Riemannian S4 with perfect chiral reference A0, native time and negative-Killing pairing, for each fixed integer m≥6 choose eta,C,alpha>0 so every smooth definite B0 with ||B0−A0||H^m<eta has a global smooth solution of E48's corrected gauge, smooth through zero, staying in one fixed definite/parabolic neighborhood, with ||B(t)−A0||H^m <= C exp(−alpha t)||B0−A0||H^m. Keep the reference, delta0, Delta0 and S0* fixed.

Method is fixed: E47's weighted half-line isomorphism and E48's remainder bounds give a contraction in the space with norm sup exp(alpha t)||a||H^m + ||exp(alpha t)a||L2 H^(m+1) + ||exp(alpha t)a_t||L2 H^(m−1). Derive actual weighted nonlinear estimates and a concrete ball/data threshold. Check completeness, initial trace, distributional equation and small first-jet/definite region. Then justify smoothness through zero for smooth data and at all later times without silently assuming it of the fixed point. One permissible route: E29 local smooth solutions with common lifespan controlled by H6 and the fixed parabolic jet region, comparison to the energy-class solution, followed by repeated smooth restart. Prove the comparison uniqueness and ensure that the common lifespan does not secretly depend on unbounded higher Sobolev norms. An explicit higher-regularity energy/difference-quotient proof is also allowed. Retain only the smooth-data theorem if a stronger rough-data statement adds an unproved regularity premise.

No unadjusted recovery or small-C0 transfer in this packet; E50 separately checks that conditional implication. No all-perfect-manifold generalization, no exact optimal exponential rate, no claim that source implementation issues disprove its conclusion.

Frozen inputs (branch relative):
- notes/47_ROUND_STABLE_LINEAR_20261122.md SHA-256 ddfb53f02f6e5059bd9e2d9bea8128cb50f4da5de90870d7f5b5ec4c69e301d6
- notes/48_FIXED_STABILITY_GAUGE_20261122.md SHA-256 b2b5f9cecc513d4eff4726f091883cb8995535513e05e57a4fc97e22aa421e8b
- notes/29_LOCAL_PARABOLIC_INPUT_20261122.md SHA-256 f39b671825c8ba2c6b7a22f0c829587e9d04c3de1bb4ce2b18ae5c696ffaa5b5
- research-progress/handoffs/SP4-CME-E50_REQUEST_v1.md SHA-256 2ee0d2af956c32441758b623398ce142a7810267a574cb707067b5d4beb0d27f

Report consumed hashes. Acceptance requires a complete nonlinear implication with exact norm and regularity scope, not the assertion that parabolic stability is standard. Record exact source versions and passages if any additional input is used. If the fixed method fails, isolate the first failed bound or continuation inference, and return the conceptual choice to lead.
