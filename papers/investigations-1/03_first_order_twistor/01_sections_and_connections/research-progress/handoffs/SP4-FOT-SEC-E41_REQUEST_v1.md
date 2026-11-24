# SP4-FOT-SEC-E41 · Realize a full-rank mixed derivative in the true exterior · issued v1

24 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. The author-selected lead and effort were retained. A backend identifier and actual effort for the lead are unavailable. Bounded helpers are configured as gpt-6.2-sol/ultra; configuration is the available provenance.

Read AGENTS.md, the owning register, and the following working inputs (SHA-256, branch-relative).

```
77057c6a0e2c60d90609d34bcef26873b39b5d27965bf2bc0cb03176e4dfb356  brainstorm/notes/SEC_B24_EXTERIOR_REFERENCE_20261124.md
128e6beeb1ddfc520130145bcbaf2fd788f8fcf8648c906009be34dacfc7f27b  manuscript/twistor_sections_and_chiral_weyl_curvature.tex
0cb76883e4b1d7706b192bd1a8488b3e29551506d20dcd7b63d2d538afcab463  notes/SEC_E03_20261124.md
5245d4992287a01e2969151fa1f8b2515980a3471b86c2fe25c8ac13e91531d1  notes/SEC_E27_20261124.md
```

Test this explicit construction only. Same E27 smooth reference and chirality, fixed density. Denote the compared full linearization at r_a=r exp(a v) by A_a. Obtain m disjoint exterior coordinate probes with scalar fiber evaluations spanning C*, using injective exterior restriction and shrinking balls. In each patch choose real phase with nonvanishing differential, X_N=N^{-1}b sin(Nφ) grad φ/|dφ|², so its principal skew derivative is zero. Choose v_N=N^{-2}d cos(Nφ) H, trace-free, with Weyl principal symbol in the chosen target polarization. Sum v_N over patches. Set k_{j,N}=K X_{j,N}−L*G_P L K X_{j,N}. Use the exact gauge identity in manuscript lift:gauge, differentiated at r_a with frames properly compared. Pair with Z∈C. Compare leading transport, divergence and commutator in the differentiated gauge identity, integrate by parts, and bound terms from frame/connection and the moving K; its derivative inside L pairs to zero. Show the projection correction is o(1) in pairings (e.g. weak oscillatory LKX in L² and compact Q=L*G_P on L², uniformly bounded (A'_0)^*Z since v_N derivatives through order two are bounded). Compute the nonzero limiting scalar coefficient, including phase/sign convention. Show actual matrix invertible for one finite N if possible, or identify a counterterm. Do not rely on unique continuation outside K, a constant-dimensional kernel, or generic transversality. Output analytic proof or failure of this exterior rank test; no full-path claim.

Write only notes/SEC_E41_20261124.md and research-progress/handoffs/SP4-FOT-SEC-E41_RETURN_v1.md. Include date, intended author, assistance/configuration versus actual metadata, verified working versions, proof with exact hypotheses, primary passages at dependence and limits. Deliver a proved statement or identify the precise failing step. Escalate a changed mechanism to the lead. No numerics, shared edits, chat registration or further helpers.
