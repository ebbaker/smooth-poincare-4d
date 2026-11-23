# SP4-CME-E02B — Principal diffusion of the nonlinear \(Q\) equation

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. The helper was launched as gpt-6.2-sol / ultra.
Independent runtime settings and the lead's model/effort were unavailable.
This is the fixed principal-symbol and model-jet packet in
[request v1][request]. Input identities are in the [return][return].

The proposed principal coefficient is correct. Its exact eigenvalues are
given below. It is coercive at every definite point and loses uniform
coercivity as \(\lambda_{\min}Q\) approaches zero. A trace-free
matrix-field jet exhibits a negative principal velocity for the smallest
eigenvalue at a strict spatial minimum with vanishing scalar Hessian.

## Conventions and wedge-quotient derivation

Let \(A(t)\) be a smooth connection path on an oriented Euclidean
rank-three bundle \(E\) over a smooth real oriented four-manifold, with
positive definite reconstructed Riemannian metric \(\widehat g\).
Use the round-compatible sign \(F=-KS\Sigma\), \(S=Q^{1/2}\), \(K>0\).
The internal inner product is \(-2\operatorname{tr}_{SU(2)}\), with
\([e_i,e_j]=\epsilon_{ijk}e_k\). The chosen self-dual forms satisfy
\(\Sigma_i\wedge\Sigma_j=2\delta_{ij}dV_{\widehat g}\).
Write \(\mu=\frac13\sum_iF_i\wedge F_i\),
\(F_i\wedge F_j=Q_{ij}\mu\), so \(\operatorname{tr}Q=3\) and
\(\mu=2K^2dV_{\widehat g}\). Spatial covariant derivatives \(\nabla\)
use \(A\) on internal indices and the instantaneous Levi–Civita
connection of \(\widehat g\) on ordinary tensor indices. Time
derivatives use a fixed bundle frame in time, with no added base or
internal gauge velocity. All identities are local on the smooth
definite region.

Put \(q=Q-I\), \(N=q-|q|^2 I/6\) and \(C_a=\nabla_a N\).
By \(d_AF=0\) and self-duality, \(d_A^{*\widehat g}F=0\).
The component velocity in manuscript time is
\[
v_{ib}=4(C_c)_{il}F_{l,cb},\qquad
C_c=\nabla_c Q-\tfrac13\operatorname{tr}(Q\nabla_cQ)I
\]
in an orthonormal frame at the point. This follows from
\((d_A^* B)_b=-\nabla^a B_{ab}\) for bundle-valued two-forms.
The use of the trace constraint in the derivative of \(N\)
eliminates \(\operatorname{tr}(\nabla_c Q)\).
The flow input is Fine's Proposition 4.2, equation (4.1),
with the clock and internal metric converted as in the
[lead's E01 assessment][foundation]. His Proposition 4.5 concerns
the principal part on connection one-forms. The calculation here
extracts a coefficient on \(Q\) directly from the covariant
curvature evolution. [Fine, arXiv:1111.5005v2, §4.1–4.2][fine].

For any velocity \(v\), \(\dot F=d_Av\). Because \(F_j\) is self-dual,
\((d_Av)_i\wedge F_j=W_{ij}dV_{\widehat g}\), with
\[
W_{ij}=\sum_{a,b}F_{j,ab}\nabla_a v_{ib}.
\]
This uses the ordinary two-form inner product
\(\langle U,F_j\rangle=\frac12U_{ab}F_{j,ab}\).
In particular \(\dot\mu/\mu=\operatorname{tr}W/(3K^2)\).
Differentiating the wedge quotient in the fixed frame gives
\[
Q_t=\frac{W+W^T}{2K^2}-\frac{\operatorname{tr}W}{3K^2}Q .
\]
Substitute the velocity and use the self-dual product
\(\eta_{k,ab}\eta_{n,cb}
=\delta_{kn}\delta_{ac}+\epsilon_{knr}\eta_{r,ac}\),
where \(\Sigma_k=\tfrac12\eta_{k,ab}e^a\wedge e^b\).
The leading part is extracted from
\[
W_{ij}=4F_{j,ab}F_{l,cb}(\nabla_a C_c)_{il}
       +4F_{j,ab}(C_c)_{il}\nabla_a F_{l,cb},
\qquad
F_{j,ab}F_{l,cb}=K^2\bigl(Q_{jl}\delta_{ac}
   +S_{jk}S_{ln}\epsilon_{knr}\eta_{r,ac}\bigr)
\]
where \(b\) is summed in the form product. The \(\eta_{r,ac}\)
piece contracts only the antisymmetric part of \(\nabla_a C_c\).
Since \(C=\nabla N\), that part is \([\nabla_a,\nabla_c]N/2\).
It contains internal curvature acting on \(N\) and no second
derivatives of \(Q\). The last term in \(W\) contains first
derivatives of \(Q,F\). In the \(\delta_{ac}\) contraction,
\[
\nabla^a C_a=H-\tfrac13\operatorname{tr}(QH)I
 -\tfrac13\sum_a\operatorname{tr}((\nabla_aQ)^2)I,\qquad
H=\nabla^a\nabla_a Q .
\]
Thus the part of \(W\) linear in \(H\) is \(4K^2B_Q(H)Q\), where
\(B_Q(H)=H-\operatorname{tr}(QH)I/3\).
Its trace is zero by \(\operatorname{tr}Q=3\). The
principal expression and its Fourier symbol at fixed
\(Q,\widehat g\) are
\[
\mathscr L_Q(H)=2(QH+HQ)-\tfrac43\operatorname{tr}(QH)Q,\qquad
\sigma(\xi)H=-|\xi|_{\widehat g}^2\mathscr L_Q(H)
\]
for \(H\in\operatorname{Sym}^2_0 E\). This is a covariant
principal part in the \(Q\) variable with the other coefficients
frozen. Terms containing \(\nabla F\), curvature, and products
of first derivatives remain in the exact \(W\) formula above.
Their reduction and estimates belong to separate packets.

## Spectrum and pointwise coercivity

Diagonalize \(Q\) in an orthonormal internal frame, with eigenvalues
\(0<m=\lambda_1\leq\lambda_2\leq\lambda_3=M<3\).
Every symmetric off-diagonal direction \(E_{ij}+E_{ji}\)
has eigenvalue \(2(\lambda_i+\lambda_j)\).
On diagonal trace-free \(H=\operatorname{diag}(h)\), the
operator on \(h\) is
\[
D=4\left(\operatorname{diag}(\lambda)-\tfrac13\lambda\lambda^T\right).
\]
It has row sum zero and preserves the plane \(\sum_i h_i=0\).
Let \(e_2=\sum_{i<j}\lambda_i\lambda_j\) and \(e_3=\lambda_1\lambda_2\lambda_3\).
The matrix \(D/4\) has trace \(2e_2/3\) and the sum of its principal
two-by-two minors is \(e_3\). Each minor is \(e_3/3\), using
\(\sum_i\lambda_i=3\). Hence the two eigenvalues of \(D\)
on the trace-free plane are
\[
4\left(\frac{e_2}{3}\ \pm\sqrt{\left(\frac{e_2}{3}\right)^2-e_3}\right).
\]
The minimum and maximum over these and the three off-diagonal
eigenvalues are the exact pointwise spectral constants.

The pairing \((H,G)_Q=\operatorname{tr}(Q^{-1}HG)\) is real and
symmetric on symmetric matrices, by transposing and cycling the
trace. In this basis its square norm is
\[
\|H\|_Q^2=\sum_i\frac{h_{ii}^2}{\lambda_i}
 +\sum_{i<j}\left(\frac1{\lambda_i}+\frac1{\lambda_j}\right)h_{ij}^2 .
\]
The diagonal trace correction in \((\mathscr L_Q H,G)_Q\)
pairs with \(\operatorname{tr}G=0\). More explicitly,
\[
(\mathscr L_Q H,G)_Q=4\sum_i h_{ii}g_{ii}
 +\sum_{i<j}2(\lambda_i+\lambda_j)
       \left(\tfrac1{\lambda_i}+\tfrac1{\lambda_j}\right)h_{ij}g_{ij}.
\]
This is symmetric and yields the bounds \(4m\leq
(\mathscr L_Q H,H)_Q/\|H\|_Q^2\leq4M\).
The same operator is also self-adjoint in the ordinary
Hilbert–Schmidt pairing by the trace formula, and the spectral
bounds then hold in that pairing as well.
The upper bound can be tightened to \(\min(4M,6)\).
Off-diagonal eigenvalues are less than \(6\), while the absolute row
sum of \(D\) at index \(i\) is \(8\lambda_i(1-\lambda_i/3)\leq6\).
The upper bound \(6\) is approached for two eigenvalues tending
to \(3/2\) and the third to zero.

For the lower spectral constant, the diagonal test tensor
\(\operatorname{diag}(1,-1,0)\) has weighted Rayleigh quotient
\(8/(\lambda_1^{-1}+\lambda_2^{-1})\leq8m\). Therefore the
smallest eigenvalue of \(\mathscr L_Q\) lies between \(4m\) and
\(8m\), and tends to zero with \(m\). At fixed \(m>0\),
\(\|H\|_{\mathrm{HS}}^2/M\leq\|H\|_Q^2\leq
\|H\|_{\mathrm{HS}}^2/m\). A uniform eigenvalue floor gives a
uniform symbol bound relative to \(|\xi|_{\widehat g}\).
Bounds in an external coordinate metric separately depend on
comparability with \(\widehat g\).

## Minimum-eigenvalue matrix jet

Fix \(0<m<1\), \(Q_0=\operatorname{diag}(m,1,2-m)\), and
\(H=\operatorname{diag}(0,-1,1)\). A smooth trace-three,
positive definite matrix field near \(0\in\mathbb R^4\) with
these jets is
\[
Q(x)=\operatorname{diag}
\left(m+|x|^4,\quad 1-\tfrac12x_1^2,\quad
 2-m+\tfrac12x_1^2-|x|^4\right).
\]
Use the flat derivative in this matrix-field example.
Near zero the first entry remains the simple minimum eigenvalue.
It has a strict spatial minimum at zero with gradient and
Hessian zero. At zero, \(\nabla Q=0\) and
\(\sum_a\partial_a^2Q=H=\partial_1^2Q\). Yet
\[
(\mathscr L_{Q_0}H)_{11}=-\tfrac43m(1-m)<0 .
\]
First-order differentiation of a simple eigenvalue at a diagonal
matrix selects the \(11\)-entry. Hence the principal term alone
can give an adverse sign even when the scalar minimum eigenvalue
has zero spatial Hessian. A scalar proof that requires this
principal term to be nonnegative for arbitrary trace-three SPD
jets cannot use such a sign condition. The field in this example
is an unconstrained matrix field. Its realization by the curvature
of a definite connection subject to Bianchi and to the
reconstruction of \(\widehat g\) has not been shown. The sign of
the complete equation at a connection jet and preservation along
an actual flow are separate questions. The negative example is
proportional to \(m\) and supplies no finite-time degeneration claim.
The separately checked \(\mu_t=0\) fixes the volume density along
smooth definite evolution. Volume density alone gives no lower
bound on \(m\). Algebraically one can vary \(Q\) at fixed volume
through \(F=-KQ^{1/2}\Sigma\), with a fixed triple \(\Sigma\).
[B01 follow-up][decision].

## Round and exact finite checks

At \(Q=I\), \(\mathscr L_I(H)=4H\). For the rest of the
linear round check, \(\dot F=d_0a\) gives
\(q_{ik}=-K^{-1}\operatorname{sym}_0(\eta_{k,ab}\nabla_a a_{ib})\).
The linearized velocity is
\((a_t)_{ib}=-4K\eta_{j,cb}\nabla_c q_{ij}\).
Their composition and the self-dual product give
\[
q_{t,ik}=4\operatorname{sym}_0\!\left[
\nabla^a\nabla_a q_{ik}
+\tfrac12\epsilon_{kjl}\eta_{l,ac}[\nabla_a,\nabla_c]q_{ij}
\right].
\]
The round curvature action is
\([\nabla_a,\nabla_c]q_{ij}=
-K\eta_{t,ac}(\epsilon_{itm}q_{mj}+\epsilon_{jtm}q_{im})\).
Since \(\eta_{l,ac}\eta_{t,ac}=4\delta_{lt}\), the contracted
term is \(-2K(q_{ki}-\delta_{ik}\operatorname{tr}q+2q_{ik})
=-6Kq_{ik}\). Thus \(q_t=-4(L_E+6K)q\), where
\(L_E=\nabla^*\nabla\) uses the round chiral connection.

The [exact Python check][code] evaluates the two-form contraction
at three trace-three diagonal \(Q\) with rational square roots,
in two cotangent directions on a full five-element basis. It checks
weighted symmetry on all basis pairs, the stated bounds on those basis
tensors, and the adverse entry at two rational model jets. It passed,
with output in the [execution record][result]. The pointwise proof
above supplies the bounds for all definite \(Q\) and all trace-free
directions. The check does not test differential Bianchi constraints
on a connection jet or any solution.

[request]: ../research-progress/handoffs/SP4-CME-E02B_REQUEST_v1.md
[return]: ../research-progress/handoffs/SP4-CME-E02B_RETURN_v1.md
[foundation]: ../reviews/E01_FOUNDATION_ASSESSMENT_20261122.md
[decision]: ../brainstorm/notes/B01_NONLINEAR_Q_DECISION_20261122.md#b01-follow-up-decision-volume-identity-and-realizability-same-date
[fine]: https://arxiv.org/html/1111.5005v2
[code]: ../numerics/e02b_principal_checks.py
[result]: ../numerics/E02B_CHECKS_20261122.txt
