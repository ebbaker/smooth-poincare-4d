# E195 Independent audit of the integrated twistor section

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E manuscript precision audit under
B93–B95, configured gpt-6.2-sol/ultra. Independent runtime and
selected-lead settings are unavailable. I authored the inherited
E192 and E194 audits. This pass checks their compressed manuscript
use, the E193 source provenance, and manuscript scope against the
three lead assessments.

## Disposition

**Pass subject to local precision edits.** The new section
(frozen TeX lines 11464–11912) preserves the three assessed
results. The radius choice, the compressed \(p=8\) Fredholm
passage and the attribution of the ALE metric classification
can be made explicit at their points of use. The edits below
require no new hypothesis, theorem or proof program. I verified
the nine frozen inputs and the exact 4,501-byte protected round
section. Manuscript editing, build and visual inspection are
outside this audit.

## Compact \(C^0\) persistence

Lines 11478–11548 fix the smooth six-manifold, embedded
\(J_0\)-holomorphic sphere, compact radial neighborhood and
auxiliary choices. The supplied inverse acts from the appropriate
\(L^8\) anti-linear target to \(W^{1,8}\). The involution on
real homomorphisms is \(a\mapsto Kaj\). Thus \(P_K\) projects
onto \(aj=-Ka\), and transport places the unprojected residual
in the varying projected space. The norm of the difference of
projections being less than one gives injectivity on that
space. The background residual vanishes at zero. Differentiating
its transport and varying-range identities therefore contributes
no extra term, and the fiber exponential differentiates to the
identity. This verifies the exact \(D_0\) and the factor \(1/2\).
The displayed remainder follows from the affine first derivative
and background Taylor estimates. The exact perturbation formula
uses only the values of \(J'-J_0\).

Lines 11550–11594 use the closed range of the projection
\(Q_0D_0\) as a subspace of \(W^{1,8}\) and the ball as a compact
convex set in \(C^0\). Morrey yields \(C^{0,3/4}\) on smooth
chart disks, and weak \(W^{1,8}\) compactness and lower
semicontinuity close the ball in \(C^0\). For fixed \(J'\),
coefficient convergence is uniform and an \(L^{8/7}\) test
may absorb the fixed leading coefficient when passing to the
weak \(L^8\) derivative limit. Boundedness of \(Q_0\) and
compact embedding give \(C^0\) continuity of the self-map.
The two restrictions on \(r,\epsilon\) give the \(r/2\)
self-map and strict projection bound. Schauder supplies the
fixed point in this ambient topology. Applying \(D_0Q_0=I\)
to the fixed-point identity gives the zero residual, and
the injective projection gives the entire weak equation.

Lines 11597–11623 reproduce the correct shifted equation
with \(a_h\) on the differentiated factor and \(\delta_h a\)
on the forcing. The cutoff commutator uses the shifted
coefficient. For small shifts the frozen coefficient difference
absorbs at most half the left side. The forcing is in \(L^4\)
by \(L^8\cdot L^8\), and the last term uses the \(L^4\)
quotient bound for \(u\). Weak tests against interior smooth
functions identify the two shift directions of both first
derivatives, giving \(W^{2,4}_{\rm loc}\).

Lines 11625–11654 give the correct Hilbert multiplier sign.
For real Schwartz \(f\), \(\widehat{Hf}\in L^1\cap L^2\)
gives \(Hf\in L^\infty\cap L^2\), so the square and all
norms in the argument are legitimate. Nonnegative Fourier
support of \(f+iHf\) yields the displayed Hilbert identity.
The unnormalized circle integral is \(4\xi/|\xi|\), so the
directional average gives the multiplier \(-i\xi_j/|\xi|\).
The two negative product signs agree with symbols \(i\xi_j\)
for the first derivative and \(-\xi_j\xi_k\) for the second.
Mollification commutes with the constant operators and controls
the second derivatives whenever the distributional Laplacian
is in \(L^4\).

Lines 11656–11677 give the correct Poisson equation from
\(u_y=a u_x\) and \(u_x=-a u_y\). For \(m\ge2\), each
composition derivative through order \(m\) has at most
one factor of order \(m\), which is in \(L^4\). Derivatives
through order \(m-1\) of \(u,a\) are locally bounded. The
Leibniz products of \(Du\) and \(Da\) through order \(m-1\)
therefore have at most one unbounded factor and lie in
\(L^4\). The cutoff Laplacian has \(m-1\) Sobolev derivatives.
The weak Euclidean estimate gives one net order per step
on inner disks. These individual radii and constants can
use derivatives of \(J'\) after the existence threshold is
fixed. The radial homotopy and positive background diameter
ensure nonconstancy. There is no embeddedness, smooth
dependence, uniqueness or uniform higher bound for the output.

## Pointed \(C^1\) metric comparison and area

Lines 11682–11774 retain positive chirality, oriented
Riemannian signature and the metric Levi–Civita tamer. The
strict curvature inequality makes \(\mathsf A\) definite,
fixing the determinant sign on a connected component. A
subsequence fixes the sign across indices. The fixed compact
neighborhood of the hypothetical sphere lies inside an open
cover neighborhood. Its image in \(X\) is compact and lies
in a larger comparison domain where there is an actual smooth
positive embedding for each large index. If the compact
domain is taken connected and pointed, enlarging it by compact
paths gives the same conclusion. No estimate on derivatives
of the original comparison embeddings is needed beyond
their exact pullback metric identity.

The normalized Hodge projection and inverse are algebraic
in values, with a uniform positive denominator on a fixed
compact domain. In the prescribed moving orthonormal frames,
the base derivative of the normalized sphere map
converges to zero, and its derivative along sphere directions
converges to the identity. The chiral connection matrix in
the moving frames uses first metric and frame derivatives.
The horizontal graph and vertical component of a tangent
vector then give precisely \(C^0\) twistor convergence.
The comparison is a first-jet calculation separate from
Fine's original pointed \(C^2\) hypotheses.

The vertical orientation is preserved by the normalized
projection and the composite twistor map, so the derivative
identifies the oriented vertical planes. Unit fiber area
\(4\pi\) and Euler number two give the ordinary normalization
\([\omega_g]=2\pi e(V)_{\mathbb R}\). The class equality
requires no form convergence. The twistor cover map over
\(W\) is locally a diffeomorphism. Its tangent inverse
is sufficient for pulling back each almost complex structure
and carrying over the compact \(C^0\) estimate. Forms, classes
and taming pull back without needing global injectivity on
this neighborhood.

At lines 11776–11823 the limit's parallel frame gives the
product twistor description and the sphere-area pullback.
The lift at \(\epsilon a\) has horizontal complex structure
\(\epsilon I_{\epsilon a}=I_a\). Both signs use the same
holomorphic domain and an embedded map. The displayed
linearization has the corrected composition, and the
vertical part is the Dolbeault operator on a constant
complex line. A nonzero constant vertical variation,
after rotation and real rescaling, would give horizontal
forcing \(I_1df/2\). Contraction with \(\Omega\) is a
holomorphic \((1,0)\)-form with values in the dual normal
line, so the first term of the projected wedge equation
integrates to zero. In the order \(\beta\wedge\theta\) the
pointwise term equals \(2i\,dA_f\), and the factor \(1/2\)
leaves a nonzero integral. This kills the vertical variation
for either sign. The symplectic pairing gives the normal
line \(\mathcal O(-2)\), and the rank-three split bundle
has degree zero from the horizontal symplectic determinant
and trivial vertical line. Its six real reparametrization
directions equal its real index. The smooth off-diagonal
part is zeroth order and compact from \(W^{1,p}\) to \(L^p\).

Lines 11824–11849 retain the E194 local \(L^8\) Hilbert
bound, the \(L^{8/7}\) dual Riesz estimates, the compact-domain
elliptic estimate, and the fixed complement for \(D_0\).
A precise statement of the dual test is given below. The
complement argument supplies the bounded right inverse
to the fixed \(L^8\) anti-linear target, with no family
inverse or uniform derivatives of the perturbed twistor
structures. The assessed persistence lemma applies on
\(\overline W_0\times S^2\), giving smooth, nonconstant
maps homotopic there to the lift. The last integral is
zero because the limit direction is constant, and both
equalities before it are from the class and homotopy
identities. Taming makes the density nonnegative and
strictly positive on the nonempty open set where the
holomorphic differential is nonzero. This proves the
theorem with strict taming for each index.

## ALE premise, citations and scope

Lines 11868–11911 assume a smooth complete connected nonflat
Ricci-flat ASD ALE metric and exclude it as the specified
pointed \(C^1\) limit of metrics with tamed positive twistor
spaces. Wright's cover reduction yields its positively
oriented complete nonflat hyperkähler ALE universal cover.
The model identification is the imported Kronheimer metric
classification from the checked Wright and Lyu–Xu passages.
The trivial-end-group case is the flat one-center metric.
For a remaining nontrivial end group the ADE root system
is nonempty. Evaluation of the homogeneous quadratic
period on any root has a projective zero, including
the case of an identically zero evaluation. The root
subsystem at that parameter is nonempty, and the cited
minimal resolution contains a smooth embedded exceptional
\(\mathbb{CP}^1\). The biholomorphism places a component
in a parallel complex structure of the same metric model.
There is no descent requirement for the sphere on the
universal cover. The orientation is the one for which
the pulled-back \(W^+\) vanishes.

All four cited keys in the new section are defined exactly
once both in the TeX bibliography and the canonical BibTeX.
All nine new labels are unique, the section's cross-references
resolve in source, and all forty TeX bibliography entries
are in order of first citation. Fine's TeX metadata distinguishes
journal metadata from the selected arXiv v2 text. R39
confirms the in-text and bibliography correction to Laugesen
§1.6, Definition 1.11, p. 18, in conjunction with §1.7
Theorem 1.17 pp. 23–24, Morrey Theorem 3.22 p. 71, and
Proposition 5.7 pp. 110–111. The Wright entry gives v2 and
the Lyu–Xu entry gives v3 and the official posting date.
The canonical R41/R42 records explicitly mark the original
Kronheimer bodies uninspected. This audit uses the archived
inspection records and launches no new source retrieval.
[Canonical BibTeX](../../../../references/references.bib) ·
[Canonical source records](../../../../references/SOURCE_NOTES_CME_CONTINUATION_COMPARISON_20261122.md).

The abstract and introductory summary describe the existing
definite-data results without summarizing the added section.
Their scope does not assert that the twistor theorem proves
compactness for arbitrary definite data. The boundary paragraph
at 11907–11911 expressly retains the prelimit metric taming
hypothesis, separates it from native definiteness, and preserves
the independent homotopy-sphere topological argument. The
challenges section likewise makes no general existence or
extraction claim. This version contains no E196/E197
compactness result and makes no novelty claim.

## Minimal edits before integration

1. **Fixed-point order, 11570–11583 and 11673–11677.**
   Put the positive diameter requirement with the first choice
   of \(r\), before choosing \(\epsilon\). Replace the later
   radius sentence with the radial homotopy and the quantitative
   separation already in the proof. To make the compactness
   argument fully explicit, say that reflexivity gives a weakly
   convergent subsubsequence of every subsequence in 11577–11580.
   Its only possible weak limit is the uniform limit.
2. **Cover notation and dual passage, 11764–11774 and
   11837–11849.** Name the pulled-back structures
   \(\widetilde J_i,\widetilde\omega_i\) at their first
   introduction on the cover. In the \(p=8\) argument,
   attribute closed range to the displayed estimate together
   with compact embedding. Replace “a distribution solution
   of either equation” by a kernel solution of \(D_0\) or an
   \(L^{p/(p-1)}\) annihilator solving \(D_0^*\lambda=0\)
   distributionally. The localized constant equation is
   \(D_*w=B(x)w\) with \(B\) smooth. The estimates at \(p\)
   and the dual exponents then identify the same smooth
   kernel and annihilator spaces at \(p=2,8\). These are
   the precise conditions behind the current compression.
3. **Classification provenance, 11876–11886 and 12217–12225.**
   Keep Wright Theorem A and §§2–3 for the cover and cite
   Lyu–Xu v3 §1.1 alongside it for the metric-model
   classification as attributed to Kronheimer. Cite Wright
   §§7.1 and 8 at the flat one-center assertion. State at
   this use that the original construction and Torelli
   bodies are uninspected. The Lyu–Xu bibliography sentence
   should read “Selected passages in §§1.1–2.4”, matching
   the actual level of inspection. The two point-of-use references for
   the period and exceptional component already match R40.

## Verified inputs

| Artifact | SHA-256 |
| --- | --- |
| [E195 request](../research-progress/handoffs/SP4-CME-E195_REQUEST_v1.md) | 76a8adb2a5823603f15cbba09dfaf3a835aa5376c5f0be83df9fb1c48cfad77b |
| [Frozen manuscript](../manuscript/chiral_curvature_and_metric_evolution.tex) | 54619220a42259ef94eb54ad998b50cfad59056a1a54233a9489f176b74b70d8 |
| [E190/E192 assessment](E190_E192_C0_PERSISTENCE_ASSESSMENT_20261122.md) | cb7c27443cb70b5b1b6345c67e419c1b3e6bc0d8f25354bf6d5addf3b64eb871 |
| [E190 proof](../notes/190_C0_CURVE_PERSISTENCE_TEST_20261122.md) | c928a60dfe4fe6fbafe4428261f7b77164648a88382c20ca5ff06b8f9302a2ea |
| [E192 audit](E192_C0_PERSISTENCE_AUDIT_20261122.md) | a0e7a764dfe73ab2a8997a71707e347b212c761cd72a9a37842b7d610253bbed |
| [E191/E194 assessment](E191_E194_C1_TWISTOR_ASSESSMENT_20261122.md) | b4cc0c48432c57d5de678179057d17f2265f26a0b9af29e62a89da367b05ac49 |
| [E191 proof](../notes/191_CONDITIONAL_C1_TWISTOR_LIMIT_20261122.md) | e2426b287fcf7d85381948bdf404aa5563c82f0b408f32da170de9a24cbf22fa |
| [E194 audit](E194_C1_TWISTOR_COMPARISON_AUDIT_20261122.md) | 53a28e2b6da9095114fc9b58282a3760d199911dcacbf4e0c0f1cb88f3fd329e |
| [E193 assessment](E193_ALE_SPHERE_SOURCE_ASSESSMENT_20261122.md) | 75d6e5c46d92ec8dccc345cd177a5c40dba79d3aa78a65cd5a291e83e6735916 |
| [E193 audit](E193_ALE_HOLOMORPHIC_SPHERE_SOURCE_AUDIT_20261122.md) | 7a8cd6b6b9ea3da7f11e5d22b0b22fffe992e520410d38ecf9dccd03b9cc95c2 |

The protected round block runs from the literal section opening
at line 7976 to immediately before the next literal section
opening. Its 4,501 bytes hash to
c0e411175c77e13e96aa8ab41f55e2c2593f30e72a5c44560e1baf65068a3fab,
matching the recorded protected digest.
