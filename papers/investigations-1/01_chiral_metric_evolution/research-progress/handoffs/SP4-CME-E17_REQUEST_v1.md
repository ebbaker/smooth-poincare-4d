# SP4-CME-E17 request v1 — fixed-round Lorentz endpoint benchmark

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Authorized Sol 6.2/ultra execution; lead settings unavailable. Read root instructions and B16. Own notes/19_LORENTZ_SPATIAL_BENCHMARK_20261122.md and research-progress/handoffs/SP4-CME-E17_RETURN_v1.md only. No shared edits or chat capture.

Fix standard smooth oriented unit round S4 with metric g0 and volume V0. Let A be any smooth round-positive definite connection on its chiral bundle, reconstructed metric ghat, Q,T as before; impose C0^{-1}g0≤ghat≤C0 g0 when converting norms. Prove osc(log D)≤C_round ||T||_{L^{4,1}(g0)} with T measured using g0 on its base index, and give explicit dependence if replacing by ghat norms/measure. Define ||f||_{4,1}=∫_0^{V0} s^{1/4} f*(s) ds/s. An explicit conservative C_round is welcome, but a finite constant from the derived kernel bound suffices.

Use the round scalar Green representation: derive its radial derivative from (sin³r G′)'=sin³r/V0 away from the pole with the correct delta normalization (sign immaterial for the norm), and establish |∇G|≤C dist^{-3} globally. Show this kernel has uniformly bounded weak-L^{4/3} norm by round ball volumes. Prove the pairing bound using layer-cake/rearrangement rather than silently importing a Sobolev endpoint. For the locally Lipschitz log D, justify smooth approximation or weak gradient representation; E04 supplies the a.e. strain inequality at eigenvalue crossings. Combine with a spatial energy anchor using e=P/∫mu<3/2: D≤sqrt((1+r)/(1−r)) exp(C_round||T||4,1), r=sqrt(2e/3), then trace-three eigenvalue floor. No path-cost conclusion is required unless independently proved.

Compare with E12: fixed positive oscillation enforces a nonvanishing endpoint Lorentz norm, even though its L4 norm tends to zero. Limit the conclusion to the supplied fixed geometry/comparability assumptions, no flow estimate or construction on an arbitrary homotopy sphere. Finite scope one round kernel and one conditional benchmark. Stop at boundary.

## Frozen inputs

- `papers/investigations-1/01_chiral_metric_evolution/brainstorm/notes/B16_ENDPOINT_SPATIAL_NORM_20261122.md` SHA-256 `8aacbe956fe055e47dbb55789f19fbd38a844abd7f2c603e3eefbf3d23f8dc13`
- `papers/investigations-1/01_chiral_metric_evolution/notes/06_TRANSPORT_ANCHOR_ESTIMATE_20261122.md` SHA-256 `fee07a471206c1d8183ed7ff75df7ce489a212152a611366e36d983f927aa7eb`
- `papers/investigations-1/01_chiral_metric_evolution/notes/14_CRITICAL_STRAIN_CONCENTRATION_20261122.md` SHA-256 `9df659ec21fb1d511ef637dbd8ca6b3109ebad8252426135f46cf0986a9dd7fb`
