# E188 — Audit of varying-base compactness and uniform entry in the manuscript

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E audit under B90, configured
`gpt-6.2-sol` / `ultra`. Independent runtime attestation and selected
lead settings are unavailable. I authored inherited E165 and E162
and audited E182/E183 in E185. Earlier relevant audits include
E169, E172, E176, E180 and E184. I did not author E182, E183 or
the new manuscript integration. Independence concerns the compression
and interfaces of the integrated proof. The [request][req] and six
frozen inputs matched. Line numbers refer to the [frozen TeX][tex].

## Disposition

**Pass with local precision edits.** The manuscript integrates the
assessed varying-base theorem and both uniform intrinsic thresholds.
The fixed-base theorem remains intact and is used only after one
smooth reference base and bundle have been fixed. The late-energy
alternative applies the new uniform threshold at one actual unshifted
late slice. Its smooth critical accumulation still uses the fixed
positive shift and bundle normalization. No new proof premise or B90
escalation is needed. [Combined assessment][assess] · [E185][e185].

## Local precision edits

1. **Metric category and end theorem, lines 4505–4507 and
   4534–4538.** State “smooth Riemannian metrics \(g_i\)” explicitly
   in the corollary. Replace the abbreviated “BKN applies” with
   the named Bando–Kasue–Nakajima Theorem (1.5) as cited above.
   State that the whole-ball inclusions pass lower Euclidean growth
   and strong curvature convergence and exhaustion pass the energy
   bound. The rescaled \(W^+\) tends to zero in the positive charts.
   These few words make the supplied-candidate and full-core uses
   explicit at the varying-base step.

2. **Uniform threshold and empty family, lines 5582–5596.**
   Say that the \(\delta\) in the referenced initial inequalities
   is now \(\delta(P_0,D_0)\). The fixed-family \(\delta_{\rm ref}\)
   remains the later proof input. One can also make the empty-case
   quantifier explicit by beginning the proof with “The implication
   is vacuous for an empty bounded family.” No estimate divides by
   \(P_0\), so \(P_0=0\) is included.

3. **Volume reference and polar direction, lines 5603–5604 and
   5627–5629.** The adjoint trace and Pontryagin normalization are
   *following* `eq:native-common-volume`. The labeled equation itself
   is affine transgression. For the form output of \(\sigma_i\)
   specify pullback by \((\Lambda^2 df_i)^*\), giving the written
   type from \(f_i^*\operatorname{ad}P_i\) to \(\Lambda^+_{g_i'}\).
   At lines 5637–5642, make the other two typed identities explicit:
   \(F_{\widetilde A_i}=H_i^*F_{A_i}\) and
   \(g_{\widetilde A_i}=f_i^*g_{A_i}\).
   The positive curvature plane and round-compatible sign are
   preserved by the oriented base and native fiber maps.

4. **Uniform late threshold, lines 373–375 and 5819–5820.**
   The introduction's “same positive family threshold” can read
   “the uniform threshold \(\delta(P_0,D_0)\) for those bounds.”
   Update the TeX provenance comment to name E182/E183/E185 for that
   uniform threshold at the unshifted slice. E177/E178 supplies the
   fixed-family lemma used inside it. The displayed theorem and
   the actual proof already point to the correct uniform statement.

These are precision changes to the integrated exposition. The
inherited bounds, convergence targets and proof mechanism stand.

## Varying-base metric proof

The corollary imports the same uniform absolute Ricci
Hilbert–Schmidt bound, positive Weyl operator Hilbert–Schmidt
bound, positive lower total volume and finite diameter upper
bound. It prescribes neither a common initial smooth type nor a
common atlas. The full \((0,4)\) norm in the curvature energy
counts both antisymmetric pairs over ordered slots. In that
convention the norm of the \(+\) Weyl part is twice the
ordinary operator Hilbert–Schmidt norm. This distinction is
preserved at the rescaling and energy steps.

Lines 4516–4526 correctly identify the shared proof as one on
individual manifolds and fixed Euclidean coordinate balls.
The harmonic-radius convention, \(p=8,m=2,\eta=1\), gives a
positive infimum on each smooth compact metric separately.
At approximate minimizing centers, metric scaling by \(r_i^{-2}\)
gives global radius at least one and base radius at most
\(1+i^{-1}\). The rescaled Ricci and \(W^+\) bounds gain
\(r_i^2\). Applying Bishop–Gromov on each \(M_i\) gives
uniform lower volumes \(ct^4\) at fixed rescaled radii
and the model upper bounds needed for packing. The finite
distance lists and the pointed limit do not use a common
input identification.

The harmonic coordinates have a uniform ambient interior
margin on each \(M_i\). If a compact limit overlap uses
coordinates \(|u|\le b<B\), the metric ball of radius
\((B-b)/(2\sqrt m)\) about the corresponding approximating
chart point stays in its larger chart. This gives actual
transitions within \(M_i\), and the limit uses the same
Euclidean domains. The rescaled harmonic Ricci equation makes the
weak metric limit smooth and gives strong \(W^{2,8}\) by
the difference estimate. Transition differences and their
first derivatives give strong local \(W^{3,8}\).
The resulting positive oriented atlas realizes the smooth
complete pointed limit and its metric distance.

For a fixed compact region in that smooth limit, use the
finite cutoff-coordinate maps and project to its smooth
Euclidean image. The inverse branches in the larger
convex charts are uniquely defined and coincide on overlaps:
two candidates represent the same metric point up to vanishing
error, and the uniform chart margin puts both in one chart
on the same \(M_i\). This constructs actual smooth comparison
embeddings on neighborhoods of whole compact regions into the
respective \(M_i\). The based correction preserves orientation
and the strict margins. The inverse-coordinate estimates give
strong \(W^{2,8}\) pullback convergence and the intrinsic-ball
inclusions in the cited preceding proof. Thus lower Euclidean
growth and curvature convergence use actual maps.

The Chern–Gauss–Bonnet bound at lines 4528–4533 is uniform
because \(\chi(M_i)=2\) separately, and not because the
smooth manifolds were previously identified. Its exact bound
is \(64\pi^2+4K^2\mathcal V_{-K/3}(D')\) in the full
tensor convention. In four dimensions constant scaling preserves
the integral. Strong local curvature convergence under the
embeddings and exhaustion pass finite energy to the limit.
The scaled chiral estimate gives ASD in the chosen orientation.

If the complete metric limit is flat, the Euclidean universal
cover argument leaves only the Euclidean space itself. A free
nonidentity Euclidean deck motion has a nonzero translation
along the fixed space of its orthogonal part, and the cyclic
intermediate quotient's finite-width slab gives at most cubic
volume growth. The quartic lower bound excludes that case.
On the Euclidean alternative the based embeddings reach a
fixed Euclidean ball of radius five. The harmonic Dirichlet
coordinates on radius four approach the Euclidean coordinates
in \(W^{3,8}\) on radius three. Changing coordinates gives
strong \(W^{2,8}\) and uniform convergence of the metric
matrix to the identity. Whole-ball coverage ensures that one
can use them on the entire intrinsic radius-two ball about
the near minimizer in its own \(M_i\). Both harmonic-radius
conditions are then strict at radius two, contrary to the
normalized upper bound. No radius continuity or shared
smooth type enters.

The remaining smooth connected complete nonflat Ricci-flat
ASD limit has the Euclidean-growth and finite-energy hypotheses
of Bando–Kasue–Nakajima Theorem (1.5). In dimension four its
order-four ALE end and Remark (1.8)(1) give the smooth
quotient and all derivative orders. Orientation gives the
free end group in \(SO(4)\). The comparison embedding of a
sufficiently large full smooth radial truncation has its
target in each late \(M_i\) separately. The full-core lemma
applies there because each is a closed oriented integral
homology four-sphere. This excludes the vanishing-radius
subsequence before the choice of a reference.

For a positive radius floor, finite global nets and their
strict chart margins give finite inner chart coverage on each
\(M_i\). All harmonic transitions still compare charts within
one \(M_i\). Compact embedding and the twice-used interior
Schauder estimate yield the cited \(C^{1,5/12}\) metric and
\(C^{3,1/3}\) transition convergence. The finite cutoff
blocks give smooth global embeddings \(I_i:M_i\to\mathbb R^{5A}\)
using one Euclidean target. Coordinate recovery from a positive
block proves injection and immersion on each compact source.
The cutoff separations and Hessian bound give the uniform
tube radius before selecting the reference. At gap \(r\)
from an image, two competing nearest points have coordinate
separation at most \(2C_b r\) in one convex chart. On their
segment the Hessian lower bound
\(I-Lr(1+2LC_b)I\ge I/2\) makes the foot unique.

The smaller displacement \(\delta\) is likewise fixed
before \(i_0\). The smooth reference projection gives
\(P_i=I_{i_0}^{-1}\pi_{i_0}I_i:M_i\to M_{i_0}\).
Its reference foot lies within \(2C_b\delta\) in coordinates.
Subtracting the foot Hessian \(H\) from the numerator of the
derivative formula, using \(\|H^{-1}\|\le2\), yields
\[
 |Dq-I|\le2\bigl[L(\delta+2LC_b\delta)+L\delta\bigr]
             =4L(1+LC_b)\delta<1/2 .
\]
Thus the map is locally invertible and orientation preserving.
Two identified points in a source have embedding separation
at most \(2\delta\), and hence lie in one larger convex
source chart. The same derivative bound proves injectivity
there, hence globally. The image is open and compact in the
connected smooth reference, thus surjective. This constructs
actual \(f_i=P_i^{-1}\) before asserting a common smooth type.
The inverse maps have local strong \(C^{2,1/4}\) convergence,
bounded third derivatives and bounded coordinate Jacobians.
The pullback formula in the one fixed smooth reference atlas
then gives positive strong \(C^{1,1/4}\) convergence.
The \(D^2h_i\) term has uniform \(L^8\) bound by change of
variables and bounded Jacobians, and the other terms use the
lower coefficient bounds and bounded third inverse derivatives.
This gives the stated weak \(W^{2,8}\) subsequence with
the same limit. Neither smoothness of the unscaled limit
nor a bound on map derivatives in unrelated atlases is used.
[E182 derivation][e182] · [Audit][e185].

## Uniform native entry and actual bundle maps

The uniform theorem uses the same smooth positive-plane,
round-compatible data and native negative Killing pairing,
metric and original clock as the preceding fixed-family
theorem. Fix finite \(P_0\ge0\) and \(D_0>0\) first.
If the asserted implication with one positive
\(\delta(P_0,D_0)\) fails, there is a sequence of bad
data with these two bounds and energies tending to zero
on potentially different bases and bundles. This quantifier
argument includes empty classes. The strain conversion has
\(C=(1+4\sqrt3)/(4\pi/5)\) and gives
\(\mathcal G\le CP_0\). The native floor-free curvature
bound gives
\(Z=\sqrt6/2+(42+8\sqrt3)CP_0\),
\(|W^+|_{\mathrm{op,HS}}\le Z\) and
\(|\operatorname{Ric}|\le3+(2+2\sqrt3)Z\).
These use the live ordinary two-form and symmetric tensor
norms, native scalar target \(6\), and trace-three bound
\(|q|\le\sqrt6\). They are valid at \(P_0=0\).

The native real adjoint trace on an orthonormal internal
frame is \(-\delta_{ij}\), so the ordinary Pontryagin
representative gives
\[
 v_i=\tfrac13\int_{M_i}\langle F_{A_i}\wedge F_{A_i}\rangle
     =\tfrac{8\pi^2}{3}
          \langle p_1(\operatorname{ad}P_i),[M_i]\rangle
     \ge \tfrac{8\pi^2}{3}.
\]
The pairing is integral and strictly positive by native
definiteness in the chosen orientation. The proof does not
require a common characteristic number. The metric bounds
and this uniform volume lower bound permit the varying-base
corollary. Only its actual smooth diffeomorphisms
\(f_i:M_{\rm ref}\to M_i\) are used for the bundle transport.

Choose one smooth \(g_b\) on \(M_{\rm ref}\), and define
\(g_i'=f_i^*g_{A_i}\). The positive tangent map
\(C_i=(g_b^{-1}g_i')^{-1/2}\) is an orientation-preserving
isometry from \(g_b\) to \(g_i'\). Its inverse pullback
on covariant two-forms gives
\(J_i:\Lambda^+_{g_b}\to\Lambda^+_{g_i'}\).
The signed curvature polar isometry
\(\sigma_i=-F_{A_i}^\sharp Q_i^{-1/2}:
\operatorname{ad}P_i\to\Lambda^+_{g_{A_i}}\) is oriented.
Pulling back its form output by \(df_i^*\) gives
\(\widetilde\sigma_i:f_i^*\operatorname{ad}P_i
\to\Lambda^+_{g_i'}\). Thus
\(\widetilde\sigma_i^{-1}J_i:
\Lambda^+_{g_b}\to f_i^*\operatorname{ad}P_i\) is the
correct fiber map. The faithful adjoint \(SO(3)\) frame
identification yields the smooth equivariant
\(H_i:P_{\rm ref}\to P_i\) over \(f_i\), where
\(P_{\rm ref}\) is the fixed native-model oriented
frame bundle of \(\Lambda^+_{g_b}\). No frame of the
unsmoothed metric limit is used.

Curvature, the native metric and signed Gram data are
natural under \(H_i^*\). Its fiber rotation and base isometry
respect the perpendicular projection, the \(\Gamma\)-horizontal
derivative and the live covector derivative in \(\Psi\).
The whole unit sphere area remains \(4\pi\), yielding
\(\Psi(H_i^*A_i)=\Psi(A_i)\circ f_i\).
Diameter and total defect energy are preserved, the latter
by the pulled-back volume form and change of variables.
Only after fixing \(M_{\rm ref},P_{\rm ref}\) does the
proof invoke the assessed fixed-family
\(\delta_{\rm ref}>0\). The same geometric bounds and
vanishing energies give strict membership for late indices.
No pair convergence is required to apply that lemma.

The global original solution \(B_i(s)\) on \(P_{\rm ref}\)
pulls back to \(P_i\) by \((H_i^{-1})^*\). It starts at
\(A_i\) and solves the same original native equation by
time-independent naturality. Original uniqueness verifies
the actual trajectory. If \(R_i:P_{\rm ref}\to P_{\rm rd}\)
is its positive-time entry map, then
\(R_i\circ H_i^{-1}:P_i\to P_{\rm rd}\) satisfies
\[
 (H_i\circ R_i^{-1})^*(H_i^{-1})^*B_i=(R_i^{-1})^*B_i.
\]
This is actual entry at the same positive native time.
If \(L_i^{\rm rd}:P_{\rm ref}\to P_{\rm rd}\) supplies
the one fixed reference round limit, the actual limit on
\(P_i\) is \((L_i^{\rm rd}\circ H_i^{-1})^*(A_0,F_0)\),
and its base map composes with \(f_i^{-1}\). A fixed
smooth pullback preserves the exponential rate with constants
depending on the datum and comparison. Thus every sufficiently
late bad datum has the entire property, a contradiction.
[E183 derivation][e183] · [Combined assessment][assess].

## Universal small density and late energy

Put \(p=\sup_M\Psi(A)\). The static condition
\(Cp\le\varepsilon_0\) gives \(|q|\le72Cp\) and
\(\operatorname{Ric}\ge3g/4\). The three normal parallel
sine variations on a length-\(l\) minimizing unit-speed
segment have summed index nonnegative and at most
\(3\pi^2/(2l)-3l/8\), hence diameter at most \(2\pi\).
For \(p\le1\), \(R_0=3+(2+2\sqrt3)(\sqrt6/2+(42+8\sqrt3)C)\)
bounds the absolute Ricci norm, hence
\(\operatorname{Ric}\ge-R_0g\). In dimension four
the model comparison sectional curvature is \(-R_0/3\).
The radius-\(2\pi+1\) ball is the whole base and
Bishop–Gromov gives
\(\operatorname{Vol}\le V_{\max}=\mathcal V_{-R_0/3}(2\pi+1)\).
Both constants are independent of the base and bundle.
For \(\delta_0=\delta(1,2\pi)>0\), half the minimum
of \(1,\varepsilon_0/C,\sqrt{\delta_0/V_{\max}}/(72C)\)
therefore gives \(\mathscr E(A)\le V_{\max}(72Cp)^2
<\delta_0/4<\delta_0\). The strict inequality and empty-class
and zero-bound cases are all covered. The threshold is
universal and non-effective for the stated data.

In the late result the proof still uses the two bounds only
at the supplied \(t_n\), with finite maximal time excluded
by the earlier continuation criterion. Smooth critical
accumulation uses \(t_n+s_0\) and
\(K_n=h_n\circ j_n(s_0)^{-1}\) on the same bundle.
The invariant energy squeeze and directional gradient argument
from the repaired E184 integration are present, and no
smooth limit of unshifted data, uniform shifted geometry,
or rough recovery is assumed. If the limiting energy is
strictly below the new uniform \(\delta(P_0,D_0)\),
then some actual unshifted late slice meets that strict
energy condition and the two supplied bounds. Its original
tail is round-convergent by the uniform theorem and agrees
with the supplied path by smooth original uniqueness.
Thus \(\mathscr E_\infty=0\). If instead the limiting energy
is positive it is at least the uniform threshold, and the
critical accumulation is nonperfect. That case has no
uniqueness or whole-trajectory convergence assertion.
[Earlier manuscript disposition][prev] · [Combined assessment][assess].

## Front matter, references and protected section

The abstract and introduction state initial energy and geometric
hypotheses, or small initial supremum of the whole-fiber
density, and correctly describe uniform thresholds over the
stated existing-data category. They retain the separate static
rank-one exclusion and the fixed positive shift and bundle
normalization for smooth late accumulation. The closing
scope keeps initialization and arbitrary-data evolution open.
It does not assert a universal entry time, uniform map-derivative
bounds, or datum-independent higher convergence constants.
The continuation and fixed-base entries remain in place.

Anderson's undated author text remains the framework for
the harmonic-radius argument, with rendered Definition 2.1,
(2.1)–(2.2) on p. 4 and proof of Theorem 2.2 on pp. 5–6.
The separate use of his fixed-base compactness statement retains
its injectivity premise. Wright's v2 reading remains the source
for smooth full-core classification and the needed circle-action
passages. Bando–Kasue–Nakajima's Theorem (1.5) and
Remark (1.8)(1) in the inspected published scan apply to the
supplied smooth Ricci-flat limit. The uniform transport step uses
the assessed native identities and fixed-family theorem, with no
new source theorem. Fine v2 §1.6 and §5 remain distinguished
as the connection-energy question and the separate definite-triple
result. No source inspection was upgraded.

The comment-stripped TeX has 77 citation commands, 79
key occurrences and 37 distinct cataloged keys, matching the
37 bibliography entries in first-citation order. All 348
labels are unique and the 453 reference occurrences resolve.
The protected section
`\section{The closed defect equation at the round connection}`
has exactly 4,501 bytes at frozen lines 7963–8090, up to
the next section header. Its SHA-256 is
`c0e411175c77e13e96aa8ab41f55e2c2593f30e72a5c44560e1baf65068a3fab`.
Only the designated audit and return were written. The lead owns
build and visual checks. [Return and frozen digests][ret].

[req]: ../research-progress/handoffs/SP4-CME-E188_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E188_RETURN_v1.md
[tex]: ../manuscript/chiral_curvature_and_metric_evolution.tex
[assess]: E182_E185_UNIFORM_ENTRY_ASSESSMENT_20261122.md
[e182]: ../notes/182_VARYING_BASE_METRIC_COMPACTNESS_20261122.md
[e183]: ../notes/183_CONDITIONAL_UNIFORM_INTRINSIC_ENTRY_20261122.md
[e185]: E185_VARYING_BASE_UNIFORM_ENTRY_AUDIT_20261122.md
[prev]: E180_E184_MANUSCRIPT_DISPOSITION_20261122.md
