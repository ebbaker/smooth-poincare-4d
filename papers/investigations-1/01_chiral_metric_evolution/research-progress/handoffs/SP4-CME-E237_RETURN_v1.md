# SP4-CME-E237 return v1 — All-ratio local jet and manuscript precision audit

23 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Bounded E audit configured gpt-6.2-sol / ultra. Independent runtime and selected lead settings are unavailable. I authored the earlier E217, E221 and E234 audits and used the assessed E235/E236 inputs for this source integration check. [Detailed audit](../../reviews/E237_ALL_RATIO_MANUSCRIPT_AUDIT_20261123.md)

## Disposition

Mathematical pass with one source-attribution repair. The gradient, trace-free level-set direction and \(\mu_r\) coefficient check for every finite \(r>1\). The generic Hessian identities in the earlier proof apply to the new cubic connection with positive \(s_i\), trace three and trace-free symmetric \(U\). The connection has the asserted negative scalar Hessian and a whole strictly pinched local ball, with radius chosen for the particular \(r\). The actual old quotient derivative is \(4\mathscr L_{Q_r}B-24dq\), giving old log-ratio derivative \(1\). Native scaling gives \(1/2\) for \(\log\rho\) and \(r/2\) for \(\rho\). The separate \(9/4\) example and scope limits are intact.

At frozen lines 10628–10629, replace the reference to a “direct differentiated velocity calculation in the preceding proof” with “Applying the exact identity `\eqref{flow:nonlinear-Q}` to this tangent, with \(\nabla^AQ(0)=0\) and \(\Delta_AQ(0)=4B\), gives”. The preceding proof invokes that local identity and credits the separate direct calculation outside its proof. The review verifies the identity at the new datum both from its pointwise proof and by the generic velocity contraction. An optional precision at 10602–10603 is to name the symmetry and trace of \(U\) in the reuse of the curvature-jet formula.

All four E234 precisions and both E226 source typography changes are present. The abstract trim preserves the small-density and bounded late-sequence hypotheses and conclusions. The new local result gives no produced flow or global preservation counterexample. The existing Fine-gradient source scope is unchanged. The additional R15 consumer entry requested by E235/E236 is lead-owned.

## Integrity and release

All five frozen inputs matched. The protected round section is 4501 bytes, SHA-256 c0e411175c77e13e96aa8ab41f55e2c2593f30e72a5c44560e1baf65068a3fab. The active TeX has 395 unique labels, 542 resolved references and 95 citation-key uses covering 40 canonical entries in first-use order. No independent build, render, source retrieval or certificate replay entered this audit.

- [Request v1](SP4-CME-E237_REQUEST_v1.md) SHA-256 bfb0fadee73d4ede55376ea200c655df8ec6981423c0ad19990c2f5aaa325d1f.
- [Frozen manuscript](../../manuscript/chiral_curvature_and_metric_evolution.tex) SHA-256 586fa9231979f1c8bdb18bf3c9eb5ebfccd8533662a596e3134b80502536e962.
- [Detailed review](../../reviews/E237_ALL_RATIO_MANUSCRIPT_AUDIT_20261123.md) SHA-256 1990c0e27675802d6cd698790c6317f5944cc0867abb1fa93faa62033cd175ef.

Only the two assigned records were written. The frozen source is released for the located repair.
