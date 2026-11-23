# SP4-CME-E50 request v1 — conditional small-value stability transfer

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Configured helper gpt-6.2-sol/ultra, lead actual identifiers unavailable. Task numbering reserves E49 for the separate nonlinear stability contraction.

Own only notes/50_SMALL_VALUE_STABILITY_TRANSFER_20261122.md and research-progress/handoffs/SP4-CME-E50_RETURN_v1.md. Read B36 and B35. Do not edit shared files or assert the separate stability hypothesis proved.

Fix round oriented Riemannian S4 and its perfect chiral connection A0, native Fine time and negative-Killing pairing. Assume H_st: for a fixed integer m≥6 there are eta,C,alpha>0 such that every smooth definite B0 with ||B0−A0||H^m<eta has a global smooth solution B(t) of

 B_t=v(B)−d_B delta0(B−A0)−S_B Delta0 S0*(B−A0),

smooth through t=0, remaining in a fixed definite neighborhood, with ||B(t)−A0||H^m <= C e^(−alpha t)||B0−A0||H^m. Here delta0 and Delta0 are the fixed reference adjoint and nonnegative rough vector Laplacian. No convergence of recovering automorphisms is part of H_st.

Prove or locate the exact gap in this conditional consequence: some epsilon>0 makes every **smooth** initial connection A_in with ||A_in−A0||C0+||F_Ain−F0||C0<epsilon generate a global smooth solution of the actual unadjusted Fine gradient flow, with exponential H^m convergence to A0 modulo time-dependent bundle automorphisms after a fixed positive smoothing time. Higher derivatives of A_in are not bounded uniformly. Do not claim a continuous-initial-data original flow or a uniform recovery bound near zero.

Method is fixed: apply E42 about the stationary reference, choose a fixed tau in (0,T), use its all-derivative continuity at zero datum to make the adjusted A(tau) H^m-small, retain smoothness through zero for each smooth input via the individual local comparison, recover the original trajectory on [0,tau], start H_st at the adjusted tau slice, and align its recovered original path by a constant bundle automorphism at the splice. Give exact left-action compositions, signs/generators, existence of recovery on every finite interval of compact principal SO(3) bundle, smooth matching/uniqueness at the splice, and the automorphisms exhibiting convergence. State which constants depend on the fixed setup and which recovery bounds may depend on the particular smooth input. Do not require limiting automorphisms.

Frozen inputs:
- notes/42_SMALL_VALUE_ROUGH_SYSTEM_20261122.md SHA-256 4e1f0bcf6d9b4dd0fbd1a0c49f416154ff2b92a256502ce0bba2d7a14e36fd77
- notes/28_FIXED_GAUGE_CORRESPONDENCE_20261122.md SHA-256 b5bc0ba6f3981370f29027481a8293083e3fc93e9fa013e4494ab86767f74175
- notes/29_LOCAL_PARABOLIC_INPUT_20261122.md SHA-256 f39b671825c8ba2c6b7a22f0c829587e9d04c3de1bb4ce2b18ae5c696ffaa5b5
- notes/36_COUPLED_CURVATURE_SYSTEM_20261122.md SHA-256 a1adab7273967261379aca8045d17a9773943adf1cdb8ca510b9ee2b8829097a
- reviews/E41_E44_ROUGH_LOCAL_ASSESSMENT_20261122.md SHA-256 cd4081efe286ebe299a911b4a79c3fe9904ec84601c9a1e6ddc0209c1fb6eb75

Report input consumption. Finite scope is the implication H_st→this smooth-data small-value basin statement. Cite existing exact primary dependencies with version/passage if used; no new source theorem should silently replace H_st. Failure disposition: isolate the first gauge or regularity gap and return conceptual choices to lead.
