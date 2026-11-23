# SP4-CME-E57 request v1 — compact-bundle critical linear estimate

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Helper configured gpt-6.2-sol/ultra; lead identifiers unavailable. Execute B38's fixed linear problem, with no nonlinear or geometric theorem.

Own notes/57_COMPACT_CRITICAL_LINEAR_20261122.md and research-progress/handoffs/SP4-CME-E57_RETURN_v1.md only. Read B38. Frozen inputs:
- notes/53_CRITICAL_FINITE_P_HEAT_20261122.md SHA-256 6c30a73e93b435c9a6414628b2125235c0d72d58a93b5919608afb67b882c312
- notes/54_CRITICAL_QUASILINEAR_MODEL_20261122.md SHA-256 34924ef4445b1fc479b79c0f9d5452243c12ae399220e1e077b6e21bfed8073a
- notes/41_COMPACT_LINEAR_ESTIMATES_20261122.md SHA-256 8a35523c145e5781f2bac77163cb7f7a2972e10a69deb37f0c69c26adf573ca3

Fix a smooth closed real Riemannian four-manifold and a finite-rank real vector bundle with smooth metric and reference connection. Let L=C^{ij}(x)D_iD_j+B^i(x)D_i+C^0(x) be fixed smooth, with Re<sum C^{ij}(x)xi_i xi_j v,v>≥c|xi|²|v|² in the fixed Hermitian complexification, for real covectors. No coefficient symmetry or spectral gap is assumed.

Choose a finite smooth atlas, bundle frames, partition and nested cutoffs, and define localized inhomogeneous B^s_(8,1), s=1/2, and E_T by summed localized dyadic time suprema at order s and L1-time blocks at s+2. Use compactly supported coordinate pieces on R4 or a containing fixed flat torus, explicitly defining extension. Prove a unique strongly traced distributional solution to U_t=LU+f for U0 in this B^s and f in L1_t B^s, on a sufficiently short fixed interval 0<T≤T0, with

    E_T(U) ≤ C (||U0||B^s + ||f||L1_t B^s),

where C,T0 depend only on the fixed operator/geometry/choices, not data or T. Supply completeness, trace, construction and uniqueness. Equivalent choices need only a proved bounded comparison for the finite atlas changes actually used, not a general manifold Besov theory.

Allowed method: constant matrix-symbol heat multiplier by exponential Duhamel differentiation and Hermitian coercivity; annular kernel bounds as E53, low modes on bounded time. Freeze coefficients in small charts and use E54's positive-order difference norm. In a multiplier estimate, the small coefficient sup controls the top B^s norm; the fixed Lipschitz coefficient controls the lower L8 norm. For v=D²U this lower term is B², strictly below B^(5/2); interpolate with B^(1/2) and use Young/time factors. Treat cutoff first derivatives and fixed lower terms similarly. Derive exact localization/gluing, especially no unjustified zero extension, and avoid circular absorption after summing overlapping pieces. An a priori estimate alone is insufficient: provide a convergent parametrix iteration or smooth-data approximation plus compactness with the estimate and proved uniqueness. E41 supplies a fixed smooth heat construction if needed, but compare its divergence form and zero/lower-order differences explicitly.

Acceptance requires the actual matrix, low-frequency, localization and endpoint arguments, not a named maximal-regularity theorem. If the specified class fails, isolate the precise obstruction rather than changing p/s or making a spectral-gap assumption. New primary inputs need source/version/passage/hypotheses and actual inspection records; no new source is necessary for a complete direct proof.
