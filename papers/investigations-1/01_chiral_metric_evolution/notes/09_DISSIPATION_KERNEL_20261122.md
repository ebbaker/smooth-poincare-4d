# SP4-CME-E07 — a local horizontal strain with zero flow speed at one point

22 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol` / `ultra`.
Actual backend model and effort were not independently exposed. Selected
lead settings unavailable. This executes the finite test in the
[frozen request](../research-progress/handoffs/SP4-CME-E07_REQUEST_v1.md)
and the [B06 decision](../brainstorm/notes/B06_DISSIPATION_TO_TRANSPORT_20261122.md).
Input identities are in the [return](../research-progress/handoffs/SP4-CME-E07_RETURN_v1.md).
The evidence is one exact kernel tensor and one family of realizable local
connection jets.

## Exact rational kernel

Take an oriented Euclidean coordinate chart \(x^1,\ldots,x^4\) centered at
\(p=0\), with the standard positive volume form \(dV_0\), and a fixed
orthonormal frame of the trivial real \(E=\mathbb R^3\) with bracket
\([e_i,e_j]=\epsilon_{ijk}e_k\). Let \(dx^{ab}=dx^a\wedge dx^b\), \(K=1\),
and use the normalized Euclidean self-dual forms
\[
 \Sigma_1=dx^{14}+dx^{23},\qquad
 \Sigma_2=dx^{24}+dx^{31},\qquad
 \Sigma_3=dx^{34}+dx^{12}.
\]
They have \(\Sigma_i\wedge\Sigma_j=2\delta_{ij}dV_0\), and in antisymmetric
components \(\Sigma_{i,ab}=\eta_{iab}\) as specified in the request. On
covectors at the Euclidean point write
\(J_j\beta=*_{0}(\beta\wedge\Sigma_j)=\iota_{\beta^{\sharp_0}}\Sigma_j\).
In particular \((J_j dx^a)_b=\eta_{jab}\).

The real linear system in the request maps the four matrices
\(X_a\in\operatorname{Sym}^2_0\mathbb R^3\), a twenty-dimensional source, to
the twelve components of
\(\bigl(\sum_{a,j}(X_a)_{ij}J_jdx^a\bigr)_{i=1}^3\).
Use this integer tensor as an element of its kernel:
\[
 X_1=
 \begin{pmatrix}1&0&0\\0&-1&0\\0&0&0\end{pmatrix},\qquad
 X_2=
 \begin{pmatrix}0&-1&0\\-1&0&0\\0&0&0\end{pmatrix},\qquad
 X_3=X_4=0.
 \tag{1}
\]
To verify every component it suffices to list the two active axis
contributions. The four nonzero needed contractions are
\[
 J_1dx^1=dx^4,\qquad J_2dx^1=-dx^3,\qquad
 J_1dx^2=dx^3,\qquad J_2dx^2=dx^4.
\]
Thus \(\bigl(\sum_j(X_1)_{ij}J_jdx^1\bigr)_i=(dx^4,dx^3,0)\) and
\(\bigl(\sum_j(X_2)_{ij}J_jdx^2\bigr)_i=(-dx^4,-dx^3,0)\).
They sum to zero as \(E\)-valued covectors, giving all twelve required
zeros. The Frobenius norms satisfy \(|X_1|^2=|X_2|^2=2\). Thus the strain
\(X_a/2\) of the unscaled tensor is nonzero, with squared tensor norm one
in the base Euclidean coframe.

## Realization by a quadratic connection

Fix any finite real parameter \(t>0\), which labels the initial data. Let
\(F_i^*=-\Sigma_i\) and \(A^0_b=\tfrac12\sum_a x^a F^*_{ab}\). The
antisymmetry of \(F^*_{ab}\) gives \(dA^0=F^*\). Use the constant
\(E\)-valued covectors
\[
 V^a_i=-\sum_j(X_a)_{ij}J_jdx^a,\qquad
 V^1=(-dx^4,-dx^3,0),\quad V^2=-V^1,\quad V^3=V^4=0,
\]
and set
\[
 A^{(t)}=A^0+\tfrac t2\sum_a(x^a)^2V^a.
 \tag{2}
\]
This polynomial is an SO(3) connection in the chosen trivialization. Its
curvature \(F=dA^{(t)}+\tfrac12[A^{(t)}\wedge A^{(t)}]\) has
\[
 A^{(t)}(p)=0,\qquad F_i(p)=-\Sigma_i,\qquad
 \partial_a F_i(p)=t\,dx^a\wedge V_i^a
 \quad\text{with no sum over }a.
 \tag{3}
\]
Indeed the bracket contribution and its first derivatives vanish at
\(p\), and differentiation of (2) gives the indicated linear term in
\(dA^{(t)}\). The curvature satisfies the Bianchi identity on its whole
chart as the curvature of a connection.

To check the quotient, let \(M_{ij}=F_i\wedge F_j/(2dV_0)\). Then
\(M(p)=I\), \(Q=3M/\operatorname{tr}M\) and
\(\mu=2(\operatorname{tr}M)dV_0/3\). At \(p\), for each fixed \(a\),
\[
 \begin{aligned}
 \partial_a M_{ij}
 &=-\tfrac t2\left(
      \langle V_i^a,J_jdx^a\rangle_0+
      \langle V_j^a,J_idx^a\rangle_0\right)\\
 &=t(X_a)_{ij}.
 \end{aligned}
 \tag{4}
\]
The first line uses self-duality of \(\Sigma_j\) at the Euclidean point
and the adjunction between wedge by \(dx^a\) and contraction by
\(\partial_a\). For the second, \(\{J_jdx^a:j=1,2,3\}\) is an orthonormal
basis of \((dx^a)^\perp\), so each inner product is the negative of its
corresponding entry of \(X_a\). The trace in (4) vanishes. It follows that
\(Q(p)=I\), \(\partial_a Q(p)=tX_a\), and \(\partial_a\mu(p)=0\) in these
coordinates. Since \(A^{(t)}(p)=0\), the full covariant derivative satisfies
\(\nabla_a^A Q(p)=tX_a\) in this frame. This is the same fixed-covector
quotient calculation as in [E02C](04C_VOLUME_AND_JETS_20261122.md), applied
to a first curvature derivative.

For each \(t\), continuity of positive definiteness from \(M(p)=I\) yields a
ball on which the curvature span is positive and has the round-compatible
orientation sign. The ball can depend on \(t\). The smooth positive
Riemannian reconstruction on this ball has \(g=\widehat g_A\) with
\(g(p)=g_0(p)\), the Euclidean metric, because at \(p\) its self-dual plane
is Euclidean and \(\mu(p)=2dV_0\).

The reconstructed Hodge star has a nonzero spatial first derivative in
this family. From (3), \(\partial_1F_1(p)=-t\,dx^{14}\), whose Euclidean
anti-self-dual part is \(-t(dx^{14}-dx^{23})/2\). Differentiating
\(*_gF_1=F_1\) gives
\[
 ((\partial_1 *_g)F_1)(p)=(I-*_0)\partial_1F_1(p)
     =-t(dx^{14}-dx^{23})\ne0.
\]
In these fixed coordinates this also forces \(\partial_1g(p)\ne0\), since
the Hodge star depends algebraically on \(g\). The reconstructed volume
first jet is nevertheless zero by (4).

## Actual flow evaluation and scope

At each point of the definite ball use \(*_g\), the instantaneous
reconstructed Hodge star, and denote by \(R=q-|q|^2I/6\) the flow matrix.
The unadjusted negative-gradient velocity in the manuscript clock is
\(v=-4d_A^{*_{g}}(RF)\). This is the normalized form of
[Fine v2, Proposition 4.2](https://arxiv.org/html/1111.5005v2#S4.SS1).
As \(RF\) is self-dual throughout the ball, the Hodge adjoint formula and
Bianchi yield the following equalities of fields before evaluating at
\(p\):
\[
 v=4*_g d_A(*_gRF)=4*_g d_A(RF)=4*_g((d_A R)\wedge F),
 \qquad v_i=4\sum_j \iota_{((\nabla^A R)_{ij})^{\sharp_g}}F_j.
 \tag{5}
\]
This uses the equality \(*_gRF=RF\) before any differentiation. The spatial
variation of the star and of a reconstructed self-dual coframe is thereby
accounted for exactly. The product term \(R d_AF\) vanishes by Bianchi.
Formula (5) at the displayed point needs only the metric value there,
\(F(p)\), and the matrix derivative. In particular, it makes no assumption
of a spatially constant reconstructed metric.

At \(p\), \(q=0\) and thus \(\nabla_a^A R=tX_a\). Use \(F_j(p)=-\Sigma_j\)
and the Euclidean coframe at that point to obtain
\[
 v_i(p)=-4t\sum_{a,j}(X_a)_{ij}J_jdx^a=0.
\]
For \(S=Q^{1/2}\), the accepted E03 strain is
\(T_a=\tfrac12(S^{-1}\nabla_a^A Q S^{-1})_0\). Equations (3)–(4) give
\(T_a(p)=tX_a/2\) and the reconstructed-metric tensor norm \(|T(p)|=t\).
The real fiber remainder \(\mathcal R_{\partial_a}(f)=(I-f\otimes f)T_a f\)
has squared \(L^2\) norm \((4\pi/5)|T_a|^2\) on the complete unit target
sphere with round area. Summed over the four orthonormal directions this
is \((4\pi/5)t^2\), hence nonzero. Both tensor norms and the zero velocity
are invariant under changes of oriented orthonormal frames.
[Whole-fiber normalization and projection](05A_REAL_TWISTOR_COMPARISON_20261122.md).

This disproves a universal pointwise algebraic estimate
\(|T|\le C(|q|+|v|)\) for smooth definite connection jets. More generally,
there is no finite bound at \((q,v)=(0,0)\) depending only on those
pointwise values at a fixed curvature and metric value, since \(t\) is
arbitrary. The example evaluates the velocity at one point of initial
local data. It establishes no stationary connection, global extension or
time-dependent solution. Integrated coercivity, derivative estimates
involving a spatial neighborhood, and the global pinched energy conclusion
from E05 remain separate statements.
