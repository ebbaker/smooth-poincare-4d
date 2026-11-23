# SP4-CME-E28 reverse equation and smooth gauge correspondence

22 November 2026 (America/New_York). Prepared for Edward B. Baker III
with OpenAI Codex assistance. Helper launch configured
`gpt-6.2-sol` / `ultra`. Independent runtime introspection and selected
lead settings were unavailable. This is the fixed
[E28 request](../research-progress/handoffs/SP4-CME-E28_REQUEST_v1.md)
under the [B24 decision](../brainstorm/notes/B24_LOCAL_GAUGE_CLOSURE_20261122.md).
Input versions are in the [return](../research-progress/handoffs/SP4-CME-E28_RETURN_v1.md).

The corrected reverse automorphism equation is quasilinear of spatial
order two. Its identity, initial-time principal symbol is strictly
negative in the native reference pairing. The algebraic correspondence
holds for supplied smooth solutions and the forward recovery is an
ordinary vector flow on the compact frame bundle.

## Fixed generator and local automorphism variables

Work on a smooth closed oriented real four-manifold \(M\) and a
fixed oriented Euclidean rank-three bundle \(E\) with principal
\(SO(3)\) frame bundle \(P\). Use smooth connections in the positive
definite curvature-plane region and the round-compatible sign.
All equations and adjoints here use Fine's native time and
internal pairing, with native reconstructed metric \(g_A\)
whose volume is the curvature volume \(\mu_{\rm F}\). Fix a
smooth definite \(\bar A\) with \(\bar g=g_{\bar A}\).
As in E27, \(\mathsf S_A(u)=\iota_uF_A\) is the curvature
contraction and \(\chi_A(u)\) is the \(A\)-horizontal lift to
the frame bundle. For \(a=A-\bar A\), use
\[
 \xi_{\rm fixed}(A)=-d_A^{*\bar g}a
      -\chi_A\bigl(\mathsf S_A^*d_A^{*g_A}d_Aa\bigr).
 \tag{1}
\]
Only the vertical adjoint uses the fixed metric.
The exterior covariant derivatives everywhere still use \(A\).
Fine's infinitesimal action is
\(R(\phi+\chi_A(u),A)=-d_A\phi-\mathsf S_A(u)\).
Use the left action \(h(A)=(h^{-1})^*A\), consistent with that
infinitesimal sign, and the group composition convention \(gh=g\circ h\).
[E27 fixed adjoint](27_FIXED_ADJOINT_GAUGE_TEST_20261122.md)
and [Fine v2, Section 3.2, equations (3.4), (4.2) and (4.4)](https://arxiv.org/html/1111.5005v2).

For any supplied smooth definite path \(A(t)\) with \(A(0)=\bar A\),
write \(\hat A=h(A)\) and \(\hat a=\hat A-\bar A\).
In a local smooth trivialization let a nearby bundle automorphism
be \(h(x,r)=(f(x),k(x)r)\), \(r\in SO(3)\), with \(f\) a base
diffeomorphism and \(k\) an \(SO(3)\)-valued function. Transformed
coefficients at \(y=f(x)\) satisfy
\[
 f^*\hat A=\operatorname{Ad}_k A-(dk)k^{-1},\qquad
 f^*F_{\hat A}=\operatorname{Ad}_k F_A,\qquad
 f^*g_{\hat A}=g_A .
 \tag{2}
\]
The first equation follows by pulling back the connection on
the frame bundle and then applying the local section \((x,1)\).
The second follows from curvature covariance. The third uses
naturality of the curvature plane and curvature volume.
Evaluated at \(f(x)\), coefficients of the hatted tensors
therefore depend smoothly on \(f,k,Df,Dk\) and the given path,
using \((Df)^{-1}\) for target covariant slots. This also holds
for the fixed reference tensors evaluated at \(f(x)\).

Near the identity one may parametrize such automorphisms globally
by a section of \(TM\oplus\operatorname{ad}E\): use
\(f(x)=\exp_x^{\bar g}u(x)\) for the base map, and identify
the fibers above \(x,f(x)\) by \(\bar A\)-parallel transport
along this short geodesic before applying the small internal
rotation. This chart and its pointwise inverse in the value
variables are smooth near zero. A sufficiently small \(C^1\)
neighborhood gives invertible \(Df\) and base diffeomorphisms.
In particular a local diffeomorphism in that neighborhood
is homotopic to the identity and has one-sheeted covering
on each compact connected component. Its chart velocity
is related to the local \(\dot f,\dot k\) by smooth pointwise
multipliers. The differential at zero identifies the two
section variables with \(\phi+\chi_{\bar A}(u)\).

## Exact order and reference symbol of the reverse equation

For group right translation \(r\) the prescribed equation is
\[
 r(h^{-1})_*\dot h=-\xi_{\rm fixed}(\hat A),\qquad h(0)=\mathrm{id}.
 \tag{3}
\]
Define the target base field
\(z=\mathsf S_{\hat A}^*d_{\hat A}^{*g_{\hat A}}d_{\hat A}\hat a\)
and the vertical coefficient \(\psi=d_{\hat A}^{*\bar g}\hat a\).
The right-translated velocity is \(\dot h\circ h^{-1}\).
In the above trivialization \(\chi_{\hat A}(z)\) has group
matrix component \(-\hat A(z)r\), whereas \(\psi\) has
component \(\psi r\). Thus (3) is locally equivalent to
\(\dot f=z\circ f\) and
\(\dot k=(\psi-\hat A(z))\circ f\, k\).
The target derivative of any component field \(U\) evaluated
at \(y=f(x)\) is
\((\partial_{y^i}U)\circ f=((Df)^{-1})^\alpha{}_i
\,\partial_{x^\alpha}(U\circ f)\).
Using instead a left-trivialized velocity multiplies by
\((Dh)^{-1}\) at the corresponding point. That multiplier is
smooth on the invertible first jets, and introduces no new
spatial differentiations.

The identity
\[
 \beta:=d_{\hat A}\hat a
    =F_{\hat A}-F_{\bar A}+\tfrac12[\hat a\wedge\hat a]
 \tag{4}
\]
follows by expanding the curvature around \(\bar A\).
By (2), \(\hat a\), \(\beta\), and \(g_{\hat A}\), after
composition with \(f\), are smooth first-jet expressions
in \(h\). The vertical fixed-metric codifferential differentiates
\(\hat a\) once. The horizontal live codifferential differentiates
\(\beta\) and the metric coefficients once. In each codifferential
the derivative of the form and the metric derivative times the
form enter additively. Each therefore contributes affinely in
second spatial derivatives of the automorphism variables. The
remaining factors \(\mathsf S_{\hat A}^*\), the horizontal lift,
the chain-rule inverses and the chart time conversion are
algebraic in first jets or values. Thus the reverse equation
in a smooth section chart is quasilinear second order with
smooth coefficients in the first jets on the invertible chart
region, including smooth prescribed \(t,x\) data from \(A(t)\).
Equation (4) is what removes the extra derivative in the
horizontal term. [Fine v2, Section 4.2, reverse equation (4.8)](https://arxiv.org/html/1111.5005v2).

At \(t=0,\ h=\mathrm{id}\), one has
\(\hat A=\bar A,\ \hat a=d_{\bar A}\hat a=0\).
In direction \(\eta=\phi+\chi_{\bar A}(u)\),
\(\delta\hat a=-d_{\bar A}\phi-\mathsf S_{\bar A}u\).
Variations of the gauge operator coefficients multiply zero,
and the two metrics coincide at this reference. Put
\(\mathsf S=\mathsf S_{\bar A}\), \(d=d_{\bar A}\), and
\(d^*=d_{\bar A}^{*\bar g}\) in the next formula. The
linearized right side of (3) is
\[
 -d^*(d\phi+\mathsf S u)
 -\chi_{\bar A}\mathsf S^*d^*d(d\phi+\mathsf S u).
 \tag{5}
\]
The right-trivialization and time-chart differentials at this
point give the stated reference splitting, since the reference
velocity is zero. The mixed term \(d^*\mathsf S u\) in the
vertical equation is first order in \(u\). In the horizontal
equation \(d^*d^2\phi=d^*[F_{\bar A},\phi]\) is first order
in \(\phi\). The remaining displayed terms have order two.

Let \(w_\zeta^j\) denote exterior multiplication by the real
covector \(\zeta\) from degree \(j\) to \(j+1\).
With \(\partial\mapsto i\zeta\) the full second-order
symbol on \(\operatorname{ad}E\oplus TM\) is
\[
 \boxed{\qquad
 \begin{pmatrix}
   -|\zeta|_{\bar g}^2 I & 0\\
   0 & -\mathsf S^*(w_\zeta^1)^*w_\zeta^1\mathsf S
 \end{pmatrix}. \qquad}
 \tag{6}
\]
The horizontal block retains the transverse projection because
\((w_\zeta^1)^*w_\zeta^1=|\zeta|^2 I-w_\zeta^0(w_\zeta^0)^*\)
on one-forms. If \(w_\zeta^1\mathsf S u=0\), then
\(\mathsf S u\) is in the image of \(w_\zeta^0\). The exact-sequence
injection \(\mathsf S+w_\zeta^0\) forces \(u=0\).
Thus the horizontal form \(-|w_\zeta^1\mathsf S u|^2\) is
strictly negative on nonzero \(u\) for \(\zeta\ne0\).
The vertical block has the same sign. The minimum of
\(|w_\zeta^1\mathsf S u|^2\) over \(x\in M\),
\(|\zeta|_{\bar g}=|u|_{\bar g}=1\), is positive by compactness
and the strict pointwise inequality. The smaller of this
minimum and one is a uniform coercivity constant in the
direct sum reference norm. Smooth dependence of the second-order
coefficients then gives a uniform symbol estimate in a small
\(C^1\) chart neighborhood for short time, since \(A(t)\)
is a supplied smooth path starting at \(\bar A\). This is
a coefficient and symbol statement. The local PDE
solvability input is handled in E29.
[E26 exact-sequence check](26_FINE_GAUGE_ENDPOINT_GAP_20261122.md)
and [Fine v2, Lemmas 3.5 and 4.9](https://arxiv.org/html/1111.5005v2).

## Correspondence for supplied smooth solutions

The physical gradient \(v\) is equivariant under \(\mathcal G\)
because its curvature, metric and adjoint are natural. For a
smooth group path \(g\), the derivative of the transformed
connection is
\[
 \partial_t(g(A))
  =g_*\dot A+R\!\left(r(g^{-1})_*\dot g,g(A)\right),
 \qquad
 g_*R(\eta,A)=R(\operatorname{Ad}_g\eta,g(A)).
 \tag{7}
\]
These identities use the left action convention above.
Equation (3) and (7) send a supplied unadjusted solution
\(A_t=v(A)\) to the corrected adjusted solution
\(\hat A_t=v(\hat A)-R(\xi_{\rm fixed}(\hat A),\hat A)\).
All evaluations of the generator keep \(\bar A,\bar g\)
fixed.

Conversely for a supplied smooth adjusted solution \(\hat A\),
the forward recovery \(g(0)=\mathrm{id}\) is given by
\[
 \ell(g^{-1})_*\dot g=\xi_{\rm fixed}(\hat A).
 \tag{8}
\]
For \(j=g^{-1}\), differentiation of \(g\circ j=\mathrm{id}\)
gives \(\dot j=-\xi_{\rm fixed}(\hat A)\circ j\), an ordinary
smooth time-dependent vector field equation on \(P\).
The frame bundle is compact because the base and \(SO(3)\)
are compact. Ordinary vector-flow existence and uniqueness
therefore give \(j\), and hence \(g\), on a sufficiently
short interval of the smooth prescribed path. The vector
field is \(SO(3)\)-invariant, so uniqueness makes the flow
equivariant and ensures it is a bundle automorphism.
Equation (8) gives
\(r(g^{-1})_*\dot g=\operatorname{Ad}_g\xi_{\rm fixed}(\hat A)\).
This cancels the adjusted gauge term after applying (7).
Thus \(g(\hat A)\) solves the unadjusted equation.

For \(\hat A=h(A)\) coming from a supplied reverse solution,
recover \(g\) by (8) along that same \(\hat A\).
With \(\xi=\xi_{\rm fixed}(\hat A)\),
\[
 \dot{(gh)}
  =r(h)_*\ell(g)_*\xi+\ell(g)_*r(h)_*(-\xi)=0 .
\]
Left and right translations commute. The identity initial
values give \(gh=\mathrm{id}\). Starting from an adjusted
solution and its forward recovery, \(h=g^{-1}\) satisfies
(3) and returns the original adjusted solution. For two
smooth unadjusted solutions with the same initial \(\bar A\),
if both reverse equations have supplied smooth solutions
and the corrected adjusted initial-value problem is unique,
the two adjusted connections agree. The forward recovery ODE
is unique along that common adjusted solution, so the two
unadjusted solutions agree on the common short interval.
Only the physical vector field needs equivariance in this
calculation. The fixed-reference generator is always evaluated
on the same adjusted connection.
[Fine v2, Lemma 4.4 and equations (4.3)–(4.4)](https://arxiv.org/html/1111.5005v2).

These statements concern the supplied smooth paths and the
reference symbol for the corrected local equation. The
smooth PDE existence input is separate. The continuous
endpoint regularity and continuation gaps of E26 remain.
