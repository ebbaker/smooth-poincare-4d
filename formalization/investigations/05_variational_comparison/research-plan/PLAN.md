# Fixed-type variational comparison · Research plan

25 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI Codex assistance. The serving configuration was unavailable. [Program plan](../../research-plan/02_PLAN.md) · [Source and package revisions](../../research-progress/02_BASELINE.md) · [Blueprint](../../../blueprint/src/master_variational.tex) · [Sole VAR register](../research-progress/REGISTER.md)

## First bounded proof

**SP4-FORM-VAR-E01.** Use `SmoothPoincare/Variational/Replacement.lean` with public target `SmoothPoincare.repairedMass_le_excess_sum`. The following is its proposition, expressed for any admissible set so the finite proof can also be used on the geometric set. `e ∈ A` witnesses entry. `c j ∈ A` refers to the individual repaired metric on the same smooth type. [Manuscript `prop:replacement`](../../../../papers/master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex) · Blueprint `prop:master-replacement`.

~~~lean
import SmoothPoincare
open scoped BigOperators

#check (∀ (J : Finset ℕ) (A : Set ℝ) (e : ℝ) (m γ c : ℕ → ℝ),
  BddBelow A → e ∈ A →
  (∀ j ∈ J, c j ∈ A) → (∀ j ∈ J, c j ≤ e - m j + γ j) →
  (∑ j ∈ J, m j) ≤ (J.card : ℝ) * (e - sInf A) + ∑ j ∈ J, γ j)
~~~

Use `csInf_le` for each \(c_j\), rearrange, and sum. Relabeling the finite family by natural numbers covers variable cardinalities. In the geometric corollary take `FirstOrderTwistor.geometricPositiveEnergies` and construct the membership witnesses from the supplied actual metrics, their positive Yamabe constants, curvature frames and integrals. Use `geometricEnergy_mem_of_pullback` when the marked repair is presented on a diffeomorphic source. Test \(J=\varnothing\), exact minimization, and a nonzero net cost. The manuscript's nonnegative mass and surcharge assumptions hold in the application; the scalar inequality also holds for signed entries. Return to B01 if any application uses the bare real infimum before a positive metric is given.

## Decisions and subsequent packets

The file paths below are relative to `formalization/SmoothPoincare/`. Names are proposed declarations. Check each public type against the cited manuscript and the listed blueprint node when freezing the packet.

| ID | Finite decision or target | Proof test and return on failure |
| --- | --- | --- |
| VAR-B01 | Adopt the witnessed real-energy model for E01. Specify the comparison with the intrinsic manuscript energy and, for universal entry, an extended nonnegative energy infimum. | Witness positivity and integrability before taking a real infimum. Coordinate arbitrary-frame and conformal laws with parent FOT-B01/E02. Reopen on a changed variational domain or sign convention. |
| VAR-E02 | `Variational/YamabeWall.lean`, `positiveAlongSubcriticalPath`. From `eq:zero-wall` to `lem:master-wall` on the joined smooth type. | First prove the sign implication from the zero-class wall and continuity of the first eigenvalue. Then instantiate scalar-flat Yamabe representation, conformal invariance and the geometric Euler/signature identities. Publish the two levels separately if the geometric inputs are pending. Route 03 uses the uniform lower bound along its length-parameter path. |
| VAR-B02 | Choose a common real \(L^2\) space for the two matrix densities on each oriented chart and specify weak convergence, cutoffs and the uniform error in \(s\in[0,1]\). | The comparison gauge, fixed compact and actual closed transplant must be visible. Reopen if a proof needs strong second jets or assumes strong chiral convergence. |
| VAR-E03 | `Variational/Defect.lean`, `weightedDefect_tendsto_zero`. Within `thm:local-min` / `thm:master-local-replacement`, prove the weak cross-term and weighted square calculation from a fixed test, bounded weakly null defect and uniform interpolation error. | Show \(\int(2\chi-\chi^2)|r_i|^2\to0\) using the near-minimizing competitor and control the unweighted defect where \(\chi=1\). Both the competitor estimate and its geometric proof are visible to the caller. |
| VAR-E04 | `Variational/LocalReplacement.lean`, `localReplacementAtInfimum`. Realize E03 on the metrics of `thm:local-min`, using E02 and the all-lowered curvature calculation shared with CUT-E03. | Fix compact domains before the source limit. Transplant with \(u_i^2\), estimate the chiral projections in \(m_i\), install \(h\), then vary on the region of exact installation. Obtain both local strong limits and small-variation minimality. Identify the separate compact first-variation theorem used for \(B_h=0\). |
| VAR-E05 | `PhysicalScales/Quantiles.lean`, `chiralQuantileAlternatives`. Formalize the paragraph after `cor:energy-radius` in `lem:master-quantiles`. | On compact smooth sources derive ball-mass continuity and attainment from null metric spheres. First a measure-level proof may take these as explicit inputs. For separated radii select the attaining inner center and the full median exterior about it. From \(n\) disjoint annuli and total full mass \(C\), obtain one with mass at most \(C/n\). Test the diffuse conclusion with its iterated limit. |
| VAR-E06 | `Variational/RepairResidual.lean`, `energyBoundOfRepairFamily`. Use `prop:joint-vol`, `cor:vol-reduction` and E01 for the aggregate comparison in `problem:master-realization`. | At each fixed tolerance charge aggregate costs and all complementary mass. Permit the subsequence and bound on \(N_i\) to depend on the tolerance. Apply an independent modulus of absolute continuity or an explicit residual bound. Escaping, nonregular and excluded atomic mass remain in the statement when uncontrolled. |
| VAR-B03 | Audit coherent whole-domain markings, critical regularity and end theorems for `cor:whole-base`, `thm:complete-limit` and their physical scale corollaries. | Partition whole-base, complete shrinking limit and closed attainment into separate theorem statements. Decide which imports prove each smooth/weak transition, end topology, removal and strict Yamabe comparison. Escalate genuine extraction or closed rigidity to the paper owners. |
| VAR-E07 | `PhysicalScales/CompleteLimits.lean`, `flatOfCompleteMarkedLimit` and `vanishingOnPeakScaleBalls`. Compose the frozen B03 vanishing-scale chain under `problem:master-realization` after E04 and the marked end-cut inputs. | Use an exact equation on the limit, a strict end residual and full-side comparison at fixed truncation before exhaustion. Obtain the supremum over centers for each fixed multiple of the peak scale. Report any remaining formal dependency and separate the bounded-curvature closed case. |
| VAR-E08 | `PhysicalScales/RicciScales.lean`, `vanishingOnRicciControlledWindows`. Test `lem:ricci-radius` and `thm:ricci-scale` after a B03 compactness audit. | For fixed \(2<p<\infty\), require \(a_i^{2-4/p}\|\mathrm{Ric}_{0,g_i}\|_{L^p(B(x_i,Da_i))}\le C_D\) for every required fixed \(D\) on the same subsequence. Distinguish the interior chart estimate in the band from the minimizing-sequence vanishing theorem. Retain first-exit inclusion of whole source balls and require a new argument at \(p=2\). |

The two first tasks that can proceed independently on activation are E01 and the measured selection in E05. B02 and Route 03's curvature commutator prepare the analytic work. Once a bounded proof is integrated, inspect the next dependency and reopen the relevant B choice if the geometric statement needs to change. Use the [formalization workflow](../../../FORMALIZATION_SETUP_WORKFLOW.md) for public import checks, axiom output and blueprint acceptance.
