# E155 — Static pair compactness from a supplied \(C^1\) metric limit

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Bounded E proof under [B78][b78], configured
gpt-6.2-sol / ultra. Independent helper runtime attestation and
actual lead identifiers are unavailable. The executor authored
E145 and E148, and contributed the inherited E03A and E14
calculations. E09, E137 and the E148/E150 assessment are inherited.
The six input hashes in the [request][req] were verified. The
metric convergence is a supplied hypothesis in this packet.

## Statement and hypotheses

Let \(M\) be a fixed smooth compact closed oriented real
four-manifold and \(P\to M\) a fixed smooth principal \(SO(3)\)
bundle. Let \(E=\operatorname{ad}P\) carry the native negative
Killing metric and the oriented adjoint model. Suppose \(A_n\)
are smooth native definite connections of the positive-plane,
round-compatible curvature-map sign. Write \(g_n=g_{A_n}\),
\(F_n=F_{A_n}\), \(Q_n\) for the trace-three normalized wedge
Gram endomorphism, and
\[
 S_n=Q_n^{1/2},\qquad
 (T_n)_X=\tfrac12(S_n^{-1}\nabla^{A_n}_XQ_n S_n^{-1})_0 .
\]
Use full covariant tensor norms in \(g_n\), with the live
Levi–Civita connection on base slots. Assume one common
\(m>0\) and \(C<\infty\) give
\[
 Q_n\ge m I,\qquad
 \sup_M\bigl(|T_n|_{g_n}+|\nabla^{A_n}T_n|_{g_n}\bigr)\le C .
\]
Suppose smooth orientation-preserving diffeomorphisms
\(\varphi_n:M\to M\) are supplied such that
\(g'_n=\varphi_n^*g_n\to g_\infty\) in \(C^1\) in a fixed smooth
background, where \(g_\infty\) is a positive \(C^1\) metric.

Then there are smooth equivariant automorphisms
\(H_n:P\to P\) covering \(\varphi_n\), constructed below,
and a subsequence such that \((H_n^*A_n,H_n^*F_n)\) converges
uniformly in a fixed smooth affine pair background to a
continuous positive compatible pair of the same sign.
The metric of that pair is \(g_\infty\).

## The curvature-normalized bundle map

In the native metric and internal pairing the wedge Gram
identity in an oriented orthonormal internal frame is
\[
 F_{n,i}\wedge F_{n,j}=(Q_n)_{ij}dV_{g_n}.
\]
This uses Fine's native reconstructed volume, with all the
\(F_{n,i}\) self-dual for \(g_n\). Let \(F_n^\sharp:E\to\Lambda^+_{g_n}\)
denote \(v\mapsto\langle F_n,v\rangle_E\), and put
\[
 \sigma_n=-F_n^\sharp\circ S_n^{-1}:E\longrightarrow\Lambda^+_{g_n}.
                                                               \tag{1}
\]
The Gram identity gives \((F_n^\sharp)^*F_n^\sharp=Q_n\),
so (1) is an isometry. The specified determinant sign means
that its minus sign gives the oriented isometry in the
round-calibrated orientation of \(\Lambda^+\).
Thus \(F_n^\sharp=-\sigma_n\circ S_n\), or \(F_n=-S_n\sigma_n\)
in the internal column convention. Both (1) and the chiral
connection it identifies are smooth for each \(n\).
[E137 native geometry][e137] · [E145 target geometry][e145].

Fix a smooth metric \(g_b\) and a smooth oriented isometry
\(\sigma_b:E\to\Lambda^+_{g_b}\). Such a fixed choice is
available by taking \(g_b=g_1,\ \sigma_b=\sigma_1\);
no bundle isomorphism for an unrelated base is assumed.
Define the positive self-adjoint endomorphism
\(L_n=g_b^{-1}g'_n\) of \(TM\), so
\(g'_n(v,w)=g_b(L_nv,w)\).
The positive tangent isometry
\[
 C_n=L_n^{-1/2}:(TM,g_b)\longrightarrow(TM,g'_n)
\]
preserves orientation. Its forward map on covariant two-forms
is inverse pullback,
\[
 (J_n\omega)(v,w)=\omega(C_n^{-1}v,C_n^{-1}w),\qquad
 J_n:\Lambda^+_{g_b}\longrightarrow\Lambda^+_{g'_n}.
\]
An orientation-preserving tangent isometry intertwines the
two Hodge stars and preserves the oriented \(\Lambda^+\)
frames, which verifies the displayed target and orientation.
The map \(J_n\), viewed into the fixed \(\Lambda^2T^*M\),
converges in \(C^1\) to \(J_\infty\) defined by the same
formula with \(g_\infty\). Indeed the reference metric
comparisons are uniform and the positive square root and
inverse are smooth on a compact positive range of matrix
values. The ordinary first derivative chain rule with
the supplied \(C^1\) convergence gives the claim.

Pull (1) back by \(\varphi_n\) to
\[
 \widetilde\sigma_n:\varphi_n^*E\longrightarrow\Lambda^+_{g'_n}.
\]
At \(x\), the source is \(E_{\varphi_n(x)}\) and the
map is \(\bigwedge^2 (d\varphi_n(x))^*\) applied to
\(\sigma_n(\varphi_n(x))\). It is an oriented isometry by
naturality of the Hodge star and the orientation assumption.
The desired identification of **source** internal labels
with the **target** fiber is
\[
 U_n=\widetilde\sigma_n^{-1}J_n\sigma_b:
                         E\longrightarrow\varphi_n^*E .       \tag{2}
\]
This map is over the identity as written and, on the
underlying fibers, maps \(E_x\) to \(E_{\varphi_n(x)}\).
The adjoint representation of \(SO(3)\) is an isomorphism
onto the orientation-preserving isometry group of the native
adjoint model. Fix once an oriented native orthonormal model
frame. Each \(p\in P_x\) gives an oriented \(E_x\) frame,
and \(P\) identifies with the oriented orthonormal frame
bundle of \(E\) via that representation. Applying \(U_n(x)\)
to the frame represented by \(p\) defines \(H_n(p)\) over
\(\varphi_n(x)\). It commutes with the principal right
action. Its inverse uses \(U_n(x)^{-1}\) over
\(x=\varphi_n^{-1}(y)\), so it is a smooth automorphism.
The construction gives the lifts even if the
\(\varphi_n\) had not been supplied with any lifts.

Write a prime on internal tensors pulled back by \(H_n\).
For example \(A'_n=H_n^*A_n\) and the associated derivative
on \(E\) is \(U_n^{-1}(\varphi_n^*D^{A_n})U_n\).
For endomorphisms \(Q'_n=U_n^{-1}(\varphi_n^*Q_n)U_n\).
Its curvature is \(F'_n=H_n^*F_n=F_{A'_n}\), with metric
\(g'_n\), by naturality of the curvature and reconstruction.
The pulled-back chiral identification is exactly
\[
 \sigma'_n=\widetilde \sigma_n U_n=J_n\sigma_b.                \tag{3}
\]
No derivative of (2) needs to be bounded separately.

## Chiral connection coefficients in the fixed labels

Let \(\Gamma_n\) be the connection on \(E\) transported
from the positive chiral Levi–Civita connection of \(g_n\)
via \(\sigma_n\). Pulling it back and using (3) gives the
exact derivative
\[
 D^{\Gamma'_n}
 = (J_n\sigma_b)^{-1}\,D^{+,g'_n}\,(J_n\sigma_b),
 \qquad \Gamma'_n=H_n^*\Gamma_n .                            \tag{4}
\]
Here the last two factors mean apply the isomorphism to
a section and then differentiate with the chiral connection.
The Levi–Civita connection commutes with Hodge star, so
\(D^{+,g'_n}\) is the restriction of its action on two-forms.
Formula (4) follows by conjugating the pulled-back
derivative through \(\widetilde\sigma_n\) and then using
\(\widetilde\sigma_n U_n=J_n\sigma_b\). In particular it
absorbs the derivatives of the varying chiral isomorphisms
in their exact cancellation.

In a fixed smooth oriented orthonormal local frame \(e_i\)
of \(E\), write \(\Theta_{n,i}=J_n\sigma_b(e_i)\).
The induced connection matrix in a fixed coordinate chart is
\[
 (\gamma_{n,a})_{ij}
   =\langle\Theta_{n,i},
            \nabla^{g'_n}_{\partial_a}\Theta_{n,j}\rangle_{g'_n}.
\]
The Christoffel symbols of \(g'_n\) use only \(g'_n\),
its inverse and its first derivatives. The first
derivatives of \(\Theta_{n,j}\) use only the fixed frame
data and the \(C^1\) metric data, by the formula for
\(J_n\). Thus the coefficients converge uniformly.
They patch as the continuous metric connection on the fixed
\(E\) obtained by the \(C^1\)-metric version of (4).
Since the adjoint representation identifies the connection
matrices with the principal connection coefficients by a
fixed linear isomorphism, \(\Gamma'_n\) converges uniformly
to a continuous connection \(\Gamma_\infty\) in any fixed
smooth affine background. This step differentiates the
normalized metric once and calls for no metric curvature
bound or second derivative convergence.

## Native strain bounds and coordinate equicontinuity

Put \(b_n=A_n-\Gamma_n\) and \(b'_n=A'_n-\Gamma'_n\).
All following background-independent native norms
are taken with the indicated live metric and full base
tensor slots. The E09 relative identities, with the
pointwise native conversion in E137/E145, give
\[
 \begin{aligned}
 |b_n|_{g_n}&\le2\sqrt6\,|T_n|_{g_n},\\
 |\nabla^{\Gamma_n}b_n|_{g_n}
   &\le\sqrt2\bigl(6|\nabla^{A_n}T_n|_{g_n}
                   +(36+8\sqrt3)|T_n|_{g_n}^2\bigr).
 \end{aligned}                                               \tag{5}
\]
For the normalization, at a fixed \(K>0\) the native
\(g_n=2K\widehat g_n\) rescales each base covector norm
by \((2K)^{-1/2}\). The negative Killing internal metric
is twice the old bracket-frame one, contributing
\(\sqrt2\) to native \(E\)-valued norms and no factor
to endomorphism-valued norms. Thus the one- and two-base-slot
factors are common on both sides of the E09 inequalities,
and exactly the additional \(\sqrt2\) on the \(b_n\) terms
remains. The relative Sylvester inverse of E09 and the
pointwise wedge estimate of E145 are valid on any
positive definite slice. No time or near-round smallness
assumption enters (5). By naturality these inequalities
hold for their primed analogues in \(g'_n\).
[E09 relative bounds][e09] · [E137 (6)][e137] ·
[E145 native compatibility][e145].

The trace-three strain identity uses the same endomorphism
norms. Suppressing the index at a point, if
\(X_Y=\nabla^A_YQ\) then
\[
 X_Y=2ST_YS-\tfrac23\operatorname{tr}(QT_Y)Q,\qquad
 |\nabla^A Q|_g\le 2\lambda_{\max}(Q)|T|_g\le6|T|_g.          \tag{6}
\]
For the exact identity, the strain definition determines
the trace-free part of \(S^{-1}X_YS^{-1}\); its scalar part
is fixed by \(\operatorname{tr}X_Y=0\) and
\(\operatorname{tr}Q=3\). For the bound, on symmetric
endomorphisms let \(\mathcal S(H)=S H S\). The bracketed
linear map giving \(X_Y/2\) is
\(\mathcal S-\mathcal S I\otimes\mathcal S I/3\).
This is \(\mathcal S^{1/2}\Pi\mathcal S^{1/2}\) with
orthogonal projection \(\Pi\) onto the complement of
\(\mathcal S^{1/2}I\), whose squared norm is
\(\operatorname{tr}Q=3\). Its operator norm is at most
\(\lambda_{\max}(Q)\le3\). Sum over the base slot to
obtain (6). This proof uses no derivative of an eigenframe.
Equation (6) is unchanged under pullback with \(H_n\).
[E09][e09].

In the same fixed charts and frames as (4), write
\(\{g'_n\}_{ai}^{\,j}\) for the base Christoffel symbols.
Then the coordinate identities are
\[
 \begin{aligned}
 \partial_a b'_{n,i}
   &=(\nabla^{\Gamma'_n}_a b'_n)_i
          -\gamma_{n,a} b'_{n,i}
          +\{g'_n\}_{ai}^{\,j} b'_{n,j},\\
 \partial_a Q'_n
   &=\nabla^{A'_n}_aQ'_n
        -[\gamma_{n,a}+\operatorname{ad}(b'_{n,a}),Q'_n].
 \end{aligned}                                               \tag{7}
\]
The first line uses both the base covector and the internal
slots of \(b'_n\). In the second line the difference of
internal connection matrices is exactly
\(\operatorname{ad}(b'_{n,a})\). All coefficients displayed
in (7) are bounded uniformly in fixed charts by (4),
(5), the \(C^1\) metric convergence and
\(\|Q'_n\|_{\rm HS}\le3\). Equivalence of \(g'_n\) with
the fixed positive comparison metric converts the live
quantities (5)–(6) to bounded coordinate components.
Thus \(b'_n,Q'_n\) have uniformly bounded values and first
ordinary coordinate derivatives on fixed compactly contained
coordinate pieces. These are equicontinuity bounds in
the fixed bundle charts. The proof has used neither a
gauge derivative bound for \(H_n\) nor \(\nabla b'_n\)
in an uncontrolled frame.

## Uniform pair limit, sign and compatibility

Use finitely many fixed charts with smaller compact subcharts
covering \(M\), and smooth frames on the larger charts.
The coordinate derivative bounds make the sections
equicontinuous on the smaller pieces, using intermediate
coordinate balls. Arzelà–Ascoli and a common finite
subsequence give \(b'_n\to b_\infty\), \(Q'_n\to Q_\infty\)
uniformly, with the local limits patching by the fixed
smooth transition maps. In the fixed smooth affine
background,
\[
 A'_n=\Gamma'_n+b'_n\ \longrightarrow\
       A_\infty=\Gamma_\infty+b_\infty
\]
uniformly. The uniform lower matrix bound and trace
pass to the limit, so \(Q_\infty\ge mI\) and
\(\operatorname{tr}Q_\infty=3\). Hence
\(S'_n=(Q'_n)^{1/2}\to S_\infty=Q_\infty^{1/2}\) uniformly.
By (3), the exact curvature formula in the fixed internal
labels gives
\[
 F'_n=-S'_n\sigma'_n\ \longrightarrow\
        F_\infty=-S_\infty J_\infty\sigma_b .
\]
The oriented orthonormal chiral triple \(J_\infty\sigma_b\)
in \(g_\infty\) gives
\[
 (F_\infty)_i\wedge (F_\infty)_j
       =(Q_\infty)_{ij}dV_{g_\infty},\qquad
 \tfrac13\sum_i(F_\infty)_i\wedge(F_\infty)_i=dV_{g_\infty}.
\]
Since \(S_\infty\) is positive invertible, the limit plane
is exactly \(\Lambda^+_{g_\infty}\), the curvature-map
sign is the same as in (1), and the native reconstructed
metric is \(g_\infty\).

For compatibility choose any fixed smooth affine
origin \(A_b\) and write \(a'_n=A'_n-A_b\). Curvature
naturality and the exact curvature formula give
\(d_{A_b}a'_n=F'_n-F_{A_b}-[a'_n\wedge a'_n]/2\).
The right side converges uniformly. The left side passes
to the distributional exterior derivative by testing
against the fixed smooth adjoint. Thus
\(F_\infty=F_{A_\infty}\) in distributions.
No spatial smoothness of \(A_\infty\) is needed
for this conclusion.

## Equivalent supplied bounds and the continuation consequence

For the real direction relabeling of E137, let
\(\mathscr D_n(x)\) be the supremum over the unit source
fiber of the largest-to-smallest tangent singular-value
ratio at one direction. The exact value there is
\(\sqrt{\lambda_{\max}(Q_n)/\lambda_{\min}(Q_n)}\).
Since \(\operatorname{tr}Q_n=3\), the floor \(m\)
gives \(\mathscr D_n\le\sqrt{3/m}\), and a supplied
\(\mathscr D_n\le D_0\) conversely gives
\(\lambda_{\min}\ge D_0^{-2}\) from
\(\lambda_{\max}\ge1\). These equivalences refer to
the specified whole-fiber direction distortion.

For E145's one-horizontal-derivative real budget density
\(\Psi=\|D_\Gamma R\|_{L^2_f}+\|R\|_{L^2_f}^2\), the
pointwise comparison
\[
 \frac{k^2}{1+4\sqrt3}\mathcal G\le\Psi
       \le k(4\sqrt3+k)\mathcal G,\qquad k=\sqrt{4\pi/5},
 \qquad \mathcal G=|\nabla^AT|+|T|^2
\]
shows equivalence of uniform sup bounds on these sequences.
Specifically the assumed \(C\) gives \(\mathcal G\le C+C^2\);
a bound \(\Psi\le P_0\) gives
\(|T|+|\nabla^AT|\le\sqrt B+B\) with
\(B=(1+4\sqrt3)P_0/k^2\). These are spatial pointwise
bounds, with no temporal integration or estimate extracting
them from the original evolution. [E137 distortion][e137] ·
[E145 equivalence][e145].

If \(A_n\) are actual slices of one supplied smooth
native original solution at \(t_n\to t_*<\infty\),
and the metric and strain hypotheses hold on those slices,
the subsequence and \(H_n\) just constructed meet the
assessed E148 criterion on the same manifold and bundle.
That criterion gives smooth positive definite continuation
past \(t_*\) in the original fixed identification. It
does not require derivative bounds for the normalization
maps or their inverses. E155 does not produce the base
diffeomorphisms or prove their \(C^1\) metric convergence,
does not derive a strain or spectral bound along the flow,
and imports no metric compactness theorem. The result
uses exactly the supplied \(C^1\) limit, without claiming
smooth metric or pair convergence. No new literature or
numerics entered. [E148][e148] · [Sequential assessment][assess].

[req]: ../research-progress/handoffs/SP4-CME-E155_REQUEST_v1.md
[b78]: ../brainstorm/notes/B78_BUNDLE_COMPACTNESS_FROM_METRIC_LIMIT_20261122.md
[e09]: 11_TRANSPORT_CURVATURE_COMPARISON_20261122.md
[e137]: 137_REAL_COMPARISON_TIME_CONTROL_20261122.md
[e145]: 145_REAL_TRANSPORT_TEMPORAL_EQUIVALENCE_20261122.md
[e148]: 148_SEQUENTIAL_VALUE_COMPACTNESS_CONTINUATION_20261122.md
[assess]: ../reviews/E148_E150_SEQUENTIAL_CONTINUATION_ASSESSMENT_20261122.md

