# SP4-CME-E84 — Intrinsic strain budget on a supplied slice orbit

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI Codex assistance. The helper launch was configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and
selected lead settings were unavailable. I authored E59. The four
frozen input digests matched the [request][req] before use. The fixed
slice estimate is used with its [lead assessment][sliceassessment],
and the global and limiting results are used from the frozen
[manuscript][ms]. No new primary source was inspected or required.
[B50][b50]. [Return][ret].

## Setting and native pullback

Work on the compact closed oriented smooth standard \(S^4\) and
the fixed positive round chiral \(SO(3)\) bundle \(P\), with the
round perfect reference \(A_0\), curvature \(F_0\), native round
metric \(g_0\), and positive internal pairing from the negative
Killing form. Let \(E\) denote the associated adjoint bundle.
The connections considered for reconstruction have the same
definite curvature-plane orientation and curvature-map sign
as the reference. Write \(G_A=g_A^{\mathrm F}\) for the native
live Riemannian metric and \(\nu_A=dV_{G_A}\) for its volume
measure, using the same symbol for the oriented volume form.
Write \(\tau\) for Fine's native time.

Let \(g:P\to P\) be a smooth equivariant automorphism covering
an orientation-preserving diffeomorphism \(f:S^4\to S^4\).
The induced internal map on fibers is the isometry
\(U_x:E_x\to E_{f(x)}\). Set \(A=g^*B\) in the active pullback
convention. Curvature pulls back on its two alternating base
slots and its internal slot:
\[
 F_A(X_1,X_2)=U_x^{-1}F_B(Df_x X_1,Df_x X_2).
                                                                            \tag{1}
\]
Here the vectors \(X_1,X_2\) are at \(x\). This follows from the
curvature formula on \(P\) because exterior differentiation
and the Lie bracket commute with pullback. In an orthonormal
internal frame the sum of wedge squares defining the native
volume form is invariant under the orthogonal change of frame.
The curvature span and volume then satisfy
\[
 \Lambda^+_{G_A}=f^*\Lambda^+_{G_B},\qquad
 \nu_A=f^*\nu_B .
\]
Indeed \(U_x^{-1}\) merely changes the basis of the span and
pullback by \(f\) sends positive four-forms to positive four-forms.
The native metric is determined by this positive plane and
its specified volume. Since those are also the data for
\(f^*G_B\), it follows that
\[
 G_A=f^*G_B,\qquad Q_A(x)=U_x^{-1}Q_B(f(x))U_x .                        \tag{2}
\]
The second identity follows by taking the wedge Gram matrix
relative to the pulled-back volume, using (1). The induced
internal and base orientations preserve the curvature-map
sign. [E59, naturality and clock][e59]. [Manuscript, curvature
reconstruction and native conventions][ms].

## All strain slots and the live Lorentz norm

The positive inverse square root commutes with the conjugation
in (2), and the trace-free projection commutes with it.
The internal covariant derivative of an endomorphism pulls
back with \(A=g^*B\) and has a single covariant base slot.
Consequently for \(X\in T_xS^4\), the strain satisfies
\[
 \begin{split}
 T(A)(X)
 &=\tfrac12\big(Q_A^{-1/2}(\nabla_X^A Q_A)Q_A^{-1/2}\big)_0\\
 &=U_x^{-1}T(B)(Df_xX)U_x .
 \end{split}                                                          \tag{3}
\]
Here the subscript \(0\) means the internal trace-free part.
For \(\nabla^A T(A)\), the covariant derivative couples \(A\)
on the endomorphism slots and the Levi-Civita connection of
\(G_A\) on the one-form slot. The latter is the pullback of
the Levi-Civita connection of \(G_B\) by uniqueness of the
metric torsion-free connection. Thus for \(X,Y\in T_xS^4\),
\[
 (\nabla^A T(A))(X,Y)
   =U_x^{-1}(\nabla^B T(B))(Df_xX,Df_xY)U_x .                          \tag{4}
\]
The first base slot is the differentiation slot and the
second is the one-form slot. The internal slots are both
conjugated. The map \(Df_x\) is an isometry between the base
tangent spaces equipped with \(G_A(x)\) and \(G_B(f(x))\).
Conjugation by \(U_x\) preserves the internal Hilbert–Schmidt
pairing. Contracting all slots therefore gives
\[
 |T(A)|_{G_A}=|T(B)|_{G_B}\circ f,\qquad
 |\nabla^A T(A)|_{G_A}=|\nabla^B T(B)|_{G_B}\circ f .                   \tag{5}
\]

For \(\lambda\ge0\) let
\(m_{T,A}(\lambda)=\nu_A(\{x:|T(A)(x)|_{G_A}>\lambda\})\).
The set in the definition is the inverse image by \(f\) of
the corresponding set for \(B\). As
\(\nu_A=f^*\nu_B\), change of variables gives
\[
 m_{T,A}(\lambda)
 =\int_{f^{-1}\{|T(B)|_{G_B}>\lambda\}} f^*\nu_B
 =m_{T,B}(\lambda).
\]
Use the E66 rearrangement convention
\(\|T\|_{4,1;\nu}=\int_0^{\nu(S^4)}s^{-3/4}|T|^*(s)\,ds\).
Its layer formula is \(4\int_0^\infty m_T(\lambda)^{1/4}\,d\lambda\).
The equality of the distributions proves the exact equality
\[
 \mathscr L(g^*B)=\mathscr L(B),\qquad
 \mathscr L(C)=\|T(C)\|_{L^{4,1}(G_C)} .                               \tag{6}
\]
This proof uses the actual pullback volume on the left and
the actual volume on the right. The fixed reference norms
in E66 are used to apply the estimate to \(B\).
[E66 (2), (7)][e66]. [E70, distribution comparisons][e70].

## Original-flow equivariance and the native budget

Using the native live adjoint, the original Fine vector field
on connections is
\[
 V(A)=-d_A^{*G_A}
    \left[\left(4Q_A-\tfrac23\operatorname{tr}(Q_A^2)I\right)F_A\right].
                                                                            \tag{7}
\]
This is the original gradient equation of the manuscript in
native time, with the normalization specified there. For forms
valued in \(E\), \(d_{g^*B}g^*=g^*d_B\). Pullback is an isometry
of the live \(L^2\) pairings in every form degree by (2) and change
of variables. Testing against arbitrary pulled-back smooth forms
then gives
\(d_{g^*B}^{*G_{g^*B}}g^*=g^*d_B^{*G_B}\).
The bracketed expression in (7) pulls back by (1)–(2).
It follows that \(V(g^*B)=g^*V(B)\).

For a time-independent \(g\), pullback on the affine space
of connections has differential equal to pullback on their
difference one-forms. Therefore if \(B_{\rm flow}(\tau)\)
solves the original flow, the trajectory
\(A_{\rm flow}(\tau)=g^*B_{\rm flow}(\tau)\) solves it with
initial value \(g^*B_{\rm flow}(0)\) at the same \(\tau\).
The time-independent assumption is used in differentiating
the trajectory. Smooth local uniqueness of the original
flow, as recorded in the frozen manuscript, identifies the
pulled-back solution with the original solution for that
datum on common intervals. [Manuscript, original gradient
equation and smooth local uniqueness][ms].

For a trajectory \(C\), define the native budget on an
interval by
\[
 J^{\rm F}_{C}(\tau_1)=
    \int_0^{\tau_1}\sup_{S^4}
       \bigl(|\nabla^C T(C)|_{G_C}+|T(C)|_{G_C}^2\bigr)\,d\tau .
\]
By (5) and bijectivity of \(f\), the spatial suprema of
the two trajectories agree at each time, including the
supremum of their sum. Hence \(J^{\rm F}_{A_{\rm flow}}=J^{\rm F}_{B_{\rm flow}}\)
on finite intervals and at infinity by monotone limits.
The manuscript states the critical bound using
\(J_C\) in clock \(t\) and metric \(\widehat g_C\).
Set \(c=2K>0\), so \(G_C=c\widehat g_C\) and \(\tau=ct\).
The normalized \(Q\) and the strain tensor are the same for
these conventions. The constant internal rescaling leaves
the endomorphism norm unchanged, and the constant base
metric rescaling leaves Levi-Civita unchanged. Thus
\(|T|_{G_C}^2=c^{-1}|T|_{\widehat g_C}^2\) and
\(|\nabla^C T|_{G_C}=c^{-1}|\nabla^C T|_{\widehat g_C}\).
The factor \(c\) from \(d\tau\) cancels, proving
\(J^{\rm F}_C(c\,t_1)=J_C(t_1)\) exactly. The initial live
Lorentz norm also agrees across these constant conventions.
The one-form modulus scales by \(c^{-1/2}\) and the
four-dimensional volume by \(c^2\), which cancel in the
\(L^{4,1}\) layer formula. [E59, naturality and clock][e59].
[Manuscript, whole-time critical strain bound][ms].

## Conditional global consequence for a supplied representative

Let \(B=A_0+b\) be the smooth initial representative and
\(\beta=F_B-F_0\). The map \(S_0u=\iota_uF_0\) denotes
the fixed horizontal insertion map used by E66. Assume
\[
 S_0^*b=0,\qquad d_0^*b=0,\qquad
 \|b\|_{\infty;0}+\|\beta\|_{\infty;0}\le\rho ,
                                                                            \tag{8}
\]
where \(\rho>0\) is the assessed fixed tube radius, and
\(A_{\rm in}=g^*B\). Fix \(C_{\rm sl}\ge1\) from E66, using
the same fixed localization for the initial critical norm
\(\mathcal B^{1/2}\) as in the manuscript's strain-in-slice
proposition. Denote by \(\epsilon_{\rm cr}>0\) one reference
threshold that meets both the manuscript's global critical
theorem and its limiting recovery corollary. Choose
\(\ell_*=\epsilon_{\rm cr}/(2C_{\rm sl})\). For every
such smooth \(B,g\) with \(\mathscr L(A_{\rm in})\le\ell_*\),
the assessed static estimate and (6) give
\[
 \delta_B=\|(b,\beta)\|_{\mathcal B^{1/2}}
   \le C_{\rm sl}\mathscr L(B)
   =C_{\rm sl}\mathscr L(A_{\rm in})
   \le\tfrac12\epsilon_{\rm cr}.                                      \tag{9}
\]
The manuscript's whole-time critical theorem then supplies
a global smooth definite original flow \(B_{\rm flow}\) from
\(B\) and \(J_{B_{\rm flow}}(\infty)\le C_{\rm cr}\delta_B\).
It follows from (7) that \(A_{\rm flow}=g^*B_{\rm flow}\) is the
global original flow from \(A_{\rm in}\). The budget bound is
\[
 J_{A_{\rm flow}}(\infty)=J_{B_{\rm flow}}(\infty)
 \le C_{\rm cr}C_{\rm sl}\mathscr L(A_{\rm in}).                         \tag{10}
\]
The radius, strain threshold and constants in (9)–(10) depend
on the fixed native reference, the two assessed estimates,
and the fixed spatial localization. They are uniform in \(g\)
and use no derivative bound on \(g\), on the supplied smooth
data, or on their later flows. The slice hypotheses are
imposed on \(B\) at the initial time. [E66][e66]. [E70][e70].
[Manuscript, fixed-slice estimate and critical theorem][ms].

For smooth limiting recovery use the manuscript's critical
splice with \(m=6\). Its stable adjusted tail tends to \(A_0\)
smoothly and the direct recovery maps tend smoothly to a
principal automorphism \(j_\infty\) with orientation-preserving
base map \(\bar j_\infty\). This gives
\(B_{{\rm flow},\infty}=j_\infty^*A_0\).
Thus the limit for \(A_{\rm flow}\) is explicitly
\[
 A_{{\rm flow},\infty}=(j_\infty\circ g)^*A_0,\qquad
 F_{A_{{\rm flow},\infty}}=(j_\infty\circ g)^*F_0,\qquad
 G_{A_{{\rm flow},\infty}}=(\bar j_\infty\circ f)^*g_0 .
                                                                            \tag{11}
\]
This order of composition follows from active pullback.
The limiting metric is round up to the displayed diffeomorphism,
with the reference scale. Smooth convergence of connection,
curvature and metric follows by applying the fixed smooth
pullback to the limits for \(B_{\rm flow}\). At each fixed
\(C^r\) order, the associated constants can depend on derivatives
of \(g\) through the pullback and on the higher smooth norms
for \(B_{\rm flow}\). The invariant budget in (10) uses none
of those constants. [Manuscript, smooth round limit and
critical limiting recovery][ms].

## Conditional consequence of a supplied pointed section

Let \(\mathscr G\) be the full allowed group of smooth equivariant
bundle automorphisms covering orientation-preserving base
diffeomorphisms. On the open smooth space of definite connections
with the reference curvature orientation and sign, suppose the
B49 map \((\gamma,b)\mapsto\gamma^*(A_0+b)\) has a smooth
local right inverse on an open \(C^\infty\) neighborhood
\(\mathscr U_0\) of \(A_0\). Assume its value at \(A_0\) is
\((\operatorname{id},0)\). Write its values as \(\gamma(C),b(C)\)
with \(b(C)\) in the fixed smooth slice.
Then \(C=\gamma(C)^*B(C)\), where \(B(C)=A_0+b(C)\).
Continuity through the stated pointed value makes
\[
 C\longmapsto
 \|b(C)\|_{\infty;0}+\|F_{B(C)}-F_0\|_{\infty;0}
\]
continuous and zero at \(A_0\), since curvature is a smooth
expression in the connection and its first derivatives.
Restrict \(\mathscr U_0\) to the open neighborhood
\(\mathscr U_1\) on which this expression is less than \(\rho\).
[B49, full orbit map][b49]. [B50, conditional saturation][b50].

For every fixed \(h\in\mathscr G\), \(h^*\) is a homeomorphism
of this smooth connection space with inverse \((h^{-1})^*\).
This follows from continuity in all smooth norms of the fixed
pullback and its inverse, and preservation of the orientation
and definiteness assumptions. In particular
\[
 \mathscr U_{\rm sat}=\bigcup_{h\in\mathscr G} h^*\mathscr U_1
\]
is an open \(C^\infty\) neighborhood of the whole round
orbit \(\mathscr G^*A_0\). For \(C\in\mathscr U_1\),
\(h^*C=(\gamma(C)\circ h)^*B(C)\), so each element in the
saturation has a supplied smooth slice representative in (8).
The group property shows invariance of
\(\mathscr U_{\rm sat}\) under both vertical gauges and the
allowed base transformations. Equation (6) makes the
small-strain condition invariant under the same action.
Equations (10)–(11) follow with the same reference constants
for each initial connection in \(\mathscr U_{\rm sat}\) with
\(\mathscr L(A_{\rm in})\le\ell_*\).

In particular the strict small-strain subregion is also open
and contains the round orbit. To see this, smooth convergence
of connections implies uniform convergence of the live
strain moduli by smooth curvature reconstruction and the
one derivative of \(Q\), and of the live volume densities
relative to any one of the nearby smooth metrics. If two
positive densities have ratio between \(1-\eta\) and \(1+\eta\),
their Lorentz norms of a fixed modulus are bounded by the
corresponding fourth-root factors by the layer formula.
For a fixed measure of volume \(V\), the Lorentz norm of
the difference of two moduli is at most \(4V^{1/4}\) times
their uniform distance. These estimates prove continuity
of \(\mathscr L\) in the smooth topology. Since
\(T(A_0)=0\), (6) gives zero strain throughout the round orbit.

The supplied representative and the supplied pointed section
are separate hypotheses. This derivation does not construct
the section or prove that all smooth data small in connection
and curvature values admit the required placement. The
saturation statement concerns a smooth neighborhood given
the stated section on that topology.

[req]: ../research-progress/handoffs/SP4-CME-E84_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E84_RETURN_v1.md
[b50]: ../brainstorm/notes/B50_INTRINSIC_BUDGET_ON_ORBIT_NEIGHBORHOOD_20261122.md
[b49]: ../brainstorm/notes/B49_SMOOTH_LOCAL_SLICE_SECTION_20261122.md
[e66]: 66_FIXED_SLICE_STRAIN_ESTIMATE_20261122.md
[e70]: ../reviews/E70_FIXED_SLICE_AUDIT_20261122.md
[e59]: 59_CRITICAL_PATH_STRAIN_20261122.md
[sliceassessment]: ../reviews/E66_E70_FIXED_SLICE_ASSESSMENT_20261122.md
[ms]: ../manuscript/chiral_curvature_and_metric_evolution.tex
