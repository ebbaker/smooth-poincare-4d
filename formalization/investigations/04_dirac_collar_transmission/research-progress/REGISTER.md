# Dirac transmission and chiral curvature · Progress register

25 November 2026 (America/New_York). Prepared for Edward B. Baker III with OpenAI Codex assistance. The serving model variant and reasoning effort are unavailable.

This is the sole live status register for FOT-B04, FOT-E18–E24, FOT-E27 and FOT-E30–E33, with SPIN-E01 for the finite cover estimate. The parent register directs each inherited task here. [Task definitions and acceptance tests](../research-plan/PLAN.md) · [Overall overview 01](../../research-overview/01_OVERVIEW.md) · [Overall plan 01](../../research-plan/01_PLAN.md) · [Program register](../../research-progress/REGISTER.md) · [Verified baseline 01](../../research-progress/01_BASELINE.md)

## Version 01 tasks

*Ready* means executable on activation. *Dependent* means a named design decision is needed. *Reserved* targets need the listed prerequisites and an exact proof packet.

| Task | Status | Dependency or next deliverable |
| --- | --- | --- |
| SP4-FORM-FOT-B04 | Dependent | Parent B01. Specify the spin, elliptic and boundary conventions. |
| SP4-FORM-SPIN-E01 | Ready | Finite aggregation with varying positive floors and explicit uncovered energy. |
| SP4-FORM-FOT-E18 | Reserved | B04, parent E02 and spin curvature. Prove the projected defect identity. |
| SP4-FORM-FOT-E19 | Reserved | B04, parent E03 and prolongation. Prove exact recognition including zeros. |
| SP4-FORM-FOT-E20 | Reserved | B04, E19 and elliptic compactness. Obtain a nonzero limit in the supplied gauge. |
| SP4-FORM-FOT-E21 | Reserved | B04 and index, relative invertibility and Green theory. Identify pole and end data. |
| SP4-FORM-FOT-E22 | Reserved | B04, round link spectrum and reference trace norms. Prove the incoming inverse. |
| SP4-FORM-FOT-E23 | Reserved | Parent B05, Route 02's E14 interpolation and EXTRACT-E01. Relate chart and operator norms. |
| SP4-FORM-FOT-E24 | Reserved | B04, E22 and MATCH-E02. Prove the fixed-domain perturbation. |
| SP4-FORM-FOT-E27 | Reserved | B04 and Yamabe variational/spectral results. Check the independent five-mode equality criterion. |
| SP4-FORM-FOT-E30 | Reserved | B04, parent B05, E21–E22 and positive capped Yamabe classes. Construct actual core graphs. |
| SP4-FORM-FOT-E31 | Reserved | B04, parent B05, E21, the conformal Dirac gap and physical seams. Solve the actual jump problem. |
| SP4-FORM-FOT-E32 | Reserved | B04 and the conformal Dirac gap, plus E31 for the application. Prove the critical mass bound. |
| SP4-FORM-FOT-E33 | Reserved | B04, parent B05, E22–E24 and E30 for gluing. Prove weighted attenuation and conditional matching. |

## Setup evidence

On 25 November 2026 the opening proposition in the route plan elaborated as `Prop` using `lake env lean --stdin` under Lean `4.35.0-rc3`. The existing package built successfully (1,619 jobs). `FirstOrderTwistor.finiteCoverDefectBound` is a planned declaration. Route proof execution awaits activation. [Checked proposition type](../research-plan/PLAN.md) · [Package pins and existing proofs](../../research-progress/01_BASELINE.md#lean-evidence)

The route lead records dated returns here, including the actual prover and effort when available. The program integrator owns shared build files, blueprint edits and FOT-E34. [Sustained continuation prompt](../continuation-notes/CONTINUATION.md) · [Platform roles](../../../FORMALIZATION_SETUP_WORKFLOW.md#platform-guidance)
