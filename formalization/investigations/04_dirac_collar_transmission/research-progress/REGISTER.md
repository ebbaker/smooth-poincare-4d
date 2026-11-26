# Dirac transmission and chiral curvature · Progress register

## FOT-E46 · 26 November 2026

The closed scalar form bounds the Yamabe quotient on an actual cap, including equality with a positive-volume retained scalar region. This step uses the scalar conformal operator. The spinorial transmission program still requires the compatible trace maps and its own closed estimates. [Program assessment](../../reviews/FINITE_POSITIVE_POCKETS_AND_MARKED_SUCCESSORS_20261126.md)

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. The serving model variant and reasoning effort are unavailable.

This is the sole live status register for FOT-B04, FOT-E18–E24, FOT-E27 and FOT-E30–E33, with SPIN-E01 for the finite cover estimate. The parent register directs each inherited task here. [Task definitions and acceptance tests](../research-plan/PLAN.md) · [Overall overview 01](../../research-overview/01_OVERVIEW.md) · [Overall plan 01](../../research-plan/01_PLAN.md) · [Program register](../../research-progress/REGISTER.md) · [Verified baseline 01](../../research-progress/01_BASELINE.md)

## Version 01 tasks

The author activated this route on 25 November. Checked portions below have their public Lean types and axiom checks in the [integration return](handoffs/INTEGRATION_20261125.md). The geometric target retains its original ID when only a stated portion has been verified.

| Task | Status | Checked result or outstanding premise |
| --- | --- | --- |
| SP4-FORM-FOT-B04 | Local conventions adopted | [Positive spin representation, curvature sign, physical gauges, incoming signs and norm conventions](../brainstorm/notes/SPIN_CONVENTIONS_20261125.md). A global spin-bundle and trace-space realization remains open. |
| SP4-FORM-SPIN-E01 | Verified | The exact finite algebraic statement and measured overlapping corollary, with individual floors and uncovered energy. [Cover module](../../../FirstOrderTwistor/SpinCoverBounds.lean) |
| SP4-FORM-SPIN-E02 | Verified conditional accounting | Variable finite families on the physical remainder; weighted costs or direct normalized costs on joint nonzero loci. The latter gives energy equality from independent squared local budgets and uncovered smallness. A cutoff-square cover gives energy equality from the summed Bochner majorant, bounded curvature and independently small Ricci, relative fourth-power, cutoff and uncovered terms. [Route 02 handoff](../../02_neck_energy_accounting/research-progress/handoffs/INCOMING_ROUTE04_20261125.md) |
| SP4-FORM-FOT-E18 | Verified in a supplied local frame and measured-strip interfaces | Clifford kernel projection, signed curvature and Ricci contractions, actual coordinate derivatives with a moving frame and the Levi–Civita covector term, the chiral norm from the metric, and the cutoff derivative and integrated bounds. The bundle realization, independent estimates on the actual sequence and coverage remain. [Detailed assessment](../reviews/TRANSMISSION_AND_RESIDUAL_20261125.md) |
| SP4-FORM-FOT-E19 | Partial | Dense nonzero locus and continuity extend zero Weyl across zeros. Spin prolongation, regularity at zeros and smooth recognition on the same manifold remain. |
| SP4-FORM-FOT-E20 | Partial | Unit-mass reference kernel element and strong image subsequence in a supplied compact Hilbert gauge. Realize the transported Sobolev estimates, norm convergence and geometric limit on the given manifold. |
| SP4-FORM-FOT-E21 | Reserved | A prescribed Green pole, closed/relative invertibility, elliptic regularity and scale-normalized asymptotics are needed. |
| SP4-FORM-FOT-E22 | Verified fixed signed spectral model | The weak incoming inverse on the completed graph, modal and Hilbert-valued Sobolev solutions and both endpoint traces are checked. Its geometric realization on the unit-round spin bundle remains open. |
| SP4-FORM-FOT-E23 | Partial | Checked buffered derivative interpolation, Hölder operator bound and finite slab aggregation from measured coefficient/Sobolev inputs. Identify these coefficients from an actual marked strip and its spin comparison. |
| SP4-FORM-FOT-E24 | Partial | Neumann equivalence and quantitative norm bound on fixed spaces; endpoint scattering stability. Realize the trace domain and physical operator. |
| SP4-FORM-FOT-E27 | Reserved | Five-mode scalar Yamabe equality and recognition retain their separate geometric hypotheses. |
| SP4-FORM-FOT-E30 | Partial | Unique matching with affine shifts and supplied core graphs under the exponential return criterion. Construct the graphs for the two actual compatible core germs. |
| SP4-FORM-FOT-E31 | Partial | Continuous two-seam correction and uniqueness given four face maps, a bounded jump lift, closed inverse and zero-jump gluing. Realize the local trace and closed estimates on the original positive-Yamabe source. |
| SP4-FORM-FOT-E32 | Partial | The integrated critical-mass floor obstruction and its finite-family jump bound. The uniform closed critical Dirac estimate for actual regular fields remains an analytic input. |
| SP4-FORM-FOT-E33 | Partial | Weighted remote attenuation under an inverse estimate, same-end reflection for fixed-projector perturbations, and the exponential midpoint obstruction. Physical pole normalization and geometric transmission over an actual residual remain. |

[Issued packets](handoffs/ACTIVATION_20261125.md) · [Independent premise check](../reviews/RESIDUAL_PREMISE_CHECK_20261125.md) · [Dated continuation](../continuation-notes/AFTER_WEIGHTED_COVER_20261125.md)

## Second integration on 25 November

| Task | Current conclusion | Remaining geometric input |
| --- | --- | --- |
| B04 / E18 | The covector-twisted Dirac square and scalar quarter, the intrinsic four-index curvature bound, chart Green identities, metric-volume unweighted estimate and regularized inequality are checked. The physical-current version gives coefficient 816. | The frame algebra, inverse-metric derivative and graded curvature pairing are checked. Identify the local spin trivializations, tests and scalar norm pullbacks in the chosen annulus or supply the compact current with the stated normal first jets. |
| E18 / SPIN-E02 | Removing regularization bounds the positive-mass locus with finite relative costs. The derivative vanishes almost everywhere on the joint zero set in a realized compact metric chart. Its Weyl energy is charged in the original measure. A flat harmonic zero has logarithmically divergent relative cost. Adding a constant companion makes each budget finite, with divergence as the companion tends to zero. | Establish a small sum of Ricci, relative-gradient and cutoff costs, and small uncovered energy on the same sequence. |
| E22 / E24 | The weak modal equation is solved for arbitrary square-integrable forcing. The completed incoming graph is isometric to the data space. A single Hilbert-valued absolutely continuous representative gives both endpoint traces. Small fixed-domain perturbations preserve inversion. | Identify the model on the actual spin cylinder with its angular eigenbasis, geometric Sobolev norm and fixed trace maps. |
| E30–E33 | Existing graph, jump, regular-mass and attenuation estimates retain their previous hypotheses. | Supply actual core fields, normalized pole shifts, four face traces where needed, and the same physical smooth source. |

[Second verification return](handoffs/BOCHNER_AND_INVERSE_20261125.md) · [Derivation](../notes/ANNULAR_BOCHNER_AND_WEAK_INVERSE_20261125.md) · [Current continuation](../continuation-notes/AFTER_ANNULAR_BOCHNER_AND_WEAK_INVERSE_20261125.md)

## Setup evidence

On 25 November 2026 the opening proposition in the route plan elaborated as `Prop` using `lake env lean --stdin` under Lean `4.35.0-rc3`. The existing package built successfully (1,619 jobs). At setup, `FirstOrderTwistor.finiteCoverDefectBound` was a planned declaration. The table above records its later verification. [Checked proposition type](../research-plan/PLAN.md) · [Package pins and existing proofs](../../research-progress/01_BASELINE.md#lean-evidence)

The route lead records dated returns here, including the actual prover and effort when available. The program integrator owns shared build files, blueprint edits and FOT-E34. [Sustained continuation prompt](../continuation-notes/CONTINUATION.md) · [Platform roles](../../../FORMALIZATION_SETUP_WORKFLOW.md#platform-guidance)
