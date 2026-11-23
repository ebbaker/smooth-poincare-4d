# SP4-CME-E03A real horizontal transport and the fiberwise quadrupole

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. The helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and the
selected lead's actual settings were unavailable. This is the fixed
algebraic and geometric verification of the [E03A request](../research-progress/handoffs/SP4-CME-E03A_REQUEST_v1.md)
under the [B02 decision](../brainstorm/notes/B02_REAL_TRANSPORT_DECISION_20261122.md).
See the [return](../research-progress/handoffs/SP4-CME-E03A_RETURN_v1.md)
for the checked input versions.

## Transport on the two sphere bundles

Let \(A\) be a smooth definite \(SO(3)\) connection on an oriented
Euclidean rank-three bundle \(E\to M\) over a smooth oriented real
four-manifold, with positive curvature plane and the round-compatible
sign. Use \(F=-KS\Sigma\), \(S=Q^{1/2}\), \(Q>0\),
\(\operatorname{tr}Q=3\), and fixed \(K>0\). The reconstruction has
\(\Sigma_i\wedge\Sigma_j=2\delta_{ij}dV_{\widehat g}\) and
\(\mu=2K^2dV_{\widehat g}\). The internal oriented orthonormal bracket
is \([e_i,e_j]=\epsilon_{ijk}e_k\). The isometry \(\Sigma/\sqrt2\)
identifies \(E\) with \(\Lambda^+_{\widehat g}\). Pull back the
Levi–Civita chiral connection to \(E\), write it as
\(\Gamma=\Gamma_A^+\), and put \(b=A-\Gamma\).
Source directions \(u\) and target directions \(f\) both have unit
length in \(E_x\) using this identification. The sphere-bundle map
and projection are
\[
 \Phi(x,u)=(x,\phi_x(u)),\qquad \phi_x(u)=Su/|Su|=f,\qquad
 P_f=I-f\otimes f.
\]
This is the curvature-ray relabeling with the round sign removed.
Each fiber map has inverse \(f\mapsto S^{-1}f/|S^{-1}f|\).
All fibers in this comparison use the unit round metric of area
\(4\pi\). Choose the same fiber complex orientation in both
labels, writing \(j_f v=f\times v\) in the associated round sphere
convention. A comparison to the source almost complex structure
uses the round calibration fixed by B02 and checked in E03B.

Given a base vector \(X\), take an \(A\)-horizontal lift, so
\(D_X^A u=0\). The vertical component of its image under
\(\Phi\), in the \(\Gamma\)-splitting, is
\[
 \begin{aligned}
 D_X^\Gamma(Su)&=(\nabla_X^A S)u-\operatorname{ad}(b_X)Su,\\
 \mathcal H_X(f)=D_X^\Gamma f
   &=P_f L_X f,\qquad
 L_X=(\nabla_X^A S)S^{-1}-\operatorname{ad}(b_X).
 \end{aligned} \tag{1}
\]
Here \(D^A,D^\Gamma\) act on sections and \(\nabla^A\) on
endomorphisms. Normalization differentiates by orthogonal projection
because both connections preserve the internal metric. Equation (1)
equivalently says
\(\Phi_* X^A=X^\Gamma+\mathcal H_X\), with \(X^A\) based at \(u\)
and \(X^\Gamma\) at \(f\). In the reverse comparison
\(\Phi_*^{-1}X^\Gamma=X^A-(d_u\phi)^{-1}\mathcal H_X\).
At fixed \(x\), for \(v\perp u\), and along a smooth time path in a
fixed internal identification, respectively,
\[
 d_u\phi(v)=P_f Sv/|Su|,\qquad
 \left.\partial_t f\right|_u=P_f(S_t S^{-1})f .
 \tag{2}
\]
For moving \(u(t)\) add \(d_u\phi(u_t)\). This time formula is
for \(E\) using the evolving adapted identification of the metric
target. A separately prescribed temporal identification of the
subbundles of \(\Lambda^2T^*M\) can have its own frame motion.

The horizontal structure in the primary definite-connection
construction uses the source connection and the curvature ray.
The metric twistor construction uses Levi–Civita horizontal
transport. The primary remarks explicitly distinguish the two
almost complex structures. The metric twistor integrability
condition is \(W^+=0\) in the present chirality, obtained by
switching the chirality in the theorem stated for \(W_-=0\).
Its projectivized sphere bundle is available without a global
spin structure. [Fine–Panov v2, Definition 2.9 and Remark 2.10](https://arxiv.org/html/0802.3648v2)
and [Atiyah–Hitchin–Singer, Theorem 4.1 and Remarks, pp. 435–436](../../../../references/Atiyah.pdf).

In the round-calibrated sign, whenever the two horizontal
actions use the same base complex structure \(J_f\) indexed by
the target ray, their comparison in the \(\Gamma\)-splitting
has lower-left block
\(\mathcal H_{J_f X}-j^\Phi_f\mathcal H_X\), where
\[
  j^\Phi_f=(d_u\phi)\,j_u\,(d_u\phi)^{-1}.
 \tag{3}
\]
This follows by applying the source almost complex structure
to \(\Phi_*^{-1}X^\Gamma\), then pushing forward using (1).
In the vertical block the discrepancy is \(j^\Phi_f-j_f\).
It is a separate effect of the fiber differential.
The path of positive endomorphisms \((1-r)I+rS\), \(0\le r\le 1\),
shows that \(\phi\) preserves the chosen orientation. In oriented
singular frames for \(d_u\phi\), with positive singular values
\(\sigma_1\le\sigma_2\), the matrix difference has off-diagonal
entries \(1-\sigma_1/\sigma_2\) and
\(\sigma_2/\sigma_1-1\). Consequently its operator norm is
\(\sigma_2/\sigma_1-1\). Put \(m=\lambda_{\min}(Q)\) and
\(M_*=\lambda_{\max}(Q)\). The projection in (2) is the distance
to the line spanned by \(Su\), so for \(v\perp u\)
\[
 \sqrt{m/M_*}\,|v|\le |d_u\phi(v)|\le\sqrt{M_*/m}\,|v|,\qquad
 \sup_u\frac{\sigma_2}{\sigma_1}=\sqrt{M_*/m}.
\]
For the equality in the ratio take \(u\) along a middle
eigenvector; the common denominator \(|Su|\) cancels in the
ratio. Conformality of every vertical differential therefore
requires \(Q=I\) with this trace convention.
[Pointwise direction-distortion calculation](03_direction_distortion_check_20261122.md).

## Frame changes and the complete projective fiber

Under a base-dependent \(R(x)\in SO(3)\), take component columns
\(u'=Ru,\ f'=Rf,\ S'=RSR^{-1}\). The connection matrices
on the two sides both transform by
\(\mathcal A'_X=R\mathcal A_XR^{-1}-(X R)R^{-1}\), so
\(\nabla_X^A S\) and \(\operatorname{ad}(b_X)\) transform
by conjugation. It follows that \(L'_X=RL_XR^{-1}\) and
\(\mathcal H'_X(Rf)=R\mathcal H_X(f)\). The same conjugation
holds for the symmetric and skew matrix parts below. In overlap
coordinates a base-dependent rotation acts by a Möbius
transformation on each sphere. The derivative with respect to
base of that transformation occurs in both compared lifts and
cancels upon subtraction. Hence the resulting vertical field
obeys the ordinary vertical Jacobian transformation law. This
allows arbitrary overlapping local \(SO(3)\) frames.

For a fixed oriented frame at a base point take the sphere
charts \(\zeta=(f_1+i f_2)/(1+f_3)\) and
\(w=(f_1-i f_2)/(1-f_3)=1/\zeta\). For a real tangent vector
field \(Y\), its \((1,0)\) section is
\(Y^{1,0}=(Y-i jY)/2=y_\zeta\partial_\zeta\), with
\(y_\zeta=d\zeta(Y)\). On the overlap
\[
 y_w(w)=-\zeta^{-2}y_\zeta(\zeta).
 \tag{4}
\]
This is the vertical holomorphic tangent bundle transition
\(\mathcal O(2)=T^{1,0}\mathbb{CP}^1\), for smooth sections
as well as holomorphic sections. A holomorphic section must
be a polynomial of degree at most two in \(\zeta\), by (4)
and regularity at \(w=0\). The field \(P_fL_X f\) is antipodally
equivariant as a real tangent field:
\(\mathcal H_X(-f)=-\mathcal H_X(f)=d(-\mathrm{Id})_f\mathcal H_X(f)\).
The antipodal map has \(\zeta\mapsto-1/\bar\zeta\); on
common finite, nonzero coordinates this yields
\[
 y_\zeta(-1/\bar\zeta)=\bar\zeta^{-2}\,\overline{y_\zeta(\zeta)}
 \tag{5}
\]
for an equivariant real field. Applying the rule twice is the
identity. These patch formulas describe the globally defined
vertical section on each complete sphere, independent of any
global product or spin lift.

## Holomorphic projection and moments

Decompose \(L_X=T_X+\Omega_X+\operatorname{tr}(L_X)I/3\)
into symmetric trace-free, skew and scalar parts, respectively.
Then
\[
 \mathcal H_X(f)=\Omega_X f+\mathcal R_X(f),\qquad
 \mathcal R_X(f)=P_f T_X f
   =\operatorname{grad}_{S^2}(\tfrac12 f^T T_X f).
\]
Under \(Y\mapsto Y^{1,0}\) the real forms of the holomorphic
vector fields are precisely the six-dimensional real linear
span of \(a\times f\) and \(P_f a\), \(a\in E_x\).
Rotations preserve the round complex structure. Multiplication
of their \((1,0)\) sections by \(i\) is the real action of \(j\),
and \(j_f(a\times f)=P_fa\). The two real subspaces are
independent by antipodal parity in the ambient Euclidean
components, and (4) gives complex dimension three, so they
span the space. Now \(\mathcal R_X\) is a sphere gradient,
orthogonal to the divergence-free rotation fields by
integration by parts. Its ambient components are odd under the
antipodal map, whereas \(P_f a\) is even. Their integrated
real pairing is therefore zero. This proves the claimed real
orthogonal projection onto \(\Omega_X f\).

With \(h(Z,W)=g_{{\rm rd},\mathbb C}(Z,\bar W)\), linear in
its first argument, the corresponding Hermitian pairing is
\[
 h(Y^{1,0},Z^{1,0})
   =\tfrac12\bigl(g_{\rm rd}(Y,Z)+i\,g_{\rm rd}(Y,jZ)\bigr).
\]
For example \(g_{\rm rd}=4|d\zeta|^2/(1+|\zeta|^2)^2\)
and \(h(\partial_\zeta,\partial_\zeta)=2/(1+|\zeta|^2)^2\).
The real orthogonality to both parts of the six-dimensional
space proves Hermitian orthogonality as well. The Hermitian
\(L^2\) projector is thus the \((1,0)\) part of the real rotation
field. A convention with \(2h\) multiplies squared norms by two
without changing the projector. All projection measures here
use the round area on the target sphere \(f\); the domain area
does not enter through an unaccounted change of variables.

Rotation invariance and taking traces give
\[
 \int f_i f_j\,dA=\tfrac{4\pi}{3}\delta_{ij},\qquad
 \int f_i f_j f_k f_\ell\,dA
 =\tfrac{4\pi}{15}
  (\delta_{ij}\delta_{k\ell}+\delta_{ik}\delta_{j\ell}
                              +\delta_{i\ell}\delta_{jk}).
\]
Here and below \(|\cdot|\) on a matrix is the Frobenius norm.
Since \(|P_fT_X f|^2=f^TT_X^2 f-(f^TT_X f)^2\), for
trace-free \(T_X\) this gives the real and Hermitian identities
\[
 \int|\mathcal R_X|^2\,dA=\frac{4\pi}{5}|T_X|^2,\qquad
 \int|\mathcal R_X^{1,0}|_h^2\,dA=\frac{2\pi}{5}|T_X|^2 .
\]
The same moments give
\[
 \int\mathcal R_X\otimes f\,dA=\frac{4\pi}{5}T_X,\qquad
 \int(\Omega_X f)\otimes f\,dA=\frac{4\pi}{3}\Omega_X .
\]
Thus the symmetric and skew parts of the moment of the full
field recover \(T_X\) and \(\Omega_X\) with the reciprocal
coefficients. The rotation squared norm is
\((4\pi/3)|\Omega_X|^2\). These formulas use only round area,
the Euclidean internal metric and tensor contractions, so the
moments and projectors commute with the frame changes above.

## Recovering horizontal derivatives and their constants

Write \(N_X=\nabla_X^A Q\), \(D_X=(\nabla_X^A S)S^{-1}\).
The endomorphisms \(S\) and \(\nabla_X^A S\) are symmetric, so
the Sylvester identity gives
\[
 D_X+D_X^T=S^{-1}N_XS^{-1},\qquad
 T_X=\tfrac12(S^{-1}N_X S^{-1})_0,\qquad
 \Omega_X=\operatorname{skew}(D_X)-\operatorname{ad}(b_X).
\]
Since \(N_X\) is trace-free and \(\operatorname{tr}Q=3\),
\[
 \operatorname{tr}L_X=\operatorname{tr}D_X=-\operatorname{tr}(QT_X),
 \qquad
 N_X=2S T_X S-\tfrac23\operatorname{tr}(QT_X)Q .
 \tag{6}
\]
Thus the scalar part omitted by \(P_f L_X f\) is recovered from
the known \(Q\) and \(T_X\) in this trace normalization.
It is a scalar of the derivative of normalized curvature,
not the volume density of \(\widehat g\).

The inverse operator in (6) on trace-free symmetric endomorphisms
is self-adjoint for the Frobenius pairing. In an eigenframe of
\(Q\), half its quadratic form is the sum of
\(\sqrt{\lambda_i\lambda_j}(T_X)_{ij}^2\) over \(i\ne j\),
and the weighted variance of the diagonal entries \(t_i\),
\(\sum_i\lambda_i(t_i-\bar t)^2\), with
\(\bar t=\sum_i\lambda_i t_i/3\). The variance is bounded below
by \(m\sum_i t_i^2\) since \(\sum_i t_i=0\), and above by
\(M_*\sum_i t_i^2\). Hence the estimates in the
specified norms are
\[
 2m|T_X|\le|\nabla_X^A Q|\le2M_*|T_X|\le6|T_X|,\qquad
 |\nabla_X^A Q|
   \le 6\sqrt{5/(4\pi)}\,\|\mathcal R_X\|_{L^2(S^2)} .
\]
The upper constants use the trace constraint alone. The
estimate in the other direction uses a factor \(1/(2m)\).
In an \(S\)-eigenframe the Sylvester equation also gives
\(|\nabla_X^A S|\le|N_X|/(2\sqrt m)\), since each denominator
is \(s_i+s_j\). In particular
\(\sup_f|\mathcal H_X(f)|\le |N_X|/(2m)+|b_X|\).
The same Sylvester identity and inverse apply to \(N=Q_t\)
and the strain \(\operatorname{sym}_0(S_t S^{-1})\)
for the fixed temporal identification in (2), giving
\(\sup_f|\left.\partial_t f\right|_u|\le |Q_t|/(2m)\).

In an \(S\)-eigenframe with \(s_i=\sqrt{\lambda_i}\), the
off-diagonal entries of \(\operatorname{skew}(D_X)\) are
\((s_i-s_j)(T_X)_{ij}/(s_i+s_j)\), using (6).
Thus \(|\operatorname{skew}(D_X)|\le|T_X|\) and
\(|b_X|\le(|\Omega_X|+|T_X|)/\sqrt2\) since
\(|\operatorname{ad}(b_X)|=\sqrt2\,|b_X|\).
Also \(|Q-I|^2\le6\) and
\[
 |D_X|^2=|T_X|^2+|\operatorname{skew}(D_X)|^2
                       +|\operatorname{tr}(QT_X)|^2/3
          \le4|T_X|^2 .
\]
Take squared sums in an orthonormal base coframe to define the
norms of these endomorphism-valued one-forms. The compatibility
identity gives
\(d_A\Sigma=-[S^{-1}(\nabla^A S)]\wedge\Sigma\), with
\(|b|\le|d_A\Sigma|\le\sqrt3\,|S^{-1}\nabla^A S|\).
The last factor \(\sqrt3\) comes from Cauchy–Schwarz over the
three wedge factors, which become isometries after Hodge star
in the stated normalization. Since
\(S^{-1}\nabla_X^A S=D_X^T\), it follows that
\[
 |b|_{\widehat g}\le 2\sqrt3\,|T|_{\widehat g}.
\]
This gives an additional conversion from measured remainder
to compatibility without an assumed eigenvalue floor.
[Compatibility and the wedge estimate](04A_NONLINEAR_Q_20261122.md).

All base-norm inequalities above are relative to the
reconstructed metric. For comparison with a reference \(g_*\),
if \(c_-g_*\le\widehat g\le c_+g_*\) then a one-form
norm lies between \(c_+^{-1/2}\) and \(c_-^{-1/2}\) times
its \(g_*\) norm. A constant scaling
\(\widehat g\mapsto c\widehat g\) rescales one-form norms by
\(c^{-1/2}\). The scalar density \(\mu/(2K^2)\) alone
cannot supply \(c_\pm\). No \(K\) occurs in the normalized
fiber identities because \(\Sigma/\sqrt2\) is an isometry
and the curvature factor cancels in the ray.

## Round check and scope

At the round chiral connection \(Q=S=I,\ b=0\) and
\(\nabla^A S=0\). Equations (1)–(3) give
\(\mathcal H=0,\ \phi=\mathrm{Id}\), and zero vertical
complex-structure discrepancy. In the round-calibrated
comparison the full lift agrees. It is also stationary
under the normalized connection flow.

The earlier chiral descent manuscript's
`prop:general-chart` and `eq:general-jet-chart` use a
holomorphic fibration to \(\mathbb{CP}^1\), a complete line
family and normal bundle \(\mathcal O(1)\oplus\mathcal O(1)\).
The generalized isothermal manuscript's `lem:descent`
obtains holomorphic \(\mathcal O(1)\) coefficients with fiber
triviality and a given holomorphic partial connection.
These are the premises of those first-jet and descent arguments.
The calculation here uses the real sphere bundle's intrinsic
vertical \(\mathcal O(2)\), as selected in B02.
[Chiral descent, general first-jet chart](../../../initial-investigations/02_chiral_descent_and_double_copy/manuscript/chiral_connection_descent_and_double_copy.tex)
and [generalized isothermal wave metrics, `lem:descent`](../../../initial-investigations/01_generalized_isothermal_coordinates/manuscript/generalized_isothermal_wave_metrics.tex).

The measured remainder determines the relative horizontal strain
and controls \(\nabla^A Q\) and \(b\) in the reconstructed base
norms. Bounds on this remainder along the nonlinear flow, a
uniform bound on vertical distortion or reconstructed geometry,
and a generalized isothermal chart theorem remain separate
dependencies. The fiberwise projection does not test ambient
integrability or bound \(W^+\). Fine–Panov was re-read in primary
HTML at the cited passages and Atiyah–Hitchin–Singer visually
checked in the existing PDF at journal pp. 435–436 (PDF pp. 12–13).
