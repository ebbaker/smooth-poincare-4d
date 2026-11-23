# SP4-CME-E48 request v1 — corrected stability gauge and remainder

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Helper configured gpt-6.2-sol/ultra; lead actual identifiers unavailable.

Own only notes/48_FIXED_STABILITY_GAUGE_20261122.md and research-progress/handoffs/SP4-CME-E48_RETURN_v1.md. Read B35; no shared edits.

On a fixed round oriented Riemannian S4 with perfect chiral reference A0, native Fine metric/time and negative-Killing pairing, define delta0=d_A0* in the fixed reference metric and Delta0=nonnegative rough Laplacian on vector fields. For a=A−A0 fix

  Vst(A)=v(A)−d_A delta0 a−S_A Delta0 S0* a.

Finite checks: (1) coordinate order inventory proving true second-order quasilinearity with principal coefficients smooth in A,F_A values (or isolate any symmetric-first-jet dependence); (2) exact infinitesimal automorphism generator for the two correction terms in the E28 left-action convention, noting fixed Delta0 S0* a is second order; (3) linearization at A0 equals −G0 with G0=d0*P0*P0d0+S0Delta0S0*+d0d0*, including normalization; (4) for integer m≥6, write a_t=−G0 a+N(a), N(0)=DN(0)=0, and prove on a small H^m ball the tame estimates

 ||N(a)||H^(m−1) <= C ||a||H^m ||a||H^(m+1),
 ||N(a)−N(b)||H^(m−1) <= C[(||a||H^m+||b||H^m)||a−b||H^(m+1)
 +(||a||H^(m+1)+||b||H^(m+1))||a−b||H^m].

Account for fixed curvature commutators and all lower terms; no assertion that a mere symbol calculation proves nonlinear stability. Explicitly compare the corrected gauge to Fine (4.9) only as needed; if testing literal order, calculate its potential third-order term rather than infer failure from appearance. No new long-time theorem, recovery estimate or rough-data transfer.

Frozen primary input: root references/1111.5005v2.pdf, 447930 bytes, SHA-256 d92e0dca0fd864beab3f416ef80d998fa421c9fdf68854b3f21490c3da7139c8, version29Nov2011. Exact inspected passages to canonical source record via return; do not overwrite PDF or infer original retrieval.

Frozen local inputs:
- notes/36_COUPLED_CURVATURE_SYSTEM_20261122.md SHA-256 a1adab7273967261379aca8045d17a9773943adf1cdb8ca510b9ee2b8829097a
- notes/29_LOCAL_PARABOLIC_INPUT_20261122.md SHA-256 f39b671825c8ba2c6b7a22f0c829587e9d04c3de1bb4ce2b18ae5c696ffaa5b5
- notes/42_SMALL_VALUE_ROUGH_SYSTEM_20261122.md SHA-256 4e1f0bcf6d9b4dd0fbd1a0c49f416154ff2b92a256502ce0bba2d7a14e36fd77

Report consumed hashes. Acceptance requires actual formulas and Sobolev product allocation. Failure disposition: isolate the first failed estimate or unwanted derivative, retain proved pieces, and return conceptual alternatives to lead.
