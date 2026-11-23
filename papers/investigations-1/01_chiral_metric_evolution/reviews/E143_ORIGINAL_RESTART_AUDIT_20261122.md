# E143 — Audit of the conditional finite-budget original restart

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Bounded E audit, configured gpt-6.2-sol /
ultra. Independent helper runtime attestation and actual lead
identifiers are unavailable. The executor did not author E140.
The executor authored the E138 premise, the inherited E28
correspondence and E50 comparison, and the related E14/E24 temporal
calculations. This audit recomputes the specified implication and
treats E138 as a premise for the separate E142 audit.
[Request and frozen inputs][request] · [E140 derivation][e140] ·
[Frozen premise version][e138].

## Disposition

**Pass as a conditional implication.** I found no mathematical gap
in E140 at the stated premises. It uses the frozen E138 datum and
completion radii, one smooth reference's positive common horizon,
and the assessed smooth local correspondences. Finite temporal
budget of any size gives a smooth extension of the supplied native
original flow on the fixed bundle and in its fixed identification,
conditional on that radius theorem. This audit leaves the premise
conditional.

## Native clock, norms and endpoint

In the oriented E24 bracket frame
\([e_i,e_j]=\epsilon_{ijk}e_k\), \(\operatorname{ad} e_i\) is
the real cross-product matrix. Its product trace with
\(\operatorname{ad}e_j\) is \(-2\delta_{ij}\), so the negative
Killing metric is \(2\delta\) and the native orthonormal frame is
\(e_i/\sqrt2\). The same Lie-algebra-valued two-form has
native coefficients \(\sqrt2 F_i\). The trace normalization of
the wedge Gram doubles its volume from \(2K^2dV_{\widehat g}\)
to \(4K^2dV_{\widehat g}\) and leaves \(Q\) as the same
endomorphism. The positive self-dual plane is unchanged. In real
dimension four a constant metric factor \(c\) scales volume by
\(c^2\), giving \(g=c\widehat g\), \(c=2K\).

At compatible curvature \(B=4Q-\tfrac23\operatorname{tr}(Q^2)I
=2I+4H_q\), \(H_q=q-\tfrac16|q|^2I\).
Self-duality and Bianchi give \(d_A^{*g}F_A=0\),
so the native physical velocity is \(-4d_A^{*g}(H_qF_A)\).
The star on degree \(k\) scales by \(c^{2-k}\).
In \(-*d_A*\) on two-forms only the output star on degree three
contributes \(c^{-1}\). Comparison with the actual E24 equation
therefore gives \(\tau=ct\). The constant scale preserves the
Levi–Civita connection at each evaluation time and the internal
endomorphism norm. Thus \(|T|_g=c^{-1/2}|T|_{\widehat g}\)
and \(|\nabla^A T|_g=c^{-1}|\nabla^AT|_{\widehat g}\):
their one and two full covariant base indices have those powers,
respectively. Consequently \(\mathcal G_g=c^{-1}\mathcal G_{\widehat g}\),
and \(d\tau=c\,dt\) gives exactly the same \(J\).
[E24][e24] · [Recorded Fine v2 normalization][sources].

To check the one-form constant, put \(X=\nabla^A Q\),
\(C=X-\tfrac13\operatorname{tr}(QX)I\), one base slot at a time.
The inverse strain identity is
\(X=2(STS-\tfrac13\operatorname{tr}(QT)Q)\).
For \(L(U)=SUS\) on the symmetric endomorphisms,
\(L-LI\otimes LI/3=L^{1/2}\Pi L^{1/2}\), where \(\Pi\)
is orthogonal projection perpendicular to \(L^{1/2}I\), of squared
norm \(\operatorname{tr}Q=3\). Thus the inverse has norm
at most \(2\lambda_{\max}(Q)\le6\).
Since \(\operatorname{tr}X=0\) and \(|q|^2\le6\),
\[
 |C|^2=|X|^2+\tfrac13\sum_c|\operatorname{tr}(qX_c)|^2
       \le3|X|^2 .
\]
The normalized \(\Sigma_j\) wedge-star action is an isometry
on individual covectors. Sum over three internal summands and
use \(\|S\|_{\rm op}\le\sqrt3\) to get
\(|*(C\wedge F)|\le K\sqrt3\,|CS|\le3K|C|\).
The E24 velocity \(+4*(C\wedge F)\) therefore has one-form
norm \(\le72\sqrt3K|T|_{\widehat g}\).

For the curvature constant, retain the E14 relative curvature
identity. In its notation the derivative coefficient
\(\mathcal D=\nabla^A N+[P,N]\) is bounded by
\(36|\nabla^AT|+300|T|^2\), using the inherited bounds
\(|\nabla^AN|\le36|\nabla^AT|+156|T|^2\),
\(|P|\le2|T|\), and \(|N|\le36|T|\).
The last product \(\sum N^c(P_c+B_c)\) has norm at most
\(252|T|^2\), from \(|B|\le5|T|\).
For the ordered tensor
\(E_{ab}^{\rm aux}=\mathcal D_a{}^c\Sigma_{cb}\),
the covector isometries and three-summand Cauchy–Schwarz give
\(\sum_{a,b}|E_{ab}^{\rm aux}|^2\le3|\mathcal D|^2\).
In the ordinary two-form norm the antisymmetrization obeys
\[
 \sum_{a<b}|E_{ab}^{\rm aux}-E_{ba}^{\rm aux}|^2
             \le2\sum_{a,b}|E_{ab}^{\rm aux}|^2 .
\]
This gives \(\sqrt6|\mathcal D|\), and the \(\Sigma\)-term
uses \(\|\Sigma_j\|=\sqrt2\) in the ordinary norm.
The relative velocity bound is therefore at most
\(4K[\sqrt6(36|\nabla^AT|+300|T|^2)+252\sqrt2|T|^2]\).
Using \(\sqrt6<5/2\) and \(\sqrt2<3/2\) gives the coefficients
\(360,4512\) of \(K|\nabla^AT|\), \(K|T|^2\).
Multiplying by \(\|S\|_{\rm op}\) gives the E24 coarse bound
\(4512\sqrt3 K\mathcal G_{\widehat g}\) for \(F_t\).
No further ordered-component factor occurs upon conversion.
[E14 relative identity][e14] · [E24 equations (6)–(8)][e24].

For a fixed-identification time derivative of an internal-valued
\(k\)-form the native/live norm factor is
\(\sqrt2 c^{-k/2}c^{-1}\), the last \(c^{-1}\) from time.
Thus the \(k=1\) coefficient is
\(\sqrt2 c^{-3/2}72\sqrt3 K\,c^{1/2}=36\sqrt6\)
against \(|T|_g\). The \(k=2\) coefficient is
\(\sqrt2 c^{-2}4512\sqrt3 K\,c=2256\sqrt6\)
against \(\mathcal G_g\).
The relative metric and quadratic-form inequalities carry the same
exponent \(a_*=4512\sqrt2\,J\) because \(g=c\widehat g\),
\(Q\) and \(J\) are unchanged. Equivalently E14 obtains the
coefficient \(\sqrt2\) in each relative bound by decomposing the
curvature velocity into chiral bases of ordinary norm \(\sqrt2\),
then bounding the metric or the relative \(Q\) velocity by
twice the appropriate coefficient divided by \(K\).
The comparison to \(g_b=g(F_{A(0)})\) costs \(e^{a_*/2}\)
for one-forms and \(e^{a_*}\) for two-forms.
\(\int_0^{t_*}\sup|T|_g\,d\tau
\le\sqrt{t_* J}\) by Cauchy–Schwarz and
\(\sup|T|_g^2\le\sup\mathcal G_g\).
Together these give exactly E140 (2) with the fixed native internal
pairing. The argument uses any finite \(J\), without a smallness
or Sobolev hypothesis.

The integrable fixed-norm velocities make
\(A-A(0)\) and \(F_A\) uniformly Cauchy at the endpoint.
The curvature formula passes by testing its derivative against
the smooth fixed \(A(0)\) adjoint, and the quadratic brackets
converge uniformly. The pointwise conserved wedge volume is
strictly positive in the limit. The continuing lower quadratic
bound \(Q_*\ge e^{-a_*}Q(0)>0\) gives positive definiteness, uniformly
over the compact base. The curvature-map sign cannot change in
this nondegenerate limit. These facts justify E38 in a smooth
fixed background; they give continuous endpoint values at this
stage. [E24 endpoint passage][e24] · [E38 graph approximation][e38].

## Compact tube, graph margin and choice order

The continuous endpoint graph is compact in the affine connection
and curvature bundle, using \(A(0)\) as origin and \(g_b\) for
the comparison norm. A uniform closed fiber-ball tube of sufficiently
small radius lies in the open definite component of the given sign.
The native reconstruction is continuous there, so all reference
pair norms compare to the fixed pair norm with a common factor
\(L_0\). The comparison does not change the pairing used to test
a nonsymmetric principal symbol. By E36 the closed curvature
block has a positive margin and the cross-block norm is finite
on the compact unit-symbol range. One \(\lambda\) dominates
that common cross block as specified in E36 and gives a uniform
paired rank-one margin. All these choices precede the selection
of a reference. [E36 reference value neighborhood][e36].

At the graph equation the constraint term disappears and \(W\)
is affine in first independent pair derivatives, with value
coefficients. Substitute the curvature formula: the independent
curvature derivative yields a second connection derivative
through the fixed exterior derivative symbol in \(F_A\).
Other differentiated reference fields and fixed metric coefficients
are lower order. Thus the graph principal array depends on
current and reference pair values. At equality with the reference
the E29 quadratic bound is
\(|H_\xi c|^2+(1-\sqrt3/2)(|S^*c|^2+|x|^2)\)
for the unit-covector splitting \(b=\xi\otimes x+c\).
The exactness behind E29 makes its zero set trivial.
Native unit covectors and unit amplitudes over the compact value
range form a compact set by the uniform norm comparisons.
This gives a uniform strictly positive graph margin and, by
continuity in the current values, a uniform graph comparison
radius \(\rho_{\rm gr}\). No first-jet size beyond the pair
values appears in this symbol test. [E29][e29] · [E36][e36].

The needed E138 inputs are the common datum radius and completed
ball radius, one time for all data in that ball for the chosen
smooth reference, distributional and shortened-slab uniqueness
with strong trace, compatibility, and positive-time smoothing.
They all occur in the frozen derivation. Shortened-slab uniqueness
also follows from restriction decreasing the \(X\) norm and
smooth functions restricting to smooth functions in the closed
slab completion, with E138's contraction and homogeneous
uniqueness on every shorter interval.
With \(\epsilon,R,\rho_{\rm gr},L_0\) fixed, E140 (4) chooses
\(\delta\) small in a common background norm. E38 supplies
one smooth compatible \((\bar A,F_{\bar A})\) within \(\delta\)
and hence in the chosen reference tube. Its \(T_{\rm ref}>0\)
is chosen next and can be arbitrarily short. Only then choose
\(t_{\rm in}\) late enough for distance less than \(\delta\) from
the endpoint and for \(t_*-t_{\rm in}<T_{\rm ref}/2\).
The triangle inequality gives \(2\delta\) in the fixed norm
and the strict margins required in all reference norms.
There is no approximation-to-shrinking-radius argument and
no uniform horizon across distinct reference choices.
[E38][e38] · [Frozen E138 premise][e138] · [E140 steps (4)–(5)][e140].

## Smooth trace identification

The chosen incoming pair is smooth and graph compatible.
Its complete first-jet image for this one datum is compact and
lies in the open parabolic jet region by the graph comparison.
Choose a smooth jet cutoff equal to one on a neighborhood of
that image, supported in the parabolic region, and interpolate
to the fixed Laplacian there. The convex interpolation preserves
the native negative Hermitian-part bound on the interpolated
principal symbol. The E29 smooth compact-bundle construction
then starts a smooth adjusted connection on an individual
positive interval. This use of E29 is the same smooth graph
construction as in E42. The E36 converse lifts it to a compatible
pair. On a short closed slab its spatial first derivatives are
continuous up to zero, and smooth approximation with uniform
spatial \(C^1\) convergence gives completed \(X_\ell\) membership.
In the \(X_\ell\) norm the gradient terms are bounded by
\(C_{\rm ref}\sqrt{\ell}\sup|DU|\). The sup norm tends to the
initial sup norm, which is strictly less than \(R/2\). Thus its
\(X_\ell\) norm is less than \(R\) for an individual \(\ell>0\).
Subtracting the linear mild solution for its own sources and
using the zero-trace homogeneous energy identity proves the mild
identification in this class. Completed uniqueness identifies
the lift with the restricted E138 path on this short slab.
The E138 path is already smooth on the rest of its interior.
Hence smoothness extends to \(s=0\) without a derivative
bound uniform over late incoming data. The incoming original
path has not been placed in the adjusted ball.
[E29][e29] · [E36][e36] · [E42 and assessed mild identity][e42] ·
[E41/E44 assessment][roughcheck].

## Recovery, whole overlap and scope

On the compatible adjusted path use \(a=\mathcal A-\bar A\).
The curvature identity gives
\(\beta=F-\bar F+\tfrac12[a\wedge a]=d_{\mathcal A}a\).
The difference between \(d_{\mathcal A}^{*\bar g}a\) and
\(d_{\bar A}^{*\bar g}a\) contracts the antisymmetric bracket
with the symmetric inverse fixed metric, so it vanishes.
With \(\phi=d_{\mathcal A}^{*\bar g}a\) and
\(z=S_F^*d_{\mathcal A}^{*g}\beta\), E36 reduces to
\(\mathcal A_s=V(\mathcal A)-d_{\mathcal A}\phi-S_F z\).
The live horizontal adjoint and fixed vertical adjoint are
unchanged. The reference is fixed and may be nonstationary,
since at reference equality both gauge terms vanish while the
full \(V(\bar A)\) remains.

For the left action \(h\cdot A=(h^{-1})^*A\), the infinitesimal
action is \(R(\eta,A)=-\mathcal L_\eta A\).
Cartan's connection formula for an invariant bundle generator
with vertical value \(\phi\) and base value \(z\) gives
\(\mathcal L_{\phi+\chi_A(z)}A=d_A\phi+\iota_zF_A\).
Thus \(\xi=-\phi-\chi_{\mathcal A}(z)\),
\(R(\xi,\mathcal A)=d_{\mathcal A}\phi+S_Fz\), and the adjusted
equation is \(V+\mathcal L_\xi\mathcal A\).
Integrate \(\dot j=-\xi(\mathcal A)\circ j\) from the identity.
The smooth generator on each closed slab strictly before
\(T_{\rm ref}\), including the new initial time, gives a smooth
diffeomorphism flow and smooth inverse on the compact principal
bundle. Right-equivariance follows by uniqueness of the ODE,
and the induced base flow is orientation preserving.
Differentiating the inverse gives \(\dot j^{-1}=D(j^{-1})\xi\),
the required left-translated velocity. Direct pullback
differentiation yields
\[
 \partial_s(j^*\mathcal A)
     =j^*(\mathcal A_s+\mathcal L_{-\xi}\mathcal A)
     =j^*V(\mathcal A)=V(j^*\mathcal A).
\]
The last equality uses natural curvature, reconstructed metric,
pairing and adjoints under orientation-preserving bundle
automorphisms. This verifies the exact native recovery signs
in the actual gauge. [E28][e28] · [E36][e36] · [E28/E29 assessment][localcheck].

Taking the recovery slab endpoint \(3T_{\rm ref}/4\) crosses
\(t_*\) by the strict half-time choice, with time left over.
The recovered datum equals the incoming one at \(t_{\rm in}\).
The assessed smooth original uniqueness, using reverse
adjustment from identity with the reference recentered at a
common smooth slice, gives equality on a short subsequent
interval. If the initial interval of agreement had supremum
before \(t_*\), smooth continuity would give equality at that
slice and recentering would continue it. This proves agreement
on the full overlap. Both paths in this step solve the
unadjusted native flow. Equality across an interval to the right
of the splice makes it smooth in the original identification.
The extension recovers the continuous endpoint values by agreement
and continuity, with no need to integrate the gauge generator
from those merely continuous values.
[E28/E29 assessment][localcheck] · [E50 smooth comparison][e50].

The result applies to a supplied smooth solution on the fixed
principal \(SO(3)\) bundle over a smooth compact closed oriented
real four-manifold, with positive planes and the round-compatible
curvature-map sign. The extension in the fixed bundle identification gives
the stated contrapositive for a finite **maximal smooth definite**
lifespan in this component, under E138. There is no near-round,
stationarity, or small-budget requirement. Source attribution
remains at the inherited selected passages of Fine
arXiv:1111.5005v2, Taylor's author-hosted revised text through
the E29 assessment, and Koch–Lamm arXiv:1310.3658v1 through
the E41/E44 assessment. This audit imports no new source theorem
and makes no independent assessment of E138.
[Canonical reference record][sources] · [E28/E29 assessment][localcheck] ·
[E41/E44 assessment][roughcheck].

[request]: ../research-progress/handoffs/SP4-CME-E143_REQUEST_v1.md
[e14]: ../notes/16_TEMPORAL_STRAIN_CRITERION_20261122.md
[e24]: ../notes/24_TEMPORAL_BOOTSTRAP_20261122.md
[e28]: ../notes/28_FIXED_GAUGE_CORRESPONDENCE_20261122.md
[e29]: ../notes/29_LOCAL_PARABOLIC_INPUT_20261122.md
[e36]: ../notes/36_COUPLED_CURVATURE_SYSTEM_20261122.md
[e38]: ../notes/38_CONTINUOUS_COMPATIBLE_DATA_20261122.md
[e42]: ../notes/42_SMALL_VALUE_ROUGH_SYSTEM_20261122.md
[e50]: ../notes/50_SMALL_VALUE_STABILITY_TRANSFER_20261122.md
[e138]: ../notes/138_UNIFORM_VALUE_RADIUS_LOCAL_THEOREM_20261122.md
[e140]: ../notes/140_CONDITIONAL_FINITE_BUDGET_ORIGINAL_RESTART_20261122.md
[localcheck]: E28_E29_LOCAL_FLOW_ASSESSMENT_20261122.md
[roughcheck]: E41_E44_ROUGH_LOCAL_ASSESSMENT_20261122.md
[sources]: ../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md

