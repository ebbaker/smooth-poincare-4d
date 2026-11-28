# Fixed zeros and compatible first jets · SP4-TWA-E03

28 November 2026, America/New_York. Prepared for Edward B. Baker III with
OpenAI Codex assistance. The [frozen request v1](../research-progress/handoffs/E03_REQUEST_v1.md)
records the author-selected GPT-6.2 Astra/ultra lead and individually
configured GPT-6.2 Sol/ultra helper. Actual backend serving variant and
reasoning effort were unavailable. HEAD was
`280376dd7a1820fa2878d0ab0ee2e639facb2eeb`, and all eight frozen working-tree
digests matched at input inspection. The estimates below are for smooth
families on a fixed Riemannian spin background.

## Uniform bounds at the zero

Let \(B\) be a compact oriented Riemannian spin four-ball with smooth
boundary and fixed smooth metric \(g\). Let \(\psi_t\) be a jointly
smooth family of commuting sections of \(S_g^+\), positive chirality in
the overview's convention, with parameter \(t\) in a compact interval.
Assume \(Z(\psi_t)=\{p\}\) for one fixed interior point \(p\) and
\((\nabla_X^g\psi_t)(p)=X\cdot a\) for the same nonzero
\(a\in S_{g,p}^-\) at each \(t\). Use the real part of the Hermitian
pairing, denoted \((\,,\,)\), and pointwise norms induced by \(g\).

In an orthonormal frame at \(p\), Clifford multiplication gives
\(D_g\psi_t(p)=-4a\) and hence \(q_t(p)=0\) for \(q_t=P_g\psi_t\).
This uses \((P_g\psi)(X)=\nabla_X^g\psi+\tfrac14X\cdot D_g\psi\),
in accord with Friedrich's §1 equation (1.1) at \(n=4\).
[Friedrich, digitized published p. 59](https://dml.cz/bitstream/handle/10338.dmlcz/701462/WSGP_09-1989-1_7.pdf#page=2)

Use normal coordinates centered at \(p\), a smooth unitary spin frame
on a small ball and \(r=d_g(p,x)\). Since the field vanishes at \(p\),
the connection term there is zero and its coordinate linear term is the
Clifford jet. That term has norm \(|a|r\). Taylor's estimate and the
compact parameter interval give constants \(0<c<C\) and a radius
\(r_0>0\) such that, uniformly for \(0<r<r_0\),

\[
c r\le \sigma_t:=|\psi_t|\le C r,\qquad
\nabla^g\psi_t=O(1),\qquad q_t=O(r),\qquad \nabla^g q_t=O(1).
\]

The tangent spinor \(\eta_t=\partial_t\psi_t\) vanishes to second order
because both the value and the first jet of the family at \(p\) are
constant in \(t\). Thus \(\eta_t=O(r^2)\), \(\nabla^g\eta_t=O(r)\) and
\(P_g\eta_t=O(r)\), again uniformly in \(t\). On the complement of the
small ball, \(\sigma_t\) has a uniform positive minimum by compactness
and the hypothesis on the zero set. These are local estimates on
supplied families. [Antecedent on compatible jets](../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E07_20261124.md)

## Differentiation and excision

For \(x\ne p\) set
\(\mathscr L_t=\sigma_t^{-4}|q_t|^4\),
\(W_t=\sigma_t^{-4}|q_t|^2q_t\) and
\(F_t=\sigma_t^{-6}|q_t|^4\psi_t\). The coefficient \(\mathscr L_t\) of the
action density is \(O(1)\). Since \(g\) is fixed, the time derivative
of \(\mathscr L_t\,dV_g\) is \((\partial_t\mathscr L_t)\,dV_g\), with

\[
\partial_t\mathscr L_t=4(W_t,P_g\eta_t)-4(F_t,\eta_t).
\]

The first pairing is \(O(1)\) because \(W_t=O(r^{-1})\). The second is
\(O(r)\) because \(F_t=O(r^{-1})\). The differentiated density therefore
has a uniform integrable bound. The same bound applied to difference
quotients by the fundamental theorem of calculus justifies
differentiation under the integral by dominated convergence. The
resulting derivative is continuous by the same domination, with
one-sided derivatives at the ends of the interval when needed.

The covariant derivative of the inverse norm factor satisfies
\(\nabla^g(\sigma_t^{-4})=O(r^{-5})\), as seen by differentiating
\((\psi_t,\psi_t)^{-2}\). The tensor \(|q_t|^2q_t\) is \(O(r^3)\) and
its covariant derivative is \(O(r^2)\). Consequently
\(\nabla^gW_t=O(r^{-2})\), and \(P_g^*W_t=-\operatorname{tr}_g\nabla^gW_t
=O(r^{-2})\) since \(W_t\) is Clifford-trace-free. In particular
\((P_g^*W_t,\eta_t)=O(1)\), with integral over a radius-\(\epsilon\)
ball bounded in absolute value by \(O(\epsilon^4)\). The corresponding
bound for \((F_t,\eta_t)\) is \(O(\epsilon^5)\). All bounds are uniform
in the stated parameter family. [E01 first variation](E01_VARIATION.md)

Apply the divergence calculation of E01 to
\(B\setminus B_\epsilon(p)\), where \(B_\epsilon(p)\) is the open geodesic
ball. The outward unit normal of the excised domain along the inner
geodesic sphere is \(-\partial_r\). Its signed contribution is

\[
-4\int_{\partial B_\epsilon(p)}(W_t(\partial_r),\eta_t)\,dA_g.
\]

The surface area is \(O(\epsilon^3)\), and the pairing is
\(O(\epsilon^{-1}\epsilon^2)=O(\epsilon)\), so the signed contribution
is \(O(\epsilon^4)\) in absolute value. Passing to the limit using the
bulk bounds gives, with \(\nu_B\) the outward unit normal of the original ball,

\[
\frac{d}{dt}S_g(\psi_t)=4\int_{B\setminus\{p\}}
 (P_g^*W_t-F_t,\eta_t)\,dV_g
 +4\int_{\partial B}(W_t(\nu_B),\eta_t)\,dA_g.
\]

The outer boundary term vanishes for variations with fixed trace.

## One incompatible transverse first jet

In the same tangent and spin frames at \(p\), use the derivative
\(A(e_1)=2e_1\cdot a\) and \(A(e_i)=e_i\cdot a\) for \(i=2,3,4\).
It is invertible over the reals because \(X\mapsto X\cdot a\) is a scaled
isometry between real four-dimensional spaces, and the diagonal
stretching has entries \((2,1,1,1)\). In the local spin trivialization the
section with this linear coordinate representative has exactly the
prescribed jet and vanishes only at \(p\). Its Dirac value at \(p\) is
\(-5a\), and the \(e_1\)-component of its twistor derivative is
\(\tfrac34e_1\cdot a\ne0\).
Continuity gives upper and strictly positive lower bounds for \(|P_g\psi|\)
on a small ball. Transversality gives \(|\psi|\asymp r\), so the action
density coefficient is comparable to \(r^{-4}\). The smooth
four-dimensional volume in normal coordinates has radial factor
comparable to \(r^3dr\,d\omega\), which gives logarithmic divergence.

## Localization and evidence

On any smooth compact oriented Riemannian spin four-manifold with or
without smooth boundary, the same calculation applies to a jointly
smooth compact parameter family with the same finite set of zeros in
the interior and a fixed nonzero compatible first jet at each zero.
Choose disjoint small normal balls with the above bounds and use the
uniform positive minimum norm on their compact complement. The sum of
the inner fluxes tends to zero and the first-variation formula retains
only the original boundary term. This proof concerns the stated
fixed-zero, fixed-jet family.

Checked the [E01 derivation](E01_VARIATION.md), the fixed-jet and
transverse-zero computations in [DIR-E06](../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E06_20261124.md)
and [DIR-E07](../../../../investigations-1/03_first_order_twistor/02_dirac_and_twistor_spinors/notes/DIR_E07_20261124.md),
and Friedrich's primary §1 equation (1.1) again on 28 November 2026.
The domination and shrinking-sphere estimates are derived here.
[Primary source](https://dml.cz/handle/10338.dmlcz/701462)
