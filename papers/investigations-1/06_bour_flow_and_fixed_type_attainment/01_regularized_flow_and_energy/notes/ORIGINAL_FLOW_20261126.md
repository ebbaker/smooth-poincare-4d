# Budgets on the original flow and their transfer to its outputs

26 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. BFE-E02/E03, [activation revision 1](../../research-progress/handoffs/ACTIVATION_20261126.md)
(Git blob `b64d40760156277852d69634a7870e64b57840bd`), fixed execution
with configured GPT-6.2 Sol/ultra and unavailable serving telemetry.
Input checkout `4da586548b445ccfe9145c6a5671c0f7ecd433f3`. The [source receipt](../../../../../references/SOURCE_NOTES_BOUR_ATTAINMENT_20261126.md),
[review F2](../../../../master/reviews/claude/EXTERNAL_PROGRAM_REVIEW_20261126.md#f2-the-extraction-problem-can-probably-be-replaced-by-a-fourth-order-flow-that-is-already-in-the-literature)
and [neck](../../../03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/marked_necks_and_chiral_energy.tex)
and [closed](../../../03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/closed_and_conformal_alternatives.tex)
alternatives are the versions at this checkout. The estimates apply on
any smooth interval of the stated flow. The extraction of its outputs
uses the fixed-parameter assertions of Bour v1, conditional here on
[BFE-E01](BOUR_AUDIT_20261126.md).

## Strict pinching and positivity at all smooth times

Let \(M\) be a fixed closed connected oriented smooth homotopy four-sphere.
Use smooth real Riemannian metrics, the Hilbert–Schmidt norms of \(W^\pm\)
on \(\Lambda^\pm\), the Hilbert–Schmidt norm of \(\mathrm{Rm}\) on
\(\Lambda^2\) when labeled \({\rm op}\), and the ordinary Ricci tensor norm.
Set \(E_\pm=\int |W^\pm|^2\,dV\), \(D=\int |\operatorname{Ric}_0|^2\,dV\),
\(S=\int R^2\,dV\), \(T=4\pi^2\), and \(I=I^+(M)<2T\). On the closed
source \(E_+=E_-=e\) by the signature identity. The Gauss–Bonnet identity
and the regularized functional are
\[
16\pi^2=2e+\frac{S}{24}-\frac{D}{2},
\qquad
\mathcal F^\alpha=(1-\alpha)2e+\frac{\alpha}{2}D
                 =2e+\frac{\alpha}{24}S-16\alpha\pi^2.
\]
These agree with Bour's double-form Weyl and Riemann norms. The Yamabe
constant here is the infimum of \(Q_g(u)/\|u\|_{4,g}^2\) for
\(Q_g(u)=\int(6|\nabla u|^2+Ru^2)\,dV\), hence six times Bour's constant.
[Bour v1, §1 and §4](https://arxiv.org/pdf/1012.0342v1#page=2)

Fix \(0<\alpha<1\) and take a positive volume-one Yamabe minimizer \(g_0\)
with \(e_0=e(g_0)<2T\). Put \(Y_0=Y([g_0])\) and \(\varepsilon=e_0-I\).
The Yamabe equation gives \(S_0=Y_0^2\). The sharp round comparison gives
\(Y_0^2\le (8\sqrt6\pi)^2=384\pi^2\). This uses the positive sign and the
round upper bound from localized Euclidean Yamabe tests.
[Lee–Parker, §3, Theorem 3.2 and Lemma 3.4](https://math.jhu.edu/~js/Math646/lee-parker.yamabe.pdf#page=13)

Writing \(F_0=\mathcal F^\alpha(g_0)\), the precise initial margin is
\[
m_\alpha=16\pi^2(1-\alpha)-F_0
        =2(2T-e_0)-\frac{\alpha Y_0^2}{24}.
\]
Thus strict admissibility holds exactly when
\(\alpha<48(2T-e_0)/Y_0^2\), for an \(\alpha\) already in \((0,1)\).
The sufficient condition \(\alpha<1-e_0/(2T)\) gives \(m_\alpha>0\)
and \(F_0\le 2e_0\). Starts with \(\varepsilon\le\alpha^2\) exist by
the definition of \(I\), conformal invariance of the two Weyl energies
and the solution of the Yamabe problem in each selected class.
[Lee–Parker, Introduction, Theorem A and the Yamabe problem](https://math.jhu.edu/~js/Math646/lee-parker.yamabe.pdf)

Impose the sufficient condition \(\alpha<1-e_0/(2T)\).
Let \(g_t\) solve \(\partial_t g=-2\nabla\mathcal F^\alpha(g)\)
smoothly on its original uncut interval. Differentiation gives
\[
\frac{d}{dt}\mathcal F^\alpha(g_t)
   =-2\|\nabla\mathcal F^\alpha(g_t)\|_{2,g_t}^2.
\]
Scale invariance gives
\(\int_M\operatorname{tr}_g(\nabla\mathcal F^\alpha)\,dV_g=0\), by
differentiating in the direction \(g\). Thus the total volume stays
one. Nonnegativity of \(D\) gives, at every smooth time,
\[
e(g_t)\le\frac{\mathcal F^\alpha(g_t)}{2(1-\alpha)}
       \le\frac{F_0}{2(1-\alpha)}
        =2T-\frac{m_\alpha}{2(1-\alpha)}
       \le\frac{e_0}{1-\alpha}
       <2T .
\]
Apply Gauss–Bonnet on a volume-one Yamabe minimizer \(q_t\) of the
slice's class. Conformal invariance of \(e\) gives
\[
Y([g_t])^2=48(2T-e(g_t))+12D(q_t)
            \ \ge\ \frac{24m_\alpha}{1-\alpha}.
\]
This directly verifies a lower bound on the square in the strictly
pinched range, as in Bour's Lemma 4.5. The Yamabe sign is the sign of
the first eigenvalue of \(-6\Delta_g+R_g\). This eigenvalue is
continuous by min–max under smooth variation on compact \(M\).
As the square bound precludes zero and the initial sign is positive,
the positive square root gives a lower bound throughout the smooth
interval. In particular \(I\le e(g_t)\) on the fixed type \(M\).
[Bour v1, Lemma 4.5](https://arxiv.org/pdf/1012.0342v1#page=19)

## Physical energy bounds and a uniform margin

Monotonicity in the two expressions for \(\mathcal F^\alpha\), and the
lower bound \(e(g_t)\ge I\), give
\[
\begin{aligned}
D(g_t)&\le D(g_0)+\frac{4(1-\alpha)}{\alpha}\varepsilon
       =4I+\frac{4\varepsilon}{\alpha}
          +\frac{Y_0^2-384\pi^2}{12}
       \le4I+\frac{4\varepsilon}{\alpha},\\[2pt]
S(g_t)&\le Y_0^2+\frac{48\varepsilon}{\alpha}.
\end{aligned}
\]
The equality in the first line uses the closed Gauss–Bonnet formula
on \(g_0\). In particular \(D(g_0)\le4e_0\). There is also
\(Y([g_t])^2\le S(g_t)\), by the constant Yamabe test, Cauchy–Schwarz
and the positive Yamabe sign. The same budget gives the total
dissipation on the maximal smooth interval \([0,t_*)\):
\[
2\int_0^{t_*}\|\nabla\mathcal F^\alpha(g_t)\|_{2,g_t}^2\,dt
  \le F_0-2(1-\alpha)I
  \le 2\varepsilon+2\alpha I .
\]
At fixed \(\alpha\), finiteness of this integral is the quantity used
in Bour's proof of Theorem 1.11.
[Bour v1, §8, proof of Theorem 1.11](https://arxiv.org/pdf/1012.0342v1#page=30)

In these norms, the orthogonal curvature decomposition gives
\[
\int_M |\operatorname{Rm}|_{\rm op}^2\,dV
  =2e+\frac{D}{2}+\frac{S}{24}=16\pi^2+D,\qquad
\int_M |\operatorname{Ric}|^2\,dV=D+\frac{S}{4}.
\]
The full four-index squared curvature norm is four times the operator
squared norm. Each of these quadratic integrals is invariant under a
constant metric rescaling in dimension four.

Take \(\alpha_j\downarrow0\) with \(\varepsilon_j\le\alpha_j^2\).
Set \(\delta=2T-I>0\) and \(y_*=\sqrt{24\delta}\).
Since \(m_{\alpha_j}\ge2\delta-2\varepsilon_j-16\pi^2\alpha_j\),
eventually \(m_{\alpha_j}\ge\delta\) and \(\alpha_j\le\delta/2\).
Every smooth time of each such trajectory satisfies
\[
\begin{gathered}
I\le E_\pm(g_{j,t})=e(g_{j,t})\le \frac{e_{j,0}}{1-\alpha_j},
\qquad e(g_{j,t})\le 2T-\frac{\delta}{2},
\qquad Y([g_{j,t}])\ge y_*,\\
S(g_{j,t})\le Y_{j,0}^2+48\alpha_j\le384\pi^2+48\alpha_j,\qquad
D(g_{j,t})\le4I+4\alpha_j\le32\pi^2-2\delta .
\end{gathered}
\]
In particular the two chiral totals converge to \(I\), uniformly
over the original smooth times as \(j\to\infty\). The dissipation
bound is \(O(\alpha_j)\), with extraction and smoothing still
taken separately at each fixed parameter.

## Sobolev inequalities in the physical and rescaled metrics

For each of these physical slices and for every constant multiple
\(h=\lambda g_{j,t}\), with \(\lambda>0\), the Yamabe bound yields
\[
y_*\|u\|_{4,h}^2\le6\|\nabla u\|_{2,h}^2+
                      \int R_hu^2\,dV_h. \tag{1}
\]
The conformal form and squared \(L^4\) norm both scale by \(\lambda\).
If \(R_h\le K\) on the support of \(u\), with \(K\ge0\), (1) gives
an inhomogeneous bound with zero-order coefficient \(K/y_*\) for
\(\|u\|_2^2\). A scalar upper bound \(K\) in the physical metric
becomes \(K/\lambda\) after rescaling. At the scale
\(\lambda=\|\operatorname{Rm}_{g_{j,t}}\|_{\infty,{\rm op}}\),
the rescaled full curvature bound gives \(R_h\le\sqrt{24}\) and
a uniform inhomogeneous inequality. The physical \(L^2\) scalar
bound alone provides neither a pointwise upper bound nor uniform
smallness of the \(L^2\) scalar tail. On a domain \(U\) where
\(\|R_h^+\|_{L^2(U)}\le\theta y_*\) for some \(\theta<1\),
Hölder absorbs the scalar term for tests supported in \(U\).
This gives \((1-\theta)y_*\|u\|_4^2\le6\|\nabla u\|_2^2\).
A homogeneous inequality for all tests on the closed source is
excluded by the constant test.
[Bour v1, §5](https://arxiv.org/pdf/1012.0342v1#page=22)

For a ball with compact closure on which \(R_h\le K\), take a
Lipschitz cutoff equal to one on \(B_h(x,r/2)\) and zero outside
\(B_h(x,r)\), with \(|\nabla u|\le2/r\). Inequality (1) extends to
such compact tests by smooth approximation. If \(Kr^2\le A\), it gives
\[
\frac{V(r)}{r^4}\ge
\frac{y_*}{4(24+A)}
 \left(\frac{V(r/2)}{(r/2)^4}\right)^{1/2},
\qquad V(\rho)=\operatorname{Vol}_h B_h(x,\rho).
\]
The same \(K\) works on all concentric subballs. Iteration and the
Euclidean small-ball density give \(V(r)\ge[y_*/(4(24+A))]^2r^4\).
This yields uniform noncollapse at bounded radii with a uniform
scalar upper bound. The argument also applies on complete pointed
limits with their transported tests.

## Conditional compact output

Assume Bour's compact output for a fixed \(\alpha_j>0\) and its
smooth convergence up to whole-manifold diffeomorphisms. Transport
the source orientation using these maps and pull the limiting metric
\(h_j\) back to \(M\). Volume and all the physical energy inequalities
pass by smooth convergence on the closed manifold. Each fixed Yamabe
test passes by smooth convergence, and taking the infimum gives
\(Y([h_j])\ge y_*\). The upper Weyl bounds and \(e(h_j)\ge I\) give
\(e(h_j)\to I\) along any infinite sequence of such outputs.
[Bour v1, Theorem 1.11 and its proof](https://arxiv.org/pdf/1012.0342v1#page=7)

Use \(\Delta=\operatorname{div}\nabla\) on functions. If
\(F_W=E_++E_-\), conformal invariance makes \(\nabla F_W\) trace-free.
Integration of the scalar first variation yields
\[
\nabla S=2(\nabla^2R-\Delta R\,h-R\operatorname{Ric}_0),
\qquad
\operatorname{tr}_h\nabla\mathcal F^\alpha=-\frac{\alpha}{4}\Delta R .
\]
At a critical metric each fixed \(\alpha_j>0\) gives constant
scalar curvature \(R_j\) on connected \(M\), with
\[
\nabla F_W(h_j)=\frac{\alpha_j}{12}R_j\operatorname{Ric}_{0,h_j},
\qquad
y_*\le Y([h_j])\le R_j
   \le \sqrt{Y_{j,0}^2+48\alpha_j}.
\]
The second inequality is the constant test at unit volume.
In the convention \(B=-\tfrac14\nabla\int |W|_{\text{four-index}}^2\,dV
=-\nabla F_W\), this is
\(B_{h_j}=-(\alpha_j/12)R_j\operatorname{Ric}_{0,h_j}\).
[Bahuaud–Guenther–Isenberg–Mazzeo, arXiv:2508.06633v1, §1](https://arxiv.org/html/2508.06633v1#S1)
· [Bour v1, Proposition 4.4](https://arxiv.org/pdf/1012.0342v1#page=18)

For the physical constant-scalar metric \(h_j\), (1) has scalar term
\(R_j\|u\|_2^2\). In the rescaled metric \(\lambda h_j\), it has
\((R_j/\lambda)\|u\|_2^2\). A further smooth pointed limit at
\(\lambda_j\to\infty\) therefore has a homogeneous inequality for all
compactly supported tests. The rescaled metrics satisfy the same
critical equation with the same \(\alpha_j\) and the rescaled scalar
\(R_j/\lambda_j\). Uniform elliptic compactness as \(\alpha_j\to0\)
is the separate BML-E04 input.

## Conditional singular output

Fix \(j\) and assume the pointed smooth extraction of Theorem 1.11.
At times \(t_i\) tending to the finite or infinite maximal time,
let \(\lambda_i=\|\operatorname{Rm}_{g_{j,t_i}}\|_{\infty,{\rm op}}\to
\infty\) and \(x_i\) be curvature maxima. Bour's parabolic scaling
is \(\lambda_i g_{j,t_i+s/\lambda_i^2}\). At \(s=0\), take the
complete connected noncompact nonflat scalar-flat Bach-flat limit
\((X,h,x)\). Smooth pointed convergence supplies embeddings of a
neighborhood of each entire compact subset into \(M\), with smooth
convergence of the pulled-back metrics. Use connected exhaustion
domains containing \(x\). After a subsequence the orientations at
\(x\) transported from \(M\) agree, giving consistent oriented maps.
The equal source budgets also cover interchange of the two labels.
[Bour v1, Theorems 1.9 and 1.11 and §8](https://arxiv.org/pdf/1012.0342v1#page=7)

For each compact exhaustion domain and each of \(E_+\), \(E_-\),
\(D\), \(S\) and both conventions for full curvature, smooth
convergence gives convergence of the restricted integral. The
comparison image is a subset of the original source, each integrand
is nonnegative, and constant scaling leaves each integral unchanged.
Exhaustion gives the individual inequalities with \(\liminf_i\) of
the corresponding whole-source energies. In particular,
\[
E_\pm(X,h)\le \frac{e_{j,0}}{1-\alpha_j},\qquad
\int_X|\operatorname{Ric}_h|^2\,dV_h=D(X,h)\le4I+4\alpha_j,\qquad
\int_X|\operatorname{Rm}_h|_{\rm op}^2\,dV_h
 \le 16\pi^2+4I+4\alpha_j .
\]
The four-index full curvature bound is four times the last bound.
The scalar integral vanishes by scalar-flatness. Every nonnegative
linear combination transfers by the same argument. The signature
and closed Gauss–Bonnet equalities above apply on \(M\). On \(X\),
the transfer supplies an upper bound for each chirality separately.
This argument also applies to any later pointed limit of the closed
physical critical sequence once its convergence is supplied.

Transport any compactly supported test using the embedding of an
open neighborhood of its support, then extend by zero. Smooth
convergence in (1) and scalar-flatness give
\[
y_*\|u\|_{4,h}^2\le6\|\nabla u\|_{2,h}^2,\qquad u\in C_c^\infty(X).
\]
The cutoff argument gives \(V(r)\ge(y_*/96)^2r^4\) at every radius
on the complete limit. The vanishing scalar term on this fixed-
parameter blow-up follows from scalar-flatness of the smooth limit.
The rescaled ordinary flow slices retain the scalar term in (1),
including at curvature maxima.
[Bour v1, §8, Lemma 8.2](https://arxiv.org/pdf/1012.0342v1#page=31)

This interface supplies orientation-compatible embeddings on entire
compact domains and chiral and Ricci budgets in the source gauges.
End regularity, full truncations and buffers, and smooth recognition
from the actual marking are the marked-limit packets.
[BML plan](../../02_marked_limits_and_attainment/research-plan/PLAN.md)
