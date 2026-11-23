# E156 — Static pair compactness audit

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Bounded E audit, configured helper launch
gpt-6.2-sol/ultra. Independent runtime attestation and actual
lead settings were unavailable. I authored inherited E09, audited
E137 in E139 and its manuscript integration in E141, and audited
the E148 sequential criterion in E150. I did not author E155.
The present check covers the new static implication. [Request][req] ·
[E155][e155].

## Disposition

Pass under the supplied positive \(C^1\) metric limit. The
metric identifications give smooth lifts on the same principal
bundle for each term of the sequence. In the resulting fixed
internal labels the chiral connection coefficients converge
uniformly, and the strain estimates give global uniform pair
precompactness and a compatible positive limit. No quantitative
control of derivatives of the normalizing diffeomorphisms or
their lifts is used. Nothing in the proof requires
\(C^{1,\alpha}\) metric convergence, a bound on \(W^-\), or a
metric compactness theorem.

## Directions, norms and orientation of the bundle maps

The positive curvature plane is self-dual for \(g_n\).
For the native orthonormal internal frame, the ordinary
two-form norm gives
\(\langle F_{n,i},F_{n,j}\rangle_{g_n}\,dV_{g_n}
=F_{n,i}\wedge F_{n,j}\).
Thus \((F_n^\sharp)^*F_n^\sharp=Q_n\), with adjoints
against the native internal pairing and the ordinary
two-form norm, counting unordered base pairs once.
Since \(S_n\) is symmetric positive,
\((-F_n^\sharp S_n^{-1})^*(-F_n^\sharp S_n^{-1})=I\).
For the stipulated round-compatible sign, \(F_n^\sharp\)
has the determinant sign of the round map \(-\sigma S\).
Consequently the single minus sign yields the oriented
isometry \(\sigma_n\). The equivalent curvature formulas
are \(F_n^\sharp=-\sigma_n S_n\) as a map and
\(F_n=-S_n\sigma_n\) in internal column components, since
\(S_n=S_n^\top\). \(g_b=g_1,\sigma_b=\sigma_1\) provide
the fixed smooth choice globally on the same \(E\).
[E137][e137] · [E155, (1)][e155].

With \(L_n=g_b^{-1}g'_n\) interpreted by
\(g'_n(v,w)=g_b(L_nv,w)\), the self-adjoint
\(C_n=L_n^{-1/2}\) satisfies
\[
 g'_n(C_nv,C_nw)=g_b(L_n^{1/2}v,L_n^{-1/2}w)=g_b(v,w).
\]
It is the forward tangent isometry from \(g_b\) to
\(g'_n\). For forward covariant transport evaluate
\(\omega\) on \(C_n^{-1}v,C_n^{-1}w\), so the form
map is \(J_n=(C_n^{-1})^*\) in degree two. The positive
determinant of \(C_n\) preserves orientation and makes
the map commute with the Hodge stars. Acting on an
oriented tangent orthonormal frame and its self-dual
triple also gives the chosen orientation on
\(\Lambda^+\). Positivity of \(g_\infty\) on the compact
base and \(C^1\) convergence keep the values uniformly
positive and bounded. In local coordinates smooth
functional calculus on that compact positive range
gives \(C^1\) convergence of \(C_n,J_n\) and their
ambient matrix expressions. The first derivative of
the matrix function uses only the first derivative of
the input metric. [E155, (1)–(2)][e155].

For \(x\in M\), \(d\varphi_n(x)\) is an oriented isometry
from \((T_xM,g'_n)\) to
\((T_{\varphi_n(x)}M,g_n)\). Its pullback on forms carries
\(\sigma_n(E_{\varphi_n(x)})\) into
\(\Lambda^+_{g'_n,x}\). Thus \(\widetilde\sigma_n\) has
source \(\varphi_n^*E\). Precisely
\(U_n=\widetilde\sigma_n^{-1}J_n\sigma_b\) is over the
identity as \(E\to\varphi_n^*E\), and sends the original
fiber \(E_x\) to \(E_{\varphi_n(x)}\) as a family of
isometries. For the frame \(I_p\) represented by
\(p\in P_x\), \(I_{ph}=I_p\circ\operatorname{Ad}_h\).
The adjoint representation of \(SO(3)\) is an
isomorphism onto the oriented isometry group of its
native model; it has no kernel here. Hence the equation
\(I_{H_n(p)}=U_n(x)I_p\) determines exactly one \(H_n(p)\).
It is right-equivariant, and its smooth inverse is given
by \(U_n(\varphi_n^{-1}(y))^{-1}\) on the frame over \(y\).
No lift of \(\varphi_n\) had to be supplied separately,
and this argument invokes no spin lift.
[E155, (2)–(3)][e155].

## Exact chiral cancellation and coordinate derivatives

Let \(\Sigma'_n=J_n\sigma_b=\widetilde\sigma_nU_n\) denote
the pulled-back identification in fixed internal labels.
The associated derivative of \(H_n^*\Gamma_n\) is
\[
 U_n^{-1}(\varphi_n^*D^{\Gamma_n})U_n
 =(\widetilde\sigma_nU_n)^{-1}D^{+,g'_n}
                          (\widetilde\sigma_nU_n)
 =(\Sigma'_n)^{-1}D^{+,g'_n}\Sigma'_n .
\]
This is equality of first-order operators on fixed local
sections, so the cancellation of connection and
identification terms includes differentiation of those
sections. It neither drops \(D U_n\) nor estimates it
separately. In a fixed smooth orthonormal frame,
\(\Theta_{n,j}=\Sigma'_n e_j\) converges in \(C^1\), while
the Christoffel symbols and fiber metrics of \(g'_n\)
converge in \(C^0\). The coefficient
\(\gamma_{n,a;ij}=\langle\Theta_{n,i},
\nabla_{\partial_a}^{g'_n}\Theta_{n,j}\rangle\)
therefore converges in \(C^0\). It is skew by metricity.
The connection coefficients on \(P\) use the fixed
inverse Lie algebra isomorphism from the adjoint
representation. They patch in the fixed affine
background to a continuous metric connection.
This requires one derivative of the normalized metric,
and neither its curvature nor convergence of second
derivatives. [E155, (3)–(4)][e155].

The old compatibility inverse has norm one for the
norm-\(\sqrt2\) triple with the unit bracket.
The native bracket and unit triple each contribute
\(1/\sqrt2\), so the native inverse has operator norm
two. The native wedge-star right side costs
\(\sqrt{3/2}|P|\), where
\(P=S^{-1}\nabla^AS\), and \(|P|\le2|T|\).
This checks \(|b|_g\le2\sqrt6|T|_g\) directly.
For the full derivative, the old relative Sylvester
bound gives
\[
 |\nabla^A P|\le
 2\sqrt3|\nabla^AT|+(4\sqrt3+8)|T|^2 .
\]
The old commutator change to \(\nabla^\Gamma P\)
costs at most \(2|b||P|\le8\sqrt3|T|^2\).
The differentiated compatibility inverse is parallel
for the joint live base and chiral derivative and
costs at most \(\sqrt3\). This gives the old
\(6|\nabla^AT|+(36+8\sqrt3)|T|^2\) with both base
slots counted. Under \(g=c\widehat g\), \(c=2K\),
the old and native endomorphism-valued \(k\)-slot
norms differ by \(c^{-k/2}\), and the \(E\)-valued
ones by \(\sqrt2c^{-k/2}\). Thus the only relative
factor in the derivative estimate is \(\sqrt2\).
There is no clock factor in this static comparison.
No floor is used in these compatibility estimates,
which employ the relative Sylvester multipliers.
[E09][e09] · [E137][e137] · [E145][e145].

For \(X_Y=\nabla^A_Y Q\), taking the trace of
\(X_Y=2S(T_Y+\alpha I)S\) fixes
\(\alpha=-\operatorname{tr}(QT_Y)/3\).
The resulting operator on \(T_Y\) is twice
\(\mathcal S-\mathcal SI\otimes\mathcal SI/3\),
where \(\mathcal S(H)=SHS\). If \(v=\mathcal S^{1/2}I\),
then \(\|v\|^2=\operatorname{tr}Q=3\), and the operator
in parentheses is
\(\mathcal S^{1/2}(I-v\otimes v/3)\mathcal S^{1/2}\).
Thus its norm is at most \(\|\mathcal S\|=\lambda_{\max}(Q)\),
and \(|\nabla^A Q|\le6|T|\). This proof uses no eigenframe
derivative or eigenvalue floor. [E155, (6)][e155].

All live tensor bounds pull back along \(H_n\), with
their base covectors measured using \(g'_n\). Uniform
comparison between \(g'_n\) and the fixed smooth
background therefore bounds their coordinate components.
For \(b'\), the exact coordinate derivative removes
the bounded internal coefficient \(\gamma\) and adds
the bounded base Christoffel term on its original
covector slot. For the zero-form \(Q'\) it removes
the commutator with \(\gamma+\operatorname{ad}(b'_a)\)
and needs no base connection term. These are exactly
the signs and slots in (7). Uniform \(C^0\) bounds on
the coefficients suffice to control \(\partial b'\)
and \(\partial Q'\); there is no derivative of \(\gamma\)
or of the Christoffel symbols in (7).
[E155, (5)–(7)][e155].

## Fixed-background compactness and conditional continuation

Take finitely many compact coordinate balls with larger
smooth charts and frames. On each smaller closed ball
the derivative bounds give uniform equicontinuity, using
line segments inside the larger chart. The fixed frame
transition functions relate the limits on overlaps,
and the common finite subsequence converges uniformly
in the smooth background. This extracts \(b'_\infty\)
and \(Q_\infty\), and uniform convergence of the chiral
connection gives \(A_\infty=\Gamma_\infty+b'_\infty\).
The square root of \(Q'_n\) converges uniformly on
the fixed positive range. Hence \(-S'_n\Sigma'_n\)
converges uniformly to \(-S_\infty J_\infty\sigma_b\).
Trace three and the floor pass to the limit. Since the
limiting triple is an oriented orthonormal self-dual
triple for \(g_\infty\), its span and its native trace
wedge volume give exactly the plane and \(dV_{g_\infty}\).
The invertible \(S_\infty\) preserves the prescribed
curvature-map sign. Thus reconstructing the metric from
the limiting curvature gives \(g_\infty\).

Taking differences from one fixed smooth affine
connection \(A_b\), the true curvature identity
expresses \(d_{A_b}(A'_n-A_b)\) as the difference
of the curvatures minus the quadratic bracket.
The bracket passes uniformly and testing against the
fixed smooth formal adjoint gives the distributional
limit of \(d_{A_b}\). The limiting pair is therefore
compatible. This does not assert smoothness of
\(A_\infty,F_\infty\), and does not use a coordinate
gauge estimate. [E155, limit argument][e155].

The whole-direction same-direction stretch ratio
\(\sqrt{\lambda_{\max}/\lambda_{\min}}\) gives
the two stated comparisons using
\(1\le\lambda_{\max}\le3\). For the spatial real
transport expression put \(x=|\nabla^AT|\),
\(y=|T|^2\), \(z=|\nabla^\Gamma T|\),
\(C_0=4\sqrt3\), and \(k=\sqrt{4\pi/5}\).
The exact moments give \(\Psi=kz+k^2y\), while
\(|z-x|\le C_0 y\) uses the stated horizontal
lift with all base slots. Then
\(x+y\le z+(1+C_0)y\) and \(k\le1+C_0\)
give the lower factor \(k^2/(1+C_0)\).
The upper one is \(k(C_0+k)\).
Thus \(\Psi\le P_0\) gives
\(x+y\le B=(1+C_0)P_0/k^2\) and
\(\sqrt y+x\le\sqrt B+B\), while the original
bound \(C\) gives \(x+y\le C+C^2\).
These are static conversions only. [E137][e137] · [E145][e145].

For actual late slices of one smooth original trajectory
on this same bundle, the constructed \(\varphi_n\)-covering
maps are orientation-preserving and the subsequence meets
all hypotheses of the assessed E148 criterion. The
resulting continuation is in the original identification
and does not require estimates on the inverses of the
normalizing maps. The conditional static proof supplies
no source for the diffeomorphisms, no metric compactness
or spatial strain estimates along a trajectory, and no
opposite-chiral curvature bound. No primary theorem or
numerical test was newly used. [Sequential assessment][sequential].

## Consumed identities

| Input | SHA-256 |
| --- | --- |
| [E156 request][req] | 260ae94a0b9cab3e3e5a6c49382a14a90899162c6fac9bc748537583e99ea1ca |
| [E155][e155] | e8533973ae350ab1c887633212fa942fbfbd0b453a0a3949af5051de8d783ce6 |
| [B78][b78] | e5a9b33906e6b5fa8879098c5f57478411d84c47569f02485a44ce5aa9e8c63e |
| [E09][e09] | c5e66058a3c73e13d6582a5f84c3e297080c67ae2ee6458c0a8bf5ac30e266ae |
| [E137][e137] | 8b2622b44a5a46106f28f67e2a37b2e1a129d238281a7be1f811498a48d95193 |
| [E145][e145] | 544d6d1299560adcd99327d206ca737d44e4a1449567efac8795176ef34833f4 |
| [E148/E150 assessment][sequential] | 6c9480a6dfaedbff17156541faa9c350e61bcf7925d5ae4cec88e8a7d93d4557 |

[req]: ../research-progress/handoffs/SP4-CME-E156_REQUEST_v1.md
[e155]: ../notes/155_PAIR_COMPACTNESS_FROM_METRIC_LIMIT_20261122.md
[b78]: ../brainstorm/notes/B78_BUNDLE_COMPACTNESS_FROM_METRIC_LIMIT_20261122.md
[e09]: ../notes/11_TRANSPORT_CURVATURE_COMPARISON_20261122.md
[e137]: ../notes/137_REAL_COMPARISON_TIME_CONTROL_20261122.md
[e145]: ../notes/145_REAL_TRANSPORT_TEMPORAL_EQUIVALENCE_20261122.md
[sequential]: E148_E150_SEQUENTIAL_CONTINUATION_ASSESSMENT_20261122.md
