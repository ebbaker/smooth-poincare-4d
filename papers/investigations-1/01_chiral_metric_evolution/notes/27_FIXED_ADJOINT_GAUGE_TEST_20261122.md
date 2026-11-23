# SP4-CME-E27 — live-adjoint third symbol and a fixed-metric vertical adjoint

22 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol` / `ultra`.
Actual backend model and effort were not independently exposed. Selected
lead settings unavailable. This executes the [frozen request][request]
under the [B23 decision][decision]. The [return][return] records the exact
manuscript version inspected before lead integration. The scope is the
derivative order of two specified operators.

## Source convention and the two expressions

Use a smooth oriented real four-manifold and a smooth definite reference
connection \(\bar A\) on a fixed oriented Euclidean rank-three bundle.
Compare smooth definite connections in the same orientation component on
this fixed bundle, with positive reconstructed metric. Take
\(a=A-\bar A\) and write \(g=g_A\) in Fine's **native** convention. The
self-dual span is the curvature plane and \(dV_{g_A}=\mu_{\rm F}(A)\),
where \(\mu_{\rm F}=\tfrac13\sum_i F_i\wedge F_i\) in the positive metric given by the negative
Killing form. Equivalently
\(\mu_{\rm F}(A)=(8\pi^2/3)p_1(A)\). Under the normalization in the
frozen manuscript, \(g_A=2K\widehat g_A\) for fixed \(K>0\), as checked
in the E01 assessment. The source connection speed, metric adjoints and
\(S_A^*\) below are all native. [Fine v2, Definition 1.4][fine-def] ·
[E01 normalization assessment][e01].

Fine's §4.2 defines \(S_A(u)=\iota_u F_A\), with adjoint using \(g_A\)
and the native internal metric, and displays the vector field
\[
 V(A)=v(A)-d_A d_A^{*g_A}a
           -S_A S_A^*(d_A^{*g_A}d_Aa).
 \tag{1}
\]
Here \(v(A)\) is the actual source gradient vector field, specified
in Proposition 4.2. The frozen test changes only the vertical
codifferential:
\[
 V_{\rm fixed}(A)=v(A)-d_A d_A^{*g_{\bar A}}a
           -S_A S_A^*(d_A^{*g_A}d_Aa).
 \tag{2}
\]
The covariant exterior derivative in each position still uses \(A\).
The operator \(d_A^{*g_{\bar A}}\) is its codifferential using the fixed
smooth base metric and the fixed internal metric. The horizontal
adjustment remains unchanged. The inspected primary text is the
29 November 2011 arXiv v2, §4.2, especially the generator preceding
Proposition 4.5 and the displayed equation in Theorem 4.10.
[Fine v2 §4.2][fine].

## Third-order symbol of the live vertical term

Use local base coordinates and an internal orthonormal trivialization.
Write \(W=\sqrt{\det g}\). The one-form codifferential is
\[
 d_A^{*g}a
 =-W^{-1}\partial_i(Wg^{ij}a_j)-g^{ij}[A_i,a_j].
 \tag{3}
\]
The connection bracket adds no derivatives. Let \(b\) vary \(A\) and
\(h=Dg_A[b]\). The metric is a smooth algebraic function of the definite
curvature, so \(h\) is first order in \(b\). This follows from the positive
plane and fixed-volume reconstruction in the frozen manuscript, with the
constant scale converted as above. [Manuscript §4, reconstructed metric
and exact metric velocity][manuscript].

In the variation of (3), the top-order part in \(b\) comes from the
coefficient derivative and is
\[
 a_j\bigl(g^{ik}g^{j\ell}\partial_i h_{k\ell}
         -\tfrac12g^{ij}\partial_i\operatorname{tr}_g h\bigr)
 \quad\text{at order two in } b .
 \tag{4}
\]
This uses \(Dg^{ij}[h]=-g^{ik}g^{j\ell}h_{k\ell}\) and
\(DW[h]/W=\operatorname{tr}_g h/2\); differentiating the product
\(Wg^{ij}\) gives both contributions. Terms in which \(\partial_i\)
lands on \(g\), \(a\) or another fixed coefficient in this linearization
are of order at most one in \(b\), as are the direct variation of \(a\)
and the bracket terms. The outer \(-d_A\) in (1) differentiates (4)
once, giving the only candidate third symbol from this term.

To evaluate it, use the real principal convention \(\partial_j\mapsto\xi_j\)
at a fixed covector \(\xi\ne0\) and let \(h_\xi(b)\) denote the first
symbol of \(Dg_A\). The curvature reconstruction is local, natural under
orientation-preserving pullback and invariant under orthogonal bundle
gauge, since the curvature plane and curvature volume have those
properties. Take a base vector field \(Y\) and its \(A\)-horizontal
lift to the principal frame bundle. For active pullback by the flow
of this lift, Cartan's formula gives the variation
\(\mathcal L_{\widetilde Y}A=\iota_Y F_A\), and naturality gives
\[
 Dg_A[\iota_Y F_A]=\mathcal L_Y g_A .
\]
With the source's inverse-action convention, both variations have
the opposite sign. To obtain the principal symbol directly, take
\(Y=\phi u\) near the point, with \(\phi(p)=0\) and \(d\phi(p)=\xi\).
Then \(\iota_Y F_A\) vanishes at \(p\) and has first jet
\(\xi\otimes\iota_uF_A\). Thus the active convention gives
\[
 h_\xi(\iota_uF_A)=\xi\otimes u^\flat+u^\flat\otimes\xi.
 \tag{5}
\]
The lift and its infinitesimal action are the ones in
[Fine v2 §3.2, Lemma 3.2 and (3.4)][fine-action].

For \(h=h_\xi(\iota_uF_A)\) the combination in the symbol of (4) is
\[
 \xi_i h^{ij}-\tfrac12 \xi^j\operatorname{tr}_g h
 =|\xi|_g^2 u^j+\xi(u)\xi^j-\xi(u)\xi^j
 =|\xi|_g^2u^j .
\]
The third-order real symbol of the linearized vertical term is therefore
\[
 \boxed{\ \sigma^{\rm real}_{3,\xi}
          D_A[-d_A d_A^{*g_A}a](\iota_u F_A)
            =-|\xi|_g^2\,\xi\otimes a(u).\ }
 \tag{6}
\]
The Fourier convention \(\partial_j\mapsto i\xi_j\) multiplies (6)
by \(i^3=-i\). This is nonzero whenever \(a(u)(p)\ne0\).
Realizing this case requires no exceptional background. On the
standard smooth round \(S^4\) take \(A\) itself to be the round chiral
connection. Choose a smooth compactly supported local form
\(\alpha\) in the adjoint bundle with \(\alpha(u)(p)\ne0\), and set
\(\bar A=A-s\alpha\) for small fixed \(s>0\). Its curvature is
\(C^0\)-close to the round curvature, so it remains definite in the
same component, while \(a=s\alpha\) has the required value. The
reference can be arbitrarily close to \(A\) in any fixed finite smooth
norm by shrinking \(s\).

Neither of the other two summands in (1) has an order-three
linearization. The physical gradient differentiates once a smooth
first-jet expression \(B_A(F_A)\), with a codifferential whose metric
is also a first-jet expression. In the horizontal adjustment the
codifferential differentiates \(d_A a\) once and the metric
coefficients at most once. The outer \(S_A S_A^*\) is algebraic in
\(F_A,g_A\) and has no differential operator outside it. Thus the
order-three coefficient (6) is a nonvanishing coefficient of the
full displayed expression at the example. At \(a=0\) it vanishes.
This derivative-order observation concerns the printed arXiv v2
formula with its live codifferential. It makes no claim about
the existence or uniqueness statement of Theorem 4.3.

## Order and reference symbol of the fixed-metric variant

The vertical term in (2) consists of a first derivative of a
first-order expression in \(A\) and \(a\) with fixed metric
coefficients. It is affine in \(\partial^2 A\). The fixed reference
metric and reference connection can contribute derivatives in
\(x\), which are fixed coefficient data. The live codifferential in
the horizontal term also gives a quasilinear expression. For an
adjoint-valued two-form \(\beta=d_A a\), it takes the form
\[
 (d_A^{*g_A}\beta)_j=-g_A^{ik}
  \bigl(\partial_i\beta_{kj}+[A_i,\beta_{kj}]
        -\Gamma^\ell{}_{ik}(g_A)\beta_{\ell j}
        -\Gamma^\ell{}_{ij}(g_A)\beta_{k\ell}\bigr).
 \tag{7}
\]
Here \(\beta\) depends on at most first derivatives of \(A\).
The derivative \(\partial\beta\) is affine in \(\partial^2 A\).
The Christoffel terms use only \(\partial g_A\), also affine in
\(\partial^2 A\), each multiplied by \(\beta\) of first order.
The formula contains no product of \(\partial\beta\) and
\(\partial g_A\). Multiplication by \(S_A S_A^*\) adds only
first-jet dependence. The same reasoning applies to the physical
term using \(\beta=B_A(F_A)\), which is first order and to which the
same formula applies. Consequently (2) is genuinely second
order and quasilinear: in smooth local frames it is affine in the
second derivatives of \(A\), with smooth coefficients in
\((x,A,\partial A)\) on the definite first-jet region.

At \(A=\bar A\), \(a=0\) identically. Linearizing
\(-d_A d_A^{*g_A}a\) gives exactly
\(-d_{\bar A}d_{\bar A}^{*g_{\bar A}}b\); every operator
variation is applied to the zero background input. The fixed
vertical term gives the same full linearization, and the other
terms are unchanged. To make the reference symbol explicit, let
\(w_{j,\xi}\) be wedge by \(\xi\) from degree \(j\) to \(j+1\).
Let \(\mathcal H_\xi=P_{\bar A}w_{1,\xi}\), where \(P_{\bar A}\)
is Fine's algebraic map in (4.5). With \(\partial\mapsto i\xi\),
the second-order reference symbol of (2) is
\[
 -\left(\mathcal H_\xi^*\mathcal H_\xi
        + S_{\bar A}S_{\bar A}^* w_{1,\xi}^*w_{1,\xi}
        + w_{0,\xi}w_{0,\xi}^*\right).
 \tag{8}
\]
This agrees with the printed Theorem 4.10 reference symbol. The
first summand is the source gradient symbol from Proposition 4.5.
[Fine v2 §4.2, Proposition 4.5, Lemma 4.9 and Theorem 4.10][fine].

For clarity, (8) is strictly negative in its quadratic form at
the reference despite the nonsymmetric horizontal summand. For
unit \(\xi\) write \(b=\xi\otimes x+c\), with
\(c\perp \xi\otimes\mathfrak{so}(E)\). Then the negative of the symbol
paired with \(b\) is
\[
 |\mathcal H_\xi(c)|^2+|S_{\bar A}^*c|^2
   +\langle S_{\bar A}S_{\bar A}^*c,\xi\otimes x\rangle+|x|^2.
\]
In the native metric \(\sum_i|F_i|^2=3\) because the \(F_i\) are
self-dual and \(dV_g=\tfrac13\sum_i F_i\wedge F_i\). The elementary
contraction inequality \(|\iota_u F_i|\le |u|\,|F_i|\) gives
\(\|S_{\bar A}\|_{\rm op}\le\sqrt3\), which bounds the cross term
below by \(-\sqrt3\,|S_{\bar A}^*c|\,|x|\). The resulting positive
part has coefficient \(1-\sqrt3/2>0\). If all positive terms
vanish, \(\mathcal H_\xi(c)=0\), \(S_{\bar A}^*c=0\) and \(x=0\).
By the source's Lemma 4.9 the first condition places \(c\) in the
sum of the horizontal and vertical symbol spaces. It is
orthogonal to both by the latter two conditions and the original
decomposition, so \(c=0\). For a fixed smooth definite reference
on a compact base the reference coercivity is uniform by compactness
of the unit cosphere. Smooth dependence of the now second-order
principal coefficients gives a uniformly parabolic symbol on a
sufficiently small \(C^1\) neighborhood of that reference.

## What remains for a flow theorem

The fixed vertical adjoint yields a legitimate section
\(-d_A^{*g_{\bar A}}a\) of the adjoint bundle as gauge generator. Together
with the unmodified horizontal lift of \(-S_A^*d_A^{*g_A}d_Aa\),
it defines the same kind of infinitesimal automorphism adjustment.
For a supplied smooth adjusted solution, the smooth time-dependent
generator can be integrated on a compact frame bundle over its
time interval, and equivariance gives the formal cancellation in the
forward direction as in Lemma 4.4. Establishing a theorem additionally
requires the adjusted initial-value problem in specified spaces, with
a verified local existence and uniqueness theorem and bounds that
keep the solution in the definite parabolic region. Uniqueness of
the unadjusted equation via reverse adjustment requires solving
\(r(h^{-1})_*\dot h=-\xi_{\rm fixed}(h(A))\), \(h(0)=\mathrm{id}\),
for the generator just described and a supplied unadjusted \(A\).
Its principal symbol and well-posedness in the chosen regularity
must be checked separately. Reference agreement of (8) concerns the
connection equation and alone does not settle that reverse equation.

At an endpoint one would also require controlled connection gauges,
uniform parabolic coefficient bounds in the relevant norms, and
sufficient limiting regularity to supply restart data for both the
adjusted connection and the automorphisms. A scale or eigenvalue bound
by itself supplies neither a suitable first-jet neighborhood nor these
higher regularity controls. These are separate dependencies. This
packet verifies derivative order and reference symbol for (1)–(2);
it does not prove a replacement flow theorem or compare later published
versions of the source. [Fine v2 §4.2, Lemma 4.4 and (4.3)–(4.4)][fine].

[request]: ../research-progress/handoffs/SP4-CME-E27_REQUEST_v1.md
[return]: ../research-progress/handoffs/SP4-CME-E27_RETURN_v1.md
[decision]: ../brainstorm/notes/B23_FIXED_ADJOINT_GAUGE_TEST_20261122.md
[manuscript]: ../manuscript/chiral_curvature_and_metric_evolution.tex
[e01]: ../reviews/E01_FOUNDATION_ASSESSMENT_20261122.md#normalization-correction-to-integrate
[fine]: https://arxiv.org/html/1111.5005v2#S4.SS2
[fine-def]: https://arxiv.org/html/1111.5005v2#S1.SS3
[fine-action]: https://arxiv.org/html/1111.5005v2#S3.SS2
