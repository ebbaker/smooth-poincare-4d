# SP4-CME-E102 — Intrinsic strain pinches the defect in the round value tube

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. The helper launch was configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and selected
lead settings were unavailable. I authored E88 and did not author
E66 or E89. The three frozen input digests matched the [request][req].
This is the first bounded test in [B58][b58]. No new primary source
was inspected or imported. [Return][ret].

## Statement and reference bundle

On the compact closed oriented round Riemannian \(S^4\), fix
the positive perfect chiral \(SO(3)\) connection \(A_0\), its
native metric \(g_0\), and the internal positive metric from
the negative Killing form. Let \(E\) be the adjoint bundle and
\(\mathcal V=\operatorname{Sym}_0(E)\) the rank-five real
bundle of trace-free self-adjoint endomorphisms. Use the
Hilbert–Schmidt pairing on \(\mathcal V\). Write \(D_0\) for the
connection induced by \(A_0\), including the fixed Levi-Civita
derivative when there are additional base slots. With
\(\mu_0=dV_{g_0}\), use the E88 Lorentz convention
\[
 \|w\|_{4,1;0}
    =4\int_0^\infty \mu_0(\{|w|_0>v\})^{1/4}\,dv .
\]
The fixed \(W^{1,(4,1)}\) norm of a section is the sum
of its fixed \(L^{4,1}\) norm and that of \(D_0\) applied to it.

For an actual smooth \(A=A_0+a\), put \(\beta=F_A-F_0\)
and \(q=Q(A)-I\in\Gamma(\mathcal V)\). There exist
fixed reference constants \(\rho,C>0\) such that
\[
 \|a\|_{C^0;0}+\|\beta\|_{C^0;0}\le\rho
 \quad\Longrightarrow\quad
 \|q\|_{W^{1,(4,1)};0}+\|q\|_{C^0}
       \le C\|T(A)\|_{L^{4,1}(g_A)} .                                \tag{1}
\]
Here \(g_A\) denotes the live native reconstructed metric.
The radius is inside the definite component containing \(A_0\).
Neither slice equation is imposed. The constants use fixed
reference data and the chosen tube radius, independent of
derivatives of \(a\) and \(\beta\).

## Curvature representation and the ordinary covariant inverse

Set \(K_{\mathcal V}=D_0^*D_0\) on sections of \(\mathcal V\).
On endomorphisms the curvature identity for the induced
connection reads
\[
 ([D_{0,X},D_{0,Y}]-D_{0,[X,Y]})q
       =[\operatorname{ad}(F_0(X,Y)),q] .
\]
A weak \(H^1\) kernel section has \(D_0q=0\) by testing the weak
equation against itself. It is smooth, since the local parallel
equation \(\partial_jq=-\gamma_jq\) with smooth coefficients
can be differentiated in distributions to gain each successive
Sobolev derivative. At each point the values \(F_0(X,Y)\)
span the adjoint fiber, by the perfect curvature isometry
from \(E\) onto \(\Lambda^+\). The operators
\(\operatorname{ad}(F_0(X,Y))\) thus span
\(\mathfrak{so}(E_x)\): the adjoint representation of
\(\mathfrak{so}(3)\) is faithful and both dimensions are three.
A parallel \(q_x\) commutes with all those skew endomorphisms.
For a unit eigenvector \(v\) of \(q_x\), all skew images of
\(v\) lie in its eigenspace and span \(v^\perp\).
Thus the eigenspace is all of \(E_x\), so \(q_x\) is scalar.
Trace-freeness gives \(q_x=0\). This proves the triviality
of \(\ker K_{\mathcal V}\) for this representation.

On this compact base, the form \(\|D_0 q\|_2^2\) is coercive
on \(H^1(\mathcal V)\). If it were not, an \(H^1\)-normalized
sequence with \(D_0q\to0\) would have a weak \(H^1\) and strong
\(L^2\) subsequential limit in the kernel. Since the limit is
zero, both the \(L^2\) and derivative norms would tend to zero.
Therefore the weak inverse
\[
 L_{\mathcal V}=K_{\mathcal V}^{-1}D_0^*,\qquad
 K_{\mathcal V}L_{\mathcal V}w=D_0^*w,\qquad
 \|L_{\mathcal V}w\|_{H^1}\le C\|w\|_2                               \tag{2}
\]
is defined on arbitrary \(L^2\) \(\mathcal V\)-valued one-forms.
The equation holds in \(H^{-1}\) against all \(H^1\) tests.
The principal symbol is \(|\xi|_{g_0}^2 I_{\mathcal V}\)
in the \(i\xi\) convention. This is an ordinary connection
Laplacian, separate from E88's projected operator.

Here is the corresponding strong divergence estimate.
In a fixed orthonormal \(\mathcal V\) frame write
\(D_0=\partial+\gamma\), where the connection matrix
is the induced commutator action on \(\mathcal V\),
and \(\mu_0=\mu\,dx\). In the notation of the E89
cutoff computation the weak form now has blocks
\[
 A^{ij}=\mu g_0^{ij}I_{\mathcal V},\qquad
 B^i=A^{ij}\gamma_j,\qquad C^j=\gamma_i^*A^{ij},\qquad
 D=\gamma_i^*A^{ij}\gamma_j .
\]
In particular the coefficient in the differentiated
term is the ordinary identity in the five-dimensional
fiber, and the lower blocks use this rank-five connection.
Put \(M^i=B^i-C^i\), \(D_1=D-\partial_j C^j\). For
\(P=\mu K_{\mathcal V}\) and \(u=L_{\mathcal V}w\),
\[
 Pu=-\partial_i(A^{ij}\partial_j u+M^i u)+D_1u
       =-\partial_iF^i+G,\quad
 F^i=\mu g_0^{ij}w_j,\quad G=\gamma_i^*F^i .
\]
The value forcing has no smooth kernel correction.
If \(v=\chi u\) is supported in the chart interior,
then the localized flux and value are
\[
 \begin{split}
 F_\chi^i&=\chi F^i+A^{ij}(\partial_j\chi)u
                     +(\partial_j\chi)A^{ji}u,\\
 G_\chi&=\chi G+(\partial_i\chi)F^i
       +\partial_j((\partial_i\chi)A^{ij})u
       -(\partial_i\chi)M^iu .
 \end{split}
\]
Thus \(Pv=-\partial_iF_\chi^i+G_\chi\). Here the
cutoff term containing \(\partial_j u\) has been
moved into divergence form, so both new forcing
norms cost only \(C(\|w\|_8+\|u\|_8)\).
[E88, local form and cutoff argument][e88].
[E89, local coefficient and cutoff formulas][e89].

Freeze \(A_*^{ij}=A^{ij}(x_*)\) and let
\(P_*=-A_*^{ij}\partial_i\partial_j\). The identity
\[
 (I+P_*)v=-\partial_i\big(F_\chi^i+
                  (A_*^{ij}-A^{ij})\partial_jv-M^iv\big)
                         +G_\chi+(I-D_1)v
\]
has gradient multipliers for flux and value given by
\(\xi_i\xi_j(I+A_*(\xi))^{-1}\) and
\(i\xi_i(I+A_*(\xi))^{-1}\), respectively, where
\(A_*(\xi)=\mu(x_*)|\xi|_{g_0(x_*)}^2 I_{\mathcal V}\).
For the flux symbol the rescaled annular denominator is
\(2^{-2\ell}I+A_*(\xi)\), which is uniformly elliptic on
the fixed annulus. Differentiating its inverse gives
uniform annular derivative bounds as in E88.
Rescaling the block kernels and summing gives the
off-origin \(|x|^{-4}\) and \(|x|^{-5}\) kernel and
first derivative bounds. The Fourier \(L^2\) bound
holds for the symbol and its adjoint. The checked E89
zero-mean cube argument and integration of the weak
\((1,1)\) and strong \((2,2)\) distribution bounds then
give \(L^{8/7}\) for the adjoint and \(L^8\) for the flux
multiplier by duality. The value symbol has a smooth
low block and high annuli with \(L^1\) kernel norms
\(O(2^{-\ell})\), hence it is \(L^8\)-bounded by Young's
inequality. These bounds are uniform on the initial
finite reference atlas. [E88, (4)–(5) and kernel proof][e88].
[E89, strong multipliers][e89].

Absorb the leading coefficient variation in the flux
on sufficiently small fixed patches and sum the partition.
All other terms then give
\(\|D_0u\|_8\le C(\|w\|_8+\|u\|_8)\).
As in the E89 mollifier step, the patch value is bounded
by \(Ch\|\partial v\|_8+C h^{-3/2}\|v\|_2\), from
translations and the \(L^{8/5}\) norm of a mollifier at
scale \(h\). The cutoffs add \(Ch\|u\|_8\) on summing,
which is absorbed for small \(h\). Choose \(h\) still
smaller to absorb the derivative term by the preceding
estimate. Then (2) and finite volume give
\[
                     \|L_{\mathcal V}w\|_{W^{1,8}}
                            \le C\|w\|_8.                           \tag{3}
\]
For smooth \(w\) the weak solution needed in this argument
is smooth. In the displayed local weak form, take the
test \(-\delta_{-h}(\chi^2\delta_h u)\) for a coordinate
difference quotient \(\delta_h\) and an interior cutoff.
The translated leading coefficient is uniformly positive.
Coefficient quotients and cutoff derivatives are controlled
by the known \(H^1\) norm times
\(C(\|\chi\delta_hu\|_{H^1}+\|u\|_{H^1})\).
The \(L^2\) forcing \(D_0^*w\) uses the same second factor
to bound the test. Young's inequality gives a uniform
\(H^1\) bound on \(\chi\delta_hu\) and hence interior \(H^2\).
Differentiating the local equation and iterating gives
all orders for smooth \(w\). For general \(L^8\) inputs,
smooth approximation converges in \(L^2\) by finite volume.
The \(W^{1,8}\) limit from (3) and the \(H^1\) limit from
(2) are the same section. Thus both endpoints are bounds
for the same weak inverse. [E88, common endpoints][e88].
[E89, low norm and weak identification][e89].

For arbitrary vector layers \(w_v=(w/|w|)1_{\{|w|>v\}}\),
the \(L^2,L^8\) input norms are
\(\mu_w(v)^{1/2},\mu_w(v)^{1/8}\).
The estimate
\(\|z\|_{4,1}\le12\|z\|_2^{1/3}\|z\|_8^{2/3}\)
gives for \(L_{\mathcal V}w_v\) and its first derivative
the bound \(C\mu_w(v)^{1/4}\).
The E88/E89 layer argument applies to these arbitrary
layers: endpoint continuity at almost all thresholds
gives strong measurability, and finite volume gives
\(\int w_v\,dv=w\) in \(L^2\). Completeness and the common
\(L^2\) action identify the integrals in the Lorentz norm
with the weak inverse and its derivative. Hence
\(\|L_{\mathcal V}w\|_{W^{1,(4,1)};0}\le C_L\|w\|_{4,1;0}\).
For a section \(q\), use \(q=L_{\mathcal V}D_0q\)
by the kernel-free weak equation. The E88 continuous
endpoint also applies in the fixed rank-five frames:
the ray kernel \(|x-y|^{-3}\) has bounded integral
\(C m^{1/4}\) on each set of measure \(m\), and
layer integration and the fixed cutoff derivative
bounds give
\[
 \|q\|_{W^{1,(4,1)};0}\le C_L\|D_0q\|_{4,1;0},\qquad
 \|q\|_{C^0}\le C_{\rm emb}\|q\|_{W^{1,(4,1)};0}.
                                                                            \tag{4}
\]
The continuous representative for weak sections follows
by the same \(W^{1,(4,1)}\) density and uniform limit
argument, since all frame coefficients are fixed.
[E88, layer estimate and ray endpoint][e88].
[E89, layer and endpoint audit][e89].

## Intrinsic strain, comparison and absorption

Write \(S=Q^{1/2}\) and \(N_X=\nabla_X^A Q\).
The strain in a base direction \(X\) is
\(T_X=\frac12(S^{-1}N_XS^{-1})_0\).
Since \(\operatorname{tr}Q=3\) and \(N_X\) is trace-free,
solving for the scalar term gives
\[
 N_X=\mathcal N(T_X),\qquad
 \mathcal N(t)=2StS-\tfrac23\operatorname{tr}(Qt)Q .
\]
This operator is self-adjoint on trace-free symmetric
endomorphisms. Half its quadratic form in a \(Q\)-eigenframe
is
\[
 \sum_{i\ne j}\sqrt{\lambda_i\lambda_j}\,t_{ij}^2
 +\sum_i\lambda_i t_{ii}^2
 -\tfrac13\Big(\sum_i\lambda_i t_{ii}\Big)^2 .
\]
The last two terms are a nonnegative weighted variance,
bounded by \(\lambda_{\max}\sum_i t_{ii}^2\).
The off-diagonal sum satisfies the same bound on its
slots. Thus \(0\le\mathcal N\le 2\lambda_{\max}(Q)I\)
and \(|N_X|\le6|T_X|\).
Summing in a base orthonormal frame gives the corresponding
one-form bound. [E66, strain inversion and (15)][e66].

Fix a geometric value radius \(\rho_{\rm geom}\) so that
the E66 comparisons
\(\frac12 g_0\le g_A\le\frac32g_0\) and
\(\frac12\mu_0\le dV_{g_A}\le\frac32\mu_0\) hold.
The first follows by smooth reconstruction from the
nearby positive curvature plane and its volume, and the
second follows from the wedge volume
\(\mu_A=\frac13\sum_i F_i\wedge F_i\) by expanding
\(F=F_0+\beta\). Both use only \(\|\beta\|_\infty\).
For a one-form-valued endomorphism \(W\), the covector
bound and density comparison are
\[
 |W|_0\le\sqrt{3/2}\,|W|_{g_A},\qquad
 \mu_0(\{|W|_0>v\})
    \le2\,dV_{g_A}(\{|W|_{g_A}>v/\sqrt{3/2}\}) .
\]
It follows from the layer formula that
\(\|N\|_{4,1;0}\le6 C_{\rm cmp}\|T(A)\|_{4,1;g_A}\)
with \(C_{\rm cmp}=2^{1/4}\sqrt{3/2}\).
[E66 (13)–(15)][e66].

On the endomorphism-valued zero-form \(q\), changing the
internal connection gives the exact identity
\[
 D_0q=\nabla^A Q-[\operatorname{ad}(a),q].
\]
There is no base Levi-Civita correction on \(q\) itself.
The commutator is trace-free symmetric because the first
entry is skew-adjoint and the second self-adjoint.
Its fixed one-form norm is bounded by \(C_{\rm ad}|a|_0|q|\).
Writing \(\ell=\|T(A)\|_{4,1;g_A}\), we therefore have
\[
 \|D_0q\|_{4,1;0}
       \le6 C_{\rm cmp}\ell
            +C_{\rm ad}\|a\|_\infty\|q\|_{4,1;0}.
\]
First fix the geometric radius and all reference inverse
and embedding constants in (4). Then take
\(\rho\le\rho_{\rm geom}\) with
\(C_L C_{\rm ad}\rho\le1/2\).
Apply (4) and absorb the last term using
\(\|q\|_{4,1;0}\le\|q\|_{W^{1,(4,1)};0}\).
This gives the \(W^{1,(4,1)}\) bound
\(12 C_L C_{\rm cmp}\ell\), and then the sup bound in
(1) by the continuous embedding. These are reference
and value estimates. [E66 (17)][e66].

## Pointwise conclusion and invariance

Since the operator norm is bounded by the fixed
Hilbert–Schmidt norm, at every point
\[
        (1-C\ell)I\le Q(A)\le(1+C\ell)I .
\]
For any prescribed \(0<\delta<1\), the condition
\(\ell\le \delta/C\) gives the eigenvalue interval
\([1-\delta,1+\delta]\) uniformly. For \(\ell=0\) the
same estimate gives \(Q(A)=I\), so the connection
is perfect in the stated component.

An internal gauge acts by orthogonal conjugation on
\(q\) and \(T\), and keeps the reconstructed metric
and volume. The strain norm, pointwise eigenvalues and
\(C^0\) defect norm are invariant. The \(L^{4,1}\)
value norm of \(q\) with the fixed reference volume
is also invariant for internal gauges. For an internal
isometry \(U\) acting by \(q'=UqU^{-1}\), the fixed
derivative satisfies
\[
 D_0q'=U(D_0q)U^{-1}+[(D_0U)U^{-1},q'].
\]
The derivative of the gauge prevents the same invariance
for the fixed derivative norm.

For a supplied fixed smooth orientation-preserving bundle
pullback covering \(f\), the defect at \(x\) is the
internal conjugate of \(q(f(x))\). The live metric and
volume pull back by \(f\), and the one-form strain
pulls back on its base slot and by internal conjugation.
Its scalar norm composes with \(f\), so its Lorentz
distribution with the live volume is unchanged.
Consequently the same pointwise eigenvalue bound transfers
to the pullback of the supplied value-tube representative.
The fixed derivative estimate in (1) pertains to that
reference and input tube. It does not supply a derivative
bound uniform under arbitrary base pullbacks with a
reference kept fixed.

This static estimate supplies no full critical-pair bound,
finite slice placement, temporal strain budget, persistence
of pinching, or initialization on arbitrary homotopy spheres.

[req]: ../research-progress/handoffs/SP4-CME-E102_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E102_RETURN_v1.md
[b58]: ../brainstorm/notes/B58_DEFECT_PINCHING_AND_VERTICAL_RESIDUAL_20261122.md
[e66]: 66_FIXED_SLICE_STRAIN_ESTIMATE_20261122.md
[e88]: 88_LORENTZ_ORBIT_SOLVER_20261122.md
[e89]: ../reviews/E89_LORENTZ_ORBIT_AUDIT_20261122.md
