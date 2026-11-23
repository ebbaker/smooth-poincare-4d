# SP4-CME-E35 request v1 — scalar trace and critical strain Yamabe bound

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Authorized helper gpt-6.2-sol / ultra; actual lead settings unavailable. Own only notes/35_CRITICAL_STRAIN_YAMABE_20261122.md and research-progress/handoffs/SP4-CME-E35_RETURN_v1.md. No shared edits.

On a smooth closed oriented real Riemannian four-manifold, supplied smooth round-positive definite SO(3) connection, use manuscript pairing delta=-2tr_SU2, bracket epsilon, Q>0, trQ=3, S=sqrt Q, F_A=−KS Sigma, Sigma_i wedge Sigma_j=2 delta_ij dV, K>0, g=ghat. Let Gamma+ be the chiral Levi-Civita connection transported to E by the normalized curvature frame, and b=A−Gamma+. E09 gives |b|<=2 sqrt(3)|T| without a lower eigenvalue assumption. Check the exact curvature relation F_Gamma=F_A−d_Gamma b−[b wedge b]/2, and the scalar trace s=−2 sum_i <F_Gamma,i,Sigma_i>. Derive the divergence identity suggested in B28, retaining all factors and signs. Prove or correct the safe algebraic estimates |V|<=sqrt(3)|b| and |sum_i<[b wedge b]_i,Sigma_i>|<=2 sqrt(3)|b|² using ordinary form norms; exact optimal constants are unnecessary.

Assume scalar Sobolev ||u||4²<=C_S(integral |du|²+K integral u²). Integrate the scalar identity against u², use trS>=sqrt(3), and derive a fully explicit positive Yamabe sufficient condition from ||T||4². Proposed estimate: Y(M,[g])>=3/C_S−(48+24 sqrt(3))||T||4², with no small q or eigenvalue floor. Check every step, allow corrected safe constants if proposal fails. Clarify bundle/frame invariance, compact integration, zeros of test functions and norm conventions. Check scale invariance. End with precise limitations: positive Yamabe only, no full Weyl control/sphere recognition or flow persistence. Do not add a new classification claim.

Finite scope: one scalar identity and its integrated estimate. If the proposed mechanism fails, exhibit the exact missing term and return it to the lead; do not replace it with a new strategy. Record actual model metadata and inspect relevant source hypotheses if any external theorem beyond the conformal quotient is imported.

## Frozen inputs

- `brainstorm/notes/B28_CRITICAL_STRAIN_YAMABE_20261122.md` SHA-256 `c60ac2dd2d350f77877611fbfa05f4875ee9c1b9f5180d9535415e423a0bccab`
- `notes/11_TRANSPORT_CURVATURE_COMPARISON_20261122.md` SHA-256 `c5e66058a3c73e13d6582a5f84c3e297080c67ae2ee6458c0a8bf5ac30e266ae`
- `notes/31_L2_TRANSPORT_SPHERE_CRITERION_20261122.md` SHA-256 `bee7184d0bc257b4d173e105e75e25bd74349776d103c55db9777bcacb3451c8`
