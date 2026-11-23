# SP4-CME-E26 Fine's gauge symbol and the continuous endpoint gap

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and selected
lead settings were unavailable. This is the bounded
[E26 source and operator check](../research-progress/handoffs/SP4-CME-E26_REQUEST_v1.md)
under the [B22 decision](../brainstorm/notes/B22_GAUGE_CONTINUATION_DEPENDENCY_20261122.md).
The [return](../research-progress/handoffs/SP4-CME-E26_RETURN_v1.md)
records input versions.

The connection symbol linearized at the smooth reference is negative
definite, and E24 controls the curvature data needed for a uniform
bound on those pointwise reference symbols. With the adjoints evaluated
in the current reconstructed metric, a third-order term of the full
adjusted equation survives away from the reference. In addition,
E24's continuous endpoint data fall short of the smooth initial-data
setting of Fine's short-time statement.

## Native conventions and the two gauges

In this section write \(g_A^{\rm F}\) for Fine's reconstructed
metric, \(dV_{g_A^{\rm F}}=\mu_{\rm F}\), with the printed internal
negative Killing norm. Use ordinary Riemannian form pairings and
the internal Frobenius pairing. Work on the oriented real
four-dimensional positive curvature-plane domain with a fixed
oriented Euclidean rank-three bundle, restricting to a smooth closed
base for the short-time and endpoint comparison. In Fine's
notation \(Q=(F_i\wedge F_j)/\mu_{\rm F}\) in an internal
orthonormal frame, \(\operatorname{tr}Q=3\), and
\(B_A=4Q-\tfrac23\operatorname{tr}(Q^2)I\).
The unadjusted equation in his native time is
\(A_{t_{\rm F}}=-d_A^{*g_A^{\rm F}}(B_AF_A)\).
[Fine v2, Definitions 1.3–1.4 and Proposition 4.2](https://arxiv.org/html/1111.5005v2).

Let \(\bar A\) be a fixed smooth definite reference and
\(a=A-\bar A\). Denote Fine's curvature contraction by
\(\mathsf S_A(u)=\iota_uF_A\), distinct from the manuscript's
square root \(S=Q^{1/2}\).
The bundle automorphism group \(\mathcal G\) includes base
diffeomorphisms that lift to bundle isometries. In the splitting
given by the \(A\)-horizontal lift \(\chi_A\), its infinitesimal
action, with Fine's sign, is
\[
 R(\phi+\chi_A(u),A)=-d_A\phi-\mathsf S_A(u).
\]
The first term covers the identity on the base and the second
comes from the base vector field. The choice in Section 4.2 is
\[
 \xi(A)=-d_A^*a-\chi_A\!\left(\mathsf S_A^*d_A^*d_Aa\right).
\]
The adjusted right side \(v(A)-R(\xi(A),A)\) is therefore
\[
 -d_A^*(B_AF_A)-d_A d_A^*a
                 -\mathsf S_A\mathsf S_A^*d_A^*d_Aa.
 \tag{1}
\]
The source uses \(g_A^{\rm F}\) for the adjoint pairings of
the unadjusted flow and specifies that metric for \(\mathsf S_A^*\).
It displays \(d_A^*\) in (1) without a separately frozen
base metric for the vertical term. The derivative-order
check below evaluates (1) with the current metric.
[Fine v2, Section 3.2, Lemma 3.2 and equation (3.4), and Section 4.2, equation (4.2) and Theorem 4.10](https://arxiv.org/html/1111.5005v2).

## Exact sequence and negative reference symbol

For the unadjusted principal term let \(L_A\) denote the
symmetrized wedge quotient \(L_A(U)_{ij}
=(U_i\wedge F_j+U_j\wedge F_i)/(2\mu_{\rm F})\).
Write \(D_Q(H)=H-\operatorname{tr}(H)Q/3\), from symmetric
matrices to trace-free symmetric matrices. With the stated
pairing its adjoint is \(D_Q^*(V)=V-\operatorname{tr}(QV)I/3\)
on trace-free \(V\). In a variation \(b\), one has
\[
 \delta Q=2D_Q L_A(d_A b),\qquad
 \delta B_A=4D_Q^*\delta Q
             =8D_Q^*D_Q L_A(d_A b).
 \tag{2}
\]
Bianchi expresses the physical velocity in terms of \(d_AB_A\),
\(F_A\), and the Hodge star. At the principal level, only
the derivative of \(B_A\) contributes a second derivative of
the variation. Thus the leading operator is
\(-d_A^*\widetilde P_A^*\widetilde P_A d_A\), where
\(\widetilde P_A=\sqrt8\,D_Q L_A\). This reproduces the
positive factor in Proposition 4.5 directly. For comparison,
on \(Q^\perp\) the squared norm of \(D_Q(H)\) is
\(|H|^2+|Q|^2(\operatorname{tr}H)^2/9\), and \(D_Q(Q)=0\).
This is the factorization through
\(\Pi_A\Theta_A\Pi_A\) in (4.7), with
\(\Theta_A(H)=8H+\tfrac89|Q|^2\operatorname{tr}(H)I\).
The orthogonal projection \(\Pi_A\) uses denominator
\(|Q|^2=\operatorname{tr}(Q^2)\). This computation fixes the
normalization directly from (3.2) and Proposition 4.2,
including the identity factors in the scalar terms, rather than
depending on the printed scalar shorthand around (4.7).
[Fine v2, Section 3.1, equation (3.2), and Proposition 4.5, equations (4.5)–(4.7)](https://arxiv.org/html/1111.5005v2).

At a definite point, let \(w_\zeta^0:E\to\Lambda^1\otimes E\)
and \(w_\zeta^1:\Lambda^1\otimes E\to\Lambda^2\otimes E\)
be exterior multiplication by a nonzero real covector \(\zeta\).
Let \(H_\zeta=\widetilde P_A w_\zeta^1\). The exact sequence
underlying Lemmas 3.5 and 4.9 is
\[
 0\longrightarrow TX\oplus E
 \xrightarrow{\ \mathsf S_A+w_\zeta^0\ }\Lambda^1\otimes E
 \xrightarrow{\ H_\zeta\ }\operatorname{Sym}^2_0E
 \longrightarrow0 .
 \tag{3}
\]
Here \(\zeta\wedge(\zeta\otimes\phi)=0\).
For the horizontal part, the symmetrized wedge contraction is
a multiple of \(Q\), killed by \(D_Q\). More explicitly,
\(\zeta\wedge\iota_u(F_i\wedge F_j)=\zeta(u)F_i\wedge F_j\)
gives \(L_A(w_\zeta^1\mathsf S_Au)=\zeta(u)Q/2\) with
the denominator \(2\mu_{\rm F}\) of (3.1). The span conclusion
is what is needed from Corollary 4.7.
Contraction with a nonzero \(u\) embeds the self-dual forms
as \(u^\perp\), as is seen by extending \(u/|u|\) to an
orthonormal basis. Since the \(F_i\) are independent, the
\(\iota_uF_i\) cannot all be proportional to \(\zeta\).
This proves injectivity of the first arrow. Exterior
multiplication by \(\zeta\) followed by self-dual projection
is onto \(\Lambda^+\) on the form slots. In the basis \(F_i\),
\(L_A\) on the resulting self-dual forms is represented by
\(U\mapsto(UQ+QU^T)/2\), onto symmetric matrices because
\(Q\) is invertible. Since \(D_Q\) is onto the trace-free
space, the second arrow is onto. Dimensions \(7,12,5\)
then give exactness.
[Fine v2, Section 3.3, Lemmas 3.3 and 3.5, and Lemmas 4.6 and 4.9](https://arxiv.org/html/1111.5005v2).

At \(a=0\), coefficients of the two gauge terms in (1)
are evaluated at \(\bar A\) in the second-order linearization.
For example the derivative of the adjoint applied to \(a=0\)
vanishes. The Fourier symbol in direction \(\zeta\), with all
coefficients below at \(\bar A\), is
\[
 \sigma(\zeta)=-\left(
 H_\zeta^*H_\zeta+
 \mathsf S_A\mathsf S_A^*(w_\zeta^1)^*w_\zeta^1+
 w_\zeta^0(w_\zeta^0)^*
 \right).
 \tag{4}
\]
The horizontal term need not be self-adjoint. For unit
\(\zeta\), write \(b=\zeta\otimes x+c\) with
\((w_\zeta^0)^*c=0\). Then \((w_\zeta^1)^*w_\zeta^1 b=c\),
and the negative quadratic form of (4) is
\[
 |H_\zeta c|^2+|\mathsf S_A^*c|^2+|x|^2+
    \langle\mathsf S_A\mathsf S_A^*c,\zeta\otimes x\rangle .
\]
With ordinary two-form norm,
\(|\iota_uF_i|^2=|u|^2|F_i|^2/2\) for self-dual \(F_i\).
Indeed, for unit \(u\), the components with and without
the \(u^\flat\) slot have equal squared norms. Since
\(\sum_i|F_i|^2=\operatorname{tr}Q=3\),
\(\|\mathsf S_A\|_{\rm op}=\sqrt{3/2}\).
Fine's proof of Theorem 4.10 uses \(\sqrt3\), which is a
sufficient upper bound in this calculation. The absolute
value of the cross term is at most
\(\sqrt3|\mathsf S_A^*c||x|\), so the negative quadratic
form is bounded below by
\[
 |H_\zeta c|^2+
    (1-\sqrt3/2)(|\mathsf S_A^*c|^2+|x|^2).
\]
Equality forces \(x=0\) and \(c\) in the kernel of \(H_\zeta\)
orthogonal to both gauge images in
\(\Lambda^1\otimes E\) in (3). Hence \(b=0\).
This checks the negative reference symbol in the stated
metric and bracket conventions. [Fine v2, Theorem 4.10, proof](https://arxiv.org/html/1111.5005v2).

For a fixed smooth background metric, consider curvature
data with uniformly bounded norm in that metric and wedge
Gram matrix \((F_i\wedge F_j)/dV_{\rm bg}\) uniformly
bounded below by \(cI\), \(c>0\). On a compact base these
can be taken in a compact subset of the applicable definite
component of the finite-dimensional curvature fibers. The
reconstruction and the normalized symbol are continuous on
this set. Taking the minimum of the positive quadratic
estimate on its unit covectors and unit amplitudes gives a
uniform positive reference-symbol constant in fixed norms.
E24 gives this compactness of the curvature values by its
uniform curvature convergence and quantitative wedge floor.
This argument controls algebraic values of coefficients.
Spatial and temporal coefficient regularity requires separate data.

## Spatial derivative order away from the reference

The unadjusted term is of order at most two. In four
dimensions \(d_A^*=-*d_A*\) on two-forms. Since \(B_AF_A\)
is self-dual and \(d_AF_A=0\), the velocity is
\(+*[(d_AB_A)\wedge F_A]\) in the ordinary Hodge convention.
Here \(F_A\), \(g_A^{\rm F}\), and \(B_A\) are algebraic in
the first spatial jet of \(A\), and \(d_AB_A\) adds one
derivative. The last term in (1) is also at most second
order. \(d_Aa\) contains first derivatives, \(d_A^*\) there
differentiates it and the metric at most once, and the outside
\(\mathsf S_A\mathsf S_A^*\) is a pointwise multiplier.

For the vertical term write \(g=g_A^{\rm F}\),
\(\rho=\sqrt{\det g}\), and \(M^{ij}=\rho g^{ij}\)
in fixed local coordinates. The current-metric codifferential
of an adjoint-valued one-form is
\[
 d_A^{*g}a=-\rho^{-1}
   \big(\partial_i(M^{ij}a_j)+[A_i,M^{ij}a_j]\big),
\]
where the bracket in the second term denotes the action of
the connection on the one-form's internal component.
It follows that \(-d_A d_A^{*g}a\) contains
\(\rho^{-1}a_j\partial_\ell\partial_i M^{ij}\) in component
\(\ell\). Since \(M\) is an algebraic function of \(F_A\),
the third-order part of its linearization in direction \(b\)
can be isolated by replacing each spatial derivative by the
real covector \(\zeta\). This part is
\[
 b\ \longmapsto\
 \rho^{-1}\zeta_\ell\zeta_i
                D_F M^{ij}[\zeta\wedge b]\,a_j .
 \tag{5}
\]
To test it, at a fixed definite point use \(b=\iota_uF\).
Then \(\zeta\wedge b\) is the infinitesimal pullback of \(F\)
by the linear map \(I+s\,u\otimes\zeta\). The algebraic
metric and volume reconstruction is natural under that
orientation-preserving pullback. Thus
\[
 \delta g=\zeta\otimes u^\flat+u^\flat\otimes\zeta,\quad
 \rho^{-1}\delta M^{ij}=\zeta(u)g^{ij}-\zeta^iu^j-u^i\zeta^j,
 \quad
 \rho^{-1}\zeta_i\delta M^{ij}=-|\zeta|_g^2u^j.
\]
Substitution in (5) gives
\(-|\zeta|_g^2\zeta_\ell a(u)\) in the real-symbol
convention. This is nonzero at a point where \(a\ne0\)
by choosing \(u\) with \(a(u)\ne0\). The other two terms of
(1) have order at most two and hence cannot cancel it.
This third symbol has output in the vertical gauge
direction. It vanishes at \(a=0\), explaining why (4)
is a correct second-order reference calculation. Its
coefficient can be small with \(a\), but a neighborhood
of the reference with live adjoint still contains connections
with a genuine third-order term. The second-order reference
bound alone therefore does not establish the claimed nonlinear
second-order parabolic neighborhood for that literal reading
of (1). This identifies the derivative-order issue in the
displayed gauge. An alternative interpretation of the adjoint
or a separate gauge argument requires its own verification.
[Fine v2, Section 4.2, equation (4.2) and Theorem 4.10](https://arxiv.org/html/1111.5005v2).

## Scope of Fine's local statements and the E24 endpoint

Theorem 4.3 states that a definite initial connection \(A_0\)
gives a short-time definite solution of (4.1), unique for as
long as it exists with that initial data. Its proof works with
smooth connections and uses the asserted local parabolic
neighborhood of the adjusted problem. It solves (4.3) with
identity initial bundle automorphism to obtain the unadjusted
solution, and uses (4.8), the reverse gauge equation with
identity initial value, for uniqueness.
The two gauge paths act on the frame bundle and can project
to base diffeomorphisms. At the identity and \(a=0\), the
vertical part of the reverse gauge linearization is
\(-d_{\bar A}^*d_{\bar A}\phi\). The apparent third derivative
of \(\phi\) in its horizontal equation reduces by
\(d_{\bar A}^2\phi=[F_{\bar A},\phi]\), hence is first order.
At the level of the full reverse equation for \(h\), the identity
\[
 d_{\hat A}a=F_{\hat A}-F_{\bar A}+\tfrac12[a\wedge a],
 \qquad \hat A=h(A),\quad a=\hat A-\bar A
\]
also removes the apparent extra derivative: \(F_{\hat A}\)
and \(g_{\hat A}^{\rm F}\) are transformed tensors depending
on at most the first jet of \(h\), and the final adjoint
differentiates them once. This observation concerns the
reverse gauge equation, distinct from the forward
connection equation (1).

Taking the symbol directly from the displayed reverse
linearization gives horizontal block
\(-\mathsf S_{\bar A}^*(w_\zeta^1)^*w_\zeta^1\mathsf S_{\bar A}\).
The transverse projection is present in that block. Its
quadratic form is \(-|w_\zeta^1\mathsf S_{\bar A}u|^2\),
strictly negative on nonzero \(u\) by injectivity in (3).
Together with the vertical block \(-|\zeta|^2 I\), this
verifies the reference negativity needed in that part of
the source argument. The conclusion follows from the
quadratic form with the projection retained, without
replacing it by \(-|\zeta|^2\mathsf S_{\bar A}^*\mathsf S_{\bar A}\).
[Fine v2, Theorem 4.3, Lemma 4.4 and equations (4.3), (4.4), (4.8)](https://arxiv.org/html/1111.5005v2).

Theorem 4.11 has additional premises. It starts at a
definite connection on a compact four-manifold sufficiently
close to a given perfect connection in \(L_k^2\), integer
\(k\ge3\), with a fixed background Sobolev metric.
It states all-time existence and convergence after bundle
automorphisms at rate \(o(e^{-\alpha t_{\rm F}})\) in that
norm for some \(\alpha>0\). Its proof uses a different
adjusted equation (4.9). This packet records that statement
and its initial norm, with (1) the only forward adjusted
operator audited here.
[Fine v2, Section 4.3, Theorems 4.11 and 4.13, equation (4.9)](https://arxiv.org/html/1111.5005v2).

All the gauge symbols above use Fine's native normalization.
The E01 comparison gives \(\mu_{\rm F}=2\mu\),
\(g_A^{\rm F}=2K\widehat g_A\), and \(t_{\rm F}=2Kt\)
for corresponding unadjusted trajectories in the
manuscript clock. This conversion of the unadjusted flow
does not identify new gauge-term coefficients in the
manuscript adjoint convention.
[E01 lead normalization assessment](../reviews/E01_FOUNDATION_ASSESSMENT_20261122.md).

E24 supplies \(C^0\) limits of connection coefficients and
curvature in a fixed comparison on the original bundle, and
geometric definiteness of the limiting curvature. The
distributional identity
\[
 F_\star=F_{\rm ref}+d_{A_{\rm ref}}(A_\star-A_{\rm ref})
                  +\tfrac12[(A_\star-A_{\rm ref})\wedge
                                      (A_\star-A_{\rm ref})]
\]
determines the exterior derivative in that expression. It gives
no full first spatial jet of \(A_\star\), Hölder control of
the curvature or derivative bounds for the gauge path and its
base diffeomorphism. Even though the algebraic reference symbol
has a uniform gap on the E24 curvature range, regularity
in a restart class remains unproved. The missing implication
is from these fixed-comparison endpoint bounds to an admissible
initial trace in a verified smooth restart argument, with
compatible control of the needed bundle and base identifications.
Neither the smooth-data setting of Theorem 4.3 nor the perfect
reference and strong Sobolev premises of Theorem 4.11 have been
obtained at that endpoint. This packet establishes no smooth
continuation theorem.
[E24 finite-time limit calculation](24_TEMPORAL_BOOTSTRAP_20261122.md).

Primary source inspected: Joel Fine, *A gauge theoretic approach to
the anti-self-dual Einstein equations*, arXiv:1111.5005v2
(29 November 2011). Inspected the stated sections in full-text
HTML and checked the relevant printed displays against the
same version in PDF. [Fine v2 PDF](https://arxiv.org/pdf/1111.5005v2).
