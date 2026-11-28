# First research sequence for SP4-TWA

28 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Actual serving variant and reasoning effort unavailable. Planning baseline `86b24d9f9c2d` plus the [pinned working-tree inputs](../references/README.md). This dated sequence gives proposed scope. Read the [sole live register](../research-progress/REGISTER.md) for readiness and evidence.

Use \(S_g=J_g^4\) and the [overview conventions](../research-overview/OVERVIEW.md). After activation the recommended lead for B decisions is GPT-6.2 Astra at ultra. Use authorized bounded GPT-6.2 Sol at ultra for E packets with fixed methods and targets. Preserve the author's selected lead and record actual settings separately. Freeze each packet before dispatch with input versions, hypotheses, limits, assigned files and a completion test. Independent packets have disjoint outputs. Only the lead integrates evidence in the register and draft history.

| ID and recommendation | Prerequisites and reason for routing | Bounded deliverable, evidence and completion test | Next decision if the approach fails |
| --- | --- | --- | --- |
| TWA-E01 · E · Sol/ultra | Begin on activation. The fixed-background variation, normalization and weights have fixed inputs and formulas to replay. | `notes/E01_VARIATION.md`. Reconstruct the real first variation on one arbitrary smooth compact zero-free spin domain, including both bulk factors, outward boundary momentum, conformal weight, the induced spinor scale, and fourth-order onset at a nonvanishing twistor solution. Check Clifford trace and signs and state the uniform nonvanishing hypotheses for the expansion. Complete with a replayable derivation or a precise discrepancy in the inherited formula. | Send any unresolved change in the field or trace space to TWA-B01. |
| TWA-E02 · E · Sol/ultra | Begin on activation, independently of E01. The periodic flat cylinder and its radial ansatz are fixed. | `notes/E02_FLAT_TORUS.md`. Replay the \(L>0\), \(V>0\) cylinder and the real log-radius endpoint graph for all \((u_0,u_1)\in\mathbb R^2\). Check stationarity under arbitrary smooth fixed-end variations, the momentum sign conventions and the diagonal \(u_0=u_1\), including the singular inverse of the radial velocity-momentum map. Complete with the explicit generating function, signed graph and the scope of the control. | Send unresolved extensions beyond the radial endpoint data to TWA-B01. |
| TWA-E03 · E · Sol/ultra | E01. A punctured-ball estimate has a fixed method once the first-variation tensor is available. | `notes/E03_FIXED_JETS.md`. In one coordinate ball with one transverse Clifford-compatible zero, use smooth one-parameter variations fixing the zero and its first jet. Bound the differentiated density uniformly near the zero and the outward terms of excising balls of radius \(r\to0\). Compare with one incompatible transverse jet. State precisely what extends to finitely many such zeros by localization. Complete with domination and flux estimates that justify the stated limit or give a failure in that class. | Take moving zeros and variable jets to TWA-B01 if those extensions matter to the intended cut. |
| TWA-B01 · B · Astra/ultra | E01 and E03. The field and trace spaces, solution class and regularity target are choices of geometric and analytical object. | `brainstorm/notes/B01_BOUNDARY_PROBLEM.md`. Fix one smooth spin collar and one class of variations per admitted zero. Specify a trace space and dual, normal measure conventions, intended weak or smooth stationarity and the test for isotropy. Limit to a smooth fixed collar with nonzero trace and one target for interface regularity. Complete with a freezeable E04 or identify the first missing premise and retain the finite-dimensional test. | Keep the radial control available if a full trace space or zero class cannot yet be justified. |
| TWA-E04 · E · Sol/ultra | E02 and the B01 collar specification. Algebraic and first-variation gluing are fixed tests. | `notes/E04_GLUING.md`. Join two periodic flat cylinders with the same \(T^3\) and compare the stationary elimination of the common log radius with the single longer cylinder. Include both unequal and equal outer endpoints. Then prove or delimit seam trace and outward-momentum cancellation for one smooth collar in the B01 class. Check separately any claimed weak extension, smooth interface regularity and clean composition. Complete with the two-case explicit comparison and a gluing statement with its exact premises. | Send a regularity or clean-composition obstruction to TWA-B02. Retain the explicit finite-dimensional statement. |
| TWA-B02 · B · Astra/ultra | E04. Choosing an ambient symplectic manifold, embedded ends and a geometric candidate is conceptual. | `brainstorm/notes/B02_COBORDISM.md`. Test at most one explicit finite-dimensional target, one strip or plane factor and one choice of cylindrical Lagrangian ends. Compare the intended geometric cobordism with the canonical boundary relation and identify which extra hypotheses any Floer application would use. Complete with an explicit candidate and E05 request or an assessed missing premise or scoped obstruction. | Keep the boundary relation as the output and record the precise cobordism question still open. |
| TWA-E05 · E · Sol/ultra | Reserved unless B02 chooses an explicit candidate and source claims. Checks then have fixed geometric inputs. | `notes/E05_COBORDISM_CONTROL.md`. Verify dimension, isotropy, embedding, properness and the specified cylindrical ends for that candidate. Check exactly the cited definitions and any theorem hypotheses used. Complete with a geometric statement or a failed hypothesis on that candidate. | Return the failed hypothesis to TWA-B02. |
| TWA-B03 · B · Astra/ultra | Optional after E01 and a named analytical bottleneck. The relevance of a background scale and the comparison target need a decision. | `brainstorm/notes/B03_QUADRATIC_COMPARISON.md`. Choose one positive prescribed scale \(\rho\) and one quartic control of direct relevance to that bottleneck. Fix exactly which boundary data and regularity assumptions are shared. Complete with a justified decision to issue E06 or keep the scope wholly quartic. | Preserve the quartic result if the added scale changes the comparison being sought. |
| TWA-E06 · E · Sol/ultra | Reserved unless B03 fixes the data and question. The quadratic calculation then has a fixed operator and comparison. | `notes/E06_FIXED_SCALE.md`. Check the weighted quadratic Hessian, boundary momentum and positivity or degeneracy on the one B03 control. Record the effect of the prescribed scale and admissible zeros. Complete with a replayable calculation and a circumscribed comparison to E01–E04. | Send any unexpected need to vary \(\rho\) or to change the target back to TWA-B03. |
| TWA-E07 · E · independent Sol/ultra | After a finite set of E returns is frozen. Replaying a specified proof or control is a fixed request. | `reviews/E07_REPLAY.md`. A reader who authored none of the claims under review checks normalization, boundary signs, zero conditions and the strongest gluing or cobordism claim for the completed sequence. Freeze one set of written claims and source passages. Complete with an evidentiary disposition and exact formal statement where possible. | Return gaps to the owning B task and request formalization only for statements with fixed hypotheses. |

The first sequence ends with the strongest independently assessed fixed-background and boundary result, and either a checked geometric cobordism control or a scoped obstruction or named missing input. An optional comparison can clarify a specific obstruction without changing the primary action. A useful successor should address a precise open statement about trace regularity, composition or symplectic realization. Metric independence, cut invariance and a closed smooth-type test require additional arguments and a separate handoff to the [invariants owner](../../02_invariants/README.md). Follow the [series evidence conventions](../../../README.md#how-sessions-work-in-this-series) and request Lean work by handoff for an exact statement. [Activation prompt](../continuation-notes/CONTINUATION_20261128.md)

## Activated extension on the same collar · 28 November 2026

| Task | Dependency and finite target | Completion or return |
| --- | --- | --- |
| TWA-B04 · B · Astra/ultra | Choose a full-trace neighborhood of one nonzero-slope radial field where the quartic Jacobi problem might be invertible. | [Choice and proof strategy](../brainstorm/notes/B04_LOCAL_DIRICHLET.md). |
| TWA-E08 · E · Sol/ultra | Use B04 on the length-two unit torus cylinder, at slope 1/200. Test coercivity, Dirichlet regularity and local smooth dependence. | One local full-spinor graph or its first failed estimate, then E07 replay. |
| TWA-B05 · B · Astra/ultra | E02 separates nonattainment of zero from a positive infimum at unequal constant ends. | [Use the affine amplitude extension](../brainstorm/notes/B05_UNEQUAL_TRACE_GAP.md). |
| TWA-E09 · E · Sol/ultra | B05, fixed endpoints and flat periodic cylinder. | Derive a quantitative lower bound over all admissible smooth spinors on this cylinder and bracket the infimum with the radial trial. Escalate a failed bound to B05. |

### Closing the remaining part of the same seam

| Task | Dependency and finite target | Completion or return |
| --- | --- | --- |
| TWA-B06 · B · Astra/ultra | E04 leaves open the interior of the zero-defect seam set. | [Use the tangential twistor jet and the first nonzero normal Taylor coefficient](../brainstorm/notes/B06_ZERO_DEFECT_TRANSMISSION.md). |
| TWA-E10 · E · Sol/ultra | B06 and E04. | Test the all-order transmission proof on the same flat seam only, then obtain independent replay. |

### Next fixed-cylinder question

| Task | Dependency and finite target | Completion or return |
| --- | --- | --- |
| TWA-B07 · B · Astra/ultra | Use E07's conclusions and the exact unequal traces specified in the [closing note](../continuation-notes/CLOSING_20261128.md). A global proof strategy remains to be chosen. | A direct comparison, a justified compactness route into the local neighborhood, or one concrete competitor test. |
| TWA-E11 · E · Sol/ultra | Reserved for B07's fixed inputs and evidence standard. | Prove the frozen comparison or record its precise failure and return to B07. |

### Global comparison at the prescribed trace pair · 28 November 2026

| Task | Dependency and method | Output and completion |
| --- | --- | --- |
| TWA-B07 · lead | Prior local/global results and closing question. Use the radial amplitude to conjugate, then bound a quadratic quotient globally. | [Decision](../brainstorm/notes/B07_GLOBAL_COMPARISON.md). |
| TWA-E11 · Sol/ultra | B07, conditional on \(\|v\|_4\le24\|\nabla v\|_2\). Check Hölder, Taylor remainder, cancellation, coercivity, equality and sequence topology. | [Frozen comparison](../research-progress/handoffs/E11_REQUEST_v1.md). Return any failed estimate at its stated scope. |
| TWA-E12 · Sol/ultra | Independent of E11. Check the Euclidean constant, cutoff, supports and absorption at \(b=1/200\). | [Frozen product bound](../research-progress/handoffs/E12_REQUEST_v1.md). |
| TWA-E13 · independent Sol/ultra | Both written proofs and numerical constants. | Replay the complete unrestricted result and its equality conditions; request exact formal statements. |

### Varying the symmetric logarithmic end data · 28 November 2026

The author reopened the trace-data question on the same product. [B08 decision](../brainstorm/notes/B08_SLOPE_AND_HELICITY.md) · [Sole register](../research-progress/REGISTER.md)

| Task | Method and finite question |
| --- | --- |
| E14–E17 | Compute the first full Dirichlet Hessian crossing. Relax the first helical wave, improve E12's coercivity constant, and obtain an unrestricted comparison from polar variables, including the compatible zeros. |
| E18, E22 | Test two equal perpendicular critical waves with four time levels of each parity. Replay the exact coefficient and a periodic lower certificate for the full second-order correction. |
| E19–E21 | Independently replay the spectrum, polar bound, interval structure, prescribed-norm comparison and compactness of a putative sequence losing the global bound at \(17\pi/8\). |
| E23–E24 | Use the one- and two-wave coefficients, translations and the symmetry of the cubic torus to test positivity on the entire first kernel. Replay the \(C^1\)-local estimate at the degenerate crossing. |
| E25 | Check the action excess and strong physical \(H^1\) convergence on interior slopes by uniform convexity at the known global endpoint. |

The unresolved comparison is the unrestricted one at the single slope \(51\pi/16\). Equality of the global and local thresholds is equivalent to the endpoint inequality for every admissible normalized field. A strict competitor there certifies a subthreshold interval by continuity. The full spatial first-shell quartic and the fixed pointwise norm comparison constrain any such construction.
