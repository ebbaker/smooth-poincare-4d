# Edition 03 · Induced curvature and height-selection audit

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Actual serving model and reasoning effort
were unavailable to the reviewer. The audit compares the hypotheses,
normalization and scope of the following source revisions.

| Module | SHA-256 |
| --- | --- |
| [InducedBlock.lean](../../../SmoothPoincare/Immersions/InducedBlock.lean) | `b868248bbe63be712d410f2cf1678fbdca279375c8d7b0064f879f6d9bf7c91b` |
| [Selection.lean](../../../SmoothPoincare/Heights/Selection.lean) | `acd4d2a545cc5991065bbf1e21078713550877510dcbac232d319c514a3de9a2` |
| [IntegratedSelection.lean](../../../SmoothPoincare/Heights/IntegratedSelection.lean) | `73763265b0d7349ede45ab3e79831670919863d35dfd44432d9dddb528584205` |

The comparison uses manuscript SHA-256 prefix `cf7a5e72e147772f`
at `9c579f0`, the principal-curvature proof at `f0e0c5e46deb272e`,
and the pinned DifferentialGeometry revision
`788efe97894474c032de6dfb1289d515f613d15a`. The middle-signature and
deficit passages already appear at the issued source revision
`2689540`. The verdict below is a mathematical source review.
[Immersion manuscript](../../../../papers/master/manuscript/immersion_entry.tex) ·
[Algebra receipt](../research-progress/handoffs/ED03_PRINCIPAL.md)

## Induced metric and curvature slots

The Gauss specialization and Weyl normalization agree with the manuscript
for the positive Weyl block. `IsometricHypersurface` requires a smooth
map into Euclidean five-space whose differential pulls back the Euclidean
inner product to the specified positive definite metric. This gives
injectivity of the differential. `PrincipalFrameAt` supplies an oriented
orthonormal basis of the actual tangent fiber, a unit normal perpendicular
to the image of the differential, and the diagonal form of the actual
ambient second fundamental form in that basis. Existence of these frame
data is a separate statement. At a point it uses the rank-one normal
space and spectral decomposition of the symmetric second fundamental form.

For `metricCurvatureFrameTensor_eq_principalGauss`, the frame coefficient
with indices `a b c d` evaluates the standard lowered curvature with
the final arguments `d c`. The two Gauss terms therefore have the order
`⟨II_ac, II_bd⟩ - ⟨II_ad, II_bc⟩`. The ambient curvature term vanishes
by `euclideanMetric_metricRm04At_eq_zero`. The inner products of the
diagonal second fundamental forms reduce to products of the signed
entries because the normal has unit length. In particular a diagonal
wedge with distinct indices `a b` has curvature `k a * k b`, so a
mixed-sign pair gives negative sectional curvature. Simultaneous
normal reversal negates all four entries and preserves the products and
determinant.

In `principalGauss_weylNormSq`, normalized self-dual compression gives a
diagonal block with entries $s_j/2$, where the $s_j$ are the three
opposite-pair sums. Subtraction of its trace divided by three gives
entries $(s_j-\bar s)/2$. Their squared Hilbert–Schmidt norm is
$\sum_{i<j}(s_i-s_j)^2/12$. The same diagonal values result from
the complementary anti-self-dual wedges by diagonality of the Gauss
operator. `principalGauss_chiralBlocks_eq` proves this directly. The two mixed terms
in paired wedge coordinates vanish, so changing their signs yields
identical compressions in the respective bases. The equality also
holds after trace subtraction on the actual induced tensors by
`inducedAntiChiralBlock_eq`.
`inducedChiralBlock_normSq`, `inducedMiddleWeylBound`
and `inducedShapeDeficitBound` apply the formulas to the same point, map,
metric and frame. The middle theorem assumes the ordered signs
$(-a,-b,c,d)$ with all four magnitudes positive and retains the scalar
equality classification. The deficit theorem retains the positive part
of the negative, signed principal product for every sign pattern.
[Equality audit](../../../../papers/master/reviews/E34_MIDDLE_WEYL_EQUALITY.md) ·
[Curvature convention](../../../FirstOrderTwistor/GeometricChiralBlock.lean)

## Count normalization and selection

`prob_twoMiddle_lower_bound` integrates the almost-everywhere
inequality $m\ge 2+\mathbf 1_{\{m\ne 2\}}$, using the natural-valued
count and its integrability under a probability measure. Consequently
`prob_twoMiddle_gt_threeQuarters` has the strict mean premise
$\mathbb E[m]<9/4$. The law in `twoMiddle_probability_boundary` has
mean $9/4$ and exactly $3/4$ probability of two, the correct
endpoint for the abstract implication. `prob_regular_twoMiddle_eq`
uses a conull regular set, so `exists_regular_twoMiddle_with_data`
chooses a direction in that set with exactly two. Its dependent data
are supplied for that very direction through `hdata`. A recognized
marked handle diagram requires a separate geometric or topological
certificate.

`indexedHeight_energy_split` uses the same actual metric and volume for
the complete $U^c$ energy, the middle-locus deficit and the total
energy. Its supplied indexed area identity has the factor $2/\omega$
with $\omega=8\pi^2/3$, accounting in the geometric application for both
$u$ and $-u$. This makes the factor of the count excess $4\omega/3$.
The threshold computation in
`prob_and_exists_regular_twoMiddle_of_subcritical_energy` is
$$
  \tfrac83\omega + \tfrac43\omega\cdot\tfrac14=8\pi^2.
$$
The theorem retains both nonnegative curvature costs and uses the strict
energy threshold. `prob_twoMiddle_lower_of_defect_budget` gives the
corresponding scalar probability bound after both costs have been
deducted. The area identity, the almost-everywhere smooth handle lower
count, and the interpretation of the abstract measure as normalized
spherical probability all enter as geometric inputs. The matrix-valued
density in the integrated theorem is the geometric chiral block of its
given metric. The revised integration source fixes the manifold
measurable space to its Borel space and preserves the count and energy
statements reviewed here.

## Inclusive recognition

On a nonstandard smooth homotopy four-sphere the geometric count floor
and indexed identity give $\int_U\det A\,dV_g\ge\omega>0$, so its
middle-signature locus $U$ is nonempty. The additional premise at the
inclusive endpoint $E_+(g)\le64\pi^2/9$ is
$$
  0<\int_U\left(|W^+|^2_{\mathrm{HS}}-\tfrac83\det A\right)dV_g.
$$
The pointwise inequality only gives a nonnegative integrand. To prove
the strict integral for the actual immersion, use continuity and positive
volume of nonempty open sets. If the integrand vanished throughout a
nonempty open subset of $U$, its principal curvatures there would be
$(k,k,-k,-k)$ with $k>0$. Smooth rank-two eigenbundles then follow
from the projections $(I\pm A/k)/2$. Euclidean Codazzi makes $k$
constant and the two distributions parallel on that subset. Mixed
sectional curvature would then be zero, whereas the Gauss equation
gives $-k^2$. Formalizing this exclusion and its passage to the strict
integral, together with the geometric indexed area and handle-count
inputs, closes the inclusive argument. The scalar proof and the
Gauss specialization support those steps.

**Verdict.** The reviewed formulas, sign conventions, count constants
and selection premises agree with the stated pointwise and conditional
results. The inclusive recognition theorem still requires the strict
geometric integral and the actual geometric count inputs.
[Gauss–Codazzi and integrated proof](../../../../papers/master/reviews/E34_MIDDLE_WEYL_EQUALITY.md#sharp-pointwise-estimate-and-strict-integrated-estimate)
