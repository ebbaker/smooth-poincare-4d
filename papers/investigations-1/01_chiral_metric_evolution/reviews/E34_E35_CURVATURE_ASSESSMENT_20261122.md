# E34–E35 — Curvature symbol and scalar divergence checks

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Selected lead settings preserved; actual model/effort unavailable. Configured helpers gpt-6.2-sol / ultra. Lead assessment of explicit derivations, without novelty or external-review certification.

E34 is accepted at its frozen definite reference. The physical variation obeys delta Q=2 D_Q L(f), delta B=4 D_Q* delta Q and (delta B)F=P*P f in the native pairing. Differentiation gives the displayed curvature symbol. The vertical gauge differentiates to a curvature bracket with its scalar generator and has no second-order curvature symbol. At a unit covector, wedge/contraction split the full eighteen-dimensional curvature space into two nine-dimensional summands. On the closed-symbol part, the exact-sequence kernel and its two adjoint constraints force positivity. The cross block is bounded by M|x||y|, so the proposed lambda bound gives a Hermitian gap d/2. The native weight must be retained when comparing fixed norms. This calculation by itself does not propagate curvature compatibility; B29/E36 address that separate issue.

E35 is accepted with all proposed signs and conservative constants unchanged. The scalar trace gives s=4K tr S+2 div V+<[b wedge b],Sigma>, globally and frame invariantly. Parallelness of Sigma transfers the derivative of b to a divergence. Ordinary two-form counting gives |V|<=sqrt(3)|b| and a quadratic bracket bound 2 sqrt(3)|b|²; the already checked |b|<=2 sqrt(3)|T| needs no eigenvalue floor. Since trS>=sqrt(3), integrating against u², applying 24xy<=3x²+48y², and using the supplied Sobolev constant yields Y>=3/C_S−(48+24 sqrt(3))||T||4². This is positive if ||T||4²<1/((16+8 sqrt(3))C_S). The critical norm and constant are scale invariant. Neither a small q hypothesis nor a homotopy-sphere assumption is used. The result supplies only positive Yamabe constant, not the Weyl-energy part of sphere recognition or any persistence theorem.

## Assessed inputs

- `notes/34_CURVATURE_BIANCHI_SYMBOL_20261122.md` SHA-256 `d74fde2a534598c013c184dadb40d6ac8a1574e59ab01ff2edbdfdc817d9c037`
- `notes/35_CRITICAL_STRAIN_YAMABE_20261122.md` SHA-256 `4dfeb6dd4a6395e21a0f37716eb142d46cbdbf04866649a889e80fe22efbddbf`
