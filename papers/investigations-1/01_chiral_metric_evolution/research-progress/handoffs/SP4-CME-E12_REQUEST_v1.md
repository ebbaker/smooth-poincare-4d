# SP4-CME-E12 request v1 — logarithmic cutoff and critical spatial strain

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. User-authorized fixed Sol 6.2/ultra execution; lead actual settings unavailable. Read root instructions and B11. Own notes/14_CRITICAL_STRAIN_CONCENTRATION_20261122.md and research-progress/handoffs/SP4-CME-E12_RETURN_v1.md only. No shared edits or chat capture.

Retain the standard closed round S4, K=1, delta norm, E=Lambda+, A0 radial gauge and c=(1,−1,0) from E10. Fix smooth eta:R→[0,1] equal to zero for z≤1/4 and one for z≥3/4. For L≥2, rho_L=e^(−L), r=|x|, set chi_L(r)=eta(log(rho_L/r)/L), continued by one near zero and zero outside rho_L. Set a_L,i=−delta c_i chi_L(r) Sigma_i,ab(p) x^a dx^b/2. Choose one sufficiently small fixed delta>0, then let L→infinity. This is a single prescribed family, not an optimization.

Prove smoothness and global extension; the same fixed nonzero center Q/distortion as E10; uniform definiteness and metric comparability, optionally |q|≤1/8; and ∫|T|^4 dV_ghat→0 with explicit O_delta(L^−3)+o(1) bound. Track all terms from cutoff first/second derivatives, background radial gauge, metric reconstruction and base norms. Verify that ∫|∇Q|^4 has the same upper bound and that the positive eigenvalue floor suffices to pass to T. Treat inner core, long transition and outer region separately. P and squared speed should also tend to zero by direct bounds or finite-volume Holder plus support shrinking; no lower asymptotic is required. E04 gives C_T≥log((1+delta)/(1−delta))/sqrt2 independent of L.

Acceptance: actual smooth definite closed-bundle connections, accurate fourth-power scaling and exact failed static estimate class, including uniform geometric comparison. No claim about solutions, critical spacetime estimates, parabolic epsilon-regularity or absence of all stronger critical norms. If a cutoff term defeats the bound, report it precisely. Stop at packet boundary.

## Frozen inputs

- `papers/investigations-1/01_chiral_metric_evolution/brainstorm/notes/B11_CRITICAL_SPATIAL_NORM_20261122.md` SHA-256 `08f1c1c6486d7375895c6a89a6d39f521e626b1bed7773608ae7a2b14790835d`
- `papers/investigations-1/01_chiral_metric_evolution/notes/12_CONCENTRATED_INITIAL_DATA_20261122.md` SHA-256 `7b9b522cc827c65a643443d0b537317c9ed35d06f0f495b49244a1bf1f594a16`
- `papers/investigations-1/01_chiral_metric_evolution/notes/06_TRANSPORT_ANCHOR_ESTIMATE_20261122.md` SHA-256 `fee07a471206c1d8183ed7ff75df7ce489a212152a611366e36d983f927aa7eb`
- `papers/investigations-1/01_chiral_metric_evolution/notes/05A_REAL_TWISTOR_COMPARISON_20261122.md` SHA-256 `ffae9af03ae0f42c6578abac85f275015cba23efbffef843b230a0a4e546bbf2`
