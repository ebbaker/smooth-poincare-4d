# SP4-CME-E187 request v1 — Exact stationary-kernel quadratic tests

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Bounded E algebra/computation under B92, configured gpt-6.2-sol/ultra. Lead settings and independent runtime attestation unavailable. Sole status: [REGISTER](../REGISTER.md).

Execute B92's seven-case test only. Own notes/187_STATIONARY_KERNEL_QUADRATIC_TEST_20261122.md, numerics/e187_stationary_kernel.py, numerics/e187_stationary_kernel_results.json and research-progress/handoffs/SP4-CME-E187_RETURN_v1.md. No shared edits, source search, subdelegation, manuscripts or unrelated experiments. Use a short deterministic rational-arithmetic script, exact outputs and transparent human-readable derivation. Disclose inherited work and stop after the finite test or a concrete obstruction needing a new B decision.

Work at one oriented Euclidean real four-point, positive Riemannian signature, bracket [e_i,e_j]=epsilon_ijk e_k, K=1 and Sigma_1=dx14+dx23, Sigma_2=dx24+dx31, Sigma_3=dx34+dx12, as in E07/E05. Preserve these older conventions. Q_t=3 diag(1,1,t²)/(2+t²), t in {1/8,1/4,1/2,1,2,4,8}, S=sqrt(Q_t), F=−S Sigma, q=Q−I. The variable is X=(X_a) in T* tensor Sym_0(R3), dimension20.

Solve D_a S from S D_a S+(D_a S)S=X_a. Recover the three one-forms b via C^{-1}=(C+I)/2 from C_ij=epsilon_ijk J_k, J_k alpha=*(alpha wedge Sigma_k), and *T_i=−sum_j J_j (S^{-1}D S)_ij. Verify C²=2I−C and the Bianchi compatibility equation exactly; do not substitute an arbitrary b. Set Xi_a=2[D_a S,S]+4S ad(b_a)S and L_Q X=2(QX+XQ)−4 tr(QX)Q/3. Form the real quadratic R(X)=sum_a <X_a,L_Q X_a>−<q,[X_a,Xi_a]>.

Impose the actual zero-speed constraint V_i,b=4 sum_a,k (X_a−tr(QX_a)I/3)_ik F_k,ab=0. Remove any common nonzero square-root scalar before exact rational nullspace calculations. Compute the rank, kernel dimension, and inertia or exact positivity/negativity certificate of R restricted to this kernel at each of the seven t. Record nullspace convention and rational witnesses in the original X coordinates when negative. If semidefinite, identify the nullity; if positive, supply a finite exact certificate (for example LDL/congruence with rational pivot signs). The unconstrained form can be computed as a cross-check but is not the target. Round checks: R=4 sum|X|² and the E07 kernel tensor satisfies the constraint. Verify symmetry, constraint residuals and reconstruction residuals exactly.

At most seven spectral values and these algebraic checks; no continuum sign claim or full symbolic eigenfamily search. Explain the implication for the proposed integrated stationary-gap route only. Do not claim that a negative abstract derivative array is realized by a critical connection or a flow, and do not infer a stationary gap from a finite grid. New assumptions or conceptual choices return to B92. Verify hashes and links and return exact output identities.

## Frozen inputs

| Input | SHA-256 |
| --- | --- |
| [E05](../../notes/07_PINCHED_ENERGY_GAP_20261122.md) | cbb2f95b2961cb1772014e311ec9b759af88ebd0f739a6d0556c6a0fe3d8d3bb |
| [E04–E07 assessment](../../reviews/E04_E07_ESTIMATES_ASSESSMENT_20261122.md) | 1ba3564c2f05a9efb796d0c7c0f8d6e75fb04b611610e6611615d98139f2cd1c |
| [E07](../../notes/09_DISSIPATION_KERNEL_20261122.md) | dba99850da0f4ed3f56a46c3c8753d3cf69c0d3505ef97976523a907baf17ab9 |

[B92 decision](../../brainstorm/notes/B92_STATIONARY_COERCIVITY_ALGEBRA_20261122.md). E01A's compatibility subsection and E02A are inherited dependencies; record their actual hashes before use.
