# SP4-CME-E47 request v1 — round stable linear evolution

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Helper configured gpt-6.2-sol/ultra; lead actual settings unavailable.

Own only notes/47_ROUND_STABLE_LINEAR_20261122.md and research-progress/handoffs/SP4-CME-E47_RETURN_v1.md. Read B35; no shared edits. This packet is linear and restricted to the smooth compact round oriented Riemannian S4, its perfect chiral connection A0, native Fine metric/time and negative-Killing pairing. Keep a fixed positive radius/curvature scale. P0 is the exact Fine Hessian factor at perfection; S0(u)=i_u F0. Delta0 is the nonnegative rough Laplacian on vector fields.

Audit/prove the needed facts for G0=d0*P0*P0 d0 + S0 Delta0 S0* + d0 d0*. Verify the Hessian normalization, self-adjointness, strong ellipticity and strictly positive spectrum, using Fine v2 Proposition4.12 and its exact source dependencies; read Theorem3.13 and the round specialization, or give a complete round alternative. Do not claim general perfect-manifold coercivity from a round check.

Then for fixed integer m≥6, choose 0<alpha<inf spec G0 and prove the half-line estimate/isomorphism for a_t+G0 a=f, a(0)=a0:

  sup_t e^(alpha t)||a(t)||H^m + ||e^(alpha t)a||L2_t H^(m+1)
  + ||e^(alpha t)a_t||L2_t H^(m−1)
  <= C(||a0||H^m + ||e^(alpha t)f||L2_t H^(m−1)).

Use the fixed spectral/graph Sobolev scale and verify equivalence with geometric Sobolev norms, trace, completeness and uniqueness. Finite scope: this fixed operator and one forced evolution estimate; no nonlinear theorem or gauge recovery. Check explicitly whether the printed P_2k→H^k trace/isomorphism in Fine §4.3 is the correct trace for the displayed anisotropic norm; record any mismatch as a source-implementation detail without dismissing the stability theorem.

Frozen primary input: root references/1111.5005v2.pdf, 447930 bytes, SHA-256 d92e0dca0fd864beab3f416ef80d998fa421c9fdf68854b3f21490c3da7139c8, arXiv:1111.5005v2 dated29Nov2011. Prior provenance is in root references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md; report new exact inspected passages/date, do not overwrite/download or claim unknown retrieval metadata.

Frozen local inputs:
- notes/36_COUPLED_CURVATURE_SYSTEM_20261122.md SHA-256 a1adab7273967261379aca8045d17a9773943adf1cdb8ca510b9ee2b8829097a
- notes/29_LOCAL_PARABOLIC_INPUT_20261122.md SHA-256 f39b671825c8ba2c6b7a22f0c829587e9d04c3de1bb4ce2b18ae5c696ffaa5b5

Report consumed hashes. Return actual spectral/energy derivation and exact dependency scope. If the G0 kernel proof or estimate fails, isolate the missing input and return the conceptual choice to lead. Do not expand to nonround cases.
