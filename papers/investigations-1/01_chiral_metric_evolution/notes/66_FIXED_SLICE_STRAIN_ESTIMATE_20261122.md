# SP4-CME-E66 — Real strain controls the critical pair in the fixed round slice

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and selected
lead settings were unavailable. The four frozen input digests matched
the [request][req] before use. See [B43][b43] and the [return][ret].

## Statement and conventions

Fix the smooth oriented standard round \(S^4\), the positive perfect
connection \(A_0\), and E47's native metric \(g_0\) and internal
negative Killing pairing. Write \(F_0=F_{A_0}\), \(d_0=d_{A_0}\),
\(S_0u=\iota_uF_0\), and \(D_0\) for the fixed derivative induced by
\(A_0\) and \(g_0\). Write \(\mu_0=dV_{g_0}\), so
\(F_{0i}\wedge F_{0j}=\delta_{ij}\mu_0\).
Define the Lorentz norm of a tensor with pointwise modulus \(f\) on
a volume space of volume \(V\) by
\(\|f\|_{4,1}=\int_0^V s^{-3/4}f^*(s)\,ds\), and the reference
\(W^{2,(4,1)}\) norm by \(\sum_{j=0}^2\|D_0^j a\|_{4,1;0}\).
The reference norm is understood on all terms except when a live
metric is indicated. [E47, setting and (2)][e47].

There are \(\rho>0\) and \(C<\infty\) fixed by the round reference
and, for the Besov norm, the specified localization, such that every
smooth \(A=A_0+a\) with \(\beta=F_A-F_0\) satisfying
\[
 S_0^*a=0,\qquad d_0^*a=0,\qquad
 \|a\|_{\infty;0}+\|\beta\|_{\infty;0}\le\rho                         \tag{1}
\]
obeys
\[
 \|a\|_{W^{2,(4,1)}}+
 \|(a,\beta)\|_{B^{1/2}_{8,1},\mathrm{loc}}
 \le C\|T(A)\|_{4,1;g_A}.                                            \tag{2}
\]
Here \(T_X=\tfrac12(S^{-1}\nabla_X^A Q S^{-1})_0\), \(S=Q^{1/2}\),
is the real strain and \(g_A\) is the live curvature metric in the
same native normalization. The norm \(B^{1/2}_{8,1},\mathrm{loc}\)
uses the E59 fixed partition, frames and zero extensions to the flat
unit torus, summed over pieces. E59 writes the construction in a
different fixed scaling. We use its localization and apply its
algebraic metric argument with the native pairing and volume fixed
here. Conditions (1) are imposed on the given connection. No
higher derivative enters the smallness threshold.
[E03A (6)][e03a] · [E59 (1)–(3), (7)–(8)][e59].

## Fixed elliptic estimates in strong norms

Set \(M=\operatorname{tf}L_0\), where
\(L_0(c)_{ij}=\tfrac12((c_i,F_{0j})_0+(c_j,F_{0i})_0)\).
E47 gives \(P_0=\sqrt8\,M\) and
\[
 G_0=d_0^*P_0^*P_0d_0+S_0\Delta_0 S_0^*+d_0d_0^*,                    \tag{3}
\]
where \(\Delta_0=(\nabla^{g_0})^*\nabla^{g_0}\) on vector fields.
Its principal symbol has a uniformly positive quadratic lower bound
at each unit covector. Its positive \(L^2\) realization has domain
\(H^2\), positive lower spectral bound, bounded inverse
\(L^2\to H^2\), and maps smooth forcing to smooth solutions by
higher-order regularity. We use these E47 conclusions.
[E47 (1)–(4), form and regularity argument][e47].

Here is the local \(p=8\) argument. In a smooth frame orthonormal in
the fixed fiber pairing, write the frozen principal operator in a
coordinate patch as \(L_*=-A^{lm}(x_*)\partial_l\partial_m\) and
\(A_*(\xi)=A^{lm}(x_*)\xi_l\xi_m\). Use the Fourier convention
\(\partial_l\mapsto i\xi_l\). On compact coordinate subcharts,
\(A_*(\xi)\ge c|\xi|^2I\) for one \(c>0\), by metric comparability.
The matrix multiplier for \(\partial_i\partial_jv\) applied to
\(L_*v\) is
\[
 m_{ij}(\xi)=-\xi_i\xi_j A_*(\xi)^{-1},\qquad \xi\ne0.                \tag{4}
\]
It is homogeneous of degree zero and uniformly bounded by
ellipticity. Its derivatives of each fixed order are uniformly
bounded on the unit annulus by differentiating the matrix inverse.
For a smooth annular \(\varphi\) with
\(\sum_{\ell\in\mathbb Z}\varphi(2^{-\ell}\xi)=1\) off zero,
let \(K_\ell\) be the inverse transform of
\(\varphi(2^{-\ell}\xi)m_{ij}(\xi)\).
Scaling and integration by parts on the fixed annulus give, for
\(|\gamma|\le1\) and any fixed \(N\),
\[
 |\partial^\gamma K_\ell(x)|
 \le C_N 2^{(4+|\gamma|)\ell}(1+2^\ell|x|)^{-N}.
\]
For \(x\ne0\), summation at scales \(2^\ell |x|\le1\) and \(>1\)
gives \(K=\sum_\ell K_\ell\) with
\(|K(x)|\le C|x|^{-4}\), \(|\nabla K(x)|\le C|x|^{-5}\).
Finite partial multipliers converge strongly on \(L^2\) by
Plancherel and bounded overlap. For compactly supported \(L^1\cap
L^2\) data their kernels converge off the support to convolution
with \(K\), by the summed bound and the separation from the support.
The same bounds hold for the adjoint multiplier
\(m_{ij}(\xi)^*\). This is the Euclidean elliptic counterpart of the
decomposition in [E41, parabolic Calderón–Zygmund estimate][e41].

For completeness, let \(\mathscr M\) denote either multiplier.
For vector \(f\in L^1\cap L^2(\mathbb R^4)\), the maximal dyadic cubes
\(Q\) where the average of \(|f|\) exceeds \(\lambda>0\) are
disjoint, have total measure at most \(\|f\|_1/\lambda\), and each
average is at most \(2^4\lambda\) by its parent cube. Write \(f=g+
\sum_Q b_Q\), using \(g=f_Q\), the vector average, on each cube
and \(g=f\) off the cubes, and
\(b_Q=(f-f_Q)1_Q\). Dyadic differentiation gives
\(\|g\|_\infty\le 2^4\lambda\) and
\(\|g\|_2^2\le 2^4\lambda\|f\|_1\).
The \(L^2\) estimate controls
\(|\{|\mathscr M g|>\lambda/2\}|\).
For each \(b_Q\) use \(\int b_Q=0\). Outside a fixed enlargement
\(Q^*\), subtract \(K(x-x_Q)\) from \(K(x-y)\) for \(y\in Q\).
The derivative bound gives an integral in \(x\) of the norm of
this difference at most
\(C\ell(Q)\int_{|x-x_Q|\ge c\ell(Q)}|x-x_Q|^{-5}\,dx\le C\).
Thus \(\|\mathscr M b_Q\|_{L^1((Q^*)^c)}\le C\|b_Q\|_1\).
The bad parts converge in \(L^2\) over increasing finite unions by
disjoint support and the bound on \(g\). Applying the \(L^2\)
operator, taking an almost everywhere convergent subsequence and
using Fatou gives the same \(L^1\) sum bound outside the union
of enlarged cubes. Its measure is at most \(C\|f\|_1/\lambda\).
This proves weak \((1,1)\) for the multiplier and its adjoint.

For \(1<p<2\), split \(f\) at magnitude \(\lambda\), using weak
\((1,1)\) on \(f1_{|f|>\lambda}\) and strong \((2,2)\) on
\(f1_{|f|\le\lambda}\) at output threshold \(\lambda/2\). Multiply
the resulting distribution bounds by \(p\lambda^{p-1}\) and
integrate in \(\lambda\). Tonelli integrates
\(\lambda^{p-2}\) over \(0<\lambda<|f(x)|\) and
\(\lambda^{p-3}\) over \(|f(x)|<\lambda<\infty\).
The integrals are finite for \(1<p<2\) and the bound is a constant
times \(\int |f|^p\). Density extends the multiplier on those
spaces. For the adjoint use \(p=8/7\) and take the dual to obtain
the \(L^8\) bound for \(m_{ij}\), agreeing with its \(L^2\) action
on common data by pairing with smooth compactly supported tests.
In particular
\(\|\partial^2v\|_8\le C_*\|L_*v\|_8\) for smooth compactly
supported \(v\), with uniform \(C_*\) on the fixed coordinate
subcharts. The proof uses matrix norms throughout.

Shrink a finite cover of charts so the leading coefficient
variation times \(C_*\), including the finite number of derivative
components, is at most \(1/2\). For a compactly supported
localized \(v\), compare \(L_*v\) with \(G_0v\) and absorb the
leading coefficient difference. The smooth lower coefficients
cost \(C(\|\partial v\|_8+\|v\|_8)\). Commuting \(G_0\) with the
cutoffs adds terms of order at most one, all with fixed coefficients.
Sum the resulting estimates and reconstruct using the partition
of unity. Changes between coordinate derivatives and \(D_0^j\)
use fixed bounded frame, connection and density comparisons.
This gives an inequality with left side \(\|D_0^2 u\|_8\) and
right side \(C(\|G_0u\|_8+\|D_0u\|_8+\|u\|_8)\).
For compactly supported \(v\), subtract convolution with a
normalized smooth mollifier of scale \(h\) from \(\partial v\)
and use straight translations to estimate the difference by
\(C h\|\partial^2v\|_8\). The remaining convolution is bounded
by \(C h^{-1}\|v\|_8\) by moving the derivative to its kernel.
Summing in the fixed charts and absorbing the resulting
\(C h\|D_0u\|_8\) term from the cutoff derivatives gives
\(\|D_0u\|_8\le C h\|D_0^2u\|_8+C_h\|u\|_8\) for small \(h\).
A further fixed small \(h\) absorbs the first-order remainder
and yields
\[
 \sum_{j=0}^2\|D_0^j u\|_8
 \le C(\|G_0u\|_8+\|u\|_8).                                         \tag{5}
\]

The fixed \(H^2\to L^8\) bound used to remove the last term
can also be seen from kernels. On \(\mathbb R^4\), express
\(v=(I-\Delta)^{-1}(I-\Delta)v\) and split the Bessel multiplier
into a smooth low block and annular blocks of radius \(2^\ell\)
for \(\ell\ge1\). Each annular rescaled symbol is \(2^{-2\ell}\)
times a smooth function uniformly bounded in each fixed derivative
order on the unit annulus. Its kernel \(L^{8/5}\) norm is at most
\(C2^{-2\ell}2^{(3/2)\ell}=C2^{-\ell/2}\) by rescaling and
integration by parts. The low kernel has finite \(L^{8/5}\) norm.
The sum converges as an \(L^2\to L^8\) operator by Young's
inequality and agrees with \(v\) in distributions for
\((I-\Delta)v\). Localize \(u\) in the same fixed charts to get
\(\|u\|_8\le C\|u\|_{H^2}\).
For smooth \(f\), E47 and finite volume now give
\[
 \|G_0^{-1} f\|_8\le C\|G_0^{-1}f\|_{H^2}
                  \le C\|f\|_2\le C'\|f\|_8 .
\]
Thus (5) bounds \(D_0^jG_0^{-1}\) on \(L^8\) for \(0\le j\le 2\).
For general \(L^8\) data, smooth approximations converge in \(L^8\)
and \(L^2\). The \(W^{2,8}\) limit given by (5) agrees with the
\(H^2\) limit given by the \(L^2\) inverse. The two endpoint
operators therefore agree for every common input.

## Lorentz estimate for the fixed inverse

For any tensor \(h\), let \(A_2=\|h\|_2\), \(A_8=\|h\|_8\).
The distribution bound gives
\(h^*(s)\le\min(A_2s^{-1/2},A_8s^{-1/8})\).
For positive \(A_2,A_8\), integrate \(s^{-3/4}\) times this
minimum, extending the majorant to \(0<s<\infty\). The switch is
at \(s_*=(A_2/A_8)^{8/3}\). The integral below it is
\(8A_8s_*^{1/8}\) and above it is \(4A_2s_*^{-1/4}\). Thus
\[
 \|h\|_{4,1}\le12\|h\|_2^{1/3}\|h\|_8^{2/3}.                         \tag{6}
\]
If either norm vanishes, \(h=0\).

The layer identity, by Tonelli for \(f^*\), is
\[
 \|f\|_{4,1}=4\int_0^\infty \mu_f(v)^{1/4}\,dv,\qquad
 \mu_f(v)=\nu(\{|f|>v\})                                               \tag{7}
\]
for the underlying measure \(\nu\). The norm used here is complete.
Indeed, put \(J_f(s)=\int_0^s f^*(y)\,dy\).
Since \(\nu\) is nonatomic, \(J_f(s)=\sup_{\nu(E)=s}\int_E |f|\).
Writing \(s^{-3/4}\) as its value at \(V=\nu(S^4)\) plus
\(\tfrac34\int_s^V y^{-7/4}dy\) gives
\[
 \|f\|_{4,1}=V^{-3/4}J_f(V)+\tfrac34\int_0^V s^{-7/4}J_f(s)\,ds .
\]
This representation gives the triangle inequality and
\(\|f\|_1\le V^{3/4}\|f\|_{4,1}\). A norm Cauchy sequence tends
to \(f\) in \(L^1\). For differences with a fixed member,
\(J_f(s)\) is continuous in \(L^1\) at each \(s\) by its
supremum formula. Fatou and the Cauchy property then give norm
convergence. The same proof applies to the other finite-volume
spaces used below. [E53, endpoint norm and completeness][e53].

Let \(B_j=D_0^jG_0^{-1}\), with endpoint operator norms
\(b_{j,2},b_{j,8}\) at \(2,8\).
Write \(f=e|f|\) with \(e=f/|f|\) wherever \(|f|>0\) and zero
elsewhere. The vector layer \(f_v=e1_{\{|f|>v\}}\) has endpoint
norms \(\mu_f(v)^{1/2}\), \(\mu_f(v)^{1/8}\).
The endpoint operators apply to these arbitrary vector fields
and have the same action on them. By (6),
\[
 \|B_j f_v\|_{4,1}\le
 12 b_{j,2}^{1/3}b_{j,8}^{2/3}\mu_f(v)^{1/4}.                        \tag{8}
\]
For full \(f\in L^{4,1}\), \(v\mapsto f_v\) is continuous in
\(L^2\) and \(L^8\) at every \(v>0\) whose level set has zero
measure. There are at most countably many other levels.
This gives strong measurability at both endpoints and, by (6),
in \(L^{4,1}\) after applying \(B_j\). Equation (8) and
completeness allow integration in \(L^{4,1}\).
Also \(\int_0^\infty\mu_f(v)^{1/2}dv
\le V^{1/4}\int_0^\infty\mu_f(v)^{1/4}dv\), so the layer
integral is \(f\) in \(L^2\). This can be verified first by
integrating to a finite height and then by the displayed
\(L^2\) bound on the tail. Boundedness of \(B_j\) on \(L^2\)
shows its layer integral is \(B_j f\) there. The two output
integrals agree in \(L^1\) by the continuous embeddings.
Using (7) in (8) and summing gives
\[
 \|G_0^{-1}f\|_{W^{2,(4,1)}}
 \le C_G\|f\|_{4,1;0},\qquad
 C_G=3\sum_{j=0}^2 b_{j,2}^{1/3}b_{j,8}^{2/3}.                       \tag{9}
\]
The derivative components in (9) are distributional derivatives
of the same section, by the \(H^2\) realization.

## Curvature expansion, strain and absorption

Here and below write \(\operatorname{tf}\) for the trace-free
projection on symmetric endomorphisms. With \(\mu(F)=\tfrac13
\sum_i F_i\wedge F_i=dV_{g_A}\) and \(Q_{ij}=F_i\wedge F_j/\mu(F)\)
in native orthonormal frames, let
\[
 C(\beta)_{ij}=(\beta_i\wedge\beta_j)/\mu_0,\qquad
 \sigma=\tfrac13(2\operatorname{tr}L_0\beta+
                         \operatorname{tr}C(\beta)).
\]
The sign is fixed by self-duality of \(F_0\), which gives
\(\beta_i\wedge F_{0j}/\mu_0=(\beta_i,F_{0j})_0\). Therefore
\(F_i\wedge F_j/\mu_0=(I+2L_0\beta+C(\beta))_{ij}\) and
\(\mu(F)=(1+\sigma)\mu_0\). Subtracting the trace part yields
\[
 q=Q-I=\frac{2M\beta+\operatorname{tf}C(\beta)}{1+\sigma}
      =2M\beta+R(\beta),\qquad
 R(\beta)=\frac{\operatorname{tf}C(\beta)-2\sigma M\beta}
                 {1+\sigma}.                                      \tag{10}
\]
The reference \(F_0\) is parallel because the chiral identification
and inclusion into two-forms are parallel and the round curvature
scale is constant. Thus \(D_0F_0=D_0\mu_0=D_0M=0\).
Writing \(H=2M\beta\), direct differentiation gives
\[
 D_0q=\frac{D_0H+\operatorname{tf} D_0 C}{1+\sigma}
          -\frac{(H+\operatorname{tf} C)D_0\sigma}{(1+\sigma)^2},
 \qquad D_0H=2M D_0\beta .                                          \tag{11}
\]
Here \((D_0 C)_{ij}=(D_0\beta_i\wedge\beta_j+
\beta_i\wedge D_0\beta_j)/\mu_0\) in a parallel frame at the
point and \(D_0\sigma=(2\operatorname{tr}L_0D_0\beta+
\operatorname{tr}D_0 C)/3\). In a small reference value tube
where \(1+\sigma\) is bounded away from zero, (10)–(11) give
\[
 |q|\le C|\beta|,\quad |R|\le C|\beta|^2,\quad
 |D_0R|\le C|\beta||D_0\beta| .                                     \tag{12}
\]
All pointwise constants in this subsection can be fixed on a
single initial closed tube. [E47, linear normalization][e47] ·
[E59, parallel reference][e59].

The live conformal class is determined by the positive curvature
plane. In the fixed Hodge splitting, the plane near \(F_0\) is
the graph of \(F_-F_+^{-1}\). Its smooth local inverse to
volume-preserving metrics is the trace-free metric variation
argument in E59, and multiplication by \((1+\sigma)^{1/2}\)
in dimension four imposes the live volume. This gives
smooth dependence and
\[
 |g_A-g_0|_0\le C|\beta|,\qquad
 \tfrac12 g_0\le g_A\le\tfrac32g_0,\qquad
 \tfrac12\,dV_{g_0}\le dV_{g_A}\le\tfrac32\,dV_{g_0}                 \tag{13}
\]
after a fixed reduction of the tube radius. The same reduction
keeps \(Q>0\) and the curvature sign in the round component.
For a tensor \(W\) with one base covector slot and internal
endomorphism slots, \(|W|_0\le(3/2)^{1/2}|W|_{g_A}\).
The density in (13) gives
\(\mu_{|W|_0,0}(v)\le2\mu_{|W|_{g_A},A}(v/(3/2)^{1/2})\).
Equation (7) therefore yields
\[
 \|W\|_{4,1;0}\le 2^{1/4}(3/2)^{1/2}\|W\|_{4,1;g_A}.                \tag{14}
\]
In the other direction, (13) gives
\(\|W\|_{4,1;g_A}\le (3/2)^{1/4}\sqrt2\,\|W\|_{4,1;0}\)
by the same distribution argument. This applies to \(T\) and
\(N=\nabla^A Q\). The metric comparison needs only the values
of \(\beta\). [E59, metric construction][e59].

Under the native internal pairing the strain identity still
reads \(N_X=2ST_XS-\tfrac23\operatorname{tr}(QT_X)Q\).
It follows from \(S^{-1}N_XS^{-1}=2T_X+cI\) and
\(\operatorname{tr}N_X=0,\operatorname{tr}Q=3\).
The operator on trace-free symmetric matrices in this identity
is self-adjoint. Half its quadratic form is the sum of the
off-diagonal weights \(\sqrt{\lambda_i\lambda_j}(T_X)_{ij}^2\)
and the diagonal weighted variance. The variance is at most
\(\sum_i\lambda_i(T_X)_{ii}^2\), by evaluating at zero instead of
its minimizing weighted mean, and is nonnegative. Therefore
\(0\le \mathcal N\le 2\lambda_{\max}(Q)I\) for this operator,
hence \(|N_X|\le 2\lambda_{\max}(Q)|T_X|\le6|T_X|\).
Summing squared norms in a reference orthonormal base frame
and applying (14) gives
\[
 \|N\|_{4,1;0}\le 6\cdot 2^{1/4}(3/2)^{1/2}\|T\|_{4,1;g_A}.         \tag{15}
\]
The two fixed internal normalizations give the same matrices
for \(Q,N\) in their respective orthonormal frames. The base
covector norms are compared by (14).
[E03A (6) and its quadratic form][e03a].

Use the curvature convention
\(B(a)=\tfrac12[a\wedge a]\), so \(\beta=d_0a+B(a)\).
On the imposed slice the last two terms of (3) vanish. Inserting
\(P_0=\sqrt8\,M\) and (10) gives the exact signed formula
\[
 \begin{split}
 G_0a&=8d_0^*M^*M d_0 a\\
     &=4d_0^*M^*\big(q-R(\beta)-2M B(a)\big).
 \end{split}                                                       \tag{16}
\]
The adjoint \(d_0^*\) on forms is minus the \(D_0\) contraction
of the derivative in its first form slot. Since \(M^*\) is
parallel, the right side is bounded by a fixed multiplier times
\(|D_0q|+|D_0R|+|D_0B|\). On endomorphisms the change of
internal connection gives exactly
\[
 D_0q=\nabla^A Q-[\operatorname{ad}(a),q] .                           \tag{17}
\]
Indeed \(\nabla^A q=D_0q+[\operatorname{ad}(a),q]\), and \(I\)
has zero covariant derivative. \(Q\) is an endomorphism-valued
zero-form, so the difference of base Levi–Civita connections
does not enter (17).

The pointwise curvature and derivative estimates are
\[
 \begin{aligned}
 |\beta|&\le C(|D_0a|+|a|^2),\\
 |D_0\beta|&\le C(|D_0^2a|+|a||D_0a|),\\
 |D_0B(a)|&\le C|a||D_0a|,\\
 |[\operatorname{ad}(a),q]|&\le C|\beta||a| .
 \end{aligned}                                                     \tag{18}
\]
The first two use \(d_0=\operatorname{Alt}D_0\), parallel
alternation and the parallel internal bracket, with the derivative
order kept as written. No commute of the two derivative slots is
needed. For \(\rho\le1\), (12), (18) and (1) bound the error terms
in (16)–(17) by \(C\rho(|a|+|D_0a|+|D_0^2a|)\).
There is therefore a fixed \(C_{\rm err}\ge1\) and a fixed
\(C_{\rm str}\) incorporating (15) such that
\[
 \|G_0a\|_{4,1;0}
 \le C_{\rm str}\|T\|_{4,1;g_A}
       + C_{\rm err}\rho\|a\|_{W^{2,(4,1)}} .                         \tag{19}
\]
Choose a positive \(\rho\) at most the minimum of the geometric
tube radius used in (12)–(13), \(1\), and
\((2C_G C_{\rm err})^{-1}\). Apply (9) to \(f=G_0a\)
and absorb at most half the left side. This gives
\(\|a\|_{W^{2,(4,1)}}\le 2C_G C_{\rm str}\|T\|_{4,1;g_A}\).

## Localized critical pair norm

For a smooth finite-dimensional vector \(v\) on the flat unit
torus, E53's inverse-derivative identity on high blocks is
\[
 \Delta_jv=2^{-j}\sum_{i=1}^4K_{j,m_i}*\partial_i v,\quad
 m_i(\zeta)=\varphi(\zeta)\frac{\zeta_i}{2\pi i|\zeta|^2},
 \qquad j\ge1 .
\]
Let \(\mathscr L_j\) be the operator on vector fields given by
this right side, including the factor \(2^{j/2}\) from the norm.
The periodized kernel estimate in E53 (1), with exponents \(8/5\)
and \(1\), gives
\[
 \|\mathscr L_j f\|_8\le
   C\min(2^j\|f\|_2,\,2^{-j/2}\|f\|_8).
\]
This holds on arbitrary vector layers. For a layer of measure
\(m>0\) and unit modulus there, sum the first bound for
\(2^j\le m^{-1/4}\) and the second for \(2^j>m^{-1/4}\).
The two geometric sums are bounded by \(Cm^{1/4}\), and a
zero-measure layer contributes zero. Apply this to the layers
of \(f=\partial v\), use Minkowski on each block, then Tonelli
and (7) on the sum. This bounds the high-block part by
\(C\|\partial v\|_{4,1}\). This argument uses the same high-block
bounds as E53's full-gradient estimate. The low multiplier has
finitely many frequencies and each Fourier coefficient of \(v\)
is bounded by \(\|v\|_1\). Hence
\(\|\Delta_0 v\|_8\le\|\Delta_0 v\|_\infty\le C\|v\|_1\)
on the unit torus. In total
\[
 \|v\|_{B^{1/2}_{8,1}(\mathbb T^4)}
       \le C(\|v\|_1+\|\partial v\|_{4,1}).                          \tag{20}
\]
[E53 (1), high block identity and finite low block][e53].

Use the fixed E59 components \(v_\gamma=(\chi_\gamma U)_\gamma\)
of \(U=(a,\beta)\) in the localization charts, extended by
zero to the flat unit torus. The compact chart supports
make the extensions smooth, with no derivative at the seam.
In each supported patch let \(L_i(x)\) be the reference
connection matrix on the pair bundle in the chosen frames.
Then
\[
 \partial_i v_\gamma=
  \big(\chi_\gamma(D_0)_iU\big)_\gamma+
  (\partial_i\chi_\gamma)U_\gamma-L_i v_\gamma .
\]
All three terms are compared using the uniformly equivalent
reference and coordinate fiber norms on the fixed compact
patch supports. The coordinate density and reference volume
have fixed positive ratio bounds there, and the Lorentz
comparison is the one from the distribution argument in (14).
Use \(\|v_\gamma\|_1\le C\|v_\gamma\|_{4,1}\), which follows
from the finite-volume norm inequality proved above. Equation
(20) summed in the chosen atlas gives
\[
 \|(a,\beta)\|_{B^{1/2}_{8,1},\mathrm{loc}}
 \le C\big(\|a\|_{4,1;0}+\|D_0a\|_{4,1;0}
              +\|\beta\|_{4,1;0}+\|D_0\beta\|_{4,1;0}\big)
 \le C'\|a\|_{W^{2,(4,1)}} .                                        \tag{21}
\]
The second inequality is (18), using the imposed small value
bound on \(a\). This proves (2) using (19). All constants use
fixed geometric, elliptic, bracket, metric-tube and localization
factors. For the smallness threshold, the geometric tube and
elliptic absorption already suffice. [E59, localization (7)–(8)][e59].

The estimate holds for a given smooth connection in the exact
fixed slice (1). The proof supplies no automorphism bringing
other connections into that slice. Its \(B^{1/2}_{8,1}\) bound
is a static estimate for the compatible pair.
No new primary source was inspected or used.

[req]: ../research-progress/handoffs/SP4-CME-E66_REQUEST_v1.md
[ret]: ../research-progress/handoffs/SP4-CME-E66_RETURN_v1.md
[b43]: ../brainstorm/notes/B43_FIXED_SLICE_STRAIN_CONTROL_20261122.md
[e03a]: 05A_REAL_TWISTOR_COMPARISON_20261122.md
[e41]: 41_COMPACT_LINEAR_ESTIMATES_20261122.md
[e47]: 47_ROUND_STABLE_LINEAR_20261122.md
[e53]: 53_CRITICAL_FINITE_P_HEAT_20261122.md
[e59]: 59_CRITICAL_PATH_STRAIN_20261122.md
