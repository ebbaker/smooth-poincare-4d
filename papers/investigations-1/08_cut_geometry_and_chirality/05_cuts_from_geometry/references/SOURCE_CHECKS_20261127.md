# Source passages for the cut and its width

27 November 2026, for Edward B. Baker III with OpenAI Codex. The root [reference catalog](../../../../../references/README.md) and the parent [source receipt](../../../../../references/claude/SOURCE_NOTES_CUT_GEOMETRY_20261126.md) own the shared bibliography. The table records the passages used in this child. Requested Sol/ultra execution and independent replay; actual serving details unavailable.

| Source and inspection | Use and scope |
| --- | --- |
| Chang, Gursky and Yang, *An equation of Monge-Ampère type in conformal geometry, and four-manifolds of positive Ricci curvature*, Ann. Math. 155 (2002), 709–787, [Theorem A](https://arxiv.org/pdf/math/0409583#page=4). Statement and normalization checked. | On a smooth compact four-manifold positive Yamabe invariant of the class and positive total σ₂ give an admissible conformal representative. Their Schouten convention differs by a positive scalar. The averaging of its inverse scale for a compact symmetry group is derived in the [orbit note](../notes/ORBIT_SWEEPOUT_20261127.md). |
| Zhou, *Min-max minimal hypersurface in manifolds with positive Ricci curvature*, JDG 100 (2015), 129–160, [arXiv:1210.2112v2](https://arxiv.org/pdf/1210.2112v2). Theorems 1.1, 1.3, 1.5, Proposition 3.6 and §7. The full proof of the characterization in §7 and the prerequisite passages listed in E04 were read. | For a connected closed orientable positive-Ricci ambient manifold with hypersurface dimension 2–6, the orientable branch of the fundamental-class width has multiplicity one, index one and least area. Embedded hypersurfaces here are two-sided. [Scope and reflected eigenvalue convention](../research-progress/handoffs/E04_MINMAX.md) · [Tied least-area realizers](../reviews/FIRST_WIDTH_REPLAY.md). |
| Zhou, *Min-max hypersurface in manifold of positive Ricci curvature*, JDG 105 (2017), 291–343, [arXiv:1504.00966v2](https://arxiv.org/pdf/1504.00966v2). Theorem 1.1(ii), §2.4 and §6 Claim 5 checked in E04. | Source for the stability statement under one-sided normal-bundle variations if the parent retains that alternative. |
| Sharp, *Compactness of minimal hypersurfaces with bounded index*, JDG 106 (2017), 317–339, [Appendix A](https://arxiv.org/pdf/1501.02703). Theorem A.6 and Corollary A.7 checked against their varying-metric premise, and Remark A.4 against the local finite-regularity argument. | In dimension three, bounded volume and index give single-sheet graphical compactness under smooth convergence to the positive-Ricci round metric. The finite-C⁴ extension uses an additional local argument. [Near-round return](../research-progress/handoffs/E12_ROUND.md) · [Independent reading](../reviews/NEAR_ROUND_REPLAY.md). |
| De Lellis and Ramic, *Min-max theory for minimal hypersurfaces with boundary*, Ann. Inst. Fourier 68 (2018), 1909–1986, [§7.2, (7.1)](https://www.numdam.org/article/AIF_2018__68_5_1909_0.pdf#page=31). Interior comparison passage checked. | Local mass control used in E12's separate finite-regularity proof. The smooth-neighborhood conclusion also follows by Sharp's global theorem. |
| Räde, *Scalar and mean curvature comparison via μ-bubbles*, [arXiv:2104.10120v4](https://arxiv.org/pdf/2104.10120v4), Theorems 2.7–2.8, Corollaries 2.9 and 2.25, Lemmas 4.2–4.4 and (11), as specified in [E07](../research-progress/handoffs/E07_BANDS.md). | Barrier signs and second variation on a compact band, and the strict width bound for a product over a closed connected oriented three-manifold admitting no positive-scalar-curvature metric. [Canonical receipt](../../../../../references/SOURCE_NOTES_COLLAR_SURGERY_20261126.md). |
| Torralbo and Urbano, *Compact stable constant mean curvature surfaces in homogeneous 3-manifolds*, [§2.1](https://www.ugr.es/~furbano/papers/StableBerger.pdf); checked there and recomputed using Lie brackets. | Berger intrinsic curvature with round normalization in [E06](../research-progress/handoffs/E06_GERM.md). |

No classification of all minimal hypersurfaces on a general entering metric is used. Generalized Morse recognition by gluing two four-dimensional handlebodies belongs to parent Corollary 7.3; the sweepout and cut calculations here construct actual levels and use Gauss directly.

## Repository generations

Cross-branch inputs were read over commit bc2c1bbccc1d244a9d456ffe2fcaf64e368290b0. The working inputs that arrived during the session are recorded separately at the end of the table. SHA-256 values identify the read copies.

| Input | SHA-256 |
| --- | --- |
| cuts_of_subcritical_conformal_classes.tex | `ccb52d6a2548fb8fbddbab4ab01b9aea3d9cc560bbec477c86e7273a389d7fb0` |
| chiral_energy_of_hypersurface_immersions.tex | `13ea5742d3fa0d01ff14e77da000959db4c364c9e0b816f6ea580dd767338ac0` |
| recognition_from_marked_morse_heights.tex | `9681e2deb71434b7e6036ce8d3db9b6a10e4f6d530406948e30bc8b74b1a15d9` |
| POSITIVE_SCALAR_INTERMEDIATE_CUTS.md | `16590e9d992a487026ab37d47004c129ba3f970a4485d5a3b67ed598bbf81af6` |
| check_02_cap_costs.py | `9c0e9056143dc9bb4cd717078ef91949ecc23eea8325b9d8ba3a4f1179b616e2` |
| E05_UNIFORM_BENDING.md | `869d32b73f9548c10fe6ad65a65b7a67a6004c61461f8f108e48199728427592` |
| E01_CAP.md | `072391e9c8a4d2eece4574db716bdf51f922af29a195c550f459c141a783ef06` |
| trefoil_certificate.py | `2834f4d1d95d7624ff90f2be52c545820a35525f1ed7e258955e53c6451dad6c` |
| SWEEPOUT_RETURN.md | `f00ca519c8029eec8ea8f6e6b747c24109ab3b452a462594f8accd8e159727fc` |

## Reopened G3 • boundary and width identities

- Atiyah, Patodi and Singer, *Spectral asymmetry and Riemannian geometry. I*, pp. 44 and 66, (1.7) and Theorem 4.14. Checked the product-near-boundary assumption, signature eta convention and relative signature. The explicit nonproduct correction is derived in [E16](../research-progress/handoffs/E16_BERGER_LEDGER.md) and read independently in [E19](../reviews/BERGER_FLUX_REPLAY.md). [Published text](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/aps001.pdf#page=24).
- Chang, Gursky and Yang, p. 710, (0.2). Checked the closed smooth four-dimensional Euler identity with their Schouten tensor equal to twice the tensor used here, and the conversion of their squared Weyl norm to the curvature-operator norm. Applied on each smoothly reflected double. [Published text](https://arxiv.org/pdf/math/0409583#page=2).
- Zhou, JDG 100, Theorems 5.5 and 5.8. Checked flat continuity, bounded mass, no concentration and boundary-of-regions identification with the integral fundamental class. The interpolation used for the failed metric requires no positive Ricci hypothesis. [Primary text](https://arxiv.org/pdf/1210.2112v2) · [independent verification of all hypotheses](../reviews/BERGER_COMPLETION_REPLAY.md).

The [polar derivation](../research-progress/handoffs/E17_POLAR_TRANSGRESSION.md) and [suspension](../research-progress/handoffs/E18_SHORT_SUSPENSION.md) give hashes of the original inputs. The [interval calculation](../research-progress/handoffs/E21_ANGULAR_AREA.md) identifies the exact area, profiles and arithmetic. No shared bibliography changes were needed.
