# SP4-CME-E36 request v1 — coupled A,F system and smooth constraint propagation

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Configured helper gpt-6.2-sol / ultra; actual lead settings unavailable. Own notes/36_COUPLED_CURVATURE_SYSTEM_20261122.md and research-progress/handoffs/SP4-CME-E36_RETURN_v1.md only. No shared edits.

Use smooth compact closed oriented real four-manifold and oriented SO(3) bundle, Fine native metric/internal pairing/time as in E34. Fix smooth definite bar A and bar F=F_barA. Unknowns A and independent definite E-valued two-form F of the positive round-compatible component, with g=g(F), Q=Q(F), B(F)=4Q−(2/3)tr(Q²)I, S_F(u)=i_u F. Put a=A−bar A, beta=F−bar F+[a wedge a]/2, C=F−F_A, phi=d_A^{*gbar}a. The proposed extension is
W(A,F)=*_g((d_A B(F)) wedge F)−S_F S_F* d_A^{*g} beta,
A_t=W−d_A phi+d_A^{*g} C,
F_t=d_A W−[F,phi]−lambda d_A^{*g}d_A F,
with fixed lambda>0 large as in E34. Every adjoint except phi uses live g(F).

Verify: (1) this is a genuine second-order quasilinear system on the pair in fixed smooth coordinates, with principal coefficients depending only on x,A,F and fixed background values; lower terms may include background derivatives and be quadratic in first derivatives. List any hidden term that invalidates this. (2) At reference a=0,F=bar F,beta=C=0, compute the ordinary second-order Fourier symbol on independent amplitudes (b,f). It should be block diagonal with A block −(w1*w1+w0w0*) and F block −mathbb B from E34, no second-order cross blocks. Check physical self-duality extension and all variations of the live metric. Use one reference direct-sum pairing and show uniform strong parabolicity on a C0 value neighborhood by continuity. Track compact definite value uniformity and limits of changing pairings; do not assert derivative-independent lower-order bounds. (3) For every supplied smooth solution pair derive exactly C_t=−[C,phi]−lambda d_A^{*g}d_A C−d_A d_A^{*g} C, using d_A F=d_A C. Prove zero constraint persists on its smooth interval by the moving-metric L2 energy, including volume/norm time derivatives. No integration-by-parts boundary on closed base. (4) With C=0 recover precisely E27's fixed-adjoint adjusted connection flow; Bianchi completion vanishes. State what equivalence has and has not been shown.

Finite scope: exact operator and principal derivative inventory, frozen symbol and smooth constraint energy only. Do not claim rough-data existence, a new global theorem, automorphism endpoint estimates, or regularity/continuation from C0 control. Do not import a general PDE theorem without verifying its hypotheses; existence theory is outside this packet. If the suggested system fails, exhibit the exact offending term and return to lead rather than changing the strategy. Check frozen hashes and provenance.

## Frozen inputs

- `brainstorm/notes/B29_COUPLED_CURVATURE_SYSTEM_20261122.md` SHA-256 `87fa12235a2d89bf3086201664d1a6e2bd90956347023ae42e56157abcfa0bcb`
- `notes/34_CURVATURE_BIANCHI_SYMBOL_20261122.md` SHA-256 `d74fde2a534598c013c184dadb40d6ac8a1574e59ab01ff2edbdfdc817d9c037`
- `notes/27_FIXED_ADJOINT_GAUGE_TEST_20261122.md` SHA-256 `755dbe5d1956bdc895f8da2214e9d6e0e9aa405d28f87958373a7d4c59fb1590`
- `notes/30_CURVATURE_COEFFICIENT_REGION_20261122.md` SHA-256 `426b99a3e5cda892f192fc43a4e4efd8736bd44d11695daa3e44bef559fcf1cd`
