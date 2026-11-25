# Continuation after annular energy and the conservation law

24 November 2026, America/New_York. For Edward B. Baker III with LLM assistance: Claude Fable 5.2 (`claude-fable-5-2`), Claude Cowork, reasoning effort max as configured. This session acted as lead; no helper was available, and the lead executed E59–E61 itself after freezing each request. No second reader has checked the proofs. Astra/ultra remains the lead recommendation and gpt-6.2-sol/ultra the E recommendation, subject to the author's selection. [Assessment](../reviews/SEC_ANNULAR_ENERGY_AND_CONSERVATION_20261124.md) · [Preceding handoff](04_AFTER_SUBCRITICAL_BACH_CONCENTRATION_20261124.md) · [Owning register](../research-progress/REGISTER.md)

## Where things stand

The fixed-margin question is unchanged: on a homotopy four-sphere with positive Yamabe constant and \(4\pi^2\le E_+\le8\pi^2-\delta\), can the total Bach norm \(\mathfrak B\) tend to zero? The results of the preceding handoff stand. Three statements about necks are new. Norms: \(|W|^2\) is the full four-index norm, \(8E_+\) in total on a homotopy sphere.

- **One chart.** If \(g=\delta+v\) on \(\{r/2<|x|<2R\}\) with \(\varepsilon=\sup|v|\) small, then \(\int_{r\le|x|\le R}|W|^2\le C\varepsilon[\mathfrak B+(K+\varepsilon)(1+\varepsilon K)]\), \(K=\|D^2v\|_{L^2}\), and \(\le C(\varepsilon\mathfrak B+\varepsilon^2)\) if \(v\) is divergence free and trace free. No constant depends on \(R/r\). Cones attain \(\varepsilon\mathfrak B\) at every length. [E59](../notes/SEC_E59_20261124.md)
- **Linear model.** At the flat cone the linearized Bach equation has no homogeneous solution with nonzero Weyl tensor for exponents between \(-2\) and \(2\). For compactly supported perturbations, \(\|h^{TT}\|_\infty\le\|B'(h)\|_{L^1}/(2\pi^2)\) and \(\int|W'(h)|^2\le\|B'(h)\|_{L^1}^2/\pi^2\). The logarithmic field \(H\log|x|\) is a cone in a sheared chart. In divergence-free trace-free gauge a cone keeps five ninths of that logarithm. [E60](../notes/SEC_E60_20261124.md)
- **Conservation law.** For every metric and vector field \(X\), \(\oint|W|^2g(X,\nu)=-8\oint B(X,\nu)+\oint g(\mathfrak b(W;L_Xg),\nu)\) on every compact two-sided hypersurface. A neck with a nearly conformal Killing field carries at most \(8\Lambda\mathfrak B\) plus a multiple of the defect, for any cross-section. Bach-flat cones are conformally flat. [E61](../notes/SEC_E61_20261124.md)

What is missing is the same in all three: the object that the estimate assumes. A chart with small \(\varepsilon\), or a vector field with small conformal Killing defect, has to come from a bound on the Bach tensor in \(L^1\) and on the curvature in \(L^2\), and no pointwise regularity is available at that level.

One calibration. A non-round positive Einstein metric on \(S^4\) would be a closed Bach-flat positive class with \(\tfrac{16}3\pi^2<E_+<8\pi^2\), by Gursky's gap theorem as quoted in the literature. A positive lower bound for \(\mathfrak B/E_+\) on the band, for every \(\delta\), would therefore include the uniqueness of the positive Einstein metric on \(S^4\), which is open. The assessment gives the derivation and the source level.

## Next task: SEC-B36

Decide how to obtain the neck control, or whether to change the target. Candidates, with what each would settle.

1. *A nonlinear form of the divergence-free condition.* The linear bound of E60 uses that \(B'(h)\) is divergence free for the flat metric. \(B_g\) is divergence free for \(g\), and the usable form of that fact is \(\operatorname{div}_g(B(X,\cdot)^\sharp)=\tfrac12\langle B,L_Xg\rangle\) from E61, applied to the conformal Killing fields of the flat model. The cleanest statement to aim at: for smooth compactly supported divergence-free trace-free \(v\) on \(\mathbb R^4\) with \(\sup|v|\le\varepsilon_0\), is \(\sup|v|\le C\int|B_{\delta+v}|dV\)? With E59 it would give \(\int|W|^2\le C\mathfrak B^2\) in that class. The linear statement is Corollary 6 of E60. The obstruction named there is the quasilinear term \(v*D^4v\), whose \(L^1\) norm is not controlled by \(\|\Delta^2v\|_{L^1}\).
2. *The dyadic linear theory.* Prove for the linearized equation on a long annulus that the sum over dyadic annuli of the \(L^2\) norms of \(W'\) is at most a constant times the end data plus \(\|B'\|_{L^1}\). This needs completeness of the homogeneous solutions modulo the kernel of \(W'\), or a three-annulus inequality, and the local form of the \(L^1\) bound. It is certainly decidable and it is the template for a nonlinear neck theorem. By itself it gives nothing nonlinear.
3. *The Lorentz scale.* Check the deduction \(\|D^2h^{TT}\|_{L^{2,1}}\le C\|B'(h)\|_{L^1}\) from Theorem 1.1 of Hernandez–Spector against the paper, and decide whether a bootstrap in \(W^{2,(2,1)}\) closes once candidate 1 supplies the cancellation. This is a source-hypothesis check followed by a short estimate.
4. *The target.* In view of the Einstein calibration, decide whether to restrict the band to energies below \(\tfrac{16}3\pi^2\), where no known open problem is contained in the lower bound, or to aim at an energy identity for sequences with \(\mathfrak B\to0\) in place of a lower bound for the ratio. This is conceptual and partly the author's decision.
5. *A second reader.* E59 is short and carries the other two. An independent proof check of E59, and of Lemma 1 and Theorem 3 of E61, by a helper that did not write them would raise the evidence level of the whole milestone at small cost.

Recommended order: 5 in parallel with 1. For 1 the first bounded test is below.

## Proposed first test for SEC-E62

Not issued. B36 fixes the statement.

*Second-order structure of the Bach tensor in divergence-free trace-free gauge.* Write \(B_{\delta+v}=-\tfrac14\Delta^2v+N_2(v,v)+O(v^3)\) for divergence-free trace-free \(v\). (i) Compute \(N_2\) explicitly and isolate its part with four derivatives on one factor. (ii) Decide whether that part can be written as a bounded multiple of \(B'(v)\) or of \(B_g\), plus second derivatives of \(v*D^2v\), plus first derivatives of \(Dv*D^2v\), plus terms bounded in \(L^1\) by \(\|D^2v\|_{L^2}^2\); use the identity for \(\operatorname{div}_g B(X,\cdot)\) with \(X\) a translation, a rotation and the dilation. (iii) If it can, state the resulting a priori inequality for \(\sup|v|\) with its hypotheses. If it cannot, give the term and test it on a wave packet and on the cone \(\delta+c\,s_H\) in that gauge, where every quantity is known from E60. Completion: the decomposition or the obstructing term. Escalation: B36.

| Task | Routing and readiness | Output |
| --- | --- | --- |
| SEC-B36 | Selected lead; ready. Candidate 4 is partly the author's decision. | One decision note with the chosen route and a frozen first test. |
| SEC-E62 | gpt-6.2-sol/ultra recommended; reserved until B36 fixes the statement. | The decomposition of the quadratic Bach term or the obstructing term, with the stated tests. |
| Independent check | gpt-6.2-sol/ultra recommended; may be issued by B36 as a separate E task with the next unused identifier. | A proof reading of E59 and of the two identities of E61. |
| Manuscript | Done on 25 November 2026 at the author's request, by the same session running Claude Opus 5.5 (`claude-opus-5-5`). | Section 14 and the revised Section 15 of the [manuscript](../manuscript/twistor_sections_and_chiral_weyl_curvature.tex); see the [draft history](../DRAFT_HISTORY.md). |

Unchanged from earlier handoffs: the existence of a positive starting class on an arbitrary homotopy four-sphere, the upper bound on the cost of lifting the radial direction, and the pause on the separate chiral metric evolution investigation.

## Pasteable continuation

> Continue the sections-and-connections research from 05_AFTER_ANNULAR_ENERGY_AND_CONSERVATION_20261124.md. Read AGENTS.md, the workflow documents, the sole SEC register, the assessment reviews/SEC_ANNULAR_ENERGY_AND_CONSERVATION_20261124.md, the notes E59–E61 and the numerics record. Begin SEC-B36: choose between a nonlinear form of the divergence-free condition, the dyadic linear theory, the Lorentz-scale check, and a change of target in view of the Einstein calibration; consider issuing an independent proof check of E59 and of the E61 identities first. Treat the chart of E59 and the vector field of E61 as hypotheses until a packet derives them. Keep the linear results of E60 labelled as linear. Use the author's selected lead; register and freeze every bounded E task before execution and record the model that actually ran it. Maintain the shared ownership and authentic chat-history rules, preserve the CME pause, and leave the manuscript to the author unless asked.

Assessment SHA-256 at handoff: `ab23a183e1b0b49987a7d24816ef06b124971c73627dbdf4d19a45a49a1e8ffb`.
