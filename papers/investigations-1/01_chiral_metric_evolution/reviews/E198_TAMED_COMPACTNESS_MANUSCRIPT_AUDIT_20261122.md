# E198 Independent audit of the integrated tamed metric compactness theorem

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Bounded E audit under B96, configured
gpt-6.2-sol/ultra. Independent runtime and selected-lead settings are
unavailable. I authored E192, E194, E195 and the inherited E165 extraction
proof, and audited varying-base compactness in E185. The E196 derivation
and E197 audit are separately authored inputs.

## Disposition

**Pass with local scope edits.** The frozen theorem and proof at
11938–12075 give the assessed compactness and oriented finiteness
under the displayed metric curvature taming inequality. There is
no mathematical gap in this formulation. E196 also allows supplied
direct canonical metric twistor taming, for which the manuscript needs
the explicit alternative below to reproduce the full assessed scope.
The abstract needs the exact embedded-sphere and fixed-right-inverse
hypotheses. The full audited section is 11482–12076. All E195 precision
repairs are present, and the protected round block matches exactly.

## E195 precision repairs

- At 11588–11595 the auxiliary diameter margin is among the first
  restrictions on \(r\), before the choice of \(\epsilon\). The
  nonconstancy paragraph at 11693–11696 now uses that initial choice.
  At 11596–11605 reflexivity gives a weakly convergent subsubsequence
  of every subsequence. The uniform limit identifies it, and the
  fixed-coefficient weak residual test and bounded right inverse
  give the correct ambient \(C^0\) continuity.
- At 11789–11795 the two pullbacks are named
  \(\widetilde J_i,\widetilde\omega_i\) when introduced. The local
  diffeomorphism and pointwise inverse tangent map suffice. The proof
  retains the positive \(2\pi\) Euler class factor, the opposite
  direction for the negative lift and the normal wedge order.
- At 11858–11875 the estimate and compact embedding give finite
  kernel and closed range. An \(L^{p/(p-1)}\) annihilator solves
  \(D_0^*\lambda=0\) distributionally. The constant-principal-part
  local estimate at the dual exponent gives local smoothness by
  iteration with smooth zeroth-order coefficients. Thus the smooth
  kernel and annihilator spaces agree for \(p=2,8\), and the index
  calculation and fixed kernel complement give a bounded inverse.
- At 11902–11912 the exact Wright and Lyu–Xu classification locators
  and Wright's flat one-center locators are cited at their use.
  The original Kronheimer construction and Torelli bodies are
  explicitly marked uninspected. The period and embedded exceptional
  component locators remain at 11919–11929. Line 12387 now describes
  selected passages in the Lyu–Xu bibliography.

## Compactness proof and exact hypotheses

**Class and bounds.** Lines 11942–11961 fix the bounds uniformly
on varying smooth closed connected oriented Riemannian four-manifolds.
The Ricci bound is in the ordinary tensor Hilbert–Schmidt norm and
the \(W^+\) bound in the endomorphism Hilbert–Schmidt norm on ordinary
self-dual two-forms. The full component positive Weyl tensor norm
is twice the latter. The Euler bound is an upper bound alone.
For a nonempty class and \(D'>D\), the ball of radius \(D'\)
at every center is the whole manifold. Since
\(\operatorname{Ric}\ge-Kg\), the four-dimensional model has
sectional curvature \(-K/3\). Bishop–Gromov gives the total upper
bound \(V_{\max}\) and at every center a lower ball bound \(cr^4\)
up to radius \(D'\), with \(c=v\omega_4/V_{\max}\) and
\(\omega_4\) the Euclidean unit four-ball volume.

At 11977–11989 the Chern–Gauss–Bonnet density is written in the
full \((0,4)\) component norm. As an independent convention check,
writing \(Z=\operatorname{Ric}-(s/4)g\) gives
\(|\operatorname{Rm}|^2-4|\operatorname{Ric}|^2+s^2=
4|W|_{\rm op,HS}^2-2|Z|^2+s^2/6\). Thus the \(32\pi^2\chi\)
identity gives \(C_E=32\pi^2\chi_0+4K^2V_{\max}\) upon discarding
\(-s^2\). A negative upper bound means an empty class. The full
curvature integral is scale invariant in dimension four.

**Varying-domain extraction.** Lines 11991–12024 reuse the explicit
radius criterion at 4188–4207, with centered smooth harmonic charts
on intrinsic balls, \(p=8,m=2,\eta=1\), both weighted derivative
orders and coordinate Lebesgue measure. Each individual smooth
closed metric has a positive infimum by small uniform charts on a
finite cover. Failure of a class-wide floor gives a sequence with
infima \(r_i\to0\). Approximate minimizers suffice. Scaling the
metric by \(r_i^{-2}\) and coordinates by \(r_i^{-1}\) gives
minimum radius one and center radius at most \(1+i^{-1}\). The
norms of Ricci and \(W^+\) scale by \(r_i^2\). At any fixed
rescaled radius \(t\) the bound \(ct^4\) holds for all sufficiently
large \(i\) because \(r_it\le D'\). The upper model bound holds
at every radius. The volume bounds and radius floor therefore
supply the exact packing, chart and overlap hypotheses.

The proof references the earlier analytic argument at 4230–4405
and its varying-domain reading at 4535–4556. The chart transitions
stay on each \(M_i\), and no fixed smooth type enters. Weak harmonic
Ricci equations and elliptic regularity produce smooth Ricci-flat
limit coefficients, and the difference equations give strong local
\(W^{2,8}\). Harmonic overlap estimates give the \(W^{3,8}\) and
strong coordinate comparison needed to invert local smooth projected
maps. The cutoff, overlap margin and projection construction gives
actual smooth positive embeddings on neighborhoods of compacts, with
strong \(W^{2,8}\) and \(C^{1,\alpha}\), \(\alpha<1/2\), of the
pulled-back metrics. Completeness follows from the identification of
the glued metric distance with the proper geodesic pointed limit.
Whole-ball inclusions transfer quartic growth to every fixed radius
at every center. The embeddings give a single-sheeted energy
bound on compact subsets. Strong local curvature convergence and
exhaustion transfer finite full energy, and orientation preserves the
chirality in \(W^+=0\).

The nonflatness argument retains both steps. A nontrivial free
Euclidean deck isometry has nonzero translation along its fixed
linear subspace, so its cyclic intermediate quotient gives a cubic
upper growth bound, incompatible with quartic lower growth. The
only flat candidate is therefore Euclidean. There the actual
based strong \(W^{2,8}\) pullbacks and the earlier Dirichlet
harmonic-coordinate construction give genuine coordinates whose
errors tend to zero in \(W^{3,8}\) on an inner Euclidean ball.
Whole-ball coverage puts the intrinsic radius-two ball inside it.
The strict radius conditions contradict \(1+i^{-1}\). Neither
this argument nor the map construction invokes the earlier
homotopy-sphere full-core obstruction.

**ALE exclusion at the rescaled limit.** At 12026–12040 the object
to which Bando–Kasue–Nakajima applies is the already constructed
smooth connected complete Ricci-flat candidate with positive
Euclidean growth and finite full \(L^2\) curvature. The cited
Theorem (1.5) and Remark (1.8)(1) supply its smooth ALE end
with the derivative decay in the assessed ALE hypothesis. The
Einstein-sequence theorem supplies no extraction here. Both
curvature blocks in the strict twistor inequality acquire \(b^{-2}\)
under \(g'=b^2g\). The positive map \(\alpha\mapsto b^2\alpha\)
preserves the unit two-form identification, the induced orthogonal
complex structures and the connection splitting. It intertwines
the projected vertical connection and normalized metric Reznikov
form. Thus either assessed way of supplying strict metric taming
survives scaling, and positive embeddings transfer it by naturality.
The actual pointed \(C^1\) convergence and nonflat Ricci-flat ASD
ALE candidate give the contradiction to the assessed corollary,
using its positively oriented hyperkähler universal cover and
attributed metric-classification premise. The contradiction needs
no uniform taming strength or taming of the limit. Therefore there
is a class-wide radius floor.

**Unscaled reference and type finiteness.** Lines 12044–12067
reuse the same bounded positive chart data on fixed-radius balls.
In particular the compressed reference to the preceding construction
retains the inner-chart coverage, uniform \(C^{1,5/12}\) metric and
\(C^{3,1/3}\) overlap convergence, and common finite-dimensional
target. The uniform derivative, separation and Hessian estimates
fix the tube radius and allowed error before choosing the late
smooth reference. The earlier Cauchy property then puts all late
images inside that fixed reference tube. The bound
\(\|Dq-I\|<1/2\) for the foot coordinate implies a positive local
diffeomorphism. Separation puts competing preimages in one
convex chart of the source, where the derivative bound integrates
to injectivity. The image is open by the local inverse theorem
and closed by compactness, hence surjectivity follows from
connectedness. This gives smooth positive maps \(f_i=P_i^{-1}\)
from one actual late member. The inverse estimates, including
uniformly invertible derivative and bounded third derivative,
give strong \(C^{2,1/4}\) local inverse convergence. The
pullback has a positive strong \(C^{1,1/4}\) limit and a
uniform \(W^{2,8}\) bound, using the change of variables
for the \(D^2h_i\) term. Weak subsequential convergence
identifies the same limit. A sequence of pairwise different
oriented diffeomorphism types cannot satisfy these eventual
positive identifications. This proves oriented finiteness
without assuming a smooth unscaled limit.

## Sources, layout-independent checks and scope edits

The five cited keys, Fine, Laugesen, Wright, Lyu–Xu and
Bando–Kasue–Nakajima, are each present exactly once in both
the source bibliography and the canonical BibTeX. All forty
bibliography entries follow first citation. Twelve labels in
the audited section are unique, its eighteen references resolve,
and the two new front references resolve. R29 through the
earlier construction supplies the harmonic-radius framework
and Bishop–Gromov locators. Its injectivity-bound theorem
is not invoked to produce a floor. The R37 locators pp. 314–315
are the checked supplied-candidate result. The corrected R39
compact-map locator is §1.6, Definition 1.11, p. 18, with
Schauder §1.7 Theorem 1.17 pp. 23–24, Morrey p. 71 and
difference quotients pp. 110–111. R38, R31 and R40–R42
retain the exact inspected versions and attributed classification
inputs. No new source retrieval, build or visual QA was done.
[Canonical BibTeX](../../../../references/references.bib) ·
[Canonical source records](../../../../references/SOURCE_NOTES_CME_CONTINUATION_COMPARISON_20261122.md).

1. **Front scope, 96–97, 112 and 384–395.** In the abstract, use
   “a smooth embedded regular holomorphic sphere whose fixed
   \(W^{1,8}\to L^8\) linearization has a bounded right inverse”
   for the persistence assertion. At 112 write “The flow
   results concern the stated classes of existing definite data,”
   keeping the separate metric theorem outside that constraint.
   The introduction already states embeddedness and distinguishes
   the metric hypothesis. “With a supplied bounded right inverse”
   after “embedded regular sphere” makes the two summaries
   agree. All front and nearby statements otherwise stay within
   the metric and stated definite-data results.
2. **Full assessed taming scope, 11723–11724, 11741–11744,
   11953–11954 and 12071.** After the displayed sufficient
   inequality, use “For the results below, tamed metric twistor
   spaces can be supplied by this inequality or by strict taming
   of one canonical \(J_\epsilon\) by the normalized metric
   Reznikov form on each connected component. Both formulations
   concern the metric Levi–Civita connection.” At the sign
   passage, choose the supplied tamer sign on each connected
   pointed component. Under the inequality its sign is
   \(\operatorname{sgn}\det\mathsf A_i\), constant by definiteness.
   Then pass to a common-sign subsequence. State the compactness
   premise as “strictly tamed in the above metric sense” and use
   “assumes strict metric twistor taming” in the closing scope
   paragraph. This carries both assessed forms of the hypothesis
   without asserting a converse to the displayed sufficient
   inequality. The existing form and scaling proof already
   covers this alternative.

The convention and dependency details can be made explicit with
one sentence after 11952 specifying the Ricci tensor Hilbert–Schmidt
norm, and a reference to `eq:explicit-harmonic-radius`
at 11991. The exact definition and proof already give those inputs.
There is no general native-flow continuation or arbitrary homotopy
sphere data conclusion, and no novelty claim. The independent
full-core compactness result remains separate.

## Verified inputs

| Artifact | SHA-256 |
| --- | --- |
| [E198 request](../research-progress/handoffs/SP4-CME-E198_REQUEST_v1.md) | 2578d44dd8e4a3cb40aabac80ab44943cd4ff67196260b81a4a36bd86d64a3d9 |
| [Frozen manuscript](../manuscript/chiral_curvature_and_metric_evolution.tex) | 81236ab60635e7d92601ceef13eacd3ee89cb4663d692d9f244c08b6e6b9ef04 |
| [E195 audit](E195_TWISTOR_MANUSCRIPT_AUDIT_20261122.md) | 3217790c2cbaf99078ad7a24e86b459a99c3d829816bd4e3a3683ca9fd587b06 |
| [E196/E197 assessment](E196_E197_TAMED_METRIC_COMPACTNESS_ASSESSMENT_20261122.md) | ac879bddd5825a0d7a9d7fe9fd10659025bc7623888d4b1d9044c5675fae2610 |
| [E196 proof](../notes/196_CONDITIONAL_TAMED_METRIC_COMPACTNESS_20261122.md) | 49e0175de05a5012e86feaeeec32f261dfa78780d744afbc14ce4e0b0bd7da52 |
| [E197 audit](E197_TAMED_METRIC_COMPACTNESS_AUDIT_20261122.md) | a6fdd72fa8fa9725e1d7f39a7119bb78d994d3cb7422ee4f77be8935abb86820 |
| [E191/E194 assessment](E191_E194_C1_TWISTOR_ASSESSMENT_20261122.md) | b4cc0c48432c57d5de678179057d17f2265f26a0b9af29e62a89da367b05ac49 |
| [E193 assessment](E193_ALE_SPHERE_SOURCE_ASSESSMENT_20261122.md) | 75d6e5c46d92ec8dccc345cd177a5c40dba79d3aa78a65cd5a291e83e6735916 |

The protected block starts at the literal round section opening
at line 7994. Its 4,501 bytes through before the next literal
section hash to
c0e411175c77e13e96aa8ab41f55e2c2593f30e72a5c44560e1baf65068a3fab.
