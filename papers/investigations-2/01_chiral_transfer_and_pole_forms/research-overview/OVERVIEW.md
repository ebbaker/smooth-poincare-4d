# Research overview — Chiral transfer and pole forms

27 November 2026, America/New_York. Prepared for Edward B. Baker III by Claude (Anthropic), model `claude-fable-5-2`, reasoning effort at the session's configured maximum, in a Cowork session. Setup baseline `b607bd1`. An investigation of the [second series](../../README.md). The [register](../research-progress/REGISTER.md) alone owns live status.

## Reading the setup and the returns

The original objectives and setup evidence are retained below. The handle-atlas section gives the follow-on question prompted by the branch manuscript. For research after activation, see the [register](../research-progress/REGISTER.md), [A1 proof](../notes/E01_A1.md), [recognition proof](../notes/E02_A2.md) and [normalization](../brainstorm/notes/B01_KERNEL.md). The [marked-end theorem](../notes/E04_REALIZATION.md) specifies the hypotheses needed to identify near-symplectic forms with pole forms. The [primary-source record](../references/README.md) distinguishes the historical pointers from the inspected passages.

## Objective

Do the pole forms exist on every conformal class of a homotopy four-sphere, with the stated leading term, and does a pole form without zeros identify the sphere with $S^4$?

Write the two propositions of the frame in full, have each replayed by a reader who did not write it, fix the kernel of the transform and its normalization for the whole series, and put the pointwise algebra and the first explicit family in a form the formal side can take.

## Setting

The category, orientation, norms, the puncture and the vocabulary of pole forms are those of the [second master's overview](../../../master-2/research-overview/OVERVIEW.md#fixed-setting-and-conventions). This investigation adds the following. On $X=M\setminus p$ with the metric $g'=|y|^{-4}g$ near $p$, $W^{k,2}_\delta$ is the weighted Sobolev space in which weight $\delta$ means decay $O(r^\delta)$. The operator is $D=d^*\oplus d^-$ from one-forms to functions and anti-self-dual forms; it lowers the weight by one. A constant self-dual form in the chart $x$ is written $\omega^0$ and its linear primitive $A^0$.

## Evidence inherited at setup

- **A1** (existence, dimension three, leading term). Section 3.2 of the [proposing note](../../../master/brainstorm/notes/claude/ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127.md). A proof sketch of one session, not read by anyone else. It rests on four assertions that the sketch states without detail: $g'$ is asymptotically Euclidean of order two; the exceptional weights of $D$ on flat space in $[-3,0]$ are $-3$ and $0$; the kernel vanishes for weights in $(-3,0)$; the cokernel vanishes because $b_2(M)=0$.
- **A2** (recognition). Section 3.3 of the note. A proof sketch. Its import is McDuff and Salamon's Theorem 9.4.2, read as quoted in two later papers; the book was not opened.
- **Pointwise identities and the family $c_\varepsilon$.** `check_06` of the note's [checks](../../../master/brainstorm/notes/claude/ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127_checks/README.md): 21 symbolic and numerical tests, including the pull-back of constant forms under inversion and the energies of the family.
- **Identification with near-symplectic forms.** Section 3.4 of the note; derived from A1 and a local construction that was not written out.
- **The strict-chart obstruction.** The proposition of the [obstruction note](../../../initial-investigations/01_generalized_isothermal_coordinates/notes/RESEARCH_OBSTRUCTIONS_2026-11-20.md), a direct deduction for one definition of chart in the holomorphic setting. It is background and is not used in any proof here.
- **The operator in the literature.** Donaldson and Sullivan; Iwaniec and Martin. Cited from memory; neither was opened.

## Global extensions requested at setup

The count of exceptional weights is a computation on flat $\mathbb R^4$; the Fredholm statement on $X$ needs the weighted theory for asymptotically Euclidean metrics, read in a primary source. The order of the remainder in the leading term depends on the order to which $g'$ is Euclidean, which normal coordinates give as two. The cut-off in A2 needs a quantitative bound. A2 needs the clause of the imported theorem on agreement with the given chart near infinity, and the smooth structure of $M$ at $p$ must be matched with that of $S^4$ at infinity. The conformal weight of the leading coefficient is not fixed. Nothing is known yet about the dependence of the pole forms on $c$ and $p$.

The comparison with the drafts M2 and M3 concerns complex and neutral-signature constructions. Their charts are holomorphic and live on the correspondence space of a complex four-manifold. The chart here is real, exists in Riemannian signature on $X\times S^2$ off the zero sets, and is linear on each fibre. No statement of the drafts is assumed to carry over; POLE-E05 records which do.

## The handle-atlas strategy

**Replayed project theorem.** Fix a smooth representative $g$ of $c$, a pole $p$, and the normalized solution map $L_q=P_g(q,p)$, so $L_qu=\omega_u(q)$ for $u\in\Lambda^-_p$. In the asymptotically Euclidean metric $h$ of A1, the end estimate gives a compact core $C$ outside which $|L_qu|_h\ge 1/2$ for every $g(p)$-unit $u$. For a finite cover of $C$ by compact chart pieces $C_j$, define
\[
  m_j(u)=\min_{q\in C_j}|L_qu|_h,\qquad
  \mu(c,p)=\max_{|u|_{g(p)}=1}\min_j m_j(u).
\]
Here the numerical margin uses the chosen core and representative. Its strict positivity is equivalent to existence of a zero-free member at $(c,p)$. The equivalent projective test asks whether $\bigcup_{q\in C}\mathbb P(\ker L_q)$ omits a point of $\mathbb P(\Lambda^-_p)$. Different estimates can be used on different pieces. Their positive margins must hold for one common coefficient. [Manuscript §6](../manuscript/chiral_transfer_and_pole_forms.tex) · [Independent reading](../reviews/MANUSCRIPT_READING_20261127.md)

**Proposed construction.** A handle presentation gives charts on the given smoothing. Its attaching embeddings and framings determine the collar transitions. Balanced handle counts alone give no estimate on $L_q$. Begin with the native four-dimensional boundary of the marked minus Miller–Schupp thickening. Take the signed collar across each attaching map, retain both inverse maps and the entire exterior, and restrict the charts to compact pieces. Choose one smooth metric, pole and normalized end frame on this same manifold. The research question is how to bound the A1 solution across these seams and the remaining core. [Marked handle data](../../05_certificates/research-progress/handoffs/TO_06_HANDLE_DIAGRAM_20261127.md) · [Four-dimensional assembly and metric trial](../../../investigations-1/07_positive_subcritical_entry/notes/MARKED_CONNECTION_ASSEMBLY.md)

**Coordinate question.** A generalized isothermal chart could simplify the expression of $L_q$ or its elliptic equation on a difficult piece. To use it, specify its domain, how it transforms on overlaps, and which estimate it gives for the original two-form. Ordinary changes of smooth coordinates can already be used for the finite-cover test. Recovering the curved geometry from generalized charts on direction-space patches requires a further gluing argument. [Comparison with the original drafts](../notes/E05_DRAFTS.md)

## Place in the route to the conjecture

This is the first step of the [route](../../../master-2/research-overview/OVERVIEW.md#the-route-and-its-gates). Investigations 02 and 03 use the statements A1 and A2 and can start before the proofs are replayed. If A1 or A2 fails, the frame of the second master fails with it, and the lead reports to the second master at once.

## Open decisions

B04 fixes the radius-one class, the pole over the planar origin, and the first trial coefficient. On the second cap the full tangential trace of the A1 field would determine it. Its three-by-three energy matrix and all the fibre periods leave its pointwise zeros undetermined. A signed moment test on the actual two-sided collar gives one way to bound this cap. [Pilot result](../notes/E08_MARKED_RESULT.md) · [Continuation](../continuation-notes/CLOSING_HANDLE_ATLAS_20261127.md). B01 supplies the normalized coefficient and B02 supplies smooth openness. B03 remains reserved for the separate case $b_2\ne0$.

## Ownership

Owns the proofs of A1 and A2, the kernel and its normalization, the pointwise algebra, the first checked family, and the comparison with the author's drafts. It does not own the manuscript of the [second master](../../../master-2/README.md), the zero set ([02](../../02_zero_circles/README.md)) or any Lean file. Statements for the formal side go to [certificates](../../05_certificates/README.md), which drafts the ledger, by handoff.
