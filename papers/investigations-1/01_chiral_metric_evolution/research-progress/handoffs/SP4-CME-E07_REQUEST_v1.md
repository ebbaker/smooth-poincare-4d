# SP4-CME-E07 request v1 — a realizable pointwise dissipation kernel

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. User authorized broad continuation and Sol 6.2/ultra delegation. Configured helper settings unchanged; lead actual settings unavailable. Fixed E execution from B06. Read root instructions/workflow and exact B06 target. Own notes/09_DISSIPATION_KERNEL_20261122.md, research-progress/handoffs/SP4-CME-E07_RETURN_v1.md, and if needed numerics/e07_kernel_check.py plus numerics/E07_CHECKS_20261122.txt only. No shared edits or chat capture.

At a point in a smooth oriented Euclidean real 4-chart, E=R³ with bracket epsilon, K=1, F_i(p)=−Sigma_i, Sigma_i,ab=eta_iab with eta_i,jk=epsilon_ijk and eta_i,j4=delta_ij. Work with the actual unadjusted Fine vector field and reconstructed Riemannian metric. Find a nonzero collection X_a in Sym²_0 R³ satisfying Σ_a,j eta_jab (X_a)_ij=0 for every i,b. Provide one explicit rational tensor, verify it exactly, and show its T_a=X_a/2 is nonzero. Finite algebra: one 12-by-20 kernel system and one resulting jet; do not survey numerical cases.

Then realize D_A Q(p)=t X by a local polynomial connection, Q(p)=I, A(p)=0 and v(p)=0, for arbitrary finite t>0. Use A⁰_b=(1/2)x^aF⁰_ab and quadratic correction (t/2)Σ_a(x^a)² V^a with V_i^a=−Σ_j(X_a)_ij J_j dx^a, J_jβ=*(β wedge Sigma_j). Check explicitly via the wedge quotient that ∂_a Q(p)=t X_a, metric/frame contributions to v at p, and positivity on some neighborhood depending on t. Source F derivatives may be nonzero, so account for why v=4 C^a F_a· remains exact (Bianchi/self-duality). Do not presume ∂g=0. If realization fails, locate the precise constraint. The conclusion is a local initial-vector-field example, no solution/global extension or stationary connection.

Acceptance: explicit exact kernel, verified smooth connection jet, invariant nonzero remainder and zero pointwise speed, constants/scaling and precise failed estimate class. No claim that integrated energy dissipation cannot control derivatives; the global E05 estimate is a separate nonlocal assertion. Return any different target to B06. Stop at boundary.

## Frozen inputs

- `papers/investigations-1/01_chiral_metric_evolution/brainstorm/notes/B06_DISSIPATION_TO_TRANSPORT_20261122.md` SHA-256 `79158329ed71e57bec258f1a7f8e56e73dbb9092304b235df3f6e975338fe1de`
- `papers/investigations-1/01_chiral_metric_evolution/notes/04C_VOLUME_AND_JETS_20261122.md` SHA-256 `0893466b285f5bdcfc2f9aae80f88338cacb06a64e270fd745fe4b3186af0838`
- `papers/investigations-1/01_chiral_metric_evolution/notes/05A_REAL_TWISTOR_COMPARISON_20261122.md` SHA-256 `ffae9af03ae0f42c6578abac85f275015cba23efbffef843b230a0a4e546bbf2`
