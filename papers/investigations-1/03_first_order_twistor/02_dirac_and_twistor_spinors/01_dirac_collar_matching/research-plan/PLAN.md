# Research plan — Dirac collar matching

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. Exact serving model and reasoning effort unavailable. [Inputs and versions](../../../brainstorm/notes/COLLAR_PROGRAM_AND_SPC4_20261125.md#inputs-and-versions)

## Starting choices

Audit the round product and develop a more flexible candidate criterion independently. The near-product test uses the fixed model spectral domain, so it can proceed on an abstract collar before extraction has produced a physical example. Actual gluing adds the Cauchy data of the two interiors. Only after normalization and derivative control does a matched spinor give information about Weyl energy. [Overview](../research-overview/OVERVIEW.md) · [Original model calculation](../brainstorm/notes/RELAXING_COLLAR_HYPOTHESES_20261125.md) · [Shared proof route](../../../brainstorm/notes/COLLAR_PROGRAM_AND_SPC4_20261125.md)

| What is available | Estimate or construction to test | What can be changed |
| --- | --- | --- |
| Round or first-order near-product strip with labelled ends | With \(P_+u(a)=P_-u(b)=0\), use the gap and the signs of the boundary terms for \(\partial_t+A\), then perturb on the same domain. | Change boundary projections or isolate a finite low-mode space after checking the adjoint and its range. |
| Smoothly varying slice metrics | In a unitary frame integrate the term \(-\int\langle u,\dot A_tu\rangle\). Test uniform ellipticity, a gap, control by \(\theta\|A_tu\|^2\) with \(\theta<1\), and small lower-order terms. | Track crossings explicitly, or request a different slicing or shorter strip. |
| Actual core and cap traces | Identify the collar solution graph and the two Cauchy spaces in the same weighted \(H^{1/2}\) norms. Test transversality and any finite-dimensional corrections. | Move a cut, change normalization, or project away precisely identified kernel directions. |
| Matched fields | Estimate a joint lower bound and the **total** differentiated twistor defect on the required region. Alternatively test nondegenerate compactness on \(M\). | Use several fields or another gauge. Return oscillation or decay to the branch capable of changing the input. |

The round energy identity has boundary contribution \(\langle u(b),Au(b)\rangle-\langle u(a),Au(a)\rangle\). Both signed terms are nonnegative for homogeneous **incoming** traces in this convention. On a long product even a harmonic mode decaying from one end can be exponentially small in the middle. Distinguish invertibility, actual boundary matching and a pointwise lower bound for the resulting fields throughout. If the curvature route succeeds with \(\sum|\psi_a|^2\ge c^2\), its local consequence is
\[
 E_+(U)\le 2c^{-2}\sum_a\int_U|\Pi(d^\nabla T_a)^+|^2\,dV.
\]
If the summable chiral bounds exhaust the remainder, check the resulting \(E_+\) identity directly in SEC §12.4. A claim of full tensor control on one collar also requires the \(W^-\) contribution. [§2.3, identity](../../manuscript/dirac_twistor_and_yamabe_rigidity.tex#L276) · [§4.4, oscillatory obstruction](../../manuscript/dirac_twistor_and_yamabe_rigidity.tex#L780) · [§12.4, energy accounting](../../../01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L4639)

## Bounded research tasks

These are initial choices for an activated research session. Current status belongs to the [register](../research-progress/REGISTER.md). B decisions choose the mathematical route. Before an E check starts, freeze its source, hypothesis, method, finite scope, proof or counterexample criterion and disjoint output. The recommended model is given for each task. The selected lead retains responsibility for integration.

### SP4-FOT-MATCH-E01

**Invert the round cylinder boundary problem.** E proof check. Derive the signed boundary identity for \(\partial_t+A\), solve the modes from the prescribed ends and pass to \(L^2\) data. Check the complementary adjoint domain, range and \(H^{1/2}\) trace lifting in fixed end strips.

**Inputs** — The supplied unit round product of any length at least two and the fixed incoming spectral projections.

**Completion test** — An \(H^1\) estimate, surjectivity and inhomogeneous trace bound with constants independent of length, or the specific domain or mode on which the claim fails.

**Revision** — B01 revisits the normal convention, boundary domain or required finite-dimensional projection.

**Recommended model** — gpt-6.2-sol/ultra. The operator, spectrum, endpoint projections and proof method are given.

### SP4-FOT-MATCH-E02

**Perturb the fixed-projection inverse.** E proof check. Identify spin bundles by the symmetric frame isometry. Bound principal and lower-order differences on unit slabs by \(\varepsilon_D\) in \(H^1\to L^2\) and sum with bounded overlap. Perturb the reference inverse on its fixed domain and track trace lifting.

**Inputs** — E01 and the smooth model comparison in the matching brainstorm.

**Completion test** — A sufficient uniform \(\varepsilon_*\) with its dependence, domains and trace norms clearly stated, or the term that prevents absorption. Send the criterion to extraction.

**Revision** — B01 may replace the product comparison or change the trace criterion after recording the failure.

**Recommended model** — gpt-6.2-sol/ultra. The perturbation argument and target operator norm are fixed.

### SP4-FOT-MATCH-B01

**Select a more flexible transmission criterion.** B decision. Choose among the near-product model, a varying self-adjoint tangential family with a controlled time derivative, or a high-mode estimate plus transport on a finite low-mode space. Specify domains, endpoint projections, remainder norms and adjoint requirements.

**Inputs** — A supplied slice family or the round benchmark. Geometric feedback from extraction is useful whenever available.

**Completion test** — One sufficient criterion to test, a model or example discriminating it from alternatives, and the geometry to measure.

**Revision** — If a mode crosses zero, analyze the finite system or reselect a strip with extraction. Restrict only the tested class.

**Recommended model** — Astra/ultra. The product model may impose stronger geometry than transmission needs.

### SP4-FOT-MATCH-E03

**Test one varying-slice or low-mode estimate.** E proof check. Derive the energy identity and adjoint estimate for one supplied family, or solve the specified low-mode transport and its complement. Track boundary terms, range and length dependence.

**Inputs** — B01 fixes one criterion with domain and adjoint. Extraction data are needed only for an application to its actual family.

**Completion test** — A conditional inverse or a length-explicit obstruction with the exact mode and hypothesis. Return the usable criterion to extraction.

**Revision** — B01 reopens the criterion if normal variation, spectral flow or an adjoint kernel prevents the desired estimate.

**Recommended model** — gpt-6.2-sol/ultra. The chosen equation, finite-dimensional conditions and success test will be fixed.

### SP4-FOT-MATCH-B02

**Formulate the actual core and cap trace problem.** B decision. Express gluing as equality of weighted traces after normal and spin identifications. Choose a quantitative transversality or right-inverse estimate, normalization of poles, and treatment of kernels and cokernels. Check for overlap with parent DIR-B24/E51 before issuing a test.

**Inputs** — E01, E02 or E03 for the chosen collar, and specified adjoining pieces with their Cauchy trace spaces or a defined model for them.

**Completion test** — One specified end-data problem and the estimate needed on the adjoining geometries. Mark supplied Cauchy spaces and genuinely constructed ones separately.

**Revision** — If the angle degenerates, identify the bad space. Consider a finite correction, another end position with extraction, or a different cap normalization.

**Recommended model** — Astra/ultra. Admissible boundary data depend on the interiors and the global normalization.

### SP4-FOT-MATCH-E04

**Glue one family of actual traces.** E proof check. Solve the stated trace equation with the collar map, account for kernels and any compatibility conditions, and propagate the correction through the end identifications. Give a uniform bound or an explicit sequence of nearly unmatched traces.

**Inputs** — B02 freezes one family, its actual or explicitly modeled spaces, and one matching estimate.

**Completion test** — One gluing result at its exact evidence level or one quantified loss and its bad directions. Identify what is known for a cap pole and for the retained core separately.

**Revision** — B02 changes the projection, cap or physical end in response. A result with model traces stays conditional on realization.

**Recommended model** — gpt-6.2-sol/ultra. The trace equation, family and correction spaces will be fixed.

### SP4-FOT-MATCH-B03

**Choose a spinorial output that reaches recognition.** B decision. Assess several fields with a joint lower bound, locally normalized fields with controlled overlap, or a nonzero exact twistor limit in a smooth compact gauge on the fixed manifold. Specify which differentiated estimate and chirality are obtainable.

**Inputs** — E04, a supplied exactly matched field family, or a scoped obstruction to normalization.

**Completion test** — A finite curvature or attainment test with the remaining global inputs identified, referring missing geometrical data to extraction or NECK.

**Revision** — If damping, zeros or oscillation invalidate the bound, change the family or gauge, or return the missing derivative to the parent Dirac program.

**Recommended model** — Astra/ultra. A first-order inverse alone does not select a normalized field or control its curvature defect.

### SP4-FOT-MATCH-E05

**Check one curvature or attainment implication.** E proof check. For one collar family integrate the projected derivative identity with the joint lower bound and track total error through its full length. Alternatively verify one application of DIR §3.3 with nonzero limit and smooth recognition on the same manifold.

**Inputs** — B03 supplies the chosen family, its normalization and differentiated bounds, or the exact fixed-manifold compactness inputs.

**Completion test** — A chiral energy estimate over the identified region or a conditional global attainment implication, with all assumptions indicated. State any missing opposite-chirality bound or complement before invoking full accounting.

**Revision** — B03 revisits the output when the defect accumulates, normalization degenerates or compactness changes the underlying smooth manifold.

**Recommended model** — gpt-6.2-sol/ultra. One identity or one existing compactness proposition and its input family will be chosen.

## Revisiting a construction

If the inverse fails, B01 can isolate a finite-dimensional mode or weaken the geometry. If the inverse succeeds but actual Cauchy data almost fail to match, reopen B02 and request a correction or a new cut. If the matched fields become too small or too oscillatory, reopen B03. Keep the established inverse at its original strength while changing the attempted application. Preserve earlier task identities, counterexamples and issued requests. Date each changed premise, name the result and sibling that relied on it, and issue a fresh bounded request for the new case. Continue other ready paths. [Cross-branch revision procedure](../../../brainstorm/notes/COLLAR_PROGRAM_AND_SPC4_20261125.md#when-the-geometry-forces-a-revision) · [Neck geometry](../../../01_sections_and_connections/01_neck_geometry/research-overview/OVERVIEW.md) · [Dirac collar extraction](../../../01_sections_and_connections/02_dirac_collar_extraction/research-overview/OVERVIEW.md)
