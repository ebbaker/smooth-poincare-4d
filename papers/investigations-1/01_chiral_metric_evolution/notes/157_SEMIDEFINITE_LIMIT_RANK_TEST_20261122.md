# E157 — Excluding semidefinite pair limits on the specified topology

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Bounded E proof under [B79][b79], configured
gpt-6.2-sol / ultra. Independent helper runtime attestation and
actual lead identifiers are unavailable. The executor authored
E155, E145 and E148. E09 and the E148/E150 assessment are inherited.
The [request][req] freezes five inputs, all verified. This packet
uses the floor-free extraction of the written E155 argument
conditional on its separate assessment. No metric compactness
source is used.

## Setting and disposition

Let \(M\) be smooth, compact, closed, connected, simply connected,
oriented and real four-dimensional, with \(H^2(M;\mathbb R)=0\).
Fix a smooth principal \(SO(3)\) bundle and its oriented adjoint
Euclidean bundle \(E\), with the native negative Killing metric.
Let \(A_n\) be smooth definite connections in the positive-plane,
round-compatible curvature-map sign. Use the E155 live metric
\(g_n\), trace-three positive \(Q_n\), \(S_n=Q_n^{1/2}\) and
\(T_{n,Y}=\frac12(S_n^{-1}\nabla_Y^{A_n}Q_nS_n^{-1})_0\).
The covariant tensors use the live Levi–Civita connection on
base slots, with full squared orthonormal component norms.
Assume supplied smooth orientation-preserving \(\varphi_n\)
satisfy \(\varphi_n^*g_n\to g_\infty>0\) in \(C^1\) and
\(\sup_M(|T_n|+|\nabla^{A_n}T_n|)\le C\) uniformly.
There is no quantitative eigenvalue floor in this packet.

Under these hypotheses the E155 bundle normalizations
give a subsequence with a positive uniform connection/curvature
limit. The proof first obtains a trace-three semidefinite
limit, then proves its rank is three. For actual late slices
of a supplied original smooth flow, this is the positive pair
needed by the assessed E148 continuation criterion. The
use of E155's extraction remains conditional on the separate
assessment of E155. [E155][e155] · [E148/E150 assessment][seq].

## The floor-free extraction

Keep the explicit E155 maps. The smooth curvature isometry
\(\sigma_n=-F_n^\sharp S_n^{-1}:E\to\Lambda^+_{g_n}\)
exists for every \(n\), since each \(Q_n\) is positive.
The prescribed sign makes \(\sigma_n\) oriented.
Set \(g'_n=\varphi_n^*g_n\), choose the fixed smooth chiral
isometry \(\sigma_b:E\to\Lambda^+_{g_b}\), and let
\(J_n:\Lambda^+_{g_b}\to\Lambda^+_{g'_n}\) be the isometry
of E155 induced by the positive tangent metric comparison.
It depends only on the metrics and \(J_n\to J_\infty\)
in \(C^1\). The map
\[
 U_n=(\varphi_n^*\sigma_n)^{-1}J_n\sigma_b:E\longrightarrow
                                     \varphi_n^*E
\]
induces the smooth equivariant automorphism \(H_n\) of the
original frame bundle covering \(\varphi_n\).
In the E155 fixed labels
\(\sigma'_n=J_n\sigma_b\) and
\(D^{\Gamma'_n}=(J_n\sigma_b)^{-1}D^{+,g'_n}(J_n\sigma_b)\).
Thus the transformed chiral connection converges uniformly
by \(C^1\) metric convergence, with no estimate on
\(S_n^{-1}\) or the derivatives of \(H_n,\varphi_n\).

The native bounds needed for E155 fixed-coordinate
equicontinuity are \(|b_n|\le2\sqrt6|T_n|\) and
\[
 |\nabla^{\Gamma_n}b_n|
 \le\sqrt2\bigl(6|\nabla^{A_n}T_n|
                   +(36+8\sqrt3)|T_n|^2\bigr),
 \qquad |\nabla^{A_n}Q_n|\le6|T_n|.
\]
The relative inverses used in those estimates have
eigenbasis factors bounded by one, independent of a
quantitative floor, and the trace-three normalization
bounds the values of \(Q_n\). The fixed-chart conversions
of E155 depend on the bounded transformed chiral and base
Christoffel coefficients and the indicated tensors. Hence
the same finite-chart extraction gives, in one smooth
affine background and a common subsequence,
\[
 A'_n=H_n^*A_n\longrightarrow A_\infty,\qquad
 Q'_n\longrightarrow Q_\infty\ge0,\qquad
                         \operatorname{tr}Q_\infty=3
\]
uniformly. Here primes denote the transported internal
labels and \(A_\infty\) is a continuous connection.
The square-root function on the bounded cone of
positive semidefinite endomorphisms is continuous:
the roots are bounded and positive semidefinite, and
each subsequential matrix limit is the unique positive
semidefinite square root of the limiting matrix.
Compactness of the bounded matrix set also makes
this function uniformly continuous. Thus no derivative
of the square root at the boundary is needed for
\[
 F'_n=H_n^*F_{A_n}=-\sqrt{Q'_n}\,\sigma'_n
 \longrightarrow F_\infty=-\sqrt{Q_\infty}\,\sigma_\infty,
 \qquad \sigma_\infty=J_\infty\sigma_b
\]
uniformly. The map \(\sigma_\infty\) is a \(C^1\) oriented
orthonormal self-dual triple for the supplied positive
metric \(g_\infty\) and the fixed base orientation. In particular
the trace wedge density remains \(dV_{g_\infty}\), even
before definiteness of the limit is proved.
[E155 (1)–(7)][e155] · [E09][e09] · [E145 native bounds][e145].

To check the limit equations, in a fixed smooth local
orthonormal frame write \(a'_n,a_\infty\) for the local
connection coefficients and use the same internal pairing.
By the uniform convergence of the two fields, the formulas
\[
 F'_n=da'_n+\tfrac12[a'_n\wedge a'_n],\qquad
 dF'_n+[a'_n\wedge F'_n]=0
\]
pass distributionally: the bracket terms converge uniformly
and the exterior derivative is tested against fixed smooth
test forms. Thus \(F_\infty=F_{A_\infty}\) and
\(d_{A_\infty}F_\infty=0\) distributionally, with
\(da_\infty=F_\infty-\frac12[a_\infty\wedge a_\infty]\)
continuous in the exterior derivative sense. This does
not require all first derivatives of \(a_\infty\).

## Relative quadratic-form bound and kernel transport

For any \(Y\in TM\) and \(v\in E\), the exact trace-normalized
inverse strain identity on a smooth slice gives
\[
 \nabla_Y^A Q=2S\bigl(T_Y-\operatorname{tr}(Q T_Y)I/3\bigr)S,
 \qquad
 \big|\langle(\nabla^A_Y Q)v,v\rangle\big|
 \le4|Y|_g|T|_g\,\langle Qv,v\rangle .                       \tag{1}
\]
Indeed \(\|T_Y\|_{\rm op}\le |T_Y|\) and
\(|\operatorname{tr}(Q T_Y)|/3\le |T_Y|\) because \(Q\ge0\)
and \(\operatorname{tr}Q=3\). Pair the identity with \(v\)
and use \(|Sv|^2=\langle Qv,v\rangle\).
The constants continue to hold for the normalized
smooth pairs. [E09 inverse strain][e09] · [E155 (6)][e155].

Fix any piecewise \(C^1\) curve \(\gamma:[0,1]\to M\)
and any start vector \(v_0\) at \(x=\gamma(0)\).
Let \(v_n(s)\) be its \(A'_n\)-parallel transport.
On each smooth segment the derivative of
\(u_n(s)=\langle Q'_n(\gamma(s))v_n(s),v_n(s)\rangle\)
is the pairing in (1) with \(Y=\dot\gamma\).
The two inequalities of Gronwall on the concatenated
curve give
\[
 e^{-4C\ell_{g'_n}(\gamma)}u_n(0)\le u_n(1)
                 \le e^{4C\ell_{g'_n}(\gamma)}u_n(0).
\]
In fixed smooth frames along each of finitely many
chart segments, the coefficient matrices of the linear
transport ODE converge uniformly along the curve, using
the uniform convergence \(A'_n\to A_\infty\) and the
bounded speed on each segment. The solutions converge
to transport for the continuous \(A_\infty\), by the
integral ODE and its difference estimate. Fixed chart
transitions preserve the convergence. Also
\(\ell_{g'_n}(\gamma)\to\ell_{g_\infty}(\gamma)\) by the
uniform positive metric convergence. Passing both
bounds to the limit gives, for \(P_\gamma\) the
\(A_\infty\)-parallel transport,
\[
 e^{-4C\ell_{g_\infty}(\gamma)}
        \langle Q_\infty(x)v_0,v_0\rangle
 \le \langle Q_\infty(\gamma(1))P_\gamma v_0,P_\gamma v_0\rangle
 \le e^{4C\ell_{g_\infty}(\gamma)}
        \langle Q_\infty(x)v_0,v_0\rangle .
\]
This reasoning applies to each fixed curve along the same
uniformly convergent subsequence. For a positive semidefinite
symmetric matrix, zero quadratic value is exactly membership
in its kernel. Hence \(P_\gamma\) carries the initial kernel
onto the terminal kernel, by the two bounds and invertibility.
Connectedness yields one rank for \(Q_\infty\). The kernel and
its orthogonal complement are parallel under this continuous
metric connection.

## \(C^1\) parallel projection and curvature preservation

Let \(\Pi\) be the orthogonal projection onto
\(\ker Q_\infty\). It is continuous: the nonzero eigenvalues
of the continuous constant-rank \(Q_\infty\) have
a positive local separation from zero, which permits continuous
functional calculus for the local kernel projection.
Transport is orthogonal and preserves the kernel. Along
each coordinate line, local frame matrices satisfy
\(\Pi(x+te_i)=P_t\Pi(x)P_t^{-1}\), with \(P_t\) the
\(A_\infty\)-transport from \(x\) along that coordinate line.
The transport ODE has continuous coefficients.
Differentiation along the coordinate line gives at every point
\[
 \partial_i\Pi=-[\mathcal A_i,\Pi],
 \qquad \mathcal A_i=\operatorname{ad}(a_{\infty,i}) .
\]
The right side is continuous, so the projection is \(C^1\)
with the indicated coordinate partial derivatives.

The curvature matrix in the vector representation is
\(\mathcal F_{ij}=\partial_i\mathcal A_j-\partial_j\mathcal A_i+
[\mathcal A_i,\mathcal A_j]=\operatorname{ad}(F_{\infty,ij})\).
It is continuous, even though individual
\(\partial_i\mathcal A_j\) need not be functions.
Take alternating derivatives of the parallel projection
equation. The product rule for \(d[\mathcal A,\Pi]\) here
uses only the **exterior** derivative of \(\mathcal A\).
To justify it, locally mollify the continuous one-form
\(\mathcal A\). On smaller charts it and its exterior
derivative converge uniformly to the original continuous
coefficients because exterior differentiation commutes
with the convolution there. Use the ordinary alternating
product rule with the mollified coefficients and the
\(C^1\) projection, then pass in distributions. In components
this gives
\[
\begin{aligned}
 0&=\partial_i\partial_j\Pi-\partial_j\partial_i\Pi\\
  &=-[\partial_i\mathcal A_j-\partial_j\mathcal A_i,\Pi]
    -[\mathcal A_j,\partial_i\Pi]+[\mathcal A_i,\partial_j\Pi]
   =-[\mathcal F_{ij},\Pi] .
\end{aligned}
\]
The last equality uses the parallel equation and the Jacobi
identity. All expressions in the last identity are continuous,
so it holds pointwise. Thus the continuous curvature preserves
the kernel and its orthogonal complement.

## Exclusion of ranks two and one

Trace three excludes rank zero. The identity
\(F_\infty=-\sqrt{Q_\infty}\,\sigma_\infty\) identifies the
internal image of \(F_\infty:\Lambda^2 TM\to E\) with
\(\operatorname{im}Q_\infty\), since \(\sigma_\infty\) is
an orthonormal chiral triple.

If the rank were two, the kernel would be a real line \(L\).
For each pair of tangent vectors, the skew endomorphism
\(\operatorname{ad}(F_\infty(X,Y))\) preserves \(L\).
A skew endomorphism acts as zero on an invariant real line.
In the native internal normalization
\(\operatorname{ad}(w)v=(w\times v)/\sqrt2\).
Thus every \(F_\infty(X,Y)\) belongs to \(L\).
Its internal image is instead \(L^\perp\) of dimension
two, a contradiction. This is the \(SO(3)\) line stabilizer
calculation in the continuous curvature representation.

If the rank were one, the image is a parallel \(C^1\)
real line bundle \(L\), by the projection just proved.
Its unit-vector bundle is a two-sheeted covering of \(M\).
Simple connectivity gives a global continuous unit section
\(v\), by path lifting from a choice at one point.
It is \(C^1\): locally one may normalize the projection
of a fixed smooth vector with nonzero projection, and the
chosen section differs from that normalized projection
only by a locally constant sign. The covariant derivative
\(D^{A_\infty}v\) belongs to \(L\) because the projection
is parallel. Since the connection is metric and \(v\)
has constant unit length, \(D^{A_\infty}v=0\).
Trace three now gives
\[
 Q_\infty=3v\otimes v,\qquad S_\infty=\sqrt3\,v\otimes v,
 \qquad F_\infty=v\,\omega,\quad
 \omega=\langle v,F_\infty\rangle=-\sqrt3\,\sigma_\infty(v).
\]
In particular \(\omega\) is a global \(C^1\) real two-form,
self-dual for \(g_\infty\) and of ordinary two-form norm
\(\sqrt3\). The rank-one formula provides this \(C^1\)
regularity without any derivative estimate for the
general semidefinite square-root map.
Distributional Bianchi and the ordinary product rule
give \(0=d_{A_\infty}F_\infty=v\,d\omega\), since \(v\)
is parallel. Therefore \(d\omega=0\).

For the use of smooth de Rham and Stokes, one can approximate
this \(C^1\) closed form by smooth **closed** forms as follows.
Choose finitely many global smooth vector fields spanning
each tangent space, using compactly supported chart fields.
Let \(\Phi_s\) be the composition of their small-time flows,
one time parameter per field. For parameters sufficiently
near zero, \(s\mapsto\Phi_s(x)\) is a submersion for every
\(x\), with one common parameter neighborhood by compactness
and the spanning differential at zero. Average
\(\Phi_s^*\omega\) against smooth
unit-mass parameter densities supported in balls shrinking
to zero. Each average is smooth: in the integral choose
local submersion coordinates for \(s\mapsto\Phi_s(x)\),
with four parameters changed to \(y=\Phi_s(x)\).
A finite smooth partition in \((x,s)\) on the support
expresses the integral as a sum against smooth kernels
in \(x,y\), after integrating out the spare parameters.
The change of variables and the pullback matrices are
smooth and have compact parameter support, so
differentiation in \(x\) acts only on these kernels.
Each average is closed since pullback commutes with \(d\)
for a \(C^1\) form and the derivatives can pass through
the compact parameter integral. It converges uniformly to
\(\omega\) since \(\Phi_s\) tends to the identity in \(C^1\).

By \(H^2(M;\mathbb R)=0\), each smooth closed average is
exact by smooth de Rham. Stokes on the closed manifold
gives zero integral of its wedge square, and uniform
convergence passes this identity to \(\omega\).
On the other hand, self-duality for the positive metric
\(g_\infty\) gives
\[
 \int_M\omega\wedge\omega=\int_M|\omega|^2_{g_\infty}\,dV_{g_\infty}
              =3\,\operatorname{Vol}(M,g_\infty)>0.
\]
This contradiction excludes rank one using exactly the
stated simple connectivity and cohomology hypotheses.

## Positive limit and continuation scope

The constant rank is therefore three. Compactness of \(M\)
and continuity give a positive lower eigenvalue bound for
this limiting \(Q_\infty\). The continuous compatible limit
pair is positive definite with the original round-compatible
curvature-map sign, by the determinant sign of
\(-\sqrt{Q_\infty}\) in \(\sigma_\infty\) labels. Its
self-dual plane and trace wedge density reconstruct
\(g_\infty\), as in E155. If the data are late slices
\(t_n\to t_*<\infty\) of one supplied native original
smooth solution, the positive normalized subsequence
supplies E148's hypotheses and thus a smooth original
continuation after the same-bundle identification, subject
to the separate assessment of the E155 extraction.
No derivative estimate for the normalization maps,
smoothness of the limiting connection, metric
compactness theorem, or flow estimate for the supplied
strain and metric hypotheses is used. The rank-one
argument is specific to the topology above. No new
source inspection or numerical experiment entered.
[E155][e155] · [E148/E150 assessment][seq].

[req]: ../research-progress/handoffs/SP4-CME-E157_REQUEST_v1.md
[b79]: ../brainstorm/notes/B79_SEMIDEFINITE_LIMIT_ON_HOMOTOPY_SPHERE_20261122.md
[e155]: 155_PAIR_COMPACTNESS_FROM_METRIC_LIMIT_20261122.md
[e145]: 145_REAL_TRANSPORT_TEMPORAL_EQUIVALENCE_20261122.md
[e09]: 11_TRANSPORT_CURVATURE_COMPARISON_20261122.md
[seq]: ../reviews/E148_E150_SEQUENTIAL_CONTINUATION_ASSESSMENT_20261122.md

