# SP4-CME-E11 principal obstruction for a smooth invariant scalar

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and the
selected lead's actual settings were unavailable. This fixed E packet
answers the [E11 request](../research-progress/handoffs/SP4-CME-E11_REQUEST_v1.md)
under the [B10 decision](../brainstorm/notes/B10_SMOOTH_SCALAR_BARRIERS_20261122.md).
See the [return](../research-progress/handoffs/SP4-CME-E11_RETURN_v1.md)
for input identities.

## Algebraic statement and normalization

Let \(V=\operatorname{Sym}^2_0(\mathbb R^3)\) with the Frobenius
pairing \(\langle X,Y\rangle=\operatorname{tr}(XY)\).
Write \(\mathcal D=\{Q=I+q:q\in V,\ Q>0\}\).
Let \(f:\mathcal U\to\mathbb R\) be \(C^3\) on a neighborhood
\(\mathcal U\subset\mathcal D\) of \(I\), invariant under
\(SO(3)\)-conjugation, with \(df(I)=0\) and positive-definite Hessian
at \(I\). Subtracting a constant sets \(f(I)=0\). All derivatives
of \(f\) are on the trace-three affine space, and \(G(Q)=\nabla_V f(Q)\)
is the Frobenius representative of \(df(Q)\) in \(V\).
In the manuscript clock the exact rough-Hessian coefficient is
\[
 \mathscr L_Q(T)=2(QT+TQ)-\tfrac43\operatorname{tr}(QT)Q,\qquad T\in V.
\]
It maps \(V\) to \(V\) by the trace-three condition and is
self-adjoint there. The anticommutator of \(Q\) with an endomorphism
is self-adjoint as an operator for this pairing, and the last
term has a symmetric pairing in the two test endomorphisms.
[E02A principal calculation](04A_NONLINEAR_Q_20261122.md).

For every such \(f\) and all sufficiently small
\(\varepsilon>0\) along \(Q_\varepsilon=I+\varepsilon D\),
\(D=\operatorname{diag}(1,0,-1)\), \(G(Q_\varepsilon)\ne0\)
and \(\mathscr L_{Q_\varepsilon}G(Q_\varepsilon)\) is linearly
independent of \(G(Q_\varepsilon)\). The same ray gives actual
local connection jets with a strict spatial maximum of \(f(Q)\)
and a positive derivative there under the unadjusted flow vector.

## Taylor calculation

The quadratic form \(T\mapsto D^2 f(I)[T,T]\) is invariant under
orthogonal conjugation by \(SO(3)\). Every real symmetric matrix
can be diagonalized by an orientation-preserving orthogonal
matrix, by changing the sign of one eigenvector if necessary.
On diagonal trace-free matrices, this quadratic form is invariant
under all three-coordinate permutations. A permutation of
determinant \(-1\) can be composed with a diagonal sign change
of determinant \(-1\) to act in \(SO(3)\) with the same effect
on diagonal matrices. Extend the diagonal quadratic form to
\(\mathbb R^3\) by first subtracting the mean. A symmetric
quadratic polynomial there is a linear combination of
\(\sum t_i^2\) and \(\sum_{i<j}t_it_j\). The two restrictions
to \(\sum t_i=0\) are proportional. Diagonalization and
polarization therefore give
\[
 D^2f(I)[X,Y]=a\langle X,Y\rangle,\qquad a>0 .
\]
Because \(f\) is \(C^3\), the third derivative is bounded on a
smaller closed ball around \(I\); Taylor's formula for \(G\)
gives \(G(I+q)=a q+O(|q|^2)\). The constants in this and
subsequent Taylor remainders may depend on \(f\).

By trace-freeness of \(G\),
\[
 \begin{aligned}
 \mathscr L_QG-4G
 &=2(qG+Gq)-\tfrac43\operatorname{tr}(qG)(I+q)\\
 &=4a\bigl(q^2-\tfrac13\operatorname{tr}(q^2)I\bigr)
                                      +O(|q|^3).
 \end{aligned}
 \tag{1}
\]
The unknown quadratic term of \(G\) affects only the order-three
remainder in (1). This is the claimed leading term with the
coefficient \(a\) determined by the Hessian at \(I\).

Along \(q=\varepsilon D\), set
\[
 N=(D^2)_0=\operatorname{diag}(1/3,-2/3,1/3).
\]
Then \(N\ne0\), \(\langle N,D\rangle=0\), and
\(G/|G|=D/|D|+O(\varepsilon)\) for positive small
\(\varepsilon\). Write \(\Pi_G^\perp\) for orthogonal projection
onto \(G^\perp\) in \(V\). Its operator-norm difference from
\(\Pi_D^\perp\) is \(O(\varepsilon)\), since the unit vector
determines the rank-one projection by its tensor square.
Applying \(\Pi_G^\perp\) to (1) yields
\[
 Y_\varepsilon:=\Pi_G^\perp\mathscr L_QG
     =4a\varepsilon^2 N+O(\varepsilon^3).
 \tag{2}
\]
Since \(a>0\) and \(|N|=\sqrt{2/3}\), the projection is nonzero
for all sufficiently small positive \(\varepsilon\). If
\(\mathscr L_QG=c(Q)G\) held on that ray, the left side of (2)
would vanish pointwise. Projecting eliminates the proportionality
factor for any values it might take, with no regularity premise
on that factor.

## Necessity for a scalar maximum argument on actual jets

Use the same real oriented four-chart and trivial oriented
Euclidean \(\mathbb R^3\) bundle as E08, in the fixed bundle and
base identification, with \(K=1\), \([e_i,e_j]=\epsilon_{ijk}e_k\),
the internal norm \(\delta\), and
\(\Sigma_i^*\wedge\Sigma_j^*=2\delta_{ij}dV_{\rm eucl}\).
In the reconstructed Riemannian metric
\(\mu=2K^2dV_{\widehat g}\); the curvature sign used here is
the round-compatible one. Fix one positive sufficiently small
\(\varepsilon\), and use \(Q_*=Q_\varepsilon\), \(q_*=Q_*-I\),
\(s_i=\sqrt{(Q_*)_{ii}}\), \(d=\det(Q_*^{1/2})>0\), and
\(F_i^*=-s_i\Sigma_i^*\).
Put \(G=G(Q_*)\) and \(Y=Y_\varepsilon\).
For any \(H\in V\), the E08 polynomial has
\[
 A=A^0+\tfrac16\sum_{a=1}^4(x^a)^3 V^a,\qquad
 A^0_b=\tfrac12 x^aF^*_{ab},\qquad
 V_i^a=-\sum_j(H_{ij}/s_j)J_jdx^a ,
 \tag{3}
\]
where \(J_j\xi=\iota_{\xi^\sharp}\Sigma_j^*\).
For clarity, the differential of the curvature quotient at
\(F^*\) takes \(dx^a\wedge V^a\) to \(H\).
Indeed the fixed-metric Gram differential is
\(-\tfrac12(s_j\langle V_i^a,J_jdx^a\rangle+
 s_i\langle V_j^a,J_idx^a\rangle)\), which is \(H_{ij}\) by
orthonormality, and its trace vanishes. The coefficient
in (3) therefore shifts each coordinate second derivative of
\(Q\) in a diagonal tangent direction by \(H\). The affine
baseline is \((d/2)q_*\,\delta_{ab}\) from the self-dual
contraction of its quadratic curvature bracket. Thus
\[
 \partial_a\partial_b Q(p)=\delta_{ab}(\tfrac d2 q_*+H),
 \qquad \Delta_AQ(p)=4(\tfrac d2 q_*+H).
 \tag{4}
\]
The second identity includes the covariant derivative: its
additional term is
\(\tfrac12[\operatorname{ad}(F^*_{ab}),Q_*]\), skew in \(a,b\)
and hence zero after contraction. At \(p\), the connection
value is zero, \(Q(p)=Q_*\), and the first spatial jets of
\(F,Q,\widehat g\) vanish. The reconstructed metric equals
the Euclidean metric there. All are independent of \(H\).
The exact curvature of (3) enforces Bianchi. Smooth local
definiteness and the specified sign hold on a possibly
parameter-dependent ball by continuity from \(F^*\).
[E02C quotient and cubic right inverse](04C_VOLUME_AND_JETS_20261122.md)
and [E08 affine baseline and covariant terms](10_SCALAR_PINCHING_JET_20261122.md).

Let \(w=f(Q)\), which is frame independent by invariance of \(f\).
At \(p\), \(dw\) in base directions is zero and the spatial
Hessian comes solely from pairing \(G\) with the coordinate
Hessian in (4). The Hessian of the scalar is the same using
the reconstructed derivative because its first derivatives vanish.
By \(SO(3)\)-invariance,
\(\langle G,[\Omega,Q_*]\rangle=0\) for each internal skew matrix
\(\Omega\), so the differentiated internal connection term would
also vanish in this pairing. In the actual unadjusted flow,
the first-derivative products in \(Q_t(p)\) vanish and its
zeroth-order term is the fixed curvature reaction \(-24d q_*\).
Consequently changing \(H\) by any \(H'\) with
\(\langle G,H'\rangle=0\) leaves the entire spatial scalar Hessian
fixed but changes the scalar flow derivative by
\(4\langle G,\mathscr L_{Q_*}H'\rangle\).
Since both signs of arbitrary finite amplitudes of such a change
are realized by (3), a local scalar maximum inference based on
this spatial scalar jet with a finite reaction term requires
\(\langle G,\mathscr L_{Q_*}H'\rangle=0\) for all \(H'\perp G\).
Self-adjointness makes this exactly
\(\mathscr L_{Q_*}G\in\mathbb R G\).

In particular, the nonzero projection (2) satisfies
\[
 \langle G,Y\rangle=0,\qquad
 \langle G,\mathscr L_{Q_*}Y\rangle
        =\langle\mathscr L_{Q_*}G,Y\rangle=|Y|^2>0 .
\]
Choose \(H=-\tfrac d2 q_*-G+L Y\) in (3), with \(L>0\)
finite and allowed to depend on \(f,\varepsilon\). Then
\[
 \begin{aligned}
 \nabla^2 w(p)&=-|G|^2g_{\rm eucl},\\
 \bigl(d[f(Q)]\bigr)(v)(p)
    &=-4\langle G,\mathscr L_{Q_*}G\rangle
         -24d\langle G,q_*\rangle+4L|Y|^2,
 \end{aligned}
 \tag{5}
\]
where \(v\) is the actual flow vector at the local connection.
The first line gives a strict spatial local maximum
independently of \(L\). Because \(Y\ne0\), any finite \(L\)
greater than
\(\max\{0,[4\langle G,\mathscr L_{Q_*}G\rangle+
24d\langle G,q_*\rangle]/(4|Y|^2)\}\)
makes the second line strictly positive. The scalar value,
spatial first and second derivatives, \(Q(p)\), and the
first jets of curvature and reconstructed metric are fixed as
its flow derivative increases without bound in this local
jet family. The directional derivative in (5) has the sign
that a smooth solution would have if it attained those data.

The obstruction applies to the prescribed class of \(C^3\)
invariant scalars of \(Q\) with a nondegenerate minimum at \(I\)
and the pointwise scalar maximum argument based on principal
closure. The jet calculation is local and permits the definite
neighborhood to shrink as the jet varies. Global forward
invariance on a closed manifold and estimates using other
classes of quantities or additional hypotheses remain open.
