# BML-E04 · Compactness of the physical CSC critical metrics

26 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. The requested execution configuration was GPT-6.2
Sol/ultra. Serving model and effort are unavailable. Input checkout
`4da586548b445ccfe9145c6a5671c0f7ecd433f3` and [activation packet](../../research-progress/handoffs/ACTIVATION_20261126.md),
SHA-256 `c56c3f5c03a25f256ae395382955200d17a28b193798703422ff40987518c186`.
The [Bour source receipt](../../../../../references/SOURCE_NOTES_BOUR_ATTAINMENT_20261126.md)
has input blob `6522c5e25006200f9e586244faf33ea7a0c385be`.
The [marked-neck manuscript](../../../03_first_order_twistor/01_sections_and_connections/01_neck_geometry/manuscript/marked_necks_and_chiral_energy.tex#L726)
has input blob `dcfcc42d8e04064930f2b90a25d8d70818b34630`.
This is a conditional elliptic derivation on the supplied compact
critical outputs. The existence of these outputs is a fixed-parameter
flow premise. The pointed output passes to the separate marked-core test.

## Physical inputs and critical equation

Let \(M\) be a smooth closed connected oriented homotopy four-sphere and
let \(g_j\) be smooth Riemannian critical metrics of \(\mathcal F^{\alpha_j}\)
with \(0<\alpha_j<1\), \(\alpha_j\to0\), and \(\operatorname{Vol}(M,g_j)=1\).
Curvature norms use the four-index norm for \(\mathrm{Rm}\), the usual
two-index norm for Ricci, and the operator Hilbert–Schmidt norms on
\(\Lambda^\pm\) for the chiral energies \(E_\pm\). Set
\(I=I^+(M)<8\pi^2\). The source estimates used below are
\[
 Y([g_j])\ge y_*>0,\qquad
 S(g_j)=\int_M R_{g_j}^2\,dV_{g_j}\le S_*<\infty .
 \tag{1}
\]
The energy conclusions additionally use
\[
 I\le E_+(g_j)=E_-(g_j)\le\frac{I+\alpha_j^2}{1-\alpha_j},
 \qquad D(g_j)=\int_M|\operatorname{Ric}_{0,g_j}|^2\,dV_{g_j}
       \le4I+4\alpha_j .
 \tag{2}
\]
The first-flow bounds give \(y_*^2=24(8\pi^2-I)\) for sufficiently late
indices and permit \(S_*=384\pi^2+48\). Any stronger uniform values can
be used. These are hypotheses on the physical endpoints and are retained
under the orientation-preserving comparisons below.

Use \(\Delta=\nabla^a\nabla_a\). Write \(E=\operatorname{Ric}_0\),
\(G_0=\nabla\mathcal F_W\) for Bour's normalization of the Bach tensor,
and \(G_\alpha=\nabla\mathcal F^\alpha\). Stationarity on volume-one
variations also implies \(G_\alpha=0\), since testing the scaling
direction makes the volume multiplier vanish. The identity
\(\mathcal F^\alpha=\mathcal F_W+(\alpha/24)\int R^2\,dV-8\alpha\pi^2\chi(M)\)
gives \(\operatorname{tr}G_\alpha=-(\alpha/4)\Delta R\). In fact,
\(g(t)=e^{2tu}g\) has \(R'=-2uR-6\Delta u\) and \(dV'=4u\,dV\), so
\((\int R^2dV)'=-12\int u\Delta R\,dV\), and the Weyl functional is
conformally invariant. Since \(\alpha_j>0\), closedness and connectedness
give \(R_{g_j}=s_j\) constant. On volume one the constant test in the
Yamabe quotient gives \(y_*\le s_j\le \sqrt{S_*}\) in the physical
CSC representative.

For a CSC metric, use Bour's curvature convention and translate his
Laplacian \(\Delta_{\rm Bour}=-\nabla^a\nabla_a\) as in Proposition 9.3.
The resulting equation is
\[
 G_\alpha=-\tfrac12\Delta E-W^\circ(E)+E\circ E-
       \tfrac14|E|^2g+\tfrac{2-\alpha}{12}R E,
 \qquad (W^\circ(E))_{ij}=W_{aibj}E^{ab} .
 \tag{3}
\]
Here \((E\circ E)_{ij}=E_i{}^kE_{kj}\). This translates the final
expanded display in Bour's proof of Proposition 4.4. In the preceding
display for \(\mathrm{Rm}^\circ(E)\), the Kulkarni–Nomizu contraction
gives \(|E|^2g/2\), supplying the missing square in that line.
Independently, the CSC variation
of \(\int R^2\,dV\) is \(-2R E\) as a covariant gradient, giving
\(G_\alpha=G_0-(\alpha/12)R E\). The tensor \(G_0\) is the
Weyl-functional Euler–Lagrange tensor in Bour's convention, so \(G_0=0\)
is the Bach-flat equation. [Bour, arXiv:1012.0342v1, §3 and Proposition 4.4](https://arxiv.org/html/1012.0342v1#S4) · [Laplacian convention in Proposition 9.3](https://arxiv.org/html/1012.0342v1#S9.SS1)

## Scaling and small balls

For a constant metric scaling \(h=\lambda g_j\) with \(\lambda\ge1\),
lengths multiply by \(\sqrt\lambda\), volumes by \(\lambda^2\),
\(R_h=s_j/\lambda\) and \(|\mathrm{Rm}_h|_h=\lambda^{-1}|\mathrm{Rm}_{g_j}|_{g_j}\).
The covariant \(E_h=E_{g_j}\), the connection is unchanged, and each
covariant term in (3) has weight \(\lambda^{-1}\). Thus \(h\) still
satisfies \(G_{\alpha_j}=0\) with the same \(\alpha_j\) and new scalar
coefficient \(s_j/\lambda\). All of \(E_\pm,D,S\) and the full
curvature integral in dimension four are scale invariant, including on
restricted domains. The convention gives
\(\int |\mathrm{Rm}|^2=4(E_++E_-)+2D+S/6\).

The Yamabe inequality in the scaled physical metric is
\[
 y_*\|f\|_{4,h}^2\le6\|df\|_{2,h}^2+
           (s_j/\lambda)\|f\|_{2,h}^2 .
 \tag{4}
\]
The quantities \(\|df\|_2^2\) and \(\|f\|_4^2\) both have weight
\(\lambda\), while \(\|f\|_2^2\) has weight \(\lambda^2\). Let
\(V_x(r)=\operatorname{Vol}_h B_h(x,r)\). Use a Lipschitz radial cutoff
equal to one on \(B_h(x,r/2)\), supported in the closed \(r\)-ball, with
\(|df|\le2/r\), justified in (4) by smooth approximation. For
\(0<r\le1\) this gives
\[
 y_*V_x(r/2)^{1/2}\le(24/r^2+\sqrt{S_*})V_x(r).
\]
Writing \(v_x(r)=V_x(r)/r^4\), this implies
\(v_x(r)\ge c_0 v_x(r/2)^{1/2}\) with
\(c_0=y_*/[4(24+\sqrt{S_*})]\). Iterate and use the pointwise
smooth small-ball asymptotic \(v_x(r/2^m)\to\omega_4\) at each
fixed \((j,x)\). The result is \(V_x(r)\ge c_0^2 r^4\) for all
centers and \(r\le1\), uniformly in \(j\) and \(\lambda\ge1\).
At the physical scale a minimizing geodesic of length \(L\) contains
\(\lfloor L\rfloor+1\) points at unit spacing. The disjoint half-unit
balls about them each have volume at least \(c_0^2/16\). Since
\(\operatorname{Vol}(g_j)=1\), this gives a physical diameter bound
\(16/c_0^2\).

Put \(Q_j=\max_M|\mathrm{Rm}_{g_j}|\). Pass to a subsequence on which
\(Q_j\) is bounded, or to one on which \(Q_j\to\infty\). In the former
case take \(h_j=g_j\). In the latter discard finitely many indices and
take \(h_j=Q_jg_j\), based at a maximum point \(x_j\), so
\(|\mathrm{Rm}_{h_j}(x_j)|=\|\mathrm{Rm}_{h_j}\|_\infty=1\). Both
choices have some common \(K\ge1\) bounding the full curvature in the
chosen subsequence. Cheeger–Gromov–Taylor's estimate uses sectional
curvature between \(-K\) and \(K\) on these complete metrics and
the ball-volume lower bound at a fixed \(r_0\le1\) chosen small relative
to \(K^{-1/2}\). It gives \(\inf_{j,x}\operatorname{inj}_{h_j}(x)>0\).
In the rescaled case \(\operatorname{Vol}(h_j)=Q_j^2\) also implies
\(\operatorname{diam}(h_j)\to\infty\), since the common lower Ricci
bound gives a Bishop upper volume bound for each fixed radius.
[Cheeger–Gromov–Taylor, JDG 17 (1982), §4, Proposition 4.1 and Theorem 4.7](https://doi.org/10.4310/jdg/1214436699)

## Uniform elliptic estimates

Bounded sectional curvature and the injectivity lower bound give harmonic
charts around every point with a uniform Euclidean coordinate ball,
uniform ellipticity, and a uniform \(C^{1,\gamma}\) bound on the
metric for fixed \(0<\gamma<1\). This is the Jost–Karcher estimate
in Peters, Theorem 4.3 and the ensuing passage from a geodesic to an
interior Euclidean coordinate ball. All source metrics here are compact,
and the indicated bounds depend on curvature and injectivity radius.
[Peters, *Convergence of riemannian manifolds*, Compositio Math. 62 (1987), pp. 10–11](https://www.numdam.org/item/CM_1987__62_1_3_0.pdf#page=9)

In one such chart write \(h=h_j\), \(R=R_h\). The Ricci equation in
harmonic coordinates reads
\[
 h^{ab}\partial_a\partial_b h_{ik}
   = -2(E_{ik}+(R/4)h_{ik})+P_{ik}(h^{-1},\partial h),
 \tag{5}
\]
where \(P\) is quadratic in first derivatives with smooth metric
coefficients. The right side is uniformly bounded by curvature and
the initial chart data. The scalar interior \(W^{2,p}\) estimate
componentwise gives \(h\) uniformly bounded in \(W^{2,p}\) on a
smaller ball for a fixed \(p>4\). [DeTurck–Kazdan, Ann. Sci. ENS 14 (1981), §4, Lemma 4.1 and (4.3)](https://www.numdam.org/item/10.24033/asens.1405.pdf#page=7)

The rough Laplacian in (3) now gives the coordinate system
\[
 h^{ab}\partial_a\partial_b E
   =-2W^\circ(E)+2E\circ E-\tfrac12|E|^2h+\tfrac{2-\alpha_j}{6}R E
       +A(h,\partial h)\partial E+C(h,\partial h,\partial^2h)E .
 \tag{6}
\]
Here \(\|A\|_\infty\) and \(\|C\|_p\) are uniform, since the latter
uses \(\partial\Gamma\) and products of Christoffel symbols. The
curvature terms on the right and the components of \(E\) are bounded
pointwise. Consequently \(CE\) is uniformly bounded in \(L^p\). The
diagonal scalar principal part allows a componentwise interior
\(W^{2,p}\) estimate with the uniformly bounded first-order system
treated by interpolation and absorption on nested balls. In particular
the estimate uses \(\|E\|_p+\|CE\|_p\) and the \(L^p\) norm of
the algebraic curvature terms. It gives a uniform \(W^{2,p}\) bound
on \(E\) on a smaller ball. This step only requires an \(L^p\) bound
on \(\partial\Gamma\).

By Morrey, \(E\) is now uniformly \(C^{1,\beta}\)
for \(0<\beta<\min(\gamma,1-4/p)\). Interior Schauder applied to
(5) first gives \(h\in C^{2,\beta}\). In (6) the coefficients
involving \(\partial^2h\) and the curvature terms are now
\(C^{0,\beta}\), so \(E\in C^{2,\beta}\). For each \(m\ge2\),
\(h,E\in C^{m,\beta}\) give \(h\in C^{m+1,\beta}\) by (5),
then \(E\in C^{m+1,\beta}\) by (6). Use nested interior balls with
radii bounded below by a fixed fraction of the original chart radius.
Thus for each derivative order \(k\) there is a common bound on
\(\|\nabla^k\mathrm{Rm}_{h_j}\|_{\infty,h_j}\). The coefficients
are controlled by the chart bounds, \(K\), \(y_*\), \(S_*\) and
\(|2-\alpha_j|\le2\). The small parameter disappears from the leading
stationary elliptic part once the trace has given CSC. The
positive-time estimates in Bour's flow proof use the operator and
the scalar coercivity coefficient \(1-6a=\alpha\) in dimension four.
[Bour, Theorem 1.5 and §6](https://arxiv.org/html/1012.0342v1#S6)

## Comparison maps and both limits

Apply smooth pointed Riemannian compactness to the complete metrics
using the uniform curvature-derivative estimates and the base-point
injectivity bound. It gives a connected complete smooth limit and
smooth embeddings \(\phi_j\) of a connected open exhaustion into \(M\),
carrying the limit base point to the selected source base point, with
\(\phi_j^*h_j\) converging smoothly on compact sets. Choose the limit
orientation using the pulled-back source orientation at the base point
after a subsequence. By connectedness all maps in this subsequence
are orientation preserving. On either scale the derivative bounds
and (3) give \(\|\nabla^k G_0(h_j)\|_\infty\le C_k\alpha_j s_j/\lambda_j\).
[Static compactness in Bour, Theorem 7.1](https://arxiv.org/html/1012.0342v1#S7)

**Bounded curvature.** The uniform physical diameter bound forces the
pointed limit to be compact. To see this directly, a compact closed
limit ball of radius \(L\) greater than the diameter bound plus one
eventually lies in the domain of comparison. Every path from the
source base point leaving its image has length at least
\((1-o(1))L\) before exit. If the complete limit were noncompact,
a point strictly inside that ball at distance greater than the
diameter bound would contradict the length bound for a minimizing
source path to its image. An exhaustion of the resulting compact
limit eventually includes the entire manifold. An embedding of it
into the connected \(M\) is open and closed, hence a diffeomorphism.
The limit has volume one, positive constant scalar curvature and
\(Y\ge y_*\) by passing the physical Yamabe inequality to each test
function. It satisfies \(G_0=0\) by smooth convergence and
\(G_0=(\alpha_j/12)R E\). Both chiral energies converge on the whole
manifold and satisfy \(E_+=E_-=I\) by (2). Via an oriented comparison
diffeomorphism this is a smooth positive Bach-flat minimizing class
on the original \(M\).

**Unbounded curvature.** Write \((X,h_\infty,x_\infty)\) for the pointed
limit. A compact \(X\) would give whole-manifold diffeomorphisms and
convergent total volumes, in conflict with \(Q_j^2\to\infty\).
At the base point \(|\mathrm{Rm}_{h_\infty}|=1\). The scalar
curvatures satisfy \(0<R_{h_j}=s_j/Q_j\to0\), and the exact Bach
equation follows from \(G_0=(\alpha_j/12)(s_j/Q_j)E\) in (3).
For a fixed compactly supported smooth test, push forward by the
comparison and extend by zero. Equation (4) tends to
\(y_*\|f\|_{4,h_\infty}^2\le6\|df\|_{2,h_\infty}^2\). The same
cutoff proof with zero zeroth-order coefficient gives Euclidean
lower volume growth for every center and every radius in \(X\).
On each compact domain, smooth convergence and constant-scale
invariance give the separate chiral and Ricci budget bounds from
(2). Exhaustion and \(R_{h_\infty}=0\) yield
\[
 E_+(h_\infty)\le I,\qquad E_-(h_\infty)\le I,\qquad
 \int_X|\operatorname{Ric}_{h_\infty}|^2\,dV_{h_\infty}\le4I<32\pi^2 .
\]
The full curvature integral is finite by the curvature decomposition.
Given any fixed compact truncation of \(X\) including every stipulated
compact buffer, a single \(\phi_j\) is defined on a neighborhood of
that entire set for all sufficiently large \(j\). On this domain
\(\phi_j^*(Q_j g_j)\to h_\infty\) smoothly, with physical length
factor \(Q_j^{-1/2}\). The ALE regularity, existence of the stipulated
truncations, and recognition after capping enter through the separate
marked-core comparison. The pointed analytic output supplies its
complete scalar-flat Bach-flat metric, Sobolev inequality, both chiral
budgets, strict Ricci budget and whole-truncation embeddings.
