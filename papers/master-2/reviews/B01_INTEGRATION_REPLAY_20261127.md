# SP4-M2-B01 — independent reading of the pole-form integration

27 November 2026, UTC. Prepared for Edward B. Baker III with OpenAI
Codex assistance. The [bounded request](../research-progress/handoffs/B01_READING_REQUEST_20261127.md)
records `gpt-6.2-sol` at ultra. The running variant and effort are
unavailable to this reader. Working tree based on `6a422ce`. This review
checks the integration against investigation 01's proofs and their
non-author readings.

**Disposition.** The revised A1 and A2 statements, kernel conventions,
marked-end construction, first-zero example and open quantifiers agree
with the branch results. A1 and A2 retain the status of replayed project
theorems. The weighted Fredholm and relative splitting inputs are
identified separately. The universal zero-free assertion and the
positive subcritical bridge remain open.

## Versions and evidence

The revised [manuscript](../manuscript/self_dual_pole_forms_and_smooth_poincare.tex)
was checked at `70d3df783a0458a7b` and rechecked at `dec67212b46864c0`
after introductory edits. The revised
[overview](../research-overview/OVERVIEW.md) was checked at
`1bca8629fc2f027c` and rechecked at `7102e965f218722a` after amendment.

| Return checked | Proof and reading used |
| --- | --- |
| [Frame](../../investigations-2/01_chiral_transfer_and_pole_forms/research-progress/handoffs/TO_MASTER2_FRAME_20261127.md) · `94ef274a2299a00f` | [A1](../../investigations-2/01_chiral_transfer_and_pole_forms/notes/E01_A1.md) (`db13563024da1a55`) and its [replay](../../investigations-2/01_chiral_transfer_and_pole_forms/reviews/E01_REPLAY.md). [A2](../../investigations-2/01_chiral_transfer_and_pole_forms/notes/E02_A2.md) (`919cd9579feb6cf2`), the [integrated proof](../../investigations-2/01_chiral_transfer_and_pole_forms/brainstorm/notes/B01_RECOGNITION_SOURCE.md) (`f4d0d1d87cba4ca7`) and its [replay](../../investigations-2/01_chiral_transfer_and_pole_forms/reviews/E02_REPLAY.md). |
| [Normalization](../../investigations-2/01_chiral_transfer_and_pole_forms/research-progress/handoffs/TO_MASTER2_NORMALIZATION_20261127.md) · `f8e074f25509f2e2` | [Kernel derivation](../../investigations-2/01_chiral_transfer_and_pole_forms/brainstorm/notes/B01_KERNEL.md) (`e8c1089f347455ac`) and its [replay](../../investigations-2/01_chiral_transfer_and_pole_forms/reviews/B01_REPLAY.md). |
| [Marked end and first zero](../../investigations-2/01_chiral_transfer_and_pole_forms/research-progress/handoffs/TO_02_03_MARKED_END_20261127.md) · `1ebf0832d366210c` | [Realization](../../investigations-2/01_chiral_transfer_and_pole_forms/notes/E04_REALIZATION.md) (`0dc61bfb07a67b35`), [realization replay and first-zero proof](../../investigations-2/01_chiral_transfer_and_pole_forms/reviews/E04_REPLAY.md) (`caebe2ed12ee24b1`) and [first-zero replay](../../investigations-2/01_chiral_transfer_and_pole_forms/reviews/E06_REPLAY.md). [Smooth dependence](../../investigations-2/01_chiral_transfer_and_pole_forms/brainstorm/notes/B02_OPENNESS.md) (`26d3a59ecf16a90bc`) and its [replay](../../investigations-2/01_chiral_transfer_and_pole_forms/reviews/B02_REPLAY.md). |
| [Algebra and calibration](../../investigations-2/01_chiral_transfer_and_pole_forms/research-progress/handoffs/TO_05_ALGEBRA_20261127.md) · `79b03ea55952a3a1` | [Algebra](../../investigations-2/01_chiral_transfer_and_pole_forms/notes/E03_ALGEBRA.md) and its [replay](../../investigations-2/01_chiral_transfer_and_pole_forms/reviews/E03_REPLAY.md). [Fibre calculation](../../investigations-2/01_chiral_transfer_and_pole_forms/notes/E05_DRAFTS.md) and its [reading](../../investigations-2/01_chiral_transfer_and_pole_forms/reviews/E05_READING.md). |
| [Bibliography](../../investigations-2/01_chiral_transfer_and_pole_forms/research-progress/handoffs/TO_05_BIBLIOGRAPHY_20261127.md) · `291869be6fc72979` and [formal statement request](../../investigations-2/01_chiral_transfer_and_pole_forms/research-progress/handoffs/TO_FORMALIZATION_POLE_20261127.md) · `e466380571ba921b` | [Branch source record](../../investigations-2/01_chiral_transfer_and_pole_forms/references/README.md) and [Gromov receipt](../../investigations-2/01_chiral_transfer_and_pole_forms/references/A2_ORIGINAL.md). The adopted claims use their stated mathematical evidence levels. |

## Statement checks

- **A1.** The growth space includes zero and exhausts all smooth closed
  self-dual forms on the punctured manifold with the stipulated bound.
  For every class and pole, each covariant coefficient in the
  anti-self-dual source fibre determines exactly one form. The
  differentiated remainder in positive orthonormal normal coordinates
  is $O_\infty(\rho^{-2})$. The leading form is constant in the inverted
  chart, whose numerical orientation is opposite the inherited one.
  The manuscript separates the cylindrical weighted Fredholm and
  stability import from the project arguments at the midpoint weight,
  the flat endpoint estimate and exhaustion. [Lockhart–McOwen, Theorem 6.2 and Lemma 7.1](https://www.numdam.org/article/ASNSP_1985_4_12_3_409_0.pdf#page=27)
- **Kernel and source.** The compact graph uses $d^-A\mapsto d^+A$, the
  inverse of the arrow displayed by Donaldson–Sullivan. The project
  contact coefficient is $\pi^2/2$ for unit leading data. This gives
  $K_g=(2/\pi^2)P_g$ off the diagonal with volume at the source. For a
  fixed form the covariant coefficient has factor $e^{4f(p)}$ under
  $g\mapsto e^{2f}g$, canceled by the source volume factor. The kernel for
  the reversed orientation exchanges the source and target points and
  takes the fibre adjoint in the chosen metric. [Donaldson–Sullivan, §2(ii), (2.9)–(2.13)](https://www.math.stonybrook.edu/~dennis/publications/PDF/DS-pub-0088.pdf#page=8)
- **A2.** Recognition assumes an actual member without zeros. A1's
  primitive and the annular cutoff give an exactly constant symplectic
  end. In the inherited orientation, the equal skew singular values of
  the leading form allow a similarity $z=sQx$, with $\det Q=-1$ relative
  to the numerical $x$-orientation. The project cap gives the two
  trivial normal bundles, the positive transverse intersection, equal
  areas $A$ and spherical periods in $A\mathbb Z$. The published
  relative splitting applies on the capped manifold. Pasting preserves the chart
  on a full tail, and inversion there gives exactly $s^{-1}Qy$ at the
  original puncture. The article uses Gromov's original relative passage.
  It records the direct check of the separate book theorem as pending.
  [Gromov, §2.4.A′₁–A′₂, p. 337](https://www.ihes.fr/~gromov/wp-content/uploads/2018/08/945.pdf#page=31)
- **Fixed-end realization and first zero.** A positive near-symplectic
  form exactly equal to a nonzero constant on a prescribed inverted smooth end
  compactifies as a pole form without changing the form exactly when
  that constant is Euclidean self-dual for the inherited orientation.
  For a general positive constant the distant modification preserves
  the zeros. For a pole form the intrinsic near-symplectic condition at
  a zero is spatial rank three. Taubes supplies the local birth endpoint
  with unchanged constant end. The project uses a path of compact
  metrics with fixed flat germ, marked point and one fixed nonzero
  coefficient. Smooth dependence and a uniform exterior bound put every
  zero in one compact core. At the first zero parameter, surjectivity of
  any spatial derivative would give earlier zeros. Every zero there has
  rank at most two. Other directions and the energy of this class remain
  undetermined by the construction. [Auroux–Donaldson–Katzarkov, Proposition 1 and §7.2](https://arxiv.org/pdf/math/0410332#page=64) · [Perutz, thesis §1.1](https://web.ma.utexas.edu/users/perutz/PDF_files/PerutzThesis.pdf#page=17) · [Taubes, Proposition 2.1 and (2.16)](https://doi.org/10.4310/MRL.2006.v13.n4.a6)
- **Quantifiers.** Z asks for each $M$ for one choice of $c,p$ and one
  fixed nonzero coefficient that works for every point of $X$. A2 and the
  nonzero constant forms of the round sphere give the two implications of
  the reformulation. The bridge instead quantifies over classes on standard
  $S^4$ satisfying $Y(c)>0$ and $E_+(c)<8\pi^2$, allowing a pole and a fixed
  direction to depend on the class. Openness, a first zero in one marked
  direction and a calibration family give the stated limited results. The
  full normalized fibre chart is precisely the rank-three case. The exact
  definiteness of the family holds on $X$ for all $\varepsilon>-4$ in its
  chosen marking. The sampled energy comparisons are numerical diagnostics.

## Corrections checked

The revised manuscript specifies the maximum-principle conclusion at
the midpoint weight, the exact relative-source locator, and the uniform
exterior estimate needed for the first zero. The overview makes the
orientation of inversion explicit, points the fibre calculation to
E05, gives the explicit bridge hypotheses and marks the calibration
energy comparisons as heuristic. Its final calibration statement
specifies the marked pole, the entire punctured manifold as the
evaluation domain and all parameters $\varepsilon>-4$.
The final manuscript incorporates the [setup-draft audit](E01_MANUSCRIPT_AUDIT_20261127.md)
on Freedman's theorem locator, the $W^{1,2}$ domain for a coclosed
potential with $L^2$ data, real exact abelian curvature and the companion
investigations' status. The mathematical statements reviewed above are
present in that version.
