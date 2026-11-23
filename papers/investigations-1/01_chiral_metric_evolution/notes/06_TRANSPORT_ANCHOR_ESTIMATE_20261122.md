# SP4-CME-E04 — defect energy anchor and horizontal transport estimate

22 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol` / `ultra`.
Actual backend model and effort were not independently exposed. Selected
lead settings unavailable. This is exact conditional analysis under
[frozen request v1](../research-progress/handoffs/SP4-CME-E04_REQUEST_v1.md)
and the [B03 decision](../brainstorm/notes/B03_TRANSPORT_ANCHOR_DECISION_20261122.md).
Frozen versions are in the [return](../research-progress/handoffs/SP4-CME-E04_RETURN_v1.md).

## Setting and statement

Let \(X\) be a smooth, closed, connected, oriented real four-manifold. Let
\(A(t)\) be a smooth definite solution of the unadjusted flow on an interval
\(I\) starting at \(0\), with fixed base and bundle in time, positive Riemannian
reconstruction and the round-compatible curvature sign. Use the oriented
Euclidean rank-three bundle \(E\) with fiber pairing \(\delta\), fixed
\(K>0\), \(S=Q^{1/2}\), and normalization
\[
 Q>0,\quad \operatorname{tr}Q=3,\quad q=Q-I,\quad F=-KS\Sigma,\quad
 \mu=2K^2dV_{\widehat g},\quad
 A_t=-4d_A^{*_{\widehat g}}[(q-|q|^2I/6)F].
\]
Smooth definiteness at each point is the premise for forming \(S^{-1}\).
The estimate has no quantitative eigenvalue lower bound as input.
The Frobenius norm \(|\cdot|\) refers to \(\delta\), and the eigenvalue symbols
\(m\), \(M\) below denote the smallest and largest eigenvalues of \(Q\).
Set \(D=\sqrt{M/m}\). The same quantity is the maximum tangent stretch
ratio of the fiber map \(u\mapsto Su/|Su|\) as proved in the
[direction distortion check](03_direction_distortion_check_20261122.md).

At a fixed time, take \(T_Y=\tfrac12(S^{-1}\nabla_Y^A Q S^{-1})_0\) for each
real tangent vector \(Y\), where the subscript removes the trace. For any
\(x,y\in X\) define
\[
 c_T(x,y)=\inf_{\gamma:x\to y}\int_0^1 |T_{\dot\gamma(s)}|\,ds,
 \qquad C_T=\sup_{x,y\in X} c_T(x,y).
\]
The infimum runs over piecewise smooth paths with the stated endpoints.
Smooth connectedness supplies such paths. The integrand is homogeneous of
degree one in \(\dot\gamma\), so the cost is invariant under reparametrization
and reversal. The formula uses an internal Frobenius norm and introduces no
base metric comparison. The numbers are allowed to vanish for distinct
points. The global bound \(C_T(t)\le C_*\) will be a separate hypothesis.

Write \(\mathcal P(t)=\int_X |q(t)|^2\mu(t)\), \(V_\mu=\int_X\mu(0)>0\),
\(e(t)=\mathcal P(t)/V_\mu\), and \(e_0=e(0)\). Suppose
\(0\le e_0<3/2\) and \(0\le C_*<\infty\). At each \(t\in I\) for which
\(C_T(t)\le C_*\), set \(r=\sqrt{2e_0/3}\). The following bounds then hold
for every \(x\in X\) at that time:
\[
 D(x,t)\le D_*:=\sqrt{\frac{1+r}{1-r}}\,\exp(\sqrt 2\,C_*),\qquad
 m(x,t)\ge\frac{3}{1+2 D_*^2},\qquad
 |q(x,t)|\le\sqrt{e_0}+6C_* .
 \tag{1}
\]
When the cost hypothesis holds for every \(t\in I\), these constants are
uniform on \(I\). The proof also gives (1) with the instantaneous values
\(e(t)\) and \(C_T(t)\) in place of \(e_0\) and \(C_*\). As a static
statement it applies to any one smooth definite connection with its own
energy average below \(3/2\) and its measured spatial path cost.

## Path estimate, including repeated eigenvalues

Fix a time and a smooth segment of a path \(\gamma\). In an \(A\)-parallel
orthonormal internal frame along \(\gamma\), write the real symmetric
matrix as \(Q(s)\) with \(Q'=\nabla_{\dot\gamma}^A Q\). Parallel transport
preserves the internal norm. Locally on the parameter interval, each extreme
eigenvalue is Lipschitz by the Rayleigh quotient and the smoothness of
\(Q(s)\). Positivity at the parameter value ensures the logarithms are
locally Lipschitz there. This uses the open positive cone and yields no
quantitative floor in any estimate. On each compact smooth path segment,
\(\log D\) is absolutely continuous, and we can integrate its almost-everywhere
derivative.

For precision, at any given \(s\) and with right-sided derivatives, let
\(E_M,E_m\) be the extreme eigenspaces of \(Q(s)\). Then
\[
 M'_+=\max_{u\in E_M,\,|u|=1}\langle Q'u,u\rangle,\qquad
 m'_+=\min_{w\in E_m,\,|w|=1}\langle Q'w,w\rangle.
 \tag{2}
\]
Indeed \(Q(s+h)=Q(s)+hQ'(s)+o(h)\) uniformly in Rayleigh quotients on the
unit sphere. A maximizing vector from the fixed extreme space gives the
lower bound on the right derivative of \(M\). Limit points of maximizers
for \(s+h\) lie in \(E_M\) as \(h\downarrow0\), and their Rayleigh quotients
with \(Q(s)\) are bounded by \(M(s)\). This gives the upper bound. Apply the
same reasoning to \(-Q\) for \(m\). In (2) choose attaining unit \(u,w\).
They are orthogonal when \(M>m\). When \(M=m\), \(Q(s)=I\) and (2) chooses
extreme eigenvectors of \(Q'\) on the whole fiber. These can be chosen
orthogonal when the extrema differ. When \(Q'\) is scalar the logarithmic
derivative below vanishes and an orthogonal pair can still be used.

In both cases \(S^{-1}u=M^{-1/2}u\), \(S^{-1}w=m^{-1/2}w\). The trace
term in \(S^{-1}Q'S^{-1}\) makes the same contribution to both unit vector
pairings and cancels, so
\[
 (\log D)'_+
 =\tfrac12(M'_+/M-m'_+/m)
 =\langle T_{\dot\gamma}u,u\rangle-\langle T_{\dot\gamma}w,w\rangle
 =\langle T_{\dot\gamma},u\otimes u-w\otimes w\rangle_{\rm F}.
\]
The Frobenius norm of the difference of the two orthogonal rank-one
projections is \(\sqrt2\). Thus \(|(\log D)'_+|\le\sqrt2\,|T_{\dot\gamma}|\).
Path reversal gives the same bound for left-sided derivatives and hence
covers the Dini derivatives at crossings. Integrating across the segments
and taking the path infimum gives
\[
 |\log D(y)-\log D(x)|\le \sqrt2\,c_T(x,y).
 \tag{3}
\]
No differentiable eigenvector choices, simple-spectrum hypothesis, or
positive lower bound independent of the sample path entered (2)–(3).

The accepted E03 whole-fiber identity uses the target round unit
\(S(E_x)\) with unnormalized area \(4\pi\). In a local frame the real
remainder is \(\mathcal R_Y(f)=(I-f\otimes f)T_Y f\). Its real \(L^2\)
identity gives the measured path cost exactly:
\[
 C_T=\sqrt{\frac5{4\pi}}\sup_{x,y}\inf_{\gamma:x\to y}
           \int_0^1\|\mathcal R_{\dot\gamma}\|_{L^2(S(E_{\gamma(s)}))}\,ds.
 \tag{4}
\]
For example, with \(|T|_{\rm op}(x)=\sup_{|Y|_{\widehat g}=1}|T_Y|\), one has
\(C_T\le\operatorname{diam}(X,\widehat g)\,\sup_X|T|_{\rm op}\) at a fixed
time. This follows by using length-minimizing curves in the compact
reconstructed metric. It is one sufficient condition for the cost premise.
[Assessed E03 source and normalization](../reviews/E03_COORDINATE_ASSESSMENT_20261122.md).

## Energy anchor and trace-three consequences

The gradient identity from Fine's equation in the manuscript convention
is \(\dot{\mathcal P}=-\|A_t\|_{A}^2\). In the unadjusted flow \(\mu(t)=\mu(0)\)
pointwise, by the assessed Bianchi and self-duality contraction. In
particular \(e(t)\le e_0\). The gradient dependence and clock are as in
[Fine v2, Proposition 4.2](https://arxiv.org/html/1111.5005v2#S4.SS1)
and the [E01 normalization assessment](../reviews/E01_FOUNDATION_ASSESSMENT_20261122.md#normalization-correction-to-integrate).
The pointwise volume identity is derived in
[E02C](04C_VOLUME_AND_JETS_20261122.md). At each time continuity of \(|q|^2\)
on compact \(X\) supplies some \(p_t\) minimizing it, and the positive
measure \(\mu\) gives \(|q(p_t)|^2\le e(t)\). No requirement is placed on how
this minimizing point varies in time.

For any eigenvalue \(\lambda\) of \(Q\), the other two eigenvalue deviations
from one sum to \(- (\lambda-1)\). Thus
\(|q|^2\ge\tfrac32|\lambda-1|^2\) by Cauchy–Schwarz. At \(p_t\), all
three eigenvalues lie in \([1-r,1+r]\). Since \(r<1\), this gives
\(D(p_t)\le\sqrt{(1+r)/(1-r)}\). Apply (3) from \(p_t\) to any \(x\)
using \(c_T(p_t,x)\le C_*\) to get the first assertion of (1). For any
point, \(3=\operatorname{tr}Q\le m+2M=m(1+2D^2)\), giving the second
assertion of (1), including possible ties. All constants are independent of
\(K\), since the average and path cost already use the specified volume
and internal metric.

For the last assertion, the E03 inverse identity is
\[
 \nabla_Y^A Q=2S T_Y S-\tfrac23\operatorname{tr}(QT_Y)Q.
 \tag{5}
\]
For completeness, the operator on the right, taking \(T_Y\) as variable,
is self-adjoint on the trace-free symmetric matrices, which it preserves.
In a \(Q\)-eigenframe, half its quadratic form is
\(\sum_{ij}\sqrt{\lambda_i\lambda_j}(T_Y)_{ij}^2
 -(\sum_i\lambda_i(T_Y)_{ii})^2/3\). Its diagonal part is nonnegative by
weighted Cauchy–Schwarz and \(\sum_i\lambda_i=3\). Dropping the square
shows the upper bound \(M|T_Y|^2\) on the half form, hence the operator norm
is at most \(2M\le6\). The lower positive-definiteness bound for this operator
is unnecessary here. Thus \(|\nabla_Y^A Q|\le 6|T_Y|\). Integrating \(Q'\) in
an \(A\)-parallel frame bounds the norm difference
\(\big||q(x)|-|q(y)|\big|\) by \(6c_T(x,y)\). This gives the last assertion in
(1) from the same energy anchor.

One conservative choice is \(e_0\le 1/256\), \(C_*\le 1/96\). Then
\(\sqrt{e_0}+6 C_*\le 1/16+1/16=1/8\). This checks the small-defect premise
of the [E05 packet](../research-progress/handoffs/SP4-CME-E05_REQUEST_v1.md)
on exactly the time range on which the hypotheses of (1) hold.

## Zero cost, round limit and remaining premises

When \(C_T=0\) for a smooth definite slice, (3) forces spatially constant
\(D\) and the estimate following (5) forces spatially constant \(|q|\),
equal to \(\sqrt{e(t)}\). More generally, applying the variational bound for
ordered eigenvalues to the difference between \(Q\) at the endpoints in
an \(A\)-parallel frame shows that all three eigenvalues are spatially
constant under zero path cost. The path infimum may lose information about
\(T_Y\) in individual directions. If \(T\) itself vanishes identically,
then (5) gives \(\nabla_AQ=0\), so \([\operatorname{ad}(F(Y,Z)),Q]=0\)
for all tangent vectors \(Y,Z\). They supply the full rank-three adjoint
algebra at every point because the three curvature forms are independent.
The only symmetric endomorphisms of the real adjoint representation
commuting with all rotations are scalar. The trace fixes \(Q=I\) in this
case. These implications use data of a given connection and presume no
realization of a spatially constant anisotropic matrix field.

At a round or any perfect connection, \(Q=I\), \(\mathcal P=0\), \(T=0\),
\(C_T=0\), and the given flow vector field vanishes. If \(e_0=0\), the smooth
solution, on its interval of definition, has \(e(t)=0\) and hence \(Q=I\)
throughout. The constants in (1) tend to \(D_*=1\), \(m\ge1\), and
\(|q|\le0\) as \((e_0,C_*)\to(0,0)\).

The estimate is conditional on a small initial normalized energy and a
uniform, sufficiently small measured horizontal path cost for the desired
conclusion. The dissipation identity supplies an energy upper bound and an
integrated time bound for the squared connection velocity. The fixed volume
supplies a determinant identity in fixed coordinates. Neither gives a
bound for (4) over a full interval of interest, a diameter bound, a pointwise
remainder estimate, or geometric compactness. The inverse formula (5) can
be used after measuring or bounding the remainder; its reverse generally
contains an inverse eigenvalue factor. Using that reverse to assume a
uniform bound without an independent argument would reintroduce the
quantitative definiteness premise.

Fine's published local stability theorem presupposes a perfect reference
connection on a compact base and sufficiently small fixed-background
\(L^2_k\) distance with \(k\ge3\). It then gives global existence and
exponential convergence modulo bundle automorphisms. The scalar energy and
path-cost assumptions here do not establish these Sobolev hypotheses.
A preserved remainder bound, sufficient derivative and metric geometry
estimates for continuation, and endpoint compactness or a way to enter
Fine's local-stability basin are separate tasks. The packet proves a static
comparison applied to smooth slices and supplies no dynamical estimate on
those missing quantities. [Fine v2, §4.3, Theorem 4.11](https://arxiv.org/html/1111.5005v2#S4.SS3).
