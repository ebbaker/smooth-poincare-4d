# Continue Route 02 after the covered-remainder identity

25 November 2026, America/New_York. For Edward B. Baker III with OpenAI Codex. Requested lead GPT-6.2 Astra at ultra. The lead serving configuration is unavailable. Bounded helper calls selected GPT-6.2 Sol at ultra. [Current register](../research-progress/REGISTER.md) · [Exact declarations and acceptance](../research-progress/handoffs/INTEGRATION_20261125.md) · [Compact two-jet energy theorem](../research-progress/handoffs/E17Q_RETURN.md) · [Geometric premise review](../reviews/GEOMETRIC_PREMISES_20261125.md) · [Original launch](CONTINUATION.md)

## Where to resume

The energy equality can now be derived from estimates on physical strips and the mass of their uncovered complement. On a fixed comparison domain the squared norm can now be computed from the actual Levi–Civita curvature in oriented tangent frames. The next geometric step is to derive locally bounded, measurable curvature densities on a compact truncation from smooth comparison data and combine these with the physical image maps. Finding such comparisons and covering the missing region between components are distinct problems.

| Task and type | Ready input | Next deliverable and test |
| --- | --- | --- |
| Parent E02 / Route 02 E17 · B03, then E | The actual tangent-frame curvature compression, four-slot reconstruction, Riemannian volume comparison and fixed-domain convergence theorems. | The normalized Gram–Schmidt frames converge pointwise. Construct measurable smooth frames on a finite chart cover, or prove regularity of the squared norm independently of arbitrary pointwise oriented frames. Derive a common integrable bound on the Jacobian times the full curvature square on the fixed compact set, then transport its mass by the actual image map. Use the available oriented-pullback results and keep constant rescaling explicit for bubble Ricci estimates. |
| E14 · E after freezing one geometric identity | Buffered interpolation on $\mathbb R^4$ and the checked scalar neck limit. | Prove the cutoff commutator or Euler defect in SEC §14.3 for $g=\delta+v$. Identify the terms in `msneck:euler-identity` and derive the chart estimate with constants independent of the radius ratio. |
| E15/E17 · E on supplied data | Integral bound from the signed flux, the chart/field sequence limits, and finite-cover accounting. | Derive `msneck:integrated` and its weighted contractions for an actual transverse field, or take a verified spinor strip bound from Route 04. Identify the part of the physical complement that each estimate pays for. |
| E11–E13 / E29 · B03 and E | Numerical one-end and residual implications, fixed truncations, free diagonal on one end. | Start with the scalar-flat Euler boundary limit or oriented full-core homology. Charge the gap to the prescribed adjacent component as uncovered until it has an estimate. |

## Continuation prompt

```text
Resume sustained Route 02 formalization in formalization/investigations/02_neck_energy_accounting in the smooth-poincare-4d checkout, with GPT-6.2 Astra/ultra lead and GPT-6.2 Sol/ultra helpers for frozen E packets. Read AGENTS.md, the formalization and model workflows, the route register, INTEGRATION_20261125.md and both premise reviews. Verify current sources and pins. Check sibling handoffs before editing a shared file.

Start at the fixed compact comparison in parent E02 and Route 02 E17. Read FrameCompression.lean, CurvatureCompressionBound.lean, CurvatureDensityLimit.lean, ConvergingFrames.lean, FixedMetricEnergy.lean, MetricJetEnergy.lean and the two metric/frame reviews. Reuse Route 03's GeometricChiralBlock.lean and ChiralFramePullback.lean for the actual curvature blocks and oriented transport. Examine the assumptions of the compact metric convergence theorem. Prove local measurability and uniform domination for a compatible frame field, or obtain them from a frame-invariant chiral norm. Construct the data on a finite chart cover with a measurable partition and transport the resulting energy to the physical image through RiemannianComparison.lean. Write the missing restriction or open-isometry naturality lemma if the existing global pullback statement requires it. Preserve the distinction between conformal comparison on the base and constant rescaling at a bubble.

In parallel, pursue the E14 first variation, cutoff commutator or Euler defect, or the E15 integrated current. If an estimate fails, record its missing hypothesis and try another ready branch. Energy equality is already available as energyIdentityOfCoveredRemainder and energyIdentityOfFullWeylStrips. Every physical application must account for the uncovered positive-chiral mass, including both ends and singular intermediate regions. Trace qualitative and uniform residuals separately, and retain the positive closed critical alternative.

Use disjoint files, check public types and axioms, build the blueprint and update the registers and dated handoff. Continue through a substantive assessed milestone.
```
