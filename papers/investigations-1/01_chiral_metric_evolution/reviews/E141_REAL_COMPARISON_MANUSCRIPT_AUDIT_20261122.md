# E141 — Real comparison manuscript integration audit

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E integration audit, helper launch
configured gpt-6.2-sol/ultra. Independent runtime attestation
and selected lead settings were unavailable. I audited E137
in E139 and authored inherited E09, E57, E129 and E133. I
also audited the native clock in E65 and the endpoint
integration in E136. This checks the lead's frozen
integration against the assessed results. [Request][req] ·
[Manuscript][tex] · [Assessment][assessment].

## Disposition

The scientific integration passes with two local repairs to
the fiber-distortion exposition and a few precision
clarifications below. I read frozen lines 8506–8734 in full
and checked their introduction and earlier transport pointers.
The new subsection uses the assessed finite orders and one
fixed smaller round connection/curvature value basin. It adds
no strain threshold, new primary source, or general-data
regularity result. The older closed round-defect section
remains byte-identical.

## Exact text repairs

- At 8524–8526 and 8554–8557 define the complex structures
  before using them. In the earlier real-transport subsection
  the map \(\Phi\), projection \(P_f\), and fields
  \(\mathcal H,\mathcal R\) are defined, but \(j^\Phi\) is
  not. Write \(j_f v=f\times v\) using the oriented unit
  Euclidean cross product and
  \(j^\Phi_f=(d_u\phi)j_u(d_u\phi)^{-1}\) at \(f=\phi(u)\).
  The cross product for \(j\) uses the unit round sphere
  convention, distinct from the scaled native Lie bracket.
  At 8603–8605 specify the **operator** norm for the exact
  discrepancy. In oriented singular frames it equals
  \(r(u)-1\), where \(r(u)\) is the ratio at the same
  direction, so its fiber supremum is \(D-1\). The square-sum
  tensor norm used for the finite vertical jets is valid for
  those bounds but would change that equality.
- At 8594–8597 use projection to the **perpendicular
  complement** of the line spanned by \(Su\), and keep the
  common denominator before taking the tangent ratio:
  \(\sqrt m/|Su|\le\sigma_{\min}(d_u\phi)\le
  \sigma_{\max}(d_u\phi)\le\sqrt M/|Su|\).
  This follows by taking \(\inf_t|S(v-tu)|\) for unit
  \(v\perp u\) and bounding the other stretch by
  \(\sqrt M/|Su|\). The weaker absolute stretch interval
  \([D^{-1},D]\) alone would only give a ratio bound \(D^2\).
  An eigenvector of the middle eigenvalue attains \(D\).
  The preceding fiber isotopy proves orientation
  preservation and degree one and can state both explicitly.

For readability at 8538–8551 use “the time integrals of each
of the following quantities” and list the suprema of
\(|q|, D-1, |b|,|\nabla^\Gamma b|,\mathfrak B_+\) in norm
notation. The \(\infty,2v\) expressions already include a
spatial supremum. This does not change the intended estimate.
[E137, whole-fiber formulas][e137] · [E139][e139].

## Time integrals, finite derivatives and scale

At 8578–8590 the unweighted low and high blocks for
\(q\) are controlled by \(H_h(q)\) before integration;
the stable \(H^5\) bound carries the same coefficient
\(\ell\) with rate \(e^{-6s}\). The previously proved
unsquared integral of \(T\) supplies the other term.
Both are pulled back at the same native time. The value
tube uses the separate order-zero head bound and
\(H^{10}\) stable background bound of size \(C_hv\),
using the actual curvature identity to reach \(Q\).
It does not use smallness of \(\ell\). Taking \(S\) in the
fixed positive interval corresponding to \([7/8,9/8]\)
for \(Q\) makes the segment to \(I\) compact and positive.
The inverse, its \(S\) derivatives, and the intrinsic target
discrepancy are smooth on the full fiber in the stated
norms. The mean value estimate and \(|S-I|\le|q|\) give
all three orders through two, including both poles.
[Endpoint assessment][endpoint] · [E137][e137].

In 8528–8536 and 8614–8658 the derivative along the target
\(Y^\Gamma\) holds \(f,P_f\) parallel. It subtracts the
live \(\nabla^g_Y X\) term on the original base covector
slot. The induced \(E\)-connection is \(\Gamma\), so the
difference on an endomorphism is \(-[B_Y,Z_X]\). This is
distinct from differentiating an \(A\)-parallel fiber label.
The \(\pi\) in the display is the target sphere projection
and \(D^\Gamma\) acts on \(E\); a short declaration would
make the notation local. The bracket conversion gives
\(|B|_{\rm HS}=|b|\), \(\|B_X\|_{\rm op}=|b_X|/\sqrt2\)
in the native norms. The old \(E\)-valued constants gain
\(\sqrt2c^{-k/2}\) in \(k\) base covector slots and the
endomorphism constants gain \(c^{-k/2}\), \(c=2K\).
This accounts for the full mismatch bounds in 8629–8632.

The relative Sylvester estimate for \(P\) before changing
connections is \(2\sqrt3|\nabla^AT|+
(4\sqrt3+8)|T|^2\). The commutator correction costs at
most \(2(|b|/\sqrt2)|P|\le8\sqrt3|T|^2\), summing the two
base slots independently. For \(T\) in place of \(P\) the
cost is \(4\sqrt3|T|^2\). Transposing \(P\) commutes with
the metric connection, and differentiating \(B\) has exactly
the native Hilbert–Schmidt norm of \(\nabla^\Gamma b\).
These give precisely 8648–8653. The full derivative is
included with no extra derivative beyond that controlled by
the inherited endpoint. [E137][e137] · [E139][e139] ·
[E09][e09].

At 8660–8684 the projected Hessian contains all three
terms from the audited formula, including the normal
ambient derivative of the round-parallel inner direction.
The \((1,2\sqrt2,8)\) constants bound full component
sums in the two fiber slots, so they carry over after
summing the independent live base slots. Parallel
transport of all vertical slots is isometric and
commutes with the round derivative. The cross-reference
to transport:moments gives the two exact \(4\pi/5\)
quadrupole coefficients over target round area \(4\pi\).
For explicitness, this gives
\(\|\mathcal R\|_{L^2_f}=\sqrt{4\pi/5}|T|\) and
\(\|\mathcal D^\Gamma\mathcal R\|_{L^2_f}
=\sqrt{4\pi/5}|\nabla^\Gamma T|\).
Integrating the squared first identity is controlled by
\(\mathcal J\); the second is used with an unsquared
integral. The additional skew moment in E137 has factor
\(4\pi/3\), distinct from the two moments referenced in
the frozen prose. No change of fiber measure is used.
[E03A][e03a] · [E137][e137] · [E139][e139].

At 8558–8566 and 8686–8699 the scalar target is
\(12K/c=6\), and the ordinary two-form norm counts each
unordered base pair once. The frozen prose now explicitly
distinguishes it from full ordered component sums. For
transparency, at 8690 state the \(\sqrt2\) equality
as an equality of component arrays in the corresponding
orthonormal internal frames, not of underlying forms in
one frame. Add that the old block
\(\mathfrak C_+\) at transport:curvature-block equals
\(c\mathfrak B_+\). Base scaling contributes \(c^{-1}\)
to the old two-form norm, so the \(\sqrt2\) native
component conversion gives the new factor \(1/2\).
Dividing the old inequality by \(c\) gives the stated
\(\frac12|q|+6|\nabla^AT|+(42+8\sqrt3)|T|^2\).
The coefficient norms of \(W^+\), traceless Ricci and
scalar deviation are correctly weighted, and there is
no opposite-chiral conclusion. Harmonizing “HS,op” at
8560 with the old “op,HS” for the Hilbert–Schmidt norm
of the curvature operator would avoid an apparent
change of convention. [E137][e137] · [E09][e09].

At 8701–8727 the fixed-label \(\partial_\tau\phi\)
formula and the relative Sylvester multiplier
\(s_i/(s_i+s_j)\) agree with E137/E139. A reference
to flow:relative-velocity would make the constant
explicitly traceable. Both \(Q_\tau=c^{-1}Q_t\) and
\(|\nabla^AT|+|T|^2\) acquire \(c^{-1}\) in the
native convention, so its constant \(4512\sqrt2\)
stays unchanged and integration uses the same \(\mathcal J\).
The target field is the velocity composed with \(\phi^{-1}\),
then differentiated intrinsically on the round sphere.
The fixed source derivative composes it back with
\(\phi\) and uses ambient \(E_x\)-valued derivatives
on round domain slots. Its chain rule uses the bounded
first and second fiber jets of \(\phi\) and the Gauss
conversion from the target round derivatives to its
ambient derivatives. An explicit “ambient” at 8716 would
carry the convention forward. In either description no
arbitrary moving \(\Lambda_g^+\) frame is differentiated.
The spatial naturality statement does not transfer the
time derivative by a moving recovery. [E14][e14] ·
[E137][e137] · [E139][e139].

## Scope, source and static checks

The introduction at 329–332 and earlier transport proviso
at 1420–1426 stay within the round-basin result and
distinguish pointwise identities from integrated controls.
The real two-chart \(\mathcal O(2)\) statement correctly
points to the smooth vertical transition at 1349–1353.
Both poles are included, and no off-integrable holomorphic
\(\mathcal O(1)\) theorem, \(W^+=0\) identity, \(W^-\)
control, general-manifold placement or novelty is stated.
The general endpoint packets E138/E140 are separate.

Fine–Panov and Atiyah–Hitchin–Singer are inherited through
the canonical selected-passage records and the earlier
transport citations. Fine's native normalization is
inherited through the same previously read version and
record. No primary source was re-inspected and no new
theorem was attributed. Static scan gives 312 distinct
labels, 178 distinct reference targets, and 33 distinct
cited keys, each with a unique bibliography entry. No
unresolved target was found. The new subsection's math
delimiters and environments are balanced. The frozen
old round-defect section has 4501 raw bytes and
SHA-256 c0e411175c77e13e96aa8ab41f55e2c2593f30e72a5c44560e1baf65068a3fab.
The new subsection's raw span has 8629 bytes and
SHA-256 234d5afbdbd1661b6be590561580299d320f923347e69f652daf27eb1ef57743.
I ran no build and edited no shared file.
[Canonical geometric source record][sources].

## Consumed frozen inputs

| Input | SHA-256 |
| --- | --- |
| [E141 request][req] | 84e8f2a1a6c0d8edda0b11d7b7f6eea1e7442543c46da5f97440e9741c01242b |
| [Frozen TeX][tex] | 7f438b484e92cdc8daa1bddf4967a9e79c74c1c8ed7dfb8692578e0c2e10c4f4 |
| [E137][e137] | 8b2622b44a5a46106f28f67e2a37b2e1a129d238281a7be1f811498a48d95193 |
| [E139][e139] | c2cf4973987a4bf74b9be30fe77aff95979893727bc936dbb71039f9130ecb88 |
| [Real comparison assessment][assessment] | e85f523993f11dd6e5e47a96ec06fce272fa21a1395e4729fbe8380c43b4427c |
| [Endpoint assessment][endpoint] | b94e5725c5f75653b7700880538fb3ec801bb04738977d4c1e7cd7376d289d60 |
| [E03A][e03a] | ffae9af03ae0f42c6578abac85f275015cba23efbffef843b230a0a4e546bbf2 |
| [E09][e09] | c5e66058a3c73e13d6582a5f84c3e297080c67ae2ee6458c0a8bf5ac30e266ae |
| [E14][e14] | 204022875cd34b4672850e9e9540c9a099caa21f8f35c4c82915b359d4412193 |

[req]: ../research-progress/handoffs/SP4-CME-E141_REQUEST_v1.md
[tex]: ../manuscript/chiral_curvature_and_metric_evolution.tex
[e137]: ../notes/137_REAL_COMPARISON_TIME_CONTROL_20261122.md
[e139]: E139_REAL_COMPARISON_TIME_AUDIT_20261122.md
[assessment]: E137_E139_REAL_COMPARISON_ASSESSMENT_20261122.md
[endpoint]: E131_E134_WHOLE_TIME_ENDPOINT_ASSESSMENT_20261122.md
[e03a]: ../notes/05A_REAL_TWISTOR_COMPARISON_20261122.md
[e09]: ../notes/11_TRANSPORT_CURVATURE_COMPARISON_20261122.md
[e14]: ../notes/16_TEMPORAL_STRAIN_CRITERION_20261122.md
[sources]: ../../../../references/SOURCE_NOTES_CME_REAL_TWISTOR_20261122.md
