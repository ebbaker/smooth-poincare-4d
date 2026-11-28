# Research overview — Invariants and candidate spheres

27 November 2026, America/New_York. Prepared for Edward B. Baker III by Claude (Anthropic), model `claude-fable-5-2`, reasoning effort at the session's configured maximum, in a Cowork session. Setup baseline `b607bd1`. An investigation of the [second series](../../README.md). The [register](../research-progress/REGISTER.md) alone owns live status.

## Objective

Which field-theoretic invariants does a theorem exclude from distinguishing a homotopy four-sphere from $S^4$, and can an invariant that is not excluded be computed on a named candidate?

Every other investigation of the series tries to prove the conjecture. This one keeps the other possibility in view. It records, from primary sources, which invariants cannot detect an exotic four-sphere, and decides whether one that is not excluded can be computed on a sphere that the rest of the program has failed to recognize.

## Setting

- *Candidates.* A named smooth homotopy four-sphere whose smooth type the repository's sources do not settle: at setup, $\Sigma_{\rm odd}(17)$, the Gluck twist of $S^4$ along the prism knot of the first master's [prism section](../../../master/manuscript/claude/even_prism_closing.tex), and $\Sigma_P$ of [investigation 07](../../../investigations-1/07_positive_subcritical_entry/notes/PRESENTATION_SOURCES.md). Gate 3 of the second master may add spheres isolated by the sweeps of 05.
- *Excluded.* An invariant is excluded for a class of spheres when a theorem shows that it takes the same value on every member of the class and on $S^4$.
- *Field-theoretic invariants.* The Donaldson and Seiberg–Witten invariants; the values of topological field theories in the sense of Atiyah and Segal; invariants built from link homology, such as the Rasmussen invariant used by Freedman, Gompf, Morrison and Walker and the skein lasagna modules.
- The conventions of the [second master's overview](../../../master-2/research-overview/OVERVIEW.md#fixed-setting-and-conventions) apply where the frame is mentioned; nothing here depends on it.

## Historical inputs at setup (superseded by the primary readings)

- **Gauge theory.** The Donaldson and Seiberg–Witten invariants carry no information on a manifold with $b_2^+=0$. Standard; stated from memory.
- **Semisimple field theories.** Reutter: a semisimple oriented four-dimensional field theory cannot distinguish homotopy equivalent simply connected closed oriented four-manifolds, and all known full theories are semisimple. Import; abstract only.
- **Gluck twists and the Rasmussen invariant.** Manolescu, Marengon, Sarkar and Willis: the strategy with the Rasmussen invariant cannot detect a sphere obtained by a Gluck twist. Cited from memory; no bibliography record.
- **Skein lasagna modules.** Morrison, Walker and Wedrich defined them; Ren and Willis used them to distinguish an exotic pair of knot traces. The first from memory, the second from its abstract. Nothing is known here about their values on a closed homotopy sphere.
- **Twistor and holomorphic field theories.** They need an anti-self-dual background, which a homotopy sphere has only if it is standard. The proposing note set this direction aside; the reasons are in its section 6.

## Limitations anticipated at setup

Whether a lasagna module can be computed for a sphere whose handle diagram has one-handles and three-handles is not known to this repository. For a Gluck twist the theorem on the Rasmussen invariant is discouraging but concerns one invariant. A computation that returns the value of $S^4$ proves nothing about the sphere. No invariant is known to take a nonstandard value on any homotopy four-sphere.

## Place in the route to the conjecture

Not on the route to a proof. [Gate 3](../../../master-2/research-overview/OVERVIEW.md#the-route-and-its-gates) moves effort here if the sweeps of [05](../../05_certificates/README.md) isolate spheres that resist every recognition tried. Until then the investigation consists of three readings and is a watch item.

## Unresolved decisions

Whether any computation is attempted, on which candidate and with which invariant (INV-B01). Whether other families of invariants are worth a reading (INV-B02, reserved).

## Ownership

Owns the record of exclusions and the decision on a computation. It does not own handle diagrams ([05](../../05_certificates/README.md)) or the candidates.

## Result of the activated investigation

**Imports.** Reutter Cor. B(2) excludes closed scalars of ordinary oriented semisimple four-dimensional TFTs on every oriented smooth homotopy sphere. MMSW Cor. 1.13 excludes the ordinary boundary-link strong-sliceness test on a Gluck twist in its coefficient range. Ren Cor. 1.4 supplies the arbitrary-field inequality in the \(S^3\) boundary case. Ren–Willis Prop. 6.17 gives the entire classical rational \(\mathfrak{gl}_2\) module for negatively blow-up-stably standard homotopy spheres. Ren–Sullivan–Wedrich–Willis–Zhang give the relative Gluck-twist isomorphism for this same classical module. [Primary inspections](../references/README.md).

**Project theorem, replayed.** At orders 11 and 17, 05 identified the original \(a\)-framed closing with \(S^4\). Passing to the opposite original framing gives a Gluck twist on the original cap belt. Both opposite closings therefore have the ordinary rational \(\mathfrak{gl}_2\) module of \(S^4\), with its full grading. [Order-eleven replay](../research-progress/handoffs/RETURN_INV_E07_20261127.md). The same comparison holds in a common coordinate puncture with a framed boundary link. The ordinary field-valued Rasmussen knot-genus and strong-slice link tests, and the empty-link rational Lee filtration, give standard comparisons there. For the minus Miller–Schupp sphere the unfiltered rational Lee module is known from its homology. Its classical rational Khovanov module remains undetermined. [Proofs and scope](../brainstorm/notes/B01_CANDIDATE_DECISION_20261127.md).

**Certificate / project input and heuristic decision.** 05 supplied the framed five-dimensional handles for \(\Sigma_P\), their attached four-dimensional boundary and a replay of its marked identification. The unmarked Gay–Kirby double offers a four-dimensional description. The native cancellation and trace-framing tests isolate the limits of two immediate uses of these handles. The branch declined an unexcluded computation with these data. [Inputs](../notes/CANDIDATE_INPUTS_20261127.md) · [Concrete reopening criteria](../brainstorm/notes/B01_CANDIDATE_DECISION_20261127.md).
