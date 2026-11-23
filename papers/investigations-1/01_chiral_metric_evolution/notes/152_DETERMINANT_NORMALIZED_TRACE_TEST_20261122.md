# E152 — Determinant-normalized trace fails the local scalar principal test

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Bounded E specialization under [B76][b76],
configured gpt-6.2-sol / ultra. Independent runtime attestation and
actual lead identifiers are unavailable. The executor authored the
inherited E02A, E08 and E11 calculations. E149 is inherited source
comparison. All seven inputs in the [request][req] were verified.
The E08–E13 assessment gives the prior E11 digest. The frozen E11
digest is the bracket-typesetting revision recorded with unchanged
formulas and scope. [E08–E13 assessment][assess] · [Revision record][revision].

## Exact determinant-normalized trace algebra

Work on the trace-three positive cone \(Q=I+q>0\) in the affine
space with tangent space \(V=\operatorname{Sym}_0(\mathbb R^3)\).
Use the Frobenius pairing \(\langle X,Y\rangle=\operatorname{tr}(XY)\)
on \(V\). Put
\[
 p=(\det Q)^{-1/3},\qquad \widetilde Q=pQ,\qquad
 f(Q)=3p-3 .
\]
Then \(\det\widetilde Q=p^3\det Q=1\), and
\(\operatorname{tr}\widetilde Q-3=3p-3=f(Q)\) exactly.
This invariant scalar is smooth on the cone, with \(f(I)=0\)
and \(f>0\) away from \(I\) by the arithmetic-geometric mean
inequality for the trace-three eigenvalues.

For \(U=Q^{-1}\) and \(m=\operatorname{tr}U/3\), differentiating
the determinant gives, on \(V\),
\[
 df(Q)[X]=-p\,\operatorname{tr}(UX),\qquad
 G(Q)=\nabla_V f(Q)=p(mI-U).
\]
This projects the ambient gradient to the trace-free tangent space.
Using \(D_XU=-UXU\) and
\(D_Xp=-p\,\operatorname{tr}(UX)/3\) yields
\[
 D^2f(Q)[X,Y]=p\,\operatorname{tr}(UXUY)
       +\frac p3\operatorname{tr}(UX)\operatorname{tr}(UY).
\]
In particular \(G(I)=0\) and \(D^2 f(I)[X,Y]=\langle X,Y\rangle\),
so the Hessian on \(V\) is the identity and the minimum at \(I\)
is nondegenerate. This verifies the scalar hypotheses of E11.

Since \(QG=GQ=p(mQ-I)\) and
\(\operatorname{tr}(QG)=3p(m-1)\), the exact principal action is
\[
 \boxed{\ \mathscr L_QG
 =2(QG+GQ)-\tfrac43\operatorname{tr}(QG)Q
 =4p(Q-I).\ }                                                \tag{1}
\]
At \(Q_\varepsilon=I+\varepsilon D\),
\(D=\operatorname{diag}(1,0,-1)\), write
\(N=(D^2)_0=\operatorname{diag}(1/3,-2/3,1/3)\).
For \(0<\varepsilon<1\), the determinant is \(1-\varepsilon^2\)
and
\[
 G=\frac{p\varepsilon}{1-\varepsilon^2}(D-\varepsilon N),\qquad
 \mathscr L_{Q_\varepsilon}G=4p\varepsilon D .
\]
Thus \(G_{22}=2p\varepsilon^2/[3(1-\varepsilon^2)]>0\), while
\((\mathscr L_{Q_\varepsilon}G)_{22}=0\) and
\(\mathscr L_{Q_\varepsilon}G\ne0\). The two vectors are not
proportional throughout this open ray. Equivalently, since
\(D\perp N,\ |D|^2=2,\ |N|^2=2/3\), the projection is
\[
 Y=\Pi_{G^\perp}\mathscr L_{Q_\varepsilon}G
   =\frac{4p\varepsilon^2}{3+\varepsilon^2}(\varepsilon D+3N),
 \qquad |Y|^2=\frac{32p^2\varepsilon^4}{3+\varepsilon^2}>0.       \tag{2}
\]
In particular the expansion \(Y=4\varepsilon^2N+O(\varepsilon^3)\)
agrees with E11's \(a=1\) general coefficient, but the identification
here is exact. [E11][e11].

## Actual compatible local jets and the flow derivative

Fix one sufficiently small \(\varepsilon>0\) in the E11 setting.
Use its oriented real Euclidean four-chart and trivial oriented
internal bundle, the old calibration \(K=1\), bracket-frame
internal metric, and the round-compatible self-dual triple
\(\Sigma_i^*\) of squared norm two. Set \(Q_*=Q_\varepsilon\),
\(q_*=Q_*-I\), \(s_i=\sqrt{(Q_*)_{ii}}\),
\(d=\sqrt{\det Q_*}\), and \(F_i^*=-s_i\Sigma_i^*\).
Use the inherited E11 polynomial, with \(H\in V\),
\[
 \begin{aligned}
 A_b^0 &=\tfrac12 x^aF^*_{ab},\qquad
 A=A^0+\tfrac16\sum_a(x^a)^3 V^a,\\
 V_i^a&=-\sum_j(H_{ij}/s_j)J_j dx^a,\qquad
 J_j\xi=\iota_{\xi^\sharp}\Sigma_j^* .
 \end{aligned}                                               \tag{3}
\]
Here \(V^a\) is the internal-valued one-form for the fixed
index \(a\). The \(s_i\) are positive. The exact curvature
\(F_A\) of (3) satisfies the covariant Bianchi identity.
At the center \(o\), \(A(o)=0\), \(F_A(o)=F^*\),
\(Q(o)=Q_*\), and the reconstructed \(\widehat g(o)\) is
Euclidean. The spatial first jets of \(F_A,Q,\widehat g\)
vanish independently of \(H\). For each finite coefficient
choice, positivity and the selected sign persist in a local
neighborhood by continuity from \(F^*\).

In E11's verified cubic right inverse, \(dx^a\wedge V^a\)
changes the \(aa\) coordinate second derivative of \(Q\) by
\(H\), with zero change in off-diagonal coordinate second
derivatives. The affine baseline contributes \(dq_*/2\) in
each \(aa\) slot, and the additional internal commutator in
the covariant Hessian is skew in the two base slots, hence
has zero contraction. Therefore
\[
 \partial_a\partial_b Q(o)=\delta_{ab}(dq_*/2+H),\qquad
 \Delta_A Q(o)=4(dq_*/2+H).
\]
These are precisely the E11/E08 bundle-compatible jet identities.
The scalar Hessian can use these coordinate derivatives because
the first jet of \(w=f(Q)\) vanishes. The scalar is frame independent
by invariant trace and determinant. [E11 polynomial][e11] ·
[E08 calculation][e08] · [E08–E13 assessment][assess].

Now choose \(H=-dq_*/2-G+L Y\) with \(Y\) from (2) and
finite \(L>0\). The matrices \(G,H,Y\) lie in \(V\), and
\(\langle G,Y\rangle=0\). Thus
\[
 dw(o)=0,\qquad \nabla^2 w(o)=-|G|^2g_{\rm eucl}.
\]
The nonzero \(G\) gives a strict local maximum. The scalar value
\(f(Q_*)\), first derivative and full second jet are independent
of \(L\). The curvature and metric lower jets listed above are
fixed as well. At \(o\) the \(\nabla Q\)-dependent terms of the
actual E02A equation vanish. The remaining terms in the old
clock are \(\mathscr L_{Q_*}(\Delta_AQ)-24d q_*\).
The operator \(\mathscr L_Q\) is self-adjoint on \(V\), so
\(\langle G,\mathscr L_{Q_*}Y\rangle=|Y|^2\).
The derivative of \(w\) in the actual original flow direction is
\[
 \begin{aligned}
 w_t(o)
 &=-4\langle G,\mathscr L_{Q_*}G\rangle
                  -24d\langle G,q_*\rangle+4L|Y|^2\\
 &=-\frac{32p^2\varepsilon^2}{1-\varepsilon^2}
      -\frac{48dp\varepsilon^2}{1-\varepsilon^2}
      +\frac{128Lp^2\varepsilon^4}{3+\varepsilon^2}.
 \end{aligned}                                               \tag{4}
\]
This is an actual directional derivative on local connections,
equal to the initial scalar time derivative for any smooth flow
through the respective data. It increases without bound as \(L\)
increases at fixed \(\varepsilon\). Each \(L\) is finite and the
definite neighborhood is allowed to shrink with \(L\).
[E02A full \(Q\) equation][e02a] · [E11 jet implication][e11].

## Native metric and time

The Killing-frame conversion doubles the internal pairing
and multiplies the orthonormal components of \(F_A\) by
\(\sqrt2\). The wedge Gram volume doubles and \(Q\) is
unchanged. Hence \(g=2K\widehat g\) by the four-dimensional
volume scaling. The two-form codifferential in this constant
rescaling acquires \((2K)^{-1}\). On compatible curvature the
native coefficient \(4Q-\frac23\operatorname{tr}(Q^2)I\)
has a constant scalar summand whose codifferential on \(F_A\)
vanishes by Bianchi and self-duality. Its remaining term gives
the same gradient as E02A after \(\tau=2Kt\).
Consequently \(w_\tau=(2K)^{-1}w_t\). For (3) with \(K=1\)
we have \(g(o)=2g_{\rm eucl}\), the scalar Hessian is the same
covariant tensor, and the native time derivative in (4) is
one half the displayed expression. The strict maximum and
arbitrarily positive derivative therefore hold in native units.

## Exact scope of the Fine–Yao comparison

The inherited R26 record is Fine–Yao, *A report on the
hypersymplectic flow*, arXiv:2001.11755v2. E149 identified
the trace maximum inequality as Proposition 3.2, (3.10),
and the derivative inequality as (3.11). The proof of
Theorem 4.7 first points to (3.11) while the trace inequality
it uses is (3.10). Theorem 4.7 uses the time integral of the
spatial supremum of squared seven-dimensional \(G_2\) torsion
for a supplied compact hypersymplectic evolution, and closes
via the report's restatement of the earlier scalar-curvature
extension result. Theorem 4.10 has the near-orthogonal
hypersymplectic initial-triple hypothesis. Their determinant-one
Gram normalization belongs to a smooth triple of individually
closed two-forms with evolution
\(\partial_t\underline\omega
=d(Q\,d^*_{g_{\underline\omega}}(Q^{-1}\underline\omega))\).
The branch instead has \(\partial_\tau F_A
=-d_A d_A^{*g}(B_A F_A)\) in native units and
\(d_AF_A=0\), a covariant Bianchi identity.
Neither algebraic normalization nor covariant closure equates
these equations or their torsion quantities.
[R26 canonical record][r26] · [E149 detailed comparison][e149] ·
[E149 source assessment][a149].

The local calculation rules out transplanting that first
trace maximum step as a purely scalar pointwise principal
closure for \(f=\operatorname{tr}\widetilde Q-3\) in the
connection flow: fixed scalar spatial two-jets and fixed
listed lower jets cannot bound (4) above. This is the exact
determinant-normalized specialization of the assessed E11
mechanism. It neither tests the Fine–Yao theorem on its own
equation nor excludes other spectral, tensor, integrated
or nonlocal mechanisms. It gives a strict **local** maximum
and no global maximum, closed-manifold forward-invariance
failure or singularity construction. The source comparison
is inherited at E149's recorded inspection level, with no
new primary inspection or numerical experiment.

[req]: ../research-progress/handoffs/SP4-CME-E152_REQUEST_v1.md
[b76]: ../brainstorm/notes/B76_DETERMINANT_NORMALIZED_TRACE_TEST_20261122.md
[e11]: 13_SMOOTH_SCALAR_BARRIER_TEST_20261122.md
[e08]: 10_SCALAR_PINCHING_JET_20261122.md
[e02a]: 04A_NONLINEAR_Q_20261122.md
[assess]: ../reviews/E08_E13_CONTROL_ASSESSMENT_20261122.md
[revision]: ../reviews/BROAD_RUN_TYPESETTING_CORRECTIONS_20261122.md
[a149]: ../reviews/E149_CONTINUATION_SOURCE_ASSESSMENT_20261122.md
[e149]: ../reviews/E149_GENERAL_CONTINUATION_SOURCE_COMPARISON_20261122.md
[r26]: ../../../../references/SOURCE_NOTES_CME_CONTINUATION_COMPARISON_20261122.md#r26--fineyao-report-on-the-hypersymplectic-flow

