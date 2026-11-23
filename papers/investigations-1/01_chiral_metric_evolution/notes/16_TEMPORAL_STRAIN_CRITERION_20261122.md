# SP4-CME-E14 temporal bounds from the relative curvature velocity

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and the
selected lead's actual settings were unavailable. This is the fixed
[E14 request](../research-progress/handoffs/SP4-CME-E14_REQUEST_v1.md)
under the [B13 decision](../brainstorm/notes/B13_TEMPORAL_RELATIVE_CURVATURE_20261122.md).
See the [return](../research-progress/handoffs/SP4-CME-E14_RETURN_v1.md)
for input identities.

## Setting and pointwise result

Work on a smooth oriented real four-manifold with a fixed smooth
oriented Euclidean rank-three bundle \(E\). Let \(A(t)\) be a smooth
solution of the unadjusted Fine flow on its smooth definite interval,
in a fixed bundle and base identification. Use positive curvature
planes and the round-compatible sign. In local oriented orthonormal
internal frames the bracket is \([e_i,e_j]=\epsilon_{ijk}e_k\)
and the norm is \(\delta_{ij}=-2\operatorname{tr}_{\mathbb C^2}(T_iT_j)\).
Take fixed \(K>0\) and use the normalized positive Riemannian
reconstruction
\[
 F=-KS\Sigma,\quad S=Q^{1/2},\quad Q>0,\quad\operatorname{tr}Q=3,
 \quad F_i\wedge F_j=Q_{ij}\mu,\quad
 \mu=2K^2dV_{\widehat g},\quad
 \Sigma_i\wedge\Sigma_j=2\delta_{ij}dV_{\widehat g}.
\]
The flow clock is that of \(A_t=-4d_A^{*\widehat g}[(q-|q|^2I/6)F]\),
where \(q=Q-I\). The curvature derivative \(F_t\) uses a fixed
internal identification. Denote by \(\nabla^A\) the spatial
derivative using \(A\) on internal slots and the instantaneous
Levi–Civita connection of \(\widehat g\) on every base slot.
Endomorphism norms are Frobenius, full tensor norms sum the squared
orthonormal components, and two-form norms count unordered base
pairs once.

For a covector index \(c\) define
\[
 T_c=\tfrac12(S^{-1}(\nabla_c^A Q)S^{-1})_0,\qquad
 P_c=S^{-1}\nabla_c^A S,\qquad
 C_c=\nabla_c^A Q-\tfrac13\operatorname{tr}(Q\nabla_c^A Q)I,\qquad
 N_c=S^{-1}C_cS.
\]
With \(\Gamma^+\) transported from the reconstructed chiral
Levi–Civita connection by \(\Sigma/\sqrt2\), put
\(b=A-\Gamma^+\) and \(B_c=\operatorname{ad}(b_c)\).
The calculation below gives
\[
 |N|\le36|T|,\qquad
 |\nabla^A N|\le36|\nabla^A T|+156|T|^2,\qquad
 K^{-1}|S^{-1}F_t|\le360|\nabla^A T|+4512|T|^2 .
 \tag{1}
\]
The constants are uniform over the trace-three positive cone.
The identities and bounds apply at each space-time point on the
smooth definite interval.

## Polynomial conjugation and its derivative

Write \(X_c=\nabla_c^A Q\), \(h_c=\operatorname{tr}(QT_c)\),
\(k_c=\operatorname{tr}(Q^2T_c)\), \(r=\operatorname{tr}(Q^2)\).
The strain inversion of E03 gives
\[
 X_c=2ST_cS-\tfrac23 h_cQ,\qquad |X|\le6|T|.
\]
Consequently \(S^{-1}X_cS=2T_cQ-\tfrac23h_cQ\) and
\(\operatorname{tr}(QX_c)=2k_c-\tfrac23h_cr\).
It follows that
\[
 \boxed{N_c=2T_cQ-\tfrac23 h_cQ-\tfrac23 k_cI
                                  +\tfrac29 h_cr I.}
 \tag{2}
\]
This is polynomial in \(Q,T_c\). In particular
\(|Q|,\|Q\|_{\rm op}\le3\), \(|Q^2|\le9\), \(r\le9\), and
\(|I|=\sqrt3<2\). [E03A inverse strain calculation](05A_REAL_TWISTOR_COMPARISON_20261122.md).

The four terms of (2) are bounded respectively by
\(6,6,12,12\) times \(|T_c|\).
For \((\nabla_a^A N)_c\), the terms with \(\nabla^A T\) are
the same polynomial linear map applied to \((\nabla_a^A T)_c\).
The other terms are obtained by differentiating \(Q\)
in the direction \(X_a\). Explicitly they are
\[
 \begin{aligned}
 &2T_cX_a-\tfrac23\bigl(\operatorname{tr}(X_aT_c)Q+h_cX_a\bigr)\\
 &\qquad-\tfrac23\operatorname{tr}((X_aQ+QX_a)T_c)I
       +\tfrac29\bigl(\operatorname{tr}(X_aT_c)r+
                         2 h_c\operatorname{tr}(QX_a)\bigr)I .
 \end{aligned}
\]
The four grouped terms of this derivative have bounds
\(2,4,8,12\) times \(|X_a||T_c|\), respectively. These use
\(|\operatorname{tr}(UV)|\le |U||V|\),
\(|UV|\le|U||V|\), and the bounds above for \(Q,I,r\).
For example the final coefficient is at most
\((2/9)(9+2\cdot3\cdot3)\cdot2=12\).
The complete derivative includes the covariant base \(c\)-slot,
as follows from the tensor product rule applied to (2). The product
of the two tensor norms is exact for independent indices,
\[
 \biggl(\sum_{a,c}|X_a|^2|T_c|^2\biggr)^{1/2}=|X||T|.
\]
Taking the squared component sum and using the triangle inequality
therefore gives \(|\nabla^A N|\le36|\nabla^A T|+26|X||T|\).
Together with the inverse strain bound this proves the first
two estimates in (1).

## Relative curvature identity and contractions

Bianchi and self-duality give \(v_b=A_{t,b}=4C^c F_{cb}\).
Then \(F_t=d_Av\) and the cyclic Bianchi identity give
\[
 F_{t,ab}=4\bigl((\nabla_a^A C^c)F_{cb}
       -(\nabla_b^A C^c)F_{ca}+C^c\nabla_c^A F_{ab}\bigr).
\]
The compatibility normalization gives
\(\nabla_c^A F=-KS(P_c+B_c)\Sigma\) because
\(\nabla_c^A\Sigma=B_c\Sigma\).
The derivative of \(S^{-1}C^c S\), including the raised
base slot, gives
\[
 S^{-1}(\nabla_a^A C^c)S
        =\nabla_a^A N^c+[P_a,N^c]=:\mathcal D_a{}^c .
\]
The sign follows from
\(\nabla_a^A(S^{-1})=-S^{-1}(\nabla_a^A S)S^{-1}\);
metric compatibility commutes with raising \(c\).
Combining these identities gives the exact relative form
\[
 \boxed{
 S^{-1}F_{t,ab}=-4K\left(\mathcal D_a{}^c\Sigma_{cb}
                  -\mathcal D_b{}^c\Sigma_{ca}
                  +N^c(P_c+B_c)\Sigma_{ab}\right).
 }
 \tag{3}
\]
The columns \(\Sigma_{ab}\) consist of the components of the
three normalized forms. [E02A curvature velocity and compatibility](04A_NONLINEAR_Q_20261122.md).

For the already audited relative spatial estimates, the symmetric
part of \(P_c\) is \(T_c-\tfrac13 h_cI\). In an eigenframe of \(S\)
with eigenvalues \(s_i>0\), the off-diagonal coefficients of
\(\operatorname{skew}P_c\) are
\((s_j-s_i)(T_c)_{ij}/(s_i+s_j)\), so its norm is at most
\(|T_c|\). Since \(\operatorname{tr}T_c=0\) and \(|q|^2\le6\),
the symmetric part has squared norm at most \(3|T_c|^2\).
Orthogonality of the two parts and a squared component sum give
\(|P|\le2|T|\). The Bianchi compatibility inverse and wedge
bound give \(|b|\le\sqrt3|P|\le2\sqrt3|T|\). Hence
\(|B|=\sqrt2|b|\le2\sqrt6|T|<5|T|\) when \(|T|>0\), and
\(B=0\) if \(T=0\). These estimates use positive \(S\) to define
the ratios, with no positive lower eigenvalue in their constants.
[E03A relative bounds](05A_REAL_TWISTOR_COMPARISON_20261122.md)
and [E09 relative Sylvester calculation](11_TRANSPORT_CURVATURE_COMPARISON_20261122.md).

The full two-base-slot norm satisfies
\[
 |\mathcal D|
 \le|\nabla^A N|+2|P|\,|N|
 \le36|\nabla^A T|+300|T|^2 .
\]
Here \(|[P_a,N^c]|\le2|P_a||N^c|\), and the independent
base index sums factor as above. To bound the first two terms
of (3), set \(E_{ab}^{\rm aux}=\mathcal D_a{}^c\Sigma_{cb}\)
as a full covariant two-tensor. In an orthonormal coframe,
for fixed \(a,i\) its covector in \(b\) is the sum over \(j=1,2,3\)
of \(J_j\) applied to the covector with components
\((\mathcal D_a{}^c)_{ij}\), where
\(J_j\eta=\iota_{\eta^\sharp}\Sigma_j\) is an isometry.
Cauchy–Schwarz over these three summands gives
\(\sum_{ab}|E_{ab}^{\rm aux}|^2\le 3|\mathcal D|^2\).
For the antisymmetrization with components
\(E_{ab}^{\rm aux}-E_{ba}^{\rm aux}\), the ordinary two-form
norm is at most \(\sqrt2|E^{\rm aux}|\), because
\(\sum_{a<b}|E_{ab}^{\rm aux}-E_{ba}^{\rm aux}|^2
\le 2\sum_{a,b}|E_{ab}^{\rm aux}|^2\).
The two terms together therefore have norm at most
\(\sqrt6|\mathcal D|\).

For the last term in (3), put \(J=\sum_cN^c(P_c+B_c)\).
Cauchy–Schwarz over \(c\) gives
\(|J|\le |N|(|P|+|B|)\le252|T|^2\).
The norm of the resulting \(E\)-valued two-form \(J\Sigma\)
is \(\sqrt2|J|\) by \(\langle\Sigma_i,\Sigma_j\rangle=2\delta_{ij}\).
Thus
\[
 K^{-1}|S^{-1}F_t|
 \le4\bigl(\sqrt6(36|\nabla^A T|+300|T|^2)
              +252\sqrt2|T|^2\bigr)
 \le360|\nabla^A T|+4512|T|^2 ,
\]
using \(\sqrt6<5/2\), \(\sqrt2<3/2\). This proves (1).

## Reconstructed metric and relative eigenvalue velocities

Put \(\mathcal G=|\nabla^A T|+|T|^2\) and \(C_*=4512\sqrt2\).
At each evaluation time decompose
\(F_t=U\Sigma+V\Sigma^-\) in the reconstructed normalized
chiral bases. They are mutually orthogonal with squared norm two.
Pointwise curvature volume conservation in the fixed unadjusted
flow gives \(\mu_t=0\). Thus \(H_g=\widehat g^{-1}\widehat g_t\)
is trace-free. The differential of the positive-plane
reconstruction is \(\beta(H_g)=-K^{-1}S^{-1}V\), with
\(|\beta(H_g)|=|H_g|/2\). The normalized wedge quotient has
\(Z=-K^{-1}US\) and \(Q_t=Z+Z^T\) since \(\mu_t=0\).
Consequently
\[
 S^{-1}Q_tS^{-1}
    =-K^{-1}\left(S^{-1}U+(S^{-1}U)^T\right).
\]
On the one hand
\(|H_g|=2K^{-1}|S^{-1}V|\), and on the other
\(|S^{-1}Q_tS^{-1}|\le2K^{-1}|S^{-1}U|\).
Each is bounded by \(\sqrt2 K^{-1}|S^{-1}F_t|\). We have
\[
 \boxed{\quad |H_g|\le C_*\mathcal G,\qquad
      |S^{-1}Q_tS^{-1}|\le C_*\mathcal G .\quad}
 \tag{4}
\]
[E01A differential of reconstruction](../reviews/E01A_AUDIT_20261122.md)
and [E02A pointwise volume preservation](04A_NONLINEAR_Q_20261122.md).

For fixed \(x\), put \(\rho(t,x)=\|S^{-1}Q_tS^{-1}\|_{\rm op}\)
and use the fixed identification of \(E_x\) in time.
For any nonzero vector \(u\) in this fiber,
\[
 |\partial_t\log\langle u,Q u\rangle|
   =\frac{|\langle Su,(S^{-1}Q_tS^{-1})Su\rangle|}{|Su|^2}
   \le \rho(t,x).
\]
For any \(s\le t\) in the smooth interval, integrating this
uniform inequality over time gives
\[
 e^{-\int_s^t\rho(\sigma,x)\,d\sigma}Q(s,x)
       \ \le Q(t,x)\le\
 e^{\int_s^t\rho(\sigma,x)\,d\sigma}Q(s,x)
 \tag{5}
\]
as quadratic forms. Minimizing and maximizing Rayleigh quotients
over unit \(u\) shows that each of
\(\log m(t,x)\) and \(\log M_*(t,x)\), where \(m=\lambda_{\min}Q\)
and \(M_*=\lambda_{\max}Q\), changes in absolute value by at most
\(\int_s^t\rho\). This argument covers multiple eigenvalues.
For \(D=\sqrt{M_*/m}\), the absolute change of \(\log D\) obeys
the same bound. In particular the upper right Dini derivatives
of both \(\log D\) and \(-\log D\) are bounded by
\(\rho(t,x)\le C_*\mathcal G(t,x)\). This follows by dividing
the two-sided interval bound by its positive duration and using
continuity of \(\rho\) at the evaluation time.

Under a fixed internal gauge rotation these tensors conjugate
or rotate isometrically, and the metric and eigenvalues are
invariant. Time-dependent frame components use the corresponding
covariant temporal derivative in (1) and (4)–(5); ordinary
time differentiation would add the frame rotation. The base
identification here is fixed for the unadjusted equation, so
there is no additional transport term from a base vector field.

## Integrated conditional consequence and round check

Let the base be compact and closed, with a smooth definite
solution on \(0\le t<\tau\) and smooth definite initial data.
Use the time function and integral
\[
 H(t)=\sup_{x\in M}\mathcal G(t,x),\qquad
 J(t)=\int_0^t H(\sigma)\,d\sigma,\qquad
 J_\tau=\int_0^\tau H(\sigma)\,d\sigma .
\]
Assume \(J_\tau<\infty\). For any nonzero tangent vector \(X\)
at a fixed base point,
\(|\partial_t\log\widehat g(t)(X,X)|\le |H_g|\).
Integrating (4) gives for every \(t<\tau\), uniformly on \(M\),
\[
 e^{-C_*J(t)}\widehat g(0)\le\widehat g(t)
                       \le e^{C_*J(t)}\widehat g(0).
\]
Similarly \(\sup_{x\in M}D(t,x)\le D_0 e^{C_*J(t)}\), where
\(D_0=\sup_{x\in M}D(0,x)\) is finite by compactness and smooth
definiteness of the initial data. The direct minimum Rayleigh
bound from (5) gives the sharper exponent for the eigenvalue floor
\[
 m(t,x)\ge e^{-C_*J(t)}m(0,x)
       \ge D_0^{-2}e^{-C_*J(t)}
       \ge D_0^{-2}e^{-C_*J_\tau}>0 .
\]
The middle step uses \(m(0,x)=M_*(0,x)/D(0,x)^2\) and
\(\operatorname{tr}Q=3\), which implies \(M_*\ge1\).
All estimates are independent of an assumed later-time lower
eigenvalue bound. Metric comparison here is tensor comparison
on the fixed base against the initial reconstructed metric.

At the round chiral connection, \(Q=S=I\) identically,
\(b=0\), and \(T=\nabla^A T=0\). Equations (2)–(4)
give \(F_t=Q_t=\widehat g_t=0\) and \(D=1\), consistent
with the stationary round flow for the chosen \(K\).

The integral hypothesis supplies conditional temporal control
of the metric and normalized curvature eigenvalues on the
given smooth interval. Finiteness of the integral along a
general solution, control of higher derivatives or a suitable
parabolic gauge as the endpoint is approached, and smooth
continuation or convergence remain separate problems.
