# Research overview — Smooth four-dimensional Poincaré conjecture

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex
assistance. Actual serving model and reasoning effort are unavailable.
This synthesis uses the committed research record at
`5ff7014caff55ad9cc49bb910b8e5fbcb546bd11` and the 25 November
manuscript and formalization changes that were then in the working tree and subsequently recorded in commit `fc60509`. It reports
the inherited results at their stated hypotheses.

## The variational problem on a fixed smooth type

Let $M$ be a closed connected oriented smooth homotopy four-sphere,
with smooth Riemannian metrics. Use $W^\pm$ as endomorphisms of the
real bundles $\Lambda^\pm$, and write
$E_\pm(g;U)=\int_U|W^\pm_g|_{\mathrm{HS}}^2\,dV_g$.
On $M$, signature gives $E_+(g)=E_-(g)$ for the total energies.
The full four-index Weyl energy is $8E_+(g)$. Each chiral energy
measure is conformally invariant. Set

$$
 I^+(M)=\inf\{E_+(g):g\text{ smooth on }M,\ Y([g])>0\},
 \qquad T=4\pi^2 .
$$

Strict recognition applies at $E_+<T$ with $Y([g])>0$, by
Chang–Gursky–Yang's sphere theorem and simple connectivity. The equality classification also identifies the smooth type at $E_+=T$ on a homotopy sphere. For a
*closed Bach-flat positive Yamabe* class the inclusive rigidity result gives conformal
roundness at or below $T$.
[Normalization and closed gap, `thm:closed-gap`](../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/marked_necks_and_chiral_energy.tex#L64)
· [Sphere-theorem source record](../../../references/SOURCE_NOTES_BACH_FLOW_20261123.md)

Suppose a candidate nonstandard $M$ admits a positive-Yamabe class
with $E_+<8\pi^2$. It then has a minimizing sequence of smooth
volume-one Yamabe metrics $g_i$, with
$T\le E_+(g_i)\le 8\pi^2-\delta$, $\delta>0$, and
$E_+(g_i)\to I^+(M)$. A conformal change to these physical metrics
keeps the chiral energy. Their scalar curvatures are the Yamabe
constants $Y_i$, and Gauss–Bonnet gives

$$
 Y_i^2=48(8\pi^2-E_+(g_i))
        +12\int_M|\operatorname{Ric}_{0,g_i}|^2\,dV_{g_i}.
$$

The fixed band and $Y_i\le Y_{\mathrm{rd}}=8\sqrt6\,\pi$ give
$Y_i\ge\sqrt{48\delta}$ and a uniform physical full-curvature
$L^2$ bound. Construction of the starting class on arbitrary $M$
is open. The minimizing property alone gives no estimate
$\int_M|B_{g_i}|\,dV_{g_i}\to0$. Results using this small
conformally invariant Bach norm require a separate variational
selection argument or a source of almost critical metrics.
[Band and entry hypotheses](../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/marked_necks_and_chiral_energy.tex#L119)
· [Outstanding problems](../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/marked_necks_and_chiral_energy.tex#L1359)

## Finite cuts and the geometric alternatives

A supplied finite family of disjoint smooth spherical cuts admits a
quantitative test. Let $m_j$ be the raw chiral energy on each piece
and suppose that closing the pieces with their marked caps gives
positive-Yamabe metrics with energies $e_j\le m_j+\gamma_j$, where
$\gamma_j\ge0$. If $E_+(g)+\sum_j\gamma_j<8\pi^2$,
at most one capped piece can reach $T$. All pieces strictly below
$T$ are standard. Parametrized reassembly along the original
boundary markings gives $M$ the oriented smooth type of the
possible exceptional piece $s$. On a nonstandard $M$, its
capped metric is an admissible competitor on $M$, hence

$$
 \sum_{j\ne s} m_j\le E_+(g)-I^+(M)+\gamma_s .
$$

At the infimum, one buffered cut retaining a fixed positive chiral
mass on *each* side and costing $o(1)$ is impossible. This
argument starts directly with the minimizing sequence. A variant
transfers the smooth type from one strictly subthreshold exterior
and gives a contradiction when the retained capped core has a
strict energy decrement on $M$.
[Finite cuts, `thm:nonsplitting`](../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/marked_necks_and_chiral_energy.tex#L412)
· [One-cut and residual accounting, `sec:marked-accounting`](../../investigations-1/03_first_order_twistor/manuscript/first_order_twistor_and_smooth_poincare.tex#L631)

- **Separating collar.** Two fixed positive chiral quantile masses at
  logarithmically separated physical radii yield a middle block of
  vanishing full curvature energy, by selection across annuli. A
  supplied embedded cone chart with uniform and strong $W^{1,4}$
  comparison on both buffers and a middle link separating the complete
  quantile sets suffices for the cut. The energy test forces its link
  group to be trivial. For exactly Bach-flat metrics the separated
  quantiles give the smooth spherical collar by exact regularity and
  compactness. For merely almost Bach-flat sources the argument still
  needs the marked weak chart or an estimate that gives the splice
  with weaker data. Concentration at one scale leaves a separate
  case. [Neck §5, `prop:weakquantiles` and `thm:exactcut`](../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/marked_necks_and_chiral_energy.tex#L821)
  · [Independent selection and descent review](../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/reviews/INDEPENDENT_DESCENT_AND_SELECTION_20261125.md)

- **Supplied smooth ALE component.** On an almost Bach-flat sequence,
  a complete nonflat smooth blow-up at scales tending to zero, with
  oriented embeddings of whole truncations and the specified
  differentiated ALE end decay, has one end with trivial link.
  Its smooth one-point compactification is positive Yamabe,
  Bach-flat, on the original smooth type and has
  $T< E_+\le e-\kappa_\delta$, where $e=\lim_i E_+(g_i)$
  and $\kappa_\delta>0$. This excludes such a blow-up at
  $e=I^+(M)$. Extraction of the stipulated blow-up from weak
  sources remains open. A growing diagonal on a supplied end
  controls only the region it reaches. For an accounting argument
  using multiple marked compacts, take the limit at fixed truncations
  first, then exhaust. The sum of strip errors and the actual
  uncovered chiral mass both need control.
  [Same-type ALE descent, `thm:ale-descent`](../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/marked_necks_and_chiral_energy.tex#L554)
  · [Sections and connections §§14–15](../../investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex#L5195)

- **Whole marked base.** With the same small Bach norm, suppose a
  smooth closed oriented homotopy sphere $N$ with ordinary marked
  points has coherent oriented embeddings of whole punctured
  truncations. In $\Phi_i^*g_i=u_i^2m_i$, require $m_i\to h$
  locally uniformly and strongly in $W^{1,4}$, a local
  $L^2$ scalar-curvature bound for the comparison metrics $m_i$, and a
  smooth filled metric $h$ on $N$. The metric $h$ is Bach-flat
  and the comparison chiral densities converge strongly locally.
  Positive limiting chiral energy on one fixed compared compact
  forces $E_+(h)>T$ and identifies $N$ with $M$ by exterior
  recognition. When $y=\lim_iY_i<Y_{\mathrm{rd}}$, positive limiting
  physical volume on a fixed compared compact also detects a
  nonround base. At $e=I^+(M)$, a nonround base gives energy equality, physical
  measured Gromov–Hausdorff convergence to a smooth unit-volume
  Yamabe metric, and vanishing curvature residual on exhaustion,
  with weak regularity in the given markings. A round
  base can retain physical volume while all the chiral energy remains
  outside it. The single-puncture restart in that case can preserve
  the limiting value. [Marked recovery, `thm:marked-recovery`](../../investigations-1/03_first_order_twistor/01_sections_and_connections/02_dirac_collar_extraction/manuscript/physical_volume_and_marked_conformal_limits.tex#L57)
  · [Round-base restart, `alt:base`](../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/closed_and_conformal_alternatives.tex#L369)

- **Closed nonround survivor.** A recovered nonround minimizer above
  $T$ is still a candidate on the same smooth type. Attainment and
  isolation of the least positive *exact* subcritical Bach-flat
  value, when the set of such values on $M$ is nonempty, are
  statements about that critical set. The half-harmonic argument
  requires a vanishing conformal Cotton residual and smooth
  extension of the candidate one-form across the Weyl zero set.
  In the half-harmonic class the nonround energy is strictly above
  $16\pi^2/3+\|\operatorname{Ric}_0(g_Y)\|_2^2/6$, with $g_Y$
  a Yamabe minimizer. A negative transverse-traceless Weyl
  variation at a positive Einstein survivor requires the specified
  Lichnerowicz spectral window $(R/3,R/2)$ at scalar curvature $R$.
  A rigidity theorem or strict decreasing variation for the
  surviving class remains open.
  [Closed alternatives, `alt:closed`](../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/closed_and_conformal_alternatives.tex#L641)
  · [Cotton reduction check](../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/reviews/COTTON_CHECK_20261125.md)

## Physical volume and the missing marking

For every $0<\epsilon<1$ and $\zeta>0$, a subsequence in the
physical Yamabe band has uniformly finitely many disjoint smoothly
embedded standard closed four-balls, covering at least $1-\epsilon$
of the physical volume with less than $\zeta$ of physical full
curvature energy per ball. The construction works without a Bach
hypothesis. Distances used to *locate* the balls come from conformal
positive-Ricci representatives, each rescaled so the least radius
containing half the physical probability is one. Logarithmic
cutoffs and the physical Yamabe inequality control the probability
at short and long distances in that gauge. The limiting physical
volume has locally bounded density on the noncollapsed Ricci limit,
and almost every volume point is metrically regular and avoids the
atoms of the bounded curvature measure. Fix the radii at such points,
pass to the source limit, then shrink the radii. Smooth embeddings and
a finite selection realize the balls on the original sequence.
[Volume theorem and corollary, `vol:regular` and `vol:smooth-balls`](../../investigations-1/03_first_order_twistor/01_sections_and_connections/02_dirac_collar_extraction/manuscript/volume_witnesses.tex#L368)
· [Density and embedding check](../../investigations-1/03_first_order_twistor/01_sections_and_connections/02_dirac_collar_extraction/reviews/POSITIVE_RICCI_DENSITY_CHECK_20261125.md)

Their individual smooth markings leave open critical first-derivative
control in the marked physical metrics, compatibility across whole
truncations, and the location of curvature or smooth type in the
complement. A usable separating cut must place the two *chiral*
masses on opposite sides, with the complete quantile sets outside
the modified strips. Another route would extend the local markings
to a whole base with the stated comparison scalar bound.
[Third collar assessment](../../investigations-1/03_first_order_twistor/reviews/THIRD_COLLAR_ASSESSMENT_20261125.md)
· [Joint continuation](../../investigations-1/03_first_order_twistor/continuation-notes/AFTER_THIRD_COLLAR_RESEARCH_20261125.md)

### Testing individual repairs of the marked balls

The master manuscript adds an elementary consequence of the variational definition to the marked-ball result. Write $m_{ij}$ for the chiral mass of ball $j$, $e_i$ for the source energy and $\gamma_{ij}$ for the net excess of the independently repaired metric over the entire raw exterior. If each repair produces a smooth positive Yamabe class on the original marked smooth type, then

$$
 \sum_{j=1}^{N_i}m_{ij}\le N_i(e_i-I^+(M))+\sum_j\gamma_{ij}.
$$

Fix the physical-volume tolerance before choosing the finite family and taking the source limit. If the aggregate excess tends to zero in this order, the marked union carries vanishing chiral energy. The complement may still carry the whole infimum in arbitrarily small physical volume. Uniform absolute continuity of the physical chiral measures is one sufficient independent estimate; an admissible concentrated model with strict same-type descent is another direction. The published sphere and Ricci-limit theorems provide neither the repairs nor this absolute continuity. [Manuscript, one-sided replacement and its corollary](../manuscript/chiral_weyl_energy_and_smooth_poincare.tex)

## Other routes to recognition

- **First-order twistor sections and chiral connections.** Three
  local integrable positive twistor sections of the same metric,
  distinct modulo sign, force $W^+=0$ by the Weyl quartic. On
  the homotopy sphere signature then gives $W^-=0$, so conformal
  development recognizes the round conformal class. Quantitative
  section evaluation, differentiated defects and local curvature
  prescription are available in the stated comparisons. A global
  construction still needs controlled local choices, overlap and
  boundary data, or a direct integrated estimate across the
  actual source. [Exact three-direction criterion, `prop:three-directions`](../../investigations-1/03_first_order_twistor/manuscript/first_order_twistor_and_smooth_poincare.tex#L243)
  · [Section defects, `sec:three-defects`](../../investigations-1/03_first_order_twistor/manuscript/first_order_twistor_and_smooth_poincare.tex#L505)
  · [Sections and connections §§2–8, 16](../../investigations-1/03_first_order_twistor/01_sections_and_connections/manuscript/twistor_sections_and_chiral_weyl_curvature.tex)

- **Dirac and spectral rigidity.** A nontrivial global positive
  twistor spinor in a smooth gauge gives exact chiral rigidity.
  On supplied collars, transmission bounds and the closed Dirac
  jump solver control actual trace data and regular corrections.
  The projected curl obeys
  $2|\Pi(d^\nabla P\psi)^+|^2=|W^+|_{\mathrm{HS}}^2|\psi|^2$.
  The normalized identity requires an independent estimate on the
  differentiated defect and the uncovered chiral mass. A uniform
  first-order error can vanish while the normalized defect persists,
  as actual oscillatory Green fields illustrate on standard $S^4$
  with growing Bach norm. A joint spinor floor requires separate
  estimates even on long collars with a uniform inverse. The
  equality $\frac35\sum_{j=1}^5\lambda_j=s$ for the first five
  positive Laplace eigenvalues of a volume-one Yamabe minimizer
  forces roundness. A global construction or a quantitative
  pinching-to-Yamabe-deficit bound remains open.
  [Dirac §§2–4, 7–12](../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/manuscript/dirac_twistor_and_yamabe_rigidity.tex)
  · [Collar transmission §§2–6, `eq:curlnorm` and `eq:floorcov`](../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/01_dirac_collar_matching/manuscript/dirac_transmission_on_marked_collars.tex#L55)

- **Bach flow.** On a smooth trajectory from positive subcritical
  data, the dissipating Weyl energy keeps the Yamabe constant
  uniformly positive. If the trajectory is smooth for all time and
  stays at or above the recognition threshold, late slices in
  its evolving gauge have small $L^2$ Bach norm. The spatial $L^1$
  norm transfers to the volume-one physical Yamabe metrics. This
  provides an actual almost critical sequence and its volume-ball
  conclusion. Its energy limit can exceed $I^+(M)$. Control of
  finite-time singularities, eventual recognition and construction
  of initial data remain open. [Bach flow §§2–4, `eq:yamabe-budget` and `eq:sequence`](../../investigations-1/02_bach_flow/manuscript/bach_flow_and_smooth_poincare.tex#L207)

- **Chiral metric evolution.** Definite connections reconstruct a
  metric and have quantitative compatibility and round-basin
  results for supplied data, including a conditional static
  recognition criterion. On the exact round spherical product
  collar the chiral Levi–Civita curvature has $F_i\wedge F_j=0$.
  A compatible definite reference across the actual buffers and
  caps needs separate construction. Existence of qualifying global
  initial data and control beyond the proved basin remain open.
  [Static criterion, `cor:effective-static-recognition`](../../investigations-1/01_chiral_metric_evolution/manuscript/chiral_curvature_and_metric_evolution.tex#L13312)
  · [Collar calculation, `sec:marked-product`](../../investigations-1/01_chiral_metric_evolution/manuscript/chiral_curvature_and_metric_evolution.tex#L14133)

- **Earlier twistor and double-copy work.** The generalized
  isothermal-coordinate construction gives complete-direction-fiber
  reconstruction for a holomorphic wave class. Chiral connection
  descent has a local Weyl obstruction and is realized, with
  classical double-copy identities, in the specified wave sector.
  To use these constructions on arbitrary oriented Riemannian
  homotopy four-spheres requires a reality condition, a compatible
  global bundle construction and control beyond those local classes.
  [Generalized isothermal charts §§3–6, `sec:bundle`](../../initial-investigations/01_generalized_isothermal_coordinates/manuscript/generalized_isothermal_wave_metrics.tex#L197)
  · [Descent and double copy §§2–8, `sec:obstruction` and `sec:copies`](../../initial-investigations/02_chiral_descent_and_double_copy/manuscript/chiral_connection_descent_and_double_copy.tex#L72)
  · [Historical project summary](../../research-overview/PROJECT_SUMMARY_2026-11-20.md)

## Investigation records and provenance

Each investigation register owns its task status. The relative
manuscript links above point to the working sources. At `5ff7014`,
the three collar branches had manuscript README files only. Commit `fc60509` subsequently recorded the three companion papers, with
separate TeX inputs for the closed alternatives and volume witnesses,
and the revisions to the five existing direct-program manuscripts. The
earlier generalized isothermal and double-copy TeX entries remain
at `956403f`. The coverage review records the previous TeX revisions,
section-by-section changes and the reported build checks. The
scientific claims above retain the hypotheses of the working
manuscripts even where an earlier assessment used stronger comparisons.
[First collar assessment](../../investigations-1/03_first_order_twistor/reviews/JOINT_COLLAR_ASSESSMENT_20261125.md)
· [Second assessment](../../investigations-1/03_first_order_twistor/reviews/SECOND_COLLAR_ASSESSMENT_20261125.md)
· [Third assessment](../../investigations-1/03_first_order_twistor/reviews/THIRD_COLLAR_ASSESSMENT_20261125.md)
· [Manuscript coverage audit](../../investigations-1/03_first_order_twistor/reviews/MANUSCRIPT_COVERAGE_20261125.md)
· [Shared bibliography](../../../references/README.md)

| Investigation | Owning register and companion evidence |
| --- | --- |
| [Chiral metric evolution](../../investigations-1/01_chiral_metric_evolution/README.md) | [Register](../../investigations-1/01_chiral_metric_evolution/research-progress/REGISTER.md) · [Final review checkpoint](../../investigations-1/01_chiral_metric_evolution/reviews/FINAL_REVIEW_CHECKPOINT_DISPOSITION_20261123.md) · [Static recognition assessment](../../investigations-1/01_chiral_metric_evolution/reviews/E254_E255_EFFECTIVE_STATIC_ASSESSMENT_20261123.md) |
| [Bach flow](../../investigations-1/02_bach_flow/README.md) | [Register](../../investigations-1/02_bach_flow/research-progress/REGISTER.md) · [Source notes and continuation theorems](../../../references/SOURCE_NOTES_BACH_FLOW_20261123.md) |
| [First-order twistor constructions](../../investigations-1/03_first_order_twistor/README.md) | [Shared register](../../investigations-1/03_first_order_twistor/research-progress/REGISTER.md) · [Review index](../../investigations-1/03_first_order_twistor/reviews/README.md) |
| [Sections and connections](../../investigations-1/03_first_order_twistor/01_sections_and_connections/README.md) | [Register](../../investigations-1/03_first_order_twistor/01_sections_and_connections/research-progress/REGISTER.md) · [Annular assessment](../../investigations-1/03_first_order_twistor/01_sections_and_connections/reviews/SEC_ANNULAR_ENERGY_AND_CONSERVATION_20261124.md) |
| [Neck geometry](../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/README.md) | [Register](../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/research-progress/REGISTER.md) · [Finite-cut derivation](../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E10_NONSPLITTING_MINIMIZERS_20261125.md) |
| [Dirac collar extraction](../../investigations-1/03_first_order_twistor/01_sections_and_connections/02_dirac_collar_extraction/README.md) | [Register](../../investigations-1/03_first_order_twistor/01_sections_and_connections/02_dirac_collar_extraction/research-progress/REGISTER.md) · [Physical recovery assessment](../../investigations-1/03_first_order_twistor/01_sections_and_connections/02_dirac_collar_extraction/reviews/LEAD_ASSESSMENT_20261125.md) |
| [Dirac and twistor spinors](../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/README.md) | [Register](../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/research-progress/REGISTER.md) · [Spectral and Delaunay assessment](../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/reviews/DIR_B23_CORE_CHAMBER_AND_NECKLACE_20261124.md) |
| [Dirac collar matching](../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/01_dirac_collar_matching/README.md) | [Register](../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/01_dirac_collar_matching/research-progress/REGISTER.md) · [Second collar review](../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/01_dirac_collar_matching/reviews/SECOND_COLLAR_REVIEW_20261125.md) |
| [Generalized isothermal coordinates](../../initial-investigations/01_generalized_isothermal_coordinates/README.md) | [Register](../../initial-investigations/01_generalized_isothermal_coordinates/research-progress/REGISTER.md) · [Geometry audit](../../initial-investigations/01_generalized_isothermal_coordinates/reviews/geometry_audit.md) |
| [Chiral descent and double copy](../../initial-investigations/02_chiral_descent_and_double_copy/README.md) | [Register](../../initial-investigations/02_chiral_descent_and_double_copy/research-progress/REGISTER.md) · [Review record](../../initial-investigations/02_chiral_descent_and_double_copy/reviews/README.md) |

The Lean evidence at `5ff7014` includes the three-axis calculation,
finite residual accounting and the supplied marked one-cut argument.
The 25 November working changes add Dirac collar transmission and
conditional weighted-cover accounting. Their integration report
records the public build and checks against the revised manuscripts.
The interfaces still require geometric realization on the source,
including the markings, cap data, and quantitative estimates for
the full remainder.
[Formalization register](../../../formalization/investigations/research-progress/REGISTER.md)
· [Three-axis return](../../../formalization/investigations/01_sections_and_connections/research-progress/handoffs/E01_20261125.md)
· [Finite accounting integration](../../../formalization/investigations/02_neck_energy_accounting/research-progress/handoffs/INTEGRATION_20261125.md)
· [One-cut integration](../../../formalization/investigations/03_single_cut_descent/research-progress/handoffs/INTEGRATION_20261125.md)
· [Dirac working-tree integration](../../../formalization/investigations/04_dirac_collar_transmission/research-progress/handoffs/INTEGRATION_20261125.md)

## Variational comparison at the infimum · 25 November

The master was launched from the working edition on `fc60509a27f6b97f48e2619f9e6f0f6cd4eb36e2`. During the investigation `64a0bfae5759353d49a68cb47e59305566809061` recorded that edition and several issued requests. The initial main, marked cut, first-order splice and physical volume TeX files have SHA-256 prefixes `a499b313e6d5`, `3f3722b56d34`, `f93717b0b73c`, `8ff80d4d42e5`, respectively. The two revisions have identical owning analytical manuscripts used here. SHA-256 prefixes in the checkout were as follows.

| Owner and passage | Working SHA-256 prefix | Dependence |
| --- | --- | --- |
| [Neck, closed gap, quotient link, same-type ALE descent](../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/marked_necks_and_chiral_energy.tex) | `8914809a594a` | Fixed-type full sides, eta and spin exclusions, end budgets. The new proof uses variational transfer on whole physical rescalings and derives the ALE ends on the exact limit. |
| [Closed alternatives, restart and half-harmonic estimate](../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/closed_and_conformal_alternatives.tex) | `4e7e947122b4` | Round restart and strict chiral eigenvalue bound used in the Einstein comparison. |
| [Extraction, whole marked comparison and local curvature lemma](../../investigations-1/03_first_order_twistor/01_sections_and_connections/02_dirac_collar_extraction/manuscript/physical_volume_and_marked_conformal_limits.tex) | `2bbdade6187c` | Coordinate curvature decomposition, local Euler transgression, whole truncations, both positive exterior caps and capacity. The owner uses a source Bach bound; the new replacement uses the minimizing excess. |
| [Extraction, regular points and actual smooth balls](../../investigations-1/03_first_order_twistor/01_sections_and_connections/02_dirac_collar_extraction/manuscript/volume_witnesses.tex) | `c4447eb631ce` | Positive-Ricci half-volume gauge, packing and smooth inclusions. Joint selection changes the measure in the radius argument. |
| [Bach flow, dissipation and scale](../../investigations-1/02_bach_flow/manuscript/bach_flow_and_smooth_poincare.tex) | `6224a4a6641b` | Independent flow starts require enough normalized smooth time per energy excess. |

The new working manuscript's [positive-path argument](../manuscript/variational_comparison.tex) replaces local data by the limit metric on the same smooth source. A positive path of energy below the zero-Yamabe wall stays admissible, giving strong local chiral convergence and compactly supported stability on a supplied comparison. For a whole nonround base this gives a same-type minimizer. On a round base one exterior can retain the whole infimum. The new [complete-limit argument](../manuscript/complete_limits.tex) uses the exact limit equation, critical regularity, end topology and a single measured end cut. No global Bach bound on the source sequence enters it. Bounded physical curvature gives closed attainment. On an unbounded-curvature subsequence the maximum-scale balls lose full curvature uniformly for each fixed multiple. The energy-radius alternatives distinguish two separated positive masses from a measure diffuse at the half-energy scale. [Independent end proof](../reviews/E11_COMPLETE_LIMIT_CHECK.md) · [Manuscript audit](../reviews/E13_MANUSCRIPT_AUDIT.md) · [Physical energy check](../reviews/E14_PEAK_CHECK.md).

The [joint ball selection](../notes/E03_JOINT_SELECTION.md) addresses diffuse chiral measure even when singular to physical volume on regular points. Its residual consists of escape, nonregular points and excluded atoms. Its same-type repair still needs an effective chart or a different filling. [Entry and closed alternatives](../brainstorm/notes/ENTRY_AND_CONCENTRATION_20261125.md) give the scopes of the two tested seed mechanisms and the Einstein gap. [Primary passages and scope](../../../references/SOURCE_NOTES_MASTER_VARIATIONAL_20261125.md).

The [Route 04 live register](../../../formalization/investigations/04_dirac_collar_transmission/research-progress/REGISTER.md) advanced between the two checkout revisions, including the annular metric identities and cylindrical inverse in their specified presentations. [Route 02](../../../formalization/investigations/02_neck_energy_accounting/research-progress/REGISTER.md) and [Route 03](../../../formalization/investigations/03_single_cut_descent/research-progress/REGISTER.md) still distinguish geometric markings from conditional accounting. None of these receipts proves the new analytic local replacement, complete-limit exclusion or energy-radius result in Lean. No formal declaration is a premise of this edition's new proofs.

## Physical Ricci scales, critical charts and middle-index heights · 25 November

The resumption began from the clean committed edition b3cd11a2b839b6d2cb6262f8210f33d19d6f5a0a. The source note and assessment from the preceding edition were read at SHA-256 prefixes fca4f8885836 and 28695767370a. Its register, overview, plan and initial review were f31aea34f4c5, 38fdde92473a, 4245b74122b2 and c9db9ddc3e0d. The input main, complete limits, local variational comparison, physical volume, first-order splice and marked cut were c8a9f68da492, 8b5692f2bcab, 0c9b1dce4aa6, b972bc546624, f93717b0b73c and 3f3722b56d34. The four owning collar manuscripts in the preceding table have the same working hashes at this revision. The [owning balanced-block derivation](../../investigations-1/03_first_order_twistor/01_sections_and_connections/01_neck_geometry/notes/E11_BALANCED_BLOCK_AND_NONCOLLAPSE_20261125.md) was 83a16b35c301. Formalization registers 01–04 at integration had respectively dc30012fe8da, 2a9062f6d469, 2ed437169b59, 7b91f1c68116. Route 04's later committed developments are separate from the new analytical theorems.

**Immersed recognition.** The [immersion theorem and proof](../manuscript/immersion_entry.tex) use the actual smooth domain. Reducing the two extremal handlebodies leaves the middle count unchanged. At most one middle handle suffices for smooth recognition by the existing knot-surgery theorem. Hence on any nonstandard candidate the mean number of middle-index points of immersed heights is at least two. Comparing with both chiral Weyl blocks and excluding open saturation by Codazzi raises the recognition threshold in the conformally hypersurface-immersible subclass to \(64\pi^2/9\), endpoint included, independent of sign. The sharp deficit against negative Gauss–Kronecker curvature gives direct recognition from \(\|A^\circ\|_4^2\le16\sqrt2\,\pi/3\). Above the chiral threshold and below \(8\pi^2\), more than three quarters of directions have exactly two middle handles. No theorem places all low-energy conformal classes in this immersion subclass. [Handle proof](../reviews/E33_INDEX_TWO_HANDLES.md) · [Equality check](../reviews/E34_MIDDLE_WEYL_EQUALITY.md) · [Primary literature](../../../references/SOURCE_NOTES_MASTER_RICCI_IMMERSION_20261125.md)

**Physical scales.** The [physical Ricci theorem](../manuscript/ricci_scales.tex) builds on the complete-limit proof through its exact ALE links and marked reassembly. At a secondary failing harmonic radius the trace-free Ricci source tends to zero strongly in scaled \(L^p\), and the pointed limit is Euclidean. At a minimizing energy a bound on each fixed enlarged window at a shrinking scale gives vanishing full curvature on fixed smaller windows. A uniformly bounded global trace-free Ricci \(L^p,\ p>2\), gives closed attainment. The conclusion is uniform at the global scale \(\|\mathrm{Ric}_0\|_p^{-1/(2-4/p)}\) when the norms diverge. Neither local statement puts charge at a curvature maximum. [Radius check](../reviews/E19_RICCI_RADIUS_AUDIT.md) · [Weak Bach and exponent audit](../reviews/E24_SUPERCRITICAL_PROOF.md)

**Separated and diffuse measures.** The [critical annulus](../manuscript/critical_annulus.tex) supplements the short-cut proposition. A fixed small distortion bound suffices on a supplied whole marked harmonic shell with vanishing full physical curvature. The proof recovers a smooth flat development and a strong critical first derivative on its fixed interior. A finite missing-volume test on radial charts and a global transition-volume test for branching are recorded in E16/E25. The quantile selection gives the incoming small energy and the two charged sets, while their geometric marking remains open. On the diffuse branch E17 quantifies a leading-order obstruction for controlled boundary-fixed repairs even at smooth regular points. It makes no estimate on unobserved residual mass. [Integrated returns and scopes](../research-progress/handoffs/RICCI_AND_IMMERSION_RETURNS_20261125.md)

The wholly evacuated round conformal restart can preserve the class exactly. A closed nonround minimizer outside the recognized subclasses remains possible. The [plan](../research-plan/PLAN.md) records the next geometric tests. These are working analytical proofs with independent bounded recomputations. No new Lean declaration or verification status is claimed.

During this integration a separate working-tree [formalization investigation 05](../../../formalization/investigations/05_variational_comparison/research-progress/REGISTER.md) appeared over the same commit. Its VAR-E01 is a specified finite-repair statement, and its VAR-E08 still depends on physical-scale and harmonic-radius results. These are forward interfaces. The preceding master proofs and the immersed-height result use no proof from that concurrent setup.

Integrated working TeX SHA-256 prefixes at the PDF build: chiral_weyl_energy_and_smooth_poincare.tex 6c47f8fe412e, immersion_entry.tex 512ef85cfa69, ricci_scales.tex 091cd448e885, critical_annulus.tex c0235f11a429. The 33-page PDF built with resolved references. E31 audited its frozen intermediate text; E33 and E34 checked the final topological and equality steps. The four-direction corollary uses only the union bound for the four uniform marginals of an orthonormal frame.
