# Can a field observable improve the smooth sphere test?

28 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. Actual serving variant and effort are unavailable.
Setup at checkout 86b24d9f9c2d and the working-tree inputs pinned in the
[source index](../references/README.md). The [opening brainstorm](../brainstorm/notes/FIELD_THEORY_START_20261128.md)
selects a standard boundary control. The papers and earlier calculations
retain their recorded scope. SP4-FTI is a new, unactivated task family.

## Domain and comparison

Let $\Sigma$ be any smooth closed connected oriented homotopy
four-sphere, with an arbitrary smooth positive-definite Riemannian metric
$g$. Use its unique spin structure and the spin-induced spinᶜ structure.
Use the branch's orientation to identify $\Lambda_g^+$ as the self-dual
bundle and write the monopole operator on positive spinors. In a pole
experiment choose a point $p$, a nonzero projective residue direction
$[u]\in\mathbb P(\Lambda_p^-)$ and an asymptotically standard normalized end
on $\Sigma\setminus\{p\}$. A transverse zero-circle and its normal eigenline
are additional data. They need to be supplied on any example that uses
them. For a cut $Y$, fix the boundary identification and use the
outward-normal-first convention. Start on compact smooth pieces with
product collars and smooth geometric data. Any use of singular fields,
Sobolev completion, perturbation or additional structure must specify
its domain, gauge quotient, coefficients and norms before computation.
[Local zero-circle data](../../../02_zero_circles/notes/E03_LOCAL_SOURCES.md) · [Pole normalization](../../../01_chiral_transfer_and_pole_forms/notes/E01_A1.md)

A closed field-theoretic observable would improve the [parent's geometric
test](../../research-overview/OVERVIEW.md) if it gives an exact value or
bound on a specified smooth object and a checked separation from the
standard comparator with less work to construct and verify. The parent
test needs an embedded disk in the standard ball for its signed knot
construction, or an embedded low-genus surface in the marked puncture
with a verified standard lower bound. The field approach needs a
well-defined state or map, a verified comparison and a way to compute
it from the supplied geometric or handle data. Record both forms of work.
A relative distinction can improve a marked comparison even when it
forgets to the ordinary closed value. Its conclusion concerns the
specific filling or marking until descent or a uniform bound is proved.

## Candidate methods

| Route | First test | What a distinguishing observable would need |
| --- | --- | --- |
| Donaldson–Witten and twisted Seiberg–Witten | Specify the gauge and bundle sector, scalar symmetry, equations, reducibles, degrees, metric variation and any chamber hypotheses on closed manifolds and on a cut. Track the Donaldson point insertion separately from a monopole count. | A construction in the stated low-Betti-number regime, with compactness and a defined pairing or insertion. The closed homotopy sphere has $b_1=b_2=0$ and falls outside the quoted ordinary SW integer extraction hypothesis. |
| Vafa–Witten | Compare the distinct $N=4$ twist and its partition-function interpretation. Isolate hypotheses behind the vanishing reduction and the Euler-characteristic description. | A defined partition function or relative theory in the actual Riemannian and gauge sector. The Kähler vanishing precedent does not identify a value here. |
| Equivariant Bauer–Furuta and relative monopoles | Fix the ordinary circle-equivariant closed unit and the scope of homotopy by smooth target translation. Specify one boundary deformation complex on the standard twisted circle. | A new relative class or defect sector, with explicit group action, compactness and gluing. Extra equivariance, circle families, singular boundary conditions and altered domains each require a separate argument. |
| Floer states, defects and TQFT | Compute or specify the tube/exterior states or maps for a single cut, test the cylinder and glue back both the actual standard tube and a reference cap where appropriate. Test the orientation, deformation and mark changes through that comparison. | A defined relative pairing or cobordism map with continuation and an explanation of what survives forgetting the cut. Apply Reutter only after checking the precise bordism category, coefficients and both semisimple algebras. |
| Twistor and twistor-string actions | Compare complex B-model and gauge twistor actions, the spacetime twist, the adjoint mass deformation and its infrared monopole sector. Use the E33 nonround standard metric to test the differential. | A real, global field space on arbitrary admitted metrics and a proof of the stated observable through the reduction. Separate classical, perturbative, infrared and nonperturbative claims. |
| An off-shell field model | Choose one variable almost-complex or spacetime construction. Require a differential that closes on the nonround control without imposing the equation of motion. | A reason metric variation is cohomologically trivial, including insertions, boundaries, compactness and any measure or anomaly terms for the claim made. An exact twistor-spinor action will need a separate completion and a comparison to the [variational branch](../../04_twistor_action/README.md). |

[Primary passage receipts and bibliography ownership](../references/README.md)

## Baselines and their limits

- Bauer II, Proposition 2.3 gives the ordinary single-manifold
  $S^1$-equivariant Bauer–Furuta unit. Its connected-sum formula, Theorem
  1.1, preserves the other factor. The existing 07/02 calculation shows
  that adding a fixed smooth self-dual curvature source preserves the
  ordinary closed class. Its uniform bounded-preimage estimate is along
  the homotopy for one fixed source. Singular limits and different
  domains require other estimates. [Passages and argument](../../02_invariants/brainstorm/notes/TWISTOR_STRING_AND_MONOPOLE_MAP.md#what-happens-if-the-pole-is-a-source-in-the-monopole-equation)
- Gerig's Main Results 1–2 and Theorem 6.2 give the common modulo-two
  relative value in the asymptotically standard setting with no twisted
  zero-circles. His Example 1.7 gives a standard open four-manifold with
  a twisted circle. The experiment uses that example as a control.
  [Gerig source receipt](../../02_invariants/references/TWISTOR_STRING_BAUER_FURUTA_SOURCES.md)
- Reutter, Corollary B(2) gives the same closed scalar on oriented
  homotopy four-spheres for the ordinary oriented Atiyah–Segal theories
  covered by the theorem. The coefficient field is algebraically closed
  and the local-operator and fusion Frobenius algebras are semisimple.
  Theorem A concerns the specified stably diffeomorphic bordisms
  relative to their identified boundary. The data for a defect or a
  different target need their own applicability test. [Primary reading and specialization](../../../06_invariants_and_candidates/research-progress/handoffs/RETURN_INV_E01_20261127.md)
- For the canonical Riemannian twistor space $Z=S(\Lambda_g^+)$,
  ordinary projected $\bar\partial_J$ fails to be a differential
  on the nonround standard E33 control. On a homotopy sphere,
  requiring canonical integrability forces $W^+=0$ in this convention
  and leads by signature and conformal development to standardness.
  Its use as a starting assumption would preempt the recognition
  problem. [AHS and the control](../../02_invariants/brainstorm/notes/TWISTOR_STRING_AND_MONOPOLE_MAP.md#the-ordinary-dolbeault-differential-on-the-standard-nonround-control)

## Ownership and assessment

This family designs and tests the field/deformation data, relative sector,
gluing and off-shell or effective-theory comparison. [07/02 Invariants](../../02_invariants/README.md)
owns smooth-type and marked-observable comparisons. [07/04 Twistor
action](../../04_twistor_action/README.md) owns the exact $J_g^4$ variational
analysis. [07/01 Examples](../../01_examples/README.md) owns marked geometric
constructions and the [parent](../../README.md) owns the combined implication.
[06](../../../06_invariants_and_candidates/README.md) retains its invariant
eligibility and candidate evaluations. [05](../../../05_certificates/README.md)
owns the import-ledger and certificate interface. New formal requests go
to the formalization side through a dated handoff. [Sibling crosswalk](../../research-progress/handoffs/SIBLING_CROSSWALK_20261128.md)

Selected passages are inherited inputs. Future route-specific imports
need primary checks at the point of dependence. Record whether a result
is heuristic, a working or replayed project theorem, a certificate or
Lean-established under the series rules. A general claim about all
smooth homotopy spheres requires a globally defined construction on that
domain and proof of every claimed independence. [Series rules](../../../README.md#working-rules) · [Plan](../research-plan/PLAN.md) · [Sole register](../research-progress/REGISTER.md)
