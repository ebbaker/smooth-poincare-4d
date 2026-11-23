# SP4-CME-E09 — From horizontal transport derivatives to chiral curvature

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Helper configuration gpt-6.2-sol / ultra.
Independent runtime settings and lead model/effort were unavailable.
This finite calculation follows the [B08 decision][decision] and
[frozen request][request]. Input identities are in the [return][return].

The reconstructed chiral curvature is controlled pointwise by
\(K|Q-I|\), \(|\nabla^A T|\), and \(|T|^2\). The calculation
below gives an explicit estimate with a positive eigenvalue floor.
A relative Sylvester cancellation gives a constant independent of
that floor, with all norms taken in the reconstructed geometry.

## Setup and covariant differentiation of compatibility

Work on any smooth oriented real four-dimensional definite slice in
the manuscript's round-compatible sign. The normalized data are
\[
F_A=-KS\Sigma,\quad K>0,\quad S=Q^{1/2},\quad Q>0,\quad
\operatorname{tr}Q=3,\quad dV_{\widehat g}=\mu/(2K^2),\qquad
\Sigma_i\wedge\Sigma_j=2\delta_{ij}dV_{\widehat g}.
\]
Use the chosen self-dual chirality and the internal norm
\(\delta_{ij}=-2\operatorname{tr}_{SU(2)}(e_ie_j)\), with
\([e_i,e_j]=\epsilon_{ijk}e_k\). Transport the self-dual
Levi–Civita connection to \(E\) by \(\Sigma/\sqrt2\) and call
it \(\Gamma\). Set \(b=A-\Gamma\) and \(B_X=\operatorname{ad}(b_X)\).
All derivatives use the Levi–Civita connection of \(\widehat g\)
on the base slots, with the indicated connection on internal
slots. Norms on endomorphisms use Frobenius norms and those on
tensor products are the corresponding orthonormal component sums.
Two-form norms count each unordered pair of base indices once.
All conclusions are local pointwise estimates. No time derivative
or flow equation is required.

Write \(P_X=S^{-1}\nabla^A_X S\), and let \(\mathcal J(P)\)
denote \(*(P\wedge\Sigma)\), contracting the endomorphism
index with the \(E\)-valued two-form. Then
\[
\mathscr C b=*[b,\Sigma]=-\mathcal J(P),\qquad
\mathscr C^{-1}=\tfrac12(\mathscr C+I),\qquad
\|\mathscr C^{-1}\|_{\rm op}=1,\qquad
\|\mathcal J\|_{\rm op}\leq\sqrt3 .
\]
The first identity follows by applying \(d_A\) to \(F_A\) and
using Bianchi. The second and third follow from
\(\mathscr C^2+\mathscr C-2I=0\) with eigenvalues \(1,-2\)
for the self-adjoint \(\mathscr C\). For the last bound use
\(\mathcal J(P)_i=\sum_j*(P_{ij}\wedge\Sigma_j)\), where
each map on one-forms is an isometry, and Cauchy–Schwarz over
the three \(j\) indices. [E01A compatibility inverse][compat] ·
[E02A wedge bound][wedge].

The tautological \(\Sigma\), wedge product and Hodge star are
parallel for the joint \(\Gamma\) and base connection, hence
so are \(\mathcal J\) and \(\mathscr C^{-1}\). In particular,
\[
\nabla^\Gamma_Y b=-\mathscr C^{-1}\mathcal J(\nabla^\Gamma_Y P),
\qquad
(\nabla^\Gamma_Y P)_X=(\nabla^A_Y P)_X-[B_Y,P_X].
\]
The differentiation uses the full tensor derivative of \(P\)
including its \(X\) slot. Since \(B_Y\) acts by the cross
product, \(\|B_Y\|_{\rm op}=|b_Y|\). Thus
\[
|\nabla^\Gamma b|
\leq \sqrt3\bigl(|\nabla^A P|+2|b|\,|P|\bigr).
\]
Replacing \(\nabla^\Gamma\) by \(\nabla^A\) on the inverse
without a correction would omit the connection difference.

## The relative Sylvester equation and its two estimates

Write \(U_X=\operatorname{sym}P_X\) and \(q=Q-I\). The strain
recovered by the real horizontal remainder is
\[
T_X=\tfrac12(S^{-1}(\nabla^A_X Q)S^{-1})_0,\qquad
U_X=T_X-\tfrac13\operatorname{tr}(QT_X)I.
\]
Indeed \(\nabla_X^A Q=2SU_XS\) and its trace vanishes.
For the pointwise auxiliary estimates use
\[
|\nabla^A Q|\leq 2\lambda_{\max}(Q)|T|\leq6|T|,
\qquad
|P|\leq2|T|,\qquad
|b|\leq 2\sqrt3\,|T|.
\]
The \(Q\) estimate is the trace-free inverse derived in E03A
from the weighted variance of diagonal entries and the products
of pairs of eigenvalues in the off-diagonal directions. For the
second estimate, diagonalize \(S\) with eigenvalues \(s_i>0\).
Since \(SP_X=P_X^TS\) and \(P_X+P_X^T=2U_X\), one has
\((P_X)_{ij}=2s_j(U_X)_{ij}/(s_i+s_j)\).
Thus \(|\operatorname{skew}P_X|\leq|T_X|\), whereas
\[
|U_X|^2=|T_X|^2+\bigl(\operatorname{tr}(qT_X)\bigr)^2/3\leq3|T_X|^2
\]
by \(|q|^2\leq6\). The symmetric and skew parts are orthogonal.
Now \(|P|\leq2|T|\) and the inverse above gives the stated bound
on \(b\). [E03A strain and compatibility estimates][transport].

Differentiating \(U_X\) in the \(A\) connection gives the exact
identity
\[
(\nabla^A_Y U)_X=(\nabla^A_Y T)_X
-\tfrac13\bigl(\operatorname{tr}(Q(\nabla^A_Y T)_X)
+\operatorname{tr}((\nabla^A_Y Q)T_X)\bigr)I .
\]
All derivatives of \(T_X\) remain internal trace-free.
As in the bound on \(U_X\), the first two terms together have
norm at most \(\sqrt3|(\nabla^A_Y T)_X|\). For the last,
\(|I|=\sqrt3\) and the product bound for squared component sums
give
\[
|\nabla^A U|
\leq\sqrt3|\nabla^A T|+\tfrac1{\sqrt3}|\nabla^A Q|\,|T|
\leq\sqrt3|\nabla^A T|+2\sqrt3|T|^2.
\]
Set \(\mathcal S_S(Z)=SZ+ZS\). The identities
\(SP_X=P_X^TS\) and \(P_X^T=2U_X-P_X\) yield
\(\mathcal S_S(P_X)=2U_X S\). Differentiate in \(Y\), using
\(\nabla_Y^A S=SP_Y\). The terms from derivatives of \(S\)
combine as
\[
(2U_X-P_X)SP_Y-SP_YP_X
=SP_XP_Y-SP_YP_X=S[P_X,P_Y].
\]
Consequently the relative Sylvester equation is
\[
\boxed{\mathcal S_S((\nabla^A_Y P)_X)
=2(\nabla^A_Y U)_X S+S[P_X,P_Y].}
\]
This equation differentiates a tensor identity using the same
base and internal connections on both sides. In a local
calculation one can take the base vector fields covariantly
constant at the point. No derivative of a diagonalizing frame
is taken.

For the requested floor \(m=\lambda_{\min}Q\geq m_0>0\),
\(\|\mathcal S_S^{-1}\|_{\rm op}\leq (2\sqrt{m_0})^{-1}\)
on the Frobenius space and \(\|S\|_{\rm op}\leq\sqrt3\).
Since \(|[P_X,P_Y]|\leq2|P_X||P_Y|\), the full base
component norm of the commutator is at most \(2|P|^2\).
Thus
\[
|\nabla^A P|\leq\sqrt{3/m_0}\bigl(|\nabla^A U|+|P|^2\bigr).
\]
Combining with the exact differentiated inverse yields
\[
\boxed{|\nabla^\Gamma b|\leq
\frac{3\sqrt3}{\sqrt{m_0}}|\nabla^A T|
+\left(\frac{6\sqrt3+12}{\sqrt{m_0}}+24\right)|T|^2.}
\]

The exact relative equation allows removal of the floor in
this estimate. In an \(S\)-eigenframe,
\(\mathcal S_S^{-1}(ZS)_{ij}=s_jZ_{ij}/(s_i+s_j)\) and
\(\mathcal S_S^{-1}(SZ)_{ij}=s_iZ_{ij}/(s_i+s_j)\).
Both multipliers are at most one in absolute value, even
when one or more eigenvalues become small. The estimate is
therefore
\[
|\nabla^A P|\leq2|\nabla^A U|+2|P|^2,\qquad
\boxed{|\nabla^\Gamma b|\leq
6|\nabla^A T|+(36+8\sqrt3)|T|^2.}
\]
The inverse is used only at positive \(S\). The conclusion is
uniform over definite data in the stated norms, and includes
no assertion at a singular matrix.

The derivative term can also be stated directly as a fiber
derivative norm. For \(\mathcal R_X(f)=P_fT_Xf\),
\(P_f=I-f\otimes f\), differentiate horizontally fixing
\(A\)-parallel labels \(f\) on the target sphere and using the
base connection on \(X\). This gives
\(D^A_Y\mathcal R_X(f)=P_f(\nabla^A_Y T)_X f\).
The E03A moment formula thus gives real fiber \(L^2\) norm
\(\sqrt{4\pi/5}\,|\nabla^A T|\) after summing the \(X,Y\)
indices. This compares the full base derivative of the
remainder in the specified lift, rather than differentiating
its scalar norm. [E03A round-sphere moment formula][transport].

## Chiral curvature and the two parameter regimes

As \(\Gamma=A-b\), the curvature difference is
\[
F_\Gamma=F_A-d_A b+\tfrac12[b\wedge b]
=F_A-d_\Gamma b-\tfrac12[b\wedge b].
\]
The second equality uses \(d_A b=d_\Gamma b+[b\wedge b]\).
In the two-form norm, \(|d_\Gamma b|\leq\sqrt2|\nabla^\Gamma b|\)
by antisymmetrizing its two base slots. Since the
\(ij\)-component of \(\tfrac12[b\wedge b]\) is
\([b_i,b_j]\), its squared norm is
\(\sum_{i<j}|b_i\times b_j|^2\leq |b|^4/2\).
Thus the normalized chiral curvature error satisfies
\[
\tfrac1{\sqrt2}|F_\Gamma+K\Sigma|
\leq K|S-I|+|\nabla^\Gamma b|+\tfrac12|b|^2.
\]
Diagonalizing \(Q\) yields \(|S-I|\leq
(1+\sqrt m)^{-1}|q|\) from
\(\sqrt{\lambda_i}-1=(\lambda_i-1)/(1+\sqrt{\lambda_i})\).
For the floor \(m\geq m_0>0\) this gives
\[
\tfrac1{\sqrt2}|F_\Gamma+K\Sigma|
\leq \frac{K}{1+\sqrt{m_0}}|q|
+\frac{3\sqrt3}{\sqrt{m_0}}|\nabla^A T|
+\left(\frac{6\sqrt3+12}{\sqrt{m_0}}+30\right)|T|^2.
\]
For arbitrary definite \(Q\) one also has the uniform bound
\[
\boxed{\tfrac1{\sqrt2}|F_\Gamma+K\Sigma|
\leq K|q|+6|\nabla^A T|+(42+8\sqrt3)|T|^2.}
\]
In the near-perfect calibration \(|q|\leq1/8\) in
Frobenius norm, \(7/8\leq\lambda_i\leq9/8\) follows since
the spectral norm is no larger. The floor formula applies
with \(m_0=7/8\). Combining the uniform derivative estimate
with the sharper near-perfect square-root estimate also gives
\[
\tfrac1{\sqrt2}|F_\Gamma+K\Sigma|
\leq \frac{K}{1+\sqrt{7/8}}|q|
+6|\nabla^A T|+(42+8\sqrt3)|T|^2.
\]
These constants use \(\widehat g\) and the frame metric.
In particular they do not assume comparison of this metric
with any fixed coordinate metric. The connection one-form
terms have inverse-length scale, and their derivatives and
the curvature terms have inverse-length-squared scale.

In the manuscript's Riemann curvature operator convention the
curvature of \(\Gamma\) is
\[
F_\Gamma=-(W^++sI/12)\Sigma-B_{\rm Ric}\Sigma^-,
\qquad |B_{\rm Ric}|^2=|\operatorname{Ric}_0|^2/4,
\]
where \(\Sigma^-\) is a complementary anti-self-dual triple
of the same two-form norm. The trace-free block \(W^+\)
is orthogonal to the scalar matrix. Consequently
\[
\tfrac12|F_\Gamma+K\Sigma|^2
=|W^+|_{\rm op,HS}^2
+\tfrac14|\operatorname{Ric}_0|^2
+\tfrac1{48}(s-12K)^2 .
\]
Each bound above is thus a bound on the square root of the
right-hand side. The three individual constants relative
to that bound are \(1\) for \(W^+\) in the operator
Hilbert–Schmidt norm, \(2\) for \(\operatorname{Ric}_0\),
and \(4\sqrt3\) for \(s-12K\). For the four-index tensor
norm of \(W^+\), the constant is \(2\) by the factor four
between squared norms. The anti-self-dual diagonal
curvature block is \(W^-+sI/12\). Its trace-free piece
\(W^-\) is absent from \(F_\Gamma\) and the identity above.
[Manuscript chiral block and Ricci normalization][manuscript].

At the round connection \(Q=I\), \(T\) vanishes identically
and so does its derivative. The compatibility derivative
and the curvature error both vanish, consistently with
\(W^+=0\), \(\operatorname{Ric}_0=0\) and \(s=12K\).
At a single point, \(q=T=0\) does not set \(\nabla^A T\)
to zero. The new pointwise estimates use a supplied
\(|\nabla^A T|\) bound. They do not supply one along the
nonlinear flow, a full curvature bound, comparison of
metrics, noncollapse, injectivity, initialization or
continuation. Those remain separate analytical questions
for the lead.

[request]: ../research-progress/handoffs/SP4-CME-E09_REQUEST_v1.md
[return]: ../research-progress/handoffs/SP4-CME-E09_RETURN_v1.md
[decision]: ../brainstorm/notes/B08_CHIRAL_CURVATURE_CONTROL_20261122.md
[compat]: ../reviews/E01A_AUDIT_20261122.md
[wedge]: 04A_NONLINEAR_Q_20261122.md
[transport]: 05A_REAL_TWISTOR_COMPARISON_20261122.md
[manuscript]: ../manuscript/chiral_curvature_and_metric_evolution.tex
