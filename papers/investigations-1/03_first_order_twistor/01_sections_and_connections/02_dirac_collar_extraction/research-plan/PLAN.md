# Research plan — Dirac collar extraction

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. Exact serving model and reasoning effort unavailable. [Inputs and versions](../../../brainstorm/notes/COLLAR_PROGRAM_AND_SPC4_20261125.md#inputs-and-versions)

## Starting choices

Begin with two independent questions. The chart calculation measures the regularity needed for the Dirac operator in a gauge already given. The geometric selection has to produce that gauge on the original sequence. An audited operator threshold can be inserted later into a bound already known to tend to zero. [Overview](../research-overview/OVERVIEW.md) · [Matching criterion](../../../02_dirac_and_twistor_spinors/01_dirac_collar_matching/research-overview/OVERVIEW.md) · [Shared proof route](../../../brainstorm/notes/COLLAR_PROGRAM_AND_SPC4_20261125.md)

| Geometric input | Comparison to attempt | Decision if the comparison fails |
| --- | --- | --- |
| One buffered nearly Euclidean chart | Write \(\Phi(t,\omega)=\rho_0 e^t\omega\), \(h=\rho^{-2}\Phi^*g\). Check \(\lvert\nabla^0 k\rvert\lesssim\rho\lvert Dv\rvert+\lvert v\rvert\) and \(dV_{h_0}=\rho^{-4}dx\) on each normalized slab. | Isolate frame or end terms and retain only the strips where interpolation applies. |
| Full embedded smooth ALE end with differentiated decay | Fix a large finite end radius and buffer, then take the sequence limit. Verify the actual spin embedding and weight at both ends. | Keep the conditional end estimate. Use a different block if the full-core transfer is missing. |
| Two concentration scales with small curvature on selected shells | Seek a chart or slice foliation with an explicitly transported spin frame. Use whatever link and volume information NECK actually established. | Check quotient topology, gauge drift and spikes individually. Pursue a varying-slice estimate if one product frame is too restrictive. |
| Good fixed strips with poor global agreement | Measure spin transitions, conformal weights, and low-mode mixing on overlaps. | Change end placement or use one strip for a cut. Report the loss as a function of total length. |

For a varying family, the relevant object is a unitary identification in which the operator is \(\partial_t+A_t+C_t\). One possible criterion has a tangential gap, uniform slice elliptic constants, \(|\langle u,\dot A_t u\rangle|\le\theta\|A_tu\|_2^2\) for \(\theta<1\), and a suitably small remainder. The matching branch tests whether these conditions give the asserted inverse. Extraction measures whether they hold and with what uniformity. If a finite set of eigenvalues approaches zero, record the low-mode dimension, its transport and the gap on the complement. [Original varying-slice question](../../../02_dirac_and_twistor_spinors/01_dirac_collar_matching/brainstorm/notes/RELAXING_COLLAR_HYPOTHESES_20261125.md) · [§14.3, metric chart](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L5466) · [§11.3, spherical-link hypotheses](../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L4047)

## Bounded research tasks

These are initial choices for an activated research session. Current status belongs to the [register](../research-progress/REGISTER.md). B decisions choose the mathematical route. Before an E check starts, freeze its source, hypothesis, method, finite scope, proof or counterexample criterion and disjoint output. The recommended model is given for each task. The selected lead retains responsibility for integration.

### SP4-FOT-EXTRACT-E01

**Calibrate one supplied buffered chart.** E proof check. Use logarithmic radius and the polar orthonormal frame to transform the interpolation estimate. Track the derivative of the frame, the conformal measure and the end buffers. Test the stated bound for \(\varepsilon_D\) independently of the physical radius.

**Inputs** — SEC §14.3 in one supplied Euclidean annulus with a buffered interior strip of normalized length at least two.

**Completion test** — One conditional estimate with its constants, strip length and missing hypotheses, using the original annular norm conventions.

**Revision** — B01 changes coordinates or selects another measurable norm if the conversion loses a scale.

**Recommended model** — gpt-6.2-sol/ultra. The coordinate change and one-scale inequality are specified.

### SP4-FOT-EXTRACT-B01

**Find a spin strip on the original sequence.** B decision. Choose a sequence and a route. For a full smooth ALE end, fix a sufficiently remote strip and transfer it by smooth convergence. For a budget-selected block, identify the missing chart, link and spin estimates. Choose end placement and track the physical and conformal gauges.

**Inputs** — The source band and candidates from a supplied full embedded smooth ALE end or a low-energy annular block. NECK-B01 data can be reused when available.

**Completion test** — A precise extraction claim and either an admissible fixed-width construction or a quantified obstruction to obtaining one from these premises.

**Revision** — Try another scale or method when curvature spikes or an inconsistent link prevent the construction. Send verified topology to NECK and observed bounds to MATCH.

**Recommended model** — Astra/ultra. The geometry and the type of attainable input are unknown.

### SP4-FOT-EXTRACT-E02

**Transfer one embedded strip.** E proof check. On the specified sequence construct the embedding of the strip and its buffers, identify the spin lift, label both ends and their physical scales, and bound \(\varepsilon_D\) or the agreed first-order norm. State the order of radius and sequence limits.

**Inputs** — B01 fixes a source and its geometric inputs. Use E01 if its chart estimate is needed.

**Completion test** — One reproducible fixed-strip estimate or the first unproved extraction step. Mark a conditional result if the embedding or end comparison was assumed.

**Revision** — B01 revisits the source or the conformal gauge. Refer a threshold mismatch to MATCH-B01.

**Recommended model** — gpt-6.2-sol/ultra. One source class and one collar hypothesis will be selected.

### SP4-FOT-EXTRACT-B02

**Choose attainable varying-slice data.** B decision. Compare a uniform tangential gap, a gap modulo finitely many low modes, and reselection of a smaller strip. Choose a unitary slice identification, measure normal variation and bound the lower-order remainder in the selected norms.

**Inputs** — Measured geometry from B01 or E02, or a specified model family, and a candidate operator criterion from MATCH-B01 or its original brainstorm.

**Completion test** — A common statement with MATCH specifying precisely what geometry would suffice, which constants are observable and which modes require explicit tracking.

**Revision** — If the end gauges drift, send the correction and its size to MATCH. Reopen B01 if a different representative or cross-section is geometrically preferable.

**Recommended model** — Astra/ultra. The available geometry may support an operator criterion far from a product metric.

### SP4-FOT-EXTRACT-E03

**Measure the agreed slice criterion.** E proof check. On that family verify the gap and uniform tangential elliptic estimate together with the required normal-variation and remainder bounds, or identify the low modes and compute the size of their mixing. Keep constants in the same unitary gauge.

**Inputs** — B02 names one family, one measured geometric input and one fixed criterion.

**Completion test** — A measured hypothesis that MATCH can insert into its proof, or the precise estimate and parameter where the geometric implication fails.

**Revision** — B02 revisits low modes, the slice identification or an attainable threshold.

**Recommended model** — gpt-6.2-sol/ultra. The geometric inequalities and candidate family will be fixed.

### SP4-FOT-EXTRACT-B03

**Decide how much of the neck must be covered.** B decision. For a cut choose the physical ends that meet the actual cap and core. For a long chain select compatible overlap identifications, spin transitions and conformal factors. Specify the quantity that must remain uniform or summable and who will use it.

**Inputs** — E02 or E03 supplies local data, or MATCH-B02 reports an obstruction caused by end placement or gauge.

**Completion test** — One propagation or end-placement test with a named global use and an explicit allowable loss.

**Revision** — A fixed-width construction can survive growing overlap drift. Try recentering, shortening or reslicing, or return a quantified residual to NECK.

**Recommended model** — Astra/ultra. Endpoint matching and length-uniform geometry need different choices.

### SP4-FOT-EXTRACT-E04

**Verify propagation or physical end identification.** E proof check. Test one propagation law through the specified overlaps, recording growth against length. Alternatively verify one transport of the spin and weighted trace spaces to the two actual ends.

**Inputs** — B03 freezes one chain or one cut with the necessary overlap or end data.

**Completion test** — A bound independent of total length for the claimed quantity, a length-explicit obstruction, or one verified fixed-cut identification under the stated assumptions.

**Revision** — B03 revisits the overlap cocycle, mode decomposition or target length. Send the measured limits to MATCH.

**Recommended model** — gpt-6.2-sol/ultra. The chain or cut, transport and target norms will be specified.

## Revisiting a construction

When a candidate chart fails, B01 records the blocked implication (link, embedding, spin lift or norm), and B02 can propose weaker slice data to MATCH. When end placement is the issue, B03 returns to B01 with the relevant actual trace or weight. A revision can replace the first construction while preserving the usable fixed-strip estimate. Preserve earlier task identities, counterexamples and issued requests. Date each changed premise, name the result and sibling that relied on it, and issue a fresh bounded request for the new case. Continue other ready paths. [Cross-branch revision procedure](../../../brainstorm/notes/COLLAR_PROGRAM_AND_SPC4_20261125.md#when-the-geometry-forces-a-revision) · [Neck geometry](../../01_neck_geometry/research-overview/OVERVIEW.md) · [Dirac collar matching](../../../02_dirac_and_twistor_spinors/01_dirac_collar_matching/research-overview/OVERVIEW.md)
