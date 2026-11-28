# Smooth Poincaré investigations — series 2

The second series studies the conjecture through a different object from the first. On a homotopy four-sphere $M$ with a conformal class $c$, the map $d^-A\mapsto d^+A$ is an isometry between square-integrable anti-self-dual and self-dual two-forms. Its kernel at a point $p$ is a three-dimensional space of closed self-dual two-forms on $M\setminus p$ with a pole of order four, the *pole forms* of $(M,c,p)$. A pole form without zeros would identify $M$ with $S^4$ through a published theorem. The frame, the conventions and the manuscript are in the [second master](../master-2/README.md). The series was proposed in the note [Alternative frameworks and a proposal for investigations-2](../master/brainstorm/notes/claude/ALTERNATIVE_FRAMEWORKS_AND_INVESTIGATIONS_2_20261127.md) and set up at the author's request on 27 November 2026.

1. [Chiral transfer and pole forms](01_chiral_transfer_and_pole_forms/README.md) owns the foundations: the transform, existence and expansion of the pole forms, recognition from a zero-free form, the pointwise algebra and the first checked family.
2. [Zero circles](02_zero_circles/README.md) computes pole forms on the standard sphere and studies where they vanish. It owns the first gate of the program.
3. [Lines and broken fibrations](03_lines_and_broken_fibrations/README.md) reads the near-symplectic literature for the closed manifold $M\#\mathbb{CP}^2$: pseudoholomorphic curves that bound the zero set, the last circle, and the dictionary with broken Lefschetz fibrations and trisections.
4. [Entropy of embeddings](04_entropy_of_embeddings/README.md) is an independent extrinsic framework: recognition of the standard sphere from an embedding in $\mathbb R^5$ of low Colding–Minicozzi entropy.
5. [Certificates](05_certificates/README.md) collects statements about named homotopy spheres that a finite computation can settle and Lean can check, beginning with the prism family and one balanced presentation, and drafts the ledger of imports and the frame statements for the formal side.
6. [Invariants and candidate spheres](06_invariants_and_candidates/README.md) keeps the other possibility in view: which field-theoretic invariants a known theorem excludes, and whether one that is not excluded can be computed on a named candidate.
7. [Counterexample tests](07_counterexample_tests/README.md) has four sibling investigations. [Examples](07_counterexample_tests/01_examples/README.md) constructs marked geometric witnesses. [Invariants](07_counterexample_tests/02_invariants/README.md) compares the punctured genus profile, the pole-circle minimum and the centered twistor gap. [Field theory](07_counterexample_tests/03_field_theory/README.md) studies gauge and twistor observables on fillings and cuts. [Twistor action](07_counterexample_tests/04_twistor_action/README.md) studies the classical action $S_g=J_g^4$ and its boundary data. The parent checks the comparison on the same smooth object.

Investigation 01 comes first. Investigations 02 and 03 depend on its statements and not on its proofs. Investigations 04, 05 and 06 do not depend on the pole-form frame for their own questions. Investigation 05 also collects, for the ledger, the import statements that the other branches read in their sources, and 06 uses handle diagrams produced in 05.

## Working rules

The author stated these on 27 November 2026, and they govern every branch of this series.

- The aim is the smooth four-dimensional Poincaré conjecture itself. A partial result is recorded for what it contributes to that aim and is not shaped for publication.
- There will be no further guidance from specialists in four-manifold topology. Verification does not wait for an outside reader.
- Formal proofs in Lean are the standard for the project's own claims.

Three consequences are used throughout. A published theorem is an *import*: it is read in its primary source before use, stated with its exact hypotheses, and listed once in the ledger of imports that [certificates](05_certificates/README.md) drafts for the formal side. A statement proved in this repository is a *project theorem*: it is *working* when its proof is written, *replayed* when a reader who did not produce it has checked it, and *established* only when Lean proves it from Mathlib, the pinned differential-geometry library and the ledger. A finite computation is a *certificate* when its data can be checked independently of the program that found them. Everything else is a *heuristic* and is labelled as one.

The statement that every homotopy four-sphere carries a zero-free pole form is equivalent to the conjecture. As [AGENTS.md](../../AGENTS.md) requires, it is treated as a reformulation, and nothing in this series counts it as progress on existence.

## How sessions work in this series

Setup activated nothing. A branch is activated by the author with the prompt in its continuation note. The [setup workflow](../../INVESTIGATION_SETUP_WORKFLOW.md), the [model workflow](../../GPT_RESEARCH_MODEL_WORKFLOW.md) and the [reference workflow](../../REFERENCE_WORKFLOW.md) apply, with the following shared conventions.

1. *The assignment is the question.* The author asked on 27 November 2026, for the children of [cut geometry](../investigations-1/08_cut_geometry_and_chirality/README.md), that a session continue to a natural stopping point of the whole sub-investigation and not stop at a breakpoint inside it. That instruction is applied here unless the author says otherwise. Each continuation note divides its question into components and names its end states.
2. *Definite results.* A component has a definite result when the register records one of the following for it: **established** (proved in Lean); **replayed** (a written proof checked by a reader who did not produce it, with its formal statement requested by handoff); **refuted**; **reduced** (to one open statement, with an impasse note that a second reader has checked for missed approaches); or **external** (a named input of another branch, requested by handoff).
3. *The cycle.* Freeze each E packet as a request in `research-progress/handoffs/`, run independent packets in parallel on disjoint files, and integrate each return into the register. At each integration add one dated line to `DRAFT_HISTORY.md` and take the next step in the same session.
4. *Past the first horizon.* The rows of a plan are its first horizon. The lead adds rows to the plan and the register, continuing the numbering of the task family, and never reuses an identifier.
5. *Failures and dependencies.* A failed estimate is recorded for the class actually examined and is followed by the alternative its row names. A dependency on another branch is requested by a handoff named `TO_<receiver>_<subject>_<date>.md`, and work continues on what does not depend on it.
6. *Formal requests.* This series opens no Lean edition by itself. A formal statement is requested from the formalization program by handoff, following the [formalization setup workflow](../../formalization/FORMALIZATION_SETUP_WORKFLOW.md).
7. *Questions for the author* are recorded in the register, and the session continues unless every remaining step depends on the answer.
8. *Interruptions and ends.* A session that is cut off leaves `continuation-notes/RESUME_<date>.md`; at an end state it leaves `continuation-notes/CLOSING_<date>.md`.
9. *Ownership.* A session edits only its own branch. It does not commit; the author commits.

## Relation to the earlier collections

The [first series](../investigations-1/README.md) and the [first master](../master/README.md) study entry into the band of chiral Weyl energy below $8\pi^2$ and recognition there. They are unchanged by this setup. The [initial investigations](../initial-investigations/README.md) defined generalized isothermal coordinates on the correspondence space of a complex four-manifold and found that a chart which is conformal on complete direction fibres forces $W=0$. The pole forms give a chart in Riemannian signature that is linear on the fibres and conformal there only for the round class; [investigation 01](01_chiral_transfer_and_pole_forms/README.md) records the comparison.

Use each task family's sole live register. This index does not duplicate task status. Later investigations of this series follow [the setup workflow](../../INVESTIGATION_SETUP_WORKFLOW.md) and take the next two-digit prefix.

27 November 2026, America/New_York. Prepared for Edward B. Baker III by Claude (Anthropic), model `claude-fable-5-2`, reasoning effort at the session's configured maximum, in a Cowork session. Setup baseline `b607bd1`.
