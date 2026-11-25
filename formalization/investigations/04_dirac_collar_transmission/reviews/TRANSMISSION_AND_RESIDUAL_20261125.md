# Which transmission estimates control chiral energy?

25 November 2026. Prepared for Edward B. Baker III with OpenAI Codex. [Prover assignments](../research-progress/handoffs/ACTIVATION_20261125.md) · [Source and proof audit](../research-progress/handoffs/INTEGRATION_20261125.md) · [Current register](../research-progress/REGISTER.md)

## The estimate on the physical remainder

Fix a truncation $L$ and a source index $i$ in the same marked sequence. Let $R=R_{L,i}$ be the source outside the captured components and let $V_j=R\cap U_j$. In the comparison metric on $V_j$ define

$$
S_j=\sum_a |\psi_{ja}|^2,\qquad
H_j=\sum_a |\Pi(d^\nabla P\psi_{ja})^+|^2.
$$

The local spin computation gives $2H_j=|W^+|_{\rm HS}^2 S_j$. It requires a positive spin frame with the stated curvature conventions and applies to arbitrary smooth fields. The norm on the projected triple is the Hilbert sum of its component norms. A change of conformal gauge preserves the four-dimensional chiral energy measure. To use it here, the two restricted measures must agree on the actual physical $V_j$. The projected numerator, denominator and integrating volume all belong to the same local metric.

Two estimates now follow.

1. If $S_j\ge c_j^2>0$ on $V_j$, its cost is at most $2c_j^{-2}\int_{V_j} H_j$.
2. With $V'_j=V_j\cap\{S_j>0\}$, its energy is exactly $2\int_{V'_j} H_j/S_j$. For a single field let $b_j$ be an independently measured upper bound on the $L^2$ norm of $|\Pi(d^\nabla P\psi_j)^+|/|\psi_j|$ over this region or a larger region in the same gauge. Its cost is at most $2b_j^2$.

Add the original energy on $R\setminus\bigcup_j V_j$ in the first case, or on $R\setminus\bigcup_j V'_j$ in the second. A zero of one field causes no uncovered charge if another strip controls that point. A small *volume* of omitted points does not by itself give small *energy* for a varying sequence. The [two accounting constructors](../../../FirstOrderTwistor/SpinRatioAccounting.lean) and [direct energy identity](../../../FirstOrderTwistor/SpinResidualEstimate.lean) support a different finite family at every $(L,i)$. Given the Route 02 truncation comparisons and convergence of the total energy to $e$, one obtains $e=\sum_m E_m$ when the summed cost and uncovered energy each satisfy, for every tolerance, an eventual bound in $i$ at every sufficiently large $L$. This keeps the inner index cutoff dependent on $L$. [Weighted constructor](../../../FirstOrderTwistor/SpinCoverAccounting.lean) · [DIR, projected spinor identity](../../../../papers/investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/manuscript/dirac_twistor_and_yamabe_rigidity.tex) · [MATCH-E05](../../../../papers/investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/01_dirac_collar_matching/notes/E05_NORMALIZATION_AND_RESIDUAL_20261125.md)

## Independent control on a protected annulus

Use a buffered, fixed-width annulus with flat reference $g_0$, an actual ordinary harmonic positive spinor in the annular metric $g$, and the incoming traces compared to the specific harmonic representative of a unit parallel flat spinor. Write $d$ for the measured incoming mismatch, $\epsilon_1$ for the first-order chart error, and $K\Subset K'$ for the protected region and its buffer. The signed forcing identity in an oriented normal frame is

$$
(D^{T^*}\nabla\psi)(e_j)-\nabla_jD\psi
=\tfrac12 c(\mathrm{Ric}^{\sharp} e_j)\psi.
$$

The tensor norm square of this forcing for a harmonic jet is exactly $|\mathrm{Ric}|^2|\psi|^2/4$. The Levi–Civita connection acts on the covector slot of $\nabla\psi$. An incoming inverse with identified trace spaces, measured first-order coefficients and the Sobolev comparison gives a first-order field estimate. To differentiate it use the cutoff equation for $\nabla\psi$, the flat twisted Dirac estimate, small relative operator error, and the comparison back to the actual norms. With $|\psi|\ge c$ on $K$, the resulting local budget is

$$
 b \le \frac{C}{c}\big(\epsilon_1+d+\|\,|\mathrm{Ric}_g|\,|\psi|\,\|_{L^2(K',g)}\big).
$$

Here $b$ denotes the normalized derivative norm. Thus a sufficient sequence criterion uses the sum of the **squares** of these strip bounds. The Lean estimate exposes the individual cutoff, forcing, Sobolev and return constants. The geometric cutoff estimate and comparisons must hold uniformly or their actual sizes must enter the sum. Smooth $W^{2,p}$-small comparisons ($p>4$), with matched nonzero reference data, give a separate manuscript path to both the floor and a second-derivative estimate on smaller annuli. [Checked Ricci contraction](../../../FirstOrderTwistor/SpinRicciForcing.lean) · [Checked strip inequalities](../../../FirstOrderTwistor/SpinStrip.lean) · [MATCH-E10, equations (1)–(7)](../../../../papers/investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/01_dirac_collar_matching/notes/E10_INTERIOR_SPINOR_DEFECT_20261125.md)

## An independent criterion without a uniform spinor floor

For a finite harmonic family put $Q=\sum_a|\nabla\psi_a|^2$ and $v^2=Q/S$. MATCH-E11 applies the covector-twisted Bochner inequality to $\chi\nabla\psi_a/(S+\epsilon)^{1/2}$. In the finite-integral case the Lean proof passes to $\epsilon\downarrow0$ from the regularized integrated inequality; it requires $S>0$ almost everywhere on the cutoff support. Summing the measured squared Ricci term, relative fourth-power term and cutoff term gives $\mathcal R,\mathcal V,\mathcal C$. With $\mathcal K=\sum_j\int\chi_j^2|\mathrm{Rm}_j|^2$, the total cost with uniform Bochner constant is at most $C(\mathcal R+\sqrt{\mathcal K\mathcal V}+\mathcal V+\mathcal C)$. The physical weight sum must reach one on the protected region, with energy on the rest still charged once. This trades the positive uniform floor for actual integrability and smallness of the relative gradients. A bounded $\mathcal K$ allows the mixed cost to vanish as $\mathcal V\to0$. Proving the geometric regularized inequality for the bundle and producing those costs on an approximate sequence are further steps. [Relative estimate](../../../FirstOrderTwistor/SpinRelativeBochner.lean) · [Physical weighted cover](../../../FirstOrderTwistor/SpinCutoffCover.lean) · [MATCH-E11](../../../../papers/investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/01_dirac_collar_matching/notes/E11_RELATIVE_BOCHNER_20261125.md)

The cutoff derivative itself is checked for a finite orthonormal frame and every $\epsilon>0$. The frame calculation bounds the squared operator norm of $d(\chi/\sqrt{S+\epsilon})$ times $Q$ by $2|d\chi|^2 Q/(S+\epsilon)+2\chi^2(Q/(S+\epsilon))^2$. Once the measured local estimates supply the summed upper bound above, the energy identity follows from a uniform upper bound on $\mathcal K$, separate vanishing of $\mathcal R,\mathcal V,\mathcal C$, and small uncovered energy. Both the number of patches and the cutoff costs may depend on both indices. [Cutoff derivative](../../../FirstOrderTwistor/SpinBochnerCutoff.lean) · [Energy identity from the four budgets](../../../FirstOrderTwistor/SpinBochnerAccounting.lean)

## What the trace problem can supply

| Geometric situation | What the checked results use or give | Additional input to reach curvature |
| --- | --- | --- |
| Unit round product with the common increasing normal | Positive modes propagate from the left and negative modes from the right. The exponent in the midpoint squared-norm estimate is $-3L/2$. It uses orthogonality on the slice in $L^2$. | To sustain floor $c$ at the midpoint, the sum of incoming squared norms must reach $c^2\operatorname{vol}(S^3)e^{3L/2}$. Conformal weights convert a physical pole normalization to product-gauge data. |
| Near-product first-order operator with fixed incoming projectors | Hölder bounds the principal and connection perturbations by the measured $L^\infty$ and $L^4$ coefficient norms. A small bounded perturbation of a supplied isomorphism has a controlled inverse on the same domain. | A round-link Sobolev realization, chart/spin identifications, compatible endpoint data, and the independent differentiated control on protected regions. |
| Two actual cores with compatible product germs | If the two return maps have product norm at most $\|G_L\|\|G_R\|e^{-3L}<1$, the two shifted trace equations have a unique solution. | Realize both Cauchy graphs and their pole shifts for the actual cores and the specified metric. |
| Two jumps on the original positive-Yamabe source | A bounded lift of the two jumps and a compatible closed inverse give a continuous piecewise harmonic correction. Given the critical jump bound, Minkowski gives $c^2\operatorname{vol}(U)^{3/4}\le C^2\sum_a J_a^2$ for regular fields with a joint floor. | Four measured face traces, closed Dirac estimates and gluing. A singular Green term must be supplied separately from the regular correction. |

Bär's Theorem 1 supplies the spectral values $\pm(3/2+k)$ for the intrinsic Dirac operator on the unit round $S^3$. The Lean modal results accept a supplied Hilbert basis and signed spectrum and prove propagation in that model. [Bär, Theorem 1](https://www.math.uni-potsdam.de/fileadmin/user_upload/Prof-Geometrie/Dokumente/Publikationen/sphere.pdf#page=6) · [Spectral proofs](../../../FirstOrderTwistor/CylinderSpectral.lean) · [Graphs and jumps](../../../FirstOrderTwistor/CoreTraces.lean)

A Ricci-flat algebraic test has $\psi=1$, first jet zero and all differentiated Dirac contractions zero, yet its projected twistor curl has squared norm $k^2$ at the marked point. This one-point test permits any real $k$. The manuscript supplies a different test on the standard smooth sphere with actual Green fields: the first-order perturbation and trace errors tend to zero, normalized fields stay nonzero, and the chiral energy on the protected annulus tends to a positive limit. In that family the total Bach norm grows. Neither test settles the almost Bach-flat sequence problem. On an exact round cylinder the curvature itself vanishes, so loss of the floor can coexist with zero residual. [Checked spin jet](../research-progress/handoffs/SPIN_JET_EXAMPLE.lean) · [Actual field example, MATCH-E10](../../../../papers/investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/01_dirac_collar_matching/notes/E10_INTERIOR_SPINOR_DEFECT_20261125.md)

In a genuinely compact gauge on the original smooth manifold, a second endpoint is available. A compact inclusion in $L^2$, a bounded Hilbert-domain sequence of asymptotically unit mass, operator-norm convergence and vanishing field defect produce a unit-mass kernel element. To reach the manuscript's recognition theorem one still has to realize those hypotheses for the varying spin metrics, prove regularity and control of the zero locus, and import the closed-manifold rigidity theorem. [Compact-gauge proof](../../../FirstOrderTwistor/SpinCompactness.lean)
