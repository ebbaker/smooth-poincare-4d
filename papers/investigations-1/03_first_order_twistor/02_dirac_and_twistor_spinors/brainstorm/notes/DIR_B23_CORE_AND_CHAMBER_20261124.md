# B23 · Which invariant decides the minimizing metric when a punctured core meets a round chamber?

24 November 2026, America/New_York. Prepared for Edward B. Baker III with LLM
assistance: Claude Fable 5.2 (`claude-fable-5-2`), Claude Cowork, reasoning
effort max as the session's configuration records it. This session acted as
lead at the author's request to continue the research. The Astra/ultra lead
and the `gpt-6.2-sol` / `ultra` helpers that the routing recommends were not
available in it. The three packets below were therefore executed by the same
model in the same session and are not independent of this decision.
[Handoff](../../continuation-notes/02_AFTER_FIVE_EIGENFUNCTION_RIGIDITY_20261124.md) ·
[Spectral assessment](../../reviews/DIR_B22_FIVE_EIGENFUNCTIONS_20261124.md) ·
[Owning register](../../research-progress/REGISTER.md). Inputs are the
working tree at HEAD `3fb565b70247a57e4fcc7e65886c57ce0ca0e1ab`; each request
pins its files.

## The choice

The handoff asks whether a small punctured core can be attached to a round
chamber while keeping both Yamabe minimization and the relative pinching
$\epsilon=3\lambda_5/s-1$. Three of the quantities in that question belong to
the conformal class and not to the glued representative: the Yamabe constant,
the set of unit-volume minimizing metrics, and the spectrum of each
minimizer. The first thing to settle is therefore what the gluing does to
the class. Both the flat germ of [E26](../../notes/DIR_E26_20261124.md) and a
round chamber are conformally flat near the seam, so the natural neck is
conformally flat. If that gluing does not move the class, the proposed family
carries no information about minimizers, and the question becomes one about
conformal classes, which has to be probed where the class does move and the
minimizers are known.

Three finite tests are fixed.

| Packet | Question | What each outcome would mean |
| --- | --- | --- |
| [E48](../../research-progress/handoffs/SP4-FOT-DIR-E48_REQUEST_v1.md) | Does the conformally flat gluing of a core to a round chamber change the conformal class? How far can a change of class inside a small ball move the Yamabe constant? | No change: the chamber-and-core family is a set of representatives of one class, and the handoff's competition is decided by that class. A change: estimate both energies in the new class. |
| [E49](../../research-progress/handoffs/SP4-FOT-DIR-E49_REQUEST_v1.md) | On $S^1(L)\times S^3$, where Schoen identified the Yamabe minimizers and a handle of vanishing volume appears as $L\to\infty$, what is $\epsilon$ of the actual minimizers, and what do the quantities of the near-equality theorem do? | $\epsilon$ bounded below: evidence that pinching sees topology in small regions. $\epsilon\to0$: the weak law cannot recognize a sphere without a further hypothesis. |
| [E50](../../research-progress/handoffs/SP4-FOT-DIR-E50_REQUEST_v1.md) | What does Gauss–Bonnet give at a Yamabe metric on a homotopy sphere, how does the Chang–Gursky–Yang threshold read there, and which curvature quantity does pinching control through the Bochner formula? | An integral criterion that could replace the pointwise Ricci hypothesis of E45, or a precise statement of why pinching does not supply it. |

The circle product was chosen because it is the one closed four-manifold in
which a region of vanishing volume carries topology and every constant scalar
curvature metric of the class is explicit. It is not simply connected, and no
conclusion about homotopy spheres is drawn from it beyond what a general
closed four-manifold allows.

## Not decided here

A neck that is not conformally flat changes the class. No estimate is
attempted for such a neck on an unknown manifold. The existence of a metric
of positive scalar curvature on an arbitrary smooth homotopy four-sphere is
not assumed and not addressed. Local minimizers of the Yamabe functional
enter only through an inspection of the existing proof.

## Escalation

If E48 shows that the class moves, a new B decision selects the estimate for
the changed class. If the imported classification in E49 cannot be confirmed
against its source, the packet returns its spectral computations as
conditional on it. If the convention check in E50 fails against the shared
recognition record, the packet stops and reports to the lead before any
criterion is stated. Each return is assessed in the
[review](../../reviews/DIR_B23_CORE_CHAMBER_AND_NECKLACE_20261124.md).
