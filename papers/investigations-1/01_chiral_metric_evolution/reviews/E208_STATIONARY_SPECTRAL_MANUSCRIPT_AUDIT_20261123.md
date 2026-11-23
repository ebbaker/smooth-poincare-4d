# E208 Independent audit of stationary and late spectral manuscript integration

23 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E integration audit under B98/B99,
configured gpt-6.2-sol/ultra. Independent runtime and selected-lead
settings are unavailable. I authored the inherited E204 audit and
the E42 local comparison proof, and audited E138 in E142. The
E202/E203 algebra and application, E205/E206 late-sequence work,
and the manuscript integration were separately authored.

## Disposition

**Pass with local precision edits.** The stationary certificate,
arbitrary-normalization stationary theorem and native late-sequence
theorem have the assessed mathematical content. Both uniform trace
steps and the fixed unadjusted tail are supplied by the stated
inputs, with the interface edits below making the dependencies
explicit at their uses. The abstract should state the criticality
and definite sign requirements. No new analytic or geometric
hypothesis is needed. The protected round section matches its
recorded 4,501-byte identity.

## Stationary certificate, frozen lines 2127–2300

The definition of \(\mathfrak R_Q(X)\) retains the full
Frobenius sign and both skew terms. The lemma fixes the older
cross-product bracket, oriented Euclidean base and \(K=1\)
through the local convention and referenced reconstruction.
\(F=-cD\Sigma\) and \(Q=c^2D^2\) give the actual velocity
\(V_i=-4c\sum_jd_jJ_jH_{ij}\), including the weighted trace
shift. The inverse of \(X\mapsto H\) subtracts the ordinary trace
from \(H\). The weighted sum of the velocity rows vanishes
because the off-diagonal terms cancel in the quaternion product
and the diagonal term is the weighted trace. The relation
map is onto by the first \(J_i\) term. The diagonal source
restriction with \(H_{11},H_{22}\) arbitrary gives an
invertible block on eight components. The edge basis is symmetric
as an array of covectors, has zero weighted trace and zero speed,
and is inverted on each off-diagonal entry by \(J_iJ_j\).
It is therefore an actual twelve-dimensional kernel basis all
the way to coincidences.

The Sylvester substitution in lines 2190–2198 gives
\(D^AS=Y/c\). Under the displayed orientation the starred
Bianchi equation and inverse are \(\mathscr C b=z\),
\(\mathscr C^{-1}=(\mathscr C+I)/2\). The stated \(c^{-2}\)
in its input and \(4c^2\) in the \(b\)-part of \(\Xi\) cancel
in the scalar reduction as required. Using
\([X,\Xi]_{ii}=-2\sum_jX_{ij}\Xi_{ij}\), the commutator
contribution for \(i<j\) is
\(2c^2(d_i^2-d_j^2)\langle X_{ij},\Xi_{ij}\rangle\).
The Sylvester part subtracts
\((d_j-d_i)^2|Z_{ij}|^2\) after division by \(4c^2\).
This leaves \(2d_i d_j|Z_{ij}|^2\) off the principal term.
The mismatch term uses both
\(X_{ij}=-\epsilon_{ijk}J_kZ_{ij}\) and
\(\epsilon_{kji}=-\epsilon_{ijk}\), leaving the minus sign and
the complementary \(k\) term in the displayed scalar block.
The four axes hence give identical copies of the scalar
three-by-three form.

The incidence matrix and \(L s_i(e_p)\) give the exact
\(M=2LG\) at lines 2227–2239. The factor two makes the mixed
term \(-K-K^T\) after polarization. The bidegree statement
at 2274–2282 is the independent E204 certificate: scaling
the basis by \(L\) gives bounds \((6,6)\) for \(H,X\)
and \((7,7)\) for \(\Xi\), and the principal and commutator
terms give individual degrees at most 15. The expected
full axis blocks \(2LM\) have individual degrees at most 14.
All nodes of the stated tensor grid lie inside the triangle.
After applying the univariate degree bound first in \(u\)
and then in \(v\), all 144 checked entries hold identically.

The ordered-square substitution at 2243–2250 is onto,
including the collapsed round side. The forward Bernstein
formula, table, sign ordering and denominator qualification
agree with the inverse-checked frozen arrays. The coefficient
count is \(4(15\cdot10+15\cdot9+15\cdot10)=1740\), with
minimum \(384\) and no degree elevation or subdivision.
Each signed sum is at least \(384\) through the closed square,
which implies \(M_{ii}-\sum_{j\ne i}|M_{ij}|\ge384\).
Diagonal dominance, \(c^2\ge6/11\),
\(L\le164025/64\), and the weighted-to-ordinary trace projection
bound \(\sum|X|^2\le11\sum|Z|^2\) give exactly
\(32768/2205225\). The diagonal norm from the edge formula
is at most nine edge norms squared and the off-diagonals
contribute two, so this comparison uses both entries of
each off-diagonal pair. The three mentioned certificate
artifacts exist and match the lead assessment. This
integration audit does not rerun their exact arithmetic.

## Stationary application and native conversion, lines 2302–2376

The theorem supplies a smooth definite \(SO(3)\) connection with
positive curvature planes and the round-compatible sign on
a closed connected oriented four-manifold. Independent
variation, exactness of the wedge-volume variation, and
self-duality give the true original gradient equation of
the referenced proposition. The derivative of the velocity's
scalar coefficient is \(X_a-\operatorname{tr}(QX_a)I/3\),
as used in the lemma. The positive curvature polar isometry
is oriented by the stated sign, so a positive ordered
internal eigenframe can be matched by the \(SO(4)\) action
onto the positive chiral frame group. Quaternion conjugation
by \(\cos(\theta/2)I+\sin(\theta/2)J_n\) gives the rotations
realizing this action. All quantities are tensor values,
including the mismatch of two connections, so no derivatives
of a local choice of eigenframe arise. Bracket, Hodge star
and the full scalar are equivariant. For arbitrary fixed
\(K>0\), the Bianchi equation cancels its common factor
and the speed gains only the common positive \(K\) at
fixed orthonormal coefficient arrays.

The constant critical path gives zero energy derivative in
the exact integrated identity. Its derivative integrand
is nonnegative by the closed ratio bound and its reaction
weight \(48K\sqrt{\det Q}\) is strictly positive, so the
continuous \(Q-I\) vanishes everywhere against the positive
smooth volume. Compatibility recovers \(A=\Gamma^+\)
under the adapted identification. The older chiral curvature
block then gives ASD Einstein and scalar \(12K\). The native
negative-Killing pairing doubles both wedge numerator and
volume, preserving \(Q\) and doubling \(\mathcal P\).
Since this equality holds along all independent variations,
criticality agrees. The conformal metric scale \(2K\) gives
native scalar six. The separate axial comparison at 2370–2373
does not strengthen the displayed general-spectra theorem.
Indeed on axial spectra the ratio condition is
\(2/3\le t\le3/2\), a strict subinterval of the assessed
axial closed sign interval.

## Late ratio transfer and fixed original tail, lines 5988–6206

The corollary inherits one supplied maximal smooth native
original trajectory on a fixed bundle over a closed connected
oriented homotopy four-sphere with the chosen definite sign.
The two geometric sequence bounds alone exclude a finite
maximal endpoint at 6026–6028, so all positive shifts are taken
inside the actual infinite original lifespan. The limsup is
of spatial suprema at these same original unshifted times.

There are two distinct \(C^0\) uses. The first is strong
uniform convergence of the unshifted normalized pairs
\((h_n^*A(t_n),h_n^*F_{A(t_n)})\) to the continuous compatible
positive pair \((A_*,F_*)\). This is supplied by the compact
family proof at 5683–5693 invoked at 6029–6032. The second
is strong uniform pair trace of
\((\mathcal A_*(s),\mathcal F_*(s))\) to that same pair
as \(s\downarrow0\). The common positive tube and value
radii are fixed before a single smooth reference and its
time. The uniform-value-radii proposition imports the
rough-local theorem, whose actual output lies in the closed-slab
completion \(X_T^\circ\) and has uniform initial trace
(3012–3015, 3133–3146 and 3320–3337). This gives the second
trace, independently of the smooth convergence only on
positive strips. The compatible curvature at zero is the
supplied continuous pair component.

The pointwise \(Q\) formula at 6136–6141 is a conjugation
using the forward adjoint isometry and common pullback of
wedge numerator and volume. The base diffeomorphism is
onto, so the supremum is invariant. Positive compact values
give both lower bounds for the \(3N/\operatorname{tr}N\)
formula and the Rayleigh-quotient ratio estimate. Uniform
convergence of both curvature traces therefore transfers
the exact closed \(9/4\) bound to the same trace supremum.
Only the first convergence uses a subsequence of the
unshifted sequence, so it preserves the limsup inequality.

The smooth adjusted energy squeeze at 6050–6081 gives
constant limiting energy on the positive interval. Directional
invariance in the smooth Lie direction removes the gauge
term. The native negative gradient term then gives \(V=0\)
on each positive slice. On \([\epsilon,s_0]\), the smooth
principal-invariant field with the negative Lie sign integrates
on compact \(P\). The inverse and equivariance follow from
the ODE, and the base orientation follows from the isotopy.
The pulled-back connection is constant on that strip, and
curvature naturality gives the same spectral supremum.
The only limit at \(\epsilon=0\) is a scalar equality.
No rough recovery, convergence of these maps or preservation
along original intermediate slices enters.

The stationary theorem in the native convention discharges
\(H_{\rm gap}\) for the smooth critical slice
\(A^\dagger\), and \(Q=I\) forces its energy and
\(\mathscr E_\infty\) to be zero. The inherited zero-energy
alternative therefore already proves an actual fixed original
round tail. The additional explicit map order is correct:
\(K_n=h_n\circ j_n(s_0)^{-1}\) inverts the actual-head map,
so \(K_n^*\) of the shifted actual pair converges smoothly
to the critical pair. In the earlier perfect-pair argument
the zero signature and positive constant-curvature metric
give the positive round identification \(\Phi\) with
\(\Phi^*(A_0,F_0)=(A^\dagger,F_{A^\dagger})\).
Thus \((\Phi^{-1})^*K_n^*=(L^{-1})^*\) transfers an actual
late datum to the round bundle for fixed
\(L=\Phi\circ K_n^{-1}\). The pullback of the round-basin
original solution by this fixed \(L\), with shifted time,
is the actual original tail by naturality and uniqueness.
The limiting pullback is \((b_\infty\circ L)^*\), as printed.
Fixed pullback and finite time translation alter the constants
at each fixed spatial order while keeping the available
exponent \(\lambda_1(G_0)/2\) in native time.

## Located precision edits

1. **Front scope, 94–97 and 388–392.** Say explicitly that the
   stationary theorem forces perfection of critical connections
   in the selected definite sign class. In the abstract describe
   the limsup of spatial suprema along the same bounded sequence.
   The introduction already distinguishes the original sequence
   and adjusted trace. It can retain the sign-class qualifier
   next to the stationary claim.
2. **Certificate locators, 2264–2282.** Name the artifacts as
   the certificate generator, its full
   [e202_general_stationary_pinching_results.json](../numerics/e202_general_stationary_pinching_results.json)
   file and the independent verifier. The two Python names are
   correct. For the degree proof one short clause can identify the
   clearing factors: the diagonal divisions consume at most
   three powers of a \(d_i\), and \(L\) contains the pairwise
   sums for the off-diagonal divisions. The displayed
   degrees and constants need no change.
3. **Two trace interfaces, 6033–6039 and 6132–6164.** Name
   \((A_*,F_*)\) as the strong uniform pair limit at the
   normalized unshifted times, and state that the common
   closed-slab solution has strong \(C^0\) trace to it by
   the rough-local theorem via the uniform-value-radii
   proposition. These are already established outputs.
   This makes the later use of the second trace explicit
   without deriving it from interior smoothing alone.
4. **Available rate and explicit tail, 6124–6128 and
   6191–6197.** “One may take the native decay exponent
   \(\lambda_1(G_0)/2\)” expresses the available bound without
   suggesting it is sharp for every trajectory. In the explicit
   transfer, identify the direction of \(\Phi^*\) and state that
   smooth shifted pair convergence places the transferred
   datum in the round value basin. After fixing \(n\) and
   \(t_b=t_n+s_0\), let \(B\) be the original round-basin
   solution. State \(A(t)=L^*B(t-t_b)\) by uniqueness and
   naturality, with the same curvature identity. Then the
   displayed limiting map follows from the round smooth
   limit theorem. This is an explicit link to the already
   proved zero-energy alternative and preserves the exact
   pullback order.

The positive-energy neighboring discussion stops at
subsequential critical accumulation. The comparisons to
Fine v2 §1.6 and §5 concern the general critical-point
question and the separate definite-triple equation. The
new spectral theorem and late transfer are branch results.
The Fine2011 key is present exactly once in the manuscript
and canonical bibliography and refers to the inspected v2.
The E207 primary comparison is separate. Across the audited
sections and the selected front lines, all 27 reference
instances resolve, and the ten new labels are unique. All
40 bibliography entries remain in first-citation order.
The result uses only a supplied trajectory with its qualifying
sequence and gives no general stationary exclusion, ratio
preservation, arbitrary initialization or novelty conclusion.
No manuscript edit, certificate rerun, new source retrieval,
build or visual QA was performed.

## Verified identities

| Artifact | SHA-256 |
| --- | --- |
| [E208 request](../research-progress/handoffs/SP4-CME-E208_REQUEST_v1.md) | 9bd6b95115af52acfd6f9fadbe3fd048ae7d8003f80fd29328e91133c52eb7cf |
| [Frozen manuscript](../manuscript/chiral_curvature_and_metric_evolution.tex) | 9c062446dd4fdfc26a9399183328c8530a2b95c3851bb493722c45df5021b03c |
| [E202 proof](../notes/202_GENERAL_STATIONARY_PINCHING_TEST_20261122.md) | 332761652fed6f6d4b861ab3790dba9c85191cc76e72afdedde4729ff9ae858c |
| [E203 proof](../notes/203_CONDITIONAL_STATIONARY_PINCHING_GAP_20261122.md) | 6b75c027d6bedd25be4b4d2be16de3c091d16577bc2b228ae04e776371a397c1 |
| [E204 audit](E204_GENERAL_STATIONARY_PINCHING_AUDIT_20261122.md) | 7e757ba40013fe243db961b287ee1dcdfce074815b3c8fe37602d5fa767c9fba |
| [E202–E204 assessment](E202_E204_STATIONARY_PINCHING_ASSESSMENT_20261123.md) | 83c2699b8244f6300863cb2528af7bf4454cf4435faef01ce5ad9171fd353fe8 |
| [E205 proof](../notes/205_CONDITIONAL_LATE_SPECTRAL_CONVERGENCE_20261122.md) | 6ef513190a6fa113be021f1b0531afc56eaaefaaef3c5e82adacf040871283bf |
| [E206 audit](E206_LATE_SPECTRAL_CONVERGENCE_AUDIT_20261123.md) | 2fe692ce764688a97eab6f7e25b680eeaafdd4a8ea50b61e953b10e1fe756e19 |
| [E205/E206 assessment](E205_E206_LATE_SPECTRAL_ASSESSMENT_20261123.md) | bca701d680e3e0f66dca5c56ba4caa3edb43c0005b8a94d7db4c2225b49858aa |
| [E179/E181 assessment](E179_E181_STATIONARY_ACCUMULATION_ASSESSMENT_20261122.md) | 0c9eb889bb10092e631fb3bea7d06e0120934e6a80682e9f3a05b2d1ff7d3881 |
| [E202 certificate generator](../numerics/e202_general_stationary_pinching.py) | bf5473cec7353232fe138b135ad95932efefa78f222d5af35e221a688e2ee386 |
| [E202 certificate](../numerics/e202_general_stationary_pinching_results.json) | 2402caedf00f18274caecf494e4d8a44c520ea7aec4248cc9bc1dfb2ff85454e |
| [E204 verifier](../numerics/e204_general_pinching_verify.py) | 685a3824b0cd09829eff26d7b55947ea5b235cbed3822fa0fb44a6428ca1a5cb |

The literal protected round block starts at line 8349 and
stops just before the next literal section opening. Its
4,501 bytes hash to
c0e411175c77e13e96aa8ab41f55e2c2593f30e72a5c44560e1baf65068a3fab.
