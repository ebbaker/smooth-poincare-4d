# Request for formal statements of the pole-form frame

27 November 2026. Prepared for Edward B. Baker III by the Codex lead, on the working tree based on 6a422ce. For the formalization lead and investigation 05, under the [formalization workflow](../../../../../formalization/FORMALIZATION_SETUP_WORKFLOW.md). This requests declarations for a future owner-authorized edition. The [sole register](../REGISTER.md) and its independent reviews specify evidence levels. No project declaration, build, or axiom check is claimed for this frame.

All occurrences of $M$ in the frame mean a closed connected oriented smooth Riemannian four-manifold homotopy equivalent to $S^4$, $c$ a smooth conformal class and $p\in M$. The growth space includes the zero form. The fixed orientation is used throughout, including on the punctured end.

| Proposed statement | Dependencies and acceptance check |
| --- | --- |
| A1, solution space and expansion | Define the actual space of smooth closed self-dual forms on $M\setminus p$ with $|\omega|_g=O(\rho^{-4})$. Construct a linear equivalence from $\Lambda^-_p$ in a chosen metric scale, via the Cartesian expansion $\omega=I^*\eta+O_\infty(\rho^{-2})$. Include exhaustion, sharp remainder, orientation and scale transport. Keep the coefficient space divided by volume density for the intrinsic statement. [E01](../../notes/E01_A1.md) |
| Transfer kernel | With volume in the source and the graph $d^-A\mapsto d^+A$, kernel $K_g=2P_g/\pi^2$. Include the delta contact in the closed extension, orientation-reversed adjoint and covariant scale factor. [B01](../../brainstorm/notes/B01_KERNEL.md) |
| A2, conditional recognition | From $\omega\in\mathcal H_p(c)$ nowhere zero, conclude a diffeomorphism $M\simeq S^4$. Permit the cutoff to change the form on the end; the resulting identification agrees with a similarity of the specified inverted coordinates sufficiently far out. Require Gromov's relative extension with its compact sphere-pair hypotheses. [E02](../../notes/E02_A2.md) · [Exact import](../../references/A2_ORIGINAL.md) |
| Fixed-end realization | For a closed near-symplectic form equal to $\beta$ on a specified smooth inverted end, record the unchanged-form equivalence, the role of the positive intrinsic derivative image, and the separate distant modification. [E04](../../notes/E04_REALIZATION.md) |
| Openness | $C^\infty$ quotient topology via fixed-volume representatives, moving marked point and nonzero coefficient. Uniform sup bound at infinity and compact-core positivity. [B02](../../brainstorm/notes/B02_OPENNESS.md) |
| Pointwise algebra and family | [Exact statements](TO_05_ALGEBRA_20261127.md). Include the singular equality case and both smooth poles. |
| Evaluation chart | Normalized linear evaluation gives a full sphere diffeomorphism exactly at rank three; a full definite fibre is conformal exactly when its Gram matrix is scalar in an orthonormal source basis. [E05](../../notes/E05_DRAFTS.md) |

Use the [primary bibliography packet](TO_05_BIBLIOGRAPHY_20261127.md) to establish the import ledger before a formal proof. Keep the universal zero-free assertion as the open quantifier, separate from A1 and A2.

**Additional converse target, SP4-POLE-E06.** On standard $S^4$ there exist $c,p,\eta\ne0$ such that the marked form has a zero and its derivative there has rank less than three. Acceptance requires one common compactification, a fixed nonzero coefficient, the uniform exterior bound on the metric path, and the one-sided implicit function argument. [Working statement and source](../../reviews/E04_REPLAY.md) · [Non-author replay](../../reviews/E06_REPLAY.md).
