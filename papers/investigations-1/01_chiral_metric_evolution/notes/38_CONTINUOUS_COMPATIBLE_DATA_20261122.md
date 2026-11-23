# SP4-CME-E38 — Smooth density in the continuous curvature graph

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and selected
lead settings were unavailable. This is the fixed exterior-derivative
smoothing argument selected in [B31][b31]. The [request][req] and
[return][ret] record the consumed versions. The setting includes the
continuous endpoint pair in E24 and uses no evolution premise from
E36. [E24][e24] · [E36][e36].

## Statement and local exterior derivative

Let \(M\) be a smooth closed oriented real four-manifold, with a fixed
smooth background Riemannian metric, and let \(P\) be a smooth
\(\mathrm{SO}(3)\) bundle. Write \(E=\operatorname{ad}P\) and use a
fixed smooth invariant internal metric and the ordinary two-form
norm. Let \(A_{\rm ref}\) be a smooth connection with curvature
\(F_{\rm ref}\). For a continuous global \(E\)-valued one-form \(a\),
write \(A=A_{\rm ref}+a\). Assume that the distributional curvature
of \(A\) is represented by a continuous \(E\)-valued two-form \(F\).
Then \(A\) is the uniform limit of smooth connections \(A_\epsilon\)
whose actual curvatures converge uniformly to \(F\).
The approximating pairs have a common spatial continuity modulus on
fixed compact coordinate subcharts, with bounds controlled by the
input moduli, input sup norms and fixed smooth data. If \(F\) is
positive definite of the prescribed round-compatible sign, then
\(F_{A_\epsilon}\) is in that same component for all small
\(\epsilon\). The compatibility relation is closed under uniform
convergence of both entries.

Use the convention
\[
 F=F_{\rm ref}+d_{A_{\rm ref}}a+\tfrac12[a\wedge a]
 \quad\text{in distributions}.
 \tag{1}
\]
In a smooth adjoint frame and smooth coordinates on \(U_\alpha\),
write \(\Gamma_\alpha=(A_{\rm ref})_\alpha\) and use subscripts for
component forms. Then
\[
 d a_\alpha
 =G_\alpha:=(F-F_{\rm ref})_\alpha
   -[\Gamma_\alpha\wedge a_\alpha]
   -\tfrac12[a_\alpha\wedge a_\alpha].
 \tag{2}
\]
All three terms are continuous. The \(d\) in (2) differentiates
coordinate-form coefficients in the sense of distributions. Thus only
the antisymmetrized derivatives are supplied by curvature.

For the transition from \(\alpha\) to \(\beta\), write \(\Phi\) for
the coordinate change from \(\beta\) to \(\alpha\) and \(T\) for the
adjoint action of the inverse bundle transition. Then
\(a_\beta=T\Phi^*a_\alpha\). Coordinate pullback commutes with
the exterior derivative, including on distributions under a smooth
diffeomorphism. Consequently
\[
 d a_\beta=T\Phi^* d a_\alpha+(dT)\wedge\Phi^*a_\alpha .
 \tag{3}
\]
Writing \(\Gamma_\beta=T\Phi^*\Gamma_\alpha+\vartheta\), where
\(\vartheta=g^{-1}dg\) for the bundle transition \(g\) in the
\(\beta\) coordinates, gives \(dT=-\operatorname{ad}(\vartheta)T\).
Its term in (3) cancels
\([\vartheta\wedge T\Phi^*a_\alpha]\) in
\([\Gamma_\beta\wedge a_\beta]\). Thus \(d_{A_{\rm ref}}a\) and
the curvature terms in (1) transform homogeneously. The affine
inhomogeneous term of a connection already canceled on taking
the difference from \(A_{\rm ref}\).

## Partitioned convolution and curvature error

Choose a finite smooth coordinate and bundle cover \(U_\alpha\)
with smaller precompact subcharts covering \(M\). Choose a
nonnegative smooth partition \(\eta_\alpha\) subordinate to those
subcharts, and choose \(\chi_\alpha\in C_c^\infty(U_\alpha)\)
equal to one on an open neighborhood of
\(\operatorname{supp}\eta_\alpha\). Extend the coefficient forms
\[
 u_\alpha=\chi_\alpha a_\alpha,\qquad
 v_\alpha=d\chi_\alpha\wedge a_\alpha+\chi_\alpha G_\alpha
 \tag{4}
\]
by zero to the Euclidean coordinate space. Then \(du_\alpha=v_\alpha\)
in distributions on \(\mathbb R^4\). The products have compact
support in the interior of the chart, so extension introduces no
boundary distribution.

Let \(\rho_\epsilon\) be a nonnegative smooth convolution kernel of
mass one supported in a Euclidean ball of radius \(\epsilon\), from
scaling a single fixed kernel. Set \(M_\epsilon w=\rho_\epsilon*w\)
componentwise in the constant coordinate basis. Constant-coefficient
differentiation commutes with convolution, hence
\[
 u_{\alpha,\epsilon}=M_\epsilon u_\alpha,\qquad
 d u_{\alpha,\epsilon}=M_\epsilon v_\alpha .
 \tag{5}
\]
Both converge uniformly on \(\mathbb R^4\) to the corresponding
inputs. In particular, on \(\operatorname{supp}\eta_\alpha\) and
\(\operatorname{supp}d\eta_\alpha\), which is contained in that same
support, the input forms in (4) equal \(a_\alpha,G_\alpha\).
Let \(I_\alpha\) convert chart component forms back to the tensor
bundle. Define
\[
 a_\epsilon=\sum_\alpha\eta_\alpha I_\alpha u_{\alpha,\epsilon},
 \qquad A_\epsilon=A_{\rm ref}+a_\epsilon .
 \tag{6}
\]
Each summand is smooth and extends by zero; \(a_\epsilon\) is a
global smooth tensor and \(A_\epsilon\) is a connection on \(P\).
Set \(e_{\alpha,\epsilon}=u_{\alpha,\epsilon}-a_\alpha\) inside
the chart. Since \(\sum_\alpha\eta_\alpha=1\), subtraction before
differentiation gives the exact identity
\[
 \begin{split}
 d_{A_{\rm ref}}(a_\epsilon-a)
  =\sum_\alpha I_\alpha\bigl(
   &d\eta_\alpha\wedge e_{\alpha,\epsilon}\\
   &+\eta_\alpha(d u_{\alpha,\epsilon}-G_\alpha)
    +\eta_\alpha[\Gamma_\alpha\wedge e_{\alpha,\epsilon}]
  \bigr).
 \end{split}
 \tag{7}
\]
Here the partition functions are written in the \(\alpha\)
coordinates inside \(I_\alpha\). This comparison includes the
partition derivative. In a target frame, (3) accounts for derivatives
of \(I_\alpha\) through the covariant derivative, producing precisely
the bracket term already included in (7). Thus there is no missing
derivative of a transition. The cutoff derivative is the first term
of \(v_\alpha\) in (4).

The construction differentiates with \(d\) before restoring each
chart's smooth coefficients. If one instead compares smoothing and
covariant differentiation within a chart, the remaining commutator
is \([c,M_\epsilon]\) with \(c w=[\Gamma_\alpha\wedge w]\).
In general a smooth coefficient multiplier has
\[
 [c,M_\epsilon]w(x)
 =\int \rho_\epsilon(y)\big(c(x)-c(x-y)\big)w(x-y)\,dy.
 \tag{8}
\]
On the buffered chart support, its sup norm is at most
\(C\epsilon\|w\|_\infty\). This also gives the multiplier
commutator if a smooth partition or transition matrix is passed
through a convolution in a fixed coordinate system. The chart
convolutions in (6) are performed before any transition between
charts. There is no assertion that Euclidean convolution commutes
with a nonlinear coordinate change. Equations (3) and (7) work
by covariant differentiation of the assembled tensor terms and never
require that commutation.

Both \(a_\epsilon-a\) and the right side of (7) tend uniformly to
zero in the fixed norms. On bounded sections the quadratic map
\(a\mapsto[a\wedge a]/2\) is Lipschitz. Applying (1) to
\(A_\epsilon\) now gives \(F_{A_\epsilon}\to F\) uniformly.
Choose any sequence of positive admissible scales
\(\epsilon_j\downarrow0\) to obtain the asserted smooth pairs.

## Common modulus and strict value tubes

Fix a common modulus \(\omega(r)\to0\) as \(r\downarrow0\) for
the coordinate coefficients of \((a,F)\) on the finitely many
compact sets used for the cutoffs and overlap comparisons. One
can take the maximum of the coefficient moduli. Equivalently,
a common modulus in fixed smooth metric comparisons yields
these moduli after adding the linear error for smooth coefficient
changes. Denote a common bound of the input sup norms by \(L\).
By (2), and smoothness of the fixed data on the compact sets,
\(G_\alpha\) has a modulus bounded at small \(r\) by
\(C(\omega(Cr)+r)\), where \(C\) depends only on \(L\) and the
fixed comparisons. Products of bounded functions have modulus
bounded by the respective moduli times bounds for the other
factor. This gives the same type of estimate for the two forms
in (4). Zero extension preserves such a bound for sufficiently
small \(r\): when at least one point lies in the support of a
cutoff or its derivative, the other point within \(r\) lies in
a fixed buffered compact subset of the chart, and otherwise
both values are zero. Bounds for larger \(r\) follow from the
sup norms.

If \(w\) has modulus \(\omega_1\) on all of \(\mathbb R^4\), then
\[
 |M_\epsilon w(x)-M_\epsilon w(y)|
 \le \int\rho_\epsilon(z)|w(x-z)-w(y-z)|\,dz
 \le \omega_1(|x-y|).
 \tag{9}
\]
This applies to \(u_\alpha\) and \(v_\alpha\) uniformly in
\(\epsilon\), with no factor increasing as \(\epsilon\to0\).
The same integral with one unsmoothed value also gives
\(\|M_\epsilon w-w\|_\infty\le\omega_1(\epsilon)\).
On a fixed target compact subchart, the coefficients of the terms
in (6) and of their covariant exterior derivatives are products
of fixed smooth multipliers with the values of
\(u_{\alpha,\epsilon}\) or \(du_{\alpha,\epsilon}\) at the
transition coordinates. This follows directly from the product
rule giving (7). The cutoffs and their derivatives are a positive
distance from the chart boundary. For two nearby points in the
target chart, if at least one point is in a summand's support,
both points stay in a fixed buffered overlap. Smooth transitions
there have uniformly bounded coefficients and are uniformly
Lipschitz for nearby points. If both are outside that support,
the corresponding summand vanishes at both. Combining (9) with
the product estimate, finite sums, and the curvature formula
shows that the coordinate pair \((A_\epsilon,F_{A_\epsilon})\)
has a common modulus bounded for small \(r\) by
\(C'(\omega(C'r)+r)\). The connection coefficients include
the fixed smooth term \(A_{\rm ref}\). The constants depend
only on \(L\) and the fixed smooth data and cutoffs. They work
for all chosen scales and yield equicontinuity independent of
any approximation error.

Positive definiteness and the internal orientation sign are
open algebraic conditions on the curvature values. The graph
of the continuous section \(F\) is compact, so there is a
closed bounded fiberwise tube of some positive radius along
that graph contained in the specified open definite component.
Its total space is compact since the base is compact and the
fibers are finite dimensional. Uniform convergence places all
sufficiently late curvatures inside that tube. The corresponding
pairs also range over a compact value set in the affine
connection and curvature bundles. For any sufficiently small
open \(C^0\) value tube about a smooth definite reference that
contains \((A,F)\) strictly, the compact graph has a positive
margin from the tube boundary. Uniform convergence of both
entries then keeps \((A_\epsilon,F_{A_\epsilon})\) in it.
For a tube expressed by two strict sup-norm inequalities, this
is exactly the triangle inequality with the two strict margins.

If component is taken in the topology of the compatible graph,
use \(A_s=A+s(A_\epsilon-A)\) for \(0\le s\le1\).
Equation (7) and the quadratic Lipschitz bound show
\[
 \sup_{0\le s\le1}\|F_{A_s}-F\|_\infty
 \le\|d_{A_{\rm ref}}(a_\epsilon-a)\|_\infty+
 C\|a_\epsilon-a\|_\infty .
 \tag{10}
\]
The path has continuous distributional curvature throughout, so
sufficiently late \(A_\epsilon\) belong to the same definite
component in that topology. Two sufficiently late smooth
approximants can also be joined by their smooth affine path:
their differences from \(a\) and those of their covariant
exterior derivatives are uniformly small along this path by
linearity. The same curvature estimate keeps the smooth path
in the definite region. This uses only the component containing
the specified data, without identifying it with a component on
any other bundle or manifold.

## Closure and scope

Let \((A_j,F_j)\) be continuous compatible pairs and assume
\((A_j,F_j)\to(A,F)\) uniformly in fixed norms. Write
\(a_j=A_j-A_{\rm ref}\) and \(a=A-A_{\rm ref}\).
The right side of
\[
 d_{A_{\rm ref}}a_j=F_j-F_{\rm ref}-\tfrac12[a_j\wedge a_j]
 \tag{11}
\]
converges uniformly to \(F-F_{\rm ref}-[a\wedge a]/2\).
For any smooth test two-form, the left side converges in the
distributional pairing by applying the fixed smooth formal
adjoint to the test form and using uniform convergence of
\(a_j\). Thus (11) passes to the limit and gives \(F=F_A\)
distributionally. This is closure of the compatible graph,
and gives relative closure on any prescribed open definite
region when the limit remains there.

This result provides compatible smooth approximating data in a
specified value region and the uniform-limit curvature identity.
The smooth solutions in E36 and their constraint propagation
retain their own hypotheses. No common existence time,
parabolic stability or weighted gradient class is provided by
the data approximation. Positive-time convergence and the
analytic control needed for gauge recovery remain separate
requirements. [E24][e24] · [E36][e36].

[req]: ../research-progress/handoffs/SP4-CME-E38_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E38_RETURN_v1.md
[b31]: ../brainstorm/notes/B31_CONTINUOUS_COMPATIBLE_DATA_20261122.md
[e24]: 24_TEMPORAL_BOOTSTRAP_20261122.md
[e36]: 36_COUPLED_CURVATURE_SYSTEM_20261122.md
