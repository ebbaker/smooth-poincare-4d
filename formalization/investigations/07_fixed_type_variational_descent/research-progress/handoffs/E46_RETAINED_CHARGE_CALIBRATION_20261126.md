# E46 · Calibrating two charges on disjoint sites

26 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. Actual serving model and effort telemetry were unavailable. The bounded proof uses equations (3) and (4) of the [source derivation](../../../../../papers/investigations-1/05_collar_deformation_and_surgery/notes/RETAINING_THE_TWO_CORE_CHARGES.md) at SHA-256 `6f437054a3a038cf9bb45da544e4f28c97ff9e682438affa75a7ee872770a64c`.

Fix a single smooth oriented compact source and a finite pairwise disjoint family of measurable sites inside the protected measurable region. For each site use its actual positive chiral charge as a function of the amplitude. A verified two-sided first and second derivative lets the amplitude be reflected according to the sign of the initial first derivative. This makes the starting slope nonnegative and preserves the same strictly positive second-derivative floor $c$. A mean value argument gives a site increment of at least $ca^2/2$ at amplitude $a\in[0,b]$ and strict increase on that interval. Each signed site metric agrees with the source on its entire complement, in the same oriented frame there. Closed signature and this complement agreement give the same site increment in both signs. The Lean proof uses the equality of the two closed chiral energies carried by each `SignedCollarMetric`. [Signature and the project normalization](../../../../../papers/master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex)

The sum $\kappa$ of the actual site increments is continuous and monotone and starts at zero. If $0\leq K\leq |J|cb^2/2$, the theorem chooses an amplitude with $\kappa(a)=K$. A positive target has a unique positive amplitude. At a zero target the theorem takes amplitude zero and the resulting metric equals the original metric. The empty family is permitted in the zero case.

At all intermediate amplitudes the same $\kappa$ is added to the physical charge of each chirality on the full site union, the protected region, and the closed source. Every measurable subset of the complementary region retains its entire signed charge. In particular neither protected chiral charge drops below its incoming value. The signed assembly has actual matched metric germs and oriented frames on each site and on the complement. Smooth metric-level assembly itself is verified for the sum of symmetric tensor directions normalized by the source metric and supported in closed subsets of disjoint open sites. The clamped interval has radius $1/2$, and each direction may incorporate its selected sign. Signed integrability, the closed signature equality, and the matched frame choices for these metrics remain in the supplied signed data. The source-specific second-variation floor and the finite family capacity remain hypotheses. Later cuff, transport and capping stages use separate results.

| Checked declaration | Function |
| --- | --- |
| `charge_increment_of_secondVariation` | Quadratic lower bound and strict increase from derivatives |
| `exists_chargeCalibrationDirection` | Actual sign choice from two-sided derivatives |
| `exists_disjointAffineMetricRamp` | Smooth positive metrics with actual matched germs |
| `exists_retainedChargeCalibration` | Common amplitude and complete two-sign ledger |

[Lean module](../../../../SmoothPoincare/Variational/RetainedChargeCalibration.lean)

The targeted Lake build passed under Lean `4.35.0-rc3`, DifferentialGeometry `788efe97894474c032de6dfb1289d515f613d15a`, and Mathlib `c55e6e786f49471c72fbddbec5415808896aec1e`. Axiom checks on the four declarations reported `propext`, `Classical.choice`, and `Quot.sound`.
