# E116/E117 — Lorentz scale counting and the existing endpoint upper bound

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. The selected lead read the complete derivation and audit and recomputed the layer factor, threshold bands and operator match. Actual lead identifiers unavailable; helpers configured gpt-6.2-sol/ultra without independent runtime attestation.

Accepted. [E116](../notes/116_ROUND_ANNULAR_LORENTZ_NORMS_20261122.md), SHA-256 bba74ee73fc53fd7707d4489d6b9f1dbe67957fb9517f972bfba584522a1327c, extends its author's E112 construction. [E117](E117_ROUND_LORENTZ_NORMS_AUDIT_20261122.md), SHA-256 60f42944e9fb00cbb7ff33cb007ab97fcb60b9f93b32867d7f4462f1684d348b, did not author E116/E112, but authored E22/E47 and the related E15, and audited E112. Its independent calculation checks the new annular norm statement; comparison with E22 is not a fresh independent proof audit of that inherited theorem.

The actual atom strain equals f'(rho/r) d rho tensor M /r plus O(r). A fixed positive-measure subannulus has |f'| bounded below. Shrinking the fixed upper scale before N gives lower amplitude L/r and upper U/r, with volumes comparable to r^4. Disjoint annuli yield strict distribution sandwiches. The rearrangement norm satisfies exactly
||g||_(4,q)^q = 4 integral lambda^(q−1) mu_g(lambda)^(q/4) d lambda
for finite q, and the weak norm is sup lambda mu_g(lambda)^(1/4). This agrees with ordinary L4 at q=4 and the repository's factor-four Lorentz convention at q=1. Upper bands between adjacent U delta/r_k and separated lower bands [L delta/(4r_k), L delta/(2r_k)] give
||T_N(0)||_(4,q) comparable to delta_N N^(1/q),
with weak norm comparable to delta_N. Constants are independent of N; q is fixed.

Combining with E112's derivative integral I_N >= c delta_N N excludes a uniform linear round estimate for every Lorentz index q>1, including infinity. At q=1 the existing assessed E22 theorem supplies the missing upper estimate. Differentiating the normalized defect equation gives precisely E22's rank-twenty strain operator, including the Ricci term −12K T and the doubled internal curvature action. Its reaction eigenvalues are −52K and −12K. Native rescaling preserves the Lorentz norm and the derivative time integral. E22's proof bounds the derivative integral linearly, separately from the quadratic squared-strain term. Hence I_N is comparable to ||T_N(0)||_(4,1), both of order sqrt(N).

E116's statement that its calculation leaves an upper bound open is a limitation of that calculation alone. It does not supersede E22's already established fixed-round upper estimate. The full J_lin still has only the separate square-term upper bound of order N from this comparison, with no matching full-budget order asserted. No nonlinear trajectory conclusion or new source inspection is introduced here.

