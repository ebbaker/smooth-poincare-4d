# SP4-CME-E34 — Bianchi-completed curvature symbol at a definite reference

22 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol` / `ultra`.
Actual backend model and effort were not independently exposed. Selected
lead settings unavailable. This is the frozen pointwise calculation in
the [E34 request][request] under [B27][decision]. Input versions are in
the [return][return].

## Source and conventions

Fix one point of a smooth definite reference connection \(\bar A\) on
the oriented real rank-three chiral bundle over a smooth oriented
four-manifold. All coefficients in the symbol are evaluated at
\(A=\bar A\). Use Fine's native positive internal metric given by the
negative Killing form and the native reconstructed metric \(g\) with
volume \(\mu_{\rm F}=\tfrac13\sum_iF_i\wedge F_i\). The \(F_i\) are
self-dual and span the self-dual plane. In the manuscript convention
the base metric differs by the already checked constant factor \(2K\).
Use ordinary form norms induced by \(g\), counting each increasing
multi-index once in an orthonormal frame. The Fourier convention is
\[
 \sigma_\zeta(d_A)=i w_j,\qquad
 \sigma_\zeta(d_A^*)=-i w_{j-1}^*,\qquad
 w_j(f)=\zeta\wedge f\quad
    (f\in\Lambda^j\otimes E),
\]
with \(w_j^*\) contraction by \(\zeta^\sharp\) on degree \(j+1\).
Here \(\zeta\ne0\) is a real covector and \(E\) denotes the real
adjoint fiber, complexified when taking a Fourier symbol.
[Fine v2, Definition 1.4 and §4.2][fine] ·
[E26 native normalization][e26].

Write \(S(u)=\iota_uF\), with \(S^*\) taken in the stated metric.
For a two-form variation \(f\) set
\[
 L_A(f)_{ij}=\frac{f_i\wedge F_j+f_j\wedge F_i}{2\mu_{\rm F}},
 \qquad D_Q(H)=H-\tfrac13\operatorname{tr}(H)Q,\qquad
 P=\sqrt8\,D_Q L_A .
\]
Thus \(P\) maps two-form amplitudes to trace-free symmetric internal
matrices, with the Frobenius pairing. This is the E26 factorization
of the physical symbol. [E26 exact sequence and factorization][e26].

## Leading differentiated curvature equation

For the corrected E27 gauge let \(a=A-\bar A\). Its two adjustment
terms and the physical vector field are
\[
 V_{\rm fixed}(A)=v(A)-d_A(d_A^{*g_{\bar A}}a)
                   -S_A S_A^*d_A^{*g_A}d_Aa .
\]
Here \(S_A\) and the adjoints in the horizontal term use the live
curvature and reconstructed metric. The variation \(b\) of \(A\)
has curvature variation \(f=d_{\bar A}b\), with leading Fourier
amplitude \(f=i w_1 b\). We compare the leading terms that are
second order in \(f\), hence third order in the connection amplitude
before applying any identities. [E27 corrected gauge][e27].

For the physical term write \(v=-d_A^*(B_A F_A)\) with
\(B_A=4Q-\tfrac23\operatorname{tr}(Q^2)I\).
Self-duality and Bianchi give
\(v=*[(d_A B_A)\wedge F_A]\). Under a variation of curvature,
\(\delta Q=2D_Q L_A(f)\) and \(\delta B_A=4D_Q^*(\delta Q)\).
Here \(D_Q^*(V)=V-\tfrac13\operatorname{tr}(QV)I\) on trace-free
symmetric \(V\). Because \(L_A(f)\) uses the ordinary pairing
with the background self-dual \(F\), the adjoint \(L_A^*\) on
symmetric \(H\) is \(H\mapsto HF\). Consequently
\((\delta B_A)F=P^*P f\). Linearizing the Bianchi expression for
\(v\), the variation of the star and the undifferentiated
curvature have at most one derivative of \(b\). The only term
of second order in \(b\) comes from \(d_A\delta B_A\).
At principal order this gives \(-d_{\bar A}^*(P^*P f)\).
Freezing the reference coefficients after differentiating the
connection velocity by \(d_{\bar A}\) therefore gives the curvature
symbol \(-w_1w_1^*P^*P f\).
[Fine v2 §3.1 and Proposition 4.5][fine] ·
[E26 normalization check][e26].

At \(a=0\) the variation of \(d_Aa\) is \(d_{\bar A} b\).
Every operator variation in the horizontal term acts on zero
background input. Its connection variation is consequently
\(-S S^*d_{\bar A}^* f\), and the differentiated curvature symbol is
\(-w_1 S S^* w_1^* f\). In the full variation of \(d_A V_{\rm fixed}(A)\)
the term from varying the outer covariant derivative is algebraic in
\(b\) at the reference, so it cannot change these leading symbols.

The exact outer derivative of the vertical term in curvature
evolution is
\[
 -d_A^2(d_A^{*g_{\bar A}}a)
 =-[F_A,d_A^{*g_{\bar A}}a].
\]
It is curvature multiplication by the vertical generator, because
\(d_A^2\phi=[F_A,\phi]\) for an adjoint-valued zero-form \(\phi\).
Its linearization at the reference contains only first derivatives
of \(b\). In particular the vertical term contributes no
second-order curvature symbol.

Finally \(-\lambda d_A^{*g_A} d_A F_A\) is identically zero on
actual curvature by Bianchi. Its frozen principal symbol on
arbitrary two-form amplitudes is \(-\lambda w_2^* w_2\).
Thus the requested extension to arbitrary \(f\) has evolution
symbol \(-\mathbb B_{\zeta,\lambda}\), where
\[
 \mathbb B_{\zeta,\lambda}
   = w_1w_1^*P^*P+w_1 S S^*w_1^*+\lambda w_2^*w_2 .
 \tag{1}
\]
An actual principal curvature variation \(f=i w_1 b\) is already
in the closed-symbol subspace \(\operatorname{im}w_1=\ker w_2\).
The added term acts only on the complementary amplitudes in this
chosen extension. The actual curvature computation determines
the leading physical and horizontal action on
\(\operatorname{im}w_1\).

## Exact blocks and positive closed-symbol part

Normalize \(|\zeta|_g=1\) and let
\[
 \mathcal X=\operatorname{im}w_1
       =\bigl(\zeta\wedge(\zeta^\perp)\bigr)\otimes E,\qquad
 \mathcal Y=\ker w_1^*
       =\Lambda^2(\zeta^\perp)\otimes E .
\]
Here \(\zeta^\perp\) means the orthogonal covector subspace.
Both spaces have dimension \(3\cdot3=9\), and they give the
orthogonal decomposition of the eighteen-dimensional two-form
space. Wedge by \(\zeta\) is isometric from one-forms orthogonal
to \(\zeta\) onto \(\mathcal X\), hence \(w_1w_1^*=\Pi_{\mathcal X}\).
Likewise \(w_2\) kills \(\mathcal X\) and is isometric on
\(\mathcal Y\), which gives \(w_2^*w_2=\Pi_{\mathcal Y}\).
The operator \(w_1 S S^*w_1^*\) takes values in \(\mathcal X\)
and vanishes on \(\mathcal Y\). Consequently (1) is exactly
\[
 \mathbb B_{\zeta,\lambda}=
 \begin{pmatrix}D&C\\0&\lambda I_{\mathcal Y}\end{pmatrix},\qquad
 D=\Pi_{\mathcal X}P^*P|_{\mathcal X}
      +w_1 S S^*w_1^*|_{\mathcal X},\qquad
 C=\Pi_{\mathcal X}P^*P|_{\mathcal Y}.
 \tag{2}
\]
The two summands of \(D\) are self-adjoint and nonnegative on
\(\mathcal X\). For \(f\in\mathcal X\) their quadratic form is
\[
 \langle Df,f\rangle=|Pf|^2+|S^*w_1^* f|^2.
 \tag{3}
\]

For completeness the pointwise exact sequence used in E26 is
\(\ker(Pw_1)=\operatorname{im}S\oplus\operatorname{im}w_0\)
inside the connection-amplitude space. The vertical image is
killed by \(w_1w_0=0\). For a horizontal amplitude \(S(u)\),
\(\zeta\wedge\iota_u(F_i\wedge F_j)=\zeta(u)F_i\wedge F_j\)
shows \(L_A(w_1S(u))=\zeta(u)Q/2\), killed by \(D_Q\).
The direct sum has dimension seven since for \(u\ne0\) the
contractions of a basis of self-dual forms with \(u\) span
the three-dimensional covector subspace annihilating \(u\).
Thus the three \(\iota_u F_i\) cannot all be proportional to
\(\zeta\). Wedge by \(\zeta\) followed by projection to the
self-dual forms is onto in each internal component: in a
\(\zeta\)-adapted orthonormal frame the three basis elements
\(\zeta\wedge e^j\) project onto an independent triple.
On self-dual forms \(L_A\) is onto the symmetric matrices
since it is \(U\mapsto(UQ+QU^T)/2\) in the basis \(F_i\)
and \(Q\) is invertible. The map \(D_Q\) is onto the
trace-free symmetric matrices. The five-dimensional rank
then gives the asserted exact seven-dimensional kernel.
[Fine v2 Lemmas 3.3, 3.5, 4.6 and 4.9][fine] ·
[E26 exact sequence][e26].

If (3) vanishes, let \(b=w_1^* f\). Then \(w_1b=f\) and
\(w_0^* b=0\), using \(w_0^*w_1^*=(w_1w_0)^*=0\).
The two zero terms in (3) give \(Pw_1b=0\) and \(S^*b=0\).
The exact sequence puts \(b\) in the sum of the two gauge
images, and the latter two adjoint constraints make it
orthogonal to that sum. Thus \(b=0\) and \(f=0\).
This proves positive definiteness of \(D\). The proof also
holds on the complexified amplitude space by the Hermitian
versions of the same pairings.

## Explicit Hermitian coercivity and uniformity

For unit \(\zeta\), set \(d=\lambda_{\min}(D)>0\) and take
\(M\ge\|C\|_{\mathrm{op}}\). For \(f=x+y\) with
\(x\in\mathcal X\), \(y\in\mathcal Y\), block form (2) gives
\[
 \operatorname{Re}\langle\mathbb B_{\zeta,\lambda}f,f\rangle
 \ge d|x|^2+\lambda |y|^2-M|x||y|
 \ge \tfrac d2|x|^2+
               \left(\lambda-\tfrac{M^2}{2d}\right)|y|^2 .
\]
In particular \(\lambda\ge M^2/(2d)+d/2\) gives Hermitian
coercivity at least \(d/2\) on the full two-form space.
This controls the cross block even though the completed
operator need not be self-adjoint.

For a general nonzero real covector, the two subspaces depend
only on its direction and each term of (1) is homogeneous of
degree two in \(\zeta\). The estimate therefore acquires
the factor \(|\zeta|_g^2\). On a compact set of definite
curvature values, the native reconstructed metrics form a
compact positive metric set in fixed frames. The maps in
(1)–(2), the corresponding orthogonal projections, and all
native pairings depend continuously on the curvature and
the unit direction. Compactness of the native unit covectors
and unit \(\mathcal X\) amplitudes gives a common lower
\(d_0>0\) in (3) and a common upper \(M_0\) for the cross
block. The same inequality with
\(\lambda\ge M_0^2/(2d_0)+d_0/2\) then holds uniformly.
In fixed comparable norms the native pairing can be
represented by its uniformly positive bounded Gram matrix
\(G(F)\). The bound is for the Hermitian form with that
weight and is uniformly comparable to
\(|\zeta|_0^2|f|_0^2\) in fixed norms. An arbitrary change
of the pairing of a nonsymmetric symbol alone is not used
to infer a quadratic-form sign.

## Limit of the symbol calculation

The completed symbol gives a coercive frozen principal
operator on an enlarged curvature-amplitude space.
Bianchi ensures the completion term vanishes for exact
curvature, but the pointwise calculation does not establish
a closed nonlinear equation for independent \(A,F\).
Such a formulation would have to specify the lower-order
terms and prove propagation of \(F=F_A\) and of the
relevant Bianchi constraint. It would also require an
appropriate coupled gauge and evolution theory with
coefficient and solution regularity in a stated class.
This packet supplies none of those dynamical steps and no
endpoint regularity or extension conclusion.

[request]: ../research-progress/handoffs/SP4-CME-E34_REQUEST_v1.md
[return]: ../research-progress/handoffs/SP4-CME-E34_RETURN_v1.md
[decision]: ../brainstorm/notes/B27_CURVATURE_BIANCHI_SYMBOL_20261122.md
[e26]: 26_FINE_GAUGE_ENDPOINT_GAP_20261122.md
[e27]: 27_FIXED_ADJOINT_GAUGE_TEST_20261122.md
[fine]: https://arxiv.org/html/1111.5005v2
