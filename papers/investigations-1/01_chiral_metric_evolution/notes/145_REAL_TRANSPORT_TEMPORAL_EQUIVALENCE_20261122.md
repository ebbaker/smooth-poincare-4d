# E145 — Real transport form of the temporal continuation hypothesis

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Bounded E derivation under [B73][b73],
configured gpt-6.2-sol / ultra. Independent runtime attestation and
actual lead identifiers are unavailable. The executor authored E03A,
the related E14/E24 temporal calculations, the E138 local radius
premise and the E143 conditional audit. E09, E137, E139 and E140
are inherited work. All seven input hashes in the [request][req]
were verified. The derivation uses direct tensor differentiation
and sphere integration, with no new source inspection.

## Data and complete target direction spheres

Work on a smooth compact closed oriented real four-manifold with a
smooth principal \(SO(3)\) bundle. Let \(A\) be any supplied smooth
definite connection in the positive-plane, round-compatible
curvature-map component. Use the live reconstructed metric \(g\)
of Fine's native normalization and the native internal metric
\(\langle\cdot,\cdot\rangle=-\operatorname{tr}(\operatorname{ad}(\cdot)
\operatorname{ad}(\cdot))\).
Let \(E\) denote the internal rank-three Euclidean bundle, \(F_A\)
the curvature, \(Q>0\) the trace-three wedge Gram endomorphism,
and \(S=Q^{1/2}\). The normalized oriented chiral identification
has \(F_A=-S\sigma\), where in native orthonormal internal labels
the \(\sigma_i\) form an orthonormal self-dual triple for \(g\).
Use \(\Gamma\) for the live positive chiral Levi–Civita connection
on \(E\) in these labels, \(b=A-\Gamma\), and
\(B_Y=\operatorname{ad}(b_Y)\). Derivatives of internal
endomorphism-valued covariant tensors use the indicated internal
connection and the same live base Levi–Civita connection.
Tensor norms use full squared sums over orthonormal base and
vertical slots and the Frobenius norm of internal endomorphisms.

On the complete unit target sphere \(S(E_x)\), with round area
measure \(d\omega\) of mass \(4\pi\), use E137's labels
\(f=Su/|Su|\), with inverse \(u=S^{-1}f/|S^{-1}f|\).
At each positive \(Q\) these are smooth whole-sphere
diffeomorphisms. The moment calculation below uses the target
round area directly, with no Jacobian from the source direction
sphere. Define the real vertical one-form
\[
 T_X=\tfrac12(S^{-1}\nabla^A_XQ\,S^{-1})_0,\qquad
 P_f=I-f\otimes f,\qquad
 R_X(f)=P_fT_Xf .
\]
Here the subscript zero denotes the trace-free part. To verify its
role in the transport comparison, along the \(A\)-horizontal lift
at \(u\) the derivative of \(Su\) in the \(\Gamma\) connection
is \((\nabla_X^A S)u-B_XSu\). Unit normalization projects this
derivative to \(f^\perp\) and divides by \(|Su|\).
The target vertical difference of the lifts is therefore
\(P_fL_Xf\) with \(L_X=(\nabla_X^A S)S^{-1}-B_X\).
The symmetric trace-free part of \(L_X\) is \(T_X\) by the
Sylvester identity for \(Q=S^2\) and skewness of \(B_X\).
Its skew part gives the rotation and its scalar part gives zero.
Thus \(R\) is exactly the real quadrupole remainder of
E03A/E137 in the specified labels. This calculation is valid
at every positive definite value. [E03A][e03a] · [E137][e137] ·
[E139 audit][e139].

## Specified horizontal derivative

Let \(\pi:S(E)\to M\). At a fixed time slice take the
\(\Gamma\)-horizontal lift \(Y^\Gamma\) from the live chiral
connection. With \(D^\Gamma\) the derivative on \(E\), the
covariant horizontal derivative of the vertical one-form is
\[
 (D_\Gamma R)_{Y,X}(f)
  =P_f(\pi^*D^\Gamma)_{Y^\Gamma}R_X(f)
          -R_{\nabla^g_Y X}(f).                              \tag{1}
\]
The first term treats \(X\) as an extended base vector field.
The second term removes its live Levi–Civita derivative,
so (1) is tensorial in both base slots, ordered as \(Y,X\).
The tautological \(f\) and \(P_f\) are parallel along
\(Y^\Gamma\). Differentiate \(P_fT_Xf\) and subtract the
existing base-slot derivative. This gives
\[
 (D_\Gamma R)_{Y,X}(f)=P_f(\nabla^\Gamma_Y T)_Xf .              \tag{2}
\]
The projected right hand side is already vertical.
Since \(\Gamma\) preserves the internal metric and trace,
\((\nabla^\Gamma_Y T)_X\) is symmetric and trace-free.
Every calculation here is spatial at a fixed time, and uses
the \(\Gamma\)-horizontal lift on the target. In particular it
uses no temporal derivative of \(f\), of \(u\) or of a
time-dependent bundle automorphism. [E137 (8)–(9)][e137].

## Exact sphere moments

For a symmetric trace-free matrix \(M\) write
\(U_M(f)=P_fMf\). Rotational invariance and the unit sphere
constraint give
\[
 \int f_i f_j\,d\omega=\frac{4\pi}{3}\delta_{ij},\qquad
 \int f_i f_j f_k f_\ell\,d\omega=
 \frac{4\pi}{15}(\delta_{ij}\delta_{k\ell}
                 +\delta_{ik}\delta_{j\ell}+\delta_{i\ell}\delta_{jk}).
\]
For example the coefficient in the second tensor follows
from \(\int f_3^4\,d\omega=2\pi\int_{-1}^1 z^4\,dz=4\pi/5\).
For another symmetric trace-free matrix \(N\),
\[
\begin{aligned}
 \int\langle U_M,U_N\rangle\,d\omega
   &=\int\big(\langle Mf,Nf\rangle
                       -\langle f,Mf\rangle\langle f,Nf\rangle\big)\,d\omega\\
   &=\left(\frac{4\pi}{3}-\frac{8\pi}{15}\right)
                          \operatorname{tr}(MN)
    =\frac{4\pi}{5}\langle M,N\rangle_{\rm HS},\\
 \int U_M\otimes f\,d\omega&=\frac{4\pi}{5}M .
\end{aligned}
\]
The last line follows by subtracting the fourth moment of
\(\langle f,Mf\rangle f\otimes f\) from \(M\) times the second
moment. In particular, (2) gives exact recovery of the two
matrix arrays componentwise:
\[
 \int R_X\otimes f\,d\omega=\frac{4\pi}{5}T_X,\qquad
 \int (D_\Gamma R)_{Y,X}\otimes f\,d\omega
                   =\frac{4\pi}{5}(\nabla^\Gamma_Y T)_X .
\]
With \((e_a)\) any live orthonormal base frame, the squared
fiber norms are respectively
\(\int\sum_a|R_{e_a}|^2d\omega\) and
\(\int\sum_{a,b}|(D_\Gamma R)_{e_b,e_a}|^2d\omega\).
The same matrix identity in every independent ordered slot
therefore gives, with \(k=\sqrt{4\pi/5}\),
\[
 \boxed{\ \|R\|_{L^2_f}=k|T|_g,\qquad
   \|D_\Gamma R\|_{L^2_f}=k|\nabla^\Gamma T|_g.\ }             \tag{3}
\]
This is the real norm on the complete fiber. Both antipodal
poles are regular in the ambient projection formula. Zeroes of
one field at specific directions do not change its moment.
[E03A][e03a] · [E137 target moments][e137].

## Native compatibility and change of derivative

To verify the native constant, set \(P_X=S^{-1}\nabla^A_XS\)
and \(U_X=\operatorname{sym}P_X\). Then
\(\nabla_X^AQ=2SU_X S\) and \(T_X=(U_X)_0\).
Differentiating \(\operatorname{tr}Q=3\) gives
\(U_X=T_X-\operatorname{tr}(QT_X)I/3\).
Because \(|Q-I|^2\le6\) on the positive trace-three cone,
\(|U_X|^2\le3|T_X|^2\). A pointwise eigenbasis of \(S\), with
positive eigenvalues \(s_i\), gives
\[
 (\operatorname{skew}P_X)_{ij}
       =\frac{s_j-s_i}{s_i+s_j}(T_X)_{ij}.
\]
Indeed \(SP_X=P_X^\top S\) and \(P_X+P_X^\top=2U_X\).
The quotient has absolute value at most one, including for
repeated eigenvalues. Orthogonality of symmetric and skew
parts and summation over base slots give \(|P|\le2|T|\).
This computation does not differentiate any eigenframe.

The Bianchi identity for \(F_A=-S\sigma\), and
\(d_\Gamma\sigma=0\), give
\[
 *[b,\sigma]=-*(P\wedge\sigma).
\]
In a live orthonormal base coframe let \(\Sigma_g=\sqrt2\,\sigma\).
Each map \(\alpha\mapsto*(\alpha\wedge(\Sigma_g)_j)\) is a
covector isometry. With the unit cross product in the
oriented internal coordinate space, the inherited compatibility
matrix for \(\Sigma_g\) has eigenvalues \(1,-2\)
and inverse norm one. In native internal orthonormal labels
the bracket is \(1/\sqrt2\) times that cross product
(the negative Killing metric is twice the bracket-frame metric).
Replacing both the bracket and \(\Sigma_g\) by the native
bracket and \(\sigma\) therefore gives one half of the
inherited matrix. Its inverse norm is two. For the right
hand side, wedge-star with each \(\sigma_j\) has norm
\(1/\sqrt2\). Summing three terms in each output component
gives \(|*(P\wedge\sigma)|\le\sqrt{3/2}|P|\).
Thus the native result is
\[
 |b|_g\le\sqrt6\,|P|_g\le2\sqrt6\,|T|_g.                     \tag{4}
\]
As a check, converting E09's \(|b|\le2\sqrt3|T|\) multiplies
both sides by \(c^{-1/2}\) for the base slot and the \(b\)
side alone by \(\sqrt2\) for the native internal vector,
giving the same (4). [E03A][e03a] · [E09][e09] · [E139][e139].

Because \(D^A=D^\Gamma+B\) on internal vectors, and both
covariant derivatives use the same base connection,
\[
 (\nabla^A_Y T)_X-(\nabla^\Gamma_Y T)_X=[B_Y,T_X].
\]
The native cross-product bracket gives
\(\|B_Y\|_{\rm op}=|b_Y|/\sqrt2\). In the Frobenius norm
\(|[B_Y,T_X]|\le 2\|B_Y\|_{\rm op}|T_X|\).
After squaring and summing the independent base slots,
\[
 |[B,T]|^2\le2\sum_{a,b}|b_{e_b}|^2 |T_{e_a}|^2
       =2|b|^2|T|^2,\qquad
 |[B,T]|\le 4\sqrt3\,|T|^2 .
\]
Consequently
\[
 \big|\,|\nabla^\Gamma T|-|\nabla^AT|\,\big|
        \le C_0 |T|^2,\qquad C_0=4\sqrt3 .                   \tag{5}
\]
All these constants are independent of the least eigenvalue
of \(Q\). The positivity of \(Q\) is used for the definition
of the fields, not to bound a denominator by a fixed floor.

## Pointwise and temporal equivalence

Put
\[
 \mathcal G=|\nabla^AT|_g+|T|_g^2,\qquad
 \Psi=\|D_\Gamma R\|_{L^2_f}+\|R\|_{L^2_f}^{\,2}.
\]
With \(x_1=|\nabla^AT|\), \(y=|T|^2\), and
\(z=|\nabla^\Gamma T|\), equations (3) and (5) give
\(\Psi=kz+k^2y\) and \(|z-x_1|\le C_0y\). Hence
\[
 \boxed{\quad
 \frac{k^2}{1+C_0}\,\mathcal G\ \le\ \Psi\
       \le k(C_0+k)\,\mathcal G,\qquad
 k=\sqrt{\frac{4\pi}{5}},\quad C_0=4\sqrt3 .
 \quad}                                                       \tag{6}
\]
For the upper bound use \(k x_1+(k C_0+k^2)y\), whose
larger coefficient is the displayed one. For the lower bound
use \(x_1+y\le z+(1+C_0)y\) and \(1+C_0\ge k\).
At a point with \(T=0\) the compatibility bound gives \(b=0\)
there, so the derivatives have equal norms and
\(\Psi=k\mathcal G\), even if the common derivative is nonzero.
The formulas hold at eigenvalue multiplicities and require
no chart on the direction sphere.

For any interval \(I\) in a supplied native original smooth
solution interval, define
\[
 J(I)=\int_I\sup_{x\in M}\mathcal G(\tau,x)\,d\tau,\qquad
 J_{\rm real}(I)=\int_I\sup_{x\in M}\!
       \left(\|D_\Gamma R(\tau,x,\cdot)\|_{L^2_f}
                   +\|R(\tau,x,\cdot)\|_{L^2_f}^{\,2}\right)d\tau .
\]
In each norm the fiber integration is at fixed \(x,\tau\)
after taking the indicated squared tensor sum.
Equation (6) first passes to the base supremum and then to
the time integral, with the same constants. On a finite
half-open interval use monotone convergence of the nonnegative
integrals. Thus its two budgets are finite together, even
if estimates on shorter closed subintervals are nonuniform.
The sum of the separate base suprema lies between the supremum
of the sum and twice that supremum, since the summands are
nonnegative. No supremum is moved inside a fiber
integral or a temporal integral.

For same-slice pullback by an orientation-preserving smooth
bundle automorphism \(h\) covering a diffeomorphism \(\varphi\)
of \(M\), the curvature and chiral identification are natural,
so \(g'=\varphi^*g\). The induced fiber isometry
\(H_x:E_x\to E_{\varphi(x)}\) carries \(f\) to \(H_x f\) and
intertwines the native metric, the target projection, and
\(\Gamma'\) with \(\Gamma\). More explicitly
\(T'_X=H_x^{-1}T_{\varphi_*X}H_x\) and
\((\nabla^{\Gamma'}_Y T')_X=
 H_x^{-1}(\nabla^\Gamma_{\varphi_*Y}T)_{\varphi_*X}H_x\).
These identities use the live Levi–Civita connection on the
base slots. The complete target sphere isometry preserves
round area, hence each of the pointwise norms in \(\Psi\)
and \(\mathcal G\) composes with \(\varphi\), and both base
suprema are preserved. This statement applies slice by slice,
even for a family of automorphisms, and has no term involving
the family's time derivative.

## Conditional continuation and evidence scope

If the E138 uniform-radius theorem and its E140 original
restart implication are accepted together, finite
\(J_{\rm real}([0,t_*))\) for a supplied smooth native original
solution at \(t_*<\infty\) gives \(J([0,t_*))<\infty\) by (6),
hence smooth definite extension past \(t_*\) in the original
fixed bundle identification. Under the same premise, a finite
maximal smooth definite lifespan in the specified component
forces \(J_{\rm real}([0,t_*))=\infty\). E143 audited E140
with E138 as an explicit premise. This derivation preserves
that conditional implication, independently of the unconditional
pointwise comparison (6). [E140][e140] · [E143][e143].

The real budget is an equivalent form of the temporal
hypothesis. No new a priori bound for either budget or
holomorphic chart theorem follows. The whole-sphere smooth
projection formulas use positivity, without importing
E137's near-round control of chart distortion or its
time-integrated estimates. The Fine and Fine–Panov/AHS
reference records retain their inherited inspections.
[Canonical normalization record][sources] ·
[Canonical twistor record][twistor].

[req]: ../research-progress/handoffs/SP4-CME-E145_REQUEST_v1.md
[b73]: ../brainstorm/notes/B73_REAL_TRANSPORT_CONTINUATION_20261122.md
[e03a]: 05A_REAL_TWISTOR_COMPARISON_20261122.md
[e09]: 11_TRANSPORT_CURVATURE_COMPARISON_20261122.md
[e137]: 137_REAL_COMPARISON_TIME_CONTROL_20261122.md
[e139]: ../reviews/E139_REAL_COMPARISON_TIME_AUDIT_20261122.md
[e140]: 140_CONDITIONAL_FINITE_BUDGET_ORIGINAL_RESTART_20261122.md
[e143]: ../reviews/E143_ORIGINAL_RESTART_AUDIT_20261122.md
[sources]: ../../../../references/SOURCE_NOTES_CME_SPECIAL_CASES_20261122.md
[twistor]: ../../../../references/SOURCE_NOTES_CME_REAL_TWISTOR_20261122.md

