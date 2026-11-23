# SP4-CME-E30 request v1 — Curvature-value principal coefficients

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Authorized Sol6.2/ultra; lead actual settings unavailable. Own notes/30_CURVATURE_COEFFICIENT_REGION_20261122.md and research-progress/handoffs/SP4-CME-E30_RETURN_v1.md only. No shared edits or chat capture.

For E27's fixed-vertical-adjoint operator on a compact smooth definite reference Abar, test whether in fixed smooth coordinates/trivialization it can be written
A_t=P^{ij}(x,A,F_A) partial_i partial_j A + B^i(x,A,F_A) partial_i A + C(x,A,F_A),
where all dependence on Abar and finitely many of its derivatives is fixed in x, and P does not depend on the symmetric part of the first jet of A. Matrix-valued coefficients act on the twelve connection components. If this form fails, identify the exact term and minimum extra jet dependency. Derive it from the physical Bianchi expression and beta=d_Aa=F_A−F_Abar+[a wedge a]/2, keeping the current-metric codifferential on beta. In particular metric derivatives are DG(F)partial F, linear in second derivatives of A plus coefficients times first derivatives of A. Do not assert an explicit numerical constant unnecessarily.

If the representation holds, prove that a small C0 difference of both A and F from Abar,Fbar on the fixed base suffices for the principal quadratic symbol to retain a uniform gap, even without a small whole C1 difference. Check which of these coefficient bounds are supplied by E24's uniform continuous endpoint limits when reference is chosen late. Carefully distinguish fixed-reference algebraic constants, variation of g_Abar and its derivatives, and the need for reference uniformity if t0 approaches endpoint. Identify whether continuity/modulus of the principal coefficients follows for the given unadjusted fields, while noting the corrected adjusted trajectory and reverse gauge are different unknowns. No parabolic regularity, existence-time or continuation claim is authorized from this representation alone.

Finite scope one exact coefficient inventory and its algebraic parabolic consequence, with a clear missing-dependency list.

## Frozen inputs

- `brainstorm/notes/B25_CURVATURE_COEFFICIENT_REGION_20261122.md` SHA-256 `a71a2c27d89c85f8329c58ed63757c9ce41db28eaec8eb39d1d08fbb20d59b61`
- `notes/27_FIXED_ADJOINT_GAUGE_TEST_20261122.md` SHA-256 `755dbe5d1956bdc895f8da2214e9d6e0e9aa405d28f87958373a7d4c59fb1590`
- `notes/24_TEMPORAL_BOOTSTRAP_20261122.md` SHA-256 `99e7fe2a042f8195d310f85a38744f5e6bb76cf47221d948419a3236aff6fc44`
