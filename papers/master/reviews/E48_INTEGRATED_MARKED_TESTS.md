# SP4-MASTER-E48 · Integrated marked tests and near-Einstein recognition

25 November 2026 (UTC). Prepared for Edward B. Baker III with OpenAI Codex
assistance. Bounded independent editorial and proof audit of the six
newly integrated statements. Actual serving model and reasoning effort
were unavailable. Working Git base
`a1a8b8866fafd24cc11236b426fcd67d7cdfee2b`. The checked TeX revisions are
working versions over that commit, identified below. The review concerns
the new statements and the specific prior dependencies they use.

**Disposition.** The six proof mechanisms agree with the indicated
hypotheses, with one overbroad geometric sentence in the exterior-height
example. Nesting of reference normal images requires star-shapedness about
the origin of the common quadratic coordinates. The other requested changes
clarify the scope of the sign, collar, and compactness arguments. The
general exterior-height proposition does not use nesting.

## Exterior height and marked surgery

The exterior-height quantifier is sound. For almost every direction,
the supplied scalar extension is Morse on the actual closed homotopy
sphere and its first derivative agrees with the full derivative of the
prescribed height at the seam. The seam normal images are null, so all
the counted points lie in the two interiors. The global two-point lower
bound uses the preceding Morse handle argument for any Morse function.
It therefore applies without a global hypersurface immersion, common
choices of scalar extension for different directions, or a Yamabe sign.
The restricted area formula has two normal signs. Hence the integrated
middle-signature determinant is at least \(D/2\), and \(D>0\) forces an
open middle-signature subset in the exterior interior. The strict local
Codazzi comparison then gives \(E_+(P)>4D/3\) on a nonstandard sphere.
The statement is sufficient at its inclusive endpoint.
[Exterior-height proposition](../manuscript/immersion_entry.tex#L208) · [E42](E42_HEIGHT_AND_COST_AUDIT.md)

The quadratic reference graphs give the stated measurable profile,
independently of their scale factors \(R_j\). Rigid motions rotate normal
images or switch the chosen normal sign, which leaves the antipodal count
well-defined. The claim about nested images should say **star-shaped about
the origin**. Under \(u\mapsto u_{1:4}/u_5\), the images are dilates of
\(-\operatorname{diag}(-1,-1,1,1)\Omega\) about zero. For example, the
translated ball \(B(e_1,1/10)\) is star-shaped about its center, yet its
dilates by \(1/2\) and \(1\) are disjoint. Retaining common horizontal and
vertical graph coordinates gives the two-largest-area formula for the
origin-star-shaped case. Clarify that the exterior immersion agrees with
the reference on the exterior side of a marked bicollar. That agreement
supplies a smooth scalar filling from the interior coordinates.

The marked surgery tests preserve the actual lower and upper boundary
coordinates. A framed slide pulls the outgoing marking back by the trace
diffeomorphism. In the one-sided case the zero matrix follows from the
rank-two surgery homology. Proposition 3.1 of Gompf–Scharlemann–Thompson
requires a two-component tunnel-number-one link with this surgery and
identifies the unlink. Their Proposition 3.2 covers a link containing an
unknot and gives the necessary framed slides. Laudenbach–Poénaru applies
to the resulting trace with its actual marking. [GST, Propositions 3.1–3.2, pp. 2313–2314](https://msp.org/gt/2010/14-4/gt-v14-n4-p13-p.pdf) · [E43](E43_SURGERY_AUDIT.md)

For the mixed \(S^3\) case, the dual attaching knot initially has integral
framing. One phrase can make the proof self-contained at the Property R
step: the framing is zero because the surgery has \(H_1=\mathbb Z\).
The forward reference to the finite-cut proof is valid. It invokes only
the parametrized standard-disk complement argument there, independently
of the finite-cut energy premises. The mixed \(\#_2(S^1\times S^2)\) case
implements E43's one-surgery proof. The proof of GST Proposition 3.2 gives
a framed isotopy in each actual \(S^1\times S^2\) end, and the boundary
extension theorem absorbs the gluing mismatch over the substituted
genus-two 1-handlebody. Van Kampen forces the inverse-surgery circle to
represent a generator of the resulting \(S^1\times S^3\). Relative
parametric transversality gives isotopy of that circle to the product core:
the zero-tangent parameters have dimension two, the equal-time pair
parameters dimension three, and the conditions each have codimension
four. The framing is transported into the arbitrary-gluing conclusion
of Theorem A at \(p=1\). The discussion explicitly leaves selection of
either mixed cut type or a qualifying one-sided link open.
[Marked surgery proposition](../manuscript/immersion_entry.tex#L252) · [E43](E43_SURGERY_AUDIT.md)

## Anchored physical annulus

The width quantifier matches E41. Fix the anchor and ellipticity constants
first. The volume lower bound and slope estimate on the ramps bound an
entire smaller-volume component by \(C\rho_i^4\). The radial outer side
contains a shell whose elliptic volume bound exceeds that quantity once
\(L\) is chosen. The outer side is consequently the larger component.
Noncollapse bounds the distance of every point of the inner side from
\(S_i(1)\) by \(O(\rho_i)\), which also bounds its distance from the anchor
after using the controlled intrinsic diameter of \(S_i(1)\). The chosen
\(L\) fixes both the volume and the path-length barrier before the source
limit. The low-curvature wide chart excludes the entire smaller charged
ball from the protected band by the first-exit estimate. The anchor then
locates the center on the coordinate-inner side. The median exterior is
opposite, and both charged sets miss the trim. These are the hypotheses
actually used by the central splice argument. The wide chart need not be
identified with a whole metric distance shell.
[Anchored-annulus corollary](../manuscript/critical_annulus.tex#L152) · [E41](E41_SMALL_SIDE_AUDIT.md)

In the variant with uniform and strong \(W^{1,4}\) convergence to the flat
metric, state that the wide chart hypotheses are retained and the strong
convergence replaces the **central** harmonic-coordinate assumptions. The
wide curvature bound is still used to exclude the charged ball from the
protected band. The abstract can similarly name a marked uniformly
elliptic chart at an intermediate physical scale. The newly proved
conclusion locates the full sides once these data are supplied. The
construction or extraction of the chart remains open.

## Exact round boundary form and exterior replacement

For the round form the boundary expression is most precisely the
\(H^{1/2}\)–\(H^{-1/2}\) pairing with the operator
\(\sqrt{1-\Delta_\gamma}\), equivalently its convergent spectral quadratic
form. The unit cylinder has scalar curvature six, and the energy of each
minimizing Fourier mode is \(6(l+1)|f_l|^2\). The compactifying substitution
\(u=fv\) has the correct conformal weight in dimension four. After adding
the indicated compact \(L^2\) shift, the round cylinder potential and the
bounded metric-side scalar potential give equivalent \(H^1\) norms on
their respective spaces. Zero point capacity justifies completing the
compact tests. For a fixed smooth capped metric a nonzero test with
nonpositive energy obstructs positive sign, while strict positivity on
every nonzero test gives a positive lowest eigenvalue by attainment.
The Robin condition has the stated positive coefficient with the outward
normal. On a connected exterior with nonempty boundary, \(R_h\ge0\) makes
the Robin form strict. In the outstanding questions, replace “sign of the
explicit cap” with **Yamabe sign of the capped class**. The check concerns
the closed conformal class and the chosen cap can have negative scalar
curvature. [Round boundary form](../manuscript/marked_cut.tex#L283) · [E45](E45_ROUND_END_FORM.md) · [Lee–Parker, §2, (2.7)](https://users.math.msu.edu/users/parker/YamabeProblem.pdf)

For exterior replacement, the interpolation on disjoint collars can be
estimated in the direct sum of the chiral curvature density spaces.
Restriction to the exterior halves gives the bound
\((\sqrt{e-m}+\eta)^2\le e-m+c\). The total path bound is \(e+c\), and
its strict separation from \(8\pi^2\) supplies positivity and the common
Yamabe lower bound after stretching. At each index the family is finite;
all compact tests on the exterior with cylindrical ends fit in a finite
stretch, by product arclength measured from the fixed outer product
faces. Transfer to the compactification by finite point capacity and
the disk marking gives a smooth competitor on the original type. The
collar matching of these parametrizations can be made explicit by the
collar isotopy in E44. Neither a bound on the number of balls across
indices nor a sign test for the fillings is required. In the outstanding
questions, preserve the separate path-margin hypothesis \(e+c<8\pi^2\)
when describing the application with collar cost \(c<m\). In the
proposition, “a smooth metric \(g\) with \(Y([g])>0\)” would specify the
representative used in the marked charts. [Exterior replacement](../manuscript/chiral_weyl_energy_and_smooth_poincare.tex#L306) · [E44](E44_EXTERIOR_CAP_AUDIT.md)

## Near-Einstein recognition

E46 treats signed determinant gaps on exact Einstein metrics. The new
statement uses a different spectral defect and requires an additional
compactness step. For a counterexample sequence with fixed
\((\delta,p,L,s)\), apply the interior Ricci radius lemma at scale one at
every center, using the global \(L^p\) bound and the volume-one positive
Yamabe hypotheses. That lemma allows the smooth types to vary. Physical
noncollapse and unit volume give bounded diameter. In the harmonic atlas
pass to the limit in the Ricci equation: interpolation implies
\(Z_i\to0\) in \(L^r\) for each \(2<r<p\), and the first derivative products
converge in \(L^p\) by strong \(W^{1,2p}\) convergence. The resulting weak
Einstein limit is smooth by elliptic regularity in the harmonic atlas.
At that stage the smooth compact markings are onto by openness and
compactness in a connected source, so they are diffeomorphisms. Moving
the same-smooth-type sentence after the bootstrap would make that order
explicit.

On smaller chart interiors the inverse-metric coefficient errors times
the bounded Hessians tend to zero in \(L^r\). Interior estimates then
give strong \(W^{2,r}\) and consequently strong \(L^2\) curvature.
The ordered eigenvalues are Lipschitz in the chiral symmetric matrix.
Uniform convergence of the oriented frames and volume densities and
strong \(L^2\) convergence of the curvature therefore transfer the chosen
defect integral to zero. A subsequence of one chirality suffices. The
author PDF of Catino–Dameno, Theorem 1.4, requires compact connected oriented
Einstein geometry, a block \(W^+\not\equiv0\), and
\(\lambda_2\le s\lambda_3\) for a fixed \(s<1\), including the Weyl zero
set. It applies after reversing orientation if needed. A connected
double cover cannot be nontrivial on a simply connected homotopy sphere.
A Kähler form on that closed space would have nonzero squared class,
contrary to \(H^2=0\). Thus the chosen Weyl block vanishes, signature forces
the other to vanish, and the positive Einstein limit is round. The proof
needs no chiral minimizing sequence and transfers no rigidity to the
positive Einstein family without the spectral condition.
[Near-Einstein theorem](../manuscript/ricci_scales.tex#L243) · [E46](E46_EINSTEIN_SIGNED_MASS.md) · [Catino–Dameno, Theorem 1.4 and §4, author PDF](https://cvgmt.sns.it/document/11018/)

## Inputs and checks

The named source passages were checked on 25 November 2026. A static
scan of the main TeX and its inputs found no duplicate labels, missing
references or missing bibliography keys. This packet concerns proof and
editorial checking. It does not certify a PDF build.

| Checked working TeX | SHA-256 |
| --- | --- |
| [Main](../manuscript/chiral_weyl_energy_and_smooth_poincare.tex) | `f5ece6cb00e65ecc7231a764c50ceceea9059dc92851087b406cc0f76330b15f` |
| [Immersion](../manuscript/immersion_entry.tex) | `4f56dfe589d3525e6b94a6183d55300a936a66fa30095177db45e9b1c343776a` |
| [Critical annulus](../manuscript/critical_annulus.tex) | `149bd4b7b66c6626d09a6826df0bf05b844297634702f67650bc7ec4dadddf49` |
| [Marked cut](../manuscript/marked_cut.tex) | `ff85196b791f50d67ed7b622cda3be0faf7c278bedfcd7817d690a7f8b1cac38` |
| [Ricci scales](../manuscript/ricci_scales.tex) | `6a75756b1030c352cf17a5469cf04be88187901ca5b308841aa0ce6554d94ba3` |

| Independent audit input | SHA-256 |
| --- | --- |
| [E41](E41_SMALL_SIDE_AUDIT.md) | `41a2d84abca9cf0c241e5235065612a51df94c9b356e8466982909eaabc9e4e7` |
| [E42](E42_HEIGHT_AND_COST_AUDIT.md) | `7653e2de8eac5fde417d2e186327ef102184c2b790373968cbd1dc63af80045c` |
| [E43](E43_SURGERY_AUDIT.md) | `bbe74e202f5b2ececc5e7e902cd8305a67c57a0318ccd40989b96f2e9a41072a` |
| [E44](E44_EXTERIOR_CAP_AUDIT.md) | `41002510adfd95cf98504dd90bdd2360d93e4b49c66d51fa5b79157593f67d37` |
| [E45](E45_ROUND_END_FORM.md) | `a85b3f51180f2027241aeee420e8f6604fe39c683aa31a8ba7ab3c3e0eae055d` |
| [E46](E46_EINSTEIN_SIGNED_MASS.md) | `28cf9907b8094c0ce4f7c227f6f37a535bb6406f2f1ef64becda821df7b8adca` |
