# The neck problem and its role in smooth recognition

25 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The exact serving model and reasoning
effort are unavailable. This is a conceptual scoping note for SEC-B36.
It uses the revised Sections and connections manuscript, in particular
Sections 11–15, and the research record through E61. The source version
is recorded in the [sub-investigation README](../../README.md) and the
[manuscript provenance](../../../manuscript/README.md).

## The sequence and the target

Let \(M\) be a smooth closed connected oriented homotopy four-sphere,
and let \(g_i\) be smooth Riemannian volume-one Yamabe minimizers with
\(Y_i>0\). Write \(E_\pm(g_i)=\int|W^\pm_{g_i}|_{\mathrm{HS}}^2dV_{g_i}\)
for the chiral curvature-operator energies. The signature is zero, so
\(E_i=E_+(g_i)=E_-(g_i)\) and the full four-index integral is \(8E_i\).
The fixed-margin question concerns
\[
 4\pi^2\le E_i\le8\pi^2-\delta,\qquad
 \mathfrak B_i=\int_M |B_{g_i}|\,dV_{g_i}\longrightarrow0,\qquad
 \delta>0 .
\]
The marked class in the manuscript has a representative round on a
coordinate ball. In Yamabe gauge that ball is conformally flat and
its volume can tend to zero. Gauss–Bonnet gives
\[
 Y_i^2/48=8\pi^2-E_i+\tfrac14\int_M|\operatorname{Ric}_{0,g_i}|^2\,dV_{g_i}.
\]
Together with the round upper bound for \(Y_i\), this gives a uniform
positive Yamabe lower bound and bounds the total \(L^2\) Riemann
curvature. Both the full Weyl energy and the total Bach norm are
conformally invariant. [Manuscript, §§8.3 and 11.1](../../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex)

Where component extraction has supplied an annular identification
between scales \(r_i\ll R_i\), the trimmed neck is
\(N_i(L)=\{Lr_i<\rho<R_i/L\}\), for fixed \(L>1\) and large \(i\).
The logarithmic length tends to infinity. The desired local statement is
\[
 \lim_{L\to\infty}\limsup_{i\to\infty}
 \int_{N_i(L)}|W_{g_i}|_{\mathrm{tens}}^2\,dV_{g_i}=0 .
\]
The component limits account for the two ends before their truncations
are exhausted. The first test can use a spherical link. General neck
identification and possible links \(S^3/\Gamma\) are additional
geometric questions. Even an exact conformally flat quotient cylinder
has zero Weyl energy, so this integral alone cannot identify the link.
[Manuscript, §§14.4 and 15](../../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex)

## What the current estimates require

| Input on the enlarged neck | Consequence of the manuscript | Required limiting control |
| --- | --- | --- |
| One Euclidean chart \(g=\delta_{\rm eucl}+v\), with small \(\varepsilon=\lVert v\rVert_\infty\) and \(K=\lVert D^2v\rVert_{L^2}\) | \(\mathcal W\le C\varepsilon[\mathfrak B+(K+\varepsilon)(1+\varepsilon K)]\) | The chart deviation tends to zero in the neck limit and \(K\) stays bounded. |
| The same chart with \(v\) Euclidean transverse traceless | \(\mathcal W\le C(\varepsilon\mathfrak B+\varepsilon^2)\) | The amplitude tends to zero or is controlled by vanishing end data and forcing. Fixed small amplitude yields a small remainder. |
| A function \(t\) and transverse field \(X\) with \(X(t)=1\) | A cutoff integral of \(\mathcal W\) is bounded by \(8\Lambda\mathfrak B+4\lVert W\rVert_2\mathfrak d\) | \(\Lambda=\sup\lvert X\rvert\lvert\nabla t\rvert\) stays bounded and the weighted defect \(\mathfrak d\), involving \((L_Xg)_0\) and its first derivative, tends to zero. |

The chart estimate uses cutoffs supported in two shells with
scale-invariant norms. The intrinsic identity works on any supplied
cross-section with the stated geometric control. An exact transverse
conformal Killing field forces an exactly Bach-flat neck to be
conformally flat. The linearized equation has no homogeneous modes
carrying nonzero \(W'\) in \(-2<\operatorname{Re}\mu<2\). Its first
curvature exponents \(\pm2\) suggest an estimate for energy far from the
ends. The homogeneous result leaves the general forced annular boundary
estimate open. [Manuscript, §§14.3–14.6](../../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex)

## The analytic difficulty

- **Compatibility across scales.** If \(e_j\) is the local \(L^2\)
  curvature norm on a dyadic shell, an energy bound controls
  \(\sum e_j^2\). Small coordinate errors on individual shells can
  accumulate according to \(\sum e_j\). A sequence with \(N\) terms of
  order \(N^{-1/2}\) illustrates the difference. A long-neck gauge
  requires a summable estimate or cancellation in the transitions.
  The logarithmic conical model in §14.5 is a check on proposed
  gauges. It can have large transverse traceless amplitude even when
  the metric is close to flat in its conical chart.
- **Critical forcing.** In flat transverse traceless gauge
  \(B'(h)=-\tfrac14\Delta^2h\). The inverse is logarithmic in dimension
  four. Flat divergence-freeness changes the logarithmic potential
  into a bounded matrix kernel. In the nonlinear equation \(B_g\)
  is covariantly divergence free and the mixed tensor density
  satisfies (15.1). The right side couples \(B_g\) to first metric
  derivatives. The fourth-order part of \(B_g-B'(v)\) also contains
  terms of the form \(vD^4v\) and \(DvD^3v\). Once derivatives are
  moved to the kernel, a weak-\(L^2\) kernel meets products that
  need endpoint control. The flat \(L^{2,1}\) estimate for the Hessian
  suggests one space for this argument. Annular summability needs
  its own estimate. [Manuscript, §§14.5 and 15](../../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex) · [Hernandez–Spector, Theorem 1.1](../../../../../../../references/SOURCE_NOTES_SEC_ANNULAR_20261124.md)
- **Geometry of the complement.** One needs a decomposition into
  regular regions and necks with oriented comparison embeddings
  and a limit for the remaining Weyl energy. In the exact
  Bach-flat setting, Chang–Qing–Yang use the critical equation on
  each source metric in the local regularity and neck arguments.
  The perturbation considered here has only scale-invariant \(L^1\)
  control of the forcing. [Chang–Qing–Yang, Theorems 2.4 and 3.1 and §4](https://arxiv.org/pdf/math/0508621) · [Existing primary source record R97](../../../../../../../references/SOURCE_NOTES_SEC_20261124.md#fixed-margin-bach-concentration--24-november-2026)

## What the energy identity would buy

Assume the smooth compactified base, smooth scalar-flat ALE
components and disjoint oriented comparison truncations of
manuscript §12.4. Compactification produces smooth positive-Yamabe
Bach-flat homotopy spheres under those hypotheses. Convergence gives
\(e_0+\sum_j e_j\le e=\lim E_i\), with all energies measured in one
chirality. If the unaccounted regions are exhausted by necks whose
energy vanishes, equality holds. A supplied nonflat smooth ALE bubble
\(X\) with an embedded full core then has
\[
 e_X>4\pi^2,\qquad 0<e-e_X<4\pi^2-\delta.
\]
The first inequality comes from the closed gap after
compactification, and the positive lower inequality is the separate
residual estimate. The other bubbles must be flat. The smooth
positive-Yamabe Bach-flat base also has zero energy by the closed
gap, since its energy is at most \(e-e_X\). Equality would therefore
give \(e=e_X\), a contradiction. The resulting restriction is strong
for the supplied smooth compactification class. Orbifold base or
intermediate components require their own compactification and
energy estimates. [Manuscript, §§11.3–12.4 and 15](../../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex)

With no nonflat bubble, the identity would place all energy on the
closed base. A positive closed critical value is still possible.
If the limit \(e\) is strictly below the first such value of §12.3,
the same identity would rule out the sequence. If the smooth
comparison hypotheses and complete accounting were proved for every
sequence with vanishing Bach norm in a closed subband strictly below
that value, they would give a positive lower bound for
\(\mathfrak B/E_+\) on that subband whenever the family is nonempty.
The lower bound would keep the strain obstruction from diverging
through a vanishing gradient. An upper bound for the metric cost
of the radial lift would still need a directional inverse estimate.

To use this for smooth Poincaré one still needs a construction on
every starting \(M\) and
either compactness on that same smooth manifold with a surviving
round mark or a deformation reaching \(Y>0\), \(E_+<4\pi^2\).
In the compact-gauge theorem a surviving positive-volume mark forces
the Bach-flat limit to be conformally round. A sequence confined to
the positive band would then be impossible. That contradiction
can help a continuation argument if it already controls how
failure of continuation produces a sequence in the band.
[Manuscript, Proposition 1.1, §§12.3, 13.1 and 15](../../../manuscript/twistor_sections_and_chiral_weyl_curvature.tex)

## First questions for SEC-B36

A bounded linear test would fix a round spherical annulus, two end
shells, and a compactly supported perturbation or a specified
boundary condition. The target is an estimate for the sum of the
dyadic \(L^2\) Weyl norms by the end data and the total \(L^1\)
linearized Bach forcing, uniformly in the length. A proof must
account for general modes and gauge directions. An alternative
bounded test is to isolate the two highest-order quadratic terms
in the coordinate conservation system and decide whether the
endpoint estimate can absorb them. Either test would give a precise
reason to advance toward a nonlinear gauge, or identify the term
that blocks this use of it. SEC-B36 owns the choice. SEC-E62 remains
reserved for a specified test after that choice.
[Parent register](../../../research-progress/REGISTER.md) · [Handoff after E61](../../../continuation-notes/05_AFTER_ANNULAR_ENERGY_AND_CONSERVATION_20261124.md)
