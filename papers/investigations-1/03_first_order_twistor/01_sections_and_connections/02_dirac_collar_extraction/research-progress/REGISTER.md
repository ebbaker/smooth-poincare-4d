# Research progress — Dirac collar extraction

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. Exact serving model and reasoning effort unavailable. [Inputs and versions](../../../brainstorm/notes/COLLAR_PROGRAM_AND_SPC4_20261125.md#inputs-and-versions)

This is the sole live register for **SP4-FOT-EXTRACT**. Research activated jointly on 25 November. The lead owns this register. [Decisions](../brainstorm/notes/DECISIONS_JOINT_COLLAR_20261125.md) · [Plan and completion criteria](../research-plan/PLAN.md) · [Handoff guide](handoffs/README.md)

| Task and specification | Work | Current status | Prerequisites |
| --- | --- | --- | --- |
| [SP4-FOT-EXTRACT-E01](../research-plan/PLAN.md#sp4-fot-extract-e01) | Calibrate one supplied buffered chart | **Assessed on the buffered SEC chart.** [Proof](../notes/E01_BUFFERED_SPIN_STRIP_20261125.md) | SEC §14.3 in one supplied Euclidean annulus with a buffered interior strip of normalized length at least two. |
| [SP4-FOT-EXTRACT-B01](../research-plan/PLAN.md#sp4-fot-extract-b01) | Find a spin strip on the original sequence | **Assessed for smooth embedded ends.** [Decision](../brainstorm/notes/DECISIONS_JOINT_COLLAR_20261125.md) | The source band and candidates from a supplied full embedded smooth ALE end or a low-energy annular block. NECK-B01 data can be reused when available. |
| [SP4-FOT-EXTRACT-E02](../research-plan/PLAN.md#sp4-fot-extract-e02) | Transfer one embedded strip | **Assessed on the physical smooth ALE sequence.** [Proof](../notes/E02_ALE_SPIN_TRANSFER_20261125.md) | B01 fixes a source and its geometric inputs. Use E01 if its chart estimate is needed. |
| [SP4-FOT-EXTRACT-B02](../research-plan/PLAN.md#sp4-fot-extract-b02) | Choose attainable varying-slice data | **Assessed on one fixed smooth strip.** [Decision](../brainstorm/notes/DECISIONS_JOINT_COLLAR_20261125.md) | Measured geometry from B01 or E02, or a specified model family, and a candidate operator criterion from MATCH-B01 or its original brainstorm. |
| [SP4-FOT-EXTRACT-E03](../research-plan/PLAN.md#sp4-fot-extract-e03) | Measure the agreed slice criterion | **Assessed on a fixed buffered source strip.** [Proof](../notes/E03_NORMAL_SLICE_MEASUREMENTS_20261125.md) | B02 names one family, one measured geometric input and one fixed criterion. |
| [SP4-FOT-EXTRACT-B03](../research-plan/PLAN.md#sp4-fot-extract-b03) | Decide how much of the neck must be covered | **Assessed on one growing end.** [Decision](../brainstorm/notes/DECISIONS_JOINT_COLLAR_20261125.md) | E02 or E03 supplies local data, or MATCH-B02 reports an obstruction caused by end placement or gauge. |
| [SP4-FOT-EXTRACT-E04](../research-plan/PLAN.md#sp4-fot-extract-e04) | Verify propagation or physical end identification | **Assessed up to an unprescribed intermediate scale.** [Proof](../notes/E04_DIAGONAL_END_20261125.md) | B03 freezes one chain or one cut with the necessary overlap or end data. |
| SP4-FOT-EXTRACT-B04 | Bridge the gap between independently located end comparisons. | Open research question. [Admission and test](../continuation-notes/AFTER_JOINT_COLLAR_RESEARCH_20261125.md) | Given two independently identified adjacent ends, decide whether a common conformal and spin gauge covers the intervening middle with summably controlled defects. Measure actual overlap transitions; if the two ends never meet, record the missing region and return to the cut alternative. |

## Recording a change

The designated lead records a dated decision, return, assessment or status change here with its evidence link and the actual settings available. Record failed hypotheses at the tested scale and preserve earlier IDs and request versions. Re-read the register before integration. The [parent register](../../research-progress/REGISTER.md) owns its existing tasks, and [the shared proof map](../../../brainstorm/notes/COLLAR_PROGRAM_AND_SPC4_20261125.md) identifies every collaborator. Historic proposals and dated handoffs do not own live status.

## Joint session assessment

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex. Lead requested as GPT-6.2 Astra, ultra. The lead runtime does not independently expose its serving variant or reasoning setting. Delegated checks explicitly select gpt-6.2-sol, ultra. Working checkout `cec037fa20d8b9e74636e4c313e802df9f71bd3d`. [Branch review](../reviews/JOINT_RESEARCH_REVIEW_20261125.md) · [Joint result and remaining global cases](../../../reviews/JOINT_COLLAR_ASSESSMENT_20261125.md) · [Continuation](../continuation-notes/AFTER_JOINT_COLLAR_RESEARCH_20261125.md). The original plan links preserve the initial prerequisites. The status column and proof links above record the results reached under the joint activation.
