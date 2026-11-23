# Conditional contraction in the fixed-reference coupled system

22 November 2026, America/New_York. Prepared for Edward B. Baker III
with OpenAI assistance. Fixed E42 execution, configured gpt-6.2-sol / ultra.
Independent runtime attestation and actual lead settings are unavailable.
The [request][req] records the frozen input digests. [B33][b33] selects
the setup. The proof below is conditional on the two [E41][e41] linear
estimates in their smooth-data completion interpretation. The
[E41 return][e41ret] reports these same estimates for the completed
spaces.

## Conditional statement

Let \(M\) be a smooth compact closed oriented real four-manifold, with
fixed smooth metric and positive density. Let \(\bar A\) be a fixed
smooth definite reference in the positive component of [E36][e36].
For \(U=(a,b)=(A-\bar A,F-F_{\bar A})\), keep the independent pair
bundle, fixed metric connection \(D\), and the fixed direct-sum pairing
of \(\bar g=g(F_{\bar A})\) and the negative Killing form throughout.
Fix the curvature diffusion coefficient \(\lambda\) as in E36 for
the compact reference curvature range.
Let \(P_0(x)=P(x,0)\) and \(L=\operatorname{div}_D(P_0 D)\), using
the fixed density in the divergence. The real part of the quadratic
symbol of \(P_0\) on rank-one arrays has a uniform positive margin.
On a fixed reference-centered tube the E36 equations have the form
\[
 U_t=LU+\operatorname{div}_D q(U)+f(U),\qquad
 \begin{aligned}
 q(U)&=(P(x,U)-P_0(x))DU,\\
 f(U)&=h_0(x,U)+h_1(x,U)DU+h_2(x,U)[DU,DU].
 \end{aligned}                                                    \tag{1}
\]
Here \(P,h_j\) are smooth bundle maps of the value. Writing the
principal term in divergence form differentiates \(P\) once.
Its spatial derivative at fixed value and the fixed connection and
density terms contribute to the lower-order coefficients. Its derivative
in the value, contracted against \(DU\), contributes to \(h_2\).
Other fixed reference derivatives belong to the \(h_j\), including
the inhomogeneity \(h_0\). [E36][e36] · [E37][e37].

For fixed \(p>6\), assume the smooth global Cauchy and zero-trace
Duhamel operators \(H,S\) for \(L\) obey, uniformly for \(0<T\leq T_0\),
\[
 \|Hu_0\|_{X_T}\leq A\|u_0\|_\infty,\qquad
 \|S(f,G)\|_{X_T}\leq A(\|f\|_{Y_{0,T}}+\|G\|_{Y_{1,T}}),
 \quad S(f,G)_t-LS(f,G)=f+\operatorname{div}_D G .                  \tag{2}
\]
These are the estimates posed in [E41][e41]. Under (2), there exist
\(\epsilon,R,T>0\) such that every continuous \(U_0\) with
\(\|U_0\|_\infty\leq\epsilon\) gives a solution of (1) in the
closed radius-\(R\) ball of the smooth completion of \(X_T\). It has
strong initial trace in \(C^0\), is unique in that ball, depends
Lipschitz continuously on the datum there, and is smooth at positive
times. Converging data in this class give convergence of all derivatives
on every compact positive-time strip in \(0<t<T\).
If \(F_0=F_{A_0}\) distributionally, then \(F(t)=F_{A(t)}\)
distributionally at every slice and pointwise at positive time.
Constants depend on \(p\), the fixed bundle and background geometry,
the smooth coefficient bounds used below and the constants in (2).
Interior derivative estimates can also depend on the strip, derivative
order and corresponding higher fixed coefficient bounds.

## Norms and multiplication

Write \(Q_r(x)=B_r(x)\times(0,r^2)\) and
\(Q_r^+(x)=B_r(x)\times(r^2/2,r^2)\), with \(0<r\leq\sqrt T\)
below the fixed chart scale. All suprema below range over these \(x,r\).
In dimension four the specified norms are
\[
 \begin{aligned}
 Z(G)&=\sup_{x,r}r\left(r^{-6}\int_{Q_r^+}|G|^p\right)^{1/p}
     +\sup_{x,r}\left(r^{-4}\int_{Q_r}|G|^2\right)^{1/2},\\
 Y(f)&=\sup_{x,r}r^2\left(r^{-6}\int_{Q_r^+}|f|^{p/2}\right)^{2/p}
     +\sup_{x,r}r^{-4}\int_{Q_r}|f|,\\
 X(U)&=\sup|U|+Z(DU).
 \end{aligned}                                                     \tag{3}
\]
Here \(Z=\|\cdot\|_{Y_{1,T}}\), \(Y=\|\cdot\|_{Y_{0,T}}\), and
\(X=\|\cdot\|_{X_T}\). Let a superscript \({}^\circ\) indicate
completion of smooth sections on the closed cylinder in the respective
norm. For fixed \(T\) a finite spatial cover at \(r=\sqrt T\) gives
global \(L^2\) control of \(DU,G\) in \(X_T^\circ,Y_{1,T}^\circ\)
and global \(L^1\) control in \(Y_{0,T}^\circ\). In \(X_T^\circ\),
uniform convergence on the closed cylinder identifies a continuous
section and distributional integration by parts identifies the \(L^2\)
limit of its spatial derivatives. Thus these completions admit the
indicated distributional interpretation. From (2), \(H\) on
continuous data and \(S\) on \(Y_{0,T}^\circ\times Y_{1,T}^\circ\)
are the limits of their smooth evaluations. Uniform convergence
preserves their initial traces \(u_0\) and zero, respectively. The
linear equations pass to the limit by the distributional embeddings.

If \(M_1\) is a bounded linear multiplier and \(M_2\) a bounded
bilinear multiplier, pointwise operator norms give
\[
 \begin{aligned}
 Z(M_1G)&\leq \|M_1\|_\infty Z(G),\\
 Y(M_2[G,H])&\leq \|M_2\|_\infty Z(G)Z(H),\\
 Y(k)&\leq cT\|k\|_\infty,\qquad
 Z(G)\leq c\sqrt T\,\|G\|_\infty \quad\text{for bounded }G,\\
 Y(G)&\leq c\sqrt T\,Z(G).
 \end{aligned}                                                     \tag{4}
\]
The spatial ball volumes are at most \(c r^4\) in the fixed density.
For the quadratic estimate use Hölder with \(p,p\) on \(Q_r^+\)
and Cauchy–Schwarz on \(Q_r\). The respective factors split as
\(r^2=r\cdot r\) and \(r^{-4}=r^{-2}\cdot r^{-2}\).
The last estimate uses \(r^{-6}|Q_r^+|\leq c\) with Hölder
on the late slab and
\[
 r^{-4}\int_{Q_r}|G|
 \leq (r^{-4}|Q_r|)^{1/2}
             \left(r^{-4}\int_{Q_r}|G|^2\right)^{1/2}
 \leq c r\left(r^{-4}\int_{Q_r}|G|^2\right)^{1/2}.
\]
These estimates also bound the multilinear maps used below on the
smooth completions by density.

Choose \(\rho>0\) so the tube \(|U|\leq 2\rho\) lies in the
smooth definite, parabolic region. Use a smooth cutoff equal to one
on \(|U|\leq\rho\), supported in \(|U|<2\rho\), multiplying the \(h_j\)
and interpolating \(P\) to \(P_0\) outside. The strong quadratic
symbol margin is preserved by convexity. The norms at radius
\(R\leq\rho/4\) keep the solution in the agreement region.
For \(X(U),X(V)\leq R\leq1\), set \(w=U-V\).
Let \(M_j\) bound \(h_j\), \(M_j'\) bound their value derivatives, and
\(L_P\) bound the value derivative of \(P\). These bounds can be taken
on the cutoff tube in the fixed metrics. A constant \(c\) below
only accounts for the fixed comparisons in (4).
\[
 \begin{array}{c|c|l}
 \text{term and norm}&\text{bound at }U&\text{bound for the difference}\\ \hline
 q \text{ in } Z
  &L_P RZ(DU)
  &L_P(RZ(Dw)+\|w\|_\infty Z(DV))\\
 h_0\text{ in }Y
  &cT M_0
  &cT M_0'\|w\|_\infty\\
 h_1 DU\text{ in }Y
  &c\sqrt T\,M_1 Z(DU)
  &c\sqrt T\,(M_1 Z(Dw)+M_1'\|w\|_\infty Z(DV))\\
 h_2[DU,DU]\text{ in }Y
  &M_2 Z(DU)^2
  &M_2(Z(DU)+Z(DV))Z(Dw)+M_2'\|w\|_\infty Z(DV)^2 .
 \end{array}                                                       \tag{5}
\]
For the last line subtract both arguments of the bilinear map
in turn, then its coefficient. Smooth approximations converging
in \(X_T^\circ\) yield convergence in \(Y_{0,T}^\circ\) and
\(Y_{1,T}^\circ\) by these bounds. Equation (5) gives the nonlinear
size \(K(T+\sqrt T R+R^2)\) and Lipschitz constant
\(K(T+\sqrt T+R)\) in the sum of the source norms, for \(T\leq1\).
In particular the reference forcing need only be bounded and smooth.

## Contraction and distributional uniqueness

For later use, enlarge \(K\geq1\) to cover the transformed coefficients
of the smooth parameter family described below. For that family the
source size has the additional term \(K|s|R\) and the Lipschitz constant
has the additional term \(K|s|\). Choose
\[
 0<R\leq\min\{\rho/4,1,s_0,(64AK)^{-1}\},\qquad
 0<T\leq\min\{T_0,1,R^2\},\qquad
 \epsilon=R/(16A),\quad A\geq1.                                    \tag{6}
\]
Here \(s_0>0\) is a fixed small parameter limit, and \(T_0\) is
decreased if needed to stay below the fixed chart scale. For the
untransformed equation let
\(\Phi(U;U_0)=HU_0+S(f(U),q(U))\). The analogous map for
\(|s|\leq R\), even allowing \(\|U_0\|_\infty\leq R/(8A)\),
maps the closed ball into its radius-\(3R/16\) subball and has
Lipschitz constant \(\vartheta\leq 1/16\) by (2), (5), (6).
The resulting fixed point satisfies (1) distributionally and has
the prescribed trace. For two data in this range subtraction gives
\[
 \|U-\widetilde U\|_{X_T}
   \leq \frac{A}{1-\vartheta}\|U_0-\widetilde U_0\|_\infty .         \tag{7}
\]
This margin will allow a compatible approximating sequence with
common \(R,T,\bar A\).

To identify distributional solutions in the ball with mild ones,
it suffices to check uniqueness for \(Z_t=LZ\) with \(Z(0)=0\)
in \(X_T^\circ\). The fixed-data inequality
\[
 \operatorname{Re}\langle LZ,Z\rangle
 \leq -c_1\|DZ\|_2^2+c_2\|Z\|_2^2                                \tag{8}
\]
holds in the weak \(H^{-1},H^1\) pairing. To see the use of
rank-one positivity, choose a smooth partition with sum of squares
one on small charts and localize \(Z\). Freeze the principal tensor,
density and pairing in each chart. Plancherel gives the gradient
bound there from the rank-one bound for every Fourier frequency.
Shrink the fixed charts so continuous coefficient errors are bounded
by a fraction of this gradient bound. The cross terms from cutoff
derivatives and the fixed connection contribute at most
\(\delta\|DZ\|_2^2+C_\delta\|Z\|_2^2\). Summing and absorbing gives
(8), with extension by density to \(H^1\).
The cover observation after (3) gives \(Z\in L^2 H^1\),
so \(Z_t=LZ\in L^2 H^{-1}\). Convolving this identity in time on
compact interior subintervals gives
\(\frac12\partial_t\|Z\|_2^2=\operatorname{Re}\langle LZ,Z\rangle\)
in time distributions: the smoothed square converges in \(L^1\)
and the duality pairing converges by the two \(L^2\) bounds.
The right side is integrable and \(Z\) is time-continuous in \(L^2\).
Use (8) with an integrating factor and send the initial time to
zero using the trace. This gives \(Z=0\). Thus subtracting the
linear mild solution for its own sources identifies every
distributional solution in the completed small ball with its
mild fixed point. The same argument applies on any shorter interval
and with the transformed lower terms assigned to the sources.

## Positive-time smoothness

The spatial parameter method follows the idea in Koch–Lamm v1,
§§2–3, pp. 4–7. Theorem 1.1 on pp. 2–3 is a scalar Euclidean
result under bounded uniformly elliptic coefficients, small local
oscillation and coefficient and forcing control. Sections 4.1–4.2,
pp. 7–8, discuss the manifold and system variants. Here the
parameter construction and all product estimates use (2)–(5)
for the fixed compact bundle and the declared scaled norms.
[Koch–Lamm v1][kl].

Choose finitely many global smooth vector fields \(V_\alpha\)
spanning each tangent space, using cutoffs in a finite cover.
Let \(\varphi_{t,s}\) be the time-\(t\) flow of
\(\sum s_\alpha V_\alpha\), where \(s\) is a small real vector.
Define \(\mathcal T_s U(t,x)\) as \(U(t,\varphi_{t,s}(x))\)
parallel transported by \(D\) back to \(x\) along the flow path.
At \(t=0\) the lift is the identity for every \(s\). Smooth dependence
of flow and transport on \(t,x,s\) holds on the compact base.

The lifted pullbacks are uniformly bounded on \(X_T^\circ\) for
small \(|s|,T\). For \(t\leq r^2\) the image of \(B_r(x)\)
lies within \(B_{c r}(x)\), using the speed bound and \(r\leq1\).
Cover this enlarged ball by a uniformly bounded number of balls
of radius \(r\), so the time slab and allowed radius are preserved.
The derivative of a pullback is a uniformly bounded multiplier
on the transported \(DU\) plus a bounded smooth multiplier on the
transported \(U\). Apply the covering, Jacobian bounds and (4)
to obtain the operator bound. Smooth sections stay smooth,
and \(\mathcal T_s U\to U\) in \(X_T^\circ\) as \(s\to0\):
for smooth sections this follows in the uniform spatial \(C^1\)
norm by (4), and then uniformly bounded operators give the limit
on the closure.

For smooth sections, conjugating the spatial equation by this
pullback gives a smooth principal coefficient \(P_s(t,x,U)\)
depending on the value \(U\), with \(P_{s=0}=P\) and
\[
 \|P_s(t,x,U)-P_0(x)\|\leq c(|U|+|s|),\qquad
 \|D_U P_s\|\leq c.                                                \tag{9}
\]
Indeed, in a local frame the top coefficient is obtained by applying
the inverse base Jacobian to the two derivative slots and conjugating
the fiber slots by transport, with the old value written in the
old fiber. All these transformations are smooth, and equal
the identity at \(s=0\). One may compute first in nondivergence
form for smooth sections and then rewrite in fixed covariant
divergence form. Second derivatives of coordinate maps, derivatives
of transport, and fixed-density and connection comparisons
produce lower terms of degree at most two in \(DU\).
The time differentiation of the pullback contributes a drift and
an endomorphism of order zero, with smooth coefficients.
Differentiating the new \(P_s\) in the value during divergence
rewriting again contributes a quadratic term. Thus the transformed
equation has the form (1) with \(P_s,h_{j,s}\), retaining the
fixed \(L\). On the compact parameter and value tubes all
coefficient derivatives required in (5) have uniform bounds.
Equations (5) and (9) give the claimed added size \(K|s|R\)
and difference factor \(K|s|\). For smooth test sections the
equation residuals intertwine by exactly \(\mathcal T_s\).
For a general section of \(X_T^\circ\) approximate by smooth
sections. Residuals converge distributionally by (4)–(5), and
pullback is continuous on distributions for the smooth spacetime
diffeomorphism and smooth invertible bundle map. This proves
the transformed equation for \(\mathcal T_s U\) with the same trace.

For all sufficiently small \(s\), \(\mathcal T_s U\) belongs
to the radius-\(R\) ball by the strict margin at \(s=0\) and
strong continuity of the pullback. This persists on a neighborhood
of the datum in \(C^0\) by (7) and uniform boundedness of the
pullbacks. Distributional uniqueness
just proved therefore identifies it with the transformed mild
fixed point \(U_s\). The transformed fixed-point map is
\(C^\infty\) in \((s,U_0,U)\) with \(U_0\) in \(C^0\) and
\(U\) in \(X_T^\circ\). Taylor's formula in the bounded value
variable gives sup norm Taylor remainders for each coefficient,
with uniform constants on the tube. Each term and each derivative
is then a product of bounded values with at most two gradient
factors, controlled by (4) as a map into the completed source
spaces. The initial datum appears through the same bounded
linear map \(H\) for all parameters. The derivative in \(U\)
has norm at most \(\vartheta\) near the fixed point.
The parameter-continuity estimate follows by subtracting
the fixed-point equations and absorbing this factor.
Difference quotients and Taylor's formula give the derivative
by inverting \(I-D_U\Phi\) with its convergent Neumann series.
Differentiating this identity recursively gives joint smoothness
of \(U_s\) in \(s,U_0\) as an \(X_T^\circ\)-valued map.
The identity at \(t=0\) requires no spatial differentiation
of the initial section.

Fix \(t_*>0,x_*\), and take four of the fields spanning
\(T_{x_*}M\). Varying just those parameters, the derivative
of \(s\mapsto\varphi_{t,s}(x_*)\) at zero is
\(s\mapsto t\sum s_\alpha V_\alpha(x_*)\). The inverse function
theorem gives \(s=s(t,y)\) smooth for \(t\) close to \(t_*\)
and \(y\) close to \(x_*\). Then \(U(t,y)\) is obtained by
inverse parallel transport from \(U_{s(t,y)}(t,x_*)\).
Evaluation is continuous on \(X_T^\circ\). Parameter derivatives
there are continuous on the closed cylinder, so all spatial
derivatives of \(U\) are jointly continuous for \(t>0\).
Joint parameter and initial-data continuity gives uniform
convergence of each spatial derivative on compact positive-time
strips for converging data, using finitely many such neighborhoods.
In (1) its right side and every spatial derivative now have
continuous representatives. Integrating the distributional time
identity for each spatial derivative gives a continuous time
derivative. Iteration gives joint smoothness and convergence of
all mixed derivatives on these strips. This proves the regularity
from (2) using the fixed smooth coefficients and the bounded
completed-space multiplication estimates.

## Compatible passage

For compatible continuous input use [E38][e38] to choose smooth
\(A_0^k\) with \(A_0^k\to A_0\), \(F_{A_0^k}\to F_0\) uniformly.
For large \(k\) all these data lie below \(R/(8A)\) relative
to the same fixed reference. The fixed points \(U^k\) are
defined on the common \(T\), converge in \(X_T^\circ\) by (7),
and converge smoothly on positive-time strips as above.

For each \(k\) there is a short-time smooth-data connection solution
of the E29 adjusted equation with this fixed reference. To check its
hypotheses even when the whole initial gradient is large, use the
\(A\) row of E36 at \(F=F_A\), where the correction
\(d_A^{*g}C\) vanishes identically. In that row, the fixed-metric
vertical term has an \(A\) second jet with value coefficients.
The remaining vector field \(W\) is first order in the independent
pair with coefficients depending on the values \(x,A,F\).
Substitution of \(F_A=\bar F+d_{\bar A}a+[a\wedge a]/2\)
into \(W\) introduces second derivatives of \(a\) only through
the fixed linear map taking \(Da\) to its exterior part in \(F_A\).
Thus the adjusted connection principal coefficient
depends on \(x,A,F_A\), and continuity extends the strict E29
reference symbol margin to a uniform small value tube. Decrease
\(\rho\) in (6) for this tube. For an individual smooth
approximant the initial first jets form a compact subset of the
open parabolic jet region, even if some symmetric first-jet
components are large. Choose the E29 smooth jet cutoff equal
to one on a neighborhood of this compact subset, supported in
the region, with convex interpolation to the fixed Laplacian.
The E29 compact-bundle Galerkin and localization proof then
applies with the same fixed reference: the quadratic margin,
smooth jet coefficients and smooth datum are exactly its inputs.
The short time and high Sobolev bounds may depend on \(k\).
[Taylor 1991, §7.3, (7.3.1)–(7.3.2) and Prop. 7.3.A][tay] · [E29][e29].

Lift that solution by \(F=F_A\) using the converse E36 identity.
The E29 \(C_tH^6\) regularity controls continuous spatial first
derivatives of the lifted pair up to zero by Sobolev embedding
in dimension four. It follows that the lifted solution belongs
to the smooth completion on a short cylinder, by smooth
approximation in the uniform spatial \(C^1\) norm. Its
\(X_\ell\) norm approaches the datum's sup norm as \(\ell\downarrow0\),
since the gradient seminorm is bounded by
\(c\sqrt\ell\,\sup |DU|\) and the lift is continuous in time.
Consequently it lies in the small ball for some
\(\ell_k>0\), and (8) and the contraction identify it with
the restriction of \(U^k\) there. The identification uses smooth
uniqueness only in this completed small ball and has no
uniform lower bound requirement for \(\ell_k\).

For \(U^k\), start at any positive slice inside this compatible
interval. E36's exact moving-metric constraint energy propagates
\(C=F-F_A=0\) on each subsequent compact positive-time interval
where the pair is smooth and definite. This gives compatibility
throughout \(0<t<T\). At every slice the limit in (7) gives
uniform convergence of \(a^k,F^k\). Apply the curvature formula
distributionally in space, testing \(d_{\bar A}a^k\) against
the fixed smooth formal adjoint. The bracket of the values
converges uniformly. Hence \(F=F_A\) at each slice, including
the continuous endpoints by continuity, and pointwise where
the solution is smooth. [E36][e36] · [E38][e38].

## Source and proof boundary

The remote primary inspection is of Herbert Koch and Tobias Lamm,
*Parabolic equations with rough data*, arXiv:1310.3658v1
(14 October 2013), Theorem 1.1 and §§2–4. Publication metadata
recorded in E40 are *Mathematica Bohemica* **140**(4), 457–477
(2015), DOI 10.21136/MB.2015.144463. The pagination cited above
is that of v1. Michael E. Taylor, *Pseudodifferential Operators
and Nonlinear PDE*, Birkhäuser Boston, Progress in Mathematics
**100** (1991), DOI 10.1007/978-1-4612-0431-2, was checked in the
undated author-hosted file. Equations (7.3.1)–(7.3.2) on printed
p. 147 allow smooth vector systems and assume positivity of the
negative Hermitian part of the principal symbol. Proposition 7.3.A
on printed p. 149 uses \(H^s\), \(s>n/2+2\). The compact-bundle
application uses the E29 localization argument with parabolic
jet cutoff, starting from smooth sections. Neither remote file
was retained as a new reading copy. [Koch–Lamm v1][kl] ·
[Taylor author-hosted PDF][tay] · [E40 audit][e40].

The two estimates (2) are the linear premise of this conditional
proof. No further nonlinear regularity premise is needed within
the completed spaces. The construction concerns globally small continuous
values relative to one fixed smooth definite reference, with
the adjusted equation on the compatible subspace.
It gives no conclusion about arbitrary-size data, endpoint
regularity of the reverse automorphism, an unadjusted restart
or global behavior.

[req]: ../research-progress/handoffs/SP4-CME-E42_REQUEST_v1.md
[e41]: ../research-progress/handoffs/SP4-CME-E41_REQUEST_v1.md
[e41ret]: ../research-progress/handoffs/SP4-CME-E41_RETURN_v1.md
[b33]: ../brainstorm/notes/B33_COMPACT_ROUGH_SYSTEM_20261122.md
[e29]: 29_LOCAL_PARABOLIC_INPUT_20261122.md
[e36]: 36_COUPLED_CURVATURE_SYSTEM_20261122.md
[e37]: 37_ROUGH_DATA_SOURCE_TEST_20261122.md
[e38]: 38_CONTINUOUS_COMPATIBLE_DATA_20261122.md
[e40]: ../reviews/E40_REFERENCE_AUDIT_20261122.md
[kl]: https://arxiv.org/pdf/1310.3658v1
[tay]: https://mtaylor.web.unc.edu/wp-content/uploads/sites/16915/2018/04/NLIN.pdf
