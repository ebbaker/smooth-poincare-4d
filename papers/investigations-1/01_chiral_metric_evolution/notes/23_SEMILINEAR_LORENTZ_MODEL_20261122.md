# SP4-CME-E23 — a flat semilinear Lorentz contraction

22 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol` / `ultra`.
Actual backend model and effort were not independently exposed. Selected
lead settings unavailable. This is the finite analytic check in the
[E23 request][request] under the [B19 decision][decision]. The [return][return]
records the frozen inputs. The only heat estimates used beyond the elementary
arguments below are derived by Gaussian integration in [E21][heat].

## Model and conclusion

Use the fixed Euclidean \(\mathbb R^4\), Lebesgue measure, the standard
vector norm on \(\mathbb R^{20}\), and its induced tensor norm on spatial
gradients. Fix \(K\ge0\). Let \(B\) and \(C\) be fixed bounded multilinear
maps of the indicated arguments into \(\mathbb R^{20}\), with operator
norms \(b,c\ge0\). Consider
\[
 U_t=4\Delta U-12KU+B(U,\nabla U)+C(U,U,U),\qquad U(0)=U_0.
 \tag{1}
\]
The principal coefficients are constant. Write \(E=L^{4,1}(\mathbb R^4)\)
for the vector-valued Lorentz space, with the same norm as E21,
\[
 \|f\|_E=\int_0^\infty s^{-3/4}|f|^*(s)\,ds .
\]
Here \(|f|^*\) is the decreasing rearrangement of the Euclidean norm.

For \(N=\|U_0\|_E\) sufficiently small, (1) has a global mild solution
for the requested \(U_0\in C_c^\infty(\mathbb R^4;\mathbb R^{20})\).
It is unique in a specified small ball of the space with norm
\[
 \|U\|_X
 = \sup_{t\ge0}\|U(t)\|_E
   +\int_0^\infty\|\nabla U(t)\|_\infty\,dt
   +\left(\int_0^\infty\|U(t)\|_\infty^2\,dt\right)^{1/2}.
 \tag{2}
\]
The smallness and norm constants are independent of \(K\ge0\).
The solution has a strong Lorentz initial trace. No additional
classical regularity is needed for the conclusion.

## Lorentz norm, contraction, and completion

For \(s>0\) let
\[
 A_f(s)=\int_0^s |f|^*(r)\,dr
       =\sup_{|D|\le s}\int_D|f(x)|\,dx .
\]
The last equality follows by layer cake. Each layer intersection with
\(D\) is bounded by the minimum of the two measures, and a superlevel
set up to volume \(s\), with part of a level set added if needed, realizes
this bound by the absence of atoms. Tonelli gives
\[
 \|f\|_E=\tfrac34\int_0^\infty s^{-7/4}A_f(s)\,ds
       =4\int_0^\infty |\{x:|f(x)|>\lambda\}|^{1/4}\,d\lambda .
 \tag{3}
\]
The first identity follows by interchanging integrals in \(A_f\);
the second integrates the rearranged layers. In particular this is a
norm, by subadditivity of \(A_f\) and the vector triangle inequality.
It is monotone under pointwise domination. Its local \(L^1\) bound is
\[
 \int_D|f|\le |D|^{3/4}\|f\|_E\quad (|D|<\infty),
\]
by \(A_f(s)\le s^{3/4}\|f\|_E\). Completeness follows because an \(E\)-Cauchy
sequence has a local \(L^1\) limit, with a subsequence converging almost
everywhere. The first formula in (3) and Fatou give lower
semicontinuity of the norm along that subsequence, also after
subtracting any fixed term of the sequence. The Cauchy property
then gives convergence in \(E\).

Smooth compactly supported vector fields are dense. First truncate
the values and spatial support. For each fixed positive \(\lambda\),
the discarded part has superlevel measure tending to zero inside the
finite superlevel measure of \(|f|\). The second formula in (3)
gives norm convergence by domination. Bounded fields on finite
support are approximated by simple ones in the same norm, since
a pointwise error bounded by \(h\) on a set of measure \(m\) has norm
at most \(4hm^{1/4}\). Indicators can be approximated by smooth
cutoffs between an interior compact set and an exterior open set
whose measure difference tends to zero. This also yields separability,
for example by simple fields with rational vector values on finite
unions of boxes with rational endpoints.

Let \(S(t)=e^{t(4\Delta-12K)}\) be the Gaussian convolution of E21,
including its damping. Its spatial heat kernel \(H_t\) has unit mass.
Averaging translates and using Fubini yields
\[
 \int_D |H_t*f|
 \le \int H_t(y)\int_{D-y}|f(x)|\,dx\,dy
 \le A_f(s) \quad (|D|\le s).
\]
The first formula in (3) gives the exact contraction
\(\|S(t)f\|_E\le\|f\|_E\), including \(K=0\). Translations are isometries
in \(E\) and continuous at zero by smooth density, since translates
of a fixed smooth compact function converge uniformly on a common
bounded support. By the same averaging inequality for differences,
\(\|H_t*f-f\|_E\le\int H_t(y)\|f(\cdot-y)-f\|_E\,dy\)
tends to zero. Split the integral into a small fixed ball and the
vanishing Gaussian tail. The damping tends to one at zero, and the
semigroup property gives strong continuity for all \(t\ge0\).

## Homogeneous and forced heat bounds

There is a constant \(A\ge1\), depending only on the fixed norms
and dimension, such that
\[
 \begin{aligned}
 \|S(\cdot)f\|_X&\le A\|f\|_E,\\
 \left\|\int_0^t S(t-s)G(s)\,ds\right\|_X
   &\le A\|G\|_{L^1([0,\infty);E)} .
 \end{aligned}
 \tag{5}
\]
For the first line combine the contraction with [E21][heat]:
\(\int\|\nabla S(t)f\|_\infty dt\le A_\nabla\|f\|_E\) and
\((\int\|S(t)f\|_\infty^2dt)^{1/2}\le A_2\|f\|_E\).
These were derived there for smooth compact data. For general data,
the fixed-time rearrangement kernels used in E21 give the bounds
\[
 \|S(t)f\|_\infty\le C t^{-1/2}\|f\|_E,\qquad
 \|\nabla S(t)f\|_\infty\le C t^{-1}\|f\|_E \quad(t>0).
\]
Indeed the suprema over \(s>0\) of \(s^{3/4} H_t^*(s)\) and
\(s^{3/4} J_t^*(s)\), with the Gaussian derivative majorant \(J_t\)
from E21, have orders \(t^{-1/2}\) and \(t^{-1}\) by the substitution
\(s^{1/2}/t\). These estimates ensure absolute convolution at each
fixed positive time and uniform spatial convergence of the
convolutions and their gradients from smooth dense data. The
gradient limit is the spatial weak derivative by testing against a
compactly supported smooth function. Fatou in time now extends
both E21 integrals. All constants are uniform in \(K\) because the
damping was bounded by one.

In (2), \(X\) consists of bounded continuous \(E\)-valued functions of
time, using jointly measurable representatives for \(U\) and its
spatial weak gradient in the two mixed norms. These use the essential
spatial supremum at almost every time and the stated time integrals.
They do not require a strongly measurable map into the nonseparable
space \(L^\infty_x\). In particular \(U(t)\in W^{1,\infty}_x\) at almost
every time, with the declared gradient. This \(X\) is complete.
For a Cauchy sequence the \(C_b([0,\infty);E)\) limit exists by
completeness of \(E\). Take a subsequence with summable consecutive
differences in (2). The sums of their spatial supremum differences
are finite for almost every time for both the fields and their
gradients, by the \(L^2_t\) triangle inequality for the former and
Tonelli for the latter. This yields the two mixed-norm limits, with
jointly measurable representatives by almost-everywhere limits.
Their tails tend to zero in the respective mixed norms. The field
limit agrees locally in \(L^1_x\) with the \(E\)-valued limit at almost
every time. Testing spatial derivatives at those times identifies
the gradient limit as its weak derivative. The original Cauchy
sequence thus converges in \(X\).

For the second line of (5), first take \(G\) simple in time with
smooth compactly supported spatial values. The \(E\) component
is bounded by \(\int\|G(s)\|_E ds\) by contraction. The gradient
component is bounded by
\[
 \begin{aligned}
 \int_0^\infty\int_0^t\|\nabla S(t-s)G(s)\|_\infty\,ds\,dt
 &=\int_0^\infty\int_0^\infty
               \|\nabla S(\tau)G(s)\|_\infty\,d\tau\,ds\\
 &\le A_\nabla\int_0^\infty\|G(s)\|_E\,ds .
 \end{aligned}
\]
For the \(L^2_t\) supremum component, use the spatial triangle inequality
followed by Minkowski in time:
\[
 \left\|\int_0^t\|S(t-s)G(s)\|_\infty\,ds\right\|_{L^2_t}
 \le \int_0^\infty
 \left(\int_s^\infty\|S(t-s)G(s)\|_\infty^2\,dt\right)^{1/2}ds
 \le A_2\int_0^\infty\|G(s)\|_E\,ds .
\]
The scalar Minkowski step here also follows by expanding the square
with Tonelli and applying Cauchy–Schwarz in \(t\) to each pair of
time translates. The spatial gradient and the integration commute
for the simple smooth data, where one can put the derivative on
the smooth data near \(s=t\). General \(G\) follows by density in
\(L^1_t E\) and completeness of \(X\). Its \(E\)-valued Duhamel
integral \(DG(t)\) is defined by the same simple approximation and
the contraction, so the limit agrees with that integral at every
time. It is continuous in \(E\) by strong continuity of \(S\) and
dominated convergence in the integral over \(s\). Also
\(\|DG(t)\|_E\le\int_0^t\|G(s)\|_E ds\to0\) at the initial time.
One common constant for both bounds is \(A=1+A_\nabla+A_2\).

## Nonlinear bounds, initial trace and uniqueness

For \(U\in X\), monotonicity of the Lorentz norm gives for almost
every time
\[
 \begin{aligned}
 \|B(U,\nabla U)\|_E&\le b\|U\|_E\|\nabla U\|_\infty,\\
 \|C(U,U,U)\|_E&\le c\|U\|_E\|U\|_\infty^2 .
 \end{aligned}
 \tag{6}
\]
These sources are jointly measurable using the representatives just
specified. As maps into \(E\) they are strongly measurable. Indeed
their distance to each member of a countable dense subset of \(E\)
is measurable by the distribution formula (3) for the norm and
Tonelli. Measurably choosing centers of successively smaller
countable covering balls gives approximation by countably valued
maps, which can then be truncated to simple maps on finite time
sets. This justifies the \(E\)-valued time integration. Integrating
(6) gives, with \(P(U)=B(U,\nabla U)+C(U,U,U)\),
\[
 \|P(U)\|_{L^1_t E}\le b\|U\|_X^2+c\|U\|_X^3 .
 \tag{7}
\]

For two elements \(U,V\), write \(W=U-V\). The bilinear difference
is \(B(W,\nabla U)+B(V,\nabla W)\). Integrating (6) for these two
terms bounds it by
\(b(\|U\|_X+\|V\|_X)\|W\|_X\). The cubic difference telescopes into
\(C(W,U,U)+C(V,W,U)+C(V,V,W)\). Put the \(W\) factor in \(E\) and
the other two factors in \(L^\infty_x\). Hölder in time for the
two latter factors gives
\[
 \|P(U)-P(V)\|_{L^1_t E}
 \le \left[b(\|U\|_X+\|V\|_X)
   +c(\|U\|_X^2+\|U\|_X\|V\|_X+\|V\|_X^2)\right]\|W\|_X .
 \tag{8}
\]
No symmetry or sign is required of the multilinear maps.

Define the mild map
\(\Phi(U)=S(\cdot)U_0+D(P(U))\). Let
\[
 r_*=\min\{1,[8A(1+b+c)]^{-1}\},\qquad N\le r_*/(2A).
\]
If \(N>0\), set \(R=2AN\le r_*\). On the closed \(X\)-ball
of radius \(R\), (5) and (7) give
\(\|\Phi(U)\|_X\le R/2+A(b+c)R^2\le5R/8\).
By (5) and (8), the Lipschitz constant is at most
\(A(2bR+3cR^2)\le3/8\). Iterating from zero gives geometric
successive differences and a limit in this complete ball.
Continuity of the map identifies the limit as a fixed point.
The same Lipschitz bound on the radius-\(r_*\) ball gives uniqueness
among mild solutions in that whole small \(X\) ball. A mild solution
with only the stated mixed norms has a continuous \(E\)-valued
representative from its Duhamel identity, so it is also covered. If \(N=0\),
zero is the solution and the same difference estimate gives
uniqueness there. The map acts on the full half-line.
Strong continuity of the homogeneous term and the bound on \(DG(t)\)
give \(U(t)\to U_0\) in \(E\) as \(t\downarrow0\).

This solution has \(\|U\|_X\le2AN\) and in particular
\[
 \int_0^\infty\sup_x\bigl(|\nabla U(t,x)|+|U(t,x)|^2\bigr)\,dt
 \le 2AN+4A^2N^2 ,
\]
with essential suprema understood. This bounds the analogue of the
[E14 temporal quantity][temporal] inside the fixed flat model.

## Scope of the model

Equation (1) uses fixed Gaussian propagation and only the first-order
bilinear term and the algebraic cubic term as source terms. Fine's
strain equation contains the variable principal term
\((\mathscr L_Q-4I)\Delta_A T\), with two spatial derivatives of \(T\).
The \(X\) estimates here give no bound for that term in \(L^1_t E\),
even if the multiplying coefficient is small pointwise. The evolving
metric, evolving connection, and the strain–curvature constraints
also change the principal evolution and its spatial norms.
Incorporating those features would require separate estimates for
the actual coupled operator. This contraction is a global mild
result for (1) alone.

[request]: ../research-progress/handoffs/SP4-CME-E23_REQUEST_v1.md
[return]: ../research-progress/handoffs/SP4-CME-E23_RETURN_v1.md
[decision]: ../brainstorm/notes/B19_ENDPOINT_TRANSFER_DECISION_20261122.md
[heat]: 21_LORENTZ_HEAT_BENCHMARK_20261122.md
[temporal]: 16_TEMPORAL_STRAIN_CRITERION_20261122.md
