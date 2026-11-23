# E147 — Independent audit of the real transport continuation criterion

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol`
/ `ultra`. Independent runtime and selected lead identifiers
were unavailable. I authored E137 and E140 and audited E138 in
E142. Inherited overlap includes E84's naturality and native
clock calculation and E36/E42 in the restart input. I did not
author E03A, E09 or E145. This audit checks E145's complete-fiber
equivalence and its application to the separately assessed
continuation theorem. [Request][req] · [Derivation][e145] ·
[Return][return].

## Disposition and normalization

**Pass.** The real complete-fiber identities and both constants
in E145 hold for any supplied smooth native positive definite
\(SO(3)\) connection on a smooth compact closed oriented real
four-manifold in the round-compatible curvature-map sign.
The pointwise identities need only a definite slice in that
component. They use no uniform lower bound for \(\lambda_{\min}Q\).
The general continuation assessment supplies the premise left
conditional in frozen E145.
[B73][b73] · [E145][e145] · [Continuation assessment][continue].

The internal pairing is the positive metric from the negative
Killing form. In oriented bracket-orthonormal labels the Killing
norm square is twice the Euclidean norm square, since
\(-\operatorname{tr}(L_iL_j)=2\delta_{ij}\) for \(L_i v=e_i\times v\).
Dividing the frame by \(\sqrt2\) therefore gives native
orthonormal labels with bracket \(v\times w/\sqrt2\). Here
\(\times\) is the unit Euclidean cross product in those labels.
The curvature components in the native labels have wedge Gram
\(F_i\wedge F_j=Q_{ij}dV_g\) and \(\operatorname{tr}Q=3\).
They span \(\Lambda_g^+\), so their ordinary two-form inner
product is \(Q_{ij}\). Thus \(\sigma=-Q^{-1/2}F_A\) is an
orthonormal self-dual triple, with its orientation fixed by the
prescribed curvature-map sign. Let \(\Gamma\) be the self-dual
Levi–Civita connection in the corresponding \(E\) labels,
\(S=Q^{1/2}\), \(b=A-\Gamma\), and \(B_X=\operatorname{ad}(b_X)\).
For base slots use the live Levi–Civita connection and \(g\).
For internal matrices use the Frobenius norm. No ordered
two-form factor enters the convention for \(\sigma\).
[E03A, normalization][e03a] · [E09, setup][e09] ·
[E137, native geometry][e137].

## Transport and the covariant base derivative

On each source unit sphere the map \(u\mapsto f=Su/|Su|\)
has inverse \(f\mapsto S^{-1}f/|S^{-1}f|\). Positive definiteness
of \(S\) suffices for these smooth maps. Along an \(A\)-horizontal
lift, \(D_X^A u=0\), so
\(D_X^\Gamma(Su)=(\nabla_X^A S)u-B_XSu\). Differentiating unit
normalization therefore gives the target vertical mismatch
\[
 P_f\big((\nabla_X^A S)S^{-1}-B_X\big)f,\qquad P_f=I-f\otimes f.
\]
The symmetric trace-free part of its matrix is
\(T_X=\frac12(S^{-1}\nabla_X^A Q\,S^{-1})_0\): differentiate
\(Q=S^2\) and use skewness of \(B_X\). The scalar part has zero
projection and the skew part gives a rotation. The \(T\) field
is \(R_X=P_fT_X f=\operatorname{grad}_{S^2}(\frac12 f^T T_X f)\),
orthogonal in real round \(L^2\) to rotations by integration by
parts and to conformal gradients \(P_f a\) by antipodal parity
of the ambient components. This identifies the E03A real
remainder in the target round labels.
[E03A, transport and real projector][e03a] · [E145, setting][e145].

For \(\pi:S(E)\to M\) define the indicated derivative using the
\(\Gamma\)-horizontal target vector \(Y^\Gamma\) and the pullback
internal derivative:
\[
 (D_\Gamma R)_{Y,X}
 =P_f(\pi^*D^\Gamma)_{Y^\Gamma}R_X
                      -R_{\nabla^g_Y X}.
 \tag{1}
\]
The subtraction cancels the derivative of any scalar multiplying
the extended \(X\). The connection term is already linear over
functions in \(Y\), hence (1) is tensorial in both base slots.
The tautological \(f\) and \(P_f\) are \(D^\Gamma\)-parallel
along the horizontal lift. Differentiating \(P_fT_X f\) and
subtracting the covector-slot correction yields
\[
 (D_\Gamma R)_{Y,X}=P_f(\nabla^\Gamma_Y T)_X f .
 \tag{2}
\]
The internal derivative here preserves symmetry and trace, so
the resulting endomorphism in (2) is also symmetric trace-free.
This uses the live base connection on \(X\); at this first
derivative \(Y\) is the new tensorial direction slot. The formulas
are spatial and have no derivative of a moving gauge.
[E137, (8)–(9)][e137] · [E145, (1)–(2)][e145].

## Exact round area moments and all tensor slots

Use the round area on the **target** unit sphere in \(E_x\),
of mass \(4\pi\). By rotational invariance
\(I_{ij}=\int f_i f_j\,d\omega\) is scalar times the identity.
Its trace is \(4\pi\), hence \(I_{ij}=(4\pi/3)\delta_{ij}\).
The fourth moment is a fully symmetric invariant tensor, as
can be seen by polarizing its quartic on one arbitrary vector.
Its coefficient is fixed by \(I_{3333}=2\pi\int_{-1}^1z^4dz
=4\pi/5\). Thus
\[
 I_{ijk\ell}=\frac{4\pi}{15}
 (\delta_{ij}\delta_{k\ell}+\delta_{ik}\delta_{j\ell}
                                    +\delta_{i\ell}\delta_{jk}).
\]
For symmetric trace-free \(M,N\), set \(U_M=P_fMf\). The
second-moment contribution to
\(\int\langle U_M,U_N\rangle\,d\omega\) is
\((4\pi/3)\operatorname{tr}(MN)\), and the subtracted fourth
moment of \((f^TMf)(f^TNf)\) is
\((8\pi/15)\operatorname{tr}(MN)\). For the matrix recovery,
the fourth moment gives
\[
 \int (f^TMf) f\otimes f\,d\omega
 =\frac{4\pi}{15}\big((\operatorname{tr}M)I+2M\big).
\]
Subtract from \(\int (Mf)\otimes f\,d\omega=(4\pi/3)M\).
Consequently
\[
 \int\langle U_M,U_N\rangle\,d\omega
 =\frac{4\pi}{5}\langle M,N\rangle_{\rm HS},\qquad
 M=\frac{5}{4\pi}\int U_M\otimes f\,d\omega .
 \tag{3}
\]
There is no source-to-target Jacobian, probability-area
normalization, or Hermitian \((1,0)\) factor in (3).

The recovery applies separately to \(T_X\) from \(R_X\) and
to \((\nabla^\Gamma_Y T)_X\) from \((D_\Gamma R)_{Y,X}\).
At \(x\), choose any live orthonormal frame \(e_1,\ldots,e_4\).
The first squared norm integrates \(\sum_a|R_{e_a}|^2\),
and the second integrates
\(\sum_{a,b}|(D_\Gamma R)_{e_b,e_a}|^2\), all sixteen
ordered components in the second expression. There is no
antisymmetrization or two-form factor in these base slots.
Summing (3) in these slots gives
\[
 \|R\|_{L^2_f}=k|T|_g,\qquad
 \|D_\Gamma R\|_{L^2_f}=k|\nabla^\Gamma T|_g,\qquad
 k=\sqrt{4\pi/5}.
 \tag{4}
\]
The ambient projectors are smooth through either pole, and
the recoveries use the entire sphere.
[E03A, moments][e03a] · [E137, (5) and (9)][e137] ·
[E145, exact moments][e145].

## Native compatibility and the derivative-change bound

Let \(P_X=S^{-1}\nabla_X^AS\) and \(U_X=\operatorname{sym}P_X\).
Since \(\nabla_X^AS\) is symmetric,
\(\nabla_X^AQ=2SU_XS\). Differentiating the trace gives
\(U_X=T_X-\frac13\operatorname{tr}(QT_X)I\). With \(q=Q-I\),
\(|q|^2=\operatorname{tr}Q^2-3\le6\) by positivity and
\(\operatorname{tr}Q=3\). Hence
\[
 |U_X|^2=|T_X|^2+\tfrac13(\operatorname{tr}(qT_X))^2
                 \le3|T_X|^2.
\]
At a single point in an \(S\)-eigenbasis, the identities
\(s_i(P_X)_{ij}=s_j(P_X)_{ji}\) and
\((P_X)_{ij}+(P_X)_{ji}=2(U_X)_{ij}\) give
\[
 (\operatorname{skew}P_X)_{ij}
 =\frac{s_j-s_i}{s_i+s_j}(T_X)_{ij}.
\]
The entries for \(i=j\) and for \(s_i=s_j\) vanish. The ratio
has absolute value at most one on the positive cone. Thus
\(|P_X|^2\le4|T_X|^2\) by orthogonality, giving
\(|P|\le2|T|\) after summing \(X\). No eigenframe is
differentiated. The map \(S=Q^{1/2}\) is smooth on the open
positive cone, including multiplicities, by invertibility of
the pointwise Sylvester map at every positive \(S\).

Expanding \(d_AF_A=0\) with \(F_A=-S\sigma\), then multiplying
by \(S^{-1}\), gives \(d_A\sigma=-P\wedge\sigma\).
By \(d_\Gamma\sigma=0\), this is
\(*[b,\sigma]=-*(P\wedge\sigma)\). To recompute the two
native factors, put \(\Sigma_g=\sqrt2\,\sigma\) and
\(J_i\alpha=*(\alpha\wedge(\Sigma_g)_i)\). In the prescribed
orientation these obey \(J_iJ_j=-\delta_{ij}I+\epsilon_{ijk}J_k\).
For example in an oriented \(g\)-orthonormal cotangent frame
use the triple \((e^{12}+e^{34},e^{13}-e^{24},e^{14}+e^{23})\)
and evaluate on the four coordinate covectors. Each \(J_i\)
is a skew isometry. Let \(L_i v=e_i\times v\) on oriented
unit internal labels. The auxiliary compatibility map using
\(\Sigma_g\) and the unit cross-product bracket is
\[
 C^\circ=-\sum_i L_i\otimes J_i .
\]
Indeed its \(i\)-th output on \(b\) is
\(\sum_{j,\ell}\epsilon_{ij\ell}J_\ell b_j\).
Using \(\sum_i L_i^2=-2I\) and
\([L_i,L_j]=\epsilon_{ijk}L_k\), one obtains
\((C^\circ)^2=2I-C^\circ\). The matrix is self-adjoint
because both tensor factors in each term are skew.
Its trace is zero on the nonzero space, so both roots
\(1,-2\) occur and the inverse norm is one.

The native \(\sigma\) and the native bracket each multiply
this operator by \(1/\sqrt2\). Hence \(C_{\rm nat}=C^\circ/2\)
has inverse norm two. On the right, each
\(*(\alpha\wedge\sigma_j)\) has norm \(|\alpha|/\sqrt2\).
For every output component apply
\(|\sum_j v_j|^2\le3\sum_j|v_j|^2\) and then sum the
output components. This gives
\[
 |*(P\wedge\sigma)|\le\sqrt{3/2}|P|,\qquad
 |b|\le2\sqrt{3/2}|P|\le 2\sqrt6|T|.
 \tag{5}
\]
Both constants are valid on the full positive cone.
[E09, compatibility inverse and relative Sylvester estimates][e09]
· [E145, native compatibility][e145].

Changing from \(\Gamma\) to \(A\) acts on an endomorphism by
the commutator. The common base Levi–Civita connection cancels:
\[
 (\nabla^A_Y T)_X-(\nabla^\Gamma_Y T)_X=[B_Y,T_X].
\]
Here \(\|B_Y\|_{\rm op}=|b_Y|/\sqrt2\) by the native bracket.
The Frobenius estimate \(|[B_Y,T_X]|\le
2\|B_Y\|_{\rm op}|T_X|\) gives, on both independent base slots,
\[
 |\nabla^AT-\nabla^\Gamma T|^2
 \le 2\sum_{a,b}|b_{e_b}|^2|T_{e_a}|^2
 =2|b|^2|T|^2 .
\]
With (5) and the reverse triangle inequality,
\[
 \big|\,|\nabla^AT|-|\nabla^\Gamma T|\,\big|
             \le C_0|T|^2,\qquad C_0=4\sqrt3 .
 \tag{6}
\]
There is no differentiated \(b\) or \(S^{-1}\) estimate in
this change of connection. In particular (6) requires no
uniform spectral floor. [E145, derivative change][e145].

## Both constants, time order, and scale

Set \(a=|\nabla^AT|\), \(d=|\nabla^\Gamma T|\),
\(y=|T|^2\). Then \(\mathcal G=a+y\) and
\(\Psi=\|D_\Gamma R\|_{L^2_f}+\|R\|_{L^2_f}^2=kd+k^2y\).
From \(|a-d|\le C_0y\),
\[
 kd+k^2y\le k a+k(C_0+k)y\le k(C_0+k)(a+y).
\]
Conversely \(a+y\le d+(1+C_0)y\). Multiply by \(k^2/(1+C_0)\)
and use \(k\le1+C_0\), which gives \(kd+k^2y\) as an
upper bound for the resulting right side. Thus the exact
stated constants are
\[
 \frac{k^2}{1+C_0}\mathcal G\le\Psi
                       \le k(C_0+k)\mathcal G .
 \tag{7}
\]
They hold at \(T=0\), where \(b=0\) by (5) and
\(\Psi=k\mathcal G\) even if the derivative is nonzero.
They hold at repeated eigenvalues, by the pointwise argument
above. No optimality of the comparison constants is needed.

For each \((\tau,x)\) first square-sum and integrate on the
single target fiber as in (4), then take the root for each
fiber norm. The \(R\) norm is squared in \(\Psi\), the
derivative norm remains linear. Take \(\sup_x\) of the sum,
then integrate in native time. For nonnegative \(A(x),B(x)\)
the sum of their separate suprema is between
\(\sup_x(A+B)\) and \(2\sup_x(A+B)\); this optional comparison
needs no interchange of a supremum and a fiber or time
integral. If \(I\) is any finite or infinite interval in a
given native smooth original flow, integrate (7) on compact
subintervals and pass by monotone convergence for the
nonnegative integrands. The extended-real budgets \(J(I)\) and
\(J_{\rm real}(I)\) satisfy (7) with the same constants.
[E145, pointwise and temporal equivalence][e145].

As a normalization check, with \(c=2K\) the native metric is
\(g=c\widehat g\), the clock is \(\tau=ct\), and \(Q\) is
unchanged. In native orthonormal labels the curvature components
gain \(\sqrt2\), so the wedge volume doubles from
\(2K^2 dV_{\widehat g}\) to \(4K^2dV_{\widehat g}\).
The conformal class is unchanged. The calibrated clock follows
from the two-form codifferential factor \(c^{-1}\) in the
actual velocity after imposing Bianchi. Constant metric scaling preserves the
Levi–Civita connections. In corresponding unit internal
labels the sphere metrics and the Frobenius matrix norms are
isometric. Each base covector slot of \(T,R\) costs
\(c^{-1/2}\) in norm. Both base slots in the two derivative
terms cost \(c^{-1}\) in norm. The \(R\) square and the
\(T\) square likewise each cost \(c^{-1}\). Thus both
supremum time integrals are invariant under this calibrated
constant normalization change. For \(b\), which is
internal-vector-valued, the native factor is
\(\sqrt2\,c^{-1/2}\). Applying it to E09's
\(|b|\le2\sqrt3|T|\) gives (5) independently.
[E09][e09] · [E137, native normalization][e137] ·
[General continuation assessment][continue].

## Spatial pullback and continuation

Let \(h\) be an orientation-preserving bundle automorphism
covering \(\varphi\), and \(H_x:E_x\to E_{\varphi(x)}\) its
fiber isometry. For \(A'=h^*A\), reconstruction yields
\(g'=\varphi^*g\), \(Q'=H^{-1}(Q\circ\varphi)H\), the same
conjugation for \(S\), and \(\Gamma'=h^*\Gamma\) in the
corresponding chirality. Thus \(H_x P_f=P_{H_x f}H_x\),
the induced sphere map takes the \(\Gamma'\)-horizontal lift
to the \(\Gamma\)-horizontal lift of the pushed-forward base
vector, and
\[
 T'_X=H_x^{-1}T_{\varphi_*X}H_x,\qquad
 (\nabla^{\Gamma'}_Y T')_X
 =H_x^{-1}(\nabla^\Gamma_{\varphi_*Y}T)_{\varphi_*X}H_x .
\]
The second identity uses the pullback base Levi–Civita
connection. The analogous identity holds for \(\nabla^{A'}T'\).
Transport of the vertical fields follows by (1)–(2), or
directly by their matrix formulas. The complete target
sphere isometry preserves round area; orthonormal base
frames are taken to orthonormal base frames. Both scalars
therefore compose with \(\varphi\) and their suprema are
invariant. For a time-dependent family this calculation still
holds at each slice. It involves no time derivative of the
family and makes no claim that its pullback path itself
solves the original equation.
[E137, same-time naturality][e137] · [E145, temporal
equivalence][e145].

Frozen E145 states continuation conditionally on acceptance
of E138 with E140. The supplied E138–E143 lead assessment
explicitly discharges the radius premise and establishes the
underlying finite-\(J\) continuation theorem for the same
native original flow on a fixed smooth bundle, in the same
definite component. By the lower bound (7),
\(J_{\rm real}([0,t_*))<\infty\) at finite \(t_*>0\)
then implies \(J([0,t_*))<\infty\), so the supplied
solution extends smoothly and positively definitely past
\(t_*\) in the original fixed identification. A finite
maximal smooth definite lifespan consequently has infinite
\(J_{\rm real}\). This uses the assessed combination and
retains the conditional wording of the frozen E145 history.
It is an equivalent continuation hypothesis for a supplied
smooth solution. It supplies neither an a priori budget
bound nor holomorphic charts, uniform distortion near the
boundary of the positive cone, or arbitrary-manifold
initialization. Only pointwise E137 identities were used.
No new primary passage or theorem was imported.
[Continuation assessment][continue] · [E145, evidence
scope][e145] · [Canonical normalization][sources] ·
[Canonical real twistor records][twistor].

[req]: ../research-progress/handoffs/SP4-CME-E147_REQUEST_v1.md
[return]: ../research-progress/handoffs/SP4-CME-E147_RETURN_v1.md
[b73]: ../brainstorm/notes/B73_REAL_TRANSPORT_CONTINUATION_20261122.md
[e03a]: ../notes/05A_REAL_TWISTOR_COMPARISON_20261122.md
[e09]: ../notes/11_TRANSPORT_CURVATURE_COMPARISON_20261122.md
[e137]: ../notes/137_REAL_COMPARISON_TIME_CONTROL_20261122.md
[e145]: ../notes/145_REAL_TRANSPORT_TEMPORAL_EQUIVALENCE_20261122.md
[continue]: E138_E143_GENERAL_CONTINUATION_ASSESSMENT_20261122.md
[sources]: ../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md
[twistor]: ../../../../references/SOURCE_NOTES_CME_REAL_TWISTOR_20261122.md
