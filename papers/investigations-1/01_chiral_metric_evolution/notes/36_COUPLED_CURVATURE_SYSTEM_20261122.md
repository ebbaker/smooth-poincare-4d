# SP4-CME-E36 — coupled connection and curvature with smooth constraint propagation

22 November 2026 (America/New_York). Prepared for Edward B. Baker III with
OpenAI Codex assistance. Helper launch configured `gpt-6.2-sol` / `ultra`.
Actual backend model and effort were not independently exposed. Selected
lead settings unavailable. This is the finite analytical check in the
[E36 request][request] under [B29][decision]. Frozen versions are in the
[return][return].

## Setting and proposed extension

Let \(M\) be a smooth compact closed oriented real four-manifold and
\(\bar A\) a fixed smooth definite connection on an oriented Euclidean
rank-three SO(3) bundle. Use Fine's native time and internal positive
metric from the negative Killing form. If \(F\) is a definite two-form
in the round-compatible positive component, let \(g(F)\) have
\(\Lambda^+_{g(F)}=\operatorname{span}\{F_i\}\) and
\(dV_{g(F)}=\frac13\sum_iF_i\wedge F_i\) in a native orthonormal frame.
The ordinary form norms count each increasing multi-index once.
All stars and live adjoints use \(g(F)\), even when \(F\) is independent
of \(A\). These are the conventions of [E34][e34].
[Fine v2, Definition 1.4 and Proposition 4.2][fine].

Write \(\bar F=F_{\bar A}\), \(\bar g=g(\bar F)\), and let the
unknowns be a connection \(A\) and an independent definite two-form
\(F\). Set
\[
 \begin{gathered}
 g=g(F),\qquad B(F)=4Q(F)-\tfrac23\operatorname{tr}(Q(F)^2)I,
 \qquad S_F(u)=\iota_uF,\\
 a=A-\bar A,\quad \beta=F-\bar F+\tfrac12[a\wedge a],
 \quad C=F-F_A,\quad \phi=d_A^{*\bar g}a .
 \end{gathered}
\]
The proposed extension, with fixed \(\lambda>0\), is
\[
 \begin{aligned}
 W&=*_{g}\bigl((d_A B(F))\wedge F\bigr)
              -S_F S_F^*d_A^{*g}\beta,\\
 A_t&=W-d_A\phi+d_A^{*g}C,\\
 F_t&=d_A W-[F,\phi]-\lambda d_A^{*g}d_A F .
 \end{aligned}
 \tag{1}
\]
The appearance of \(B(F)\) in an adjoint-valued form means action on
the internal factor. Its derivative uses the connection on internal
endomorphisms.

For arbitrary definite \(F\), \(B(F)F\) is self-dual in \(g(F)\) by the
definition of the metric. The physical term in \(W\) is the specified
extension of the Bianchi-reduced expression. In fact, in dimension
four the adjoint formula on two-forms gives
\[
 *_{g}\bigl((d_A B(F))\wedge F\bigr)
   =-d_A^{*g}(B(F)F)-*_{g}\bigl(B(F)d_AF\bigr).
 \tag{2}
\]
Thus the chosen extension is equal to the physical gradient when
\(d_A F=0\). The difference in (2) matters if \(F\) is independent.
At the reference we linearize the term actually written in (1).

## Exact order and coefficient inventory

Use fixed smooth coordinates and a local orthonormal trivialization of
the internal bundle. The coefficients \(g,g^{-1},*_{g},Q,B,S_F,S_F^*\)
are smooth pointwise functions of \((x,F)\) in the definite region.
The metric derivative is of the form
\(\partial_i g=(\partial_{x^i}g)(x,F)+D_F g[\partial_i F]\).
The explicit \(x\) derivative holds \(F\) fixed. Consequently
\(\Gamma(g)\) is affine in \(\partial F\) with
coefficients depending only on values. There is no derivative of
\(A\) in \(g\), since \(F\) is an independent variable here.

The first term of \(W\) is affine in \(\partial F\) with value
coefficients, and its connection commutator in \(d_A B(F)\) is
zeroth order. The second term of \(W\) applies one live codifferential
to the algebraic \(\beta\). In coordinates its derivatives come
from \(\partial_i\beta\), linear in the first jets of \(A,F\) and in
fixed background derivatives, and from the Christoffel terms
\(\Gamma(g)\beta\), affine in \(\partial F\) with \(\beta\) a
value. The other terms of the codifferential use the connection
coefficient without differentiating it. The multiplier \(S_FS_F^*\)
is pointwise. Hence \(W\) is affine in the first jets of the
independent pair, and its first-jet coefficients are smooth functions
of \(x,a,F,\bar F\). In particular
\(\beta_{ij}=F_{ij}-\bar F_{ij}+[a_i,a_j]\).
For example, differentiating \([a_i,a_j]\) in \(\beta\) gives the
two products \([\partial_\ell a_i,a_j]\) and
\([a_i,\partial_\ell a_j]\). These use \(a\) as a value coefficient.

The other terms of (1) admit the following exhaustive order check.

- The fixed-metric \(\phi=d_A^{*\bar g}a\) is affine in \(\partial A\).
  The term \(-d_A\phi\) is affine in \(\partial^2 A\) with fixed
  principal coefficient from \(\bar g\). Its fixed coordinate
  derivatives and the derivative of the zeroth-order connection
  action enter at lower order. The term \(-[F,\phi]\) has only
  first jets.
- In \(d_A^{*g}C\), \(C\) is affine in \(\partial A\), with
  \(F_A=dA+[A\wedge A]/2\). The derivative \(\partial C\) gives
  \(\partial F\) at first order, \(\partial^2 A\) linearly and
  products of \(A\) with \(\partial A\). The metric derivative
  in the codifferential occurs as \(\Gamma(g)C\). This is a
  product of at most one \(\partial F\) and one \(\partial A\);
  it contains no second derivatives.
- The outer \(d_A W\) differentiates the affine first-jet
  expression \(W\) once. A derivative of \(\partial A\) or
  \(\partial F\) gives a second jet with its undifferentiated
  coefficient. A derivative of that coefficient gives at most
  a first jet, multiplying the original first jet. This covers,
  in particular, the derivatives of \(*_g,S_FS_F^*\), and of
  the coefficient of \(\partial F\) in \(\Gamma(g)\beta\).
  Equivalently \(\partial^2 g=D_F g[\partial^2 F]\) plus terms
  through quadratic degree in first jets and fixed derivatives.
  Thus the potential second metric derivative still contributes
  linearly in the second jet with a value coefficient.
- In \(d_A^{*g}d_A F\), \(d_A F=dF+[A\wedge F]\) is affine in
  \(\partial F\). The derivative of this expression introduces
  \(\partial^2 F\) linearly and \(\partial A\) at lower order.
  The live Christoffel coefficients multiply \(d_A F\), again
  yielding at most quadratic first jets. The operation contains
  no second derivative of \(A\).

The system is therefore genuinely second order and quasilinear:
in fixed coordinates it is affine in \(\partial^2(A,F)\),
with smooth principal coefficients depending only on values.
One can take those principal variables to be \(x,a,F,\bar F\)
with \(\bar g=g(\bar F)\). This statement includes the derivative
order of all live-metric terms. Lower-order coefficients may
use fixed derivatives of the reference and coordinate data,
and the lower-order terms may be quadratic in variable first
jets. No bound for these lower-order terms follows from the
principal coefficient description alone.
[Comparison with the corrected operator inventory in E30][e30].

## Ordinary principal symbol at the reference

At \((A,F)=(\bar A,\bar F)\) one has \(a=\beta=C=\phi=0\) as fields
and \(d_{\bar A}\bar F=0\). Let \(b,f\) be independent variations of
\(A,F\), respectively. In the Fourier convention of E34 let \(w_j\)
be wedge by a real \(\zeta\ne0\) from degree \(j\) to degree \(j+1\),
so \(d\) has symbol \(i w_j\) and the adjoint has \(-i w_j^*\) on
degree \(j+1\). All pairings and coefficient symbols in this
section are at \(\bar g\). The exact first variations of the
three expressions used below are
\[
 \delta\beta=f,\qquad \delta C=f-d_{\bar A}b,
 \qquad \delta\phi=d_{\bar A}^{*\bar g}b .
\]
There is no contribution from differentiated metric coefficients
acting on a background \(\beta\) or \(C\), since these background
fields vanish identically. The fixed metric in \(\phi\) has no
variation. Changes of the connection inside any of these
operators acting on a zero background input also vanish.

For the \(A\) equation, \(W\) is first order in the independent
pair and so has no second-order symbol. The vertical term gives
\(-w_0w_0^*b\). The added \(d_A^{*g}C\) term gives
\(-w_1^*w_1 b\), since its \(d_{\bar A}^{*}f\) term is only
first order in \(f\). In particular this row has no second-order
cross term with \(f\). The first diagonal block is
\[
 -\bigl(w_1^*w_1+w_0w_0^*\bigr)
     =-|\zeta|_{\bar g}^2 I_{\Lambda^1\otimes E},
 \tag{3}
\]
by the wedge-contraction identity.

For the \(F\) row, \(-[F,\phi]\) has first-order variation in \(b\)
and no second-order symbol. The variation of \(d_A W\) has an
outer operator variation algebraic in \(b\). In the physical
part of \(W\), varying the live star or the final undifferentiated
\(F\) gives a term algebraic in \(f\), with fixed reference
coefficient \(d_{\bar A}B(\bar F)\). Neither is second order
after the outer derivative. Varying \(d_A B(F)\) gives
\(d_{\bar A}(\delta B)+[b,B(\bar F)]\). Only the first term
contributes to the second-order symbol after the outer derivative.
The E34 factorization holds for arbitrary independent two-form
variations \(f\):
\[
 (\delta B)\bar F=P^*P f,\qquad P=\sqrt8\,D_Q L_{\bar A}.
\]
Indeed \(\delta Q=2D_Q L_{\bar A}(f)\),
\(\delta B=4D_Q^*(\delta Q)\), and \(L_{\bar A}^*(H)=H\bar F\)
for symmetric \(H\) in the native pairing.
The two-form \((\delta B)\bar F\) is self-dual in the fixed
reference metric. Since \(d_{\bar A}\bar F=0\),
\(*_{\bar g}((d_{\bar A}\delta B)\wedge\bar F)
=-d_{\bar A}^{*\bar g}((\delta B)\bar F)\).
The physical part of \(d_A W\) therefore gives the second
symbol \(-w_1w_1^*P^*P f\), with no second-order \(b\)-term.
This calculation uses the prescribed extension in (2).

In the horizontal part of \(W\), the variations of \(S_F,S_F^*\)
and of the live adjoint multiply either \(\beta=0\) or its
zero derivative. Thus its first-order variation is
\(-S_{\bar F}S_{\bar F}^*d_{\bar A}^{*\bar g} f\), giving the
curvature symbol \(-w_1 S_{\bar F}S_{\bar F}^*w_1^* f\).
Finally, variation of the live adjoint in the Bianchi term
acts on \(d_{\bar A}\bar F=0\).
The variation of \(d_AF\) is
\(d_{\bar A} f+[b\wedge\bar F]\), whose second term gives
at most first order after taking the adjoint. The Bianchi
contribution to the \(F\) symbol is \(-\lambda w_2^*w_2 f\).

Combining these computations, the ordinary second-order symbol
on the independent pair is block diagonal:
\[
 \sigma_{2,\zeta}
 =-\begin{pmatrix}
      |\zeta|_{\bar g}^2 I_{\Lambda^1\otimes E}&0\\[2pt]
      0&\mathbb B_{\zeta,\lambda}
    \end{pmatrix},\qquad
 \mathbb B_{\zeta,\lambda}
    =w_1w_1^*P^*P+w_1 S_{\bar F}S_{\bar F}^*w_1^*
                          +\lambda w_2^*w_2 .
 \tag{4}
\]
A background need not be a stationary connection for this
reference-symbol calculation. All omitted cross terms have at
most one derivative of the varied amplitude.

## A fixed-pairing parabolic value neighborhood

On \((\Lambda^1\otimes E)\oplus(\Lambda^2\otimes E)\) use the
single reference direct-sum pairing given by \(\bar g\) and the
native internal metric. Choose \(\lambda\) by [E34][e34] for the
compact definite set of reference curvature values. Specifically,
in unit covectors let \(d_0>0\) be the common closed-symbol gap
and \(M_0\) the common bound on its cross block. The choice
\(\lambda\ge M_0^2/(2d_0)+d_0/2\) gives curvature Hermitian
coercivity at least \(d_0|\zeta|_{\bar g}^2/2\).
Together with (3) this gives a reference gap of
\(\min(1,d_0/2)|\zeta|_{\bar g}^2\) for the negative of (4)
in the same direct-sum pairing.

The principal coefficients depend smoothly only on values.
Compactness of the reference unit cosphere and of the unit
amplitude spheres therefore gives uniform strong parabolic
symbol bounds in a sufficiently small \(C^0\) neighborhood of
the reference values of \(A,F\), keeping the **reference**
pairing fixed when testing the inequality. The value neighborhood
can also be chosen in the definite component. On compact
definite reference curvature sets, the constants and neighborhood
can be taken uniform in the value comparisons \(a,F-\bar F\):
the principal dependence is smooth in \(a,F,\bar F\) and
all the corresponding reference metrics are uniformly positive
in fixed charts. Their reference pairings are uniformly
equivalent to fixed comparison norms. Such equivalence compares
norm sizes. It is not a reason to change the quadratic-form
pairing of a nonsymmetric operator without a separate calculation.
No derivative-independent bound for lower-order terms or
regularity assertion enters this value-neighborhood conclusion.

## Exact smooth constraint propagation

For any supplied smooth solution pair of (1),
\(\partial_t F_A=d_A A_t\), independently of the metric.
Subtracting the \(d_A\) derivative of the \(A\) equation
from the \(F\) equation cancels \(d_A W\) exactly. The two
vertical terms combine by \(d_A^2\phi=[F_A,\phi]\). Since
\(d_A F_A=0\) by Bianchi, \(d_A F=d_A C\). Thus the exact equation is
\[
 \boxed{\ C_t=-[C,\phi]-\lambda d_A^{*g}d_A C
                       -d_A d_A^{*g} C .\ }
 \tag{5}
\]
The adjoints here use the same live \(g(F)\) at each fixed time.
No time differentiation of an adjoint is needed for this
subtraction.

For the moving-metric energy set \(E_C(t)=\int_M |C|_g^2\,dV_g\)
and \(H=g^{-1}g_t\). In an instantaneous \(g\)-orthonormal
frame let \(G(C)_{ia}=\sum_j\langle C_{ij},C_{aj}\rangle_E\),
the Gram matrix of the contractions of \(C\). Using fixed
coordinates for \(C_t\), differentiation of the two inverse
metrics in
\(|C|^2=\tfrac12 g^{ia}g^{jb}\langle C_{ij},C_{ab}\rangle_E\)
gives
\(\partial_t|C|^2=2\langle C_t,C\rangle-\langle H,G(C)\rangle\).
The factor \(1/2\) in the norm accounts for both antisymmetric
slots. Also \((dV_g)_t=\tfrac12\operatorname{tr}(H)dV_g\).
The volume is not assumed fixed for an off-constraint pair.

The gauge term in (5) has zero pointwise pairing with \(C\)
by invariance of the internal metric. Integration by parts
in the instantaneous metric, with no boundary, gives exactly
\[
 E_C'=-2\lambda\|d_A C\|_{L^2(g)}^2-2\|d_A^{*g}C\|_{L^2(g)}^2
 +\int_M\left(-\langle H,G(C)\rangle
                    +\tfrac12\operatorname{tr}(H)|C|^2\right)dV_g .
 \tag{6}
\]
The Gram matrix is nonnegative and
\(|G(C)|\le\operatorname{tr}G(C)=2|C|^2\).
Since \(|\operatorname{tr}H|\le2|H|\) in dimension four,
the last integral is at most \(3\|H\|_{L^\infty(g)}E_C\).
On each compact subinterval of the supplied smooth definite
solution this coefficient is bounded. The integrating factor
\(\exp(-3\int_{t_0}^t\|H\|_\infty ds)\) therefore gives
\(E_C(t)=0\) for all subsequent times in the interval whenever
\(C(t_0)=0\). Positivity of the metric and smoothness imply
pointwise \(C=0\). This proves forward persistence of exact
curvature for supplied smooth compatible data and hence also
Bianchi on those compatible solutions.

## Smooth compatible correspondence and limits

For a supplied smooth pair that starts with \(C=0\), equation (5)
and (6) give \(F=F_A\). Then \(g=g_A\) and
\(\beta=d_Aa\) by the identity used in E30. The physical term
of \(W\) is exactly the unadjusted Fine vector field by (2)
and Bianchi. The correction \(d_A^{*g}C\) and the Bianchi completion
vanish. The \(A\) equation is precisely the fixed-vertical-adjoint
adjusted connection equation of [E27][e27], and the \(F\)
equation agrees with its differentiated curvature equation.
Conversely, any supplied smooth solution of that definite
adjusted equation lifts to a solution of (1) by setting
\(F=F_A\). These are equalities and propagation for smooth
supplied solutions. They do not provide a local existence theorem
for rough data, endpoint smoothness, estimates for automorphism
recovery, or an extension of an unadjusted trajectory.

[request]: ../research-progress/handoffs/SP4-CME-E36_REQUEST_v1.md
[return]: ../research-progress/handoffs/SP4-CME-E36_RETURN_v1.md
[decision]: ../brainstorm/notes/B29_COUPLED_CURVATURE_SYSTEM_20261122.md
[e34]: 34_CURVATURE_BIANCHI_SYMBOL_20261122.md
[e27]: 27_FIXED_ADJOINT_GAUGE_TEST_20261122.md
[e30]: 30_CURVATURE_COEFFICIENT_REGION_20261122.md
[fine]: https://arxiv.org/html/1111.5005v2
