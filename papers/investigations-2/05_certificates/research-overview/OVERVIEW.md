# Research overview — Certificates

27 November 2026, America/New_York. Prepared for Edward B. Baker III by Claude (Anthropic), model `claude-fable-5-2`, reasoning effort at the session's configured maximum, in a Cowork session. Setup baseline `b607bd1`. An investigation of the [second series](../../README.md). The [register](../research-progress/REGISTER.md) alone owns live status.

## Objective

Which statements about named homotopy four-spheres can be settled by finite certificates that Lean can check, and what must the ledger of imports contain for those certificates, and for the frame of the second master, to count as proofs?

Turn the recognition results that rest on finite computations into certificates with independent checkers, extend them over the families they belong to, and write down, from primary sources, the imports on which they and the frame of the second master depend.

## Setting

- *Certificate.* Finite data together with a checker that does not share code with the program that found the data. A group of finite order is certified by a coset table or an explicit finite model with the relations verified; a trivialization of a presentation by its sequence of moves; a diagram by its combinatorial data. A search that ends without a certificate proves nothing and is recorded as such.
- *The prism family.* For odd $d$, $\Gamma_d=Q_8\times C_d$ acts on $S^3$ as in the first master's [prism section](../../../master/manuscript/claude/even_prism_closing.tex), with quotient $Y_d$, isometry $J$ of order six, mapping torus $N_d$, section $\gamma$, orbit orbifold $O_d$, regular knot $\ell$ with meridian $\mu$, and longitudes $a+s\mu$. $G_s(d)$ is the orbifold group of the filling along $a+s\mu$. $\Sigma_{\rm ev}(d)$ and $\Sigma_{\rm odd}(d)$ are the two closings. For $d$ divisible by three $J^2$ has fixed points and the orbifold is different.
- *The presentation sphere.* $P=\langle x,y\mid x^{-1}y^2x=y^3,\ x=yx^2y^{-1}x^{-2}\rangle$ and $\Sigma_P$ the boundary of its five-dimensional thickening, as in [investigation 07](../../../investigations-1/07_positive_subcritical_entry/notes/PRESENTATION_SOURCES.md). Andrews–Curtis moves are inversion of a relator, multiplication of one relator by another, and conjugation of a relator, with stabilization by a new generator and the relator equal to it.
- *The ledger.* One list of imports for the second master, each with its exact hypotheses, its primary citation and the level at which it was read, drafted here in natural language and requested of the formal side by the second master.
- The conventions of the [second master's overview](../../../master-2/research-overview/OVERVIEW.md#fixed-setting-and-conventions) apply to everything about pole forms.

## Inherited, with evidence level

- **$\Sigma_{\rm ev}(17)\cong S^4$.** A working proof in the notes of the tube investigation ([E39](../../../investigations-1/08_cut_geometry_and_chirality/03_tubes_and_exteriors/notes/E39_PRISM_FILLINGS.md), [E70](../../../investigations-1/08_cut_geometry_and_chirality/03_tubes_and_exteriors/notes/E70_EQUIVARIANT_SURGERY.md), [E76](../../../investigations-1/08_cut_geometry_and_chirality/03_tubes_and_exteriors/reviews/E76_RECOGNITION_TRANSFER.md)) with model replays ([E73](../../../investigations-1/08_cut_geometry_and_chirality/03_tubes_and_exteriors/reviews/E73_FIRST_GROUP_REPLAY.md), [E79](../../../investigations-1/08_cut_geometry_and_chirality/03_tubes_and_exteriors/reviews/E79_EVEN_TRANSFER_REPLAY.md)). The group computation was replayed by `check_05` of the note's [checks](../../../master/brainstorm/notes/claude/ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127_checks/README.md): order $816$ with the meridian killed and a surjection onto an explicit model, order six at $a$, underlying fillings of order $|3s-1|$. The tangle diagram from which the presentation is read was not rederived. No formal proof.
- **$\Sigma_{\rm odd}(17)$ is open.** It is the Gluck twist of $S^4$ along the prism knot. The adjacent groups have abelianizations $C_4$ and $C_8$; the tube investigation finds them infinite, and `check_05` only observes that enumerations do not close.
- **Order seven.** Jabłonowski's preprint states that both closings are standard, with groups $S_3$ and $\mathbb Z/8$. Read through a reader whose extraction ended before the proofs.
- **Other orders.** Fibred knots in $S^4$ for $d=5,11,13,19$ (Teragaito), and the longer list $3,5,11,13,19,21,27$ as reported by Jabłonowski. Not read.
- **Two observations of the proposing note, unchecked.** In $\Sigma_{\rm ev}(17)$ the compressed sphere is the two-twist spin of the singular knot of the filled orbifold, which is a trefoil; hence the prism mapping torus and the mapping torus of the involution of $L(3,1)$ differ by one equivariant torus surgery. This suggests, without proving, that $G_0(d)\cong S_3$ for every odd $d$ prime to three.
- **$P$ presents the trivial group.** `check_07`. Shehper and coauthors list $P$ among the instances their bounded search did not resolve, as recorded in the sources of 07. An Andrews–Curtis trivialization, stable or not, makes $\Sigma_P$ standard; that implication is an import recorded there.
- **Classification of circle actions.** Galaz-García and Searle, Theorem 3.2, after Fintushel and Pao. Import; read through a reader.

## Inputs that need a global extension

A group computation becomes a statement about a manifold only through imports: the tangle diagram, the classification of circle actions, and the fact that homotopic circles in a four-manifold are isotopic. The first of these is at present an unchecked computation of another branch. Nothing is known for general $d$. No certificate type is known for a Gluck twist. An Andrews–Curtis search may not terminate, and a failed search is not evidence.

## Place in the route to the conjecture

Independent of the pole-form frame. Its sweeps decide [gate 3](../../../master-2/research-overview/OVERVIEW.md#the-route-and-its-gates): spheres that resist every recognition tried become the candidates of [06](../../06_invariants_and_candidates/README.md). Its ledger draft is the input of the second master's request to the formal side. Recognizing named spheres removes candidates and tests methods; it does not prove the conjecture.

## Unresolved decisions

The certificate formats and what each leaves as an import (CERT-B02). The statement to test for general $d$ and the curves to sweep (CERT-B01). The order in which the ledger is drafted (CERT-B03).

## Ownership

Owns certificate formats, the prism computations beyond $\Sigma_{\rm ev}(17)$, the search for $P$, handle diagrams of the named spheres and the ledger draft. It does not own the tube investigation, investigation 07 or `formalization/`.

## Activated results, 27 November

The preceding inherited evidence is the setup snapshot. The lead selected the intrinsic three-sphere longitude on the marked quaternionic geodesic at eleven and seventeen, and its positive meridian neighbour. The individual checks, smooth transfer prerequisites and primary-source receipts are recorded in the [sole register](../research-progress/REGISTER.md). The [ledger](../notes/IMPORT_LEDGER.md) is the deliverable for the second master. The [handle model](../notes/E06_PRESENTATION_HANDLES.md) realizes the actual two attaching charts of 07 and transfers to 06. The accepted [certificate formats](../brainstorm/notes/B02_CERTIFICATE_FORMATS.md) separate the proof that a word belongs to the relations from a permutation lower witness.

**Project theorem, replayed.** The actual order-eleven even closing is smoothly standard by the cyclic transfer. The independently checked groups for the two native longitudes at eleven and seventeen are C₂ and S₃. The corresponding positive meridian neighbours have infinite groups. The original opposite framings remain open here. [Four cases and their smooth scope](../research-progress/handoffs/TO_MASTER2_PRISM_SWEEP_20261127.md)

**Import, preprint, and certificates.** Jabłonowski’s two original closings at seven are standard as an unordered pair. The selected Whitehead clasp belt has orbifold groups S₃ at slope zero and C₈ at slope −1. The lead recovered the source and identified the full peripheral presentation in Remark 8.12. [Original marking](../references/ORDER_SEVEN_V2_20261127.md) · [Reversible reductions of the actual words and signed tables](../notes/E12_ORDER_SEVEN_PRIMARY_REPLAY.md)
