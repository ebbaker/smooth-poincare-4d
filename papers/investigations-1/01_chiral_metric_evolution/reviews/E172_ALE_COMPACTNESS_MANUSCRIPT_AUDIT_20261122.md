# E172 — Audit of the ALE compactness manuscript subsection

22 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI assistance. Fixed E audit under B85, configured `gpt-6.2-sol` /
`ultra`. Independent runtime attestation and actual lead settings are
unavailable. I authored inherited E165 and E162 and performed the E169
audit of E168. I did not write the manuscript integration. This audit
compares that integration against the assessed dependencies. The
[frozen request][req], TeX and seven other frozen inputs were verified.
Line numbers below refer to the frozen [TeX][tex].

## Disposition

**The compressed argument passes with local precision repairs.** The
subsection contains the rescaled compact comparison maps, the Euclidean
Dirichlet contradiction, the full-core obstruction, and the separate
unscaled smooth-reference argument. The flow application uses the
assessed topology and sequential criteria in the original identification.
No new proof premise or B85 escalation is needed. The changes below
record the orientation step, make two compressed chart arguments
explicit, correct the distance-sphere statement and refine locators.

## Local repairs

1. **Orientation and overlap passage, lines 4158–4159, 4194–4198 and
   4325–4326.** At first selection choose the harmonic charts positive
   for the given orientation, by reflecting one coordinate when needed;
   this preserves the radius bounds and harmonicity. Carry the choice
   into the unscaled charts as well. The limit transition and inverse
   are smooth, and the signs on the approximating transitions then give
   the positive limit atlas. Before invoking the transition difference
   equation, explicitly say that uniform interior \(W^{2,p}\) estimates
   and \(C^0\) convergence pass
   \(a_i^{jk}\partial_{jk}\theta_i=0\) to the limit, and the already smooth
   limiting coefficients make \(\theta\) smooth. These are inherited
   E165 steps that justify the stated oriented compact embeddings.

2. **Packing quantifiers and finite coverage, lines 4140–4142 and
   4323–4326.** State the packing bound for each fixed small radius.
   Add that the unscaled centers approximate a finite
   \(\rho/(16\sqrt m)\)-net of the compact metric limit. The distance
   errors and the chart margin put every point of every sufficiently
   late approximant in an inner \(B_\rho\) chart. This spells out the
   uniform coverage used to choose an inner chart at a nearest point
   of the Euclidean embedding.

3. **Ball comparison and distance spheres, lines 4235–4246 and
   4256–4258.** Write \(0<\varepsilon<t\) in the inclusion. For its
   inner direction the chart comparison sends the approximating
   point under \(P_i\) strictly inside the limit ball before applying
   the unique inverse branch. For its outer direction a minimizing
   \(h\)-geodesic stays in the constructed domain and its
   \(F_i^*\bar g_i\) length tends uniformly to its \(h\)-length.
   Replace “represents them as images of tangent three-spheres” by
   “puts each distance sphere inside the exponential image of
   the tangent sphere of the same radius.” The latter inclusion
   suffices for volume zero. The exponential image can include
   points reached by geodesics that have ceased to minimize.

4. **Exact ALE definition and Wright locator, lines 3998–4000,
   4033–4039 and 10857–10858.** Spell out “oriented” and replace
   “decay of all metric derivatives of positive order” by
   \(\partial^\ell(h-\delta)=O(r^{-\nu-\ell})\) for all \(\ell\ge0\)
   in the lifted quotient coordinates, for some \(\nu>0\).
   This removes ambiguity about the metric itself at order zero.
   At the Euler characteristic step cite §2 Table 1 for
   \(\chi(\widetilde X)=k\) and §3 Remark 3 for
   \(\chi(X)=1+b_2(X)\). The degree-\(d\) cover multiplies Euler
   characteristic because the spaces retract to a finite CW core
   and its finite cover. Locate the trivial simply connected
   case in §8's proof of Corollary B, which identifies the
   one-monopole model as flat. Add these passages to the Wright
   inspected-text line or the local cite. Keep \(k\) as the actual
   monopole count of §7.1 and do not use the inconsistent
   “\(k-1\) monopoles” phrase in §8 to assign the count.

5. **Anderson locator, lines 4106–4110 and 10849.** The existing range
   includes the correct passages. For a precise citation use
   “Definition 2.1, (2.1)–(2.2), p. 4, and the proof of Theorem 2.2,
   pp. 5–6” in the undated author PDF. Add Definition 2.1 to the
   inspected-text bibliography line. If the volume comparison
   is given a locator, (2.12)–(2.13) is on p. 7. These are the
   rendered-page corrections in the assessed record. The theorem
   with its injectivity hypothesis remains the source cited
   in the preceding three/four-bound corollary. The new argument
   uses the method and its own radius convention.

Items 1–3 restore short steps or fix phrasing in the integrated proof.
Items 4–5 make the hypotheses and version-specific dependence precise.
The TeX was left frozen.

## Core obstruction and rescaled extraction

The proof of the core lemma uses the spherical quotient cross-section
of a full smooth truncation. The compact core deformation retract
preserves \(H_2\) and the exterior collar of the connected boundary
gives two connected sides in the ambient sphere. Integral duality
and UCT give \(H_2(Y)=H^1(Y)=0\) from finite \(H_1(Y)\).
Mayer–Vietoris gives \(H_2(U)=H_2(V)=0\) and the direct sum of
the two finite \(H_1\)'s for \(H_1(Y)\). The pair sequence and
Poincaré–Lefschetz duality identify the summand
\(H_1(V)\) with \(\operatorname{Ext}_{\mathbb Z}(H_1(U),\mathbb Z)\).
The finite abelian cyclic decomposition gives
\(H_1(Y)\simeq G\oplus G\). This excludes the positive \(b_2\)
case already by \(H_2(U)=0\), so the longer intersection form
argument from E162 is unnecessary here.

In the remaining case, Wright gives a cyclic Gibbons–Hawking
quotient with \(k=d>1\). The proof retains the \(k=2\) conjugation
and the positive circle generator, which make the deck action
commute with the circle. The first Chern number on the outer
sphere is \(-k\) by summing the local charges. The homotopy sequence
gives \(C_k\) generated by the fiber. A deck-invariant principal
connection lifts radial motion, and the completion estimates
give compact inside preimages, so the quotient circle sections
give an actual product end. The nested cofinal inclusions identify
its group with the ALE end \(\Gamma\). Transport of a fiber
loop along a lifted basepoint path proves centrality of the kernel
of \(1\to C_k\to\Gamma\to C_d\to1\). The cyclic quotient makes
\(\Gamma\) abelian. A simultaneous complex eigenline makes its
action's character faithful by freeness on the real sphere.
Thus \(\Gamma=C_{d^2}\) and its abelianization conflicts with
the doubled-group test. This verifies the group calculation
and full-core applicability in the actual text, independent
of a group-order shortcut. [Core assessment][corea] · [E162][core].

The metric hypotheses, \(p=8,m=2,\eta=1\), and weights
\(r^{1/2}\|Dh\|_8+r^{3/2}\|D^2h\|_8\) match the assessed proof.
The bounds are on the actual smooth fixed base, with evaluation
in the metric \(g_i\) and the specified orientation. Reflections,
translation and constant chart rescaling preserve the harmonic
coordinate requirement. The rescaling \(r_i^{-2}g_i\) multiplies
the curvature norms by \(r_i^2\); the comparison of self-dual
Weyl norms is consistent. Writing a curvature operator as a full
\((0,4)\) tensor doubles its Hilbert–Schmidt norm, since both
antisymmetric index pairs are then summed in ordered slots.
The proof uses \(W^+\) as an endomorphism in the bound, and the
full tensor norm in Chern–Gauss–Bonnet and BKN. Its factor
\(32\pi^2\) in the full-tensor convention is correct. The
Ricci-square term is at most \(4K^2\mathcal V_{-K/3}(D')\)
and constant rescaling preserves the total curvature energy.

The rescaled volume bounds hold uniformly in the center for
each \(t\) once \(r_it\le D'\). This gives fixed-mesh packing
and the proper geodesic pointed limit by diagonal distance lists.
The harmonic chart displacement bound and the strict
\((B-b)/(2\sqrt m)\) margin apply to ambient minimizing paths
that stay in the intrinsic chart. On compact overlaps they give
persistent domains and uniform transition convergence. The
harmonic Ricci equation uses a uniformly elliptic \(C^\beta\)
principal matrix, strong \(C^1\) coefficient convergence and
Ricci tending to zero. It yields a smooth weak limit and strong
local \(W^{2,p}\) convergence by its difference estimate.
For transitions the difference equation is
\[
 a_i^{jk}\partial_{jk}(\theta_i-\theta)
       =(a^{jk}-a_i^{jk})\partial_{jk}\theta.
\]
After the weak limit and smoothing in item 1 this right-hand side
tends to zero in \(W^{1,p}\). A further derivative estimate
adds \(-(\partial_\ell a_i^{jk})\partial_{jk}(\theta_i-\theta)\),
which tends to zero in \(L^p\) by the first interior estimate.
The stated \(W^{3,p}\) convergence follows. All distances agree
with the smooth limiting metric by local uniform metric
comparison and length-space patching.

The compact embeddings are genuine. Cutoff coordinates embed
each covered neighborhood since a nonzero block gives a local
inverse by division and recovers a point from the entire image.
The transition estimates give \(W^{3,p}\) and \(C^2\) local
convergence of the cutoff maps, including across support boundaries.
Smooth tubular projection to the already smooth limit image yields
\(P_i\) with charts converging to identity. The local contraction
gives smooth inverse branches on strict inner regions. Two
preimages over the same point converge metrically to that
point by the inverse estimates, hence the chart margin puts both
in an enlarged convex inverse-uniqueness chart. The glued inverse
is an embedding because it is a right inverse. A small supported
translation of the domain makes the maps based. Uniform metric
approximation, the margin and uniqueness give the intrinsic
ball comparison, and strong \(W^{2,p}\) pullback convergence
passes the volume and energy. In particular the limit is
complete, noncompact, smooth Ricci-flat ASD, has Euclidean
lower growth at every center and finite full energy.

The flat contradiction keeps the intermediate cyclic quotient
argument. A free nonidentity Euclidean deck isometry has nonzero
translation along the fixed subspace of its linear part. The
slab quotient has at most cubic growth, which bounds the ball
volume in \(N\) by lifting minimizing paths. The positive
quartic lower bound leaves only the Euclidean flat alternative.
Strong \(W^{2,p}\) metric comparison on \(B_4\) gives
\(a_i-I\to0\) in \(W^{2,p}\) and \(b_i\to0\) in \(W^{1,p}\)
for the harmonic Dirichlet problem. Since \(p>4\), the small
coefficient errors make the Euclidean zero-boundary inverse a
contraction on \(W^{2,p}\cap W^{1,p}_0\). The three terms after
differentiation tend to zero because \(Da_i\) is bounded,
\(D^2w_i\to0\) in \(L^p\), \(Db_i\to0\) in \(L^p\), and
\(Dw_i\to0\) uniformly. Thus \(W^{3,p}(B_3)\) convergence
and the inverse change of coordinates give metric coefficients
converging to the constant matrix in \(W^{2,p}\) and \(C^0\).
The intrinsic radius-two ball is contained in the chart by the
comparison. The fixed weighted seminorm and distortion inequalities
are then strict, contradicting \(1+i^{-1}\) at the basepoint.
This is a direct argument and does not require continuity of
harmonic radius. [Extraction assessment][prea] · [E165][pre].

BKN Theorem (1.5) uses the supplied smooth complete Ricci-flat
limit, positive volume growth at one center at all radii and
finite full \(L^2\) curvature. In dimension four it gives a single
end of order four; the definition and Remark (1.8)(1) give
the smooth quotient chart with all derivative decays. Lifted
orientation makes \(\Gamma\subset SO(4)\). The full
radial core embeds by the separate compact comparison already
proved, not by BKN. The contradiction excludes any
subsequence of vanishing radius infima. [ALE source assessment][bkna].

## Smooth reference in the unscaled case

The unscaled limit is used only for chart comparison and
requires no smoothness. The positive radius floor, diameter
bound and volume ratios give the finite net and uniform coverage.
Local \(C^{1,5/12}\) metric convergence holds because
\(1-4/p=1/2\). In harmonic transitions, one interior Schauder
estimate gives uniform \(C^{2,5/12}\). After differentiating
once the right-hand side is the product of \(Da_i\) and
\(D^2\theta_i\), both uniformly \(C^{0,5/12}\) on a smaller
overlap. The second estimate bounds \(C^{3,5/12}\).
Compact embedding gives \(C^{3,1/3}\) convergence there.
The cutoff embedding on the whole compact approximant and
strict support margins give the same local regularity on
\(\overline B_{7\rho/4}\). The own coordinate block gives
\((DE_{ia})^TDE_{ia}\ge I\).

The constants close in the compressed argument. If the Euclidean
images have separation at most \(\delta<1/2\), their local
coordinates satisfy
\[
 |v-u|\le\frac{\delta+\delta|u|}{1-\delta}
               \le C_b\delta,\quad C_b=2(1+2\rho),
\qquad |u|\le3\rho/2.
\]
Two competing nearest points to \(w\) within the radius-\(r\)
tube have coordinate separation at most \(2C_b r\). With the
first coordinate in \(B_\rho\), the segment stays in
\(B_{3\rho/2}\) at the chosen \(r\), where its image residual
is bounded by \(r+2LC_b r\). Contracting the second derivative
with that residual gives the claimed lower Hessian bound
\(I-Lr(1+2LC_b)I>I/2\). Strict convexity rules out two
nearest points. At the unique minimizer the same Hessian
bound and continuity by compactness justify the smooth
projection. This uniform choice precedes the reference.
After fixing one late smooth reference, the foot of each
local image point has residual at most \(\delta\) and
coordinates \(|q-u|\le2C_b\delta\). The derivative estimate
compares derivatives along the segment in \(B_{7\rho/4}\).
Indeed
\[
 \|Dq-I\|
  \le 2\bigl(L(\delta+2LC_b\delta)+L\delta\bigr)
  =4L(1+LC_b)\delta<1/2 .
\]
The first summand subtracts the tangent Gram term of the foot
equation, and the second bounds the residual Hessian term.
Thus the maps are local positive diffeomorphisms. Points with
the same image have Euclidean image distance at most
\(2\delta\) and lie in one convex \(B_{3\rho/2}\) chart by
separation. The same derivative inequality gives injectivity
there, hence globally. The image is open and compact in a
connected reference, so it is all of that reference.

The inverse contraction on radius-\(\rho/8\) balls around
targets in \(B_{5\rho/4}\) stays strictly inside the larger
chart. The local inverses are the global inverse, converge
in \(C^2\), and have uniform third derivatives in the
stated local coordinates. Interpolation gives the lower
Hölder convergence used in the pullback metric. The
\(D^2h_{ia}\) term is controlled in \(L^8\) by the inverse
Jacobian bound and change of variables. All other terms use
at most three derivatives of the inverse maps. Positive strong
\(C^{1,1/4}\) and weak \(W^{2,8}\) follow on the fixed smooth
base. The proof uses neither a smooth unscaled limit nor
an injectivity-radius conclusion or full-curvature supremum
bound. [Combined assessment][comb] · [E168][e168].

## Original-flow statement and front matter

The corollary inherits the fixed \(SO(3)\) bundle, smooth
original native flow, positive curvature planes and round-compatible
sign from the stated endpoint theorem. The sequence lies in
that flow's domain and its two bounds are simultaneous. The
identity \(3dV_g=\langle F_A\wedge F_A\rangle\) uses the
trace-three wedge Gram in the negative Killing pairing, and
\(\dot F_A=d_A\dot A\) with Bianchi makes its time derivative
the displayed exact form with coefficient \(2/3\). The volume
is the fixed positive initial total volume.

The preceding corollary gives \(k^2=4\pi/5\),
\(B=(1+4\sqrt3)P_0/k^2\), and
\(Z_0=\sqrt6/2+(42+8\sqrt3)B\).
They are valid on the new selected slices from the \(\Psi\)
bound alone. The strain estimate follows from
\(|\nabla^A T|+|T|^2\le B\).
The native chiral block has scalar target \(6\), since the
metric scale is \(2K\), and its scalar coefficient in the
squared norm is \(1/48\). Its mixed block gives
\(|\Ric_0|\le2Z_0\), and \(|g|_g=2\) yields
\(|\Ric|\le3+(2+2\sqrt3)Z_0\). The plus Weyl estimate
uses the required endomorphism Hilbert–Schmidt convention.
No floor for \(Q\) or opposite-chiral pointwise curvature
estimate is used in these bounds.

The metric theorem gives oriented smooth same-base
normalizers with a positive \(C^1\) limit, enough for the
pair proposition. Simply connectedness and \(H^2(M;\mathbb R)=0\)
imply its topological case. The earlier chiral isometries
lift the normalizers to the same bundle and the proposition
supplies a positive compatible uniform pair limit of the
same definite sign. The sequential corollary fixes one
positive reference and its time before choosing a sufficiently
late smooth slice. It undoes that slice's bundle automorphism
and identifies the old solution on their overlap by smooth
original uniqueness. This checks continuation in the original
identification without a derivative bound for moving gauge
maps, or estimates on the intervening times. The finite-maximal-time
form is the contrapositive. The abstract and introduction
accurately advertise this supplied-flow, one-sequence result
and keep initial-data and general estimates outside the
conclusion. No front-matter repair is needed.

## Bibliography and protected bytes

Parsing the comment-stripped frozen TeX yielded 73 citation
commands, 75 key occurrences, and 37 distinct keys. The
37 unique bibliography entries match their first-citation
order, all are in the root catalog, and no citation is
undefined. Labels and references were checked separately,
with no duplicate labels or undefined references. Anderson
is entry 28, Wright entry 29 and Bando–Kasue–Nakajima
entry 30.

- **R29.** The bibliographic publication metadata from the
  author index are distinguished from the undated author PDF
  used in the proof; no publication-edition crosswalk is
  assumed. The new proof invokes the framework and the
  precedent for rescaling, while the earlier proof invokes
  the theorem with its actual injectivity hypothesis.
  [R29 rendered-page record][r29].
- **R31.** The theorem wording is from arXiv:1102.2442v2,
  29 April 2011. The 2012 journal span 91–108 and DOI
  are metadata for the published edition. The simply connected
  classification enters through Wright's account of Kronheimer.
  The original classification was not separately inspected for
  this derivation. Section and remark additions in item 4
  give the exact local dependencies. [R31 record][r31].
- **R37.** The 1989 journal article appears in volume 97,
  issue 2, pages 313–349. The inspected published scan's
  pp. 313–315 and 335 and DOI match the assessment.
  The text uses Theorem (1.5) and Remark (1.8)(1) only
  for the supplied Ricci-flat object. No citation repair
  is required for R37. [R37 record][r37].

The protected block is 4,501 bytes, from
`\section{The closed defect equation at the round connection}`
at line 7138 to just before the next section header at
line 7266. Its SHA-256 is
`c0e411175c77e13e96aa8ab41f55e2c2593f30e72a5c44560e1baf65068a3fab`,
equal to the request. No build or new source search entered
this audit. [Return and input digests][ret].

[req]: ../research-progress/handoffs/SP4-CME-E172_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E172_RETURN_v1.md
[tex]: ../manuscript/chiral_curvature_and_metric_evolution.tex
[corea]: E166_ALE_CORE_AUDIT_ASSESSMENT_20261122.md
[core]: ../notes/162_ALE_CORE_TOPOLOGY_TEST_20261122.md
[prea]: E165_E167_PRE_ALE_EXTRACTION_ASSESSMENT_20261122.md
[pre]: ../notes/165_MINIMUM_HARMONIC_RADIUS_EXTRACTION_TEST_20261122.md
[bkna]: E164_RICCI_FLAT_ALE_SOURCE_ASSESSMENT_20261122.md
[comb]: E168_E169_METRIC_COMPACTNESS_ASSESSMENT_20261122.md
[e168]: ../notes/168_CONDITIONAL_METRIC_COMPACTNESS_CRITERION_20261122.md
[r29]: ../../../../references/SOURCE_NOTES_CME_CONTINUATION_COMPARISON_20261122.md#r29-rendered-page-correction-and-method-use--e165e167
[r31]: ../../../../references/SOURCE_NOTES_CME_CONTINUATION_COMPARISON_20261122.md#r31-supplied-core-use--e162e166
[r37]: ../../../../references/SOURCE_NOTES_CME_CONTINUATION_COMPARISON_20261122.md#r37--bando-kasue-nakajima-ale-source
