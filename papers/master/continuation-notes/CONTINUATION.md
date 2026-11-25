# Master research continuation

Use the [parallel program handoff and four independent launch prompts](PARALLEL_PROGRAM_20261125.md) for the current organization. The [immersion and Ricci-scale handoff](AFTER_IMMERSED_HEIGHTS_AND_RICCI_SCALES_20261125.md) records the preceding mathematical milestone. The [earlier physical energy-scale handoff](AFTER_PHYSICAL_ENERGY_SCALES_20261125.md) preserves the previous inputs. The original activation below preserves the first edition’s instructions.

## Original launch of sustained research

25 November 2026 · Prepared for Edward B. Baker III with OpenAI Codex assistance. The first master edition draws on the research at `5ff7014` and the contributing manuscripts recorded at `fc60509`. The [master manuscript](../manuscript/README.md), [research overview and source map](../research-overview/OVERVIEW.md), [research plan](../research-plan/PLAN.md), [sole live register](../research-progress/REGISTER.md) and [initial independent checks](../reviews/INITIAL_EDITION_20261125.md) are the starting documents. At preparation, B01 and E00 had established the initial edition. The register gives the current status when this note is used.

## The first mathematical decision

Fix a hypothetical nonstandard oriented smooth homotopy four-sphere $M$. Write $E_+(g;U)=\int_U |W^+_g|_{\mathrm{HS}}^2\,dV_g$ in the curvature-operator convention, $I^+(M)$ for the infimum over smooth positive-Yamabe classes on this smooth type, and $T=4\pi^2$. Entry would give such a class below $2T$. An actual positive class at or below $T$ already identifies the smooth type. An unattained infimum equal to $T$ leaves room for a minimizing sequence.

Conditional on entry, look for **one sequence** approaching $I^+(M)$ on which to construct a strict competitor. For a marked spherical cut with positive-Yamabe caps and total capped energy below $2T$, the paper proves that a retained capped side has type $M$. If its energy exceeds its raw-side energy by at most $\gamma_{\rm ret}$, then

$$
 E_{\rm discarded}\le E_+(g)-I^+(M)+\gamma_{\rm ret}.
$$

This gives a quantitative target. A cut with a fixed positive amount of chiral energy on each complete raw side and vanishing cap costs suffices. A strict finite-index improvement also suffices if the measured margins prove it.

There is a second starting point with actual source geometry. The [physical-volume theorem](../manuscript/physical_volume.tex) supplies disjoint parametrized standard balls covering all but $\epsilon$ of the physical Yamabe volume. Their locations are chosen using positive-Ricci comparison distances. Test one ball replacement at a time on $M$, counting its full net cost against the raw exterior. At fixed $\epsilon$ the number of balls stays bounded along the selected subsequence. The [replacement inequality](../manuscript/chiral_weyl_energy_and_smooth_poincare.tex) makes a contradiction possible if both the sum of the costs and the chiral mass on the uncovered set become small. Take the source limit at fixed tolerance before sending $\epsilon$ to zero. A subsequence may depend on $\epsilon$ since all its energy limits equal $I^+(M)$.

## Initial routing

All IDs below have prefix `SP4-MASTER-`. Astra Ultra chooses the mathematical mechanism in each B decision. A Sol 6.2 Ultra helper can take an E packet as soon as the lead has fixed its inputs and acceptance test.

| Decisions and packets | When to begin | First deliverable |
| --- | --- | --- |
| B02 (Astra), then E01 (Sol) | Start on arbitrary $M$, in parallel with conditional B03. | Pick a concrete family of smooth metrics or conformal classes. Test the scalar quadratic form and the full interior and transition contributions to $E_+$. Identify precisely where the smooth type enters the construction. |
| B03 (Astra), then E02 or E03 (Sol) | Assume entry. Select a measured cut candidate, a parametrized ball family, or both if independent. | For E02, put both complete chiral side sets and both buffers into one actual marking and estimate each cap. For E03, estimate individual same-type repairs, their aggregate cost and the uncovered chiral mass. Identify any term still uncontrolled. |
| B04 (Astra), then E04 or E05 (Sol) | A cut or repair estimate leaves a concentration region, a whole limiting base, or a smooth closed survivor. | For E04, check a marked base or an ALE comparison on whole truncations. For E05, test rigidity or an admissible strictly decreasing variation at a closed minimizer, including the case where the divergence of $W^+$ cannot be made zero by a conformal change. State any surviving cases. |
| B05 (Astra), then E06 (independent Sol check) | A candidate argument covers entry and every reachable case, or proves smooth recognition directly. | Trace the implication from an arbitrary smooth homotopy sphere and independently audit the topology, analytic estimates, quantifiers and strict inequalities. |

## Paste into a new Astra Ultra session

> Activate sustained research in `papers/master` in the smooth-poincare-4d checkout. Use GPT-6.2 Astra at ultra reasoning effort as lead. You have broad authority to try different proof routes, revisit earlier choices, consult primary literature, revise or create B decisions and E packets, and create bounded GPT-6.2 Sol helpers at ultra effort for derivations, counterexamples and independent proof checks. Continue through useful follow-on work without asking for routine approval.
>
> Read `AGENTS.md`, the root README, the investigation, model and reference workflows, and this note at `papers/master/continuation-notes/CONTINUATION.md`. Read the master overview, plan, sole register, manuscript and initial review. Check current commits and working-tree revisions of the inputs you use. Follow the overview to the owning investigation and exact theorem or formalization receipt before relying on a result. Reconcile any later changes with the live register.
>
> Start B02 and B03 in parallel. For B02, choose a construction available on an arbitrary smooth homotopy four-sphere and test whether it gives a positive Yamabe class with chiral energy strictly below $8\pi^2$. Check both positivity and the transition energy without assuming a standard smooth parametrization of the whole sphere. For B03, assume entry and choose one positive-class minimizing sequence of volume-one Yamabe representatives. Seek an actual marked cut separating two positive chiral masses, or an inexpensive same-type replacement of the volume-bearing marked balls together with an independent estimate on their complement. Use the quantitative targets above. A direct positive class of energy at most $4\pi^2$, or another direct recognition argument, can shorten the route at any stage.
>
> Make each comparison on specified domains and smooth types. Track the physical metric and measures, the conformal or rescaled comparison metric, the boundary marking, both full sides, the cap signs and costs, and the order of limits. For a weak chart, choose the buffer length before passing to the source limit and test the first-order estimate in the chart where the splice is performed. If concentration persists, follow the missing chiral mass. Test a whole marked base, an admissible ALE component or another comparison justified on the selected sequence. Any use of almost Bach-flat compactness needs a source of small Bach error in the required norm at the minimizing energy. For a round restart at equal energy seek a termination argument. For an attained closed nonround minimizer seek rigidity or a strict same-type competitor. Record which cases remain reachable after each result.
>
> Freeze each helper request in `papers/master/research-progress/handoffs/` with its ID, versioned inputs, mathematical target, finite scope, acceptance test, failure condition and distinct output. Keep shared files under lead ownership. Have an independent reader recompute the decisive step of a promising route. If a test fails, preserve the failed estimate and the class it covers, then choose the next route in light of that evidence. The first packets are starting points. You may change the mechanism, introduce a new intermediate result or use a shorter proof whenever the hypotheses support it.
>
> Integrate assessed derivations and scoped failures into the master research record. Keep the register authoritative, provenance in the overview and forward decisions in the plan. Promote a verified result to the self-contained manuscript when it advances the principal proof. Rebuild the PDF after manuscript changes. At a substantial integrated milestone, report the strongest new implication, its hypotheses, the exact remaining obstruction and a concrete continuation.
