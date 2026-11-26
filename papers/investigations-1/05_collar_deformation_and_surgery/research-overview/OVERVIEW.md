# From a spherical collar to a smooth reduction

26 November 2026 · For Edward B. Baker III with OpenAI Codex assistance. [Setup inputs and provenance](../references/README.md) · [Proof plan](../research-plan/PLAN.md) · [Parent register](../research-progress/REGISTER.md)

Let $M$ be a closed, connected, oriented smooth four-manifold homotopy equivalent to $S^4$. Metrics and embeddings are smooth and Riemannian. The target is a diffeomorphism on the given smooth type. A Morse presentation is available on every such $M$. Its finite list of handles carries framed attaching maps and identifications of the regular levels. The homotopy type fixes neither these maps nor a metric with a specified Weyl-energy bound.

## Two possible conclusions on one source

A geometric cancellation of adjacent handles can give a new presentation of the **same** $M$ with fewer index-two handles. A metric cut instead gives one or more closed, capped manifolds. An identification of a standard summand and the actual boundary reassembly can return a metric on the original smooth type. Either conclusion can advance the program. A change to a metric supported near a knot leaves the knot and its framing to be tracked through an explicit smooth move.

For $U\subset M$ define $E_\sigma(g;U)=\int_U |W_g^\sigma|_{\rm HS}^2\,dV_g$ for $\sigma=+,-$, using the Weyl operators on real two-forms. On the closed sphere the two totals agree by signature. Write $T=4\pi^2$ and $I^+(M)=\inf_{Y([g])>0}E_+(g;M)$, with the empty infimum $+\infty$. An actual positive class of energy at most $T$ recognizes the standard smooth sphere. The master also gives a non-effective gap for the infimum. Its fixed-type concentration argument starts from $I^+(M)<2T$. The existence of a positive class in that band on every unresolved type is open. [Thresholds](../../../master/manuscript/chiral_weyl_energy_and_smooth_poincare.tex) · [Recognition gap](../../../master/manuscript/recognition_gap.tex)

## What the new branches contribute

The deformation branch starts from an embedded marked bicollar or a specified family of candidate sections. It seeks a conformally round, umbilic central sphere, or quantitative estimates sufficient to straighten an approximate one. The topology branch asks where such a section would separate a whole interaction or two protected curvature regions. The [shared measurements](../brainstorm/notes/MARKED_COLLAR_AND_CUT_20261126.md) travel in both directions. A presentation with a known cancelling pair can calibrate the markings. A new implication needs a family for which a collar, simplification, or cost estimate had still been missing.

| Existing work | Use here | Open input taken up here |
| --- | --- | --- |
| [First-order twistor collars](../../03_first_order_twistor/brainstorm/notes/COLLAR_PROGRAM_AND_SPC4_20261125.md) | Geometric extraction on a physical shell, surgery estimates on a marked chart, and Dirac transmission with actual end data. | How much of that chart or metric can a controlled deformation *produce* around a topologically selected sphere? |
| [Immersed constructions and Morse heights](../../04_hypersurface_immersions/README.md) | Framed attachments, tree reductions, and recognition for specified marked diagrams. | Realize a useful sphere on the actual trace and relate its metric and markings to the diagram. A bounded-energy height selection applies to the inducing immersion and the range of its theorem. |
| [Fixed-type descent](../../../master/01_fixed_type_variational_descent/README.md) | A physically charged disk, same-type comparisons and a necessary disk-side saving on sufficiently enlarged disks. | Find a cost-effective cut or coupled change on the supplied source, keeping its complement and protected core. |

The parent integrates a result into the [master route](../../../master/research-plan/PLAN.md) when it removes a named premise on an identified family, simplifies a presentation, or excludes a remaining case. The two children keep their intermediate arguments and independent registers.
