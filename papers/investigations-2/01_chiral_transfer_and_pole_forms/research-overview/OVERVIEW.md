# Research overview — Chiral transfer and pole forms

27 November 2026, America/New_York. Prepared for Edward B. Baker III by Claude (Anthropic), model `claude-fable-5-2`, reasoning effort at the session's configured maximum, in a Cowork session. Setup baseline `b607bd1`. An investigation of the [second series](../../README.md). The [register](../research-progress/REGISTER.md) alone owns live status.

## Objective

Do the pole forms exist on every conformal class of a homotopy four-sphere, with the stated leading term, and does a pole form without zeros identify the sphere with $S^4$?

Write the two propositions of the frame in full, have each replayed by a reader who did not write it, fix the kernel of the transform and its normalization for the whole series, and put the pointwise algebra and the first explicit family in a form the formal side can take.

## Setting

The category, orientation, norms, the puncture and the vocabulary of pole forms are those of the [second master's overview](../../../master-2/research-overview/OVERVIEW.md#fixed-setting-and-conventions). This investigation adds the following. On $X=M\setminus p$ with the metric $g'=|y|^{-4}g$ near $p$, $W^{k,2}_\delta$ is the weighted Sobolev space in which weight $\delta$ means decay $O(r^\delta)$. The operator is $D=d^*\oplus d^-$ from one-forms to functions and anti-self-dual forms; it lowers the weight by one. A constant self-dual form in the chart $x$ is written $\omega^0$ and its linear primitive $A^0$.

## Inherited, with evidence level

- **A1** (existence, dimension three, leading term). Section 3.2 of the [proposing note](../../../master/brainstorm/notes/claude/ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127.md). A proof sketch of one session, not read by anyone else. It rests on four assertions that the sketch states without detail: $g'$ is asymptotically Euclidean of order two; the exceptional weights of $D$ on flat space in $[-3,0]$ are $-3$ and $0$; the kernel vanishes for weights in $(-3,0)$; the cokernel vanishes because $b_2(M)=0$.
- **A2** (recognition). Section 3.3 of the note. A proof sketch. Its import is McDuff and Salamon's Theorem 9.4.2, read as quoted in two later papers; the book was not opened.
- **Pointwise identities and the family $c_\varepsilon$.** `check_06` of the note's [checks](../../../master/brainstorm/notes/claude/ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127_checks/README.md): 21 symbolic and numerical tests, including the pull-back of constant forms under inversion and the energies of the family.
- **Identification with near-symplectic forms.** Section 3.4 of the note; derived from A1 and a local construction that was not written out.
- **The strict-chart obstruction.** The proposition of the [obstruction note](../../../initial-investigations/01_generalized_isothermal_coordinates/notes/RESEARCH_OBSTRUCTIONS_2026-11-20.md), a direct deduction for one definition of chart in the holomorphic setting. It is background and is not used in any proof here.
- **The operator in the literature.** Donaldson and Sullivan; Iwaniec and Martin. Cited from memory; neither was opened.

## Inputs that need a global extension

The count of exceptional weights is a computation on flat $\mathbb R^4$; the Fredholm statement on $X$ needs the weighted theory for asymptotically Euclidean metrics, read in a primary source. The order of the remainder in the leading term depends on the order to which $g'$ is Euclidean, which normal coordinates give as two. The cut-off in A2 needs a quantitative bound. A2 needs the clause of the imported theorem on agreement with the given chart near infinity, and the smooth structure of $M$ at $p$ must be matched with that of $S^4$ at infinity. The conformal weight of the leading coefficient is not fixed. Nothing is known yet about the dependence of the pole forms on $c$ and $p$.

The comparison with the drafts M2 and M3 concerns complex and neutral-signature constructions. Their charts are holomorphic and live on the correspondence space of a complex four-manifold. The chart here is real, exists in Riemannian signature on $X\times S^2$ off the zero sets, and is linear on each fibre. No statement of the drafts is assumed to carry over; POLE-E05 records which do.

## Place in the route to the conjecture

This is the first step of the [route](../../../master-2/research-overview/OVERVIEW.md#the-route-and-its-gates). Investigations 02 and 03 use the statements A1 and A2 and can start before the proofs are replayed. If A1 or A2 fails, the frame of the second master fails with it, and the lead reports to the second master at once.

## Unresolved decisions

The normalization of the kernel $K_c(q,p)$ and of the leading coefficient (POLE-B01). The topology on conformal classes in which zero-freeness is open, and the function spaces for the dependence on $c$ and $p$ (POLE-B02). Whether the case $b_2\ne0$ is worth developing (POLE-B03, reserved; it is not on the route).

## Ownership

Owns the proofs of A1 and A2, the kernel and its normalization, the pointwise algebra, the first checked family, and the comparison with the author's drafts. It does not own the manuscript of the [second master](../../../master-2/README.md), the zero set ([02](../../02_zero_circles/README.md)) or any Lean file. Statements for the formal side go to [certificates](../../05_certificates/README.md), which drafts the ledger, by handoff.
