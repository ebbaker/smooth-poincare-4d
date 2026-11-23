# SP4-CME-E10 request v1 — shrinking definite perturbations on round S4

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Authorized fixed Sol 6.2/ultra execution; lead actual settings unavailable. Read root instructions and B09. Own notes/12_CONCENTRATED_INITIAL_DATA_20261122.md and research-progress/handoffs/SP4-CME-E10_RETURN_v1.md only. No shared edits or chat capture.

Fix the standard smooth oriented round Riemannian S4, K=1, E=Lambda+, A0 the round connection, manuscript delta norm and bracket, F0=−Sigma. Use radial gauge and geodesic coordinates x around p, A0(p)=0. Fix a smooth cutoff chi on the unit R4 ball equal to one near zero. One admissible profile in y coordinates is a_i(y)=−(c_i/2) chi(y) Sigma_i,ab(p) y^a dy^b, c=(1,−1,0). Define the actual global connection A_epsilon=A0+delta epsilon a_i,b(x/epsilon) dx^b, extended by A0. Let 0<epsilon≤epsilon0 and choose fixed delta>0 small depending on this one profile. No numerical sweep.

Check the profile sign and center curvature exactly: target F_i(p)=−(1+delta c_i)Sigma_i, Qii(p)=3(1+delta c_i)^2/(3+2delta²), D(p)=(1+delta)/(1−delta). Prove that with delta sufficiently small the whole family is smooth, round-positive, uniformly definite and reconstructed metrics uniformly comparable to g0. If available choose the same delta small enough for global |q|≤1/8. Show P(A_epsilon)=O_delta(epsilon^4) and squared speed norm ∫|v(A_epsilon)|^2 dV_ghat=O_delta(epsilon²); explicitly justify the metric derivative, curvature derivative and support bounds. A coarse uniform estimate suffices, not a leading asymptotic coefficient. Use E04 to prove C_T≥log D(p)/sqrt2 by comparing p to a point outside support. State that normalized energies have the same scaling since total mu is the fixed topological volume.

Acceptance: one smooth actual closed-bundle family, exact fixed nonzero center defect, quantitative scaling with constants independent of epsilon, and the precise failed static estimate class. Compare E05 integrated inequality for consistency. No actual singular trajectory, global preservation counterexample or obstruction to scale-sensitive/spacetime estimates. If the proposed profile fails, locate why rather than changing scope. Stop at packet boundary.

## Frozen inputs

- `papers/investigations-1/01_chiral_metric_evolution/brainstorm/notes/B09_CONCENTRATED_INITIAL_DATA_20261122.md` SHA-256 `27e084872ae5f24230af5a2df1e6d8d73749b70a4edc03af8e3ee2df43af22bb`
- `papers/investigations-1/01_chiral_metric_evolution/notes/06_TRANSPORT_ANCHOR_ESTIMATE_20261122.md` SHA-256 `fee07a471206c1d8183ed7ff75df7ce489a212152a611366e36d983f927aa7eb`
- `papers/investigations-1/01_chiral_metric_evolution/notes/07_PINCHED_ENERGY_GAP_20261122.md` SHA-256 `107896b78624f02ccb83f1712139f294a4cee1f06f5e96d9e2775659effea753`
- `papers/investigations-1/01_chiral_metric_evolution/notes/09_DISSIPATION_KERNEL_20261122.md` SHA-256 `59409de49d5d8a2cb3ef490e39d89b4df7e0fd188fc13a2acbfabeffe4ef7d31`
