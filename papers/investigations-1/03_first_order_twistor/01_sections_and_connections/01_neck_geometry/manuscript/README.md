# Marked necks and chiral Weyl energy on smooth homotopy four-spheres

Working manuscript by Edward B. Baker III, 25 November 2026, with OpenAI Codex assistance. The original treatment covers buffered caps and smooth-type descent, exact and approximate cut extraction, one-puncture restart, and the closed critical alternatives. The physical-shell revision proves the whole-side marking and short-cap implication for a supplied anchored source chart on one separated minimizing sequence. Extraction of that chart, its spherical link and the central physical coordinate estimates remain open. [LaTeX source](marked_necks_and_chiral_energy.tex) · [Physical-shell section](anchored_physical_shell.tex) · [PDF](../../../../../../output/pdf/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/marked_necks_and_chiral_energy.pdf) · [Derivations and status](../research-progress/REGISTER.md) · [Earlier coverage audit](../../../reviews/MANUSCRIPT_COVERAGE_20261125.md)

Build from the repository root with `python3 tools/build_manuscripts.py 03_first_order_twistor/01_sections_and_connections/01_neck_geometry`.

## Physical-shell revision inputs

Revision base `483ad3cef5a0af4328c5d35cabbc1f5224d26b1e`. The bounded editorial and mathematical integration was assigned to GPT-6.2 Sol/ultra. Actual serving variant and reasoning effort are unavailable. The mathematical return is conditional on the supplied physical source chart. The estimate for small curvature on the physical block and the exact Bach-flat extraction retain their own hypotheses.

| Checked source | SHA-256 prefix | Use |
| --- | --- | --- |
| [Previous neck main TeX](marked_necks_and_chiral_energy.tex) at the revision base | `8914809a594a` | Ball noncollapse, low-curvature block, exact comparison and finite marked cut |
| [Neck register](../research-progress/REGISTER.md) and [incoming result](../research-progress/handoffs/MASTER_MARKED_TEST_RETURN_20261125.md) | `d4762c7d5549`, `95237e1ad018` | Coverage and branch ownership |
| [Master critical annulus](../../../../../master/manuscript/critical_annulus.tex), [Ricci scales](../../../../../master/manuscript/ricci_scales.tex) and [short splice](../../../../../master/manuscript/variational_comparison.tex) | `1f7c7ea5b088`, `a1dec14caba7`, `0c9b1dce4aa6` | Fixed central distortion, local Ricci input and cap positivity |
| [Master E16](../../../../../master/notes/E16_SEPARATED_BLOCK.md) and [E25](../../../../../master/reviews/E25_ANNULAR_VOLUME.md) | `3bd0ea1daa0d`, `81c17fd36f00` | Protected harmonic charts and physical transition volume |
| [Master E38](../../../../../master/notes/E38_PHYSICAL_SEPARATION.md) and [E41](../../../../../master/reviews/E41_SMALL_SIDE_AUDIT.md) | `019dcb050467`, `41a2d84abca9` | Small-side cutoff, ambient crossing, center anchor and both complete marks |

The primary passages checked for the new section are [DeTurck–Kazdan, Lemma 4.1](https://www.numdam.org/item/10.24033/asens.1405.pdf), [Friesecke–James–Müller, Theorem 3.1](https://dept.aem.umn.edu/~./james/research/Publications_Files/PDF/73.pdf), [Petersen–Wei, Lemma 2.3](https://www.math.ucla.edu/~petersen/Papers/28.pdf), and [Yang, *Convergence of Riemannian manifolds with integral bounds on curvature. II*, Theorem 7.1](https://www.numdam.org/article/ASENS_1992_4_25_2_179_0.pdf). Yang's published title is part II, as in the shared bibliography and the linked primary text. The [canonical source record](../../../../../../references/SOURCE_NOTES_MASTER_RICCI_IMMERSION_20261125.md) describes the first-order and local comparison hypotheses.

The [radial flux calculation](physical_ricci_flux.tex) gives the full signed distance defect on a protected physical annulus under its Ricci and inner-volume hypotheses. The [independent review](../reviews/E60_LOG_SHELLS.md) identifies the remaining marked-embedding condition.

The [critical integral estimate](critical_radial_defect.tex) selects a physical window with vanishing radial defect under a forward polar Jacobian bound. Its [review](../reviews/E64_CRITICAL_RADIAL_DEFECT.md) records the remaining marking hypothesis.

At the physical intermediate scale, a full buffered band with bounded sectional curvature, bounded rescaled volume and vanishing full curvature integral supplies a proper flat comparison and compact embeddings. The Jacobian or full signed radial-defect estimate must hold at this scale. The terminal polar throat calculation tests loss of inner protection. [Proof checks and reading copies](../../../../../master/research-progress/handoffs/E69_E72_CHARGED_FLOW_20261125.md)
